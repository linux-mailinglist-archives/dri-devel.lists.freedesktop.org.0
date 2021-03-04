Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC932D47A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 14:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8493C6E0E4;
	Thu,  4 Mar 2021 13:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 145686E0D5;
 Thu,  4 Mar 2021 13:47:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30CE731B;
 Thu,  4 Mar 2021 05:47:44 -0800 (PST)
Received: from [10.57.19.206] (unknown [10.57.19.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAF7F3F766;
 Thu,  4 Mar 2021 05:47:39 -0800 (PST)
Subject: Re: [PATCH] devfreq: Register devfreq as a cooling device
To: Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20210304125034.28404-1-daniel.lezcano@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <5f06e0c5-b2d9-5e11-01b6-fdd0dac635a7@arm.com>
Date: Thu, 4 Mar 2021 13:47:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210304125034.28404-1-daniel.lezcano@linaro.org>
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

Hi Daniel,

On 3/4/21 12:50 PM, Daniel Lezcano wrote:
> Currently the default behavior is to manually having the devfreq
> backend to register themselves as a devfreq cooling device.
> 
> There are no so many and actually it makes more sense to register the
> devfreq device when adding it.
> 
> Consequently, every devfreq becomes a cooling device like cpufreq is.
> 
> Having a devfreq being registered as a cooling device can not mitigate
> a thermal zone if it is not bound to this one. Thus, the current
> configurations are not impacted by this change.

There are also different type of devices, which register into devfreq
framework like NoC buses, UFS/eMMC, jpeg and video accelerators, ISP,
etc.
In some platforms there are plenty of those devices and they all would
occupy memory due to private freq_table in devfreq_cooling, function:
devfreq_cooling_gen_tables().

IIRC in OdroidXU4 there are ~20 devfreq devs for NoC buses.

It's true that they will not affect thermal zones, but unnecessarily,
they all will show up in the /sys/class/thermal/ as
thermal-devfreq-X.

IMO the devfreq shouldn't be tight with devfreq cooling thermal.

CpuFreq is different because it handles only CPUs. Here we have
many different devices.

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
