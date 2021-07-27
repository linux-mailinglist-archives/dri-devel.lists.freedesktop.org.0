Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA43D7EE8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 22:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA2E6E20A;
	Tue, 27 Jul 2021 20:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1A56E20A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:11:30 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id r26so23817349lfp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uBStDjTqz07thyrl4Qb1Hr6vIu3KRCTzF46UH90++XA=;
 b=FxNLyzM0A1nZHH+0Jh5HTTVCDsKhXIXL5db65ICR5GsLGv52NMoZteiOaPeqbSM7Og
 C/BKDVPpUkgyyupdz8xOxHp+JzAUe2mESFWlz2yEdCBInvz4cSG984p5Q2xcDcNyLVMS
 s8QKb6WLTPNFsCTUwGK9bm6cPLQuN4OInQ4cRU0xULX0o0Wpnc28ut783AHQQfcjYdHA
 SDHle+RzEzL8wkhjYMZ61CfANbaaTsVz3va0efU7/dmolDgvkHZAnH3D9fMcRGvpFma9
 tjNeN8Je9MCIjg3Pu5JPydMpMqmlqdvT85knQLr9vHJxd49v3SyrarmeIeJFgaHnalXD
 n98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uBStDjTqz07thyrl4Qb1Hr6vIu3KRCTzF46UH90++XA=;
 b=O9pjIL3l545xmCqtVHjxqBdqzwUhPnE94zaRpSbdWkMeja5TKVgCgnh4XM22hHKwwJ
 UivfH+9lnkHWmxVjTm4mo4VsKMKZ2llhkkWGNw3nYBtEsop3sno6zpvPFsZdAHwkyYuF
 urJJebqm8iF6DBGxj1CZa0SomYuYp0zyXYVl6U0d8Tvre5vdd1aDmmtSxq+2F+8qnMmt
 HKdVpkQCm/OWphpP5YHQaVFX/C7OLpSlHDBuH3pk5cq1S3VfPESl++1Hs3uAQVAe8bB5
 b35gsTvz96AVSbJi4HiPOHkxtG3NPPIvF5EvIN/xy9yo/G3uhyE+zAy3BzHdncEBB43t
 blgg==
X-Gm-Message-State: AOAM532FfU+/sEO9HptfEV/W98Jg7gM5EZqbUCEX5av2zU7tjyxktUQV
 4JZKc4yc4WsEBw7FtBEDsewt7Q==
X-Google-Smtp-Source: ABdhPJwEBmvrq9cIrvx7IDeQ4B+EV+iwwT2jPH/uvtKmQ6644t5esoIIMxpCgJK0OeK0xnom5OK66Q==
X-Received: by 2002:a05:6512:2388:: with SMTP id
 c8mr17036569lfv.201.1627416688203; 
 Tue, 27 Jul 2021 13:11:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z12sm377492lfu.53.2021.07.27.13.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 13:11:27 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] drm/msm: Split out devfreq handling
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20210726144653.2180096-1-robdclark@gmail.com>
 <20210726144653.2180096-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <76f8b744-9565-4912-83ff-7648cd0af011@linaro.org>
Date: Tue, 27 Jul 2021 23:11:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726144653.2180096-2-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2021 17:46, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Before we start adding more cleverness, split it into it's own file.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/Makefile          |   1 +
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   4 +-
>   drivers/gpu/drm/msm/msm_gpu.c         | 116 +---------------------
>   drivers/gpu/drm/msm/msm_gpu.h         |  32 +++++--
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 133 ++++++++++++++++++++++++++
>   5 files changed, 165 insertions(+), 121 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 2c00aa70b708..904535eda0c4 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -90,6 +90,7 @@ msm-y := \
>   	msm_gem_submit.o \
>   	msm_gem_vma.o \
>   	msm_gpu.o \
> +	msm_gpu_devfreq.o \
>   	msm_iommu.o \
>   	msm_perf.o \
>   	msm_rd.o \
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 9db9f7847ea8..91f637b908f4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1477,7 +1477,7 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
>   	if (ret)
>   		return ret;
>   
> -	msm_gpu_resume_devfreq(gpu);
> +	msm_devfreq_resume(gpu);
>   
>   	a6xx_llc_activate(a6xx_gpu);
>   
> @@ -1494,7 +1494,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>   
>   	a6xx_llc_deactivate(a6xx_gpu);
>   
> -	devfreq_suspend_device(gpu->devfreq.devfreq);
> +	msm_devfreq_suspend(gpu);
>   
>   	ret = a6xx_gmu_stop(a6xx_gpu);
>   	if (ret)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 647af45cf892..fedbd785e42f 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -13,8 +13,6 @@
>   
>   #include <generated/utsrelease.h>
>   #include <linux/string_helpers.h>
> -#include <linux/devfreq.h>
> -#include <linux/devfreq_cooling.h>
>   #include <linux/devcoredump.h>
>   #include <linux/sched/task.h>
>   
> @@ -22,106 +20,6 @@
>    * Power Management:
>    */
>   
> -static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> -		u32 flags)
> -{
> -	struct msm_gpu *gpu = dev_to_gpu(dev);
> -	struct dev_pm_opp *opp;
> -
> -	opp = devfreq_recommended_opp(dev, freq, flags);
> -
> -	if (IS_ERR(opp))
> -		return PTR_ERR(opp);
> -
> -	trace_msm_gpu_freq_change(dev_pm_opp_get_freq(opp));
> -
> -	if (gpu->funcs->gpu_set_freq)
> -		gpu->funcs->gpu_set_freq(gpu, opp);
> -	else
> -		clk_set_rate(gpu->core_clk, *freq);
> -
> -	dev_pm_opp_put(opp);
> -
> -	return 0;
> -}
> -
> -static int msm_devfreq_get_dev_status(struct device *dev,
> -		struct devfreq_dev_status *status)
> -{
> -	struct msm_gpu *gpu = dev_to_gpu(dev);
> -	ktime_t time;
> -
> -	if (gpu->funcs->gpu_get_freq)
> -		status->current_frequency = gpu->funcs->gpu_get_freq(gpu);
> -	else
> -		status->current_frequency = clk_get_rate(gpu->core_clk);
> -
> -	status->busy_time = gpu->funcs->gpu_busy(gpu);
> -
> -	time = ktime_get();
> -	status->total_time = ktime_us_delta(time, gpu->devfreq.time);
> -	gpu->devfreq.time = time;
> -
> -	return 0;
> -}
> -
> -static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
> -{
> -	struct msm_gpu *gpu = dev_to_gpu(dev);
> -
> -	if (gpu->funcs->gpu_get_freq)
> -		*freq = gpu->funcs->gpu_get_freq(gpu);
> -	else
> -		*freq = clk_get_rate(gpu->core_clk);
> -
> -	return 0;
> -}
> -
> -static struct devfreq_dev_profile msm_devfreq_profile = {
> -	.polling_ms = 10,
> -	.target = msm_devfreq_target,
> -	.get_dev_status = msm_devfreq_get_dev_status,
> -	.get_cur_freq = msm_devfreq_get_cur_freq,
> -};
> -
> -static void msm_devfreq_init(struct msm_gpu *gpu)
> -{
> -	/* We need target support to do devfreq */
> -	if (!gpu->funcs->gpu_busy)
> -		return;
> -
> -	msm_devfreq_profile.initial_freq = gpu->fast_rate;
> -
> -	/*
> -	 * Don't set the freq_table or max_state and let devfreq build the table
> -	 * from OPP
> -	 * After a deferred probe, these may have be left to non-zero values,
> -	 * so set them back to zero before creating the devfreq device
> -	 */
> -	msm_devfreq_profile.freq_table = NULL;
> -	msm_devfreq_profile.max_state = 0;
> -
> -	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
> -			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
> -			NULL);
> -
> -	if (IS_ERR(gpu->devfreq.devfreq)) {
> -		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> -		gpu->devfreq.devfreq = NULL;
> -		return;
> -	}
> -
> -	devfreq_suspend_device(gpu->devfreq.devfreq);
> -
> -	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
> -			gpu->devfreq.devfreq);
> -	if (IS_ERR(gpu->cooling)) {
> -		DRM_DEV_ERROR(&gpu->pdev->dev,
> -				"Couldn't register GPU cooling device\n");
> -		gpu->cooling = NULL;
> -	}
> -}
> -
>   static int enable_pwrrail(struct msm_gpu *gpu)
>   {
>   	struct drm_device *dev = gpu->dev;
> @@ -196,14 +94,6 @@ static int disable_axi(struct msm_gpu *gpu)
>   	return 0;
>   }
>   
> -void msm_gpu_resume_devfreq(struct msm_gpu *gpu)
> -{
> -	gpu->devfreq.busy_cycles = 0;
> -	gpu->devfreq.time = ktime_get();
> -
> -	devfreq_resume_device(gpu->devfreq.devfreq);
> -}
> -
>   int msm_gpu_pm_resume(struct msm_gpu *gpu)
>   {
>   	int ret;
> @@ -223,7 +113,7 @@ int msm_gpu_pm_resume(struct msm_gpu *gpu)
>   	if (ret)
>   		return ret;
>   
> -	msm_gpu_resume_devfreq(gpu);
> +	msm_devfreq_resume(gpu);
>   
>   	gpu->needs_hw_init = true;
>   
> @@ -237,7 +127,7 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
>   	DBG("%s", gpu->name);
>   	trace_msm_gpu_suspend(0);
>   
> -	devfreq_suspend_device(gpu->devfreq.devfreq);
> +	msm_devfreq_suspend(gpu);
>   
>   	ret = disable_axi(gpu);
>   	if (ret)
> @@ -1116,5 +1006,5 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>   		kthread_destroy_worker(gpu->worker);
>   	}
>   
> -	devfreq_cooling_unregister(gpu->cooling);
> +	msm_devfreq_cleanup(gpu);
>   }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index ef41ec09f59c..2e61d05293e6 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -80,6 +80,26 @@ struct msm_gpu_fault_info {
>   	const char *block;
>   };
>   
> +/**
> + * struct msm_gpu_devfreq - devfreq related state
> + */
> +struct msm_gpu_devfreq {
> +	/** devfreq: devfreq instance */
> +	struct devfreq *devfreq;
> +
> +	/**
> +	 * busy_cycles:
> +	 *
> +	 * Used by implementation of gpu->gpu_busy() to track the last
> +	 * busy counter value, for calculating elapsed busy cycles since
> +	 * last sampling period.
> +	 */
> +	u64 busy_cycles;
> +
> +	/** time: Time of last sampling period. */
> +	ktime_t time;
> +};
> +
>   struct msm_gpu {
>   	const char *name;
>   	struct drm_device *dev;
> @@ -151,11 +171,7 @@ struct msm_gpu {
>   
>   	struct drm_gem_object *memptrs_bo;
>   
> -	struct {
> -		struct devfreq *devfreq;
> -		u64 busy_cycles;
> -		ktime_t time;
> -	} devfreq;
> +	struct msm_gpu_devfreq devfreq;
>   
>   	uint32_t suspend_count;
>   
> @@ -301,7 +317,11 @@ static inline void gpu_write64(struct msm_gpu *gpu, u32 lo, u32 hi, u64 val)
>   
>   int msm_gpu_pm_suspend(struct msm_gpu *gpu);
>   int msm_gpu_pm_resume(struct msm_gpu *gpu);
> -void msm_gpu_resume_devfreq(struct msm_gpu *gpu);
> +
> +void msm_devfreq_init(struct msm_gpu *gpu);
> +void msm_devfreq_cleanup(struct msm_gpu *gpu);
> +void msm_devfreq_resume(struct msm_gpu *gpu);
> +void msm_devfreq_suspend(struct msm_gpu *gpu);
>   
>   int msm_gpu_hw_init(struct msm_gpu *gpu);
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> new file mode 100644
> index 000000000000..3bcea0baddab
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2013 Red Hat
> + * Author: Rob Clark <robdclark@gmail.com>
> + */
> +
> +#include "msm_gpu.h"
> +#include "msm_gpu_trace.h"
> +
> +#include <linux/devfreq.h>
> +#include <linux/devfreq_cooling.h>
> +
> +/*
> + * Power Management:
> + */
> +
> +static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> +		u32 flags)
> +{
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
> +	struct dev_pm_opp *opp;
> +
> +	opp = devfreq_recommended_opp(dev, freq, flags);
> +
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +
> +	trace_msm_gpu_freq_change(dev_pm_opp_get_freq(opp));
> +
> +	if (gpu->funcs->gpu_set_freq)
> +		gpu->funcs->gpu_set_freq(gpu, opp);
> +	else
> +		clk_set_rate(gpu->core_clk, *freq);
> +
> +	dev_pm_opp_put(opp);
> +
> +	return 0;
> +}
> +
> +static int msm_devfreq_get_dev_status(struct device *dev,
> +		struct devfreq_dev_status *status)
> +{
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
> +	ktime_t time;
> +
> +	if (gpu->funcs->gpu_get_freq)
> +		status->current_frequency = gpu->funcs->gpu_get_freq(gpu);
> +	else
> +		status->current_frequency = clk_get_rate(gpu->core_clk);
> +
> +	status->busy_time = gpu->funcs->gpu_busy(gpu);
> +
> +	time = ktime_get();
> +	status->total_time = ktime_us_delta(time, gpu->devfreq.time);
> +	gpu->devfreq.time = time;
> +
> +	return 0;
> +}
> +
> +static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
> +{
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
> +
> +	if (gpu->funcs->gpu_get_freq)
> +		*freq = gpu->funcs->gpu_get_freq(gpu);
> +	else
> +		*freq = clk_get_rate(gpu->core_clk);
> +
> +	return 0;
> +}
> +
> +static struct devfreq_dev_profile msm_devfreq_profile = {
> +	.polling_ms = 10,
> +	.target = msm_devfreq_target,
> +	.get_dev_status = msm_devfreq_get_dev_status,
> +	.get_cur_freq = msm_devfreq_get_cur_freq,
> +};
> +
> +void msm_devfreq_init(struct msm_gpu *gpu)
> +{
> +	/* We need target support to do devfreq */
> +	if (!gpu->funcs->gpu_busy)
> +		return;
> +
> +	msm_devfreq_profile.initial_freq = gpu->fast_rate;
> +
> +	/*
> +	 * Don't set the freq_table or max_state and let devfreq build the table
> +	 * from OPP
> +	 * After a deferred probe, these may have be left to non-zero values,
> +	 * so set them back to zero before creating the devfreq device
> +	 */
> +	msm_devfreq_profile.freq_table = NULL;
> +	msm_devfreq_profile.max_state = 0;
> +
> +	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
> +			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +			NULL);
> +
> +	if (IS_ERR(gpu->devfreq.devfreq)) {
> +		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> +		gpu->devfreq.devfreq = NULL;
> +		return;
> +	}
> +
> +	devfreq_suspend_device(gpu->devfreq.devfreq);
> +
> +	gpu->cooling = of_devfreq_cooling_register(gpu->pdev->dev.of_node,
> +			gpu->devfreq.devfreq);
> +	if (IS_ERR(gpu->cooling)) {
> +		DRM_DEV_ERROR(&gpu->pdev->dev,
> +				"Couldn't register GPU cooling device\n");
> +		gpu->cooling = NULL;
> +	}
> +}
> +
> +void msm_devfreq_cleanup(struct msm_gpu *gpu)
> +{
> +	devfreq_cooling_unregister(gpu->cooling);
> +}
> +
> +void msm_devfreq_resume(struct msm_gpu *gpu)
> +{
> +	gpu->devfreq.busy_cycles = 0;
> +	gpu->devfreq.time = ktime_get();
> +
> +	devfreq_resume_device(gpu->devfreq.devfreq);
> +}
> +
> +void msm_devfreq_suspend(struct msm_gpu *gpu)
> +{
> +	devfreq_suspend_device(gpu->devfreq.devfreq);
> +}
> 


-- 
With best wishes
Dmitry
