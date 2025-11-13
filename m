Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A124C5898E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B4610E889;
	Thu, 13 Nov 2025 16:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p5ZMHSEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C30810E887;
 Thu, 13 Nov 2025 16:09:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTtQP9El0hCLESzSYCc7b2LR4e6FNEaeWgW+wG5l01QZFRA9RRq/Q3cmGKZZ+P3nSuwJLVNuZJcc+4apJeEJOXBFPoUYUvp/lX09vdWlPE+x64Tj2F4M63z11SkrbcUTklrUm/b8A0EAUYB60cTYrSvrWpzK9Z9QkzgIpOqmG6iRBXvp7q7h3F+gYl18L0pvV0e2MlBkEzbkzDSSATjxt1q7O51zJEBHMY0S0fPNiK/N2qGmU6iQxLcW2I65oLrv2dYh6yxEUrXoJEzAObkT7CueDdtYfzGtNF2zEWhSVcRugK/lWuJaz+JPkXh2mkU1/9eKUxCNCki9bHoMTDvEwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7pXmJ0944i1lBp1TIZciLkSnvufgVg0r9jhMkc4Plc=;
 b=BnLGqQNTCFHYkcBZJ8OslVyxJBh9S4ToBN/fsti07/PBz3mTvh+tmDkN9cl3jcBuhHUHmxr56ps0GWcPgAYtbpMJDtlRjWtesKiqnOSg0QvPpZbiNkeav5DB/MHbWzICoeg5VPOk46b6VmGqItSoVwPovQwDzxpqqc4iT2VDg+cOgeRkhRNiVq5mSAidk4T+Smvmyt6sgKtu33bIqtgbbX0qU5NqgGbI8/xcz+1mN6bBBDpPko37m++z35FkHebeaFHyIzCA7JTCHSxlrl6YoO8pIyW/kKu03loklKo5MVdYSkx5aGVDTukZrX3KXzn6w9gu0h4fojI/TM2fh8BP1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7pXmJ0944i1lBp1TIZciLkSnvufgVg0r9jhMkc4Plc=;
 b=p5ZMHSEOnYF5pMDSWihahSN/Nb5R3ha69xKk+KCvnYPQutLHv2NRv175LguoVYZpF55gHnPDVsDLE6fYx6IPRu4HCG35siOO29Ia7jFQ83g8dX10Dry2BceUY8GjfQXnEkCHvez7JgUrRJrTpbdGjSdsfVGofiS6j6ubuS5Iz4Q=
Received: from CH5PR05CA0020.namprd05.prod.outlook.com (2603:10b6:610:1f0::13)
 by IA0PR12MB8303.namprd12.prod.outlook.com (2603:10b6:208:3de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:09:32 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::f0) by CH5PR05CA0020.outlook.office365.com
 (2603:10b6:610:1f0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Thu,
 13 Nov 2025 16:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:09:31 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:09:30 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 08/20] drm/amdgpu: allocate multiple move entities
Date: Thu, 13 Nov 2025 17:05:49 +0100
Message-ID: <20251113160632.5889-9-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|IA0PR12MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: 20988e6f-b804-4b5e-a14a-08de22cf07f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DTVS2g72wx5kxglN4jLQVVD66mkRIdDYPSmGdCd2DV7YQ2Zzn+iIyjhzA8hM?=
 =?us-ascii?Q?55TkvIDXK1IWEhk1WgvdgIGSppluPkRGMX9VNfWEaxxY7GJg4SPrz02suhxI?=
 =?us-ascii?Q?gg0au6E5VFFt3HnoyUr4mW1oDk972ZaBkfbvHxIT/VcgUlNYLkuuqrmXOgdz?=
 =?us-ascii?Q?yqWi+E6x1+W7lmP/ARqQrJ8oEF0GLBS9w+IDIK9MFRQi9LLNkqEGzD/sn6tA?=
 =?us-ascii?Q?cPlb9856TKnJ8Rgl+oUWxlNo8x11gJq9dUqDrxuYlNrPJDlNXTr0SkFVduwY?=
 =?us-ascii?Q?2QhihwKqFX+gTlWGtBp4JJPcCekE3ql6rm1QFuYQci8eLxoRStQbTmJObkU+?=
 =?us-ascii?Q?7RpQIilUsAqnGSeFD40gohatWUN8IYs7nSa2s3msi2RzqLhPzh+1Rote05+H?=
 =?us-ascii?Q?cczSoJw1IAfBjqq0ZOglEUaDX4zf+wxCKGhlhL1SUpakNtnnqG6vBQDiS3Bs?=
 =?us-ascii?Q?EecN4My/Or4jimKNoSAnSGl/yC9qWXWQDbBdOhVFyV4dNabyLm/ppyx0miyn?=
 =?us-ascii?Q?TsRHfVdheTQrenMSrd/sWKN7KeuuojsA/EXkOgjDCs7zoCC9Tn4GWVJ6S6Pp?=
 =?us-ascii?Q?0IreMxynzMj2BMbX8bTb5lzanf2XSDmfJgxRjwdJhQ5VYy1++X23xNtCXltK?=
 =?us-ascii?Q?dpOYj0RyCsrnr/MhxyaD26XwJojtc2CfYROuIKLxxAfp/Be31LxgpUP0mkKT?=
 =?us-ascii?Q?YDIXK3zbU99MrD1c9OmvsxofPcMfagMRMjla6NRqo2XvA6LZJzODVrQ6l7c2?=
 =?us-ascii?Q?g/vNp8MFVlLsByq6p/071CT+AaPSjZaolUOZKvvv0qgu1IGNjfc72kP6AxEw?=
 =?us-ascii?Q?VKX0waZ+xc5xe/YDSL9EjMfjy5XTppuRCyp6ZZ0GkyoNlyRaGkKQfVpNdR19?=
 =?us-ascii?Q?Iaks0MrEyNJ99PJAc2YaL4v6iPxAFv3yp5awB903hWMCET4hFyYFtB+CLym2?=
 =?us-ascii?Q?zYtsL0v41qbPzDT771DXM+9fFRmitIovnahr5DDVzofEaDnBr2gGetDCqOOZ?=
 =?us-ascii?Q?u3DqTCFdkVP7H9Efx59TjkH6LK6/Ln3y7+mBjrZuKIVu1LH5IsrXMKVdGVAP?=
 =?us-ascii?Q?ZIeFd6xNJ4p2bJZTW+pSYUmJauVUCxeJ2UB/cUv+153Vg/hAf6aeUTl5KauJ?=
 =?us-ascii?Q?I4Boe37aVyCRH44o2rDclPgEzy+454cWBCHWLIqS+ZwMRI+bmSpdL+2o35FW?=
 =?us-ascii?Q?GAa/47GmRiJKHAFVKPvh2kyKVp6HsutwFZ5REWmOnb8ARVyVzTW9zXUkC7Lf?=
 =?us-ascii?Q?4nk3Fye5m0zukhCTe4Q91218JHZonuu4Ykc7bRIRGP4qjyOQEWKgkTDMSBgl?=
 =?us-ascii?Q?+4b5s9RHAu6eyvgcv3dl2LxuIJ9vIN73PhcPAuPdGI1Lb5HdOLV18h/PmI8S?=
 =?us-ascii?Q?9YvIBTUUpu7cvArZ9G5OCFQ/+pBrxhk8s2efI2ghbFQITl4Aw+JCEyZ1VoAM?=
 =?us-ascii?Q?5HgaP5ix4r9cNZDTGid0FjPvf6HrX4cWGYsPs2zVsgYxP1auk2pFe7TvAU8m?=
 =?us-ascii?Q?fsVJexPRTVISGD6HuMx+8VziqMZdo2H72PcBm4ZwWT0vfCZv6LA7OqIVZBfy?=
 =?us-ascii?Q?jlx0FJQ5m7PXNMDt1IA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:09:31.9768 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20988e6f-b804-4b5e-a14a-08de22cf07f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  9 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 48 +++++++++++++++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  |  3 +-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
 4 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index e73dcfed5338..2713dd51ab9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -686,9 +686,10 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 * translation. Avoid this by doing the invalidation from the SDMA
 	 * itself at least for GART.
 	 */
-	mutex_lock(&adev->mman.move_entity.gart_window_lock);
 	for (i = 0; i < adev->mman.num_clear_entities; i++)
 		mutex_lock(&adev->mman.clear_entities[i].gart_window_lock);
+	for (i = 0; i < adev->mman.num_move_entities; i++)
+		mutex_lock(&adev->mman.move_entities[i].gart_window_lock);
 	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
@@ -701,7 +702,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	fence = amdgpu_job_submit(job);
-	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
+	for (i = 0; i < adev->mman.num_move_entities; i++)
+		mutex_unlock(&adev->mman.move_entities[i].gart_window_lock);
 	for (i = 0; i < adev->mman.num_clear_entities; i++)
 		mutex_unlock(&adev->mman.clear_entities[i].gart_window_lock);
 
@@ -711,7 +713,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	return;
 
 error_alloc:
-	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
+	for (i = 0; i < adev->mman.num_move_entities; i++)
+		mutex_unlock(&adev->mman.move_entities[i].gart_window_lock);
 	for (i = 0; i < adev->mman.num_clear_entities; i++)
 		mutex_unlock(&adev->mman.clear_entities[i].gart_window_lock);
 	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2f305ad32080..e1f0567fd2d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -401,7 +401,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	dst.offset = 0;
 
 	r = amdgpu_ttm_copy_mem_to_mem(adev,
-				       &adev->mman.move_entity,
+				       &adev->mman.move_entities[0],
 				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
@@ -414,7 +414,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
 		struct dma_fence *wipe_fence = NULL;
 
-		r = amdgpu_fill_buffer(&adev->mman.move_entity,
+		r = amdgpu_fill_buffer(&adev->mman.move_entities[0],
 				       abo, 0, NULL, &wipe_fence,
 				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
@@ -2167,10 +2167,11 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 	uint64_t size;
 	int r, i, j;
-	u32 num_clear_entities, windows, w;
+	u32 num_clear_entities, num_move_entities, windows, w;
 
 	num_clear_entities = adev->sdma.num_instances;
-	windows = adev->gmc.is_app_apu ? 0 : (2 + num_clear_entities);
+	num_move_entities = MIN(adev->sdma.num_instances, TTM_NUM_MOVE_FENCES);
+	windows = adev->gmc.is_app_apu ? 0 : (2 * num_move_entities + num_clear_entities);
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
 	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
@@ -2186,20 +2187,25 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 					  DRM_SCHED_PRIORITY_KERNEL, &sched,
 					  1, NULL);
 		if (r) {
-			dev_err(adev->dev,
-				"Failed setting up TTM BO eviction entity (%d)\n",
+			dev_err(adev->dev, "Failed setting up entity (%d)\n",
 				r);
 			return 0;
 		}
 
-		r = drm_sched_entity_init(&adev->mman.move_entity.base,
-					  DRM_SCHED_PRIORITY_NORMAL, &sched,
-					  1, NULL);
-		if (r) {
-			dev_err(adev->dev,
-				"Failed setting up TTM BO move entity (%d)\n",
-				r);
-			goto error_free_entity;
+		adev->mman.num_move_entities = num_move_entities;
+		for (i = 0; i < num_move_entities; i++) {
+			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
+						  DRM_SCHED_PRIORITY_NORMAL, &sched,
+						  1, NULL);
+			if (r) {
+				dev_err(adev->dev,
+					"Failed setting up TTM BO move entities (%d)\n",
+					r);
+				for (j = 0; j < i; j++)
+					drm_sched_entity_destroy(
+						&adev->mman.move_entities[j].base);
+				goto error_free_entity;
+			}
 		}
 
 		adev->mman.num_clear_entities = num_clear_entities;
@@ -2214,6 +2220,9 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 						  DRM_SCHED_PRIORITY_NORMAL, &sched,
 						  1, NULL);
 			if (r) {
+				for (j = 0; j < num_move_entities; j++)
+					drm_sched_entity_destroy(
+						&adev->mman.move_entities[j].base);
 				for (j = 0; j < i; j++)
 					drm_sched_entity_destroy(
 						&adev->mman.clear_entities[j].base);
@@ -2225,9 +2234,11 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		/* Statically assign GART windows to each entity. */
 		w = 0;
 		mutex_init(&adev->mman.default_entity.gart_window_lock);
-		adev->mman.move_entity.gart_window_id0 = w++;
-		adev->mman.move_entity.gart_window_id1 = w++;
-		mutex_init(&adev->mman.move_entity.gart_window_lock);
+		for (i = 0; i < num_move_entities; i++) {
+			adev->mman.move_entities[i].gart_window_id0 = w++;
+			adev->mman.move_entities[i].gart_window_id1 = w++;
+			mutex_init(&adev->mman.move_entities[i].gart_window_lock);
+		}
 		for (i = 0; i < num_clear_entities; i++) {
 			/* Clearing entities don't use id0 */
 			adev->mman.clear_entities[i].gart_window_id1 = w++;
@@ -2236,7 +2247,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		WARN_ON(w != windows);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
-		drm_sched_entity_destroy(&adev->mman.move_entity.base);
+		for (i = 0; i < num_move_entities; i++)
+			drm_sched_entity_destroy(&adev->mman.move_entities[i].base);
 		for (i = 0; i < num_clear_entities; i++)
 			drm_sched_entity_destroy(&adev->mman.clear_entities[i].base);
 		for (i = 0; i < TTM_NUM_MOVE_FENCES; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 797f851a4578..9d4891e86675 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -72,9 +72,10 @@ struct amdgpu_mman {
 	struct mutex				gtt_window_lock;
 
 	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
-	struct amdgpu_ttm_buffer_entity move_entity;
 	struct amdgpu_ttm_buffer_entity *clear_entities;
 	u32 num_clear_entities;
+	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
+	u32 num_move_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index bc47fc362a17..943c3438c7ee 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -136,7 +136,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 	u64 size;
 	int r;
 
-	entity = &adev->mman.move_entity;
+	entity = &adev->mman.move_entities[0];
 
 	mutex_lock(&entity->gart_window_lock);
 
-- 
2.43.0

