Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD46EC2FF73
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E875910E546;
	Tue,  4 Nov 2025 08:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nhHMC+ev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F16210E57C;
 Tue,  4 Nov 2025 08:37:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEFCbgFfUCN4Wlv2Axf1YVPjjEgnhXIAWK2BRKZmnzSYwW7NIHRNMbtRj35eqeSc54ucx36cgVnafRaIh24jZkgXvXKRtxhLyTeNVs/cL9yFws/TLr2QQ2QrEPP5zZu8J5ca81tsy9CrFEhuWi9Z2bEm2jMvEc93nT27I4DtGDuaDSgdQqmzENy+R8SKAKtlpWcx/5v0xcqcZvhBq+kJtgNZWYp0BeFuu6ifQuhS11LYB6IavwFx33fHRwDKqlEJb0ynh62gsDPR5Y7irRhsVnxjabHt+tLEZCjdNfHHKwqnMzfdn7tO8CnDETz1JNhecNqCixVWZBWQIjm2JPOmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8ztPGbj/c6BS6y3z8Ur9HV1fVq5pfBUJMnE+G6pq8w=;
 b=Fju4wOENvaGaADZp/Ai/jteyxxHep/oHUB/yNzEHOny1zibhaqZucZuth+T/VQaPMAiROCnQaqnKapvkKUMJq46qm6T7rS3xLIK+o7WYa09y/iq646W917y4Wgb0vrYArUPmmrbOy93QyGrQbGUTQPTPYjOvxwrlwILUkr9aSg1Mhr/s97VJFQ9Vm1PZ9CGl/hky0P+eXLmpiCMHz+LUuvzFqmR3hPS8PB6N92XDZ1pqtMDv2bshkIiLq5YxhglLPG7jxmeay6xSHsyvDRD5xrEm5ZVxIdfA/Ua/zE+aerpQyFQRsJnIMX9s5oZLtlduM1ygMbxfSKh81JkwBgsFEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8ztPGbj/c6BS6y3z8Ur9HV1fVq5pfBUJMnE+G6pq8w=;
 b=nhHMC+evAYtNZp/pMdfkRu36xua/ZFS0hcTdCdT04/RyqwvNjvjCpIY4q2XhScq8h3lKtF+PrjPX8/cysG8LmJzJbqeGxU5RW+JnPQjBsp/UyUl5DKm5Y0GI2FHmOqL34gxWGQQcRsnIfINAqF8ihNlGJLFftUYWsvWbmrnpjo8=
Received: from MW4PR04CA0250.namprd04.prod.outlook.com (2603:10b6:303:88::15)
 by DS0PR12MB7948.namprd12.prod.outlook.com (2603:10b6:8:152::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:36:54 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::34) by MW4PR04CA0250.outlook.office365.com
 (2603:10b6:303:88::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:36:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:54 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:51 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v1 11/20] drm/amdgpu: use multiple entities in
 amdgpu_fill_buffer
Date: Tue, 4 Nov 2025 09:35:26 +0100
Message-ID: <20251104083605.13677-12-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|DS0PR12MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 11fe51e8-3c5a-444f-32e1-08de1b7d4eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|3122999009; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gEj66nHyPIuxhr4J0QcNCw30oYUrwF5mdL9MZvHs4vpFNy010gXrAIR3UwqT?=
 =?us-ascii?Q?3OReDNkak5+8cLu16Cr7Y9rVTi2j/2gKm21XQWMiaI/YG2k54l34xiWLjd2G?=
 =?us-ascii?Q?HpXx1a5HRRTjKVwMSd7wkds7oaXz6ZnYTaJ5uMRtcwCo8l3bjHXcbjZjUMqs?=
 =?us-ascii?Q?6f7lYojTkATu4SOXTzVFtJHFMmwlW+AjMPz53PDskwF3FS+TtdgBF4S3YFlI?=
 =?us-ascii?Q?gjfpfMuGThdK2oEUE8KRgE3AUzTv+qet5R5RjRmyWQO7cyLjYG7N4OUUXPE8?=
 =?us-ascii?Q?E2u5QEGQvwBcLJqNhkMP+ks/tm5luX58PoszR4Jd020w5Gf3Ybb912wxz0Yz?=
 =?us-ascii?Q?G3cBQiTiaUMnqiHTKd2QNqCi+0CThcY1i99lirzf45BImvAMfyq9L36XVijV?=
 =?us-ascii?Q?YeRh7WBF53aso/tZ7G3vEiw7vBTsayxy93Q1weWtIEPN4UBw9YLj8PSNGCAb?=
 =?us-ascii?Q?6S5ZqBxvY+dennfjpwMKF4RMaX8/+LTls5VFyUNeqxTpY2gPvUgmYhHiI12T?=
 =?us-ascii?Q?p+42Ls6pV+zmCVJFAhZkROEZj2s6lrVp3RsdFX3StGsQ5WwzsewvSNyjOqn9?=
 =?us-ascii?Q?6qo52q3IgtnUAf1ktvfOoZ0shxtnA0ksySFs4oyJgL5NAl4P6btFgkfj6UVi?=
 =?us-ascii?Q?mFhnOZRcrvQ/hanhAz7FepbvSTtzrjuiDZ2CFEGHca2RkTrfdHtS5zgL+08b?=
 =?us-ascii?Q?a3Dbsy7UCFgJbjsajeu4trn7vXnS+OXDA72cK4MvSYja4Tu5njXn9/dwQc2w?=
 =?us-ascii?Q?nK9DwJLxkYp56d9pr7jcbbCdcC0dA/PIC1KpO8xqBZuEzxr/YwKXdkA1983z?=
 =?us-ascii?Q?KD3JbmDDhMf/E/Gvy6CF77RSs9ADDg9aw101ByXVLILNPNpMyaHFhfE+DhSG?=
 =?us-ascii?Q?0gij3j8avGC0BPDnGsppIxTGYZhs1QhiB9wxCzhOxJAxNwKGswGJ9seiqko1?=
 =?us-ascii?Q?RVT1Hef6VmLU4I4CBMVZGKk1rIKMb9RVuHbJO/wEjX8tQMQgxos3ZVz8gMQP?=
 =?us-ascii?Q?obFyPBQaVT++CU+XRyHbcWuYnt16y5+WYw/BePh2XLOZJTercpSrCP44T6aM?=
 =?us-ascii?Q?FJyy9FtfwuZ3nB4uSValJQDwfklr8dsdF6DjlFXOnSlmgLEcrnMh6r3GjQCI?=
 =?us-ascii?Q?3NH0fg4tcZf51PjH+LHjsQ9wWic/iqVDCq9EdOMn5BK0M9IMEXvh/Sh75LS/?=
 =?us-ascii?Q?C9/go7V/fy3An5mftIKKXkjNyzITQ+nOkAZ9hsySE49ihVz0Y8jZnxJQjCwz?=
 =?us-ascii?Q?1USGzN2mEY+c51rlEtJBqNL0a1JOI3p/g5c/JRFjX2JCjYgKz7iAtdxj5vpS?=
 =?us-ascii?Q?H+McCM1vvohYtOVTgtOrI05mSvOdNoyIFevN/505kYtKkjK6p89v0dnIF1LO?=
 =?us-ascii?Q?gHDXO48fTuFJa/lsJXjfhhcqrl5E7hKqGpIOVnComeglUhLd/em0xqMgDQQi?=
 =?us-ascii?Q?aT5T6LYI4kae9oB1VmxLwhIQ0OISdQOutbbLWph5nQmf6LEVHxGU1u/bm+iK?=
 =?us-ascii?Q?MeQhNxo7uJklgG2vM58Y7qK7E4pZf+rZByrR2fEhwxbfE6t5en5YdI8jSROs?=
 =?us-ascii?Q?YRDXCQvFLaMSgqqrcuA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(3122999009);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:54.1015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11fe51e8-3c5a-444f-32e1-08de1b7d4eef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7948
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

The benefits of using multiple entities is that multiple fill jobs
can run in parallel. Otherwise, even if the entity has access
to multiple engines, a burst of N independent jobs will all
run on the same engine because an entity guarantees the ordering
of execution matches the ordering of the submission.

Callers can opt-out of this behavior by passing the entity they
want to use (see amdgpu_move_blit).

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 84 ++++++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
 2 files changed, 64 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c357a6d9763a..839ea8c7f6be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2224,6 +2224,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		adev->mman.clear_entities = kcalloc(num_clear_entities,
 						    sizeof(struct amdgpu_ttm_entity),
 						    GFP_KERNEL);
+		atomic_set(&adev->mman.next_clear_entity, 0);
 		if (!adev->mman.clear_entities)
 			goto error_free_entity;
 
@@ -2498,10 +2499,12 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct dma_fence *fences[TTM_FENCES_MAX_SLOT_COUNT] = {};
 	struct dma_fence *fence = NULL;
 	struct dma_resv *resv = NULL;
 	struct amdgpu_res_cursor dst;
-	int r;
+	uint64_t cur_size, to;
+	int r, e, n_fences;
 
 	/* The fences will be either added to the resv object or the last fence
 	 * will be returned to the caller. In the latter case, all fill jobs will
@@ -2515,53 +2518,92 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 	}
 
 	if (!entity) {
-		entity = &adev->mman.clear_entities[0];
 		resv = &bo->tbo.base._resv;
-		r = dma_resv_reserve_fences(resv, 1);
+
+		/* Determine how much fences we're going to add to the
+		 * resv object.
+		 */
+		n_fences = 0;
+		amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
+		while (dst.remaining) {
+			cur_size = min(dst.size, 256ULL << 20);
+
+			n_fences += 1;
+			amdgpu_res_next(&dst, cur_size);
+		}
+		if (n_fences == 0)
+			return 0;
+
+		/* One slot per entity at most. */
+		n_fences = MIN(n_fences, adev->mman.num_clear_entities);
+
+		r = dma_resv_reserve_fences(resv, n_fences);
 		if (r)
 			return r;
+	} else {
+		mutex_lock(&entity->gart_window_lock);
 	}
 
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
-	mutex_lock(&entity->gart_window_lock);
 	while (dst.remaining) {
-		struct dma_fence *next;
-		uint64_t cur_size, to;
-
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
+		if (resv) {
+			/* Pick a new entity for each partial clear so they can
+			 * execute in parallel.
+			 */
+			e = atomic_inc_return(&adev->mman.next_clear_entity) %
+				adev->mman.num_clear_entities;
+			entity = &adev->mman.clear_entities[e];
+			mutex_lock(&entity->gart_window_lock);
+		}
+
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &dst,
 					  entity->gart_window_id1, ring, false,
 					  &cur_size, &to,
 					  dependency,
 					  resv);
-		if (r)
+		if (r) {
+			mutex_unlock(&entity->gart_window_lock);
 			goto error;
+		}
 
 		r = amdgpu_ttm_fill_mem(ring, &entity->base,
 					src_data, to, cur_size, resv,
-					&next, true, k_job_id);
-		if (r)
+					&fence, true, k_job_id);
+		if (r) {
+			mutex_unlock(&entity->gart_window_lock);
 			goto error;
-
-		if (resv) {
-			dma_resv_add_fence(resv, next, DMA_RESV_USAGE_KERNEL);
-			dma_fence_put(next);
-		} else {
-			dma_fence_put(fence);
-			fence = next;
 		}
 
 		amdgpu_res_next(&dst, cur_size);
+
+		if (resv) {
+			/* Delay the addition of the fences to resv, otherwise the next partial
+			 * clears will depend on this one.
+			 */
+			fences[e] = fence;
+			mutex_unlock(&entity->gart_window_lock);
+		} else {
+			dma_fence_put(*f);
+			*f = fence;
+		}
 	}
 error:
-	mutex_unlock(&entity->gart_window_lock);
-	if (f)
-		*f = dma_fence_get(fence);
-	dma_fence_put(fence);
+	if (resv) {
+		for (e = 0; e < adev->mman.num_clear_entities; e++) {
+			if (fences[e]) {
+				dma_resv_add_fence(resv, fences[e], DMA_RESV_USAGE_KERNEL);
+				dma_fence_put(fences[e]);
+			}
+		}
+	} else {
+		mutex_unlock(&entity->gart_window_lock);
+	}
+
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 38df2b5b4bc7..3fc31c7c6bfe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -73,6 +73,7 @@ struct amdgpu_mman {
 
 	struct amdgpu_ttm_entity default_entity; /* has no gart windows */
 	struct amdgpu_ttm_entity *clear_entities;
+	atomic_t next_clear_entity;
 	u32 num_clear_entities;
 	struct amdgpu_ttm_entity move_entities[TTM_FENCES_MAX_SLOT_COUNT];
 	u32 num_move_entities;
-- 
2.43.0

