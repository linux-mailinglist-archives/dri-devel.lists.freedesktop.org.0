Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA2A886E87
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 15:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D081124EE;
	Fri, 22 Mar 2024 14:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxVX2xgP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944EC1124EA
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711117806; x=1742653806;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PxnsHae1xn0KQb0qrEzXPQNRuR2bdcbboQn1Yyj9bLM=;
 b=jxVX2xgPyntOzFX9HauK/XEfDXzAA5Cqp2CeY26/F/cs4lc641NBUAdm
 1hs2JIcu8t8WOZq/Nx512/Oqca1nxoTxIlwsxPbuK81P9fdX3JJaAM5oW
 dIT/u+dZ0OHVqZuEBSHjikofR/WL8mFKCSsOBMdOgzxMApxXa7vxOBAD2
 Cu7A5mcPoelBTL9bfxFS9iUJeAZq0R7HvgffHAeC5JIxZnJig6pNASimu
 giBTISDUzZHZvhEFOHAeFDwg9YxtV9pkUC72hR743ncM1FIdAbXEKqFgu
 c8NHfD7slfOz6sWDOyFE9+Id0SVUJbjic9FX6hthCvcWuA4cLMm7RnSks Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6022807"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6022807"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19398525"
Received: from unknown (HELO kdrobnik-desk.toya.net.pl) ([10.245.245.72])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 07:30:03 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH v10 3/9] drm/ttm/tests: Test simple BO creation and validation
Date: Fri, 22 Mar 2024 15:29:52 +0100
Message-Id: <7c1f626ac0423ee43e0e7602a063e7f9a4e163b9.1711117249.git.karolina.stolarek@intel.com>
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

Add tests for ttm_bo_init_reserved() and ttm_bo_validate() that use
sys manager. Define a simple move function in ttm_device_funcs. Expose
destroy callback of the buffer object to make testing of
ttm_bo_init_reserved() behaviour easier.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/Makefile            |   1 +
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 207 ++++++++++++++++++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  14 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   1 +
 4 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c

diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
index 468535f7eed2..2e5ed63fb414 100644
--- a/drivers/gpu/drm/ttm/tests/Makefile
+++ b/drivers/gpu/drm/ttm/tests/Makefile
@@ -6,4 +6,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
         ttm_resource_test.o \
         ttm_tt_test.o \
         ttm_bo_test.o \
+        ttm_bo_validate_test.o \
         ttm_kunit_helpers.o
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
new file mode 100644
index 000000000000..8229bb31d747
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -0,0 +1,207 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/ttm/ttm_resource.h>
+#include <drm/ttm/ttm_placement.h>
+#include <drm/ttm/ttm_tt.h>
+
+#include "ttm_kunit_helpers.h"
+
+#define BO_SIZE		SZ_4K
+
+struct ttm_bo_validate_test_case {
+	const char *description;
+	enum ttm_bo_type bo_type;
+	bool with_ttm;
+};
+
+static struct ttm_placement *ttm_placement_kunit_init(struct kunit *test,
+						      struct ttm_place *places,
+						      unsigned int num_places)
+{
+	struct ttm_placement *placement;
+
+	placement = kunit_kzalloc(test, sizeof(*placement), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, placement);
+
+	placement->num_placement = num_places;
+	placement->placement = places;
+
+	return placement;
+}
+
+static void ttm_bo_validate_case_desc(const struct ttm_bo_validate_test_case *t,
+				      char *desc)
+{
+	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
+}
+
+static const struct ttm_bo_validate_test_case ttm_bo_type_cases[] = {
+	{
+		.description = "Buffer object for userspace",
+		.bo_type = ttm_bo_type_device,
+	},
+	{
+		.description = "Kernel buffer object",
+		.bo_type = ttm_bo_type_kernel,
+	},
+	{
+		.description = "Shared buffer object",
+		.bo_type = ttm_bo_type_sg,
+	},
+};
+
+KUNIT_ARRAY_PARAM(ttm_bo_types, ttm_bo_type_cases,
+		  ttm_bo_validate_case_desc);
+
+static void ttm_bo_init_reserved_sys_man(struct kunit *test)
+{
+	const struct ttm_bo_validate_test_case *params = test->param_value;
+	struct ttm_test_devices *priv = test->priv;
+	enum ttm_bo_type bo_type = params->bo_type;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_placement *placement;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	int err;
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
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
+	KUNIT_EXPECT_EQ(test, bo->page_alignment, PAGE_SIZE);
+	KUNIT_EXPECT_PTR_EQ(test, bo->destroy, &dummy_ttm_bo_destroy);
+	KUNIT_EXPECT_EQ(test, bo->pin_count, 0);
+	KUNIT_EXPECT_NULL(test, bo->bulk_move);
+	KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
+	KUNIT_EXPECT_FALSE(test, ttm_tt_is_populated(bo->ttm));
+	KUNIT_EXPECT_NOT_NULL(test, (void *)bo->base.resv->fences);
+	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
+
+	if (bo_type != ttm_bo_type_kernel)
+		KUNIT_EXPECT_TRUE(test,
+				  drm_mm_node_allocated(&bo->base.vma_node.vm_node));
+
+	ttm_resource_free(bo, &bo->resource);
+	ttm_bo_put(bo);
+}
+
+static void ttm_bo_init_reserved_resv(struct kunit *test)
+{
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	struct ttm_test_devices *priv = test->priv;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_placement *placement;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct dma_resv resv;
+	int err;
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	place = ttm_place_kunit_init(test, TTM_PL_SYSTEM, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	drm_gem_private_object_init(priv->drm, &bo->base, size);
+	dma_resv_init(&resv);
+	dma_resv_lock(&resv, NULL);
+
+	err = ttm_bo_init_reserved(priv->ttm_dev, bo, bo_type, placement,
+				   PAGE_SIZE, &ctx, NULL, &resv,
+				   &dummy_ttm_bo_destroy);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_PTR_EQ(test, bo->base.resv, &resv);
+
+	ttm_resource_free(bo, &bo->resource);
+	ttm_bo_put(bo);
+}
+
+static void ttm_bo_validate_invalid_placement(struct kunit *test)
+{
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	uint32_t unknown_mem_type = TTM_PL_PRIV + 1;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	struct ttm_placement *placement;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	int err;
+
+	place = ttm_place_kunit_init(test, unknown_mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	bo = ttm_bo_kunit_init(test, test->priv, size);
+	bo->type = bo_type;
+
+	ttm_bo_reserve(bo, false, false, NULL);
+	err = ttm_bo_validate(bo, placement, &ctx);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
+
+	ttm_bo_put(bo);
+}
+
+static void ttm_bo_validate_pinned(struct kunit *test)
+{
+	enum ttm_bo_type bo_type = ttm_bo_type_device;
+	uint32_t size = ALIGN(BO_SIZE, PAGE_SIZE);
+	struct ttm_operation_ctx ctx = { };
+	uint32_t mem_type = TTM_PL_SYSTEM;
+	struct ttm_placement *placement;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	int err;
+
+	place = ttm_place_kunit_init(test, mem_type, 0);
+	placement = ttm_placement_kunit_init(test, place, 1);
+
+	bo = ttm_bo_kunit_init(test, test->priv, size);
+	bo->type = bo_type;
+
+	ttm_bo_reserve(bo, false, false, NULL);
+	ttm_bo_pin(bo);
+	err = ttm_bo_validate(bo, placement, &ctx);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, -EINVAL);
+}
+
+static struct kunit_case ttm_bo_validate_test_cases[] = {
+	KUNIT_CASE_PARAM(ttm_bo_init_reserved_sys_man, ttm_bo_types_gen_params),
+	KUNIT_CASE(ttm_bo_init_reserved_resv),
+	KUNIT_CASE(ttm_bo_validate_invalid_placement),
+	KUNIT_CASE(ttm_bo_validate_pinned),
+	{}
+};
+
+static struct kunit_suite ttm_bo_validate_test_suite = {
+	.name = "ttm_bo_validate",
+	.init = ttm_test_devices_all_init,
+	.exit = ttm_test_devices_fini,
+	.test_cases = ttm_bo_validate_test_cases,
+};
+
+kunit_test_suites(&ttm_bo_validate_test_suite);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 2fe0c66f31a9..c75de24de783 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -22,13 +22,19 @@ static void ttm_tt_simple_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 	kfree(ttm);
 }
 
-static void dummy_ttm_bo_destroy(struct ttm_buffer_object *bo)
+static int mock_move(struct ttm_buffer_object *bo, bool evict,
+		     struct ttm_operation_ctx *ctx,
+		     struct ttm_resource *new_mem,
+		     struct ttm_place *hop)
 {
+	bo->resource = new_mem;
+	return 0;
 }
 
 struct ttm_device_funcs ttm_dev_funcs = {
 	.ttm_tt_create = ttm_tt_simple_create,
 	.ttm_tt_destroy = ttm_tt_simple_destroy,
+	.move = mock_move,
 };
 EXPORT_SYMBOL_GPL(ttm_dev_funcs);
 
@@ -88,6 +94,12 @@ struct ttm_place *ttm_place_kunit_init(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
 
+void dummy_ttm_bo_destroy(struct ttm_buffer_object *bo)
+{
+	drm_gem_object_release(&bo->base);
+}
+EXPORT_SYMBOL_GPL(dummy_ttm_bo_destroy);
+
 struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
 {
 	struct ttm_test_devices *devs;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index 53bb5834939f..3e5fe272c54c 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -31,6 +31,7 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    size_t size);
 struct ttm_place *ttm_place_kunit_init(struct kunit *test,
 				       uint32_t mem_type, uint32_t flags);
+void dummy_ttm_bo_destroy(struct ttm_buffer_object *bo);
 
 struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
 struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
-- 
2.34.1

