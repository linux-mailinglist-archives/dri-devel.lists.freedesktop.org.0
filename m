Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3423BE592
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 849076E864;
	Wed,  7 Jul 2021 09:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EE06E864
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:26:17 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id o22so1400944wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jul 2021 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=i6ateux68cwXZsdBc8zadsGGhxWMAXIKASP34LjTC4I=;
 b=ZDYAGdXcYtKBYj5hoWHAvqP0cNkXhSYVNmcG1WaAn7/5zhLjD6casd36cF0ERO5WeY
 xEzt9xwPuYeVDOBWyexciZCplsvGYGsmn7TTcbXn2dsYm3AIeDn5eZifZt9w84TUPVcn
 yMRGHzdDlAhdk5KXylOEgiB216OuhaEat+j+aRgf0rmnGgm1X9yHoldQvDPSoFjDiw8s
 NOV01+vzU3w/iifg+Kbc5+0+LzLWPdwwpEyLThBP/3s0ztWhmpbUXR9uhA+4Yh5jXwzd
 ChPvmUNSk7MwUUYN/Snwk4xW4v/Q+XMlTHiUV0uXIOyBY0EI690r35l9BEkBQw3Juovd
 PEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=i6ateux68cwXZsdBc8zadsGGhxWMAXIKASP34LjTC4I=;
 b=YFx/xffzPUVo+l5RqDBhL/YSJP3gGoeliCYTTgsoFSVzAPqv6EJUOtl1+1l0LH86Ad
 PuQ3pmd1BDEgEGh10KCQYKlNVbh03SXd+klDmhDAOA4mbX4Ps932u3L+0pVOXIxSbqLe
 kTNC3IQ4xRB2bMqxfRDVK5kejRK8c6Vfu+NS0T7F3UuwE7qVbGlwJ7rY/6j7uoNOAFRK
 HkKzmrFF/EDGpj3j8KEPE2TexZC35Pwki8hmMAqvJGAPOvXgta17n8OZNuvpMSUw4juz
 2eaL1R8KGq0jENGmXfcb+edZyCI33uMeIIVexqXsQNk4bViBMudoCk/CHsOdH64jDNby
 guTw==
X-Gm-Message-State: AOAM530ZTtwDZU0P0gQrc/3yGYVF0aCgDYLd4PYQn0av65OLJ5xzIG7E
 84DAY69Zw7FvAmM8U2SSBJA=
X-Google-Smtp-Source: ABdhPJy766y3TXDfJ0zZfeRf2ejXi+pLHGt6B99mdicjvF9LbhF8/XD23w3aPTBaVGMkgQlGnkYTlQ==
X-Received: by 2002:a05:600c:19c9:: with SMTP id
 u9mr25185000wmq.124.1625649976364; 
 Wed, 07 Jul 2021 02:26:16 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7671:3328:2129:96b5?
 ([2a02:908:1252:fb60:7671:3328:2129:96b5])
 by smtp.gmail.com with ESMTPSA id x17sm4246968wru.6.2021.07.07.02.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 02:26:15 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH v2 02/11] drm/sched: Add dependency
 tracking
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
 <20210702213815.2249499-3-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f5d59915-af83-4076-c338-d4df68e7d8cd@gmail.com>
Date: Wed, 7 Jul 2021 11:26:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702213815.2249499-3-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, David Airlie <airlied@linux.ie>,
 Steven Price <steven.price@arm.com>, linaro-mm-sig@lists.linaro.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.07.21 um 23:38 schrieb Daniel Vetter:
> Instead of just a callback we can just glue in the gem helpers that
> panfrost, v3d and lima currently use. There's really not that many
> ways to skin this cat.
>
> On the naming bikeshed: The idea for using _await_ to denote adding
> dependencies to a job comes from i915, where that's used quite
> extensively all over the place, in lots of datastructures.
>
> v2: Rebased.
>
> Reviewed-by: Steven Price <steven.price@arm.com> (v1)
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Nirmoy Das <nirmoy.aiemd@gmail.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |  18 +++-
>   drivers/gpu/drm/scheduler/sched_main.c   | 103 +++++++++++++++++++++++
>   include/drm/gpu_scheduler.h              |  31 ++++++-
>   3 files changed, 146 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index f7347c284886..b6f72fafd504 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -211,6 +211,19 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>   	job->sched->ops->free_job(job);
>   }
>   
> +static struct dma_fence *
> +drm_sched_job_dependency(struct drm_sched_job *job,
> +			 struct drm_sched_entity *entity)
> +{
> +	if (!xa_empty(&job->dependencies))
> +		return xa_erase(&job->dependencies, job->last_dependency++);
> +
> +	if (job->sched->ops->dependency)
> +		return job->sched->ops->dependency(job, entity);
> +
> +	return NULL;
> +}
> +
>   /**
>    * drm_sched_entity_kill_jobs - Make sure all remaining jobs are killed
>    *
> @@ -229,7 +242,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
>   		struct drm_sched_fence *s_fence = job->s_fence;
>   
>   		/* Wait for all dependencies to avoid data corruptions */
> -		while ((f = job->sched->ops->dependency(job, entity)))
> +		while ((f = drm_sched_job_dependency(job, entity)))
>   			dma_fence_wait(f, false);
>   
>   		drm_sched_fence_scheduled(s_fence);
> @@ -419,7 +432,6 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>    */
>   struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   {
> -	struct drm_gpu_scheduler *sched = entity->rq->sched;
>   	struct drm_sched_job *sched_job;
>   
>   	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
> @@ -427,7 +439,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>   		return NULL;
>   
>   	while ((entity->dependency =
> -			sched->ops->dependency(sched_job, entity))) {
> +			drm_sched_job_dependency(sched_job, entity))) {
>   		trace_drm_sched_job_wait_dep(sched_job, entity->dependency);
>   
>   		if (drm_sched_entity_add_dependency_cb(entity))
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 5e84e1500c32..12d533486518 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -605,6 +605,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   
>   	INIT_LIST_HEAD(&job->list);
>   
> +	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_sched_job_init);
> @@ -628,6 +630,98 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>   }
>   EXPORT_SYMBOL(drm_sched_job_arm);
>   
> +/**
> + * drm_sched_job_await_fence - adds the fence as a job dependency
> + * @job: scheduler job to add the dependencies to
> + * @fence: the dma_fence to add to the list of dependencies.
> + *
> + * Note that @fence is consumed in both the success and error cases.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_await_fence(struct drm_sched_job *job,
> +			      struct dma_fence *fence)

I'm still not very keen about the naming "await", can't we just call 
this _add_dependency? and _remove_dependency() ?

Christian.

> +{
> +	struct dma_fence *entry;
> +	unsigned long index;
> +	u32 id = 0;
> +	int ret;
> +
> +	if (!fence)
> +		return 0;
> +
> +	/* Deduplicate if we already depend on a fence from the same context.
> +	 * This lets the size of the array of deps scale with the number of
> +	 * engines involved, rather than the number of BOs.
> +	 */
> +	xa_for_each(&job->dependencies, index, entry) {
> +		if (entry->context != fence->context)
> +			continue;
> +
> +		if (dma_fence_is_later(fence, entry)) {
> +			dma_fence_put(entry);
> +			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
> +		} else {
> +			dma_fence_put(fence);
> +		}
> +		return 0;
> +	}
> +
> +	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
> +	if (ret != 0)
> +		dma_fence_put(fence);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_sched_job_await_fence);
> +
> +/**
> + * drm_sched_job_await_implicit - adds implicit dependencies as job dependencies
> + * @job: scheduler job to add the dependencies to
> + * @obj: the gem object to add new dependencies from.
> + * @write: whether the job might write the object (so we need to depend on
> + * shared fences in the reservation object).
> + *
> + * This should be called after drm_gem_lock_reservations() on your array of
> + * GEM objects used in the job but before updating the reservations with your
> + * own fences.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
> +				 struct drm_gem_object *obj,
> +				 bool write)
> +{
> +	int ret;
> +	struct dma_fence **fences;
> +	unsigned int i, fence_count;
> +
> +	if (!write) {
> +		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
> +
> +		return drm_sched_job_await_fence(job, fence);
> +	}
> +
> +	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
> +	if (ret || !fence_count)
> +		return ret;
> +
> +	for (i = 0; i < fence_count; i++) {
> +		ret = drm_sched_job_await_fence(job, fences[i]);
> +		if (ret)
> +			break;
> +	}
> +
> +	for (; i < fence_count; i++)
> +		dma_fence_put(fences[i]);
> +	kfree(fences);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_sched_job_await_implicit);
> +
> +
>   /**
>    * drm_sched_job_cleanup - clean up scheduler job resources
>    * @job: scheduler job to clean up
> @@ -643,6 +737,9 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>    */
>   void drm_sched_job_cleanup(struct drm_sched_job *job)
>   {
> +	struct dma_fence *fence;
> +	unsigned long index;
> +
>   	if (!kref_read(&job->s_fence->finished.refcount)) {
>   		/* drm_sched_job_arm() has been called */
>   		dma_fence_put(&job->s_fence->finished);
> @@ -652,6 +749,12 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>   	}
>   
>   	job->s_fence = NULL;
> +
> +	xa_for_each(&job->dependencies, index, fence) {
> +		dma_fence_put(fence);
> +	}
> +	xa_destroy(&job->dependencies);
> +
>   }
>   EXPORT_SYMBOL(drm_sched_job_cleanup);
>   
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 83afc3aa8e2f..74fb321dbc44 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -27,9 +27,12 @@
>   #include <drm/spsc_queue.h>
>   #include <linux/dma-fence.h>
>   #include <linux/completion.h>
> +#include <linux/xarray.h>
>   
>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>   
> +struct drm_gem_object;
> +
>   struct drm_gpu_scheduler;
>   struct drm_sched_rq;
>   
> @@ -198,6 +201,16 @@ struct drm_sched_job {
>   	enum drm_sched_priority		s_priority;
>   	struct drm_sched_entity         *entity;
>   	struct dma_fence_cb		cb;
> +	/**
> +	 * @dependencies:
> +	 *
> +	 * Contains the dependencies as struct dma_fence for this job, see
> +	 * drm_sched_job_await_fence() and drm_sched_job_await_implicit().
> +	 */
> +	struct xarray			dependencies;
> +
> +	/** @last_dependency: tracks @dependencies as they signal */
> +	unsigned long			last_dependency;
>   };
>   
>   static inline bool drm_sched_invalidate_job(struct drm_sched_job *s_job,
> @@ -220,9 +233,14 @@ enum drm_gpu_sched_stat {
>    */
>   struct drm_sched_backend_ops {
>   	/**
> -         * @dependency: Called when the scheduler is considering scheduling
> -         * this job next, to get another struct dma_fence for this job to
> -	 * block on.  Once it returns NULL, run_job() may be called.
> +	 * @dependency:
> +	 *
> +	 * Called when the scheduler is considering scheduling this job next, to
> +	 * get another struct dma_fence for this job to block on.  Once it
> +	 * returns NULL, run_job() may be called.
> +	 *
> +	 * If a driver exclusively uses drm_sched_job_await_fence() and
> +	 * drm_sched_job_await_implicit() this can be ommitted and left as NULL.
>   	 */
>   	struct dma_fence *(*dependency)(struct drm_sched_job *sched_job,
>   					struct drm_sched_entity *s_entity);
> @@ -349,6 +367,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
>   		       struct drm_sched_entity *entity,
>   		       void *owner);
>   void drm_sched_job_arm(struct drm_sched_job *job);
> +int drm_sched_job_await_fence(struct drm_sched_job *job,
> +			      struct dma_fence *fence);
> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
> +				 struct drm_gem_object *obj,
> +				 bool write);
> +
> +
>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   				    struct drm_gpu_scheduler **sched_list,
>                                      unsigned int num_sched_list);

