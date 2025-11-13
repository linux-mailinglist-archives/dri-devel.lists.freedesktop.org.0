Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D69CC5893E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3A910E867;
	Thu, 13 Nov 2025 16:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="19Da1SKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013020.outbound.protection.outlook.com
 [40.93.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D1D10E867;
 Thu, 13 Nov 2025 16:07:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4vWYByzNqH5bXIl1xL/SKiROVeZkcZzuyhoFJ/rVRkGPiFDLWiIeXATMRPwVngz6oney/TV1VJxct3WKlYx4VKVrJ6Bx+6PgF7so2PIB+Q5e3jcMWyueH6GfvGxaYTzYsWd9CEGAm1Utc9+djMyp4R2Yb0ksaPi4sjb3jZlrwlws7pp41K1Y+nyd8HtURg2eBVJfR9IYUsdFLlAHf7RkE0jal/uODDzxzdQxvuz+ghMLEXuwjXHcce535ExXnYVsq2CIBMOpOleffEXpIWcd+mWRFYDgLbBoidjhTWCfdGm1p0S5GNEBI9dEZRbtK7me1hI/TDRh3TZzjttjnX9EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Arn16Y64G9OzYaohJ9Lt4oZuQ32f64L5Ev6u3A4/Uhk=;
 b=acG6dzeKrbNSQin8K+y2m4XY0P2IXdeD0qP7cjtt49pHd0eX4ZujmutSOK0ceYemzMMIiq4eLa3Sis+xilQpwi9i2xhyvIWfS6BFTlv46M3s8btBC9ICiDwzzjQ5+3UZ+bonjBbh/DtObcNV3wi4i+z+S4eUiw2ZPS54yAE1Wf4dvyBwwxUmsL0vgqpwohsn/uY54qJh0I1QlOwJ3Uj6vrdrktBcRV7oWBAmgiKG97N2TW6wi8Xu3PP71oDvRpmcqfKUdHV231yfJLf6ZVRvERtLOcYBFaSr3QDhc/CO7ueN8wyD1ZFvnV4SgUJnvU6LuCj5RfmJknTnYfYsD1d/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Arn16Y64G9OzYaohJ9Lt4oZuQ32f64L5Ev6u3A4/Uhk=;
 b=19Da1SKBbN7GO09ILqZbKSZQS3K0mWqU/0OBWRHjzmJrNuS2sfM5icCSH13gayZs8tC/KMmDvgh+2E3hIAPV3k14CwTuI89rXVSvP286A3ROuVWaM0mQpY2MC9oU1lnG/fs52fXyDBtUPUxKQ5tzP4H6SRT3OX/sEMWmxU0MYDk=
Received: from CH2PR11CA0007.namprd11.prod.outlook.com (2603:10b6:610:54::17)
 by CH2PR12MB4279.namprd12.prod.outlook.com (2603:10b6:610:af::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:07:49 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::ec) by CH2PR11CA0007.outlook.office365.com
 (2603:10b6:610:54::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:07:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:07:49 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:07:46 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v2 02/20] drm/ttm: rework pipelined eviction fence handling
Date: Thu, 13 Nov 2025 17:05:43 +0100
Message-ID: <20251113160632.5889-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|CH2PR12MB4279:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d985290-40e5-40b2-f0cc-08de22cecaef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RMYPJPORhVubULN76edpdRSH6rbAEjG+SieIQ6urIJueGJaHaZaxnvEJBMaM?=
 =?us-ascii?Q?h2uReA/LUMwdu/55e0wIvr0Axy1f4INO4CmNq9fyMTVFQsmpDwfUNP7oOUgd?=
 =?us-ascii?Q?2J4FOCED7fmO/f2Mz2TR4TiU1G3LTQTSFUpOJs/tdIpHjMpVrL42RnwM8R56?=
 =?us-ascii?Q?zchRk7hu0FCzUPBi/yW1vgsWnTR7t366vGz8h0pxRl4VMp8wuPwitCuizYeP?=
 =?us-ascii?Q?aBI/Kz7+8J4ZfCFye5oPWW67+8T1lSVIOWAuX6Sd2o1HhL7AxMiLtPXjoyEI?=
 =?us-ascii?Q?76PjLvcMNAz2ToZ3jnPFKtxfV0sCGjdMnlvfdjNVeCzfcQpdllsogafU/kV0?=
 =?us-ascii?Q?t4Ny/fDCKK+mcbO29ndFVFG0hADQHVJpRLh+e/U06LvnBRvhQKrKZHVw+wIu?=
 =?us-ascii?Q?B0HmQ9JnYc4TGSb3xsIuIg2nliLZhWYbm/HFr4WGgNLGT3Jmq46tNI5BhurL?=
 =?us-ascii?Q?9MZqpvXVpnJNE7gO4eRQqQMdG84KzNvGASOn+H4bANGmC8fp996wnmHnMFh4?=
 =?us-ascii?Q?hsEfC8TI++/w59Z+z1TrAlYDv6VPqsso4D94JpVn65gA6zUYlfLZ2yfWeJs7?=
 =?us-ascii?Q?r0kb2j6V8hcXYfNOjyFJ0G8r/qssWSnkFEOqaeVztnUK5hqJi94fRsfBP2lG?=
 =?us-ascii?Q?IIzCjfKs3FCA8RWS8XsR69XAjmHyp6v74+XMKsN4FL7kQWUGTd2yMAAgp9+I?=
 =?us-ascii?Q?6XquSUuuS/9SWUjK8PW1dFGC91MOV9XEuTl/co+HBUGffxpgewRtbgOca6/J?=
 =?us-ascii?Q?hBDqjfJkNlO1XfQ+U/5nPtBF6F4+boRemJQ5/fKD1bjxnOV8E9kQE8rR2lwC?=
 =?us-ascii?Q?9H1diO9L0P08lcyU+EXHtgTjuxKoFLEKdhUHFCOgN2y0XYC221v/+vZYQuJP?=
 =?us-ascii?Q?gmhmo8UBx7Txul+eUi4IP9YejTs00/YnYIFieRDCBz1LhZ7xRlYZdzdNPE6+?=
 =?us-ascii?Q?YGQ3Ltx0O9lgo+7muNNfbVkcSIuyCoxqhotht7yPgN0svP+/gvBhEC+N27NO?=
 =?us-ascii?Q?gFINuTfcI+9RvfuVaGUGn//Smq5u+BE4u4yO1q6/zR6d+9uQfNXqDy1ODHIc?=
 =?us-ascii?Q?eECQMWlUz6HuXDe3Ro4NP3wv5xsYFHOeYpKVYiwIII1qrjiEDHTzejs6LWGR?=
 =?us-ascii?Q?W6jTfnvQ/dLnmZjcOQB8+kfxis6CY3XVyBy1oOqin2ZSftvOFnR2QFGfy5pM?=
 =?us-ascii?Q?f76cvW8pOUzztvy3WM83g1U/ofq4OGLhC6lbfvcaqLvsEgjanMLq60qVJjZ5?=
 =?us-ascii?Q?kLFegxhmRKzoDmTAy+iIrV21PU/JPdig4Hx6zHhSclBgA/Ca1Ae7G3iILwgg?=
 =?us-ascii?Q?ELHjInCKvqco/un86kFQzA3QMKOP7TnaorBsGCgvEUvs47Llb5dvFv4yI3R0?=
 =?us-ascii?Q?RoLfDEDTxjAN+3jIcIcTFVvlUP2jzgc5ocXuTWHgAMCvPof1OSnWIZIKf9/5?=
 =?us-ascii?Q?TbOQ16c58bdScMYV4Qh2PiTJqe3plcwE1Uwb3K+lPlUv5qZGseXqvwlCRK8h?=
 =?us-ascii?Q?PRw9RO7iZI3rbqtNBkD7gjVg8aWonqkJRGFTbd9tLXUG6GICjeOwi/fNsqMw?=
 =?us-ascii?Q?zNSvL16ChF64UOnbfYWgXpCBFOtsAcQhfBy0BvAp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:07:49.5986 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d985290-40e5-40b2-f0cc-08de22cecaef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4279
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
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  8 ++--
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 11 +++--
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 47 ++++++++++---------
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 38 ++++++++++++---
 drivers/gpu/drm/ttm/ttm_resource.c            | 31 +++++++-----
 include/drm/ttm/ttm_resource.h                | 29 ++++++++----
 7 files changed, 109 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 326476089db3..3b46a24a8c48 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2156,7 +2156,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	uint64_t size;
-	int r;
+	int r, i;
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
 	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
@@ -2190,8 +2190,10 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	} else {
 		drm_sched_entity_destroy(&adev->mman.high_pr);
 		drm_sched_entity_destroy(&adev->mman.low_pr);
-		dma_fence_put(man->move);
-		man->move = NULL;
+		for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
+			dma_fence_put(man->eviction_fences[i]);
+			man->eviction_fences[i] = NULL;
+		}
 	}
 
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
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

