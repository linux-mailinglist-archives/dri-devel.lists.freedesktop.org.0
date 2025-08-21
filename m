Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B780B2FDBE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 17:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C912110E9C0;
	Thu, 21 Aug 2025 15:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VCZ7eLoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995D910E9C0;
 Thu, 21 Aug 2025 15:07:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paA2lA0mbSkVgy/izWk678Uq0PfBt+dkZ34Nn96iYV+Dw6ZzRoFVCglrClDnLNI/WBOXZ2hNu9D585DyzeP1/2wGDVpozlc7h16mDUPY71pBHzXHZoyJT8x2ruLD82eow6HxNb6U0K1uhY6s+PUSuMbu1VuKEo8jF3hdyIVb5UifNl9hMTBccyermvOTDzQLwPjELSVMd6RK1wX273fzTaCfi9RriiIj5OzQWyiB4dvFpraZFc/iUkgiAL9k1txN787VgGU71oKoW2eG4TLRpT7DjmV2pXgUV8wmFeYfXQnHvGJrsIjj7qZF62imkuZvBF91xyWX+2z1JVUtpbAp6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=By6rje8Pi2ytskrdnIxCau15+3Fc/GykwZhn1SOxhP4=;
 b=i+rR2d1RzncD4PN2UbWpgtxW/9qDClv4U9CWC8hsiFdkWio4AR9ZGn8SLpU7TkdPrWD1d/12cJNdlmJHodRD20KexlwzjUTsBme1yrb04TUT28uqKGqOsiB99g70ylYTD07iHkpdRqfHn0dtIFV1JzKNgY/S72SICTy06zYXisz9DVfx8Wf+dK0ritTrmFgmSNDUkVHNhHnHQfxT514hfe8klNHFyj/1LoVo7y3dQTgV6zefwFsLY4ZVKZlV9nscnoXpFnwDEn+giUWQdUke4We1lVZGxdhiiN4ZkveuO0mwBUDDer51c9hDwcsP3WMyNgk7v5+yEZmQw8fpiL15vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=By6rje8Pi2ytskrdnIxCau15+3Fc/GykwZhn1SOxhP4=;
 b=VCZ7eLoRoeNLKiW4mDuwOMd8OGAYOmp8RO4ibBZkKBA0gtyFd6EAvvtfSBweBS/4N3JMC4pxnrSJMaotr2PEdkXdaj2SBOvdOQrXpcyKlta1y6MFLktFnLb3Xz0eHdEG1LzPpU0tNcfZy5mpJEosgGplN5iXwmz5o3wkBHsUC+E=
Received: from BL0PR0102CA0014.prod.exchangelabs.com (2603:10b6:207:18::27) by
 IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Thu, 21 Aug 2025 15:07:04 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:207:18:cafe::35) by BL0PR0102CA0014.outlook.office365.com
 (2603:10b6:207:18::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Thu,
 21 Aug 2025 15:06:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 15:07:04 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 10:07:01 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v3 2/2] drm/buddy: Separate clear and dirty free block trees
Date: Thu, 21 Aug 2025 20:36:41 +0530
Message-ID: <20250821150641.2720-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821150641.2720-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250821150641.2720-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|IA1PR12MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: a672e43e-73f6-44ee-0b89-08dde0c46396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nROsFhelbmxjM6Mco6l3B4EB5dbOh4seuhaQFh8jEynhkTDIrB0qCAECPpae?=
 =?us-ascii?Q?dSEJdTrKBIL4dX7L0fnI6nUhfnfEaHPiHkiLhJjULt4hRHAum6lrwerAAKRw?=
 =?us-ascii?Q?FMKYo5dt6vJCw5Jf36XiHUvuyXkXjP1lHllr9H93NvsE7WusWLtccz3vj0Pn?=
 =?us-ascii?Q?F6unAbtjfM6Bkk1Ygkc8R11k21NfmPicXcgZe6H3TrNTxE3Hu0sM1KMAKkkt?=
 =?us-ascii?Q?IS7tZSNNBnEyRNyWQ8OZE+YxgDxPyavUU1+w/riUF7/ket+juPlE2OGA3ul+?=
 =?us-ascii?Q?g6vTGesVf7UcuiYpG1uZ+d8bL/VL/w2eoyir6R4MZtrLExO7QWK63rRuJ6rM?=
 =?us-ascii?Q?er0xllQEcmwZxa1gpNq9DyvcdzT1MCGoIl/1S8XLGDkf5mXaFupX7Rml+f6d?=
 =?us-ascii?Q?T4hHH9u7Q/jvdD8S24TCZoyUR1uYBluX/kn1yi0ZzigVi2EqNhJmsJavIWfX?=
 =?us-ascii?Q?RhyuR32WjL2qAMSe8dmGq9Uef0z1CPYSZjCu58meKO9qynKsg32LGUqoEHHQ?=
 =?us-ascii?Q?PJRcYUn0QA3hBY5PtBQn37jjNpTx6bvgg7krW48ZpWWKwl8TjadgGtf1Wcvi?=
 =?us-ascii?Q?lhe6arYXG+5t7wZCluNXBG2+oOrHCQfmDJE3eFrzmnAgm4BvmRrZ/cDx1o+/?=
 =?us-ascii?Q?DOlt7g/5dqRgSgF4Gm+VC4OS66mS5/QabLlWERwNRWOTukryw8JRjvvtGj9P?=
 =?us-ascii?Q?x3aFIktIAMokcLN9mvrthTAUuxHAWm9oT38ONe4AmTgxDYbq/iY53zybetWY?=
 =?us-ascii?Q?4prSlmsFuKnaqYyXwm6RCIf1asZCOG/2kNO0EUTJdwWgwg4S5/3nbaG+CEcD?=
 =?us-ascii?Q?g5+tLWbS8jcTb1MJQEvYGFzuq/YLsprShPgUvqf2Sac73YVeUeYLmG8S65iC?=
 =?us-ascii?Q?UAkniNIqYdz4jhjutgtMix/jZcMwfpq82gmfLdQjhE+gnUyfbIp8Zuj04P5x?=
 =?us-ascii?Q?xVXrR6SK3zQjnztR2HtFAHWq8HSsX2x3lo29ZFaA0SQ9fY9QfgNHr/bJ+tsH?=
 =?us-ascii?Q?UdOVm9mNAGJkrGIEZCwlrK6kMt3Rnlq325zW3/ZwiWXhXJyw87W3VwxJ1gev?=
 =?us-ascii?Q?H1HI0mlgLq5yWZvBFSLpN5THB4GIYb1vwgtvzWPuDf2Ll9kKtUT8igCPT51V?=
 =?us-ascii?Q?ZigT5fOUzgOHuj5q+DAhCHAEJccT38xkJdIVvH631Vu7gvyFCajNAcTmiRIl?=
 =?us-ascii?Q?2aB3EjBM8F0qm69xsSCk4+b+MHNW2YucobZm7wouKSYCEL9OuA4Z6+ZCyp03?=
 =?us-ascii?Q?LZ85vB5+BoIholBc0y61bo6y0WS+J030FKBcly00QfF7BrFGA80+VkxULcZC?=
 =?us-ascii?Q?TokxY2tOg2UuV+Gxpy2B7TaDR7eRxFgh2qptV/p4qrnTfDjN9amOsa/pPQnv?=
 =?us-ascii?Q?eVJVUTg+ExP6cRYKCtqvmvyaXHZ5jMdLspCYs9YCUyzq/mbl2YTcgd09gYoT?=
 =?us-ascii?Q?oUPp5sHATmTGzB2YsRw79+NY8PPJR7K1h6psp9aK0l8DkxhELgw3ag=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:07:04.5037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a672e43e-73f6-44ee-0b89-08dde0c46396
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061
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

Maintain two separate RB trees per order - one for clear (zeroed) blocks
and another for dirty (uncleared) blocks. This separation improves
code clarity and makes it more obvious which tree is being searched
during allocation. It also improves scalability and efficiency when
searching for a specific type of block, avoiding unnecessary checks
and making the allocator more predictable under fragmentation.

The changes have been validated using the existing drm_buddy_test
KUnit test cases, along with selected graphics workloads,
to ensure correctness and avoid regressions.

v2: Missed adding the suggested-by tag. Added it in v2.
v3(Matthew):
  - Remove the double underscores from the internal functions.
  - Rename the internal functions to have less generic names.
  - Fix the error handling code.
  - Pass tree argument for the tree macro.
  - Use the existing dirty/free bit instead of new tree field.
  - Make free_trees[] instead of clear_tree and dirty_tree for
    more cleaner approach.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
---
 drivers/gpu/drm/drm_buddy.c | 342 ++++++++++++++++++++++--------------
 include/drm/drm_buddy.h     |   8 +-
 2 files changed, 215 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 92226a46cc2c..f57c384889a9 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -14,6 +14,9 @@
 
 static struct kmem_cache *slab_blocks;
 
+#define for_each_free_tree(tree) \
+	for ((tree) = CLEAR_TREE; (tree) < MAX_FREE_TREES; (tree)++)
+
 /*
  * for_each_rb_free_block() - iterate over an RB tree in order
  * @pos:	the struct type * to use as a loop cursor
@@ -78,22 +81,77 @@ static void drm_block_free(struct drm_buddy *mm,
 	kmem_cache_free(slab_blocks, block);
 }
 
+static inline struct rb_root *
+get_root(struct drm_buddy *mm,
+	 unsigned int order,
+	 enum free_tree tree)
+{
+	if (tree == CLEAR_TREE)
+		return &mm->free_trees[CLEAR_TREE][order];
+	else
+		return &mm->free_trees[DIRTY_TREE][order];
+}
+
+static inline enum free_tree
+get_tree_for_block(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_is_clear(block) ? CLEAR_TREE : DIRTY_TREE;
+}
+
+static inline enum free_tree
+get_tree_for_flags(unsigned long flags)
+{
+	return (flags & DRM_BUDDY_CLEAR_ALLOCATION) ? CLEAR_TREE : DIRTY_TREE;
+}
+
+static inline struct drm_buddy_block *
+rbtree_get_free_block(struct rb_node *node)
+{
+	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
+}
+
+static inline struct drm_buddy_block *
+rbtree_prev_free_block(struct rb_node *node)
+{
+	return rbtree_get_free_block(rb_prev(node));
+}
+
+static inline struct drm_buddy_block *
+rbtree_first_free_block(struct rb_root *root)
+{
+	return rbtree_get_free_block(rb_first(root));
+}
+
+static inline struct drm_buddy_block *
+rbtree_last_free_block(struct rb_root *root)
+{
+	return rbtree_get_free_block(rb_last(root));
+}
+
+static inline bool rbtree_is_empty(struct rb_root *root)
+{
+	return RB_EMPTY_ROOT(root);
+}
+
 static void rbtree_insert(struct drm_buddy *mm,
-			  struct drm_buddy_block *block)
+			  struct drm_buddy_block *block,
+			  enum free_tree tree)
 {
-	struct rb_root *root = &mm->free_tree[drm_buddy_block_order(block)];
-	struct rb_node **link = &root->rb_node;
-	struct rb_node *parent = NULL;
+	struct rb_node **link, *parent = NULL;
 	struct drm_buddy_block *node;
-	u64 offset;
+	struct rb_root *root;
+	unsigned int order;
+
+	order = drm_buddy_block_order(block);
 
-	offset = drm_buddy_block_offset(block);
+	root = get_root(mm, order, tree);
+	link = &root->rb_node;
 
 	while (*link) {
 		parent = *link;
-		node = rb_entry(parent, struct drm_buddy_block, rb);
+		node = rbtree_get_free_block(parent);
 
-		if (offset < drm_buddy_block_offset(node))
+		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
 			link = &parent->rb_left;
 		else
 			link = &parent->rb_right;
@@ -106,27 +164,19 @@ static void rbtree_insert(struct drm_buddy *mm,
 static void rbtree_remove(struct drm_buddy *mm,
 			  struct drm_buddy_block *block)
 {
+	unsigned int order = drm_buddy_block_order(block);
+	enum free_tree tree;
 	struct rb_root *root;
 
-	root = &mm->free_tree[drm_buddy_block_order(block)];
+	tree = drm_buddy_block_is_clear(block) ?
+	       CLEAR_TREE : DIRTY_TREE;
+
+	root = get_root(mm, order, tree);
 	rb_erase(&block->rb, root);
 
 	RB_CLEAR_NODE(&block->rb);
 }
 
-static inline struct drm_buddy_block *
-rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
-{
-	struct rb_node *node = rb_last(&mm->free_tree[order]);
-
-	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
-}
-
-static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
-{
-	return RB_EMPTY_ROOT(&mm->free_tree[order]);
-}
-
 static void clear_reset(struct drm_buddy_block *block)
 {
 	block->header &= ~DRM_BUDDY_HEADER_CLEAR;
@@ -149,10 +199,14 @@ static void mark_allocated(struct drm_buddy *mm,
 static void mark_free(struct drm_buddy *mm,
 		      struct drm_buddy_block *block)
 {
+	enum free_tree tree;
+
 	block->header &= ~DRM_BUDDY_HEADER_STATE;
 	block->header |= DRM_BUDDY_FREE;
 
-	rbtree_insert(mm, block);
+	tree = get_tree_for_block(block);
+
+	rbtree_insert(mm, block, tree);
 }
 
 static void mark_split(struct drm_buddy *mm,
@@ -238,6 +292,7 @@ static int __force_merge(struct drm_buddy *mm,
 			 u64 end,
 			 unsigned int min_order)
 {
+	enum free_tree tree;
 	unsigned int order;
 	int i;
 
@@ -247,50 +302,49 @@ static int __force_merge(struct drm_buddy *mm,
 	if (min_order > mm->max_order)
 		return -EINVAL;
 
-	for (i = min_order - 1; i >= 0; i--) {
-		struct drm_buddy_block *block, *prev_block, *first_block;
-
-		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
+	for_each_free_tree(tree) {
+		for (i = min_order - 1; i >= 0; i--) {
+			struct rb_root *root = get_root(mm, i, tree);
+			struct drm_buddy_block *block, *prev_block;
 
-		for_each_rb_free_block_reverse_safe(block, prev_block, &mm->free_tree[i], rb) {
-			struct drm_buddy_block *buddy;
-			u64 block_start, block_end;
+			for_each_rb_free_block_reverse_safe(block, prev_block, root, rb) {
+				struct drm_buddy_block *buddy;
+				u64 block_start, block_end;
 
-			if (!block->parent)
-				continue;
+				if (!block->parent)
+					continue;
 
-			block_start = drm_buddy_block_offset(block);
-			block_end = block_start + drm_buddy_block_size(mm, block) - 1;
+				block_start = drm_buddy_block_offset(block);
+				block_end = block_start + drm_buddy_block_size(mm, block) - 1;
 
-			if (!contains(start, end, block_start, block_end))
-				continue;
+				if (!contains(start, end, block_start, block_end))
+					continue;
 
-			buddy = __get_buddy(block);
-			if (!drm_buddy_block_is_free(buddy))
-				continue;
+				buddy = __get_buddy(block);
+				if (!drm_buddy_block_is_free(buddy))
+					continue;
 
-			WARN_ON(drm_buddy_block_is_clear(block) ==
-				drm_buddy_block_is_clear(buddy));
+				WARN_ON(drm_buddy_block_is_clear(block) ==
+					drm_buddy_block_is_clear(buddy));
 
-			/*
-			 * If the prev block is same as buddy, don't access the
-			 * block in the next iteration as we would free the
-			 * buddy block as part of the free function.
-			 */
-			if (prev_block && prev_block == buddy) {
-				if (prev_block != first_block)
-					prev_block = rb_entry(rb_prev(&prev_block->rb),
-							      struct drm_buddy_block,
-							      rb);
-			}
+				/*
+				 * If the prev block is same as buddy, don't access the
+				 * block in the next iteration as we would free the
+				 * buddy block as part of the free function.
+				 */
+				if (prev_block && prev_block == buddy) {
+					if (prev_block != rbtree_first_free_block(root))
+						prev_block = rbtree_prev_free_block(&prev_block->rb);
+				}
 
-			rbtree_remove(mm, block);
-			if (drm_buddy_block_is_clear(block))
-				mm->clear_avail -= drm_buddy_block_size(mm, block);
+				rbtree_remove(mm, block);
+				if (drm_buddy_block_is_clear(block))
+					mm->clear_avail -= drm_buddy_block_size(mm, block);
 
-			order = __drm_buddy_free(mm, block, true);
-			if (order >= min_order)
-				return 0;
+				order = __drm_buddy_free(mm, block, true);
+				if (order >= min_order)
+					return 0;
+			}
 		}
 	}
 
@@ -311,7 +365,7 @@ static int __force_merge(struct drm_buddy *mm,
  */
 int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 {
-	unsigned int i;
+	unsigned int i, j;
 	u64 offset;
 
 	if (size < chunk_size)
@@ -333,14 +387,16 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
 	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
 
-	mm->free_tree = kmalloc_array(mm->max_order + 1,
-				      sizeof(struct rb_root),
-				      GFP_KERNEL);
-	if (!mm->free_tree)
-		return -ENOMEM;
+	for (i = 0; i < MAX_FREE_TREES; i++) {
+		mm->free_trees[i] = kmalloc_array(mm->max_order + 1,
+						  sizeof(struct rb_root),
+						  GFP_KERNEL);
+		if (!mm->free_trees[i])
+			goto out_free_tree;
 
-	for (i = 0; i <= mm->max_order; ++i)
-		mm->free_tree[i] = RB_ROOT;
+		for (j = 0; j <= mm->max_order; ++j)
+			mm->free_trees[i][j] = RB_ROOT;
+	}
 
 	mm->n_roots = hweight64(size);
 
@@ -388,7 +444,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 		drm_block_free(mm, mm->roots[i]);
 	kfree(mm->roots);
 out_free_tree:
-	kfree(mm->free_tree);
+	while (i--)
+		kfree(mm->free_trees[i]);
 	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_buddy_init);
@@ -424,8 +481,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	WARN_ON(mm->avail != mm->size);
 
+	for (i = 0; i < MAX_FREE_TREES; i++)
+		kfree(mm->free_trees[i]);
 	kfree(mm->roots);
-	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -449,15 +507,15 @@ static int split_block(struct drm_buddy *mm,
 		return -ENOMEM;
 	}
 
-	mark_free(mm, block->left);
-	mark_free(mm, block->right);
-
 	if (drm_buddy_block_is_clear(block)) {
 		mark_cleared(block->left);
 		mark_cleared(block->right);
 		clear_reset(block);
 	}
 
+	mark_free(mm, block->left);
+	mark_free(mm, block->right);
+
 	mark_split(mm, block);
 
 	return 0;
@@ -491,6 +549,7 @@ EXPORT_SYMBOL(drm_get_buddy);
  */
 void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 {
+	enum free_tree src_tree, dst_tree;
 	u64 root_size, size, start;
 	unsigned int order;
 	int i;
@@ -505,19 +564,24 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 		size -= root_size;
 	}
 
+	src_tree = is_clear ? DIRTY_TREE : CLEAR_TREE;
+	dst_tree = is_clear ? CLEAR_TREE : DIRTY_TREE;
+
 	for (i = 0; i <= mm->max_order; ++i) {
+		struct rb_root *root = get_root(mm, order, src_tree);
 		struct drm_buddy_block *block;
 
-		for_each_rb_free_block_reverse(block, &mm->free_tree[i], rb) {
-			if (is_clear != drm_buddy_block_is_clear(block)) {
-				if (is_clear) {
-					mark_cleared(block);
-					mm->clear_avail += drm_buddy_block_size(mm, block);
-				} else {
-					clear_reset(block);
-					mm->clear_avail -= drm_buddy_block_size(mm, block);
-				}
+		for_each_rb_free_block_reverse(block, root, rb) {
+			rbtree_remove(mm, block);
+			if (is_clear) {
+				mark_cleared(block);
+				mm->clear_avail += drm_buddy_block_size(mm, block);
+			} else {
+				clear_reset(block);
+				mm->clear_avail -= drm_buddy_block_size(mm, block);
 			}
+
+			rbtree_insert(mm, block, dst_tree);
 		}
 	}
 }
@@ -707,26 +771,22 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
 }
 
 static struct drm_buddy_block *
-get_maxblock(struct drm_buddy *mm, unsigned int order,
-	     unsigned long flags)
+get_maxblock(struct drm_buddy *mm,
+	     unsigned int order,
+	     enum free_tree tree)
 {
 	struct drm_buddy_block *max_block = NULL, *block = NULL;
+	struct rb_root *root;
 	unsigned int i;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		struct drm_buddy_block *tmp_block;
-
-		for_each_rb_free_block_reverse(tmp_block, &mm->free_tree[i], rb) {
-			if (block_incompatible(tmp_block, flags))
+		root = get_root(mm, i, tree);
+		if (!rbtree_is_empty(root)) {
+			block = rbtree_last_free_block(root);
+			if (!block)
 				continue;
-
-			block = tmp_block;
-			break;
 		}
 
-		if (!block)
-			continue;
-
 		if (!max_block) {
 			max_block = block;
 			continue;
@@ -747,36 +807,38 @@ alloc_from_freetree(struct drm_buddy *mm,
 		    unsigned long flags)
 {
 	struct drm_buddy_block *block = NULL;
+	struct rb_root *root;
+	enum free_tree tree;
 	unsigned int tmp;
 	int err;
 
+	tree = get_tree_for_flags(flags);
+
 	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
-		block = get_maxblock(mm, order, flags);
+		block = get_maxblock(mm, order, tree);
 		if (block)
 			/* Store the obtained block order */
 			tmp = drm_buddy_block_order(block);
 	} else {
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
-			struct drm_buddy_block *tmp_block;
-
-			for_each_rb_free_block_reverse(tmp_block, &mm->free_tree[tmp], rb) {
-				if (block_incompatible(tmp_block, flags))
-					continue;
-
-				block = tmp_block;
-				break;
+			/* Get RB tree root for this order and tree */
+			root = get_root(mm, tmp, tree);
+			if (!rbtree_is_empty(root)) {
+				block = rbtree_last_free_block(root);
+				if (block)
+					break;
 			}
-
-			if (block)
-				break;
 		}
 	}
 
 	if (!block) {
-		/* Fallback method */
+		/* Try allocating from the other tree */
+		tree = (tree == CLEAR_TREE) ? DIRTY_TREE : CLEAR_TREE;
+
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
-			if (!rbtree_is_empty(mm, tmp)) {
-				block = rbtree_last_entry(mm, tmp);
+			root = get_root(mm, tmp, tree);
+			if (!rbtree_is_empty(root)) {
+				block = rbtree_last_free_block(root);
 				if (block)
 					break;
 			}
@@ -923,6 +985,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
 	LIST_HEAD(blocks_lhs);
+	enum free_tree tree;
 	unsigned long pages;
 	unsigned int order;
 	u64 modify_size;
@@ -934,34 +997,39 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	if (order == 0)
 		return -ENOSPC;
 
-	if (rbtree_is_empty(mm, order))
+	if (rbtree_is_empty(get_root(mm, order, CLEAR_TREE)) &&
+	    rbtree_is_empty(get_root(mm, order, DIRTY_TREE)))
 		return -ENOSPC;
 
-	for_each_rb_free_block_reverse(block, &mm->free_tree[order], rb) {
-		/* Allocate blocks traversing RHS */
-		rhs_offset = drm_buddy_block_offset(block);
-		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
-					       &filled, blocks);
-		if (!err || err != -ENOSPC)
-			return err;
-
-		lhs_size = max((size - filled), min_block_size);
-		if (!IS_ALIGNED(lhs_size, min_block_size))
-			lhs_size = round_up(lhs_size, min_block_size);
-
-		/* Allocate blocks traversing LHS */
-		lhs_offset = drm_buddy_block_offset(block) - lhs_size;
-		err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
-					       NULL, &blocks_lhs);
-		if (!err) {
-			list_splice(&blocks_lhs, blocks);
-			return 0;
-		} else if (err != -ENOSPC) {
+	for_each_free_tree(tree) {
+		struct rb_root *root = get_root(mm, order, tree);
+
+		for_each_rb_free_block_reverse(block, root, rb) {
+			/* Allocate blocks traversing RHS */
+			rhs_offset = drm_buddy_block_offset(block);
+			err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
+						       &filled, blocks);
+			if (!err || err != -ENOSPC)
+				return err;
+
+			lhs_size = max((size - filled), min_block_size);
+			if (!IS_ALIGNED(lhs_size, min_block_size))
+				lhs_size = round_up(lhs_size, min_block_size);
+
+			/* Allocate blocks traversing LHS */
+			lhs_offset = drm_buddy_block_offset(block) - lhs_size;
+			err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
+						       NULL, &blocks_lhs);
+			if (!err) {
+				list_splice(&blocks_lhs, blocks);
+				return 0;
+			} else if (err != -ENOSPC) {
+				drm_buddy_free_list_internal(mm, blocks);
+				return err;
+			}
+			/* Free blocks for the next iteration */
 			drm_buddy_free_list_internal(mm, blocks);
-			return err;
 		}
-		/* Free blocks for the next iteration */
-		drm_buddy_free_list_internal(mm, blocks);
 	}
 
 	return -ENOSPC;
@@ -1266,6 +1334,7 @@ EXPORT_SYMBOL(drm_buddy_block_print);
  */
 void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 {
+	enum free_tree tree;
 	int order;
 
 	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
@@ -1273,11 +1342,16 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 
 	for (order = mm->max_order; order >= 0; order--) {
 		struct drm_buddy_block *block;
+		struct rb_root *root;
 		u64 count = 0, free;
 
-		for_each_rb_free_block(block, &mm->free_tree[order], rb) {
-			BUG_ON(!drm_buddy_block_is_free(block));
-			count++;
+		for_each_free_tree(tree) {
+			root = get_root(mm, order, tree);
+
+			for_each_rb_free_block(block, root, rb) {
+				BUG_ON(!drm_buddy_block_is_free(block));
+				count++;
+			}
 		}
 
 		drm_printf(p, "order-%2d ", order);
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 091823592034..2fc1cc7b78bf 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -14,6 +14,12 @@
 
 #include <drm/drm_print.h>
 
+enum free_tree {
+	CLEAR_TREE = 0,
+	DIRTY_TREE,
+	MAX_FREE_TREES,
+};
+
 #define range_overflows(start, size, max) ({ \
 	typeof(start) start__ = (start); \
 	typeof(size) size__ = (size); \
@@ -73,7 +79,7 @@ struct drm_buddy_block {
  */
 struct drm_buddy {
 	/* Maintain a free list for each order. */
-	struct rb_root *free_tree;
+	struct rb_root *free_trees[MAX_FREE_TREES];
 
 	/*
 	 * Maintain explicit binary tree(s) to track the allocation of the
-- 
2.34.1

