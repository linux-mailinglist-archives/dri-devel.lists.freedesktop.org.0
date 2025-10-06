Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97C1BBD833
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 11:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93EA10E3D6;
	Mon,  6 Oct 2025 09:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AarXZqbn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011010.outbound.protection.outlook.com [40.107.208.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D9210E3D3;
 Mon,  6 Oct 2025 09:53:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbV0FJuIeJ7/td45nE9voKD4Krk56H6b5mM/LyJ6lRfr8tXehWZiEgsS8t+yRPIwHsoT0rIw53VLg1UvzbY8p5Xbw8esYW/7J3K8mkLjP0orccVFuCZhtO0BytDU191YFSJeFjx+BEeQrMQKSv9NvpabvNtoQOnUx3mcBlWxe89SfrwrvMrIDaZFpU3A5CeHLAn/NP9705Fhfsva3p23PP0hYhnZOJE/IJkpl9MNDEqvg2vH7XgFcSxmjYDZGebQ31e34mkOV34nzSQ+pMh+9xV9kzAwij5rnfNtaqEGOLaYIGPydWMPOu7dWD5hW8HEzg2RZC3KGhK2gMO448q5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6PIPeHk6qzd5dt/PidSkgCiCcj6HFwaFQsx4xiWkes=;
 b=il7Cad0NNIB8skI/vnDSEe/BVZ/GzRRF9xQz7mDJo+qJcGU1/yFksqv6xLr+rZxsMKsPJckVk+iRK9cAlf8iT6ApNWW6cSvWIXChyhI/T5IZRrg+ZQvLBgvK1QDDm2qp8b1v7QAM1U5iLHriHPmZprVA5qAAufKR2hZNUJL1lXW7TFgqDjmCxGAra+fVhM3wWFxIfBBJPATjc8EIYPGX8qRJuOlwWAXoqMW64ffHkatX2hJyA/Y8uzRprLkhoUysmPMMT+NPfTsnUxAWwdKHpxIO19nX10LHmyRuqcL2KKkKaujKY7eul4W3L9qWjzpQ27/jGBuO4NHobvOk9vlaPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6PIPeHk6qzd5dt/PidSkgCiCcj6HFwaFQsx4xiWkes=;
 b=AarXZqbn7+qA9Xpc0eoZl8PEUl71vHFjyT/SzQnI4e/gpqVyhaSrPzsM4/k4eQvB9DYLGyFWcTomZdsiAio4IGxEP8lwZz0HNGvcnR8hyZZNTHEB9N1EXnhJuVEV6GGWVIVmlR5oh8xigrxcSfIoAjvvK4LBpO1fX8SHEfytqV8=
Received: from BYAPR08CA0072.namprd08.prod.outlook.com (2603:10b6:a03:117::49)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 09:53:01 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::9b) by BYAPR08CA0072.outlook.office365.com
 (2603:10b6:a03:117::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 09:53:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 09:53:01 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 02:52:57 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <jani.nikula@linux.intel.com>,
 <peterz@infradead.org>, <samuel.pitoiset@gmail.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH v8 2/3] drm/buddy: Separate clear and dirty free block trees
Date: Mon, 6 Oct 2025 15:21:23 +0530
Message-ID: <20251006095124.1663-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006095124.1663-1-Arunpravin.PaneerSelvam@amd.com>
References: <20251006095124.1663-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|DM6PR12MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: 15d806c9-ab02-4d92-f647-08de04be234c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A9UpYG3Ci7R4xrtn40IqDJdFTr7jaWYgwekvBUBGjYrGogmaoejLfefdMebV?=
 =?us-ascii?Q?0uIAFgN1ymRDryiRLcd649UR0YVSxiGERMFgQspz4rss0xRxIeOSTh+44Qk+?=
 =?us-ascii?Q?KhliBvPna7Mt1EhV4gIEh7Dtpiw6MMZQ/TCk2h7bzQy5JK9vRi6aRjFDNNzw?=
 =?us-ascii?Q?UYKERlkbtWDZGzlYPhxCr866rKU8I6kxuk7ghYujxRZPZXUM9K2tuqePAn7y?=
 =?us-ascii?Q?t0e3AHOwNIEmpbbqXD7Wf4770blHwDJFjY6U2TSCekudRKTy7/vCmL4/0LhO?=
 =?us-ascii?Q?6wnH0NLnjVtubNb70pQQVSC+0eOmHB6Wg6GT7fGuTIAgNAdek83FQHvK/NDL?=
 =?us-ascii?Q?I0UqlkJvmW5f47KNvfr/N0s5hKJrxu8SHzHLND9WWu9dUmEasN2TTENm9rg9?=
 =?us-ascii?Q?ec/WwuXT7rl2SjlapixmrvvPMALzcua3bxQ3M0HxkEKfcD1Osv/RN13neZXd?=
 =?us-ascii?Q?Mc6Hdz2WV1Ps4HMSzmIPhZ3PM8JsjiB8i95scMYJ7OxPtlIK+A4txvFM3QwF?=
 =?us-ascii?Q?XGyn7IQGD4gwTc6mBmK3/0u5vA978ZC9UwCfR/VhbZ9Honq8QAji2C9R97e1?=
 =?us-ascii?Q?rJlaZ1NBDGJHAzEw8dAMj4mwzQSQMpoiodmGUv+9nyZzQJxCyNOOjmpZ1bjg?=
 =?us-ascii?Q?xo2dulwaVT9LrnQLbN1KalsbKvCtYXvil4yxDG/Bq6M59SWKXUFZDt5/ACxP?=
 =?us-ascii?Q?D3F/+rdm5sxJaxVPvSPrZBVR3U8giIORiZw/czAi0ExLc2YuUKluFO4SS0Fp?=
 =?us-ascii?Q?9fM8mMQrgDrvyfYh1s2XJPsLnkxaMi88vPxI3mnIvaHPI0cLyaitWhFjwd9f?=
 =?us-ascii?Q?c7TCM8dQg/2YSPYvEBE2+wrHJcHUCdIE7p89Ta/PLaUIXRcqAbAVTJce07zf?=
 =?us-ascii?Q?Ulyp1qJGxRjzd34f9cTRLTOAtv7xWRzTqPhHSerQ1NaBS+lXsdCgSTV1nu6m?=
 =?us-ascii?Q?08XSLmIXfcRIWQTS+nJgn3ogmeAXYRUs0Oa3rg+CXbOfNW/K37CQ+vAXxLYb?=
 =?us-ascii?Q?NLTQKR8APh1Xs7Lz9jvpN45QoJIlWVg91FQTiCAR7xa77vubPeWSNxtRimBG?=
 =?us-ascii?Q?sM8hbYlQF20efhKrZ4oil/ezEQkH65nNwB8YsyM6/H6/sCKWh1FPN1bS8zET?=
 =?us-ascii?Q?yzx0o18bccTMJLfG5Sy1CN+mGAwx6nCAeAvzU8vJSRSB0VWNHfXt4uElhk7z?=
 =?us-ascii?Q?lFV4cmTYW8PTg33x+4YsaI/9iRJnRZzsQ5YQ9Ogd9KK0VEiAQneUsy7sSoqu?=
 =?us-ascii?Q?dvgbJSayKdXdt+JnpD9pYM2p1xAGxgX4JcGKDeaUthtDX/CxTn+6xYUfNqO3?=
 =?us-ascii?Q?8vFKblH5K7UNtp+6S6OirJpKSQDfPCAzpqXfYshLVXUKQIJh0p0aqiG1DZDV?=
 =?us-ascii?Q?ekvVkbfcJFGyY0+rYDRgq9oZcH3XSX/l/BvejrEGzrfsBqqk/KPChVutgrTU?=
 =?us-ascii?Q?lUstJzzt0eySNCQfCfuFFHkyEMFHCzxxwGa3pfIewb6pQcF8QU3HO7gQvY6b?=
 =?us-ascii?Q?8BBIL4ceGSWLuwwHpx01qnFzwJE5hYktEPIGVJLhKhzkqgsi83mtG3bkymB4?=
 =?us-ascii?Q?BNlRNXNUQq4lLHbKHK0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 09:53:01.4394 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d806c9-ab02-4d92-f647-08de04be234c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420
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

v7(Matthew):
  - Replace the open-coded tree iteration for loops with the
    for_each_free_tree() macro throughout the code.
  - Fixed out_free_roots to prevent double decrement of i,
    addressing potential crash.
  - Replaced enum drm_buddy_free_tree with unsigned int
    in for_each_free_tree loops.

Cc: stable@vger.kernel.org
Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
---
 drivers/gpu/drm/drm_buddy.c | 333 ++++++++++++++++++++----------------
 include/drm/drm_buddy.h     |   2 +-
 2 files changed, 188 insertions(+), 147 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index c87210a06c31..f2c92902e4a3 100644
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
+	enum drm_buddy_free_tree tree;
 	struct rb_root *root;
 
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
@@ -201,7 +226,7 @@ static int __force_merge(struct drm_buddy *mm,
 			 u64 end,
 			 unsigned int min_order)
 {
-	unsigned int order;
+	unsigned int tree, order;
 	int i;
 
 	if (!min_order)
@@ -210,45 +235,48 @@ static int __force_merge(struct drm_buddy *mm,
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
 
@@ -269,7 +297,7 @@ static int __force_merge(struct drm_buddy *mm,
  */
 int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 {
-	unsigned int i;
+	unsigned int i, j, root_count = 0;
 	u64 offset = 0;
 
 	if (size < chunk_size)
@@ -291,14 +319,22 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
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
+	for_each_free_tree(i) {
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
 
@@ -308,8 +344,6 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 	if (!mm->roots)
 		goto out_free_tree;
 
-	i = 0;
-
 	/*
 	 * Split into power-of-two blocks, in case we are given a size that is
 	 * not itself a power-of-two.
@@ -328,24 +362,26 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
 		mark_free(mm, root);
 
-		BUG_ON(i > mm->max_order);
+		BUG_ON(root_count > mm->max_order);
 		BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
 
-		mm->roots[i] = root;
+		mm->roots[root_count] = root;
 
 		offset += root_size;
 		size -= root_size;
-		i++;
+		root_count++;
 	} while (size);
 
 	return 0;
 
 out_free_roots:
-	while (i--)
-		drm_block_free(mm, mm->roots[i]);
+	while (root_count--)
+		drm_block_free(mm, mm->roots[root_count]);
 	kfree(mm->roots);
 out_free_tree:
-	kfree(mm->free_tree);
+	while (i--)
+		kfree(mm->free_trees[i]);
+	kfree(mm->free_trees);
 	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_buddy_init);
@@ -381,8 +417,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	WARN_ON(mm->avail != mm->size);
 
+	for_each_free_tree(i)
+		kfree(mm->free_trees[i]);
 	kfree(mm->roots);
-	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -406,8 +443,7 @@ static int split_block(struct drm_buddy *mm,
 		return -ENOMEM;
 	}
 
-	mark_free(mm, block->left);
-	mark_free(mm, block->right);
+	mark_split(mm, block);
 
 	if (drm_buddy_block_is_clear(block)) {
 		mark_cleared(block->left);
@@ -415,7 +451,8 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(mm, block);
+	mark_free(mm, block->left);
+	mark_free(mm, block->right);
 
 	return 0;
 }
@@ -448,6 +485,7 @@ EXPORT_SYMBOL(drm_get_buddy);
  */
 void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 {
+	enum drm_buddy_free_tree src_tree, dst_tree;
 	u64 root_size, size, start;
 	unsigned int order;
 	int i;
@@ -462,19 +500,24 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
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
@@ -664,27 +707,17 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
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
 
@@ -708,39 +741,37 @@ alloc_from_freetree(struct drm_buddy *mm,
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
-			block = rbtree_last_entry(mm, tmp);
+			root = &mm->free_trees[tree][tmp];
+			block = rbtree_last_free_block(root);
 			if (block)
 				break;
 		}
@@ -885,10 +916,9 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 {
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
+	unsigned int tree, order;
 	LIST_HEAD(blocks_lhs);
-	struct rb_node *iter;
 	unsigned long pages;
-	unsigned int order;
 	u64 modify_size;
 	int err;
 
@@ -898,40 +928,45 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	if (order == 0)
 		return -ENOSPC;
 
-	if (rbtree_is_empty(mm, order))
-		return -ENOSPC;
+	for_each_free_tree(tree) {
+		struct rb_root *root;
+		struct rb_node *iter;
 
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
+		root = &mm->free_trees[tree][order];
+		if (rbtree_is_empty(root))
+			continue;
+
+		iter = rb_last(root);
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
@@ -1243,11 +1278,17 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 
 	for (order = mm->max_order; order >= 0; order--) {
 		struct drm_buddy_block *block, *tmp;
+		struct rb_root *root;
 		u64 count = 0, free;
+		unsigned int tree;
+
+		for_each_free_tree(tree) {
+			root = &mm->free_trees[tree][order];
 
-		rbtree_postorder_for_each_entry_safe(block, tmp, &mm->free_tree[order], rb) {
-			BUG_ON(!drm_buddy_block_is_free(block));
-			count++;
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

