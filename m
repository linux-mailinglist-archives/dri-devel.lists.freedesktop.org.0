Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C304939AB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 12:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1621210EAC0;
	Wed, 19 Jan 2022 11:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2051.outbound.protection.outlook.com [40.107.102.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA73210EAC8;
 Wed, 19 Jan 2022 11:38:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hf2dLKxDXoMUuIJaFYLqCM6AVaXkdh4EzD8cdWEN9RO7mhkbMyjVvtjLFyAH1+bWpVf5UyMvhgEYgBFeVzyFOeFMSFH2N9Gqos0YOxoIS7KbkPIL2Bhrm1rF9xO6fx2hXRTgpzfzz3gxy2jhiDJg9FUswL4jq8H3uDfP5bdX/j5xr80O8eKcGVYSZ/T7uKQn8r4yYIXseP/Nz4sIT7JTROcVCnbonc/Wm86I3uzG/AcH1uW0YBpX5JAN7uavfQj1arnrkEaQ0i/LUPgrjOBwtnpKmgpiBzS3ewCCN0gZ5by6RcVqB9sCezIhqM/BunSQ9UueAxPeY5uMIUVWg5SU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibUUUyiKmRZLUIMNMC6RuVofhyqybsw+qjPKAhe+zNE=;
 b=FIGZVU3BmxJ7SIhyvw4hLhy37MW5ClfnxoK4zT3r6BWzHUFNN6TG5s8iQBurmcYSYwkMRmB4CsPluRX44WCmguR7gsFlqQxe6PCXlzHfF5bnTlGjMNkHSbWzmR9ayY7eFV7OPmPVmyg/Ap77a2bFjsBdgwlPcYxeQ80ff4OFtwyuNm89QhPBjVzSmxiF28bqEr/ylCNdo3UJOwsQchqIxrcUqJmJyjSy1R1vzpPHz08XkFzu4v/k8LM79fKjuhrygOGiaBmZQ1AqZhzwE6jNxiHDEpE7YLh2aP9P+gzp508Id4T1eNOBiAQFs6LekutnzKkkmP2U+HlsKrKtklK5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibUUUyiKmRZLUIMNMC6RuVofhyqybsw+qjPKAhe+zNE=;
 b=Qf0K+jJ5y2tkPY5YB5gy7nFLMuWLPRBeerGYvqbUiuWkhtlWHUWjpAESuyLXDwt5kX4Wc9JXyfgmIVMYi4H04tF6sYRbsyKDoorFb4RTrmKBH8yJIYVqa0SElqSEsARlnadJoWY2Wr+j/Qw/JLQN0997lsS1Zbq7nS3nOatX8HA=
Received: from BN1PR10CA0026.namprd10.prod.outlook.com (2603:10b6:408:e0::31)
 by MN2PR12MB2942.namprd12.prod.outlook.com (2603:10b6:208:108::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Wed, 19 Jan
 2022 11:37:58 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::10) by BN1PR10CA0026.outlook.office365.com
 (2603:10b6:408:e0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Wed, 19 Jan 2022 11:37:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Wed, 19 Jan 2022 11:37:58 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 19 Jan
 2022 05:37:55 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 4/6] drm: implement a method to free unused pages
Date: Wed, 19 Jan 2022 17:07:16 +0530
Message-ID: <20220119113718.3311-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119113718.3311-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220119113718.3311-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85fe307e-7c77-43ec-ba7a-08d9db40246c
X-MS-TrafficTypeDiagnostic: MN2PR12MB2942:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2942F51CB9B363AA44AB9333E4599@MN2PR12MB2942.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Th6Z103yW9Klu9y4BJKTvJQ9qgqpPXFDiQKRBmB8W3jA9j7u7RCXnhSQz2RfyI7vo07O2Clbz5WCzAmw57MqTSg1oMpCExpXn9rxqJOm36Kdd2Odg5Rg4bBGdZNscDFhSgMrzGVzmF5uaEmKuK/DiXpYevn3Veyhuu7sOVH4f0EgIu6JJjPQhFPd27EqpX2wC3EPwyeOhPzb6ovxhid9cdIZWQLUhQAFCCTEQ3SqHCbs4E+cTFKW5R13ZB57OWObLLoxmiKlyRjyv38Tz39ACB5/+TIouUn5yYzPRbEJbo/xeuYmccSHyP1P/NVDwuBA4mKHHFc+/MUkYXUNq6J7SV6mWVs0zujqYF+AE88ShDlJZOqG0ZB71LZjGTgPN/WYcE3AOyEg+oK0tGAwW3Tpv4TVV2AVOsgfQZvbD9hV78cGAvCBxJTukO228RVweGeMVrDCoIq5CX7xVJYXYVXE1aPBbW+AtrItQbimbaUiyvgTril+4IglxIQVHul5Xhn5oYFDkRH7g2kDZmbAwjflmaQT/+yMxbSf5gUQAFdq47XGDVArXXHkb+GlHwJll6wWql+FpOa7jfvGuVW1sjZlWBZHjfhVhs6NDl61+FkDDY9vRjOn8DfwpB4VP8jkkKSkCBRuWuwpYLhvqIBDN0EMSlzjWpl+GimoPezc0L8AIHtOXObsd3t83rHC1vqWxemWQYnlXsX4mzwIsaujYvVRU5kyWT2Ck7MFhguBSaRxHmaCv3HT4E5LzKKCEx5GRolEfT1yla/NYG8wXvpNxWdIIIUkzitnJ4jSPpiFYX/4TMs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(356005)(2906002)(7696005)(26005)(36756003)(82310400004)(508600001)(86362001)(186003)(70206006)(36860700001)(47076005)(1076003)(5660300002)(16526019)(2616005)(70586007)(110136005)(83380400001)(81166007)(40460700001)(336012)(316002)(4326008)(8936002)(426003)(6666004)(8676002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 11:37:58.4818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fe307e-7c77-43ec-ba7a-08d9db40246c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2942
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

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 65 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 10 +++
 include/drm/drm_buddy.h                       |  4 ++
 3 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 6aa5c1ce25bf..c5902a81b8c5 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -546,6 +546,71 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
 	return __alloc_range(mm, &dfs, start, size, blocks);
 }
 
+/**
+ * drm_buddy_block_trim - free unused pages
+ *
+ * @mm: DRM buddy manager
+ * @new_size: original size requested
+ * @blocks: output list head to add allocated blocks
+ *
+ * For contiguous allocation, we round up the size to the nearest
+ * power of two value, drivers consume *actual* size, so remaining
+ * portions are unused and it can be freed.
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
+	if (!drm_buddy_block_is_allocated(block))
+		return -EINVAL;
+
+	if (new_size > drm_buddy_block_size(mm, block))
+		return -EINVAL;
+
+	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
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
index 3662434b64bb..53eb100688a6 100644
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
index 424fc443115e..17ca928fce8e 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -145,6 +145,10 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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

