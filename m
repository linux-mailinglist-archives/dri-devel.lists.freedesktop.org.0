Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08790808B81
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 16:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D2A10E8D2;
	Thu,  7 Dec 2023 15:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE19010E8D0;
 Thu,  7 Dec 2023 15:12:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOv6nViysRSXUzq4WEPnFtflZcoLnE8HHRcIesbl8IHagqTztLqX6/3I7Azm/r8SVue+k7K29rkMWk/OVAteW81aXZxzCKjpT1c16WhJIZfkdVtFJazZ05lTInVkw+nl3DULx7t5LP2fs6DQJWspqtSf0G2c7R4RUrEmtKSyqVtTfT6EdM7kahdZOjknwlq7y+cDCXHN6otZSUqxuUJ/78m8CY3xsdjSbc81V+8I3bYUEK7q0Zm5+MmQbE6uLzPPEa5LFLQnh1KVEQnUnJ/H1VPPqoUiLjhJEsoIgRM4ymX0ZkA076xsfz45fHkv5bxg2wWU2cVRAilDlkhR1stOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0wH32rKPdODGvo2PDL63JRpM5QAx19MVUViWeO1UJk=;
 b=c3e+BM/qV+vgExg0DCA4Jox6WEmfUp+7/UmKvy79A3ylWz+cN+MVS1amrZlJAFeVho6rRxej1dc28yx/4QpfC+ryNlRMcP4+TdIMnevPhIw9X/Pc0rXShB8bCuxd3QA66zgHVpM+/ORrsP6Zoz12IwV+2+Z4YFwFbMXBvlTNkfBRgUdhRouEJMXTWGkgMV9JE/719YL3Q/KzGp8NC39uaNK5+d5Zes4Dys84o89R6r+2g4d+Q+l+H/JYVxKF7z2l61rPLw/LabMjM/kZXu8SENS+X9DgnrQb6nJzFYZtmuMXU2zfP3gclFLDRHOeS2ikG7RqVGcvl29BQI59XeM3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0wH32rKPdODGvo2PDL63JRpM5QAx19MVUViWeO1UJk=;
 b=ZnU5ZghFd5LB7eMKxy3qUe8sac+NWTeaoMFeBeN0VCx9rAyLMS+ilrF5QxF3tmdl18Iqh/LH6Wb7PcPJZfwsC8T5NSC2PkdQXYR6lCMotLTdFS5Ual3EH8eSQbaQjNOb5TIqlZdFTmuzvokhijPxlV3uJRGEM3DJQ/6fP8zX80k=
Received: from DM6PR18CA0008.namprd18.prod.outlook.com (2603:10b6:5:15b::21)
 by DS7PR12MB8273.namprd12.prod.outlook.com (2603:10b6:8:ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 15:12:11 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::83) by DM6PR18CA0008.outlook.office365.com
 (2603:10b6:5:15b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 15:12:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 15:12:11 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 7 Dec 2023 09:12:08 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: Enable clear page functionality
Date: Thu, 7 Dec 2023 07:11:42 -0800
Message-ID: <20231207151142.929349-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
References: <20231207151142.929349-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DS7PR12MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ee710e-670d-40e2-749f-08dbf736e30c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WssganOks/kvKDYhL8M2AMfvor51VIp/G1fwHmfMnHArnQQeu+8FKy+lYDJp/Q5qggUAgnmwAzD/CMsD3v40qm0k5dDgd29W6m40U5VoAjx4s185VVXsoozvRrUVdpQjOzTlXoxp3SEqxx4WEKTEWTLZrNKYIE6cOqySBWfGWPazJEdqxFDTtAk4b+iJl/sTHF1yXBgoo58qUf+oCr6SLGkfgDvrnU0nF+0onKGFoNFcMKYW/QqtPXUPxWyaUJR7IDXWBy63KgRv5aQhDAfkqe+FEF5fmd0bBw4+Q0HeFSFaIqBz6c467L5yysouGGDHSCXoNWhMx+iQq40ttnwd5JGbIAQuzkHCYtNvejEbi4U+OZCxwfhCQOZwwhTQ5Fa9A2JyMMV2GKmvcc4fic4MabTyC7yJGtXOfc3PuRKKhS9WlU8zcUwi9Qb/sD7xjhY8SAqMypfp1ox+9oQQXp8SWtNZsDO+8GHLobrkmdbvH5kYdhB8bpg2YkyTC3TUibhe3SpikD5uZZYZIFPtMq+jaXIzCOGyp0ePiLfdjdG/9MUeLNtUkExta2wSDzkzLrmLPRsaUxgQ4ai4llcFQ/CQBOJXUzP23XgzwAf8KgP7zkGINN3kLhiw1At9oaKpCgK5eeg8m69qQa4Qmy6nwT3OXEu+rjwUwYGZwz8wF38219aUqD/ptWT6s7PaK3YbKILQtnCJwYuxTLp6any0zp4Fmsg4VWVCt+OhQbTYV6dVNZZQYTWBZHuqVEwkm08UNS2RGtmTt/+3HCIw6uSxnyiBuQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(186009)(1800799012)(82310400011)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(426003)(336012)(16526019)(2616005)(26005)(1076003)(41300700001)(8936002)(36860700001)(83380400001)(47076005)(4326008)(8676002)(316002)(2906002)(5660300002)(478600001)(7696005)(6666004)(70586007)(110136005)(54906003)(70206006)(356005)(82740400003)(81166007)(86362001)(36756003)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 15:12:11.1814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ee710e-670d-40e2-749f-08dbf736e30c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8273
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add clear page support in vram memory region.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 13 +++--
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    | 25 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 50 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 14 +++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  5 ++
 6 files changed, 105 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index cef920a93924..bc4ea87f8b5e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -39,6 +39,7 @@
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
+#include "amdgpu_vram_mgr.h"
 
 /**
  * DOC: amdgpu_object
@@ -629,15 +630,17 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 
 	if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
 	    bo->tbo.resource->mem_type == TTM_PL_VRAM) {
-		struct dma_fence *fence;
+		struct dma_fence *fence = NULL;
 
-		r = amdgpu_fill_buffer(bo, 0, bo->tbo.base.resv, &fence, true);
+		r = amdgpu_clear_buffer(bo, bo->tbo.base.resv, &fence, true);
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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 381101d2bf05..50fcd86e1033 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -164,4 +164,29 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 	}
 }
 
+/**
+ * amdgpu_res_cleared - check if blocks are cleared
+ *
+ * @cur: the cursor to extract the block
+ *
+ * Check if the @cur block is cleared
+ */
+static inline bool amdgpu_res_cleared(struct amdgpu_res_cursor *cur)
+{
+	struct drm_buddy_block *block;
+
+	switch (cur->mem_type) {
+	case TTM_PL_VRAM:
+		block = cur->node;
+
+		if (!amdgpu_vram_mgr_is_cleared(block))
+			return false;
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 05991c5c8ddb..6d7514e8f40c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2222,6 +2222,56 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
 	return 0;
 }
 
+int amdgpu_clear_buffer(struct amdgpu_bo *bo,
+			struct dma_resv *resv,
+			struct dma_fence **fence,
+			bool delayed)
+{
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
+	struct amdgpu_res_cursor cursor;
+	struct dma_fence *f = NULL;
+	u64 addr;
+	int r;
+
+	if (!adev->mman.buffer_funcs_enabled)
+		return -EINVAL;
+
+	amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
+
+	mutex_lock(&adev->mman.gtt_window_lock);
+	while (cursor.remaining) {
+		struct dma_fence *next = NULL;
+		u64 size;
+
+		/* Never clear more than 256MiB at once to avoid timeouts */
+		size = min(cursor.size, 256ULL << 20);
+
+		if (!amdgpu_res_cleared(&cursor)) {
+			r = amdgpu_ttm_map_buffer(&bo->tbo, bo->tbo.resource, &cursor,
+						  1, ring, false, &size, &addr);
+			if (r)
+				goto err;
+
+			r = amdgpu_ttm_fill_mem(ring, 0, addr, size, resv,
+						&next, true, delayed);
+			if (r)
+				goto err;
+		}
+		dma_fence_put(f);
+		f = next;
+
+		amdgpu_res_next(&cursor, size);
+	}
+err:
+	mutex_unlock(&adev->mman.gtt_window_lock);
+	if (fence)
+		*fence = dma_fence_get(f);
+	dma_fence_put(f);
+
+	return r;
+}
+
 int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			uint32_t src_data,
 			struct dma_resv *resv,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 65ec82141a8e..838251166883 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -155,6 +155,10 @@ int amdgpu_ttm_copy_mem_to_mem(struct amdgpu_device *adev,
 			       uint64_t size, bool tmz,
 			       struct dma_resv *resv,
 			       struct dma_fence **f);
+int amdgpu_clear_buffer(struct amdgpu_bo *bo,
+			struct dma_resv *resv,
+			struct dma_fence **fence,
+			bool delayed);
 int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			uint32_t src_data,
 			struct dma_resv *resv,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index d0e199cc8f17..ff74c324b5b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -435,6 +435,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
+	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
 	u64 vis_usage = 0, max_bytes, min_block_size;
 	struct amdgpu_vram_mgr_resource *vres;
 	u64 size, remaining_size, lpfn, fpfn;
@@ -486,6 +487,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
 		vres->flags |= DRM_BUDDY_CONTIGUOUS_ALLOCATION;
 
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED)
+		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
+
 	if (fpfn || lpfn != mgr->mm.size)
 		/* Allocate blocks in desired range */
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
@@ -579,7 +583,9 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
+	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(res->bo);
 	struct drm_buddy *mm = &mgr->mm;
+	struct dma_fence *fence = NULL;
 	struct drm_buddy_block *block;
 	uint64_t vis_usage = 0;
 
@@ -589,7 +595,13 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 
 	amdgpu_vram_mgr_do_reserve(man);
 
-	drm_buddy_free_list(mm, &vres->blocks, 0);
+	/* Clear all the blocks in free path */
+	if (!amdgpu_fill_buffer(bo, 0, NULL, &fence, true)) {
+		vres->flags |= DRM_BUDDY_CLEARED;
+		dma_fence_put(fence);
+	}
+
+	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
 	mutex_unlock(&mgr->lock);
 
 	atomic64_sub(vis_usage, &mgr->vis_usage);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
index 0e04e42cf809..8478522d7366 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
@@ -53,6 +53,11 @@ static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
 	return (u64)PAGE_SIZE << drm_buddy_block_order(block);
 }
 
+static inline bool amdgpu_vram_mgr_is_cleared(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_is_clear(block);
+}
+
 static inline struct amdgpu_vram_mgr_resource *
 to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
 {
-- 
2.25.1

