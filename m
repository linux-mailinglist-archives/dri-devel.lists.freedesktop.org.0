Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 578692C3ECD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 12:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97FB6E89D;
	Wed, 25 Nov 2020 11:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 23F578972B;
 Wed, 25 Nov 2020 11:09:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74109106F;
 Wed, 25 Nov 2020 03:09:11 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47DE03F70D;
 Wed, 25 Nov 2020 03:09:10 -0800 (PST)
Subject: Re: [PATCH 6/6] drm/sched: Make use of a "done" thread
To: Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-7-luben.tuikov@amd.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <6bdf3f46-effb-dea9-fffe-d8c78612d9ff@arm.com>
Date: Wed, 25 Nov 2020 11:09:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201125031708.6433-7-luben.tuikov@amd.com>
Content-Language: en-GB
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
Cc: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2020 03:17, Luben Tuikov wrote:
> Add a "done" list to which all completed jobs are added
> to be freed. The drm_sched_job_done() callback is the
> producer of jobs to this list.
> 
> Add a "done" thread which consumes from the done list
> and frees up jobs. Now, the main scheduler thread only
> pushes jobs to the GPU and the "done" thread frees them
> up, on the way out of the GPU when they've completed
> execution.

Generally I'd be in favour of a "done thread" as I think there are some 
murky corners of Panfrost's locking that would be helped by deferring 
the free_job() callback.

But I think you're trying to do too much in one patch here. And as 
Christian has pointed out there's some dodgy looking changes to locking 
which aren't explained.

Steve

> 
> Make use of the status returned by the GPU driver
> timeout handler to decide whether to leave the job in
> the pending list, or to send it off to the done list.
> If a job is done, it is added to the done list and the
> done thread woken up. If a job needs more time, it is
> left on the pending list and the timeout timer
> restarted.
> 
> Eliminate the polling mechanism of picking out done
> jobs from the pending list, i.e. eliminate
> drm_sched_get_cleanup_job(). Now the main scheduler
> thread only pushes jobs down to the GPU.
> 
> Various other optimizations to the GPU scheduler
> and job recovery are possible with this format.
> 
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 173 +++++++++++++------------
>   include/drm/gpu_scheduler.h            |  14 ++
>   2 files changed, 101 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 3eb7618a627d..289ae68cd97f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -164,7 +164,8 @@ drm_sched_rq_select_entity(struct drm_sched_rq *rq)
>    * drm_sched_job_done - complete a job
>    * @s_job: pointer to the job which is done
>    *
> - * Finish the job's fence and wake up the worker thread.
> + * Finish the job's fence, move it to the done list,
> + * and wake up the done thread.
>    */
>   static void drm_sched_job_done(struct drm_sched_job *s_job)
>   {
> @@ -179,7 +180,12 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
>   	dma_fence_get(&s_fence->finished);
>   	drm_sched_fence_finished(s_fence);
>   	dma_fence_put(&s_fence->finished);
> -	wake_up_interruptible(&sched->wake_up_worker);
> +
> +	spin_lock(&sched->job_list_lock);
> +	list_move(&s_job->list, &sched->done_list);
> +	spin_unlock(&sched->job_list_lock);
> +
> +	wake_up_interruptible(&sched->done_wait_q);
>   }
>   
>   /**
> @@ -221,11 +227,10 @@ bool drm_sched_dependency_optimized(struct dma_fence* fence,
>   EXPORT_SYMBOL(drm_sched_dependency_optimized);
>   
>   /**
> - * drm_sched_start_timeout - start timeout for reset worker
> - *
> - * @sched: scheduler instance to start the worker for
> + * drm_sched_start_timeout - start a timeout timer
> + * @sched: scheduler instance whose job we're timing
>    *
> - * Start the timeout for the given scheduler.
> + * Start a timeout timer for the given scheduler.
>    */
>   static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>   {
> @@ -305,8 +310,8 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
>   
>   	spin_lock(&sched->job_list_lock);
>   	list_add_tail(&s_job->list, &sched->pending_list);
> -	drm_sched_start_timeout(sched);
>   	spin_unlock(&sched->job_list_lock);
> +	drm_sched_start_timeout(sched);
>   }
>   
>   static void drm_sched_job_timedout(struct work_struct *work)
> @@ -316,37 +321,30 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   
>   	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>   
> -	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>   	spin_lock(&sched->job_list_lock);
>   	job = list_first_entry_or_null(&sched->pending_list,
>   				       struct drm_sched_job, list);
> +	spin_unlock(&sched->job_list_lock);
>   
>   	if (job) {
> -		/*
> -		 * Remove the bad job so it cannot be freed by concurrent
> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> -		 * is parked at which point it's safe.
> -		 */
> -		list_del_init(&job->list);
> -		spin_unlock(&sched->job_list_lock);
> +		int res;
>   
> -		job->sched->ops->timedout_job(job);
> +		job->job_status |= DRM_JOB_STATUS_TIMEOUT;
> +		res = job->sched->ops->timedout_job(job);
> +		if (res == 0) {
> +			/* The job is out of the device.
> +			 */
> +			spin_lock(&sched->job_list_lock);
> +			list_move(&job->list, &sched->done_list);
> +			spin_unlock(&sched->job_list_lock);
>   
> -		/*
> -		 * Guilty job did complete and hence needs to be manually removed
> -		 * See drm_sched_stop doc.
> -		 */
> -		if (sched->free_guilty) {
> -			job->sched->ops->free_job(job);
> -			sched->free_guilty = false;
> +			wake_up_interruptible(&sched->done_wait_q);
> +		} else {
> +			/* The job needs more time.
> +			 */
> +			drm_sched_start_timeout(sched);
>   		}
> -	} else {
> -		spin_unlock(&sched->job_list_lock);
>   	}
> -
> -	spin_lock(&sched->job_list_lock);
> -	drm_sched_start_timeout(sched);
> -	spin_unlock(&sched->job_list_lock);
>   }
>   
>    /**
> @@ -511,15 +509,13 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>   			else if (r)
>   				DRM_ERROR("fence add callback failed (%d)\n",
>   					  r);
> -		} else
> +		} else {
>   			drm_sched_job_done(s_job);
> +		}
>   	}
>   
> -	if (full_recovery) {
> -		spin_lock(&sched->job_list_lock);
> +	if (full_recovery)
>   		drm_sched_start_timeout(sched);
> -		spin_unlock(&sched->job_list_lock);
> -	}
>   
>   	kthread_unpark(sched->thread);
>   }
> @@ -667,47 +663,6 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>   	return entity;
>   }
>   
> -/**
> - * drm_sched_get_cleanup_job - fetch the next finished job to be destroyed
> - *
> - * @sched: scheduler instance
> - *
> - * Returns the next finished job from the pending list (if there is one)
> - * ready for it to be destroyed.
> - */
> -static struct drm_sched_job *
> -drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
> -{
> -	struct drm_sched_job *job;
> -
> -	/*
> -	 * Don't destroy jobs while the timeout worker is running  OR thread
> -	 * is being parked and hence assumed to not touch pending_list
> -	 */
> -	if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> -	    !cancel_delayed_work(&sched->work_tdr)) ||
> -	    kthread_should_park())
> -		return NULL;
> -
> -	spin_lock(&sched->job_list_lock);
> -
> -	job = list_first_entry_or_null(&sched->pending_list,
> -				       struct drm_sched_job, list);
> -
> -	if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
> -		/* remove job from pending_list */
> -		list_del_init(&job->list);
> -	} else {
> -		job = NULL;
> -		/* queue timeout for next job */
> -		drm_sched_start_timeout(sched);
> -	}
> -
> -	spin_unlock(&sched->job_list_lock);
> -
> -	return job;
> -}
> -
>   /**
>    * drm_sched_pick_best - Get a drm sched from a sched_list with the least load
>    * @sched_list: list of drm_gpu_schedulers
> @@ -761,6 +716,44 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
>   	return false;
>   }
>   
> +/**
> + * drm_sched_done - free done tasks
> + * @param: pointer to a scheduler instance
> + *
> + * Returns 0.
> + */
> +static int drm_sched_done(void *param)
> +{
> +	struct drm_gpu_scheduler *sched = param;
> +
> +	do {
> +		LIST_HEAD(done_q);
> +
> +		wait_event_interruptible(sched->done_wait_q,
> +					 kthread_should_stop() ||
> +					 !list_empty(&sched->done_list));
> +
> +		spin_lock(&sched->job_list_lock);
> +		list_splice_init(&sched->done_list, &done_q);
> +		spin_unlock(&sched->job_list_lock);
> +
> +		if (list_empty(&done_q))
> +			continue;
> +
> +		while (!list_empty(&done_q)) {
> +			struct drm_sched_job *job;
> +
> +			job = list_first_entry(&done_q,
> +					       struct drm_sched_job,
> +					       list);
> +			list_del_init(&job->list);
> +			sched->ops->free_job(job);
> +		}
> +	} while (!kthread_should_stop());
> +
> +	return 0;
> +}
> +
>   /**
>    * drm_sched_main - main scheduler thread
>    *
> @@ -770,7 +763,7 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
>    */
>   static int drm_sched_main(void *param)
>   {
> -	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
> +	struct drm_gpu_scheduler *sched = param;
>   	int r;
>   
>   	sched_set_fifo_low(current);
> @@ -780,20 +773,12 @@ static int drm_sched_main(void *param)
>   		struct drm_sched_fence *s_fence;
>   		struct drm_sched_job *sched_job;
>   		struct dma_fence *fence;
> -		struct drm_sched_job *cleanup_job = NULL;
>   
>   		wait_event_interruptible(sched->wake_up_worker,
> -					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
>   					 (!drm_sched_blocked(sched) &&
>   					  (entity = drm_sched_select_entity(sched))) ||
>   					 kthread_should_stop());
>   
> -		if (cleanup_job) {
> -			sched->ops->free_job(cleanup_job);
> -			/* queue timeout for next job */
> -			drm_sched_start_timeout(sched);
> -		}
> -
>   		if (!entity)
>   			continue;
>   
> @@ -820,8 +805,7 @@ static int drm_sched_main(void *param)
>   			if (r == -ENOENT)
>   				drm_sched_job_done(sched_job);
>   			else if (r)
> -				DRM_ERROR("fence add callback failed (%d)\n",
> -					  r);
> +				DRM_ERROR("fence add callback failed (%d)\n", r);
>   			dma_fence_put(fence);
>   		} else {
>   			if (IS_ERR(fence))
> @@ -865,7 +849,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   
>   	init_waitqueue_head(&sched->wake_up_worker);
>   	init_waitqueue_head(&sched->job_scheduled);
> +	init_waitqueue_head(&sched->done_wait_q);
>   	INIT_LIST_HEAD(&sched->pending_list);
> +	INIT_LIST_HEAD(&sched->done_list);
>   	spin_lock_init(&sched->job_list_lock);
>   	atomic_set(&sched->hw_rq_count, 0);
>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> @@ -881,6 +867,21 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   		return ret;
>   	}
>   
> +	snprintf(sched->thread_done_name, DRM_THREAD_NAME_LEN, "%s%s",
> +		 sched->name, "-done");
> +	sched->thread_done_name[DRM_THREAD_NAME_LEN - 1] = '\0';
> +	sched->thread_done = kthread_run(drm_sched_done, sched,
> +					 sched->thread_done_name);
> +	if (IS_ERR(sched->thread_done)) {
> +		ret = kthread_stop(sched->thread);
> +		if (!ret) {
> +			/* free_kthread_struct(sched->thread); */
> +			sched->thread = NULL;
> +		}
> +		DRM_ERROR("Failed to start thread %s", sched->thread_done_name);
> +		return ret;
> +	}
> +
>   	sched->ready = true;
>   	return 0;
>   }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 3a5686c3b5e9..b282d6158b50 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -169,6 +169,12 @@ struct drm_sched_fence {
>   
>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>   
> +enum drm_job_status {
> +	DRM_JOB_STATUS_NONE    = 0 << 0,
> +	DRM_JOB_STATUS_DONE    = 1 << 0,
> +	DRM_JOB_STATUS_TIMEOUT = 1 << 1,
> +};
> +
>   /**
>    * struct drm_sched_job - A job to be run by an entity.
>    *
> @@ -198,6 +204,7 @@ struct drm_sched_job {
>   	uint64_t			id;
>   	atomic_t			karma;
>   	enum drm_sched_priority		s_priority;
> +	enum drm_job_status             job_status;
>   	struct drm_sched_entity         *entity;
>   	struct dma_fence_cb		cb;
>   };
> @@ -284,15 +291,22 @@ struct drm_gpu_scheduler {
>   	uint32_t			hw_submission_limit;
>   	long				timeout;
>   	const char			*name;
> +	char                            thread_done_name[DRM_THREAD_NAME_LEN];
> +
>   	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
>   	wait_queue_head_t		wake_up_worker;
>   	wait_queue_head_t		job_scheduled;
> +	wait_queue_head_t               done_wait_q;
>   	atomic_t			hw_rq_count;
>   	atomic64_t			job_id_count;
>   	struct delayed_work		work_tdr;
>   	struct task_struct		*thread;
> +	struct task_struct		*thread_done;
> +
>   	struct list_head		pending_list;
> +	struct list_head                done_list;
>   	spinlock_t			job_list_lock;
> +
>   	int				hang_limit;
>   	atomic_t                        score;
>   	bool				ready;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
