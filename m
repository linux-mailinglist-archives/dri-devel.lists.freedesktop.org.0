Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6445BA0778C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5505210EDD4;
	Thu,  9 Jan 2025 13:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pCHntxGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0984810EDD4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YRMb0aFnPfnuqUaYM7kFh4vG6HVSgnYsl/TuYbdKH48=; b=pCHntxGjHvCnAQNNo1eYUC7Bmi
 f/U/YqO539ap4Um/HFkaXDOssYwcz1mKnaTQa/5v+lVD/EuUuIj7+0z09mqBWRCUp2hvirod0dkin
 D4dCT4DvLZ6WwLrNjwdKUqtUHmyElfonTv9ThZpPX9mRek03vZ3UrBJd59F3/EoHHf1PkZNJH6RdA
 paTEdM2rDemLLar/tM39AxUorVwbBStgdUTE5WsCyGJZcXIpOihzctwSzHgFcAz8ONy/ma29C0YX3
 L3YayY41LsEyg12QRhz0yTlYjmLRXpfg+v0mtdOhejI94xUd6xQkfEgN7SAh9/iQWCNrz04yfNyG5
 vkXH7McA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVshJ-00DZWT-U9; Thu, 09 Jan 2025 14:35:42 +0100
Message-ID: <3b9ffaad-2433-4bc3-9636-80930d0cc770@igalia.com>
Date: Thu, 9 Jan 2025 13:35:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 12/18] drm/sched: Move run queue related code into a
 separate file
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-13-tvrtko.ursulin@igalia.com>
 <0d6d504a-38e3-4b9a-b4ef-d2255518336f@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <0d6d504a-38e3-4b9a-b4ef-d2255518336f@amd.com>
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


On 09/01/2025 13:02, Christian König wrote:
> Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
>> Lets move all the code dealing with struct drm_sched_rq into a separate
>> compilation unit. Advantage being sched_main.c is left with a clearer set
>> of responsibilities.
> 
> Looks like a good idea to me in general, but I would also push to 
> completely remove run queues or at least rename them.

Glad you noticed how this lead to more possbile simplifications and
yes, that was next in my list of goals.

Key is to find test cases to establish more confidence in the absence of 
regressions with the single rq approach.

Regards,

Tvrtko

> We only came up with the run queue object to handle different job 
> priorities.
> 
> But with the FIFO approach now used everywhere you can nuke that and 
> just give individual jobs with higher priorities a boost in their FIFO 
> score.
> 
> Regards,
> Christian.
> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/Makefile     |   2 +-
>>   drivers/gpu/drm/scheduler/sched_main.c | 210 +------------------------
>>   drivers/gpu/drm/scheduler/sched_rq.c   | 207 ++++++++++++++++++++++++
>>   include/drm/gpu_scheduler.h            |  12 ++
>>   4 files changed, 222 insertions(+), 209 deletions(-)
>>   create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
>>
>> diff --git a/drivers/gpu/drm/scheduler/Makefile 
>> b/drivers/gpu/drm/scheduler/Makefile
>> index 53863621829f..d11d83e285e7 100644
>> --- a/drivers/gpu/drm/scheduler/Makefile
>> +++ b/drivers/gpu/drm/scheduler/Makefile
>> @@ -20,6 +20,6 @@
>>   # OTHER DEALINGS IN THE SOFTWARE.
>>   #
>>   #
>> -gpu-sched-y := sched_main.o sched_fence.o sched_entity.o
>> +gpu-sched-y := sched_main.o sched_fence.o sched_entity.o sched_rq.o
>>   obj-$(CONFIG_DRM_SCHED) += gpu-sched.o
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c 
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index a21376ce859f..a556ee736f9f 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -87,9 +87,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
>>   };
>>   #endif
>> -#define to_drm_sched_job(sched_job)        \
>> -        container_of((sched_job), struct drm_sched_job, queue_node)
>> -
>>   int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>   /**
>> @@ -118,8 +115,8 @@ static u32 drm_sched_available_credits(struct 
>> drm_gpu_scheduler *sched)
>>    * Return true if we can push at least one more job from @entity, false
>>    * otherwise.
>>    */
>> -static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>> -                struct drm_sched_entity *entity)
>> +bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>> +             struct drm_sched_entity *entity)
>>   {
>>       struct drm_sched_job *s_job;
>> @@ -137,209 +134,6 @@ static bool drm_sched_can_queue(struct 
>> drm_gpu_scheduler *sched,
>>       return drm_sched_available_credits(sched) >= s_job->credits;
>>   }
>> -static __always_inline bool drm_sched_entity_compare_before(struct 
>> rb_node *a,
>> -                                const struct rb_node *b)
>> -{
>> -    struct drm_sched_entity *ent_a =  rb_entry((a), struct 
>> drm_sched_entity, rb_tree_node);
>> -    struct drm_sched_entity *ent_b =  rb_entry((b), struct 
>> drm_sched_entity, rb_tree_node);
>> -
>> -    return ktime_before(ent_a->oldest_job_waiting, 
>> ent_b->oldest_job_waiting);
>> -}
>> -
>> -static void __drm_sched_rq_remove_fifo_locked(struct drm_sched_entity 
>> *entity,
>> -                          struct drm_sched_rq *rq)
>> -{
>> -    lockdep_assert_held(&entity->lock);
>> -    lockdep_assert_held(&rq->lock);
>> -
>> -    rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>> -    RB_CLEAR_NODE(&entity->rb_tree_node);
>> -}
>> -
>> -static void __drm_sched_rq_add_fifo_locked(struct drm_sched_entity 
>> *entity,
>> -                       struct drm_sched_rq *rq,
>> -                       ktime_t ts)
>> -{
>> -    /*
>> -     * Both locks need to be grabbed, one to protect from entity->rq 
>> change
>> -     * for entity from within concurrent drm_sched_entity_select_rq 
>> and the
>> -     * other to update the rb tree structure.
>> -     */
>> -    lockdep_assert_held(&entity->lock);
>> -    lockdep_assert_held(&rq->lock);
>> -
>> -    entity->oldest_job_waiting = ts;
>> -
>> -    rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>> -              drm_sched_entity_compare_before);
>> -}
>> -
>> -/**
>> - * drm_sched_rq_init - initialize a given run queue struct
>> - *
>> - * @sched: scheduler instance to associate with this run queue
>> - * @rq: scheduler run queue
>> - *
>> - * Initializes a scheduler runqueue.
>> - */
>> -static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>> -                  struct drm_sched_rq *rq)
>> -{
>> -    spin_lock_init(&rq->lock);
>> -    INIT_LIST_HEAD(&rq->entities);
>> -    rq->rb_tree_root = RB_ROOT_CACHED;
>> -    rq->sched = sched;
>> -}
>> -
>> -static ktime_t
>> -drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
>> -{
>> -    lockdep_assert_held(&rq->lock);
>> -
>> -    rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
>> -
>> -    return rq->rr_deadline;
>> -}
>> -
>> -/**
>> - * drm_sched_rq_add_entity - add an entity
>> - *
>> - * @rq: scheduler run queue
>> - * @entity: scheduler entity
>> - *
>> - * Adds a scheduler entity to the run queue.
>> - *
>> - * Returns a DRM scheduler pre-selected to handle this entity.
>> - */
>> -struct drm_gpu_scheduler *
>> -drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>> -            struct drm_sched_entity *entity,
>> -            ktime_t ts)
>> -{
>> -    struct drm_gpu_scheduler *sched;
>> -
>> -    if (entity->stopped) {
>> -        DRM_ERROR("Trying to push to a killed entity\n");
>> -        return NULL;
>> -    }
>> -
>> -    spin_lock(&entity->lock);
>> -    spin_lock(&rq->lock);
>> -
>> -    sched = rq->sched;
>> -
>> -    if (!list_empty(&entity->list)) {
>> -        atomic_inc(sched->score);
>> -        list_add_tail(&entity->list, &rq->entities);
>> -    }
>> -
>> -    if (drm_sched_policy == DRM_SCHED_POLICY_RR)
>> -        ts = drm_sched_rq_get_rr_deadline(rq);
>> -
>> -    if (!RB_EMPTY_NODE(&entity->rb_tree_node))
>> -        __drm_sched_rq_remove_fifo_locked(entity, rq);
>> -    __drm_sched_rq_add_fifo_locked(entity, rq, ts);
>> -
>> -    spin_unlock(&rq->lock);
>> -    spin_unlock(&entity->lock);
>> -
>> -    return sched;
>> -}
>> -
>> -/**
>> - * drm_sched_rq_remove_entity - remove an entity
>> - *
>> - * @rq: scheduler run queue
>> - * @entity: scheduler entity
>> - *
>> - * Removes a scheduler entity from the run queue.
>> - */
>> -void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>> -                struct drm_sched_entity *entity)
>> -{
>> -    lockdep_assert_held(&entity->lock);
>> -
>> -    if (list_empty(&entity->list))
>> -        return;
>> -
>> -    spin_lock(&rq->lock);
>> -
>> -    atomic_dec(rq->sched->score);
>> -    list_del_init(&entity->list);
>> -
>> -    if (!RB_EMPTY_NODE(&entity->rb_tree_node))
>> -        __drm_sched_rq_remove_fifo_locked(entity, rq);
>> -
>> -    spin_unlock(&rq->lock);
>> -}
>> -
>> -void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
>> -                 struct drm_sched_entity *entity)
>> -{
>> -    struct drm_sched_job *next_job;
>> -
>> -    spin_lock(&entity->lock);
>> -    spin_lock(&rq->lock);
>> -    __drm_sched_rq_remove_fifo_locked(entity, rq);
>> -    next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> -    if (next_job) {
>> -        ktime_t ts;
>> -
>> -        if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> -            ts = next_job->submit_ts;
>> -        else
>> -            ts = drm_sched_rq_get_rr_deadline(rq);
>> -
>> -        __drm_sched_rq_add_fifo_locked(entity, rq, ts);
>> -    }
>> -    spin_unlock(&rq->lock);
>> -    spin_unlock(&entity->lock);
>> -}
>> -
>> -/**
>> - * drm_sched_rq_select_entity - Select an entity which provides a job 
>> to run
>> - *
>> - * @sched: the gpu scheduler
>> - * @rq: scheduler run queue to check.
>> - *
>> - * Find oldest waiting ready entity.
>> - *
>> - * Return an entity if one is found; return an error-pointer (!NULL) 
>> if an
>> - * entity was ready, but the scheduler had insufficient credits to 
>> accommodate
>> - * its job; return NULL, if no ready entity was found.
>> - */
>> -static struct drm_sched_entity *
>> -drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>> -               struct drm_sched_rq *rq)
>> -{
>> -    struct drm_sched_entity *entity = NULL;
>> -    struct rb_node *rb;
>> -
>> -    spin_lock(&rq->lock);
>> -    for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = 
>> rb_next(rb)) {
>> -        entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>> -        if (drm_sched_entity_is_ready(entity))
>> -            break;
>> -        else
>> -            entity = NULL;
>> -    }
>> -    spin_unlock(&rq->lock);
>> -
>> -    if (!entity)
>> -        return NULL;
>> -
>> -    /*
>> -     * If scheduler cannot take more jobs signal the caller to not 
>> consider
>> -     * lower priority queues.
>> -     */
>> -    if (!drm_sched_can_queue(sched, entity))
>> -        return ERR_PTR(-ENOSPC);
>> -
>> -    reinit_completion(&entity->entity_idle);
>> -
>> -    return entity;
>> -}
>> -
>>   /**
>>    * drm_sched_run_job_queue - enqueue run-job work
>>    * @sched: scheduler instance
>> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c 
>> b/drivers/gpu/drm/scheduler/sched_rq.c
>> new file mode 100644
>> index 000000000000..40f5b770f21a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
>> @@ -0,0 +1,207 @@
>> +#include <linux/rbtree.h>
>> +
>> +#include <drm/drm_print.h>
>> +#include <drm/gpu_scheduler.h>
>> +
>> +static __always_inline bool drm_sched_entity_compare_before(struct 
>> rb_node *a,
>> +                                const struct rb_node *b)
>> +{
>> +    struct drm_sched_entity *ent_a =  rb_entry((a), struct 
>> drm_sched_entity, rb_tree_node);
>> +    struct drm_sched_entity *ent_b =  rb_entry((b), struct 
>> drm_sched_entity, rb_tree_node);
>> +
>> +    return ktime_before(ent_a->oldest_job_waiting, 
>> ent_b->oldest_job_waiting);
>> +}
>> +
>> +static void __drm_sched_rq_remove_fifo_locked(struct drm_sched_entity 
>> *entity,
>> +                          struct drm_sched_rq *rq)
>> +{
>> +    lockdep_assert_held(&entity->lock);
>> +    lockdep_assert_held(&rq->lock);
>> +
>> +    rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>> +    RB_CLEAR_NODE(&entity->rb_tree_node);
>> +}
>> +
>> +static void __drm_sched_rq_add_fifo_locked(struct drm_sched_entity 
>> *entity,
>> +                       struct drm_sched_rq *rq,
>> +                       ktime_t ts)
>> +{
>> +    /*
>> +     * Both locks need to be grabbed, one to protect from entity->rq 
>> change
>> +     * for entity from within concurrent drm_sched_entity_select_rq 
>> and the
>> +     * other to update the rb tree structure.
>> +     */
>> +    lockdep_assert_held(&entity->lock);
>> +    lockdep_assert_held(&rq->lock);
>> +
>> +    entity->oldest_job_waiting = ts;
>> +    rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>> +              drm_sched_entity_compare_before);
>> +}
>> +
>> +/**
>> + * drm_sched_rq_init - initialize a given run queue struct
>> + *
>> + * @sched: scheduler instance to associate with this run queue
>> + * @rq: scheduler run queue
>> + *
>> + * Initializes a scheduler runqueue.
>> + */
>> +void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>> +               struct drm_sched_rq *rq)
>> +{
>> +    spin_lock_init(&rq->lock);
>> +    INIT_LIST_HEAD(&rq->entities);
>> +    rq->rb_tree_root = RB_ROOT_CACHED;
>> +    rq->sched = sched;
>> +}
>> +
>> +static ktime_t
>> +drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
>> +{
>> +    lockdep_assert_held(&rq->lock);
>> +
>> +    rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
>> +
>> +    return rq->rr_deadline;
>> +}
>> +
>> +/**
>> + * drm_sched_rq_add_entity - add an entity
>> + *
>> + * @rq: scheduler run queue
>> + * @entity: scheduler entity
>> + * @ts: submission timestamp
>> + *
>> + * Adds a scheduler entity to the run queue.
>> + *
>> + * Returns a DRM scheduler pre-selected to handle this entity.
>> + */
>> +struct drm_gpu_scheduler *
>> +drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>> +            struct drm_sched_entity *entity,
>> +            ktime_t ts)
>> +{
>> +    struct drm_gpu_scheduler *sched;
>> +
>> +    if (entity->stopped) {
>> +        DRM_ERROR("Trying to push to a killed entity\n");
>> +        return NULL;
>> +    }
>> +
>> +    spin_lock(&entity->lock);
>> +    spin_lock(&rq->lock);
>> +
>> +    sched = rq->sched;
>> +
>> +    if (!list_empty(&entity->list)) {
>> +        atomic_inc(sched->score);
>> +        list_add_tail(&entity->list, &rq->entities);
>> +    }
>> +
>> +    if (drm_sched_policy == DRM_SCHED_POLICY_RR)
>> +        ts = drm_sched_rq_get_rr_deadline(rq);
>> +
>> +    if (!RB_EMPTY_NODE(&entity->rb_tree_node))
>> +        __drm_sched_rq_remove_fifo_locked(entity, rq);
>> +    __drm_sched_rq_add_fifo_locked(entity, rq, ts);
>> +
>> +    spin_unlock(&rq->lock);
>> +    spin_unlock(&entity->lock);
>> +
>> +    return sched;
>> +}
>> +
>> +/**
>> + * drm_sched_rq_remove_entity - remove an entity
>> + *
>> + * @rq: scheduler run queue
>> + * @entity: scheduler entity
>> + *
>> + * Removes a scheduler entity from the run queue.
>> + */
>> +void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>> +                struct drm_sched_entity *entity)
>> +{
>> +    lockdep_assert_held(&entity->lock);
>> +
>> +    if (list_empty(&entity->list))
>> +        return;
>> +
>> +    spin_lock(&rq->lock);
>> +
>> +    atomic_dec(rq->sched->score);
>> +    list_del_init(&entity->list);
>> +
>> +    if (!RB_EMPTY_NODE(&entity->rb_tree_node))
>> +        __drm_sched_rq_remove_fifo_locked(entity, rq);
>> +
>> +    spin_unlock(&rq->lock);
>> +}
>> +
>> +void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
>> +                 struct drm_sched_entity *entity)
>> +{
>> +    struct drm_sched_job *next_job;
>> +
>> +    spin_lock(&entity->lock);
>> +    spin_lock(&rq->lock);
>> +    __drm_sched_rq_remove_fifo_locked(entity, rq);
>> +    next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> +    if (next_job) {
>> +        ktime_t ts;
>> +
>> +        if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +            ts = next_job->submit_ts;
>> +        else
>> +            ts = drm_sched_rq_get_rr_deadline(rq);
>> +
>> +        __drm_sched_rq_add_fifo_locked(entity, rq, ts);
>> +    }
>> +    spin_unlock(&rq->lock);
>> +    spin_unlock(&entity->lock);
>> +}
>> +
>> +/**
>> + * drm_sched_rq_select_entity - Select an entity which provides a job 
>> to run
>> + *
>> + * @sched: the gpu scheduler
>> + * @rq: scheduler run queue to check.
>> + *
>> + * Find oldest waiting ready entity.
>> + *
>> + * Return an entity if one is found; return an error-pointer (!NULL) 
>> if an
>> + * entity was ready, but the scheduler had insufficient credits to 
>> accommodate
>> + * its job; return NULL, if no ready entity was found.
>> + */
>> +struct drm_sched_entity *
>> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>> +               struct drm_sched_rq *rq)
>> +{
>> +    struct drm_sched_entity *entity = NULL;
>> +    struct rb_node *rb;
>> +
>> +    spin_lock(&rq->lock);
>> +    for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = 
>> rb_next(rb)) {
>> +        entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
>> +        if (drm_sched_entity_is_ready(entity))
>> +            break;
>> +        else
>> +            entity = NULL;
>> +    }
>> +    spin_unlock(&rq->lock);
>> +
>> +    if (!entity)
>> +        return NULL;
>> +
>> +    /*
>> +     * If scheduler cannot take more jobs signal the caller to not 
>> consider
>> +     * lower priority queues.
>> +     */
>> +    if (!drm_sched_can_queue(sched, entity))
>> +        return ERR_PTR(-ENOSPC);
>> +
>> +    reinit_completion(&entity->entity_idle);
>> +
>> +    return entity;
>> +}
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index daf4665f37fa..ccb39e7bf384 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -386,6 +386,9 @@ struct drm_sched_job {
>>       ktime_t                         submit_ts;
>>   };
>> +#define to_drm_sched_job(sched_job)        \
>> +        container_of((sched_job), struct drm_sched_job, queue_node)
>> +
>>   static inline bool drm_sched_invalidate_job(struct drm_sched_job 
>> *s_job,
>>                           int threshold)
>>   {
>> @@ -547,6 +550,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>              atomic_t *score, const char *name, struct device *dev);
>>   void drm_sched_fini(struct drm_gpu_scheduler *sched);
>> +bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
>> +             struct drm_sched_entity *entity);
>> +
>>   int drm_sched_job_init(struct drm_sched_job *job,
>>                  struct drm_sched_entity *entity,
>>                  u32 credits, void *owner);
>> @@ -586,6 +592,9 @@ bool drm_sched_dependency_optimized(struct 
>> dma_fence* fence,
>>                       struct drm_sched_entity *entity);
>>   void drm_sched_fault(struct drm_gpu_scheduler *sched);
>> +void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>> +               struct drm_sched_rq *rq);
>> +
>>   struct drm_gpu_scheduler *
>>   drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>               struct drm_sched_entity *entity,
>> @@ -595,6 +604,9 @@ void drm_sched_rq_remove_entity(struct 
>> drm_sched_rq *rq,
>>   void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
>>                    struct drm_sched_entity *entity);
>> +struct drm_sched_entity *
>> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>> +               struct drm_sched_rq *rq);
>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>                 enum drm_sched_priority priority,
> 
