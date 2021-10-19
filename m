Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81C44341BE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 00:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330ED6E0F6;
	Tue, 19 Oct 2021 22:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110C36E10A;
 Tue, 19 Oct 2021 22:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kHuqUt8kVJAnP7r9f4kJyUBYXM3kcpKB6CheEHNfphb/gwqNjq84Ql5qOuXCflU5R8bLWucMqBrI3IYmPX7sQOcI3ktIY6KlCh6lxRGFvZL0rWYaWJvX18GPG+xZVBeMlN8TWsaLIXRAXQlAN/tsqGjP4HOJ/Xhh0Wz3EmTlvlxziFn6a2F+CBZ8cguGzvXUvAtPF2S/yeb4ZiRq3bTggTqosWqfzIsW7GHLhF5r1Almz0xTOcpdmsrVvcj8225kbPJhY7Zm3ijaBagLFkxA/wtos2V9hRmAWl0MfeL1e0RxdIgwHiEENLu0MHVi/mGCgc1ZF2S4CugKAuJXqB/R+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UQLfaQosOU9A/dy6MEOwKmrmN92wiiTdpAlP1X7b/c=;
 b=jLdylhWc8wzoVJTsUKxs/4g5dty/esRDNNTPZ1eVA2n6nJTuwGByXzAFVeQzcYYJxzseBC/avDKL/PRmexkoARgyxy5rxrlOwwiejBbpdtZ2By8eNLZBwlIf94bE3SbRLCBOPTO0HrVXBuEKn4d7TBCOALuKRvw9/xbZfelGBzsqV4RCUIM+k+sYSdVzSRVZmWwMapt0nqH0elUtGxYzrj/DX+dGEJbkFcF11Xf/Fwee5BwuofjLnlZ6HBzp4R1yQ96xCZE6yra99IwKJBweoeHv7yLcjpc1+6MMAZoR1vPso0/5enYCGDjLZMvZnxeAyvM3ul9AwkLxYs52frXdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UQLfaQosOU9A/dy6MEOwKmrmN92wiiTdpAlP1X7b/c=;
 b=PBrNB3KtYerqM1asPZrmks5+duEOAPiDMI5vs4Bag3OZN+0GYrv1W0qB8drwRYJEv9sXOPvhymEbkKGgzVXp7Brc+Q+iKm8VcsD1TfbX94/DVi4nl++p+xDob578Re1BfQr/Dp+UCvEFcoBfy43TOrxztqVpgrznDlfGNZNDt1E=
Received: from MW3PR06CA0020.namprd06.prod.outlook.com (2603:10b6:303:2a::25)
 by MN2PR12MB3261.namprd12.prod.outlook.com (2603:10b6:208:108::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 22:55:07 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::29) by MW3PR06CA0020.outlook.office365.com
 (2603:10b6:303:2a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17 via Frontend
 Transport; Tue, 19 Oct 2021 22:55:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 22:55:07 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 19 Oct
 2021 17:55:03 -0500
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>, <matthew.auld@intel.com>,
 <alexander.deucher@amd.com>, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 02/13] drm: Move and rename i915 buddy source
Date: Wed, 20 Oct 2021 04:23:58 +0530
Message-ID: <20211019225409.569355-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92a98d33-5ba7-4e70-6a32-08d993537f32
X-MS-TrafficTypeDiagnostic: MN2PR12MB3261:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3261FF8AFA5E065B7D3AC546E4BD9@MN2PR12MB3261.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vtUrZLwTFMTlYWhvIfqmsIQ1RGc0c81uoWj0lr9SfW8NK7+TWPyXvDt4g5KPjARA0NluAozYVFcIxhFAyaHBVK2fLbtwgSZX5iEnT+r8C2/AgdAMpqLtSkTTT+2ZnU5mNi9GK0wsm90rqPYIMBeozD4pPBtHHbHKEaxt3ccD5RsBVlWq11V4LeoMcNQV6d5rA2Fd8fYUVjQsVpxAFvYCyfRZty5PzMHkAOXzvyIDm+MguP1JBGT28e3bZPfu3lHkeKfGtj9IAFR+s6WAUme7WXdiLhl96zNPfx+8lNo48vaTNYeTOuT/ZQvYJj/L+ofeMuZlaTbGrt1X7CVwGC42NY8+lcwvEim/AUXYPnCMps4k9OfggwqWWtpKa0c903Xz+c+iE+QR5P/34uQq5hk2bi+CkT4Mvbpw2hdxCB69ZjQu4VA58taSdq0SAbhMzJI64tPEJGh24ZPbo4u8rz3KjMLH0tvKNAxWICH8wK6A/jgbMLyjcT0gtR224tBc4Qkc3b9787ZUwDfpYDvlL4pYDFlWwtQj5J14445YsHbS8/QyW3/G6XEPK4NXm3kQ1Os7hkcODA9yTn8JGA4k6YKzPZ8uH+TF44yieNYiwJ8VvYgfBk4AV+CGLdcspdqdx579/weAnb95Bc5aA+8EoeFsTVBzLmIlzj0aSshiNOVxWK3zvZuJdXNdjtyeIwC+ddKGvw7LLd9aM90h71i5LY2EG7COxfO6iif/JtvjN1KRpUU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(508600001)(36860700001)(2906002)(2616005)(4326008)(336012)(30864003)(5660300002)(426003)(8936002)(47076005)(26005)(1076003)(8676002)(16526019)(186003)(316002)(54906003)(83380400001)(110136005)(7696005)(70586007)(86362001)(36756003)(70206006)(82310400003)(6666004)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:55:07.3306 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a98d33-5ba7-4e70-6a32-08d993537f32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3261
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

- Move i915_buddy.c to drm root folder
- Rename "i915" string with "drm" string wherever applicable
- Rename "I915" string with "DRM" string wherever applicable
- Fix header file dependencies
- Fix alignment issues

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 .../drm/{i915/i915_buddy.c => drm_buddy.c}    | 193 +++++++++---------
 include/drm/drm_buddy.h                       |  10 +
 2 files changed, 105 insertions(+), 98 deletions(-)
 rename drivers/gpu/drm/{i915/i915_buddy.c => drm_buddy.c} (58%)

diff --git a/drivers/gpu/drm/i915/i915_buddy.c b/drivers/gpu/drm/drm_buddy.c
similarity index 58%
rename from drivers/gpu/drm/i915/i915_buddy.c
rename to drivers/gpu/drm/drm_buddy.c
index 6e2ad68f8f3f..0398706cb7ae 100644
--- a/drivers/gpu/drm/i915/i915_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -6,21 +6,18 @@
 #include <linux/kmemleak.h>
 #include <linux/sizes.h>
 
-#include "i915_buddy.h"
-
-#include "i915_gem.h"
-#include "i915_utils.h"
+#include <drm/drm_buddy.h>
 
 static struct kmem_cache *slab_blocks;
 
-static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
-						 struct i915_buddy_block *parent,
-						 unsigned int order,
-						 u64 offset)
+static struct drm_buddy_block *drm_block_alloc(struct drm_buddy_mm *mm,
+					       struct drm_buddy_block *parent,
+					       unsigned int order,
+					       u64 offset)
 {
-	struct i915_buddy_block *block;
+	struct drm_buddy_block *block;
 
-	GEM_BUG_ON(order > I915_BUDDY_MAX_ORDER);
+	BUG_ON(order > DRM_BUDDY_MAX_ORDER);
 
 	block = kmem_cache_zalloc(slab_blocks, GFP_KERNEL);
 	if (!block)
@@ -30,43 +27,43 @@ static struct i915_buddy_block *i915_block_alloc(struct i915_buddy_mm *mm,
 	block->header |= order;
 	block->parent = parent;
 
-	GEM_BUG_ON(block->header & I915_BUDDY_HEADER_UNUSED);
+	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
 	return block;
 }
 
-static void i915_block_free(struct i915_buddy_mm *mm,
-			    struct i915_buddy_block *block)
+static void drm_block_free(struct drm_buddy_mm *mm,
+			   struct drm_buddy_block *block)
 {
 	kmem_cache_free(slab_blocks, block);
 }
 
-static void mark_allocated(struct i915_buddy_block *block)
+static void mark_allocated(struct drm_buddy_block *block)
 {
-	block->header &= ~I915_BUDDY_HEADER_STATE;
-	block->header |= I915_BUDDY_ALLOCATED;
+	block->header &= ~DRM_BUDDY_HEADER_STATE;
+	block->header |= DRM_BUDDY_ALLOCATED;
 
 	list_del(&block->link);
 }
 
-static void mark_free(struct i915_buddy_mm *mm,
-		      struct i915_buddy_block *block)
+static void mark_free(struct drm_buddy_mm *mm,
+		      struct drm_buddy_block *block)
 {
-	block->header &= ~I915_BUDDY_HEADER_STATE;
-	block->header |= I915_BUDDY_FREE;
+	block->header &= ~DRM_BUDDY_HEADER_STATE;
+	block->header |= DRM_BUDDY_FREE;
 
 	list_add(&block->link,
-		 &mm->free_list[i915_buddy_block_order(block)]);
+		 &mm->free_list[drm_buddy_block_order(block)]);
 }
 
-static void mark_split(struct i915_buddy_block *block)
+static void mark_split(struct drm_buddy_block *block)
 {
-	block->header &= ~I915_BUDDY_HEADER_STATE;
-	block->header |= I915_BUDDY_SPLIT;
+	block->header &= ~DRM_BUDDY_HEADER_STATE;
+	block->header |= DRM_BUDDY_SPLIT;
 
 	list_del(&block->link);
 }
 
-int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
+int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
 {
 	unsigned int i;
 	u64 offset;
@@ -87,7 +84,7 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
 	mm->chunk_size = chunk_size;
 	mm->max_order = ilog2(size) - ilog2(chunk_size);
 
-	GEM_BUG_ON(mm->max_order > I915_BUDDY_MAX_ORDER);
+	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
 
 	mm->free_list = kmalloc_array(mm->max_order + 1,
 				      sizeof(struct list_head),
@@ -101,7 +98,7 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
 	mm->n_roots = hweight64(size);
 
 	mm->roots = kmalloc_array(mm->n_roots,
-				  sizeof(struct i915_buddy_block *),
+				  sizeof(struct drm_buddy_block *),
 				  GFP_KERNEL);
 	if (!mm->roots)
 		goto out_free_list;
@@ -114,21 +111,21 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
 	 * not itself a power-of-two.
 	 */
 	do {
-		struct i915_buddy_block *root;
+		struct drm_buddy_block *root;
 		unsigned int order;
 		u64 root_size;
 
 		root_size = rounddown_pow_of_two(size);
 		order = ilog2(root_size) - ilog2(chunk_size);
 
-		root = i915_block_alloc(mm, NULL, order, offset);
+		root = drm_block_alloc(mm, NULL, order, offset);
 		if (!root)
 			goto out_free_roots;
 
 		mark_free(mm, root);
 
-		GEM_BUG_ON(i > mm->max_order);
-		GEM_BUG_ON(i915_buddy_block_size(mm, root) < chunk_size);
+		BUG_ON(i > mm->max_order);
+		BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
 
 		mm->roots[i] = root;
 
@@ -141,45 +138,45 @@ int i915_buddy_init(struct i915_buddy_mm *mm, u64 size, u64 chunk_size)
 
 out_free_roots:
 	while (i--)
-		i915_block_free(mm, mm->roots[i]);
+		drm_block_free(mm, mm->roots[i]);
 	kfree(mm->roots);
 out_free_list:
 	kfree(mm->free_list);
 	return -ENOMEM;
 }
 
-void i915_buddy_fini(struct i915_buddy_mm *mm)
+void drm_buddy_fini(struct drm_buddy_mm *mm)
 {
 	int i;
 
 	for (i = 0; i < mm->n_roots; ++i) {
-		GEM_WARN_ON(!i915_buddy_block_is_free(mm->roots[i]));
-		i915_block_free(mm, mm->roots[i]);
+		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
+		drm_block_free(mm, mm->roots[i]);
 	}
 
-	GEM_WARN_ON(mm->avail != mm->size);
+	WARN_ON(mm->avail != mm->size);
 
 	kfree(mm->roots);
 	kfree(mm->free_list);
 }
 
-static int split_block(struct i915_buddy_mm *mm,
-		       struct i915_buddy_block *block)
+static int split_block(struct drm_buddy_mm *mm,
+		       struct drm_buddy_block *block)
 {
-	unsigned int block_order = i915_buddy_block_order(block) - 1;
-	u64 offset = i915_buddy_block_offset(block);
+	unsigned int block_order = drm_buddy_block_order(block) - 1;
+	u64 offset = drm_buddy_block_offset(block);
 
-	GEM_BUG_ON(!i915_buddy_block_is_free(block));
-	GEM_BUG_ON(!i915_buddy_block_order(block));
+	BUG_ON(!drm_buddy_block_is_free(block));
+	BUG_ON(!drm_buddy_block_order(block));
 
-	block->left = i915_block_alloc(mm, block, block_order, offset);
+	block->left = drm_block_alloc(mm, block, block_order, offset);
 	if (!block->left)
 		return -ENOMEM;
 
-	block->right = i915_block_alloc(mm, block, block_order,
+	block->right = drm_block_alloc(mm, block, block_order,
 					offset + (mm->chunk_size << block_order));
 	if (!block->right) {
-		i915_block_free(mm, block->left);
+		drm_block_free(mm, block->left);
 		return -ENOMEM;
 	}
 
@@ -191,10 +188,10 @@ static int split_block(struct i915_buddy_mm *mm,
 	return 0;
 }
 
-static struct i915_buddy_block *
-get_buddy(struct i915_buddy_block *block)
+static struct drm_buddy_block *
+get_buddy(struct drm_buddy_block *block)
 {
-	struct i915_buddy_block *parent;
+	struct drm_buddy_block *parent;
 
 	parent = block->parent;
 	if (!parent)
@@ -206,23 +203,23 @@ get_buddy(struct i915_buddy_block *block)
 	return parent->left;
 }
 
-static void __i915_buddy_free(struct i915_buddy_mm *mm,
-			      struct i915_buddy_block *block)
+static void __drm_buddy_free(struct drm_buddy_mm *mm,
+			     struct drm_buddy_block *block)
 {
-	struct i915_buddy_block *parent;
+	struct drm_buddy_block *parent;
 
 	while ((parent = block->parent)) {
-		struct i915_buddy_block *buddy;
+		struct drm_buddy_block *buddy;
 
 		buddy = get_buddy(block);
 
-		if (!i915_buddy_block_is_free(buddy))
+		if (!drm_buddy_block_is_free(buddy))
 			break;
 
 		list_del(&buddy->link);
 
-		i915_block_free(mm, block);
-		i915_block_free(mm, buddy);
+		drm_block_free(mm, block);
+		drm_block_free(mm, buddy);
 
 		block = parent;
 	}
@@ -230,20 +227,20 @@ static void __i915_buddy_free(struct i915_buddy_mm *mm,
 	mark_free(mm, block);
 }
 
-void i915_buddy_free(struct i915_buddy_mm *mm,
-		     struct i915_buddy_block *block)
+void drm_buddy_free(struct drm_buddy_mm *mm,
+		    struct drm_buddy_block *block)
 {
-	GEM_BUG_ON(!i915_buddy_block_is_allocated(block));
-	mm->avail += i915_buddy_block_size(mm, block);
-	__i915_buddy_free(mm, block);
+	BUG_ON(!drm_buddy_block_is_allocated(block));
+	mm->avail += drm_buddy_block_size(mm, block);
+	__drm_buddy_free(mm, block);
 }
 
-void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects)
+void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
 {
-	struct i915_buddy_block *block, *on;
+	struct drm_buddy_block *block, *on;
 
 	list_for_each_entry_safe(block, on, objects, link) {
-		i915_buddy_free(mm, block);
+		drm_buddy_free(mm, block);
 		cond_resched();
 	}
 	INIT_LIST_HEAD(objects);
@@ -257,16 +254,16 @@ void i915_buddy_free_list(struct i915_buddy_mm *mm, struct list_head *objects)
  *   2 = 2^2 * mm->chunk_size
  *   ...
  */
-struct i915_buddy_block *
-i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
+struct drm_buddy_block *
+drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
 {
-	struct i915_buddy_block *block = NULL;
+	struct drm_buddy_block *block = NULL;
 	unsigned int i;
 	int err;
 
 	for (i = order; i <= mm->max_order; ++i) {
 		block = list_first_entry_or_null(&mm->free_list[i],
-						 struct i915_buddy_block,
+						 struct drm_buddy_block,
 						 link);
 		if (block)
 			break;
@@ -275,7 +272,7 @@ i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
 	if (!block)
 		return ERR_PTR(-ENOSPC);
 
-	GEM_BUG_ON(!i915_buddy_block_is_free(block));
+	BUG_ON(!drm_buddy_block_is_free(block));
 
 	while (i != order) {
 		err = split_block(mm, block);
@@ -288,13 +285,13 @@ i915_buddy_alloc(struct i915_buddy_mm *mm, unsigned int order)
 	}
 
 	mark_allocated(block);
-	mm->avail -= i915_buddy_block_size(mm, block);
+	mm->avail -= drm_buddy_block_size(mm, block);
 	kmemleak_update_trace(block);
 	return block;
 
 out_free:
 	if (i != order)
-		__i915_buddy_free(mm, block);
+		__drm_buddy_free(mm, block);
 	return ERR_PTR(err);
 }
 
@@ -314,16 +311,16 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
  *
  * Intended for pre-allocating portions of the address space, for example to
  * reserve a block for the initial framebuffer or similar, hence the expectation
- * here is that i915_buddy_alloc() is still the main vehicle for
+ * here is that drm_buddy_alloc() is still the main vehicle for
  * allocations, so if that's not the case then the drm_mm range allocator is
  * probably a much better fit, and so you should probably go use that instead.
  */
-int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
-			   struct list_head *blocks,
-			   u64 start, u64 size)
+int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
+			  struct list_head *blocks,
+			  u64 start, u64 size)
 {
-	struct i915_buddy_block *block;
-	struct i915_buddy_block *buddy;
+	struct drm_buddy_block *block;
+	struct drm_buddy_block *buddy;
 	LIST_HEAD(allocated);
 	LIST_HEAD(dfs);
 	u64 end;
@@ -349,37 +346,37 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
 		u64 block_end;
 
 		block = list_first_entry_or_null(&dfs,
-						 struct i915_buddy_block,
+						 struct drm_buddy_block,
 						 tmp_link);
 		if (!block)
 			break;
 
 		list_del(&block->tmp_link);
 
-		block_start = i915_buddy_block_offset(block);
-		block_end = block_start + i915_buddy_block_size(mm, block) - 1;
+		block_start = drm_buddy_block_offset(block);
+		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
 
 		if (!overlaps(start, end, block_start, block_end))
 			continue;
 
-		if (i915_buddy_block_is_allocated(block)) {
+		if (drm_buddy_block_is_allocated(block)) {
 			err = -ENOSPC;
 			goto err_free;
 		}
 
 		if (contains(start, end, block_start, block_end)) {
-			if (!i915_buddy_block_is_free(block)) {
+			if (!drm_buddy_block_is_free(block)) {
 				err = -ENOSPC;
 				goto err_free;
 			}
 
 			mark_allocated(block);
-			mm->avail -= i915_buddy_block_size(mm, block);
+			mm->avail -= drm_buddy_block_size(mm, block);
 			list_add_tail(&block->link, &allocated);
 			continue;
 		}
 
-		if (!i915_buddy_block_is_split(block)) {
+		if (!drm_buddy_block_is_split(block)) {
 			err = split_block(mm, block);
 			if (unlikely(err))
 				goto err_undo;
@@ -400,26 +397,26 @@ int i915_buddy_alloc_range(struct i915_buddy_mm *mm,
 	 */
 	buddy = get_buddy(block);
 	if (buddy &&
-	    (i915_buddy_block_is_free(block) &&
-	     i915_buddy_block_is_free(buddy)))
-		__i915_buddy_free(mm, block);
+	    (drm_buddy_block_is_free(block) &&
+	     drm_buddy_block_is_free(buddy)))
+		__drm_buddy_free(mm, block);
 
 err_free:
-	i915_buddy_free_list(mm, &allocated);
+	drm_buddy_free_list(mm, &allocated);
 	return err;
 }
 
-void i915_buddy_block_print(struct i915_buddy_mm *mm,
-			    struct i915_buddy_block *block,
-			    struct drm_printer *p)
+void drm_buddy_block_print(struct drm_buddy_mm *mm,
+			   struct drm_buddy_block *block,
+			   struct drm_printer *p)
 {
-	u64 start = i915_buddy_block_offset(block);
-	u64 size = i915_buddy_block_size(mm, block);
+	u64 start = drm_buddy_block_offset(block);
+	u64 size = drm_buddy_block_size(mm, block);
 
 	drm_printf(p, "%#018llx-%#018llx: %llu\n", start, start + size, size);
 }
 
-void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p)
+void drm_buddy_print(struct drm_buddy_mm *mm, struct drm_printer *p)
 {
 	int order;
 
@@ -427,11 +424,11 @@ void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p)
 		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
 
 	for (order = mm->max_order; order >= 0; order--) {
-		struct i915_buddy_block *block;
+		struct drm_buddy_block *block;
 		u64 count = 0, free;
 
 		list_for_each_entry(block, &mm->free_list[order], link) {
-			GEM_BUG_ON(!i915_buddy_block_is_free(block));
+			BUG_ON(!drm_buddy_block_is_free(block));
 			count++;
 		}
 
@@ -451,14 +448,14 @@ void i915_buddy_print(struct i915_buddy_mm *mm, struct drm_printer *p)
 #include "selftests/i915_buddy.c"
 #endif
 
-void i915_buddy_module_exit(void)
+void drm_buddy_module_exit(void)
 {
 	kmem_cache_destroy(slab_blocks);
 }
 
-int __init i915_buddy_module_init(void)
+int __init drm_buddy_module_init(void)
 {
-	slab_blocks = KMEM_CACHE(i915_buddy_block, 0);
+	slab_blocks = KMEM_CACHE(drm_buddy_block, 0);
 	if (!slab_blocks)
 		return -ENOMEM;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 521ed532d2b8..390b133fe342 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -9,9 +9,19 @@
 #include <linux/bitops.h>
 #include <linux/list.h>
 #include <linux/slab.h>
+#include <linux/sched.h>
 
 #include <drm/drm_print.h>
 
+#define range_overflows(start, size, max) ({ \
+	typeof(start) start__ = (start); \
+	typeof(size) size__ = (size); \
+	typeof(max) max__ = (max); \
+	(void)(&start__ == &size__); \
+	(void)(&start__ == &max__); \
+	start__ >= max__ || size__ > max__ - start__; \
+})
+
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
-- 
2.25.1

