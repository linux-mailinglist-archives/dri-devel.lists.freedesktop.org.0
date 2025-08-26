Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB1DB35F3D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 14:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB0E10E652;
	Tue, 26 Aug 2025 12:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U2l4vFi7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6981C10E63E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 12:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756211831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=K0wkSLGkuAxnKgiPP+KTldXDI2XEMQhRs+CYDUDKwQs=;
 b=U2l4vFi7AwSH6A1H0/EusHh2d1mgqf/YmyZJaPc11vBxbTs0cJudjKvfAlP5LvHYdnPqrq
 YSfu36xkRg3s+rh86vdX4ayWNc98OXNdcmGFqMSfMr4jH4CFflsvP9rI6YrYT+KdI/q65t
 sNDXNDRAc8z93POPmOdSI0uKk7XnnaQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-exSoIfLgMTKdQ8wXU2IYcA-1; Tue, 26 Aug 2025 08:37:09 -0400
X-MC-Unique: exSoIfLgMTKdQ8wXU2IYcA-1
X-Mimecast-MFC-AGG-ID: exSoIfLgMTKdQ8wXU2IYcA_1756211828
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-61c6d735f25so1726358a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 05:37:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756211828; x=1756816628;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K0wkSLGkuAxnKgiPP+KTldXDI2XEMQhRs+CYDUDKwQs=;
 b=J2H2KFWXWNG514Wj5HdmDstF9SeYQ20YQNUVI9rcplx/YuosOVg1wIM8pCQXUCM+mB
 4XpQlIOELhoT/7qKwmy6IonZQfe9RYlWNaoTqRlWSMaDGxTSzz9hnDbeNr+7dUm1hZDq
 TddV55PZ8nyFpJvRjazmR5lcakF4R1+XZ4nD1H/Hbs9BylzgoIsQQEklEGAruOFVBQ6d
 MXzUqJgThglRj7N1wYqVmT2zHUPPLvHs4bMhMHVTh2qujIkL4dum7JQm7jBVDjoE2FQ2
 U9PMNtGCu4qrkbpYJh/aLW0UlkMuxrR7+//da5X50mWajuk2eXIlwYeY4ab0A9qVSR3N
 7Hxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSnpZLT63/CZGIYwM2WcYgdNxqtV4ZmseqHVOfyYcl20Zyo+1yTV9zgIWn+663BuR/WpHC4ILWWuo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxotxeZWydXk/n5RWZ2W4XTTEAUCjtdBR6/R1MOLMDkJaHz/CtW
 XAMDTcelvcfWpjBeN9GvGu03rGjdjmmnUyaP2i8QZl4o+6WfvMgW1py2buS0ocFdWuz9DRlVWd8
 BjCqPZBGWd5d3C5eyvqp1Oi78kFle2AbOs4vtPiWNppBsCezi31aG897xj5ugl4v/4x7U7g==
X-Gm-Gg: ASbGncuq7r5v6Puv4i5q8SuyQCtgiQDCtAE0oJdhotsNQ3w1390oG8a961uI0ewj1Co
 cfnIjV7AnMrPFfCGRJJwrz+u1oe5GVFh/P9oVlSPPjrqC91hKdFwDaa+0eAEmH2yXcx5GlcNpKo
 buL2KgXJoPJP+d/mI/UXUasx3oCq54iQC9EH2ygqaXGQLixq1oHApGoohnfb0IjLa8p+/LKKD5X
 ZObFjcaL7OE7kJVXaaE5Z8Is9oECg3pV38oKEfe52A1GZYw8DwYJG8W066f2dhvlnTBXvClSzbf
 5NmL4H6RgyQfNxVnf5GlcU6XdKA5mDl/zhtFPlO7glUagY8SeZeGFAkeHIuEq8ldo1dXZdghjA=
 =
X-Received: by 2002:a05:6402:51d0:b0:61c:8114:880f with SMTP id
 4fb4d7f45d1cf-61c81148fb1mr3413111a12.29.1756211827532; 
 Tue, 26 Aug 2025 05:37:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGQG1xDGH8ePF8TMcu0jnhgtxS3hJCE+VQ8zFK+DzfVyZbOJxo91wt+ArXLA0ynZyFZoaPgQ==
X-Received: by 2002:a05:6402:51d0:b0:61c:8114:880f with SMTP id
 4fb4d7f45d1cf-61c81148fb1mr3413081a12.29.1756211826933; 
 Tue, 26 Aug 2025 05:37:06 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c312c4f88sm6928285a12.24.2025.08.26.05.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 05:37:06 -0700 (PDT)
Message-ID: <b86f948d-b945-4292-af6e-b9d027425836@redhat.com>
Date: Tue, 26 Aug 2025 14:37:05 +0200
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
 <f983521c-b43d-4245-93fc-fcb847908573@redhat.com>
 <a1b95d23-1908-42c1-8ff6-da051fc140aa@amd.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <a1b95d23-1908-42c1-8ff6-da051fc140aa@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KGgG8VO_BoWP0kOcmYjP-igK16rmujKR3xZfmwL4dBc_1756211828
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

On 26.08.25 10:38, Christian König wrote:
> On 25.08.25 21:10, David Hildenbrand wrote:
>> On 21.08.25 10:10, Christian König wrote:
>>> On 20.08.25 17:23, David Hildenbrand wrote:
>>>> CCing Lorenzo
>>>>
>>>> On 20.08.25 16:33, Christian König wrote:
>>>>> Hi everyone,
>>>>>
>>>>> sorry for CCing so many people, but that rabbit hole turned out to be
>>>>> deeper than originally thought.
>>>>>
>>>>> TTM always had problems with UC/WC mappings on 32bit systems and drivers
>>>>> often had to revert to hacks like using GFP_DMA32 to get things working
>>>>> while having no rational explanation why that helped (see the TTM AGP,
>>>>> radeon and nouveau driver code for that).
>>>>>
>>>>> It turned out that the PAT implementation we use on x86 not only enforces
>>>>> the same caching attributes for pages in the linear kernel mapping, but
>>>>> also for highmem pages through a separate R/B tree.
>>>>>
>>>>> That was unexpected and TTM never updated that R/B tree for highmem pages,
>>>>> so the function pgprot_set_cachemode() just overwrote the caching
>>>>> attributes drivers passed in to vmf_insert_pfn_prot() and that essentially
>>>>> caused all kind of random trouble.
>>>>>
>>>>> An R/B tree is potentially not a good data structure to hold thousands if
>>>>> not millions of different attributes for each page, so updating that is
>>>>> probably not the way to solve this issue.
>>>>>
>>>>> Thomas pointed out that the i915 driver is using apply_page_range()
>>>>> instead of vmf_insert_pfn_prot() to circumvent the PAT implementation and
>>>>> just fill in the page tables with what the driver things is the right
>>>>> caching attribute.
>>>>
>>>> I assume you mean apply_to_page_range() -- same issue in patch subjects.
>>>
>>> Oh yes, of course. Sorry.
>>>
>>>> Oh this sounds horrible. Why oh why do we have these hacks in core-mm and have drivers abuse them :(
>>>
>>> Yeah I was also a bit hesitated to use that, but the performance advantage is so high that we probably can't avoid the general approach.
>>>
>>>> Honestly, apply_to_pte_range() is just the entry in doing all kinds of weird crap to page tables because "you know better".
>>>
>>> Exactly that's the problem I'm pointing out, drivers *do* know it better. The core memory management has applied incorrect values which caused all kind of the trouble.
>>>
>>> The problem is not a bug in PAT nor TTM/drivers but rather how they interact with each other.
>>>
>>> What I don't understand is why do we have the PAT in the first place? No other architecture does it this way.
>>
>> Probably because no other architecture has these weird glitches I assume ... skimming over memtype_reserve() and friends there are quite some corner cases the code is handling (BIOS, ACPI, low ISA, system RAM, ...)
>>
>>
>> I did a lot of work on the higher PAT level functions, but I am no expert on the lower level management functions, and in particular all the special cases with different memory types.
>>
>> IIRC, the goal of the PAT subsystem is to make sure that no two page tables map the same PFN with different caching attributes.
> 
> Yeah, that actually makes sense. Thomas from Intel recently explained the technical background to me:
> 
> Some x86 CPUs write back cache lines even if they aren't dirty and what can happen is that because of the linear mapping the CPU speculatively loads a cache line which is elsewhere mapped uncached.
> 
> So the end result is that the writeback of not dirty cache lines potentially corrupts the data in the otherwise uncached system memory.
> 
> But that a) only applies to memory in the linear mapping and b) only to a handful of x86 CPU types (e.g. recently Intels Luna Lake, AMD Athlons produced before 2004, maybe others).
> 
>> It treats ordinary system RAM (IORESOURCE_SYSTEM_RAM) usually in a special way: no special caching mode.
>>
>> For everything else, it expects that someone first reserves a memory range for a specific caching mode.
>>
>> For example, remap_pfn_range()...->pfnmap_track()->memtype_reserve() will make sure that there are no conflicts, to the call memtype_kernel_map_sync() to make sure the identity mapping is updated to the new type.
>>
>> In case someone ends up calling pfnmap_setup_cachemode(), the expectation is that there was a previous call to memtype_reserve_io() or similar, such that pfnmap_setup_cachemode() will find that caching mode.
>>
>>
>> So my assumption would be that that is missing for the drivers here?
> 
> Well yes and no.
> 
> See the PAT is optimized for applying specific caching attributes to ranges [A..B] (e.g. it uses an R/B tree). But what drivers do here is that they have single pages (usually for get_free_page or similar) and want to apply a certain caching attribute to it.

One clarification after staring at PAT code once again: for pages (RAM), 
the caching attribute is stored in the page flags, not in the R/B tree.

If nothing was set, it defaults to _PAGE_CACHE_MODE_WB AFAIKs.

-- 
Cheers

David / dhildenb

