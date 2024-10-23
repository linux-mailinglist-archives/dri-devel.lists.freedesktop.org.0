Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C259ACC3D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDC610E1A1;
	Wed, 23 Oct 2024 14:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YYFnAr4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA6510E1A1;
 Wed, 23 Oct 2024 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tLwZz3dM+fD3AkNaqH0UmCbJ45ssV7iY/xpbwObpiMA=; b=YYFnAr4JS660C2VvI/hd/dFCys
 nRH+OxAKADTGc6gWUuMhAf20TcQsSRv+TFV2O802MeIhz0Jcdqm0tBfZA7IRm3Z52SfYx/mI1Qgef
 0E5zTfOIO3AwGiizqqYxTNodftLux86WFLDKJYF+W/RUeRPMO2YlTgQt34uLiuML4kyjFrCWlXcWY
 OY+8cqVEpOa8tE+zoIKQbXKNWlrOTIDy17rtVKLJxHL0uSse9c3nidv7THaHsCDSTu5N9tng3nihI
 MTZvZ1Fs8UbZAtL4ZWSxy+dvu+2Ih6sugNim9KawHV/IQnEg8sH736qi6r+0LROT9iXjXXrk4XC23
 U/9lZBFA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t3cKI-00E4Ir-7M; Wed, 23 Oct 2024 16:27:06 +0200
Message-ID: <385066fa-e4ee-4621-8714-70928e91259b@igalia.com>
Date: Wed, 23 Oct 2024 15:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
To: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
 <cd2b57c6-1947-4dbd-bae8-ecdb2b42de72@igalia.com>
 <47e4b79b-2c08-4ee8-b472-5482bc159856@amd.com>
 <6d324aca-76fd-420b-9bae-6c0984e659e1@igalia.com>
 <7503c3fd-deea-4eb9-9324-ab4f13f70332@amd.com>
 <2141a4f4-bcf4-4419-8756-fb5afd6c7f3a@igalia.com>
 <SA1PR12MB859920867E49C80E5059C97BED4D2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <SA1PR12MB859920867E49C80E5059C97BED4D2@SA1PR12MB8599.namprd12.prod.outlook.com>
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


On 23/10/2024 14:31, Li, Yunxiang (Teddy) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Sent: Wednesday, October 23, 2024 8:25
>> On 23/10/2024 13:12, Christian König wrote:
>>> Am 23.10.24 um 13:37 schrieb Tvrtko Ursulin:
>>>>
>>>> On 23/10/2024 10:14, Christian König wrote:
>>>>> Am 23.10.24 um 09:38 schrieb Tvrtko Ursulin:
>>>>>>
>>>>>> On 22/10/2024 17:24, Christian König wrote:
>>>>>>> Am 22.10.24 um 17:17 schrieb Li, Yunxiang (Teddy):
>>>>>>>> [Public]
>>>>>>>>
>>>>>>>>>> +static uint32_t fold_memtype(uint32_t memtype) {
>>>>>>>>> In general please add prefixes to even static functions, e.g.
>>>>>>>>> amdgpu_vm_ or
>>>>>>>>> amdgpu_bo_.
>>>>>>>>>
>>>>>>>>>> +   /* Squash private placements into 'cpu' to keep the legacy
>>>>>>>>>> userspace view.
>>>>>>>>> */
>>>>>>>>>> +   switch (mem_type) {
>>>>>>>>>> +   case TTM_PL_VRAM:
>>>>>>>>>> +   case TTM_PL_TT:
>>>>>>>>>> +           return memtype
>>>>>>>>>> +   default:
>>>>>>>>>> +           return TTM_PL_SYSTEM;
>>>>>>>>>> +   }
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static uint32_t bo_get_memtype(struct amdgpu_bo *bo) {
>>>>>>>>> That whole function belongs into amdgpu_bo.c
>>>>>>>> Do you mean bo_get_memtype or fold_memtype? I debated whether
>>>>>>>> bo_get_memtype should go into amdgpu_vm.c or amdgpu_bo.c, and
>>>>>>>> since it's using fold_memtype and only useful for memory stats
>>>>>>>> because of folding the private placements I just left them here
>>>>>>>> together with the other mem stats code.
>>>>>>>>
>>>>>>>> I can move it to amdgpu_bo.c make it return the memtype verbatim
>>>>>>>> and just fold it when I do the accounting.
>>>>>>>
>>>>>>> I think that folding GDS, GWS and OA into system is also a bug. We
>>>>>>> should really not doing that.
>>>>>>>
>>>>>>> Just wanted to point out for this round that the code to query the
>>>>>>> current placement from a BO should probably go into amdgpu_bo.c
>>>>>>> and not amdgpu_vm.c
>>>>>>>
>>>>>>>>
>>>>>>>>>> +   struct ttm_resource *res = bo->tbo.resource;
>>>>>>>>>> +   const uint32_t domain_to_pl[] = {
>>>>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_CPU)]      =
>>>>>>>>>> +TTM_PL_SYSTEM,
>>>>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GTT)]      = TTM_PL_TT,
>>>>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_VRAM)]     =
>> TTM_PL_VRAM,
>>>>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GDS)]      =
>>>>>>>>>> +AMDGPU_PL_GDS,
>>>>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_GWS)]      =
>>>>>>>>>> +AMDGPU_PL_GWS,
>>>>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_OA)]       =
>> AMDGPU_PL_OA,
>>>>>>>>>> +           [ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] =
>>>>>>>>> AMDGPU_PL_DOORBELL,
>>>>>>>>>> +   };
>>>>>>>>>> +   uint32_t domain;
>>>>>>>>>> +
>>>>>>>>>> +   if (res)
>>>>>>>>>> +           return fold_memtype(res->mem_type);
>>>>>>>>>> +
>>>>>>>>>> +   /*
>>>>>>>>>> +    * If no backing store use one of the preferred domain for
>>>>>>>>>> basic
>>>>>>>>>> +    * stats. We take the MSB since that should give a
>>>>>>>>>> +reasonable
>>>>>>>>>> +    * view.
>>>>>>>>>> +    */
>>>>>>>>>> +   BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT ||
>> TTM_PL_VRAM <
>>>>>>>>> TTM_PL_SYSTEM);
>>>>>>>>>> +   domain = fls(bo->preferred_domains &
>>>>>>>>>> +AMDGPU_GEM_DOMAIN_MASK);
>>>>>>>>>> +   if (drm_WARN_ON_ONCE(&adev->ddev,
>>>>>>>>>> +                        domain == 0 || --domain >=
>>>>>>>>>> ARRAY_SIZE(domain_to_pl)))
>>>>>>>>> It's perfectly legal to create a BO without a placement. That
>>>>>>>>> one just won't have a backing store.
>>>>>>>>>
>>>>>>>> This is lifted from the previous change I'm rebasing onto. I
>>>>>>>> think what it’s trying to do is if the BO doesn't have a
>>>>>>>> placement, use the "biggest" (VRAM > TT > SYSTEM) preferred
>>>>>>>> placement for the purpose of accounting. Previously we just
>>>>>>>> ignore BOs that doesn't have a placement. I guess there's
>>>>>>>> argument for going with either approaches.
>>>>>>>
>>>>>>> I was not arguing, I'm simply pointing out a bug. It's perfectly
>>>>>>> valid for bo->preferred_domains to be 0.
>>>>>>>
>>>>>>> So the following WARN_ON() that no bit is set is incorrect.
>>>>>>>
>>>>>>>>
>>>>>>>>>> +           return 0;
>>>>>>>>>> +   return fold_memtype(domain_to_pl[domain])
>>>>>>>>> That would need specular execution mitigation if I'm not
>>>>>>>>> completely mistaken.
>>>>>>>>>
>>>>>>>>> Better use a switch/case statement.
>>>>>>>>>
>>>>>>>> Do you mean change the array indexing to a switch statement?
>>>>>>>
>>>>>>> Yes.
>>>>>>
>>>>>> Did you mean array_index_nospec?
>>>>>
>>>>> Yes.
>>>>>
>>>>>> Domain is not a direct userspace input and is calculated from the
>>>>>> mask which sanitized to allowed values prior to this call. So I
>>>>>> *think* switch is an overkill but don't mind it either. Just
>>>>>> commenting FWIW.
>>>>>
>>>>> I missed that the mask is applied.
>>>>>
>>>>> Thinking more about it I'm not sure if we should do this conversion
>>>>> in the first place. IIRC Tvrtko you once suggested a patch which
>>>>> switched a bunch of code to use the TTM placement instead of the
>>>>> UAPI flags.
>>>>
>>>> Maybe 8fb0efb10184 ("drm/amdgpu: Reduce mem_type to domain double
>>>> indirection") is what are you thinking of?
>>>
>>> Yes, exactly that one.
>>>
>>>>
>>>>> Going more into this direction I think when we want to look at the
>>>>> current placement we should probably also use the TTM PL enumeration
>>>>> directly.
>>>>
>>>> It does this already. The placement flags are just to "invent" a TTM
>>>> PL enum when bo->tbo.resource == NULL.
>>>
>>> Ah, good point! I though we would do the mapping the other way around.
>>>
>>> In this case that is even more something we should probably not do at all.
>>>
>>> When bo->tbo.resource is NULL then this BO isn't resident at all, so
>>> it should not account to resident memory.
>>
>> It doesn't, only for total. I should have pasted more context..:
>>
>>        struct ttm_resource *res = bo->tbo.resource; ...
>>           /* DRM stats common fields: */
>>
>>           stats[type].total += size;
>>           if (drm_gem_object_is_shared_for_memory_stats(obj))
>>                   stats[type].drm.shared += size;
>>           else
>>                   stats[type].drm.private += size;
>>
>>           if (res) {
>>                   stats[type].drm.resident += size
>>
>> So if no current placement it does not count towards drm-resident-, only
>> drm-total- (which is drm.private + drm.resident). Total and resident intend to be
>> analogue to for instance VIRT and RES in top(1), or VZS and RSS in ps(1).
>>
>>>> Again, based of the same enum. Not sure if you have something other
>>>> in mind or you are happy with that?
>>>
>>> I think that for drm-total-* we should use the GEM flags and for
>>> drm-resident-* we should use the TTM placement.
>>
>> Agreed! :)
>>
> 
> Oof I missed the distinction between resident and total as well. Just want to double confirm the drm-total- semantics.
> 
> Does drm-total- track the BOs that prefer the placement (derived from the preferred domain) and drm-resident- track the actual placement, or does drm-total- track drm-resident- plus BOs that don't have a placement but prefers here?

Preferred domain is only used as an aid when there is no backing store. 
Putting that aside, it is supposed to be simple:

Total - BO exists, whether or not it currently has a backing store.

Resident - BO has a backing store.

Active and purgeable are a sub-variant of resident.

Again, preferred placement only comes into the picture (in the current 
implementation) when there is not backing store. Because we must account 
the total and looking at the preferred tells us to where.

Yeah it may be that one second you have:

total-vram: 4 KiB
resident-vram: 0
total-system: 0
resident-system: 0

And the second:

total-vram: 0
resident-vram: 0
total-system: 4 KiB
resident-system: 4 KiB

All with a single 4k BO, which happened to instantiate its backing store 
in it's 2nd preferred placement.

But IMO it is better than not accounting it under total anywhere in the 
first case.

Have I managed to explain it good enough?

Regards,

Tvrtko

>>>>
>>>> Then what Teddy does is IMO only tangential, he just changes when
>>>> stats are collected and not this aspect.
>>>
>>> Yeah, right but we should probably fix it up in the right way while on it.
>>
>> Okay, we just need to align on is there a problem and how to fix it.
>>
>>>> To fold or not the special placements (GWS, GDS & co) is also
>>>> tangential. In my patch I just preserved the legacy behaviour so it
>>>> can easily be tweaked on top.
>>>
>>> Yeah, but again the original behavior is completely broken.
>>>
>>> GWS, GDS and OA are counted in blocks of HW units (multiplied by
>>> PAGE_SIZE IIRC to avoid some GEM&TTM warnings).
>>>
>>> When you accumulate that anywhere in the memory stats then that is
>>> just completely off.
>>
>> Ooops. :) Are they backed by some memory though, be it system or VRAM?
>>
>> Regards,
>>
>> Tvrtko
