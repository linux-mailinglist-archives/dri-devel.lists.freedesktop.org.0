Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736FE8D7C66
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 09:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C91410E245;
	Mon,  3 Jun 2024 07:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbZyG1Sj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BBB10E245
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 07:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717399463; x=1748935463;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ahi1zilNyNu/vI9mQANQ7LYLsClk0mKLfFk68P1kH9U=;
 b=bbZyG1SjTGHr4kJnV7dT7PJA4Qtzn6wt9xeSa9IG+0Myrqn/tq6vKkqQ
 lT9AbCHJktZukPG7T/Qt/r6QsEpC7kzGfmnOgt9aCNkUbrDsWNTIxKGSw
 XqWTBBgLmmo00VrSSLDHaSbSmGOR/yVkDlVE7VImUhVdflTu3QG22Fqwu
 KOPgvhx85wQYP9Fxfg3vgykxDkwTK6wbiQVXdbKFfb1NuiD4XL3aFEMxl
 8c7HFkuRirX8701YOBmgOzIPSGHfP2pqKO5OlCbaTzqy8YSdUbztQWcyl
 BF5wHCr8nqoNlfHIG1ttmfA7pM/KNwQKylw6lWeDbeLKcSqsW4L20C40y w==;
X-CSE-ConnectionGUID: 65eFOGm6TBK3aVKbxXcu8Q==
X-CSE-MsgGUID: yn3+rOMHSh2joQhjyEWxQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14000811"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="14000811"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:24:23 -0700
X-CSE-ConnectionGUID: i5ndu/RhQUyOYqb8p3rR/g==
X-CSE-MsgGUID: 0UCZpwV/TqKvvRtL8OwmWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="41717110"
Received: from unknown (HELO [10.245.245.174]) ([10.245.245.174])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:24:22 -0700
Message-ID: <780eccefb82b08c3e87185d510f8e99ee6a174da.camel@linux.intel.com>
Subject: Re: [PATCH v12 06/10] drm/ttm/tests: Add tests with mock resource
 managers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>, 
 dri-devel@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, Amaranath Somalapuram <asomalap@amd.com>
Date: Mon, 03 Jun 2024 09:24:18 +0200
In-Reply-To: <5be44989-d259-4ede-90db-297046776cb8@intel.com>
References: <cover.1715767062.git.karolina.stolarek@intel.com>
 <fc62475ddc5ee32f9be197ee72b146209f31972e.1715767062.git.karolina.stolarek@intel.com>
 <43d9493358353fc40df56023e474ae827dbfd2ec.camel@linux.intel.com>
 <5be44989-d259-4ede-90db-297046776cb8@intel.com>
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

Hi

On Mon, 2024-06-03 at 08:55 +0200, Karolina Stolarek wrote:
> Hi Thomas,
>=20
> On 29.05.2024 14:58, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2024-05-15 at 13:24 +0200, Karolina Stolarek wrote:
> > > Add mock resource manager to test ttm_bo_validate() with non-
> > > system
> > > placements. Update KConfig entry to enable DRM Buddy allocator,
> > > used
> > > by the mock manager. Update move function to do more than just
> > > assign
> > > a resource.
> > >=20
> > > Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> > > Tested-by: Somalapuram, Amaranath <asomalap@amd.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0=C2=A0drivers/gpu/drm/ttm/tests/.kunitconfig=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0=C2=A0drivers/gpu/drm/ttm/tests/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0=C2=A0.../gpu/drm/ttm/tests/ttm_bo_validate_test.c=C2=A0 | 274
> > > ++++++++++++++++++
> > > =C2=A0=C2=A0drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |=C2=A0 38 =
++-
> > > =C2=A0=C2=A0drivers/gpu/drm/ttm/tests/ttm_mock_manager.c=C2=A0 | 207
> > > +++++++++++++
> > > =C2=A0=C2=A0drivers/gpu/drm/ttm/tests/ttm_mock_manager.h=C2=A0 |=C2=
=A0 31 ++
> > > =C2=A0=C2=A07 files changed, 551 insertions(+), 2 deletions(-)
> > > =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_man=
ager.c
> > > =C2=A0=C2=A0create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_man=
ager.h
> > >=20
> > > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> > > index 026444eeb5c6..4ba16501dbf7 100644
> > > --- a/drivers/gpu/drm/Kconfig
> > > +++ b/drivers/gpu/drm/Kconfig
> > > @@ -234,6 +234,7 @@ config DRM_TTM_KUNIT_TEST
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default n
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on DRM=
 && KUNIT && MMU && (UML || COMPILE_TEST)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_TTM
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_BUDDY
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_EXP=
ORT_FOR_TESTS if m
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_KUN=
IT_TEST_HELPERS
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default KUNIT_=
ALL_TESTS
> > > diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig
> > > b/drivers/gpu/drm/ttm/tests/.kunitconfig
> > > index 1ae1ffabd51e..772f0e1f4103 100644
> > > --- a/drivers/gpu/drm/ttm/tests/.kunitconfig
> > > +++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
> > > @@ -1,3 +1,4 @@
> > > =C2=A0=C2=A0CONFIG_KUNIT=3Dy
> > > =C2=A0=C2=A0CONFIG_DRM=3Dy
> > > =C2=A0=C2=A0CONFIG_DRM_TTM_KUNIT_TEST=3Dy
> > > +CONFIG_DRM_BUDDY=3Dy
> >=20
> > Is this strictly needed when CONFIG_DRM_TTM_KUNIT_TEST is selected?
> > Wouldn't that be enabled implicitly?
>=20
> Ah, yes, that should get selected implicitly. I'll check and remove
> if=20
> that works, thanks.
>=20
> >=20
> > > diff --git a/drivers/gpu/drm/ttm/tests/Makefile
> > > b/drivers/gpu/drm/ttm/tests/Makefile
> > > index 2e5ed63fb414..f3149de77541 100644
> > > --- a/drivers/gpu/drm/ttm/tests/Makefile
> > > +++ b/drivers/gpu/drm/ttm/tests/Makefile
> > > @@ -7,4 +7,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) +=3D \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_tt_test.o =
\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_test.o =
\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_validat=
e_test.o \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_mock_manager.o \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_kunit_help=
ers.o
> > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > index a5520b0631a3..8b62d95b8ab8 100644
> > > --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
> > > @@ -8,12 +8,15 @@
> > > =C2=A0=C2=A0#include <drm/ttm/ttm_tt.h>
> > > =C2=A0=20
> > > =C2=A0=C2=A0#include "ttm_kunit_helpers.h"
> > > +#include "ttm_mock_manager.h"
> > > =C2=A0=20
> > > =C2=A0=C2=A0#define BO_SIZE		SZ_4K
> > > +#define MANAGER_SIZE	SZ_1M
> > > =C2=A0=20
> > > =C2=A0=C2=A0struct ttm_bo_validate_test_case {
> > > =C2=A0=C2=A0	const char *description;
> > > =C2=A0=C2=A0	enum ttm_bo_type bo_type;
> > > +	uint32_t mem_type;
> >=20
> > Please use u32 instead of unit32_t in new code. The unit32_t usage
> > in
> > TTM is a remnant from when much of the drm- and ttm code was shared
> > with *bsd. Same in a couple of places below.
>=20
> I see. So, the question is what should I about other test code that
> is=20
> already merged? Submit a separate patch to change uint32_t --> u32?

Yes, IMO that's a good idea. And at some point I think we would want to
move all of TTM over as well.

Christian, any preferences?

>=20
> >=20
> > > =C2=A0=C2=A0	bool with_ttm;
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > @@ -102,6 +105,49 @@ static void
> > > ttm_bo_init_reserved_sys_man(struct
> > > kunit *test)
> > > =C2=A0=C2=A0	ttm_bo_put(bo);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +static void ttm_bo_init_reserved_mock_man(struct kunit *test)
> > > +{
> > > +	const struct ttm_bo_validate_test_case *params =3D test-
> > > > param_value;
> > > +	enum ttm_bo_type bo_type =3D params->bo_type;
> > > +	struct ttm_test_devices *priv =3D test->priv;
> > > +	uint32_t size =3D ALIGN(BO_SIZE, PAGE_SIZE);
> > > +	struct ttm_operation_ctx ctx =3D { };
> > > +	struct ttm_placement *placement;
> > > +	uint32_t mem_type =3D TTM_PL_VRAM;
> > > +	struct ttm_buffer_object *bo;
> > > +	struct ttm_place *place;
> > > +	int err;
> > > +
> > > +	ttm_mock_manager_init(priv->ttm_dev, mem_type,
> > > MANAGER_SIZE);
> > > +
> > > +	bo =3D kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> > > +	KUNIT_ASSERT_NOT_NULL(test, bo);
> > > +
> > > +	place =3D ttm_place_kunit_init(test, mem_type, 0);
> > > +	placement =3D ttm_placement_kunit_init(test, place, 1);
> > > +
> > > +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> > > +
> > > +	err =3D ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type,
> > > placement,
> > > +				=C2=A0=C2=A0 PAGE_SIZE, &ctx, NULL, NULL,
> > > +				=C2=A0=C2=A0 &dummy_ttm_bo_destroy);
> > > +	dma_resv_unlock(bo->base.resv);
> > > +
> > > +	KUNIT_EXPECT_EQ(test, err, 0);
> > > +	KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
> > > +	KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
> > > +	KUNIT_EXPECT_EQ(test, bo->type, bo_type);
> > > +	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
> > > +
> > > +	if (bo_type !=3D ttm_bo_type_kernel)
> > > +		KUNIT_EXPECT_TRUE(test,
> > > +				=C2=A0 drm_mm_node_allocated(&bo-
> > > > base.vma_node.vm_node));
> > > +
> > > +	ttm_resource_free(bo, &bo->resource);
> > > +	ttm_bo_put(bo);
> > > +	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
> > > +}
> > > +
> > > =C2=A0=C2=A0static void ttm_bo_init_reserved_resv(struct kunit *test)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	enum ttm_bo_type bo_type =3D ttm_bo_type_device;
> > > @@ -136,6 +182,51 @@ static void ttm_bo_init_reserved_resv(struct
> > > kunit *test)
> > > =C2=A0=C2=A0	ttm_bo_put(bo);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +static void ttm_bo_validate_basic(struct kunit *test)
> > > +{
> > > +	const struct ttm_bo_validate_test_case *params =3D test-
> > > > param_value;
> > > +	uint32_t fst_mem =3D TTM_PL_SYSTEM, snd_mem =3D TTM_PL_VRAM;
> > > +	struct ttm_operation_ctx ctx_init =3D { }, ctx_val =3D { };
> > > +	struct ttm_placement *fst_placement, *snd_placement;
> > > +	struct ttm_test_devices *priv =3D test->priv;
> > > +	struct ttm_place *fst_place, *snd_place;
> > > +	uint32_t size =3D ALIGN(SZ_8K, PAGE_SIZE);
> > > +	struct ttm_buffer_object *bo;
> > > +	int err;
> > > +
> > > +	ttm_mock_manager_init(priv->ttm_dev, snd_mem,
> > > MANAGER_SIZE);
> > > +
> > > +	fst_place =3D ttm_place_kunit_init(test, fst_mem, 0);
> > > +	fst_placement =3D ttm_placement_kunit_init(test,
> > > fst_place,
> > > 1);
> > > +
> > > +	bo =3D kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> > > +	KUNIT_ASSERT_NOT_NULL(test, bo);
> > > +
> > > +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> > > +
> > > +	err =3D ttm_bo_init_reserved(priv->ttm_dev, bo, params-
> > > > bo_type,
> > > +				=C2=A0=C2=A0 fst_placement, PAGE_SIZE,
> > > &ctx_init, NULL,
> > > +				=C2=A0=C2=A0 NULL, &dummy_ttm_bo_destroy);
> > > +	KUNIT_EXPECT_EQ(test, err, 0);
> > > +
> > > +	snd_place =3D ttm_place_kunit_init(test, snd_mem,
> > > DRM_BUDDY_TOPDOWN_ALLOCATION);
> > > +	snd_placement =3D ttm_placement_kunit_init(test,
> > > snd_place,
> > > 1);
> > > +
> > > +	err =3D ttm_bo_validate(bo, snd_placement, &ctx_val);
> > > +	dma_resv_unlock(bo->base.resv);
> > > +
> > > +	KUNIT_EXPECT_EQ(test, err, 0);
> > > +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo-
> > > >base.size);
> > > +	KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
> > > +	KUNIT_EXPECT_TRUE(test, ttm_tt_is_populated(bo->ttm));
> > > +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
> > > +	KUNIT_EXPECT_EQ(test, bo->resource->placement,
> > > +			DRM_BUDDY_TOPDOWN_ALLOCATION);
> > > +
> > > +	ttm_bo_put(bo);
> > > +	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
> > > +}
> > > +
> > > =C2=A0=C2=A0static void ttm_bo_validate_invalid_placement(struct kuni=
t
> > > *test)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	enum ttm_bo_type bo_type =3D ttm_bo_type_device;
> > > @@ -162,6 +253,36 @@ static void
> > > ttm_bo_validate_invalid_placement(struct kunit *test)
> > > =C2=A0=C2=A0	ttm_bo_put(bo);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +static void ttm_bo_validate_failed_alloc(struct kunit *test)
> > > +{
> > > +	enum ttm_bo_type bo_type =3D ttm_bo_type_device;
> > > +	struct ttm_test_devices *priv =3D test->priv;
> > > +	uint32_t size =3D ALIGN(BO_SIZE, PAGE_SIZE);
> > > +	struct ttm_operation_ctx ctx =3D { };
> > > +	struct ttm_placement *placement;
> > > +	uint32_t mem_type =3D TTM_PL_VRAM;
> > > +	struct ttm_buffer_object *bo;
> > > +	struct ttm_place *place;
> > > +	int err;
> > > +
> > > +	bo =3D ttm_bo_kunit_init(test, test->priv, size, NULL);
> > > +	bo->type =3D bo_type;
> > > +
> > > +	ttm_bad_manager_init(priv->ttm_dev, mem_type,
> > > MANAGER_SIZE);
> > > +
> > > +	place =3D ttm_place_kunit_init(test, mem_type, 0);
> > > +	placement =3D ttm_placement_kunit_init(test, place, 1);
> > > +
> > > +	ttm_bo_reserve(bo, false, false, NULL);
> > > +	err =3D ttm_bo_validate(bo, placement, &ctx);
> > > +	dma_resv_unlock(bo->base.resv);
> > > +
> > > +	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
> > > +
> > > +	ttm_bo_put(bo);
> > > +	ttm_bad_manager_fini(priv->ttm_dev, mem_type);
> > > +}
> > > +
> > > =C2=A0=C2=A0static void ttm_bo_validate_pinned(struct kunit *test)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	enum ttm_bo_type bo_type =3D ttm_bo_type_device;
> > > @@ -193,11 +314,164 @@ static void ttm_bo_validate_pinned(struct
> > > kunit *test)
> > > =C2=A0=C2=A0	ttm_bo_put(bo);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > +static const struct ttm_bo_validate_test_case
> > > ttm_mem_type_cases[] =3D
> > > {
> > > +	{
> > > +		.description =3D "System manager",
> > > +		.mem_type =3D TTM_PL_SYSTEM,
> > > +	},
> > > +	{
> > > +		.description =3D "VRAM manager",
> > > +		.mem_type =3D TTM_PL_VRAM,
> > > +	},
> > > +};
> > > +
> > > +KUNIT_ARRAY_PARAM(ttm_bo_validate_mem, ttm_mem_type_cases,
> > > +		=C2=A0 ttm_bo_validate_case_desc);
> > > +
> > > +static void ttm_bo_validate_same_placement(struct kunit *test)
> > > +{
> > > +	const struct ttm_bo_validate_test_case *params =3D test-
> > > > param_value;
> > > +	struct ttm_operation_ctx ctx_init =3D { }, ctx_val =3D { };
> > > +	struct ttm_test_devices *priv =3D test->priv;
> > > +	uint32_t size =3D ALIGN(BO_SIZE, PAGE_SIZE);
> > > +	struct ttm_placement *placement;
> > > +	struct ttm_buffer_object *bo;
> > > +	struct ttm_place *place;
> > > +	int err;
> > > +
> > > +	place =3D ttm_place_kunit_init(test, params->mem_type, 0);
> > > +	placement =3D ttm_placement_kunit_init(test, place, 1);
> > > +
> > > +	if (params->mem_type !=3D TTM_PL_SYSTEM)
> > > +		ttm_mock_manager_init(priv->ttm_dev, params-
> > > > mem_type, MANAGER_SIZE);
> > > +
> > > +	bo =3D kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> > > +	KUNIT_ASSERT_NOT_NULL(test, bo);
> > > +
> > > +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> > > +
> > > +	err =3D ttm_bo_init_reserved(priv->ttm_dev, bo, params-
> > > > bo_type,
> > > +				=C2=A0=C2=A0 placement, PAGE_SIZE,
> > > &ctx_init,
> > > NULL,
> > > +				=C2=A0=C2=A0 NULL, &dummy_ttm_bo_destroy);
> > > +	KUNIT_EXPECT_EQ(test, err, 0);
> > > +
> > > +	err =3D ttm_bo_validate(bo, placement, &ctx_val);
> > > +	dma_resv_unlock(bo->base.resv);
> > > +
> > > +	KUNIT_EXPECT_EQ(test, err, 0);
> > > +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, 0);
> > > +
> > > +	ttm_bo_put(bo);
> > > +
> > > +	if (params->mem_type !=3D TTM_PL_SYSTEM)
> > > +		ttm_mock_manager_fini(priv->ttm_dev, params-
> > > > mem_type);
> > > +}
> > > +
> > > +static void ttm_bo_validate_busy_placement(struct kunit *test)
> > > +{
> > > +	uint32_t fst_mem =3D TTM_PL_VRAM, snd_mem =3D TTM_PL_VRAM +
> > > 1;
> > > +	struct ttm_operation_ctx ctx_init =3D { }, ctx_val =3D { };
> > > +	struct ttm_placement *placement_init, *placement_val;
> > > +	enum ttm_bo_type bo_type =3D ttm_bo_type_device;
> > > +	struct ttm_test_devices *priv =3D test->priv;
> > > +	uint32_t size =3D ALIGN(BO_SIZE, PAGE_SIZE);
> > > +	struct ttm_place *init_place, places[2];
> > > +	struct ttm_resource_manager *man;
> > > +	struct ttm_buffer_object *bo;
> > > +	int err;
> > > +
> > > +	ttm_bad_manager_init(priv->ttm_dev, fst_mem,
> > > MANAGER_SIZE);
> > > +	ttm_mock_manager_init(priv->ttm_dev, snd_mem,
> > > MANAGER_SIZE);
> > > +
> > > +	init_place =3D ttm_place_kunit_init(test, TTM_PL_SYSTEM,
> > > 0);
> > > +	placement_init =3D ttm_placement_kunit_init(test,
> > > init_place,
> > > 1);
> > > +
> > > +	bo =3D kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> > > +	KUNIT_ASSERT_NOT_NULL(test, bo);
> > > +
> > > +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> > > +
> > > +	err =3D ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type,
> > > placement_init,
> > > +				=C2=A0=C2=A0 PAGE_SIZE, &ctx_init, NULL,
> > > NULL,
> > > +				=C2=A0=C2=A0 &dummy_ttm_bo_destroy);
> > > +	KUNIT_EXPECT_EQ(test, err, 0);
> > > +
> > > +	places[0] =3D (struct ttm_place){ .mem_type =3D fst_mem,
> > > .flags
> > > =3D TTM_PL_FLAG_DESIRED };
> > > +	places[1] =3D (struct ttm_place){ .mem_type =3D snd_mem,
> > > .flags
> > > =3D TTM_PL_FLAG_FALLBACK };
> > > +	placement_val =3D ttm_placement_kunit_init(test, places,
> > > 2);
> > > +
> > > +	err =3D ttm_bo_validate(bo, placement_val, &ctx_val);
> > > +	dma_resv_unlock(bo->base.resv);
> > > +
> > > +	man =3D ttm_manager_type(priv->ttm_dev, snd_mem);
> > > +
> > > +	KUNIT_EXPECT_EQ(test, err, 0);
> > > +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo-
> > > >base.size);
> > > +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
> > > +	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo-
> > > > priority]));
> > > +
> > > +	ttm_bo_put(bo);
> > > +	ttm_bad_manager_fini(priv->ttm_dev, fst_mem);
> > > +	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
> > > +}
> > > +
> > > +static void ttm_bo_validate_multihop(struct kunit *test)
> > > +{
> > > +	const struct ttm_bo_validate_test_case *params =3D test-
> > > > param_value;
> > > +	struct ttm_operation_ctx ctx_init =3D { }, ctx_val =3D { };
> > > +	struct ttm_placement *placement_init, *placement_val;
> > > +	uint32_t fst_mem =3D TTM_PL_VRAM, tmp_mem =3D TTM_PL_TT,
> > > +		 final_mem =3D TTM_PL_SYSTEM;
> > > +	struct ttm_test_devices *priv =3D test->priv;
> > > +	struct ttm_place *fst_place, *final_place;
> > > +	uint32_t size =3D ALIGN(BO_SIZE, PAGE_SIZE);
> > > +	struct ttm_buffer_object *bo;
> > > +	int err;
> > > +
> > > +	ttm_mock_manager_init(priv->ttm_dev, fst_mem,
> > > MANAGER_SIZE);
> > > +	ttm_mock_manager_init(priv->ttm_dev, tmp_mem,
> > > MANAGER_SIZE);
> > > +
> > > +	fst_place =3D ttm_place_kunit_init(test, fst_mem, 0);
> > > +	placement_init =3D ttm_placement_kunit_init(test,
> > > fst_place,
> > > 1);
> > > +
> > > +	bo =3D kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
> > > +	KUNIT_ASSERT_NOT_NULL(test, bo);
> > > +
> > > +	drm_gem_private_object_init(priv->drm, &bo->base, size);
> > > +
> > > +	err =3D ttm_bo_init_reserved(priv->ttm_dev, bo, params-
> > > > bo_type,
> > > +				=C2=A0=C2=A0 placement_init, PAGE_SIZE,
> > > &ctx_init, NULL,
> > > +				=C2=A0=C2=A0 NULL, &dummy_ttm_bo_destroy);
> > > +	KUNIT_EXPECT_EQ(test, err, 0);
> > > +
> > > +	final_place =3D ttm_place_kunit_init(test, final_mem, 0);
> > > +	placement_val =3D ttm_placement_kunit_init(test,
> > > final_place,
> > > 1);
> > > +
> > > +	err =3D ttm_bo_validate(bo, placement_val, &ctx_val);
> > > +	dma_resv_unlock(bo->base.resv);
> > > +
> > > +	KUNIT_EXPECT_EQ(test, err, 0);
> > > +	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2);
> > > +	KUNIT_EXPECT_EQ(test, bo->resource->mem_type,
> > > final_mem);
> > > +
> > > +	ttm_bo_put(bo);
> > > +
> > > +	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
> > > +	ttm_mock_manager_fini(priv->ttm_dev, tmp_mem);
> > > +}
> > > +
> > > =C2=A0=C2=A0static struct kunit_case ttm_bo_validate_test_cases[] =3D=
 {
> > > =C2=A0=C2=A0	KUNIT_CASE_PARAM(ttm_bo_init_reserved_sys_man,
> > > ttm_bo_types_gen_params),
> > > +	KUNIT_CASE_PARAM(ttm_bo_init_reserved_mock_man,
> > > ttm_bo_types_gen_params),
> > > =C2=A0=C2=A0	KUNIT_CASE(ttm_bo_init_reserved_resv),
> > > +	KUNIT_CASE_PARAM(ttm_bo_validate_basic,
> > > ttm_bo_types_gen_params),
> > > =C2=A0=C2=A0	KUNIT_CASE(ttm_bo_validate_invalid_placement),
> > > +	KUNIT_CASE_PARAM(ttm_bo_validate_same_placement,
> > > +			 ttm_bo_validate_mem_gen_params),
> > > +	KUNIT_CASE(ttm_bo_validate_failed_alloc),
> > > =C2=A0=C2=A0	KUNIT_CASE(ttm_bo_validate_pinned),
> > > +	KUNIT_CASE(ttm_bo_validate_busy_placement),
> > > +	KUNIT_CASE_PARAM(ttm_bo_validate_multihop,
> > > ttm_bo_types_gen_params),
> > > =C2=A0=C2=A0	{}
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > index 2f590bae53f8..2a2585b37118 100644
> > > --- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > +++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
> > > @@ -27,8 +27,42 @@ static int mock_move(struct ttm_buffer_object
> > > *bo,
> > > bool evict,
> > > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *new_mem,
> > > =C2=A0=C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_place *hop)
> > > =C2=A0=C2=A0{
> > > -	bo->resource =3D new_mem;
> > > -	return 0;
> > > +	struct ttm_resource *old_mem =3D bo->resource;
> > > +	int ret;
> > > +
> > > +	if (!old_mem || (old_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
> > > !bo-
> > > > ttm)) {
> > > +		ttm_bo_move_null(bo, new_mem);
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (bo->resource->mem_type =3D=3D TTM_PL_VRAM &&
> > > +	=C2=A0=C2=A0=C2=A0 new_mem->mem_type =3D=3D TTM_PL_SYSTEM) {
> > > +		hop->mem_type =3D TTM_PL_TT;
> > > +		hop->flags =3D TTM_PL_FLAG_TEMPORARY;
> > > +		hop->fpfn =3D 0;
> > > +		hop->lpfn =3D 0;
> > > +		return -EMULTIHOP;
> > > +	}
> > > +
> > > +	if (old_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
> > > +	=C2=A0=C2=A0=C2=A0 new_mem->mem_type =3D=3D TTM_PL_TT) {
> > > +		ttm_bo_move_null(bo, new_mem);
> > > +		return 0;
> > > +	}
> > > +
> > > +	if (old_mem->mem_type =3D=3D TTM_PL_TT &&
> > > +	=C2=A0=C2=A0=C2=A0 new_mem->mem_type =3D=3D TTM_PL_SYSTEM) {
> > > +		ret =3D ttm_bo_wait_ctx(bo, ctx);
> >=20
> > We're not doing any accelerated move here, so ttm_bo_move_null()
> > should
> > be sufficient also in this case?
>=20
> I'll remove that, thanks.
>=20
> >=20
> > > +
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		ttm_resource_free(bo, &bo->resource);
> > > +		ttm_bo_assign_mem(bo, new_mem);
> > > +		return 0;
> > > +	}
> > > +
> > > +	return ttm_bo_move_memcpy(bo, ctx, new_mem);
> >=20
> > Do we hit this move_memcpy()? Since the mock manager doesn't
> > actually
> > reserve any memory to manager, I'd expect this to run into
> > problems?
>=20
> We do. The mock manager has use_tt=3Dtrue, so on move, we'd use=20
> ttm_kmap_iter_tt_init() for src and dest and copy the pages. I'm not=20
> sure if that's the right approach, but it enables me to test if=20
> ttm_operation_ctx's bytes_moved is correctly updated.

Ah, ok. It's probably not a common use-case since with both src and dst
having use_tt, IIRC ttm should keep the pages and their content mostly
intact across a move. So you would memcpy the source on itself?

But it would give some coverage of the copy code though.

/Thomas


>=20
> >=20
> >=20
> >=20
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0struct ttm_device_funcs ttm_dev_funcs =3D {
> > > diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
> > > b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
> > > new file mode 100644
> > > index 000000000000..eb9dca1de1a2
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
> > > @@ -0,0 +1,207 @@
> > > +// SPDX-License-Identifier: GPL-2.0 AND MIT
> > > +/*
> > > + * Copyright =C2=A9 2023 Intel Corporation
> > > + */
> > > +#include <drm/ttm/ttm_resource.h>
> > > +#include <drm/ttm/ttm_device.h>
> > > +#include <drm/ttm/ttm_placement.h>
> > > +
> > > +#include "ttm_mock_manager.h"
> > > +
> > > +static inline struct ttm_mock_manager *
> > > +to_mock_mgr(struct ttm_resource_manager *man)
> > > +{
> > > +	return container_of(man, struct ttm_mock_manager, man);
> > > +}
> > > +
> > > +static inline struct ttm_mock_resource *
> > > +to_mock_mgr_resource(struct ttm_resource *res)
> > > +{
> > > +	return container_of(res, struct ttm_mock_resource,
> > > base);
> > > +}
> > > +
> > > +static int ttm_mock_manager_alloc(struct ttm_resource_manager
> > > *man,
> > > +				=C2=A0 struct ttm_buffer_object *bo,
> > > +				=C2=A0 const struct ttm_place *place,
> > > +				=C2=A0 struct ttm_resource **res)
> > > +{
> > > +	struct ttm_mock_manager *manager =3D to_mock_mgr(man);
> > > +	struct ttm_mock_resource *mock_res;
> > > +	struct drm_buddy *mm =3D &manager->mm;
> > > +	uint64_t lpfn, fpfn, alloc_size;
> > > +	int err;
> > > +
> > > +	mock_res =3D kzalloc(sizeof(*mock_res), GFP_KERNEL);
> > > +
> > > +	if (!mock_res)
> > > +		return -ENOMEM;
> > > +
> > > +	fpfn =3D 0;
> > > +	lpfn =3D man->size;
> > > +
> > > +	ttm_resource_init(bo, place, &mock_res->base);
> > > +	INIT_LIST_HEAD(&mock_res->blocks);
> > > +
> > > +	if (place->flags & TTM_PL_FLAG_TOPDOWN)
> > > +		mock_res->flags |=3D DRM_BUDDY_TOPDOWN_ALLOCATION;
> > > +
> > > +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
> > > +		mock_res->flags |=3D
> > > DRM_BUDDY_CONTIGUOUS_ALLOCATION;
> > > +
> > > +	alloc_size =3D (uint64_t)mock_res->base.size;
> > > +	mutex_lock(&manager->lock);
> > > +	err =3D drm_buddy_alloc_blocks(mm, fpfn, lpfn, alloc_size,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 manager->default_page_size,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 &mock_res->blocks,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0 mock_res->flags);
> > > +
> > > +	if (err)
> > > +		goto error_free_blocks;
> > > +	mutex_unlock(&manager->lock);
> > > +
> > > +	*res =3D &mock_res->base;
> > > +	return 0;
> > > +
> > > +error_free_blocks:
> > > +	drm_buddy_free_list(mm, &mock_res->blocks, 0);
> > > +	ttm_resource_fini(man, &mock_res->base);
> > > +	mutex_unlock(&manager->lock);
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +static void ttm_mock_manager_free(struct ttm_resource_manager
> > > *man,
> > > +				=C2=A0 struct ttm_resource *res)
> > > +{
> > > +	struct ttm_mock_manager *manager =3D to_mock_mgr(man);
> > > +	struct ttm_mock_resource *mock_res =3D
> > > to_mock_mgr_resource(res);
> > > +	struct drm_buddy *mm =3D &manager->mm;
> > > +
> > > +	mutex_lock(&manager->lock);
> > > +	drm_buddy_free_list(mm, &mock_res->blocks, 0);
> > > +	mutex_unlock(&manager->lock);
> > > +
> > > +	ttm_resource_fini(man, res);
> > > +	kfree(mock_res);
> > > +}
> > > +
> > > +static const struct ttm_resource_manager_func
> > > ttm_mock_manager_funcs
> > > =3D {
> > > +	.alloc =3D ttm_mock_manager_alloc,
> > > +	.free =3D ttm_mock_manager_free,
> > > +};
> > > +
> > > +int ttm_mock_manager_init(struct ttm_device *bdev, uint32_t
> > > mem_type, uint32_t size)
> > > +{
> > > +	struct ttm_mock_manager *manager;
> > > +	struct ttm_resource_manager *base;
> > > +	int err;
> > > +
> > > +	manager =3D kzalloc(sizeof(*manager), GFP_KERNEL);
> > > +	if (!manager)
> > > +		return -ENOMEM;
> > > +
> > > +	mutex_init(&manager->lock);
> > > +
> > > +	err =3D drm_buddy_init(&manager->mm, size, PAGE_SIZE);
> > > +
> > > +	if (err) {
> > > +		kfree(manager);
> > > +		return err;
> > > +	}
> > > +
> > > +	manager->default_page_size =3D PAGE_SIZE;
> > > +	base =3D &manager->man;
> > > +	base->func =3D &ttm_mock_manager_funcs;
> > > +	base->use_tt =3D true;
> > > +
> > > +	ttm_resource_manager_init(base, bdev, size);
> > > +	ttm_set_driver_manager(bdev, mem_type, base);
> > > +	ttm_resource_manager_set_used(base, true);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(ttm_mock_manager_init);
> > > +
> > > +void ttm_mock_manager_fini(struct ttm_device *bdev, uint32_t
> > > mem_type)
> > > +{
> > > +	struct ttm_resource_manager *man;
> > > +	struct ttm_mock_manager *mock_man;
> > > +	int err;
> > > +
> > > +	man =3D ttm_manager_type(bdev, mem_type);
> > > +	mock_man =3D to_mock_mgr(man);
> > > +
> > > +	err =3D ttm_resource_manager_evict_all(bdev, man);
> > > +	if (err)
> > > +		return;
> > > +
> > > +	ttm_resource_manager_set_used(man, false);
> > > +
> > > +	mutex_lock(&mock_man->lock);
> > > +	drm_buddy_fini(&mock_man->mm);
> > > +	mutex_unlock(&mock_man->lock);
> > > +
> > > +	ttm_set_driver_manager(bdev, mem_type, NULL);
> > > +}
> > > +EXPORT_SYMBOL_GPL(ttm_mock_manager_fini);
> > > +
> > > +static int ttm_bad_manager_alloc(struct ttm_resource_manager
> > > *man,
> > > +				 struct ttm_buffer_object *bo,
> > > +				 const struct ttm_place *place,
> > > +				 struct ttm_resource **res)
> > > +{
> > > +	return -ENOSPC;
> > > +}
> > > +
> > > +static void ttm_bad_manager_free(struct ttm_resource_manager
> > > *man,
> > > +				 struct ttm_resource *res)
> > > +{
> > > +}
> > > +
> > > +static bool ttm_bad_manager_compatible(struct
> > > ttm_resource_manager
> > > *man,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ttm_resource *res,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct ttm_place
> > > *place,
> > > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t size)
> > > +{
> > > +	return true;
> > > +}
> > > +
> > > +static const struct ttm_resource_manager_func
> > > ttm_bad_manager_funcs
> > > =3D {
> > > +	.alloc =3D ttm_bad_manager_alloc,
> > > +	.free =3D ttm_bad_manager_free,
> > > +	.compatible =3D ttm_bad_manager_compatible
> > > +};
> > > +
> > > +int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t
> > > mem_type,
> > > +			 uint32_t size)
> > > +{
> > > +	struct ttm_resource_manager *man;
> > > +
> > > +	man =3D kzalloc(sizeof(*man), GFP_KERNEL);
> > > +	if (!man)
> > > +		return -ENOMEM;
> > > +
> > > +	man->func =3D &ttm_bad_manager_funcs;
> > > +
> > > +	ttm_resource_manager_init(man, bdev, size);
> > > +	ttm_set_driver_manager(bdev, mem_type, man);
> > > +	ttm_resource_manager_set_used(man, true);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(ttm_bad_manager_init);
> > > +
> > > +void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t
> > > mem_type)
> > > +{
> > > +	struct ttm_resource_manager *man;
> > > +
> > > +	man =3D ttm_manager_type(bdev, mem_type);
> > > +
> > > +	ttm_resource_manager_set_used(man, false);
> > > +	ttm_set_driver_manager(bdev, mem_type, NULL);
> > > +
> > > +	kfree(man);
> > > +}
> > > +EXPORT_SYMBOL_GPL(ttm_bad_manager_fini);
> > > +
> > > +MODULE_LICENSE("GPL");
> >=20
> > When the module is dual-licensed IIRC the correct option to use
> > here is
> > "GPL and additional rights"
>=20
> I took that module license from DRM KUnit tests, but I'll update it,
> thanks.
>=20
> All the best,
> Karolina

