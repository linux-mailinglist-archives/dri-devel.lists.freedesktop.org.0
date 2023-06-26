Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3C473E75C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 20:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BBA10E23C;
	Mon, 26 Jun 2023 18:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A7710E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 18:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687803272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qLlvTmxCdJ6FeeQUQ3bgIBfQqgVDP/lK/bXVE/40VHI=;
 b=aVcnXEPPtUN00xFQQLZTMwULIzWdNw1uhLOMOaLxoUHk20GBMWnMWiUdfsBjuyaEXnCwRa
 6TUJ4tMq5uSpb7QUrxJqVIeQ8xinWN2QvSShXbZAotg1X5mzG6CJT8ncUFUWYt2rpZ62/c
 NqEClicbCrWb5LRj2bz5V/Is1UFgbgQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-INe3up2ENbyfv6Hasa8Q2Q-1; Mon, 26 Jun 2023 14:14:30 -0400
X-MC-Unique: INe3up2ENbyfv6Hasa8Q2Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f9b003507bso17691145e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 11:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687803269; x=1690395269;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qLlvTmxCdJ6FeeQUQ3bgIBfQqgVDP/lK/bXVE/40VHI=;
 b=Lx5SGY26Erlc8HJFuFnPZnNHnlfOIdV2qnH8wExDfj2tRKjnxai10zTDjfp40IDBhx
 X05u6eVSD/INGSIALsxSqK2GoP4DiLGYEp84ewrQgQJUb2dxfemsKxkqdYVDZGoZsMJE
 5o+TaIqW9tdTW0/MSGVDvZs6H7qB6iZOYBi6Kys0gi02ZjzviPpSYT634Xaf4gjcLypH
 PH/npqEyCQlOxH+sS/wETvf5zOCmYO++08dXl8WUqg8Xoz0xYyLoiiClgXATV/jaArLJ
 D+C1Sz45YAaDNIqdniNA2CO9XtKTeHS+KjexZTtpmMnUccD9mEHHRiwnlAPAPTtL+3Yg
 qr3A==
X-Gm-Message-State: AC+VfDz7LrFwN7h3zxoKXrzNKtHg6vOTwj//oo4V1/Xrpmj6GWQfwsrJ
 viazIR9cRUbR5j8BlM60kEVoP8GlukgaBsoX9wJxWcVKJGUCMpQtfuYOs6PLZvulRGBqhaZDmif
 6ds4hBexQql2at71A0QvtXntnxrYX
X-Received: by 2002:a05:600c:22ce:b0:3fa:962e:e8f4 with SMTP id
 14-20020a05600c22ce00b003fa962ee8f4mr2303517wmg.26.1687803269558; 
 Mon, 26 Jun 2023 11:14:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47uWbMbFfK/yjy+EvgftjGmOIo4Aap2BbCpuwiUaBrgk29ZYEwypcaERPwQ5yl1N6jyKgXqQ==
X-Received: by 2002:a05:600c:22ce:b0:3fa:962e:e8f4 with SMTP id
 14-20020a05600c22ce00b003fa962ee8f4mr2303503wmg.26.1687803269133; 
 Mon, 26 Jun 2023 11:14:29 -0700 (PDT)
Received: from ?IPV6:2003:cb:c74b:7300:2ef6:6cd6:703c:e498?
 (p200300cbc74b73002ef66cd6703ce498.dip0.t-ipconnect.de.
 [2003:cb:c74b:7300:2ef6:6cd6:703c:e498])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a1cf00a000000b003f8fb02c413sm8437081wmb.8.2023.06.26.11.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 11:14:28 -0700 (PDT)
Message-ID: <dcccb5ab-1e0d-ac06-0d19-e07512db2cec@redhat.com>
Date: Mon, 26 Jun 2023 20:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Peter Xu <peterx@redhat.com>, "Kasireddy, Vivek"
 <vivek.kasireddy@intel.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
 <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJnQYmbjWf5cOeFL@x1n>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
In-Reply-To: <ZJnQYmbjWf5cOeFL@x1n>
X-Mimecast-Spam-Score: 0
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
Cc: James Houghton <jthoughton@google.com>,
 Jerome Marchand <jmarchan@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 "Chang, Junxiao" <junxiao.chang@intel.com>,
 Muchun Song <muchun.song@linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Hocko, Michal" <mhocko@suse.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26.06.23 19:52, Peter Xu wrote:
> On Mon, Jun 26, 2023 at 07:45:37AM +0000, Kasireddy, Vivek wrote:
>> Hi Peter,
>>
>>>
>>> On Fri, Jun 23, 2023 at 06:13:02AM +0000, Kasireddy, Vivek wrote:
>>>> Hi David,
>>>>
>>>>>> The first patch ensures that the mappings needed for handling mmap
>>>>>> operation would be managed by using the pfn instead of struct page.
>>>>>> The second patch restores support for mapping hugetlb pages where
>>>>>> subpages of a hugepage are not directly used anymore (main reason
>>>>>> for revert) and instead the hugetlb pages and the relevant offsets
>>>>>> are used to populate the scatterlist for dma-buf export and for
>>>>>> mmap operation.
>>>>>>
>>>>>> Testcase: default_hugepagesz=2M hugepagesz=2M hugepages=2500
>>>>> options
>>>>>> were passed to the Host kernel and Qemu was launched with these
>>>>>> relevant options: qemu-system-x86_64 -m 4096m....
>>>>>> -device virtio-gpu-pci,max_outputs=1,blob=true,xres=1920,yres=1080
>>>>>> -display gtk,gl=on
>>>>>> -object memory-backend-memfd,hugetlb=on,id=mem1,size=4096M
>>>>>> -machine memory-backend=mem1
>>>>>>
>>>>>> Replacing -display gtk,gl=on with -display gtk,gl=off above would
>>>>>> exercise the mmap handler.
>>>>>>
>>>>>
>>>>> While I think the VM_PFNMAP approach is much better and should fix
>>> that
>>>>> issue at hand, I thought more about missing memlock support and
>>> realized
>>>>> that we might have to fix something else. SO I'm going to raise the
>>>>> issue here.
>>>>>
>>>>> I think udmabuf chose the wrong interface to do what it's doing, that
>>>>> makes it harder to fix it eventually.
>>>>>
>>>>> Instead of accepting a range in a memfd, it should just have accepted a
>>>>> user space address range and then used
>>>>> pin_user_pages(FOLL_WRITE|FOLL_LONGTERM) to longterm-pin the
>>> pages
>>>>> "officially".
>>>> Udmabuf indeed started off by using user space address range and GUP
>>> but
>>>> the dma-buf subsystem maintainer had concerns with that approach in v2.
>>>> It also had support for mlock in that version. Here is v2 and the relevant
>>>> conversation:
>>>> https://patchwork.freedesktop.org/patch/210992/?series=39879&rev=2
>>>>
>>>>>
>>>>> So what's the issue? Udma effectively pins pages longterm ("possibly
>>>>> forever") simply by grabbing a reference on them. These pages might
>>>>> easily reside in ZONE_MOVABLE or in MIGRATE_CMA pageblocks.
>>>>>
>>>>> So what udmabuf does is break memory hotunplug and CMA, because it
>>>>> turns
>>>>> pages that have to remain movable unmovable.
>>>>>
>>>>> In the pin_user_pages(FOLL_LONGTERM) case we make sure to migrate
>>>>> these
>>>>> pages. See mm/gup.c:check_and_migrate_movable_pages() and
>>> especially
>>>>> folio_is_longterm_pinnable(). We'd probably have to implement
>>> something
>>>>> similar for udmabuf, where we detect such unpinnable pages and
>>> migrate
>>>>> them.
>>>> The pages udmabuf pins are only those associated with Guest (GPU
>>> driver/virtio-gpu)
>>>> resources (or buffers allocated and pinned from shmem via drm GEM).
>>> Some
>>>> resources are short-lived, and some are long-lived and whenever a
>>> resource
>>>> gets destroyed, the pages are unpinned. And, not all resources have their
>>> pages
>>>> pinned. The resource that is pinned for the longest duration is the FB and
>>> that's
>>>> because it is updated every ~16ms (assuming 1920x1080@60) by the Guest
>>>> GPU driver. We can certainly pin/unpin the FB after it is accessed on the
>>> Host
>>>> as a workaround, but I guess that may not be very efficient given the
>>> amount
>>>> of churn it would create.
>>>>
>>>> Also, as far as migration or S3/S4 is concerned, my understanding is that all
>>>> the Guest resources are destroyed and recreated again. So, wouldn't
>>> something
>>>> similar happen during memory hotunplug?
>>>>
>>>>>
>>>>>
>>>>> For example, pairing udmabuf with vfio (which pins pages using
>>>>> pin_user_pages(FOLL_LONGTERM)) in QEMU will most probably not work
>>> in
>>>>> all cases: if udmabuf longterm pinned the pages "the wrong way", vfio
>>>>> will fail to migrate them during FOLL_LONGTERM and consequently fail
>>>>> pin_user_pages(). As long as udmabuf holds a reference on these pages,
>>>>> that will never succeed.
>>>> Dma-buf rules (for exporters) indicate that the pages only need to be
>>> pinned
>>>> during the map_attachment phase (and until unmap attachment happens).
>>>> In other words, only when the sg_table is created by udmabuf. I guess one
>>>> option would be to not hold any references during UDMABUF_CREATE and
>>>> only grab references to the pages (as and when it gets used) during this
>>> step.
>>>> Would this help?
>>>
>>> IIUC the refcount is needed, otherwise I don't see what to protect the page
>>> from being freed and even reused elsewhere before map_attachment().
>>>
>>> It seems the previous concern on using gup was majorly fork(), if this is it:
>>>
>>> https://patchwork.freedesktop.org/patch/210992/?series=39879&rev=2#co
>>> mment_414213
>>>
>>> Could it also be guarded by just making sure the pages are MAP_SHARED
>>> when
>>> creating the udmabuf, if fork() is a requirement of the feature?
>>>
>>> I had a feeling that the userspace still needs to always do the right thing
>>> to make it work, even using pure PFN mappings.
>>>
>>> For instance, what if the userapp just punchs a hole in the shmem/hugetlbfs
>>> file after creating the udmabuf (I see that F_SEAL_SHRINK is required, but
>>> at least not F_SEAL_WRITE with current impl), and fault a new page into the
>>> page cache?
>> IIUC, Qemu creates and owns the memfd that is associated with Guest memory.
>> And if it punches a hole in its own memfd that goes through Guest pinned pages
>> associated with buffers/resources, then I think the proper way to fix this is to
>> somehow notify the Guest driver (virtio-gpu in this case) that the backing store
>> of the affected resources is no longer valid and that the resources need to be
>> destroyed and re-created again.
>>
>> Having said that, one option I could think of is to probably install a mmu_notifier
>> associated with the relevant pages in udmabuf and once we get notified about
>> any invalidation event concerning any of the pages, we'd fail any subsequent
>> attempt to access these pages and propagate the error across the stack.
> 
> Sounds right, maybe it needs to go back to the old GUP solution, though, as
> mmu notifiers are also mm-based not fd-based. Or to be explicit, I think
> it'll be pin_user_pages(FOLL_LONGTERM) with the new API.  It'll also solve
> the movable pages issue on pinning.

It better should be pin_user_pages(FOLL_LONGTERM). But I'm afraid we 
cannot achieve that without breaking the existing kernel interface ...

So we might have to implement the same page migration as gup does on 
FOLL_LONGTERM here ... maybe there are more such cases/drivers that 
actually require that handling when simply taking pages out of the 
memfd, believing they can hold on to them forever.

> 
>>
>> However, it feels like udmabuf is not the right place to handle this issue because
>> there are very limited options for taking proper corrective action if Qemu decides
>> to punch a hole in Guest memory that takes out pages that are pinned.
> 
> I'm not familiar with the use case that much, but IMHO it's fine if the
> driver relies on proper behaviors of userapp to work.
> 
> IIUC the worst case here is the udmabuf holds some pages that are not the
> pages of the guest mem anymore, but it only happens on misbehaved
> userspace, then it looks all fine as long as they can at least be properly
> released when releasing the udmabuf.  It'll be better if the udmabuf can
> fail hard when detecting this, but IMHO even that can be optional depending
> on the need, while any corrective action will be even one step further.

For vfio the issue are e.g., VM reboots, not a misbehaving guest. If the 
old guest kernel inflated the balloon and we reboot the VM, VFIO will 
still reference the old pages and the new (unaware kernel) might use 
that previously inflated memory to communicate with the devices. Because 
of that, we disable balloon inflation when vfio is active in QEMU.

[there are more cases like unloading the balloon driver or deflating the 
balloon, and then using that memory for communicating with the device]

Maybe it's all fine with udmabuf because of the way it is setup/torn 
down by the guest driver. Unfortunately I can't tell.

-- 
Cheers,

David / dhildenb

