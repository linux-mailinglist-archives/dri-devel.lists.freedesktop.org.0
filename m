Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76507978515
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F9410ED3F;
	Fri, 13 Sep 2024 15:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="f2Hv8kKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAAC10ED3F;
 Fri, 13 Sep 2024 15:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S5FCZilmqkesXRI0ZL+cyhpKJBtsQuqmEmQbKy6vUf0=; b=f2Hv8kKGjMRQXlIS9viUvB2edy
 MLltQsi9ZoLylJ6umR/u4JDutl7iZ3ow70ncqCYGNi8v6bzzpTWMqolinS0JNAic38CJJmLnUGU0B
 cbeelOPGUbMZY1i9h2LgAohNqXL3t94EDDk43jzQSawAcUJ90ff+EqP+UquojzmZvZIXgfaUOeH/u
 XFWtiC+BZg16Be/SSwSbbwZJMzheQqyHUCVrAAcf7jXh9B+GRwx8Be3A50szBfkW7u8q1LLHbehvz
 3x6ALCd8NAH23NAZhOnamCchD0mOWo0AHjN5lA+KzuEWLWP03UrKAi0mshraL+gX3fDaTDorV4AVN
 hwz6r7/Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sp8Vk-00DOJO-Us; Fri, 13 Sep 2024 17:47:05 +0200
Message-ID: <e3d8e17c-bd4d-4164-a008-9618a9aeb385@igalia.com>
Date: Fri, 13 Sep 2024 16:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/sched: Further optimise drm_sched_entity_push_job
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-9-tursulin@igalia.com>
 <5be10361b0b77f2eaf54c52367b5c4e3934443ab.camel@redhat.com>
 <60d30fe6-9485-4cbe-8b72-69b3214edd3f@igalia.com>
 <661856cf6695ee063db2d49527b2ed539d941b8e.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <661856cf6695ee063db2d49527b2ed539d941b8e.camel@redhat.com>
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


On 13/09/2024 13:19, Philipp Stanner wrote:
> On Wed, 2024-09-11 at 13:22 +0100, Tvrtko Ursulin wrote:
>>
>> On 10/09/2024 11:25, Philipp Stanner wrote:
>>> On Mon, 2024-09-09 at 18:19 +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Having removed one re-lock cycle on the entity->lock in a patch
>>>> titled
>>>> "drm/sched: Optimise drm_sched_entity_push_job", with only a tiny
>>>> bit
>>>> larger refactoring we can do the same optimisation on the rq-
>>>>> lock
>>>> (Currently both drm_sched_rq_add_entity() and
>>>> drm_sched_rq_update_fifo_locked() take and release the same
>>>> lock.)
>>>>
>>>> To achieve this we rename drm_sched_rq_add_entity() to
>>>> drm_sched_rq_add_entity_locked(), making it expect the rq->lock
>>>> to be
>>>> held, and also add the same expectation to
>>>> drm_sched_rq_update_fifo_locked().
>>>>
>>>> For more stream-lining we also add the run-queue as an explicit
>>>> parameter
>>>> to drm_sched_rq_remove_fifo_locked() to avoid both callers and
>>>> callee
>>>> having to dereference entity->rq.
>>>
>>> Why is dereferencing it a problem?
>>
>> As you have noticed below the API is a bit unsightly. Consider for
>> example this call chain:
>>
>> drm_sched_entity_kill(entity)
>>       drm_sched_rq_remove_entity(entity->rq, entity);
>>           drm_sched_rq_remove_fifo_locked(entity);
>>               struct drm_sched_rq *rq = entity->rq;
>>
>> A bit confused, no?
>>
>> I thought adding rq to remove_fifo_locked at least removes one back
>> and
>> forth between the entity->rq and rq.
>>
>> And then if we cache the rq in a local variable, after having
>> explicitly
>> taken the correct lock, we have this other call chain example:
>>
>> drm_sched_entity_push_job()
>> ...
>>       rq = entity->rq;
>>       spin_lock(rq->lock);
>>
>>       drm_sched_rq_add_entity_locked(rq, entity);
>>       drm_sched_rq_update_fifo_locked(rq, entity, submit_ts);
>>
>>       spin_unlock(rq->lock);
>>
>> To me at least this reads more streamlined.
> 
> Alright, doesn't sound to bad, but
> 
>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_entity.c |  7 ++--
>>>>    drivers/gpu/drm/scheduler/sched_main.c   | 41 +++++++++++++----
>>>> -----
>>>> --
>>>>    include/drm/gpu_scheduler.h              |  7 ++--
>>>>    3 files changed, 31 insertions(+), 24 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index b4c4f9923e0b..2102c726d275 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -614,11 +614,14 @@ void drm_sched_entity_push_job(struct
>>>> drm_sched_job *sched_job)
>>>>    		sched = rq->sched;
>>>>    
>>>>    		atomic_inc(sched->score);
>>>> -		drm_sched_rq_add_entity(rq, entity);
>>>> +
>>>> +		spin_lock(&rq->lock);
>>>> +		drm_sched_rq_add_entity_locked(rq, entity);
>>>>    
>>>>    		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>> -			drm_sched_rq_update_fifo_locked(entity,
>>>> submit_ts);
>>>> +			drm_sched_rq_update_fifo_locked(entity,
>>>> rq,
>>>> submit_ts);
>>>>    
>>>> +		spin_unlock(&rq->lock);
>>>>    		spin_unlock(&entity->lock);
>>>>    
>>>>    		drm_sched_wakeup(sched, entity);
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 937e7d1cfc49..1ccd2aed2d32 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -153,41 +153,44 @@ static __always_inline bool
>>>> drm_sched_entity_compare_before(struct rb_node *a,
>>>>    	return ktime_before(ent_a->oldest_job_waiting, ent_b-
>>>>> oldest_job_waiting);
>>>>    }
>>>>    
>>>> -static inline void drm_sched_rq_remove_fifo_locked(struct
>>>> drm_sched_entity *entity)
>>>> +static void drm_sched_rq_remove_fifo_locked(struct
>>>> drm_sched_entity
>>>> *entity,
>>>> +					    struct drm_sched_rq
>>>> *rq)
> 
> I would then at least like to see a comment somewhere telling the
> reader why rq is taken as a separate variable. One might otherwise
> easily wonder why it's not obtained through the entity and what the
> difference is.

I failed to find a nice place to put it. I'll send v3 of the series with 
some changes soo and then please have another look at this patch and see 
if you can think of where it would look good.

Regards,

Tvrtko

> 
>>>
>>> So here we'd add a new function parameter that still doesn't allow
>>> for
>>> getting rid of 'entity' as a parameter.
>>
>> We can't get rid of the entity.
>>
>> Maaaybe instead we could get rid of the rq in the whole chain, I mean
>> from drm_sched_rq_add_entity and drm_sched_rq_remove_entity to start
>> with.
> 
> Let's postpone that.
> 
>>
>> But then to remove double re-lock we still (like in this patch) need
>> to
>> make the callers take the locks and rename the helpers with _locked
>> suffix. Otherwise it would be incosistent that a lock is taken
>> outside
>> the helpers with no _locked suffix.
>>
>> I am not sure if that is better. All it achieves is remove the rq as
>> explicit parameter my making the callees dereference it from the
>> entity.
> 
> OK, as I see it now it would actually be desirable to have suffix
> _locked indicate that the caller must hold all necessary locks. So your
> patch would actually make that consistent within drm/sched/.
> 
> Looks good
> 
> P.
> 
>>
>> Worst part is all these helpers have drm_sched_rq_ prefix.. which to
>> me
>> reads as "we operate on rq". So not passing in rq is confusing to
>> start
>> with.
>>
>> Granted, some confusion still remains with my approach since ideally,
>> to
>> those helpers, I wanted to add some asserts that rq == entity->rq...
>>
>>> The API gets larger that way and readers will immediately wonder
>>> why
>>> sth is passed as a separate variable that could also be obtained
>>> through the pointer.
>>>
>>>>    {
>>>> -	struct drm_sched_rq *rq = entity->rq;
>>>> -
>>>>    	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>>>    		rb_erase_cached(&entity->rb_tree_node, &rq-
>>>>> rb_tree_root);
>>>>    		RB_CLEAR_NODE(&entity->rb_tree_node);
>>>>    	}
>>>>    }
>>>>    
>>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>>> *entity, ktime_t ts)
>>>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>>> *entity,
>>>> +				     struct drm_sched_rq *rq,
>>>> +				     ktime_t ts)
>>>
>>> The function is still called _locked. That implies to the reader
>>> that
>>> this function takes care of locking. But it doesn't anymore.
>>> Instead,
>>>
>>>>    {
>>>>    	lockdep_assert_held(&entity->lock);
>>>> +	lockdep_assert_held(&rq->lock);
>>>>    
>>>> -	spin_lock(&entity->rq->lock);
>>>> -
>>>> -	drm_sched_rq_remove_fifo_locked(entity);
>>>> +	drm_sched_rq_remove_fifo_locked(entity, rq);
>>>>    
>>>>    	entity->oldest_job_waiting = ts;
>>>>    
>>>> -	rb_add_cached(&entity->rb_tree_node, &entity->rq-
>>>>> rb_tree_root,
>>>> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>>>    		      drm_sched_entity_compare_before);
>>>> -
>>>> -	spin_unlock(&entity->rq->lock);
>>>>    }
>>>>    
>>>>    void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
>>>> ktime_t ts)
>>>>    {
>>>> +	struct drm_sched_rq *rq;
>>>> +
>>>>    	/*
>>>>    	 * Both locks need to be grabbed, one to protect from
>>>> entity->rq change
>>>>    	 * for entity from within concurrent
>>>> drm_sched_entity_select_rq and the
>>>>    	 * other to update the rb tree structure.
>>>>    	 */
>>>>    	spin_lock(&entity->lock);
>>>> -	drm_sched_rq_update_fifo_locked(entity, ts);
>>>> +	rq = entity->rq;
>>>> +	spin_lock(&rq->lock);
>>>> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
>>>> +	spin_unlock(&rq->lock);
>>>
>>> its caller, drm_sched_rq_update_fifo(), now takes care of the
>>> locking.
>>> So if it all drm_sched_rq_update_fifo_locked() should be called
>>> drm_sched_rq_update_fifo_unlocked().
>>>
>>> If such a change is really being done, we have to go through the
>>> entire
>>> scheduler and make sure that the suffix "_locked" is used
>>> consistently
>>> throughout the scheduler. And even better, as consistent with the
>>> kernel as possible.
>>
>> Use of _locked follows the existing pattern of
>> drm_sched_rq_remove_fifo_locked :shrug:
>>
>> Are you referring to drm_sched_start_timeout(_unlocked) which is the
>> opposite pattern? (Although a more recent addition.)
>>
>> The wider kernel also uses both patterns so don't know. Would be nice
>> to
>> align in the scheduler but drm_sched_start_timeout is out of scope
>> for
>> this series.
>>
>>> To be honest folks, I don't think this entire "optimization" patch
>>> is
>>> that much of a good idea. The scheduler has real, big problems,
>>> such as
>>> race conditions, memory leaks and lack of documentation.
>>>
>>> I think we should for the forseeable future dedicate our attention
>>> towards solving those problems, instead of optimizing things.
>>> Especially if the optimization might decrease readability as with
>>> the
>>> naming here.
>>
>> In principle I agree, but on the other hand lets first see if this
>> patch
>> is really making things any worse, or is perhaps just maintaining the
>> status quo in the API elegance department, while at the same time
>> removing the quite lazy double re-lock from the main submission path.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> P.
>>>
>>>
>>>>    	spin_unlock(&entity->lock);
>>>>    }
>>>>    
>>>> @@ -210,25 +213,23 @@ static void drm_sched_rq_init(struct
>>>> drm_gpu_scheduler *sched,
>>>>    }
>>>>    
>>>>    /**
>>>> - * drm_sched_rq_add_entity - add an entity
>>>> + * drm_sched_rq_add_entity_locked - add an entity
>>>>     *
>>>>     * @rq: scheduler run queue
>>>>     * @entity: scheduler entity
>>>>     *
>>>>     * Adds a scheduler entity to the run queue.
>>>>     */
>>>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>> -			     struct drm_sched_entity *entity)
>>>> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
>>>> +				    struct drm_sched_entity
>>>> *entity)
>>>>    {
>>>> +	lockdep_assert_held(&rq->lock);
>>>> +
>>>>    	if (!list_empty(&entity->list))
>>>>    		return;
>>>>    
>>>> -	spin_lock(&rq->lock);
>>>> -
>>>>    	atomic_inc(rq->sched->score);
>>>>    	list_add_tail(&entity->list, &rq->entities);
>>>> -
>>>> -	spin_unlock(&rq->lock);
>>>>    }
>>>>    
>>>>    /**
>>>> @@ -242,6 +243,8 @@ void drm_sched_rq_add_entity(struct
>>>> drm_sched_rq
>>>> *rq,
>>>>    void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>    				struct drm_sched_entity *entity)
>>>>    {
>>>> +	lockdep_assert_held(&entity->lock);
>>>> +
>>>>    	if (list_empty(&entity->list))
>>>>    		return;
>>>>    
>>>> @@ -254,7 +257,7 @@ void drm_sched_rq_remove_entity(struct
>>>> drm_sched_rq *rq,
>>>>    		rq->current_entity = NULL;
>>>>    
>>>>    	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>> -		drm_sched_rq_remove_fifo_locked(entity);
>>>> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>>>>    
>>>>    	spin_unlock(&rq->lock);
>>>>    }
>>>> diff --git a/include/drm/gpu_scheduler.h
>>>> b/include/drm/gpu_scheduler.h
>>>> index 5a1e4c803b90..2ad33e2fe2d2 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -591,13 +591,14 @@ bool drm_sched_dependency_optimized(struct
>>>> dma_fence* fence,
>>>>    				    struct drm_sched_entity
>>>> *entity);
>>>>    void drm_sched_fault(struct drm_gpu_scheduler *sched);
>>>>    
>>>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>> -			     struct drm_sched_entity *entity);
>>>> +void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
>>>> +				    struct drm_sched_entity
>>>> *entity);
>>>>    void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>    				struct drm_sched_entity
>>>> *entity);
>>>>    
>>>>    void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
>>>> ktime_t ts);
>>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>>> *entity, ktime_t ts);
>>>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>>> *entity,
>>>> +				     struct drm_sched_rq *rq,
>>>> ktime_t ts);
>>>>    
>>>>    int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>    			  enum drm_sched_priority priority,
>>>
>>
> 
