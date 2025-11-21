Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD2C78681
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6684010E81E;
	Fri, 21 Nov 2025 10:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FSbs/ghO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012071.outbound.protection.outlook.com [52.101.48.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783F210E81E;
 Fri, 21 Nov 2025 10:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ds9zYKIl+rZI0nVdwOPWwJEjcYVNDJyDce8mP+E1VdbFSeOKvsyatPajB/c58vU1tfn6Nxf2F1FgfDdOFkB0PZFdSklS8SK4Vnj//qed4qWVhveINCGjwwNUGL9Kbgs4yyFgztUOu+EOBPm1L5LRk1pRNQnsEtQswtv9tfDRO9nmWMev8euQtp7DAbzckEu8aFLrIx5axW1F0UYQBAnDO4mDX3SdtWJhdiHY1bsLNLECj2/p4EzpBwUZRlwCOVxIDMAJKH6CqRW53LWobzNpVIm5ylBwqzCrw9B3CymEueIgE/dMus6AAmCTzPlGZpbLJZ1t6RV/lLwfQcYmS+X9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3VbUpDO3YjUjjLIiGa5aiF3mfmV0JA3lGymb1rE6dM=;
 b=xt9zevB1D8sqP22cBaEws8I6/rkWusagtPY7vymh9IhIX/Vj6C/HBVLlXu3CL5Yd0XzXIK2sPoj67knXgs9nEd8HfgeCslSEQnPo6h+rm0D/bKBZD4VLIlJkHrnJcpqNspwQ/RIQl84/dkgpqZJXL9bdv3CH0YKhRkpxFZ2qrD1dOoBMHpfZeNR0KOUikijJQL6IqulzThjec/fuVqO4qwY9o6L5m9+xYXIXreQlpotmllDJqg/4Cm8lNENTXlzBvLZREAXLoeVD5g34gDwQ8RuIjKV2B5VxNN3GfbiPRa5DL/a0+18e7QCQKahulqnLUVB8GmoWZ/qrnipSqaNIOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3VbUpDO3YjUjjLIiGa5aiF3mfmV0JA3lGymb1rE6dM=;
 b=FSbs/ghOp1Z7waQOX0NMFs7AVcViHzI0uP780gh0+1apvUPbuVBxLadlwSJtc27NBPrxywEiAKBiBpkTZrmVEAEwvAKrS0AccMtysnt+yYZNRH9PtnCsZf8kplxvKYS2AMK1df83sBKH1/JmtnXOSYBMqTQHd1SAbZ6T0EOgmd4=
Received: from BN9PR03CA0592.namprd03.prod.outlook.com (2603:10b6:408:10d::27)
 by PH7PR12MB9075.namprd12.prod.outlook.com (2603:10b6:510:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 10:14:29 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:10d:cafe::8f) by BN9PR03CA0592.outlook.office365.com
 (2603:10b6:408:10d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 10:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.1 via Frontend Transport; Fri, 21 Nov 2025 10:14:29 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:14:27 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 08/28] drm/amdgpu: pass the entity to use to
 amdgpu_ttm_map_buffer
Date: Fri, 21 Nov 2025 11:12:18 +0100
Message-ID: <20251121101315.3585-9-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|PH7PR12MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d579ef9-6164-47e4-46ff-08de28e6c1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eHjzRG04DJMJ8/YZypWf2XR3pugMSF7XGSR6fH7FM7TW8IeRd3iZ/ifQS5O4?=
 =?us-ascii?Q?7MwuiqV0b5TUtNiU8jR3sGknM92xQ3aFRJ4/47WM8hwv54lP6mnJD8Nm7btM?=
 =?us-ascii?Q?GB1/kVUCv03tw8vmTd4bVavAtQ41rhKm3MDEbgOoySk8vxbQfkKsUDGaLcft?=
 =?us-ascii?Q?mf9AlYVpac2ZZdh73bARSRyGSQuD8N+aiVrgzb7a+C3SXrMku7Yp0Lzk5UEd?=
 =?us-ascii?Q?OElP3kl4UGj6byjRPKCyjhpCKGE+TsUXi64VoGtPI3FLX/czaPkLBwtx6AXD?=
 =?us-ascii?Q?UJpp89nJBZ0BxnS5fJ1UfsI0dYU6wLx1JvhHTz7ME4jmtXtR7ByqdognVwAJ?=
 =?us-ascii?Q?lumyIwiJxgiEo29ltuMLFiDYFbGbzmegLBYnSkrDzm+sCmDRbrdU9cSgCkWI?=
 =?us-ascii?Q?XAdaF4tU4EcYVm5OLI3rZlFO/75wCPYHvoPWyvHugHVWmr6ffzbvFidYVG2w?=
 =?us-ascii?Q?aZhIkckqJhMnWgwycAKHjE/8ket3xZerU0P4YNdXj1qtYXZnahK+eWHn0UNE?=
 =?us-ascii?Q?jXTapYyrZCQMzuHqlDcGxh+m7p/1eezBnkQW0ww6xkKrx3xJBxCdQOyRZscr?=
 =?us-ascii?Q?zUMjNzMHPZENRAEkPgjuzfAgPM7MceFc4eUD/QnO7lgIyOvzPKZNhsjmwh49?=
 =?us-ascii?Q?FfO2qabCze3eDYlXDNfbi/naIVVdqZxEEw4/8d44k9jMaYXxf8mdHGsp1pTS?=
 =?us-ascii?Q?mQnLlfQX1AR7mCbK2SYV3o7Re1BS8+fcgupKJdpRgbWoJQe6gTjrxPQJoPXT?=
 =?us-ascii?Q?GcsFrRgVFo1kRvzep447N+Mh7adcN972ntkrHClE2atvOvhYJqLWqDnt6ne7?=
 =?us-ascii?Q?tHnwFoTsRGKPQIWxJYMg7HJClJJf8mPf9yG2sr3YzXDD9QDikkUMwhDLZr/f?=
 =?us-ascii?Q?Yob5IU/Jk4N66styMjpR/pTOV14hADrp1oLhjtkQIfHg0zA87H0Jk5KLU3ic?=
 =?us-ascii?Q?+UYBPVogvyjxRbE0bYkUXIgA+IJ9ROe0jRvMhd4Irc/325p59CCLdDuX9JTa?=
 =?us-ascii?Q?svPOtGG/f1cEX1ho+ID8D/jg/jr3M6u9XfRADmLwfjO9QgNDDkvI9CPixoRe?=
 =?us-ascii?Q?AxH0JwUAe5k2yzf8jXKddJ0oRZ41qxSAy2XZA5vr0oHjds/1l+PaIzmuzmoc?=
 =?us-ascii?Q?EQaVwEsyNatXQ0D2bJc4+NJyLcMmT+Xwc+zH/AGgOcrwSh+zeehyeAB9SFRg?=
 =?us-ascii?Q?eSKe/MYeeVf9NhcSpY2mRY+uIc4swRneHloSsO8kcpHGgY380CvivX1x11BZ?=
 =?us-ascii?Q?fUC2EpJeABrDWOfFpdZW74a72ErmQeWWw5POnf3hcyDcB5NPWRk/rq/LXXrm?=
 =?us-ascii?Q?sUWZlq5QeEDIczBsSDsLtgzu3mSNjg06Na8JiA3NhJHbFRA5EIBs1MHuOJio?=
 =?us-ascii?Q?B13DOLU7sSy1ICDRA+21Toa+wPDCDbuWQpvRvDhJsbndPl5cpRgxxsagFfte?=
 =?us-ascii?Q?L81q+enH+bSK0xc23kRPBJ1sNIhClHBoldvyVKL0znVrLyiQw5W2aMXO1jpz?=
 =?us-ascii?Q?2zICr1Xye9qUW+0KKbu2iXrpTDc1b22IKDkQOmhDyQeVBNvJqACZbZCf5FE3?=
 =?us-ascii?Q?a6Df1CB8cX0i9Vpm63o=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:14:29.0891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d579ef9-6164-47e4-46ff-08de28e6c1bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9075
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

This way the caller can select the one it wants to use.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 55 ++++++++++++++++---------
 1 file changed, 35 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 353682c0e8f0..3d850893b97f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -177,6 +177,7 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 nu
 /**
  * amdgpu_ttm_map_buffer - Map memory into the GART windows
  * @adev: the device being used
+ * @entity: entity to run the window setup job
  * @bo: buffer object to map
  * @mem: memory object to map
  * @mm_cur: range to map
@@ -189,6 +190,7 @@ amdgpu_ttm_job_submit(struct amdgpu_device *adev, struct amdgpu_job *job, u32 nu
  * the physical address for local memory.
  */
 static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
+				 struct amdgpu_ttm_buffer_entity *entity,
 				 struct ttm_buffer_object *bo,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
@@ -235,7 +237,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
 	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
 
-	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.default_entity.base,
+	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4 + num_bytes,
 				     AMDGPU_IB_POOL_DELAYED, &job,
@@ -275,6 +277,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
 /**
  * amdgpu_ttm_copy_mem_to_mem - Helper function for copy
  * @adev: amdgpu device
+ * @entity: entity to run the jobs
  * @src: buffer/address where to read from
  * @dst: buffer/address where to write to
  * @size: number of bytes to copy
@@ -289,6 +292,7 @@ static int amdgpu_ttm_map_buffer(struct amdgpu_device *adev,
  */
 __attribute__((nonnull))
 static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
+				      struct amdgpu_ttm_buffer_entity *entity,
 				      const struct amdgpu_copy_mem *src,
 				      const struct amdgpu_copy_mem *dst,
 				      uint64_t size, bool tmz,
@@ -320,12 +324,14 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		cur_size = min3(src_mm.size, dst_mm.size, 256ULL << 20);
 
 		/* Map src to window 0 and dst to window 1. */
-		r = amdgpu_ttm_map_buffer(adev, src->bo, src->mem, &src_mm,
+		r = amdgpu_ttm_map_buffer(adev, entity,
+					  src->bo, src->mem, &src_mm,
 					  0, tmz, &cur_size, &from);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_map_buffer(adev, dst->bo, dst->mem, &dst_mm,
+		r = amdgpu_ttm_map_buffer(adev, entity,
+					  dst->bo, dst->mem, &dst_mm,
 					  1, tmz, &cur_size, &to);
 		if (r)
 			goto error;
@@ -394,7 +400,9 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	src.offset = 0;
 	dst.offset = 0;
 
-	r = amdgpu_ttm_copy_mem_to_mem(adev, &src, &dst,
+	r = amdgpu_ttm_copy_mem_to_mem(adev,
+				       &adev->mman.move_entity,
+				       &src, &dst,
 				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
 				       bo->base.resv, &fence);
@@ -2220,17 +2228,16 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 }
 
 static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
+				  struct amdgpu_ttm_buffer_entity *entity,
 				  unsigned int num_dw,
 				  struct dma_resv *resv,
 				  bool vm_needs_flush,
 				  struct amdgpu_job **job,
-				  bool delayed, u64 k_job_id)
+				  u64 k_job_id)
 {
 	enum amdgpu_ib_pool_type pool = AMDGPU_IB_POOL_DELAYED;
 	int r;
-	struct drm_sched_entity *entity = delayed ? &adev->mman.clear_entity.base :
-						    &adev->mman.move_entity.base;
-	r = amdgpu_job_alloc_with_ib(adev, entity,
+	r = amdgpu_job_alloc_with_ib(adev, &entity->base,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
 				     num_dw * 4, pool, job, k_job_id);
 	if (r) {
@@ -2275,8 +2282,8 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 	max_bytes = adev->mman.buffer_funcs->copy_max_bytes;
 	num_loops = DIV_ROUND_UP(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->copy_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, num_dw,
-				   resv, vm_needs_flush, &job, false,
+	r = amdgpu_ttm_prepare_job(adev, &adev->mman.move_entity, num_dw,
+				   resv, vm_needs_flush, &job,
 				   AMDGPU_KERNEL_JOB_ID_TTM_COPY_BUFFER);
 	if (r)
 		goto error_free;
@@ -2301,11 +2308,13 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev, uint64_t src_offset,
 	return r;
 }
 
-static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
+static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
+			       struct amdgpu_ttm_buffer_entity *entity,
+			       uint32_t src_data,
 			       uint64_t dst_addr, uint32_t byte_count,
 			       struct dma_resv *resv,
 			       struct dma_fence **fence,
-			       bool vm_needs_flush, bool delayed,
+			       bool vm_needs_flush,
 			       u64 k_job_id)
 {
 	unsigned int num_loops, num_dw;
@@ -2317,8 +2326,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev, uint32_t src_data,
 	max_bytes = adev->mman.buffer_funcs->fill_max_bytes;
 	num_loops = DIV_ROUND_UP_ULL(byte_count, max_bytes);
 	num_dw = ALIGN(num_loops * adev->mman.buffer_funcs->fill_num_dw, 8);
-	r = amdgpu_ttm_prepare_job(adev, num_dw, resv, vm_needs_flush,
-				   &job, delayed, k_job_id);
+	r = amdgpu_ttm_prepare_job(adev, entity, num_dw, resv,
+				   vm_needs_flush, &job, k_job_id);
 	if (r)
 		return r;
 
@@ -2379,13 +2388,14 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 		/* Never clear more than 256MiB at once to avoid timeouts */
 		size = min(cursor.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(adev, &bo->tbo, bo->tbo.resource, &cursor,
+		r = amdgpu_ttm_map_buffer(adev, &adev->mman.clear_entity,
+					  &bo->tbo, bo->tbo.resource, &cursor,
 					  1, false, &size, &addr);
 		if (r)
 			goto err;
 
-		r = amdgpu_ttm_fill_mem(adev, 0, addr, size, resv,
-					&next, true, true,
+		r = amdgpu_ttm_fill_mem(adev, &adev->mman.clear_entity, 0, addr, size, resv,
+					&next, true,
 					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (r)
 			goto err;
@@ -2409,10 +2419,14 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_ttm_buffer_entity *entity;
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
 	int r;
 
+	entity = delayed ? &adev->mman.clear_entity :
+			   &adev->mman.move_entity;
+
 	if (!adev->mman.buffer_funcs_enabled) {
 		dev_err(adev->dev,
 			"Trying to clear memory with ring turned off.\n");
@@ -2429,13 +2443,14 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
-		r = amdgpu_ttm_map_buffer(adev, &bo->tbo, bo->tbo.resource, &dst,
+		r = amdgpu_ttm_map_buffer(adev, &adev->mman.default_entity,
+					  &bo->tbo, bo->tbo.resource, &dst,
 					  1, false, &cur_size, &to);
 		if (r)
 			goto error;
 
-		r = amdgpu_ttm_fill_mem(adev, src_data, to, cur_size, resv,
-					&next, true, delayed, k_job_id);
+		r = amdgpu_ttm_fill_mem(adev, entity, src_data, to, cur_size, resv,
+					&next, true, k_job_id);
 		if (r)
 			goto error;
 
-- 
2.43.0

