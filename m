Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D231C78721
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6801910E833;
	Fri, 21 Nov 2025 10:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bRPFnolo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0712510E833
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 10:18:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNwkS3onuCFJKhle2A2moliSB+ndSsA3h4DIrnURpaZvHuweJBJk/bL4u4FdPXWFzMohf132K2kBByA3JSLNHVeszDak9aE285iEdYzVBjeQwS/EPIYytu1p8/WthB2RofO0yXkftNJH8up/z+w3Y+LBTzGsvoUZ829uT4juCy+Gmr0XrtjxEIuyqKCm99pY1IDiOu2gqhGWa2G7LIeG2tUe6A6iMjRZsGy5+ErpGjFIsc+Jzs2Pp5RWlRDeOywHZyWibhVk07oFQICnjHufnJVGQtn1gbK0eRBxrOwZzf+iR0uofgeYoQoZtQhovhjpVXZnOFjuLVFV156zlrAzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5o0bmrlTwRX2OabXfLS2ETBdi8ayPuuYoXsNC7YHQo=;
 b=w3+y9Znmena/VwArQfok2gguDu1pmO4Plt0cTkkV7dQFXEJoGKBUOPgBnODRWWgpdZb+F3w6AXNGzsgpfqvORAeEnWxB2MQ9o/gEvBeXHtlILRdh6RSgtCLLEO07T+J/shtWJbyUxt8SlsfTZcm01soXbzfzwhVvESAudnx6f5kyajK6om/VUC6gueYvLrpsxMz7AR4Gk4+DFm1gk62IQCcQ70XPiZ8VB0P+PCYaB/cZxnTrz3pX35EiPOizjEjIHcRa7qb//KtaK20Sw6FbGeF5o0fiDxeYjQjfcYsvFDO0jEqzPYiTwqqMz5dPWgNh1BUBZWK2GVc7GgYHK3kZbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5o0bmrlTwRX2OabXfLS2ETBdi8ayPuuYoXsNC7YHQo=;
 b=bRPFnoloFXKJ5gW8NNTPS83u6W2o/ENZD6PxzPh/zK0AM4kjihNTAXlPQM96m8QTn2bxBftDP1YsaLW9huqhZLFlPZ6m4do8+xmRs6ZeCLB1bf2FZUUpdzO1Eq4/c9J1waqp5/l8LDjZRZR1imMupJA/KZS5DWI9n+ztrith7mk=
Received: from BN9PR03CA0220.namprd03.prod.outlook.com (2603:10b6:408:f8::15)
 by LV8PR12MB9269.namprd12.prod.outlook.com (2603:10b6:408:1fe::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:18:02 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:f8:cafe::c9) by BN9PR03CA0220.outlook.office365.com
 (2603:10b6:408:f8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 10:18:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:18:00 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:17:57 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v3 19/28] drm/ttm: rework pipelined eviction fence handling
Date: Fri, 21 Nov 2025 11:12:29 +0100
Message-ID: <20251121101315.3585-20-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|LV8PR12MB9269:EE_
X-MS-Office365-Filtering-Correlation-Id: e18b7b34-3410-4b9f-ec8b-08de28e73fb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|7416014|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oJQ1YScYPNy661icnmUQhYO4ewROHiaAO+m83rH0X09CUeYb86Qq1f2m4ceS?=
 =?us-ascii?Q?pqyezINaJaLTrrgGpK3KiHyeLvLFMZC3YJTYHEkPaoqYiWAwQR3QApsLJpCH?=
 =?us-ascii?Q?rdQbLj+KnDlgqMv3LBpNvrPjsyt9XWAQFM8U/cF2LPHzRmOu1Kp4mlq6P6Mr?=
 =?us-ascii?Q?rrtgCfDhGxFFCmwisYu31FPjUj6J3j2Lu0JfaY8UhjBRnbjBSR3DcVYfrmaR?=
 =?us-ascii?Q?4ZMOmZ99gOGPtIYR6kVyvCEpg57CEsxt3hIZQy0/Q+9mcFXGFbRrK3MTSPdN?=
 =?us-ascii?Q?EaEoDRaNEAhlwTEfw7zxVj2vNulFHI7+P5KvEuPsw08tF7/X2CF9ZRNpvBY6?=
 =?us-ascii?Q?YqgW3eSe2nkvZdscsTeWYXYui2+sGiwSAZrrbyHaRW5AFTzR/qHdfrbauTdU?=
 =?us-ascii?Q?k4NkUi4IorbzxZzJ2Nc6Cjj/h3N/WSusTd8gov4pDPhYGXAveKKYbwgmBgJD?=
 =?us-ascii?Q?c2yFzvK8GkVeCldNo38Xf+2RdsJP5FYmDR/Jha2WXNFEQqHYJyiGfyfnq2Qf?=
 =?us-ascii?Q?qijNYud8VTH2ceEM5rIXhZNzOOduheXyN/8Cvw5aiRTwWp2K9b1yKieyad+N?=
 =?us-ascii?Q?D5yJShLzivwpypB+pVp3355qyhA01FSVv27oQ4taNyT14T8MHuPB4bGOGYJi?=
 =?us-ascii?Q?YXJUvLA77qU9Q6nYZ4hg4BX4uFHIuEqKSBZ1ipVWYt34OO/7/Wgje7M3aUS/?=
 =?us-ascii?Q?efDkYvRFJ/PC3J/4zZycwFV4YJ+MKwvUFdsIUCwCUtlnLxpzncvi1bSfsajI?=
 =?us-ascii?Q?w1lda5mOb8TVNSVCWnxgyNrhN2KEECuw7HA/h5UNPUenMROyek0jb8lx1e7O?=
 =?us-ascii?Q?QTb7MlePyXR0TMRE4Y900vPM2M1DHZe/6S+qR0AV0hYJ6JOpagyq5qw26n46?=
 =?us-ascii?Q?OQAu+XA+pqfsfELGPTPwTahzm2Vg5gcEsjXfcwieZUjD6yxTaapiJzgaZfNA?=
 =?us-ascii?Q?Z+4ao9HaOjKHt5buFAOzsqJRLr5DeaZUb9d1cnzdtYHn8CH7dSUkK+Z4hcQR?=
 =?us-ascii?Q?sLcPo+EJUniIVDtG7HxEi/I/7k0pscoIRmxrISEBor2ACmck6iK+16Gzoq51?=
 =?us-ascii?Q?t+EuxRkeQxefutBykSRPji2eTq4DyMMOcOLdfwaQQTYQTYJPxHjqr9wsEqtK?=
 =?us-ascii?Q?C/kLmE+fVD0q32aZcY4qB+MZwWA+vqMHfKjJhS/bK5gAJLSAMJ8l+KlT9qSU?=
 =?us-ascii?Q?VU351LHE6tar63yotTzm02lV67hXXKHLKYl/znnU0FGbLBtFWsTmgdd8yjFR?=
 =?us-ascii?Q?Z9RYYiOfpzvE1N+r7Sg/Zf57eE/yJF64S+/55Bgc9Ur07DPZSl4EPqn0rAqF?=
 =?us-ascii?Q?62VNeu53yU8OjwdspJ62Pon2qDj4bLb+PHN36sV/9kHZYsN09YPJFEUCd0j1?=
 =?us-ascii?Q?m/QWf5w1PCl+O1xmFH4f0fPbNAjBYNAj7vw+6a1K9oVZFad15iHKoFXBcxcr?=
 =?us-ascii?Q?aSx6POFaPWwdUx2fEN9Ow8hGO22e/IYxSH5jRJfycue6Siq7StkCXYFuLfpO?=
 =?us-ascii?Q?BHb9xOXx5a1R4rwGS+X/Znw7lOR6v0u7796x5Hmz64AZOSeaDMrZz/M5RoAG?=
 =?us-ascii?Q?i/GY5SGzlEyK1jWYpM5r+VuaJFyDx7LqsBOurvYW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(7416014)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:18:00.3951 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e18b7b34-3410-4b9f-ec8b-08de28e73fb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9269
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Until now ttm stored a single pipelined eviction fence which means
drivers had to use a single entity for these evictions.

To lift this requirement, this commit allows up to 8 entities to
be used.

Ideally a dma_resv object would have been used as a container of
the eviction fences, but the locking rules makes it complex.
dma_resv all have the same ww_class, which means "Attempting to
lock more mutexes after ww_acquire_done." is an error.

One alternative considered was to introduced a 2nd ww_class for
specific resv to hold a single "transient" lock (= the resv lock
would only be held for a short period, without taking any other
locks).

The other option, is to statically reserve a fence array, and
extend the existing code to deal with N fences, instead of 1.

The driver is still responsible to reserve the correct number
of fence slots.

---
v2:
- simplified code
- dropped n_fences
- name changes
v3: use ttm_resource_manager_cleanup
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 11 +++--
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 47 ++++++++++---------
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 38 ++++++++++++---
 drivers/gpu/drm/ttm/ttm_resource.c            | 31 +++++++-----
 include/drm/ttm/ttm_resource.h                | 29 ++++++++----
 6 files changed, 104 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 3148f5d3dbd6..8f71906c4238 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -651,7 +651,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
 	int err;
 
 	man = ttm_manager_type(priv->ttm_dev, mem_type);
-	man->move = dma_fence_get_stub();
+	man->eviction_fences[0] = dma_fence_get_stub();
 
 	bo = ttm_bo_kunit_init(test, test->priv, size, NULL);
 	bo->type = bo_type;
@@ -668,7 +668,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
 
 	ttm_bo_put(bo);
-	dma_fence_put(man->move);
+	dma_fence_put(man->eviction_fences[0]);
 }
 
 static const struct ttm_bo_validate_test_case ttm_bo_validate_wait_cases[] = {
@@ -732,9 +732,9 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
 
 	spin_lock_init(&fence_lock);
 	man = ttm_manager_type(priv->ttm_dev, fst_mem);
-	man->move = alloc_mock_fence(test);
+	man->eviction_fences[0] = alloc_mock_fence(test);
 
-	task = kthread_create(threaded_fence_signal, man->move, "move-fence-signal");
+	task = kthread_create(threaded_fence_signal, man->eviction_fences[0], "move-fence-signal");
 	if (IS_ERR(task))
 		KUNIT_FAIL(test, "Couldn't create move fence signal task\n");
 
@@ -742,7 +742,8 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
 	err = ttm_bo_validate(bo, placement_val, &ctx_val);
 	dma_resv_unlock(bo->base.resv);
 
-	dma_fence_wait_timeout(man->move, false, MAX_SCHEDULE_TIMEOUT);
+	dma_fence_wait_timeout(man->eviction_fences[0], false, MAX_SCHEDULE_TIMEOUT);
+	man->eviction_fences[0] = NULL;
 
 	KUNIT_EXPECT_EQ(test, err, 0);
 	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index e6ea2bd01f07..c0e4e35e0442 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
@@ -207,6 +207,7 @@ static void ttm_resource_manager_init_basic(struct kunit *test)
 	struct ttm_resource_test_priv *priv = test->priv;
 	struct ttm_resource_manager *man;
 	size_t size = SZ_16K;
+	int i;
 
 	man = kunit_kzalloc(test, sizeof(*man), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, man);
@@ -216,8 +217,8 @@ static void ttm_resource_manager_init_basic(struct kunit *test)
 	KUNIT_ASSERT_PTR_EQ(test, man->bdev, priv->devs->ttm_dev);
 	KUNIT_ASSERT_EQ(test, man->size, size);
 	KUNIT_ASSERT_EQ(test, man->usage, 0);
-	KUNIT_ASSERT_NULL(test, man->move);
-	KUNIT_ASSERT_NOT_NULL(test, &man->move_lock);
+	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++)
+		KUNIT_ASSERT_NULL(test, man->eviction_fences[i]);
 
 	for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f4d9e68b21e7..0b3732ed6f6c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -658,34 +658,35 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
 EXPORT_SYMBOL(ttm_bo_unpin);
 
 /*
- * Add the last move fence to the BO as kernel dependency and reserve a new
- * fence slot.
+ * Add the pipelined eviction fencesto the BO as kernel dependency and reserve new
+ * fence slots.
  */
-static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
-				 struct ttm_resource_manager *man,
-				 bool no_wait_gpu)
+static int ttm_bo_add_pipelined_eviction_fences(struct ttm_buffer_object *bo,
+						struct ttm_resource_manager *man,
+						bool no_wait_gpu)
 {
 	struct dma_fence *fence;
-	int ret;
+	int i;
 
-	spin_lock(&man->move_lock);
-	fence = dma_fence_get(man->move);
-	spin_unlock(&man->move_lock);
+	spin_lock(&man->eviction_lock);
+	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
+		fence = man->eviction_fences[i];
+		if (!fence)
+			continue;
 
-	if (!fence)
-		return 0;
-
-	if (no_wait_gpu) {
-		ret = dma_fence_is_signaled(fence) ? 0 : -EBUSY;
-		dma_fence_put(fence);
-		return ret;
+		if (no_wait_gpu) {
+			if (!dma_fence_is_signaled(fence)) {
+				spin_unlock(&man->eviction_lock);
+				return -EBUSY;
+			}
+		} else {
+			dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
+		}
 	}
+	spin_unlock(&man->eviction_lock);
 
-	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
-
-	ret = dma_resv_reserve_fences(bo->base.resv, 1);
-	dma_fence_put(fence);
-	return ret;
+	/* TODO: this call should be removed. */
+	return dma_resv_reserve_fences(bo->base.resv, 1);
 }
 
 /**
@@ -718,7 +719,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 	int i, ret;
 
 	ticket = dma_resv_locking_ctx(bo->base.resv);
-	ret = dma_resv_reserve_fences(bo->base.resv, 1);
+	ret = dma_resv_reserve_fences(bo->base.resv, TTM_NUM_MOVE_FENCES);
 	if (unlikely(ret))
 		return ret;
 
@@ -757,7 +758,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 				return ret;
 		}
 
-		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
+		ret = ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu);
 		if (unlikely(ret)) {
 			ttm_resource_free(bo, res);
 			if (ret == -EBUSY)
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index acbbca9d5c92..2ff35d55e462 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -258,7 +258,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	ret = dma_resv_trylock(&fbo->base.base._resv);
 	WARN_ON(!ret);
 
-	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
+	ret = dma_resv_reserve_fences(&fbo->base.base._resv, TTM_NUM_MOVE_FENCES);
 	if (ret) {
 		dma_resv_unlock(&fbo->base.base._resv);
 		kfree(fbo);
@@ -646,20 +646,44 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
 {
 	struct ttm_device *bdev = bo->bdev;
 	struct ttm_resource_manager *from;
+	struct dma_fence *tmp;
+	int i;
 
 	from = ttm_manager_type(bdev, bo->resource->mem_type);
 
 	/**
 	 * BO doesn't have a TTM we need to bind/unbind. Just remember
-	 * this eviction and free up the allocation
+	 * this eviction and free up the allocation.
+	 * The fence will be saved in the first free slot or in the slot
+	 * already used to store a fence from the same context. Since
+	 * drivers can't use more than TTM_NUM_MOVE_FENCES contexts for
+	 * evictions we should always find a slot to use.
 	 */
-	spin_lock(&from->move_lock);
-	if (!from->move || dma_fence_is_later(fence, from->move)) {
-		dma_fence_put(from->move);
-		from->move = dma_fence_get(fence);
+	spin_lock(&from->eviction_lock);
+	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
+		tmp = from->eviction_fences[i];
+		if (!tmp)
+			break;
+		if (fence->context != tmp->context)
+			continue;
+		if (dma_fence_is_later(fence, tmp)) {
+			dma_fence_put(tmp);
+			break;
+		}
+		goto unlock;
+	}
+	if (i < TTM_NUM_MOVE_FENCES) {
+		from->eviction_fences[i] = dma_fence_get(fence);
+	} else {
+		WARN(1, "not enough fence slots for all fence contexts");
+		spin_unlock(&from->eviction_lock);
+		dma_fence_wait(fence, false);
+		goto end;
 	}
-	spin_unlock(&from->move_lock);
 
+unlock:
+	spin_unlock(&from->eviction_lock);
+end:
 	ttm_resource_free(bo, &bo->resource);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index e2c82ad07eb4..62c34cafa387 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -523,14 +523,15 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 {
 	unsigned i;
 
-	spin_lock_init(&man->move_lock);
 	man->bdev = bdev;
 	man->size = size;
 	man->usage = 0;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
-	man->move = NULL;
+	spin_lock_init(&man->eviction_lock);
+	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++)
+		man->eviction_fences[i] = NULL;
 }
 EXPORT_SYMBOL(ttm_resource_manager_init);
 
@@ -551,7 +552,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 		.no_wait_gpu = false,
 	};
 	struct dma_fence *fence;
-	int ret;
+	int ret, i;
 
 	do {
 		ret = ttm_bo_evict_first(bdev, man, &ctx);
@@ -561,18 +562,24 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 	if (ret && ret != -ENOENT)
 		return ret;
 
-	spin_lock(&man->move_lock);
-	fence = dma_fence_get(man->move);
-	spin_unlock(&man->move_lock);
+	ret = 0;
 
-	if (fence) {
-		ret = dma_fence_wait(fence, false);
-		dma_fence_put(fence);
-		if (ret)
-			return ret;
+	spin_lock(&man->eviction_lock);
+	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
+		fence = man->eviction_fences[i];
+		if (fence && !dma_fence_is_signaled(fence)) {
+			dma_fence_get(fence);
+			spin_unlock(&man->eviction_lock);
+			ret = dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+			if (ret)
+				return ret;
+			spin_lock(&man->eviction_lock);
+		}
 	}
+	spin_unlock(&man->eviction_lock);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(ttm_resource_manager_evict_all);
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index f49daa504c36..50e6added509 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -50,6 +50,15 @@ struct io_mapping;
 struct sg_table;
 struct scatterlist;
 
+/**
+ * define TTM_NUM_MOVE_FENCES - How many entities can be used for evictions
+ *
+ * Pipelined evictions can be spread on multiple entities. This
+ * is the max number of entities that can be used by the driver
+ * for that purpose.
+ */
+#define TTM_NUM_MOVE_FENCES 8
+
 /**
  * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
  */
@@ -180,8 +189,8 @@ struct ttm_resource_manager_func {
  * @size: Size of the managed region.
  * @bdev: ttm device this manager belongs to
  * @func: structure pointer implementing the range manager. See above
- * @move_lock: lock for move fence
- * @move: The fence of the last pipelined move operation.
+ * @eviction_lock: lock for eviction fences
+ * @eviction_fences: The fences of the last pipelined move operation.
  * @lru: The lru list for this memory type.
  *
  * This structure is used to identify and manage memory types for a device.
@@ -195,12 +204,12 @@ struct ttm_resource_manager {
 	struct ttm_device *bdev;
 	uint64_t size;
 	const struct ttm_resource_manager_func *func;
-	spinlock_t move_lock;
 
-	/*
-	 * Protected by @move_lock.
+	/* This is very similar to a dma_resv object, but locking rules make
+	 * it difficult to use one in this context.
 	 */
-	struct dma_fence *move;
+	spinlock_t eviction_lock;
+	struct dma_fence *eviction_fences[TTM_NUM_MOVE_FENCES];
 
 	/*
 	 * Protected by the bdev->lru_lock.
@@ -421,8 +430,12 @@ static inline bool ttm_resource_manager_used(struct ttm_resource_manager *man)
 static inline void
 ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 {
-	dma_fence_put(man->move);
-	man->move = NULL;
+	int i;
+
+	for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
+		dma_fence_put(man->eviction_fences[i]);
+		man->eviction_fences[i] = NULL;
+	}
 }
 
 void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
-- 
2.43.0

