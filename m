Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C578EB33
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 12:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FED910E60F;
	Thu, 31 Aug 2023 10:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CF710E5FA
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 10:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693479520; x=1725015520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cjj20L20qaTYBfXOxoFdfT9SDvnOUsDlb3EMeypjnXg=;
 b=YvloVDMzXZpKBSeioD13hWSttlpGjLjNCzkknJ8jj3nJGfZ/muxnVF5v
 82oNOFj9qHN0EzQx08d7La6tXRPQZEZfJHZBSW+wqMaF7dOfmVXoLqQCk
 iuyMeV+V20d6mPPGjUWzF6Y6oVD/tmz8mNgQJhstCishHgnTbroY/8S3N
 /3PqX8Y8y+d/E9ublP1wpKu+21YOSTF/Uve3mM/SIkwzaNd5BEkWWn74L
 a6OgEX0oeD7MOY7KpLQ0DcZe07Vt/L69ptn2d14IXk1FQS24cmCQ46YD2
 WU2lqDZ7s+soYE4wS9KnoVAAo6iGzwOG4u2r70aPrw/Yw9F/qU31/ytCV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442263934"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="442263934"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809550350"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="809550350"
Received: from kmartek-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.15.132])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 03:58:38 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
Date: Thu, 31 Aug 2023 12:58:19 +0200
Message-Id: <9d3bd31bf434b172c13412f35abfbab71fd66238.1693479161.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1693479161.git.karolina.stolarek@intel.com>
References: <cover.1693479161.git.karolina.stolarek@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test initialization of ttm_resource using different memory domains.
Add tests for a system memory manager and functions that can be
tested without a fully-featured resource manager. Update
ttm_bo_kunit_init() to initialize BO's kref and reservation object.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/Makefile            |   1 +
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  23 ++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   4 +
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++++++++++
 4 files changed, 363 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c

diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
index ec87c4fc1ad5..ff62ff59e9d9 100644
--- a/drivers/gpu/drm/ttm/tests/Makefile
+++ b/drivers/gpu/drm/ttm/tests/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
         ttm_device_test.o \
         ttm_pool_test.o \
+        ttm_resource_test.o\
         ttm_kunit_helpers.o
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 81661d8827aa..eccc59b981f8 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -38,10 +38,33 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 	bo->base = gem_obj;
 	bo->bdev = devs->ttm_dev;
 
+	kref_init(&bo->kref);
+
+	dma_resv_init(&bo->base._resv);
+	bo->base.resv = &bo->base._resv;
+
 	return bo;
 }
 EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
 
+struct ttm_place *ttm_place_kunit_init(struct kunit *test,
+				       uint32_t mem_type, uint32_t flags,
+				       size_t size)
+{
+	struct ttm_place *place;
+
+	place = kunit_kzalloc(test, sizeof(*place), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, place);
+
+	place->mem_type = mem_type;
+	place->flags = flags;
+	place->fpfn = size >> PAGE_SHIFT;
+	place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
+
+	return place;
+}
+EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
+
 struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
 {
 	struct ttm_test_devices *devs;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index e261e3660d0b..f38140f93c05 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -8,6 +8,7 @@
 #include <drm/drm_drv.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_placement.h>
 
 #include <drm/drm_kunit_helpers.h>
 #include <kunit/test.h>
@@ -28,6 +29,9 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
 struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
 					    size_t size);
+struct ttm_place *ttm_place_kunit_init(struct kunit *test,
+				       uint32_t mem_type, uint32_t flags,
+				       size_t size);
 
 struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
 struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
new file mode 100644
index 000000000000..851cdc43dc37
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <drm/ttm/ttm_resource.h>
+
+#include "ttm_kunit_helpers.h"
+
+#define RES_SIZE		SZ_4K
+#define TTM_PRIV_DUMMY_REG	(TTM_NUM_MEM_TYPES - 1)
+
+struct ttm_resource_test_case {
+	const char *description;
+	uint32_t mem_type;
+	uint32_t flags;
+};
+
+struct ttm_resource_test_priv {
+	struct ttm_test_devices *devs;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+};
+
+static const struct ttm_resource_manager_func ttm_resource_manager_mock_funcs = { };
+
+static int ttm_resource_test_init(struct kunit *test)
+{
+	struct ttm_resource_test_priv *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	priv->devs = ttm_test_devices_all(test);
+	KUNIT_ASSERT_NOT_NULL(test, priv->devs);
+
+	test->priv = priv;
+
+	return 0;
+}
+
+static void ttm_resource_test_fini(struct kunit *test)
+{
+	struct ttm_resource_test_priv *priv = test->priv;
+
+	ttm_test_devices_put(test, priv->devs);
+}
+
+static void ttm_init_test_mocks(struct kunit *test,
+				struct ttm_resource_test_priv *priv,
+				uint32_t mem_type, uint32_t flags)
+{
+	size_t size = RES_SIZE;
+
+	/* Make sure we have what we need for a good BO mock */
+	KUNIT_ASSERT_NOT_NULL(test, priv->devs->ttm_dev);
+
+	priv->bo = ttm_bo_kunit_init(test, priv->devs, size);
+	priv->place = ttm_place_kunit_init(test, mem_type, flags, size);
+}
+
+static void ttm_init_test_manager(struct kunit *test,
+				  struct ttm_resource_test_priv *priv,
+				  uint32_t mem_type)
+{
+	struct ttm_device *ttm_dev = priv->devs->ttm_dev;
+	struct ttm_resource_manager *man;
+	size_t size = SZ_16K;
+
+	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, man);
+
+	man->use_tt = false;
+	man->func = &ttm_resource_manager_mock_funcs;
+
+	ttm_resource_manager_init(man, ttm_dev, size);
+	ttm_set_driver_manager(ttm_dev, mem_type, man);
+	ttm_resource_manager_set_used(man, true);
+}
+
+static const struct ttm_resource_test_case ttm_resource_cases[] = {
+	{
+		.description = "Init resource in TTM_PL_SYSTEM",
+		.mem_type = TTM_PL_SYSTEM,
+	},
+	{
+		.description = "Init resource in TTM_PL_VRAM",
+		.mem_type = TTM_PL_VRAM,
+	},
+	{
+		.description = "Init resource in a private placement",
+		.mem_type = TTM_PRIV_DUMMY_REG,
+	},
+	{
+		.description = "Init resource in TTM_PL_SYSTEM, set placement flags",
+		.mem_type = TTM_PL_SYSTEM,
+		.flags = TTM_PL_FLAG_TOPDOWN,
+	},
+};
+
+static void ttm_resource_case_desc(const struct ttm_resource_test_case *t, char *desc)
+{
+	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(ttm_resource, ttm_resource_cases, ttm_resource_case_desc);
+
+static void ttm_resource_init_basic(struct kunit *test)
+{
+	const struct ttm_resource_test_case *params = test->param_value;
+	struct ttm_resource_test_priv *priv = test->priv;
+	struct ttm_resource *res;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct ttm_resource_manager *man;
+	uint64_t expected_usage;
+
+	ttm_init_test_mocks(test, priv, params->mem_type, params->flags);
+	bo = priv->bo;
+	place = priv->place;
+
+	if (params->mem_type > TTM_PL_SYSTEM)
+		ttm_init_test_manager(test, priv, params->mem_type);
+
+	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, res);
+
+	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
+	expected_usage = man->usage + RES_SIZE;
+
+	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
+
+	ttm_resource_init(bo, place, res);
+
+	KUNIT_ASSERT_EQ(test, res->start, 0);
+	KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
+	KUNIT_ASSERT_EQ(test, res->mem_type, place->mem_type);
+	KUNIT_ASSERT_EQ(test, res->placement, place->flags);
+	KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
+
+	KUNIT_ASSERT_NULL(test, res->bus.addr);
+	KUNIT_ASSERT_EQ(test, res->bus.offset, 0);
+	KUNIT_ASSERT_FALSE(test, res->bus.is_iomem);
+	KUNIT_ASSERT_EQ(test, res->bus.caching, ttm_cached);
+	KUNIT_ASSERT_EQ(test, man->usage, expected_usage);
+
+	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo->priority]));
+
+	ttm_resource_fini(man, res);
+}
+
+static void ttm_resource_init_pinned(struct kunit *test)
+{
+	struct ttm_resource_test_priv *priv = test->priv;
+	struct ttm_resource *res;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct ttm_resource_manager *man;
+
+	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
+	bo = priv->bo;
+	place = priv->place;
+
+	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
+
+	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, res);
+	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
+
+	dma_resv_lock(bo->base.resv, NULL);
+	ttm_bo_pin(bo);
+	ttm_resource_init(bo, place, res);
+	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev->pinned));
+
+	ttm_bo_unpin(bo);
+	ttm_resource_fini(man, res);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
+}
+
+static void ttm_resource_fini_basic(struct kunit *test)
+{
+	struct ttm_resource_test_priv *priv = test->priv;
+	struct ttm_resource *res;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct ttm_resource_manager *man;
+
+	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, 0);
+	bo = priv->bo;
+	place = priv->place;
+
+	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
+
+	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, res);
+
+	ttm_resource_init(bo, place, res);
+	ttm_resource_fini(man, res);
+
+	KUNIT_ASSERT_TRUE(test, list_empty(&res->lru));
+	KUNIT_ASSERT_EQ(test, man->usage, 0);
+}
+
+static void ttm_resource_manager_init_basic(struct kunit *test)
+{
+	struct ttm_resource_test_priv *priv = test->priv;
+	struct ttm_resource_manager *man;
+	size_t size = SZ_16K;
+
+	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, man);
+
+	ttm_resource_manager_init(man, priv->devs->ttm_dev, size);
+
+	KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
+	KUNIT_ASSERT_EQ(test, man->size, size);
+	KUNIT_ASSERT_EQ(test, man->usage, 0);
+	KUNIT_ASSERT_NULL(test, man->move);
+	KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
+
+	for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
+		KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
+}
+
+static void ttm_resource_manager_usage_basic(struct kunit *test)
+{
+	struct ttm_resource_test_priv *priv = test->priv;
+	struct ttm_resource *res;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct ttm_resource_manager *man;
+	uint64_t actual_usage;
+
+	ttm_init_test_mocks(test, priv, TTM_PL_SYSTEM, TTM_PL_FLAG_TOPDOWN);
+	bo = priv->bo;
+	place = priv->place;
+
+	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, res);
+
+	man = ttm_manager_type(priv->devs->ttm_dev, place->mem_type);
+
+	ttm_resource_init(bo, place, res);
+	actual_usage = ttm_resource_manager_usage(man);
+
+	KUNIT_ASSERT_EQ(test, actual_usage, RES_SIZE);
+
+	ttm_resource_fini(man, res);
+}
+
+static void ttm_resource_manager_set_used_basic(struct kunit *test)
+{
+	struct ttm_resource_test_priv *priv = test->priv;
+	struct ttm_resource_manager *man;
+
+	man = ttm_manager_type(priv->devs->ttm_dev, TTM_PL_SYSTEM);
+	KUNIT_ASSERT_TRUE(test, man->use_type);
+
+	ttm_resource_manager_set_used(man, false);
+	KUNIT_ASSERT_FALSE(test, man->use_type);
+}
+
+static void ttm_sys_man_alloc_basic(struct kunit *test)
+{
+	struct ttm_resource_test_priv *priv = test->priv;
+	struct ttm_resource_manager *man;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct ttm_resource *res;
+	uint32_t mem_type = TTM_PL_SYSTEM;
+	int ret;
+
+	ttm_init_test_mocks(test, priv, mem_type, 0);
+	bo = priv->bo;
+	place = priv->place;
+
+	man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
+	ret = man->func->alloc(man, bo, place, &res);
+
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_EQ(test, res->size, RES_SIZE);
+	KUNIT_ASSERT_EQ(test, res->mem_type, mem_type);
+	KUNIT_ASSERT_PTR_EQ(test, res->bo, bo);
+
+	ttm_resource_fini(man, res);
+}
+
+static void ttm_sys_man_free_basic(struct kunit *test)
+{
+	struct ttm_resource_test_priv *priv = test->priv;
+	struct ttm_resource_manager *man;
+	struct ttm_buffer_object *bo;
+	struct ttm_place *place;
+	struct ttm_resource *res;
+	uint32_t mem_type = TTM_PL_SYSTEM;
+
+	ttm_init_test_mocks(test, priv, mem_type, 0);
+	bo = priv->bo;
+	place = priv->place;
+
+	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, res);
+
+	ttm_resource_alloc(bo, place, &res);
+
+	man = ttm_manager_type(priv->devs->ttm_dev, mem_type);
+	man->func->free(man, res);
+
+	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[bo->priority]));
+	KUNIT_ASSERT_EQ(test, man->usage, 0);
+}
+
+static struct kunit_case ttm_resource_test_cases[] = {
+	KUNIT_CASE_PARAM(ttm_resource_init_basic, ttm_resource_gen_params),
+	KUNIT_CASE(ttm_resource_init_pinned),
+	KUNIT_CASE(ttm_resource_fini_basic),
+	KUNIT_CASE(ttm_resource_manager_init_basic),
+	KUNIT_CASE(ttm_resource_manager_usage_basic),
+	KUNIT_CASE(ttm_resource_manager_set_used_basic),
+	KUNIT_CASE(ttm_sys_man_alloc_basic),
+	KUNIT_CASE(ttm_sys_man_free_basic),
+	{}
+};
+
+static struct kunit_suite ttm_resource_test_suite = {
+	.name = "ttm_resource",
+	.init = ttm_resource_test_init,
+	.exit = ttm_resource_test_fini,
+	.test_cases = ttm_resource_test_cases,
+};
+
+kunit_test_suites(&ttm_resource_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.25.1

