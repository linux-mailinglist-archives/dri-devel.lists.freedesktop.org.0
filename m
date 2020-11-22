Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F62BC57D
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 12:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD3C8984F;
	Sun, 22 Nov 2020 11:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EC18984F;
 Sun, 22 Nov 2020 11:57:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b6so15668697wrt.4;
 Sun, 22 Nov 2020 03:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ULKzBWVtKJ6qW3Oh2mqL1PTKfA0h0fhoyWR5kb5+MhQ=;
 b=g2Tkib6ATdAr4tRemogIPWL4gB1Y63VC4wtAHCTPFiqM5RumlKGj3r8qvaoX1Ztrmq
 38zaL49DEm9y4sWdBS2SAeP4CDDQFV5rbZnq4VvmeFe85LJWmPZtyZx7W+o1ISfUgy8/
 NTC8flYMtr8H3ByspYOFs+UirS3W0ss/iIIfNr8LoWuq4+svv2wEpII3oVHiBcRDNwwf
 c/LVAdqFILbszioZE4tQuxq5Uj0oG1sAMNVkr8tUBXs4kr+r0UDevgrZmTU2r0/0sMkm
 z5dnPSfq2ayC5JQula1S0sesVoqTeMePZXXnA/YGvBKgG3pGZOefUJhoy2hVnonMZ4U+
 IhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ULKzBWVtKJ6qW3Oh2mqL1PTKfA0h0fhoyWR5kb5+MhQ=;
 b=qzn3Oxe3/zRQvePfLib3D+LnfSAhvCTzZC30omeFPVaeWpLyg+S6cBN8a3TKacVZrd
 wHaGumsBAiAIMKqXTFjCsg/P6ncaMjtV2OBOqS59Sbf09KoAf98e1AJfEVmV/+ncR09X
 fXPZNZEwQebD7wOdM1pKaL56RrDbl+27iWebwSMUA+4z5+YFpaUrwD3fTxYx3l8jl7rv
 7ZR3tQ1e97j4Lv5GYJ45wbZoCnNkPvkWGvculcTufoAsidlc0l1hlZPEHf5PlnCyP8KI
 4E5FQpdoVsqgQE/IQ/tufcT+pgDv8jbgCJJcJ7OLb8aEGgLbWrKcYG0savPjnhQ+8KrK
 xGpg==
X-Gm-Message-State: AOAM530bkCkfHguCP7EMRzCgoQf4h9lxdw8Ds0PWdUAfnz1OgurfACJW
 JL6gaaBNhLH0AZICllQQDWI=
X-Google-Smtp-Source: ABdhPJy8oXGa2aSOAuSHE4rJefxIAKW8M6KXpEddpRfHgS3bDnNG3Ra34LDRSj8X+wRa4NYGNxz/Ww==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr25528842wrg.366.1606046261636; 
 Sun, 22 Nov 2020 03:57:41 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id n126sm10323078wmn.21.2020.11.22.03.57.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 03:57:41 -0800 (PST)
Subject: Re: [PATCH v3 07/12] drm/sched: Prevent any job recoveries after
 device is unplugged.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-8-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9559011a-0a59-2d1e-ca8c-65860b838c8d@gmail.com>
Date: Sun, 22 Nov 2020 12:57:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605936082-3099-8-git-send-email-andrey.grodzovsky@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.11.20 um 06:21 schrieb Andrey Grodzovsky:
> No point to try recovery if device is gone, it's meaningless.

I think that this should go into the device specific recovery function 
and not in the scheduler.

Christian.

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  2 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c   |  3 ++-
>   drivers/gpu/drm/lima/lima_sched.c         |  3 ++-
>   drivers/gpu/drm/panfrost/panfrost_job.c   |  2 +-
>   drivers/gpu/drm/scheduler/sched_main.c    | 15 ++++++++++++++-
>   drivers/gpu/drm/v3d/v3d_sched.c           | 15 ++++++++++-----
>   include/drm/gpu_scheduler.h               |  6 +++++-
>   7 files changed, 35 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index d56f402..d0b0021 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -487,7 +487,7 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>   
>   		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>   				   num_hw_submission, amdgpu_job_hang_limit,
> -				   timeout, ring->name);
> +				   timeout, ring->name, &adev->ddev);
>   		if (r) {
>   			DRM_ERROR("Failed to create scheduler on ring %s.\n",
>   				  ring->name);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index cd46c88..7678287 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -185,7 +185,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>   
>   	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>   			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
> -			     msecs_to_jiffies(500), dev_name(gpu->dev));
> +			     msecs_to_jiffies(500), dev_name(gpu->dev),
> +			     gpu->drm);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index dc6df9e..8a7e5d7ca 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -505,7 +505,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>   
>   	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
>   			      lima_job_hang_limit, msecs_to_jiffies(timeout),
> -			      name);
> +			      name,
> +			      pipe->ldev->ddev);
>   }
>   
>   void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 30e7b71..37b03b01 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -520,7 +520,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>   		ret = drm_sched_init(&js->queue[j].sched,
>   				     &panfrost_sched_ops,
>   				     1, 0, msecs_to_jiffies(500),
> -				     "pan_js");
> +				     "pan_js", pfdev->ddev);
>   		if (ret) {
>   			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
>   			goto err_sched;
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c3f0bd0..95db8c6 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -53,6 +53,7 @@
>   #include <drm/drm_print.h>
>   #include <drm/gpu_scheduler.h>
>   #include <drm/spsc_queue.h>
> +#include <drm/drm_drv.h>
>   
>   #define CREATE_TRACE_POINTS
>   #include "gpu_scheduler_trace.h"
> @@ -283,8 +284,16 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   	struct drm_gpu_scheduler *sched;
>   	struct drm_sched_job *job;
>   
> +	int idx;
> +
>   	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>   
> +	if (!drm_dev_enter(sched->ddev, &idx)) {
> +		DRM_INFO("%s - device unplugged skipping recovery on scheduler:%s",
> +			 __func__, sched->name);
> +		return;
> +	}
> +
>   	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>   	spin_lock(&sched->job_list_lock);
>   	job = list_first_entry_or_null(&sched->ring_mirror_list,
> @@ -316,6 +325,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   	spin_lock(&sched->job_list_lock);
>   	drm_sched_start_timeout(sched);
>   	spin_unlock(&sched->job_list_lock);
> +
> +	drm_dev_exit(idx);
>   }
>   
>    /**
> @@ -845,7 +856,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   unsigned hw_submission,
>   		   unsigned hang_limit,
>   		   long timeout,
> -		   const char *name)
> +		   const char *name,
> +		   struct drm_device *ddev)
>   {
>   	int i, ret;
>   	sched->ops = ops;
> @@ -853,6 +865,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	sched->name = name;
>   	sched->timeout = timeout;
>   	sched->hang_limit = hang_limit;
> +	sched->ddev = ddev;
>   	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>   		drm_sched_rq_init(sched, &sched->sched_rq[i]);
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 0747614..f5076e5 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -401,7 +401,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_bin_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms),
> -			     "v3d_bin");
> +			     "v3d_bin",
> +			     &v3d->drm);
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
>   		return ret;
> @@ -411,7 +412,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_render_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms),
> -			     "v3d_render");
> +			     "v3d_render",
> +			     &v3d->drm);
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
>   			ret);
> @@ -423,7 +425,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>   			     &v3d_tfu_sched_ops,
>   			     hw_jobs_limit, job_hang_limit,
>   			     msecs_to_jiffies(hang_limit_ms),
> -			     "v3d_tfu");
> +			     "v3d_tfu",
> +			     &v3d->drm);
>   	if (ret) {
>   		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
>   			ret);
> @@ -436,7 +439,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     &v3d_csd_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms),
> -				     "v3d_csd");
> +				     "v3d_csd",
> +				     &v3d->drm);
>   		if (ret) {
>   			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
>   				ret);
> @@ -448,7 +452,8 @@ v3d_sched_init(struct v3d_dev *v3d)
>   				     &v3d_cache_clean_sched_ops,
>   				     hw_jobs_limit, job_hang_limit,
>   				     msecs_to_jiffies(hang_limit_ms),
> -				     "v3d_cache_clean");
> +				     "v3d_cache_clean",
> +				     &v3d->drm);
>   		if (ret) {
>   			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
>   				ret);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 9243655..a980709 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -32,6 +32,7 @@
>   
>   struct drm_gpu_scheduler;
>   struct drm_sched_rq;
> +struct drm_device;
>   
>   /* These are often used as an (initial) index
>    * to an array, and as such should start at 0.
> @@ -267,6 +268,7 @@ struct drm_sched_backend_ops {
>    * @score: score to help loadbalancer pick a idle sched
>    * @ready: marks if the underlying HW is ready to work
>    * @free_guilty: A hit to time out handler to free the guilty job.
> + * @ddev: Pointer to drm device of this scheduler.
>    *
>    * One scheduler is implemented for each hardware ring.
>    */
> @@ -288,12 +290,14 @@ struct drm_gpu_scheduler {
>   	atomic_t                        score;
>   	bool				ready;
>   	bool				free_guilty;
> +	struct drm_device		*ddev;
>   };
>   
>   int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		   const struct drm_sched_backend_ops *ops,
>   		   uint32_t hw_submission, unsigned hang_limit, long timeout,
> -		   const char *name);
> +		   const char *name,
> +		   struct drm_device *ddev);
>   
>   void drm_sched_fini(struct drm_gpu_scheduler *sched);
>   int drm_sched_job_init(struct drm_sched_job *job,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
