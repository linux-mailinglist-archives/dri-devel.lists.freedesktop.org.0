Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F12B4A90E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7B310E67A;
	Tue,  9 Sep 2025 09:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2AZZ6P1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E05010E67D;
 Tue,  9 Sep 2025 09:57:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZP9rL4OUErxOSH9cXm5aD1eol4hJmhORS3ZSdDEHV2423+cyroal8KqaY9kvoY6qv1tEmD4qrkpp58D55PeQ8Y6foijRNcmDnVho6d1LmVbA2px9DdUWJwWiu5VegZOZOetAzhV5PXtStSoiAV/seRe32ORJAnXcFti+UuXp6tyuw24QHW9JM4IrdSBNXUTQrAPRjC1isN07cL0KzaIPs28MuwIVl4xAq9VsM8qVhXV7+5f8Ah9HroE7+F04yeNiBas43oagPDTktJLUAoxGSYCzawlCD4as1HnYCS3mniUDISQpYn6bxQ9vYucnwDhym9+4hgtgUSce7DKImMW0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SlsnakA1yNYFiJ/elz3TLVT4oubBIzaVpi21yzc8cU=;
 b=bN1dnLsyDeNj3F65vNJsXhobp7bQI33FD1XCoBCt+IgSq7YRVO0F1jwXFp86vxzJrrwQjBCav4sJyZ2IFLhQ7a91ZRgiLFB5S1ic+3zjWl3lwmMMjEeGLOSma0uWBbDbVOf4/62hItT5L+g/75LH3ZRH+gUa9mtSgPZWeichIqcO1PPerrLMA+VQkAcfB2qI/Y/6pOn8BSjGxuwlKatK8Vl6NGZ/mMe4csNAY4uGFiz7EyRdQ9ElVCjTao0gPS+ie1hZSCzGrACcAcWt/VhWZyO+Bxf6lWCxl+vAngoOx9bGbwwX0qc5JBjBDmMlMaBN3FMPPbs3ueVc3xC0ASSy1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SlsnakA1yNYFiJ/elz3TLVT4oubBIzaVpi21yzc8cU=;
 b=2AZZ6P1/TZZsn535AKYuENV5b9bqsHUamutUggV3UGtdjlwZGVyk5MtY2FmTKF/Tnu63gPdAdZ/AXHCKrhjti6efk6031gqlR2weh+8EaPyiy/6Yd4mSBdFdBzrB0llSZUmYfewpBZbXFnTjkKJnNxshOeZFzM9MGoJ9/XH3tHw=
Received: from SN6PR04CA0073.namprd04.prod.outlook.com (2603:10b6:805:f2::14)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 09:57:15 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:805:f2:cafe::b9) by SN6PR04CA0073.outlook.office365.com
 (2603:10b6:805:f2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Tue,
 9 Sep 2025 09:57:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 09:57:15 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Sep
 2025 02:57:09 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <jani.nikula@linux.intel.com>, <peterz@infradead.org>,
 <samuel.pitoiset@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v5 2/3] drm/buddy: Separate clear and dirty free block trees
Date: Tue, 9 Sep 2025 15:26:53 +0530
Message-ID: <20250909095653.489851-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 087c4e51-8383-4c55-3814-08ddef874174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oqmE9+RGHXp34aMWsC6j0Sg8a0gkBUCk+eSs85wFoJPYZaJ0KaUlp41PohDe?=
 =?us-ascii?Q?oSmpDxOe7vLUGaedH5H/GMA/7q+5rCad2Klxmq5+tLhI2CZFWT0EyhU5xzOC?=
 =?us-ascii?Q?Qaoiz44ewi3SG213VeviUfnh/iWfShbbUaDjTyeY0SniWiXUAJ88mHdiJi3d?=
 =?us-ascii?Q?P9R/S+MP3Z3Lh5XxdJhyyu2uACwgwMsHaZANbJGuWdphkJ3OAWLbo/8qhHeV?=
 =?us-ascii?Q?UnHAWC4tN+7lJW+It5lRLKS7YEEj/OIntwht66cj4f0mejZv+MUdYIWiupAM?=
 =?us-ascii?Q?hyYuIF4yjWQgZ4eCQyhTEci4LRc+raBiaKrzzjd7jQm9X491E12K7Mcn3dOR?=
 =?us-ascii?Q?ylOJWBeG1USGKORVKUWs6WMOkVGKc0B4hOPGiLBfKaSwCJQh0PFuu1D8UJhh?=
 =?us-ascii?Q?u64RI3pfdMJFVQXiJsJEAnmKNdBUDK45HieJtWDls/Ko7OkZtbEXbMS9yqeG?=
 =?us-ascii?Q?sdh0aZbzyEDnCxkhGmKLaIF4Dp7onPTiKJ1y/2m/POjRplGx2/nmQRDqBiGZ?=
 =?us-ascii?Q?XuKM7gcSZBjNpcw2gEPnTpScp9SBSSxHCa2JPp7Or8QrNCqM0ltQpUks4mC5?=
 =?us-ascii?Q?0PMyTbq44ftd6C8I/rZj+Bx1TCib0Sj4P78rGY2gycIXE2JSkWrj8x/3ryIf?=
 =?us-ascii?Q?L4XS3VEIjV3B0UB7tqHzSxKI5V/WLw5kx6W40JvWDmuavSb2HrrDXKNKNrDq?=
 =?us-ascii?Q?5Evshd+ZspFi+NJzAZdIEULxoqeBO+l4AfeOIAp92YHIfKX61eT3easv4cZg?=
 =?us-ascii?Q?eB8nsBl/+g75yC5qjGwtdFJ2QYJUsuomkcFSRei6TQQndiKtiQ2R5+JuC9nO?=
 =?us-ascii?Q?/aos2NtRvjbepmhTLxaxMl6nH6abrvEl2rFEcuoJW0D7d0Fm2dMdFnQbvMCp?=
 =?us-ascii?Q?Kgbd0QOcZty4GM56iy4YZOrQibh5/b1UVeUxcb+U8rHk4mDOqn1rkGDyjXNi?=
 =?us-ascii?Q?IearsIZYwLQIcQY4QL2mIRWR6WOVjBXArDKNVAkrpsrAC92IYof0RoKtBn/1?=
 =?us-ascii?Q?kQrheKORyMEVnGjcJVU+ZAZvRTwKRMM96tlqhkB1G5dgGFqiiywqhwOvi0bA?=
 =?us-ascii?Q?ClKhVxuz5MfdpJhNXDwIXc9akMEDy4XGU6GxjMHm2J4vGXtU+ElqnnwNtaZU?=
 =?us-ascii?Q?dRPGwLEf/jFXoDnhtPCgkr+YKJS5vsKRSmWEqu1djUqpZogiWwymSHQyBaUT?=
 =?us-ascii?Q?4qsuiDUe8AkLf4nZ0Ucn+/i4JHV86L5EbOSfNSDSkSKiHFsMQfkoA/ntrJBE?=
 =?us-ascii?Q?pvEsd7ae82x0Y/+3Pumzrm5M15BlKw+Yl6h/mB1Q8LFgtv9XAMUqqrcCz64K?=
 =?us-ascii?Q?TKRzJ7zk9rcw57jaCWSgwN7ZWxxz6839X+nHTDlj1l9KcItURDG1/oPaaasD?=
 =?us-ascii?Q?JzEzgxkb++nJ5iSXy2J7KJc5HAyP7Bcs64e8rG1jTzfHVx6JV0wrBesv+5x4?=
 =?us-ascii?Q?dFusE3Ex5rqMmgevlFB+O3vWiOxPZZJAjXcSnIcSAx5jTWAbCAdQAw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 09:57:15.3631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 087c4e51-8383-4c55-3814-08ddef874174
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554
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

v4:
  - A bug was reported by Intel CI and it is fixed by
    Matthew Auld.
  - Replace the get_root function with
    &mm->free_trees[tree][order] (Matthew)
  - Remove the unnecessary rbtree_is_empty() check (Matthew)
  - Remove the unnecessary get_tree_for_flags() function.
  - Rename get_tree_for_block() name with get_block_tree() for more
    clarity.

v5(Jani Nikula):
  - Don't use static inline in .c files.
  - enum free_tree and enumerator names are quite generic for a header
    and usage and the whole enum should be an implementation detail.

Cc: stable@vger.kernel.org
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
---
 drivers/gpu/drm/drm_buddy.c | 336 +++++++++++++++++++++---------------
 include/drm/drm_buddy.h     |   2 +-
 2 files changed, 201 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 8b340f47f73d..4f96e2e17d08 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -12,8 +12,17 @@
 
 #include <drm/drm_buddy.h>
 
+enum drm_buddy_free_tree {
+	DRM_BUDDY_CLEAR_TREE = 0,
+	DRM_BUDDY_DIRTY_TREE,
+	DRM_BUDDY_MAX_FREE_TREES,
+};
+
 static struct kmem_cache *slab_blocks;
 
+#define for_each_free_tree(tree) \
+	for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)
+
 static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 					       struct drm_buddy_block *parent,
 					       unsigned int order,
@@ -43,22 +52,61 @@ static void drm_block_free(struct drm_buddy *mm,
 	kmem_cache_free(slab_blocks, block);
 }
 
+static enum drm_buddy_free_tree
+get_block_tree(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_is_clear(block) ?
+	       DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
+}
+
+static struct drm_buddy_block *
+rbtree_get_free_block(struct rb_node *node)
+{
+	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
+}
+
+static struct drm_buddy_block *
+rbtree_prev_free_block(struct rb_node *node)
+{
+	return rbtree_get_free_block(rb_prev(node));
+}
+
+static struct drm_buddy_block *
+rbtree_first_free_block(struct rb_root *root)
+{
+	return rbtree_get_free_block(rb_first(root));
+}
+
+static struct drm_buddy_block *
+rbtree_last_free_block(struct rb_root *root)
+{
+	return rbtree_get_free_block(rb_last(root));
+}
+
+static bool rbtree_is_empty(struct rb_root *root)
+{
+	return RB_EMPTY_ROOT(root);
+}
+
 static void rbtree_insert(struct drm_buddy *mm,
-			  struct drm_buddy_block *block)
+			  struct drm_buddy_block *block,
+			  enum drm_buddy_free_tree tree)
 {
-	struct rb_root *root = &mm->free_tree[drm_buddy_block_order(block)];
-	struct rb_node **link = &root->rb_node;
-	struct rb_node *parent = NULL;
+	struct rb_node **link, *parent = NULL;
 	struct drm_buddy_block *node;
-	u64 offset;
+	struct rb_root *root;
+	unsigned int order;
 
-	offset = drm_buddy_block_offset(block);
+	order = drm_buddy_block_order(block);
+
+	root = &mm->free_trees[tree][order];
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
@@ -71,27 +119,17 @@ static void rbtree_insert(struct drm_buddy *mm,
 static void rbtree_remove(struct drm_buddy *mm,
 			  struct drm_buddy_block *block)
 {
+	unsigned int order = drm_buddy_block_order(block);
 	struct rb_root *root;
+	enum drm_buddy_free_tree tree;
 
-	root = &mm->free_tree[drm_buddy_block_order(block)];
-	rb_erase(&block->rb, root);
+	tree = get_block_tree(block);
+	root = &mm->free_trees[tree][order];
 
+	rb_erase(&block->rb, root);
 	RB_CLEAR_NODE(&block->rb);
 }
 
-static struct drm_buddy_block *
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
@@ -114,10 +152,13 @@ static void mark_allocated(struct drm_buddy *mm,
 static void mark_free(struct drm_buddy *mm,
 		      struct drm_buddy_block *block)
 {
+	enum drm_buddy_free_tree tree;
+
 	block->header &= ~DRM_BUDDY_HEADER_STATE;
 	block->header |= DRM_BUDDY_FREE;
 
-	rbtree_insert(mm, block);
+	tree = get_block_tree(block);
+	rbtree_insert(mm, block, tree);
 }
 
 static void mark_split(struct drm_buddy *mm,
@@ -203,6 +244,7 @@ static int __force_merge(struct drm_buddy *mm,
 			 u64 end,
 			 unsigned int min_order)
 {
+	enum drm_buddy_free_tree tree;
 	unsigned int order;
 	int i;
 
@@ -212,50 +254,49 @@ static int __force_merge(struct drm_buddy *mm,
 	if (min_order > mm->max_order)
 		return -EINVAL;
 
-	for (i = min_order - 1; i >= 0; i--) {
-		struct drm_buddy_block *block, *prev_block, *first_block;
-
-		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
+	for_each_free_tree(tree) {
+		for (i = min_order - 1; i >= 0; i--) {
+			struct rb_root *root = &mm->free_trees[tree][i];
+			struct drm_buddy_block *block, *prev_block;
 
-		rbtree_reverse_for_each_entry_safe(block, prev_block, &mm->free_tree[i], rb) {
-			struct drm_buddy_block *buddy;
-			u64 block_start, block_end;
+			rbtree_reverse_for_each_entry_safe(block, prev_block, root, rb) {
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
 
@@ -276,7 +317,7 @@ static int __force_merge(struct drm_buddy *mm,
  */
 int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 {
-	unsigned int i;
+	unsigned int i, j;
 	u64 offset;
 
 	if (size < chunk_size)
@@ -298,14 +339,22 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
 	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
 
-	mm->free_tree = kmalloc_array(mm->max_order + 1,
-				      sizeof(struct rb_root),
-				      GFP_KERNEL);
-	if (!mm->free_tree)
+	mm->free_trees = kmalloc_array(DRM_BUDDY_MAX_FREE_TREES,
+				       sizeof(*mm->free_trees),
+				       GFP_KERNEL);
+	if (!mm->free_trees)
 		return -ENOMEM;
 
-	for (i = 0; i <= mm->max_order; ++i)
-		mm->free_tree[i] = RB_ROOT;
+	for (i = 0; i < DRM_BUDDY_MAX_FREE_TREES; i++) {
+		mm->free_trees[i] = kmalloc_array(mm->max_order + 1,
+						  sizeof(struct rb_root),
+						  GFP_KERNEL);
+		if (!mm->free_trees[i])
+			goto out_free_tree;
+
+		for (j = 0; j <= mm->max_order; ++j)
+			mm->free_trees[i][j] = RB_ROOT;
+	}
 
 	mm->n_roots = hweight64(size);
 
@@ -353,7 +402,9 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 		drm_block_free(mm, mm->roots[i]);
 	kfree(mm->roots);
 out_free_tree:
-	kfree(mm->free_tree);
+	while (i--)
+		kfree(mm->free_trees[i]);
+	kfree(mm->free_trees);
 	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_buddy_init);
@@ -389,8 +440,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	WARN_ON(mm->avail != mm->size);
 
+	for (i = 0; i < DRM_BUDDY_MAX_FREE_TREES; i++)
+		kfree(mm->free_trees[i]);
 	kfree(mm->roots);
-	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -414,8 +466,7 @@ static int split_block(struct drm_buddy *mm,
 		return -ENOMEM;
 	}
 
-	mark_free(mm, block->left);
-	mark_free(mm, block->right);
+	mark_split(mm, block);
 
 	if (drm_buddy_block_is_clear(block)) {
 		mark_cleared(block->left);
@@ -423,7 +474,8 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(mm, block);
+	mark_free(mm, block->left);
+	mark_free(mm, block->right);
 
 	return 0;
 }
@@ -456,6 +508,7 @@ EXPORT_SYMBOL(drm_get_buddy);
  */
 void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 {
+	enum drm_buddy_free_tree src_tree, dst_tree;
 	u64 root_size, size, start;
 	unsigned int order;
 	int i;
@@ -470,19 +523,24 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 		size -= root_size;
 	}
 
+	src_tree = is_clear ? DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
+	dst_tree = is_clear ? DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
+
 	for (i = 0; i <= mm->max_order; ++i) {
+		struct rb_root *root = &mm->free_trees[src_tree][i];
 		struct drm_buddy_block *block;
 
-		rbtree_reverse_for_each_entry(block, &mm->free_tree[i], rb) {
-			if (is_clear != drm_buddy_block_is_clear(block)) {
-				if (is_clear) {
-					mark_cleared(block);
-					mm->clear_avail += drm_buddy_block_size(mm, block);
-				} else {
-					clear_reset(block);
-					mm->clear_avail -= drm_buddy_block_size(mm, block);
-				}
+		rbtree_reverse_for_each_entry(block, root, rb) {
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
@@ -672,23 +730,17 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
 }
 
 static struct drm_buddy_block *
-get_maxblock(struct drm_buddy *mm, unsigned int order,
-	     unsigned long flags)
+get_maxblock(struct drm_buddy *mm,
+	     unsigned int order,
+	     enum drm_buddy_free_tree tree)
 {
 	struct drm_buddy_block *max_block = NULL, *block = NULL;
+	struct rb_root *root;
 	unsigned int i;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		struct drm_buddy_block *tmp_block;
-
-		rbtree_reverse_for_each_entry(tmp_block, &mm->free_tree[i], rb) {
-			if (block_incompatible(tmp_block, flags))
-				continue;
-
-			block = tmp_block;
-			break;
-		}
-
+		root = &mm->free_trees[tree][i];
+		block = rbtree_last_free_block(root);
 		if (!block)
 			continue;
 
@@ -712,39 +764,39 @@ alloc_from_freetree(struct drm_buddy *mm,
 		    unsigned long flags)
 {
 	struct drm_buddy_block *block = NULL;
+	struct rb_root *root;
+	enum drm_buddy_free_tree tree;
 	unsigned int tmp;
 	int err;
 
+	tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ?
+		DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
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
-			rbtree_reverse_for_each_entry(tmp_block, &mm->free_tree[tmp], rb) {
-				if (block_incompatible(tmp_block, flags))
-					continue;
-
-				block = tmp_block;
-				break;
-			}
-
+			/* Get RB tree root for this order and tree */
+			root = &mm->free_trees[tree][tmp];
+			block = rbtree_last_free_block(root);
 			if (block)
 				break;
 		}
 	}
 
 	if (!block) {
-		/* Fallback method */
+		/* Try allocating from the other tree */
+		tree = (tree == DRM_BUDDY_CLEAR_TREE) ?
+			DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
+
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
-			if (!rbtree_is_empty(mm, tmp)) {
-				block = rbtree_last_entry(mm, tmp);
-				if (block)
-					break;
-			}
+			root = &mm->free_trees[tree][tmp];
+			block = rbtree_last_free_block(root);
+			if (block)
+				break;
 		}
 
 		if (!block)
@@ -888,6 +940,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
 	LIST_HEAD(blocks_lhs);
+	enum drm_buddy_free_tree tree;
 	unsigned long pages;
 	unsigned int order;
 	u64 modify_size;
@@ -899,34 +952,39 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	if (order == 0)
 		return -ENOSPC;
 
-	if (rbtree_is_empty(mm, order))
+	if (rbtree_is_empty(&mm->free_trees[DRM_BUDDY_CLEAR_TREE][order]) &&
+	    rbtree_is_empty(&mm->free_trees[DRM_BUDDY_DIRTY_TREE][order]))
 		return -ENOSPC;
 
-	rbtree_reverse_for_each_entry(block, &mm->free_tree[order], rb) {
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
+		struct rb_root *root = &mm->free_trees[tree][order];
+
+		rbtree_reverse_for_each_entry(block, root, rb) {
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
@@ -1231,6 +1289,7 @@ EXPORT_SYMBOL(drm_buddy_block_print);
  */
 void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 {
+	enum drm_buddy_free_tree tree;
 	int order;
 
 	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
@@ -1238,11 +1297,16 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 
 	for (order = mm->max_order; order >= 0; order--) {
 		struct drm_buddy_block *block;
+		struct rb_root *root;
 		u64 count = 0, free;
 
-		rbtree_for_each_entry(block, &mm->free_tree[order], rb) {
-			BUG_ON(!drm_buddy_block_is_free(block));
-			count++;
+		for_each_free_tree(tree) {
+			root = &mm->free_trees[tree][order];
+
+			rbtree_for_each_entry(block, root, rb) {
+				BUG_ON(!drm_buddy_block_is_free(block));
+				count++;
+			}
 		}
 
 		drm_printf(p, "order-%2d ", order);
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 091823592034..a2189a92bb7a 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -73,7 +73,7 @@ struct drm_buddy_block {
  */
 struct drm_buddy {
 	/* Maintain a free list for each order. */
-	struct rb_root *free_tree;
+	struct rb_root **free_trees;
 
 	/*
 	 * Maintain explicit binary tree(s) to track the allocation of the
-- 
2.34.1

