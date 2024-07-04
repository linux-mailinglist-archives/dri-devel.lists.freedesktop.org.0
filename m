Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9599271B8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C0D10EA20;
	Thu,  4 Jul 2024 08:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yBkbd9+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589C210EA1F;
 Thu,  4 Jul 2024 08:30:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4jBhBhCRvlXa4iKpa2LXkLm3zWreVOmzb+Ka1xGDiherVKm/XR9LDIwoTpkxDznmiRi456biikDt+qbnI52hLRfK1UyVOUS9+BMEdKkeqgBoSv0ouVfsWy1wsNSrZUc35jKC+ZcOsR0JMCn0FGWCJyCTae139ZQ6ERmNaMHSQ3bh91zkm8LawdHGFh9FyD8t8x6VDuLT0TgJtmJDQptqfi4ksOc/MQbMv8HtW7A4ViBDji3eVH8RQWLo3L3ieBLp5YjzfbiKwHIbnOcgZ4B+IudmCrUTPLmtJXTqwHQM2v8r/DSUdVptJHYEn3d+S93bL6STOcv9IXP0eRdh3+MIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoPU7R+GKXJ2E4eqyfIuVkgx6VhrH+RKm7b7v9m0Awo=;
 b=eGmhAztGqVk4XPxz1pc7Tr3BPyo4nrFPhfFyKZ8lmtN8R6uOqcIfHVsh5ZBh625TZRMiEFnwD9l6nDBdUK0Ct7BXXjbcRIB5EaR7twYWIey3shr9aps5TxOCOHB27N97nKBFtBci6OG0O/M3o82nDUf1cKObtgnE7T9lIgwuYkDukGRN4oXhKlcE0lTR5AGPT3EmVkOJWxZE01AkdlI29KWZBKVp4UnwVOKD5BzpMxQHiCZB1o0K2915yWwkCoc7OiPbG87PBmOLfKW6UWu2IBQ4Ajq09kd7zAL8GTVkeqEJHnEPijqEo57vYlbaNqN24IPZzEirPIQVmu3njIYsBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoPU7R+GKXJ2E4eqyfIuVkgx6VhrH+RKm7b7v9m0Awo=;
 b=yBkbd9+GQpP/8JZtvqO/0QY5XKj4WvkC4bQlKQOwQCYIuN8SuoYqfJjoFCCwtnzMor9h4kY/9/OXa75uUtSIOXx9DbOzUVaRBz7IEWN8HtLrz8L9iI67VfkSBs7vFPlVevI4+D0zrnB/b4nvdJ68vtCVbc2oUY4zTz1Y94a/8DU=
Received: from SN7PR04CA0107.namprd04.prod.outlook.com (2603:10b6:806:122::22)
 by SA0PR12MB4477.namprd12.prod.outlook.com (2603:10b6:806:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Thu, 4 Jul
 2024 08:30:29 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:122:cafe::40) by SN7PR04CA0107.outlook.office365.com
 (2603:10b6:806:122::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25 via Frontend
 Transport; Thu, 4 Jul 2024 08:30:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Thu, 4 Jul 2024 08:30:28 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 4 Jul 2024 03:30:25 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, <marek.olsak@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH] drm/buddy: Add start address support to trim function
Date: Thu, 4 Jul 2024 14:00:07 +0530
Message-ID: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SA0PR12MB4477:EE_
X-MS-Office365-Filtering-Correlation-Id: d317e639-04e4-4a15-44c6-08dc9c038f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9mKabZ/6/4OVDCXDAtq9Mf7H83vyHHnoqxY+B/uM+07eHHhXabj2TKPs05gO?=
 =?us-ascii?Q?7F2MpiQFqSw+WRxLeTkZ3bCAXaTJIShbPxj86iC52+FU7EGKR26NDTgE81zD?=
 =?us-ascii?Q?i4EhmVhiWdVn65mygF6UYsNSF35XWe3cvVu6kG+L5V9FJIsXdQGnmTRYPZ60?=
 =?us-ascii?Q?AWN2RmRdBSObVukmT+DDarbGLZrg4w+dvwfrKvgM122Kcpyr9UySyWL1Iqm/?=
 =?us-ascii?Q?8wGpuvPN7QB/xyohP+IKl94OqGfxYg+ectXiuwnZ8FKGbozDNBzBy3ozi35m?=
 =?us-ascii?Q?fAPS9egMHpZ5mht8PIUoe4JDadC6y0IaUwhlwzSHvma/NqIKiwv8Xdzqv1/N?=
 =?us-ascii?Q?/ArQPxAYu31KZk8hLr3TCIbm6yzzL28Sd6ec3rDoT6hJgUp+geLRwC/VDdta?=
 =?us-ascii?Q?oiRyb6vTtZxOfQuaYSJSksHefh8hQf+ouI2WJvasgHlgAl+2TZazjTIY4d2b?=
 =?us-ascii?Q?yoIvrIDsSVOtqkIehp7Y2lLhDV3p2IBP5oMcs6v6t6qQWNZp3CeUety1kuHG?=
 =?us-ascii?Q?VB0LDFAKbatmkHIsnOATTpnL3CbTCIaxMLKsNqm9gA741DJjNU5zDQOkSx1n?=
 =?us-ascii?Q?bfqh2frdIMBiNNx3uSHAHAJq1ZozubDjhNcrrYnUvZ2KTMLZPjWrX4qk0BcT?=
 =?us-ascii?Q?frwxWu2YCu46TiYEY2XjiY1m2IvJFPX0SsotbXK+d1Ah7aZhZ9m9UHZhTzjx?=
 =?us-ascii?Q?V3E7H4S6OdN7K31UJxSii+zL9ufjKxTBs8xF4bDY6p2Bu9ucs7PSP+sesPJq?=
 =?us-ascii?Q?oSargXGxcJ80qYJak/FTG3ohGsmKSVVJklwfDfR9TxGj3/W0UmhmofDawtJq?=
 =?us-ascii?Q?HrR0yt4M5ArEGjbXtB2Ry56wcQvfqMBgPeYuTM7a2zBXNtLSQkLs5qnc4onn?=
 =?us-ascii?Q?KTq5jW8gHSbFsWhmrbqnXVzRVzN+sUY+98odnflfz8xQyNxJbe+5DgFw9IgB?=
 =?us-ascii?Q?OGsn0bA4jm6hmp/COAW9yOK4dqkKDufb2lA/TFNXHy/pscsoEMW69r3UaR9I?=
 =?us-ascii?Q?N7qyiKHVEk7rIh4vmE/zprlqarLmId+HddA0MQzC+Od4Nfi43SPo64ZiIDD5?=
 =?us-ascii?Q?RjRLk60gm37zJ0RJZWW9FRA/50KVZu3yeGuXATjjEHXAnBRsn40UldDg6EW2?=
 =?us-ascii?Q?Mgut2chWdZM/JZyCAX5Wze6MnhFgilfULqkgY7OO5a/LYA8rIi9cBJd7SP/G?=
 =?us-ascii?Q?U+nciojZHZtew+dTfUKA4U1TtF51juyUHqcZ1fQuokL5gDNTjS2vJPyjHqSK?=
 =?us-ascii?Q?6r3jM1D5MfQO6zVEKPLhi39CpuFJGaUf8p6NYvxYowdSaoYRs2jaC2BHyilA?=
 =?us-ascii?Q?a4uokTcdwWLEQ9AtDIOZsqTufhpmsgF7x2mL6llBG3vCQhzazdOCwY03AKTx?=
 =?us-ascii?Q?xb2q7kbZ/kbg446LDohzZcd5pvHxLSYA9SPNHZkPRSEht8ovY/E5xa6YcqbF?=
 =?us-ascii?Q?wY9O9F1/nANahbHQe7YVeTFaD9ShYyw1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 08:30:28.7244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d317e639-04e4-4a15-44c6-08dc9c038f9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4477
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

- Add a new start parameter in trim function to specify exact
  address from where to start the trimming. This would help us
  in situations like if drivers would like to do address alignment
  for specific requirements.

- Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
  flag to disable the allocator trimming part. This patch enables
  the drivers control trimming and they can do it themselves
  based on the application requirements.

v1:(Matthew)
  - check new_start alignment with min chunk_size
  - use range_overflows()

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
 include/drm/drm_buddy.h              |  2 ++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 94f8c34fc293..8cebe1fa4e9d 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
  * drm_buddy_block_trim - free unused pages
  *
  * @mm: DRM buddy manager
+ * @start: start address to begin the trimming.
  * @new_size: original size requested
  * @blocks: Input and output list of allocated blocks.
  * MUST contain single block as input to be trimmed.
@@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
  * 0 on success, error code on failure.
  */
 int drm_buddy_block_trim(struct drm_buddy *mm,
+			 u64 *start,
 			 u64 new_size,
 			 struct list_head *blocks)
 {
 	struct drm_buddy_block *parent;
 	struct drm_buddy_block *block;
+	u64 block_start, block_end;
 	LIST_HEAD(dfs);
 	u64 new_start;
 	int err;
@@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 				 struct drm_buddy_block,
 				 link);
 
+	block_start = drm_buddy_block_offset(block);
+	block_end = block_start + drm_buddy_block_size(mm, block);
+
 	if (WARN_ON(!drm_buddy_block_is_allocated(block)))
 		return -EINVAL;
 
@@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	if (new_size == drm_buddy_block_size(mm, block))
 		return 0;
 
+	new_start = block_start;
+	if (start) {
+		new_start = *start;
+
+		if (new_start < block_start)
+			return -EINVAL;
+
+		if (!IS_ALIGNED(new_start, mm->chunk_size))
+			return -EINVAL;
+
+		if (range_overflows(new_start, new_size, block_end))
+			return -EINVAL;
+	}
+
 	list_del(&block->link);
 	mark_free(mm, block);
 	mm->avail += drm_buddy_block_size(mm, block);
@@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	parent = block->parent;
 	block->parent = NULL;
 
-	new_start = drm_buddy_block_offset(block);
 	list_add(&block->tmp_link, &dfs);
 	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
 	if (err) {
@@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	} while (1);
 
 	/* Trim the allocated block to the required size */
-	if (original_size != size) {
+	if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
+	    original_size != size) {
 		struct list_head *trim_list;
 		LIST_HEAD(temp);
 		u64 trim_size;
@@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 		}
 
 		drm_buddy_block_trim(mm,
+				     NULL,
 				     trim_size,
 				     trim_list);
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index fe3779fdba2c..423b261ea743 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	} while (remaining_size);
 
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks))
+		if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vres->blocks))
 			size = vres->base.size;
 	}
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 82570f77e817..0c2f735f0265 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -27,6 +27,7 @@
 #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
 #define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
 #define DRM_BUDDY_CLEARED			BIT(4)
+#define DRM_BUDDY_TRIM_DISABLE			BIT(5)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
@@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 			   unsigned long flags);
 
 int drm_buddy_block_trim(struct drm_buddy *mm,
+			 u64 *start,
 			 u64 new_size,
 			 struct list_head *blocks);
 
-- 
2.25.1

