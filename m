Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AC0330A86
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000A089C54;
	Mon,  8 Mar 2021 09:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C80DB89C54
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 09:51:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13933D6E;
 Mon,  8 Mar 2021 01:51:05 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7481E3F73C;
 Mon,  8 Mar 2021 01:51:03 -0800 (PST)
Subject: Re: [PATCH v5 3/4] PM / devfreq: panfrost: Use devfreq cooling device
 registration
To: Daniel Lezcano <daniel.lezcano@linaro.org>, cwchoi00@gmail.com
References: <20210308091646.28096-1-daniel.lezcano@linaro.org>
 <20210308091646.28096-3-daniel.lezcano@linaro.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <59627ba5-2602-73cd-c24c-b6695a4fd650@arm.com>
Date: Mon, 8 Mar 2021 09:51:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210308091646.28096-3-daniel.lezcano@linaro.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 "open list:ARM MALI PANFROST DRM DRIVER" <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, lukasz.luba@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/03/2021 09:16, Daniel Lezcano wrote:
> The devfreq core code is able to register the devfreq device as a
> cooling device if the 'is_cooling_device' flag is set in the profile.
> 
> Use this flag and remove the cooling device registering code.
> 
> Tested on rock960.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 14 +-------------
>   drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ---
>   2 files changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 56b3f5935703..4d96edf1bc54 100644
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
> @@ -80,6 +79,7 @@ static struct devfreq_dev_profile panfrost_devfreq_profile = {
>   	.polling_ms = 50, /* ~3 frames */
>   	.target = panfrost_devfreq_target,
>   	.get_dev_status = panfrost_devfreq_get_dev_status,
> +	.is_cooling_device = true,
>   };
>   
>   int panfrost_devfreq_init(struct panfrost_device *pfdev)
> @@ -90,7 +90,6 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   	struct device *dev = &pfdev->pdev->dev;
>   	struct devfreq *devfreq;
>   	struct opp_table *opp_table;
> -	struct thermal_cooling_device *cooling;
>   	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
>   
>   	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
> @@ -139,12 +138,6 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
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
> @@ -156,11 +149,6 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
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
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
> index db6ea48e21f9..470f5c974703 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
> @@ -9,14 +9,11 @@
>   
>   struct devfreq;
>   struct opp_table;
> -struct thermal_cooling_device;
> -
>   struct panfrost_device;
>   
>   struct panfrost_devfreq {
>   	struct devfreq *devfreq;
>   	struct opp_table *regulators_opp_table;
> -	struct thermal_cooling_device *cooling;
>   	bool opp_of_table_added;
>   
>   	ktime_t busy_time;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
