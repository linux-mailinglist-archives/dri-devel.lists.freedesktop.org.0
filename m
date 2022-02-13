Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E664B3A59
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 09:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C35510F37C;
	Sun, 13 Feb 2022 08:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC4710F371;
 Sun, 13 Feb 2022 08:52:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6eUcrYIg1go8IwMCeBJCBmVxTpmXDn8YoUEzHDNFiBhuPfupyqa6rbgYOqw2eYJxrMJAPnvH0D4WBiQ2ayJzzi14WrYWpC8Lakqv3I9rdVyNygMJ1b2vLtMkQ3tL5rwWBpjAdWlzXvKtncDG2YgKkXcZmng5wzLKY2PsbWJwsW7KW3fBhIZFL39jpkviiePWvDw+oe6+rnk0LgNAuwkLTaYc2mc5pFtJFLW3pDCATqY/6rBP25rLfVg+YuQOdUYb7QZfLDjks+XNxIlm5MErLrP381SvJ8xb4dPDL0SVITdbyLxUyelV361HVR5jJoeMt8UqGXpqHnIPStZc5wzNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iv6QUJZNA2Fmego1l1GRQwprSXrcWzdRWmhAKo0yCHg=;
 b=b8Vof+IFIg81VWxoyt6wY37FddKDGn+GMzh0AUzloB5aihaO5masDqkZinngU5/fRy0hEFI6ibMXe/+uKNszoksZhCImXG3Z6raLQOe3IBiCcW59wprPlLWc7On+Ha1iF9mqYEes8ud6L3s03MMtD0MROJ1IdT8hwVtZCjed6ik7nKhJfAy0/5OyzVqhP6m3s0ZEps3lFDTgyTW6cs65Z6KhZgV3/Q+smFOZvPKheOb39U/XwBxPpOGoe1kFzyq6InoThSXLD5D8g4HkyWpOham1vbo9hnHYnf5WnomXRGbWuf5RTmtPsMe1UwJDcRUnW8UacfJvjk4D8jqqV2tM+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iv6QUJZNA2Fmego1l1GRQwprSXrcWzdRWmhAKo0yCHg=;
 b=oEN6cUHz/0t192xynseZZ1dorb44HhU/gfn9+XZQgAN5Yi4jTNM+Wwn+BB6WUXkPX6JIzDxRJP9OGgx/i8JJjxDwjXTWApaME2nMTVlA7/5fd6IGmhwcf11zqZU4RubE1MP24u3Ka16SEf0ap51wt3cntF/EUGss91Bv3uooBXk=
Received: from BN9PR03CA0414.namprd03.prod.outlook.com (2603:10b6:408:111::29)
 by CH2PR12MB4922.namprd12.prod.outlook.com (2603:10b6:610:65::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Sun, 13 Feb
 2022 08:52:50 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::58) by BN9PR03CA0414.outlook.office365.com
 (2603:10b6:408:111::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.13 via Frontend
 Transport; Sun, 13 Feb 2022 08:52:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Sun, 13 Feb 2022 08:52:49 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 13 Feb
 2022 02:52:43 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v12 3/5] drm: implement a method to free unused pages
Date: Sun, 13 Feb 2022 14:22:15 +0530
Message-ID: <20220213085217.2705-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220213085217.2705-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e54d7b8-b371-42f5-7ab9-08d9eece36ad
X-MS-TrafficTypeDiagnostic: CH2PR12MB4922:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4922F7117AB741B3FDC465FBE4329@CH2PR12MB4922.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y6lmpAf5B93qQdJ7RQS67E4TSO21Pe97iYjGTNr7sa6b+J/sp/UNWnq/fv9dKRRPn2cKXumLdQRcww11AofrHzw4qzVhjfdamoXOK3YC5HucJNclPx4yhTCI778wa0uud6UCpoux/LudR7ziuWIBx72cOBG+kRdCbthSh+DaE9NJG1bSKxxicqofeAKgnW3E9xqHlj5ucrYxf2wkC7+oqr1Ngq2xIBZIIFBQC4v7KuopaZarGlbIEOrlnbrvRT+4m6ekUmByf41v4Jg5jR4Ts/hSpb4iY15Cm0bJFiR++vbCXKla9aukmNoF2+0rFyK0zE6Z9QINbhAJIQC6qDJndopgMqlHPevjm0oGd5avsa3t8gtUqvpij2QJwmnvweSgxZ0DRqKlbwZCN8whwN0EVRkaOH6Ho1pvqJuSkVMQ9y45z8Dt5xs28RoY+l7/FSCeGASEdhs5WvYVPk7QH7RC5Kyg7A1HD0xWpm4S2Hhsyp1PYb5sw6BMAmNXIX7k/0TsA/aV1sJnblLBLseWWZDo+Qh8cQA45MFW+nKu51TcFXpBaPX+V16mWQE9nxFaBzfBVpOYlx33BvfGwilv0J5H6pmcK4k/ZNMBDbJwtTCatoFaKpefIQ+3YqAZrCvWFi+O1+lybKlfQBEsPJ2u+ZHa7hS9UQS4H8cpkmDbrCJ/osaGvu0kg+Pj0iSjVn2ROmNOc3LbOZB/PUyphJ5KW6J7sg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(7696005)(86362001)(36860700001)(82310400004)(2906002)(356005)(5660300002)(6666004)(316002)(40460700003)(81166007)(54906003)(70586007)(36756003)(70206006)(26005)(47076005)(83380400001)(186003)(110136005)(426003)(336012)(4326008)(8676002)(16526019)(508600001)(1076003)(8936002)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2022 08:52:49.7179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e54d7b8-b371-42f5-7ab9-08d9eece36ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4922
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
index b71e74827550..8e53c620289c 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -525,6 +525,75 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
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
index 698747dd1c42..8980dd094627 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -94,6 +94,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
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
index 8e08ab8551d4..7594b4eddf7b 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -139,6 +139,10 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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

