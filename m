Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135E4CB5CC4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD4910E7E6;
	Thu, 11 Dec 2025 12:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xInG9bcH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013043.outbound.protection.outlook.com
 [40.93.201.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6209E10E0A3;
 Thu, 11 Dec 2025 12:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuchIyg4M77vZV1h+GFiFXl/PUqPBM4zTh1uepTlL3gSim/LsIK+uKx1reAedJS24i36tPy7fvtjciJIi3+ByTFnYmeZo17ekHweVtFykkXbXi7mBULf/uZKs1cUSrVLuG2vK0CSNyHn+vlw2W+cV9xQEI4OQJ1QExV+b8xSJS64+Ri0+ha2052H3D4OGSSqyrmR1WTtrlymmfBOuv/BCPY5eHkuQa2TWcJ5MhwnJYJfzep2YK2EWRkWz09xEQcY2QJhts63WYYQWhrskVu/Hsud4fkjjVWQcFlF/j9mSk3ck6SelxW8DVjhHrlAtUrVYp1eWDcYNqj6w7G16eia6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KP1bSQRfUYDyCP1VNIj4KdjaL55XsMo3LdfLGoxhYCI=;
 b=IE3MwZRIknj2YuKL9suUsa3BJaN+H2/XPK0jegOxPiXERIqGVjtay8KyUc7cJ8o4rzEUn33k8HNfJAblfxTnwnSbRfc2WCtZHOQmHKFWiXNP0JNBXRe1L8MObiApix63LfGTVwl2nnpDMWCTScyzR3YT11p6znsUjaBgjN+cqR7KRNzlrrYBffBxpv+9hxGg+JLeqTKKowvcl+an6/GXsv/Npn7FROUNhz1283Vb1tFVgkDSzrwTdpTWh1iEFGkIMlgmr23GJ+hJqi/Xh8HwgMdXwKzIujmxTf0xx/w+tcotWCUK7WNoX9YKjecRVkDh2QjUNzEbd7ApoCZBsL8bhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KP1bSQRfUYDyCP1VNIj4KdjaL55XsMo3LdfLGoxhYCI=;
 b=xInG9bcHcLfv3mp87ZTkJXxPzOBxtqCC+axfOP67rBiLXLkI8uQeXfVk4mNtzYtM207scYeUKZFjZbsaD76QdE5eNjWmFguOQWvINeRiaXExWhlehrHsOeK0KTtfJHZxygVdnMfxWk68p0lWQ9nhlgQ5k5HA84+MhEYwZ8WDnt8=
Received: from BLAPR03CA0020.namprd03.prod.outlook.com (2603:10b6:208:32b::25)
 by MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 12:23:51 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::e2) by BLAPR03CA0020.outlook.office365.com
 (2603:10b6:208:32b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.16 via Frontend Transport; Thu,
 11 Dec 2025 12:23:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 12:23:51 +0000
Received: from arun-nv33.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 06:23:48 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <christian.koenig@amd.com>, <matthew.auld@intel.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [RFC PATCH] drm/buddy: Optimize large alignment handling to avoid
 unnecessary splits
Date: Thu, 11 Dec 2025 17:53:19 +0530
Message-ID: <20251211122319.2054-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|MW3PR12MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: 63212c96-b05c-41b7-fbb6-08de38b024c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXY1eHBTTkkwa3dNNzEyMmY5bFpnMGtLdjRBdWMrdXNRZ2w2NmtTTlE0WEh3?=
 =?utf-8?B?R3YwOEt4T1FGQ2haVENYbDhaejNrWU1HbGhxblpVb1JBVy9odGRLYVBqa0R6?=
 =?utf-8?B?SFN2WFgwaUhPNXRCbW8yMmtkN2lIQnZlS3R6L3h0akdwNlovY0orVTUzMmVa?=
 =?utf-8?B?RWRuZGxpbE9YaXEwWVR1T2Zyb3ozVm12ZkJNZHB4bUF4ODJmVDhWWjJDS1JS?=
 =?utf-8?B?OXBoTlNyTzBhRWZYazc1YWxtNWdaSnNkRHgxSFh0bjNHT0RCREJQMk1KR1VB?=
 =?utf-8?B?WHFCRFZJU2F5dVNaQmg2U1JxWEJpNWd3YitWY2F2OUJ1MTN0d2FtYkZ0TUJ1?=
 =?utf-8?B?a25SdWMzNGxhT2NOdWhCakFNSmZsQTNKUnNtVWxIVDNhc3d6WW41aUVMSTZZ?=
 =?utf-8?B?YjBZQXhEZi8rSm5GRmlJeHdMT3IwaXhHam8wZTRmdHZFVTdlQ25hYnJacTFJ?=
 =?utf-8?B?TTJWYm05TXMrM1NYVHdzNjVrTHk1Ukx2UldKWUJUKzJDalJMaXI3bVYwdnpi?=
 =?utf-8?B?ejlnK1ZPbFQzZWgvYkZrV0NTaUZ3OTdsYXZqME9jczZ1OWxoQ1lraXRNWEp5?=
 =?utf-8?B?dlR0bmVRWkczelNobzNpbFZNaE5CL21meUx1ZzVFSTJOMXR3eVE5d1EyTHRI?=
 =?utf-8?B?UkRxd1VVckxFckYvYjNUOGEwUHF2bUppTHJxQ0R0bkNTbEI1OHJNS0VvNTdF?=
 =?utf-8?B?b0VSQ3FMRjhBT1hhb3BobXV1UTROQm9DYmt1cWk0NHFkNTFvTVh4VlNYRGVl?=
 =?utf-8?B?c3J0MEg4THN1bGFrU2x4MDdqc3FpVHU2aGVDNVZVaDlmRTBFMlhxMUR4RHpB?=
 =?utf-8?B?ekVrY2Rtbmw3SldMdi9ZaGVQdC9OUG56RE9IZE15aTFJVWlCRmZQYnNBanYx?=
 =?utf-8?B?SkkwWU5ZZDNrT05uZE1MWWxCdmtDN0lvN0liYWN5SWlqUllpem1HakVGY2ox?=
 =?utf-8?B?ZGVydlh2V2hRSU9DcXVsRlVQbDZneHFYSVJyYzFYVStvQmRVVVlEdHp5Y2Jy?=
 =?utf-8?B?WlBpZkkwWkl4RHpxLy8ybDFPVmZ1WlVQWVZqWXdwU0pmZ1MrOUdqaHd3Z0RH?=
 =?utf-8?B?ZTRkM296NTlxeENrQkQ4VlV2OEx2dkxYM0V1aDMySGl6MUFObCtIRUFJZmdQ?=
 =?utf-8?B?V01EeUlCWU1NbjdXdVR2aENTajlmTlAzVHFkaGxvMFp2d3RaOEZPdnhqR3hF?=
 =?utf-8?B?UHZrdHN0WHNIVlRlZS9Dcm9TY3lBQjl5NWtKOS9OSkJabEI0Q1VEVFhjSkYz?=
 =?utf-8?B?eTBDSGNnQm9YZVJnclFoV0d2Wk5UL1VEUGtTdk5LODR0TUtWallsdHorNnhS?=
 =?utf-8?B?dEJZdUdBQVVTZUJzdFNzTkhUdE1hWnRUZUtEclBRaVBVY2QyQkF2TURvU1BN?=
 =?utf-8?B?Mi9TQzFvdHF5WlVySkRQZ3VOa2I5WkFaSkZzemVNMGhjZHoyTWh2NXVQaVZL?=
 =?utf-8?B?OWtWR0U0bjVoQTNscWE0bzZEellpUjJTdkdaSUlITW5tUytyVmdDTkh2L3o0?=
 =?utf-8?B?V3p2WW43U0lEVmltTlZnK1pacnFPZ3grOXlLdnZVSFhiZUpKWDhJSElYTE5K?=
 =?utf-8?B?eS9WZEFWM214elhWK05WaXlyWU5OMjhkbWJXdmNOR3o3WGpheVhMczVXUzJ3?=
 =?utf-8?B?cnYrT0twc1U3OGg2YnhzTzdRRWMvaUJydFlDNWpDTURkOGRzR1N6SWdqNDFu?=
 =?utf-8?B?UmdiY1lSN2R1em03YU1UY1U4WEI4RHBlVHJtL2Z1ajNsQUV3QkZMOXF4QXNw?=
 =?utf-8?B?N1RCTVRMYkVaVjdERXJ0d0VPdzNRSkZ2b1htVFFWRytDb3hRbDdpWGJ2MDdi?=
 =?utf-8?B?ZE84Sm5hb3pqc00vTGh0Y25YcVg5RTVFZDU5cllQTHYvdVdXTUVvQ29jeVg4?=
 =?utf-8?B?K2cxTGRYTFpqQUVGbFN4VCtwVzAyTittb0xCajUrZWJTRHhrNnplRFBCNjF1?=
 =?utf-8?B?dnRvdHh4VzByenF0ODAzdytQSElBMXhJazlBaFpDY0FPU0I3Q0xvZnpYeldU?=
 =?utf-8?B?Mk5XeGZtQjlFRG5uNTdML0VKYnRyZGJwQk1DYjRicTk1NE9Td1RBQkxIT3Qv?=
 =?utf-8?B?K3dycHVnb3ExQnZlUUxETjV4MWxJTUJ1eHlXL1A2U0NJdGZhZTk4cEtiT2dR?=
 =?utf-8?Q?3N5o=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 12:23:51.4971 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63212c96-b05c-41b7-fbb6-08de38b024c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428
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

Large alignment requests previously forced the allocator to search by
alignment order, causing large free blocks to be split even when a
smaller aligned range existed within them. This patch switches the
search to prioritize the requested size and uses an augmented RB-tree
field (subtree_max_alignment) to efficiently locate blocks that satisfy
both size and alignment. This prevents unnecessary block splitting and
significantly reduces fragmentation.

A practical example is the VKCTS test
dEQP-VK.memory.allocation.basic.size_8KiB.reverse.count_4000, which
allocates 8 KiB buffers with a 256 KiB alignment. Previously, these
requests caused the allocator to split large blocks despite having
smaller aligned portions within them that could satisfy the allocation.
The new design now identifies and allocates from these portions,
avoiding unnecessary splitting.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 205 +++++++++++++++++++++++++++++++++---
 include/drm/drm_buddy.h     |   3 +
 2 files changed, 191 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index f2c92902e4a3..f749814bb270 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -23,6 +23,18 @@ static struct kmem_cache *slab_blocks;
 #define for_each_free_tree(tree) \
 	for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)
 
+static unsigned int drm_buddy_min_offset_or_size_order(struct drm_buddy_block *block)
+{
+	return min_t(unsigned int,
+		     __ffs(drm_buddy_block_offset(block)),
+		     drm_buddy_block_order(block));
+}
+
+RB_DECLARE_CALLBACKS_MAX(static, drm_buddy_augment_cb,
+			 struct drm_buddy_block, rb,
+			 unsigned int, subtree_max_alignment,
+			 drm_buddy_min_offset_or_size_order);
+
 static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 					       struct drm_buddy_block *parent,
 					       unsigned int order,
@@ -40,6 +52,9 @@ static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
 	block->header |= order;
 	block->parent = parent;
 
+	block->subtree_max_alignment =
+		drm_buddy_min_offset_or_size_order(block);
+
 	RB_CLEAR_NODE(&block->rb);
 
 	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
@@ -76,26 +91,32 @@ static bool rbtree_is_empty(struct rb_root *root)
 	return RB_EMPTY_ROOT(root);
 }
 
-static bool drm_buddy_block_offset_less(const struct drm_buddy_block *block,
-					const struct drm_buddy_block *node)
-{
-	return drm_buddy_block_offset(block) < drm_buddy_block_offset(node);
-}
-
-static bool rbtree_block_offset_less(struct rb_node *block,
-				     const struct rb_node *node)
-{
-	return drm_buddy_block_offset_less(rbtree_get_free_block(block),
-					   rbtree_get_free_block(node));
-}
-
 static void rbtree_insert(struct drm_buddy *mm,
 			  struct drm_buddy_block *block,
 			  enum drm_buddy_free_tree tree)
 {
-	rb_add(&block->rb,
-	       &mm->free_trees[tree][drm_buddy_block_order(block)],
-	       rbtree_block_offset_less);
+	struct rb_node **link, *parent = NULL;
+	struct drm_buddy_block *node;
+	struct rb_root *root;
+	unsigned int order;
+
+	order = drm_buddy_block_order(block);
+
+	root = &mm->free_trees[tree][order];
+	link = &root->rb_node;
+
+	while (*link) {
+		parent = *link;
+		node = rbtree_get_free_block(parent);
+
+		if (drm_buddy_block_offset(block) < drm_buddy_block_offset(node))
+			link = &parent->rb_left;
+		else
+			link = &parent->rb_right;
+	}
+
+	rb_link_node(&block->rb, parent, link);
+	rb_insert_augmented(&block->rb, root, &drm_buddy_augment_cb);
 }
 
 static void rbtree_remove(struct drm_buddy *mm,
@@ -108,7 +129,7 @@ static void rbtree_remove(struct drm_buddy *mm,
 	tree = get_block_tree(block);
 	root = &mm->free_trees[tree][order];
 
-	rb_erase(&block->rb, root);
+	rb_erase_augmented(&block->rb, root, &drm_buddy_augment_cb);
 	RB_CLEAR_NODE(&block->rb);
 }
 
@@ -596,6 +617,88 @@ static bool block_incompatible(struct drm_buddy_block *block, unsigned int flags
 	return needs_clear != drm_buddy_block_is_clear(block);
 }
 
+static bool drm_buddy_subtree_can_satisfy(struct rb_node *node,
+					  unsigned int alignment)
+{
+	struct drm_buddy_block *block;
+
+	if (!node)
+		return false;
+
+	block = rbtree_get_free_block(node);
+	return block->subtree_max_alignment >= alignment;
+}
+
+static struct drm_buddy_block *
+drm_buddy_find_block_aligned(struct drm_buddy *mm,
+			     enum drm_buddy_free_tree tree,
+			     unsigned int order,
+			     unsigned int tmp,
+			     unsigned int alignment,
+			     unsigned long flags)
+{
+	struct rb_root *root = &mm->free_trees[tree][tmp];
+	struct rb_node *rb = root->rb_node;
+
+	/* Try to find a block of the requested size that is already aligned */
+	while (rb) {
+		struct drm_buddy_block *block = rbtree_get_free_block(rb);
+		struct rb_node *left_node = rb->rb_left, *right_node = rb->rb_right;
+
+		if (left_node) {
+			if (drm_buddy_subtree_can_satisfy(left_node, alignment)) {
+				rb = left_node;
+				continue;
+			}
+		}
+
+		if (drm_buddy_block_order(block) >= order &&
+		    __ffs(drm_buddy_block_offset(block)) >= alignment)
+			return block;
+
+		if (right_node) {
+			if (drm_buddy_subtree_can_satisfy(right_node, alignment)) {
+				rb = right_node;
+				continue;
+			}
+		}
+
+		break;
+	}
+
+	if (tmp < max(order, alignment))
+		return NULL;
+
+	/* If none found, look for a larger block that can satisfy the alignment */
+	rb = root->rb_node;
+	while (rb) {
+		struct drm_buddy_block *block = rbtree_get_free_block(rb);
+		struct rb_node *left_node = rb->rb_left, *right_node = rb->rb_right;
+
+		if (left_node) {
+			if (drm_buddy_subtree_can_satisfy(left_node, alignment)) {
+				rb = left_node;
+				continue;
+			}
+		}
+
+		if (drm_buddy_block_order(block) >= max(order, alignment) &&
+		    drm_buddy_min_offset_or_size_order(block) >= alignment)
+			return block;
+
+		if (right_node) {
+			if (drm_buddy_subtree_can_satisfy(right_node, alignment)) {
+				rb = right_node;
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
 static struct drm_buddy_block *
 __alloc_range_bias(struct drm_buddy *mm,
 		   u64 start, u64 end,
@@ -798,6 +901,69 @@ alloc_from_freetree(struct drm_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static int drm_buddy_offset_aligned_allocation(struct drm_buddy *mm,
+					       u64 size,
+					       u64 min_block_size,
+					       unsigned long flags,
+					       struct list_head *blocks)
+{
+	struct drm_buddy_block *block = NULL;
+	unsigned int order, tmp, alignment;
+	enum drm_buddy_free_tree tree;
+	unsigned long pages;
+
+	alignment = ilog2(min_block_size);
+	pages = size >> ilog2(mm->chunk_size);
+	order = fls(pages) - 1;
+
+	tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ?
+		DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
+
+	for (tmp = order; tmp <= mm->max_order; ++tmp) {
+		block = drm_buddy_find_block_aligned(mm, tree, order,
+						     tmp, alignment, flags);
+		if (!block) {
+			tree = (tree == DRM_BUDDY_CLEAR_TREE) ?
+				DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
+			block = drm_buddy_find_block_aligned(mm, tree, order,
+							     tmp, alignment, flags);
+		}
+
+		if (block)
+			break;
+	}
+
+	if (!block)
+		return -ENOSPC;
+
+	while (drm_buddy_block_order(block) > order) {
+		unsigned int child_order = drm_buddy_block_order(block) - 1;
+		struct drm_buddy_block *left, *right;
+		int r;
+
+		r = split_block(mm, block);
+		if (r)
+			return r;
+
+		left  = block->left;
+		right = block->right;
+
+		if (child_order >= alignment)
+			block = right;
+		else
+			block = left;
+	}
+
+	mark_allocated(mm, block);
+	mm->avail -= drm_buddy_block_size(mm, block);
+	if (drm_buddy_block_is_clear(block))
+		mm->clear_avail -= drm_buddy_block_size(mm, block);
+	kmemleak_update_trace(block);
+	list_add_tail(&block->link, blocks);
+
+	return 0;
+}
+
 static int __alloc_range(struct drm_buddy *mm,
 			 struct list_head *dfs,
 			 u64 start, u64 size,
@@ -1147,6 +1313,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		min_block_size = size;
 	/* Align size value to min_block_size */
 	} else if (!IS_ALIGNED(size, min_block_size)) {
+		if (min_block_size > size && is_power_of_2(size))
+			return drm_buddy_offset_aligned_allocation(mm, size,
+								   min_block_size,
+								   flags,
+								   blocks);
 		size = round_up(size, min_block_size);
 	}
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index d7891d08f67a..da6a40fb4763 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/rbtree.h>
+#include <linux/rbtree_augmented.h>
 
 #include <drm/drm_print.h>
 
@@ -60,6 +61,8 @@ struct drm_buddy_block {
 	};
 
 	struct list_head tmp_link;
+
+	unsigned int subtree_max_alignment;
 };
 
 /* Order-zero must be at least SZ_4K */
-- 
2.34.1

