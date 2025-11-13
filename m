Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A931C589A0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A366410E88C;
	Thu, 13 Nov 2025 16:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qIlu081A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012064.outbound.protection.outlook.com
 [40.107.200.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED2210E88B;
 Thu, 13 Nov 2025 16:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VutxOXbY4r9hi4Va6VeE1Ts/dURqcUoTUqBxOl6fgHMDAhPkX2CwPI/aIcaxmlqZUDfG0uODRwM7mE+IaSEx6FFO56dc0YY7jMBya3Ce+R1i+hXbZWEIgcrEJyWWwq0VAYYqusBoygMWj+UC0mW4Rks3VT6MmF2dSF7e5x+4WA+MwkcqLkhlPC3JBIdcuu78Z7beEe4A4qbENuX3QLvKM1TGXAtZKRtZ1pUM9zaALaolvIb7/7zUNwJ6I0WmQi5ztl7DZsL89+bghcLI7N/j26QcKpRvwD0x97uE4J7TzVkM7BR8UuyF0OyJG6J9uAcuwNZW7QvQ+tg2+rIRaX4cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUxvo+68RLlm4QxNf4+0VZ38pUKHjU2RFgxB99KBbls=;
 b=IDAvHPvXSP/klw7Le/9X5J/EtfcauJtfgQfYhExii+09krGxntW17zb4STFMOJq6YG2Bs7HFm4uIgyrVW+gnpzxvkIvBReVEtKTtKgtfMSAsDbcoGMtSrB6PfXiCQki354pfp16JCxtao2E2F7fQRiRrn0PneIsRYibahbkYRYfYJ+z4R0vIAcF9k8wupdMABj9hu8EQ6lXzp8KPFqDX9t8PUsaHe6+ILuCAHQbu5yaPnk/2GktaeG98UYD9El4GFpqbsxl/RiL0Qf6EWTdUvTttwPUmV8y4DeSFDL30Wy+GhZS9od5H0XvWbYqJ3WagEmOtiddZazPdDvA9ncVkCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUxvo+68RLlm4QxNf4+0VZ38pUKHjU2RFgxB99KBbls=;
 b=qIlu081AF/5nIKYPVuxuZgeYcm9M7h5UYoqko2Vn4PzrOn2k90hpnD+iIR5p94nHXFTYd4PS8liKqpL8dCP1rWXCUHACNuHCrNVV3Uf2zc6LZI8eY/JWNCuNB5BFB/IFPrMYu+R7xtFvDSf4cCAZBfOJG9SayhhhmhHhK/Hi+SU=
Received: from CH2PR14CA0046.namprd14.prod.outlook.com (2603:10b6:610:56::26)
 by MN6PR12MB8514.namprd12.prod.outlook.com (2603:10b6:208:474::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 16:09:42 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::2b) by CH2PR14CA0046.outlook.office365.com
 (2603:10b6:610:56::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 16:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 16:09:39 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 13 Nov 2025 08:09:36 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v2 09/20] drm/amdgpu: pass optional dependency to
 amdgpu_fill_buffer
Date: Thu, 13 Nov 2025 17:05:50 +0100
Message-ID: <20251113160632.5889-10-pierre-eric.pelloux-prayer@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|MN6PR12MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 145e00ef-5d77-4932-4e93-08de22cf0c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UE4glrW/jYF59V0I9NNnxO2t/4wLmY0j6GrCXH1R9P+/4W0zA+sQxbQ43Ib+?=
 =?us-ascii?Q?Wk4FPsbyEAbxMB1J8SpTq6QnihRaW+/irTZfxyuqc/g8TIJmPP2QXgva8Al5?=
 =?us-ascii?Q?hRM0dT4g5HKUMb4r28bR6Qx18Yh4qL9p73LP3v8u+KqbHSxakoO1ia8uggFr?=
 =?us-ascii?Q?AFo8+JazMS8dnzskQpZTeJt4Y1xti96HM2AziuboJXuxSg6K1mKq+OzTBNSf?=
 =?us-ascii?Q?XTrYFRbCEki06usDSipnOiJHGbEyFVdxnB0kpa1W7+abgy5B19cAfQjTtgR7?=
 =?us-ascii?Q?i+yZgjMHyG4hQhY/qsDIbnspIBTrEjIx3/kxGiHjiDQQwgf/tGZL/LoSpx2K?=
 =?us-ascii?Q?vNmI5gYcoelv/EGYa5VHao194kH+ExQHwXpQ4awUh1mPVKzi2KTWt6KJO88L?=
 =?us-ascii?Q?X5GjnHaVqUQdumryANYtBmRdzCvQS3wED1NiZ0/kCfgDozgzNwEMIHwibFq+?=
 =?us-ascii?Q?aa8bvOmhml6MsfsJ8p6nwk3eFu2IJ/EIgYof07zP+XjJSrzMuCEDxQTiEY5l?=
 =?us-ascii?Q?yi0Hhvt8OEchDYR75SgtaavpSQoTmOMwHAbrvTkyj4AKSNl1nUDrgH+uwliI?=
 =?us-ascii?Q?EGfHEH2A9c24k5FxKF9MNtvB5xhxzLKvt9BhwwafWD+OPr9slo2xtpQYxnbU?=
 =?us-ascii?Q?qrS8JmygzmA9ObDWxt50AzRev39bdrKj6PGhbPt+gWjkJX4f/DOVC7e2hVV4?=
 =?us-ascii?Q?pv7GWBkhShewF2Ikn+KDRNrgEbJMJ0T8ShEuR0Q6U8MHuyzMI/WlQJRU9CB7?=
 =?us-ascii?Q?x0Zsuh/fr+/WkpgDtEW7wcupAvD3G4/Q9E6a0uFwGghiyDnjtk7SwThZDO0E?=
 =?us-ascii?Q?rEsYWLihNLoJtwS4nYKAMyytmoPanOlof25JCnaDUM4F189KIUlvOSvR1wVN?=
 =?us-ascii?Q?xU62AKh/T3deNVmCd/Gh+rxkJnLBK2AFdEV43cvh9aNcsxbrEBt643/9FdjO?=
 =?us-ascii?Q?LzLTTad8xnAgUNrx8bO7IWVqacDXv1shATXXJ1zKcht6SLs53PUo7yp6LG5O?=
 =?us-ascii?Q?Sv8G7mudo7/FFfLGm6TiYDPEVh88rMgOXgbnB5UO9HcZuIEhscqGMNI8FGCd?=
 =?us-ascii?Q?ArnqdYtedl8q0AojDPHPtdqk67HLk/rz/hVAOqkBemPm5Jrv1LVJKnK5QhEy?=
 =?us-ascii?Q?DELDx1QH0QmXeusBkcBoaTT6vAuruMYAW/uVdyPj7/B/WyxgZMyPh9kEiuHg?=
 =?us-ascii?Q?A3+s89of/8i/SKPyc62LYRR6fhnxZrhLTc00vqqqoj+Y3ZayhpLNPOk9tMJa?=
 =?us-ascii?Q?EVeUZaMPD62OnD6/uqyDXgmtZBMjdgZS1Red4a1aUkEIixZ9QhuyDg6rC7Mr?=
 =?us-ascii?Q?uvac3dxqRB2R8QmAT59DFJ1Q6aWGxKvcUnfnaOhPOYe4cIvi/NLA67xQ2hoa?=
 =?us-ascii?Q?9aZ/VDwTq1YR+xnZHniby3aqOhZ+F/p91EoSEk/6lEgH4oAsPCQYjdRbezNf?=
 =?us-ascii?Q?YTepxlzoENgptAaHilO0VqOElg+v9i+m42o0LmelCouWTNJc8VJc132kd1E6?=
 =?us-ascii?Q?JXsnLzzpE6BW2Bx+PwAJXCFxpUy1nvPnZXgdsiBI+lIzOf14vE035sy9pR6S?=
 =?us-ascii?Q?B/ZdjANPVpvS3bMuSAo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 16:09:39.7782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 145e00ef-5d77-4932-4e93-08de22cf0c9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8514
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

In case the fill job depends on a previous fence, the caller can
now pass it to make sure the ordering of the jobs is correct.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 22 ++++++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index e7b2cae031b3..be3532134e46 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1322,7 +1322,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 		goto out;
 
 	r = amdgpu_fill_buffer(&adev->mman.clear_entities[0], abo, 0, &bo->base._resv,
-			       &fence, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
+			       &fence, NULL, AMDGPU_KERNEL_JOB_ID_CLEAR_ON_RELEASE);
 	if (WARN_ON(r))
 		goto out;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index e1f0567fd2d5..b13f0993dbf1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -173,6 +173,7 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
  * @tmz: if we should setup a TMZ enabled mapping
  * @size: in number of bytes to map, out number of bytes mapped
  * @addr: resulting address inside the MC address space
+ * @dep: optional dependency
  *
  * Setup one of the GART windows to access a specific piece of memory or return
  * the physical address for local memory.
@@ -182,7 +183,8 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
 				 struct ttm_resource *mem,
 				 struct amdgpu_res_cursor *mm_cur,
 				 unsigned int window, struct amdgpu_ring *ring,
-				 bool tmz, uint64_t *size, uint64_t *addr)
+				 bool tmz, uint64_t *size, uint64_t *addr,
+				 struct dma_fence *dep)
 {
 	struct amdgpu_device *adev = ring->adev;
 	unsigned int offset, num_pages, num_dw, num_bytes;
@@ -234,6 +236,9 @@ static int amdgpu_ttm_map_buffer(struct drm_sched_entity *entity,
 	if (r)
 		return r;
 
+	if (dep)
+		drm_sched_job_add_dependency(&job->base, dma_fence_get(dep));
+
 	src_addr = num_dw * 4;
 	src_addr += job->ibs[0].gpu_addr;
 
@@ -326,13 +331,15 @@ static int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 		/* Map src to window 0 and dst to window 1. */
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  src->bo, src->mem, &src_mm,
-					  entity->gart_window_id0, ring, tmz, &cur_size, &from);
+					  entity->gart_window_id0, ring, tmz, &cur_size, &from,
+					  NULL);
 		if (r)
 			goto error;
 
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  dst->bo, dst->mem, &dst_mm,
-					  entity->gart_window_id1, ring, tmz, &cur_size, &to);
+					  entity->gart_window_id1, ring, tmz, &cur_size, &to,
+					  NULL);
 		if (r)
 			goto error;
 
@@ -415,7 +422,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 		struct dma_fence *wipe_fence = NULL;
 
 		r = amdgpu_fill_buffer(&adev->mman.move_entities[0],
-				       abo, 0, NULL, &wipe_fence,
+				       abo, 0, NULL, &wipe_fence, fence,
 				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
 		if (r) {
 			goto error;
@@ -2443,7 +2450,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
 
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &cursor,
-					  entity->gart_window_id1, ring, false, &size, &addr);
+					  entity->gart_window_id1, ring, false, &size, &addr,
+					  NULL);
 		if (r)
 			goto err;
 
@@ -2469,6 +2477,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
 		       struct dma_fence **f,
+		       struct dma_fence *dependency,
 		       u64 k_job_id)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
@@ -2496,7 +2505,8 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		r = amdgpu_ttm_map_buffer(&entity->base,
 					  &bo->tbo, bo->tbo.resource, &dst,
 					  entity->gart_window_id1, ring, false,
-					  &cur_size, &to);
+					  &cur_size, &to,
+					  dependency);
 		if (r)
 			goto error;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 9d4891e86675..e8f8165f5bcf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -186,6 +186,7 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_buffer_entity *entity,
 		       uint32_t src_data,
 		       struct dma_resv *resv,
 		       struct dma_fence **f,
+		       struct dma_fence *dependency,
 		       u64 k_job_id);
 
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
-- 
2.43.0

