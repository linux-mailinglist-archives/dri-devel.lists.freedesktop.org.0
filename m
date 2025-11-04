Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A972FC2FF04
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41E910E557;
	Tue,  4 Nov 2025 08:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PkTWj1iE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013002.outbound.protection.outlook.com
 [40.107.201.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4ED10E556;
 Tue,  4 Nov 2025 08:36:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHbk5YXJ6eXxfJquHWjI6dyf0OsH1D8+YExjgszjYDvQKNpgeWrXcXDdqAPttuHgKI8sfZmvdidPBk8nCP8Ulr7ZLIMFpN/D0/FI7GtPpVBwfOSdQFcQ0u3ncVWZVoUll6u9BVncrLxuAkHS67XdRiCWq28+aZiDFD8HltgXrvc3sf6v7yOtSrKfnkdDfXOp6epWFjuguBIwuoZs1a1aFjYH8D4pjmBLxw2Ny2ezfJBNru+3oDB3NWIubF9Ih6hHWEGahc6NauRyuRPRtvVUTq0LRKi8r4P6140DWT4CjoNyVRc+8WgOiByPKr/GTtv+I6wVMBkR0HVK1jWaFF1qgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqHyP2BXeWWTgn4UCQcM/WRxDWQHZGNgEmt4w6IJLEA=;
 b=yDKNBbpjDEYNevyJWVJD8+ZTdVGVjdLKQ8vkhHTSwv/1ukb/dZEW3hVo5bHRbRPjsixiaLCUZbkF3zfYQTE7MXwKN08IjJ8BVvir3elwAPilKQCBi4kZcXtnlHkfs9SZo6iTlAf5osylrU7CueWE/qbMe9jj9kDJ5mCgjFD7j+IO52M9w+C6gEfkz585dRM7B0A8bKizjhOG865PZ7yLISYNTYdzOC6DnHd+ajm/AKN11iFO8VJxMJu+lY9i4oWkU7zB7YXxbA3fD1RYQ06nVMT0LN8wgY40+0clwIv3KYDyidVsw15S4L41KUeiNfbFQ7SSl08SMhBMyTi+9AEdRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqHyP2BXeWWTgn4UCQcM/WRxDWQHZGNgEmt4w6IJLEA=;
 b=PkTWj1iEXO1CuXyeVsgI+3eqvewvCECWWY/px6SrU3J56TAN9HZaRe1ComWLS3hSUTny2kr5Nohkkp5rdeZ2kFiOO2XD2zWc7Dw+Z84AvaDmDu8+PZ6V/EwStW8bpuN7gLbvsZp0OL2MW4t2NYXRe//z6DCY5aHexI1myd/BctQ=
Received: from MW4PR04CA0266.namprd04.prod.outlook.com (2603:10b6:303:88::31)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:36:30 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::45) by MW4PR04CA0266.outlook.office365.com
 (2603:10b6:303:88::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:30 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:27 -0800
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
Subject: [PATCH v1 02/20] drm/ttm: rework pipelined eviction fence handling
Date: Tue, 4 Nov 2025 09:35:17 +0100
Message-ID: <20251104083605.13677-3-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|MN2PR12MB4439:EE_
X-MS-Office365-Filtering-Correlation-Id: 913c8dd0-626d-4926-78e8-08de1b7d40f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jhf78C9gbKsivp8QRLH2nYmbCaQP9ZZbqny4SGUVsPxf9Rsc4W6sid3Sj7AU?=
 =?us-ascii?Q?P6gZ9A+Tw/oDHZ/emilmjO926pPdeY0WWJRtGNPYkhz1tU1TYkbeSYpZQhFY?=
 =?us-ascii?Q?ez9FF5tqnNGKJNNzngvJKrhj/DHQ0ovd+Kit9E4JuAufG6d4pXwdIOSMfvXv?=
 =?us-ascii?Q?rfWNWipIbkbms9sCUuJRwKqyYvTRV2KKikGChcr0k5+3cOG1mTBJ3dShk5GA?=
 =?us-ascii?Q?+Ceb9CAI3HGRovMrxXxHgF5uYR5NdYvOxwNB9Xs5MpYLoIA4At3vHSCXSUpC?=
 =?us-ascii?Q?Onld78yjUtLakqtb9UlCJfE/oxgGysTRqn7VLhmQMTCSodX7kBYcFSIZsdQS?=
 =?us-ascii?Q?yJuj7lBykwLgUXT4M0tbtYk4Aq/iwWiR+XIvBQIfsnnZew8+ioAWaBSm/D68?=
 =?us-ascii?Q?OfMXgZnUl0ZvLfAfh/290d/IzdnHlKsFabTyQdamepGhXzEjVElZ/5gXVn2f?=
 =?us-ascii?Q?UfCTtxa1Mc3vUr0z70otX3nxW235LFjby/OQBpIxKjcQphlFpEWsd1u7eAoy?=
 =?us-ascii?Q?FM2hmYOaqRm0Kp2CwLWPWhk/DAp7JDt0oOex3c1mQpPYSKGJAwZGFBI7GHJe?=
 =?us-ascii?Q?2bQx9aDkfylP+s7Qbec4GiNYs89nLiw0WK2mkxbafMdSHxxtMcKctocke7dV?=
 =?us-ascii?Q?3XlCzfL6Fhd3rn0bpqd+3OwJWDbCwt5JG2f64+H996bJfVRQ1k6zf4/tw+sy?=
 =?us-ascii?Q?hmQXeCiWOK7Ut8ONfIYQIr8kQdiwW3zryPz4Aipx2mS/8ZXeZYzpb1q2HHjc?=
 =?us-ascii?Q?KXekf4CQuTRZKIY59NqvMAZYacBI4MLcAugJTPUYeGr4KacK1JOtM1GG8980?=
 =?us-ascii?Q?ltnzwvJUz+CpLw7Y1u28qqtcM1JctWMDuq+E+doyqf6fixbwcvvVExvn0bZL?=
 =?us-ascii?Q?u2jKM4PBRDOdm2v9gmztYP4iJd5usw55a5A6kCmI03rzbMl7KYGa556gRt7B?=
 =?us-ascii?Q?oVxHluDQZzWOU2NgufEvOfQOl8Sh9xC0MNRYhBe1M8hv0XDiQHqNsOjFlSoU?=
 =?us-ascii?Q?JDONiZVDOwrcgLGMLAO0S0/QUJ4509kMZp1yWz9vp7APswbgyRtdYvaLPdbh?=
 =?us-ascii?Q?UfypjnKqWK5e+0uVEI62SaqprgCG38QzoafqhHjv9ho/4cVVSfW0D3Of9buq?=
 =?us-ascii?Q?1YkFRfOJKQfJ3mytQSLz/nKHAzLSIFn/ja8AAa7XOaWndJiFbo37o6CM2J+7?=
 =?us-ascii?Q?/1PFEpIDTZaeYMpiVfhInbWivEVJpKxszRRhbHnvGmXscZdYZPM0ynaTkyCt?=
 =?us-ascii?Q?7L1MM8LzW+QvlUw73z1T2me59ijIwF/3UAYqlxjydupbB2nhKmyEy0Dh1Mx+?=
 =?us-ascii?Q?jleEcQ0gQpesxPGQIsSaqlBPcKD/dn+EgRvou6E7z3ZjF1u3+PcJDrVpbuOr?=
 =?us-ascii?Q?84/A12rNzFiqOMafGSIFLaxgSorFIuZDrESpW5EwdDlL09LQHL6ft7oXVibF?=
 =?us-ascii?Q?rVTu/p4Lp/z7DeK/LJKavKbaUu5GWfQ6ZRI08vWd1VMOzRsVwb5SdWOmnXiW?=
 =?us-ascii?Q?F46dOV1q0aT6m82bwqXAyiIQaKffwVGMEZZ9FpTSJAMHiV4GqAiTkrjdO6sy?=
 =?us-ascii?Q?SsNavNQfVxIXABpwT9jzQdTd4jkmcbavQnSBaoAn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:30.6483 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 913c8dd0-626d-4926-78e8-08de1b7d40f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439
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

Lastly ttm_resource_manager.pipelined_eviction.n_fences is
initialized to 1, so the new behavior is opt-in.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  8 ++-
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 13 +++--
 drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  5 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  | 56 ++++++++++++-------
 drivers/gpu/drm/ttm/ttm_bo_util.c             | 36 ++++++++++--
 drivers/gpu/drm/ttm/ttm_resource.c            | 45 ++++++++++-----
 include/drm/ttm/ttm_resource.h                | 34 ++++++++---
 7 files changed, 139 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 326476089db3..c66f00434991 100644
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
+		for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
+			dma_fence_put(man->pipelined_eviction.fences[i]);
+			man->pipelined_eviction.fences[i] = NULL;
+		}
 	}
 
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
index 3148f5d3dbd6..1396674e1923 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
@@ -651,7 +651,8 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
 	int err;
 
 	man = ttm_manager_type(priv->ttm_dev, mem_type);
-	man->move = dma_fence_get_stub();
+	man->pipelined_eviction.n_fences = 1;
+	man->pipelined_eviction.fences[0] = dma_fence_get_stub();
 
 	bo = ttm_bo_kunit_init(test, test->priv, size, NULL);
 	bo->type = bo_type;
@@ -668,7 +669,7 @@ static void ttm_bo_validate_move_fence_signaled(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
 
 	ttm_bo_put(bo);
-	dma_fence_put(man->move);
+	dma_fence_put(man->pipelined_eviction.fences[0]);
 }
 
 static const struct ttm_bo_validate_test_case ttm_bo_validate_wait_cases[] = {
@@ -732,9 +733,10 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
 
 	spin_lock_init(&fence_lock);
 	man = ttm_manager_type(priv->ttm_dev, fst_mem);
-	man->move = alloc_mock_fence(test);
+	man->pipelined_eviction.n_fences = 1;
+	man->pipelined_eviction.fences[0] = alloc_mock_fence(test);
 
-	task = kthread_create(threaded_fence_signal, man->move, "move-fence-signal");
+	task = kthread_create(threaded_fence_signal, man->pipelined_eviction.fences[0], "move-fence-signal");
 	if (IS_ERR(task))
 		KUNIT_FAIL(test, "Couldn't create move fence signal task\n");
 
@@ -742,7 +744,8 @@ static void ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
 	err = ttm_bo_validate(bo, placement_val, &ctx_val);
 	dma_resv_unlock(bo->base.resv);
 
-	dma_fence_wait_timeout(man->move, false, MAX_SCHEDULE_TIMEOUT);
+	dma_fence_wait_timeout(man->pipelined_eviction.fences[0], false, MAX_SCHEDULE_TIMEOUT);
+	man->pipelined_eviction.fences[0] = NULL;
 
 	KUNIT_EXPECT_EQ(test, err, 0);
 	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size);
diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
index e6ea2bd01f07..6dfdf759a491 100644
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
+	for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++)
+		KUNIT_ASSERT_NULL(test, man->pipelined_eviction.fences[i]);
 
 	for (int i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		KUNIT_ASSERT_TRUE(test, list_empty(&man->lru[i]));
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f4d9e68b21e7..bc6d4a6c6d70 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -658,34 +658,48 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
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
+	struct dma_fence *fences_to_add[TTM_FENCES_MAX_SLOT_COUNT] = {};
 	struct dma_fence *fence;
-	int ret;
+	bool all_signaled = true, signaled;
+	int i, n = 0;
 
-	spin_lock(&man->move_lock);
-	fence = dma_fence_get(man->move);
-	spin_unlock(&man->move_lock);
+	spin_lock(&man->pipelined_eviction.lock);
+	for (i = 0; i < man->pipelined_eviction.n_fences; i++) {
+		fence = man->pipelined_eviction.fences[i];
+		if (!fence)
+			continue;
+		signaled = dma_fence_is_signaled(fence);
 
-	if (!fence)
+		if (signaled) {
+			dma_fence_put(man->pipelined_eviction.fences[i]);
+			man->pipelined_eviction.fences[i] = NULL;
+		} else {
+			all_signaled = false;
+			if (no_wait_gpu) {
+				spin_unlock(&man->pipelined_eviction.lock);
+				return -EBUSY;
+			}
+			fences_to_add[n++] = dma_fence_get(fence);
+		}
+	}
+	spin_unlock(&man->pipelined_eviction.lock);
+
+	if (all_signaled)
 		return 0;
 
-	if (no_wait_gpu) {
-		ret = dma_fence_is_signaled(fence) ? 0 : -EBUSY;
-		dma_fence_put(fence);
-		return ret;
+	for (i = 0; i < n; i++) {
+		dma_resv_add_fence(bo->base.resv, fences_to_add[i], DMA_RESV_USAGE_KERNEL);
+		dma_fence_put(fences_to_add[i]);
 	}
 
-	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
-
-	ret = dma_resv_reserve_fences(bo->base.resv, 1);
-	dma_fence_put(fence);
-	return ret;
+	return dma_resv_reserve_fences(bo->base.resv, TTM_FENCES_MAX_SLOT_COUNT);
 }
 
 /**
@@ -718,7 +732,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 	int i, ret;
 
 	ticket = dma_resv_locking_ctx(bo->base.resv);
-	ret = dma_resv_reserve_fences(bo->base.resv, 1);
+	ret = dma_resv_reserve_fences(bo->base.resv, TTM_FENCES_MAX_SLOT_COUNT);
 	if (unlikely(ret))
 		return ret;
 
@@ -757,7 +771,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
 				return ret;
 		}
 
-		ret = ttm_bo_add_move_fence(bo, man, ctx->no_wait_gpu);
+		ret = ttm_bo_add_pipelined_eviction_fences(bo, man, ctx->no_wait_gpu);
 		if (unlikely(ret)) {
 			ttm_resource_free(bo, res);
 			if (ret == -EBUSY)
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index acbbca9d5c92..ada8af965acf 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -258,7 +258,7 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	ret = dma_resv_trylock(&fbo->base.base._resv);
 	WARN_ON(!ret);
 
-	ret = dma_resv_reserve_fences(&fbo->base.base._resv, 1);
+	ret = dma_resv_reserve_fences(&fbo->base.base._resv, TTM_FENCES_MAX_SLOT_COUNT);
 	if (ret) {
 		dma_resv_unlock(&fbo->base.base._resv);
 		kfree(fbo);
@@ -646,6 +646,8 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
 {
 	struct ttm_device *bdev = bo->bdev;
 	struct ttm_resource_manager *from;
+	struct dma_fence *tmp;
+	int i, free_slot = -1;
 
 	from = ttm_manager_type(bdev, bo->resource->mem_type);
 
@@ -653,13 +655,35 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
 	 * BO doesn't have a TTM we need to bind/unbind. Just remember
 	 * this eviction and free up the allocation
 	 */
-	spin_lock(&from->move_lock);
-	if (!from->move || dma_fence_is_later(fence, from->move)) {
-		dma_fence_put(from->move);
-		from->move = dma_fence_get(fence);
+	spin_lock(&from->pipelined_eviction.lock);
+	for (i = 0; i < from->pipelined_eviction.n_fences; i++) {
+		tmp = from->pipelined_eviction.fences[i];
+		if (!tmp) {
+			if (free_slot < 0)
+				free_slot = i;
+			continue;
+		}
+		if (fence->context != tmp->context)
+			continue;
+		if (dma_fence_is_later(fence, tmp)) {
+			dma_fence_put(tmp);
+			free_slot = i;
+			break;
+		}
+		goto unlock;
+	}
+	if (free_slot >= 0) {
+		from->pipelined_eviction.fences[free_slot] = dma_fence_get(fence);
+	} else {
+		WARN(1, "not enough fence slots for all fence contexts");
+		spin_unlock(&from->pipelined_eviction.lock);
+		dma_fence_wait(fence, false);
+		goto end;
 	}
-	spin_unlock(&from->move_lock);
 
+unlock:
+	spin_unlock(&from->pipelined_eviction.lock);
+end:
 	ttm_resource_free(bo, &bo->resource);
 }
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index e2c82ad07eb4..ae0d4621cc55 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -523,14 +523,19 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
 {
 	unsigned i;
 
-	spin_lock_init(&man->move_lock);
 	man->bdev = bdev;
 	man->size = size;
 	man->usage = 0;
 
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
 		INIT_LIST_HEAD(&man->lru[i]);
-	man->move = NULL;
+	spin_lock_init(&man->pipelined_eviction.lock);
+	for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++)
+		man->pipelined_eviction.fences[i] = NULL;
+	/* Can be overridden by drivers that wants to use more than 1 entity
+	 * for moves and evictions (limited to TTM_FENCES_MAX_SLOT_COUNT).
+	 */
+	man->pipelined_eviction.n_fences = 1;
 }
 EXPORT_SYMBOL(ttm_resource_manager_init);
 
@@ -551,7 +556,7 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
 		.no_wait_gpu = false,
 	};
 	struct dma_fence *fence;
-	int ret;
+	int ret, i;
 
 	do {
 		ret = ttm_bo_evict_first(bdev, man, &ctx);
@@ -561,18 +566,32 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
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
-	}
+	do {
+		fence = NULL;
 
-	return 0;
+		spin_lock(&man->pipelined_eviction.lock);
+		for (i = 0; i < man->pipelined_eviction.n_fences; i++) {
+			fence = man->pipelined_eviction.fences[i];
+			man->pipelined_eviction.fences[i] = NULL;
+			if (fence)
+				break;
+		}
+		spin_unlock(&man->pipelined_eviction.lock);
+
+		if (fence) {
+			ret = dma_fence_wait(fence, false);
+			dma_fence_put(fence);
+
+			if (ret)
+				break;
+		} else {
+			break;
+		}
+	} while (1);
+
+	return ret;
 }
 EXPORT_SYMBOL(ttm_resource_manager_evict_all);
 
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index f49daa504c36..898c429b37ad 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -50,6 +50,15 @@ struct io_mapping;
 struct sg_table;
 struct scatterlist;
 
+/**
+ * define TTM_FENCES_MAX_SLOT_COUNT - How many entities can be used for evictions
+ *
+ * Pipelined evictions can be spread on multiple entities. This
+ * is the max number of entities that can be used by the driver
+ * for that purpose.
+ */
+#define TTM_FENCES_MAX_SLOT_COUNT 8
+
 /**
  * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
  */
@@ -180,8 +189,10 @@ struct ttm_resource_manager_func {
  * @size: Size of the managed region.
  * @bdev: ttm device this manager belongs to
  * @func: structure pointer implementing the range manager. See above
- * @move_lock: lock for move fence
- * @move: The fence of the last pipelined move operation.
+ * @pipelined_eviction.lock: lock for eviction fences
+ * @pipelined_eviction.n_fences: The number of fences allowed in the array. If
+ * 0, pipelined evictions aren't used.
+ * @pipelined_eviction.fences: The fences of the last pipelined move operation.
  * @lru: The lru list for this memory type.
  *
  * This structure is used to identify and manage memory types for a device.
@@ -195,12 +206,15 @@ struct ttm_resource_manager {
 	struct ttm_device *bdev;
 	uint64_t size;
 	const struct ttm_resource_manager_func *func;
-	spinlock_t move_lock;
 
-	/*
-	 * Protected by @move_lock.
+	/* This is very similar to a dma_resv object, but locking rules make
+	 * it difficult to use a it in this context.
 	 */
-	struct dma_fence *move;
+	struct {
+		spinlock_t lock;
+		int n_fences;
+		struct dma_fence *fences[TTM_FENCES_MAX_SLOT_COUNT];
+	} pipelined_eviction;
 
 	/*
 	 * Protected by the bdev->lru_lock.
@@ -421,8 +435,12 @@ static inline bool ttm_resource_manager_used(struct ttm_resource_manager *man)
 static inline void
 ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
 {
-	dma_fence_put(man->move);
-	man->move = NULL;
+	int i;
+
+	for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
+		dma_fence_put(man->pipelined_eviction.fences[i]);
+		man->pipelined_eviction.fences[i] = NULL;
+	}
 }
 
 void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
-- 
2.43.0

