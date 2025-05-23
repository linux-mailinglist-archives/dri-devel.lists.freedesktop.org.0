Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E597FAC268D
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 17:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B12910E826;
	Fri, 23 May 2025 15:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VOK1pwMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B705210E2C0;
 Fri, 23 May 2025 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fI8cvnf31gEuEY3hkPlTi1dDwqyiSA+yU/6dZPkYH2Y=; b=VOK1pwMNcMEB5Ztz6TR2WFgQTa
 35LLdLC5joZEu8sVOGLDZpa18NKlD+JVGBTSVP0qA0UtcluAuAISNvZOGLS0gUazm7aGOqgKMKI4r
 gBx1McKZ8Mp/cr85qObH8ixV/ybS/Yw03XkCR1N1BKd7mKZrf6vqysckVMYOuNsJO6Ye89cWHpTPU
 1Jcym4QThHVWF4qnVpjZZXkuIfKnB95DA8dZD5ZoadFLtqTEquHw7Vj5swkLvrfADvMiws9oxaTiv
 XMEbatnPnrKtzftifYg/loW93KJ9ALOhsDpgU0fk/9xAxm1/AUmlc6ywfDBV6P319X+MTowXQcVKh
 zU00eXDg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uIUQe-00CEoI-7a; Fri, 23 May 2025 17:35:24 +0200
Message-ID: <f2edc29b-a9ae-46ac-bd4c-8b1cd20a4cd5@igalia.com>
Date: Fri, 23 May 2025 16:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/sched: Fix teardown leaks with waitqueue
To: Philipp Stanner <pstanner@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250522082742.148191-2-phasta@kernel.org>
 <20250522082742.148191-3-phasta@kernel.org>
 <1a15598f-da02-46a0-8c41-ef8b765dc177@igalia.com>
 <44c318c704960c0d0732598773fd256bdfac2fc1.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <44c318c704960c0d0732598773fd256bdfac2fc1.camel@redhat.com>
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


On 22/05/2025 16:32, Philipp Stanner wrote:
> On Thu, 2025-05-22 at 14:37 +0100, Tvrtko Ursulin wrote:
>>
>> On 22/05/2025 09:27, Philipp Stanner wrote:
>>> From: Philipp Stanner <pstanner@redhat.com>
>>>
>>> The GPU scheduler currently does not ensure that its pending_list
>>> is
>>> empty before performing various other teardown tasks in
>>> drm_sched_fini().
>>>
>>> If there are still jobs in the pending_list, this is problematic
>>> because
>>> after scheduler teardown, no one will call backend_ops.free_job()
>>> anymore. This would, consequently, result in memory leaks.
>>>
>>> One way to solve this is to implement a waitqueue that
>>> drm_sched_fini()
>>> blocks on until the pending_list has become empty. That waitqueue
>>> must
>>> obviously not block for a significant time. Thus, it's necessary to
>>> only
>>> wait if it's guaranteed that all fences will get signaled quickly.
>>>
>>> This can be ensured by having the driver implement a new backend
>>> ops,
>>> cancel_pending_fences(), in which the driver shall signal all
>>> unsignaled, in-flight fences with an error.
>>>
>>> Add a waitqueue to struct drm_gpu_scheduler. Wake up waiters once
>>> the
>>> pending_list becomes empty. Wait in drm_sched_fini() for that to
>>> happen
>>> if cancel_pending_fences() is implemented.
>>>
>>> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 105
>>> ++++++++++++++++++++-----
>>>    include/drm/gpu_scheduler.h            |  19 +++++
>>>    2 files changed, 105 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index f7118497e47a..406572f5168e 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -367,7 +367,7 @@ static void drm_sched_run_job_queue(struct
>>> drm_gpu_scheduler *sched)
>>>     */
>>>    static void __drm_sched_run_free_queue(struct drm_gpu_scheduler
>>> *sched)
>>>    {
>>> -	if (!READ_ONCE(sched->pause_submit))
>>> +	if (!READ_ONCE(sched->pause_free))
>>>    		queue_work(sched->submit_wq, &sched-
>>>> work_free_job);
>>>    }
>>>    
>>> @@ -1121,6 +1121,12 @@ drm_sched_get_finished_job(struct
>>> drm_gpu_scheduler *sched)
>>>    		/* remove job from pending_list */
>>>    		list_del_init(&job->list);
>>>    
>>> +		/*
>>> +		 * Inform tasks blocking in drm_sched_fini() that
>>> it's now safe to proceed.
>>> +		 */
>>> +		if (list_empty(&sched->pending_list))
>>> +			wake_up(&sched->pending_list_waitque);
>>
>> Wait what? ;) (pun intended)
>>
>> I think I mentioned in the last round that waitque looks dodgy.
>> Either a
>> typo or a very unusual and novel shorthand? I suggest a typical wq or
>> waitqueue.
> 
> Ah right, I forgot about that.
> 
>>
>> I also mentioned that one more advantage of the ->cancel_job()
>> approach
>> is there is no need for these extra calls on the normal path (non
>> teardown) at all.
> 
> Yes, agreed, that's a tiny performance gain. But it's running in a
> workqueue, so no big deal. But see below, too
> 
>>
>>> +
>>>    		/* cancel this job's TO timer */
>>>    		cancel_delayed_work(&sched->work_tdr);
>>>    		/* make the scheduled timestamp more accurate */
>>> @@ -1326,6 +1332,7 @@ int drm_sched_init(struct drm_gpu_scheduler
>>> *sched, const struct drm_sched_init_
>>>    	init_waitqueue_head(&sched->job_scheduled);
>>>    	INIT_LIST_HEAD(&sched->pending_list);
>>>    	spin_lock_init(&sched->job_list_lock);
>>> +	init_waitqueue_head(&sched->pending_list_waitque);
>>>    	atomic_set(&sched->credit_count, 0);
>>>    	INIT_DELAYED_WORK(&sched->work_tdr,
>>> drm_sched_job_timedout);
>>>    	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>>> @@ -1333,6 +1340,7 @@ int drm_sched_init(struct drm_gpu_scheduler
>>> *sched, const struct drm_sched_init_
>>>    	atomic_set(&sched->_score, 0);
>>>    	atomic64_set(&sched->job_id_count, 0);
>>>    	sched->pause_submit = false;
>>> +	sched->pause_free = false;
>>>    
>>>    	sched->ready = true;
>>>    	return 0;
>>> @@ -1350,33 +1358,90 @@ int drm_sched_init(struct drm_gpu_scheduler
>>> *sched, const struct drm_sched_init_
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_init);
>>>    
>>> +/**
>>> + * drm_sched_submission_and_timeout_stop - stop everything except
>>> for free_job
>>> + * @sched: scheduler instance
>>> + *
>>> + * Helper for tearing down the scheduler in drm_sched_fini().
>>> + */
>>> +static void
>>> +drm_sched_submission_and_timeout_stop(struct drm_gpu_scheduler
>>> *sched)
>>> +{
>>> +	WRITE_ONCE(sched->pause_submit, true);
>>> +	cancel_work_sync(&sched->work_run_job);
>>> +	cancel_delayed_work_sync(&sched->work_tdr);
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_free_stop - stop free_job
>>> + * @sched: scheduler instance
>>> + *
>>> + * Helper for tearing down the scheduler in drm_sched_fini().
>>> + */
>>> +static void drm_sched_free_stop(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	WRITE_ONCE(sched->pause_free, true);
>>> +	cancel_work_sync(&sched->work_free_job);
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_no_jobs_pending - check whether jobs are pending
>>> + * @sched: scheduler instance
>>> + *
>>> + * Checks if jobs are pending for @sched.
>>> + *
>>> + * Return: true if jobs are pending, false otherwise.
>>> + */
>>> +static bool drm_sched_no_jobs_pending(struct drm_gpu_scheduler
>>> *sched)
>>> +{
>>> +	bool empty;
>>> +
>>> +	spin_lock(&sched->job_list_lock);
>>> +	empty = list_empty(&sched->pending_list);
>>> +	spin_unlock(&sched->job_list_lock);
>>> +
>>> +	return empty;
>>> +}
>>> +
>>> +/**
>>> + * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending
>>> jobs
>>> + * @sched: scheduler instance
>>> + *
>>> + * Must only be called if &struct
>>> drm_sched_backend_ops.cancel_pending_fences is
>>> + * implemented.
>>> + *
>>> + * Instructs the driver to kill the fence context associated with
>>> this scheduler,
>>> + * thereby signaling all pending fences. This, in turn, will
>>> trigger
>>> + * &struct drm_sched_backend_ops.free_job to be called for all
>>> pending jobs.
>>> + * The function then blocks until all pending jobs have been
>>> freed.
>>> + */
>>> +static void drm_sched_cancel_jobs_and_wait(struct
>>> drm_gpu_scheduler *sched)
>>> +{
>>> +	sched->ops->cancel_pending_fences(sched);
>>> +	wait_event(sched->pending_list_waitque,
>>> drm_sched_no_jobs_pending(sched));
>>> +}
>>> +
>>>    /**
>>>     * drm_sched_fini - Destroy a gpu scheduler
>>>     *
>>>     * @sched: scheduler instance
>>>     *
>>> - * Tears down and cleans up the scheduler.
>>> - *
>>> - * This stops submission of new jobs to the hardware through
>>> - * drm_sched_backend_ops.run_job(). Consequently,
>>> drm_sched_backend_ops.free_job()
>>> - * will not be called for all jobs still in
>>> drm_gpu_scheduler.pending_list.
>>> - * There is no solution for this currently. Thus, it is up to the
>>> driver to make
>>> - * sure that:
>>> - *
>>> - *  a) drm_sched_fini() is only called after for all submitted
>>> jobs
>>> - *     drm_sched_backend_ops.free_job() has been called or that
>>> - *  b) the jobs for which drm_sched_backend_ops.free_job() has not
>>> been called
>>> - *     after drm_sched_fini() ran are freed manually.
>>> - *
>>> - * FIXME: Take care of the above problem and prevent this function
>>> from leaking
>>> - * the jobs in drm_gpu_scheduler.pending_list under any
>>> circumstances.
>>> + * Tears down and cleans up the scheduler. Might leak memory if
>>> + * &struct drm_sched_backend_ops.cancel_pending_fences is not
>>> implemented.
>>>     */
>>>    void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	struct drm_sched_entity *s_entity;
>>>    	int i;
>>>    
>>> -	drm_sched_wqueue_stop(sched);
>>> +	if (sched->ops->cancel_pending_fences) {
>>> +		drm_sched_submission_and_timeout_stop(sched);
>>> +		drm_sched_cancel_jobs_and_wait(sched);
>>> +		drm_sched_free_stop(sched);
>>> +	} else {
>>> +		/* We're in "legacy free-mode" and ignore
>>> potential mem leaks */
>>> +		drm_sched_wqueue_stop(sched);
>>> +	}
>>>    
>>>    	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
>>> i++) {
>>>    		struct drm_sched_rq *rq = sched->sched_rq[i];
>>> @@ -1464,7 +1529,7 @@ bool drm_sched_wqueue_ready(struct
>>> drm_gpu_scheduler *sched)
>>>    EXPORT_SYMBOL(drm_sched_wqueue_ready);
>>>    
>>>    /**
>>> - * drm_sched_wqueue_stop - stop scheduler submission
>>> + * drm_sched_wqueue_stop - stop scheduler submission and freeing
>>>     * @sched: scheduler instance
>>>     *
>>>     * Stops the scheduler from pulling new jobs from entities. It
>>> also stops
>>> @@ -1473,13 +1538,14 @@ EXPORT_SYMBOL(drm_sched_wqueue_ready);
>>>    void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	WRITE_ONCE(sched->pause_submit, true);
>>> +	WRITE_ONCE(sched->pause_free, true);
>>>    	cancel_work_sync(&sched->work_run_job);
>>>    	cancel_work_sync(&sched->work_free_job);
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_wqueue_stop);
>>>    
>>>    /**
>>> - * drm_sched_wqueue_start - start scheduler submission
>>> + * drm_sched_wqueue_start - start scheduler submission and freeing
>>>     * @sched: scheduler instance
>>>     *
>>>     * Restarts the scheduler after drm_sched_wqueue_stop() has
>>> stopped it.
>>> @@ -1490,6 +1556,7 @@ EXPORT_SYMBOL(drm_sched_wqueue_stop);
>>>    void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	WRITE_ONCE(sched->pause_submit, false);
>>> +	WRITE_ONCE(sched->pause_free, false);
>>>    	queue_work(sched->submit_wq, &sched->work_run_job);
>>>    	queue_work(sched->submit_wq, &sched->work_free_job);
>>>    }
>>> diff --git a/include/drm/gpu_scheduler.h
>>> b/include/drm/gpu_scheduler.h
>>> index d860db087ea5..d8bd5b605336 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -29,6 +29,7 @@
>>>    #include <linux/completion.h>
>>>    #include <linux/xarray.h>
>>>    #include <linux/workqueue.h>
>>> +#include <linux/wait.h>
>>>    
>>>    #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>>>    
>>> @@ -508,6 +509,19 @@ struct drm_sched_backend_ops {
>>>             * and it's time to clean it up.
>>>    	 */
>>>    	void (*free_job)(struct drm_sched_job *sched_job);
>>> +
>>> +	/**
>>> +	 * @cancel_pending_fences: cancel all unsignaled hardware
>>> fences
>>> +	 *
>>> +	 * This callback must signal all unsignaled hardware
>>> fences associated
>>> +	 * with @sched with an appropriate error code (e.g., -
>>> ECANCELED). This
>>> +	 * ensures that all jobs will get freed by the scheduler
>>> before
>>> +	 * teardown.
>>> +	 *
>>> +	 * This callback is optional, but it is highly recommended
>>> to implement
>>> +	 * it to avoid memory leaks.
>>> +	 */
>>> +	void (*cancel_pending_fences)(struct drm_gpu_scheduler
>>> *sched);
>>
>> I still don't understand why insist to use a new term in the backend
>> ops, and even the whole scheduler API. Nothing in the API so far has
>> fences in the name. Something like cancel(_all|pending)_jobs or
>> sched_fini would read more aligned with the rest to me.
> 
> Nothing has fences in the name, but they are the central concept of the
> API: run_job() returns them, and they are the main mechanism through
> which scheduler and driver communicate.
> 
> As mentioned in the other mail, the idea behind the callback is to get
> all hardware fences signaled. Just that. That's a simple, well
> established concept, easy to understand by drivers. In contrast, it
> would be far less clear what "cancel" even means. That's evident from
> the other patch where we're suddenly wondering whether the driver
> should also cancel timers etc. in the callback.

That mock scheduler uses the hrtimers to simulate a GPU and so that uses 
hrtimer_cancel() to cancel a job is irrelevant for the discussion about 
the name cancel in the DRM scheduler API. That is just implementation 
detail. It could have been using a thread or a workqueue, or whatever.

Besides, I don't see how you can argue against the name cancel if I 
propose cancel_(all|pending_)jobs() and you are proposing 
cancel_pending_fences().

> It should not. The contract is simple: "signal everything".
> 
> It's also more difficult to abuse, since signaling is always valid. But
> when is canceling valid?
> 
> Considering how internal APIs have been abused in the past, I can very
> well see some party using a cancel_job() callback in the future to
> "cancel" single jobs, for example in our (still unsolved)
> resubmit_jobs() problem.

I don't know but this feels a bit of a stretch. It would not be 
scheduler internal API, but a vfunc driver provided to the scheduler. If 
the driver then decides to call it outside the scheduler paths it can do 
that today with other vfuncs too. Or worse.

And it would be well defined in the API contract as something scheduler 
calls in order on scheduler shutdown.
  >>>    };
>>>    
>>>    /**
>>> @@ -533,6 +547,8 @@ struct drm_sched_backend_ops {
>>>     *            timeout interval is over.
>>>     * @pending_list: the list of jobs which are currently in the job
>>> queue.
>>>     * @job_list_lock: lock to protect the pending_list.
>>> + * @pending_list_waitque: a waitqueue for drm_sched_fini() to
>>> block on until all
>>> + *		          pending jobs have been finished.
>>>     * @hang_limit: once the hangs by a job crosses this limit then
>>> it is marked
>>>     *              guilty and it will no longer be considered for
>>> scheduling.
>>>     * @score: score to help loadbalancer pick a idle sched
>>> @@ -540,6 +556,7 @@ struct drm_sched_backend_ops {
>>>     * @ready: marks if the underlying HW is ready to work
>>>     * @free_guilty: A hit to time out handler to free the guilty
>>> job.
>>>     * @pause_submit: pause queuing of @work_run_job on @submit_wq
>>> + * @pause_free: pause queueing of @work_free_job on @submit_wq
>>>     * @own_submit_wq: scheduler owns allocation of @submit_wq
>>>     * @dev: system &struct device
>>>     *
>>> @@ -562,12 +579,14 @@ struct drm_gpu_scheduler {
>>>    	struct delayed_work		work_tdr;
>>>    	struct list_head		pending_list;
>>>    	spinlock_t			job_list_lock;
>>> +	wait_queue_head_t		pending_list_waitque;
>>>    	int				hang_limit;
>>>    	atomic_t                        *score;
>>>    	atomic_t                        _score;
>>>    	bool				ready;
>>>    	bool				free_guilty;
>>>    	bool				pause_submit;
>>> +	bool				pause_free;
>>>    	bool				own_submit_wq;
>>>    	struct device			*dev;
>>>    };
>>
>> And, as you know, another thing I don't understand is why would we
>> choose to add more of the state machine when I have shown how it can
>> be
>> done more elegantly. You don't have to reply, this is more a for the
>> record against v3.
> 
> I do like your approach to a degree, and I reimplemented and tested it
> during the last days! Don't think I just easily toss aside a good idea;
> in fact, weighing between both approaches did cause me some headache :)
> 
> The thing is that while implementing it for the unit tests (not even to
> begin with Nouveau, where the implementation is a bit more difficult
> because some helpers need to be moved), I ran into a ton of faults
> because of how the tests are constructed. When do I have to cancel
> which timer for which job, all before calling drm_sched_fini(), or each
> one separately in cancel_job()? What about timedout jobs?
> 
> This [1] for exmaple is an implementation attempt I made which differs
> only slightly from yours but does not work and causes all sorts of
> issues with timer interrupts.
> 
> Now, that could obviously be fixed, and maybe I fail – but the thing
> is, if I can fail, others can, too. And porting the unit tests is a
> good beta-test.

Well you did not come up with the whole series also in a day, took quite 
some time, so the fact converting unit tests also took some time is not 
a red flag for any approach.

> When you look at the waitqueue solution, it is easy to implement for
> both Nouveau and sched/tests, with minimal adjustments. My approach
> works for both and is already well tested in Nouveau.
> 
> The ease with which it can be used and the simplicity of the contract
> ("signal all fences!") gives me confidence that this is, despite the
> larger state machine, more maintainable and that it's easier to port
> other drivers to the new cleanup method. I've had some success with
> similar approaches when cleaning up 16 year old broken PCI code [2].
> 
> Moreover, our long term goal should anyways be to, ideally, port all
> drivers to the new cleanup design and then make the callback mandatory.
> Then some places in drm_sched_fini() can be cleaned up, too.
> 
> Besides, the above reasons like the resistence against abuse of a
> cancel_job() also apply.
> 
> 
> Does that sound convincing? :)

Not yet I'm afraid.

If I look at the nouveau implementation I see eventually this:

nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
{
	struct nouveau_fence *fence, *tmp;
	unsigned long flags;

	spin_lock_irqsave(&fctx->lock, flags);
	list_for_each_entry_safe(fence, tmp, &fctx->pending, head) {
		if (error && !dma_fence_is_signaled_locked(&fence->base))
			dma_fence_set_error(&fence->base, error);

		if (nouveau_fence_signal(fence))
			nvif_event_block(&fctx->event);
	}
	fctx->killed = 1;
	spin_unlock_irqrestore(&fctx->lock, flags);
}


While my proposal was to have this in the scheduler core:

  void drm_sched_fini(struct drm_gpu_scheduler *sched)
  {
@@ -1397,6 +1395,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
         /* Confirm no work left behind accessing device structures */
         cancel_delayed_work_sync(&sched->work_tdr);

+       if (sched->ops->cancel_job) {
+               struct drm_sched_job *job;
+
+               list_for_each_entry_reverse(job, &sched->pending_list, 
list) {
+                       sched->ops->cancel_job(job);
+                       sched->ops->free_job(job);
+               }
+       }

Really similar loops. Would it be good match to make 
nouveau_cancel_job() simply like:

	spin_lock_irqsave(&fctx->lock, flags);
	if (!dma_fence_is_signaled_locked(&fence->base))
		dma_fence_set_error(&fence->base, ECANCELED);

	if (nouveau_fence_signal(fence))
		nvif_event_block(&fctx->event);

	spin_unlock_irqrestore(&fctx->lock, flags);

Assuming you can get to fctx from the fence. That doesn't work?

Or those chan->killed and fctx->killed are critical and have to happen 
before/after canceling jobs?

Regards,

Tvrtko

> P.
> 
> 
> [1] https://paste.debian.net/1376021/
> [2] https://lore.kernel.org/linux-pci/20250520085938.GB261485@rocinante/T/#m6e28eabdb22286238545c1fa6026445a4001d8e2
> 
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
> 

