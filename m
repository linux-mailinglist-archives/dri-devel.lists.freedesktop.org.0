Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69592B3EE25
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 20:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BF910E501;
	Mon,  1 Sep 2025 18:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0g1+xRbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9606310E500;
 Mon,  1 Sep 2025 18:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDVz6+FOxJdcd+0RZkXVuG/T3mDvOm5u6r8a0HCPi8ysBS4zcDK7HtQY0zQvEFWtQwggLdbSwYeW0TcFNGIQNak12TNFoy4CS3ZBeXIZmaIRGJpor8LDOWD4bpzpZhDoSMGkp3UWP9PJXXq+OsT52eZrE69daRpwmASrwRCY0I0ZTnq1G61gMew4RiCWV0AuzsROIfu8VBsbZ186hwzwUCZcVN/VDl2mXGWGIkH0PUoR2sHjxdJgEo4l3aOW4TkmDrFT7sqANK0YX30WCQFlfNHqGIzzo4EE3LXO4bHWpz8vsq1ZYQh56yWEUJAxIh+/JL0wrOsb4nICW6EMb4CVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH3AnI31RX6vRbr6cJ0ZOQakqTBkLdVQVPyl3y0W4ZI=;
 b=k9XKuLGP/QPW7d+U97g/gnbzwfzicUlhV33C0xCYtcKWIrx1/2Y/r38I7bz9dDiejpftNYNoj/paXEJRcpB9Vn9jLnOGlrDnfV9wY3Y2n4Wu2C8H1YMwo2qBhEGq8H4W6fqvZGmqqntcPJoyOg7tl+UQbwY2jkm+/VIdJjfmnqsgzatSWi0kEiuDl5NccBSvOPXZxfNrMky6QX8l0o0n+9XN0c2RUrYtd0AOVtHpkbvwH2f+QLp5lbVbHV+tTP3XfypdGo0fxoFRPvMXgNu2ZOfhYCcp/fx5IlwLa20bxTagCd/wWNRco6dD18Reab3fpRsF4qx4aKTGNxJHRDimPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH3AnI31RX6vRbr6cJ0ZOQakqTBkLdVQVPyl3y0W4ZI=;
 b=0g1+xRbfW/fJWNHgfqPnEWFkZnTdvI9jq6aGjB5SamwFuaI0FUdafgJCdRiSWKddpyEWTZUTl54gD0L7thEqYIMPIN2A3jTj5HoTD8FhcWgzB5WDP2VKwTyj1QfyGmWemtyc4YKlkz2iYiixUBHI2egFlwUWTysjlZBdTtcB4Zg=
Received: from MN0PR04CA0008.namprd04.prod.outlook.com (2603:10b6:208:52d::22)
 by CH3PR12MB7596.namprd12.prod.outlook.com (2603:10b6:610:14b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.26; Mon, 1 Sep
 2025 18:56:32 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::1e) by MN0PR04CA0008.outlook.office365.com
 (2603:10b6:208:52d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 18:56:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Mon, 1 Sep 2025 18:56:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Sep
 2025 13:56:31 -0500
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Mon, 1 Sep
 2025 11:56:27 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <jani.nikula@linux.intel.com>, <peterz@infradead.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v5 1/2] drm/buddy: Optimize free block management with RB tree
Date: Tue, 2 Sep 2025 00:26:04 +0530
Message-ID: <20250901185604.2222-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|CH3PR12MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb2505e-cc90-423f-3bf6-08dde989446c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yHCAki4dBcj+/bkT+cpneOzfgEG+oBV+FGi50q8PuTi4Fp4U9z/JaRhhLzwo?=
 =?us-ascii?Q?q9JnGfnrjtt0YRWfbFJSNShlhi/VgRro1oMO3UL83U8AqIW7Sj36/vt+vbE7?=
 =?us-ascii?Q?zK+PdkhabXJubf68PqOWZ1O59nSlB9Hh+kQCX2hsGtUsBYNnvo3ocRCXFKA9?=
 =?us-ascii?Q?0CxXakle45Yfk4J2l7fpmXfKeQx9vPsmmUQa5hv81jWKp47p9xOJWAwdc64G?=
 =?us-ascii?Q?lwGLKk5P1NM/gEMH77H7r/Y458r3BVhBDdqx/WYHGlHh6DvyXiu8HYE7hHG4?=
 =?us-ascii?Q?Bt7Q88EuXNI3aNzl3qxgTqwmF6bPz4W0/VVW+/9r/a5oOwE+yTjY2LUIiAb5?=
 =?us-ascii?Q?D5s+Y33qFZn2BvesDLcDho663JGfYaSjBBQJdl7u7memSGfEgsKANUNG2drc?=
 =?us-ascii?Q?Uca8BHyTbQ6WQ8yQNCl1HcBNYJU/IH72Nl/pkfSqtUwztUjE7jY42+p1bilw?=
 =?us-ascii?Q?WoLotsq5VUZ0P1ETvX7I1Gpq72DPdNoAGqSkvHONs+zJlzaFvfKl7irRKO9h?=
 =?us-ascii?Q?xUqrM1N99jSMAKDdNAtlp8KC1LKSugR/GWusfZR5OupQzYZipET+bEoBv4/D?=
 =?us-ascii?Q?AzRT7bhzS+7A9vNxFI8pC+NbKCWcf/NT7Xwi+cAqJtFPV6mrYXBH5ob/G823?=
 =?us-ascii?Q?U9jtd28Ic8Ud5rmSK1AhoDuLURwM1zJBdBFqmt5qS3o9XBMacWml9yvvo8XN?=
 =?us-ascii?Q?qtYFo+04KCZ2ERpcvRyY0Nf1So4hWGTcqinj+iXaH7pwopAp82Uf8FoUrlFZ?=
 =?us-ascii?Q?Cc24KH4Pmg6EQ/6pcbymFd9hjE/9TxvDUQMr9/5vNajrsKvoSmteSWV2cvt4?=
 =?us-ascii?Q?SsiN+TdebXXo7vBT+94ECVppVoJjTW6HtmfhKTBS9KZq0Feig4BJxRn7BfEK?=
 =?us-ascii?Q?iTCPcRcJPUyQyvi/MnN2z2CUkzRpnVXA1egEs+kuh8DIAPef5elaerl3WsiH?=
 =?us-ascii?Q?oE6qIDixjFRuUiACnyohqh5RLqubmfYYfY29D6Ao+OEyhb3OA77mYdNoKKp3?=
 =?us-ascii?Q?EcXBqGBfVicWqMzTeO9sQ3XaooU10LDMqk7C5xPPBkPhh7wdwXlineuJa23m?=
 =?us-ascii?Q?oJ9d7vOJB8Q6cGwBv640HT2pMnnbob/6DmBSE2nFyiyB76VmQR+n8y6DFT0K?=
 =?us-ascii?Q?nyoUQ7lxbQtLqMHahR/BhqA1ALSZvPAFttgn+w7a8fIGrj56K6UCjsSI7lrt?=
 =?us-ascii?Q?x/a/SvZBroebEQZWq24pbeqXoiX0U8qFlIP4b3lKztIGv4d1JMGdQHVfG34r?=
 =?us-ascii?Q?v7KBPDEuMNXjFqJDcJSdF0nW7foqPG/7rOP+dxi0ZqDLVeoPE+LXR55RKNmN?=
 =?us-ascii?Q?5if97eurhPwJbsLpBCLMkxD4s0jOpjJnLmsbztLorVCsGG1jvc5ip+9vG4Gt?=
 =?us-ascii?Q?1ZzRMHaZ45tgx+FKHB2nvZa/Ot4sCjf3OXJcLZdH1ef1Wx3RSIypekp1aRPj?=
 =?us-ascii?Q?8qJSrra3rO4v+B7D2Jcj8JPOKO2p7q7yElHa0y1agITY+smHsu9hEAsXnKJK?=
 =?us-ascii?Q?QU2qYjncMJDaED8D0M/cL6EaZYggMWuYJ/SJCGqLXkP1KFoMV+/lCs88CQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 18:56:32.3776 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb2505e-cc90-423f-3bf6-08dde989446c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7596
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

v3(Matthew):
  - Remove RB_EMPTY_NODE check in force_merge function.
  - Rename rb for loop macros to have less generic names and move to
    .c file.
  - Make the rb node rb and link field as union.

v4(Jani Nikula):
  - The kernel-doc comment should be "/**"
  - Move all the rbtree macros to rbtree.h and add parens to ensure
    correct precedence.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 142 ++++++++++++++++++++++--------------
 include/drm/drm_buddy.h     |   9 ++-
 include/linux/rbtree.h      |  56 ++++++++++++++
 3 files changed, 152 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a94061f373de..978cabfbcf0f 100644
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
 
-	__list_add(&block->link, node->link.prev, &node->link);
+	RB_CLEAR_NODE(&block->rb);
+}
+
+static inline struct drm_buddy_block *
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

base-commit: f4c75f975cf50fa2e1fd96c5aafe5aa62e55fbe4
-- 
2.34.1

