Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 157407FD631
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8541B10E1C1;
	Wed, 29 Nov 2023 12:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9567F10E1C1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701259372; x=1732795372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ARPwtBmIqpsjhMcYek6vqzfjlSCGhwF5GMBaW4XDLd4=;
 b=iq1ck79sbncdyCl4ILNCrisSVhPYMyO06VFxiJljUhp8Wi+fdX9OQFLH
 NQa44UZtb2oeGcJHTPnndi/t49Srh9R5WQGr7H4JyQbavV5Lzx5rQSxyy
 eRRROnp/JHG/bw8PxyJI5qHcDv4j5OLo7Mj/RdsJri2L7O2Rkqa4XgSqH
 Sw3VrNLY+7340Jc8FMq+myMsW67dtSnNh3etCK0Ydbp5WzWo4legHEfD1
 X1ROPZ+nJVHTyrqA9UGOwXlPqbdN4UdRVgp3ABZEHx8r422iNryV87agu
 1+hy6VXcARjvniiM4wPyLmgxAdzzuwFO30VjkvtjUDAZv9CMgjmswrRzT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="479350819"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="479350819"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="772662476"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="772662476"
Received: from jszeliga-mobl.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.0.25])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 04:02:50 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 1/8] drm/ttm/tests: Add tests for ttm_resource and
 ttm_sys_man
Date: Wed, 29 Nov 2023 13:02:27 +0100
Message-Id: <68b8b293b6bf5f1170d49a1a089ccce9172e2855.1701257386.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701257386.git.karolina.stolarek@intel.com>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test initialization of ttm_resource using different memory domains.
Add tests for a system memory manager and functions that can be
tested without a fully-featured resource manager. Update
ttm_bo_kunit_init() to initialize BO's kref and a genuine GEM drm
object. Export ttm_resource_alloc for test purposes only.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/tests/Makefile            |   1 +
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  22 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   3 +
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
 5 files changed, 363 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c

diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
index ec87c4fc1ad5..c92fe2052ef6 100644
--- a/drivers/gpu/drm/ttm/tests/Makefile
+++ b/drivers/gpu/drm/ttm/tests/Makefile
@@ -3,4 +3,5 @@
 obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
         ttm_device_test.o \
         ttm_pool_test.o \
+        ttm_resource_test.o \
         ttm_kunit_helpers.o
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 81661d8827aa..779fbc038f17 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -29,19 +29,39 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
 					    size_t size)
 {
-	struct drm_gem_object gem_obj = { .size = size };
+	struct drm_gem_object gem_obj = { };
 	struct ttm_buffer_object *bo;
+	int err;
 
 	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, bo);
 
 	bo->base = gem_obj;
+	err = drm_gem_object_init(devs->drm, &bo->base, size);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
 	bo->bdev = devs->ttm_dev;
+	kref_init(&bo->kref);
 
 	return bo;
 }
 EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
 
+struct ttm_place *ttm_place_kunit_init(struct kunit *test,
+				       uint32_t mem_type, uint32_t flags)
+{
+	struct ttm_place *place;
+
+	place = kunit_kzalloc(test, sizeof(*place), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, place);
+
+	place->mem_type = mem_type;
+	place->flags = flags;
+
+	return place;
+}
+EXPORT_SYMBOL_GPL(ttm_place_kunit_init);
+
 struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
 {
 	struct ttm_test_devices *devs;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index e261e3660d0b..2f51c833a536 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -8,6 +8,7 @@
 #include <drm/drm_drv.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_bo.h>
+#include <drm/ttm/ttm_placement.h>
 
 #include <drm/drm_kunit_helpers.h>
 #include <kunit/test.h>
@@ -28,6 +29,8 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
 struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 					    struct ttm_test_devices *devs,
 					    size_t size);
+struct ttm_place *ttm_place_kunit_init(struct kunit *test,
+				       uint32_t mem_type, uint32_t flags);
 
 struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
 struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
new file mode 100644
index 000000000000..029e1f094bb0
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
+	priv->place = ttm_place_kunit_init(test, mem_type, flags);
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
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 46ff9c75bb12..02b96d23fdb9 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -30,6 +30,8 @@
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_resource.h>
 
+#include <drm/drm_util.h>
+
 /**
  * ttm_lru_bulk_move_init - initialize a bulk move structure
  * @bulk: the structure to init
@@ -240,6 +242,7 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 	spin_unlock(&bo->bdev->lru_lock);
 	return 0;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_resource_alloc);
 
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 {
-- 
2.34.1

