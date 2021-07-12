Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA513C4637
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 11:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DC289B96;
	Mon, 12 Jul 2021 09:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 432D689BC2;
 Mon, 12 Jul 2021 09:19:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C9B81FB;
 Mon, 12 Jul 2021 02:19:19 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C37623F694;
 Mon, 12 Jul 2021 02:19:17 -0700 (PDT)
Subject: Re: [PATCH v3 07/20] drm/panfrost: use scheduler dependency tracking
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
 <20210708173754.3877540-8-daniel.vetter@ffwll.ch>
From: Steven Price <steven.price@arm.com>
Message-ID: <e8dad16d-c89c-5fec-cd7f-fd9649d74201@arm.com>
Date: Mon, 12 Jul 2021 10:19:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708173754.3877540-8-daniel.vetter@ffwll.ch>
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2021 18:37, Daniel Vetter wrote:
> Just deletes some code that's now more shared.
> 
> Note that thanks to the split into drm_sched_job_init/arm we can now
> easily pull the _init() part from under the submission lock way ahead
> where we're adding the sync file in-fences as dependencies.
> 
> v2: Correctly clean up the partially set up job, now that job_init()
> and job_arm() are apart (Emma).
> 
> Reviewed-by: Steven Price <steven.price@arm.com> (v1)

v2/v3 are also:

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 16 ++++++++---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 37 +++----------------------
>  drivers/gpu/drm/panfrost/panfrost_job.h |  5 +---
>  3 files changed, 17 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 1ffaef5ec5ff..9f53bea07d61 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -218,7 +218,7 @@ panfrost_copy_in_sync(struct drm_device *dev,
>  		if (ret)
>  			goto fail;
>  
> -		ret = drm_gem_fence_array_add(&job->deps, fence);
> +		ret = drm_sched_job_await_fence(&job->base, fence);
>  
>  		if (ret)
>  			goto fail;
> @@ -236,7 +236,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	struct drm_panfrost_submit *args = data;
>  	struct drm_syncobj *sync_out = NULL;
>  	struct panfrost_job *job;
> -	int ret = 0;
> +	int ret = 0, slot;
>  
>  	if (!args->jc)
>  		return -EINVAL;
> @@ -258,14 +258,20 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  
>  	kref_init(&job->refcount);
>  
> -	xa_init_flags(&job->deps, XA_FLAGS_ALLOC);
> -
>  	job->pfdev = pfdev;
>  	job->jc = args->jc;
>  	job->requirements = args->requirements;
>  	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
>  	job->file_priv = file->driver_priv;
>  
> +	slot = panfrost_job_get_slot(job);
> +
> +	ret = drm_sched_job_init(&job->base,
> +				 &job->file_priv->sched_entity[slot],
> +				 NULL);
> +	if (ret)
> +		goto fail_job_put;
> +
>  	ret = panfrost_copy_in_sync(dev, file, args, job);
>  	if (ret)
>  		goto fail_job;
> @@ -283,6 +289,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  		drm_syncobj_replace_fence(sync_out, job->render_done_fence);
>  
>  fail_job:
> +	drm_sched_job_cleanup(&job->base);
> +fail_job_put:
>  	panfrost_job_put(job);
>  fail_out_sync:
>  	if (sync_out)
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 4bc962763e1f..86c843d8822e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -102,7 +102,7 @@ static struct dma_fence *panfrost_fence_create(struct panfrost_device *pfdev, in
>  	return &fence->base;
>  }
>  
> -static int panfrost_job_get_slot(struct panfrost_job *job)
> +int panfrost_job_get_slot(struct panfrost_job *job)
>  {
>  	/* JS0: fragment jobs.
>  	 * JS1: vertex/tiler jobs
> @@ -242,13 +242,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
>  
>  static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
>  					  int bo_count,
> -					  struct xarray *deps)
> +					  struct drm_sched_job *job)
>  {
>  	int i, ret;
>  
>  	for (i = 0; i < bo_count; i++) {
>  		/* panfrost always uses write mode in its current uapi */
> -		ret = drm_gem_fence_array_add_implicit(deps, bos[i], true);
> +		ret = drm_sched_job_await_implicit(job, bos[i], true);
>  		if (ret)
>  			return ret;
>  	}
> @@ -269,31 +269,21 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
>  int panfrost_job_push(struct panfrost_job *job)
>  {
>  	struct panfrost_device *pfdev = job->pfdev;
> -	int slot = panfrost_job_get_slot(job);
> -	struct drm_sched_entity *entity = &job->file_priv->sched_entity[slot];
>  	struct ww_acquire_ctx acquire_ctx;
>  	int ret = 0;
>  
> -
>  	ret = drm_gem_lock_reservations(job->bos, job->bo_count,
>  					    &acquire_ctx);
>  	if (ret)
>  		return ret;
>  
>  	mutex_lock(&pfdev->sched_lock);
> -
> -	ret = drm_sched_job_init(&job->base, entity, NULL);
> -	if (ret) {
> -		mutex_unlock(&pfdev->sched_lock);
> -		goto unlock;
> -	}
> -
>  	drm_sched_job_arm(&job->base);
>  
>  	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>  
>  	ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
> -					     &job->deps);
> +					     &job->base);
>  	if (ret) {
>  		mutex_unlock(&pfdev->sched_lock);
>  		goto unlock;
> @@ -318,15 +308,8 @@ static void panfrost_job_cleanup(struct kref *ref)
>  {
>  	struct panfrost_job *job = container_of(ref, struct panfrost_job,
>  						refcount);
> -	struct dma_fence *fence;
> -	unsigned long index;
>  	unsigned int i;
>  
> -	xa_for_each(&job->deps, index, fence) {
> -		dma_fence_put(fence);
> -	}
> -	xa_destroy(&job->deps);
> -
>  	dma_fence_put(job->done_fence);
>  	dma_fence_put(job->render_done_fence);
>  
> @@ -365,17 +348,6 @@ static void panfrost_job_free(struct drm_sched_job *sched_job)
>  	panfrost_job_put(job);
>  }
>  
> -static struct dma_fence *panfrost_job_dependency(struct drm_sched_job *sched_job,
> -						 struct drm_sched_entity *s_entity)
> -{
> -	struct panfrost_job *job = to_panfrost_job(sched_job);
> -
> -	if (!xa_empty(&job->deps))
> -		return xa_erase(&job->deps, job->last_dep++);
> -
> -	return NULL;
> -}
> -
>  static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
>  {
>  	struct panfrost_job *job = to_panfrost_job(sched_job);
> @@ -765,7 +737,6 @@ static void panfrost_reset_work(struct work_struct *work)
>  }
>  
>  static const struct drm_sched_backend_ops panfrost_sched_ops = {
> -	.dependency = panfrost_job_dependency,
>  	.run_job = panfrost_job_run,
>  	.timedout_job = panfrost_job_timedout,
>  	.free_job = panfrost_job_free
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> index 82306a03b57e..77e6d0e6f612 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -19,10 +19,6 @@ struct panfrost_job {
>  	struct panfrost_device *pfdev;
>  	struct panfrost_file_priv *file_priv;
>  
> -	/* Contains both explicit and implicit fences */
> -	struct xarray deps;
> -	unsigned long last_dep;
> -
>  	/* Fence to be signaled by IRQ handler when the job is complete. */
>  	struct dma_fence *done_fence;
>  
> @@ -42,6 +38,7 @@ int panfrost_job_init(struct panfrost_device *pfdev);
>  void panfrost_job_fini(struct panfrost_device *pfdev);
>  int panfrost_job_open(struct panfrost_file_priv *panfrost_priv);
>  void panfrost_job_close(struct panfrost_file_priv *panfrost_priv);
> +int panfrost_job_get_slot(struct panfrost_job *job);
>  int panfrost_job_push(struct panfrost_job *job);
>  void panfrost_job_put(struct panfrost_job *job);
>  void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
> 

