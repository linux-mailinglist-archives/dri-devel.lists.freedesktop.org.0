Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B077E3985D2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D05D6EC33;
	Wed,  2 Jun 2021 10:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB77A6EC27
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 10:03:02 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id cb9so2242200edb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/JuZ7hnkETZ24SR+e1OTLhSlydjeqwpNk8rAtc6WaJA=;
 b=rb7swQGc9qqja7idI4MnGE1YTodHxbCPUYq4g8uyrYpesrK8G/tgJgnP5js14kgK8J
 pjzhSFL8q4/OBexlmqUXvrcD1re0r2eMSC4KMI1bzUysXIstnLphktkEe9a+uW8PMSkH
 URaC96Yy5OjsfhSIu1VouYAw4YeNmUei0ZavlIpbihZrAgB87Q2026uiw2j+bVbLzFdF
 t+gKZQQ0X9uaknJQCkA1IvQhWW787EIW2j6NJL3f6qhygE9YiH2BR6cAU5XZf9MDw7KP
 JnRkUMkjeLaUnZmH93QwmJ91eF3P+8td1hxtvlLC9L78gDP1x10HA2c/NMEr4E3iAzZW
 Fw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/JuZ7hnkETZ24SR+e1OTLhSlydjeqwpNk8rAtc6WaJA=;
 b=p1t+n7PKI4CZfCq+9G7bdWjGJjZb2mrhgKTTxR/XPdJ6PURBiq65/ttf8VaqhzsHz0
 cZ0xD8/B0tu1k8nS8G3SwmEwTBP+DD0W8yZUDbDSTDWxDjRJ5nnCGyGANpg/2QxMhsPp
 Ry7OOXfYZ96Ko+MmrrvyOqWjae+2jqmStw5gHoFGUsGcXHUiQb+Zp4oTZIJtlkfWdAxu
 iJ83UqnxOG1Qta1tPfKoR/4WMK329G1IbWomDDJ6qT1dwQ2qZrFTGaxp5yjytVur6Nka
 UWl4O+ymi+agO2fQeW7yNpsKiUjkH1hwZ5SpBpRieafFlOUPzUz2g087aibSbGKKsuvQ
 qdpA==
X-Gm-Message-State: AOAM531FUciJBZBZkckeba53MktWUyqw3MVMjo4y/pTbT7nxSEjhTGHY
 /qancXqVAJ6BBw3pD8JKoTmBAdQyPx8=
X-Google-Smtp-Source: ABdhPJyw0RTo6HxkBO8klfkndWi18QaKl/YXcc9hMbBTgfo2WER4Ns3EHVUMeugMXkb+OEdtGAHg9A==
X-Received: by 2002:aa7:c705:: with SMTP id i5mr13799121edq.222.1622628181411; 
 Wed, 02 Jun 2021 03:03:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:cd07:2759:3eec:1d00?
 ([2a02:908:1252:fb60:cd07:2759:3eec:1d00])
 by smtp.gmail.com with ESMTPSA id gn25sm1752380ejc.112.2021.06.02.03.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 03:03:01 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 daniel@ffwll.ch, jgg@ziepe.ca, thomas.hellstrom@linux.intel.com
References: <20210602083013.1561-1-christian.koenig@amd.com>
 <54c5dc94-b367-70dd-ca8f-afcbda7598c6@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <001df485-eed3-3638-0464-9a2ab67ac73f@gmail.com>
Date: Wed, 2 Jun 2021 12:03:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <54c5dc94-b367-70dd-ca8f-afcbda7598c6@shipmail.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 02.06.21 um 11:07 schrieb Thomas Hellström (Intel):
>
> On 6/2/21 10:30 AM, Christian König wrote:
>> We discussed if that is really the right approach for quite a while 
>> now, but
>> digging deeper into a bug report on arm turned out that this is actually
>> horrible broken right now.
>>
>> The reason for this is that vmf_insert_mixed_prot() always tries to grab
>> a reference to the underlaying page on architectures without
>> ARCH_HAS_PTE_SPECIAL and as far as I can see also enabled GUP.
>>
>> So nuke using VM_MIXEDMAP here and use VM_PFNMAP instead.
>>
>> Also set VM_SHARED, not 100% sure if that is needed with VM_PFNMAP, 
>> but better
>> save than sorry.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Bugs: https://gitlab.freedesktop.org/drm/amd/-/issues/1606#note_936174
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 29 +++++++----------------------
>>   1 file changed, 7 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index 9bd15cb39145..bf86ae849340 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -359,12 +359,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>> vm_fault *vmf,
>>            * at arbitrary times while the data is mmap'ed.
>>            * See vmf_insert_mixed_prot() for a discussion.
>>            */
>> -        if (vma->vm_flags & VM_MIXEDMAP)
>> -            ret = vmf_insert_mixed_prot(vma, address,
>> -                            __pfn_to_pfn_t(pfn, PFN_DEV),
>> -                            prot);
>> -        else
>> -            ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>> +        ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>
> I think vmwgfx still uses MIXEDMAP. (Which is ofc same bug and should 
> be changed).

Mhm, the only thing I could find is that it is clearing VM_MIXEDMAP and 
adding VM_PFNMAP instead.

But going to clean that up as well.

>
>>             /* Never error on prefaulted PTEs */
>>           if (unlikely((ret & VM_FAULT_ERROR))) {
>> @@ -411,15 +406,9 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault 
>> *vmf, pgprot_t prot)
>>       pfn = page_to_pfn(page);
>>         /* Prefault the entire VMA range right away to avoid further 
>> faults */
>> -    for (address = vma->vm_start; address < vma->vm_end; address += 
>> PAGE_SIZE) {
>> -
>> -        if (vma->vm_flags & VM_MIXEDMAP)
>> -            ret = vmf_insert_mixed_prot(vma, address,
>> -                            __pfn_to_pfn_t(pfn, PFN_DEV),
>> -                            prot);
>> -        else
>> -            ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>> -    }
>> +    for (address = vma->vm_start; address < vma->vm_end;
>> +         address += PAGE_SIZE)
>> +        ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>         return ret;
>>   }
>> @@ -576,14 +565,10 @@ static void ttm_bo_mmap_vma_setup(struct 
>> ttm_buffer_object *bo, struct vm_area_s
>>         vma->vm_private_data = bo;
>>   -    /*
>> -     * We'd like to use VM_PFNMAP on shared mappings, where
>> -     * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
>> -     * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
>> -     * bad for performance. Until that has been sorted out, use
>> -     * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
>> +    /* Enforce VM_SHARED here since no driver backend actually 
>> supports COW
>> +     * on TTM buffer object mappings.
>
> I think by default all TTM drivers support COW mappings in the sense 
> that written data never makes it to the bo but stays in anonymous 
> pages, although I can't find a single usecase. So comment should be 
> changed to state that they are useless for us and that we can't 
> support COW mappings with VM_PFNMAP.

Well the problem I see with that is that it only works as long as the BO 
is in system memory. When it then suddenly migrates to VRAM everybody 
sees the same content again and the COW pages are dropped. That is 
really inconsistent and I can't see why we would want to do that.

Additionally to that when you allow COW mappings you need to make sure 
your COWed pages have the right caching attribute and that the reference 
count is initialized and taken into account properly. Not driver 
actually gets that right at the moment.

>
>>        */
>> -    vma->vm_flags |= VM_MIXEDMAP;
>> +    vma->vm_flags |= VM_PFNMAP | VM_SHARED;
>
> Hmm, shouldn't we refuse COW mappings instead, like my old patch on 
> this subject did? In theory someone could be setting up what she 
> thinks is a private mapping to a shared buffer object, and write 
> sensitive data to it, which will immediately leak. It's a simple 
> check, could open-code if necessary.

Yeah, though about that as well. Rejecting things would mean we 
potentially break userspace which just happened to work by coincident 
previously. Not totally evil, but not nice either.

How about we do a WARN_ON_ONCE(!(vma->vm_flags & VM_SHARED)); instead?

Thanks,
Christian.

>
>>       vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>>   }
>
> /Thomas
>
>

