Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F02AE9F3F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 15:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF8910E8AD;
	Thu, 26 Jun 2025 13:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="zC+yWEMw";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="sDU0ZNm9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEAE10E8AD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 13:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1750945400;
 bh=2ZgqDFWlb+GrFejx6IuFBEV
 6Zi/pdc6Vh9CRkUQYa0c=; b=zC+yWEMwkkr+kE+8nKlHZnVr/PHVCRBBk5jDGQAaf1j+tr38vz
 xVnbFt1jwgJEGn4SkbbSkCh+/1gMcOa1IAtWjoLoJ1nAH1bIdKdcqu4H1JwG6+RRyLfYwzX8TvH
 ICOflILOSS6IbGU/5mGHc6GKHdaYKuQA6IS7JAMuZ0ep+DOFQ6onJFXY0Lftt/Yl79BC/Zm72eM
 /juekouwaIdqLxwvg1G05Fwfrx1PQOA79Ih3BCKBNkTLLTqLegGMfRysjwzpilnemSHji1472uQ
 MWgwgjwdiHgAxxb/LWMNpIa4gsPhYsw+kMX6QkHwN75iZ1ZHJrL4AsuK5maaXcQSr1g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1750945400; bh=2ZgqDFWlb+GrFejx6IuFBEV
 6Zi/pdc6Vh9CRkUQYa0c=; b=sDU0ZNm9YN0YaFGdUPe/+xnIxWIK981o2KMqRwSHWr2BRhphVi
 eBeq9Nt4QpTVd/NTtK+EqgQvp3IyvGqc/AAw==;
Message-ID: <53f324f2-a6f7-4cbc-8d37-d4307df703bd@damsy.net>
Date: Thu, 26 Jun 2025 15:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/sched: Fix racy access to
 drm_sched_entity.dependency
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
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <1d24d974-cf92-47cc-ab53-5d205ce9945a@igalia.com>
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

Hi,

Le 26/06/2025 à 10:41, Tvrtko Ursulin a écrit :
> 
> On 25/06/2025 15:37, Pierre-Eric Pelloux-Prayer wrote:
>> The drm_sched_job_unschedulable trace point can access
>> entity->dependency after it was cleared by the callback
>> installed in drm_sched_entity_add_dependency_cb, causing:
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000020
>> Workqueue: comp_1.1.0 drm_sched_run_job_work [gpu_sched]
>> RIP: 0010:trace_event_raw_event_drm_sched_job_unschedulable+0x70/0xd0 [gpu_sched]
>>
>> To fix this we either need to take a reference of the fence before
>> setting up the callbacks, or move the trace_drm_sched_job_unschedulable
>> calls into drm_sched_entity_add_dependency_cb where they can be
>> done earlier. The former option is the more correct one because with
>> the latter we might emit the event and still be able to schedule the
>> job if the fence is signaled in-between. Despite that, I've
>> implemented the latter, since it's a bit simpler and the extra event
>> is not a deal breaker for tools anyway.
>>
>> Fixes: 76d97c870f29 (drm/sched: Trace dependencies for GPU jobs)
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index 5635b3a826d8..a23b204cac5c 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -401,7 +401,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
>>    * Add a callback to the current dependency of the entity to wake up the
>>    * scheduler when the entity becomes available.
>>    */
>> -static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>> +static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity,
>> +                           struct drm_sched_job *sched_job)
>>   {
>>       struct drm_gpu_scheduler *sched = entity->rq->sched;
>>       struct dma_fence *fence = entity->dependency;
>> @@ -429,6 +430,11 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>           fence = dma_fence_get(&s_fence->scheduled);
>>           dma_fence_put(entity->dependency);
>>           entity->dependency = fence;
>> +
>> +        if (trace_drm_sched_job_unschedulable_enabled() &&
>> +            !dma_fence_is_signaled(fence))
>> +            trace_drm_sched_job_unschedulable(sched_job, fence);
>> +
>>           if (!dma_fence_add_callback(fence, &entity->cb,
>>                           drm_sched_entity_clear_dep))
> 
> Would placing it here be simpler, like this:
> 
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -430,8 +430,10 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>                  dma_fence_put(entity->dependency);
>                  entity->dependency = fence;
>                  if (!dma_fence_add_callback(fence, &entity->cb,
> -                                           drm_sched_entity_clear_dep))
> +                                           drm_sched_entity_clear_dep)) {

At this point, the callback has been installed which means it can be called.
And when it's called it will drop the reference we had of entity->dependency / fence.

So unless I'm mistaken, the trace event below might still dereference freed memory.

Pierre-Eric


> +                       trace_drm_sched_job_unschedulable(sched_job, fence);
>                          return true;
> +               }
> 
>                  /* Ignore it when it is already scheduled */
>                  dma_fence_put(fence);
> 
> Both sched_job and fence references are held on this path (effectively for sched_job), so it is safe 
> from that point of view. Makes the "is signaled" check not needed because dma_fence_add_callback() 
> told us so. And trace_drm_sched_job_unschedulable_enabled() is then not needed too.
> 
>>               return true;
>> @@ -438,6 +444,10 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>           return false;
>>       }
>> +    if (trace_drm_sched_job_unschedulable_enabled() &&
>> +        !dma_fence_is_signaled(entity->dependency))
>> +        trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
>> +
>>       if (!dma_fence_add_callback(entity->dependency, &entity->cb,
>>                       drm_sched_entity_wakeup))
> 
> For this path the same thing, since entity->dependency reference is also held (taken in 
> drm_sched_job_dependency() and released two lines below this hunk).
> 
> Regards,
> 
> Tvrtko
> 
>>           return true;
>> @@ -478,10 +488,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>       while ((entity->dependency =
>>               drm_sched_job_dependency(sched_job, entity))) {
>> -        if (drm_sched_entity_add_dependency_cb(entity)) {
>> -            trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
>> +        if (drm_sched_entity_add_dependency_cb(entity, sched_job))
>>               return NULL;
>> -        }
>>       }
>>       /* skip jobs from entity that marked guilty */
