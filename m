Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B7FAD88A9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 12:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2740510E97A;
	Fri, 13 Jun 2025 10:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1pjGX5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576D410E917;
 Fri, 13 Jun 2025 10:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749808920; x=1781344920;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4/CTYobilzMbne0r1c3/QsxzdhiqIpA2q+KaXPy5rLk=;
 b=J1pjGX5fdT43w3F8YvN8aFAhb9vntizNbXje+X8FlHjt0A3xKR59N/4V
 AeS2W3lzNeS1HObjOw57KJZXKT5aA9CkilbKVFfj1mTiiMaeozSUSHyYl
 ClBksAG9lYmcnqW5+agyg6kn2P0YuRO7oKUDfrIiDpELKeBhVRWgDrbIp
 NmsVaVUFzAF6DftNV3e6QasoNobokVguVTYtDfSe6Q+WbshvaOsYHNVe4
 OCUILcOzu36z8451h9j8E53rR4/ph9KlslvanVJ4zK3FIwCyoDpyWF9iy
 Mubxmedu1XMJx192chXFP+6EvKZbIx6JH+B/F0aWE4sN78ruBbFawQ49O g==;
X-CSE-ConnectionGUID: FR1p6ramSYu16Mi36C58iQ==
X-CSE-MsgGUID: TF+Xc5blTVSkvRuhLQRJkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52116115"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="52116115"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:01:59 -0700
X-CSE-ConnectionGUID: PT3aTLbTQJC7VgI9RTRy9g==
X-CSE-MsgGUID: 8hb9eS4cSK2G4Hl9dAa5Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148340577"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.245.83])
 ([10.245.245.83])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:01:55 -0700
Message-ID: <4d9d9db73d5cf7922192cf3dbcea118dc6866aef.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/3] drm/gpusvm, drm/pagemap: Move migration
 functionality to drm_pagemap
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Fri, 13 Jun 2025 12:01:52 +0200
In-Reply-To: <aEId57TJ64kdNDK2@lstrano-desk.jf.intel.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
 <20250604093536.95982-2-thomas.hellstrom@linux.intel.com>
 <aEId57TJ64kdNDK2@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Thu, 2025-06-05 at 15:44 -0700, Matthew Brost wrote:
> On Wed, Jun 04, 2025 at 11:35:34AM +0200, Thomas Hellstr=C3=B6m wrote:
> > From: Matthew Brost <matthew.brost@intel.com>
> >=20
> > The migration functionality and track-keeping of per-pagemap VRAM
> > mapped to the CPU mm is not per GPU_vm, but rather per pagemap.
> > This is also reflected by the functions not needing the drm_gpusvm
> > structures. So move to drm_pagemap.
> >=20
> > With this, drm_gpusvm shouldn't really access the page zone-device-
> > data
> > since its meaning is internal to drm_pagemap. Currently it's used
> > to
> > reject mapping ranges backed by multiple drm_pagemap allocations.
> > For now, make the zone-device-data a void pointer.
> >=20
> > Rename CONFIG_DRM_XE_DEVMEM_MIRROR to CONFIG_DRM_XE_PAGEMAP.
> >=20
> > Matt is listed as author of this commit since he wrote most of the
> > code,
> > and it makes sense to retain his git authorship.
> > Thomas mostly moved the code around.
> >=20
>=20
> Kernel test robot has kernel doc fixes. A couple questions / comments
> on
> the new doc below.

8<---------------------------------------------------------------------
>=20
> > +/**
> > + * DOC: Overview
> > + *
> > + * The DRM pagemap layer is intended to augment the dev_pagemap
> > functionality by
> > + * providing a way to populate a struct mm_struct virtual range
> > with device
> > + * private pages and to provide helpers to abstract device memory
> > allocations,
> > + * to migrate memory back and forth between device memory and
> > system RAM and
> > + * to handle access (and in the future migration) between devices
> > implementing
> > + * a fast interconnect that is not necessarily visible to the rest
> > of the
> > + * system.
>=20
> The latter part (fast interconnect support) is NIY, right. Also not
> only
> fast interconnects, PCIe P2P, right?=20

Yes. PCIe P2P is intended to be included in "fast interconnects".

>=20
> > + *
> > + * Typically the DRM pagemap receives requests from one or more
> > DRM GPU SVM
> > + * instances to populate struct mm_struct virtual ranges with
> > memory, and the
> > + * migration is best effort only and may thus fail. The
> > implementation should
> > + * also handle device unbinding by blocking (return an -ENODEV)
> > error for new
> > + * population requests and after that migrate all device pages to
> > system ram.
>=20
> So this means populate_devmem_pfn returning -ENODEV. Should we
> specifically document this return code in populate_devmem_pfn,
> drm_pagemap_migrate_to_devmem?

Yes, agreed. This is actually more suitable for patch 2, so I'll move
it there.

>=20
> > + */
> > +
> > +/**
> > + * DOC: Migration
> > + * Migration granularity typically follows the GPU SVM range
> > requests, but
> > + * if there are clashes, due to races or due to the fact that
> > multiple GPU
> > + * SVM instances have different views of the ranges used, and
> > because of that
>=20
> 'multiple GPU SVM instances have different views of the ranges used'
>=20
> This seems scray and hard handle, perhaps you have thought this one
> through a bit more than me.

I'd say given multiple devices and rogue / bad / racy user-space this
is a situation we need to account for. I don't think we necessarily
need to handle it very gracefully, but we need to take proper action.

>=20
> > + * parts of a requested range is already present in the requested
> > device memory,
> > + * the implementation has a variety of options. It can fail and it
> > can choose
> > + * to populate only the part of the range that isn't already in
> > device memory,
> > + * and it can evict the range to system before trying to migrate.
> > Ideally an
> > + * implementation would just try to migrate the missing part of
> > the range and
> > + * allocate just enough memory to do so.
> > + *
>=20
> I think we need bit more plumbing to implement the ideal case but
> again
> maybe you thought this one through a more than me.

Yes I have some ideas here how to implement that ideal case for xe if
needed.

>=20
> In general there this doc seems forward looking to this not implement
> yet which I'm not sure is a good idea for just moving code around.

Agreed. I'll move parts of the documentaion changes to later patches.

Thanks for review,
Thomas


>=20
> Matt
>=20
> > + * When migrating to system memory as a response to a cpu fault or
> > a device
> > + * memory eviction request, currently a full device memory
> > allocation is
> > + * migrated back to system. Moving forward this might need
> > improvement for
> > + * situations where a single page needs bouncing between system
> > memory and
> > + * device memory due to, for example, atomic operations.
> > + *
> > + * Key DRM pagemap components:
> > + *
> > + * - Device Memory Allocations:
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Embedded structure containing enough =
information for the
> > drm_pagemap to
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migrate to / from device memory.
> > + *
> > + * - Device Memory Operations:
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Define the interface for driver-speci=
fic device memory
> > operations
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release memory, populate pfns, and co=
py to / from device
> > memory.
> > + */
> > +
> > +/**
> > + * struct drm_pagemap_zdd - GPU SVM zone device data
> > + *
> > + * @refcount: Reference count for the zdd
> > + * @devmem_allocation: device memory allocation
> > + * @device_private_page_owner: Device private pages owner
> > + *
> > + * This structure serves as a generic wrapper installed in
> > + * page->zone_device_data. It provides infrastructure for looking
> > up a device
> > + * memory allocation upon CPU page fault and asynchronously
> > releasing device
> > + * memory once the CPU has no page references. Asynchronous
> > release is useful
> > + * because CPU page references can be dropped in IRQ contexts,
> > while releasing
> > + * device memory likely requires sleeping locks.
> > + */
> > +struct drm_pagemap_zdd {
> > +	struct kref refcount;
> > +	struct drm_pagemap_devmem *devmem_allocation;
> > +	void *device_private_page_owner;
> > +};
> > +
> > +/**
> > + * drm_pagemap_zdd_alloc() - Allocate a zdd structure.
> > + * @device_private_page_owner: Device private pages owner
> > + *
> > + * This function allocates and initializes a new zdd structure. It
> > sets up the
> > + * reference count and initializes the destroy work.
> > + *
> > + * Return: Pointer to the allocated zdd on success, ERR_PTR() on
> > failure.
> > + */
> > +static struct drm_pagemap_zdd *
> > +drm_pagemap_zdd_alloc(void *device_private_page_owner)
> > +{
> > +	struct drm_pagemap_zdd *zdd;
> > +
> > +	zdd =3D kmalloc(sizeof(*zdd), GFP_KERNEL);
> > +	if (!zdd)
> > +		return NULL;
> > +
> > +	kref_init(&zdd->refcount);
> > +	zdd->devmem_allocation =3D NULL;
> > +	zdd->device_private_page_owner =3D
> > device_private_page_owner;
> > +
> > +	return zdd;
> > +}
> > +
> > +/**
> > + * drm_pagemap_zdd_get() - Get a reference to a zdd structure.
> > + * @zdd: Pointer to the zdd structure.
> > + *
> > + * This function increments the reference count of the provided
> > zdd structure.
> > + *
> > + * Return: Pointer to the zdd structure.
> > + */
> > +static struct drm_pagemap_zdd *drm_pagemap_zdd_get(struct
> > drm_pagemap_zdd *zdd)
> > +{
> > +	kref_get(&zdd->refcount);
> > +	return zdd;
> > +}
> > +
> > +/**
> > + * drm_pagemap_zdd_destroy() - Destroy a zdd structure.
> > + * @ref: Pointer to the reference count structure.
> > + *
> > + * This function queues the destroy_work of the zdd for
> > asynchronous destruction.
> > + */
> > +static void drm_pagemap_zdd_destroy(struct kref *ref)
> > +{
> > +	struct drm_pagemap_zdd *zdd =3D
> > +		container_of(ref, struct drm_pagemap_zdd,
> > refcount);
> > +	struct drm_pagemap_devmem *devmem =3D zdd-
> > >devmem_allocation;
> > +
> > +	if (devmem) {
> > +		complete_all(&devmem->detached);
> > +		if (devmem->ops->devmem_release)
> > +			devmem->ops->devmem_release(devmem);
> > +	}
> > +	kfree(zdd);
> > +}
> > +
> > +/**
> > + * drm_pagemap_zdd_put() - Put a zdd reference.
> > + * @zdd: Pointer to the zdd structure.
> > + *
> > + * This function decrements the reference count of the provided
> > zdd structure
> > + * and schedules its destruction if the count drops to zero.
> > + */
> > +static void drm_pagemap_zdd_put(struct drm_pagemap_zdd *zdd)
> > +{
> > +	kref_put(&zdd->refcount, drm_pagemap_zdd_destroy);
> > +}
> > +
> > +/**
> > + * drm_pagemap_migration_unlock_put_page() - Put a migration page
> > + * @page: Pointer to the page to put
> > + *
> > + * This function unlocks and puts a page.
> > + */
> > +static void drm_pagemap_migration_unlock_put_page(struct page
> > *page)
> > +{
> > +	unlock_page(page);
> > +	put_page(page);
> > +}
> > +
> > +/**
> > + * drm_pagemap_migration_unlock_put_pages() - Put migration pages
> > + * @npages: Number of pages
> > + * @migrate_pfn: Array of migrate page frame numbers
> > + *
> > + * This function unlocks and puts an array of pages.
> > + */
> > +static void drm_pagemap_migration_unlock_put_pages(unsigned long
> > npages,
> > +						=C2=A0=C2=A0 unsigned long
> > *migrate_pfn)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i =3D 0; i < npages; ++i) {
> > +		struct page *page;
> > +
> > +		if (!migrate_pfn[i])
> > +			continue;
> > +
> > +		page =3D migrate_pfn_to_page(migrate_pfn[i]);
> > +		drm_pagemap_migration_unlock_put_page(page);
> > +		migrate_pfn[i] =3D 0;
> > +	}
> > +}
> > +
> > +/**
> > + * drm_pagemap_get_devmem_page() - Get a reference to a device
> > memory page
> > + * @page: Pointer to the page
> > + * @zdd: Pointer to the GPU SVM zone device data
> > + *
> > + * This function associates the given page with the specified GPU
> > SVM zone
> > + * device data and initializes it for zone device usage.
> > + */
> > +static void drm_pagemap_get_devmem_page(struct page *page,
> > +					struct drm_pagemap_zdd
> > *zdd)
> > +{
> > +	page->zone_device_data =3D drm_pagemap_zdd_get(zdd);
> > +	zone_device_page_init(page);
> > +}
> > +
> > +/**
> > + * drm_pagemap_migrate_map_pages() - Map migration pages for GPU
> > SVM migration
> > + * @dev: The device for which the pages are being mapped
> > + * @dma_addr: Array to store DMA addresses corresponding to mapped
> > pages
> > + * @migrate_pfn: Array of migrate page frame numbers to map
> > + * @npages: Number of pages to map
> > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + *
> > + * This function maps pages of memory for migration usage in GPU
> > SVM. It
> > + * iterates over each page frame number provided in @migrate_pfn,
> > maps the
> > + * corresponding page, and stores the DMA address in the provided
> > @dma_addr
> > + * array.
> > + *
> > + * Returns: 0 on success, -EFAULT if an error occurs during
> > mapping.
> > + */
> > +static int drm_pagemap_migrate_map_pages(struct device *dev,
> > +					 dma_addr_t *dma_addr,
> > +					 unsigned long
> > *migrate_pfn,
> > +					 unsigned long npages,
> > +					 enum dma_data_direction
> > dir)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i =3D 0; i < npages; ++i) {
> > +		struct page *page =3D
> > migrate_pfn_to_page(migrate_pfn[i]);
> > +
> > +		if (!page)
> > +			continue;
> > +
> > +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > +			return -EFAULT;
> > +
> > +		dma_addr[i] =3D dma_map_page(dev, page, 0,
> > PAGE_SIZE, dir);
> > +		if (dma_mapping_error(dev, dma_addr[i]))
> > +			return -EFAULT;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_pagemap_migrate_unmap_pages() - Unmap pages previously
> > mapped for GPU SVM migration
> > + * @dev: The device for which the pages were mapped
> > + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> > + * @npages: Number of pages to unmap
> > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + *
> > + * This function unmaps previously mapped pages of memory for GPU
> > Shared Virtual
> > + * Memory (SVM). It iterates over each DMA address provided in
> > @dma_addr, checks
> > + * if it's valid and not already unmapped, and unmaps the
> > corresponding page.
> > + */
> > +static void drm_pagemap_migrate_unmap_pages(struct device *dev,
> > +					=C2=A0=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > +					=C2=A0=C2=A0=C2=A0 unsigned long npages,
> > +					=C2=A0=C2=A0=C2=A0 enum
> > dma_data_direction dir)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i =3D 0; i < npages; ++i) {
> > +		if (!dma_addr[i] || dma_mapping_error(dev,
> > dma_addr[i]))
> > +			continue;
> > +
> > +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> > +	}
> > +}
> > +
> > +static unsigned long
> > +npages_in_range(unsigned long start, unsigned long end)
> > +{
> > +	return (end - start) >> PAGE_SHIFT;
> > +}
> > +
> > +
> > +/**
> > + * drm_pagemap_migrate_to_devmem() - Migrate a struct mm_struct
> > range to device memory
> > + * @devmem_allocation: The device memory allocation to migrate to.
> > + * The caller should hold a reference to the device memory
> > allocation,
> > + * and the reference is consumed by this function unless it
> > returns with
> > + * an error.
> > + * @mm: Pointer to the struct mm_struct.
> > + * @start: Start of the virtual address range to migrate.
> > + * @end: End of the virtual address range to migrate.
> > + * @pgmap_owner: Not used currently, since only system memory is
> > considered.
> > + *
> > + * This function migrates the specified virtual address range to
> > device memory.
> > + * It performs the necessary setup and invokes the driver-specific
> > operations for
> > + * migration to device memory. Expected to be called while holding
> > the mmap lock in
> > + * at least read mode.
> > + *
> > + * Return: %0 on success, negative error code on failure.
> > + */
> > +
> > +/*
> > + * @range: Pointer to the GPU SVM range structure
> > + * @devmem_allocation: Pointer to the device memory allocation.
> > The caller
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should hold a refere=
nce to the device
> > memory allocation,
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 which should be drop=
ped via ops-
> > >devmem_release or upon
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the failure of this =
function.
> > + * @ctx: GPU SVM context
> > + *
> > + * This function migrates the specified GPU SVM range to device
> > memory. It
> > + * performs the necessary setup and invokes the driver-specific
> > operations for
> > + * migration to device memory. Upon successful return,
> > @devmem_allocation can
> > + * safely reference @range until ops->devmem_release is called
> > which only upon
> > + * successful return. Expected to be called while holding the mmap
> > lock in read
> > + * mode.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem
> > *devmem_allocation,
> > +				=C2=A0 struct mm_struct *mm,
> > +				=C2=A0 unsigned long start, unsigned
> > long end,
> > +				=C2=A0 unsigned long timeslice_ms,
> > +				=C2=A0 void *pgmap_owner)
> > +{
> > +	const struct drm_pagemap_devmem_ops *ops =3D
> > devmem_allocation->ops;
> > +	struct migrate_vma migrate =3D {
> > +		.start		=3D start,
> > +		.end		=3D end,
> > +		.pgmap_owner	=3D pgmap_owner,
> > +		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM,
> > +	};
> > +	unsigned long i, npages =3D npages_in_range(start, end);
> > +	struct vm_area_struct *vas;
> > +	struct drm_pagemap_zdd *zdd =3D NULL;
> > +	struct page **pages;
> > +	dma_addr_t *dma_addr;
> > +	void *buf;
> > +	int err;
> > +
> > +	mmap_assert_locked(mm);
> > +
> > +	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> > +	=C2=A0=C2=A0=C2=A0 !ops->copy_to_ram)
> > +		return -EOPNOTSUPP;
> > +
> > +	vas =3D vma_lookup(mm, start);
> > +	if (!vas) {
> > +		err =3D -ENOENT;
> > +		goto err_out;
> > +	}
> > +
> > +	if (end > vas->vm_end || start < vas->vm_start) {
> > +		err =3D -EINVAL;
> > +		goto err_out;
> > +	}
> > +
> > +	if (!vma_is_anonymous(vas)) {
> > +		err =3D -EBUSY;
> > +		goto err_out;
> > +	}
> > +
> > +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > sizeof(*dma_addr) +
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err =3D -ENOMEM;
> > +		goto err_out;
> > +	}
> > +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > +	pages =3D buf + (2 * sizeof(*migrate.src) +
> > sizeof(*dma_addr)) * npages;
> > +
> > +	zdd =3D drm_pagemap_zdd_alloc(pgmap_owner);
> > +	if (!zdd) {
> > +		err =3D -ENOMEM;
> > +		goto err_free;
> > +	}
> > +
> > +	migrate.vma =3D vas;
> > +	migrate.src =3D buf;
> > +	migrate.dst =3D migrate.src + npages;
> > +
> > +	err =3D migrate_vma_setup(&migrate);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	if (!migrate.cpages) {
> > +		err =3D -EFAULT;
> > +		goto err_free;
> > +	}
> > +
> > +	if (migrate.cpages !=3D npages) {
> > +		err =3D -EBUSY;
> > +		goto err_finalize;
> > +	}
> > +
> > +	err =3D ops->populate_devmem_pfn(devmem_allocation, npages,
> > migrate.dst);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > >dev, dma_addr,
> > +					=C2=A0=C2=A0 migrate.src, npages,
> > DMA_TO_DEVICE);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i =3D 0; i < npages; ++i) {
> > +		struct page *page =3D pfn_to_page(migrate.dst[i]);
> > +
> > +		pages[i] =3D page;
> > +		migrate.dst[i] =3D migrate_pfn(migrate.dst[i]);
> > +		drm_pagemap_get_devmem_page(page, zdd);
> > +	}
> > +
> > +	err =3D ops->copy_to_devmem(pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	/* Upon success bind devmem allocation to range and zdd */
> > +	devmem_allocation->timeslice_expiration =3D get_jiffies_64()
> > +
> > +		msecs_to_jiffies(timeslice_ms);
> > +	zdd->devmem_allocation =3D devmem_allocation;	/* Owns
> > ref */
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_pagemap_migration_unlock_put_pages(npages,
> > migrate.dst);
> > +	migrate_vma_pages(&migrate);
> > +	migrate_vma_finalize(&migrate);
> > +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev,
> > dma_addr, npages,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_TO_DEVICE);
> > +err_free:
> > +	if (zdd)
> > +		drm_pagemap_zdd_put(zdd);
> > +	kvfree(buf);
> > +err_out:
> > +	return err;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_pagemap_migrate_to_devmem);
> > +
> > +/**
> > + * drm_pagemap_migrate_populate_ram_pfn() - Populate RAM PFNs for
> > a VM area
> > + * @vas: Pointer to the VM area structure, can be NULL
> > + * @fault_page: Fault page
> > + * @npages: Number of pages to populate
> > + * @mpages: Number of pages to migrate
> > + * @src_mpfn: Source array of migrate PFNs
> > + * @mpfn: Array of migrate PFNs to populate
> > + * @addr: Start address for PFN allocation
> > + *
> > + * This function populates the RAM migrate page frame numbers
> > (PFNs) for the
> > + * specified VM area structure. It allocates and locks pages in
> > the VM area for
> > + * RAM usage. If vas is non-NULL use alloc_page_vma for
> > allocation, if NULL use
> > + * alloc_page for allocation.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +static int drm_pagemap_migrate_populate_ram_pfn(struct
> > vm_area_struct *vas,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page
> > *fault_page,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > npages,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > *mpages,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > *src_mpfn,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> > *mpfn,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long addr)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i =3D 0; i < npages; ++i, addr +=3D PAGE_SIZE) {
> > +		struct page *page, *src_page;
> > +
> > +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > +			continue;
> > +
> > +		src_page =3D migrate_pfn_to_page(src_mpfn[i]);
> > +		if (!src_page)
> > +			continue;
> > +
> > +		if (fault_page) {
> > +			if (src_page->zone_device_data !=3D
> > +			=C2=A0=C2=A0=C2=A0 fault_page->zone_device_data)
> > +				continue;
> > +		}
> > +
> > +		if (vas)
> > +			page =3D alloc_page_vma(GFP_HIGHUSER, vas,
> > addr);
> > +		else
> > +			page =3D alloc_page(GFP_HIGHUSER);
> > +
> > +		if (!page)
> > +			goto free_pages;
> > +
> > +		mpfn[i] =3D migrate_pfn(page_to_pfn(page));
> > +	}
> > +
> > +	for (i =3D 0; i < npages; ++i) {
> > +		struct page *page =3D migrate_pfn_to_page(mpfn[i]);
> > +
> > +		if (!page)
> > +			continue;
> > +
> > +		WARN_ON_ONCE(!trylock_page(page));
> > +		++*mpages;
> > +	}
> > +
> > +	return 0;
> > +
> > +free_pages:
> > +	for (i =3D 0; i < npages; ++i) {
> > +		struct page *page =3D migrate_pfn_to_page(mpfn[i]);
> > +
> > +		if (!page)
> > +			continue;
> > +
> > +		put_page(page);
> > +		mpfn[i] =3D 0;
> > +	}
> > +	return -ENOMEM;
> > +}
> > +
> > +/**
> > + * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
> > + * @devmem_allocation: Pointer to the device memory allocation
> > + *
> > + * Similar to __drm_pagemap_migrate_to_ram but does not require
> > mmap lock and
> > + * migration done via migrate_device_* functions.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem
> > *devmem_allocation)
> > +{
> > +	const struct drm_pagemap_devmem_ops *ops =3D
> > devmem_allocation->ops;
> > +	unsigned long npages, mpages =3D 0;
> > +	struct page **pages;
> > +	unsigned long *src, *dst;
> > +	dma_addr_t *dma_addr;
> > +	void *buf;
> > +	int i, err =3D 0;
> > +	unsigned int retry_count =3D 2;
> > +
> > +	npages =3D devmem_allocation->size >> PAGE_SHIFT;
> > +
> > +retry:
> > +	if (!mmget_not_zero(devmem_allocation->mm))
> > +		return -EFAULT;
> > +
> > +	buf =3D kvcalloc(npages, 2 * sizeof(*src) +
> > sizeof(*dma_addr) +
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err =3D -ENOMEM;
> > +		goto err_out;
> > +	}
> > +	src =3D buf;
> > +	dst =3D buf + (sizeof(*src) * npages);
> > +	dma_addr =3D buf + (2 * sizeof(*src) * npages);
> > +	pages =3D buf + (2 * sizeof(*src) + sizeof(*dma_addr)) *
> > npages;
> > +
> > +	err =3D ops->populate_devmem_pfn(devmem_allocation, npages,
> > src);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	err =3D migrate_device_pfns(src, npages);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	err =3D drm_pagemap_migrate_populate_ram_pfn(NULL, NULL,
> > npages, &mpages,
> > +						=C2=A0 src, dst, 0);
> > +	if (err || !mpages)
> > +		goto err_finalize;
> > +
> > +	err =3D drm_pagemap_migrate_map_pages(devmem_allocation-
> > >dev, dma_addr,
> > +					=C2=A0=C2=A0 dst, npages,
> > DMA_FROM_DEVICE);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i =3D 0; i < npages; ++i)
> > +		pages[i] =3D migrate_pfn_to_page(src[i]);
> > +
> > +	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_pagemap_migration_unlock_put_pages(npages,
> > dst);
> > +	migrate_device_pages(src, dst, npages);
> > +	migrate_device_finalize(src, dst, npages);
> > +	drm_pagemap_migrate_unmap_pages(devmem_allocation->dev,
> > dma_addr, npages,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > +err_free:
> > +	kvfree(buf);
> > +err_out:
> > +	mmput_async(devmem_allocation->mm);
> > +
> > +	if (completion_done(&devmem_allocation->detached))
> > +		return 0;
> > +
> > +	if (retry_count--) {
> > +		cond_resched();
> > +		goto retry;
> > +	}
> > +
> > +	return err ?: -EBUSY;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_pagemap_evict_to_ram);
> > +
> > +/**
> > + * __drm_pagemap_migrate_to_ram() - Migrate GPU SVM range to RAM
> > (internal)
> > + * @vas: Pointer to the VM area structure
> > + * @device_private_page_owner: Device private pages owner
> > + * @page: Pointer to the page for fault handling (can be NULL)
> > + * @fault_addr: Fault address
> > + * @size: Size of migration
> > + *
> > + * This internal function performs the migration of the specified
> > GPU SVM range
> > + * to RAM. It sets up the migration, populates + dma maps RAM
> > PFNs, and
> > + * invokes the driver-specific operations for migration to RAM.
> > + *
> > + * Return: 0 on success, negative error code on failure.
> > + */
> > +static int __drm_pagemap_migrate_to_ram(struct vm_area_struct
> > *vas,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void
> > *device_private_page_owner,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *page,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long fault_addr,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long size)
> > +{
> > +	struct migrate_vma migrate =3D {
> > +		.vma		=3D vas,
> > +		.pgmap_owner	=3D device_private_page_owner,
> > +		.flags		=3D
> > MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
> > +			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> > +		.fault_page	=3D page,
> > +	};
> > +	struct drm_pagemap_zdd *zdd;
> > +	const struct drm_pagemap_devmem_ops *ops;
> > +	struct device *dev =3D NULL;
> > +	unsigned long npages, mpages =3D 0;
> > +	struct page **pages;
> > +	dma_addr_t *dma_addr;
> > +	unsigned long start, end;
> > +	void *buf;
> > +	int i, err =3D 0;
> > +
> > +	if (page) {
> > +		zdd =3D page->zone_device_data;
> > +		if (time_before64(get_jiffies_64(),
> > +				=C2=A0 zdd->devmem_allocation-
> > >timeslice_expiration))
> > +			return 0;
> > +	}
> > +
> > +	start =3D ALIGN_DOWN(fault_addr, size);
> > +	end =3D ALIGN(fault_addr + 1, size);
> > +
> > +	/* Corner where VMA area struct has been partially
> > unmapped */
> > +	if (start < vas->vm_start)
> > +		start =3D vas->vm_start;
> > +	if (end > vas->vm_end)
> > +		end =3D vas->vm_end;
> > +
> > +	migrate.start =3D start;
> > +	migrate.end =3D end;
> > +	npages =3D npages_in_range(start, end);
> > +
> > +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> > sizeof(*dma_addr) +
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err =3D -ENOMEM;
> > +		goto err_out;
> > +	}
> > +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > +	pages =3D buf + (2 * sizeof(*migrate.src) +
> > sizeof(*dma_addr)) * npages;
> > +
> > +	migrate.vma =3D vas;
> > +	migrate.src =3D buf;
> > +	migrate.dst =3D migrate.src + npages;
> > +
> > +	err =3D migrate_vma_setup(&migrate);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	/* Raced with another CPU fault, nothing to do */
> > +	if (!migrate.cpages)
> > +		goto err_free;
> > +
> > +	if (!page) {
> > +		for (i =3D 0; i < npages; ++i) {
> > +			if (!(migrate.src[i] &
> > MIGRATE_PFN_MIGRATE))
> > +				continue;
> > +
> > +			page =3D
> > migrate_pfn_to_page(migrate.src[i]);
> > +			break;
> > +		}
> > +
> > +		if (!page)
> > +			goto err_finalize;
> > +	}
> > +	zdd =3D page->zone_device_data;
> > +	ops =3D zdd->devmem_allocation->ops;
> > +	dev =3D zdd->devmem_allocation->dev;
> > +
> > +	err =3D drm_pagemap_migrate_populate_ram_pfn(vas, page,
> > npages, &mpages,
> > +						=C2=A0 migrate.src,
> > migrate.dst,
> > +						=C2=A0 start);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	err =3D drm_pagemap_migrate_map_pages(dev, dma_addr,
> > migrate.dst, npages,
> > +					=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i =3D 0; i < npages; ++i)
> > +		pages[i] =3D migrate_pfn_to_page(migrate.src[i]);
> > +
> > +	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_pagemap_migration_unlock_put_pages(npages,
> > migrate.dst);
> > +	migrate_vma_pages(&migrate);
> > +	migrate_vma_finalize(&migrate);
> > +	if (dev)
> > +		drm_pagemap_migrate_unmap_pages(dev, dma_addr,
> > npages,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> > +err_free:
> > +	kvfree(buf);
> > +err_out:
> > +
> > +	return err;
> > +}
> > +
> > +/**
> > + * drm_pagemap_page_free() - Put GPU SVM zone device data
> > associated with a page
> > + * @page: Pointer to the page
> > + *
> > + * This function is a callback used to put the GPU SVM zone device
> > data
> > + * associated with a page when it is being released.
> > + */
> > +static void drm_pagemap_page_free(struct page *page)
> > +{
> > +	drm_pagemap_zdd_put(page->zone_device_data);
> > +}
> > +
> > +/**
> > + * drm_pagemap_migrate_to_ram() - Migrate a virtual range to RAM
> > (page fault handler)
> > + * @vmf: Pointer to the fault information structure
> > + *
> > + * This function is a page fault handler used to migrate a virtual
> > range
> > + * to ram. The device memory allocation in which the device page
> > is found is
> > + * migrated in its entirety.
> > + *
> > + * Returns:
> > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > + */
> > +static vm_fault_t drm_pagemap_migrate_to_ram(struct vm_fault *vmf)
> > +{
> > +	struct drm_pagemap_zdd *zdd =3D vmf->page->zone_device_data;
> > +	int err;
> > +
> > +	err =3D __drm_pagemap_migrate_to_ram(vmf->vma,
> > +					=C2=A0=C2=A0 zdd-
> > >device_private_page_owner,
> > +					=C2=A0=C2=A0 vmf->page, vmf-
> > >address,
> > +					=C2=A0=C2=A0 zdd->devmem_allocation-
> > >size);
> > +
> > +	return err ? VM_FAULT_SIGBUS : 0;
> > +}
> > +
> > +static const struct dev_pagemap_ops drm_pagemap_pagemap_ops =3D {
> > +	.page_free =3D drm_pagemap_page_free,
> > +	.migrate_to_ram =3D drm_pagemap_migrate_to_ram,
> > +};
> > +
> > +/**
> > + * drm_pagemap_pagemap_ops_get() - Retrieve GPU SVM device page
> > map operations
> > + *
> > + * Returns:
> > + * Pointer to the GPU SVM device page map operations structure.
> > + */
> > +const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void)
> > +{
> > +	return &drm_pagemap_pagemap_ops;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_pagemap_pagemap_ops_get);
> > +
> > +/**
> > + * drm_pagemap_devmem_init() - Initialize a drm_pagemap device
> > memory allocation
> > + *
> > + * @devmem_allocation: The struct drm_pagemap_devmem to
> > initialize.
> > + * @dev: Pointer to the device structure which device memory
> > allocation belongs to
> > + * @mm: Pointer to the mm_struct for the address space
> > + * @ops: Pointer to the operations structure for GPU SVM device
> > memory
> > + * @dpagemap: The struct drm_pagemap we're allocating from.
> > + * @size: Size of device memory allocation
> > + */
> > +void drm_pagemap_devmem_init(struct drm_pagemap_devmem
> > *devmem_allocation,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev, struct mm_struct
> > *mm,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_devmem_ops
> > *ops,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap, size_t
> > size)
> > +{
> > +	init_completion(&devmem_allocation->detached);
> > +	devmem_allocation->dev =3D dev;
> > +	devmem_allocation->mm =3D mm;
> > +	devmem_allocation->ops =3D ops;
> > +	devmem_allocation->dpagemap =3D dpagemap;
> > +	devmem_allocation->size =3D size;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_pagemap_devmem_init);
> > +
> > +/**
> > + * drm_pagemap_page_to_dpagemap() - Return a pointer the
> > drm_pagemap of a page
> > + * @page: The struct page.
> > + *
> > + * Return: A pointer to the struct drm_pagemap of a device private
> > page that
> > + * was populated from the struct drm_pagemap. If the page was
> > *not* populated
> > + * from a struct drm_pagemap, the result is undefined and the
> > function call
> > + * may result in dereferencing and invalid address.
> > + */
> > +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page
> > *page)
> > +{
> > +	struct drm_pagemap_zdd *zdd =3D page->zone_device_data;
> > +
> > +	return zdd->devmem_allocation->dpagemap;
> > +}
> > +EXPORT_SYMBOL_GPL(drm_pagemap_page_to_dpagemap);
> > diff --git a/drivers/gpu/drm/xe/Kconfig
> > b/drivers/gpu/drm/xe/Kconfig
> > index 98b46c534278..c7c71734460b 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -87,14 +87,16 @@ config DRM_XE_GPUSVM
> > =C2=A0
> > =C2=A0	=C2=A0 If in doubut say "Y".
> > =C2=A0
> > -config DRM_XE_DEVMEM_MIRROR
> > -	bool "Enable device memory mirror"
> > +config DRM_XE_PAGEMAP
> > +	bool "Enable device memory pool for SVM"
> > =C2=A0	depends on DRM_XE_GPUSVM
> > =C2=A0	select GET_FREE_REGION
> > =C2=A0	default y
> > =C2=A0	help
> > -	=C2=A0 Disable this option only if you want to compile out
> > without device
> > -	=C2=A0 memory mirror. Will reduce KMD memory footprint when
> > disabled.
> > +	=C2=A0 Disable this option only if you don't want to expose
> > local device
> > +	=C2=A0 memory for SVM. Will reduce KMD memory footprint when
> > disabled.
> > +
> > +	=C2=A0 If in doubut say "Y".
> > =C2=A0
> > =C2=A0config DRM_XE_FORCE_PROBE
> > =C2=A0	string "Force probe xe for selected Intel hardware IDs"
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
> > b/drivers/gpu/drm/xe/xe_bo_types.h
> > index eb5e83c5f233..e0efaf23d051 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -86,7 +86,7 @@ struct xe_bo {
> > =C2=A0	u16 cpu_caching;
> > =C2=A0
> > =C2=A0	/** @devmem_allocation: SVM device memory allocation */
> > -	struct drm_gpusvm_devmem devmem_allocation;
> > +	struct drm_pagemap_devmem devmem_allocation;
> > =C2=A0
> > =C2=A0	/** @vram_userfault_link: Link into
> > @mem_access.vram_userfault.list */
> > =C2=A0		struct list_head vram_userfault_link;
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index b93c04466637..67b7f733dd69 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -104,7 +104,7 @@ struct xe_vram_region {
> > =C2=A0	void __iomem *mapping;
> > =C2=A0	/** @ttm: VRAM TTM manager */
> > =C2=A0	struct xe_ttm_vram_mgr ttm;
> > -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > =C2=A0	/** @pagemap: Used to remap device memory as ZONE_DEVICE
> > */
> > =C2=A0	struct dev_pagemap pagemap;
> > =C2=A0	/**
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index f27fb9b588de..e161ce3e67a1 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -329,7 +329,7 @@ static void
> > xe_svm_garbage_collector_work_func(struct work_struct *w)
> > =C2=A0	up_write(&vm->lock);
> > =C2=A0}
> > =C2=A0
> > -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > =C2=A0
> > =C2=A0static struct xe_vram_region *page_to_vr(struct page *page)
> > =C2=A0{
> > @@ -517,12 +517,12 @@ static int xe_svm_copy_to_ram(struct page
> > **pages, dma_addr_t *dma_addr,
> > =C2=A0	return xe_svm_copy(pages, dma_addr, npages,
> > XE_SVM_COPY_TO_SRAM);
> > =C2=A0}
> > =C2=A0
> > -static struct xe_bo *to_xe_bo(struct drm_gpusvm_devmem
> > *devmem_allocation)
> > +static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem
> > *devmem_allocation)
> > =C2=A0{
> > =C2=A0	return container_of(devmem_allocation, struct xe_bo,
> > devmem_allocation);
> > =C2=A0}
> > =C2=A0
> > -static void xe_svm_devmem_release(struct drm_gpusvm_devmem
> > *devmem_allocation)
> > +static void xe_svm_devmem_release(struct drm_pagemap_devmem
> > *devmem_allocation)
> > =C2=A0{
> > =C2=A0	struct xe_bo *bo =3D to_xe_bo(devmem_allocation);
> > =C2=A0
> > @@ -539,7 +539,7 @@ static struct drm_buddy *tile_to_buddy(struct
> > xe_tile *tile)
> > =C2=A0	return &tile->mem.vram.ttm.mm;
> > =C2=A0}
> > =C2=A0
> > -static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem
> > *devmem_allocation,
> > +static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem
> > *devmem_allocation,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> > unsigned long *pfn)
> > =C2=A0{
> > =C2=A0	struct xe_bo *bo =3D to_xe_bo(devmem_allocation);
> > @@ -562,7 +562,7 @@ static int xe_svm_populate_devmem_pfn(struct
> > drm_gpusvm_devmem *devmem_allocatio
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > -static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops =3D {
> > +static const struct drm_pagemap_devmem_ops dpagemap_devmem_ops =3D {
> > =C2=A0	.devmem_release =3D xe_svm_devmem_release,
> > =C2=A0	.populate_devmem_pfn =3D xe_svm_populate_devmem_pfn,
> > =C2=A0	.copy_to_devmem =3D xe_svm_copy_to_devmem,
> > @@ -714,7 +714,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64
> > start, u64 end, struct xe_vma *v
> > =C2=A0					 min(end,
> > xe_vma_end(vma)));
> > =C2=A0}
> > =C2=A0
> > -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > =C2=A0static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> > =C2=A0{
> > =C2=A0	return &tile->mem.vram;
> > @@ -742,6 +742,9 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct
> > xe_tile *tile,
> > =C2=A0	ktime_t end =3D 0;
> > =C2=A0	int err;
> > =C2=A0
> > +	if (!range->base.flags.migrate_devmem)
> > +		return -EINVAL;
> > +
> > =C2=A0	range_debug(range, "ALLOCATE VRAM");
> > =C2=A0
> > =C2=A0	if (!mmget_not_zero(mm))
> > @@ -761,19 +764,23 @@ int xe_svm_alloc_vram(struct xe_vm *vm,
> > struct xe_tile *tile,
> > =C2=A0		goto unlock;
> > =C2=A0	}
> > =C2=A0
> > -	drm_gpusvm_devmem_init(&bo->devmem_allocation,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->xe->drm.dev, mm,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gpusvm_devmem_ops,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &tile->mem.vram.dpagemap,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_svm_range_size(range));
> > +	drm_pagemap_devmem_init(&bo->devmem_allocation,
> > +				vm->xe->drm.dev, mm,
> > +				&dpagemap_devmem_ops,
> > +				&tile->mem.vram.dpagemap,
> > +				xe_svm_range_size(range));
> > =C2=A0
> > =C2=A0	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> > >blocks;
> > =C2=A0	list_for_each_entry(block, blocks, link)
> > =C2=A0		block->private =3D vr;
> > =C2=A0
> > =C2=A0	xe_bo_get(bo);
> > -	err =3D drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm,
> > &range->base,
> > -					=C2=A0=C2=A0 &bo->devmem_allocation,
> > ctx);
> > +	err =3D drm_pagemap_migrate_to_devmem(&bo-
> > >devmem_allocation,
> > +					=C2=A0=C2=A0=C2=A0 mm,
> > +					=C2=A0=C2=A0=C2=A0
> > xe_svm_range_start(range),
> > +					=C2=A0=C2=A0=C2=A0
> > xe_svm_range_end(range),
> > +					=C2=A0=C2=A0=C2=A0 ctx->timeslice_ms,
> > +					=C2=A0=C2=A0=C2=A0 xe_svm_devm_owner(vm-
> > >xe));
> > =C2=A0	if (err)
> > =C2=A0		xe_svm_devmem_release(&bo->devmem_allocation);
> > =C2=A0
> > @@ -848,13 +855,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> > struct xe_vma *vma,
> > =C2=A0	struct drm_gpusvm_ctx ctx =3D {
> > =C2=A0		.read_only =3D xe_vma_read_only(vma),
> > =C2=A0		.devmem_possible =3D IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > -		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> > SZ_64K : 0,
> > +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > +		.check_pages_threshold =3D IS_DGFX(vm->xe)
> > &&	=09
> > +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ? SZ_64K
> > : 0,
> > =C2=A0		.devmem_only =3D atomic && IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> > +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP),
> > =C2=A0		.timeslice_ms =3D atomic && IS_DGFX(vm->xe) &&
> > -			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> > +			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
> > =C2=A0			vm->xe->atomic_svm_timeslice_ms : 0,
> > =C2=A0	};
> > =C2=A0	struct xe_svm_range *range;
> > @@ -992,7 +999,7 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64
> > start, u64 end)
> > =C2=A0 */
> > =C2=A0int xe_svm_bo_evict(struct xe_bo *bo)
> > =C2=A0{
> > -	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
> > +	return drm_pagemap_evict_to_ram(&bo->devmem_allocation);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > @@ -1045,7 +1052,7 @@ int xe_svm_range_get_pages(struct xe_vm *vm,
> > struct xe_svm_range *range,
> > =C2=A0	return err;
> > =C2=A0}
> > =C2=A0
> > -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> > =C2=A0
> > =C2=A0static struct drm_pagemap_device_addr
> > =C2=A0xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
> > @@ -1102,7 +1109,7 @@ int xe_devm_add(struct xe_tile *tile, struct
> > xe_vram_region *vr)
> > =C2=A0	vr->pagemap.range.start =3D res->start;
> > =C2=A0	vr->pagemap.range.end =3D res->end;
> > =C2=A0	vr->pagemap.nr_range =3D 1;
> > -	vr->pagemap.ops =3D drm_gpusvm_pagemap_ops_get();
> > +	vr->pagemap.ops =3D drm_pagemap_pagemap_ops_get();
> > =C2=A0	vr->pagemap.owner =3D xe_svm_devm_owner(xe);
> > =C2=A0	addr =3D devm_memremap_pages(dev, &vr->pagemap);
> > =C2=A0
> > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > index 6a5156476bf4..4aedc5423aff 100644
> > --- a/include/drm/drm_gpusvm.h
> > +++ b/include/drm/drm_gpusvm.h
> > @@ -16,91 +16,9 @@ struct drm_gpusvm;
> > =C2=A0struct drm_gpusvm_notifier;
> > =C2=A0struct drm_gpusvm_ops;
> > =C2=A0struct drm_gpusvm_range;
> > -struct drm_gpusvm_devmem;
> > =C2=A0struct drm_pagemap;
> > =C2=A0struct drm_pagemap_device_addr;
> > =C2=A0
> > -/**
> > - * struct drm_gpusvm_devmem_ops - Operations structure for GPU SVM
> > device memory
> > - *
> > - * This structure defines the operations for GPU Shared Virtual
> > Memory (SVM)
> > - * device memory. These operations are provided by the GPU driver
> > to manage device memory
> > - * allocations and perform operations such as migration between
> > device memory and system
> > - * RAM.
> > - */
> > -struct drm_gpusvm_devmem_ops {
> > -	/**
> > -	 * @devmem_release: Release device memory allocation
> > (optional)
> > -	 * @devmem_allocation: device memory allocation
> > -	 *
> > -	 * Release device memory allocation and drop a reference
> > to device
> > -	 * memory allocation.
> > -	 */
> > -	void (*devmem_release)(struct drm_gpusvm_devmem
> > *devmem_allocation);
> > -
> > -	/**
> > -	 * @populate_devmem_pfn: Populate device memory PFN
> > (required for migration)
> > -	 * @devmem_allocation: device memory allocation
> > -	 * @npages: Number of pages to populate
> > -	 * @pfn: Array of page frame numbers to populate
> > -	 *
> > -	 * Populate device memory page frame numbers (PFN).
> > -	 *
> > -	 * Return: 0 on success, a negative error code on failure.
> > -	 */
> > -	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem
> > *devmem_allocation,
> > -				=C2=A0=C2=A0 unsigned long npages, unsigned
> > long *pfn);
> > -
> > -	/**
> > -	 * @copy_to_devmem: Copy to device memory (required for
> > migration)
> > -	 * @pages: Pointer to array of device memory pages
> > (destination)
> > -	 * @dma_addr: Pointer to array of DMA addresses (source)
> > -	 * @npages: Number of pages to copy
> > -	 *
> > -	 * Copy pages to device memory.
> > -	 *
> > -	 * Return: 0 on success, a negative error code on failure.
> > -	 */
> > -	int (*copy_to_devmem)(struct page **pages,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages);
> > -
> > -	/**
> > -	 * @copy_to_ram: Copy to system RAM (required for
> > migration)
> > -	 * @pages: Pointer to array of device memory pages
> > (source)
> > -	 * @dma_addr: Pointer to array of DMA addresses
> > (destination)
> > -	 * @npages: Number of pages to copy
> > -	 *
> > -	 * Copy pages to system RAM.
> > -	 *
> > -	 * Return: 0 on success, a negative error code on failure.
> > -	 */
> > -	int (*copy_to_ram)(struct page **pages,
> > -			=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > -			=C2=A0=C2=A0 unsigned long npages);
> > -};
> > -
> > -/**
> > - * struct drm_gpusvm_devmem - Structure representing a GPU SVM
> > device memory allocation
> > - *
> > - * @dev: Pointer to the device structure which device memory
> > allocation belongs to
> > - * @mm: Pointer to the mm_struct for the address space
> > - * @detached: device memory allocations is detached from device
> > pages
> > - * @ops: Pointer to the operations structure for GPU SVM device
> > memory
> > - * @dpagemap: The struct drm_pagemap of the pages this allocation
> > belongs to.
> > - * @size: Size of device memory allocation
> > - * @timeslice_expiration: Timeslice expiration in jiffies
> > - */
> > -struct drm_gpusvm_devmem {
> > -	struct device *dev;
> > -	struct mm_struct *mm;
> > -	struct completion detached;
> > -	const struct drm_gpusvm_devmem_ops *ops;
> > -	struct drm_pagemap *dpagemap;
> > -	size_t size;
> > -	u64 timeslice_expiration;
> > -};
> > -
> > =C2=A0/**
> > =C2=A0 * struct drm_gpusvm_ops - Operations structure for GPU SVM
> > =C2=A0 *
> > @@ -361,15 +279,6 @@ void drm_gpusvm_range_unmap_pages(struct
> > drm_gpusvm *gpusvm,
> > =C2=A0				=C2=A0 struct drm_gpusvm_range *range,
> > =C2=A0				=C2=A0 const struct drm_gpusvm_ctx
> > *ctx);
> > =C2=A0
> > -int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> > -				 struct drm_gpusvm_range *range,
> > -				 struct drm_gpusvm_devmem
> > *devmem_allocation,
> > -				 const struct drm_gpusvm_ctx
> > *ctx);
> > -
> > -int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem
> > *devmem_allocation);
> > -
> > -const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> > -
> > =C2=A0bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned
> > long start,
> > =C2=A0			=C2=A0=C2=A0=C2=A0 unsigned long end);
> > =C2=A0
> > @@ -380,11 +289,6 @@ drm_gpusvm_range_find(struct
> > drm_gpusvm_notifier *notifier, unsigned long start,
> > =C2=A0void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range=
,
> > =C2=A0				=C2=A0=C2=A0 const struct mmu_notifier_range
> > *mmu_range);
> > =C2=A0
> > -void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem
> > *devmem_allocation,
> > -			=C2=A0=C2=A0=C2=A0 struct device *dev, struct mm_struct
> > *mm,
> > -			=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_devmem_ops
> > *ops,
> > -			=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap, size_t
> > size);
> > -
> > =C2=A0#ifdef CONFIG_LOCKDEP
> > =C2=A0/**
> > =C2=A0 * drm_gpusvm_driver_set_lock() - Set the lock protecting accesse=
s
> > to GPU SVM
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > index 202c157ff4d7..dabc9c365df4 100644
> > --- a/include/drm/drm_pagemap.h
> > +++ b/include/drm/drm_pagemap.h
> > @@ -7,6 +7,7 @@
> > =C2=A0#include <linux/types.h>
> > =C2=A0
> > =C2=A0struct drm_pagemap;
> > +struct drm_pagemap_zdd;
> > =C2=A0struct device;
> > =C2=A0
> > =C2=A0/**
> > @@ -104,4 +105,104 @@ struct drm_pagemap {
> > =C2=A0	struct device *dev;
> > =C2=A0};
> > =C2=A0
> > +struct drm_pagemap_devmem;
> > +
> > +/**
> > + * struct drm_pagemap_devmem_ops - Operations structure for GPU
> > SVM device memory
> > + *
> > + * This structure defines the operations for GPU Shared Virtual
> > Memory (SVM)
> > + * device memory. These operations are provided by the GPU driver
> > to manage device memory
> > + * allocations and perform operations such as migration between
> > device memory and system
> > + * RAM.
> > + */
> > +struct drm_pagemap_devmem_ops {
> > +	/**
> > +	 * @devmem_release: Release device memory allocation
> > (optional)
> > +	 * @devmem_allocation: device memory allocation
> > +	 *
> > +	 * Release device memory allocation and drop a reference
> > to device
> > +	 * memory allocation.
> > +	 */
> > +	void (*devmem_release)(struct drm_pagemap_devmem
> > *devmem_allocation);
> > +
> > +	/**
> > +	 * @populate_devmem_pfn: Populate device memory PFN
> > (required for migration)
> > +	 * @devmem_allocation: device memory allocation
> > +	 * @npages: Number of pages to populate
> > +	 * @pfn: Array of page frame numbers to populate
> > +	 *
> > +	 * Populate device memory page frame numbers (PFN).
> > +	 *
> > +	 * Return: 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*populate_devmem_pfn)(struct drm_pagemap_devmem
> > *devmem_allocation,
> > +				=C2=A0=C2=A0 unsigned long npages, unsigned
> > long *pfn);
> > +
> > +	/**
> > +	 * @copy_to_devmem: Copy to device memory (required for
> > migration)
> > +	 * @pages: Pointer to array of device memory pages
> > (destination)
> > +	 * @dma_addr: Pointer to array of DMA addresses (source)
> > +	 * @npages: Number of pages to copy
> > +	 *
> > +	 * Copy pages to device memory.
> > +	 *
> > +	 * Return: 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*copy_to_devmem)(struct page **pages,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages);
> > +
> > +	/**
> > +	 * @copy_to_ram: Copy to system RAM (required for
> > migration)
> > +	 * @pages: Pointer to array of device memory pages
> > (source)
> > +	 * @dma_addr: Pointer to array of DMA addresses
> > (destination)
> > +	 * @npages: Number of pages to copy
> > +	 *
> > +	 * Copy pages to system RAM.
> > +	 *
> > +	 * Return: 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*copy_to_ram)(struct page **pages,
> > +			=C2=A0=C2=A0 dma_addr_t *dma_addr,
> > +			=C2=A0=C2=A0 unsigned long npages);
> > +};
> > +
> > +/**
> > + * struct drm_pagemap_devmem - Structure representing a GPU SVM
> > device memory allocation
> > + *
> > + * @dev: Pointer to the device structure which device memory
> > allocation belongs to
> > + * @mm: Pointer to the mm_struct for the address space
> > + * @detached: device memory allocations is detached from device
> > pages
> > + * @ops: Pointer to the operations structure for GPU SVM device
> > memory
> > + * @dpagemap: The struct drm_pagemap of the pages this allocation
> > belongs to.
> > + * @size: Size of device memory allocation
> > + * @timeslice_expiration: Timeslice expiration in jiffies
> > + */
> > +struct drm_pagemap_devmem {
> > +	struct device *dev;
> > +	struct mm_struct *mm;
> > +	struct completion detached;
> > +	const struct drm_pagemap_devmem_ops *ops;
> > +	struct drm_pagemap *dpagemap;
> > +	size_t size;
> > +	u64 timeslice_expiration;
> > +};
> > +
> > +int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem
> > *devmem_allocation,
> > +				=C2=A0 struct mm_struct *mm,
> > +				=C2=A0 unsigned long start, unsigned
> > long end,
> > +				=C2=A0 unsigned long timeslice_ms,
> > +				=C2=A0 void *pgmap_owner);
> > +
> > +int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem
> > *devmem_allocation);
> > +
> > +const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void);
> > +
> > +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page
> > *page);
> > +
> > +void drm_pagemap_devmem_init(struct drm_pagemap_devmem
> > *devmem_allocation,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev, struct mm_struct
> > *mm,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_devmem_ops
> > *ops,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap, size_t
> > size);
> > +
> > =C2=A0#endif
> > --=20
> > 2.49.0
> >=20

