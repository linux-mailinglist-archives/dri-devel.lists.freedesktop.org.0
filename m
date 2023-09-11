Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A1779A732
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BC810E286;
	Mon, 11 Sep 2023 10:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B37C10E280
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694427507; x=1725963507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qRl2iDMFuDUMh90lrh9i+m255oS40HlreB9LAbmbm6Y=;
 b=IeOTWIrSEw45Tj5J5OZsmokttQ1EdnZh26xewBsHNEHOfGNMNed7ASuS
 kUxzGNqpmz1TfcejNUwerQ9uLwi9TCwrufyuKWH+rIA45b5YaRox559Md
 dXLEKkW/056sHFp7tR9aeSzq46PaFlQZK2oe303vyeb3ekc3ArmfiJqvi
 xtHvYzBeP31z7SS88vns2Ct1A4wQhj4R4lNgQz6TSpv1Kn+53zOzdSE+9
 Egk5nyqFmm4Stty9Rx8+5qPF4CFVZsqYaUxBfFrlM1y69INH2mP1eBMc3
 nHz3k5FQRZbeAituSIvcKS4eD1/S6IJ0zXmpViBILab9PLlWn1gt1Mu8s g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="409013092"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="409013092"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="772533034"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000"; d="scan'208";a="772533034"
Received: from adolasin-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.intel.com) ([10.213.28.224])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 03:18:25 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/5] drm/ttm/tests: Add tests for ttm_tt
Date: Mon, 11 Sep 2023 12:17:58 +0200
Message-Id: <3c54a7b5d225b0a5495123535c1b94adcc6d6d64.1694422112.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1694422112.git.karolina.stolarek@intel.com>
References: <cover.1694422112.git.karolina.stolarek@intel.com>
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

Test initialization, creation and destruction of ttm_tt instances.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/Makefile                  |   3 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  20 ++
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 277 ++++++++++++++++++
 3 files changed, 299 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c

diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
index b49b639a0940..8d5413ae99ca 100644
--- a/drivers/gpu/drm/ttm/Makefile
+++ b/drivers/gpu/drm/ttm/Makefile
@@ -9,7 +9,8 @@ obj-$(CONFIG_DRM_TTM) += $(ttm)
 ttm-$(CONFIG_AGP) += ttm_agp_backend.o
 
 ttm-tests := tests/ttm_kunit_helpers.o tests/ttm_device_test.o \
-             tests/ttm_pool_test.o tests/ttm_resource_test.o
+             tests/ttm_pool_test.o tests/ttm_resource_test.o \
+             tests/ttm_tt_test.o
 
 ifeq ($(CONFIG_DRM_TTM_KUNIT_TEST),m)
     ttm-test-objs := $(ttm) $(ttm-tests)
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index eccc59b981f8..112381153bbf 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -2,9 +2,29 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include <drm/ttm/ttm_tt.h>
+
 #include "ttm_kunit_helpers.h"
 
+static struct ttm_tt *ttm_tt_simple_create(struct ttm_buffer_object *bo,
+					   uint32_t page_flags)
+{
+	struct ttm_tt *tt;
+
+	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
+	ttm_tt_init(tt, bo, 0, ttm_cached, 0);
+
+	return tt;
+}
+
+static void ttm_tt_simple_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
+{
+	kfree(ttm);
+}
+
 struct ttm_device_funcs ttm_dev_funcs = {
+	.ttm_tt_create = ttm_tt_simple_create,
+	.ttm_tt_destroy = ttm_tt_simple_destroy,
 };
 EXPORT_SYMBOL_GPL(ttm_dev_funcs);
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_tt_test.c b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
new file mode 100644
index 000000000000..1300ca93e523
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
@@ -0,0 +1,277 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <linux/mm.h>
+#include <linux/shmem_fs.h>
+
+#include <drm/ttm/ttm_tt.h>
+
+#include "ttm_kunit_helpers.h"
+
+#define BO_SIZE		SZ_4K
+
+struct ttm_tt_test_case {
+	const char *description;
+	uint32_t size;
+	uint32_t extra_pages_num;
+};
+
+static int ttm_tt_test_init(struct kunit *test)
+{
+	struct ttm_test_devices *priv;
+
+	priv = kunit_kzalloc(test, sizeof(*priv), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	priv = ttm_test_devices_all(test);
+	test->priv = priv;
+
+	return 0;
+}
+
+static const struct ttm_tt_test_case ttm_tt_init_basic_cases[] = {
+	{
+		.description = "Page-aligned size",
+		.size = SZ_4K,
+	},
+	{
+		.description = "Misaligned size",
+		.size = SZ_8K + 1,
+	},
+	{
+		.description = "Extra pages requested",
+		.size = SZ_4K,
+		.extra_pages_num = 1,
+	},
+};
+
+static void ttm_tt_init_case_desc(const struct ttm_tt_test_case *t,
+				  char *desc)
+{
+	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(ttm_tt_init_basic, ttm_tt_init_basic_cases,
+		  ttm_tt_init_case_desc);
+
+static void ttm_tt_init_basic(struct kunit *test)
+{
+	const struct ttm_tt_test_case *params = test->param_value;
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	uint32_t page_flags = TTM_TT_FLAG_ZERO_ALLOC;
+	enum ttm_caching caching = ttm_cached;
+	uint32_t extra_pages = params->extra_pages_num;
+	int num_pages = PAGE_ALIGN(params->size) / PAGE_SIZE;
+	int err;
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	bo = ttm_bo_kunit_init(test, test->priv, params->size);
+
+	err = ttm_tt_init(tt, bo, page_flags, caching, extra_pages);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	KUNIT_ASSERT_EQ(test, tt->num_pages, num_pages + extra_pages);
+
+	KUNIT_ASSERT_EQ(test, tt->page_flags, page_flags);
+	KUNIT_ASSERT_EQ(test, tt->caching, caching);
+
+	KUNIT_ASSERT_NULL(test, tt->dma_address);
+	KUNIT_ASSERT_NULL(test, tt->swap_storage);
+}
+
+static void ttm_tt_fini_basic(struct kunit *test)
+{
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	enum ttm_caching caching = ttm_cached;
+	int err;
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+
+	err = ttm_tt_init(tt, bo, 0, caching, 0);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	KUNIT_ASSERT_NOT_NULL(test, tt->pages);
+
+	ttm_tt_fini(tt);
+	KUNIT_ASSERT_NULL(test, tt->pages);
+}
+
+static void ttm_tt_fini_sg(struct kunit *test)
+{
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	enum ttm_caching caching = ttm_cached;
+	int err;
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+
+	err = ttm_sg_tt_init(tt, bo, 0, caching);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	KUNIT_ASSERT_NOT_NULL(test, tt->dma_address);
+
+	ttm_tt_fini(tt);
+	KUNIT_ASSERT_NULL(test, tt->dma_address);
+}
+
+static void ttm_tt_fini_shmem(struct kunit *test)
+{
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	struct file *shmem;
+	enum ttm_caching caching = ttm_cached;
+	int err;
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+
+	err = ttm_tt_init(tt, bo, 0, caching, 0);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	shmem = shmem_file_setup("ttm swap", BO_SIZE, 0);
+	tt->swap_storage = shmem;
+
+	ttm_tt_fini(tt);
+	KUNIT_ASSERT_NULL(test, tt->swap_storage);
+}
+
+static void ttm_tt_create_basic(struct kunit *test)
+{
+	struct ttm_buffer_object *bo;
+	int err;
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo->type = ttm_bo_type_device;
+
+	dma_resv_lock(bo->base.resv, NULL);
+	err = ttm_tt_create(bo, false);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, 0);
+	KUNIT_EXPECT_NOT_NULL(test, bo->ttm);
+
+	/* Free manually, as it was allocated outside of KUnit */
+	kfree(bo->ttm);
+}
+
+static void ttm_tt_create_invalid_bo_type(struct kunit *test)
+{
+	struct ttm_buffer_object *bo;
+	int err;
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+	bo->type = ttm_bo_type_sg + 1;
+
+	dma_resv_lock(bo->base.resv, NULL);
+	err = ttm_tt_create(bo, false);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_EXPECT_EQ(test, err, -EINVAL);
+	KUNIT_EXPECT_NULL(test, bo->ttm);
+}
+
+static void ttm_tt_create_ttm_exists(struct kunit *test)
+{
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	enum ttm_caching caching = ttm_cached;
+	int err;
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+
+	err = ttm_tt_init(tt, bo, 0, caching, 0);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	bo->ttm = tt;
+
+	dma_resv_lock(bo->base.resv, NULL);
+	err = ttm_tt_create(bo, false);
+	dma_resv_unlock(bo->base.resv);
+
+	/* Expect to keep the previous TTM */
+	KUNIT_ASSERT_EQ(test, err, 0);
+	KUNIT_ASSERT_PTR_EQ(test, tt, bo->ttm);
+}
+
+static struct ttm_tt *ttm_tt_null_create(struct ttm_buffer_object *bo,
+					 uint32_t page_flags)
+{
+	return NULL;
+}
+
+struct ttm_device_funcs ttm_dev_empty_funcs = {
+	.ttm_tt_create = ttm_tt_null_create,
+};
+
+static void ttm_tt_create_failed(struct kunit *test)
+{
+	const struct ttm_test_devices *devs = test->priv;
+	struct ttm_buffer_object *bo;
+	int err;
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+
+	/* Update ttm_device_funcs so we don't alloc ttm_tt */
+	devs->ttm_dev->funcs = &ttm_dev_empty_funcs;
+
+	dma_resv_lock(bo->base.resv, NULL);
+	err = ttm_tt_create(bo, false);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_ASSERT_EQ(test, err, -ENOMEM);
+}
+
+static void ttm_tt_destroy_basic(struct kunit *test)
+{
+	const struct ttm_test_devices *devs = test->priv;
+	struct ttm_buffer_object *bo;
+	int err;
+
+	bo = ttm_bo_kunit_init(test, test->priv, BO_SIZE);
+
+	dma_resv_lock(bo->base.resv, NULL);
+	err = ttm_tt_create(bo, false);
+	dma_resv_unlock(bo->base.resv);
+
+	KUNIT_ASSERT_EQ(test, err, 0);
+	KUNIT_ASSERT_NOT_NULL(test, bo->ttm);
+
+	ttm_tt_destroy(devs->ttm_dev, bo->ttm);
+}
+
+static struct kunit_case ttm_tt_test_cases[] = {
+	KUNIT_CASE_PARAM(ttm_tt_init_basic, ttm_tt_init_basic_gen_params),
+	KUNIT_CASE(ttm_tt_fini_basic),
+	KUNIT_CASE(ttm_tt_fini_sg),
+	KUNIT_CASE(ttm_tt_fini_shmem),
+	KUNIT_CASE(ttm_tt_create_basic),
+	KUNIT_CASE(ttm_tt_create_invalid_bo_type),
+	KUNIT_CASE(ttm_tt_create_ttm_exists),
+	KUNIT_CASE(ttm_tt_create_failed),
+	KUNIT_CASE(ttm_tt_destroy_basic),
+	{}
+};
+
+static struct kunit_suite ttm_tt_test_suite = {
+	.name = "ttm_tt",
+	.init = ttm_tt_test_init,
+	.exit = ttm_test_devices_fini,
+	.test_cases = ttm_tt_test_cases,
+};
+
+kunit_test_suites(&ttm_tt_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.25.1

