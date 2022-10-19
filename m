Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C78604B63
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7289F10EAED;
	Wed, 19 Oct 2022 15:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2057.outbound.protection.outlook.com [40.107.212.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A740510EAED;
 Wed, 19 Oct 2022 15:28:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nV08Zx03+Yt7lKM1B1pj9kh6sj+27lviYmIkGIdfaWfuqYEujvIE/brrbS474ltTOtdQlcUOSp07IJ/UECFrKygBuMgnv7ezyyoghsWQr63ZYb4V4dg4ObKDSzAcjFTCasaPQM4NTFxyPTe+zuD1Aj/7XhzfGD8+X+J9/vQlunL8c7g4fXOQ2wpwb3IMW6p1UUygXEGAl0rdSuBYym4IYdrdUDuoXI9Ve4wBP3pHmmGndsrKeAxGp9V0UKTFl+gxt504tNzDJ6P4fPu1wiaNF34CNTqyRzikYwUJWLYxpx5E+fa13r4cZl2DW87yg2cM96moNzBy0CPRJHJEEiFNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xVXkaHPEyPG35RS7y+3GJr7a1+kxSEoE3DrxQRFy+U=;
 b=ZJyYtco0hlYA7BRG39GKHEMsgnnmhpMWfjQSgBdsZbTVFfiSu9W6s1yx8/I5qgW9O3k+1NSCiFrvdRvU3j+46dL3UAlwbFpSMt+MgDhc3YODgO9GcdYVkca0VjkxN9CG1bHWhGhtaFDEbKnfVzGJ7esXpmycXiDBck1P+ahhu1C1uGikc5+RLquI6kHH6j6Rsz+7PsFPUvfiBLbmSFvHSI7aJn91DQ2+vonDp+ZkcFvvX0Xhe9yrqseeuNpaJEmgJ6b2T8ijvII9RNJVz6TL1hrdX0hbqGXZFA326cZi9euIEDHZ0jSNTddd3bgcyNX+Y5DpsRySU/Iij/62jVSlZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xVXkaHPEyPG35RS7y+3GJr7a1+kxSEoE3DrxQRFy+U=;
 b=XEWuEuBirtuNJ3GUrQ9mK+py/1IHgT1XW6lLi9KLwmKgBxPnDlsfzovxYMr5NvG3sXcS1i0jwZB1Qkw76pqCrnHlMEreEBM15hpvRlbgF9uqVgC3PGBOUbpTEJ9TmaDkS8kibUGWogd/x56eTCGNFA/0hlFU+nZE7/WFsCdmMZw=
Received: from DM6PR07CA0098.namprd07.prod.outlook.com (2603:10b6:5:337::31)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 15:28:28 +0000
Received: from DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::b9) by DM6PR07CA0098.outlook.office365.com
 (2603:10b6:5:337::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 15:28:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT101.mail.protection.outlook.com (10.13.172.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 15:28:28 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 10:28:25 -0500
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 2/6] =?UTF-8?q?drm/amd:=20fix=E2=80=99s=20on=20ttm=5Fresou?=
 =?UTF-8?q?rce=20rework=20to=20use=20size=5Ft=20type?=
Date: Wed, 19 Oct 2022 20:57:32 +0530
Message-ID: <20221019152736.654451-2-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
References: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT101:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a22fe4b-74e1-4740-93c6-08dab1e69280
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sqhqdgpze++26H76kT6WjNsqnqB6ew3+1ZTa1s5tHuPrwrkL9hudMh/0Auzh6FOl1bwbWurQKqntngJfdR+EHzmawPp5BfvOJfVNU6TnJ2+XnSjExxEfZTh8RBfsioM7d53GKW8fMnLEGS0lKF5kcF+pn6KbYeKk6vSu3MYmSavTeaGj2qECCzGbqZzJHWO4Z6jVt1AkYh0iKHG0YKIPkACqDE2MHdzEPB9bz1UlPnMVRGg2ASx3gVMiWVI7VnqumI1/vFiS9zBw0X4cPtb8zgXDjp/p/n8jBaYWri7YohrCC693xkqFgX3UiVpIUiC+nZlkzQH/vUeg3hB1zFh6o6Ukf3IVsbm/WTxCi4wEiBGgoCohv/lbnpTpFF3M8YS5Ye3PoA2cI2CXGWDpZ82yNxzJoiE9rWgoYuaFHF2SehdtkQ+yTKJw2dl0Y/rERFtIVFqGQiL08hS4Kd5/AWOC132wDWK63zgN6y4nfjBcHogxVA8gtixvsTLzQ/Pzr+Xoy3Qcm3CgTw1FkzolwnH1vjL8A5tvq+Z5OvLwr1hm/pN+bwlcjSwTOwm8AQsTQTIrUsRw7WYVtXElAeoVLz4M6gwU8qA4PqgYyKBhz/Sjsdg1SJu0Zk1IyTv+ldPdTdhLHvOJKZpeKzkR62LlwQpd72jrAIw0P0xCvjxfGwGEKtEFgmcZ+iF/hKcYF1dd4g9NmNPcZ2m/A92DnnPDS1VcEvIJWRBftXNPcNKwJ8HkrW5UdVwhVZxyJh6Ctp9LnkIeY2ec6NrH9vJ/bhbVw53S0NY7R1qumnWSAFUphG8wkw8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(8936002)(26005)(82740400003)(81166007)(356005)(86362001)(316002)(70206006)(36860700001)(54906003)(70586007)(4326008)(450100002)(110136005)(5660300002)(2906002)(41300700001)(40460700003)(426003)(47076005)(2616005)(16526019)(1076003)(82310400005)(186003)(83380400001)(478600001)(6666004)(7696005)(336012)(40480700001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:28:28.3903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a22fe4b-74e1-4740-93c6-08dab1e69280
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the ttm_resource from num_pages to size_t size.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c    | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c     | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h      | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c        | 6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c   | 8 ++++----
 6 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 1f3302aebeff..44367f03316f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -144,7 +144,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 		node->base.start = node->mm_nodes[0].start;
 	} else {
 		node->mm_nodes[0].start = 0;
-		node->mm_nodes[0].size = node->base.num_pages;
+		node->mm_nodes[0].size = PFN_UP(node->base.size);
 		node->base.start = AMDGPU_BO_INVALID_OFFSET;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 2e8f6cd7a729..e51f80bb1d07 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -542,6 +542,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 		/* GWS and OA don't need any alignment. */
 		page_align = bp->byte_align;
 		size <<= PAGE_SHIFT;
+
 	} else if (bp->domain & AMDGPU_GEM_DOMAIN_GDS) {
 		/* Both size and alignment must be a multiple of 4. */
 		page_align = ALIGN(bp->byte_align, 4);
@@ -776,7 +777,7 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 		return 0;
 	}
 
-	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.resource->num_pages, &bo->kmap);
+	r = ttm_bo_kmap(&bo->tbo, 0, PFN_UP(bo->tbo.resource->size), &bo->kmap);
 	if (r)
 		return r;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 6546552e596c..5c4f93ee0c57 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -62,7 +62,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 	if (!res)
 		goto fallback;
 
-	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
+	BUG_ON(start + size > res->size);
 
 	cur->mem_type = res->mem_type;
 
@@ -110,7 +110,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 	cur->size = size;
 	cur->remaining = size;
 	cur->node = NULL;
-	WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
+	WARN_ON(res && start + size > res->size);
 	return;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
index 5e6ddc7e101c..677ad2016976 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
@@ -127,7 +127,7 @@ TRACE_EVENT(amdgpu_bo_create,
 
 	    TP_fast_assign(
 			   __entry->bo = bo;
-			   __entry->pages = bo->tbo.resource->num_pages;
+			   __entry->pages = PFN_UP(bo->tbo.resource->size);
 			   __entry->type = bo->tbo.resource->mem_type;
 			   __entry->prefer = bo->preferred_domains;
 			   __entry->allow = bo->allowed_domains;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index dc262d2c2925..36066965346f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -381,7 +381,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 	dst.offset = 0;
 
 	r = amdgpu_ttm_copy_mem_to_mem(adev, &src, &dst,
-				       new_mem->num_pages << PAGE_SHIFT,
+				       new_mem->size,
 				       amdgpu_bo_encrypted(abo),
 				       bo->base.resv, &fence);
 	if (r)
@@ -424,7 +424,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
 static bool amdgpu_mem_visible(struct amdgpu_device *adev,
 			       struct ttm_resource *mem)
 {
-	u64 mem_size = (u64)mem->num_pages << PAGE_SHIFT;
+	u64 mem_size = (u64)mem->size;
 	struct amdgpu_res_cursor cursor;
 	u64 end;
 
@@ -568,7 +568,7 @@ static int amdgpu_ttm_io_mem_reserve(struct ttm_device *bdev,
 				     struct ttm_resource *mem)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
-	size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
+	size_t bus_size = (size_t)mem->size;
 
 	switch (mem->mem_type) {
 	case TTM_PL_SYSTEM:
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 73a517bcf5c1..18c1a173d187 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -439,7 +439,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		/* Allocate blocks in desired range */
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
-	remaining_size = (u64)vres->base.num_pages << PAGE_SHIFT;
+	remaining_size = (u64)vres->base.size;
 
 	mutex_lock(&mgr->lock);
 	while (remaining_size) {
@@ -498,7 +498,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		LIST_HEAD(temp);
 
 		trim_list = &vres->blocks;
-		original_size = (u64)vres->base.num_pages << PAGE_SHIFT;
+		original_size = (u64)vres->base.size;
 
 		/*
 		 * If size value is rounded up to min_block_size, trim the last
@@ -533,8 +533,8 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			amdgpu_vram_mgr_block_size(block);
 		start >>= PAGE_SHIFT;
 
-		if (start > vres->base.num_pages)
-			start -= vres->base.num_pages;
+		if (start > PFN_UP(vres->base.size))
+			start -= PFN_UP(vres->base.size);
 		else
 			start = 0;
 		vres->base.start = max(vres->base.start, start);
-- 
2.32.0

