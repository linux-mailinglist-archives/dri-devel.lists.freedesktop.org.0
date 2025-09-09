Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0FBB4ACE2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 13:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3B010E6DE;
	Tue,  9 Sep 2025 11:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y31fN1S3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2053.outbound.protection.outlook.com [40.107.101.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75CF10E6D9;
 Tue,  9 Sep 2025 11:53:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6cXNrriCMtCMKwjsWrmgSBsAkQf2IYx/4ges0fnU68wdLK44suW6kr8JvEtPUIZRj/OVcpJn6aNkaZjH4ZuTCpkJMl1Suw2kBXi5uJQmeSu0DhJolSQobihBn203OTWB6pihp7NWYsAVMPF8uQjmFo+94mF6I0Oo/VaG7mj0v70Wj2k7/iWoswxZgRtHvfeTI0yNIqqsUKA+K2lDinZGFCpH4xPbXYSbJ9TM/gygv2Rw8JqsP/SQ7CzokY0nvXagQQfQISKdnzYluTFnlJuRagaNbr5d+nJlI1e6AtpCwWUxAgoWIXXnq6Z8cMzs0xqPZWAZRLFEVo0CA+AhaZTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HutAi4hB9aa/6VVVWx9CtgdgmaT/FyZDThX3XLxho4I=;
 b=RGzo2DCO7tqqGHIvh5Hd+nfjtnApt3xTJchxQQnV9deXoB4mdX2/Fs3eXJEsZOtG/lH1qlC5Vzf4h63pgm+VEVkH/6I23Nu3fw6jwH0v/nolzxwrDAzCiBwSlO6EYY1XopNcOChmsZ//J4AkcFlJxWNM3osmj0VxgwRSZ/S5E0J8xJUDLmGUwbPdGOkcp/j+wg8ZFsjAUIJnZsDfpu7ejvY27/ozahKoOziavbUTg3Z1NGcDtwyrnqxXMQjWCuqXRNqJw4tVE3iE06g5ttteekJymNw2qyfkV1OBlx6bfn0OlAKEqFken4RaG67Q+C6pW13xd5Del3aF7EfxF/wxpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HutAi4hB9aa/6VVVWx9CtgdgmaT/FyZDThX3XLxho4I=;
 b=y31fN1S3kPLwBJD/k7jHqMdPddU1xLstOoeJ2roiCGO5bcwpBR+lu0dzup1c8VHX2HVSKNHrpdIES+gSQAT81fG3zi+UOdlD1oa2tCKCE3OhlaqBh4p9CLuWXopy11Jjcl6mWKehlqBbWTlgNb6rPa7FhmmVr1metBF7oBmIwbU=
Received: from MW4PR03CA0003.namprd03.prod.outlook.com (2603:10b6:303:8f::8)
 by SN7PR12MB8818.namprd12.prod.outlook.com (2603:10b6:806:34b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 11:53:03 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:8f:cafe::6b) by MW4PR03CA0003.outlook.office365.com
 (2603:10b6:303:8f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Tue,
 9 Sep 2025 11:53:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 11:53:03 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Sep
 2025 04:52:58 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <jani.nikula@linux.intel.com>, <peterz@infradead.org>,
 <samuel.pitoiset@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v6 2/3] drm/buddy: Separate clear and dirty free block trees
Date: Tue, 9 Sep 2025 17:22:36 +0530
Message-ID: <20250909115237.2644-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909115237.2644-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250909115237.2644-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|SN7PR12MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2c752e-7af0-4b95-e6e2-08ddef976ef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3e6k+aiDdCbkgAd/ErB6tHxmIHJm8fMOKQ2jGg94EZObj0/j9w90U45GUULr?=
 =?us-ascii?Q?E6NGR2YSidHcSvK2+bNhXCsw2aRkpDxliF/yd7TAsRTEQktWuiRi+Xk32Ycy?=
 =?us-ascii?Q?yrfARkkbJGjnX99zBEn3BHBf5obZ3iuTfhkLl7dItYLQ5O+VdK7deyVvtk7f?=
 =?us-ascii?Q?2StqQlhLJRaybIgKa8/+lc3g0htCQhP9vx9X2IZOYA2cB3w75zqOdsqlPDIN?=
 =?us-ascii?Q?5dAS7WOQOu6K4vD0eVJHnfjWL6Ux0rx5z265WAjmP8jW0/kkY/Cd7qD6irTm?=
 =?us-ascii?Q?91mlF5/QTjcz0TvJuIJRwgqxIhyHij08XJg/jrINbkN7HDP0hpcYDyPnj76R?=
 =?us-ascii?Q?ebwsQokNbNPMjWvq/3wn5b9JVT+KPxilBNbB44PFZA7oqQOmBhIK7K2meXlM?=
 =?us-ascii?Q?wrmwrMc1pimwe+CmDi7suy25XzE4tArVsErBbCxvH6cpnRtgHL8bNKulAsyj?=
 =?us-ascii?Q?WHQ+1wFogjVbGQ73/7GBqgrIxEYw6Q+CfStGUYVf7jwn7MH4U3/kNjaExLrX?=
 =?us-ascii?Q?yqkukzfZptwsEGEKIesCLz5uyya42K3lyuULo/uiLg5RGxIzGlrSgjNWvVfe?=
 =?us-ascii?Q?l78NMhvXGFyy9YTHz9B2PmlLi3BemH5JSjuOXMhBDHFx0IEf0fOx9QIcSCty?=
 =?us-ascii?Q?2aNiLvG/gGOHJljo6PykHuWsO/25yfu/hieklh5vN9308dDtPZVQPp+0Rx8I?=
 =?us-ascii?Q?26c8IdqLzaE3AUsQ83QAZbfbldSbdPbQvG04VuMJapGNeQTSjyOVoVQySMXN?=
 =?us-ascii?Q?W4BMovvjq+bIzlaq7uYfYrxJjNz/y3+Ypw+ipXuuXQT9ZVls+mjZObYS8xal?=
 =?us-ascii?Q?Bc6qI+leSPB1lNTpwelXOzOG65xYTiOvsnHCFztY14FJG56iF2NkyMH4KKrU?=
 =?us-ascii?Q?OimZwyMBSGo7zif9yuLtC0EvP/uRIdIZfHmP//hEcnsmg50tzxi/T/MnqDuN?=
 =?us-ascii?Q?6VMCH5FRYP3BF9xlhkvIBVOKs1o/ivQKqSzvGMFN8eV3uWr8qI8A4FodhkrM?=
 =?us-ascii?Q?uLH8jTHY/fxpNmgVp0XlxZ43+esc17eWZXHdiCAba8X20B/MyFtEq08JnBgy?=
 =?us-ascii?Q?Qtd6azRW7MoaqFcUs/dime41R05gYJvdKj1IDJOOTPi3mLqOh+Ijvcai7Uk3?=
 =?us-ascii?Q?SXVUXdVcuK8f3nyGzvmZGZ9hYs/KNnW0DT1IIuMZe5BmpX4YglxX7eTlQj9M?=
 =?us-ascii?Q?z5SdOZ6HqDATAikxhUO0B3fsWhK763vqsXUPST3Kx2w6PmyeW8hYrhT7lxXD?=
 =?us-ascii?Q?uVQV4TaETu9ASCREto5becqHqbm2xCKBvKpBC6riJwb6dDLTuzBCtimtAc6J?=
 =?us-ascii?Q?eD8rTfYYpsRCMQxfa5TPrdVeUBJtnbmBy7FjZRR2eJkWcpnfs2M710UA6M0Y?=
 =?us-ascii?Q?lxTSF42A9fzq50vKMCfIwKhWjYXnwx3/gVpPb81zFrG1OfF51SoUIoXTnlHy?=
 =?us-ascii?Q?E8vV9aOQPdhcQVBQRAm6yLKEZn8eTjX6bBrTn8HESsWHfDfmEUycTA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 11:53:03.5513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2c752e-7af0-4b95-e6e2-08ddef976ef0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8818
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
Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
---
 drivers/gpu/drm/drm_buddy.c | 322 +++++++++++++++++++++---------------
 include/drm/drm_buddy.h     |   2 +-
 2 files changed, 192 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 89f4b49ae3fb..b8aa69270406 100644
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
@@ -45,6 +52,42 @@ static void drm_block_free(struct drm_buddy *mm,
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
 static bool drm_buddy_block_offset_less(const struct drm_buddy_block *block,
 					const struct drm_buddy_block *node)
 {
@@ -59,37 +102,28 @@ static bool rbtree_block_offset_less(struct rb_node *block,
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
@@ -112,10 +146,13 @@ static void mark_allocated(struct drm_buddy *mm,
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
@@ -201,6 +238,7 @@ static int __force_merge(struct drm_buddy *mm,
 			 u64 end,
 			 unsigned int min_order)
 {
+	enum drm_buddy_free_tree tree;
 	unsigned int order;
 	int i;
 
@@ -210,50 +248,49 @@ static int __force_merge(struct drm_buddy *mm,
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
 
@@ -274,7 +311,7 @@ static int __force_merge(struct drm_buddy *mm,
  */
 int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 {
-	unsigned int i;
+	unsigned int i, j;
 	u64 offset;
 
 	if (size < chunk_size)
@@ -296,14 +333,22 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
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
 
@@ -351,7 +396,9 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
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
@@ -387,8 +434,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	WARN_ON(mm->avail != mm->size);
 
+	for (i = 0; i < DRM_BUDDY_MAX_FREE_TREES; i++)
+		kfree(mm->free_trees[i]);
 	kfree(mm->roots);
-	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -412,8 +460,7 @@ static int split_block(struct drm_buddy *mm,
 		return -ENOMEM;
 	}
 
-	mark_free(mm, block->left);
-	mark_free(mm, block->right);
+	mark_split(mm, block);
 
 	if (drm_buddy_block_is_clear(block)) {
 		mark_cleared(block->left);
@@ -421,7 +468,8 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(mm, block);
+	mark_free(mm, block->left);
+	mark_free(mm, block->right);
 
 	return 0;
 }
@@ -454,6 +502,7 @@ EXPORT_SYMBOL(drm_get_buddy);
  */
 void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 {
+	enum drm_buddy_free_tree src_tree, dst_tree;
 	u64 root_size, size, start;
 	unsigned int order;
 	int i;
@@ -468,19 +517,24 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
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
@@ -670,23 +724,17 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
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
 
@@ -710,39 +758,39 @@ alloc_from_freetree(struct drm_buddy *mm,
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
@@ -886,6 +934,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
 	LIST_HEAD(blocks_lhs);
+	enum drm_buddy_free_tree tree;
 	unsigned long pages;
 	unsigned int order;
 	u64 modify_size;
@@ -897,34 +946,39 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
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
@@ -1229,6 +1283,7 @@ EXPORT_SYMBOL(drm_buddy_block_print);
  */
 void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 {
+	enum drm_buddy_free_tree tree;
 	int order;
 
 	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
@@ -1236,11 +1291,16 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 
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

