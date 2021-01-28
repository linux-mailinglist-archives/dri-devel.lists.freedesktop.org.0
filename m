Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F95C307ECA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FB96EA02;
	Thu, 28 Jan 2021 19:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C76C6E0F5;
 Thu, 28 Jan 2021 10:04:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CA411042;
 Thu, 28 Jan 2021 02:04:54 -0800 (PST)
Received: from [10.57.11.243] (unknown [10.57.11.243])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5127D3F766;
 Thu, 28 Jan 2021 02:04:52 -0800 (PST)
Subject: Re: [PATCH v2] drm/lima: add governor data with pre-defined thresholds
To: Christian Hewitt <christianshewitt@gmail.com>, Qiang Yu
 <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210127194047.21462-1-christianshewitt@gmail.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <3ff0efe3-c57a-369c-863a-955004612bda@arm.com>
Date: Thu, 28 Jan 2021 10:04:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20210127194047.21462-1-christianshewitt@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: Steven Price <steven.price@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/27/21 7:40 PM, Christian Hewitt wrote:
> This patch adapts the panfrost pre-defined thresholds change [0] to the
> lima driver to improve real-world performance. The upthreshold value has
> been set to ramp GPU frequency to max freq faster (compared to panfrost)
> to compensate for the lower overall performance of utgard devices.
> 
> [0] https://patchwork.kernel.org/project/dri-devel/patch/20210121170445.19761-1-lukasz.luba@arm.com/
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> Change since v1: increased upthreshold from 20 to 30, with a soft
> dependency on Lukasz delayed timer patch [0]
> 
> [0] https://lore.kernel.org/lkml/20210127105121.20345-1-lukasz.luba@arm.com/
> 
>   drivers/gpu/drm/lima/lima_devfreq.c | 10 +++++++++-
>   drivers/gpu/drm/lima/lima_devfreq.h |  2 ++
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> index 5686ad4aaf7c..c9854315a0b5 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -163,8 +163,16 @@ int lima_devfreq_init(struct lima_device *ldev)
>   	lima_devfreq_profile.initial_freq = cur_freq;
>   	dev_pm_opp_put(opp);
>   
> +	/*
> +	 * Setup default thresholds for the simple_ondemand governor.
> +	 * The values are chosen based on experiments.
> +	 */
> +	ldevfreq->gov_data.upthreshold = 30;
> +	ldevfreq->gov_data.downdifferential = 5;
> +
>   	devfreq = devm_devfreq_add_device(dev, &lima_devfreq_profile,
> -					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
> +					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +					  &ldevfreq->gov_data);
>   	if (IS_ERR(devfreq)) {
>   		dev_err(dev, "Couldn't initialize GPU devfreq\n");
>   		ret = PTR_ERR(devfreq);
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
> index 2d9b3008ce77..b0c7c736e81a 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.h
> +++ b/drivers/gpu/drm/lima/lima_devfreq.h
> @@ -4,6 +4,7 @@
>   #ifndef __LIMA_DEVFREQ_H__
>   #define __LIMA_DEVFREQ_H__
>   
> +#include <linux/devfreq.h>
>   #include <linux/spinlock.h>
>   #include <linux/ktime.h>
>   
> @@ -18,6 +19,7 @@ struct lima_devfreq {
>   	struct opp_table *clkname_opp_table;
>   	struct opp_table *regulators_opp_table;
>   	struct thermal_cooling_device *cooling;
> +	struct devfreq_simple_ondemand_data gov_data;
>   
>   	ktime_t busy_time;
>   	ktime_t idle_time;
> 

It looks good.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
