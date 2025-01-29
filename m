Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BAEA2217A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 17:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B8410E831;
	Wed, 29 Jan 2025 16:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R2QTyrAF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3559010E109
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738167227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Kb3zTxBCC6THhW70RVY9Rp+026e8CWg8Ogw+Sa+ACUA=;
 b=R2QTyrAFB3tW2vHVFPdGABuSWH+Fv7lcArAmf8M/Grv1pbg6qJJluGiBbmRZsDOxAfsDqL
 wKxxytohzkGcFOroykui7hpPChEOs+exx8K5Cze8Gsv4OEZB8g6NN+wkjGWH89H8yy6t0k
 y2EhVbYE//JIlzdJctIYzyElhEdu3tI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-Vv-Fd3l_Py6zUkzDzEwHgw-1; Wed, 29 Jan 2025 11:13:44 -0500
X-MC-Unique: Vv-Fd3l_Py6zUkzDzEwHgw-1
X-Mimecast-MFC-AGG-ID: Vv-Fd3l_Py6zUkzDzEwHgw
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4362552ce62so34195175e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 08:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738167223; x=1738772023;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kb3zTxBCC6THhW70RVY9Rp+026e8CWg8Ogw+Sa+ACUA=;
 b=XvEjX2ygG9pvJzvvn2bnvsxSHszYHuWBvdjdjEyTEcMV7u1CQ/sTgOS0JqxyDiya5w
 F08yeontTeZWejIYcNC6lD9bHib3+GtCdHZFN/VrWSN9gIyNwoKLKWM2VY+bKJOSXYuA
 4C3EQS66ii2qrkeyj+QZWlxitlplOiSlul00IhgaIy1M78eBpEItSuUQVQG+xKES8JLv
 SM/oLo6pvLxtRSlf0sIQ4qZ+swhJgr1Ppcwr7qzYgqNWDbUKSCBYIHGxwcEN9kGYAeZV
 AGHlruL+A5/XtHsLenoI1KrCRQgWEwtX6mcQgpRTnJj53JtKiLdLf+BBl6WFcZSCO6S5
 og6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgjyHW6jvphHRh0sUYRaHow6djRQ1cDqMn9nu0cZa0pGkB/Xl6XJYdFk3DnUEtlevpNmvfECGKBYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4thJIHsyz7cfsjgloBYmasoRqzhdTklnHwIz4KvAEDgdOMzIh
 RpP0wkeBhIMQOEyeutH0UFzfXth9Qv2GiAmh3YIXqcFLh7FCZzLxgsX4fzM4GRSiv6U8WFTqQsv
 hepVf5prczy9vmw/udQCowuIWclpc2nV45LoT6fFIZeF6ro5sv1I0S2slZXySAN09cTra+AJeuH
 5z
X-Gm-Gg: ASbGncv4e5KNxl4Us9W/gLcVo84pW7du6Xhrh5AaXgOFUwKVqHkHraZD550NX/vDOfc
 00EHLia3XgJZqIoApKvbPPTw2lr7GywOObae4ckl4NUgavpHhjpZT3bI/UjqzoDAo6nxetM5iNp
 J5hHUdf1nj8wnY0KNGqWpT9fk7AILAHSahQerEyTNr+eME5tvtgPYDBGfRrAyrjbvn9mjuCA1LM
 7N/zHz806OLTaflUQg6JBT43cPcVNCOjTX2GTT7Ib6TBDir15RNx5LHz9ZSSwXhhB02sIq61BWq
 iRkCR5Hc+5Dkhb1Cyn8OKbJicHK4P0IyELhjue+j+6OEcspm+bLiYfDUlDWONZ1rtagBM5eOSbt
 /8IhaRDx36YSYOINJ9uHBx9b82xQiYpmg
X-Received: by 2002:a05:600c:4e01:b0:435:136:75f6 with SMTP id
 5b1f17b1804b1-438dc34b179mr35955275e9.0.1738167223425; 
 Wed, 29 Jan 2025 08:13:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERThuAB6HB630IBL71I6PXg4Ge8Wu2EWkINxaot7DRnv3BDYgceEpRtMXIjC4rFbds62QiZQ==
X-Received: by 2002:a05:600c:4e01:b0:435:136:75f6 with SMTP id
 5b1f17b1804b1-438dc34b179mr35954925e9.0.1738167222991; 
 Wed, 29 Jan 2025 08:13:42 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:3b00:64b8:6719:5794:bf13?
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438d7aac93asm44293805e9.1.2025.01.29.08.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 08:13:42 -0800 (PST)
Message-ID: <8dfe1dd5-f4a7-4b8a-92c7-278519ee4c58@redhat.com>
Date: Wed, 29 Jan 2025 17:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] Are "device exclusive non-swap entries" / "SVM atomics
 in Nouveau" still getting used in practice?
To: Alistair Popple <apopple@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, John Hubbard
 <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <Z5JbYC2-slPU0l3n@phenom.ffwll.local>
 <8c6f3838-f194-4a42-845d-10011192a234@redhat.com>
 <Z5OxuGMGT-OvMy5P@phenom.ffwll.local>
 <f2f059a3-0c95-44cf-b79a-8c01e9334919@redhat.com>
 <fbwjse2zexcsxuro5w3a5vs2rq4eabpccfkbd3buc4qmkgoo7z@xpdtyukllzvo>
 <Z5k6w1OZ1ttgTGRo@phenom.ffwll.local>
 <ded68896-d682-4fb3-8693-4657aa90b313@redhat.com>
 <Z5oHY1pjjwBfRN1g@phenom.ffwll.local> <Z5oQ2YV1cRUc0KnD@phenom.ffwll.local>
 <c7891b99-3001-4d70-8673-8a76357db0bf@redhat.com>
 <Z5o1taCb6moJdPXW@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5o1taCb6moJdPXW@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _QXJZNgt0D5HMUkId3MTB0mVIemIPqXMHe109k4K4YA_1738167223
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.01.25 15:05, Simona Vetter wrote:
> On Wed, Jan 29, 2025 at 12:31:14PM +0100, David Hildenbrand wrote:
>> On 29.01.25 12:28, Simona Vetter wrote:
>>> On Wed, Jan 29, 2025 at 11:48:03AM +0100, Simona Vetter wrote:
>>>> On Tue, Jan 28, 2025 at 09:24:33PM +0100, David Hildenbrand wrote:
>>>>> On 28.01.25 21:14, Simona Vetter wrote:
>>>>>> On Tue, Jan 28, 2025 at 11:09:24AM +1100, Alistair Popple wrote:
>>>>>>> On Fri, Jan 24, 2025 at 06:54:02PM +0100, David Hildenbrand wrote:
>>>>>>>>>>> On integrated the gpu is tied into the coherency
>>>>>>>>>>> fabric, so there it's not needed.
>>>>>>>>>>>
>>>>>>>>>>> I think the more fundamental question with both this function here and
>>>>>>>>>>> with forced migration to device memory is that there's no guarantee it
>>>>>>>>>>> will work out.
>>>>>>>>>>
>>>>>>>>>> Yes, in particular with device-exclusive, it doesn't really work with THP
>>>>>>>>>> and is only limited to anonymous memory. I have patches to at least make it
>>>>>>>>>> work reliably with THP.
>>>>>>>>>
>>>>>>>>> I should have crawled through the implementation first before replying.
>>>>>>>>> Since it only looks at folio_mapcount() make_device_exclusive() should at
>>>>>>>>> least in theory work reliably on anon memory, and not be impacted by
>>>>>>>>> elevated refcounts due to migration/ksm/thp/whatever.
>>>>>>>>
>>>>>>>> Yes, there is -- in theory -- nothing blocking the conversion except the
>>>>>>>> folio lock. That's different than page migration.
>>>>>>>
>>>>>>> Indeed - this was the entire motivation for make_device_exclusive() - that we
>>>>>>> needed a way to reliably exclude CPU access that couldn't be blocked in the same
>>>>>>> way page migration can (otherwise we could have just migrated to a device page,
>>>>>>> even if that may have added unwanted overhead).
>>>>>>
>>>>>> The folio_trylock worries me a bit. I guess this is to avoid deadlocks
>>>>>> when locking multiple folios, but I think at least on the first one we
>>>>>> need an unconditional folio_lock to guarantee forward progress.
>>>>>
>>>>> At least on the hmm path I was able to trigger the EBUSY a couple of times
>>>>> due to concurrent swapout. But the hmm-tests selftest fails immediately
>>>>> instead of retrying.
>>>>
>>>> My worries with just retrying is that it's very hard to assess whether
>>>> there's a livelock or whether the retry has a good chance of success. As
>>>> an example the ->migrate_to_ram path has some trylocks, and the window
>>>> where all other threads got halfway and then fail the trylock is big
>>>> enough that once you pile up enough threads that spin through there,
>>>> you're stuck forever. Which isn't great.
>>>>
>>>> So if we could convert at least the first folio_trylock into a plain lock
>>>> then forward progress is obviously assured and there's no need to crawl
>>>> through large chunks of mm/ code to hunt for corner cases where we could
>>>> be too unlucky to ever win the race.
>>>>
>>>>>> Since
>>>>>> atomics can't cross 4k boundaries (or the hw is just really broken) this
>>>>>> should be enough to avoid being stuck in a livelock. I'm also not seeing
>>>>>> any other reason why a folio_lock shouldn't work here, but then my
>>>>>> understanding of mm/ stuff is really just scratching the surface.
>>>>>>
>>>>>> I did crawl through all the other code and it looks like everything else
>>>>>> is unconditional locks. So looks all good and I didn't spot anything else
>>>>>> that seemed problematic.
>>>>>>
>>>>>> Somewhat aside, I do wonder whether we really want to require callers to
>>>>>> hold the mmap lock, or whether with all the work towards lockless fastpath
>>>>>> that shouldn't instead just be an implementation detail.
>>>>>
>>>>> We might be able to use the VMA lock in the future, but that will require
>>>>> GUP support and a bunch more. Until then, the mm_lock in read mode is
>>>>> required.
>>>>
>>>> Yup. I also don't think we should try to improve before benchmarks show an
>>>> actual need. It's more about future proofing and making sure mmap_lock
>>>> doesn't leak into driver data structures that I'm worried about. Because
>>>> I've seen some hmm/gpu rfc patches that heavily relied on mmap_lock to
>>>> keep everything correct on the driver side, which is not a clean design.
>>>>
>>>>> I was not able to convince myself that we'll really need the folio lock, but
>>>>> that's also a separate discussion.
>>>>
>>>> This is way above my pay understanding of mm/ unfortunately.
>>>
>>> I pondered this some more, and I think it's to make sure we get a stable
>>> reading of folio_mapcount() and are not racing with new rmaps being
>>> established. But I also got lost a few times in the maze ...
>>
>> That mapcount handling is all messed up and I'll remove that along with
>> the rmap walk. Also, the folio lock does not stabilize the mapcount at all ...
> 
> Hm ... also rethinking this all, we don't need a lot of guarantees here.
> Anything userspace does that re-elevates the mapcount or otherwise could
> starve out make_device_exclusive is I think a case of "don't do that".
> 
> I think the only guarantee we need is that make_device_exclusive succeeds
> against other kernel stuff like thp/migration/ksm and all those things, at
> least reliably when you retry. And maybe also that concurrent
> make_device_exclusive calls don't starve each another but eventually get
> the job done (but only if it's the same owner).
> 
>> Here is my understanding:
>>
>> commit e2dca6db09186534c7e6082b77be6e17d8920f10
>> Author: David Hildenbrand <david@redhat.com>
>> Date:   Tue Jan 28 15:25:37 2025 +0100
>>
>>      mm/memory: document restore_exclusive_pte()
>>      Let's document how this function is to be used, and why the requirement
>>      for the folio lock might maybe be dropped in the future.
>>      Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 46956994aaff..caaae8df11a9 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
>>   }
>>   #endif
>> +/**
>> + * restore_exclusive_pte - Restore a device-exclusive entry
>> + * @vma: VMA covering @address
>> + * @folio: the mapped folio
>> + * @page: the mapped folio page
>> + * @address: the virtual address
>> + * @ptep: PTE pointer into the locked page table mapping the folio page
>> + * @orig_pte: PTE value at @ptep
>> + *
>> + * Restore a device-exclusive non-swap entry to an ordinary present PTE.
>> + *
>> + * The folio and the page table must be locked, and MMU notifiers must have
>> + * been called to invalidate any (exclusive) device mappings. In case of
>> + * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
>> + * fault MMU_NOTIFY_EXCLUSIVE is triggered.
>> + *
>> + * Locking the folio makes sure that anybody who just converted the PTE to
>> + * a device-private entry can map it into the device, before unlocking it; so
>> + * the folio lock prevents concurrent conversion to device-exclusive.
>> + *
>> + * TODO: the folio lock does not protect against all cases of concurrent
>> + * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
>> + * must already use MMU notifiers to sync against any concurrent changes
>> + * Maybe the requirement for the folio lock can be dropped in the future.
> 
> Hm yeah I was a bit confused why this would work at first. But since we
> break cow with FOLL_WRITE there shouldn't be any other mappings around.
> Therefore relying on the mmu notifier for that mm_struct is enough, and we
> don't need to hold the folio_lock in callers.

Right; the devil is in the detail here; I looked at the SVM code and it 
registers an MMU notifier around that code to catch any invalidations 
that are happening while mapping the page. And it has another one to 
handle invalidations in general. I did not completely digest why two 
notifiers are required ... there likely is a good reason.

-- 
Cheers,

David / dhildenb

