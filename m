Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D69DFF38
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 11:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6509210E6BD;
	Mon,  2 Dec 2024 10:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8jtE0AX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539FC10E1E2;
 Mon,  2 Dec 2024 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733136293; x=1764672293;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/0X7r6apaJy2bjJWw/jQp7VqDYwxYskDSG0BYrYfXtE=;
 b=Q8jtE0AXMFDhOwumiWRrD1cn0qtoU47riveFWJ2VYMPpUDx4xBzocvIx
 zl4q/gBOrBAc31CtBJ+FCr40hMPdDT1EqoX+hoGAQFNI9y0WDEzVInzFm
 eRZOxtc1DNiREEkBVNmYMqAKALuFAWcWpVbh9bsPUAzrzS185I17OcgYV
 DVRyPJQjqA3qwng5NbyjgZlzWhMbfl6zLeJXXXf9cVOnw2sX41pYYT/eJ
 reKAte/1yFPtTPwp3MiffB2bTPBUMK/UYqYyEIv3Hn2otF2KrkQwAEdhj
 xdW70Q/+hSVYUm1AntrbmISVRAvpb+UxdG5xKW7A6012rAa6NoH+VM+vW g==;
X-CSE-ConnectionGUID: zeXcGUS3Tuu5CZQbzauZ9A==
X-CSE-MsgGUID: 2CBuT1XDRzGRIon/41Vuzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33450147"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="33450147"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 02:44:53 -0800
X-CSE-ConnectionGUID: 1YTLgdDYQG2Nneipqr1Jmg==
X-CSE-MsgGUID: MBd3cw0ERbCoClVtniAScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="92974542"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 02:44:50 -0800
Message-ID: <a2377c7b0cacc4c437a0defdb410565b774e6250.camel@linux.intel.com>
Subject: Re: [PATCH v2 23/29] drm/xe: Add BO flags required for SVM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com, 
 simona.vetter@ffwll.ch, felix.kuehling@amd.com, dakr@kernel.org
Date: Mon, 02 Dec 2024 11:44:47 +0100
In-Reply-To: <20241016032518.539495-24-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-24-matthew.brost@intel.com>
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
> Add XE_BO_FLAG_SYSTEM_ALLOC to indicate BO is tied to SVM range.
>=20
> Add XE_BO_FLAG_SKIP_CLEAR to indicate BO does not need to cleared.
>=20
> v2:
> =C2=A0- Take VM ref for system allocator BOs
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_bo.c | 15 +++++++++------
> =C2=A0drivers/gpu/drm/xe/xe_bo.h |=C2=A0 2 ++
> =C2=A02 files changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index a02d63e322ae..dbd03383878e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -685,8 +685,9 @@ static int xe_bo_move(struct ttm_buffer_object
> *ttm_bo, bool evict,
> =C2=A0	move_lacks_source =3D !old_mem || (handle_system_ccs ? (!bo-
> >ccs_cleared) :
> =C2=A0				=09
> (!mem_type_is_vram(old_mem_type) && !tt_has_data));
> =C2=A0
> -	needs_clear =3D (ttm && ttm->page_flags &
> TTM_TT_FLAG_ZERO_ALLOC) ||
> -		(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device);
> +	needs_clear =3D !(bo->flags & XE_BO_FLAG_SKIP_CLEAR) &&
> +		((ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
> ||
> +		(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device));

It should be worth adding a note about how clearing for svm bos is
intended to work. From what I can tell, there is an option to clear on
migration from system to vram if no system pages are present?

> =C2=A0
> =C2=A0	if (new_mem->mem_type =3D=3D XE_PL_TT) {
> =C2=A0		ret =3D xe_tt_map_sg(ttm);
> @@ -1145,7 +1146,7 @@ static void xe_ttm_bo_destroy(struct
> ttm_buffer_object *ttm_bo)
> =C2=A0		xe_drm_client_remove_bo(bo);
> =C2=A0#endif
> =C2=A0
> -	if (bo->vm && xe_bo_is_user(bo))
> +	if (bo->vm && (xe_bo_is_user(bo) || bo->flags &
> XE_BO_FLAG_SYSTEM_ALLOC))
> =C2=A0		xe_vm_put(bo->vm);
> =C2=A0
> =C2=A0	mutex_lock(&xe->mem_access.vram_userfault.lock);
> @@ -1301,7 +1302,8 @@ struct xe_bo *___xe_bo_create_locked(struct
> xe_device *xe, struct xe_bo *bo,
> =C2=A0	int err;
> =C2=A0
> =C2=A0	/* Only kernel objects should set GT */
> -	xe_assert(xe, !tile || type =3D=3D ttm_bo_type_kernel);
> +	xe_assert(xe, !tile || type =3D=3D ttm_bo_type_kernel ||
> +		=C2=A0 flags & XE_BO_FLAG_SYSTEM_ALLOC);
> =C2=A0
> =C2=A0	if (XE_WARN_ON(!size)) {
> =C2=A0		xe_bo_free(bo);
> @@ -1493,7 +1495,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> =C2=A0	 * by having all the vm's bo refereferences released at vm
> close
> =C2=A0	 * time.
> =C2=A0	 */
> -	if (vm && xe_bo_is_user(bo))
> +	if (vm && (xe_bo_is_user(bo) || bo->flags &
> XE_BO_FLAG_SYSTEM_ALLOC))
> =C2=A0		xe_vm_get(vm);
> =C2=A0	bo->vm =3D vm;
> =C2=A0
> @@ -2333,7 +2335,8 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
> =C2=A0	 * can't be used since there's no CCS storage associated
> with
> =C2=A0	 * non-VRAM addresses.
> =C2=A0	 */
> -	if (IS_DGFX(xe) && (bo->flags & XE_BO_FLAG_SYSTEM))
> +	if (IS_DGFX(xe) && ((bo->flags & XE_BO_FLAG_SYSTEM) ||
> +	=C2=A0=C2=A0=C2=A0 (bo->flags & XE_BO_FLAG_SYSTEM_ALLOC)))
> =C2=A0		return false;

Can we support CCS with system allocator? Perhaps add a TODO comment if
so. I figure it should be possible if we resolve on migration to
system, which we do on BMG.


Thanks,
Thomas


> =C2=A0
> =C2=A0	return true;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 7fa44a0138b0..caf0459d16ad 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -39,6 +39,8 @@
> =C2=A0#define XE_BO_FLAG_NEEDS_64K		BIT(15)
> =C2=A0#define XE_BO_FLAG_NEEDS_2M		BIT(16)
> =C2=A0#define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
> +#define XE_BO_FLAG_SYSTEM_ALLOC		BIT(18)
> +#define XE_BO_FLAG_SKIP_CLEAR		BIT(19)
> =C2=A0/* this one is trigger internally only */
> =C2=A0#define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> =C2=A0#define XE_BO_FLAG_INTERNAL_64K		BIT(31)

