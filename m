Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60682C58A0A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:12:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1EE10E89F;
	Thu, 13 Nov 2025 16:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hinifJsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012051.outbound.protection.outlook.com
 [40.107.200.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C230F10E865;
 Thu, 13 Nov 2025 16:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7mjUiMe+EO7Hym8a53ZsK4Aw9Bp4AKsZQZWRogcGMRzCYBn8dczJopxGpdo7IXZRF3BoZIzyTA0saRt8wGu6SvkXz9ivQx6zGKqdubHgHrtQKlxlxm58R0hrxjj8jCzGna5oBpreZiuSYQ3tfsYqOb2iA3y580b7gdsQxgM7gKAg5K5KomzvppJy9luW9knC5XBhuMTl2qgbDHqqWiCinpvSf+KWRFTFTjpXxkIlHUqsb9r2D0lVl+ZwvdyrqC0olyXzjFGWxnifBtgnGOmZDRQPdxy0z+jk2EmjEpzGhuFRH05dCMUAMrq1seNhyJnAhbH98LgKKwOgkgF+gfJ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWLs2o1IzYfaMqS8lva7ajK5a6j8ul1oGIRd/zK4Ir8=;
 b=gehtvPk5nEHYsosC/ED1DkMZ2Wym4dJOw4HfRLJYHUE6WpnMazaE1W+XHfVR09hkRfjR4wE2vpTc8gufWiUeqLGp/qF6Vc1r1cjc8qxor65hXNEVyvf7Qg+DPJy3Klq/fUQog/epv+7V2tfAGPLPysrxyhNddS6J9kR0HGxPzLdhPd7tH+BiGd70vLUTrEZ3EWH4ICryMjlD+LaQswpOuGcSvKkiUpFjN+o0w34h6SdiPQEj56/9AvaO1SoYbjaDWnZ97FFQ6nWCki8Y6RQQFJqkXa3M2+W1jUIY85wEF/23cpVQxwyMNN75yYQPLuyrOl9+CeJ75sFVB6+fn8eq/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWLs2o1IzYfaMqS8lva7ajK5a6j8ul1oGIRd/zK4Ir8=;
 b=hinifJsQkaH6I2YjOzNog0/WubxobSAJ6QG9aBtATVqQ6/MtafLAzDkHfcPyQl+pv/JvhL+GS1zUTodGI2Vk76pCFqvPmXQw5ml4elEm2cg5wExg1fd/l1/R9AHGF+vQvjjLLc5REwPOBYmNTgbcHll4+bQkCMdE9/G8taYQXSY=
Received: from BL1PR13CA0424.namprd13.prod.outlook.com (2603:10b6:208:2c3::9)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:12:41 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::74) by BL1PR13CA0424.outlook.office365.com
 (2603:10b6:208:2c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Thu,
 13 Nov 2025 16:12:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:12:40 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:12:38 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v2 17/20] drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
Date: Thu, 13 Nov 2025 17:05:58 +0100
Message-ID: <20251113160632.5889-18-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: 053b0fb9-e757-4b55-6638-08de22cf7857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m3lHdW0+MzlBi9IoXzjv4v8L1cXeIvOi7TjaKuEmTMQW0TpFS4SEgQGMkbKU?=
 =?us-ascii?Q?ybRAgBZAOXMN2Jk8RXqLIn/wPUcWOrgPreTQ27c8wab0ZXBfMgr+BghTGwFR?=
 =?us-ascii?Q?BLe1Tb7kN0yzfXeYPl3HQrS8QoXUurtihu6B7op+x73T8c5qEK9wBg6MiQXb?=
 =?us-ascii?Q?0XrUGzI3E4hhrFaWG39w+T6jYfvnvhV2YB7+aBCfXuHWo2OWApTOEf56tQ5m?=
 =?us-ascii?Q?MRuUEGX5NuW3VHwZK5hVKcy5UKlRGdaTW+49cTuWyRqdN9Qw4P/wI6iusxPF?=
 =?us-ascii?Q?TKZ0ydgKd2HiVY9HzoAK/Hgdm2ZvvuTl89nNemnGjiehS/L5M1sbOa7W4cyk?=
 =?us-ascii?Q?XHbEeMhSPsewqleqG/7+WiYxbMWDboIA2b9B6iMQfYstQBZ6bSZVI9vAoRTG?=
 =?us-ascii?Q?YJKXTW9wBJuIFeu9XGaaz7sVTXpiuigWp3lU4FWa6aom5jfOpq06ySz02oH4?=
 =?us-ascii?Q?CZAdpeSJm9tIkmG3ibBzjlPxrfyo4Ghmqxwy0vqGSKUZ85bzSMcB2n1cZAon?=
 =?us-ascii?Q?UIskyV4Cd7mc9dmr6L+Wvq2h4a6pnbZ6u5rzFP491aRqd4jGuD0xE4Jr15N1?=
 =?us-ascii?Q?v7V0tSWeV3zjFYzkj2272qLlg4Ixso109mN0b+hNVWJgA8gTGXcpy/EsVWlu?=
 =?us-ascii?Q?IfsYHoINnUrOGs2+YDypFFIp3HGM+QLn5wRv8JXwiTSAH08YClIg2zzmJ3pe?=
 =?us-ascii?Q?esXrPpumaadffzOoI+lNl1WJQBr8IBiH/G0qFNAuIBAu33JNBH679BW4Y2bw?=
 =?us-ascii?Q?Ae1LoELxUrOgXT8+F6KdveCBxpjA2pHwwnFwppNqsgCat3uDa1b8TjK2bpgm?=
 =?us-ascii?Q?vKg0Y2ZUghfDRTrq+Dj+56BZWMOWoUC/NSVXsmbSct72i1ENR/NxbQMYKf0P?=
 =?us-ascii?Q?ZHjcdz96dIt1Yg/eoh1zf2JB7kDUxpoL/QLgXYzP96cwiDZFHqc0sKt7zRe5?=
 =?us-ascii?Q?bT9OiS1PRuhkCajGjOz5m7CGEqbeaOUxiBP7sPejj87X6/8y1Docxu4P3OfT?=
 =?us-ascii?Q?RtnfWKt28L8U/JfHikepSogwSSe1Zia4vtZBJxvE1pzvbfEaZs5aZMLum+Sg?=
 =?us-ascii?Q?SPIIMKR1ElkOz/JdcyI4b8xD4JLRzVwURZZrOZGR5rVKiYba/TEEbUSvNASe?=
 =?us-ascii?Q?8aoUQRs9HDezgQQfNB9n1FkOqMsXfRB9Nfk5U0xtR+xFc3a+GQDAHQPLbiL/?=
 =?us-ascii?Q?giWHDcz5j0RI8TZiOE/AwO4SIxkT4QfkyJvKhGG+LWPxbwLJLybA3JOxps5M?=
 =?us-ascii?Q?JD0FTsLOlx6U96eGfwNx1TuUngFxkjNpMbM0qyUs0xoT60MH+2giIPFopPTd?=
 =?us-ascii?Q?hHmcxncEU+Vj9ExxxnpnybuuXb5eHaoeHQ96u+Cz+P70V8QD3h8XwyG73Yis?=
 =?us-ascii?Q?EW6x54Ir5YVf0jg49vrWHKZrqy/XCiKCeQ7NXCgy9yLZUll8O5NQ8F1VIqRq?=
 =?us-ascii?Q?MsHbqNDBdPAMzxoES+ZiKfoQJqSPN1Z1nCBafov0QYKaHB6A/BhwwdBq3Ua3?=
 =?us-ascii?Q?Hj7lSzWohd8mp5qBDZWwIH2RS148vISx9kZU2GYc+8c99mvaV5ETZ0axCQys?=
 =?us-ascii?Q?zy6PKJf02sCiP52rs9A=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:12:40.5319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 053b0fb9-e757-4b55-6638-08de22cf7857
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 15 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 94 +++++-----------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  6 +-
 3 files changed, 32 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 33b397107778..4490b19752b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -725,13 +725,16 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
 		struct dma_fence *fence;
 
-		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
+		r = amdgpu_fill_buffer(NULL, bo, 0, NULL, &fence, NULL,
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
@@ -1321,8 +1324,8 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 	if (r)
 		goto out;
 
-	r = amdgpu_fill_buffer(NULL, abo, 0, &bo->base._resv,
-			       &fence, NULL, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+	r = amdgpu_fill_buffer(NULL, abo, 0, &bo->base._resv, &fence, NULL,
+			       false, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 94d0ff34593f..df05768c3817 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -435,7 +435,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 
 		r = amdgpu_fill_buffer(entity,
 				       abo, 0, NULL, &wipe_fence, fence,
-				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
+				       false, AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
 		} else if (wipe_fence) {
@@ -2418,82 +2418,27 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
 }
 
 /**
- * amdgpu_ttm_clear_buffer - clear memory buffers
- * @bo: amdgpu buffer object
- * @resv: reservation object
- * @fence: dma_fence associated with the operation
+ * amdgpu_fill_buffer - fill a buffer with a given value
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
-int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
-			    struct dma_resv *resv,
-			    struct dma_fence **fence)
-{
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ring *ring;
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
-
-	ring = container_of(adev->mman.buffer_funcs_scheds[0], struct amdgpu_ring, sched);
-	entity = &adev->mman.clear_entities[0];
-	*fence = dma_fence_get_stub();
-
-	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
-
-	mutex_lock(&entity->gart_window_lock);
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
-		r = amdgpu_ttm_map_buffer(&entity->base,
-					  &bo->tbo, bo->tbo.resource, &cursor,
-					  entity->gart_window_id1, ring, false, &size, &addr,
-					  NULL, NULL);
-		if (r)
-			goto err;
-
-		r = amdgpu_ttm_fill_mem(ring, &entity->base, 0, addr, size, resv,
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
-	mutex_unlock(&entity->gart_window_lock);
-
-	return r;
-}
-
 int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
-		       struct dma_fence **f,
+		       struct dma_fence **out_fence,
 		       struct dma_fence *dependency,
+		       bool consider_clear_status,
 		       u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
@@ -2523,6 +2468,11 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		struct dma_fence *next;
 		uint64_t cur_size, to;
 
+		if (consider_clear_status && amdgpu_res_cleared(&dst)) {
+			amdgpu_res_next(&dst, dst.size);
+			continue;
+		}
+
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
@@ -2548,9 +2498,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	}
 error:
 	mutex_unlock(&entity->gart_window_lock);
-	if (f)
-		*f = dma_fence_get(fence);
-	dma_fence_put(fence);
+	*out_fence = fence;
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 63c3e2466708..e01c2173d79f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -181,15 +181,13 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
-			    struct dma_resv *resv,
-			    struct dma_fence **fence);
 int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
-		       struct dma_fence **f,
+		       struct dma_fence **out_fence,
 		       struct dma_fence *dependency,
+		       bool consider_clear_status,
 		       u64 k_job_id);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
-- 
2.43.0

