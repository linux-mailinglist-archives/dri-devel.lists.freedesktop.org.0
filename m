Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA7A56B723
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B1610E148;
	Fri,  8 Jul 2022 10:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949F610E0ED;
 Fri,  8 Jul 2022 10:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gudc18bftsk0PooRqGwHgiMgf68qz1VUxdNSslxKhymg99J1dRcFEwTPvDscUJJVgb1Hc0za/8stLOmjD/bQ+7DAg9qc/7iQr8eT98+2V6svw+vDh/ymBOecMpkTyhqVUQVJpoopQes0ZQJlTLR2G5MQU3y95aYBNs4zfGtDe7/dVmHEtXgv0BGc64qWD3JYocIygfMCQm005K/CHwEAdpicn3E4pW8Hie6lqlBO186TiZDwo8N7jWsamg4FSZ8LR7FYg+5ZMvGaI9Z/GDYXefhJvyY/BZp3U3keFQlhdwwS9wSZIAxTIdqeYlKtKJwGUb175f2rnEwuLuP7xA1JQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0fD76/FKXfDvj432XnfyVTgC0lu6Genzlah3o5eb6s=;
 b=Yuo8cAbc/2Wv38Zr/Qy9Ye+SquTywIhvdsPxvp7B/yj+5wkEPru51CBcYiBjkxRnfOPUpiqqxL0UVH14dsSMiWeDyXQ3UyVgzRD60hc9wRTDrydEltFGNHF6bvgGkIsGXo0YE4+fA6306+YDZji3bmbTsJtHK/ZZ0OS6DTLyr4qAwVGLj8yd+Dy7YhAsdagu2+Lq3z6MaH72IRnbkLFIBZF9i3knwPUnOcqEgKVNYu7TUrXSgb7N2Ga2Guyg7Jj3K6pucJZqRa5xCL6FIN/S7pCm/UNLXa9yivpLiv/AhSjT80I84tIT4UAw8g1CGWIy34yTJCxTVu91jnIO9ZzC/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0fD76/FKXfDvj432XnfyVTgC0lu6Genzlah3o5eb6s=;
 b=WUud3LXsP4dsdxOfkqRM79h0tYoVtB16CkP9XdfTCyI4KCqSTIiSeX03J3hVTAstNn4pbYLjn9Zu/cPyoHazhLAhzNMrqof8PeoqlQ9aX2RWo+OQJ+OfGnWtqGUlNCeFKp8ovXF2Wyq4HC8nrw7yVlqDOGP/XKmmrjky7BVnnzM=
Received: from BN9PR03CA0175.namprd03.prod.outlook.com (2603:10b6:408:f4::30)
 by MWHPR1201MB0095.namprd12.prod.outlook.com (2603:10b6:301:4e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Fri, 8 Jul
 2022 10:21:42 +0000
Received: from BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::d7) by BN9PR03CA0175.outlook.office365.com
 (2603:10b6:408:f4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 10:21:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT052.mail.protection.outlook.com (10.13.177.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 10:21:42 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 8 Jul 2022 05:21:39 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/amdgpu: add drm buddy support to amdgpu"
Date: Fri, 8 Jul 2022 03:21:24 -0700
Message-ID: <20220708102124.493372-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5937d66b-a00d-4463-56f2-08da60cba723
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0095:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+A5Og+o9ijJCYBP/Hs7b7OKaxZR9ZIwivikXtar08GKjBRtFD5A7PNsHZ5MbiUbp700RKrAB+WWJnjuc5i2o07Cv+7MU/qHg/bmjs96k61UWfzqdBsKcsunPzuspfhY42kL3hRB5oErCrMF6V1PCgLqziPcAZ5c00T4SFWwTQqPx24t5IogZBCMyvwetf72ye2R+W7D4YJUMwszxWB1QjiNyAE1eNN5z2rL58LtxGbMRg40dADyVmcmJ4KGaN7754n8mMkPibnI7a8De9X4nid4JGKhjMiGLzXLj9vbtCCPzyPm4pSgV0yExl2MpP2SHpcIDl2Ww4u9VLs3YGiE4/RCzq9vT992Z8iavTETvW9u+D8pOIFSnypok0pY57A6DMIIyayU4hDJv340I5CJZmIijyAY2NpTKmgMWgtnL//zi1yJTcKoO80QRM0J5TwYsepKEOBJWm9m++kY9U0HMhF6i8XGUMUoolRLgpjuzpLROuXXZyJwgPRoSJi2ClYX90BJdOH7FuzRBcXz2Ywom9nLx7irHnHvq/mZMKU0Wv0PcBS7x1dwLkKiPjBSPCVo8JmBHV7bIj7UVXZuk3KO20vHETcWolY9PXqbrPzbgfUT5V9TkoRIRXoMRxiNZM0f4ThkE0dsE9IvlykScDLtVIlXbQJUzIn7g/FFTtHrJ4dZCeN/Uz6dpBy5Wo5ES87yKbZKqk4eFcpZL96WZIiirGzpN4kJn2MEXWLcD6op55akkWXQ8vVcXJ4AFaSt2N0yEeC9wCKT3jD7UHXQKejdA7nl25FR8RBE+bkHDZatDqSsM0EFjbK6tB83vIAw931cf/UXaaob7/s3zkPJ2Gpo3FFMCXzQkBt2AeS4nU3yAcjl603b4qFXtIgj8dj5fFSX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(46966006)(40470700004)(7696005)(40460700003)(2616005)(86362001)(41300700001)(2906002)(6666004)(26005)(8936002)(478600001)(82310400005)(5660300002)(30864003)(1076003)(336012)(186003)(426003)(40480700001)(16526019)(81166007)(34020700004)(356005)(70586007)(36756003)(110136005)(36860700001)(70206006)(316002)(8676002)(54906003)(47076005)(450100002)(4326008)(82740400003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 10:21:42.4460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5937d66b-a00d-4463-56f2-08da60cba723
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0095
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Arunpravin
 Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts the following commits:
commit 708d19d9f362 ("drm/amdgpu: move internal vram_mgr function into the C file")
commit 5e3f1e7729ec ("drm/amdgpu: fix start calculation in amdgpu_vram_mgr_new")
commit c9cad937c0c5 ("drm/amdgpu: add drm buddy support to amdgpu")

[WHY]
Few users reported garbaged graphics as soon as x starts,
reverting until this can be resolved.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/Kconfig                       |   1 -
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 394 +++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |  62 ---
 5 files changed, 176 insertions(+), 388 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 6c2256e8474b..d438d5ff8b40 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -272,7 +272,6 @@ config DRM_AMDGPU
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
-	select DRM_BUDDY
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
index 6546552e596c..acfa207cf970 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
@@ -30,15 +30,12 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_range_manager.h>
 
-#include "amdgpu_vram_mgr.h"
-
 /* state back for walking over vram_mgr and gtt_mgr allocations */
 struct amdgpu_res_cursor {
 	uint64_t		start;
 	uint64_t		size;
 	uint64_t		remaining;
-	void			*node;
-	uint32_t		mem_type;
+	struct drm_mm_node	*node;
 };
 
 /**
@@ -55,63 +52,27 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
 				    uint64_t start, uint64_t size,
 				    struct amdgpu_res_cursor *cur)
 {
-	struct drm_buddy_block *block;
-	struct list_head *head, *next;
 	struct drm_mm_node *node;
 
-	if (!res)
-		goto fallback;
-
-	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
-
-	cur->mem_type = res->mem_type;
-
-	switch (cur->mem_type) {
-	case TTM_PL_VRAM:
-		head = &to_amdgpu_vram_mgr_resource(res)->blocks;
-
-		block = list_first_entry_or_null(head,
-						 struct drm_buddy_block,
-						 link);
-		if (!block)
-			goto fallback;
-
-		while (start >= amdgpu_vram_mgr_block_size(block)) {
-			start -= amdgpu_vram_mgr_block_size(block);
-
-			next = block->link.next;
-			if (next != head)
-				block = list_entry(next, struct drm_buddy_block, link);
-		}
-
-		cur->start = amdgpu_vram_mgr_block_start(block) + start;
-		cur->size = min(amdgpu_vram_mgr_block_size(block) - start, size);
-		cur->remaining = size;
-		cur->node = block;
-		break;
-	case TTM_PL_TT:
-		node = to_ttm_range_mgr_node(res)->mm_nodes;
-		while (start >= node->size << PAGE_SHIFT)
-			start -= node++->size << PAGE_SHIFT;
-
-		cur->start = (node->start << PAGE_SHIFT) + start;
-		cur->size = min((node->size << PAGE_SHIFT) - start, size);
+	if (!res || res->mem_type == TTM_PL_SYSTEM) {
+		cur->start = start;
+		cur->size = size;
 		cur->remaining = size;
-		cur->node = node;
-		break;
-	default:
-		goto fallback;
+		cur->node = NULL;
+		WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
+		return;
 	}
 
-	return;
+	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
 
-fallback:
-	cur->start = start;
-	cur->size = size;
+	node = to_ttm_range_mgr_node(res)->mm_nodes;
+	while (start >= node->size << PAGE_SHIFT)
+		start -= node++->size << PAGE_SHIFT;
+
+	cur->start = (node->start << PAGE_SHIFT) + start;
+	cur->size = min((node->size << PAGE_SHIFT) - start, size);
 	cur->remaining = size;
-	cur->node = NULL;
-	WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
-	return;
+	cur->node = node;
 }
 
 /**
@@ -124,9 +85,7 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
  */
 static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 {
-	struct drm_buddy_block *block;
-	struct drm_mm_node *node;
-	struct list_head *next;
+	struct drm_mm_node *node = cur->node;
 
 	BUG_ON(size > cur->remaining);
 
@@ -140,27 +99,9 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
 		return;
 	}
 
-	switch (cur->mem_type) {
-	case TTM_PL_VRAM:
-		block = cur->node;
-
-		next = block->link.next;
-		block = list_entry(next, struct drm_buddy_block, link);
-
-		cur->node = block;
-		cur->start = amdgpu_vram_mgr_block_start(block);
-		cur->size = min(amdgpu_vram_mgr_block_size(block), cur->remaining);
-		break;
-	case TTM_PL_TT:
-		node = cur->node;
-
-		cur->node = ++node;
-		cur->start = node->start << PAGE_SHIFT;
-		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
-		break;
-	default:
-		return;
-	}
+	cur->node = ++node;
+	cur->start = node->start << PAGE_SHIFT;
+	cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
 }
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 6a70818039dd..9120ae80ef52 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -26,7 +26,6 @@
 
 #include <linux/dma-direction.h>
 #include <drm/gpu_scheduler.h>
-#include "amdgpu_vram_mgr.h"
 #include "amdgpu.h"
 
 #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
@@ -39,6 +38,15 @@
 
 #define AMDGPU_POISON	0xd0bed0be
 
+struct amdgpu_vram_mgr {
+	struct ttm_resource_manager manager;
+	struct drm_mm mm;
+	spinlock_t lock;
+	struct list_head reservations_pending;
+	struct list_head reserved_pages;
+	atomic64_t vis_usage;
+};
+
 struct amdgpu_gtt_mgr {
 	struct ttm_resource_manager manager;
 	struct drm_mm mm;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 7a5e8a7b4a1b..0a7611648573 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -32,10 +32,8 @@
 #include "atom.h"
 
 struct amdgpu_vram_reservation {
-	u64 start;
-	u64 size;
-	struct list_head allocated;
-	struct list_head blocks;
+	struct list_head node;
+	struct drm_mm_node mm_node;
 };
 
 static inline struct amdgpu_vram_mgr *
@@ -50,35 +48,6 @@ to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
 	return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
 }
 
-static inline struct drm_buddy_block *
-amdgpu_vram_mgr_first_block(struct list_head *list)
-{
-	return list_first_entry_or_null(list, struct drm_buddy_block, link);
-}
-
-static inline bool amdgpu_is_vram_mgr_blocks_contiguous(struct list_head *head)
-{
-	struct drm_buddy_block *block;
-	u64 start, size;
-
-	block = amdgpu_vram_mgr_first_block(head);
-	if (!block)
-		return false;
-
-	while (head != block->link.next) {
-		start = amdgpu_vram_mgr_block_start(block);
-		size = amdgpu_vram_mgr_block_size(block);
-
-		block = list_entry(block->link.next, struct drm_buddy_block, link);
-		if (start + size != amdgpu_vram_mgr_block_start(block))
-			return false;
-	}
-
-	return true;
-}
-
-
-
 /**
  * DOC: mem_info_vram_total
  *
@@ -217,18 +186,18 @@ const struct attribute_group amdgpu_vram_mgr_attr_group = {
 };
 
 /**
- * amdgpu_vram_mgr_vis_size - Calculate visible block size
+ * amdgpu_vram_mgr_vis_size - Calculate visible node size
  *
  * @adev: amdgpu_device pointer
- * @block: DRM BUDDY block structure
+ * @node: MM node structure
  *
- * Calculate how many bytes of the DRM BUDDY block are inside visible VRAM
+ * Calculate how many bytes of the MM node are inside visible VRAM
  */
 static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
-				    struct drm_buddy_block *block)
+				    struct drm_mm_node *node)
 {
-	u64 start = amdgpu_vram_mgr_block_start(block);
-	u64 end = start + amdgpu_vram_mgr_block_size(block);
+	uint64_t start = node->start << PAGE_SHIFT;
+	uint64_t end = (node->size + node->start) << PAGE_SHIFT;
 
 	if (start >= adev->gmc.visible_vram_size)
 		return 0;
@@ -249,9 +218,9 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct ttm_resource *res = bo->tbo.resource;
-	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
-	struct drm_buddy_block *block;
-	u64 usage = 0;
+	unsigned pages = res->num_pages;
+	struct drm_mm_node *mm;
+	u64 usage;
 
 	if (amdgpu_gmc_vram_full_visible(&adev->gmc))
 		return amdgpu_bo_size(bo);
@@ -259,8 +228,9 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
 	if (res->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
 		return 0;
 
-	list_for_each_entry(block, &vres->blocks, link)
-		usage += amdgpu_vram_mgr_vis_size(adev, block);
+	mm = &container_of(res, struct ttm_range_mgr_node, base)->mm_nodes[0];
+	for (usage = 0; pages; pages -= mm->size, mm++)
+		usage += amdgpu_vram_mgr_vis_size(adev, mm);
 
 	return usage;
 }
@@ -270,30 +240,23 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct drm_buddy *mm = &mgr->mm;
+	struct drm_mm *mm = &mgr->mm;
 	struct amdgpu_vram_reservation *rsv, *temp;
-	struct drm_buddy_block *block;
 	uint64_t vis_usage;
 
-	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, blocks) {
-		if (drm_buddy_alloc_blocks(mm, rsv->start, rsv->start + rsv->size,
-					   rsv->size, mm->chunk_size, &rsv->allocated,
-					   DRM_BUDDY_RANGE_ALLOCATION))
-			continue;
-
-		block = amdgpu_vram_mgr_first_block(&rsv->allocated);
-		if (!block)
+	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node) {
+		if (drm_mm_reserve_node(mm, &rsv->mm_node))
 			continue;
 
 		dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
-			rsv->start, rsv->size);
+			rsv->mm_node.start, rsv->mm_node.size);
 
-		vis_usage = amdgpu_vram_mgr_vis_size(adev, block);
+		vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
 		atomic64_add(vis_usage, &mgr->vis_usage);
 		spin_lock(&man->bdev->lru_lock);
-		man->usage += rsv->size;
+		man->usage += rsv->mm_node.size << PAGE_SHIFT;
 		spin_unlock(&man->bdev->lru_lock);
-		list_move(&rsv->blocks, &mgr->reserved_pages);
+		list_move(&rsv->node, &mgr->reserved_pages);
 	}
 }
 
@@ -315,16 +278,14 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
 	if (!rsv)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&rsv->allocated);
-	INIT_LIST_HEAD(&rsv->blocks);
-
-	rsv->start = start;
-	rsv->size = size;
+	INIT_LIST_HEAD(&rsv->node);
+	rsv->mm_node.start = start >> PAGE_SHIFT;
+	rsv->mm_node.size = size >> PAGE_SHIFT;
 
-	mutex_lock(&mgr->lock);
-	list_add_tail(&rsv->blocks, &mgr->reservations_pending);
+	spin_lock(&mgr->lock);
+	list_add_tail(&rsv->node, &mgr->reservations_pending);
 	amdgpu_vram_mgr_do_reserve(&mgr->manager);
-	mutex_unlock(&mgr->lock);
+	spin_unlock(&mgr->lock);
 
 	return 0;
 }
@@ -346,19 +307,19 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
 	struct amdgpu_vram_reservation *rsv;
 	int ret;
 
-	mutex_lock(&mgr->lock);
+	spin_lock(&mgr->lock);
 
-	list_for_each_entry(rsv, &mgr->reservations_pending, blocks) {
-		if (rsv->start <= start &&
-		    (start < (rsv->start + rsv->size))) {
+	list_for_each_entry(rsv, &mgr->reservations_pending, node) {
+		if ((rsv->mm_node.start <= start) &&
+		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
 			ret = -EBUSY;
 			goto out;
 		}
 	}
 
-	list_for_each_entry(rsv, &mgr->reserved_pages, blocks) {
-		if (rsv->start <= start &&
-		    (start < (rsv->start + rsv->size))) {
+	list_for_each_entry(rsv, &mgr->reserved_pages, node) {
+		if ((rsv->mm_node.start <= start) &&
+		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
 			ret = 0;
 			goto out;
 		}
@@ -366,10 +327,32 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
 
 	ret = -ENOENT;
 out:
-	mutex_unlock(&mgr->lock);
+	spin_unlock(&mgr->lock);
 	return ret;
 }
 
+/**
+ * amdgpu_vram_mgr_virt_start - update virtual start address
+ *
+ * @mem: ttm_resource to update
+ * @node: just allocated node
+ *
+ * Calculate a virtual BO start address to easily check if everything is CPU
+ * accessible.
+ */
+static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
+				       struct drm_mm_node *node)
+{
+	unsigned long start;
+
+	start = node->start + node->size;
+	if (start > mem->num_pages)
+		start -= mem->num_pages;
+	else
+		start = 0;
+	mem->start = max(mem->start, start);
+}
+
 /**
  * amdgpu_vram_mgr_new - allocate new ranges
  *
@@ -385,44 +368,46 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_resource **res)
 {
-	u64 vis_usage = 0, max_bytes, cur_size, min_block_size;
+	unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct amdgpu_vram_mgr_resource *vres;
-	u64 size, remaining_size, lpfn, fpfn;
-	struct drm_buddy *mm = &mgr->mm;
-	struct drm_buddy_block *block;
-	unsigned long pages_per_block;
+	uint64_t vis_usage = 0, mem_bytes, max_bytes;
+	struct ttm_range_mgr_node *node;
+	struct drm_mm *mm = &mgr->mm;
+	enum drm_mm_insert_mode mode;
+	unsigned i;
 	int r;
 
-	lpfn = place->lpfn << PAGE_SHIFT;
+	lpfn = place->lpfn;
 	if (!lpfn)
-		lpfn = man->size;
-
-	fpfn = place->fpfn << PAGE_SHIFT;
+		lpfn = man->size >> PAGE_SHIFT;
 
 	max_bytes = adev->gmc.mc_vram_size;
 	if (tbo->type != ttm_bo_type_kernel)
 		max_bytes -= AMDGPU_VM_RESERVED_VRAM;
 
+	mem_bytes = tbo->base.size;
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		pages_per_block = ~0ul;
+		pages_per_node = ~0ul;
+		num_nodes = 1;
 	} else {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-		pages_per_block = HPAGE_PMD_NR;
+		pages_per_node = HPAGE_PMD_NR;
 #else
 		/* default to 2MB */
-		pages_per_block = 2UL << (20UL - PAGE_SHIFT);
+		pages_per_node = 2UL << (20UL - PAGE_SHIFT);
 #endif
-		pages_per_block = max_t(uint32_t, pages_per_block,
-					tbo->page_alignment);
+		pages_per_node = max_t(uint32_t, pages_per_node,
+				       tbo->page_alignment);
+		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
 	}
 
-	vres = kzalloc(sizeof(*vres), GFP_KERNEL);
-	if (!vres)
+	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
+			GFP_KERNEL | __GFP_ZERO);
+	if (!node)
 		return -ENOMEM;
 
-	ttm_resource_init(tbo, place, &vres->base);
+	ttm_resource_init(tbo, place, &node->base);
 
 	/* bail out quickly if there's likely not enough VRAM for this BO */
 	if (ttm_resource_manager_usage(man) > max_bytes) {
@@ -430,136 +415,66 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_fini;
 	}
 
-	INIT_LIST_HEAD(&vres->blocks);
-
+	mode = DRM_MM_INSERT_BEST;
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
-		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
-
-	if (fpfn || lpfn != man->size)
-		/* Allocate blocks in desired range */
-		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
-
-	remaining_size = vres->base.num_pages << PAGE_SHIFT;
-
-	mutex_lock(&mgr->lock);
-	while (remaining_size) {
-		if (tbo->page_alignment)
-			min_block_size = tbo->page_alignment << PAGE_SHIFT;
-		else
-			min_block_size = mgr->default_page_size;
-
-		BUG_ON(min_block_size < mm->chunk_size);
-
-		/* Limit maximum size to 2GiB due to SG table limitations */
-		size = min(remaining_size, 2ULL << 30);
-
-		if (size >= pages_per_block << PAGE_SHIFT)
-			min_block_size = pages_per_block << PAGE_SHIFT;
-
-		cur_size = size;
-
-		if (fpfn + size != place->lpfn << PAGE_SHIFT) {
-			/*
-			 * Except for actual range allocation, modify the size and
-			 * min_block_size conforming to continuous flag enablement
-			 */
-			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-				size = roundup_pow_of_two(size);
-				min_block_size = size;
-			/*
-			 * Modify the size value if size is not
-			 * aligned with min_block_size
-			 */
-			} else if (!IS_ALIGNED(size, min_block_size)) {
-				size = round_up(size, min_block_size);
+		mode = DRM_MM_INSERT_HIGH;
+
+	pages_left = node->base.num_pages;
+
+	/* Limit maximum size to 2GB due to SG table limitations */
+	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
+
+	i = 0;
+	spin_lock(&mgr->lock);
+	while (pages_left) {
+		uint32_t alignment = tbo->page_alignment;
+
+		if (pages >= pages_per_node)
+			alignment = pages_per_node;
+
+		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
+						alignment, 0, place->fpfn,
+						lpfn, mode);
+		if (unlikely(r)) {
+			if (pages > pages_per_node) {
+				if (is_power_of_2(pages))
+					pages = pages / 2;
+				else
+					pages = rounddown_pow_of_two(pages);
+				continue;
 			}
+			goto error_free;
 		}
 
-		r = drm_buddy_alloc_blocks(mm, fpfn,
-					   lpfn,
-					   size,
-					   min_block_size,
-					   &vres->blocks,
-					   vres->flags);
-		if (unlikely(r))
-			goto error_free_blocks;
-
-		if (size > remaining_size)
-			remaining_size = 0;
-		else
-			remaining_size -= size;
-	}
-	mutex_unlock(&mgr->lock);
-
-	if (cur_size != size) {
-		struct drm_buddy_block *block;
-		struct list_head *trim_list;
-		u64 original_size;
-		LIST_HEAD(temp);
-
-		trim_list = &vres->blocks;
-		original_size = vres->base.num_pages << PAGE_SHIFT;
-
-		/*
-		 * If size value is rounded up to min_block_size, trim the last
-		 * block to the required size
-		 */
-		if (!list_is_singular(&vres->blocks)) {
-			block = list_last_entry(&vres->blocks, typeof(*block), link);
-			list_move_tail(&block->link, &temp);
-			trim_list = &temp;
-			/*
-			 * Compute the original_size value by subtracting the
-			 * last block size with (aligned size - original size)
-			 */
-			original_size = amdgpu_vram_mgr_block_size(block) - (size - cur_size);
-		}
-
-		mutex_lock(&mgr->lock);
-		drm_buddy_block_trim(mm,
-				     original_size,
-				     trim_list);
-		mutex_unlock(&mgr->lock);
-
-		if (!list_empty(&temp))
-			list_splice_tail(trim_list, &vres->blocks);
-	}
-
-	vres->base.start = 0;
-	list_for_each_entry(block, &vres->blocks, link) {
-		unsigned long start;
-
-		start = amdgpu_vram_mgr_block_start(block) +
-			amdgpu_vram_mgr_block_size(block);
-		start >>= PAGE_SHIFT;
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
+		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
+		pages_left -= pages;
+		++i;
 
-		if (start > vres->base.num_pages)
-			start -= vres->base.num_pages;
-		else
-			start = 0;
-		vres->base.start = max(vres->base.start, start);
-
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
+		if (pages > pages_left)
+			pages = pages_left;
 	}
+	spin_unlock(&mgr->lock);
 
-	if (amdgpu_is_vram_mgr_blocks_contiguous(&vres->blocks))
-		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
+	if (i == 1)
+		node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
 
 	if (adev->gmc.xgmi.connected_to_cpu)
-		vres->base.bus.caching = ttm_cached;
+		node->base.bus.caching = ttm_cached;
 	else
-		vres->base.bus.caching = ttm_write_combined;
+		node->base.bus.caching = ttm_write_combined;
 
 	atomic64_add(vis_usage, &mgr->vis_usage);
-	*res = &vres->base;
+	*res = &node->base;
 	return 0;
 
-error_free_blocks:
-	drm_buddy_free_list(mm, &vres->blocks);
-	mutex_unlock(&mgr->lock);
+error_free:
+	while (i--)
+		drm_mm_remove_node(&node->mm_nodes[i]);
+	spin_unlock(&mgr->lock);
 error_fini:
-	ttm_resource_fini(man, &vres->base);
-	kfree(vres);
+	ttm_resource_fini(man, &node->base);
+	kvfree(node);
 
 	return r;
 }
@@ -575,26 +490,27 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 				struct ttm_resource *res)
 {
-	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
+	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	struct drm_buddy *mm = &mgr->mm;
-	struct drm_buddy_block *block;
 	uint64_t vis_usage = 0;
+	unsigned i, pages;
 
-	mutex_lock(&mgr->lock);
-	list_for_each_entry(block, &vres->blocks, link)
-		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
+	spin_lock(&mgr->lock);
+	for (i = 0, pages = res->num_pages; pages;
+	     pages -= node->mm_nodes[i].size, ++i) {
+		struct drm_mm_node *mm = &node->mm_nodes[i];
 
+		drm_mm_remove_node(mm);
+		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
+	}
 	amdgpu_vram_mgr_do_reserve(man);
-
-	drm_buddy_free_list(mm, &vres->blocks);
-	mutex_unlock(&mgr->lock);
+	spin_unlock(&mgr->lock);
 
 	atomic64_sub(vis_usage, &mgr->vis_usage);
 
 	ttm_resource_fini(man, res);
-	kfree(vres);
+	kvfree(node);
 }
 
 /**
@@ -626,7 +542,7 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 	if (!*sgt)
 		return -ENOMEM;
 
-	/* Determine the number of DRM_BUDDY blocks to export */
+	/* Determine the number of DRM_MM nodes to export */
 	amdgpu_res_first(res, offset, length, &cursor);
 	while (cursor.remaining) {
 		num_entries++;
@@ -642,10 +558,10 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 		sg->length = 0;
 
 	/*
-	 * Walk down DRM_BUDDY blocks to populate scatterlist nodes
-	 * @note: Use iterator api to get first the DRM_BUDDY block
+	 * Walk down DRM_MM nodes to populate scatterlist nodes
+	 * @note: Use iterator api to get first the DRM_MM node
 	 * and the number of bytes from it. Access the following
-	 * DRM_BUDDY block(s) if more buffer needs to exported
+	 * DRM_MM node(s) if more buffer needs to exported
 	 */
 	amdgpu_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
@@ -732,22 +648,13 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 				  struct drm_printer *printer)
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
-	struct drm_buddy *mm = &mgr->mm;
-	struct drm_buddy_block *block;
 
 	drm_printf(printer, "  vis usage:%llu\n",
 		   amdgpu_vram_mgr_vis_usage(mgr));
 
-	mutex_lock(&mgr->lock);
-	drm_printf(printer, "default_page_size: %lluKiB\n",
-		   mgr->default_page_size >> 10);
-
-	drm_buddy_print(mm, printer);
-
-	drm_printf(printer, "reserved:\n");
-	list_for_each_entry(block, &mgr->reserved_pages, link)
-		drm_buddy_block_print(mm, block, printer);
-	mutex_unlock(&mgr->lock);
+	spin_lock(&mgr->lock);
+	drm_mm_print(&mgr->mm, printer);
+	spin_unlock(&mgr->lock);
 }
 
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
@@ -767,21 +674,16 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 {
 	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
-	int err;
 
 	ttm_resource_manager_init(man, &adev->mman.bdev,
 				  adev->gmc.real_vram_size);
 
 	man->func = &amdgpu_vram_mgr_func;
 
-	err = drm_buddy_init(&mgr->mm, man->size, PAGE_SIZE);
-	if (err)
-		return err;
-
-	mutex_init(&mgr->lock);
+	drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
+	spin_lock_init(&mgr->lock);
 	INIT_LIST_HEAD(&mgr->reservations_pending);
 	INIT_LIST_HEAD(&mgr->reserved_pages);
-	mgr->default_page_size = PAGE_SIZE;
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
@@ -809,16 +711,16 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 	if (ret)
 		return;
 
-	mutex_lock(&mgr->lock);
-	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, blocks)
+	spin_lock(&mgr->lock);
+	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node)
 		kfree(rsv);
 
-	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, blocks) {
-		drm_buddy_free_list(&mgr->mm, &rsv->blocks);
+	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
+		drm_mm_remove_node(&rsv->mm_node);
 		kfree(rsv);
 	}
-	drm_buddy_fini(&mgr->mm);
-	mutex_unlock(&mgr->lock);
+	drm_mm_takedown(&mgr->mm);
+	spin_unlock(&mgr->lock);
 
 	ttm_resource_manager_cleanup(man);
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
deleted file mode 100644
index 4b267bf1c5db..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
+++ /dev/null
@@ -1,62 +0,0 @@
-/* SPDX-License-Identifier: MIT
- * Copyright 2021 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-
-#ifndef __AMDGPU_VRAM_MGR_H__
-#define __AMDGPU_VRAM_MGR_H__
-
-#include <drm/drm_buddy.h>
-
-struct amdgpu_vram_mgr {
-	struct ttm_resource_manager manager;
-	struct drm_buddy mm;
-	/* protects access to buffer objects */
-	struct mutex lock;
-	struct list_head reservations_pending;
-	struct list_head reserved_pages;
-	atomic64_t vis_usage;
-	u64 default_page_size;
-};
-
-struct amdgpu_vram_mgr_resource {
-	struct ttm_resource base;
-	struct list_head blocks;
-	unsigned long flags;
-};
-
-static inline u64 amdgpu_vram_mgr_block_start(struct drm_buddy_block *block)
-{
-	return drm_buddy_block_offset(block);
-}
-
-static inline u64 amdgpu_vram_mgr_block_size(struct drm_buddy_block *block)
-{
-	return PAGE_SIZE << drm_buddy_block_order(block);
-}
-
-static inline struct amdgpu_vram_mgr_resource *
-to_amdgpu_vram_mgr_resource(struct ttm_resource *res)
-{
-	return container_of(res, struct amdgpu_vram_mgr_resource, base);
-}
-
-#endif
-- 
2.25.1

