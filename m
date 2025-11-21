Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C2AC7875D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1BF10E840;
	Fri, 21 Nov 2025 10:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JK/O41MP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5FA10E840;
 Fri, 21 Nov 2025 10:19:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ch5G4b5hjRPEcrBR73kNJT0KYTfRs3gRl+EbwV1zlp78aqXcdXRanYDjKBwmlD8mQtXVoZjZWhX49/HZG+dUJIOsXCNv8/fRQSd+j6hhqib23CVNPgX+gKIyoNC+NCEinUA5dSwqTYhPrCHw5ohPWg6AhClENej03+2ReRxO4c2AagiTFRKYFgdsmSrLTU4UwmSujg3WqxqeB9DsBF1MWWDF+UFrZStafkSxNoKR//nrqwVKEK88Nf4WjWtKAMUGL7anuCj9M01yFYp9Mj5Xn00VFpIxWDJOx5iXD8eIcB9U7waipuVjaXMU7JDtFU6MFR7PuugXKz96i2NCD1xtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KETBhQ8hSBjyW5EgUD+5gqYy4ulY/Mg/SBMSDkzqxP4=;
 b=VbSlywfb/ag+O17QCgo49t7N9NwZ14mqgLL4vHbHCjlvwMA4BreZ963q/H8meT++hQN1BUNgiu/1Rvm1Ii7y3i2anrfR7PcSv+x9nxmpxbgtJlDJPx8rH9dCin0BBawNdXjWbJtQo2AkhZmdLwlnmUkbCwbuOat5Z0gUgs8POYL7NxC8z3xNW6X7AuFsCp21EfWUZNZGQHfTRShsB9hYFznCCGhPhZlC2c3P9YQMxxqlmqGfXzJFlUUtcgrwgqPcpj6OUwSDq5WaH+JdrE5sfS2f+q3PQ5/RYBtdMNfn8jvp0Pd0HvmIqRxI5FyOo1ihUYg4yM35TwRoiGNnL8oVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KETBhQ8hSBjyW5EgUD+5gqYy4ulY/Mg/SBMSDkzqxP4=;
 b=JK/O41MPxaWXX/l++Putm3RNe6/RmqU64y2hRtl/ola+Kz6/NoK4Ei/Wc5V6YGKUtnJrEvWxtjhjZfbZ50qsHHtJd5jvOQ4+m9lJNZ1DIeXDHRk0zdwBYaG2LEIQDDhZCxgQsUYnI9fKpwJMt04GKr3I93FfuwJ56oG+tTds0gc=
Received: from MN0PR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:52c::35)
 by CH2PR12MB4166.namprd12.prod.outlook.com (2603:10b6:610:78::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Fri, 21 Nov
 2025 10:19:09 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::67) by MN0PR05CA0012.outlook.office365.com
 (2603:10b6:208:52c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Fri,
 21 Nov 2025 10:19:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:19:09 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:19:06 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 25/28] drm/amdgpu: pass all the sdma scheds to amdgpu_mman
Date: Fri, 21 Nov 2025 11:12:35 +0100
Message-ID: <20251121101315.3585-26-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|CH2PR12MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: bd726a4b-f8f8-4867-a9a4-08de28e768b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0lrgehEi9bh0dXbpdkL21wbsm4pOTbSSPmdcQKw/iYAqgpF99HwxlTQcFbuX?=
 =?us-ascii?Q?azCLshxV6DgSq4vvrJfx2saEykND4n5xQSfhHYxcdLKQKnsEcBXosS7N+Uoi?=
 =?us-ascii?Q?gw4dssRZwBJL5NZipR55Zo9XaP39uOOa/qlUqcVJtgSKaKA2JNsSS94mZ+F0?=
 =?us-ascii?Q?OfX/j75DBWF2sHGLrt0GQwUoysumTd5Pr5MUP1rF/GPCj6d1CcG3TevQlSh4?=
 =?us-ascii?Q?wyArD/J72FBVdP044ylWpuaQfkWtLxuTQO18c9Hb/uUiAcRQeN1CMUh18erP?=
 =?us-ascii?Q?UJD5n9c9FgD4u9A0da2rSX8iVeP++4WpJl0TqsDvupHtlx1kpHYbiD46J7T/?=
 =?us-ascii?Q?JWc8sZ5ACnh0hJF5gJF367pTZux2VFh0Sso7/u4m0BeO5g+Se+As8UDySlGZ?=
 =?us-ascii?Q?QdhLeNar/XD5gHlAhCTeyqUSN6R6lVUB+kogFLVS9YbxQqig83CDzE1sbQjj?=
 =?us-ascii?Q?OkANbU7LPtwYgIRhl+JmcHUpUULRzCN+R/66ddpbgMV9Ld2XpG0aFZfC2di3?=
 =?us-ascii?Q?HoaeYrveYSUzQTUHUb6/Z5hgqlIiYKEZQh8R+J7L1sc5KVvi4RsV7AJ99R2b?=
 =?us-ascii?Q?KwtLLGbzJ/nHE2bqwdqHTwPNNoQEEV6ZplNCb7RDRo/atMuif/yVC5NaM3Ax?=
 =?us-ascii?Q?blOIFKZGPGRo46orcldcUUwxkNDM/akiDBEVqdCZ9SZz44yxqYMG65UcY8Go?=
 =?us-ascii?Q?JuuyLkzc9I7FCJY/ArtcYaVWfLdr/nXS1HBB7KE53Z2ztW5BSYU45cbfKMyf?=
 =?us-ascii?Q?hQXZXnU+EVlzEewY4WRuwK2fVXLeos/jtR+izzg6C7iG+qoPjnUXyh/dt3vU?=
 =?us-ascii?Q?NMuTHZxiYmUXhhpAwk0LSasTHJ++N2C5KDANYmGyEpwWa9ECFmWWPEpQOnGa?=
 =?us-ascii?Q?rwQgZXJFDV+6PTWHjLGpvA10PA2nRdNTBg0Kh9xm8VMnEmcGR5D0mD0ZbyD+?=
 =?us-ascii?Q?x3MJgb+bv7pgaz+iZXUuwgeRWdM/lI3WGgtj4YuXW5Q2f3M2d8PECV9N9g9y?=
 =?us-ascii?Q?fgoNvdKhtK0pNrdFq7u0jUyeda7i8E6xxtkyKwB5LN8Y4CBMg9WMOVZLGkBk?=
 =?us-ascii?Q?+5ZMrS98QfR1WUGbcfyMtU/Tt86KnsPpwddAwuUrFZFg7TVUqQvQ3e2DVr3s?=
 =?us-ascii?Q?ixkBTbeZ8/EErkgKpegeY6NDyPwzeweAN14wbn/lqNqEN9A5lzBeHDK0Stxr?=
 =?us-ascii?Q?9YppZ8sWgXcRV43khrvAkvGI85eNdhA25gK9u9jJ1VodOIFkkvA145+wVEnH?=
 =?us-ascii?Q?2qmYkUSOJH4meLh3p9Izota87u8yuBfNw7L/RyFtqT1TO3sw+gLG/+F33z2T?=
 =?us-ascii?Q?ZT2t6AwN7JaC86F4kblMP+8li9I6l+yJDe4iLvikH4/zGXvgTUdFYcLNeIdq?=
 =?us-ascii?Q?h1J0FLW1oxpANX7aubMxfZzw8uuZXIZDDSTmdyTX8cq3f9heot1jD3foHJLW?=
 =?us-ascii?Q?2d9cA90u5/p+dj0rFkfl9kGjdfTjyA7LP1x1797VSiUqsw8uyx5d+TYDy6vU?=
 =?us-ascii?Q?eXltIb+0WI8RFbPu/rq0EvvaGAjJZRpCDSNjJtRFCPokBF4ITVsk4I0McnTX?=
 =?us-ascii?Q?Wh2v61KcPVI/668gx6I=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:19:09.2328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd726a4b-f8f8-4867-a9a4-08de28e768b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4166
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

This will allow the use of all of them for clear/fill buffer
operations.
Since drm_sched_entity_init requires a scheduler array, we
store schedulers rather than rings. For the few places that need
access to a ring, we can get it from the sched using container_of.

Since the code is the same for all sdma versions, add a new
helper amdgpu_sdma_set_buffer_funcs_scheds to set buffer_funcs_scheds
based on the number of sdma instances.

Note: the new sched array is identical to the amdgpu_vm_manager one.
These 2 could be merged.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c    |  4 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 31 +++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  3 ++-
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c      |  3 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c     |  3 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c     |  3 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c     |  6 +----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c   |  6 +----
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c     |  6 ++---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c     |  6 ++---
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c     |  3 +--
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c     |  3 +--
 drivers/gpu/drm/amd/amdgpu/si_dma.c        |  3 +--
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c   |  3 ++-
 16 files changed, 47 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index a50e3c0a4b18..d07075fe2d8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1614,6 +1614,8 @@ ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
 ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
 void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
 				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
+void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
+					 const struct amdgpu_buffer_funcs *buffer_funcs);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7167db54d722..9d3931d31d96 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4527,7 +4527,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	adev->num_rings = 0;
 	RCU_INIT_POINTER(adev->gang_submit, dma_fence_get_stub());
 	adev->mman.buffer_funcs = NULL;
-	adev->mman.buffer_funcs_ring = NULL;
+	adev->mman.num_buffer_funcs_scheds = 0;
 	adev->vm_manager.vm_pte_funcs = NULL;
 	adev->vm_manager.vm_pte_num_scheds = 0;
 	adev->gmc.gmc_funcs = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 0d2784fe0be3..ff9a066870f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -651,12 +651,14 @@ int amdgpu_gmc_allocate_vm_inv_eng(struct amdgpu_device *adev)
 void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 			      uint32_t vmhub, uint32_t flush_type)
 {
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring;
 	struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
 	struct dma_fence *fence;
 	struct amdgpu_job *job;
 	int r;
 
+	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
+
 	if (!hub->sdma_invalidation_workaround || vmid ||
 	    !adev->mman.buffer_funcs_enabled || !adev->ib_pool_ready ||
 	    !ring->sched.ready) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 575a4d4a1747..eec0cab8060c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -168,7 +168,7 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_ttm_buffer_entit
 {
 	struct amdgpu_ring *ring;
 
-	ring = adev->mman.buffer_funcs_ring;
+	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	WARN_ON(job->ibs[0].length_dw > num_dw);
 
@@ -2241,18 +2241,16 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
 		return reserved_windows;
 
-	if ((!adev->mman.buffer_funcs_ring || !adev->mman.buffer_funcs_ring->sched.ready) &&
+	if ((!adev->mman.num_buffer_funcs_scheds || !adev->mman.buffer_funcs_scheds[0]->ready) &&
 	    enable) {
 		dev_warn(adev->dev, "Not enabling DMA transfers for in kernel use");
 		return 0;
 	}
 
 	if (enable) {
-		struct amdgpu_ring *ring;
 		struct drm_gpu_scheduler *sched;
 
-		ring = adev->mman.buffer_funcs_ring;
-		sched = &ring->sched;
+		sched = adev->mman.buffer_funcs_scheds[0];
 		r = drm_sched_entity_init(&adev->mman.default_entity.base,
 					  DRM_SCHED_PRIORITY_KERNEL, &sched,
 					  1, NULL);
@@ -2387,7 +2385,7 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 	unsigned int i;
 	int r;
 
-	ring = adev->mman.buffer_funcs_ring;
+	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
 
 	if (!ring->sched.ready) {
 		dev_err(adev->dev,
@@ -2624,6 +2622,27 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
 	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
 }
 
+void amdgpu_sdma_set_buffer_funcs_scheds(struct amdgpu_device *adev,
+					 const struct amdgpu_buffer_funcs *buffer_funcs)
+{
+	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
+	struct drm_gpu_scheduler *sched;
+	int i;
+
+	adev->mman.buffer_funcs = buffer_funcs;
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		if (adev->sdma.has_page_queue)
+			sched = &adev->sdma.instance[i].page.sched;
+		else
+			sched = &adev->sdma.instance[i].ring.sched;
+		adev->mman.buffer_funcs_scheds[i] = sched;
+	}
+
+	adev->mman.num_buffer_funcs_scheds = hub->sdma_invalidation_workaround ?
+		1 : adev->sdma.num_instances;
+}
+
 #if defined(CONFIG_DEBUG_FS)
 
 static int amdgpu_ttm_page_pool_show(struct seq_file *m, void *unused)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 0785a2c594f7..653a4d17543e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -66,7 +66,8 @@ struct amdgpu_mman {
 
 	/* buffer handling */
 	const struct amdgpu_buffer_funcs	*buffer_funcs;
-	struct amdgpu_ring			*buffer_funcs_ring;
+	struct drm_gpu_scheduler		*buffer_funcs_scheds[AMDGPU_MAX_RINGS];
+	u32					num_buffer_funcs_scheds;
 	bool					buffer_funcs_enabled;
 
 	struct mutex				gtt_window_lock;
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 22780c09177d..26276dcfd458 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1340,8 +1340,7 @@ static const struct amdgpu_buffer_funcs cik_sdma_buffer_funcs = {
 
 static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &cik_sdma_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &cik_sdma_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version cik_sdma_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 0090ace49024..c6a059ca59e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -1235,8 +1235,7 @@ static const struct amdgpu_buffer_funcs sdma_v2_4_buffer_funcs = {
 
 static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v2_4_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v2_4_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 2526d393162a..cb516a25210d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1677,8 +1677,7 @@ static const struct amdgpu_buffer_funcs sdma_v3_0_buffer_funcs = {
 
 static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v3_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v3_0_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v3_0_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index a35d9951e22a..f234ee54f39e 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -2615,11 +2615,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_0_buffer_funcs = {
 
 static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v4_0_buffer_funcs;
-	if (adev->sdma.has_page_queue)
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
-	else
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_0_buffer_funcs);
 }
 
 static void sdma_v4_0_get_ras_error_count(uint32_t value,
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index 7f77367848d4..cd7627b03066 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -2316,11 +2316,7 @@ static const struct amdgpu_buffer_funcs sdma_v4_4_2_buffer_funcs = {
 
 static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v4_4_2_buffer_funcs;
-	if (adev->sdma.has_page_queue)
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].page;
-	else
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v4_4_2_buffer_funcs);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index 7ce13c5d4e61..5b495fda4f71 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -2073,10 +2073,8 @@ static const struct amdgpu_buffer_funcs sdma_v5_0_buffer_funcs = {
 
 static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	if (adev->mman.buffer_funcs == NULL) {
-		adev->mman.buffer_funcs = &sdma_v5_0_buffer_funcs;
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
-	}
+	if (adev->mman.buffer_funcs == NULL)
+		amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_0_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v5_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 98beff18cf28..be2d9e57c459 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -2084,10 +2084,8 @@ static const struct amdgpu_buffer_funcs sdma_v5_2_buffer_funcs = {
 
 static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	if (adev->mman.buffer_funcs == NULL) {
-		adev->mman.buffer_funcs = &sdma_v5_2_buffer_funcs;
-		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
-	}
+	if (adev->mman.buffer_funcs == NULL)
+		amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v5_2_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v5_2_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
index c32331b72ba0..ed8937fe76ea 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
@@ -1891,8 +1891,7 @@ static const struct amdgpu_buffer_funcs sdma_v6_0_buffer_funcs = {
 
 static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v6_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v6_0_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v6_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 9318d23eb71e..f4c91153542c 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1833,8 +1833,7 @@ static const struct amdgpu_buffer_funcs sdma_v7_0_buffer_funcs = {
 
 static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &sdma_v7_0_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &sdma_v7_0_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version sdma_v7_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index b85df997ed49..ac6272fcffe9 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -833,8 +833,7 @@ static const struct amdgpu_buffer_funcs si_dma_buffer_funcs = {
 
 static void si_dma_set_buffer_funcs(struct amdgpu_device *adev)
 {
-	adev->mman.buffer_funcs = &si_dma_buffer_funcs;
-	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
+	amdgpu_sdma_set_buffer_funcs_scheds(adev, &si_dma_buffer_funcs);
 }
 
 const struct amdgpu_ip_block_version si_dma_ip_block =
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 5dd65f05a1e0..a149265e3611 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -128,13 +128,14 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 			     struct dma_fence **mfence)
 {
 	const u64 GTT_MAX_PAGES = AMDGPU_GTT_MAX_TRANSFER_SIZE;
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ring *ring;
 	struct amdgpu_ttm_buffer_entity *entity;
 	u64 gart_s, gart_d;
 	struct dma_fence *next;
 	u64 size;
 	int r;
 
+	ring = to_amdgpu_ring(adev->mman.buffer_funcs_scheds[0]);
 	entity = &adev->mman.move_entities[0];
 
 	mutex_lock(&entity->lock);
-- 
2.43.0

