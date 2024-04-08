Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AF289BF96
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 14:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021FE11257B;
	Mon,  8 Apr 2024 12:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFA6eZUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA4411256B;
 Mon,  8 Apr 2024 12:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712581005; x=1744117005;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NyEg3N831ewvY4+wJPN2c3RYjNSvuHRv1RkWWaFFTBg=;
 b=UFA6eZUTERDYlF0dI4voPARIkMf2OtG2KZu/yBXH0SQ44U+cOcJL3Wb1
 oPcQu4wYbAcCbKYeyyrdTR2idnR9lCuo+XHMZB5ZRT87IL8gk03Q0wVEn
 2SjyBuQ1G7GmVsrfYStzLU6tIrn6mItlHwzHx8QKqyBvoLGz5Ujp/2PMm
 HbF9s2/+kSLNUm7fhhhDmYVI8Sf8c8OMpZPlpxTCsHbMK706d0CxxRflz
 0TYN4xnyESAqRIBHSQykrPBpsD49+0eZ/trQgL4WvbtHssVT9U0lqpUrj
 l/zU+cmYETyNO2NDc0MZ4qvRmVttLo1RrZ0LVIxiiN51yp+wNxl2SPIVQ w==;
X-CSE-ConnectionGUID: UY0G2aACSb2KwZz4MNgDwg==
X-CSE-MsgGUID: l92muYGFRXCQMZVre/F/5g==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7712118"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7712118"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:56:44 -0700
X-CSE-ConnectionGUID: MTjpoAQQTPSZAJmLZiehDQ==
X-CSE-MsgGUID: hKemHWnTTYq3aIbEAuyzMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="57347042"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO [10.249.254.38])
 ([10.249.254.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:56:43 -0700
Message-ID: <8dad00da4af3ef0761cd1c0faa5694c31f1b2190.camel@linux.intel.com>
Subject: Re: [PATCH 2/8] drm/ttm: Use LRU hitches
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 08 Apr 2024 14:56:40 +0200
In-Reply-To: <2bf874fb-131c-43b8-b18b-2a827b5c8d97@amd.com>
References: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
 <20240329145707.3087-3-thomas.hellstrom@linux.intel.com>
 <2bf874fb-131c-43b8-b18b-2a827b5c8d97@amd.com>
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

On Fri, 2024-04-05 at 14:41 +0200, Christian K=C3=B6nig wrote:
> Am 29.03.24 um 15:57 schrieb Thomas Hellstr=C3=B6m:
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
> > =C2=A0=C2=A0				return num_pages;
> > -			if (ret !=3D -EBUSY)
> > +			}
> > +			if (ret !=3D -EBUSY) {
> > +				ttm_resource_cursor_fini(&cursor);
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
> > index 7aa5ca5c0e33..ccc31ad85e3b 100644
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
> > @@ -484,62 +515,63 @@ void ttm_resource_manager_debug(struct
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
>=20
> Why are you switching first/next here? It took me a moment to realize
> that the two functions switched places.

Hmm. That was probably when _first() started using _next(), before
realizing they already had declarations. I'll change that back for
clarity.

>=20
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
>=20
> That should probably be a list_add() instead.

Yes I can change that. The list head is initialized in
ttm_lru_item_init() so it's not really a bug, just slightly
inefficient.

/Thomas


>=20
> Need to take a closer look what actually changed when the functions
> keep=20
> their original order.
>=20
> Christian.
>=20
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
> > index 4babc4ff10b0..dfc01258c981 100644
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
> > @@ -438,9 +446,7 @@ struct ttm_resource *
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
> > @@ -452,7 +458,7 @@ ttm_resource_manager_next(struct
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
>=20

