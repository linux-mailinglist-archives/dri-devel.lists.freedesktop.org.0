Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85A5B951FA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CDC10E5BD;
	Tue, 23 Sep 2025 09:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xB4oossn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4093010E5B4;
 Tue, 23 Sep 2025 09:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/sk1YvX25CjKG3rn943t0OhYQbwchSwMJppgVp+VmRHZvoLiw7OfjttUFQxJVaoBxg3eFo69mvoHaN8w8JX0J/c8/8VN7rMdWMrG34Zwa1aiatJc+//vtM2NWdWphuxJAmgSEmLxqmW0PwmQ0oCWcN8QTPeIdb+pepZJzGsg5xiUp5wxm2ccZ+7lagyLUfVrjM3v+xnBP6CkhYruzP3XoflgnZUn9bhcqrEQWVdmWfpf1rYib7H/0Kzz8NWuhFHIrPy1UY7oUEJaG8brmsy0woakCVrN9JEsMweotXctkfnXh8jzak+PrpI//GT09/PO/0Q9zA0xVQnbkMNW++9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwvALHu1oGxKMrpmkV2lQm97sLEcUuefhLPyLZbCi8A=;
 b=MxkRVY0vYSo6Rhli1D7E3I58tyWmUt5LhbfvpVSOlRLXneCgdnGOCPqGGk9Jp1ry07N0s9t2C0ASDsPOrmAYzp9ewLhzakV1QRX03EOJ41FtcYuWp5sAzIydB3PLVeHiDscxV4NVnC/Mnkxi+KFRxdu0NltS6ny2P39+axLK4k/4BRcfhq46mzC3YC4jprcwoIU5iQwdxCdTqO0rnxb/LB5IupbTYG4Heyles1UoDG1r7sRLpsymevPqSq93d2RjkndzFXGcul7kwSl6qrjQuxizNon8esloCr2fcxI1Gc5waLgHDCHrax7XppTJ5FdgwyC3EnBO9qitZ06iqXz1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwvALHu1oGxKMrpmkV2lQm97sLEcUuefhLPyLZbCi8A=;
 b=xB4oossni4oLPv50M6KjNZ8Wlm0l3GYmUZQPzqxK7uIR2MrL3Bjggk5Fgxj3sY8T/QbPgwVBu/QiEe2F0daZqxRdmd+Wf4bto52lM0FRlH0a4GJrRnfYTZ6ZD5droWWdkSHXH7TMlPkAPtA2HQOSFpzXhrVi425Y62ccMsC8P4A=
Received: from BN0PR03CA0054.namprd03.prod.outlook.com (2603:10b6:408:e7::29)
 by CH3PR12MB9170.namprd12.prod.outlook.com (2603:10b6:610:199::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 09:04:48 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::9d) by BN0PR03CA0054.outlook.office365.com
 (2603:10b6:408:e7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Tue,
 23 Sep 2025 09:04:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 09:04:48 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 23 Sep
 2025 02:04:37 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <jani.nikula@linux.intel.com>,
 <peterz@infradead.org>, <samuel.pitoiset@gmail.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v7 2/3] drm/buddy: Separate clear and dirty free block trees
Date: Tue, 23 Sep 2025 14:32:41 +0530
Message-ID: <20250923090242.60649-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|CH3PR12MB9170:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e7cd75-011d-4ca4-b22c-08ddfa803f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uG5QJDBDuZIU4MEDneHKnpZKJuc0ihvcXmcSKVaE5lrK4abySaYtd71JWFI0?=
 =?us-ascii?Q?uHrsoOTVhxS2ypsnTjrP96wFsZS9VftqmsgKoMSkjAYVVlAH0+Uo4O+Vt3Si?=
 =?us-ascii?Q?u9Yd8mj9g6q26d9Kw8Zzn0KsM5MYhrUEz4tCqvXHcbFGstVycG45CrWsBRjn?=
 =?us-ascii?Q?NCfZurrZmmKvlQ4eNRhewRQhsHkDXClxocywC1b2x08O4KGZk1HbS+axcAxr?=
 =?us-ascii?Q?o5fJpZpULvuT+4MJyF0robIgFtGKBBoUfQop93r8SjYnQZkVmudld9C6Hm4w?=
 =?us-ascii?Q?hgCKZoR1alvGTyDiSGUTS5StKNm5JkVKTRsaUBa/gjfg+0qd08Fkm5g9e5YJ?=
 =?us-ascii?Q?EIMfYaom9EOlLWLUduv38PU3tQOyOnGIXOMGHwYN6Pa7EfUHUdXesbVAGNBd?=
 =?us-ascii?Q?ZNapiLHApangTtukH+ExgYfKLfLofUpiInT/BjU0fGVg6sAn+qr86djgIAGe?=
 =?us-ascii?Q?V2Uw7Bsb47vpCbr1OnDuclh27wCPb5+NNfQkpJFxXF3EuY/9suy13Tmer4+R?=
 =?us-ascii?Q?bTAW/pgG5fPDYVnanQFDCjt4meLjQ0QkcEnxVfdmR6BN2aMRoRZi5zn1yMic?=
 =?us-ascii?Q?p6LB//TXIaOosdx9ZkoTVRUnVFO5XVVo5KG+Xdpz3UKwF244qDhWphBv3tYo?=
 =?us-ascii?Q?bbkL/MAMiU//2arF+B2ynJlMDoXnllePGNx8vvo6gcyF4po3anL3Am4dxiNi?=
 =?us-ascii?Q?as4Gm7VA7HN+z8jTdohVBZICCJTGkTcYj2/ZZoNpBXUsWrjBFbFJ42E7cHnB?=
 =?us-ascii?Q?uK1YE5KlEDM6l/TUo/1A0c8X0IfgfPVN49WRcx/CJWZ0o8muHTga6PmiCxW/?=
 =?us-ascii?Q?6VryZw3VDMRpvNwQvbhWYlaNZ3aS0BJoxtweGt8HsKCQutewzxd3c+yl2JwS?=
 =?us-ascii?Q?lvahSzLuv6A8ATUwVvfqGDDNrPfCPkQ2mk8sioqJLQql4w8SHKkOJnp2tEgN?=
 =?us-ascii?Q?zk/Yl+NO+c8e7uSh31eHzIJ687gtYyTeXgsPxUjN3siIUmAxxNumUcvpdoya?=
 =?us-ascii?Q?nx5q/0hZ0RWz+726VwvPHM8vT3ba88SVDoFPvYVRVjZi9PDOhra1/RI63wTg?=
 =?us-ascii?Q?gaYSVHS8VaQD50pmorMTlYSXZAR5bf6E87/hKET2Z0+SXDyPJ5POse+S8vpU?=
 =?us-ascii?Q?O/YKv0dPSaygKZharW/G4k40pshtL+y1Pyh7O5KejTIxUhjcIl9m0lyQTiRr?=
 =?us-ascii?Q?P9aYE9sTF0fCzMUn29+hJ2smNpHPXz0jc6v5gHWiUIzRwkNQzir/VhEdq24N?=
 =?us-ascii?Q?kk4Y3OOrnFUpvkFGj7QNMtD/VgVy8W1wxpGiNXC4qCs/+AL+rYBr234pobhG?=
 =?us-ascii?Q?SZwNWG6Hw/NyxTCMkUe/EVmz7ol6gGBr5oXqDMK//sxmTP882hHgGIQqp0Jc?=
 =?us-ascii?Q?kt6yf1qxDi0EiJwJlfz/zK18f08cond7cO55rK1Bot1uOEp/wHNPAXH26333?=
 =?us-ascii?Q?xAO4NkPOM3k17mVdLb0H+b1ZqMOAT2rFo1dhEBVg0lHw9VcL9MCqcA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 09:04:48.3486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e7cd75-011d-4ca4-b22c-08ddfa803f75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9170
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

v6:
  - Rewrite the __force_merge() function using the rb_last() and rb_prev().

Cc: stable@vger.kernel.org
Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
---
 drivers/gpu/drm/drm_buddy.c | 321 ++++++++++++++++++++----------------
 include/drm/drm_buddy.h     |   2 +-
 2 files changed, 182 insertions(+), 141 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 67aa67229cc3..6e12a0b5d5e3 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -12,9 +12,16 @@
 
 #include <drm/drm_buddy.h>
 
+enum drm_buddy_free_tree {
+	DRM_BUDDY_CLEAR_TREE = 0,
+	DRM_BUDDY_DIRTY_TREE,
+	DRM_BUDDY_MAX_FREE_TREES,
+};
+
 static struct kmem_cache *slab_blocks;
 
-#define rbtree_get_free_block(node) rb_entry((node), struct drm_buddy_block, rb)
+#define for_each_free_tree(tree) \
+	for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)
 
 static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 					       struct drm_buddy_block *parent,
@@ -45,6 +52,30 @@ static void drm_block_free(struct drm_buddy *mm,
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
+rbtree_get_free_block(const struct rb_node *node)
+{
+	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
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
 static bool drm_buddy_block_offset_less(const struct drm_buddy_block *block,
 					const struct drm_buddy_block *node)
 {
@@ -59,37 +90,28 @@ static bool rbtree_block_offset_less(struct rb_node *block,
 }
 
 static void rbtree_insert(struct drm_buddy *mm,
-			  struct drm_buddy_block *block)
+			  struct drm_buddy_block *block,
+			  enum drm_buddy_free_tree tree)
 {
 	rb_add(&block->rb,
-	       &mm->free_tree[drm_buddy_block_order(block)],
+	       &mm->free_trees[tree][drm_buddy_block_order(block)],
 	       rbtree_block_offset_less);
 }
 
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
@@ -112,10 +134,13 @@ static void mark_allocated(struct drm_buddy *mm,
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
@@ -201,6 +226,7 @@ static int __force_merge(struct drm_buddy *mm,
 			 u64 end,
 			 unsigned int min_order)
 {
+	enum drm_buddy_free_tree tree;
 	unsigned int order;
 	int i;
 
@@ -210,45 +236,48 @@ static int __force_merge(struct drm_buddy *mm,
 	if (min_order > mm->max_order)
 		return -EINVAL;
 
-	for (i = min_order - 1; i >= 0; i--) {
-		struct rb_root *root = &mm->free_tree[i];
-		struct rb_node *iter;
+	for_each_free_tree(tree) {
+		for (i = min_order - 1; i >= 0; i--) {
+			struct rb_node *iter = rb_last(&mm->free_trees[tree][i]);
 
-		iter = rb_last(root);
-
-		while (iter) {
-			struct drm_buddy_block *block, *buddy;
-			u64 block_start, block_end;
+			while (iter) {
+				struct drm_buddy_block *block, *buddy;
+				u64 block_start, block_end;
 
-			block = rbtree_get_free_block(iter);
-			iter = rb_prev(iter);
+				block = rbtree_get_free_block(iter);
+				iter = rb_prev(iter);
 
-			if (!block || !block->parent)
-				continue;
+				if (!block || !block->parent)
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
 
-			if (iter == &buddy->rb)
-				iter = rb_prev(iter);
+				/*
+				 * Advance to the next node when the current node is the buddy,
+				 * as freeing the block will also remove its buddy from the tree.
+				 */
+				if (iter == &buddy->rb)
+					iter = rb_prev(iter);
 
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
 
@@ -269,7 +298,7 @@ static int __force_merge(struct drm_buddy *mm,
  */
 int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 {
-	unsigned int i;
+	unsigned int i, j;
 	u64 offset;
 
 	if (size < chunk_size)
@@ -291,14 +320,22 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
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
 
@@ -346,7 +383,9 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
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
@@ -382,8 +421,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	WARN_ON(mm->avail != mm->size);
 
+	for (i = 0; i < DRM_BUDDY_MAX_FREE_TREES; i++)
+		kfree(mm->free_trees[i]);
 	kfree(mm->roots);
-	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -407,8 +447,7 @@ static int split_block(struct drm_buddy *mm,
 		return -ENOMEM;
 	}
 
-	mark_free(mm, block->left);
-	mark_free(mm, block->right);
+	mark_split(mm, block);
 
 	if (drm_buddy_block_is_clear(block)) {
 		mark_cleared(block->left);
@@ -416,7 +455,8 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(mm, block);
+	mark_free(mm, block->left);
+	mark_free(mm, block->right);
 
 	return 0;
 }
@@ -449,6 +489,7 @@ EXPORT_SYMBOL(drm_get_buddy);
  */
 void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 {
+	enum drm_buddy_free_tree src_tree, dst_tree;
 	u64 root_size, size, start;
 	unsigned int order;
 	int i;
@@ -463,19 +504,24 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 		size -= root_size;
 	}
 
+	src_tree = is_clear ? DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
+	dst_tree = is_clear ? DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
+
 	for (i = 0; i <= mm->max_order; ++i) {
+		struct rb_root *root = &mm->free_trees[src_tree][i];
 		struct drm_buddy_block *block, *tmp;
 
-		rbtree_postorder_for_each_entry_safe(block, tmp, &mm->free_tree[i], rb) {
-			if (is_clear != drm_buddy_block_is_clear(block)) {
-				if (is_clear) {
-					mark_cleared(block);
-					mm->clear_avail += drm_buddy_block_size(mm, block);
-				} else {
-					clear_reset(block);
-					mm->clear_avail -= drm_buddy_block_size(mm, block);
-				}
+		rbtree_postorder_for_each_entry_safe(block, tmp, root, rb) {
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
@@ -665,27 +711,17 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
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
-		struct rb_node *iter = rb_last(&mm->free_tree[i]);
-		struct drm_buddy_block *tmp_block;
-
-		while (iter) {
-			tmp_block = rbtree_get_free_block(iter);
-
-			if (!block_incompatible(tmp_block, flags)) {
-				block = tmp_block;
-				break;
-			}
-
-			iter = rb_prev(iter);
-		}
-
+		root = &mm->free_trees[tree][i];
+		block = rbtree_last_free_block(root);
 		if (!block)
 			continue;
 
@@ -709,43 +745,39 @@ alloc_from_freetree(struct drm_buddy *mm,
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
-			struct rb_node *iter = rb_last(&mm->free_tree[tmp]);
-			struct drm_buddy_block *tmp_block;
-
-			while (iter) {
-				tmp_block = rbtree_get_free_block(iter);
-
-				if (!block_incompatible(tmp_block, flags)) {
-					block = tmp_block;
-					break;
-				}
-
-				iter = rb_prev(iter);
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
@@ -887,9 +919,9 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 				     struct list_head *blocks)
 {
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
+	enum drm_buddy_free_tree tree;
 	struct drm_buddy_block *block;
 	LIST_HEAD(blocks_lhs);
-	struct rb_node *iter;
 	unsigned long pages;
 	unsigned int order;
 	u64 modify_size;
@@ -901,40 +933,43 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	if (order == 0)
 		return -ENOSPC;
 
-	if (rbtree_is_empty(mm, order))
+	if (rbtree_is_empty(&mm->free_trees[DRM_BUDDY_CLEAR_TREE][order]) &&
+	    rbtree_is_empty(&mm->free_trees[DRM_BUDDY_DIRTY_TREE][order]))
 		return -ENOSPC;
 
-	iter = rb_last(&mm->free_tree[order]);
-
-	while (iter) {
-		block = rbtree_get_free_block(iter);
-
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
+		struct rb_node *iter = rb_last(&mm->free_trees[tree][order]);
+
+		while (iter) {
+			block = rbtree_get_free_block(iter);
+
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
-		}
-		/* Free blocks for the next iteration */
-		drm_buddy_free_list_internal(mm, blocks);
 
-		iter = rb_prev(iter);
+			iter = rb_prev(iter);
+		}
 	}
 
 	return -ENOSPC;
@@ -1239,6 +1274,7 @@ EXPORT_SYMBOL(drm_buddy_block_print);
  */
 void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 {
+	enum drm_buddy_free_tree tree;
 	int order;
 
 	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
@@ -1246,11 +1282,16 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 
 	for (order = mm->max_order; order >= 0; order--) {
 		struct drm_buddy_block *block, *tmp;
+		struct rb_root *root;
 		u64 count = 0, free;
 
-		rbtree_postorder_for_each_entry_safe(block, tmp, &mm->free_tree[order], rb) {
-			BUG_ON(!drm_buddy_block_is_free(block));
-			count++;
+		for_each_free_tree(tree) {
+			root = &mm->free_trees[tree][order];
+
+			rbtree_postorder_for_each_entry_safe(block, tmp, root, rb) {
+				BUG_ON(!drm_buddy_block_is_free(block));
+				count++;
+			}
 		}
 
 		drm_printf(p, "order-%2d ", order);
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 9ee105d4309f..d7891d08f67a 100644
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

