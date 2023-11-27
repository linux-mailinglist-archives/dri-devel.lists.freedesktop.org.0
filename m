Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581417F9EA5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 12:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C0F10E247;
	Mon, 27 Nov 2023 11:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 076DD10E247
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 11:34:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A2042F4;
 Mon, 27 Nov 2023 03:34:53 -0800 (PST)
Received: from [10.57.72.179] (unknown [10.57.72.179])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D90AE3F73F;
 Mon, 27 Nov 2023 03:34:02 -0800 (PST)
Message-ID: <f7d05fff-9d23-4706-a93c-a1709872226c@arm.com>
Date: Mon, 27 Nov 2023 11:34:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panfrost: Fix incorrect updating of current
 device frequency
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20231125205438.375407-1-adrian.larumbe@collabora.com>
 <20231125205438.375407-3-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20231125205438.375407-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2023 20:52, Adrián Larumbe wrote:
> It was noticed when setting the Panfrost's DVFS device to the performant
> governor, GPU frequency as reported by fdinfo had dropped to 0 permamently.
> 
> There are two separate issues causing this behaviour:
>  - Not initialising the device's current_frequency variable to its original
>  value during device probe().
>  - Updating said variable in Panfrost devfreq's get_dev_status() rather
>  than after the new OPP's frequency had been retrieved in target(), which
>  meant the old frequency would be assigned instead.

Good catch - I'd not looked at the performance governor. I'd assumed
that one was "too simple to be wrong" ;)

Reviewed-by: Steven Price <steven.price@arm.com>

> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: f11b0417eec2 ("drm/panfrost: Add fdinfo support GPU load metrics")
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index f59c82ea8870..2d30da38c2c3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -29,14 +29,20 @@ static void panfrost_devfreq_update_utilization(struct panfrost_devfreq *pfdevfr
>  static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
>  				   u32 flags)
>  {
> +	struct panfrost_device *ptdev = dev_get_drvdata(dev);
>  	struct dev_pm_opp *opp;
> +	int err;
>  
>  	opp = devfreq_recommended_opp(dev, freq, flags);
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  	dev_pm_opp_put(opp);
>  
> -	return dev_pm_opp_set_rate(dev, *freq);
> +	err =  dev_pm_opp_set_rate(dev, *freq);
> +	if (!err)
> +		ptdev->pfdevfreq.current_frequency = *freq;
> +
> +	return err;
>  }
>  
>  static void panfrost_devfreq_reset(struct panfrost_devfreq *pfdevfreq)
> @@ -58,7 +64,6 @@ static int panfrost_devfreq_get_dev_status(struct device *dev,
>  	spin_lock_irqsave(&pfdevfreq->lock, irqflags);
>  
>  	panfrost_devfreq_update_utilization(pfdevfreq);
> -	pfdevfreq->current_frequency = status->current_frequency;
>  
>  	status->total_time = ktime_to_ns(ktime_add(pfdevfreq->busy_time,
>  						   pfdevfreq->idle_time));
> @@ -164,6 +169,14 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  
>  	panfrost_devfreq_profile.initial_freq = cur_freq;
>  
> +	/*
> +	 * We could wait until panfrost_devfreq_target() to set this value, but
> +	 * since the simple_ondemand governor works asynchronously, there's a
> +	 * chance by the time someone opens the device's fdinfo file, current
> +	 * frequency hasn't been updated yet, so let's just do an early set.
> +	 */
> +	pfdevfreq->current_frequency = cur_freq;
> +
>  	/*
>  	 * Set the recommend OPP this will enable and configure the regulator
>  	 * if any and will avoid a switch off by regulator_late_cleanup()

