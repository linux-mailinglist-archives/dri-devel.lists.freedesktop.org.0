Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F89AB9A40
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAB110EA4C;
	Fri, 16 May 2025 10:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="r/DU9WND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFA710EA44;
 Fri, 16 May 2025 10:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJf7n8meUFE1D7xOQ8/mGDyCpXfo3hlFKbxw8pTZT+U=; b=r/DU9WNDGhjYMULtQaU0d2tcf2
 pZKf3WrysA9bhojOYYposAfWyV93LQL51bP4+zy3COFl2XHstZQrCoJmVo5+poP3rKfEkx8KcFt7F
 yNA8mXSs4DJEK5PDev0BbilMhymIr2b2cV5seVWwLskJg9Mv+1JVhvIDFo4/jbK30nbD3+oymV/81
 /NGz+y0+kHA5foEMf+Kei/4wuQlYw5kdvKVUPNfk1iNncPGdMxhjakS+b9ypB3RFIC0tcmii26a60
 cTbzTSk3y8Ycu68MDrmonOR18/S/db7HSUfKDRxT2Ixn/w+HKIBFKSRzI+G1kG7TswSO/bGJAFZST
 wo59B8fw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFsIQ-0092iv-LR; Fri, 16 May 2025 12:34:05 +0200
Message-ID: <d66518e3-8670-454b-a290-21ecb5d57702@igalia.com>
Date: Fri, 16 May 2025 11:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/sched: Prevent teardown waitque from blocking
 too long
To: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-4-phasta@kernel.org>
 <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com>
 <e627335ea7d0cbb1f8b92ad5fd936466b19c3ec7.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <e627335ea7d0cbb1f8b92ad5fd936466b19c3ec7.camel@mailbox.org>
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


On 16/05/2025 10:54, Philipp Stanner wrote:
> On Fri, 2025-05-16 at 10:33 +0100, Tvrtko Ursulin wrote:
>>
>> On 24/04/2025 10:55, Philipp Stanner wrote:
>>> The waitqueue that ensures that drm_sched_fini() blocks until the
>>> pending_list has become empty could theoretically cause that
>>> function to
>>> block for a very long time. That, ultimately, could block userspace
>>> procesess and prevent them from being killable through SIGKILL.
>>>
>>> When a driver calls drm_sched_fini(), it is safe to assume that all
>>> still pending jobs are not needed anymore anyways. Thus, they can
>>> be
>>> cancelled and thereby it can be ensured that drm_sched_fini() will
>>> return relatively quickly.
>>>
>>> Implement a new helper to stop all work items / submission except
>>> for
>>> the drm_sched_backend_ops.run_job().
>>>
>>> Implement a driver callback, kill_fence_context(), that instructs
>>> the
>>> driver to kill the fence context associated with this scheduler,
>>> thereby
>>> causing all pending hardware fences to be signalled.
>>>
>>> Call those new routines in drm_sched_fini() and ensure backwards
>>> compatibility if the new callback is not implemented.
>>>
>>> Suggested-by: Danilo Krummrich <dakr@redhat.com>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 47 +++++++++++++++++----
>>> -----
>>>    include/drm/gpu_scheduler.h            | 11 ++++++
>>>    2 files changed, 42 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index ea82e69a72a8..c2ad6c70bfb6 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1390,31 +1390,46 @@ drm_sched_no_jobs_pending(struct
>>> drm_gpu_scheduler *sched)
>>>    	return empty;
>>>    }
>>>    
>>> +/**
>>> + * drm_sched_cancel_jobs_and_wait - trigger freeing of all pending
>>> jobs
>>> + * @sched: scheduler instance
>>> + *
>>> + * Must only be called if &struct
>>> drm_sched_backend_ops.kill_fence_context is
>>> + * implemented.
>>> + *
>>> + * Instructs the driver to kill the fence context associated with
>>> this scheduler,
>>> + * thereby signalling all pending fences. This, in turn, will
>>> trigger
>>> + * &struct drm_sched_backend_ops.free_job to be called for all
>>> pending jobs.
>>> + * The function then blocks until all pending jobs have been
>>> freed.
>>> + */
>>> +static inline void
>>> +drm_sched_cancel_jobs_and_wait(struct drm_gpu_scheduler *sched)
>>> +{
>>> +	sched->ops->kill_fence_context(sched);
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
>>> - * Note that this function blocks until all the fences returned by
>>> - * &struct drm_sched_backend_ops.run_job have been signalled.
>>> + * Tears down and cleans up the scheduler. Might leak memory if
>>> + * &struct drm_sched_backend_ops.kill_fence_context is not
>>> implemented.
>>>     */
>>>    void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>>    {
>>>    	struct drm_sched_entity *s_entity;
>>>    	int i;
>>>    
>>> -	/*
>>> -	 * Jobs that have neither been scheduled or which have
>>> timed out are
>>> -	 * gone by now, but jobs that have been submitted through
>>> -	 * backend_ops.run_job() and have not yet terminated are
>>> still pending.
>>> -	 *
>>> -	 * Wait for the pending_list to become empty to avoid
>>> leaking those jobs.
>>> -	 */
>>> -	drm_sched_submission_and_timeout_stop(sched);
>>> -	wait_event(sched->pending_list_waitque,
>>> drm_sched_no_jobs_pending(sched));
>>> -	drm_sched_free_stop(sched);
>>> +	if (sched->ops->kill_fence_context) {
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
>>> @@ -1502,7 +1517,7 @@ bool drm_sched_wqueue_ready(struct
>>> drm_gpu_scheduler *sched)
>>>    EXPORT_SYMBOL(drm_sched_wqueue_ready);
>>>    
>>>    /**
>>> - * drm_sched_wqueue_stop - stop scheduler submission
>>> + * drm_sched_wqueue_stop - stop scheduler submission and freeing
>>
>> Looks like the kerneldoc corrections (below too) belong to the
>> previous
>> patch. Irrelevant if you decide to squash them though.
>>
>>>     * @sched: scheduler instance
>>>     *
>>>     * Stops the scheduler from pulling new jobs from entities. It
>>> also stops
>>> @@ -1518,7 +1533,7 @@ void drm_sched_wqueue_stop(struct
>>> drm_gpu_scheduler *sched)
>>>    EXPORT_SYMBOL(drm_sched_wqueue_stop);
>>>    
>>>    /**
>>> - * drm_sched_wqueue_start - start scheduler submission
>>> + * drm_sched_wqueue_start - start scheduler submission and freeing
>>>     * @sched: scheduler instance
>>>     *
>>>     * Restarts the scheduler after drm_sched_wqueue_stop() has
>>> stopped it.
>>> diff --git a/include/drm/gpu_scheduler.h
>>> b/include/drm/gpu_scheduler.h
>>> index d0b1f416b4d9..8630b4a26f10 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -509,6 +509,17 @@ struct drm_sched_backend_ops {
>>>             * and it's time to clean it up.
>>>    	 */
>>>    	void (*free_job)(struct drm_sched_job *sched_job);
>>> +
>>> +	/**
>>> +	 * @kill_fence_context: kill the fence context belonging
>>> to this scheduler
>>
>> Which fence context would that be? ;)
>>
>> Also, "fence context" would be a new terminology in gpu_scheduler.h
>> API
>> level. You could call it ->sched_fini() or similar to signify at
>> which
>> point in the API it gets called and then the fact it takes sched as
>> parameter would be natural.
>>
>> We also probably want some commentary on the topic of indefinite (or
>> very long at least) blocking a thread exit / SIGINT/TERM/KILL time.
>> Cover letter touches upon that problem but I don't see you address
>> it.
>> Is the idea to let drivers shoot themselves in the foot or what?
> 
> You didn't seriously just write that, did you?
> 
> Yes, my intention clearly has been since September to make things
> worse, more ambiguous and destroy drivers. That's why I'm probably the
> only individual after Sima (who added some of the FIXMEs) who ever
> bothered documenting all this mess here, and warning people about the
> five hundred pitfalls, like three different start and stop functions,
> implicit refcount rules and God knows which other insane hacks that
> simply move driver problems into common infrastructure.
> 
> Reconsider your attitude.

I don't know what kind of attitude you think I was expressing. If the 
last sentence was a hyperbole too much for you then sorry. Point was in 
the paragraph ending with that - to document callback must not block, or 
if it has to to discuss for how long. And to perhaps discuss if 
scheduler code should impose a limit. Otherwise the indefinite block on 
thread exit from the cover letter can still happen. I don't see raising 
those point is a criticism of your overall work. (Fact that we don't see 
eye to eye regarding more state machine vs the ->cancel_job() 
alternative aside.)

Regards,

Tvrtko


> 
> P.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> +	 *
>>> +	 * Needed to cleanly tear the scheduler down in
>>> drm_sched_fini(). This
>>> +	 * callback will cause all hardware fences to be signalled
>>> by the driver,
>>> +	 * which, ultimately, ensures that all jobs get freed
>>> before teardown.
>>> +	 *
>>> +	 * This callback is optional, but it is highly recommended
>>> to implement it.
>>> +	 */
>>> +	void (*kill_fence_context)(struct drm_gpu_scheduler
>>> *sched);
>>>    };
>>>    
>>>    /**
>>
> 

