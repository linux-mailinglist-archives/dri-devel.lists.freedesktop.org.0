Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7DF4B3A63
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 09:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A142110F37B;
	Sun, 13 Feb 2022 08:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062.outbound.protection.outlook.com [40.107.236.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDD510F373;
 Sun, 13 Feb 2022 08:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPPOq4Sdgi3I389HvwDxzr2lJ79LHR7dkGbzdUmZePSXPI/UUBmUVZasFC+sxf4ta5FspysvYmAh32EfTO2ZYh6JUcMcm4g//IWD3r67AF4Du+1fb+ouKHazgTCcP/13CKb6ILqn0ciQxquFuq3cmnTSa2Bwas4kocpQWWu5YQrB5tD5YZysBq7GGxTNQpdMxwKkMGXcgW1yNr2L55NTQaIRlz021FW2lSxITkbPjGNRabTTvUvooKBBAivzQ+l36RUm/4TutIp5ercfLmtg6drEfKnJiZpJonxd0gQx5v49naKSvt9b0ixrUNz/Lkm1uBEFpmZGKtD1OvXuskTdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlFRE/s8mzO5+J8O1lh+NQAw3r2qSyFCuNvbO7psBIo=;
 b=M/63xH2e5yjojWy45RUOOj4Ccio03dPnbdYwZlqJa9hAkin1Pq2FNJYGXm62rnErfeTkb0mAiAa/hPaCCYxrYJttelBLxoh0Q89HjD75tJjFyJP6O0xxm2mFSMRgk4+TmyrC1/dT/+jElVV89Xeisl5OEVTFPqUPtPnTCuNRmO7lGZh8SQQykQupJ3LSRlF+/Wgl8Z5T94V9pcgPHzr2bakIspFD60eWUOErg+xM4f8vrkTEod5uySr+0aj+zznGzppKewWjIu9ytVPhqdvk9hgYvJNaYHnnLvqXdwxu5M5aTEchvm51omdx+Fwbqha33hrApdXbExks74/ldkHhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlFRE/s8mzO5+J8O1lh+NQAw3r2qSyFCuNvbO7psBIo=;
 b=CEvYnkA4RnF/hRx4MTsTjHxFa9pbE5lA0HLAilz3Gj/kufP0+3YKNl/ZXCa2/KW2zkS4MWDsNLDko81ZlaXY9g8VZAaCgCEph2wAcqIyBwYc6QUpg+6nZYY/WEMB6NbtSUUyNAe0M5ILtMYBhEFD+F6PaEiSUGYV6nAHxbQHVJk=
Received: from BN9PR03CA0417.namprd03.prod.outlook.com (2603:10b6:408:111::32)
 by DM6PR12MB4879.namprd12.prod.outlook.com (2603:10b6:5:1b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Sun, 13 Feb
 2022 08:52:57 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::1f) by BN9PR03CA0417.outlook.office365.com
 (2603:10b6:408:111::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Sun, 13 Feb 2022 08:52:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Sun, 13 Feb 2022 08:52:57 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 13 Feb
 2022 02:52:50 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v12 5/5] drm/amdgpu: add drm buddy support to amdgpu
Date: Sun, 13 Feb 2022 14:22:17 +0530
Message-ID: <20220213085217.2705-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fcd4e5e-338c-420d-5f97-08d9eece3b2f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4879:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB48797D00FA3E5EB811956A81E4329@DM6PR12MB4879.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DNC0rKWxb6YrEOavJ04PyxAsZvnP7131gl9DYH9Bd+XIO4qQJOgqB01gxm+RJT2XCb9uCL/3YHUrtFkGKHPbDtNgi0DLBgyNI72odUgBvd5ohYWeFTQ4E+WXKLJHrll6ky2PLArnBwsTGWQmHrA1vVZFhyXeM+pvzqp0s5Z0lkTHnzAYte2uG8wtOYaqtxogu6R3EfYKhiscXgDINy9/Vc9lWbL09eQFj+w02Qw1CZ1q0z9bWngt4ABgQumBcsXKJ1J9oxfZ3M2EHymuNw4KHKliQaGLsTUcaTHmtjwvw7MO7T+NN1snjzfLD6yTSh1XLXOxooeV040IOo3yCGSfeFUwjOw1hstKTWKJux0OXRk/LRkjNEq/wnG432d17KOhQ5fYRhqLye8A91tkBn67lzMVrg9ZE00HgjwHiQOtb3FCzCjAN9FU+VxC5Uj/Wow29gp7TPH97Cx/2Df1th3A2SLXKL/gfwkZa5eA7PUmpk8BEJYC3DgnVlbvFVQKj5PMs2bLeke71lXtsVCiQRBzQ7c0B8CYGNbgHRhnEOrDiUcNDlzC6WMaN0AosH1wI7Ts5B9K2rm1h8tnus5X9GfOxuKjK8xwVOaoH2mIucGaZza/g9T5HGDfU8k60N00bHthAAKfpsjnAObaYALcvHk8wqKTCCLJQnqxhq8SQGHjJZbHLALJCFHMkiA/yTusbt4Id7JfiRQFvFVgXaoo0P7WVg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(336012)(426003)(7696005)(2616005)(2906002)(26005)(16526019)(186003)(1076003)(81166007)(5660300002)(86362001)(30864003)(40460700003)(356005)(36756003)(83380400001)(4326008)(8936002)(8676002)(36860700001)(47076005)(110136005)(6666004)(316002)(54906003)(508600001)(82310400004)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2022 08:52:57.2332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcd4e5e-338c-420d-5f97-08d9eece3b2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4879
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Remove drm_mm references and replace with drm buddy functionalities
- Add res cursor support for drm buddy

v2(Matthew Auld):
  - replace spinlock with mutex as we call kmem_cache_zalloc
    (..., GFP_KERNEL) in drm_buddy_alloc() function

  - lock drm_buddy_block_trim() function as it calls
    mark_free/mark_split are all globally visible

v3(Matthew Auld):
  - remove trim method error handling as we address the failure case
    at drm_buddy_block_trim() function

v4:
  - fix warnings reported by kernel test robot <lkp@intel.com>

v5:
  - fix merge conflict issue

v6:
  - fix warnings reported by kernel test robot <lkp@intel.com>

v7:
  - remove DRM_BUDDY_RANGE_ALLOCATION flag usage

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/Kconfig                       |   1 +
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 +++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   7 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 254 ++++++++++--------
 4 files changed, 226 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dfdd3ec5f793..eb5a57ae3c5c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -279,6 +279,7 @@ config DRM_AMDGPU
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
+	select DRM_BUDDY
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index acfa207cf970..da12b4ff2e45 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -30,12 +30,15 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_range_manager.h>
 
+#include "amdgpu_vram_mgr.h"
+
 /* state back for walking over vram_mgr and gtt_mgr allocations */
 struct amdgpu_res_cursor {
 	uint64_t		start;
 	uint64_t		size;
 	uint64_t		remaining;
-	struct drm_mm_node	*node;
+	void			*node;
+	uint32_t		mem_type;
 };
 
 /**
@@ -52,27 +55,63 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 				    uint64_t start, uint64_t size,
 				    struct amdgpu_res_cursor *cur)
 {
+	struct drm_buddy_block *block;
+	struct list_head *head, *next;
 	struct drm_mm_node *node;
 
-	if (!res || res->mem_type == TTM_PL_SYSTEM) {
-		cur->start = start;
-		cur->size = size;
-		cur->remaining = size;
-		cur->node = NULL;
-		WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
-		return;
-	}
+	if (!res)
+		goto err_out;
 
 	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
 
-	node = to_ttm_range_mgr_node(res)->mm_nodes;
-	while (start >= node->size << PAGE_SHIFT)
-		start -= node++->size << PAGE_SHIFT;
+	cur->mem_type = res->mem_type;
+
+	switch (cur->mem_type) {
+	case TTM_PL_VRAM:
+		head = &to_amdgpu_vram_mgr_node(res)->blocks;
+
+		block = list_first_entry_or_null(head,
+						 struct drm_buddy_block,
+						 link);
+		if (!block)
+			goto err_out;
+
+		while (start >= amdgpu_node_size(block)) {
+			start -= amdgpu_node_size(block);
+
+			next = block->link.next;
+			if (next != head)
+				block = list_entry(next, struct drm_buddy_block, link);
+		}
+
+		cur->start = amdgpu_node_start(block) + start;
+		cur->size = min(amdgpu_node_size(block) - start, size);
+		cur->remaining = size;
+		cur->node = block;
+		break;
+	case TTM_PL_TT:
+		node = to_ttm_range_mgr_node(res)->mm_nodes;
+		while (start >= node->size << PAGE_SHIFT)
+			start -= node++->size << PAGE_SHIFT;
+
+		cur->start = (node->start << PAGE_SHIFT) + start;
+		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+		cur->remaining = size;
+		cur->node = node;
+		break;
+	default:
+		goto err_out;
+	}
 
-	cur->start = (node->start << PAGE_SHIFT) + start;
-	cur->size = min((node->size << PAGE_SHIFT) - start, size);
+	return;
+
+err_out:
+	cur->start = start;
+	cur->size = size;
 	cur->remaining = size;
-	cur->node = node;
+	cur->node = NULL;
+	WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
+	return;
 }
 
 /**
@@ -85,7 +124,9 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
  */
 static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 {
-	struct drm_mm_node *node = cur->node;
+	struct drm_buddy_block *block;
+	struct drm_mm_node *node;
+	struct list_head *next;
 
 	BUG_ON(size > cur->remaining);
 
@@ -99,9 +140,27 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 		return;
 	}
 
-	cur->node = ++node;
-	cur->start = node->start << PAGE_SHIFT;
-	cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+	switch (cur->mem_type) {
+	case TTM_PL_VRAM:
+		block = cur->node;
+
+		next = block->link.next;
+		block = list_entry(next, struct drm_buddy_block, link);
+
+		cur->node = block;
+		cur->start = amdgpu_node_start(block);
+		cur->size = min(amdgpu_node_size(block), cur->remaining);
+		break;
+	case TTM_PL_TT:
+		node = cur->node;
+
+		cur->node = ++node;
+		cur->start = node->start << PAGE_SHIFT;
+		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
+		break;
+	default:
+		return;
+	}
 }
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index f8f48be16d80..1a5cbd5ef738 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -26,6 +26,7 @@
 
 #include <linux/dma-direction.h>
 #include <drm/gpu_scheduler.h>
+#include <drm/drm_buddy.h>
 #include "amdgpu.h"
 
 #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
@@ -40,12 +41,14 @@
 
 struct amdgpu_vram_mgr {
 	struct ttm_resource_manager manager;
-	struct drm_mm mm;
-	spinlock_t lock;
+	struct drm_buddy mm;
+	/* protects access to buffer objects */
+	struct mutex lock;
 	struct list_head reservations_pending;
 	struct list_head reserved_pages;
 	atomic64_t usage;
 	atomic64_t vis_usage;
+	u64 default_page_size;
 };
 
 struct amdgpu_gtt_mgr {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 7442095f089c..a18a7136fa46 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -32,8 +32,11 @@
 #include "atom.h"
 
 struct amdgpu_vram_reservation {
+	u64 start;
+	u64 size;
+	unsigned long flags;
+	struct list_head block;
 	struct list_head node;
-	struct drm_mm_node mm_node;
 };
 
 static inline struct amdgpu_vram_mgr *
@@ -194,10 +197,10 @@ const struct attribute_group amdgpu_vram_mgr_attr_group = {
  * Calculate how many bytes of the MM node are inside visible VRAM
  */
 static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
-				    struct drm_mm_node *node)
+				    struct drm_buddy_block *block)
 {
-	uint64_t start = node->start << PAGE_SHIFT;
-	uint64_t end = (node->size + node->start) << PAGE_SHIFT;
+	u64 start = amdgpu_node_start(block);
+	u64 end = start + amdgpu_node_size(block);
 
 	if (start >= adev->gmc.visible_vram_size)
 		return 0;
@@ -218,9 +221,9 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct ttm_resource *res = bo->tbo.resource;
-	unsigned pages = res->num_pages;
-	struct drm_mm_node *mm;
-	u64 usage;
+	struct amdgpu_vram_mgr_node *node = to_amdgpu_vram_mgr_node(res);
+	struct drm_buddy_block *block;
+	u64 usage = 0;
 
 	if (amdgpu_gmc_vram_full_visible(&adev->gmc))
 		return amdgpu_bo_size(bo);
@@ -228,9 +231,8 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 	if (res->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
 		return 0;
 
-	mm = &container_of(res, struct ttm_range_mgr_node, base)->mm_nodes[0];
-	for (usage = 0; pages; pages -= mm->size, mm++)
-		usage += amdgpu_vram_mgr_vis_size(adev, mm);
+	list_for_each_entry(block, &node->blocks, link)
+		usage += amdgpu_vram_mgr_vis_size(adev, block);
 
 	return usage;
 }
@@ -240,21 +242,29 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct drm_mm *mm = &mgr->mm;
+	struct drm_buddy *mm = &mgr->mm;
 	struct amdgpu_vram_reservation *rsv, *temp;
+	struct drm_buddy_block *block;
 	uint64_t vis_usage;
 
 	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node) {
-		if (drm_mm_reserve_node(mm, &rsv->mm_node))
+		if (drm_buddy_alloc_blocks(mm, rsv->start, rsv->start + rsv->size,
+					   rsv->size, mm->chunk_size, &rsv->block,
+					   rsv->flags))
 			continue;
 
-		dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
-			rsv->mm_node.start, rsv->mm_node.size);
-
-		vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
-		atomic64_add(vis_usage, &mgr->vis_usage);
-		atomic64_add(rsv->mm_node.size << PAGE_SHIFT, &mgr->usage);
-		list_move(&rsv->node, &mgr->reserved_pages);
+		block = list_first_entry_or_null(&rsv->block,
+						 struct drm_buddy_block,
+						 link);
+		if (block) {
+			dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
+				rsv->start, rsv->size);
+
+			vis_usage = amdgpu_vram_mgr_vis_size(adev, block);
+			atomic64_add(vis_usage, &mgr->vis_usage);
+			atomic64_add(rsv->size, &mgr->usage);
+			list_move(&rsv->node, &mgr->reserved_pages);
+		}
 	}
 }
 
@@ -277,13 +287,15 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&rsv->node);
-	rsv->mm_node.start = start >> PAGE_SHIFT;
-	rsv->mm_node.size = size >> PAGE_SHIFT;
+	INIT_LIST_HEAD(&rsv->block);
+
+	rsv->start = start;
+	rsv->size = size;
 
-	spin_lock(&mgr->lock);
-	list_add_tail(&mgr->reservations_pending, &rsv->node);
+	mutex_lock(&mgr->lock);
+	list_add_tail(&rsv->node, &mgr->reservations_pending);
 	amdgpu_vram_mgr_do_reserve(&mgr->manager);
-	spin_unlock(&mgr->lock);
+	mutex_unlock(&mgr->lock);
 
 	return 0;
 }
@@ -305,19 +317,19 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
 	struct amdgpu_vram_reservation *rsv;
 	int ret;
 
-	spin_lock(&mgr->lock);
+	mutex_lock(&mgr->lock);
 
 	list_for_each_entry(rsv, &mgr->reservations_pending, node) {
-		if ((rsv->mm_node.start <= start) &&
-		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
+		if (rsv->start <= start &&
+		    (start < (rsv->start + rsv->size))) {
 			ret = -EBUSY;
 			goto out;
 		}
 	}
 
 	list_for_each_entry(rsv, &mgr->reserved_pages, node) {
-		if ((rsv->mm_node.start <= start) &&
-		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
+		if (rsv->start <= start &&
+		    (start < (rsv->start + rsv->size))) {
 			ret = 0;
 			goto out;
 		}
@@ -325,32 +337,10 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
 
 	ret = -ENOENT;
 out:
-	spin_unlock(&mgr->lock);
+	mutex_unlock(&mgr->lock);
 	return ret;
 }
 
-/**
- * amdgpu_vram_mgr_virt_start - update virtual start address
- *
- * @mem: ttm_resource to update
- * @node: just allocated node
- *
- * Calculate a virtual BO start address to easily check if everything is CPU
- * accessible.
- */
-static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
-				       struct drm_mm_node *node)
-{
-	unsigned long start;
-
-	start = node->start + node->size;
-	if (start > mem->num_pages)
-		start -= mem->num_pages;
-	else
-		start = 0;
-	mem->start = max(mem->start, start);
-}
-
 /**
  * amdgpu_vram_mgr_new - allocate new ranges
  *
@@ -366,13 +356,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_resource **res)
 {
-	unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
+	unsigned long lpfn, pages_per_node, pages_left, pages, n_pages;
+	u64 vis_usage = 0, mem_bytes, max_bytes, min_page_size;
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	uint64_t vis_usage = 0, mem_bytes, max_bytes;
-	struct ttm_range_mgr_node *node;
-	struct drm_mm *mm = &mgr->mm;
-	enum drm_mm_insert_mode mode;
+	struct amdgpu_vram_mgr_node *node;
+	struct drm_buddy *mm = &mgr->mm;
+	struct drm_buddy_block *block;
 	unsigned i;
 	int r;
 
@@ -391,10 +381,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_sub;
 	}
 
-	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
 		pages_per_node = ~0ul;
-		num_nodes = 1;
-	} else {
+	else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 		pages_per_node = HPAGE_PMD_NR;
 #else
@@ -403,11 +392,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 #endif
 		pages_per_node = max_t(uint32_t, pages_per_node,
 				       tbo->page_alignment);
-		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
 	}
 
-	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
-			GFP_KERNEL | __GFP_ZERO);
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node) {
 		r = -ENOMEM;
 		goto error_sub;
@@ -415,9 +402,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 
 	ttm_resource_init(tbo, place, &node->base);
 
-	mode = DRM_MM_INSERT_BEST;
+	INIT_LIST_HEAD(&node->blocks);
+
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
-		mode = DRM_MM_INSERT_HIGH;
+		node->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
+	min_page_size = mgr->default_page_size;
+	BUG_ON(min_page_size < mm->chunk_size);
 
 	pages_left = node->base.num_pages;
 
@@ -425,36 +416,61 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
 
 	i = 0;
-	spin_lock(&mgr->lock);
 	while (pages_left) {
-		uint32_t alignment = tbo->page_alignment;
-
 		if (pages >= pages_per_node)
-			alignment = pages_per_node;
-
-		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
-						alignment, 0, place->fpfn,
-						lpfn, mode);
-		if (unlikely(r)) {
-			if (pages > pages_per_node) {
-				if (is_power_of_2(pages))
-					pages = pages / 2;
-				else
-					pages = rounddown_pow_of_two(pages);
-				continue;
-			}
-			goto error_free;
+			pages = pages_per_node;
+
+		n_pages = pages;
+
+		if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+			n_pages = roundup_pow_of_two(n_pages);
+			min_page_size = (u64)n_pages << PAGE_SHIFT;
+
+			if (n_pages > lpfn)
+				lpfn = n_pages;
 		}
 
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
-		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
+		mutex_lock(&mgr->lock);
+		r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
+					   (u64)lpfn << PAGE_SHIFT,
+					   (u64)n_pages << PAGE_SHIFT,
+					   min_page_size,
+					   &node->blocks,
+					   node->flags);
+		mutex_unlock(&mgr->lock);
+		if (unlikely(r))
+			goto error_free_blocks;
+
 		pages_left -= pages;
 		++i;
 
 		if (pages > pages_left)
 			pages = pages_left;
 	}
-	spin_unlock(&mgr->lock);
+
+	/* Free unused pages for contiguous allocation */
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		u64 actual_size = (u64)node->base.num_pages << PAGE_SHIFT;
+
+		mutex_lock(&mgr->lock);
+		drm_buddy_block_trim(mm,
+				     actual_size,
+				     &node->blocks);
+		mutex_unlock(&mgr->lock);
+	}
+
+	list_for_each_entry(block, &node->blocks, link)
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
+
+	block = list_first_entry_or_null(&node->blocks,
+					 struct drm_buddy_block,
+					 link);
+	if (!block) {
+		r = -EINVAL;
+		goto error_free_res;
+	}
+
+	node->base.start = amdgpu_node_start(block) >> PAGE_SHIFT;
 
 	if (i == 1)
 		node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
@@ -468,13 +484,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	*res = &node->base;
 	return 0;
 
-error_free:
-	while (i--)
-		drm_mm_remove_node(&node->mm_nodes[i]);
-	spin_unlock(&mgr->lock);
+error_free_blocks:
+	mutex_lock(&mgr->lock);
+	drm_buddy_free_list(mm, &node->blocks);
+	mutex_unlock(&mgr->lock);
+error_free_res:
 	ttm_resource_fini(man, &node->base);
-	kvfree(node);
-
+	kfree(node);
 error_sub:
 	atomic64_sub(mem_bytes, &mgr->usage);
 	return r;
@@ -491,29 +507,29 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 				struct ttm_resource *res)
 {
-	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
+	struct amdgpu_vram_mgr_node *node = to_amdgpu_vram_mgr_node(res);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
+	struct drm_buddy *mm = &mgr->mm;
+	struct drm_buddy_block *block;
 	uint64_t usage = 0, vis_usage = 0;
-	unsigned i, pages;
 
-	spin_lock(&mgr->lock);
-	for (i = 0, pages = res->num_pages; pages;
-	     pages -= node->mm_nodes[i].size, ++i) {
-		struct drm_mm_node *mm = &node->mm_nodes[i];
-
-		drm_mm_remove_node(mm);
-		usage += mm->size << PAGE_SHIFT;
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
+	mutex_lock(&mgr->lock);
+	list_for_each_entry(block, &node->blocks, link) {
+		usage += amdgpu_node_size(block);
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
 	}
+
 	amdgpu_vram_mgr_do_reserve(man);
-	spin_unlock(&mgr->lock);
+
+	drm_buddy_free_list(mm, &node->blocks);
+	mutex_unlock(&mgr->lock);
 
 	atomic64_sub(usage, &mgr->usage);
 	atomic64_sub(vis_usage, &mgr->vis_usage);
 
 	ttm_resource_fini(man, res);
-	kvfree(node);
+	kfree(node);
 }
 
 /**
@@ -663,10 +679,19 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 				  struct drm_printer *printer)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
+	struct drm_buddy *mm = &mgr->mm;
+	struct drm_buddy_block *block;
+
+	mutex_lock(&mgr->lock);
+	drm_printf(printer, "default_page_size: %lluKiB\n",
+		   mgr->default_page_size >> 10);
 
-	spin_lock(&mgr->lock);
-	drm_mm_print(&mgr->mm, printer);
-	spin_unlock(&mgr->lock);
+	drm_buddy_print(mm, printer);
+
+	drm_printf(printer, "reserved:\n");
+	list_for_each_entry(block, &mgr->reserved_pages, link)
+		drm_buddy_block_print(mm, block, printer);
+	mutex_unlock(&mgr->lock);
 
 	drm_printf(printer, "man size:%llu pages, ram usage:%lluMB, vis usage:%lluMB\n",
 		   man->size, amdgpu_vram_mgr_usage(mgr) >> 20,
@@ -690,16 +715,21 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
+	int err;
 
 	ttm_resource_manager_init(man, &adev->mman.bdev,
 				  adev->gmc.real_vram_size >> PAGE_SHIFT);
 
 	man->func = &amdgpu_vram_mgr_func;
 
-	drm_mm_init(&mgr->mm, 0, man->size);
-	spin_lock_init(&mgr->lock);
+	err = drm_buddy_init(&mgr->mm, man->size << PAGE_SHIFT, PAGE_SIZE);
+	if (err)
+		return err;
+
+	mutex_init(&mgr->lock);
 	INIT_LIST_HEAD(&mgr->reservations_pending);
 	INIT_LIST_HEAD(&mgr->reserved_pages);
+	mgr->default_page_size = PAGE_SIZE;
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
@@ -727,16 +757,16 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 	if (ret)
 		return;
 
-	spin_lock(&mgr->lock);
+	mutex_lock(&mgr->lock);
 	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node)
 		kfree(rsv);
 
 	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
-		drm_mm_remove_node(&rsv->mm_node);
+		drm_buddy_free_list(&mgr->mm, &rsv->block);
 		kfree(rsv);
 	}
-	drm_mm_takedown(&mgr->mm);
-	spin_unlock(&mgr->lock);
+	drm_buddy_fini(&mgr->mm);
+	mutex_unlock(&mgr->lock);
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
-- 
2.25.1

