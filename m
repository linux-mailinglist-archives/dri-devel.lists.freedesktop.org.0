Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8404673F750
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A4E10E2B2;
	Tue, 27 Jun 2023 08:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB7110E2B5
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687854754; x=1719390754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cbuoMyEo82AOPlbp8Ti7dw/HmKmojdDcB5J8ctQPL48=;
 b=iZN7wdod68ge8l1HN2Zg54PYmxNeJdXoJx99Ts5CQB/XPlDwTh3fvwaG
 qhX5OAQft50roaZqaA9qzsljbQUw8OdP5ZDN4RlPrRkn7/HFf+UlOMYuc
 aHXOpos71z51Yj6VdYgjkXQeeH0Ntv5tPk8Ivxv7HgLNTQ3wSvgUaMDbA
 vUpPJ0MUhDBO1PSOYKxpbH1RTqG+KWgjh+d/DineYviyjpNd37181HePx
 sTQK1rPfMv98PtvKTy8E+8um5QUSqcyiMhzkQ33uz/QMNP/BL4OKbG9ZX
 67J0WeTM4TKgdJ/dmXWuDmuS8WeJ6gp9dDArFWsd/ADDWxxauGGqGG4P6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="364965692"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="364965692"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 01:32:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890600909"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="890600909"
Received: from aludkiew-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.28.47])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 01:32:30 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v2 2/3] drm/ttm/tests: Add tests for ttm_device
Date: Tue, 27 Jun 2023 10:32:09 +0200
Message-Id: <6e0703484cec48f56fb8056b7afefa019ed3d5d3.1687779215.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687779215.git.karolina.stolarek@intel.com>
References: <cover.1687779215.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
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

Test initialization and cleanup of the ttm_device struct, including
some error paths. Verify the creation of page pools if use_dma_alloc
param is true.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_device_test.c | 159 ++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
index 08d7314b1e35..67f7ec347a61 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_device_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
@@ -8,6 +8,13 @@
 
 #include "ttm_kunit_helpers.h"
 
+struct ttm_device_test_case {
+	const char *description;
+	bool use_dma_alloc;
+	bool use_dma32;
+	bool pools_init_expected;
+};
+
 static void ttm_device_init_basic(struct kunit *test)
 {
 	struct ttm_test_devices_priv *priv = test->priv;
@@ -37,8 +44,160 @@ static void ttm_device_init_basic(struct kunit *test)
 	ttm_device_fini(ttm_dev);
 }
 
+static void ttm_device_init_multiple(struct kunit *test)
+{
+	struct ttm_test_devices_priv *priv = test->priv;
+	struct ttm_device *ttm_devs;
+	unsigned int i, num_dev = 3;
+	int err;
+
+	ttm_devs = kunit_kcalloc(test, num_dev, sizeof(*ttm_devs), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
+
+	for (i = 0; i < num_dev; i++) {
+		err = ttm_kunit_helper_alloc_device(test, &ttm_devs[i],
+						    false, false);
+		KUNIT_ASSERT_EQ(test, err, 0);
+
+		KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].dev_mapping,
+				    priv->drm->anon_inode->i_mapping);
+		KUNIT_ASSERT_NOT_NULL(test, ttm_devs[i].wq);
+		KUNIT_EXPECT_PTR_EQ(test, ttm_devs[i].funcs, &ttm_dev_funcs);
+		KUNIT_ASSERT_NOT_NULL(test, ttm_devs[i].man_drv[TTM_PL_SYSTEM]);
+	}
+
+	KUNIT_ASSERT_EQ(test, list_count_nodes(&ttm_devs[0].device_list), num_dev);
+
+	for (i = 0; i < num_dev; i++)
+		ttm_device_fini(&ttm_devs[i]);
+}
+
+static void ttm_device_fini_basic(struct kunit *test)
+{
+	struct ttm_device *ttm_dev;
+	struct ttm_resource_manager *man;
+	int err;
+
+	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
+
+	err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	man = ttm_manager_type(ttm_dev, TTM_PL_SYSTEM);
+	KUNIT_ASSERT_NOT_NULL(test, man);
+
+	ttm_device_fini(ttm_dev);
+
+	KUNIT_ASSERT_FALSE(test, man->use_type);
+	KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[0]));
+	KUNIT_ASSERT_NULL(test, ttm_dev->man_drv[TTM_PL_SYSTEM]);
+}
+
+static void ttm_device_init_no_vma_man(struct kunit *test)
+{
+	struct ttm_test_devices_priv *priv = test->priv;
+	struct drm_device *drm = priv->drm;
+	struct ttm_device *ttm_dev;
+	struct drm_vma_offset_manager *vma_man;
+	int err;
+
+	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
+
+	/* Let's pretend there's no VMA manager allocated */
+	vma_man = drm->vma_offset_manager;
+	drm->vma_offset_manager = NULL;
+
+	err = ttm_kunit_helper_alloc_device(test, ttm_dev, false, false);
+	KUNIT_EXPECT_EQ(test, err, -EINVAL);
+
+	/* Bring the manager back for a graceful cleanup */
+	drm->vma_offset_manager = vma_man;
+}
+
+static const struct ttm_device_test_case ttm_device_cases[] = {
+	{
+		.description = "No DMA allocations, no DMA32 required",
+		.use_dma_alloc = false,
+		.use_dma32 = false,
+		.pools_init_expected = false,
+	},
+	{
+		.description = "DMA allocations, DMA32 required",
+		.use_dma_alloc = true,
+		.use_dma32 = true,
+		.pools_init_expected = true,
+	},
+	{
+		.description = "No DMA allocations, DMA32 required",
+		.use_dma_alloc = false,
+		.use_dma32 = true,
+		.pools_init_expected = false,
+	},
+	{
+		.description = "DMA allocations, no DMA32 required",
+		.use_dma_alloc = true,
+		.use_dma32 = false,
+		.pools_init_expected = true,
+	},
+};
+
+static void ttm_device_case_desc(const struct ttm_device_test_case *t, char *desc)
+{
+	strscpy(desc, t->description, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(ttm_device, ttm_device_cases, ttm_device_case_desc);
+
+static void ttm_device_init_pools(struct kunit *test)
+{
+	struct ttm_test_devices_priv *priv = test->priv;
+	const struct ttm_device_test_case *params = test->param_value;
+	struct ttm_device *ttm_dev;
+	struct ttm_pool *pool;
+	struct ttm_pool_type pt;
+	int err;
+
+	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
+
+	err = ttm_kunit_helper_alloc_device(test, ttm_dev,
+					    params->use_dma_alloc,
+					    params->use_dma32);
+	KUNIT_ASSERT_EQ(test, err, 0);
+
+	pool = &ttm_dev->pool;
+	KUNIT_ASSERT_NOT_NULL(test, pool);
+	KUNIT_EXPECT_PTR_EQ(test, pool->dev, priv->dev);
+	KUNIT_EXPECT_EQ(test, pool->use_dma_alloc, params->use_dma_alloc);
+	KUNIT_EXPECT_EQ(test, pool->use_dma32, params->use_dma32);
+
+	if (params->pools_init_expected) {
+		for (int i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
+			for (int j = 0; j <= MAX_ORDER; ++j) {
+				pt = pool->caching[i].orders[j];
+				KUNIT_EXPECT_PTR_EQ(test, pt.pool, pool);
+				KUNIT_EXPECT_EQ(test, pt.caching, i);
+				KUNIT_EXPECT_EQ(test, pt.order, j);
+
+				if (params->use_dma_alloc) {
+					KUNIT_ASSERT_FALSE(test,
+							   list_empty(&pt.pages));
+				}
+			}
+		}
+	}
+
+	ttm_device_fini(ttm_dev);
+}
+
 static struct kunit_case ttm_device_test_cases[] = {
 	KUNIT_CASE(ttm_device_init_basic),
+	KUNIT_CASE(ttm_device_init_multiple),
+	KUNIT_CASE(ttm_device_fini_basic),
+	KUNIT_CASE(ttm_device_init_no_vma_man),
+	KUNIT_CASE_PARAM(ttm_device_init_pools, ttm_device_gen_params),
 	{}
 };
 
-- 
2.25.1

