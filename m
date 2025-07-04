Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB8EAF9459
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 15:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D27210EA43;
	Fri,  4 Jul 2025 13:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="m+R/Cpu9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0A10EA43;
 Fri,  4 Jul 2025 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gJyhDSizSIyaCCsBZLdcYlbuPlk47VnFDZmOS+oQdpI=; b=m+R/Cpu9+WKM9h2+sjrjhB12Rn
 2xcbG8+DU5TNIcWQ1g8vc8LmOwaBWxJsaz4QXaqOVUYXlEqEprDK9NVwi2mQL0I6dgwLthMbXilS0
 Pi7uXP6VPPlWozaR9wRD53YZVioN2FeOUgbV/Up4tFij3vMAmNp3F9/10/t41Al1O86MFBugjJVQ4
 eby1Lu675TsyXLKNlydNv7DF0A0+E5D97teTteNl510hH25F+8b/A5GNqubXlWAnV2mXZH63C9PIi
 beydpK1ZHehnEutQm+zK3wqDYAZQngLBKm0ZC3ZLP2eGzSArNwIvuHroRggvh5KosJuekgn96T1G3
 gI/fwi0g==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXgbx-00CRl7-3G; Fri, 04 Jul 2025 15:37:53 +0200
Message-ID: <92436d9f-d5cc-4757-bab4-f84ede21b2f8@igalia.com>
Date: Fri, 4 Jul 2025 14:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/16] drm/sched: Implement RR via FIFO
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
 <20250623122746.46478-8-tvrtko.ursulin@igalia.com>
 <461b6a34-4a1f-4f2a-abd8-f741523442f4@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <461b6a34-4a1f-4f2a-abd8-f741523442f4@igalia.com>
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


On 04/07/2025 14:18, Maíra Canal wrote:
> Hi Tvrtko,
> 
> On 23/06/25 09:27, Tvrtko Ursulin wrote:
>> Round-robin being the non-default policy and unclear how much it is used,
>> we can notice that it can be implemented using the FIFO data 
>> structures if
>> we only invent a fake submit timestamp which is monotonically increasing
>> inside drm_sched_rq instances.
>>
>> So instead of remembering which was the last entity the scheduler worker
>> picked, we can bump the picked one to the bottom of the tree, achieving
>> the same round-robin behaviour.
>>
>> Advantage is that we can consolidate to a single code path and remove a
>> bunch of code. Downside is round-robin mode now needs to lock on the job
>> pop path but that should not be visible.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 45 ++++++++------
>>   drivers/gpu/drm/scheduler/sched_main.c   | 76 ++----------------------
>>   include/drm/gpu_scheduler.h              |  5 +-
>>   3 files changed, 36 insertions(+), 90 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/ 
>> drm/scheduler/sched_entity.c
>> index 0bdf52e27461..e69176765697 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -470,9 +470,19 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>>       return NULL;
>>   }
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
>>   struct drm_sched_job *drm_sched_entity_pop_job(struct 
>> drm_sched_entity *entity)
>>   {
>> -    struct drm_sched_job *sched_job;
>> +    struct drm_sched_job *sched_job, *next_job;
>>       sched_job = drm_sched_entity_queue_peek(entity);
>>       if (!sched_job)
>> @@ -507,21 +517,22 @@ struct drm_sched_job 
>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>        * Update the entity's location in the min heap according to
>>        * the timestamp of the next job, if any.
>>        */
>> -    if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
>> -        struct drm_sched_job *next;
>> +    next_job = drm_sched_entity_queue_peek(entity);
>> +    if (next_job) {
>> +        struct drm_sched_rq *rq;
>> +        ktime_t ts;
>> -        next = drm_sched_entity_queue_peek(entity);
>> -        if (next) {
>> -            struct drm_sched_rq *rq;
>> +        if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +            ts = next_job->submit_ts;
>> +        else
>> +            ts = drm_sched_rq_get_rr_deadline(rq);
> 
> I know that this chunk is going to be deleted in the next patches.
> However, to keep things bisectable, I believe you need to set `rq =
> entity->rq;` before calling `drm_sched_rq_get_rr_deadline(rq)`.
> Otherwise, rq is undefined.
> 
> Moreover, IIUC you need to hold rq->lock to call
> `drm_sched_rq_get_rr_deadline()`.

Well spotted! Must have been a rebase mistake. I've fixed it locally.

> 
>> -            spin_lock(&entity->lock);
>> -            rq = entity->rq;
>> -            spin_lock(&rq->lock);
>> -            drm_sched_rq_update_fifo_locked(entity, rq,
>> -                            next->submit_ts);
>> -            spin_unlock(&rq->lock);
>> -            spin_unlock(&entity->lock);
>> -        }
>> +        spin_lock(&entity->lock);
>> +        rq = entity->rq;
>> +        spin_lock(&rq->lock);
>> +        drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +        spin_unlock(&rq->lock);
>> +        spin_unlock(&entity->lock);
>>       }
>>       /* Jobs and entities might have different lifecycles. Since we're
> 
> [...]
> 
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index e62a7214e052..9f8b3b78d24d 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -239,8 +239,7 @@ struct drm_sched_entity {
>>    * struct drm_sched_rq - queue of entities to be scheduled.
>>    *
>>    * @sched: the scheduler to which this rq belongs to.
>> - * @lock: protects @entities, @rb_tree_root and @current_entity.
>> - * @current_entity: the entity which is to be scheduled.
>> + * @lock: protects @entities, @rb_tree_root and @rr_deadline.
> 
> Could you add an entry for @rr_deadline?

Ditto.

Regards,

Tvrtko

>>    * @entities: list of the entities to be scheduled.
>>    * @rb_tree_root: root of time based priority queue of entities for 
>> FIFO scheduling
>>    *
>> @@ -253,7 +252,7 @@ struct drm_sched_rq {
>>       spinlock_t            lock;
>>       /* Following members are protected by the @lock: */
>> -    struct drm_sched_entity        *current_entity;
>> +    ktime_t                rr_deadline;
>>       struct list_head        entities;
>>       struct rb_root_cached        rb_tree_root;
>>   };
> 

