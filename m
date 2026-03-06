Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIn0HPhtqmkPRQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 07:02:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D4621BEC1
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 07:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F299D10E377;
	Fri,  6 Mar 2026 06:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LTNsDUa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536CC10E36E;
 Fri,  6 Mar 2026 06:02:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJAkCHR3mPlwJ1Wdj/4NxaFZ7nymKkczAmdZL+IEbtU+bKNMPzrpBW/65bysp7WQNMN/5eWHys+C69W80M5+imFgtmO+NxxNFD96UxKE5DM2thEBMMko2n+sFX27KRcQWfGq2x52IS86swMuwrjzHEBPdkH7p7NBpv/QjMRE7vPvkOt4Ki8T6PzCbxA5zJpvVKBh6M5J10UVrRrnZL/pRuTJqkEKBtr097XdR6Vz2Oga0UFtT1YtVEJnfTeQ8gwnzyRoK4lLInEs5CYm0vnIBWN8dXBkPQtbrZYwTBgfEsovHG4mnUAr6GAE9MxTQuLoyqDSqqjRBnMh2FciOTfh9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHE3l/qaP7sdAdkIiES3n0cLehnjGi3aKmIs94nbgdY=;
 b=xy4EHqJ7HDTSjXuB1qTKVUM/TiHv20jHuEehcHIOeqRd5eH1tmMtx3dA3aUKtE2mp3qUloC0nR/Nwc+1jjjX1MJZhFke4/6Y1ZzKXSDJzYcE2RPrOGVzy45txl5BuSMj+pzgRx9kVL0CaNprAoJWCvqfTfP7U0jghKZ2uy0KiyGu4TNxckz/7ZmDlCQTdH2mE69zRChpMLPRTqNVc2esdNGXNSL1gXR+L4cqlDGDFuGWWfcR90MMM+59Fc398lMfDPjW2aM6765oaQefpnNiNCT4kChzsJNZNBUN3OFKpG2MQ0EDt8RwUzEZeskWDp7vy0RWZIc4a1Q2yjIt5vCZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHE3l/qaP7sdAdkIiES3n0cLehnjGi3aKmIs94nbgdY=;
 b=LTNsDUa/2G/4V0grdxNdmpr7WffTKKvX6zU1LNYKldpSPGEcevajhhw7IgCKb9c7cZw6iskyyRCR7qdaqZrwVSrH0CoR3Oiedv6PFxPaYQOv1RSp8Zb6vHLaN7B0QUA+wZzGKf3BL87wCkcDpOBbLLhLTJuWiIsSdAi3qVIt3sE=
Received: from BN9PR03CA0428.namprd03.prod.outlook.com (2603:10b6:408:113::13)
 by IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:431::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 06:02:18 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::1b) by BN9PR03CA0428.outlook.office365.com
 (2603:10b6:408:113::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 06:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 06:02:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Mar
 2026 00:02:18 -0600
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 22:02:15 -0800
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <matthew.auld@intel.com>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v5 1/2] drm/buddy: Improve offset-aligned allocation handling
Date: Fri, 6 Mar 2026 11:31:54 +0530
Message-ID: <20260306060155.2114-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8444d7-bd06-4de9-2be5-08de7b45ec99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|376014|19052099003; 
X-Microsoft-Antispam-Message-Info: WadQFhsNkpFMZKDIXidtEW86XiM6W+SK/sQpgTtlCZKXq5Rp3Eb3D9NRbqsAA0HqvKOKP9fb+LolmEFNX3R3EUtDsbLgm3gS5j6lGwJMWnKc+6wDtCgih/nzoCawUxrtLmxQloMXgj+49fzl0wZYx3BevQGYzIbCJLPrIxNrO6rj/EJjVtgfsq6lPcQu7DkiH1oIubUseVCTX6cYZqNYLAXXG6bU1m5CjmHu346cRz1zXgbyDlLsyUtkWs2Vj4OsA+GrtFzarC6gKoMRrXsuFYIFhJnM2h/zvsE2sFusibaVpY2vD4Cbl5PB76TiC6vkKs63akGvFpa+BxKpkLBU3lG3QAKdzRrUerNjKMlmO1wjvRhcmqIBr25qlxdKFtEyIr4ZvmjP2RYgFDYaWAoZSVruebARCAvjxG0qbWsSn9klKesZsBG3zXRnkmapGva88NbvaNbxv5q0hr9eN73YdSQixZSfcCelVv2WDKAtDTTboXd6aPC6lSz0gQHP8cHboiHcO8O+0nLnYcjtpp0G9DplXzGg6M50iajk++i2qYt2KaEvtZXRcOPhm/jIf8llLFxlMK6758UjbyBq443fJsm2PWj0prFylej8Olyzm57N7M9opbqe2OjtY4VLjTB3/GJWrvCRv7PrY5WkWRKgW0zr7eQdx6Y7ctB5E8Z7CesD2esgUNL8LmND4NtI2RnIi7dTz3F+in76GHHfBbetykKUy85lnja6Vx/EjS7i581MadDZF9xETS7N2N/SrpeYnjFwxZiLI7qj+yTXa9Kdfg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(19052099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /FzWSnSZd/irov6aqRh2kqnY0B0QxEheHLgB38aDL2tGrs6w/TGxsv7paeaJncUKoK2Q21W90lnsOo6E19Z598A4GrV426nbGTTOyaQAC/VNxTqa0jNx2EugqbqRadYxiaBD4eaGrIW7hzeLjiQ8jKRNKsANxs8n1BqMM2JeA+mfMCrG6mRORnsipgflbWejc0S7mE2Npo4SdFfrDdGmccNyK5QL6jRr7azgFbvmnyNDnTkPacmN8lJGKZt0iyAT1MVjQ+oSkCqtTzMc9RT46GIfK6M5yni8AV/wiNq9iZxwjy0T/2OoxqoppYhCV3jltlefKNBfyUBP/8Wcuv6s3z7/qb3uW0DA+6whTjnUOd/BOswBVPxb2Do1J2JIaNLl7SYzxUJsZ5laPwSG1z9d9QAPcjaTv3P1m+yihpyYr+b9OeZv85qVu+NKu5rbw8QK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 06:02:18.4719 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8444d7-bd06-4de9-2be5-08de7b45ec99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529
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
X-Rspamd-Queue-Id: 23D4621BEC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Arunpravin.PaneerSelvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Large alignment requests previously forced the buddy allocator to search by
alignment order, which often caused higher-order free blocks to be split even
when a suitably aligned smaller region already existed within them. This led
to excessive fragmentation, especially for workloads requesting small sizes
with large alignment constraints.

This change prioritizes the requested allocation size during the search and
uses an augmented RB-tree field (subtree_max_alignment) to efficiently locate
free blocks that satisfy both size and offset-alignment requirements. As a
result, the allocator can directly select an aligned sub-region without
splitting larger blocks unnecessarily.

A practical example is the VKCTS test
dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which repeatedly
allocates 8 KiB buffers with a 256 KiB alignment. Previously, such allocations
caused large blocks to be split aggressively, despite smaller aligned regions
being sufficient. With this change, those aligned regions are reused directly,
significantly reducing fragmentation.

This improvement is visible in the amdgpu VRAM buddy allocator state
(/sys/kernel/debug/dri/1/amdgpu_vram_mm). After the change, higher-order blocks
are preserved and the number of low-order fragments is substantially reduced.

Before:
  order- 5 free: 1936 MiB, blocks: 15490
  order- 4 free:  967 MiB, blocks: 15486
  order- 3 free:  483 MiB, blocks: 15485
  order- 2 free:  241 MiB, blocks: 15486
  order- 1 free:  241 MiB, blocks: 30948

After:
  order- 5 free:  493 MiB, blocks:  3941
  order- 4 free:  246 MiB, blocks:  3943
  order- 3 free:  123 MiB, blocks:  4101
  order- 2 free:   61 MiB, blocks:  4101
  order- 1 free:   61 MiB, blocks:  8018

By avoiding unnecessary splits, this change improves allocator efficiency and
helps maintain larger contiguous free regions under heavy offset-aligned
allocation workloads.

v2:(Matthew)
  - Update augmented information along the path to the inserted node.

v3:
  - Move the patch to gpu/buddy.c file.

v4:(Matthew)
  - Use the helper instead of calling _ffs directly
  - Remove gpu_buddy_block_order(block) >= order check and drop order
  - Drop !node check as all callers handle this already
  - Return larger than any other possible alignment for __ffs64(0)
  - Replace __ffs with __ffs64

v5:(Matthew)
  - Drop subtree_max_alignment initialization at gpu_block_alloc()

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/buddy.c       | 272 +++++++++++++++++++++++++++++++-------
 include/linux/gpu_buddy.h |   2 +
 2 files changed, 229 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
index da5a1222f46b..52686672e99f 100644
--- a/drivers/gpu/buddy.c
+++ b/drivers/gpu/buddy.c
@@ -53,6 +53,25 @@ gpu_buddy_block_is_split(struct gpu_buddy_block *block)
 	return gpu_buddy_block_state(block) == GPU_BUDDY_SPLIT;
 }
 
+static unsigned int gpu_buddy_block_offset_alignment(struct gpu_buddy_block *block)
+{
+	u64 offset = gpu_buddy_block_offset(block);
+
+	if (!offset)
+		/*
+		 * __ffs64(0) is undefined; offset 0 is maximally aligned, so return
+		 * a value greater than any possible alignment.
+		 */
+		return 64 + 1;
+
+	return __ffs64(offset);
+}
+
+RB_DECLARE_CALLBACKS_MAX(static, gpu_buddy_augment_cb,
+			 struct gpu_buddy_block, rb,
+			 unsigned int, subtree_max_alignment,
+			 gpu_buddy_block_offset_alignment);
+
 static struct gpu_buddy_block *gpu_block_alloc(struct gpu_buddy *mm,
 					       struct gpu_buddy_block *parent,
 					       unsigned int order,
@@ -106,26 +125,42 @@ static bool rbtree_is_empty(struct rb_root *root)
 	return RB_EMPTY_ROOT(root);
 }
 
-static bool gpu_buddy_block_offset_less(const struct gpu_buddy_block *block,
-					const struct gpu_buddy_block *node)
-{
-	return gpu_buddy_block_offset(block) < gpu_buddy_block_offset(node);
-}
-
-static bool rbtree_block_offset_less(struct rb_node *block,
-				     const struct rb_node *node)
-{
-	return gpu_buddy_block_offset_less(rbtree_get_free_block(block),
-					   rbtree_get_free_block(node));
-}
-
 static void rbtree_insert(struct gpu_buddy *mm,
 			  struct gpu_buddy_block *block,
 			  enum gpu_buddy_free_tree tree)
 {
-	rb_add(&block->rb,
-	       &mm->free_trees[tree][gpu_buddy_block_order(block)],
-	       rbtree_block_offset_less);
+	struct rb_node **link, *parent = NULL;
+	unsigned int block_alignment, order;
+	struct gpu_buddy_block *node;
+	struct rb_root *root;
+
+	order = gpu_buddy_block_order(block);
+	block_alignment = gpu_buddy_block_offset_alignment(block);
+
+	root = &mm->free_trees[tree][order];
+	link = &root->rb_node;
+
+	while (*link) {
+		parent = *link;
+		node = rbtree_get_free_block(parent);
+		/*
+		 * Manual augmentation update during insertion traversal. Required
+		 * because rb_insert_augmented() only calls rotate callback during
+		 * rotations. This ensures all ancestors on the insertion path have
+		 * correct subtree_max_alignment values.
+		 */
+		if (node->subtree_max_alignment < block_alignment)
+			node->subtree_max_alignment = block_alignment;
+
+		if (gpu_buddy_block_offset(block) < gpu_buddy_block_offset(node))
+			link = &parent->rb_left;
+		else
+			link = &parent->rb_right;
+	}
+
+	block->subtree_max_alignment = block_alignment;
+	rb_link_node(&block->rb, parent, link);
+	rb_insert_augmented(&block->rb, root, &gpu_buddy_augment_cb);
 }
 
 static void rbtree_remove(struct gpu_buddy *mm,
@@ -138,7 +173,7 @@ static void rbtree_remove(struct gpu_buddy *mm,
 	tree = get_block_tree(block);
 	root = &mm->free_trees[tree][order];
 
-	rb_erase(&block->rb, root);
+	rb_erase_augmented(&block->rb, root, &gpu_buddy_augment_cb);
 	RB_CLEAR_NODE(&block->rb);
 }
 
@@ -811,6 +846,127 @@ alloc_from_freetree(struct gpu_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static bool
+gpu_buddy_can_offset_align(u64 size, u64 min_block_size)
+{
+	return size < min_block_size && is_power_of_2(size);
+}
+
+static bool gpu_buddy_subtree_can_satisfy(struct rb_node *node,
+					  unsigned int alignment)
+{
+	struct gpu_buddy_block *block;
+
+	block = rbtree_get_free_block(node);
+	return block->subtree_max_alignment >= alignment;
+}
+
+static struct gpu_buddy_block *
+gpu_buddy_find_block_aligned(struct gpu_buddy *mm,
+			     enum gpu_buddy_free_tree tree,
+			     unsigned int order,
+			     unsigned int alignment,
+			     unsigned long flags)
+{
+	struct rb_root *root = &mm->free_trees[tree][order];
+	struct rb_node *rb = root->rb_node;
+
+	while (rb) {
+		struct gpu_buddy_block *block = rbtree_get_free_block(rb);
+		struct rb_node *left_node = rb->rb_left, *right_node = rb->rb_right;
+
+		if (right_node) {
+			if (gpu_buddy_subtree_can_satisfy(right_node, alignment)) {
+				rb = right_node;
+				continue;
+			}
+		}
+
+		if (gpu_buddy_block_offset_alignment(block) >= alignment)
+			return block;
+
+		if (left_node) {
+			if (gpu_buddy_subtree_can_satisfy(left_node, alignment)) {
+				rb = left_node;
+				continue;
+			}
+		}
+
+		break;
+	}
+
+	return NULL;
+}
+
+static struct gpu_buddy_block *
+gpu_buddy_offset_aligned_allocation(struct gpu_buddy *mm,
+				    u64 size,
+				    u64 min_block_size,
+				    unsigned long flags)
+{
+	struct gpu_buddy_block *block = NULL;
+	unsigned int order, tmp, alignment;
+	struct gpu_buddy_block *buddy;
+	enum gpu_buddy_free_tree tree;
+	unsigned long pages;
+	int err;
+
+	alignment = ilog2(min_block_size);
+	pages = size >> ilog2(mm->chunk_size);
+	order = fls(pages) - 1;
+
+	tree = (flags & GPU_BUDDY_CLEAR_ALLOCATION) ?
+		GPU_BUDDY_CLEAR_TREE : GPU_BUDDY_DIRTY_TREE;
+
+	for (tmp = order; tmp <= mm->max_order; ++tmp) {
+		block = gpu_buddy_find_block_aligned(mm, tree, tmp,
+						     alignment, flags);
+		if (!block) {
+			tree = (tree == GPU_BUDDY_CLEAR_TREE) ?
+				GPU_BUDDY_DIRTY_TREE : GPU_BUDDY_CLEAR_TREE;
+			block = gpu_buddy_find_block_aligned(mm, tree, tmp,
+							     alignment, flags);
+		}
+
+		if (block)
+			break;
+	}
+
+	if (!block)
+		return ERR_PTR(-ENOSPC);
+
+	while (gpu_buddy_block_order(block) > order) {
+		struct gpu_buddy_block *left, *right;
+
+		err = split_block(mm, block);
+		if (unlikely(err))
+			goto err_undo;
+
+		left  = block->left;
+		right = block->right;
+
+		if (gpu_buddy_block_offset_alignment(right) >= alignment)
+			block = right;
+		else
+			block = left;
+	}
+
+	return block;
+
+err_undo:
+	/*
+	 * We really don't want to leave around a bunch of split blocks, since
+	 * bigger is better, so make sure we merge everything back before we
+	 * free the allocated blocks.
+	 */
+	buddy = __get_buddy(block);
+	if (buddy &&
+	    (gpu_buddy_block_is_free(block) &&
+	     gpu_buddy_block_is_free(buddy)))
+		__gpu_buddy_free(mm, block, false);
+	return ERR_PTR(err);
+}
+
 static int __alloc_range(struct gpu_buddy *mm,
 			 struct list_head *dfs,
 			 u64 start, u64 size,
@@ -1080,6 +1236,7 @@ EXPORT_SYMBOL(gpu_buddy_block_trim);
 static struct gpu_buddy_block *
 __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 			 u64 start, u64 end,
+			 u64 size, u64 min_block_size,
 			 unsigned int order,
 			 unsigned long flags)
 {
@@ -1087,6 +1244,11 @@ __gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 		/* Allocate traversing within the range */
 		return  __gpu_buddy_alloc_range_bias(mm, start, end,
 						     order, flags);
+	else if (size < min_block_size)
+		/* Allocate from an offset-aligned region without size rounding */
+		return gpu_buddy_offset_aligned_allocation(mm, size,
+							   min_block_size,
+							   flags);
 	else
 		/* Allocate from freetree */
 		return alloc_from_freetree(mm, order, flags);
@@ -1158,8 +1320,11 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 	if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION) {
 		size = roundup_pow_of_two(size);
 		min_block_size = size;
-	/* Align size value to min_block_size */
-	} else if (!IS_ALIGNED(size, min_block_size)) {
+		/*
+		 * Normalize the requested size to min_block_size for regular allocations.
+		 * Offset-aligned allocations intentionally skip size rounding.
+		 */
+	} else if (!gpu_buddy_can_offset_align(size, min_block_size)) {
 		size = round_up(size, min_block_size);
 	}
 
@@ -1179,43 +1344,60 @@ int gpu_buddy_alloc_blocks(struct gpu_buddy *mm,
 	do {
 		order = min(order, (unsigned int)fls(pages) - 1);
 		BUG_ON(order > mm->max_order);
-		BUG_ON(order < min_order);
+		/*
+		 * Regular allocations must not allocate blocks smaller than min_block_size.
+		 * Offset-aligned allocations deliberately bypass this constraint.
+		 */
+		BUG_ON(size >= min_block_size && order < min_order);
 
 		do {
+			unsigned int fallback_order;
+
 			block = __gpu_buddy_alloc_blocks(mm, start,
 							 end,
+							 size,
+							 min_block_size,
 							 order,
 							 flags);
 			if (!IS_ERR(block))
 				break;
 
-			if (order-- == min_order) {
-				/* Try allocation through force merge method */
-				if (mm->clear_avail &&
-				    !__force_merge(mm, start, end, min_order)) {
-					block = __gpu_buddy_alloc_blocks(mm, start,
-									 end,
-									 min_order,
-									 flags);
-					if (!IS_ERR(block)) {
-						order = min_order;
-						break;
-					}
-				}
+			if (size < min_block_size) {
+				fallback_order = order;
+			} else if (order == min_order) {
+				fallback_order = min_order;
+			} else {
+				order--;
+				continue;
+			}
 
-				/*
-				 * Try contiguous block allocation through
-				 * try harder method.
-				 */
-				if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
-				    !(flags & GPU_BUDDY_RANGE_ALLOCATION))
-					return __alloc_contig_try_harder(mm,
-									 original_size,
-									 original_min_size,
-									 blocks);
-				err = -ENOSPC;
-				goto err_free;
+			/* Try allocation through force merge method */
+			if (mm->clear_avail &&
+			    !__force_merge(mm, start, end, fallback_order)) {
+				block = __gpu_buddy_alloc_blocks(mm, start,
+								 end,
+								 size,
+								 min_block_size,
+								 fallback_order,
+								 flags);
+				if (!IS_ERR(block)) {
+					order = fallback_order;
+					break;
+				}
 			}
+
+			/*
+			 * Try contiguous block allocation through
+			 * try harder method.
+			 */
+			if (flags & GPU_BUDDY_CONTIGUOUS_ALLOCATION &&
+			    !(flags & GPU_BUDDY_RANGE_ALLOCATION))
+				return __alloc_contig_try_harder(mm,
+								 original_size,
+								 original_min_size,
+								 blocks);
+			err = -ENOSPC;
+			goto err_free;
 		} while (1);
 
 		mark_allocated(mm, block);
diff --git a/include/linux/gpu_buddy.h b/include/linux/gpu_buddy.h
index f1fb6eff604a..5fa917ba5450 100644
--- a/include/linux/gpu_buddy.h
+++ b/include/linux/gpu_buddy.h
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/rbtree.h>
+#include <linux/rbtree_augmented.h>
 
 /**
  * GPU_BUDDY_RANGE_ALLOCATION - Allocate within a specific address range
@@ -128,6 +129,7 @@ struct gpu_buddy_block {
 	};
 /* private: */
 	struct list_head tmp_link;
+	unsigned int subtree_max_alignment;
 };
 
 /* Order-zero must be at least SZ_4K */

base-commit: e597a809a2b97e927060ba182f58eb3e6101bc70
-- 
2.34.1

