Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7177E9A3721
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBEF810E8AD;
	Fri, 18 Oct 2024 07:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JYnJfFFY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDA110E0A8;
 Fri, 18 Oct 2024 07:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729236473; x=1760772473;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=9JkvCjs13OXjaECltZ04Z+0fAs4HYIvMsApm+S3eXpI=;
 b=JYnJfFFY9q8jesevrPJdhp/wtunWWBRc2YGqVoAIXFkLUx0cYEiS8xk1
 3zDKzYTwTLo0OGkU4TiHCEIvW8IhUFVTI6SE0CKBJf//r72D0+Zcx4wzA
 e6EU7jf/Zfb6dvr66bvCVMYpie8dO/IVGMMohfaMWF5AIncJTFdFHAE1g
 PXPCYu1tDIofI0U8XnmsAPadflW5tFUU6HR16SHvmhBB3Gz8xmuijo8G2
 70TwOsmqsSnFnoyVASUcjj2bRFfosoSRyLPwBXn73Kxjer7MAmmCBTAjY
 N55vWxtxRwaGf2XI9BKHzt0zz0vG2VgBhJCQLzPeGkjV/tmWORUoGF5/H w==;
X-CSE-ConnectionGUID: jXgUKZezRBS1liFy9QifPw==
X-CSE-MsgGUID: orUb0+auQV2uqdJlHOHecg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39299428"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39299428"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 00:27:53 -0700
X-CSE-ConnectionGUID: 4b2BAdGaQiSUbtamiJg+mg==
X-CSE-MsgGUID: sxWsQ6vNTc2KumqUqnKLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="79134349"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.180])
 ([10.245.246.180])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 00:27:51 -0700
Message-ID: <02faa9e057906d7e3dee0127ade83974e33182e9.camel@linux.intel.com>
Subject: Re: [RFC PATCH 1/1] drm/ttm, drm/xe: Add ttm_bo_access
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Fri, 18 Oct 2024 09:27:48 +0200
In-Reply-To: <20241017233941.1047522-2-matthew.brost@intel.com>
References: <20241017233941.1047522-1-matthew.brost@intel.com>
 <20241017233941.1047522-2-matthew.brost@intel.com>
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

On Thu, 2024-10-17 at 16:39 -0700, Matthew Brost wrote:
> Non-contiguous VRAM cannot be mapped in Xe nor can non-visible VRAM
> easily be accessed. Add ttm_bo_access, which is similar to
> ttm_bo_vm_access, to access such memory.
>=20
> Visible VRAM access is only supported at the momement but a follow up
> can add GPU access to non-visible VRAM.
>=20
> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/ttm/ttm_bo_vm.c | 20 +++++++++-----
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 48
> +++++++++++++++++++++++++++++++++
> =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 2 ++
> =C2=A03 files changed, 64 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 2c699ed1963a..b53cc064da44 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -405,13 +405,9 @@ static int ttm_bo_vm_access_kmap(struct
> ttm_buffer_object *bo,
> =C2=A0	return len;
> =C2=A0}
> =C2=A0
> -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> -		=C2=A0=C2=A0=C2=A0=C2=A0 void *buf, int len, int write)
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long
> offset,
> +		=C2=A0 void *buf, int len, int write)
> =C2=A0{
> -	struct ttm_buffer_object *bo =3D vma->vm_private_data;
> -	unsigned long offset =3D (addr) - vma->vm_start +
> -		((vma->vm_pgoff - drm_vma_node_start(&bo-
> >base.vma_node))
> -		 << PAGE_SHIFT);
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	if (len < 1 || (offset + len) > bo->base.size)
> @@ -439,6 +435,18 @@ int ttm_bo_vm_access(struct vm_area_struct *vma,
> unsigned long addr,
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
> +EXPORT_SYMBOL(ttm_bo_access);
> +
> +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 void *buf, int len, int write)
> +{
> +	struct ttm_buffer_object *bo =3D vma->vm_private_data;
> +	unsigned long offset =3D (addr) - vma->vm_start +
> +		((vma->vm_pgoff - drm_vma_node_start(&bo-
> >base.vma_node))
> +		 << PAGE_SHIFT);
> +
> +	return ttm_bo_access(bo, offset, buf, len, write);
> +}
> =C2=A0EXPORT_SYMBOL(ttm_bo_vm_access);
> =C2=A0
> =C2=A0static const struct vm_operations_struct ttm_bo_vm_ops =3D {
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5b232f2951b1..267f3b03a6d0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1111,6 +1111,53 @@ static void xe_ttm_bo_swap_notify(struct
> ttm_buffer_object *ttm_bo)
> =C2=A0	}
> =C2=A0}
> =C2=A0
> +static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
> +				unsigned long offset, void *buf, int
> len,
> +				int write)
> +{
> +	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
> +	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> +	struct iosys_map vmap;
> +	struct xe_res_cursor cursor;
> +	struct xe_mem_region *vram;
> +	void __iomem *virtual;
> +	int bytes_left =3D len;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (!mem_type_is_vram(ttm_bo->resource->mem_type))
> +		return -EIO;
> +
> +	/* FIXME: Use GPU for non-visible VRAM */
> +	if (!(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS))
> +		return -EINVAL;

Is it possible to check whether the bo is actually already in cpu
visible space even if the flag is missing? Also is there an error code
convention for the access() callback? Should we return -EIO here as
well?

> +
> +	vram =3D res_to_mem_region(ttm_bo->resource);
> +	xe_res_first(ttm_bo->resource, offset & ~PAGE_MASK, 0,
> &cursor);
> +
> +	do {
> +		int wcount =3D PAGE_SIZE - (offset & PAGE_MASK) >
> bytes_left ?
> +			bytes_left : PAGE_SIZE - (offset &
> PAGE_MASK);
> +
> +		virtual =3D (u8 __force *)vram->mapping +
> cursor.start;

Is it possible to use (u8 __iomem *)?

> +
> +		iosys_map_set_vaddr_iomem(&vmap, (void __iomem
> *)virtual);
And no typecast here (virtual should be __iomem already)

> +		if (write)
> +			xe_map_memcpy_to(xe, &vmap, offset &
> PAGE_MASK, buf,
> +					 wcount);
> +		else
> +			xe_map_memcpy_from(xe, buf, &vmap, offset &
> PAGE_MASK,
> +					=C2=A0=C2=A0 wcount);
> +
> +		offset +=3D wcount;
> +		buf +=3D wcount;
> +		bytes_left -=3D wcount;
> +		xe_res_next(&cursor, PAGE_SIZE);
> +	} while (bytes_left);
> +
> +	return len;
> +}
> +
Otherwise LTGM.
/Thomas


> =C2=A0const struct ttm_device_funcs xe_ttm_funcs =3D {
> =C2=A0	.ttm_tt_create =3D xe_ttm_tt_create,
> =C2=A0	.ttm_tt_populate =3D xe_ttm_tt_populate,
> @@ -1120,6 +1167,7 @@ const struct ttm_device_funcs xe_ttm_funcs =3D {
> =C2=A0	.move =3D xe_bo_move,
> =C2=A0	.io_mem_reserve =3D xe_ttm_io_mem_reserve,
> =C2=A0	.io_mem_pfn =3D xe_ttm_io_mem_pfn,
> +	.access_memory =3D xe_ttm_access_memory,
> =C2=A0	.release_notify =3D xe_ttm_bo_release_notify,
> =C2=A0	.eviction_valuable =3D ttm_bo_eviction_valuable,
> =C2=A0	.delete_mem_notify =3D xe_ttm_bo_delete_mem_notify,
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 5804408815be..8ea11cd8df39 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
> =C2=A0int ttm_bo_evict_first(struct ttm_device *bdev,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager =
*man,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ct=
x);
> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long
> offset,
> +		=C2=A0 void *buf, int len, int write);
> =C2=A0vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 struct vm_fault *vmf);
> =C2=A0vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,

