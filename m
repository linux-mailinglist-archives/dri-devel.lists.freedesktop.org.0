Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC8596BC08
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426C910E796;
	Wed,  4 Sep 2024 12:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gLJc+g6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031C510E796;
 Wed,  4 Sep 2024 12:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725452840; x=1756988840;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=RYOXWp9cX2LbWE/VIN5RsaQPMsSoLOhzRUj7fPWJpPE=;
 b=gLJc+g6rp4c/OBJIkvE2fUgXaPOafK6ONZ50bUmKP50+8J6h9Gh4YrRn
 mcZpcVuKQhfoi9rP82Hlp4Hnld5EMf+pE2KiXGeUPUXAc3E7kjC3L869j
 MJ5m8ACilIe1Ux6D6ZZSA3ecYNCXl+WIv/mBlhVmXlM3pz+ZhIGNsOFOt
 JqWfRtEWf/KSReD4G1kesvGV8LslHKlupH3kCGktzr+fIz/5gpJV9PtkH
 uNf+BbaKOlbBJpqHPfPHEhfri5ol/kplVMbSqdj53OyIFYfPxSCIJ1Uua
 uieLJjFOu364OzEBqIDR7iaaPdyBzKXB8rgD32Z2hJ/DR+iYIq5Zqk/FI Q==;
X-CSE-ConnectionGUID: QAHusKuEQlyTLU/3VcOeYw==
X-CSE-MsgGUID: 7d8c3bBIQ66zc1yhZeUIrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="27871450"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="27871450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 05:27:20 -0700
X-CSE-ConnectionGUID: osPqUr8CSHSgJZvKUt5cWA==
X-CSE-MsgGUID: dPXQx7xsQ0SUjb4HFG49Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65494284"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO [10.245.245.159])
 ([10.245.245.159])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 05:27:17 -0700
Message-ID: <740fb4b8d88385c879b2b9be2f7f24a38b96b3c3.camel@linux.intel.com>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared
 Virtual Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, christian.koenig@amd.com, matthew.auld@intel.com, 
 daniel@ffwll.ch
Date: Wed, 04 Sep 2024 14:27:15 +0200
In-Reply-To: <ZtWwhM5rJDVVFbVf@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <d66e492df25e8ec3533575245c10eb7dcca709ca.camel@linux.intel.com>
 <ZtCzo11oKXBeKmWp@DUT025-TGLU.fm.intel.com>
 <b657ceec08091a666bdd907f9171727ef395c093.camel@linux.intel.com>
 <ZtDgd7bd6RCs2Orl@DUT025-TGLU.fm.intel.com>
 <ZtWwhM5rJDVVFbVf@phenom.ffwll.local>
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

Hi, Sima,

On Mon, 2024-09-02 at 14:33 +0200, Daniel Vetter wrote:
> Jumping in here in the middle, since I think it's a solid place to
> drop my
> idea of "align with core mm" gpusvm locking ...
>=20
> On Thu, Aug 29, 2024 at 08:56:23PM +0000, Matthew Brost wrote:
> > On Thu, Aug 29, 2024 at 09:18:29PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Issues with removing a SVM range:
> >=20
> > - Xe bind code stores invalidation / present state in VMA, this
> > would
> > =C2=A0 need to be moved to the radix tree. I have Jira open for that
> > work
> > =C2=A0 which I believe other developers are going to own.
> > - Where would the dma mapping / device pages be stored?
> > 	- In the radix tree? What if ATS is enabled? We don't have
> > a
> > 	=C2=A0 driver owned radix tree. How do we reasonably connect a
> > driver
> > 	=C2=A0 owned radix to a common GPUSVM layer?
>=20
> Yeah this one is really annoying, because the core mm gets away with
> nothing because it can just store the pfn in the pte. And it doesn't
> need
> anything else. So we probably still need something unfortuantely ...
>=20
> > 	- In the notifier? What is the notifier is sparsely
> > populated?
> > 	=C2=A0 We would be wasting huge amounts of memory. What is the
> > 	=C2=A0 notifier is configured to span the entire virtual
> > address
> > 	=C2=A0 space?
>=20
> So if we go with the radix idea, we could model the radix to exactly
> match
> the gpu pagetables. That's essentially what the core mm does. Then
> each
> pagetable at each level has a spinlock for essentially a range lock.
> notifier seqno would be stored into each pagetable (not the
> endividual
> entries, that's probably too much), which should allow us to very
> effeciently check whether an entire arbitrary va range is still valid
> on
> the fault side.

I still wonder wether this should be owned by the driver, though. And
if we were optimizing for multiple simultaneous fault processing with a
small granularity, I would agree, but given that gpu pagefaults are
considered so slow they should be avoided, I wonder whether xe's
current approach of a single page-table lock wouldn't suffice, in
addition to a semi-global seqno?

For invalidations, I think we actually currently allow simultaneous
overlapping invalidations that are only protected by the write-side of
the notifier seqno.

>=20
> On the notifier side we can also very efficiently walk arbitrary
> ranges,
> because the locking is really fine-grained and in an adaptive way.
>=20
> > - How does the garbage collector work? We can't allocate memory in
> > the
> > =C2=A0 notifier so we don't anything to add to the garbage collector. W=
e
> > =C2=A0 can't directly modify page tables given you need lock in the pat=
h
> > of
> > =C2=A0 reclaim.
>=20
> Probably no more garbage collector, you deal with pages/folios like
> the
> core mm expects.

Yeah, if the page-table locks are reclaim-safe no more garbage
collector, but OTOH, IIRC even in core-mm, the invalidation
counterpart, unmap_mapping_range() can't and doesn't remove page-table
subtrees when called from the address-space side, whereas zapping when
called from the mm side, like madvise(WONTNEED), can.

/Thomas



>=20
> > - How do we deal with fault storms (e.g. tons of faults hitting the
> > same
> > =C2=A0 SVM range in a row)? Without a SVM range no every to know if
> > mapping
> > =C2=A0 is valid and GPU page handler can be short circuited.
>=20
> So the core mm sorts this out by allowing faults to be handled in
> parallel, without any lock. Essentially:
> - you get a fault (or prefault)
> - you hold just enough read locks to make sure stuff doesn't
> disappear.
> =C2=A0 Currently that's mmap_read_lock, but strictly speaking we only nee=
d
> the
> =C2=A0 new-ish per-vma lock.
> - you allocate memory, dma_map, everything else you need
> - you grab that very fine-grained radix tree lock (pagetable locks on
> the
> =C2=A0 cpu side) and recheck whether you've raced: mmu notifier seqno and
> the
> =C2=A0 pte must still be non-present. If that check fails, you bail out
> and
> =C2=A0 release all the vram/dma_maps you've created.
>=20
> > - Do we have notifier seqno for every PTE?
>=20
> I think per-pagetable, so every node in the radix tree, would make
> sense.
> If we go with also one lock per pagetable like the cpu mm then
> tracking
> notifier seqno to match makes the most sense imo.
>=20
> Again, this is entirely aside from the discussion in this subthread
> about
> understanding the current design and tradeoffs/reasons. Just figured
> this
> is a good spot to drop this.
> -Sima

