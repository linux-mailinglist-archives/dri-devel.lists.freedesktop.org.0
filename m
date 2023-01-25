Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 457AE67AF26
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AC410E772;
	Wed, 25 Jan 2023 10:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2068.outbound.protection.outlook.com [40.107.102.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AA410E76E;
 Wed, 25 Jan 2023 10:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQR6eDbKdoNfWuejNhA0xU8vPaZvOi1j4H1NvAWbMT7c4pIE0ZqWE0jJb+2GauAMyCxlzOeyJLCdb+BYabWDqtX8hQM2JcFK9meVvzuuo6BXfsRdZkZhL/ZNHYsDcn1nAITFp4QFiNU3onPUP/oRsZizOLQkoOCk5VMsKJhw3vBCvMT48rqd6QQ7eJDU7bOWD5HHfp97fbpEu5YxdhHakLo+TP1QIl+O5/p1glnNcvlbWg9dYZICiGf6QjhKjE22jweXT+ck9NFCRdNvf0XaFyoEZasHIR/V5jQXQFwF0qw4T8nmPLl2Tce228oSwqdti9i6RrUIqBRdkTzJWsT8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hek6HNumAe7iNGfUMe/rcw6CzbBQOLd9TUoCHUXMNtM=;
 b=aHkPSU1RGpDkDZDC9PUJaoZK0KMNLxlmvGPVvERq2fIP7ku1RhwP+YFAPtKPeF/99rYus1oQO30ck1LcEx8R3d+57cc/k1jSZ3mVqN6EdGBJ+Ye0y2rmoGoGdDcS0/c7yvFTERfl+fmOymWvc+jG68PJ3JpGfwaHkGhlxOUkNOVCM3yYzQrPaUz5n9wTOG3rVYH5H0JknBg76aUx7jz0Uz3Axlo1oNnqrCyjxB+Qz7AtpE4uY1oONutaTEZn80/S00oSa//ylD2wgjEYpcm8NLno30xaClrR+e13qbvrKmczYv33vsA2R5++qOg2Q22EwCtUMFeP6wXozMfjut1oEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hek6HNumAe7iNGfUMe/rcw6CzbBQOLd9TUoCHUXMNtM=;
 b=3sJlvllzESxktPQ+YC3EAouXhmcP+SDcZZXy+pYA79dFuVUIHwVhidteMu+AwPi9y4sVi50bVX86OMPPKJo9Z61DRyUUrpj4HSPuxIn6KAZjuYiEpcl5mfuBXqCryzKzmM+7uy5CHBM/4DUy2Sf9RZCele9vZ1TcdQLFokyT/Ok=
Received: from MW2PR2101CA0009.namprd21.prod.outlook.com (2603:10b6:302:1::22)
 by DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 10:01:24 +0000
Received: from CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::5c) by MW2PR2101CA0009.outlook.office365.com
 (2603:10b6:302:1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.4 via Frontend
 Transport; Wed, 25 Jan 2023 10:01:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT020.mail.protection.outlook.com (10.13.174.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 10:01:23 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:01:19 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 3/4] drm/amdgpu: Use cursor start instead of ttm resource start
Date: Wed, 25 Jan 2023 15:30:25 +0530
Message-ID: <20230125100026.5086-3-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230125100026.5086-1-Amaranath.Somalapuram@amd.com>
References: <20230125100026.5086-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT020:EE_|DM4PR12MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: acf8d405-afcc-4cfa-ad25-08dafebb1dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uf/N7FPha1IAzA9zgfBFIOeMrRfURKaLU340pc9ZxlJQQLSC0tBDFh7bFQAQtnx0FL/Wt7C5g2AhNuwHpfjrLcW71zSxB3Sbl7nnwjA4Q9s7esvXASk95ndcwj+L7zDuvM7nl8oGbdE0K7TflEWxkvFOkLs0o3l6vrLP2776Gf4LKxnTJnPjh9D5VClUrq/gdDiFFZT7li/7Pun5lo/QJ155TNmNYvQh96rSdSBVQglRlRkHqxH8ENBHsW9dN2PkV2aXboQFGH+ogtvHo87LxXtq6Q0YuJ2E/4luAuDKempIIEh8RJbjyqOhgiObhGgKTzab7V7x7qAu2B0DzBKKWyXINLBatSPfLHPp/OnimuiQTjfQS0OHcHo+1iVQgemTysDa5+eqyPYABzgVfRwBA6rnW/UuKxQXjpp3Ea1f+vgVy2Fu+HYiaKw6pGXFjHAB/JOZhWtmn0HSEC/NxD7pIblIsfHf8kYKzyDXVENmTrsjUsIkAA604YEuvJqHZuSRfjFGww8RGFhJmCZh+Zq2/HDAVyDVPVInyBafYfJOyguphiMF8j459Gd2ogrjl1KTCgREI/L0MtyaXg2DvyO4ni7sGpMoGH/NlGvM/low0f8KnveyamSu+LV4DBRavLW9Wy6iDsR4LTr83cPk6RYwW+CKuwhk/A7bSpjt+gMxwog41PBsUGiyelmptajTSWOwk3FK9mBk2mZ/leSE5psCgCjJjl3R99YUK9osMLVmZMQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199018)(46966006)(40470700004)(36840700001)(6666004)(336012)(2906002)(82310400005)(478600001)(54906003)(426003)(83380400001)(47076005)(8676002)(40460700003)(70206006)(81166007)(36860700001)(86362001)(41300700001)(26005)(316002)(40480700001)(4326008)(7696005)(110136005)(70586007)(450100002)(1076003)(5660300002)(8936002)(16526019)(186003)(82740400003)(36756003)(356005)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:01:23.7116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acf8d405-afcc-4cfa-ad25-08dafebb1dcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5962
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

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 11 ++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 10 +++++++---
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 25a68d8888e0..2ab67ab204df 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1346,6 +1346,7 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
+	struct amdgpu_res_cursor cursor;
 	unsigned long offset;
 	int r;
 
@@ -1355,7 +1356,8 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 	if (bo->resource->mem_type != TTM_PL_VRAM)
 		return 0;
 
-	offset = bo->resource->start << PAGE_SHIFT;
+	amdgpu_res_first(bo->resource, 0, bo->resource->size, &cursor);
+	offset = cursor.start;
 	if ((offset + bo->base.size) <= adev->gmc.visible_vram_size)
 		return 0;
 
@@ -1378,7 +1380,8 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 	else if (unlikely(r))
 		return VM_FAULT_SIGBUS;
 
-	offset = bo->resource->start << PAGE_SHIFT;
+	amdgpu_res_first(bo->resource, 0, bo->resource->size, &cursor);
+	offset = cursor.start;
 	/* this should never happen */
 	if (bo->resource->mem_type == TTM_PL_VRAM &&
 	    (offset + bo->base.size) > adev->gmc.visible_vram_size)
@@ -1491,9 +1494,11 @@ u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo)
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
index c5ef7f7bdc15..ffe6a1ab7f9a 100644
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
@@ -927,7 +930,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 
 	addr = amdgpu_gmc_agp_addr(bo);
 	if (addr != AMDGPU_BO_INVALID_OFFSET) {
-		bo->resource->start = addr >> PAGE_SHIFT;
+		bo->resource->start = addr;
 		return 0;
 	}
 
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

