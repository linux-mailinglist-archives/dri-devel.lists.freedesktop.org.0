Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7A7BC9B7F
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 17:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B559A10EA8F;
	Thu,  9 Oct 2025 15:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E2F110EA8E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 15:17:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89CBA1688;
 Thu,  9 Oct 2025 08:17:19 -0700 (PDT)
Received: from [10.1.34.29] (e122027.cambridge.arm.com [10.1.34.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBF6F3F59E;
 Thu,  9 Oct 2025 08:17:23 -0700 (PDT)
Message-ID: <936703a3-15b6-4ade-b9e5-5554dffc4430@arm.com>
Date: Thu, 9 Oct 2025 16:17:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/12] drm/panfrost: Handle job HW submit errors
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
 <20251007150216.254250-4-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251007150216.254250-4-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2025 16:01, Adrián Larumbe wrote:
> Avoid waiting for the DRM scheduler job timedout handler, and instead, let
> the DRM scheduler core signal the error fence immediately when HW job
> submission fails.
> 
> That means we must also decrement the runtime-PM refcnt for the device,
> because the job will never be enqueued or inflight.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index a0123d0a1b7d..ea3f2878fd15 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -196,7 +196,7 @@ panfrost_enqueue_job(struct panfrost_device *pfdev, int slot,
>  	return 1;
>  }
>  
> -static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
> +static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  {
>  	struct panfrost_device *pfdev = job->pfdev;
>  	unsigned int subslot;
> @@ -204,18 +204,19 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  	u64 jc_head = job->jc;
>  	int ret;
>  
> -	panfrost_devfreq_record_busy(&pfdev->pfdevfreq);
> -
>  	ret = pm_runtime_get_sync(pfdev->base.dev);
>  	if (ret < 0)
> -		return;
> +		goto err_hwsubmit;
>  
>  	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
> -		return;
> +		ret = -EINVAL;
> +		goto err_hwsubmit;
>  	}
>  
>  	cfg = panfrost_mmu_as_get(pfdev, job->mmu);
>  
> +	panfrost_devfreq_record_busy(&pfdev->pfdevfreq);
> +
>  	job_write(pfdev, JS_HEAD_NEXT_LO(js), lower_32_bits(jc_head));
>  	job_write(pfdev, JS_HEAD_NEXT_HI(js), upper_32_bits(jc_head));
>  
> @@ -262,6 +263,12 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  			job, js, subslot, jc_head, cfg & 0xf);
>  	}
>  	spin_unlock(&pfdev->js->job_lock);
> +
> +	return 0;
> +
> +err_hwsubmit:
> +	pm_runtime_put_autosuspend(pfdev->base.dev);
> +	return ret;
>  }
>  
>  static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
> @@ -384,6 +391,7 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
>  	struct panfrost_device *pfdev = job->pfdev;
>  	int slot = panfrost_job_get_slot(job);
>  	struct dma_fence *fence = NULL;
> +	int ret;
>  
>  	if (job->ctx->destroyed)
>  		return ERR_PTR(-ECANCELED);
> @@ -405,7 +413,11 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
>  		dma_fence_put(job->done_fence);
>  	job->done_fence = dma_fence_get(fence);
>  
> -	panfrost_job_hw_submit(job, slot);
> +	ret = panfrost_job_hw_submit(job, slot);
> +	if (ret) {
> +		dma_fence_put(fence);
> +		return ERR_PTR(ret);
> +	}
>  
>  	return fence;
>  }

