Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD68A4590
	for <lists+dri-devel@lfdr.de>; Sun, 14 Apr 2024 23:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0667E1120CA;
	Sun, 14 Apr 2024 21:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Vh/818VZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B1F112059;
 Sun, 14 Apr 2024 21:24:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxVcj3f8ChElHbvkJK2rUG8u82VJxk4UluMF2CUwqmKaRBqdM5HfV9OTImMhYWZ8g8+JDKwexYIqQRFpzDkd5QqtQ35GTnubz5c9W518xwChz4Y5Fq/2WvVNCQxEKZrnW2gVg21JI3X67uUBkbbTBYxdltl6h8FtqeyUVWmoCiCR0/lEzqh6YTTpdmQ0CGqcWE6R/agN88NEeq+NfQ8X38agGumA46Jvn4HyiXGWYCb9jklL3srUX9+JJxh4d56nSgmnJEyJB6keTkdiiUJKs9hAcYaUOkSqY5R1qCUI7gm0zwVZzG3Kq4j73hHZ5594klDiv+nmAjpjca1zOKi2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9vEtPeRk/nffvfY/VrgrtQYHZyYMOWl10K53T10x80=;
 b=hfYgMGOMvD8zz6hMhp2PMjd61KWd8w412Kk0D+Pw4/9+YiIxzfO8OPmSVKAATDC4g1BmmPIraJ1j3Bd1ZMdcs2xuFcGUaogycNrI628NXPgIecBI3lBoVyWs+JrRBLjPkKnuwnAkIz6W4pL5uSar5SYlx8mFN12qk/39FIToEwwU31NHKUq9HI7/0sS7lnPBJe9VyIqCL6nuW6IoglAe1SNb3J4vXp4bz2Umu6e+es6mdMPIzvnSGxKgPuatU8718TvxEKIOTf00z1EcgwU0ClVCbNHEI5EdXD3umC7St/4MF7gwuDqzqE2h4qpgJUW7M+HuveJyQsR5VxJOXN66VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9vEtPeRk/nffvfY/VrgrtQYHZyYMOWl10K53T10x80=;
 b=Vh/818VZaZ9hSWeO/lTlYM8iuRgKjsLiRQLRIKIwcYQSNN17ZohKWMP5bcE0xaLi4aJSoNOGYb+J2FgqsFQc33XvW19kkah8aqsRGOamKnVwcdAXWgbgvGZoLevlgyAAK7O+xwGmfulN8TthCutCB9sZ2y5H9sjGTCT10zqLfEU=
Received: from BYAPR03CA0019.namprd03.prod.outlook.com (2603:10b6:a02:a8::32)
 by DS0PR12MB9347.namprd12.prod.outlook.com (2603:10b6:8:193::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Sun, 14 Apr
 2024 21:24:27 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::c0) by BYAPR03CA0019.outlook.office365.com
 (2603:10b6:a02:a8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Sun, 14 Apr 2024 21:24:27 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Sun, 14 Apr 2024 21:24:25 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 16:24:22 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <matthew.auld@intel.com>, <felix.kuehling@amd.com>,
 <mario.limonciello@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v11 1/3] drm/buddy: Implement tracking clear page feature
Date: Mon, 15 Apr 2024 02:53:47 +0530
Message-ID: <20240414212349.2834-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DS0PR12MB9347:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c1bf20-67f1-4822-dcca-08dc5cc942d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PoJCeWQVZAimgHpNBe14qBo8pbKvrfGAeItC+A9rvxH3fEqYfPp3Yb5ha32SJU9Zxp6N6jiecp464kDJ7rdqZIeBak2VS7UulnYi+v46ugXJUy2XPlwCIWnouZrl35v6+ywbvZNagu8QPJD07R8vrNjXZ/GoolzNeaHR7uNMV9qNcUgTNvsqhDyM9gB1CNjIDUdNuH9/0doYcazTCOdpzTjTOpkiyRl3GJHRwQGot3GDiQNvLQYIBhfCqjWRbu2rd7FHjHQSjs2qIbtIeFTnnQLT0S8dkGwZ2GwHe9cmXsD4eO5PwHzqTJXpgAfjy1Rx6XI/mRxAzv6jiqr5efP11lycFPu3hkf6EcBqTX/uIpuNnKnF/epoc3+w03qkli1o1W4+w++/7DkuaDCE9UTGxRiaCtELLrgHFc4VgeufyByqz/r8FtOQjCL4e5az3SPFgnQrx/Z6vX9Ta3pwHFd8RqvdAIqlQrPXRpEU65mv22F6KbZwZxjRQHF9Vz8gmHhXBkAi9ocozE9m1gWqVQ1adJECYgKc48FLPxtiSCdy3DZM0KxZV1E4kqk7s62Sx8tiRQpOURcDeiquQTbXtH26AknbQRJZi3eyk6spaqOch0UNgO65q5g7PRGjDagEXP4+IvZW1RNYFg2eXDzF3AE0nlaXqY9ZoUqD+ILZRdgT03YMgwNYH3v7t015pZmXkEySN6ZH4QtJ4HcN/EiVUtilInJuxrHlTVLyfBPQHT2dWE9M8aocUtYKVtMCGvzzhgrO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 21:24:25.8923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c1bf20-67f1-4822-dcca-08dc5cc942d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9347
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

- Add a function to support defragmentation.

v1:
  - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
    cleared. Else, reset the clear flag for each block in the list(Christian)
  - For merging the 2 cleared blocks compare as below,
    drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)(Christian)
  - Defragment the memory beginning from min_order
    till the required memory space is available.

v2: (Matthew)
  - Add a wrapper drm_buddy_free_list_internal for the freeing of blocks
    operation within drm buddy.
  - Write a macro block_incompatible() to allocate the required blocks.
  - Update the xe driver for the drm_buddy_free_list change in arguments.
  - add a warning if the two blocks are incompatible on
    defragmentation
  - call full defragmentation in the fini() function
  - place a condition to test if min_order is equal to 0
  - replace the list with safe_reverse() variant as we might
    remove the block from the list.

v3:
  - fix Gitlab user reported lockup issue.
  - Keep DRM_BUDDY_HEADER_CLEAR define sorted(Matthew)
  - modify to pass the root order instead max_order in fini()
    function(Matthew)
  - change bool 1 to true(Matthew)
  - add check if min_block_size is power of 2(Matthew)
  - modify the min_block_size datatype to u64(Matthew)

v4:
  - rename the function drm_buddy_defrag with __force_merge.
  - Include __force_merge directly in drm buddy file and remove
    the defrag use in amdgpu driver.
  - Remove list_empty() check(Matthew)
  - Remove unnecessary space, headers and placement of new variables(Matthew)
  - Add a unit test case(Matthew)

v5:
  - remove force merge support to actual range allocation and not to bail
    out when contains && split(Matthew)
  - add range support to force merge function.

v6:
  - modify the alloc_range() function clear page non merged blocks
    allocation(Matthew)
  - correct the list_insert function name(Matthew).

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Suggested-by: Christian König <christian.koenig@amd.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
 drivers/gpu/drm/drm_buddy.c                   | 427 ++++++++++++++----
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
 drivers/gpu/drm/tests/drm_buddy_test.c        |  28 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   4 +-
 include/drm/drm_buddy.h                       |  16 +-
 6 files changed, 363 insertions(+), 124 deletions(-)

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
index 5ebdd6f8f36e..284ebae71cc4 100644
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
@@ -82,6 +92,133 @@ static void mark_split(struct drm_buddy_block *block)
 	list_del(&block->link);
 }
 
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
+__get_buddy(struct drm_buddy_block *block)
+{
+	struct drm_buddy_block *parent;
+
+	parent = block->parent;
+	if (!parent)
+		return NULL;
+
+	if (parent->left == block)
+		return parent->right;
+
+	return parent->left;
+}
+
+static unsigned int __drm_buddy_free(struct drm_buddy *mm,
+				     struct drm_buddy_block *block,
+				     bool force_merge)
+{
+	struct drm_buddy_block *parent;
+	unsigned int order;
+
+	while ((parent = block->parent)) {
+		struct drm_buddy_block *buddy;
+
+		buddy = __get_buddy(block);
+
+		if (!drm_buddy_block_is_free(buddy))
+			break;
+
+		if (!force_merge) {
+			/*
+			 * Check the block and its buddy clear state and exit
+			 * the loop if they both have the dissimilar state.
+			 */
+			if (drm_buddy_block_is_clear(block) !=
+			    drm_buddy_block_is_clear(buddy))
+				break;
+
+			if (drm_buddy_block_is_clear(block))
+				mark_cleared(parent);
+		}
+
+		list_del(&buddy->link);
+		if (force_merge && drm_buddy_block_is_clear(buddy))
+			mm->clear_avail -= drm_buddy_block_size(mm, buddy);
+
+		drm_block_free(mm, block);
+		drm_block_free(mm, buddy);
+
+		block = parent;
+	}
+
+	order = drm_buddy_block_order(block);
+	mark_free(mm, block);
+
+	return order;
+}
+
+static int __force_merge(struct drm_buddy *mm,
+			 u64 start,
+			 u64 end,
+			 unsigned int min_order)
+{
+	unsigned int order;
+	int i;
+
+	if (!min_order)
+		return -ENOMEM;
+
+	if (min_order > mm->max_order)
+		return -EINVAL;
+
+	for (i = min_order - 1; i >= 0; i--) {
+		struct drm_buddy_block *block, *prev;
+
+		list_for_each_entry_safe_reverse(block, prev, &mm->free_list[i], link) {
+			struct drm_buddy_block *buddy;
+			u64 block_start, block_end;
+
+			if (!block->parent)
+				continue;
+
+			block_start = drm_buddy_block_offset(block);
+			block_end = block_start + drm_buddy_block_size(mm, block) - 1;
+
+			if (!contains(start, end, block_start, block_end))
+				continue;
+
+			buddy = __get_buddy(block);
+			if (!drm_buddy_block_is_free(buddy))
+				continue;
+
+			WARN_ON(drm_buddy_block_is_clear(block) ==
+				drm_buddy_block_is_clear(buddy));
+
+			/*
+			 * If the prev block is same as buddy, don't access the
+			 * block in the next iteration as we would free the
+			 * buddy block as part of the free function.
+			 */
+			if (prev == buddy)
+				prev = list_prev_entry(prev, link);
+
+			list_del(&block->link);
+			if (drm_buddy_block_is_clear(block))
+				mm->clear_avail -= drm_buddy_block_size(mm, block);
+
+			order = __drm_buddy_free(mm, block, true);
+			if (order >= min_order)
+				return 0;
+		}
+	}
+
+	return -ENOMEM;
+}
+
 /**
  * drm_buddy_init - init memory manager
  *
@@ -186,11 +323,21 @@ EXPORT_SYMBOL(drm_buddy_init);
  */
 void drm_buddy_fini(struct drm_buddy *mm)
 {
+	u64 root_size, size;
+	unsigned int order;
 	int i;
 
+	size = mm->size;
+
 	for (i = 0; i < mm->n_roots; ++i) {
+		order = ilog2(size) - ilog2(mm->chunk_size);
+		__force_merge(mm, 0, size, order);
+
 		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
 		drm_block_free(mm, mm->roots[i]);
+
+		root_size = mm->chunk_size << order;
+		size -= root_size;
 	}
 
 	WARN_ON(mm->avail != mm->size);
@@ -223,26 +370,17 @@ static int split_block(struct drm_buddy *mm,
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
 }
 
-static struct drm_buddy_block *
-__get_buddy(struct drm_buddy_block *block)
-{
-	struct drm_buddy_block *parent;
-
-	parent = block->parent;
-	if (!parent)
-		return NULL;
-
-	if (parent->left == block)
-		return parent->right;
-
-	return parent->left;
-}
-
 /**
  * drm_get_buddy - get buddy address
  *
@@ -260,30 +398,6 @@ drm_get_buddy(struct drm_buddy_block *block)
 }
 EXPORT_SYMBOL(drm_get_buddy);
 
-static void __drm_buddy_free(struct drm_buddy *mm,
-			     struct drm_buddy_block *block)
-{
-	struct drm_buddy_block *parent;
-
-	while ((parent = block->parent)) {
-		struct drm_buddy_block *buddy;
-
-		buddy = __get_buddy(block);
-
-		if (!drm_buddy_block_is_free(buddy))
-			break;
-
-		list_del(&buddy->link);
-
-		drm_block_free(mm, block);
-		drm_block_free(mm, buddy);
-
-		block = parent;
-	}
-
-	mark_free(mm, block);
-}
-
 /**
  * drm_buddy_free_block - free a block
  *
@@ -295,42 +409,74 @@ void drm_buddy_free_block(struct drm_buddy *mm,
 {
 	BUG_ON(!drm_buddy_block_is_allocated(block));
 	mm->avail += drm_buddy_block_size(mm, block);
-	__drm_buddy_free(mm, block);
+	if (drm_buddy_block_is_clear(block))
+		mm->clear_avail += drm_buddy_block_size(mm, block);
+
+	__drm_buddy_free(mm, block, false);
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
-EXPORT_SYMBOL(drm_buddy_free_list);
 
-static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
+static void drm_buddy_free_list_internal(struct drm_buddy *mm,
+					 struct list_head *objects)
 {
-	return s1 <= e2 && e1 >= s2;
+	/*
+	 * Don't touch the clear/dirty bit, since allocation is still internal
+	 * at this point. For example we might have just failed part of the
+	 * allocation.
+	 */
+	__drm_buddy_free_list(mm, objects, false, false);
 }
 
-static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
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
 {
-	return s1 <= s2 && e1 >= e2;
+	bool mark_clear = flags & DRM_BUDDY_CLEARED;
+
+	__drm_buddy_free_list(mm, objects, mark_clear, !mark_clear);
+}
+EXPORT_SYMBOL(drm_buddy_free_list);
+
+static bool block_incompatible(struct drm_buddy_block *block, unsigned int flags)
+{
+	bool needs_clear = flags & DRM_BUDDY_CLEAR_ALLOCATION;
+
+	return needs_clear != drm_buddy_block_is_clear(block);
 }
 
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
 	u64 req_size = mm->chunk_size << order;
 	struct drm_buddy_block *block;
@@ -379,6 +525,9 @@ alloc_range_bias(struct drm_buddy *mm,
 
 		if (contains(start, end, block_start, block_end) &&
 		    order == drm_buddy_block_order(block)) {
+			if (!fallback && block_incompatible(block, flags))
+				continue;
+
 			/*
 			 * Find the free block within the range.
 			 */
@@ -410,30 +559,57 @@ alloc_range_bias(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, false);
 	return ERR_PTR(err);
 }
 
 static struct drm_buddy_block *
-get_maxblock(struct drm_buddy *mm, unsigned int order)
+__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
+			     u64 start, u64 end,
+			     unsigned int order,
+			     unsigned long flags)
+{
+	struct drm_buddy_block *block;
+	bool fallback = false;
+
+	block = __alloc_range_bias(mm, start, end, order,
+				   flags, fallback);
+	if (IS_ERR(block) && mm->clear_avail)
+		return __alloc_range_bias(mm, start, end, order,
+					  flags, !fallback);
+
+	return block;
+}
+
+static struct drm_buddy_block *
+get_maxblock(struct drm_buddy *mm, unsigned int order,
+	     unsigned long flags)
 {
-	struct drm_buddy_block *max_block = NULL, *node;
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
 
@@ -450,11 +626,29 @@ alloc_from_freelist(struct drm_buddy *mm,
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
@@ -464,10 +658,10 @@ alloc_from_freelist(struct drm_buddy *mm,
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
 
@@ -483,7 +677,7 @@ alloc_from_freelist(struct drm_buddy *mm,
 
 err_undo:
 	if (tmp != order)
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, false);
 	return ERR_PTR(err);
 }
 
@@ -526,16 +720,18 @@ static int __alloc_range(struct drm_buddy *mm,
 		}
 
 		if (contains(start, end, block_start, block_end)) {
-			if (!drm_buddy_block_is_free(block)) {
+			if (drm_buddy_block_is_free(block)) {
+				mark_allocated(block);
+				total_allocated += drm_buddy_block_size(mm, block);
+				mm->avail -= drm_buddy_block_size(mm, block);
+				if (drm_buddy_block_is_clear(block))
+					mm->clear_avail -= drm_buddy_block_size(mm, block);
+				list_add_tail(&block->link, &allocated);
+				continue;
+			} else if (!mm->clear_avail) {
 				err = -ENOSPC;
 				goto err_free;
 			}
-
-			mark_allocated(block);
-			total_allocated += drm_buddy_block_size(mm, block);
-			mm->avail -= drm_buddy_block_size(mm, block);
-			list_add_tail(&block->link, &allocated);
-			continue;
 		}
 
 		if (!drm_buddy_block_is_split(block)) {
@@ -567,14 +763,14 @@ static int __alloc_range(struct drm_buddy *mm,
 	if (buddy &&
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
-		__drm_buddy_free(mm, block);
+		__drm_buddy_free(mm, block, false);
 
 err_free:
 	if (err == -ENOSPC && total_allocated_on_err) {
 		list_splice_tail(&allocated, blocks);
 		*total_allocated_on_err = total_allocated;
 	} else {
-		drm_buddy_free_list(mm, &allocated);
+		drm_buddy_free_list_internal(mm, &allocated);
 	}
 
 	return err;
@@ -640,11 +836,11 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
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
@@ -700,6 +896,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	list_del(&block->link);
 	mark_free(mm, block);
 	mm->avail += drm_buddy_block_size(mm, block);
+	if (drm_buddy_block_is_clear(block))
+		mm->clear_avail += drm_buddy_block_size(mm, block);
 
 	/* Prevent recursively freeing this node */
 	parent = block->parent;
@@ -711,6 +909,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	if (err) {
 		mark_allocated(block);
 		mm->avail -= drm_buddy_block_size(mm, block);
+		if (drm_buddy_block_is_clear(block))
+			mm->clear_avail -= drm_buddy_block_size(mm, block);
 		list_add(&block->link, blocks);
 	}
 
@@ -719,13 +919,28 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 }
 EXPORT_SYMBOL(drm_buddy_block_trim);
 
+static struct drm_buddy_block *
+__drm_buddy_alloc_blocks(struct drm_buddy *mm,
+			 u64 start, u64 end,
+			 unsigned int order,
+			 unsigned long flags)
+{
+	if (flags & DRM_BUDDY_RANGE_ALLOCATION)
+		/* Allocate traversing within the range */
+		return  __drm_buddy_alloc_range_bias(mm, start, end,
+						     order, flags);
+	else
+		/* Allocate from freelist */
+		return alloc_from_freelist(mm, order, flags);
+}
+
 /**
  * drm_buddy_alloc_blocks - allocate power-of-two blocks
  *
  * @mm: DRM buddy manager to allocate from
  * @start: start of the allowed range for this block
  * @end: end of the allowed range for this block
- * @size: size of the allocation
+ * @size: size of the allocation in bytes
  * @min_block_size: alignment of the allocation
  * @blocks: output list head to add allocated blocks
  * @flags: DRM_BUDDY_*_ALLOCATION flags
@@ -800,23 +1015,33 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		BUG_ON(order < min_order);
 
 		do {
-			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
-				/* Allocate traversing within the range */
-				block = alloc_range_bias(mm, start, end, order);
-			else
-				/* Allocate from freelist */
-				block = alloc_from_freelist(mm, order, flags);
-
+			block = __drm_buddy_alloc_blocks(mm, start,
+							 end,
+							 order,
+							 flags);
 			if (!IS_ERR(block))
 				break;
 
 			if (order-- == min_order) {
+				/* Try allocation through force merge method */
+				if (mm->clear_avail &&
+				    !__force_merge(mm, start, end, min_order)) {
+					block = __drm_buddy_alloc_blocks(mm, start,
+									 end,
+									 min_order,
+									 flags);
+					if (!IS_ERR(block)) {
+						order = min_order;
+						break;
+					}
+				}
+
+				/*
+				 * Try contiguous block allocation through
+				 * try harder method.
+				 */
 				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
 				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
-					/*
-					 * Try contiguous block allocation through
-					 * try harder method
-					 */
 					return __alloc_contig_try_harder(mm,
 									 original_size,
 									 original_min_size,
@@ -828,6 +1053,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 
 		mark_allocated(block);
 		mm->avail -= drm_buddy_block_size(mm, block);
+		if (drm_buddy_block_is_clear(block))
+			mm->clear_avail -= drm_buddy_block_size(mm, block);
 		kmemleak_update_trace(block);
 		list_add_tail(&block->link, &allocated);
 
@@ -866,7 +1093,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	return 0;
 
 err_free:
-	drm_buddy_free_list(mm, &allocated);
+	drm_buddy_free_list_internal(mm, &allocated);
 	return err;
 }
 EXPORT_SYMBOL(drm_buddy_alloc_blocks);
@@ -899,8 +1126,8 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
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
index e48863a44556..4621a860cb05 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -103,7 +103,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 							      DRM_BUDDY_RANGE_ALLOCATION),
 				       "buddy_alloc i failed with bias(%x-%x), size=%u, ps=%u\n",
 				       bias_start, bias_end, bias_size, bias_size);
-		drm_buddy_free_list(&mm, &tmp);
+		drm_buddy_free_list(&mm, &tmp, 0);
 
 		/* single page with internal round_up */
 		KUNIT_ASSERT_FALSE_MSG(test,
@@ -113,7 +113,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 							      DRM_BUDDY_RANGE_ALLOCATION),
 				       "buddy_alloc failed with bias(%x-%x), size=%u, ps=%u\n",
 				       bias_start, bias_end, ps, bias_size);
-		drm_buddy_free_list(&mm, &tmp);
+		drm_buddy_free_list(&mm, &tmp, 0);
 
 		/* random size within */
 		size = max(round_up(prandom_u32_state(&prng) % bias_rem, ps), ps);
@@ -153,14 +153,14 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 			 * unallocated, and ideally not always on the bias
 			 * boundaries.
 			 */
-			drm_buddy_free_list(&mm, &tmp);
+			drm_buddy_free_list(&mm, &tmp, 0);
 		} else {
 			list_splice_tail(&tmp, &allocated);
 		}
 	}
 
 	kfree(order);
-	drm_buddy_free_list(&mm, &allocated);
+	drm_buddy_free_list(&mm, &allocated, 0);
 	drm_buddy_fini(&mm);
 
 	/*
@@ -220,7 +220,7 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
 			      "buddy_alloc passed with bias(%x-%x), size=%u\n",
 			      bias_start, bias_end, ps);
 
-	drm_buddy_free_list(&mm, &allocated);
+	drm_buddy_free_list(&mm, &allocated, 0);
 	drm_buddy_fini(&mm);
 }
 
@@ -269,7 +269,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
 			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
 
-	drm_buddy_free_list(&mm, &middle);
+	drm_buddy_free_list(&mm, &middle, 0);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
@@ -279,7 +279,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
 			       "buddy_alloc didn't error size=%lu\n", 2 * ps);
 
-	drm_buddy_free_list(&mm, &right);
+	drm_buddy_free_list(&mm, &right, 0);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
@@ -294,7 +294,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
 			       "buddy_alloc hit an error size=%lu\n", 2 * ps);
 
-	drm_buddy_free_list(&mm, &left);
+	drm_buddy_free_list(&mm, &left, 0);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							    3 * ps, ps, &allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
@@ -306,7 +306,7 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 
 	KUNIT_ASSERT_EQ(test, total, ps * 2 + ps * 3);
 
-	drm_buddy_free_list(&mm, &allocated);
+	drm_buddy_free_list(&mm, &allocated, 0);
 	drm_buddy_fini(&mm);
 }
 
@@ -375,7 +375,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 							  top, max_order);
 	}
 
-	drm_buddy_free_list(&mm, &holes);
+	drm_buddy_free_list(&mm, &holes, 0);
 
 	/* Nothing larger than blocks of chunk_size now available */
 	for (order = 1; order <= max_order; order++) {
@@ -387,7 +387,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
 	}
 
 	list_splice_tail(&holes, &blocks);
-	drm_buddy_free_list(&mm, &blocks);
+	drm_buddy_free_list(&mm, &blocks, 0);
 	drm_buddy_fini(&mm);
 }
 
@@ -482,7 +482,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
 
 	list_del(&block->link);
 	drm_buddy_free_block(&mm, block);
-	drm_buddy_free_list(&mm, &blocks);
+	drm_buddy_free_list(&mm, &blocks, 0);
 	drm_buddy_fini(&mm);
 }
 
@@ -528,7 +528,7 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
 							   size, size, &tmp, flags),
 						  "buddy_alloc unexpectedly succeeded, it should be full!");
 
-	drm_buddy_free_list(&mm, &blocks);
+	drm_buddy_free_list(&mm, &blocks, 0);
 	drm_buddy_fini(&mm);
 }
 
@@ -563,7 +563,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
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
index a5b39fc01003..82570f77e817 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -25,6 +25,8 @@
 #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
 #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
 #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
+#define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
+#define DRM_BUDDY_CLEARED			BIT(4)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
@@ -32,8 +34,9 @@ struct drm_buddy_block {
 #define   DRM_BUDDY_ALLOCATED	   (1 << 10)
 #define   DRM_BUDDY_FREE	   (2 << 10)
 #define   DRM_BUDDY_SPLIT	   (3 << 10)
+#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
 /* Free to be used, if needed in the future */
-#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
+#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
 #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
 	u64 header;
 
@@ -86,6 +89,7 @@ struct drm_buddy {
 	u64 chunk_size;
 	u64 size;
 	u64 avail;
+	u64 clear_avail;
 };
 
 static inline u64
@@ -112,6 +116,12 @@ drm_buddy_block_is_allocated(struct drm_buddy_block *block)
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
@@ -150,7 +160,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 
 void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
 
-void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects);
+void drm_buddy_free_list(struct drm_buddy *mm,
+			 struct list_head *objects,
+			 unsigned int flags);
 
 void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
 void drm_buddy_block_print(struct drm_buddy *mm,
-- 
2.25.1

