Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D9DC3A339
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C73A10E885;
	Thu,  6 Nov 2025 10:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="NN1Gm2kR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAAE10E883
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 10:23:04 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47112a73785so4734655e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 02:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1762424583; x=1763029383; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VgOP42kyVIF+OaMBMLYClO2LZ5oQJ3Uk17eUAjkdIvg=;
 b=NN1Gm2kRNLF9Elhaqu14uLgiUHZ98FV7LLEMDvq9rtMlRHUIMvJ/ylW6J5ertHXOYp
 TlB61g1aBIiZLtiMRyWypsFwGYQsuM8eyrEGIMpbl+bjrqFhYz8w7wnVy4hBdz37EmST
 d2eS5vGYp74k7Qe8qrDgAlBw8qQlyhIygZgOspbYFObQW5oK6W8d0kF8snxXJtnWVREU
 eoIpDIiSS/xW+CAfLHhbaLP4pQ/oVhpqcnPzXcu3PYiUBep6rwycM1E7nNa+TlQeRUEh
 kxQVeC3tpcQyPzloNpUnK/29uQy2FvhQualuQwbrmIolUvgLqe4WDXac9x9fxTUHND+Z
 mQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762424583; x=1763029383;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VgOP42kyVIF+OaMBMLYClO2LZ5oQJ3Uk17eUAjkdIvg=;
 b=aUecxq3+NQtFr8TCqFgwSL1taaFbei5j7lflltSJcLZEwYpSzhkDbU/gGJ++TAZwpR
 NuMdiH2F1GUrwhv7dXKkTIer+hQKBYc6Qt6ksiutfi5+4ecftS0yIz3sXsFPAiRFybrg
 46bPQfB9kU+ziiUgpPwN79TizRAKyEDzdDTR2F+/FyypkvM52lqqnNUOfTE0JFnwVb2K
 wdpvoeCrtvSMIOsnWNKf9oJMoclYbaOC8T1MvbZexUlTrfjdPPo4L5NSOv/87WRtin2j
 SfzMAY3s7rsjTdqtB5fjL1T7v3IBF9ueywK7//0Fg/vSq+n/6Ei7PqzdcD91Wb3hRPHD
 VxaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Y/CHzmvxzxvENMEh+oFzxiTi24a1YLUVBJLmM4pO2PyW+unB0v/FSJH8gTNWWDvI2Vo4/+wsCGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5Ggg1Qhy79a7WY33y0W3dvfa5qzNoSajR64pcIDlpOmFV5O0g
 kX2yQutzwOzYMDboCNbaX2Dd55v5vP+D++2N3ZXNdU8yhgauvNKGgwAVcdl6cM4sIds=
X-Gm-Gg: ASbGncvTz/nvciyPiUKC28ohotLUa1AAUjFU/dpceKZIF38oPBYURZl/sdWzUm0UKbx
 dXoNBzTAk5sT7KXlclRgUtqZ8JrV0h+dHhyYwAohdIjmtPsuBE42tmeKaIUHj8lgavf1XjgauV6
 MquRMYrop5e2nU8DHMb6bKwm705y4eO9kpgDz/S/5LQhkMrE1ohNce1M7jsjuS25/y80Akf0oNJ
 up1BmoXnI2yYhDlFox8syPMlpPAISjx59cqD75x5tuf43Emuf1urnBefX2AJhGgjvC2v1CHtk7R
 Vb+lxEyZREmH76rc+DtChuH/zVDwAsp1hiOHow7198iKBD5TYJmcrFftpcisE1qaoSUgOeUx9MV
 IP2Qp4QvXP/jGQ4KORyP+AgslQbYzjCAOxCsbl873+FcwFEuvFV3hYS3kUSmtSOUqhkoGHILKxd
 Se8WzcF49DdFSO1hOGWyiZaLSeG+s=
X-Google-Smtp-Source: AGHT+IEtpJZ2x8DlPogW4WdO8xvm2uRzmqJs0tYIUZ3boZRuyGklclD2npgr2Aq/2sPhN6v4NkYQGw==
X-Received: by 2002:a05:600c:1e1e:b0:476:6ef6:e28c with SMTP id
 5b1f17b1804b1-4775ce23c7amr41354635e9.38.1762424582943; 
 Thu, 06 Nov 2025 02:23:02 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775cdcc552sm106633505e9.6.2025.11.06.02.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 02:23:02 -0800 (PST)
Message-ID: <6a7159d5-fb5c-44b5-ba90-2dcd02b59097@ursulin.net>
Date: Thu, 6 Nov 2025 10:23:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/amdgpu: increment sched score on entity
 selection
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
 <20251106093933.18859-3-pierre-eric.pelloux-prayer@amd.com>
 <9e5abc5f-1948-4b18-8485-6540f84cdfd8@ursulin.net>
 <a87d491d-e0ff-4bf6-bce8-6d2935271e6b@damsy.net>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <a87d491d-e0ff-4bf6-bce8-6d2935271e6b@damsy.net>
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


On 06/11/2025 10:10, Pierre-Eric Pelloux-Prayer wrote:
> 
> 
> Le 06/11/2025 à 11:00, Tvrtko Ursulin a écrit :
>>
>> On 06/11/2025 09:39, Pierre-Eric Pelloux-Prayer wrote:
>>> For hw engines that can't load balance jobs, entities are
>>> "statically" load balanced: on their first submit, they select
>>> the best scheduler based on its score.
>>> The score is made up of 2 parts:
>>> * the job queue depth (how much jobs are executing/waiting)
>>> * the number of entities assigned
>>>
>>> The second part is only relevant for the static load balance:
>>> it's a way to consider how many entities are attached to this
>>> scheduler, knowing that if they ever submit jobs they will go
>>> to this one.
>>>
>>> For rings that can load balance jobs freely, idle entities
>>> aren't a concern and shouldn't impact the scheduler's decisions.
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux- 
>>> prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 21 ++++++++++++++++-----
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 +
>>>   2 files changed, 17 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/ 
>>> drm/amd/ amdgpu/amdgpu_ctx.c
>>> index afedea02188d..953c81c928c1 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> @@ -209,6 +209,7 @@ static int amdgpu_ctx_init_entity(struct 
>>> amdgpu_ctx *ctx, u32 hw_ip,
>>>       struct amdgpu_ctx_entity *entity;
>>>       enum drm_sched_priority drm_prio;
>>>       unsigned int hw_prio, num_scheds;
>>> +    struct amdgpu_ring *aring;
>>>       int32_t ctx_prio;
>>>       int r;
>>> @@ -239,11 +240,13 @@ static int amdgpu_ctx_init_entity(struct 
>>> amdgpu_ctx *ctx, u32 hw_ip,
>>>               goto error_free_entity;
>>>       }
>>> -    /* disable load balance if the hw engine retains context among 
>>> dependent jobs */
>>> -    if (hw_ip == AMDGPU_HW_IP_VCN_ENC ||
>>> -        hw_ip == AMDGPU_HW_IP_VCN_DEC ||
>>> -        hw_ip == AMDGPU_HW_IP_UVD_ENC ||
>>> -        hw_ip == AMDGPU_HW_IP_UVD) {
>>> +    sched = scheds[0];
>>> +    aring = container_of(sched, struct amdgpu_ring, sched);
>>> +
>>> +    if (aring->funcs->engine_retains_context) {
>>> +        /* Disable load balancing between multiple schedulers if the hw
>>> +         * engine retains context among dependent jobs.
>>> +         */
>>>           sched = drm_sched_pick_best(scheds, num_scheds);
>>>           scheds = &sched;
>>>           num_scheds = 1;
>>> @@ -258,6 +261,11 @@ static int amdgpu_ctx_init_entity(struct 
>>> amdgpu_ctx *ctx, u32 hw_ip,
>>>       if (cmpxchg(&ctx->entities[hw_ip][ring], NULL, entity))
>>>           goto cleanup_entity;
>>> +    if (aring->funcs->engine_retains_context) {
>>> +        entity->sched_score = sched->score;
>>> +        atomic_inc(entity->sched_score);
>>
>> Maybe you missed it, in the last round I asked this:
> 
> I missed it, sorry.
> 
>>
>> """
>> Here is would always be sched->score == aring->sched_score, right?
> 
> Yes because drm_sched_init is called with args.score = ring->sched_score
> 
>>
>> If so it would probably be good to either add that assert, or even to 
>> just fetch it from there. Otherwise it can look potentially concerning 
>> to be fishing out the pointer from scheduler internals.
>>
>> The rest looks good to me.
>> """
>>
>> Because grabbing a pointer from drm_sched->score and storing it in AMD 
>> entity can look scary, since sched->score can be scheduler owned.
>>
>> Hence I was suggesting to either fish it out from aring->sched_score. 
>> If it is true that they are always the same atomic_t at this point.
> 
> I used sched->score, because aring->sched_score is not the one we want 
> (the existing aring points to scheds[0], not the selected sched). But I 
> can change the code to:
> 
> if (aring->funcs->engine_retains_context) {
>     aring = container_of(sched, struct amdgpu_ring, sched)
>     entity->sched_score = aring->sched_score;
>     atomic_inc(entity->sched_score);
> }
> 
> If it's preferred.

For me it is, yes. Because it removes any doubt on who owns the atomic_t 
pointed to. And it also isolates the driver from any changes in DRM 
scheduler structures.

With that:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

>>> +    }
>>> +
>>>       return 0;
>>>   cleanup_entity:
>>> @@ -514,6 +522,9 @@ static void amdgpu_ctx_do_release(struct kref *ref)
>>>               if (!ctx->entities[i][j])
>>>                   continue;
>>> +            if (ctx->entities[i][j]->sched_score)
>>> +                atomic_dec(ctx->entities[i][j]->sched_score);
>>> +
>>>               drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
>>>           }
>>>       }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/ 
>>> drm/amd/ amdgpu/amdgpu_ctx.h
>>> index 090dfe86f75b..f7b44f96f374 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>> @@ -39,6 +39,7 @@ struct amdgpu_ctx_entity {
>>>       uint32_t        hw_ip;
>>>       uint64_t        sequence;
>>>       struct drm_sched_entity    entity;
>>> +    atomic_t        *sched_score;
>>>       struct dma_fence    *fences[];
>>>   };

