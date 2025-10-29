Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B59C1B668
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A9510E1F7;
	Wed, 29 Oct 2025 14:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YO0Bxd81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B50910E1F7;
 Wed, 29 Oct 2025 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761749467; x=1793285467;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4hd2sBB1h+1slSiA+09zkbOsLhiOeTEIuMXEIYA9JyU=;
 b=YO0Bxd81iMnStshognuUZvO/4lou7tiuiaTWT+akOOK6mG50OWz7NJh4
 WzmmTUH6s/uSMn0hBW+MRm3hCi2fBH09gNOC7bGotQK08Ffwu0jg3atlv
 5xV9a6rrJ1NAiIFeigh0DenQjE44lo2WjpBbtNioQrlp+8pjAc5oVXNF3
 PqlU20TtpflD3Vw3FaCzLO3i2uDaHjcd4qrTiwsJuqo13/aQ2uXmO8u48
 jVsf4ymw2x+D2vKyVJnsqnrtQjYBuABVhp5lIHX/73Vcj74vcvk4+SY+F
 spwZ8wZuaLBjcXmXr41CvA0uQHSLbeJwsz+ZNSVx2Lv8R4IwtGKZek5gl Q==;
X-CSE-ConnectionGUID: 4Jzy0ygCTC26p52aVFGGKA==
X-CSE-MsgGUID: VjXBOWZHTAOCH/Xaf07Ufg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="66489123"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="66489123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:51:07 -0700
X-CSE-ConnectionGUID: BqSUa/i8TVSmjjThjRyhUA==
X-CSE-MsgGUID: K1p5pRNCSaihHqGrFDZPgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190818974"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.28])
 ([10.245.245.28])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:51:03 -0700
Message-ID: <0c873366b0e56d840687755e50a3c62f38a8b7a1.camel@linux.intel.com>
Subject: Re: [PATCH 01/15] drm/pagemap, drm/xe: Add refcounting to struct
 drm_pagemap
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Wed, 29 Oct 2025 15:51:01 +0100
In-Reply-To: <aQFpwOCqBq+Z21Rg@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-2-thomas.hellstrom@linux.intel.com>
 <aQFpwOCqBq+Z21Rg@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Tue, 2025-10-28 at 18:11 -0700, Matthew Brost wrote:
> On Sat, Oct 25, 2025 at 02:03:58PM +0200, Thomas Hellstr=C3=B6m wrote:
> > With the end goal of being able to free unused pagemaps
> > and allocate them on demand, add a refcount to struct drm_pagemap,
> > remove the xe embedded drm_pagemap, allocating and freeing it
> > explicitly.
> >=20
>=20
> General commit for the series =E2=80=94 could we add some kernel
> documentation,
> ideally in xe_svm.c, that explains the reference counting scheme used
> for drm_pagemap?
>=20
> For example:
>=20
> - An SVM VM holds a drm_pagemap reference to local pagemaps.
> - madvise VMAs hold a reference to the preferred location pagemap.
> - Allocated device pages hold a reference to the pagemap.
> - The pagemap itself holds a reference to the device/module.
>=20
> Reference counting schemes can be difficult to reverse-engineer and
> easy
> to forget, so it would be best to document them clearly.

Sure. Good idea.

/Thomas

>=20
> Matt
>=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 51
> > ++++++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 26 ++++++++++-----
> > =C2=A0drivers/gpu/drm/xe/xe_vram_types.h |=C2=A0 2 +-
> > =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 36 +++++++++++++++++++++
> > =C2=A04 files changed, 106 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > b/drivers/gpu/drm/drm_pagemap.c
> > index 22c44807e3fe..4b8692f0b2a2 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -538,6 +538,57 @@ static int
> > drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> > =C2=A0	return -ENOMEM;
> > =C2=A0}
> > =C2=A0
> > +static void drm_pagemap_release(struct kref *ref)
> > +{
> > +	struct drm_pagemap *dpagemap =3D container_of(ref,
> > typeof(*dpagemap), ref);
> > +
> > +	kfree(dpagemap);
> > +}
> > +
> > +/**
> > + * drm_pagemap_create() - Create a struct drm_pagemap.
> > + * @dev: Pointer to a struct device providing the device-private
> > memory.
> > + * @pagemap: Pointer to a pre-setup struct dev_pagemap providing
> > the struct pages.
> > + * @ops: Pointer to the struct drm_pagemap_ops.
> > + *
> > + * Allocate and initialize a struct drm_pagemap.
> > + *
> > + * Return: A refcounted pointer to a struct drm_pagemap on
> > success.
> > + * Error pointer on error.
> > + */
> > +struct drm_pagemap *
> > +drm_pagemap_create(struct device *dev,
> > +		=C2=A0=C2=A0 struct dev_pagemap *pagemap,
> > +		=C2=A0=C2=A0 const struct drm_pagemap_ops *ops)
> > +{
> > +	struct drm_pagemap *dpagemap =3D kzalloc(sizeof(*dpagemap),
> > GFP_KERNEL);
> > +
> > +	if (!dpagemap)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	kref_init(&dpagemap->ref);
> > +	dpagemap->dev =3D dev;
> > +	dpagemap->ops =3D ops;
> > +	dpagemap->pagemap =3D pagemap;
> > +
> > +	return dpagemap;
> > +}
> > +EXPORT_SYMBOL(drm_pagemap_create);
> > +
> > +/**
> > + * drm_pagemap_put() - Put a struct drm_pagemap reference
> > + * @dpagemap: Pointer to a struct drm_pagemap object.
> > + *
> > + * Puts a struct drm_pagemap reference and frees the drm_pagemap
> > object
> > + * if the refount reaches zero.
> > + */
> > +void drm_pagemap_put(struct drm_pagemap *dpagemap)
> > +{
> > +	if (likely(dpagemap))
> > +		kref_put(&dpagemap->ref, drm_pagemap_release);
> > +}
> > +EXPORT_SYMBOL(drm_pagemap_put);
> > +
> > =C2=A0/**
> > =C2=A0 * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
> > =C2=A0 * @devmem_allocation: Pointer to the device memory allocation
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 129e7818565c..6d2c6c144315 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -861,7 +861,7 @@ static int xe_drm_pagemap_populate_mm(struct
> > drm_pagemap *dpagemap,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mm_struct *mm,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long timeslice_ms)
> > =C2=A0{
> > -	struct xe_vram_region *vr =3D container_of(dpagemap,
> > typeof(*vr), dpagemap);
> > +	struct xe_vram_region *vr =3D container_of(dpagemap-
> > >pagemap, typeof(*vr), pagemap);
> > =C2=A0	struct xe_device *xe =3D vr->xe;
> > =C2=A0	struct device *dev =3D xe->drm.dev;
> > =C2=A0	struct drm_buddy_block *block;
> > @@ -1372,7 +1372,7 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct
> > xe_vm *vm, u64 start, u64 end)
> > =C2=A0
> > =C2=A0static struct drm_pagemap *tile_local_pagemap(struct xe_tile
> > *tile)
> > =C2=A0{
> > -	return &tile->mem.vram->dpagemap;
> > +	return tile->mem.vram->dpagemap;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > @@ -1482,6 +1482,15 @@ int xe_devm_add(struct xe_tile *tile, struct
> > xe_vram_region *vr)
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > +	vr->dpagemap =3D drm_pagemap_create(dev, &vr->pagemap,
> > +					=C2=A0 &xe_drm_pagemap_ops);
> > +	if (IS_ERR(vr->dpagemap)) {
> > +		drm_err(&xe->drm, "Failed to create drm_pagemap
> > tile %d memory: %pe\n",
> > +			tile->id, vr->dpagemap);
> > +		ret =3D PTR_ERR(vr->dpagemap);
> > +		goto out_no_dpagemap;
> > +	}
> > +
> > =C2=A0	vr->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> > =C2=A0	vr->pagemap.range.start =3D res->start;
> > =C2=A0	vr->pagemap.range.end =3D res->end;
> > @@ -1489,22 +1498,23 @@ int xe_devm_add(struct xe_tile *tile,
> > struct xe_vram_region *vr)
> > =C2=A0	vr->pagemap.ops =3D drm_pagemap_pagemap_ops_get();
> > =C2=A0	vr->pagemap.owner =3D xe_svm_devm_owner(xe);
> > =C2=A0	addr =3D devm_memremap_pages(dev, &vr->pagemap);
> > -
> > -	vr->dpagemap.dev =3D dev;
> > -	vr->dpagemap.ops =3D &xe_drm_pagemap_ops;
> > -
> > =C2=A0	if (IS_ERR(addr)) {
> > -		devm_release_mem_region(dev, res->start,
> > resource_size(res));
> > =C2=A0		ret =3D PTR_ERR(addr);
> > =C2=A0		drm_err(&xe->drm, "Failed to remap tile %d memory,
> > errno %pe\n",
> > =C2=A0			tile->id, ERR_PTR(ret));
> > -		return ret;
> > +		goto out_failed_memremap;
> > =C2=A0	}
> > =C2=A0	vr->hpa_base =3D res->start;
> > =C2=A0
> > =C2=A0	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to
> > devm, remapped to %pr\n",
> > =C2=A0		tile->id, vr->io_start, vr->io_start + vr-
> > >usable_size, res);
> > =C2=A0	return 0;
> > +
> > +out_failed_memremap:
> > +	drm_pagemap_put(vr->dpagemap);
> > +out_no_dpagemap:
> > +	devm_release_mem_region(dev, res->start,
> > resource_size(res));
> > +	return ret;
> > =C2=A0}
> > =C2=A0#else
> > =C2=A0int xe_svm_alloc_vram(struct xe_tile *tile,
> > diff --git a/drivers/gpu/drm/xe/xe_vram_types.h
> > b/drivers/gpu/drm/xe/xe_vram_types.h
> > index 83772dcbf1af..c0d2c5ee8c10 100644
> > --- a/drivers/gpu/drm/xe/xe_vram_types.h
> > +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> > @@ -72,7 +72,7 @@ struct xe_vram_region {
> > =C2=A0	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE
> > memory
> > =C2=A0	 * pages of this tile.
> > =C2=A0	 */
> > -	struct drm_pagemap dpagemap;
> > +	struct drm_pagemap *dpagemap;
> > =C2=A0	/**
> > =C2=A0	 * @hpa_base: base host physical address
> > =C2=A0	 *
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > index f6e7e234c089..2c7de928865b 100644
> > --- a/include/drm/drm_pagemap.h
> > +++ b/include/drm/drm_pagemap.h
> > @@ -129,11 +129,15 @@ struct drm_pagemap_ops {
> > =C2=A0 * struct drm_pagemap: Additional information for a struct
> > dev_pagemap
> > =C2=A0 * used for device p2p handshaking.
> > =C2=A0 * @ops: The struct drm_pagemap_ops.
> > + * @ref: Reference count.
> > =C2=A0 * @dev: The struct drevice owning the device-private memory.
> > + * @pagemap: Pointer to the underlying dev_pagemap.
> > =C2=A0 */
> > =C2=A0struct drm_pagemap {
> > =C2=A0	const struct drm_pagemap_ops *ops;
> > +	struct kref ref;
> > =C2=A0	struct device *dev;
> > +	struct dev_pagemap *pagemap;
> > =C2=A0};
> > =C2=A0
> > =C2=A0struct drm_pagemap_devmem;
> > @@ -202,6 +206,37 @@ struct drm_pagemap_devmem_ops {
> > =C2=A0			=C2=A0=C2=A0 unsigned long npages);
> > =C2=A0};
> > =C2=A0
> > +struct drm_pagemap *drm_pagemap_create(struct device *dev,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap
> > *pagemap,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > drm_pagemap_ops *ops);
> > +
> > +#if IS_ENABLED(CONFIG_DRM_GPUSVM)
> > +
> > +void drm_pagemap_put(struct drm_pagemap *dpagemap);
> > +
> > +#else
> > +
> > +static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
> > +{
> > +}
> > +
> > +#endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
> > +
> > +/**
> > + * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> > + * @dpagemap: Pointer to the struct drm_pagemap.
> > + *
> > + * Return: Pointer to the struct drm_pagemap.
> > + */
> > +static inline struct drm_pagemap *
> > +drm_pagemap_get(struct drm_pagemap *dpagemap)
> > +{
> > +	if (likely(dpagemap))
> > +		kref_get(&dpagemap->ref);
> > +
> > +	return dpagemap;
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * struct drm_pagemap_devmem - Structure representing a GPU SVM
> > device memory allocation
> > =C2=A0 *
> > @@ -246,3 +281,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap
> > *dpagemap,
> > =C2=A0			=C2=A0=C2=A0=C2=A0 unsigned long timeslice_ms);
> > =C2=A0
> > =C2=A0#endif
> > +
> > --=20
> > 2.51.0
> >=20

