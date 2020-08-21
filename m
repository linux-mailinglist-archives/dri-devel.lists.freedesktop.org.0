Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55724D212
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 12:15:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DF26EAC7;
	Fri, 21 Aug 2020 10:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3B46EAC7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 10:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598004930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=PmsTrWC7QL0R7Dl8wMRdta4a1oPLZaekFOdsDnhXsJY=;
 b=CDGs0sAacf1B2Wq9S5IA5coGAQGrPZvOAK5qdZnSn51R4u4jVbKHHMqGJFo0NseXXzoFQK
 iW60Ftz38TYxNkhjFdcgMML1uoZolI3hCmGGz/iVNZk789PGqJ/rr6oaGpO0cvx9TrT2pN
 0lA8Xx69XvbyQIXMBLwov8nx75vSDy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-UcZwKt8kPgaJ_9wxSbWINA-1; Fri, 21 Aug 2020 06:15:20 -0400
X-MC-Unique: UcZwKt8kPgaJ_9wxSbWINA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8B2A80733B;
 Fri, 21 Aug 2020 10:15:14 +0000 (UTC)
Received: from [10.36.114.87] (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1404219C78;
 Fri, 21 Aug 2020 10:15:03 +0000 (UTC)
Subject: Re: [PATCH v4 00/23] device-dax: Support sub-dividing soft-reserved
 ranges
To: Dan Williams <dan.j.williams@intel.com>
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
 <c59111f9-7c94-8b9e-2b8c-4cb96b9aa848@redhat.com>
 <CAPcyv4j8-5nWU5GPDBoFicwR84qM=hWRtd78DkcCg4PW-8i6Vg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <6af3de0d-ffdc-8942-3922-ebaeef20dd63@redhat.com>
Date: Fri, 21 Aug 2020 12:15:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4j8-5nWU5GPDBoFicwR84qM=hWRtd78DkcCg4PW-8i6Vg@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Dave Hansen <dave.hansen@linux.intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@ozlabs.org>, Linux MM <linux-mm@kvack.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "H. Peter Anvin" <hpa@zytor.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, X86 ML <x86@kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jeff Moyer <jmoyer@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Ira Weiny <ira.weiny@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jia He <justin.he@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Yang <richardw.yang@linux.intel.com>, Brice Goglin <Brice.Goglin@inria.fr>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>>
>> 1. On x86-64, e820 indicates "soft-reserved" memory. This memory is not
>> automatically used in the buddy during boot, but remains untouched
>> (similar to pmem). But as it involves ACPI as well, it could also be
>> used on arm64 (-e820), correct?
> 
> Correct, arm64 also gets the EFI support for enumerating memory this
> way. However, I would clarify that whether soft-reserved is given to
> the buddy allocator by default or not is the kernel's policy choice,
> "buddy-by-default" is ok and is what will happen anyways with older
> kernels on platforms that enumerate a memory range this way.

Is "soft-reserved" then the right terminology for that? It sounds very
x86-64/e820 specific. Maybe a compressed for of "performance
differentiated memory" might be a better fit to expose to user space, no?

> 
>> 2. Soft-reserved memory is volatile RAM with differing performance
>> characteristics ("performance differentiated memory"). What would be
>> examples of such memory?
> 
> Likely the most prominent one that drove the creation of the "EFI
> Specific Purpose" attribute bit is high-bandwidth memory. One concrete
> example of that was a platform called Knights Landing [1] that ended
> up shipping firmware that lied to the OS about the latency
> characteristics of the memory to try to reverse engineer OS behavior
> to not allocate from that memory range by default. With the EFI
> attribute firmware performance tables can tell the truth about the
> performance characteristics of the memory range *and* indicate that
> the OS not use it for general purpose allocations by default.

Thanks for clarifying!

> 
> [1]: https://software.intel.com/content/www/us/en/develop/blogs/an-intro-to-mcdram-high-bandwidth-memory-on-knights-landing.html
> 
>> Like, memory that is faster than RAM (scratch
>> pad), or slower (pmem)? Or both? :)
> 
> Both, but note that PMEM is already hard-reserved by default.
> Soft-reserved is about a memory range that, for example, an
> administrator may want to reserve 100% for a weather simulation where
> if even a small amount of memory was stolen for the page cache the
> application may not meet its performance targets. It could also be a
> memory range that is so slow that only applications with higher
> latency tolerances would be prepared to consume it.
> 
> In other words the soft-reserved memory can be used to indicate memory
> that is either too precious, or too slow for general purpose OS
> allocations.

Right, so actually performance-differentiated in any way :)

> 
>> Is it a valid use case to use pmem
>> in a hypervisor to back this memory?
> 
> Depends on the pmem. That performance capability is indicated by the
> ACPI HMAT, not the EFI soft-reserved designation.
> 
>> 3. There seem to be use cases where "soft-reserved" memory is used via
>> DAX. What is an example use case? I assume it's *not* to treat it like
>> PMEM but instead e.g., use it as a fast buffer inside applications or
>> similar.
> 
> Right, in that weather-simulation example that application could just
> mmap /dev/daxX.Y and never worry about contending for the "fast
> memory" resource on the platform. Alternatively if that resource needs
> to be shared and/or over-commited then kernel memory-management
> services are needed and that dax-device can be assigned to kmem.
> 
>> 4. There seem to be use cases where some part of "soft-reserved" memory
>> is used via DAX, some other is given to the buddy. What is an example
>> use case? Is this really necessary or only some theoretical use case?
> 
> It's as necessary as pmem namespace partitioning, or the inclusion of
> dax-kmem upstream in the first place. In that kmem case the motivation
> was that some users want a portion of pmem provisioned for storage and
> some for volatile usage. The motivation is similar here, platform
> firmware can only identify memory attributes on coarse boundaries,
> finer grained provisioning decisions are up to the administrator /
> platform-owner and the kernel is a just a facilitator of that policy.
> 
>>
>> 5. The "provisioned along performance relevant address boundaries." part
>> is unclear to me. Can you give an example of how this would look like
>> from user space? Like, split that memory in blocks of size X with
>> alignment Y and give them to separate applications?
> 
> One example of platform address boundaries are the memory address
> ranges that alias in a direct-mapped memory-side-cache. In the
> direct-map-cache aliasing may repeat every N GBs where N is the ratio
> of far-to-near memory. ("Near memory" ==  cache "Far memory" ==
> backing memory). Also refer back to the background in the page
> allocator shuffling patches [2]. With this partitioning mechanism you
> could, for one example use case, assign different VMs to exclusive
> colors in the memory side cache.

Interesting, thanks!

> 
> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e900a918b098
> 
>> 6. If you add such memory to the buddy, is there any way the system can
>> differentiate it from other memory? E.g., via fake/other NUMA nodes?
> 
> Numa node numbers / are how performance differentiated memory ranges
> are enumerated. The expectation is that all distinct performance
> memory targets have unique ACPI proximity domains and Linux numa node
> numbers as a result.

Makes sense to me (although it's somehow weird, because memory of the
same socket/node would be represented via different NUMA nodes), thanks!

> 
>> Also, can you give examples of how kmem-added memory is represented in
>> /proc/iomem for a) pmem and b) soft-resered memory after this series
>> (skimming over the patches, I think there is a change for pmem, right?)?
> 
> I don't expect a change. The only difference is the parent resource
> will be marked "Soft Reserved" instead of "Persistent Memory".

Right, I misread patch #11 while skimming - I thought the device
resource would be dropped.

> 
>> I am really wondering if it's the right approach to squeeze this into
>> our pmem/nvdimm infrastructure just because it's easy to do. E.g., man
>> "ndctl" - "ndctl - Manage "libnvdimm" subsystem devices (Non-volatile
>> Memory)" speaks explicitly about non-volatile memory.
> 
> In fact it's not squeezed into PMEM infrastructure. dax-kmem and
> device-dax are independent of PMEM. PMEM is one source of potential
> device-dax instances, soft-reserved memory is another orthogonal
> source. This is why device-dax needs its own userspace policy directed
> partitioning mechanism because there is no PMEM to store the
> configuration for partitioned higph-bandwidth memory. The userspace
> tooling for this mechanism is targeted for a tool called daxctl that
> has no PMEM dependencies. Look to Joao's use case that is using this
> infrastructure independent of PMEM with manual soft-reservations
> specified on the kernel command-line.

Thanks for clarifying, I was under the impression we would be reusing
libnvdimm to manage that memory.

-- 
Thanks,

David / dhildenb

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
