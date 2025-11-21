Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADFEC7876D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA1210E844;
	Fri, 21 Nov 2025 10:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U53VJ3yw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010064.outbound.protection.outlook.com [52.101.61.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997B010E844;
 Fri, 21 Nov 2025 10:19:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFco9HZX55yjzUOfQ3eTdlr5fmdmTaijRjCrYQsIWgP0HD9kBvqffRvm6b9HvLk32Qr8a2pgri5DDyVeL+Qxoj02zLP3o8yUcBdjYhBs56zB9UQMtsRq8bYpMpBzuoTHmU6N3RSuEBI6WYTK4W/u0Q5kVZSuF3F/GnjU/8fCC9jDeF/JB+AiTvQQb+0YdYGus7VEIUuW2bOa8su0+fVyR1LCpwn4Dfhg3XE3hPC1XumYfvNTxYEn/OTy+2ukk6U4/kBccrKJwMQiL42VXdI86yFVOq5Xn6ykrjWasSo8iO46oqloDgNgQfM4eVqcrf113E6eGv+BKclriD7W4cBqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hV78d21m4SPWwJ+Bgvpl8fvOLX/uTXanvSuWwcqmUsg=;
 b=p7NrQer9cTo0WV0F2NalegfF/v8XEo16N0bLafNDoWQhHNXTnzqgDNASC8DT0bXI2wjA9YvGUwQ8PKqPkjKBb1DeP4HK3NdUxBSYF4ylgyWh27jcfpzxi9rANC0gXhoCH9kvplrtmmhL4VAYOi84dqaxCl1vs0dtWfvve1qEmLBdsHp26acOAXUF7+YJg7M59WIacgZUifFDIbgw98ywl+SfdFN1eGY6tvh9mu+4PBfirmk9GpErc5VuS/diYfxuDMGPCSW20qm3uFnXeqFVp/BhpxWr1gf39FubU5svDOF8Xm9kvDRnah/UWlQpk2sarYnGqLUSw765rJUh9bjonw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hV78d21m4SPWwJ+Bgvpl8fvOLX/uTXanvSuWwcqmUsg=;
 b=U53VJ3ywT1LN9AjqMNVIyumhG6oi4jIJaucYtzQ7t+cJB74tnYzmS5FTOEqdc7O3oAYRi1CvR+DpoRm0/V+DWqonToNiS0P1AGO4iOCLIjvRnIYNnKLIGXxHMZEKkKq3VyAK+cyfnjD7LAUsejF3gOo/qyHNU/Jz0lQsTOs5tVk=
Received: from BL0PR05CA0021.namprd05.prod.outlook.com (2603:10b6:208:91::31)
 by PH7PR12MB5733.namprd12.prod.outlook.com (2603:10b6:510:1e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 10:19:21 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::b) by BL0PR05CA0021.outlook.office365.com
 (2603:10b6:208:91::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.6 via Frontend Transport; Fri,
 21 Nov 2025 10:19:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 10:19:20 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 02:19:18 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v3 27/28] drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
Date: Fri, 21 Nov 2025 11:12:37 +0100
Message-ID: <20251121101315.3585-28-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|PH7PR12MB5733:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b4bb3a-c1a6-4547-8154-08de28e76fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?knLuv/G58geHw8QDH/uo4dskMnKK2B0/dFuwd2FzdvY/hncgq8qnSNAgc+LC?=
 =?us-ascii?Q?XKut8FEWpMgAlGkR/s+zli7gpbszYYI0VRuP3mlK0xdgwasTsIaVM17LSYWq?=
 =?us-ascii?Q?beJQEJpbewpdUvv3AzpoL+lNfgGmCpaMzPlfPw6LoWnSIsfecuShbe79j8ey?=
 =?us-ascii?Q?+TcOhWUCWQKREQxqvm2guDGhM2KBaTOnPk2+CGxC7D9BO3rqgmSU3AWnMeGH?=
 =?us-ascii?Q?tAKimmmi8+adI/nwvHsu05Yu5DP13Vcz3IvhrDoZvSwk2Z3b6RXSEbs8APRN?=
 =?us-ascii?Q?LYk578GQH2cqXauIx1Rt0DknopvlWcdU1zZwIrxWJoiO0vANFEUslyQIPdtr?=
 =?us-ascii?Q?F/G+kSujnua7T96dBMQeghX4sCeO8UP4C55lbBKm9B10F2WXyhBV2+Lyjbof?=
 =?us-ascii?Q?6Qh1jYVIkdNioA55PWgxrrYi12x9YFIk83NrI54k/YN4odaDDrg2y8vmst4B?=
 =?us-ascii?Q?zZMQ9j5GkFS70a6jOEDVVaDNDqkM8t+Zi5IwqV924qD95XdzmC9wdQzYtTJB?=
 =?us-ascii?Q?J7zg8kxeDCkNngSGQ6HOGyn6jlMcb7JtP1sh481XY/M3IJmOJnvqOU2HpBM0?=
 =?us-ascii?Q?oID+d/KuW3Fps1k+VEqd4a9cBKCFE42p8v9M99B6c+3axIxLVzsI8JG5xDgj?=
 =?us-ascii?Q?7YF43af1cvFFyWe5lAlMDIzzlCmeBhAd6pAXylXhOgrvv7J00+V/yAawnLYt?=
 =?us-ascii?Q?EB6CVuqCZ48/9CjywcdRx9ocwF2xrLZgYspRuViOXLwiEX3nFqA2wbLXC36a?=
 =?us-ascii?Q?8NCIPvLLmQGD54FarUPcuUyDo88gZZ+O6UnHivjCSQlY3ImW8BetiKFopjmd?=
 =?us-ascii?Q?pmUMMXsKXUMfDMa34taenXtRMGECiMFUYwMklS8ogNIZwN5p68kHnvP6mdPr?=
 =?us-ascii?Q?yAwaoobVrkz5d94lNborRvqAxBeTA346gu+oUL2j9dtyxJyAJhvIM5uHqnbe?=
 =?us-ascii?Q?A4d9TNEcSyJ53oy1tskE9dEcPjYLM0ShgrcQ91IaKXDO7ZSu3GPVOVRy2GZm?=
 =?us-ascii?Q?Bomfhf7CVR36TzsFgowSFcu10FuTZ9p936GaPY+wiBLYpJ6EqjkOfmtxZvLh?=
 =?us-ascii?Q?19CGIEnEbFH5l6cpu/LC2P/BuIor/XQqV4AAgz2o2XhHczjommgdfqTSBupy?=
 =?us-ascii?Q?eh1+rUKzWNi0MzvCokND1OfHHFw5f2i1S/0MZIE5lvR2Epv3f491SdMe+y41?=
 =?us-ascii?Q?AjxTXvzMpgKPYCa16OLPrFc8fEINx4owWmUYWA7J7RWRbpjoSJCFnln2gdSL?=
 =?us-ascii?Q?qEWIoLqdjabeAc0WAWDb2si3YwOHbobRHcu6dGFqGhD0c/ZwUhL5PLMs29y5?=
 =?us-ascii?Q?k7sYnRsrc94PaLKSs5Q9a+ZriyxLJXHzJES+uK9ZC6zI+Ap2Y8ktKAosXff5?=
 =?us-ascii?Q?C8fNAQgc6EDL2WpXbMIDf0s2eFOw8p2vazF1ZRhFnfDdp/hScOjykWo3op8w?=
 =?us-ascii?Q?0STmzO+XFX/tJr8B8KhcI/M/9qAC+ezq4WbihEosPz9wI/4ZzPpsvaGnS0a/?=
 =?us-ascii?Q?XZGevKEccz+emcacJ5YARYKLzdB/5ox7fIwkhctkoWtG5lKX4+byqELMjNNJ?=
 =?us-ascii?Q?IlDu6Y2LZT+/DG3IU+Y=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 10:19:20.8510 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b4bb3a-c1a6-4547-8154-08de28e76fa5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5733
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

It's doing the same thing as amdgpu_fill_buffer(src_data=0), so drop it.

The only caveat is that amdgpu_res_cleared() return value is only valid
right after allocation.

---
v2: introduce new "bool consider_clear_status" arg
---

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 16 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 90 +++++-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  7 +-
 3 files changed, 33 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 7d8d70135cc2..dccc31d0128e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -725,13 +725,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_ttm_clear_buffer(adev, bo, bo->tbo.base.resv, &fence);
+		r = amdgpu_fill_buffer(adev, amdgpu_ttm_next_clear_entity(adev),
+				       bo, 0, NULL, &fence,
+				       true, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (unlikely(r))
 			goto fail_unreserve;
 
-		dma_resv_add_fence(bo->tbo.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
-		dma_fence_put(fence);
+		if (fence) {
+			dma_resv_add_fence(bo->tbo.base.resv, fence,
+					   DMA_RESV_USAGE_KERNEL);
+			dma_fence_put(fence);
+		}
 	}
 	if (!bp->resv)
 		amdgpu_bo_unreserve(bo);
@@ -1323,8 +1327,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 		goto out;
 
 	r = amdgpu_fill_buffer(adev, amdgpu_ttm_next_clear_entity(adev),
-			       abo, 0, &bo->base._resv,
-			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+			       abo, 0, &bo->base._resv, &fence,
+			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 39cfe2dbdf03..c65c411ce26e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -459,7 +459,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 
 		r = amdgpu_fill_buffer(adev, entity,
 				       abo, 0, NULL, &wipe_fence,
-				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
+				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -2459,79 +2459,28 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_device *adev,
 }
 
 /**
- * amdgpu_ttm_clear_buffer - clear memory buffers
+ * amdgpu_fill_buffer - fill a buffer with a given value
  * @adev: amdgpu device object
- * @bo: amdgpu buffer object
- * @resv: reservation object
- * @fence: dma_fence associated with the operation
+ * @entity: optional entity to use. If NULL, the clearing entities will be
+ *          used to load-balance the partial clears
+ * @bo: the bo to fill
+ * @src_data: the value to set
+ * @resv: fences contained in this reservation will be used as dependencies.
+ * @out_fence: the fence from the last clear will be stored here. It might be
+ *             NULL if no job was run.
+ * @dependency: optional input dependency fence.
+ * @consider_clear_status: true if region reported as cleared by amdgpu_res_cleared()
+ *                         are skipped.
+ * @k_job_id: trace id
  *
- * Clear the memory buffer resource.
- *
- * Returns:
- * 0 for success or a negative error code on failure.
  */
-int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
-			    struct amdgpu_bo *bo,
-			    struct dma_resv *resv,
-			    struct dma_fence **fence)
-{
-	struct amdgpu_ttm_buffer_entity *entity;
-	struct amdgpu_res_cursor cursor;
-	u64 addr;
-	int r = 0;
-
-	if (!adev->mman.buffer_funcs_enabled)
-		return -EINVAL;
-
-	if (!fence)
-		return -EINVAL;
-	entity = &adev->mman.clear_entities[0];
-	*fence = dma_fence_get_stub();
-
-	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
-
-	mutex_lock(&entity->lock);
-	while (cursor.remaining) {
-		struct dma_fence *next = NULL;
-		u64 size;
-
-		if (amdgpu_res_cleared(&cursor)) {
-			amdgpu_res_next(&cursor, cursor.size);
-			continue;
-		}
-
-		/* Never clear more than 256MiB at once to avoid timeouts */
-		size = min(cursor.size, 256ULL << 20);
-
-		r = amdgpu_ttm_map_buffer(adev, entity,
-					  &bo->tbo, bo->tbo.resource, &cursor,
-					  1, false, false, &size, &addr);
-		if (r)
-			goto err;
-
-		r = amdgpu_ttm_fill_mem(adev, entity, 0, addr, size, resv,
-					&next, true,
-					AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
-		if (r)
-			goto err;
-
-		dma_fence_put(*fence);
-		*fence = next;
-
-		amdgpu_res_next(&cursor, size);
-	}
-err:
-	mutex_unlock(&entity->lock);
-
-	return r;
-}
-
 int amdgpu_fill_buffer(struct amdgpu_device *adev,
 		       struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
-		       struct dma_fence **f,
+		       struct dma_fence **out_fence,
+		       bool consider_clear_status,
 		       u64 k_job_id)
 {
 	struct dma_fence *fence = NULL;
@@ -2551,6 +2500,11 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
 		struct dma_fence *next;
 		uint64_t cur_size, to;
 
+		if (consider_clear_status && amdgpu_res_cleared(&dst)) {
+			amdgpu_res_next(&dst, dst.size);
+			continue;
+		}
+
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
@@ -2574,9 +2528,7 @@ int amdgpu_fill_buffer(struct amdgpu_device *adev,
 	}
 error:
 	mutex_unlock(&entity->lock);
-	if (f)
-		*f = dma_fence_get(fence);
-	dma_fence_put(fence);
+	*out_fence = fence;
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 653a4d17543e..f3bdbcec9afc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -181,16 +181,13 @@ int amdgpu_copy_buffer(struct amdgpu_device *adev,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_ttm_clear_buffer(struct amdgpu_device *adev,
-			    struct amdgpu_bo *bo,
-			    struct dma_resv *resv,
-			    struct dma_fence **fence);
 int amdgpu_fill_buffer(struct amdgpu_device *adev,
 		       struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
-		       struct dma_fence **f,
+		       struct dma_fence **out_fence,
+		       bool consider_clear_status,
 		       u64 k_job_id);
 struct amdgpu_ttm_buffer_entity *amdgpu_ttm_next_clear_entity(struct amdgpu_device *adev);
 
-- 
2.43.0

