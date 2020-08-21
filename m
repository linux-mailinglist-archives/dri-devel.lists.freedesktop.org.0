Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC69C24DF70
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 20:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080C56E364;
	Fri, 21 Aug 2020 18:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916536E364
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 18:27:15 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id df16so2223737edb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=shQPOS/D8M4JXXfHHqbOPcw2UQKwykbpQIY4dcI2U7Y=;
 b=ikEqxcCd/y/+zxCU3xzhcSEWvCbwaJlbGlOLU2haz4TMsmbxrj69tC+ooBZKr1P46K
 Y/7oKiPoeLuokNW96KPRtAis1XU6MgYlKWUKvQfz8bSKiVBb67RiS0n0+HRUObc5MDsW
 Hr3XRWSkRsygWIu9BTIsi89UxDTlWl8Jx9e2TdeSI6TKHW9SjyD7428aN8ZO1JgSF/V0
 +Brg8zgjea9I5lp6ABFKyqv+3kw+5eJlt3SUzM8JbPrdtocIn8IqPjTZ6pdIonV414Jr
 hemzvtz9IMppAPXxjRI7BvSPqSEEqKaV80yw0+UV60kLQjbkHtoPrvueFGux9mlE+28a
 SxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shQPOS/D8M4JXXfHHqbOPcw2UQKwykbpQIY4dcI2U7Y=;
 b=MckmaJm4OnhVWW4z7eh65XaOs1Y4fsQjcVItkxo1YhrV0q2dOuwkUEm8BSNG49ICN+
 dv4Zyvk+c8HfDZ4p600uII2gF7XjH6bTbgW+ClcNLFDLJaFwAR9YxZughIMJG/OmhdV2
 UgPsrqlg5p8LQJXBCsQAf13+oHE7uH/laip6CwLO5/8tNcYuXll23YSKaRQUnRa589lS
 JfVuXAfmYDI7zDD5r+vE7JOvGrkbUF3BTKpdEr0mgFoq4Ln8e8tUP2SqbjzFCjdNOUvK
 kURZBEtVnebMVcMl4l8LuyPs4oSwBNyMHpErAOHVIFWkLdFbhgueKaO4EdK3uY5Wd3/h
 7kxA==
X-Gm-Message-State: AOAM533gcf1Q9tWIx0kswq7AIgIR+J7ZQZy1tzHTwJPFQC/EQ8MzOvp5
 fEkTNQRJ7FhXoM+5ci6sUu+mpnZlQD9ucjnwK9N20A==
X-Google-Smtp-Source: ABdhPJybztVE4gXLhNJ22ci71mCL3Z3O9B1wFb6gumUxHdS4tr+MkLUxFoeUsR3zIwYETLG65En3MWLdGKGctB6CK1k=
X-Received: by 2002:a05:6402:30a5:: with SMTP id
 df5mr4051980edb.18.1598034434104; 
 Fri, 21 Aug 2020 11:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
 <c59111f9-7c94-8b9e-2b8c-4cb96b9aa848@redhat.com>
 <CAPcyv4j8-5nWU5GPDBoFicwR84qM=hWRtd78DkcCg4PW-8i6Vg@mail.gmail.com>
 <6af3de0d-ffdc-8942-3922-ebaeef20dd63@redhat.com>
In-Reply-To: <6af3de0d-ffdc-8942-3922-ebaeef20dd63@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 21 Aug 2020 11:27:02 -0700
Message-ID: <CAPcyv4h=oBnzmP2PHAFX6H2jsNq8zSUzQLYySj0Ke7FAqZwb0A@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] device-dax: Support sub-dividing soft-reserved
 ranges
To: David Hildenbrand <david@redhat.com>
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

On Fri, Aug 21, 2020 at 3:15 AM David Hildenbrand <david@redhat.com> wrote:
>
> >>
> >> 1. On x86-64, e820 indicates "soft-reserved" memory. This memory is not
> >> automatically used in the buddy during boot, but remains untouched
> >> (similar to pmem). But as it involves ACPI as well, it could also be
> >> used on arm64 (-e820), correct?
> >
> > Correct, arm64 also gets the EFI support for enumerating memory this
> > way. However, I would clarify that whether soft-reserved is given to
> > the buddy allocator by default or not is the kernel's policy choice,
> > "buddy-by-default" is ok and is what will happen anyways with older
> > kernels on platforms that enumerate a memory range this way.
>
> Is "soft-reserved" then the right terminology for that? It sounds very
> x86-64/e820 specific. Maybe a compressed for of "performance
> differentiated memory" might be a better fit to expose to user space, no?

No. The EFI "Specific Purpose" bit is an attribute independent of
e820, it's x86-Linux that entangles those together. There is no
requirement for platform firmware to use that designation even for
drastic performance differentiation between ranges, and conversely
there is no requirement that memory *with* that designation has any
performance difference compared to the default memory pool. So it
really is a reservation policy about a memory range to keep out of the
buddy allocator by default.

[..]
> > Both, but note that PMEM is already hard-reserved by default.
> > Soft-reserved is about a memory range that, for example, an
> > administrator may want to reserve 100% for a weather simulation where
> > if even a small amount of memory was stolen for the page cache the
> > application may not meet its performance targets. It could also be a
> > memory range that is so slow that only applications with higher
> > latency tolerances would be prepared to consume it.
> >
> > In other words the soft-reserved memory can be used to indicate memory
> > that is either too precious, or too slow for general purpose OS
> > allocations.
>
> Right, so actually performance-differentiated in any way :)

... or not differentiated at all which is Joao's use case for example.

[..]
> > Numa node numbers / are how performance differentiated memory ranges
> > are enumerated. The expectation is that all distinct performance
> > memory targets have unique ACPI proximity domains and Linux numa node
> > numbers as a result.
>
> Makes sense to me (although it's somehow weird, because memory of the
> same socket/node would be represented via different NUMA nodes), thanks!

Yes, numa ids as only physical socket identifiers is no longer a
reliable assumption since the introduction of the ACPI HMAT.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
