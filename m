Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15FB932A58
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 17:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C8710E777;
	Tue, 16 Jul 2024 15:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="izJ86EH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783DC10E280;
 Tue, 16 Jul 2024 15:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGvVxw1DxrbOPEl2v/SIk9bL5coIyTnlX0DSFS9hXPdH2JRRmyVtgCRxi2YT+kIW63Herw0Fsmin1Uh4He0pgaz4CIKVwVhnF9wyYU/ffpRGMg9UTeSrqY1QTQ8UMXn4a0bnqrKZw+4GANWNxYDJuubF13W1Gzk3ZNVbNbeWN287YPaysImr/+rpLBm7l1PXTMb90MgOx5IcefIAv7+MJuMi1hCp7DOfGxAXmKitJWK2D8wLWDGNlI85XkpzNjvoFYX2hkesVXFrkNucLuGRhii7xifQJa3X3Nm9BWVHI1G5TSyexKYXD/7E0uH9+XLQud/sULgNWQhnqXaWhLNxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut0Dko02D83RTYpuKPJPagtDEkvfn5cjYeeia0jlbhU=;
 b=iqcYamnUq0SZQeuMWPW2OFOowGbi9HjAMrWcol5r8R4WyXrKNtjNLn25RiIhrbeu4hr01vyuPXTFN62IaQowTagyNz6OYgYBPM+60f3FgfKJR/7vzIUGvHLVXH8SZTGbtututh9jQztApKqMAh1766Rto47l1QAktE6el8z7NM8TkLEc+lFiWL6kMbO8brAkBSBQHDz9+pEMK2addTtjPL0Jg4MkvQSu/KqIr9Bxl7aLWhD8FWDuF4DEV//fS47JKwwqT6mEer/QxOqDhwSYho4XXYAokhgRqrRprOs7/Z+pk2tPjTo2Y5ALHnuUHqvdw2EWiFwnkIE2rmzM9qsxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut0Dko02D83RTYpuKPJPagtDEkvfn5cjYeeia0jlbhU=;
 b=izJ86EH6oQsxoJ/irkQOVkAID51VcnMnScbuwYnXndQCpnQHWDUKkutC5oJr6WZNpIrOw2YzdKoIDOLVZjBsiNAn+0vedTX0oerRImQjpwlr+lloSUvNaRSb1unsQMkS+nmK+ZSvQKPqFSa0sgh77Yvong2O9XYsraT41KGlzp8=
Received: from DS7PR03CA0178.namprd03.prod.outlook.com (2603:10b6:5:3b2::33)
 by DM3PR12MB9285.namprd12.prod.outlook.com (2603:10b6:0:49::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Tue, 16 Jul 2024 15:21:29 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::f1) by DS7PR03CA0178.outlook.office365.com
 (2603:10b6:5:3b2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Tue, 16 Jul 2024 15:21:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Tue, 16 Jul 2024 15:21:28 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 10:21:25 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, <marek.olsak@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, Frank Min <Frank.Min@amd.com>
Subject: [PATCH v5 2/2] drm/amdgpu: Add address alignment support to DCC
 buffers
Date: Tue, 16 Jul 2024 20:51:04 +0530
Message-ID: <20240716152104.377039-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240716152104.377039-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240716152104.377039-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DM3PR12MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: d3eeb249-237f-4446-4195-08dca5aaf70b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1EwNS81MXlQbW5qZGVYNVJJM1ZIZkcvRnkvSzBHTUYyVFRZVG1Ma0dpcUNa?=
 =?utf-8?B?NXJEdGpZam9haVZ1bUtYeWJ6TkJwWXI4dEs4eTd6VGIxNHR2ZjVWQzRiTys4?=
 =?utf-8?B?c1F4OUFwelA0NVpNKzRBa0RxTVp6Wk1XR2ZJV2U2VSsyRVNOTUREZ2ZXTUY2?=
 =?utf-8?B?SzNKVlg3ckJyZFNOWmlFY2VRaEJzNDg5NlJRdXRwQXFKd0MrejY5eWVDbC9W?=
 =?utf-8?B?eHdYcTJOblc4c1Nicm1NYzVVRU9KYlNzOVpvMXRVblE1b0VYNkpKcmVpOXJl?=
 =?utf-8?B?MWlYdlpobmM4N1R5anlqZ2dYZU1QcjR3TmRwSzRxNHMxRnRuTWk1aEwzOTJu?=
 =?utf-8?B?djNjOHAzRzQ0cGhFZTM1d0diNXJzK2lYckxXeGJJL09kRGhYR1poQjlnVmp5?=
 =?utf-8?B?c2NCZ0s0UmtKZVVtM0lCM0hoSldCTXpONm1mREpUTmsrbUdTYS9VV0RLRlpV?=
 =?utf-8?B?bjhib0pIVk43VUgzdmUvbFlaV1NFSkpzNlYzQmZJVnVFa1ZTOVNnd0J1NW40?=
 =?utf-8?B?NFdDVEE0dHlLdVlLM0t1SklpUDlBRkVrd3VCcmtIMlR6Vkh5aWsxVnZ4Q2Jn?=
 =?utf-8?B?cGpoRWw4YTRFNkdQeUludDhpdStNQkFZc3BBS0NqcDdjbHd5NlVkamJzMUZ3?=
 =?utf-8?B?M2Jkd0xhdXBBeXAxSlBTNzQyemkrbm4zTHFiclM2Y25RcmUrbUZBY1pTTXJR?=
 =?utf-8?B?SGlJWkRrNklkdUtLTGI2ZVA2eDdobVp2ajRORXUvejAvNVdIekFiTG50dHpz?=
 =?utf-8?B?MGorVmpjaGVNNko5emZTN2dGdHdXeTl3V3BUeGd0Z1Zkamg3VWpxRzNYL0pO?=
 =?utf-8?B?SGd5a0tZclNIODhnVnFDblJMaE5CRkxYbWM5NEFmKzF3OEZwaFNSaGpXK0wz?=
 =?utf-8?B?aXEvQTBFeHR0VFlTYTJSQlI1Tjh0bXpIOUg3a2RYUHdybGZ2djViVEpvcExJ?=
 =?utf-8?B?WFc4WTN4R0tnRlVOUE4rY1ZjZzVzRGhDeGFITWNiaUN0QlJYRkI2L3d4SlhB?=
 =?utf-8?B?SkppWDFwNStLVFVaZjg5M0g1eVU4Z3l0U1pqalZCTmg0UHlmQmJJY2pTOGp3?=
 =?utf-8?B?RWsrRmtFMzY0UFFNUXNvMXIzZG1xdjJXVEV3ZERzRFhvWTBiKzA0L0Q3Unc5?=
 =?utf-8?B?S3A5L0FweWV3RzBLNXdXeE02UUZoUFdMVC9VRHdkaFIzQ0lLT29ZQzJZUjFF?=
 =?utf-8?B?WWpheERCYmZPNjZldGxPdTNLVjB2WWtUS09UUmJvM3c3Mm1lUStQMzl1bHR4?=
 =?utf-8?B?aXVEd1pZSUlqQzdqcW1PVjRtaStzdmtIT1lmblIwZG9Hbis3bEd2Q3FJUmFm?=
 =?utf-8?B?OEhGYUJDZzhRbm1pODRSMllHUWhYUDhZSmlMdGZyeitmNml2TXpsdVZRU2xm?=
 =?utf-8?B?eXlodjQ3YU5ZMWZNdzVIdnRNb08zOW12Y1hFeXptR0UvRmh1aFJFSkdYVy9Z?=
 =?utf-8?B?VWtkZkRPbHJvYklOVHNuYTR2bktPQXRNWEcxZ0JLS0JwWVdPa1VycnBNTTV1?=
 =?utf-8?B?SmNLOGJvL2lTeVlpckRrdEtXTVNKUW9zK2Y1N2Y3RE5EMStmeFM0NDFJM1gy?=
 =?utf-8?B?SWphbzZJNmJMN1BHOXc5UjdOeVp3dXAwUGdlYTlZV3NxYlVEZnZaZjFIRjZu?=
 =?utf-8?B?cTVFZzBlZzd1UnprRm1ucDhRRkJ0Q05pMjlDcEphRXp1cEtNSW5TM2lNNWx5?=
 =?utf-8?B?UDBoY01SVzhMVHZWalIxTHg3SEd6MkZ1dVlhWVg5Q015V3FuaElaV0RkZ1c4?=
 =?utf-8?B?Z0lhdlZ0OWp0dlhKY2RYb1lVSERpdjRQOGZxanFBVDdlMkdoeHBIR3FYRWU1?=
 =?utf-8?B?TGNWMThETWpMWTFYRkFNUTc2aU1tUDZNY0tGM2RrbU1sVXhkcWx4N3puaDl3?=
 =?utf-8?B?U1hwM1BPNHA3WGIrRis0SXJrMXFrd3ozUW41RVlFekNsZmszdFRpTnFGbjFr?=
 =?utf-8?Q?Ow/eAv47BO28fdCzDjJ5+6TlaDqIdSOe?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 15:21:28.6407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3eeb249-237f-4446-4195-08dca5aaf70b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9285
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
  - Fix checkpatch error reported by Intel CI.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Frank Min <Frank.Min@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h      |  6 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36 ++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c       | 15 ++++++++
 3 files changed, 55 insertions(+), 2 deletions(-)

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

