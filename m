Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9836AB9897
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1E610EA03;
	Fri, 16 May 2025 09:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qwE7cMKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31DF10EA03;
 Fri, 16 May 2025 09:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/bayzPCeERRTY97sgYjY8EAqdfhEth5fc6iSSEu/y+c=; b=qwE7cMKtbIKKJ0oaa+pNqLiKnD
 ynwCjc3CLmaOaCm/7GKYetwT1bmr2mpOYcNOP0rxXRNiwqSsOf6DRktIGjKeMdrV2e6JiO3gJ5S7B
 dTXqWtcA86qkc/eVVwBrgkqOVpPgnJP9C6jynyqvQBYJ+LIYEm7zo1u6SEweNJ8TMSAZppgJavZMb
 MS2P26cMeN4yepBPKwXYDeQiOlgXVM1sGUd+mWpvaYmkR8OqsQJNrQjdTtQFGznJGGebdrc2pphKj
 ZT81UlkOpSebuyj6sFbElYazwTe7nVQ5IGdazv0ZP1DZxZhsW1RZFJOJshJ03VYC8aqIrSy1lW6qv
 TTAjicXQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFr8Y-0090yq-Bw; Fri, 16 May 2025 11:19:49 +0200
Message-ID: <d8251048-5ee7-4f4c-9f2e-22505e2635b3@igalia.com>
Date: Fri, 16 May 2025 10:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/sched: Fix teardown leaks with waitqueue
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-3-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250424095535.26119-3-phasta@kernel.org>
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


Hi,

Some review comments below, with a caveat that does not imply support 
for the approach just yet.

On 24/04/2025 10:55, Philipp Stanner wrote:
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
> blocks on until the pending_list has become empty.
> 
> Add a waitqueue to struct drm_gpu_scheduler. Wake up waiters once the
> pending_list becomes empty. Wait in drm_sched_fini() for that to happen.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 72 ++++++++++++++++++++------
>   include/drm/gpu_scheduler.h            |  6 +++
>   2 files changed, 63 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 829579c41c6b..ea82e69a72a8 100644
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
> @@ -556,6 +556,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   		 * is parked at which point it's safe.
>   		 */
>   		list_del_init(&job->list);
> +
>   		spin_unlock(&sched->job_list_lock);
>   
>   		status = job->sched->ops->timedout_job(job);
> @@ -1119,6 +1120,12 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>   		/* remove job from pending_list */
>   		list_del_init(&job->list);
>   
> +		/*
> +		 * Inform tasks blocking in drm_sched_fini() that it's now safe to proceed.
> +		 */
> +		if (list_empty(&sched->pending_list))
> +			wake_up(&sched->pending_list_waitque);

Typo in queue.

wake_up could go on the else branch of the if (next) block below.

Also, another micro-advantage to the ->cancel_job() approach is that it 
doesn't add executing stuff at runtime which is only relevant for the 
teardown.

> +
>   		/* cancel this job's TO timer */
>   		cancel_delayed_work(&sched->work_tdr);
>   		/* make the scheduled timestamp more accurate */
> @@ -1324,6 +1331,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>   	init_waitqueue_head(&sched->job_scheduled);
>   	INIT_LIST_HEAD(&sched->pending_list);
>   	spin_lock_init(&sched->job_list_lock);
> +	init_waitqueue_head(&sched->pending_list_waitque);
>   	atomic_set(&sched->credit_count, 0);
>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
>   	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
> @@ -1331,6 +1339,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>   	atomic_set(&sched->_score, 0);
>   	atomic64_set(&sched->job_id_count, 0);
>   	sched->pause_submit = false;
> +	sched->pause_free = false;
>   
>   	sched->ready = true;
>   	return 0;
> @@ -1348,6 +1357,39 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>   }
>   EXPORT_SYMBOL(drm_sched_init);
>   
> +/**
> + * drm_sched_submission_and_timeout_stop - stop everything except for free_job()
> + * @sched: scheduler instance
> + *
> + * Only needed to cleanly tear down the scheduler in drm_sched_fini().
> + */
> +static inline void
> +drm_sched_submission_and_timeout_stop(struct drm_gpu_scheduler *sched)
> +{
> +	WRITE_ONCE(sched->pause_submit, true);
> +	cancel_work_sync(&sched->work_run_job);
> +	cancel_delayed_work_sync(&sched->work_tdr);
> +}

This one and the two below it: I think best known practice is to leave 
out the inline keyword and let the compiler decide.

> +
> +static inline void
> +drm_sched_free_stop(struct drm_gpu_scheduler *sched)
> +{
> +	WRITE_ONCE(sched->pause_free, true);
> +	cancel_work_sync(&sched->work_free_job);
> +}
> +
> +static inline bool
> +drm_sched_no_jobs_pending(struct drm_gpu_scheduler *sched)
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
>   /**
>    * drm_sched_fini - Destroy a gpu scheduler
>    *
> @@ -1355,26 +1397,24 @@ EXPORT_SYMBOL(drm_sched_init);
>    *
>    * Tears down and cleans up the scheduler.
>    *
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
> + * Note that this function blocks until all the fences returned by
> + * &struct drm_sched_backend_ops.run_job have been signalled.
>    */
>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   {
>   	struct drm_sched_entity *s_entity;
>   	int i;
>   
> -	drm_sched_wqueue_stop(sched);
> +	/*
> +	 * Jobs that have neither been scheduled or which have timed out are
> +	 * gone by now, but jobs that have been submitted through
> +	 * backend_ops.run_job() and have not yet terminated are still pending.
> +	 *
> +	 * Wait for the pending_list to become empty to avoid leaking those jobs.
> +	 */
> +	drm_sched_submission_and_timeout_stop(sched);
> +	wait_event(sched->pending_list_waitque, drm_sched_no_jobs_pending(sched));

I think this is a patch ordering issue. To avoid blocking indefinitely 
after patch 1, you probably should swap patches 1 and 2, or maybe just 
squash them.

Regards,

Tvrtko

> +	drm_sched_free_stop(sched);
>   
>   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>   		struct drm_sched_rq *rq = sched->sched_rq[i];
> @@ -1471,6 +1511,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
>   void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, true);
> +	WRITE_ONCE(sched->pause_free, true);
>   	cancel_work_sync(&sched->work_run_job);
>   	cancel_work_sync(&sched->work_free_job);
>   }
> @@ -1488,6 +1529,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
>   void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>   {
>   	WRITE_ONCE(sched->pause_submit, false);
> +	WRITE_ONCE(sched->pause_free, false);
>   	queue_work(sched->submit_wq, &sched->work_run_job);
>   	queue_work(sched->submit_wq, &sched->work_free_job);
>   }
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 1a7e377d4cbb..d0b1f416b4d9 100644
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
> @@ -533,6 +534,8 @@ struct drm_sched_backend_ops {
>    *            timeout interval is over.
>    * @pending_list: the list of jobs which are currently in the job queue.
>    * @job_list_lock: lock to protect the pending_list.
> + * @pending_list_waitque: a waitqueue for drm_sched_fini() to block on until all
> + *		          pending jobs have been finished.
>    * @hang_limit: once the hangs by a job crosses this limit then it is marked
>    *              guilty and it will no longer be considered for scheduling.
>    * @score: score to help loadbalancer pick a idle sched
> @@ -540,6 +543,7 @@ struct drm_sched_backend_ops {
>    * @ready: marks if the underlying HW is ready to work
>    * @free_guilty: A hit to time out handler to free the guilty job.
>    * @pause_submit: pause queuing of @work_run_job on @submit_wq
> + * @pause_free: pause queuing of @work_free_job on @submit_wq
>    * @own_submit_wq: scheduler owns allocation of @submit_wq
>    * @dev: system &struct device
>    *
> @@ -562,12 +566,14 @@ struct drm_gpu_scheduler {
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

