Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B237E3E17A8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 17:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3216EAC8;
	Thu,  5 Aug 2021 15:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044586EAC8;
 Thu,  5 Aug 2021 15:10:51 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:1010:b067:a83:f7:84ff:f2af:72c9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 532D81F44159;
 Thu,  5 Aug 2021 16:10:45 +0100 (BST)
Date: Thu, 5 Aug 2021 11:10:38 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>, Steven Price <steven.price@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian K??nig <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 07/20] drm/panfrost: use scheduler dependency tracking
Message-ID: <YQv/biyC3WXd1gla@maud>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-8-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805104705.862416-8-daniel.vetter@ffwll.ch>
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

Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Thu, Aug 05, 2021 at 12:46:52PM +0200, Daniel Vetter wrote:
> Just deletes some code that's now more shared.
> 
> Note that thanks to the split into drm_sched_job_init/arm we can now
> easily pull the _init() part from under the submission lock way ahead
> where we're adding the sync file in-fences as dependencies.
> 
> v2: Correctly clean up the partially set up job, now that job_init()
> and job_arm() are apart (Emma).
> 
> v3: Rebased over renamed functions for adding depdencies
> 
> Acked-by: Emma Anholt <emma@anholt.net>
> Reviewed-by: Steven Price <steven.price@arm.com> (v3)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K??nig" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: Emma Anholt <emma@anholt.net>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 16 ++++++++---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 38 ++++---------------------
>  drivers/gpu/drm/panfrost/panfrost_job.h |  5 +---
>  3 files changed, 18 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 1ffaef5ec5ff..16212b6b202e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -218,7 +218,7 @@ panfrost_copy_in_sync(struct drm_device *dev,
>  		if (ret)
>  			goto fail;
>  
> -		ret = drm_gem_fence_array_add(&job->deps, fence);
> +		ret = drm_sched_job_add_dependency(&job->base, fence);
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
> index 4bc962763e1f..a98f507dc779 100644
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
> @@ -242,13 +242,14 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
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
> +		ret = drm_sched_job_add_implicit_dependencies(job, bos[i],
> +							      true);
>  		if (ret)
>  			return ret;
>  	}
> @@ -269,31 +270,21 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
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
> @@ -318,15 +309,8 @@ static void panfrost_job_cleanup(struct kref *ref)
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
> @@ -365,17 +349,6 @@ static void panfrost_job_free(struct drm_sched_job *sched_job)
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
> @@ -765,7 +738,6 @@ static void panfrost_reset_work(struct work_struct *work)
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
> -- 
> 2.32.0
> 
