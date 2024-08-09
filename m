Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CA494D234
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2024 16:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DF810E931;
	Fri,  9 Aug 2024 14:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCXeIzZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1935610E935;
 Fri,  9 Aug 2024 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723213894; x=1754749894;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sAXpjSYXTIC5IXsUXbSGVrHTjQA3wWG2itGUANEilO0=;
 b=oCXeIzZxkMfxrP3xteQaePFU9fd3yuQpnbkfxQKsBeIvSZmOmLpW+ZyY
 ElKinByyehAljeXtvUEGkAlYzea1fh3hO6wMs4ZjEwaeslDjL36ABHAlR
 fkGRknd/CzU+i6Gc2WnMAJLv/OZxOycXQlhzwKeJzMGOcyV4P9MNgosyQ
 AbZHAW53QAVEEONnPAM/PNVHie7mv6f1ppb2CIysXW0WrBgHFV1ZcoNHx
 V5a+9L9qw4heuwWYc+GV+89u7yDvQQWQd1FrSH2yPGtpmm9Pa9KGgH2o3
 U+xhxeDmF+W24cIjWnNiW63I0MTrSnD0DyO+o+Zwbcjulb6GfxOF2QaxU g==;
X-CSE-ConnectionGUID: ieGd2dA5QxyjKSinHG1JYg==
X-CSE-MsgGUID: fjmj4Q7yRqWEbsSMj7ftJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21048307"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21048307"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 07:31:33 -0700
X-CSE-ConnectionGUID: D2z1Ifl3T4yPzOAvNMDUfw==
X-CSE-MsgGUID: ggJf+XduSnuofC7DA69bew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57497399"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.150])
 ([10.245.245.150])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 07:31:30 -0700
Message-ID: <2c5974c448195455c6a46102554bb87c045a19cc.camel@linux.intel.com>
Subject: Re: [PATCH v6 11/12] drm/ttm, drm/xe: Add a shrinker for xe bos
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, dri-devel@lists.freedesktop.org
Date: Fri, 09 Aug 2024 16:31:27 +0200
In-Reply-To: <ZrQhVsgq1cF76v2b@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-12-thomas.hellstrom@linux.intel.com>
 <ZrQhVsgq1cF76v2b@DUT025-TGLU.fm.intel.com>
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

On Thu, 2024-08-08 at 01:37 +0000, Matthew Brost wrote:
> On Wed, Jul 03, 2024 at 05:38:12PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Rather than relying on the TTM watermark accounting add a shrinker
> > for xe_bos in TT or system memory.
> >=20
> > Leverage the newly added TTM per-page shrinking and shmem backup
> > support.
> >=20
> > Although xe doesn't fully support WONTNEED (purgeable) bos yet,
> > introduce and add shrinker support for purgeable ttm_tts.
> >=20
> > v2:
> > - Cleanups bugfixes and a KUNIT shrinker test.
> > - Add writeback support, and activate if kswapd.
> > v3:
> > - Move the try_shrink() helper to core TTM.
> > - Minor cleanups.
> > v4:
> > - Add runtime pm for the shrinker. Shrinking may require an active
> > =C2=A0 device for CCS metadata copying.
> > v5:
> > - Separately purge ghost- and zombie objects in the shrinker.
> > - Fix a format specifier - type inconsistency. (Kernel test robot).
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: <dri-devel@lists.freedesktop.org>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0drivers/gpu/drm/ttm/ttm_bo_util.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 67 ++++++
> > =C2=A0drivers/gpu/drm/xe/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/tests/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
118 +++++++++++
> > =C2=A0drivers/gpu/drm/xe/tests/xe_bo_test.c |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/tests/xe_bo_test.h |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 155 ++++++++++++--
> > =C2=A0drivers/gpu/drm/xe/xe_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 +++
> > =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 8 +
> > =C2=A0drivers/gpu/drm/xe/xe_device_types.h=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/gpu/drm/xe/xe_shrinker.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
287
> > ++++++++++++++++++++++++++
> > =C2=A0drivers/gpu/drm/xe/xe_shrinker.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 18 ++
> > =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> > =C2=A012 files changed, 671 insertions(+), 16 deletions(-)
> > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_shrinker.c
> > =C2=A0create mode 100644 drivers/gpu/drm/xe/xe_shrinker.h
> >=20
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > index c4f678f30fc2..563e96a4cf06 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -924,3 +924,70 @@ long ttm_lru_walk_for_evict(struct
> > ttm_lru_walk *walk, struct ttm_device *bdev,
> > =C2=A0
> > =C2=A0	return progress;
> > =C2=A0}
> > +EXPORT_SYMBOL(ttm_lru_walk_for_evict);
> > +
> > +/**
> > + * ttm_bo_try_shrink - LRU walk helper to shrink a ttm buffer
> > object.
> > + * @walk: The struct xe_ttm_lru_walk that describes the walk.
> > + * @bo: The buffer object.
> > + * @purge: Whether to attempt to purge the bo content since it's
> > no
> > + * longer needed.
> > + * @writeback: If !@purge, attempt to write out to persistent
> > storage.
> > + *
> > + * The function uses the ttm_tt_back_up functionality to back up
> > or
> > + * purge a struct ttm_tt. If the bo is not in system, it's first
> > + * moved there.
> > + *
> > + * Return: The number of pages shrunken or purged, or
> > + * negative error code on failure.
> > + */
> > +long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct
> > ttm_buffer_object *bo,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool purge, bool writeback)
> > +{
> > +	static const struct ttm_place sys_placement_flags =3D {
> > +		.fpfn =3D 0,
> > +		.lpfn =3D 0,
> > +		.mem_type =3D TTM_PL_SYSTEM,
> > +		.flags =3D 0,
> > +	};
> > +	static struct ttm_placement sys_placement =3D {
> > +		.num_placement =3D 1,
> > +		.placement =3D &sys_placement_flags,
> > +	};
> > +	struct ttm_operation_ctx *ctx =3D walk->ctx;
> > +	struct ttm_tt *tt =3D bo->ttm;
> > +	long lret;
> > +
> > +	dma_resv_assert_held(bo->base.resv);
> > +
> > +	if (!tt || !ttm_tt_is_populated(tt))
> > +		return 0;
> > +
> > +	if (bo->resource->mem_type !=3D TTM_PL_SYSTEM) {
> > +		int ret =3D ttm_bo_validate(bo, &sys_placement,
> > ctx);
> > +
> > +		if (ret) {
> > +			if (ret =3D=3D -EINTR || ret =3D=3D -EDEADLK ||
> > +			=C2=A0=C2=A0=C2=A0 ret =3D=3D -ERESTARTSYS)
> > +				return ret;
>=20
> Can you explain the various error code returns / supression in this
> function?

Want me to add a comment in the code or inline here? Anyway, the error
codes are codes for which the caller wants to restart. (Signal delivery
or deadlock). For other errors just move on to the next bo on the LRU
list.

>=20
> > +			return 0;
> > +		}
> > +	}
> > +
> > +	lret =3D ttm_bo_wait_ctx(bo, ctx);
> > +	if (lret < 0) {
> > +		if (lret =3D=3D -ERESTARTSYS)
> > +			return lret;
> > +		return 0;
> > +	}
> > +
> > +	if (bo->deleted)
> > +		lret =3D ttm_tt_backup(bo->bdev, tt, true,
> > writeback);
> > +	else
> > +		lret =3D ttm_tt_backup(bo->bdev, tt, purge,
> > writeback);
>=20
> Hmm, missed this in my previous review. It is frowned upon having
> multiple bools as arguments. Could this be reworked with flags? Same
> goes for all functions in the series with multiple bool arguments.

I agree. Ill see if I can make this look betteer.

>=20
> > +	if (lret < 0 && lret !=3D -EINTR)
> > +		return 0;
> > +
> > +	return lret;
> > +}
> > +EXPORT_SYMBOL(ttm_bo_try_shrink);
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index b1e03bfe4a68..1eba51bdd172 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -112,6 +112,7 @@ xe-y +=3D xe_bb.o \
> > =C2=A0	xe_ring_ops.o \
> > =C2=A0	xe_sa.o \
> > =C2=A0	xe_sched_job.o \
> > +	xe_shrinker.o \
> > =C2=A0	xe_step.o \
> > =C2=A0	xe_sync.o \
> > =C2=A0	xe_tile.o \
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
> > b/drivers/gpu/drm/xe/tests/xe_bo.c
> > index 9f3c02826464..49617f16dc76 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > @@ -6,6 +6,8 @@
> > =C2=A0#include <kunit/test.h>
> > =C2=A0#include <kunit/visibility.h>
> > =C2=A0
> > +#include <uapi/linux/sysinfo.h>
> > +
> > =C2=A0#include "tests/xe_bo_test.h"
> > =C2=A0#include "tests/xe_pci_test.h"
> > =C2=A0#include "tests/xe_test.h"
> > @@ -350,3 +352,119 @@ void xe_bo_evict_kunit(struct kunit *test)
> > =C2=A0	xe_call_for_each_device(evict_test_run_device);
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL_IF_KUNIT(xe_bo_evict_kunit);
> > +
> > +struct xe_bo_link {
> > +	struct list_head link;
> > +	struct xe_bo *bo;
> > +};
> > +
> > +#define XE_BO_SHRINK_SIZE ((unsigned long)SZ_64M)
> > +
> > +/*
> > + * Try to create system bos corresponding to twice the amount
> > + * of available system memory to test shrinker functionality.
> > + * If no swap space is available to accommodate the
> > + * memory overcommit, mark bos purgeable.
> > + */
> > +static int shrink_test_run_device(struct xe_device *xe)
> > +{
> > +	struct kunit *test =3D xe_cur_kunit();
> > +	LIST_HEAD(bos);
> > +	struct xe_bo_link *link, *next;
> > +	struct sysinfo si;
> > +	size_t total, alloced;
> > +	unsigned int interrupted =3D 0, successful =3D 0;
> > +
> > +	si_meminfo(&si);
> > +	total =3D si.freeram * si.mem_unit;
> > +
> > +	kunit_info(test, "Free ram is %lu bytes. Will allocate
> > twice of that.\n",
> > +		=C2=A0=C2=A0 (unsigned long) total);
> > +
> > +	total <<=3D 1;
> > +	for (alloced =3D 0; alloced < total ; alloced +=3D
> > XE_BO_SHRINK_SIZE) {
> > +		struct xe_bo *bo;
> > +		unsigned int mem_type;
> > +
> > +		link =3D kzalloc(sizeof(*link), GFP_KERNEL);
> > +		if (!link) {
> > +			KUNIT_FAIL(test, "Unexpeced link
> > allocation failure\n");
> > +			break;
> > +		}
> > +
> > +		INIT_LIST_HEAD(&link->link);
> > +
> > +		/* We can create bos using WC caching here. But it
> > is slower. */
> > +		bo =3D xe_bo_create_user(xe, NULL, NULL,
> > XE_BO_SHRINK_SIZE,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_XE_GEM_CPU_CACHING_WB,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_type_device,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_SYSTEM);
> > +		if (IS_ERR(bo)) {
> > +			if (bo !=3D ERR_PTR(-ENOMEM) && bo !=3D
> > ERR_PTR(-ENOSPC) &&
> > +			=C2=A0=C2=A0=C2=A0 bo !=3D ERR_PTR(-EINTR) && bo !=3D
> > ERR_PTR(-ERESTARTSYS))
> > +				KUNIT_FAIL(test, "Error creating
> > bo: %pe\n", bo);
> > +			kfree(link);
> > +			break;
> > +		}
> > +		link->bo =3D bo;
> > +		list_add_tail(&link->link, &bos);
> > +		xe_bo_lock(bo, false);
> > +
> > +		/*
> > +		 * If we're low on swap entries, we can't shrink
> > unless the bo
> > +		 * is marked purgeable.
> > +		 */
> > +		if (get_nr_swap_pages() < (XE_BO_SHRINK_SIZE >>
> > PAGE_SHIFT) * 128) {
> > +			struct xe_ttm_tt *xe_tt =3D
> > +				container_of(bo->ttm.ttm,
> > typeof(*xe_tt), ttm);
> > +			long num_pages =3D xe_tt->ttm.num_pages;
> > +
> > +			xe_tt->purgeable =3D true;
> > +			xe_shrinker_mod_pages(xe->mem.shrinker, -
> > num_pages,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_pages);
> > +		}
> > +
> > +		mem_type =3D bo->ttm.resource->mem_type;
> > +		xe_bo_unlock(bo);
> > +		if (mem_type !=3D XE_PL_TT)
> > +			KUNIT_FAIL(test, "Bo in incorrect memory
> > type: %u\n",
> > +				=C2=A0=C2=A0 bo->ttm.resource->mem_type);
> > +		cond_resched();
> > +		if (signal_pending(current))
> > +			break;
> > +	}
> > +
> > +	/* Read back and destroy bos */
> > +	list_for_each_entry_safe_reverse(link, next, &bos, link) {
> > +		static struct ttm_operation_ctx ctx =3D
> > {.interruptible =3D true};
> > +		struct xe_bo *bo =3D link->bo;
> > +		int ret;
> > +
> > +		if (!signal_pending(current)) {
> > +			xe_bo_lock(bo, NULL);
> > +			ret =3D ttm_bo_validate(&bo->ttm,
> > &tt_placement, &ctx);
> > +			xe_bo_unlock(bo);
> > +			if (ret && ret !=3D -EINTR)
> > +				KUNIT_FAIL(test, "Validation
> > failed: %pe\n",
> > +					=C2=A0=C2=A0 ERR_PTR(ret));
> > +			else if (ret)
> > +				interrupted++;
> > +			else
> > +				successful++;
> > +		}
> > +		xe_bo_put(link->bo);
> > +		list_del(&link->link);
> > +		kfree(link);
> > +		cond_resched();
> > +	}
> > +	kunit_info(test, "Readbacks interrupted: %u successful:
> > %u\n",
> > +		=C2=A0=C2=A0 interrupted, successful);
> > +
> > +	return 0;
> > +}
> > +
> > +void xe_bo_shrink_kunit(struct kunit *test)
> > +{
> > +	xe_call_for_each_device(shrink_test_run_device);
> > +}
> > +EXPORT_SYMBOL_IF_KUNIT(xe_bo_shrink_kunit);
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.c
> > b/drivers/gpu/drm/xe/tests/xe_bo_test.c
> > index a324cde77db8..317fa923e287 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo_test.c
> > @@ -10,6 +10,7 @@
> > =C2=A0static struct kunit_case xe_bo_tests[] =3D {
> > =C2=A0	KUNIT_CASE(xe_ccs_migrate_kunit),
> > =C2=A0	KUNIT_CASE(xe_bo_evict_kunit),
> > +	KUNIT_CASE_SLOW(xe_bo_shrink_kunit),
> > =C2=A0	{}
> > =C2=A0};
> > =C2=A0
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo_test.h
> > b/drivers/gpu/drm/xe/tests/xe_bo_test.h
> > index 0113ab45066a..7f44d14a45c5 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo_test.h
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo_test.h
> > @@ -10,5 +10,6 @@ struct kunit;
> > =C2=A0
> > =C2=A0void xe_ccs_migrate_kunit(struct kunit *test);
> > =C2=A0void xe_bo_evict_kunit(struct kunit *test);
> > +void xe_bo_shrink_kunit(struct kunit *test);
> > =C2=A0
> > =C2=A0#endif
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > b/drivers/gpu/drm/xe/xe_bo.c
> > index 65c696966e96..6ab63d1642ae 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -10,6 +10,7 @@
> > =C2=A0#include <drm/drm_drv.h>
> > =C2=A0#include <drm/drm_gem_ttm_helper.h>
> > =C2=A0#include <drm/drm_managed.h>
> > +#include <drm/ttm/ttm_backup.h>
> > =C2=A0#include <drm/ttm/ttm_device.h>
> > =C2=A0#include <drm/ttm/ttm_placement.h>
> > =C2=A0#include <drm/ttm/ttm_tt.h>
> > @@ -25,6 +26,7 @@
> > =C2=A0#include "xe_pm.h"
> > =C2=A0#include "xe_preempt_fence.h"
> > =C2=A0#include "xe_res_cursor.h"
> > +#include "xe_shrinker.h"
> > =C2=A0#include "xe_trace_bo.h"
> > =C2=A0#include "xe_ttm_stolen_mgr.h"
> > =C2=A0#include "xe_vm.h"
> > @@ -278,11 +280,15 @@ static void xe_evict_flags(struct
> > ttm_buffer_object *tbo,
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > +/* struct xe_ttm_tt - Subclassed ttm_tt for xe */
> > =C2=A0struct xe_ttm_tt {
> > =C2=A0	struct ttm_tt ttm;
> > -	struct device *dev;
> > +	/** @xe - The xe device */
> > +	struct xe_device *xe;
> > =C2=A0	struct sg_table sgt;
> > =C2=A0	struct sg_table *sg;
> > +	/** @purgeable - Whether the bo is purgeable (WONTNEED) */
>=20
> So we need to add WONTNEED to our uAPI, right?

Not strictly, but we have work ongoing to implement this. Bos that UMD
pool are typically WONTNEED and unless we mark them as such, shrinking
of these will not work unless we have swap-space available, and then
only with a completely unnecessary copy...

>=20
> > +	bool purgeable;
> > =C2=A0};
> > =C2=A0
> > =C2=A0static int xe_tt_map_sg(struct ttm_tt *tt)
> > @@ -291,7 +297,8 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
> > =C2=A0	unsigned long num_pages =3D tt->num_pages;
> > =C2=A0	int ret;
> > =C2=A0
> > -	XE_WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
> > +	XE_WARN_ON((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> > +		=C2=A0=C2=A0 !(tt->page_flags &
> > TTM_TT_FLAG_EXTERNAL_MAPPABLE));
> > =C2=A0
> > =C2=A0	if (xe_tt->sg)
> > =C2=A0		return 0;
> > @@ -299,13 +306,13 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
> > =C2=A0	ret =3D sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt-
> > >pages,
> > =C2=A0						num_pages, 0,
> > =C2=A0						(u64)num_pages <<
> > PAGE_SHIFT,
> > -
> > 						xe_sg_segment_size(xe_tt->dev),
> > +						xe_sg_segment_size
> > (xe_tt->xe->drm.dev),
> > =C2=A0						GFP_KERNEL);
> > =C2=A0	if (ret)
> > =C2=A0		return ret;
> > =C2=A0
> > =C2=A0	xe_tt->sg =3D &xe_tt->sgt;
> > -	ret =3D dma_map_sgtable(xe_tt->dev, xe_tt->sg,
> > DMA_BIDIRECTIONAL,
> > +	ret =3D dma_map_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
> > DMA_BIDIRECTIONAL,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMA_ATTR_SKIP_CPU_SYNC);
> > =C2=A0	if (ret) {
> > =C2=A0		sg_free_table(xe_tt->sg);
> > @@ -321,7 +328,7 @@ static void xe_tt_unmap_sg(struct ttm_tt *tt)
> > =C2=A0	struct xe_ttm_tt *xe_tt =3D container_of(tt, struct
> > xe_ttm_tt, ttm);
> > =C2=A0
> > =C2=A0	if (xe_tt->sg) {
> > -		dma_unmap_sgtable(xe_tt->dev, xe_tt->sg,
> > +		dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
> > =C2=A0				=C2=A0 DMA_BIDIRECTIONAL, 0);
> > =C2=A0		sg_free_table(xe_tt->sg);
> > =C2=A0		xe_tt->sg =3D NULL;
> > @@ -336,21 +343,41 @@ struct sg_table *xe_bo_sg(struct xe_bo *bo)
> > =C2=A0	return xe_tt->sg;
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * Account ttm pages against the device shrinker's shrinkable and
> > + * purgeable counts.
> > + */
> > +static void xe_ttm_tt_account(struct ttm_tt *tt, bool add)
> > +{
>=20
> Again I think bools are frowned upon as arguments. Maybe just two
> functions - add / sub?

OK,

>=20
> > +	struct xe_ttm_tt *xe_tt =3D container_of(tt, struct
> > xe_ttm_tt, ttm);
> > +	long num_pages =3D tt->num_pages;
> > +
> > +	if (!add)
> > +		num_pages =3D -num_pages;
> > +
> > +	if (xe_tt->purgeable)
> > +		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker, 0,
> > num_pages);
> > +	else
> > +		xe_shrinker_mod_pages(xe_tt->xe->mem.shrinker,
> > num_pages, 0);
> > +}
> > +
> > =C2=A0static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object
> > *ttm_bo,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 page_flags)
> > =C2=A0{
> > =C2=A0	struct xe_bo *bo =3D ttm_to_xe_bo(ttm_bo);
> > =C2=A0	struct xe_device *xe =3D xe_bo_device(bo);
> > -	struct xe_ttm_tt *tt;
> > +	struct xe_ttm_tt *xe_tt;
> > +	struct ttm_tt *tt;
> > =C2=A0	unsigned long extra_pages;
> > =C2=A0	enum ttm_caching caching;
> > =C2=A0	int err;
> > =C2=A0
> > -	tt =3D kzalloc(sizeof(*tt), GFP_KERNEL);
> > -	if (!tt)
> > +	xe_tt =3D kzalloc(sizeof(*xe_tt), GFP_KERNEL);
> > +	if (!xe_tt)
> > =C2=A0		return NULL;
> > =C2=A0
> > -	tt->dev =3D xe->drm.dev;
> > +	tt =3D &xe_tt->ttm;
> > +	xe_tt->xe =3D xe;
> > =C2=A0
> > =C2=A0	extra_pages =3D 0;
> > =C2=A0	if (xe_bo_needs_ccs_pages(bo))
> > @@ -387,42 +414,128 @@ static struct ttm_tt
> > *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
> > =C2=A0		caching =3D ttm_uncached;
> > =C2=A0	}
> > =C2=A0
> > -	err =3D ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
> > extra_pages);
> > +	if (ttm_bo->type !=3D ttm_bo_type_sg)
> > +		page_flags |=3D TTM_TT_FLAG_EXTERNAL |
> > TTM_TT_FLAG_EXTERNAL_MAPPABLE;
> > +
> > +	err =3D ttm_tt_init(tt, &bo->ttm, page_flags, caching,
> > extra_pages);
> > =C2=A0	if (err) {
> > -		kfree(tt);
> > +		kfree(xe_tt);
> > =C2=A0		return NULL;
> > =C2=A0	}
> > =C2=A0
> > -	return &tt->ttm;
> > +	tt->backup =3D ttm_backup_shmem_create(tt->num_pages <<
> > PAGE_SHIFT);
> > +	if (IS_ERR(tt->backup)) {
> > +		ttm_tt_fini(tt);
>=20
> Mentioned this the previous review I think you need set tt->backup to
> NULL here or update ttm_tt_fini to understand IS_ERR(tt->backup).
>=20
> Also maybe dump question but could we just have a global backup for
> all
> BOs? Would that be better than each BO creating its own backup?

I initially made the code like that, when we had a global backend
directly into the swap cache. But I figure shmem wants one file per bo,
otherwise we'd need one gigantic shmem object... Not sure if that
works...

>=20
> > +		kfree(xe_tt);
> > +		return NULL;
> > +	}
> > +
> > +	return tt;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct
> > ttm_tt *tt,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_operation_ctx *ctx)
> > =C2=A0{
> > +	struct xe_ttm_tt *xe_tt =3D container_of(tt, struct
> > xe_ttm_tt, ttm);
> > =C2=A0	int err;
> > =C2=A0
> > =C2=A0	/*
> > =C2=A0	 * dma-bufs are not populated with pages, and the dma-
> > =C2=A0	 * addresses are set up when moved to XE_PL_TT.
> > =C2=A0	 */
> > -	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> > +	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> > +	=C2=A0=C2=A0=C2=A0 !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
> > =C2=A0		return 0;
> > =C2=A0
> > =C2=A0	err =3D ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
> > =C2=A0	if (err)
> > =C2=A0		return err;
> > =C2=A0
> > -	return err;
> > +	xe_tt->purgeable =3D false;
> > +	xe_ttm_tt_account(tt, true);
> > +
> > +	return 0;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev,
> > struct ttm_tt *tt)
> > =C2=A0{
> > -	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
> > +	if ((tt->page_flags & TTM_TT_FLAG_EXTERNAL) &&
> > +	=C2=A0=C2=A0=C2=A0 !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE))
> > =C2=A0		return;
> > =C2=A0
> > =C2=A0	xe_tt_unmap_sg(tt);
> > =C2=A0
> > -	return ttm_pool_free(&ttm_dev->pool, tt);
> > +	ttm_pool_free(&ttm_dev->pool, tt);
> > +	xe_ttm_tt_account(tt, false);
> > +}
> > +
> > +/**
> > + * xe_bo_shrink() - Try to shrink an xe bo.
> > + * @walk:=C2=A0 - The walk parameters
> > + * @bo: The TTM buffer object
> > + * @purge: Only consider purgeable bos.
> > + * @writeback: Try to write back to persistent storage.
> > + *
> > + * Try to shrink- or purge a bo, and if it succeeds, unmap dma.
> > + * Note that we need to be able to handle also non xe bos
> > + * (ghost bos), but only if the struct ttm_tt is embedded in
> > + * a struct xe_ttm_tt.
> > + *
> > + * Return: The number of pages shrunken or purged, or negative
> > error
> > + * code on failure.
> > + */
> > +long xe_bo_shrink(struct ttm_lru_walk *walk, struct
> > ttm_buffer_object *bo,
> > +		=C2=A0 bool purge, bool writeback)
> > +{
> > +	struct ttm_tt *tt =3D bo->ttm;
> > +	struct xe_ttm_tt *xe_tt =3D container_of(tt, struct
> > xe_ttm_tt, ttm);
> > +	struct ttm_place place =3D {.mem_type =3D bo->resource-
> > >mem_type};
> > +	struct xe_bo *xe_bo =3D ttm_to_xe_bo(bo);
> > +	struct xe_device *xe =3D xe_tt->xe;
> > +	bool needs_rpm;
> > +	long lret =3D 0L;
> > +
> > +	if (!tt || !ttm_tt_is_populated(tt) ||
> > +	=C2=A0=C2=A0=C2=A0 !(tt->page_flags & TTM_TT_FLAG_EXTERNAL_MAPPABLE) =
||
> > +	=C2=A0=C2=A0=C2=A0 (purge && !xe_tt->purgeable))
> > +		return 0L;
> > +
> > +	if (!ttm_bo_eviction_valuable(bo, &place))
> > +		return 0L;
> > +
> > +	/* Beware of zombies (GEM object refcount =3D=3D 0) and
> > ghosts. */
> > +	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> > {
> > +		struct ttm_placement null_placement =3D {
> > .num_placement =3D 0 };
> > +
> > +		lret =3D ttm_bo_wait_ctx(bo, walk->ctx);
> > +		if (lret)
> > +			return lret;
> > +
> > +		/* Purge the bo content! */
> > +		ttm_bo_validate(bo, &null_placement, walk->ctx);
> > +		return tt->num_pages;
> > +	}
> > +
> > +	/* System CCS needs gpu copy when moving PL_TT ->
> > PL_SYSTEM */
> > +	needs_rpm =3D (!IS_DGFX(xe) && bo->resource->mem_type !=3D
> > XE_PL_SYSTEM &&
> > +		=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo && xe_bo_needs_ccs_pages(xe_bo) &&
> > !xe_tt->purgeable);
>=20
> Is xe_bo check really needed here?

Yes, I think otherwise xe_bo_needs_ccs_pages will be called with NULL
for ghost objects that aren't xe_bo.

>=20
> > +	if (needs_rpm && !xe_pm_runtime_get_if_active(xe))
> > +		goto out_unref;
> > +
> > +	lret =3D ttm_bo_try_shrink(walk, bo, xe_tt->purgeable,
> > writeback);
> > +	if (needs_rpm)
> > +		xe_pm_runtime_put(xe);
> > +
> > +	if (lret > 0) {
> > +		xe_assert(xe, !ttm_tt_is_populated(tt));
> > +
> > +		xe_ttm_tt_account(tt, false);
> > +	}
> > +
> > +out_unref:
> > +	xe_bo_put(xe_bo);
> > +
> > +	return lret;
> > =C2=A0}
> > =C2=A0
> > =C2=A0static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct
> > ttm_tt *tt)
> > @@ -1238,6 +1351,7 @@ struct xe_bo *___xe_bo_create_locked(struct
> > xe_device *xe, struct xe_bo *bo,
> > =C2=A0	struct ttm_operation_ctx ctx =3D {
> > =C2=A0		.interruptible =3D true,
> > =C2=A0		.no_wait_gpu =3D false,
> > +		.gfp_retry_mayfail =3D true,
>=20
> Can you explain why you are setting this?

Hm. We might want this in a separate patch. Without this, bo memory
allocation will typically never fail, but instead start the OOM killer.
I don't think that's the behaviour we want, but yeah deserves its own
patch and review.

>=20
> > =C2=A0	};
> > =C2=A0	struct ttm_placement *placement;
> > =C2=A0	uint32_t alignment;
> > @@ -1681,6 +1795,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	ttm_bo_pin(&bo->ttm);
> > +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > +		xe_ttm_tt_account(bo->ttm.ttm, false);
> > =C2=A0
> > =C2=A0	/*
> > =C2=A0	 * FIXME: If we always use the reserve / unreserve
> > functions for locking
> > @@ -1739,6 +1855,8 @@ int xe_bo_pin(struct xe_bo *bo)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	ttm_bo_pin(&bo->ttm);
> > +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > +		xe_ttm_tt_account(bo->ttm.ttm, false);
> > =C2=A0
> > =C2=A0	/*
> > =C2=A0	 * FIXME: If we always use the reserve / unreserve
> > functions for locking
> > @@ -1773,6 +1891,9 @@ void xe_bo_unpin_external(struct xe_bo *bo)
> > =C2=A0	spin_unlock(&xe->pinned.lock);
> > =C2=A0
> > =C2=A0	ttm_bo_unpin(&bo->ttm);
> > +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > +		xe_ttm_tt_account(bo->ttm.ttm, true);
> > +
>=20
> Nit: Extra newline.
Will fix.
>=20
> > =C2=A0
> > =C2=A0	/*
> > =C2=A0	 * FIXME: If we always use the reserve / unreserve
> > functions for locking
> > @@ -1801,6 +1922,8 @@ void xe_bo_unpin(struct xe_bo *bo)
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	ttm_bo_unpin(&bo->ttm);
> > +	if (bo->ttm.ttm && ttm_tt_is_populated(bo->ttm.ttm))
> > +		xe_ttm_tt_account(bo->ttm.ttm, true);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > b/drivers/gpu/drm/xe/xe_bo.h
> > index 6de894c728f5..8463e3f3f6f1 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -63,6 +63,7 @@
> > =C2=A0#define XE_BO_PROPS_INVALID	(-1)
> > =C2=A0
> > =C2=A0struct sg_table;
> > +struct xe_ttm_lru_walk;
> > =C2=A0
> > =C2=A0struct xe_bo *xe_bo_alloc(void);
> > =C2=A0void xe_bo_free(struct xe_bo *bo);
> > @@ -126,6 +127,28 @@ static inline struct xe_bo *xe_bo_get(struct
> > xe_bo *bo)
> > =C2=A0	return bo;
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * xe_bo_get_unless_zero() - Conditionally obtain a GEM object
> > refcount on an
> > + * xe bo
> > + * @bo: The bo for which we want to obtain a refcount.
> > + *
> > + * There is a short window between where the bo's GEM object
> > refcount reaches
> > + * zero and where we put the final ttm_bo reference. Code in the
> > eviction- and
> > + * shrinking path should therefore attempt to grab a gem object
> > reference before
> > + * trying to use members outside of the base class ttm object.
> > This function is
> > + * intended for that purpose. On successful return, this function
> > must be paired
> > + * with an xe_bo_put().
> > + *
> > + * Return: @bo on success, NULL on failure.
> > + */
> > +static inline __must_check struct xe_bo
> > *xe_bo_get_unless_zero(struct xe_bo *bo)
> > +{
> > +	if (!bo || !kref_get_unless_zero(&bo->ttm.base.refcount))
> > +		return NULL;
> > +
> > +	return bo;
> > +}
> > +
> > =C2=A0static inline void xe_bo_put(struct xe_bo *bo)
> > =C2=A0{
> > =C2=A0	if (bo)
> > @@ -315,6 +338,9 @@ static inline unsigned int
> > xe_sg_segment_size(struct device *dev)
> > =C2=A0
> > =C2=A0#define
> > i915_gem_object_flush_if_display(obj)		((void)(obj))
> > =C2=A0
> > +long xe_bo_shrink(struct ttm_lru_walk *walk, struct
> > ttm_buffer_object *bo,
> > +		=C2=A0 bool purge, bool writeback);
> > +
> > =C2=A0#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > =C2=A0/**
> > =C2=A0 * xe_bo_is_mem_type - Whether the bo currently resides in the
> > given
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index cfda7cb5df2c..58fecc4b0a18 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -47,6 +47,7 @@
> > =C2=A0#include "xe_perf.h"
> > =C2=A0#include "xe_pm.h"
> > =C2=A0#include "xe_query.h"
> > +#include "xe_shrinker.h"
> > =C2=A0#include "xe_sriov.h"
> > =C2=A0#include "xe_tile.h"
> > =C2=A0#include "xe_ttm_stolen_mgr.h"
> > @@ -241,6 +242,9 @@ static void xe_device_destroy(struct drm_device
> > *dev, void *dummy)
> > =C2=A0	if (xe->unordered_wq)
> > =C2=A0		destroy_workqueue(xe->unordered_wq);
> > =C2=A0
> > +	if (!IS_ERR_OR_NULL(xe->mem.shrinker))
> > +		xe_shrinker_destroy(xe->mem.shrinker);
> > +
> > =C2=A0	ttm_device_fini(&xe->ttm);
> > =C2=A0}
> > =C2=A0
> > @@ -270,6 +274,10 @@ struct xe_device *xe_device_create(struct
> > pci_dev *pdev,
> > =C2=A0	if (err)
> > =C2=A0		goto err;
> > =C2=A0
> > +	xe->mem.shrinker =3D xe_shrinker_create(xe);
> > +	if (IS_ERR(xe->mem.shrinker))
> > +		return ERR_CAST(xe->mem.shrinker);
> > +
> > =C2=A0	xe->info.devid =3D pdev->device;
> > =C2=A0	xe->info.revid =3D pdev->revision;
> > =C2=A0	xe->info.force_execlist =3D xe_modparam.force_execlist;
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index c37be471d11c..3d5440aba52e 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -325,6 +325,8 @@ struct xe_device {
> > =C2=A0		struct xe_mem_region vram;
> > =C2=A0		/** @mem.sys_mgr: system TTM manager */
> > =C2=A0		struct ttm_resource_manager sys_mgr;
> > +		/** @mem.sys_mgr: system memory shrinker. */
> > +		struct xe_shrinker *shrinker;
> > =C2=A0	} mem;
> > =C2=A0
> > =C2=A0	/** @sriov: device level virtualization data */
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > b/drivers/gpu/drm/xe/xe_shrinker.c
> > new file mode 100644
> > index 000000000000..3f9554bdc06b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > @@ -0,0 +1,287 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =C2=A9 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/shrinker.h>
> > +#include <linux/swap.h>
> > +
> > +#include <drm/ttm/ttm_bo.h>
> > +#include <drm/ttm/ttm_tt.h>
> > +
> > +#include "xe_bo.h"
> > +#include "xe_pm.h"
> > +#include "xe_shrinker.h"
> > +
> > +/**
> > + * struct xe_shrinker - per-device shrinker
> > + * @xe: Back pointer to the device.
> > + * @lock: Lock protecting accounting.
> > + * @shrinkable_pages: Number of pages that are currently
> > shrinkable.
> > + * @purgeable_pages: Number of pages that are currently purgeable.
> > + * @shrink: Pointer to the mm shrinker.
> > + * @pm_worker: Worker to wake up the device if required.
> > + */
> > +struct xe_shrinker {
> > +	struct xe_device *xe;
> > +	rwlock_t lock;
> > +	long shrinkable_pages;
> > +	long purgeable_pages;
> > +	struct shrinker *shrink;
> > +	struct work_struct pm_worker;
> > +};
> > +
> > +/**
> > + * struct xe_shrink_lru_walk - lru_walk subclass for shrinker
> > + * @walk: The embedded base class.
> > + * @xe: Pointer to the xe device.
> > + * @purge: Purgeable only request from the srinker.
> > + * @writeback: Try to write back to persistent storage.
> > + */
> > +struct xe_shrink_lru_walk {
> > +	struct ttm_lru_walk walk;
> > +	struct xe_device *xe;
> > +	bool purge;
> > +	bool writeback;
> > +};
> > +
> > +static struct xe_shrinker *to_xe_shrinker(struct shrinker *shrink)
> > +{
> > +	return shrink->private_data;
> > +}
> > +
> > +static struct xe_shrink_lru_walk *
> > +to_xe_shrink_lru_walk(struct ttm_lru_walk *walk)
> > +{
> > +	return container_of(walk, struct xe_shrink_lru_walk,
> > walk);
> > +}
> > +
> > +/**
> > + * xe_shrinker_mod_pages() - Modify shrinker page accounting
> > + * @shrinker: Pointer to the struct xe_shrinker.
> > + * @shrinkable: Shrinkable pages delta. May be negative.
> > + * @purgeable: Purgeable page delta. May be negative.
> > + *
> > + * Modifies the shrinkable and purgeable pages accounting.
> > + */
> > +void
> > +xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long
> > shrinkable, long purgeable)
> > +{
> > +	write_lock(&shrinker->lock);
> > +	shrinker->shrinkable_pages +=3D shrinkable;
> > +	shrinker->purgeable_pages +=3D purgeable;
> > +	write_unlock(&shrinker->lock);
> > +}
> > +
> > +static long xe_shrinker_process_bo(struct ttm_lru_walk *walk,
> > struct ttm_buffer_object *bo)
> > +{
> > +	struct xe_shrink_lru_walk *shrink_walk =3D
> > to_xe_shrink_lru_walk(walk);
> > +
> > +	return xe_bo_shrink(walk, bo, shrink_walk->purge,
> > shrink_walk->writeback);
> > +}
> > +
> > +static long xe_shrinker_walk(struct xe_shrink_lru_walk
> > *shrink_walk, long target)
> > +{
> > +	struct xe_device *xe =3D shrink_walk->xe;
> > +	struct ttm_resource_manager *man;
> > +	unsigned int mem_type;
> > +	long sofar =3D 0;
> > +	long lret;
> > +
> > +	for (mem_type =3D XE_PL_SYSTEM; mem_type <=3D XE_PL_TT;
> > ++mem_type) {
> > +		man =3D ttm_manager_type(&xe->ttm, mem_type);
> > +		if (!man || !man->use_tt)
> > +			continue;
> > +
> > +		lret =3D ttm_lru_walk_for_evict(&shrink_walk->walk,
> > &xe->ttm, man, target);
> > +		if (lret < 0)
> > +			return lret;
> > +
> > +		sofar +=3D lret;
> > +		if (sofar >=3D target)
> > +			break;
> > +	}
> > +
> > +	return sofar;
> > +}
> > +
> > +static unsigned long
> > +xe_shrinker_count(struct shrinker *shrink, struct shrink_control
> > *sc)
> > +{
> > +	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> > +	unsigned long num_pages;
> > +
> > +	num_pages =3D get_nr_swap_pages();
> > +	read_lock(&shrinker->lock);
> > +	num_pages =3D min_t(unsigned long, num_pages, shrinker-
> > >shrinkable_pages);
> > +	num_pages +=3D shrinker->purgeable_pages;
> > +	read_unlock(&shrinker->lock);
> > +
> > +	return num_pages ? num_pages : SHRINK_EMPTY;
> > +}
> > +
> > +static const struct ttm_lru_walk_ops xe_shrink_ops =3D {
> > +	.process_bo =3D xe_shrinker_process_bo,
> > +};
> > +
> > +/*
> > + * Check if we need runtime pm, and if so try to grab a reference
> > if
> > + * already active. If grabbing a reference fails, queue a worker
> > that
> > + * does it for us outside of reclaim, but don't wait for it to
> > complete.
> > + * If bo shrinking needs an rpm reference and we don't have it
> > (yet),
> > + * that bo will be skipped anyway.
> > + */
> > +static bool xe_shrinker_runtime_pm_get(struct xe_shrinker
> > *shrinker, bool force,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_to_scan)
> > +{
> > +	struct xe_device *xe =3D shrinker->xe;
> > +
> > +	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe) ||
> > +	=C2=A0=C2=A0=C2=A0 !get_nr_swap_pages())
> > +		return false;
> > +
> > +	if (!force) {
> > +		read_lock(&shrinker->lock);
> > +		force =3D (nr_to_scan > shrinker->purgeable_pages);
> > +		read_unlock(&shrinker->lock);
> > +		if (!force)
> > +			return false;
> > +	}
> > +
> > +	if (!xe_pm_runtime_get_if_active(xe)) {
> > +		queue_work(xe->unordered_wq, &shrinker-
> > >pm_worker);
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> > +
> > +static void xe_shrinker_runtime_pm_put(struct xe_shrinker
> > *shrinker, bool runtime_pm)
> > +{
> > +	if (runtime_pm)
> > +		xe_pm_runtime_put(shrinker->xe);
> > +}
> > +
> > +static unsigned long xe_shrinker_scan(struct shrinker *shrink,
> > struct shrink_control *sc)
> > +{
> > +	struct xe_shrinker *shrinker =3D to_xe_shrinker(shrink);
> > +	bool is_kswapd =3D current_is_kswapd();
> > +	struct ttm_operation_ctx ctx =3D {
> > +		.interruptible =3D false,
> > +		.no_wait_gpu =3D !is_kswapd,
> > +	};
> > +	unsigned long nr_to_scan, freed =3D 0;
> > +	struct xe_shrink_lru_walk shrink_walk =3D {
> > +		.walk =3D {
> > +			.ops =3D &xe_shrink_ops,
> > +			.ctx =3D &ctx,
> > +			.trylock_only =3D true,
> > +		},
> > +		.xe =3D shrinker->xe,
> > +		.purge =3D true,
> > +		.writeback =3D is_kswapd,
> > +	};
> > +	bool runtime_pm;
> > +	bool purgeable;
> > +	long ret;
> > +
> > +	sc->nr_scanned =3D 0;
> > +	nr_to_scan =3D sc->nr_to_scan;
> > +
> > +	read_lock(&shrinker->lock);
> > +	purgeable =3D !!shrinker->purgeable_pages;
> > +	read_unlock(&shrinker->lock);
> > +
> > +	/* Might need runtime PM. Try to wake early if it looks
> > like it. */
> > +	runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker, false,
> > nr_to_scan);
> > +
> > +	while (purgeable && freed < nr_to_scan) {
> > +		ret =3D xe_shrinker_walk(&shrink_walk, nr_to_scan);
> > +		if (ret <=3D 0)
> > +			break;
> > +
> > +		freed +=3D ret;
> > +	}
> > +
> > +	sc->nr_scanned =3D freed;
> > +	if (freed < nr_to_scan)
> > +		nr_to_scan -=3D freed;
> > +	else
> > +		nr_to_scan =3D 0;
> > +	if (!nr_to_scan)
> > +		goto out;
> > +
> > +	/* If we didn't wake before, try to do it now if needed.
> > */
> > +	if (!runtime_pm)
> > +		runtime_pm =3D xe_shrinker_runtime_pm_get(shrinker,
> > true, 0);
> > +
> > +	shrink_walk.purge =3D false;
> > +	nr_to_scan =3D sc->nr_to_scan;
> > +	while (freed < nr_to_scan) {
> > +		ret =3D xe_shrinker_walk(&shrink_walk, nr_to_scan);
> > +		if (ret <=3D 0)
> > +			break;
> > +
> > +		freed +=3D ret;
> > +	}
> > +
> > +	sc->nr_scanned =3D freed;
> > +
> > +out:
> > +	xe_shrinker_runtime_pm_put(shrinker, runtime_pm);
> > +	return freed ? freed : SHRINK_STOP;
> > +}
> > +
> > +/* Wake up the device for shrinking. */
> > +static void xe_shrinker_pm(struct work_struct *work)
> > +{
> > +	struct xe_shrinker *shrinker =3D
> > +		container_of(work, typeof(*shrinker), pm_worker);
> > +
> > +	xe_pm_runtime_get(shrinker->xe);
> > +	xe_pm_runtime_put(shrinker->xe);
>=20
> So I don't really get this. How does this help the shrinker get a PM
> ref? The small window between xe_pm_runtime_get / put the shrinker
> grabs
> one via xe_pm_runtime_get_if_active? Seems fragile.

The pm has a delay after the last put (Typically 1s?), and if the
shrinker fails obtaining a reference it will be retried. Typically it
will then succeed and when it does start a new delay.

This doesn't strictly guarantee shrinking progress, but there's no way
we can synchronously delay shrinking until we have the pm reference.

What we could perhaps do is to report back that we actually made
progress but postpone the actual shrinking to the worker with writeback
set to on; hoping that the shrinking core doesn't give up before it
sees the released memory...

But I'd prefer to leave that out until we see that that's actually a
real problem.

Best would be if we could have access the LNL CCS memory using the
CPU...

/Thomas


>=20
> Matt
>=20
> > +}
> > +
> > +/**
> > + * xe_shrinker_create() - Create an xe per-device shrinker
> > + * @xe: Pointer to the xe device.
> > + *
> > + * Returns: A pointer to the created shrinker on success,
> > + * Negative error code on failure.
> > + */
> > +struct xe_shrinker *xe_shrinker_create(struct xe_device *xe)
> > +{
> > +	struct xe_shrinker *shrinker =3D kzalloc(sizeof(*shrinker),
> > GFP_KERNEL);
> > +
> > +	if (!shrinker)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	shrinker->shrink =3D shrinker_alloc(0, "xe system
> > shrinker");
> > +	if (!shrinker->shrink) {
> > +		kfree(shrinker);
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +
> > +	INIT_WORK(&shrinker->pm_worker, xe_shrinker_pm);
> > +	shrinker->xe =3D xe;
> > +	rwlock_init(&shrinker->lock);
> > +	shrinker->shrink->count_objects =3D xe_shrinker_count;
> > +	shrinker->shrink->scan_objects =3D xe_shrinker_scan;
> > +	shrinker->shrink->private_data =3D shrinker;
> > +	shrinker_register(shrinker->shrink);
> > +
> > +	return shrinker;
> > +}
> > +
> > +/**
> > + * xe_shrinker_destroy() - Destroy an xe per-device shrinker
> > + * @shrinker: Pointer to the shrinker to destroy.
> > + */
> > +void xe_shrinker_destroy(struct xe_shrinker *shrinker)
> > +{
> > +	xe_assert(shrinker->xe, !shrinker->shrinkable_pages);
> > +	xe_assert(shrinker->xe, !shrinker->purgeable_pages);
> > +	shrinker_free(shrinker->shrink);
> > +	flush_work(&shrinker->pm_worker);
> > +	kfree(shrinker);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_shrinker.h
> > b/drivers/gpu/drm/xe/xe_shrinker.h
> > new file mode 100644
> > index 000000000000..28a038f4fcbf
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_shrinker.h
> > @@ -0,0 +1,18 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright =C2=A9 2024 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SHRINKER_H_
> > +#define _XE_SHRINKER_H_
> > +
> > +struct xe_shrinker;
> > +struct xe_device;
> > +
> > +void xe_shrinker_mod_pages(struct xe_shrinker *shrinker, long
> > shrinkable, long purgeable);
> > +
> > +struct xe_shrinker *xe_shrinker_create(struct xe_device *xe);
> > +
> > +void xe_shrinker_destroy(struct xe_shrinker *shrinker);
> > +
> > +#endif
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index e577528f5dfc..c7e81ae025d9 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -229,6 +229,9 @@ struct ttm_lru_walk {
> > =C2=A0long ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct
> > ttm_device *bdev,
> > =C2=A0			=C2=A0=C2=A0=C2=A0 struct ttm_resource_manager *man, long
> > target);
> > =C2=A0
> > +long ttm_bo_try_shrink(struct ttm_lru_walk *walk, struct
> > ttm_buffer_object *bo,
> > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool purge, bool writeback);
> > +
> > =C2=A0/**
> > =C2=A0 * ttm_bo_get - reference a struct ttm_buffer_object
> > =C2=A0 *
> > --=20
> > 2.44.0
> >=20

