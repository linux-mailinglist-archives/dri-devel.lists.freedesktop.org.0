Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FE5932A54
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 17:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A9510E3EB;
	Tue, 16 Jul 2024 15:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a7I4fRWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A564510E280;
 Tue, 16 Jul 2024 15:21:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pY4kn/Zr3PyXl5g0L4OBvEvDn66P211lpOcIXu37hcR/zh9jZ/hCh41/+h4l2L2nLC4D/qk+X9KHeBzHSuFQqpVmXVhKpmwWJpwXEMW/kNdW6stJlxDV1b4j+JYszVo164dJ5FiX5NIjM8VK/k8DJC/tYZoMUrCJxlEFPoBaeABkQDkCJs3F6h9HiRP0gZmS3v0c15uk1IEToudwWwGnOGCk4Epw6DUzcxtHiaEQOuucmMu2bJy9pIkkvz/ILoVmH9SfrMy3objnvw+CEBr+fNgux4dA1WobWOBADidGMy5KGyoL4bpvxHucs8rYOh9mPqOdxl1Yzh0XMN76qWP1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc6xlicH/fKXP6YDC9ltq4yQWp9aiMYCOTE65JjZ2Ac=;
 b=IGpO4DzI2UGOyitMStgu6xt1C/NB4lbKSqakDhFeNNFlH+UkvF3fV1Vs7Y8cu/N03SIj2EZ/4lDZowaHTmL6AEZC4kll4A4xfVKHEBhY863ZiidtAyBNAhodOoMwHy1ZFBwyTuHK5aqpjC81iN7fHpGWtbE0wjt4Jtv6ReUoqqRUiOEOZxKwwXNxHaM5UTI0lMX1f13lxbSyPgJdphfIEPTtoDJ4AMmPjXiuFwkrshNc0MH6t3GlMsyOjnhQyYp/90GBddKiJ9WuS9OaXeoErPccZsrqYRN/iRD2UhLyEUWMIWHYRolfEFrLKVa1e/qX8NR4ZANm3tAZcSuQq2wrZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mc6xlicH/fKXP6YDC9ltq4yQWp9aiMYCOTE65JjZ2Ac=;
 b=a7I4fRWE2CmW6dM/jh65ZxyTKfTYlVnjPLIKH7GPntJRMFRQGGZ7fsOaldtykDhE9jnFSvtpdSbqGJAdfFT2MjFkd135LeVojnkqE/Tt/xpaw/6AGbvc0XgKWCMKnJoQt0uOEKN7WThQN2dojj+ugky97jlB/APSkBd5naSXI6E=
Received: from DM5PR08CA0043.namprd08.prod.outlook.com (2603:10b6:4:60::32) by
 DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Tue, 16 Jul 2024 15:21:26 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::d9) by DM5PR08CA0043.outlook.office365.com
 (2603:10b6:4:60::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 16 Jul 2024 15:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 15:21:25 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 10:21:22 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, <marek.olsak@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v5 1/2] drm/buddy: Add start address support to trim function
Date: Tue, 16 Jul 2024 20:51:03 +0530
Message-ID: <20240716152104.377039-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e69ec03-bc5b-42ea-75be-08dca5aaf530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXlqSGc0eWVpa0J6U2lQTVBDdzg5M0NCNHE4LytnbGJYUGVoUWlhNUk3V0M2?=
 =?utf-8?B?NDZGV0hqUGNlTEorZm5OejMrR2pzYVVuU053dFRQVDlVdE0xVjNmODlJTmdm?=
 =?utf-8?B?bVRtWG1kcm1jUzRtcUJWcExsdVhkb1ZlTGIxTlc0ejRnZ0JrZ3JLTmFaVEo5?=
 =?utf-8?B?c0NHZUVCcFdhSlhXU1hoYjJTZSs5TmJBU1VQUk5xbFpBd3BYdGlYSmx6a1ZV?=
 =?utf-8?B?cG9YN0gvcnh6Q0pYVmRiL25Cc2dFaGFSTDRtRXcwRzMrQmFHRThqdjRBeUZY?=
 =?utf-8?B?SFBzZnJCNjJNRHBsMEt5c2hZNytSOUZ3TTFxa1k2Um9BdndlQ2U4ZGdMS3gv?=
 =?utf-8?B?YzIzUEtRNVBEMFB5ZUVLb2ZJdFoxY0dGLzNiSE92RXkvMnNhaGpEVHlEamtw?=
 =?utf-8?B?c1ZhVFRnaURsWXBVWW5VczZtM2JYNVlBM2JrZFlnY0Ntc1pxRUt2bUxFUm1q?=
 =?utf-8?B?VGdjRFE1SG0wdHlXbkJXQkk1NmxoNnNoeGRLR21nWHc5bUExVCsrc1RIb2V4?=
 =?utf-8?B?ZDB0c0ltVGVIS2dCUnQzZXhOeE9ES2JBNDZSSlVBNVE3aGEza3RBV2N5Z3NR?=
 =?utf-8?B?RmJxTS9nOFBKSmg0QlZCcVhuSnBySWwyd1JrNUtUemxIZ2VQcmwzNzE5akdW?=
 =?utf-8?B?SklJSVRzZVBybElQVmViajB4ZXhlQnNqcGhsc2JjYmhaVytNRDhRVTJZVE1W?=
 =?utf-8?B?Q2hUV2JLamJrZ09iTmQ3eVU2Q0x0SmlRaE5OK0Y0TEJGaVNtMGdXd1NzM0V6?=
 =?utf-8?B?ZGU2aWJSTmQ1MVRJL0QxTG9Nc2EyemlOaXpkMkN0TVBtVVdtV0xSQjd4YmZF?=
 =?utf-8?B?MS9kd1lZWDVURHoreXcwNDhtVVNJRXF2bjh6TXFrVjNmMVJ5Tk9FaE9lendw?=
 =?utf-8?B?WmM5RjlaQ0hubFJNQ1JNU1ZLWFZyNGt6ZWNDMWxRUWptdHB2Wm5qOTg3dCtk?=
 =?utf-8?B?K0RHbzhab012QkNHaEJiMklrYmF3cG5pOU85QzRnU2RDVFpkcHlrYTF5WUJu?=
 =?utf-8?B?TXlGcit2enFoU0Z4eW8wWG9IM2JhckQ4eURyV2crYUsyWVpXOE1LQ1BlMUtk?=
 =?utf-8?B?Y1N0OHZjUk4zRUhabTJGek4yb1Z4OVUxSWpicGRPRmV2Nis4S3FJWjVXbHBG?=
 =?utf-8?B?cFZLSTl4TFdDOXVESUFmK240Wk9aSVhwdGlldWdvdnVXdnFtQk85S09neG53?=
 =?utf-8?B?SjhUYkVyRlBSa01LMUJSZDIxbXlJZEhib1ZZLzh1NWY5V1lvQU9Xd0xSZE5F?=
 =?utf-8?B?MlhnTWgvM2ZvRk9Vcy9ZMkllNUR6SGgxcTJQOUIvS3BMYndFclJobzkrdmM3?=
 =?utf-8?B?OTQvWVBQS0U4bGp6Z2wramtPMmgrUE8wdm9heWUyNlFtWEFxSWVQaXdNMDJK?=
 =?utf-8?B?SHFKdzg1b2VlK2JBMW9EcUNFejlGcVlyRWVGRmJZZ2xNUFpCZ1FqM3Bsc2hZ?=
 =?utf-8?B?ckM1dGNzRG53ejR4cmtheitLS2hRaTFTb2RJV1pHb3JibE9xZmpMMXE2RnFI?=
 =?utf-8?B?aCs2SlJzM1pPc3YwbUhaOEpGQUtyTjZHVnhVRHpibDhUeTh3OHBqc2svcGZZ?=
 =?utf-8?B?eWRXcTdvbXNJcWJ1MEpud0hNWW1DcmpFUmF0SjB0MkI0bmMrM0phTDAyT1Bz?=
 =?utf-8?B?am5XVXhiZDdTcVRsaEN3d24xeUgxZ2pzSUFIeFAreFZvVi8wcGQ2ak16YkhM?=
 =?utf-8?B?SEFNTk5yR0ZFV3FGQXJ4SlRMZEkwTUJCaUhOejFHMFNaMDJMYUUrWTg2TjdW?=
 =?utf-8?B?WnNKN0EwdlJBRzlJODZtOE1ZTUgrdUtSeGxPcGhsb1BONzRiQ3JiUHdLWEpQ?=
 =?utf-8?B?NkFzS3RvSjEySWtiKzA4OW90eWQ3YVcrbCtLcWpCWjFtbyt0WDNMN0tYVzdi?=
 =?utf-8?B?clpHZzFtY292cXVvcG9NR2lDVTRHOHdjdDhYYjE3N2dnSU9YU0tjWGJuak50?=
 =?utf-8?Q?HMN6SMx2bZ4d0x4eZRqKQ2MuEsTbp8r+?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 15:21:25.5291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e69ec03-bc5b-42ea-75be-08dca5aaf530
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664
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
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
 include/drm/drm_buddy.h              |  2 ++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 6a8e45e9d0ec..103c185bb1c8 100644
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
 

base-commit: c58c39163a7e2c4c8885c57e4e74931c7b482e53
-- 
2.25.1

