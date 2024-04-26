Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D7C8B3A5F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 16:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF05710F0E3;
	Fri, 26 Apr 2024 14:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgw5LlZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF0910F0DD;
 Fri, 26 Apr 2024 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714142973; x=1745678973;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Hy1Exm2xJTf9fsQ/ZOtQnbSL2sRLolyMOaITsaLxcig=;
 b=lgw5LlZvA/sb93sv93lShPmwuWiCaoh0GN2KL0r/fd7o2QwBnaXfO4Yq
 vlwQlzFztWgL48Ln8p+Hxb/eLgaUl9XVC21W+MtZLC+9TCOeRBW5vBGrP
 x8LR2wU7Eoo9b8XygzXCil7w2hHLnOxHepKfG1vmWqKDic6GrtKvoPTev
 XDouNBvy+qccnjtVyPUEymhjP0VogdLXasijdmC9eBFrtL3R1BQFw+wDL
 CasO6QQq8VE2MjemH+OJHNjQ/MiZSsFJiNpnqJINUvC3uAWIA3kN81RHT
 YrcF3zbnygkPcHtM2APfwIRahNsvMUMS6aczV3/CwBf3gAz0odddN3Gf/ A==;
X-CSE-ConnectionGUID: qTd2W925QZqz557NbuZUPg==
X-CSE-MsgGUID: k5Gj1ip6QZO5PMxjTwSM5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="32377803"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="32377803"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 07:49:32 -0700
X-CSE-ConnectionGUID: 8/2TrxHhR9K/QxzOPJWcSw==
X-CSE-MsgGUID: BjZv9niMT7iXatggBF72yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25513591"
Received: from acasaesb-mobl.amr.corp.intel.com (HELO [10.249.254.141])
 ([10.249.254.141])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 07:49:29 -0700
Message-ID: <ad82f95ee29ada403459416d4c97c2b9083b5a0f.camel@linux.intel.com>
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
Date: Fri, 26 Apr 2024 16:49:26 +0200
In-Reply-To: <20240426120047.GX941030@nvidia.com>
References: <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240424134840.GJ941030@nvidia.com>
 <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
 <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
 <20240426120047.GX941030@nvidia.com>
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

On Fri, 2024-04-26 at 09:00 -0300, Jason Gunthorpe wrote:
> On Fri, Apr 26, 2024 at 11:55:05AM +0200, Thomas Hellstr=C3=B6m wrote:
> > First, the gpu_vma structure is something that partitions the
> > gpu_vm
> > that holds gpu-related range metadata, like what to mirror, desired
> > gpu
> > caching policies etc. These are managed (created, removed and
> > split)
> > mainly from user-space. These are stored and looked up from an rb-
> > tree.
>=20
> Except we are talking about SVA here, so all of this should not be
> exposed to userspace.

I think you are misreading. this is on the level "Mirror this region of
the cpu_vm", "prefer this region placed in VRAM", "GPU will do atomic
accesses on this region", very similar to cpu mmap / munmap and
madvise. What I'm trying to say here is that this does not directly
affect the SVA except whether to do SVA or not, and in that case what
region of the CPU mm will be mirrored, and in addition, any gpu
attributes for the mirrored region.

>=20
> > Now, when we hit a fault, we want to use hmm_range_fault() to re-
> > populate the faulting PTE, but also to pre-fault a range. Using a
> > range
> > here (let's call this a prefault range for clarity) rather than to
> > insert a single PTE is for multiple reasons:
>=20
> I've never said to do a single range, everyone using
> hmm_range_fault()
> has some kind of prefetch populate around algorithm.
>=20
> > This is why we've been using dma_map_sg() for these ranges, since
> > it is
> > assumed the benefits gained from=20
>=20
> This doesn't logically follow. You need to use dma_map_page page by
> page and batch that into your update mechanism.
>=20
> If you use dma_map_sg you get into the world of wrongness where you
> have to track ranges and invalidation has to wipe an entire range -
> because you cannot do a dma unmap of a single page from a dma_map_sg
> mapping. This is all the wrong way to use hmm_range_fault.
>=20
> hmm_range_fault() is page table mirroring, it fundamentally must be
> page-by-page. The target page table structure must have similar
> properties to the MM page table - especially page by page
> validate/invalidate. Meaning you cannot use dma_map_sg().

To me this is purely an optimization to make the driver page-table and
hence the GPU TLB benefit from iommu coalescing / large pages and large
driver PTEs. It is true that invalidation will sometimes shoot down
large gpu ptes unnecessarily but it will not put any additional burden
on the core AFAICT. For the dma mappings themselves they aren't touched
on invalidation since zapping the gpu PTEs effectively stops any dma
accesses. The dma mappings are rebuilt on the next gpu pagefault,
which, as you mention, are considered slow anyway, but will probably
still reuse the same prefault region, hence needing to rebuild the dma
mappings anyway.

So as long as we are correct and do not adversely affect core mm, If
the gpu performance (for whatever reason) is severely hampered if
large gpu page-table-entries are not used, couldn't this be considered
left to the driver?

And a related question. What about THP pages? OK to set up a single
dma-mapping to those?


>=20
> > Second, when pre-faulting a range like this, the mmu interval
> > notifier
> > seqno comes into play, until the gpu ptes for the prefault range
> > are
> > safely in place. Now if an invalidation happens in a completely
> > separate part of the mirror range, it will bump the seqno and force
> > us
> > to rerun the fault processing unnecessarily.=20
>=20
> This is how hmm_range_fault() works. Drivers should not do hacky
> things to try to "improve" this. SVA granuals should be large, maybe
> not the entire MM, but still quite large. 2M is far to small.
>=20
> There is a tradeoff here of slowing down the entire MM vs risking an
> iteration during fault processing. We want to err toward making fault
> processing slowing because fault procesing is already really slow.
>=20
> > Hence, for this purpose we
> > ideally just want to get a seqno bump covering the prefault range.
>=20
> Ideally, but this is not something we can get for free.
>=20
> > That's why finer-granularity mmu_interval notifiers might be
> > beneficial
> > (and then cached for future re-use of the same prefault range).
> > This
> > leads me to the next question:
>=20
> It is not the design, please don't invent crazy special Intel things
> on top of hmm_range_fault.

For the record, this is not a "crazy special Intel" invention. It's the
way all GPU implementations do this so far. We're currently catching
up. If we're going to do this in another way, we fully need to
understand why it's a bad thing to do. That's why these questions are
asked.

>=20
> > You mention that mmu_notifiers are expensive to register. From
> > looking
> > at the code it seems *mmu_interval* notifiers are cheap unless
> > there
> > are ongoing invalidations in which case using a gpu_vma-wide
> > notifier
> > would block anyway? Could you clarify a bit more the cost involved
> > here?
>=20
> The rb tree insertions become expensive the larger the tree is. If
> you
> have only a couple of notifiers it is reasonable.
>=20
> > If we don't register these smaller-range interval notifiers, do
> > you think the seqno bumps from unrelated subranges would be a real
> > problem?
>=20
> I don't think it is, you'd need to have a workload which was
> agressively manipulating the CPU mm (which is also pretty slow). If
> the workload is doing that then it also really won't like being
> slowed
> down by the giant rb tree.

OK, this makes sense, and will also simplify implementation.

>=20
> You can't win with an argument that collisions are likely due to an
> app pattern that makes alot of stress on the MM so the right response
> is to make the MM slower.
>=20
> > Finally the size of the pre-faulting range is something we need to
> > tune.=20
>=20
> Correct.
>=20
> > Currently it is cpu vma - wide. I understand you strongly suggest
> > this should be avoided. Could you elaborate a bit on why this is
> > such a
> > bad choice?
>=20
> Why would a prefetch have anything to do with a VMA? Ie your app
> calls
> malloc() and gets a little allocation out of a giant mmap() arena -
> you want to prefault the entire arena? Does that really make any
> sense?

Personally, no it doesn't. I'd rather use some sort of fixed-size
chunk. But to rephrase, the question was more into the strong "drivers
should not be aware of the cpu mm vma structures" comment. While I
fully agree they are probably not very useful for determining the size
of gpu prefault regions, is there anything else we should be aware of
here.

Thanks,
Thomas


>=20
> Mirroring is a huge PITA, IMHO it should be discouraged in favour of
> SVA. Sadly too many CPUs still canot implement SVA.
>=20
> With mirroring there is no good way for the system to predict what
> the
> access pattern is. The only way to make this actually performant is
> for userspace to explicitly manage the mirroring with some kind of
> prefetching scheme to avoid faulting its accesses except in
> extrodinary cases.
>=20
> VMA is emphatically not a hint about what to prefetch. You should
> balance your prefetching based on HW performance and related. If it
> is
> tidy for HW to fault around a 2M granual then just do that.
>=20
> Jason

