Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7930A67B446
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519BD10E7C5;
	Wed, 25 Jan 2023 14:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B9510E7C0;
 Wed, 25 Jan 2023 14:24:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gx+LWieGPmXbXE34NA5/hCotYGFPoCy9YRdHFJVH85gfCn+2ax/hO0pJ/bjGlbOz4YZih8bq0jwILetyugbhTrJyQfnGyEdFf3q9bNHI81O9hhUwzU5ZJC7nAxgS4rmVz3ncDsHZwiW3z7nOM9Alrs5oWexKCoR8lI8d0ga6+h/dHjpwmW0cRM2eqXluX7/pg+e7m2UEH6GyS/nqOQHy2QCUfoNriWIwUv6mtIfTY2QAREMKRuseqof3+MaQONA1dvbIcfaARDyEy//+9H8PfyaLPkA4FjbnmMK0L5//BemjETQcczn9biDBrWDpS7xs2v8kTS++yIbZK2HYteCBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qogfNqEQMS/uk9dLjaUtPlsVknMFkU/t0Jjqarfiekg=;
 b=GkBGpJ+rkpCJB4kSsZh/sMa0ZjuDJ5fF+mAZdGXjYSmkgKoqhaEnWKspsqAsgWOeWNt6L4X90u6gwQxf2Cso+jlTA3Oj+ludR5VTHat/N2BNrbXBSUX2BxXFtyIjfNW0XirEwWhmiktuX7geYL4inFiymFpRe6WU/UWSwHuH2y9ZF8rXR/kh3olGKiT1wG8SEPEuP+l0fpCojf1VncoUTe8VSqHpQaPTEdLsPIhNt+fiS+EDbcVHv3/kGc3R9HtDsGpGiA1tGgWEPJYmUJNW/T9sZmJ69PXDe2wH0dFVhIoDzgho9hcXgW/6CdXQJagh2PuHsx9Aqm/j+sqGoBdT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qogfNqEQMS/uk9dLjaUtPlsVknMFkU/t0Jjqarfiekg=;
 b=2JMywSG8aSePsDtx4Lr9ffd0vYSgwtIFuLr9WoYI8Xoq10VSykw6LFbk128Oh1bEe4MqimA32KxoM39b+b70epZVER/eBA9K8o+OEB3I0ci9PIFZWKu3Q5PqoSgCgHXrXmyNiAp0Hl36OuoLWgJHB5Caj5rjEAq8i1tK/0HDvjI=
Received: from BN9PR03CA0292.namprd03.prod.outlook.com (2603:10b6:408:f5::27)
 by PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 14:24:44 +0000
Received: from BN8NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f5:cafe::9a) by BN9PR03CA0292.outlook.office365.com
 (2603:10b6:408:f5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 14:24:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT074.mail.protection.outlook.com (10.13.176.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 14:24:43 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 25 Jan 2023 08:24:40 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 1/4] drm/amdgpu: Use cursor start instead of ttm resource
 start
Date: Wed, 25 Jan 2023 19:54:12 +0530
Message-ID: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT074:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: aab1dbe0-e4c2-443d-cbab-08dafedfe72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h1sFetJ+Kec5RyYyF5/N+cDZqumXXGY0j82495UbvbFgEgvxmFkjxnLSL8pfmt8AePzsJcQzwViWowaOZE0tDBtmqqI3VHw4UpzGCTUhiPB5LhKyVNjcDJGwonv+J12XHN0ZTEX256u0OPpsA8nsbGYlvkoZ9leecNhea/091UaxvVOq1dlKLilpghwMe/ayKljKLrGXKQrzV/ieT4j7D6kvNMDD8q6ztZzp3vVW09CzlnCsj/ZWAStw0XA6WmeLAHMTB6Eqc2Ew+dCvCuNPXTxoStzeWZmWzM5ygvBCes5zxkBa/r3cp7DOrnWsMmV0EcxdBqYQkkJepf9IbGcnYOYSGLuwcv1yzAjIOrEfxzstd0QLtXIcu2iZzyPBsogCRZvVu1wlq9B/BzoLdWyAOERFUCuOyuATlgzsUYbS+zZpxUwxxFTLzNJJhyg+pumzUwxS+semJ2l3cAcB8tfdqAeLuUIHXnmJh88uWwuEmXX/pBDDDNEgN8B3NFia+GkvONe5NJ0ny+atMfEjVf/xJ9nMmLliGbC5Gr/9ArXbv8aTrQg210fMolR8O8Aq800+QIXU1viQESH5TxqCv86/NBFNQnl13IHF0uaA9yj2kGipILCk7pJXhb1iXM6b5f87FmEPVgstA/EGH8HZANtC20hmnyMcImTcHarF+ZmfwNEXYh36xKoSL7UtRPxq/GN74VU2ftQZqGj7Q/WdH2N+zsL1tIJ7hsAREWtE8KRNGn8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(8936002)(47076005)(426003)(81166007)(36756003)(41300700001)(356005)(2616005)(336012)(82740400003)(2906002)(5660300002)(83380400001)(82310400005)(1076003)(86362001)(6666004)(478600001)(7696005)(4326008)(8676002)(40480700001)(40460700003)(450100002)(70586007)(70206006)(16526019)(36860700001)(26005)(186003)(316002)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 14:24:43.5512 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aab1dbe0-e4c2-443d-cbab-08dafedfe72c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
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

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 10 +++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

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

