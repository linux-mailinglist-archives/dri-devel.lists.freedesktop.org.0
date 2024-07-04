Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E1F9271BA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 10:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937AA10EA25;
	Thu,  4 Jul 2024 08:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bTsMTPm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4000410EA22;
 Thu,  4 Jul 2024 08:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYB6GfOBq5WuPlnAxhcHbZ0vqzzKc9tJ8vLtvhpTIBtvf0L0MaMMJCQk3879eZIp7Dvar/MF3ljAvNaeDyqtXcCQkVT6mQrkYHWDtVzsMeiP4uR8rMVKiLYIp3i9HB8h6PK8LHF1S7NpQe6QXkpeUfZpo8gQADw/cAuoV7WNi7OXMbmoCdguuAaPzh8MDBSk8/pN9u2qWxzJRyv+XebB5mej29OUSRXvA40Pq3+xMFMtsg4JqmJ0RoURByWp4t46eF0EHlJ6S2FyMU8fZ7GhFfeKsrFjDuVmQo2ZFR/Rskun2KfUdNMjqFMpNEwcYY7dsNRAairgClMiVWXdX+6dzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB0z+iUwLK9TAZUaqDKJfPlXxY+llVy9qFuwuettDzA=;
 b=TTIkZ0fgjiwWHNgpjUGWTomYvyEYjsT+ixHwCHGQlTs9l1njEm3ZRwE4ci8j2lCcjE/+J75f51HcRpdUje8yM6gj6QQZZW0mOvodJuyC6dsPpT27oJihZMuGKaBfXvDaEFAIN7APMXrsIRhrQaUH5GUWZyF23S81wpdfQy2HoPmXqfHI6/6ONnzTGGdODkoRKxnDLAsIXtK8Z9eJQEjwsvuIuhqV/6vdpJo/aHaPUG0Zv08oFiNRk7rAsBBfU4w45pi+HKxghukazhjisrO+5sDauzJspm4TbtdxBOtklUi1Jr1qSVvvYLiq4qbUBiH49Uw9b3oQvtJFqVOCUD40Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB0z+iUwLK9TAZUaqDKJfPlXxY+llVy9qFuwuettDzA=;
 b=bTsMTPm5QaprCH2RSsR4+Qnwt9nEyjrR+EaExklIxjhZrtBkpe6oTxkgYUl/MNNyIfbSrV3LPDmJlKgjEtAl38jePlVcYu5IQOpn4RKAqdYteLcwleATfA7C5aKij92bV8wzxu+xvQdbj5mRu4vDy6vkZg7+85/vo++A7qPn3tc=
Received: from PH7P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::35)
 by PH7PR12MB6490.namprd12.prod.outlook.com (2603:10b6:510:1f5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Thu, 4 Jul
 2024 08:30:31 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::ca) by PH7P222CA0008.outlook.office365.com
 (2603:10b6:510:33a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25 via Frontend
 Transport; Thu, 4 Jul 2024 08:30:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Thu, 4 Jul 2024 08:30:31 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 4 Jul 2024 03:30:28 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <matthew.auld@intel.com>
CC: <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <frank.min@amd.com>, <marek.olsak@amd.com>, Arunpravin Paneer Selvam
 <Arunpravin.PaneerSelvam@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: Add address alignment support to DCC buffers
Date: Thu, 4 Jul 2024 14:00:08 +0530
Message-ID: <20240704083008.870021-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
References: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|PH7PR12MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: bf88d2a8-bfa1-406e-f5c2-08dc9c039134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WhJ4wlee448x23cceSBxB1OFquuXPaDrtIFMOa14dAsM6Zjv+ROGw3a1PI6d?=
 =?us-ascii?Q?tBwXVpUfB27oafT41r5X6U6c6qIW1nVtUxKWNdvYXcseS+A4P4JlziCoU7yZ?=
 =?us-ascii?Q?WT2FDr3XTRMczLcCL/Q794IpVb0YPkNmWEu3nInh01o5N7UJHkJ7/EZgp8zq?=
 =?us-ascii?Q?k1avS4vcN6KDXF4EprgyY/9sEuUTEZIl2/vvMqPuWCgie6forYEL+nKmw1jA?=
 =?us-ascii?Q?UAJPwNVZ6nUMTrdPb1rsnzIGRuXNjayxfzFYqrC670bNu3Zd4GJYwbJNVWTh?=
 =?us-ascii?Q?6JMBlI6hZlXQZpL59N282KHHlgJbx5IFiriWc02flHXWi1vdqFh9OzhMEyTG?=
 =?us-ascii?Q?t9JDIW/kcK/jia2VI+1tSYehsQw+z8TVHOeFio05QdkykH72jlAN3MwLkk6Q?=
 =?us-ascii?Q?nt+2hZ76KJLni1OuC8+Hcml2tvUyumNsMZx+B2FFCrLsLdOF3otqi4jOrbEB?=
 =?us-ascii?Q?3UffyTXJtgqYLzfDrXbwhDl6FnIHOpKYW/kfJ2Y1gy+LmddpZCBUClZEJ1y1?=
 =?us-ascii?Q?x02pGw6oGx7ciUvJIvr78D8OzlrS1+7GJK1T8fLwdL9KoSJUh7IIWeaMXRWz?=
 =?us-ascii?Q?07sPm3s/qreQ3jD6YruKW4V6Jh20+xnJo1UQdi1Ay9QZ902vmutYefyHZoyI?=
 =?us-ascii?Q?t5l4omWrAP+jxvvFoPDUnPLjDOXBotvGyshrw7W0PRATTD/hMr3bu85nIOrM?=
 =?us-ascii?Q?pDWqCHOG5IYquW5GWDBaT3cJfgm7spJqyEHJ7sJFbg8emC+L1begOAjo43yv?=
 =?us-ascii?Q?2hnx/HvvE3j/XCyUQIY/sor03vp+S88xZG6SaS4xi2t+MVnpYVFzPEB921q/?=
 =?us-ascii?Q?6rIfRrRHHUUESx6v6r2jtCdlqW0iBO69Q50TkCHDfnf7x4JVvuhKJ+zk7cCE?=
 =?us-ascii?Q?OnXcoyMxT31MlHkmx9pUuM+vuE4mLNspF9OFhjS452kc2/SOXSbYgRx/pDbT?=
 =?us-ascii?Q?HWRL3Oa1YtCKe6szc00/mJdkD6mfIQh1SW6Eu9hzz7mVzyeXzNOOReZ+kknz?=
 =?us-ascii?Q?/mGdKiX81ccz78mjXvTmRiP4TjlJZ80luPXJfA/GoE9m6MzZjMhUdMLA6x06?=
 =?us-ascii?Q?/BdDSbMeJqzCnaio3OLOBxS2TiX7DMTnO1scJ0/RoivG6sa/MRXjExs5WON3?=
 =?us-ascii?Q?2QXjVd0clr+tVu8wB3P0qypUYds0c6bsItqjvnRPU0HXFodFojRunEy9XLXY?=
 =?us-ascii?Q?ix/1zYIrgOaFdvwG8OWpkZ0Japi1WoGONSselJtb7qTZ8KjzAam3WeJR4XZE?=
 =?us-ascii?Q?fTO7jVKQmPVRkOgSripozDUNQXzIej5W5/tM5gO7jZ0dje2GXQjOB1Vu+iZy?=
 =?us-ascii?Q?JfzXONpmxWTB651F7QftbSZui7tSUFmFF3yX5L46DK5UXpr/YRv44+UQ1R+P?=
 =?us-ascii?Q?5/qy+tMpTdf1VFeQSs3nxqDFTQgHoPQ6OxyRS35FGK901AaPXvL7EFu4Rupo?=
 =?us-ascii?Q?pXya0HvRCAEiXrT/kLe7rOtso2VgYseJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 08:30:31.3832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf88d2a8-bfa1-406e-f5c2-08dc9c039134
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6490
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
index eb94f943b28e..756d1c8cbffd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -509,6 +509,16 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
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
@@ -518,8 +528,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
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
@@ -550,6 +564,24 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
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

