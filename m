Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5FAC1B642
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF1D10E7DC;
	Wed, 29 Oct 2025 14:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moayzCG/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEF610E1F7;
 Wed, 29 Oct 2025 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761749393; x=1793285393;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oLKa+BkC9q63ry23Dxr1e52bDl08K1Hhied9l9q94Ak=;
 b=moayzCG/96ptHQfNfPHxAD8x5SKcpdMbm1oazG+34GI1/uwZksDJlMwN
 6p1TNMH2cNkSr0Q23gXSbWpN/A4VxeuNRiQXuN/xlEZpxpkef5COCZkOh
 rW2cRuOHy8vGVMGTxOncbJIsuTjjGCZ+V4G5yaer5SxDafBfc2KZGbA/A
 1vha3p9x4ywDghxMT1QdFIEKnER4o7IV/Ta89uQoPCceOF6DjT311g5Wh
 P2AYfBYUHXFyBaDX8NZwb6guRm4H23+9BUsQrmT25/64MMHKabi4rd67e
 5y/SdA2QedoovDKOOJ9wyfxs2qqnOo55c80+aWgnN4nX425WlwXt4sfbW A==;
X-CSE-ConnectionGUID: vEE1fK2ER0CTpRhYe8fRaQ==
X-CSE-MsgGUID: bagqI6WPShmZtVFJpfZ/Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74162304"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="74162304"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:49:53 -0700
X-CSE-ConnectionGUID: AhZikK9OT1ahWrMzFGXvwA==
X-CSE-MsgGUID: PbEhXrLJQBaoS6cv5lso/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="189750973"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.28])
 ([10.245.245.28])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:49:50 -0700
Message-ID: <4e6b06069f77aee5cf7153e0ac0cf1a30c1327a0.camel@linux.intel.com>
Subject: Re: [PATCH 03/15] drm/pagemap, drm/xe: Manage drm_pagemap provider
 lifetimes
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Wed, 29 Oct 2025 15:49:47 +0100
In-Reply-To: <aQFjzTpZwYaytZqB@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-4-thomas.hellstrom@linux.intel.com>
 <aQFjzTpZwYaytZqB@lstrano-desk.jf.intel.com>
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

On Tue, 2025-10-28 at 17:46 -0700, Matthew Brost wrote:
> On Sat, Oct 25, 2025 at 02:04:00PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Even if the drm_pagemap provider has released its reference on
> > the drm_pagemap, references may be held by still active pages.
> > Ensure that we hold a reference on the provider drm device and
> > modules for as long as we might need to use the drm_pagemap ops.
> >=20
>=20
> Just to make sure I=E2=80=99m understanding this correctly =E2=80=94 this=
 is intended
> to
> guard against the devm action [1] running while a device is still
> holding references to another device=E2=80=99s pages, right?
>=20
> [1]
> https://elixir.bootlin.com/linux/v6.17.5/source/kernel/resource.c#L1993

Actually removing the dev_pagemap and its region is allowed while
another device holds a reference on the *drm_pagemap*. For example if
you have two devices. Device 0 executes from the memory of device 1.
Suddenly you feel like offlining / unbinding device 1. When you execute
unbind, the driver evicts all SVM bos and thereby frees all device-
private pages. But device 0 still has a reference to the drm_pagemap,
even if it's unusable: Any VRAM migration trying to use the drm_pagemap
will error with -ENODEV, so depending on how the driver handles that,
it will continue executing out of another memory region. At this point
it would've been possible without this code to rmmod the drm_pagemap
provider device module, and its drm device would've been freed without
this code, and when drm_pagemap_put() eventually is called, things go
boom. So the commit message is a bit misleading.

In the case where we only have pages left, the last page should be
freed from the device remove callback where bos are evicted. At that
point, the provider drm device is still alive as the devm callbacks
haven't executed yet. Also a rmmod wold typically cause the devm
callbacks to execute so that should also be safe without this patch. At
least if the page freeing doesn't trigger any async callbacks that
aren't waited on before removal.

So yeah, I need to update the commit message a bit. We should also
craft an IGT that unbinds device 1 while device 0 is executing out of
its memory and verify that execution completes with correct results
anyway.

/Thomas


>=20
> > Note that in theory, the drm_gpusvm_helper module may be unloaded
> > as soon as the final module_put() of the provider driver module is
> > executed, so we need to add a module_exit() function that waits
> > for the work item executing the module_put() has completed.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_pagemap.c | 101
> > ++++++++++++++++++++++++++++++++--
> > =C2=A0drivers/gpu/drm/xe/xe_svm.c=C2=A0=C2=A0 |=C2=A0 15 ++++-
> > =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +++-
> > =C2=A03 files changed, 117 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > b/drivers/gpu/drm/drm_pagemap.c
> > index 173b3ecb07d5..fb18a80d6a1c 100644
> > --- a/drivers/gpu/drm/drm_pagemap.c
> > +++ b/drivers/gpu/drm/drm_pagemap.c
> > @@ -8,6 +8,7 @@
> > =C2=A0#include <linux/pagemap.h>
> > =C2=A0#include <drm/drm_drv.h>
> > =C2=A0#include <drm/drm_pagemap.h>
> > +#include <drm/drm_print.h>
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * DOC: Overview
> > @@ -544,16 +545,92 @@ static int
> > drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
> > =C2=A0	return -ENOMEM;
> > =C2=A0}
> > =C2=A0
> > +static void drm_pagemap_dev_unhold_work(struct work_struct *work);
> > +static LLIST_HEAD(drm_pagemap_unhold_list);
> > +static DECLARE_WORK(drm_pagemap_work,
> > drm_pagemap_dev_unhold_work);
> > +
> > +/**
> > + * struct drm_pagemap_dev_hold - Struct to aid in drm_device
> > release.
> > + * @link: Link into drm_pagemap_unhold_list for deferred reference
> > releases.
> > + * @drm: drm device to put.
> > + *
> > + * When a struct drm_pagemap is released, we also need to release
> > the
> > + * reference it holds on the drm device. However, typically that
> > needs
> > + * to be done separately from a system-wide workqueue.
> > + * Each time a struct drm_pagemap is initialized
> > + * (or re-initialized if cached) therefore allocate a separate
> > + * drm_pagemap_dev_hold item, from which we put the drm device and
> > + * associated module.
> > + */
> > +struct drm_pagemap_dev_hold {
> > +	struct llist_node link;
> > +	struct drm_device *drm;
> > +};
> > +
> > =C2=A0static void drm_pagemap_release(struct kref *ref)
> > =C2=A0{
> > =C2=A0	struct drm_pagemap *dpagemap =3D container_of(ref,
> > typeof(*dpagemap), ref);
> > -
> > +	struct drm_pagemap_dev_hold *dev_hold =3D dpagemap-
> > >dev_hold;
> > +
> > +	/*
> > +	 * We know the pagemap provider is alive at this point,
> > since
> > +	 * the struct drm_pagemap_dev_hold holds a reference to
> > the
> > +	 * pagemap provider drm_device and its module.
> > +	 */
> > +	dpagemap->dev_hold =3D NULL;
> > =C2=A0	kfree(dpagemap);
> > +	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
> > +	schedule_work(&drm_pagemap_work);
> > +	/*
> > +	 * Here, either the provider device is still alive, since
> > if called from
> > +	 * page_free(), the caller is holding a reference on the
> > dev_pagemap,
> > +	 * or if called from drm_pagemap_put(), the direct caller
> > is still alive.
> > +	 * This ensures we can't race with THIS module unload.
> > +	 */
> > +}
> > +
> > +static void drm_pagemap_dev_unhold_work(struct work_struct *work)
> > +{
> > +	struct llist_node *node =3D
> > llist_del_all(&drm_pagemap_unhold_list);
> > +	struct drm_pagemap_dev_hold *dev_hold, *next;
> > +
> > +	/*
> > +	 * Deferred release of drm_pagemap provider device and
> > module.
> > +	 * THIS module is kept alive during the release by the
> > +	 * flush_work() in the drm_pagemap_exit() function.
> > +	 */
> > +	llist_for_each_entry_safe(dev_hold, next, node, link) {
> > +		struct drm_device *drm =3D dev_hold->drm;
> > +		struct module *module =3D drm->driver->fops->owner;
> > +
> > +		drm_dbg(drm, "Releasing reference on provider
> > device and module.\n");
> > +		drm_dev_put(drm);
> > +		module_put(module);
> > +		kfree(dev_hold);
> > +	}
> > +}
> > +
> > +static struct drm_pagemap_dev_hold *
> > +drm_pagemap_dev_hold(struct drm_pagemap *dpagemap)
> > +{
> > +	struct drm_pagemap_dev_hold *dev_hold;
> > +	struct drm_device *drm =3D dpagemap->drm;
> > +
> > +	dev_hold =3D kzalloc(sizeof(*dev_hold), GFP_KERNEL);
> > +	if (!dev_hold)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	init_llist_node(&dev_hold->link);
> > +	dev_hold->drm =3D drm;
> > +	(void)try_module_get(drm->driver->fops->owner);
> > +	drm_dev_get(drm);
> > +
> > +	return dev_hold;
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > =C2=A0 * drm_pagemap_create() - Create a struct drm_pagemap.
> > - * @dev: Pointer to a struct device providing the device-private
> > memory.
> > + * @drm: Pointer to a struct drm_device providing the device-
> > private memory.
> > =C2=A0 * @pagemap: Pointer to a pre-setup struct dev_pagemap providing
> > the struct pages.
> > =C2=A0 * @ops: Pointer to the struct drm_pagemap_ops.
> > =C2=A0 *
> > @@ -563,20 +640,28 @@ static void drm_pagemap_release(struct kref
> > *ref)
> > =C2=A0 * Error pointer on error.
> > =C2=A0 */
> > =C2=A0struct drm_pagemap *
> > -drm_pagemap_create(struct device *dev,
> > +drm_pagemap_create(struct drm_device *drm,
> > =C2=A0		=C2=A0=C2=A0 struct dev_pagemap *pagemap,
> > =C2=A0		=C2=A0=C2=A0 const struct drm_pagemap_ops *ops)
> > =C2=A0{
> > =C2=A0	struct drm_pagemap *dpagemap =3D kzalloc(sizeof(*dpagemap),
> > GFP_KERNEL);
> > +	struct drm_pagemap_dev_hold *dev_hold;
> > =C2=A0
> > =C2=A0	if (!dpagemap)
> > =C2=A0		return ERR_PTR(-ENOMEM);
> > =C2=A0
> > =C2=A0	kref_init(&dpagemap->ref);
> > -	dpagemap->dev =3D dev;
> > +	dpagemap->drm =3D drm;
> > =C2=A0	dpagemap->ops =3D ops;
> > =C2=A0	dpagemap->pagemap =3D pagemap;
> > =C2=A0
> > +	dev_hold =3D drm_pagemap_dev_hold(dpagemap);
> > +	if (IS_ERR(dev_hold)) {
> > +		kfree(dpagemap);
> > +		return ERR_CAST(dev_hold);
> > +	}
> > +	dpagemap->dev_hold =3D dev_hold;
> > +
> > =C2=A0	return dpagemap;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(drm_pagemap_create);
> > @@ -937,3 +1022,11 @@ int drm_pagemap_populate_mm(struct
> > drm_pagemap *dpagemap,
> > =C2=A0	return err;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(drm_pagemap_populate_mm);
> > +
> > +static void drm_pagemap_exit(void)
> > +{
> > +	flush_work(&drm_pagemap_work);
> > +	if (WARN_ON(!llist_empty(&drm_pagemap_unhold_list)))
> > +		disable_work_sync(&drm_pagemap_work);
> > +}
> > +module_exit(drm_pagemap_exit);
> > diff --git a/drivers/gpu/drm/xe/xe_svm.c
> > b/drivers/gpu/drm/xe/xe_svm.c
> > index 6d2c6c144315..f6ee22da2e95 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.c
> > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > @@ -1437,7 +1437,7 @@ xe_drm_pagemap_device_map(struct drm_pagemap
> > *dpagemap,
> > =C2=A0			=C2=A0 unsigned int order,
> > =C2=A0			=C2=A0 enum dma_data_direction dir)
> > =C2=A0{
> > -	struct device *pgmap_dev =3D dpagemap->dev;
> > +	struct device *pgmap_dev =3D dpagemap->drm->dev;
> > =C2=A0	enum drm_interconnect_protocol prot;
> > =C2=A0	dma_addr_t addr;
> > =C2=A0
> > @@ -1457,6 +1457,14 @@ static const struct drm_pagemap_ops
> > xe_drm_pagemap_ops =3D {
> > =C2=A0	.populate_mm =3D xe_drm_pagemap_populate_mm,
> > =C2=A0};
> > =C2=A0
> > +static void xe_devm_release(void *data)
> > +{
> > +	struct xe_vram_region *vr =3D data;
> > +
> > +	drm_pagemap_put(vr->dpagemap);
> > +	vr->dpagemap =3D NULL;
> > +}
> > +
> > =C2=A0/**
> > =C2=A0 * xe_devm_add: Remap and provide memmap backing for device memor=
y
> > =C2=A0 * @tile: tile that the memory region belongs to
> > @@ -1482,7 +1490,7 @@ int xe_devm_add(struct xe_tile *tile, struct
> > xe_vram_region *vr)
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > -	vr->dpagemap =3D drm_pagemap_create(dev, &vr->pagemap,
> > +	vr->dpagemap =3D drm_pagemap_create(&xe->drm, &vr->pagemap,
> > =C2=A0					=C2=A0 &xe_drm_pagemap_ops);
> > =C2=A0	if (IS_ERR(vr->dpagemap)) {
> > =C2=A0		drm_err(&xe->drm, "Failed to create drm_pagemap
> > tile %d memory: %pe\n",
> > @@ -1490,6 +1498,9 @@ int xe_devm_add(struct xe_tile *tile, struct
> > xe_vram_region *vr)
> > =C2=A0		ret =3D PTR_ERR(vr->dpagemap);
> > =C2=A0		goto out_no_dpagemap;
> > =C2=A0	}
> > +	ret =3D devm_add_action_or_reset(dev, xe_devm_release, vr);
> > +	if (ret)
> > +		goto out_no_dpagemap;
>=20
> I mentioned this in first patch that this was missing, maybe move
> this
> part to the first patch even though this will get removed a bit
> later.
>=20
> Matt
>=20
> > =C2=A0
> > =C2=A0	vr->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> > =C2=A0	vr->pagemap.range.start =3D res->start;
> > diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> > index 2c7de928865b..5cfe54331ba7 100644
> > --- a/include/drm/drm_pagemap.h
> > +++ b/include/drm/drm_pagemap.h
> > @@ -9,6 +9,7 @@
> > =C2=A0#define NR_PAGES(order) (1U << (order))
> > =C2=A0
> > =C2=A0struct drm_pagemap;
> > +struct drm_pagemap_dev_hold;
> > =C2=A0struct drm_pagemap_zdd;
> > =C2=A0struct device;
> > =C2=A0
> > @@ -130,14 +131,17 @@ struct drm_pagemap_ops {
> > =C2=A0 * used for device p2p handshaking.
> > =C2=A0 * @ops: The struct drm_pagemap_ops.
> > =C2=A0 * @ref: Reference count.
> > - * @dev: The struct drevice owning the device-private memory.
> > + * @drm: The struct drm device owning the device-private memory.
> > =C2=A0 * @pagemap: Pointer to the underlying dev_pagemap.
> > + * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
> > + * device referencing.
> > =C2=A0 */
> > =C2=A0struct drm_pagemap {
> > =C2=A0	const struct drm_pagemap_ops *ops;
> > =C2=A0	struct kref ref;
> > -	struct device *dev;
> > +	struct drm_device *drm;
> > =C2=A0	struct dev_pagemap *pagemap;
> > +	struct drm_pagemap_dev_hold *dev_hold;
> > =C2=A0};
> > =C2=A0
> > =C2=A0struct drm_pagemap_devmem;
> > @@ -206,7 +210,7 @@ struct drm_pagemap_devmem_ops {
> > =C2=A0			=C2=A0=C2=A0 unsigned long npages);
> > =C2=A0};
> > =C2=A0
> > -struct drm_pagemap *drm_pagemap_create(struct device *dev,
> > +struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap
> > *pagemap,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > drm_pagemap_ops *ops);
> > =C2=A0
> > --=20
> > 2.51.0
> >=20

