Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E5B956979
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 13:39:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32B610E24C;
	Mon, 19 Aug 2024 11:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCCfnnrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AD310E24C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724067540; x=1755603540;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3hyeem3kBKGhpwQoKYNqqGKZqX3wX+hPi8fUmztD75g=;
 b=YCCfnnrw4l4Aj97ESnAKcaxdsVrGYUw6Xlz+QYWjB0l/hUycNQSXs52V
 RFL/NP43tDcDpc1jrb4ZoIXdEVATX6OMRdVfCrM5NoFwkLudka2wgF8RY
 STLgn2Fj/Vz6csDUHAzOUO1WyyJTuQLd5i4Jll2l0kJGqfH0l4T+M66WC
 CDJMR/DTOYS2RftgiVGL7CCN/IE+TuodnzbNs2p0JUj2j6YwTAQ+Wvcd1
 PeHZJumo89Q2OaLS9eRWvr7ys8Zs6pcpIb0DK9qs1y32ExJ00QTPRFe/M
 f4kYJsSgymaU0MQnZ0N4I2dYAmzG6JUE3AI0ghO3+tWNPL6yqDC/J3DS7 w==;
X-CSE-ConnectionGUID: WF6ec+CvSHG8hXXvYsV+uA==
X-CSE-MsgGUID: KV4M287MSw+XlmTQropGfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="39823413"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="39823413"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 04:39:00 -0700
X-CSE-ConnectionGUID: BP9GALJNTlGKk9DTHqGXnQ==
X-CSE-MsgGUID: CZ0hqASyQn+ZsJmkdHyNiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="64507632"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.132])
 ([10.245.244.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 04:38:59 -0700
Message-ID: <7d3c647a2df19aa0f8a582b7d346ba8014cf6ca3.camel@linux.intel.com>
Subject: Re: [PATCH 4/7] drm/ttm: move LRU walk defines into new internal
 header
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org
Date: Mon, 19 Aug 2024 13:38:56 +0200
In-Reply-To: <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
 <20240710124301.1628-5-christian.koenig@amd.com>
 <Zo7QpJKtVNw4RvUd@DUT025-TGLU.fm.intel.com>
 <14b70a4d-dc65-4886-940c-ffc1a8197821@gmail.com>
 <77995ffc6de401bc8ed2f4181848dffb18540666.camel@linux.intel.com>
 <20bceb24-8cae-4f0a-897e-326dbf8dc186@amd.com>
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

Hi, Christian,

On Mon, 2024-08-19 at 13:03 +0200, Christian K=C3=B6nig wrote:
> Am 06.08.24 um 10:29 schrieb Thomas Hellstr=C3=B6m:
> > Hi, Christian.
> >=20
> > On Thu, 2024-07-11 at 14:01 +0200, Christian K=C3=B6nig wrote:
> > > Am 10.07.24 um 20:19 schrieb Matthew Brost:
> > > > On Wed, Jul 10, 2024 at 02:42:58PM +0200, Christian K=C3=B6nig
> > > > wrote:
> > > > > That is something drivers really shouldn't mess with.
> > > > >=20
> > > > Thomas uses this in Xe to implement a shrinker [1]. Seems to
> > > > need
> > > > to
> > > > remain available for drivers.
> > > No, that is exactly what I try to prevent with that.
> > >=20
> > > This is an internally thing of TTM and drivers should never use
> > > it
> > > directly.
> > That driver-facing LRU walker is a direct response/solution to this
> > comment that you made in the first shrinker series:
> >=20
> > https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@a=
md.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
>=20
> Ah, yeah that was about how we are should be avoiding middle layer
> design.
>=20
> But a function which returns the next candidate for eviction and a=20
> function which calls a callback for eviction is exactly the opposite.
>=20
> > That is also mentioned in the cover letter of the recent shrinker
> > series, and this walker has been around in that shrinker series for
> > more than half a year now so if you think it's not the correct
> > driver
> > facing API IMHO that should be addressed by a review comment in
> > that
> > series rather than in posting a conflicting patch?
>=20
> I actually outlined that in the review comments for the patch series.
> E.g. a walker function with a callback is basically a middle layer.
>=20
> What outlined in the link above is that a function which returns the=20
> next eviction candidate is a better approach than a callback.
>=20
> > So assuming that we still want the driver to register the shrinker,
> > IMO that helper abstracts away all the nasty locking and pitfalls
> > for a
> > driver-registered shrinker, and is similar in structure to for
> > example
> > the pagewalk helper in mm/pagewalk.c.
> >=20
> > An alternative that could be tried as a driver-facing API is to
> > provide
> > a for_each_bo_in_lru_lock() macro where the driver open-codes
> > "process_bo()" inside the for loop but I tried this and found it
> > quite
> > fragile since the driver might exit the loop without performing the
> > necessary cleanup.
>=20
> The point is that the shrinker should *never* need to have context.
> E.g.=20
> a walker which allows going over multiple BOs for eviction is exactly
> the wrong approach for that.
>=20
> The shrinker should evict always only exactly one BO and the next=20
> invocation of a shrinker should not depend on the result of the
> previous=20
> one.
>=20
> Or am I missing something vital here?

A couple of things,

1) I'd like to think of the middle-layer vs helper like the helper has
its own ops, and can be used optionally from the driver. IIRC, the
atomic modesetting / pageflip ops are implemented in exactly this way.

Sometimes a certain loop operation can't be easily or at least robustly
implemented using a for_each_.. approach. Like for example
mm/pagewalk.c. In this shrinking case I think it's probably possible
using the scoped_guard() in cleanup.h. This way we could get rid of
this middle layer discussion by turning the interface inside-out:

for_each_bo_on_lru_locked(xxx)
	driver_shrink();

But I do think the currently suggested approach is less fragile and
prone to driver error.

FWIW in addition to the above examples, also drm_gem_lru_scan works
like this.

2) The shrinkers suggest to shrink a number of pages, not a single bo,
again drm_gem_lru_scan works like this. i915 works like this. I think
we should align with those.

3) Even if we had a function to obtain the driver to shrink, the driver
needs to have its say about the suitability for shrinking, so a
callback is needed anyway (eviction_valuable).
In addition, if shrinking fails for some reason, what would stop that
function to return the same bo, again and again just like the problem
we previously had in TTM?

So basically all the restartable LRU work was motivated by this use-
case in mind, so making that private I must say comes as a pretty major
surprise.

I could have a look at the=20

for_each_bo_on_lru_locked(xxx)
	driver_shrink();

approach, but having TTM just blindly return a single bo without
context will not work IMO.

Thanks,
/Thomas






>=20
> Regards,
> Christian.
>=20
> >=20
> > However with using scoped_guard() in linux/cleanup.h that could
> > probably be mitigated to some exent, but I still think that a
> > walker
> > helper like this is the safer choice and given the complexity of a
> > for_
> > macro involving scoped_guard(), I think the walker helper is the
> > easiest-to-maintain solution moving forward.
> >=20
> > But open to suggestions.
> >=20
> > Thanks
> > Thomas
> >=20
> >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > Matt
> > > >=20
> > > > [1]
> > > > https://patchwork.freedesktop.org/patch/602165/?series=3D131815&rev=
=3D6
> > > >=20
> > > > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > ---
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_bo_util.c |=C2=A0 2 +
> > > > > =C2=A0=C2=A0 drivers/gpu/drm/ttm/ttm_bo_util.h | 67
> > > > > +++++++++++++++++++++++++++++++
> > > > > =C2=A0=C2=A0 include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 35 ----------------
> > > > > =C2=A0=C2=A0 4 files changed, 70 insertions(+), 35 deletions(-)
> > > > > =C2=A0=C2=A0 create mode 100644 drivers/gpu/drm/ttm/ttm_bo_util.h
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > index 0131ec802066..41bee8696e69 100644
> > > > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > > > @@ -45,6 +45,7 @@
> > > > > =C2=A0=C2=A0 #include <linux/dma-resv.h>
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0 #include "ttm_module.h"
> > > > > +#include "ttm_bo_util.h"
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0 static void ttm_bo_mem_space_debug(struct
> > > > > ttm_buffer_object
> > > > > *bo,
> > > > > =C2=A0=C2=A0=C2=A0					struct ttm_placement
> > > > > *placement)
> > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > index 3c07f4712d5c..03e28e3d0d03 100644
> > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > > > @@ -37,6 +37,8 @@
> > > > > =C2=A0=C2=A0=20
> > > > > =C2=A0=C2=A0 #include <drm/drm_cache.h>
> > > > > =C2=A0=C2=A0=20
> > > > > +#include "ttm_bo_util.h"
> > > > > +
> > > > > =C2=A0=C2=A0 struct ttm_transfer_obj {
> > > > > =C2=A0=C2=A0=C2=A0	struct ttm_buffer_object base;
> > > > > =C2=A0=C2=A0=C2=A0	struct ttm_buffer_object *bo;
> > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.h
> > > > > b/drivers/gpu/drm/ttm/ttm_bo_util.h
> > > > > new file mode 100644
> > > > > index 000000000000..c19b50809208
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.h
> > > > > @@ -0,0 +1,67 @@
> > > > > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > > > > +/***********************************************************
> > > > > ****
> > > > > ***********
> > > > > + * Copyright 2024 Advanced Micro Devices, Inc.
> > > > > + *
> > > > > + * Permission is hereby granted, free of charge, to any
> > > > > person
> > > > > obtaining a
> > > > > + * copy of this software and associated documentation files
> > > > > (the
> > > > > "Software"),
> > > > > + * to deal in the Software without restriction, including
> > > > > without limitation
> > > > > + * the rights to use, copy, modify, merge, publish,
> > > > > distribute,
> > > > > sublicense,
> > > > > + * and/or sell copies of the Software, and to permit persons
> > > > > to
> > > > > whom the
> > > > > + * Software is furnished to do so, subject to the following
> > > > > conditions:
> > > > > + *
> > > > > + * The above copyright notice and this permission notice
> > > > > shall
> > > > > be included in
> > > > > + * all copies or substantial portions of the Software.
> > > > > + *
> > > > > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
> > > > > KIND, EXPRESS OR
> > > > > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > > > > MERCHANTABILITY,
> > > > > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.=C2=A0 I=
N
> > > > > NO
> > > > > EVENT SHALL
> > > > > + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY
> > > > > CLAIM,
> > > > > DAMAGES OR
> > > > > + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
> > > > > OR
> > > > > OTHERWISE,
> > > > > + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
> > > > > OR
> > > > > THE USE OR
> > > > > + * OTHER DEALINGS IN THE SOFTWARE.
> > > > > + *
> > > > > +
> > > > > *************************************************************
> > > > > ****
> > > > > *********/
> > > > > +#ifndef _TTM_BO_UTIL_H_
> > > > > +#define _TTM_BO_UTIL_H_
> > > > > +
> > > > > +struct ww_acquire_ctx;
> > > > > +
> > > > > +struct ttm_buffer_object;
> > > > > +struct ttm_operation_ctx;
> > > > > +struct ttm_lru_walk;
> > > > > +
> > > > > +/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> > > > > +struct ttm_lru_walk_ops {
> > > > > +	/**
> > > > > +	 * process_bo - Process this bo.
> > > > > +	 * @walk: struct ttm_lru_walk describing the walk.
> > > > > +	 * @bo: A locked and referenced buffer object.
> > > > > +	 *
> > > > > +	 * Return: Negative error code on error, User-
> > > > > defined
> > > > > positive value
> > > > > +	 * (typically, but not always, size of the processed
> > > > > bo)
> > > > > on success.
> > > > > +	 * On success, the returned values are summed by the
> > > > > walk and the
> > > > > +	 * walk exits when its target is met.
> > > > > +	 * 0 also indicates success, -EBUSY means this bo
> > > > > was
> > > > > skipped.
> > > > > +	 */
> > > > > +	s64 (*process_bo)(struct ttm_lru_walk *walk,
> > > > > +			=C2=A0 struct ttm_buffer_object *bo);
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct ttm_lru_walk - Structure describing a LRU walk.
> > > > > + */
> > > > > +struct ttm_lru_walk {
> > > > > +	/** @ops: Pointer to the ops structure. */
> > > > > +	const struct ttm_lru_walk_ops *ops;
> > > > > +	/** @ctx: Pointer to the struct ttm_operation_ctx.
> > > > > */
> > > > > +	struct ttm_operation_ctx *ctx;
> > > > > +	/** @ticket: The struct ww_acquire_ctx if any. */
> > > > > +	struct ww_acquire_ctx *ticket;
> > > > > +	/** @tryock_only: Only use trylock for locking. */
> > > > > +	bool trylock_only;
> > > > > +};
> > > > > +
> > > > > +s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > > > > ttm_device *bdev,
> > > > > +			=C2=A0=C2=A0 struct ttm_resource_manager *man,
> > > > > s64
> > > > > target);
> > > > > +
> > > > > +#endif
> > > > > diff --git a/include/drm/ttm/ttm_bo.h
> > > > > b/include/drm/ttm/ttm_bo.h
> > > > > index d1a732d56259..5f7c967222a2 100644
> > > > > --- a/include/drm/ttm/ttm_bo.h
> > > > > +++ b/include/drm/ttm/ttm_bo.h
> > > > > @@ -194,41 +194,6 @@ struct ttm_operation_ctx {
> > > > > =C2=A0=C2=A0=C2=A0	uint64_t bytes_moved;
> > > > > =C2=A0=C2=A0 };
> > > > > =C2=A0=C2=A0=20
> > > > > -struct ttm_lru_walk;
> > > > > -
> > > > > -/** struct ttm_lru_walk_ops - Operations for a LRU walk. */
> > > > > -struct ttm_lru_walk_ops {
> > > > > -	/**
> > > > > -	 * process_bo - Process this bo.
> > > > > -	 * @walk: struct ttm_lru_walk describing the walk.
> > > > > -	 * @bo: A locked and referenced buffer object.
> > > > > -	 *
> > > > > -	 * Return: Negative error code on error, User-
> > > > > defined
> > > > > positive value
> > > > > -	 * (typically, but not always, size of the processed
> > > > > bo)
> > > > > on success.
> > > > > -	 * On success, the returned values are summed by the
> > > > > walk and the
> > > > > -	 * walk exits when its target is met.
> > > > > -	 * 0 also indicates success, -EBUSY means this bo
> > > > > was
> > > > > skipped.
> > > > > -	 */
> > > > > -	s64 (*process_bo)(struct ttm_lru_walk *walk, struct
> > > > > ttm_buffer_object *bo);
> > > > > -};
> > > > > -
> > > > > -/**
> > > > > - * struct ttm_lru_walk - Structure describing a LRU walk.
> > > > > - */
> > > > > -struct ttm_lru_walk {
> > > > > -	/** @ops: Pointer to the ops structure. */
> > > > > -	const struct ttm_lru_walk_ops *ops;
> > > > > -	/** @ctx: Pointer to the struct ttm_operation_ctx.
> > > > > */
> > > > > -	struct ttm_operation_ctx *ctx;
> > > > > -	/** @ticket: The struct ww_acquire_ctx if any. */
> > > > > -	struct ww_acquire_ctx *ticket;
> > > > > -	/** @tryock_only: Only use trylock for locking. */
> > > > > -	bool trylock_only;
> > > > > -};
> > > > > -
> > > > > -s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > > > > ttm_device *bdev,
> > > > > -			=C2=A0=C2=A0 struct ttm_resource_manager *man,
> > > > > s64
> > > > > target);
> > > > > -
> > > > > =C2=A0=C2=A0 /**
> > > > > =C2=A0=C2=A0=C2=A0 * ttm_bo_get - reference a struct ttm_buffer_o=
bject
> > > > > =C2=A0=C2=A0=C2=A0 *
> > > > > --=20
> > > > > 2.34.1
> > > > >=20
>=20

