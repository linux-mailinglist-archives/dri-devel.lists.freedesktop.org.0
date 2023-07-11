Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 788C174EBCB
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 12:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A11910E35F;
	Tue, 11 Jul 2023 10:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568F210E35E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 10:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689071742; x=1720607742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4hC5h//5OGRofJigWCGOCTMYsp4TeemvD63Obl6CS3o=;
 b=FXoXwWC7HufP2i6OOQ/xDCbSBm3SpP5b848zcOjyGErSHld7ElGDIVwY
 Lfh/x6QCWSXbPLRQ0czs2o/1+EvLeIBZg0vUcuePAvpH4nXm88cukQXRY
 CZ/vHdNORivEIjp6nLS2U/+fKre5m++BsOtakSl7rFd8xtI/m8p5b1Qgc
 okOYO1tpsgatFl1ujqxgOV/2sZyHiLcgHc6yWgAUItH4LK8lC408x9+7H
 WMe2Ego5NZi2YrCIz4kPRaezxgTA2xR1UDjecBc29eZAofzdWWLmcTywX
 AXnSawZ6RvkiGhN4d3OVXY4GOdfuVNlSp/7D62F1ocbrJQLMBotyS/pME g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="362046516"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="362046516"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="698386302"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="698386302"
Received: from kaszymec-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.16.58])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:35:37 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v4 3/3] drm/ttm/tests: Add tests for ttm_pool
Date: Tue, 11 Jul 2023 12:34:25 +0200
Message-Id: <1572abfbe18d799b2a62881bef07824af36e2118.1689060814.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1689060814.git.karolina.stolarek@intel.com>
References: <cover.1689060814.git.karolina.stolarek@intel.com>
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
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add KUnit tests that exercise page allocation using page pools
and freeing pages, either by returning them to the pool or
freeing them. Add a basic test for ttm_pool cleanup. Introduce
helpers to create a dummy ttm_buffer_object.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/Makefile            |   1 +
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  14 +
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   2 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 441 ++++++++++++++++++
 4 files changed, 458 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_pool_test.c

diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
index 7917805f37af..ec87c4fc1ad5 100644
--- a/drivers/gpu/drm/ttm/tests/Makefile
+++ b/drivers/gpu/drm/ttm/tests/Makefile
@@ -2,4 +2,5 @@
 
 obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
         ttm_device_test.o \
+        ttm_pool_test.o \
         ttm_kunit_helpers.o
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 5f1499761f16..504ae374a62f 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -25,6 +25,20 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
 }
 EXPORT_SYMBOL_GPL(ttm_device_kunit_init);
 
+struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test, size_t size)
+{
+	struct drm_gem_object gem_obj = { .size = size };
+	struct ttm_buffer_object *bo;
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	bo->base = gem_obj;
+
+	return bo;
+}
+EXPORT_SYMBOL_GPL(ttm_bo_kunit_init);
+
 struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test)
 {
 	struct ttm_test_devices *devs;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index f9f5bc03e93a..9a4992c19bc5 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -7,6 +7,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/ttm/ttm_device.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include <drm/drm_kunit_helpers.h>
 #include <kunit/test.h>
@@ -24,6 +25,7 @@ int ttm_device_kunit_init(struct ttm_test_devices *priv,
 			  struct ttm_device *ttm,
 			  bool use_dma_alloc,
 			  bool use_dma32);
+struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test, size_t size);
 
 struct ttm_test_devices *ttm_test_devices_basic(struct kunit *test);
 struct ttm_test_devices *ttm_test_devices_all(struct kunit *test);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
new file mode 100644
index 000000000000..cb710b13d02a
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -0,0 +1,441 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <linux/mm.h>
+
+#include <drm/ttm/ttm_tt.h>
+#include <drm/ttm/ttm_pool.h>
+
+#include "ttm_kunit_helpers.h"
+
+struct ttm_pool_test_case {
+	const char *description;
+	unsigned int order;
+	bool use_dma_alloc;
+};
+
+struct ttm_pool_test_priv {
+	struct ttm_test_devices *devs;
+
+	/* Used to create mock ttm_tts */
+	struct ttm_buffer_object *mock_bo;
+};
+
+static struct ttm_operation_ctx simple_ctx = {
+	.interruptible = true,
+	.no_wait_gpu = false,
+};
+
+static int ttm_pool_test_init(struct kunit *test)
+{
+	struct ttm_pool_test_priv *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	priv->devs = ttm_test_devices_basic(test);
+	test->priv = priv;
+
+	return 0;
+}
+
+static void ttm_pool_test_fini(struct kunit *test)
+{
+	struct ttm_pool_test_priv *priv = test->priv;
+
+	if (priv->mock_bo)
+		ttm_bo_put(priv->mock_bo);
+
+	ttm_test_devices_put(test, priv->devs);
+}
+
+static struct ttm_tt *ttm_tt_kunit_init(struct kunit *test,
+					uint32_t page_flags,
+					enum ttm_caching caching,
+					size_t size)
+{
+	struct ttm_pool_test_priv *priv = test->priv;
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	int err;
+
+	bo = ttm_bo_kunit_init(test, size);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+	priv->mock_bo = bo;
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	err = ttm_tt_init(tt, priv->mock_bo, page_flags, caching, 0);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	return tt;
+}
+
+static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
+					       size_t size,
+					       enum ttm_caching caching)
+{
+	struct ttm_pool_test_priv *priv = test->priv;
+	struct ttm_test_devices *devs = priv->devs;
+	struct ttm_pool *pool;
+	struct ttm_tt *tt;
+	unsigned long order = __fls(size / PAGE_SIZE);
+	int err;
+
+	tt = ttm_tt_kunit_init(test, order, caching, size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
+
+	err = ttm_pool_alloc(pool, tt, &simple_ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	ttm_pool_free(pool, tt);
+	ttm_tt_fini(tt);
+	ttm_bo_put(priv->mock_bo);
+
+	return pool;
+}
+
+static const struct ttm_pool_test_case ttm_pool_basic_cases[] = {
+	{
+		.description = "One page",
+		.order = 0,
+	},
+	{
+		.description = "More than one page",
+		.order = 2,
+	},
+	{
+		.description = "Above the allocation limit",
+		.order = MAX_ORDER + 1,
+	},
+	{
+		.description = "One page, with coherent DMA mappings enabled",
+		.order = 0,
+		.use_dma_alloc = true,
+	},
+	{
+		.description = "Above the allocation limit, with coherent DMA mappings enabled",
+		.order = MAX_ORDER + 1,
+		.use_dma_alloc = true,
+	},
+};
+
+static void ttm_pool_alloc_case_desc(const struct ttm_pool_test_case *t,
+				     char *desc)
+{
+	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(ttm_pool_alloc_basic, ttm_pool_basic_cases,
+		  ttm_pool_alloc_case_desc);
+
+static void ttm_pool_alloc_basic(struct kunit *test)
+{
+	struct ttm_pool_test_priv *priv = test->priv;
+	struct ttm_test_devices *devs = priv->devs;
+	const struct ttm_pool_test_case *params = test->param_value;
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct page *fst_page, *last_page;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int expected_num_pages = 1 << params->order;
+	size_t size = expected_num_pages * PAGE_SIZE;
+	int err;
+
+	tt = ttm_tt_kunit_init(test, 0, caching, size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, params->use_dma_alloc,
+		      false);
+
+	KUNIT_ASSERT_PTR_EQ(test, pool->dev, devs->dev);
+	KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
+	KUNIT_ASSERT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
+
+	err = ttm_pool_alloc(pool, tt, &simple_ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
+
+	fst_page = tt->pages[0];
+	last_page = tt->pages[tt->num_pages - 1];
+
+	if (params->order <= MAX_ORDER) {
+		if (params->use_dma_alloc) {
+			KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
+			KUNIT_ASSERT_NOT_NULL(test, (void *)last_page->private);
+		} else {
+			KUNIT_ASSERT_EQ(test, fst_page->private, params->order);
+		}
+	} else {
+		if (params->use_dma_alloc) {
+			KUNIT_ASSERT_NOT_NULL(test, (void *)fst_page->private);
+			KUNIT_ASSERT_NULL(test, (void *)last_page->private);
+		} else {
+			/*
+			 * We expect to alloc one big block, followed by
+			 * order 0 blocks
+			 */
+			KUNIT_ASSERT_EQ(test, fst_page->private,
+					min_t(unsigned int, MAX_ORDER,
+					      params->order));
+			KUNIT_ASSERT_EQ(test, last_page->private, 0);
+		}
+	}
+
+	ttm_pool_free(pool, tt);
+	ttm_tt_fini(tt);
+	ttm_pool_fini(pool);
+}
+
+static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
+{
+	struct ttm_pool_test_priv *priv = test->priv;
+	struct ttm_test_devices *devs = priv->devs;
+	const struct ttm_pool_test_case *params = test->param_value;
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct ttm_buffer_object *bo;
+	dma_addr_t dma1, dma2;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int expected_num_pages = 1 << params->order;
+	size_t size = expected_num_pages * PAGE_SIZE;
+	int err;
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	bo = ttm_bo_kunit_init(test, size);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	err = ttm_sg_tt_init(tt, bo, 0, caching);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
+
+	err = ttm_pool_alloc(pool, tt, &simple_ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	KUNIT_ASSERT_EQ(test, tt->num_pages, expected_num_pages);
+
+	dma1 = tt->dma_address[0];
+	dma2 = tt->dma_address[tt->num_pages - 1];
+
+	KUNIT_ASSERT_NOT_NULL(test, (void *)dma1);
+	KUNIT_ASSERT_NOT_NULL(test, (void *)dma2);
+
+	ttm_pool_free(pool, tt);
+	ttm_tt_fini(tt);
+	ttm_pool_fini(pool);
+}
+
+static void ttm_pool_alloc_order_caching_match(struct kunit *test)
+{
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct ttm_pool_type *pt;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int order = 0;
+	size_t size = PAGE_SIZE;
+	int err;
+
+	pool = ttm_pool_pre_populated(test, size, caching);
+
+	pt = &pool->caching[caching].orders[order];
+	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
+
+	tt = ttm_tt_kunit_init(test, 0, caching, size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	err = ttm_pool_alloc(pool, tt, &simple_ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
+
+	ttm_pool_free(pool, tt);
+	ttm_tt_fini(tt);
+	ttm_pool_fini(pool);
+}
+
+static void ttm_pool_alloc_caching_mismatch(struct kunit *test)
+{
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct ttm_pool_type *pt_pool, *pt_tt;
+	enum ttm_caching tt_caching = ttm_uncached;
+	enum ttm_caching pool_caching = ttm_cached;
+	size_t size = PAGE_SIZE;
+	unsigned int order = 0;
+	int err;
+
+	pool = ttm_pool_pre_populated(test, size, pool_caching);
+
+	pt_pool = &pool->caching[pool_caching].orders[order];
+	pt_tt = &pool->caching[tt_caching].orders[order];
+
+	tt = ttm_tt_kunit_init(test, 0, tt_caching, size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
+	KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
+
+	err = ttm_pool_alloc(pool, tt, &simple_ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	ttm_pool_free(pool, tt);
+	ttm_tt_fini(tt);
+
+	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
+	KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
+
+	ttm_pool_fini(pool);
+}
+
+static void ttm_pool_alloc_order_mismatch(struct kunit *test)
+{
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct ttm_pool_type *pt_pool, *pt_tt;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int order = 2;
+	size_t fst_size = (1 << order) * PAGE_SIZE;
+	size_t snd_size = PAGE_SIZE;
+	int err;
+
+	pool = ttm_pool_pre_populated(test, fst_size, caching);
+
+	pt_pool = &pool->caching[caching].orders[order];
+	pt_tt = &pool->caching[caching].orders[0];
+
+	tt = ttm_tt_kunit_init(test, 0, caching, snd_size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
+	KUNIT_ASSERT_TRUE(test, list_empty(&pt_tt->pages));
+
+	err = ttm_pool_alloc(pool, tt, &simple_ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	ttm_pool_free(pool, tt);
+	ttm_tt_fini(tt);
+
+	KUNIT_ASSERT_FALSE(test, list_empty(&pt_pool->pages));
+	KUNIT_ASSERT_FALSE(test, list_empty(&pt_tt->pages));
+
+	ttm_pool_fini(pool);
+}
+
+static void ttm_pool_free_dma_alloc(struct kunit *test)
+{
+	struct ttm_pool_test_priv *priv = test->priv;
+	struct ttm_test_devices *devs = priv->devs;
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct ttm_pool_type *pt;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int order = 2;
+	size_t size = (1 << order) * PAGE_SIZE;
+
+	tt = ttm_tt_kunit_init(test, 0, caching, size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
+	ttm_pool_alloc(pool, tt, &simple_ctx);
+
+	pt = &pool->caching[caching].orders[order];
+	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
+
+	ttm_pool_free(pool, tt);
+	ttm_tt_fini(tt);
+
+	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
+
+	ttm_pool_fini(pool);
+}
+
+static void ttm_pool_free_no_dma_alloc(struct kunit *test)
+{
+	struct ttm_pool_test_priv *priv = test->priv;
+	struct ttm_test_devices *devs = priv->devs;
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct ttm_pool_type *pt;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int order = 2;
+	size_t size = (1 << order) * PAGE_SIZE;
+
+	tt = ttm_tt_kunit_init(test, 0, caching, size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false);
+	ttm_pool_alloc(pool, tt, &simple_ctx);
+
+	pt = &pool->caching[caching].orders[order];
+	KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
+
+	ttm_pool_free(pool, tt);
+	ttm_tt_fini(tt);
+
+	KUNIT_ASSERT_TRUE(test, list_is_singular(&pt->pages));
+
+	ttm_pool_fini(pool);
+}
+
+static void ttm_pool_fini_basic(struct kunit *test)
+{
+	struct ttm_pool *pool;
+	struct ttm_pool_type *pt;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int order = 0;
+	size_t size = PAGE_SIZE;
+
+	pool = ttm_pool_pre_populated(test, size, caching);
+	pt = &pool->caching[caching].orders[order];
+
+	KUNIT_ASSERT_FALSE(test, list_empty(&pt->pages));
+
+	ttm_pool_fini(pool);
+
+	KUNIT_ASSERT_TRUE(test, list_empty(&pt->pages));
+}
+
+static struct kunit_case ttm_pool_test_cases[] = {
+	KUNIT_CASE_PARAM(ttm_pool_alloc_basic, ttm_pool_alloc_basic_gen_params),
+	KUNIT_CASE_PARAM(ttm_pool_alloc_basic_dma_addr,
+			 ttm_pool_alloc_basic_gen_params),
+	KUNIT_CASE(ttm_pool_alloc_order_caching_match),
+	KUNIT_CASE(ttm_pool_alloc_caching_mismatch),
+	KUNIT_CASE(ttm_pool_alloc_order_mismatch),
+	KUNIT_CASE(ttm_pool_free_dma_alloc),
+	KUNIT_CASE(ttm_pool_free_no_dma_alloc),
+	KUNIT_CASE(ttm_pool_fini_basic),
+	{}
+};
+
+static struct kunit_suite ttm_pool_test_suite = {
+	.name = "ttm_pool",
+	.init = ttm_pool_test_init,
+	.exit = ttm_pool_test_fini,
+	.test_cases = ttm_pool_test_cases,
+};
+
+kunit_test_suites(&ttm_pool_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.25.1

