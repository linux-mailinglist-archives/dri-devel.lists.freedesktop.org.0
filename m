Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB34878044
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 14:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D8810FE0A;
	Mon, 11 Mar 2024 13:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAjp1l+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E9D10FE0A;
 Mon, 11 Mar 2024 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710162304; x=1741698304;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HVlzt7Ux3P5rLd2aTIy7aTc2MTdxFsLP8NELuHU9gBs=;
 b=eAjp1l+ACnsxWFGLvSe3D9D3Wcvj5IiDvyTScGfz3ElCfnNrzymSvSUz
 fAQbCzURzYn7PRxQBNGKDke5eWNGPWdCY3VC3ocx8l6jhjlMGSKaxyddJ
 sNQoFEe5d6sW2p2ixzJKR+I1b8RsSt8415sQZCKM3YY4r3Rs+ZCTNcbN0
 OCb0AoH5r4ZLwAGgKlTUaza5Ftkl8ApkidvtxFqI3RXqg6CoHnhHersv2
 ja3vvDhShW6oJuOyIjnFvGI8imftxMoCMYzaDwuW5sInTjJFD3DgET5d4
 JypSAWTKqrhZdXrSEY3vgGSiTqgOju+T/VJNTnaOkSEaNCDxaRrsRrzgN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4698997"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4698997"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11231800"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.59])
 ([10.249.254.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 06:05:03 -0700
Message-ID: <69a4781527ff385895c7ecb02848db384cff2375.camel@linux.intel.com>
Subject: Re: [PATCH v4 2/4] drm/ttm: Use LRU hitches
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Somalapuram, Amaranath" <asomalap@amd.com>, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
Date: Mon, 11 Mar 2024 14:04:59 +0100
In-Reply-To: <40fd8ad3-c63f-ce79-461c-519d273c2d36@amd.com>
References: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
 <20240306070125.27071-3-thomas.hellstrom@linux.intel.com>
 <40fd8ad3-c63f-ce79-461c-519d273c2d36@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

Hi! Thanks for reviewing.=20
On Fri, 2024-03-08 at 18:50 +0530, Somalapuram, Amaranath wrote:
>=20
> On 3/6/2024 12:31 PM, Thomas Hellstr=C3=B6m wrote:
> > Have iterators insert themselves into the list they are iterating
> > over using hitch list nodes. Since only the iterator owner
> > can remove these list nodes from the list, it's safe to unlock
> > the list and when continuing, use them as a starting point. Due to
> > the way LRU bumping works in TTM, newly added items will not be
> > missed, and bumped items will be iterated over a second time before
> > reaching the end of the list.
> >=20
> > The exception is list with bulk move sublists. When bumping a
> > sublist, a hitch that is part of that sublist will also be moved
> > and we might miss items if restarting from it. This will be
> > addressed in a later patch.
> >=20
> > v2:
> > - Updated ttm_resource_cursor_fini() documentation.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
> > =C2=A0 drivers/gpu/drm/ttm/ttm_device.c=C2=A0=C2=A0 |=C2=A0 9 ++-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_resource.c | 94 ++++++++++++++++++++----=
-
> > -----
> > =C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0 | 16 +++-=
-
> > =C2=A0 4 files changed, 82 insertions(+), 38 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > b/drivers/gpu/drm/ttm/ttm_bo.c
> > index e059b1e1b13b..b6f75a0ff2e5 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -622,6 +622,7 @@ int ttm_mem_evict_first(struct ttm_device
> > *bdev,
> > =C2=A0=C2=A0		if (locked)
> > =C2=A0=C2=A0			dma_resv_unlock(res->bo->base.resv);
> > =C2=A0=C2=A0	}
> > +	ttm_resource_cursor_fini_locked(&cursor);
> > =C2=A0=20
> > =C2=A0=C2=A0	if (!bo) {
> > =C2=A0=C2=A0		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> > b/drivers/gpu/drm/ttm/ttm_device.c
> > index f27406e851e5..e8a6a1dab669 100644
> > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -169,12 +169,17 @@ int ttm_device_swapout(struct ttm_device
> > *bdev, struct ttm_operation_ctx *ctx,
> > =C2=A0=C2=A0			num_pages =3D PFN_UP(bo->base.size);
> > =C2=A0=C2=A0			ret =3D ttm_bo_swapout(bo, ctx, gfp_flags);
> > =C2=A0=C2=A0			/* ttm_bo_swapout has dropped the lru_lock
> > */
> > -			if (!ret)
> > +			if (!ret) {
> > +				ttm_resource_cursor_fini(&cursor);
>=20
> is spin_unlock(&bdev->lru_lock) missing ?
>=20
> > =C2=A0=C2=A0				return num_pages;
> > -			if (ret !=3D -EBUSY)
> > +			}
> > +			if (ret !=3D -EBUSY) {
> > +				ttm_resource_cursor_fini(&cursor);
>=20
> is spin_unlock(&bdev->lru_lock) missing ?

The ttm_bo_swapout() function returns unlocked depending on the error
code. IIRC it only returns locked on -EBUSY. That is something we
hopefully can change when this series is in place.

/Thomas


>=20
> Regards,
> S.Amarnath
> > =C2=A0=C2=A0				return ret;
> > +			}
> > =C2=A0=C2=A0		}
> > =C2=A0=C2=A0	}
> > +	ttm_resource_cursor_fini_locked(&cursor);
> > =C2=A0=C2=A0	spin_unlock(&bdev->lru_lock);
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > b/drivers/gpu/drm/ttm/ttm_resource.c
> > index ee1865f82cb4..971014fca10a 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > @@ -32,6 +32,37 @@
> > =C2=A0=20
> > =C2=A0 #include <drm/drm_util.h>
> > =C2=A0=20
> > +/**
> > + * ttm_resource_cursor_fini_locked() - Finalize the LRU list
> > cursor usage
> > + * @cursor: The struct ttm_resource_cursor to finalize.
> > + *
> > + * The function pulls the LRU list cursor off any lists it was
> > previusly
> > + * attached to. Needs to be called with the LRU lock held. The
> > function
> > + * can be called multiple times after eachother.
> > + */
> > +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor
> > *cursor)
> > +{
> > +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> > +	list_del_init(&cursor->hitch.link);
> > +}
> > +
> > +/**
> > + * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
> > + * @cursor: The struct ttm_resource_cursor to finalize.
> > + *
> > + * The function pulls the LRU list cursor off any lists it was
> > previusly
> > + * attached to. Needs to be called without the LRU list lock held.
> > The
> > + * function can be called multiple times after eachother.
> > + */
> > +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
> > +{
> > +	spinlock_t *lru_lock =3D &cursor->man->bdev->lru_lock;
> > +
> > +	spin_lock(lru_lock);
> > +	ttm_resource_cursor_fini_locked(cursor);
> > +	spin_unlock(lru_lock);
> > +}
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * ttm_lru_bulk_move_init - initialize a bulk move structur=
e
> > =C2=A0=C2=A0 * @bulk: the structure to init
> > @@ -483,62 +514,63 @@ void ttm_resource_manager_debug(struct
> > ttm_resource_manager *man,
> > =C2=A0 EXPORT_SYMBOL(ttm_resource_manager_debug);
> > =C2=A0=20
> > =C2=A0 /**
> > - * ttm_resource_manager_first
> > - *
> > - * @man: resource manager to iterate over
> > + * ttm_resource_manager_next() - Continue iterating over the
> > resource manager
> > + * resources
> > =C2=A0=C2=A0 * @cursor: cursor to record the position
> > =C2=A0=C2=A0 *
> > - * Returns the first resource from the resource manager.
> > + * Return: The next resource from the resource manager.
> > =C2=A0=C2=A0 */
> > =C2=A0 struct ttm_resource *
> > -ttm_resource_manager_first(struct ttm_resource_manager *man,
> > -			=C2=A0=C2=A0 struct ttm_resource_cursor *cursor)
> > +ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
> > =C2=A0 {
> > +	struct ttm_resource_manager *man =3D cursor->man;
> > =C2=A0=C2=A0	struct ttm_lru_item *lru;
> > =C2=A0=20
> > =C2=A0=C2=A0	lockdep_assert_held(&man->bdev->lru_lock);
> > =C2=A0=20
> > -	for (cursor->priority =3D 0; cursor->priority <
> > TTM_MAX_BO_PRIORITY;
> > -	=C2=A0=C2=A0=C2=A0=C2=A0 ++cursor->priority)
> > -		list_for_each_entry(lru, &man->lru[cursor-
> > >priority], link) {
> > -			if (ttm_lru_item_is_res(lru))
> > +	do {
> > +		lru =3D &cursor->hitch;
> > +		list_for_each_entry_continue(lru, &man-
> > >lru[cursor->priority], link) {
> > +			if (ttm_lru_item_is_res(lru)) {
> > +				list_move(&cursor->hitch.link,
> > &lru->link);
> > =C2=A0=C2=A0				return ttm_lru_item_to_res(lru);
> > +			}
> > =C2=A0=C2=A0		}
> > =C2=A0=20
> > +		if (++cursor->priority >=3D TTM_MAX_BO_PRIORITY)
> > +			break;
> > +
> > +		list_move(&cursor->hitch.link, &man->lru[cursor-
> > >priority]);
> > +	} while (true);
> > +
> > +	list_del_init(&cursor->hitch.link);
> > +
> > =C2=A0=C2=A0	return NULL;
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 /**
> > - * ttm_resource_manager_next
> > - *
> > + * ttm_resource_manager_first() - Start iterating over the
> > resources
> > + * of a resource manager
> > =C2=A0=C2=A0 * @man: resource manager to iterate over
> > =C2=A0=C2=A0 * @cursor: cursor to record the position
> > - * @res: the current resource pointer
> > =C2=A0=C2=A0 *
> > - * Returns the next resource from the resource manager.
> > + * Initializes the cursor and starts iterating. When done
> > iterating,
> > + * the caller must explicitly call ttm_resource_cursor_fini().
> > + *
> > + * Return: The first resource from the resource manager.
> > =C2=A0=C2=A0 */
> > =C2=A0 struct ttm_resource *
> > -ttm_resource_manager_next(struct ttm_resource_manager *man,
> > -			=C2=A0 struct ttm_resource_cursor *cursor,
> > -			=C2=A0 struct ttm_resource *res)
> > +ttm_resource_manager_first(struct ttm_resource_manager *man,
> > +			=C2=A0=C2=A0 struct ttm_resource_cursor *cursor)
> > =C2=A0 {
> > -	struct ttm_lru_item *lru =3D &res->lru;
> > -
> > =C2=A0=C2=A0	lockdep_assert_held(&man->bdev->lru_lock);
> > =C2=A0=20
> > -	list_for_each_entry_continue(lru, &man->lru[cursor-
> > >priority], link) {
> > -		if (ttm_lru_item_is_res(lru))
> > -			return ttm_lru_item_to_res(lru);
> > -	}
> > +	cursor->priority =3D 0;
> > +	cursor->man =3D man;
> > +	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> > +	list_move(&cursor->hitch.link, &man->lru[cursor-
> > >priority]);
> > =C2=A0=20
> > -	for (++cursor->priority; cursor->priority <
> > TTM_MAX_BO_PRIORITY;
> > -	=C2=A0=C2=A0=C2=A0=C2=A0 ++cursor->priority)
> > -		list_for_each_entry(lru, &man->lru[cursor-
> > >priority], link) {
> > -			if (ttm_lru_item_is_res(lru))
> > -				ttm_lru_item_to_res(lru);
> > -		}
> > -
> > -	return NULL;
> > +	return ttm_resource_manager_next(cursor);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter
> > *iter,
> > diff --git a/include/drm/ttm/ttm_resource.h
> > b/include/drm/ttm/ttm_resource.h
> > index cad8c5476198..b9043c183205 100644
> > --- a/include/drm/ttm/ttm_resource.h
> > +++ b/include/drm/ttm/ttm_resource.h
> > @@ -271,15 +271,23 @@ ttm_lru_item_to_res(struct ttm_lru_item
> > *item)
> > =C2=A0=20
> > =C2=A0 /**
> > =C2=A0=C2=A0 * struct ttm_resource_cursor
> > - *
> > + * @man: The resource manager currently being iterated over
> > + * @hitch: A hitch list node inserted before the next resource
> > + * to iterate over.
> > =C2=A0=C2=A0 * @priority: the current priority
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Cursor to iterate over the resources in a manager.
> > =C2=A0=C2=A0 */
> > =C2=A0 struct ttm_resource_cursor {
> > +	struct ttm_resource_manager *man;
> > +	struct ttm_lru_item hitch;
> > =C2=A0=C2=A0	unsigned int priority;
> > =C2=A0 };
> > =C2=A0=20
> > +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor
> > *cursor);
> > +
> > +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * struct ttm_lru_bulk_move_pos
> > =C2=A0=C2=A0 *
> > @@ -435,9 +443,7 @@ struct ttm_resource *
> > =C2=A0 ttm_resource_manager_first(struct ttm_resource_manager *man,
> > =C2=A0=C2=A0			=C2=A0=C2=A0 struct ttm_resource_cursor *cursor);
> > =C2=A0 struct ttm_resource *
> > -ttm_resource_manager_next(struct ttm_resource_manager *man,
> > -			=C2=A0 struct ttm_resource_cursor *cursor,
> > -			=C2=A0 struct ttm_resource *res);
> > +ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
> > =C2=A0=20
> > =C2=A0 /**
> > =C2=A0=C2=A0 * ttm_resource_manager_for_each_res - iterate over all res=
ources
> > @@ -449,7 +455,7 @@ ttm_resource_manager_next(struct
> > ttm_resource_manager *man,
> > =C2=A0=C2=A0 */
> > =C2=A0 #define ttm_resource_manager_for_each_res(man, cursor,
> > res)		\
> > =C2=A0=C2=A0	for (res =3D ttm_resource_manager_first(man, cursor);
> > res;	\
> > -	=C2=A0=C2=A0=C2=A0=C2=A0 res =3D ttm_resource_manager_next(man, curso=
r, res))
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 res =3D ttm_resource_manager_next(cursor))
> > =C2=A0=20
> > =C2=A0 struct ttm_kmap_iter *
> > =C2=A0 ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,

