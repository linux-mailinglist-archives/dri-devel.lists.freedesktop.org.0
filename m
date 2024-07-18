Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52D4934BB4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7765A10E723;
	Thu, 18 Jul 2024 10:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iVRkA4cQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43FE10E722;
 Thu, 18 Jul 2024 10:33:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdUMiu9PjdBnI0fBt+KeHOar3i5+rkkf1RYK1kr+JbJCqiHjtDs9IA6So0sBdWA0D5l20hfRSwtGPhdNk6QwPpUk9rTXCE+rAdPQVc4XfTabwprMl0q2lMlYWTpte+UODVXBHGH3i/t1oMqngvkytPCqd9Wv9KdTRhjG09os88A3zwDZyeNBMBwSYolQYt86UHmEwVARPF6mqZ4bX6HKCMW6w7LLUgIeN+Z8fL/XoRHvWKNj4JwSdjo6iQcj1I7NcUMx1d0rvq5Y/OvgMEOPyR2NKyfBBF/p9e20ByOuTpmHlHiy02WzQTliB0LeBSSNJ3zK10NveqvKTH5yRk0Lgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxrkv1Z2ayVOvAiUIfUH/SV2E19wNBQRuLKDOU3TAGQ=;
 b=wrwBWk/9+niRFC2URMLOwJcVOaPtqiCFs93A163TnnFlAgbkfoQrUYIjsaKUdneuvPVKn5nIP8fhDL4f/qjrx2LHWUROzuerf05Z1MsUNqH0aSZldKBdAizdCqu/OWuPi3nb33J11sKRSNVqqSmseDCVwZunmM4w7KA5gIEfBEI4lv64S6MxYi5axoazENWk6fUfjWZvav4dVVhvA1KPzIUgSxPMWMzGb7O2pjnoLCXLe2jOe1oAP0l2mNKxWhl+QYH77UKfqUfIg9q9ps71LzB/SJKIirJmM7YG5ErJPY61s99e3aLfpYGM/EK9LiDlSCmBOvaUbSiqzmZsvT+7LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxrkv1Z2ayVOvAiUIfUH/SV2E19wNBQRuLKDOU3TAGQ=;
 b=iVRkA4cQzQSFMeO/zYz/g0Um+0z7hyRHk3EUTqxsKgvLlrwbeOeOhWcQLWj7rKsW4gSyqGQvBhpig4FCdEqbxTlCdXTa49GQRSUkbNtNYlOFGZjSOttQ9jwuoezh9DUgZJCoAl8m4D1jdRROWBcCvFpYQ/snL0hw8m6pCfLIUr4=
Received: from SA1P222CA0045.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::22)
 by PH7PR12MB7794.namprd12.prod.outlook.com (2603:10b6:510:276::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.35; Thu, 18 Jul
 2024 10:33:03 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:2d0:cafe::46) by SA1P222CA0045.outlook.office365.com
 (2603:10b6:806:2d0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Thu, 18 Jul 2024 10:33:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 10:33:03 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 05:33:00 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, <marek.olsak@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, Frank Min <Frank.Min@amd.com>
Subject: [PATCH v6 2/2] drm/amdgpu: Add address alignment support to DCC
 buffers
Date: Thu, 18 Jul 2024 16:02:43 +0530
Message-ID: <20240718103243.1241392-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718103243.1241392-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240718103243.1241392-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|PH7PR12MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 638cb41a-4dd1-4d26-c00d-08dca7150127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEpmQm1RK0J5WWM2MUdoRHZ2a1dHcVd4Z2pWeU5qNlorNXg3MVFVTWlhelJL?=
 =?utf-8?B?MVpILzZhMXhuZk44THNmZlJGNlN1bHlVY2FPNHJFU1VyZVpXTVVybWpoSGlJ?=
 =?utf-8?B?RnBUaUZWMjM1dlZ0V2dWdGJRdEJIWEJlbStXaWM5dzJwaTJ3OW1xK0x4QlhX?=
 =?utf-8?B?bWxEWVBodHNoTFMvQ3JBejQ4Q1orYUViZC9XZ0RtYWZtWEUyYkRtMjNGNENT?=
 =?utf-8?B?eVpzQ1FPS1F4UmdJL3lBY0ZQMUlUU1hvWlJsdnN1Vm5oeCtaTURUMEtHbHNX?=
 =?utf-8?B?RWhOZU9hZmRnaU1UT0wrcGRUQXlPcUR5K3VvUi92c0JYUS9mTmVuTUhnSHNO?=
 =?utf-8?B?ZWg4VjBiWStJVjhrN3dCOWVzQzhWRlgwRXB5Y2x1anJaWGlNamFBSHVYNTdp?=
 =?utf-8?B?Ri9XNmFqZnNreDdiZUZWR0xOcU1qRnk2bzUvZXl3bE1FWm52cDVVR0tMeWw1?=
 =?utf-8?B?WVNZYVNhR3FrNDNnL1ZwSUVsQm4wLzk4Y1JkcHF0b3pUdHhaeUdKTDV0VWJ3?=
 =?utf-8?B?V0w0N2k4eDBDUGo5eGxQWjRxanV4SUxCSUFRVlRNZlJUcEhmcXpUYVJTOEx2?=
 =?utf-8?B?bU5qWWo0eGVCQXN3SGlhUHlXVEs1bXRGdXpDeGdUeXA5NDZvUGlhZFBQY0tr?=
 =?utf-8?B?a2syMld6bWh5VWZaamFKdUtHb3hvOXlCbk1uNHkwSWFKSmZJbXdSckhzcURH?=
 =?utf-8?B?dGFRWkxVSzRhdkRaOFFieTNnZVZjcWdqcXRiTlJFZXZyWXZLbWRJVUp3SmR0?=
 =?utf-8?B?VDRqTm9RQWs1alROWGIxUnBPQjFFaFRVaE4zUjgzelRidy9lZkR6Nm9KaUpw?=
 =?utf-8?B?Y0dlalNwNytnZytjd0poSURtcGtLaXpNMm1GK1ZpTEdVa0NFVm5LRWRjbHVx?=
 =?utf-8?B?WHRhRXJiY0pXNVA0V2owT1ZJYjBCRGRTRnMwd0w3ejQzZC9zK1Z5Slp2Qzht?=
 =?utf-8?B?RUhSam8xUWg5K3hZTGRnS1dmdnExQ0l4UVZuM0JkUjhSVGdnODRETEhwd3N6?=
 =?utf-8?B?dGpKOENhcWNZVzAyeUYxNjdqYjI3NllESmZmN0xncngzWjhmSThSVHRQMUla?=
 =?utf-8?B?dDlWcm8wbW5KdjB3ai93cEZzQlM4UW1Eck9XQ1NzTXd0aWkxdFJaL1BmL3pt?=
 =?utf-8?B?SW1iMUJRVXZlcmJBbzc2dGxOMHU1dkdhNzhmM0FQdTV5ZU1HdnFJdlkrSjlo?=
 =?utf-8?B?NmhubEV2WmZML201MytBVWtHNXdXbzdncjV6dTBIME9ocE4rOHFqazRkNEU2?=
 =?utf-8?B?YTZ6K0lRTUx5NGdtbVhlWjU4cU5QQlNRTFFRN05pc0VHckhaT2thL1hndTFB?=
 =?utf-8?B?L1l6L056bE9QKzdUTmlNSWk0c0FtUEQyVGo1Vm1rekVTQllLeGNJdnNvMlJO?=
 =?utf-8?B?b3FPVEFRYlVvaUgyWmpwbHdaUDI5TWRGZFRLUlJQZlV6VzI4TkVaOFZtOW5M?=
 =?utf-8?B?aDhzbjJxekV2aVp5ZU1JZGQrbThKSFpIbTd0NHFEeXg1SHNmbUxQV0I0OW1l?=
 =?utf-8?B?OVZ5c1ZpeThiNk0wMGc1ajVJQ1MwYjFLUTdaelFncmJEMXBGNVBORWZIUEd3?=
 =?utf-8?B?VGo4b29qS1ZQaDdQQ1Z2MGcvNDJoSm92VG03ZFNlWlg1WDJsYk1ucGtUTXpP?=
 =?utf-8?B?dFppWWk0d3VYMHh4Qm1qRW40RnNhcWFiT2ZTUHVoWDR3SFFGSW1ReFpTT1Jr?=
 =?utf-8?B?aG9nQzZmNTQxOFkxTER5V0tLQmZ0Y3hOeDNlaWlZM2lqc1EwYkhjd0F5bWVR?=
 =?utf-8?B?QnZGVmtSeVhEK3VHWjRqNHkvaklXcENDak5Bd0NQWlcxSnMxM2pOa2xyTWFK?=
 =?utf-8?B?cVdZR3R4ZTljaFp4dHFsWkJOejRCVnRKNnBCNlhERDZOL0ZkMVc2eHFGVnJN?=
 =?utf-8?B?VnZCV1IvNEhWM1ZNN3BMdVZxcnJoU1c3Y1N4MzhJNkFsREJqVFllb1owNDF1?=
 =?utf-8?Q?I7PpX2Lbos8DN7gT+TEEEhfZEM33FubC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 10:33:03.4520 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 638cb41a-4dd1-4d26-c00d-08dca7150127
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7794
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

v6:
  - Fix checkpatch warning reported by Intel CI.

v7:(Christian)
  - remove the AMDGPU_GEM_CREATE_GFX12_DCC flag and keep a flag that
    checks the BO pinning and for a specific hw generation.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Frank Min <Frank.Min@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h      |  6 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 39 +++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c       | 15 ++++++++
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
index febca3130497..654d0548a3f8 100644
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
@@ -363,6 +365,10 @@ struct amdgpu_gmc {
 	(adev)->gmc.gmc_funcs->override_vm_pte_flags			\
 		((adev), (vm), (addr), (pte_flags))
 #define amdgpu_gmc_get_vbios_fb_size(adev) (adev)->gmc.gmc_funcs->get_vbios_fb_size((adev))
+#define amdgpu_gmc_get_dcc_alignment(_adev) ({			\
+	typeof(_adev) (adev) = (_adev);				\
+	((adev)->gmc.gmc_funcs->get_dcc_alignment((adev)));	\
+})
 
 /**
  * amdgpu_gmc_vram_full_visible - Check if full VRAM is visible through the BAR
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index f91cc149d06c..ace9d61fc512 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -512,6 +512,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
 	remaining_size = (u64)vres->base.size;
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
+	    (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 0) ||
+	     amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 1))) {
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
@@ -521,8 +532,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			min_block_size = mgr->default_page_size;
 
 		size = remaining_size;
-		if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
-		    !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
+
+		if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
+		    (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 0) ||
+		     amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 1)))
+			min_block_size = size;
+		else if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
+			 !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
 			min_block_size = (u64)pages_per_block << PAGE_SHIFT;
 
 		BUG_ON(min_block_size < mm->chunk_size);
@@ -553,6 +569,25 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	}
 	mutex_unlock(&mgr->lock);
 
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
+	    (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 0) ||
+	     amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 1))) {
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

