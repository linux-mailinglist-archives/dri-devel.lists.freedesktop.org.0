Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7759A67B5B8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 16:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CD810E033;
	Wed, 25 Jan 2023 15:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F4410E033;
 Wed, 25 Jan 2023 15:20:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLlCUC61uqTADTm00sNX+OuDuVXA+WmEQtZFYhuMu3XprUpyJeqq68kVl4+dnHe/5zkCTEuN1bYiDKiFPOqD3bXqXVwmYSizemW6i3aGzooBV/hi9/t5hFB2SWymWV2r5ebQJw0YjCAqLm9PpAVmBaP2St54yoBXDfDfNJV0YHo06jltRwxzq3f9OmamFERwSGwrXI+ER/b/JEzt0rs/j5gJRx5kBHkxYgPIgI1o/7pMoUHMAVK0OaegaWhjOVd5/WFS+0r2RCxUQ/S1cKv0S7zq+fxeXBvx1VJrd+lAI5naiFGe6sR1zRI5aUNz7iHG9oNIcBRa5V7rq5tkYw17Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKqmTfLzzwBstqA2gaPDOoIZ3yddDHXNfRCsmJeVEUs=;
 b=oekg7x+wbIIMeTiaiIW9TrlvKaUJnOXjdKgJ140L+B6mk9b/kXP2CakpOqOWfSbInlXhgwpwxBTgUB3dmyuArOt4bplk685rR1rhzt9veCIuTNKVX6fNmySG6uUrUn1Ow5znwp0JYCk+f++d0ShBsqzvAcdNu/TNlw6qyY9Fr9DKGOPgWUDWySpK383WRzQf9n0lkYv0l5lGFGFmAsXC9bmNe4XFE97jdDxvY0tSbLcJYV0lpC4beZLkhuz10hkc4WDsBj2AUSSUwgIwB1AIDqvvcGTxFiYCD1gIZe6ZkY3MqOtVd86P7WlGxdbsix1ew+syZMNlRQExJ5L1tGdo3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKqmTfLzzwBstqA2gaPDOoIZ3yddDHXNfRCsmJeVEUs=;
 b=A2cyXXGfkAcrI81EatV3gvGIk35ItdRpXaWHAI+Gvkq7xLEbjya0Xh6h8nNF3+Nm4otHxhRwGZY5F6M/z+AUfmE5YlZ318s6MlYap0OZUIXHxR0pK+pxdAt0YEoZEh4kJua7GI06A3v5qAx9J4uLPZaERhwWxFQzL24e9aOufjI=
Received: from BN9PR03CA0373.namprd03.prod.outlook.com (2603:10b6:408:f7::18)
 by BL1PR12MB5221.namprd12.prod.outlook.com (2603:10b6:208:30b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 15:20:34 +0000
Received: from BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::17) by BN9PR03CA0373.outlook.office365.com
 (2603:10b6:408:f7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 15:20:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT105.mail.protection.outlook.com (10.13.176.183) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 15:20:34 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 09:20:31 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 1/4] drm/amdgpu: Use cursor start instead of ttm resource
 start
Date: Wed, 25 Jan 2023 20:50:03 +0530
Message-ID: <20230125152006.3945-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT105:EE_|BL1PR12MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: 843a5b82-2e43-4a0b-a4d6-08dafee7b442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DdszCZjRnvK0Izv3IzCO978611IryaOVIww7wq8EAlQk4st8zXtRCW7VoX7A39Ei+f9xWku5tn5eE1ExdXiqJC/a0i78VT2pd8ZcAokaQSrDDHC01PnJnP2GGkH7aqQ48ojU1X8r2+SnLKgbrqm9UEpwetpI12OXJ3YBAxQqF7kZMM0PDd8gXgj8dmQvw+43bwYyYX/1bUE+dCNXf2T8k61yLyCUiu0JeNZBSIzcP/ZHG4ArNEMEnl6CFRxx5D68MxmbfZPWuUM99HopDiaj4xW2y+GyxL0UoRxkNFMLRNewotiBn1pXx/Hn5DJyVAURqBj6Nlm/L9+Zrt3lKQgFDHtw1igQ5eJFDeg3tTqX7DL9T3hX8mMKf7aeNQW/VA/aIcediqEGK73eqrfutknODcevUcCsz+Ga4dgBEZV0ruemY585juGPyShBiZqAUgyRIricEwSq/r7JOZMl9hEVrRpnCd4m45o+T3GTNmzL9DiaY2/JWO/cvpvcabNPQsFzGRCuDZXGeruS8AALeAseqrrH/Lvf/DnM7E/Nu1mHUPcbhScNsUO3xNynyE5O0HGpcR8emWa5tRRuLZL8Jz6DY+7XFMoI48bik8bDHHfu+eux9eQxyUAEV4/z4ZQ0JwikZzieDLqat3+SEUvBNF+e4Ghq5XLpKDA9MBvRHUsVvNnRO1XlimifXZarzq6edba65Xr9V371wqPqeNvK8pWm4EoL9Npy6h0j0mhfYngjPfw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199018)(36840700001)(40470700004)(46966006)(36860700001)(83380400001)(26005)(81166007)(5660300002)(2906002)(7696005)(356005)(82740400003)(41300700001)(86362001)(8936002)(4326008)(82310400005)(16526019)(6666004)(40460700003)(40480700001)(316002)(8676002)(186003)(47076005)(2616005)(426003)(336012)(54906003)(478600001)(110136005)(36756003)(450100002)(70586007)(70206006)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 15:20:34.1044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 843a5b82-2e43-4a0b-a4d6-08dafee7b442
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5221
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cleanup PAGE_SHIFT operation and replacing
ttm_resource resource->start with cursor start
using amdgpu_res_first API.
v1 -> v2: reorder patch sequence
v2 -> v3: addressing review comment v2
v3 -> v4: addressing review comment v3

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 8 ++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 25a68d8888e0..2a74039c82eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1491,9 +1491,11 @@ u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo)
 u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo)
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	struct amdgpu_res_cursor cursor;
 	uint64_t offset;
 
-	offset = (bo->tbo.resource->start << PAGE_SHIFT) +
+	amdgpu_res_first(bo->tbo.resource, 0, bo->tbo.resource->size, &cursor);
+	offset = cursor.start +
 		 amdgpu_ttm_domain_start(adev, bo->tbo.resource->mem_type);
 
 	return amdgpu_gmc_sign_extend(offset);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index c5ef7f7bdc15..a97e8236bde9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -849,6 +849,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(ttm);
+	struct amdgpu_res_cursor cursor;
 	uint64_t flags;
 	int r;
 
@@ -896,7 +897,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
 	flags = amdgpu_ttm_tt_pte_flags(adev, ttm, bo_mem);
 
 	/* bind pages into GART page tables */
-	gtt->offset = (u64)bo_mem->start << PAGE_SHIFT;
+	amdgpu_res_first(bo_mem, 0, bo_mem->size, &cursor);
+	gtt->offset = cursor.start;
 	amdgpu_gart_bind(adev, gtt->offset, ttm->num_pages,
 			 gtt->ttm.dma_address, flags);
 	gtt->bound = true;
@@ -916,6 +918,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(bo->ttm);
+	struct amdgpu_res_cursor cursor;
 	struct ttm_placement placement;
 	struct ttm_place placements;
 	struct ttm_resource *tmp;
@@ -949,7 +952,8 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, tmp);
 
 	/* Bind pages */
-	gtt->offset = (u64)tmp->start << PAGE_SHIFT;
+	amdgpu_res_first(tmp, 0, tmp->size, &cursor);
+	gtt->offset = cursor.start;
 	amdgpu_ttm_gart_bind(adev, bo, flags);
 	amdgpu_gart_invalidate_tlb(adev);
 	ttm_resource_free(bo, &bo->resource);
-- 
2.32.0

