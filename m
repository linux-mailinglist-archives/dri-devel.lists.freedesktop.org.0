Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED924CCB0F5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 10:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D925810E762;
	Thu, 18 Dec 2025 09:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvQy4xH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B6F10E762;
 Thu, 18 Dec 2025 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766048682; x=1797584682;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8kkjjekZqIZsBcoyOJeYGtTvPY5vSoVDyewwsV/oV0Y=;
 b=nvQy4xH++nPHRj7B8hfd0e7fuaiPPD6k5vO7ovsH4TdfLQSXwrNF/8hJ
 2oZpNIruowcox46k8qeZF2O7P3y7Zd5HeGn4LIsQQfjVVu/6hTrTqoS4I
 DjA3BB15MNOs/cf2zID13OvHmh6Yzqu02R4AyzyuWv0Kr7gKLQSUAdcjY
 v8VE7n/gtzIKEdY2tFIBsBdJbhTYLanmcTMYE3/AxTAst50RNeKXSlMi3
 LzXQId2GXIpz6DifDYQLvTpqsojJKTcqlauNFLbYXwWeDesaH6T9iyb6B
 2sbosqRd90TyVKs0fkSuoSmeByalChoky+dmAY6/5ZAoaEV/JTsVPdK5Y A==;
X-CSE-ConnectionGUID: CViFDjZpQKGGKaDM7NLy0w==
X-CSE-MsgGUID: 4lcfPWpXTaeixOVBBvvKNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79454786"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="79454786"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 01:04:41 -0800
X-CSE-ConnectionGUID: e+vZM+MWRyi8qDFoj/jZig==
X-CSE-MsgGUID: rG7O7YMDQMyZmA/WYxRBjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="199007453"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.244])
 ([10.245.245.244])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 01:04:38 -0800
Message-ID: <67a542ba3df21634b934c98a8d5ae94b33d683f1.camel@linux.intel.com>
Subject: Re: [PATCH v4 21/22] drm/pagemap, drm/xe: Support destination
 migration over interconnect
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Thu, 18 Dec 2025 10:04:35 +0100
In-Reply-To: <aUNW2nLEpgAy6qAt@lstrano-desk.jf.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-22-thomas.hellstrom@linux.intel.com>
 <aUNW2nLEpgAy6qAt@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi, Matt

Thanks for reviewing.

On Wed, 2025-12-17 at 17:20 -0800, Matthew Brost wrote:
> On Thu, Dec 11, 2025 at 05:59:08PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Support destination migration over interconnect when migrating from
> > device-private pages with the same dev_pagemap owner.
> >=20
> > Since we now also collect device-private pages to migrate,
> > also abort migration if the range to migrate is already
> > fully populated with pages from the desired pagemap.
> >=20
> > Finally return -EBUSY from drm_pagemap_populate_mm()
> > if the migration can't be completed without first migrating all
> > pages in the range to system. It is expected that the caller
> > will perform that before retrying the call to
> > drm_pagemap_populate_mm().
> >=20
> > Assume for now that the drm_pagemap implementation is *not*
> > capable of migrating data within the pagemap itself. This
> > restriction will be configurable in upcoming patches.
> >=20
> > v3:
> > - Fix a bug where the p2p dma-address was never used.
> > - Postpone enabling destination interconnect migration,
> > =C2=A0 since xe devices require source interconnect migration to
> > =C2=A0 ensure the source L2 cache is flushed at migration time.
> > - Update the drm_pagemap_migrate_to_devmem() interface to
> > =C2=A0 pass migration details.
> > v4:
> > - Define XE_INTERCONNECT_P2P unconditionally (CI)
> > - Include a missing header (CI)
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0 | 188 +++++++++++++++++=
++++++-----
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_migrate.c |=C2=A0=C2=A0 4 +-
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 ++=
+--
> > =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
 1 +
> > =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 19 +++-
> > =C2=A05 files changed, 179 insertions(+), 59 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > b/drivers/gpu/drm/drm_pagemap.c
> > index 77f8ea5ed802..56bedb622264 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -206,10 +206,12 @@ static void
> > drm_pagemap_get_devmem_page(struct page *page,
> > =C2=A0/**
> > =C2=A0 * drm_pagemap_migrate_map_pages() - Map migration pages for GPU
> > SVM migration
> > =C2=A0 * @dev: The device for which the pages are being mapped
> > + * @local_dpagemap: The drm_pagemap pointer of the local
> > drm_pagemap.
> > =C2=A0 * @pagemap_addr: Array to store DMA information corresponding to
> > mapped pages
> > =C2=A0 * @migrate_pfn: Array of migrate page frame numbers to map
> > =C2=A0 * @npages: Number of pages to map
> > =C2=A0 * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + * @mdetails: Details governing the migration behaviour.
> > =C2=A0 *
> > =C2=A0 * This function maps pages of memory for migration usage in GPU
> > SVM. It
> > =C2=A0 * iterates over each page frame number provided in @migrate_pfn,
> > maps the
> > @@ -219,12 +221,15 @@ static void
> > drm_pagemap_get_devmem_page(struct page *page,
> > =C2=A0 * Returns: 0 on success, -EFAULT if an error occurs during
> > mapping.
> > =C2=A0 */
> > =C2=A0static int drm_pagemap_migrate_map_pages(struct device *dev,
> > +					 struct drm_pagemap
> > *local_dpagemap,
> > =C2=A0					 struct drm_pagemap_addr
> > *pagemap_addr,
> > =C2=A0					 unsigned long
> > *migrate_pfn,
> > =C2=A0					 unsigned long npages,
> > -					 enum dma_data_direction
> > dir)
> > +					 enum dma_data_direction
> > dir,
> > +					 const struct
> > drm_pagemap_migrate_details *mdetails)
> > =C2=A0{
> > =C2=A0	unsigned long i;
> > +	unsigned long num_peer_pages =3D 0;
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < npages;) {
> > =C2=A0		struct page *page =3D
> > migrate_pfn_to_page(migrate_pfn[i]);
> > @@ -235,31 +240,50 @@ static int
> > drm_pagemap_migrate_map_pages(struct device *dev,
> > =C2=A0		if (!page)
> > =C2=A0			goto next;
> > =C2=A0
> > -		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > -			return -EFAULT;
> > -
> > =C2=A0		folio =3D page_folio(page);
> > =C2=A0		order =3D folio_order(folio);
> > =C2=A0
> > -		dma_addr =3D dma_map_page(dev, page, 0,
> > page_size(page), dir);
> > -		if (dma_mapping_error(dev, dma_addr))
> > -			return -EFAULT;
> > +		if (is_device_private_page(page)) {
> > +			struct drm_pagemap_zdd *zdd =3D page-
> > >zone_device_data;
> > +			struct drm_pagemap *dpagemap =3D zdd-
> > >dpagemap;
> > +			struct drm_pagemap_addr addr;
> > +
> > +			if (dpagemap =3D=3D local_dpagemap &&
> > !mdetails->can_migrate_same_pagemap)
> > +				goto next;
> > =C2=A0
> > -		pagemap_addr[i] =3D
> > -			drm_pagemap_addr_encode(dma_addr,
> > -
> > 						DRM_INTERCONNECT_SYSTEM,
> > -						order, dir);
> > +			num_peer_pages +=3D NR_PAGES(order);
> > +			addr =3D dpagemap->ops->device_map(dpagemap,
> > dev, page, order, dir);
> > +			if (dma_mapping_error(dev, addr.addr))
> > +				return -EFAULT;
> > +
> > +			pagemap_addr[i] =3D addr;
> > +		} else {
> > +			dma_addr =3D dma_map_page(dev, page, 0,
> > page_size(page), dir);
> > +			if (dma_mapping_error(dev, dma_addr))
> > +				return -EFAULT;
> > +
> > +			pagemap_addr[i] =3D
> > +				drm_pagemap_addr_encode(dma_addr,
> > +							DRM_INTERC
> > ONNECT_SYSTEM,
> > +							order,
> > dir);
> > +		}
> > =C2=A0
> > =C2=A0next:
> > =C2=A0		i +=3D NR_PAGES(order);
> > =C2=A0	}
> > =C2=A0
> > +	if (num_peer_pages)
> > +		drm_dbg(local_dpagemap->drm, "Migrating %lu peer
> > pages over interconnect.\n",
> > +			num_peer_pages);
> > +
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * drm_pagemap_migrate_unmap_pages() - Unmap pages previously
> > mapped for GPU SVM migration
> > =C2=A0 * @dev: The device for which the pages were mapped
> > + * @migrate_pfn: Array of migrate pfns set up for the mapped
> > pages. Used to
> > + * determine the drm_pagemap of a peer device private page.
> > =C2=A0 * @pagemap_addr: Array of DMA information corresponding to mappe=
d
> > pages
> > =C2=A0 * @npages: Number of pages to unmap
> > =C2=A0 * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > @@ -270,16 +294,27 @@ static int
> > drm_pagemap_migrate_map_pages(struct device *dev,
> > =C2=A0 */
> > =C2=A0static void drm_pagemap_migrate_unmap_pages(struct device *dev,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 struct
> > drm_pagemap_addr *pagemap_addr,
> > +					=C2=A0=C2=A0=C2=A0 unsigned long
> > *migrate_pfn,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 unsigned long npages,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 enum
> > dma_data_direction dir)
> > =C2=A0{
> > =C2=A0	unsigned long i;
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < npages;) {
> > -		if (!pagemap_addr[i].addr ||
> > dma_mapping_error(dev, pagemap_addr[i].addr))
> > +		struct page *page =3D
> > migrate_pfn_to_page(migrate_pfn[i]);
> > +
> > +		if (!page || !pagemap_addr[i].addr ||
> > dma_mapping_error(dev, pagemap_addr[i].addr))
> > =C2=A0			goto next;
> > =C2=A0
> > -		dma_unmap_page(dev, pagemap_addr[i].addr,
> > PAGE_SIZE << pagemap_addr[i].order, dir);
> > +		if (is_zone_device_page(page)) {
> > +			struct drm_pagemap_zdd *zdd =3D page-
> > >zone_device_data;
> > +			struct drm_pagemap *dpagemap =3D zdd-
> > >dpagemap;
> > +
> > +			dpagemap->ops->device_unmap(dpagemap, dev,
> > pagemap_addr[i]);
> > +		} else {
> > +			dma_unmap_page(dev, pagemap_addr[i].addr,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE <<
> > pagemap_addr[i].order, dir);
> > +		}
> > =C2=A0
> > =C2=A0next:
> > =C2=A0		i +=3D NR_PAGES(pagemap_addr[i].order);
> > @@ -301,8 +336,7 @@ npages_in_range(unsigned long start, unsigned
> > long end)
> > =C2=A0 * @mm: Pointer to the struct mm_struct.
> > =C2=A0 * @start: Start of the virtual address range to migrate.
> > =C2=A0 * @end: End of the virtual address range to migrate.
> > - * @timeslice_ms: The time requested for the migrated pagemap
> > pages to
> > - * be present in @mm before being allowed to be migrated back.
> > + * @mdetails: Details to govern the migration.
> > =C2=A0 *
> > =C2=A0 * This function migrates the specified virtual address range to
> > device memory.
> > =C2=A0 * It performs the necessary setup and invokes the driver-specifi=
c
> > operations for
> > @@ -320,7 +354,7 @@ npages_in_range(unsigned long start, unsigned
> > long end)
>=20
> Update kernel doc to indicate devmem_allocation is consumed on
> failure?

Sure.

>=20
> > =C2=A0int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem
> > *devmem_allocation,
> > =C2=A0				=C2=A0 struct mm_struct *mm,
> > =C2=A0				=C2=A0 unsigned long start, unsigned
> > long end,
> > -				=C2=A0 unsigned long timeslice_ms)
> > +				=C2=A0 const struct
> > drm_pagemap_migrate_details *mdetails)
> > =C2=A0{
> > =C2=A0	const struct drm_pagemap_devmem_ops *ops =3D
> > devmem_allocation->ops;
> > =C2=A0	struct drm_pagemap *dpagemap =3D devmem_allocation-
> > >dpagemap;
> > @@ -329,9 +363,11 @@ int drm_pagemap_migrate_to_devmem(struct
> > drm_pagemap_devmem *devmem_allocation,
> > =C2=A0		.start		=3D start,
> > =C2=A0		.end		=3D end,
> > =C2=A0		.pgmap_owner	=3D pagemap->owner,
> > -		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM,
> > +		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM |
> > MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> > +		(mdetails->source_peer_migrates ? 0 :
> > MIGRATE_VMA_SELECT_DEVICE_PRIVATE),
> > =C2=A0	};
> > =C2=A0	unsigned long i, npages =3D npages_in_range(start, end);
> > +	unsigned long own_pages =3D 0, migrated_pages =3D 0;
> > =C2=A0	struct vm_area_struct *vas;
> > =C2=A0	struct drm_pagemap_zdd *zdd =3D NULL;
> > =C2=A0	struct page **pages;
> > @@ -373,8 +409,10 @@ int drm_pagemap_migrate_to_devmem(struct
> > drm_pagemap_devmem *devmem_allocation,
> > =C2=A0	zdd =3D drm_pagemap_zdd_alloc(dpagemap);
> > =C2=A0	if (!zdd) {
> > =C2=A0		err =3D -ENOMEM;
> > -		goto err_free;
> > +		kvfree(buf);
> > +		goto err_out;
> > =C2=A0	}
> > +	zdd->devmem_allocation =3D devmem_allocation;	/* Owns
> > ref */
> > =C2=A0
> > =C2=A0	migrate.vma =3D vas;
> > =C2=A0	migrate.src =3D buf;
> > @@ -385,55 +423,111 @@ int drm_pagemap_migrate_to_devmem(struct
> > drm_pagemap_devmem *devmem_allocation,
> > =C2=A0		goto err_free;
> > =C2=A0
> > =C2=A0	if (!migrate.cpages) {
> > -		err =3D -EFAULT;
> > +		/* No pages to migrate. Raced or unknown device
> > pages. */
> > +		err =3D -EBUSY;
> > =C2=A0		goto err_free;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	if (migrate.cpages !=3D npages) {
> > +		/*
> > +		 * Some pages to migrate. But we want to migrate
> > all or
> > +		 * nothing. Raced or unknown device pages.
> > +		 */
>=20
> I honestly think this is going to be an issue. Let's say two devices
> fault at the same time and both try to migrate simultaneously=E2=80=94nei=
ther
> side is likely to make forward progress, resulting in the migration
> failing even with a retry loop at the caller.
>=20
> How about a Xe module-wide migration rwsem? The first call to
> drm_pagemap_populate_mm would take it in read mode, and subsequent
> attempts would take it in write mode. We can't control CPU-side races
> here, but we do have some level of GPU-side control via a lock like
> the
> one I suggested.
>=20
> The other alternative is to restructure our GPU SVM range tree into a
> process-wide structure (rather than per-device VM), which locks the
> range when servicing a fault and supports multiple sets of pages
> attached to the range. This is pretty large work though, so I'd lean
> towards some Xe driver side locking first.

I agree with your problem statement here, but I don't think it's
introduced with this patch nor that it is made worse? Since the
functionality around mpages !=3D cpages isn't changed, other than that we
try to migrate to system once and retry. In fact with the p2p migration
I think the situation is improved upon because since pages on peer
devices now will turn up in cpages. One thing missing, though, is that
we don't honor the requested migration delay with p2p migration. Will
fix that to next version.

Since this is not a Xe-only problem, I think the *proper* fix here is
in the core migration code and Xe code that needs to be made more
robust to guarantee forward progress:

1) Core migration code should use a sleeping page-lock for the first
page.
2) On repeated failures gpusvm should reduce the range size to single-
page, which is a good remedy also for OOM errors.
3) Core migration code should optionally call migrate_to_ram for
unknown foreign device-private pages, rather than to skip them.

I think this would guarantee forward progress in the single-page case.
Combined with the delayed migration we have for atomics this would
hopefully make the no-interconnect / atomic case robust enough.

Now if we combine this with get_pages() on *last* attempt accepting
*any* mix of system / peer / local pages in other cases, that would
also improve on robustness.

If we'd temporarily want a hack to address this for our multi-device xe
use-cases I think using a driver-wide rwsem or similar like you suggest
is the best option. It might be that the validation code is general
enough. But I don't think it belongs in this patch but rather as a
follow up.


>=20
> > =C2=A0		err =3D -EBUSY;
> > -		goto err_finalize;
> > +		goto err_aborted_migration;
> > +	}
> > +
> > +	/* Count device-private pages to migrate */
> > +	for (i =3D 0; i < npages; ++i) {
> > +		struct page *src_page =3D
> > migrate_pfn_to_page(migrate.src[i]);
> > +
> > +		if (src_page && is_zone_device_page(src_page)) {
> > +			if (page_pgmap(src_page) =3D=3D pagemap)
> > +				own_pages++;
> > +		}
>=20
> In an effort to make the 2M transition easier, can this loop
> increment i
> and own-pages based on the folio order?

Sure. I'll do that in all instances that do not require 4K-page
granularity.

>=20
> > +	}
> > +
> > +	drm_dbg(dpagemap->drm, "Total pages %lu; Own pages:
> > %lu.\n",
> > +		npages, own_pages);
> > +	if (own_pages =3D=3D npages) {
> > +		err =3D 0;
> > +		drm_dbg(dpagemap->drm, "Migration wasn't
> > necessary.\n");
> > +		goto err_aborted_migration;
> > +	} else if (own_pages && mdetails-
> > >can_migrate_same_pagemap) {
> > +		err =3D -EBUSY;
> > +		drm_dbg(dpagemap->drm, "Migration aborted due to
> > fragmentation.\n");
> > +		goto err_aborted_migration;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	err =3D ops->populate_devmem_pfn(devmem_allocation, npages,
> > migrate.dst);
> > =C2=A0	if (err)
> > =C2=A0		goto err_finalize;
> > =C2=A0
> > -	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > >dev, pagemap_addr,
> > -					=C2=A0=C2=A0=C2=A0 migrate.src, npages,
> > DMA_TO_DEVICE);
> > +	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > >dev,
> > +					=C2=A0=C2=A0=C2=A0 devmem_allocation-
> > >dpagemap, pagemap_addr,
> > +					=C2=A0=C2=A0=C2=A0 migrate.src, npages,
> > DMA_TO_DEVICE,
> > +					=C2=A0=C2=A0=C2=A0 mdetails);
> > +
> > +	if (err) {
> > +		drm_pagemap_migrate_unmap_pages(devmem_allocation-
> > >dev, pagemap_addr,
> > +						migrate.src,
> > npages, DMA_TO_DEVICE);
> > =C2=A0
> > -	if (err)
> > =C2=A0		goto err_finalize;
> > +	}
> > =C2=A0
> > +	own_pages =3D 0;
> > =C2=A0	for (i =3D 0; i < npages; ++i) {
> > =C2=A0		struct page *page =3D pfn_to_page(migrate.dst[i]);
> > -
> > +		struct page *src_page =3D
> > migrate_pfn_to_page(migrate.src[i]);
> > +
> > +		if (unlikely(src_page &&
> > is_zone_device_page(src_page) &&
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 page_pgmap(src_page) =3D=3D pagemap &&
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 !mdetails->can_migrate_same_pagemap))
> > {
> > +			migrate.dst[i] =3D 0;
> > +			pages[i] =3D NULL;
> > +			own_pages++;
> > +			continue;
> > +		}
>=20
> Same as above, I think logic should be based on folio order?
>=20
> > =C2=A0		pages[i] =3D page;
> > =C2=A0		migrate.dst[i] =3D migrate_pfn(migrate.dst[i]);
> > =C2=A0		drm_pagemap_get_devmem_page(page, zdd);
> > =C2=A0	}
> > +	drm_WARN_ON(dpagemap->drm, !!own_pages);
> > =C2=A0
> > =C2=A0	err =3D ops->copy_to_devmem(pages, pagemap_addr, npages,
> > =C2=A0				=C2=A0 devmem_allocation-
> > >pre_migrate_fence);
> > +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev,
> > pagemap_addr,
> > +					migrate.src, npages,
> > DMA_TO_DEVICE);
> > =C2=A0	if (err)
> > =C2=A0		goto err_finalize;
> > =C2=A0
> > =C2=A0	/* Upon success bind devmem allocation to range and zdd */
> > =C2=A0	devmem_allocation->timeslice_expiration =3D get_jiffies_64()
> > +
> > -		msecs_to_jiffies(timeslice_ms);
> > -	zdd->devmem_allocation =3D devmem_allocation;	/* Owns
> > ref */
> > +		msecs_to_jiffies(mdetails->timeslice_ms);
> > =C2=A0
> > =C2=A0err_finalize:
> > =C2=A0	if (err)
> > =C2=A0		drm_pagemap_migration_unlock_put_pages(npages,
> > migrate.dst);
> > +err_aborted_migration:
> > =C2=A0	migrate_vma_pages(&migrate);
> > +
> > +	for (i =3D 0; i < npages; ++i)
> > +		if (migrate.src[i] & MIGRATE_PFN_MIGRATE)
> > +			migrated_pages++;
>=20
> Again based on folio order?
>=20
> > +
> > +	if (!err && migrated_pages < npages - own_pages) {
> > +		drm_dbg(dpagemap->drm, "Raced while finalizing
> > migration.\n");
> > +		err =3D -EBUSY;
> > +	}
> > +
> > =C2=A0	migrate_vma_finalize(&migrate);
> > -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev,
> > pagemap_addr, npages,
> > -					DMA_TO_DEVICE);
> > =C2=A0err_free:
> > -	if (zdd)
> > -		drm_pagemap_zdd_put(zdd);
> > +	drm_pagemap_zdd_put(zdd);
> > =C2=A0	kvfree(buf);
> > +	return err;
> > +
> > =C2=A0err_out:
> > +	devmem_allocation->ops->devmem_release(devmem_allocation);
> > =C2=A0	return err;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> > @@ -706,6 +800,7 @@ EXPORT_SYMBOL(drm_pagemap_put);
> > =C2=A0int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem
> > *devmem_allocation)
> > =C2=A0{
> > =C2=A0	const struct drm_pagemap_devmem_ops *ops =3D
> > devmem_allocation->ops;
> > +	struct drm_pagemap_migrate_details mdetails =3D {};
> > =C2=A0	unsigned long npages, mpages =3D 0;
> > =C2=A0	struct page **pages;
> > =C2=A0	unsigned long *src, *dst;
> > @@ -744,8 +839,10 @@ int drm_pagemap_evict_to_ram(struct
> > drm_pagemap_devmem *devmem_allocation)
> > =C2=A0	if (err || !mpages)
> > =C2=A0		goto err_finalize;
> > =C2=A0
> > -	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > >dev, pagemap_addr,
> > -					=C2=A0=C2=A0=C2=A0 dst, npages,
> > DMA_FROM_DEVICE);
> > +	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > >dev,
> > +					=C2=A0=C2=A0=C2=A0 devmem_allocation-
> > >dpagemap, pagemap_addr,
> > +					=C2=A0=C2=A0=C2=A0 dst, npages,
> > DMA_FROM_DEVICE,
> > +					=C2=A0=C2=A0=C2=A0 &mdetails);
> > =C2=A0	if (err)
> > =C2=A0		goto err_finalize;
> > =C2=A0
> > @@ -761,8 +858,9 @@ int drm_pagemap_evict_to_ram(struct
> > drm_pagemap_devmem *devmem_allocation)
> > =C2=A0		drm_pagemap_migration_unlock_put_pages(npages,
> > dst);
> > =C2=A0	migrate_device_pages(src, dst, npages);
> > =C2=A0	migrate_device_finalize(src, dst, npages);
> > -	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev,
> > pagemap_addr, npages,
> > +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev,
> > pagemap_addr, dst, npages,
> > =C2=A0					DMA_FROM_DEVICE);
> > +
> > =C2=A0err_free:
> > =C2=A0	kvfree(buf);
> > =C2=A0err_out:
> > @@ -805,6 +903,7 @@ static int __drm_pagemap_migrate_to_ram(struct
> > vm_area_struct *vas,
> > =C2=A0		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > =C2=A0		.fault_page	=3D page,
> > =C2=A0	};
> > +	struct drm_pagemap_migrate_details mdetails =3D {};
> > =C2=A0	struct drm_pagemap_zdd *zdd;
> > =C2=A0	const struct drm_pagemap_devmem_ops *ops;
> > =C2=A0	struct device *dev =3D NULL;
> > @@ -853,19 +952,6 @@ static int __drm_pagemap_migrate_to_ram(struct
> > vm_area_struct *vas,
> > =C2=A0	if (!migrate.cpages)
> > =C2=A0		goto err_free;
> > =C2=A0
> > -	if (!page) {
> > -		for (i =3D 0; i < npages; ++i) {
> > -			if (!(migrate.src[i] &
> > MIGRATE_PFN_MIGRATE))
> > -				continue;
> > -
> > -			page =3D
> > migrate_pfn_to_page(migrate.src[i]);
> > -			break;
> > -		}
> > -
> > -		if (!page)
> > -			goto err_finalize;
> > -	}
> > -	zdd =3D page->zone_device_data;
>=20
> This isn't actually related to this patch but agree this is some
> leftover dead code. You break this out into its own patch.

Will do.

>=20
> > =C2=A0	ops =3D zdd->devmem_allocation->ops;
> > =C2=A0	dev =3D zdd->devmem_allocation->dev;
> > =C2=A0
> > @@ -875,8 +961,8 @@ static int __drm_pagemap_migrate_to_ram(struct
> > vm_area_struct *vas,
> > =C2=A0	if (err)
> > =C2=A0		goto err_finalize;
> > =C2=A0
> > -	err =3D drm_pagemap_migrate_map_pages(dev, pagemap_addr,
> > migrate.dst, npages,
> > -					=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > +	err =3D drm_pagemap_migrate_map_pages(dev, zdd->dpagemap,
> > pagemap_addr, migrate.dst, npages,
> > +					=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE,
> > &mdetails);
> > =C2=A0	if (err)
> > =C2=A0		goto err_finalize;
> > =C2=A0
> > @@ -893,8 +979,8 @@ static int __drm_pagemap_migrate_to_ram(struct
> > vm_area_struct *vas,
> > =C2=A0	migrate_vma_pages(&migrate);
> > =C2=A0	migrate_vma_finalize(&migrate);
> > =C2=A0	if (dev)
> > -		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr,
> > npages,
> > -						DMA_FROM_DEVICE);
> > +		drm_pagemap_migrate_unmap_pages(dev, pagemap_addr,
> > migrate.dst,
> > +						npages,
> > DMA_FROM_DEVICE);
> > =C2=A0err_free:
> > =C2=A0	kvfree(buf);
> > =C2=A0err_out:
> > @@ -930,9 +1016,11 @@ static vm_fault_t
> > drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
> > =C2=A0	struct drm_pagemap_zdd *zdd =3D vmf->page->zone_device_data;
> > =C2=A0	int err;
> > =C2=A0
> > +	drm_pagemap_zdd_get(zdd);
>=20
> Can you explain the extra ref here? The page itself should have a ref
> owned by the drm_pagemap_migrate_to_ram caller, right?
>=20
> > =C2=A0	err =3D __drm_pagemap_migrate_to_ram(vmf->vma,
> > =C2=A0					=C2=A0=C2=A0 vmf->page, vmf-
> > >address,
> > =C2=A0					=C2=A0=C2=A0 zdd->devmem_allocation-
> > >size);
> > +	drm_pagemap_zdd_put(zdd);

Right. Good catch. This was added in an early version and I should've
removed it.

> > =C2=A0
> > =C2=A0	return err ? VM_FAULT_SIGBUS : 0;
> > =C2=A0}
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index f3b66b55acfb..4edb41548000 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -35,6 +35,7 @@
> > =C2=A0#include "xe_sa.h"
> > =C2=A0#include "xe_sched_job.h"
> > =C2=A0#include "xe_sriov_vf_ccs.h"
> > +#include "xe_svm.h"
> > =C2=A0#include "xe_sync.h"
> > =C2=A0#include "xe_trace_bo.h"
> > =C2=A0#include "xe_validation.h"
> > @@ -2048,7 +2049,8 @@ static void build_pt_update_batch_sram(struct
> > xe_migrate *m,
> > =C2=A0			u64 pte;
> > =C2=A0
> > =C2=A0			xe_tile_assert(m->tile, sram_addr[i].proto
> > =3D=3D
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_INTERCONNECT_SYSTEM);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_INTERCONNECT_SYSTEM ||
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sram_addr[i].proto =3D=3D
> > XE_INTERCONNECT_P2P);
> > =C2=A0			xe_tile_assert(m->tile, addr);
> > =C2=A0			xe_tile_assert(m->tile,
> > PAGE_ALIGNED(addr));
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 22281d69e26a..03cc4a24ce27 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1058,6 +1058,10 @@ static int xe_drm_pagemap_populate_mm(struct
> > drm_pagemap *dpagemap,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long timeslice_ms)
> > =C2=A0{
> > =C2=A0	struct xe_pagemap *xpagemap =3D container_of(dpagemap,
> > typeof(*xpagemap), dpagemap);
> > +	struct drm_pagemap_migrate_details mdetails =3D {
> > +		.timeslice_ms =3D timeslice_ms,
> > +		.source_peer_migrates =3D 1,
> > +	};
> > =C2=A0	struct xe_vram_region *vr =3D xe_pagemap_to_vr(xpagemap);
> > =C2=A0	struct dma_fence *pre_migrate_fence =3D NULL;
> > =C2=A0	struct xe_device *xe =3D vr->xe;
> > @@ -1109,10 +1113,9 @@ static int xe_drm_pagemap_populate_mm(struct
> > drm_pagemap *dpagemap,
> > =C2=A0
> > =C2=A0		/* Ensure the device has a pm ref while there are
> > device pages active. */
> > =C2=A0		xe_pm_runtime_get_noresume(xe);
> > +		/* Consumes the devmem allocation ref. */
> > =C2=A0		err =3D drm_pagemap_migrate_to_devmem(&bo-
> > >devmem_allocation, mm,
> > -						=C2=A0=C2=A0=C2=A0 start, end,
> > timeslice_ms);
> > -		if (err)
> > -			xe_svm_devmem_release(&bo-
> > >devmem_allocation);
> > +						=C2=A0=C2=A0=C2=A0 start, end,
> > &mdetails);
> > =C2=A0		xe_bo_unlock(bo);
> > =C2=A0		xe_bo_put(bo);
> > =C2=A0	}
> > @@ -1628,6 +1631,7 @@ int xe_svm_alloc_vram(struct xe_svm_range
> > *range, const struct drm_gpusvm_ctx *c
> > =C2=A0	struct xe_vm *vm =3D range_to_vm(&range->base);
> > =C2=A0	enum drm_gpusvm_scan_result migration_state;
> > =C2=A0	struct xe_device *xe =3D vm->xe;
> > +	int err, retries =3D 1;
> > =C2=A0
> > =C2=A0	xe_assert(range_to_vm(&range->base)->xe, range-
> > >base.pages.flags.migrate_devmem);
> > =C2=A0	range_debug(range, "ALLOCATE VRAM");
> > @@ -1646,10 +1650,18 @@ int xe_svm_alloc_vram(struct xe_svm_range
> > *range, const struct drm_gpusvm_ctx *c
> > =C2=A0		drm_dbg(&xe->drm, "Request migration to device
> > memory on \"%s\".\n",
> > =C2=A0			dpagemap->drm->unique);
> > =C2=A0
> > -	return drm_pagemap_populate_mm(dpagemap,
> > xe_svm_range_start(range),
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_end(range),
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.gpusvm->mm,
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->timeslice_ms);
> > +	do {
> > +		err =3D drm_pagemap_populate_mm(dpagemap,
> > xe_svm_range_start(range),
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > xe_svm_range_end(range),
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->base.gpusvm-
> > >mm,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ctx->timeslice_ms);
> > +
> > +		if (err =3D=3D -EBUSY && retries)
> > +			drm_gpusvm_range_evict(range->base.gpusvm,
> > &range->base);
>=20
> With the above commit, here is where I think we need a module
> migration
> rwsem.

Agreed. But I'll add that as a follow up patch.

>=20
> > +
> > +	} while (err =3D=3D -EBUSY && retries--);
> > +
> > +	return err;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static struct drm_pagemap_addr
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > b/drivers/gpu/drm/xe/xe_svm.h
> > index 50e80bc892b6..b7b8eeacf196 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -205,6 +205,7 @@ struct xe_tile;
> > =C2=A0struct xe_vram_region;
> > =C2=A0
> > =C2=A0#define XE_INTERCONNECT_VRAM 1
> > +#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
> > =C2=A0
> > =C2=A0struct xe_svm_range {
> > =C2=A0	struct {
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > index f73afece42ba..46e9c58f09e0 100644
> > --- a/include/drm/drm_pagemap.h
> > +++ b/include/drm/drm_pagemap.h
> > @@ -317,10 +317,27 @@ struct drm_pagemap_devmem {
> > =C2=A0	struct dma_fence *pre_migrate_fence;
> > =C2=A0};
> > =C2=A0
> > +/**
> > + * struct drm_pagemap_migrate_details - Details to govern
> > migration.
> > + * @timeslice_ms: The time requested for the migrated pagemap
> > pages to
> > + * be present in @mm before being allowed to be migrated back.
> > + * @can_migrate_same_pagemap: Whether the copy function as
> > indicated by
> > + * the @source_peer_migrates flag, can migrate device pages within
> > a
> > + * single drm_pagemap.
>=20
> This is essentially saying 'my copy function is smart enough to skip
> pages in the correct placement' or is saying 'my copy function can
> copy
> pages from one position on my device to another'?

It's the latter. The drm_pagemap functionality is currently that if
only some pages are in the correct placement with a different
devmem_allocation, they are copied and migrated to the new
devmem_allocation. This is to avoid fragmentation and partially used
devmem_allocations.

/Thomas



>=20
> I want to make sure I'm getting this right.
>=20
> Matt
>=20
> > + * @source_peer_migrates: Whether on p2p migration, The source
> > drm_pagemap
> > + * should use the copy_to_ram() callback rather than the
> > destination
> > + * drm_pagemap should use the copy_to_devmem() callback.
> > + */
> > +struct drm_pagemap_migrate_details {
> > +	unsigned long timeslice_ms;
> > +	u32 can_migrate_same_pagemap : 1;
> > +	u32 source_peer_migrates : 1;
> > +};
> > +
> > =C2=A0int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem
> > *devmem_allocation,
> > =C2=A0				=C2=A0 struct mm_struct *mm,
> > =C2=A0				=C2=A0 unsigned long start, unsigned
> > long end,
> > -				=C2=A0 unsigned long timeslice_ms);
> > +				=C2=A0 const struct
> > drm_pagemap_migrate_details *mdetails);
> > =C2=A0
> > =C2=A0int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem
> > *devmem_allocation);
> > =C2=A0
> > --=20
> > 2.51.1
> >=20

