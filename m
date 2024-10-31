Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C189B82F4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 19:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE79510E90E;
	Thu, 31 Oct 2024 18:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mndTklJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC5910E90E;
 Thu, 31 Oct 2024 18:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730401141; x=1761937141;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tVhwWEhjy5YqLW/6nJ2Ce6acQUWxAHRAhwTD0rju2Zg=;
 b=mndTklJfiEOOTD7Y2DOjOSANuegwDdMYjjLOSmSLBVgy7QxnJU7uwjYl
 QDk/S/i5GNHBtFcm1uS4Z1yIM0HpWqhvo8xLotv3C1VUJhW/z14mxI+Bw
 jWEMsDFtiL8UoKZ9HoFLJZ7r9Xu3vTG2Yo+knO5buldBof7GK1mutnO7b
 aOo4jhoBNBx2hyGd/ur8OrqK3HqEtwTPzDmr6QsDfVM5pOw+Tv8N4g0v3
 gw8dNCR1R6b+9VPAgYUNDvVu3moKdNJKr9JoVwIFlYhFcHsDslQIUjSdO
 8ayJ6fzfGrEstEgokUfgvFzQZrukxPXRNUkjHuW0rtD8BlGDO9VN52Yz3 Q==;
X-CSE-ConnectionGUID: deAZE/h9QUGQA+IBt8ndSQ==
X-CSE-MsgGUID: vIHf/tGWRGaqjD1FrqgWBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47621559"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47621559"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:59:00 -0700
X-CSE-ConnectionGUID: 3arNYakERCujfwJuE3KGGA==
X-CSE-MsgGUID: tW9ylDzaQMqdNYUPIIVPfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="83137739"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 11:58:57 -0700
Message-ID: <0d19a2b45342ba997a53055911add7c0a4d1b5ac.camel@linux.intel.com>
Subject: Re: [PATCH v2 05/29] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Thu, 31 Oct 2024 19:58:45 +0100
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
> This is largely inspired by GPUVM.
>=20
> v2:
> =C2=A0- Take order into account in check pages
> =C2=A0- Clear range->pages in get pages error
> =C2=A0- Drop setting dirty or accessed bit in get pages (Vetter)
> =C2=A0- Remove mmap assert for cpu faults
> =C2=A0- Drop mmap write lock abuse (Vetter, Christian)
> =C2=A0- Decouple zdd from range (Vetter, Oak)
> =C2=A0- Add drm_gpusvm_range_evict, make it work with coherent pages
> =C2=A0- Export drm_gpusvm_evict_to_sram, only use in BO evict path
> (Vetter)
> =C2=A0- mmget/put in drm_gpusvm_evict_to_sram
> =C2=A0- Drop range->vram_alloation variable
> =C2=A0- Don't return in drm_gpusvm_evict_to_sram until all pages detached
> =C2=A0- Don't warn on mixing sram and device pages
> =C2=A0- Update kernel doc
> =C2=A0- Add coherent page support to get pages
> =C2=A0- Use DMA_FROM_DEVICE rather than DMA_BIDIRECTIONAL
> =C2=A0- Add struct drm_gpusvm_vram and ops (Thomas)
> =C2=A0- Update the range's seqno if the range is valid (Thomas)
> =C2=A0- Remove the is_unmapped check before hmm_range_fault (Thomas)
> =C2=A0- Use drm_pagemap (Thomas)
> =C2=A0- Drop kfree_mapping (Thomas)
> =C2=A0- dma mapp pages under notifier lock (Thomas)
> =C2=A0- Remove ctx.prefault
> =C2=A0- Remove ctx.mmap_locked
> =C2=A0- Add ctx.check_pages
> =C2=A0- s/vram/devmem (Thomas)
>=20
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/xe/drm_gpusvm.c | 2074
> +++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/drm_gpusvm.h |=C2=A0 447 +++++++
> =C2=A03 files changed, 2523 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.c
> =C2=A0create mode 100644 drivers/gpu/drm/xe/drm_gpusvm.h
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile
> b/drivers/gpu/drm/xe/Makefile
> index da80c29aa363..8d991d4a92a5 100644
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
> index 000000000000..1ff104d2b42c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/drm_gpusvm.c
> @@ -0,0 +1,2074 @@
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
> +#include "drm/drm_print.h"
> +#include "drm_gpusvm.h"
> +#include "drm_pagemap.h"
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
> + * - Operations: Define the interface for driver-specific GPU SVM
> operations
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 such as range allocation, notifier allocation, and
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 invalidations.
> + * - Device Memory Allocations: Embedded structure containing enough
> information
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for GPU SVM to migrate to / from
> device memory.
> + * - Device Memory Operations: Define the interface for driver-
> specific device
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 memory operations release memory,
> populate pfns,
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 and copy to / from device memory.
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
> + *			=C2=A0=C2=A0=C2=A0=C2=A0 device memory, and create GPU bindings.
> + * - Garbage collector: Used to destroy GPU bindings for ranges.

Perhaps "clean up GPU bindings for ranges" to differentiate from
unmapping GPU bindings for ranges which needs to be done in the
notifier callback?

> Ranges are
> + *			expected to be added to the garbage
> collector upon
> + *			MMU_NOTIFY_UNMAP event.
> + */
> +

- Notifier callback, to unmap GPU bindings for ranges.

> +/**
> + * DOC: Locking
> + *
> + * GPU SVM handles locking for core MM interactions, i.e., it
> locks/unlocks the
> + * mmap lock as needed.
> + *
> + * GPU SVM introduces a global notifier lock, which safeguards the
> notifier's
> + * range RB tree and list, as well as the range's DMA mappings and
> sequence
> + * number. GPU SVM manages all necessary locking and unlocking
> operations,

How difficult would it be to make this per-notifier?
One of the design comments we got from Jason was to prioritize avoiding
core slowdowns and any fault processing might block an unrelated
notifier during dma mapping and page-table commit.
I think this should at least be considered as a follow-up.

> + * except for the recheck of the range's sequence number
> + * (mmu_interval_read_retry) when the driver is committing GPU
> bindings. This

Perhaps add a discussion on valid pages rather than valid sequence
number, since the sequence number might be bumped even if pages stay
valid for the range, as the sequence number spans the whole notifier.

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
> + * instance, using an ordered work queue.

I don't think not we should encourage the use of ordered workqueues to
protect data / state? Locks should really be the preferred mechanism?

>  This lock is denoted as
> + * 'driver_svm_lock' in code examples. Finer grained driver side
> locking should
> + * also be possible for concurrent GPU fault processing within a
> single GPU SVM.

GPUVM (or rather the gem part of GPUVM that resides in drm_gem.h)
allows for the driver to register a lock map which, if present, is used
in the code to assert locks are correctly taken.

In the xe example, if we're using the vm lock to protect, then we could
register that and thoroughly annotate the gpusvm code with lockdep
asserts. That will probably help making the code a lot easier to
maintain moving forward.

> + */
> +GPUVM (or rGPUVM (or rather the gem part of GPUVM that resides in
> drm_gem.h) allows for the driver to register a lock map which, if
> present, is used in the code to assert locks are correctly taken.

> In the xe example, if we're using the vm lock to protect, then we
> could register that and thoroughly annotate the gpusvm code with
> lockdep asserts. That will probably help making the code a lot easier
> to maintain moving forward.GPUVM (or rather the gem part of GPUVM
> that resides in drm_gem.h) allows for the driver to register a lock
> map which, if present, is used in the code to assert locks are
> correctly taken.

> In the xe example, if we're using the vm lock to protect, then we
> could register that and thoroughly annotate the gpusvm code with
> lockdep asserts. That will probably help making the code a lot easier
> to maintain moving forward.ather the gem part of GPUVM that resides
> in drm_gem.h) allows for the driver to register a lock map which, if
> present, is used in the code to assert locks are correctly taken.

In the xe example, if we're using the vm lock to protect, then we could
register that and thoroughly annotate the gpusvm code with lockdep
asserts. That will probably help making the code a lot easier to
maintain moving forward.
> +/**
> + * DOC: Migrataion

s/Migrataion/Migration/

> + *
> + * The migration support is quite simple, allowing migration between
> RAM and
> + * device memory at the range granularity. For example, GPU SVM
> currently does not
> + * support mixing RAM and device memory pages within a range. This
> means that upon GPU
> + * fault, the entire range can be migrated to device memory, and
> upon CPU fault, the
> + * entire range is migrated to RAM. Mixed RAM and device memory
> storage within a range
> + * could be added in the future if required.
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
> + * backing store for the range is in device memory, a subset of the
> backing store has
> + * references. One option would be to split the range and device
> memory backing store,
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
> + * has device memory as its backing, the driver is also expected to
> migrate any
> + * remaining pages back to RAM.
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
> + * policies, optimized invalidations, fined grained driver locking,
> or other
> + * potentially required driver locking (e.g., DMA-resv locks).
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
> + *			devmem =3D driver_alloc_devmem();
> + *			err =3D drm_gpusvm_migrate_to_devmem(gpusvm,
> range,
> + *							=C2=A0=C2=A0
> devmem_allocation,
> + *							=C2=A0=C2=A0 &ctx);
> + *			if (err)	// CPU mappings may have
> changed
> + *				goto retry;
> + *		}
> + *
> + *		err =3D drm_gpusvm_range_get_pages(gpusvm, range,
> &ctx);
> + *		if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err =3D=3D -
> EPERM) {	// CPU mappings changed
> + *			if (err =3D=3D -EOPNOTSUPP)
> + *				drm_gpusvm_range_evict(gpusvm,
> range);
> + *			goto retry;
> + *		} else if (err) {
> + *			goto unlock;
> + *		}
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
> + *		assert_driver_svm_locked(gpusvm);
> + *
> + *		// Partial unmap, migrate any remaining device
> memory pages back to RAM
> + *		if (range->flags.partial_unmap)
> + *			drm_gpusvm_range_evict(gpusvm, range);
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

Did you look at removing these instantiations after the RFC comments,
and instead embed a struct interval_tree_node?

Perhaps the notifier tree could use a maple tree?

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

Could use a static function?

> +
> +/**
> + * struct drm_gpusvm_zdd - GPU SVM zone device data
> + *
> + * @refcount: Reference count for the zdd
> + * @destroy_work: Work structure for asynchronous zdd destruction
> + * @devmem_allocation: device memory allocation
> + * @device_private_page_owner: Device private pages owner
> + *
> + * This structure serves as a generic wrapper installed in
> + * page->zone_device_data. It provides infrastructure for looking up
> a device
> + * memory allocation upon CPU page fault and asynchronously
> releasing device
> + * memory once the CPU has no page references. Asynchronous release
> is useful
> + * because CPU page references can be dropped in IRQ contexts, while
> releasing
> + * device memory likely requires sleeping locks.
> + */
> +struct drm_gpusvm_zdd {
> +	struct kref refcount;
> +	struct work_struct destroy_work;
> +	struct drm_gpusvm_devmem *devmem_allocation;
> +	void *device_private_page_owner;
> +};

I think the zdd and migration helpers should be moved to drm_pagemap.c
We should consider looking at that once patches for drm_pagemap
functionality are posted.


TBC
/Thomas

