Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09B0C141A7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 11:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4818910E090;
	Tue, 28 Oct 2025 10:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WX1UCAqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3355F10E090;
 Tue, 28 Oct 2025 10:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761647366; x=1793183366;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3thQMLHtOhyqVcQzCQ13v6TVP1r8HuZyzAyM2V+kC8w=;
 b=WX1UCAqx2F99mH/f31gB092ziKIEDa1P+Myf6TbqKG9VblvMpzSnVjUR
 k9vCd3yMW1IzM9/gVGi43DGGR2OevRoDNgPhQMcdvQ5H+d62427SGMAu1
 hDpqEfBhbpsLptInJz+LrTPX0MrXeB7Q0tvveInWqVR6BpSSll4CmS14X
 t67U9mV1EObp0f/RabjkOU8thIjQ1blw6yD7PUYkyZ1SAMLY/EqEXluWg
 4Zj6DYR5XCVWg3TJEjFbAQGvEHNMHE9wuGlKlDql5EmiX5BAtfp6qky+m
 nmBNYKwePVllhi70Um+T/ZlRyTdGN1uZTgKXAdw/Oyr8aal0Kuv7pMsIK g==;
X-CSE-ConnectionGUID: UpHRCPR4QeyAXcG0JvnAAA==
X-CSE-MsgGUID: lFhGme83TiuXt005Yld/PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67581981"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67581981"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:29:25 -0700
X-CSE-ConnectionGUID: jmFVPZxLSzWmsY8VHJklSg==
X-CSE-MsgGUID: +Zr0MHVhTsOiH3PY7wj7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190432871"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.149])
 ([10.245.244.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 03:29:20 -0700
Message-ID: <58f21e3a1132665fcffda65cfbe09b081abce092.camel@linux.intel.com>
Subject: Re: [PATCH 04/15] drm/pagemap: Add a drm_pagemap cache and shrinker
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Tue, 28 Oct 2025 11:29:19 +0100
In-Reply-To: <17d29da26bf86172510133c28e18a99e90772c7d.camel@linux.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-5-thomas.hellstrom@linux.intel.com>
 <aQAbGiYv/u/0wnto@lstrano-desk.jf.intel.com>
 <17d29da26bf86172510133c28e18a99e90772c7d.camel@linux.intel.com>
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

On Tue, 2025-10-28 at 10:46 +0100, Thomas Hellstr=C3=B6m wrote:
> On Mon, 2025-10-27 at 18:23 -0700, Matthew Brost wrote:
> > On Sat, Oct 25, 2025 at 02:04:01PM +0200, Thomas Hellstr=C3=B6m wrote:
> > > Pagemaps are costly to set up and tear down, and they consume a
> > > lot
> > > of system memory for the struct pages. Ideally they should be
> > > created only when needed.
> > >=20
> > > Add a caching mechanism to allow doing just that: Create the
> > > drm_pagemaps
> > > when needed for migration. Keep them around to avoid destruction
> > > and
> > > re-creation latencies and destroy inactive/unused drm_pagemaps on
> > > memory
> > > pressure using a shrinker.
> > >=20
> > > Only add the helper functions. They will be hooked up to the xe
> > > driver
> > > in the upcoming patch.
> > >=20
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> > > =C2=A0drivers/gpu/drm/drm_pagemap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 79 +++++-
> > > =C2=A0drivers/gpu/drm/drm_pagemap_util.c | 426
> > > +++++++++++++++++++++++++++++
> > > =C2=A0include/drm/drm_pagemap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 53 +++-
> > > =C2=A0include/drm/drm_pagemap_util.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
25 ++
> > > =C2=A05 files changed, 569 insertions(+), 17 deletions(-)
> > > =C2=A0create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
> > > =C2=A0create mode 100644 include/drm/drm_pagemap_util.h
> > >=20
> > > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > > index c2672f369aed..cdca68fd9f23 100644
> > > --- a/drivers/gpu/drm/Makefile
> > > +++ b/drivers/gpu/drm/Makefile
> > > @@ -107,7 +107,8 @@ obj-$(CONFIG_DRM_GPUVM) +=3D drm_gpuvm.o
> > > =C2=A0
> > > =C2=A0drm_gpusvm_helper-y :=3D \
> > > =C2=A0	drm_gpusvm.o\
> > > -	drm_pagemap.o
> > > +	drm_pagemap.o\
> > > +	drm_pagemap_util.o
> > > =C2=A0obj-$(CONFIG_DRM_GPUSVM) +=3D drm_gpusvm_helper.o
> > > =C2=A0
> > > =C2=A0obj-$(CONFIG_DRM_BUDDY) +=3D drm_buddy.o
> > > diff --git a/drivers/gpu/drm/drm_pagemap.c
> > > b/drivers/gpu/drm/drm_pagemap.c
> > > index fb18a80d6a1c..5ca5b2b53bc1 100644
> > > --- a/drivers/gpu/drm/drm_pagemap.c
> > > +++ b/drivers/gpu/drm/drm_pagemap.c
> > > @@ -8,6 +8,7 @@
> > > =C2=A0#include <linux/pagemap.h>
> > > =C2=A0#include <drm/drm_drv.h>
> > > =C2=A0#include <drm/drm_pagemap.h>
> > > +#include <drm/drm_pagemap_util.h>
> > > =C2=A0#include <drm/drm_print.h>
> > > =C2=A0
> > > =C2=A0/**
> > > @@ -578,7 +579,7 @@ static void drm_pagemap_release(struct kref
> > > *ref)
> > > =C2=A0	 * pagemap provider drm_device and its module.
> > > =C2=A0	 */
> > > =C2=A0	dpagemap->dev_hold =3D NULL;
> > > -	kfree(dpagemap);
> > > +	drm_pagemap_shrinker_add(dpagemap);
> > > =C2=A0	llist_add(&dev_hold->link, &drm_pagemap_unhold_list);
> > > =C2=A0	schedule_work(&drm_pagemap_work);
> > > =C2=A0	/*
> > > @@ -628,6 +629,58 @@ drm_pagemap_dev_hold(struct drm_pagemap
> > > *dpagemap)
> > > =C2=A0	return dev_hold;
> > > =C2=A0}
> > > =C2=A0
> > > +/**
> > > + * drm_pagemap_reinit() - Reinitialize a drm_pagemap
> > > + * @dpagemap: The drm_pagemap to reinitialize
> > > + *
> > > + * Reinitialize a drm_pagemap, for which drm_pagemap_release
> > > + * has already been called. This interface is intended for the
> > > + * situation where the driver caches a destroyed drm_pagemap.
> > > + *
> > > + * Return: 0 on success, negative error code on failure.
> > > + */
> > > +int drm_pagemap_reinit(struct drm_pagemap *dpagemap)
> > > +{
> > > +	dpagemap->dev_hold =3D drm_pagemap_dev_hold(dpagemap);
> > > +	if (IS_ERR(dpagemap->dev_hold))
> > > +		return PTR_ERR(dpagemap->dev_hold);
> > > +
> > > +	kref_init(&dpagemap->ref);
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL(drm_pagemap_reinit);
> > > +
> > > +/**
> > > + * drm_pagemap_init() - Initialize a pre-allocated drm_pagemap
> > > + * @dpagemap: The drm_pagemap to initialize.
> > > + * @pagemap: The associated dev_pagemap providing the device
> > > + * private pages.
> > > + * @drm: The drm device. The drm_pagemap holds a reference on
> > > the
> > > + * drm_device and the module owning the drm_device until
> > > + * drm_pagemap_release(). This facilitates drm_pagemap
> > > exporting.
> > > + * @ops: The drm_pagemap ops.
> > > + *
> > > + * Initialize and take an initial reference on a drm_pagemap.
> > > + * After successful return, use drm_pagemap_put() to destroy.
> > > + *
> > > + ** Return: 0 on success, negative error code on error.
> > > + */
> > > +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap *pagemap,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *drm,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_ops *ops)
> > > +{
> > > +	kref_init(&dpagemap->ref);
> > > +	dpagemap->ops =3D ops;
> > > +	dpagemap->pagemap =3D pagemap;
> > > +	dpagemap->drm =3D drm;
> > > +	dpagemap->cache =3D NULL;
> > > +	INIT_LIST_HEAD(&dpagemap->shrink_link);
> > > +
> > > +	return drm_pagemap_reinit(dpagemap);
> > > +}
> > > +EXPORT_SYMBOL(drm_pagemap_init);
> > > +
> > > =C2=A0/**
> > > =C2=A0 * drm_pagemap_create() - Create a struct drm_pagemap.
> > > =C2=A0 * @drm: Pointer to a struct drm_device providing the device-
> > > private memory.
> > > @@ -645,22 +698,14 @@ drm_pagemap_create(struct drm_device *drm,
> > > =C2=A0		=C2=A0=C2=A0 const struct drm_pagemap_ops *ops)
> > > =C2=A0{
> > > =C2=A0	struct drm_pagemap *dpagemap =3D
> > > kzalloc(sizeof(*dpagemap),
> > > GFP_KERNEL);
> > > -	struct drm_pagemap_dev_hold *dev_hold;
> > > +	int err;
> > > =C2=A0
> > > =C2=A0	if (!dpagemap)
> > > =C2=A0		return ERR_PTR(-ENOMEM);
> > > =C2=A0
> > > -	kref_init(&dpagemap->ref);
> > > -	dpagemap->drm =3D drm;
> > > -	dpagemap->ops =3D ops;
> > > -	dpagemap->pagemap =3D pagemap;
> > > -
> > > -	dev_hold =3D drm_pagemap_dev_hold(dpagemap);
> > > -	if (IS_ERR(dev_hold)) {
> > > -		kfree(dpagemap);
> > > -		return ERR_CAST(dev_hold);
> > > -	}
> > > -	dpagemap->dev_hold =3D dev_hold;
> > > +	err =3D drm_pagemap_init(dpagemap, pagemap, drm, ops);
> > > +	if (err)
> > > +		return ERR_PTR(err);
> > > =C2=A0
> > > =C2=A0	return dpagemap;
> > > =C2=A0}
> > > @@ -1023,6 +1068,14 @@ int drm_pagemap_populate_mm(struct
> > > drm_pagemap *dpagemap,
> > > =C2=A0}
> > > =C2=A0EXPORT_SYMBOL(drm_pagemap_populate_mm);
> > > =C2=A0
> > > +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool
> > > is_atomic_or_reclaim)
> > > +{
> > > +	if (dpagemap->ops->destroy)
> > > +		dpagemap->ops->destroy(dpagemap,
> > > is_atomic_or_reclaim);
> > > +	else
> > > +		kfree(dpagemap);
> > > +}
> > > +
> > > =C2=A0static void drm_pagemap_exit(void)
> > > =C2=A0{
> > > =C2=A0	flush_work(&drm_pagemap_work);
> > > diff --git a/drivers/gpu/drm/drm_pagemap_util.c
> > > b/drivers/gpu/drm/drm_pagemap_util.c
> > > new file mode 100644
> > > index 000000000000..e1a1d6bf25f4
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/drm_pagemap_util.c
> > > @@ -0,0 +1,426 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > > +/*
> > > + * Copyright =C2=A9 2025 Intel Corporation
> > > + */
> > > +
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_managed.h>
> > > +#include <drm/drm_pagemap.h>
> > > +#include <drm/drm_pagemap_util.h>
> > > +#include <drm/drm_print.h>
> > > +
> > > +/**
> > > + * struct drm_pagemap_cache - Lookup structure for pagemaps
> > > + *
> > > + * Structure to keep track of active (refcount > 1) and inactive
> > > + * (refcount =3D=3D 0) pagemaps. Inactive pagemaps can be made
> > > active
> > > + * again by waiting for the @queued completion (indicating that
> > > the
> > > + * pagemap has been put on the @shrinker's list of shrinkable
> > > + * pagemaps, and then successfully removing it from @shrinker's
> > > + * list. The latter may fail if the shrinker is already in the
> > > + * process of freeing the pagemap. A struct drm_pagemap_cache
> > > can
> > > + * hold a single struct drm_pagemap.
> > > + */
> > > +struct drm_pagemap_cache {
> > > +	/** @lookup_mutex: Mutex making the lookup process
> > > atomic
> > > */
> > > +	struct mutex lookup_mutex;
> > > +	/** @lock: Lock protecting the @dpagemap pointer */
> > > +	spinlock_t lock;
> > > +	/** @shrinker: Pointer to the shrinker used for this
> > > cache. Immutable. */
> > > +	struct drm_pagemap_shrinker *shrinker;
> > > +	/** @dpagemap: Non-refcounted pointer to the drm_pagemap
> > > */
> > > +	struct drm_pagemap *dpagemap;
> > > +	/**
> > > +	 * @queued: Signals when an inactive drm_pagemap has
> > > been
> > > put on
> > > +	 * @shrinker's list.
> > > +	 */
> > > +	struct completion queued;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_pagemap_shrinker - Shrinker to remove unused
> > > pagemaps
> > > + */
> > > +struct drm_pagemap_shrinker {
> > > +	/** @drm: Pointer to the drm device. */
> > > +	struct drm_device *drm;
> > > +	/** @lock: Spinlock to protect the @dpagemaps list. */
> > > +	spinlock_t lock;
> > > +	/** @dpagemaps: List of unused dpagemaps. */
> > > +	struct list_head dpagemaps;
> > > +	/** @num_dpagemaps: Number of unused dpagemaps in
> > > @dpagemaps. */
> > > +	atomic_t num_dpagemaps;
> > > +	/** @shrink: Pointer to the struct shrinker. */
> > > +	struct shrinker *shrink;
> > > +};
> > > +
> > > +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap
> > > *dpagemap);
> > > +
> > > +static void drm_pagemap_cache_fini(void *arg)
> > > +{
> > > +	struct drm_pagemap_cache *cache =3D arg;
> > > +	struct drm_pagemap *dpagemap;
> > > +
> > > +	drm_dbg(cache->shrinker->drm, "Destroying dpagemap
> > > cache.\n");
> > > +	spin_lock(&cache->lock);
> > > +	dpagemap =3D cache->dpagemap;
> > > +	if (!dpagemap) {
> > > +		spin_unlock(&cache->lock);
> > > +		goto out;
> > > +	}
> > > +
> > > +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> > > +		cache->dpagemap =3D NULL;
> > > +		spin_unlock(&cache->lock);
> > > +		drm_pagemap_destroy(dpagemap, false);
> > > +	}
> > > +
> > > +out:
> > > +	mutex_destroy(&cache->lookup_mutex);
> > > +	kfree(cache);
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_cache_create_devm() - Create a drm_pagemap_cache
> > > + * @shrinker: Pointer to a struct drm_pagemap_shrinker.
> > > + *
> > > + * Create a device-managed drm_pagemap cache. The cache is
> > > automatically
> > > + * destroyed on struct device removal, at which point any
> > > *inactive*
> > > + * drm_pagemap's are destroyed.
> > > + *
> > > + * Return: Pointer to a struct drm_pagemap_cache on success.
> > > Error
> > > pointer
> > > + * on failure.
> > > + */
> > > +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct
> > > drm_pagemap_shrinker *shrinker)
> > > +{
> > > +	struct drm_pagemap_cache *cache =3D
> > > kzalloc(sizeof(*cache),
> > > GFP_KERNEL);
> > > +	int err;
> > > +
> > > +	if (!cache)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	mutex_init(&cache->lookup_mutex);
> > > +	spin_lock_init(&cache->lock);
> > > +	cache->shrinker =3D shrinker;
> > > +	init_completion(&cache->queued);
> > > +	err =3D devm_add_action_or_reset(shrinker->drm->dev,
> > > drm_pagemap_cache_fini, cache);
> > > +	if (err)
> > > +		return ERR_PTR(err);
> > > +
> > > +	return cache;
> > > +}
> > > +EXPORT_SYMBOL(drm_pagemap_cache_create_devm);
> > > +
> > > +/**
> > > + * DOC: Cache lookup
> > > + *
> > > + * Cache lookup should be done under a locked mutex, so that a
> > > + * failed drm_pagemap_get_from_cache() and a following
> > > + * drm_pagemap_cache_setpagemap() are carried out as an atomic
> > > + * operation WRT other lookups. Otherwise, racing lookups may
> > > + * unnecessarily concurrently create pagemaps to fulfill a
> > > + * failed lookup. The API provides two functions to perform this
> > > lock,
> > > + * drm_pagemap_lock_lookup() and drm_pagemap_unlock_lookup() and
> > > they
> > > + * should be used in the following way:
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *		drm_pagemap_lock_lookup(cache);
> > > + *		dpagemap =3D drm_pagemap_get_from_cache(cache);
> > > + *		if (dpagemap)
> > > + *			goto out_unlock;
> > > + *
> > > + *		dpagemap =3D driver_create_new_dpagemap();
> > > + *		if (!IS_ERR(dpagemap))
> > > + *			drm_pagemap_cache_set_pagemap(cache,
> > > dpagemap);
> > > + *
> > > + *=C2=A0=C2=A0=C2=A0=C2=A0 out_unlock:
> > > + *		drm_pagemap_unlock_lookup(cache);
> > > + */
> > > +
> > > +/**
> > > + * drm_pagemap_cache_lock_lookup() Lock a drm_pagemap_cache for
> > > lookup
> > > + * @cache: The drm_pagemap_cache to lock.
> > > + *
> > > + * Return: %-EINTR if interrupted while blocking. %0 otherwise.
> > > + */
> > > +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache
> > > *cache)
> > > +{
> > > +	return mutex_lock_interruptible(&cache->lookup_mutex);
> > > +}
> > > +EXPORT_SYMBOL(drm_pagemap_cache_lock_lookup);
> > > +
> > > +/**
> > > + * drm_pagemap_cache_unlock_lookup() Unlock a drm_pagemap_cache
> > > after lookup
> > > + * @cache: The drm_pagemap_cache to unlock.
> > > + */
> > > +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache
> > > *cache)
> > > +{
> > > +	mutex_unlock(&cache->lookup_mutex);
> > > +}
> > > +EXPORT_SYMBOL(drm_pagemap_cache_unlock_lookup);
> > > +
> > > +/**
> > > + * drm_pagemap_get_from_cache() -=C2=A0 Lookup of drm_pagemaps.
> > > + * @cache: The cache used for lookup.
> > > + *
> > > + * If an active pagemap is present in the cache, it is
> > > immediately
> > > returned.
> > > + * If an inactive pagemap is present, it's removed from the
> > > shrinker list and
> > > + * an attempt is made to make it active.
> > > + * If no pagemap present or the attempt to make it active
> > > failed,
> > > %NULL is returned
> > > + * to indicate to the caller to create a new drm_pagemap and
> > > insert it into
> > > + * the cache.
> > > + *
> > > + * Return: A reference-counted pointer to a drm_pagemap if
> > > successful. An error
> > > + * pointer if an error occurred, or %NULL if no drm_pagemap was
> > > found and
> > > + * the caller should insert a new one.
> > > + */
> > > +struct drm_pagemap *drm_pagemap_get_from_cache(struct
> > > drm_pagemap_cache *cache)
> > > +{
> > > +	struct drm_pagemap *dpagemap;
> > > +	int err;
> > > +
> > > +	lockdep_assert_held(&cache->lookup_mutex);
> > > +retry:
> > > +	spin_lock(&cache->lock);
> > > +	dpagemap =3D cache->dpagemap;
> > > +	if (drm_pagemap_get_unless_zero(dpagemap)) {
> > > +		spin_unlock(&cache->lock);
> > > +		return dpagemap;
> > > +	}
> > > +
> > > +	if (!dpagemap) {
> > > +		spin_unlock(&cache->lock);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	if (!try_wait_for_completion(&cache->queued)) {
> > > +		spin_unlock(&cache->lock);
> > > +		err =3D wait_for_completion_interruptible(&cache-
> > > > queued);
> > > +		if (err)
> > > +			return ERR_PTR(err);
> > > +		goto retry;
> > > +	}
> > > +
> > > +	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> > > +		cache->dpagemap =3D NULL;
> > > +		spin_unlock(&cache->lock);
> > > +		err =3D drm_pagemap_reinit(dpagemap);
> > > +		if (err) {
> > > +			drm_pagemap_destroy(dpagemap, false);
> > > +			return ERR_PTR(err);
> > > +		}
> > > +		drm_pagemap_cache_set_pagemap(cache, dpagemap);
> > > +	} else {
> > > +		cache->dpagemap =3D NULL;
> > > +		spin_unlock(&cache->lock);
> > > +		dpagemap =3D NULL;
> > > +	}
> > > +
> > > +	return dpagemap;
> > > +}
> > > +EXPORT_SYMBOL(drm_pagemap_get_from_cache);
> > > +
> > > +/**
> > > + * drm_pagemap_cache_set_pagemap() - Assign a drm_pagemap to a
> > > drm_pagemap_cache
> > > + * @cache: The cache to assign the drm_pagemap to.
> > > + * @dpagemap: The drm_pagemap to assign.
> > > + *
> > > + * The function must be called to populate a drm_pagemap_cache
> > > only
> > > + * after a call to drm_pagemap_get_from_cache() returns NULL.
> > > + */
> > > +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache
> > > *cache, struct drm_pagemap *dpagemap)
> > > +{
> > > +	struct drm_device *drm =3D dpagemap->drm;
> > > +
> > > +	lockdep_assert_held(&cache->lookup_mutex);
> > > +	spin_lock(&cache->lock);
> > > +	dpagemap->cache =3D cache;
> > > +	swap(cache->dpagemap, dpagemap);
> > > +	reinit_completion(&cache->queued);
> > > +	spin_unlock(&cache->lock);
> > > +	drm_WARN_ON(drm, !!dpagemap);
> > > +}
> > > +EXPORT_SYMBOL(drm_pagemap_cache_set_pagemap);
> > > +
> > > +/**
> > > + * drm_pagemap_get_from_cache_if_active() - Quick lookup of
> > > active
> > > drm_pagemaps
> > > + * @cache: The cache to lookup from.
> > > + *
> > > + * Function that should be used to lookup a drm_pagemap that is
> > > already active.
> > > + * (refcount > 0).
> > > + *
> > > + * Return: A pointer to the cache's drm_pagemap if it's active;
> > > %NULL otherwise.
> > > + */
> > > +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct
> > > drm_pagemap_cache *cache)
> > > +{
> > > +	struct drm_pagemap *dpagemap;
> > > +
> > > +	spin_lock(&cache->lock);
> > > +	dpagemap =3D drm_pagemap_get_unless_zero(cache->dpagemap);
> > > +	spin_unlock(&cache->lock);
> > > +
> > > +	return dpagemap;
> > > +}
> > > +EXPORT_SYMBOL(drm_pagemap_get_from_cache_if_active);
> > > +
> > > +static bool drm_pagemap_shrinker_cancel(struct drm_pagemap
> > > *dpagemap)
> > > +{
> > > +	struct drm_pagemap_cache *cache =3D dpagemap->cache;
> > > +	struct drm_pagemap_shrinker *shrinker =3D cache->shrinker;
> > > +
> > > +	spin_lock(&shrinker->lock);
> > > +	if (list_empty(&dpagemap->shrink_link)) {
> > > +		spin_unlock(&shrinker->lock);
> > > +		return false;
> > > +	}
> > > +
> > > +	list_del_init(&dpagemap->shrink_link);
> > > +	atomic_dec(&shrinker->num_dpagemaps);
> > > +	spin_unlock(&shrinker->lock);
> > > +	return true;
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_shrinker_add() - Add a drm_pagemap to the
> > > shrinker
> > > list or destroy
> > > + * @dpagemap: The drm_pagemap.
> > > + *
> > > + * If @dpagemap is associated with a &struct drm_pagemap_cache
> > > AND
> > > the
> > > + * struct device backing the drm device is still alive, add
> > > @dpagemap to
> > > + * the &struct drm_pagemap_shrinker list of shrinkable
> > > drm_pagemaps.
> > > + *
> > > + * Otherwise destroy the pagemap directly using
> > > drm_pagemap_destroy().
> > > + *
> > > + * This is an internal function which is not intended to be
> > > exposed to drivers.
> > > + */
> > > +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap)
> >=20
> > Not a full review - slowly wrapping my head around the first 6
> > patches
> > but one quick question.
> >=20
> > This is called from drm_pagemap_put. How do we know what type of
> > context
> > we're in? It seems like this could be called from either process
> > context
> > or atomic context (e.g., via drm_pagemap_zdd_destroy through
> > drm_pagemap_page_free). This code doesn=E2=80=99t appear to work in ato=
mic
> > contexts=E2=80=94if I recall correctly, drm_dev_enter can=E2=80=99t be =
called from
> > atomic context. Also, we're missing irqsave on the spinlock.
>=20
> From reading up on srcu_read_lock(), which is hiding behind
> drm_dev_enter(), it should be OK to call from atomic context as long
> as
> it is also released from the same context. I indeed checked that we
> could call it under a spinlock without getting any lockdep warnings.=20
>=20
> The irqsave on the spinlock is a different thing, though. Do we know
> that drm_pagemap_page_free() will be called from irq context?

Looks like the dmirror_devmem_free()
https://elixir.bootlin.com/linux/v6.18-rc3/source/lib/test_hmm.c#L1377

uses a spinlock without irqsave.

That said, I can add a drm_pagemap_shrinker_might_lock() to our
page_free() callback for CONFIG_PROVE_LOCKING.

/Thomas


>=20
> /Thomas
>=20
>=20
>=20
> >=20
> > We had a worker for ZDD destroy at one point=E2=80=94should we revive t=
hat?
> > If
> > we did, I think we could safely enforce a rule that drm_pagemap
> > operations must only be called from process context.
> >=20
> > Matt
> >=20
> > > +{
> > > +	struct drm_pagemap_cache *cache;
> > > +	struct drm_pagemap_shrinker *shrinker;
> > > +	int idx;
> > > +
> > > +	/*
> > > +	 * The pagemap cache and shrinker are disabled at
> > > +	 * pci device remove time. After that, dpagemaps
> > > +	 * are freed directly.
> > > +	 */
> > > +	if (!drm_dev_enter(dpagemap->drm, &idx))
> > > +		goto out_no_cache;
> > > +
> > > +	cache =3D dpagemap->cache;
> > > +	if (!cache) {
> > > +		drm_dev_exit(idx);
> > > +		goto out_no_cache;
> > > +	}
> > > +
> > > +	shrinker =3D cache->shrinker;
> > > +	spin_lock(&shrinker->lock);
> > > +	list_add_tail(&dpagemap->shrink_link, &shrinker-
> > > > dpagemaps);
> > > +	atomic_inc(&shrinker->num_dpagemaps);
> > > +	spin_unlock(&shrinker->lock);
> > > +	complete_all(&cache->queued);
> > > +	drm_dev_exit(idx);
> > > +	return;
> > > +
> > > +out_no_cache:
> > > +	drm_pagemap_destroy(dpagemap, true);
> > > +}
> > > +
> > > +static unsigned long
> > > +drm_pagemap_shrinker_count(struct shrinker *shrink, struct
> > > shrink_control *sc)
> > > +{
> > > +	struct drm_pagemap_shrinker *shrinker =3D shrink-
> > > > private_data;
> > > +	unsigned long count =3D atomic_read(&shrinker-
> > > > num_dpagemaps);
> > > +
> > > +	return count ? : SHRINK_EMPTY;
> > > +}
> > > +
> > > +static unsigned long
> > > +drm_pagemap_shrinker_scan(struct shrinker *shrink, struct
> > > shrink_control *sc)
> > > +{
> > > +	struct drm_pagemap_shrinker *shrinker =3D shrink-
> > > > private_data;
> > > +	struct drm_pagemap *dpagemap;
> > > +	struct drm_pagemap_cache *cache;
> > > +	unsigned long nr_freed =3D 0;
> > > +
> > > +	sc->nr_scanned =3D 0;
> > > +	spin_lock(&shrinker->lock);
> > > +	do {
> > > +		dpagemap =3D list_first_entry_or_null(&shrinker-
> > > > dpagemaps, typeof(*dpagemap),
> > > +						=C2=A0=C2=A0=C2=A0
> > > shrink_link);
> > > +		if (!dpagemap)
> > > +			break;
> > > +
> > > +		atomic_dec(&shrinker->num_dpagemaps);
> > > +		list_del_init(&dpagemap->shrink_link);
> > > +		spin_unlock(&shrinker->lock);
> > > +
> > > +		sc->nr_scanned++;
> > > +		nr_freed++;
> > > +
> > > +		cache =3D dpagemap->cache;
> > > +		spin_lock(&cache->lock);
> > > +		cache->dpagemap =3D NULL;
> > > +		spin_unlock(&cache->lock);
> > > +
> > > +		drm_dbg(dpagemap->drm, "Shrinking dpagemap
> > > %p.\n",
> > > dpagemap);
> > > +		drm_pagemap_destroy(dpagemap, true);
> > > +		spin_lock(&shrinker->lock);
> > > +	} while (sc->nr_scanned < sc->nr_to_scan);
> > > +	spin_unlock(&shrinker->lock);
> > > +
> > > +	return sc->nr_scanned ? nr_freed : SHRINK_STOP;
> > > +}
> > > +
> > > +static void drm_pagemap_shrinker_fini(void *arg)
> > > +{
> > > +	struct drm_pagemap_shrinker *shrinker =3D arg;
> > > +
> > > +	drm_dbg(shrinker->drm, "Destroying dpagemap
> > > shrinker.\n");
> > > +	drm_WARN_ON(shrinker->drm, !!atomic_read(&shrinker-
> > > > num_dpagemaps));
> > > +	shrinker_free(shrinker->shrink);
> > > +	kfree(shrinker);
> > > +}
> > > +
> > > +/**
> > > + * drm_pagemap_shrinker_create_devm() - Create and register a
> > > pagemap shrinker
> > > + * @drm: The drm device
> > > + *
> > > + * Create and register a pagemap shrinker that shrinks unused
> > > pagemaps
> > > + * and thereby reduces memory footprint.
> > > + * The shrinker is drm_device managed and unregisters itself
> > > when
> > > + * the drm device is removed.
> > > + *
> > > + * Return: %0 on success, negative error code on failure.
> > > + */
> > > +struct drm_pagemap_shrinker
> > > *drm_pagemap_shrinker_create_devm(struct drm_device *drm)
> > > +{
> > > +	struct drm_pagemap_shrinker *shrinker;
> > > +	struct shrinker *shrink;
> > > +	int err;
> > > +
> > > +	shrinker =3D kzalloc(sizeof(*shrinker), GFP_KERNEL);
> > > +	if (!shrinker)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	shrink =3D shrinker_alloc(0, "drm-drm_pagemap:%s", drm-
> > > > unique);
> > > +	if (!shrink) {
> > > +		kfree(shrinker);
> > > +		return ERR_PTR(-ENOMEM);
> > > +	}
> > > +
> > > +	spin_lock_init(&shrinker->lock);
> > > +	INIT_LIST_HEAD(&shrinker->dpagemaps);
> > > +	shrinker->drm =3D drm;
> > > +	shrinker->shrink =3D shrink;
> > > +	shrink->count_objects =3D drm_pagemap_shrinker_count;
> > > +	shrink->scan_objects =3D drm_pagemap_shrinker_scan;
> > > +	shrink->private_data =3D shrinker;
> > > +	shrinker_register(shrink);
> > > +
> > > +	err =3D devm_add_action_or_reset(drm->dev,
> > > drm_pagemap_shrinker_fini, shrinker);
> > > +	if (err)
> > > +		return ERR_PTR(err);
> > > +
> > > +	return shrinker;
> > > +}
> > > +EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
> > > diff --git a/include/drm/drm_pagemap.h
> > > b/include/drm/drm_pagemap.h
> > > index 5cfe54331ba7..4b9af5e785c6 100644
> > > --- a/include/drm/drm_pagemap.h
> > > +++ b/include/drm/drm_pagemap.h
> > > @@ -9,6 +9,7 @@
> > > =C2=A0#define NR_PAGES(order) (1U << (order))
> > > =C2=A0
> > > =C2=A0struct drm_pagemap;
> > > +struct drm_pagemap_cache;
> > > =C2=A0struct drm_pagemap_dev_hold;
> > > =C2=A0struct drm_pagemap_zdd;
> > > =C2=A0struct device;
> > > @@ -124,6 +125,25 @@ struct drm_pagemap_ops {
> > > =C2=A0			=C2=A0=C2=A0 unsigned long start, unsigned long
> > > end,
> > > =C2=A0			=C2=A0=C2=A0 struct mm_struct *mm,
> > > =C2=A0			=C2=A0=C2=A0 unsigned long timeslice_ms);
> > > +	/**
> > > +	 * @destroy: Destroy the drm_pagemap and associated
> > > resources.
> > > +	 * @dpagemap: The drm_pagemap to destroy.
> > > +	 * @is_atomic_or_reclaim: The function may be called
> > > from
> > > +	 * atomic- or reclaim context.
> > > +	 *
> > > +	 * The implementation should take care not to attempt to
> > > +	 * destroy resources that may already have been
> > > destroyed
> > > +	 * using devm_ callbacks, since this function may be
> > > called
> > > +	 * after the underlying struct device has been unbound.
> > > +	 * If the implementation defers the execution to a work
> > > item
> > > +	 * to avoid locking issues, then it must make sure the
> > > work
> > > +	 * items are flushed before module exit. If the destroy
> > > call
> > > +	 * happens after the provider's pci_remove() callback
> > > has
> > > +	 * been executed, a module reference and drm device
> > > reference is
> > > +	 * held across the destroy callback.
> > > +	 */
> > > +	void (*destroy)(struct drm_pagemap *dpagemap,
> > > +			bool is_atomic_or_reclaim);
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0/**
> > > @@ -135,6 +155,10 @@ struct drm_pagemap_ops {
> > > =C2=A0 * @pagemap: Pointer to the underlying dev_pagemap.
> > > =C2=A0 * @dev_hold: Pointer to a struct drm_pagemap_dev_hold for
> > > =C2=A0 * device referencing.
> > > + * @cache: Back-pointer to the &struct drm_pagemap_cache used
> > > for
> > > this
> > > + * &struct drm_pagemap. May be NULL if no cache is used.
> > > + * @shrink_link: Link into the shrinker's list of drm_pagemaps.
> > > Only
> > > + * used if also using a pagemap cache.
> > > =C2=A0 */
> > > =C2=A0struct drm_pagemap {
> > > =C2=A0	const struct drm_pagemap_ops *ops;
> > > @@ -142,6 +166,8 @@ struct drm_pagemap {
> > > =C2=A0	struct drm_device *drm;
> > > =C2=A0	struct dev_pagemap *pagemap;
> > > =C2=A0	struct drm_pagemap_dev_hold *dev_hold;
> > > +	struct drm_pagemap_cache *cache;
> > > +	struct list_head shrink_link;
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0struct drm_pagemap_devmem;
> > > @@ -210,6 +236,11 @@ struct drm_pagemap_devmem_ops {
> > > =C2=A0			=C2=A0=C2=A0 unsigned long npages);
> > > =C2=A0};
> > > =C2=A0
> > > +int drm_pagemap_init(struct drm_pagemap *dpagemap,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap *pagemap,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *drm,
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_pagemap_ops *ops);
> > > +
> > > =C2=A0struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
> > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct dev_pagemap
> > > *pagemap,
> > > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct
> > > drm_pagemap_ops *ops);
> > > @@ -228,9 +259,9 @@ static inline void drm_pagemap_put(struct
> > > drm_pagemap *dpagemap)
> > > =C2=A0
> > > =C2=A0/**
> > > =C2=A0 * drm_pagemap_get() - Obtain a reference on a struct
> > > drm_pagemap
> > > - * @dpagemap: Pointer to the struct drm_pagemap.
> > > + * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
> > > =C2=A0 *
> > > - * Return: Pointer to the struct drm_pagemap.
> > > + * Return: Pointer to the struct drm_pagemap, or NULL.
> > > =C2=A0 */
> > > =C2=A0static inline struct drm_pagemap *
> > > =C2=A0drm_pagemap_get(struct drm_pagemap *dpagemap)
> > > @@ -241,6 +272,20 @@ drm_pagemap_get(struct drm_pagemap
> > > *dpagemap)
> > > =C2=A0	return dpagemap;
> > > =C2=A0}
> > > =C2=A0
> > > +/**
> > > + * drm_pagemap_get_unless_zero() - Obtain a reference on a
> > > struct
> > > drm_pagemap
> > > + * unless the current reference count is zero.
> > > + * @dpagemap: Pointer to the drm_pagemap or NULL.
> > > + *
> > > + * Return: A pointer to @dpagemap if the reference count was
> > > successfully
> > > + * incremented. NULL if @dpagemap was NULL, or its refcount was
> > > 0.
> > > + */
> > > +static inline struct drm_pagemap * __must_check
> > > +drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
> > > +{
> > > +	return (dpagemap && kref_get_unless_zero(&dpagemap-
> > > >ref))
> > > ? dpagemap : NULL;
> > > +}
> > > +
> > > =C2=A0/**
> > > =C2=A0 * struct drm_pagemap_devmem - Structure representing a GPU SVM
> > > device memory allocation
> > > =C2=A0 *
> > > @@ -284,5 +329,7 @@ int drm_pagemap_populate_mm(struct
> > > drm_pagemap
> > > *dpagemap,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0 struct mm_struct *mm,
> > > =C2=A0			=C2=A0=C2=A0=C2=A0 unsigned long timeslice_ms);
> > > =C2=A0
> > > -#endif
> > > +void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool
> > > is_atomic_or_reclaim);
> > > =C2=A0
> > > +int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
> > > +#endif
> > > diff --git a/include/drm/drm_pagemap_util.h
> > > b/include/drm/drm_pagemap_util.h
> > > new file mode 100644
> > > index 000000000000..292244d429ee
> > > --- /dev/null
> > > +++ b/include/drm/drm_pagemap_util.h
> > > @@ -0,0 +1,25 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +#ifndef _DRM_PAGEMAP_UTIL_H_
> > > +#define _DRM_PAGEMAP_UTIL_H_
> > > +
> > > +struct drm_device;
> > > +struct drm_pagemap;
> > > +struct drm_pagemap_cache;
> > > +struct drm_pagemap_shrinker;
> > > +
> > > +void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
> > > +
> > > +int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache
> > > *cache);
> > > +
> > > +void drm_pagemap_cache_unlock_lookup(struct drm_pagemap_cache
> > > *cache);
> > > +
> > > +struct drm_pagemap_shrinker
> > > *drm_pagemap_shrinker_create_devm(struct drm_device *drm);
> > > +
> > > +struct drm_pagemap_cache *drm_pagemap_cache_create_devm(struct
> > > drm_pagemap_shrinker *shrinker);
> > > +
> > > +struct drm_pagemap *drm_pagemap_get_from_cache(struct
> > > drm_pagemap_cache *cache);
> > > +
> > > +void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache
> > > *cache, struct drm_pagemap *dpagemap);
> > > +
> > > +struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct
> > > drm_pagemap_cache *cache);
> > > +#endif
> > > --=20
> > > 2.51.0
> > >=20
>=20

