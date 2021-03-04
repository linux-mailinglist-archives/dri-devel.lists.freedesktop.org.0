Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B1B32D864
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 18:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE12A6EA3E;
	Thu,  4 Mar 2021 17:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 537046EA3E;
 Thu,  4 Mar 2021 17:12:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6110231B;
 Thu,  4 Mar 2021 09:12:38 -0800 (PST)
Received: from [10.57.19.206] (unknown [10.57.19.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 427663F7D7;
 Thu,  4 Mar 2021 09:12:34 -0800 (PST)
Subject: Re: [PATCH] devfreq: Register devfreq as a cooling device
To: Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20210304125034.28404-1-daniel.lezcano@linaro.org>
 <5f06e0c5-b2d9-5e11-01b6-fdd0dac635a7@arm.com>
 <8d153937-c5fc-1de2-d510-d3f91f7a9724@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <71bc8b07-ea0e-17a9-8c7f-d20669e9da12@arm.com>
Date: Thu, 4 Mar 2021 17:12:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8d153937-c5fc-1de2-d510-d3f91f7a9724@linaro.org>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "moderated list:DRM DRIVERS FOR LIMA" <lima@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS FOR LIMA" <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
 Qiang Yu <yuq825@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, cwchoi00@gmail.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/4/21 4:53 PM, Daniel Lezcano wrote:
> 
> Hi Lukasz,
> 
> thanks for commenting this patch,
> 
> On 04/03/2021 14:47, Lukasz Luba wrote:
>> Hi Daniel,
>>
>> On 3/4/21 12:50 PM, Daniel Lezcano wrote:
>>> Currently the default behavior is to manually having the devfreq
>>> backend to register themselves as a devfreq cooling device.
>>>
>>> There are no so many and actually it makes more sense to register the
>>> devfreq device when adding it.
>>>
>>> Consequently, every devfreq becomes a cooling device like cpufreq is.
>>>
>>> Having a devfreq being registered as a cooling device can not mitigate
>>> a thermal zone if it is not bound to this one. Thus, the current
>>> configurations are not impacted by this change.
>>
>> There are also different type of devices, which register into devfreq
>> framework like NoC buses, UFS/eMMC, jpeg and video accelerators, ISP,
>> etc.
>> In some platforms there are plenty of those devices and they all would
>> occupy memory due to private freq_table in devfreq_cooling, function:
>> devfreq_cooling_gen_tables().
>>
>> IIRC in OdroidXU4 there are ~20 devfreq devs for NoC buses.
> 
> I'm curious, do you have a pointer to such kernels having all those
> devfreq ?

Sure, it's mainline code, you can build it with exynos_defconfig.
You can check the DT files to find them arch/arm/boot/dts/exynos*.
(this particular OdroidXU4 is Exynos5422, but it grabs some generic dt
files).

Here is the mainline kernel content of /sys/class/devfreq/
----------------------------------------------------------
sys/class/devfreq /
10c20000.memory-controller  soc:bus-g2d          soc:bus-mfc
11800000.gpu                soc:bus-g2d-acp      soc:bus-mscl
soc:bus-disp1               soc:bus-gen          soc:bus-noc
soc:bus-disp1-fimd          soc:bus-gscl-scaler  soc:bus-peri
soc:bus-fsys-apb            soc:bus-jpeg         soc:bus-wcore
soc:bus-fsys2               soc:bus-jpeg-apb
----------------------------------------------------------

IIRC some Odroid kernel maintained by Hardkernel had more devices
in this dir.


Here is how these bus devices print themselves during boot:
----------------------------------------------------------
[    8.674840] exynos-bus: new bus device registered: soc:bus-wcore ( 
88700 KHz ~ 532000 KHz)
[    8.686412] exynos-bus: new bus device registered: soc:bus-noc ( 
66600 KHz ~ 111000 KHz)
[    8.696080] exynos-bus: new bus device registered: soc:bus-fsys-apb 
(111000 KHz ~ 222000 KHz)
[    8.706590] exynos-bus: new bus device registered: soc:bus-fsys2 ( 
75000 KHz ~ 200000 KHz)
[    8.717661] exynos-bus: new bus device registered: soc:bus-mfc ( 
83250 KHz ~ 333000 KHz)
[    8.728139] exynos-bus: new bus device registered: soc:bus-gen ( 
88700 KHz ~ 266000 KHz)
[    8.737551] exynos-bus: new bus device registered: soc:bus-peri ( 
66600 KHz ~  66600 KHz)
[    8.748625] exynos-bus: new bus device registered: soc:bus-g2d ( 
83250 KHz ~ 333000 KHz)
[    8.759427] exynos-bus: new bus device registered: soc:bus-g2d-acp ( 
66500 KHz ~ 266000 KHz)
[    8.770366] exynos-bus: new bus device registered: soc:bus-jpeg ( 
75000 KHz ~ 300000 KHz)
[    8.781135] exynos-bus: new bus device registered: soc:bus-jpeg-apb ( 
83250 KHz ~ 166500 KHz)
[    8.791366] exynos-bus: new bus device registered: soc:bus-disp1-fimd 
(120000 KHz ~ 200000 KHz)
[    8.802418] exynos-bus: new bus device registered: soc:bus-disp1 
(120000 KHz ~ 300000 KHz)
[    8.813050] exynos-bus: new bus device registered: 
soc:bus-gscl-scaler (150000 KHz ~ 300000 KHz)
[    8.825308] exynos-bus: new bus device registered: soc:bus-mscl ( 
84000 KHz ~ 666000 KHz)

----------------------------------------------------------


> 
>> It's true that they will not affect thermal zones, but unnecessarily,
>> they all will show up in the /sys/class/thermal/ as
>> thermal-devfreq-X
>>
>>
>> IMO the devfreq shouldn't be tight with devfreq cooling thermal.
> 
> The energy model is tied with a cooling device initialization.
> 
> So if we want to do power limitation, the energy model must be
> initialized with the device, thus the cooling device also.
> 
> That is the reason why I'm ending up with this change. Chanwoo
> suggestion makes sense and that will allow to move the initialization to
> devfreq which is more sane but it does not solve the initial problem
> with the energy model.

Make sense, the 'is_cooling_device' does the job.

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
