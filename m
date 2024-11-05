Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7379BCFB3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 15:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1E510E5CB;
	Tue,  5 Nov 2024 14:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CErRFqDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3C810E5CA;
 Tue,  5 Nov 2024 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730818111; x=1762354111;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=U3iZUPaupBcLZgBDw4eoVRy79OxqMmc6wmhwxq7sh/U=;
 b=CErRFqDoarfzFxEXMCnsCXlT2tS9mGEwM2PAjMcgaBrrs2rfj2fF8Y2b
 SOgSA/Nsml6cL/bRNWR6FwB7kQZZaiKoIYaedT4xJMaVI1OoN6AsSB4Io
 v6Qim7GOaCCMRrGPYqxdCiZt8LploB878sCHtBsncTHnSyTFI0bmnE+KO
 pBJujms0zRpXpBVcP6hhx6GOOWeTX8E4OF8fJVFaBJHP1jBaj6GeeThqf
 /4WAnMFaY+xRlE1jQS0sibxdKPBVyZdgjvB44Q2RCgCjfsE97B+9K+qe2
 GLmdfOtfTNDAruCF6YRqMy4gGUZqUJP9v36gvl0p8t8wMvfrMbuTDBVUs Q==;
X-CSE-ConnectionGUID: Q2+UTZxuQfmLgTZEbI5sZQ==
X-CSE-MsgGUID: HrFMfvgkRW2ZOW143w18Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30342769"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30342769"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 06:48:30 -0800
X-CSE-ConnectionGUID: U0YhmF2UQOuocAe7Cyhwpw==
X-CSE-MsgGUID: JV1PzchqQoiLH31nm8bKgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="83708108"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.97])
 ([10.245.246.97])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 06:48:27 -0800
Message-ID: <2bd1937e4a2c842f3e92de7cb32135d72fa73e1f.camel@linux.intel.com>
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 05 Nov 2024 15:48:24 +0100
In-Reply-To: <20241016032518.539495-6-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-6-matthew.brost@intel.com>
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

On Tue, 2024-10-15 at 20:24 -0700, Matthew Brost wrote:


Continued review:

> +/**
> + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped
> for GPU SVM migration
> + * @dev: The device for which the pages were mapped
> + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> + * @npages: Number of pages to unmap
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function unmaps previously mapped pages of memory for GPU
> Shared Virtual
> + * Memory (SVM). It iterates over each DMA address provided in
> @dma_addr, checks
> + * if it's valid and not already unmapped, and unmaps the
> corresponding page.
> + */
> +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> +					=C2=A0=C2=A0 dma_addr_t *dma_addr,
> +					=C2=A0=C2=A0 unsigned long npages,
> +					=C2=A0=C2=A0 enum dma_data_direction
> dir)
> +{
> +	unsigned long i;
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		if (!dma_addr[i] || dma_mapping_error(dev,
> dma_addr[i]))
> +			continue;
> +
> +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_migrate_to_devmem - Migrate GPU SVM range to device
> memory
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @devmem_allocation: Pointer to the device memory allocation. The
> caller
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should hold a reference=
 to the device memory
> allocation,
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 which should be dropped=
 via ops-
> >devmem_release or upon
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the failure of this fun=
ction.
> + * @ctx: GPU SVM context
> + *
> + * This function migrates the specified GPU SVM range to device
> memory. It performs the
> + * necessary setup and invokes the driver-specific operations for
> migration to
> + * device memory. Upon successful return, @devmem_allocation can
> safely reference @range
> + * until ops->devmem_release is called which only upon successful
> return.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> +				 struct drm_gpusvm_range *range,
> +				 struct drm_gpusvm_devmem
> *devmem_allocation,
> +				 const struct drm_gpusvm_ctx *ctx)
> +{
> +	const struct drm_gpusvm_devmem_ops *ops =3D devmem_allocation-
> >ops;
> +	u64 start =3D range->va.start, end =3D range->va.end;
> +	struct migrate_vma migrate =3D {
> +		.start		=3D start,
> +		.end		=3D end,
> +		.pgmap_owner	=3D gpusvm->device_private_page_owner,
> +		.flags		=3D MIGRATE_VMA_SELECT_SYSTEM,
> +	};
> +	struct mm_struct *mm =3D gpusvm->mm;
> +	unsigned long i, npages =3D npages_in_range(start, end);
> +	struct vm_area_struct *vas;
> +	struct drm_gpusvm_zdd *zdd =3D NULL;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int err;
> +
> +	if (!range->flags.migrate_devmem)
> +		return -EINVAL;
> +
> +	if (!ops->populate_devmem_pfn || !ops->copy_to_devmem ||
> !ops->copy_to_ram)
> +		return -EOPNOTSUPP;
> +
> +	if (!mmget_not_zero(mm)) {
> +		err =3D -EFAULT;
> +		goto err_out;
> +	}
> +	mmap_read_lock(mm);
> +
> +	vas =3D vma_lookup(mm, start);
> +	if (!vas) {
> +		err =3D -ENOENT;
> +		goto err_mmunlock;
> +	}
> +
> +	if (end > vas->vm_end || start < vas->vm_start) {
> +		err =3D -EINVAL;
> +		goto err_mmunlock;
> +	}
> +
> +	if (!vma_is_anonymous(vas)) {
> +		err =3D -EBUSY;
> +		goto err_mmunlock;
> +	}
> +
> +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> sizeof(*dma_addr) +
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err =3D -ENOMEM;
> +		goto err_mmunlock;
> +	}
> +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> +	pages =3D buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr))
> * npages;
> +
> +	zdd =3D drm_gpusvm_zdd_alloc(gpusvm-
> >device_private_page_owner);
> +	if (!zdd) {
> +		err =3D -ENOMEM;
> +		goto err_free;
> +	}
> +
> +	migrate.vma =3D vas;
> +	migrate.src =3D buf;
> +	migrate.dst =3D migrate.src + npages;
> +
> +	err =3D migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	/*
> +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages !=3D
> npages, not
> +	 * always an error. Need to revisit possible cases and how
> to handle. We
> +	 * could prefault on migrate.cpages !=3D npages via
> hmm_range_fault.
> +	 */
> +
> +	if (!migrate.cpages) {
> +		err =3D -EFAULT;
> +		goto err_free;
> +	}
> +
> +	if (migrate.cpages !=3D npages) {
> +		err =3D -EBUSY;
> +		goto err_finalize;
> +	}
> +
> +	err =3D ops->populate_devmem_pfn(devmem_allocation, npages,
> migrate.dst);
> +	if (err)
> +		goto err_finalize;
> +
> +	err =3D drm_gpusvm_migrate_map_pages(devmem_allocation->dev,
> dma_addr,
> +					=C2=A0=C2=A0 migrate.src, npages,
> DMA_TO_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		struct page *page =3D pfn_to_page(migrate.dst[i]);
> +
> +		pages[i] =3D page;
> +		migrate.dst[i] =3D migrate_pfn(migrate.dst[i]);
> +		drm_gpusvm_get_devmem_page(page, zdd);
> +	}
> +
> +	err =3D ops->copy_to_devmem(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +	/* Upon success bind devmem allocation to range and zdd */
> +	WRITE_ONCE(zdd->devmem_allocation, devmem_allocation);	/*
> Owns ref */
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev,
> dma_addr, npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_TO_DEVICE);
> +err_free:
> +	if (zdd)
> +		drm_gpusvm_zdd_put(zdd);
> +	kvfree(buf);
> +err_mmunlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +err_out:
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_migrate_populate_ram_pfn - Populate RAM PFNs for a VM
> area
> + * @vas: Pointer to the VM area structure, can be NULL
> + * @npages: Number of pages to populate
> + * @mpages: Number of pages to migrate
> + * @src_mpfn: Source array of migrate PFNs
> + * @mpfn: Array of migrate PFNs to populate
> + * @addr: Start address for PFN allocation
> + *
> + * This function populates the RAM migrate page frame numbers (PFNs)
> for the
> + * specified VM area structure. It allocates and locks pages in the
> VM area for
> + * RAM usage. If vas is non-NULL use alloc_page_vma for allocation,
> if NULL use
> + * alloc_page for allocation.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int drm_gpusvm_migrate_populate_ram_pfn(struct vm_area_struct
> *vas,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> *mpages,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long
> *src_mpfn,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *mpfn,
> u64 addr)
> +{
> +	unsigned long i;
> +
> +	for (i =3D 0; i < npages; ++i, addr +=3D PAGE_SIZE) {
> +		struct page *page;
> +
> +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		if (vas)
> +			page =3D alloc_page_vma(GFP_HIGHUSER, vas,
> addr);
> +		else
> +			page =3D alloc_page(GFP_HIGHUSER);
> +
> +		if (!page)
> +			return -ENOMEM;
> +
> +		lock_page(page);

Allocating under page-locks seem a bit scary, but OTOH we're
recursively locking page-locks as well. Perhaps a comment on why this
is allowed.

Allocating and then trylocking with asserts as separate steps otherwise
would guarantee that we don't hit a deadlock without noticing but the
way it's currently coded seems to be common practice.

> +		mpfn[i] =3D migrate_pfn(page_to_pfn(page));
> +		++*mpages;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpusvm_evict_to_ram - Evict GPU SVM range to RAM
> + * @devmem_allocation: Pointer to the device memory allocation
> + *
> + * Similar to __drm_gpusvm_migrate_to_ram but does not require mmap
> lock and
> + * migration done via migrate_device_* functions.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem
> *devmem_allocation)
> +{
> +	const struct drm_gpusvm_devmem_ops *ops =3D devmem_allocation-
> >ops;
> +	unsigned long npages, mpages =3D 0;
> +	struct page **pages;
> +	unsigned long *src, *dst;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int i, err =3D 0;
> +
> +	npages =3D devmem_allocation->size >> PAGE_SHIFT;
> +
> +retry:
> +	if (!mmget_not_zero(devmem_allocation->mm))
> +		return -EFAULT;
> +
> +	buf =3D kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr)
> +
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err =3D -ENOMEM;
> +		goto err_out;
> +	}
> +	src =3D buf;
> +	dst =3D buf + (sizeof(*src) * npages);
> +	dma_addr =3D buf + (2 * sizeof(*src) * npages);
> +	pages =3D buf + (2 * sizeof(*src) + sizeof(*dma_addr)) *
> npages;
> +
> +	err =3D ops->populate_devmem_pfn(devmem_allocation, npages,
> src);
> +	if (err)
> +		goto err_free;
> +
> +	err =3D migrate_device_prepopulated_range(src, npages);
> +	if (err)
> +		goto err_free;
> +
> +	err =3D drm_gpusvm_migrate_populate_ram_pfn(NULL, npages,
> &mpages, src,
> +						=C2=A0 dst, 0);
> +	if (err || !mpages)
> +		goto err_finalize;
> +
> +	err =3D drm_gpusvm_migrate_map_pages(devmem_allocation->dev,
> dma_addr,
> +					=C2=A0=C2=A0 dst, npages,
> DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i =3D 0; i < npages; ++i)
> +		pages[i] =3D migrate_pfn_to_page(src[i]);
> +
> +	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, dst);
> +	migrate_device_pages(src, dst, npages);
> +	migrate_device_finalize(src, dst, npages);
> +	drm_gpusvm_migrate_unmap_pages(devmem_allocation->dev,
> dma_addr, npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +	mmput_async(devmem_allocation->mm);
> +	if (!err && !READ_ONCE(devmem_allocation->detached)) {
> +		cond_resched();
> +		goto retry;
> +	}
> +
> +	return err;
> +}
> +
> +/**
> + * __drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM
> (internal)
> + * @vas: Pointer to the VM area structure
> + * @device_private_page_owner: Device private pages owner
> + * @page: Pointer to the page for fault handling (can be NULL)
> + * @fault_addr: Fault address
> + * @size: Size of migration
> + *
> + * This internal function performs the migration of the specified
> GPU SVM range
> + * to RAM. It sets up the migration, populates + dma maps RAM PFNs,
> and
> + * invokes the driver-specific operations for migration to RAM.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int __drm_gpusvm_migrate_to_ram(struct vm_area_struct *vas,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void
> *device_private_page_owner,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *page, u64
> fault_addr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 size)
> +{
> +	struct migrate_vma migrate =3D {
> +		.vma		=3D vas,
> +		.pgmap_owner	=3D device_private_page_owner,
> +		.flags		=3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE
> |
> +			MIGRATE_VMA_SELECT_DEVICE_COHERENT,
> +		.fault_page	=3D page,
> +	};
> +	struct drm_gpusvm_zdd *zdd;
> +	const struct drm_gpusvm_devmem_ops *ops;
> +	struct device *dev;
> +	unsigned long npages, mpages =3D 0;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	u64 start, end;
> +	void *buf;
> +	int i, err =3D 0;
> +
> +	start =3D ALIGN_DOWN(fault_addr, size);
> +	end =3D ALIGN(fault_addr + 1, size);
> +
> +	/* Corner where VMA area struct has been partially unmapped
> */
> +	if (start < vas->vm_start)
> +		start =3D vas->vm_start;
> +	if (end > vas->vm_end)
> +		end =3D vas->vm_end;
> +
> +	migrate.start =3D start;
> +	migrate.end =3D end;
> +	npages =3D npages_in_range(start, end);
> +
> +	buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) +
> sizeof(*dma_addr) +
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*pages), GFP_KERNEL);
> +	if (!buf) {
> +		err =3D -ENOMEM;
> +		goto err_out;
> +	}
> +	dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> +	pages =3D buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr))
> * npages;
> +
> +	migrate.vma =3D vas;
> +	migrate.src =3D buf;
> +	migrate.dst =3D migrate.src + npages;
> +
> +	err =3D migrate_vma_setup(&migrate);
> +	if (err)
> +		goto err_free;
> +
> +	/* Raced with another CPU fault, nothing to do */
> +	if (!migrate.cpages)
> +		goto err_free;
> +
> +	if (!page) {
> +		for (i =3D 0; i < npages; ++i) {
> +			if (!(migrate.src[i] & MIGRATE_PFN_MIGRATE))
> +				continue;
> +
> +			page =3D migrate_pfn_to_page(migrate.src[i]);
> +			break;
> +		}
> +
> +		if (!page)
> +			goto err_finalize;
> +	}
> +	zdd =3D page->zone_device_data;
> +	ops =3D zdd->devmem_allocation->ops;
> +	dev =3D zdd->devmem_allocation->dev;
> +
> +	err =3D drm_gpusvm_migrate_populate_ram_pfn(vas, npages,
> &mpages,
> +						=C2=A0 migrate.src,
> migrate.dst,
> +						=C2=A0 start);
> +	if (err)
> +		goto err_finalize;
> +
> +	err =3D drm_gpusvm_migrate_map_pages(dev, dma_addr,
> migrate.dst, npages,
> +					=C2=A0=C2=A0 DMA_FROM_DEVICE);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i =3D 0; i < npages; ++i)
> +		pages[i] =3D migrate_pfn_to_page(migrate.src[i]);
> +
> +	err =3D ops->copy_to_ram(pages, dma_addr, npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(dev, dma_addr, npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_FROM_DEVICE);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_range_evict - Evict GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range to be removed
> + *
> + * This function evicts the specified GPU SVM range.
> + */
> +void drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> +			=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range)

Although we discussed this one before. Ideally I think we'd want to be
able to migrate also other devices' pages. But need to consider device-
coherent pages.


> +{
> +	struct mm_struct *mm =3D gpusvm->mm;
> +	struct vm_area_struct *vas;
> +
> +	if (!mmget_not_zero(mm))
> +		return;
> +
> +	mmap_read_lock(mm);
> +	vas =3D vma_lookup(mm, range->va.start);
> +	if (!vas)
> +		goto unlock;
> +
> +	__drm_gpusvm_migrate_to_ram(vas, gpusvm-
> >device_private_page_owner,
> +				=C2=A0=C2=A0=C2=A0 NULL, range->va.start,
> +				=C2=A0=C2=A0=C2=A0 range->va.end - range-
> >va.start);
> +unlock:
> +	mmap_read_unlock(mm);
> +	mmput(mm);
> +}
> +
> +/**
> + * drm_gpusvm_page_free - Put GPU SVM zone device data associated
> with a page
> + * @page: Pointer to the page
> + *
> + * This function is a callback used to put the GPU SVM zone device
> data
> + * associated with a page when it is being released.
> + */
> +static void drm_gpusvm_page_free(struct page *page)
> +{
> +	drm_gpusvm_zdd_put(page->zone_device_data);
> +}
> +
> +/**
> + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page
> fault handler)
> + * @vmf: Pointer to the fault information structure
> + *
> + * This function is a page fault handler used to migrate a GPU SVM
> range to RAM.
> + * It retrieves the GPU SVM range information from the faulting page
> and invokes
> + * the internal migration function to migrate the range back to RAM.
> + *
> + * Returns:
> + * VM_FAULT_SIGBUS on failure, 0 on success.
> + */
> +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	struct drm_gpusvm_zdd *zdd =3D vmf->page->zone_device_data;
> +	int err;

... and this one only the pages belonging to the current pagemap.

> +
> +	err =3D __drm_gpusvm_migrate_to_ram(vmf->vma,
> +					=C2=A0 zdd-
> >device_private_page_owner,
> +					=C2=A0 vmf->page, vmf->address,
> +					=C2=A0 zdd->devmem_allocation-
> >size);
> +
> +	return err ? VM_FAULT_SIGBUS : 0;
> +}
> +
> +/**
> + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> + */
> +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops =3D {
> +	.page_free =3D drm_gpusvm_page_free,
> +	.migrate_to_ram =3D drm_gpusvm_migrate_to_ram,
> +};
> +
> +/**
> + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device page map
> operations
> + *
> + * Returns:
> + * Pointer to the GPU SVM device page map operations structure.
> + */
> +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> +{
> +	return &drm_gpusvm_pagemap_ops;
> +}
> +
> +/**
> + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping for the
> given address range
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @start: Start address
> + * @end: End address
> + *
> + * Returns:
> + * True if GPU SVM has mapping, False otherwise
> + */
> +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start,
> u64 end)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
> +		struct drm_gpusvm_range *range =3D NULL;
> +
> +		drm_gpusvm_for_each_range(range, notifier, start,
> end)
> +			return true;
> +	}
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h
> b/drivers/gpu/drm/xe/drm_gpusvm.h
> new file mode 100644
> index 000000000000..15ec22d4f9a5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
> @@ -0,0 +1,447 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + */
> +
> +#ifndef __DRM_GPUSVM_H__
> +#define __DRM_GPUSVM_H__
> +
> +#include <linux/kref.h>
> +#include <linux/mmu_notifier.h>
> +#include <linux/workqueue.h>
> +
> +struct dev_pagemap_ops;
> +struct drm_device;
> +struct drm_gpusvm;
> +struct drm_gpusvm_notifier;
> +struct drm_gpusvm_ops;
> +struct drm_gpusvm_range;
> +struct drm_gpusvm_devmem;
> +struct drm_pagemap;
> +struct drm_pagemap_dma_addr;
> +
> +/**
> + * struct drm_gpusvm_devmem_ops - Operations structure for GPU SVM
> device memory
> + *
> + * This structure defines the operations for GPU Shared Virtual
> Memory (SVM)
> + * device memory. These operations are provided by the GPU driver to
> manage device memory
> + * allocations and perform operations such as migration between
> device memory and system
> + * RAM.
> + */
> +struct drm_gpusvm_devmem_ops {
> +	/**
> +	 * @devmem_release: Release device memory allocation
> (optional)
> +	 * @devmem_allocation: device memory allocation
> +	 *
> +	 * This function shall release device memory allocation and
> expects to drop a

NIT: Consider "Release device memory..." rather than "This function
shall release..." (general comment).

> +	 * reference to device memory allocation.
> +	 */
> +	void (*devmem_release)(struct drm_gpusvm_devmem
> *devmem_allocation);
> +
> +	/**
> +	 * @populate_devmem_pfn: Populate device memory PFN
> (required for migration)
> +	 * @devmem_allocation: device memory allocation
> +	 * @npages: Number of pages to populate
> +	 * @pfn: Array of page frame numbers to populate
> +	 *
> +	 * This function shall populate device memory page frame
> numbers (PFN).
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*populate_devmem_pfn)(struct drm_gpusvm_devmem
> *devmem_allocation,
> +				 unsigned long npages, unsigned long
> *pfn);
> +
> +	/**
> +	 * @copy_to_devmem: Copy to device memory (required for
> migration)
> +	 * @pages: Pointer to array of device memory pages
> (destination)
> +	 * @dma_addr: Pointer to array of DMA addresses (source)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * This function shall copy pages to device memory.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_devmem)(struct page **pages,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_addr_t *dma_addr,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long npages);
> +
> +	/**
> +	 * @copy_to_ram: Copy to system RAM (required for migration)
> +	 * @pages: Pointer to array of device memory pages (source)
> +	 * @dma_addr: Pointer to array of DMA addresses
> (destination)
> +	 * @npages: Number of pages to copy
> +	 *
> +	 * This function shall copy pages to system RAM.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code on failure.
> +	 */
> +	int (*copy_to_ram)(struct page **pages,
> +			=C2=A0=C2=A0 dma_addr_t *dma_addr,
> +			=C2=A0=C2=A0 unsigned long npages);
> +};
> +
> +/**
> + * struct drm_gpusvm_devmem - Structure representing a GPU SVM
> device memory allocation
> + *
> + * @dev: Pointer to the device structure which device memory
> allocation belongs to
> + * @mm: Pointer to the mm_struct for the address space
> + * @ops: Pointer to the operations structure for GPU SVM device
> memory
> + * @dpagemap: The struct drm_pagemap of the pages this allocation
> belongs to.
> + * @size: Size of device memory allocation
> + * @detached: device memory allocations is detached from device
> pages
> + */
> +struct drm_gpusvm_devmem {
> +	struct device *dev;
> +	struct mm_struct *mm;
> +	const struct drm_gpusvm_devmem_ops *ops;
> +	struct drm_pagemap *dpagemap;
> +	size_t size;
> +	bool detached;
> +};
> +
> +/**
> + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> + *
> + * This structure defines the operations for GPU Shared Virtual
> Memory (SVM).
> + * These operations are provided by the GPU driver to manage SVM
> ranges and
> + * notifiers.
> + */
> +struct drm_gpusvm_ops {
> +	/**
> +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> +	 *
> +	 * This function shall allocate a GPU SVM notifier.
> +	 *
> +	 * Returns:
> +	 * Pointer to the allocated GPU SVM notifier on success,
> NULL on failure.
> +	 */
> +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> +
> +	/**
> +	 * @notifier_free: Free a GPU SVM notifier (optional)
> +	 * @notifier: Pointer to the GPU SVM notifier to be freed
> +	 *
> +	 * This function shall free a GPU SVM notifier.
> +	 */
> +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> +
> +	/**
> +	 * @range_alloc: Allocate a GPU SVM range (optional)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 *
> +	 * This function shall allocate a GPU SVM range.
> +	 *
> +	 * Returns:
> +	 * Pointer to the allocated GPU SVM range on success, NULL
> on failure.
> +	 */
> +	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm
> *gpusvm);
> +
> +	/**
> +	 * @range_free: Free a GPU SVM range (optional)
> +	 * @range: Pointer to the GPU SVM range to be freed
> +	 *
> +	 * This function shall free a GPU SVM range.
> +	 */
> +	void (*range_free)(struct drm_gpusvm_range *range);
> +
> +	/**
> +	 * @invalidate: Invalidate GPU SVM notifier (required)
> +	 * @gpusvm: Pointer to the GPU SVM
> +	 * @notifier: Pointer to the GPU SVM notifier
> +	 * @mmu_range: Pointer to the mmu_notifier_range structure
> +	 *
> +	 * This function shall invalidate the GPU page tables. It
> can safely
> +	 * walk the notifier range RB tree/list in this function.
> Called while
> +	 * holding the notifier lock.
> +	 */
> +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> +			=C2=A0=C2=A0 struct drm_gpusvm_notifier *notifier,
> +			=C2=A0=C2=A0 const struct mmu_notifier_range
> *mmu_range);
> +};
> +
> +/**
> + * struct drm_gpusvm_notifier - Structure representing a GPU SVM
> notifier
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: MMU interval notifier
> + * @interval: Interval for the notifier
> + * @rb: Red-black tree node for the parent GPU SVM structure
> notifier tree
> + * @root: Cached root node of the RB tree containing ranges
> + * @range_list: List head containing of ranges in the same order
> they appear in
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 interval tree. This is useful to keep iterating
> ranges while
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 doing modifications to RB tree.
> + * @flags.removed: Flag indicating whether the MMU interval notifier
> has been
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 removed

Please also document the nested fields.

> + *
> + * This structure represents a GPU SVM notifier.
> + */
> +struct drm_gpusvm_notifier {
> +	struct drm_gpusvm *gpusvm;
> +	struct mmu_interval_notifier notifier;
> +	struct {
> +		u64 start;
> +		u64 end;
> +	} interval;
> +	struct {
> +		struct rb_node node;
> +		struct list_head entry;
> +		u64 __subtree_last;
> +	} rb;
> +	struct rb_root_cached root;
> +	struct list_head range_list;
> +	struct {
> +		u32 removed : 1;
> +	} flags;
> +};
> +
> +/**
> + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> + *
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier
> + * @refcount: Reference count for the range
> + * @rb: Red-black tree node for the parent GPU SVM notifier
> structure range tree
> + * @va: Virtual address range
> + * @notifier_seq: Notifier sequence number of the range's pages
> + * @dma_addr: DMA address array
> + * @dpagemap: The struct drm_pagemap of the device pages we're dma-
> mapping.
> + * Note this is assuming only one drm_pagemap per range is allowed.
> + * @flags.migrate_devmem: Flag indicating whether the range can be
> migrated to device memory
> + * @flags.unmapped: Flag indicating if the range has been unmapped
> + * @flags.partial_unmap: Flag indicating if the range has been
> partially unmapped
> + * @flags.has_devmem_pages: Flag indicating if the range has devmem
> pages
> + * @flags.has_dma_mapping: Flag indicating if the range has a DMA
> mapping
> + *
> + * This structure represents a GPU SVM range used for tracking
> memory ranges
> + * mapped in a DRM device.
> + */
Also here.

> +struct drm_gpusvm_range {
> +	struct drm_gpusvm *gpusvm;
> +	struct drm_gpusvm_notifier *notifier;
> +	struct kref refcount;
> +	struct {
> +		struct rb_node node;
> +		struct list_head entry;
> +		u64 __subtree_last;
> +	} rb;
> +	struct {
> +		u64 start;
> +		u64 end;
> +	} va;
> +	unsigned long notifier_seq;
> +	struct drm_pagemap_dma_addr *dma_addr;
> +	struct drm_pagemap *dpagemap;
> +	struct {
> +		/* All flags below must be set upon creation */
> +		u16 migrate_devmem : 1;
> +		/* All flags below must be set / cleared under
> notifier lock */
> +		u16 unmapped : 1;
> +		u16 partial_unmap : 1;
> +		u16 has_devmem_pages : 1;
> +		u16 has_dma_mapping : 1;
> +	} flags;
> +};
> +
> +/**
> + * struct drm_gpusvm - GPU SVM structure
> + *
> + * @name: Name of the GPU SVM
> + * @drm: Pointer to the DRM device structure
> + * @mm: Pointer to the mm_struct for the address space
> + * @device_private_page_owner: Device private pages owner
> + * @mm_start: Start address of GPU SVM
> + * @mm_range: Range of the GPU SVM
> + * @notifier_size: Size of individual notifiers
> + * @ops: Pointer to the operations structure for GPU SVM
> + * @chunk_sizes: Pointer to the array of chunk sizes used in range
> allocation.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Entries should be powers of 2 in descending order.
> + * @num_chunks: Number of chunks
> + * @notifier_lock: Read-write semaphore for protecting notifier
> operations
> + * @root: Cached root node of the Red-Black tree containing GPU SVM
> notifiers
> + * @notifier_list: list head containing of notifiers in the same
> order they
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 appear in interval tree. This is useful to keep
> iterating
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 notifiers while doing modifications to RB tree.
> + *
> + * This structure represents a GPU SVM (Shared Virtual Memory) used
> for tracking
> + * memory ranges mapped in a DRM (Direct Rendering Manager) device.
> + *
> + * No reference counting is provided, as this is expected to be
> embedded in the
> + * driver VM structure along with the struct drm_gpuvm, which
> handles reference
> + * counting.
> + */
> +struct drm_gpusvm {
> +	const char *name;
> +	struct drm_device *drm;
> +	struct mm_struct *mm;
> +	void *device_private_page_owner;
> +	u64 mm_start;
> +	u64 mm_range;

Possibly consider using unsigned long for cpu virtual addresses, since
that's typically done elsewhere.=C2=A0
GPU virtual addresses should remain 64-bit, though.

> +	u64 notifier_size;
> +	const struct drm_gpusvm_ops *ops;
> +	const u64 *chunk_sizes;
> +	int num_chunks;
> +	struct rw_semaphore notifier_lock;
> +	struct rb_root_cached root;
> +	struct list_head notifier_list;
> +};
> +
> +/**
> + * struct drm_gpusvm_ctx - DRM GPU SVM context
> + *
> + * @in_notifier: entering from a MMU notifier
> + * @read_only: operating on read-only memory
> + * @devmem_possible: possible to use device memory
> + * @check_pages: check pages and only create range for pages faulted
> in
> + *
> + * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> + */
> +struct drm_gpusvm_ctx {
> +	u32 in_notifier :1;
> +	u32 read_only :1;
> +	u32 devmem_possible :1;
> +	u32 check_pages :1;
> +};
> +
> +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> +		=C2=A0=C2=A0=C2=A0 const char *name, struct drm_device *drm,
> +		=C2=A0=C2=A0=C2=A0 struct mm_struct *mm, void
> *device_private_page_owner,
> +		=C2=A0=C2=A0=C2=A0 u64 mm_start, u64 mm_range, u64 notifier_size,
> +		=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ops *ops,
> +		=C2=A0=C2=A0=C2=A0 const u64 *chunk_sizes, int num_chunks);
> +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64
> fault_addr,
> +				u64 gpuva_start, u64 gpuva_end,
> +				const struct drm_gpusvm_ctx *ctx);
> +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range);
> +void drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> +			=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> +
> +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> +				=C2=A0 struct drm_gpusvm_range *range);
> +
> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx=
);
> +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +				=C2=A0 struct drm_gpusvm_range *range,
> +				=C2=A0 const struct drm_gpusvm_ctx *ctx);

There is some newline inconsistency between declarations. I think the
recommended coding style is to use a newline in-between.

> +
> +int drm_gpusvm_migrate_to_devmem(struct drm_gpusvm *gpusvm,
> +				 struct drm_gpusvm_range *range,
> +				 struct drm_gpusvm_devmem
> *devmem_allocation,
> +				 const struct drm_gpusvm_ctx *ctx);
> +int drm_gpusvm_evict_to_ram(struct drm_gpusvm_devmem
> *devmem_allocation);
> +
> +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> +
> +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start,
> u64 end);
> +
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64
> start, u64 end);
> +
> +/**
> + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure.
> + *
> + * Abstract client usage GPU SVM notifier lock, take lock
> + */
> +#define drm_gpusvm_notifier_lock(gpusvm__)	\
> +	down_read(&(gpusvm__)->notifier_lock)
> +
> +/**
> + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure.
> + *
> + * Abstract client usage GPU SVM notifier lock, drop lock
> + */
> +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
> +	up_read(&(gpusvm__)->notifier_lock)
> +
> +/**
> + * __drm_gpusvm_range_next - Get the next GPU SVM range in the list
> + * @range: a pointer to the current GPU SVM range
> + *
> + * Return: A pointer to the next drm_gpusvm_range if available, or
> NULL if the
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current range is the =
last one or if the input range is
> NULL.
> + */
> +static inline struct drm_gpusvm_range *
> +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> +{
> +	if (range && !list_is_last(&range->rb.entry,
> +				=C2=A0=C2=A0 &range->notifier->range_list))
> +		return list_next_entry(range, rb.entry);
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges in a
> notifier
> + * @range__: Iterator variable for the ranges. If set, it indicates
> the start of
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 the iterator. If NULL, call drm_gpusvm_range=
_find() to
> get the range.
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the range
> + * @end__: End address of the range
> + *
> + * This macro is used to iterate over GPU SVM ranges in a notifier.
> It is safe
> + * to use while holding the driver SVM lock or the notifier lock.
> + */
> +#define drm_gpusvm_for_each_range(range__, notifier__, start__,
> end__)	\
> +	for ((range__) =3D (range__)
> ?:					\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 drm_gpusvm_range_find((notifier__), (start__),
> (end__));	\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (range__) && (range__->va.start <
> (end__));		\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (range__) =3D __drm_gpusvm_range_next(range__)=
)
> +
> +/**
> + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range as unmapped
> + * @range: Pointer to the GPU SVM range structure.
> + * @mmu_range: Pointer to the MMU notifier range structure.
> + *
> + * This function marks a GPU SVM range as unmapped and sets the
> partial_unmap flag
> + * if the range partially falls within the provided MMU notifier
> range.
> + */
> +static inline void
> +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier_range
> *mmu_range)
> +{
> +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> +
> +	range->flags.unmapped =3D true;
> +	if (range->va.start < mmu_range->start ||
> +	=C2=A0=C2=A0=C2=A0 range->va.end > mmu_range->end)
> +		range->flags.partial_unmap =3D true;
> +}

Inlines are really only useful for performance reasons, and that's not
the case here.

> +
> +/**
> + * drm_gpusvm_devmem_init - Initialize a GPU SVM device memory
> allocation
> + *
> + * @dev: Pointer to the device structure which device memory
> allocation belongs to
> + * @mm: Pointer to the mm_struct for the address space
> + * @ops: Pointer to the operations structure for GPU SVM device
> memory
> + * @dpagemap: The struct drm_pagemap we're allocating from.
> + * @size: Size of device memory allocation
> + */
> +static inline void
> +drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev, struct mm_str=
uct *mm,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_devmem_op=
s *ops,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap *dpagemap, siz=
e_t size)
> +{
> +	devmem_allocation->dev =3D dev;
> +	devmem_allocation->mm =3D mm;
> +	devmem_allocation->ops =3D ops;
> +	devmem_allocation->dpagemap =3D dpagemap;
> +	devmem_allocation->size =3D size;
> +}

Same here?


> +
> +#endif /* __DRM_GPUSVM_H__ */
> --
> 2.34.1


Thanks,
Thomas

