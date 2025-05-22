Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E6AAC0CEE
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 15:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3F210E8FF;
	Thu, 22 May 2025 13:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gmDuA37j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FF610E13F;
 Thu, 22 May 2025 13:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uv5y2Pd6d6oUu6mNNscyw99a8xJeJJ5c2czzgAekqvA=; b=gmDuA37jEgnN1x1xAU1rzNCgIo
 4G94lnHnEwdA+wXzX8zdjtMVJLBgz74laLlOCcB0AzflqX1sOkSa2FVn4gvPvR4Ww5S0zzmHV/hcY
 DR7cyEOVfMYcQwGv3iG3kwm58DCjj3uIiGoir5+X5oxlRtWYORTtMonoZZHo85c3y4xhgbplQm33m
 gAxpsy3HA8zPpOH8XZBkmR643oRcc6o1njuUxKe9EgZdq2/cxPzz8RX+jPEv3Ibp5idmKYSxRFihj
 1cW1yDF0sX501T6uODdmPv/1R9kw1pw16+LJicQE43x+mdltKBUyFKLFYZABZ2peWz58WBy3vljGb
 UNkc03aw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uI67D-00BjRR-01; Thu, 22 May 2025 15:37:43 +0200
Message-ID: <1a15598f-da02-46a0-8c41-ef8b765dc177@igalia.com>
Date: Thu, 22 May 2025 14:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/sched: Fix teardown leaks with waitqueue
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
References: <20250522082742.148191-2-phasta@kernel.org>
 <20250522082742.148191-3-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250522082742.148191-3-phasta@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/05/2025 09:27, Philipp Stanner wrote:
> From: Philipp Stanner <pstanner@redhat.com>
> 
> The GPU scheduler currently does not ensure that its pending_list is
> empty before performing various other teardown tasks in
> drm_sched_fini().
> 
> If there are still jobs in the pending_list, this is problematic because
> after scheduler teardown, no one will call backend_ops.free_job()
> anymore. This would, consequently, result in memory leaks.
> 
> One way to solve this is to implement a waitqueue that drm_sched_fini()
> blocks on until the pending_list has become empty. That waitqueue must
> obviously not block for a significant time. Thus, it's necessary to only
> wait if it's guaranteed that all fences will get signaled quickly.
> 
> This can be ensured by having the driver implement a new backend ops,
> cancel_pending_fences(), in which the driver shall signal all
> unsignaled, in-flight fences with an error.
> 
> Add a waitqueue to struct drm_gpu_scheduler. Wake up waiters once the
> pending_list becomes empty. Wait in drm_sched_fini() for that to happen
> if cancel_pending_fences() is implemented.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 105 ++++++++++++++++++++-----
>   include/drm/gpu_scheduler.h            |  19 +++++
>   2 files changed, 105 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index f7118497e47a..406572f5168e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -367,7 +367,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
>    */
>   static void __drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
>   {
> -	if (!READ_ONCE(sched->pause_submit))
> +	if (!READ_ONCE(sched->pause_free))
>   		queue_work(sched->submit_wq, &sched->work_free_job);
>   }
>   
> @@ -1121,6 +1121,12 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>   		/* remove job from pending_list */
>   		list_del_init(&job->list);
>   
> +		/*
> +		 * Inform tasks blocking in drm_sched_fini() that it's now safe to proceed.
> +		 */
> +		if (list_empty(&sched->pending_list))
> +			wake_up(&sched->pending_list_waitque);

Wait what? ;) (pun intended)

I think I mentioned in the last round that waitque looks dodgy. Either a 
typo or a very unusual and novel shorthand? I suggest a typical wq or 
waitqueue.

I also mentioned that one more advantage of the ->cancel_job() approach 
is there is no need for these extra calls on the normal path (non 
teardown) at all.

> +
>   		/* cancel this job's TO timer */
>   		cancel_delayed_work(&sched->work_tdr);
>   		/* make the scheduled timestamp more accurate */
> @@ -1326,6 +1332,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>   	init_waitqueue_head(&sched->job_scheduled);
>   	INIT_LIST_HEAD(&sched->pending_list);
>   	spin_lock_init(&sched->job_list_lock);
> +	init_waitqueue_head(&sched->pending_list_waitque);
>   	atomic_set(&sched->credit_count, 0);
>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>   	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> @@ -1333,6 +1340,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>   	atomic_set(&sched->_score, 0);
>   	atomic64_set(&sched->job_id_count, 0);
>   	sched->pause_submit = false;
> +	sched->pause_free = false;
>   
>   	sched->ready = true;
>   	return 0;
> @@ -1350,33 +1358,90 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>   }
>   EXPORT_SYMBOL(drm_sched_init);
>   
> +/**
> + * drm_sched_submission_and_timeout_stop - stop everything except for free_job
> + * @sched: scheduler instance
> + *
> + * Helper for tearing down the scheduler in drm_sched_fini().
> + */
> +static void
> +drm_sched_submission_and_timeout_stop(struct drm_gpu_scheduler *sched)
> +{
> +	WRITE_ONCE(sched->pause_submit, true);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_delayed_work_sync(&sched->work_tdr);
> +}
> +
> +/**
> + * drm_sched_free_stop - stop free_job
> + * @sched: scheduler instance
> + *
> + * Helper for tearing down the scheduler in drm_sched_fini().
> + */
> +static void drm_sched_free_stop(struct drm_gpu_scheduler *sched)
> +{
> +	WRITE_ONCE(sched->pause_free, true);
> +	cancel_work_sync(&sched->work_free_job);
> +}
> +
> +/**
> + * drm_sched_no_jobs_pending - check whether jobs are pending
> + * @sched: scheduler instance
> + *
> + * Checks if jobs are pending for @sched.
> + *
> + * Return: true if jobs are pending, false otherwise.
> + */
> +static bool drm_sched_no_jobs_pending(struct drm_gpu_scheduler *sched)
> +{
> +	bool empty;
> +
> +	spin_lock(&sched->job_list_lock);
> +	empty = list_empty(&sched->pending_list);
> +	spin_unlock(&sched->job_list_lock);
> +
> +	return empty;
> +}
> +
> +/**
> + * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending jobs
> + * @sched: scheduler instance
> + *
> + * Must only be called if &struct drm_sched_backend_ops.cancel_pending_fences is
> + * implemented.
> + *
> + * Instructs the driver to kill the fence context associated with this scheduler,
> + * thereby signaling all pending fences. This, in turn, will trigger
> + * &struct drm_sched_backend_ops.free_job to be called for all pending jobs.
> + * The function then blocks until all pending jobs have been freed.
> + */
> +static void drm_sched_cancel_jobs_and_wait(struct drm_gpu_scheduler *sched)
> +{
> +	sched->ops->cancel_pending_fences(sched);
> +	wait_event(sched->pending_list_waitque, drm_sched_no_jobs_pending(sched));
> +}
> +
>   /**
>    * drm_sched_fini - Destroy a gpu scheduler
>    *
>    * @sched: scheduler instance
>    *
> - * Tears down and cleans up the scheduler.
> - *
> - * This stops submission of new jobs to the hardware through
> - * drm_sched_backend_ops.run_job(). Consequently, drm_sched_backend_ops.free_job()
> - * will not be called for all jobs still in drm_gpu_scheduler.pending_list.
> - * There is no solution for this currently. Thus, it is up to the driver to make
> - * sure that:
> - *
> - *  a) drm_sched_fini() is only called after for all submitted jobs
> - *     drm_sched_backend_ops.free_job() has been called or that
> - *  b) the jobs for which drm_sched_backend_ops.free_job() has not been called
> - *     after drm_sched_fini() ran are freed manually.
> - *
> - * FIXME: Take care of the above problem and prevent this function from leaking
> - * the jobs in drm_gpu_scheduler.pending_list under any circumstances.
> + * Tears down and cleans up the scheduler. Might leak memory if
> + * &struct drm_sched_backend_ops.cancel_pending_fences is not implemented.
>    */
>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   {
>   	struct drm_sched_entity *s_entity;
>   	int i;
>   
> -	drm_sched_wqueue_stop(sched);
> +	if (sched->ops->cancel_pending_fences) {
> +		drm_sched_submission_and_timeout_stop(sched);
> +		drm_sched_cancel_jobs_and_wait(sched);
> +		drm_sched_free_stop(sched);
> +	} else {
> +		/* We're in "legacy free-mode" and ignore potential mem leaks */
> +		drm_sched_wqueue_stop(sched);
> +	}
>   
>   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>   		struct drm_sched_rq *rq = sched->sched_rq[i];
> @@ -1464,7 +1529,7 @@ bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched)
>   EXPORT_SYMBOL(drm_sched_wqueue_ready);
>   
>   /**
> - * drm_sched_wqueue_stop - stop scheduler submission
> + * drm_sched_wqueue_stop - stop scheduler submission and freeing
>    * @sched: scheduler instance
>    *
>    * Stops the scheduler from pulling new jobs from entities. It also stops
> @@ -1473,13 +1538,14 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
>   void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, true);
> +	WRITE_ONCE(sched->pause_free, true);
>   	cancel_work_sync(&sched->work_run_job);
>   	cancel_work_sync(&sched->work_free_job);
>   }
>   EXPORT_SYMBOL(drm_sched_wqueue_stop);
>   
>   /**
> - * drm_sched_wqueue_start - start scheduler submission
> + * drm_sched_wqueue_start - start scheduler submission and freeing
>    * @sched: scheduler instance
>    *
>    * Restarts the scheduler after drm_sched_wqueue_stop() has stopped it.
> @@ -1490,6 +1556,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
>   void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, false);
> +	WRITE_ONCE(sched->pause_free, false);
>   	queue_work(sched->submit_wq, &sched->work_run_job);
>   	queue_work(sched->submit_wq, &sched->work_free_job);
>   }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index d860db087ea5..d8bd5b605336 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -29,6 +29,7 @@
>   #include <linux/completion.h>
>   #include <linux/xarray.h>
>   #include <linux/workqueue.h>
> +#include <linux/wait.h>
>   
>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>   
> @@ -508,6 +509,19 @@ struct drm_sched_backend_ops {
>            * and it's time to clean it up.
>   	 */
>   	void (*free_job)(struct drm_sched_job *sched_job);
> +
> +	/**
> +	 * @cancel_pending_fences: cancel all unsignaled hardware fences
> +	 *
> +	 * This callback must signal all unsignaled hardware fences associated
> +	 * with @sched with an appropriate error code (e.g., -ECANCELED). This
> +	 * ensures that all jobs will get freed by the scheduler before
> +	 * teardown.
> +	 *
> +	 * This callback is optional, but it is highly recommended to implement
> +	 * it to avoid memory leaks.
> +	 */
> +	void (*cancel_pending_fences)(struct drm_gpu_scheduler *sched);

I still don't understand why insist to use a new term in the backend 
ops, and even the whole scheduler API. Nothing in the API so far has 
fences in the name. Something like cancel(_all|pending)_jobs or 
sched_fini would read more aligned with the rest to me.

>   };
>   
>   /**
> @@ -533,6 +547,8 @@ struct drm_sched_backend_ops {
>    *            timeout interval is over.
>    * @pending_list: the list of jobs which are currently in the job queue.
>    * @job_list_lock: lock to protect the pending_list.
> + * @pending_list_waitque: a waitqueue for drm_sched_fini() to block on until all
> + *		          pending jobs have been finished.
>    * @hang_limit: once the hangs by a job crosses this limit then it is marked
>    *              guilty and it will no longer be considered for scheduling.
>    * @score: score to help loadbalancer pick a idle sched
> @@ -540,6 +556,7 @@ struct drm_sched_backend_ops {
>    * @ready: marks if the underlying HW is ready to work
>    * @free_guilty: A hit to time out handler to free the guilty job.
>    * @pause_submit: pause queuing of @work_run_job on @submit_wq
> + * @pause_free: pause queueing of @work_free_job on @submit_wq
>    * @own_submit_wq: scheduler owns allocation of @submit_wq
>    * @dev: system &struct device
>    *
> @@ -562,12 +579,14 @@ struct drm_gpu_scheduler {
>   	struct delayed_work		work_tdr;
>   	struct list_head		pending_list;
>   	spinlock_t			job_list_lock;
> +	wait_queue_head_t		pending_list_waitque;
>   	int				hang_limit;
>   	atomic_t                        *score;
>   	atomic_t                        _score;
>   	bool				ready;
>   	bool				free_guilty;
>   	bool				pause_submit;
> +	bool				pause_free;
>   	bool				own_submit_wq;
>   	struct device			*dev;
>   };

And, as you know, another thing I don't understand is why would we 
choose to add more of the state machine when I have shown how it can be 
done more elegantly. You don't have to reply, this is more a for the 
record against v3.

Regards,

Tvrtko

