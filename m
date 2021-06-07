Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10A739E2D8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 18:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24B06E922;
	Mon,  7 Jun 2021 16:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFC36E923
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 16:22:02 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id d184so60575wmd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 09:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=ZbfN1u89ctBxBR5eooH3ahTq+H5V5lBBxtIKJZytxVI=;
 b=rRaBMk3Ma83nNn0wkmxVjpM8MqbS87jdBrpSOC2K3fHWQl0i5RhTe7ZJssq8hsejIh
 AsCNmsY90HoODMN9gx7jZ62Y/QB3g0lvjxrjlqbHnarMBnM3WShUt/D2gr6eJwbjr0yl
 +heR4dnMLoLr0ZkssUQ2gNaqS403RMz7vZxJFGqKCpQ/PV+WbDRbIqcSKGke2YCre7Q8
 mCELMDJYryK3Xv8L7D7sLdTikO3Wp6nQae0uoxgIr3hsfoIvdyEgADIBT4zLHjVlbBcW
 xFSGdw4ej2UNBpjagwXztQm16Ve5bpj0pzWKc/dUQPx2w/eDxWMhPsoEDSHse4pt+1mV
 Rv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZbfN1u89ctBxBR5eooH3ahTq+H5V5lBBxtIKJZytxVI=;
 b=quNcF7MuN1Ch+Ql1xFay0YlEtjJteQrrM7VzMl/8j+fkpMBuGNs/9orm7NDVY4kQCN
 8fOfc5fdtxyEz2pp9MPThEmXinDn7+yyGzltYIETbN5IBgYNJP4r0MV1V/UDXyJpR6f/
 WifSiNJDbI2FmEulZVeHWov+QL2a08ijmWVUyzmqmziBgYkBAJmku2eueMHVGFMdNvna
 pQctXS2AGByhEFTHJHOPsFOCUHaEqWKET/aDGgp6GwVOIheC8YFdg+LQdFXwx7Vhq8EQ
 NqztmzX3nQ9WCf7jNpaK2f2+8g5aPs2xR0p9EC25bEtxOkOwklqqbxAGuQOQqI7kPKsE
 1Miw==
X-Gm-Message-State: AOAM533Sr7x3juUyxrEj+E1uZjeu79ObBKhNIzjMXKH4+ans0D0sa80c
 JBQTJV4yS47t7UqhijqiRBvCF1dV0Jk=
X-Google-Smtp-Source: ABdhPJzbplwNcB4eowpJVzisKxa0gX6CvV2Z8H0L7AAtcqDo+OuejPdweCUy6M4J48yk6pyZAEwkTA==
X-Received: by 2002:a1c:a785:: with SMTP id q127mr1756570wme.152.1623082921596; 
 Mon, 07 Jun 2021 09:22:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:ce67:4e4d:875d:ffeb?
 ([2a02:908:1252:fb60:ce67:4e4d:875d:ffeb])
 by smtp.gmail.com with ESMTPSA id v17sm7903272wrp.36.2021.06.07.09.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 09:22:01 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings v2
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 thomas.hellstrom@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20210607135830.8574-1-christian.koenig@amd.com>
 <2e0ebce3-2519-2db3-f803-589d03a0d4c2@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0a2add50-99c7-8363-1030-31f8d82ac0c6@gmail.com>
Date: Mon, 7 Jun 2021 18:21:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2e0ebce3-2519-2db3-f803-589d03a0d4c2@shipmail.org>
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



Am 07.06.21 um 18:13 schrieb Thomas Hellström (Intel):
>
> On 6/7/21 3:58 PM, Christian König wrote:
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
>> Also make sure to reject mappings without VM_SHARED.
>>
>> v2: reject COW mappings, merge function with only caller
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Bugs: https://gitlab.freedesktop.org/drm/amd/-/issues/1606#note_936174
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 44 +++++++++++----------------------
>>   1 file changed, 14 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index 61828488ae2b..c9edb75626d9 100644
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
>> @@ -560,8 +549,16 @@ static const struct vm_operations_struct 
>> ttm_bo_vm_ops = {
>>       .access = ttm_bo_vm_access,
>>   };
>>   -static void ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo, 
>> struct vm_area_struct *vma)
>> +int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct 
>> ttm_buffer_object *bo)
>>   {
>> +    /* Enforce VM_SHARED here since without it we would have really 
>> strange
>> +     * behavior on COW.
>> +     */
>
> Nit: Perhaps "Enforce no COW.." since mappings are allowed with 
> VM_SHARED iff VM_MAYWRITE is not set. Also style consistency with 
> comments: First /* followed by line-break or are you adapting the 
> above style for ttm?

Good point and no not really. I just sometimes forget to hit enter here 
and we don't have any automated script complaining.

>
> With that fixed,
>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Thanks,
Christian.

>
>
>> +    if (is_cow_mapping(vma->vm_flags))
>> +        return -EINVAL;
>> +
>> +    ttm_bo_get(bo);
>> +
>>       /*
>>        * Drivers may want to override the vm_ops field. Otherwise we
>>        * use TTM's default callbacks.
>> @@ -576,21 +573,8 @@ static void ttm_bo_mmap_vma_setup(struct 
>> ttm_buffer_object *bo, struct vm_area_s
>>         vma->vm_private_data = bo;
>>   -    /*
>> -     * We'd like to use VM_PFNMAP on shared mappings, where
>> -     * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
>> -     * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
>> -     * bad for performance. Until that has been sorted out, use
>> -     * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
>> -     */
>> -    vma->vm_flags |= VM_MIXEDMAP;
>> +    vma->vm_flags |= VM_PFNMAP;
>>       vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
>> -}
>> -
>> -int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct 
>> ttm_buffer_object *bo)
>> -{
>> -    ttm_bo_get(bo);
>> -    ttm_bo_mmap_vma_setup(bo, vma);
>>       return 0;
>>   }
>>   EXPORT_SYMBOL(ttm_bo_mmap_obj);

