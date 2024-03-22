Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA557886E8A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECBF1124F1;
	Fri, 22 Mar 2024 14:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGHrmdTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB89F1124EC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117808; x=1742653808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PNpIFBrtd6PsNBX5kprWQgjqSuBSQfV/zlWJFi6ApsM=;
 b=WGHrmdTuY3N7C7KvXVveqqCVYoRBKpTBpoF/JgWG9vzQkdF1Adj+MJJr
 xcdD4yj/F2ln/oa4+12ND61wbJog2XNC+hduVjOX7yVieKDzcOQr1RSlR
 98FL6UEQ5nQ6jCw8xiXY6SitwtoZp62Y4deUjF0xfv/Yr7UClC7de6EOf
 3vHKLiQTH9MrTsf5e1SdkLdSTUByfZ1atw80r6NEKoYlf7B6Eo2MbMqvf
 pd1qnL107RDxl6S69+XdKKhOFEnIqOk9kPpNc63qAKIqfFMunpvRvpHA4
 6C+eHHInmYphuEOQf0C6DQvUe5O76b1BiRGcPz92po9q8kcmQ89odb8Ea A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6022811"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6022811"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19398529"
Received: from unknown (HELO kdrobnik-desk.toya.net.pl) ([10.245.245.72])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:05 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v10 4/9] drm/ttm/tests: Add tests with mock resource managers
Date: Fri, 22 Mar 2024 15:29:53 +0100
Message-Id: <bb45017745c8aba53e7b36aad47e66c4843771e3.1711117249.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711117249.git.karolina.stolarek@intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
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
---
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/ttm/tests/.kunitconfig        |   1 +
 drivers/gpu/drm/ttm/tests/Makefile            |   1 +
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 276 ++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  39 ++-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   2 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 207 +++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  31 ++
 8 files changed, 556 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 91776996ada4..9fb6eb785bf9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -200,6 +200,7 @@ config DRM_TTM_KUNIT_TEST
         default n
         depends on DRM && KUNIT && MMU && (UML || COMPILE_TEST)
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
index 8229bb31d747..7070b5d16c10 100644
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
 
@@ -102,6 +105,49 @@ static void ttm_bo_init_reserved_sys_man(struct kunit *test)
 	ttm_bo_put(bo);
 }
 
+static void ttm_bo_init_reserved_mock_man(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	enum ttm_bo_type bo_type = params->bo_type;
+	struct ttm_test_devices *priv = test->priv;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_placement *placement;
+	uint32_t mem_type = TTM_PL_VRAM;
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
+	uint32_t fst_mem = TTM_PL_SYSTEM, snd_mem = TTM_PL_VRAM;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	struct ttm_placement *fst_placement, *snd_placement;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_place *fst_place, *snd_place;
+	uint32_t size = ALIGN(SZ_8K, PAGE_SIZE);
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
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_placement *placement;
+	uint32_t mem_type = TTM_PL_VRAM;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	int err;
+
+	bo = ttm_bo_kunit_init(test, test->priv, size);
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
@@ -187,11 +308,166 @@ static void ttm_bo_validate_pinned(struct kunit *test)
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
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	struct ttm_test_devices *priv = test->priv;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
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
+	if (params->mem_type != TTM_PL_SYSTEM)
+		ttm_mock_manager_fini(priv->ttm_dev, params->mem_type);
+
+	ttm_bo_put(bo);
+}
+
+static void ttm_bo_validate_busy_placement(struct kunit *test)
+{
+	uint32_t fst_mem = TTM_PL_VRAM, snd_mem = TTM_PL_VRAM + 1;
+	struct ttm_operation_ctx ctx_init = { }, ctx_val = { };
+	struct ttm_placement *placement_init, *placement_val;
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
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
+	uint32_t fst_mem = TTM_PL_VRAM, tmp_mem = TTM_PL_TT,
+		 final_mem = TTM_PL_MULTIHOP;
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_place *fst_place, *final_place;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_buffer_object *bo;
+	int err;
+
+	ttm_mock_manager_init(priv->ttm_dev, fst_mem, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, tmp_mem, MANAGER_SIZE);
+	ttm_mock_manager_init(priv->ttm_dev, final_mem, MANAGER_SIZE);
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
index c75de24de783..83a942919cc8 100644
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
index 000000000000..21636b96ac38
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
@@ -0,0 +1,207 @@
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
2.34.1

