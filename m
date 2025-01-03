Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5087FA00961
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 13:40:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6B610E437;
	Fri,  3 Jan 2025 12:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gbHsexHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75C010E437
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JXp+SaeZjzxp3w3hsBjgz5cwRWRUdq4BCKQdjV+TDD8=; b=gbHsexHNs2gSkgy5phxqTWcETU
 ffDinYg/gVb9sZbf/8OPTh/Cdr1r3uWny3N9+deLLiZeusiHhsycnATXJwZQ3IEPBHSqxpEHo2q8I
 nwGZE26RpxGOlaFJWZ0O7rIawD0stdHmPdjjekMQfboplzSOcrB3GhUmZZeqI5myNLN9yMLpVW4Xy
 RyvXgiyZ6zS1nXzvD8UkbxMhfYfSAdiPoIDHstJGWgEJbzXsu9+PxnOxKfyIskb6t5uu5Cl+wotGE
 x5L5q+WFZpXVykOnbIIXqTfvxVXIYcpUI3/adjatwNjOVwE5AyMNpYwnOjqJwr8tFMcwAxRM0E0PV
 PCab2dAQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tTgyf-00BDny-Um; Fri, 03 Jan 2025 13:40:34 +0100
Message-ID: <64efd5c0-a10d-4aa5-bb0c-c06677375bfa@igalia.com>
Date: Fri, 3 Jan 2025 12:40:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 08/14] drm/sched: Add deadline policy
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-9-tursulin@igalia.com>
 <2bab43a317a2049fc81993f694de9c0b8fae9700.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <2bab43a317a2049fc81993f694de9c0b8fae9700.camel@redhat.com>
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


On 02/01/2025 13:11, Philipp Stanner wrote:
> On Mon, 2024-12-30 at 16:52 +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Deadline scheduling policy should be a fairer flavour of FIFO with
>> two
>> main advantages being that it can naturally connect with the dma-
>> fence
>> deadlines, and secondly that it can get away with multiple run queues
>> per
>> scheduler.
>>
>>  From the latter comes the fairness advantage. Where the current FIFO
>> policy will always starve low priority entities by normal, and normal
>> by high etc, deadline tracks all runnable entities in a single run
>> queue
>> and assigns them deadlines based on priority. Instead of being
>> ordered
>> strictly by priority, jobs and entities become ordered by deadlines.
>>
>> This means that a later higher priority submission can still overtake
>> an
>> earlier lower priority one, but eventually the lower priority will
>> get its
>> turn even if high priority is constantly feeding new work.
> 
> So, as you're aware of, this is a major change in behavior. FIFO's
> purpose actually is to be unfair, and my understanding has always been
> that it is on purpose that the higher priority will with absolute
> certainty take precedence.
> 
> Reason being that on the high priority things like configuring memory /
> mappings are done, which you want to be prioritized.

Right. For the kernel priority for instance I could make them get a very 
early deadline ensuring they still run first.

> IOW in which scenario would you want the low priorities to be able to
> overtake the higher ones?

I would say always. I don't see it as overtaking but avoiding complete 
starvation. In the CPU world if you run:

$ game & nice computation

You don't expect the computation to get zero CPU time while the game is 
running.

Although I am not saying with the current DRM scheduler it is guaranteed 
to get zero GPU time. It will still get scheduled in cases when the 
priority run queues happen to be temporarily empty. But if someone would 
be submitting work very efficiently low priority would never run.

Deadline in its current form is not perfect or immune to all submission 
patterns either, which is why this is RFC.

> @Danilo, @Christian?
> 
> 
>>
>> Current mapping of priority to deadlines is somewhat arbitrary and
>> looks
>> like this (submit timestamp plus constant offset in micro-seconds):
>>
>> 	static const unsigned int d_us[] = {
>> 		[DRM_SCHED_PRIORITY_KERNEL] =    100,
>> 		[DRM_SCHED_PRIORITY_HIGH]   =   1000,
>> 		[DRM_SCHED_PRIORITY_NORMAL] =   5000,
>> 		[DRM_SCHED_PRIORITY_LOW]    = 100000,
>> 	};
>>
>> Assuming simultaneous submission of one normal and one low prioriy
>> job at
>> a time of "t", they will get respective deadlines of t+5ms and
>> t+100ms.
>> Hence normal will run first and low will run after it, or at the
>> latest
>> 100ms after it was submitted in case other higher priority
>> submissions
>> overtake it in the meantime.
>>
>> Because deadline policy does not need run queues, if the FIFO and RR
>> polices are later removed, that would allow for a significant
>> simplification of the code base by reducing the 1:N to 1:1 scheduler
>> to run queue relationship.
> 
> So the proposed upsides for the rework are that a) code can arguably be
> simplified and that b) deadline is fairer than FIFO.
> 
> Focusing on b) right now: Have you seen it in the wild that high
> priorities starve lower ones? Is that a problem already?
> 
> I assume you have been working on that for a reason – do you have a
> usecase in amdgpu or similar where the deadline policy improves things
> in a way?

I don't have any observed use cases as of right now. It is an experiment 
to see if we can make the code simpler without adding regressions and 
improvements would be a bonus.

Hence the RFC and even RFT on top because I am looking for a) some ideas 
on what and how to test, b) because different drivers use the scheduler 
differently and I cannot try them all, seeing if there is interest from 
people to try it out and provide feedback.

(I had a more drastic version where deadlines were based on runnable 
status (after dependencies were resolved). That version showed 
significantly lower scheduling jitter but was unstable becuase I took 
too many shortcuts to sketch it out. I don't think it is feasible 
without a much larger rewrite.)

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 53 +++++++++++++++++++---
>> --
>>   drivers/gpu/drm/scheduler/sched_main.c   | 14 ++++---
>>   drivers/gpu/drm/scheduler/sched_rq.c     |  5 ++-
>>   include/drm/gpu_scheduler.h              | 10 ++++-
>>   4 files changed, 64 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 608bc43ff256..6928ec19ec23 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -71,6 +71,8 @@ int drm_sched_entity_init(struct drm_sched_entity
>> *entity,
>>   	entity->guilty = guilty;
>>   	entity->num_sched_list = num_sched_list;
>>   	entity->priority = priority;
>> +	entity->rq_priority = drm_sched_policy ==
>> DRM_SCHED_POLICY_DEADLINE ?
>> +			      DRM_SCHED_PRIORITY_KERNEL : priority;
>>   	/*
>>   	 * It's perfectly valid to initialize an entity without
>> having a valid
>>   	 * scheduler attached. It's just not valid to use the
>> scheduler before it
>> @@ -87,17 +89,23 @@ int drm_sched_entity_init(struct drm_sched_entity
>> *entity,
>>   		 */
>>   		pr_warn("%s: called with uninitialized scheduler\n",
>> __func__);
>>   	} else if (num_sched_list) {
>> -		/* The "priority" of an entity cannot exceed the
>> number of run-queues of a
>> -		 * scheduler. Protect against num_rqs being 0, by
>> converting to signed. Choose
>> -		 * the lowest priority available.
>> +		enum drm_sched_priority p = entity->priority;
>> +
>> +		/*
>> +		 * The "priority" of an entity cannot exceed the
>> number of
>> +		 * run-queues of a scheduler. Protect against
>> num_rqs being 0,
>> +		 * by converting to signed. Choose the lowest
>> priority
>> +		 * available.
>>   		 */
>> -		if (entity->priority >= sched_list[0]->num_rqs) {
>> -			drm_err(sched_list[0], "entity with out-of-
>> bounds priority:%u num_rqs:%u\n",
>> -				entity->priority, sched_list[0]-
>>> num_rqs);
>> -			entity->priority = max_t(s32, (s32)
>> sched_list[0]->num_rqs - 1,
>> -						 (s32)
>> DRM_SCHED_PRIORITY_KERNEL);
>> +		if (p >= sched_list[0]->num_user_rqs) {
>> +			drm_err(sched_list[0], "entity with out-of-
>> bounds priority:%u num_user_rqs:%u\n",
>> +				p, sched_list[0]->num_user_rqs);
>> +			p = max_t(s32,
>> +				 (s32)sched_list[0]->num_user_rqs -
>> 1,
>> +				 (s32)DRM_SCHED_PRIORITY_KERNEL);
>> +			entity->priority = p;
>>   		}
>> -		entity->rq = sched_list[0]->sched_rq[entity-
>>> priority];
>> +		entity->rq = sched_list[0]->sched_rq[entity-
>>> rq_priority];
>>   	}
>>   
>>   	init_completion(&entity->entity_idle);
>> @@ -377,6 +385,27 @@ void drm_sched_entity_set_priority(struct
>> drm_sched_entity *entity,
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_set_priority);
>>   
>> +static ktime_t
>> +__drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
>> +				    ktime_t submit_ts)
>> +{
>> +	static const unsigned int d_us[] = {
>> +		[DRM_SCHED_PRIORITY_KERNEL] =    100,
>> +		[DRM_SCHED_PRIORITY_HIGH]   =   1000,
>> +		[DRM_SCHED_PRIORITY_NORMAL] =   5000,
>> +		[DRM_SCHED_PRIORITY_LOW]    = 100000,
>> +	};
>> +
>> +	return ktime_add_us(submit_ts, d_us[entity->priority]);
>> +}
>> +
>> +ktime_t
>> +drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
>> +				  struct drm_sched_job *job)
>> +{
>> +	return __drm_sched_entity_get_job_deadline(entity, job-
>>> submit_ts);
>> +}
>> +
>>   /*
>>    * drm_sched_entity_wakeup - callback to clear the entity's
>> dependency and
>>    * wake up the scheduler
>> @@ -503,7 +532,7 @@ void drm_sched_entity_select_rq(struct
>> drm_sched_entity *entity)
>>   
>>   	spin_lock(&entity->lock);
>>   	sched = drm_sched_pick_best(entity->sched_list, entity-
>>> num_sched_list);
>> -	rq = sched ? sched->sched_rq[entity->priority] : NULL;
>> +	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
>>   	if (rq != entity->rq) {
>>   		drm_sched_rq_remove_entity(entity->rq, entity);
>>   		entity->rq = rq;
>> @@ -547,6 +576,10 @@ void drm_sched_entity_push_job(struct
>> drm_sched_job *sched_job)
>>   	if (first) {
>>   		struct drm_gpu_scheduler *sched;
>>   
>> +		if (drm_sched_policy == DRM_SCHED_POLICY_DEADLINE)
>> +			submit_ts =
>> __drm_sched_entity_get_job_deadline(entity,
>> +								
>> 	submit_ts);
>> +
>>   		sched = drm_sched_rq_add_entity(entity->rq, entity,
>> submit_ts);
>>   		if (sched)
>>   			drm_sched_wakeup(sched);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index ba9b0274b185..433bef85eeaf 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -87,13 +87,13 @@ static struct lockdep_map drm_sched_lockdep_map =
>> {
>>   };
>>   #endif
>>   
>> -int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>> +int drm_sched_policy = DRM_SCHED_POLICY_DEADLINE;
>>   
>>   /**
>>    * DOC: sched_policy (int)
>>    * Used to override default entities scheduling policy in a run
>> queue.
>>    */
>> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for
>> entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round
>> Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for
>> entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round
>> Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, "
>> __stringify(DRM_SCHED_POLICY_DEADLINE) " = Virtual deadline
>> (default).");
>>   module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>   
>>   static u32 drm_sched_available_credits(struct drm_gpu_scheduler
>> *sched)
>> @@ -1109,11 +1109,15 @@ int drm_sched_init(struct drm_gpu_scheduler
>> *sched,
>>   		sched->own_submit_wq = true;
>>   	}
>>   
>> -	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched-
>>> sched_rq),
>> +	sched->num_user_rqs = num_rqs;
>> +	sched->num_rqs = drm_sched_policy !=
>> DRM_SCHED_POLICY_DEADLINE ?
>> +			 num_rqs : 1;
>> +	sched->sched_rq = kmalloc_array(sched->num_rqs,
>> +					sizeof(*sched->sched_rq),
>>   					GFP_KERNEL | __GFP_ZERO);
>>   	if (!sched->sched_rq)
>>   		goto Out_check_own;
>> -	sched->num_rqs = num_rqs;
>> +
>>   	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
>> {
>>   		sched->sched_rq[i] = kzalloc(sizeof(*sched-
>>> sched_rq[i]), GFP_KERNEL);
>>   		if (!sched->sched_rq[i])
>> @@ -1227,7 +1231,7 @@ void drm_sched_increase_karma(struct
>> drm_sched_job *bad)
>>   	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
>>   		atomic_inc(&bad->karma);
>>   
>> -		for (i = DRM_SCHED_PRIORITY_HIGH; i < sched-
>>> num_rqs; i++) {
>> +		for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched-
>>> num_rqs; i++) {
>>   			struct drm_sched_rq *rq = sched-
>>> sched_rq[i];
>>   
>>   			spin_lock(&rq->lock);
>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c
>> b/drivers/gpu/drm/scheduler/sched_rq.c
>> index 5b31e5434d12..a6bb21250350 100644
>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>> @@ -152,7 +152,10 @@ void drm_sched_rq_pop_entity(struct drm_sched_rq
>> *rq,
>>   	if (next_job) {
>>   		ktime_t ts;
>>   
>> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +		if (drm_sched_policy == DRM_SCHED_POLICY_DEADLINE)
>> +			ts =
>> drm_sched_entity_get_job_deadline(entity,
>> +							
>> next_job);
>> +		else if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>   			ts = next_job->submit_ts;
>>   		else
>>   			ts = drm_sched_rq_get_rr_deadline(rq);
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index 6fee85e45d45..7532071fbea8 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -74,8 +74,9 @@ enum drm_sched_priority {
>>   /* Used to choose between FIFO and RR job-scheduling */
>>   extern int drm_sched_policy;
>>   
>> -#define DRM_SCHED_POLICY_RR    0
>> -#define DRM_SCHED_POLICY_FIFO  1
>> +#define DRM_SCHED_POLICY_RR	  0
>> +#define DRM_SCHED_POLICY_FIFO	  1
>> +#define DRM_SCHED_POLICY_DEADLINE 2
>>   
>>   /**
>>    * struct drm_sched_entity - A wrapper around a job queue (typically
>> @@ -153,6 +154,8 @@ struct drm_sched_entity {
>>   	 */
>>   	struct spsc_queue		job_queue;
>>   
>> +	enum drm_sched_priority         rq_priority;
>> +
>>   	/**
>>   	 * @fence_seq:
>>   	 *
>> @@ -522,6 +525,7 @@ struct drm_gpu_scheduler {
>>   	long				timeout;
>>   	const char			*name;
>>   	u32                             num_rqs;
>> +	u32                             num_user_rqs;
>>   	struct drm_sched_rq             **sched_rq;
>>   	wait_queue_head_t		job_scheduled;
>>   	atomic64_t			job_id_count;
>> @@ -623,6 +627,8 @@ void drm_sched_entity_set_priority(struct
>> drm_sched_entity *entity,
>>   				   enum drm_sched_priority
>> priority);
>>   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>   int drm_sched_entity_error(struct drm_sched_entity *entity);
>> +ktime_t drm_sched_entity_get_job_deadline(struct drm_sched_entity
>> *entity,
>> +					  struct drm_sched_job
>> *job);
>>   
>>   struct drm_sched_fence *drm_sched_fence_alloc(
>>   	struct drm_sched_entity *s_entity, void *owner);
> 
