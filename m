Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F089BA2BFBE
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 10:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678F210EA89;
	Fri,  7 Feb 2025 09:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgVZVQyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C370010EA89;
 Fri,  7 Feb 2025 09:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738921405; x=1770457405;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Wx16nSkxr038ADkn65G1zCGmdE4FNWGO1NtzN2EvnLM=;
 b=RgVZVQyHsJVslt/8N6OP+jb86bJFX3L3fhNh02rGiQfrs7i4qRCu1lVE
 7c1ZnNFdBGOIijIm+R1WTMpDv4IeWfWioSLL4SZfVu1wXkLxQhkM19vW/
 UvfehEtLV0xW/XaCmCKozfpYwA6jnPwJccw958Tc6O7yQKPvZM60IjvE4
 QGLdFdQFq6Mn5oG/5C4Wc4zFTnAgf4MwRjfyATEBj3+zVQnuEhpLPBfJc
 kQRbtkXInweQCdHGTS3Z0L15pGshryTbt70Il9tpudsWG60H/Wdbk8Cqd
 qur26VjliThfsFQ6W0podk1d3zO3RYzyp17OW9K9ED/RJTJVwfY6VV6ml A==;
X-CSE-ConnectionGUID: M+UGaOgATZaa3RuEeKdq3w==
X-CSE-MsgGUID: XXTZQ/UcRrquu03qy0YQYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="57094084"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="57094084"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:43:25 -0800
X-CSE-ConnectionGUID: MO/4yY8xSyS8RDfqMTv+Rg==
X-CSE-MsgGUID: jSMhSn9xSfC/xHlB8zpScA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115568896"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:43:22 -0800
Message-ID: <8010e8a23bb3147ca34caaf5b7fd7a67b2988865.camel@linux.intel.com>
Subject: Re: [PATCH v4 09/33] drm/xe: Add SVM init / close / fini to
 faulting VMs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 10:43:19 +0100
In-Reply-To: <20250129195212.745731-10-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-10-matthew.brost@intel.com>
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

On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> Add SVM init / close / fini to faulting VMs. Minimual implementation
> acting as a placeholder for follow on patches.
>=20
> v2:
> =C2=A0- Add close function
> v3:
> =C2=A0- Better commit message (Thomas)
> =C2=A0- Kernel doc (Thomas)
> =C2=A0- Update chunk array to be unsigned long (Thomas)
> =C2=A0- Use new drm_gpusvm.h header location (Thomas)
> =C2=A0- Newlines between functions in xe_svm.h (Thomas)
> =C2=A0- Call drm_gpusvm_driver_set_lock in init (Thomas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1=
 +
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 73
> ++++++++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 ++++=
++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12=
 ++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h |=C2=A0 7 +++
> =C2=A05 files changed, 110 insertions(+)
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_svm.c
> =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_svm.h
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile
> b/drivers/gpu/drm/xe/Makefile
> index 328aff36831b..a078a8895ec5 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -97,6 +97,7 @@ xe-y +=3D xe_bb.o \
> =C2=A0	xe_sched_job.o \
> =C2=A0	xe_step.o \
> =C2=A0	xe_survivability_mode.o \
> +	xe_svm.o \
> =C2=A0	xe_sync.o \
> =C2=A0	xe_tile.o \
> =C2=A0	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> new file mode 100644
> index 000000000000..79da859f02b1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2024 Intel Corporation
> + */
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
> +static const unsigned long fault_chunk_sizes[] =3D {
> +	SZ_2M,
> +	SZ_64K,
> +	SZ_4K,
> +};
> +
> +/**
> + * xe_svm_init() - SVM initialize
> + * @vm: The VM.
> + *
> + * Initialize SVM state which is embedded within the VM.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_svm_init(struct xe_vm *vm)
> +{
> +	int err;
> +
> +	err =3D drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> >drm,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, NULL, 0, vm->size,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SZ_512M, &gpusvm_ops,
> fault_chunk_sizes,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(fault_chunk_sizes));
> +	if (err)
> +		return err;
> +
> +	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_svm_close() - SVM close
> + * @vm: The VM.
> + *
> + * Close SVM state (i.e., stop and flush all SVM actions).
> + */
> +void xe_svm_close(struct xe_vm *vm)
> +{
> +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +}
> +
> +/**
> + * xe_svm_fini() - SVM finalize
> + * @vm: The VM.
> + *
> + * Finalize SVM state which is embedded within the VM.
> + */
> +void xe_svm_fini(struct xe_vm *vm)
> +{
> +	xe_assert(vm->xe, xe_vm_is_closed(vm));
> +
> +	drm_gpusvm_fini(&vm->svm.gpusvm);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> new file mode 100644
> index 000000000000..49cfd938aa17
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -0,0 +1,17 @@
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
> +
> +void xe_svm_fini(struct xe_vm *vm);
> +
> +void xe_svm_close(struct xe_vm *vm);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index dff10dfa9c69..bc34e6738c8c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -34,6 +34,7 @@
> =C2=A0#include "xe_preempt_fence.h"
> =C2=A0#include "xe_pt.h"
> =C2=A0#include "xe_res_cursor.h"
> +#include "xe_svm.h"
> =C2=A0#include "xe_sync.h"
> =C2=A0#include "xe_trace_bo.h"
> =C2=A0#include "xe_wa.h"
> @@ -1504,6 +1505,12 @@ struct xe_vm *xe_vm_create(struct xe_device
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
> @@ -1549,6 +1556,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
> =C2=A0	xe_vm_close(vm);
> =C2=A0	if (xe_vm_in_preempt_fence_mode(vm))
> =C2=A0		flush_work(&vm->preempt.rebind_work);
> +	if (xe_vm_in_fault_mode(vm))
> +		xe_svm_close(vm);
> =C2=A0
> =C2=A0	down_write(&vm->lock);
> =C2=A0	for_each_tile(tile, xe, id) {
> @@ -1617,6 +1626,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
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
> index f6855e4fb9e6..aa075d5e7a3f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -6,6 +6,7 @@
> =C2=A0#ifndef _XE_VM_TYPES_H_
> =C2=A0#define _XE_VM_TYPES_H_
> =C2=A0
> +#include <drm/drm_gpusvm.h>
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

