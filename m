Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CB6C8B7BF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 19:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E5110E6E3;
	Wed, 26 Nov 2025 18:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="La1kK0Is";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9806E10E6E2;
 Wed, 26 Nov 2025 18:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183141; x=1795719141;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XV3oqdOYqKRbqPqEM/86rjIFgR+qIOQLYE2j0M7UCqo=;
 b=La1kK0Is0LpFD2HAH7dKUE9q25famqNsF6vIBiUUqPovFGsUWBEpQoga
 z37OuOch7Fz1rPd8rSrJ4TvSh+FtfS1TQk7YMgMlVSiXymvpmkGmRkIvH
 uzBM2hZOXGmHbA2pwAgxNCvO6Rj1b3ptAE8BS+anPKbyOD+5lIaMOQ6pM
 3vYF3QiJssRdrrIHg4H5awZuRhOmIYci5Hk6NQp8j4uFJSewWXJq0x6dT
 Xhc4lUMPgBp/BfN5yt95it9OKXJ1f1llkaGDZU54+P8YLpLHO23dSRt3A
 EnGGg10/4E8gdcc0TooF9GNXN3PSguq92ERm2Y6rKPBpdRhXa9uoUR2q1 A==;
X-CSE-ConnectionGUID: wuHsSzRNTGGAspxvXnPxeg==
X-CSE-MsgGUID: 19HfTnMKScqGcQEqDtHGiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77592207"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="77592207"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:52:20 -0800
X-CSE-ConnectionGUID: zcPy4EBWQtO2IFENlHRctA==
X-CSE-MsgGUID: lHfnNoRYSsq6y5/60Grmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="193119256"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.127])
 ([10.245.245.127])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:52:18 -0800
Message-ID: <56dfaa41fc4d3b08def119f923e67b5798bcba1f.camel@linux.intel.com>
Subject: Re: [PATCH v2 16/17] drm/pagemap, drm/xe: Support migration over
 interconnect
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Wed, 26 Nov 2025 19:52:14 +0100
In-Reply-To: <aScriYMCR15BN6Jo@lstrano-desk.jf.intel.com>
References: <20251111164408.113070-1-thomas.hellstrom@linux.intel.com>
 <20251111164408.113070-17-thomas.hellstrom@linux.intel.com>
 <aScriYMCR15BN6Jo@lstrano-desk.jf.intel.com>
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

On Wed, 2025-11-26 at 08:32 -0800, Matthew Brost wrote:
> On Tue, Nov 11, 2025 at 05:44:06PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Support migration over interconnect when migrating from
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
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_pagemap.c | 177 +++++++++++++++++++++++++----=
-
> > ----
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0 |=C2=A0 20 ++--
> > =C2=A02 files changed, 143 insertions(+), 54 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > b/drivers/gpu/drm/drm_pagemap.c
> > index 1477a2057a15..e87676313ff9 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -210,6 +210,7 @@ static void drm_pagemap_get_devmem_page(struct
> > page *page,
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
> > @@ -223,12 +224,14 @@ static void
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
> > =C2=A0					 enum dma_data_direction
> > dir)
> > =C2=A0{
> > =C2=A0	unsigned long i;
> > +	unsigned long num_peer_pages =3D 0;
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < npages;) {
> > =C2=A0		struct page *page =3D
> > migrate_pfn_to_page(migrate_pfn[i]);
> > @@ -239,31 +242,48 @@ static int
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
> > +		if (is_zone_device_page(page)) {
> > +			struct drm_pagemap_zdd *zdd =3D page-
> > >zone_device_data;
> > +			struct drm_pagemap *dpagemap =3D zdd-
> > >dpagemap;
> > +			struct drm_pagemap_addr addr;
> > +
> > +			if (dpagemap =3D=3D local_dpagemap)
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
> > @@ -274,16 +294,27 @@ static int
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
> > @@ -308,6 +339,7 @@ npages_in_range(unsigned long start, unsigned
> > long end)
> > =C2=A0 * @timeslice_ms: The time requested for the migrated pagemap
> > pages to
> > =C2=A0 * be present in @mm before being allowed to be migrated back.
> > =C2=A0 * @pgmap_owner: Not used currently, since only system memory is
> > considered.
> > + * @mflags: Flags governing the migration.
> > =C2=A0 *
> > =C2=A0 * This function migrates the specified virtual address range to
> > device memory.
> > =C2=A0 * It performs the necessary setup and invokes the driver-specifi=
c
> > operations for
> > @@ -333,13 +365,18 @@ int drm_pagemap_migrate_to_devmem(struct
> > drm_pagemap_devmem *devmem_allocation,
> > =C2=A0		.start		=3D start,
> > =C2=A0		.end		=3D end,
> > =C2=A0		.pgmap_owner	=3D pgmap_owner,
> > -		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM,
> > +		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM |
> > +		MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> > +		MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > =C2=A0	};
> > =C2=A0	unsigned long i, npages =3D npages_in_range(start, end);
> > +	unsigned long own_pages =3D 0, migrated_pages =3D 0;
> > =C2=A0	struct vm_area_struct *vas;
> > =C2=A0	struct drm_pagemap_zdd *zdd =3D NULL;
> > =C2=A0	struct page **pages;
> > =C2=A0	struct drm_pagemap_addr *pagemap_addr;
> > +	struct drm_pagemap *dpagemap =3D devmem_allocation-
> > >dpagemap;
> > +	struct dev_pagemap *pagemap =3D dpagemap->pagemap;
> > =C2=A0	void *buf;
> > =C2=A0	int err;
> > =C2=A0
> > @@ -374,11 +411,13 @@ int drm_pagemap_migrate_to_devmem(struct
> > drm_pagemap_devmem *devmem_allocation,
> > =C2=A0	pagemap_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > =C2=A0	pages =3D buf + (2 * sizeof(*migrate.src) +
> > sizeof(*pagemap_addr)) * npages;
> > =C2=A0
> > -	zdd =3D drm_pagemap_zdd_alloc(devmem_allocation->dpagemap,
> > pgmap_owner);
> > +	zdd =3D drm_pagemap_zdd_alloc(dpagemap, pgmap_owner);
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
> > @@ -389,54 +428,108 @@ int drm_pagemap_migrate_to_devmem(struct
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
> > +	}
>=20
> I understand what this is doing=E2=80=94aborting the migration if the pag=
es
> are
> in the correct location. Conceptually, I believe this is correct, but
> implementation-wise it is likely not. The pages collected here are
> gathered via migrate_vma_setup. This step issues an MMU notifier and
> installs migration PTEs, which are expensive operations. For example,
> if
> another GPU already has the correct mappings and the pages are in the
> correct location, migrate_vma_setup will result in the range being
> invalidated and the GPU<->GPU mapping being removed. Installing
> migration PTEs is also CPU-intensive.
>=20
> I think the step to check own_pages should be built on top of
> hmm_range_fault without HMM_PFN_REQ_FAULT set, which is fast and will
> not issue an MMU notifier.

I agree fully and what you say above is also what we outlined in a
previous discussion. I was planning to do the hmm_range_fault() check
in drm_gpusvm, as a follow-up, though, before calling into drm_pagemap
to migrate.=20

Reason is that in drm_pagemap, the current implementation doesn't
register any mmu notifier callbacks.

But I realize now that this is pretty much required for any efficiency
with multiple gpus that would otherwise invalidate just checking that
the pages are in place....

/Thomas


>=20
> Matt
>=20
> > +
> > +	drm_dbg(dpagemap->drm, "Total pages %lu; Own pages:
> > %lu.\n",
> > +		npages, own_pages);
> > +	if (own_pages =3D=3D npages) {
> > +		err =3D 0;
> > +		drm_dbg(dpagemap->drm, "Migration wasn't
> > necessary.\n");
> > +		goto err_aborted_migration;
> > +	} else if (own_pages) {
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
> > +	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > >dev,
> > +					=C2=A0=C2=A0=C2=A0 devmem_allocation-
> > >dpagemap, pagemap_addr,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 migrate.src, npages,
> > DMA_TO_DEVICE);
> > =C2=A0
> > -	if (err)
> > +	if (err) {
> > +		drm_pagemap_migrate_unmap_pages(devmem_allocation-
> > >dev, pagemap_addr,
> > +						migrate.src,
> > npages, DMA_TO_DEVICE);
> > +
> > =C2=A0		goto err_finalize;
> > +	}
> > =C2=A0
> > +	own_pages =3D 0;
> > =C2=A0	for (i =3D 0; i < npages; ++i) {
> > =C2=A0		struct page *page =3D pfn_to_page(migrate.dst[i]);
> > +		struct page *src_page =3D
> > migrate_pfn_to_page(migrate.src[i]);
> > =C2=A0
> > +		if (unlikely(src_page &&
> > is_zone_device_page(src_page) &&
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 page_pgmap(src_page) =3D=3D pagemap)) {
> > +			migrate.dst[i] =3D 0;
> > +			pages[i] =3D NULL;
> > +			own_pages++;
> > +			continue;
> > +		}
> > =C2=A0		pages[i] =3D page;
> > =C2=A0		migrate.dst[i] =3D migrate_pfn(migrate.dst[i]);
> > =C2=A0		drm_pagemap_get_devmem_page(page, zdd);
> > =C2=A0	}
> > +	drm_WARN_ON(dpagemap->drm, !!own_pages);
> > =C2=A0
> > =C2=A0	err =3D ops->copy_to_devmem(pages, pagemap_addr, npages);
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
> > =C2=A0		msecs_to_jiffies(timeslice_ms);
> > -	zdd->devmem_allocation =3D devmem_allocation;	/* Owns
> > ref */
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
> > @@ -747,7 +840,8 @@ int drm_pagemap_evict_to_ram(struct
> > drm_pagemap_devmem *devmem_allocation)
> > =C2=A0	if (err || !mpages)
> > =C2=A0		goto err_finalize;
> > =C2=A0
> > -	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > >dev, pagemap_addr,
> > +	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > >dev,
> > +					=C2=A0=C2=A0=C2=A0 devmem_allocation-
> > >dpagemap, pagemap_addr,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 dst, npages,
> > DMA_FROM_DEVICE);
> > =C2=A0	if (err)
> > =C2=A0		goto err_finalize;
> > @@ -764,7 +858,7 @@ int drm_pagemap_evict_to_ram(struct
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
> > =C2=A0err_free:
> > =C2=A0	kvfree(buf);
> > @@ -820,12 +914,10 @@ static int
> > __drm_pagemap_migrate_to_ram(struct vm_area_struct *vas,
> > =C2=A0	void *buf;
> > =C2=A0	int i, err =3D 0;
> > =C2=A0
> > -	if (page) {
> > -		zdd =3D page->zone_device_data;
> > -		if (time_before64(get_jiffies_64(),
> > -				=C2=A0 zdd->devmem_allocation-
> > >timeslice_expiration))
> > -			return 0;
> > -	}
> > +	zdd =3D page->zone_device_data;
> > +	if (time_before64(get_jiffies_64(),
> > +			=C2=A0 zdd->devmem_allocation-
> > >timeslice_expiration))
> > +		return 0;
> > =C2=A0
> > =C2=A0	start =3D ALIGN_DOWN(fault_addr, size);
> > =C2=A0	end =3D ALIGN(fault_addr + 1, size);
> > @@ -861,19 +953,6 @@ static int __drm_pagemap_migrate_to_ram(struct
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
> > =C2=A0	ops =3D zdd->devmem_allocation->ops;
> > =C2=A0	dev =3D zdd->devmem_allocation->dev;
> > =C2=A0
> > @@ -883,7 +962,7 @@ static int __drm_pagemap_migrate_to_ram(struct
> > vm_area_struct *vas,
> > =C2=A0	if (err)
> > =C2=A0		goto err_finalize;
> > =C2=A0
> > -	err =3D drm_pagemap_migrate_map_pages(dev, pagemap_addr,
> > migrate.dst, npages,
> > +	err =3D drm_pagemap_migrate_map_pages(dev, zdd->dpagemap,
> > pagemap_addr, migrate.dst, npages,
> > =C2=A0					=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > =C2=A0	if (err)
> > =C2=A0		goto err_finalize;
> > @@ -901,8 +980,8 @@ static int __drm_pagemap_migrate_to_ram(struct
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
> > @@ -938,10 +1017,12 @@ static vm_fault_t
> > drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
> > =C2=A0	struct drm_pagemap_zdd *zdd =3D vmf->page->zone_device_data;
> > =C2=A0	int err;
> > =C2=A0
> > +	drm_pagemap_zdd_get(zdd);
> > =C2=A0	err =3D __drm_pagemap_migrate_to_ram(vmf->vma,
> > =C2=A0					=C2=A0=C2=A0 zdd-
> > >device_private_page_owner,
> > =C2=A0					=C2=A0=C2=A0 vmf->page, vmf-
> > >address,
> > =C2=A0					=C2=A0=C2=A0 zdd->devmem_allocation-
> > >size);
> > +	drm_pagemap_zdd_put(zdd);
> > =C2=A0
> > =C2=A0	return err ? VM_FAULT_SIGBUS : 0;
> > =C2=A0}
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 0b39905c9312..56bb3896b89a 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1028,11 +1028,10 @@ static int
> > xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> > =C2=A0
> > =C2=A0		/* Ensure the device has a pm ref while there are
> > device pages active. */
> > =C2=A0		xe_pm_runtime_get_noresume(xe);
> > +		/* Consumes the devmem allocation. */
> > =C2=A0		err =3D drm_pagemap_migrate_to_devmem(&bo-
> > >devmem_allocation, mm,
> > =C2=A0						=C2=A0=C2=A0=C2=A0 start, end,
> > timeslice_ms,
> > =C2=A0						=C2=A0=C2=A0=C2=A0 xpagemap-
> > >pagemap.owner);
> > -		if (err)
> > -			xe_svm_devmem_release(&bo-
> > >devmem_allocation);
> > =C2=A0		xe_bo_unlock(bo);
> > =C2=A0		xe_bo_put(bo);
> > =C2=A0	}
> > @@ -1546,6 +1545,7 @@ int xe_svm_alloc_vram(struct xe_svm_range
> > *range, const struct drm_gpusvm_ctx *c
> > =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap)
> > =C2=A0{
> > =C2=A0	struct xe_device *xe =3D range_to_vm(&range->base)->xe;
> > +	int err, retries =3D 1;
> > =C2=A0
> > =C2=A0	xe_assert(range_to_vm(&range->base)->xe, range-
> > >base.pages.flags.migrate_devmem);
> > =C2=A0	range_debug(range, "ALLOCATE VRAM");
> > @@ -1554,10 +1554,18 @@ int xe_svm_alloc_vram(struct xe_svm_range
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
> > +
> > +	} while (err =3D=3D -EBUSY && retries--);
> > +
> > +	return err;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static struct drm_pagemap_addr
> > --=20
> > 2.51.1
> >=20

