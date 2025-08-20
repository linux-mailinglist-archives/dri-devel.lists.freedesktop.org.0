Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34001B2D783
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 11:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B7E10E6BE;
	Wed, 20 Aug 2025 09:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="j6g+wD8N";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="Se3sdQ6o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6CC10E6BE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1755680799;
 bh=klSS8EesYJk3oX03msjYx2k
 9HhJqAqiW4iJL4a5HS90=; b=j6g+wD8NCuCji2zSUXm8OY/wdisgPP6fWJb2NAoeKvbfNTISZC
 NcuEpYCtlTJ1jyMnmbnBgMvRAWOjUShv4DlRvzs0C2DOpetFtz/ZEQidgWF0pPAW3Ic6TcyFJe/
 oXZCXEPS9Nwl6Agq8U6Ba/irvldbiVcPuAwEeF6qo0FeVenfkVEcTtPe5PdV7gvEI5B3Jk0Nv+d
 wf8YtN0mJLHzOur2TE+hTjUSnw/Y6SYdTzIKCfjqbX78Xrl0vXLkRih2DXQWL09dE/qyVhbegjs
 puDQMyMuHw3n9tzVHGQs5kHD1skqXdaEXjx+TzD1BhnMvZ4WgVFKGP0iYPC2wc8pBwQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1755680799; bh=klSS8EesYJk3oX03msjYx2k
 9HhJqAqiW4iJL4a5HS90=; b=Se3sdQ6ooOwTGSZzfN3cP50UeKzGga3GCokM2Pk97pSkVFU0Hi
 wsy4GFQ5nveUp8SDjl3dZPjWnUvQtC4hUUBA==;
Message-ID: <414070cb-a4d8-4603-a17a-a25a6787034a@damsy.net>
Date: Wed, 20 Aug 2025 11:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/sched: Fix racy access to
 drm_sched_entity.dependency
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
References: <20250625143722.55272-1-pierre-eric.pelloux-prayer@amd.com>
 <1d24d974-cf92-47cc-ab53-5d205ce9945a@igalia.com>
 <53f324f2-a6f7-4cbc-8d37-d4307df703bd@damsy.net>
 <42d6fc40-5095-40b8-9484-b8c744d9daf5@igalia.com>
 <0c6b40e9-e2ec-404e-b0df-e9c324a6f55d@damsy.net>
Content-Language: en-US
In-Reply-To: <0c6b40e9-e2ec-404e-b0df-e9c324a6f55d@damsy.net>
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



Le 21/07/2025 à 17:18, Pierre-Eric Pelloux-Prayer a écrit :
> 
> 
> Le 26/06/2025 à 16:05, Tvrtko Ursulin a écrit :
>>
>> On 26/06/2025 14:43, Pierre-Eric Pelloux-Prayer wrote:
>>> Hi,
>>>
>>> Le 26/06/2025 à 10:41, Tvrtko Ursulin a écrit :
>>>>
>>>> On 25/06/2025 15:37, Pierre-Eric Pelloux-Prayer wrote:
>>>>> The drm_sched_job_unschedulable trace point can access
>>>>> entity->dependency after it was cleared by the callback
>>>>> installed in drm_sched_entity_add_dependency_cb, causing:
>>>>>
>>>>> BUG: kernel NULL pointer dereference, address: 0000000000000020
>>>>> Workqueue: comp_1.1.0 drm_sched_run_job_work [gpu_sched]
>>>>> RIP: 0010:trace_event_raw_event_drm_sched_job_unschedulable+0x70/0xd0 [gpu_sched]
>>>>>
>>>>> To fix this we either need to take a reference of the fence before
>>>>> setting up the callbacks, or move the trace_drm_sched_job_unschedulable
>>>>> calls into drm_sched_entity_add_dependency_cb where they can be
>>>>> done earlier. The former option is the more correct one because with
>>>>> the latter we might emit the event and still be able to schedule the
>>>>> job if the fence is signaled in-between. Despite that, I've
>>>>> implemented the latter, since it's a bit simpler and the extra event
>>>>> is not a deal breaker for tools anyway.
>>>>>
>>>>> Fixes: 76d97c870f29 (drm/sched: Trace dependencies for GPU jobs)
>>>>>
>>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux- prayer@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++++----
>>>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/ drm/scheduler/sched_entity.c
>>>>> index 5635b3a826d8..a23b204cac5c 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -401,7 +401,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
>>>>>    * Add a callback to the current dependency of the entity to wake up the
>>>>>    * scheduler when the entity becomes available.
>>>>>    */
>>>>> -static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>>> +static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity,
>>>>> +                           struct drm_sched_job *sched_job)
>>>>>   {
>>>>>       struct drm_gpu_scheduler *sched = entity->rq->sched;
>>>>>       struct dma_fence *fence = entity->dependency;
>>>>> @@ -429,6 +430,11 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity 
>>>>> *entity)
>>>>>           fence = dma_fence_get(&s_fence->scheduled);
>>>>>           dma_fence_put(entity->dependency);
>>>>>           entity->dependency = fence;
>>>>> +
>>>>> +        if (trace_drm_sched_job_unschedulable_enabled() &&
>>>>> +            !dma_fence_is_signaled(fence))
>>>>> +            trace_drm_sched_job_unschedulable(sched_job, fence);
>>>>> +
>>>>>           if (!dma_fence_add_callback(fence, &entity->cb,
>>>>>                           drm_sched_entity_clear_dep))
>>>>
>>>> Would placing it here be simpler, like this:
>>>>
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -430,8 +430,10 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity 
>>>> *entity)
>>>>                  dma_fence_put(entity->dependency);
>>>>                  entity->dependency = fence;
>>>>                  if (!dma_fence_add_callback(fence, &entity->cb,
>>>> -                                           drm_sched_entity_clear_dep))
>>>> + drm_sched_entity_clear_dep)) {
>>>
>>> At this point, the callback has been installed which means it can be called.
>>> And when it's called it will drop the reference we had of entity-  >dependency / fence.
>>>
>>> So unless I'm mistaken, the trace event below might still dereference freed memory.
>>
>> Bah sorry, I got confused.
>>
>> You just need to fix the formatting of the fixes tag:
>>
>> 76d97c870f29 ("drm/sched: Trace dependencies for GPU jobs")
> 
> Do I need to send a v2 just to amend the commit message or can it be fixed up by the maintainer 
> pushing the patch to the right git tree?
> 
> Pierre-Eric

ping?

Should this go through drm-misc-fixes as it's a fix for a commit that landed during this release cycle?

Thanks,
Pierre-Eric


> 
>>
>> With that:
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> 
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Pierre-Eric
>>>
>>>
>>>> +                       trace_drm_sched_job_unschedulable(sched_job, fence);
>>>>                          return true;
>>>> +               }
>>>>
>>>>                  /* Ignore it when it is already scheduled */
>>>>                  dma_fence_put(fence);
>>>>
>>>> Both sched_job and fence references are held on this path (effectively for sched_job), so it is 
>>>> safe from that point of view. Makes the "is signaled" check not needed because 
>>>> dma_fence_add_callback() told us so. And trace_drm_sched_job_unschedulable_enabled() is then not 
>>>> needed too.
>>>>
>>>>>               return true;
>>>>> @@ -438,6 +444,10 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity 
>>>>> *entity)
>>>>>           return false;
>>>>>       }
>>>>> +    if (trace_drm_sched_job_unschedulable_enabled() &&
>>>>> +        !dma_fence_is_signaled(entity->dependency))
>>>>> +        trace_drm_sched_job_unschedulable(sched_job, entity- >dependency);
>>>>> +
>>>>>       if (!dma_fence_add_callback(entity->dependency, &entity->cb,
>>>>>                       drm_sched_entity_wakeup))
>>>>
>>>> For this path the same thing, since entity->dependency reference is also held (taken in 
>>>> drm_sched_job_dependency() and released two lines below this hunk).
>>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>           return true;
>>>>> @@ -478,10 +488,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity 
>>>>> *entity)
>>>>>       while ((entity->dependency =
>>>>>               drm_sched_job_dependency(sched_job, entity))) {
>>>>> -        if (drm_sched_entity_add_dependency_cb(entity)) {
>>>>> -            trace_drm_sched_job_unschedulable(sched_job, entity- >dependency);
>>>>> +        if (drm_sched_entity_add_dependency_cb(entity, sched_job))
>>>>>               return NULL;
>>>>> -        }
>>>>>       }
>>>>>       /* skip jobs from entity that marked guilty */
