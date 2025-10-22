Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A1BFC45F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B53C10E79B;
	Wed, 22 Oct 2025 13:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eef235oj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C57D10E798;
 Wed, 22 Oct 2025 13:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fHpPXbm2lmn8oHu6PxyBJPvxpmTlSadQs6/TNTjJ0FM=; b=eef235ojUUMi+w2JaJ4w3+atc1
 19eRix370kC6gm2Yil8oCpKXoUiq4TcA5udQeh0bCrC2SDY/cBQGNeUK1iYRQUapaQV66NGLjxkQO
 fAh0VraU4SA5LrkiSA4WFnLBewWVAtUgRAYp79C6qUqarHmeYa7CG4FP5LPtfiMaIBzr4YK6BSE87
 ED1CRZ63yrOUQxkU5TXD5vFwzgTVOeSbdAtvWnHEYOdmG9KiybKam4gULIGnXaZFxFmSFpnwvhIJE
 CyE2+NMqzOzfyylMcxG1Qc/kTwqlcDcKMdNjxTWKDFYTB/udQ02QV2OMn1kQsEXgBl/TNGPFDm3Cg
 v6J+XMAg==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vBZEI-00D6Yf-A7; Wed, 22 Oct 2025 15:50:18 +0200
Message-ID: <c62693d0-f172-4b4f-b25c-6caef575bc2d@igalia.com>
Date: Wed, 22 Oct 2025 14:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/27] drm/sched: Add fair scheduling policy
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20251017133644.44747-1-tvrtko.ursulin@igalia.com>
 <20251017133644.44747-10-tvrtko.ursulin@igalia.com>
 <2f1eb1943d4d6a7185391e6d35e9c5d9818649da.camel@mailbox.org>
 <a6a6e8da-e1ae-44c4-a34f-c684a441ffca@igalia.com>
 <df3fa9d1893c3bd2a2b6de73613b26a3b8ed3d55.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <df3fa9d1893c3bd2a2b6de73613b26a3b8ed3d55.camel@mailbox.org>
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


On 22/10/2025 07:56, Philipp Stanner wrote:
> On Mon, 2025-10-20 at 15:39 +0100, Tvrtko Ursulin wrote:
>>
>> On 20/10/2025 14:57, Philipp Stanner wrote:
>>> On Fri, 2025-10-17 at 14:36 +0100, Tvrtko Ursulin wrote:
>>>> The FAIR scheduling policy is built upon the same concepts as the well
>>>> known CFS CPU scheduler - entity run queue is sorted by the virtual GPU
>>>> time consumed by entities in a way that the entity with least vruntime
>>>> runs first.
>>>>
>>>> It is able to avoid total priority starvation, which is one of the
>>>> problems with FIFO, and it also does not need for per priority run queues.
>>>> As it scales the actual GPU runtime by an exponential factor as the
>>>> priority decreases, the virtual runtime for low priority entities grows
>>>> faster than for normal priority, pushing them further down the runqueue
>>>> order for the same real GPU time spent.
>>>>
>>>> Apart from this fundamental fairness, fair policy is especially strong in
>>>> oversubscription workloads where it is able to give more GPU time to short
>>>> and bursty workloads when they are running in parallel with GPU heavy
>>>> clients submitting deep job queues.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_entity.c   |  28 ++--
>>>>    drivers/gpu/drm/scheduler/sched_internal.h |   5 +
>>>>    drivers/gpu/drm/scheduler/sched_main.c     |  11 +-
>>>>    drivers/gpu/drm/scheduler/sched_rq.c       | 166 ++++++++++++++++++++-
>>>>    include/drm/gpu_scheduler.h                |  16 +-
>>>>    5 files changed, 207 insertions(+), 19 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 565eddebb667..4144a97702a5 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -107,6 +107,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>    	entity->guilty = guilty;
>>>>    	entity->num_sched_list = num_sched_list;
>>>>    	entity->priority = priority;
>>>> +	entity->rq_priority = drm_sched_policy == DRM_SCHED_POLICY_FAIR ?
>>>> +			      DRM_SCHED_PRIORITY_KERNEL : priority;
>>>>    	/*
>>>>    	 * It's perfectly valid to initialize an entity without having a valid
>>>>    	 * scheduler attached. It's just not valid to use the scheduler before it
>>>> @@ -123,17 +125,23 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>    		 */
>>>>    		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>>>>    	} else if (num_sched_list) {
>>>> -		/* The "priority" of an entity cannot exceed the number of run-queues of a
>>>> -		 * scheduler. Protect against num_rqs being 0, by converting to signed. Choose
>>>> -		 * the lowest priority available.
>>>> +		enum drm_sched_priority p = entity->priority;
>>>> +
>>>> +		/*
>>>> +		 * The "priority" of an entity cannot exceed the number of
>>>> +		 * run-queues of a scheduler. Protect against num_rqs being 0,
>>>> +		 * by converting to signed. Choose the lowest priority
>>>> +		 * available.
>>>>    		 */
>>>> -		if (entity->priority >= sched_list[0]->num_rqs) {
>>>> -			dev_err(sched_list[0]->dev, "entity has out-of-bounds priority: %u. num_rqs: %u\n",
>>>> -				entity->priority, sched_list[0]->num_rqs);
>>>> -			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
>>>> -						 (s32) DRM_SCHED_PRIORITY_KERNEL);
>>>> +		if (p >= sched_list[0]->num_user_rqs) {
>>>> +			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_user_rqs:%u\n",
>>>> +				p, sched_list[0]->num_user_rqs);
>>>> +			p = max_t(s32,
>>>> +				 (s32)sched_list[0]->num_user_rqs - 1,
>>>> +				 (s32)DRM_SCHED_PRIORITY_KERNEL);
>>>> +			entity->priority = p;
>>>>    		}
>>>> -		entity->rq = sched_list[0]->sched_rq[entity->priority];
>>>> +		entity->rq = sched_list[0]->sched_rq[entity->rq_priority];
>>>>    	}
>>>>    
>>>>    	init_completion(&entity->entity_idle);
>>>> @@ -566,7 +574,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>    
>>>>    	spin_lock(&entity->lock);
>>>>    	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>>>> -	rq = sched ? sched->sched_rq[entity->priority] : NULL;
>>>> +	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
>>>>    	if (rq != entity->rq) {
>>>>    		drm_sched_rq_remove_entity(entity->rq, entity);
>>>>    		entity->rq = rq;
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
>>>> index 9adad48ec084..593e380a2d59 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_internal.h
>>>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>>>> @@ -12,6 +12,8 @@
>>>>     * @kref: reference count for the object.
>>>>     * @lock: lock guarding the @runtime updates.
>>>>     * @runtime: time entity spent on the GPU.
>>>> + * @prev_runtime: previous @runtime used to get the runtime delta.
>>>> + * @vruntime: virtual runtime as accumulated by the fair algorithm.
>>>>     *
>>>>     * Because jobs and entities have decoupled lifetimes, ie. we cannot access the
>>>>     * entity once the job is completed and we know how much time it took on the
>>>> @@ -22,6 +24,8 @@ struct drm_sched_entity_stats {
>>>>    	struct kref	kref;
>>>>    	spinlock_t	lock;
>>>>    	ktime_t		runtime;
>>>> +	ktime_t		prev_runtime;
>>>> +	ktime_t		vruntime;
>>>>    };
>>>>    
>>>>    /* Used to choose between FIFO and RR job-scheduling */
>>>> @@ -29,6 +33,7 @@ extern int drm_sched_policy;
>>>>    
>>>>    #define DRM_SCHED_POLICY_RR    0
>>>>    #define DRM_SCHED_POLICY_FIFO  1
>>>> +#define DRM_SCHED_POLICY_FAIR  2
>>>>    
>>>>    bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>>>>    			 struct drm_sched_entity *entity);
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 0c5f7a0594bf..74a155377561 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -90,7 +90,7 @@ int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>>>     * DOC: sched_policy (int)
>>>>     * Used to override default entities scheduling policy in a run queue.
>>>>     */
>>>> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>>>> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair (default).");
>>>>    module_param_named(sched_policy, drm_sched_policy, int, 0444);
>>>
>>> Wrong. This patch does not make Fair the default scheduling policy.
>>
>> Right, forgot about this when splitting out the "set fair as default"
>> patch. Fixed locally.
>>
>>>>    
>>>>    static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
>>>> @@ -1133,11 +1133,14 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
>>>>    		sched->own_submit_wq = true;
>>>>    	}
>>>>    
>>>> -	sched->sched_rq = kmalloc_array(args->num_rqs, sizeof(*sched->sched_rq),
>>>> +	sched->num_user_rqs = args->num_rqs;
>>>> +	sched->num_rqs = drm_sched_policy != DRM_SCHED_POLICY_FAIR ?
>>>> +			 args->num_rqs : 1;
>>>> +	sched->sched_rq = kmalloc_array(sched->num_rqs, sizeof(*sched->sched_rq),
>>>>    					GFP_KERNEL | __GFP_ZERO);
>>>>    	if (!sched->sched_rq)
>>>>    		goto Out_check_own;
>>>> -	sched->num_rqs = args->num_rqs;
>>>> +
>>>>    	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>>>>    		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
>>>>    		if (!sched->sched_rq[i])
>>>> @@ -1279,7 +1282,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>>>>    	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
>>>>    		atomic_inc(&bad->karma);
>>>>    
>>>> -		for (i = DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
>>>> +		for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>>>>    			struct drm_sched_rq *rq = sched->sched_rq[i];
>>>>    
>>>>    			spin_lock(&rq->lock);
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
>>>> index 2d1f579d8352..b12d0f1859f0 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_rq.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>>>> @@ -5,6 +5,8 @@
>>>>    
>>>>    #include "sched_internal.h"
>>>>    
>>>> +#define DRM_SCHED_PRIORITY_INVALID (-1) /* Do not want the enum visible outside. */
>>>
>>> Well nope, that's not what I had in mind at all – there's no harm at
>>> all by defining that in the real enum. Users know that "Invalid" is not
>>> supposed to be used.
>>>
>>> Setting it as the starter with -1 in the enum will guarantee
>>> correctness since the subsequent members will be numbered
>>> incrementingly.
>>
>> It is correct to say drivers should not use it. Therefore we have two
>> options.
>>
>> Option 1 - don't even show it to drivers which I chose for simplicity.
>>
>> Option 2 - add it to gpu_scheduler.h. Drivers can now use it so we'd
>> have to add error checking to drm_sched_entity_init and
>> drm_sched_entity_set_priority.
> 
> I just think that's more consistent. Sure, they could use it, but the
> name and a little docstring "Internal initializer. Do not use." should
> lift responsibility from our shoulders.

Okay, I can do that. And I understand you are saying comment is enough 
for you, no error checking required to set priority etc.
>> Which is a bit is annoying since drm_sched_entity_set_priority has no
>> error checking. We can add a warn on.
>>
>> Although I believe I did add error checking to it when I was proposing
>> to fix the drm_sched_entity_init() sched_list container
>> ownership/lifetime issue some time ago.
> 
> Is that patch still around?

I've sent you a link in another thread already. For reference it is:

https://lore.kernel.org/dri-devel/20240719094730.55301-1-tursulin@igalia.com/

There I needed to add error checking to drm_sched_entity_modify_sched() 
but as amdgpu is the only caller to drm_sched_entity_set_priority() as 
well, it would be trivial to add error checking to it as well.

Anyway, the larger story from the linked patch was whether to go with 
scheduler copying the list of schedulers, or fixing up all drivers so 
they stop passing the stack backed list. Christian preferred the latter 
which is why that patch stalled. I never got round fixing up the 
drivers. I think it looked like a lot of work. I'll see if I can revisit it.

>>>> +
>>>>    static __always_inline bool
>>>>    drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
>>>>    {
>>>> @@ -16,6 +18,32 @@ drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
>>>>    	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
>>>>    }
>>>>    
>>>> +static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
>>>> +{
>>>> +	enum drm_sched_priority prio = DRM_SCHED_PRIORITY_INVALID;
>>>> +	struct rb_node *rb;
>>>> +
>>>> +	lockdep_assert_held(&rq->lock);
>>>> +
>>>> +	rb = rb_first_cached(&rq->rb_tree_root);
>>>> +	if (rb) {
>>>> +		struct drm_sched_entity *entity =
>>>> +			rb_entry(rb, typeof(*entity), rb_tree_node);
> 
> I know declaring variables just for local scope can be desirable, but
> this function is very small and defining 'entity' at the function's top
> would you to eliminate the line break.

I prefer to limit the scope but if you insist I can change it.
>>>> +
>>>> +		/*
>>>> +		 * Unlocked read is fine to avoid the rq vs entity lock
>>>> +		 * inversion. If the priority had just changed it is no big
>>>> +		 * deal for our algorithm, but just a transient reachable only
>>>> +		 * by drivers with userspace dynamic priority changes API. Equal
>>>> +		 * in effect to the priority change becoming visible a few
>>>> +		 * instructions later.
>>>> +		 */
>>>> +		prio = READ_ONCE(entity->priority);
>>>
>>> OK, so here's the good news:
>>>
>>> I just looked it through and once the _whole series_ is applied this
>>> actually is not an unlocked read anymore.
>>>
>>> Once the series is applied, the only callers of this function here are
>>> drm_sched_rq_remove_tree_locked() and
>>> drm_sched_rq_update_tree_locked(), both of which grab the entity lock.
>>>
>>>
>>> So what we could do is suffer the READ_ONCE for a few patches and then
>>> remove it again once the other code paths running into here are
>>> removed. And probably add the entity lockdep guard, too.
>>>
>>> Unless I'm mistaken?
>>
>> Yes a little bit. You overlooked that in some cases the it is a
>> different entity, which the comment alludes to when talks about priority
>> inversion. I will make the comment clearer.
> 
> Ah right. I got pulled in by my own optimism here.
> 
> Still – can you please explain to me where / why that leads to lock
> inversion with the rq lock?
> 
> What I'm seeing so far is that drm_sched_rq_update_prio() +
> spin_lock(entity->lock) could deadlock because it could try to lock the
> same entity that its caller has already locked. Correct?

Yes, for the case when entity joins the run-queue it can be the same 
entity which is now the head of the queue, or it can be a different one. 
Depends on the insertion position.

But for the case where entity is leaving the run queue it is always a 
different entity and therefore a lock inversion. We have essentially this:

lock entity
lock rq
remove entity from the rq
rq->prio = rq->head_entity->prio // different entity, unlocked read
unlock rq
unlock entity

And unlocked read is fine because entity cannot leave the rq with 
rq->lock held.

>>> Best to detail that in the commit message, as always.
>>>
>>>
>>>> +	}
>>>> +
>>>> +	rq->head_prio = prio;
>>>> +}
>>>> +
>>>>    static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>>>>    					    struct drm_sched_rq *rq)
>>>>    {
>>>> @@ -25,6 +53,7 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
>>>>    	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>>>    		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>>>>    		RB_CLEAR_NODE(&entity->rb_tree_node);
>>>> +		drm_sched_rq_update_prio(rq);
>>>>    	}
>>>>    }
>>>>    
>>>> @@ -46,6 +75,7 @@ static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>>>>    
>>>>    	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>>>    		      drm_sched_entity_compare_before);
>>>> +	drm_sched_rq_update_prio(rq);
>>>>    }
>>>>    
>>>>    /**
>>>> @@ -62,6 +92,123 @@ void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>>>    	INIT_LIST_HEAD(&rq->entities);
>>>>    	rq->rb_tree_root = RB_ROOT_CACHED;
>>>>    	rq->sched = sched;
>>>> +	rq->head_prio = DRM_SCHED_PRIORITY_INVALID;
>>>> +}
>>>> +
>>>> +static ktime_t
>>>> +drm_sched_rq_get_min_vruntime(struct drm_sched_rq *rq)
>>>> +{
>>>> +	ktime_t vruntime = 0;
>>>> +	struct rb_node *rb;
>>>> +
>>>> +	lockdep_assert_held(&rq->lock);
>>>> +
>>>> +	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
>>>> +		struct drm_sched_entity *entity =
>>>> +			rb_entry(rb, typeof(*entity), rb_tree_node);
>>>> +		struct drm_sched_entity_stats *stats = entity->stats;
>>>> +
>>>> +		/*
>>>> +		 * We only need the spin lock here on platforms where access to
>>>> +		 * 64-bit ktime_t can tear but for simplicity we take it un-
>>>> +		 * conditionally.
>>>> +		 */
>>>> +		spin_lock(&stats->lock);
>>>> +		vruntime = stats->vruntime;
>>>> +		spin_unlock(&stats->lock);
>>>> +	}
>>>> +
>>>> +	return vruntime;
>>>> +}
>>>> +
>>>> +static void
>>>> +drm_sched_entity_save_vruntime(struct drm_sched_entity *entity,
>>>> +			       ktime_t min_vruntime)
>>>> +{
>>>> +	struct drm_sched_entity_stats *stats = entity->stats;
>>>> +	ktime_t vruntime;
>>>> +
>>>> +	spin_lock(&stats->lock);
>>>> +	vruntime = stats->vruntime;
>>>> +	if (min_vruntime && vruntime > min_vruntime)
>>>> +		vruntime = ktime_sub(vruntime, min_vruntime);
>>>> +	else
>>>> +		vruntime = 0;
>>>> +	stats->vruntime = vruntime;
>>>> +	spin_unlock(&stats->lock);
>>>> +}
>>>> +
>>>> +static ktime_t
>>>> +drm_sched_entity_restore_vruntime(struct drm_sched_entity *entity,
>>>> +				  ktime_t min_vruntime,
>>>> +				  enum drm_sched_priority rq_prio)
>>>> +{
>>>> +	struct drm_sched_entity_stats *stats = entity->stats;
>>>> +	enum drm_sched_priority prio = entity->priority;
>>>> +	ktime_t vruntime;
>>>> +
>>>> +	BUILD_BUG_ON(DRM_SCHED_PRIORITY_NORMAL < DRM_SCHED_PRIORITY_HIGH);
>>>
>>> Why's that a build bug. Who is to set / change those values?
>>
>> It is a build bug because few lines below depend on the current reverse
>> order.
>>
>> As to who can change it- who knows. Better be safe than sorry.
> 
> Maybe I'm blind, but DRM_SCHED_PRIORITY_* are enumerators statically
> defined in gpu_scheduler.h, aren't they? How can NORMAL ever be smaller
> than HIGH?

Enums were reversed once already so could be reversed again. In fact, if 
we look at the justification from:

commit 38f922a563aac3148ac73e73689805917f034cb5
Author: Luben Tuikov <ltuikov89@gmail.com>
Date:   Wed Nov 22 22:08:48 2023 -0500

     drm/sched: Reverse run-queue priority enumeration

Maybe by the end of this series I should look into flipping them back 
into the logical order. Because the rq array is gone so the argument 
from that commit does not hold. But what if someone is doing a numerical 
comparison somewhere or assuming the reverse order. Who knows, it will 
be hard to find in all drivers.

Hence the BUILD_BUG_ON to at least make it clear this code here depends 
on the current order.
>> Alternative is to add a helper such as drm_sched_priority_is_lower(p1,
>> p2) if you prefer that. I don't mind either way.
>>>> +
>>>> +	spin_lock(&stats->lock);
>>>> +	vruntime = stats->vruntime;
>>>> +
>>>> +	/*
>>>> +	 * Special handling for entities which were picked from the top of the
>>>> +	 * queue and are now re-joining the top with another one already there.
>>>> +	 */
>>>> +	if (!vruntime && min_vruntime) {
>>>> +		if (prio > rq_prio) {
>>>> +			/*
>>>> +			 * Lower priority should not overtake higher when re-
>>>> +			 * joining at the top of the queue.
>>>> +			 */
>>>> +			vruntime = us_to_ktime(prio - rq_prio);
>>>> +		} else if (prio < rq_prio) {
>>>> +			/*
>>>> +			 * Higher priority can go first.
>>>> +			 */
>>>> +			vruntime = -us_to_ktime(rq_prio - prio);
>>>> +		}
>>>> +	}
>>>> +
>>>> +	/*
>>>> +	 * Restore saved relative position in the queue.
>>>> +	 */
>>>> +	vruntime = ktime_add(min_vruntime, vruntime);
>>>> +
>>>> +	stats->vruntime = vruntime;
>>>> +	spin_unlock(&stats->lock);
>>>> +
>>>> +	return vruntime;
>>>> +}
>>>> +
>>>> +static ktime_t drm_sched_entity_update_vruntime(struct drm_sched_entity *entity)
>>>> +{
>>>> +	static const unsigned int shift[] = {
>>>> +		[DRM_SCHED_PRIORITY_KERNEL] = 1,
>>>> +		[DRM_SCHED_PRIORITY_HIGH]   = 2,
>>>> +		[DRM_SCHED_PRIORITY_NORMAL] = 4,
>>>> +		[DRM_SCHED_PRIORITY_LOW]    = 7,
>>>> +	};
>>>
>>> Still no comments about these numbers origin?
>>
>> You asked, I answered, you said nothing, I respun with the feedback I
>> received. I can add some text no problem.
> 
> That'd be great. Something small is perfectly sufficient

Ok.

Regards,

Tvrtko

> 
>>>> +	struct drm_sched_entity_stats *stats = entity->stats;
>>>> +	ktime_t runtime, prev;
>>>> +
>>>> +	spin_lock(&stats->lock);
>>>> +	prev = stats->prev_runtime;
>>>> +	runtime = stats->runtime;
>>>> +	stats->prev_runtime = runtime;
>>>> +	runtime = ktime_add_ns(stats->vruntime,
>>>> +			       ktime_to_ns(ktime_sub(runtime, prev)) <<
>>>> +			       shift[entity->priority]);
>>>> +	stats->vruntime = runtime;
>>>> +	spin_unlock(&stats->lock);
>>>> +
>>>> +	return runtime;
>>>> +}
>>>> +
>>>> +static ktime_t drm_sched_entity_get_job_ts(struct drm_sched_entity *entity)
>>>> +{
>>>> +	return drm_sched_entity_update_vruntime(entity);
>>>>    }
>>>>    
>>>>    /**
>>>> @@ -98,8 +245,14 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
>>>>    		list_add_tail(&entity->list, &rq->entities);
>>>>    	}
>>>>    
>>>> -	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
>>>> +	if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
>>>> +		ts = drm_sched_rq_get_min_vruntime(rq);
>>>> +		ts = drm_sched_entity_restore_vruntime(entity, ts,
>>>> +						       rq->head_prio);
>>>> +	} else if (drm_sched_policy == DRM_SCHED_POLICY_RR) {
>>>>    		ts = entity->rr_ts;
>>>> +	}
>>>> +
>>>>    	drm_sched_rq_update_fifo_locked(entity, rq, ts);
>>>>    
>>>>    	spin_unlock(&rq->lock);
>>>> @@ -171,7 +324,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>>>>    	if (next_job) {
>>>>    		ktime_t ts;
>>>>    
>>>> -		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR)
>>>> +			ts = drm_sched_entity_get_job_ts(entity);
>>>> +		else if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>
>>> FAIR is not even the dafault policy in this patch, so git diff could be
>>> made smaller by reversing order. Same applies a few lines above.
>>
>> You asked before and I said I prefer FAIR to be first in the if ladder.
> 
> Thinking about it, since you remove the other policies anyways we would
> then have a larger diff in a later patch..
> 
> So it's OK I think. Your choice.
> 
> Thx
> P.
> 
>>
>> If you insist I can change but TBH in the grand scheme of things it
>> feels like churn with not much benefit.
>>
>>> (more comments later this week, am a bit busy)
>>
>> No worries, reviews are appreciated!
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>    			ts = next_job->submit_ts;
>>>>    		else
>>>>    			ts = drm_sched_rq_next_rr_ts(rq, entity);
>>>> @@ -179,6 +334,13 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>>>>    		drm_sched_rq_update_fifo_locked(entity, rq, ts);
>>>>    	} else {
>>>>    		drm_sched_rq_remove_fifo_locked(entity, rq);
>>>> +
>>>> +		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
>>>> +			ktime_t min_vruntime;
>>>> +
>>>> +			min_vruntime = drm_sched_rq_get_min_vruntime(rq);
>>>> +			drm_sched_entity_save_vruntime(entity, min_vruntime);
>>>> +		}
>>>>    	}
>>>>    	spin_unlock(&rq->lock);
>>>>    	spin_unlock(&entity->lock);
>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>> index be382cacabb5..ff798ee9e3c2 100644
>>>> --- a/include/drm/gpu_scheduler.h
>>>> +++ b/include/drm/gpu_scheduler.h
>>>> @@ -150,6 +150,11 @@ struct drm_sched_entity {
>>>>    	 */
>>>>    	enum drm_sched_priority         priority;
>>>>    
>>>> +	/**
>>>> +	 * @rq_priority: Run-queue priority
>>>> +	 */
>>>> +	enum drm_sched_priority         rq_priority;
>>>> +
>>>>    	/**
>>>>    	 * @rr_ts:
>>>>    	 *
>>>> @@ -254,10 +259,11 @@ struct drm_sched_entity {
>>>>     * struct drm_sched_rq - queue of entities to be scheduled.
>>>>     *
>>>>     * @sched: the scheduler to which this rq belongs to.
>>>> - * @lock: protects @entities, @rb_tree_root and @rr_ts.
>>>> + * @lock: protects @entities, @rb_tree_root, @rr_ts and @head_prio.
>>>>     * @rr_ts: monotonically incrementing fake timestamp for RR mode.
>>>>     * @entities: list of the entities to be scheduled.
>>>>     * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
>>>> + * @head_prio: priority of the top tree element.
>>>>     *
>>>>     * Run queue is a set of entities scheduling command submissions for
>>>>     * one specific ring. It implements the scheduling policy that selects
>>>> @@ -271,6 +277,7 @@ struct drm_sched_rq {
>>>>    	ktime_t				rr_ts;
>>>>    	struct list_head		entities;
>>>>    	struct rb_root_cached		rb_tree_root;
>>>> +	enum drm_sched_priority		head_prio;
>>>>    };
>>>>    
>>>>    /**
>>>> @@ -563,8 +570,10 @@ struct drm_sched_backend_ops {
>>>>     * @credit_count: the current credit count of this scheduler
>>>>     * @timeout: the time after which a job is removed from the scheduler.
>>>>     * @name: name of the ring for which this scheduler is being used.
>>>> - * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
>>>> - *           as there's usually one run-queue per priority, but could be less.
>>>> + * @num_user_rqs: Number of run-queues. This is at most
>>>> + *                DRM_SCHED_PRIORITY_COUNT, as there's usually one run-queue per
>>>> + *                priority, but could be less.
>>>> + * @num_rqs: Equal to @num_user_rqs for FIFO and RR and 1 for the FAIR policy.
>>>>     * @sched_rq: An allocated array of run-queues of size @num_rqs;
>>>>     * @job_scheduled: once drm_sched_entity_flush() is called the scheduler
>>>>     *                 waits on this wait queue until all the scheduled jobs are
>>>> @@ -597,6 +606,7 @@ struct drm_gpu_scheduler {
>>>>    	long				timeout;
>>>>    	const char			*name;
>>>>    	u32                             num_rqs;
>>>> +	u32                             num_user_rqs;
>>>>    	struct drm_sched_rq             **sched_rq;
>>>>    	wait_queue_head_t		job_scheduled;
>>>>    	atomic64_t			job_id_count;
>>>
>>
>>
> 



