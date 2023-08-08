Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731A773977
	for <lists+dri-devel@lfdr.de>; Tue,  8 Aug 2023 11:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21CC10E3D3;
	Tue,  8 Aug 2023 09:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A88010E3D3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 09:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691488348; x=1723024348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j0113L6DiKYY4dYgrbo0DG0WbmRLfjg6/kL8i3P/dVI=;
 b=TEm/3uKylsNFA+5KOm5aVZ0LZvwu3FUi8gz0W4GJPdnDEEVV+WMAAgHh
 UtdsXzhAwqvkVGG/C0C1qFK0IyAz81Opn1u2im8eQIeRkkVJ0JarlJHmQ
 egA+GMc3UOuogGYonds7gSmxiANrB6VbsFeq3gpyY3UlbtNnSTw97VgA5
 9rgetZleDnDuzKbmQfK/RxFV5GTyPkeI/gDBb14nzbMPjauKluHFWYUbb
 /iCj5MWdBbntrSpyhltmS/jnlvzjoNyhtF95Za9hZzarg/ocJu+47TYX4
 Ww9l4gtIJ6SvBAathRdtHrjWFTZk2Fq5gzcG2eXTk3NmFdQC6LGxVV2QZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457161236"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="457161236"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 02:51:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061945185"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="1061945185"
Received: from czapiews-mobl.ger.corp.intel.com (HELO kdrobnik-desk.intel.com)
 ([10.213.30.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 02:51:26 -0700
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v6 2/3] drm/ttm/tests: Add tests for ttm_device
Date: Tue,  8 Aug 2023 11:51:13 +0200
Message-Id: <2abb0e53e7d56b0a24d0255f9075e2123b991278.1691487006.git.karolina.stolarek@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1691487006.git.karolina.stolarek@intel.com>
References: <cover.1691487006.git.karolina.stolarek@intel.com>
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
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/tests/ttm_device_test.c | 158 ++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_device_test.c b/drivers/gpu/drm/ttm/tests/ttm_device_test.c
index 76d927d07501..b1b423b68cdf 100644
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
@@ -37,8 +44,159 @@ static void ttm_device_init_basic(struct kunit *test)
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
+				if (params->use_dma_alloc)
+					KUNIT_ASSERT_FALSE(test,
+							   list_empty(&pt.pages));
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

