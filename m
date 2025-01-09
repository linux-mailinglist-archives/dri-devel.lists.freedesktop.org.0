Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02027A07CCB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 17:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5D110EEC1;
	Thu,  9 Jan 2025 16:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eDvqLHmx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2296610EEC1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 16:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GGCLQmSKx7Bw4phSZMcqNzehhxYUWFOo+FNhvundpFY=; b=eDvqLHmxn439HRKE8r0018T5RI
 NEgaqbMcuduHtUtHAB+qIlOLcots7ZHW7M/MKn2+kS6githKF9evmOafmHpB7Pwthbl09siWlNgfQ
 a71KK/Alz8XlZ0nbB2W1Bk9RYVRCf2P3pBOYQPY/KLPr/1pRBlEKHqJi4xCx3qF/bQcuWnE2aGu+p
 4QZ7eXxypyo9FYmL/dTk+zTq/VajWpbH6bto0rnAcsjKb1zTgFHjTzB63tz2V27jO/p5Buyl4PRMG
 Brzv6Ns4Jo4UsqinT5Fz2YqNb6MqiKRB1lrBLHZ1el5SBvfhpeatO9km97KAGziAlp2BPYO44s2kA
 y/5hLz0w==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVv0K-00DcgZ-9b; Thu, 09 Jan 2025 17:03:28 +0100
Message-ID: <ce62e2a0-6ed2-4960-97b7-8b51cf2ff8a7@igalia.com>
Date: Thu, 9 Jan 2025 16:03:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 16/18] drm/sched: Connect with dma-fence deadlines
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Rob Clark <robdclark@gmail.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-17-tvrtko.ursulin@igalia.com>
 <562bc7ae-ba04-4dc9-a524-3bbf3e8afd50@amd.com>
 <8afc7179-7ea4-4350-8382-618c90658c94@igalia.com>
 <5a8c5f2c-b4fe-4061-a465-ba37ec9a568a@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <5a8c5f2c-b4fe-4061-a465-ba37ec9a568a@amd.com>
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


On 09/01/2025 13:51, Christian König wrote:
> Am 09.01.25 um 14:41 schrieb Tvrtko Ursulin:
>>
>> On 09/01/2025 13:07, Christian König wrote:
>>> Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
>>>> Now that the scheduling policy is deadline based it feels completely
>>>> natural to allow propagating externaly set deadlines to the scheduler.
>>>>
>>>> Scheduler deadlines are not a guarantee but as the dma-fence 
>>>> facility is
>>>> already in use by userspace lets wire it up.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>>> Cc: Rob Clark <robdclark@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/scheduler/sched_entity.c | 24 
>>>> ++++++++++++++++++++++--
>>>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 98c78d1373d8..db5d34310b18 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -410,7 +410,16 @@ ktime_t
>>>>   drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
>>>>                     struct drm_sched_job *job)
>>>>   {
>>>> -    return __drm_sched_entity_get_job_deadline(entity, 
>>>> job->submit_ts);
>>>> +    struct drm_sched_fence *s_fence = job->s_fence;
>>>> +    struct dma_fence *fence = &s_fence->finished;
>>>> +    ktime_t deadline;
>>>> +
>>>> +    deadline = __drm_sched_entity_get_job_deadline(entity, 
>>>> job->submit_ts);
>>>> +    if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, 
>>>> &fence->flags) &&
>>>> +        ktime_before(s_fence->deadline, deadline))
>>>> +        deadline = s_fence->deadline;
>>>> +
>>>> +    return deadline;
>>>>   }
>>>>   /*
>>>> @@ -579,9 +588,12 @@ void drm_sched_entity_select_rq(struct 
>>>> drm_sched_entity *entity)
>>>>    */
>>>>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>>   {
>>>> +    struct drm_sched_fence *s_fence = sched_job->s_fence;
>>>>       struct drm_sched_entity *entity = sched_job->entity;
>>>> -    bool first;
>>>> +    struct dma_fence *fence = &s_fence->finished;
>>>> +    ktime_t fence_deadline;
>>>>       ktime_t submit_ts;
>>>> +    bool first;
>>>>       trace_drm_sched_job(sched_job, entity);
>>>>       atomic_inc(entity->rq->sched->score);
>>>> @@ -593,6 +605,11 @@ void drm_sched_entity_push_job(struct 
>>>> drm_sched_job *sched_job)
>>>>        * Make sure to set the submit_ts first, to avoid a race.
>>>>        */
>>>>       sched_job->submit_ts = submit_ts = ktime_get();
>>>> +    if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, 
>>>> &fence->flags))
>>>> +        fence_deadline = s_fence->deadline;
>>>> +    else
>>>> +        fence_deadline = KTIME_MAX;
>>>> +
>>>
>>> That makes no sense. When the job is pushed the fence is not made 
>>> public yet.
>>>
>>> So no deadline can be set on the fence.
>>
>> You are correct, the push side of things was a mistake a laziness that 
>> I did not remove it from the RFC.
>>
>>>>       first = spsc_queue_push(&entity->job_queue, 
>>>> &sched_job->queue_node);
>>>>       /* first job wakes up scheduler */
>>>> @@ -601,6 +618,9 @@ void drm_sched_entity_push_job(struct 
>>>> drm_sched_job *sched_job)
>>>>           submit_ts = __drm_sched_entity_get_job_deadline(entity,
>>>>                                   submit_ts);
>>>> +        if (ktime_before(fence_deadline, submit_ts))
>>>> +            submit_ts = fence_deadline;
>>>> +
>>>
>>> Yeah, that won't work at all as far as I can see.
>>
>> It works from the pop side though.
> 
> Yeah, but only partially.
> 
>>
>> When job N is scheduled, deadline is taken from N+1 and tree 
>> re-balanced. At the point of N scheduling N+1 can definitely have a 
>> real deadline set.
> 
> The fundamental design problem with the fence deadline approach is that 
> it sets the deadline only on the last submission instead of the first one.
> 
> E.g. unigine heaven for example uses 3 submissions on a typical system.
> 
> We would somehow need to propagate a deadline to previous submissions 
> for this to work halve way correctly.

I played with this in one of my branches but was lacking a good test 
case. In any case clean solution(s) would not be easy with the current 
scheduler design.

Regards,

Tvrtko

>> What does not work is for queue depth of one. No way at the moment to 
>> "bump" the entity in the tree while N is waiting for submission 
>> because we cannot dereference the entity from the job. (I had that in 
>> v1 of the series and realized it was unsafe.)
>>
>> I (very) briefly though about reference counting entities but quickly 
>> had a feeling it would be annoying. So for now this patch only offers 
>> a partial solution.
> 
> Nah, please not.
> 
> Regards,
> Christian.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>           sched = drm_sched_rq_add_entity(entity->rq, entity, 
>>>> submit_ts);
>>>>           if (sched)
>>>>               drm_sched_wakeup(sched);
>>>
> 
