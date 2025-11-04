Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B224C2FF9E
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 09:37:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A983010E586;
	Tue,  4 Nov 2025 08:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0yBlnJ9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012054.outbound.protection.outlook.com
 [40.93.195.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED54510E583;
 Tue,  4 Nov 2025 08:37:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+eIaRwelftuBjtjpZi7TylUo68U8Dy5n+mqNaDox1dTchjVmaR0VzW8bg/bb7ewFzeBsEFyPe10SuB4vELdRT3CiKPkFvfeLe4W7/l4LMFnlJuPP5BIwmcHYGNnyF2ShDRULjsJdA96FOzNWbsaLfrMfG14WQsabOAI7RKQpeAT/xkAuLel2BY24bLqYA6Lp7kh9HPDorlmOSWkB8EPw8dWzcOoJxunD9LM4ESNUIPf9i/0lfTgmYp2QBKnieTObvSxQVuV2Au51dGrnAkwTvdOYpboDR/X1aJseQK0Z7jt7go+CVWyjX5BNH70UbJ987SsHzihXlatbhfwIAVTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfcNTAP4vOyYWDbk2qC4pGHk+U7Wx5NcBAQU5LAoISY=;
 b=s/z55l/Yq72PuhEN+QCo1KFNPjr9cPfZLAn5civM6z2jWImLYIRM2s/6Pd9v+hi/ZTLJw4b3QWkV8nkVO3hySlwlyIRfwsFS0ha0Riz2VDVE6Lk1P+inZf3DKZSY88E5TJDzrQB4DXelrLHigdxP+oiUPXsUaboPXxg4evWWkiYCd5eZVtOwUwK3u7C8II1m5prldsQbQxccKVThnDJ9PSz46esS0oXRf88sQUjWfOKf65j/JIB2siFpgL7zqo2NVlL8KnUPNvEBmyG5v3cFBEY73V5pR7IP61sw1X1LOzgOFr/2lkWk0gbDRH+Mrqv/3pMmthtnOQepbQbShSvXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfcNTAP4vOyYWDbk2qC4pGHk+U7Wx5NcBAQU5LAoISY=;
 b=0yBlnJ9OU4hs9rbhsVKerfmLB6facvsE/+9e1Tuz9dQoO3YnVxsoy1Hvepc2+QTzCFyu3ERHWEp70QlCDuVv2kRkK/Mq1nOKPUu09OODhQoppgMO7AIZAs6C2X4zalRmoE73RpvKRe0rtH7zqpXDs9h5x/cT7Y7dTaiHApxR3Qc=
Received: from SJ0PR13CA0193.namprd13.prod.outlook.com (2603:10b6:a03:2c3::18)
 by SJ2PR12MB9191.namprd12.prod.outlook.com (2603:10b6:a03:55a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 08:37:10 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::36) by SJ0PR13CA0193.outlook.office365.com
 (2603:10b6:a03:2c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 08:36:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:37:10 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 4 Nov 2025 00:37:07 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v1 17/20] drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
Date: Tue, 4 Nov 2025 09:35:32 +0100
Message-ID: <20251104083605.13677-18-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SJ2PR12MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d758904-0d6b-46b2-c19b-08de1b7d586e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CfiPJOFemAyt79zkzsp4K9PYIIRPZ15wSTm2KNwS02mmaZgFRGdZYqJmdqnr?=
 =?us-ascii?Q?TZDrEnZFda8mk3ubOEriBZXUqpzdlRLL55k6YCbj83ypKN52qtDPemwDtUsq?=
 =?us-ascii?Q?vhPaccYnypiChpoivK7E49Qp3G7wLVjRTW2N7KAOGP89RHFDeruyn9Fe/ZVb?=
 =?us-ascii?Q?JNPxuNOdJQMKpNOMUGQvs5GJp8nWjQoc0pGrKvMUo9KjFaN1Vt5mB6rRzVvK?=
 =?us-ascii?Q?hBG8C2H03TY+cIg2/hK0Q/swzUMdJoJGs7arMjXoB1XnlbCYgD2iz/2qEmGc?=
 =?us-ascii?Q?XYmyVtz61JVQnoxBb41BYQdH6MOEA8xDzoRo7nmhIe81OUkTo2lP16fEUpAs?=
 =?us-ascii?Q?W2ZeWuaNAoLl+jZBwro+uuZ8y4zyn53WmU/dVrSid7KHvAcBW+wGXmtvRkxE?=
 =?us-ascii?Q?x6TT0hAyQswNHuy1oe5TydIz/QzBT32NylSqkgTCgsn3mafm9HSb/wkarPzQ?=
 =?us-ascii?Q?0P6dbnU3Owa9QvrJ48WM5OaInLQwK4QLmRJqWacvfNTBxLAq93sKzy9trSKU?=
 =?us-ascii?Q?Rfdx+gf83pXzkKmhIQazRzN1oPlZRfsuvjiCe84wykS7fL41kfbpYWeg8Z+L?=
 =?us-ascii?Q?jiKYzXaUv5SKz2nwWQ3dzCBghRAl4TPUZI0ElOn1mrdD3fTq3NIxNHh2/QPY?=
 =?us-ascii?Q?H7p3xC3oQ09xaFOZTeXnqr8TY3M1wnmj1deMyLKuGvIKLlaowjNVCmZ2iF+s?=
 =?us-ascii?Q?5a6zvqEk4+uInMg1XUXQCe2dKKag8EIIw7RNL5c6BsmoUXNp499Q253qyTvD?=
 =?us-ascii?Q?TcGaNNidS3ObZEvcvkoDFgV62leQhIZmwx89hRm3DIzs2W6y6oDw2+tZu7JQ?=
 =?us-ascii?Q?Pmt02CujjencdXzq0XYrNijgOLFst1TInZQ77VH8h9eherTMYYj6PY1YO2Kq?=
 =?us-ascii?Q?Hop6OLJl6WmMBv88Pt2b0gPhDmQURtFYPjSN49jtXuO/mrPuSmvRCHfhqhjm?=
 =?us-ascii?Q?Ju+a+R3JkwtXV8/cmXVXbC17ZsQFxPZV9S2KokPTARqKDApZDNgBNMdQnXH3?=
 =?us-ascii?Q?Y5GATZ61zQzXh4Up5uNrz7HLbe4DSX5r2MIDEJX5qRzxqhr7jyx14mjrK86i?=
 =?us-ascii?Q?oYk2WwoQLHngvkDnqoxsWouPZcZ0Qa+7V0WUCVBVYjNG0wd55I1CXfCCsdgV?=
 =?us-ascii?Q?TiO16tV59LKmhu/OdlDXkaGrpmHrBBqMHRX7KRK7rVzZV8CoHodWftfg8b3/?=
 =?us-ascii?Q?ZIAEaFea/lUOHAzoHwwHzpLHAzfTgBcW+WG+Hn0Ji4ezDD9uWDqKboH8FvfV?=
 =?us-ascii?Q?3EvqZczusQ+lCLhMDV1DgmK0dTM2ecuC1BcZC6dW1tP+Ggw0blIgo7f/ZsX+?=
 =?us-ascii?Q?3mPmfZFRMzbf0Te5/2LZD0TFNGLGuEATLfo67cgcKWypPDzcYa0RZMeE+vLH?=
 =?us-ascii?Q?1nUlvl9cd6/7FHfnIfMtXi0D3sp3bkmj8KQ436GAQwvPKJ45gCcOcaKPPPJ2?=
 =?us-ascii?Q?jRK1l2Ebq8o9S6x1MSZyidJRSpl8Uay4YBMenz9Sn+0IDwVEc21N+ij1wdCa?=
 =?us-ascii?Q?iZgSqW6mfLKJpDoHc6XmQEkxmRDsD4ttx18WtX6ymImXjIOip9SD/lPLz8nH?=
 =?us-ascii?Q?EQ5vNsLAb0XCjEeND+8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:37:10.0361 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d758904-0d6b-46b2-c19b-08de1b7d586e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9191
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

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  9 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 86 ++++------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  3 -
 3 files changed, 18 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 4a69324bb730..410e9b68ff81 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -723,15 +723,10 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 
 	if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
-		struct dma_fence *fence;
-
-		r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
+		r = amdgpu_fill_buffer(NULL, bo, 0, NULL,
+				       NULL, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
 		if (unlikely(r))
 			goto fail_unreserve;
-
-		dma_resv_add_fence(bo->tbo.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
-		dma_fence_put(fence);
 	}
 	if (!bp->resv)
 		amdgpu_bo_unreserve(bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d88bdb2ac083..1f553c56f31d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2412,75 +2412,6 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
 	return 0;
 }
 
-/**
- * amdgpu_ttm_clear_buffer - clear memory buffers
- * @bo: amdgpu buffer object
- * @resv: reservation object
- * @fence: dma_fence associated with the operation
- *
- * Clear the memory buffer resource.
- *
- * Returns:
- * 0 for success or a negative error code on failure.
- */
-int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
-			    struct dma_resv *resv,
-			    struct dma_fence **fence)
-{
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_rings[0];
-	struct amdgpu_ttm_entity *entity;
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
 /**
  * amdgpu_fill_buffer - fill a buffer with a given value
  * @entity: optional entity to use. If NULL, the clearing entities will be
@@ -2508,6 +2439,9 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 	struct amdgpu_res_cursor dst;
 	uint64_t cur_size, to;
 	int r, e, n_fences;
+	/* The clear flag is only valid directly after allocation. */
+	bool consider_clear_flag =
+		src_data == 0 && k_job_id == AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER;
 
 	/* The fences will be either added to the resv object or the last fence
 	 * will be returned to the caller. In the latter case, all fill jobs will
@@ -2531,6 +2465,11 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 		while (dst.remaining) {
 			cur_size = min(dst.size, 256ULL << 20);
 
+			if (consider_clear_flag && amdgpu_res_cleared(&dst)) {
+				amdgpu_res_next(&dst, dst.size);
+				continue;
+			}
+
 			n_fences += 1;
 			amdgpu_res_next(&dst, cur_size);
 		}
@@ -2550,6 +2489,11 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
 
 	while (dst.remaining) {
+		if (consider_clear_flag && amdgpu_res_cleared(&dst)) {
+			amdgpu_res_next(&dst, dst.size);
+			continue;
+		}
+
 		/* Never fill more than 256MiB at once to avoid timeouts */
 		cur_size = min(dst.size, 256ULL << 20);
 
@@ -2574,8 +2518,10 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 			goto error;
 		}
 
+
 		r = amdgpu_ttm_fill_mem(ring, &entity->base,
-					src_data, to, cur_size, resv,
+					src_data, to, cur_size,
+					resv,
 					&fence, true, k_job_id);
 		if (r) {
 			mutex_unlock(&entity->gart_window_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index c059a3d52b57..97e73919cb0c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -182,9 +182,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring,
 		       struct dma_resv *resv,
 		       struct dma_fence **fence,
 		       bool vm_needs_flush, uint32_t copy_flags);
-int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
-			    struct dma_resv *resv,
-			    struct dma_fence **fence);
 int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
 		       struct amdgpu_bo *bo,
 		       uint32_t src_data,
-- 
2.43.0

