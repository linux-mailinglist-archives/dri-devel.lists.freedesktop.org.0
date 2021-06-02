Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E39E398BA1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792546ECA4;
	Wed,  2 Jun 2021 14:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEB156ECA4;
 Wed,  2 Jun 2021 14:06:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44A161042;
 Wed,  2 Jun 2021 07:06:53 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47D133F73D;
 Wed,  2 Jun 2021 07:06:51 -0700 (PDT)
Subject: Re: [PATCH 03/11] drm/panfrost: Use xarray and helpers for depedency
 tracking
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-3-daniel.vetter@ffwll.ch>
From: Steven Price <steven.price@arm.com>
Message-ID: <2054fee7-dcd2-a4fa-5d50-7fe6f1b474be@arm.com>
Date: Wed, 2 Jun 2021 15:06:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-3-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2021 10:09, Daniel Vetter wrote:
> More consistency and prep work for the next patch.
> 
> Aside: I wonder whether we shouldn't just move this entire xarray
> business into the scheduler so that not everyone has to reinvent the
> same wheels. Cc'ing some scheduler people for this too.
> 
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Two comments below, but otherwise looks like a nice cleanup.

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 41 ++++++++---------
>  drivers/gpu/drm/panfrost/panfrost_job.c | 61 ++++++++++---------------
>  drivers/gpu/drm/panfrost/panfrost_job.h |  8 ++--
>  3 files changed, 46 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index ca07098a6141..7977b4752b5c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -137,12 +137,6 @@ panfrost_lookup_bos(struct drm_device *dev,
>  	if (!job->bo_count)
>  		return 0;
>  
> -	job->implicit_fences = kvmalloc_array(job->bo_count,
> -				  sizeof(struct dma_fence *),
> -				  GFP_KERNEL | __GFP_ZERO);
> -	if (!job->implicit_fences)
> -		return -ENOMEM;
> -
>  	ret = drm_gem_objects_lookup(file_priv,
>  				     (void __user *)(uintptr_t)args->bo_handles,
>  				     job->bo_count, &job->bos);
> @@ -173,7 +167,7 @@ panfrost_lookup_bos(struct drm_device *dev,
>  }
>  
>  /**
> - * panfrost_copy_in_sync() - Sets up job->in_fences[] with the sync objects
> + * panfrost_copy_in_sync() - Sets up job->deps with the sync objects
>   * referenced by the job.
>   * @dev: DRM device
>   * @file_priv: DRM file for this fd
> @@ -193,22 +187,14 @@ panfrost_copy_in_sync(struct drm_device *dev,
>  {
>  	u32 *handles;
>  	int ret = 0;
> -	int i;
> +	int i, in_fence_count;
>  
> -	job->in_fence_count = args->in_sync_count;
> +	in_fence_count = args->in_sync_count;
>  
> -	if (!job->in_fence_count)
> +	if (!in_fence_count)
>  		return 0;
>  
> -	job->in_fences = kvmalloc_array(job->in_fence_count,
> -					sizeof(struct dma_fence *),
> -					GFP_KERNEL | __GFP_ZERO);
> -	if (!job->in_fences) {
> -		DRM_DEBUG("Failed to allocate job in fences\n");
> -		return -ENOMEM;
> -	}
> -
> -	handles = kvmalloc_array(job->in_fence_count, sizeof(u32), GFP_KERNEL);
> +	handles = kvmalloc_array(in_fence_count, sizeof(u32), GFP_KERNEL);
>  	if (!handles) {
>  		ret = -ENOMEM;
>  		DRM_DEBUG("Failed to allocate incoming syncobj handles\n");
> @@ -217,16 +203,23 @@ panfrost_copy_in_sync(struct drm_device *dev,
>  
>  	if (copy_from_user(handles,
>  			   (void __user *)(uintptr_t)args->in_syncs,
> -			   job->in_fence_count * sizeof(u32))) {
> +			   in_fence_count * sizeof(u32))) {
>  		ret = -EFAULT;
>  		DRM_DEBUG("Failed to copy in syncobj handles\n");
>  		goto fail;
>  	}
>  
> -	for (i = 0; i < job->in_fence_count; i++) {
> +	for (i = 0; i < in_fence_count; i++) {
> +		struct dma_fence *fence;
> +
>  		ret = drm_syncobj_find_fence(file_priv, handles[i], 0, 0,
> -					     &job->in_fences[i]);
> -		if (ret == -EINVAL)
> +					     &fence);
> +		if (ret)
> +			goto fail;
> +
> +		ret = drm_gem_fence_array_add(&job->deps, fence);
> +
> +		if (ret)
>  			goto fail;
>  	}
>  
> @@ -264,6 +257,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  
>  	kref_init(&job->refcount);
>  
> +	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
> +
>  	job->pfdev = pfdev;
>  	job->jc = args->jc;
>  	job->requirements = args->requirements;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index f5d39ee14ab5..707d912ff64a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -196,14 +196,21 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  	job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
>  }
>  
> -static void panfrost_acquire_object_fences(struct drm_gem_object **bos,
> -					   int bo_count,
> -					   struct dma_fence **implicit_fences)
> +static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
> +					  int bo_count,
> +					  struct xarray *deps)
>  {
> -	int i;
> +	int i, ret;
>  
> -	for (i = 0; i < bo_count; i++)
> -		implicit_fences[i] = dma_resv_get_excl_rcu(bos[i]->resv);
> +	for (i = 0; i < bo_count; i++) {
> +		struct dma_fence *fence = dma_resv_get_excl_rcu(bos[i]->resv);
> +
> +		ret = drm_gem_fence_array_add(deps, fence);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static void panfrost_attach_object_fences(struct drm_gem_object **bos,
> @@ -236,8 +243,10 @@ int panfrost_job_push(struct panfrost_job *job)
>  
>  	kref_get(&job->refcount); /* put by scheduler job completion */
>  
> -	panfrost_acquire_object_fences(job->bos, job->bo_count,
> -				       job->implicit_fences);
> +	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
> +					     &job->deps);
> +	if (ret)
> +		goto unlock;

I think this needs to move above the kref_get() otherwise we'll leak the
job on failure.

>  
>  	drm_sched_entity_push_job(&job->base, entity);
>  
> @@ -254,18 +263,15 @@ static void panfrost_job_cleanup(struct kref *ref)
>  {
>  	struct panfrost_job *job = container_of(ref, struct panfrost_job,
>  						refcount);
> +	struct dma_fence *fence;
> +	unsigned long index;
>  	unsigned int i;
>  
> -	if (job->in_fences) {
> -		for (i = 0; i < job->in_fence_count; i++)
> -			dma_fence_put(job->in_fences[i]);
> -		kvfree(job->in_fences);
> -	}
> -	if (job->implicit_fences) {
> -		for (i = 0; i < job->bo_count; i++)
> -			dma_fence_put(job->implicit_fences[i]);
> -		kvfree(job->implicit_fences);
> +	xa_for_each(&job->deps, index, fence) {
> +		dma_fence_put(fence);
>  	}
> +	xa_destroy(&job->deps);
> +
>  	dma_fence_put(job->done_fence);
>  	dma_fence_put(job->render_done_fence);
>  
> @@ -308,26 +314,9 @@ static struct dma_fence *panfrost_job_dependency(struct drm_sched_job *sched_job
>  						 struct drm_sched_entity *s_entity)
>  {
>  	struct panfrost_job *job = to_panfrost_job(sched_job);
> -	struct dma_fence *fence;
> -	unsigned int i;
>  
> -	/* Explicit fences */
> -	for (i = 0; i < job->in_fence_count; i++) {
> -		if (job->in_fences[i]) {
> -			fence = job->in_fences[i];
> -			job->in_fences[i] = NULL;
> -			return fence;
> -		}
> -	}
> -
> -	/* Implicit fences, max. one per BO */
> -	for (i = 0; i < job->bo_count; i++) {
> -		if (job->implicit_fences[i]) {
> -			fence = job->implicit_fences[i];
> -			job->implicit_fences[i] = NULL;
> -			return fence;
> -		}
> -	}
> +	if (!xa_empty(&job->deps))
> +		return xa_erase(&job->deps, job->last_dep++);

Rather than tracking last_dep separately this could be written using
xa_find():

    if (xa_find(&job->deps, &i, ULONG_MAX, XA_PRESENT))
	return xa_erase(&job->deps, &i);

Steve

>  
>  	return NULL;
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> index bbd3ba97ff67..82306a03b57e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -19,9 +19,9 @@ struct panfrost_job {
>  	struct panfrost_device *pfdev;
>  	struct panfrost_file_priv *file_priv;
>  
> -	/* Optional fences userspace can pass in for the job to depend on. */
> -	struct dma_fence **in_fences;
> -	u32 in_fence_count;
> +	/* Contains both explicit and implicit fences */
> +	struct xarray deps;
> +	unsigned long last_dep;
>  
>  	/* Fence to be signaled by IRQ handler when the job is complete. */
>  	struct dma_fence *done_fence;
> @@ -30,8 +30,6 @@ struct panfrost_job {
>  	__u32 requirements;
>  	__u32 flush_id;
>  
> -	/* Exclusive fences we have taken from the BOs to wait for */
> -	struct dma_fence **implicit_fences;
>  	struct panfrost_gem_mapping **mappings;
>  	struct drm_gem_object **bos;
>  	u32 bo_count;
> 

