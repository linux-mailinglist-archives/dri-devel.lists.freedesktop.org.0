Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BFCA611FE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 14:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC9A10E1DC;
	Fri, 14 Mar 2025 13:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGS1tBZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B5F10E1DC;
 Fri, 14 Mar 2025 13:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741957542; x=1773493542;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LLKrXn1L4kg7oUwm1v/4+S2R2VjLKK7leZhUuDQIBaI=;
 b=AGS1tBZV40Dni1fLV4KxCPV3ES1ihPEwNSGCflMEyMfUnsrm55gbsHX9
 R37TX2vsmk3JVf0sLH1iKWO98a8kDXOay/u25nQBnwp+LDOV3PBXXuIBY
 RbVyHTA0+7I8VgfS5uMgVErCadrw926Wynp7dQlLhxRlcGfNYC+yEwOpr
 v4lJtvxlAjhs5hxHTx1vwZrGNsWCEQRrwoEScuvO4Sv3HrtpTpky4ro61
 BvmLuaMZ5EI6heah/fKQVYkSuCmZC/IMHktBkrQwn3eVXfycEdFINrxgd
 +FbL/o/BAPvkprwQOtom5EEAhjbDtMta7sC+mMjJQL8eeUDJj/C2D7c5W w==;
X-CSE-ConnectionGUID: Dfs02RAJS0G2m0vqtdNw3g==
X-CSE-MsgGUID: jZdr+5H3TySSpMgiJALVCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="53761915"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="53761915"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:05:41 -0700
X-CSE-ConnectionGUID: YGJQfX5oRcSMLbtvhhuv7w==
X-CSE-MsgGUID: yJtywFdTT8SB9UJZV/0iuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121327915"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.196])
 ([10.245.246.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 06:05:38 -0700
Message-ID: <57d6dd90544115279b654c6e5ec4fde88898845b.camel@linux.intel.com>
Subject: Re: [RFC PATCH 08/19] drm/xe/bo: Add a bo remove callback
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Matthew
 Brost <matthew.brost@intel.com>,  Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, dakr@kernel.org, "Mrozek, Michal"	
 <michal.mrozek@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Date: Fri, 14 Mar 2025 14:05:34 +0100
In-Reply-To: <20250312210416.3120-9-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
 <20250312210416.3120-9-thomas.hellstrom@linux.intel.com>
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

On Wed, 2025-03-12 at 22:04 +0100, Thomas Hellstr=C3=B6m wrote:
> On device unbind, migrate exported bos, including pagemap bos to
> system. This allows importers to take proper action without
> disruption. In particular, SVM clients on remote devices may
> continue as if nothing happened, and can chose a different
> placement.
>=20
> The evict_flags() placement is chosen in such a way that bos that
> aren't exported are purged.
>=20
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Hmm. It seems like this patch acidentally got merged with another.
I'll separate and resend in v2.

Thanks,
Thomas



> ---
> =C2=A0drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 113 ++++++--
> =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 53 +++-
> =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 5 +
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0 28 +-
> =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 412 ++++++++++++++++++++++---
> --
> =C2=A0drivers/gpu/drm/xe/xe_svm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 49 ++++
> =C2=A0drivers/gpu/drm/xe/xe_tile.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 20 +-
> =C2=A0drivers/gpu/drm/xe/xe_tile.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 28 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 53 +++-
> =C2=A011 files changed, 645 insertions(+), 119 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_pagemap.c
> b/drivers/gpu/drm/drm_pagemap.c
> index d1efcd78a023..dcb26328f94b 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -97,6 +97,7 @@ drm_pagemap_zdd_alloc(struct drm_pagemap *dpagemap)
> =C2=A0	kref_init(&zdd->refcount);
> =C2=A0	zdd->devmem_allocation =3D NULL;
> =C2=A0	zdd->dpagemap =3D dpagemap;
> +	kref_get(&dpagemap->ref);
> =C2=A0
> =C2=A0	return zdd;
> =C2=A0}
> @@ -126,6 +127,7 @@ static void drm_pagemap_zdd_destroy(struct kref
> *ref)
> =C2=A0	struct drm_pagemap_zdd *zdd =3D
> =C2=A0		container_of(ref, struct drm_pagemap_zdd, refcount);
> =C2=A0	struct drm_pagemap_devmem *devmem =3D zdd->devmem_allocation;
> +	struct drm_pagemap *dpagemap =3D zdd->dpagemap;
> =C2=A0
> =C2=A0	if (devmem) {
> =C2=A0		complete_all(&devmem->detached);
> @@ -133,6 +135,7 @@ static void drm_pagemap_zdd_destroy(struct kref
> *ref)
> =C2=A0			devmem->ops->devmem_release(devmem);
> =C2=A0	}
> =C2=A0	kfree(zdd);
> +	drm_pagemap_put(dpagemap);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -484,42 +487,113 @@ static int
> drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> =C2=A0	return -ENOMEM;
> =C2=A0}
> =C2=A0
> +/**
> + * struct drm_pagemap_dev_hold - Struct to aid in drm_device
> release.
> + * @work: work struct for async release.
> + * @drm: drm device to put.
> + *
> + * When a struct drm_pagemap is released, we also need to release
> the
> + * reference it holds on the drm device. However, typically that
> needs
> + * to be done separately from a workqueue that is not removed in the
> + * drm device destructor since that would cause a deadlock flushing
> + * that workqueue. Each time a struct drm_pagemap is initialized
> + * (or re-initialized if cached) therefore allocate a separate work
> + * item using this struct, from which we put the drm device and
> + * associated module.
> + */
> +struct drm_pagemap_dev_hold {
> +	struct work_struct work;
> +	struct drm_device *drm;
> +};
> +
> =C2=A0static void drm_pagemap_release(struct kref *ref)
> =C2=A0{
> =C2=A0	struct drm_pagemap *dpagemap =3D container_of(ref,
> typeof(*dpagemap), ref);
> +	struct drm_pagemap_dev_hold *dev_hold =3D dpagemap->dev_hold;
> =C2=A0
> -	kfree(dpagemap);
> +	dpagemap->ops->destroy(dpagemap);
> +	schedule_work(&dev_hold->work);
> +}
> +
> +static void drm_pagemap_dev_unhold_work(struct work_struct *work)
> +{
> +	struct drm_pagemap_dev_hold *dev_hold =3D
> +		container_of(work, typeof(*dev_hold), work);
> +	struct drm_device *drm =3D dev_hold->drm;
> +	struct module *module =3D drm->driver->fops->owner;
> +
> +	drm_dev_put(drm);
> +	module_put(module);
> +	kfree(dev_hold);
> +}
> +
> +static struct drm_pagemap_dev_hold *
> +drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
> +{
> +	struct drm_pagemap_dev_hold *dev_hold;
> +	struct drm_device *drm =3D dpagemap->drm;
> +
> +	dev_hold =3D kzalloc(sizeof(*dev_hold), GFP_KERNEL);
> +	if (!dev_hold)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_WORK(&dev_hold->work, drm_pagemap_dev_unhold_work);
> +	dev_hold->drm =3D drm;
> +	(void)try_module_get(drm->driver->fops->owner);
> +	drm_dev_get(drm);
> +
> +	return dev_hold;
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - * drm_pagemap_create() - Create a struct drm_pagemap.
> - * @dev: Pointer to a struct device providing the device-private
> memory.
> - * @pagemap: Pointer to a pre-setup struct dev_pagemap providing the
> struct pages.
> - * @ops: Pointer to the struct drm_pagemap_ops.
> + * drm_pagemap_reinit() - Reinitialize a drm_pagemap
> + * @dpagemap: The drm_pagemap to reinitialize
> =C2=A0 *
> - * Allocate and initialize a struct drm_pagemap.
> + * Reinitialize a drm_pagemap, for which drm_pagemap_release
> + * has already been called. This interface is intended for the
> + * situation where the driver caches a destroyed drm_pagemap.
> =C2=A0 *
> - * Return: A refcounted pointer to a struct drm_pagemap on success.
> - * Error pointer on error.
> + * Return: 0 on success, negative error code on failure.
> =C2=A0 */
> -struct drm_pagemap *
> -drm_pagemap_create(struct device *dev,
> -		=C2=A0=C2=A0 struct dev_pagemap *pagemap,
> -		=C2=A0=C2=A0 const struct drm_pagemap_ops *ops)
> +int drm_pagemap_reinit(struct drm_pagemap *dpagemap)
> =C2=A0{
> -	struct drm_pagemap *dpagemap =3D kzalloc(sizeof(*dpagemap),
> GFP_KERNEL);
> +	dpagemap->dev_hold =3D drm_pagemap_dev_hold(dpagemap);
> +	if (IS_ERR(dpagemap->dev_hold))
> +		return PTR_ERR(dpagemap->dev_hold);
> =C2=A0
> -	if (!dpagemap)
> -		return ERR_PTR(-ENOMEM);
> +	kref_init(&dpagemap->ref);
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_pagemap_reinit);
> =C2=A0
> +/**
> + * drm_pagemap_init() - Initialize a pre-allocated drm_pagemap
> + * @dpagemap: The drm_pagemap to initialize.
> + * @pagemap: The associated dev_pagemap providing the device
> + * private pages.
> + * @drm: The drm device. The drm_pagemap holds a reference on the
> + * drm_device and the module owning the drm_device until
> + * drm_pagemap_release(). This facilitates drm_pagemap exporting.
> + * @ops: The drm_pagemap ops.
> + *
> + * Initialize and take an initial reference on a drm_pagemap.
> + * After successful return, use drm_pagemap_put() to destroy.
> + *
> + ** Return: 0 on success, negative error code on error.
> + */
> +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap *pagemap,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *drm,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_ops *ops)
> +{
> =C2=A0	kref_init(&dpagemap->ref);
> -	dpagemap->dev =3D dev;
> =C2=A0	dpagemap->ops =3D ops;
> =C2=A0	dpagemap->pagemap =3D pagemap;
> +	dpagemap->drm =3D drm;
> =C2=A0
> -	return dpagemap;
> +	return drm_pagemap_reinit(dpagemap);
> =C2=A0}
> -EXPORT_SYMBOL(drm_pagemap_create);
> +EXPORT_SYMBOL(drm_pagemap_init);
> =C2=A0
> =C2=A0/**
> =C2=A0 * drm_pagemap_put() - Put a struct drm_pagemap reference
> @@ -530,7 +604,8 @@ EXPORT_SYMBOL(drm_pagemap_create);
> =C2=A0 */
> =C2=A0void drm_pagemap_put(struct drm_pagemap *dpagemap)
> =C2=A0{
> -	kref_put(&dpagemap->ref, drm_pagemap_release);
> +	if (dpagemap)
> +		kref_put(&dpagemap->ref, drm_pagemap_release);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_pagemap_put);
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 64f9c936eea0..390f90fbd366 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -55,6 +55,8 @@ static struct ttm_placement sys_placement =3D {
> =C2=A0	.placement =3D &sys_placement_flags,
> =C2=A0};
> =C2=A0
> +static struct ttm_placement purge_placement;
> +
> =C2=A0static const struct ttm_place tt_placement_flags[] =3D {
> =C2=A0	{
> =C2=A0		.fpfn =3D 0,
> @@ -281,6 +283,8 @@ int xe_bo_placement_for_flags(struct xe_device
> *xe, struct xe_bo *bo,
> =C2=A0static void xe_evict_flags(struct ttm_buffer_object *tbo,
> =C2=A0			=C2=A0=C2=A0 struct ttm_placement *placement)
> =C2=A0{
> +	struct xe_device *xe =3D container_of(tbo->bdev, typeof(*xe),
> ttm);
> +	bool device_unplugged =3D drm_dev_is_unplugged(&xe->drm);
> =C2=A0	struct xe_bo *bo;
> =C2=A0
> =C2=A0	if (!xe_bo_is_xe_bo(tbo)) {
> @@ -290,7 +294,7 @@ static void xe_evict_flags(struct
> ttm_buffer_object *tbo,
> =C2=A0			return;
> =C2=A0		}
> =C2=A0
> -		*placement =3D sys_placement;
> +		*placement =3D device_unplugged ? purge_placement :
> sys_placement;
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> @@ -300,6 +304,11 @@ static void xe_evict_flags(struct
> ttm_buffer_object *tbo,
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> +	if (device_unplugged && !tbo->base.dma_buf) {
> +		*placement =3D purge_placement;
> +		return;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * For xe, sg bos that are evicted to system just triggers a
> =C2=A0	 * rebind of the sg list upon subsequent validation to
> XE_PL_TT.
> @@ -657,11 +666,20 @@ static int xe_bo_move_dmabuf(struct
> ttm_buffer_object *ttm_bo,
> =C2=A0	struct xe_ttm_tt *xe_tt =3D container_of(ttm_bo->ttm, struct
> xe_ttm_tt,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm);
> =C2=A0	struct xe_device *xe =3D ttm_to_xe_device(ttm_bo->bdev);
> +	bool device_unplugged =3D drm_dev_is_unplugged(&xe->drm);
> =C2=A0	struct sg_table *sg;
> =C2=A0
> =C2=A0	xe_assert(xe, attach);
> =C2=A0	xe_assert(xe, ttm_bo->ttm);
> =C2=A0
> +	if (device_unplugged && new_res->mem_type =3D=3D XE_PL_SYSTEM &&
> +	=C2=A0=C2=A0=C2=A0 ttm_bo->sg) {
> +		dma_resv_wait_timeout(ttm_bo->base.resv,
> DMA_RESV_USAGE_BOOKKEEP,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false, MAX_SCHEDULE_TIMEOUT);
> +		dma_buf_unmap_attachment(attach, ttm_bo->sg,
> DMA_BIDIRECTIONAL);
> +		ttm_bo->sg =3D NULL;
> +	}
> +
> =C2=A0	if (new_res->mem_type =3D=3D XE_PL_SYSTEM)
> =C2=A0		goto out;
> =C2=A0
> @@ -2945,6 +2963,39 @@ void
> xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
> =C2=A0	list_del_init(&bo->vram_userfault_link);
> =C2=A0}
> =C2=A0
> +/**
> + * xe_bo_remove() - Handle bos when the pci_device is about to be
> removed
> + * @xe: The xe device.
> + *
> + * On pci_device removal we need to drop all dma mappings and move
> + * the data of exported bos out to system. This includes SVM bos and
> + * exported dma-buf bos. This is done by evicting all bos, but
> + * the evict placement in xe_evict_flags() is chosen such that all
> + * bos except those mentioned are purged, and thus their memory
> + * is released.
> + *
> + * Pinned bos are not handled, though. Ideally they should be
> released
> + * using devm_ actions.
> + */
> +void xe_bo_remove(struct xe_device *xe)
> +{
> +	unsigned int mem_type;
> +	int ret;
> +
> +	/*
> +	 * Move pagemap bos and exported dma-buf to system.
> +	 */
> +	for (mem_type =3D XE_PL_VRAM1; mem_type >=3D XE_PL_TT; --
> mem_type) {
> +		struct ttm_resource_manager *man =3D
> +			ttm_manager_type(&xe->ttm, mem_type);
> +
> +		if (man) {
> +			ret =3D ttm_resource_manager_evict_all(&xe-
> >ttm, man);
> +			drm_WARN_ON(&xe->drm, ret);
> +		}
> +	}
> +}
> +
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> =C2=A0#include "tests/xe_bo.c"
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index bda3fdd408da..22b1c63f9311 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -405,6 +405,8 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx,
> struct ttm_buffer_object *bo,
> =C2=A0		=C2=A0 const struct xe_bo_shrink_flags flags,
> =C2=A0		=C2=A0 unsigned long *scanned);
> =C2=A0
> +void xe_bo_remove(struct xe_device *xe);
> +
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> =C2=A0/**
> =C2=A0 * xe_bo_is_mem_type - Whether the bo currently resides in the give=
n
> diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> index b2f656b2a563..68de09db9ad5 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -54,6 +54,7 @@
> =C2=A0#include "xe_query.h"
> =C2=A0#include "xe_shrinker.h"
> =C2=A0#include "xe_sriov.h"
> +#include "xe_svm.h"
> =C2=A0#include "xe_tile.h"
> =C2=A0#include "xe_ttm_stolen_mgr.h"
> =C2=A0#include "xe_ttm_sys_mgr.h"
> @@ -925,6 +926,10 @@ void xe_device_remove(struct xe_device *xe)
> =C2=A0	xe_display_unregister(xe);
> =C2=A0
> =C2=A0	drm_dev_unplug(&xe->drm);
> +
> +	xe_bo_remove(xe);
> +
> +	xe_pagemaps_remove(xe);
> =C2=A0}
> =C2=A0
> =C2=A0void xe_device_shutdown(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> index 40c6f88f5933..41ba05ae4cd5 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -110,19 +110,21 @@ struct xe_vram_region {
> =C2=A0	/** @ttm: VRAM TTM manager */
> =C2=A0	struct xe_ttm_vram_mgr ttm;
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> -	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> -	struct dev_pagemap pagemap;
> -	/**
> -	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE
> memory
> -	 * pages of this tile.
> -	 */
> -	struct drm_pagemap *dpagemap;
> -	/**
> -	 * @hpa_base: base host physical address
> -	 *
> -	 * This is generated when remap device memory as ZONE_DEVICE
> -	 */
> -	resource_size_t hpa_base;
> +	/** @pagemap_cache: Cached struct xe_pagemap for this memory
> region's memory. */
> +	struct xe_pagemap_cache {
> +		/** @pagemap_cache.pagemap_mutex: Protects
> @pagemap_cache.xpagemap. */
> +		struct mutex mutex;
> +		/** @pagemap_cache.xpagemap: Pointer to a struct
> xe_pagemap */
> +		struct xe_pagemap *xpagemap;
> +		/**
> +		 * @pagemap_cache.queued: Completed when=C2=A0
> @pagemap_cache.xpagemap is queued
> +		 * for destruction.
> +		 * There's a short interval in between
> @pagemap_cache.xpagemap's refcount
> +		 * dropping to zero and when it's queued for
> destruction and
> +		 * the destruction job can be canceled.
> +		 */
> +		struct completion queued;
> +	} pagemap_cache;
> =C2=A0#endif
> =C2=A0};
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 37e1607052ed..c49bcfea5644 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -4,6 +4,8 @@
> =C2=A0 */
> =C2=A0
> =C2=A0#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_pagemap.h>
> =C2=A0
> =C2=A0#include "xe_bo.h"
> =C2=A0#include "xe_gt_tlb_invalidation.h"
> @@ -17,6 +19,8 @@
> =C2=A0#include "xe_vm.h"
> =C2=A0#include "xe_vm_types.h"
> =C2=A0
> +static int xe_svm_get_pagemaps(struct xe_vm *vm);
> +
> =C2=A0static bool xe_svm_range_in_vram(struct xe_svm_range *range)
> =C2=A0{
> =C2=A0	/* Not reliable without notifier lock */
> @@ -345,28 +349,35 @@ static void
> xe_svm_garbage_collector_work_func(struct work_struct *w)
> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> =C2=A0
> -static struct xe_vram_region *page_to_vr(struct page *page)
> +static struct xe_vram_region *xe_pagemap_to_vr(struct xe_pagemap
> *xpagemap)
> =C2=A0{
> -	return container_of(page->pgmap, struct xe_vram_region,
> pagemap);
> +	return xpagemap->vr;
> =C2=A0}
> =C2=A0
> -static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
> +static struct xe_pagemap *xe_page_to_pagemap(struct page *page)
> =C2=A0{
> -	return container_of(vr, struct xe_tile, mem.vram);
> +	return container_of(page->pgmap, struct xe_pagemap,
> pagemap);
> =C2=A0}
> =C2=A0
> -static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct page *page)
> +static struct xe_vram_region *xe_page_to_vr(struct page *page)
> =C2=A0{
> -	u64 dpa;
> -	struct xe_tile *tile =3D vr_to_tile(vr);
> +	return xe_pagemap_to_vr(xe_page_to_pagemap(page));
> +}
> +
> +static u64 xe_page_to_dpa(struct page *page)
> +{
> +	struct xe_pagemap *xpagemap =3D xe_page_to_pagemap(page);
> +	struct xe_vram_region *vr =3D xe_pagemap_to_vr(xpagemap);
> +	struct xe_tile *tile =3D xe_vr_to_tile(vr);
> +	u64 hpa_base =3D xpagemap->hpa_base;
> =C2=A0	u64 pfn =3D page_to_pfn(page);
> =C2=A0	u64 offset;
> +	u64 dpa;
> =C2=A0
> =C2=A0	xe_tile_assert(tile, is_device_private_page(page));
> -	xe_tile_assert(tile, (pfn << PAGE_SHIFT) >=3D vr->hpa_base);
> +	xe_tile_assert(tile, (pfn << PAGE_SHIFT) >=3D hpa_base);
> =C2=A0
> -	offset =3D (pfn << PAGE_SHIFT) - vr->hpa_base;
> +	offset =3D (pfn << PAGE_SHIFT) - hpa_base;
> =C2=A0	dpa =3D vr->dpa_base + offset;
> =C2=A0
> =C2=A0	return dpa;
> @@ -413,10 +424,10 @@ static int xe_svm_copy(struct page **pages,
> dma_addr_t *dma_addr,
> =C2=A0			continue;
> =C2=A0
> =C2=A0		if (!vr && spage) {
> -			vr =3D page_to_vr(spage);
> -			tile =3D vr_to_tile(vr);
> +			vr =3D xe_page_to_vr(spage);
> +			tile =3D xe_vr_to_tile(vr);
> =C2=A0		}
> -		XE_WARN_ON(spage && page_to_vr(spage) !=3D vr);
> +		XE_WARN_ON(spage && xe_page_to_vr(spage) !=3D vr);
> =C2=A0
> =C2=A0		/*
> =C2=A0		 * CPU page and device page valid, capture physical
> address on
> @@ -424,7 +435,7 @@ static int xe_svm_copy(struct page **pages,
> dma_addr_t *dma_addr,
> =C2=A0		 * device pages.
> =C2=A0		 */
> =C2=A0		if (dma_addr[i] && spage) {
> -			__vram_addr =3D xe_vram_region_page_to_dpa(vr,
> spage);
> +			__vram_addr =3D xe_page_to_dpa(spage);
> =C2=A0			if (vram_addr =3D=3D XE_VRAM_ADDR_INVALID) {
> =C2=A0				vram_addr =3D __vram_addr;
> =C2=A0				pos =3D i;
> @@ -547,12 +558,12 @@ static void xe_svm_devmem_release(struct
> drm_pagemap_devmem *devmem_allocation)
> =C2=A0
> =C2=A0static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64
> offset)
> =C2=A0{
> -	return PHYS_PFN(offset + vr->hpa_base);
> +	return PHYS_PFN(offset + vr->pagemap_cache.xpagemap-
> >hpa_base);
> =C2=A0}
> =C2=A0
> =C2=A0static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
> =C2=A0{
> -	return &tile->mem.vram.ttm.mm;
> +	return &xe_tile_to_vr(tile)->ttm.mm;
> =C2=A0}
> =C2=A0
> =C2=A0static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem
> *devmem_allocation,
> @@ -566,7 +577,7 @@ static int xe_svm_populate_devmem_pfn(struct
> drm_pagemap_devmem *devmem_allocati
> =C2=A0
> =C2=A0	list_for_each_entry(block, blocks, link) {
> =C2=A0		struct xe_vram_region *vr =3D block->private;
> -		struct xe_tile *tile =3D vr_to_tile(vr);
> +		struct xe_tile *tile =3D xe_vr_to_tile(vr);
> =C2=A0		struct drm_buddy *buddy =3D tile_to_buddy(tile);
> =C2=A0		u64 block_pfn =3D block_offset_to_pfn(vr,
> drm_buddy_block_offset(block));
> =C2=A0		int i;
> @@ -585,6 +596,11 @@ static const struct drm_pagemap_devmem_ops
> dpagemap_devmem_ops =3D {
> =C2=A0	.copy_to_ram =3D xe_svm_copy_to_ram,
> =C2=A0};
> =C2=A0
> +#else
> +static int xe_svm_get_pagemaps(struct xe_vm *vm)
> +{
> +	return 0;
> +}
> =C2=A0#endif
> =C2=A0
> =C2=A0static const struct drm_gpusvm_ops gpusvm_ops =3D {
> @@ -599,6 +615,26 @@ static const unsigned long fault_chunk_sizes[] =3D
> {
> =C2=A0	SZ_4K,
> =C2=A0};
> =C2=A0
> +static void xe_pagemap_put(struct xe_pagemap *xpagemap)
> +{
> +	drm_pagemap_put(&xpagemap->dpagemap);
> +}
> +
> +static void xe_svm_put_pagemaps(struct xe_vm *vm)
> +{
> +	struct xe_device *xe =3D vm->xe;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_pagemap *xpagemap =3D vm->svm.pagemaps[id];
> +
> +		if (xpagemap)
> +			xe_pagemap_put(xpagemap);
> +		vm->svm.pagemaps[id] =3D NULL;
> +	}
> +}
> +
> =C2=A0/**
> =C2=A0 * xe_svm_init() - SVM initialize
> =C2=A0 * @vm: The VM.
> @@ -616,13 +652,19 @@ int xe_svm_init(struct xe_vm *vm)
> =C2=A0	INIT_WORK(&vm->svm.garbage_collector.work,
> =C2=A0		=C2=A0 xe_svm_garbage_collector_work_func);
> =C2=A0
> +	err =3D xe_svm_get_pagemaps(vm);
> +	if (err)
> +		return err;
> +
> =C2=A0	err =3D drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe-
> >drm,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 current->mm, xe_svm_devm_owner(vm=
-
> >xe), 0,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm->size,
> xe_modparam.svm_notifier_size * SZ_1M,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &gpusvm_ops, fault_chunk_sizes,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(fault_chunk_sizes));
> -	if (err)
> +	if (err) {
> +		xe_svm_put_pagemaps(vm);
> =C2=A0		return err;
> +	}
> =C2=A0
> =C2=A0	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
> =C2=A0
> @@ -639,6 +681,7 @@ void xe_svm_close(struct xe_vm *vm)
> =C2=A0{
> =C2=A0	xe_assert(vm->xe, xe_vm_is_closed(vm));
> =C2=A0	flush_work(&vm->svm.garbage_collector.work);
> +	xe_svm_put_pagemaps(vm);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -661,20 +704,16 @@ static bool xe_svm_range_is_valid(struct
> xe_svm_range *range,
> =C2=A0}
> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> -static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
> -{
> -	return &tile->mem.vram;
> -}
> =C2=A0
> =C2=A0static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long start, unsigned
> long end,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mm_struct *mm)
> =C2=A0{
> -	struct xe_tile *tile =3D container_of(dpagemap->pagemap,
> typeof(*tile),
> -					=C2=A0=C2=A0=C2=A0 mem.vram.pagemap);
> +	struct xe_pagemap *xpagemap =3D container_of(dpagemap,
> typeof(*xpagemap), dpagemap);
> +	struct xe_vram_region *vr =3D xe_pagemap_to_vr(xpagemap);
> +	struct xe_tile *tile =3D xe_vr_to_tile(vr);
> =C2=A0	struct xe_device *xe =3D tile_to_xe(tile);
> =C2=A0	struct device *dev =3D xe->drm.dev;
> -	struct xe_vram_region *vr =3D tile_to_vr(tile);
> =C2=A0	struct drm_buddy_block *block;
> =C2=A0	struct list_head *blocks;
> =C2=A0	struct xe_bo *bo;
> @@ -700,7 +739,7 @@ static int xe_drm_pagemap_populate_mm(struct
> drm_pagemap *dpagemap,
> =C2=A0
> =C2=A0	drm_pagemap_devmem_init(&bo->devmem_allocation, dev, mm,
> =C2=A0				&dpagemap_devmem_ops,
> -				tile->mem.vram.dpagemap,
> +				dpagemap,
> =C2=A0				end - start);
> =C2=A0
> =C2=A0	blocks =3D &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)-
> >blocks;
> @@ -896,12 +935,12 @@ xe_drm_pagemap_device_map(struct drm_pagemap
> *dpagemap,
> =C2=A0			=C2=A0 unsigned int order,
> =C2=A0			=C2=A0 enum dma_data_direction dir)
> =C2=A0{
> -	struct device *pgmap_dev =3D dpagemap->dev;
> +	struct device *pgmap_dev =3D dpagemap->drm->dev;
> =C2=A0	enum drm_interconnect_protocol prot;
> =C2=A0	dma_addr_t addr;
> =C2=A0
> =C2=A0	if (pgmap_dev =3D=3D dev) {
> -		addr =3D xe_vram_region_page_to_dpa(page_to_vr(page),
> page);
> +		addr =3D xe_page_to_dpa(page);
> =C2=A0		prot =3D XE_INTERCONNECT_VRAM;
> =C2=A0	} else {
> =C2=A0		addr =3D DMA_MAPPING_ERROR;
> @@ -911,73 +950,306 @@ xe_drm_pagemap_device_map(struct drm_pagemap
> *dpagemap,
> =C2=A0	return drm_pagemap_device_addr_encode(addr, prot, order,
> dir);
> =C2=A0}
> =C2=A0
> +static void xe_pagemap_fini(struct xe_pagemap *xpagemap)
> +{
> +	struct dev_pagemap *pagemap =3D &xpagemap->pagemap;
> +	struct device *dev =3D xpagemap->dpagemap.drm->dev;
> +
> +	WRITE_ONCE(xpagemap->unplugged, true);
> +	if (xpagemap->hpa_base) {
> +		devm_memunmap_pages(dev, pagemap);
> +		xpagemap->hpa_base =3D 0;
> +	}
> +
> +	if (pagemap->range.start) {
> +		devm_release_mem_region(dev, pagemap->range.start,
> +					pagemap->range.end -
> pagemap->range.start + 1);
> +		pagemap->range.start =3D 0;
> +	}
> +}
> +
> +static void xe_pagemap_destroy_work(struct work_struct *work)
> +{
> +	struct xe_pagemap *xpagemap =3D container_of(work,
> typeof(*xpagemap), destroy_work.work);
> +	struct xe_pagemap_cache *cache =3D xpagemap->cache;
> +
> +	mutex_lock(&cache->mutex);
> +	if (cache->xpagemap =3D=3D xpagemap)
> +		cache->xpagemap =3D NULL;
> +	mutex_unlock(&cache->mutex);
> +
> +	xe_pagemap_fini(xpagemap);
> +	kfree(xpagemap);
> +}
> +
> +static void xe_pagemap_destroy(struct drm_pagemap *dpagemap)
> +{
> +	struct xe_pagemap *xpagemap =3D container_of(dpagemap,
> typeof(*xpagemap), dpagemap);
> +	struct xe_device *xe =3D to_xe_device(dpagemap->drm);
> +
> +	/* Keep the pagemap cached for 5s, unless the device is
> unplugged. */
> +	queue_delayed_work(xe->unordered_wq, &xpagemap-
> >destroy_work,
> +			=C2=A0=C2=A0 READ_ONCE(xpagemap->unplugged) ? 0 :
> secs_to_jiffies(5));
> +
> +	complete_all(&xpagemap->cache->queued);
> +}
> +
> =C2=A0static const struct drm_pagemap_ops xe_drm_pagemap_ops =3D {
> =C2=A0	.device_map =3D xe_drm_pagemap_device_map,
> =C2=A0	.populate_mm =3D xe_drm_pagemap_populate_mm,
> +	.destroy =3D xe_pagemap_destroy,
> =C2=A0};
> =C2=A0
> =C2=A0/**
> - * xe_devm_add: Remap and provide memmap backing for device memory
> - * @tile: tile that the memory region belongs to
> - * @vr: vram memory region to remap
> + * xe_pagemap_create() - Create a struct xe_pagemap object
> + * @xe: The xe device.
> + * @cache: Back-pointer to the struct xe_pagemap_cache.
> + * @vr: Back-pointer to the struct xe_vram_region.
> =C2=A0 *
> - * This remap device memory to host physical address space and
> create
> - * struct page to back device memory
> + * Allocate and initialize a struct xe_pagemap. On successful
> + * return, drm_pagemap_put() on the embedded struct drm_pagemap
> + * should be used to unreference.
> =C2=A0 *
> - * Return: 0 on success standard error code otherwise
> + * Return: Pointer to a struct xe_pagemap if successful. Error
> pointer
> + * on failure.
> =C2=A0 */
> -int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
> +struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct
> xe_pagemap_cache *cache,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct xe_vram_region *vr)
> =C2=A0{
> -	struct xe_device *xe =3D tile_to_xe(tile);
> -	struct device *dev =3D &to_pci_dev(xe->drm.dev)->dev;
> +	struct device *dev =3D xe->drm.dev;
> +	struct xe_pagemap *xpagemap;
> +	struct dev_pagemap *pagemap;
> +	struct drm_pagemap *dpagemap;
> =C2=A0	struct resource *res;
> =C2=A0	void *addr;
> -	int ret;
> +	int err;
> +
> +	xpagemap =3D kzalloc(sizeof(*xpagemap), GFP_KERNEL);
> +	if (!xpagemap)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pagemap =3D &xpagemap->pagemap;
> +	dpagemap =3D &xpagemap->dpagemap;
> +	INIT_DELAYED_WORK(&xpagemap->destroy_work,
> xe_pagemap_destroy_work);
> +	xpagemap->cache =3D cache;
> +	xpagemap->vr =3D vr;
> +
> +	err =3D drm_pagemap_init(dpagemap, pagemap, &xe->drm,
> &xe_drm_pagemap_ops);
> +	if (err)
> +		goto out_no_dpagemap;
> =C2=A0
> =C2=A0	res =3D devm_request_free_mem_region(dev, &iomem_resource,
> =C2=A0					=C2=A0=C2=A0 vr->usable_size);
> =C2=A0	if (IS_ERR(res)) {
> -		ret =3D PTR_ERR(res);
> -		return ret;
> +		err =3D PTR_ERR(res);
> +		goto out_err;
> =C2=A0	}
> =C2=A0
> -	vr->dpagemap =3D drm_pagemap_create(dev, &vr->pagemap,
> -					=C2=A0 &xe_drm_pagemap_ops);
> -	if (IS_ERR(vr->dpagemap)) {
> -		drm_err(&xe->drm, "Failed to create drm_pagemap tile
> %d memory: %pe\n",
> -			tile->id, vr->dpagemap);
> -		ret =3D PTR_ERR(vr->dpagemap);
> -		goto out_no_dpagemap;
> -	}
> -
> -	vr->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> -	vr->pagemap.range.start =3D res->start;
> -	vr->pagemap.range.end =3D res->end;
> -	vr->pagemap.nr_range =3D 1;
> -	vr->pagemap.ops =3D drm_pagemap_pagemap_ops_get();
> -	vr->pagemap.owner =3D xe_svm_devm_owner(xe);
> -	addr =3D devm_memremap_pages(dev, &vr->pagemap);
> +	pagemap->type =3D MEMORY_DEVICE_PRIVATE;
> +	pagemap->range.start =3D res->start;
> +	pagemap->range.end =3D res->end;
> +	pagemap->nr_range =3D 1;
> +	pagemap->owner =3D xe_svm_devm_owner(xe);
> +	pagemap->ops =3D drm_pagemap_pagemap_ops_get();
> +	addr =3D devm_memremap_pages(dev, pagemap);
> =C2=A0	if (IS_ERR(addr)) {
> -		ret =3D PTR_ERR(addr);
> -		drm_err(&xe->drm, "Failed to remap tile %d memory,
> errno %pe\n",
> -			tile->id, ERR_PTR(ret));
> -		goto out_failed_memremap;
> +		err =3D PTR_ERR(addr);
> +		goto out_err;
> =C2=A0	}
> -	vr->hpa_base =3D res->start;
> +	xpagemap->hpa_base =3D res->start;
> +	return xpagemap;
> =C2=A0
> -	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm,
> remapped to %pr\n",
> -		tile->id, vr->io_start, vr->io_start + vr-
> >usable_size, res);
> -	return 0;
> +out_err:
> +	drm_pagemap_put(dpagemap);
> +	return ERR_PTR(err);
> =C2=A0
> -out_failed_memremap:
> -	drm_pagemap_put(vr->dpagemap);
> =C2=A0out_no_dpagemap:
> -	devm_release_mem_region(dev, res->start,
> resource_size(res));
> -	return ret;
> +	kfree(xpagemap);
> +	return ERR_PTR(err);
> =C2=A0}
> -#else
> -int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
> +
> +static struct xe_pagemap *
> +xe_pagemap_find_or_create(struct xe_device *xe, struct
> xe_pagemap_cache *cache,
> +			=C2=A0 struct xe_vram_region *vr);
> +
> +static int xe_svm_get_pagemaps(struct xe_vm *vm)
> =C2=A0{
> +	struct xe_device *xe =3D vm->xe;
> +	struct xe_pagemap *xpagemap;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_vram_region *vr;
> +
> +		if (!((BIT(id) << 1) & xe->info.mem_region_mask))
> +			continue;
> +
> +		vr =3D xe_tile_to_vr(tile);
> +		xpagemap =3D xe_pagemap_find_or_create(xe, &vr-
> >pagemap_cache, vr);
> +		if (IS_ERR(xpagemap))
> +			break;
> +		vm->svm.pagemaps[id] =3D xpagemap;
> +	}
> +
> +	if (IS_ERR(xpagemap)) {
> +		xe_svm_put_pagemaps(vm);
> +		return PTR_ERR(xpagemap);
> +	}
> +
> =C2=A0	return 0;
> =C2=A0}
> +
> +/**
> + * xe_pagemaps_remove() - Device remove work for the xe pagemaps
> + * @xe: The xe device
> + *
> + * This function needs to be run as part of the device remove
> (unplug)
> + * sequence to ensure that divice-private pages allocated using the
> + * xe pagemaps are not used anymore and that the dev_pagemaps are
> + * unregistered.
> + *
> + * The function needs to be called *after* the call to
> drm_dev_unplug()
> + * to ensure any calls to drm_pagemap_populate_mm() will return -
> ENODEV.
> + *
> + * Note that the pagemaps' references to the drm device and hence
> the
> + * xe device will remain until the pagemaps are destroyed.
> + */
> +void xe_pagemaps_remove(struct xe_device *xe)
> +{
> +	unsigned int id, mem_type;
> +	struct xe_tile *tile;
> +	int ret;
> +
> +	/* Migrate all PTEs of this pagemap to system */
> +	for (mem_type =3D XE_PL_VRAM1; mem_type >=3D XE_PL_TT; --
> mem_type) {
> +		struct ttm_resource_manager *man =3D
> +			ttm_manager_type(&xe->ttm, mem_type);
> +
> +		if (man) {
> +			ret =3D ttm_resource_manager_evict_all(&xe-
> >ttm, man);
> +			drm_WARN_ON(&xe->drm, ret);
> +		}
> +	}
> +
> +	/* Remove the device pages themselves */
> +	for_each_tile(tile, xe, id) {
> +		struct xe_pagemap_cache *cache;
> +
> +		if (!((BIT(id) << 1) & xe->info.mem_region_mask))
> +			continue;
> +
> +		cache =3D &tile->mem.vram.pagemap_cache;
> +		mutex_lock(&cache->mutex);
> +		if (cache->xpagemap)
> +			xe_pagemap_fini(cache->xpagemap);
> +		/* Nobody can resurrect, since the device is
> unplugged. */
> +		mutex_unlock(&cache->mutex);
> +	}
> +}
> +
> +static void xe_pagemap_cache_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_pagemap_cache *cache =3D arg;
> +	struct xe_pagemap *xpagemap;
> +
> +	wait_for_completion(&cache->queued);
> +	mutex_lock(&cache->mutex);
> +	xpagemap =3D cache->xpagemap;
> +	if (xpagemap && cancel_delayed_work(&xpagemap-
> >destroy_work)) {
> +		mutex_unlock(&cache->mutex);
> +		xe_pagemap_destroy_work(&xpagemap-
> >destroy_work.work);
> +		return;
> +	}
> +	mutex_unlock(&cache->mutex);
> +	flush_workqueue(to_xe_device(drm)->unordered_wq);
> +	mutex_destroy(&cache->mutex);
> +}
> +
> +/**
> + * xe_pagemap_cache_init() - Initialize a struct xe_pagemap_cache
> + * @drm: Pointer to the struct drm_device
> + * @cache: Pointer to a struct xe_pagemap_cache
> + *
> + * Initialize a struct xe_pagemap_cache and if successful, register
> a cleanup
> + * function to be run at xe/drm device destruction.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_pagemap_cache_init(struct drm_device *drm, struct
> xe_pagemap_cache *cache)
> +{
> +	mutex_init(&cache->mutex);
> +	init_completion(&cache->queued);
> +	complete_all(&cache->queued);
> +	return drmm_add_action_or_reset(drm, xe_pagemap_cache_fini,
> cache);
> +}
> +
> +static struct xe_pagemap *xe_pagemap_get_unless_zero(struct
> xe_pagemap *xpagemap)
> +{
> +	return (xpagemap && drm_pagemap_get_unless_zero(&xpagemap-
> >dpagemap)) ? xpagemap : NULL;
> +}
> +
> +/**
> + * xe_pagemap_find_or_create() - Find or create a struct xe_pagemap
> + * @xe: The xe device.
> + * @cache: The struct xe_pagemap_cache.
> + * @vr: The VRAM region.
> + *
> + * Check if there is an already used xe_pagemap for this tile, and
> in that case,
> + * return it.
> + * If not, check if there is a cached xe_pagemap for this tile, and
> in that case,
> + * cancel its destruction, re-initialize it and return it.
> + * Finally if there is no cached or already used pagemap, create one
> and
> + * register it in the tile's pagemap cache.
> + *
> + * Note that this function is typically called from within an IOCTL,
> and waits are
> + * therefore carried out interruptible if possible.
> + *
> + * Return: A pointer to a struct xe_pagemap if successful, Error
> pointer on failure.
> + */
> +static struct xe_pagemap *
> +xe_pagemap_find_or_create(struct xe_device *xe, struct
> xe_pagemap_cache *cache,
> +			=C2=A0 struct xe_vram_region *vr)
> +{
> +	struct xe_pagemap *xpagemap;
> +	int err;
> +
> +	err =3D mutex_lock_interruptible(&cache->mutex);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	xpagemap =3D cache->xpagemap;
> +	if (xpagemap && !xe_pagemap_get_unless_zero(xpagemap)) {
> +		/* Wait for the destroy work to get queued before
> canceling it! */
> +		err =3D wait_for_completion_interruptible(&cache-
> >queued);
> +		if (err) {
> +			mutex_unlock(&cache->mutex);
> +			return ERR_PTR(err);
> +		}
> +
> +		if (cancel_delayed_work(&xpagemap->destroy_work)) {
> +			err =3D drm_pagemap_reinit(&xpagemap-
> >dpagemap);
> +			if (!err) {
> +				reinit_completion(&cache->queued);
> +				goto out_unlock;
> +			}
> +
> +			queue_delayed_work(xe->unordered_wq,
> &xpagemap->destroy_work, 0);
> +		}
> +
> +		cache->xpagemap =3D NULL;
> +		xpagemap =3D NULL;
> +	}
> +	if (!xpagemap) {
> +		xpagemap =3D xe_pagemap_create(xe, cache, vr);
> +		if (IS_ERR(xpagemap))
> +			goto out_unlock;
> +
> +		cache->xpagemap =3D xpagemap;
> +		reinit_completion(&cache->queued);
> +	}
> +out_unlock:
> +	mutex_unlock(&cache->mutex);
> +	return xpagemap;
> +}
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> index c32b6d46ecf1..19469fd91666 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -13,7 +13,11 @@
> =C2=A0
> =C2=A0#define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> =C2=A0
> +struct drm_device;
> +struct drm_file;
> +
> =C2=A0struct xe_bo;
> +struct xe_device;
> =C2=A0struct xe_vram_region;
> =C2=A0struct xe_tile;
> =C2=A0struct xe_vm;
> @@ -45,6 +49,28 @@ struct xe_svm_range {
> =C2=A0	u8 skip_migrate	:1;
> =C2=A0};
> =C2=A0
> +/**
> + * struct xe_pagemap - Manages xe device_private memory for SVM.
> + * @pagemap: The struct dev_pagemap providing the struct pages.
> + * @dpagemap: The drm_pagemap managing allocation and migration.
> + * @destroy_work: Handles asnynchronous destruction and caching.
> + * @hpa_base: The host physical address base for the managemd
> memory.
> + * @cache: Backpointer to the struct xe_pagemap_cache for the memory
> region.
> + * @vr: Backpointer to the xe_vram region.
> + * @unplugged: Advisory only information whether the device owning
> this
> + * pagemap has been unplugged. This field is typically used for
> caching
> + * time determination.
> + */
> +struct xe_pagemap {
> +	struct dev_pagemap pagemap;
> +	struct drm_pagemap dpagemap;
> +	struct delayed_work destroy_work;
> +	resource_size_t hpa_base;
> +	struct xe_pagemap_cache *cache;
> +	struct xe_vram_region *vr;
> +	bool unplugged;
> +};
> +
> =C2=A0/**
> =C2=A0 * xe_svm_range_pages_valid() - SVM range pages valid
> =C2=A0 * @range: SVM range
> @@ -95,11 +121,16 @@ static inline bool
> xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
> =C2=A0#define xe_svm_notifier_unlock(vm__)	\
> =C2=A0	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
> =C2=A0
> +struct xe_pagemap *
> +xe_pagemap_create(struct xe_device *xe, struct xe_pagemap_cache
> *cache,
> +		=C2=A0 struct xe_vram_region *vr);
> +
> =C2=A0#else
> =C2=A0#include <linux/interval_tree.h>
> =C2=A0
> =C2=A0struct drm_pagemap_device_addr;
> =C2=A0struct xe_bo;
> +struct xe_device;
> =C2=A0struct xe_vm;
> =C2=A0struct xe_vma;
> =C2=A0struct xe_tile;
> @@ -178,5 +209,23 @@ static inline void xe_svm_notifier_lock(struct
> xe_vm *vm)
> =C2=A0static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
> =C2=A0{
> =C2=A0}
> +
> =C2=A0#endif
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +
> +int xe_pagemap_cache_init(struct drm_device *drm, struct
> xe_pagemap_cache *cache);
> +
> +void xe_pagemaps_remove(struct xe_device *xe);
> +
> +#else
> +
> +#define xe_pagemap_cache_init(...) 0
> +
> +static inline void xe_pagemaps_remove(struct xe_device *xe)
> +{
> +}
> +
> +#endif
> +
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/xe/xe_tile.c
> b/drivers/gpu/drm/xe/xe_tile.c
> index 0771acbbf367..f5d9d56418ee 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -161,7 +161,6 @@ static int tile_ttm_mgr_init(struct xe_tile
> *tile)
> =C2=A0 */
> =C2=A0int xe_tile_init_noalloc(struct xe_tile *tile)
> =C2=A0{
> -	struct xe_device *xe =3D tile_to_xe(tile);
> =C2=A0	int err;
> =C2=A0
> =C2=A0	err =3D tile_ttm_mgr_init(tile);
> @@ -170,8 +169,9 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
> =C2=A0
> =C2=A0	xe_wa_apply_tile_workarounds(tile);
> =C2=A0
> -	if (xe->info.has_usm && IS_DGFX(xe))
> -		xe_devm_add(tile, &tile->mem.vram);
> +	err =3D xe_pagemap_cache_init(&tile_to_xe(tile)->drm, &tile-
> >mem.vram.pagemap_cache);
> +	if (err)
> +		return err;
> =C2=A0
> =C2=A0	return xe_tile_sysfs_init(tile);
> =C2=A0}
> @@ -188,3 +188,17 @@ void xe_tile_migrate_wait(struct xe_tile *tile)
> =C2=A0{
> =C2=A0	xe_migrate_wait(tile->migrate);
> =C2=A0}
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +/**
> + * xe_tile_local_pagemap() - Return a pointer to the tile's local
> drm_pagemap if any
> + * @tile: The tile.
> + *
> + * Return: A pointer to the tile's local drm_pagemap, or NULL if
> local pagemap
> + * support has been compiled out.
> + */
> +struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile)
> +{
> +	return &xe_tile_to_vr(tile)->pagemap_cache.xpagemap-
> >dpagemap;
> +}
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_tile.h
> b/drivers/gpu/drm/xe/xe_tile.h
> index 1d42b235c322..375b8323cda6 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -8,6 +8,7 @@
> =C2=A0
> =C2=A0#include "xe_device_types.h"
> =C2=A0
> +struct xe_pagemap;
> =C2=A0struct xe_tile;
> =C2=A0
> =C2=A0int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe,
> u8 id);
> @@ -16,11 +17,32 @@ int xe_tile_init(struct xe_tile *tile);
> =C2=A0
> =C2=A0void xe_tile_migrate_wait(struct xe_tile *tile);
> =C2=A0
> -#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> -static inline struct drm_pagemap *xe_tile_local_pagemap(struct
> xe_tile *tile)
> +/**
> + * xe_vr_to_tile() - Return the struct xe_tile pointer from a
> + * struct xe_vram_region pointer.
> + * @vr: The xe_vram_region.
> + *
> + * Return: Pointer to the struct xe_tile embedding *@vr.
> + */
> +static inline struct xe_tile *xe_vr_to_tile(struct xe_vram_region
> *vr)
> =C2=A0{
> -	return tile->mem.vram.dpagemap;
> +	return container_of(vr, struct xe_tile, mem.vram);
> =C2=A0}
> +
> +/**
> + * xe_tile_to_vr() - Return the struct xe_vram_region pointer from a
> + * struct xe_tile pointer
> + * @tile: Pointer to the struct xe_tile.
> + *
> + * Return: Pointer to the struct xe_vram_region embedded in *@tile.
> + */
> +static inline struct xe_vram_region *xe_tile_to_vr(struct xe_tile
> *tile)
> +{
> +	return &tile->mem.vram;
> +}
> +
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +struct drm_pagemap *xe_tile_local_pagemap(struct xe_tile *tile);
> =C2=A0#else
> =C2=A0static inline struct drm_pagemap *xe_tile_local_pagemap(struct
> xe_tile *tile)
> =C2=A0{
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> b/drivers/gpu/drm/xe/xe_vm_types.h
> index 84fa41b9fa20..08baea03df00 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -168,6 +168,7 @@ struct xe_vm {
> =C2=A0			 */
> =C2=A0			struct work_struct work;
> =C2=A0		} garbage_collector;
> +		struct xe_pagemap
> *pagemaps[XE_MAX_TILES_PER_DEVICE];
> =C2=A0	} svm;
> =C2=A0
> =C2=A0	struct xe_device *xe;
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 49f2e0b6c699..9f758a46988a 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -120,6 +120,21 @@ struct drm_pagemap_ops {
> =C2=A0	int (*populate_mm)(struct drm_pagemap *dpagemap,
> =C2=A0			=C2=A0=C2=A0 unsigned long start, unsigned long end,
> =C2=A0			=C2=A0=C2=A0 struct mm_struct *mm);
> +
> +	/**
> +	 * @destroy: Uninitialize a struct drm_pagemap.
> +	 * @dpagemap: The struct drm_pagemap to uninitialize.
> +	 *
> +	 * Uninitialize the drm_pagemap, potentially retaining it in
> +	 * a cache for re-initialization. This callback may be
> called
> +	 * with page locks held and typicall needs to queue any
> +	 * destruction or caching work on a workqueue to avoid
> locking
> +	 * order inversions. Since the drm_pagemap code also may put
> +	 * the owning device immediately after this function is
> called,
> +	 * the drm_pagemap destruction needs to be waited for in
> +	 * the device destruction code.
> +	 */
> +	void (*destroy)(struct drm_pagemap *dpagemap);
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -127,14 +142,16 @@ struct drm_pagemap_ops {
> =C2=A0 * used for device p2p handshaking.
> =C2=A0 * @ops: The struct drm_pagemap_ops.
> =C2=A0 * @ref: Reference count.
> - * @dev: The struct drevice owning the device-private memory.
> + * @drm: The struct drm device owning the device-private memory.
> =C2=A0 * @pagemap: Pointer to the underlying dev_pagemap.
> + * @dev_hold: Pointer to a struct dev_hold for device referencing.
> =C2=A0 */
> =C2=A0struct drm_pagemap {
> =C2=A0	const struct drm_pagemap_ops *ops;
> =C2=A0	struct kref ref;
> -	struct device *dev;
> +	struct drm_device *drm;
> =C2=A0	struct dev_pagemap *pagemap;
> +	struct drm_pagemap_dev_hold *dev_hold;
> =C2=A0};
> =C2=A0
> =C2=A0struct drm_pagemap_devmem;
> @@ -199,26 +216,44 @@ struct drm_pagemap_devmem_ops {
> =C2=A0			=C2=A0=C2=A0 unsigned long npages);
> =C2=A0};
> =C2=A0
> -struct drm_pagemap *drm_pagemap_create(struct device *dev,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap *pagemap,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_ops
> *ops);
> +int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
> +
> +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap *pagemap,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *drm,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_ops *ops);
> =C2=A0
> =C2=A0void drm_pagemap_put(struct drm_pagemap *dpagemap);
> =C2=A0
> =C2=A0/**
> =C2=A0 * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> - * @dpagemap: Pointer to the struct drm_pagemap.
> + * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
> =C2=A0 *
> - * Return: Pointer to the struct drm_pagemap.
> + * Return: Pointer to the struct drm_pagemap, or NULL.
> =C2=A0 */
> =C2=A0static inline struct drm_pagemap *
> =C2=A0drm_pagemap_get(struct drm_pagemap *dpagemap)
> =C2=A0{
> -	kref_get(&dpagemap->ref);
> +	if (likely(dpagemap))
> +		kref_get(&dpagemap->ref);
> =C2=A0
> =C2=A0	return dpagemap;
> =C2=A0}
> =C2=A0
> +/**
> + * drm_pagemap_get_unless_zero() - Obtain a reference on a struct
> drm_pagemap
> + * unless the current reference count is zero.
> + * @dpagemap: Pointer to the drm_pagemap or NULL.
> + *
> + * Return: A pointer to @dpagemap if the reference count was
> successfully
> + * incremented. NULL if @dpagemap was NULL, or its refcount was 0.
> + */
> +static inline struct drm_pagemap *
> +drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
> +{
> +	return (dpagemap && kref_get_unless_zero(&dpagemap->ref)) ?
> dpagemap : NULL;
> +}
> +
> =C2=A0/**
> =C2=A0 * struct drm_pagemap_devmem - Structure representing a GPU SVM
> device memory allocation
> =C2=A0 *
> @@ -257,6 +292,4 @@ void drm_pagemap_devmem_init(struct
> drm_pagemap_devmem *devmem_allocation,
> =C2=A0int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
> =C2=A0			=C2=A0=C2=A0=C2=A0 unsigned long start, unsigned long end,
> =C2=A0			=C2=A0=C2=A0=C2=A0 struct mm_struct *mm);
> -
> =C2=A0#endif
> -

