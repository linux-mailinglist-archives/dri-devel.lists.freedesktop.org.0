Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B8A968382
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5283210E26A;
	Mon,  2 Sep 2024 09:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4RAxLK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23E7210E26A;
 Mon,  2 Sep 2024 09:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725270345; x=1756806345;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3FqHNCqQ2PxEPD6c0gpV6LohA9+foAPZMqgF35tUvr0=;
 b=m4RAxLK90PjnJwUbNtc+tB3KZE5h45VxT5LAJ1aRW4FsU7oM88Eyj6cJ
 sEzNUwUS9HKnejUT3XjJNhgQQDUQkAiw+Hp72qvVGVQXz+hDVo2hswZbA
 aP/82L7WXo7Rp1V8oinMkS97RoKsMuwZwJ8Rut2HbTo/gU0R+UFWLnl6i
 8Z33SVvajITbv8PeJuwVI20oopUlN90Hwth73K1nRlLevqeDh8pFcDnxY
 9hP3t1Y3q2tVt8GUkFRX6W7OKQav6sJG/U3+sGEWMlXmuJlj3q+Do1STH
 3kSh/lWJ/Ka5iuR9UdDyR3ZOv1oGQGrQ7fTEmfH1kVI8XAOgdY/2SRYrL g==;
X-CSE-ConnectionGUID: /KzDokRdTpatrgCtaak/7A==
X-CSE-MsgGUID: EeCTSi0IQJ2tAfzTkBiEkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="13328363"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="13328363"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:45:45 -0700
X-CSE-ConnectionGUID: cLYY9qHoQs6Tbwzc07kq1Q==
X-CSE-MsgGUID: UqE6OWo5SruaOCrFW7ebAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64758534"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.244.77])
 ([10.245.244.77])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:45:43 -0700
Message-ID: <7d4e0ccccd321a1cb66a9081d9a9f0089fb79e7e.camel@linux.intel.com>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared
 Virtual Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, christian.koenig@amd.com, matthew.auld@intel.com, 
 daniel@ffwll.ch
Date: Mon, 02 Sep 2024 11:45:40 +0200
In-Reply-To: <ZtHNV6z8B7g4nbPp@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <d66e492df25e8ec3533575245c10eb7dcca709ca.camel@linux.intel.com>
 <ZtCzo11oKXBeKmWp@DUT025-TGLU.fm.intel.com>
 <b657ceec08091a666bdd907f9171727ef395c093.camel@linux.intel.com>
 <ZtDgd7bd6RCs2Orl@DUT025-TGLU.fm.intel.com>
 <666768946f0d7dbf9373ab6369a4b0c7eefd8e2d.camel@linux.intel.com>
 <ZtHNV6z8B7g4nbPp@DUT025-TGLU.fm.intel.com>
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

Hi, Matt.

On Fri, 2024-08-30 at 13:47 +0000, Matthew Brost wrote:
> On Fri, Aug 30, 2024 at 11:57:33AM +0200, Thomas Hellstr=C3=B6m wrote:
> > Hi, Matthew,
> >=20
> > Agreed the below might not be important just now, but some ideas:
> >=20
> > On Thu, 2024-08-29 at 20:56 +0000, Matthew Brost wrote:
> > > Issues with removing a SVM range:
> > >=20
> > > - Xe bind code stores invalidation / present state in VMA, this
> > > would
> > > =C2=A0 need to be moved to the radix tree. I have Jira open for that
> > > work
> > > =C2=A0 which I believe other developers are going to own.
> >=20
> > Yeah, although we shouldn't *design* around xe bind-code and page-
> > table
> > code shortcomings.
> >=20
>=20
> I'm thinking this one certainly should be fixed sooner rather than
> later which would be helpful.
>=20
> But let's also consider the case where we get a bunch of individual
> page
> invalidates serially for an entire range (I can't remember when this
> happens but I have seen it in my testing, will look into this more to
> figure exactly when). If we invalidate 1 page at a time in radix
> tree,
> each invalidation could potentially results in TLB invalidation
> interaction with the hardware in cases where a larger GPU pages are
> not
> being used. The TLB invalidation is going to vastly slower than any
> CPU
> operation (e.g. RB search, radix tree walk). If we key on a range
> invalidate the entire once on the first invalidation this may end up
> being significantly faster.
>=20
> Above is pure speculation though, a lot of what both of us is saying
> is... So another reason I'd like to get apps running to do profiling.
> It
> would be nice to make design decisions based on data not speculation.

Well nothing would stop you from adding a configurable invalidation
granularity, even with a radix-tree based approach. You'd just pad the
invalidation range to match the granularity.

>=20
> >=20
> > > - Where would the dma mapping / device pages be stored?
> > > 	- In the radix tree? What if ATS is enabled? We don't
> > > have a
> > > 	=C2=A0 driver owned radix tree. How do we reasonably connect
> > > a
> > > driver
> > > 	=C2=A0 owned radix to a common GPUSVM layer?
> >=20
> > With ATS you mean IOMMU SVA, right? I think we could assume that
> > any
> > user of this code also has a gpu page-table since otherwise they
> > couldn't be using VRAM and a simpler solution would be in place.=C2=A0
> >=20
>=20
> Fair point.
>=20
> > But to that specific question, drm_gpusvm state would live in a
> > drm_gpusvm radix tree and driver-specific stuff in the driver tree.
> > A
> > helper based approach would then call drm_gpusvm_unmap_dma(range),
> > whereas a middle layer would just traverse the tree and unmap.
> >=20
>=20
> Let me consider this. Open to all options.
>=20
> > > 	- In the notifier? What is the notifier is sparsely
> > > populated?
> > > 	=C2=A0 We would be wasting huge amounts of memory. What is
> > > the
> > > 	=C2=A0 notifier is configured to span the entire virtual
> > > address
> > > 	=C2=A0 space?
> >=20
> > Let's assume you use a fake page-table like in xe_pt_walk.c as your
> > "radix tree", adapted to relevant page-sizes, sparsity is not a
> > problem.
> >=20
>=20
> Ok, makes sense I think.
>=20
> > > - How does the garbage collector work? We can't allocate memory
> > > in
> > > the
> > > =C2=A0 notifier so we don't anything to add to the garbage collector.
> > > We
> > > =C2=A0 can't directly modify page tables given you need lock in the
> > > path
> > > of
> > > =C2=A0 reclaim.
> >=20
> > The garbage collector would operate on the whole invalidated range.
> > In
> > the case of xe, upon zapping under reclaim you mark individual
> > page-
> > table bos that are to be removed as "invalid", the garbage
> > collector
> > walks the range removing the "invalid" entries. Subsequent (re-
> > binding)
> > avoids the "invalid" entries, (perhaps even helps removing them)
> > and
> > can thus race with the garbage collector. Hence, any ranges implied
> > by
> > the page-table code are elimitated.
> >=20
>=20
> This is pretty much with what I came up with too if we didn't have a
> SVM
> range.
>=20
> > > - How do we deal with fault storms (e.g. tons of faults hitting
> > > the
> > > same
> > > =C2=A0 SVM range in a row)? Without a SVM range no every to know if
> > > mapping
> > > =C2=A0 is valid and GPU page handler can be short circuited.
> >=20
> > Perhaps look at page-table tree and check whether the gpu_pte
> > causing
> > the fault is valid.
> >=20
>=20
> Came up with the same thing.
>=20
> > > - Do we have notifier seqno for every PTE?
> >=20
> > I'd say no. With this approach it makes sense to have a wide
> > notifier.
> > The seqno now only affects binding of new gpu_ptes, so the problem
> > with
> > a wide notifier becomes that if invalidation occurs to *any* part
> > of
> > the notifier while we're in the read section during binding, we
> > need to
>=20
> I have avoided this by the drm_gpusvm_range_pages_valid. This isn't
> just
> an optimization is actually required for the 2 tile case to be able
> to
> safely know when dma pages can be unmapped (i.e. you can't dma unmap
> pages if either tile has a valid mapping).

OK, I still need to read up on that..

Thanks,
Thomas


>=20
> Matt
>=20
> > rerun the binding. Adding more notifiers to mitigate that would be
> > to
> > optimize faulting performance over core invalidation performance
> > which
> > Jason asked us to avoid.
> >=20
> > /Thomas
> >=20
> >=20
> >=20

