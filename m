Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3CB5537B2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 18:16:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CB610E784;
	Tue, 21 Jun 2022 16:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD9F10E784
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655828181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RwLy+hOWwP5FbU2Crq9y/6pW3fx4muag+nOZQ5x5cn4=;
 b=V5Koh4ik7Ws4NMNLyzQKTbJQBkbT0QAcugdh0+WG855SRfe6Mf4dQpw+bGELdYXuQH/UIk
 iV9NwZg1IbBw9fJUbDJa94Lg125kv0kh5UXdQqyae6/N7y+5jBBTAIGHtmYxNhdjMItxFE
 WmEuRx1+fTpL5N8rY1UHMvPQI+xghC0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-GkufVSthPTuxFpIIWt1_fw-1; Tue, 21 Jun 2022 12:16:19 -0400
X-MC-Unique: GkufVSthPTuxFpIIWt1_fw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i16-20020adfa510000000b0021b8e9f7666so1772083wrb.19
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 09:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RwLy+hOWwP5FbU2Crq9y/6pW3fx4muag+nOZQ5x5cn4=;
 b=naxY6oJ6kzqFCk7KEhjmu1y9GZ3GwWUr5JtJm/G/OMMRBzsCd1yKSAFdQjB3FzMnME
 6Z7RhRlWt3vcm5mNoFxqGYQ8SHmfIqTcM3uLYEzgp4iqPpLxEeZvDcgCMFbjzFQ5P2DI
 KZXhyzgIIeUOFHtHedAi8iN297VnrMwD+8Jn+MCJZaLGMj9JNL0ah5eAzQlslyRFzBzy
 wJxwKijyy3rBPqgrzTgZzPUKA2ZHqdE0AafZTeBuvpMFbSMce7WiQuHr3MMNBxx0EffD
 SXvznkz5u4gv6UBCZQBNI0eNO6wxUKTeHMLgcwa9wDVIJc9lMajtiUVXSozD262gY3UE
 LjkQ==
X-Gm-Message-State: AJIora9IVMunXDFdWmjC0tX5PS+vFhaoBRfUlN3dvnXHMLcDUXlRZP7q
 uJf/4tvKo3VXQHk6wSvtuFPafuAjeRDvQWZLvpd/nSG1clqxVS2moUK/Ww/fjO1P3o4UqTkZfb8
 FH0X0kmcL6891g1MK3bWTeCsQLVAT
X-Received: by 2002:a05:600c:19c7:b0:39c:30b0:2b05 with SMTP id
 u7-20020a05600c19c700b0039c30b02b05mr30629345wmq.170.1655828178413; 
 Tue, 21 Jun 2022 09:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tAWni8hyPV8TbSJV/Ocm36yX6qM2eaxdmsvc3amudPpLpQnsE6vMObNr86XnC4m44gSnpGBQ==
X-Received: by 2002:a05:600c:19c7:b0:39c:30b0:2b05 with SMTP id
 u7-20020a05600c19c700b0039c30b02b05mr30629303wmq.170.1655828178048; 
 Tue, 21 Jun 2022 09:16:18 -0700 (PDT)
Received: from ?IPV6:2003:c2:2f1f:ac66:57dc:780a:4976:afe6?
 (p200300c22f1fac6657dc780a4976afe6.dip0.t-ipconnect.de.
 [2003:c2:2f1f:ac66:57dc:780a:4976:afe6])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c502500b0039c5cecf206sm19514569wmr.4.2022.06.21.09.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 09:16:17 -0700 (PDT)
Message-ID: <01cf9f24-d7fc-61e9-1c28-85dc5aabe645@redhat.com>
Date: Tue, 21 Jun 2022 18:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>,
 Alistair Popple <apopple@nvidia.com>
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <7605beee-0a76-4ee9-e950-17419630f2cf@redhat.com>
 <ddcebcc1-fb0a-e565-f14d-77c9d48f2928@amd.com>
 <6aef4b7f-0ced-08cd-1f0c-50c22996aa41@redhat.com>
 <65987ab8-426d-e533-0295-069312b4f751@amd.com>
 <34e94bdb-675a-5d5c-6137-8aa1ee658d49@redhat.com>
 <87letq6wb5.fsf@nvdebian.thelocal>
 <643c44e7-48be-375b-c7ab-6a30b5ee2937@redhat.com>
 <f5b9f777-85a2-9c38-17f3-0c9be1eeb867@amd.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <f5b9f777-85a2-9c38-17f3-0c9be1eeb867@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: rcampbell@nvidia.com, willy@infradead.org,
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.06.22 18:08, Sierra Guiza, Alejandro (Alex) wrote:
> 
> On 6/21/2022 7:25 AM, David Hildenbrand wrote:
>> On 21.06.22 13:55, Alistair Popple wrote:
>>> David Hildenbrand<david@redhat.com>  writes:
>>>
>>>> On 21.06.22 13:25, Felix Kuehling wrote:
>>>>> Am 6/17/22 um 23:19 schrieb David Hildenbrand:
>>>>>> On 17.06.22 21:27, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>> On 6/17/2022 12:33 PM, David Hildenbrand wrote:
>>>>>>>> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>>>>>>>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>>>>>>>>> Device memory that is cache coherent from device and CPU point of view.
>>>>>>>>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>>>>>>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>>>>>>>>> no one should be allowed to pin such memory so that it can always be
>>>>>>>>>>> evicted.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Alex Sierra<alex.sierra@amd.com>
>>>>>>>>>>> Acked-by: Felix Kuehling<Felix.Kuehling@amd.com>
>>>>>>>>>>> Reviewed-by: Alistair Popple<apopple@nvidia.com>
>>>>>>>>>>> [hch: rebased ontop of the refcount changes,
>>>>>>>>>>>           removed is_dev_private_or_coherent_page]
>>>>>>>>>>> Signed-off-by: Christoph Hellwig<hch@lst.de>
>>>>>>>>>>> ---
>>>>>>>>>>>      include/linux/memremap.h | 19 +++++++++++++++++++
>>>>>>>>>>>      mm/memcontrol.c          |  7 ++++---
>>>>>>>>>>>      mm/memory-failure.c      |  8 ++++++--
>>>>>>>>>>>      mm/memremap.c            | 10 ++++++++++
>>>>>>>>>>>      mm/migrate_device.c      | 16 +++++++---------
>>>>>>>>>>>      mm/rmap.c                |  5 +++--
>>>>>>>>>>>      6 files changed, 49 insertions(+), 16 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>>>>>>> index 8af304f6b504..9f752ebed613 100644
>>>>>>>>>>> --- a/include/linux/memremap.h
>>>>>>>>>>> +++ b/include/linux/memremap.h
>>>>>>>>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>>>>>>>>       * A more complete discussion of unaddressable memory may be found in
>>>>>>>>>>>       * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>>>>>>>>       *
>>>>>>>>>>> + * MEMORY_DEVICE_COHERENT:
>>>>>>>>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>>>>>>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>>>>>>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>>>>>>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>>>>>>>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>>>>>>>>> like vdso, shared zeropage, ... pinned pages ...
>>>>>>>> Well, you cannot migrate long term pages, that's what I meant :)
>>>>>>>>
>>>>>>>>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>>>>>>>>> + *
>>>>>>>>>>>       * MEMORY_DEVICE_FS_DAX:
>>>>>>>>>>>       * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>>>>>>>>       * coherent and supports page pinning. In support of coordinating page
>>>>>>>>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>>>>>>>>      enum memory_type {
>>>>>>>>>>>      	/* 0 is reserved to catch uninitialized type fields */
>>>>>>>>>>>      	MEMORY_DEVICE_PRIVATE = 1,
>>>>>>>>>>> +	MEMORY_DEVICE_COHERENT,
>>>>>>>>>>>      	MEMORY_DEVICE_FS_DAX,
>>>>>>>>>>>      	MEMORY_DEVICE_GENERIC,
>>>>>>>>>>>      	MEMORY_DEVICE_PCI_P2PDMA,
>>>>>>>>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>>>>>>>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> However, where exactly is pinning forbidden?
>>>>>>>>> Long-term pinning is forbidden since it would interfere with the device
>>>>>>>>> memory manager owning the
>>>>>>>>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>>>>>>>>> is allowed on this device type.
>>>>>>>> I don't see updates to folio_is_pinnable() in this patch.
>>>>>>> Device coherent type pages should return true here, as they are pinnable
>>>>>>> pages.
>>>>>> That function is only called for long-term pinnings in try_grab_folio().
>>>>>>
>>>>>>>> So wouldn't try_grab_folio() simply pin these pages? What am I missing?
>>>>>>> As far as I understand this return NULL for long term pin pages.
>>>>>>> Otherwise they get refcount incremented.
>>>>>> I don't follow.
>>>>>>
>>>>>> You're saying
>>>>>>
>>>>>> a) folio_is_pinnable() returns true for device coherent pages
>>>>>>
>>>>>> and that
>>>>>>
>>>>>> b) device coherent pages don't get long-term pinned
>>>>>>
>>>>>>
>>>>>> Yet, the code says
>>>>>>
>>>>>> struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
>>>>>> {
>>>>>> 	if (flags & FOLL_GET)
>>>>>> 		return try_get_folio(page, refs);
>>>>>> 	else if (flags & FOLL_PIN) {
>>>>>> 		struct folio *folio;
>>>>>>
>>>>>> 		/*
>>>>>> 		 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
>>>>>> 		 * right zone, so fail and let the caller fall back to the slow
>>>>>> 		 * path.
>>>>>> 		 */
>>>>>> 		if (unlikely((flags & FOLL_LONGTERM) &&
>>>>>> 			     !is_pinnable_page(page)))
>>>>>> 			return NULL;
>>>>>> 		...
>>>>>> 		return folio;
>>>>>> 	}
>>>>>> }
>>>>>>
>>>>>>
>>>>>> What prevents these pages from getting long-term pinned as stated in this patch?
>>>>> Long-term pinning is handled by __gup_longterm_locked, which migrates
>>>>> pages returned by __get_user_pages_locked that cannot be long-term
>>>>> pinned. try_grab_folio is OK to grab the pages. Anything that can't be
>>>>> long-term pinned will be migrated afterwards, and
>>>>> __get_user_pages_locked will be retried. The migration of
>>>>> DEVICE_COHERENT pages was implemented by Alistair in patch 5/13
>>>>> ("mm/gup: migrate device coherent pages when pinning instead of failing").
>>>> Thanks.
>>>>
>>>> __gup_longterm_locked()->check_and_migrate_movable_pages()
>>>>
>>>> Which checks folio_is_pinnable() and doesn't do anything if set.
>>>>
>>>> Sorry to be dense here, but I don't see how what's stated in this patch
>>>> works without adjusting folio_is_pinnable().
>>> Ugh, I think you might be right about try_grab_folio().
>>>
>>> We didn't update folio_is_pinnable() to include device coherent pages
>>> because device coherent pages are pinnable. It is really just
>>> FOLL_LONGTERM that we want to prevent here.
>>>
>>> For normal PUP that is done by my change in
>>> check_and_migrate_movable_pages() which migrates pages being pinned with
>>> FOLL_LONGTERM. But I think I incorrectly assumed we would take the
>>> pte_devmap() path in gup_pte_range(), which we don't for coherent pages.
>>> So I think the check in try_grab_folio() needs to be:
>> I think I said it already (and I might be wrong without reading the
>> code), but folio_is_pinnable() is *only* called for long-term pinnings.
>>
>> It should actually be called folio_is_longterm_pinnable().
>>
>> That's where that check should go, no?
> 
> David, I think you're right. We didn't catch this since the LONGTERM gup 
> test we added to hmm-test only calls to pin_user_pages. Apparently 
> try_grab_folio is called only from fast callers (ex. 
> pin_user_pages_fast/get_user_pages_fast). I have added a conditional 
> similar to what Alistair has proposed to return null on LONGTERM && 
> (coherent_pages || folio_is_pinnable) at try_grab_folio. Also a new gup 
> test was added with LONGTERM set that calls pin_user_pages_fast. 
> Returning null under this condition it does causes the migration from 
> dev to system memory.
> 

Why can't coherent memory simply put its checks into
folio_is_pinnable()? I don't get it why we have to do things differently
here.

> Actually, Im having different problems with a call to PageAnonExclusive 
> from try_to_migrate_one during page fault from a HMM test that first 
> migrate pages to device private and forks to mark as COW these pages. 
> Apparently is catching the first BUG VM_BUG_ON_PGFLAGS(!PageAnon(page), 
> page)

With or without this series? A backtrace would be great.

-- 
Thanks,

David / dhildenb

