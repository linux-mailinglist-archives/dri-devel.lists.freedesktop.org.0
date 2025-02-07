Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE840A2C32A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 14:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C9110E0AA;
	Fri,  7 Feb 2025 13:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMikKtvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8AB10E0AA;
 Fri,  7 Feb 2025 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738933278; x=1770469278;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Jzihua10kZ2uZqq8IrEX6A/b4OOLGtNsITHHaYpt9dE=;
 b=NMikKtvYqjSfMiG2CezbgbimPH68rm5klvPGRjitSoKGUExhcs+Jt4P2
 5jGstmUapURWEMzTy3i6M5LY/GRcHWJmSZc+m0uo8joLYE194FIP3k32N
 fwrxxgfZXUkhCCqWQ3RqrXfeQ+Chh7E4a8xjM5dfjZ3VDpS7UaCBMVPm9
 991IZT7cN5ZVT/CO2hQgRZms7oqEWf/v+cKkYY3lDqbrltvpZKEFzGnpo
 xad0I81xVZ3VZ/VvMuy6GDzpioFyEs1QDWnCkvgtDxMKkrTaCJd3OtAz/
 7QFGXsPegkrhKrN1vzv8EAsbJKA0D6X1bo96iXleDG54N4dKARDucNoa+ Q==;
X-CSE-ConnectionGUID: jtaqt51pQyuMoBmX32B0Sg==
X-CSE-MsgGUID: QBBhLtcRSAa22WdP+VINaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="38772828"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="38772828"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:01:18 -0800
X-CSE-ConnectionGUID: A42opYq2Rni+ZHIxezLGfw==
X-CSE-MsgGUID: m6vaL05pQteYcyt9858v8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="116564141"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 05:01:15 -0800
Message-ID: <639abb99850a42ff0af6a04adca91ddd6df819dc.camel@linux.intel.com>
Subject: Re: [PATCH v4 17/33] drm/xe: Do not allow CPU address mirror VMA
 unbind if the GPU has bindings
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Fri, 07 Feb 2025 14:01:12 +0100
In-Reply-To: <20250129195212.745731-18-matthew.brost@intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-18-matthew.brost@intel.com>
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
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c |=C2=A0 5 +++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0 2 ++
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0 | 16 ++++++++++++++++
> =C2=A03 files changed, 23 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 03c5cbcacb0e..56ece53b2069 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -428,3 +428,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0
> =C2=A0	return err;
> =C2=A0}
> +
> +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)

Kerneldoc?

> +{
> +	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index ef5bc4e919e8..b181c174ca61 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -46,6 +46,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic);
> =C2=A0
> +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> +
> =C2=A0static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> *range)
And here.

> =C2=A0{
> =C2=A0	return drm_gpusvm_range_pages_valid(range->base.gpusvm,
> &range->base);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 6fa446884955..d8c78ecd54ec 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2398,6 +2398,17 @@ static int vm_bind_ioctl_ops_parse(struct
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
> @@ -2480,6 +2491,11 @@ static int vm_bind_ioctl_ops_parse(struct
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

Thanks,
Thomas

