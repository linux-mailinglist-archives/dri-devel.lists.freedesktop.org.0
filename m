Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93A49D255E
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 13:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D268010E296;
	Tue, 19 Nov 2024 12:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBxU2MYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA89110E296;
 Tue, 19 Nov 2024 12:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732018518; x=1763554518;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wDjbremkfmPoyFztLlzIQwanXhbe3p1vOd6qaN0osco=;
 b=PBxU2MYnTDo2hvqzSxx/JoO26YzCC79eyEIIwj8GiHdexHZq+ee6Gdr0
 wkLyDPTpgdEXHx7EIUaiXrvuLEGy90i+uprtUie16eFALPX99TRBFwq8+
 MS9/ZK8XQrBio9eJV0uTK+tt7W2HVBdkn9yFuwSOJ/VlLznElqtKdiUxh
 XkeQ++dfZZPaCN2+RTJ8ssQDJ/i/r74oANI4KUYWBbGjxs0D8cVgSFLl4
 qLL70mOIH0j2f21fs5zREC6wZAbYQSt+Hvp3P9r5W8W1ikdZs14ZCdEPm
 cDQqdcl9SVKnKr7qkTYdFLlPd8jfcSn+qcj6Bdl9mt9tSrVNh3oXz0k1/ g==;
X-CSE-ConnectionGUID: z0oxJTQOSVukkcIZbdur2A==
X-CSE-MsgGUID: d4WzTR0cQS2fZPWGJiA6aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43082506"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="43082506"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:15:17 -0800
X-CSE-ConnectionGUID: AJyts8ThSMqfdIYV/1tAbQ==
X-CSE-MsgGUID: zparc7j3QKGvn1nqksAb2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89952587"
Received: from smoticic-mobl.ger.corp.intel.com (HELO [10.245.246.223])
 ([10.245.246.223])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 04:15:14 -0800
Message-ID: <7424e69f76d992a5ac69aff941a2afc8fc6b910c.camel@linux.intel.com>
Subject: Re: [PATCH v2 08/29] drm/xe: Add dma_addr res cursor
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Tue, 19 Nov 2024 13:15:12 +0100
In-Reply-To: <20241016032518.539495-9-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-9-matthew.brost@intel.com>
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
> From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> Useful for SVM ranges in SRAM and programing page tables.

We should look at providing a better commit message.

>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_res_cursor.h | 116
> ++++++++++++++++++++++++++++-
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 4 +
> =C2=A02 files changed, 118 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> b/drivers/gpu/drm/xe/xe_res_cursor.h
> index dca374b6521c..3faa3d9adb82 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -30,13 +30,18 @@
> =C2=A0#include <drm/ttm/ttm_range_manager.h>
> =C2=A0#include <drm/ttm/ttm_resource.h>
> =C2=A0#include <drm/ttm/ttm_tt.h>
> +#include "drm_pagemap.h"
> =C2=A0
> =C2=A0#include "xe_bo.h"
> =C2=A0#include "xe_device.h"
> =C2=A0#include "xe_macros.h"
> +#include "xe_svm.h"
> =C2=A0#include "xe_ttm_vram_mgr.h"
> =C2=A0
> -/* state back for walking over vram_mgr, stolen_mgr, and gtt_mgr
> allocations */
> +/**
> + * struct xe_res_cursor - state for walking over vram_mgr,
> stolen_mgr,
> + * and gtt_mgr allocations
> + */
> =C2=A0struct xe_res_cursor {
> =C2=A0	u64 start;
> =C2=A0	u64 size;
> @@ -44,7 +49,17 @@ struct xe_res_cursor {
> =C2=A0	void *node;
> =C2=A0	u32 mem_type;
> =C2=A0	struct scatterlist *sgl;
> +	/** @dma_addr: Current element in a struct
> drm_pagemap_dma_addr array */
> +	const struct drm_pagemap_dma_addr *dma_addr;
> =C2=A0	struct drm_buddy *mm;
> +	/**
> +	 * @dma_start: DMA start address for the current segment.
> +	 * This may be different to @dma_addr.addr since elements in
> +	 * the array may be coalesced to a single segment.
> +	 */
> +	u64 dma_start;
> +	/** @dma_seg_size: Size of the current segment. */
> +	u64 dma_seg_size;
> =C2=A0};
> =C2=A0
> =C2=A0static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
> @@ -70,6 +85,7 @@ static inline void xe_res_first(struct ttm_resource
> *res,
> =C2=A0				struct xe_res_cursor *cur)
> =C2=A0{
> =C2=A0	cur->sgl =3D NULL;
> +	cur->dma_addr =3D NULL;
> =C2=A0	if (!res)
> =C2=A0		goto fallback;
> =C2=A0
> @@ -141,6 +157,36 @@ static inline void __xe_res_sg_next(struct
> xe_res_cursor *cur)
> =C2=A0	cur->sgl =3D sgl;
> =C2=A0}
> =C2=A0
> +/**
> + * __xe_res_dma_next() - Advance the cursor when end-of-segment is
> reached
> + * @cur: The cursor
> + */
> +static inline void __xe_res_dma_next(struct xe_res_cursor *cur)
> +{
> +	const struct drm_pagemap_dma_addr *addr =3D cur->dma_addr;
> +	u64 start =3D cur->start;
> +
> +	while (start >=3D cur->dma_seg_size) {
> +		start -=3D cur->dma_seg_size;
> +		addr++;
> +		cur->dma_seg_size =3D PAGE_SIZE << addr->order;
> +	}
> +	cur->dma_start =3D addr->addr;
> +
> +	/* Coalesce array_elements */
> +	while (cur->dma_seg_size - start < cur->remaining) {
> +		if (cur->dma_start + cur->dma_seg_size !=3D
> addr[1].addr ||
> +		=C2=A0=C2=A0=C2=A0 addr->proto !=3D addr[1].proto)
> +			break;
> +		addr++;
> +		cur->dma_seg_size +=3D PAGE_SIZE << addr->order;
> +	}
> +
> +	cur->dma_addr =3D addr;
> +	cur->start =3D start;
> +	cur->size =3D cur->dma_seg_size - start;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_res_first_sg - initialize a xe_res_cursor with a scatter
> gather table
> =C2=A0 *
> @@ -160,11 +206,42 @@ static inline void xe_res_first_sg(const struct
> sg_table *sg,
> =C2=A0	cur->start =3D start;
> =C2=A0	cur->remaining =3D size;
> =C2=A0	cur->size =3D 0;
> +	cur->dma_addr =3D NULL;
> =C2=A0	cur->sgl =3D sg->sgl;
> =C2=A0	cur->mem_type =3D XE_PL_TT;
> =C2=A0	__xe_res_sg_next(cur);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_res_first_dma - initialize a xe_res_cursor with dma_addr array
> + *
> + * @dma_addr: struct drm_pagemap_dma_addr array to walk
> + * @start: Start of the range
> + * @size: Size of the range
> + * @cur: cursor object to initialize
> + *
> + * Start walking over the range of allocations between @start and
> @size.
> + */
> +static inline void xe_res_first_dma(const struct
> drm_pagemap_dma_addr *dma_addr,
> +				=C2=A0=C2=A0=C2=A0 u64 start, u64 size,
> +				=C2=A0=C2=A0=C2=A0 struct xe_res_cursor *cur)
> +{
> +	XE_WARN_ON(!dma_addr);
> +	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
> +		=C2=A0=C2=A0 !IS_ALIGNED(size, PAGE_SIZE));
> +
> +	cur->node =3D NULL;
> +	cur->start =3D start;
> +	cur->remaining =3D size;
> +	cur->dma_seg_size =3D PAGE_SIZE << dma_addr->order;
> +	cur->dma_start =3D 0;
> +	cur->size =3D 0;
> +	cur->dma_addr =3D dma_addr;
> +	__xe_res_dma_next(cur);
> +	cur->sgl =3D NULL;
> +	cur->mem_type =3D XE_PL_TT;
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_res_next - advance the cursor
> =C2=A0 *
> @@ -191,6 +268,12 @@ static inline void xe_res_next(struct
> xe_res_cursor *cur, u64 size)
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	if (cur->dma_addr) {
> +		cur->start +=3D size;
> +		__xe_res_dma_next(cur);
> +		return;
> +	}
> +
> =C2=A0	if (cur->sgl) {
> =C2=A0		cur->start +=3D size;
> =C2=A0		__xe_res_sg_next(cur);
> @@ -232,6 +315,35 @@ static inline void xe_res_next(struct
> xe_res_cursor *cur, u64 size)
> =C2=A0 */
> =C2=A0static inline u64 xe_res_dma(const struct xe_res_cursor *cur)
> =C2=A0{
> -	return cur->sgl ? sg_dma_address(cur->sgl) + cur->start :
> cur->start;
> +	if (cur->dma_addr)
> +		return cur->dma_start + cur->start;
> +	else if (cur->sgl)
> +		return sg_dma_address(cur->sgl) + cur->start;
> +	else
> +		return cur->start;
> +}
> +
> +/**
> + * xe_res_is_vram() - Whether the cursor current dma address points
> to
> + * same-device VRAM
> + * @cur: The cursor.
> + *
> + * Return: true iff the address returned by xe_res_dma() points to
> internal vram.
> + */
> +static inline bool xe_res_is_vram(const struct xe_res_cursor *cur)
> +{
> +	if (cur->dma_addr)
> +		return cur->dma_addr->proto =3D=3D XE_INTERCONNECT_VRAM;
> +
> +	switch (cur->mem_type) {
> +	case XE_PL_STOLEN:
> +	case XE_PL_VRAM0:
> +	case XE_PL_VRAM1:
> +		return true;
> +	default:
> +		break;
> +	}
> +
> +	return false;
> =C2=A0}
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 979f2322eeba..376e86876a11 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -6,6 +6,10 @@
> =C2=A0#ifndef _XE_SVM_H_
> =C2=A0#define _XE_SVM_H_
> =C2=A0
> +#include "drm_pagemap.h"
> +
> +#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> +
> =C2=A0struct xe_vm;
> =C2=A0
> =C2=A0int xe_svm_init(struct xe_vm *vm);

