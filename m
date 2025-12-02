Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C084C9AF55
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 10:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C92910E5DC;
	Tue,  2 Dec 2025 09:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JH4Kme9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011005.outbound.protection.outlook.com
 [40.93.194.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FBD10E5DC;
 Tue,  2 Dec 2025 09:50:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2vP+eKdr/5zviXuYaie8ki5Z78T3m2VFsE6WqIXGdelFF5uov6yZBToRNmEUm2EMJZSUBnEr2K3QOwoo2wzCblD7tp0RInXqgdPtD6ODVQHFjodYpQ5hko0WFrInMlKRJoQojiO+rns+5/zdvDGPII4OxFS1zIKr/smswIi+mFDRJH/C7qJl+kU+NDZljOZzf3zfQael/S0zxjKMhzHCunjQbkEmWStIpp05vYwpKgSkaBEspN5uAj/2PSWvAS6F0J7+9k0/DaS6n2ozXYgCyM63JXljKfpAdfxAOQSJY8vhLV8LPx8iFcPbKPt5VDwPUSX7qxjUVtB+2aTeCd4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04zeSNUWUNVrNvSj/BthwdZAZTXFw5mbBgPj8lxr7lo=;
 b=rEIjNntXI5Bj4TJMAPsbj0BNNHhE9WUy9hTeqcRXcvHJnNBlS949bkFvyIuep1cI/7ti/vQhF4veu21QNL/QACeigFFU9rbAZmvvMf5Al9w5gOlxd/wbwBFq73jXp3iH+3yTL3LiaMZ63KP6OtybL4jYy0KXPbA7fT/Jg96hFt02iLL4YphEopv1jhoYQqgB+ouM5W7iTGQ5QaKnxyNF7/eO6ZDH+7lVpLdYoZGpRROTIM8frjZTJ8Hh1l2wNedOHFV35Q4uL3rU0MAR1rl3Bg72LNbjdOHG131AftD9rROt3dWGB2j0Kq6evFmiCQ6X0cTaaeQRAPlj44ksNZVrIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04zeSNUWUNVrNvSj/BthwdZAZTXFw5mbBgPj8lxr7lo=;
 b=JH4Kme9QzZsHuZC4/sQl0a5nZ1HZM6Un/PzthK5rWlaa3gwF4/lek+p/Qb5Lcc19c+jD/kUgvRHLDYsHCVYMRp7MTwGeHkFnizaHMUDmhVJi0CKA2zwsDKLmMxdneC0NzzFiWJgc28AxI99F+3G95rR7ypxJ7jhjX8FJoUj2Cu4=
Received: from SJ0PR03CA0226.namprd03.prod.outlook.com (2603:10b6:a03:39f::21)
 by MW3PR12MB4361.namprd12.prod.outlook.com (2603:10b6:303:5a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 09:50:48 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::a2) by SJ0PR03CA0226.outlook.office365.com
 (2603:10b6:a03:39f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 09:50:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 09:50:47 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Dec 2025 03:50:36 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Felix
 Kuehling" <felix.kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 06/13] drm/amdgpu: statically assign gart windows to ttm
 entities
Date: Tue, 2 Dec 2025 10:47:16 +0100
Message-ID: <20251202094738.15614-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251202094738.15614-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|MW3PR12MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: bffad1ca-6c82-4f60-f6fe-08de31884526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5n8X0mRuY/8PGZlOFdwgLE67K+QuzyH2UuucipRvTWfs6QEUCh4sTOFLcNVi?=
 =?us-ascii?Q?nOepAtY4abH2jluzJY8i+4rXOocrGr1p5hJ8BmnVI2jWDr4nwGMnpsZ9zvs/?=
 =?us-ascii?Q?J+QA/eH87JLrdBch4pTsFzEMFp65qrdToJWBt8mrzruJP3TVomA3bdUZDeuY?=
 =?us-ascii?Q?mmO7NDlRZct+EeE6hZK3kMiFKZRm1Yms7ujjrn45oREAdJ+XU1QfVm36Jz5H?=
 =?us-ascii?Q?AJB0OC7+HxyvI4JVdi8iGOPEl6xVcvIQZh1Fp9LzAhaEjKIoz0m3GssXXUHo?=
 =?us-ascii?Q?VtTrg5nm8cZgNDDyomszCm4n9UHGMwbwMirO1RCFPmirMCvAH1mgRXaQTbJT?=
 =?us-ascii?Q?wWaw/pVwed6cqeli6FHpaIG1pi8AUvbpJy/gAWrqRg14ygIQ6/eJuf8Xaod1?=
 =?us-ascii?Q?LNr+ySyB5MLwebSbpwsA7Eo+uXG4EYIKR8YoygHUnIcVZUxWgAHoYsY5jzlO?=
 =?us-ascii?Q?TV4dAJAOgr9sK9OxSIhhRfxxmmi4YHRwgu6rdFcBC99SJEGuxUTXnjO3UtKj?=
 =?us-ascii?Q?dQFV9TtX8fbNv5EpLUUBOKFtgyi3Nk4OCzc4yzZjjIoQ+Is4iNedWJaWCmDd?=
 =?us-ascii?Q?elqlsP0zs98oL8/c8/CVIpPupw3769FRRjDF2qxg8W0p+KyriGHi/yhC/m18?=
 =?us-ascii?Q?CaSid2S5xf/BTEVoEMsPyK/cIK8Lpz3jrwAy/AkxFa9V28sl984qHGLyJFnZ?=
 =?us-ascii?Q?kaca9o2IcQIkKK6JKEtAH+sSjUfkB+XQ5BhM6wEt8vCFtbEeczQWkCni3/RP?=
 =?us-ascii?Q?fwy31oZ53R7pkjnZHw311JbCfVN4YfoPfPL0t+oN3qwUMzOSSdWzqNhzkkou?=
 =?us-ascii?Q?fDPlnE3b75+403LXB/yxpi830238Q+1yROeWBd83uHfndb0xWMRex9oK98Qv?=
 =?us-ascii?Q?CXANpeJB9uBBCGpRO4Zhstk3jBr8N8MtyQiX9jEINbsRoikpZD0RfWXN7kpE?=
 =?us-ascii?Q?9jThb30J/FQ2tePR/86/UvuuKLUlCd02KZ22xcPZO1ygA3BL4fwjeqsXlNa+?=
 =?us-ascii?Q?Iy9DS25GNgiDCWNE2VAG1ygxuwUoKQMa0fDzUvwRn3K9AiOFpLaU71d+WH8Z?=
 =?us-ascii?Q?Xyd5gaMPGE5X84ZZ2fADLIBP/Wc9kjDZMhf/tHDanGOKufYZDn1lHbiQ1iDq?=
 =?us-ascii?Q?WdVpJMuPNX8+gwtkGCV5E2OgWt96rdh9ryCxFRx2zNl3qHZ2iOpYAuFx48RP?=
 =?us-ascii?Q?NDHRML6kRl9iYu0RDj9RwaOVSUkat3a6NGdm2eQ/KBaTcswFhscFBdpJ3C6b?=
 =?us-ascii?Q?quh9jrW8F87tl9KeE/4F0bg/ctPAysMaJWgFj3HQPTFFUvMEzQJOp23gqBFn?=
 =?us-ascii?Q?5U6HRdhRDoHlsQ2fhWxGgxx6w0BxLgKfKXeQB7QVDsS4J1DWbKO81b+9zjFx?=
 =?us-ascii?Q?Zc15fIOvQ4V24wrhoiUUe1olCGmq93Us+9nFiqV5upg2g2DEzW4ppTs3zWCM?=
 =?us-ascii?Q?5cJr9Eoii+QQcKLCSkG9z1A0EO48K7U87KGErqPi84IO0ajWGOD32hxL5+/c?=
 =?us-ascii?Q?OK1O97vuLhCL2hbCyMqsmqII09f3WxDI4DmU0V9gkl0CM4GDi61Z+gTMTdZ/?=
 =?us-ascii?Q?vPKVPFZ3IvwNLWJUt7E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 09:50:47.7389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bffad1ca-6c82-4f60-f6fe-08de31884526
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4361
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

If multiple entities share the same window we must make sure
that jobs using them are executed sequentially.

This commit gives separate windows to each entity, so jobs
from multiple entities could execute in parallel if needed.
(for now they all use the first sdma engine, so it makes no
difference yet).
The entity stores the gart window offsets to centralize the
"window id" to "window offset" in a single place.

default_entity doesn't get any windows reserved since there is
no use for them.

---
v3:
- renamed gart_window_lock -> lock (Christian)
- added amdgpu_ttm_buffer_entity_init (Christian)
- fixed gart_addr in svm_migrate_gart_map (Felix)
- renamed gart_window_idX -> gart_window_offs[]
- added amdgpu_compute_gart_address
v4:
- u32 -> u64
- added kerneldoc
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Acked-by: Felix Kuehling <felix.kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 61 +++++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 19 +++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  9 ++--
 4 files changed, 69 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 94e07b9ec7b4..0d2784fe0be3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -686,7 +686,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 * translation. Avoid this by doing the invalidation from the SDMA
 	 * itself at least for GART.
 	 */
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&adev->mman.default_entity.lock);
 	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
@@ -699,7 +699,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	fence = amdgpu_job_submit(job);
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.default_entity.lock);
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
@@ -707,7 +707,7 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	return;
 
 error_alloc:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.default_entity.lock);
 	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index a5048cd8e10d..d3d0419397c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -228,9 +228,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 
 	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
 
-	*addr = adev->gmc.gart_start;
-	*addr += (u64)window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
-		AMDGPU_GPU_PAGE_SIZE;
+	*addr = amdgpu_compute_gart_address(&adev->gmc, entity, window);
 	*addr += offset;
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
@@ -248,7 +246,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	src_addr += job->ibs[0].gpu_addr;
 
 	dst_addr = amdgpu_bo_gpu_offset(adev->gart.bo);
-	dst_addr += window * AMDGPU_GTT_MAX_TRANSFER_SIZE * 8;
+	dst_addr += (entity->gart_window_offs[window] >> AMDGPU_GPU_PAGE_SHIFT) * 8;
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
 				dst_addr, num_bytes, 0);
 
@@ -313,7 +311,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
 	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (src_mm.remaining) {
 		uint64_t from, to, cur_size, tiling_flags;
 		uint32_t num_type, data_format, max_com, write_compress_disable;
@@ -368,7 +366,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		amdgpu_res_next(&dst_mm, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 	*f = fence;
 	return r;
 }
@@ -1500,7 +1498,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 	if (r)
 		goto out;
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&adev->mman.default_entity.lock);
 	amdgpu_res_first(abo->tbo.resource, offset, len, &src_mm);
 	src_addr = amdgpu_ttm_domain_start(adev, bo->resource->mem_type) +
 		src_mm.start;
@@ -1512,7 +1510,7 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
 				PAGE_SIZE, 0);
 
 	fence = amdgpu_ttm_job_submit(adev, job, num_dw);
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.default_entity.lock);
 
 	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
 		r = -ETIMEDOUT;
@@ -1875,6 +1873,27 @@ static void amdgpu_ttm_mmio_remap_bo_fini(struct amdgpu_device *adev)
 	adev->rmmio_remap.bo = NULL;
 }
 
+static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity,
+					 int starting_gart_window,
+					 bool needs_src_gart_window,
+					 bool needs_dst_gart_window)
+{
+	mutex_init(&entity->lock);
+	if (needs_src_gart_window) {
+		entity->gart_window_offs[0] =
+			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
+				AMDGPU_GPU_PAGE_SIZE;
+		starting_gart_window++;
+	}
+	if (needs_dst_gart_window) {
+		entity->gart_window_offs[1] =
+			(u64)starting_gart_window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
+				AMDGPU_GPU_PAGE_SIZE;
+		starting_gart_window++;
+	}
+	return starting_gart_window;
+}
+
 /*
  * amdgpu_ttm_init - Init the memory management (ttm) as well as various
  * gtt/vram related fields.
@@ -1889,8 +1908,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	uint64_t gtt_size;
 	int r;
 
-	mutex_init(&adev->mman.gtt_window_lock);
-
 	dma_set_max_seg_size(adev->dev, UINT_MAX);
 	/* No others user of address space so set it to 0 */
 	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
@@ -2160,6 +2177,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	u32 used_windows;
 	uint64_t size;
 	int r;
 
@@ -2203,6 +2221,14 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 			goto error_free_entity;
 		}
+
+		/* Statically assign GART windows to each entity. */
+		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.default_entity,
+							     0, false, false);
+		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.move_entity,
+							     used_windows, true, true);
+		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
+							     used_windows, false, true);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
 		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
@@ -2361,6 +2387,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 			    struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_ttm_buffer_entity *entity;
 	struct amdgpu_res_cursor cursor;
 	u64 addr;
 	int r = 0;
@@ -2371,11 +2398,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 	if (!fence)
 		return -EINVAL;
 
+	entity = &adev->mman.clear_entity;
 	*fence = dma_fence_get_stub();
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (cursor.remaining) {
 		struct dma_fence *next = NULL;
 		u64 size;
@@ -2388,13 +2416,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity,
-					  &bo->tbo, bo->tbo.resource, &cursor,
+		r = amdgpu_ttm_map_buffer(entity, &bo->tbo, bo->tbo.resource, &cursor,
 					  1, false, &size, &addr);
 		if (r)
 			goto err;
 
-		r = amdgpu_ttm_fill_mem(adev, &adev->mman.clear_entity, 0, addr, size, resv,
+		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
 					&next, true,
 					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
@@ -2406,7 +2433,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		amdgpu_res_next(&cursor, size);
 	}
 err:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 
 	return r;
 }
@@ -2431,7 +2458,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (dst.remaining) {
 		struct dma_fence *next;
 		uint64_t cur_size, to;
@@ -2456,7 +2483,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		amdgpu_res_next(&dst, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 	if (f)
 		*f = dma_fence_get(fence);
 	dma_fence_put(fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 9288599c9c46..6e04f80b6a75 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -29,6 +29,7 @@
 #include <drm/ttm/ttm_placement.h>
 #include "amdgpu_vram_mgr.h"
 #include "amdgpu_hmm.h"
+#include "amdgpu_gmc.h"
 
 #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
 #define AMDGPU_PL_GWS		(TTM_PL_PRIV + 1)
@@ -39,7 +40,7 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
+#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
@@ -54,6 +55,8 @@ struct amdgpu_gtt_mgr {
 
 struct amdgpu_ttm_buffer_entity {
 	struct drm_sched_entity base;
+	struct mutex		lock;
+	u64			gart_window_offs[2];
 };
 
 struct amdgpu_mman {
@@ -69,6 +72,7 @@ struct amdgpu_mman {
 
 	struct mutex				gtt_window_lock;
 
+	/* @default_entity: for workarounds, has no gart windows */
 	struct amdgpu_ttm_buffer_entity default_entity;
 	struct amdgpu_ttm_buffer_entity clear_entity;
 	struct amdgpu_ttm_buffer_entity move_entity;
@@ -199,6 +203,19 @@ static inline int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo,
 }
 #endif
 
+/**
+ * amdgpu_compute_gart_address() - Returns GART address of an entity's window
+ * @gmc: The &struct amdgpu_gmc instance to use
+ * @entity: The &struct amdgpu_ttm_buffer_entity owning the GART window
+ * @index: The window to use (must be 0 or 1)
+ */
+static inline u64 amdgpu_compute_gart_address(struct amdgpu_gmc *gmc,
+					      struct amdgpu_ttm_buffer_entity *entity,
+					      int index)
+{
+	return gmc->gart_start + entity->gart_window_offs[index];
+}
+
 void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm, struct amdgpu_hmm_range *range);
 int amdgpu_ttm_tt_get_userptr(const struct ttm_buffer_object *tbo,
 			      uint64_t *user_addr);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 9c76f1ba0e55..0cc1d2b35026 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -59,8 +59,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
 	void *cpu_addr;
 	int r;
 
-	/* use gart window 0 */
-	*gart_addr = adev->gmc.gart_start;
+	*gart_addr = amdgpu_compute_gart_address(&adev->gmc, entity, 0);
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = npages * 8;
@@ -116,7 +115,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
  * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
  * the last sdma finish fence which is returned to check copy memory is done.
  *
- * Context: Process context, takes and releases gtt_window_lock
+ * Context: Process context
  *
  * Return:
  * 0 - OK, otherwise error code
@@ -138,7 +137,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 
 	entity = &adev->mman.move_entity;
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 
 	while (npages) {
 		size = min(GTT_MAX_PAGES, npages);
@@ -175,7 +174,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 	}
 
 out_unlock:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 
 	return r;
 }
-- 
2.43.0

