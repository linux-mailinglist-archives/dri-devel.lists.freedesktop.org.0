Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BCE7DF0F5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 12:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6B410E84E;
	Thu,  2 Nov 2023 11:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BC010E08E;
 Thu,  2 Nov 2023 11:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698923599; x=1730459599;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RLyEWX8TvJFkG2chanYaLE/sEHjJuTgNzqkdVGmw6Vc=;
 b=Ifyx/bqK8GXnHT6APwwvOEAJsx7KJW51fJ5W865lRQjFjfE9naqeL9p2
 O4ejVxNPyBc+XTHwRJJpHlc4rEY2vEX4mTHtYGSjUjOCdKBo6zyUaGUa0
 TX/4yvDTY+FiXSKbXh5nUN4PFJUJ73BiOxNY1uEqnkYlz5Qyn7yUcVLkl
 QkgBkdb4YbLWq3TZTdnMbIpVAsocGrg8ZRCVTTWBLTRee0pzf9ktyhqrL
 Ci84GFUrVDkyvTMsesjTSb60pXxwXc4riybWqXfWoRqbJ6UfJjtqf1pmy
 isoC6EhcUg7Q+kURO1o3wUWjK3XtB5rAKirpfUb3th95l99qUufNhA6ez Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="474930788"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="474930788"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 04:13:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="2399375"
Received: from stevenwo-mobl1.ger.corp.intel.com (HELO [10.213.233.30])
 ([10.213.233.30])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 04:13:16 -0700
Message-ID: <bb7c307e-271c-4f4c-bdbc-7078972ba515@linux.intel.com>
Date: Thu, 2 Nov 2023 11:13:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] drm/sched: Split free_job into own work item
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20231031032439.1558703-1-matthew.brost@intel.com>
 <20231031032439.1558703-4-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20231031032439.1558703-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ltuikov@yahoo.com, ketil.johnsen@arm.com,
 lina@asahilina.net, mcanal@igalia.com, Liviu.Dudau@arm.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 31/10/2023 03:24, Matthew Brost wrote:
> Rather than call free_job and run_job in same work item have a dedicated
> work item for each. This aligns with the design and intended use of work
> queues.
> 
> v2:
>     - Test for DMA_FENCE_FLAG_TIMESTAMP_BIT before setting
>       timestamp in free_job() work item (Danilo)
> v3:
>    - Drop forward dec of drm_sched_select_entity (Boris)
>    - Return in drm_sched_run_job_work if entity NULL (Boris)
> v4:
>    - Replace dequeue with peek and invert logic (Luben)
>    - Wrap to 100 lines (Luben)
>    - Update comments for *_queue / *_queue_if_ready functions (Luben)
> v5:
>    - Drop peek argument, blindly reinit idle (Luben)
>    - s/drm_sched_free_job_queue_if_ready/drm_sched_free_job_queue_if_done (Luben)
>    - Update work_run_job & work_free_job kernel doc (Luben)
> v6:
>    - Do not move drm_sched_select_entity in file (Luben)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 146 +++++++++++++++++--------
>   include/drm/gpu_scheduler.h            |   4 +-
>   2 files changed, 101 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index d1ae05bded15..3b1b2f8eafe8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -265,6 +265,32 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>   		queue_work(sched->submit_wq, &sched->work_run_job);
>   }
>   
> +/**
> + * drm_sched_free_job_queue - enqueue free-job work
> + * @sched: scheduler instance
> + */
> +static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
> +{
> +	if (!READ_ONCE(sched->pause_submit))
> +		queue_work(sched->submit_wq, &sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
> +{
> +	struct drm_sched_job *job;
> +
> +	spin_lock(&sched->job_list_lock);
> +	job = list_first_entry_or_null(&sched->pending_list,
> +				       struct drm_sched_job, list);
> +	if (job && dma_fence_is_signaled(&job->s_fence->finished))
> +		drm_sched_free_job_queue(sched);
> +	spin_unlock(&sched->job_list_lock);
> +}
> +
>   /**
>    * drm_sched_job_done - complete a job
>    * @s_job: pointer to the job which is done
> @@ -284,7 +310,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
>   	dma_fence_get(&s_fence->finished);
>   	drm_sched_fence_finished(s_fence, result);
>   	dma_fence_put(&s_fence->finished);
> -	drm_sched_run_job_queue(sched);
> +	drm_sched_free_job_queue(sched);
>   }
>   
>   /**
> @@ -943,8 +969,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>   						typeof(*next), list);
>   
>   		if (next) {
> -			next->s_fence->scheduled.timestamp =
> -				dma_fence_timestamp(&job->s_fence->finished);
> +			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +				     &next->s_fence->scheduled.flags))
> +				next->s_fence->scheduled.timestamp =
> +					dma_fence_timestamp(&job->s_fence->finished);
>   			/* start TO timer for next job */
>   			drm_sched_start_timeout(sched);
>   		}
> @@ -994,7 +1022,40 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   EXPORT_SYMBOL(drm_sched_pick_best);
>   
>   /**
> - * drm_sched_run_job_work - main scheduler thread
> + * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
> + * @sched: scheduler instance
> + */
> +static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
> +{
> +	if (drm_sched_select_entity(sched))
> +		drm_sched_run_job_queue(sched);
> +}
> +
> +/**
> + * drm_sched_free_job_work - worker to call free_job
> + *
> + * @w: free job work
> + */
> +static void drm_sched_free_job_work(struct work_struct *w)
> +{
> +	struct drm_gpu_scheduler *sched =
> +		container_of(w, struct drm_gpu_scheduler, work_free_job);
> +	struct drm_sched_job *cleanup_job;
> +
> +	if (READ_ONCE(sched->pause_submit))
> +		return;
> +
> +	cleanup_job = drm_sched_get_cleanup_job(sched);
> +	if (cleanup_job) {
> +		sched->ops->free_job(cleanup_job);
> +
> +		drm_sched_free_job_queue_if_done(sched);
> +		drm_sched_run_job_queue_if_ready(sched);

Are finished jobs now disturbing the round robin selection?

Every time this cleans up a job we get:

drm_sched_run_job_queue_if_ready
  -> drm_sched_select_entity
      -> drm_sched_rq_select_entity_rr
          -> rq->current_entity bumped to next in list

So when the job run worker does:

	entity = drm_sched_select_entity(sched);

It does not pick the same entity as before this patch? If so perhaps 
drm_sched_run_job_queue_if_ready needs a "peek" helper which does not 
modify any state.

Regards,

Tvrtko

> +	}
> +}
> +
> +/**
> + * drm_sched_run_job_work - worker to call run_job
>    *
>    * @w: run job work
>    */
> @@ -1003,65 +1064,51 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	struct drm_gpu_scheduler *sched =
>   		container_of(w, struct drm_gpu_scheduler, work_run_job);
>   	struct drm_sched_entity *entity;
> -	struct drm_sched_job *cleanup_job;
> +	struct dma_fence *fence;
> +	struct drm_sched_fence *s_fence;
> +	struct drm_sched_job *sched_job;
>   	int r;
>   
>   	if (READ_ONCE(sched->pause_submit))
>   		return;
>   
> -	cleanup_job = drm_sched_get_cleanup_job(sched);
>   	entity = drm_sched_select_entity(sched);
> +	if (!entity)
> +		return;
>   
> -	if (!entity && !cleanup_job)
> +	sched_job = drm_sched_entity_pop_job(entity);
> +	if (!sched_job) {
> +		complete_all(&entity->entity_idle);
>   		return;	/* No more work */
> +	}
>   
> -	if (cleanup_job)
> -		sched->ops->free_job(cleanup_job);
> -
> -	if (entity) {
> -		struct dma_fence *fence;
> -		struct drm_sched_fence *s_fence;
> -		struct drm_sched_job *sched_job;
> -
> -		sched_job = drm_sched_entity_pop_job(entity);
> -		if (!sched_job) {
> -			complete_all(&entity->entity_idle);
> -			if (!cleanup_job)
> -				return;	/* No more work */
> -			goto again;
> -		}
> -
> -		s_fence = sched_job->s_fence;
> -
> -		atomic_inc(&sched->hw_rq_count);
> -		drm_sched_job_begin(sched_job);
> +	s_fence = sched_job->s_fence;
>   
> -		trace_drm_run_job(sched_job, entity);
> -		fence = sched->ops->run_job(sched_job);
> -		complete_all(&entity->entity_idle);
> -		drm_sched_fence_scheduled(s_fence, fence);
> +	atomic_inc(&sched->hw_rq_count);
> +	drm_sched_job_begin(sched_job);
>   
> -		if (!IS_ERR_OR_NULL(fence)) {
> -			/* Drop for original kref_init of the fence */
> -			dma_fence_put(fence);
> +	trace_drm_run_job(sched_job, entity);
> +	fence = sched->ops->run_job(sched_job);
> +	complete_all(&entity->entity_idle);
> +	drm_sched_fence_scheduled(s_fence, fence);
>   
> -			r = dma_fence_add_callback(fence, &sched_job->cb,
> -						   drm_sched_job_done_cb);
> -			if (r == -ENOENT)
> -				drm_sched_job_done(sched_job, fence->error);
> -			else if (r)
> -				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
> -					  r);
> -		} else {
> -			drm_sched_job_done(sched_job, IS_ERR(fence) ?
> -					   PTR_ERR(fence) : 0);
> -		}
> +	if (!IS_ERR_OR_NULL(fence)) {
> +		/* Drop for original kref_init of the fence */
> +		dma_fence_put(fence);
>   
> -		wake_up(&sched->job_scheduled);
> +		r = dma_fence_add_callback(fence, &sched_job->cb,
> +					   drm_sched_job_done_cb);
> +		if (r == -ENOENT)
> +			drm_sched_job_done(sched_job, fence->error);
> +		else if (r)
> +			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +	} else {
> +		drm_sched_job_done(sched_job, IS_ERR(fence) ?
> +				   PTR_ERR(fence) : 0);
>   	}
>   
> -again:
> -	drm_sched_run_job_queue(sched);
> +	wake_up(&sched->job_scheduled);
> +	drm_sched_run_job_queue_if_ready(sched);
>   }
>   
>   /**
> @@ -1145,6 +1192,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	atomic_set(&sched->hw_rq_count, 0);
>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>   	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> +	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>   	atomic_set(&sched->_score, 0);
>   	atomic64_set(&sched->job_id_count, 0);
>   	sched->pause_submit = false;
> @@ -1274,6 +1322,7 @@ void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, true);
>   	cancel_work_sync(&sched->work_run_job);
> +	cancel_work_sync(&sched->work_free_job);
>   }
>   EXPORT_SYMBOL(drm_sched_wqueue_stop);
>   
> @@ -1286,5 +1335,6 @@ void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, false);
>   	queue_work(sched->submit_wq, &sched->work_run_job);
> +	queue_work(sched->submit_wq, &sched->work_free_job);
>   }
>   EXPORT_SYMBOL(drm_sched_wqueue_start);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e0e7c4eb57d9..677ba96759ab 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -479,9 +479,10 @@ struct drm_sched_backend_ops {
>    *                 finished.
>    * @hw_rq_count: the number of jobs currently in the hardware queue.
>    * @job_id_count: used to assign unique id to the each job.
> - * @submit_wq: workqueue used to queue @work_run_job
> + * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
>    * @timeout_wq: workqueue used to queue @work_tdr
>    * @work_run_job: work which calls run_job op of each scheduler.
> + * @work_free_job: work which calls free_job op of each scheduler.
>    * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
>    *            timeout interval is over.
>    * @pending_list: the list of jobs which are currently in the job queue.
> @@ -511,6 +512,7 @@ struct drm_gpu_scheduler {
>   	struct workqueue_struct		*submit_wq;
>   	struct workqueue_struct		*timeout_wq;
>   	struct work_struct		work_run_job;
> +	struct work_struct		work_free_job;
>   	struct delayed_work		work_tdr;
>   	struct list_head		pending_list;
>   	spinlock_t			job_list_lock;
