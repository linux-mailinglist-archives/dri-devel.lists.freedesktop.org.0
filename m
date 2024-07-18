Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7193F934BB1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397A310E71E;
	Thu, 18 Jul 2024 10:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WTADr1Mo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C05710E71A;
 Thu, 18 Jul 2024 10:33:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRI14IsAOhBXKnYcjqeG+K04SuKmkuui+5tF9NhuM1LWcDcO7WLBKy5oUUoZmU28CktxV9uZsGtLStAYr1YR7+P+IGS1BZmHaOhOaBCjj9W1MC6UTpNQ/jV87vd0z3DisSKR1budCnARF6rHyA/BW+8t6e4ij4kXTut70a0xO7eT2y3tgmOSCVqiJBRvN4F/U7R0Wlrodkp0sPJEZPnTpcDB2xNubGphFLApflUREAfPKLZzC24uLDu0enm/YfwIKzz+ljYLJ4SPHwUwUvJrTFrfuX7eVN1jnzG9ZOO1xpp0tOAFGlqIEaUQ0tgIATDZQQ9hv045/bz8kDhjIgWmWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmGQnREBrqpjhoMUWsxJ9lF5y8O3G8+D6U9zDc5FJRY=;
 b=xA1LVZ8E02s/IiyEE5o2HrFvxT6oSY52ktbUbQ0MbeU9Gm4Le0pQLvuzLfK9eWnLEn0o+R3Hm+FFNhnw8+wYsj8FRhHn3uknEIcC59eH3TJA9kM3EyAmQqaDroIDCOwUrfHxnxCFlfUdYbgSw+0LzlnYZSug4iR0cyjHCivDmlIighILiHXzH5FFJjUYpWrUXKN/k8qziIMwV9Tegf+PBs/qgwoxQnwpgoZXIRIQeM4TDgONA/rsxtt15vDnFAVgoLvTMTroxdX4DfFxD8Ey2xVwFIAeELqVETgpTG3zQTkyefl/G/sSNqPJ3spvmQohzHfsEB0thmzXWzHvkB6sSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmGQnREBrqpjhoMUWsxJ9lF5y8O3G8+D6U9zDc5FJRY=;
 b=WTADr1MoVUlzurQwbyuy27g6DSDZyzQ8OOwN4Z3vmcR+JyW/+dz133lQHxY1StAyUB+1/v1YGgLP2TdU8pMuRs1qIbrGaSaN8R60sjQqH12nCj4sUkW9HiDl5aQl9tcbNQGMCGqY3QdxFxHJb7ZPg/di9uJTGW5IlnhA9EmQlzo=
Received: from SA0PR11CA0190.namprd11.prod.outlook.com (2603:10b6:806:1bc::15)
 by IA1PR12MB8335.namprd12.prod.outlook.com (2603:10b6:208:3fa::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 10:33:00 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:1bc:cafe::17) by SA0PR11CA0190.outlook.office365.com
 (2603:10b6:806:1bc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Thu, 18 Jul 2024 10:33:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 10:33:00 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 05:32:57 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, <marek.olsak@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH v6 1/2] drm/buddy: Add start address support to trim function
Date: Thu, 18 Jul 2024 16:02:42 +0530
Message-ID: <20240718103243.1241392-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|IA1PR12MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: fb82938c-be76-45c4-e47a-08dca714ff4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWJNRFhNOTYxNGt1dDZoNjVZcUgzbTBZM3Vrcyt3MWVVOGMzSkd2VFVaOVF4?=
 =?utf-8?B?cWc0cGVIaHNiOXdMVzBjMGRYazlIeU1Rbkc0Z25tZEg1QjdPZEpYcG9lM2F5?=
 =?utf-8?B?NDJiVGpWRHAzREt5NlJrOCs4cGxmYWhnSUhaY3JBTFdyT213MFdlMFRBZzB1?=
 =?utf-8?B?WlNVQ1h5cnpLdzhtNW1qZkc5RzhtUFY0bksrQkhjRXRkeUVIYmllYWZEV0pP?=
 =?utf-8?B?UHU4NFJ5Z1hucEtoM3B5ZE8yK3prK1hxY1U2eHB5b2dJb2VSUkl6RU5SVW01?=
 =?utf-8?B?RUNkL0lCRyt0Ty9BQi96RjFIV1ROZ0twYU8weWNGaVFaL05JVDkrZDVQLzlX?=
 =?utf-8?B?TklOYktSNmVjTnkxNlZqaDV1bk1mVWJaVlRGNCtqREkvcHVUa005YnNmNVJT?=
 =?utf-8?B?eitTQkZWTVUwdThxY2tiTFV6VThNZCtwRlVVOTUrL0JxYk9mcXNBK0cvMXVX?=
 =?utf-8?B?UCtzZnZzRjJnS1IxSmJ0U2RXN28vYkNMVXIrQjIxS3o3SHBaTkdvbENubExn?=
 =?utf-8?B?UGdmQjhXZlZRaUxpcDBHSmg5M2VySlpGN0pOODA0VFo2ZEVaTTMvaXY2VVgx?=
 =?utf-8?B?MStNZGVjd0RzWEI0Qnk5Tmsrb2dpTzBFblo4R1hMbUQwUGVTUHdadlFRUm95?=
 =?utf-8?B?TjVEdVhueGNnd2hwS0QzL2lZSWVraXhLdUxvbTlvTDhabmZKL2pEbFR5UmNv?=
 =?utf-8?B?M0JhY0svT0gwdXA2UTZQcnc2dVdLUmhXRU9HMXhRWHlZdmhWMXFvUk1BRGJZ?=
 =?utf-8?B?MWlwVmdFb2EwckE2MmMvQkg0MDdISHlGYjhScVhMc0d3V3o3SEFJVUt4ODZX?=
 =?utf-8?B?R21JdkJWcGF6NnpQM2lrcGl4d21ZSFRpSk8vbkxUKy9OWmRKK3JxSjc3aWF5?=
 =?utf-8?B?ZUNoSEoxYXI1RDRXRkRQMlNxOXdveDBVMVkrWHlMU3dRZUZaSHVRNlRXWC9h?=
 =?utf-8?B?V0s0VTF3TCtGUlJyY3hoM1NrSXMzdTQ0NXJvbVhlRmFaNUNUQXB1UTI4akNG?=
 =?utf-8?B?cmhlOG5uNVYwZ1NsNEl3QTFEcUlTemZHRkRHbEtCZEVYUEZ1alpxSmVReEFr?=
 =?utf-8?B?UldvVFlWNm9hdFZZVHJuQWJPUmpML0MvMUVtQzRCdlFnR2lwN3g0a3VnM0l3?=
 =?utf-8?B?VjErMWZOaWVtTlp0M3BXNjhXUlNzZFg0dk1idGorNC84WWVhQmYrakFmQVkx?=
 =?utf-8?B?akU0VnNHbHBJeTY4WUV5TGpLcVFxR0U1RFNBbERaYjFrdFIvRW1SaU51R0U2?=
 =?utf-8?B?VGJsd01JVFpZWmFPSE1URkdYN3NrM2FISEthcElwVkYxNnVZRUNLUGdLdEsr?=
 =?utf-8?B?OGRyd3Jld2lTZjlXQ0FqUUpGZHZJZ3JZeXk5SVBUVmY1QUozb2FDKzNiTVpV?=
 =?utf-8?B?bWhqUmpZZFFINXVKTWVXL3NzcHo3c28rdmVjaHdCSzBJSERRT2RhRjVYL1Zs?=
 =?utf-8?B?Tko2U0pOSTc5SUJGMDB1cE5GaHlWSFV5UHlCeHZDYmhGNlhMNUFnZXpkanRa?=
 =?utf-8?B?OTRZcUg2M0w2K0hpN3BaNEVTcnpCZmJqeWg0V0pvUUdPNHBBRFgrbzN6MVJC?=
 =?utf-8?B?NDNDZVJpT2JHOXdqcmRhdFlhaWFmK3IzaEZ6dW1aYzhseFR5TzdqWk4xblV5?=
 =?utf-8?B?RjU5aTFURHBYZTNFZXErTzU5ZFQvdkNCYXBodFhiK2VTWjdnWFdnd2ZLMngy?=
 =?utf-8?B?SkNhdTBvZ2JBdDA4eWhsRkNxOE9KTk1xYjV4ckpna2hGUkRPNFRUdUN5ODFV?=
 =?utf-8?B?M2lSb1VqSWZwY0ppWmhKRmNHODBZYnBMVEVMWWZFV1I2T2pzTDVaMjJBbXBB?=
 =?utf-8?B?bm9kNnhoOFZFUHhRMlFWWitCWFZrVnFpOUZPS1NZYnhZQW82QmRudFpyajNw?=
 =?utf-8?B?Z2xUakdBVGQzQnpvWXYreDYzR2NkKzhtU1hFdVJZbThuc0YvZzJuRzNvaG9n?=
 =?utf-8?Q?JWHZSYdKkGkMTds/8c6XhIDk0DnWQkKT?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 10:33:00.3712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb82938c-be76-45c4-e47a-08dca714ff4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8335
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
 

base-commit: 66d3fbb024886f8fbbc15fe79222f046cccd18c7
-- 
2.25.1

