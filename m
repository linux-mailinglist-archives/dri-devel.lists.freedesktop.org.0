Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C26948B50
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 10:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0699810E323;
	Tue,  6 Aug 2024 08:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoFoAOCV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D56710E325
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 08:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722932992; x=1754468992;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hbPJTuBU9ZQI4ntSxt8fuvZ+/aFkOeV7exhWV905ums=;
 b=CoFoAOCVBxqp/shgNzvdAYKLqRqffdXP9hF4byiAQB1AG83BLCByQLmn
 9fCiMCpriRsOQOPPQWpHi68ACM4Y3f0XxFCvxD+pA6LKi9v1N/U/H3yq/
 UdnCfd5N+wVhM1IzCL7itIaWIHrzMt3aleYVszue88dyKvPatFNSj4wCq
 N1zbHpWQYPQBhLVztHCsS5EeWqOy0QwlKaB1EF1ld3UkliWpjx9b5C4XK
 F12oyRmXaMK6B/CidW5sfM2DZ+uaeLVUSjoiFQtxlUoWu1n+x09JTBz60
 IGjiu1Eb8H1GV/foxik+HDMBU9h/nDb6UBn0BI8vbOzg2ghoulrA2+g5s A==;
X-CSE-ConnectionGUID: ZHX76Ea3QpupkLKIgGugZw==
X-CSE-MsgGUID: 65bQr8LgTOyfqaibKKR3lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20785303"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="20785303"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 01:29:52 -0700
X-CSE-ConnectionGUID: z3Lod4urSlSsntanO8dkNw==
X-CSE-MsgGUID: 5jYjUhDaQ2O58GbtZ8II4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="56661666"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.97])
 ([10.245.244.97])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 01:29:50 -0700
Message-ID: <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org
Date: Tue, 06 Aug 2024 10:29:34 +0200
In-Reply-To: <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
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

Hi, Christian.

On Thu, 2024-07-11 at 14:01 +0200, Christian K=C3=B6nig wrote:
> Am 10.07.24 um 20:19 schrieb Matthew Brost:
> > On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian K=C3=B6nig wrote:
> > > That is something drivers really shouldn't mess with.
> > >=20
> > Thomas uses this in Xe to implement a shrinker [1]. Seems to need
> > to
> > remain available for drivers.
>=20
> No, that is exactly what I try to prevent with that.
>=20
> This is an internally thing of TTM and drivers should never use it
> directly.

That driver-facing LRU walker is a direct response/solution to this
comment that you made in the first shrinker series:

https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.c=
om/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9


That is also mentioned in the cover letter of the recent shrinker
series, and this walker has been around in that shrinker series for
more than half a year now so if you think it's not the correct driver
facing API IMHO that should be addressed by a review comment in that
series rather than in posting a conflicting patch?

So assuming that we still want the driver to register the shrinker,
IMO that helper abstracts away all the nasty locking and pitfalls for a
driver-registered shrinker, and is similar in structure to for example
the pagewalk helper in mm/pagewalk.c.

An alternative that could be tried as a driver-facing API is to provide
a for_each_bo_in_lru_lock() macro where the driver open-codes
"process_bo()" inside the for loop but I tried this and found it quite
fragile since the driver might exit the loop without performing the
necessary cleanup.

However with using scoped_guard() in linux/cleanup.h that could
probably be mitigated to some exent, but I still think that a walker
helper like this is the safer choice and given the complexity of a for_
macro involving scoped_guard(), I think the walker helper is the
easiest-to-maintain solution moving forward.

But open to suggestions.

Thanks
Thomas


>=20
> Regards,
> Christian.
>=20
> >=20
> > Matt
> >=20
> > [1]
> > https://patchwork.freedesktop.org/patch/602165/?series=3D131815&rev=3D6
> >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> > > =C2=A0 drivers/gpu/drm/ttm/ttm_bo_util.c |=C2=A0 2 +
> > > =C2=A0 drivers/gpu/drm/ttm/ttm_bo_util.h | 67
> > > +++++++++++++++++++++++++++++++
> > > =C2=A0 include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 35 ----------------
> > > =C2=A0 4 files changed, 70 insertions(+), 35 deletions(-)
> > > =C2=A0 create mode 100644 drivers/gpu/drm/ttm/ttm_bo_util.h
> > >=20
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > index 0131ec802066..41bee8696e69 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > @@ -45,6 +45,7 @@
> > > =C2=A0 #include <linux/dma-resv.h>
> > > =C2=A0=20
> > > =C2=A0 #include "ttm_module.h"
> > > +#include "ttm_bo_util.h"
> > > =C2=A0=20
> > > =C2=A0 static void ttm_bo_mem_space_debug(struct ttm_buffer_object
> > > *bo,
> > > =C2=A0=C2=A0					struct ttm_placement
> > > *placement)
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > index 3c07f4712d5c..03e28e3d0d03 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > @@ -37,6 +37,8 @@
> > > =C2=A0=20
> > > =C2=A0 #include <drm/drm_cache.h>
> > > =C2=A0=20
> > > +#include "ttm_bo_util.h"
> > > +
> > > =C2=A0 struct ttm_transfer_obj {
> > > =C2=A0=C2=A0	struct ttm_buffer_object base;
> > > =C2=A0=C2=A0	struct ttm_buffer_object *bo;
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.h
> > > b/drivers/gpu/drm/ttm/ttm_bo_util.h
> > > new file mode 100644
> > > index 000000000000..c19b50809208
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.h
> > > @@ -0,0 +1,67 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > > +/***************************************************************
> > > ***********
> > > + * Copyright 2024 Advanced Micro Devices, Inc.
> > > + *
> > > + * Permission is hereby granted, free of charge, to any person
> > > obtaining a
> > > + * copy of this software and associated documentation files (the
> > > "Software"),
> > > + * to deal in the Software without restriction, including
> > > without limitation
> > > + * the rights to use, copy, modify, merge, publish, distribute,
> > > sublicense,
> > > + * and/or sell copies of the Software, and to permit persons to
> > > whom the
> > > + * Software is furnished to do so, subject to the following
> > > conditions:
> > > + *
> > > + * The above copyright notice and this permission notice shall
> > > be included in
> > > + * all copies or substantial portions of the Software.
> > > + *
> > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
> > > KIND, EXPRESS OR
> > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > > MERCHANTABILITY,
> > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.=C2=A0 IN NO
> > > EVENT SHALL
> > > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
> > > DAMAGES OR
> > > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> > > OTHERWISE,
> > > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
> > > THE USE OR
> > > + * OTHER DEALINGS IN THE SOFTWARE.
> > > + *
> > > +
> > > *****************************************************************
> > > *********/
> > > +#ifndef _TTM_BO_UTIL_H_
> > > +#define _TTM_BO_UTIL_H_
> > > +
> > > +struct ww_acquire_ctx;
> > > +
> > > +struct ttm_buffer_object;
> > > +struct ttm_operation_ctx;
> > > +struct ttm_lru_walk;
> > > +
> > > +/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> > > +struct ttm_lru_walk_ops {
> > > +	/**
> > > +	 * process_bo - Process this bo.
> > > +	 * @walk: struct ttm_lru_walk describing the walk.
> > > +	 * @bo: A locked and referenced buffer object.
> > > +	 *
> > > +	 * Return: Negative error code on error, User-defined
> > > positive value
> > > +	 * (typically, but not always, size of the processed bo)
> > > on success.
> > > +	 * On success, the returned values are summed by the
> > > walk and the
> > > +	 * walk exits when its target is met.
> > > +	 * 0 also indicates success, -EBUSY means this bo was
> > > skipped.
> > > +	 */
> > > +	s64 (*process_bo)(struct ttm_lru_walk *walk,
> > > +			=C2=A0 struct ttm_buffer_object *bo);
> > > +};
> > > +
> > > +/**
> > > + * struct ttm_lru_walk - Structure describing a LRU walk.
> > > + */
> > > +struct ttm_lru_walk {
> > > +	/** @ops: Pointer to the ops structure. */
> > > +	const struct ttm_lru_walk_ops *ops;
> > > +	/** @ctx: Pointer to the struct ttm_operation_ctx. */
> > > +	struct ttm_operation_ctx *ctx;
> > > +	/** @ticket: The struct ww_acquire_ctx if any. */
> > > +	struct ww_acquire_ctx *ticket;
> > > +	/** @tryock_only: Only use trylock for locking. */
> > > +	bool trylock_only;
> > > +};
> > > +
> > > +s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > > ttm_device *bdev,
> > > +			=C2=A0=C2=A0 struct ttm_resource_manager *man, s64
> > > target);
> > > +
> > > +#endif
> > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > index d1a732d56259..5f7c967222a2 100644
> > > --- a/include/drm/ttm/ttm_bo.h
> > > +++ b/include/drm/ttm/ttm_bo.h
> > > @@ -194,41 +194,6 @@ struct ttm_operation_ctx {
> > > =C2=A0=C2=A0	uint64_t bytes_moved;
> > > =C2=A0 };
> > > =C2=A0=20
> > > -struct ttm_lru_walk;
> > > -
> > > -/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> > > -struct ttm_lru_walk_ops {
> > > -	/**
> > > -	 * process_bo - Process this bo.
> > > -	 * @walk: struct ttm_lru_walk describing the walk.
> > > -	 * @bo: A locked and referenced buffer object.
> > > -	 *
> > > -	 * Return: Negative error code on error, User-defined
> > > positive value
> > > -	 * (typically, but not always, size of the processed bo)
> > > on success.
> > > -	 * On success, the returned values are summed by the
> > > walk and the
> > > -	 * walk exits when its target is met.
> > > -	 * 0 also indicates success, -EBUSY means this bo was
> > > skipped.
> > > -	 */
> > > -	s64 (*process_bo)(struct ttm_lru_walk *walk, struct
> > > ttm_buffer_object *bo);
> > > -};
> > > -
> > > -/**
> > > - * struct ttm_lru_walk - Structure describing a LRU walk.
> > > - */
> > > -struct ttm_lru_walk {
> > > -	/** @ops: Pointer to the ops structure. */
> > > -	const struct ttm_lru_walk_ops *ops;
> > > -	/** @ctx: Pointer to the struct ttm_operation_ctx. */
> > > -	struct ttm_operation_ctx *ctx;
> > > -	/** @ticket: The struct ww_acquire_ctx if any. */
> > > -	struct ww_acquire_ctx *ticket;
> > > -	/** @tryock_only: Only use trylock for locking. */
> > > -	bool trylock_only;
> > > -};
> > > -
> > > -s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > > ttm_device *bdev,
> > > -			=C2=A0=C2=A0 struct ttm_resource_manager *man, s64
> > > target);
> > > -
> > > =C2=A0 /**
> > > =C2=A0=C2=A0 * ttm_bo_get - reference a struct ttm_buffer_object
> > > =C2=A0=C2=A0 *
> > > --=20
> > > 2.34.1
> > >=20
>=20

