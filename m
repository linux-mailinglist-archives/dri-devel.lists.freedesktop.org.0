Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C4A78E3C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48E110E76A;
	Wed,  2 Apr 2025 12:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="N7+MU61q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A69E10E769;
 Wed,  2 Apr 2025 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4iJQu67TH4eYY5nfNfgb58xLBM31FcZ2euK+/JopBwE=; b=N7+MU61qjizwK73S3mBOER9HUa
 9u0P1asmhdUyo20i6XezYxAQvFoRI5MhyQrnc+o1AuuBBVisgwIsWQndgktFSv+QtEpnLNvUnSCEx
 jLOvahRYOR3jrKMZ3XvIpF2JpHdNe6FdFHfUsPumLSwLYWNCHLFmpk67gdEfezLuo+9h7Ogw20l4E
 IYyeY24Cr/FqoCAftjz0FjegkM/nfvvdg5OZ6UQG5mCMbeRtVC2UZJG8gMJ5fSnROwmZbNsGM84c0
 h9d9VLPQfpsevKlFce8n3rI0Pf9vSz4VdqHEYCRdi+A1IbAftD7KgUIh+NLwDVOdHcFBVzYmGTs2y
 v4Jue1Qw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tzxA3-00AMo2-WA; Wed, 02 Apr 2025 14:25:40 +0200
Message-ID: <101bb650-f6fc-49d0-8840-c0f6734a9cb9@igalia.com>
Date: Wed, 2 Apr 2025 13:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 06/14] drm/sched: Implement RR via FIFO
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
 <20250331201705.60663-7-tvrtko.ursulin@igalia.com>
 <e4594adff1606e6a92714bbcad5838c3f100acdf.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <e4594adff1606e6a92714bbcad5838c3f100acdf.camel@mailbox.org>
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


On 02/04/2025 11:46, Philipp Stanner wrote:
> On Mon, 2025-03-31 at 21:16 +0100, Tvrtko Ursulin wrote:
>> Round-robin being the non-default policy and unclear how much it is
>> used,
>> we can notice that it can be implemented using the FIFO data
>> structures if
>> we only invent a fake submit timestamp which is monotonically
>> increasing
>> inside drm_sched_rq instances.
>>
>> So instead of remembering which was the last entity the scheduler
>> worker
>> picked, we can bump the picked one to the bottom of the tree,
>> achieving
>> the same round-robin behaviour.
>>
>> Advantage is that we can consolidate to a single code path and remove
>> a
>> bunch of code. Downside is round-robin mode now needs to lock on the
>> job
>> pop path but that should not be visible.
> 
> Why did you decide to do it that way and then later remove RR & FIFO
> alltogether in patch 10, basically?

Idea is that you can take the series up to here and still gain 
something. I this case it is code consolidation. Still the same FIFO and 
RR policies just in less lines of code. Ie. you can take it up to here 
for no regressions. (If we ignore FIFO does some more locking than RR 
does, which I think we can.)

> I think the far cleaner way for our development-process would be a
> separate patch(-series) that *removes* RR completely. Advantages are:
> 
>     1. It should be relatively easy to do
>     2. It would simplify the existing code base independently of what
>        happens with your RFC series here
>     3. Before changing everyone's scheduling policy to a completely new,
>        deadline-based one, we could first be sure for a few release
>        cycles that everyone is now on FIFO, establishing common ground.
>     4. We could CC every- and anyone who might use RR or might know
>        someone who does
>     5. If it turns out we screwed up and someone really relies on RR, it
>        would be easy to revert.
> 
> I am not aware of any RR users and have, in past discussions, never
> heard of any. So removing it is more tempting for the above reasons.

Yes that could be an option. I however did not simply want to remove RR, 
I wanted to improve FIFO so it is better in the edge cases where people 
switch to RR, or to at least not regress against FIFO, and at the same 
time end up with a smaller code base.

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
> 
> +Cc Michel here, too
> 
> 
> P.
> 
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 45 ++++++++------
>>   drivers/gpu/drm/scheduler/sched_main.c   | 76 ++--------------------
>> --
>>   include/drm/gpu_scheduler.h              |  5 +-
>>   3 files changed, 36 insertions(+), 90 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 9b0122e99b44..bbb7f3d3e3e8 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -469,9 +469,19 @@ drm_sched_job_dependency(struct drm_sched_job
>> *job,
>>    return NULL;
>>   }
>>   
>> +static ktime_t
>> +drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
>> +{
>> + lockdep_assert_held(&rq->lock);
>> +
>> + rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
>> +
>> + return rq->rr_deadline;
>> +}
>> +
>>   struct drm_sched_job *drm_sched_entity_pop_job(struct
>> drm_sched_entity *entity)
>>   {
>> - struct drm_sched_job *sched_job;
>> + struct drm_sched_job *sched_job, *next_job;
>>   
>>    sched_job = drm_sched_entity_queue_peek(entity);
>>    if (!sched_job)
>> @@ -506,21 +516,22 @@ struct drm_sched_job
>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>    * Update the entity's location in the min heap according to
>>    * the timestamp of the next job, if any.
>>    */
>> - if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
>> - struct drm_sched_job *next;
>> + next_job = drm_sched_entity_queue_peek(entity);
>> + if (next_job) {
>> + struct drm_sched_rq *rq;
>> + ktime_t ts;
>>   
>> - next = drm_sched_entity_queue_peek(entity);
>> - if (next) {
>> - struct drm_sched_rq *rq;
>> + if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> + ts = next_job->submit_ts;
>> + else
>> + ts = drm_sched_rq_get_rr_deadline(rq);
>>   
>> - spin_lock(&entity->lock);
>> - rq = entity->rq;
>> - spin_lock(&rq->lock);
>> - drm_sched_rq_update_fifo_locked(entity, rq,
>> - next->submit_ts);
>> - spin_unlock(&rq->lock);
>> - spin_unlock(&entity->lock);
>> - }
>> + spin_lock(&entity->lock);
>> + rq = entity->rq;
>> + spin_lock(&rq->lock);
>> + drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> + spin_unlock(&rq->lock);
>> + spin_unlock(&entity->lock);
>>    }
>>   
>>    /* Jobs and entities might have different lifecycles. Since we're
>> @@ -619,9 +630,9 @@ void drm_sched_entity_push_job(struct
>> drm_sched_job *sched_job)
>>   
>>    spin_lock(&rq->lock);
>>    drm_sched_rq_add_entity(rq, entity);
>> -
>> - if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> - drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>> + if (drm_sched_policy == DRM_SCHED_POLICY_RR)
>> + submit_ts = drm_sched_rq_get_rr_deadline(rq);
>> + drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
>>   
>>    spin_unlock(&rq->lock);
>>    spin_unlock(&entity->lock);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 600904271b01..e931a9b91083 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -190,7 +190,6 @@ static void drm_sched_rq_init(struct
>> drm_gpu_scheduler *sched,
>>    spin_lock_init(&rq->lock);
>>    INIT_LIST_HEAD(&rq->entities);
>>    rq->rb_tree_root = RB_ROOT_CACHED;
>> - rq->current_entity = NULL;
>>    rq->sched = sched;
>>   }
>>   
>> @@ -236,74 +235,13 @@ void drm_sched_rq_remove_entity(struct
>> drm_sched_rq *rq,
>>    atomic_dec(rq->sched->score);
>>    list_del_init(&entity->list);
>>   
>> - if (rq->current_entity == entity)
>> - rq->current_entity = NULL;
>> -
>> - if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> - drm_sched_rq_remove_fifo_locked(entity, rq);
>> + drm_sched_rq_remove_fifo_locked(entity, rq);
>>   
>>    spin_unlock(&rq->lock);
>>   }
>>   
>>   /**
>> - * drm_sched_rq_select_entity_rr - Select an entity which could
>> provide a job to run
>> - *
>> - * @sched: the gpu scheduler
>> - * @rq: scheduler run queue to check.
>> - *
>> - * Try to find the next ready entity.
>> - *
>> - * Return an entity if one is found; return an error-pointer (!NULL)
>> if an
>> - * entity was ready, but the scheduler had insufficient credits to
>> accommodate
>> - * its job; return NULL, if no ready entity was found.
>> - */
>> -static struct drm_sched_entity *
>> -drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
>> -       struct drm_sched_rq *rq)
>> -{
>> - struct drm_sched_entity *entity;
>> -
>> - spin_lock(&rq->lock);
>> -
>> - entity = rq->current_entity;
>> - if (entity) {
>> - list_for_each_entry_continue(entity, &rq->entities, list) {
>> - if (drm_sched_entity_is_ready(entity))
>> - goto found;
>> - }
>> - }
>> -
>> - list_for_each_entry(entity, &rq->entities, list) {
>> - if (drm_sched_entity_is_ready(entity))
>> - goto found;
>> -
>> - if (entity == rq->current_entity)
>> - break;
>> - }
>> -
>> - spin_unlock(&rq->lock);
>> -
>> - return NULL;
>> -
>> -found:
>> - if (!drm_sched_can_queue(sched, entity)) {
>> - /*
>> - * If scheduler cannot take more jobs signal the caller to not
>> - * consider lower priority queues.
>> - */
>> - entity = ERR_PTR(-ENOSPC);
>> - } else {
>> - rq->current_entity = entity;
>> - reinit_completion(&entity->entity_idle);
>> - }
>> -
>> - spin_unlock(&rq->lock);
>> -
>> - return entity;
>> -}
>> -
>> -/**
>> - * drm_sched_rq_select_entity_fifo - Select an entity which provides
>> a job to run
>> + * drm_sched_rq_select_entity - Select an entity which provides a
>> job to run
>>    *
>>    * @sched: the gpu scheduler
>>    * @rq: scheduler run queue to check.
>> @@ -315,8 +253,8 @@ drm_sched_rq_select_entity_rr(struct
>> drm_gpu_scheduler *sched,
>>    * its job; return NULL, if no ready entity was found.
>>    */
>>   static struct drm_sched_entity *
>> -drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
>> - struct drm_sched_rq *rq)
>> +drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
>> +    struct drm_sched_rq *rq)
>>   {
>>    struct drm_sched_entity *entity = NULL;
>>    struct rb_node *rb;
>> @@ -1061,15 +999,13 @@ void drm_sched_wakeup(struct drm_gpu_scheduler
>> *sched)
>>   static struct drm_sched_entity *
>>   drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>   {
>> - struct drm_sched_entity *entity;
>> + struct drm_sched_entity *entity = NULL;
>>    int i;
>>   
>>    /* Start with the highest priority.
>>    */
>>    for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
>> - entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
>> - drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
>> - drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
>> + entity = drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
>>    if (entity)
>>    break;
>>    }
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index 1a7e377d4cbb..1073cc569cce 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -239,8 +239,7 @@ struct drm_sched_entity {
>>    * struct drm_sched_rq - queue of entities to be scheduled.
>>    *
>>    * @sched: the scheduler to which this rq belongs to.
>> - * @lock: protects @entities, @rb_tree_root and @current_entity.
>> - * @current_entity: the entity which is to be scheduled.
>> + * @lock: protects @entities, @rb_tree_root and @rr_deadline.
>>    * @entities: list of the entities to be scheduled.
>>    * @rb_tree_root: root of time based priority queue of entities for
>> FIFO scheduling
>>    *
>> @@ -253,7 +252,7 @@ struct drm_sched_rq {
>>   
>>    spinlock_t lock;
>>    /* Following members are protected by the @lock: */
>> - struct drm_sched_entity *current_entity;
>> + ktime_t rr_deadline;
>>    struct list_head entities;
>>    struct rb_root_cached rb_tree_root;
>>   };
> 

