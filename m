Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C772C105
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 12:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A5E10E202;
	Mon, 12 Jun 2023 10:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9C910E202
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686567354; x=1718103354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vPX25U+bOk7yXavnZ3qphjnWbFs4s6FTkfkcZ8n2oww=;
 b=awNVAyzGwJLz/yyK769nu3YNAmB71PukFkzCIIX+3SYjJU9E0KHM1NER
 deACseu/jI56FYVufN3eTLv3E7R4CYiFUoCT5CGzcZiYDJ6mVsJQDiqE+
 aqto5dP6+HYnadLRYJrYKtqZz9qfvLDaRVx4AyDJJl+qOGN1GgIVDDwmU
 8LLyrhvTLoCwumZy4q8YHpjeEuMlB//QFiKHfC77bmRN88Gx+tHxge9kT
 FUYNL9aI9ESJFbJBkifiANPl81pCtHFBAm2DkIZi26TUtOiiAiKuWlRl1
 sRrgmOTq9cNChzHdtgvt+KP7qe3nEujoAELfhl1BoUqZ8CJQ0rkruLev4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="360490077"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="360490077"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 03:55:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="1041283245"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; d="scan'208";a="1041283245"
Received: from gdampc-mobl.ger.corp.intel.com (HELO kdrobnik-desk.toya.net.pl)
 ([10.213.11.114])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 03:55:52 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/3] drm/ttm/tests: Add tests for ttm_pool
Date: Mon, 12 Jun 2023 12:55:27 +0200
Message-Id: <042feb7cc902f7fd78daf131a691d4afc14d3d8c.1686563485.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1686563485.git.karolina.stolarek@intel.com>
References: <cover.1686563485.git.karolina.stolarek@intel.com>
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
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  27 ++
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   5 +
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 401 ++++++++++++++++++
 4 files changed, 434 insertions(+)
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
index d848c2372db9..f1b5df61e0bf 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -24,6 +24,33 @@ int ttm_kunit_helper_alloc_device(struct kunit *test,
 	return err;
 }
 
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
+
+void ttm_kunit_helper_ttm_bo_fini(struct ttm_buffer_object *bo)
+{
+	drm_gem_object_release(&bo->base);
+	ttm_bo_put(bo);
+}
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
index 000000000000..c95d3df023f3
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <linux/mm.h>
+
+#include <drm/ttm/ttm_tt.h>
+#include <drm/ttm/ttm_pool.h>
+
+#include <ttm_kunit_helpers.h>
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
+	ttm_pool_init(pool, priv->dev, true, false);
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
+	ttm_pool_init(pool, priv->dev, params->use_dma_alloc, false);
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
+	ttm_pool_init(pool, priv->dev, true, false);
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
+	ttm_pool_init(pool, priv->dev, true, false);
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
+	ttm_pool_init(pool, priv->dev, false, false);
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

