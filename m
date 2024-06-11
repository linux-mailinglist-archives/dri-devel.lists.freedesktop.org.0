Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457E1903CF5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 15:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA7C10E62B;
	Tue, 11 Jun 2024 13:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZIla78oc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438A510E62B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 13:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718111911; x=1749647911;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BEAKYVuaRKK3H/Tg2LbUOFxM0uzyoJs/chPBlJ0H0V8=;
 b=ZIla78ocD/sdhFUprfROkSQG+zzXoX6GiMd6mH3mcKKZgeewMlJh8mVF
 +59EH/5qGkDH4XezJEaGx13XggGm67T9jRy6Ax4aBEXudIlW6BpJ9t4qw
 OqRZ3CkYsgj1T51rw8uu4JQnQ5C1zmwv1ddhoth/6dmoXOErlJS4QO2le
 aTExHhduUjCCJcUMrCPk0ix9ciU6H+9IIowjDy46jlQu1OjLodMYX3kxb
 fxwzDF7b+YaJGWnM2W6Q7vjBj68LvNMr5bHBedPxaEiJV93rz8jpOZj7f
 D63dZcEO5SvghGSawlahUIeUK6X/e5VTdYLYU5460Cp9KoDw60chSni1C A==;
X-CSE-ConnectionGUID: Llz4u8I3SpaFkNlctETzNw==
X-CSE-MsgGUID: F9+HJm4uT3GZ92RV0/f8kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18679745"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="18679745"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:18:31 -0700
X-CSE-ConnectionGUID: MfPROBhcRQ6J2R46kOQoUg==
X-CSE-MsgGUID: mpV3qg6eR86M7gPHm3UlOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="39548212"
Received: from unknown (HELO [10.245.245.125]) ([10.245.245.125])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 06:18:29 -0700
Message-ID: <a12adcfd66295a05b9ca5ced03911daf04ba27a2.camel@linux.intel.com>
Subject: Re: [PATCH v13 12/12] drm/ttm/tests: Use u32 and u64 over uint*_t
 types
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>, 
 dri-devel@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Amaranath Somalapuram <asomalap@amd.com>
Date: Tue, 11 Jun 2024 15:18:27 +0200
In-Reply-To: <8fb9a48d16fc1790af99b47cf6cef67a26b904fd.1717420597.git.karolina.stolarek@intel.com>
References: <cover.1717420597.git.karolina.stolarek@intel.com>
 <8fb9a48d16fc1790af99b47cf6cef67a26b904fd.1717420597.git.karolina.stolarek@intel.com>
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

On Mon, 2024-06-03 at 15:36 +0200, Karolina Stolarek wrote:
> Update the tests and helpers to use unsigned kernel types.
>=20
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Suggested-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_bo_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 12 ++++++------
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |=C2=A0 6 ++----
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |=C2=A0 4 ++--
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_pool_test.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 16 ++++++++--------
> =C2=A0drivers/gpu/drm/ttm/tests/ttm_tt_test.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 12 ++++++------
> =C2=A06 files changed, 25 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> index b53483ce3570..aafc22664c5e 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
> @@ -237,7 +237,7 @@ static void ttm_bo_unreserve_basic(struct kunit
> *test)
> =C2=A0	struct ttm_place *place;
> =C2=A0	struct ttm_resource_manager *man;
> =C2=A0	unsigned int bo_prio =3D TTM_MAX_BO_PRIORITY - 1;
> -	uint32_t mem_type =3D TTM_PL_SYSTEM;
> +	u32 mem_type =3D TTM_PL_SYSTEM;
> =C2=A0	int err;
> =C2=A0
> =C2=A0	place =3D ttm_place_kunit_init(test, mem_type, 0);
> @@ -278,7 +278,7 @@ static void ttm_bo_unreserve_pinned(struct kunit
> *test)
> =C2=A0	struct ttm_device *ttm_dev;
> =C2=A0	struct ttm_resource *res1, *res2;
> =C2=A0	struct ttm_place *place;
> -	uint32_t mem_type =3D TTM_PL_SYSTEM;
> +	u32 mem_type =3D TTM_PL_SYSTEM;
> =C2=A0	int err;
> =C2=A0
> =C2=A0	ttm_dev =3D kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
> @@ -322,7 +322,7 @@ static void ttm_bo_unreserve_bulk(struct kunit
> *test)
> =C2=A0	struct ttm_device *ttm_dev;
> =C2=A0	struct ttm_place *place;
> =C2=A0	struct dma_resv *resv;
> -	uint32_t mem_type =3D TTM_PL_SYSTEM;
> +	u32 mem_type =3D TTM_PL_SYSTEM;
> =C2=A0	unsigned int bo_priority =3D 0;
> =C2=A0	int err;
> =C2=A0
> @@ -380,7 +380,7 @@ static void ttm_bo_put_basic(struct kunit *test)
> =C2=A0	struct ttm_resource *res;
> =C2=A0	struct ttm_device *ttm_dev;
> =C2=A0	struct ttm_place *place;
> -	uint32_t mem_type =3D TTM_PL_SYSTEM;
> +	u32 mem_type =3D TTM_PL_SYSTEM;
> =C2=A0	int err;
> =C2=A0
> =C2=A0	place =3D ttm_place_kunit_init(test, mem_type, 0);
> @@ -495,7 +495,7 @@ static void ttm_bo_pin_unpin_resource(struct
> kunit *test)
> =C2=A0	struct ttm_resource *res;
> =C2=A0	struct ttm_device *ttm_dev;
> =C2=A0	struct ttm_place *place;
> -	uint32_t mem_type =3D TTM_PL_SYSTEM;
> +	u32 mem_type =3D TTM_PL_SYSTEM;
> =C2=A0	unsigned int bo_priority =3D 0;
> =C2=A0	int err;
> =C2=A0
> @@ -546,7 +546,7 @@ static void ttm_bo_multiple_pin_one_unpin(struct
> kunit *test)
> =C2=A0	struct ttm_resource *res;
> =C2=A0	struct ttm_device *ttm_dev;
> =C2=A0	struct ttm_place *place;
> -	uint32_t mem_type =3D TTM_PL_SYSTEM;
> +	u32 mem_type =3D TTM_PL_SYSTEM;
> =C2=A0	unsigned int bo_priority =3D 0;
> =C2=A0	int err;
> =C2=A0
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> index 48ab541f821f..c14cb2b48e68 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> @@ -42,8 +42,7 @@ static struct ttm_placement mock_placement =3D {
> =C2=A0	.placement =3D &mock2_place,
> =C2=A0};
> =C2=A0
> -static struct ttm_tt *ttm_tt_simple_create(struct ttm_buffer_object
> *bo,
> -					=C2=A0=C2=A0 uint32_t page_flags)
> +static struct ttm_tt *ttm_tt_simple_create(struct ttm_buffer_object
> *bo, u32 page_flags)
> =C2=A0{
> =C2=A0	struct ttm_tt *tt;
> =C2=A0
> @@ -202,8 +201,7 @@ struct ttm_buffer_object
> *ttm_bo_kunit_init(struct kunit *test,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
> =C2=A0
> -struct ttm_place *ttm_place_kunit_init(struct kunit *test,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t mem_type, uint32_t
> flags)
> +struct ttm_place *ttm_place_kunit_init(struct kunit *test, u32
> mem_type, u32 flags)
> =C2=A0{
> =C2=A0	struct ttm_place *place;
> =C2=A0
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> index aa70b50e7640..c7da23232ffa 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
> @@ -38,8 +38,8 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct
> kunit *test,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct ttm_test_devices
> *devs,
> =C2=A0					=C2=A0=C2=A0=C2=A0 size_t size,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct dma_resv *obj);
> -struct ttm_place *ttm_place_kunit_init(struct kunit *test,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t mem_type, uint32_t
> flags);
> +struct ttm_place *ttm_place_kunit_init(struct kunit *test, u32
> mem_type,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 flags);
> =C2=A0void dummy_ttm_bo_destroy(struct ttm_buffer_object *bo);
> =C2=A0
> =C2=A0struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)=
;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> index 9070ca43df53..5d4dc5b1c6d7 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
> @@ -48,7 +48,7 @@ static void ttm_pool_test_fini(struct kunit *test)
> =C2=A0}
> =C2=A0
> =C2=A0static struct ttm_tt *ttm_tt_kunit_init(struct kunit *test,
> -					uint32_t page_flags,
> +					u32 page_flags,
> =C2=A0					enum ttm_caching caching,
> =C2=A0					size_t size)
> =C2=A0{
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> index b90523422d24..77be0942ab62 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
> @@ -11,8 +11,8 @@
> =C2=A0
> =C2=A0struct ttm_resource_test_case {
> =C2=A0	const char *description;
> -	uint32_t mem_type;
> -	uint32_t flags;
> +	u32 mem_type;
> +	u32 flags;
> =C2=A0};
> =C2=A0
> =C2=A0struct ttm_resource_test_priv {
> @@ -47,7 +47,7 @@ static void ttm_resource_test_fini(struct kunit
> *test)
> =C2=A0
> =C2=A0static void ttm_init_test_mocks(struct kunit *test,
> =C2=A0				struct ttm_resource_test_priv *priv,
> -				uint32_t mem_type, uint32_t flags)
> +				u32 mem_type, u32 flags)
> =C2=A0{
> =C2=A0	size_t size =3D RES_SIZE;
> =C2=A0
> @@ -60,7 +60,7 @@ static void ttm_init_test_mocks(struct kunit *test,
> =C2=A0
> =C2=A0static void ttm_init_test_manager(struct kunit *test,
> =C2=A0				=C2=A0 struct ttm_resource_test_priv
> *priv,
> -				=C2=A0 uint32_t mem_type)
> +				=C2=A0 u32 mem_type)
> =C2=A0{
> =C2=A0	struct ttm_device *ttm_dev =3D priv->devs->ttm_dev;
> =C2=A0	struct ttm_resource_manager *man;
> @@ -112,7 +112,7 @@ static void ttm_resource_init_basic(struct kunit
> *test)
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	struct ttm_place *place;
> =C2=A0	struct ttm_resource_manager *man;
> -	uint64_t expected_usage;
> +	u64 expected_usage;
> =C2=A0
> =C2=A0	ttm_init_test_mocks(test, priv, params->mem_type, params-
> >flags);
> =C2=A0	bo =3D priv->bo;
> @@ -230,7 +230,7 @@ static void
> ttm_resource_manager_usage_basic(struct kunit *test)
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	struct ttm_place *place;
> =C2=A0	struct ttm_resource_manager *man;
> -	uint64_t actual_usage;
> +	u64 actual_usage;
> =C2=A0
> =C2=A0	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM,
> TTM_PL_FLAG_TOPDOWN);
> =C2=A0	bo =3D priv->bo;
> @@ -268,7 +268,7 @@ static void ttm_sys_man_alloc_basic(struct kunit
> *test)
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	struct ttm_place *place;
> =C2=A0	struct ttm_resource *res;
> -	uint32_t mem_type =3D TTM_PL_SYSTEM;
> +	u32 mem_type =3D TTM_PL_SYSTEM;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	ttm_init_test_mocks(test, priv, mem_type, 0);
> @@ -293,7 +293,7 @@ static void ttm_sys_man_free_basic(struct kunit
> *test)
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	struct ttm_place *place;
> =C2=A0	struct ttm_resource *res;
> -	uint32_t mem_type =3D TTM_PL_SYSTEM;
> +	u32 mem_type =3D TTM_PL_SYSTEM;
> =C2=A0
> =C2=A0	ttm_init_test_mocks(test, priv, mem_type, 0);
> =C2=A0	bo =3D priv->bo;
> diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> index dd9bac7cb7b0..a8c76dbd6913 100644
> --- a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> +++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> @@ -11,8 +11,8 @@
> =C2=A0
> =C2=A0struct ttm_tt_test_case {
> =C2=A0	const char *description;
> -	uint32_t size;
> -	uint32_t extra_pages_num;
> +	u32 size;
> +	u32 extra_pages_num;
> =C2=A0};
> =C2=A0
> =C2=A0static const struct ttm_tt_test_case ttm_tt_init_basic_cases[] =3D =
{
> @@ -41,9 +41,9 @@ static void ttm_tt_init_basic(struct kunit *test)
> =C2=A0	const struct ttm_tt_test_case *params =3D test->param_value;
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	struct ttm_tt *tt;
> -	uint32_t page_flags =3D TTM_TT_FLAG_ZERO_ALLOC;
> +	u32 page_flags =3D TTM_TT_FLAG_ZERO_ALLOC;
> =C2=A0	enum ttm_caching caching =3D ttm_cached;
> -	uint32_t extra_pages =3D params->extra_pages_num;
> +	u32 extra_pages =3D params->extra_pages_num;
> =C2=A0	int num_pages =3D params->size >> PAGE_SHIFT;
> =C2=A0	int err;
> =C2=A0
> @@ -69,7 +69,7 @@ static void ttm_tt_init_misaligned(struct kunit
> *test)
> =C2=A0	struct ttm_buffer_object *bo;
> =C2=A0	struct ttm_tt *tt;
> =C2=A0	enum ttm_caching caching =3D ttm_cached;
> -	uint32_t size =3D SZ_8K;
> +	u32 size =3D SZ_8K;
> =C2=A0	int num_pages =3D (size + SZ_4K) >> PAGE_SHIFT;
> =C2=A0	int err;
> =C2=A0
> @@ -211,7 +211,7 @@ static void ttm_tt_create_ttm_exists(struct kunit
> *test)
> =C2=A0}
> =C2=A0
> =C2=A0static struct ttm_tt *ttm_tt_null_create(struct ttm_buffer_object
> *bo,
> -					 uint32_t page_flags)
> +					 u32 page_flags)
> =C2=A0{
> =C2=A0	return NULL;
> =C2=A0}

