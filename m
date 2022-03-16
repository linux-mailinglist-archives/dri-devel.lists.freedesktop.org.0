Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264BA4DB4D5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 16:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB43F10E61C;
	Wed, 16 Mar 2022 15:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D350210E61C;
 Wed, 16 Mar 2022 15:28:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 56B071F449E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647444523;
 bh=IFt/uYRczthLX2bVn9Hh2vLm87M/oypTlAv7bG8U86c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h74d+UMFpykK4Ew5JdSkvy8dKKSZASa156l9ZAA6e9h7UoQFDQcklNlmFd0UvId+k
 T/CzY7jFEDcEAUdNQ3dcVQl5GzXNDvzPVW8fFjHx9w1FgGyAR1Q245lCiSPIeT3DPT
 chN6MdeQ435IqoAMdm8eiSPcNpsEq4FAqMSsLKItI/TzFv7s4LseHDaVMh4niS421x
 gs/5f/xQBVlappoX8IrgaKTG2TEdaOYwRRztoUiVcDRFxQDNJas3P2ZpQamS947PYs
 H6ptfD6j4nZlxJNw3NAj9ZW5PebrPLm5HzcpOUC2E2tHfD6/Mzc0zT76FkybnkxjOF
 phDsJgr7/wV1g==
Message-ID: <b5f97167-7a2c-6c47-e107-502a1b9c20e8@collabora.com>
Date: Wed, 16 Mar 2022 15:28:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 5/7] drm/ttm: add range busy check for range manager
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
 <20220315180444.3327283-6-bob.beckett@collabora.com>
 <2918e4a2-3bb8-23e0-3b8c-90c620b82328@amd.com>
 <1eef3b71-ef7c-24d1-b0d7-695fc1d2d353@collabora.com>
 <2b5816aa-c082-b03a-c7a0-e4351e8e4e5a@amd.com>
 <2a364c03-d6d9-1ccd-2ecb-9ebf893f0860@collabora.com>
 <aedda268-8859-ab42-c276-d3b7cb0533fd@amd.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <aedda268-8859-ab42-c276-d3b7cb0533fd@amd.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16/03/2022 14:39, Christian König wrote:
> Am 16.03.22 um 15:26 schrieb Robert Beckett:
>>
>> [SNIP]
>> this is where I replace an existing range check via drm_mm with the 
>> range check I added in this patch.
> 
> Mhm, I still don't get the use case from the code, but I don't think it 
> matters any more.
> 
>>>> I suppose we could add another drm_mm range tracker just for testing 
>>>> and shadow track each allocation in the range, but that seemed like 
>>>> a lot of extra infrastructure for no general runtime use.
>>>
>>> I have no idea what you mean with that.
>>
>> I meant as a potential solution to tracking allocations without a 
>> range check, we would need to add something external. e.g. adding a 
>> shadow drm_mm range tracker, or a bitmask across the range, or stick 
>> objects in a list etc.
> 
> Ah! So you are trying to get access to the drm_mm inside the 
> ttm_range_manager and not add some additional range check function! Now 
> I got your use case.

well, specifically I was trying to avoid having to get access to the drm_mm.
I wanted to maintain an abstract interface at the resource manager 
level, hence the rfc to ask if we could add a range check to 
ttm_resource_manager_func.

I don't like the idea of code external to ttm having to poke in to the 
implementation details of the manager to get it's underlying drm_mm.

> 
>>>> would you mind explaining the rationale for removing range checks? 
>>>> It seems to me like a natural fit for a memory manager
>>>
>>> TTM manages buffer objects and resources, not address space. The 
>>> lpfn/fpfn parameter for the resource allocators are actually used as 
>>> just two independent parameters and not define any range. We just 
>>> keep the names for historical reasons.
>>>
>>> The only places we still use and compare them as ranges are 
>>> ttm_resource_compat() and ttm_bo_eviction_valuable() and I already 
>>> have patches to clean up those and move them into the backend 
>>> resource handling.
>>
>> except the ttm_range_manager seems to still use them as a range 
>> specifier.
> 
> Yeah, because the range manager is the backend which handles ranges 
> using the drm_mm :)
> 
>> If the general design going forward is to not consider ranges, how 
>> would you recommend constructing buffers around pre-allocated regions 
>> e.g. uefi frame buffers who's range is dictated externally?
> 
> Call ttm_bo_mem_space() with the fpfn/lpfn filled in as required. See 
> function amdgpu_bo_create_kernel_at() for an example.

ah, I see, thanks.

To allow similar code to before, which was conceptually just trying to 
see if a range was currently free, would you be okay with a new 
ttm_bo_mem_try_space, which does not do the force to evict, but instead 
returns -EBUSY?

If so, the test can try to alloc, and immediately free if successful 
which would imply it was free.

> 
> Regards,
> Christian.
> 
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>>
>>>>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 21 +++++++++++++++++++++
>>>>>>   include/drm/ttm/ttm_range_manager.h     |  3 +++
>>>>>>   2 files changed, 24 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>>>>>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>> index 8cd4f3fb9f79..5662627bb933 100644
>>>>>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>>>> @@ -206,3 +206,24 @@ int ttm_range_man_fini_nocheck(struct 
>>>>>> ttm_device *bdev,
>>>>>>       return 0;
>>>>>>   }
>>>>>>   EXPORT_SYMBOL(ttm_range_man_fini_nocheck);
>>>>>> +
>>>>>> +/**
>>>>>> + * ttm_range_man_range_busy - Check whether anything is allocated 
>>>>>> with a range
>>>>>> + *
>>>>>> + * @man: memory manager to check
>>>>>> + * @fpfn: first page number to check
>>>>>> + * @lpfn: last page number to check
>>>>>> + *
>>>>>> + * Return: true if anything allocated within the range, false 
>>>>>> otherwise.
>>>>>> + */
>>>>>> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
>>>>>> +                  unsigned fpfn, unsigned lpfn)
>>>>>> +{
>>>>>> +    struct ttm_range_manager *rman = to_range_manager(man);
>>>>>> +    struct drm_mm *mm = &rman->mm;
>>>>>> +
>>>>>> +    if (__drm_mm_interval_first(mm, PFN_PHYS(fpfn), PFN_PHYS(lpfn 
>>>>>> + 1) - 1))
>>>>>> +        return true;
>>>>>> +    return false;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(ttm_range_man_range_busy);
>>>>>> diff --git a/include/drm/ttm/ttm_range_manager.h 
>>>>>> b/include/drm/ttm/ttm_range_manager.h
>>>>>> index 7963b957e9ef..86794a3f9101 100644
>>>>>> --- a/include/drm/ttm/ttm_range_manager.h
>>>>>> +++ b/include/drm/ttm/ttm_range_manager.h
>>>>>> @@ -53,4 +53,7 @@ static __always_inline int 
>>>>>> ttm_range_man_fini(struct ttm_device *bdev,
>>>>>>       BUILD_BUG_ON(__builtin_constant_p(type) && type >= 
>>>>>> TTM_NUM_MEM_TYPES);
>>>>>>       return ttm_range_man_fini_nocheck(bdev, type);
>>>>>>   }
>>>>>> +
>>>>>> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
>>>>>> +                  unsigned fpfn, unsigned lpfn);
>>>>>>   #endif
>>>>>
>>>
> 
