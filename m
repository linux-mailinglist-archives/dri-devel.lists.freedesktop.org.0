Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C97F99C9B0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 14:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41E510E449;
	Mon, 14 Oct 2024 12:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Bu2lFCD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94A810E449
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U1WgkET0nba9L4PDZk0GwA7PkGRTt8+k2dnwoSZXcOI=; b=Bu2lFCD7v13KWkN45nAs7p0oQI
 sRlg4Ja6ZmUlSJA6lpW4FMIBYW7Tgkteuy1+gDWSbMAYb6MaDsE8/iiIRXLs/Q8thzXbsY+ywaKnb
 yf2mukVgIkyROlLUTXhkCVJd09vEKihxNsVPmdqKLqkDoes80MqKRDdvsgCq39v+HYjT9YHPYVO9w
 MXddVuT+VqI1D1m54+DlINFvmyyq2u64rCwhn0g5ymuh9S82enD3qHQdA3YGO7C+zKNrEKsPMQ7Kk
 kV9j4PeRkY4IzOwA5av2pqCj9a07OkMnOgft2r6eP1v/RrCKY5ci5GAzXbgIpr422UnBftpHYKNYP
 d3FKYrqg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t0Jr5-009KkV-Ax; Mon, 14 Oct 2024 14:07:19 +0200
Message-ID: <8c038f91-716c-4a3d-8c70-10859d28d77f@igalia.com>
Date: Mon, 14 Oct 2024 13:07:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/sched: Optimise drm_sched_entity_push_job
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
 <20241014104637.83209-2-tursulin@igalia.com>
 <0df6b855b0974a88a3f6af42108e2596bd285898.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <0df6b855b0974a88a3f6af42108e2596bd285898.camel@redhat.com>
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


On 14/10/2024 12:32, Philipp Stanner wrote:
> Hi,
> 
> On Mon, 2024-10-14 at 11:46 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> In FIFO mode We can avoid dropping the lock only to immediately re-
>> acquire
>> by adding a new drm_sched_rq_update_fifo_locked() helper.
>>
> 
> Please write detailed commit messages, as described here [1].
>     1. Describe the problem: current state and why it's bad.
>     2. Then, describe in imperative (present tense) form what the commit
>        does about the problem.

Both pieces of info are already there:

1. Drops the lock to immediately re-acquire it.
2. We avoid that by by adding a locked helper.
> Optionally, in between can be information about why it's solved this
> way and not another etc.
> 
> Applies to the other patches, too.
> 
> 
> [1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Thanks I am new here and did not know this.

Seriosuly, lets not be too blindly strict about this because it can get 
IMO ridiculous.

One example when I previously accomodated your request is patch 3/5 from 
this series:

"""
Current kerneldoc for struct drm_sched_rq incompletely documents what
fields are protected by the lock.

This is not good because it is misleading.

Lets fix it by listing all the elements which are protected by the lock.
"""

While this was the original commit text you weren't happy with:

"""
drm/sched: Re-order struct drm_sched_rq members for clarity

Lets re-order the members to make it clear which are protected by the
lock
and at the same time document it via kerneldoc.
"""

I maintain the original text was passable.

On top, this was just a respin to accomodate the merge process. All 
approvals were done and dusted couple weeks or so ago so asking for yet 
another respin for such trivial objections is not great.

Regards,

Tvrtko

>> v2:
>>   * Remove drm_sched_rq_update_fifo() altogether. (Christian)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++++----
>>   drivers/gpu/drm/scheduler/sched_main.c   |  6 +++---
>>   include/drm/gpu_scheduler.h              |  2 +-
>>   3 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>> b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 2951fcc2e6b1..b72cba292839 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -514,8 +514,12 @@ struct drm_sched_job
>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>    struct drm_sched_job *next;
>>   
>>    next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>> - if (next)
>> - drm_sched_rq_update_fifo(entity, next->submit_ts);
>> + if (next) {
>> + spin_lock(&entity->rq_lock);
>> + drm_sched_rq_update_fifo_locked(entity,
>> + next->submit_ts);
>> + spin_unlock(&entity->rq_lock);
>> + }
>>    }
>>   
>>    /* Jobs and entities might have different lifecycles. Since we're
>> @@ -613,10 +617,11 @@ void drm_sched_entity_push_job(struct
>> drm_sched_job *sched_job)
>>    sched = rq->sched;
>>   
>>    drm_sched_rq_add_entity(rq, entity);
>> - spin_unlock(&entity->rq_lock);
>>   
>>    if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>> - drm_sched_rq_update_fifo(entity, submit_ts);
>> + drm_sched_rq_update_fifo_locked(entity, submit_ts);
>> +
>> + spin_unlock(&entity->rq_lock);
>>   
>>    drm_sched_wakeup(sched);
>>    }
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index e32b0f7d7e94..bbd1630407e4 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -169,14 +169,15 @@ static inline void
>> drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
>>    }
>>   }
>>   
>> -void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
>> ktime_t ts)
>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>> *entity, ktime_t ts)
> 
> Since you touch function name / signature already, would you mind
> writing a small doc string that also mentions the locking requirements
> or lack of the same?
> 
>>   {
>>    /*
>>    * Both locks need to be grabbed, one to protect from entity->rq
>> change
>>    * for entity from within concurrent drm_sched_entity_select_rq and
>> the
>>    * other to update the rb tree structure.
>>    */
> 
> It seems to me that the comment above is now out of date, no?
> 
> 
> Thx for your efforts,
> P.
> 
>> - spin_lock(&entity->rq_lock);
>> + lockdep_assert_held(&entity->rq_lock);
>> +
>>    spin_lock(&entity->rq->lock);
>>   
>>    drm_sched_rq_remove_fifo_locked(entity);
>> @@ -187,7 +188,6 @@ void drm_sched_rq_update_fifo(struct
>> drm_sched_entity *entity, ktime_t ts)
>>          drm_sched_entity_compare_before);
>>   
>>    spin_unlock(&entity->rq->lock);
>> - spin_unlock(&entity->rq_lock);
>>   }
>>   
>>   /**
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index e9f075f51db3..3658a6cb048e 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -593,7 +593,7 @@ void drm_sched_rq_add_entity(struct drm_sched_rq
>> *rq,
>>   void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>    struct drm_sched_entity *entity);
>>   
>> -void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
>> ktime_t ts);
>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>> *entity, ktime_t ts);
>>   
>>   int drm_sched_entity_init(struct drm_sched_entity *entity,
>>      enum drm_sched_priority priority,
> 
