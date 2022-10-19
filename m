Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B862F604B66
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDC910F27C;
	Wed, 19 Oct 2022 15:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73B910F27A;
 Wed, 19 Oct 2022 15:28:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsjkmC76JlT8EALxlPHhLWoQcYwPFMu99ikGSAvYfvdTDdgv66IZpquU5scnyCH/T6+6kDJz4Ciqqq4y2ZguruVwIFb/DV9ntBwkYWG3VKi1GLPsuBCcZBfjPXgc8Ua7NUuxrGHZMzFajCAoJJ6FZJbeaVDFBvbU09o+odWUdHianYs/OKTGW7JGVcCB8cGNk85M742Crj/aySaYzv57n/5ECElK2Er69yt9y2ig7aSduFZWj/76Uy9u12T4IJggbxguRhfV8+p3I7yEIXrerkhu1NSkedMeoisgvIe4HVLyD/zFDC/JEMaQJFHs3T9gDtQ2Is8y96/ObITByZEq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rZzSFX9bVRXs1nDK4WwHMrgDQeqUNfYdDtwH1iu77A=;
 b=PgO1zcZAEOfPW4RvkZ7DeJc0zaOd3jXFI9NtDo3e1N5f2fwh3M34O3jIF0TIUddlEiH6Cm5mC6+mgLf6bhm91+NCvHSRlpioLihfJOFVKsWOm6W8wqVaNwyCGntc4uwThzyFrR5sPxUudJaS7pE3RTkxwTuPC0ohvZxAA12G++W+TxvI70ZrpYo/cGFnr1WyOMZb789GD9PNJmZBeGk+GX75F1l6WJ6azOKugzP9+NO/FEnq98jvGEHDlNttr/Oy0Wq2cFdta0jMLFAYsCFMD34yTYfj6WbJT0+sgnrpHYHW4NzzuP2MPVtIXY0w6roLyleL9Bn9dJRls2YsiC+Vuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rZzSFX9bVRXs1nDK4WwHMrgDQeqUNfYdDtwH1iu77A=;
 b=Aiy1Eq5BPtwsxLzPkNPoRf7ViJoBWx9FFqgq7xlFPl7K4g+4+CuSBlsm4XLgNUqeJCHaOyHYvpkzVMgDQ01G/IREAkqvUdKfFuOBl7XCewzj/5ZKXE//9JNMSoRb9DAmhTPRfxzaHeICKCCdE1V9cnGfd/OTudGdfRyk0KMigFs=
Received: from DS7PR07CA0004.namprd07.prod.outlook.com (2603:10b6:5:3af::13)
 by DM4PR12MB7765.namprd12.prod.outlook.com (2603:10b6:8:102::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 15:28:56 +0000
Received: from DM6NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::88) by DS7PR07CA0004.outlook.office365.com
 (2603:10b6:5:3af::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 15:28:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT088.mail.protection.outlook.com (10.13.172.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 15:28:55 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 10:28:30 -0500
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 3/6] =?UTF-8?q?drm/i915:=20fix=E2=80=99s=20on=20ttm=5Freso?=
 =?UTF-8?q?urce=20rework=20to=20use=20size=5Ft=20type?=
Date: Wed, 19 Oct 2022 20:57:33 +0530
Message-ID: <20221019152736.654451-3-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
References: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT088:EE_|DM4PR12MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 368f34d5-4040-41af-b78a-08dab1e6a2f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rVZi8WsPl3wifQaAP9c+I4LQV3zYET2Yb9+Xg3IuFin/4/QjW5p23RWyR7KQCyR35wRM/W1GwvhZmZHXzMWVyf0NsXLTUI9NgOaTJNfR/aEwt1uLvISx+V+F/2GeddtaiOmxMVrF3k7hrqGU6wG84+6UAiBNzWXSxCrOpidoNTZwyaGCX83uZ4lh/9bKhXVzhkvyyXJ1klrjs7iOJwPchYHFscvX0YS28R7So7DysB1KpI+L06DAZCYdqL0IVwKoe3FNUbVGO8f8NQ9Qn1ljucSjHwcWxoO8Njk+CY4MIBVwoZlEGvNAbqMm+diOVPODV+dUB2Q9c5IJgxC5R8ZcUaEmRqxp45tVfo8cMAwqyyUjH9rq3cOLdBv0EgzCc0h1+aXnyKlSAxEd5xwDQRfuZrEQSntxvl7canO98S/BbJOyMCVjV3k6YENgzPhi2of3Al2XglIx0bVl/jNSnnnJRCQdB1rKfoA0pnyNa2Jv/2S7Cecej/cCw0du7WvgT9ECFU1eHlt5+anxwKtW/eXRlioEHeprJ6B7jj6xopIWDCtegpE0h1KQw90TEGjaAaaZt+9lXLFUPtQiPQr5nOl5JeB82Z2o5xlHhbVK8c4TvenqXGzKtfRtswx+4gSw8A2v+RPRSC5x4OaGG9A2/W80vUzRrxdvOHAHWean2uN9lyVMG7HwVE9ak00fURont6p1BIuzTWtnwoF/oRiytLqNlMFYz9YtDJPcH1MOPa8lBTGrbrys6ePnJR2eCfFUkLWxrfbI1Or+rVBMkT+kJ1ILgNeWuHua4Ele4LkR5m+8SWI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(16526019)(47076005)(426003)(1076003)(186003)(2616005)(83380400001)(356005)(81166007)(26005)(86362001)(36860700001)(336012)(82740400003)(5660300002)(2906002)(8936002)(4326008)(40480700001)(82310400005)(40460700003)(478600001)(110136005)(7696005)(316002)(41300700001)(450100002)(70206006)(54906003)(70586007)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:28:55.9950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 368f34d5-4040-41af-b78a-08dab1e6a2f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7765
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the ttm_resource from num_pages to size_t size.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
 drivers/gpu/drm/i915/i915_scatterlist.c       |  4 ++--
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 12 ++++++------
 drivers/gpu/drm/i915/intel_region_ttm.c       |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 4f861782c3e8..7a1e92c11946 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -649,7 +649,7 @@ bool i915_ttm_resource_mappable(struct ttm_resource *res)
 	if (!i915_ttm_cpu_maps_iomem(res))
 		return true;
 
-	return bman_res->used_visible_size == bman_res->base.num_pages;
+	return bman_res->used_visible_size == PFN_UP(bman_res->base.size);
 }
 
 static int i915_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.c b/drivers/gpu/drm/i915/i915_scatterlist.c
index dcc081874ec8..114e5e39aa72 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.c
+++ b/drivers/gpu/drm/i915/i915_scatterlist.c
@@ -158,7 +158,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
 						     u32 page_alignment)
 {
 	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
-	const u64 size = res->num_pages << PAGE_SHIFT;
+	const u64 size = res->size;
 	const u32 max_segment = round_down(UINT_MAX, page_alignment);
 	struct drm_buddy *mm = bman_res->mm;
 	struct list_head *blocks = &bman_res->blocks;
@@ -177,7 +177,7 @@ struct i915_refct_sgt *i915_rsgt_from_buddy_resource(struct ttm_resource *res,
 
 	i915_refct_sgt_init(rsgt, size);
 	st = &rsgt->table;
-	if (sg_alloc_table(st, res->num_pages, GFP_KERNEL)) {
+	if (sg_alloc_table(st, PFN_UP(res->size), GFP_KERNEL)) {
 		i915_refct_sgt_put(rsgt);
 		return ERR_PTR(-ENOMEM);
 	}
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index e19452f0e100..7e611476c7a4 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -62,8 +62,8 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (place->fpfn || lpfn != man->size)
 		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
-	GEM_BUG_ON(!bman_res->base.num_pages);
-	size = bman_res->base.num_pages << PAGE_SHIFT;
+	GEM_BUG_ON(!bman_res->base.size);
+	size = bman_res->base.size;
 
 	min_page_size = bman->default_page_size;
 	if (bo->page_alignment)
@@ -72,7 +72,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
 	GEM_BUG_ON(!IS_ALIGNED(size, min_page_size));
 
-	if (place->fpfn + bman_res->base.num_pages != place->lpfn &&
+	if (place->fpfn + PFN_UP(bman_res->base.size) != place->lpfn &&
 	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
 		unsigned long pages;
 
@@ -108,7 +108,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		goto err_free_blocks;
 
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
+		u64 original_size = (u64)bman_res->base.size;
 
 		drm_buddy_block_trim(mm,
 				     original_size,
@@ -116,7 +116,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	}
 
 	if (lpfn <= bman->visible_size) {
-		bman_res->used_visible_size = bman_res->base.num_pages;
+		bman_res->used_visible_size = PFN_UP(bman_res->base.size);
 	} else {
 		struct drm_buddy_block *block;
 
@@ -228,7 +228,7 @@ static bool i915_ttm_buddy_man_compatible(struct ttm_resource_manager *man,
 
 	if (!place->fpfn &&
 	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
-		return bman_res->used_visible_size == res->num_pages;
+		return bman_res->used_visible_size == PFN_UP(res->size);
 
 	/* Check each drm buddy block individually */
 	list_for_each_entry(block, &bman_res->blocks, link) {
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 575d67bc6ffe..cf89d0c2a2d9 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -244,7 +244,7 @@ void intel_region_ttm_resource_free(struct intel_memory_region *mem,
 	struct ttm_resource_manager *man = mem->region_private;
 	struct ttm_buffer_object mock_bo = {};
 
-	mock_bo.base.size = res->num_pages << PAGE_SHIFT;
+	mock_bo.base.size = res->size;
 	mock_bo.bdev = &mem->i915->bdev;
 	res->bo = &mock_bo;
 
-- 
2.32.0

