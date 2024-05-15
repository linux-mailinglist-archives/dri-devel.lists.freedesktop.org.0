Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF858C697A
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 17:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECD310E315;
	Wed, 15 May 2024 15:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SAgdWnrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289CC10E315;
 Wed, 15 May 2024 15:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vSw5U15ZqhJzro0lwPTdKqlUvj1EmSnMzm7/Pr9XNo4=; b=SAgdWnrjzJSMHVLW/0qMxo2nA6
 8mWZg58lhbmd3DRi4XesR+yAeg1zspp1UlmY/DFqeuIyGelT005rM6Rg/LValMshUXuLz8Mb6AQSS
 rUI44ItGjSIkqYQr8WmSjURtHOtfzprn7KSR/ykLkAH0TWDDA0DE7DNg/UmqIsZDBohAOT/+RU1g2
 dBHhQ92nN3ngHhiHVKUthC24P7S9VKgMIeChAdTf8WykR5R8MS0El33m/nIA4tnqnvAiZNFhTu/KZ
 RJjKjyjvTmq0uxLLpm2S2tA9lz+qOLoSmCKol5RFu5f/Jg5lmtJSJOhfNHuuZiOOY7eU2mmsI+PpC
 XwOENPlg==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s7GKB-008RFS-EO; Wed, 15 May 2024 17:13:47 +0200
Message-ID: <c66a41bd-4511-414e-93fc-d4aa7c36c5b5@igalia.com>
Date: Wed, 15 May 2024 16:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/5] drm/amdgpu: Actually respect buffer migration budget
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Friedrich Vock <friedrich.vock@gmx.de>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <20240508180946.96863-3-tursulin@igalia.com>
 <8a689a5a-b408-41da-b7bd-8c7a3b2f2ac7@amd.com>
 <1a20c64f-cb1c-4f68-917b-9a8a34741bff@igalia.com>
 <7a9a2819-a3f0-4a51-8ae8-bde6ff7b0aaa@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <7a9a2819-a3f0-4a51-8ae8-bde6ff7b0aaa@amd.com>
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


On 15/05/2024 15:31, Christian König wrote:
> Am 15.05.24 um 12:59 schrieb Tvrtko Ursulin:
>>
>> On 15/05/2024 08:20, Christian König wrote:
>>> Am 08.05.24 um 20:09 schrieb Tvrtko Ursulin:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Current code appears to live in a misconception that playing with 
>>>> buffer
>>>> allowed and preferred placements can control the decision on whether
>>>> backing store migration will be attempted or not.
>>>>
>>>> Both from code inspection and from empirical experiments I see that not
>>>> being true, and that both allowed and preferred placement are typically
>>>> set to the same bitmask.
>>>
>>> That's not correct for the use case handled here, but see below.
>>
>> Which part is not correct, that bo->preferred_domains and 
>> bo->allower_domains are the same bitmask?
> 
> Sorry totally forgot to explain that.
> 
> This rate limit here was specially made for OpenGL applications which 
> over commit VRAM. In those case preferred_domains will be VRAM only and 
> allowed_domains will be VRAM|GTT.
> 
> RADV always uses VRAM|GTT for both (which is correct).

Got it, thanks!

>>>> As such, when the code decides to throttle the migration for a 
>>>> client, it
>>>> is in fact not achieving anything. Buffers can still be either 
>>>> migrated or
>>>> not migrated based on the external (to this function and facility) 
>>>> logic.
>>>>
>>>> Fix it by not changing the buffer object placements if the migration
>>>> budget has been spent.
>>>>
>>>> FIXME:
>>>> Is it still required to call validate is the question..
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 12 +++++++++---
>>>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>> index 22708954ae68..d07a1dd7c880 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>> @@ -784,6 +784,7 @@ static int amdgpu_cs_bo_validate(void *param, 
>>>> struct amdgpu_bo *bo)
>>>>           .no_wait_gpu = false,
>>>>           .resv = bo->tbo.base.resv
>>>>       };
>>>> +    bool migration_allowed = true;
>>>>       struct ttm_resource *old_res;
>>>>       uint32_t domain;
>>>>       int r;
>>>> @@ -805,19 +806,24 @@ static int amdgpu_cs_bo_validate(void *param, 
>>>> struct amdgpu_bo *bo)
>>>>                * visible VRAM if we've depleted our allowance to do
>>>>                * that.
>>>>                */
>>>> -            if (p->bytes_moved_vis < p->bytes_moved_vis_threshold)
>>>> +            if (p->bytes_moved_vis < p->bytes_moved_vis_threshold) {
>>>>                   domain = bo->preferred_domains;
>>>> -            else
>>>> +            } else {
>>>>                   domain = bo->allowed_domains;
>>>> +                migration_allowed = false;
>>>> +            }
>>>>           } else {
>>>>               domain = bo->preferred_domains;
>>>>           }
>>>>       } else {
>>>>           domain = bo->allowed_domains;
>>>> +        migration_allowed = false;
>>>>       }
>>>>   retry:
>>>> -    amdgpu_bo_placement_from_domain(bo, domain);
>>>> +    if (migration_allowed)
>>>> +        amdgpu_bo_placement_from_domain(bo, domain);
>>>
>>> That's completely invalid. Calling amdgpu_bo_placement_from_domain() 
>>> is a mandatory prerequisite for calling ttm_bo_validate();
>>>
>>> E.g. the usually code fow is:
>>>
>>> /* This initializes bo->placement */
>>> amdgpu_bo_placement_from_domain()
>>>
>>> /* Eventually modify bo->placement to fit special requirements */
>>> ....
>>>
>>> /* Apply the placement to the BO */
>>> ttm_bo_validate(&bo->tbo, &bo->placement, &ctx)
>>>
>>> To sum it up bo->placement should be a variable on the stack instead, 
>>> but we never bothered to clean that up.
>>
>> I am not clear if you agree or not that the current method of trying 
>> to avoid migration doesn't really do anything?
> 
> I totally agree, but the approach you taken to fix it is just quite 
> broken. You can't leave bo->placement uninitialized and expect that 
> ttm_bo_validate() won't move the BO.

Yep, that much was clear, sorry that I did not explicitly acknowledge 
but just moved on to discussing how to fix it properly.

>> On stack placements sounds plausible to force migration avoidance by 
>> putting a single current object placement in that list, if that is 
>> what you have in mind? Or a specialized flag/version of 
>> amdgpu_bo_placement_from_domain with an bool input like 
>> "allow_placement_change"?
> 
> A very rough idea with no guarantee that it actually works:
> 
> Add a TTM_PL_FLAG_RATE_LIMITED with all the TTM code to actually figure 
> out how many bytes have been moved and how many bytes the current 
> operation can move etc...
> 
> Friedrich's patches actually looked like quite a step into the right 
> direction for that already, so I would start from there.
> 
> Then always feed amdgpu_bo_placement_from_domain() with the 
> allowed_domains in the CS path and VM validation.
> 
> Finally extend amdgpu_bo_placement_from_domain() to take a closer look 
> at bo->preferred_domains, similar to how we do for the 
> TTM_PL_FLAG_FALLBACK already and set the TTM_PL_FLAG_RATE_LIMITED flag 
> as appropriate.

Two things which I kind of don't like with the placement flag idea is 
that a) typically two placements are involved in a move so semantics of 
an individual placement being rate limited does not fully fit. Unless we 
view it is a hack to temporarily "de-prioritise" placement. In which 
case I come to b), where the dynamic games with domains and placements 
perhaps feel a bit hacky. Certainly interactions between placement 
selection in ttm_bo_validate (via ttm_resource_compatible) and 
ttm_bo_alloc_resource could be tricky.

Maybe... I will think about it a bit more.

In the meantime what I played with today is the "stack local" single 
placement in amdgpu_cs_bo_validate. If over the migration budget, I find 
the abo->placement matching the current bo->tbo.resource, and pass it 
into ttm_bo_validate instead of the full placement list.

With that patch and also "drm/amdgpu: Re-validate evicted buffers" from 
this series I did three of Assasin's Creed Valhalla on each kernel and 
it does appear to be keeping the migrations lower. It has no effect on 
average fps, but does appear to improve the minimum, 1% low and 0.1% low.

This is on an APU mind you. No idea how that would affect discrete. But 
it is interesting that marking _more_ buffers for re-validations 
combined with throttling migrations correctly, for this use case, it 
seems to do what I expected.

Regards,

Tvrtko

>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>> +
>>>>       r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>>>>       if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
>>>
> 
