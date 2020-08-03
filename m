Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EA423A07B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 09:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8702189D49;
	Mon,  3 Aug 2020 07:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E678089D49
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596440891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=+IhXjbbp3DRnwKGh7EJaRwzYvPFzXS04sIsNp19zYB0=;
 b=D2/+fPQOR4hwCtP80CXfqtpiKId1Fk4BDtg+7FfEQt5O7M6FysgNMWmy7wy2avyjE+Vx7s
 DpekTcQyGYEIJm5gt0UlPMAzOW5T3KzVJYaQFL9FuyrRDAupoZtjrygjaiwwHMC4k7gRXq
 zfUahRYTkqwbl9IUPMK+gag1FycPMC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-krbLoYQqMnGZ5bY33JqPIw-1; Mon, 03 Aug 2020 03:48:03 -0400
X-MC-Unique: krbLoYQqMnGZ5bY33JqPIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35E24100AA29;
 Mon,  3 Aug 2020 07:47:57 +0000 (UTC)
Received: from [10.36.112.252] (ovpn-112-252.ams2.redhat.com [10.36.112.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E49075D994;
 Mon,  3 Aug 2020 07:47:40 +0000 (UTC)
Subject: Re: [PATCH v4 00/23] device-dax: Support sub-dividing soft-reserved
 ranges
To: Dan Williams <dan.j.williams@intel.com>, akpm@linux-foundation.org
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABtCREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT6JAlgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63W5Ag0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAGJAjwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <c59111f9-7c94-8b9e-2b8c-4cb96b9aa848@redhat.com>
Date: Mon, 3 Aug 2020 09:47:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Paul Mackerras <paulus@ozlabs.org>, linux-mm@kvack.org,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-acpi@vger.kernel.org, linux-nvdimm@lists.01.org,
 Vishal Verma <vishal.l.verma@intel.com>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Ira Weiny <ira.weiny@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jia He <justin.he@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Wei Yang <richardw.yang@linux.intel.com>, Brice Goglin <Brice.Goglin@inria.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[...]

> Well, no v5.8-rc8 to line this up for v5.9, so next best is early
> integration into -mm before other collisions develop.
> 
> Chatted with Justin offline and it currently appears that the missing
> numa information is the fault of the platform firmware to populate all
> the necessary NUMA data in the NFIT.

I'm planning on looking at some bits of this series this week, but some
questions upfront ...

> 
> ---
> Cover:
> 
> The device-dax facility allows an address range to be directly mapped
> through a chardev, or optionally hotplugged to the core kernel page
> allocator as System-RAM. It is the mechanism for converting persistent
> memory (pmem) to be used as another volatile memory pool i.e. the
> current Memory Tiering hot topic on linux-mm.
> 
> In the case of pmem the nvdimm-namespace-label mechanism can sub-divide
> it, but that labeling mechanism is not available / applicable to
> soft-reserved ("EFI specific purpose") memory [3]. This series provides
> a sysfs-mechanism for the daxctl utility to enable provisioning of
> volatile-soft-reserved memory ranges.
> 
> The motivations for this facility are:
> 
> 1/ Allow performance differentiated memory ranges to be split between
>    kernel-managed and directly-accessed use cases.
> 
> 2/ Allow physical memory to be provisioned along performance relevant
>    address boundaries. For example, divide a memory-side cache [4] along
>    cache-color boundaries.
> 
> 3/ Parcel out soft-reserved memory to VMs using device-dax as a security
>    / permissions boundary [5]. Specifically I have seen people (ab)using
>    memmap=nn!ss (mark System-RAM as Persistent Memory) just to get the
>    device-dax interface on custom address ranges. A follow-on for the VM
>    use case is to teach device-dax to dynamically allocate 'struct page' at
>    runtime to reduce the duplication of 'struct page' space in both the
>    guest and the host kernel for the same physical pages.


I think I am missing some important pieces. Bear with me.

1. On x86-64, e820 indicates "soft-reserved" memory. This memory is not
automatically used in the buddy during boot, but remains untouched
(similar to pmem). But as it involves ACPI as well, it could also be
used on arm64 (-e820), correct?

2. Soft-reserved memory is volatile RAM with differing performance
characteristics ("performance differentiated memory"). What would be
examples of such memory? Like, memory that is faster than RAM (scratch
pad), or slower (pmem)? Or both? :) Is it a valid use case to use pmem
in a hypervisor to back this memory?

3. There seem to be use cases where "soft-reserved" memory is used via
DAX. What is an example use case? I assume it's *not* to treat it like
PMEM but instead e.g., use it as a fast buffer inside applications or
similar.

4. There seem to be use cases where some part of "soft-reserved" memory
is used via DAX, some other is given to the buddy. What is an example
use case? Is this really necessary or only some theoretical use case?

5. The "provisioned along performance relevant address boundaries." part
is unclear to me. Can you give an example of how this would look like
from user space? Like, split that memory in blocks of size X with
alignment Y and give them to separate applications?

6. If you add such memory to the buddy, is there any way the system can
differentiate it from other memory? E.g., via fake/other NUMA nodes?


Also, can you give examples of how kmem-added memory is represented in
/proc/iomem for a) pmem and b) soft-resered memory after this series
(skimming over the patches, I think there is a change for pmem, right?)?

I am really wondering if it's the right approach to squeeze this into
our pmem/nvdimm infrastructure just because it's easy to do. E.g., man
"ndctl" - "ndctl - Manage "libnvdimm" subsystem devices (Non-volatile
Memory)" speaks explicitly about non-volatile memory.


> 
> [2]: http://lore.kernel.org/r/20200713160837.13774-11-joao.m.martins@oracle.com
> [3]: http://lore.kernel.org/r/157309097008.1579826.12818463304589384434.stgit@dwillia2-desk3.amr.corp.intel.com
> [4]: http://lore.kernel.org/r/154899811738.3165233.12325692939590944259.stgit@dwillia2-desk3.amr.corp.intel.com
> [5]: http://lore.kernel.org/r/20200110190313.17144-1-joao.m.martins@oracle.com
> 
> ---
> 
> Dan Williams (19):
>       x86/numa: Cleanup configuration dependent command-line options
>       x86/numa: Add 'nohmat' option
>       efi/fake_mem: Arrange for a resource entry per efi_fake_mem instance
>       ACPI: HMAT: Refactor hmat_register_target_device to hmem_register_device
>       resource: Report parent to walk_iomem_res_desc() callback
>       mm/memory_hotplug: Introduce default phys_to_target_node() implementation
>       ACPI: HMAT: Attach a device for each soft-reserved range
>       device-dax: Drop the dax_region.pfn_flags attribute
>       device-dax: Move instance creation parameters to 'struct dev_dax_data'
>       device-dax: Make pgmap optional for instance creation
>       device-dax: Kill dax_kmem_res
>       device-dax: Add an allocation interface for device-dax instances
>       device-dax: Introduce 'seed' devices
>       drivers/base: Make device_find_child_by_name() compatible with sysfs inputs
>       device-dax: Add resize support
>       mm/memremap_pages: Convert to 'struct range'
>       mm/memremap_pages: Support multiple ranges per invocation
>       device-dax: Add dis-contiguous resource support
>       device-dax: Introduce 'mapping' devices
> 
> Joao Martins (4):
>       device-dax: Make align a per-device property
>       device-dax: Add an 'align' attribute
>       dax/hmem: Introduce dax_hmem.region_idle parameter
>       device-dax: Add a range mapping allocation attribute
> 
> 
>  Documentation/x86/x86_64/boot-options.rst |    4 
>  arch/powerpc/kvm/book3s_hv_uvmem.c        |   14 
>  arch/x86/include/asm/numa.h               |    8 
>  arch/x86/kernel/e820.c                    |   16 
>  arch/x86/mm/numa.c                        |   11 
>  arch/x86/mm/numa_emulation.c              |    3 
>  arch/x86/xen/enlighten_pv.c               |    2 
>  drivers/acpi/numa/hmat.c                  |   76 --
>  drivers/acpi/numa/srat.c                  |    9 
>  drivers/base/core.c                       |    2 
>  drivers/dax/Kconfig                       |    4 
>  drivers/dax/Makefile                      |    3 
>  drivers/dax/bus.c                         | 1046 +++++++++++++++++++++++++++--
>  drivers/dax/bus.h                         |   28 -
>  drivers/dax/dax-private.h                 |   60 +-
>  drivers/dax/device.c                      |  134 ++--
>  drivers/dax/hmem.c                        |   56 --
>  drivers/dax/hmem/Makefile                 |    6 
>  drivers/dax/hmem/device.c                 |  100 +++
>  drivers/dax/hmem/hmem.c                   |   65 ++
>  drivers/dax/kmem.c                        |  199 +++---
>  drivers/dax/pmem/compat.c                 |    2 
>  drivers/dax/pmem/core.c                   |   22 -
>  drivers/firmware/efi/x86_fake_mem.c       |   12 
>  drivers/gpu/drm/nouveau/nouveau_dmem.c    |   15 
>  drivers/nvdimm/badrange.c                 |   26 -
>  drivers/nvdimm/claim.c                    |   13 
>  drivers/nvdimm/nd.h                       |    3 
>  drivers/nvdimm/pfn_devs.c                 |   13 
>  drivers/nvdimm/pmem.c                     |   27 -
>  drivers/nvdimm/region.c                   |   21 -
>  drivers/pci/p2pdma.c                      |   12 
>  include/acpi/acpi_numa.h                  |   14 
>  include/linux/dax.h                       |    8 
>  include/linux/memory_hotplug.h            |    5 
>  include/linux/memremap.h                  |   11 
>  include/linux/numa.h                      |   11 
>  include/linux/range.h                     |    6 
>  kernel/resource.c                         |   11 
>  lib/test_hmm.c                            |   15 
>  mm/memory_hotplug.c                       |   10 
>  mm/memremap.c                             |  299 +++++---
>  tools/testing/nvdimm/dax-dev.c            |   22 -
>  tools/testing/nvdimm/test/iomap.c         |    2 
>  44 files changed, 1825 insertions(+), 601 deletions(-)
>  delete mode 100644 drivers/dax/hmem.c
>  create mode 100644 drivers/dax/hmem/Makefile
>  create mode 100644 drivers/dax/hmem/device.c
>  create mode 100644 drivers/dax/hmem/hmem.c
> 
> base-commit: 01830e6c042e8eb6eb202e05d7df8057135b4c26
> 


-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
