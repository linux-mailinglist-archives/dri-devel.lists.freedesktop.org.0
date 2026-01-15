Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084CD24BBD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD10D10E75B;
	Thu, 15 Jan 2026 13:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bt0j8ihV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452D910E756;
 Thu, 15 Jan 2026 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XW9UwIj1wQxYIlCCrtFIytQU2Vq2fAUXTyqXoUmih2c=; b=bt0j8ihVfM7rx3j/02XixNyaNU
 etR1JTxGHgECAV3EAbvwRKcDxwKBQsS18b13OKUXR9UIoJybNWOEsL9mx0OcG2DABe5lS0ycGotdo
 Iz/yMbgyACk38mA+0m9Sx+0i7bhLq676Rtdz1TQ3BoiQQkLtswSjsR4ydUrScp3tc4r11krY1eX4X
 /jQIcnFluCNaX8MoHw+Vo07Zm8wX6ZE4wOEIF90E2OjIhIznVLIG/M8LVEsDTJQFQtaG0WFerB03Q
 8/Alo/9m25I6+ikQwxLj41KUDf6Gwn3VYyvfHQVztC1IA69PwPsSO9443Zs642ADvdahJnWoQNfG/
 5vwd2jEA==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vgNR3-005kW3-SS; Thu, 15 Jan 2026 14:30:49 +0100
Message-ID: <bc2b10f6-1bcd-4bac-a6a8-5f3db51b9bc2@igalia.com>
Date: Thu, 15 Jan 2026 13:30:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Simplify idle entity check
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
References: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
 <1e7ae073820d0cbb7f6f615b40e0cf4c6133a062.camel@mailbox.org>
 <607847da-4f8a-4c19-9ebe-c07f79ce1362@igalia.com>
 <4d6ed6a7-89d6-4fa5-b754-2ecdbd42344c@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <4d6ed6a7-89d6-4fa5-b754-2ecdbd42344c@amd.com>
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


On 09/01/2026 14:31, Christian König wrote:
> On 1/9/26 15:06, Tvrtko Ursulin wrote:
>> \
>> On 07/01/2026 14:11, Philipp Stanner wrote:
>>> Happy 2026, Tvrtko!
>>>
>>>
>>> On Wed, 2026-01-07 at 13:44 +0000, Tvrtko Ursulin wrote:
>>>> drm_sched_entity_is_idle() is called when flushing the entity before
>>>> destroying it and currently decides on the idle status based either on
>>>> number of jobs in its queue being zero, or whether the entity is not part
>>>> of any run-queue.
>>>>
>>>> If entity is not part of a run-queue it is implied it can have no jobs in
>>>> its queue, from which it follows it is redundant to look at the both and
>>>> we can simplify to only look at the queue.
>>>>
>>>> The list_empty() check was added in
>>>> a875f58e237a ("drm/scheduler: stop setting rq to NULL")
>>>> where it replaced the entity->rq check which was added in
>>>> 741f01e636b7 ("drm/scheduler: Avoid using wait_event_killable for dying process (V4)").
>>>>
>>>> Since for the submit race involving exiting entities, explicit handling
>>>> via entity->stopped was added soon after in
>>>> 62347a33001c ("drm/scheduler: Add stopped flag to drm_sched_entity")
>>>> it indeed looks we are safe to remove the list_empty() check.
>>>>
>>>> This mean we can remove the memory barrier as well and fewer memory
>>>> barriers the better.
>>>
>>> I am not convinced that this change is worth it.
>>>
>>> Not to long ago we discussed that the spsc_queue should be removed and
>>> replaced by some sort of list, with proper locks. Christian has agreed
>>> that this should fly.
>>>
>>> The spsc queue has only 1 user in the kernel and it's super hard to
>>> understand how it's supposed to work and when any why barriers and
>>> READ_ONCE's are necessary (that's, of course, also not documented in
>>> the queue).
>>>
>>> Until that is done I don't really want to touch any of those memory
>>> barriers..
>>
>> (I had a branch with spsc gone more than a year ago but I abandoned it for now since it contained some other too ambitious changes. So no complaints from me. Who is doing it BTW?)
>>
>> Back to the point - this patch can wait, no problem. To explain the context though.
>>
>> I wanted to get rid of looking at the list_empty here because I have a branch which improves the flow for the 1:1 sched:entity drivers.
>>
>> Why are the two related? If you remember in the fair scheduler series all the run-queue stuff is nicely grouped in sched_rq.c and encapsulated in the rq API, which made it possible to follow up with virtualizing the rq operations.
>>
>> The yet another relevant thing is the patch I sent this week which removes the special case where entity can be initialized with no schedulers.
> 
> If my memory not completely fails me the patch to reject initializing entities with no scheduler is actually a pre requisite of this patch here.

I look at it like this - "Can drm_sched_entity_is_idle() ever return 
true today if entity is unlinked but other conditions are not true?"

I think it cannot. Because if entity is unlinked then spsc queue count 
must be zero. Therefore list_empty is redundant. In fact...

> The list_empty() is most likely only there because we had entities initialized without a scheduler.

... this is where I noted the archaeological digging I did in the commit 
message. It appears the list_empty only replaced the entity->rq ==  NULL 
check, but the list_empty was then found to be not enough and 
entity->stopped was added in response.

So in my mind the only question is whether some barrier is needed or 
READ_ONCE on entity->stopped is enough.

This would ask can we have drm_sched_entity_kill() run in parallel to 
drm_sched_entity_flush(), and have the latter miss to see 
entity->stopped == true when woken up in wait_event_*().

drm_sched_entity_kill() sets entity->stopped, from 
drm_sched_entity_fini(), on what can be the drivers entity teardown 
path, while drm_sched_entity_flush() can be called from drm fd close 
(amdgpu and msm) but fd close should happen after any driver specific 
entity destroy.

So it does not look like it, but maybe I am missing something.

Anyway, it is not a terribly important cleanup so as long as there is 
doubt it can stay parked.

Regards,

Tvrtko

>>
>> If we combined all these three pre-requisites, my branch allows the fully invariant sched:entity and 1:1:1 sched:rq:entity. Run-queue vfuncs for the 1:1 drivers become mostly no-ops (remove and pop entity are not needed at all, while add just checks for entity->stopped). So all the list and tree management needed by M:N drivers simply does not happen.
> 
> That sounds sane to me, but I would do one step at a time.
> 
> Regards,
> Christian.
> 
>>
>> In that branch 1:1 entities do not take part in the rq->entities_list so, going back to this patch, the list_empty check will be in the way.
>>
>> Anyway, just for context, I will park this cleanup for now but you can mull it over whether the bigger picture sounds interesting to you.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>>
>>>> While at it, we add READ_ONCE annotation on the entity->stopped check to
>>>> mark the unlocked read.
>>>
>>> This would effectively legalize the lockless access. But it is illegal
>>> and undefined behavior. See drm_sched_fini().
>>>
>>> P.
>>>
>>>
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_entity.c | 10 ++--------
>>>>    1 file changed, 2 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index bb7e5fc47f99..2ed84504cfd6 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -137,14 +137,8 @@ EXPORT_SYMBOL(drm_sched_entity_modify_sched);
>>>>      static bool drm_sched_entity_is_idle(struct drm_sched_entity *entity)
>>>>    {
>>>> -    rmb(); /* for list_empty to work without lock */
>>>> -
>>>> -    if (list_empty(&entity->list) ||
>>>> -        spsc_queue_count(&entity->job_queue) == 0 ||
>>>> -        entity->stopped)
>>>> -        return true;
>>>> -
>>>> -    return false;
>>>> +    return spsc_queue_count(&entity->job_queue) == 0 ||
>>>> +           READ_ONCE(entity->stopped);
>>>>    }
>>>>      /**
>>>
>>
> 

