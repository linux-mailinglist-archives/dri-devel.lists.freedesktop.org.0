Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751807826D8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 12:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBA510E223;
	Mon, 21 Aug 2023 10:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA3210E0D3;
 Mon, 21 Aug 2023 10:15:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JywUsqvbBuAarh9TGsDqXR3goolHhUC1NIlDyCPcSe3zrZdA/XkAbu7Tgua4W1ecRv+yCX9z/IF8wjoHM2JdY8Y5J/8YKdC+3cZ21Sq0hmn/jizRf/TTIHfegDcvi558SKzKwCt80KZ1uyAvAr/H3OMQHIPhwZMcl59IJ85fznLT2frwrq2BIM01MlnoRvfkwfB45LtsBf3/YHwEKFI/Cln7wBVztFtRwZkhbA9YwkOp2UEIwRG6Bc1xVlR6ohhHCuCYufB6vOKPCHpD1QxtOaxt3bo5rMijc9sm6xyGMwymu5z2btnRZjy2veNiehobejemtYWPwDTi/Mcc8W6jYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nhv+QcCt7Md3mpm0qLnQqnrZazmPaTdWQQZ2ePttbPg=;
 b=mTA9KFKRksU4Y5TprfV/w86V0O5lnEgzBJicQuM950QAYAqWEc7uhQXpfcnF2DiC3Sw5VKxGaoqfMZ9Pn6D/al2++DWz8yGjTzvVB0vGrQSjgxgIPGHZdQ33VcvjUCJavLegb2pLP9D7TzftN/YdZfZleYgJ01lsuznaBHMBpptKxwLBX9OHlurUzSCsZBlr9KSMYC+zVWKE/GSuqIp+OoM8EVJsH7z1SEqU6BgZ1HpJOhXie3++QG8SiojaD6ARNGnv7rUneEL4tcNAPkrlivGMwIgtMxqvYWiQPcXodK9L4OvRgZ1jkeTHnKtHOQFo2Kuw+dBm32ELwk7Ek68k8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nhv+QcCt7Md3mpm0qLnQqnrZazmPaTdWQQZ2ePttbPg=;
 b=1kkvrDVPa2eVH1o8J4uAvjoWomOTyX1dch6jpEEfrX2QobnknFouSzlekMxv0HbU95F5vx2p2hZVPs0O5dUnKTgwc4KL1xuzSeWlwFWD52qf1GsKqvSKt0hntrQLjDiERvkpcHq6CYqJY7CAeui/kAdDtGjgu+61/cziJfKw3iM=
Received: from DS7PR05CA0082.namprd05.prod.outlook.com (2603:10b6:8:57::23) by
 DM4PR12MB6207.namprd12.prod.outlook.com (2603:10b6:8:a6::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.24; Mon, 21 Aug 2023 10:15:07 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:8:57:cafe::5e) by DS7PR05CA0082.outlook.office365.com
 (2603:10b6:8:57::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.11 via Frontend
 Transport; Mon, 21 Aug 2023 10:15:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Mon, 21 Aug 2023 10:15:06 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 05:15:03 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/buddy: Fix contiguous memory allocation issues
Date: Mon, 21 Aug 2023 03:14:42 -0700
Message-ID: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DM4PR12MB6207:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e79976-b89a-4692-72fe-08dba22f7e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00Iv5cCDMXJYRedOfHz6NOoG/6LBZkDhbjXcQVcjUjVPW9318wjvf8marhdMgTBMijenviI318EDwkSURBsvsJAHM9QOtWrmOqOqjMzb7DVjFo8pwmJtjFL8+LBOwVvjsIZpqgEApYsrvxTwgguwMNtdv4WL0yiNE1u1S9SUh0qMIpey9YfQmUK9fcTmE35PRwRLRbblUN7wyxcuo+0GcZLPKpPxRwKXfmEuRUy+fFwMDObTifMHz+9KF1kvIjmyOAqy/+Tibc/0avXE7uz+JoMhoc4/K7RSOaER6W+JM34xhfEuohMkqciSII8W5zesmqljV0Nh6HMwDvaGu4EZy18IQseeUgbfOKboytmwMnffIHILNtbPgV6vYQJ9AudkDs1pvBZgp9LPFOvJ2ILHP4FRd0YI44tFTrapLQqQfWxIDd0aa+zunO1hnkQY2E2FYh2N2rnxBB24Jm+4498dsi4Qj2QnWXuZSLxJ91dGZkf8YW2xyjeS9EZTc0Ew12Zsz816PdyLF8DT1GwJ5vftL2IVpyh92HEPT8wF19amm2Pu+lx5wsfBibRGJvuyxJkMnSQzYLK67zoTADdl0ARVX5GXpD8VB8jfKY5o8p7NERVMf329WzouwaWfk75f7wpYiiZ3GuW1GMm7b+UT/p56OdBvfWGf7l9Fcw1JYAc6QJFdI5CqgkjP839c/7JONAJ5w+Z+/JxnI1KR5E29AmyCCcxjBY36NiLmlSVox3g/GydQh5Kk/nA/fjvkvQovxLv1ZWUDNg+lL8wuwqJduG3UUw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(82310400011)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(83380400001)(7696005)(40480700001)(5660300002)(336012)(426003)(16526019)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(54906003)(70586007)(110136005)(478600001)(82740400003)(356005)(81166007)(6666004)(40460700003)(41300700001)(36756003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 10:15:06.7868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e79976-b89a-4692-72fe-08dba22f7e49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6207
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The way now contiguous requests are implemented such that
the size rounded up to power of 2 and the corresponding order
block picked from the freelist.

In addition to the older method, the new method will rounddown
the size to power of 2 and the corresponding order block picked
from the freelist. And for the remaining size we traverse the
tree and try to allocate either from the freelist block's buddy
or from the peer block. If the remaining size from peer/buddy
block is not free, we pick the next freelist block and repeat
the same method.

Moved contiguous/alignment size computation part and trim
function to the drm buddy manager.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 253 ++++++++++++++++++++++++++++++++++--
 include/drm/drm_buddy.h     |   6 +-
 2 files changed, 248 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 7098f125b54a..220f60c08a03 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -569,6 +569,197 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
 	return __alloc_range(mm, &dfs, start, size, blocks);
 }
 
+static int __alloc_contiguous_block_from_buddy(struct drm_buddy *mm,
+					       u64 size,
+					       u64 min_block_size,
+					       struct drm_buddy_block *block,
+					       struct list_head *blocks)
+{
+	struct drm_buddy_block *buddy, *parent = NULL;
+	u64 start, offset = 0;
+	LIST_HEAD(dfs);
+	int err;
+
+	if (!block)
+		return -EINVAL;
+
+	buddy = __get_buddy(block);
+	if (!buddy)
+		return -ENOSPC;
+
+	if (drm_buddy_block_is_allocated(buddy))
+		return -ENOSPC;
+
+	parent = block->parent;
+	if (!parent)
+		return -ENOSPC;
+
+	if (block->parent->right == block) {
+		u64 remaining;
+
+		/* Compute the leftover size for allocation */
+		remaining = max((size - drm_buddy_block_size(mm, buddy)),
+				min_block_size);
+		if (!IS_ALIGNED(remaining, min_block_size))
+			remaining = round_up(remaining, min_block_size);
+
+		/* Check if remaining size is greater than buddy block size */
+		if (drm_buddy_block_size(mm, buddy) < remaining)
+			return -ENOSPC;
+
+		offset = drm_buddy_block_size(mm, buddy) - remaining;
+	}
+
+	list_add(&parent->tmp_link, &dfs);
+	start = drm_buddy_block_offset(parent) + offset;
+
+	err = __alloc_range(mm, &dfs, start, size, blocks);
+	if (err)
+		return -ENOSPC;
+
+	return 0;
+}
+
+static int __alloc_contiguous_block_from_peer(struct drm_buddy *mm,
+					      u64 size,
+					      u64 min_block_size,
+					      struct drm_buddy_block *block,
+					      struct list_head *blocks)
+{
+	struct drm_buddy_block *first, *peer, *tmp;
+	struct drm_buddy_block *parent = NULL;
+	u64 start, offset = 0;
+	unsigned int order;
+	LIST_HEAD(dfs);
+	int err;
+
+	if (!block)
+		return -EINVAL;
+
+	order = drm_buddy_block_order(block);
+	/* Add freelist block to dfs list */
+	list_add(&block->tmp_link, &dfs);
+
+	tmp = block;
+	parent = block->parent;
+	while (parent) {
+		if (block->parent->left == block) {
+			if (parent->left != tmp) {
+				peer = parent->left;
+				break;
+			}
+		} else {
+			if (parent->right != tmp) {
+				peer = parent->right;
+				break;
+			}
+		}
+
+		tmp = parent;
+		parent = tmp->parent;
+	}
+
+	if (!parent)
+		return -ENOSPC;
+
+	do {
+		if (drm_buddy_block_is_allocated(peer))
+			return -ENOSPC;
+		/* Exit loop if peer block order is equal to block order */
+		if (drm_buddy_block_order(peer) == order)
+			break;
+
+		if (drm_buddy_block_is_split(peer)) {
+			/* Traverse down to the block order level */
+			if (block->parent->left == block)
+				peer = peer->right;
+			else
+				peer = peer->left;
+		} else {
+			break;
+		}
+	} while (1);
+
+	if (block->parent->left == block) {
+		u64 remaining;
+
+		/* Compute the leftover size for allocation */
+		remaining = max((size - drm_buddy_block_size(mm, block)),
+				min_block_size);
+		if (!IS_ALIGNED(remaining, min_block_size))
+			remaining = round_up(remaining, min_block_size);
+
+		/* Check if remaining size is greater than peer block size */
+		if (drm_buddy_block_size(mm, peer) < remaining)
+			return -ENOSPC;
+
+		offset = drm_buddy_block_size(mm, peer) - remaining;
+		/* Add left peer block to dfs list */
+		list_add(&peer->tmp_link, &dfs);
+	} else {
+		/* Add right peer block to dfs list */
+		list_add_tail(&peer->tmp_link, &dfs);
+	}
+
+	first = list_first_entry_or_null(&dfs,
+					 struct drm_buddy_block,
+					 tmp_link);
+	if (!first)
+		return -EINVAL;
+
+	start = drm_buddy_block_offset(first) + offset;
+	err = __alloc_range(mm, &dfs, start, size, blocks);
+	if (err)
+		return -ENOSPC;
+
+	return 0;
+}
+
+static int __drm_buddy_alloc_contiguous_blocks(struct drm_buddy *mm,
+					       u64 size,
+					       u64 min_block_size,
+					       struct list_head *blocks)
+{
+	struct drm_buddy_block *block;
+	struct list_head *list;
+	unsigned long pages;
+	unsigned int order;
+	u64 modify_size;
+	int err;
+
+	modify_size = rounddown_pow_of_two(size);
+	pages = modify_size >> ilog2(mm->chunk_size);
+	order = fls(pages) - 1;
+	if (order == 0)
+		return -ENOSPC;
+
+	list = &mm->free_list[order];
+	if (list_empty(list))
+		return -ENOSPC;
+
+	list_for_each_entry_reverse(block, list, link) {
+		/* Allocate contiguous blocks from the buddy */
+		err = __alloc_contiguous_block_from_buddy(mm,
+							  size,
+							  min_block_size,
+							  block,
+							  blocks);
+		if (!err)
+			return 0;
+
+		/* Allocate contiguous blocks from tree traversal method */
+		err = __alloc_contiguous_block_from_peer(mm,
+							 size,
+							 min_block_size,
+							 block,
+							 blocks);
+		if (!err)
+			return 0;
+	}
+
+	return -ENOSPC;
+}
+
 /**
  * drm_buddy_block_trim - free unused pages
  *
@@ -645,7 +836,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
  * @start: start of the allowed range for this block
  * @end: end of the allowed range for this block
  * @size: size of the allocation
- * @min_page_size: alignment of the allocation
+ * @min_block_size: alignment of the allocation
  * @blocks: output list head to add allocated blocks
  * @flags: DRM_BUDDY_*_ALLOCATION flags
  *
@@ -660,23 +851,24 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
  */
 int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   u64 start, u64 end, u64 size,
-			   u64 min_page_size,
+			   u64 min_block_size,
 			   struct list_head *blocks,
 			   unsigned long flags)
 {
 	struct drm_buddy_block *block = NULL;
+	u64 original_size, original_min_size;
 	unsigned int min_order, order;
-	unsigned long pages;
 	LIST_HEAD(allocated);
+	unsigned long pages;
 	int err;
 
 	if (size < mm->chunk_size)
 		return -EINVAL;
 
-	if (min_page_size < mm->chunk_size)
+	if (min_block_size < mm->chunk_size)
 		return -EINVAL;
 
-	if (!is_power_of_2(min_page_size))
+	if (!is_power_of_2(min_block_size))
 		return -EINVAL;
 
 	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
@@ -692,12 +884,21 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	if (start + size == end)
 		return __drm_buddy_alloc_range(mm, start, size, blocks);
 
-	if (!IS_ALIGNED(size, min_page_size))
-		return -EINVAL;
+	original_size = size;
+	original_min_size = min_block_size;
+
+	/* Roundup the size to power of 2 */
+	if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) {
+		size = roundup_pow_of_two(size);
+		min_block_size = size;
+	/* Align size value to min_block_size */
+	} else if (!IS_ALIGNED(size, min_block_size)) {
+		size = round_up(size, min_block_size);
+	}
 
 	pages = size >> ilog2(mm->chunk_size);
 	order = fls(pages) - 1;
-	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
+	min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
 
 	do {
 		order = min(order, (unsigned int)fls(pages) - 1);
@@ -716,6 +917,17 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 				break;
 
 			if (order-- == min_order) {
+				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
+				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
+					/*
+					 * Try contiguous block allocation through
+					 * tree traversal method
+					 */
+					return __drm_buddy_alloc_contiguous_blocks(mm,
+										   original_size,
+										   original_min_size,
+										   blocks);
+
 				err = -ENOSPC;
 				goto err_free;
 			}
@@ -732,6 +944,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			break;
 	} while (1);
 
+	/* Trim the allocated block to the required size */
+	if (original_size != size) {
+		struct list_head *trim_list;
+		LIST_HEAD(temp);
+		u64 trim_size;
+
+		trim_list = &allocated;
+		trim_size = original_size;
+
+		if (!list_is_singular(&allocated)) {
+			block = list_last_entry(&allocated, typeof(*block), link);
+			list_move(&block->link, &temp);
+			trim_list = &temp;
+			trim_size = drm_buddy_block_size(mm, block) -
+				(size - original_size);
+		}
+
+		drm_buddy_block_trim(mm,
+				     trim_size,
+				     trim_list);
+
+		if (!list_empty(&temp))
+			list_splice_tail(trim_list, &allocated);
+	}
+
 	list_splice_tail(&allocated, blocks);
 	return 0;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 572077ff8ae7..a5b39fc01003 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -22,8 +22,9 @@
 	start__ >= max__ || size__ > max__ - start__; \
 })
 
-#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
-#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
+#define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
+#define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
+#define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
@@ -155,5 +156,4 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
 void drm_buddy_block_print(struct drm_buddy *mm,
 			   struct drm_buddy_block *block,
 			   struct drm_printer *p);
-
 #endif
-- 
2.25.1

