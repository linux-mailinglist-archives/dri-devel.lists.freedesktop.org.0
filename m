Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC798B0DAFB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E1910E689;
	Tue, 22 Jul 2025 13:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K8BFTC4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D2910E691;
 Tue, 22 Jul 2025 13:37:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guEckM1j9cs/x1gIJaJNfHPrD6WRsX2djKs6MbBU0VhtQhrGV9QDEJT6aLdtuyBfEUVBSviynJr7tQq3Cs8GT/EwifmMIupVTuBZ7hqN1VKGs3I9acCkouBUJDyk95ZZlrbUiZw4YPvk5UU0BqNL7lqOPSNpsMLSmH36ShLDs1/nTj788LO6FpzDLkY0Nvm4TzzpEDet5N/Jmu+TclN+89jKsG162N9hcuu3RP3oUBYjav6lPnWpeMPvCWUU0XQBqBELGTXoR38dxL7IkIH3dQYtk/EplMDPtUXxNd2V5FlYAgIf6XaR4D5oL6IniIa5VomspsPMiO8uhBkB0MyzHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0a9MuWZVbMqTZ8RnZTa23edb6CFp9sZOlmo8p/kY3w=;
 b=hm0K1WdJDgBf/B6C7RHFf9+u6N4evnLMMCKKJX05NbB1ksG6DlpHrZHc3RNKW4OF8xCNTMfFyUyUv3qX2INHABQZQyTwgnxvKOZXlnTubOpbIOj7x6nGb39zNDkBgdxvKgzxuW1qEqLG/SbwyfCx9QpH4P894tOxa0+3Cbz3+iyNm7QaCM1aZnu7li9fiGCV2dxPsBo8ghdppvfNpHMXkZtzctDQa5P+Y1noqb79IXnujWPt895eDUDM0KA3O2RW68yj4j0JTT3O5QCMVf4uSu4h7gpg0ThBBTBirLXfldrMhRWDHaBfPXuIAbNCqOWFrgAb6RDcdVyRQk7LghQ1AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0a9MuWZVbMqTZ8RnZTa23edb6CFp9sZOlmo8p/kY3w=;
 b=K8BFTC4M9Okjqu03WXmACzBxhPH5nsQJ7cvPny+znkRGa/tlf3+vn8vDyTMbUMMyPvoqJZ8p4s5dHI30yBJuPBCbCK8mQkZWsQFDkCd9/fmSmnKiyaagoedJY6qnoJNbGY15Y7avogM19AGJD4ueSFMr3oeA9wqbTFdS8p5JQ4c=
Received: from BN9PR03CA0565.namprd03.prod.outlook.com (2603:10b6:408:138::30)
 by SJ2PR12MB8183.namprd12.prod.outlook.com (2603:10b6:a03:4f4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 22 Jul
 2025 13:37:27 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:408:138:cafe::c0) by BN9PR03CA0565.outlook.office365.com
 (2603:10b6:408:138::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.27 via Frontend Transport; Tue,
 22 Jul 2025 13:37:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 13:37:26 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 08:37:24 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 1/2] drm/buddy: Optimize free block management with RB tree
Date: Tue, 22 Jul 2025 19:07:08 +0530
Message-ID: <20250722133709.2191-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|SJ2PR12MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: 6086a53a-de51-4d2f-86cc-08ddc924e5c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cg4ieeoyN1H+lZ5E+b00zT4Qa/eVc8b4Nrgg9XZv+x6jpLjLGAqZ41Q1aarr?=
 =?us-ascii?Q?WWqY76YUcjQmNl/bOShKKiN4ha/gg+N6A3OOFhXi/NCygu0/az2dwb6tHlAF?=
 =?us-ascii?Q?mv+vcFHALyJldarjMM9QA/GrdXcWGCCky5+Z+C8TBS3Gk2OeLdD5aT1c9CoM?=
 =?us-ascii?Q?insE8JngomMBO6unTsYz9gNnxE1E0SeDYF5Md/F0vBguQV3HVwI0C2mWUkKQ?=
 =?us-ascii?Q?va5Hoy3nm0OZDdIEcqB/158S14FwzOF5LD1wxxNeDfGcTP08GA6492oaeNwl?=
 =?us-ascii?Q?64uRWGUA52zeJX7h5SOFdL4MG22uiE06BJgJ0F9UdVZUb/fHFJ3ijUzCbCKX?=
 =?us-ascii?Q?5GYLzONyXHEBe0zCopbdwVJ7EkhfWe3/71z8oUhUfTGlGZZ7gXw5uYNZgy3w?=
 =?us-ascii?Q?kfEMEu9EyMns2bfcr2BNhxN9jKir84mPlHDcGN2pjYIk4Hd5jLiPW2FPBx91?=
 =?us-ascii?Q?GtMFIaPIZa560P0O4YfsrYCOgQmLd1a9y3zmv4+PCYnv5bH7A6YwsCP9TU4D?=
 =?us-ascii?Q?SgKupywEgueyplkAc30Y+lRbZDkoGWu9KryemzENITV9+x8porDUncnKAjoZ?=
 =?us-ascii?Q?M9FOqKXHyFPaXsyyEQVT183f5YIW4ZQohQ/w2Z/ngv7/anYoiIzbEd7PrAX6?=
 =?us-ascii?Q?iUnnZFGCBcN3iSVTz2nNSA4uT0r4yW5gTB21JR/ZhOfvvOStQ5DhM5v9jRFV?=
 =?us-ascii?Q?ewGMlK3PUzAXdi+WQ79GqrtS+rso00Cj7xo3/dp89j5gF2Sdgx9XCPVdXkdS?=
 =?us-ascii?Q?bY23GHSJOej4flRzaK/viOOc33kdTkCc0FKhBlJSpJNnH7feJhFc8820mLX8?=
 =?us-ascii?Q?41fR5/G/ZEkblboP3zjiRxWlwmbSqS9b1yRQmW+V2Vb46DHfvKG81lvJR6eh?=
 =?us-ascii?Q?hPS2N6MFSYh1/4hMv9Y7rLMZOdchfTGTFKnVT1Nc70JUnN67MYnGoHu2sSxS?=
 =?us-ascii?Q?c4hQ4EBZ4G629UdJI+R162nEb6tLDUek05nE7P8J3uE6pq5BZkLYp2VDMWVK?=
 =?us-ascii?Q?5uqq71+fgTjYuOLlIUBn346r/DUXyhdUoUkTIzUH/U64fcTZYzZwjggpzNNU?=
 =?us-ascii?Q?ylOyt1wuF/S8FpYHx4gu28MjNYZ6jFnoNo8tFF9Yx4j8cCpNrdoeOS9ZNbjS?=
 =?us-ascii?Q?uXdlzjfkumcrpf2GQ/JCK+kfEAbRU0x6cPghi2vsBj3w5TKswwCasAExpbw9?=
 =?us-ascii?Q?F9tamsEU5pqifQlShGLnI5fnNsLtNaAUjtrUUjhL8QR+NTTuenJYWlxEm4TX?=
 =?us-ascii?Q?prPVBunlFdl1jq53S80494zVrhAxtwI32YYVpuf/5+W9Q+iexHmwi7WTqSgs?=
 =?us-ascii?Q?CP93/J6ckc+cykhJtIOjVi4pKu32uMeexr/VWH+KihlceWJxDKbhBhBdCnl0?=
 =?us-ascii?Q?sKFHUhW6SJPblwPeUxM8FPbzbvy0XiNRlnGSG9+FQcr2vddeNxn0VxwSX8ye?=
 =?us-ascii?Q?q45fShIe6h5QX7iM7NQ3GsWABFVEGX/3VpBO4wVsl1WAjkTFhlxffo8zcOTa?=
 =?us-ascii?Q?UyjHWIcat2Fdx++tGmLw3iHD8VKf2HkjsAWC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:37:26.6713 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6086a53a-de51-4d2f-86cc-08ddc924e5c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8183
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 141 +++++++++++++++++++++++-------------
 include/drm/drm_buddy.h     |  39 +++++++++-
 2 files changed, 128 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a1e652b7631d..19e9773b41be 100644
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
 
-	__list_add(&block->link, node->link.prev, &node->link);
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
 
@@ -179,12 +213,17 @@ static int __force_merge(struct drm_buddy *mm,
 		return -EINVAL;
 
 	for (i = min_order - 1; i >= 0; i--) {
-		struct drm_buddy_block *block, *prev;
+		struct drm_buddy_block *block, *prev_block, *first_block;
+
+		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
 
-		list_for_each_entry_safe_reverse(block, prev, &mm->free_list[i], link) {
+		for_each_rb_entry_reverse_safe(block, prev_block, &mm->free_tree[i], rb) {
 			struct drm_buddy_block *buddy;
 			u64 block_start, block_end;
 
+			if (RB_EMPTY_NODE(&block->rb))
+				break;
+
 			if (!block->parent)
 				continue;
 
@@ -206,10 +245,14 @@ static int __force_merge(struct drm_buddy *mm,
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
 
@@ -258,14 +301,14 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
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
 
@@ -273,7 +316,7 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 				  sizeof(struct drm_buddy_block *),
 				  GFP_KERNEL);
 	if (!mm->roots)
-		goto out_free_list;
+		goto out_free_tree;
 
 	offset = 0;
 	i = 0;
@@ -312,8 +355,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
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
@@ -323,7 +366,7 @@ EXPORT_SYMBOL(drm_buddy_init);
  *
  * @mm: DRM buddy manager to free
  *
- * Cleanup memory manager resources and the freelist
+ * Cleanup memory manager resources and the freetree
  */
 void drm_buddy_fini(struct drm_buddy *mm)
 {
@@ -350,7 +393,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 	WARN_ON(mm->avail != mm->size);
 
 	kfree(mm->roots);
-	kfree(mm->free_list);
+	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -383,7 +426,7 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(block);
+	mark_split(mm, block);
 
 	return 0;
 }
@@ -598,7 +641,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 	for (i = order; i <= mm->max_order; ++i) {
 		struct drm_buddy_block *tmp_block;
 
-		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
+		for_each_rb_entry_reverse(tmp_block, &mm->free_tree[i], rb) {
 			if (block_incompatible(tmp_block, flags))
 				continue;
 
@@ -624,7 +667,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 }
 
 static struct drm_buddy_block *
-alloc_from_freelist(struct drm_buddy *mm,
+alloc_from_freetree(struct drm_buddy *mm,
 		    unsigned int order,
 		    unsigned long flags)
 {
@@ -641,7 +684,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
 			struct drm_buddy_block *tmp_block;
 
-			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
+			for_each_rb_entry_reverse(tmp_block, &mm->free_tree[tmp], rb) {
 				if (block_incompatible(tmp_block, flags))
 					continue;
 
@@ -657,10 +700,8 @@ alloc_from_freelist(struct drm_buddy *mm,
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
@@ -728,7 +769,7 @@ static int __alloc_range(struct drm_buddy *mm,
 
 		if (contains(start, end, block_start, block_end)) {
 			if (drm_buddy_block_is_free(block)) {
-				mark_allocated(block);
+				mark_allocated(mm, block);
 				total_allocated += drm_buddy_block_size(mm, block);
 				mm->avail -= drm_buddy_block_size(mm, block);
 				if (drm_buddy_block_is_clear(block))
@@ -806,7 +847,6 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 {
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
-	struct list_head *list;
 	LIST_HEAD(blocks_lhs);
 	unsigned long pages;
 	unsigned int order;
@@ -819,11 +859,10 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	if (order == 0)
 		return -ENOSPC;
 
-	list = &mm->free_list[order];
-	if (list_empty(list))
+	if (rbtree_is_empty(mm, order))
 		return -ENOSPC;
 
-	list_for_each_entry_reverse(block, list, link) {
+	for_each_rb_entry_reverse(block, &mm->free_tree[order], rb) {
 		/* Allocate blocks traversing RHS */
 		rhs_offset = drm_buddy_block_offset(block);
 		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
@@ -933,7 +972,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	list_add(&block->tmp_link, &dfs);
 	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
 	if (err) {
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -956,8 +995,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		return  __drm_buddy_alloc_range_bias(mm, start, end,
 						     order, flags);
 	else
-		/* Allocate from freelist */
-		return alloc_from_freelist(mm, order, flags);
+		/* Allocate from freetree */
+		return alloc_from_freetree(mm, order, flags);
 }
 
 /**
@@ -974,8 +1013,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
@@ -1077,7 +1116,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			}
 		} while (1);
 
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -1161,7 +1200,7 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 		struct drm_buddy_block *block;
 		u64 count = 0, free;
 
-		list_for_each_entry(block, &mm->free_list[order], link) {
+		for_each_rb_entry(block, &mm->free_tree[order], rb) {
 			BUG_ON(!drm_buddy_block_is_free(block));
 			count++;
 		}
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 9689a7c5dd36..a64d108a33b7 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -10,6 +10,7 @@
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
+#include <linux/rbtree.h>
 
 #include <drm/drm_print.h>
 
@@ -22,6 +23,41 @@
 	start__ >= max__ || size__ > max__ - start__; \
 })
 
+/*
+ * for_each_rb_entry() - iterate over an RB tree in order
+ * @pos:	the struct type * to use as a loop cursor
+ * @root:	pointer to struct rb_root to iterate
+ * @member:	name of the rb_node field within the struct
+ */
+#define for_each_rb_entry(pos, root, member) \
+	for (pos = rb_entry_safe(rb_first(root), typeof(*pos), member); \
+	     pos; \
+	     pos = rb_entry_safe(rb_next(&(pos)->member), typeof(*pos), member))
+
+/*
+ * for_each_rb_entry_reverse() - iterate over an RB tree in reverse order
+ * @pos:	the struct type * to use as a loop cursor
+ * @root:	pointer to struct rb_root to iterate
+ * @member:	name of the rb_node field within the struct
+ */
+#define for_each_rb_entry_reverse(pos, root, member) \
+	for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member); \
+	     pos; \
+	     pos = rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member))
+
+/**
+ * for_each_rb_entry_reverse_safe() - safely iterate over an RB tree in reverse order
+ * @pos:	the struct type * to use as a loop cursor.
+ * @n:		another struct type * to use as temporary storage.
+ * @root:	pointer to struct rb_root to iterate.
+ * @member:	name of the rb_node field within the struct.
+ */
+#define for_each_rb_entry_reverse_safe(pos, n, root, member) \
+	for (pos = rb_entry_safe(rb_last(root), typeof(*pos), member), \
+	     n = pos ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member) : NULL; \
+	     pos; \
+	     pos = n, n = pos ? rb_entry_safe(rb_prev(&(pos)->member), typeof(*pos), member) : NULL)
+
 #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
 #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
 #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
@@ -53,6 +89,7 @@ struct drm_buddy_block {
 	 * a list, if so desired. As soon as the block is freed with
 	 * drm_buddy_free* ownership is given back to the mm.
 	 */
+	struct rb_node rb;
 	struct list_head link;
 	struct list_head tmp_link;
 };
@@ -68,7 +105,7 @@ struct drm_buddy_block {
  */
 struct drm_buddy {
 	/* Maintain a free list for each order. */
-	struct list_head *free_list;
+	struct rb_root *free_tree;
 
 	/*
 	 * Maintain explicit binary tree(s) to track the allocation of the
-- 
2.34.1

