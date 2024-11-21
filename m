Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4951C9D502F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 16:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B4110E1D6;
	Thu, 21 Nov 2024 15:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBHTalCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A2610E1D6;
 Thu, 21 Nov 2024 15:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732204466; x=1763740466;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IWOHRX2Hgf/ezbJUq+hEAMDlWu99oXhuzpek5N1G16Y=;
 b=NBHTalCaCN/CDp4NV+Eza0wDrLagJQWS3FuR00wp5Gr2GkNtWlN/JwZj
 jIU809S+EI3u1nDJH8SvXZUwgpQR50y78AasSzot/2oVRhW4kAn9gXCxC
 QxTfTjgZ8F+KPEdm9F4uyof5Q96wzeZs5GSdomou3Paq+pNSKkNENGHbf
 qf0TYA6IQ86SQiMKsWDuyHqo6j7cX7I0l7fyHHsrXLSbcUgkg49TE54w6
 ONEDO9hvn9wY1VHtwG6VdnxaQTwlLTNK2uss7bdo2YolFpNWa8H/FPY/8
 WiOckNCArNzeq+WyNtVVqlI3ozy6fdsqV1Xcg4+GZ/ZspDmLVyygArSvH A==;
X-CSE-ConnectionGUID: HUUuGEHGRHusLREGqwY42g==
X-CSE-MsgGUID: WbtKbwrPTIeuMzCHiSPSng==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36234097"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="36234097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 07:54:26 -0800
X-CSE-ConnectionGUID: bjV6sd2rQY+NKjbGYCip2Q==
X-CSE-MsgGUID: Ply1mVrrTvKZ43/qVNZ+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="91100010"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.246.104])
 ([10.245.246.104])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 07:54:23 -0800
Message-ID: <0ce73ccf4f0b2151ea888e8ea921fde2abbdf03a.camel@linux.intel.com>
Subject: Re: [PATCH v14 1/8] drm/ttm: Balance ttm_resource_cursor_init() and
 ttm_resource_cursor_fini()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Date: Thu, 21 Nov 2024 16:54:19 +0100
In-Reply-To: <8709c4a6-549b-4e19-8bb7-f0d4740ff57d@amd.com>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-2-thomas.hellstrom@linux.intel.com>
 <8709c4a6-549b-4e19-8bb7-f0d4740ff57d@amd.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
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

On Wed, 2024-11-20 at 11:51 +0100, Christian K=C3=B6nig wrote:
> Am 15.11.24 um 16:01 schrieb Thomas Hellstr=C3=B6m:
> > Make the interface more symmetric by providing and using a
> > ttm_resource_cursor_init().
> >=20
> > v10:
> > - Fix a stray newline (Matthew Brost)
> > - Update kerneldoc (Matthew Brost)
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>=20
> Did you plan to merge this through drm-misc-next or the XE branch?
>=20
> If through drm-misc-next then I would go ahead and push this patch
> since=20
> that is really a stand alone cleanup.

I was planning to merge it all through drm-xe-next, so I'll hold off
merging that patch.

Thanks,
Thomas

>=20
> Regards,
> Christian.
>=20
> > ---
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 3 ++-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_bo_util.c=C2=A0 |=C2=A0 3 ++-
> > =C2=A0 drivers/gpu/drm/ttm/ttm_resource.c | 35 ++++++++++++++++++++----=
-
> > -----
> > =C2=A0 include/drm/ttm/ttm_resource.h=C2=A0=C2=A0=C2=A0=C2=A0 | 11 ++++=
+-----
> > =C2=A0 4 files changed, 34 insertions(+), 18 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 48c5365efca1..06d6a452c4f4 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -450,7 +450,8 @@ int ttm_bo_evict_first(struct ttm_device *bdev,
> > struct ttm_resource_manager *man
> > =C2=A0=C2=A0	int ret =3D 0;
> > =C2=A0=20
> > =C2=A0=C2=A0	spin_lock(&bdev->lru_lock);
> > -	res =3D ttm_resource_manager_first(man, &cursor);
> > +	ttm_resource_cursor_init(&cursor, man);
> > +	res =3D ttm_resource_manager_first(&cursor);
> > =C2=A0=C2=A0	ttm_resource_cursor_fini(&cursor);
> > =C2=A0=C2=A0	if (!res) {
> > =C2=A0=C2=A0		ret =3D -ENOENT;
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index d939925efa81..917096bd5f68 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -865,7 +865,8 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk
> > *walk, struct ttm_device *bdev,
> > =C2=A0=C2=A0	s64 lret;
> > =C2=A0=20
> > =C2=A0=C2=A0	spin_lock(&bdev->lru_lock);
> > -	ttm_resource_manager_for_each_res(man, &cursor, res) {
> > +	ttm_resource_cursor_init(&cursor, man);
> > +	ttm_resource_manager_for_each_res(&cursor, res) {
> > =C2=A0=C2=A0		struct ttm_buffer_object *bo =3D res->bo;
> > =C2=A0=C2=A0		bool bo_needs_unlock =3D false;
> > =C2=A0=C2=A0		bool bo_locked =3D false;
> > diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > b/drivers/gpu/drm/ttm/ttm_resource.c
> > index a87665eb28a6..e19360cc7930 100644
> > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > @@ -81,6 +81,23 @@ static void ttm_bulk_move_drop_cursors(struct
> > ttm_lru_bulk_move *bulk)
> > =C2=A0=C2=A0		ttm_resource_cursor_clear_bulk(cursor);
> > =C2=A0 }
> > =C2=A0=20
> > +/**
> > + * ttm_resource_cursor_init() - Initialize a struct
> > ttm_resource_cursor
> > + * @cursor: The cursor to initialize.
> > + * @man: The resource manager.
> > + *
> > + * Initialize the cursor before using it for iteration.
> > + */
> > +void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man)
> > +{
> > +	cursor->priority =3D 0;
> > +	cursor->man =3D man;
> > +	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> > +	INIT_LIST_HEAD(&cursor->bulk_link);
> > +	INIT_LIST_HEAD(&cursor->hitch.link);
> > +}
> > +
> > =C2=A0 /**
> > =C2=A0=C2=A0 * ttm_resource_cursor_fini() - Finalize the LRU list curso=
r
> > usage
> > =C2=A0=C2=A0 * @cursor: The struct ttm_resource_cursor to finalize.
> > @@ -593,7 +610,6 @@ ttm_resource_cursor_check_bulk(struct
> > ttm_resource_cursor *cursor,
> > =C2=A0 /**
> > =C2=A0=C2=A0 * ttm_resource_manager_first() - Start iterating over the
> > resources
> > =C2=A0=C2=A0 * of a resource manager
> > - * @man: resource manager to iterate over
> > =C2=A0=C2=A0 * @cursor: cursor to record the position
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Initializes the cursor and starts iterating. When done
> > iterating,
> > @@ -602,17 +618,16 @@ ttm_resource_cursor_check_bulk(struct
> > ttm_resource_cursor *cursor,
> > =C2=A0=C2=A0 * Return: The first resource from the resource manager.
> > =C2=A0=C2=A0 */
> > =C2=A0 struct ttm_resource *
> > -ttm_resource_manager_first(struct ttm_resource_manager *man,
> > -			=C2=A0=C2=A0 struct ttm_resource_cursor *cursor)
> > +ttm_resource_manager_first(struct ttm_resource_cursor *cursor)
> > =C2=A0 {
> > -	lockdep_assert_held(&man->bdev->lru_lock);
> > +	struct ttm_resource_manager *man =3D cursor->man;
> > =C2=A0=20
> > -	cursor->priority =3D 0;
> > -	cursor->man =3D man;
> > -	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> > -	INIT_LIST_HEAD(&cursor->bulk_link);
> > -	list_add(&cursor->hitch.link, &man->lru[cursor-
> > >priority]);
> > +	if (WARN_ON_ONCE(!man))
> > +		return NULL;
> > +
> > +	lockdep_assert_held(&man->bdev->lru_lock);
> > =C2=A0=20
> > +	list_move(&cursor->hitch.link, &man->lru[cursor-
> > >priority]);
> > =C2=A0=C2=A0	return ttm_resource_manager_next(cursor);
> > =C2=A0 }
> > =C2=A0=20
> > @@ -648,8 +663,6 @@ ttm_resource_manager_next(struct
> > ttm_resource_cursor *cursor)
> > =C2=A0=C2=A0		ttm_resource_cursor_clear_bulk(cursor);
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > -	ttm_resource_cursor_fini(cursor);
> > -
> > =C2=A0=C2=A0	return NULL;
> > =C2=A0 }
> > =C2=A0=20
> > diff --git a/include/drm/ttm/ttm_resource.h
> > b/include/drm/ttm/ttm_resource.h
> > index be034be56ba1..e1f3b95d73b6 100644
> > --- a/include/drm/ttm/ttm_resource.h
> > +++ b/include/drm/ttm/ttm_resource.h
> > @@ -325,6 +325,9 @@ struct ttm_resource_cursor {
> > =C2=A0=C2=A0	unsigned int priority;
> > =C2=A0 };
> > =C2=A0=20
> > +void ttm_resource_cursor_init(struct ttm_resource_cursor *cursor,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man);
> > +
> > =C2=A0 void ttm_resource_cursor_fini(struct ttm_resource_cursor
> > *cursor);
> > =C2=A0=20
> > =C2=A0 /**
> > @@ -456,8 +459,7 @@ void ttm_resource_manager_debug(struct
> > ttm_resource_manager *man,
> > =C2=A0=C2=A0				struct drm_printer *p);
> > =C2=A0=20
> > =C2=A0 struct ttm_resource *
> > -ttm_resource_manager_first(struct ttm_resource_manager *man,
> > -			=C2=A0=C2=A0 struct ttm_resource_cursor *cursor);
> > +ttm_resource_manager_first(struct ttm_resource_cursor *cursor);
> > =C2=A0 struct ttm_resource *
> > =C2=A0 ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
> > =C2=A0=20
> > @@ -466,14 +468,13 @@ ttm_lru_first_res_or_null(struct list_head
> > *head);
> > =C2=A0=20
> > =C2=A0 /**
> > =C2=A0=C2=A0 * ttm_resource_manager_for_each_res - iterate over all res=
ources
> > - * @man: the resource manager
> > =C2=A0=C2=A0 * @cursor: struct ttm_resource_cursor for the current posi=
tion
> > =C2=A0=C2=A0 * @res: the current resource
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Iterate over all the evictable resources in a resource
> > manager.
> > =C2=A0=C2=A0 */
> > -#define ttm_resource_manager_for_each_res(man, cursor,
> > res)		\
> > -	for (res =3D ttm_resource_manager_first(man, cursor);
> > res;	\
> > +#define ttm_resource_manager_for_each_res(cursor, res)	\
> > +	for (res =3D ttm_resource_manager_first(cursor); res;	\
> > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 res =3D ttm_resource_manager_next=
(cursor))
> > =C2=A0=20
> > =C2=A0 struct ttm_kmap_iter *
>=20

