Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357C93232C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 11:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D93910E613;
	Tue, 16 Jul 2024 09:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fUkhB/df";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0C610E610;
 Tue, 16 Jul 2024 09:44:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD/9wdYMpCP0Tsg72WYYzjRjj2z7EkG8RqoZiji6MZV3BZa1lxBZG4oN3GmMmhDYE41oyQfETBExh0k5s1r3SRBs5dy15z8MyN/LrnUHbPUWvGeNnUwWvv0XYVpo1OrtXe15t+zjEcwPqhBlmlHM9Hy9sAfIqlrH2T35LgbwMANcVAHIRGwtKAKtr5HEiuYLqTfbOXKxeVU7Fb1SwIOgYGC3fSBIyNm/46MQzUFGhrGLV5R6KDTeeW0RNOxUESZH+lI25fsPW7LXmBXCsMUpwAcK2VEVWZHxF0Rmd7pYGNN3oCKWffKFGE3uh4yMAtUYKYlrtkHwRellva+VH+WeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db8C+a3LDbWrdBvxAIYCQIlTzqgokdQ0cwtNIlDTqxY=;
 b=gKc8KE1igLqtQXhiTXLHHZl9kjKsKEO18+mdLLHuN2K/LKETe1ENSmIBd8Ka+Zvi4iV+XZetP6ngIalkvH05cCXeKi2Qi2vWRPjozCSaRfrprn9pEM5Pwpgw9XglwaofQwTW9HTkKvc0+/Zm1rlgjoR41cpC6NeRZh8Z4jtANff3/HpbjskWNuuJ1KvTKoRefxEZTYkzlTYHE7dWjWAoSK6Tep6/XMBWuNH5Yz4rn4n7bWA/CRUPJOJDZj+93Op8Bf0y0/zTE6wFqizg6ZMd9FhSo/LVIT0y+p0HKKVhUanHS4q0RidZqZRkGuS7AkFeXWAmecEPpCaCQjijMQjQtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db8C+a3LDbWrdBvxAIYCQIlTzqgokdQ0cwtNIlDTqxY=;
 b=fUkhB/dfcmY46FG5VJJCT2ffEOCgSaEKqa64zXx+SCdK6LhbQDWnYVTPu4CVCyGQvrUB/4gOrkFpkBAiYuXogWiZLjahA659Ad07ZUQ6xFTTGsLtd/RXngvsfwCfSws31OzBdSfo804CxqDON71bqL4TqS6s2Fy4s32LPyKTN2Y=
Received: from BN9PR03CA0642.namprd03.prod.outlook.com (2603:10b6:408:13b::17)
 by CH3PR12MB8188.namprd12.prod.outlook.com (2603:10b6:610:120::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25; Tue, 16 Jul
 2024 09:44:10 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:408:13b:cafe::ce) by BN9PR03CA0642.outlook.office365.com
 (2603:10b6:408:13b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30 via Frontend
 Transport; Tue, 16 Jul 2024 09:44:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 09:44:10 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 04:44:06 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, <marek.olsak@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, Frank Min <Frank.Min@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: Add address alignment support to DCC buffers
Date: Tue, 16 Jul 2024 15:13:49 +0530
Message-ID: <20240716094349.338529-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240716094349.338529-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240716094349.338529-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|CH3PR12MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: f738e0db-3c05-4785-00d8-08dca57bd7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?am5zQU1TeHNMMHZGN3NVWG5zS0E0QlRTM3owaUJzRThuMXA5aHM5bkN5L0NI?=
 =?utf-8?B?RG9RazdsK3ZMZzA0ZTdXTE1KNWJkalZVOGFrQTMyL1I5SU9CMlI2M2laTzl5?=
 =?utf-8?B?Mjc2dGh0U09vNDRla1ExT25PYUc3a2ZheUJlOCtFZEJ2ckxISlRYWXpRTnRI?=
 =?utf-8?B?TGRrck9GamV5Y3B4WHhPWjk3d09Zam9veWJ5RlY3WkFtV2FGbW5tL0tVUzdT?=
 =?utf-8?B?ZkkwMzVSN0pEK0hheVBHbHIzaFZtWHQ4OHFHMWpzRVIwZHpqQ2NpcXh6aWFn?=
 =?utf-8?B?YXNCV1A2MEIrUmM0cVo3U3JJOEpiQ3BVOFFLVThqYXJlUG5TYkZBclV0aGEx?=
 =?utf-8?B?WE5VaGZiYlF2bTFSaEk2bnVvQUEzM0lsWHFsOFJ5ZHgzemZDTGdTK2EwYXNH?=
 =?utf-8?B?WXU0Rllvb0liQi9iYmtZU2VDV1FuUkk1ZUMyQWV1Z0RXbDZ5SXQrdkxuNmhr?=
 =?utf-8?B?SnZwWjZoNWMyem0vOXVOaGdoYzNzSlVscWJjRHFXbXAvOTlzaEF0elJrWXo5?=
 =?utf-8?B?ZUJSSjVLTndZRGpyMkdLK01Lc3UxOVpPRVBEcVZvU1M2OFo2dFE3UlBwYUh2?=
 =?utf-8?B?SVQ5K1p2UnNwWkVwbEFWQWd6bUx5OU1Wb0dFNis5RG1mMHZhMlJNMVl6bjZv?=
 =?utf-8?B?Q1RKb3JWeElaL0VaVXhtSVp5b1A1VXVOWlJJcjV6dlJsUFcvQXo0WXd6UWJC?=
 =?utf-8?B?YVJTb2pJbUpmSi9UcW5sZG9wTG9kazVCOXNKWFVIa0hIY3RDWDVDWnB4VnlT?=
 =?utf-8?B?WERPVVpGb01FWnJNdGp5RDkzR3NDeFd3VjFuMk9UczUwOU5CUFREMmdKWVdG?=
 =?utf-8?B?WE5lVTF6cno5MzFtZy9PRkQrYjVWTXg3MlNNei9VdHdhekNDZVlKVWdvMVR6?=
 =?utf-8?B?RTB5MnRGTGVSU1JpZXhBTVVwUFBRYTFYWGhDZWc4dEJnY0lBdGpkUzlrV2lJ?=
 =?utf-8?B?Qnk4TzIySjZtRjk4bHUreEN3cW1CaUY4UlBMSWZIKy9mSm5wNFhtQllEOWlp?=
 =?utf-8?B?K0htYUdLN2NzTHJPK1VSZ1RTaWprTjYxbjdVOW52QkF4bisxNWcvV09BMDN0?=
 =?utf-8?B?WEliTkFjTm43QktjUVJta0haRllNeXRjMzRZeStRVko3VUgxaml3M3h6ckdM?=
 =?utf-8?B?REVNT3I2OHMxbmxXbVprSDdPcEJLbGVsSnpVWUpoblRkRWhIOEZ0VGFWT1J3?=
 =?utf-8?B?NjRIUnBySjBMMEduTjZCeitqT281d2ZOb0tNdkRkUzBYSC9XckN3czNZSFJO?=
 =?utf-8?B?aCtFU2I5blpCS0xxUzVzZGRKMHdWOFF5bGU1TlBvNXFyc0cyVFhtSHZPUmhK?=
 =?utf-8?B?NVZ2UjR0cWRLdHlzRGRFRjNTUDVjbWYyc0ZGUmwzclpKRm5XQ2JoNFFUUnBn?=
 =?utf-8?B?Z0g0ZUJwY2x0bzlibWJRYVN5THJlZTh6N21LQnJCZEltOVlEblgzbWFUU3JY?=
 =?utf-8?B?QVNPVHgzNEdnQ3FrVWpyOHJzZGR3WHhyN1JXaUFnZk9mOGhFajdhVnN4YVht?=
 =?utf-8?B?eDd4Q1NnUlRGbGk4cHFTZ2ZWR2h4SXN4YXNUaTFROGFEWVRYb3ZnNEVpMGNS?=
 =?utf-8?B?eGJ3eXpmWjRSUGk0MHRFdVM5WTVuejdYcTR2TUhEb0RoNnRnK25DNHRCNHUz?=
 =?utf-8?B?emY0WTBwK0d0RlBaYUdPNHVnOU8ralZBcy9zaitlNno2OWFGb0x6K010Y2FP?=
 =?utf-8?B?WVF1Yk54OXNvdlNCaGMxajV1WVFRNlhtR0xKNXFSY252cG1ycEZnV0V3TDEx?=
 =?utf-8?B?Y0NTa1NvL2hmczlQdTdaRm85OStxOFMrdHNmWWJqWHJQSXl6QjhXZUNyVzZ6?=
 =?utf-8?B?Rks0QVFocG5BMWNkNDFnRVFLSEM5alEwaG56RldkSmtvaHFySDVqU3EzTGtq?=
 =?utf-8?B?dWx3ZHVhZi95bkdUaXVlbnZ6VFZQUXIxMUw3Qk00SmVJQ202V2hwei9CQVdN?=
 =?utf-8?Q?ONWCY+wEygWI1yv+G6U3ve3+LlT9Kcc0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 09:44:10.2516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f738e0db-3c05-4785-00d8-08dca57bd7ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8188
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

Add address alignment support to the DCC VRAM buffers.

v2:
  - adjust size based on the max_texture_channel_caches values
    only for GFX12 DCC buffers.
  - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply change only
    for DCC buffers.
  - roundup non power of two DCC buffer adjusted size to nearest
    power of two number as the buddy allocator does not support non
    power of two alignments. This applies only to the contiguous
    DCC buffers.

v3:(Alex)
  - rewrite the max texture channel caches comparison code in an
    algorithmic way to determine the alignment size.

v4:(Alex)
  - Move the logic from amdgpu_vram_mgr_dcc_alignment() to gmc_v12_0.c
    and add a new gmc func callback for dcc alignment. If the callback
    is non-NULL, call it to get the alignment, otherwise, use the default.

v5:(Alex)
  - Set the Alignment to a default value if the callback doesn't exist.
  - Add the callback to amdgpu_gmc_funcs.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Frank Min <Frank.Min@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h      |  3 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36 ++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c       | 15 ++++++++
 3 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
index febca3130497..49dfcf112ac1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
@@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {
 				      uint64_t addr, uint64_t *flags);
 	/* get the amount of memory used by the vbios for pre-OS console */
 	unsigned int (*get_vbios_fb_size)(struct amdgpu_device *adev);
+	/* get the DCC buffer alignment */
+	u64 (*get_dcc_alignment)(struct amdgpu_device *adev);
 
 	enum amdgpu_memory_partition (*query_mem_partition_mode)(
 		struct amdgpu_device *adev);
@@ -363,6 +365,7 @@ struct amdgpu_gmc {
 	(adev)->gmc.gmc_funcs->override_vm_pte_flags			\
 		((adev), (vm), (addr), (pte_flags))
 #define amdgpu_gmc_get_vbios_fb_size(adev) (adev)->gmc.gmc_funcs->get_vbios_fb_size((adev))
+#define amdgpu_gmc_get_dcc_alignment(adev) ((adev)->gmc.gmc_funcs->get_dcc_alignment((adev)))
 
 /**
  * amdgpu_gmc_vram_full_visible - Check if full VRAM is visible through the BAR
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index f91cc149d06c..aa9dca12371c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -512,6 +512,16 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
 	remaining_size = (u64)vres->base.size;
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
+	    bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
+		u64 adjust_size;
+
+		if (adev->gmc.gmc_funcs->get_dcc_alignment) {
+			adjust_size = amdgpu_gmc_get_dcc_alignment(adev);
+			remaining_size = roundup_pow_of_two(remaining_size + adjust_size);
+			vres->flags |= DRM_BUDDY_TRIM_DISABLE;
+		}
+	}
 
 	mutex_lock(&mgr->lock);
 	while (remaining_size) {
@@ -521,8 +531,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			min_block_size = mgr->default_page_size;
 
 		size = remaining_size;
-		if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
-		    !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
+
+		if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
+		    bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC)
+			min_block_size = size;
+		else if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
+			 !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
 			min_block_size = (u64)pages_per_block << PAGE_SHIFT;
 
 		BUG_ON(min_block_size < mm->chunk_size);
@@ -553,6 +567,24 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	}
 	mutex_unlock(&mgr->lock);
 
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
+	    bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
+		struct drm_buddy_block *dcc_block;
+		u64 dcc_start, alignment;
+
+		dcc_block = amdgpu_vram_mgr_first_block(&vres->blocks);
+		dcc_start = amdgpu_vram_mgr_block_start(dcc_block);
+
+		if (adev->gmc.gmc_funcs->get_dcc_alignment) {
+			alignment = amdgpu_gmc_get_dcc_alignment(adev);
+			/* Adjust the start address for DCC buffers only */
+			dcc_start = roundup(dcc_start, alignment);
+			drm_buddy_block_trim(mm, &dcc_start,
+					     (u64)vres->base.size,
+					     &vres->blocks);
+		}
+	}
+
 	vres->base.start = 0;
 	size = max_t(u64, amdgpu_vram_mgr_blocks_size(&vres->blocks),
 		     vres->base.size);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index fd3ac483760e..4259edcdec8a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -542,6 +542,20 @@ static unsigned gmc_v12_0_get_vbios_fb_size(struct amdgpu_device *adev)
 	return 0;
 }
 
+static u64 gmc_v12_0_get_dcc_alignment(struct amdgpu_device *adev)
+{
+	u64 max_tex_channel_caches, alignment;
+
+	max_tex_channel_caches = adev->gfx.config.max_texture_channel_caches;
+	if (is_power_of_2(max_tex_channel_caches))
+		alignment = (max_tex_channel_caches / SZ_4) * max_tex_channel_caches;
+	else
+		alignment = roundup_pow_of_two(max_tex_channel_caches) *
+				max_tex_channel_caches;
+
+	return (u64)alignment * SZ_1K;
+}
+
 static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
 	.flush_gpu_tlb = gmc_v12_0_flush_gpu_tlb,
 	.flush_gpu_tlb_pasid = gmc_v12_0_flush_gpu_tlb_pasid,
@@ -551,6 +565,7 @@ static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
 	.get_vm_pde = gmc_v12_0_get_vm_pde,
 	.get_vm_pte = gmc_v12_0_get_vm_pte,
 	.get_vbios_fb_size = gmc_v12_0_get_vbios_fb_size,
+	.get_dcc_alignment = gmc_v12_0_get_dcc_alignment,
 };
 
 static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device *adev)
-- 
2.25.1

