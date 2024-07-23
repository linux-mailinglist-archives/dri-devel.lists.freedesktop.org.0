Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7176893A150
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 15:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B9E10E5C7;
	Tue, 23 Jul 2024 13:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o8z8NEwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8C910E5C6;
 Tue, 23 Jul 2024 13:25:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNWr0v0e7262PsPIzi6w33gnJxU8TRIwZvgKTmJg2hHp2Fyay5vP0Pb5kDuYi2iTEyhBkdk2hs/L5QUhI43PyBTCed9tOfaQBFx8fYuWxuWA+KuCmHhnI02skD5RNxnz1w/y60tRiuddR7F7SvYRqyjcyxuvUb6JjOSDlmaHbZ+ahRet0SuTBm9PB11kkOkF1KtqwWYQhbD8nPN6Jo9BtmU+6wHycymsapDTxol0VYXez8Qr38netbauzH4RgXO0ES6rYlu3pqukyyxAg3oHgY8UU/DqwEJRqz08TktKYdrS4WsVwwlz9InmUNAQbfMLF7edjpKWkMcPNiVQl3YYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZCEu7Vf195YsZG39RAsGzWEbwU7TQLeZ6GI9mRDxgU=;
 b=AV5V+Hkr6nJ9QfujLQbhOP7EU4wETc3su39mrUx+j4ON0t2X4GY/sWa3BJdRjW9LOGLssIJzC94K0Pl4TixFgHgSQQnu63kP/TXwV/wCRW8uLa1lHU71uVka1FJnDeu6I1Z68LfHd2YD/2IxUqxxa/W8tkOkAOKKIgEr1LUHPETbDIpP94uBK5SMvwODcOyGwrFCFF1kP5SltKFc6WuZEkjwXxZdP5nJFfpMUkDXVMVmpfu8AcqRs87RXpvUHjr2NCa/dw2MHCJxhoj6LhTNRbSDdoIhEYpOkIEnUJqxiCkhEEF7c1rR9gwJapjK6Pb97fRDGBX40545YwD3hY0tjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZCEu7Vf195YsZG39RAsGzWEbwU7TQLeZ6GI9mRDxgU=;
 b=o8z8NEwhBJY5WhO02vFhbkW7s4CNXB6yj6Ij4nzaJUMhrh1NYw0xlubmC/Alljb5j1U3x7OLDMrdbx4DIRl2UxpVdSd3CU7l9AuBCE0FPJ1LZsjQf9Xe3sNsVX3Jxa8mXsvDUKIm5+3rMSLvXhcZciPsWm8aShHTLIbLpJ3KeKM=
Received: from MW3PR06CA0015.namprd06.prod.outlook.com (2603:10b6:303:2a::20)
 by SN7PR12MB7251.namprd12.prod.outlook.com (2603:10b6:806:2ab::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.35; Tue, 23 Jul
 2024 13:25:48 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:2a:cafe::b1) by MW3PR06CA0015.outlook.office365.com
 (2603:10b6:303:2a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Tue, 23 Jul 2024 13:25:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Tue, 23 Jul 2024 13:25:48 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 08:25:44 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, <marek.olsak@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>, Frank Min <Frank.Min@amd.com>
Subject: [PATCH v7 2/2] drm/amdgpu: Add address alignment support to DCC
 buffers
Date: Tue, 23 Jul 2024 18:55:25 +0530
Message-ID: <20240723132525.31294-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|SN7PR12MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: dde841cc-163e-46cc-4ab1-08dcab1af73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEtMbUdUNnM1ek1wbGgwcTBic0tKcDY4VUE4MGswbU5vdmQ4UjkvSzRaZ1Nz?=
 =?utf-8?B?aEs0UlFsVHpNNitGUG1YMjhaV3J0L29XLzd2NmdMbU9rUnBEQnN6OFViM3lK?=
 =?utf-8?B?M2xLdmFSOEdVZFY2YVlCcEdsNmpETmovbVkxdFdEL0llanoyTWE3anlaNHpG?=
 =?utf-8?B?MmJqQW5yWmFQTkpYeUdxdTF2eGI5SzRUVFI3WVhvMVhZYkg3ZHM0emhuMkpM?=
 =?utf-8?B?NTV1Vnl0VFdvQWl2RDlwK2FVYndtNGVOampwcnpoYzU1ZStIbXAwb1FFVGQy?=
 =?utf-8?B?alFFSmoyOFBJcnNDdmhXWHVGczZ1eWhXcVBjUEUzckNYeUlFMzVidkdENWp2?=
 =?utf-8?B?VDRRMXZMNVZoTFZKTEUyaGJRS291WlZsRFJycWdZdUFWajJxN2JJcFRwbmV4?=
 =?utf-8?B?UDFqckU1SUFSYmJOUi9xZlc5Wk1LcFZ0WkJCY3BOR3VzL3BkYVZ3SVRvRldj?=
 =?utf-8?B?R1RCZk5PU3l4Sk5WQVZZcWVrYURLZzBTVHYvdXVmUlNsS1ROWGFUM0xWK1R6?=
 =?utf-8?B?N1Q4bmUvOEFZWDNRU0dtb2VFZWphM1FXcTBEaUNWb3FPeXZTdlBGSUYwWUo4?=
 =?utf-8?B?Mlk1cHp1QXoxWDBXVnRmWVpqcGptVjJyVmJzQ1BZcWRwaFRBbS9idFFoTndZ?=
 =?utf-8?B?dUlyR2xHcHlpYkM3VFZWY243UEZmTFRTLyt4U3k4bzkyZzRiNERzWkwwMm1q?=
 =?utf-8?B?UkljZWtwVTBXOXhsWHpPQ3dvVXNRaDd0K3hDcGtJMDhGMDlnRVp0MG45OHdK?=
 =?utf-8?B?MzNPME81RWNIeG0wQ1lHdCtTcFVaaDNneUpDYWovQ1M1YWRQNThodjZKSVRp?=
 =?utf-8?B?ZnNISWduNnNYWUhmMjV2OUFGbWZ3eWQ2TlJSRDJGZy9tWDB0ZTJvZkNVdkY5?=
 =?utf-8?B?WjUwNTIyNjdqTmEvazQxVWxXbTQ3T0ZNV3hRK2ZXVitZUmxPMTJjTkV6WEkw?=
 =?utf-8?B?WGk0UlgyWmp4NVpPM0R6WkI3ajlja284RXdMWDBnZDV5Skg1RG9xYlBDdnRl?=
 =?utf-8?B?Zk41Y2ZYTER5OHN5MnArbWJVTzM2T2JwVUZydDZXSGFYTmpFUkh3TWlRZWVK?=
 =?utf-8?B?ckpaZFp0dTUwbSsxNG92aUdtYnNtUE5lNm9rZ2Y0K29GQ2ZkZmNKSlBTWndy?=
 =?utf-8?B?eTFKdjVJWnN3S2JWNXozeEdYdWhlK0VTTC9reGV5SEVlZGVxRGxieFlnWG9n?=
 =?utf-8?B?Qkd0a0ROZXhGdjJCdEx1cFRibDBrUE10MzJDZE93TEJ2QXhRMHQ2UEt6MnFV?=
 =?utf-8?B?LzZIa2dOcnVjZFNMYlFCcWI2ZEptWW9HbGsrc1pNU29DbXR4eWFmazJXcStN?=
 =?utf-8?B?OEFvdlJCREl1cnl2T3AxcEl1a2lYS3MrMG9KcG5ZSXlZeVhQMEpKQUczSFdY?=
 =?utf-8?B?ZndSR0V0N1NRdDJWWWdDSHEzU01wY3c2QmZVRi8zQUZzZVNMTi9KZEZHUkVT?=
 =?utf-8?B?NGFLS0Zxd2M2R0pLWS9YVGdYWTFTT0RYZHByM2VHSHA0ZVkyYjNYV05RNi9w?=
 =?utf-8?B?WVI5NS80TUQvR2JmMjZXZ05BYzVhUG4rMmxJVUVuZlVLbDZRR2hZaVlGSDJ4?=
 =?utf-8?B?dW44aHYwNmpsckhKUDB6RmxuRUxwVW9ZRXhnNEg2b3NETjBVUFE4UnFRVGtE?=
 =?utf-8?B?L3V6Qjd6akhzbkkyakJ4V20vZmFXVm9PS1VHVlYyQlEvdmpzbW1VRG5Ub1VB?=
 =?utf-8?B?YXdSL05KZFJDM3lYeThLRXlEM3c3b0VjYmJERHl5WGdVbkVJeWNzRUNNZHFh?=
 =?utf-8?B?WXFpaG9ycEYrSHJoNkV1d3JUUWRhSDVqQVppRlFFdVpyajRXcHMwMGRML2Zr?=
 =?utf-8?B?d3ZqS200ME9rWUpmUXdIVEtuamw5bFlEL1c1QVVVb0E4SW16ekNTQWtzc0lU?=
 =?utf-8?B?endLVmF3ME1iUHJnQnlFRm4zaDVleEhNbXdxRDZDNUhsTnJtT0tDZUVRYlFY?=
 =?utf-8?Q?Se7Apq1W4q+CNzFsBkwjqp6jyGzutoDH?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:25:48.3381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dde841cc-163e-46cc-4ab1-08dcab1af73d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7251
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

v8:(Christian)
  - move this check into gmc_v12_0_get_dcc_alignment.

Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Frank Min <Frank.Min@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h      |  6 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 29 ++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c       | 19 +++++++++++++
 3 files changed, 51 insertions(+), 3 deletions(-)

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
index f91cc149d06c..c6609f4ac3d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -450,12 +450,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_resource **res)
 {
+	u64 size, remaining_size, lpfn, fpfn, adjust_dcc_size = 0;
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
 	struct amdgpu_bo *bo = ttm_to_amdgpu_bo(tbo);
 	u64 vis_usage = 0, max_bytes, min_block_size;
 	struct amdgpu_vram_mgr_resource *vres;
-	u64 size, remaining_size, lpfn, fpfn;
 	struct drm_buddy *mm = &mgr->mm;
 	struct drm_buddy_block *block;
 	unsigned long pages_per_block;
@@ -511,7 +511,14 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 		/* Allocate blocks in desired range */
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
+	if (adev->gmc.gmc_funcs->get_dcc_alignment)
+		adjust_dcc_size = amdgpu_gmc_get_dcc_alignment(adev);
+
 	remaining_size = (u64)vres->base.size;
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS && adjust_dcc_size) {
+		remaining_size = roundup_pow_of_two(remaining_size + adjust_dcc_size);
+		vres->flags |= DRM_BUDDY_TRIM_DISABLE;
+	}
 
 	mutex_lock(&mgr->lock);
 	while (remaining_size) {
@@ -521,8 +528,11 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 			min_block_size = mgr->default_page_size;
 
 		size = remaining_size;
-		if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
-		    !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
+
+		if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS && adjust_dcc_size)
+			min_block_size = size;
+		else if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
+			 !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
 			min_block_size = (u64)pages_per_block << PAGE_SHIFT;
 
 		BUG_ON(min_block_size < mm->chunk_size);
@@ -553,6 +563,19 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	}
 	mutex_unlock(&mgr->lock);
 
+	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS && adjust_dcc_size) {
+		struct drm_buddy_block *dcc_block;
+		u64 dcc_start;
+
+		dcc_block = amdgpu_vram_mgr_first_block(&vres->blocks);
+		/* Adjust the start address for DCC buffers only */
+		dcc_start =
+			roundup(amdgpu_vram_mgr_block_start(dcc_block), adjust_dcc_size);
+		drm_buddy_block_trim(mm, &dcc_start,
+				     (u64)vres->base.size,
+				     &vres->blocks);
+	}
+
 	vres->base.start = 0;
 	size = max_t(u64, amdgpu_vram_mgr_blocks_size(&vres->blocks),
 		     vres->base.size);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index fd3ac483760e..093f72eb6dfc 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -542,6 +542,24 @@ static unsigned gmc_v12_0_get_vbios_fb_size(struct amdgpu_device *adev)
 	return 0;
 }
 
+static u64 gmc_v12_0_get_dcc_alignment(struct amdgpu_device *adev)
+{
+	u64 max_tex_channel_caches, alignment;
+
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(12, 0, 0) &&
+	    amdgpu_ip_version(adev, GC_HWIP, 0) != IP_VERSION(12, 0, 1))
+		return 0;
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
@@ -551,6 +569,7 @@ static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
 	.get_vm_pde = gmc_v12_0_get_vm_pde,
 	.get_vm_pte = gmc_v12_0_get_vm_pte,
 	.get_vbios_fb_size = gmc_v12_0_get_vbios_fb_size,
+	.get_dcc_alignment = gmc_v12_0_get_dcc_alignment,
 };
 
 static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device *adev)
-- 
2.25.1

