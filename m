Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673AEB4190F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 10:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A05B10E5B0;
	Wed,  3 Sep 2025 08:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="sq2ND0bR";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="Ijyt+a2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF4B10E5B0;
 Wed,  3 Sep 2025 08:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1756889339;
 bh=HjOHEWMSMrU5p/zkpwE6dIR
 BHC+CIfleuHQUkcLp8Uk=; b=sq2ND0bRElkSLV+K2Zb2GyBpijps3zsYqbhBqGbb64VNoI97Mj
 tiO480pDQxzLZvFWQ3mbIUhwxB1aNSqs0oksnhnEGeUa844V+NvE28ix9NRQ+GCXq5wlcCcw5n3
 GZV7CSXEvdeuKDIHke5AIIynI9bdQs21h4qKgFAN+GxX1b3MJjWfk2jn3oIWDiOACIN1zQi65CY
 Nk/5j7NTTY6X/irYLssR1NeqBw5yrpfuTNo3vkqnP0aggl5kZB88TGUfoFB+cwaxgLmQZGbLmIw
 imP5lHROygenfvKG/V9FK2GzxvWp0LgT1kJ/vxIcq77jo58+yxPAMp1Dzu1KDKQNAwg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1756889339; bh=HjOHEWMSMrU5p/zkpwE6dIR
 BHC+CIfleuHQUkcLp8Uk=; b=Ijyt+a2L89KHy6PEhWIlTcrWd/aXddM9LchOwHtni1IQgrTdDj
 I+UM27gH7Lcf1UVf0hJUMKGSlyU/6G1TL1BQ==;
Message-ID: <0f4c18b7-4591-4450-8d55-b7bfe789d9fa@damsy.net>
Date: Wed, 3 Sep 2025 10:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/amdgpu: increment share sched score on entity
 selection
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250822134348.6819-1-pierre-eric.pelloux-prayer@amd.com>
 <a05bb414-4dd1-4cbe-aa1a-beaea2d056aa@ursulin.net>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <a05bb414-4dd1-4cbe-aa1a-beaea2d056aa@ursulin.net>
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

Le 01/09/2025 à 11:02, Tvrtko Ursulin a écrit :
> 
> On 22/08/2025 14:43, Pierre-Eric Pelloux-Prayer wrote:
>> For hw engines that can't load balance jobs, entities are
>> "statically" load balanced: on their first submit, they select
>> the best scheduler based on its score.
>> The score is made up of 2 parts:
>> * the job queue depth (how much jobs are executing/waiting)
>> * the number of entities assigned
>>
>> The second part is only relevant for the static load balance:
>> it's a way to consider how many entities are attached to this
>> scheduler, knowing that if they ever submit jobs they will go
>> to this one.
>>
>> For rings that can load balance jobs freely, idle entities
>> aren't a concern and shouldn't impact the scheduler's decisions.
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 23 ++++++++++++++++++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
>>   2 files changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/ 
>> amdgpu/amdgpu_ctx.c
>> index f5d5c45ddc0d..4a078d2d98c5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>> @@ -206,9 +206,11 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, 
>> u32 hw_ip,
>>   {
>>       struct drm_gpu_scheduler **scheds = NULL, *sched = NULL;
>>       struct amdgpu_device *adev = ctx->mgr->adev;
>> +    bool static_load_balancing = false;
>>       struct amdgpu_ctx_entity *entity;
>>       enum drm_sched_priority drm_prio;
>>       unsigned int hw_prio, num_scheds;
>> +    struct amdgpu_ring *aring;
>>       int32_t ctx_prio;
>>       int r;
>> @@ -236,17 +238,22 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx 
>> *ctx, u32 hw_ip,
>>           r = amdgpu_xcp_select_scheds(adev, hw_ip, hw_prio, fpriv,
>>                           &num_scheds, &scheds);
>>           if (r)
>> -            goto cleanup_entity;
>> +            goto error_free_entity;
> 
> Indeed, previously this was calling drm_sched_entity_fini() before 
> drm_sched_entity_init() and it only worked because of kzalloc.
> 
>>       }
>>       /* disable load balance if the hw engine retains context among dependent 
>> jobs */
>> -    if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
>> -        hw_ip == AMDGPU_HW_IP_VCN_DEC ||
>> -        hw_ip == AMDGPU_HW_IP_UVD_ENC ||
>> -        hw_ip == AMDGPU_HW_IP_UVD) {
>> +    static_load_balancing = hw_ip == AMDGPU_HW_IP_VCN_ENC ||
>> +                hw_ip == AMDGPU_HW_IP_VCN_DEC ||
>> +                hw_ip == AMDGPU_HW_IP_UVD_ENC ||
>> +                hw_ip == AMDGPU_HW_IP_UVD;
>> +
>> +    if (static_load_balancing) {
>>           sched = drm_sched_pick_best(scheds, num_scheds);
>>           scheds = &sched;
>>           num_scheds = 1;
>> +        aring = container_of(sched, struct amdgpu_ring, sched);
>> +        entity->sched_ring_score = aring->sched_score;
>> +        atomic_inc(entity->sched_ring_score);
> 
> If we were to bike-shed we could find a way to avoid the new local variables. 
> Keeping the if as is and assign to entity->sched_ring_score directly, and then 
> checking for that on the cleanup path. Still works due kzalloc. Or if relying on 
> kzalloc is not desired, at least bool static_load_balance could be replaced by 
> re-naming the aring local as static_aring and using it like the name suggests.
> 
> Could also move the atomic_inc to the success path to avoid having to add code 
> to error unwind.
> 

Christian, Alex: any preferences on the code style to use here?

> Both cases are I think equally racy in the sense that parallel 
> amdgpu_ctx_init_entity invocations can all pick the same sched. But that is true 
> today AFAICT because score is not incremented until later in the job submit 
> process.
> 
> I suppose one way to make the assignment more robust would be to "rotate" (or 
> randomize) the sched list atomically before calling drm_sched_pick_best. Thoughts?
> 

IMO without the ability to do job level load balancing, there will always be 
cases where the scheduler choice is not optimal. For this reason I prefered to 
keep the code as simple as possible.

Thanks,
Pierre-Eric


> Regards,
> 
> Tvrtko
> 
>>       }
>>       r = drm_sched_entity_init(&entity->entity, drm_prio, scheds, num_scheds,
>> @@ -264,6 +271,9 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, 
>> u32 hw_ip,
>>       drm_sched_entity_fini(&entity->entity);
>>   error_free_entity:
>> +    if (static_load_balancing)
>> +        atomic_dec(entity->sched_ring_score);
>> +
>>       kfree(entity);
>>       return r;
>> @@ -514,6 +524,9 @@ static void amdgpu_ctx_do_release(struct kref *ref)
>>               if (!ctx->entities[i][j])
>>                   continue;
>> +            if (ctx->entities[i][j]->sched_ring_score)
>> +                atomic_dec(ctx->entities[i][j]->sched_ring_score);
>> +
>>               drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
>>           }
>>       }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/ 
>> amdgpu/amdgpu_ctx.h
>> index 090dfe86f75b..076a0e165ce0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>> @@ -39,6 +39,7 @@ struct amdgpu_ctx_entity {
>>       uint32_t        hw_ip;
>>       uint64_t        sequence;
>>       struct drm_sched_entity    entity;
>> +    atomic_t        *sched_ring_score;
>>       struct dma_fence    *fences[];
>>   };
