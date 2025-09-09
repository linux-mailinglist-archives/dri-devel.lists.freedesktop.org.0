Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7DB4A903
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC4110E685;
	Tue,  9 Sep 2025 09:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0uaMoe0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FA210E67A;
 Tue,  9 Sep 2025 09:56:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuEs8CiMiH8bXYHS/Zvq6Q/l/fkDNR97ZUpzdDAdArDq8b6OejvguYHSP0prMpDOKyA8CFVxtQ4tcShgXX0PNAzqPzHGunfOzNKgCD31HgKA5idhlK3L2lId4fnKVKy+NkkspHI5ANKihLjcjgJo8lVauZjgQ1T829zVUO1a0NTvT8J0xTUKWku0ZuWNdqo7Kv8FIrUXNSVH2eBFBt4Du9EGhtUni+ZtVQR/QBGpqzaXaA4tUXo9CZCLAjQkvBRBpbj9GokDI8m+je/XUIcCqfXxQlnX1XiUvG8gR5u9JBbY/1KYqqYET6ZmCcajMwrdXPvo9Gh06pJIz7F8y6dEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyNiScWg5hcIeFUG7UIS84aATwAOGSOJAN/hUEUW4jc=;
 b=Pg1NFSf/rpsxLMVl5TVQKonAEFKaZdG0MqTo86znVJtY8RrPFKy0rIUEUVXSSDqqOPKaTcEqOP4zAVLdtna0HDWuUFVNo7O8y/pGLZRvAek19xYF4kd55I+YeyoM/XuQ1RigL5VQ0NP0nrmWN/vZnafv3U8zzD0KKxtnkcmIwA7wF2L5In/kAlGAAPTfBmq46vJkWkOSIlZZNgWtHfo2DD6dChB4ftGhKG9PChmKbA2+rE/hBIGyGNBUyF4TWwOsV6pJiPHzphFMMqSU6ogvduiMQW39RMufN9mn1rZ+2/+9CVQvuK+SzKHMlCQecKkI3/5u+J+rarNIiyLcX1rxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyNiScWg5hcIeFUG7UIS84aATwAOGSOJAN/hUEUW4jc=;
 b=0uaMoe0oib38CCm5Cx1PsSHNxVH6XCEUvgv0WnHBEdlFWAL4++4pAUsjwVECNvaGUS4jAwr0K1/m/ssex1IX5dsZF+TZAkr1s0jgJ8kB0tm0yD0Hn5SZJ61KcLbumY9A4dDNmkl39nveD9iyoeNdCj+WlYQvQ9aW6D8Fenp1+HI=
Received: from SN7PR04CA0004.namprd04.prod.outlook.com (2603:10b6:806:f2::9)
 by LV9PR12MB9807.namprd12.prod.outlook.com (2603:10b6:408:2eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 09:56:46 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:f2:cafe::b) by SN7PR04CA0004.outlook.office365.com
 (2603:10b6:806:f2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Tue,
 9 Sep 2025 09:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 09:56:45 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Sep
 2025 02:56:40 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <jani.nikula@linux.intel.com>, <peterz@infradead.org>,
 <samuel.pitoiset@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v5 1/3] drm/buddy: Optimize free block management with RB tree
Date: Tue, 9 Sep 2025 15:26:21 +0530
Message-ID: <20250909095621.489833-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|LV9PR12MB9807:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e2a77a-4435-4b64-2706-08ddef872faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dshvh5f0ksr5e0AvfLu9i47E4TnP05AFKL4YA1DOBv1CV/OYsFZN7Ub8FDMS?=
 =?us-ascii?Q?hrdv93TKEcRN73cmEwpRjphM9UES8VslmWT93Y8lXZ1sZ5P+FWco8X/+vjMR?=
 =?us-ascii?Q?OkrA2/84+E6r5BxeOSAvgHZEwi4UH2OK0Z5qw1FSSwhz5L8dw/XP+jqxIC6X?=
 =?us-ascii?Q?s527Ma0WKi1unQ6arNrhsz9h0LLS0HKB3+VQ9+LShOqAO1/bqfhLprWqmrXE?=
 =?us-ascii?Q?cJLJveFW+k10trebyssn2rFfNgX+uKU4Gq5Xzw6wT3GU4jkEq1PwvJ72zZWX?=
 =?us-ascii?Q?g6cy0+qJXHgMxyr3c5h4faF4H72td2pW1rHZSEZyuaKfTvhMASdMavYaxmvP?=
 =?us-ascii?Q?u5lLtGNPjE5Y9QIOwIn88k0h24YUCtseHON3seup/ldHeIrqrTY/pAHu5zbu?=
 =?us-ascii?Q?xC+KI7v/kRNN9kJcyiX+7B6JBfDqNMJ0knGOs9k21+KFFfLcffITGSfLq7hG?=
 =?us-ascii?Q?kYgkB2FDW9hr/sCKn2+9PV6tVoCnYsb+pScl/VvRXz6WbC41mBvBo5M3IhC4?=
 =?us-ascii?Q?XG9Ag8ZNtYeuCnZYE8qBBPNMLjW4Hf1oJuDmYSH+wkda1Y3/rU78NtZP/xxr?=
 =?us-ascii?Q?PrW2yfLK9p7QwsgJbP/+ZEB2BPbkakhhaOaiaPxutu7ONNi2+yCgpH3zkS8O?=
 =?us-ascii?Q?T6K1ivpfxB3ztmhLjoMAEsiv0cKlMEpN0V4W27AK3Ou9wjFqECvziZs0iCKB?=
 =?us-ascii?Q?pTxG4mVjS2lSj/dty5qVAvQhqMwX9F3z6z3Uq5snId6I3sAjK4uH+l3VGlSW?=
 =?us-ascii?Q?EahvnaABBl3gHEJIRMclgQODRCw/znlnH/VQ/b92By1YggtTt60q+ywQBY3T?=
 =?us-ascii?Q?iGodyWA68DY02Kte1qzAi91L78c2UrgXEHT8uYEqbx7BcepXbhmvvRjFytBI?=
 =?us-ascii?Q?gZ254F5CHAB0k2FXt7fkLao7CFX3FXclJ68aMtFgPUy4SrOa+9DbfrKf3K2x?=
 =?us-ascii?Q?8vWzjNXhIsrnE9bLqqOow+3TFxNXpVvBdI3thPQNZxUCrfJZRMLkjTalcxQg?=
 =?us-ascii?Q?al9YluMItSjGzGr77lB76GbcRUkXfHhN04S9VVHdcWK8YhIGo6tsb3rva3fP?=
 =?us-ascii?Q?8p5Gu1IVBwoxhIcGdr2YinMKMut7X6/CvoDYc6q3TW5XE6qezrB/4duQRvQJ?=
 =?us-ascii?Q?lzTFsS8jQN5bxSbYlJMaYhLsJasC50/VRPto2lSPgUg8TrJF4ksc5dbMCR/Q?=
 =?us-ascii?Q?ddnacgh+BbpW+6qn8I4s8CpX5ZtjRd6lOXjjYOtLiSgFxKKUcuyMhP5DfHCt?=
 =?us-ascii?Q?kPtvjLM9Mh9WZHE7eDYPcsJfoZB4Q6ozw/USLIJwQeVTCu/uWExUUUzTDN4n?=
 =?us-ascii?Q?LZH749l2+tCQpdk3qOIlOEhK1BUmr0RAq6Sw2GDobGrRk9X4XPz0AnHlcMyh?=
 =?us-ascii?Q?TOCV3BVjedhMw1qg1t+sitqXLSOYxzaQ4N3vRUo0XjkKTRj56NH8Vx+U4DuZ?=
 =?us-ascii?Q?lcUAtIX6gvozYuXGNX5Lb+X9edZGhyW4kspCgXvrtAFZlCKFlx7j4Ss+v84T?=
 =?us-ascii?Q?SUPziwgL+9Tq4xB7kjwM1FDBWjYtRcpPTNXk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 09:56:45.5074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e2a77a-4435-4b64-2706-08ddef872faa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9807
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

Cc: stable@vger.kernel.org
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 142 ++++++++++++++++++++++--------------
 include/drm/drm_buddy.h     |   9 ++-
 include/linux/rbtree.h      |  56 ++++++++++++++
 3 files changed, 152 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a94061f373de..8b340f47f73d 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -31,6 +31,8 @@ static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 	block->header |= order;
 	block->parent = parent;
 
+	RB_CLEAR_NODE(&block->rb);
+
 	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
 	return block;
 }
@@ -41,23 +43,53 @@ static void drm_block_free(struct drm_buddy *mm,
 	kmem_cache_free(slab_blocks, block);
 }
 
-static void list_insert_sorted(struct drm_buddy *mm,
-			       struct drm_buddy_block *block)
+static void rbtree_insert(struct drm_buddy *mm,
+			  struct drm_buddy_block *block)
 {
+	struct rb_root *root = &mm->free_tree[drm_buddy_block_order(block)];
+	struct rb_node **link = &root->rb_node;
+	struct rb_node *parent = NULL;
 	struct drm_buddy_block *node;
-	struct list_head *head;
+	u64 offset;
+
+	offset = drm_buddy_block_offset(block);
 
-	head = &mm->free_list[drm_buddy_block_order(block)];
-	if (list_empty(head)) {
-		list_add(&block->link, head);
-		return;
+	while (*link) {
+		parent = *link;
+		node = rb_entry(parent, struct drm_buddy_block, rb);
+
+		if (offset < drm_buddy_block_offset(node))
+			link = &parent->rb_left;
+		else
+			link = &parent->rb_right;
 	}
 
-	list_for_each_entry(node, head, link)
-		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
-			break;
+	rb_link_node(&block->rb, parent, link);
+	rb_insert_color(&block->rb, root);
+}
+
+static void rbtree_remove(struct drm_buddy *mm,
+			  struct drm_buddy_block *block)
+{
+	struct rb_root *root;
+
+	root = &mm->free_tree[drm_buddy_block_order(block)];
+	rb_erase(&block->rb, root);
+
+	RB_CLEAR_NODE(&block->rb);
+}
+
+static struct drm_buddy_block *
+rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
+{
+	struct rb_node *node = rb_last(&mm->free_tree[order]);
 
-	__list_add(&block->link, node->link.prev, &node->link);
+	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
+}
+
+static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
+{
+	return RB_EMPTY_ROOT(&mm->free_tree[order]);
 }
 
 static void clear_reset(struct drm_buddy_block *block)
@@ -70,12 +102,13 @@ static void mark_cleared(struct drm_buddy_block *block)
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
@@ -84,15 +117,16 @@ static void mark_free(struct drm_buddy *mm,
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
@@ -148,7 +182,7 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
 				mark_cleared(parent);
 		}
 
-		list_del(&buddy->link);
+		rbtree_remove(mm, buddy);
 		if (force_merge && drm_buddy_block_is_clear(buddy))
 			mm->clear_avail -= drm_buddy_block_size(mm, buddy);
 
@@ -179,9 +213,11 @@ static int __force_merge(struct drm_buddy *mm,
 		return -EINVAL;
 
 	for (i = min_order - 1; i >= 0; i--) {
-		struct drm_buddy_block *block, *prev;
+		struct drm_buddy_block *block, *prev_block, *first_block;
+
+		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
 
-		list_for_each_entry_safe_reverse(block, prev, &mm->free_list[i], link) {
+		rbtree_reverse_for_each_entry_safe(block, prev_block, &mm->free_tree[i], rb) {
 			struct drm_buddy_block *buddy;
 			u64 block_start, block_end;
 
@@ -206,10 +242,14 @@ static int __force_merge(struct drm_buddy *mm,
 			 * block in the next iteration as we would free the
 			 * buddy block as part of the free function.
 			 */
-			if (prev == buddy)
-				prev = list_prev_entry(prev, link);
+			if (prev_block && prev_block == buddy) {
+				if (prev_block != first_block)
+					prev_block = rb_entry(rb_prev(&prev_block->rb),
+							      struct drm_buddy_block,
+							      rb);
+			}
 
-			list_del(&block->link);
+			rbtree_remove(mm, block);
 			if (drm_buddy_block_is_clear(block))
 				mm->clear_avail -= drm_buddy_block_size(mm, block);
 
@@ -258,14 +298,14 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
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
 
@@ -273,7 +313,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 				  sizeof(struct drm_buddy_block *),
 				  GFP_KERNEL);
 	if (!mm->roots)
-		goto out_free_list;
+		goto out_free_tree;
 
 	offset = 0;
 	i = 0;
@@ -312,8 +352,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
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
@@ -323,7 +363,7 @@ EXPORT_SYMBOL(drm_buddy_init);
  *
  * @mm: DRM buddy manager to free
  *
- * Cleanup memory manager resources and the freelist
+ * Cleanup memory manager resources and the freetree
  */
 void drm_buddy_fini(struct drm_buddy *mm)
 {
@@ -350,7 +390,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 	WARN_ON(mm->avail != mm->size);
 
 	kfree(mm->roots);
-	kfree(mm->free_list);
+	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -383,7 +423,7 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(block);
+	mark_split(mm, block);
 
 	return 0;
 }
@@ -412,7 +452,7 @@ EXPORT_SYMBOL(drm_get_buddy);
  * @is_clear: blocks clear state
  *
  * Reset the clear state based on @is_clear value for each block
- * in the freelist.
+ * in the freetree.
  */
 void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 {
@@ -433,7 +473,7 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 	for (i = 0; i <= mm->max_order; ++i) {
 		struct drm_buddy_block *block;
 
-		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
+		rbtree_reverse_for_each_entry(block, &mm->free_tree[i], rb) {
 			if (is_clear != drm_buddy_block_is_clear(block)) {
 				if (is_clear) {
 					mark_cleared(block);
@@ -641,7 +681,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 	for (i = order; i <= mm->max_order; ++i) {
 		struct drm_buddy_block *tmp_block;
 
-		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
+		rbtree_reverse_for_each_entry(tmp_block, &mm->free_tree[i], rb) {
 			if (block_incompatible(tmp_block, flags))
 				continue;
 
@@ -667,7 +707,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 }
 
 static struct drm_buddy_block *
-alloc_from_freelist(struct drm_buddy *mm,
+alloc_from_freetree(struct drm_buddy *mm,
 		    unsigned int order,
 		    unsigned long flags)
 {
@@ -684,7 +724,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
 			struct drm_buddy_block *tmp_block;
 
-			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
+			rbtree_reverse_for_each_entry(tmp_block, &mm->free_tree[tmp], rb) {
 				if (block_incompatible(tmp_block, flags))
 					continue;
 
@@ -700,10 +740,8 @@ alloc_from_freelist(struct drm_buddy *mm,
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
@@ -771,7 +809,7 @@ static int __alloc_range(struct drm_buddy *mm,
 
 		if (contains(start, end, block_start, block_end)) {
 			if (drm_buddy_block_is_free(block)) {
-				mark_allocated(block);
+				mark_allocated(mm, block);
 				total_allocated += drm_buddy_block_size(mm, block);
 				mm->avail -= drm_buddy_block_size(mm, block);
 				if (drm_buddy_block_is_clear(block))
@@ -849,7 +887,6 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 {
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
-	struct list_head *list;
 	LIST_HEAD(blocks_lhs);
 	unsigned long pages;
 	unsigned int order;
@@ -862,11 +899,10 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	if (order == 0)
 		return -ENOSPC;
 
-	list = &mm->free_list[order];
-	if (list_empty(list))
+	if (rbtree_is_empty(mm, order))
 		return -ENOSPC;
 
-	list_for_each_entry_reverse(block, list, link) {
+	rbtree_reverse_for_each_entry(block, &mm->free_tree[order], rb) {
 		/* Allocate blocks traversing RHS */
 		rhs_offset = drm_buddy_block_offset(block);
 		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
@@ -976,7 +1012,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	list_add(&block->tmp_link, &dfs);
 	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
 	if (err) {
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -999,8 +1035,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		return  __drm_buddy_alloc_range_bias(mm, start, end,
 						     order, flags);
 	else
-		/* Allocate from freelist */
-		return alloc_from_freelist(mm, order, flags);
+		/* Allocate from freetree */
+		return alloc_from_freetree(mm, order, flags);
 }
 
 /**
@@ -1017,8 +1053,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
@@ -1120,7 +1156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			}
 		} while (1);
 
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -1204,7 +1240,7 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 		struct drm_buddy_block *block;
 		u64 count = 0, free;
 
-		list_for_each_entry(block, &mm->free_list[order], link) {
+		rbtree_for_each_entry(block, &mm->free_tree[order], rb) {
 			BUG_ON(!drm_buddy_block_is_free(block));
 			count++;
 		}
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 513837632b7d..091823592034 100644
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
diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
index 8d2ba3749866..17190bb4837c 100644
--- a/include/linux/rbtree.h
+++ b/include/linux/rbtree.h
@@ -79,6 +79,62 @@ static inline void rb_link_node_rcu(struct rb_node *node, struct rb_node *parent
 	   ____ptr ? rb_entry(____ptr, type, member) : NULL; \
 	})
 
+/**
+ * rbtree_for_each_entry - iterate in-order over rb_root of given type
+ *
+ * @pos:	the 'type *' to use as a loop cursor.
+ * @root:	'rb_root *' of the rbtree.
+ * @member:	the name of the rb_node field within 'type'.
+ */
+#define rbtree_for_each_entry(pos, root, member) \
+	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member); \
+	     (pos); \
+	     (pos) = rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member))
+
+/**
+ * rbtree_reverse_for_each_entry - iterate in reverse in-order over rb_root
+ * of given type
+ *
+ * @pos:	the 'type *' to use as a loop cursor.
+ * @root:	'rb_root *' of the rbtree.
+ * @member:	the name of the rb_node field within 'type'.
+ */
+#define rbtree_reverse_for_each_entry(pos, root, member) \
+	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member); \
+	     (pos); \
+	     (pos) = rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member))
+
+/**
+ * rbtree_for_each_entry_safe - iterate in-order over rb_root safe against removal
+ *
+ * @pos:	the 'type *' to use as a loop cursor
+ * @n:		another 'type *' to use as temporary storage
+ * @root:	'rb_root *' of the rbtree
+ * @member:	the name of the rb_node field within 'type'
+ */
+#define rbtree_for_each_entry_safe(pos, n, root, member) \
+	for ((pos) = rb_entry_safe(rb_first(root), typeof(*(pos)), member), \
+	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL; \
+	     (pos); \
+	     (pos) = (n), \
+	     (n) = (pos) ? rb_entry_safe(rb_next(&(pos)->member), typeof(*(pos)), member) : NULL)
+
+/**
+ * rbtree_reverse_for_each_entry_safe - iterate in reverse in-order over rb_root
+ * safe against removal
+ *
+ * @pos:	the struct type * to use as a loop cursor.
+ * @n:		another struct type * to use as temporary storage.
+ * @root:	pointer to struct rb_root to iterate.
+ * @member:	name of the rb_node field within the struct.
+ */
+#define rbtree_reverse_for_each_entry_safe(pos, n, root, member) \
+	for ((pos) = rb_entry_safe(rb_last(root), typeof(*(pos)), member), \
+	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL; \
+	     (pos); \
+	     (pos) = (n), \
+	     (n) = (pos) ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*(pos)), member) : NULL)
+
 /**
  * rbtree_postorder_for_each_entry_safe - iterate in post-order over rb_root of
  * given type allowing the backing memory of @pos to be invalidated

base-commit: 7156602d56e5ad689ae11e03680ab6326238b5e3
-- 
2.34.1

