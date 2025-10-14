Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51AFBD7DFA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DFF10E559;
	Tue, 14 Oct 2025 07:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Shfg1JlS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE06A10E0DB;
 Tue, 14 Oct 2025 07:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XJzIsdPBFSjsgn2mhW23Zf+l0qTIkxHeEiZeRGa8T6Y=; b=Shfg1JlS1nCvXsWC/GOGRdANG6
 KGB2DcqfhF52nXhXAovgiIOY5/H969ZL3nvHB26T2bLwLBe1Lxz1IdxCV2LWvj9Zx4n1GiM+UIYEV
 gFwf3TQVGIr9HrByRwR3Hy5qvXksyEvoU/aZYOh9H/0qA30wI/XW2IHLTDFtj1aCs1cRCMZ0DDHH/
 07BZR8g1ZDN5qA+aCHY9vSSw8oxHeErSr19Ejn4UXqrZJMURuSESUrGUS7TC5boX4gl/wFXbzqlEE
 K5SfJxzrqzGwzoSpA4k5tds4uC//eQ/TFMRGnWpn0cGKhZSIRQ9DpVZUxcIYvMU321EqL3fsGyBbf
 GFxDjCzQ==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1v8ZQ0-009ITm-Om; Tue, 14 Oct 2025 09:26:00 +0200
Message-ID: <cf661524-9207-4c52-a056-683b7f1a0ea6@igalia.com>
Date: Tue, 14 Oct 2025 08:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/28] drm/sched: Consolidate entity run queue management
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-6-tvrtko.ursulin@igalia.com>
 <762e3469df06787205af88e068d72f60dfaebda4.camel@mailbox.org>
 <fcec969c-5e25-4b81-891d-843ad569d04b@igalia.com>
 <50244c8f2c2dd4488288dabfbda6641389bd07aa.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <50244c8f2c2dd4488288dabfbda6641389bd07aa.camel@mailbox.org>
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


On 14/10/2025 07:53, Philipp Stanner wrote:
> On Sat, 2025-10-11 at 15:19 +0100, Tvrtko Ursulin wrote:
>>
>> On 10/10/2025 11:49, Philipp Stanner wrote:
>>> On Wed, 2025-10-08 at 09:53 +0100, Tvrtko Ursulin wrote:
>>>> Move the code dealing with entities entering and exiting run queues to
>>>> helpers to logically separate it from jobs entering and exiting entities.
>>>>
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
>>>
>>> `next_job` has been added in a previous job. Have you tried whether
>>> patch-order can be reversed?
>>>
>>> Just asking; I don't want to cause unnecessary work here
>>
>> You are correct that there would be some knock on effect on a few other
>> patches in the series but it is definitely doable. Because for certain
>> argument can be made it would be logical to have it like that. Both this
>> patch and "drm/sched: Move run queue related code into a separate file"
>> would be then moved ahead of "drm/sched: Implement RR via FIFO". If you
>> prefer it like that I can reshuffle no problem.
> 
> I mean, it seems to make the overall git diff smaller, which is nice?
> 
> If you don't see a significant reason against it, I'd say it's a good
> idea.

Okay deal. It isn't anything significant, just re-ordering patches with 
compile testing patches to ensure every step still builds.
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
>>>> index 8e62541b439a..e5d02c28665c 100644
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
>>>> @@ -191,22 +191,45 @@ static void drm_sched_rq_init(struct drm_sched_rq *rq,
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
>>>
>>> I'm not sure if it's a good idea to have the scheduler returned from
>>> that function. That doesn't make a whole lot of sense semantically.
>>>
>>> At the very least the function's docstring, maybe even its name, should
>>> be adjusted to detail why this makes sense. The commit message, too.
>>> It's not trivially understood.
>>>
>>> I think I get why it's being done, but writing it down black on white
>>> gives us something to grasp.
>>>
>>> Sth like "adds an entity to a runqueue, selects to appropriate
>>> scheduler and returns it for the purpose of XYZ"
>>
>> Yeah. Remeber your unlocked rq access slide and the discussion around it?
> 
> Sure. Is that related, though? The slide was about many readers being
> totally unlocked. The current drm_sched_entity_push_job() locks readers
> correctly if I'm not mistaken.
> 
>>
>> Currently we have this:
>>
>> drm_sched_entity_push_job()
>> {
>> ...
>> 		spin_lock(&entity->lock);
>> ...
>> 		rq = entity->rq;
>> 		sched = rq->sched;
>> ...
>> 		spin_unlock(&rq->lock);
>> 		spin_unlock(&entity->lock);
>>
>> 		drm_sched_wakeup(sched);
>>
>> Ie. we know entity->rq and rq->sched are guaranteed to be stable and
>> present at this point because job is already in the queue and
>> drm_sched_entity_select_rq() guarantees that.
>>
>> In this patch I moved all this block into drm_sched_rq_add_entity() but
>> I wanted to leave drm_sched_wakeup() outside. Because I thought it is
>> not the job of the run queue handling, and semantically the logic was
>> "only once added to the entity we know the rq and scheduler for
>> certain". That would open the door for future improvements and late
>> rq/scheduler selection.
>>
>> But now I think it is premature and it would be better I simply move the
>> wakekup inside drm_sched_rq_add_entity() together with all the rest.
>>
>> Does that sound like a plan for now?
> 
> Hmmm. What I'm wondering most about if it really is a good idea to have
> drm_sched_wakeup() in rq_add_entity().
> 
> Do you think that makes semantically more sense than just reading:
> 
> drm_sched_entity_push_job()
> {
>     foo
>     bar
>     more_foo
> 
>     /* New job was added. Right time to wake up scheduler. */
>     drm_sched_wakeup();

Problem here always is you need a sched pointer so question is simply 
how and where to get it.

> I think both can make sense, but the above / current version seems to
> make more sense to me.

Current as in this patch or current as in the upstream codebase?

In all cases the knowledge it is safe to use sched after unlocking is 
implicit.

I see only two options:

current)

drm_sched_entity_push_job()
{
...
	spin_unlock(&rq->lock);
	spin_unlock(&entity->lock);

	drm_sched_wakeup(sched);

a)

drm_sched_entity_push_job()
{
...
	sched = drm_sched_rq_add_entity(entity, submit_ts);
	if (sched)
		drm_sched_wakeup(sched);

b)

drm_sched_rq_add_entity()
{
...
	spin_unlock(&rq->lock);
	spin_unlock(&entity->lock);

	drm_sched_wakeup(sched);


drm_sched_entity_push_job()
{
...
	drm_sched_rq_add_entity(entity, submit_ts);


b) is the same as today, a) perhaps a bit premature. Which do you prefer?

Regards,

Tvrtko

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
>>>
>>> I mentioned that pattern in a previous patch. "get_rr_ts" doesn't
>>> appear like an obvious name since you're actually setting data here.
>>>
>>> P.
>>>
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

