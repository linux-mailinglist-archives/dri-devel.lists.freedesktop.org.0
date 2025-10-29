Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B285C1B6B1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B89310E7E3;
	Wed, 29 Oct 2025 14:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jtRQsEau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E64410E7E1;
 Wed, 29 Oct 2025 14:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761749577; x=1793285577;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=M4MUoBriWuECD8Yw/MBXl4W3h2z7UihXCPb3aOKe5hc=;
 b=jtRQsEauK73fRjzfQdNDhx6+PeD0jRey/j6zUtxw0mB8giBEql3ho8ba
 RnpNn4vnm7/xNtnQHuIMyo8Glbmmf7amsrH60U97WB2Hryowp1hat5ZER
 RcgbAJ8F+2sp33O4pUzBr6QIgM07BAyHdIMjgxs+vxaCpqlZ6Yl6FBWBz
 XMlmuOS4CCYJRX4Dr6DuG19j3UDieJS0XGzH5aZPicYImIM8SgZiYqMs3
 mWQqH8yS+26i13aOGFY8lE88sHejH/72w9P/mkSJ3hp9hB83FCliekb3N
 0fPHzleTPr7HFrLEfDwHWAwCtujQZrKv4C3eCua/GtZtjkuKtz59QHI3v g==;
X-CSE-ConnectionGUID: VTJUBNOsR+GqqAXDcgqhhg==
X-CSE-MsgGUID: zprOzVnHQEqEDtXZ9FWBcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63782370"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="63782370"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:52:57 -0700
X-CSE-ConnectionGUID: WnCMATNBROaDUfelFrRJsw==
X-CSE-MsgGUID: DO38Gr3xS32NLiV/FfbWXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190044179"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.245.28])
 ([10.245.245.28])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 07:52:54 -0700
Message-ID: <09b52cd319b11adf9b3c8a4d0159c3405af32d26.camel@linux.intel.com>
Subject: Re: [PATCH 07/15] drm/pagemap_util: Add a utility to assign an
 owner to a set of interconnected gpus
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, dakr@kernel.org,
 "Mrozek, Michal"	 <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Date: Wed, 29 Oct 2025 15:52:52 +0100
In-Reply-To: <aQFsEO84w6E1NXG3@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-8-thomas.hellstrom@linux.intel.com>
 <aQFsEO84w6E1NXG3@lstrano-desk.jf.intel.com>
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

On Tue, 2025-10-28 at 18:21 -0700, Matthew Brost wrote:
> On Sat, Oct 25, 2025 at 02:04:04PM +0200, Thomas Hellstr=C3=B6m wrote:
> > The hmm_range_fault() and the migration helpers currently need a
> > common
> > "owner" to identify pagemaps and clients with fast interconnect.
> > Add a drm_pagemap utility to setup such owners by registering
> > drm_pagemaps, in a registry, and for each new drm_pagemap,
> > query which existing drm_pagemaps have fast interconnects with the
> > new
> > drm_pagemap.
> >=20
> > The "owner" scheme is limited in that it is static at drm_pagemap
> > creation.
> > Ideally one would want the owner to be adjusted at run-time, but
> > that
> > requires changes to hmm. If the proposed scheme becomes too
> > limited,
> > we need to revisit.
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/drm_pagemap_util.c | 118
> > +++++++++++++++++++++++++++++
> > =C2=A0include/drm/drm_pagemap_util.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 53=
 +++++++++++++
> > =C2=A02 files changed, 171 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_pagemap_util.c
> > b/drivers/gpu/drm/drm_pagemap_util.c
> > index e1a1d6bf25f4..dd573b620157 100644
> > --- a/drivers/gpu/drm/drm_pagemap_util.c
> > +++ b/drivers/gpu/drm/drm_pagemap_util.c
> > @@ -3,6 +3,8 @@
> > =C2=A0 * Copyright =C2=A9 2025 Intel Corporation
> > =C2=A0 */
> > =C2=A0
> > +#include <linux/slab.h>
> > +
> > =C2=A0#include <drm/drm_drv.h>
> > =C2=A0#include <drm/drm_managed.h>
> > =C2=A0#include <drm/drm_pagemap.h>
> > @@ -424,3 +426,119 @@ struct drm_pagemap_shrinker
> > *drm_pagemap_shrinker_create_devm(struct drm_device
> > =C2=A0	return shrinker;
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(drm_pagemap_shrinker_create_devm);
> > +
> > +/**
> > + * struct drm_pagemap_owner - Device interconnect group
> > + * @kref: Reference count.
> > + *
> > + * A struct drm_pagemap_owner identifies a device interconnect
> > group.
> > + */
> > +struct drm_pagemap_owner {
> > +	struct kref kref;
> > +};
> > +
> > +static void drm_pagemap_owner_release(struct kref *kref)
> > +{
> > +	kfree(container_of(kref, struct drm_pagemap_owner, kref));
> > +}
> > +
> > +/**
> > + * drm_pagemap_release_owner() - Stop participating in an
> > interconnect group
> > + * @peer: Pointer to the struct drm_pagemap_peer used when joining
> > the group
> > + *
> > + * Stop participating in an interconnect group. This function is
> > typically
> > + * called when a pagemap is removed to indicate that it doesn't
> > need to
> > + * be taken into account.
> > + */
> > +void drm_pagemap_release_owner(struct drm_pagemap_peer *peer)
> > +{
> > +	struct drm_pagemap_owner_list *owner_list =3D peer->list;
> > +
> > +	if (!owner_list)
> > +		return;
> > +
> > +	mutex_lock(&owner_list->lock);
> > +	list_del(&peer->link);
> > +	kref_put(&peer->owner->kref, drm_pagemap_owner_release);
> > +	peer->owner =3D NULL;
> > +	mutex_unlock(&owner_list->lock);
> > +}
> > +EXPORT_SYMBOL(drm_pagemap_release_owner);
> > +
> > +/**
> > + * typedef interconnect_fn - Callback function to identify fast
> > interconnects
> > + * @peer1: First endpoint.
> > + * @peer2: Second endpont.
> > + *
> > + * The function returns %true iff @peer1 and @peer2 have a fast
> > interconnect.
> > + * Note that this is symmetrical. The function has no notion of
> > client and provider,
> > + * which may not be sufficient in some cases. However, since the
> > callback is intended
> > + * to guide in providing common pagemap owners, the notion of a
> > common owner to
> > + * indicate fast interconnects would then have to change as well.
> > + *
> > + * Return: %true iff @peer1 and @peer2 have a fast interconnect.
> > Otherwise @false.
> > + */
> > +typedef bool (*interconnect_fn)(struct drm_pagemap_peer *peer1,
> > struct drm_pagemap_peer *peer2);
> > +
> > +/**
> > + * drm_pagemap_acquire_owner() - Join an interconnect group
> > + * @peer: A struct drm_pagemap_peer keeping track of the device
> > interconnect
> > + * @owner_list: Pointer to the owner_list, keeping track of all
> > interconnects
> > + * @has_interconnect: Callback function to determine whether two
> > peers have a
> > + * fast local interconnect.
> > + *
> > + * Repeatedly calls @has_interconnect for @peer and other peers on
> > @owner_list to
> > + * determine a set of peers for which @peer has a fast
> > interconnect. That set will
> > + * have common &struct drm_pagemap_owner, and upon successful
> > return, @peer::owner
> > + * will point to that struct, holding a reference, and @peer will
> > be registered in
> > + * @owner_list. If @peer doesn't have any fast interconnects to
> > other @peers, a
> > + * new unique &struct drm_pagemap_owner will be allocated for it,
> > and that
> > + * may be shared with other peers that, at a later point, are
> > determined to have
> > + * a fast interconnect with @peer.
> > + *
> > + * When @peer no longer participates in an interconnect group,
> > + * drm_pagemap_release_owner() should be called to drop the
> > reference on the
> > + * struct drm_pagemap_owner.
> > + *
> > + * Return: %0 on success, negative error code on failure.
> > + */
> > +int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_owner_list
> > *owner_list,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interconnect_fn has_interconnect)
> > +{
> > +	struct drm_pagemap_peer *cur_peer;
> > +	struct drm_pagemap_owner *owner =3D NULL;
> > +	bool interconnect =3D false;
> > +
> > +	mutex_lock(&owner_list->lock);
> > +	might_alloc(GFP_KERNEL);
> > +	list_for_each_entry(cur_peer, &owner_list->peers, link) {
> > +		if (cur_peer->owner !=3D owner) {
> > +			if (owner && interconnect)
> > +				break;
> > +			owner =3D cur_peer->owner;
> > +			interconnect =3D true;
> > +		}
> > +		if (interconnect && !has_interconnect(peer,
> > cur_peer))
> > +			interconnect =3D false;
> > +	}
> > +
> > +	if (!interconnect) {
> > +		owner =3D kmalloc(sizeof(*owner), GFP_KERNEL);
> > +		if (!owner) {
> > +			mutex_unlock(&owner_list->lock);
> > +			return -ENOMEM;
> > +		}
> > +		kref_init(&owner->kref);
> > +		list_add_tail(&peer->link, &owner_list->peers);
> > +	} else {
> > +		kref_get(&owner->kref);
> > +		list_add_tail(&peer->link, &cur_peer->link);
> > +	}
> > +	peer->owner =3D owner;
> > +	peer->list =3D owner_list;
> > +	mutex_unlock(&owner_list->lock);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_pagemap_acquire_owner);
> > diff --git a/include/drm/drm_pagemap_util.h
> > b/include/drm/drm_pagemap_util.h
> > index 292244d429ee..1889630b8950 100644
> > --- a/include/drm/drm_pagemap_util.h
> > +++ b/include/drm/drm_pagemap_util.h
> > @@ -1,12 +1,58 @@
> > =C2=A0/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright =C2=A9 2025 Intel Corporation
> > + */
> > +
>=20
> Nit: The above copyright should be moved to an earlier patch.

OK yes.


>=20
>=20
>=20
> > =C2=A0#ifndef _DRM_PAGEMAP_UTIL_H_
> > =C2=A0#define _DRM_PAGEMAP_UTIL_H_
> > =C2=A0
> > +#include <linux/list.h>
> > +#include <linux/mutex.h>
> > +
> > =C2=A0struct drm_device;
> > =C2=A0struct drm_pagemap;
> > =C2=A0struct drm_pagemap_cache;
> > +struct drm_pagemap_owner;
> > =C2=A0struct drm_pagemap_shrinker;
> > =C2=A0
> > +/**
> > + * struct drm_pagemap_peer - Structure representing a fast
> > interconnect peer
> > + * @list: Pointer to a &struct drm_pagemap_owner_list used to keep
> > track of peers
> > + * @link: List link for @list's list of peers.
> > + * @owner: Pointer to a &struct drm_pagemap_owner, common for a
> > set of peers having
> > + * fast interconnects.
> > + * @private: Pointer private to the struct embedding this struct.
> > + */
> > +struct drm_pagemap_peer {
> > +	struct drm_pagemap_owner_list *list;
> > +	struct list_head link;
> > +	struct drm_pagemap_owner *owner;
> > +	void *private;
> > +};
> > +
> > +/**
> > + * struct drm_pagemap_owner_list - Keeping track of peers and
> > owners
> > + * @peer: List of peers.
> > + *
> > + * The owner list defines the scope where we identify peers having
> > fast interconnects
> > + * and a common owner. Typically a driver has a single global
> > owner list to
> > + * keep track of common owners for the driver's pagemaps.
> > + */
> > +struct drm_pagemap_owner_list {
> > +	/** @lock: Mutex protecting the @peers list. */
> > +	struct mutex lock;
> > +	/** @peers: List of peers. */
> > +	struct list_head peers;
> > +};
> > +
> > +/*
> > + * Convenience macro to define an owner list.
>=20
> I'd perhaps mention this typially a static module instantiation.

Sure.

>=20
> Patch itself lgtm, and makes sense. With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> > + */
> > +#define DRM_PAGEMAP_OWNER_LIST_DEFINE(_name)	\
> > +	struct drm_pagemap_owner_list _name =3D {	\
> > +	.lock =3D __MUTEX_INITIALIZER(_name.lock), \
> > +	.peers =3D LIST_HEAD_INIT(_name.peers) }
> > +
> > =C2=A0void drm_pagemap_shrinker_add(struct drm_pagemap *dpagemap);
> > =C2=A0
> > =C2=A0int drm_pagemap_cache_lock_lookup(struct drm_pagemap_cache
> > *cache);
> > @@ -22,4 +68,11 @@ struct drm_pagemap
> > *drm_pagemap_get_from_cache(struct drm_pagemap_cache *cache);
> > =C2=A0void drm_pagemap_cache_set_pagemap(struct drm_pagemap_cache
> > *cache, struct drm_pagemap *dpagemap);
> > =C2=A0
> > =C2=A0struct drm_pagemap *drm_pagemap_get_from_cache_if_active(struct
> > drm_pagemap_cache *cache);
> > +
> > +void drm_pagemap_release_owner(struct drm_pagemap_peer *peer);
> > +
> > +int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_pagemap_owner_list
> > *owner_list,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool (*has_interconnect)(struct
> > drm_pagemap_peer *peer1,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct
> > drm_pagemap_peer *peer2));
> > =C2=A0#endif
> > --=20
> > 2.51.0
> >=20

