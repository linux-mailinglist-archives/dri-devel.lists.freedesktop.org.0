Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B702B2FDC1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 17:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACA410E9C9;
	Thu, 21 Aug 2025 15:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WhD8vjXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8520A10E9C0;
 Thu, 21 Aug 2025 15:07:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSbGEL+Oj74oFKN1vQAIlhYal3qgpPMKdVECIhChAG6WoL01NEHsH/Nn1AHn9Nu2OTEEMzv54olKD138R6MvlX78aXYDTiAFfU3VimHbovbispx2z8Pbp+yQho19o1ll9GAko8ycESsb9hNSyXdMMy63jdtSJ3gqu/4Il78gNMw1xlAtqyHtGYUOHKSOcoeCzKJO+iXymrKTOnRtU6/DKwvm2I2YSHPkYLCkF9kLWUekvRRmg7qn8rWz8w1GRmWFxm6TlP1ppuo8/yr+E93BDO9B3TwmnTqvamV3I5yYrE45SaSS0dTFCi69PeRrq7zLW+OjpsZ5yyoL8ZM5iBnrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEtCScpVpkTYjYIeVWRkXAICLd3jjXbFWrjyVoTOggs=;
 b=Fd6g9VI5heMswezQEERe2toLal0GzwerlT4fpKSik0kXhu7zes3ANMizqJNWzW8KUisN8xA2cUotfXeLb4dwDl+2ilvSw14S9E/6/T0Ya0VJqlv4QfplRHEmh9fwn14zagkRCf3rwn6EEl1G+1Mf7G90yC8cL4XFjlR3DQrBHAY7fmCU6KMW3FHRPosKXdaWlbWK7Q2q79F93KECiaoJO5UB0zxqCr9saw/ddmeRz7H9WXWHPp/HyyrjLwwsYyfETbZAgg0uT/tYj/R5oQ7Y4CP5jkGJxGPaA86vjl5lWyck78o/xKXj0+kBoORDYoR0vGNeI/e2pE8UOzOoN9huZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEtCScpVpkTYjYIeVWRkXAICLd3jjXbFWrjyVoTOggs=;
 b=WhD8vjXBQxBu+1Y+kdm6vkpDbmvC1VLpc0I5Pk0Wjod19npRqj/WwXmU7K+opQY74TR24TA6eG/IvSfVA/+JxS5XGNcORgM7BoTH2aqSFalZHyX4uCzIkOlkWNctYYGNWzLkPEthteBPADlmN0HUSXC/VHoKh4wOJfbskf/wzSI=
Received: from BN0PR04CA0158.namprd04.prod.outlook.com (2603:10b6:408:eb::13)
 by MN0PR12MB6056.namprd12.prod.outlook.com (2603:10b6:208:3cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 15:07:03 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::69) by BN0PR04CA0158.outlook.office365.com
 (2603:10b6:408:eb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.16 via Frontend Transport; Thu,
 21 Aug 2025 15:07:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 15:07:03 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 10:06:58 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v3 1/2] drm/buddy: Optimize free block management with RB tree
Date: Thu, 21 Aug 2025 20:36:40 +0530
Message-ID: <20250821150641.2720-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|MN0PR12MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd0b82b-121c-47e4-e49e-08dde0c462e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U4vC2LF44gk7PVeSIo4dsDuckoxwJJfRf1xHQsGNS3KgLdR3CQ0gQ+uAPG2q?=
 =?us-ascii?Q?FH6hguVl6hiomCdzED5ARj2KR69D1O9R9Tnns70XZLTQECM4FWfMgaiZLdLr?=
 =?us-ascii?Q?JHZY9qnvSXQR0xI97U1jAZHrg0Q0K6Wcz2ch3z2Ig1J96Hl+U0VX60ryuTcP?=
 =?us-ascii?Q?r1LXdIVtzx3nPpOfqexSxpho/a435EXM6VYjgdSFHhA1XBFNYTnb6JGnl6Jk?=
 =?us-ascii?Q?Yiqr2QBAanDo8JlJQreqP9J5LFe4M8BDIp5Lf3lKaGpz3wAxZUUTt63bqUNc?=
 =?us-ascii?Q?frIMMYywCbeM3EMwxfNVS+85JrxJzUfh6LnO6oUKX3BiwXCVInxOT5ODPPpe?=
 =?us-ascii?Q?wmQPygacvkd4mNR8jVt5gb+LLmWp1rZXnMQM8WY3UxhUHpgwKvXpiisXBIYK?=
 =?us-ascii?Q?WoDuSqA74Oq1Fv18wOsdZvm08qzwieLuLZQgHlc2N4bD47bmm2URtDu5ijj4?=
 =?us-ascii?Q?eamwLhNzZQH5n+l0349h2MztyO5P/QUHINJqTK40clUsS2LBy54M1i7s0vh+?=
 =?us-ascii?Q?pEWfutsEhKGzb6UkkkVDNxOW0Q8W9QZMaoB6KPkefhEYfD3x82N9wBZ9w+R8?=
 =?us-ascii?Q?fxHkZLLz6oOczfqPCczNkBH8aBshsgaNP3Ut+vd/za6H/F03iF0glR5Yovs3?=
 =?us-ascii?Q?i0L8rDJiDvMNASRbq4J/gHQt42yWArieLca4+3j4v9qga/otHCLnfmqN7Ct+?=
 =?us-ascii?Q?z9wENt+QQfBYFDs/EFdCQ37HffCnMWW/5OibfEgGoIpVcVmFQg244hrkWoK5?=
 =?us-ascii?Q?g0WiulksUTPEQQmziP1H65OqGJHBxnTSb/oBPoHpy1zUFmGGB7ScSAPDSTnA?=
 =?us-ascii?Q?d9XCEtCSw0hirXR+b6qkRNHxEOepXv+afard2nVgVchN7MC/sHowNUarYt5x?=
 =?us-ascii?Q?eWxjmmDWLk4oTP2ZWRsD4K7b49jj3Tk4NKXSDtoQmhYuMhFhZOF2h3uTkz/0?=
 =?us-ascii?Q?zaHhrOeSIzFWcbJrRIkyXOlCylbNJTrRX6PK3Akn+4233orzJEdzFwbucG+b?=
 =?us-ascii?Q?SrQUBSxyZEt0hGiIgwwBpJFFz1IG39WWLjS2bnS4D79ZA9lYfqvekpOeCwtq?=
 =?us-ascii?Q?YT/LWC1pupsXqlxpRLWvVWvkY/qFAzvA4WCUjf9XiQ3XxMjmtgI4i+DNr4U0?=
 =?us-ascii?Q?fi3LImsBbVIbNNt7KV7CMlV6LoCnEs7DVtQMueWEAiuOHkegcq+94SADH3WV?=
 =?us-ascii?Q?YXUT3YY/nsrIyX03ADZXfUxyUKDr6wJ6fFRH58O2wkye9z3fDsbIDeSMzwK4?=
 =?us-ascii?Q?e9uyuANMwsdhA7GAKQoD+UeAw1AHPW63NGtOHXR29jcQXQAytU5m8YcJuAwO?=
 =?us-ascii?Q?1LYl3z17CqPNXfHDMq7wffer9CrjdYQQPZz7WseSHLJQTziFc8/TPfWc7HCn?=
 =?us-ascii?Q?vjMtX7IA7na33oZTfK7o4pdVvKUNoCeMab9VVx9Dypyq1sN8834Wh8btqNdj?=
 =?us-ascii?Q?cVVkO6N6xvJqDie3amtXezQX/ku/f/BpXtHgTZRSLgzxKR5LzvQyPvymdq8Z?=
 =?us-ascii?Q?XJVjAkdcv1ufBQo7uiubdYXNgPP4ql9Ni90D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 15:07:03.3684 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd0b82b-121c-47e4-e49e-08dde0c462e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6056
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 175 +++++++++++++++++++++++++-----------
 include/drm/drm_buddy.h     |   9 +-
 2 files changed, 130 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a94061f373de..92226a46cc2c 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -14,6 +14,41 @@
 
 static struct kmem_cache *slab_blocks;
 
+/*
+ * for_each_rb_free_block() - iterate over an RB tree in order
+ * @pos:	the struct type * to use as a loop cursor
+ * @root:	pointer to struct rb_root to iterate
+ * @member:	name of the rb_node field within the struct
+ */
+#define for_each_rb_free_block(pos, root, member) \
+	for (pos = rb_entry_safe(rb_first(root), typeof(*pos), member); \
+	     pos; \
+	     pos = rb_entry_safe(rb_next(&(pos)->member), typeof(*pos), member))
+
+/*
+ * for_each_rb_free_block_reverse() - iterate over an RB tree in reverse order
+ * @pos:	the struct type * to use as a loop cursor
+ * @root:	pointer to struct rb_root to iterate
+ * @member:	name of the rb_node field within the struct
+ */
+#define for_each_rb_free_block_reverse(pos, root, member) \
+	for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member); \
+	     pos; \
+	     pos = rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member))
+
+/**
+ * for_each_rb_free_block_reverse_safe() - safely iterate over an RB tree in reverse order
+ * @pos:	the struct type * to use as a loop cursor.
+ * @n:		another struct type * to use as temporary storage.
+ * @root:	pointer to struct rb_root to iterate.
+ * @member:	name of the rb_node field within the struct.
+ */
+#define for_each_rb_free_block_reverse_safe(pos, n, root, member) \
+	for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member), \
+	     n = pos ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member) : NULL; \
+	     pos; \
+	     pos = n, n = pos ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member) : NULL)
+
 static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 					       struct drm_buddy_block *parent,
 					       unsigned int order,
@@ -31,6 +66,8 @@ static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 	block->header |= order;
 	block->parent = parent;
 
+	RB_CLEAR_NODE(&block->rb);
+
 	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
 	return block;
 }
@@ -41,23 +78,53 @@ static void drm_block_free(struct drm_buddy *mm,
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
 
-	__list_add(&block->link, node->link.prev, &node->link);
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
@@ -70,12 +137,13 @@ static void mark_cleared(struct drm_buddy_block *block)
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
@@ -84,15 +152,16 @@ static void mark_free(struct drm_buddy *mm,
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
@@ -148,7 +217,7 @@ static unsigned int __drm_buddy_free(struct drm_buddy *mm,
 				mark_cleared(parent);
 		}
 
-		list_del(&buddy->link);
+		rbtree_remove(mm, buddy);
 		if (force_merge && drm_buddy_block_is_clear(buddy))
 			mm->clear_avail -= drm_buddy_block_size(mm, buddy);
 
@@ -179,9 +248,11 @@ static int __force_merge(struct drm_buddy *mm,
 		return -EINVAL;
 
 	for (i = min_order - 1; i >= 0; i--) {
-		struct drm_buddy_block *block, *prev;
+		struct drm_buddy_block *block, *prev_block, *first_block;
 
-		list_for_each_entry_safe_reverse(block, prev, &mm->free_list[i], link) {
+		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
+
+		for_each_rb_free_block_reverse_safe(block, prev_block, &mm->free_tree[i], rb) {
 			struct drm_buddy_block *buddy;
 			u64 block_start, block_end;
 
@@ -206,10 +277,14 @@ static int __force_merge(struct drm_buddy *mm,
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
 
@@ -258,14 +333,14 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
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
 
@@ -273,7 +348,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 				  sizeof(struct drm_buddy_block *),
 				  GFP_KERNEL);
 	if (!mm->roots)
-		goto out_free_list;
+		goto out_free_tree;
 
 	offset = 0;
 	i = 0;
@@ -312,8 +387,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
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
@@ -323,7 +398,7 @@ EXPORT_SYMBOL(drm_buddy_init);
  *
  * @mm: DRM buddy manager to free
  *
- * Cleanup memory manager resources and the freelist
+ * Cleanup memory manager resources and the freetree
  */
 void drm_buddy_fini(struct drm_buddy *mm)
 {
@@ -350,7 +425,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 	WARN_ON(mm->avail != mm->size);
 
 	kfree(mm->roots);
-	kfree(mm->free_list);
+	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -383,7 +458,7 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(block);
+	mark_split(mm, block);
 
 	return 0;
 }
@@ -433,7 +508,7 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 	for (i = 0; i <= mm->max_order; ++i) {
 		struct drm_buddy_block *block;
 
-		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
+		for_each_rb_free_block_reverse(block, &mm->free_tree[i], rb) {
 			if (is_clear != drm_buddy_block_is_clear(block)) {
 				if (is_clear) {
 					mark_cleared(block);
@@ -641,7 +716,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 	for (i = order; i <= mm->max_order; ++i) {
 		struct drm_buddy_block *tmp_block;
 
-		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
+		for_each_rb_free_block_reverse(tmp_block, &mm->free_tree[i], rb) {
 			if (block_incompatible(tmp_block, flags))
 				continue;
 
@@ -667,7 +742,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 }
 
 static struct drm_buddy_block *
-alloc_from_freelist(struct drm_buddy *mm,
+alloc_from_freetree(struct drm_buddy *mm,
 		    unsigned int order,
 		    unsigned long flags)
 {
@@ -684,7 +759,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
 			struct drm_buddy_block *tmp_block;
 
-			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
+			for_each_rb_free_block_reverse(tmp_block, &mm->free_tree[tmp], rb) {
 				if (block_incompatible(tmp_block, flags))
 					continue;
 
@@ -700,10 +775,8 @@ alloc_from_freelist(struct drm_buddy *mm,
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
@@ -771,7 +844,7 @@ static int __alloc_range(struct drm_buddy *mm,
 
 		if (contains(start, end, block_start, block_end)) {
 			if (drm_buddy_block_is_free(block)) {
-				mark_allocated(block);
+				mark_allocated(mm, block);
 				total_allocated += drm_buddy_block_size(mm, block);
 				mm->avail -= drm_buddy_block_size(mm, block);
 				if (drm_buddy_block_is_clear(block))
@@ -849,7 +922,6 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 {
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
-	struct list_head *list;
 	LIST_HEAD(blocks_lhs);
 	unsigned long pages;
 	unsigned int order;
@@ -862,11 +934,10 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	if (order == 0)
 		return -ENOSPC;
 
-	list = &mm->free_list[order];
-	if (list_empty(list))
+	if (rbtree_is_empty(mm, order))
 		return -ENOSPC;
 
-	list_for_each_entry_reverse(block, list, link) {
+	for_each_rb_free_block_reverse(block, &mm->free_tree[order], rb) {
 		/* Allocate blocks traversing RHS */
 		rhs_offset = drm_buddy_block_offset(block);
 		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
@@ -976,7 +1047,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	list_add(&block->tmp_link, &dfs);
 	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
 	if (err) {
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -999,8 +1070,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		return  __drm_buddy_alloc_range_bias(mm, start, end,
 						     order, flags);
 	else
-		/* Allocate from freelist */
-		return alloc_from_freelist(mm, order, flags);
+		/* Allocate from freetree */
+		return alloc_from_freetree(mm, order, flags);
 }
 
 /**
@@ -1017,8 +1088,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
@@ -1120,7 +1191,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			}
 		} while (1);
 
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -1204,7 +1275,7 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 		struct drm_buddy_block *block;
 		u64 count = 0, free;
 
-		list_for_each_entry(block, &mm->free_list[order], link) {
+		for_each_rb_free_block(block, &mm->free_tree[order], rb) {
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
-- 
2.34.1

