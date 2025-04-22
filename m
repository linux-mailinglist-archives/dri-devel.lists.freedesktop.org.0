Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB52A96690
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 12:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797F110E584;
	Tue, 22 Apr 2025 10:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FvwUOSiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4E110E591
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QMv3RLhDfFl18cOjQk7j4nbAHXZcRym9duwcmihoqlg=; b=FvwUOSiQrKTqG0sFKXd/A49kCM
 nHhw0qJRzSFIG/och1+NQwTCyftwHiIOPj/jB7dMEcPvB/HFpwSmhotZhm9womu1+F9U+Zz8G1lIc
 NJfngb0ElcgCE0nbOo7McqpbJ13isn7FTZjEAxWdzxRQVZkpzQWOb0vP6hM9UwlTkot+y2Zw72qn3
 bQgFOp5kKhTZ0rUtG4XxHFpfVJCq0FePeDMr1FLsHW88+MBHcuY5Q8n5IicbrNE9dWNMmolzhHalF
 ePnI/IXVZoKWHO73lfr7zoXCOjwv1eEsYy1Ku67RVX7T0Ob4/87aXs5yds06/3OPjNq9mx+6JCLV4
 0v7mV/XQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u7BGD-006P9q-2Q; Tue, 22 Apr 2025 12:53:53 +0200
Message-ID: <c083b678-72b2-43ab-9252-e91b88e06bc7@igalia.com>
Date: Tue, 22 Apr 2025 11:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/sched: Allow drivers to register for pending list
 cleanup
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250418113211.69956-1-tvrtko.ursulin@igalia.com>
 <72c759df0988d48ae64c749927969168369837bc.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <72c759df0988d48ae64c749927969168369837bc.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 22/04/2025 06:43, Philipp Stanner wrote:
> On Fri, 2025-04-18 at 12:32 +0100, Tvrtko Ursulin wrote:
>> Quick sketch idea for an alternative to
>> https://lore.kernel.org/dri-devel/20250407152239.34429-2-phasta@kernel.org/
>> .
>>
>> It is possible it achieves the same effect but with less code and not
>> further growing the internal state machine. The callback it adds is
>> also
>> aligned in spirit (prototype) with other drm_sched_backend_ops
>> callbacks.
>>
>> The new callback is ->cancel_job(job) which is called after
>> drm_sched_fini() stops the workqueue for all jobs in the
>> pending_list.
>> After which, instead of waiting on the free worker to free jobs one
>> by
>> one, all are freed directly.
>>
>> As a demonstration we can remove the driver specific cleanup code
>> from the
>> mock scheduler. (End result tested for no memory leaks or crashes.)
>>
>> Please check if I am missed some gotcha etc. And if nouveau can by
>> made to
>> use it.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c        | 33 ++++----
>>   .../gpu/drm/scheduler/tests/mock_scheduler.c  | 76 ++++++++---------
>> --
>>   drivers/gpu/drm/scheduler/tests/sched_tests.h |  6 +-
>>   drivers/gpu/drm/scheduler/tests/tests_basic.c |  1 +
>>   include/drm/gpu_scheduler.h                   | 20 +++++
>>   5 files changed, 77 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 829579c41c6b..6be11befef68 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -1349,25 +1349,23 @@ int drm_sched_init(struct drm_gpu_scheduler
>> *sched, const struct drm_sched_init_
>>   EXPORT_SYMBOL(drm_sched_init);
>>   
>>   /**
>> - * drm_sched_fini - Destroy a gpu scheduler
>> + * drm_sched_fini - Tear down and clean up the scheduler
>>    *
>>    * @sched: scheduler instance
>>    *
>> - * Tears down and cleans up the scheduler.
>> + * In the process of tear down and cleanup this stops submission of
>> new jobs to
>> + * the hardware through drm_sched_backend_ops.run_job(), as well as
>> freeing of
>> + * completed jobs via drm_sched_backend_ops.free_job().
>>    *
>> - * This stops submission of new jobs to the hardware through
>> - * drm_sched_backend_ops.run_job(). Consequently,
>> drm_sched_backend_ops.free_job()
>> - * will not be called for all jobs still in
>> drm_gpu_scheduler.pending_list.
>> - * There is no solution for this currently. Thus, it is up to the
>> driver to make
>> - * sure that:
>> + * If the driver does not implement
>> drm_sched_backend_ops.cleanup_job(), which
>> + * is recommended, drm_sched_backend_ops.free_job() will not be
>> called for all
>> + * jobs still in drm_gpu_scheduler.pending_list. In this case it is
>> up to the
>> + * driver to make sure that:
>>    *
>> - *  a) drm_sched_fini() is only called after for all submitted jobs
>> - *     drm_sched_backend_ops.free_job() has been called or that
>> - *  b) the jobs for which drm_sched_backend_ops.free_job() has not
>> been called
>> + *  a) Drm_sched_fini() is only called after for all submitted jobs
>> + *     drm_sched_backend_ops.free_job() has been called or that;
>> + *  b) The jobs for which drm_sched_backend_ops.free_job() has not
>> been called
>>    *     after drm_sched_fini() ran are freed manually.
>> - *
>> - * FIXME: Take care of the above problem and prevent this function
>> from leaking
>> - * the jobs in drm_gpu_scheduler.pending_list under any
>> circumstances.
>>    */
>>   void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>   {
>> @@ -1397,6 +1395,15 @@ void drm_sched_fini(struct drm_gpu_scheduler
>> *sched)
>>   	/* Confirm no work left behind accessing device structures
>> */
>>   	cancel_delayed_work_sync(&sched->work_tdr);
>>   
>> +	if (sched->ops->cancel_job) {
>> +		struct drm_sched_job *job;
>> +
>> +		list_for_each_entry_reverse(job, &sched-
>>> pending_list, list) {
>> +			sched->ops->cancel_job(job);
>> +			sched->ops->free_job(job);
>> +		}
>> +	}
>> +
>>   	if (sched->own_submit_wq)
>>   		destroy_workqueue(sched->submit_wq);
>>   	sched->ready = false;
>> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> index f999c8859cf7..3c6be5ca26db 100644
>> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>> @@ -63,7 +63,7 @@ static void drm_mock_sched_job_complete(struct
>> drm_mock_sched_job *job)
>>   	lockdep_assert_held(&sched->lock);
>>   
>>   	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
>> -	list_move_tail(&job->link, &sched->done_list);
>> +	list_del(&job->link);
>>   	dma_fence_signal(&job->hw_fence);
>>   	complete(&job->done);
>>   }
>> @@ -200,29 +200,49 @@ static struct dma_fence
>> *mock_sched_run_job(struct drm_sched_job *sched_job)
>>   	return &job->hw_fence;
>>   }
>>   
>> +static void mock_sched_cancel_job(struct drm_sched_job *sched_job)
>> +{
>> +	struct drm_mock_scheduler *sched =
>> +		drm_sched_to_mock_sched(sched_job->sched);
>> +	struct drm_mock_sched_job *job =
>> drm_sched_job_to_mock_job(sched_job);
>> +
>> +	hrtimer_cancel(&job->timer);
>> +
>> +	spin_lock_irq(&sched->lock);
>> +	spin_lock(&job->lock);
>> +	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
>> +		job->flags |= DRM_MOCK_SCHED_JOB_CANCELED;
>> +		list_del(&job->link);
>> +		dma_fence_set_error(&job->hw_fence, -ECANCELED);
>> +		dma_fence_signal_locked(&job->hw_fence);
>> +		complete(&job->done);
>> +	}
>> +	spin_unlock(&job->lock);
>> +	spin_unlock_irq(&sched->lock);
>> +}
>> +
>>   static enum drm_gpu_sched_stat
>>   mock_sched_timedout_job(struct drm_sched_job *sched_job)
>>   {
>> +	struct drm_mock_scheduler *sched =
>> +		drm_sched_to_mock_sched(sched_job->sched);
>>   	struct drm_mock_sched_job *job =
>> drm_sched_job_to_mock_job(sched_job);
>>   
>> +	spin_lock_irq(&sched->lock);
>>   	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
>> +	list_del(&job->link);
>> +	dma_fence_set_error(&job->hw_fence, -ETIMEDOUT);
>> +	dma_fence_signal(&job->hw_fence);
>> +	spin_unlock_irq(&sched->lock);
>>   
>>   	return DRM_GPU_SCHED_STAT_NOMINAL;
>>   }
>>   
>> -static void mock_sched_free_job(struct drm_sched_job *sched_job)
>> +void drm_mock_sched_job_free(struct drm_sched_job *sched_job)
>>   {
>> -	struct drm_mock_scheduler *sched =
>> -			drm_sched_to_mock_sched(sched_job->sched);
>>   	struct drm_mock_sched_job *job =
>> drm_sched_job_to_mock_job(sched_job);
>> -	unsigned long flags;
>>   
>> -	/* Remove from the scheduler done list. */
>> -	spin_lock_irqsave(&sched->lock, flags);
>> -	list_del(&job->link);
>> -	spin_unlock_irqrestore(&sched->lock, flags);
>>   	dma_fence_put(&job->hw_fence);
>> -
>>   	drm_sched_job_cleanup(sched_job);
>>   
>>   	/* Mock job itself is freed by the kunit framework. */
>> @@ -230,8 +250,9 @@ static void mock_sched_free_job(struct
>> drm_sched_job *sched_job)
>>   
>>   static const struct drm_sched_backend_ops drm_mock_scheduler_ops = {
>>   	.run_job = mock_sched_run_job,
>> +	.cancel_job = mock_sched_cancel_job,
>>   	.timedout_job = mock_sched_timedout_job,
>> -	.free_job = mock_sched_free_job
>> +	.free_job = drm_mock_sched_job_free
>>   };
>>   
>>   /**
>> @@ -265,7 +286,6 @@ struct drm_mock_scheduler
>> *drm_mock_sched_new(struct kunit *test, long timeout)
>>   	sched->hw_timeline.context = dma_fence_context_alloc(1);
>>   	atomic_set(&sched->hw_timeline.next_seqno, 0);
>>   	INIT_LIST_HEAD(&sched->job_list);
>> -	INIT_LIST_HEAD(&sched->done_list);
>>   	spin_lock_init(&sched->lock);
>>   
>>   	return sched;
>> @@ -280,38 +300,6 @@ struct drm_mock_scheduler
>> *drm_mock_sched_new(struct kunit *test, long timeout)
>>    */
>>   void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
>>   {
>> -	struct drm_mock_sched_job *job, *next;
>> -	unsigned long flags;
>> -	LIST_HEAD(list);
>> -
>> -	drm_sched_wqueue_stop(&sched->base);
>> -
>> -	/* Force complete all unfinished jobs. */
>> -	spin_lock_irqsave(&sched->lock, flags);
>> -	list_for_each_entry_safe(job, next, &sched->job_list, link)
>> -		list_move_tail(&job->link, &list);
>> -	spin_unlock_irqrestore(&sched->lock, flags);
>> -
>> -	list_for_each_entry(job, &list, link)
>> -		hrtimer_cancel(&job->timer);
>> -
>> -	spin_lock_irqsave(&sched->lock, flags);
>> -	list_for_each_entry_safe(job, next, &list, link)
>> -		drm_mock_sched_job_complete(job);
>> -	spin_unlock_irqrestore(&sched->lock, flags);
>> -
>> -	/*
>> -	 * Free completed jobs and jobs not yet processed by the DRM
>> scheduler
>> -	 * free worker.
>> -	 */
>> -	spin_lock_irqsave(&sched->lock, flags);
>> -	list_for_each_entry_safe(job, next, &sched->done_list, link)
>> -		list_move_tail(&job->link, &list);
>> -	spin_unlock_irqrestore(&sched->lock, flags);
>> -
>> -	list_for_each_entry_safe(job, next, &list, link)
>> -		mock_sched_free_job(&job->base);
>> -
>>   	drm_sched_fini(&sched->base);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h
>> b/drivers/gpu/drm/scheduler/tests/sched_tests.h
>> index 27caf8285fb7..7b4e09ad6858 100644
>> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
>> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
>> @@ -49,7 +49,6 @@ struct drm_mock_scheduler {
>>   
>>   	spinlock_t		lock;
>>   	struct list_head	job_list;
>> -	struct list_head	done_list;
>>   
>>   	struct {
>>   		u64		context;
>> @@ -97,7 +96,8 @@ struct drm_mock_sched_job {
>>   	struct completion	done;
>>   
>>   #define DRM_MOCK_SCHED_JOB_DONE		0x1
>> -#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
>> +#define DRM_MOCK_SCHED_JOB_CANCELED	0x2
>> +#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x4
>>   	unsigned long		flags;
>>   
>>   	struct list_head	link;
>> @@ -146,6 +146,8 @@ struct drm_mock_sched_job *
>>   drm_mock_sched_job_new(struct kunit *test,
>>   		       struct drm_mock_sched_entity *entity);
>>   
>> +void drm_mock_sched_job_free(struct drm_sched_job *sched_job);
>> +
>>   /**
>>    * drm_mock_sched_job_submit - Arm and submit a job in one go
>>    *
>> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> index 7230057e0594..968b3046745f 100644
>> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
>> @@ -241,6 +241,7 @@ static void drm_sched_basic_timeout(struct kunit
>> *test)
>>   			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
>>   			DRM_MOCK_SCHED_JOB_TIMEDOUT);
>>   
>> +	drm_mock_sched_job_free(&job->base);
>>   	drm_mock_sched_entity_free(entity);
>>   }
>>   
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index 1a7e377d4cbb..0bcbc3ce8188 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -503,6 +503,26 @@ struct drm_sched_backend_ops {
>>   	 */
>>   	enum drm_gpu_sched_stat (*timedout_job)(struct drm_sched_job
>> *sched_job);
>>   
>> +	/**
>> +	 * @cancel_job: Called during pending job cleanup on
>> scheduler destroy
>> +	 *
>> +	 * @sched_job: The job to cancel
>> +	 *
>> +	 * Called from drm_sched_fini() for every job on the
>> +	 * &drm_sched.pending_list after scheduler workqueues have
>> been stopped
>> +	 * in drm_sched_fini().
>> +	 *
>> +	 * Job should either be allowed to finish or revoked from
>> the backend
>> +	 * and signaled with an appropriate fence errno (-
>> ECANCELED). After the
>> +	 * callback returns scheduler will call
>> +	 * &drm_sched_backend_ops.free_job() after which scheduler
>> teardown will
>> +	 * proceed.
>> +	 *
>> +	 * Callback is optional but recommended for avoiding memory
>> leaks after
>> +	 * scheduler tear down.
>> +	 */
>> +	void (*cancel_job)(struct drm_sched_job *sched_job);
> 
> 
> Tvrtko, sorry but this looks absolutely like a reimplementation of my
> fix, the sole difference being that the callback has a different name.
> 
> Everything else is the same, even the check for the callback.
> 
> The only difference I might be able to see (if I try really hard) is
> that you don't kill the entire fence context, but cancel job-by-job.
> 
> But let's look at it, what does it "kill the fence context" mean? It
> means that all fences belonging to the context have to be signaled with
> an error – precisely what you and I do, but with different names.
> 
> So I really don't get why you send this patch after I literally spend
> months figuring this path forward out.

After I read your series and understood what it is trying to solve, 
exchanged a few emails with Danilo, it felt it would be easier to 
propose an alternative in code rather than in words. I thought I 
explained the motivation in the cover letter. Maybe not well enough.

Let me try and re-summarise:

  * It is *way* less code - no new flags no new state machine, no new 
waitqueues.

  * New callback is aligned with the other callbacks. It works on jobs 
(as all others), does not add new terminology into the API and it does 
not *mandate* drivers *must* keep internal lists. Any way to cancel a 
job and scheduler core is happy.

Regards,

Tvrtko

> 
> P.
> 
> 
> 
>> +
>>   	/**
>>            * @free_job: Called once the job's finished fence has been
>> signaled
>>            * and it's time to clean it up.
> 

