Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693DAAD768C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 17:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C750310E8AD;
	Thu, 12 Jun 2025 15:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 27F3510E1A3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 15:40:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95DC81C25;
 Thu, 12 Jun 2025 08:40:37 -0700 (PDT)
Received: from [10.1.37.36] (e122027.cambridge.arm.com [10.1.37.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FB973F66E;
 Thu, 12 Jun 2025 08:40:56 -0700 (PDT)
Message-ID: <4ef8f654-201f-4ab6-b895-9d85f61d7aa7@arm.com>
Date: Thu, 12 Jun 2025 16:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/panthor: Make the timeout per-queue instead of
 per-job
To: Ashley Smith <ashley.smith@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 "open list:ARM MALI PANTHOR DRM DRIVER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250603094952.4188093-1-ashley.smith@collabora.com>
 <20250603094952.4188093-3-ashley.smith@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250603094952.4188093-3-ashley.smith@collabora.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/06/2025 10:49, Ashley Smith wrote:
> The timeout logic provided by drm_sched leads to races when we try
> to suspend it while the drm_sched workqueue queues more jobs. Let's
> overhaul the timeout handling in panthor to have our own delayed work
> that's resumed/suspended when a group is resumed/suspended. When an
> actual timeout occurs, we call drm_sched_fault() to report it
> through drm_sched, still. But otherwise, the drm_sched timeout is
> disabled (set to MAX_SCHEDULE_TIMEOUT), which leaves us in control of
> how we protect modifications on the timer.
> 
> One issue seems to be when we call drm_sched_suspend_timeout() from
> both queue_run_job() and tick_work() which could lead to races due to
> drm_sched_suspend_timeout() not having a lock. Another issue seems to
> be in queue_run_job() if the group is not scheduled, we suspend the
> timeout again which undoes what drm_sched_job_begin() did when calling
> drm_sched_start_timeout(). So the timeout does not reset when a job
> is finished.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> ---
> Signed-off-by: Ashley Smith <ashley.smith@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 233 +++++++++++++++++-------
>  1 file changed, 167 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 65d8ae3dcac1..fb5a66ca5384 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -360,17 +360,20 @@ struct panthor_queue {
>  	/** @entity: DRM scheduling entity used for this queue. */
>  	struct drm_sched_entity entity;
>  
> -	/**
> -	 * @remaining_time: Time remaining before the job timeout expires.
> -	 *
> -	 * The job timeout is suspended when the queue is not scheduled by the
> -	 * FW. Every time we suspend the timer, we need to save the remaining
> -	 * time so we can restore it later on.
> -	 */
> -	unsigned long remaining_time;
> +	/** @timeout: Queue timeout related fields. */
> +	struct {
> +		/** @timeout.work: Work executed when a queue timeout occurs. */
> +		struct delayed_work work;
>  
> -	/** @timeout_suspended: True if the job timeout was suspended. */
> -	bool timeout_suspended;
> +		/**
> +		 * @timeout.remaining: Time remaining before a queue timeout.
> +		 *
> +		 * When the timer is running, this value is set to MAX_SCHEDULE_TIMEOUT.
> +		 * When the timer is suspended, it's set to the time remaining when the
> +		 * timer was suspended.
> +		 */
> +		unsigned long remaining;
> +	} timeout;
>  
>  	/**
>  	 * @doorbell_id: Doorbell assigned to this queue.
> @@ -1031,6 +1034,82 @@ group_unbind_locked(struct panthor_group *group)
>  	return 0;
>  }
>  
> +static bool
> +group_is_idle(struct panthor_group *group)
> +{
> +	struct panthor_device *ptdev = group->ptdev;
> +	u32 inactive_queues;
> +
> +	if (group->csg_id >= 0)
> +		return ptdev->scheduler->csg_slots[group->csg_id].idle;
> +
> +	inactive_queues = group->idle_queues | group->blocked_queues;
> +	return hweight32(inactive_queues) == group->queue_count;
> +}
> +
> +static void
> +queue_suspend_timeout(struct panthor_queue *queue)
> +{
> +	unsigned long qtimeout, now;
> +	struct panthor_group *group;
> +	struct panthor_job *job;
> +	bool timer_was_active;
> +
> +	spin_lock(&queue->fence_ctx.lock);
> +
> +	/* Already suspended, nothing to do. */
> +	if (queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT)
> +		goto out_unlock;
> +
> +	job = list_first_entry_or_null(&queue->fence_ctx.in_flight_jobs,
> +				       struct panthor_job, node);
> +	group = job ? job->group : NULL;
> +
> +	/* If the queue is blocked and the group is idle, we want the timer to
> +	 * keep running because the group can't be unblocked by other queues,
> +	 * so it has to come from an external source, and we want to timebox
> +	 * this external signalling.
> +	 */
> +	if (group && (group->blocked_queues & BIT(job->queue_idx)) &&
> +	    group_is_idle(group))
> +		goto out_unlock;
> +
> +	now = jiffies;
> +	qtimeout = queue->timeout.work.timer.expires;
> +
> +	/* Cancel the timer. */
> +	timer_was_active = cancel_delayed_work(&queue->timeout.work);
> +	if (!timer_was_active || !job)
> +		queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
> +	else if (time_after(qtimeout, now))
> +		queue->timeout.remaining = qtimeout - now;
> +	else
> +		queue->timeout.remaining = 0;
> +
> +	if (WARN_ON_ONCE(queue->timeout.remaining > msecs_to_jiffies(JOB_TIMEOUT_MS)))
> +		queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
> +
> +out_unlock:
> +	spin_unlock(&queue->fence_ctx.lock);
> +}
> +
> +static void
> +queue_resume_timeout(struct panthor_queue *queue)
> +{
> +	spin_lock(&queue->fence_ctx.lock);
> +
> +	/* When running, the remaining time is set to MAX_SCHEDULE_TIMEOUT. */
> +	if (queue->timeout.remaining != MAX_SCHEDULE_TIMEOUT) {
> +		mod_delayed_work(queue->scheduler.timeout_wq,
> +				 &queue->timeout.work,
> +				 queue->timeout.remaining);
> +
> +		queue->timeout.remaining = MAX_SCHEDULE_TIMEOUT;
> +	}
> +
> +	spin_unlock(&queue->fence_ctx.lock);
> +}
> +
>  /**
>   * cs_slot_prog_locked() - Program a queue slot
>   * @ptdev: Device.
> @@ -1069,10 +1148,8 @@ cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
>  			       CS_IDLE_EMPTY |
>  			       CS_STATE_MASK |
>  			       CS_EXTRACT_EVENT);
> -	if (queue->iface.input->insert != queue->iface.input->extract && queue->timeout_suspended) {
> -		drm_sched_resume_timeout(&queue->scheduler, queue->remaining_time);
> -		queue->timeout_suspended = false;
> -	}
> +	if (queue->iface.input->insert != queue->iface.input->extract)
> +		queue_resume_timeout(queue);
>  }
>  
>  /**
> @@ -1099,14 +1176,7 @@ cs_slot_reset_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
>  			       CS_STATE_STOP,
>  			       CS_STATE_MASK);
>  
> -	/* If the queue is blocked, we want to keep the timeout running, so
> -	 * we can detect unbounded waits and kill the group when that happens.
> -	 */
> -	if (!(group->blocked_queues & BIT(cs_id)) && !queue->timeout_suspended) {
> -		queue->remaining_time = drm_sched_suspend_timeout(&queue->scheduler);
> -		queue->timeout_suspended = true;
> -		WARN_ON(queue->remaining_time > msecs_to_jiffies(JOB_TIMEOUT_MS));
> -	}
> +	queue_suspend_timeout(queue);
>  
>  	return 0;
>  }
> @@ -1888,19 +1958,6 @@ tick_ctx_is_full(const struct panthor_scheduler *sched,
>  	return ctx->group_count == sched->csg_slot_count;
>  }
>  
> -static bool
> -group_is_idle(struct panthor_group *group)
> -{
> -	struct panthor_device *ptdev = group->ptdev;
> -	u32 inactive_queues;
> -
> -	if (group->csg_id >= 0)
> -		return ptdev->scheduler->csg_slots[group->csg_id].idle;
> -
> -	inactive_queues = group->idle_queues | group->blocked_queues;
> -	return hweight32(inactive_queues) == group->queue_count;
> -}
> -
>  static bool
>  group_can_run(struct panthor_group *group)
>  {
> @@ -2897,35 +2954,50 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>  	xa_unlock(&gpool->xa);
>  }
>  
> -static void group_sync_upd_work(struct work_struct *work)
> +static bool queue_check_job_completion(struct panthor_queue *queue)
>  {
> -	struct panthor_group *group =
> -		container_of(work, struct panthor_group, sync_upd_work);
> +	struct panthor_syncobj_64b *syncobj = NULL;
>  	struct panthor_job *job, *job_tmp;
> +	bool cookie, progress = false;
>  	LIST_HEAD(done_jobs);
> -	u32 queue_idx;
> -	bool cookie;
>  
>  	cookie = dma_fence_begin_signalling();
> -	for (queue_idx = 0; queue_idx < group->queue_count; queue_idx++) {
> -		struct panthor_queue *queue = group->queues[queue_idx];
> -		struct panthor_syncobj_64b *syncobj;
> +	spin_lock(&queue->fence_ctx.lock);
> +	list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_jobs, node) {
> +		if (!syncobj) {
> +			struct panthor_group *group = job->group;
>  
> -		if (!queue)
> -			continue;
> +			syncobj = group->syncobjs->kmap +
> +				  (job->queue_idx * sizeof(*syncobj));
> +		}
>  
> -		syncobj = group->syncobjs->kmap + (queue_idx * sizeof(*syncobj));
> +		if (syncobj->seqno < job->done_fence->seqno)
> +			break;
>  
> -		spin_lock(&queue->fence_ctx.lock);
> -		list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_jobs, node) {
> -			if (syncobj->seqno < job->done_fence->seqno)
> -				break;
> +		list_move_tail(&job->node, &done_jobs);
> +		dma_fence_signal_locked(job->done_fence);
> +	}
>  
> -			list_move_tail(&job->node, &done_jobs);
> -			dma_fence_signal_locked(job->done_fence);
> -		}
> -		spin_unlock(&queue->fence_ctx.lock);
> +	if (list_empty(&queue->fence_ctx.in_flight_jobs)) {
> +		/* If we have no job left, we cancel the timer, and reset remaining
> +		 * time to its default so it can be restarted next time
> +		 * queue_resume_timeout() is called.
> +		 */
> +		cancel_delayed_work(&queue->timeout.work);
> +		queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
> +
> +		/* If there's no job pending, we consider it progress to avoid a
> +		 * spurious timeout if the timeout handler and the sync update
> +		 * handler raced.
> +		 */
> +		progress = true;
> +	} else if (!list_empty(&done_jobs)) {
> +		mod_delayed_work(queue->scheduler.timeout_wq,
> +				 &queue->timeout.work,
> +				 msecs_to_jiffies(JOB_TIMEOUT_MS));
> +		progress = true;
>  	}
> +	spin_unlock(&queue->fence_ctx.lock);
>  	dma_fence_end_signalling(cookie);
>  
>  	list_for_each_entry_safe(job, job_tmp, &done_jobs, node) {
> @@ -2935,6 +3007,27 @@ static void group_sync_upd_work(struct work_struct *work)
>  		panthor_job_put(&job->base);
>  	}
>  
> +	return progress;
> +}
> +
> +static void group_sync_upd_work(struct work_struct *work)
> +{
> +	struct panthor_group *group =
> +		container_of(work, struct panthor_group, sync_upd_work);
> +	u32 queue_idx;
> +	bool cookie;
> +
> +	cookie = dma_fence_begin_signalling();
> +	for (queue_idx = 0; queue_idx < group->queue_count; queue_idx++) {
> +		struct panthor_queue *queue = group->queues[queue_idx];
> +
> +		if (!queue)
> +			continue;
> +
> +		queue_check_job_completion(queue);
> +	}
> +	dma_fence_end_signalling(cookie);
> +
>  	group_put(group);
>  }
>  
> @@ -3182,17 +3275,6 @@ queue_run_job(struct drm_sched_job *sched_job)
>  	queue->iface.input->insert = job->ringbuf.end;
>  
>  	if (group->csg_id < 0) {
> -		/* If the queue is blocked, we want to keep the timeout running, so we
> -		 * can detect unbounded waits and kill the group when that happens.
> -		 * Otherwise, we suspend the timeout so the time we spend waiting for
> -		 * a CSG slot is not counted.
> -		 */
> -		if (!(group->blocked_queues & BIT(job->queue_idx)) &&
> -		    !queue->timeout_suspended) {
> -			queue->remaining_time = drm_sched_suspend_timeout(&queue->scheduler);
> -			queue->timeout_suspended = true;
> -		}
> -
>  		group_schedule_locked(group, BIT(job->queue_idx));
>  	} else {
>  		gpu_write(ptdev, CSF_DOORBELL(queue->doorbell_id), 1);
> @@ -3201,6 +3283,7 @@ queue_run_job(struct drm_sched_job *sched_job)
>  			pm_runtime_get(ptdev->base.dev);
>  			sched->pm.has_ref = true;
>  		}
> +		queue_resume_timeout(queue);
>  		panthor_devfreq_record_busy(sched->ptdev);
>  	}
>  
> @@ -3250,6 +3333,11 @@ queue_timedout_job(struct drm_sched_job *sched_job)
>  
>  	queue_start(queue);
>  
> +	/* We already flagged the queue as faulty, make sure we don't get
> +	 * called again.
> +	 */
> +	queue->scheduler.timeout = MAX_SCHEDULE_TIMEOUT;
> +
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
>  
> @@ -3292,6 +3380,17 @@ static u32 calc_profiling_ringbuf_num_slots(struct panthor_device *ptdev,
>  	return DIV_ROUND_UP(cs_ringbuf_size, min_profiled_job_instrs * sizeof(u64));
>  }
>  
> +static void queue_timeout_work(struct work_struct *work)
> +{
> +	struct panthor_queue *queue = container_of(work, struct panthor_queue,
> +						   timeout.work.work);
> +	bool progress;
> +
> +	progress = queue_check_job_completion(queue);
> +	if (!progress)
> +		drm_sched_fault(&queue->scheduler);
> +}
> +
>  static struct panthor_queue *
>  group_create_queue(struct panthor_group *group,
>  		   const struct drm_panthor_queue_create *args)
> @@ -3307,7 +3406,7 @@ group_create_queue(struct panthor_group *group,
>  		 * their profiling status.
>  		 */
>  		.credit_limit = args->ringbuf_size / sizeof(u64),
> -		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> +		.timeout = MAX_SCHEDULE_TIMEOUT,
>  		.timeout_wq = group->ptdev->reset.wq,
>  		.name = "panthor-queue",
>  		.dev = group->ptdev->base.dev,
> @@ -3330,6 +3429,8 @@ group_create_queue(struct panthor_group *group,
>  	if (!queue)
>  		return ERR_PTR(-ENOMEM);
>  
> +	queue->timeout.remaining = msecs_to_jiffies(JOB_TIMEOUT_MS);
> +	INIT_DELAYED_WORK(&queue->timeout.work, queue_timeout_work);
>  	queue->fence_ctx.id = dma_fence_context_alloc(1);
>  	spin_lock_init(&queue->fence_ctx.lock);
>  	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);

