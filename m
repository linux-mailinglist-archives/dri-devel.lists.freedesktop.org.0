Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C2B34AC7
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 21:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A9A10E535;
	Mon, 25 Aug 2025 19:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NG91wJ8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CFC10E538
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 19:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756149012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ovFlkg9w0MiMJlc85UHe8tFsLpOCb2Fnjm1U8NPyw30=;
 b=NG91wJ8PnPAprwzWu6s4NlTEWkA899j0TxuC6P32rA1+xhvV21mmpxCKi2tYvV2hEw67A9
 YJHs8SF6feLPMmW/W2wq7ZlFVCGPTzqaxUuc33u2UZHbONiExqk/OwL4f24yugqsfOSA2H
 QnlJtaP3XWNljMKXYdgObRCn3fiAbdA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-RbucSqBLNj-ioMlJnnIJMw-1; Mon, 25 Aug 2025 15:10:11 -0400
X-MC-Unique: RbucSqBLNj-ioMlJnnIJMw-1
X-Mimecast-MFC-AGG-ID: RbucSqBLNj-ioMlJnnIJMw_1756149010
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a15fd6b45so27879695e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 12:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756149010; x=1756753810;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ovFlkg9w0MiMJlc85UHe8tFsLpOCb2Fnjm1U8NPyw30=;
 b=be9OlU+6ncxH7LRfEjkuIc4z5RAo67wQ+0PFS17FE/t2m/mXGkpJZTEB8ilxo7NQCq
 w4vi9vG2FTEzRmLuIg+Vo1cjZHhVZxdyxqm6U0jMY3WlPYaQUrIZqXPedx/L6S7h9XUR
 r+3f1KtKlkHDWXnkb+DMP+EqWGsChVNqU2praOfYVDUdzujR7WE9jwGWZxjm6+EfZ+FK
 PEZ0+tkMGiwOxhnnvwkIxbEOdXM+CDUGKy059WlHDMSMybdbxuIEXrmMfhS6HzHMoMWy
 EVQm7N2/KaRsqJJbQsBSfMWWxQuy8c8INeBZ129U9xIcZJzNoGgliXZHEazUXvFNQMUe
 Mt5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4hCS+Hc/+z+2NUtIkgDmp6tMnPiSfBNpJSUlkgAuMhlwfpnDDVelOBrRBt7UGF4Jk8mszD1EgmpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+yd0r4Z2fyCWUtukIuFcJY1bep69M9PH9rIHmS1UB2/VF3s0F
 k6ee1TVc/Hbgyx8fbkkkYOoDrB9MjDIgvR6KPplmDYQf+wp5lf1SD0f37SvMfIZIZhAAG4o2bUm
 FcEuEHVDdJMbxZAS6zZSXCRWZRkxffHIXU8kcVfmXYsLvDayPSyRtZpNtIi+sSs4xEWa+tA==
X-Gm-Gg: ASbGncu20uv4pRCTuccEWdxpU01zJ+2u8pRr7RH22qes5AU3vfjWWsJJiPgPJP13Dms
 uFNgiiImZnS7efNg03wjIKohCojIYcgGT2PB+LuMuWIjt55aLf9VJHHne97Y/iBNL9jODKtLKrU
 YM7hAQSO5YD7qbtkKzFrbIsVCovh3MRtY05go2YECWLsirvxHYPrbM8HXC2wqO5mjXuavEbr8Sc
 Y2iZTQInNiPhtWXB1xSSAy1Ib4g0twmt3kAyNqh2g39CQW0Lv3LqoehWQ6VJ0ZVtcdydqZg7fe3
 EeN6kUrqxH/rVi6K/A00Zlsq2AnuAIhDjxHyLN+QVkUm68vTRrJCVNu8csU76R8Db205dzCFOzw
 Lo8fTCiFNev2reaMTxn4ovPbWdeDSgkP3WFKX1sX3PntAIB1FFWVEnzdU7paVe+Stlr0=
X-Received: by 2002:a05:600c:4fd1:b0:458:d289:3e26 with SMTP id
 5b1f17b1804b1-45b65dc7001mr3027685e9.2.1756149010375; 
 Mon, 25 Aug 2025 12:10:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0ThQ6ylSmyMP5nnHc1suGJsKnc6voe66RR5IeTlSwtzSWcPTDor/ThY5I3vNohIOHMFHSFQ==
X-Received: by 2002:a05:600c:4fd1:b0:458:d289:3e26 with SMTP id
 5b1f17b1804b1-45b65dc7001mr3027405e9.2.1756149009936; 
 Mon, 25 Aug 2025 12:10:09 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76?
 (p200300d82f4f130042f198e5ddf83a76.dip0.t-ipconnect.de.
 [2003:d8:2f4f:1300:42f1:98e5:ddf8:3a76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b57444963sm130775305e9.3.2025.08.25.12.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 12:10:09 -0700 (PDT)
Message-ID: <f983521c-b43d-4245-93fc-fcb847908573@redhat.com>
Date: Mon, 25 Aug 2025 21:10:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
 <4e5f4ef0-53f1-417e-8f3b-76fd7c64cd23@amd.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <4e5f4ef0-53f1-417e-8f3b-76fd7c64cd23@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G9lGJwjugbpbUzse5Eh7kE1ptQ_6PstTxZGt5vf_0WU_1756149010
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.08.25 10:10, Christian König wrote:
> On 20.08.25 17:23, David Hildenbrand wrote:
>> CCing Lorenzo
>>
>> On 20.08.25 16:33, Christian König wrote:
>>> Hi everyone,
>>>
>>> sorry for CCing so many people, but that rabbit hole turned out to be
>>> deeper than originally thought.
>>>
>>> TTM always had problems with UC/WC mappings on 32bit systems and drivers
>>> often had to revert to hacks like using GFP_DMA32 to get things working
>>> while having no rational explanation why that helped (see the TTM AGP,
>>> radeon and nouveau driver code for that).
>>>
>>> It turned out that the PAT implementation we use on x86 not only enforces
>>> the same caching attributes for pages in the linear kernel mapping, but
>>> also for highmem pages through a separate R/B tree.
>>>
>>> That was unexpected and TTM never updated that R/B tree for highmem pages,
>>> so the function pgprot_set_cachemode() just overwrote the caching
>>> attributes drivers passed in to vmf_insert_pfn_prot() and that essentially
>>> caused all kind of random trouble.
>>>
>>> An R/B tree is potentially not a good data structure to hold thousands if
>>> not millions of different attributes for each page, so updating that is
>>> probably not the way to solve this issue.
>>>
>>> Thomas pointed out that the i915 driver is using apply_page_range()
>>> instead of vmf_insert_pfn_prot() to circumvent the PAT implementation and
>>> just fill in the page tables with what the driver things is the right
>>> caching attribute.
>>
>> I assume you mean apply_to_page_range() -- same issue in patch subjects.
> 
> Oh yes, of course. Sorry.
> 
>> Oh this sounds horrible. Why oh why do we have these hacks in core-mm and have drivers abuse them :(
> 
> Yeah I was also a bit hesitated to use that, but the performance advantage is so high that we probably can't avoid the general approach.
> 
>> Honestly, apply_to_pte_range() is just the entry in doing all kinds of weird crap to page tables because "you know better".
> 
> Exactly that's the problem I'm pointing out, drivers *do* know it better. The core memory management has applied incorrect values which caused all kind of the trouble.
> 
> The problem is not a bug in PAT nor TTM/drivers but rather how they interact with each other.
> 
> What I don't understand is why do we have the PAT in the first place? No other architecture does it this way.

Probably because no other architecture has these weird glitches I assume 
... skimming over memtype_reserve() and friends there are quite some 
corner cases the code is handling (BIOS, ACPI, low ISA, system RAM, ...)


I did a lot of work on the higher PAT level functions, but I am no 
expert on the lower level management functions, and in particular all 
the special cases with different memory types.

IIRC, the goal of the PAT subsystem is to make sure that no two page 
tables map the same PFN with different caching attributes.

It treats ordinary system RAM (IORESOURCE_SYSTEM_RAM) usually in a 
special way: no special caching mode.

For everything else, it expects that someone first reserves a memory 
range for a specific caching mode.

For example, remap_pfn_range()...->pfnmap_track()->memtype_reserve() 
will make sure that there are no conflicts, to the call 
memtype_kernel_map_sync() to make sure the identity mapping is updated 
to the new type.

In case someone ends up calling pfnmap_setup_cachemode(), the 
expectation is that there was a previous call to memtype_reserve_io() or 
similar, such that pfnmap_setup_cachemode() will find that caching mode.


So my assumption would be that that is missing for the drivers here?

Last time I asked where this reservation is done, Peter Xu explained [1] 
it at least for VFIO:

vfio_pci_core_mmap
   pci_iomap
     pci_iomap_range
       ...
         __ioremap_caller
           memtype_reserve


Now, could it be that something like that is missing in these drivers 
(ioremap etc)?



[1] https://lkml.kernel.org/r/aBDXr-Qp4z0tS50P@x1.local


> 
> Is that because of the of x86 CPUs which have problems when different page tables contain different caching attributes for the same physical memory?

Yes, but I don't think x86 is special here.

-- 
Cheers

David / dhildenb

