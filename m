Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E8C8B9A2C
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 13:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1EC10F545;
	Thu,  2 May 2024 11:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUfDhItr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0030610EC4A;
 Thu,  2 May 2024 11:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714650089; x=1746186089;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=796DP42f/Nit2O23rut6sx4IsyrMlz30AfgQF4PuCyQ=;
 b=dUfDhItrNNPluSz8OcUneCv6slfbWzbxQsm0FPb/c5L6+IX1m9r/yW5C
 DoX8NMZt8haco9YXvskkvPpulk/QB2G+nS9YPxroiEyOCVp0nCaMOrJUF
 cZ435QjUAud+ndmbCUdoy393d/AZ+pkDyWZcmfhxpmyBwE7EyTNu/9NNz
 M4r6O+a79zR2553rzmhcbQsx5osTXwRez6B9tW3LSnM6P4sci6LvQWkUA
 F+o2Ae+vuQ3Gn+V8oE91loM8ZqeE3jCjbGZ9vszPVlzFL44E2C595nyH7
 ZLvk3UgNiUPYUqp7X+eCxBbYntNuJLm1+NqXISafiEAgauVYeAz+29OVN w==;
X-CSE-ConnectionGUID: 9p6WXUtTR0Cc3Nqee1Vacg==
X-CSE-MsgGUID: fgGnPMInSaiwX0NW6B5VXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="14218513"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="14218513"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 04:41:29 -0700
X-CSE-ConnectionGUID: cipci429Tx63W9PpgyFW6Q==
X-CSE-MsgGUID: qB0mNawqTzancsAMn3Yc+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="58296809"
Received: from vpus-mobl1.ger.corp.intel.com (HELO [10.252.34.3])
 ([10.252.34.3])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 04:41:27 -0700
Message-ID: <1a26087ddae46ae3963c723545f85d67764cef53.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/9] drm/ttm: Allow TTM LRU list nodes of different
 types
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, dri-devel@lists.freedesktop.org
Date: Thu, 02 May 2024 13:41:24 +0200
In-Reply-To: <aa06fb7e-19d6-4161-a659-70cf953e534a@amd.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
 <20240416100730.6666-2-thomas.hellstrom@linux.intel.com>
 <Zh8isq+3btgEJGTx@DUT025-TGLU.fm.intel.com>
 <aa06fb7e-19d6-4161-a659-70cf953e534a@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

Hi, Matt, Christian,

On Wed, 2024-04-17 at 08:09 +0200, Christian K=C3=B6nig wrote:
> Am 17.04.24 um 03:15 schrieb Matthew Brost:
> > On Tue, Apr 16, 2024 at 12:07:22PM +0200, Thomas Hellstr=C3=B6m wrote:
> > > To be able to handle list unlocking while traversing the LRU
> > > list, we want the iterators not only to point to the next
> > > position of the list traversal, but to insert themselves as
> > > list nodes at that point to work around the fact that the
> > > next node might otherwise disappear from the list while
> > > the iterator is pointing to it.
> > >=20
> > > These list nodes need to be easily distinguishable from other
> > > list nodes so that others traversing the list can skip
> > > over them.
> > >=20
> > > So declare a struct ttm_lru_item, with a struct list_head member
> > > and a type enum. This will slightly increase the size of a
> > > struct ttm_resource.
> > >=20
> > > Changes in previous series:
> > > - Update enum ttm_lru_item_type documentation.
> > >=20
> > Patch itself makes sense to me. One style question (or maybe
> > suggestion?) below.
> >=20
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0 | 13 ++++--
> > > =C2=A0 drivers/gpu/drm/ttm/ttm_resource.c | 70 ++++++++++++++++++++++=
-
> > > -------
> > > =C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0 | 51 ++=
+++++++++++++++++++-
> > > =C2=A0 3 files changed, 110 insertions(+), 24 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> > > b/drivers/gpu/drm/ttm/ttm_device.c
> > > index 76027960054f..f27406e851e5 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > > @@ -270,17 +270,22 @@ EXPORT_SYMBOL(ttm_device_fini);
> > > =C2=A0 static void ttm_device_clear_lru_dma_mappings(struct ttm_devic=
e
> > > *bdev,
> > > =C2=A0=C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list_head
> > > *list)
> > > =C2=A0 {
> > > -	struct ttm_resource *res;
> > > +	struct ttm_lru_item *lru;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spin_lock(&bdev->lru_lock);
> > > -	while ((res =3D list_first_entry_or_null(list,
> > > typeof(*res), lru))) {
> > > -		struct ttm_buffer_object *bo =3D res->bo;
> > > +	while ((lru =3D list_first_entry_or_null(list,
> > > typeof(*lru), link))) {
> > > +		struct ttm_buffer_object *bo;
> > > +
> > > +		if (!ttm_lru_item_is_res(lru))
> > > +			continue;
> > > +
> > > +		bo =3D ttm_lru_item_to_res(lru)->bo;
> > > =C2=A0=20
> > > =C2=A0=C2=A0		/* Take ref against racing releases once
> > > lru_lock is unlocked */
> > > =C2=A0=C2=A0		if (!ttm_bo_get_unless_zero(bo))
> > > =C2=A0=C2=A0			continue;
> > > =C2=A0=20
> > > -		list_del_init(&res->lru);
> > > +		list_del_init(&bo->resource->lru.link);
> > > =C2=A0=C2=A0		spin_unlock(&bdev->lru_lock);
> > > =C2=A0=20
> > > =C2=A0=C2=A0		if (bo->ttm)
> > > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > > b/drivers/gpu/drm/ttm/ttm_resource.c
> > > index be8d286513f9..7aa5ca5c0e33 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > > @@ -69,8 +69,8 @@ void ttm_lru_bulk_move_tail(struct
> > > ttm_lru_bulk_move *bulk)
> > > =C2=A0=C2=A0			dma_resv_assert_held(pos->last->bo-
> > > >base.resv);
> > > =C2=A0=20
> > > =C2=A0=C2=A0			man =3D ttm_manager_type(pos->first->bo-
> > > >bdev, i);
> > > -			list_bulk_move_tail(&man->lru[j], &pos-
> > > >first->lru,
> > > -					=C2=A0=C2=A0=C2=A0 &pos->last->lru);
> > > +			list_bulk_move_tail(&man->lru[j], &pos-
> > > >first->lru.link,
> > > +					=C2=A0=C2=A0=C2=A0 &pos->last-
> > > >lru.link);
> > > =C2=A0=C2=A0		}
> > > =C2=A0=C2=A0	}
> > > =C2=A0 }
> > > @@ -83,14 +83,38 @@ ttm_lru_bulk_move_pos(struct
> > > ttm_lru_bulk_move *bulk, struct ttm_resource *res)
> > > =C2=A0=C2=A0	return &bulk->pos[res->mem_type][res->bo->priority];
> > > =C2=A0 }
> > > =C2=A0=20
> > > +/* Return the previous resource on the list (skip over non-
> > > resource list items) */
> > > +static struct ttm_resource *ttm_lru_prev_res(struct ttm_resource
> > > *cur)
> > > +{
> > > +	struct ttm_lru_item *lru =3D &cur->lru;
> > > +
> > > +	do {
> > > +		lru =3D list_prev_entry(lru, link);
> > > +	} while (!ttm_lru_item_is_res(lru));
> > > +
> > > +	return ttm_lru_item_to_res(lru);
> > > +}
> > > +
> > > +/* Return the next resource on the list (skip over non-resource
> > > list items) */
> > > +static struct ttm_resource *ttm_lru_next_res(struct ttm_resource
> > > *cur)
> > > +{
> > > +	struct ttm_lru_item *lru =3D &cur->lru;
> > > +
> > > +	do {
> > > +		lru =3D list_next_entry(lru, link);
> > > +	} while (!ttm_lru_item_is_res(lru));
> > > +
> > > +	return ttm_lru_item_to_res(lru);
> > > +}
> > > +
> > > =C2=A0 /* Move the resource to the tail of the bulk move range */
> > > =C2=A0 static void ttm_lru_bulk_move_pos_tail(struct
> > > ttm_lru_bulk_move_pos *pos,
> > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resou=
rce *res)
> > > =C2=A0 {
> > > =C2=A0=C2=A0	if (pos->last !=3D res) {
> > > =C2=A0=C2=A0		if (pos->first =3D=3D res)
> > > -			pos->first =3D list_next_entry(res, lru);
> > > -		list_move(&res->lru, &pos->last->lru);
> > > +			pos->first =3D ttm_lru_next_res(res);
> > > +		list_move(&res->lru.link, &pos->last->lru.link);
> > > =C2=A0=C2=A0		pos->last =3D res;
> > > =C2=A0=C2=A0	}
> > > =C2=A0 }
> > > @@ -121,11 +145,11 @@ static void ttm_lru_bulk_move_del(struct
> > > ttm_lru_bulk_move *bulk,
> > > =C2=A0=C2=A0		pos->first =3D NULL;
> > > =C2=A0=C2=A0		pos->last =3D NULL;
> > > =C2=A0=C2=A0	} else if (pos->first =3D=3D res) {
> > > -		pos->first =3D list_next_entry(res, lru);
> > > +		pos->first =3D ttm_lru_next_res(res);
> > > =C2=A0=C2=A0	} else if (pos->last =3D=3D res) {
> > > -		pos->last =3D list_prev_entry(res, lru);
> > > +		pos->last =3D ttm_lru_prev_res(res);
> > > =C2=A0=C2=A0	} else {
> > > -		list_move(&res->lru, &pos->last->lru);
> > > +		list_move(&res->lru.link, &pos->last->lru.link);
> > > =C2=A0=C2=A0	}
> > > =C2=A0 }
> > > =C2=A0=20
> > > @@ -154,7 +178,7 @@ void ttm_resource_move_to_lru_tail(struct
> > > ttm_resource *res)
> > > =C2=A0=C2=A0	lockdep_assert_held(&bo->bdev->lru_lock);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	if (bo->pin_count) {
> > > -		list_move_tail(&res->lru, &bdev->pinned);
> > > +		list_move_tail(&res->lru.link, &bdev->pinned);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	} else	if (bo->bulk_move) {
> > > =C2=A0=C2=A0		struct ttm_lru_bulk_move_pos *pos =3D
> > > @@ -165,7 +189,7 @@ void ttm_resource_move_to_lru_tail(struct
> > > ttm_resource *res)
> > > =C2=A0=C2=A0		struct ttm_resource_manager *man;
> > > =C2=A0=20
> > > =C2=A0=C2=A0		man =3D ttm_manager_type(bdev, res->mem_type);
> > > -		list_move_tail(&res->lru, &man->lru[bo-
> > > >priority]);
> > > +		list_move_tail(&res->lru.link, &man->lru[bo-
> > > >priority]);
> > > =C2=A0=C2=A0	}
> > > =C2=A0 }
> > > =C2=A0=20
> > > @@ -196,9 +220,9 @@ void ttm_resource_init(struct
> > > ttm_buffer_object *bo,
> > > =C2=A0=C2=A0	man =3D ttm_manager_type(bo->bdev, place->mem_type);
> > > =C2=A0=C2=A0	spin_lock(&bo->bdev->lru_lock);
> > > =C2=A0=C2=A0	if (bo->pin_count)
> > > -		list_add_tail(&res->lru, &bo->bdev->pinned);
> > > +		list_add_tail(&res->lru.link, &bo->bdev-
> > > >pinned);
> > > =C2=A0=C2=A0	else
> > > -		list_add_tail(&res->lru, &man->lru[bo-
> > > >priority]);
> > > +		list_add_tail(&res->lru.link, &man->lru[bo-
> > > >priority]);
> > > =C2=A0=C2=A0	man->usage +=3D res->size;
> > > =C2=A0=C2=A0	spin_unlock(&bo->bdev->lru_lock);
> > > =C2=A0 }
> > > @@ -220,7 +244,7 @@ void ttm_resource_fini(struct
> > > ttm_resource_manager *man,
> > > =C2=A0=C2=A0	struct ttm_device *bdev =3D man->bdev;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spin_lock(&bdev->lru_lock);
> > > -	list_del_init(&res->lru);
> > > +	list_del_init(&res->lru.link);
> > > =C2=A0=C2=A0	man->usage -=3D res->size;
> > > =C2=A0=C2=A0	spin_unlock(&bdev->lru_lock);
> > > =C2=A0 }
> > > @@ -471,14 +495,16 @@ struct ttm_resource *
> > > =C2=A0 ttm_resource_manager_first(struct ttm_resource_manager *man,
> > > =C2=A0=C2=A0			=C2=A0=C2=A0 struct ttm_resource_cursor *cursor)
> > > =C2=A0 {
> > > -	struct ttm_resource *res;
> > > +	struct ttm_lru_item *lru;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	lockdep_assert_held(&man->bdev->lru_lock);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	for (cursor->priority =3D 0; cursor->priority <
> > > TTM_MAX_BO_PRIORITY;
> > > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 ++cursor->priority)
> > > -		list_for_each_entry(res, &man->lru[cursor-
> > > >priority], lru)
> > > -			return res;
> > > +		list_for_each_entry(lru, &man->lru[cursor-
> > > >priority], link) {
> > > +			if (ttm_lru_item_is_res(lru))
> > > +				return ttm_lru_item_to_res(lru);
> > > +		}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	return NULL;
> > > =C2=A0 }
> > > @@ -497,15 +523,21 @@ ttm_resource_manager_next(struct
> > > ttm_resource_manager *man,
> > > =C2=A0=C2=A0			=C2=A0 struct ttm_resource_cursor *cursor,
> > > =C2=A0=C2=A0			=C2=A0 struct ttm_resource *res)
> > > =C2=A0 {
> > > +	struct ttm_lru_item *lru =3D &res->lru;
> > > +
> > > =C2=A0=C2=A0	lockdep_assert_held(&man->bdev->lru_lock);
> > > =C2=A0=20
> > > -	list_for_each_entry_continue(res, &man->lru[cursor-
> > > >priority], lru)
> > > -		return res;
> > > +	list_for_each_entry_continue(lru, &man->lru[cursor-
> > > >priority], link) {
> > > +		if (ttm_lru_item_is_res(lru))
> > > +			return ttm_lru_item_to_res(lru);
> > > +	}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	for (++cursor->priority; cursor->priority <
> > > TTM_MAX_BO_PRIORITY;
> > > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 ++cursor->priority)
> > > -		list_for_each_entry(res, &man->lru[cursor-
> > > >priority], lru)
> > > -			return res;
> > > +		list_for_each_entry(lru, &man->lru[cursor-
> > > >priority], link) {
> > > +			if (ttm_lru_item_is_res(lru))
> > > +				ttm_lru_item_to_res(lru);
> > > +		}
> > > =C2=A0=20
> > > =C2=A0=C2=A0	return NULL;
> > > =C2=A0 }
> > > diff --git a/include/drm/ttm/ttm_resource.h
> > > b/include/drm/ttm/ttm_resource.h
> > > index 69769355139f..4babc4ff10b0 100644
> > > --- a/include/drm/ttm/ttm_resource.h
> > > +++ b/include/drm/ttm/ttm_resource.h
> > > @@ -49,6 +49,43 @@ struct io_mapping;
> > > =C2=A0 struct sg_table;
> > > =C2=A0 struct scatterlist;
> > > =C2=A0=20
> > > +/**
> > > + * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
> > > + */
> > > +enum ttm_lru_item_type {
> > > +	/** @TTM_LRU_RESOURCE: The resource subclass */
> > > +	TTM_LRU_RESOURCE,
> > > +	/** @TTM_LRU_HITCH: The iterator hitch subclass */
> > > +	TTM_LRU_HITCH
> > > +};
> > > +
> > > +/**
> > > + * struct ttm_lru_item - The TTM lru list node base class
> > > + * @link: The list link
> > > + * @type: The subclass type
> > > + */
> > > +struct ttm_lru_item {
> > > +	struct list_head link;
> > > +	enum ttm_lru_item_type type;
> > > +};
> > > +
> > > +/**
> > > + * ttm_lru_item_init() - initialize a struct ttm_lru_item
> > > + * @item: The item to initialize
> > > + * @type: The subclass type
> > > + */
> > > +static inline void ttm_lru_item_init(struct ttm_lru_item *item,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 enum ttm_lru_item_type
> > > type)
> > > +{
> > > +	item->type =3D type;
> > > +	INIT_LIST_HEAD(&item->link);
> > > +}
> > > +
> > > +static inline bool ttm_lru_item_is_res(const struct ttm_lru_item
> > > *item)
> > > +{
> > > +	return item->type =3D=3D TTM_LRU_RESOURCE;
> > > +}
> > > +
> > > =C2=A0 struct ttm_resource_manager_func {
> > > =C2=A0=C2=A0	/**
> > > =C2=A0=C2=A0	 * struct ttm_resource_manager_func member alloc
> > > @@ -217,9 +254,21 @@ struct ttm_resource {
> > > =C2=A0=C2=A0	/**
> > > =C2=A0=C2=A0	 * @lru: Least recently used list, see
> > > &ttm_resource_manager.lru
> > > =C2=A0=C2=A0	 */
> > > -	struct list_head lru;
> > > +	struct ttm_lru_item lru;
> > > =C2=A0 };
> > > =C2=A0=20
> > > +/**
> > > + * ttm_lru_item_to_res() - Downcast a struct ttm_lru_item to a
> > > struct ttm_resource
> > > + * @item: The struct ttm_lru_item to downcast
> > > + *
> > > + * Return: Pointer to the embedding struct ttm_resource
> > > + */
> > > +static inline struct ttm_resource *
> > > +ttm_lru_item_to_res(struct ttm_lru_item *item)
> > Pretty much everywhere in this series we have the following coding
> > pattern:
> >=20
> > if (ttm_lru_item_is_res(item))
> > 	do something with ttm_lru_item_to_res(item);
> >=20
> > Would it make more sense to squash these functions together with
> > only
> > ttm_lru_item_to_res which returns NULL if item is not
> > TTM_LRU_RESOURCE?
> >=20
> > The new pattern would be:
> >=20
> > res =3D ttm_lru_item_is_res(item)
> > if (res)
> > 	do something with res
> >=20
> > What do you think?

After looking into this, in the typical case this would actually amount
to

struct ttm_resource *res =3D ttm_lru_item_to_res(item)

if (res)
	do_something_with_res()

So four lines instead of two and an extra variable. So I don't see the
immediate benefit. I can change if you guys insist, though

>=20
> I would even say we should put that filtering into the iterator.
>=20
> Nobody except the code which inserted the anchor into the LRU is=20
> interested in it.

That's true, and it's already part of the _next() iterator function.
However in those places where the iteration is open-coded it's still
present. Those functions are typically intended to drain the LRU list.

I could probably introduce a
	struct ttm_resource *ttm_lru_first_res_or_null(struct
list_head *);

function to handle those cases, though.

/Thomas.




>=20
> Regards,
> Christian.
>=20
> >=20
> > Matt
> >=20
> > > +{
> > > +	return container_of(item, struct ttm_resource, lru);
> > > +}
> > > +
> > > =C2=A0 /**
> > > =C2=A0=C2=A0 * struct ttm_resource_cursor
> > > =C2=A0=C2=A0 *
> > > --=20
> > > 2.44.0
> > >=20
>=20

