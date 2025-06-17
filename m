Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ECAADC7E6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 12:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9707A10E16A;
	Tue, 17 Jun 2025 10:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UP7OSH6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49E010E16A;
 Tue, 17 Jun 2025 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750155492; x=1781691492;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=0WoLoq52fOayCaHKCCuS9JoxqhKh0ma9KvQoOga4vwk=;
 b=UP7OSH6xbI4lDLfu0tmlHi03104l4I45NvSMUrQD+EUhuo93rVlG2BWy
 84lxGes1PM/h6eDYPECLW61KjGLsJvUAEl5CbcL/ojRpxopqWOCodOTaK
 PCMQeR04YYlX0weR+xM9eQRabxzaiyhbf+3ip6xqymCmy5GefNrOMogD6
 1mdj2B7zC75nkY7oy7MzgJ03VbTZERBvxx5+2EbsVIoC0AXzdU6Cu1xzi
 tp1ruG/YAaG3RmjID84VUUaYW3Uud7HtIo8oRtyAPO/ZYEFCPOyaZsnUr
 kHKOiP47jxpAN3wron/gj+Ta/G7WJmSc0AcUHKrP5Z26vVOjtf9Hz8b+j w==;
X-CSE-ConnectionGUID: jpoxmWMvQu++FBaw2/0awg==
X-CSE-MsgGUID: j1jRdlXUS9iDu8yqr5brsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52460799"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="52460799"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:18:11 -0700
X-CSE-ConnectionGUID: zDYTcBwqTPSWSlH0mtr9Ow==
X-CSE-MsgGUID: wee/L13iTI2d10l/wnZtJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="149624385"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.95])
 ([10.245.245.95])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 03:18:09 -0700
Message-ID: <a004736315d77837172418eb196d5b5f80b74e6c.camel@linux.intel.com>
Subject: Re: [PATCH 6/6] drm/ttm: replace TTMs refcount with the DRM refcount
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 matthew.brost@intel.com, matthew.auld@intel.com
Date: Tue, 17 Jun 2025 12:18:06 +0200
In-Reply-To: <20250616130726.22863-6-christian.koenig@amd.com>
References: <20250616130726.22863-1-christian.koenig@amd.com>
 <20250616130726.22863-6-christian.koenig@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Mon, 2025-06-16 at 15:07 +0200, Christian K=C3=B6nig wrote:
> Instead of keeping a separate reference count for the TTM object also
> use
> the reference count for DRM GEM objects inside TTM.
>=20
> Apart from avoiding two reference counts for one object this approach
> has
> the clear advantage of being able to use drm_exec inside TTM.

A couple of questions on the design direction here:

IIRC both xe and i915 has checks to consider objects with a 0 gem
refcount as zombies requiring special treatment or skipping, when
encountered in TTM callbacks. We need to double-check that.

But I wonder,=C2=A0
first this practice of resurrecting refcounts seem a bit unusual, I
wonder if we can get rid of that somehow?

Furthermore, it seems the problem with drm_exec is related only to the
LRU walk. What about adding a struct completion to the object, that is
signaled when the object has freed its final backing-store. The LRU
walk would then check if the object is a zombie, and if so just wait on
the struct completion. (Need of course to carefully set up locking
orders). Then we wouldn't need to resurrect the gem refcount, nor use
drm_exec locking for zombies.

We would still need some form of refcounting while waiting on the
struct completion, but if we restricted the TTM refcount to *only* be
used internally for that sole purpose, and also replaced the final
ttm_bo_put() with the ttm_bo_finalize() that you suggest we wouldn't
need to resurrect that refcount since it wouldn't drop to zero until
the object is ready for final free.

Ideas, comments?

Thomas



>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0.../gpu/drm/ttm/tests/ttm_bo_validate_test.c=C2=A0 |=C2=A0=C2=A0 4 =
+-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |=C2=A0=C2=A0 2 -
> =C2=A0drivers/gpu/drm/ttm/ttm_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 146 +++++=
++++-------
> --
> =C2=A0drivers/gpu/drm/ttm/ttm_bo_internal.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0drivers/gpu/drm/ttm/ttm_bo_util.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0include/drm/ttm/ttm_bo.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 9 --
> =C2=A06 files changed, 81 insertions(+), 91 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> index 6766e1753343..7b908920aae5 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> @@ -127,7 +127,7 @@ static void ttm_bo_init_reserved_sys_man(struct
> kunit *test)
> =C2=A0	dma_resv_unlock(bo->base.resv);
> =C2=A0
> =C2=A0	KUNIT_EXPECT_EQ(test, err, 0);
> -	KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
> +	KUNIT_EXPECT_EQ(test, kref_read(&bo->base.refcount), 1);
> =C2=A0	KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
> =C2=A0	KUNIT_EXPECT_EQ(test, bo->type, bo_type);
> =C2=A0	KUNIT_EXPECT_EQ(test, bo->page_alignment, PAGE_SIZE);
> @@ -176,7 +176,7 @@ static void ttm_bo_init_reserved_mock_man(struct
> kunit *test)
> =C2=A0	dma_resv_unlock(bo->base.resv);
> =C2=A0
> =C2=A0	KUNIT_EXPECT_EQ(test, err, 0);
> -	KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
> +	KUNIT_EXPECT_EQ(test, kref_read(&bo->base.refcount), 1);
> =C2=A0	KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
> =C2=A0	KUNIT_EXPECT_EQ(test, bo->type, bo_type);
> =C2=A0	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index b91c13f46225..7bc8eae77b8c 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -190,8 +190,6 @@ struct ttm_buffer_object
> *ttm_bo_kunit_init(struct kunit *test,
> =C2=A0	bo->bdev =3D devs->ttm_dev;
> =C2=A0	bo->destroy =3D dummy_ttm_bo_destroy;
> =C2=A0
> -	kref_init(&bo->kref);
> -
> =C2=A0	return bo;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index abcf45bc3930..071cbad2fe9e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -48,14 +48,6 @@
> =C2=A0#include "ttm_module.h"
> =C2=A0#include "ttm_bo_internal.h"
> =C2=A0
> -static void ttm_bo_release(struct kref *kref);
> -
> -/* TODO: remove! */
> -void ttm_bo_put(struct ttm_buffer_object *bo)
> -{
> -	kref_put(&bo->kref, ttm_bo_release);
> -}
> -
> =C2=A0static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
> =C2=A0					struct ttm_placement
> *placement)
> =C2=A0{
> @@ -252,82 +244,91 @@ static void ttm_bo_delayed_delete(struct
> work_struct *work)
> =C2=A0	ttm_bo_put(bo);
> =C2=A0}
> =C2=A0
> -static void ttm_bo_release(struct kref *kref)
> +static void ttm_bo_free(struct drm_gem_object *gobj)
> +{
> +	struct ttm_buffer_object *bo =3D container_of(gobj,
> typeof(*bo), base);
> +
> +	atomic_dec(&ttm_glob.bo_count);
> +	bo->destroy(bo);
> +}
> +
> +/*
> + * All other callbacks should never ever be called on a deleted TTM
> object.
> + */
> +static const struct drm_gem_object_funcs ttm_deleted_object_funcs =3D
> {
> +	.free =3D ttm_bo_free
> +};
> +
> +/* Returns true if the BO is about to get deleted */
> +static bool ttm_bo_is_zombie(struct ttm_buffer_object *bo)
> +{
> +	return bo->base.funcs =3D=3D &ttm_deleted_object_funcs;
> +}
> +
> +void ttm_bo_fini(struct ttm_buffer_object *bo)
> =C2=A0{
> -	struct ttm_buffer_object *bo =3D
> -	=C2=A0=C2=A0=C2=A0 container_of(kref, struct ttm_buffer_object, kref);
> =C2=A0	struct ttm_device *bdev =3D bo->bdev;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	WARN_ON_ONCE(bo->pin_count);
> =C2=A0	WARN_ON_ONCE(bo->bulk_move);
> =C2=A0
> -	if (!bo->deleted) {
> -		ret =3D ttm_bo_individualize_resv(bo);
> -		if (ret) {
> -			/* Last resort, if we fail to allocate
> memory for the
> -			 * fences block for the BO to become idle
> -			 */
> -			dma_resv_wait_timeout(bo->base.resv,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_BOOKKEEP, false,
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30 * HZ);
> -		}
> +	ret =3D ttm_bo_individualize_resv(bo);
> +	if (ret) {
> +		/* Last resort, if we fail to allocate memory for
> the
> +		 * fences block for the BO to become idle
> +		 */
> +		dma_resv_wait_timeout(bo->base.resv,
> DMA_RESV_USAGE_BOOKKEEP,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 false, 30 * HZ);
> +	}
> =C2=A0
> -		if (bo->bdev->funcs->release_notify)
> -			bo->bdev->funcs->release_notify(bo);
> -
> -		drm_vma_offset_remove(bdev->vma_manager, &bo-
> >base.vma_node);
> -		ttm_mem_io_free(bdev, bo->resource);
> -
> -		if (!dma_resv_test_signaled(&bo->base._resv,
> -					=C2=A0=C2=A0=C2=A0 DMA_RESV_USAGE_BOOKKEEP)
> ||
> -		=C2=A0=C2=A0=C2=A0 (want_init_on_free() && (bo->ttm !=3D NULL)) ||
> -		=C2=A0=C2=A0=C2=A0 bo->type =3D=3D ttm_bo_type_sg ||
> -		=C2=A0=C2=A0=C2=A0 !dma_resv_trylock(bo->base.resv)) {
> -			/* The BO is not idle, resurrect it for
> delayed destroy */
> -			ttm_bo_flush_all_fences(bo);
> -			bo->deleted =3D true;
> -
> -			spin_lock(&bo->bdev->lru_lock);
> -
> -			/*
> -			 * Make pinned bos immediately available to
> -			 * shrinkers, now that they are queued for
> -			 * destruction.
> -			 *
> -			 * FIXME: QXL is triggering this. Can be
> removed when the
> -			 * driver is fixed.
> -			 */
> -			if (bo->pin_count) {
> -				bo->pin_count =3D 0;
> -				ttm_resource_move_to_lru_tail(bo-
> >resource);
> -			}
> +	if (bo->bdev->funcs->release_notify)
> +		bo->bdev->funcs->release_notify(bo);
> +
> +	drm_vma_offset_remove(bdev->vma_manager, &bo-
> >base.vma_node);
> +	ttm_mem_io_free(bdev, bo->resource);
> =C2=A0
> -			kref_init(&bo->kref);
> -			spin_unlock(&bo->bdev->lru_lock);
> +	if (!dma_resv_test_signaled(&bo->base._resv,
> DMA_RESV_USAGE_BOOKKEEP) ||
> +	=C2=A0=C2=A0=C2=A0 (want_init_on_free() && (bo->ttm !=3D NULL)) ||
> +	=C2=A0=C2=A0=C2=A0 bo->type =3D=3D ttm_bo_type_sg ||
> +	=C2=A0=C2=A0=C2=A0 !dma_resv_trylock(bo->base.resv)) {
> +		/* The BO is not idle, resurrect it for delayed
> destroy */
> +		ttm_bo_flush_all_fences(bo);
> =C2=A0
> -			INIT_WORK(&bo->delayed_delete,
> ttm_bo_delayed_delete);
> +		spin_lock(&bo->bdev->lru_lock);
> =C2=A0
> -			/* Schedule the worker on the closest NUMA
> node. This
> -			 * improves performance since system memory
> might be
> -			 * cleared on free and that is best done on
> a CPU core
> -			 * close to it.
> -			 */
> -			queue_work_node(bdev->pool.nid, bdev->wq,
> &bo->delayed_delete);
> -			return;
> +		/*
> +		 * Make pinned bos immediately available to
> +		 * shrinkers, now that they are queued for
> +		 * destruction.
> +		 *
> +		 * FIXME: QXL is triggering this. Can be removed
> when the
> +		 * driver is fixed.
> +		 */
> +		if (bo->pin_count) {
> +			bo->pin_count =3D 0;
> +			ttm_resource_move_to_lru_tail(bo->resource);
> =C2=A0		}
> =C2=A0
> +		kref_init(&bo->base.refcount);
> +		bo->base.funcs =3D &ttm_deleted_object_funcs;
> +		spin_unlock(&bo->bdev->lru_lock);
> +
> +		INIT_WORK(&bo->delayed_delete,
> ttm_bo_delayed_delete);
> +
> +		/* Schedule the worker on the closest NUMA node.
> This
> +		 * improves performance since system memory might be
> +		 * cleared on free and that is best done on a CPU
> core
> +		 * close to it.
> +		 */
> +		queue_work_node(bdev->pool.nid, bdev->wq, &bo-
> >delayed_delete);
> +	} else {
> =C2=A0		ttm_bo_cleanup_memtype_use(bo);
> =C2=A0		dma_resv_unlock(bo->base.resv);
> -	}
> =C2=A0
> -	atomic_dec(&ttm_glob.bo_count);
> -	bo->destroy(bo);
> -}
> -
> -void ttm_bo_fini(struct ttm_buffer_object *bo)
> -{
> -	ttm_bo_put(bo);
> +		atomic_dec(&ttm_glob.bo_count);
> +		bo->destroy(bo);
> +	}
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(ttm_bo_fini);
> =C2=A0
> @@ -471,7 +472,7 @@ int ttm_bo_evict_first(struct ttm_device *bdev,
> struct ttm_resource_manager *man
> =C2=A0	if (!bo->resource || bo->resource->mem_type !=3D mem_type)
> =C2=A0		goto out_bo_moved;
> =C2=A0
> -	if (bo->deleted) {
> +	if (ttm_bo_is_zombie(bo)) {
> =C2=A0		ret =3D ttm_bo_wait_ctx(bo, ctx);
> =C2=A0		if (!ret)
> =C2=A0			ttm_bo_cleanup_memtype_use(bo);
> @@ -525,7 +526,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk
> *walk, struct ttm_buffer_object *
> =C2=A0	if (bo->pin_count || !bo->bdev->funcs->eviction_valuable(bo,
> evict_walk->place))
> =C2=A0		return 0;
> =C2=A0
> -	if (bo->deleted) {
> +	if (ttm_bo_is_zombie(bo)) {
> =C2=A0		lret =3D ttm_bo_wait_ctx(bo, walk->ctx);
> =C2=A0		if (!lret)
> =C2=A0			ttm_bo_cleanup_memtype_use(bo);
> @@ -623,7 +624,6 @@ static int ttm_bo_evict_alloc(struct ttm_device
> *bdev,
> =C2=A0void ttm_bo_pin(struct ttm_buffer_object *bo)
> =C2=A0{
> =C2=A0	dma_resv_assert_held(bo->base.resv);
> -	WARN_ON_ONCE(!kref_read(&bo->kref));
> =C2=A0	spin_lock(&bo->bdev->lru_lock);
> =C2=A0	if (bo->resource)
> =C2=A0		ttm_resource_del_bulk_move(bo->resource, bo);
> @@ -642,7 +642,6 @@ EXPORT_SYMBOL(ttm_bo_pin);
> =C2=A0void ttm_bo_unpin(struct ttm_buffer_object *bo)
> =C2=A0{
> =C2=A0	dma_resv_assert_held(bo->base.resv);
> -	WARN_ON_ONCE(!kref_read(&bo->kref));
> =C2=A0	if (WARN_ON_ONCE(!bo->pin_count))
> =C2=A0		return;
> =C2=A0
> @@ -931,7 +930,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
> struct ttm_buffer_object *bo,
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> -	kref_init(&bo->kref);
> =C2=A0	bo->bdev =3D bdev;
> =C2=A0	bo->type =3D type;
> =C2=A0	bo->page_alignment =3D alignment;
> @@ -1127,7 +1125,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk,
> struct ttm_buffer_object *bo)
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> -	if (bo->deleted) {
> +	if (ttm_bo_is_zombie(bo)) {
> =C2=A0		pgoff_t num_pages =3D bo->ttm->num_pages;
> =C2=A0
> =C2=A0		ret =3D ttm_bo_wait_ctx(bo, ctx);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h
> b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> index e0d48eac74b0..81327bc73834 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
> +++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> @@ -34,7 +34,7 @@
> =C2=A0 */
> =C2=A0static inline void ttm_bo_get(struct ttm_buffer_object *bo)
> =C2=A0{
> -	kref_get(&bo->kref);
> +	drm_gem_object_get(&bo->base);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -50,11 +50,14 @@ static inline void ttm_bo_get(struct
> ttm_buffer_object *bo)
> =C2=A0static inline __must_check struct ttm_buffer_object *
> =C2=A0ttm_bo_get_unless_zero(struct ttm_buffer_object *bo)
> =C2=A0{
> -	if (!kref_get_unless_zero(&bo->kref))
> +	if (!kref_get_unless_zero(&bo->base.refcount))
> =C2=A0		return NULL;
> =C2=A0	return bo;
> =C2=A0}
> =C2=A0
> -void ttm_bo_put(struct ttm_buffer_object *bo);
> +static inline void ttm_bo_put(struct ttm_buffer_object *bo)
> +{
> +	drm_gem_object_put(&bo->base);
> +}
> =C2=A0
> =C2=A0#endif
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 56f3152f34f5..56645039757e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -245,7 +245,7 @@ static int ttm_buffer_object_transfer(struct
> ttm_buffer_object *bo,
> =C2=A0	atomic_inc(&ttm_glob.bo_count);
> =C2=A0	drm_vma_node_reset(&fbo->base.base.vma_node);
> =C2=A0
> -	kref_init(&fbo->base.kref);
> +	kref_init(&fbo->base.base.refcount);
> =C2=A0	fbo->base.destroy =3D &ttm_transfered_destroy;
> =C2=A0	fbo->base.pin_count =3D 0;
> =C2=A0	if (bo->type !=3D ttm_bo_type_sg)
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 4b0552d1bc55..4fe4031f0165 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -78,11 +78,8 @@ enum ttm_bo_type {
> =C2=A0 * @type: The bo type.
> =C2=A0 * @page_alignment: Page alignment.
> =C2=A0 * @destroy: Destruction function. If NULL, kfree is used.
> - * @kref: Reference count of this buffer object. When this refcount
> reaches
> - * zero, the object is destroyed or put on the delayed delete list.
> =C2=A0 * @resource: structure describing current placement.
> =C2=A0 * @ttm: TTM structure holding system pages.
> - * @deleted: True if the object is only a zombie and already
> deleted.
> =C2=A0 * @bulk_move: The bulk move object.
> =C2=A0 * @priority: Priority for LRU, BOs with lower priority are evicted
> first.
> =C2=A0 * @pin_count: Pin count.
> @@ -109,17 +106,11 @@ struct ttm_buffer_object {
> =C2=A0	uint32_t page_alignment;
> =C2=A0	void (*destroy) (struct ttm_buffer_object *);
> =C2=A0
> -	/*
> -	* Members not needing protection.
> -	*/
> -	struct kref kref;
> -
> =C2=A0	/*
> =C2=A0	 * Members protected by the bo::resv::reserved lock.
> =C2=A0	 */
> =C2=A0	struct ttm_resource *resource;
> =C2=A0	struct ttm_tt *ttm;
> -	bool deleted;
> =C2=A0	struct ttm_lru_bulk_move *bulk_move;
> =C2=A0	unsigned priority;
> =C2=A0	unsigned pin_count;

