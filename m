Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67AC5897F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB09310E881;
	Thu, 13 Nov 2025 16:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WtEkG8vt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047BD10E881;
 Thu, 13 Nov 2025 16:09:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ea4drXt46hlhOy7yEfujxODWYW9yagz2zA81woE1FtZ/KAyqTyRMgaAcCsyXBpB1jNG2Ja0ZbUwhEJWjboJQXFiwXPKE1c6TqtdTwCV+vXuJdabeVu87vjjLWaSH15t9mV+zlHm9USyLJGBi00vTAR1JtVFoVirFRNfATy5biGByNaY37C1ps8iwBZOlAKCKJbf9C14Tyo0jKXA0QBH2+JnK0U0G/yTKERoAh4YGxfLNxyrocf2hqPmiP4szhiOuYYkZTgeme1hFqS5sJwkph5sfsPEf0t153SNFwrmNPdnc44xcKEGkiWP73zJGDvtV64NBClibJTf1hfLwe2drCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSb0AfU6whGZpzANyOEjI7vsUTXGJ3qQKVKdFC/gtFs=;
 b=k3B0SieIXcMGQlXa4raZMbvcNuJ5QNXMumB4qSrsZc5nN+OwEZqTjZwK8kY96XuPGkTieGgzBdsbhMQFgUAjHCcXXJrPVmobUlkAmP8VWePro4EEsBzyLor8oH75CzAwCUvN5CaVEDSPqPeOWopHTA2qqu6z2rQFsBFZ9Os3B0CdaoDJ1rJdgORGXInWlUWwLwJ7MAEUtymuVIP+Mob21UafyEvtoWA3LMhL6UAKsFOWcFfgsYcluZmbfVw2dYB6C34m6ZU+ZgYjztyFmrYTtd2SNtVq8heEcustZlwGlN0+cH7p6YMDwLHvjRs8PIbqSPo5Erxm7wEVwLMtAQGQwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSb0AfU6whGZpzANyOEjI7vsUTXGJ3qQKVKdFC/gtFs=;
 b=WtEkG8vti+y5qQDG2ZxYCAInw/Ek8CLtPcrHxrTpImHuClIMuEcG2niaqF2LfsbDlDFDhkdI1TGbRJo6TCtlmYYMxD5++7ETIMDSx/tyNoLq3w40eCJH9B54NEIXOO2gLQm33dUFHva4o/nollmrvT5N4DhYAKjD3J+FZ/mQgBw=
Received: from CH5PR05CA0024.namprd05.prod.outlook.com (2603:10b6:610:1f0::29)
 by DM6PR12MB4089.namprd12.prod.outlook.com (2603:10b6:5:213::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:09:21 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::84) by CH5PR05CA0024.outlook.office365.com
 (2603:10b6:610:1f0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Thu,
 13 Nov 2025 16:09:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:09:21 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:09:19 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 07/20] drm/amdgpu: allocate multiple clear entities
Date: Thu, 13 Nov 2025 17:05:48 +0100
Message-ID: <20251113160632.5889-8-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|DM6PR12MB4089:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee39ade-992d-4c24-8be9-08de22cf01d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IOXe3qyhwOse05vZAM4oHLUURdTlcuEVSrWeEMrgjh6nm0BX81Ln83Av1UIr?=
 =?us-ascii?Q?SdJ2gL/lCu+kcnOA7E3dZwf3/uMM3ly73SopRKa46RnpCl2Ay33B/oZYti8l?=
 =?us-ascii?Q?V5vVNf48As8i299eF+47PphNqiS7duRGQn4Rb6kr863V7dLXWPGiy5p8hIar?=
 =?us-ascii?Q?sUXNzTmBPZBsyF2sB1QXiIoyXhc5tFcPzrD7jkotiF4VSg4xHtW+SLWBhh+p?=
 =?us-ascii?Q?MNsLyZSbBJoAn7QYJNCTknG4sZrZOfNK9jKSZXslk0UbdJjvXVZn8WNxmQ8t?=
 =?us-ascii?Q?bvH7v9pczoFuaSokDl5vM8t1MHHVKEU1Q72uePwTP6re+rAmmmrjDOp+6L6t?=
 =?us-ascii?Q?EfS8QPNM7iPvB4PZVTVV7cPE0193PRNJy4cHgy0n11pb8f0rkXOEvb7JxOlE?=
 =?us-ascii?Q?SvQycL5hgpdhWjMF4Php8Matd4Mr/YRyWE27DepZMx7qQfxzYfYP+glGhsAF?=
 =?us-ascii?Q?5VGF1+K8sPVv0xU4Hu7PDFFS94ZKJ1prneTICdmIgIZURRZVZWwKuosq+lUJ?=
 =?us-ascii?Q?3EfEkVm9h4f2hiuoT4Pogz0p31Q6meftRxtGg299NEgr5dRm1LNOS582yrZS?=
 =?us-ascii?Q?se1ei3rP7BU83KTstrIbWyrjB1sCxDjGUrBb7XtwMuoWCwIkCoZhzJPh22Dl?=
 =?us-ascii?Q?0TJcDuqzwByDUwshUF2D5WK2BRZAx4lmVT+dOzSvKD+Wtp8AXXkxHeGsDSex?=
 =?us-ascii?Q?7arAdk32sEjle+GiqbbUMDIqB+0YLPgrcOeYjSE6jUG69caNN4LIFZoMh8YO?=
 =?us-ascii?Q?GyXliEuHGVUaVvD9RhdoTfM4K24k34beiHvK8lwqFogUUrQIg5fCeADlBptL?=
 =?us-ascii?Q?YM/mygHVTGxxSPWZ0XJmJs7UGRtdCLGeOneiKllxgpo/LhkRms9ounLA5khM?=
 =?us-ascii?Q?8YNvltao5K6aKbQhxKG8s1u45gP8mOZgHGIjvGfycn0sJt78m/Tvn1kd2s/r?=
 =?us-ascii?Q?Sl379anwxzeWGOlbk5/fwp7MJcIfNSxolybnwWeOPeqxZmQUtaLzFtp5jmdo?=
 =?us-ascii?Q?1DqsG4q7e1Hku0SJV9bhtyqz5cWHe1//q711RVwodoIljAeimTgzqvPhNQ6z?=
 =?us-ascii?Q?mCF/oNktGHQtlXBSI56BjHVKOMkkq5d53UEhhzFvwTrCI46aruEeR4gkDxT2?=
 =?us-ascii?Q?MjzDaFXyi251pkO5+xO8ctVUOBpbpYJhF3A7j8xaZ9Op/CoEe7o0ZMS/BBvY?=
 =?us-ascii?Q?KBR+F1nM+bKN/gdUiD2bFdsHy0b8OxYAyeWMd3XIZwuBrWc5NwKpylauQwxI?=
 =?us-ascii?Q?/hNQXjfImSbNNtVP/ms47O7hHqMht9eEyGteSsWkseUKPlGHQQe0gEquuGTr?=
 =?us-ascii?Q?10RJvpGZ3577FyBCx+SdL2tT2DPGrNXB+2NupdseR5/5T6OD2UsHvaK5szxd?=
 =?us-ascii?Q?V6LG3JI1nLzn1PQBQLU7EOuAGMLzZefPnStYXZXIDqmLdMzjXNErjPSDo180?=
 =?us-ascii?Q?4XdmnIs4WUBjvamV1dkpFS6lz0pAkRrcy1XDmOQZZWFFf/EO66twvdG7pHy2?=
 =?us-ascii?Q?JDXcls5yibi34ecPrO5nMcBPIFZIZ3ExXqwODNXguFqbNNJ7/qjn7ZPsycnw?=
 =?us-ascii?Q?wlH8PHzKmqUNtl6gqWc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:09:21.7065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee39ade-992d-4c24-8be9-08de22cf01d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4089
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
index 7193a341689d..2f305ad32080 100644
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
+						    sizeof(struct amdgpu_ttm_buffer_entity),
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
 		for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
 			dma_fence_put(man->eviction_fences[i]);
 			man->eviction_fences[i] = NULL;
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
index f4f762be9fdd..797f851a4578 100644
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
 
 	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
-	struct amdgpu_ttm_buffer_entity clear_entity;
 	struct amdgpu_ttm_buffer_entity move_entity;
+	struct amdgpu_ttm_buffer_entity *clear_entities;
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

