Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223FE79220D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 13:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF8210E4B2;
	Tue,  5 Sep 2023 11:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C70210E4B1
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 11:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693912244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJAyU7o7DHbWBQQHfmNhixXt3tkacDNjtsJbnS1LdrM=;
 b=ArrzkhPh44Wvyf6mArhr2Y3Ghr8CkR3vO1hAEMmy+kFPtAIKwsX9D5sXflI56VLZCEK3Fc
 iip6Aj4t1/N6Y7u6NAVXQ/WWm7E/++XU6H5EFQ9zd4/k+ieFqTryzQw0ffVhbrSkooe33j
 BVf+a5gwfeBYz0j9j2hYxVAXk71n1E4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-UvOtP5hlMFGnAh9Naejg-Q-1; Tue, 05 Sep 2023 07:10:42 -0400
X-MC-Unique: UvOtP5hlMFGnAh9Naejg-Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-94a35b0d4ceso154174966b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 04:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693912241; x=1694517041;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VJAyU7o7DHbWBQQHfmNhixXt3tkacDNjtsJbnS1LdrM=;
 b=JhyyBwmjtuM+rAly7K+K+0icBWfWqJ72Qd3904UFB0oOM0zd5LusGLhEDXLvBFqspj
 OBxFG/zHNwDYv54TZF2xDr90U1XxDgGj5eaDC8YtZE+CwzxfLq45jff4Vja2menMTpVu
 Qz1cdQH8UA3Aoy2hr/iyDTz/iJBnLp7OtvaoejZYegyPCi7WeFNDQt6L40Qz6Pt8ndT3
 EGcVk4oDBSRq72MCO/0m2NZBdvui56xjqXQ+MPSAhLjiyAmFjGUWPt9f6I6Q7xcE98tA
 C0hFYvAarW0HBbfL+USAEUwn7hJ2NvOgSY3kCBF4K7RCaMOGEuPoCiVxVCLiBU3/mgM1
 6srw==
X-Gm-Message-State: AOJu0Yw4LI2uG/28/Cgq+BspOe1qRX2ZU6E0EPMX3DdEgBCZI1BuVyej
 xtEwKufKqfjQAYRJZaS6A20OuNsAYgzz/OBZUu1L2i5yAzpasvD70UaAgU4A6qgbkqjCQj4cwwB
 CHQGJYSlEHbp/PogoeXleD0ff7Mll
X-Received: by 2002:a17:907:2e19:b0:9a1:ce57:8e47 with SMTP id
 ig25-20020a1709072e1900b009a1ce578e47mr8989468ejc.68.1693912241444; 
 Tue, 05 Sep 2023 04:10:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiyCrwIp99NNlIPA8mXFJr1CFUi9Wgt6Qfy6kpIScWYSNriec6vGpr+h4ED1J1zE9IObFSTw==
X-Received: by 2002:a17:907:2e19:b0:9a1:ce57:8e47 with SMTP id
 ig25-20020a1709072e1900b009a1ce578e47mr8989444ejc.68.1693912240989; 
 Tue, 05 Sep 2023 04:10:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jw26-20020a17090776ba00b00982a92a849asm7485462ejc.91.2023.09.05.04.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 04:10:40 -0700 (PDT)
Message-ID: <f2e87279-e2c3-db5c-0fe6-51ad77d7afb5@redhat.com>
Date: Tue, 5 Sep 2023 13:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/9] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
From: Danilo Krummrich <dakr@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-4-matthew.brost@intel.com>
 <21b82a4e-ded8-cb63-0013-72e4043c3344@redhat.com>
Organization: RedHat
In-Reply-To: <21b82a4e-ded8-cb63-0013-72e4043c3344@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/29/23 19:37, Danilo Krummrich wrote:
> On 8/11/23 04:31, Matthew Brost wrote:
>> DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
>> scheduler and entity. No priorities or run queue used in this mode.
>> Intended for devices with firmware schedulers.
>>
>> v2:
>>    - Drop sched / rq union (Luben)
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 69 ++++++++++++++++++------
>>   drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
>>   drivers/gpu/drm/scheduler/sched_main.c   | 63 +++++++++++++++++++---
>>   include/drm/gpu_scheduler.h              |  8 +++
>>   4 files changed, 119 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 65a972b52eda..1dec97caaba3 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>       memset(entity, 0, sizeof(struct drm_sched_entity));
>>       INIT_LIST_HEAD(&entity->list);
>>       entity->rq = NULL;
>> +    entity->single_sched = NULL;
>>       entity->guilty = guilty;
>>       entity->num_sched_list = num_sched_list;
>>       entity->priority = priority;
>> @@ -90,8 +91,17 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>       RCU_INIT_POINTER(entity->last_scheduled, NULL);
>>       RB_CLEAR_NODE(&entity->rb_tree_node);
>> -    if(num_sched_list)
>> -        entity->rq = &sched_list[0]->sched_rq[entity->priority];
>> +    if (num_sched_list) {
>> +        if (sched_list[0]->sched_policy !=
>> +            DRM_SCHED_POLICY_SINGLE_ENTITY) {
>> +            entity->rq = &sched_list[0]->sched_rq[entity->priority];
>> +        } else {
>> +            if (num_sched_list != 1 || sched_list[0]->single_entity)
>> +                return -EINVAL;
>> +            sched_list[0]->single_entity = entity;
>> +            entity->single_sched = sched_list[0];
>> +        }
>> +    }
>>       init_completion(&entity->entity_idle);
>> @@ -124,7 +134,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>                       struct drm_gpu_scheduler **sched_list,
>>                       unsigned int num_sched_list)
>>   {
>> -    WARN_ON(!num_sched_list || !sched_list);
>> +    WARN_ON(!num_sched_list || !sched_list ||
>> +        !!entity->single_sched);
>>       entity->sched_list = sched_list;
>>       entity->num_sched_list = num_sched_list;
>> @@ -231,13 +242,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>   {
>>       struct drm_sched_job *job;
>>       struct dma_fence *prev;
>> +    bool single_entity = !!entity->single_sched;
>> -    if (!entity->rq)
>> +    if (!entity->rq && !single_entity)
>>           return;
>>       spin_lock(&entity->rq_lock);
>>       entity->stopped = true;
>> -    drm_sched_rq_remove_entity(entity->rq, entity);
>> +    if (!single_entity)
>> +        drm_sched_rq_remove_entity(entity->rq, entity);
> 
> Looks like nothing prevents drm_sched_run_job_work() to fetch more jobs from the entity,
> hence if this is called for an entity still having queued up jobs and a still running
> scheduler, drm_sched_entity_kill() and drm_sched_run_job_work() would race for jobs, right?

I worked around this with:

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9a5e9b7032da..0687da57757d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1025,7 +1025,8 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
                 return NULL;
  
         if (sched->single_entity) {
-               if (drm_sched_entity_is_ready(sched->single_entity))
+               if (drm_sched_entity_is_ready(sched->single_entity) &&
+                   !READ_ONCE(sched->single_entity->stopped))
                         return sched->single_entity;
  
                 return NULL;

> 
> Not sure if this is by intention because we don't expect the driver to drm_sched_entity_fini()
> as long as there are still queued up jobs. At least this is inconsistant to what
> drm_sched_entity_kill() does without DRM_SCHED_POLICY_SINGLE_ENTITY and should either be fixed
> or documented if we agree nothing else makes sense.
> 
> I think it also touches my question on how to tear down the scheduler once a ring is removed
> or deinitialized.
> 
> I know XE is going its own way in this respect, but I also feel like we're leaving drivers
> potentially being interested in DRM_SCHED_POLICY_SINGLE_ENTITY a bit alone on that. I think
> we should probably give drivers a bit more guidance on how to do that.
> 
> Currently, I see two approaches.
> 
> (1) Do what XE does, which means letting the scheduler run dry, which includes both the
>      entity's job queue and the schedulers pending_list. While jobs from the entity's queue
>      aren't pushing any more work to the ring on tear down, but just "flow through" to get
>      freed up eventually. (Hopefully I got that right.)
> 
> (2) Kill the entity to cleanup jobs from the entity's queue, stop the scheduler and either
>      just wait for pending jobs or signal them right away and finally free them up.
> 
> Actually there'd also be (3), which could be a mix of both, discard the entity's queued jobs,
> but let the pending_list run dry.
> 
> I'm not saying we should provide a whole bunch of infrastructure for drivers, e.g. for (1)
> as you've mentioned already as well, there is probably not much to generalize anyway. However,
> I think we should document the options drivers have to tear things down and do enough to
> enable drivers using any option (as long as we agree it is reasonable).
> 
> For Nouveau specifically, I'd probably like to go with (3).
> 
> - Danilo
> 
>>       spin_unlock(&entity->rq_lock);
>>       /* Make sure this entity is not used by the scheduler at the moment */
>> @@ -259,6 +272,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
>>       dma_fence_put(prev);
>>   }
>> +/**
>> + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
>> + * @entity: scheduler entity
>> + *
>> + * Returns GPU scheduler for the entity
>> + */
>> +struct drm_gpu_scheduler *
>> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
>> +{
>> +    bool single_entity = !!entity->single_sched;
>> +
>> +    return single_entity ? entity->single_sched : entity->rq->sched;
>> +}
>> +
>>   /**
>>    * drm_sched_entity_flush - Flush a context entity
>>    *
>> @@ -276,11 +303,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>>       struct drm_gpu_scheduler *sched;
>>       struct task_struct *last_user;
>>       long ret = timeout;
>> +    bool single_entity = !!entity->single_sched;
>> -    if (!entity->rq)
>> +    if (!entity->rq && !single_entity)
>>           return 0;
>> -    sched = entity->rq->sched;
>> +    sched = drm_sched_entity_to_scheduler(entity);
>>       /**
>>        * The client will not queue more IBs during this fini, consume existing
>>        * queued IBs or discard them on SIGKILL
>> @@ -373,7 +401,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>>           container_of(cb, struct drm_sched_entity, cb);
>>       drm_sched_entity_clear_dep(f, cb);
>> -    drm_sched_wakeup_if_can_queue(entity->rq->sched);
>> +    drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
>>   }
>>   /**
>> @@ -387,6 +415,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
>>   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>                      enum drm_sched_priority priority)
>>   {
>> +    WARN_ON(!!entity->single_sched);
>> +
>>       spin_lock(&entity->rq_lock);
>>       entity->priority = priority;
>>       spin_unlock(&entity->rq_lock);
>> @@ -399,7 +429,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
>>    */
>>   static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>   {
>> -    struct drm_gpu_scheduler *sched = entity->rq->sched;
>> +    struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
>>       struct dma_fence *fence = entity->dependency;
>>       struct drm_sched_fence *s_fence;
>> @@ -501,7 +531,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>        * Update the entity's location in the min heap according to
>>        * the timestamp of the next job, if any.
>>        */
>> -    if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
>> +    if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
>> +        DRM_SCHED_POLICY_FIFO) {
>>           struct drm_sched_job *next;
>>           next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> @@ -524,6 +555,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>       struct drm_gpu_scheduler *sched;
>>       struct drm_sched_rq *rq;
>> +    WARN_ON(!!entity->single_sched);
>> +
>>       /* single possible engine and already selected */
>>       if (!entity->sched_list)
>>           return;
>> @@ -573,12 +606,13 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>   {
>>       struct drm_sched_entity *entity = sched_job->entity;
>> -    bool first, fifo = entity->rq->sched->sched_policy ==
>> -        DRM_SCHED_POLICY_FIFO;
>> +    bool single_entity = !!entity->single_sched;
>> +    bool first;
>>       ktime_t submit_ts;
>>       trace_drm_sched_job(sched_job, entity);
>> -    atomic_inc(entity->rq->sched->score);
>> +    if (!single_entity)
>> +        atomic_inc(entity->rq->sched->score);
>>       WRITE_ONCE(entity->last_user, current->group_leader);
>>       /*
>> @@ -591,6 +625,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>       /* first job wakes up scheduler */
>>       if (first) {
>> +        struct drm_gpu_scheduler *sched =
>> +            drm_sched_entity_to_scheduler(entity);
>> +        bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
>> +
>>           /* Add the entity to the run queue */
>>           spin_lock(&entity->rq_lock);
>>           if (entity->stopped) {
>> @@ -600,13 +638,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>               return;
>>           }
>> -        drm_sched_rq_add_entity(entity->rq, entity);
>> +        if (!single_entity)
>> +            drm_sched_rq_add_entity(entity->rq, entity);
>>           spin_unlock(&entity->rq_lock);
>>           if (fifo)
>>               drm_sched_rq_update_fifo(entity, submit_ts);
>> -        drm_sched_wakeup_if_can_queue(entity->rq->sched);
>> +        drm_sched_wakeup_if_can_queue(sched);
>>       }
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_push_job);
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>> index 06cedfe4b486..f6b926f5e188 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>   {
>>       unsigned seq;
>> -    fence->sched = entity->rq->sched;
>> +    fence->sched = drm_sched_entity_to_scheduler(entity);
>>       seq = atomic_inc_return(&entity->fence_seq);
>>       dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>                  &fence->lock, entity->fence_context, seq);
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 545d5298c086..cede47afc800 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -32,7 +32,8 @@
>>    * backend operations to the scheduler like submitting a job to hardware run queue,
>>    * returning the dependencies of a job etc.
>>    *
>> - * The organisation of the scheduler is the following:
>> + * The organisation of the scheduler is the following for scheduling policies
>> + * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
>>    *
>>    * 1. Each hw run queue has one scheduler
>>    * 2. Each scheduler has multiple run queues with different priorities
>> @@ -43,6 +44,23 @@
>>    *
>>    * The jobs in a entity are always scheduled in the order that they were pushed.
>>    *
>> + * The organisation of the scheduler is the following for scheduling policy
>> + * DRM_SCHED_POLICY_SINGLE_ENTITY:
>> + *
>> + * 1. One to one relationship between scheduler and entity
>> + * 2. No priorities implemented per scheduler (single job queue)
>> + * 3. No run queues in scheduler rather jobs are directly dequeued from entity
>> + * 4. The entity maintains a queue of jobs that will be scheduled on the
>> + * hardware
>> + *
>> + * The jobs in a entity are always scheduled in the order that they were pushed
>> + * regardless of scheduling policy.
>> + *
>> + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to used
>> + * when the KMD is scheduling directly on the hardware while a scheduling policy
>> + * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there is a
>> + * firmware scheduler.
>> + *
>>    * Note that once a job was taken from the entities queue and pushed to the
>>    * hardware, i.e. the pending queue, the entity must not be referenced anymore
>>    * through the jobs entity pointer.
>> @@ -96,6 +114,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
>>   void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>>   {
>> +    WARN_ON(!!entity->single_sched);
>> +
>>       /*
>>        * Both locks need to be grabbed, one to protect from entity->rq change
>>        * for entity from within concurrent drm_sched_entity_select_rq and the
>> @@ -126,6 +146,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
>>   static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>                     struct drm_sched_rq *rq)
>>   {
>> +    WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
>> +
>>       spin_lock_init(&rq->lock);
>>       INIT_LIST_HEAD(&rq->entities);
>>       rq->rb_tree_root = RB_ROOT_CACHED;
>> @@ -144,6 +166,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>>   void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>                    struct drm_sched_entity *entity)
>>   {
>> +    WARN_ON(!!entity->single_sched);
>> +
>>       if (!list_empty(&entity->list))
>>           return;
>> @@ -166,6 +190,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>                   struct drm_sched_entity *entity)
>>   {
>> +    WARN_ON(!!entity->single_sched);
>> +
>>       if (list_empty(&entity->list))
>>           return;
>> @@ -641,7 +667,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>                  struct drm_sched_entity *entity,
>>                  void *owner)
>>   {
>> -    if (!entity->rq)
>> +    if (!entity->rq && !entity->single_sched)
>>           return -ENOENT;
>>       job->entity = entity;
>> @@ -674,13 +700,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>   {
>>       struct drm_gpu_scheduler *sched;
>>       struct drm_sched_entity *entity = job->entity;
>> +    bool single_entity = !!entity->single_sched;
>>       BUG_ON(!entity);
>> -    drm_sched_entity_select_rq(entity);
>> -    sched = entity->rq->sched;
>> +    if (!single_entity)
>> +        drm_sched_entity_select_rq(entity);
>> +    sched = drm_sched_entity_to_scheduler(entity);
>>       job->sched = sched;
>> -    job->s_priority = entity->rq - sched->sched_rq;
>> +    if (!single_entity)
>> +        job->s_priority = entity->rq - sched->sched_rq;
>>       job->id = atomic64_inc_return(&sched->job_id_count);
>>       drm_sched_fence_init(job->s_fence, job->entity);
>> @@ -896,6 +925,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
>>       if (!drm_sched_can_queue(sched))
>>           return NULL;
>> +    if (sched->single_entity) {
>> +        if (drm_sched_entity_is_ready(sched->single_entity))
>> +            return sched->single_entity;
>> +
>> +        return NULL;
>> +    }
>> +
>>       /* Kernel run queue has higher priority than normal run queue*/
>>       for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>>           entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
>> @@ -1091,6 +1127,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>           return -EINVAL;
>>       sched->ops = ops;
>> +    sched->single_entity = NULL;
>>       sched->hw_submission_limit = hw_submission;
>>       sched->name = name;
>>       sched->submit_wq = submit_wq ? : system_wq;
>> @@ -1103,7 +1140,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>>           sched->sched_policy = default_drm_sched_policy;
>>       else
>>           sched->sched_policy = sched_policy;
>> -    for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
>> +    for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
>> +         DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
>> +         i++)
>>           drm_sched_rq_init(sched, &sched->sched_rq[i]);
>>       init_waitqueue_head(&sched->job_scheduled);
>> @@ -1135,7 +1174,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>>       drm_sched_submit_stop(sched);
>> -    for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
>> +    if (sched->single_entity) {
>> +        spin_lock(&sched->single_entity->rq_lock);
>> +        sched->single_entity->stopped = true;
>> +        spin_unlock(&sched->single_entity->rq_lock);
>> +    }
>> +
>> +    for (i = DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
>> +         DRM_SCHED_POLICY_SINGLE_ENTITY && i >= DRM_SCHED_PRIORITY_MIN;
>> +         i--) {
>>           struct drm_sched_rq *rq = &sched->sched_rq[i];
>>           spin_lock(&rq->lock);
>> @@ -1176,6 +1223,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
>>       struct drm_sched_entity *entity;
>>       struct drm_gpu_scheduler *sched = bad->sched;
>> +    WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
>> +
>>       /* don't change @bad's karma if it's from KERNEL RQ,
>>        * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
>>        * corrupt but keep in mind that kernel jobs always considered good.
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 897d52a4ff4f..04eec2d7635f 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -79,6 +79,7 @@ enum drm_sched_policy {
>>       DRM_SCHED_POLICY_DEFAULT,
>>       DRM_SCHED_POLICY_RR,
>>       DRM_SCHED_POLICY_FIFO,
>> +    DRM_SCHED_POLICY_SINGLE_ENTITY,
>>       DRM_SCHED_POLICY_COUNT,
>>   };
>> @@ -112,6 +113,9 @@ struct drm_sched_entity {
>>        */
>>       struct drm_sched_rq        *rq;
>> +    /** @single_sched: Single scheduler */
>> +    struct drm_gpu_scheduler    *single_sched;
>> +
>>       /**
>>        * @sched_list:
>>        *
>> @@ -473,6 +477,7 @@ struct drm_sched_backend_ops {
>>    * struct drm_gpu_scheduler - scheduler instance-specific data
>>    *
>>    * @ops: backend operations provided by the driver.
>> + * @single_entity: Single entity for the scheduler
>>    * @hw_submission_limit: the max size of the hardware queue.
>>    * @timeout: the time after which a job is removed from the scheduler.
>>    * @name: name of the ring for which this scheduler is being used.
>> @@ -503,6 +508,7 @@ struct drm_sched_backend_ops {
>>    */
>>   struct drm_gpu_scheduler {
>>       const struct drm_sched_backend_ops    *ops;
>> +    struct drm_sched_entity        *single_entity;
>>       uint32_t            hw_submission_limit;
>>       long                timeout;
>>       const char            *name;
>> @@ -585,6 +591,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>                 struct drm_gpu_scheduler **sched_list,
>>                 unsigned int num_sched_list,
>>                 atomic_t *guilty);
>> +struct drm_gpu_scheduler *
>> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
>>   long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
>>   void drm_sched_entity_fini(struct drm_sched_entity *entity);
>>   void drm_sched_entity_destroy(struct drm_sched_entity *entity);

