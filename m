Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B49AFAD60
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 09:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D689210E0CC;
	Mon,  7 Jul 2025 07:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aWaRFSVU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8535510E0CC;
 Mon,  7 Jul 2025 07:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c6CLwTIMWcYWBn9i+wFI1ayP6RsZGwi1/983/GpksWc=; b=aWaRFSVUqnt0F8HkEKNAiHZbbB
 DXPDf7/KQQCB5atKGXYV1Vq7WX6QLvrfExSB/ZgRjhNsB2Z0nh9T3HKCrJv6oolQxIdIa7b74tWpE
 WsppBsljY0WAsLI0fOKmrjkb70uZJexFtXeIEA10rCFePZVEwxlocUhLN6UWKiZhJCMd2KVJeqV6H
 ihwoRjqd2xkUy/Kbc+mmAvJBCZwl7MoMhCKD7uylpBPOAujSuBNmk6+AJsGe0BnMpzNfi2VUmcLlD
 /MX8Ld9fht7MUxQRKJTUQ4zRcPERr4kYnmNdeYjkoo7enAEXugROCTChXi7kzkNcE4vbA68wtLMDn
 6YksBKFw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uYgUB-00DPrZ-RG; Mon, 07 Jul 2025 09:41:59 +0200
Message-ID: <9d5ef179-7ae6-49e9-9e58-b3be4f1eed97@igalia.com>
Date: Mon, 7 Jul 2025 08:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] drm/sched: Account entity GPU time
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
 <20250623122746.46478-12-tvrtko.ursulin@igalia.com>
 <8ae350fa-6257-46f1-86b9-b129c708485c@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <8ae350fa-6257-46f1-86b9-b129c708485c@igalia.com>
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


On 04/07/2025 15:18, Maíra Canal wrote:
> Hi Tvrtko,
> 
> In general, LGTM, but I miss documentation for all the new structures
> and functions that you implemented.

Okay, I added some kerneldoc locally.

Regards,

Tvrtko

> On 23/06/25 09:27, Tvrtko Ursulin wrote:
>> To implement fair scheduling we need a view into the GPU time consumed by
>> entities. Problem we have is that jobs and entities objects have 
>> decoupled
>> lifetimes, where at the point we have a view into accurate GPU time, we
>> cannot link back to the entity any longer.
>>
>> Solve this by adding a light weight entity stats object which is 
>> reference
>> counted by both entity and the job and hence can safely be used from
>> either side.
>>
>> With that, the only other thing we need is to add a helper for adding the
>> job's GPU time into the respective entity stats object, and call it once
>> the accurate GPU time has been calculated.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c   | 29 ++++++++++++++++
>>   drivers/gpu/drm/scheduler/sched_internal.h | 40 ++++++++++++++++++++++
>>   drivers/gpu/drm/scheduler/sched_main.c     |  6 +++-
>>   include/drm/gpu_scheduler.h                |  5 +++
>>   4 files changed, 79 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/ 
>> drm/scheduler/sched_entity.c
>> index e42526aa22dc..466914506c36 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -32,6 +32,29 @@
>>   #include "gpu_scheduler_trace.h"
>> +
>> +void drm_sched_entity_stats_release(struct kref *kref)
>> +{
>> +    struct drm_sched_entity_stats *stats =
>> +        container_of(kref, typeof(*stats), kref);
>> +
>> +    kfree(stats);
>> +}
>> +
>> +static struct drm_sched_entity_stats *drm_sched_entity_stats_alloc(void)
>> +{
>> +    struct drm_sched_entity_stats *stats;
>> +
>> +    stats = kzalloc(sizeof(*stats), GFP_KERNEL);
>> +    if (!stats)
>> +        return NULL;
>> +
>> +    kref_init(&stats->kref);
>> +    spin_lock_init(&stats->lock);
>> +
>> +    return stats;
>> +}
>> +
>>   /**
>>    * drm_sched_entity_init - Init a context entity used by scheduler when
>>    * submit to HW ring.
>> @@ -65,6 +88,11 @@ int drm_sched_entity_init(struct drm_sched_entity 
>> *entity,
>>           return -EINVAL;
>>       memset(entity, 0, sizeof(struct drm_sched_entity));
>> +
>> +    entity->stats = drm_sched_entity_stats_alloc();
>> +    if (!entity->stats)
>> +        return -ENOMEM;
>> +
>>       INIT_LIST_HEAD(&entity->list);
>>       entity->rq = NULL;
>>       entity->guilty = guilty;
>> @@ -340,6 +368,7 @@ void drm_sched_entity_fini(struct drm_sched_entity 
>> *entity)
>>       dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
>>       RCU_INIT_POINTER(entity->last_scheduled, NULL);
>> +    drm_sched_entity_stats_put(entity->stats);
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_fini);
>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/ 
>> drm/scheduler/sched_internal.h
>> index 703ee48fbc58..000c4a5b2c86 100644
>> --- a/drivers/gpu/drm/scheduler/sched_internal.h
>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>> @@ -3,6 +3,15 @@
>>   #ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
>>   #define _DRM_GPU_SCHEDULER_INTERNAL_H_
>> +#include <linux/ktime.h>
>> +#include <linux/kref.h>
>> +#include <linux/spinlock.h>
>> +
>> +struct drm_sched_entity_stats {
>> +    struct kref    kref;
>> +    spinlock_t    lock;
>> +    ktime_t        runtime;
>> +};
>>   /* Used to choose between FIFO and RR job-scheduling */
>>   extern int drm_sched_policy;
>> @@ -93,4 +102,35 @@ drm_sched_entity_is_ready(struct drm_sched_entity 
>> *entity)
>>       return true;
>>   }
>> +void drm_sched_entity_stats_release(struct kref *kref);
>> +
>> +static inline struct drm_sched_entity_stats *
>> +drm_sched_entity_stats_get(struct drm_sched_entity_stats *stats)
>> +{
>> +    kref_get(&stats->kref);
>> +
>> +    return stats;
>> +}
>> +
>> +static inline void
>> +drm_sched_entity_stats_put(struct drm_sched_entity_stats *stats)
>> +{
>> +    kref_put(&stats->kref, drm_sched_entity_stats_release);
>> +}
>> +
>> +static inline void
>> +drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
>> +{
>> +    struct drm_sched_entity_stats *stats = job->entity_stats;
>> +    struct drm_sched_fence *s_fence = job->s_fence;
>> +    ktime_t start, end;
>> +
>> +    start = dma_fence_timestamp(&s_fence->scheduled);
>> +    end = dma_fence_timestamp(&s_fence->finished);
>> +
>> +    spin_lock(&stats->lock);
>> +    stats->runtime = ktime_add(stats->runtime, ktime_sub(end, start));
>> +    spin_unlock(&stats->lock);
>> +}
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/ 
>> scheduler/sched_main.c
>> index f87bb4681b93..22cc0dd536db 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -620,6 +620,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>>       job->sched = sched;
>>       job->s_priority = entity->priority;
>> +    job->entity_stats = drm_sched_entity_stats_get(entity->stats);
>>       drm_sched_fence_init(job->s_fence, job->entity);
>>   }
>> @@ -810,6 +811,7 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
>>            * been called.
>>            */
>>           dma_fence_put(&job->s_fence->finished);
>> +        drm_sched_entity_stats_put(job->entity_stats);
>>       } else {
>>           /* The job was aborted before it has been committed to be run;
>>            * notably, drm_sched_job_arm() has not been called.
>> @@ -958,8 +960,10 @@ static void drm_sched_free_job_work(struct 
>> work_struct *w)
>>           container_of(w, struct drm_gpu_scheduler, work_free_job);
>>       struct drm_sched_job *job;
>> -    while ((job = drm_sched_get_finished_job(sched)))
>> +    while ((job = drm_sched_get_finished_job(sched))) {
>> +        drm_sched_entity_stats_job_add_gpu_time(job);
>>           sched->ops->free_job(job);
>> +    }
>>       drm_sched_run_job_queue(sched);
>>   }
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 9f8b3b78d24d..cbbcd1c05154 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -71,6 +71,8 @@ enum drm_sched_priority {
>>       DRM_SCHED_PRIORITY_COUNT
>>   };
>> +struct drm_sched_entity_stats;
>> +
>>   /**
>>    * struct drm_sched_entity - A wrapper around a job queue (typically
>>    * attached to the DRM file_priv).
>> @@ -109,6 +111,8 @@ struct drm_sched_entity {
>>        */
>>       struct drm_sched_rq        *rq;
>> +    struct drm_sched_entity_stats    *stats;
>> +
>>       /**
>>        * @sched_list:
>>        *
>> @@ -355,6 +359,7 @@ struct drm_sched_job {
>>       struct drm_sched_fence        *s_fence;
>>       struct drm_sched_entity         *entity;
>> +    struct drm_sched_entity_stats    *entity_stats;
>>       enum drm_sched_priority        s_priority;
>>       u32                credits;
> 

