Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB9B4ACDF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC7C10E6D7;
	Tue,  9 Sep 2025 11:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CGAIA2mR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D46410E6D5;
 Tue,  9 Sep 2025 11:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQBVI7jb+JJuZ3/MiZcrMs2bjMZdZGA+DOBxVRqkkMWQDp26mEbQY7DoytGpSTA+275z4Iye3yE8UH111U7UGE/CqUh5y8XtKy2/bYtIzvnz8Mxs4vg1yFeyG43z4D2tRIW5Dj7ChU/qJxZ2c3GbwUIEnU8NOORYFNEGU2Hk7cwftvXm0gb74gmLiuqsMbiaJ5w9R7BikD/vO8df4PD9QfiNgD2LdDSWuEwufRTf/YW/HnSn8hU2qOEEvknDRWq0UZUs5Gg+Ti22u+Fiz5nG46N7gl3UpIXprNdOVuZQl1Mb+kHW0KaUFTyeATUFa+vpyIYcSLxCLYZwS35r5eZkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIciphukSEeoeeBcvC1q882K2FjsCacm0tHVcfraq5U=;
 b=ZMEyRGC0LauZvseiccDQjaSIwOJGSpQMbzFndo9uzWUT/dC4ewjXA/aj/cO1puqKtAv4E+mmsWAQH3IZsWNMKLHChDqphKC8IoPtMTpB5JEdUyZ5lwJjaW+wvcSDfkuuYFB0MFwlb9r/f3YZriAPrtmynKZghBByQndJbVJbuduf3G8BweCu7s7G7RQSEGl+EeOcCzYkcnpM9mFew+mH2/fbflL9wj8JNGvRYZKkqOxeL/N3+X8uUkEUxKMZxJls4RpCpXW2Zn/hkwtpMtNUYXTw51sxhI72f6x7+o2TnqhuWbQ/AsF5YlWrQHakwf6s5ADFUiZXMGtFpOQlX/sxDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIciphukSEeoeeBcvC1q882K2FjsCacm0tHVcfraq5U=;
 b=CGAIA2mRDelX5Ocqr5aFGJ8DphSjvoGQ58ZW8Ppx0HjLuoEuRLCErSYmRe2y3KoVFMOoxn7k+MkACP8z+/NYu47jFjrC3novtmUSkUmoU2Q3RxJAn0aUQqYyJ4Hp6NGdStJyOrTYYcd86HX/hryvbAu1VBY1zxwCRbsw4Um01vA=
Received: from MW4PR03CA0007.namprd03.prod.outlook.com (2603:10b6:303:8f::12)
 by SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 11:53:00 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:8f:cafe::21) by MW4PR03CA0007.outlook.office365.com
 (2603:10b6:303:8f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Tue,
 9 Sep 2025 11:53:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 11:53:00 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Sep
 2025 04:52:54 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <jani.nikula@linux.intel.com>, <peterz@infradead.org>,
 <samuel.pitoiset@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v6 1/3] drm/buddy: Optimize free block management with RB tree
Date: Tue, 9 Sep 2025 17:22:35 +0530
Message-ID: <20250909115237.2644-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|SJ2PR12MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: dc76d196-16a6-434e-91d6-08ddef976d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GrQvMIFZOZ2gKM/NQXMczPdrqgNx7SLXJjMX6i0x5kqPzbP7eZLqf8IF4cvf?=
 =?us-ascii?Q?d9BcjteDYZdGY2AQsvY/EbkhNVqNnVQbgD/eHeASw8jV/W9VZttkH9iCiAsf?=
 =?us-ascii?Q?/p9LsGEHkTi6Cr97LwhZJ7bTT2biXOK9kN9ydbufmrBG6884ceTp0Z3+tNcT?=
 =?us-ascii?Q?HQqkpoXDV8IeTPQbf2rjdLGR1skIU7bcdPphfy0gQ4iMrJoDbqiYRkk6Ppms?=
 =?us-ascii?Q?KNbJswpf3Hj6Thma4M3lXqQwqAGX50zMsuACSjManIqytjpvaAw9JSaJRD3t?=
 =?us-ascii?Q?anugLqO0pio+oaGJrBRqVZQxe9PUtvAzDh8S5Fp0VvdZVtsIqYduv5GN9rHV?=
 =?us-ascii?Q?dJGiKKpURAiALVZQAfJQe5m22i5Likw+74162Kvi/8IUqcYr5NWasfoYZQIA?=
 =?us-ascii?Q?6u5mts3JC0mmvlYM3ql0v/GtnK0FjPpjoSCuJvz7buwgcS870Ybr0JGvVUgw?=
 =?us-ascii?Q?s/OcPt97BYjn5y84yXliZglQ9DM8kGg1hF//RloZ5cwKJVIiZyMnHhPJPFyr?=
 =?us-ascii?Q?EUuyUZMoeObQCNGr9a+wSBZ++3GBOlnw3uzmeTFwCP7WKD03rQPqmnygATYs?=
 =?us-ascii?Q?Yqbhgavhi8SgQb3oU+QzCg8EeGs5cpTX7cfSM4OU9ADq+X9fDIhshA/uJb2S?=
 =?us-ascii?Q?jOk3y1zRIZr2nt5RjLTJtlwMcyD1gMlb6iepLcVxRmO2uPdx6voZU3kP/Qub?=
 =?us-ascii?Q?UVEVyqEUAtuZ6WKm5v9eXS08UBvENvPsoBx5PAbrADjsZH196w38BYeg/1YT?=
 =?us-ascii?Q?Knhj0PpPC8fQTb5XTIVLVTuASWwYN/+6Fu++XEuyTNQZqdQXYQJZivxMhsE8?=
 =?us-ascii?Q?J4lfF8m/BXLWp0cmdL4miZj6+ZUs1bXIRX6GtOfQWK4tfwb/Wmo9Z60P1wId?=
 =?us-ascii?Q?T8rWCViyJvTp7aQUPaGb/E7rAITmDCMRjTwV89ba8g6BOveXAoF236gnlHJB?=
 =?us-ascii?Q?eqwHRcLlSmdL5+0I5TuRmw9d/maicMtOmSowukI9CSPPba1Kc/2OMFVV34DR?=
 =?us-ascii?Q?HISUrKQwMalF5fwvr/EICQ4tlUQWuzRh9u4zAWa/Fo+TBo8LNxhR1ZO+2uuV?=
 =?us-ascii?Q?bwWk6T7aNFO2lObd9nckGM3vun3iSGxZqV88CfKlSFqgzAHulZ/CeIvr9bWZ?=
 =?us-ascii?Q?4jZQi61ZSrz8eqcDAH1MPqmp89pzqQ6Oo8Oc7N3UExN9iaPKwTPxufYpqgKU?=
 =?us-ascii?Q?inbNbNOLvOL7q2gEGO2vRKIJUc971/ORF8i200WVJ8XgEqnkpn3JQVyq6HvF?=
 =?us-ascii?Q?WkzWrFSeWy94s2XD7YWoSpnD117KatfjCFF3O7S7dIFt8hK9v9cJXXSUeLin?=
 =?us-ascii?Q?3XtlTHJIQtgmsBZEYaVAnjKEBtz1+pPZNlB864ia3Or2OXQwRK8aZC2pCuzR?=
 =?us-ascii?Q?czI9CyXv02UYzYE99XRYeNgTQvKh823ZsKwAwlc+whVV6EiB9Lcn1K/HC8Wi?=
 =?us-ascii?Q?UW64xaMEYeQ20VqiggBf2cWTun+oniJbki011PKemXJOVuqgsCFA+Xg35lm4?=
 =?us-ascii?Q?8sOPZFmfo7Lqru+krLmAEmLCtVyqagUehmIp?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 11:53:00.4264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc76d196-16a6-434e-91d6-08ddef976d15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874
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

Cc: stable@vger.kernel.org
Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 144 ++++++++++++++++++++++--------------
 include/drm/drm_buddy.h     |  11 ++-
 include/linux/rbtree.h      |  56 ++++++++++++++
 3 files changed, 153 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a94061f373de..89f4b49ae3fb 100644
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
 
@@ -179,9 +211,11 @@ static int __force_merge(struct drm_buddy *mm,
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
 
@@ -206,10 +240,14 @@ static int __force_merge(struct drm_buddy *mm,
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
 
@@ -258,14 +296,14 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
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
 
@@ -273,7 +311,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 				  sizeof(struct drm_buddy_block *),
 				  GFP_KERNEL);
 	if (!mm->roots)
-		goto out_free_list;
+		goto out_free_tree;
 
 	offset = 0;
 	i = 0;
@@ -312,8 +350,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
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
@@ -323,7 +361,7 @@ EXPORT_SYMBOL(drm_buddy_init);
  *
  * @mm: DRM buddy manager to free
  *
- * Cleanup memory manager resources and the freelist
+ * Cleanup memory manager resources and the freetree
  */
 void drm_buddy_fini(struct drm_buddy *mm)
 {
@@ -350,7 +388,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 	WARN_ON(mm->avail != mm->size);
 
 	kfree(mm->roots);
-	kfree(mm->free_list);
+	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -383,7 +421,7 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(block);
+	mark_split(mm, block);
 
 	return 0;
 }
@@ -412,7 +450,7 @@ EXPORT_SYMBOL(drm_get_buddy);
  * @is_clear: blocks clear state
  *
  * Reset the clear state based on @is_clear value for each block
- * in the freelist.
+ * in the freetree.
  */
 void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 {
@@ -433,7 +471,7 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 	for (i = 0; i <= mm->max_order; ++i) {
 		struct drm_buddy_block *block;
 
-		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
+		rbtree_reverse_for_each_entry(block, &mm->free_tree[i], rb) {
 			if (is_clear != drm_buddy_block_is_clear(block)) {
 				if (is_clear) {
 					mark_cleared(block);
@@ -641,7 +679,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 	for (i = order; i <= mm->max_order; ++i) {
 		struct drm_buddy_block *tmp_block;
 
-		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
+		rbtree_reverse_for_each_entry(tmp_block, &mm->free_tree[i], rb) {
 			if (block_incompatible(tmp_block, flags))
 				continue;
 
@@ -667,7 +705,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 }
 
 static struct drm_buddy_block *
-alloc_from_freelist(struct drm_buddy *mm,
+alloc_from_freetree(struct drm_buddy *mm,
 		    unsigned int order,
 		    unsigned long flags)
 {
@@ -684,7 +722,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
 			struct drm_buddy_block *tmp_block;
 
-			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
+			rbtree_reverse_for_each_entry(tmp_block, &mm->free_tree[tmp], rb) {
 				if (block_incompatible(tmp_block, flags))
 					continue;
 
@@ -700,10 +738,8 @@ alloc_from_freelist(struct drm_buddy *mm,
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
@@ -771,7 +807,7 @@ static int __alloc_range(struct drm_buddy *mm,
 
 		if (contains(start, end, block_start, block_end)) {
 			if (drm_buddy_block_is_free(block)) {
-				mark_allocated(block);
+				mark_allocated(mm, block);
 				total_allocated += drm_buddy_block_size(mm, block);
 				mm->avail -= drm_buddy_block_size(mm, block);
 				if (drm_buddy_block_is_clear(block))
@@ -849,7 +885,6 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 {
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
-	struct list_head *list;
 	LIST_HEAD(blocks_lhs);
 	unsigned long pages;
 	unsigned int order;
@@ -862,11 +897,10 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
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
@@ -976,7 +1010,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	list_add(&block->tmp_link, &dfs);
 	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
 	if (err) {
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -999,8 +1033,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		return  __drm_buddy_alloc_range_bias(mm, start, end,
 						     order, flags);
 	else
-		/* Allocate from freelist */
-		return alloc_from_freelist(mm, order, flags);
+		/* Allocate from freetree */
+		return alloc_from_freetree(mm, order, flags);
 }
 
 /**
@@ -1017,8 +1051,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
@@ -1120,7 +1154,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			}
 		} while (1);
 
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -1204,7 +1238,7 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 		struct drm_buddy_block *block;
 		u64 count = 0, free;
 
-		list_for_each_entry(block, &mm->free_list[order], link) {
+		rbtree_for_each_entry(block, &mm->free_tree[order], rb) {
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

