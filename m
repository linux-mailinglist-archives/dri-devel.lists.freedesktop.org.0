Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E29ACA9B13B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 16:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D4210E446;
	Thu, 24 Apr 2025 14:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fk/8LtJZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4515E10E446;
 Thu, 24 Apr 2025 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745505597; x=1777041597;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=2QcUvzorWSznQeELTM23X6+VWJ/i3tj1ZcE3km2ZHdU=;
 b=fk/8LtJZc7P2WLTxSqgsCvxiFRY/HMP6Ur4Xo6l6Xc+236itP0EylW3y
 DBAG+C88Oe7c7nOh4U+6BExADlOmiVNSIPyYbIHsNOrWzQP4AIxkKchFM
 LlmNOlLCGVffl7tL0RUbCQ2jFc5hrI3xUDDzcMfdju/cfvhz4QWr4ThKE
 /Uk7PBu5C1uZy7T5Zj4EXlxQdji/UC2El6SjNBgqkz54IWQGH08GPT+dy
 +YnCT/SJERICLfYIG8OG1yZPL8AVTJrq0PK1Z1MPeoEPtgK2hcic3hfqb
 43XkasXiHWildddPCqDWVgW17H+wQG3d7aa7FZ9OlR+Khs+XNg+hgq4JA Q==;
X-CSE-ConnectionGUID: 2cXu01b1RByqVvZUWJ+KDg==
X-CSE-MsgGUID: Id7OBjx2TEi/sCuNcxJHJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58136186"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="58136186"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:39:25 -0700
X-CSE-ConnectionGUID: gAbWWZ96Qjib+K8WoZCGpg==
X-CSE-MsgGUID: BZNn/OXrSK+EWdSJPB0CKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; d="scan'208";a="137497055"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.246.20])
 ([10.245.246.20])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 07:39:24 -0700
Message-ID: <1391a2ab3cbf8b690f1ec371cdc932032a647645.camel@linux.intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe: Strict migration policy for atomic SVM
 faults
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com
Date: Thu, 24 Apr 2025 16:39:21 +0200
In-Reply-To: <20250422170415.584662-3-matthew.brost@intel.com>
References: <20250422170415.584662-1-matthew.brost@intel.com>
 <20250422170415.584662-3-matthew.brost@intel.com>
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

On Tue, 2025-04-22 at 10:04 -0700, Matthew Brost wrote:
> Mixing GPU and CPU atomics does not work unless a strict migration
> policy of GPU atomics must be device memory. Enforce a policy of must
> be
> in VRAM with a retry loop of 2 attempts, if retry loop fails abort
> fault.
>=20
> v2:
> =C2=A0- Only retry migration on atomics
> =C2=A0- Drop alway migrate modparam
> v3:
> =C2=A0- Only set vram_only on DGFX (Himal)
> =C2=A0- Bail on get_pages failure if vram_only and retry count exceeded
> (Himal)
> =C2=A0- s/vram_only/devmem_only
> =C2=A0- Update xe_svm_range_is_valid to accept devmem_only argument
> v4:
> =C2=A0- Fix logic bug get_pages failure
>=20
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_module.c |=C2=A0 3 --
> =C2=A0drivers/gpu/drm/xe/xe_module.h |=C2=A0 1 -
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0 | 89 ++++++++++++++++=
+++++++++-------
> --
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0 |=C2=A0 5 --
> =C2=A04 files changed, 65 insertions(+), 33 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_module.c
> b/drivers/gpu/drm/xe/xe_module.c
> index 05c7d0ae6d83..1c4dfafbcd0b 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -33,9 +33,6 @@ struct xe_modparam xe_modparam =3D {
> =C2=A0module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size=
,
> uint, 0600);
> =C2=A0MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in
> MiB), must be power of 2");
> =C2=A0
> -module_param_named(always_migrate_to_vram,
> xe_modparam.always_migrate_to_vram, bool, 0444);
> -MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on
> GPU fault");
> -
=C2=A0module_param_named_unsafe(force_execlist,
> xe_modparam.force_execlist, bool, 0444);
> =C2=A0MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_module.h
> b/drivers/gpu/drm/xe/xe_module.h
> index 84339e509c80..5a3bfea8b7b4 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,7 +12,6 @@
> =C2=A0struct xe_modparam {
> =C2=A0	bool force_execlist;
> =C2=A0	bool probe_display;
> -	bool always_migrate_to_vram;
> =C2=A0	u32 force_vram_bar_size;
> =C2=A0	int guc_log_level;
> =C2=A0	char *guc_firmware_path;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 890f6b2f40e9..f749ae367a8f 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -650,9 +650,11 @@ void xe_svm_fini(struct xe_vm *vm)
> =C2=A0}
> =C2=A0
> =C2=A0static bool xe_svm_range_is_valid(struct xe_svm_range *range,
> -				=C2=A0 struct xe_tile *tile)
> +				=C2=A0 struct xe_tile *tile,
> +				=C2=A0 bool devmem_only)
> =C2=A0{
> -	return (range->tile_present & ~range->tile_invalidated) &
> BIT(tile->id);
> +	return ((range->tile_present & ~range->tile_invalidated) &
> BIT(tile->id))
> +		&& (!devmem_only || range-
> >base.flags.migrate_devmem);
> =C2=A0}

So let's say devmem_only is true here, and range-
>base.flags.migrate_devmem is false. Wouldn't that mean the range is
unusable and needs to be freed and re-allocated?

Also another thing going back to older code, it seems like range-
>tile_invalidated is protected by the notifier lock, so shouldn't we
assert that to be held in the function? It seems not to be held further
below:

> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> @@ -726,6 +728,35 @@ static int xe_svm_alloc_vram(struct xe_vm *vm,
> struct xe_tile *tile,
> =C2=A0}
> =C2=A0#endif
> =C2=A0
> +static bool supports_4K_migration(struct xe_device *xe)
> +{
> +	if (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> +		return false;
> +
> +	return true;
> +}

Do we have any hardware that supports pagefaults but not 4K VRAM pages?

> +
> +static bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range
> *range,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vma *vma)
> +{
> +	struct xe_vm *vm =3D range_to_vm(&range->base);
> +	u64 range_size =3D xe_svm_range_size(range);
> +
> +	if (!range->base.flags.migrate_devmem)
> +		return false;
> +
> +	if (xe_svm_range_in_vram(range)) {
> +		drm_dbg(&vm->xe->drm, "Range is already in VRAM\n");
> +		return false;
> +	}
> +
> +	if (range_size <=3D SZ_64K && !supports_4K_migration(vm->xe))
> {
> +		drm_dbg(&vm->xe->drm, "Platform doesn't support
> SZ_4K range migration\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> =C2=A0
> =C2=A0/**
> =C2=A0 * xe_svm_handle_pagefault() - SVM handle page fault
> @@ -750,12 +781,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> =C2=A0		.check_pages_threshold =3D IS_DGFX(vm->xe) &&
> =C2=A0			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> SZ_64K : 0,
> +		.devmem_only =3D atomic && IS_DGFX(vm->xe) &&
> +			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> =C2=A0	};
> =C2=A0	struct xe_svm_range *range;
> =C2=A0	struct drm_gpusvm_range *r;
> =C2=A0	struct drm_exec exec;
> =C2=A0	struct dma_fence *fence;
> =C2=A0	struct xe_tile *tile =3D gt_to_tile(gt);
> +	int migrate_try_count =3D ctx.devmem_only ? 3 : 1;
> =C2=A0	ktime_t end =3D 0;
> =C2=A0	int err;
> =C2=A0
> @@ -777,23 +811,26 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0		return PTR_ERR(r);
> =C2=A0
> =C2=A0	range =3D to_xe_range(r);
> -	if (xe_svm_range_is_valid(range, tile))
> +	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))

Requires notifier lock. Also see comment on re-allocating the range
above.

> =C2=A0		return 0;
> =C2=A0
> =C2=A0	range_debug(range, "PAGE FAULT");
> =C2=A0
> -	/* XXX: Add migration policy, for now migrate range once */
> -	if (!range->skip_migrate && range->base.flags.migrate_devmem
> &&
> -	=C2=A0=C2=A0=C2=A0 xe_svm_range_size(range) >=3D SZ_64K) {
> -		range->skip_migrate =3D true;
> -
> +	if (--migrate_try_count >=3D 0 &&
> +	=C2=A0=C2=A0=C2=A0 xe_svm_range_needs_migrate_to_vram(range, vma)

Requires notifier lock.

Should we have some sort of timeout instead of a try-count? Perhaps as
a last resort fall back to a 4K range?

/Thomas



> ) {
> =C2=A0		err =3D xe_svm_alloc_vram(vm, tile, range, &ctx);
> =C2=A0		if (err) {
> -			drm_dbg(&vm->xe->drm,
> -				"VRAM allocation failed, falling
> back to "
> -				"retrying fault, asid=3D%u,
> errno=3D%pe\n",
> -				vm->usm.asid, ERR_PTR(err));
> -			goto retry;
> +			if (migrate_try_count || !ctx.devmem_only) {
> +				drm_dbg(&vm->xe->drm,
> +					"VRAM allocation failed,
> falling back to retrying fault, asid=3D%u, errno=3D%pe\n",
> +					vm->usm.asid, ERR_PTR(err));
> +				goto retry;
> +			} else {
> +				drm_err(&vm->xe->drm,
> +					"VRAM allocation failed,
> retry count exceeded, asid=3D%u, errno=3D%pe\n",
> +					vm->usm.asid, ERR_PTR(err));
> +				return err;
> +			}
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> @@ -801,15 +838,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	err =3D drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
> =C2=A0	/* Corner where CPU mappings have changed */
> =C2=A0	if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EFAULT || err =3D=3D -EP=
ERM) {
> -		if (err =3D=3D -EOPNOTSUPP) {
> -			range_debug(range, "PAGE FAULT - EVICT
> PAGES");
> -			drm_gpusvm_range_evict(&vm->svm.gpusvm,
> &range->base);
> +		if (migrate_try_count > 0 || !ctx.devmem_only) {
> +			if (err =3D=3D -EOPNOTSUPP) {
> +				range_debug(range, "PAGE FAULT -
> EVICT PAGES");
> +				drm_gpusvm_range_evict(&vm-
> >svm.gpusvm,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &range-
> >base);
> +			}
> +			drm_dbg(&vm->xe->drm,
> +				"Get pages failed, falling back to
> retrying, asid=3D%u, gpusvm=3D%p, errno=3D%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm,
> ERR_PTR(err));
> +			range_debug(range, "PAGE FAULT - RETRY
> PAGES");
> +			goto retry;
> +		} else {
> +			drm_err(&vm->xe->drm,
> +				"Get pages failed, retry count
> exceeded, asid=3D%u, gpusvm=3D%p, errno=3D%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm,
> ERR_PTR(err));
> =C2=A0		}
> -		drm_dbg(&vm->xe->drm,
> -			"Get pages failed, falling back to retrying,
> asid=3D%u, gpusvm=3D%p, errno=3D%pe\n",
> -			vm->usm.asid, &vm->svm.gpusvm,
> ERR_PTR(err));
> -		range_debug(range, "PAGE FAULT - RETRY PAGES");
> -		goto retry;
> =C2=A0	}
> =C2=A0	if (err) {
> =C2=A0		range_debug(range, "PAGE FAULT - FAIL PAGE
> COLLECT");
> @@ -843,9 +887,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm,
> struct xe_vma *vma,
> =C2=A0	}
> =C2=A0	drm_exec_fini(&exec);
> =C2=A0
> -	if (xe_modparam.always_migrate_to_vram)
> -		range->skip_migrate =3D false;
> -
> =C2=A0	dma_fence_wait(fence, false);
> =C2=A0	dma_fence_put(fence);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index 3d441eb1f7ea..0e1f376a7471 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -39,11 +39,6 @@ struct xe_svm_range {
> =C2=A0	 * range. Protected by GPU SVM notifier lock.
> =C2=A0	 */
> =C2=A0	u8 tile_invalidated;
> -	/**
> -	 * @skip_migrate: Skip migration to VRAM, protected by GPU
> fault handler
> -	 * locking.
> -	 */
> -	u8 skip_migrate	:1;
> =C2=A0};
> =C2=A0
> =C2=A0/**

