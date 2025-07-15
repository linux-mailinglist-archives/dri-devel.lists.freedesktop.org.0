Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBC3B062A7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 17:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA1210E129;
	Tue, 15 Jul 2025 15:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=caterina.shablia@collabora.com header.b="cq9ZLRkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 581 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jul 2025 15:18:02 UTC
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5B610E129;
 Tue, 15 Jul 2025 15:18:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752592679; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Fndm1p3XY5VUtXUznHxsr37QvXGPyVQ/izu/qWxpECvo63V6IudxHJcwomj6lXMd4ilFz4JhPhp9q1wV31QTamkzm/ggxiiFGviKI40GTWje9+K8YRwBd2Wzn9bV6+cbsSCXSNwcGrbPpm9+lWnUBnzd8IW5Yuf08wC6XR+mcWo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752592679;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=YV4WQYFhL2aoKIsjeEhRwx446ZAHBheNflvhlLsqO3M=; 
 b=LMm0cGaLkUbvjxQEfk044XSQ5V+soVxArzWDIA7syClB/HqpJBAraqRx/upUgsDtjO+JNFj3DZ1ayAibZEwB+ylm3I4zd+IisYdLlnb8Y1xSS0j4HF5pH9yAeV07B7FmrH+58PdANV7Qh/5PH6khTyVoEhQL2s+VowWY11vFUmQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=caterina.shablia@collabora.com;
 dmarc=pass header.from=<caterina.shablia@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752592679; 
 s=zohomail; d=collabora.com; i=caterina.shablia@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=YV4WQYFhL2aoKIsjeEhRwx446ZAHBheNflvhlLsqO3M=;
 b=cq9ZLRktPoCTFLd+X6RpACLPGX+GGO9nDljmbK8Q3fOGrpsjjax5oqRXK5y8NECd
 X/Ha/4T9sZfvqr7ZKnbDqvC5t9ROQof9tVe4x2K4M5x7tbp/DlvETPbhbnfb0derDub
 9GLvSjUCLqCVKmsGPAbCTw6WtrxrtQbG78bWO65Q=
Received: by mx.zohomail.com with SMTPS id 1752592677569906.1945990416046;
 Tue, 15 Jul 2025 08:17:57 -0700 (PDT)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH v4 7/7] drm/panthor: Add support for repeated mappings
Date: Tue, 15 Jul 2025 17:17:50 +0200
Message-ID: <2244038.Hq7AAxBmiT@xps>
In-Reply-To: <414aabbe-763b-4786-a85c-a2670475ece5@arm.com>
References: <20250707170442.1437009-1-caterina.shablia@collabora.com>
 <20250707170442.1437009-8-caterina.shablia@collabora.com>
 <414aabbe-763b-4786-a85c-a2670475ece5@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

El viernes, 11 de julio de 2025 16:03:26 (hora de verano de Europa central)=
,=20
Steven Price escribi=C3=B3:
> On 07/07/2025 18:04, Caterina Shablia wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >=20
> > This allows us to optimize mapping of a relatively small
> > portion of a BO over and over in a large VA range, which
> > is useful to support Vulkan sparse bindings in an efficient
> > way.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Caterina Shablia <caterina.shablia@collabora.com>
> > Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
>=20
> This looks like the right sort of shape. From an uAPI perspective I'm
> not sure whether u32 is the right type for bo_repeat_range. While I
> can't immediately see a use for having a large repeat range it seems a
> little silly to close it off when we're going to have padding afterwards
> anyway. Obviously the kernel would reject large values because the
> internal APIs are only u32. But it would enable this to be fixed if we
> ever discover a usecase without a uAPI change.
>=20
> > ---
> >=20
> >  drivers/gpu/drm/panthor/panthor_drv.c |  3 +-
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 78 ++++++++++++++++++++++++---
> >  include/uapi/drm/panthor_drm.h        | 23 ++++++++
> >  3 files changed, 95 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c
> > b/drivers/gpu/drm/panthor/panthor_drv.c index 1116f2d2826e..585c07b07c42
> > 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -1608,6 +1608,7 @@ static void panthor_debugfs_init(struct drm_minor
> > *minor)>=20
> >   * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
> >   * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
> >   * - 1.5 - adds DRM_PANTHOR_SET_USER_MMIO_OFFSET ioctl
> >=20
> > + * - 1.6 - adds DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT flag
> >=20
> >   */
> > =20
> >  static const struct drm_driver panthor_drm_driver =3D {
> > =20
> >  	.driver_features =3D DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> >=20
> > @@ -1621,7 +1622,7 @@ static const struct drm_driver panthor_drm_driver=
 =3D
> > {
> >=20
> >  	.name =3D "panthor",
> >  	.desc =3D "Panthor DRM driver",
> >  	.major =3D 1,
> >=20
> > -	.minor =3D 5,
> > +	.minor =3D 6,
> >=20
> >  	.gem_create_object =3D panthor_gem_create_object,
> >  	.gem_prime_import_sg_table =3D drm_gem_shmem_prime_import_sg_table,
> >=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> > b/drivers/gpu/drm/panthor/panthor_mmu.c index f0a22b775958..4ce9fff67d69
> > 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -202,6 +202,9 @@ struct panthor_vm_op_ctx {
> >=20
> >  		/** @map.bo_offset: Offset in the buffer object. */
> >  		u64 bo_offset;
> >=20
> > +		/** @map.bo_repeat_range: Repeated BO range. */
> > +		u32 bo_repeat_range;
> > +
> >=20
> >  		/**
> >  	=09
> >  		 * @map.sgt: sg-table pointing to pages backing the GEM=20
object.
> >  		 *
> >=20
> > @@ -1007,6 +1010,26 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64
> > iova, int prot,>=20
> >  	return 0;
> > =20
> >  }
> >=20
> > +static int
> > +panthor_vm_repeated_map_pages(struct panthor_vm *vm, u64 iova, int pro=
t,
> > +			      struct sg_table *sgt, u64 offset, u64=20
size,
> > +			      u64 count)
> > +{
> > +	/* FIXME: we really need to optimize this at the io_pgtable level.=20
*/
>=20
> Do you have plans for optimizing this?=20
I personally don't have any plans, no, but maybe Boris does. I'll forward t=
his=20
question to him once he's back from his vacation.
> How bad is the performance
> without optimizing?
It's better than the alternative of poking vm_bind with a morbillion=20
drm_panthor_vm_bind_ops. More seriously, I don't really have any workloads=
=20
beside VK CTS to measure, for now. There's some stuff we should try to do i=
n=20
panvk first, like using a 2M dummy_page and doing some gymnastics when mapp=
ing=20
it so we get huge mappings, which will hopefully lessen the pressure on thi=
s=20
loop.
>=20
> > +	for (u64 i =3D 0; i < count; i++) {
> > +		int ret;
> > +
> > +		ret =3D panthor_vm_map_pages(vm, iova + (size * i), prot,
> > +					   sgt, offset, size);
> > +		if (ret) {
> > +			panthor_vm_unmap_pages(vm, iova, size * (i -=20
1));
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >=20
> >  static int flags_to_prot(u32 flags)
> >  {
> > =20
> >  	int prot =3D 0;
> >=20
> > @@ -1203,12 +1226,14 @@ panthor_vm_op_ctx_prealloc_vmas(struct
> > panthor_vm_op_ctx *op_ctx)>=20
> >  	(DRM_PANTHOR_VM_BIND_OP_MAP_READONLY | \
> >  =09
> >  	 DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC | \
> >  	 DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED | \
> >=20
> > +	 DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT | \
> >=20
> >  	 DRM_PANTHOR_VM_BIND_OP_TYPE_MASK)
> > =20
> >  static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx
> >  *op_ctx,
> > =20
> >  					 struct panthor_vm=20
*vm,
> >  					 struct=20
panthor_gem_object *bo,
> >  					 u64 offset,
> >=20
> > +					 u32 repeat_range,
> >=20
> >  					 u64 size, u64 va,
> >  					 u32 flags)
> > =20
> >  {
> >=20
> > @@ -1224,9 +1249,22 @@ static int panthor_vm_prepare_map_op_ctx(struct
> > panthor_vm_op_ctx *op_ctx,>=20
> >  	    (flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) !=3D
> >  	    DRM_PANTHOR_VM_BIND_OP_TYPE_MAP)>  	=09
> >  		return -EINVAL;
> >=20
> > -	/* Make sure the VA and size are aligned and in-bounds. */
> > -	if (size > bo->base.base.size || offset > bo->base.base.size -=20
size)
> > -		return -EINVAL;
> > +	if (!(flags & DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT)) {
> > +		/* Make sure the VA and size are in-bounds. */
> > +		if (size > bo->base.base.size || offset > bo-
>base.base.size - size)
> > +			return -EINVAL;
> > +	} else {
> > +		/* Make sure the repeat_range is in-bounds. */
> > +		if (repeat_range > bo->base.base.size || offset > bo-
>base.base.size -
> > repeat_range) +			return -EINVAL;
> > +
> > +		/* Make sure size is a multiple of repeat_range */
> > +
> > +		u64 repeat_count =3D size;
> > +
> > +		if (do_div(repeat_count, repeat_range))
> > +			return -EINVAL;
> > +	}
> >=20
> >  	/* If the BO has an exclusive VM attached, it can't be mapped to=20
other
> >  	VMs. */ if (bo->exclusive_vm_root_gem &&
> >=20
> > @@ -1295,6 +1333,7 @@ static int panthor_vm_prepare_map_op_ctx(struct
> > panthor_vm_op_ctx *op_ctx,>=20
> >  		drm_gem_shmem_unpin(&bo->base);
> >  =09
> >  	op_ctx->map.bo_offset =3D offset;
> >=20
> > +	op_ctx->map.bo_repeat_range =3D repeat_range;
> >=20
> >  	/* L1, L2 and L3 page tables.
> >  =09
> >  	 * We could optimize L3 allocation by iterating over the sgt and=20
merging
> >=20
> > @@ -2112,9 +2151,22 @@ static int panthor_gpuva_sm_step_map(struct
> > drm_gpuva_op *op, void *priv)>=20
> >  	panthor_vma_init(vma, op_ctx->flags & PANTHOR_VM_MAP_FLAGS);
> >=20
> > -	ret =3D panthor_vm_map_pages(vm, op->map.va.addr,
> > flags_to_prot(vma->flags), -				  =20
op_ctx->map.sgt, op->map.gem.offset,
> > -				   op->map.va.range);
> > +	if (op_ctx->flags & DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT) {
> > +		u64 repeat_count =3D op->map.va.range;
> > +
> > +		do_div(repeat_count, op->map.gem.range);
> > +		ret =3D panthor_vm_repeated_map_pages(vm, op-
>map.va.addr,
> > +						   =20
flags_to_prot(vma->flags),
> > +						    op_ctx-
>map.sgt,
> > +						    op-
>map.gem.offset,
> > +						    op-
>map.gem.range,
> > +						   =20
repeat_count);
> > +	} else {
> > +		ret =3D panthor_vm_map_pages(vm, op->map.va.addr,
> > +					   flags_to_prot(vma-
>flags),
> > +					   op_ctx->map.sgt,=20
op->map.gem.offset,
> > +					   op->map.va.range);
> > +	}
> >=20
> >  	if (ret)
> >  =09
> >  		return ret;
> >=20
> > @@ -2237,7 +2289,7 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct
> > panthor_vm_op_ctx *op,>=20
> >  	switch (op_type) {
> >  	case DRM_PANTHOR_VM_BIND_OP_TYPE_MAP: {
> >=20
> > -		const struct drm_gpuvm_map_req map_req =3D {
> > +		struct drm_gpuvm_map_req map_req =3D {
> >=20
> >  			.va.addr =3D op->va.addr,
> >  			.va.range =3D op->va.range,
> >  			.gem.obj =3D op->map.vm_bo->obj,
> >=20
> > @@ -2249,6 +2301,11 @@ panthor_vm_exec_op(struct panthor_vm *vm, struct
> > panthor_vm_op_ctx *op,>=20
> >  			break;
> >  	=09
> >  		}
> >=20
> > +		if (op->flags & DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT) {
> > +			map_req.flags |=3D DRM_GPUVA_REPEAT;
> > +			map_req.gem.range =3D op->map.bo_repeat_range;
> > +		}
> > +
> >=20
> >  		ret =3D drm_gpuvm_sm_map(&vm->base, vm, &map_req);
> >  		break;
> >  =09
> >  	}
> >=20
> > @@ -2497,6 +2554,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file
> > *file,
> >=20
> >  		ret =3D panthor_vm_prepare_map_op_ctx(op_ctx, vm,
> >  	=09
> >  						    gem ?=20
to_panthor_bo(gem) : NULL,
> >  						    op-
>bo_offset,
> >=20
> > +						    op-
>bo_repeat_range,
> >=20
> >  						    op-
>size,
> >  						    op->va,
> >  						    op-
>flags);
> >=20
> > @@ -2698,7 +2756,11 @@ int panthor_vm_map_bo_range(struct panthor_vm *v=
m,
> > struct panthor_gem_object *bo>=20
> >  	struct panthor_vm_op_ctx op_ctx;
> >  	int ret;
> >=20
> > -	ret =3D panthor_vm_prepare_map_op_ctx(&op_ctx, vm, bo, offset, size,=
=20
va,
> > flags); +	/* TODO: would be nice to replace with assert instead */
>=20
> If you don't expect this to happen then this can be a "if (WARN_ON(...))".
>=20
> > +	if (flags & DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT)
> > +		return -EINVAL;
> > +
> > +	ret =3D panthor_vm_prepare_map_op_ctx(&op_ctx, vm, bo, offset, 0,=20
size,
> > va, flags);>=20
> >  	if (ret)
> >  =09
> >  		return ret;
> >=20
> > diff --git a/include/uapi/drm/panthor_drm.h
> > b/include/uapi/drm/panthor_drm.h index e1f43deb7eca..ad278bc234b0 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -496,6 +496,17 @@ enum drm_panthor_vm_bind_op_flags {
> >=20
> >  	 */
> >  =09
> >  	DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED =3D 1 << 2,
> >=20
> > +	/**
> > +	 * @DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT: Repeat a BO range
> > +	 *
> > +	 * Only valid with DRM_PANTHOR_VM_BIND_OP_TYPE_MAP.
> > +	 *
> > +	 * When this is set, a BO range is repeated over the VA range.
> > +	 * drm_panthor_vm_bind_op::bo_repeat_range defines the size of the
> > +	 * BO range to repeat.
> > +	 */
> > +	DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT =3D 1 << 3,
> > +
> >=20
> >  	/**
> >  =09
> >  	 * @DRM_PANTHOR_VM_BIND_OP_TYPE_MASK: Mask used to determine the=20
type of
> >  	 operation. */
> >=20
> > @@ -560,6 +571,18 @@ struct drm_panthor_vm_bind_op {
> >=20
> >  	 */
> >  =09
> >  	struct drm_panthor_obj_array syncs;
> >=20
> > +	/**
> > +	 * @bo_repeat_range: The size of the range to be repeated.
> > +	 *
> > +	 * Must be zero if DRM_PANTHOR_VM_BIND_OP_MAP_REPEAT is not set in
> > +	 * flags.
> > +	 *
> > +	 * Size must be a multiple of bo_repeat_range.
> > +	 */
> > +	__u32 bo_repeat_range;
> > +
> > +	/** @pad: Padding field. MBZ. */
> > +	__u32 pad;
>=20
> If we're going to have the padding then the kernel needs to check that
> this padding is zero, so that it can be available for future use.
I decided to go with your suggestion to change bo_repeat_range to be an __u=
64,=20
but rejecting vm_binds with values above 2^32-1 for now.
>=20
> Steve
>=20
> >  };
> > =20
> >  /**




