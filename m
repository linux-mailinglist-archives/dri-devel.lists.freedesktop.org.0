Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36FBB591A1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 11:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB6910E6E4;
	Tue, 16 Sep 2025 09:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lQxQHID+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047D010E740;
 Tue, 16 Sep 2025 09:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ht6dtf2B4lNoeSax/9id9vpJqZdGaIb7TfEbNQYVf4w=; b=lQxQHID+hADodVXgWFlJv6EoJ4
 gh83RMpUGqpk76KbFhLzKyQ+Qp2nMw9nW50XmbF4FQ0AoTNuUSVSnQ5/nRUWFhl/NKBveaF/oP40t
 myPyKWO9ZYwohpgh3zfFWDTfUl+8E0Hg9VHfm1PPOjO3lKbXSskH7LBwGVdXVFL8TM2+9FQYY7Vqq
 wfvEuOGh3p5qF16PNE54sBs/sjOnazfnIG1JECCVR2PBZvburJXd79BUcTudgw9MF1vHsRkTCsMeQ
 ei+aAfo+6ADx+EcvhqEZdf7vjbq9qvfxFhYwx1EiuOvrk86bMV77rsyUqKuKn8M7zZtiSuOj/doA1
 hdftJz1Q==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uyRbs-00CB5s-Fa; Tue, 16 Sep 2025 11:04:24 +0200
Message-ID: <996f7a3a-26ca-4034-a608-8f316a7eee66@igalia.com>
Date: Tue, 16 Sep 2025 10:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v8 04/12] drm/sched: Consolidate entity run queue management
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
References: <20250903101820.63032-1-tvrtko.ursulin@igalia.com>
 <20250903101820.63032-5-tvrtko.ursulin@igalia.com>
 <6fe010e8dc5e8a5db35d8702960f42940e342093.camel@mailbox.org>
 <73681fac-ef47-4005-87ad-cea0b91e6813@igalia.com>
 <9ce2b23820b4d56123eba515b01f282af4380a7c.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <9ce2b23820b4d56123eba515b01f282af4380a7c.camel@mailbox.org>
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


On 16/09/2025 08:41, Philipp Stanner wrote:
> On Thu, 2025-09-11 at 15:55 +0100, Tvrtko Ursulin wrote:
>>
>> On 11/09/2025 15:20, Philipp Stanner wrote:
>>> On Wed, 2025-09-03 at 11:18 +0100, Tvrtko Ursulin wrote:
>>>> Move the code dealing with entities entering and exiting run queues to
>>>> helpers to logically separate it from jobs entering and exiting entities.
>>>
>>> Sorry if I've asked this before, but does this strictly depend on the
>>> preceding patches or could it be branched out?
>>
>> There is no fundamental dependency so I could re-order and pull it ahead
>> if you are certain that is what you prefer?
> 
> Well, you know my opinion: If it's a general improvement not directly
> necessary for a series, it should be send separately.
> 
> For this patch, however, I'm not even sure whether it's really
> improving the code base. The number of functions seems the same, just
> with different names, and the code base gets even slightly larger.

There is one new function actually (pop). But one previously exported 
gets hidden as implementation details (rbtree update).

> Can you elaborate a bit on why you think this patch makes sense?

Before the patch we have sched_main.c implement 
drm_sched_rq_remove_entity() as an interface operating on run-queues and 
used by the entity code. It handles both the the entity list and the 
FIFO rbtree. All good there.

Other two operations which operate on those two data structures are add 
and pop.

But while the existing drm_sched_rq_add_entity() from the name sounds 
analogous to drm_sched_rq_remove_entity(), in reality it isn't. It only 
handles the entity list part, while the FIFO rbtree is open coded in 
sched_entity.c.

Job pop is the same - rbtree hanlding is open coded in sched_entity.c.

The patch consolidates all of the entity run queue management into 
contained API which is aligned with the above mentioned existing 
drm_sched_rq_remove_entity().

Drm_sched_rq_add_entity() gets conceptualy aligned with 
drm_sched_rq_remove_entity() with rbtree operations removed from 
sched_entity.c.

Drm_sched_rq_pop_entity() is added with the same effect.

The two new pieces of API are implemented next to 
drm_sched_rq_remove_entity() in sched_main.c. (Later I move all three, 
together with other bits relating to run queue management to a new 
sched_rq.c.)

Regards,

Tvrtko

>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_entity.c   | 64 ++-------------
>>>>    drivers/gpu/drm/scheduler/sched_internal.h |  8 +-
>>>>    drivers/gpu/drm/scheduler/sched_main.c     | 95 +++++++++++++++++++---
>>>>    3 files changed, 91 insertions(+), 76 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 4852006f2308..7a0a52ba87bf 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -456,24 +456,9 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>>>>    	return NULL;
>>>>    }
>>>>    
>>>> -static ktime_t
>>>> -drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity *entity)
>>>> -{
>>>> -	ktime_t ts;
>>>> -
>>>> -	lockdep_assert_held(&entity->lock);
>>>> -	lockdep_assert_held(&rq->lock);
>>>> -
>>>> -	ts = ktime_add_ns(rq->rr_ts, 1);
>>>> -	entity->rr_ts = ts;
>>>> -	rq->rr_ts = ts;
>>>> -
>>>> -	return ts;
>>>> -}
>>>> -
>>>>    struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>    {
>>>> -	struct drm_sched_job *sched_job, *next_job;
>>>> +	struct drm_sched_job *sched_job;
>>>>    
>>>>    	sched_job = drm_sched_entity_queue_peek(entity);
>>>>    	if (!sched_job)
>>>> @@ -502,26 +487,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>    
>>>>    	spsc_queue_pop(&entity->job_queue);
>>>>    
>>>> -	/*
>>>> -	 * Update the entity's location in the min heap according to
>>>> -	 * the timestamp of the next job, if any.
>>>> -	 */
>>>> -	next_job = drm_sched_entity_queue_peek(entity);
>>>> -	if (next_job) {
>>>> -		struct drm_sched_rq *rq;
>>>> -		ktime_t ts;
>>>> -
>>>> -		spin_lock(&entity->lock);
>>>> -		rq = entity->rq;
>>>> -		spin_lock(&rq->lock);
>>>> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>> -			ts = next_job->submit_ts;
>>>> -		else
>>>> -			ts = drm_sched_rq_get_rr_ts(rq, entity);
>>>> -		drm_sched_rq_update_fifo_locked(entity, rq, ts);
>>>> -		spin_unlock(&rq->lock);
>>>> -		spin_unlock(&entity->lock);
>>>> -	}
>>>> +	drm_sched_rq_pop_entity(entity);
>>>>    
>>>>    	/* Jobs and entities might have different lifecycles. Since we're
>>>>    	 * removing the job from the entities queue, set the jobs entity pointer
>>>> @@ -611,30 +577,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>    	/* first job wakes up scheduler */
>>>>    	if (first) {
>>>>    		struct drm_gpu_scheduler *sched;
>>>> -		struct drm_sched_rq *rq;
>>>>    
>>>> -		/* Add the entity to the run queue */
>>>> -		spin_lock(&entity->lock);
>>>> -		if (entity->stopped) {
>>>> -			spin_unlock(&entity->lock);
>>>> -
>>>> -			DRM_ERROR("Trying to push to a killed entity\n");
>>>> -			return;
>>>> -		}
>>>> -
>>>> -		rq = entity->rq;
>>>> -		sched = rq->sched;
>>>> -
>>>> -		spin_lock(&rq->lock);
>>>> -		drm_sched_rq_add_entity(rq, entity);
>>>> -		if (drm_sched_policy == DRM_SCHED_POLICY_RR)
>>>> -			submit_ts = entity->rr_ts;
>>>> -		drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>>>> -
>>>> -		spin_unlock(&rq->lock);
>>>> -		spin_unlock(&entity->lock);
>>>> -
>>>> -		drm_sched_wakeup(sched);
>>>> +		sched = drm_sched_rq_add_entity(entity, submit_ts);
>>>> +		if (sched)
>>>> +			drm_sched_wakeup(sched);
>>>>    	}
>>>>    }
>>>>    EXPORT_SYMBOL(drm_sched_entity_push_job);
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
>>>> index 7ea5a6736f98..8269c5392a82 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_internal.h
>>>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>>>> @@ -12,13 +12,11 @@ extern int drm_sched_policy;
>>>>    
>>>>    void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>>>>    
>>>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>> -			     struct drm_sched_entity *entity);
>>>> +struct drm_gpu_scheduler *
>>>> +drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts);
>>>>    void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>    				struct drm_sched_entity *entity);
>>>> -
>>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>>> -				     struct drm_sched_rq *rq, ktime_t ts);
>>>> +void drm_sched_rq_pop_entity(struct drm_sched_entity *entity);
>>>>    
>>>>    void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
>>>>    struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 1db0a4aa1d46..c53931e63458 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -151,9 +151,9 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>>>>    	}
>>>>    }
>>>>    
>>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>>> -				     struct drm_sched_rq *rq,
>>>> -				     ktime_t ts)
>>>> +static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>>> +					    struct drm_sched_rq *rq,
>>>> +					    ktime_t ts)
>>>>    {
>>>>    	/*
>>>>    	 * Both locks need to be grabbed, one to protect from entity->rq change
>>>> @@ -191,22 +191,45 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>>>    /**
>>>>     * drm_sched_rq_add_entity - add an entity
>>>>     *
>>>> - * @rq: scheduler run queue
>>>>     * @entity: scheduler entity
>>>> + * @ts: submission timestamp
>>>>     *
>>>>     * Adds a scheduler entity to the run queue.
>>>> + *
>>>> + * Returns a DRM scheduler pre-selected to handle this entity.
>>>>     */
>>>> -void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>> -			     struct drm_sched_entity *entity)
>>>> +struct drm_gpu_scheduler *
>>>> +drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
>>>>    {
>>>> -	lockdep_assert_held(&entity->lock);
>>>> -	lockdep_assert_held(&rq->lock);
>>>> +	struct drm_gpu_scheduler *sched;
>>>> +	struct drm_sched_rq *rq;
>>>>    
>>>> -	if (!list_empty(&entity->list))
>>>> -		return;
>>>> +	/* Add the entity to the run queue */
>>>> +	spin_lock(&entity->lock);
>>>> +	if (entity->stopped) {
>>>> +		spin_unlock(&entity->lock);
>>>>    
>>>> -	atomic_inc(rq->sched->score);
>>>> -	list_add_tail(&entity->list, &rq->entities);
>>>> +		DRM_ERROR("Trying to push to a killed entity\n");
>>>> +		return NULL;
>>>> +	}
>>>> +
>>>> +	rq = entity->rq;
>>>> +	spin_lock(&rq->lock);
>>>> +	sched = rq->sched;
>>>> +
>>>> +	if (list_empty(&entity->list)) {
>>>> +		atomic_inc(sched->score);
>>>> +		list_add_tail(&entity->list, &rq->entities);
>>>> +	}
>>>> +
>>>> +	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
>>>> +		ts = entity->rr_ts;
>>>> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
>>>> +
>>>> +	spin_unlock(&rq->lock);
>>>> +	spin_unlock(&entity->lock);
>>>> +
>>>> +	return sched;
>>>>    }
>>>>    
>>>>    /**
>>>> @@ -235,6 +258,54 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>    	spin_unlock(&rq->lock);
>>>>    }
>>>>    
>>>> +static ktime_t
>>>> +drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity *entity)
>>>> +{
>>>> +	ktime_t ts;
>>>> +
>>>> +	lockdep_assert_held(&entity->lock);
>>>> +	lockdep_assert_held(&rq->lock);
>>>> +
>>>> +	ts = ktime_add_ns(rq->rr_ts, 1);
>>>> +	entity->rr_ts = ts;
>>>> +	rq->rr_ts = ts;
>>>> +
>>>> +	return ts;
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_sched_rq_pop_entity - pops an entity
>>>> + *
>>>> + * @entity: scheduler entity
>>>> + *
>>>> + * To be called every time after a job is popped from the entity.
>>>> + */
>>>> +void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>>>> +{
>>>> +	struct drm_sched_job *next_job;
>>>> +	struct drm_sched_rq *rq;
>>>> +	ktime_t ts;
>>>> +
>>>> +	/*
>>>> +	 * Update the entity's location in the min heap according to
>>>> +	 * the timestamp of the next job, if any.
>>>> +	 */
>>>> +	next_job = drm_sched_entity_queue_peek(entity);
>>>> +	if (!next_job)
>>>> +		return;
>>>> +
>>>> +	spin_lock(&entity->lock);
>>>> +	rq = entity->rq;
>>>> +	spin_lock(&rq->lock);
>>>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>> +		ts = next_job->submit_ts;
>>>> +	else
>>>> +		ts = drm_sched_rq_get_rr_ts(rq, entity);
>>>> +	drm_sched_rq_update_fifo_locked(entity, rq, ts);
>>>> +	spin_unlock(&rq->lock);
>>>> +	spin_unlock(&entity->lock);
>>>> +}
>>>> +
>>>>    /**
>>>>     * drm_sched_rq_select_entity - Select an entity which provides a job to run
>>>>     *
>>>
>>
> 

