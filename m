Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998E93A152
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 15:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93D810E5CE;
	Tue, 23 Jul 2024 13:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kDn+Fn5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0958810E5C5;
 Tue, 23 Jul 2024 13:25:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DetdoJ8hnN/5uSR0K86/XCjwdCcr/sf/uU/8UrbSrj1/Obyb/w1A0yM3VXCCuMSXHCt/9nq6R5m9KLuFEyJoWtF9/PEkseWKZC199O8KOxDoB7WIF7wve5hiruClsJdQgyDxv02DZl+p59JxrMxRro8ErsQDwhVdCXYThhMSsWY70H01vsju8INecxx63TvwZXoyH501bs/wjUwy4qddrrtYlMGmwhNsg3b9LJ340egd8XXBezTyZNBVViqIINq95asNuK13OOzlcmXFKdAvXbUY1TA4QYfQ2f8RuFAHoheimWsMfmAV0xG0kgDNrmYfLCnPtitcDBU+i7inQYZsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6UoF1zGqtVrNRypomsBMEF/otGkLEyqVBmoP+knsu4=;
 b=CZ/kyJaoiQPQgxPPA/mKoCyT57BBcfXRcXJa95t6iwpfAGtvvW/fwKq17sicx4m7xsCWsEb8KNFphovc3iyk1wM5R7ewWY4ygjQzXPQuQWuCpqDbPD2/uDroBwtNPTBc9mahXkZpH4OB7PrueNMUX9Qgz1nfZmRtXsOPU3txt1tCO26g5FnIy44XyyON3SDFgX5nowmxGwZe81Gh7bBY5HJZXJ14NyqVkM2bsWJiLSubsL9pLe/TVaxYlt1JUZ/Ay2+kem0IP1BozRCTDXTAHfLnLvRSzDGPrPo43NwJYExIVUjFO+F71B6iyJL1w4qVwjLJJ38BFVJ34L2cU90reQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6UoF1zGqtVrNRypomsBMEF/otGkLEyqVBmoP+knsu4=;
 b=kDn+Fn5LGAtk4hdiNnbHMurfzUdRrpdd6l0f22LukKSWwD8NWMCs3LnlmqfOcB1JQN33wUwQ53gbcr+++IdihiiVVdER8vbG2yhez0kR0nAnTUumeR+lmf0ift4t7ZJLxosQlD9HP6ZlLxQ5WFZSdQklhdTXVfxOKWAa7r+eGeU=
Received: from MW3PR05CA0010.namprd05.prod.outlook.com (2603:10b6:303:2b::15)
 by CH3PR12MB8936.namprd12.prod.outlook.com (2603:10b6:610:179::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 13:25:45 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:2b:cafe::ed) by MW3PR05CA0010.outlook.office365.com
 (2603:10b6:303:2b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Tue, 23 Jul 2024 13:25:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Tue, 23 Jul 2024 13:25:44 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 08:25:42 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, <marek.olsak@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v7 1/2] drm/buddy: Add start address support to trim function
Date: Tue, 23 Jul 2024 18:55:24 +0530
Message-ID: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|CH3PR12MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d81a51e-9ccf-4841-d7f3-08dcab1af53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGV0cCtjb0tjY2pPU2luYlRWV0MxdHVaZVRuazJBWWJ4NlFxazJRYWVwdTNt?=
 =?utf-8?B?YkJ5QnYwZGllNnJYdzlMb3lzVmxXcU1DMG5yMlNlY1hlb016MTdxMFZsc0hK?=
 =?utf-8?B?cDRlNkNBWWxCUk96N0pENVZqbDFRSlVXWGhKNWpjSURINkFuTHhndmErWHUr?=
 =?utf-8?B?V0pLMm1IbjNEUkowZGtabk5mcXVEb3Y5UzJ6Rm02S2JheUVFRWhOSGFHakla?=
 =?utf-8?B?ajZUblZzcmNKU1ZRcjE1Qi9obks1elZqQlJqbWhtWFkxNk9TajNIYXNFaUVO?=
 =?utf-8?B?d3hZaEVuOWdoVlRuNTQ5YXU4MERxRjkvTEI2TGt5YUZsN2VkYmN5U1lZU2g3?=
 =?utf-8?B?ZWtHN2xhR01QWG9rRVZYT0IzcnVNZ0ZQbGxoejU3SkR6WVR1czRETU9qcGk5?=
 =?utf-8?B?VnNtSHRmV3hkaUZaZnBselBWY0RuVlBiYWNoSWpOeW5YaFkzNXBxZk9Dbk5K?=
 =?utf-8?B?Q1E2NkROd3ovc2lPVjc3K1RKMjQzR2F6aUJ2ajZjY2VYSjZ0akF0YWNlall0?=
 =?utf-8?B?VEFJSHpvUDRtK3BvLzNERnhGMDZ1b3IrS1FycUdNNWpEaUM5T0d6TjMyUm9T?=
 =?utf-8?B?ZnlGL1VlMHE3QzB4MGdUZ05Zb2tBS1EvV0dUYW5pMW5SV2hUMFdxdHBVdjZi?=
 =?utf-8?B?LzdaNHJEMzlYdDlEMlNYUklkQ3FySXAzUFdNMFYzaG1OdlBSeXBzOElEMndX?=
 =?utf-8?B?a0p4MmRhbU1vSzQwd3NIQ2NpSmJrcGZXaVNaa2JjL3J0d2FtZHZpSnF1bU5S?=
 =?utf-8?B?b28yK2ZqaVV0ZDNwWVFuZ214aXRSZUNvdGE3ZnhSYThydE9FNmh3WS9seTBJ?=
 =?utf-8?B?SlJSQnJwSWg3TnBuN2gvVUZZa3B2TGpDaU5Wbng3WEdURjBxQ201YTBPZzNJ?=
 =?utf-8?B?UFZ4MVdBY1lkSGlRdEZqNHNzSlEvWlZXQkFJSzhQc0ZsOEpzMlNzREpxK2xz?=
 =?utf-8?B?bDd2WHp1WWhDMVNDVFAzOWtWbHIvRkhsSmdhdWNabzVqaTVaM05rc1MxWDdi?=
 =?utf-8?B?ZmZEMVZxd2VQdVdEVDI0SDZFM29FSnJHRjJDVlpJeXlpWWF6RWhzbGRmZ0w4?=
 =?utf-8?B?Sy9PNFVkV0lOeGxwSXRGa2NiK0lHWm56anhLUHdzS0RSemZVMkRoSjlpbSsv?=
 =?utf-8?B?VzBjUk5JV2VTejJ5T0RTakc5a09iWS9LeFgrTXJpV3lsRVhvSGMyclZMYUxq?=
 =?utf-8?B?Vk5LdkxSRmRpMjFrWmpPZy9Hc003dUx4VzVyemlnM1RsS1VTZGorOXAyUFpo?=
 =?utf-8?B?YVN2TnFqRUNwY2lrTFVYZTNXMjBhYVRhKzBFRHJycE1sU3RxQUVoaFllQ2Vi?=
 =?utf-8?B?OHBGOVJvZWNyWXYxaHVhUEg2V25CdlZmUkF3ZkhvUjY1ZzBWZW4rZUluV2la?=
 =?utf-8?B?d2dLUDVKZW5pRW05STh3SXlCWlE4UGZtMHl6a0NvRldsajBsS1dqdFJhWTcx?=
 =?utf-8?B?YkRCMG81d1ZQdnZBUWZnSENTK3JxTW1qb1cxN1dxMTB1TzVDUzRINmJJNjUy?=
 =?utf-8?B?MGNoYXdxRXIxa2lsYU92NjY4KzNhR01BbnovUnhUWUZ2NmtWdTBUbm9pWGdU?=
 =?utf-8?B?SGgzajNrRnJZM0pTR25pWjB3cUhOVytHYjhmMjI4NGpWM0k5aUMwNlBGMGI2?=
 =?utf-8?B?dUxxcVJxOG82ZzNaaUZUNzlwZE9GZVBrbTM0QjlXSml3Q0FyMkhNY2hyeFY1?=
 =?utf-8?B?Q0luOHZNSGN2MVJ1Q3cvcnh0OFFHbGNJLzExcnMrVHFwWlZLS1VVVDIzdStx?=
 =?utf-8?B?OWhzZk56cmlnYmJJNEc1Z2pUN2pzRkk3Rjk3THhiNXZsTmJjRWlGb1owMWxt?=
 =?utf-8?B?VE1Kb0k1cWVMVzRJWmxBYTlveHF3UDUyZHJ4eFlkYkVvN0N0aHgrM1NZYUV5?=
 =?utf-8?B?MTlVSGpWVlRmc0tSa1orcDROLzExNkhFaVBuRHhnYnhrbVVRSHBxVzUwSmMy?=
 =?utf-8?Q?vAbC8QuG9JduowyKaR6mRHsqRjFJB74J?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:25:44.8860 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d81a51e-9ccf-4841-d7f3-08dcab1af53c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8936
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
 

base-commit: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b
-- 
2.25.1

