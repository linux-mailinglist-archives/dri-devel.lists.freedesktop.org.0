Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30BFC5896A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:08:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A6E10E87C;
	Thu, 13 Nov 2025 16:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4+e+EbLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010008.outbound.protection.outlook.com [52.101.201.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6584610E878;
 Thu, 13 Nov 2025 16:08:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FM4mOYEClyGVNJrTT+0XWa6y06Z7MDmz0Noe+YQrSwzxQUTrTtbxOLfOZPN6iaI6yXGnB+n2ccBwFAO3oFC56dV6hR09WBOwpehKSjAHMaTSnFjXvQ1uHtqasvFM+3E1sRGg/CieSarsyov1pZOc9FaVK8h2AQWtScZ+tM1+E5Sr0GbRNGi0eGNsIQv/oQ1hbXM+f9cUYJk1KZtUdeBSAZNnQpnKuNP7Pbd8ZRTmDqaAXAD7dKOYq/FCeNaY9WvnLEls8gN+6i90VKzZ9YT3BP07LXBAn/PD3N9au36et5Hwg+7zkC/uZe1Qx/HWBvSkw556WTDmR5vgXSru2TYWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=do4B0eKXCEaWMnKHSNgdDCWe0OAb0N+B+LYHXTLlPXI=;
 b=Eq6NTNf13abFIDccHDFf1MwAPxA9zVcnSFwLHBh7s8NdegpE4ZDg/85GSFCsYrfgw7JStOaopduyYK768j1MnPYcK9cJfl+WPPfb3Eua+PdCdroqQzgsm8FJqEEfgbIx6lPbnjNx9mZBtRjoZHAgJRGLhcKesZH7UdPXB/P7HQ5yWz7RztU0nF+IfTRZrAk5XYT2RHDvRoOgRf+njFsXdduwI5dPmYiDLmfnPSc9oRI547bHCuxVrwiqIXC4Yku3W9gwTVGAPMXGjrhWoPGjj+5MwCGuoXv800+F4iQi+z4BLs8A5+rin2KgyUyuTfGnIe8/KBINLRodQJvCUyDr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=do4B0eKXCEaWMnKHSNgdDCWe0OAb0N+B+LYHXTLlPXI=;
 b=4+e+EbLh0MF1dWd1AWyrzwzKvGO7qgfvo5q8b0aNB9D/IzAxxWhAzdDrTMQ0hBbaXV2BIvTj2/qeU9rK1JMscCgN9JLNKhK0R4SNzZz4rs/brbpbMp7hKLRN56fihVUzyMkIsaOmWRGTKrhSFseopFELYO/SnxwCSFCy7lu7JIg=
Received: from CH0PR13CA0049.namprd13.prod.outlook.com (2603:10b6:610:b2::24)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:08:35 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::38) by CH0PR13CA0049.outlook.office365.com
 (2603:10b6:610:b2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Thu,
 13 Nov 2025 16:08:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:08:35 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:08:33 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 04/20] drm/amdgpu: introduce amdgpu_ttm_buffer_entity
Date: Thu, 13 Nov 2025 17:05:45 +0100
Message-ID: <20251113160632.5889-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bcce563-619d-4161-20e6-08de22cee64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bLGPpvHnz+UN+I4JG7H9E4aTJh/PVOAwRq8FtdQx+vek7pIyBlaRlo48ehyV?=
 =?us-ascii?Q?vBmy1xV5loyUaL/rV67e2ghQ0WtxyPW0eGu+ZJkmw7WO2ZFmPvUlvfOD0oaE?=
 =?us-ascii?Q?F6yKV8l6Qex4wj6eg6U3iE8w/5la1s2uvZam70Nd6YId/48MgoLsT6v4kHM3?=
 =?us-ascii?Q?/f+VkHQoTSXu2uzPA5apKOK16IQxRmXHh5DcQ1XO3+jlgOJ45/UDzrVcgxb7?=
 =?us-ascii?Q?HCVzsKHJX8YsJMcRdm+ck7/87K4+g7+QGK2R/54RBmEm/odnDu/4xGW1D9V2?=
 =?us-ascii?Q?9nDKMTH2kHsDW5eEjj6Rko/MuRA+L5eaXijaUG4/yVjBq65lo1i5OeBBSlu8?=
 =?us-ascii?Q?qEVZu67J9p9WJDPlGJjO6GTo8qB+FHMmC2GoihuXjJdGgWSCDcU6BsP8Bd/Z?=
 =?us-ascii?Q?ZkReJ4B5A0Gj+0L/l5VUws84i70RDrEBYi2zgVCnKwAW991ekeXWZzFxbFVG?=
 =?us-ascii?Q?bVOIxROz+boHwHb3Rq5YYPLkKHhDCS7K+K7wGVAGKuBei6bgyP4TTQMb1/dp?=
 =?us-ascii?Q?JWGfRGHKsiBLZoXwhoyAvYgCyM6h2QTmokSf6SCHjvqE0r+dk5oM3KqO87XO?=
 =?us-ascii?Q?NpAowpS/NQZ8cTj7RT/1vFu/SCEwZbux4/sGsYmLN1IleSc96pPFeogp+PDx?=
 =?us-ascii?Q?1cwV/PJ2RDuZNqejGqWX5hqyu+lh3F9hn6Y0FjFgAtBAlMOyUTWeZwTHBZ/k?=
 =?us-ascii?Q?RMABhO7PUFiAxjScb8RWiU9sdu9RicpSqGmriUWycchSpcNKTtuFq4RbveMf?=
 =?us-ascii?Q?Ft0VwJ1ErnO4nSzCwt4u7vZxSRn7o+iCfrY8fxPM+JghlK4uNDFEL/5Zq2AX?=
 =?us-ascii?Q?+5vXaLuiLHGSK4y7tNTBnpdnirI7A2Jlu4jtyAFX6cy/jOYcOA0fbTezZH1N?=
 =?us-ascii?Q?ZmdJNc6uLnlVJE2c2ttm71aSwWYvaIjkj/4759w3TvOVhxkSPeHA5ImvpDlf?=
 =?us-ascii?Q?KOeH0GdWrsdln/snnhGaagnLlGT2d5DeaSh3yU3XjkriVri8VpdixjNtjcij?=
 =?us-ascii?Q?/ae0ZTJrsFmQ/r0CzdiAUTnZVM/YNWDfX0RR5tvFpqrO6ezyyErgGSJViUYX?=
 =?us-ascii?Q?lVysJY7CbCJpxPwo1DMiVWONni7IA7I6cKjsxtYetT+YQFT2l/ZdAQuzMvW+?=
 =?us-ascii?Q?G7ls1Lb5vtcaw2nZ0JlA8uh34uNRMvsGNsWkpjKEOkpHEDRmwkZ8ElIjzlYS?=
 =?us-ascii?Q?+Rf/bfcPh+aYwH7ityiwOqTp4BeWrBCeb7sOasZ2/5GjHEidfJCMy2HpFUJM?=
 =?us-ascii?Q?TTGcJVIIGeIXvjUxLBa4NH6iRnUbzo5TZthknotD+e4z+HediobRj2otqaDT?=
 =?us-ascii?Q?7GRhM8eDStv55UTn5o0aKwngDeF6Gsd34cARtDMr5ikOLId1FCVNpAsOZybw?=
 =?us-ascii?Q?0WkJQDDOhS2PjKc/2Ud58uooByu/thY/Btu+YOdHb93AgSUkyUBVrAP9d/tE?=
 =?us-ascii?Q?9aVyl9O4qjITURffpL2cac9nosHlOWwjMoVy9VJChTImyxnxk8YeLyT7oHLL?=
 =?us-ascii?Q?WCPsVk2mIQhJeHLRb0N9WAfFT5FEREwHpzyX6r7t1Md8PzT/bGwjT8/X8M3+?=
 =?us-ascii?Q?i9l6YHalcfcDlcpOla8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:08:35.5011 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bcce563-619d-4161-20e6-08de22cee64c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269
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

No functional change for now, but this struct will have more
fields added in the next commit.

Technically the change introduces synchronisation issue, because
dependencies between successive jobs are not taken care of
properly. For instance, amdgpu_ttm_clear_buffer uses
amdgpu_ttm_map_buffer then amdgpu_ttm_fill_mem which use
different entities (default_entity then move/clear entity).
But it's all working as expected, because all entities use the
same sdma instance for now and default_entity has a higher prio
so its job always gets scheduler first.

The next commits will deal with these dependencies correctly.

---
v2: renamed amdgpu_ttm_buffer_entity
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 30 +++++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 12 ++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 13 ++++++----
 4 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 9dcf51991b5b..8e2d41c9c271 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -687,7 +687,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 * itself at least for GART.
 	 */
 	mutex_lock(&adev->mman.gtt_window_lock);
-	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.high_pr,
+	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
 				     &job, AMDGPU_KERNEL_JOB_ID_FLUSH_GPU_TLB);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c985f57fa227..42d448cd6a6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -224,7 +224,7 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
 
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
+	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4 + num_bytes,
 				     AMDGPU_IB_POOL_DELAYED, &job,
@@ -1486,7 +1486,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 		memcpy(adev->mman.sdma_access_ptr, buf, len);
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
+	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
 				     &job,
@@ -2168,7 +2168,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 
 		ring = adev->mman.buffer_funcs_ring;
 		sched = &ring->sched;
-		r = drm_sched_entity_init(&adev->mman.high_pr,
+		r = drm_sched_entity_init(&adev->mman.default_entity.base,
 					  DRM_SCHED_PRIORITY_KERNEL, &sched,
 					  1, NULL);
 		if (r) {
@@ -2178,18 +2178,30 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			return;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.low_pr,
+		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
+					  DRM_SCHED_PRIORITY_NORMAL, &sched,
+					  1, NULL);
+		if (r) {
+			dev_err(adev->dev,
+				"Failed setting up TTM BO clear entity (%d)\n",
+				r);
+			goto error_free_entity;
+		}
+
+		r = drm_sched_entity_init(&adev->mman.move_entity.base,
 					  DRM_SCHED_PRIORITY_NORMAL, &sched,
 					  1, NULL);
 		if (r) {
 			dev_err(adev->dev,
 				"Failed setting up TTM BO move entity (%d)\n",
 				r);
+			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 			goto error_free_entity;
 		}
 	} else {
-		drm_sched_entity_destroy(&adev->mman.high_pr);
-		drm_sched_entity_destroy(&adev->mman.low_pr);
+		drm_sched_entity_destroy(&adev->mman.default_entity.base);
+		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
+		drm_sched_entity_destroy(&adev->mman.move_entity.base);
 		for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
 			dma_fence_put(man->eviction_fences[i]);
 			man->eviction_fences[i] = NULL;
@@ -2207,7 +2219,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	return;
 
 error_free_entity:
-	drm_sched_entity_destroy(&adev->mman.high_pr);
+	drm_sched_entity_destroy(&adev->mman.default_entity.base);
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
@@ -2219,8 +2231,8 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 {
 	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
 	int r;
-	struct drm_sched_entity *entity = delayed ? &adev->mman.low_pr :
-						    &adev->mman.high_pr;
+	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
+						    &adev->mman.move_entity.base;
 	r = amdgpu_job_alloc_with_ib(adev, entity,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4, pool, job, k_job_id);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 50e40380fe95..d2295d6c2b67 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -52,6 +52,10 @@ struct amdgpu_gtt_mgr {
 	spinlock_t lock;
 };
 
+struct amdgpu_ttm_buffer_entity {
+	struct drm_sched_entity base;
+};
+
 struct amdgpu_mman {
 	struct ttm_device		bdev;
 	struct ttm_pool			*ttm_pools;
@@ -64,10 +68,10 @@ struct amdgpu_mman {
 	bool					buffer_funcs_enabled;
 
 	struct mutex				gtt_window_lock;
-	/* High priority scheduler entity for buffer moves */
-	struct drm_sched_entity			high_pr;
-	/* Low priority scheduler entity for VRAM clearing */
-	struct drm_sched_entity			low_pr;
+
+	struct amdgpu_ttm_buffer_entity default_entity;
+	struct amdgpu_ttm_buffer_entity clear_entity;
+	struct amdgpu_ttm_buffer_entity move_entity;
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 378af0b2aaa9..d74ff6e90590 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -45,7 +45,9 @@ svm_migrate_direct_mapping_addr(struct amdgpu_device *adev, u64 addr)
 }
 
 static int
-svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
+svm_migrate_gart_map(struct amdgpu_ring *ring,
+		     struct amdgpu_ttm_buffer_entity *entity,
+		     u64 npages,
 		     dma_addr_t *addr, u64 *gart_addr, u64 flags)
 {
 	struct amdgpu_device *adev = ring->adev;
@@ -63,7 +65,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = npages * 8;
 
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.high_pr,
+	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4 + num_bytes,
 				     AMDGPU_IB_POOL_DELAYED,
@@ -128,11 +130,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 {
 	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ttm_buffer_entity *entity;
 	u64 gart_s, gart_d;
 	struct dma_fence *next;
 	u64 size;
 	int r;
 
+	entity = &adev->mman.move_entity;
+
 	mutex_lock(&adev->mman.gtt_window_lock);
 
 	while (npages) {
@@ -140,10 +145,10 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 
 		if (direction == FROM_VRAM_TO_RAM) {
 			gart_s = svm_migrate_direct_mapping_addr(adev, *vram);
-			r = svm_migrate_gart_map(ring, size, sys, &gart_d, 0);
+			r = svm_migrate_gart_map(ring, entity, size, sys, &gart_d, 0);
 
 		} else if (direction == FROM_RAM_TO_VRAM) {
-			r = svm_migrate_gart_map(ring, size, sys, &gart_s,
+			r = svm_migrate_gart_map(ring, entity, size, sys, &gart_s,
 						 KFD_IOCTL_SVM_FLAG_GPU_RO);
 			gart_d = svm_migrate_direct_mapping_addr(adev, *vram);
 		}
-- 
2.43.0

