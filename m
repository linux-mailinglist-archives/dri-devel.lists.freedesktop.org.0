Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB3AF9291
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68E510EA19;
	Fri,  4 Jul 2025 12:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ldJBXSYz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F179610EA18;
 Fri,  4 Jul 2025 12:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0xfZqBp17aRS6MxoH8oIJF+tAVuvVXaqV0rJ/wtD2Ng=; b=ldJBXSYz7KzJMMVpkDqKFAtjMp
 ByXKmWZgWhQyFOwT4xlWUFrEy62aQ/t2fdUBJZ6y+FeiFrC7pPX51zggyg76zOkcYNqANfd9i5QdX
 iUukzKGJXe1M/4YqiQeyKB5mDyJpfHk6DrvKnXefeImwD71FdVAA+jSPu6aYb/2kfN85laAnV/S7x
 BbHBUh2a32uVYZQ5gK7WmigO8v8tVAAWEWr3Cp3o5IszvrLO2eTjdildqbtzjBYkoAmKq/qIY+2sR
 pscHq1GMXZNCN7FR0n8TsbwBnYnehUEpccE76EAemBdmoJ5G1OAEGf73XYKdOkUXZm7R1SZT/M9sm
 JGY3uSjg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXfYH-00CQTY-B5; Fri, 04 Jul 2025 14:30:01 +0200
Message-ID: <da5fefba-7222-4d77-9528-51eef235c36a@igalia.com>
Date: Fri, 4 Jul 2025 13:30:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/sched/tests: Port to cancel_job()
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250701132142.76899-3-phasta@kernel.org>
 <20250701132142.76899-5-phasta@kernel.org>
 <f9b55d5b-0018-4850-a9b7-2f267467e957@igalia.com>
 <6762d33b4fe8e7b264a7403f228e6ec6723ae623.camel@mailbox.org>
 <9a070a66-f6fd-45b4-958c-c6e9f3487a0c@igalia.com>
 <fc61c7c9d5d341d752458d0ee6313ec932803ab3.camel@mailbox.org>
 <298eeb951676d24981f1d9208b076ec03563a3ae.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <298eeb951676d24981f1d9208b076ec03563a3ae.camel@mailbox.org>
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


On 04/07/2025 12:27, Philipp Stanner wrote:
> On Fri, 2025-07-04 at 11:53 +0200, Philipp Stanner wrote:
>> On Wed, 2025-07-02 at 12:25 +0100, Tvrtko Ursulin wrote:
>>>
>>> On 02/07/2025 11:56, Philipp Stanner wrote:
>>>> On Wed, 2025-07-02 at 11:36 +0100, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 01/07/2025 14:21, Philipp Stanner wrote:
>>>>>> The GPU Scheduler now supports a new callback, cancel_job(),
>>>>>> which
>>>>>> lets
>>>>>> the scheduler cancel all jobs which might not yet be freed
>>>>>> when
>>>>>> drm_sched_fini() runs. Using this callback allows for
>>>>>> significantly
>>>>>> simplifying the mock scheduler teardown code.
>>>>>>
>>>>>> Implement the cancel_job() callback and adjust the code where
>>>>>> necessary.
>>>>>
>>>>> Cross referencing against my version I think you missed this
>>>>> hunk:
>>>>>
>>>>> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
>>>>> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
>>>>> @@ -49,7 +49,6 @@ struct drm_mock_scheduler {
>>>>>
>>>>>     	spinlock_t		lock;
>>>>>     	struct list_head	job_list;
>>>>> -	struct list_head	done_list;
>>>>>
>>>>>     	struct {
>>>>>     		u64		context;
>>>>>
>>>>
>>>> Right, overlooked that one.
>>>>
>>>>>
>>>>> I also had this:
>>>>>
>>>>> @@ -97,7 +96,8 @@ struct drm_mock_sched_job {
>>>>>     	struct completion	done;
>>>>>
>>>>>     #define DRM_MOCK_SCHED_JOB_DONE		0x1
>>>>> -#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
>>>>> +#define DRM_MOCK_SCHED_JOB_CANCELED	0x2
>>>>> +#define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x4
>>>>>
>>>>> And was setting it in the callback. And since we should add a
>>>>> test to
>>>>> explicitly cover the new callback, and just the callback, that
>>>>> could
>>>>> make it very easy to do it.
>>>>
>>>> What do you imagine that to look like? The scheduler only invokes
>>>> the
>>>> callback on tear down.
>>>>
>>>> We also don't have tests that only test free_job() and the like,
>>>> do
>>>> we?
>>>>
>>>> You cannot test a callback for the scheduler, because the
>>>> callback
>>>> is
>>>> implemented in the driver.
>>>>
>>>> Callbacks are tested by using the scheduler. In this case, it's
>>>> tested
>>>> the intended way by the unit tests invoking drm_sched_free().
>>>
>>> Something like (untested):
>>>
>>> static void drm_sched_test_cleanup(struct kunit *test)
>>> {
>>> 	struct drm_mock_sched_entity *entity;
>>> 	struct drm_mock_scheduler *sched;
>>> 	struct drm_mock_sched_job job;
>>> 	bool done;
>>>
>>> 	/*
>>> 	 * Check that the job cancel callback gets invoked by the
>>> scheduler.
>>> 	 */
>>>
>>> 	sched = drm_mock_sched_new(test, MAX_SCHEDULE_TIMEOUT);
>>> 	entity = drm_mock_sched_entity_new(test,
>>> 					
>>> DRM_SCHED_PRIORITY_NORMAL,
>>> 					   sched);
>>>
>>> 	job = drm_mock_sched_job_new(test, entity);
>>> 	drm_mock_sched_job_submit(job);
>>> 	done = drm_mock_sched_job_wait_scheduled(job, HZ);
>>> 	KUNIT_ASSERT_TRUE(test, done);
>>>
>>> 	drm_mock_sched_entity_free(entity);
>>> 	drm_mock_sched_fini(sched);
>>>
>>> 	KUNIT_ASSERT_TRUE(test, job->flags &
>>> DRM_MOCK_SCHED_JOB_CANCELED);
>>> }
>>
>> That could work – but it's racy.
>>
>> I wonder if we want to introduce a mechanism into the mock scheduler
>> through which we can enforce a simulated GPU hang. Then it would
>> never
>> race, and that might be useful for more advanced tests for reset
>> recovery and those things.
>>
>> Opinions?
> 
> Ah wait, we can do that with job_duration = 0

Yes, the above already wasn't racy.

If job duration is not explicitly set, and it isn't, the job will not 
complete until test would call drm_mock_sched_advance(sched, 1). And 
since it doesn't, the job is guaranteed to be sitting on the list 
forever. So drm_sched_fini() has a guaranteed chance to clean it up.

> Very good, I'll include something like that in v2.

Ack.

Regards,

Tvrtko

>>> Or via the hw fence status.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>>> ---
>>>>>>     .../gpu/drm/scheduler/tests/mock_scheduler.c  | 66
>>>>>> +++++++--
>>>>>> -----
>>>>>> -----
>>>>>>     1 file changed, 23 insertions(+), 43 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>>>> b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>>>> index 49d067fecd67..2d3169d95200 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>>>>> @@ -63,7 +63,7 @@ static void
>>>>>> drm_mock_sched_job_complete(struct
>>>>>> drm_mock_sched_job *job)
>>>>>>     	lockdep_assert_held(&sched->lock);
>>>>>>     
>>>>>>     	job->flags |= DRM_MOCK_SCHED_JOB_DONE;
>>>>>> -	list_move_tail(&job->link, &sched->done_list);
>>>>>> +	list_del(&job->link);
>>>>>>     	dma_fence_signal_locked(&job->hw_fence);
>>>>>>     	complete(&job->done);
>>>>>>     }
>>>>>> @@ -236,26 +236,39 @@ mock_sched_timedout_job(struct
>>>>>> drm_sched_job
>>>>>> *sched_job)
>>>>>>     
>>>>>>     static void mock_sched_free_job(struct drm_sched_job
>>>>>> *sched_job)
>>>>>>     {
>>>>>> -	struct drm_mock_scheduler *sched =
>>>>>> -			drm_sched_to_mock_sched(sched_job-
>>>>>>> sched);
>>>>>>     	struct drm_mock_sched_job *job =
>>>>>> drm_sched_job_to_mock_job(sched_job);
>>>>>> -	unsigned long flags;
>>>>>>     
>>>>>> -	/* Remove from the scheduler done list. */
>>>>>> -	spin_lock_irqsave(&sched->lock, flags);
>>>>>> -	list_del(&job->link);
>>>>>> -	spin_unlock_irqrestore(&sched->lock, flags);
>>>>>>     	dma_fence_put(&job->hw_fence);
>>>>>> -
>>>>>>     	drm_sched_job_cleanup(sched_job);
>>>>>>     
>>>>>>     	/* Mock job itself is freed by the kunit framework.
>>>>>> */
>>>>>>     }
>>>>>>     
>>>>>> +static void mock_sched_cancel_job(struct drm_sched_job
>>>>>> *sched_job)
>>>>>> +{
>>>>>> +	struct drm_mock_scheduler *sched =
>>>>>> drm_sched_to_mock_sched(sched_job->sched);
>>>>>> +	struct drm_mock_sched_job *job =
>>>>>> drm_sched_job_to_mock_job(sched_job);
>>>>>> +	unsigned long flags;
>>>>>> +
>>>>>> +	hrtimer_cancel(&job->timer);
>>>>>> +
>>>>>> +	spin_lock_irqsave(&sched->lock, flags);
>>>>>> +	if (!dma_fence_is_signaled_locked(&job->hw_fence)) {
>>>>>> +		list_del(&job->link);
>>>>>> +		dma_fence_set_error(&job->hw_fence, -
>>>>>> ECANCELED);
>>>>>> +		dma_fence_signal_locked(&job->hw_fence);
>>>>>> +	}
>>>>>> +	spin_unlock_irqrestore(&sched->lock, flags);
>>>>>> +
>>>>>> +	/* The GPU Scheduler will call
>>>>>> drm_sched_backend_ops.free_job(), still.
>>>>>> +	 * Mock job itself is freed by the kunit framework.
>>>>>> */
>>>>>
>>>>> /*
>>>>>     * Multiline comment style to stay consistent, at least in
>>>>> this
>>>>> file.
>>>>>     */
>>>>>
>>>>> The rest looks good, but I need to revisit the timeout/free
>>>>> handling
>>>>> since it has been a while and you changed it recently.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> +}
>>>>>> +
>>>>>>     static const struct drm_sched_backend_ops
>>>>>> drm_mock_scheduler_ops
>>>>>> = {
>>>>>>     	.run_job = mock_sched_run_job,
>>>>>>     	.timedout_job = mock_sched_timedout_job,
>>>>>> -	.free_job = mock_sched_free_job
>>>>>> +	.free_job = mock_sched_free_job,
>>>>>> +	.cancel_job = mock_sched_cancel_job,
>>>>>>     };
>>>>>>     
>>>>>>     /**
>>>>>> @@ -289,7 +302,6 @@ struct drm_mock_scheduler
>>>>>> *drm_mock_sched_new(struct kunit *test, long timeout)
>>>>>>     	sched->hw_timeline.context =
>>>>>> dma_fence_context_alloc(1);
>>>>>>     	atomic_set(&sched->hw_timeline.next_seqno, 0);
>>>>>>     	INIT_LIST_HEAD(&sched->job_list);
>>>>>> -	INIT_LIST_HEAD(&sched->done_list);
>>>>>>     	spin_lock_init(&sched->lock);
>>>>>>     
>>>>>>     	return sched;
>>>>>> @@ -304,38 +316,6 @@ struct drm_mock_scheduler
>>>>>> *drm_mock_sched_new(struct kunit *test, long timeout)
>>>>>>      */
>>>>>>     void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
>>>>>>     {
>>>>>> -	struct drm_mock_sched_job *job, *next;
>>>>>> -	unsigned long flags;
>>>>>> -	LIST_HEAD(list);
>>>>>> -
>>>>>> -	drm_sched_wqueue_stop(&sched->base);
>>>>>> -
>>>>>> -	/* Force complete all unfinished jobs. */
>>>>>> -	spin_lock_irqsave(&sched->lock, flags);
>>>>>> -	list_for_each_entry_safe(job, next, &sched-
>>>>>>> job_list,
>>>>>> link)
>>>>>> -		list_move_tail(&job->link, &list);
>>>>>> -	spin_unlock_irqrestore(&sched->lock, flags);
>>>>>> -
>>>>>> -	list_for_each_entry(job, &list, link)
>>>>>> -		hrtimer_cancel(&job->timer);
>>>>>> -
>>>>>> -	spin_lock_irqsave(&sched->lock, flags);
>>>>>> -	list_for_each_entry_safe(job, next, &list, link)
>>>>>> -		drm_mock_sched_job_complete(job);
>>>>>> -	spin_unlock_irqrestore(&sched->lock, flags);
>>>>>> -
>>>>>> -	/*
>>>>>> -	 * Free completed jobs and jobs not yet processed by
>>>>>> the
>>>>>> DRM scheduler
>>>>>> -	 * free worker.
>>>>>> -	 */
>>>>>> -	spin_lock_irqsave(&sched->lock, flags);
>>>>>> -	list_for_each_entry_safe(job, next, &sched-
>>>>>>> done_list,
>>>>>> link)
>>>>>> -		list_move_tail(&job->link, &list);
>>>>>> -	spin_unlock_irqrestore(&sched->lock, flags);
>>>>>> -
>>>>>> -	list_for_each_entry_safe(job, next, &list, link)
>>>>>> -		mock_sched_free_job(&job->base);
>>>>>> -
>>>>>>     	drm_sched_fini(&sched->base);
>>>>>>     }
>>>>>>     
>>>>>
>>>>
>>>
>>
> 

