Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD88D8415
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 15:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6EC10E20B;
	Mon,  3 Jun 2024 13:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mKBtF8wb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1DD10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717421808; x=1748957808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CImLMnaHRJFstPw68Hl2lregrKpAl3I0TnZLMKW4G1U=;
 b=mKBtF8wbfMM5stSwBWyHhFkrKCqcubVyiuTZDmC5dsPkqbo9xU+YBtQ+
 CHj6XCOBFTH64hIGSQ4OdS50dhWNZqKIkzDZnbrjyp7ASRT1aQDQ9+TPB
 TbTRYZL/wqDe0VICZyCybeaCdp0LkaGcWe169dUhicqa7rVOMu0Q6m6Q+
 PNlsJfMfO4rmmSjRKpgEd2qJ7xUfAfaeUOLZVena0ag1im7wM0aeP+BPl
 3niE7RlUHmCCXwOIJk3KksTQQvjJ37L/pPI+HSWEw4hy6pum0lqsTQHju
 cSynlBktHY6ISaIwhS7d6Elw8XhjP2n5iEQTjB5tXVfs+Eh0fCvC1+qBb Q==;
X-CSE-ConnectionGUID: 6Uzv/r8OSOWIdONbvpSlbQ==
X-CSE-MsgGUID: HgzIrAJkSsyJdpv8uQayIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17752542"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="17752542"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:36:47 -0700
X-CSE-ConnectionGUID: W2qICAG+SNGDcl6WWAiZ7g==
X-CSE-MsgGUID: /HJY/8VvSDmZcw6kUnvumQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36960054"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.245.245.157])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 06:36:42 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Amaranath Somalapuram <asomalap@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v13 06/12] drm/ttm/tests: Add tests with mock resource managers
Date: Mon,  3 Jun 2024 15:36:09 +0200
Message-Id: <a9aea06ad209581d0b10a2f125f859b900c50f37.1717420597.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717420597.git.karolina.stolarek@intel.com>
References: <cover.1717420597.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Add mock resource manager to test ttm_bo_validate() with non-system
placements. Update KConfig entry to enable DRM Buddy allocator, used
by the mock manager. Update move function to do more than just assign
a resource.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Tested-by: Somalapuram, Amaranath <asomalap@amd.com>
---
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/ttm/tests/Makefile            |   1 +
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 273 ++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  32 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 206 +++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  29 ++
 6 files changed, 540 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 9703429de6b9..4c5cc517990b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -235,6 +235,7 @@ config DRM_TTM_KUNIT_TEST
         default n
         depends on DRM && KUNIT && MMU && (UML || COMPILE_TEST)
         select DRM_TTM
+        select DRM_BUDDY
         select DRM_EXPORT_FOR_TESTS if m
         select DRM_KUNIT_TEST_HELPERS
         default KUNIT_ALL_TESTS
diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
index 2e5ed63fb414..f3149de77541 100644
--- a/drivers/gpu/drm/ttm/tests/Makefile
+++ b/drivers/gpu/drm/ttm/tests/Makefile
@@ -7,4 +7,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
         ttm_tt_test.o \
         ttm_bo_test.o \
         ttm_bo_validate_test.o \
+        ttm_mock_manager.o \
         ttm_kunit_helpers.o
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index cc8346795f8d..68b088d58765 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -8,12 +8,15 @@
 #include <drm/ttm/ttm_tt.h>
 
 #include "ttm_kunit_helpers.h"
+#include "ttm_mock_manager.h"
 
 #define BO_SIZE		SZ_4K
+#define MANAGER_SIZE	SZ_1M
 
 struct ttm_bo_validate_test_case {
 	const char *description;
 	enum ttm_bo_type bo_type;
+	u32 mem_type;
 	bool with_ttm;
 };
 
@@ -102,6 +105,49 @@ static void ttm_bo_init_reserved_sys_man(struct kunit *test)
 	ttm_bo_put(bo);
 }
 
+static void ttm_bo_init_reserved_mock_man(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	enum ttm_bo_type bo_type = params->bo_type;
+	struct ttm_test_devices *priv = test->priv;
+	u32 size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_placement *placement;
+	u32 mem_type = TTM_PL_VRAM;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	drm_gem_private_object_init(priv->drm, &bo->base, size);
+
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
+				   PAGE_SIZE, &ctx, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, kref_read(&bo->kref), 1);
+	KUNIT_EXPECT_PTR_EQ(test, bo->bdev, priv->ttm_dev);
+	KUNIT_EXPECT_EQ(test, bo->type, bo_type);
+	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
+
+	if (bo_type != ttm_bo_type_kernel)
+		KUNIT_EXPECT_TRUE(test,
+				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
+
+	ttm_resource_free(bo, &bo->resource);
+	ttm_bo_put(bo);
+	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
+}
+
 static void ttm_bo_init_reserved_resv(struct kunit *test)
 {
 	enum ttm_bo_type bo_type = ttm_bo_type_device;
@@ -136,6 +182,51 @@ static void ttm_bo_init_reserved_resv(struct kunit *test)
 	ttm_bo_put(bo);
 }
 
+static void ttm_bo_validate_basic(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	u32 fst_mem = TTM_PL_SYSTEM, snd_mem = TTM_PL_VRAM;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	struct ttm_placement *fst_placement, *snd_placement;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_place *fst_place, *snd_place;
+	u32 size = ALIGN(SZ_8K, PAGE_SIZE);
+	struct ttm_buffer_object *bo;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
+
+	fst_place = ttm_place_kunit_init(test, fst_mem, 0);
+	fst_placement = ttm_placement_kunit_init(test, fst_place, 1);
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	drm_gem_private_object_init(priv->drm, &bo->base, size);
+
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params->bo_type,
+				   fst_placement, PAGE_SIZE, &ctx_init, NULL,
+				   NULL, &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	snd_place = ttm_place_kunit_init(test, snd_mem, DRM_BUDDY_TOPDOWN_ALLOCATION);
+	snd_placement = ttm_placement_kunit_init(test, snd_place, 1);
+
+	err = ttm_bo_validate(bo, snd_placement, &ctx_val);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo->base.size);
+	KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
+	KUNIT_EXPECT_TRUE(test, ttm_tt_is_populated(bo->ttm));
+	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
+	KUNIT_EXPECT_EQ(test, bo->resource->placement,
+			DRM_BUDDY_TOPDOWN_ALLOCATION);
+
+	ttm_bo_put(bo);
+	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
+}
+
 static void ttm_bo_validate_invalid_placement(struct kunit *test)
 {
 	enum ttm_bo_type bo_type = ttm_bo_type_device;
@@ -162,6 +253,36 @@ static void ttm_bo_validate_invalid_placement(struct kunit *test)
 	ttm_bo_put(bo);
 }
 
+static void ttm_bo_validate_failed_alloc(struct kunit *test)
+{
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	u32 size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_placement *placement;
+	u32 mem_type = TTM_PL_VRAM;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	int err;
+
+	bo = ttm_bo_kunit_init(test, test->priv, size, NULL);
+	bo->type = bo_type;
+
+	ttm_bad_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	ttm_bo_reserve(bo, false, false, NULL);
+	err = ttm_bo_validate(bo, placement, &ctx);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
+
+	ttm_bo_put(bo);
+	ttm_bad_manager_fini(priv->ttm_dev, mem_type);
+}
+
 static void ttm_bo_validate_pinned(struct kunit *test)
 {
 	enum ttm_bo_type bo_type = ttm_bo_type_device;
@@ -193,11 +314,163 @@ static void ttm_bo_validate_pinned(struct kunit *test)
 	ttm_bo_put(bo);
 }
 
+static const struct ttm_bo_validate_test_case ttm_mem_type_cases[] = {
+	{
+		.description = "System manager",
+		.mem_type = TTM_PL_SYSTEM,
+	},
+	{
+		.description = "VRAM manager",
+		.mem_type = TTM_PL_VRAM,
+	},
+};
+
+KUNIT_ARRAY_PARAM(ttm_bo_validate_mem, ttm_mem_type_cases,
+		  ttm_bo_validate_case_desc);
+
+static void ttm_bo_validate_same_placement(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	struct ttm_test_devices *priv = test->priv;
+	u32 size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_placement *placement;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	int err;
+
+	place = ttm_place_kunit_init(test, params->mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	if (params->mem_type != TTM_PL_SYSTEM)
+		ttm_mock_manager_init(priv->ttm_dev, params->mem_type, MANAGER_SIZE);
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	drm_gem_private_object_init(priv->drm, &bo->base, size);
+
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params->bo_type,
+				   placement, PAGE_SIZE, &ctx_init, NULL,
+				   NULL, &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	err = ttm_bo_validate(bo, placement, &ctx_val);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, 0);
+
+	ttm_bo_put(bo);
+
+	if (params->mem_type != TTM_PL_SYSTEM)
+		ttm_mock_manager_fini(priv->ttm_dev, params->mem_type);
+}
+
+static void ttm_bo_validate_busy_placement(struct kunit *test)
+{
+	u32 fst_mem = TTM_PL_VRAM, snd_mem = TTM_PL_VRAM + 1;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	struct ttm_placement *placement_init, *placement_val;
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	u32 size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_place *init_place, places[2];
+	struct ttm_resource_manager *man;
+	struct ttm_buffer_object *bo;
+	int err;
+
+	ttm_bad_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
+
+	init_place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
+	placement_init = ttm_placement_kunit_init(test, init_place, 1);
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	drm_gem_private_object_init(priv->drm, &bo->base, size);
+
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement_init,
+				   PAGE_SIZE, &ctx_init, NULL, NULL,
+				   &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	places[0] = (struct ttm_place){ .mem_type = fst_mem, .flags = TTM_PL_FLAG_DESIRED };
+	places[1] = (struct ttm_place){ .mem_type = snd_mem, .flags = TTM_PL_FLAG_FALLBACK };
+	placement_val = ttm_placement_kunit_init(test, places, 2);
+
+	err = ttm_bo_validate(bo, placement_val, &ctx_val);
+	dma_resv_unlock(bo->base.resv);
+
+	man = ttm_manager_type(priv->ttm_dev, snd_mem);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, bo->base.size);
+	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
+	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
+
+	ttm_bo_put(bo);
+	ttm_bad_manager_fini(priv->ttm_dev, fst_mem);
+	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
+}
+
+static void ttm_bo_validate_multihop(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	struct ttm_placement *placement_init, *placement_val;
+	u32 fst_mem = TTM_PL_VRAM, tmp_mem = TTM_PL_TT, final_mem = TTM_PL_SYSTEM;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_place *fst_place, *final_place;
+	u32 size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_buffer_object *bo;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, tmp_mem, MANAGER_SIZE);
+
+	fst_place = ttm_place_kunit_init(test, fst_mem, 0);
+	placement_init = ttm_placement_kunit_init(test, fst_place, 1);
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	drm_gem_private_object_init(priv->drm, &bo->base, size);
+
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo, params->bo_type,
+				   placement_init, PAGE_SIZE, &ctx_init, NULL,
+				   NULL, &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, err, 0);
+
+	final_place = ttm_place_kunit_init(test, final_mem, 0);
+	placement_val = ttm_placement_kunit_init(test, final_place, 1);
+
+	err = ttm_bo_validate(bo, placement_val, &ctx_val);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2);
+	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, final_mem);
+
+	ttm_bo_put(bo);
+
+	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
+	ttm_mock_manager_fini(priv->ttm_dev, tmp_mem);
+}
+
 static struct kunit_case ttm_bo_validate_test_cases[] = {
 	KUNIT_CASE_PARAM(ttm_bo_init_reserved_sys_man, ttm_bo_types_gen_params),
+	KUNIT_CASE_PARAM(ttm_bo_init_reserved_mock_man, ttm_bo_types_gen_params),
 	KUNIT_CASE(ttm_bo_init_reserved_resv),
+	KUNIT_CASE_PARAM(ttm_bo_validate_basic, ttm_bo_types_gen_params),
 	KUNIT_CASE(ttm_bo_validate_invalid_placement),
+	KUNIT_CASE_PARAM(ttm_bo_validate_same_placement,
+			 ttm_bo_validate_mem_gen_params),
+	KUNIT_CASE(ttm_bo_validate_failed_alloc),
 	KUNIT_CASE(ttm_bo_validate_pinned),
+	KUNIT_CASE(ttm_bo_validate_busy_placement),
+	KUNIT_CASE_PARAM(ttm_bo_validate_multihop, ttm_bo_types_gen_params),
 	{}
 };
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 2f590bae53f8..cb1480e44495 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -27,8 +27,36 @@ static int mock_move(struct ttm_buffer_object *bo, bool evict,
 		     struct ttm_resource *new_mem,
 		     struct ttm_place *hop)
 {
-	bo->resource = new_mem;
-	return 0;
+	struct ttm_resource *old_mem = bo->resource;
+
+	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM && !bo->ttm)) {
+		ttm_bo_move_null(bo, new_mem);
+		return 0;
+	}
+
+	if (bo->resource->mem_type == TTM_PL_VRAM &&
+	    new_mem->mem_type == TTM_PL_SYSTEM) {
+		hop->mem_type = TTM_PL_TT;
+		hop->flags = TTM_PL_FLAG_TEMPORARY;
+		hop->fpfn = 0;
+		hop->lpfn = 0;
+		return -EMULTIHOP;
+	}
+
+	if (old_mem->mem_type == TTM_PL_SYSTEM &&
+	    new_mem->mem_type == TTM_PL_TT) {
+		ttm_bo_move_null(bo, new_mem);
+		return 0;
+	}
+
+	if (old_mem->mem_type == TTM_PL_TT &&
+	    new_mem->mem_type == TTM_PL_SYSTEM) {
+		ttm_resource_free(bo, &bo->resource);
+		ttm_bo_assign_mem(bo, new_mem);
+		return 0;
+	}
+
+	return ttm_bo_move_memcpy(bo, ctx, new_mem);
 }
 
 struct ttm_device_funcs ttm_dev_funcs = {
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
new file mode 100644
index 000000000000..ad77816c13ca
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <drm/ttm/ttm_resource.h>
+#include <drm/ttm/ttm_device.h>
+#include <drm/ttm/ttm_placement.h>
+
+#include "ttm_mock_manager.h"
+
+static inline struct ttm_mock_manager *
+to_mock_mgr(struct ttm_resource_manager *man)
+{
+	return container_of(man, struct ttm_mock_manager, man);
+}
+
+static inline struct ttm_mock_resource *
+to_mock_mgr_resource(struct ttm_resource *res)
+{
+	return container_of(res, struct ttm_mock_resource, base);
+}
+
+static int ttm_mock_manager_alloc(struct ttm_resource_manager *man,
+				  struct ttm_buffer_object *bo,
+				  const struct ttm_place *place,
+				  struct ttm_resource **res)
+{
+	struct ttm_mock_manager *manager = to_mock_mgr(man);
+	struct ttm_mock_resource *mock_res;
+	struct drm_buddy *mm = &manager->mm;
+	u64 lpfn, fpfn, alloc_size;
+	int err;
+
+	mock_res = kzalloc(sizeof(*mock_res), GFP_KERNEL);
+
+	if (!mock_res)
+		return -ENOMEM;
+
+	fpfn = 0;
+	lpfn = man->size;
+
+	ttm_resource_init(bo, place, &mock_res->base);
+	INIT_LIST_HEAD(&mock_res->blocks);
+
+	if (place->flags & TTM_PL_FLAG_TOPDOWN)
+		mock_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
+		mock_res->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
+
+	alloc_size = (uint64_t)mock_res->base.size;
+	mutex_lock(&manager->lock);
+	err = drm_buddy_alloc_blocks(mm, fpfn, lpfn, alloc_size,
+				     manager->default_page_size,
+				     &mock_res->blocks,
+				     mock_res->flags);
+
+	if (err)
+		goto error_free_blocks;
+	mutex_unlock(&manager->lock);
+
+	*res = &mock_res->base;
+	return 0;
+
+error_free_blocks:
+	drm_buddy_free_list(mm, &mock_res->blocks, 0);
+	ttm_resource_fini(man, &mock_res->base);
+	mutex_unlock(&manager->lock);
+
+	return err;
+}
+
+static void ttm_mock_manager_free(struct ttm_resource_manager *man,
+				  struct ttm_resource *res)
+{
+	struct ttm_mock_manager *manager = to_mock_mgr(man);
+	struct ttm_mock_resource *mock_res = to_mock_mgr_resource(res);
+	struct drm_buddy *mm = &manager->mm;
+
+	mutex_lock(&manager->lock);
+	drm_buddy_free_list(mm, &mock_res->blocks, 0);
+	mutex_unlock(&manager->lock);
+
+	ttm_resource_fini(man, res);
+	kfree(mock_res);
+}
+
+static const struct ttm_resource_manager_func ttm_mock_manager_funcs = {
+	.alloc = ttm_mock_manager_alloc,
+	.free = ttm_mock_manager_free,
+};
+
+int ttm_mock_manager_init(struct ttm_device *bdev, u32 mem_type, u32 size)
+{
+	struct ttm_mock_manager *manager;
+	struct ttm_resource_manager *base;
+	int err;
+
+	manager = kzalloc(sizeof(*manager), GFP_KERNEL);
+	if (!manager)
+		return -ENOMEM;
+
+	mutex_init(&manager->lock);
+
+	err = drm_buddy_init(&manager->mm, size, PAGE_SIZE);
+
+	if (err) {
+		kfree(manager);
+		return err;
+	}
+
+	manager->default_page_size = PAGE_SIZE;
+	base = &manager->man;
+	base->func = &ttm_mock_manager_funcs;
+	base->use_tt = true;
+
+	ttm_resource_manager_init(base, bdev, size);
+	ttm_set_driver_manager(bdev, mem_type, base);
+	ttm_resource_manager_set_used(base, true);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ttm_mock_manager_init);
+
+void ttm_mock_manager_fini(struct ttm_device *bdev, u32 mem_type)
+{
+	struct ttm_resource_manager *man;
+	struct ttm_mock_manager *mock_man;
+	int err;
+
+	man = ttm_manager_type(bdev, mem_type);
+	mock_man = to_mock_mgr(man);
+
+	err = ttm_resource_manager_evict_all(bdev, man);
+	if (err)
+		return;
+
+	ttm_resource_manager_set_used(man, false);
+
+	mutex_lock(&mock_man->lock);
+	drm_buddy_fini(&mock_man->mm);
+	mutex_unlock(&mock_man->lock);
+
+	ttm_set_driver_manager(bdev, mem_type, NULL);
+}
+EXPORT_SYMBOL_GPL(ttm_mock_manager_fini);
+
+static int ttm_bad_manager_alloc(struct ttm_resource_manager *man,
+				 struct ttm_buffer_object *bo,
+				 const struct ttm_place *place,
+				 struct ttm_resource **res)
+{
+	return -ENOSPC;
+}
+
+static void ttm_bad_manager_free(struct ttm_resource_manager *man,
+				 struct ttm_resource *res)
+{
+}
+
+static bool ttm_bad_manager_compatible(struct ttm_resource_manager *man,
+				       struct ttm_resource *res,
+				       const struct ttm_place *place,
+				       size_t size)
+{
+	return true;
+}
+
+static const struct ttm_resource_manager_func ttm_bad_manager_funcs = {
+	.alloc = ttm_bad_manager_alloc,
+	.free = ttm_bad_manager_free,
+	.compatible = ttm_bad_manager_compatible
+};
+
+int ttm_bad_manager_init(struct ttm_device *bdev, u32 mem_type, u32 size)
+{
+	struct ttm_resource_manager *man;
+
+	man = kzalloc(sizeof(*man), GFP_KERNEL);
+	if (!man)
+		return -ENOMEM;
+
+	man->func = &ttm_bad_manager_funcs;
+
+	ttm_resource_manager_init(man, bdev, size);
+	ttm_set_driver_manager(bdev, mem_type, man);
+	ttm_resource_manager_set_used(man, true);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(ttm_bad_manager_init);
+
+void ttm_bad_manager_fini(struct ttm_device *bdev, u32 mem_type)
+{
+	struct ttm_resource_manager *man;
+
+	man = ttm_manager_type(bdev, mem_type);
+
+	ttm_resource_manager_set_used(man, false);
+	ttm_set_driver_manager(bdev, mem_type, NULL);
+
+	kfree(man);
+}
+EXPORT_SYMBOL_GPL(ttm_bad_manager_fini);
+
+MODULE_LICENSE("GPL and additional rights");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
new file mode 100644
index 000000000000..5456aaec118b
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#ifndef TTM_MOCK_MANAGER_H
+#define TTM_MOCK_MANAGER_H
+
+#include <drm/drm_buddy.h>
+
+struct ttm_mock_manager {
+	struct ttm_resource_manager man;
+	struct drm_buddy mm;
+	u64 default_page_size;
+	/* protects allocations of mock buffer objects */
+	struct mutex lock;
+};
+
+struct ttm_mock_resource {
+	struct ttm_resource base;
+	struct list_head blocks;
+	unsigned long flags;
+};
+
+int ttm_mock_manager_init(struct ttm_device *bdev, u32 mem_type, u32 size);
+int ttm_bad_manager_init(struct ttm_device *bdev, u32 mem_type, u32 size);
+void ttm_mock_manager_fini(struct ttm_device *bdev, u32 mem_type);
+void ttm_bad_manager_fini(struct ttm_device *bdev, u32 mem_type);
+
+#endif // TTM_MOCK_MANAGER_H
-- 
2.34.1

