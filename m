Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA4C2FF5D
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D282C10E572;
	Tue,  4 Nov 2025 08:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lcsbLMo+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010016.outbound.protection.outlook.com
 [52.101.193.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4D110E578;
 Tue,  4 Nov 2025 08:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvWq6eAoY8M2of0cZ3ruuJDY3sQclQsP5gYMUkdTe8S8aGmgFOxmNkLkpo8WSNnJpM0KTzPy2UYtOr6FmLxaIUZEF3V7P/ob7EqkHEDYRLvlynW2Uyu9a9PlkWu+ETfIQ9TBql3yGKuPKXuQ6QxdAfn/jJFOyz1SAjiIwtbJwHejwwrD9xhFrl8EZSPeLLlRBexd4E+4DH9V5bPsffc6HuPiKho3+9Q5N27cm6kJ0B4qaoUBnD2fvea3ZhKG86PmwJPQA//l+8u5nB2LdsHVvIjVDA7BQts/Wm620SEqXa6q/S+Gl6kKqN90omTUNUe446RePe1hOfyRk20hHXLYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVUeeIVbhkD+2BKc5OJIwy6MMbvZeZnzeAJee6QKEQI=;
 b=W4u0m28tuhNBTVNq7jwPhhU+KG63Oitu0GWKu9X3jiX3KanrCy+A9uUlmjs1PyxZgL5x0O9G6aJeQe6N05Su+BJHUUAgolv/fugHkw6Es8+Fz0blAVatCNYim6zNox1us9m4IT0ahvw6WPaA68/WjlHWL40oZ2E/aZASDmsC2J1X8L7af4spRiCRBbUNde4I+XuTgdD2aeoDS1OZhzCUJJCB34xlIccFuqYG7bpAHzsNohAqeuZ/ZF8iO6Hxic0u702+UGx4V4/095zatOV1gqzQdLoVCOxhJcpG1YTlF2bRAeEiQ0hj5qKJOnR9jxXt2iHzKg9y9kRpe03/LwPrww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVUeeIVbhkD+2BKc5OJIwy6MMbvZeZnzeAJee6QKEQI=;
 b=lcsbLMo+mB7F5J0DAvUAeZoSudHIMP2TwesRzwi8HVWp+HBHDG3U4SSxAbxF43bHH4XvUV4nlVK+RwXu9cKUo1Mjl7v/iaYvvlUIPc+DYY/bZ+T0IIMIavP8PFsQXeJnpxoWc8mJJ1xm6DcE0P/w1Tf3M0dWrD9XK1MS7JgZn8E=
Received: from SJ0PR03CA0082.namprd03.prod.outlook.com (2603:10b6:a03:331::27)
 by IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:36:47 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::dc) by SJ0PR03CA0082.outlook.office365.com
 (2603:10b6:a03:331::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 08:36:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:46 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:43 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 08/20] drm/amdgpu: allocate multiple move entities
Date: Tue, 4 Nov 2025 09:35:23 +0100
Message-ID: <20251104083605.13677-9-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|IA0PR12MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 491f28d1-8095-4948-e716-08de1b7d4a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BNS0s67okwmDmoYL01Tx07WoSaxRHYR3cDmegyduJQqv9aeT8lXFG7AFKKuV?=
 =?us-ascii?Q?ueqIy6nayNe6g6XyVL5r5nryPnuiVKVeMPY2Wd759KoJb5QP10ntGNUAqV9H?=
 =?us-ascii?Q?gXs6PCV5zzd5LcUfwr9qKx4oSIZP7aWGszPqc0pFnccdYldCe6ceJPWrAnQj?=
 =?us-ascii?Q?gF4t4/ZxffGv0Lq94lIoSSACC11WHE6wNXyjU4200k2+Ay+Jx7tfHXqxYKnt?=
 =?us-ascii?Q?LhS/AuCQml0t4N8Ix3RadNmkhPFV9QIZPp3JYtgbcV+tA/2Yu6en/2sn1d73?=
 =?us-ascii?Q?ac1chcjIRTkXAoAwOBuAo3R4KmDKEzs7ekO2slP1tP/Y1PbyUgnPVXtpso/A?=
 =?us-ascii?Q?qs44po3aIXQ12ZwMzfSN1YqlGVeStcD1wrmDNEaJiWhb2oDT8yuiOZaqlxwR?=
 =?us-ascii?Q?fp2Zdb+mYNiq0m7XxLkHMGM+YVHJjmH2fbpQdBtTolLx4vtgeiH5mLwi40ny?=
 =?us-ascii?Q?sM5BRRdMBUE5zn6sR9dPWftNoQ4akujb0wEQ+rezGdWPdxO3YQh6JekL1qUu?=
 =?us-ascii?Q?2cFUKe9SlC/diapTa82ULZi0YQ6JF0Vg2MS4wBArjBd9kAycWkb+ZzFSiyct?=
 =?us-ascii?Q?dxW6TQ1CHI+UYzSE3alJVqATz6VtaYxdlt72wA2St84UyvjXu155iIbyb6nX?=
 =?us-ascii?Q?ivFxboE1JI+Km8dlhPaOK4jwWw5oOGTKO0DXzExBhgA/Lu9W9MIer/12hpTk?=
 =?us-ascii?Q?Pe33S0l9k4hyKa3N89mM4RwE7Ts7rpI9OW2gPMvWm0oFnlAZl/mBcpaPlWs9?=
 =?us-ascii?Q?EY9XXN7QvK1wSN6piTWMEpZWlIJsoJRwE7wjbOc1dqOBUYoCLKEpubXtQjLE?=
 =?us-ascii?Q?4wdtx5atuIrUCCfGqZ1oa467hxtRnytzk+lbhSU7MgwoXub5qMeP54T97JyK?=
 =?us-ascii?Q?bfHGpQF6sm/kF04LpG8B6HC8GOe+1VgiWgg6PWcd3qrvpQPyRoWeNKM4Es8F?=
 =?us-ascii?Q?AMRepM9XHofMsc+7Ce5+bc8SzhAvfZKgBJ+oC377nQyKJKwftAWVX7DZlvkR?=
 =?us-ascii?Q?StP84W5dWZaB1lNg0qh5fNEMuJR1s3M1vUKVGmzAWcc6tXDsd6rs+AzgItnD?=
 =?us-ascii?Q?AQHhwxQz74coQQwU9QLPFGr4Jufl0ZAtb6Mk3s3LZ28xvRnBwzudAynOV/CS?=
 =?us-ascii?Q?Dt1T3lGwq2flcudM04VJ03Mdw1Iakr74ZBsO2a7f7HemucwbMA21165VLsD7?=
 =?us-ascii?Q?FpC1eNXFieYHBDIueqH9sj0FpvG47fZcpZCc4VeF9QQwc00dAO6gFBnfHfT7?=
 =?us-ascii?Q?yM66wyD3i4Cm+bMKFhZw8bFteAuTmpoJkfCHGDC2GpBwF1F7J4z5lJmdNaBD?=
 =?us-ascii?Q?YJ2HtqA+tww9+lJMEfJUKq//C85XzoXPfH1G3LgI1G1hlAGvTgSG4A1z6aAj?=
 =?us-ascii?Q?soT6rGn4Cz5hCH/RQ/LAuDRlLHM6FTZB6OIjgCPJtJ0ioOqvXtlEyAnwyCg2?=
 =?us-ascii?Q?a05yazlbe+FJ8p+PlYMnA1BiM1G4+YiuCWrNgIDojU/ExLC4MKF5QapRM5NX?=
 =?us-ascii?Q?b6TCAcuUcjWby4uUZm4gdSf01Vr1cuP7Txzr1b/lpmo3CsF5i7FMgG40+rdo?=
 =?us-ascii?Q?BnZ0WFGQ5y5v7EzDC98=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:46.2880 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 491f28d1-8095-4948-e716-08de1b7d4a46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205
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
index e0e469b73013..1b3945513157 100644
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
+	num_move_entities = MIN(adev->sdma.num_instances, TTM_FENCES_MAX_SLOT_COUNT);
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
 		for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index e7ada4605472..2874f054e869 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -72,9 +72,10 @@ struct amdgpu_mman {
 	struct mutex				gtt_window_lock;
 
 	struct amdgpu_ttm_entity default_entity; /* has no gart windows */
-	struct amdgpu_ttm_entity move_entity;
 	struct amdgpu_ttm_entity *clear_entities;
 	u32 num_clear_entities;
+	struct amdgpu_ttm_entity move_entities[TTM_FENCES_MAX_SLOT_COUNT];
+	u32 num_move_entities;
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 7aade289f32a..5daacb816cf7 100644
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

