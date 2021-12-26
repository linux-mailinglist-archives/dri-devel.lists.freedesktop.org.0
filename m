Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07347F8DB
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 21:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B85810F21A;
	Sun, 26 Dec 2021 20:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FCE10F213;
 Sun, 26 Dec 2021 20:53:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOhm6ripOoaoshATbqd6g7Ry8S7QT9dQBNCLpe0uJLJcJKkc/YvmamAccHLaISUp6s2IAja+0MFQBtceCsLGqzmYpAxgj/IJweQ2H8Qkh2bhzO2x5FuyaFHZuAFOuVlLIzVgYwhPUkEY/x0VEsSTdyR2X0w7MLqyUlLNse5LK60MqtiDDHZJpt6gBHDK5tyYC4aZOVDBgjGy2AwVtyixyay8xMa31nVR+3Z3XQwWjSzdZd2klMkWXeV0dt5fatcO9YnNH/BfWgFi/mBAtlHrMSmbrptrthXei6Ioyl8hDzcus+xsCEXePx2wHNlAN9dpH2pNLEqSkH9TRDD0XSXYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IViE4azhMS2ztbbnOTaLI5QbhK7VnlMYR9jqnoIif6w=;
 b=LIhxPAv7pKOtyfMDhDiBUfyMCG7+fNtekn2ixS70bxEDHyzz264q9aHKhs2P5vtKioNFPUEQZZdHa7/Kc3Q4cTxFnQUtYNq3v8fVl9fhWGCqFaG/dap2/s1wISsrn5EqldJAsoLM1kVW9XTo6XmmAWA6ZjtC1Rx48LbNhajyvEaYDHiwJMTbEefLXpcd1Rrjx76VNxNoAH0c7btZO9YjdWOTnrFJYTJnohNiqz0QFgcJdXyJoYCF0/7Rzn1b+fIyDdmwgdfhRqXoLD5IzXqVgnUkyeu4PcJ5R9dFMwE5LD9712/bMkgj5Y97jx0X2L2BwpkbApmnsk3Ku2K8logs1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IViE4azhMS2ztbbnOTaLI5QbhK7VnlMYR9jqnoIif6w=;
 b=uv6SqwTrPLMzmlDGOFgFq6r+rJjoasCjHpFkBni1ujhrlWLbWd+yNtGSTNv5D2VIGN4nyn88cX+rYo+TsP0BH4mFsgxQ4VwqpIWYkcEXE0vrAgHXXeZJKorElZK/FqaYj0NXmU2Y+FYZgThoI6gqJA98qVYkU2HBZGkItFV3uGk=
Received: from MW4P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::16)
 by BY5PR12MB3796.namprd12.prod.outlook.com (2603:10b6:a03:1ae::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Sun, 26 Dec
 2021 20:53:22 +0000
Received: from CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::b5) by MW4P222CA0011.outlook.office365.com
 (2603:10b6:303:114::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Sun, 26 Dec 2021 20:53:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT040.mail.protection.outlook.com (10.13.174.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Sun, 26 Dec 2021 20:53:21 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 26 Dec
 2021 14:53:18 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v5 2/6] drm: improve drm_buddy_alloc function
Date: Mon, 27 Dec 2021 02:22:31 +0530
Message-ID: <20211226205235.142049-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226205235.142049-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211226205235.142049-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 006002cf-7e8f-42c9-4135-08d9c8b1c0d6
X-MS-TrafficTypeDiagnostic: BY5PR12MB3796:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3796890D767CE0D907A50793E4419@BY5PR12MB3796.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h2CixXlh7ecL4uJ3Th5KH9LdTjgcj/Qb2eRQZWYgt+C6thFyB2W/TYqcqfqSZxeaGhOlQetEVdHb1fip5zmdf8Yl58vFQwbYTb/1FTVKxa9SNFoft10Gs2l/ICquRZUi1Zfa+nih5hZazy7Q5g7HDXkBYLAcmYwzGnJZBeCrASVB2pSp2CZcao53VgHhdfZrlLUxDw3Ghwm6mio2w+bkXfAXRLWwHzfw+z5IGtoRtj8WHBIcb//yW0Td9ibh3ZeORVM/SiIjQfh6iIql0yKuAGJDHwWkXYa1TNgzzoR2PXBm7d8N7G+bxAcIELhimwxHhG2Cud4Ze2qJ6eIbbv/2SqEXIMSL9bkDsKKxGrEJ702CcOtsYhMQEcZzeN5HEEahkpl5meqMmmYD3aofp3NmQbJ0X+mRA1hmi4HO4+P/RjuEV/kxRPJNao8CH/DLR9sVeavlRzBnaSWo6Gt+BqRTyZqNBKKgwWfTtyg/gkmR1qLUPMWJ+RtHzpq1kr1FUcAKd6d4Fa2bz8oDhThLC4HVq8G6UbZg14Qg4B8UGs4osOCebs40B1s0FbCOPvtXbWCzQ/KnBfs3tHddG/tm1xd92MVJuZKyDEGF2CLitCCPlBL/eRT59jc9jVWvNajIzuyhhTDTYcdFOblxYeqIJHQy2yrnYoi7jtq0NIXOp+VpLh8QCGk0nOpKduSY7fCNkg2OKbd0VSbvQUAbFYHbm0ziZLwqjW7zXvs6ONBZEN1V8mk0gq4vy7lS8cRVmWfi1KUKjHq3D5LLUuKW7iQ7MBlpvFgd9XvNGx+CtuRHs7y6pWA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(81166007)(2616005)(1076003)(356005)(70586007)(6666004)(70206006)(86362001)(316002)(110136005)(508600001)(54906003)(426003)(36756003)(2906002)(8936002)(8676002)(26005)(36860700001)(186003)(4326008)(16526019)(5660300002)(40460700001)(82310400004)(83380400001)(7696005)(30864003)(47076005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2021 20:53:21.7950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 006002cf-7e8f-42c9-4135-08d9c8b1c0d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3796
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Make drm_buddy_alloc a single function to handle
  range allocation and non-range allocation demands

- Implemented a new function alloc_range() which allocates
  the requested power-of-two block comply with range limitations

- Moved order computation and memory alignment logic from
  i915 driver to drm buddy

v2:
  merged below changes to keep the build unbroken
   - drm_buddy_alloc_range() becomes obsolete and may be removed
   - enable ttm range allocation (fpfn / lpfn) support in i915 driver
   - apply enhanced drm_buddy_alloc() function to i915 driver

v3(Matthew Auld):
  - Fix alignment issues and remove unnecessary list_empty check
  - add more validation checks for input arguments
  - make alloc_range() block allocations as bottom-up
  - optimize order computation logic
  - replace uint64_t with u64, which is preferred in the kernel

v4(Matthew Auld):
  - keep drm_buddy_alloc_range() function implementation for generic
    actual range allocations
  - keep alloc_range() implementation for end bias allocations

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 316 +++++++++++++-----
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++--
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
 include/drm/drm_buddy.h                       |  22 +-
 4 files changed, 285 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 9340a4b61c5a..7f47632821f4 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -280,23 +280,97 @@ void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
 }
 EXPORT_SYMBOL(drm_buddy_free_list);
 
-/**
- * drm_buddy_alloc - allocate power-of-two blocks
- *
- * @mm: DRM buddy manager to allocate from
- * @order: size of the allocation
- *
- * The order value here translates to:
- *
- * 0 = 2^0 * mm->chunk_size
- * 1 = 2^1 * mm->chunk_size
- * 2 = 2^2 * mm->chunk_size
- *
- * Returns:
- * allocated ptr to the &drm_buddy_block on success
- */
-struct drm_buddy_block *
-drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
+static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
+{
+	return s1 <= e2 && e1 >= s2;
+}
+
+static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
+{
+	return s1 <= s2 && e1 >= e2;
+}
+
+static struct drm_buddy_block *
+alloc_range_bias(struct drm_buddy_mm *mm,
+		 u64 start, u64 end,
+		 unsigned int order)
+{
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *buddy;
+	LIST_HEAD(dfs);
+	int err;
+	int i;
+
+	end = end - 1;
+
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	do {
+		u64 block_start;
+		u64 block_end;
+
+		block = list_first_entry_or_null(&dfs,
+						 struct drm_buddy_block,
+						 tmp_link);
+		if (!block)
+			break;
+
+		list_del(&block->tmp_link);
+
+		if (drm_buddy_block_order(block) < order)
+			continue;
+
+		block_start = drm_buddy_block_offset(block);
+		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
+
+		if (!overlaps(start, end, block_start, block_end))
+			continue;
+
+		if (drm_buddy_block_is_allocated(block))
+			continue;
+
+		if (contains(start, end, block_start, block_end) &&
+		    order == drm_buddy_block_order(block)) {
+			/*
+			 * Find the free block within the range.
+			 */
+			if (drm_buddy_block_is_free(block))
+				return block;
+
+			continue;
+		}
+
+		if (!drm_buddy_block_is_split(block)) {
+			err = split_block(mm, block);
+			if (unlikely(err))
+				goto err_undo;
+		}
+
+		list_add(&block->right->tmp_link, &dfs);
+		list_add(&block->left->tmp_link, &dfs);
+	} while (1);
+
+	return ERR_PTR(-ENOSPC);
+
+err_undo:
+	/*
+	 * We really don't want to leave around a bunch of split blocks, since
+	 * bigger is better, so make sure we merge everything back before we
+	 * free the allocated blocks.
+	 */
+	buddy = get_buddy(block);
+	if (buddy &&
+	    (drm_buddy_block_is_free(block) &&
+	     drm_buddy_block_is_free(buddy)))
+		__drm_buddy_free(mm, block);
+	return ERR_PTR(err);
+}
+
+static struct drm_buddy_block *
+alloc_from_freelist(struct drm_buddy_mm *mm,
+		    unsigned int order,
+		    unsigned long flags)
 {
 	struct drm_buddy_block *block = NULL;
 	unsigned int i;
@@ -318,78 +392,28 @@ drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
 	while (i != order) {
 		err = split_block(mm, block);
 		if (unlikely(err))
-			goto out_free;
+			goto err_undo;
 
-		/* Go low */
-		block = block->left;
+		block = block->right;
 		i--;
 	}
-
-	mark_allocated(block);
-	mm->avail -= drm_buddy_block_size(mm, block);
-	kmemleak_update_trace(block);
 	return block;
 
-out_free:
+err_undo:
 	if (i != order)
 		__drm_buddy_free(mm, block);
 	return ERR_PTR(err);
 }
-EXPORT_SYMBOL(drm_buddy_alloc);
-
-static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
-{
-	return s1 <= e2 && e1 >= s2;
-}
 
-static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
-{
-	return s1 <= s2 && e1 >= e2;
-}
-
-/**
- * drm_buddy_alloc_range - allocate range
- *
- * @mm: DRM buddy manager to allocate from
- * @blocks: output list head to add allocated blocks
- * @start: start of the allowed range for this block
- * @size: size of the allocation
- *
- * Intended for pre-allocating portions of the address space, for example to
- * reserve a block for the initial framebuffer or similar, hence the expectation
- * here is that drm_buddy_alloc() is still the main vehicle for
- * allocations, so if that's not the case then the drm_mm range allocator is
- * probably a much better fit, and so you should probably go use that instead.
- *
- * Note that it's safe to chain together multiple alloc_ranges
- * with the same blocks list
- *
- * Returns:
- * 0 on success, error code on failure.
- */
-int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size)
+static int __alloc_range(struct drm_buddy_mm *mm,
+			 struct list_head *dfs,
+			 u64 start, u64 size,
+			 struct list_head *blocks)
 {
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
-	LIST_HEAD(allocated);
-	LIST_HEAD(dfs);
 	u64 end;
 	int err;
-	int i;
-
-	if (size < mm->chunk_size)
-		return -EINVAL;
-
-	if (!IS_ALIGNED(size | start, mm->chunk_size))
-		return -EINVAL;
-
-	if (range_overflows(start, size, mm->size))
-		return -EINVAL;
-
-	for (i = 0; i < mm->n_roots; ++i)
-		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
 
 	end = start + size - 1;
 
@@ -397,7 +421,7 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 		u64 block_start;
 		u64 block_end;
 
-		block = list_first_entry_or_null(&dfs,
+		block = list_first_entry_or_null(dfs,
 						 struct drm_buddy_block,
 						 tmp_link);
 		if (!block)
@@ -424,7 +448,7 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 
 			mark_allocated(block);
 			mm->avail -= drm_buddy_block_size(mm, block);
-			list_add_tail(&block->link, &allocated);
+			list_add_tail(&block->link, blocks);
 			continue;
 		}
 
@@ -434,11 +458,10 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 				goto err_undo;
 		}
 
-		list_add(&block->right->tmp_link, &dfs);
-		list_add(&block->left->tmp_link, &dfs);
+		list_add(&block->right->tmp_link, dfs);
+		list_add(&block->left->tmp_link, dfs);
 	} while (1);
 
-	list_splice_tail(&allocated, blocks);
 	return 0;
 
 err_undo:
@@ -453,11 +476,144 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 	     drm_buddy_block_is_free(buddy)))
 		__drm_buddy_free(mm, block);
 
+err_free:
+	drm_buddy_free_list(mm, blocks);
+	return err;
+}
+
+/**
+ * __drm_buddy_alloc_range - actual range allocation
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @start: start of the allowed range for this block
+ * @size: size of the allocation
+ * @blocks: output list head to add allocated blocks
+ *
+ * Intended for pre-allocating portions of the address space, for example to
+ * reserve a block for the initial framebuffer or similar
+ *
+ * Note that it's safe to chain together multiple alloc_ranges
+ * with the same blocks list
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+static int __drm_buddy_alloc_range(struct drm_buddy_mm *mm,
+				   u64 start,
+				   u64 size,
+				   struct list_head *blocks)
+{
+	LIST_HEAD(dfs);
+	int i;
+
+	for (i = 0; i < mm->n_roots; ++i)
+		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
+
+	return __alloc_range(mm, &dfs, start, size, blocks);
+}
+
+/**
+ * drm_buddy_alloc - allocate power-of-two blocks
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @start: start of the allowed range for this block
+ * @end: end of the allowed range for this block
+ * @size: size of the allocation
+ * @min_page_size: alignment of the allocation
+ * @blocks: output list head to add allocated blocks
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
+ *
+ * alloc_range_bias() called on range limitations, which traverses
+ * the tree and returns the desired block.
+ *
+ * alloc_from_freelist() called when *no* range restrictions
+ * are enforced, which picks the block from the freelist.
+ *
+ * blocks are allocated in order, the order value here translates to:
+ *
+ * 0 = 2^0 * mm->chunk_size
+ * 1 = 2^1 * mm->chunk_size
+ * 2 = 2^2 * mm->chunk_size
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags)
+{
+	struct drm_buddy_block *block = NULL;
+	unsigned int min_order, order;
+	unsigned long pages;
+	LIST_HEAD(allocated);
+	int err;
+
+	if (size < mm->chunk_size)
+		return -EINVAL;
+
+	if (min_page_size < mm->chunk_size)
+		return -EINVAL;
+
+	if (!is_power_of_2(min_page_size))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
+		return -EINVAL;
+
+	if (check_range_overflow(start, end, size, mm->size))
+		return -EINVAL;
+
+	/* Actual range allocation */
+	if (start + size == end)
+		return __drm_buddy_alloc_range(mm, start, size, blocks);
+
+	pages = size >> ilog2(mm->chunk_size);
+	order = fls(pages) - 1;
+	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
+
+	do {
+		order = min(order, (unsigned int)fls(pages) - 1);
+		BUG_ON(order > mm->max_order);
+		BUG_ON(order < min_order);
+
+		do {
+			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
+				/* Allocate traversing within the range */
+				block = alloc_range_bias(mm, start, end, order);
+			else
+				/* Allocate from freelist */
+				block = alloc_from_freelist(mm, order, flags);
+
+			if (!IS_ERR(block))
+				break;
+
+			if (order-- == min_order) {
+				err = -ENOSPC;
+				goto err_free;
+			}
+		} while (1);
+
+		mark_allocated(block);
+		mm->avail -= drm_buddy_block_size(mm, block);
+		kmemleak_update_trace(block);
+		list_add_tail(&block->link, &allocated);
+
+		pages -= BIT(order);
+
+		if (!pages)
+			break;
+	} while (1);
+
+	list_splice_tail(&allocated, blocks);
+	return 0;
+
 err_free:
 	drm_buddy_free_list(mm, &allocated);
 	return err;
 }
-EXPORT_SYMBOL(drm_buddy_alloc_range);
+EXPORT_SYMBOL(drm_buddy_alloc);
 
 /**
  * drm_buddy_block_print - print block information
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index c4b70cb8c248..7621d42155e6 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct i915_ttm_buddy_resource *bman_res;
 	struct drm_buddy_mm *mm = &bman->mm;
-	unsigned long n_pages;
-	unsigned int min_order;
+	unsigned long n_pages, lpfn;
 	u64 min_page_size;
 	u64 size;
 	int err;
 
-	GEM_BUG_ON(place->fpfn || place->lpfn);
+	lpfn = place->lpfn;
+	if (!lpfn)
+		lpfn = man->size;
 
 	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
 	if (!bman_res)
@@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm = mm;
 
+	if (place->fpfn || lpfn != man->size)
+		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
+
 	GEM_BUG_ON(!bman_res->base.num_pages);
 	size = bman_res->base.num_pages << PAGE_SHIFT;
 
@@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		min_page_size = bo->page_alignment << PAGE_SHIFT;
 
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
-	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
+
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		unsigned long pages;
+
 		size = roundup_pow_of_two(size);
-		min_order = ilog2(size) - ilog2(mm->chunk_size);
+		min_page_size = size;
+
+		pages = size >> ilog2(mm->chunk_size);
+		if (pages > lpfn)
+			lpfn = pages;
 	}
 
 	if (size > mm->size) {
@@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
 	n_pages = size >> ilog2(mm->chunk_size);
 
-	do {
-		struct drm_buddy_block *block;
-		unsigned int order;
-
-		order = fls(n_pages) - 1;
-		GEM_BUG_ON(order > mm->max_order);
-		GEM_BUG_ON(order < min_order);
-
-		do {
-			mutex_lock(&bman->lock);
-			block = drm_buddy_alloc(mm, order);
-			mutex_unlock(&bman->lock);
-			if (!IS_ERR(block))
-				break;
-
-			if (order-- == min_order) {
-				err = -ENOSPC;
-				goto err_free_blocks;
-			}
-		} while (1);
-
-		n_pages -= BIT(order);
-
-		list_add_tail(&block->link, &bman_res->blocks);
-
-		if (!n_pages)
-			break;
-	} while (1);
+	mutex_lock(&bman->lock);
+	err = drm_buddy_alloc(mm, (u64)place->fpfn << PAGE_SHIFT,
+			(u64)place->lpfn << PAGE_SHIFT,
+			(u64)n_pages << PAGE_SHIFT,
+			 min_page_size,
+			 &bman_res->blocks,
+			 bman_res->flags);
+	mutex_unlock(&bman->lock);
+	if (unlikely(err))
+		goto err_free_blocks;
 
 	*res = &bman_res->base;
 	return 0;
@@ -266,10 +258,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct drm_buddy_mm *mm = &bman->mm;
+	unsigned long flags = 0;
 	int ret;
 
+	flags |= DRM_BUDDY_RANGE_ALLOCATION;
+
 	mutex_lock(&bman->lock);
-	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
+	ret = drm_buddy_alloc(mm, start,
+			start + size,
+			size, mm->chunk_size,
+			&bman->reserved,
+			flags);
 	mutex_unlock(&bman->lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
index fa644b512c2e..5ba490875f66 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -20,6 +20,7 @@ struct drm_buddy_mm;
  *
  * @base: struct ttm_resource base class we extend
  * @blocks: the list of struct i915_buddy_block for this resource/allocation
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
  * @mm: the struct i915_buddy_mm for this resource
  *
  * Extends the struct ttm_resource to manage an address space allocation with
@@ -28,6 +29,7 @@ struct drm_buddy_mm;
 struct i915_ttm_buddy_resource {
 	struct ttm_resource base;
 	struct list_head blocks;
+	unsigned long flags;
 	struct drm_buddy_mm *mm;
 };
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 09d73328c268..4368acaad222 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -13,15 +13,22 @@
 
 #include <drm/drm_print.h>
 
-#define range_overflows(start, size, max) ({ \
+#define check_range_overflow(start, end, size, max) ({ \
 	typeof(start) start__ = (start); \
+	typeof(end) end__ = (end);\
 	typeof(size) size__ = (size); \
 	typeof(max) max__ = (max); \
 	(void)(&start__ == &size__); \
 	(void)(&start__ == &max__); \
-	start__ >= max__ || size__ > max__ - start__; \
+	(void)(&start__ == &end__); \
+	(void)(&end__ == &size__); \
+	(void)(&end__ == &max__); \
+	start__ >= max__ || end__ > max__ || \
+	size__ > end__ - start__; \
 })
 
+#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
@@ -132,12 +139,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
 
 void drm_buddy_fini(struct drm_buddy_mm *mm);
 
-struct drm_buddy_block *
-drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
-
-int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size);
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags);
 
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
 
-- 
2.25.1

