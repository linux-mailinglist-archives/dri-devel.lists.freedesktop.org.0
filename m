Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE38E9D2556
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 13:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE7410E24D;
	Tue, 19 Nov 2024 12:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWB/OCig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE35710E24D;
 Tue, 19 Nov 2024 12:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732018413; x=1763554413;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iDxSnOYsKcOd2cS+EUEoDDAZConEVLlScsukXH4wbjk=;
 b=WWB/OCigdBRtMb2C8ICHFUSywl9EYp4Wjt/DDGfFLicFUZQlZJV8/rQw
 MzKmF62pbesqvmmr1zWzzdZHCyrLU+9+W4cmKoA4ynNAE+pWJClU9SwAh
 fHBlcSsvAJ218LfFvz46z10NHW0LyfRxklDr8dxpWr5lVqnzTbZY5JqEJ
 mppIxF2PEZUFAo5k+bq3lJJqa9sN1gzgrxmVVtrqA1u0Eyn+aVEjJy/pv
 wQd+cvFyKMtWyoY2+SDJ+V9BA/5eDDly8HlrhmsM7bsL8MTmKrfmKnFx+
 Svvz3Miyw8XrdQRjxKu1YL92g7hs7cJ8ozoN6Z5l67aUecquSTBEMePnO Q==;
X-CSE-ConnectionGUID: USL4yZWQQ36XoxS9P3NGNA==
X-CSE-MsgGUID: rZ6PjAOMRACuq0+PlBFFaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="19620729"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="19620729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:13:32 -0800
X-CSE-ConnectionGUID: WAVreZK9TmqRpcrNBnHY5g==
X-CSE-MsgGUID: pcDxwLGWT1a0JNt9fqQnjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89112076"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:13:29 -0800
Message-ID: <4b221f9cfb35637e96cddfd8fee6cee45c98bd4d.camel@linux.intel.com>
Subject: Re: [PATCH v2 07/29] drm/xe: Add SVM init / close / fini to
 faulting VMs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 19 Nov 2024 13:13:26 +0100
In-Reply-To: <20241016032518.539495-8-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-8-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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
> Add SVM init / close / fini to faulting VMs. Minimual implementation.
>=20
> v2:
> =C2=A0- Add close function
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1=
 +
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 46
> ++++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 ++++=
+++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12=
 +++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 7 +++++
> =C2=A05 files changed, 81 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_svm.c
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_svm.h
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile
> b/drivers/gpu/drm/xe/Makefile
> index 8d991d4a92a5..c3e85bcfd4d1 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -96,6 +96,7 @@ xe-y +=3D drm_gpusvm.o \
> =C2=A0	xe_sa.o \
> =C2=A0	xe_sched_job.o \
> =C2=A0	xe_step.o \
> +	xe_svm.o \
> =C2=A0	xe_sync.o \
> =C2=A0	xe_tile.o \
> =C2=A0	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> new file mode 100644
> index 000000000000..57b740367843
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + */
> +
> +#include "drm_gpusvm.h"
> +
> +#include "xe_svm.h"
> +#include "xe_vm.h"
> +#include "xe_vm_types.h"
> +
> +static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gpusvm_notifier *notifier,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct mmu_notifier_range
> *mmu_range)
> +{
> +	/* TODO: Implement */
> +}
> +
> +static const struct drm_gpusvm_ops gpusvm_ops =3D {
> +	.invalidate =3D xe_svm_invalidate,
> +};
> +
> +static const u64 fault_chunk_sizes[] =3D {
> +	SZ_2M,
> +	SZ_64K,
> +	SZ_4K,
> +};
> +
> +int xe_svm_init(struct xe_vm *vm)
Kerneldoc + other undocumented extern funcs

> +{
> +	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> >drm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, NULL, 0, vm->size,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SZ_512M, &gpusvm_ops,
> fault_chunk_sizes,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(fault_chunk_sizes));
> +}
> +
> +void xe_svm_close(struct xe_vm *vm)

> +{
> +}
> +
> +void xe_svm_fini(struct xe_vm *vm)
> +{
> +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +
> +	drm_gpusvm_fini(&vm->svm.gpusvm);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> new file mode 100644
> index 000000000000..979f2322eeba
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_SVM_H_
> +#define _XE_SVM_H_
> +
> +struct xe_vm;
> +
> +int xe_svm_init(struct xe_vm *vm);
> +void xe_svm_fini(struct xe_vm *vm);
> +void xe_svm_close(struct xe_vm *vm);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 0d887fb9de59..b11fb0ac9520 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -35,6 +35,7 @@
> =C2=A0#include "xe_preempt_fence.h"
> =C2=A0#include "xe_pt.h"
> =C2=A0#include "xe_res_cursor.h"
> +#include "xe_svm.h"
> =C2=A0#include "xe_sync.h"
> =C2=A0#include "xe_trace_bo.h"
> =C2=A0#include "xe_wa.h"
> @@ -1503,6 +1504,12 @@ struct xe_vm *xe_vm_create(struct xe_device
> *xe, u32 flags)
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> +	if (flags & XE_VM_FLAG_FAULT_MODE) {
> +		err =3D xe_svm_init(vm);
> +		if (err)
> +			goto err_close;
> +	}
> +
> =C2=A0	if (number_tiles > 1)
> =C2=A0		vm->composite_fence_ctx =3D
> dma_fence_context_alloc(1);
> =C2=A0
> @@ -1548,6 +1555,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> =C2=A0	xe_vm_close(vm);
> =C2=A0	if (xe_vm_in_preempt_fence_mode(vm))
> =C2=A0		flush_work(&vm->preempt.rebind_work);
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_close(vm);
> =C2=A0
> =C2=A0	down_write(&vm->lock);
> =C2=A0	for_each_tile(tile, xe, id) {
> @@ -1616,6 +1625,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> =C2=A0		xe_vma_destroy_unlocked(vma);
> =C2=A0	}
> =C2=A0
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_fini(vm);
> +
> =C2=A0	up_write(&vm->lock);
> =C2=A0
> =C2=A0	down_write(&xe->usm.lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1764781c376b..bd1c0e368238 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -6,6 +6,7 @@
> =C2=A0#ifndef _XE_VM_TYPES_H_
> =C2=A0#define _XE_VM_TYPES_H_
> =C2=A0
> +#include "drm_gpusvm.h"
> =C2=A0#include <drm/drm_gpuvm.h>
> =C2=A0
> =C2=A0#include <linux/dma-resv.h>
> @@ -140,6 +141,12 @@ struct xe_vm {
> =C2=A0	/** @gpuvm: base GPUVM used to track VMAs */
> =C2=A0	struct drm_gpuvm gpuvm;
> =C2=A0
> +	/** @svm: Shared virtual memory state */
> +	struct {
> +		/** @svm.gpusvm: base GPUSVM used to track fault
> allocations */
> +		struct drm_gpusvm gpusvm;
> +	} svm;
> +
> =C2=A0	struct xe_device *xe;
> =C2=A0
> =C2=A0	/* exec queue used for (un)binding vma's */

Thanks,
Thomas

