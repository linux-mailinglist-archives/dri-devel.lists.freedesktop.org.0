Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C19C49E442
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8897810EF51;
	Thu, 27 Jan 2022 14:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B640510EF3E;
 Thu, 27 Jan 2022 14:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJ5MknKYZPjjXRnyZCu1IFTx+2RgxTUYhHi5MeSykeMIyDq6S6PvvpLxsUIlnescXEVfHd2nWtF/NircvivM2+IMdE4DqXecCnj1vPAagV5Bk9bODb5RbT54FL8r30KpXVaTg6wyJiMno9lxYJBfmTidZ7SeAwlfbJ62gAFWT34ob0f706blPXemFg+OrunUdLKEhCwGQQ7Jsj5PFqyA8Uhks6Ygs7LHZT5P3oSQxb6kRoCZLIWhhMP8JXlq8p0gQo9XyQ1NMX18koWWfogX0tKQ9O4PP+AtCl23J4EoddJRUwDjxiwikplZ1utqhihqhVjDrVJgSPwSU2L4QkwSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaK/DN/3fR3ZFHiOZ89ACdlMfDAa//s7kbP9Ek5z3UM=;
 b=lYT3Kbvha2m+WG+HL4W9pBvmhYkFSUj6tnGeBykBvKZTZz01q91NoWKI3XmeHJ1v/pJ594z8oIedMKC8fwbnqWJRIYq0/lhu6fnVUULQgAro5MMkDRcn36NV08oWr+08ae5PBaq5OqX1OfO4/uOfHaatnA7qUfYpKomeO9nr7CBA0C4CzaK3Ui9tKq96JmMbhCqCqSeNluHV2BrQNQD0Y+QBc/YXYwlUXotTXUwW+bwsKa7yQLR7BVn4jfRoCqw/DqTNDYmVKgTfzKbOH37/hI24GzkKGYkQ3jxo7D0B0h3HGSzsP9ZfV/vaE0cGJZQFGfJiSXDJLIv6kLEr0AEmIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaK/DN/3fR3ZFHiOZ89ACdlMfDAa//s7kbP9Ek5z3UM=;
 b=s5gaxecNMrZKlt0TBaikBaTG3TDbPBasz7arNVZ7W7PBPkQJO9XcWZq+eiC3ZnF2SU3C1bqw3J/9kdGiAhf/S0MYS2SPWKcplRHFGjPARs2BaJTs4t6J4k/+egJ4JffdqFocLStsGEmou/zehG2AgUHl5Zdwa0H2ManLCKkjAuc=
Received: from BN8PR12CA0002.namprd12.prod.outlook.com (2603:10b6:408:60::15)
 by DM4PR12MB5231.namprd12.prod.outlook.com (2603:10b6:5:39b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 14:11:35 +0000
Received: from BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::f9) by BN8PR12CA0002.outlook.office365.com
 (2603:10b6:408:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 14:11:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT049.mail.protection.outlook.com (10.13.177.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 14:11:34 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 27 Jan
 2022 08:11:31 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v11 3/5] drm: implement a method to free unused pages
Date: Thu, 27 Jan 2022 19:41:05 +0530
Message-ID: <20220127141107.173692-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83d28467-08d4-4343-4ee2-08d9e19eed33
X-MS-TrafficTypeDiagnostic: DM4PR12MB5231:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB52313F9499AE6666AD11A821E4219@DM4PR12MB5231.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: abFSsX99gob909NMDNHvqdUmMrhCtZowi6dqgxq2O7ma+9Hh2WmbOlarg+7tR8XmZtQD38X6iEdfU42LoakRvF5jFqXQlZtge7N7vdBFmF7pWuwFPdKY8xSDvnmIRacb1unTObZYWXPSO3Pmseha4isbD+efQ/qP+ioRvHjBT5Yuj0o8/n0Uzbvq4eLA/axOLC2slKKxae7Hku9RODJ0PrDRM4MocoUsZAxlKY89SY3+lM7dLKqgUYke1sZtwrLwNU/ViCrjClPtU5bVM9bAxa4Xvn8L4i/oYQK6LVqPb/unkngXIhysTkDALxvklyXjCoIGNPC2U8VSGo2cBNclfX40rHeaSzoILk60DOl3CFKDVjigvUR8pHEEw7qTd6+r8itBJNeqjV1BeQrm+8gPivWGuoVRXyGp0mgP6qMGqLY3VhtDIMFQ//sgZoevOrMFCz8Tg2KN1TBgbMFrf1GpKooEp4PwXlaBGCsxSmqTmICL2nBSMvGFBaRVpg2ztOuAgQi61HIncZuS/pzMUov7YgUVrBw3Pqbt4t0rrPHSxGMGIOScqQH1nKCcaw3Im6dqdv5UsFTWQoqRDrQkPQKL9U0/Jr5n0yiGX/eiGaS9m5/lKZoUBwVyNggg971jIiaMBEDacnALpA0JG3IyU7PD+4NH6swkSQLYiAr6u4EUZPktR2QdDQzT6o6Y4aDp7LuhX24g9KsydxkC1KAHdzcdzA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70206006)(70586007)(8936002)(8676002)(4326008)(82310400004)(47076005)(81166007)(6666004)(356005)(36860700001)(2616005)(54906003)(110136005)(83380400001)(508600001)(336012)(5660300002)(7696005)(426003)(86362001)(36756003)(1076003)(16526019)(26005)(186003)(316002)(2906002)(40460700003)(36900700001)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 14:11:34.9499 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d28467-08d4-4343-4ee2-08d9e19eed33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT049.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5231
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

On contiguous allocation, we round up the size
to the *next* power of 2, implement a function
to free the unused pages after the newly allocate block.

v2(Matthew Auld):
  - replace function name 'drm_buddy_free_unused_pages' with
    drm_buddy_block_trim
  - replace input argument name 'actual_size' with 'new_size'
  - add more validation checks for input arguments
  - add overlaps check to avoid needless searching and splitting
  - merged the below patch to see the feature in action
     - add free unused pages support to i915 driver
  - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
    are all globally visible

v3(Matthew Auld):
  - remove trim method error handling as we address the failure case
    at drm_buddy_block_trim() function

v4:
  - in case of trim, at __alloc_range() split_block failure path
    marks the block as free and removes it from the original list,
    potentially also freeing it, to overcome this problem, we turn
    the drm_buddy_block_trim() input node into a temporary node to
    prevent recursively freeing itself, but still retain the
    un-splitting/freeing of the other nodes(Matthew Auld)

  - modify the drm_buddy_block_trim() function return type

v5(Matthew Auld):
  - revert drm_buddy_block_trim() function return type changes in v4
  - modify drm_buddy_block_trim() passing argument n_pages to original_size
    as n_pages has already been rounded up to the next power-of-two and
    passing n_pages results noop

v6:
  - fix warnings reported by kernel test robot <lkp@intel.com>

v7:
  - modify drm_buddy_block_trim() function doc description
  - at drm_buddy_block_trim() handle non-allocated block as
    a serious programmer error
  - fix a typo

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 69 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 10 +++
 include/drm/drm_buddy.h                       |  4 ++
 3 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 30cad939a112..4845ef784b5e 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -542,6 +542,75 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
 	return __alloc_range(mm, &dfs, start, size, blocks);
 }
 
+/**
+ * drm_buddy_block_trim - free unused pages
+ *
+ * @mm: DRM buddy manager
+ * @new_size: original size requested
+ * @blocks: Input and output list of allocated blocks.
+ * MUST contain single block as input to be trimmed.
+ * On success will contain the newly allocated blocks
+ * making up the @new_size. Blocks always appear in
+ * ascending order
+ *
+ * For contiguous allocation, we round up the size to the nearest
+ * power of two value, drivers consume *actual* size, so remaining
+ * portions are unused and can be optionally freed with this function
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_block_trim(struct drm_buddy *mm,
+			 u64 new_size,
+			 struct list_head *blocks)
+{
+	struct drm_buddy_block *parent;
+	struct drm_buddy_block *block;
+	LIST_HEAD(dfs);
+	u64 new_start;
+	int err;
+
+	if (!list_is_singular(blocks))
+		return -EINVAL;
+
+	block = list_first_entry(blocks,
+				 struct drm_buddy_block,
+				 link);
+
+	if (WARN_ON(!drm_buddy_block_is_allocated(block)))
+		return -EINVAL;
+
+	if (new_size > drm_buddy_block_size(mm, block))
+		return -EINVAL;
+
+	if (!new_size || !IS_ALIGNED(new_size, mm->chunk_size))
+		return -EINVAL;
+
+	if (new_size == drm_buddy_block_size(mm, block))
+		return 0;
+
+	list_del(&block->link);
+	mark_free(mm, block);
+	mm->avail += drm_buddy_block_size(mm, block);
+
+	/* Prevent recursively freeing this node */
+	parent = block->parent;
+	block->parent = NULL;
+
+	new_start = drm_buddy_block_offset(block);
+	list_add(&block->tmp_link, &dfs);
+	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
+	if (err) {
+		mark_allocated(block);
+		mm->avail -= drm_buddy_block_size(mm, block);
+		list_add(&block->link, blocks);
+	}
+
+	block->parent = parent;
+	return err;
+}
+EXPORT_SYMBOL(drm_buddy_block_trim);
+
 /**
  * drm_buddy_alloc_blocks - allocate power-of-two blocks
  *
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 7f553cceb6c0..76d5211c25eb 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -97,6 +97,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (unlikely(err))
 		goto err_free_blocks;
 
+	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
+
+		mutex_lock(&bman->lock);
+		drm_buddy_block_trim(mm,
+				     original_size,
+				     &bman_res->blocks);
+		mutex_unlock(&bman->lock);
+	}
+
 	*res = &bman_res->base;
 	return 0;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index f0378fb48d06..bd21f9dfd15e 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -140,6 +140,10 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   struct list_head *blocks,
 			   unsigned long flags);
 
+int drm_buddy_block_trim(struct drm_buddy *mm,
+			 u64 new_size,
+			 struct list_head *blocks);
+
 void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
 
 void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects);
-- 
2.25.1

