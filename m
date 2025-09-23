Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D99BB951D1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABF2F10E5AD;
	Tue, 23 Sep 2025 09:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="skJ4mC+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF59C10E5AC;
 Tue, 23 Sep 2025 09:03:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Im5iVZ3rwJD2TM5syLKOXB+ecvvdn9QrLhIMRW47K1ZGffTcPcqbSkdN/VpQyGlq1Q3808IghNC+2nhutiTXREj1LRnzsiDn0V2XDnKuhFqjR0t1lNlVl4FS5TyyD08ryCFDgMtfxX67/ByJa8fQk2uoHGRb4YsQ0nDBWyBlxCAVymQ5hg0fAZAaZsS3eEGtCI0O5iH59PY4yN79uZlDQ8u+Y/PR3pFBXgAGVn9ixuMPbcybBs7LisgnEhSLzSsCYKXyXo2RybLLkQZrLqC1aDlgFc4LFv6BvwpAVDuEuDGY8UWrRNtuYrZnqqaW6GbDoX6eumNj1DaAHxaZXHufbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Slu87v5jRkeOmnT3rsvHp1NH5oy+OXkf9v3wAfBRTKE=;
 b=Dgf+yV7n64EjSW0k0O/qy3pGJAqnpXqcEXMTHYUNWpu1ZjjOVIc72D+b4l66+Lwo4dUQ/s39qnjRFEZMoFLGB0Ocby2CgisL6DHD7vHpDPNWQ2cutLKsgu939lXV+14YIY3F+iLkvaXvh/8S/ZXtdmbAdRw3y+SDWpX3RnuyV9euM2IYKqoVl8Od5d3zlYvcNewHOFas1q0g/4wI5uDXvqKzE86xkPPx7UK7nYALb/g3pbw5rPj86I52VgMZzronDXY/wPhvMvNfEL6y+yTurugdWYwfDVrK+RYAkbuj6/RU0XlrJBZPUI2/40GZ3mxiTYljKrmS6mP8N12msAeF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Slu87v5jRkeOmnT3rsvHp1NH5oy+OXkf9v3wAfBRTKE=;
 b=skJ4mC+1TtY4xyZk81lXDmO9YM6rfV+QJCiYJaOkUB1MJxbPYhqxQqyrhUf+dAD2ziwxtTj7j4nPlPWcMSjpqYs7pKYTYXcBXtLch524o5OFThFOnp2Vn7tFIYjQK6hwcUdiYnALCMO7k3yUPTHqUZkTF0aqnQkG0NJ5CZe2kQo=
Received: from BN8PR03CA0026.namprd03.prod.outlook.com (2603:10b6:408:94::39)
 by SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 09:03:45 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:408:94:cafe::57) by BN8PR03CA0026.outlook.office365.com
 (2603:10b6:408:94::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 09:03:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 09:03:45 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 23 Sep
 2025 02:03:41 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <jani.nikula@linux.intel.com>,
 <peterz@infradead.org>, <samuel.pitoiset@gmail.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v7 1/3] drm/buddy: Optimize free block management with RB tree
Date: Tue, 23 Sep 2025 14:32:40 +0530
Message-ID: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SA1PR12MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 476cebeb-5ff1-469e-8111-08ddfa8019ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?to3w/sTBtFuXDNKhHZk8ap1R7VJyAEz61WJR+W3cJlzXz0iagXesNvAWCCQE?=
 =?us-ascii?Q?6WWy+vr2mRVspNpXuFo8zY0dmpTz9s5YCORiIMeh9GGMEKmiPiIOowuQ7AjZ?=
 =?us-ascii?Q?DmkYPTUXFGxAdGQsNHTkhPEldGerFXxy8m1nWkV4PdqrsURnog+V4Czbufc5?=
 =?us-ascii?Q?vMFnAaUT/tRyjoZxHxBK29vRrQbdJIyS7xZAnwAZDC64FCAILmDTDWdj92oH?=
 =?us-ascii?Q?fhdCVwp63QfBQ8bIu7cLVO+J0AJ1QnkZK++EEOeBVyX4SwYTxZupkf/y+4I3?=
 =?us-ascii?Q?aRuQAP+22BGQyLj/pvUHGPmwm3ZycZnQwbZhrq+bI/orsFeD4faRxPdelp6R?=
 =?us-ascii?Q?uv2tV4RGuQFKIY6ofp2TYvSiwvi66cwA+HaL/1Mq6tIZcpRh0JJRFQoslgeB?=
 =?us-ascii?Q?9/9V7DyKE8Z1Ff1xcTfglGEtjpkpcGUNM8Cf0iJ2JrSAw6CZ0+FvgcZQcGx8?=
 =?us-ascii?Q?TPu3jAR1gcbUtWozP/nsmiCUD8dA5kgwegPHZMJPNsPqjdOEYRWJtkwP13Bu?=
 =?us-ascii?Q?5sN6ADMF+8mpK9fzGOWaeEhk6uwZezVgkQiKcvI4f3CpXGEXWKdg2z6Ypf5M?=
 =?us-ascii?Q?MHIOOGkpjU+dbQPBCErjr/EHRTtrKWvQEEvUllqvQQPlGRg0KmR0Z4nE6o86?=
 =?us-ascii?Q?mpTgMsu9FIPZUOyzXRM/KBXfU3DorSqkHcGEIa5amOZRlCf26EhWe3SKolnW?=
 =?us-ascii?Q?DNgBmT9DtCrebwSWEn8ztLzx0EX8MdJhsiqiEPdK3kxcgsacIps5RfG1d0n6?=
 =?us-ascii?Q?tEXaNspN0pUqVOWDTnPy64yKE7tKeUCq1vxmSXU8YJlm95RS20CSXFwwrXFi?=
 =?us-ascii?Q?698BHXu1/yodtJcD7li2zIAgc4qdthSt2FiklTGx9Ef1n3qml1ftwdvAEX+Y?=
 =?us-ascii?Q?bP71sH5hlzV5xcS8p3mYy0pSVptuX7SzGvHOebxX2ZsD7g+s9zNUKhN1KjkF?=
 =?us-ascii?Q?9KzupZoY+Dx4GaHpuFwsITZnyC2UzFknkEmrZnKLq6wuPBgjpd9L53BQTCJz?=
 =?us-ascii?Q?Lq2HFyOaYR+Fis7tLa8p4m5t5BarDrITuRjHnHsrQDhaEKXbFO5h18HJf+AW?=
 =?us-ascii?Q?ERVv/r9/C4JlJYXYKHbHYoTiwM4dND5jRmXBBnlNWUBibgnSeiFC6Yx6uNW2?=
 =?us-ascii?Q?szvuSflziIO6Nlb5FkNAOg2oVAS7YFXbS/WLUTEPkwT6gIyNSwgB36pj6WQO?=
 =?us-ascii?Q?7CMNPD+cspCQi5ivZvcKJlkSeMipRiqwjOVh0yxOW2PFoJB8YHsjfVyC2hE3?=
 =?us-ascii?Q?28oS8J1+/aQVxKcvD6P1iYoPUVxX4UzpFg1LB+uRO75ewg6/sb1gioqVyv18?=
 =?us-ascii?Q?r4uD5o9izFIhy1ZUwVfl6qus3LDr3p2ux52jOh4biMBBixcNwsjTBeJDYM5M?=
 =?us-ascii?Q?O8BrcTSXrXeIrdEtM7oZYY5fwTCkSBnGm7k3kFYSOnEZUNMunKnjWg2KREbo?=
 =?us-ascii?Q?CG/+MyVNICCjVW+gG16BUOFcHCDyZ+oI6MkogzYezaevZD7wg66tj74M29Bi?=
 =?us-ascii?Q?AaHwlkjk9oiNltFNc+DUk4mTmi+IT2BJqwuJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 09:03:45.3867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 476cebeb-5ff1-469e-8111-08ddfa8019ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797
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

Replace the freelist (O(n)) used for free block management with a
red-black tree, providing more efficient O(log n) search, insert,
and delete operations. This improves scalability and performance
when managing large numbers of free blocks per order (e.g., hundreds
or thousands).

In the VK-CTS memory stress subtest, the buddy manager merges
fragmented memory and inserts freed blocks into the freelist. Since
freelist insertion is O(n), this becomes a bottleneck as fragmentation
increases. Benchmarking shows list_insert_sorted() consumes ~52.69% CPU
with the freelist, compared to just 0.03% with the RB tree
(rbtree_insert.isra.0), despite performing the same sorted insert.

This also improves performance in heavily fragmented workloads,
such as games or graphics tests that stress memory.

As the buddy allocator evolves with new features such as clear-page
tracking, the resulting fragmentation and complexity have grown.
These RB-tree based design changes are introduced to address that
growth and ensure the allocator continues to perform efficiently
under fragmented conditions.

The RB tree implementation with separate clear/dirty trees provides:
- O(n log n) aggregate complexity for all operations instead of O(n^2)
- Elimination of soft lockups and system instability
- Improved code maintainability and clarity
- Better scalability for large memory systems
- Predictable performance under fragmentation

v3(Matthew):
  - Remove RB_EMPTY_NODE check in force_merge function.
  - Rename rb for loop macros to have less generic names and move to
    .c file.
  - Make the rb node rb and link field as union.

v4(Jani Nikula):
  - The kernel-doc comment should be "/**"
  - Move all the rbtree macros to rbtree.h and add parens to ensure
    correct precedence.

v5:
  - Remove the inline in a .c file (Jani Nikula).

v6(Peter Zijlstra):
  - Add rb_add() function replacing the existing rbtree_insert() code.

v7:
  - A full walk iteration in rbtree is slower than the list (Peter Zijlstra).
  - The existing rbtree_postorder_for_each_entry_safe macro should be used
    in scenarios where traversal order is not a critical factor (Christian).

Cc: stable@vger.kernel.org
Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 188 ++++++++++++++++++++++--------------
 include/drm/drm_buddy.h     |  11 ++-
 2 files changed, 124 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a94061f373de..67aa67229cc3 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -14,6 +14,8 @@
 
 static struct kmem_cache *slab_blocks;
 
+#define rbtree_get_free_block(node) rb_entry((node), struct drm_buddy_block, rb)
+
 static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 					       struct drm_buddy_block *parent,
 					       unsigned int order,
@@ -31,6 +33,8 @@ static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 	block->header |= order;
 	block->parent = parent;
 
+	RB_CLEAR_NODE(&block->rb);
+
 	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
 	return block;
 }
@@ -41,23 +45,49 @@ static void drm_block_free(struct drm_buddy *mm,
 	kmem_cache_free(slab_blocks, block);
 }
 
-static void list_insert_sorted(struct drm_buddy *mm,
-			       struct drm_buddy_block *block)
+static bool drm_buddy_block_offset_less(const struct drm_buddy_block *block,
+					const struct drm_buddy_block *node)
 {
-	struct drm_buddy_block *node;
-	struct list_head *head;
+	return drm_buddy_block_offset(block) < drm_buddy_block_offset(node);
+}
 
-	head = &mm->free_list[drm_buddy_block_order(block)];
-	if (list_empty(head)) {
-		list_add(&block->link, head);
-		return;
-	}
+static bool rbtree_block_offset_less(struct rb_node *block,
+				     const struct rb_node *node)
+{
+	return drm_buddy_block_offset_less(rbtree_get_free_block(block),
+					   rbtree_get_free_block(node));
+}
 
-	list_for_each_entry(node, head, link)
-		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
-			break;
+static void rbtree_insert(struct drm_buddy *mm,
+			  struct drm_buddy_block *block)
+{
+	rb_add(&block->rb,
+	       &mm->free_tree[drm_buddy_block_order(block)],
+	       rbtree_block_offset_less);
+}
+
+static void rbtree_remove(struct drm_buddy *mm,
+			  struct drm_buddy_block *block)
+{
+	struct rb_root *root;
+
+	root = &mm->free_tree[drm_buddy_block_order(block)];
+	rb_erase(&block->rb, root);
 
-	__list_add(&block->link, node->link.prev, &node->link);
+	RB_CLEAR_NODE(&block->rb);
+}
+
+static struct drm_buddy_block *
+rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
+{
+	struct rb_node *node = rb_last(&mm->free_tree[order]);
+
+	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
+}
+
+static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
+{
+	return RB_EMPTY_ROOT(&mm->free_tree[order]);
 }
 
 static void clear_reset(struct drm_buddy_block *block)
@@ -70,12 +100,13 @@ static void mark_cleared(struct drm_buddy_block *block)
 	block->header |= DRM_BUDDY_HEADER_CLEAR;
 }
 
-static void mark_allocated(struct drm_buddy_block *block)
+static void mark_allocated(struct drm_buddy *mm,
+			   struct drm_buddy_block *block)
 {
 	block->header &= ~DRM_BUDDY_HEADER_STATE;
 	block->header |= DRM_BUDDY_ALLOCATED;
 
-	list_del(&block->link);
+	rbtree_remove(mm, block);
 }
 
 static void mark_free(struct drm_buddy *mm,
@@ -84,15 +115,16 @@ static void mark_free(struct drm_buddy *mm,
 	block->header &= ~DRM_BUDDY_HEADER_STATE;
 	block->header |= DRM_BUDDY_FREE;
 
-	list_insert_sorted(mm, block);
+	rbtree_insert(mm, block);
 }
 
-static void mark_split(struct drm_buddy_block *block)
+static void mark_split(struct drm_buddy *mm,
+		       struct drm_buddy_block *block)
 {
 	block->header &= ~DRM_BUDDY_HEADER_STATE;
 	block->header |= DRM_BUDDY_SPLIT;
 
-	list_del(&block->link);
+	rbtree_remove(mm, block);
 }
 
 static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
@@ -148,7 +180,7 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
 				mark_cleared(parent);
 		}
 
-		list_del(&buddy->link);
+		rbtree_remove(mm, buddy);
 		if (force_merge && drm_buddy_block_is_clear(buddy))
 			mm->clear_avail -= drm_buddy_block_size(mm, buddy);
 
@@ -179,13 +211,19 @@ static int __force_merge(struct drm_buddy *mm,
 		return -EINVAL;
 
 	for (i = min_order - 1; i >= 0; i--) {
-		struct drm_buddy_block *block, *prev;
+		struct rb_root *root = &mm->free_tree[i];
+		struct rb_node *iter;
+
+		iter = rb_last(root);
 
-		list_for_each_entry_safe_reverse(block, prev, &mm->free_list[i], link) {
-			struct drm_buddy_block *buddy;
+		while (iter) {
+			struct drm_buddy_block *block, *buddy;
 			u64 block_start, block_end;
 
-			if (!block->parent)
+			block = rbtree_get_free_block(iter);
+			iter = rb_prev(iter);
+
+			if (!block || !block->parent)
 				continue;
 
 			block_start = drm_buddy_block_offset(block);
@@ -201,15 +239,10 @@ static int __force_merge(struct drm_buddy *mm,
 			WARN_ON(drm_buddy_block_is_clear(block) ==
 				drm_buddy_block_is_clear(buddy));
 
-			/*
-			 * If the prev block is same as buddy, don't access the
-			 * block in the next iteration as we would free the
-			 * buddy block as part of the free function.
-			 */
-			if (prev == buddy)
-				prev = list_prev_entry(prev, link);
+			if (iter == &buddy->rb)
+				iter = rb_prev(iter);
 
-			list_del(&block->link);
+			rbtree_remove(mm, block);
 			if (drm_buddy_block_is_clear(block))
 				mm->clear_avail -= drm_buddy_block_size(mm, block);
 
@@ -258,14 +291,14 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
 	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
 
-	mm->free_list = kmalloc_array(mm->max_order + 1,
-				      sizeof(struct list_head),
+	mm->free_tree = kmalloc_array(mm->max_order + 1,
+				      sizeof(struct rb_root),
 				      GFP_KERNEL);
-	if (!mm->free_list)
+	if (!mm->free_tree)
 		return -ENOMEM;
 
 	for (i = 0; i <= mm->max_order; ++i)
-		INIT_LIST_HEAD(&mm->free_list[i]);
+		mm->free_tree[i] = RB_ROOT;
 
 	mm->n_roots = hweight64(size);
 
@@ -273,7 +306,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 				  sizeof(struct drm_buddy_block *),
 				  GFP_KERNEL);
 	if (!mm->roots)
-		goto out_free_list;
+		goto out_free_tree;
 
 	offset = 0;
 	i = 0;
@@ -312,8 +345,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 	while (i--)
 		drm_block_free(mm, mm->roots[i]);
 	kfree(mm->roots);
-out_free_list:
-	kfree(mm->free_list);
+out_free_tree:
+	kfree(mm->free_tree);
 	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_buddy_init);
@@ -323,7 +356,7 @@ EXPORT_SYMBOL(drm_buddy_init);
  *
  * @mm: DRM buddy manager to free
  *
- * Cleanup memory manager resources and the freelist
+ * Cleanup memory manager resources and the freetree
  */
 void drm_buddy_fini(struct drm_buddy *mm)
 {
@@ -350,7 +383,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 	WARN_ON(mm->avail != mm->size);
 
 	kfree(mm->roots);
-	kfree(mm->free_list);
+	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -383,7 +416,7 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(block);
+	mark_split(mm, block);
 
 	return 0;
 }
@@ -412,7 +445,7 @@ EXPORT_SYMBOL(drm_get_buddy);
  * @is_clear: blocks clear state
  *
  * Reset the clear state based on @is_clear value for each block
- * in the freelist.
+ * in the freetree.
  */
 void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 {
@@ -431,9 +464,9 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 	}
 
 	for (i = 0; i <= mm->max_order; ++i) {
-		struct drm_buddy_block *block;
+		struct drm_buddy_block *block, *tmp;
 
-		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
+		rbtree_postorder_for_each_entry_safe(block, tmp, &mm->free_tree[i], rb) {
 			if (is_clear != drm_buddy_block_is_clear(block)) {
 				if (is_clear) {
 					mark_cleared(block);
@@ -639,14 +672,18 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 	unsigned int i;
 
 	for (i = order; i <= mm->max_order; ++i) {
+		struct rb_node *iter = rb_last(&mm->free_tree[i]);
 		struct drm_buddy_block *tmp_block;
 
-		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
-			if (block_incompatible(tmp_block, flags))
-				continue;
+		while (iter) {
+			tmp_block = rbtree_get_free_block(iter);
 
-			block = tmp_block;
-			break;
+			if (!block_incompatible(tmp_block, flags)) {
+				block = tmp_block;
+				break;
+			}
+
+			iter = rb_prev(iter);
 		}
 
 		if (!block)
@@ -667,7 +704,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 }
 
 static struct drm_buddy_block *
-alloc_from_freelist(struct drm_buddy *mm,
+alloc_from_freetree(struct drm_buddy *mm,
 		    unsigned int order,
 		    unsigned long flags)
 {
@@ -682,14 +719,18 @@ alloc_from_freelist(struct drm_buddy *mm,
 			tmp = drm_buddy_block_order(block);
 	} else {
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
+			struct rb_node *iter = rb_last(&mm->free_tree[tmp]);
 			struct drm_buddy_block *tmp_block;
 
-			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
-				if (block_incompatible(tmp_block, flags))
-					continue;
+			while (iter) {
+				tmp_block = rbtree_get_free_block(iter);
 
-				block = tmp_block;
-				break;
+				if (!block_incompatible(tmp_block, flags)) {
+					block = tmp_block;
+					break;
+				}
+
+				iter = rb_prev(iter);
 			}
 
 			if (block)
@@ -700,10 +741,8 @@ alloc_from_freelist(struct drm_buddy *mm,
 	if (!block) {
 		/* Fallback method */
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
-			if (!list_empty(&mm->free_list[tmp])) {
-				block = list_last_entry(&mm->free_list[tmp],
-							struct drm_buddy_block,
-							link);
+			if (!rbtree_is_empty(mm, tmp)) {
+				block = rbtree_last_entry(mm, tmp);
 				if (block)
 					break;
 			}
@@ -771,7 +810,7 @@ static int __alloc_range(struct drm_buddy *mm,
 
 		if (contains(start, end, block_start, block_end)) {
 			if (drm_buddy_block_is_free(block)) {
-				mark_allocated(block);
+				mark_allocated(mm, block);
 				total_allocated += drm_buddy_block_size(mm, block);
 				mm->avail -= drm_buddy_block_size(mm, block);
 				if (drm_buddy_block_is_clear(block))
@@ -849,8 +888,8 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 {
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
-	struct list_head *list;
 	LIST_HEAD(blocks_lhs);
+	struct rb_node *iter;
 	unsigned long pages;
 	unsigned int order;
 	u64 modify_size;
@@ -862,11 +901,14 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	if (order == 0)
 		return -ENOSPC;
 
-	list = &mm->free_list[order];
-	if (list_empty(list))
+	if (rbtree_is_empty(mm, order))
 		return -ENOSPC;
 
-	list_for_each_entry_reverse(block, list, link) {
+	iter = rb_last(&mm->free_tree[order]);
+
+	while (iter) {
+		block = rbtree_get_free_block(iter);
+
 		/* Allocate blocks traversing RHS */
 		rhs_offset = drm_buddy_block_offset(block);
 		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
@@ -891,6 +933,8 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 		}
 		/* Free blocks for the next iteration */
 		drm_buddy_free_list_internal(mm, blocks);
+
+		iter = rb_prev(iter);
 	}
 
 	return -ENOSPC;
@@ -976,7 +1020,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	list_add(&block->tmp_link, &dfs);
 	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
 	if (err) {
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -999,8 +1043,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		return  __drm_buddy_alloc_range_bias(mm, start, end,
 						     order, flags);
 	else
-		/* Allocate from freelist */
-		return alloc_from_freelist(mm, order, flags);
+		/* Allocate from freetree */
+		return alloc_from_freetree(mm, order, flags);
 }
 
 /**
@@ -1017,8 +1061,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
  * alloc_range_bias() called on range limitations, which traverses
  * the tree and returns the desired block.
  *
- * alloc_from_freelist() called when *no* range restrictions
- * are enforced, which picks the block from the freelist.
+ * alloc_from_freetree() called when *no* range restrictions
+ * are enforced, which picks the block from the freetree.
  *
  * Returns:
  * 0 on success, error code on failure.
@@ -1120,7 +1164,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			}
 		} while (1);
 
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -1201,10 +1245,10 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, mm->clear_avail >> 20);
 
 	for (order = mm->max_order; order >= 0; order--) {
-		struct drm_buddy_block *block;
+		struct drm_buddy_block *block, *tmp;
 		u64 count = 0, free;
 
-		list_for_each_entry(block, &mm->free_list[order], link) {
+		rbtree_postorder_for_each_entry_safe(block, tmp, &mm->free_tree[order], rb) {
 			BUG_ON(!drm_buddy_block_is_free(block));
 			count++;
 		}
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 513837632b7d..9ee105d4309f 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include <linux/rbtree.h>
 
 #include <drm/drm_print.h>
 
@@ -53,7 +54,11 @@ struct drm_buddy_block {
 	 * a list, if so desired. As soon as the block is freed with
 	 * drm_buddy_free* ownership is given back to the mm.
 	 */
-	struct list_head link;
+	union {
+		struct rb_node rb;
+		struct list_head link;
+	};
+
 	struct list_head tmp_link;
 };
 
@@ -68,7 +73,7 @@ struct drm_buddy_block {
  */
 struct drm_buddy {
 	/* Maintain a free list for each order. */
-	struct list_head *free_list;
+	struct rb_root *free_tree;
 
 	/*
 	 * Maintain explicit binary tree(s) to track the allocation of the
@@ -94,7 +99,7 @@ struct drm_buddy {
 };
 
 static inline u64
-drm_buddy_block_offset(struct drm_buddy_block *block)
+drm_buddy_block_offset(const struct drm_buddy_block *block)
 {
 	return block->header & DRM_BUDDY_HEADER_OFFSET;
 }

base-commit: 3a9cf301794c1a49d95eeb13119ff490fb5cfe88
-- 
2.34.1

