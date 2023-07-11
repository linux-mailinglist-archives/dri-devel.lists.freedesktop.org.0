Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90074EBCC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 12:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D4F010E362;
	Tue, 11 Jul 2023 10:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8D710E35E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 10:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689071741; x=1720607741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eMEvByB3FNWOBy7WOKqGQMRBCD5jBrUKxiYX6UUMp3Q=;
 b=CoCboHFUA7lHdwg1YwYEALCJX+SmYS4YegOOC6+AlFSMDCyD0auV36EI
 pHL9+yt0NpJtKOkCcWEE9nSExts8m4H0p+w19ojLhK7aw3P1/qHuZy2ae
 qMEJ5E2twEn3kFV7+2OUpQw7p/s9hzYJ+FxZJJdxOTV3fR51/fjkOFpHZ
 fbi3Yp9JnJV0k8XcdR4tBeUXj6jvpbw8djjr2BQWEIjgiBZDdRAfqyl/l
 mHFyR79Hkt7rLWZJvuhONk+0TwJa4YSx5rZEYXXVrNiBQS+lf9WfzqXVH
 vq7uHFQsmtPJor/2JD2QEH1b6m+6s4doGgOdtupQ1ObXlifnHQdPVc8+F g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="362046491"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="362046491"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="698386277"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="698386277"
Received: from kaszymec-mobl1.ger.corp.intel.com (HELO
 kdrobnik-desk.toya.net.pl) ([10.213.16.58])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:35:34 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v4 2/3] drm/ttm/tests: Add tests for ttm_device
Date: Tue, 11 Jul 2023 12:34:24 +0200
Message-Id: <e5f75f4b093af650103efe3008f395c3dc7b505d.1689060814.git.karolina.stolarek@intel.com>
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

Test initialization and cleanup of the ttm_device struct, including
some error paths. Verify the creation of page pools if use_dma_alloc
param is true.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 drivers/gpu/drm/ttm/tests/ttm_device_test.c | 159 ++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
index 76d927d07501..f8c867836acf 100644
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
 	struct ttm_test_devices *priv = test->priv;
@@ -37,8 +44,160 @@ static void ttm_device_init_basic(struct kunit *test)
 	ttm_device_fini(ttm_dev);
 }
 
+static void ttm_device_init_multiple(struct kunit *test)
+{
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_device *ttm_devs;
+	unsigned int i, num_dev = 3;
+	int err;
+
+	ttm_devs = kunit_kcalloc(test, num_dev, sizeof(*ttm_devs), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_devs);
+
+	for (i = 0; i < num_dev; i++) {
+		err = ttm_device_kunit_init(priv, &ttm_devs[i], false, false);
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
+	struct ttm_test_devices *priv = test->priv;
+	struct ttm_device *ttm_dev;
+	struct ttm_resource_manager *man;
+	int err;
+
+	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
+
+	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
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
+	struct ttm_test_devices *priv = test->priv;
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
+	err = ttm_device_kunit_init(priv, ttm_dev, false, false);
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
+	struct ttm_test_devices *priv = test->priv;
+	const struct ttm_device_test_case *params = test->param_value;
+	struct ttm_device *ttm_dev;
+	struct ttm_pool *pool;
+	struct ttm_pool_type pt;
+	int err;
+
+	ttm_dev = kunit_kzalloc(test, sizeof(*ttm_dev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ttm_dev);
+
+	err = ttm_device_kunit_init(priv, ttm_dev,
+				    params->use_dma_alloc,
+				    params->use_dma32);
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

