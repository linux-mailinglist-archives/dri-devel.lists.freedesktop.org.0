Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F44911A66
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 07:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1759810E2A1;
	Fri, 21 Jun 2024 05:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iv0nkaTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5008210E2A1;
 Fri, 21 Jun 2024 05:29:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=le0t4pNRte/c9AMEQOmesiWz3Ajt9k7qIF60x2jPPacdGziRNmXaJcFBskIeAdQ+0nF2zeLkWqZQRVhwpGvBCoY/4lXXRMrvGrM3LJo8/ktLp2wJE4nX1IhaUvrdy2NkmA5YfeEwpBDixoRYhRA3yrP/WcF8TF23DBb8Cfqke+sA70t3BJ+2nFR5/qB542UL0bTkCdnK+x0T4AZ892WoXU5rGNEUlHuHEvW/B0nCbzN3d9xPeg3zLEbHY2yVjNTv6eGixruG+zePUyhmwOyXdSKFrWEYvcktJWyEKSHiTE1HXw8xaaAffxYzUsyopa6NoMb0Czkl6+j+7xupl5JL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnNwaU3mxnWVDCzJXjb4+LKAjvVykWDNUFahpx/UjRc=;
 b=dL6Xb+B8RLUPuf87uP4ZRCpO62Xp7ZQeauUAyUZfRv4evTUfDVc4DXMENpkT4xH/woAbFZVBb/nWFy+7ZkXSoX6h9Vp7VApHZ6jjuuGmjU7hLQmO/bdd6tKKoe+bniMzO3lKuC/MXLOYSmMOpFdOhDu4FVIga6e1XVOld70ymfjlOsSK2i0TWyWR75KtYkmEZNDS8TFBIySBDwLJA1b74QkxgBXgb9VqZjrDNW5Jbrgpm3Oqo+ERRRAfBnnc3FByCn1B0UuQ2KzGAjjgN+c2TN8lCHHbrw1+8HgpLV77bbwZP0HrIb5cmnyakABiZ9/0Hf9P/57sGbuwM7oivgfdbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnNwaU3mxnWVDCzJXjb4+LKAjvVykWDNUFahpx/UjRc=;
 b=iv0nkaTxFKEQUB2uVEZFNA44BI14fiF1+kx3N+PMudrNx3+peJ+7yNwY6Usp1p1mALNQSE98Ge9+/WAIM6ED5L5hJyPlk7F6ee8Y6FcAGN536yM4qi0HcpI4LtotGX/QtSP7ZAf2zv4ZP5Jd/zM5qusqdtf7w7tuGd8mlTBDSuM=
Received: from DM6PR05CA0064.namprd05.prod.outlook.com (2603:10b6:5:335::33)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 05:29:42 +0000
Received: from CY4PEPF0000E9CE.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::1) by DM6PR05CA0064.outlook.office365.com
 (2603:10b6:5:335::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Fri, 21 Jun 2024 05:29:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CE.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 21 Jun 2024 05:29:42 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 00:29:38 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH] drm/buddy: Add start address support to trim function
Date: Fri, 21 Jun 2024 10:59:09 +0530
Message-ID: <20240621052909.450539-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CE:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 2000076d-3978-4063-2ac4-08dc91b32750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|36860700010|82310400023|1800799021; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DdL7DXQIDB8O3QMTi/Jh6ACUMnwINjuNdE8nyPVQZF3F9JpeFZ500gPLW0IE?=
 =?us-ascii?Q?/TUkt/DodyvaXFCXKs/wya6GplOM4Bvotf8GRWxr4iH5sqv4YOJq5bzphOPV?=
 =?us-ascii?Q?toBQ1BS0Jlb4DyrA70Ujfu1htANp7NhhcTacC/RyQJhPyZGB2ESWUTmuaf4p?=
 =?us-ascii?Q?0KEV86LJBt2T+72USvnB3IThcRUz/Y57xif0eZCHxnbo0s5uZTgHcGtBSuaD?=
 =?us-ascii?Q?W6TWsc11H21+qdtl34EdPm8GaINn5pt3DfKXiff6TfEBS3u1+E1forrOVDhf?=
 =?us-ascii?Q?dtvw9HmdpiuO0RTlYz0eBARpcGu1WqBt+41lT6xTa/1Cg2cswAN1C9dhllaY?=
 =?us-ascii?Q?Orru4SK/yScQkxn1S7q0bCzYCvS8MhNEVbTK0eR8Yh4H1ov9cttRMLe0xyI+?=
 =?us-ascii?Q?Fdb5qo2HeoIshLqD0xyqBJPU5jks4PY7Ghusg2ozedQrDdClzrFqaByBMqCx?=
 =?us-ascii?Q?S8iorkYNVp+NKR9xpOtokQgtWN2RUrWEFhzF/OxxCxPO59ExjBSudAM3gOzJ?=
 =?us-ascii?Q?qaJsC7VkinNoEfkqHBqks1KfWu6eXsnwAI+dquzcugcFtV/MPNpqWmskOIHF?=
 =?us-ascii?Q?A3nCp0lb/GFa8QKPzjC5El2xn4ecvgC1jIkHi87xyCJs3KrADQe5g0NO1fu7?=
 =?us-ascii?Q?8MYyaiJ6CGB8QNHE8LNcuqEYNCT7rZRCQmCYAxbzBqAhtlVZs3P3EY1i+iQt?=
 =?us-ascii?Q?NaMvu5NW+nDeG0Qjw6f/DscuJeSPzSI0TOQFg+M9+7r58X8nLiXmF0/5oxsB?=
 =?us-ascii?Q?NscWWbkRd/UG0+yac6+NGwHnuB/vD91SmZLx1nhMuQF1R9am/IIrPDcGAbzW?=
 =?us-ascii?Q?FOF9yebWZ5Fek7LLvtZop/CD77ZrAgeFDxGaEnZ+ayetkr77VDbyv3sjU4mZ?=
 =?us-ascii?Q?luyi5Df19LARdRaAUbPg9UMSsbKXQgdCFOVBy4UOaGb8DQUq5z5OD52L0TC0?=
 =?us-ascii?Q?ERAR2ADmQGvJNwVn81Ah3VugRPiaq6BCKRGWbe5VN2caLY5hXYNqJY/iO18l?=
 =?us-ascii?Q?DZBuLRMHXWSG6aylBuSFFIETpyu41mNSu48UFjEBgygnkrqjCRfPG5MMO3OA?=
 =?us-ascii?Q?fRwRJJ4erGGP1muaoDAQpoEQiicOBjUN7jsJiot2j707dXUS5p+9bMc3JJ8v?=
 =?us-ascii?Q?ciS7HFnVf746QlqCUvd7neuynW5pit7z5fIW7VLXLA6vZHtp/lDeLLfPv+Vj?=
 =?us-ascii?Q?Ch6aWfguFNdjrSJPR5L09NuwLZuKp6/PwQJfqxGIRs4LwiqLz9feOq+8mPaW?=
 =?us-ascii?Q?E1Kvbu9zkM/qglrL+6ULb2kagLgctWZzoIbHDxkWltgwichMW22mTpgIAp1A?=
 =?us-ascii?Q?zqy0jo2ATbot3GGYdwHyCSYUDfhdppWHmt3ak14JmzKJFCiKQ0fe7eYbpA/f?=
 =?us-ascii?Q?xk+hncrSBOWdWV7bCFGBfz4HxeAFziqNRJCaMdxVsurb9apV5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(376011)(36860700010)(82310400023)(1800799021); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 05:29:42.1225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2000076d-3978-4063-2ac4-08dc91b32750
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584
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

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c          | 22 ++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
 include/drm/drm_buddy.h              |  2 ++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 6a8e45e9d0ec..287b6acb1637 100644
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
+	block_end = block_start + drm_buddy_block_size(mm, block) - 1;
+
 	if (WARN_ON(!drm_buddy_block_is_allocated(block)))
 		return -EINVAL;
 
@@ -894,6 +900,17 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	if (new_size == drm_buddy_block_size(mm, block))
 		return 0;
 
+	new_start = block_start;
+	if (start) {
+		new_start = *start;
+
+		if (new_start < block_start)
+			return -EINVAL;
+
+		if ((new_start + new_size) > block_end)
+			return -EINVAL;
+	}
+
 	list_del(&block->link);
 	mark_free(mm, block);
 	mm->avail += drm_buddy_block_size(mm, block);
@@ -904,7 +921,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
 	parent = block->parent;
 	block->parent = NULL;
 
-	new_start = drm_buddy_block_offset(block);
 	list_add(&block->tmp_link, &dfs);
 	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
 	if (err) {
@@ -1066,7 +1082,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
 	} while (1);
 
 	/* Trim the allocated block to the required size */
-	if (original_size != size) {
+	if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
+	    original_size != size) {
 		struct list_head *trim_list;
 		LIST_HEAD(temp);
 		u64 trim_size;
@@ -1083,6 +1100,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
index 2a74fa9d0ce5..9689a7c5dd36 100644
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

