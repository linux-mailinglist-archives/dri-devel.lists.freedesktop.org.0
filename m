Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F8AF96D6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 17:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1EE10E29E;
	Fri,  4 Jul 2025 15:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="J5/u8ord";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE27A10E29D;
 Fri,  4 Jul 2025 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DsbtcEFmDjjoRUf1jUgg1jpELo4Oc0/Q1cJNz5p/j9I=; b=J5/u8ord0ZdSydTynWh5sdzzlY
 qNVr0t/aZcz6mw2Ni9ChyygnRKB/yMcdQsqn7Ibhr1dUDAih6RCI/iC4Kz6tuwl7nt3wAakiF68sA
 KxPwOJAxhz4yEHg79/M3DixlMDKWs39FoSPKp/ut1Lg/Ba9U1JSITz3xLBWnGGE4FXW4uclreksGQ
 P/apYktkjJbjDbcg9kJ3N1nJXw9nwhjQYw8eabCJMjaV/EbgI8+Iy84NTDd9t12knh9EV2h69D7Jw
 KXTnktbNexqlGbvO7XxPyZ5eIE51jrBnxlOEODxPmnQuKGlkVWnavzK6w6K8BtRSBqg8RX+KvcfM7
 fDzVmc+Q==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uXiPA-00CU7T-Me; Fri, 04 Jul 2025 17:32:48 +0200
Message-ID: <4630c69d-f762-4c2e-aa43-a55cb90c8074@igalia.com>
Date: Fri, 4 Jul 2025 16:32:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/16] drm/sched: Consolidate entity run queue
 management
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
 <20250623122746.46478-9-tvrtko.ursulin@igalia.com>
 <c1466501-db4f-4d88-9669-512e53ed4c8c@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c1466501-db4f-4d88-9669-512e53ed4c8c@igalia.com>
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


On 04/07/2025 14:51, Maíra Canal wrote:
> Hi Tvrtko,
> 
> On 23/06/25 09:27, Tvrtko Ursulin wrote:
>> Move the code dealing with entities entering and exiting run queues to
>> helpers to logically separate it from jobs entering and exiting entities.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c   | 60 ++-------------
>>   drivers/gpu/drm/scheduler/sched_internal.h |  8 +-
>>   drivers/gpu/drm/scheduler/sched_main.c     | 87 +++++++++++++++++++---
>>   3 files changed, 83 insertions(+), 72 deletions(-)
>>
> 
> [...]
> 
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/ 
>> scheduler/sched_main.c
>> index 2c85be201605..bfec2e35a2f6 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -145,15 +145,18 @@ static __always_inline bool 
>> drm_sched_entity_compare_before(struct rb_node *a,
>>   static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity 
>> *entity,
>>                           struct drm_sched_rq *rq)
>>   {
>> +    lockdep_assert_held(&entity->lock);
>> +    lockdep_assert_held(&rq->lock);
>> +
> 
> Nit: I'm not sure if this change belongs to this patch. I felt a bit out
> of context to me. Also, the same assert exists in
> `drm_sched_rq_update_fifo_locked()` (maybe remove there?).

You are right - another bad rebase after moving patches around in the 
series. Fixed locally.

> 
>>       if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>           rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
>>           RB_CLEAR_NODE(&entity->rb_tree_node);
>>       }
>>   }
>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
>> -                     struct drm_sched_rq *rq,
>> -                     ktime_t ts)
>> +static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity 
>> *entity,
>> +                        struct drm_sched_rq *rq,
>> +                        ktime_t ts)
>>   {
>>       /*
>>        * Both locks need to be grabbed, one to protect from entity->rq 
>> change
>> @@ -188,25 +191,58 @@ static void drm_sched_rq_init(struct 
>> drm_gpu_scheduler *sched,
>>       rq->sched = sched;
>>   }
> 
> [...]
> 
> 
> Missing kerneldoc.

You got me there for a while, I always look up from the review comment. 
:) Fixed locally, thanks!

Regards,

Tvrtko

> 
>> +void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
>> +{
>> +    struct drm_sched_job *next_job;
>> +    struct drm_sched_rq *rq;
>> +    ktime_t ts;
>> +
>> +    /*
>> +     * Update the entity's location in the min heap according to
>> +     * the timestamp of the next job, if any.
>> +     */
>> +    next_job = drm_sched_entity_queue_peek(entity);
>> +    if (!next_job)
>> +        return;
>> +
>> +    if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> +        ts = next_job->submit_ts;
>> +    else
>> +        ts = drm_sched_rq_get_rr_deadline(rq);
> 
> Same as previous patch :)
> 
> Best Regards,
> - Maíra
> 
>> +
>> +    spin_lock(&entity->lock);
>> +    rq = entity->rq;
>> +    spin_lock(&rq->lock);
>> +    drm_sched_rq_update_fifo_locked(entity, rq, ts);
>> +    spin_unlock(&rq->lock);
>> +    spin_unlock(&entity->lock);
>> +}
>> +
>>   /**
>>    * drm_sched_rq_select_entity - Select an entity which provides a 
>> job to run
>>    *
> 

