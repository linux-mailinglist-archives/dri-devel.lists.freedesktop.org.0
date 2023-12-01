Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBF58006C6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 10:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D5A10E82F;
	Fri,  1 Dec 2023 09:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F320010E82A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 09:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701422623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=J/HNsGBAY9tCftPYDhpctNf5+8xRFRhgnlekGos4DSM=;
 b=aYXbPUjWch9Wgrvr8vPs8c1TJTA/hWj4C44aDYwXyFPmfI0yFx0sAB8rm70nOxQkGpixJS
 QCRlNxT4NFC40eLUCYhG9MK6XIKHY7orLqUl7Qrzl5gLUrezanXaJsGOCx5wJAiXD+onpx
 Rsa4zwJKJvoJucYSby0F98fc55QvA5Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-NuKJR5LrOmO3bRiE2S7wrw-1; Fri, 01 Dec 2023 04:23:41 -0500
X-MC-Unique: NuKJR5LrOmO3bRiE2S7wrw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-407d3e55927so16068885e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 01:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701422620; x=1702027420;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J/HNsGBAY9tCftPYDhpctNf5+8xRFRhgnlekGos4DSM=;
 b=RCXBxErXLmYEb6b7xwWXEoSEGbX0ZFeG9zYZZ8bJfUfg0F6Ps+kFtLEc8kSGPZAWyf
 6KlDmzBuIjw3TTGesU4u13YBG6/trlsMrf1JQSPNyNSQzUzWyjh/p4+32KnWYKc2O5v0
 /h8sgsOkm3MlsjFgAECngPY3gvoX8Z7EWBlSx3uKfX5UyqKgGDWRHr6J9/iI9GXvx2b1
 MmdftLbQXSPfiy4pOPi/QfoXP/29/ZNbbo2590XW6tTO/AfCyKAnyi2VjSrdHGu1Uwo7
 +sFv4Unp86IoaFqKqNfKT/tuhtck5DcS395SGB8UuBYvRgT9LT0bs4fV+tjYX6UNG1XP
 HmAg==
X-Gm-Message-State: AOJu0YysRo8kOFRnevWOLGoYB6JnfFOxVl2Nk7Cg+u2rwnmKzchIxdyc
 Ybal6rRr8AtiIP+HjFibZmS7vV5DK+RHeK6eJQw2PvcTcQP+/d0X26RI298rL6OmFD0rC8FKeVA
 GMIsu5CD1Ylr8btX/dJznw9kBYFg2
X-Received: by 2002:a05:600c:1da7:b0:40b:5e59:cca0 with SMTP id
 p39-20020a05600c1da700b0040b5e59cca0mr256593wms.129.1701422620576; 
 Fri, 01 Dec 2023 01:23:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbj59aKrdp1bwC45vVYTH//o6ADwu3HnhrokcgPLEaEt76aIWUxif6MnQKy43m6yymBTuLpg==
X-Received: by 2002:a05:600c:1da7:b0:40b:5e59:cca0 with SMTP id
 p39-20020a05600c1da700b0040b5e59cca0mr256570wms.129.1701422620020; 
 Fri, 01 Dec 2023 01:23:40 -0800 (PST)
Received: from ?IPV6:2003:cb:c726:4100:c308:78e3:8f80:52ac?
 (p200300cbc7264100c30878e38f8052ac.dip0.t-ipconnect.de.
 [2003:cb:c726:4100:c308:78e3:8f80:52ac])
 by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c1c9200b0040b38292253sm8469404wms.30.2023.12.01.01.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Dec 2023 01:23:39 -0800 (PST)
Message-ID: <e4eb5a24-e9cf-4944-9614-df5f5f3a7163@redhat.com>
Date: Fri, 1 Dec 2023 10:23:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] mm/gmem: add arch-independent abstraction to
 track address mapping status
To: Weixi Zhu <weixi.zhu@huawei.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <20231128125025.4449-3-weixi.zhu@huawei.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20231128125025.4449-3-weixi.zhu@huawei.com>
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
Cc: dri-devel@lists.freedesktop.org, leonro@nvidia.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, mgorman@suse.de, ziy@nvidia.com,
 zhi.a.wang@intel.com, rcampbell@nvidia.com, jgg@nvidia.com,
 weixi.zhu@openeuler.sh, jhubbard@nvidia.com, intel-gfx@lists.freedesktop.org,
 mhairgrove@nvidia.com, jglisse@redhat.com, rodrigo.vivi@intel.com,
 intel-gvt-dev@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com,
 Felix.Kuehling@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, ogabbay@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.11.23 13:50, Weixi Zhu wrote:
> This patch adds an abstraction layer, struct vm_object, that maintains
> per-process virtual-to-physical mapping status stored in struct gm_mapping.
> For example, a virtual page may be mapped to a CPU physical page or to a
> device physical page. Struct vm_object effectively maintains an
> arch-independent page table, which is defined as a "logical page table".
> While arch-dependent page table used by a real MMU is named a "physical
> page table". The logical page table is useful if Linux core MM is extended
> to handle a unified virtual address space with external accelerators using
> customized MMUs.

Which raises the question why we are dealing with anonymous memory at 
all? Why not go for shmem if you are already only special-casing VMAs 
with a MMAP flag right now?

That would maybe avoid having to introduce controversial BSD design 
concepts into Linux, that feel like going a step backwards in time to me 
and adding *more* MM complexity.

> 
> In this patch, struct vm_object utilizes a radix
> tree (xarray) to track where a virtual page is mapped to. This adds extra
> memory consumption from xarray, but provides a nice abstraction to isolate
> mapping status from the machine-dependent layer (PTEs). Besides supporting
> accelerators with external MMUs, struct vm_object is planned to further
> union with i_pages in struct address_mapping for file-backed memory.

A file already has a tree structure (pagecache) to manage the pages that 
are theoretically mapped. It's easy to translate from a VMA to a page 
inside that tree structure that is currently not present in page tables.

Why the need for that tree structure if you can just remove anon memory 
from the picture?

> 
> The idea of struct vm_object is originated from FreeBSD VM design, which
> provides a unified abstraction for anonymous memory, file-backed memory,
> page cache and etc[1].

:/

> Currently, Linux utilizes a set of hierarchical page walk functions to
> abstract page table manipulations of different CPU architecture. The
> problem happens when a device wants to reuse Linux MM code to manage its
> page table -- the device page table may not be accessible to the CPU.
> Existing solution like Linux HMM utilizes the MMU notifier mechanisms to
> invoke device-specific MMU functions, but relies on encoding the mapping
> status on the CPU page table entries. This entangles machine-independent
> code with machine-dependent code, and also brings unnecessary restrictions.

Why? we have primitives to walk arch page tables in a non-arch specific 
fashion and are using them all over the place.

We even have various mechanisms to map something into the page tables 
and get the CPU to fault on it, as if it is inaccessible (PROT_NONE as 
used for NUMA balancing, fake swap entries).

> The PTE size and format vary arch by arch, which harms the extensibility.

Not really.

We might have some features limited to some architectures because of the 
lack of PTE bits. And usually the problem is that people don't care 
enough about enabling these features on older architectures.

If we ever *really* need more space for sw-defined data, it would be 
possible to allocate auxiliary data for page tables only where required 
(where the features apply), instead of crafting a completely new, 
auxiliary datastructure with it's own locking.

So far it was not required to enable the feature we need on the 
architectures we care about.

> 
> [1] https://docs.freebsd.org/en/articles/vm-design/

In the cover letter you have:

"The future plan of logical page table is to provide a generic 
abstraction layer that support common anonymous memory (I am looking at 
you, transparent huge pages) and file-backed memory."

Which I doubt will happen; there is little interest in making anonymous 
memory management slower, more serialized, and wasting more memory on 
metadata.

Note that you won't make many friends around here with statements like 
"To be honest, not using a logical page table for anonymous memory is 
why Linux THP fails compared with FreeBSD's superpage".

I read one paper that makes such claims (I'm curious how you define 
"winning"), and am aware of some shortcomings. But I am not convinced 
that a second datastructure "is why Linux THP fails". It just requires 
some more work to get it sorted under Linux (e.g., allocate THP, PTE-map 
it and map inaccessible parts PROT_NONE, later collapse it in-place into 
a PMD), and so far, there was not a lot of interest that I am ware of to 
even start working on that.

So if there is not enough pain for companies to even work on that in 
Linux, maybe FreeBSD superpages are "winning" "on paper" only? Remember 
that the target audience here are Linux developers.


But yeah, this here is all designed around the idea "core MM is extended 
to handle a unified virtual address space with external accelerators 
using customized MMUs." and then trying to find other arguments why it's 
a good idea, without going too much into detail why it's all unsolvable 
without that.

The first thing to sort out if we even want that, and some discussions 
here already went into the direction of "likely not". Let's see.

-- 
Cheers,

David / dhildenb

