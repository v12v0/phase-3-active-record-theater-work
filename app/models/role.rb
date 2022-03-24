class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map do |audition|
      audition.actor
    end
  end

  def locations
    self.auditions.map do |audition|
      audition.location
    end
  end

  def lead
    self.auditions.find_by(hired: true) ? self.auditions.find_by(hired: true) : "no actor has been hired for this role"
  end



  def understudy
    find = self.auditions.select{|audition| audition.hired == true}
    find.second ? find.second : "no actor is understudy"
  end




end
