Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C967B047
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 11:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F8510E784;
	Wed, 25 Jan 2023 10:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755CE10E0DF;
 Wed, 25 Jan 2023 10:49:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIJi41hnpNmD6RX4OthrobqCTPbCqKUNF5BiQmNqjErRzgjCjzHGJCnIVApdiyMxUqqAoEP34vm7BiOBdT2AEicLGuMyYpjXx0mHnZlVTY/oIcUWYHXTSW8RojkGw0KdVkOEJlYYjjLuuBM/UkghLatpThuSUPJ+qhHHX7NW39vLu4eK+agZMXxtuvQuNXbr5iY6FXhL1hgEKGgU5cuNgnDbC4G/qIZ22Jmvo124UybaX9RueWqc3nCpdRxGxcwoRsF8TNJb+hHt40NVpGDFoIgMfatGWm5zkDJhjgSB/6uPvhPP+nuz4j633JhpCaO7MeyRNRgXEIkP/6BP7w7f2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJ2fQbMWY5HOM+P7DIXaa/fkQ1qgJsLmwkOa3tbp16o=;
 b=a33nt9vuynt/JQjUjCsWiO4Qs2QOxaD5MZF9OHwESc8eJcCWDp+/VgBI62AzIaBmQu9lktRDR4ZwiPeEUUBh+CSpsxZ76xuYbDU6lVUpOxJcdSej2ceQdl5n0C9iSLOz0AZ259trFa6iMR6Zdk7umtmsyTEz4wXQbOtAtVkeLJrjdZ04MY5gXsVeSEWeY4ut2+Xkbkm4SHHXCMQqsDUEFNvRbuuDFHrd7163zTpLp/ko1ZdtQilKOlDxxrmat+9qR8bZxTWvVfCPbn70nF3y1SB7dgVYIVYhuVFRZaTruY6YPzaixD5KQ1+m/PZVwjcChrrfAEwBkH9f86Xk3ETAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJ2fQbMWY5HOM+P7DIXaa/fkQ1qgJsLmwkOa3tbp16o=;
 b=wH0cKWBwf9ntf0EelCd+wutgPVafY0yi91WpFHgsATwjikrkKDX7kBuBhrfbioyNyUUB97QLgk2d16TRdDC6bYcKZI6CM5BPSA4J98gvmpNw2IlOSsQWQhoVc8cHROJ9XAk4nTlrV1EMN2upBpvZEPcZPtnpNXDeq+e4k8vtTNw=
Received: from BN8PR04CA0053.namprd04.prod.outlook.com (2603:10b6:408:d4::27)
 by IA1PR12MB6116.namprd12.prod.outlook.com (2603:10b6:208:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.31; Wed, 25 Jan
 2023 10:49:07 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::d8) by BN8PR04CA0053.outlook.office365.com
 (2603:10b6:408:d4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Wed, 25 Jan 2023 10:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 10:49:06 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 04:49:02 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 1/4] drm/amdgpu: Use cursor start instead of ttm resource
 start
Date: Wed, 25 Jan 2023 16:18:35 +0530
Message-ID: <20230125104838.23596-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|IA1PR12MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: 5427f07c-bb72-4150-391c-08dafec1c80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzlgAJJALNihXWGsRTQr/UTuguShNDt62ETFUJn23NZKfuZcOPLkb/X1vHdHjAQwRMWcY3GagE8RJq9ABWaX9DHCD5O8aGydlr6xPOkz1ZJNmAmc/MaeE1WW1w9U6ljXCzNnmXruaIrljqZGc69PdVUORjxxiA9FxlYziekAinHhfTsjlCWEBshy41cCn+uKXHczuCGty5pc/xy9SxGApdqI0XoLredKNk8GkGnV7trPSfl8qYT4WaJISO8J6eGREc9c3uAwZXuWAb9JensI+XYxEPhZ2l5ZdFDjnJ+K8utEsbp2PSSNCut/vmUFfxlBBwBLEIDAEsJJJvyvyH56ttYxD6nYJAvtq8Mq2GAVBcAzsZT0zh79XMIsnvGz0ndx89WD/COuh3eFewbIPi+kK5yr6erFSc65Zavme16Ehe/3zV67rMfWP2l00nQcaPOuX2lPPoAH7rc3sbYvCqyw4+HMxz5bm4bRIEAhYJgAzZCbolJ1ydz6iWXVneokRKjWWjzEXfZRQRmgzHKNNODLCinDkkfQuq2WAVXYLufClzV45HO2EogyRSOC+qtY0tYyfU9D4VFuFOsqc0Ki9Ta7alkv8Nj0BNEt7IFwG47aO/YMrApRuFJXKvHIPjEOhZY8Ha0LWKnRHEj/QvjP0bffQ36ZC9DQz66OXUkBJJn+7/awMMNwDwXLklbHAm62S1WZaW8roSplsaKHG/fB0lR4puRlG1J5cr9JeQc1RNwI72M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(186003)(5660300002)(82740400003)(36756003)(450100002)(41300700001)(70206006)(4326008)(8676002)(70586007)(16526019)(83380400001)(47076005)(336012)(426003)(81166007)(6666004)(2616005)(356005)(7696005)(478600001)(86362001)(36860700001)(40480700001)(82310400005)(316002)(26005)(110136005)(1076003)(8936002)(2906002)(40460700003)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 10:49:06.4396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5427f07c-bb72-4150-391c-08dafec1c80e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6116
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

