Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC86B39ABE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 12:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E935B10E974;
	Thu, 28 Aug 2025 10:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="czOQXYcN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2069.outbound.protection.outlook.com [40.107.100.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B016210E322;
 Thu, 28 Aug 2025 10:57:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuAhvEl4mVgvviMdv5RGmxn8k1AA4fRcm3Vx2FEom3uVEJxyYifuHTtfBENX/jo4CcEW7G6x5PjwQ3kP6ZUgeGLptKA8sJsPsohuO2GNhbfTkO0KgDUpl42fhxwf3A90+XjmZwgEtYh+5tTuf2UR6twAWewf7ont5ni4wvBwTGe9/ENCtdQWY8l59sFlYkWnTB44AsfwybOFaBpu8it9NFfUmsazbAIn8tV5L5XWxyjjC9W/DadcWre7skfxrmamGXkqr+QGMNG7r6Wt1mi/KKjet8bLcg5nisSLn41Sp7ezXEkchknTGmEZTPouBWHOapvQzEsu62ROKj/24WdR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f91HfclTE5uEq09VL3u/JVVH9Udyrns7bNaGBP/KWGA=;
 b=tcOaycDXSalizoLRr+iodtok1e/YwiXAe2oy5+urRYQNBlKjAMZUJHli3IE/1mXc7TcmzMSXVQRBraOgNLywQ3K1MCDQaPQMDvH3Kn0DbOSdR6HVJhRVNz6SY58Br0t77y+Pqj0MrjlYKDX1tx4P9f953fs5LbybnAQEtj7uN2Z/9yDWU5uaXh2ZI+SKXnkyn027zOZ9TL/P3YcCWpnrWman1Ut5MjSnEkMt7N16PGIbh3AG7NsxJS2pQFyURxg01duufvtWfn99jyI9E9Q9nO64cTaCi4WTWp0+BClJWOLb+jsnZWIeY7g8OWpHmVZy+HbAfnkW5kbGUB3B5t/rCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f91HfclTE5uEq09VL3u/JVVH9Udyrns7bNaGBP/KWGA=;
 b=czOQXYcNMBXLOKupQ8oBHtpM78yCAe6T/JOwMuVaWTpVLIe48QEHwiV4XMCN0AT7zwuaSkS1FQcyu2o3/EfQqH6g3I5tI5KB2pZJId3cMWm20CEjyaPFiaGJTjtoa98KVLN8bQXnV/g3VDNUkexULsWI1V7dG93uzXOXaC831vo=
Received: from BY5PR03CA0001.namprd03.prod.outlook.com (2603:10b6:a03:1e0::11)
 by DM4PR12MB5724.namprd12.prod.outlook.com (2603:10b6:8:5f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.22; Thu, 28 Aug 2025 10:57:14 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::8) by BY5PR03CA0001.outlook.office365.com
 (2603:10b6:a03:1e0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Thu,
 28 Aug 2025 10:57:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 10:57:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:57:13 -0500
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 28 Aug
 2025 03:57:10 -0700
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v4 2/2] drm/buddy: Separate clear and dirty free block trees
Date: Thu, 28 Aug 2025 16:26:46 +0530
Message-ID: <20250828105646.2280-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828105646.2280-1-Arunpravin.PaneerSelvam@amd.com>
References: <20250828105646.2280-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|DM4PR12MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ff4923-b15e-4463-99a1-08dde621a59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6XL3FviiObGkF2Kmh7aZ3A2JZHc04zsElF3IIJnKmWUdX5Otjri8TRQqJRTp?=
 =?us-ascii?Q?IXNR5GtESbhfNUsOCDUB+j99C72NMT7aPrSiV4OihT9Su7PMEsc7qSxKmmaE?=
 =?us-ascii?Q?BSWiyKusmzJeb50ouGqYXJRl5daQdfHoX2Z8aklapUChhtYQ78AyJBmDPcUq?=
 =?us-ascii?Q?1El9g00JiarLqMqpCEnAZUUMx3XDyWLMTSN7QdHMB16ZW5iTQkLsHhEuxkRe?=
 =?us-ascii?Q?HsI4FVqrQ3ySde5NHwtOqQWYkg9cQeIeNRjXjpaZZC/+UTMte40+ZMGX61/7?=
 =?us-ascii?Q?50SRGDs/caT9i5IkpBBeBxDbZQZaGrALXbmzZB///7OjINyNYgcaqczuHUcq?=
 =?us-ascii?Q?Ng6hMtPBeInCY56JU2Cb5o83c7ZX5Tvp0cBv9Wo5qubn30LtxQfxLfDtfLVx?=
 =?us-ascii?Q?qRviwEYGIL0g2HL9+wQ0BjoHXRpT7DlKhJLfvq5HsbqAG41mIUzAjPMt90kA?=
 =?us-ascii?Q?i5zk5UVWK6ceelsJxp4gQzx51gRjwUS0BKhf/pVeioz00iXgah0hYf32H0Jy?=
 =?us-ascii?Q?CTDsHrXCe2/cnCQ+QZI/wjbbCLddKN1gnBoWwGoCo03XzcXKeGm8uEJFiPrt?=
 =?us-ascii?Q?wLfVXbvXBoZyGfqxtS8cdEdvAFzLaBhkLbTnrICW9R9ClSyImPY9yrXkjPyf?=
 =?us-ascii?Q?jb/9OPGKIi24oWD6t7qn4q2+CF5CB4M2DKaB2561+co0XC2OzSif27frzRkM?=
 =?us-ascii?Q?bfaxpNjBKXNIXilfIAPjbt2TN8y4qXOgWHMzAFUcsC6d2xEJ9y39ctJi/sT3?=
 =?us-ascii?Q?t5m3UPLFFc15YcOj2LdVA18ptxosgHG2ilKAhEeM5tST310xBVEQUs6R9Rtl?=
 =?us-ascii?Q?smmGTFvoXL+kRdecjovRpnwaXhCyJMPiZWamJWhzxaHOF6NiKdI0dbXEPnWt?=
 =?us-ascii?Q?BI7DSlAF8f+ckFhBoJcJ5AgBX9QCOhDwvgJHIH/nMOxd+lJ2Ewajococx8Oo?=
 =?us-ascii?Q?1zOnryEG5gEF4JqfTugznoLuFGYXTYB9DouKS1XnyiUZ0UMpCHebt/SNGsZf?=
 =?us-ascii?Q?6TY5qtKAzRvofsKKBoaP9n+SMcmSJc7KVtwDXmUAl0I/LkhqcmrKpn4MN3hl?=
 =?us-ascii?Q?ZvB5QU/uBSBfKoqqzjB0Kzh/GmThVhx99wY6R2dFkCr4qL82z/LiLwIYHgCv?=
 =?us-ascii?Q?DPNnQSuO8SOdTaJhWXJ1DzV8vhO3pBNO2TF6Yby7QR7tbUP9QTX/zUE8o/60?=
 =?us-ascii?Q?n85D8u6LL5DJcYgwK7yx2r+o3/jJqag8Q03jTVMkPlMqJG2L+kifLKJvYGgy?=
 =?us-ascii?Q?px+hE2zos55hjwA1BrvrvqYtUUg9vboUtegSFshSGcXfl9/tVtnFgf3NUT2h?=
 =?us-ascii?Q?U4vVSfmiA3oTRwqHXLmMMw6T/Ge1TkWw9h9xrmrQcr2EUQjwdqBX6C8hBJRF?=
 =?us-ascii?Q?Ds0BYMIfuI91qUYwyvi9goLDWK70ZcLxWv29yZgy2mC1qjNr7U+r9cQwlh1M?=
 =?us-ascii?Q?ogBKw++Kj+FUJydk94iJn0TUGcLfrspENFjXGbyIG0uvM92OTn8ffw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:57:14.2016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ff4923-b15e-4463-99a1-08dde621a59d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5724
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
---
 drivers/gpu/drm/drm_buddy.c | 322 +++++++++++++++++++++---------------
 include/drm/drm_buddy.h     |   8 +-
 2 files changed, 192 insertions(+), 138 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 01ae984340cc..06e90020177f 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -14,6 +14,9 @@
 
 static struct kmem_cache *slab_blocks;
 
+#define for_each_free_tree(tree) \
+	for ((tree) = CLEAR_TREE; (tree) < MAX_FREE_TREES; (tree)++)
+
 /*
  * for_each_rb_free_block() - iterate over an RB tree in order
  * @pos:	the struct type * to use as a loop cursor
@@ -78,22 +81,60 @@ static void drm_block_free(struct drm_buddy *mm,
 	kmem_cache_free(slab_blocks, block);
 }
 
+static inline enum free_tree
+get_block_tree(struct drm_buddy_block *block)
+{
+	return drm_buddy_block_is_clear(block) ? CLEAR_TREE : DIRTY_TREE;
+}
+
+static inline struct drm_buddy_block *
+rbtree_get_free_block(struct rb_node *node)
+{
+	return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
+}
+
+static inline struct drm_buddy_block *
+rbtree_prev_free_block(struct rb_node *node)
+{
+	return rbtree_get_free_block(rb_prev(node));
+}
+
+static inline struct drm_buddy_block *
+rbtree_first_free_block(struct rb_root *root)
+{
+	return rbtree_get_free_block(rb_first(root));
+}
+
+static inline struct drm_buddy_block *
+rbtree_last_free_block(struct rb_root *root)
+{
+	return rbtree_get_free_block(rb_last(root));
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
+	root = &mm->free_trees[tree][order];
+	link = &root->rb_node;
 
 	while (*link) {
 		parent = *link;
-		node = rb_entry(parent, struct drm_buddy_block, rb);
+		node = rbtree_get_free_block(parent);
 
-		if (offset < drm_buddy_block_offset(node))
+		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
 			link = &parent->rb_left;
 		else
 			link = &parent->rb_right;
@@ -106,27 +147,17 @@ static void rbtree_insert(struct drm_buddy *mm,
 static void rbtree_remove(struct drm_buddy *mm,
 			  struct drm_buddy_block *block)
 {
+	unsigned int order = drm_buddy_block_order(block);
 	struct rb_root *root;
+	enum free_tree tree;
 
-	root = &mm->free_tree[drm_buddy_block_order(block)];
-	rb_erase(&block->rb, root);
+	tree = get_block_tree(block);
+	root = &mm->free_trees[tree][order];
 
+	rb_erase(&block->rb, root);
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
@@ -149,10 +180,13 @@ static void mark_allocated(struct drm_buddy *mm,
 static void mark_free(struct drm_buddy *mm,
 		      struct drm_buddy_block *block)
 {
+	enum free_tree tree;
+
 	block->header &= ~DRM_BUDDY_HEADER_STATE;
 	block->header |= DRM_BUDDY_FREE;
 
-	rbtree_insert(mm, block);
+	tree = get_block_tree(block);
+	rbtree_insert(mm, block, tree);
 }
 
 static void mark_split(struct drm_buddy *mm,
@@ -238,6 +272,7 @@ static int __force_merge(struct drm_buddy *mm,
 			 u64 end,
 			 unsigned int min_order)
 {
+	enum free_tree tree;
 	unsigned int order;
 	int i;
 
@@ -247,50 +282,49 @@ static int __force_merge(struct drm_buddy *mm,
 	if (min_order > mm->max_order)
 		return -EINVAL;
 
-	for (i = min_order - 1; i >= 0; i--) {
-		struct drm_buddy_block *block, *prev_block, *first_block;
+	for_each_free_tree(tree) {
+		for (i = min_order - 1; i >= 0; i--) {
+			struct rb_root *root = &mm->free_trees[tree][i];
+			struct drm_buddy_block *block, *prev_block;
 
-		first_block = rb_entry(rb_first(&mm->free_tree[i]), struct drm_buddy_block, rb);
+			for_each_rb_free_block_reverse_safe(block, prev_block, root, rb) {
+				struct drm_buddy_block *buddy;
+				u64 block_start, block_end;
 
-		for_each_rb_free_block_reverse_safe(block, prev_block, &mm->free_tree[i], rb) {
-			struct drm_buddy_block *buddy;
-			u64 block_start, block_end;
-
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
 
@@ -311,7 +345,7 @@ static int __force_merge(struct drm_buddy *mm,
  */
 int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 {
-	unsigned int i;
+	unsigned int i, j;
 	u64 offset;
 
 	if (size < chunk_size)
@@ -333,14 +367,16 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 
 	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
 
-	mm->free_tree = kmalloc_array(mm->max_order + 1,
-				      sizeof(struct rb_root),
-				      GFP_KERNEL);
-	if (!mm->free_tree)
-		return -ENOMEM;
+	for (i = 0; i < MAX_FREE_TREES; i++) {
+		mm->free_trees[i] = kmalloc_array(mm->max_order + 1,
+						  sizeof(struct rb_root),
+						  GFP_KERNEL);
+		if (!mm->free_trees[i])
+			goto out_free_tree;
 
-	for (i = 0; i <= mm->max_order; ++i)
-		mm->free_tree[i] = RB_ROOT;
+		for (j = 0; j <= mm->max_order; ++j)
+			mm->free_trees[i][j] = RB_ROOT;
+	}
 
 	mm->n_roots = hweight64(size);
 
@@ -388,7 +424,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
 		drm_block_free(mm, mm->roots[i]);
 	kfree(mm->roots);
 out_free_tree:
-	kfree(mm->free_tree);
+	while (i--)
+		kfree(mm->free_trees[i]);
 	return -ENOMEM;
 }
 EXPORT_SYMBOL(drm_buddy_init);
@@ -424,8 +461,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
 
 	WARN_ON(mm->avail != mm->size);
 
+	for (i = 0; i < MAX_FREE_TREES; i++)
+		kfree(mm->free_trees[i]);
 	kfree(mm->roots);
-	kfree(mm->free_tree);
 }
 EXPORT_SYMBOL(drm_buddy_fini);
 
@@ -449,8 +487,7 @@ static int split_block(struct drm_buddy *mm,
 		return -ENOMEM;
 	}
 
-	mark_free(mm, block->left);
-	mark_free(mm, block->right);
+	mark_split(mm, block);
 
 	if (drm_buddy_block_is_clear(block)) {
 		mark_cleared(block->left);
@@ -458,7 +495,8 @@ static int split_block(struct drm_buddy *mm,
 		clear_reset(block);
 	}
 
-	mark_split(mm, block);
+	mark_free(mm, block->left);
+	mark_free(mm, block->right);
 
 	return 0;
 }
@@ -491,6 +529,7 @@ EXPORT_SYMBOL(drm_get_buddy);
  */
 void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 {
+	enum free_tree src_tree, dst_tree;
 	u64 root_size, size, start;
 	unsigned int order;
 	int i;
@@ -505,19 +544,24 @@ void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
 		size -= root_size;
 	}
 
+	src_tree = is_clear ? DIRTY_TREE : CLEAR_TREE;
+	dst_tree = is_clear ? CLEAR_TREE : DIRTY_TREE;
+
 	for (i = 0; i <= mm->max_order; ++i) {
+		struct rb_root *root = &mm->free_trees[src_tree][i];
 		struct drm_buddy_block *block;
 
-		for_each_rb_free_block_reverse(block, &mm->free_tree[i], rb) {
-			if (is_clear != drm_buddy_block_is_clear(block)) {
-				if (is_clear) {
-					mark_cleared(block);
-					mm->clear_avail += drm_buddy_block_size(mm, block);
-				} else {
-					clear_reset(block);
-					mm->clear_avail -= drm_buddy_block_size(mm, block);
-				}
+		for_each_rb_free_block_reverse(block, root, rb) {
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
@@ -707,23 +751,17 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
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
-		for_each_rb_free_block_reverse(tmp_block, &mm->free_tree[i], rb) {
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
 
@@ -747,39 +785,37 @@ alloc_from_freetree(struct drm_buddy *mm,
 		    unsigned long flags)
 {
 	struct drm_buddy_block *block = NULL;
+	struct rb_root *root;
+	enum free_tree tree;
 	unsigned int tmp;
 	int err;
 
+	tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ? CLEAR_TREE : DIRTY_TREE;
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
-			for_each_rb_free_block_reverse(tmp_block, &mm->free_tree[tmp], rb) {
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
+		tree = (tree == CLEAR_TREE) ? DIRTY_TREE : CLEAR_TREE;
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
@@ -923,6 +959,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	u64 rhs_offset, lhs_offset, lhs_size, filled;
 	struct drm_buddy_block *block;
 	LIST_HEAD(blocks_lhs);
+	enum free_tree tree;
 	unsigned long pages;
 	unsigned int order;
 	u64 modify_size;
@@ -934,34 +971,39 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 	if (order == 0)
 		return -ENOSPC;
 
-	if (rbtree_is_empty(mm, order))
+	if (rbtree_is_empty(&mm->free_trees[CLEAR_TREE][order]) &&
+	    rbtree_is_empty(&mm->free_trees[DIRTY_TREE][order]))
 		return -ENOSPC;
 
-	for_each_rb_free_block_reverse(block, &mm->free_tree[order], rb) {
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
+		for_each_rb_free_block_reverse(block, root, rb) {
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
@@ -1266,6 +1308,7 @@ EXPORT_SYMBOL(drm_buddy_block_print);
  */
 void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 {
+	enum free_tree tree;
 	int order;
 
 	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
@@ -1273,11 +1316,16 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 
 	for (order = mm->max_order; order >= 0; order--) {
 		struct drm_buddy_block *block;
+		struct rb_root *root;
 		u64 count = 0, free;
 
-		for_each_rb_free_block(block, &mm->free_tree[order], rb) {
-			BUG_ON(!drm_buddy_block_is_free(block));
-			count++;
+		for_each_free_tree(tree) {
+			root = &mm->free_trees[tree][order];
+
+			for_each_rb_free_block(block, root, rb) {
+				BUG_ON(!drm_buddy_block_is_free(block));
+				count++;
+			}
 		}
 
 		drm_printf(p, "order-%2d ", order);
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 091823592034..2fc1cc7b78bf 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -14,6 +14,12 @@
 
 #include <drm/drm_print.h>
 
+enum free_tree {
+	CLEAR_TREE = 0,
+	DIRTY_TREE,
+	MAX_FREE_TREES,
+};
+
 #define range_overflows(start, size, max) ({ \
 	typeof(start) start__ = (start); \
 	typeof(size) size__ = (size); \
@@ -73,7 +79,7 @@ struct drm_buddy_block {
  */
 struct drm_buddy {
 	/* Maintain a free list for each order. */
-	struct rb_root *free_tree;
+	struct rb_root *free_trees[MAX_FREE_TREES];
 
 	/*
 	 * Maintain explicit binary tree(s) to track the allocation of the
-- 
2.34.1

