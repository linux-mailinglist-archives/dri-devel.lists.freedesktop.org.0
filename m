Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970E19E0221
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 13:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B42E10E70D;
	Mon,  2 Dec 2024 12:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCQQzW7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 285FB10E6FF;
 Mon,  2 Dec 2024 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733142451; x=1764678451;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A7ecAo2sGdgz+ixYTXSB4ToefFqWbfaO1v4uRDjMQDY=;
 b=XCQQzW7JXLEEzMsyj5MNO0hfaAGiQWMCQjZSlarW4QHEQ4iw4vvPleTb
 iETCjIOBZx8BYRUNQb/SmJ7E2I6e1joCON1PhG+fb6D7FBBBoJfMKa/kM
 fLNCiQNO2MX6f38x1jW/OnOddWQQSO+B/VnV8p32tvxaKlt0ctfooBcM0
 2dRovH1+ecc0B47kjzvPbVWEf1OXsbRwLT5QBU+tU7Z9959yn1uy7b5sl
 lHGpFZb5Khf5QqUeSsEp8mSj+SpgPrf75l4d+yM9cBd4Tm9dGvNugQOP3
 otDHaZwaQMIlIXQZUtPxYwOrWNzoCQDiGh0rt24fV8m8a5/ZTetdkF033 w==;
X-CSE-ConnectionGUID: iGgcwaTbQqu4DMm82ulXqQ==
X-CSE-MsgGUID: MqxRpZFbSgOIUFBvH2vruw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50826077"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="50826077"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:27:31 -0800
X-CSE-ConnectionGUID: 37nFDOJnRhO4ND7w/q4cbw==
X-CSE-MsgGUID: R/PEFGZoS4mtH3rjEFpfDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="93934150"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 04:27:28 -0800
Message-ID: <e35ae7f23c36fc7b1af3016de31f85863165b6c6.camel@linux.intel.com>
Subject: Re: [PATCH v2 25/29] drm/xe: Basic SVM BO eviction
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 02 Dec 2024 13:27:24 +0100
In-Reply-To: <20241016032518.539495-26-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-26-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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
> Wire xe_bo_move to GPUSVM migration to SRAM with trylocking of mmap
> lock.
>=20
> v2:
> =C2=A0- Use xe_svm_bo_evict
> =C2=A0- Drop bo->range
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0 | 20 ++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.c |=C2=A0 5 +++++
> =C2=A0drivers/gpu/drm/xe/xe_svm.h |=C2=A0 3 +++
> =C2=A03 files changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index dbd03383878e..17d158762e03 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -25,6 +25,7 @@
> =C2=A0#include "xe_pm.h"
> =C2=A0#include "xe_preempt_fence.h"
> =C2=A0#include "xe_res_cursor.h"
> +#include "xe_svm.h"
> =C2=A0#include "xe_trace_bo.h"
> =C2=A0#include "xe_ttm_stolen_mgr.h"
> =C2=A0#include "xe_vm.h"
> @@ -250,6 +251,8 @@ int xe_bo_placement_for_flags(struct xe_device
> *xe, struct xe_bo *bo,
> =C2=A0static void xe_evict_flags(struct ttm_buffer_object *tbo,
> =C2=A0			=C2=A0=C2=A0 struct ttm_placement *placement)
> =C2=A0{
> +	struct xe_bo *bo;
> +
> =C2=A0	if (!xe_bo_is_xe_bo(tbo)) {
> =C2=A0		/* Don't handle scatter gather BOs */
> =C2=A0		if (tbo->type =3D=3D ttm_bo_type_sg) {
> @@ -261,6 +264,12 @@ static void xe_evict_flags(struct
> ttm_buffer_object *tbo,
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	bo =3D ttm_to_xe_bo(tbo);
> +	if (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC) {
> +		*placement =3D sys_placement;
> +		return;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * For xe, sg bos that are evicted to system just triggers a
> =C2=A0	 * rebind of the sg list upon subsequent validation to
> XE_PL_TT.
> @@ -738,6 +747,17 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> +	if (!move_lacks_source && (bo->flags &
> XE_BO_FLAG_SYSTEM_ALLOC) &&
> +	=C2=A0=C2=A0=C2=A0 new_mem->mem_type =3D=3D XE_PL_SYSTEM) {
> +		ret =3D xe_svm_bo_evict(bo);
> +		if (!ret) {
> +			drm_dbg(&xe->drm, "Evict system allocator BO
> success\n");
> +			ttm_bo_move_null(ttm_bo, new_mem);
> +		}
> +
> +		goto out;
> +	}
> +
> =C2=A0	if (!move_lacks_source &&
> =C2=A0	=C2=A0=C2=A0=C2=A0 ((old_mem_type =3D=3D XE_PL_SYSTEM &&
> resource_is_vram(new_mem)) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 (mem_type_is_vram(old_mem_type) &&
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 31b80cde15c4..555bc71ae523 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -752,3 +752,8 @@ int xe_devm_add(struct xe_tile *tile, struct
> xe_mem_region *mr)
> =C2=A0		 tile->id, mr->io_start, mr->io_start + mr-
> >usable_size, res);
> =C2=A0	return 0;
> =C2=A0}
> +
> +int xe_svm_bo_evict(struct xe_bo *bo)

Kerneldoc. Also important IMO to specify the contract that if this
function returns success, then no VRAM pages must be in use anymore
since we will free the vram resource. (Can we guaranteee that?)


Thanks,
Thomas


> +{
> +	return drm_gpusvm_evict_to_ram(&bo->devmem_allocation);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 6893664dae70..5b9d5ac9ef72 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -11,6 +11,7 @@
> =C2=A0
> =C2=A0#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> =C2=A0
> +struct xe_bo;
> =C2=A0struct xe_mem_region;
> =C2=A0struct xe_tile;
> =C2=A0struct xe_vm;
> @@ -35,6 +36,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0			=C2=A0=C2=A0=C2=A0 bool atomic);
> =C2=A0bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> =C2=A0
> +int xe_svm_bo_evict(struct xe_bo *bo);
> +
> =C2=A0static inline bool xe_svm_range_pages_valid(struct xe_svm_range
> *range)
> =C2=A0{
> =C2=A0	return drm_gpusvm_range_pages_valid(range->base.gpusvm,
> &range->base);

