Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A483799965
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 18:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A1710E1D7;
	Sat,  9 Sep 2023 16:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CBF10E1D7;
 Sat,  9 Sep 2023 16:09:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ej1HFGpc9cu6BRVXszR55QUW+4GvuPdmi1c35F8gaB5+sHsaQ/3M3NsmWUe4EH99Tta8iSGkktxLxcQyI5WDAsr0K/vKMqXxMQBNLIknRMubqw9x6mnuxaWdF5a8Ynz56BMHTweFq7wiEKp+jP+i3QP2WSfaHWR6/A+sNXrttM942U82Q46BCLOncNTOXMzibvmKtcKLmrS0QFUjJIkbZZ918+N5l9whM3q7dh3kFdu3oL3rieqMulcxYXSyu90CzEV4RtXKYIVEzOlhorTFZwJ1D+ONlvd6fiefg2zRMBEI+5/pd21JbmFW6momJrruRGVbdn0If51Y/MisPOG1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeYI9ei3cySy7fw0d07Ze3dXpIWuVVl7sKT0fnUe6S8=;
 b=EO5VchbquNIMmkGNOUinvw3FWJEVkHUB/Ox4aFsK+qCpRUzDSGFg8XR5WSGOlvW8bgtVMWdWcjtFlVkz3mnHG82tSMEWQMdbTE/NQPYPc6Fppz3Re8yz1MD3YW+muEaKmz9O5ey2htlihgMjMRs2R/Rl7uA6wAYfVwclQe4IGgUDoO9x8sjuDoQqomrcWQMcy6373So9bkOX4Br36X57/ESYA1eyGVfJXR/7xTqf2OKQNFVY4CYPNUcv2iZ5WAqKJXp1vbIXj+N1ZkPrOwggcwXcYBLa9ucJ1Zhb3w9GUMOTdeWjUm5KzBmJrGvXmg5m4cS69uUHCs45Cs9Pslnkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeYI9ei3cySy7fw0d07Ze3dXpIWuVVl7sKT0fnUe6S8=;
 b=CMF+fx+XfPeBOiSTMZQOdfkFFp8SJg3kdHKBlvwLhphGpBkvNy0VZ0eCbvXI2bcQ5lWQaQqgLzGU4twOZdOe5up89E6drVE8qUQCY/38FqN/pFj+tzmIquR1TPOOPB6MRoJNg96Bzsz67D8id2F5Sxd+RW5D4XiwomDQOurTo0U=
Received: from BYAPR03CA0004.namprd03.prod.outlook.com (2603:10b6:a02:a8::17)
 by PH8PR12MB8429.namprd12.prod.outlook.com (2603:10b6:510:258::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Sat, 9 Sep
 2023 16:09:27 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a02:a8:cafe::8c) by BYAPR03CA0004.outlook.office365.com
 (2603:10b6:a02:a8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31 via Frontend
 Transport; Sat, 9 Sep 2023 16:09:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Sat, 9 Sep 2023 16:09:26 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 9 Sep 2023 11:09:23 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 1/3] drm/buddy: Improve contiguous memory allocation
Date: Sat, 9 Sep 2023 09:09:00 -0700
Message-ID: <20230909160902.15644-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|PH8PR12MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: c8be3e36-4aed-4204-0ffc-08dbb14f23ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: by3Fm1lyqbhLke4WelZNiBVplBa2LnFKcSjeOfsI4qUsWEd0sJncly+BVZO0M3Sub7b3dO4MrG51l5aSJUl5P5boM6Sonb3dKXNk+5eQhW13qb2QN6gsA/yfKZG8wEbSl/yaQkHQSBtATfyGehxPjBhBC5CtfbTBzHMyDnxMoFSI3QrcDpJ448ha87RyNH0vtc26JkUvbcVJfViGUZcEOmsMdmFCiMQcxLtXra4QBOOSJbt2ebUtFI+VgS3mACkkojlJObqUGa2PlxRipK1Q7B7dnxoEhC58IE1Qsjcn8nAU4D/RQUjMQRTGtHwU1FIyJZ42/PdDZhHRBPfnv8D4lrSzQR4abtr3lsU6pWmb6rU8mYGAUtZHVJ3j4JP6UbXfY9zAsjfyimydVc0ZwbB0h0zUZFXMHCoQQureq8MCvfVYrCDMjroCNbkdHTe5mfGFazHGb2XH1YiL2PHdt0OCKdtmdpYvjgFMHjyV77P9x2YGsafOzimxelarDvZrVLVqse5xGI4DSsO4wzxW4MTuMZQ6PqngjbxjesQkqHv3GbKRiGtn0K/53FPCRO0RILUlit1QD7pwvkl9de4ztdW95H6pBvXLR0u+SKcGlbsGEHMoasCwhFIGJd69Eeu/wvz9Fjvx99OQ236PXZ9WlSaBDFVpSrGZ0627wYv+NqJi+IdCIYcvTPz0IwdZrd/Zltw/l0boEKzXRmLcQSqGbBS2GX99+I47HzHBu0Wlf3iIZRVaMrWUZpzB3uKDOM+S4CgzV8OGuwfpV2OfFAw/y0OTV9pPMWHmwvWoLa3J99rMlpg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(1800799009)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(7696005)(40460700003)(6666004)(83380400001)(356005)(82740400003)(81166007)(86362001)(36860700001)(47076005)(36756003)(2616005)(426003)(336012)(1076003)(26005)(16526019)(40480700001)(70586007)(70206006)(54906003)(110136005)(316002)(41300700001)(2906002)(5660300002)(8936002)(8676002)(4326008)(478600001)(25903002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 16:09:26.4725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8be3e36-4aed-4204-0ffc-08dbb14f23ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8429
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

Problem statement: The current method roundup_power_of_two()
to allocate contiguous address triggers -ENOSPC in some cases
even though we have enough free spaces and so to help with
that we introduce a try harder mechanism.

In case of -ENOSPC, the new try harder mechanism rounddown the
original size to power of 2 and iterating over the round down
sized freelist blocks to allocate the required size traversing
RHS and LHS.

As part of the above new method implementation we moved
contiguous/alignment size computation part and trim function
to the drm buddy file.

v2: Modify the alloc_range() function to return total allocated size
    on -ENOSPC err and traverse RHS/LHS to allocate the required
    size (Matthew).

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c | 138 ++++++++++++++++++++++++++++++++----
 include/drm/drm_buddy.h     |   6 +-
 2 files changed, 127 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 7098f125b54a..e909eed9cf60 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -480,10 +480,12 @@ alloc_from_freelist(struct drm_buddy *mm,
 static int __alloc_range(struct drm_buddy *mm,
 			 struct list_head *dfs,
 			 u64 start, u64 size,
-			 struct list_head *blocks)
+			 struct list_head *blocks,
+			 u64 *total_allocated_on_err)
 {
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
+	u64 total_allocated = 0;
 	LIST_HEAD(allocated);
 	u64 end;
 	int err;
@@ -520,6 +522,7 @@ static int __alloc_range(struct drm_buddy *mm,
 			}
 
 			mark_allocated(block);
+			total_allocated += drm_buddy_block_size(mm, block);
 			mm->avail -= drm_buddy_block_size(mm, block);
 			list_add_tail(&block->link, &allocated);
 			continue;
@@ -551,13 +554,20 @@ static int __alloc_range(struct drm_buddy *mm,
 		__drm_buddy_free(mm, block);
 
 err_free:
-	drm_buddy_free_list(mm, &allocated);
+	if (err == -ENOSPC && total_allocated_on_err) {
+		list_splice_tail(&allocated, blocks);
+		*total_allocated_on_err = total_allocated;
+	} else {
+		drm_buddy_free_list(mm, &allocated);
+	}
+
 	return err;
 }
 
 static int __drm_buddy_alloc_range(struct drm_buddy *mm,
 				   u64 start,
 				   u64 size,
+				   u64 *total_allocated_on_err,
 				   struct list_head *blocks)
 {
 	LIST_HEAD(dfs);
@@ -566,7 +576,62 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
 	for (i = 0; i < mm->n_roots; ++i)
 		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
 
-	return __alloc_range(mm, &dfs, start, size, blocks);
+	return __alloc_range(mm, &dfs, start, size,
+			     blocks, total_allocated_on_err);
+}
+
+static int __alloc_contig_try_harder(struct drm_buddy *mm,
+				     u64 size,
+				     u64 min_block_size,
+				     struct list_head *blocks)
+{
+	u64 rhs_offset, lhs_offset, lhs_size, filled;
+	struct drm_buddy_block *block;
+	struct list_head *list;
+	LIST_HEAD(blocks_lhs);
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
+		/* Allocate blocks traversing RHS */
+		rhs_offset = drm_buddy_block_offset(block);
+		err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
+					       &filled, blocks);
+		if (!err || err != -ENOSPC)
+			return err;
+
+		lhs_size = max((size - filled), min_block_size);
+		if (!IS_ALIGNED(lhs_size, min_block_size))
+			lhs_size = round_up(lhs_size, min_block_size);
+
+		/* Allocate blocks traversing LHS */
+		lhs_offset = drm_buddy_block_offset(block) - lhs_size;
+		err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
+					       NULL, &blocks_lhs);
+		if (!err) {
+			list_splice(&blocks_lhs, blocks);
+			return 0;
+		} else if (err != -ENOSPC) {
+			drm_buddy_free_list(mm, blocks);
+			return err;
+		}
+		/* Free blocks for the next iteration */
+		drm_buddy_free_list(mm, blocks);
+	}
+
+	return -ENOSPC;
 }
 
 /**
@@ -626,7 +691,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 
 	new_start = drm_buddy_block_offset(block);
 	list_add(&block->tmp_link, &dfs);
-	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
+	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
 	if (err) {
 		mark_allocated(block);
 		mm->avail -= drm_buddy_block_size(mm, block);
@@ -645,7 +710,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
  * @start: start of the allowed range for this block
  * @end: end of the allowed range for this block
  * @size: size of the allocation
- * @min_page_size: alignment of the allocation
+ * @min_block_size: alignment of the allocation
  * @blocks: output list head to add allocated blocks
  * @flags: DRM_BUDDY_*_ALLOCATION flags
  *
@@ -660,23 +725,24 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
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
@@ -690,14 +756,23 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 
 	/* Actual range allocation */
 	if (start + size == end)
-		return __drm_buddy_alloc_range(mm, start, size, blocks);
-
-	if (!IS_ALIGNED(size, min_page_size))
-		return -EINVAL;
+		return __drm_buddy_alloc_range(mm, start, size, NULL, blocks);
+
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
@@ -716,6 +791,16 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 				break;
 
 			if (order-- == min_order) {
+				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
+				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
+					/*
+					 * Try contiguous block allocation through
+					 * try harder method
+					 */
+					return __alloc_contig_try_harder(mm,
+									 original_size,
+									 original_min_size,
+									 blocks);
 				err = -ENOSPC;
 				goto err_free;
 			}
@@ -732,6 +817,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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

