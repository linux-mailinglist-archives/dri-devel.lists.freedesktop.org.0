Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4ED32E369
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 09:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11D16EB0C;
	Fri,  5 Mar 2021 08:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9544D6EB0C;
 Fri,  5 Mar 2021 08:11:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCEC9D6E;
 Fri,  5 Mar 2021 00:11:40 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 212A63F73B;
 Fri,  5 Mar 2021 00:11:37 -0800 (PST)
Subject: Re: [PATCH] devfreq: Register devfreq as a cooling device
To: Daniel Lezcano <daniel.lezcano@linaro.org>, cwchoi00@gmail.com,
 kyungmin.park@samsung.com, myungjoo.ham@samsung.com
References: <20210304125034.28404-1-daniel.lezcano@linaro.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <23db1b13-9418-91f5-4871-f45b983f6e3c@arm.com>
Date: Fri, 5 Mar 2021 08:12:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210304125034.28404-1-daniel.lezcano@linaro.org>
Content-Language: en-GB
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
 Chanwoo Choi <cw00.choi@samsung.com>, Qiang Yu <yuq825@gmail.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/03/2021 12:50, Daniel Lezcano wrote:
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
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>   drivers/devfreq/devfreq.c                   |  8 ++++++++
>   drivers/gpu/drm/lima/lima_devfreq.c         | 13 -------------
>   drivers/gpu/drm/lima/lima_devfreq.h         |  2 --
>   drivers/gpu/drm/msm/msm_gpu.c               | 11 -----------
>   drivers/gpu/drm/msm/msm_gpu.h               |  2 --
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 13 -------------
>   include/linux/devfreq.h                     |  3 +++
>   7 files changed, 11 insertions(+), 41 deletions(-)
> 
[...]
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 56b3f5935703..2cb6300de1f1 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -3,7 +3,6 @@
>   
>   #include <linux/clk.h>
>   #include <linux/devfreq.h>
> -#include <linux/devfreq_cooling.h>
>   #include <linux/platform_device.h>
>   #include <linux/pm_opp.h>
>   
> @@ -90,7 +89,6 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   	struct device *dev = &pfdev->pdev->dev;
>   	struct devfreq *devfreq;
>   	struct opp_table *opp_table;
> -	struct thermal_cooling_device *cooling;
>   	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
>   
>   	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
> @@ -139,12 +137,6 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   	}
>   	pfdevfreq->devfreq = devfreq;
>   
> -	cooling = devfreq_cooling_em_register(devfreq, NULL);
> -	if (IS_ERR(cooling))
> -		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
> -	else
> -		pfdevfreq->cooling = cooling;
> -
>   	return 0;
>   
>   err_fini:
> @@ -156,11 +148,6 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
>   {
>   	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
>   
> -	if (pfdevfreq->cooling) {
> -		devfreq_cooling_unregister(pfdevfreq->cooling);
> -		pfdevfreq->cooling = NULL;
> -	}
> -
>   	if (pfdevfreq->opp_of_table_added) {
>   		dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
>   		pfdevfreq->opp_of_table_added = false;

You've removed all references to pfdevfreq->cooling, so please also 
remove the member from struct panfrost_devfreq (as already done with 
lima and msm).

Thanks,

Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
