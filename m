Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E0D398812
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 13:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F276EA38;
	Wed,  2 Jun 2021 11:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E6B6E950
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 11:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 27ECA3FBA0;
 Wed,  2 Jun 2021 13:24:15 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="KiKG9Cfw";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: 0.6
X-Spam-Level: 
X-Spam-Status: No, score=0.6 tagged_above=-999 required=6.31
 tests=[BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vG5dzp_s6T75; Wed,  2 Jun 2021 13:24:12 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 5B98D3FB81;
 Wed,  2 Jun 2021 13:24:10 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C095636012A;
 Wed,  2 Jun 2021 13:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1622633049; bh=cNrhYnIeyHi/A8OalnrZWAhLYUne2cTY1lSZo3xw5g8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KiKG9CfwYh+s+nbW6oR+JUcLfNjLJqAkpk6+V4dkRl0bq3X8DEjzky9Np6v/z6yJO
 5dcZKn2c6KB5/ts4s6hEuP38HfE76ARJtkWv3mzH6IUV6tpgfKbG/BtgBzdRVa20ji
 HqPUl5V1niU6L5GawNDARw9HB1dfhTOXuR8DXPCs=
Subject: Re: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 daniel@ffwll.ch, jgg@ziepe.ca, thomas.hellstrom@linux.intel.com
References: <20210602083013.1561-1-christian.koenig@amd.com>
 <54c5dc94-b367-70dd-ca8f-afcbda7598c6@shipmail.org>
 <001df485-eed3-3638-0464-9a2ab67ac73f@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <32d661ae-1eab-918d-cd98-40109e6073df@shipmail.org>
Date: Wed, 2 Jun 2021 13:24:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <001df485-eed3-3638-0464-9a2ab67ac73f@gmail.com>
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

Hi,

On 6/2/21 12:03 PM, Christian König wrote:
>
>
> Am 02.06.21 um 11:07 schrieb Thomas Hellström (Intel):
>>
>> On 6/2/21 10:30 AM, Christian König wrote:
>>> We discussed if that is really the right approach for quite a while 
>>> now, but
>>> digging deeper into a bug report on arm turned out that this is 
>>> actually
>>> horrible broken right now.
>>>
>>> The reason for this is that vmf_insert_mixed_prot() always tries to 
>>> grab
>>> a reference to the underlaying page on architectures without
>>> ARCH_HAS_PTE_SPECIAL and as far as I can see also enabled GUP.
>>>
>>> So nuke using VM_MIXEDMAP here and use VM_PFNMAP instead.
>>>
>>> Also set VM_SHARED, not 100% sure if that is needed with VM_PFNMAP, 
>>> but better
>>> save than sorry.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Bugs: https://gitlab.freedesktop.org/drm/amd/-/issues/1606#note_936174
>>> ---
>>>   drivers/gpu/drm/ttm/ttm_bo_vm.c | 29 +++++++----------------------
>>>   1 file changed, 7 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c 
>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index 9bd15cb39145..bf86ae849340 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -359,12 +359,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct 
>>> vm_fault *vmf,
>>>            * at arbitrary times while the data is mmap'ed.
>>>            * See vmf_insert_mixed_prot() for a discussion.
>>>            */
>>> -        if (vma->vm_flags & VM_MIXEDMAP)
>>> -            ret = vmf_insert_mixed_prot(vma, address,
>>> -                            __pfn_to_pfn_t(pfn, PFN_DEV),
>>> -                            prot);
>>> -        else
>>> -            ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>> +        ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>
>> I think vmwgfx still uses MIXEDMAP. (Which is ofc same bug and should 
>> be changed).
>
> Mhm, the only thing I could find is that it is clearing VM_MIXEDMAP 
> and adding VM_PFNMAP instead.
>
> But going to clean that up as well.
>
>>
>>>             /* Never error on prefaulted PTEs */
>>>           if (unlikely((ret & VM_FAULT_ERROR))) {
>>> @@ -411,15 +406,9 @@ vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault 
>>> *vmf, pgprot_t prot)
>>>       pfn = page_to_pfn(page);
>>>         /* Prefault the entire VMA range right away to avoid further 
>>> faults */
>>> -    for (address = vma->vm_start; address < vma->vm_end; address += 
>>> PAGE_SIZE) {
>>> -
>>> -        if (vma->vm_flags & VM_MIXEDMAP)
>>> -            ret = vmf_insert_mixed_prot(vma, address,
>>> -                            __pfn_to_pfn_t(pfn, PFN_DEV),
>>> -                            prot);
>>> -        else
>>> -            ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>> -    }
>>> +    for (address = vma->vm_start; address < vma->vm_end;
>>> +         address += PAGE_SIZE)
>>> +        ret = vmf_insert_pfn_prot(vma, address, pfn, prot);
>>>         return ret;
>>>   }
>>> @@ -576,14 +565,10 @@ static void ttm_bo_mmap_vma_setup(struct 
>>> ttm_buffer_object *bo, struct vm_area_s
>>>         vma->vm_private_data = bo;
>>>   -    /*
>>> -     * We'd like to use VM_PFNMAP on shared mappings, where
>>> -     * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
>>> -     * but for some reason VM_PFNMAP + x86 PAT + write-combine is very
>>> -     * bad for performance. Until that has been sorted out, use
>>> -     * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
>>> +    /* Enforce VM_SHARED here since no driver backend actually 
>>> supports COW
>>> +     * on TTM buffer object mappings.
>>
>> I think by default all TTM drivers support COW mappings in the sense 
>> that written data never makes it to the bo but stays in anonymous 
>> pages, although I can't find a single usecase. So comment should be 
>> changed to state that they are useless for us and that we can't 
>> support COW mappings with VM_PFNMAP.
>
> Well the problem I see with that is that it only works as long as the 
> BO is in system memory. When it then suddenly migrates to VRAM 
> everybody sees the same content again and the COW pages are dropped. 
> That is really inconsistent and I can't see why we would want to do that.
Hmm, yes, that's actually a bug in drm_vma_manager().
>
> Additionally to that when you allow COW mappings you need to make sure 
> your COWed pages have the right caching attribute and that the 
> reference count is initialized and taken into account properly. Not 
> driver actually gets that right at the moment.

I was under the impression that COW'ed pages were handled transparently 
by the vm, you'd always get cached properly refcounted COW'ed pages but 
anyway since we're going to ditch support for them, doesn't really matter.

>
>>
>>>        */
>>> -    vma->vm_flags |= VM_MIXEDMAP;
>>> +    vma->vm_flags |= VM_PFNMAP | VM_SHARED;
>>
>> Hmm, shouldn't we refuse COW mappings instead, like my old patch on 
>> this subject did? In theory someone could be setting up what she 
>> thinks is a private mapping to a shared buffer object, and write 
>> sensitive data to it, which will immediately leak. It's a simple 
>> check, could open-code if necessary.
>
> Yeah, though about that as well. Rejecting things would mean we 
> potentially break userspace which just happened to work by coincident 
> previously. Not totally evil, but not nice either.
>
> How about we do a WARN_ON_ONCE(!(vma->vm_flags & VM_SHARED)); instead?

Umm, yes but that wouldn't notify the user, and would be triggerable 
from user-space. But you can also set up legal non-COW mappings without 
the VM_SHARED flag, IIRC, see is_cow_mapping(). I think when this was up 
for discussion last time we arrived in a vma_is_cow_mapping() utility...

/Thomas


