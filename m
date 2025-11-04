Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43553C2FF46
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E05410E56F;
	Tue,  4 Nov 2025 08:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kYfuVbJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B62810E562;
 Tue,  4 Nov 2025 08:36:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUtvTT5RdP5zENOEtEuDxbC5uR/IoU+G/Lmx9nleZK5BBzRZGiA2VpSxv1D9i6snr6QxHhPbBYr2dFxGVsLAmOD1cuNd5u4fHlSnxc/0H0ezyHhJXp9aG66R2YOm7mxtfml+/kFdFZQ7D/D2LFge7NRn9g6UMeSJhXqLd3QrUrWJuUzlb2+nZN8QJsNbEI+W5Bu0NxoUbUnyFa7A1Y3cIJq6VhCufIuCXV+B+ha4+VTFKXuwnZS3EfZPG938ecjoj1hE3WpPv9WCYWyt/wNbySMA0i6rDteoOLKeK6XUKvNbBJeEUw+6G06CglucMNkeu9fz67fCoevmmphjW57LfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gwl3vuwFEWqahj6ILr4Oy9tEKiXFK5AipYlmTG9CLWQ=;
 b=d/Ztab2STfvCgRLkqWh/z0LuquoWa+RH8qsgtj5XaQEBAuKmNgPjpzPfJlemHJG+QUhue3tPVi4Bp7jyfjt9T8bBaQeuGRNWhgqvbn8kuBpk6R3PXzPBx0vKB/5Z6gGTI1yqUZjZt8GB31cH3ZSPlYSNXbX3bVqftR/NKKFZOxmUazTpnT/ILI9yBD0vsoT7TY0bkuHkbnjzPCAxUV0/7wmbgwaHnXATMk52rHV0WdaeGvgqK3Dk0U0Co1kiJZNgr66wF8KbWHqO+c+XYqeGrvAvZNNbHGpd8R7HtWsae54UshzC9luCoJwDWxQRttkjxsCdfiW9Qdj9jzD/WYB6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gwl3vuwFEWqahj6ILr4Oy9tEKiXFK5AipYlmTG9CLWQ=;
 b=kYfuVbJo4XG+PQ0O30tp8narJcY4gubRPmA9S9LzTW9pHGL82Wcx6ZdxEnunRfGNx3GPXtH+1SatEzC0e65R1zYRmY0B5UGNwpmZcq6vkmJgje0C7SrOmo/YKH7bT9gYILqn6/aX/axp4Y32Qe0B5No4CAjkVAiJkJSTOogSX98=
Received: from MW4PR04CA0252.namprd04.prod.outlook.com (2603:10b6:303:88::17)
 by DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:36:44 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::59) by MW4PR04CA0252.outlook.office365.com
 (2603:10b6:303:88::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:36:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:43 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:41 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 07/20] drm/amdgpu: allocate multiple clear entities
Date: Tue, 4 Nov 2025 09:35:22 +0100
Message-ID: <20251104083605.13677-8-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|DM6PR12MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: c61f2ad0-b463-4bbb-bc82-08de1b7d48aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H4k3B3WXv8mEA9I+7exn8OFs2y6Ci0Y0odoeHA3PrlzTKjYyShIroPtHw0wq?=
 =?us-ascii?Q?iA7mOmaCylY0Mk338n89KE+YS1q8HfIpcYn7EsMZP6mUchsMKWOQug/mq50R?=
 =?us-ascii?Q?iuoX2mq7KVObjVZb2YD+K/FDq2cBUK/MXdIIbWyxGZdy5OgKE0ZnnbiuJOhL?=
 =?us-ascii?Q?TgoP5HgOh0T8s6Gu/LnNmgBF8d/bI9jfWeUo/q1CH4WLIbbUT92E4Xm+meRv?=
 =?us-ascii?Q?F6ZOle7/uBKH5st4ePNIIRx9rQoGpQFlWKHEjFTPjd4GFQyy9jviUkRPV1aw?=
 =?us-ascii?Q?/M3mO8Xd/pOa+rvZEIdLNI6hL6oEGO3k9AOSf1NCz0PJerTbmzX5pLR7tw18?=
 =?us-ascii?Q?wbszV58CajoUtUuWa6DypKKcKUu0qxp1C3qmekNGA2sR1ynRE5Qde2XAqzEA?=
 =?us-ascii?Q?gNkogMjgRmvoJB0QHal+zPTDicXXWOT/uH9c/tCJLZdmPShzSuW1VFf8H2jS?=
 =?us-ascii?Q?ZYmKzWW/FQwz8C/mMUv+ciQHO95h+V5GSu1IlodXYu/JePdbA8eFuSTovw2h?=
 =?us-ascii?Q?92rAdHunF8XUTbzFDXTI1n5Vdqs70FDW1Rd9WJ4UvyeVQkmA2azsaukXbFgX?=
 =?us-ascii?Q?2k47dE6NOoaQMm12pPbdusEAkbeenv0kO1iA5dFugLIXARzIXbhkjIuTFxwt?=
 =?us-ascii?Q?Om7D4IhaATP1ERVGksmwVId2xBOIyWDkMMolovaQQFuZJJw6c8WtvONnKSNa?=
 =?us-ascii?Q?lXdSB46r791d2dNtDyNkarwckRKvkf4eIcCdRu4hbqX1ZJ6/PlaeL/h0eDtG?=
 =?us-ascii?Q?lLSBIqXWaqn8C6d6F+cAWLAWkV9ZmL8YmUPIRSuiXtZpisAyxW8CLtVNpg+e?=
 =?us-ascii?Q?CQee3TmPFNkMQoDNQO5Q38zXNhzCE7Fx7cwA0jRpMnL42tbXarOFRTiHa9wl?=
 =?us-ascii?Q?kdneD+/zL2ElgvzNPrOVsXDUf4AJlYNjaMSdkYtamOVwh3A2+RExv5LQrg/6?=
 =?us-ascii?Q?L2sHGDiT4ewA7NxaMw9wFV9AFRIeZQNkyPbQvVAsEe675zv+Q13lVaswMWtE?=
 =?us-ascii?Q?NGutVHDyCHBZpHR4gIXSae4Ue5Ay98UO6QG+JsRRmzQyRhEO/QdbkdfpWa1J?=
 =?us-ascii?Q?nx3dC6v0nE0eqQSNLo9KzRcmkgzui3TPICkVUOWaSkKmXFNEYNwMHQ+mIiqd?=
 =?us-ascii?Q?24+DWm7uOR2Lw+th/qlacYD5ng1AI2J+G12+Uao6s1zKRqDYZSv/TEJkBmel?=
 =?us-ascii?Q?6ST5BpSG4wkVkS5Nq5IXlDT4aucSg+cA2ywYiz0ss0D3zuMKC9HL4rL7JfMI?=
 =?us-ascii?Q?bsUHg7MWrihpl0QZ0OBbeQIAw0vWaQuHAI8Syz+uWPjbFJVhZYijJkVzWQT/?=
 =?us-ascii?Q?7b+wbkViM37mKWOn3U2S1zaxUE3eBg8tDu5wuMhMCNpElg8uT2GcU+3bh/Om?=
 =?us-ascii?Q?Ur1RVBQUfFS7wndsa5e6Sme5EjNUEkOsPzXaiZ0rNEuWAnRfFJuRWm0J/6n0?=
 =?us-ascii?Q?lLruBLyqn7aYXig5lxKZ1lBnh8QGAVTDRZWcb1wyY9JEFVg3+1iS39clMXxD?=
 =?us-ascii?Q?a/pWXWQv8/Z9XIXVCiQ87r8azwAAf/WVd9Xg95LttCAoy93r7sox/rhQl1VZ?=
 =?us-ascii?Q?498ijP+IrVdv0MWrTkU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:43.5859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c61f2ad0-b463-4bbb-bc82-08de1b7d48aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4481
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

No functional change for now, as we always use entity 0.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c     | 11 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 76 +++++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     | 10 +--
 5 files changed, 66 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 2a444d02cf4b..e73dcfed5338 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -655,7 +655,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
 	struct dma_fence *fence;
 	struct amdgpu_job *job;
-	int r;
+	int r, i;
 
 	if (!hub->sdma_invalidation_workaround || vmid ||
 	    !adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
@@ -686,8 +686,9 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 * translation. Avoid this by doing the invalidation from the SDMA
 	 * itself at least for GART.
 	 */
-	mutex_lock(&adev->mman.clear_entity.gart_window_lock);
 	mutex_lock(&adev->mman.move_entity.gart_window_lock);
+	for (i = 0; i < adev->mman.num_clear_entities; i++)
+		mutex_lock(&adev->mman.clear_entities[i].gart_window_lock);
 	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
@@ -701,7 +702,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	fence = amdgpu_job_submit(job);
 	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
-	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
+	for (i = 0; i < adev->mman.num_clear_entities; i++)
+		mutex_unlock(&adev->mman.clear_entities[i].gart_window_lock);
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
@@ -710,7 +712,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 
 error_alloc:
 	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
-	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
+	for (i = 0; i < adev->mman.num_clear_entities; i++)
+		mutex_unlock(&adev->mman.clear_entities[i].gart_window_lock);
 	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 0760e70402ec..3771e89035f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -269,10 +269,12 @@ static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
  *
  * @adev: amdgpu_device pointer
  * @gtt_size: maximum size of GTT
+ * @reserved_windows: num of already used windows
  *
  * Allocate and initialize the GTT manager.
  */
-int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
+int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size,
+			u32 reserved_windows)
 {
 	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
@@ -283,7 +285,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 
 	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
 
-	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
+	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * reserved_windows;
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index c06c132a753c..e7b2cae031b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1321,7 +1321,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(&adev->mman.clear_entity, abo, 0, &bo->base._resv,
+	r = amdgpu_fill_buffer(&adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
 			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3a77eea8869d..e0e469b73013 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1891,6 +1891,7 @@ static void amdgpu_ttm_mmio_remap_bo_fini(struct amdgpu_device *adev)
 int amdgpu_ttm_init(struct amdgpu_device *adev)
 {
 	uint64_t gtt_size;
+	u32 gart_window;
 	int r;
 
 	dma_set_max_seg_size(adev->dev, UINT_MAX);
@@ -1923,7 +1924,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	}
 
 	/* Change the size here instead of the init above so only lpfn is affected */
-	amdgpu_ttm_set_buffer_funcs_status(adev, false);
+	gart_window = amdgpu_ttm_set_buffer_funcs_status(adev, false);
 #ifdef CONFIG_64BIT
 #ifdef CONFIG_X86
 	if (adev->gmc.xgmi.connected_to_cpu)
@@ -2019,7 +2020,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	}
 
 	/* Initialize GTT memory pool */
-	r = amdgpu_gtt_mgr_init(adev, gtt_size);
+	r = amdgpu_gtt_mgr_init(adev, gtt_size, gart_window);
 	if (r) {
 		dev_err(adev->dev, "Failed initializing GTT heap.\n");
 		return r;
@@ -2158,16 +2159,22 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
  *
  * Enable/disable use of buffer functions during suspend/resume. This should
  * only be called at bootup or when userspace isn't running.
+ *
+ * Returns: the number of GART reserved window
  */
-void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
+u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	uint64_t size;
-	int r, i;
+	int r, i, j;
+	u32 num_clear_entities, windows, w;
+
+	num_clear_entities = adev->sdma.num_instances;
+	windows = adev->gmc.is_app_apu ? 0 : (2 + num_clear_entities);
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
 	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
-		return;
+		return windows;
 
 	if (enable) {
 		struct amdgpu_ring *ring;
@@ -2180,19 +2187,9 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 					  1, NULL);
 		if (r) {
 			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n",
+				"Failed setting up TTM BO eviction entity (%d)\n",
 				r);
-			return;
-		}
-
-		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
-					  DRM_SCHED_PRIORITY_NORMAL, &sched,
-					  1, NULL);
-		if (r) {
-			dev_err(adev->dev,
-				"Failed setting up TTM BO clear entity (%d)\n",
-				r);
-			goto error_free_entity;
+			return 0;
 		}
 
 		r = drm_sched_entity_init(&adev->mman.move_entity.base,
@@ -2202,26 +2199,51 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			dev_err(adev->dev,
 				"Failed setting up TTM BO move entity (%d)\n",
 				r);
-			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 			goto error_free_entity;
 		}
 
+		adev->mman.num_clear_entities = num_clear_entities;
+		adev->mman.clear_entities = kcalloc(num_clear_entities,
+						    sizeof(struct amdgpu_ttm_entity),
+						    GFP_KERNEL);
+		if (!adev->mman.clear_entities)
+			goto error_free_entity;
+
+		for (i = 0; i < num_clear_entities; i++) {
+			r = drm_sched_entity_init(&adev->mman.clear_entities[i].base,
+						  DRM_SCHED_PRIORITY_NORMAL, &sched,
+						  1, NULL);
+			if (r) {
+				for (j = 0; j < i; j++)
+					drm_sched_entity_destroy(
+						&adev->mman.clear_entities[j].base);
+				kfree(adev->mman.clear_entities);
+				goto error_free_entity;
+			}
+		}
+
 		/* Statically assign GART windows to each entity. */
+		w = 0;
 		mutex_init(&adev->mman.default_entity.gart_window_lock);
-		adev->mman.move_entity.gart_window_id0 = 0;
-		adev->mman.move_entity.gart_window_id1 = 1;
+		adev->mman.move_entity.gart_window_id0 = w++;
+		adev->mman.move_entity.gart_window_id1 = w++;
 		mutex_init(&adev->mman.move_entity.gart_window_lock);
-		/* Clearing entity doesn't use id0 */
-		adev->mman.clear_entity.gart_window_id1 = 2;
-		mutex_init(&adev->mman.clear_entity.gart_window_lock);
+		for (i = 0; i < num_clear_entities; i++) {
+			/* Clearing entities don't use id0 */
+			adev->mman.clear_entities[i].gart_window_id1 = w++;
+			mutex_init(&adev->mman.clear_entities[i].gart_window_lock);
+		}
+		WARN_ON(w != windows);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
-		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 		drm_sched_entity_destroy(&adev->mman.move_entity.base);
+		for (i = 0; i < num_clear_entities; i++)
+			drm_sched_entity_destroy(&adev->mman.clear_entities[i].base);
 		for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
 			dma_fence_put(man->pipelined_eviction.fences[i]);
 			man->pipelined_eviction.fences[i] = NULL;
 		}
+		kfree(adev->mman.clear_entities);
 	}
 
 	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
@@ -2232,10 +2254,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	man->size = size;
 	adev->mman.buffer_funcs_enabled = enable;
 
-	return;
+	return windows;
 
 error_free_entity:
 	drm_sched_entity_destroy(&adev->mman.default_entity.base);
+	return 0;
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
@@ -2388,8 +2411,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 
 	if (!fence)
 		return -EINVAL;
-
-	entity = &adev->mman.clear_entity;
+	entity = &adev->mman.clear_entities[0];
 	*fence = dma_fence_get_stub();
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 8b7a56737479..e7ada4605472 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -39,7 +39,6 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
@@ -73,8 +72,9 @@ struct amdgpu_mman {
 	struct mutex				gtt_window_lock;
 
 	struct amdgpu_ttm_entity default_entity; /* has no gart windows */
-	struct amdgpu_ttm_entity clear_entity;
 	struct amdgpu_ttm_entity move_entity;
+	struct amdgpu_ttm_entity *clear_entities;
+	u32 num_clear_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
@@ -134,7 +134,7 @@ struct amdgpu_copy_mem {
 #define AMDGPU_COPY_FLAGS_GET(value, field) \
 	(((__u32)(value) >> AMDGPU_COPY_FLAGS_##field##_SHIFT) & AMDGPU_COPY_FLAGS_##field##_MASK)
 
-int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size);
+int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size, u32 reserved_windows);
 void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev);
 int amdgpu_preempt_mgr_init(struct amdgpu_device *adev);
 void amdgpu_preempt_mgr_fini(struct amdgpu_device *adev);
@@ -168,8 +168,8 @@ bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
 
 int amdgpu_ttm_init(struct amdgpu_device *adev);
 void amdgpu_ttm_fini(struct amdgpu_device *adev);
-void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
-					bool enable);
+u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
+				       bool enable);
 int amdgpu_copy_buffer(struct amdgpu_ring *ring,
 		       struct drm_sched_entity *entity,
 		       uint64_t src_offset,
-- 
2.43.0

