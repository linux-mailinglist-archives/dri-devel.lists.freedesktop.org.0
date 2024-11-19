Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23CF9D2AFF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4210210E682;
	Tue, 19 Nov 2024 16:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4NaclZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE16410E682;
 Tue, 19 Nov 2024 16:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732034006; x=1763570006;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ws4G+6p0yQl3xIVp9AFgdQufGEFgFa2J2+hs8JAuxSM=;
 b=e4NaclZbYsLIohP7/IvwMf7YEkH2CT5anIsoyOe7e+KtBINGgmKsto9t
 HT+k/Drx9msoZApOU1AofyY/25ylrieUUV2lObTD4pY4XQ4nTuoc3jY2H
 zdQr+z0NgerwEU+G+8oLGm8Ij+tLgqfa0+vHrCC0H8loMIa9a5HEPnsZu
 0KaM5D16dB10HgW1mTtJkQGKN3v4vc3Op6Mlyn6yg43XCErIjgrkMGiWQ
 726njW6y1vbw01S/hBzsUUm+N50EUodjZ9ezCL1IDJErb/wpE5n4dEHR1
 +hhYMgTt3i0dtOabpP6PauFCnV1YVxREWQZPelTEypydhC8enJyZxxItI A==;
X-CSE-ConnectionGUID: l9R8p8ytQjmcQk6Rj3rUhw==
X-CSE-MsgGUID: LjrwBlVESUaZ8v56QPwnmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31983693"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31983693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:33:25 -0800
X-CSE-ConnectionGUID: kfEv+fU+QpCBlq4PY/w9OQ==
X-CSE-MsgGUID: dUbO8JAcRyOMX3j93SQl/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89771515"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 08:33:16 -0800
Message-ID: <8531991acc4c92a6417bd83fd4007bc495ea347d.camel@linux.intel.com>
Subject: Re: [PATCH v2 14/29] drm/xe: Do not allow system allocator VMA
 unbind if the GPU has bindings
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 19 Nov 2024 17:33:11 +0100
In-Reply-To: <20241016032518.539495-15-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-15-matthew.brost@intel.com>
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

On Tue, 2024-10-15 at 20:25 -0700, Matthew Brost wrote:
> uAPI is designed with the the use case that only mapping a BO to a
> malloc'd address will unbind a system allocator VMA. Thus it doesn't
> make tons of sense to allow a system allocator VMA unbind if the GPU
> has
> bindings in the range being unbound. Do not support this as it
> simplifies the code. Can always be revisited if a use case for this
> arrises.

s/arrises/arises

I think a uAPI without special cases like this would be ideal, what is
the code simplification, given that we already support this implicitly?

Thanks,
/Thomas


>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c |=C2=A0 5 +++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0 | 16 ++++++++++++++++
> =C2=A03 files changed, 22 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 0762126f65e0..1d8021b4e2f0 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -378,3 +378,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0err_out:
> =C2=A0	return err;
> =C2=A0}
> +
> +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
> +{
> +	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 06d90d0f71a6..472fbc51f30e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -29,6 +29,7 @@ void xe_svm_close(struct xe_vm *vm);
> =C2=A0int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct xe_tile *tile, u64 fault_addr,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic);
> +bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> =C2=A0
> =C2=A0static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> *range)
> =C2=A0{
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 76a20e96084e..158fbb1c3f28 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2348,6 +2348,17 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0			struct xe_vma *old =3D
> =C2=A0				gpuva_to_vma(op->base.remap.unmap-
> >va);
> =C2=A0			bool skip =3D xe_vma_is_system_allocator(old);
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
> +			if (xe_vma_is_system_allocator(old) &&
> +			=C2=A0=C2=A0=C2=A0 xe_svm_has_mapping(vm, start, end))
> +				return -EBUSY;
> =C2=A0
> =C2=A0			op->remap.start =3D xe_vma_start(old);
> =C2=A0			op->remap.range =3D xe_vma_size(old);
> @@ -2430,6 +2441,11 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm *vm, struct drm_gpuva_ops *ops,
> =C2=A0		{
> =C2=A0			struct xe_vma *vma =3D gpuva_to_vma(op-
> >base.unmap.va);
> =C2=A0
> +			if (xe_vma_is_system_allocator(vma) &&
> +			=C2=A0=C2=A0=C2=A0 xe_svm_has_mapping(vm,
> xe_vma_start(vma),
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_vma_end(vma)))
> +				return -EBUSY;
> +
> =C2=A0			if (!xe_vma_is_system_allocator(vma))
> =C2=A0				xe_vma_ops_incr_pt_update_ops(vops,
> op->tile_mask);
> =C2=A0			break;

