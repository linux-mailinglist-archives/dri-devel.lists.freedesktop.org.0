Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C412BC2FF19
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1CA10E55B;
	Tue,  4 Nov 2025 08:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mQK7dSiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011042.outbound.protection.outlook.com [40.107.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E4B10E552;
 Tue,  4 Nov 2025 08:36:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZ/gbLlNXxEoec1/lN2H2CSvwm0hvKHrPLKQBPMLy9DvaaN0RnQ5mnvLj1Gu3j0AwIdhZ2Cra0fSqtAw0xRZY3INOT7OP1tQRISBolVn6WVjjYBqv+MTISn/Sq1iwkYHOou1a2Qw/bbv1k8P/GYG/BcWEXCGeudMnq5CAjxwfTVMUqlQfHuZChig9EbiLTBzsq2hlA8QotO7mtbcC2bsYb+N5e/vPll/dFz8opzSCy08W6hbrsZj+BNehc1wHBXV3bo/0oAUEmR/eMqYvc/mPncVSk3PSYBfUwFHqKh+CFbOCs8whY7ozg3pdSVid9Zi/jjDS8Z1qjb7iXOSkUvokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5pbSzJ1f7UJyLto67V6Gdvyg45zmlY9GMYoy4pidpg=;
 b=lNvyK7rltl8Re5nX1v+l0OaP6TZ0R0tEyMQj0n2RLCbmIfXTmC+vUFsHUivhIYTmeLzCghftf0RS/olqkMJSaubIaHD58CrzJMwtz1WHjjcPJIU6Q/Qm8Xxl8qHBX1qmd4myoRRk3lB1sizsMG0THZlBQhOnW2M6Aj4zflDrp7s8mfjUw/4V4byilTy0J7gPf9R3XPb1GYliIRclG3qztzKRS3AJYE5ilzq001GZejZV+mjJfKzvbiDzOhoyQ4fViItwnUNvl2K01rX7OT3Z8xHiQNFoVqe7ydIh1t8RMMqKkLNpedFbDSxT5qYb/ixjB5iiBR0xvABu7W5tnhc4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5pbSzJ1f7UJyLto67V6Gdvyg45zmlY9GMYoy4pidpg=;
 b=mQK7dSiz4ppM0PjrG8mxZlJf9w+gG59gxTwhojS0uy0UkGtXIQdUUpPMGdycpFhHDouBsDwA3LC8Jq0k/Cb3KPtzO2NQOQ+vQttLyjxvatLxkWWzX4qs1CdWSoMNr9z7dQiDTneAmhe5rI1ShiGDEoDt0iO8G4XtxL9w8DeNZ3k=
Received: from MW4PR04CA0263.namprd04.prod.outlook.com (2603:10b6:303:88::28)
 by BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 08:36:41 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::65) by MW4PR04CA0263.outlook.office365.com
 (2603:10b6:303:88::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:41 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:39 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 06/20] drm/amdgpu: statically assign gart windows to ttm
 entities
Date: Tue, 4 Nov 2025 09:35:21 +0100
Message-ID: <20251104083605.13677-7-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|BY5PR12MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 6582becb-f53e-49bb-7154-08de1b7d4766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+hBLMJgitn9iq2XbK4+AcCZWcrFntqIKMxbJW1oxvGtw9FL820qrqgsp1jP6?=
 =?us-ascii?Q?j1rQgJhVdj+PS5UY4TsDrmLwbdyJ3fed/TO/r+D2qG0djTSbnPhTuAPMDqIq?=
 =?us-ascii?Q?R4DYSs6fPrVQ8vkaa5w/4qX26MJRhiQZ0kNqBzplX4CRUJTEYq2jLruHY5OZ?=
 =?us-ascii?Q?+odO28uHtXsuSiLnKHTqGCvub/YG0sO/a110QJVNr2KJzlt5wbrzFvWOCWQB?=
 =?us-ascii?Q?I0INrBTZjl5A5vnFYywxjPUpTMOTCgmwSvcvIJ6Qo6UU20h6rqtckRTZHqSw?=
 =?us-ascii?Q?Qj1ML0kXJjIuhTwBgVqaEuSlAKw5wdF/9k1RbRcHElqzUsnw60mqkLPjwWtc?=
 =?us-ascii?Q?SCvzv5UipMfKtzdVlAWz1lQi9z7XpBAn7LtKgQjjwj4/1mrgc+iWJfsdsCo7?=
 =?us-ascii?Q?UvJSSocK+8StCf3ZgO9/zH8i1LHKsnJj3P1Obper4p6Hj0zKyLkqzgKOhn+l?=
 =?us-ascii?Q?+zrpfNPRIvPCOThIWRf/GSy2zILH/vuzKSOUXdA4Dq2ojX8X98mU/CEyFSll?=
 =?us-ascii?Q?BczHxvyahRmNGwgicb7nSeq9NuXXQGzUx2o3ns4iPMQm5zeOzMiA/5JM77+L?=
 =?us-ascii?Q?SQMlDI4WN+9vhi63MEG5DSzC3/a0OyPq1+mey3s9r/+CppQuHXKTO1xPNnUv?=
 =?us-ascii?Q?5NG7DEhQwqtEsrY4xk6kI0fmvKcAk0rzRTOw9Ys4quXnKesuXieDK0QyNWZe?=
 =?us-ascii?Q?vsxcBbNlvhsWk+6AtYzgmj95jktX3ixRVYxs2fD95zMYau/XOReee5JxOllj?=
 =?us-ascii?Q?7P+lhcrKs9IQT+U6JM/la5g3y/yUHb9CLqlI3iEX88Z2oLteeGVCr5PSskZ3?=
 =?us-ascii?Q?znmi/RgWCzVGyStAp8dc+dZUGzPPS0kh4/5copS+6l7Q8OVZku6SwbHBj3E0?=
 =?us-ascii?Q?olHBH93UT62gmmjoPq8sEvLtGI1QJ6ZB1BtfAaBa1vCorvB4qUfn75X0XN6W?=
 =?us-ascii?Q?v1h+kmFR2JguuRgYoNgm3w4hPSRvIhTpFdIATGhvd6bPYGVtFNUc4cuilzZB?=
 =?us-ascii?Q?OouI8rgUKzPVH5UPpT8KV/bte2xiNHYHy4gP8Iawu9U6C97vc3Q6RLmwhcGD?=
 =?us-ascii?Q?kSLtkhnk2EoEchbelFtuQtz8mM+wMrhSlp7lfNnB2z6Q0aaKVXEhujh+QMtx?=
 =?us-ascii?Q?TDI+oOrL4EgLQLRecSneb29DEBU0Cz9HX8vLxqWh9Oo9V8dYO36x6M9QFe6w?=
 =?us-ascii?Q?uiGXY37mTQclaS3Xjw3sSZ5XY0WSg60zxnATFjg35pyMNLoGvUNc++I0vBPZ?=
 =?us-ascii?Q?GAf1s4usUIMFjdysYkyuPchv9WfOlhQxcyG+81zlCUNHMiPzgrg0QJIpowKj?=
 =?us-ascii?Q?3CF9JOTZHkkPUYdoVFh1V9nCKDT4XgVS/wXxfVq0Tpsq+if+8zDI9FbWMuk8?=
 =?us-ascii?Q?5dzjPDLh/gGCwYyQyt+2ufrGIqmpqpSWgjGldIIRxILujCBS0zFi3ZSD9V7A?=
 =?us-ascii?Q?RXaPp9UuwQ3d6Ue7+UT71SE2SlIp1oY+yUkckrl+YRXdx/9wjL3Hgv9QO8dd?=
 =?us-ascii?Q?hQAXEyvagje4Sx3V9J0tjLT/wxLKVNaJMMofn+iTXN4iu2pt8pPuDrjWeSVS?=
 =?us-ascii?Q?5B2s50AsCiSleImccQY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:41.4607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6582becb-f53e-49bb-7154-08de1b7d4766
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242
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

This commit gives separate window id to each entity, so jobs
from multiple entities could execute in parallel if needed.
(for now they all use the first sdma engine, so it makes no
difference yet).

default_entity doesn't get any windows reserved since there is
no use for them.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  |  9 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c  | 48 ++++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h  |  7 +++-
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  8 ++--
 4 files changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 8e2d41c9c271..2a444d02cf4b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -686,7 +686,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 * translation. Avoid this by doing the invalidation from the SDMA
 	 * itself at least for GART.
 	 */
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&adev->mman.clear_entity.gart_window_lock);
+	mutex_lock(&adev->mman.move_entity.gart_window_lock);
 	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.default_entity.base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
@@ -699,7 +700,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
 	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
 	fence = amdgpu_job_submit(job);
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
+	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
@@ -707,7 +709,8 @@ void amdgpu_gmc_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	return;
 
 error_alloc:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&adev->mman.move_entity.gart_window_lock);
+	mutex_unlock(&adev->mman.clear_entity.gart_window_lock);
 	dev_err(adev->dev, "Error flushing GPU TLB using the SDMA (%d)!\n", r);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index bd35bea4b573..3a77eea8869d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -291,7 +291,7 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
  */
 __attribute__((nonnull))
 static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
-				      struct drm_sched_entity *entity,
+				      struct amdgpu_ttm_entity *entity,
 				      const struct amdgpu_copy_mem *src,
 				      const struct amdgpu_copy_mem *dst,
 				      uint64_t size, bool tmz,
@@ -314,7 +314,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 	amdgpu_res_first(src->mem, src->offset, size, &src_mm);
 	amdgpu_res_first(dst->mem, dst->offset, size, &dst_mm);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->gart_window_lock);
 	while (src_mm.remaining) {
 		uint64_t from, to, cur_size, tiling_flags;
 		uint32_t num_type, data_format, max_com, write_compress_disable;
@@ -324,15 +324,15 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
 
 		/* Map src to window 0 and dst to window 1. */
-		r = amdgpu_ttm_map_buffer(entity,
+		r = amdgpu_ttm_map_buffer(&entity->base,
 					  src->bo, src->mem, &src_mm,
-					  0, ring, tmz, &cur_size, &from);
+					  entity->gart_window_id0, ring, tmz, &cur_size, &from);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_map_buffer(entity,
+		r = amdgpu_ttm_map_buffer(&entity->base,
 					  dst->bo, dst->mem, &dst_mm,
-					  1, ring, tmz, &cur_size, &to);
+					  entity->gart_window_id1, ring, tmz, &cur_size, &to);
 		if (r)
 			goto error;
 
@@ -359,7 +359,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 							     write_compress_disable));
 		}
 
-		r = amdgpu_copy_buffer(ring, entity, from, to, cur_size, resv,
+		r = amdgpu_copy_buffer(ring, &entity->base, from, to, cur_size, resv,
 				       &next, true, copy_flags);
 		if (r)
 			goto error;
@@ -371,7 +371,7 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		amdgpu_res_next(&dst_mm, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->gart_window_lock);
 	*f = fence;
 	return r;
 }
@@ -401,7 +401,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	dst.offset = 0;
 
 	r = amdgpu_ttm_copy_mem_to_mem(adev,
-				       &adev->mman.move_entity.base,
+				       &adev->mman.move_entity,
 				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
@@ -1893,8 +1893,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	uint64_t gtt_size;
 	int r;
 
-	mutex_init(&adev->mman.gtt_window_lock);
-
 	dma_set_max_seg_size(adev->dev, UINT_MAX);
 	/* No others user of address space so set it to 0 */
 	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
@@ -2207,6 +2205,15 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 			drm_sched_entity_destroy(&adev->mman.clear_entity.base);
 			goto error_free_entity;
 		}
+
+		/* Statically assign GART windows to each entity. */
+		mutex_init(&adev->mman.default_entity.gart_window_lock);
+		adev->mman.move_entity.gart_window_id0 = 0;
+		adev->mman.move_entity.gart_window_id1 = 1;
+		mutex_init(&adev->mman.move_entity.gart_window_lock);
+		/* Clearing entity doesn't use id0 */
+		adev->mman.clear_entity.gart_window_id1 = 2;
+		mutex_init(&adev->mman.clear_entity.gart_window_lock);
 	} else {
 		drm_sched_entity_destroy(&adev->mman.default_entity.base);
 		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
@@ -2371,6 +2378,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_ttm_entity *entity;
 	struct amdgpu_res_cursor cursor;
 	u64 addr;
 	int r = 0;
@@ -2381,11 +2389,12 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 	if (!fence)
 		return -EINVAL;
 
+	entity = &adev->mman.clear_entity;
 	*fence = dma_fence_get_stub();
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->gart_window_lock);
 	while (cursor.remaining) {
 		struct dma_fence *next = NULL;
 		u64 size;
@@ -2398,13 +2407,13 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(&adev->mman.clear_entity.base,
+		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &cursor,
-					  1, ring, false, &size, &addr);
+					  entity->gart_window_id1, ring, false, &size, &addr);
 		if (r)
 			goto err;
 
-		r = amdgpu_ttm_fill_mem(ring, &adev->mman.clear_entity.base, 0, addr, size, resv,
+		r = amdgpu_ttm_fill_mem(ring, &entity->base, 0, addr, size, resv,
 					&next, true,
 					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
@@ -2416,7 +2425,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		amdgpu_res_next(&cursor, size);
 	}
 err:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->gart_window_lock);
 
 	return r;
 }
@@ -2442,7 +2451,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->gart_window_lock);
 	while (dst.remaining) {
 		struct dma_fence *next;
 		uint64_t cur_size, to;
@@ -2452,7 +2461,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &dst,
-					  1, ring, false, &cur_size, &to);
+					  entity->gart_window_id1, ring, false,
+					  &cur_size, &to);
 		if (r)
 			goto error;
 
@@ -2468,7 +2478,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 		amdgpu_res_next(&dst, cur_size);
 	}
 error:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->gart_window_lock);
 	if (f)
 		*f = dma_fence_get(fence);
 	dma_fence_put(fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index a3be0e06e1e7..8b7a56737479 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -39,7 +39,7 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
+#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
@@ -54,6 +54,9 @@ struct amdgpu_gtt_mgr {
 
 struct amdgpu_ttm_entity {
 	struct drm_sched_entity base;
+	struct mutex		gart_window_lock;
+	u32			gart_window_id0;
+	u32			gart_window_id1;
 };
 
 struct amdgpu_mman {
@@ -69,7 +72,7 @@ struct amdgpu_mman {
 
 	struct mutex				gtt_window_lock;
 
-	struct amdgpu_ttm_entity default_entity;
+	struct amdgpu_ttm_entity default_entity; /* has no gart windows */
 	struct amdgpu_ttm_entity clear_entity;
 	struct amdgpu_ttm_entity move_entity;
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index dfcba2c4580d..7aade289f32a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -60,7 +60,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
 	int r;
 
 	/* use gart window 0 */
-	*gart_addr = adev->gmc.gart_start;
+	*gart_addr = entity->gart_window_id0;
 
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = npages * 8;
@@ -116,7 +116,7 @@ svm_migrate_gart_map(struct amdgpu_ring *ring,
  * multiple GTT_MAX_PAGES transfer, all sdma operations are serialized, wait for
  * the last sdma finish fence which is returned to check copy memory is done.
  *
- * Context: Process context, takes and releases gtt_window_lock
+ * Context: Process context, takes and releases gart_window_lock
  *
  * Return:
  * 0 - OK, otherwise error code
@@ -138,7 +138,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 
 	entity = &adev->mman.move_entity;
 
-	mutex_lock(&adev->mman.gtt_window_lock);
+	mutex_lock(&entity->gart_window_lock);
 
 	while (npages) {
 		size = min(GTT_MAX_PAGES, npages);
@@ -175,7 +175,7 @@ svm_migrate_copy_memory_gart(struct amdgpu_device *adev, dma_addr_t *sys,
 	}
 
 out_unlock:
-	mutex_unlock(&adev->mman.gtt_window_lock);
+	mutex_unlock(&entity->gart_window_lock);
 
 	return r;
 }
-- 
2.43.0

