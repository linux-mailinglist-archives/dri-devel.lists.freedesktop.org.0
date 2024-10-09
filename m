Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF249967AA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 12:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC3510E6D2;
	Wed,  9 Oct 2024 10:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8pI5CJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CBA10E250;
 Wed,  9 Oct 2024 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728471048; x=1760007048;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=V7riYkTKhMMl9N8A77seA/lQY4RbL1xwHIlRRjQUlqM=;
 b=h8pI5CJOOXiqa6a5rSC0+HwapHjCbRKt7cSAoQ1IJLGfjjlwC4xsqR8Y
 exgwcZKc+/DeZ9e/FFZwZ0R7ZLioY9TGDqxZECPNfT/eXZgpI27HvzmLj
 j2GCdi6iACuImuYDS6B+bRWZLGeqoUR3WerGGdZisnhWcJA3OZU3tw/al
 IGBk+9XsybNKiTZN1SIOJG5nrgv3quBOajjky9sSIjJaZC0dyUYUF9C2k
 F56w5YjKYFLswpymlPK3pbCVyZRdhHvP7CsKQvMksALPEoB2vDgRIQMO1
 9XyES39ytOc/jCRH0Fqv4gvD5owuEqRr4pZjW2b4Pg+x/rLHbCXZl8CIH w==;
X-CSE-ConnectionGUID: +Y7sW96YSe63T0VzK+UUxQ==
X-CSE-MsgGUID: Z57EZKExRh+JU2TFwo8H9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31650873"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="31650873"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:50:47 -0700
X-CSE-ConnectionGUID: JPVsKx0uQHysVh+hkhfqbw==
X-CSE-MsgGUID: 0RIvkMyaS6SL/YHmW4LEDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="76655990"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.243])
 ([10.245.245.243])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 03:50:44 -0700
Message-ID: <8833e047facab0e653a6bcefda396f0f5e876dd8.camel@linux.intel.com>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared
 Virtual Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com, matthew.auld@intel.com, 
 daniel@ffwll.ch
Date: Wed, 09 Oct 2024 12:50:42 +0200
In-Reply-To: <20240828024901.2582335-6-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
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

Hi, Matthew.

Some comments below around migrating to SRAM.


On Tue, 2024-08-27 at 19:48 -0700, Matthew Brost wrote:
> This patch introduces support for GPU Shared Virtual Memory (SVM) in
> the
> Direct Rendering Manager (DRM) subsystem. SVM allows for seamless
> sharing of memory between the CPU and GPU, enhancing performance and
> flexibility in GPU computing tasks.
>=20
> The patch adds the necessary infrastructure for SVM, including data
> structures and functions for managing SVM ranges and notifiers. It
> also
> provides mechanisms for allocating, deallocating, and migrating
> memory
> regions between system RAM and GPU VRAM.
>=20
> This mid-layer is largely inspired by GPUVM.
>=20
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/xe/drm_gpusvm.c | 2174
> +++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/drm_gpusvm.h |=C2=A0 415 ++++++
> =C2=A03 files changed, 2591 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.c
> =C2=A0create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.h
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile
> b/drivers/gpu/drm/xe/Makefile
> index b9670ae09a9e..b8fc2ee58f1a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -25,7 +25,8 @@ $(obj)/generated/%_wa_oob.c
> $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> =C2=A0
> =C2=A0# core driver code
> =C2=A0
> -xe-y +=3D xe_bb.o \
> +xe-y +=3D drm_gpusvm.o \
> +	xe_bb.o \
> =C2=A0	xe_bo.o \
> =C2=A0	xe_bo_evict.o \
> =C2=A0	xe_devcoredump.o \
> diff --git a/drivers/gpu/drm/xe/drm_gpusvm.c
> b/drivers/gpu/drm/xe/drm_gpusvm.c
> new file mode 100644
> index 000000000000..fc1e44e6ae72
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/drm_gpusvm.c
> @@ -0,0 +1,2174 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + *
> + * Authors:
> + *=C2=A0=C2=A0=C2=A0=C2=A0 Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/interval_tree_generic.h>
> +#include <linux/hmm.h>
> +#include <linux/memremap.h>
> +#include <linux/migrate.h>
> +#include <linux/mm_types.h>
> +#include <linux/pagemap.h>
> +#include <linux/slab.h>
> +
> +#include <drm/drm_device.h>
> +#include "drm_gpusvm.h"
> +
> +/**
> + * DOC: Overview
> + *
> + * GPU Shared Virtual Memory (GPU SVM) layer for the Direct
> Rendering Manager (DRM)
> + *
> + * The GPU SVM layer is a component of the DRM framework designed to
> manage shared
> + * virtual memory between the CPU and GPU. It enables efficient data
> exchange and
> + * processing for GPU-accelerated applications by allowing memory
> sharing and
> + * synchronization between the CPU's and GPU's virtual address
> spaces.
> + *
> + * Key GPU SVM Components:
> + * - Notifiers: Notifiers: Used for tracking memory intervals and
> notifying the
> + *		GPU of changes, notifiers are sized based on a GPU
> SVM
> + *		initialization parameter, with a recommendation of
> 512M or
> + *		larger. They maintain a Red-BlacK tree and a list of
> ranges that
> + *		fall within the notifier interval. Notifiers are
> tracked within
> + *		a GPU SVM Red-BlacK tree and list and are
> dynamically inserted
> + *		or removed as ranges within the interval are created
> or
> + *		destroyed.
> + * - Ranges: Represent memory ranges mapped in a DRM device and
> managed
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 by GPU SVM. They are sized based on an array=
 of chunk
> sizes, which
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 is a GPU SVM initialization parameter, and t=
he CPU
> address space.
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 Upon GPU fault, the largest aligned chunk th=
at fits
> within the
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 faulting CPU address space is chosen for the=
 range
> size. Ranges are
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 expected to be dynamically allocated on GPU =
fault and
> removed on an
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 MMU notifier UNMAP event. As mentioned above=
, ranges
> are tracked in
> + *	=C2=A0=C2=A0=C2=A0=C2=A0 a notifier's Red-Black tree.
> + * - Operations: Define the interface for driver-specific SVM
> operations such as
> + *		 allocation, page collection, migration,
> invalidations, and VRAM
> + *		 release.
> + *
> + * This layer provides interfaces for allocating, mapping,
> migrating, and
> + * releasing memory ranges between the CPU and GPU. It handles all
> core memory
> + * management interactions (DMA mapping, HMM, and migration) and
> provides
> + * driver-specific virtual functions (vfuncs). This infrastructure
> is sufficient
> + * to build the expected driver components for an SVM implementation
> as detailed
> + * below.
> + *
> + * Expected Driver Components:
> + * - GPU page fault handler: Used to create ranges and notifiers
> based on the
> + *			=C2=A0=C2=A0=C2=A0=C2=A0 fault address, optionally migrate the
> range to
> + *			=C2=A0=C2=A0=C2=A0=C2=A0 VRAM, and create GPU bindings.
> + * - Garbage collector: Used to destroy GPU bindings for ranges.
> Ranges are
> + *			expected to be added to the garbage
> collector upon
> + *			MMU_NOTIFY_UNMAP event.
> + */
> +
> +/**
> + * DOC: Locking
> + *
> + * GPU SVM handles locking for core MM interactions, i.e., it
> locks/unlocks the
> + * mmap lock as needed. Alternatively, if the driver prefers to
> handle the mmap
> + * lock itself, a 'locked' argument is provided to the functions
> that require
> + * the mmap lock. This option may be useful for drivers that need to
> call into
> + * GPU SVM while also holding a dma-resv lock, thus preventing
> locking
> + * inversions between the mmap and dma-resv locks.
> + *
> + * GPU SVM introduces a global notifier lock, which safeguards the
> notifier's
> + * range RB tree and list, as well as the range's DMA mappings and
> sequence
> + * number. GPU SVM manages all necessary locking and unlocking
> operations,
> + * except for the recheck of the range's sequence number
> + * (mmu_interval_read_retry) when the driver is committing GPU
> bindings. This
> + * lock corresponds to the 'driver->update' lock mentioned in the
> HMM
> + * documentation (TODO: Link). Future revisions may transition from
> a GPU SVM
> + * global lock to a per-notifier lock if finer-grained locking is
> deemed
> + * necessary.
> + *
> + * In addition to the locking mentioned above, the driver should
> implement a
> + * lock to safeguard core GPU SVM function calls that modify state,
> such as
> + * drm_gpusvm_range_find_or_insert and drm_gpusvm_range_remove.
> Alternatively,
> + * these core functions can be called within a single kernel thread,
> for
> + * instance, using an ordered work queue. This lock is denoted as
> + * 'driver_svm_lock' in code examples.
> + */
> +
> +/**
> + * DOC: Migrataion
> + *
> + * The migration support is quite simple, allowing migration between
> SRAM and
> + * VRAM at the range granularity. For example, GPU SVM currently
> does not
> + * support mixing SRAM and VRAM pages within a range. This means
> that upon GPU
> + * fault, the entire range can be migrated to VRAM, and upon CPU
> fault, the
> + * entire range is migrated to SRAM.
> + *
> + * The reasoning for only supporting range granularity is as
> follows: it
> + * simplifies the implementation, and range sizes are driver-defined
> and should
> + * be relatively small.
> + */
> +
> +/**
> + * DOC: Partial Unmapping of Ranges
> + *
> + * Partial unmapping of ranges (e.g., 1M out of 2M is unmapped by
> CPU resulting
> + * in MMU_NOTIFY_UNMAP event) presents several challenges, with the
> main one
> + * being that a subset of the range still has CPU and GPU mappings.
> If the
> + * backing store for the range is in VRAM, a subset of the backing
> store has
> + * references. One option would be to split the range and VRAM
> backing store,
> + * but the implementation for this would be quite complicated. Given
> that
> + * partial unmappings are rare and driver-defined range sizes are
> relatively
> + * small, GPU SVM does not support splitting of ranges.
> + *
> + * With no support for range splitting, upon partial unmapping of a
> range, the
> + * driver is expected to invalidate and destroy the entire range. If
> the range
> + * has VRAM as its backing, the driver is also expected to migrate
> any remaining
> + * pages back to SRAM.
> + */
> +
> +/**
> + * DOC: Examples
> + *
> + * This section provides two examples of how to build the expected
> driver
> + * components: the GPU page fault handler and the garbage collector.
> A third
> + * example demonstrates a sample invalidation driver vfunc.
> + *
> + * The generic code provided does not include logic for complex
> migration
> + * policies, optimized invalidations, or other potentially required
> driver
> + * locking (e.g., DMA-resv locks).
> + *
> + * 1) GPU page fault handler
> + *
> + *	int driver_bind_range(struct drm_gpusvm *gpusvm, struct
> drm_gpusvm_range *range)
> + *	{
> + *		int err =3D 0;
> + *
> + *		driver_alloc_and_setup_memory_for_bind(gpusvm,
> range);
> + *
> + *		drm_gpusvm_notifier_lock(gpusvm);
> + *		if (drm_gpusvm_range_pages_valid(range))
> + *			driver_commit_bind(gpusvm, range);
> + *		else
> + *			err =3D -EAGAIN;
> + *		drm_gpusvm_notifier_unlock(gpusvm);
> + *
> + *		return err;
> + *	}
> + *
> + *	int driver_gpu_fault(struct drm_gpusvm *gpusvm, u64
> fault_addr,
> + *			=C2=A0=C2=A0=C2=A0=C2=A0 u64 gpuva_start, u64 gpuva_end)
> + *	{
> + *		struct drm_gpusvm_ctx ctx =3D {};
> + *		int err;
> + *
> + *		driver_svm_lock();
> + *	retry:
> + *		// Always process UNMAPs first so view of GPU SVM
> ranges is current
> + *		driver_garbage_collector(gpusvm);
> + *
> + *		range =3D drm_gpusvm_range_find_or_insert(gpusvm,
> fault_addr,
> + *							gpuva_start,
> gpuva_end,
> + *						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &ctx);
> + *		if (IS_ERR(range)) {
> + *			err =3D PTR_ERR(range);
> + *			goto unlock;
> + *		}
> + *
> + *		if (driver_migration_policy(range)) {
> + *			bo =3D driver_alloc_bo();
> + *			err =3D drm_gpusvm_migrate_to_vram(gpusvm,
> range, bo, &ctx);
> + *			if (err)	// CPU mappings may have
> changed
> + *				goto retry;
> + *		}
> + *
> + *		err =3D drm_gpusvm_range_get_pages(gpusvm, range,
> &ctx);
> + *		if (err =3D=3D -EFAULT || err =3D=3D -EPERM)	// CPU
> mappings changed
> + *			goto retry;
> + *		else if (err)
> + *			goto unlock;
> + *
> + *		err =3D driver_bind_range(gpusvm, range);
> + *		if (err =3D=3D -EAGAIN)	// CPU mappings changed
> + *			goto retry
> + *
> + *	unlock:
> + *		driver_svm_unlock();
> + *		return err;
> + *	}
> + *
> + * 2) Garbage Collector.
> + *
> + *	void __driver_garbage_collector(struct drm_gpusvm *gpusvm,
> + *					struct drm_gpusvm_range
> *range)
> + *	{
> + *		struct drm_gpusvm_ctx ctx =3D {};
> + *
> + *		assert_driver_svm_locked(gpusvm);
> + *
> + *		// Partial unmap, migrate any remaining VRAM pages
> back to SRAM
> + *		if (range->flags.partial_unmap)
> + *			drm_gpusvm_migrate_to_sram(gpusvm, range,
> &ctx);
> + *
> + *		driver_unbind_range(range);
> + *		drm_gpusvm_range_remove(gpusvm, range);
> + *	}
> + *
> + *	void driver_garbage_collector(struct drm_gpusvm *gpusvm)
> + *	{
> + *		assert_driver_svm_locked(gpusvm);
> + *
> + *		for_each_range_in_garbage_collector(gpusvm, range)
> + *			__driver_garbage_collector(gpusvm, range);
> + *	}
> + *
> + * 3) Invalidation driver vfunc.
> + *
> + *	void driver_invalidation(struct drm_gpusvm *gpusvm,
> + *				 struct drm_gpusvm_notifier
> *notifier,
> + *				 const struct mmu_notifier_range
> *mmu_range)
> + *	{
> + *		struct drm_gpusvm_ctx ctx =3D { .in_notifier =3D true,
> };
> + *		struct drm_gpusvm_range *range =3D NULL;
> + *
> + *		driver_invalidate_device_tlb(gpusvm, mmu_range-
> >start, mmu_range->end);
> + *
> + *		drm_gpusvm_for_each_range(range, notifier,
> mmu_range->start,
> + *					=C2=A0 mmu_range->end) {
> + *			drm_gpusvm_range_unmap_pages(gpusvm, range,
> &ctx);
> + *
> + *			if (mmu_range->event !=3D MMU_NOTIFY_UNMAP)
> + *				continue;
> + *
> + *			drm_gpusvm_range_set_unmapped(range,
> mmu_range);
> + *			driver_garbage_collector_add(gpusvm, range);
> + *		}
> + *	}
> + */
> +
> +#define DRM_GPUSVM_RANGE_START(_range)	((_range)->va.start)
> +#define DRM_GPUSVM_RANGE_END(_range)	((_range)->va.end - 1)
> +INTERVAL_TREE_DEFINE(struct drm_gpusvm_range, rb.node, u64,
> rb.__subtree_last,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 DRM_GPUSVM_RANGE_START, DRM_GPUSVM_RANGE_END,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 static __maybe_unused, range);
> +
> +#define DRM_GPUSVM_NOTIFIER_START(_notifier)	((_notifier)-
> >interval.start)
> +#define DRM_GPUSVM_NOTIFIER_END(_notifier)	((_notifier)-
> >interval.end - 1)
> +INTERVAL_TREE_DEFINE(struct drm_gpusvm_notifier, rb.node, u64,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 rb.__subtree_last, DRM_GPUSVM_NOTIFIER_START,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 DRM_GPUSVM_NOTIFIER_END, static __maybe_unuse=
d,
> notifier);
> +
> +/**
> + * npages_in_range() - Calculate the number of pages in a given
> range
> + * @start__: The start address of the range
> + * @end__: The end address of the range
> + *
> + * This macro calculates the number of pages in a given memory
> range,
> + * specified by the start and end addresses. It divides the
> difference
> + * between the end and start addresses by the page size (PAGE_SIZE)
> to
> + * determine the number of pages in the range.
> + *
> + * Return: The number of pages in the specified range.
> + */
> +#define npages_in_range(start__, end__)	\
> +	(((end__) - (start__)) >> PAGE_SHIFT)
> +
> +/**
> + * struct drm_gpusvm_zdd - GPU SVM zone device data
> + *
> + * @refcount: Reference count for the zdd
> + * @destroy_work: Work structure for asynchronous zdd destruction
> + * @range: Pointer to the GPU SVM range
> + * @vram_allocation: Driver-private pointer to the VRAM allocation
> + *
> + * This structure serves as a generic wrapper installed in
> + * page->zone_device_data. It provides infrastructure for looking up
> a range
> + * upon CPU page fault and asynchronously releasing VRAM once the
> CPU has no
> + * page references. Asynchronous release is useful because CPU page
> references
> + * can be dropped in IRQ contexts, while releasing VRAM likely
> requires sleeping
> + * locks.
> + */
> +struct drm_gpusvm_zdd {
> +	struct kref refcount;
> +	struct work_struct destroy_work;
> +	struct drm_gpusvm_range *range;
> +	void *vram_allocation;
> +};
> +
> +/**
> + * drm_gpusvm_zdd_destroy_work_func - Work function for destroying a
> zdd
> + * @w: Pointer to the work_struct
> + *
> + * This function releases VRAM, puts GPU SVM range, and frees zdd.
> + */
> +static void drm_gpusvm_zdd_destroy_work_func(struct work_struct *w)
> +{
> +	struct drm_gpusvm_zdd *zdd =3D
> +		container_of(w, struct drm_gpusvm_zdd,
> destroy_work);
> +	struct drm_gpusvm_range *range =3D zdd->range;
> +	struct drm_gpusvm *gpusvm =3D range->gpusvm;
> +
> +	if (gpusvm->ops->vram_release && zdd->vram_allocation)
> +		gpusvm->ops->vram_release(zdd->vram_allocation);
> +	drm_gpusvm_range_put(range);
> +	kfree(zdd);
> +}
> +
> +/**
> + * drm_gpusvm_zdd_alloc - Allocate a zdd structure.
> + * @range: Pointer to the GPU SVM range.
> + *
> + * This function allocates and initializes a new zdd structure. It
> sets up the
> + * reference count, initializes the destroy work, and links the
> provided GPU SVM
> + * range.
> + *
> + * Returns:
> + * Pointer to the allocated zdd on success, ERR_PTR() on failure.
> + */
> +static struct drm_gpusvm_zdd *
> +drm_gpusvm_zdd_alloc(struct drm_gpusvm_range *range)
> +{
> +	struct drm_gpusvm_zdd *zdd;
> +
> +	zdd =3D kmalloc(sizeof(*zdd), GFP_KERNEL);
> +	if (!zdd)
> +		return NULL;
> +
> +	kref_init(&zdd->refcount);
> +	INIT_WORK(&zdd->destroy_work,
> drm_gpusvm_zdd_destroy_work_func);
> +	zdd->range =3D drm_gpusvm_range_get(range);
> +	zdd->vram_allocation =3D NULL;
> +
> +	return zdd;
> +}
> +
> +/**
> + * drm_gpusvm_zdd_get - Get a reference to a zdd structure.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function increments the reference count of the provided zdd
> structure.
> + *
> + * Returns: Pointer to the zdd structure.
> + */
> +static struct drm_gpusvm_zdd *drm_gpusvm_zdd_get(struct
> drm_gpusvm_zdd *zdd)
> +{
> +	kref_get(&zdd->refcount);
> +	return zdd;
> +}
> +
> +/**
> + * drm_gpusvm_zdd_destroy - Destroy a zdd structure.
> + * @ref: Pointer to the reference count structure.
> + *
> + * This function queues the destroy_work of the zdd for asynchronous
> destruction.
> + */
> +static void drm_gpusvm_zdd_destroy(struct kref *ref)
> +{
> +	struct drm_gpusvm_zdd *zdd =3D
> +		container_of(ref, struct drm_gpusvm_zdd, refcount);
> +	struct drm_gpusvm *gpusvm =3D zdd->range->gpusvm;
> +
> +	queue_work(gpusvm->zdd_wq, &zdd->destroy_work);
> +}
> +
> +/**
> + * drm_gpusvm_zdd_put - Put a zdd reference.
> + * @zdd: Pointer to the zdd structure.
> + *
> + * This function decrements the reference count of the provided zdd
> structure
> + * and schedules its destruction if the count drops to zero.
> + */
> +static void drm_gpusvm_zdd_put(struct drm_gpusvm_zdd *zdd)
> +{
> +	kref_put(&zdd->refcount, drm_gpusvm_zdd_destroy);
> +}
> +
> +/**
> + * drm_gpusvm_range_find - Find GPU SVM range from GPU SVM notifier
> + * @notifier: Pointer to the GPU SVM notifier structure.
> + * @start: Start address of the range
> + * @end: End address of the range
> + *
> + * Return: A pointer to the drm_gpusvm_range if found or NULL
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64
> start, u64 end)
> +{
> +	return range_iter_first(&notifier->root, start, end - 1);
> +}
> +
> +/**
> + * drm_gpusvm_for_each_range_safe - Safely iterate over GPU SVM
> ranges in a notifier
> + * @range__: Iterator variable for the ranges
> + * @next__: Iterator variable for the ranges temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the range
> + * @end__: End address of the range
> + *
> + * This macro is used to iterate over GPU SVM ranges in a notifier
> while
> + * removing ranges from it.
> + */
> +#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__,
> start__, end__)	\
> +	for ((range__) =3D drm_gpusvm_range_find((notifier__),
> (start__), (end__)),	\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (next__) =3D
> __drm_gpusvm_range_next(range__);				\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (range__) && (range__->va.start <
> (end__));				\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (range__) =3D (next__), (next__) =3D
> __drm_gpusvm_range_next(range__))
> +
> +/**
> + * __drm_gpusvm_notifier_next - get the next drm_gpusvm_notifier in
> the list
> + * @notifier: a pointer to the current drm_gpusvm_notifier
> + *
> + * Return: A pointer to the next drm_gpusvm_notifier if available,
> or NULL if
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the current notifier =
is the last one or if the input
> notifier is
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL.
> + */
> +static struct drm_gpusvm_notifier *
> +__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
> +{
> +	if (notifier && !list_is_last(&notifier->rb.entry,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &notifier->gpusvm-
> >notifier_list))
> +		return list_next_entry(notifier, rb.entry);
> +
> +	return NULL;
> +}
> +
> +/**
> + * drm_gpusvm_for_each_notifier - Iterate over GPU SVM notifiers in
> a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
> + */
> +#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__,
> end__)		\
> +	for ((notifier__) =3D notifier_iter_first(&(gpusvm__)->root,
> (start__), (end__) - 1);	\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) && (notifier__->interval.start <
> (end__));			\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) =3D __drm_gpusvm_notifier_next(no=
tifier__))
> +
> +/**
> + * drm_gpusvm_for_each_notifier_safe - Safely iterate over GPU SVM
> notifiers in a gpusvm
> + * @notifier__: Iterator variable for the notifiers
> + * @next__: Iterator variable for the notifiers temporay storage
> + * @notifier__: Pointer to the GPU SVM notifier
> + * @start__: Start address of the notifier
> + * @end__: End address of the notifier
> + *
> + * This macro is used to iterate over GPU SVM notifiers in a gpusvm
> while
> + * removing notifiers from it.
> + */
> +#define drm_gpusvm_for_each_notifier_safe(notifier__, next__,
> gpusvm__, start__, end__)	\
> +	for ((notifier__) =3D notifier_iter_first(&(gpusvm__)->root,
> (start__), (end__) - 1),	\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (next__) =3D
> __drm_gpusvm_notifier_next(notifier__);				\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) && (notifier__->interval.start <
> (end__));			\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (notifier__) =3D (next__), (next__) =3D
> __drm_gpusvm_notifier_next(notifier__))
> +
> +/**
> + * drm_gpusvm_notifier_invalidate - Invalidate a GPU SVM notifier.
> + * @mni: Pointer to the mmu_interval_notifier structure.
> + * @mmu_range: Pointer to the mmu_notifier_range structure.
> + * @cur_seq: Current sequence number.
> + *
> + * This function serves as a generic MMU notifier for GPU SVM. It
> sets the MMU
> + * notifier sequence number and calls the driver invalidate vfunc
> under
> + * gpusvm->notifier_lock.
> + *
> + * Returns:
> + * true if the operation succeeds, false otherwise.
> + */
> +static bool
> +drm_gpusvm_notifier_invalidate(struct mmu_interval_notifier *mni,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier_range
> *mmu_range,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long cur_seq)
> +{
> +	struct drm_gpusvm_notifier *notifier =3D
> +		container_of(mni, typeof(*notifier), notifier);
> +	struct drm_gpusvm *gpusvm =3D notifier->gpusvm;
> +
> +	if (!mmu_notifier_range_blockable(mmu_range))
> +		return false;
> +
> +	down_write(&gpusvm->notifier_lock);
> +	mmu_interval_set_seq(mni, cur_seq);
> +	gpusvm->ops->invalidate(gpusvm, notifier, mmu_range);
> +	up_write(&gpusvm->notifier_lock);
> +
> +	return true;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_ops - MMU interval notifier operations for
> GPU SVM
> + */
> +static const struct mmu_interval_notifier_ops
> drm_gpusvm_notifier_ops =3D {
> +	.invalidate =3D drm_gpusvm_notifier_invalidate,
> +};
> +
> +/**
> + * drm_gpusvm_init - Initialize the GPU SVM.
> + * @gpusvm: Pointer to the GPU SVM structure.
> + * @name: Name of the GPU SVM.
> + * @drm: Pointer to the DRM device structure.
> + * @mm: Pointer to the mm_struct for the address space.
> + * @device_private_page_owner: Device private pages owner.
> + * @mm_start: Start address of GPU SVM.
> + * @mm_range: Range of the GPU SVM.
> + * @notifier_size: Size of individual notifiers.
> + * @ops: Pointer to the operations structure for GPU SVM.
> + * @chunk_sizes: Pointer to the array of chunk sizes used in range
> allocation.
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Entries should be powers of 2 in descending order
> with last
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 entry being SZ_4K.
> + * @num_chunks: Number of chunks.
> + *
> + * This function initializes the GPU SVM.
> + *
> + * Returns:
> + * 0 on success, a negative error code on failure.
> + */
> +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> +		=C2=A0=C2=A0=C2=A0 const char *name, struct drm_device *drm,
> +		=C2=A0=C2=A0=C2=A0 struct mm_struct *mm, void
> *device_private_page_owner,
> +		=C2=A0=C2=A0=C2=A0 u64 mm_start, u64 mm_range, u64 notifier_size,
> +		=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ops *ops,
> +		=C2=A0=C2=A0=C2=A0 const u64 *chunk_sizes, int num_chunks)
> +{
> +	if (!ops->invalidate || !num_chunks)
> +		return -EINVAL;
> +
> +	gpusvm->name =3D name;
> +	gpusvm->drm =3D drm;
> +	gpusvm->mm =3D mm;
> +	gpusvm->device_private_page_owner =3D
> device_private_page_owner;
> +	gpusvm->mm_start =3D mm_start;
> +	gpusvm->mm_range =3D mm_range;
> +	gpusvm->notifier_size =3D notifier_size;
> +	gpusvm->ops =3D ops;
> +	gpusvm->chunk_sizes =3D chunk_sizes;
> +	gpusvm->num_chunks =3D num_chunks;
> +	gpusvm->zdd_wq =3D system_wq;
> +
> +	mmgrab(mm);
> +	gpusvm->root =3D RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&gpusvm->notifier_list);
> +
> +	init_rwsem(&gpusvm->notifier_lock);
> +
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(&gpusvm->notifier_lock);
> +	fs_reclaim_release(GFP_KERNEL);
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_find - Find GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM structure
> + * @fault_addr__: Fault address
> + *
> + * This macro finds the GPU SVM notifier associated with the fault
> address.
> + *
> + * Returns:
> + * Pointer to the GPU SVM notifier on success, NULL otherwise.
> + */
> +#define drm_gpusvm_notifier_find(gpusvm__, fault_addr__)	\
> +	notifier_iter_first(&(gpusvm__)->root, (fault_addr__),	\
> +			=C2=A0=C2=A0=C2=A0 (fault_addr__ + 1))
> +
> +/**
> + * to_drm_gpusvm_notifier - retrieve the container struct for a
> given rbtree node
> + * @node__: a pointer to the rbtree node embedded within a
> drm_gpusvm_notifier struct
> + *
> + * Return: A pointer to the containing drm_gpusvm_notifier
> structure.
> + */
> +#define to_drm_gpusvm_notifier(__node)				\
> +	container_of((__node), struct drm_gpusvm_notifier, rb.node)
> +
> +/**
> + * drm_gpusvm_notifier_insert - Insert GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + *
> + * This function inserts the GPU SVM notifier into the GPU SVM RB
> tree and list.
> + */
> +static void drm_gpusvm_notifier_insert(struct drm_gpusvm *gpusvm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier
> *notifier)
> +{
> +	struct rb_node *node;
> +	struct list_head *head;
> +
> +	notifier_insert(notifier, &gpusvm->root);
> +
> +	node =3D rb_prev(&notifier->rb.node);
> +	if (node)
> +		head =3D &(to_drm_gpusvm_notifier(node))->rb.entry;
> +	else
> +		head =3D &gpusvm->notifier_list;
> +
> +	list_add(&notifier->rb.entry, head);
> +}
> +
> +/**
> + * drm_gpusvm_notifier_remove - Remove GPU SVM notifier
> + * @gpusvm__: Pointer to the GPU SVM tructure
> + * @notifier__: Pointer to the GPU SVM notifier structure
> + *
> + * This macro removes the GPU SVM notifier from the GPU SVM RB tree
> and list.
> + */
> +#define drm_gpusvm_notifier_remove(gpusvm__, notifier__)	\
> +	notifier_remove((notifier__), &(gpusvm__)->root);	\
> +	list_del(&(notifier__)->rb.entry)
> +
> +/**
> + * drm_gpusvm_fini - Finalize the GPU SVM.
> + * @gpusvm: Pointer to the GPU SVM structure.
> + *
> + * This function finalizes the GPU SVM by cleaning up any remaining
> ranges and
> + * notifiers, and dropping a reference to struct MM.
> + */
> +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
> +{
> +	struct drm_gpusvm_notifier *notifier, *next;
> +
> +	drm_gpusvm_for_each_notifier_safe(notifier, next, gpusvm, 0,
> LONG_MAX) {
> +		struct drm_gpusvm_range *range, *__next;
> +
> +		/*
> +		 * Remove notifier first to avoid racing with any
> invalidation
> +		 */
> +		mmu_interval_notifier_remove(&notifier->notifier);
> +		notifier->flags.removed =3D true;
> +
> +		drm_gpusvm_for_each_range_safe(range, __next,
> notifier, 0,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LONG_MAX)
> +			drm_gpusvm_range_remove(gpusvm, range);
> +	}
> +
> +	mmdrop(gpusvm->mm);
> +	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
> +}
> +
> +/**
> + * drm_gpusvm_notifier_alloc - Allocate GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @fault_addr: Fault address
> + *
> + * This function allocates and initializes the GPU SVM notifier
> structure.
> + *
> + * Returns:
> + * Pointer to the allocated GPU SVM notifier on success, ERR_PTR()
> on failure.
> + */
> +static struct drm_gpusvm_notifier *
> +drm_gpusvm_notifier_alloc(struct drm_gpusvm *gpusvm, u64 fault_addr)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	if (gpusvm->ops->notifier_alloc)
> +		notifier =3D gpusvm->ops->notifier_alloc();
> +	else
> +		notifier =3D kzalloc(sizeof(*notifier), GFP_KERNEL);
> +
> +	if (!notifier)
> +		return ERR_PTR(-ENOMEM);
> +
> +	notifier->gpusvm =3D gpusvm;
> +	notifier->interval.start =3D ALIGN_DOWN(fault_addr, gpusvm-
> >notifier_size);
> +	notifier->interval.end =3D ALIGN(fault_addr + 1, gpusvm-
> >notifier_size);
> +	INIT_LIST_HEAD(&notifier->rb.entry);
> +	notifier->root =3D RB_ROOT_CACHED;
> +	INIT_LIST_HEAD(&notifier->range_list);
> +
> +	return notifier;
> +}
> +
> +/**
> + * drm_gpusvm_notifier_free - Free GPU SVM notifier
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + *
> + * This function frees the GPU SVM notifier structure.
> + */
> +static void drm_gpusvm_notifier_free(struct drm_gpusvm *gpusvm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier
> *notifier)
> +{
> +	WARN_ON(!RB_EMPTY_ROOT(&notifier->root.rb_root));
> +
> +	if (gpusvm->ops->notifier_free)
> +		gpusvm->ops->notifier_free(notifier);
> +	else
> +		kfree(notifier);
> +}
> +
> +/**
> + * to_drm_gpusvm_range - retrieve the container struct for a given
> rbtree node
> + * @node__: a pointer to the rbtree node embedded within a
> drm_gpusvm_range struct
> + *
> + * Return: A pointer to the containing drm_gpusvm_range structure.
> + */
> +#define to_drm_gpusvm_range(node__)	\
> +	container_of((node__), struct drm_gpusvm_range, rb.node)
> +
> +/**
> + * drm_gpusvm_range_insert - Insert GPU SVM range
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function inserts the GPU SVM range into the notifier RB tree
> and list.
> + */
> +static void drm_gpusvm_range_insert(struct drm_gpusvm_notifier
> *notifier,
> +				=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range)
> +{
> +	struct rb_node *node;
> +	struct list_head *head;
> +
> +	drm_gpusvm_notifier_lock(notifier->gpusvm);
> +	range_insert(range, &notifier->root);
> +
> +	node =3D rb_prev(&range->rb.node);
> +	if (node)
> +		head =3D &(to_drm_gpusvm_range(node))->rb.entry;
> +	else
> +		head =3D &notifier->range_list;
> +
> +	list_add(&range->rb.entry, head);
> +	drm_gpusvm_notifier_unlock(notifier->gpusvm);
> +}
> +
> +/**
> + * __drm_gpusvm_range_remove - Remove GPU SVM range
> + * @notifier__: Pointer to the GPU SVM notifier structure
> + * @range__: Pointer to the GPU SVM range structure
> + *
> + * This macro removes the GPU SVM range from the notifier RB tree
> and list.
> + */
> +#define __drm_gpusvm_range_remove(notifier__, range__)		\
> +	range_remove((range__), &(notifier__)->root);		\
> +	list_del(&(range__)->rb.entry)
> +
> +/**
> + * drm_gpusvm_range_alloc - Allocate GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @fault_addr: Fault address
> + * @chunk_size: Chunk size
> + * @migrate_vram: Flag indicating whether to migrate VRAM
> + *
> + * This function allocates and initializes the GPU SVM range
> structure.
> + *
> + * Returns:
> + * Pointer to the allocated GPU SVM range on success, ERR_PTR() on
> failure.
> + */
> +static struct drm_gpusvm_range *
> +drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier *notif=
ier,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 fault_addr, u64 chunk_size, b=
ool
> migrate_vram)
> +{
> +	struct drm_gpusvm_range *range;
> +
> +	if (gpusvm->ops->range_alloc)
> +		range =3D gpusvm->ops->range_alloc(gpusvm);
> +	else
> +		range =3D kzalloc(sizeof(*range), GFP_KERNEL);
> +
> +	if (!range)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&range->refcount);
> +	range->gpusvm =3D gpusvm;
> +	range->notifier =3D notifier;
> +	range->va.start =3D ALIGN_DOWN(fault_addr, chunk_size);
> +	range->va.end =3D ALIGN(fault_addr + 1, chunk_size);
> +	INIT_LIST_HEAD(&range->rb.entry);
> +	range->notifier_seq =3D LONG_MAX;
> +	range->flags.migrate_vram =3D migrate_vram ? 1 : 0;
> +
> +	return range;
> +}
> +
> +/**
> + * drm_gpusvm_check_pages - Check pages
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @start: Start address
> + * @end: End address
> + *
> + * Check if pages between start and end have been faulted in on the
> CPU. Use to
> + * prevent migration of pages without CPU backing store.
> + *
> + * Returns:
> + * True if pages have been faulted into CPU, False otherwise
> + */
> +static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
> +				=C2=A0=C2=A0 struct drm_gpusvm_notifier
> *notifier,
> +				=C2=A0=C2=A0 u64 start, u64 end)
> +{
> +	struct hmm_range hmm_range =3D {
> +		.default_flags =3D 0,
> +		.notifier =3D &notifier->notifier,
> +		.start =3D start,
> +		.end =3D end,
> +		.dev_private_owner =3D gpusvm-
> >device_private_page_owner,
> +	};
> +	unsigned long timeout =3D
> +		jiffies +
> msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long *pfns;
> +	unsigned long npages =3D npages_in_range(start, end);
> +	int err, i;
> +
> +	mmap_assert_locked(gpusvm->mm);
> +
> +	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> +	if (!pfns)
> +		return false;
> +
> +	hmm_range.notifier_seq =3D mmu_interval_read_begin(&notifier-
> >notifier);
> +	hmm_range.hmm_pfns =3D pfns;
> +
> +	while (true) {
> +		err =3D hmm_range_fault(&hmm_range);
> +		if (err =3D=3D -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			hmm_range.notifier_seq =3D
> mmu_interval_read_begin(&notifier->notifier);
> +			continue;
> +		}
> +		break;
> +	}
> +	if (err)
> +		goto err_free;
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		if (!(pfns[i] & HMM_PFN_VALID)) {
> +			err =3D -EFAULT;
> +			goto err_free;
> +		}
> +	}
> +
> +err_free:
> +	kvfree(pfns);
> +	return err ? false : true;
> +}
> +
> +/**
> + * drm_gpusvm_range_chunk_size - Determine chunk size for GPU SVM
> range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @notifier: Pointer to the GPU SVM notifier structure
> + * @vas: Pointer to the virtual memory area structure
> + * @fault_addr: Fault address
> + * @gpuva_start: Start address of GPUVA which mirrors CPU
> + * @gpuva_end: End address of GPUVA which mirrors CPU
> + * @check_pages: Flag indicating whether to check pages
> + *
> + * This function determines the chunk size for the GPU SVM range
> based on the
> + * fault address, GPU SVM chunk sizes, existing GPU SVM ranges, and
> the virtual
> + * memory area boundaries.
> + *
> + * Returns:
> + * Chunk size on success, LONG_MAX on failure.
> + */
> +static u64 drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier
> *notifier,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vm_area_struct *vas,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 fault_addr, u64
> gpuva_start,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 gpuva_end, bool
> check_pages)
> +{
> +	u64 start, end;
> +	int i =3D 0;
> +
> +retry:
> +	for (; i < gpusvm->num_chunks; ++i) {
> +		start =3D ALIGN_DOWN(fault_addr, gpusvm-
> >chunk_sizes[i]);
> +		end =3D ALIGN(fault_addr + 1, gpusvm->chunk_sizes[i]);
> +
> +		if (start >=3D vas->vm_start && end <=3D vas->vm_end &&
> +		=C2=A0=C2=A0=C2=A0 start >=3D notifier->interval.start &&
> +		=C2=A0=C2=A0=C2=A0 end <=3D notifier->interval.end &&
> +		=C2=A0=C2=A0=C2=A0 start >=3D gpuva_start && end <=3D gpuva_end)
> +			break;
> +	}
> +
> +	if (i =3D=3D gpusvm->num_chunks)
> +		return LONG_MAX;
> +
> +	/*
> +	 * If allocation more than page, ensure not to overlap with
> existing
> +	 * ranges.
> +	 */
> +	if (end - start !=3D SZ_4K) {
> +		struct drm_gpusvm_range *range;
> +
> +		range =3D drm_gpusvm_range_find(notifier, start, end);
> +		if (range) {
> +			++i;
> +			goto retry;
> +		}
> +
> +		/*
> +		 * XXX: Only create range on pages CPU has faulted
> in. Without
> +		 * this check, or prefault, on BMG
> 'xe_exec_system_allocator --r
> +		 * process-many-malloc' fails. In the failure case,
> each process
> +		 * mallocs 16k but the CPU VMA is ~128k which
> results in 64k SVM
> +		 * ranges. When migrating the SVM ranges, some
> processes fail in
> +		 * drm_gpusvm_migrate_to_vram with 'migrate.cpages
> !=3D npages'
> +		 * and then upon drm_gpusvm_range_get_pages device
> pages from
> +		 * other processes are collected + faulted in which
> creates all
> +		 * sorts of problems. Unsure exactly how this
> happening, also
> +		 * problem goes away if 'xe_exec_system_allocator --
> r
> +		 * process-many-malloc' mallocs at least 64k at a
> time.
> +		 */
> +		if (check_pages &&
> +		=C2=A0=C2=A0=C2=A0 !drm_gpusvm_check_pages(gpusvm, notifier, start,
> end)) {
> +			++i;
> +			goto retry;
> +		}
> +	}
> +
> +	return end - start;
> +}
> +
> +/**
> + * drm_gpusvm_range_find_or_insert - Find or insert GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @fault_addr: Fault address
> + * @gpuva_start: Start address of GPUVA which mirrors CPU
> + * @gpuva_end: End address of GPUVA which mirrors CPU
> + * @ctx: GPU SVM context
> + *
> + * This function finds or inserts a newly allocated a GPU SVM range
> based on the
> + * fault address. Caller must hold a lock to protect range lookup
> and insertion.
> + *
> + * Returns:
> + * Pointer to the GPU SVM range on success, ERR_PTR() on failure.
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64
> fault_addr,
> +				u64 gpuva_start, u64 gpuva_end,
> +				const struct drm_gpusvm_ctx *ctx)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +	struct drm_gpusvm_range *range;
> +	struct mm_struct *mm =3D gpusvm->mm;
> +	struct vm_area_struct *vas;
> +	bool notifier_alloc =3D false;
> +	u64 chunk_size;
> +	int err;
> +	bool migrate_vram;
> +
> +	if (fault_addr < gpusvm->mm_start ||
> +	=C2=A0=C2=A0=C2=A0 fault_addr > gpusvm->mm_start + gpusvm->mm_range) {
> +		err =3D -EINVAL;
> +		goto err_out;
> +	}
> +
> +	if (!ctx->mmap_locked) {
> +		if (!mmget_not_zero(mm)) {
> +			err =3D -EFAULT;
> +			goto err_out;
> +		}
> +		mmap_write_lock(mm);
> +	}
> +
> +	mmap_assert_write_locked(mm);
> +
> +	notifier =3D drm_gpusvm_notifier_find(gpusvm, fault_addr);
> +	if (!notifier) {
> +		notifier =3D drm_gpusvm_notifier_alloc(gpusvm,
> fault_addr);
> +		if (IS_ERR(notifier)) {
> +			err =3D PTR_ERR(notifier);
> +			goto err_mmunlock;
> +		}
> +		notifier_alloc =3D true;
> +		err =3D mmu_interval_notifier_insert_locked(&notifier-
> >notifier,
> +							=C2=A0 mm,
> notifier->interval.start,
> +							=C2=A0 notifier-
> >interval.end -
> +							=C2=A0 notifier-
> >interval.start,
> +							=C2=A0
> &drm_gpusvm_notifier_ops);
> +		if (err)
> +			goto err_notifier;
> +	}
> +
> +	vas =3D vma_lookup(mm, fault_addr);
> +	if (!vas) {
> +		err =3D -ENOENT;
> +		goto err_notifier_remove;
> +	}
> +
> +	if (!ctx->read_only && !(vas->vm_flags & VM_WRITE)) {
> +		err =3D -EPERM;
> +		goto err_notifier_remove;
> +	}
> +
> +	range =3D drm_gpusvm_range_find(notifier, fault_addr,
> fault_addr + 1);
> +	if (range)
> +		goto out_mmunlock;
> +	/*
> +	 * XXX: Short-circuiting migration based on migrate_vma_*
> current
> +	 * limitations. If/when migrate_vma_* add more support, this
> logic will
> +	 * have to change.
> +	 */
> +	migrate_vram =3D ctx->vram_possible &&
> +		vma_is_anonymous(vas) && !is_vm_hugetlb_page(vas);
> +
> +	chunk_size =3D drm_gpusvm_range_chunk_size(gpusvm, notifier,
> vas,
> +						 fault_addr,
> gpuva_start,
> +						 gpuva_end,
> migrate_vram &&
> +						 !ctx->prefault);
> +	if (chunk_size =3D=3D LONG_MAX) {
> +		err =3D -EINVAL;
> +		goto err_notifier_remove;
> +	}
> +
> +	range =3D drm_gpusvm_range_alloc(gpusvm, notifier, fault_addr,
> chunk_size,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 migrate_vram);
> +	if (IS_ERR(range)) {
> +		err =3D PTR_ERR(range);
> +		goto err_notifier_remove;
> +	}
> +
> +	drm_gpusvm_range_insert(notifier, range);
> +	if (notifier_alloc)
> +		drm_gpusvm_notifier_insert(gpusvm, notifier);
> +
> +	if (ctx->prefault) {
> +		struct drm_gpusvm_ctx __ctx =3D *ctx;
> +
> +		__ctx.mmap_locked =3D true;
> +		err =3D drm_gpusvm_range_get_pages(gpusvm, range,
> &__ctx);
> +		if (err)
> +			goto err_range_remove;
> +	}
> +
> +out_mmunlock:
> +	if (!ctx->mmap_locked) {
> +		mmap_write_unlock(mm);
> +		mmput(mm);
> +	}
> +
> +	return range;
> +
> +err_range_remove:
> +	__drm_gpusvm_range_remove(notifier, range);
> +err_notifier_remove:
> +	if (notifier_alloc)
> +		mmu_interval_notifier_remove(&notifier->notifier);
> +err_notifier:
> +	if (notifier_alloc)
> +		drm_gpusvm_notifier_free(gpusvm, notifier);
> +err_mmunlock:
> +	if (!ctx->mmap_locked) {
> +		mmap_write_unlock(mm);
> +		mmput(mm);
> +	}
> +err_out:
> +	return ERR_PTR(err);
> +}
> +
> +/**
> + * for_each_dma_page - iterate over pages in a DMA regio`n
> + * @i__: the current page index in the iteration
> + * @j__: the current page index, log order, in the iteration
> + * @npages__: the total number of pages in the DMA region
> + * @order__: the order of the pages in the DMA region
> + *
> + * This macro iterates over each page in a DMA region. The DMA
> region
> + * is assumed to be composed of 2^@order__ pages, and the macro will
> + * step through the region one block of 2^@order__ pages at a time.
> + */
> +#define for_each_dma_page(i__, j__, npages__, order__)	\
> +	for ((i__) =3D 0, (j__) =3D 0; (i__) < (npages__);	\
> +	=C2=A0=C2=A0=C2=A0=C2=A0 (j__)++, (i__) +=3D 0x1 << (order__))
> +
> +/**
> + * __drm_gpusvm_range_unmap_pages - Unmap pages associated with a
> GPU SVM range (internal)
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function unmap pages associated with a GPU SVM range.
> Assumes and
> + * asserts correct locking is in place when called.
> + */
> +static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm
> *gpusvm,
> +					=C2=A0=C2=A0 struct drm_gpusvm_range
> *range)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	if (range->pages) {
> +		unsigned long i, j, npages =3D npages_in_range(range-
> >va.start,
> +							=C2=A0=C2=A0=C2=A0=C2=A0 range-
> >va.end);
> +
> +		if (range->flags.has_dma_mapping) {
> +			for_each_dma_page(i, j, npages, range-
> >order)
> +				dma_unmap_page(gpusvm->drm->dev,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 range->dma_addr[j],
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE << range-
> >order,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_BIDIRECTIONAL);
> +		}
> +
> +		range->flags.has_vram_pages =3D false;
> +		range->flags.has_dma_mapping =3D false;
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_free_pages - Free pages associated with a GPU
> SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function free pages associated with a GPU SVM range.
> + */
> +static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
> +					struct drm_gpusvm_range
> *range)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	if (range->pages) {
> +		if (range->flags.kfree_mapping) {
> +			kfree(range->dma_addr);
> +			range->flags.kfree_mapping =3D false;
> +			range->pages =3D NULL;
> +		} else {
> +			kvfree(range->pages);
> +			range->pages =3D NULL;
> +		}
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_remove - Remove GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range to be removed
> + *
> + * This function removes the specified GPU SVM range and also
> removes the parent
> + * GPU SVM notifier if no more ranges remain in the notifier. The
> caller must
> + * hold a lock to protect range and notifier removal.
> + */
> +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range)
> +{
> +	struct drm_gpusvm_notifier *notifier;
> +
> +	notifier =3D drm_gpusvm_notifier_find(gpusvm, range-
> >va.start);
> +	if (WARN_ON_ONCE(!notifier))
> +		return;
> +
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> +	drm_gpusvm_range_free_pages(gpusvm, range);
> +	__drm_gpusvm_range_remove(notifier, range);
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +
> +	drm_gpusvm_range_put(range);
> +
> +	if (RB_EMPTY_ROOT(&notifier->root.rb_root)) {
> +		if (!notifier->flags.removed)
> +			mmu_interval_notifier_remove(&notifier-
> >notifier);
> +		drm_gpusvm_notifier_remove(gpusvm, notifier);
> +		drm_gpusvm_notifier_free(gpusvm, notifier);
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_range_get - Get a reference to GPU SVM range
> + * @range: Pointer to the GPU SVM range
> + *
> + * This function increments the reference count of the specified GPU
> SVM range.
> + *
> + * Returns:
> + * Pointer to the GPU SVM range.
> + */
> +struct drm_gpusvm_range *
> +drm_gpusvm_range_get(struct drm_gpusvm_range *range)
> +{
> +	kref_get(&range->refcount);
> +
> +	return range;
> +}
> +
> +/**
> + * drm_gpusvm_range_destroy - Destroy GPU SVM range
> + * @refcount: Pointer to the reference counter embedded in the GPU
> SVM range
> + *
> + * This function destroys the specified GPU SVM range when its
> reference count
> + * reaches zero. If a custom range-free function is provided, it is
> invoked to
> + * free the range; otherwise, the range is deallocated using
> kfree().
> + */
> +static void drm_gpusvm_range_destroy(struct kref *refcount)
> +{
> +	struct drm_gpusvm_range *range =3D
> +		container_of(refcount, struct drm_gpusvm_range,
> refcount);
> +	struct drm_gpusvm *gpusvm =3D range->gpusvm;
> +
> +	if (gpusvm->ops->range_free)
> +		gpusvm->ops->range_free(range);
> +	else
> +		kfree(range);
> +}
> +
> +/**
> + * drm_gpusvm_range_put - Put a reference to GPU SVM range
> + * @range: Pointer to the GPU SVM range
> + *
> + * This function decrements the reference count of the specified GPU
> SVM range
> + * and frees it when the count reaches zero.
> + */
> +void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
> +{
> +	kref_put(&range->refcount, drm_gpusvm_range_destroy);
> +}
> +
> +/**
> + * drm_gpusvm_range_pages_valid - GPU SVM range pages valid
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function determines if a GPU SVM range pages are valid.
> Expected be
> + * called holding gpusvm->notifier_lock and as the last step before
> commiting a
> + * GPU binding.
> + *
> + * Returns:
> + * True if GPU SVM range has valid pages, False otherwise
> + */
> +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> +				=C2=A0 struct drm_gpusvm_range *range)
> +{
> +	lockdep_assert_held(&gpusvm->notifier_lock);
> +
> +	return range->flags.has_vram_pages || range-
> >flags.has_dma_mapping;
> +}
> +
> +/**
> + * drm_gpusvm_range_pages_valid_unlocked - GPU SVM range pages valid
> unlocked
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * This function determines if a GPU SVM range pages are valid.
> Expected be
> + * called without holding gpusvm->notifier_lock.
> + *
> + * Returns:
> + * True if GPU SVM range has valid pages, False otherwise
> + */
> +static bool
> +drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range
> *range)
> +{
> +	bool pages_valid;
> +
> +	if (!range->pages)
> +		return false;
> +
> +	drm_gpusvm_notifier_lock(gpusvm);
> +	pages_valid =3D drm_gpusvm_range_pages_valid(gpusvm, range);
> +	if (!pages_valid && range->flags.kfree_mapping) {
> +		kfree(range->dma_addr);
> +		range->flags.kfree_mapping =3D false;
> +		range->pages =3D NULL;
> +	}
> +	drm_gpusvm_notifier_unlock(gpusvm);
> +
> +	return pages_valid;
> +}
> +
> +/**
> + * drm_gpusvm_range_get_pages - Get pages for a GPU SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function gets pages for a GPU SVM range and ensures they are
> mapped for
> + * DMA access.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx=
)
> +{
> +	struct mmu_interval_notifier *notifier =3D &range->notifier-
> >notifier;
> +	struct hmm_range hmm_range =3D {
> +		.default_flags =3D HMM_PFN_REQ_FAULT | (ctx->read_only
> ? 0 :
> +			HMM_PFN_REQ_WRITE),
> +		.notifier =3D notifier,
> +		.start =3D range->va.start,
> +		.end =3D range->va.end,
> +		.dev_private_owner =3D gpusvm-
> >device_private_page_owner,
> +	};
> +	struct mm_struct *mm =3D gpusvm->mm;
> +	unsigned long timeout =3D
> +		jiffies +
> msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long i, j;
> +	unsigned long npages =3D npages_in_range(range->va.start,
> range->va.end);
> +	unsigned int order =3D 0;
> +	unsigned long *pfns;
> +	struct page **pages;
> +	int err =3D 0;
> +	bool vram_pages =3D !!range->flags.migrate_vram;
> +	bool alloc_pfns =3D false, kfree_mapping;
> +
> +retry:
> +	kfree_mapping =3D false;
> +	hmm_range.notifier_seq =3D mmu_interval_read_begin(notifier);
> +	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
> +		return 0;
> +
> +	if (range->notifier_seq =3D=3D hmm_range.notifier_seq && range-
> >pages) {
> +		if (ctx->prefault)
> +			return 0;
> +
> +		pfns =3D (unsigned long *)range->pages;
> +		pages =3D range->pages;
> +		goto map_pages;
> +	}
> +
> +	if (!range->pages) {
> +		pfns =3D kvmalloc_array(npages, sizeof(*pfns),
> GFP_KERNEL);
> +		if (!pfns)
> +			return -ENOMEM;
> +		alloc_pfns =3D true;
> +	} else {
> +		pfns =3D (unsigned long *)range->pages;
> +	}
> +
> +	if (!ctx->mmap_locked) {
> +		if (!mmget_not_zero(mm)) {
> +			err =3D -EFAULT;
> +			goto err_out;
> +		}
> +	}
> +
> +	hmm_range.hmm_pfns =3D pfns;
> +	while (true) {
> +		/* Must be checked after mmu_interval_read_begin */
> +		if (range->flags.unmapped) {
> +			err =3D -EFAULT;
> +			break;
> +		}
> +
> +		if (!ctx->mmap_locked) {
> +			/*
> +			 * XXX: HMM locking document indicates only
> a read-lock
> +			 * is required but there apears to be a
> window between
> +			 * the MMU_NOTIFY_MIGRATE event triggered in
> a CPU fault
> +			 * via migrate_vma_setup and the pages
> actually moving
> +			 * in migrate_vma_finalize in which this
> code can grab
> +			 * garbage pages. Grabbing the write-lock if
> the range
> +			 * is attached to vram appears to protect
> against this
> +			 * race.
> +			 */
> +			if (vram_pages)
> +				mmap_write_lock(mm);
> +			else
> +				mmap_read_lock(mm);
> +		}
> +		err =3D hmm_range_fault(&hmm_range);
> +		if (!ctx->mmap_locked) {
> +			if (vram_pages)
> +				mmap_write_unlock(mm);
> +			else
> +				mmap_read_unlock(mm);
> +		}
> +
> +		if (err =3D=3D -EBUSY) {
> +			if (time_after(jiffies, timeout))
> +				break;
> +
> +			hmm_range.notifier_seq =3D
> mmu_interval_read_begin(notifier);
> +			continue;
> +		}
> +		break;
> +	}
> +	if (!ctx->mmap_locked)
> +		mmput(mm);
> +	if (err)
> +		goto err_free;
> +
> +	pages =3D (struct page **)pfns;
> +
> +	if (ctx->prefault) {
> +		range->pages =3D pages;
> +		goto set_seqno;
> +	}
> +
> +map_pages:
> +	if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
> +		WARN_ON_ONCE(!range->vram_allocation);
> +
> +		for (i =3D 0; i < npages; ++i) {
> +			pages[i] =3D hmm_pfn_to_page(pfns[i]);
> +
> +			if
> (WARN_ON_ONCE(!is_device_private_page(pages[i]))) {
> +				err =3D -EOPNOTSUPP;
> +				goto err_free;
> +			}
> +		}
> +
> +		/* Do not race with notifier unmapping pages */
> +		drm_gpusvm_notifier_lock(gpusvm);
> +		range->flags.has_vram_pages =3D true;
> +		range->pages =3D pages;
> +		if (mmu_interval_read_retry(notifier,
> hmm_range.notifier_seq)) {
> +			err =3D -EAGAIN;
> +			__drm_gpusvm_range_unmap_pages(gpusvm,
> range);
> +		}
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +	} else {
> +		dma_addr_t *dma_addr =3D (dma_addr_t *)pfns;
> +
> +		for_each_dma_page(i, j, npages, order) {
> +			if (WARN_ON_ONCE(i && order !=3D
> +				=09
> hmm_pfn_to_map_order(pfns[i]))) {
> +				err =3D -EOPNOTSUPP;
> +				npages =3D i;
> +				goto err_unmap;
> +			}
> +			order =3D hmm_pfn_to_map_order(pfns[i]);
> +
> +			pages[j] =3D hmm_pfn_to_page(pfns[i]);
> +			if
> (WARN_ON_ONCE(is_zone_device_page(pages[j]))) {
> +				err =3D -EOPNOTSUPP;
> +				npages =3D i;
> +				goto err_unmap;
> +			}
> +
> +			set_page_dirty_lock(pages[j]);
> +			mark_page_accessed(pages[j]);
> +
> +			dma_addr[j] =3D dma_map_page(gpusvm->drm->dev,
> +						=C2=A0=C2=A0 pages[j], 0,
> +						=C2=A0=C2=A0 PAGE_SIZE <<
> order,
> +						=C2=A0=C2=A0
> DMA_BIDIRECTIONAL);
> +			if (dma_mapping_error(gpusvm->drm->dev,
> dma_addr[j])) {
> +				err =3D -EFAULT;
> +				npages =3D i;
> +				goto err_unmap;
> +			}
> +		}
> +
> +		/* Huge pages, reduce memory footprint */
> +		if (order) {
> +			dma_addr =3D kmalloc_array(j,
> sizeof(*dma_addr),
> +						 GFP_KERNEL);
> +			if (dma_addr) {
> +				for (i =3D 0; i < j; ++i)
> +					dma_addr[i] =3D
> (dma_addr_t)pfns[i];
> +				kvfree(pfns);
> +				kfree_mapping =3D true;
> +			} else {
> +				dma_addr =3D (dma_addr_t *)pfns;
> +			}
> +		}
> +
> +		/* Do not race with notifier unmapping pages */
> +		drm_gpusvm_notifier_lock(gpusvm);
> +		range->order =3D order;
> +		range->flags.kfree_mapping =3D kfree_mapping;
> +		range->flags.has_dma_mapping =3D true;
> +		range->dma_addr =3D dma_addr;
> +		range->vram_allocation =3D NULL;
> +		if (mmu_interval_read_retry(notifier,
> hmm_range.notifier_seq)) {
> +			err =3D -EAGAIN;
> +			__drm_gpusvm_range_unmap_pages(gpusvm,
> range);
> +		}
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +	}
> +
> +	if (err =3D=3D -EAGAIN)
> +		goto retry;
> +set_seqno:
> +	range->notifier_seq =3D hmm_range.notifier_seq;
> +
> +	return 0;
> +
> +err_unmap:
> +	for_each_dma_page(i, j, npages, order)
> +		dma_unmap_page(gpusvm->drm->dev,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (dma_addr_t)pfns[j],
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_SIZE << order,
> DMA_BIDIRECTIONAL);
> +err_free:
> +	if (alloc_pfns)
> +		kvfree(pfns);
> +err_out:
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU
> SVM range
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function unmaps pages associated with a GPU SVM range. If
> @in_notifier
> + * is set, it is assumed that gpusvm->notifier_lock is held in write
> mode; if it
> + * is clear, it acquires gpusvm->notifier_lock in read mode. Must be
> called on
> + * each GPU SVM range attached to notifier in gpusvm->ops-
> >invalidate for IOMMU
> + * security model.
> + */
> +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> +				=C2=A0 struct drm_gpusvm_range *range,
> +				=C2=A0 const struct drm_gpusvm_ctx *ctx)
> +{
> +	if (ctx->in_notifier)
> +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> +	else
> +		drm_gpusvm_notifier_lock(gpusvm);
> +
> +	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> +
> +	if (!ctx->in_notifier)
> +		drm_gpusvm_notifier_unlock(gpusvm);
> +}
> +
> +/**
> + * drm_gpusvm_migration_put_page - Put a migration page
> + * @page: Pointer to the page to put
> + *
> + * This function unlocks and puts a page.
> + */
> +static void drm_gpusvm_migration_put_page(struct page *page)
> +{
> +	unlock_page(page);
> +	put_page(page);
> +}
> +
> +/**
> + * drm_gpusvm_migration_put_pages - Put migration pages
> + * @npages: Number of pages
> + * @migrate_pfn: Array of migrate page frame numbers
> + *
> + * This function puts an array of pages.
> + */
> +static void drm_gpusvm_migration_put_pages(unsigned long npages,
> +					=C2=A0=C2=A0 unsigned long
> *migrate_pfn)
> +{
> +	unsigned long i;
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		if (!migrate_pfn[i])
> +			continue;
> +
> +		drm_gpusvm_migration_put_page(migrate_pfn_to_page(mi
> grate_pfn[i]));
> +		migrate_pfn[i] =3D 0;
> +	}
> +}
> +
> +/**
> + * drm_gpusvm_get_vram_page - Get a reference to a VRAM page
> + * @page: Pointer to the page
> + * @zdd: Pointer to the GPU SVM zone device data
> + *
> + * This function associates the given page with the specified GPU
> SVM zone
> + * device data and initializes it for zone device usage.
> + */
> +static void drm_gpusvm_get_vram_page(struct page *page,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_zdd *zdd)
> +{
> +	page->zone_device_data =3D drm_gpusvm_zdd_get(zdd);
> +	zone_device_page_init(page);
> +}
> +
> +/**
> + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM
> migration
> + * @dev: The device for which the pages are being mapped
> + * @dma_addr: Array to store DMA addresses corresponding to mapped
> pages
> + * @migrate_pfn: Array of migrate page frame numbers to map
> + * @npages: Number of pages to map
> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> + *
> + * This function maps pages of memory for migration usage in GPU
> SVM. It
> + * iterates over each page frame number provided in @migrate_pfn,
> maps the
> + * corresponding page, and stores the DMA address in the provided
> @dma_addr
> + * array.
> + *
> + * Return: 0 on success, -EFAULT if an error occurs during mapping.
> + */
> +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> +					dma_addr_t *dma_addr,
> +					long unsigned int
> *migrate_pfn,
> +					unsigned long npages,
> +					enum dma_data_direction dir)
> +{
> +	unsigned long i;
> +
> +	for (i =3D 0; i < npages; ++i) {
> +		struct page *page =3D
> migrate_pfn_to_page(migrate_pfn[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> +			return -EFAULT;
> +
> +		dma_addr[i] =3D dma_map_page(dev, page, 0, PAGE_SIZE,
> dir);
> +		if (dma_mapping_error(dev, dma_addr[i]))
> +			return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
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
> + * drm_gpusvm_migrate_to_vram - Migrate GPU SVM range to VRAM
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 failure of this function.
> + * @vram_allocation: Driver-private pointer to the VRAM allocation.
> The caller
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should hold a reference to the VRAM=
 allocation,
> which
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 should be dropped via ops->vram_all=
ocation or
> upon the
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 failure of this function.
> + * @ctx: GPU SVM context
> + *
> + * This function migrates the specified GPU SVM range to VRAM. It
> performs the
> + * necessary setup and invokes the driver-specific operations for
> migration to
> + * VRAM. Upon successful return, @vram_allocation can safely
> reference @range
> + * until ops->vram_release is called which only upon successful
> return.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *vram_allocation,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx=
)
> +{
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
> +	if (!range->flags.migrate_vram)
> +		return -EINVAL;
> +
> +	if (!gpusvm->ops->populate_vram_pfn || !gpusvm->ops-
> >copy_to_vram ||
> +	=C2=A0=C2=A0=C2=A0 !gpusvm->ops->copy_to_sram)
> +		return -EOPNOTSUPP;
> +
> +	if (!ctx->mmap_locked) {
> +		if (!mmget_not_zero(mm)) {
> +			err =3D -EFAULT;
> +			goto err_out;
> +		}
> +		mmap_write_lock(mm);
> +	}
> +
> +	mmap_assert_locked(mm);
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
> +	zdd =3D drm_gpusvm_zdd_alloc(range);
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
> +	err =3D gpusvm->ops->populate_vram_pfn(gpusvm,
> vram_allocation, npages,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 migrate.dst);
> +	if (err)
> +		goto err_finalize;
> +
> +	err =3D drm_gpusvm_migrate_map_pages(gpusvm->drm->dev,
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
> +		drm_gpusvm_get_vram_page(page, zdd);
> +	}
> +
> +	err =3D gpusvm->ops->copy_to_vram(gpusvm, pages, dma_addr,
> npages);
> +	if (err)
> +		goto err_finalize;
> +
> +	/* Upon success bind vram allocation to range and zdd */
> +	range->vram_allocation =3D vram_allocation;
> +	WRITE_ONCE(zdd->vram_allocation, vram_allocation);	/*
> Owns ref */
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr,
> npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_TO_DEVICE);
> +err_free:
> +	if (zdd)
> +		drm_gpusvm_zdd_put(zdd);
> +	kvfree(buf);
> +err_mmunlock:
> +	if (!ctx->mmap_locked) {
> +		mmap_write_unlock(mm);
> +		mmput(mm);
> +	}
> +err_out:
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_migrate_populate_sram_pfn - Populate SRAM PFNs for a
> VM area
> + * @vas: Pointer to the VM area structure, can be NULL
> + * @npages: Number of pages to populate
> + * @src_mpfn: Source array of migrate PFNs
> + * @mpfn: Array of migrate PFNs to populate
> + * @addr: Start address for PFN allocation
> + *
> + * This function populates the SRAM migrate page frame numbers
> (PFNs) for the
> + * specified VM area structure. It allocates and locks pages in the
> VM area for
> + * SRAM usage. If vas is non-NULL use alloc_page_vma for allocation,
> if NULL use
> + * alloc_page for allocation.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int drm_gpusvm_migrate_populate_sram_pfn(struct
> vm_area_struct *vas,
> +						unsigned long
> npages,
> +						unsigned long
> *src_mpfn,
> +						unsigned long *mpfn,
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
> +		mpfn[i] =3D migrate_pfn(page_to_pfn(page));
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpusvm_evict_to_sram - Evict GPU SVM range to SRAM
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + *
> + * Similar to __drm_gpusvm_migrate_to_sram but does not require mmap
> lock and
> + * migration done via migrate_device_* functions. Fallback path as
> it is
> + * preferred to issue migrations with mmap lock.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int drm_gpusvm_evict_to_sram(struct drm_gpusvm *gpusvm,
> +				=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range)
> +{
> +	unsigned long npages;
> +	struct page **pages;
> +	unsigned long *src, *dst;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int i, err =3D 0;
> +
> +	npages =3D npages_in_range(range->va.start, range->va.end);
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
> +	err =3D gpusvm->ops->populate_vram_pfn(gpusvm, range-
> >vram_allocation,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 npages, src);
> +	if (err)
> +		goto err_free;
> +
> +	err =3D migrate_device_vma_range(gpusvm->mm,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpusvm-
> >device_private_page_owner, src,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 npages, range->va.start);
> +	if (err)
> +		goto err_free;
> +
> +	err =3D drm_gpusvm_migrate_populate_sram_pfn(NULL, npages,
> src, dst, 0);
> +	if (err)
> +		goto err_finalize;
> +
> +	err =3D drm_gpusvm_migrate_map_pages(gpusvm->drm->dev,
> dma_addr,
> +					=C2=A0=C2=A0 dst, npages,
> DMA_BIDIRECTIONAL);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i =3D 0; i < npages; ++i)
> +		pages[i] =3D migrate_pfn_to_page(src[i]);
> +
> +	err =3D gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr,
> npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, dst);
> +	migrate_device_pages(src, dst, npages);
> +	migrate_device_finalize(src, dst, npages);
> +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr,
> npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_BIDIRECTIONAL);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +
> +	return err;
> +}
> +
> +/**
> + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range to SRAM
> (internal)
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @vas: Pointer to the VM area structure
> + * @page: Pointer to the page for fault handling (can be NULL)
> + * @start: Start address of the migration range
> + * @end: End address of the migration range
> + *
> + * This internal function performs the migration of the specified
> GPU SVM range
> + * to SRAM. It sets up the migration, populates + dma maps SRAM
> PFNs, and
> + * invokes the driver-specific operations for migration to SRAM.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> +					struct vm_area_struct *vas,
> +					struct page *page,
> +					u64 start, u64 end)
> +{
> +	struct migrate_vma migrate =3D {
> +		.vma		=3D vas,
> +		.pgmap_owner	=3D gpusvm->device_private_page_owner,
> +		.flags		=3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> +		.fault_page	=3D page,
> +	};
> +	unsigned long npages;
> +	struct page **pages;
> +	dma_addr_t *dma_addr;
> +	void *buf;
> +	int i, err =3D 0;
> +
> +	mmap_assert_locked(gpusvm->mm);
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
> +	err =3D drm_gpusvm_migrate_populate_sram_pfn(vas, npages,
> +						=C2=A0=C2=A0 migrate.src,
> migrate.dst,
> +						=C2=A0=C2=A0 start);
> +	if (err)
> +		goto err_finalize;
> +
> +	err =3D drm_gpusvm_migrate_map_pages(gpusvm->drm->dev,
> dma_addr,
> +					=C2=A0=C2=A0 migrate.dst, npages,
> +					=C2=A0=C2=A0 DMA_BIDIRECTIONAL);
> +	if (err)
> +		goto err_finalize;
> +
> +	for (i =3D 0; i < npages; ++i)
> +		pages[i] =3D migrate_pfn_to_page(migrate.src[i]);

See comments below which pages we actually want to migrate.


> +
> +	err =3D gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr,
> npages);
> +	if (err)
> +		goto err_finalize;
> +
> +err_finalize:
> +	if (err)
> +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> +	migrate_vma_pages(&migrate);
> +	migrate_vma_finalize(&migrate);
> +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr,
> npages,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_BIDIRECTIONAL);
> +err_free:
> +	kvfree(buf);
> +err_out:
> +	mmap_assert_locked(gpusvm->mm);
> +
> +	return err;
> +}
> +
> +/**
> + * drm_gpusvm_migrate_to_sram - Migrate (evict) GPU SVM range to
> SRAM
> + * @gpusvm: Pointer to the GPU SVM structure
> + * @range: Pointer to the GPU SVM range structure
> + * @ctx: GPU SVM context
> + *
> + * This function initiates the migration of the specified GPU SVM
> range to
> + * SRAM. It performs necessary checks and invokes the internal
> migration
> + * function for actual migration.
> + *
> + * Returns:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_range *range,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpusvm_ctx *ctx=
)
> +{
> +	u64 start =3D range->va.start, end =3D range->va.end;
> +	struct mm_struct *mm =3D gpusvm->mm;
> +	struct vm_area_struct *vas;
> +	int err;
> +	bool retry =3D false;
> +
> +	if (!ctx->mmap_locked) {
> +		if (!mmget_not_zero(mm)) {
> +			err =3D -EFAULT;
> +			goto err_out;
> +		}
> +		if (ctx->trylock_mmap) {
> +			if (!mmap_read_trylock(mm))=C2=A0 {
> +				err =3D
> drm_gpusvm_evict_to_sram(gpusvm, range);
> +				goto err_mmput;
> +			}
> +		} else {
> +			mmap_read_lock(mm);
> +		}
> +	}
> +
> +	mmap_assert_locked(mm);
> +
> +	/*
> +	 * Loop required to find all VMA area structs for the corner
> case when
> +	 * VRAM backing has been partially unmapped from MM's
> address space.
> +	 */
> +again:
> +	vas =3D find_vma(mm, start);
> +	if (!vas) {
> +		if (!retry)
> +			err =3D -ENOENT;
> +		goto err_mmunlock;
> +	}
> +
> +	if (end <=3D vas->vm_start || start >=3D vas->vm_end) {
> +		if (!retry)
> +			err =3D -EINVAL;
> +		goto err_mmunlock;
> +	}
> +
> +	err =3D __drm_gpusvm_migrate_to_sram(gpusvm, vas, NULL, start,
> end);

This function is typically called from the vm side to get a clean mm as
a last resort after get_pages() fail. As such should we have it evict
*everything*, even foreign device memory, and mismatching local device
pages. If so, we could use hmm_range_fault() with a NULL page owner +
faulting to do that.

> +	if (err)
> +		goto err_mmunlock;
> +
> +	if (vas->vm_end < end) {
> +		retry =3D true;
> +		start =3D vas->vm_end;
> +		goto again;
> +	}
> +
> +	if (!ctx->mmap_locked) {
> +		mmap_read_unlock(mm);
> +		/*
> +		 * Using mmput_async as this function can be called
> while
> +		 * holding a dma-resv lock, and a final put can grab
> the mmap
> +		 * lock, causing a lock inversion.
> +		 */
> +		mmput_async(mm);
> +	}
> +
> +	return 0;
> +
> +err_mmunlock:
> +	if (!ctx->mmap_locked)
> +		mmap_read_unlock(mm);
> +err_mmput:
> +	if (!ctx->mmap_locked)
> +		mmput_async(mm);
> +err_out:
> +	return err;
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
> +
> +	err =3D __drm_gpusvm_migrate_to_sram(zdd->range->gpusvm,
> +					=C2=A0=C2=A0 vmf->vma, vmf->page,
> +					=C2=A0=C2=A0 zdd->range->va.start,
> +					=C2=A0=C2=A0 zdd->range->va.end);

When called from here, since this is a pagemap op, we should ensure we
only migrate our own pagemap to RAM?

/Thanks,
Thomas

