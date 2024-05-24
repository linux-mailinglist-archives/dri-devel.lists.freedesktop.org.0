Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630388CE7A0
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 17:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B47710E21E;
	Fri, 24 May 2024 15:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDxcmzT6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333CE10E21E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 15:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716563772; x=1748099772;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nN0L0W6V7Ls4NioA1z1wejekOKAEUKkDV4Gq0gpEvG4=;
 b=XDxcmzT60ZUMGlJoy1CURKBZTEyeUqvmbWYo7We1blKPfsQi+rfTPLbf
 cHsTnW3p1htAIJS8Zj1ypQi4NJ1SVyvy2GRZXOD2ymrvHuB0wQanlPXYz
 vy0+jmLAoZ4ZHxYEkg4Iizh2J3fCCBUWE7utiscOLUCqAMRXSNpX23kUh
 mrQvoNhYXqjl34KY3CBZF+k1xvONh1DvOQfMV4TICBoue8VMrYnmLsknt
 lwrKQA+SSN/M+EDnf1MsLWHHrYWQ8HYxZRTce4LUB2GmC1f4uHN6m/7Lh
 KDnH+a3EYLFTm9lzgvH1bmvgZJIHpQl+qFcVXyRhVpnaB98NM3MuhY3ro w==;
X-CSE-ConnectionGUID: ngMj4EjbRfeSobxgC0/a2A==
X-CSE-MsgGUID: gF6+dDLTRXOvMCDj1nmWRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12789985"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="12789985"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 08:16:10 -0700
X-CSE-ConnectionGUID: ItgCJwN+TEKyhDZdgBwP2g==
X-CSE-MsgGUID: tDcTp0P0Ta+uTmgo6Jce8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="33976999"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.112])
 ([10.245.246.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 08:16:07 -0700
Message-ID: <e30abb8e15f9ca4835513bcb0d22260e269f692f.camel@linux.intel.com>
Subject: Re: [PATCH v12 01/10] drm/ttm/tests: Fix a warning in
 ttm_bo_unreserve_bulk
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>, 
 dri-devel@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Amaranath Somalapuram <asomalap@amd.com>
Date: Fri, 24 May 2024 17:16:04 +0200
In-Reply-To: <aeca4459b42d06be8b040aa65bc44294fe437fdb.1715767062.git.karolina.stolarek@intel.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
 <aeca4459b42d06be8b040aa65bc44294fe437fdb.1715767062.git.karolina.stolarek@intel.com>
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

On Wed, 2024-05-15 at 13:24 +0200, Karolina Stolarek wrote:
> BOs in a bulk move have to share the same reservation object. That is
> not the case in the ttm_bo_unreserve_bulk subtest. Update
> ttm_bo_kunit_init() helper to accept dma_resv object so we can define
> buffer objects that share the same resv. Update calls to that helper
> accordingly.
>=20
> Fixes: 995279d280d1 ("drm/ttm/tests: Add tests for ttm_bo functions")
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_bo_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 40 +++++++++++------
> --
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |=C2=A0 7 +++-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |=C2=A0 3 +-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_pool_test.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 +-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_resource_test.c |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_tt_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 20 +++++-----
> =C2=A06 files changed, 45 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index 1f8a4f8adc92..ffcfe5e6709a 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -56,7 +56,7 @@ static void
> ttm_bo_reserve_optimistic_no_ticket(struct kunit *test)
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	int err;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	err =3D ttm_bo_reserve(bo, params->interruptible, params-
> >no_wait, NULL);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> @@ -71,7 +71,7 @@ static void ttm_bo_reserve_locked_no_sleep(struct
> kunit *test)
> =C2=A0	bool no_wait =3D true;
> =C2=A0	int err;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	/* Let's lock it beforehand */
> =C2=A0	dma_resv_lock(bo->base.resv, NULL);
> @@ -92,7 +92,7 @@ static void ttm_bo_reserve_no_wait_ticket(struct
> kunit *test)
> =C2=A0
> =C2=A0	ww_acquire_init(&ctx, &reservation_ww_class);
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	err =3D ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, -EBUSY);
> @@ -110,7 +110,7 @@ static void ttm_bo_reserve_double_resv(struct
> kunit *test)
> =C2=A0
> =C2=A0	ww_acquire_init(&ctx, &reservation_ww_class);
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	err =3D ttm_bo_reserve(bo, interruptible, no_wait, &ctx);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> @@ -138,8 +138,8 @@ static void ttm_bo_reserve_deadlock(struct kunit
> *test)
> =C2=A0	bool no_wait =3D false;
> =C2=A0	int err;
> =C2=A0
> -	bo1 =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> -	bo2 =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo1 =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> +	bo2 =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	ww_acquire_init(&ctx1, &reservation_ww_class);
> =C2=A0	mutex_lock(&bo2->base.resv->lock.base);
> @@ -208,7 +208,7 @@ static void ttm_bo_reserve_interrupted(struct
> kunit *test)
> =C2=A0	struct task_struct *task;
> =C2=A0	int err;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	task =3D kthread_create(threaded_ttm_bo_reserve, bo, "ttm-bo-
> reserve");
> =C2=A0
> @@ -249,7 +249,7 @@ static void ttm_bo_unreserve_basic(struct kunit
> *test)
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0	bo->priority =3D bo_prio;
> =C2=A0
> =C2=A0	err =3D ttm_resource_alloc(bo, place, &res1);
> @@ -288,7 +288,7 @@ static void ttm_bo_unreserve_pinned(struct kunit
> *test)
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0	place =3D ttm_place_kunit_init(test, mem_type, 0);
> =C2=A0
> =C2=A0	dma_resv_lock(bo->base.resv, NULL);
> @@ -321,6 +321,7 @@ static void ttm_bo_unreserve_bulk(struct kunit
> *test)
> =C2=A0	struct ttm_resource *res1, *res2;
> =C2=A0	struct ttm_device *ttm_dev;
> =C2=A0	struct ttm_place *place;
> +	struct dma_resv *resv;
> =C2=A0	uint32_t mem_type =3D TTM_PL_SYSTEM;
> =C2=A0	unsigned int bo_priority =3D 0;
> =C2=A0	int err;
> @@ -332,12 +333,17 @@ static void ttm_bo_unreserve_bulk(struct kunit
> *test)
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> =C2=A0
> +	resv =3D kunit_kzalloc(test, sizeof(*resv), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
> +
> =C2=A0	err =3D ttm_device_kunit_init(priv, ttm_dev, false, false);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> -	bo1 =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> -	bo2 =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	dma_resv_init(resv);
> +
> +	bo1 =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, resv);
> +	bo2 =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, resv);
> =C2=A0
> =C2=A0	dma_resv_lock(bo1->base.resv, NULL);
> =C2=A0	ttm_bo_set_bulk_move(bo1, &lru_bulk_move);
> @@ -363,6 +369,8 @@ static void ttm_bo_unreserve_bulk(struct kunit
> *test)
> =C2=A0
> =C2=A0	ttm_resource_free(bo1, &res1);
> =C2=A0	ttm_resource_free(bo2, &res2);
> +
> +	dma_resv_fini(resv);
> =C2=A0}
> =C2=A0
> =C2=A0static void ttm_bo_put_basic(struct kunit *test)
> @@ -384,7 +392,7 @@ static void ttm_bo_put_basic(struct kunit *test)
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0	bo->type =3D ttm_bo_type_device;
> =C2=A0
> =C2=A0	err =3D ttm_resource_alloc(bo, place, &res);
> @@ -445,7 +453,7 @@ static void ttm_bo_put_shared_resv(struct kunit
> *test)
> =C2=A0
> =C2=A0	dma_fence_signal(fence);
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0	bo->type =3D ttm_bo_type_device;
> =C2=A0	bo->base.resv =3D external_resv;
> =C2=A0
> @@ -467,7 +475,7 @@ static void ttm_bo_pin_basic(struct kunit *test)
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	for (int i =3D 0; i < no_pins; i++) {
> =C2=A0		dma_resv_lock(bo->base.resv, NULL);
> @@ -502,7 +510,7 @@ static void ttm_bo_pin_unpin_resource(struct
> kunit *test)
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	err =3D ttm_resource_alloc(bo, place, &res);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> @@ -553,7 +561,7 @@ static void ttm_bo_multiple_pin_one_unpin(struct
> kunit *test)
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0	priv->ttm_dev =3D ttm_dev;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	err =3D ttm_resource_alloc(bo, place, &res);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 7b7c1fa805fc..5be317a0af56 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -51,7 +51,8 @@ EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
> =C2=A0
> =C2=A0struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct ttm_test_devices
> *devs,
> -					=C2=A0=C2=A0=C2=A0 size_t size)
> +					=C2=A0=C2=A0=C2=A0 size_t size,
> +					=C2=A0=C2=A0=C2=A0 struct dma_resv *obj)
> =C2=A0{
> =C2=A0	struct drm_gem_object gem_obj =3D { };
> =C2=A0	struct ttm_buffer_object *bo;
> @@ -61,6 +62,10 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct
> kunit *test,
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, bo);
> =C2=A0
> =C2=A0	bo->base =3D gem_obj;
> +
> +	if (obj)
> +		bo->base.resv =3D obj;
> +
> =C2=A0	err =3D drm_gem_object_init(devs->drm, &bo->base, size);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> =C2=A0
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index 2f51c833a536..c83d31b23c9a 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -28,7 +28,8 @@ int ttm_device_kunit_init(struct ttm_test_devices
> *priv,
> =C2=A0			=C2=A0 bool use_dma32);
> =C2=A0struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct ttm_test_devices
> *devs,
> -					=C2=A0=C2=A0=C2=A0 size_t size);
> +					=C2=A0=C2=A0=C2=A0 size_t size,
> +					=C2=A0=C2=A0=C2=A0 struct dma_resv *obj);
> =C2=A0struct ttm_place *ttm_place_kunit_init(struct kunit *test,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t mem_type, uint32_=
t
> flags);
> =C2=A0
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> index 0a3fede84da9..4643f91c6bd5 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -57,7 +57,7 @@ static struct ttm_tt *ttm_tt_kunit_init(struct
> kunit *test,
> =C2=A0	struct ttm_tt *tt;
> =C2=A0	int err;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, priv->devs, size);
> +	bo =3D ttm_bo_kunit_init(test, priv->devs, size, NULL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, bo);
> =C2=A0	priv->mock_bo =3D bo;
> =C2=A0
> @@ -209,7 +209,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct
> kunit *test)
> =C2=A0	tt =3D kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, tt);
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, devs, size);
> +	bo =3D ttm_bo_kunit_init(test, devs, size, NULL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, bo);
> =C2=A0
> =C2=A0	err =3D ttm_sg_tt_init(tt, bo, 0, caching);
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> index 029e1f094bb0..67584058dadb 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -54,7 +54,7 @@ static void ttm_init_test_mocks(struct kunit *test,
> =C2=A0	/* Make sure we have what we need for a good BO mock */
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, priv->devs->ttm_dev);
> =C2=A0
> -	priv->bo =3D ttm_bo_kunit_init(test, priv->devs, size);
> +	priv->bo =3D ttm_bo_kunit_init(test, priv->devs, size, NULL);
> =C2=A0	priv->place =3D ttm_place_kunit_init(test, mem_type, flags);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> index fd4502c18de6..67bf51723c92 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> @@ -63,7 +63,7 @@ static void ttm_tt_init_basic(struct kunit *test)
> =C2=A0	tt =3D kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, tt);
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, params->size);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, params->size,
> NULL);
> =C2=A0
> =C2=A0	err =3D ttm_tt_init(tt, bo, page_flags, caching, extra_pages);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> @@ -89,7 +89,7 @@ static void ttm_tt_init_misaligned(struct kunit
> *test)
> =C2=A0	tt =3D kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, tt);
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, size);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, size, NULL);
> =C2=A0
> =C2=A0	/* Make the object size misaligned */
> =C2=A0	bo->base.size +=3D 1;
> @@ -110,7 +110,7 @@ static void ttm_tt_fini_basic(struct kunit *test)
> =C2=A0	tt =3D kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, tt);
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	err =3D ttm_tt_init(tt, bo, 0, caching, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> @@ -130,7 +130,7 @@ static void ttm_tt_fini_sg(struct kunit *test)
> =C2=A0	tt =3D kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, tt);
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	err =3D ttm_sg_tt_init(tt, bo, 0, caching);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> @@ -151,7 +151,7 @@ static void ttm_tt_fini_shmem(struct kunit *test)
> =C2=A0	tt =3D kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, tt);
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	err =3D ttm_tt_init(tt, bo, 0, caching, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> @@ -168,7 +168,7 @@ static void ttm_tt_create_basic(struct kunit
> *test)
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	int err;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0	bo->type =3D ttm_bo_type_device;
> =C2=A0
> =C2=A0	dma_resv_lock(bo->base.resv, NULL);
> @@ -187,7 +187,7 @@ static void ttm_tt_create_invalid_bo_type(struct
> kunit *test)
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	int err;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0	bo->type =3D ttm_bo_type_sg + 1;
> =C2=A0
> =C2=A0	dma_resv_lock(bo->base.resv, NULL);
> @@ -208,7 +208,7 @@ static void ttm_tt_create_ttm_exists(struct kunit
> *test)
> =C2=A0	tt =3D kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
> =C2=A0	KUNIT_ASSERT_NOT_NULL(test, tt);
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	err =3D ttm_tt_init(tt, bo, 0, caching, 0);
> =C2=A0	KUNIT_ASSERT_EQ(test, err, 0);
> @@ -239,7 +239,7 @@ static void ttm_tt_create_failed(struct kunit
> *test)
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	int err;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	/* Update ttm_device_funcs so we don't alloc ttm_tt */
> =C2=A0	devs->ttm_dev->funcs =3D &ttm_dev_empty_funcs;
> @@ -257,7 +257,7 @@ static void ttm_tt_destroy_basic(struct kunit
> *test)
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	int err;
> =C2=A0
> -	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE);
> +	bo =3D ttm_bo_kunit_init(test, test->priv, BO_SIZE, NULL);
> =C2=A0
> =C2=A0	dma_resv_lock(bo->base.resv, NULL);
> =C2=A0	err =3D ttm_tt_create(bo, false);

