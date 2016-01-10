#read data
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data1<-data

#subset data by the wanted dates
data1$Date<-strptime(data1$Date, "%d/%m/%Y")
data2<-subset(data1, Date=="2007-02-01" | Date=="2007-02-02")

#combine data and time and convert phrase to date type
data2$Date_Time<-paste(data2$Date, data2$Time)
data2$Date_Time<-strptime(data2$Date_Time, "%Y-%m-%d %H:%M:%S")

#convert data to numeric 
data2$Global_active_power<-as.numeric(paste(data2$Global_active_power))
data2$Sub_metering_1<-as.numeric(paste(data2$ Sub_metering_1))
data2$Sub_metering_2<-as.numeric(paste(data2$ Sub_metering_2))
data2$Sub_metering_3<-as.numeric(paste(data2$ Sub_metering_3))

#open png graphic device
png(filename = "plot2.png",width = 480, height = 480, units = "px")

#make and annotate histogram
plot(data2$Date_Time, data2$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)", type="n")
lines(data2$Date_Time, data2$Global_active_power)

#close png graphic device
dev.off()
