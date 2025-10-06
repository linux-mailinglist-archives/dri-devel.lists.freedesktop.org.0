Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0647BBD82A
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 11:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9972210E3DB;
	Mon,  6 Oct 2025 09:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SJbcDeo7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010009.outbound.protection.outlook.com [52.101.85.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB5810E3E0;
 Mon,  6 Oct 2025 09:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TV54Jn4MAOccBtjUezLHU5FLJXPvDzTmyE+0ZVctlgQx+dTfTqD7Q/qNiaupnFewLVkfqDzIzEVTLe8rlo/o5E4Dh8YirXpeh5uS/VnxYZg9WlKAknttZWlqcLTQBIq0I/GMErHKxND96CEh/1qXyA8ylcCfdUajVBWdVrugUvgHy1CCtvCKpxURQXuNC+M8xtW/GuJFZSkEcwxY+JN64/3ZyYr80YQJTpd7kb1GmeKmTM9PdyeshnNQCdjmV7MKytGlUOUUV4yhk/ne5vTVvyFDex96oAe07HbENa7zwYAOlejqRqIRgMzIbQQeOUDce6yOSyvwGwtoLajtnSH+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAPKF/nAFenRBCjHKao3SWxM4aMI7tqmqCmo47VZL0g=;
 b=ZR2Dcoi2RC1lPeleAC3vV8RbXLxkp7s+W+yt1tAOsaX20bn3UbPFUtS++uqz8kG9idF8QDCkH53G1WmkpZ0N4l+R6JoghABcH6oKqtiKNwrc+g8FyciEdxU9xHzia1WBuzBp5lBVNApdDxq8PxJioh5aYdQCF6XSmy45JuVmDZX5CZl2+MDSw2ETcorECdfBXVgfm60rnjlsAKT5Z2jp700mcMeDmoMm6BT1lp3vhqRaANIq/P558H7M7JLPY0UuUuPBswJRUPqIEMf3p1IM4TFymTKfEXikatAsDJqW4ODDubEPYhuFDQFk68RUW3MsJed/HTsvdw18VKslHcOuEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAPKF/nAFenRBCjHKao3SWxM4aMI7tqmqCmo47VZL0g=;
 b=SJbcDeo7/zVqj3HG5d/utYNTmR9CuMXP/D5XFwdYKmoP8/1Pj81u+hOmGNVSjtExiD0P9NVoE02JLBucosOnaGlLtdN/N20ZiLqQX0oZaUGM9HYcCL36Mqm5qXYqnxZ7QFGb3o/Z+9JnSIGzhalbrBlsxpLo1LsSsxXbND42q/U=
Received: from BYAPR06CA0013.namprd06.prod.outlook.com (2603:10b6:a03:d4::26)
 by DS0PR12MB8200.namprd12.prod.outlook.com (2603:10b6:8:f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 09:52:58 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::9e) by BYAPR06CA0013.outlook.office365.com
 (2603:10b6:a03:d4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 09:52:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 09:52:57 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 02:52:53 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <jani.nikula@linux.intel.com>,
 <peterz@infradead.org>, <samuel.pitoiset@gmail.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v8 1/3] drm/buddy: Optimize free block management with RB tree
Date: Mon, 6 Oct 2025 15:21:22 +0530
Message-ID: <20251006095124.1663-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|DS0PR12MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 42cd57fd-e0a9-41f3-6920-08de04be2110
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uiMwe+0VokmGIwQ9YlR603PzvR7sPWeQz++T0MAQK8R6ve4RzQtC5/CTwUNf?=
 =?us-ascii?Q?28vzxGeYMOAExd1zuQTIs08zkOUvwSeV6Rz/87cNI03xLDIHgQIKaPKVyXeE?=
 =?us-ascii?Q?rNTiEzBIqmoZIhTptF7rmRpxPgYn4VIJaAkpL5NCzqKHzLDvRSlYasFO0V1g?=
 =?us-ascii?Q?2l6Uc7sMfLDcP+F/CuMe1dfHzlcGJRrkc4MlRpIuI6e0pgY/FezUwix2A03E?=
 =?us-ascii?Q?JPHsVpyyFGntQsTlnpsYvwKgUbKcCGb8QRoo+4gLl2RSSJHTKKQINO8R8YQe?=
 =?us-ascii?Q?PGb8fNf08fmEBAVfnohCGGPbV12jOG5nMJFmRG8LLc7bIsUagPBhlaw7m3J+?=
 =?us-ascii?Q?ESECtf9HcVCtb0rKLKnLqYIlHrNBvUW6T2QYOpIO7Qnkd4CaFehFhZXJk5Cs?=
 =?us-ascii?Q?qKZh/h3BDP7UXibDHCaURSp43nVMdIRYezPdcjyqcFmDqSysduFw6u+XgQsh?=
 =?us-ascii?Q?XQlzZxehHhGQgbwrDMjkUl5ajFlBBHQLy3ke1h4LKSm3fbf+3C0du6DMB0Q3?=
 =?us-ascii?Q?k2gkL0UPEpTG32fYjn/hG8OKGOwWBBu4VhkUdtlKUSyWyVtHSv5ol6vpq6OK?=
 =?us-ascii?Q?m/lbxo4wkugu7B4orOFQav6p4m8SCsYi9HCNZ0Ykddk3b1h7TIKnWSL8MkgO?=
 =?us-ascii?Q?KolrSgIFvC6qpJgmBlAYwFLTktkh0CL4WwnAlR2awq+x18xsENyDk9z6w+/d?=
 =?us-ascii?Q?Lsy1DVv3SoXDOaguMbaDrDelGk6pOn+2Wmggwiemwm0sv2ktIJsf18VOnBnd?=
 =?us-ascii?Q?8IEmJpOTos+k/eWuSSEEp7rX1xBJpiRfE0//k6gRjKVG4hbv6jVvD1LQWnXi?=
 =?us-ascii?Q?LQnblOUSMnbHUz2MoYCOcUulA1s699OWCgrS1hmf711Ce7wq8ItiwuN2f75X?=
 =?us-ascii?Q?ilxaq/gEE2X7zLTLi8QFDjRgBi1RJmtY3d21Cu7Q4edlrGpKKslueeGSRKyG?=
 =?us-ascii?Q?gQ6YJkB8rINnNefwkPURZWluPM8i8ooUgwzCsninZ114uFgR+IqMj6PnxEWg?=
 =?us-ascii?Q?iJIwf4qBzIn0URD2lL7gHQD1tSiy+C0KCTAeCmvX+567lucbeA28VU/2smB9?=
 =?us-ascii?Q?Bu9PFHy0pl11cgXWopwLqtM2wOx4St+ws/tYi8pVv7H2PYKXUz3eL+3OxVxy?=
 =?us-ascii?Q?c3NDHEkNAmOxOgPW5sHEqJ5BUesUX8t2Nqy/a29K2vLs0aIKZS7/xwnfpVfX?=
 =?us-ascii?Q?76CgPi346s1cmS9ZOdYSdDmmm0E15CDFxeFnrkqJxK1+CvSTgWeRFgoqjmUv?=
 =?us-ascii?Q?v5FFHD5trdxnzdiDsNt+fe7vovhgvOU6NxODfQwBQKltZ5S6WzP0j77iSl90?=
 =?us-ascii?Q?TeZ5PaY4Q5l8eLOvqcnfeRt+bzgoA6RcrXs59j+IWrQXFgbLUFD4iRq3ICv3?=
 =?us-ascii?Q?yGXFaolSXPpKGCd0fsZPHdFKAwSgtatR+vHgbTQrSoLDDySyPx9zW7vIeTqq?=
 =?us-ascii?Q?S0C1BfXAGq0sl9s1QVMbelUxbLQ0YhfgN+x8Tk0baJbPyVVClN6Zep94NqDN?=
 =?us-ascii?Q?r34zqGd+PutE1E70KVTpJyD8u2/Em+Vp25t52cSKYVj+mQOj/7gN3FTEY4Km?=
 =?us-ascii?Q?E0ZzcmFxNEL92CvFKnI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 09:52:57.6876 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cd57fd-e0a9-41f3-6920-08de04be2110
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8200
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

v8(Matthew):
  - Remove the rbtree_is_empty() check in this patch as well.

Cc: stable@vger.kernel.org
Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c | 195 ++++++++++++++++++++++--------------
 include/drm/drm_buddy.h     |  11 +-
 2 files changed, 126 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index a94061f373de..c87210a06c31 100644
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
+
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
 
-	__list_add(&block->link, node->link.prev, &node->link);
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
 
@@ -237,7 +270,7 @@ static int __force_merge(struct drm_buddy *mm,
 int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 {
 	unsigned int i;
-	u64 offset;
+	u64 offset = 0;
 
 	if (size < chunk_size)
 		return -EINVAL;
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
 
@@ -273,9 +306,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 				  sizeof(struct drm_buddy_block *),
 				  GFP_KERNEL);
 	if (!mm->roots)
-		goto out_free_list;
+		goto out_free_tree;
 
-	offset = 0;
 	i = 0;
 
 	/*
@@ -312,8 +344,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
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
@@ -323,7 +355,7 @@ EXPORT_SYMBOL(drm_buddy_init);
  *
  * @mm: DRM buddy manager to free
  *
- * Cleanup memory manager resources and the freelist
+ * Cleanup memory manager resources and the freetree
  */
 void drm_buddy_fini(struct drm_buddy *mm)
 {
@@ -350,7 +382,7 @@ void drm_buddy_fini(struct drm_buddy *mm)
 	WARN_ON(mm->avail != mm->size);
 
 	kfree(mm->roots);
-	kfree(mm->free_list);
+	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -383,7 +415,7 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(block);
+	mark_split(mm, block);
 
 	return 0;
 }
@@ -412,7 +444,7 @@ EXPORT_SYMBOL(drm_get_buddy);
  * @is_clear: blocks clear state
  *
  * Reset the clear state based on @is_clear value for each block
- * in the freelist.
+ * in the freetree.
  */
 void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 {
@@ -431,9 +463,9 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 	}
 
 	for (i = 0; i <= mm->max_order; ++i) {
-		struct drm_buddy_block *block;
+		struct drm_buddy_block *block, *tmp;
 
-		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
+		rbtree_postorder_for_each_entry_safe(block, tmp, &mm->free_tree[i], rb) {
 			if (is_clear != drm_buddy_block_is_clear(block)) {
 				if (is_clear) {
 					mark_cleared(block);
@@ -639,14 +671,18 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
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
@@ -667,7 +703,7 @@ get_maxblock(struct drm_buddy *mm, unsigned int order,
 }
 
 static struct drm_buddy_block *
-alloc_from_freelist(struct drm_buddy *mm,
+alloc_from_freetree(struct drm_buddy *mm,
 		    unsigned int order,
 		    unsigned long flags)
 {
@@ -682,14 +718,18 @@ alloc_from_freelist(struct drm_buddy *mm,
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
@@ -700,13 +740,9 @@ alloc_from_freelist(struct drm_buddy *mm,
 	if (!block) {
 		/* Fallback method */
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
-			if (!list_empty(&mm->free_list[tmp])) {
-				block = list_last_entry(&mm->free_list[tmp],
-							struct drm_buddy_block,
-							link);
-				if (block)
-					break;
-			}
+			block = rbtree_last_entry(mm, tmp);
+			if (block)
+				break;
 		}
 
 		if (!block)
@@ -771,7 +807,7 @@ static int __alloc_range(struct drm_buddy *mm,
 
 		if (contains(start, end, block_start, block_end)) {
 			if (drm_buddy_block_is_free(block)) {
-				mark_allocated(block);
+				mark_allocated(mm, block);
 				total_allocated += drm_buddy_block_size(mm, block);
 				mm->avail -= drm_buddy_block_size(mm, block);
 				if (drm_buddy_block_is_clear(block))
@@ -849,8 +885,8 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 {
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
-	struct list_head *list;
 	LIST_HEAD(blocks_lhs);
+	struct rb_node *iter;
 	unsigned long pages;
 	unsigned int order;
 	u64 modify_size;
@@ -862,11 +898,14 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
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
@@ -891,6 +930,8 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 		}
 		/* Free blocks for the next iteration */
 		drm_buddy_free_list_internal(mm, blocks);
+
+		iter = rb_prev(iter);
 	}
 
 	return -ENOSPC;
@@ -976,7 +1017,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	list_add(&block->tmp_link, &dfs);
 	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
 	if (err) {
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -999,8 +1040,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		return  __drm_buddy_alloc_range_bias(mm, start, end,
 						     order, flags);
 	else
-		/* Allocate from freelist */
-		return alloc_from_freelist(mm, order, flags);
+		/* Allocate from freetree */
+		return alloc_from_freetree(mm, order, flags);
 }
 
 /**
@@ -1017,8 +1058,8 @@ __drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
@@ -1120,7 +1161,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			}
 		} while (1);
 
-		mark_allocated(block);
+		mark_allocated(mm, block);
 		mm->avail -= drm_buddy_block_size(mm, block);
 		if (drm_buddy_block_is_clear(block))
 			mm->clear_avail -= drm_buddy_block_size(mm, block);
@@ -1201,10 +1242,10 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
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

base-commit: a31c6c50da013dcd4de4889d402b47bae552a2e2
-- 
2.34.1

