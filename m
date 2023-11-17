Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BBD7EEDD0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 09:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C415910E72D;
	Fri, 17 Nov 2023 08:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5A10E729
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 08:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700211020; x=1731747020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f5eeTqvRoKJZleH9USP4vBUR55ushwEuk4eKrn9fE3o=;
 b=B5IdiJp/rorRht8Hod9al1WUgtjgfKvPOCN5YwwlQxOI6ntV6VThZtBv
 kOsyPyTMwXby+8Qhp8Jy3KhhnyeGCvwN5+N+hK7WBtSkrKP31KeLiKG54
 odkZevT3jcaB/C+FRmF+9X/IbKFcgLOsLc8HvEiR/GYTxSEDgo8w7s9PD
 gfX58LyIvn3liexBMG1a8DBd58wCMwpg/V/zcrCX7bwZqZt8u9Fej9NRg
 V3Um8OWKUwXyMzx3WpVSYGqlLyq/dZiRSVKPI/jVxxsHGWx5G7hWPby7n
 ahUY54uP0ZLEgFhqK8c+0pjaGRl7wUSurZHXK25yr3ER6hANz7xMV7PVG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422358678"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="422358678"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 00:50:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="13431076"
Received: from karentow-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.intel.com) ([10.213.28.161])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 00:50:18 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 7/8] drm/ttm/tests: Add tests with mock resource managers
Date: Fri, 17 Nov 2023 09:49:42 +0100
Message-Id: <8526023b323b9b3644253727e73943afe5cacdd7.1700207346.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1700207346.git.karolina.stolarek@intel.com>
References: <cover.1700207346.git.karolina.stolarek@intel.com>
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
Cc: Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add mock resource manager to test ttm_bo_validate() with non-system
placements. Update KConfig entry to enable DRM Buddy allocator, used
by the mock manager. Update move function to do more than just assign
a resource.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |   1 +
 drivers/gpu/drm/ttm/tests/Makefile            |   1 +
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 276 ++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  39 ++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   2 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 206 +++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  31 ++
 8 files changed, 555 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index cdbc56e07649..34e4c43e7ffb 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -200,6 +200,7 @@ config DRM_TTM_KUNIT_TEST
         default n
         depends on DRM && KUNIT && MMU
         select DRM_TTM
+        select DRM_BUDDY
         select DRM_EXPORT_FOR_TESTS if m
         select DRM_KUNIT_TEST_HELPERS
         default KUNIT_ALL_TESTS
diff --git a/drivers/gpu/drm/ttm/tests/.kunitconfig b/drivers/gpu/drm/ttm/tests/.kunitconfig
index 75fdce0cd98e..9228ce9b913c 100644
--- a/drivers/gpu/drm/ttm/tests/.kunitconfig
+++ b/drivers/gpu/drm/ttm/tests/.kunitconfig
@@ -2,3 +2,4 @@ CONFIG_KUNIT=y
 CONFIG_DRM=y
 CONFIG_DRM_KUNIT_TEST_HELPERS=y
 CONFIG_DRM_TTM_KUNIT_TEST=y
+CONFIG_DRM_BUDDY=y
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
index 1d50e4ba9775..5f6c24979f83 100644
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
+	uint32_t mem_type;
 	bool with_ttm;
 };
 
@@ -106,6 +109,49 @@ static void ttm_bo_init_reserved_sys_man(struct kunit *test)
 	ttm_bo_put(bo);
 }
 
+static void ttm_bo_init_reserved_mock_man(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct ttm_placement *placement;
+	enum ttm_bo_type bo_type = params->bo_type;
+	struct ttm_operation_ctx ctx = { };
+	uint32_t mem_type = TTM_PL_VRAM;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
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
 	struct ttm_test_devices *priv = test->priv;
@@ -140,6 +186,51 @@ static void ttm_bo_init_reserved_resv(struct kunit *test)
 	ttm_bo_put(bo);
 }
 
+static void ttm_bo_validate_basic(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *fst_place, *snd_place;
+	struct ttm_placement *fst_placement, *snd_placement;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	uint32_t size = ALIGN(SZ_8K, PAGE_SIZE);
+	uint32_t fst_mem = TTM_PL_SYSTEM, snd_mem = TTM_PL_VRAM;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
+
+	fst_place = ttm_place_kunit_init(test, fst_mem, 0);
+	fst_placement = ttm_placement_kunit_init(test, fst_place, 1, NULL, 0);
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
+	snd_placement = ttm_placement_kunit_init(test, snd_place, 1, NULL, 0);
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
 	struct ttm_buffer_object *bo;
@@ -166,6 +257,36 @@ static void ttm_bo_validate_invalid_placement(struct kunit *test)
 	ttm_bo_put(bo);
 }
 
+static void ttm_bo_validate_failed_alloc(struct kunit *test)
+{
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct ttm_placement *placement;
+	uint32_t mem_type = TTM_PL_VRAM;
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_operation_ctx ctx = { };
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	int err;
+
+	bo = ttm_bo_kunit_init(test, test->priv, size);
+	bo->type = bo_type;
+
+	ttm_bad_manager_init(priv->ttm_dev, mem_type, MANAGER_SIZE);
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
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
 	struct ttm_buffer_object *bo;
@@ -191,11 +312,166 @@ static void ttm_bo_validate_pinned(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, err, -EINVAL);
 }
 
+static const struct ttm_bo_validate_test_case ttm_mem_type_cases[] = {
+	{
+		.description = "System manager",
+		.mem_type = TTM_PL_SYSTEM,
+	},
+	{
+		.description = "VRAM manager",
+		.mem_type = TTM_PL_SYSTEM,
+	},
+};
+
+KUNIT_ARRAY_PARAM(ttm_bo_validate_mem, ttm_mem_type_cases,
+		  ttm_bo_validate_case_desc);
+
+static void ttm_bo_validate_same_placement(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct ttm_placement *placement;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	int err;
+
+	place = ttm_place_kunit_init(test, params->mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1, NULL, 0);
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
+	if (params->mem_type != TTM_PL_SYSTEM)
+		ttm_mock_manager_fini(priv->ttm_dev, params->mem_type);
+
+	ttm_bo_put(bo);
+}
+
+static void ttm_bo_validate_busy_placement(struct kunit *test)
+{
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *init_place, *place_bad, *place_busy;
+	struct ttm_placement *placement_init, *placement_val;
+	struct ttm_resource_manager *man;
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	uint32_t fst_mem = TTM_PL_VRAM, snd_mem = TTM_PL_VRAM + 1;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	int err;
+
+	ttm_bad_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, snd_mem, MANAGER_SIZE);
+
+	init_place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
+	placement_init = ttm_placement_kunit_init(test, init_place, 1, NULL, 0);
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
+	place_bad = ttm_place_kunit_init(test, fst_mem, 0);
+	place_busy = ttm_place_kunit_init(test, snd_mem, 0);
+	placement_val = ttm_placement_kunit_init(test, place_bad, 1, place_busy, 1);
+
+	err = ttm_bo_validate(bo, placement_val, &ctx_val);
+	dma_resv_unlock(bo->base.resv);
+
+	man = ttm_manager_type(priv->ttm_dev, place_busy->mem_type);
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
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *fst_place, *final_place;
+	struct ttm_placement *placement_init, *placement_val;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	uint32_t fst_mem = TTM_PL_VRAM,  tmp_mem = TTM_PL_TT,
+		 final_mem = TTM_PL_MULTIHOP;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, tmp_mem, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, final_mem, MANAGER_SIZE);
+
+	fst_place = ttm_place_kunit_init(test, fst_mem, 0);
+	placement_init = ttm_placement_kunit_init(test, fst_place, 1, NULL, 0);
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
+	placement_val = ttm_placement_kunit_init(test, final_place, 1, NULL, 0);
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
+	ttm_mock_manager_fini(priv->ttm_dev, final_mem);
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
index b07ea760d819..719c1d56388e 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -27,8 +27,43 @@ static int mock_move(struct ttm_buffer_object *bo, bool evict,
 		     struct ttm_resource *new_mem,
 		     struct ttm_place *hop)
 {
-	bo->resource = new_mem;
-	return 0;
+	struct ttm_resource *old_mem = bo->resource;
+	int ret;
+
+	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM && !bo->ttm)) {
+		ttm_bo_move_null(bo, new_mem);
+		return 0;
+	}
+
+	/* Dummy multihop */
+	if (bo->resource->mem_type == TTM_PL_VRAM &&
+	    new_mem->mem_type == TTM_PL_MULTIHOP) {
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
+		ret = ttm_bo_wait_ctx(bo, ctx);
+
+		if (ret)
+			return ret;
+
+		ttm_resource_free(bo, &bo->resource);
+		ttm_bo_assign_mem(bo, new_mem);
+		return 0;
+	}
+
+	return ttm_bo_move_memcpy(bo, ctx, new_mem);
 }
 
 struct ttm_device_funcs ttm_dev_funcs = {
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index 3e5fe272c54c..a8977eb606e5 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -13,6 +13,8 @@
 #include <drm/drm_kunit_helpers.h>
 #include <kunit/test.h>
 
+#define TTM_PL_MULTIHOP (TTM_PL_PRIV + 1)
+
 extern struct ttm_device_funcs ttm_dev_funcs;
 
 struct ttm_test_devices {
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
new file mode 100644
index 000000000000..e1632724b349
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
+	uint64_t lpfn, fpfn, alloc_size;
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
+	drm_buddy_free_list(mm, &mock_res->blocks);
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
+	drm_buddy_free_list(mm, &mock_res->blocks);
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
+int ttm_mock_manager_init(struct ttm_device *bdev, uint32_t mem_type, uint32_t size)
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
+void ttm_mock_manager_fini(struct ttm_device *bdev, uint32_t mem_type)
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
+int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t mem_type,
+			 uint32_t size)
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
+void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t mem_type)
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
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
new file mode 100644
index 000000000000..d2db9de9d876
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
@@ -0,0 +1,31 @@
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
+	uint64_t default_page_size;
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
+int ttm_mock_manager_init(struct ttm_device *bdev, uint32_t mem_type,
+			  uint32_t size);
+int ttm_bad_manager_init(struct ttm_device *bdev, uint32_t mem_type,
+			 uint32_t size);
+void ttm_mock_manager_fini(struct ttm_device *bdev, uint32_t mem_type);
+void ttm_bad_manager_fini(struct ttm_device *bdev, uint32_t mem_type);
+
+#endif // TTM_MOCK_MANAGER_H
-- 
2.25.1

