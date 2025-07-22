Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A31ADB0DAF7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358F410E693;
	Tue, 22 Jul 2025 13:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S5OhyJAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEDE10E689;
 Tue, 22 Jul 2025 13:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+Dx+mD5OswmzxPOKFuSenZO7dSBI1d28oJdyp4FsW0RVdaPXwRXZTsguyJgoB79xPjrSzUPjUyq5HmXGJCUcz3tB4Y/4TEQEg5aciv0BnV040c5XYqPdPOhZUQbLVuZRSx/S9jngcy662nOc10GvxPK+Fze5W2PK0ejOOVOhYrRGtALZZY7aIqSbQnKbpIiUrlGPkMzQezDPUlrHVfwHuZTA6vzdCjzXme5sgR1EVZgjeATBTrBmZ2aIMoToqTiYEvMxYrZ0v/kNASW6bYzZNQRm0kAwdY/8M9P8OUQWeYMGP3uB2n9R9dfJ0aDJfQINXfNStfj+P0s07Gw63gB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xcNpfHgGGKfAh0k0/P8U+yWR17KxIyFQ2dLTCdDgQVY=;
 b=Q1vzlZsNFf3mphW51E1oKJJBC83hlbrbsYOgXiSqZIhTjzctHgQhjtIbY6W1aYRIvCyWwavdMgPG41T4EOJ370O2FwT3KDZzUpJQTtw7WA3kZaePabcQE7PHmLUHxdgtwCoYefq7Z9HobcdLoHfv2b6Kj7KvFuNyaQCKu2LiGz7dZJsA4RFw/A4LDkA06jlxh+cbgHanAQU/XQLdZwaMRT8zcwu7QIn3f2fdzj2ZAsKiEBDUsECLIjwcFrBs/shSybLc7PNUgBou4JlQjAXbnpGUXVD74liaDQUOI3JDUmHz74skAW3QS9qIRvswxPIS7oTq3gtxA3y8YRjTYf9vuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcNpfHgGGKfAh0k0/P8U+yWR17KxIyFQ2dLTCdDgQVY=;
 b=S5OhyJAT1LNuZGJ1oIN2llXaViXgRaeWB7RptKdFHAckvAP5Db6CCqQQMY7IxDIkjTGSygmj+Ce6P1+vqjB4LuOUp6KzwV8jZYv0b2aQ6Nat+IxCUyJynrSoBtQ3XXcVmdTRkOTHBxuLqBRl0SnvaI7HzVgieKRljo69ofbXzN4=
Received: from BLAPR03CA0086.namprd03.prod.outlook.com (2603:10b6:208:329::31)
 by CH3PR12MB9123.namprd12.prod.outlook.com (2603:10b6:610:1a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 13:37:29 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::ac) by BLAPR03CA0086.outlook.office365.com
 (2603:10b6:208:329::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 13:37:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 13:37:29 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 08:37:26 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 2/2] drm/buddy: Separate clear and dirty free block trees
Date: Tue, 22 Jul 2025 19:07:09 +0530
Message-ID: <20250722133709.2191-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250722133709.2191-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250722133709.2191-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|CH3PR12MB9123:EE_
X-MS-Office365-Filtering-Correlation-Id: 474bb3f0-d069-4e5e-20ea-08ddc924e766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yr2DEkMYn34uTp8rViHCYgrFlfodEMeOxdrnL1iNomcHicHfTo7FaUIf/14Q?=
 =?us-ascii?Q?b9diz3JQkhzMz+CebBQZQRofDnD8vum5+W3R4Pq0ddLOk7QdCpx41u6yl6lG?=
 =?us-ascii?Q?WBj03/tO6fWvn+SFhI3uXEAoQN5SgsJNaBn9rvL/wpY6HlsvIwrLdq3P0B3v?=
 =?us-ascii?Q?xkhzAlKA8Ud+nph5k6eBQkeBAeGkf4CMlGtBK3D1188svyOc+d0Obbau/jH4?=
 =?us-ascii?Q?bDN9M7YB+gS2IP95ninLwCs/cFtzRBW+HJHkMzG/gW+IHp2KwCKTj7ELp0CT?=
 =?us-ascii?Q?y02SikQtuAoBg/FDWzuhLDRbeuODkS9q/qpuK5rN9G7CSPF61uH1rS6m2FaM?=
 =?us-ascii?Q?B3xpG+s1oDC5Yt0QfXjdEnJ150F/C+zV/QKJyE8v7bnIZ2EFaF12+zA+AteG?=
 =?us-ascii?Q?6l2kW9F957ftxhM8AXk1yLQ8VrURf0ma8LBnVGEMSs/+Edehi6UPHDxFEHNt?=
 =?us-ascii?Q?5eXvlwtBe0+jBOsfZb+CC9yMeitdHl5nrAIjaQShX+fzA7NjrK0/UE0Wz5sT?=
 =?us-ascii?Q?UpLQd9oZU+OUuw1Xt6KgOeJt8uqlc0maiwxnP1/ds2vGtnMkWL8po0cUtDHz?=
 =?us-ascii?Q?QDDRnvzxiJyHTGXIpRB3BldZ4wKEGvCazPl/PP7uARvLLWavFv6YLN+aXUls?=
 =?us-ascii?Q?qo27Y9SQIP+u6x4OEAfQEgrRJpNU7SZeYScD0uj01awFJEiNl/+wTaAqErKo?=
 =?us-ascii?Q?A6vhbY5rTJU7kRNQHQFHn3naoQ0wXLi4QtCYzYrh1g0BTZ0icqWbfp4rOaym?=
 =?us-ascii?Q?FqeZS37mamFuzgzeuPHUGE/8vzJYZGA6TZAMIp74Gw6bAAYFNv+tDebN3CT2?=
 =?us-ascii?Q?JLW4GlBV32J4LR8xlYqqPwG57ziIJL/pHxXnr/TrcikRMtf7S1oW5TsBlkhj?=
 =?us-ascii?Q?+8OQSLRCXdBrqdmA3yIog0HvxVVTCRUz5qwV6IujBMMnqqqlVrctqaiLq4gN?=
 =?us-ascii?Q?1Hivt3bPi3xFMqHRE44JQdS5+h98ajX6krfcU/yy7GzAxxoTwWRfrpJpZIcZ?=
 =?us-ascii?Q?V9yRWUXcAhsmFdKKxil+0iknXlz54nAFRYKK396/OGop0y+T/0iJ6j/7S8lE?=
 =?us-ascii?Q?n2AcTetnpZ54VUsQWZelKJsDvxF2WVBE3nEW1zwzCM+JCHPl5KZdtxuXyFBi?=
 =?us-ascii?Q?vlnfL8yYPGO4vkGNq/ITo5u//a09DJj/wllSgSk4e6n0LDJrZspvLBZS8jGP?=
 =?us-ascii?Q?jKMk4Tou5mQcOJRtCT9vDQKsjPGDTjOH4H7LwB6JSZ1nxpzy80zJwUpnCXxz?=
 =?us-ascii?Q?+GiJC1onWytZNdTCVR3S8sBMZPo4IwXdlMhszm2qqhMMmlY9dkLOaA1KVDP3?=
 =?us-ascii?Q?t3g4HbEx/PHdA9g0o5falhhQpI93SBerHioR9o1bZosoTdbDEdySGv3uGv4W?=
 =?us-ascii?Q?ivhK4qzdVjeGWAIvk6HPkWpkijFDR66k1zJpMe+Q8HAJ+oCyfM1IPUXQ70Wa?=
 =?us-ascii?Q?rLqAjKMwpLZnpe4ROXkExznQKocXBJ81UqynYekP60w2P+Qh7CYzKyxzy0zY?=
 =?us-ascii?Q?l7VyC2UBMA5Gci6dqW5B25a6L7qkfHSrMpb/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:37:29.4292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 474bb3f0-d069-4e5e-20ea-08ddc924e766
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9123
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 316 ++++++++++++++++++++++--------------
 include/drm/drm_buddy.h     |  15 +-
 2 files changed, 204 insertions(+), 127 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 19e9773b41be..0ffb68474b83 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -43,27 +43,84 @@ static void drm_block_free(struct drm_buddy *mm,
 	kmem_cache_free(slab_blocks, block);
 }
 
+static inline struct rb_root *
+__get_root(struct drm_buddy *mm,
+	   unsigned int order,
+	   enum free_tree tree)
+{
+	if (tree == CLEAR_TREE)
+		return &mm->clear_tree[order];
+	else
+		return &mm->dirty_tree[order];
+}
+
+static inline enum free_tree
+__get_tree_for_block(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_is_clear(block) ? CLEAR_TREE : DIRTY_TREE;
+}
+
+static inline enum free_tree
+__get_tree_for_flags(unsigned long flags)
+{
+	return (flags & DRM_BUDDY_CLEAR_ALLOCATION) ? CLEAR_TREE : DIRTY_TREE;
+}
+
+static inline struct drm_buddy_block *
+rbtree_get_entry(struct rb_node *node)
+{
+	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
+}
+
+static inline struct drm_buddy_block *
+rbtree_prev_entry(struct rb_node *node)
+{
+	return rbtree_get_entry(rb_prev(node));
+}
+
+static inline struct drm_buddy_block *
+rbtree_first_entry(struct rb_root *root)
+{
+	return rbtree_get_entry(rb_first(root));
+}
+
+static inline struct drm_buddy_block *
+rbtree_last_entry(struct rb_root *root)
+{
+	return rbtree_get_entry(rb_last(root));
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
+	root = __get_root(mm, order, tree);
+	link = &root->rb_node;
 
 	while (*link) {
 		parent = *link;
-		node = rb_entry(parent, struct drm_buddy_block, rb);
+		node = rbtree_get_entry(parent);
 
-		if (offset < drm_buddy_block_offset(node))
+		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
 			link = &parent->rb_left;
 		else
 			link = &parent->rb_right;
 	}
 
+	block->tree = tree;
+
 	rb_link_node(&block->rb, parent, link);
 	rb_insert_color(&block->rb, root);
 }
@@ -71,27 +128,15 @@ static void rbtree_insert(struct drm_buddy *mm,
 static void rbtree_remove(struct drm_buddy *mm,
 			  struct drm_buddy_block *block)
 {
+	unsigned int order = drm_buddy_block_order(block);
 	struct rb_root *root;
 
-	root = &mm->free_tree[drm_buddy_block_order(block)];
+	root = __get_root(mm, order, block->tree);
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
@@ -114,10 +159,14 @@ static void mark_allocated(struct drm_buddy *mm,
 static void mark_free(struct drm_buddy *mm,
 		      struct drm_buddy_block *block)
 {
+	enum free_tree tree;
+
 	block->header &= ~DRM_BUDDY_HEADER_STATE;
 	block->header |= DRM_BUDDY_FREE;
 
-	rbtree_insert(mm, block);
+	tree = __get_tree_for_block(block);
+
+	rbtree_insert(mm, block, tree);
 }
 
 static void mark_split(struct drm_buddy *mm,
@@ -212,53 +261,52 @@ static int __force_merge(struct drm_buddy *mm,
 	if (min_order > mm->max_order)
 		return -EINVAL;
 
-	for (i = min_order - 1; i >= 0; i--) {
-		struct drm_buddy_block *block, *prev_block, *first_block;
-
-		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
+	for_each_free_tree() {
+		for (i = min_order - 1; i >= 0; i--) {
+			struct rb_root *root = __get_root(mm, i, tree);
+			struct drm_buddy_block *block, *prev_block;
 
-		for_each_rb_entry_reverse_safe(block, prev_block, &mm->free_tree[i], rb) {
-			struct drm_buddy_block *buddy;
-			u64 block_start, block_end;
+			for_each_rb_entry_reverse_safe(block, prev_block, root, rb) {
+				struct drm_buddy_block *buddy;
+				u64 block_start, block_end;
 
-			if (RB_EMPTY_NODE(&block->rb))
-				break;
+				if (RB_EMPTY_NODE(&block->rb))
+					break;
 
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
+					if (prev_block != rbtree_first_entry(root))
+						prev_block = rbtree_prev_entry(&prev_block->rb);
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
 
@@ -301,14 +349,22 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
 	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
 
-	mm->free_tree = kmalloc_array(mm->max_order + 1,
-				      sizeof(struct rb_root),
-				      GFP_KERNEL);
-	if (!mm->free_tree)
+	mm->clear_tree = kmalloc_array(mm->max_order + 1,
+				       sizeof(struct rb_root),
+				       GFP_KERNEL);
+	if (!mm->clear_tree)
+		return -ENOMEM;
+
+	mm->dirty_tree = kmalloc_array(mm->max_order + 1,
+				       sizeof(struct rb_root),
+				       GFP_KERNEL);
+	if (!mm->dirty_tree)
 		return -ENOMEM;
 
-	for (i = 0; i <= mm->max_order; ++i)
-		mm->free_tree[i] = RB_ROOT;
+	for (i = 0; i <= mm->max_order; ++i) {
+		mm->clear_tree[i] = RB_ROOT;
+		mm->dirty_tree[i] = RB_ROOT;
+	}
 
 	mm->n_roots = hweight64(size);
 
@@ -356,7 +412,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 		drm_block_free(mm, mm->roots[i]);
 	kfree(mm->roots);
 out_free_tree:
-	kfree(mm->free_tree);
+	kfree(mm->clear_tree);
+	kfree(mm->dirty_tree);
 	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_buddy_init);
@@ -393,7 +450,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
 	WARN_ON(mm->avail != mm->size);
 
 	kfree(mm->roots);
-	kfree(mm->free_tree);
+	kfree(mm->clear_tree);
+	kfree(mm->dirty_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -417,15 +475,15 @@ static int split_block(struct drm_buddy *mm,
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
@@ -632,26 +690,22 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
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
-		for_each_rb_entry_reverse(tmp_block, &mm->free_tree[i], rb) {
-			if (block_incompatible(tmp_block, flags))
+		root = __get_root(mm, i, tree);
+		if (!rbtree_is_empty(root)) {
+			block = rbtree_last_entry(root);
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
@@ -672,36 +726,38 @@ alloc_from_freetree(struct drm_buddy *mm,
 		    unsigned long flags)
 {
 	struct drm_buddy_block *block = NULL;
+	struct rb_root *root;
+	enum free_tree tree;
 	unsigned int tmp;
 	int err;
 
+	tree = __get_tree_for_flags(flags);
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
-			for_each_rb_entry_reverse(tmp_block, &mm->free_tree[tmp], rb) {
-				if (block_incompatible(tmp_block, flags))
-					continue;
-
-				block = tmp_block;
-				break;
+			/* Get RB tree root for this order and tree */
+			root = __get_root(mm, tmp, tree);
+			if (!rbtree_is_empty(root)) {
+				block = rbtree_last_entry(root);
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
+			root = __get_root(mm, tmp, tree);
+			if (!rbtree_is_empty(root)) {
+				block = rbtree_last_entry(root);
 				if (block)
 					break;
 			}
@@ -859,34 +915,39 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	if (order == 0)
 		return -ENOSPC;
 
-	if (rbtree_is_empty(mm, order))
+	if (rbtree_is_empty(__get_root(mm, order, CLEAR_TREE)) &&
+	    rbtree_is_empty(__get_root(mm, order, DIRTY_TREE)))
 		return -ENOSPC;
 
-	for_each_rb_entry_reverse(block, &mm->free_tree[order], rb) {
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
+	for_each_free_tree() {
+		struct rb_root *root = __get_root(mm, order, tree);
+
+		for_each_rb_entry_reverse(block, root, rb) {
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
@@ -1198,11 +1259,16 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 
 	for (order = mm->max_order; order >= 0; order--) {
 		struct drm_buddy_block *block;
+		struct rb_root *root;
 		u64 count = 0, free;
 
-		for_each_rb_entry(block, &mm->free_tree[order], rb) {
-			BUG_ON(!drm_buddy_block_is_free(block));
-			count++;
+		for_each_free_tree() {
+			root = __get_root(mm, order, tree);
+
+			for_each_rb_entry(block, root, rb) {
+				BUG_ON(!drm_buddy_block_is_free(block));
+				count++;
+			}
 		}
 
 		drm_printf(p, "order-%2d ", order);
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index a64d108a33b7..afaf62ee05e1 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -14,6 +14,11 @@
 
 #include <drm/drm_print.h>
 
+enum free_tree {
+	CLEAR_TREE = 0,
+	DIRTY_TREE,
+};
+
 #define range_overflows(start, size, max) ({ \
 	typeof(start) start__ = (start); \
 	typeof(size) size__ = (size); \
@@ -23,6 +28,9 @@
 	start__ >= max__ || size__ > max__ - start__; \
 })
 
+#define for_each_free_tree() \
+	for (enum free_tree tree = CLEAR_TREE; tree <= DIRTY_TREE; tree++)
+
 /*
  * for_each_rb_entry() - iterate over an RB tree in order
  * @pos:	the struct type * to use as a loop cursor
@@ -89,9 +97,11 @@ struct drm_buddy_block {
 	 * a list, if so desired. As soon as the block is freed with
 	 * drm_buddy_free* ownership is given back to the mm.
 	 */
-	struct rb_node rb;
 	struct list_head link;
 	struct list_head tmp_link;
+
+	enum free_tree tree;
+	struct rb_node rb;
 };
 
 /* Order-zero must be at least SZ_4K */
@@ -105,7 +115,8 @@ struct drm_buddy_block {
  */
 struct drm_buddy {
 	/* Maintain a free list for each order. */
-	struct rb_root *free_tree;
+	struct rb_root *clear_tree;
+	struct rb_root *dirty_tree;
 
 	/*
 	 * Maintain explicit binary tree(s) to track the allocation of the
-- 
2.34.1

