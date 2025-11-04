Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01201C2FF28
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:36:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED8910E560;
	Tue,  4 Nov 2025 08:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QVCuwZaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010000.outbound.protection.outlook.com
 [40.93.198.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D571110E556;
 Tue,  4 Nov 2025 08:36:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUsf2S3nz/U5b5f5Rgm8K7QHs5SaaQ2/zm3zoxJwJ9JoweoAQbGlzH6JzuhYn/+bpytW7ThuqTgAZT8IpQIuTQEy7tkxWHBG4DNR8hOVg1HT2PhtlAoGQvXe37dvzZezJHqC8te+3LsNKLTn9AYaT11+u21RTCI55YgVgkkypfq+oIPO1JyBLrH9ycQ1rUvJvI2RsCaimsfw6hVoBA5wUwAxBvfIEAj09RcqIPEEhWXbjE3g2omfSKhy9Mto3t004UATt6p3SNdXHZydMtihDEq8MhiU/c3Uy66tt6M/P0ulPDXKIGQs+OXZ8m23XxHa+iKDwgbCINrl1QGPLVOiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEl/ULXiYyBnyYIVr2SM32kDBMfqZ+u9TW5tG+/AXpg=;
 b=b9/io/tSUXlycGccZ0RKi2mqenb471x1wdoLWi9qqYsG5HtgQALZore/64Im7wvW3xm9ED0Vq9dJgd3QKsiY64IFHvPrkV6AJGD1IIlck26Dvn2ji22+lovL4qygBu329eF+qxDPIHWlap4HoB6ZKkh5/3LpSwQr407x23oQ8VbVYDKuv5FcAYjcB0ZDOL7tAC6qICdXuDMKk5iJo/tCD6gqqxshp5PISqLfxoeuYDBz8bAYumaUgArpDA+VbgLByzRVSjadjPxGab8VGRvbZr0SSpy2uQbehjdqK2pwPhE0vPuUmKsCHOL0H6/3e6YODJbaylaFSNp24G19G1iSGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEl/ULXiYyBnyYIVr2SM32kDBMfqZ+u9TW5tG+/AXpg=;
 b=QVCuwZaUHgXfS0L7Fhbs5JTlZWNgbd89Du0cpj/ipU/38TneG3Cxx575oCtsETvH/QOF5tEna1U7TA3iGOt7Y1W+V7+xmNaQDjZe8z5McDsPLswl+1FXT09Jz2MOhzEmIMXCRJR4I3i1ckLwJvtgDtO9j8BLxrQaruvGG6qnpxk=
Received: from SJ0PR03CA0070.namprd03.prod.outlook.com (2603:10b6:a03:331::15)
 by LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 4 Nov
 2025 08:36:37 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::b3) by SJ0PR03CA0070.outlook.office365.com
 (2603:10b6:a03:331::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:36:36 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:36:33 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Felix Kuehling
 <Felix.Kuehling@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 04/20] drm/amdgpu: introduce amdgpu_ttm_entity
Date: Tue, 4 Nov 2025 09:35:19 +0100
Message-ID: <20251104083605.13677-5-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|LV2PR12MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: 1448da43-ad69-4ca8-9b09-08de1b7d4466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zNRIn2T8yuV8yN+uQoHn1NTRoHSbhreJ2bnCylt/mZUkKN7TUyifSlslr/Oe?=
 =?us-ascii?Q?M5dczyoMSJpPxkhmhLI2bKz2xdos1JACN9LRzAjwmcjMT3QZNpy4rrnWDIq/?=
 =?us-ascii?Q?uVwxNdfnaXAVFEnU23Xi0sYB7s5fGgdYEDeA9acN1s+OUJ3o1K2sxU0gAEUu?=
 =?us-ascii?Q?EtX+2dkCZpSxa5GQpD3LAtLHbAp47mM89LVJxigrB7DwSESomf6hSQu8uxt1?=
 =?us-ascii?Q?87g5bGA0Z10O9NpvPKKgjPxbPFGHrvHUQV++dP1hUN/GIIVirMuBltj0FAwZ?=
 =?us-ascii?Q?iGW9rYnfWbFO8AF+F/adVYOhJTaEy4ftAFknWg3R5Zw7LKnpuHnUiaulZdqG?=
 =?us-ascii?Q?iPb9I5kFfsyqazqoJS5UY8nWxw+jZpIYUnJDWRj2NFood9DsHH6kwammLaOQ?=
 =?us-ascii?Q?CGbhzISK0vE09AglKWBFyFNcE3QBbuRS38h5hzzxJHdrFc3A/RFck9WHSVPZ?=
 =?us-ascii?Q?MDkOk+qaaD96hj8bu7sF+67tbSQPNMhzw6tdOGkY4SvMrPVl90zfJ0+FhNYo?=
 =?us-ascii?Q?r9N8gDun7Z6gvXrpGsrDkpdv4OSmwozrocAglYjsXA0PaFfcVm1WgkLd//ZA?=
 =?us-ascii?Q?3//FE9AhMtUgWL1U/1vX33XRhuQtHBpEQUfLpPAnN0uEKotiieTQuh+2JIxe?=
 =?us-ascii?Q?CHzRdSlDW3hIDLRWuCQbUuJN0ukKT77oOf5rL1PgxsTdEpKr9Iymp8BrnTT7?=
 =?us-ascii?Q?u99HbPXdgBYO8iEVBYKOHOGlsdglL9OBhUscrJUWkqfjT/5gfjnOLPWKsrnz?=
 =?us-ascii?Q?LtTW9cMkrqrX+xUElcYhnYx0kiXoXk6r02Tm4h+3uxcQWp5GFtPPT4luoDB8?=
 =?us-ascii?Q?O81DLzDnLQXDpzvHXJKTZArO7rC+mXnnY+yQK8VKqOCgCQGTjPZI51yrd/PF?=
 =?us-ascii?Q?U9BgIFdq2zJQM9htZ3OAJInZJv6crv6BASXZDp1rhxllSvPo8cVOVWrHo7oc?=
 =?us-ascii?Q?dfJ6/xzFSvqb/Rm/IVhLDNpIcSZ8KIvSD0pRzMBS81bVlahRNR16ZuxXZwwF?=
 =?us-ascii?Q?fbbmUTMZinuQMA2GKJy0WqhCKTU0gmIt/8edKllbq2qmNnQSRXs+YsdxzY23?=
 =?us-ascii?Q?3YAqk8oF8bPCj+EQwD/KiGHafK4LQHOSZ36MX9OCXOqkimFO/+TV/peQxmEr?=
 =?us-ascii?Q?/mDCH7xxne48+K4nMCRYfyxPouJFRRQxkkB0lzfJ0HIH3WhkmTFeonx4cVBK?=
 =?us-ascii?Q?HSSjjo0i+aipXJO6aeqvDRgQxx37281vO9UfvsWXS2OP7odVlupLwW3Uxa1+?=
 =?us-ascii?Q?TVYPtoZIetsczhxfFjAMkbtb7JUCGBKtkACF+MRQZ833vOT/JnSm3Jo5OM5j?=
 =?us-ascii?Q?0jWl+1q3MSTp7Id9MDttfPJ0c1apYY2G6jDOawLTNrQy2ej1F3LrB2/KHV1O?=
 =?us-ascii?Q?WfbLGSSgpMzp3SOApW9439tmlHXC0NlLaMNJPRGMSvgVyiEihKFoWHFXlVjz?=
 =?us-ascii?Q?3KeMgZd2HYEoNuIwvzYlPOJbybWp6jxR44/IiujCzKKxtSYy//gzRpOzmpE2?=
 =?us-ascii?Q?iiOepQUSTnVdHvlTxJUnSPQ4GUtKe0li9O3x9O0OD1VpL9Va7cKg/JlZ+/DW?=
 =?us-ascii?Q?bLP3+rdfTxby0XEd1dY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:36:36.4288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1448da43-ad69-4ca8-9b09-08de1b7d4466
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6014
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
index fce22712396b..94e909905c64 100644
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
 		for (i = 0; i < TTM_FENCES_MAX_SLOT_COUNT; i++) {
 			dma_fence_put(man->pipelined_eviction.fences[i]);
 			man->pipelined_eviction.fences[i] = NULL;
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
index 50e40380fe95..f83313bc0afb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -52,6 +52,10 @@ struct amdgpu_gtt_mgr {
 	spinlock_t lock;
 };
 
+struct amdgpu_ttm_entity {
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
+	struct amdgpu_ttm_entity default_entity;
+	struct amdgpu_ttm_entity clear_entity;
+	struct amdgpu_ttm_entity move_entity;
 
 	struct amdgpu_vram_mgr vram_mgr;
 	struct amdgpu_gtt_mgr gtt_mgr;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 378af0b2aaa9..1d35a89999f7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -45,7 +45,9 @@ svm_migrate_direct_mapping_addr(struct amdgpu_device *adev, u64 addr)
 }
 
 static int
-svm_migrate_gart_map(struct amdgpu_ring *ring, u64 npages,
+svm_migrate_gart_map(struct amdgpu_ring *ring,
+		     struct amdgpu_ttm_entity *entity,
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
+	struct amdgpu_ttm_entity *entity;
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

