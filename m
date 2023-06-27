Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE14873F751
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC21B10E2B3;
	Tue, 27 Jun 2023 08:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC2E10E2B5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687854757; x=1719390757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rj7RUnM4aTAZ73LSK1l2usCG6e5gNBAdrUu+4TSapP4=;
 b=niyw6f2NDJPGMSdaj7xwW1FsXHiik0CLRDFcZFLrWwUaTa5JzMA50vGn
 YLBT9KR39qDogccozaCWiNlFrTPYNKPFpXP20EbRJGn8gL01o1Rq7SlMj
 nTbfCjvrLkNusbt6RIPCm49lQI/40A8tMKDfD3JpXGByGy7LqJasH7dh9
 gPvqJxq9TzR2WH4DKEzyFOR2w3yD/CNifIeKFHAKrt7BtHWTstF9gH+64
 +/XXYJRmbkWzAMo9Oev59ZBt4RnycS9exue/8QNBRRhZl3Yc83pFipPd/
 WLoVDjUwFxETwARRpt152/IGcQsFO9hrgEZ989O2CJHgkgiwGBi3+t2f0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364965699"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="364965699"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 01:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890600932"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="890600932"
Received: from aludkiew-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.28.47])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 01:32:33 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v2 3/3] drm/ttm/tests: Add tests for ttm_pool
Date: Tue, 27 Jun 2023 10:32:10 +0200
Message-Id: <c7c9cdc9f14a3f14efb6cede88a1007c550ffd68.1687779215.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687779215.git.karolina.stolarek@intel.com>
References: <cover.1687779215.git.karolina.stolarek@intel.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>, Shuah Khan <shuah@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add KUnit tests that exercise page allocation using page pools
and freeing pages, either by returning them to the pool or
freeing them. Add a basic test for ttm_pool cleanup. Introduce
helpers to create a dummy ttm_buffer_object.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/Makefile            |   1 +
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  29 ++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   5 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 406 ++++++++++++++++++
 4 files changed, 441 insertions(+)
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
index d03db0405484..6ccd3e858397 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -26,6 +26,35 @@ int ttm_kunit_helper_alloc_device(struct kunit *test,
 }
 EXPORT_SYMBOL_GPL(ttm_kunit_helper_alloc_device);
 
+struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit *test,
+						       size_t size)
+{
+	struct ttm_test_devices_priv *priv = test->priv;
+	struct drm_gem_object *gem_obj;
+	struct ttm_buffer_object *bo;
+
+	gem_obj = kunit_kzalloc(test, sizeof(*gem_obj), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, gem_obj);
+
+	drm_gem_private_object_init(priv->drm, gem_obj, size);
+
+	bo = kunit_kzalloc(test, sizeof(*bo), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	bo->sg = NULL;
+	bo->base = *gem_obj;
+
+	return bo;
+}
+EXPORT_SYMBOL_GPL(ttm_kunit_helper_ttm_bo_init);
+
+void ttm_kunit_helper_ttm_bo_fini(struct ttm_buffer_object *bo)
+{
+	drm_gem_object_release(&bo->base);
+	ttm_bo_put(bo);
+}
+EXPORT_SYMBOL_GPL(ttm_kunit_helper_ttm_bo_fini);
+
 int ttm_test_devices_init(struct kunit *test)
 {
 	struct ttm_test_devices_priv *priv;
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
index 69fb03b9c4d2..abb8279f18c7 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h
@@ -7,6 +7,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/ttm/ttm_device.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include <drm/drm_kunit_helpers.h>
 #include <kunit/test.h>
@@ -23,6 +24,10 @@ int ttm_kunit_helper_alloc_device(struct kunit *test,
 				  bool use_dma_alloc,
 				  bool use_dma32);
 
+struct ttm_buffer_object *ttm_kunit_helper_ttm_bo_init(struct kunit *test,
+						       size_t size);
+void ttm_kunit_helper_ttm_bo_fini(struct ttm_buffer_object *bo);
+
 int ttm_test_devices_init(struct kunit *test);
 void ttm_test_devices_fini(struct kunit *test);
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
new file mode 100644
index 000000000000..0bc6415c3067
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -0,0 +1,406 @@
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
+static struct ttm_operation_ctx simple_ctx = {
+	.interruptible = true,
+	.no_wait_gpu = false,
+};
+
+static struct ttm_tt *mock_ttm_tt_init(struct kunit *test,
+				       uint32_t page_flags,
+				       enum ttm_caching caching,
+				       size_t size)
+{
+	struct ttm_tt *tt;
+	struct ttm_buffer_object *bo;
+	int err;
+
+	bo = ttm_kunit_helper_ttm_bo_init(test, size);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	err = ttm_tt_init(tt, bo, page_flags, caching, 0);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	/* We don't need this BO later, release it */
+	ttm_kunit_helper_ttm_bo_fini(bo);
+
+	return tt;
+}
+
+static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
+					       size_t size,
+					       enum ttm_caching caching)
+{
+	struct ttm_test_devices_priv *priv = test->priv;
+	struct ttm_pool *pool;
+	struct ttm_tt *tt;
+	int err;
+	unsigned long order = __fls(size / PAGE_SIZE);
+
+	tt = mock_ttm_tt_init(test, order, caching, size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+
+	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
+
+	err = ttm_pool_alloc(pool, tt, &simple_ctx);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	ttm_pool_free(pool, tt);
+	ttm_tt_fini(tt);
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
+	struct ttm_test_devices_priv *priv = test->priv;
+	const struct ttm_pool_test_case *params = test->param_value;
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct page *fst_page, *last_page;
+	int err;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int expected_num_pages = 1 << params->order;
+	size_t size = expected_num_pages * PAGE_SIZE;
+
+	tt = mock_ttm_tt_init(test, 0, caching, size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+
+	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, params->use_dma_alloc,
+		      false);
+
+	KUNIT_ASSERT_PTR_EQ(test, pool->dev, priv->dev);
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
+	struct ttm_test_devices_priv *priv = test->priv;
+	const struct ttm_pool_test_case *params = test->param_value;
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct ttm_buffer_object *bo;
+	dma_addr_t dma1, dma2;
+	int err;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int expected_num_pages = 1 << params->order;
+	size_t size = expected_num_pages * PAGE_SIZE;
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	bo = ttm_kunit_helper_ttm_bo_init(test, size);
+	KUNIT_ASSERT_NOT_NULL(test, bo);
+
+	err = ttm_sg_tt_init(tt, bo, 0, caching);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+
+	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
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
+	tt = mock_ttm_tt_init(test, 0, caching, size);
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
+	int err;
+	enum ttm_caching tt_caching = ttm_uncached;
+	enum ttm_caching pool_caching = ttm_cached;
+	size_t size = PAGE_SIZE;
+	unsigned int order = 0;
+
+	pool = ttm_pool_pre_populated(test, size, pool_caching);
+
+	pt_pool = &pool->caching[pool_caching].orders[order];
+	pt_tt = &pool->caching[tt_caching].orders[order];
+
+	tt = mock_ttm_tt_init(test, 0, tt_caching, size);
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
+	int err;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int order = 2;
+	size_t fst_size = (1 << order) * PAGE_SIZE;
+	size_t snd_size = PAGE_SIZE;
+
+	pool = ttm_pool_pre_populated(test, fst_size, caching);
+
+	pt_pool = &pool->caching[caching].orders[order];
+	pt_tt = &pool->caching[caching].orders[0];
+
+	tt = mock_ttm_tt_init(test, 0, caching, snd_size);
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
+	struct ttm_test_devices_priv *priv = test->priv;
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct ttm_pool_type *pt;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int order = 2;
+	size_t size = (1 << order) * PAGE_SIZE;
+
+	tt = mock_ttm_tt_init(test, 0, caching, size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+
+	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, true, false);
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
+	struct ttm_test_devices_priv *priv = test->priv;
+	struct ttm_tt *tt;
+	struct ttm_pool *pool;
+	struct ttm_pool_type *pt;
+	enum ttm_caching caching = ttm_uncached;
+	unsigned int order = 2;
+	size_t size = (1 << order) * PAGE_SIZE;
+
+	tt = mock_ttm_tt_init(test, 0, caching, size);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+
+	ttm_pool_init(pool, priv->dev, NUMA_NO_NODE, false, false);
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
+	.init = ttm_test_devices_init,
+	.exit = ttm_test_devices_fini,
+	.test_cases = ttm_pool_test_cases,
+};
+
+kunit_test_suites(&ttm_pool_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.25.1

