Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E369874B1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3757710EB52;
	Thu, 26 Sep 2024 13:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="c78g9rRl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA61310EB54;
 Thu, 26 Sep 2024 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9HfsQLk2e7WRVLH89AxiE7id9QffjB/l/nsauErf5bQ=; b=c78g9rRlXUhK9UsVUzwA9NqX9L
 o+nReP0r2c1dKdY1YotSlpaWuzj8UHsew9LBmoedZqHejh+KsJxYWWQnttrtuoaHqVhvnwnklgTQ1
 mn20VZJrkw/Ah/eC5gqU2Y47Kkq020DqknrFR8Xjqbm3S7vrIiooFFYEAavLNabecYFbeRomLpFte
 qg7bpN/p06UVUxOHPMKAg1OK78nvGftzyFhpfSmrBgLSpVwxdLuo/vvcXxfF6uq5AJTC0zQQDl9+v
 cO0FVhRPTLycWesYxKFMjAsO9rqdYr9aS+eKDpcZRClm8KWEdcaf92UqnIPWHIg/6P+kMNTYewoGN
 ZFVJhxRA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1stopr-001LKr-F1; Thu, 26 Sep 2024 15:47:11 +0200
Message-ID: <ebdbf13b-8c3a-48b5-b142-8712e62d01d3@igalia.com>
Date: Thu, 26 Sep 2024 14:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Further optimise drm_sched_entity_push_job
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20240913160559.49054-9-tursulin@igalia.com>
 <20240916173007.118-1-tursulin@igalia.com>
 <1650ecb9-ac8a-4199-8693-77c73a95bbbd@igalia.com>
 <a5dd98b71891ea0392d61e24cde8b35051035780.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <a5dd98b71891ea0392d61e24cde8b35051035780.camel@redhat.com>
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


On 26/09/2024 09:15, Philipp Stanner wrote:
> On Mon, 2024-09-23 at 15:35 +0100, Tvrtko Ursulin wrote:
>>
>> Ping Christian and Philipp - reasonably happy with v2? I think it's
>> the
>> only unreviewed patch from the series.
> 
> Howdy,
> 
> sry for the delay, I had been traveling.
> 
> I have a few nits below regarding the commit message. Besides, I'm OK
> with that, thx for your work :)

No worries.

>> On 16/09/2024 18:30, Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>> Having removed one re-lock cycle on the entity->lock in a patch
>>> titled
>>> "drm/sched: Optimise drm_sched_entity_push_job",
>>> with only a tiny bit
>>> larger refactoring we can do the same optimisation
> 
> Well, the commit message does not state which optimization that is. One
> would have to look for the previous patch, which you apparently cannot
> provide a commit ID for yet because it's not in Big Boss's branch.

With added emphasis:

"Having _removed one re-lock cycle_ on the entity-lock..."

"...do the same optimisation on the rq->lock."

How it is not clear?

> In this case I am for including a sentence about what is being
> optimized also because
> 
>>> on the rq->lock.
>>> (Currently both drm_sched_rq_add_entity() and
>>> drm_sched_rq_update_fifo_locked() take and release the same lock.)
>>>
>>> To achieve this we make drm_sched_rq_update_fifo_locked() and
> 
> it's not clear what the "this" that's being achieved is.

"This" is the optimisation previous paragraph talks about.

What/why followed by how.

I honestly think this part of the commit text is good enough.

>>> drm_sched_rq_add_entity() expect the rq->lock to be held.
>>>
>>> We also align drm_sched_rq_update_fifo_locked(),
>>> drm_sched_rq_add_entity() and
>>> drm_sched_rq_remove_fifo_locked() function signatures, by adding rq
>>> as a
>>> parameter to the latter.
>>>
>>> v2:
>>>    * Fix after rebase of the series.
>>>    * Avoid naming incosistency between drm_sched_rq_add/remove.
>>> (Christian)
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Reviewed-by: Philipp Stanner <pstanner@redhat.com>

Thank you!

>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_entity.c | 12 ++++++++--
>>>    drivers/gpu/drm/scheduler/sched_main.c   | 29 ++++++++++++-------
>>> -----
>>>    include/drm/gpu_scheduler.h              |  3 ++-
>>>    3 files changed, 26 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index d982cebc6bee..8ace1f1ea66b 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -515,9 +515,14 @@ struct drm_sched_job
>>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>    
>>>    		next = to_drm_sched_job(spsc_queue_peek(&entity-
>>>> job_queue));
>>>    		if (next) {
>>> +			struct drm_sched_rq *rq;
>>> +
>>>    			spin_lock(&entity->lock);
>>> -			drm_sched_rq_update_fifo_locked(entity,
>>> +			rq = entity->rq;
>>> +			spin_lock(&rq->lock);
>>> +			drm_sched_rq_update_fifo_locked(entity,
>>> rq,
>>>    							next-
>>>> submit_ts);
>>> +			spin_unlock(&rq->lock);
>>>    			spin_unlock(&entity->lock);
>>>    		}
>>>    	}
>>> @@ -618,11 +623,14 @@ void drm_sched_entity_push_job(struct
>>> drm_sched_job *sched_job)
>>>    		sched = rq->sched;
>>>    
>>>    		atomic_inc(sched->score);
>>> +
>>> +		spin_lock(&rq->lock);
>>>    		drm_sched_rq_add_entity(rq, entity);
>>>    
>>>    		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>> -			drm_sched_rq_update_fifo_locked(entity,
>>> submit_ts);
>>> +			drm_sched_rq_update_fifo_locked(entity,
>>> rq, submit_ts);
>>>    
>>> +		spin_unlock(&rq->lock);
>>>    		spin_unlock(&entity->lock);
>>>    
>>>    		drm_sched_wakeup(sched, entity);
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 18a952f73ecb..5c83fb92bb89 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -153,17 +153,18 @@ static __always_inline bool
>>> drm_sched_entity_compare_before(struct rb_node *a,
>>>    	return ktime_before(ent_a->oldest_job_waiting, ent_b-
>>>> oldest_job_waiting);
>>>    }
>>>    
>>> -static inline void drm_sched_rq_remove_fifo_locked(struct
>>> drm_sched_entity *entity)
>>> +static void drm_sched_rq_remove_fifo_locked(struct
> 
> I think the commit message should contain a short sentence about why
> you removed the inline.
> 
> AKA "As we're at it, remove the inline function specifier from
> drm_sched_rq_remove_fifo_locked() because XYZ"

Fair play on this one, should have mentioned it. Probably just removed 
the inline by habit while touching the function signature. Under the 
"compiler knows better" mantra.

Regards,

Tvrtko

>>> drm_sched_entity *entity,
>>> +					    struct drm_sched_rq
>>> *rq)
>>>    {
>>> -	struct drm_sched_rq *rq = entity->rq;
>>> -
>>>    	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>>    		rb_erase_cached(&entity->rb_tree_node, &rq-
>>>> rb_tree_root);
>>>    		RB_CLEAR_NODE(&entity->rb_tree_node);
>>>    	}
>>>    }
>>>    
>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>> *entity, ktime_t ts)
>>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>> *entity,
>>> +				     struct drm_sched_rq *rq,
>>> +				     ktime_t ts)
>>>    {
>>>    	/*
>>>    	 * Both locks need to be grabbed, one to protect from
>>> entity->rq change
>>> @@ -171,17 +172,14 @@ void drm_sched_rq_update_fifo_locked(struct
>>> drm_sched_entity *entity, ktime_t ts
>>>    	 * other to update the rb tree structure.
>>>    	 */
>>>    	lockdep_assert_held(&entity->lock);
>>> +	lockdep_assert_held(&rq->lock);
>>>    
>>> -	spin_lock(&entity->rq->lock);
>>> -
>>> -	drm_sched_rq_remove_fifo_locked(entity);
>>> +	drm_sched_rq_remove_fifo_locked(entity, rq);
>>>    
>>>    	entity->oldest_job_waiting = ts;
>>>    
>>> -	rb_add_cached(&entity->rb_tree_node, &entity->rq-
>>>> rb_tree_root,
>>> +	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>>    		      drm_sched_entity_compare_before);
>>> -
>>> -	spin_unlock(&entity->rq->lock);
>>>    }
>>>    
>>>    /**
>>> @@ -213,15 +211,14 @@ static void drm_sched_rq_init(struct
>>> drm_gpu_scheduler *sched,
>>>    void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>    			     struct drm_sched_entity *entity)
>>>    {
>>> +	lockdep_assert_held(&entity->lock);
>>> +	lockdep_assert_held(&rq->lock);
>>> +
>>>    	if (!list_empty(&entity->list))
>>>    		return;
>>>    
>>> -	spin_lock(&rq->lock);
>>> -
>>>    	atomic_inc(rq->sched->score);
>>>    	list_add_tail(&entity->list, &rq->entities);
>>> -
>>> -	spin_unlock(&rq->lock);
>>>    }
>>>    
>>>    /**
>>> @@ -235,6 +232,8 @@ void drm_sched_rq_add_entity(struct
>>> drm_sched_rq *rq,
>>>    void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>    				struct drm_sched_entity *entity)
>>>    {
>>> +	lockdep_assert_held(&entity->lock);
>>> +
>>>    	if (list_empty(&entity->list))
>>>    		return;
>>>    
>>> @@ -247,7 +246,7 @@ void drm_sched_rq_remove_entity(struct
>>> drm_sched_rq *rq,
>>>    		rq->current_entity = NULL;
>>>    
>>>    	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>> -		drm_sched_rq_remove_fifo_locked(entity);
>>> +		drm_sched_rq_remove_fifo_locked(entity, rq);
>>>    
>>>    	spin_unlock(&rq->lock);
>>>    }
>>> diff --git a/include/drm/gpu_scheduler.h
>>> b/include/drm/gpu_scheduler.h
>>> index 80198e6cf537..b21806d5a8eb 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -596,7 +596,8 @@ void drm_sched_rq_add_entity(struct
>>> drm_sched_rq *rq,
>>>    void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>    				struct drm_sched_entity *entity);
>>>    
>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>> *entity, ktime_t ts);
>>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>> *entity,
>>> +				     struct drm_sched_rq *rq,
>>> ktime_t ts);
>>>    
>>>    int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>    			  enum drm_sched_priority priority,
>>
> 
