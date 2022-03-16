Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADCC4DB332
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 15:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064FD10E5E5;
	Wed, 16 Mar 2022 14:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDFB10E5E5;
 Wed, 16 Mar 2022 14:26:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id A3CDC1F446E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647440771;
 bh=LpT8vdOafwaEvQsTIQkR8RzSgD9eGWuZHVAyKh2RonQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VyeQtAoG1t/B1sDJ6RPpXnAwrgc6llpM1pdEtKHDRK3c2YogBiKCHAHFD176JrZxB
 gI7rsPrupgbTsM3aOuT1B2y8aqVw/YbSvVXf2+sxQbaqIx2jPBQNe6rrdo0QW4a8Aa
 xBl/R+SRpj027Rmx6Wvsdq9feT0dtlPBQCC9eECGmjVsjUvDYZ+QwbBQnTCI3VnMo5
 EwR0fW//76swis0fcgMyaqcBOBojwV94PX4z92Tdjw4Kbj++NZKZoLavcLqDnn1ALm
 grR64IJQEXIX2x9RhXPAWgGwRP4qvau39JLJYdoZX3NdTlbO4zux8feB9mJpw8yrP9
 cBELPOqMVFmIg==
Message-ID: <2a364c03-d6d9-1ccd-2ecb-9ebf893f0860@collabora.com>
Date: Wed, 16 Mar 2022 14:26:08 +0000
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
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <2b5816aa-c082-b03a-c7a0-e4351e8e4e5a@amd.com>
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



On 16/03/2022 13:43, Christian König wrote:
> Am 16.03.22 um 14:19 schrieb Robert Beckett:
>>
>>
>> On 16/03/2022 09:54, Christian König wrote:
>>> Am 15.03.22 um 19:04 schrieb Robert Beckett:
>>>> RFC: do we want this to become a generic interface in
>>>> ttm_resource_manager_func?
>>>>
>>>> RFC: would we prefer a different interface? e.g.
>>>> for_each_resource_in_range or for_each_bo_in_range
>>>
>>> Well completely NAK to that. Why do you need that?
>>>
>>> The long term goal is to completely remove the range checks from TTM 
>>> instead.
>>
>> ah, I did not know that.
>> I wanted it just to enable parity with a selftest that checks whether 
>> a range is allocated before initializing a given range with test data 
>> behind the allocator's back. It needs to check the range so that it 
>> doesn't destroy in use data.
> 
> Mhm, of hand that doesn't sounds like a valid test case. Do you have the 
> code at hand?

https://patchwork.freedesktop.org/patch/478347/?series=101396&rev=1
this is where I replace an existing range check via drm_mm with the 
range check I added in this patch.

> 
>>
>> I suppose we could add another drm_mm range tracker just for testing 
>> and shadow track each allocation in the range, but that seemed like a 
>> lot of extra infrastructure for no general runtime use.
> 
> I have no idea what you mean with that.

I meant as a potential solution to tracking allocations without a range 
check, we would need to add something external. e.g. adding a shadow 
drm_mm range tracker, or a bitmask across the range, or stick objects in 
a list etc.

> 
>>
>> would you mind explaining the rationale for removing range checks? It 
>> seems to me like a natural fit for a memory manager
> 
> TTM manages buffer objects and resources, not address space. The 
> lpfn/fpfn parameter for the resource allocators are actually used as 
> just two independent parameters and not define any range. We just keep 
> the names for historical reasons.
> 
> The only places we still use and compare them as ranges are 
> ttm_resource_compat() and ttm_bo_eviction_valuable() and I already have 
> patches to clean up those and move them into the backend resource handling.

except the ttm_range_manager seems to still use them as a range specifier.

If the general design going forward is to not consider ranges, how would 
you recommend constructing buffers around pre-allocated regions e.g. 
uefi frame buffers who's range is dictated externally?

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
>>>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>>>> ---
>>>>   drivers/gpu/drm/ttm/ttm_range_manager.c | 21 +++++++++++++++++++++
>>>>   include/drm/ttm/ttm_range_manager.h     |  3 +++
>>>>   2 files changed, 24 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c 
>>>> b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>> index 8cd4f3fb9f79..5662627bb933 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
>>>> @@ -206,3 +206,24 @@ int ttm_range_man_fini_nocheck(struct 
>>>> ttm_device *bdev,
>>>>       return 0;
>>>>   }
>>>>   EXPORT_SYMBOL(ttm_range_man_fini_nocheck);
>>>> +
>>>> +/**
>>>> + * ttm_range_man_range_busy - Check whether anything is allocated 
>>>> with a range
>>>> + *
>>>> + * @man: memory manager to check
>>>> + * @fpfn: first page number to check
>>>> + * @lpfn: last page number to check
>>>> + *
>>>> + * Return: true if anything allocated within the range, false 
>>>> otherwise.
>>>> + */
>>>> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
>>>> +                  unsigned fpfn, unsigned lpfn)
>>>> +{
>>>> +    struct ttm_range_manager *rman = to_range_manager(man);
>>>> +    struct drm_mm *mm = &rman->mm;
>>>> +
>>>> +    if (__drm_mm_interval_first(mm, PFN_PHYS(fpfn), PFN_PHYS(lpfn + 
>>>> 1) - 1))
>>>> +        return true;
>>>> +    return false;
>>>> +}
>>>> +EXPORT_SYMBOL(ttm_range_man_range_busy);
>>>> diff --git a/include/drm/ttm/ttm_range_manager.h 
>>>> b/include/drm/ttm/ttm_range_manager.h
>>>> index 7963b957e9ef..86794a3f9101 100644
>>>> --- a/include/drm/ttm/ttm_range_manager.h
>>>> +++ b/include/drm/ttm/ttm_range_manager.h
>>>> @@ -53,4 +53,7 @@ static __always_inline int 
>>>> ttm_range_man_fini(struct ttm_device *bdev,
>>>>       BUILD_BUG_ON(__builtin_constant_p(type) && type >= 
>>>> TTM_NUM_MEM_TYPES);
>>>>       return ttm_range_man_fini_nocheck(bdev, type);
>>>>   }
>>>> +
>>>> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
>>>> +                  unsigned fpfn, unsigned lpfn);
>>>>   #endif
>>>
> 
