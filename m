Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD91185D7C5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 13:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E8910E70D;
	Wed, 21 Feb 2024 12:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k6wmJAzL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2076.outbound.protection.outlook.com [40.107.212.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5639610E6F5;
 Wed, 21 Feb 2024 12:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtZNybRIbQWDpInQX5qjyL1RqFyCjEuHJuJvpadL1mIQwclF7hHSch1aFP/lU593GZ1lxyYNBIUEUw/h8GbqhvxkeYcQM4GSEK/LVRmexv0ZpXptmbbBXDTp+qbbKn6sy9IwT7zQDh8YmFJPMBdepPB/E36wEZNp0PTUYwb9SNzeZfevuXdHeT//rJpwyACMjniYlmQ0c/Hw9yB7CPrbJebgcFbeHVD5dSRgmC/NUaqFpQtJes4JPlZT1OkdgQKyALjc0pjXzFdOVlSgE7lUo8/DkSy8hbooZQYM+PAObBHr2+SIZVVPOekLww1mOkbpk3YWha66OUm0p7fqBAzmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKraUTYgrPLy8+MRpxe4BTXJ2yO9C9aomiF/vefSgdM=;
 b=Xlf6buV2JhGjTvZYiYbDGPdl6I6KmkXfuEa6kUtfeIZITmZCWv0Kr4JJ13SvsGeqJN8npdP2dPFeWg/tuxbY6OLDVLG9C+jlYJvvRmuNcMS/AUGY3M811M3H3szGZsnAm7UvIzGXN8YqmwEhb9Pltq5dxYwk25rppG+A2MupILWtVXt1IufYN8X6upE6H2Ufi5tTzMlvk5+8GObuSTsxRHA//KaVXAfXi88nyiieVk3bsVV64s2ztjDjg7ZMV0XrrI47MiprCbiRxsW4na6CPPYnWh/7D/qK9aq4WX8lhwULpds3dmZKA5dXkPAeKf8kVfgoHZo4CPd5qX/db6mOew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKraUTYgrPLy8+MRpxe4BTXJ2yO9C9aomiF/vefSgdM=;
 b=k6wmJAzLi6M44nnb4p5jjzGXkzce2G06ZP1B3Np+wFaPpc110XdXRYsVs1GLyQwRCfOO8x3D9MbAy8vfaHmhy34bfEJuz6MUjaGFZ65M6hKMYMu3N6fYEOrDhdiR5a81FKPHljnri8LphsuZttqriNcH9DqDDRtGr8uxnOM6h7g=
Received: from DM6PR02CA0135.namprd02.prod.outlook.com (2603:10b6:5:1b4::37)
 by DS7PR12MB6046.namprd12.prod.outlook.com (2603:10b6:8:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Wed, 21 Feb
 2024 12:18:28 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:5:1b4:cafe::e1) by DM6PR02CA0135.outlook.office365.com
 (2603:10b6:5:1b4::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.42 via Frontend
 Transport; Wed, 21 Feb 2024 12:18:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 21 Feb 2024 12:18:28 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 06:18:24 -0600
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <felix.kuehling@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v7 1/3] drm/buddy: Implement tracking clear page feature
Date: Wed, 21 Feb 2024 17:47:59 +0530
Message-ID: <20240221121801.3252-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DS7PR12MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: e92abc91-510a-4db1-2324-08dc32d735d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1Qd1YieIGGPZHh8+T7i7DdhreCSugIXcL47sou5PPVAREpm4eKUIhkg8t/2hSiLi3JJh76IhhjfpWjd1OJFkDw9+k3pnrL8nPRL3SSOI59jfgX1tNKnYpkIRB3fLr5DbChPJf/88PQ09vVg1U7hFSOOx4/oC/mt4DuHzgMvqvMb7KUdR/6OjUI1u7Ujdpv3MYaq6fmdvjW5zfLp9He6g5PLi1gxsekEfq8wbTvTeyX7QVmBnCB4OnEOFANdbW2q0IoTODYMdDuvhRNMd4ABktlnWkozHWdNmXulMTY7Wuij2agsh5DYCaFCIZxIzHMd3w5y9S5n0vBrs/PZ6Mzc15Pdp94OBsxG2hZWu6tfbQwamOugSID+eRbQmQaHyQ+1t8T9XH4ZGlulH6gLCkQ2i1gVVh38N1TWZm4mrl3iJCBGg16u3Rw5ahUwGLKgXFEnhjk5FILytyj+PB/ffQQCnI04e3rZE6QuJLCaSjsvL/TgTNGaVLShNlRivOtfSr54gXhE9RmhTNX/FjsjiaOSk1hyGEgmvuclIJismHzNuIGi4V0ekNfX1HfAq/rtEV25j5WNllFAEeuUtPXayrT3C7b9TKicTXHv8vbIvUy6pZ4RNty4JEJCZxR2DhhYcyFn89wg132ms+BBwj/jVCbMptMQ+1b8SnFB7mFeVi1sLcQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(46966006)(40470700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 12:18:28.1454 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e92abc91-510a-4db1-2324-08dc32d735d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6046
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

- Add tracking clear page feature.

- Driver should enable the DRM_BUDDY_CLEARED flag if it
  successfully clears the blocks in the free path. On the otherhand,
  DRM buddy marks each block as cleared.

- Track the available cleared pages size

- If driver requests cleared memory we prefer cleared memory
  but fallback to uncleared if we can't find the cleared blocks.
  when driver requests uncleared memory we try to use uncleared but
  fallback to cleared memory if necessary.

- When a block gets freed we clear it and mark the freed block as cleared,
  when there are buddies which are cleared as well we can merge them.
  Otherwise, we prefer to keep the blocks as separated.

v1: (Christian)
  - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
    cleared. Else, reset the clear flag for each block in the list.

  - For merging the 2 cleared blocks compare as below,
    drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)

v2: (Matthew)
  - Add a wrapper drm_buddy_free_list_internal for the freeing of blocks
    operation within drm buddy.
  - Write a macro block_incompatible() to allocate the required blocks.
  - Update the xe driver for the drm_buddy_free_list change in arguments.

v3: (Matthew)
  - Keep DRM_BUDDY_HEADER_CLEAR define sorted.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
 drivers/gpu/drm/drm_buddy.c                   | 190 ++++++++++++++----
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
 drivers/gpu/drm/tests/drm_buddy_test.c        |  10 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   4 +-
 include/drm/drm_buddy.h                       |  19 +-
 6 files changed, 186 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 8db880244324..c0c851409241 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -571,7 +571,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	return 0;
 
 error_free_blocks:
-	drm_buddy_free_list(mm, &vres->blocks);
+	drm_buddy_free_list(mm, &vres->blocks, 0);
 	mutex_unlock(&mgr->lock);
 error_fini:
 	ttm_resource_fini(man, &vres->base);
@@ -604,7 +604,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 
 	amdgpu_vram_mgr_do_reserve(man);
 
-	drm_buddy_free_list(mm, &vres->blocks);
+	drm_buddy_free_list(mm, &vres->blocks, 0);
 	mutex_unlock(&mgr->lock);
 
 	atomic64_sub(vis_usage, &mgr->vis_usage);
@@ -912,7 +912,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
 		kfree(rsv);
 
 	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, blocks) {
-		drm_buddy_free_list(&mgr->mm, &rsv->allocated);
+		drm_buddy_free_list(&mgr->mm, &rsv->allocated, 0);
 		kfree(rsv);
 	}
 	if (!adev->gmc.is_app_apu)
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index f57e6d74fb0e..18e004fa39d3 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -57,6 +57,16 @@ static void list_insert_sorted(struct drm_buddy *mm,
 	__list_add(&block->link, node->link.prev, &node->link);
 }
 
+static void clear_reset(struct drm_buddy_block *block)
+{
+	block->header &= ~DRM_BUDDY_HEADER_CLEAR;
+}
+
+static void mark_cleared(struct drm_buddy_block *block)
+{
+	block->header |= DRM_BUDDY_HEADER_CLEAR;
+}
+
 static void mark_allocated(struct drm_buddy_block *block)
 {
 	block->header &= ~DRM_BUDDY_HEADER_STATE;
@@ -223,6 +233,12 @@ static int split_block(struct drm_buddy *mm,
 	mark_free(mm, block->left);
 	mark_free(mm, block->right);
 
+	if (drm_buddy_block_is_clear(block)) {
+		mark_cleared(block->left);
+		mark_cleared(block->right);
+		clear_reset(block);
+	}
+
 	mark_split(block);
 
 	return 0;
@@ -273,6 +289,13 @@ static void __drm_buddy_free(struct drm_buddy *mm,
 		if (!drm_buddy_block_is_free(buddy))
 			break;
 
+		if (drm_buddy_block_is_clear(block) !=
+		    drm_buddy_block_is_clear(buddy))
+			break;
+
+		if (drm_buddy_block_is_clear(block))
+			mark_cleared(parent);
+
 		list_del(&buddy->link);
 
 		drm_block_free(mm, block);
@@ -295,26 +318,59 @@ void drm_buddy_free_block(struct drm_buddy *mm,
 {
 	BUG_ON(!drm_buddy_block_is_allocated(block));
 	mm->avail += drm_buddy_block_size(mm, block);
+	if (drm_buddy_block_is_clear(block))
+		mm->clear_avail += drm_buddy_block_size(mm, block);
+
 	__drm_buddy_free(mm, block);
 }
 EXPORT_SYMBOL(drm_buddy_free_block);
 
-/**
- * drm_buddy_free_list - free blocks
- *
- * @mm: DRM buddy manager
- * @objects: input list head to free blocks
- */
-void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
+static void __drm_buddy_free_list(struct drm_buddy *mm,
+				  struct list_head *objects,
+				  bool mark_clear,
+				  bool mark_dirty)
 {
 	struct drm_buddy_block *block, *on;
 
+	WARN_ON(mark_dirty && mark_clear);
+
 	list_for_each_entry_safe(block, on, objects, link) {
+		if (mark_clear)
+			mark_cleared(block);
+		else if (mark_dirty)
+			clear_reset(block);
 		drm_buddy_free_block(mm, block);
 		cond_resched();
 	}
 	INIT_LIST_HEAD(objects);
 }
+
+static void drm_buddy_free_list_internal(struct drm_buddy *mm,
+					 struct list_head *objects)
+{
+	/*
+	 * Don't touch the clear/dirty bit, since allocation is still internal
+	 * at this point. For example we might have just failed part of the
+	 * allocation.
+	 */
+	__drm_buddy_free_list(mm, objects, false, false);
+}
+
+/**
+ * drm_buddy_free_list - free blocks
+ *
+ * @mm: DRM buddy manager
+ * @objects: input list head to free blocks
+ * @flags: optional flags like DRM_BUDDY_CLEARED
+ */
+void drm_buddy_free_list(struct drm_buddy *mm,
+			 struct list_head *objects,
+			 unsigned int flags)
+{
+	bool mark_clear = flags & DRM_BUDDY_CLEARED;
+
+	__drm_buddy_free_list(mm, objects, mark_clear, !mark_clear);
+}
 EXPORT_SYMBOL(drm_buddy_free_list);
 
 static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
@@ -327,10 +383,19 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
 	return s1 <= s2 && e1 >= e2;
 }
 
+static bool block_incompatible(struct drm_buddy_block *block, unsigned int flags)
+{
+	bool needs_clear = flags & DRM_BUDDY_CLEAR_ALLOCATION;
+
+	return needs_clear != drm_buddy_block_is_clear(block);
+}
+
 static struct drm_buddy_block *
-alloc_range_bias(struct drm_buddy *mm,
-		 u64 start, u64 end,
-		 unsigned int order)
+__alloc_range_bias(struct drm_buddy *mm,
+		   u64 start, u64 end,
+		   unsigned int order,
+		   unsigned long flags,
+		   bool fallback)
 {
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
@@ -369,6 +434,9 @@ alloc_range_bias(struct drm_buddy *mm,
 
 		if (contains(start, end, block_start, block_end) &&
 		    order == drm_buddy_block_order(block)) {
+			if (!fallback && block_incompatible(block, flags))
+				continue;
+
 			/*
 			 * Find the free block within the range.
 			 */
@@ -405,25 +473,52 @@ alloc_range_bias(struct drm_buddy *mm,
 }
 
 static struct drm_buddy_block *
-get_maxblock(struct drm_buddy *mm, unsigned int order)
+__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
+			     u64 start, u64 end,
+			     unsigned int order,
+			     unsigned long flags)
 {
-	struct drm_buddy_block *max_block = NULL, *node;
+	struct drm_buddy_block *block;
+	bool fallback = 0;
+
+	block = __alloc_range_bias(mm, start, end, order,
+				   flags, fallback);
+	if (IS_ERR(block))
+		return __alloc_range_bias(mm, start, end, order,
+					  flags, !fallback);
+
+	return block;
+}
+
+static struct drm_buddy_block *
+get_maxblock(struct drm_buddy *mm, unsigned int order,
+	     unsigned long flags)
+{
+	struct drm_buddy_block *max_block = NULL, *block = NULL;
 	unsigned int i;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		if (!list_empty(&mm->free_list[i])) {
-			node = list_last_entry(&mm->free_list[i],
-					       struct drm_buddy_block,
-					       link);
-			if (!max_block) {
-				max_block = node;
+		struct drm_buddy_block *tmp_block;
+
+		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
+			if (block_incompatible(tmp_block, flags))
 				continue;
-			}
 
-			if (drm_buddy_block_offset(node) >
-			    drm_buddy_block_offset(max_block)) {
-				max_block = node;
-			}
+			block = tmp_block;
+			break;
+		}
+
+		if (!block)
+			continue;
+
+		if (!max_block) {
+			max_block = block;
+			continue;
+		}
+
+		if (drm_buddy_block_offset(block) >
+		    drm_buddy_block_offset(max_block)) {
+			max_block = block;
 		}
 	}
 
@@ -440,11 +535,29 @@ alloc_from_freelist(struct drm_buddy *mm,
 	int err;
 
 	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
-		block = get_maxblock(mm, order);
+		block = get_maxblock(mm, order, flags);
 		if (block)
 			/* Store the obtained block order */
 			tmp = drm_buddy_block_order(block);
 	} else {
+		for (tmp = order; tmp <= mm->max_order; ++tmp) {
+			struct drm_buddy_block *tmp_block;
+
+			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
+				if (block_incompatible(tmp_block, flags))
+					continue;
+
+				block = tmp_block;
+				break;
+			}
+
+			if (block)
+				break;
+		}
+	}
+
+	if (!block) {
+		/* Fallback method */
 		for (tmp = order; tmp <= mm->max_order; ++tmp) {
 			if (!list_empty(&mm->free_list[tmp])) {
 				block = list_last_entry(&mm->free_list[tmp],
@@ -454,10 +567,10 @@ alloc_from_freelist(struct drm_buddy *mm,
 					break;
 			}
 		}
-	}
 
-	if (!block)
-		return ERR_PTR(-ENOSPC);
+		if (!block)
+			return ERR_PTR(-ENOSPC);
+	}
 
 	BUG_ON(!drm_buddy_block_is_free(block));
 
@@ -524,6 +637,8 @@ static int __alloc_range(struct drm_buddy *mm,
 			mark_allocated(block);
 			total_allocated += drm_buddy_block_size(mm, block);
 			mm->avail -= drm_buddy_block_size(mm, block);
+			if (drm_buddy_block_is_clear(block))
+				mm->clear_avail -= drm_buddy_block_size(mm, block);
 			list_add_tail(&block->link, &allocated);
 			continue;
 		}
@@ -558,7 +673,7 @@ static int __alloc_range(struct drm_buddy *mm,
 		list_splice_tail(&allocated, blocks);
 		*total_allocated_on_err = total_allocated;
 	} else {
-		drm_buddy_free_list(mm, &allocated);
+		drm_buddy_free_list_internal(mm, &allocated);
 	}
 
 	return err;
@@ -624,11 +739,11 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
 			list_splice(&blocks_lhs, blocks);
 			return 0;
 		} else if (err != -ENOSPC) {
-			drm_buddy_free_list(mm, blocks);
+			drm_buddy_free_list_internal(mm, blocks);
 			return err;
 		}
 		/* Free blocks for the next iteration */
-		drm_buddy_free_list(mm, blocks);
+		drm_buddy_free_list_internal(mm, blocks);
 	}
 
 	return -ENOSPC;
@@ -684,6 +799,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	list_del(&block->link);
 	mark_free(mm, block);
 	mm->avail += drm_buddy_block_size(mm, block);
+	if (drm_buddy_block_is_clear(block))
+		mm->clear_avail += drm_buddy_block_size(mm, block);
 
 	/* Prevent recursively freeing this node */
 	parent = block->parent;
@@ -695,6 +812,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	if (err) {
 		mark_allocated(block);
 		mm->avail -= drm_buddy_block_size(mm, block);
+		if (drm_buddy_block_is_clear(block))
+			mm->clear_avail -= drm_buddy_block_size(mm, block);
 		list_add(&block->link, blocks);
 	}
 
@@ -782,7 +901,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		do {
 			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
 				/* Allocate traversing within the range */
-				block = alloc_range_bias(mm, start, end, order);
+				block = __drm_buddy_alloc_range_bias(mm, start, end,
+								     order, flags);
 			else
 				/* Allocate from freelist */
 				block = alloc_from_freelist(mm, order, flags);
@@ -808,6 +928,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 
 		mark_allocated(block);
 		mm->avail -= drm_buddy_block_size(mm, block);
+		if (drm_buddy_block_is_clear(block))
+			mm->clear_avail -= drm_buddy_block_size(mm, block);
 		kmemleak_update_trace(block);
 		list_add_tail(&block->link, &allocated);
 
@@ -846,7 +968,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	return 0;
 
 err_free:
-	drm_buddy_free_list(mm, &allocated);
+	drm_buddy_free_list_internal(mm, &allocated);
 	return err;
 }
 EXPORT_SYMBOL(drm_buddy_alloc_blocks);
@@ -879,8 +1001,8 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
 {
 	int order;
 
-	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB\n",
-		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
+	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
+		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, mm->clear_avail >> 20);
 
 	for (order = mm->max_order; order >= 0; order--) {
 		struct drm_buddy_block *block;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 0d735d5c2b35..942345548bc3 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -126,7 +126,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	return 0;
 
 err_free_blocks:
-	drm_buddy_free_list(mm, &bman_res->blocks);
+	drm_buddy_free_list(mm, &bman_res->blocks, 0);
 	mutex_unlock(&bman->lock);
 err_free_res:
 	ttm_resource_fini(man, &bman_res->base);
@@ -141,7 +141,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 
 	mutex_lock(&bman->lock);
-	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
+	drm_buddy_free_list(&bman->mm, &bman_res->blocks, 0);
 	bman->visible_avail += bman_res->used_visible_size;
 	mutex_unlock(&bman->lock);
 
@@ -345,7 +345,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
 	ttm_set_driver_manager(bdev, type, NULL);
 
 	mutex_lock(&bman->lock);
-	drm_buddy_free_list(mm, &bman->reserved);
+	drm_buddy_free_list(mm, &bman->reserved, 0);
 	drm_buddy_fini(mm);
 	bman->visible_avail += bman->visible_reserved;
 	WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index ea2af6bd9abe..e0860fce9ebd 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -83,7 +83,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 							  top, max_order);
 	}
 
-	drm_buddy_free_list(&mm, &holes);
+	drm_buddy_free_list(&mm, &holes, 0);
 
 	/* Nothing larger than blocks of chunk_size now available */
 	for (order = 1; order <= max_order; order++) {
@@ -95,7 +95,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 	}
 
 	list_splice_tail(&holes, &blocks);
-	drm_buddy_free_list(&mm, &blocks);
+	drm_buddy_free_list(&mm, &blocks, 0);
 	drm_buddy_fini(&mm);
 }
 
@@ -190,7 +190,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 
 	list_del(&block->link);
 	drm_buddy_free_block(&mm, block);
-	drm_buddy_free_list(&mm, &blocks);
+	drm_buddy_free_list(&mm, &blocks, 0);
 	drm_buddy_fini(&mm);
 }
 
@@ -236,7 +236,7 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
 							   size, size, &tmp, flags),
 						  "buddy_alloc unexpectedly succeeded, it should be full!");
 
-	drm_buddy_free_list(&mm, &blocks);
+	drm_buddy_free_list(&mm, &blocks, 0);
 	drm_buddy_fini(&mm);
 }
 
@@ -271,7 +271,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
 						drm_buddy_block_size(&mm, block),
 						BIT_ULL(mm.max_order) * PAGE_SIZE);
 
-	drm_buddy_free_list(&mm, &allocated);
+	drm_buddy_free_list(&mm, &allocated, 0);
 	drm_buddy_fini(&mm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 115ec745e502..1ad678b62c4a 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -196,7 +196,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	return 0;
 
 error_free_blocks:
-	drm_buddy_free_list(mm, &vres->blocks);
+	drm_buddy_free_list(mm, &vres->blocks, 0);
 	mutex_unlock(&mgr->lock);
 error_fini:
 	ttm_resource_fini(man, &vres->base);
@@ -214,7 +214,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
 	struct drm_buddy *mm = &mgr->mm;
 
 	mutex_lock(&mgr->lock);
-	drm_buddy_free_list(mm, &vres->blocks);
+	drm_buddy_free_list(mm, &vres->blocks, 0);
 	mgr->visible_avail += vres->used_visible_size;
 	mutex_unlock(&mgr->lock);
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index a5b39fc01003..352a6364e26a 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -6,6 +6,7 @@
 #ifndef __DRM_BUDDY_H__
 #define __DRM_BUDDY_H__
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/list.h>
 #include <linux/slab.h>
@@ -25,15 +26,20 @@
 #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
 #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
 #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
+#define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
+#define DRM_BUDDY_CLEARED			BIT(4)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
+
 #define   DRM_BUDDY_ALLOCATED	   (1 << 10)
 #define   DRM_BUDDY_FREE	   (2 << 10)
 #define   DRM_BUDDY_SPLIT	   (3 << 10)
+
+#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
 /* Free to be used, if needed in the future */
-#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
+#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
 #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
 	u64 header;
 
@@ -86,6 +92,7 @@ struct drm_buddy {
 	u64 chunk_size;
 	u64 size;
 	u64 avail;
+	u64 clear_avail;
 };
 
 static inline u64
@@ -112,6 +119,12 @@ drm_buddy_block_is_allocated(struct drm_buddy_block *block)
 	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
 }
 
+static inline bool
+drm_buddy_block_is_clear(struct drm_buddy_block *block)
+{
+	return block->header & DRM_BUDDY_HEADER_CLEAR;
+}
+
 static inline bool
 drm_buddy_block_is_free(struct drm_buddy_block *block)
 {
@@ -150,7 +163,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 
 void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
 
-void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects);
+void drm_buddy_free_list(struct drm_buddy *mm,
+			 struct list_head *objects,
+			 unsigned int flags);
 
 void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
 void drm_buddy_block_print(struct drm_buddy *mm,

base-commit: 1f4c6f11a557642505e5f403e0dfabbaff9c529a
-- 
2.25.1

