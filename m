Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46398A485FF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 18:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65B610EB40;
	Thu, 27 Feb 2025 17:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WmdwNAiM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7555E10EB3E;
 Thu, 27 Feb 2025 17:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740675694; x=1772211694;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=F3nH/csvyyCAusucSpXA9w4jrrKZWIHIVNj/coEPGts=;
 b=WmdwNAiMKNtkYuGa1AhKY+O0dS2fkf4mSFfTS5+KdYmVZQvwC6w2kxl9
 +ItA92gxPxUGQA7rGpHP4ED95cwvQ3DUPBvdTwKqyGTYRXqexvTA6QK0H
 a2ChvPCMBtJDj8aPccljZqylAq8AJ4vv2Cm5OGRulqe+G6VYuCdamIuGZ
 vtT6iajK8Q565XskO55Nki+IPEfNPgyyg+Z5No5+7wN8uhJcLRpYGGSyN
 RBDl0EB7Vtdz9EFLJjnYhlSeueO+rc8BYS5uAJ3+E3qKRNuco6O4pqvid
 BDp97k0S0DqBAV9v79xxkkLyKAWeWiuUC0FYPsYr3yyq2rb23NnpmLgs3 w==;
X-CSE-ConnectionGUID: OywiYg3MRfmA6W44O3NUpw==
X-CSE-MsgGUID: gLHuwkjzSPyUEPBWIKTicQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="44401318"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="44401318"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 09:01:33 -0800
X-CSE-ConnectionGUID: 2AqD9+WmQkmsQStchHl8eg==
X-CSE-MsgGUID: GxNtYS+IRYmEoD9jH9pNLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="140309652"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.232])
 ([10.245.246.232])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 09:01:30 -0800
Message-ID: <aa8445f4526d38885cdb0f558e322b439b1b82cd.camel@linux.intel.com>
Subject: Re: [PATCH v6 17/32] drm/xe: Do not allow CPU address mirror VMA
 unbind if the GPU has bindings
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Thu, 27 Feb 2025 18:01:28 +0100
In-Reply-To: <20250225044311.3178695-18-matthew.brost@intel.com>
References: <20250225044311.3178695-1-matthew.brost@intel.com>
 <20250225044311.3178695-18-matthew.brost@intel.com>
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

On Mon, 2025-02-24 at 20:42 -0800, Matthew Brost wrote:
> uAPI is designed with the use case that only mapping a BO to a
> malloc'd
> address will unbind a CPU-address mirror VMA. Therefore, allowing a
> CPU-address mirror VMA to unbind when the GPU has bindings in the
> range
> being unbound does not make much sense. This behavior is not
> supported,
> as it simplifies the code. This decision can always be revisited if a
> use case arises.
>=20
> v3:
> =C2=A0- s/arrises/arises (Thomas)
> =C2=A0- s/system allocator/GPU address mirror (Thomas)
> =C2=A0- Kernel doc (Thomas)
> =C2=A0- Newline between function defs (Thomas)
> v5:
> =C2=A0- Kernel doc (Thomas)
> v6:
> =C2=A0- Only compile if CONFIG_DRM_GPUSVM selected (CI, Lucas)
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 15 +++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0 8 ++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0 | 16 ++++++++++++++++
> =C2=A03 files changed, 39 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index a9d32cd69ae9..80076f4dc4b4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -434,3 +434,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0
> =C2=A0	return err;
> =C2=A0}
> +
> +/**
> + * xe_svm_has_mapping() - SVM has mappings
> + * @vm: The VM.
> + * @start: Start address.
> + * @end: End address.
> + *
> + * Check if an address range has SVM mappings.
> + *
> + * Return: True if address range has a SVM mapping, False otherwise
> + */
> +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 87cbda5641bb..35e044e492e0 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -57,6 +57,8 @@ void xe_svm_close(struct xe_vm *vm);
> =C2=A0int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic);
> +
> +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> =C2=A0#else
> =C2=A0static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> *range)
> =C2=A0{
> @@ -86,6 +88,12 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0{
> =C2=A0	return 0;
> =C2=A0}
> +
> +static inline
> +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	return false;
> +}
> =C2=A0#endif
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 870629cbb859..a3ef76504ce8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2442,6 +2442,17 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0			struct xe_vma *old =3D
> =C2=A0				gpuva_to_vma(op->base.remap.unmap-
> >va);
> =C2=A0			bool skip =3D xe_vma_is_cpu_addr_mirror(old);
> +			u64 start =3D xe_vma_start(old), end =3D
> xe_vma_end(old);
> +
> +			if (op->base.remap.prev)
> +				start =3D op->base.remap.prev->va.addr
> +
> +					op->base.remap.prev-
> >va.range;
> +			if (op->base.remap.next)
> +				end =3D op->base.remap.next->va.addr;
> +
> +			if (xe_vma_is_cpu_addr_mirror(old) &&
> +			=C2=A0=C2=A0=C2=A0 xe_svm_has_mapping(vm, start, end))
> +				return -EBUSY;
> =C2=A0
> =C2=A0			op->remap.start =3D xe_vma_start(old);
> =C2=A0			op->remap.range =3D xe_vma_size(old);
> @@ -2524,6 +2535,11 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0		{
> =C2=A0			struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.unmap.va);
> =C2=A0
> +			if (xe_vma_is_cpu_addr_mirror(vma) &&
> +			=C2=A0=C2=A0=C2=A0 xe_svm_has_mapping(vm,
> xe_vma_start(vma),
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_end(vma)))
> +				return -EBUSY;
> +
> =C2=A0			if (!xe_vma_is_cpu_addr_mirror(vma))
> =C2=A0				xe_vma_ops_incr_pt_update_ops(vops,
> op->tile_mask);
> =C2=A0			break;

