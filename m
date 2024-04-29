Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECA68B5317
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 10:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8400010FDDD;
	Mon, 29 Apr 2024 08:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEf5SOE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBFE10FDDD;
 Mon, 29 Apr 2024 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714379154; x=1745915154;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WNscBPM0GGHjKNd+HJ35/6EViQoUZjVHEKSnjaAfJQ0=;
 b=hEf5SOE4+zF/zKDFpthiX8IDxSaOd7LpeC3B9NQyKnXmf7zCpsMHb0eH
 cM6zJtA4jE5ehlscFaGLy+GbCEx837PoYov4JVnDFQab9xur3wPIHS7iA
 iMh3CTQcMBD72JqsE1uVa/b+hQgnl/KjrOXm6m08jPj6/jSk3sHljCd/L
 Z8mtV+nLmOsZ85m8YC9EZV9LwLrL5fhqRGgqLxuIjOxw6QSNs+bKe6C+D
 7gUhc3Q/f3LTs+12N88oWoQJXXfnkPsBHHZZoVIEAYJk3fGtSxQt579NL
 hO2Ksejk+jEvdoGacJ0n7mGFX4TxztBm4WGzVfo7mzS/mG/5BxZ2QQUj7 Q==;
X-CSE-ConnectionGUID: kwMRzQbZQ1Cj4gBkw3UWyQ==
X-CSE-MsgGUID: SF4ODh+3Ry+hQrEcwKZs0w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="27547865"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="27547865"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 01:25:53 -0700
X-CSE-ConnectionGUID: ewzeZA4WTaqipfPS3o4nsA==
X-CSE-MsgGUID: mKfc8SmuQ+OHVax7Ip/3hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="56927804"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO [10.249.254.23])
 ([10.249.254.23])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 01:25:51 -0700
Message-ID: <f938dc8f7309ae833e02ccdbc72134df0607dfa4.camel@linux.intel.com>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Zeng, Oak" <oak.zeng@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Brost, Matthew"
 <matthew.brost@intel.com>,  "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, Leon Romanovsky <leon@kernel.org>
Date: Mon, 29 Apr 2024 10:25:48 +0200
In-Reply-To: <20240426163519.GZ941030@nvidia.com>
References: <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240424134840.GJ941030@nvidia.com>
 <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
 <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
 <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
 <20240426163519.GZ941030@nvidia.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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

On Fri, 2024-04-26 at 13:35 -0300, Jason Gunthorpe wrote:
> On Fri, Apr 26, 2024 at 04:49:26PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Fri, 2024-04-26 at 09:00 -0300, Jason Gunthorpe wrote:
> > > On Fri, Apr 26, 2024 at 11:55:05AM +0200, Thomas Hellstr=C3=B6m wrote=
:
> > > > First, the gpu_vma structure is something that partitions the
> > > > gpu_vm
> > > > that holds gpu-related range metadata, like what to mirror,
> > > > desired
> > > > gpu
> > > > caching policies etc. These are managed (created, removed and
> > > > split)
> > > > mainly from user-space. These are stored and looked up from an
> > > > rb-
> > > > tree.
> > >=20
> > > Except we are talking about SVA here, so all of this should not
> > > be
> > > exposed to userspace.
> >=20
> > I think you are misreading. this is on the level "Mirror this
> > region of
> > the cpu_vm", "prefer this region placed in VRAM", "GPU will do
> > atomic
> > accesses on this region", very similar to cpu mmap / munmap and
> > madvise. What I'm trying to say here is that this does not directly
> > affect the SVA except whether to do SVA or not, and in that case
> > what
> > region of the CPU mm will be mirrored, and in addition, any gpu
> > attributes for the mirrored region.
>=20
> SVA is you bind the whole MM and device faults dynamically populate
> the mirror page table. There aren't non-SVA regions. Meta data, like
> you describe, is meta data for the allocation/migration mechanism,
> not
> for the page table or that has anything to do with the SVA mirror
> operation.



>=20
> Yes there is another common scheme where you bind a window of CPU to
> a
> window on the device and mirror a fixed range, but this is a quite
> different thing. It is not SVA, it has a fixed range, and it is
> probably bound to a single GPU VMA in a multi-VMA device page table.

And this above here is exactly what we're implementing, and the GPU
page-tables are populated using device faults. Regions (large) of the
mirrored CPU mm need to coexist in the same GPU vm as traditional GPU
buffer objects.

>=20
> SVA is not just a whole bunch of windows being dynamically created by
> the OS, that is entirely the wrong mental model. It would be horrible
> to expose to userspace something like that as uAPI. Any hidden SVA
> granules and other implementation specific artifacts must not be made
> visible to userspace!!

Implementation-specific artifacts are not to be made visible to user-
space.

>=20
> > > If you use dma_map_sg you get into the world of wrongness where
> > > you
> > > have to track ranges and invalidation has to wipe an entire range
> > > -
> > > because you cannot do a dma unmap of a single page from a
> > > dma_map_sg
> > > mapping. This is all the wrong way to use hmm_range_fault.
> > >=20
> > > hmm_range_fault() is page table mirroring, it fundamentally must
> > > be
> > > page-by-page. The target page table structure must have similar
> > > properties to the MM page table - especially page by page
> > > validate/invalidate. Meaning you cannot use dma_map_sg().
> >=20
> > To me this is purely an optimization to make the driver page-table
> > and
> > hence the GPU TLB benefit from iommu coalescing / large pages and
> > large
> > driver PTEs.
>=20
> This is a different topic. Leon is working on improving the DMA API
> to
> get these kinds of benifits for HMM users. dma_map_sg is not the path
> to get this. Leon's work should be significantly better in terms of
> optimizing IOVA contiguity for a GPU use case. You can get a
> guaranteed DMA contiguity at your choosen granual level, even up to
> something like 512M.
>=20
> > It is true that invalidation will sometimes shoot down
> > large gpu ptes unnecessarily but it will not put any additional
> > burden
> > on the core AFAICT.=20
>=20
> In my experience people doing performance workloads don't enable the
> IOMMU due to the high performance cost, so while optimizing iommu
> coalescing is sort of interesting, it is not as important as using
> the
> APIs properly and not harming the much more common situation when
> there is no iommu and there is no artificial contiguity.
>=20
> > on invalidation since zapping the gpu PTEs effectively stops any
> > dma
> > accesses. The dma mappings are rebuilt on the next gpu pagefault,
> > which, as you mention, are considered slow anyway, but will
> > probably
> > still reuse the same prefault region, hence needing to rebuild the
> > dma
> > mappings anyway.
>=20
> This is bad too. The DMA should not remain mapped after pages have
> been freed, it completely destroys the concept of IOMMU enforced DMA
> security and the ACPI notion of untrusted external devices.

Hmm. Yes, good point.

>=20
> > So as long as we are correct and do not adversely affect core mm,
> > If
> > the gpu performance (for whatever reason) is severely hampered if
> > large gpu page-table-entries are not used, couldn't this be
> > considered
> > left to the driver?
>=20
> Please use the APIs properly. We are trying to improve the DMA API to
> better support HMM users, and doing unnecessary things like this in
> drivers is only harmful to that kind of consolidation.
>=20
> There is nothing stopping getting large GPU page table entries for
> large CPU page table entries.
>=20
> > And a related question. What about THP pages? OK to set up a single
> > dma-mapping to those?
>=20
> Yes, THP is still a page and dma_map_page() will map it.

OK great. This is probably sufficient for the performance concern for
now.

Thanks,
Thomas

> =C2=A0
> > > > That's why finer-granularity mmu_interval notifiers might be
> > > > beneficial
> > > > (and then cached for future re-use of the same prefault range).
> > > > This
> > > > leads me to the next question:
> > >=20
> > > It is not the design, please don't invent crazy special Intel
> > > things
> > > on top of hmm_range_fault.
> >=20
> > For the record, this is not a "crazy special Intel" invention. It's
> > the
> > way all GPU implementations do this so far.
>=20
> "all GPU implementations" you mean AMD, and AMD predates alot of the
> modern versions of this infrastructure IIRC.
>=20
> > > Why would a prefetch have anything to do with a VMA? Ie your app
> > > calls
> > > malloc() and gets a little allocation out of a giant mmap() arena
> > > -
> > > you want to prefault the entire arena? Does that really make any
> > > sense?
> >=20
> > Personally, no it doesn't. I'd rather use some sort of fixed-size
> > chunk. But to rephrase, the question was more into the strong
> > "drivers
> > should not be aware of the cpu mm vma structures" comment.=20
>=20
> But this is essentially why - there is nothing useful the driver can
> possibly learn from the CPU VMA to drive
> hmm_range_fault(). hmm_range_fault already has to walk the VMA's if
> someday something is actually needed it needs to be integrated in a
> general way, not by having the driver touch vmas directly.
>=20
> Jason


