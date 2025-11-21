Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6501EC78699
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77AB10E81C;
	Fri, 21 Nov 2025 10:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v5hIFBp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012066.outbound.protection.outlook.com
 [40.107.200.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CB310E825;
 Fri, 21 Nov 2025 10:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2CTCNp040p83/rui7K8sUlmS71rL8eEPnm09oQBFAGwbOMt1rII8hwnrM4Li93g9qWo1qPIVWM+X2hZ49yzI33tMTx5CexU0hVtvVSjx5lJxhOAhWMDEz9H2PENdJ/e8aXv5tL+LWzW9MEAcWYaRwZUK+4wCVcF6QMz0WkFAf5vs0YeZ76VeRXlrQFeCxl4+V7DIwSk9sii5wGDJ1ckPw8zwsXg1CYU/oI1NxGOtgAKRktVclfeJZKdu3JwC6CtPNAG0Qnh5HjfSmfcNB0thGXQZugcegr3Xw8R7i7tWl0bHWpI+pBlSCmmj2gmA8oc6HfRpBHypPC6qhTNUQuBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36zztouu+acuxnr1SMImM+FMFJic+2s57sd47JC3d7k=;
 b=cYRBp18HM0B91YUjuLJX2v/P7Xz0e0rV2Pz775JC0g8pe3q7H31TwTBCnFruCig6y+TJOnnf3jbFzRjCalkJkJfoylUaBcQOrVef6K//zyTT5kZ+CF+AZoudcY6f+ohOWixYo3zOgMLmFapq6wbh+TuIaE5sH6YtIh6/YZthlxMUKIHPX6T5JVMNDa3J0gG04jgBDXYSa07i+KnWWvX7TTRh13NFZSJZ4vK9XEg84kR/qVSbksuTITN3MLZO1HtTHcJj00UOoc2JZ759arnaBFRX1bUf8KB+O2YyEpvZ2hbJO1Y30+IRXy53Z+HKz3AeZMHqdF7SwW54T+NEthLLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36zztouu+acuxnr1SMImM+FMFJic+2s57sd47JC3d7k=;
 b=v5hIFBp4F+uGgZMqPOX98OvX6LmxmRuGrYyDOivrhLAx+ESt2AG7V50Wj+1NDnaoY0TrdHYtq196HyA0B0DO00bUnOO8ZZyYUaQ1ALEYZRP0oRzRch3GIjmdNMgzbOLNDQv0i4LsrtReqAPjZbLpzahSRdflvgnrlECs7weP6gc=
Received: from BN0PR04CA0056.namprd04.prod.outlook.com (2603:10b6:408:e8::31)
 by CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 10:14:43 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:e8:cafe::53) by BN0PR04CA0056.outlook.office365.com
 (2603:10b6:408:e8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:14:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:14:42 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:14:40 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 11/28] drm/amdgpu: statically assign gart windows to ttm
 entities
Date: Fri, 21 Nov 2025 11:12:21 +0100
Message-ID: <20251121101315.3585-12-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|CH2PR12MB4199:EE_
X-MS-Office365-Filtering-Correlation-Id: 106a47d2-9aa9-4caa-4411-08de28e6ca07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u3R5kM98QjnPfS8YUwgG07YTntMnlnBdDmun9fgonfqBy1s+PEkLkepbeHrY?=
 =?us-ascii?Q?nCZ/SGurtOMMg7NnBoAuVLdxl4f1D44q7ZavoPJOd5cKOkmK6/vAONz4N/TD?=
 =?us-ascii?Q?jUC4ScIKbY6wF0z69wFdgUrPxGCYeLqIf7jKfbEYcUSt5KdPw20YWxb98BMC?=
 =?us-ascii?Q?3PdXjvEFwfwZavcpLDcMZ+0eAUT5/PbNsXrQjO//W9Uwe48pssR/B1lzLDLE?=
 =?us-ascii?Q?LHHXN+6xV+rBdaVUPF1e+TwNI2kneeUPTNapS9Y3W57EsRq1nIidP9HRxVmt?=
 =?us-ascii?Q?NUx18RE1XTVBU8/9GNpr/ZsI2pMyts+3lSHjEkjux2cOiNOk8d3Qe/vL7rB+?=
 =?us-ascii?Q?7YNe9n6jpZlzmWICH+KmpCDRJ4CzAohmrAT6L0XzZEdX3+ZXq1cs1xorp76T?=
 =?us-ascii?Q?CP5oU0XrPGiihemtMKmYToLGE1TAyD2dIGR1WmAPKX7uhXZiGAmyuFC/Diqw?=
 =?us-ascii?Q?p2ezh+UvsSY2yz1qghXIfwHk73SELJ1eVHeb+IV71XYHJxB3hOlegI3DJA2z?=
 =?us-ascii?Q?A/yqbl/tl2uC7OfkaRBm+MYl5e033zVKepnNpk9O1pwNVsuTojWQaknxJSpW?=
 =?us-ascii?Q?V+Wrz2JGwDBgwWvRUlpQ0hvou9h60BmvruOPHb31TQfw4rmLUkCRntKw+sct?=
 =?us-ascii?Q?43tvIxbcBXgBUFeJ7s0AS6TiFdCBLPnIUMTIKxRoWzgptJQ/huvLiIGIbDpe?=
 =?us-ascii?Q?tz+YmUGgNCWJ75hMycGMMflAiUVqWA9XxpY7dpMy2xkCKbWj18ZGYi+Jdyln?=
 =?us-ascii?Q?QKK7/ZGbGS6DGc0PEbwygt5LQpwsVCMQVzMqFs3eO9aZIGeosjR3QxrBAuTA?=
 =?us-ascii?Q?QPYL6aUrmQEc1vn34OXPSDpznumQOR0sFqEEK+su884H3+v+42ejhDkd5fSo?=
 =?us-ascii?Q?QuyFckzPduDpMDTpzDvCMQkAD+AZIt3ionxkjU8lXVW9mMlJ0ndA9JTurckj?=
 =?us-ascii?Q?YnKrXfSqgIQtY07a3zMGBTvd6ObEh5S71M6ovWrJOsrW1GMf9Geoy+mfiPMI?=
 =?us-ascii?Q?/ocnEdPiFsS6WaloRdGud5bRow6OzVpfZgsQSY0qG5nqE8VfaAAtFqAPXJ8u?=
 =?us-ascii?Q?vp8nEs5EG/SjMNv+w8FpZGSbQBnCgo15o6q+G/Cvarp3axu6Wc0prokoFBj3?=
 =?us-ascii?Q?EY9VovwGKXy18vXhw++XNjDt04EvmRCeXeVr0U/3mHoDTSWK62vgpNhfw527?=
 =?us-ascii?Q?Wg3iC8Ibo/mPJ5XgVpv9KNw9KLrYlRoTEfcQ5nUZE96mmmlAOw/qYV7K2e5n?=
 =?us-ascii?Q?DERyirbCDTaTZEWcPrM55tjBxEb5i1CzCobl5dnCN3KtWhJIXSiAmslrzwXI?=
 =?us-ascii?Q?+gKui3W9DtD63RdBPFYp7mAKAWW6p8AMmYeBS81eZvBOs8fDypeXI3kz9Waa?=
 =?us-ascii?Q?zc61h+mssD8kd3xxQ+uuiZbLX0kETsWf2CmTkm9W1oBOl6NkuIAvQvyYUhiU?=
 =?us-ascii?Q?1O18k1PMqACyZFTwR34GCMxshFIPno8qQv0HpqqltdvawhdpKVMFa3vhhB3m?=
 =?us-ascii?Q?54le5wXkeZeo7Aa7ZcAc+3QCBs0LntC6O9nsior+s9iyP3HLuOyB4CjLTkTl?=
 =?us-ascii?Q?frFE0FQb3WvIpUpK6Ho=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:14:42.9825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 106a47d2-9aa9-4caa-4411-08de28e6ca07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
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
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  6 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 56 ++++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  | 14 +++++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  9 ++--
 4 files changed, 61 insertions(+), 24 deletions(-)

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
index 57dff2df433b..1371a40d4687 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -229,9 +229,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 
 	*size = min(*size, (uint64_t)num_pages * PAGE_SIZE - offset);
 
-	*addr = adev->gmc.gart_start;
-	*addr += (u64)window * AMDGPU_GTT_MAX_TRANSFER_SIZE *
-		AMDGPU_GPU_PAGE_SIZE;
+	*addr = amdgpu_compute_gart_address(&adev->gmc, entity, window);
 	*addr += offset;
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
@@ -249,7 +247,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 	src_addr += job->ibs[0].gpu_addr;
 
 	dst_addr = amdgpu_bo_gpu_offset(adev->gart.bo);
-	dst_addr += window * AMDGPU_GTT_MAX_TRANSFER_SIZE * 8;
+	dst_addr += (entity->gart_window_offs[window] >> AMDGPU_GPU_PAGE_SHIFT) * 8;
 	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr,
 				dst_addr, num_bytes, 0);
 
@@ -314,7 +312,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
 	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (src_mm.remaining) {
 		uint64_t from, to, cur_size, tiling_flags;
 		uint32_t num_type, data_format, max_com, write_compress_disable;
@@ -371,7 +369,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		amdgpu_res_next(&dst_mm, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 	*f = fence;
 	return r;
 }
@@ -1876,6 +1874,27 @@ static void amdgpu_ttm_mmio_remap_bo_fini(struct amdgpu_device *adev)
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
@@ -1890,8 +1909,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	uint64_t gtt_size;
 	int r;
 
-	mutex_init(&adev->mman.gtt_window_lock);
-
 	dma_set_max_seg_size(adev->dev, UINT_MAX);
 	/* No others user of address space so set it to 0 */
 	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
@@ -2161,6 +2178,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	u32 used_windows;
 	uint64_t size;
 	int r;
 
@@ -2204,6 +2222,14 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
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
@@ -2365,6 +2391,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
 			    struct dma_resv *resv,
 			    struct dma_fence **fence)
 {
+	struct amdgpu_ttm_buffer_entity *entity;
 	struct amdgpu_res_cursor cursor;
 	u64 addr;
 	int r = 0;
@@ -2375,11 +2402,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
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
@@ -2392,13 +2420,13 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(adev, &adev->mman.clear_entity,
+		r = amdgpu_ttm_map_buffer(adev, entity,
 					  &bo->tbo, bo->tbo.resource, &cursor,
 					  1, false, &size, &addr);
 		if (r)
 			goto err;
 
-		r = amdgpu_ttm_fill_mem(adev, &adev->mman.clear_entity, 0, addr, size, resv,
+		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
 					&next, true,
 					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
@@ -2410,7 +2438,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
 		amdgpu_res_next(&cursor, size);
 	}
 err:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 
 	return r;
 }
@@ -2435,7 +2463,7 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->lock);
 	while (dst.remaining) {
 		struct dma_fence *next;
 		uint64_t cur_size, to;
@@ -2461,7 +2489,7 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
 		amdgpu_res_next(&dst, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->lock);
 	if (f)
 		*f = dma_fence_get(fence);
 	dma_fence_put(fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index d0f55a7edd30..a7eed678bd3f 100644
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
+	u32			gart_window_offs[2];
 };
 
 struct amdgpu_mman {
@@ -69,7 +72,7 @@ struct amdgpu_mman {
 
 	struct mutex				gtt_window_lock;
 
-	struct amdgpu_ttm_buffer_entity default_entity;
+	struct amdgpu_ttm_buffer_entity default_entity; /* has no gart windows */
 	struct amdgpu_ttm_buffer_entity clear_entity;
 	struct amdgpu_ttm_buffer_entity move_entity;
 
@@ -201,6 +204,13 @@ static inline int amdgpu_ttm_tt_get_user_pages(struct amdgpu_bo *bo,
 }
 #endif
 
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

