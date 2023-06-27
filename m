Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E666973F515
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 09:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E71110E29A;
	Tue, 27 Jun 2023 07:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EBE10E29A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 07:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687849838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvp18LvYIIuBEFLlfeIt2YHMxFkZkNabLPegG26yxug=;
 b=ZO73zrVQZng8+qXdvRyWYExITt9HoO9zFv9i22x1tOTwulgmDGlGCKI6/LsQvPcm2jfBaL
 kNrS8+qrv8bibiuA4vfUJJSVeYF+0T4XjcBE7qxV6baB7ld13ahCQkVHwMnKhljEfPdL1w
 1iiLRBW1JhO8VqKlnb/sjcM2U4yDZVc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-_4AExfKbM-mHysAJr1PuTA-1; Tue, 27 Jun 2023 03:10:36 -0400
X-MC-Unique: _4AExfKbM-mHysAJr1PuTA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f864ca6243so3243255e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 00:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687849835; x=1690441835;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kvp18LvYIIuBEFLlfeIt2YHMxFkZkNabLPegG26yxug=;
 b=I94YWfnSwUNgh4NpPW1Q22g6brdVSxBr3J5cX7cQbFls+sRKFRCi6Tqr/eoNOb12on
 xsPk1pnahIz3PQgMnaRz1wqgUHByGUk+v3huGJTLXDEfoIPQnABu39RLAZd61argLK5Q
 XTQYwRzu/+Gdqno9HEx/YTwDdOzqhTSzAL0mBrGl/2yJXaabpJuCuV2YcHrFLYKO0zv5
 4yMO4HsemNXszTczqqPgpGg9dFgiZWNbhBv8R2dWPxdPOF1s7ep5NBghHJOs8IF9tw+6
 gjNMKaQhL6oZNCUJUekH3EbofYERshDombSAwHelXWD1aChhDvmKTW7mtGtAU/Sx7+G3
 ar9Q==
X-Gm-Message-State: AC+VfDyTXjTZfFhzt5FBJfoLUHUIMJYWix/y/GQxtnQH3qL8jWeVVa3b
 +RfG9hL6GMGQSwhKK1p94M135z8Q33TeklB/mF5mgctZe00PXJvIDW6k0h25TQq6kGHRt4YRTWA
 E8IN7xmbUurzVj3FoR8kDegDw9CcI
X-Received: by 2002:a19:910d:0:b0:4f8:7124:6803 with SMTP id
 t13-20020a19910d000000b004f871246803mr17268667lfd.35.1687849835380; 
 Tue, 27 Jun 2023 00:10:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6OeAFjlUtFh5JB+KW2HFJf4vVq30W9UjnY7roHoDY1PwxoBP5E8TrcenYXNjHih8taeNuQgw==
X-Received: by 2002:a19:910d:0:b0:4f8:7124:6803 with SMTP id
 t13-20020a19910d000000b004f871246803mr17268644lfd.35.1687849834700; 
 Tue, 27 Jun 2023 00:10:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c737:4900:68b3:e93b:e07a:558b?
 (p200300cbc737490068b3e93be07a558b.dip0.t-ipconnect.de.
 [2003:cb:c737:4900:68b3:e93b:e07a:558b])
 by smtp.gmail.com with ESMTPSA id
 22-20020ac24856000000b004fb79feb289sm500218lfy.227.2023.06.27.00.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 00:10:34 -0700 (PDT)
Message-ID: <4a98a381-f184-1857-a134-efd606a3b807@redhat.com>
Date: Tue, 27 Jun 2023 09:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Peter Xu <peterx@redhat.com>
References: <20230622072710.3707315-1-vivek.kasireddy@intel.com>
 <6e429fbc-e0e6-53c0-c545-2e2cbbe757de@redhat.com>
 <IA0PR11MB718510999F2C0E2B70914E2AF823A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJXJ4ULRKVN5JPyv@x1n>
 <IA0PR11MB718571BA49F71282368D8649F826A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZJnQYmbjWf5cOeFL@x1n> <dcccb5ab-1e0d-ac06-0d19-e07512db2cec@redhat.com>
 <IA0PR11MB71854B6D9454DCDCEB83F2E2F827A@IA0PR11MB7185.namprd11.prod.outlook.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 0/2] udmabuf: Add back support for mapping hugetlb pages
In-Reply-To: <IA0PR11MB71854B6D9454DCDCEB83F2E2F827A@IA0PR11MB7185.namprd11.prod.outlook.com>
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

On 27.06.23 08:37, Kasireddy, Vivek wrote:
> Hi David,
> 

Hi!

sorry for taking a bit longer to reply lately.

[...]

>>> Sounds right, maybe it needs to go back to the old GUP solution, though, as
>>> mmu notifiers are also mm-based not fd-based. Or to be explicit, I think
>>> it'll be pin_user_pages(FOLL_LONGTERM) with the new API.  It'll also solve
>>> the movable pages issue on pinning.
>>
>> It better should be pin_user_pages(FOLL_LONGTERM). But I'm afraid we
>> cannot achieve that without breaking the existing kernel interface ...
> Yeah, as you suggest, we unfortunately cannot go back to using GUP
> without breaking udmabuf_create UAPI that expects memfds and file
> offsets.
> 
>>
>> So we might have to implement the same page migration as gup does on
>> FOLL_LONGTERM here ... maybe there are more such cases/drivers that
>> actually require that handling when simply taking pages out of the
>> memfd, believing they can hold on to them forever.
> IIUC, I don't think just handling the page migration in udmabuf is going to
> cut it. It might require active cooperation of the Guest GPU driver as well
> if this is even feasible.

The idea is, that once you extract the page from the memfd and it 
resides somewhere bad (MIGRATE_CMA, ZONE_MOVABLE), you trigger page 
migration. Essentially what migrate_longterm_unpinnable_pages() does:

Why would the guest driver have to be involved? It shouldn't care about
page migration in the hypervisor.

[...]

>> balloon, and then using that memory for communicating with the device]
>>
>> Maybe it's all fine with udmabuf because of the way it is setup/torn
>> down by the guest driver. Unfortunately I can't tell.
> Here are the functions used by virtio-gpu (Guest GPU driver) to allocate
> pages for its resources:
> __drm_gem_shmem_create: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L97
> Interestingly, the comment in the above function says that the pages
> should not be allocated from the MOVABLE zone.

It doesn't add GFP_MOVABLE, so pages don't end up in 
ZONE_MOVABLE/MIGRATE_CMA *in the guest*. But we care about the 
ZONE_MOVABLE /MIGRATE_CMA *in the host*. (what the guest does is right, 
though)

IOW, what udmabuf does with guest memory on the hypervisor side, not the 
guest driver on the guest side.

> The pages along with their dma addresses are then extracted and shared
> with Qemu using these two functions:
> drm_gem_get_pages: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_gem.c#L534
> virtio_gpu_object_shmem_init: https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/virtio/virtgpu_object.c#L135

^ so these two target the guest driver as well, right? IOW, there is a 
memfd (shmem) in the guest that the guest driver uses to allocate pages 
from and there is the memfd in the hypervisor to back guest RAM.

The latter gets registered with udmabuf.

> Qemu then translates the dma addresses into file offsets and creates
> udmabufs -- as an optimization to avoid data copies only if blob is set
> to true.

If the guest OS doesn't end up freeing/reallocating that memory while 
it's registered with udmabuf in the hypervisor, then we should be fine.

Because that way, the guest won't end up trigger MADV_DONTNEED by 
"accident".

-- 
Cheers,

David / dhildenb

