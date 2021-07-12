Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C27F3C4640
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 11:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2000389864;
	Mon, 12 Jul 2021 09:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D768895C1;
 Mon, 12 Jul 2021 09:27:10 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d2so24699181wrn.0;
 Mon, 12 Jul 2021 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=l8Hu/qKn/jnoBek0LAp58S2UYZG5mmCNfse/jYs/YsU=;
 b=dh0/dR4XUtq0GSR0Xm5XvEXRKku66TJd6M/q8PyhN52oR67M+OEwJebRZxMJpYL5Lt
 2YIbTc78pifTkrKMd/tiV0OFvxcJ4x9mOlzLdXk73eVTlIL99xNeWcW3BL6+kzI0jw85
 wVLW55EtHzfuRTofWJgLFIeGPt7Fq4LaXltor7w7vUDosUIC2sDrfIvv9uLLqUiiC4HF
 Y3nd58x4XI95X8Z6qw8WHGO+YZSs0EQwxd2pj03sPanAHh7AZZqrAkBhO0CLsHQvpEZo
 j4+D8ZKJxZtnlKDyhV/TMSiwUt7t5qIv6efO2K7EDGyIQfbLFQ5r3Y8OpRrslWCn+tLT
 9O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l8Hu/qKn/jnoBek0LAp58S2UYZG5mmCNfse/jYs/YsU=;
 b=EZiVvMT1tg+3dzs4OYKO3qaBpyx6L0z/ehTH9sP5zFVg/163oUWSJ24fUsz10fZh/O
 dOQNmpMg6C0a1ggfAoBVADiwLsw3Xf+0vjlIcyqiYQ7SUJ8dnWz3OwrwsPd96NEH46mN
 sCV1WnXZiRGs4CcFR1fJTycca2cu8ja4MIku9rMQhnToVNia1jQiVoJEcz5x8lYBdYYV
 RSFpT10MXF/hxpwm3buSoFHEmlHj/tq2uGow15h/Y77bf2qo3EeNAEQwqL8yiVXofgmK
 x5n/OCvctPamVfKRAbJq32GuImeU6O3ty9rQyKRVbo1MaPQVAHlada/DCZUcI2kZ5e9N
 URpw==
X-Gm-Message-State: AOAM5319ocoOaXqZMNvz0f9Qyu+9uGG1a3+64q8D22/345McYqFFh9td
 xD1+fe6GQBeME/mAH06GLS3lDR5nfNU=
X-Google-Smtp-Source: ABdhPJyOnt1C0UGlyVM9V11iwIlCTquf1UUGgxJHE68DIoxpaFPn7rSIXLpqIYb0zW06fz69QPwU/w==
X-Received: by 2002:a05:6000:1867:: with SMTP id
 d7mr2096900wri.199.1626082028821; 
 Mon, 12 Jul 2021 02:27:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e521:a414:2ae6:6045?
 ([2a02:908:1252:fb60:e521:a414:2ae6:6045])
 by smtp.gmail.com with ESMTPSA id z7sm11607961wmp.34.2021.07.12.02.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 02:27:08 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/ttm: Fix COW check
To: Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210708193621.2198733-1-alexander.deucher@amd.com>
 <20210708193621.2198733-2-alexander.deucher@amd.com>
 <a25f93e7-8c03-542c-f594-64a7c1fba292@gmail.com>
 <2fd0006e-f005-b11c-3918-a9d690a1831a@amd.com>
 <19fbefce-b9c8-8f22-2789-0eee8f58c61a@gmail.com>
 <98be904c-0bcb-fab2-8cbf-978aa161dc5a@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ca2be3f1-e1a2-055d-4742-ec52d60f9169@gmail.com>
Date: Mon, 12 Jul 2021 11:27:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <98be904c-0bcb-fab2-8cbf-978aa161dc5a@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Am 10.07.21 um 02:29 schrieb Felix Kuehling:
>
> On 2021-07-09 3:37 p.m., Christian König wrote:
>> Am 09.07.21 um 21:31 schrieb Felix Kuehling:
>>> On 2021-07-09 2:38 a.m., Christian König wrote:
>>>>
>>>>
>>>> Am 08.07.21 um 21:36 schrieb Alex Deucher:
>>>>> From: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>
>>>>> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
>>>>> is_cow_mapping returns true for these mappings. Add a check for
>>>>> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
>>>>> PROT_NONE mappings.
>>>>
>>>> I'm pretty sure that this is not working as expected.
>>>
>>> Not sure what you mean. Debugger access to the memory through the 
>>> PROT_NONE VMAs is definitely working, with both ptrace and 
>>> /proc/<pid>/mem.
>>>
>>>
>>>>
>>>>>
>>>>> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
>>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>> ---
>>>>> drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>>>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> index f56be5bc0861..a75e90c7d4aa 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> @@ -552,7 +552,7 @@ static const struct vm_operations_struct 
>>>>> ttm_bo_vm_ops = {
>>>>>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct 
>>>>> ttm_buffer_object *bo)
>>>>>   {
>>>>>       /* Enforce no COW since would have really strange behavior 
>>>>> with it. */
>>>>> -    if (is_cow_mapping(vma->vm_flags))
>>>>> +    if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
>>>>
>>>> is_cow_mapping() already checks for VM_MAYWRITE, so this here 
>>>> shouldn't be necessary.
>>>
>>> AFAICT, VM_MAYWRITE is not based on the PROT_... bits used to create 
>>> the VMA, but based on the permissions of the file. So as long as the 
>>> render node is writable, VM_MAYWRITE is set for all VMAs that map it.
>>>
>>> I would agree that it's probably a bad idea for the Thunk to map 
>>> these VMAs with MAP_PRIVATE. We can try changing the Thunk to use 
>>> MAP_SHARED for these PROT_NONE mappings. But that doesn't change the 
>>> fact that this kernel patch broke existing usermode.
>
> For the record, changing the Thunk to use MAP_SHARED works.
>
>
>>
>> Yeah, but see the discussion around MAP_PRIVATE and COW regarding 
>> this. What Thunk did here was a really bad idea.
>
> Hindsight ... Which part was a bad idea?
>
>  * Creating a PROT_NONE VMA? That's necessary to let ptrace or
>    /proc/<pid>/mem access the memory. It's a brilliant idea, IMHO
>  * Making that VMA MAP_PRIVATE? Probably a bad idea in hindsight. The
>    process itself can't access this memory, let alone write to it. So I
>    didn't think too much about whether to make it shared or private.
>    Either way, we are not causing any actual COW on these mappings
>    because they are not writable, and we never make them writable with
>    mprotect either
>  * Introducing a COW check after letting it slide for 15 years? It's a
>    reasonable check. In this case it catches a false positive. Had this
>    check been in place 4 or 5 years ago, it would have easily prevented
>    this mess

A combination of everything.

MAP_PRIVATE would have previously caused very odd behavior and/or a 
BUG_ON()/WARN_ON() in the VMA code (depending on platform).

MAP_PRIVATE + PROT_NONE kind of worked because it never faulted a page 
so we never actually triggered a COW.

>
>>
>> I think we have only two options here:
>> 1. Accept the breakage of thunk.
>
> Really?

Only as last resort, I'm running out of ideas how to fix this cleanly.

>
>
>> 2. Add a workaround in amdgpu/amdkfd to force MAP_PRIVATE into 
>> MAP_SHARED in the kernel.
>
> I tried to do this in amdgpu_gem_object_mmap and spent 4 hours 
> debugging why it doesn't work. It breaks because the 
> mapping->i_mmap_writable gets unbalanced and causes subsequent 
> mappings to fail when that atomic counter becomes negative (indicating 
> DENYWRITE). I could fix it by calling mapping_map_writable. But I 
> don't think this is intended as driver API. I see no precedent of any 
> driver calling this. For the record this works, but it feels fragile 
> and ugly:
>
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -255,6 +255,20 @@ static int amdgpu_gem_object_mmap(struct 
> drm_gem_object *obj, struct vm_area_str
>      if (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
>          return -EPERM;
>
> +    /* Workaround for Thunk bug creating PROT_NONE,MAP_PRIVATE mappings
> +     * for debugger access to invisible VRAM. Should have used 
> MAP_SHARED
> +     * instead.
> +     */
> +    if (is_cow_mapping(vma->vm_flags) &&
> +        !(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC))) {
> +        int ret;
> +
> +        ret = mapping_map_writable(vma->vm_file->f_mapping);
> +        if (ret)
> +            return ret;
> +        vma->vm_flags |= VM_SHARED | VM_MAYSHARE;
> +    }
> +

Yeah, I'm on another thread where we are discussing 
mapping_map_writable() for vma_set_file() as well.

> return drm_gem_ttm_mmap(obj, vma);
>  }
>
> 3. Improve my previous workaround by adding a similar check for COW in 
> ttm_bo_vm_ops.mprotect. I'll send an updated patch.

That has it's own issues, but going to reply there in detail.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>   Felix
>>>
>>>
>>>>
>>>> Christian.
>>>>
>>>>>           return -EINVAL;
>>>>>         ttm_bo_get(bo);
>>>>
>>

