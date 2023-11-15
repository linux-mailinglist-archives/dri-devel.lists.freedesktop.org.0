Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8987E5832
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD10810E760;
	Wed,  8 Nov 2023 13:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C4710E75E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699451837; x=1730987837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ctUSLzI08l+qD40zUlyD4CPbgXkBT1+Q/iLXQaojkGM=;
 b=kn0fryx1MnIEEPdkGh2PghypJCUx+OJrGg0j2IT0AGUyH1J/ZtP6Lwqp
 MVrX9dmh0ZMa13MCmW0A5RQ0gJMYjYo+GwXolduyq8FoKWLDFJcVK5M+A
 6Tevo4v1JLxbXdtdxe7YMyP8JOz9YjCLPQ8/v/5Py34Z90EkjlK2KxwD7
 uaSbQeHNvLls/7tvoZyi5nb1A6NsWOr3ECK+K3I1mhJ9bVqOG/bAwGs6O
 JSNpE8z86BFaLhz7aoEO0az+ckdLfFQytKv5/IrNZKOE5OI3hIA/OEDff
 ZnUYZD8uFOJQNBTVbUvxIjk8Oj/D3GwDpaTe+7+94qGkiXpm4Qo7judMa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="475993613"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="475993613"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="880212937"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="880212937"
Received: from asawoscx-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.23.233])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:56:59 -0800
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/8] drm/ttm/tests: Add tests for ttm_tt
Date: Wed,  8 Nov 2023 14:56:24 +0100
Message-Id: <cdc3571116060fed572b6e82623a9c9455c9b716.1699445194.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1699445194.git.karolina.stolarek@intel.com>
References: <cover.1699445194.git.karolina.stolarek@intel.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test initialization, creation and destruction of ttm_tt instances.
Export ttm_tt_destroy and ttm_tt_create symbols for testing purposes.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/ttm/tests/Makefile            |   1 +
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  20 ++
 drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 295 ++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
 4 files changed, 319 insertions(+)
 create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c

diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
index c92fe2052ef6..f570530bbb60 100644
--- a/drivers/gpu/drm/ttm/tests/Makefile
+++ b/drivers/gpu/drm/ttm/tests/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
         ttm_device_test.o \
         ttm_pool_test.o \
         ttm_resource_test.o \
+        ttm_tt_test.o \
         ttm_kunit_helpers.o
diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index dea7e6413d53..2bfc636a00b6 100644
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
+	ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
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
index 000000000000..4f5fc4d460b4
--- /dev/null
+++ b/drivers/gpu/drm/ttm/tests/ttm_tt_test.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include <linux/shmem_fs.h>
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
+	int num_pages = params->size >> PAGE_SHIFT;
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
+static void ttm_tt_init_misaligned(struct kunit *test)
+{
+	struct ttm_buffer_object *bo;
+	struct ttm_tt *tt;
+	enum ttm_caching caching = ttm_cached;
+	uint32_t size = SZ_8K;
+	int num_pages = (size + SZ_4K) >> PAGE_SHIFT;
+	int err;
+
+	tt = kunit_kzalloc(test, sizeof(*tt), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, tt);
+
+	bo = ttm_bo_kunit_init(test, test->priv, size);
+
+	/* Make the object size misaligned */
+	bo->base.size += 1;
+
+	err = ttm_tt_init(tt, bo, 0, caching, 0);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	KUNIT_ASSERT_EQ(test, tt->num_pages, num_pages);
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
+	KUNIT_CASE(ttm_tt_init_misaligned),
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
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index e0a77671edd6..d978dc539a9b 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -36,6 +36,7 @@
 #include <linux/file.h>
 #include <linux/module.h>
 #include <drm/drm_cache.h>
+#include <drm/drm_util.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_tt.h>
 
@@ -91,6 +92,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 
 	return 0;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_create);
 
 /*
  * Allocates storage for pointers to the pages that back the ttm.
@@ -129,6 +131,7 @@ void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	bdev->funcs->ttm_tt_destroy(bdev, ttm);
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_destroy);
 
 static void ttm_tt_init_fields(struct ttm_tt *ttm,
 			       struct ttm_buffer_object *bo,
-- 
2.25.1

