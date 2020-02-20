require 'colorize'

class BabyDragon

  attr_reader :fullness_level, :thirst_level

  def initialize(name, color = "white")
    @name = name
    @is_asleep = false
    # The dragon is not hungry when @fullness_level is 10
    # The dragon is very hungry when @fullness_level is 0
    @fullness_level = 10
    @thirst_level = 10
    @color = color
  end

  def eat
    puts "#{@name.colorize(@color.to_sym)} eats popcorn, cheez-its, seaweed, cheetos, burritos"

    @fullness_level = 10
    passage_of_time
  end

  def drink
    puts "#{@name.colorize(@color.to_sym).colorize(@color.to_sym)} is drinking water"
    @thirst_level = 10

    passage_of_time
  end

  def play
    puts "#{@name.colorize(@color.to_sym)} chills out next to the fireplace and eats a lot of salty snacks"

    passage_of_time
  end

  def takes_a_nap
    puts "#{@name.colorize(@color.to_sym)} curls up and dozes off..."
    
    @is_asleep = true

    3.times do
      passage_of_time
    end
    @is_asleep = false
  end

  def sing
    if @fullness_level >= 5 && @thirst_level >= 5
      puts "la la la ..."
    else
      puts "#{@name} can't sing, they need to eat or drink!"
    end
    passage_of_time * 3
  end

  def passage_of_time
    if (@fullness_level > 0)
      @fullness_level -= 1
    else
      if (@is_asleep)
        @is_asleep = false
        puts "#{@name.colorize(@color.to_sym)} woke up!"
      end
      puts "#{@name.colorize(@color.to_sym)} was super hangry! They ATE YOU! >:("
      exit
    end
  end

end

puff = BabyDragon.new("Puff The Magic Dragon", "red")



until (puff.fullness_level == 0)
  puff.play
  puff.sing
  puff.drink
  puff.takes_a_nap
end

