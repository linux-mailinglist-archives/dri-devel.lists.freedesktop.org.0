Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AADDC6AC0BF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 14:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E3110E0C5;
	Mon,  6 Mar 2023 13:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B006510E0BB;
 Mon,  6 Mar 2023 13:24:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bV8uxq1e+mMH0L2kY2CK2nnVyd69+AdYkn2Z7EOZIzknWpqPXZYLTwPV9ko8fccq+TQiCk+wvTLZiS2IJqbAe9H4sgVsVBVgVOjhx+Ic/Z5ugQVUAPwYyp83+W8HVVA7Ii0WcXVmgALLQP8XF0W/ZS6JLhRtGgnzIFClfTlEKJC5dRWnei7DE36/6QgraE8FBoILn+jEKCmvIGjpILO0HTqTWqlS64iEHeTwgym+AWE8nsSrxgfBwhDw+c1dMkAa5tsz7GxYRu4guq9VA9tssGIlrbRoENK5pPMeZy4wG2Fx7XmXQps0NYJwCnWIptg7BxFjTTR3R8Ll8PejpVY9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2gwR7c1X2KYHmdM+6p6E91Opf99feDUhjTd+qBClSqQ=;
 b=jg0rovffzAMzScZMoovM96fSlEbeuUGBTrrGMbJrNgggmm5KeJYR5/U1+io2yqGhFG9TPt+drsYZHiCNllsw5GcIUZGas7F5o/oNhyceh6EuiTW/m1aBD0IyXliyem2Bt1VkbNQ+/RzFB5BYkjyo+5yGuuiphLOcrJbt6WpZh0RQgEBZJgXSrZMynovaRaE0X+KdDG0KfXQDUoNxlnVeWVWlO1wMhYb96gKZWCRA628vdTTP4+ywoVzDS6lOPwagPZqOj/xzfzPu/uXv8ws2HnbKLDkiS+LSL2PDCi+9Ify6OWXfhqBD/kaSHk6uRFEa+ROFzGBsRdbJoX5pznJQ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2gwR7c1X2KYHmdM+6p6E91Opf99feDUhjTd+qBClSqQ=;
 b=Xd+ub0QV7ilhqobitk1Zwbd7Ic1YRM4avDKmeXZ7T0n1FPSZFkJ0SqzfLicnfyajM6oN1KAdBDerFFFaHTpeBcfWlNy2fYDoypEGC61q/6njrdX6BsgTH8JmmQc/rTne8VcabOgeRevpbzcCFQcEWCTVgg7mdBrXVwNUq7NXpEI=
Received: from DM6PR02CA0082.namprd02.prod.outlook.com (2603:10b6:5:1f4::23)
 by BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 13:24:25 +0000
Received: from DS1PEPF0000E63D.namprd02.prod.outlook.com
 (2603:10b6:5:1f4:cafe::8f) by DM6PR02CA0082.outlook.office365.com
 (2603:10b6:5:1f4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 13:24:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E63D.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.13 via Frontend Transport; Mon, 6 Mar 2023 13:24:24 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 6 Mar 2023 07:24:19 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-graphics-maintainer@vmware.com>
Subject: [PATCH v2] drm/ttm: Change the meaning of the fields in the ttm_place
 structure from pfn to bytes
Date: Mon, 6 Mar 2023 18:53:43 +0530
Message-ID: <20230306132343.41254-1-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E63D:EE_|BY5PR12MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 98435ade-5475-4bab-1d70-08db1e461ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W37tg70KGops9qqKhBRUGdqyNBP9xTqiiea5jqnxa67QBHnBkOUQUXeAFR9MGByRc71AizFMd+CuPwYLNK1Iblr+kC8j6jlayk0rFHpHE4FrbhcuY0KAtinhWleLXhv9kJXcN03q9GEfK/E0rhoYuFgE2OeZXr5MgxDZNbSI1bC96Q3wbC2J1GnC5J2X4Ts2jC0l5QcFs3dHPqGw6c0ugLBmszyAxXoaS2lJAzFweS6uJisZ4KB3l6tPCtZKY/ZtaKtj+87bj3aWdgmLm0+Pbj7Qz6tZc8WUIupziWE10JjBaIAJ8CRS4XeQU4bWUJGtTXkNKgNkQqtncu3A+SzF+qccixc2gx6K+56AQzC19ayB0h/fiycWVmRxD55GR/NFBuUuvachgZNKFhUO3r6wj/z95/MY0DzcQkOQ8Wi4wFfTAkCq9zGbCJ4cnSqryV9k9CTd6tEaGekdtlhlFTWKG/iTYWGLh5dmlrbbVrVaGZeCMyMoJk9aewconrssaj4anKXgzKCbkS5ds0+pXE66qxA0b+jdaEPRu53IIP2c3RU0cBAOoLUu4eh+y0yHD//e/qUySwMKoICrvDkalcsrYDHeAv9J4x6z1jg4dw+ANMOLMhcw+LHWtt8LZRNEEcrw0qMet8ebxWCkmSrc3gK3OXA2vN4sC4ptV19KsF/JPcFxjrgApNFVf+7zI4G62o4dE4cYhjaAJ9BAWjyUxlXLHr8E2s8XF45rtWs1m/6/8qhmqnWpqrLVCkidvpr/AKciQNWzspCHDDgpTGwFW/rqYw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199018)(46966006)(40470700004)(36840700001)(8936002)(5660300002)(30864003)(70586007)(70206006)(2906002)(8676002)(4326008)(54906003)(110136005)(316002)(478600001)(7696005)(36756003)(426003)(6666004)(36860700001)(1076003)(47076005)(26005)(2616005)(41300700001)(82310400005)(81166007)(40480700001)(86362001)(82740400003)(83380400001)(40460700003)(356005)(186003)(336012)(16526019)(36900700001)(579004)(559001)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 13:24:24.8011 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98435ade-5475-4bab-1d70-08db1e461ac6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E63D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 arunpravin.paneerselvam@amd.com, shashank.sharma@amd.com,
 michel.daenzer@mailbox.org, arvind.yadav@amd.com,
 stanislaw.gruszka@linux.intel.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ttm_plac structure allows page-based allocation,
to support byte-based allocation using default or custom
ttm_resource_manager_func function like
ttm_range_man_alloc, amdgpu_gtt_mgr_new,
i915_ttm_buddy_man_alloc,nouveau_vram_manager_new etc.
Change the ttm_place structure member fpfn, lpfn, mem_type to
res_start, res_end, res_type.
Change the unsigned to u64.
Fix the dependence in all the DRM drivers and
clean up PAGE_SHIFT operation.

v1 -> v2: fix the bug reviewed by Michel, addressing Stanislaw
missing justification.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  66 ++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  22 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c       |  17 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  40 ++++---
 drivers/gpu/drm/drm_gem_vram_helper.c         |  10 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  22 ++--
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |   2 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 102 ++++++++----------
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c       |  12 +--
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  41 +++----
 drivers/gpu/drm/nouveau/nouveau_mem.c         |  10 +-
 drivers/gpu/drm/qxl/qxl_object.c              |  14 +--
 drivers/gpu/drm/qxl/qxl_ttm.c                 |   8 +-
 drivers/gpu/drm/radeon/radeon_object.c        |  50 ++++-----
 drivers/gpu/drm/radeon/radeon_ttm.c           |  20 ++--
 drivers/gpu/drm/radeon/radeon_uvd.c           |   8 +-
 drivers/gpu/drm/ttm/ttm_bo.c                  |  20 ++--
 drivers/gpu/drm/ttm/ttm_range_manager.c       |  21 ++--
 drivers/gpu/drm/ttm/ttm_resource.c            |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |  46 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |  30 +++---
 include/drm/ttm/ttm_placement.h               |  12 +--
 25 files changed, 293 insertions(+), 305 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 44367f03316f..2cf1e3697250 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -131,11 +131,12 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 		goto err_free;
 	}
 
-	if (place->lpfn) {
+	if (place->res_end) {
 		spin_lock(&mgr->lock);
 		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
-						num_pages, tbo->page_alignment,
-						0, place->fpfn, place->lpfn,
+						num_pages, tbo->page_alignment,	0,
+						place->res_start >> PAGE_SHIFT,
+						place->res_end >> PAGE_SHIFT,
 						DRM_MM_INSERT_BEST);
 		spin_unlock(&mgr->lock);
 		if (unlikely(r))
@@ -219,7 +220,7 @@ static bool amdgpu_gtt_mgr_intersects(struct ttm_resource_manager *man,
 				      const struct ttm_place *place,
 				      size_t size)
 {
-	return !place->lpfn || amdgpu_gtt_mgr_has_gart_addr(res);
+	return !place->res_end || amdgpu_gtt_mgr_has_gart_addr(res);
 }
 
 /**
@@ -237,7 +238,7 @@ static bool amdgpu_gtt_mgr_compatible(struct ttm_resource_manager *man,
 				      const struct ttm_place *place,
 				      size_t size)
 {
-	return !place->lpfn || amdgpu_gtt_mgr_has_gart_addr(res);
+	return !place->res_end || amdgpu_gtt_mgr_has_gart_addr(res);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 283e8fe608ce..2926389e21d4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -130,15 +130,15 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 	u32 c = 0;
 
 	if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
-		unsigned visible_pfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
+		u64 visible_pfn = adev->gmc.visible_vram_size;
 
-		places[c].fpfn = 0;
-		places[c].lpfn = 0;
-		places[c].mem_type = TTM_PL_VRAM;
+		places[c].res_start = 0;
+		places[c].res_end = 0;
+		places[c].res_type = TTM_PL_VRAM;
 		places[c].flags = 0;
 
 		if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
-			places[c].lpfn = visible_pfn;
+			places[c].res_end = visible_pfn;
 		else
 			places[c].flags |= TTM_PL_FLAG_TOPDOWN;
 
@@ -148,9 +148,9 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 	}
 
 	if (domain & AMDGPU_GEM_DOMAIN_GTT) {
-		places[c].fpfn = 0;
-		places[c].lpfn = 0;
-		places[c].mem_type =
+		places[c].res_start = 0;
+		places[c].res_end = 0;
+		places[c].res_type =
 			abo->flags & AMDGPU_GEM_CREATE_PREEMPTIBLE ?
 			AMDGPU_PL_PREEMPT : TTM_PL_TT;
 		places[c].flags = 0;
@@ -158,41 +158,41 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 	}
 
 	if (domain & AMDGPU_GEM_DOMAIN_CPU) {
-		places[c].fpfn = 0;
-		places[c].lpfn = 0;
-		places[c].mem_type = TTM_PL_SYSTEM;
+		places[c].res_start = 0;
+		places[c].res_start = 0;
+		places[c].res_type = TTM_PL_SYSTEM;
 		places[c].flags = 0;
 		c++;
 	}
 
 	if (domain & AMDGPU_GEM_DOMAIN_GDS) {
-		places[c].fpfn = 0;
-		places[c].lpfn = 0;
-		places[c].mem_type = AMDGPU_PL_GDS;
+		places[c].res_start = 0;
+		places[c].res_end = 0;
+		places[c].res_type = AMDGPU_PL_GDS;
 		places[c].flags = 0;
 		c++;
 	}
 
 	if (domain & AMDGPU_GEM_DOMAIN_GWS) {
-		places[c].fpfn = 0;
-		places[c].lpfn = 0;
-		places[c].mem_type = AMDGPU_PL_GWS;
+		places[c].res_start = 0;
+		places[c].res_end = 0;
+		places[c].res_type = AMDGPU_PL_GWS;
 		places[c].flags = 0;
 		c++;
 	}
 
 	if (domain & AMDGPU_GEM_DOMAIN_OA) {
-		places[c].fpfn = 0;
-		places[c].lpfn = 0;
-		places[c].mem_type = AMDGPU_PL_OA;
+		places[c].res_start = 0;
+		places[c].res_end = 0;
+		places[c].res_type = AMDGPU_PL_OA;
 		places[c].flags = 0;
 		c++;
 	}
 
 	if (!c) {
-		places[c].fpfn = 0;
-		places[c].lpfn = 0;
-		places[c].mem_type = TTM_PL_SYSTEM;
+		places[c].res_start = 0;
+		places[c].res_end = 0;
+		places[c].res_type = TTM_PL_SYSTEM;
 		places[c].flags = 0;
 		c++;
 	}
@@ -384,8 +384,8 @@ int amdgpu_bo_create_kernel_at(struct amdgpu_device *adev,
 	ttm_resource_free(&(*bo_ptr)->tbo, &(*bo_ptr)->tbo.resource);
 
 	for (i = 0; i < (*bo_ptr)->placement.num_placement; ++i) {
-		(*bo_ptr)->placements[i].fpfn = offset >> PAGE_SHIFT;
-		(*bo_ptr)->placements[i].lpfn = (offset + size) >> PAGE_SHIFT;
+		(*bo_ptr)->placements[i].res_start = offset;
+		(*bo_ptr)->placements[i].res_end = offset + size;
 	}
 	r = ttm_bo_mem_space(&(*bo_ptr)->tbo, &(*bo_ptr)->placement,
 			     &(*bo_ptr)->tbo.resource, &ctx);
@@ -935,16 +935,16 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u32 domain,
 		bo->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
 	amdgpu_bo_placement_from_domain(bo, domain);
 	for (i = 0; i < bo->placement.num_placement; i++) {
-		unsigned fpfn, lpfn;
+		u64 res_start, res_end;
 
-		fpfn = min_offset >> PAGE_SHIFT;
-		lpfn = max_offset >> PAGE_SHIFT;
+		res_start = min_offset;
+		res_end = max_offset;
 
-		if (fpfn > bo->placements[i].fpfn)
-			bo->placements[i].fpfn = fpfn;
-		if (!bo->placements[i].lpfn ||
-		    (lpfn && lpfn < bo->placements[i].lpfn))
-			bo->placements[i].lpfn = lpfn;
+		if (res_start > bo->placements[i].res_start)
+			bo->placements[i].res_start = res_start;
+		if (!bo->placements[i].res_end ||
+		    (res_end && res_end < bo->placements[i].res_end))
+			bo->placements[i].res_end = res_end;
 	}
 
 	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 2cd081cbf706..1b5c0c1fa7af 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -95,9 +95,9 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
 	struct amdgpu_bo *abo;
 	static const struct ttm_place placements = {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_SYSTEM,
+		.res_start = 0,
+		.res_end = 0,
+		.res_type = TTM_PL_SYSTEM,
 		.flags = 0
 	};
 
@@ -148,8 +148,8 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 			amdgpu_bo_placement_from_domain(abo, AMDGPU_GEM_DOMAIN_VRAM |
 							AMDGPU_GEM_DOMAIN_GTT |
 							AMDGPU_GEM_DOMAIN_CPU);
-			abo->placements[0].fpfn = adev->gmc.visible_vram_size >> PAGE_SHIFT;
-			abo->placements[0].lpfn = 0;
+			abo->placements[0].res_start = adev->gmc.visible_vram_size;
+			abo->placements[0].res_end = 0;
 			abo->placement.busy_placement = &abo->placements[1];
 			abo->placement.num_busy_placement = 1;
 		} else {
@@ -518,9 +518,9 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 		      new_mem->mem_type == TTM_PL_VRAM) ||
 		     (old_mem->mem_type == TTM_PL_VRAM &&
 		      new_mem->mem_type == TTM_PL_SYSTEM))) {
-			hop->fpfn = 0;
-			hop->lpfn = 0;
-			hop->mem_type = TTM_PL_TT;
+			hop->res_start = 0;
+			hop->res_end = 0;
+			hop->res_type = TTM_PL_TT;
 			hop->flags = TTM_PL_FLAG_TEMPORARY;
 			return -EMULTIHOP;
 		}
@@ -932,9 +932,9 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
 	placement.placement = &placements;
 	placement.num_busy_placement = 1;
 	placement.busy_placement = &placements;
-	placements.fpfn = 0;
-	placements.lpfn = adev->gmc.gart_size >> PAGE_SHIFT;
-	placements.mem_type = TTM_PL_TT;
+	placements.res_start = 0;
+	placements.res_end = adev->gmc.gart_size;
+	placements.res_type = TTM_PL_TT;
 	placements.flags = bo->resource->placement;
 
 	r = ttm_bo_mem_space(bo, &placement, &tmp, &ctx);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 632a6ded5735..cbfefbee9bb6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -543,8 +543,8 @@ static void amdgpu_uvd_force_into_uvd_segment(struct amdgpu_bo *abo)
 {
 	int i;
 	for (i = 0; i < abo->placement.num_placement; ++i) {
-		abo->placements[i].fpfn = 0 >> PAGE_SHIFT;
-		abo->placements[i].lpfn = (256 * 1024 * 1024) >> PAGE_SHIFT;
+		abo->placements[i].res_start = 0;
+		abo->placements[i].res_end = 256 * 1024 * 1024;
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index 2fb61410b1c0..3471b4c59161 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -600,20 +600,21 @@ static int amdgpu_vce_validate_bo(struct amdgpu_cs_parser *p,
 	int64_t offset = ((uint64_t)size) * ((int64_t)index);
 	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_bo_va_mapping *mapping;
-	unsigned i, fpfn, lpfn;
+	u64 res_start, res_end;
 	struct amdgpu_bo *bo;
 	uint64_t addr;
+	unsigned int i;
 	int r;
 
 	addr = ((uint64_t)amdgpu_ib_get_value(ib, lo)) |
 	       ((uint64_t)amdgpu_ib_get_value(ib, hi)) << 32;
 	if (index >= 0) {
 		addr += offset;
-		fpfn = PAGE_ALIGN(offset) >> PAGE_SHIFT;
-		lpfn = 0x100000000ULL >> PAGE_SHIFT;
+		res_start = PAGE_ALIGN(offset);
+		res_end = 0x100000000ULL;
 	} else {
-		fpfn = 0;
-		lpfn = (0x100000000ULL - PAGE_ALIGN(offset)) >> PAGE_SHIFT;
+		res_start = 0;
+		res_end = 0x100000000ULL - PAGE_ALIGN(offset);
 	}
 
 	r = amdgpu_cs_find_mapping(p, addr, &bo, &mapping);
@@ -624,9 +625,9 @@ static int amdgpu_vce_validate_bo(struct amdgpu_cs_parser *p,
 	}
 
 	for (i = 0; i < bo->placement.num_placement; ++i) {
-		bo->placements[i].fpfn = max(bo->placements[i].fpfn, fpfn);
-		bo->placements[i].lpfn = bo->placements[i].lpfn ?
-			min(bo->placements[i].lpfn, lpfn) : lpfn;
+		bo->placements[i].res_start = max(bo->placements[i].res_start, res_start);
+		bo->placements[i].res_end = bo->placements[i].res_end ?
+			min(bo->placements[i].res_end, res_end) : res_end;
 	}
 	return ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 9fa1d814508a..813ca0a06d94 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -389,17 +389,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
 	struct amdgpu_vram_mgr_resource *vres;
-	u64 size, remaining_size, lpfn, fpfn;
+	u64 size, remaining_size, res_start, res_end;
 	struct drm_buddy *mm = &mgr->mm;
 	struct drm_buddy_block *block;
 	unsigned long pages_per_block;
 	int r;
 
-	lpfn = (u64)place->lpfn << PAGE_SHIFT;
-	if (!lpfn)
-		lpfn = man->size;
+	res_end = place->res_end;
+	if (!res_end)
+		res_end = man->size;
 
-	fpfn = (u64)place->fpfn << PAGE_SHIFT;
+	res_start = place->res_start;
 
 	max_bytes = adev->gmc.mc_vram_size;
 	if (tbo->type != ttm_bo_type_kernel)
@@ -435,7 +435,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
-	if (fpfn || lpfn != mgr->mm.size)
+	if (res_start || res_end != mgr->mm.size)
 		/* Allocate blocks in desired range */
 		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
@@ -458,7 +458,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 
 		cur_size = size;
 
-		if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
+		if (res_start + size != place->res_end) {
 			/*
 			 * Except for actual range allocation, modify the size and
 			 * min_block_size conforming to continuous flag enablement
@@ -474,13 +474,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 				size = round_up(size, min_block_size);
 			}
 		}
-
-		r = drm_buddy_alloc_blocks(mm, fpfn,
-					   lpfn,
+		r = drm_buddy_alloc_blocks(mm, res_start,
+					   res_end,
 					   size,
 					   min_block_size,
 					   &vres->blocks,
 					   vres->flags);
+
 		if (unlikely(r))
 			goto error_free_blocks;
 
@@ -740,13 +740,11 @@ static bool amdgpu_vram_mgr_intersects(struct ttm_resource_manager *man,
 
 	/* Check each drm buddy block individually */
 	list_for_each_entry(block, &mgr->blocks, link) {
-		unsigned long fpfn =
-			amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
-		unsigned long lpfn = fpfn +
-			(amdgpu_vram_mgr_block_size(block) >> PAGE_SHIFT);
+		u64 res_start  = amdgpu_vram_mgr_block_start(block);
+		u64 res_end = res_start + amdgpu_vram_mgr_block_size(block);
 
-		if (place->fpfn < lpfn &&
-		    (!place->lpfn || place->lpfn > fpfn))
+		if (place->res_start < res_end &&
+		    (!place->res_end || place->res_end > res_start))
 			return true;
 	}
 
@@ -773,13 +771,11 @@ static bool amdgpu_vram_mgr_compatible(struct ttm_resource_manager *man,
 
 	/* Check each drm buddy block individually */
 	list_for_each_entry(block, &mgr->blocks, link) {
-		unsigned long fpfn =
-			amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
-		unsigned long lpfn = fpfn +
-			(amdgpu_vram_mgr_block_size(block) >> PAGE_SHIFT);
+		u64 res_start = amdgpu_vram_mgr_block_start(block);
+		u64 res_end = res_start + amdgpu_vram_mgr_block_size(block);
 
-		if (fpfn < place->fpfn ||
-		    (place->lpfn && lpfn > place->lpfn))
+		if (res_start < place->res_start ||
+		    (place->res_end && res_end > place->res_end))
 			return false;
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 0bea3df2a16d..ffd52e52f663 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -150,12 +150,12 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 	gbo->placement.busy_placement = gbo->placements;
 
 	if (pl_flag & DRM_GEM_VRAM_PL_FLAG_VRAM) {
-		gbo->placements[c].mem_type = TTM_PL_VRAM;
+		gbo->placements[c].res_type = TTM_PL_VRAM;
 		gbo->placements[c++].flags = invariant_flags;
 	}
 
 	if (pl_flag & DRM_GEM_VRAM_PL_FLAG_SYSTEM || !c) {
-		gbo->placements[c].mem_type = TTM_PL_SYSTEM;
+		gbo->placements[c].res_type = TTM_PL_SYSTEM;
 		gbo->placements[c++].flags = invariant_flags;
 	}
 
@@ -163,8 +163,8 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 	gbo->placement.num_busy_placement = c;
 
 	for (i = 0; i < c; ++i) {
-		gbo->placements[i].fpfn = 0;
-		gbo->placements[i].lpfn = 0;
+		gbo->placements[i].res_start = 0;
+		gbo->placements[i].res_start = 0;
 	}
 }
 
@@ -918,7 +918,7 @@ static int bo_driver_move(struct ttm_buffer_object *bo,
 
 	if (!bo->resource) {
 		if (new_mem->mem_type != TTM_PL_SYSTEM) {
-			hop->mem_type = TTM_PL_SYSTEM;
+			hop->res_type = TTM_PL_SYSTEM;
 			hop->flags = TTM_PL_FLAG_TEMPORARY;
 			return -EMULTIHOP;
 		}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 341b94672abc..eae8d7c69c04 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -56,9 +56,9 @@ struct i915_ttm_tt {
 };
 
 static const struct ttm_place sys_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = I915_PL_SYSTEM,
+	.res_start = 0,
+	.res_end = 0,
+	.res_type = I915_PL_SYSTEM,
 	.flags = 0,
 };
 
@@ -132,7 +132,7 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
 			   unsigned int flags)
 {
 	memset(place, 0, sizeof(*place));
-	place->mem_type = intel_region_to_ttm_type(mr);
+	place->res_type = intel_region_to_ttm_type(mr);
 
 	if (mr->type == INTEL_MEMORY_SYSTEM)
 		return;
@@ -140,17 +140,17 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place->flags |= TTM_PL_FLAG_CONTIGUOUS;
 	if (offset != I915_BO_INVALID_OFFSET) {
-		WARN_ON(overflows_type(offset >> PAGE_SHIFT, place->fpfn));
-		place->fpfn = offset >> PAGE_SHIFT;
-		WARN_ON(overflows_type(place->fpfn + (size >> PAGE_SHIFT), place->lpfn));
-		place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
+		WARN_ON(overflows_type(offset, place->res_start));
+		place->res_start = offset;
+		WARN_ON(overflows_type(place->res_start + size, place->res_end));
+		place->res_end = place->res_start + size;
 	} else if (mr->io_size && mr->io_size < mr->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place->flags |= TTM_PL_FLAG_TOPDOWN;
 		} else {
-			place->fpfn = 0;
-			WARN_ON(overflows_type(mr->io_size >> PAGE_SHIFT, place->lpfn));
-			place->lpfn = mr->io_size >> PAGE_SHIFT;
+			place->res_start = 0;
+			WARN_ON(overflows_type(mr->io_size, place->res_end));
+			place->res_end = mr->io_size;
 		}
 	}
 }
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index d030182ca176..544f86dd3d17 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -583,7 +583,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (!bo->resource) {
 		if (dst_mem->mem_type != TTM_PL_SYSTEM) {
-			hop->mem_type = TTM_PL_SYSTEM;
+			hop->res_type = TTM_PL_SYSTEM;
 			hop->flags = TTM_PL_FLAG_TEMPORARY;
 			return -EMULTIHOP;
 		}
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index a72698a2dbc8..2ac29a875c82 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -19,9 +19,9 @@ struct i915_ttm_buddy_manager {
 	struct drm_buddy mm;
 	struct list_head reserved;
 	struct mutex lock;
-	unsigned long visible_size;
-	unsigned long visible_avail;
-	unsigned long visible_reserved;
+	u64 visible_size;
+	u64 visible_avail;
+	u64 visible_reserved;
 	u64 default_page_size;
 };
 
@@ -39,14 +39,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct i915_ttm_buddy_resource *bman_res;
 	struct drm_buddy *mm = &bman->mm;
-	unsigned long n_pages, lpfn;
 	u64 min_page_size;
+	u64 res_end;
 	u64 size;
 	int err;
 
-	lpfn = place->lpfn;
-	if (!lpfn)
-		lpfn = man->size;
+	res_end = place->res_end;
+	if (!res_end)
+		res_end = man->size;
 
 	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
 	if (!bman_res)
@@ -59,7 +59,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		bman_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
 
-	if (place->fpfn || lpfn != man->size)
+	if (place->res_start || res_end != man->size)
 		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
 	GEM_BUG_ON(!bman_res->base.size);
@@ -72,35 +72,32 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
 	GEM_BUG_ON(!IS_ALIGNED(size, min_page_size));
 
-	if (place->fpfn + PFN_UP(bman_res->base.size) != place->lpfn &&
+	if (place->res_start + bman_res->base.size != place->res_end &&
 	    place->flags & TTM_PL_FLAG_CONTIGUOUS) {
-		unsigned long pages;
 
 		size = roundup_pow_of_two(size);
 		min_page_size = size;
 
-		pages = size >> ilog2(mm->chunk_size);
-		if (pages > lpfn)
-			lpfn = pages;
+		if (size  > res_end)
+			res_end = size;
 	}
 
-	if (size > lpfn << PAGE_SHIFT) {
+	if (size > res_end) {
 		err = -E2BIG;
 		goto err_free_res;
 	}
 
-	n_pages = size >> ilog2(mm->chunk_size);
 
 	mutex_lock(&bman->lock);
-	if (lpfn <= bman->visible_size && n_pages > bman->visible_avail) {
+	if (res_end <= bman->visible_size && size > bman->visible_avail) {
 		mutex_unlock(&bman->lock);
 		err = -ENOSPC;
 		goto err_free_res;
 	}
 
-	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
-				     (u64)lpfn << PAGE_SHIFT,
-				     (u64)n_pages << PAGE_SHIFT,
+	err = drm_buddy_alloc_blocks(mm, place->res_start,
+				     res_end,
+				     size,
 				     min_page_size,
 				     &bman_res->blocks,
 				     bman_res->flags);
@@ -115,18 +112,17 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 				     &bman_res->blocks);
 	}
 
-	if (lpfn <= bman->visible_size) {
-		bman_res->used_visible_size = PFN_UP(bman_res->base.size);
+	if (res_end <= bman->visible_size) {
+		bman_res->used_visible_size = bman_res->base.size;
 	} else {
 		struct drm_buddy_block *block;
 
 		list_for_each_entry(block, &bman_res->blocks, link) {
-			unsigned long start =
-				drm_buddy_block_offset(block) >> PAGE_SHIFT;
+			u64 start = drm_buddy_block_offset(block);
 
 			if (start < bman->visible_size) {
-				unsigned long end = start +
-					(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
+				u64 end = start +
+					drm_buddy_block_size(mm, block);
 
 				bman_res->used_visible_size +=
 					min(end, bman->visible_size) - start;
@@ -139,9 +135,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
 	mutex_unlock(&bman->lock);
 
-	if (place->lpfn - place->fpfn == n_pages)
-		bman_res->base.start = place->fpfn;
-	else if (lpfn <= bman->visible_size)
+	if (place->res_end - place->res_start == size)
+		bman_res->base.start = place->res_start;
+	else if (res_end <= bman->visible_size)
 		bman_res->base.start = 0;
 	else
 		bman_res->base.start = bman->visible_size;
@@ -183,28 +179,26 @@ static bool i915_ttm_buddy_man_intersects(struct ttm_resource_manager *man,
 	struct drm_buddy *mm = &bman->mm;
 	struct drm_buddy_block *block;
 
-	if (!place->fpfn && !place->lpfn)
+	if (!place->res_start && !place->res_end)
 		return true;
 
-	GEM_BUG_ON(!place->lpfn);
+	GEM_BUG_ON(!place->res_end);
 
 	/*
 	 * If we just want something mappable then we can quickly check
 	 * if the current victim resource is using any of the CPU
 	 * visible portion.
 	 */
-	if (!place->fpfn &&
-	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
+	if (!place->res_start &&
+	    place->res_end == i915_ttm_buddy_man_visible_size(man))
 		return bman_res->used_visible_size > 0;
 
 	/* Check each drm buddy block individually */
 	list_for_each_entry(block, &bman_res->blocks, link) {
-		unsigned long fpfn =
-			drm_buddy_block_offset(block) >> PAGE_SHIFT;
-		unsigned long lpfn = fpfn +
-			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
+		u64 res_start =	drm_buddy_block_offset(block);
+		u64 res_end = res_start + drm_buddy_block_size(mm, block);
 
-		if (place->fpfn < lpfn && place->lpfn > fpfn)
+		if (place->res_start < res_end && place->res_end > res_start)
 			return true;
 	}
 
@@ -221,23 +215,21 @@ static bool i915_ttm_buddy_man_compatible(struct ttm_resource_manager *man,
 	struct drm_buddy *mm = &bman->mm;
 	struct drm_buddy_block *block;
 
-	if (!place->fpfn && !place->lpfn)
+	if (!place->res_start && !place->res_end)
 		return true;
 
-	GEM_BUG_ON(!place->lpfn);
+	GEM_BUG_ON(!place->res_end);
 
-	if (!place->fpfn &&
-	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
-		return bman_res->used_visible_size == PFN_UP(res->size);
+	if (!place->res_start &&
+	    place->res_end == i915_ttm_buddy_man_visible_size(man))
+		return bman_res->used_visible_size == res->size;
 
 	/* Check each drm buddy block individually */
 	list_for_each_entry(block, &bman_res->blocks, link) {
-		unsigned long fpfn =
-			drm_buddy_block_offset(block) >> PAGE_SHIFT;
-		unsigned long lpfn = fpfn +
-			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
+		u64 res_start =	drm_buddy_block_offset(block);
+		u64 res_end = res_start + drm_buddy_block_size(mm, block);
 
-		if (fpfn < place->fpfn || lpfn > place->lpfn)
+		if (res_start < place->res_start || res_end > place->res_end)
 			return false;
 	}
 
@@ -254,11 +246,11 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 	drm_printf(printer, "default_page_size: %lluKiB\n",
 		   bman->default_page_size >> 10);
 	drm_printf(printer, "visible_avail: %lluMiB\n",
-		   (u64)bman->visible_avail << PAGE_SHIFT >> 20);
+		   (u64)bman->visible_avail >> 20);
 	drm_printf(printer, "visible_size: %lluMiB\n",
-		   (u64)bman->visible_size << PAGE_SHIFT >> 20);
+		   (u64)bman->visible_size  >> 20);
 	drm_printf(printer, "visible_reserved: %lluMiB\n",
-		   (u64)bman->visible_reserved << PAGE_SHIFT >> 20);
+		   (u64)bman->visible_reserved >> 20);
 
 	drm_buddy_print(&bman->mm, printer);
 
@@ -325,7 +317,7 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
 	INIT_LIST_HEAD(&bman->reserved);
 	GEM_BUG_ON(default_page_size < chunk_size);
 	bman->default_page_size = default_page_size;
-	bman->visible_size = visible_size >> PAGE_SHIFT;
+	bman->visible_size = visible_size;
 	bman->visible_avail = bman->visible_size;
 
 	man = &bman->manager;
@@ -396,7 +388,7 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct drm_buddy *mm = &bman->mm;
-	unsigned long fpfn = start >> PAGE_SHIFT;
+	u64 res_start = start;
 	unsigned long flags = 0;
 	int ret;
 
@@ -409,9 +401,9 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 				     &bman->reserved,
 				     flags);
 
-	if (fpfn < bman->visible_size) {
-		unsigned long lpfn = fpfn + (size >> PAGE_SHIFT);
-		unsigned long visible = min(lpfn, bman->visible_size) - fpfn;
+	if (res_start < bman->visible_size) {
+		u64 res_end = res_start + size;
+		u64 visible = min(res_end, bman->visible_size) - res_start;
 
 		bman->visible_reserved += visible;
 		bman->visible_avail -= visible;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
index d64620712830..d00e7dafb21d 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -32,7 +32,7 @@ struct i915_ttm_buddy_resource {
 	struct ttm_resource base;
 	struct list_head blocks;
 	unsigned long flags;
-	unsigned long used_visible_size;
+	u64 used_visible_size;
 	struct drm_buddy *mm;
 };
 
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index b7fbd5abb42a..29b80c735a4c 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -208,26 +208,26 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
 	if (offset != I915_BO_INVALID_OFFSET) {
-		if (WARN_ON(overflows_type(offset >> PAGE_SHIFT, place.fpfn))) {
+		if (WARN_ON(overflows_type(offset, place.res_start))) {
 			ret = -E2BIG;
 			goto out;
 		}
 		place.fpfn = offset >> PAGE_SHIFT;
-		if (WARN_ON(overflows_type(place.fpfn + (size >> PAGE_SHIFT), place.lpfn))) {
+		if (WARN_ON(overflows_type(place.res_start + size, place.res_end))) {
 			ret = -E2BIG;
 			goto out;
 		}
-		place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
+		place.res_end = place.res_start + size;
 	} else if (mem->io_size && mem->io_size < mem->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place.flags |= TTM_PL_FLAG_TOPDOWN;
 		} else {
-			place.fpfn = 0;
-			if (WARN_ON(overflows_type(mem->io_size >> PAGE_SHIFT, place.lpfn))) {
+			place.res_start = 0;
+			if (WARN_ON(overflows_type(mem->io_size, place.res_end))) {
 				ret = -E2BIG;
 				goto out;
 			}
-			place.lpfn = mem->io_size >> PAGE_SHIFT;
+			place.res_end = mem->io_size;
 		}
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index c2ec91cc845d..601d3a38a67e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -353,17 +353,17 @@ set_placement_list(struct ttm_place *pl, unsigned *n, uint32_t domain)
 	*n = 0;
 
 	if (domain & NOUVEAU_GEM_DOMAIN_VRAM) {
-		pl[*n].mem_type = TTM_PL_VRAM;
+		pl[*n].res_type = TTM_PL_VRAM;
 		pl[*n].flags = 0;
 		(*n)++;
 	}
 	if (domain & NOUVEAU_GEM_DOMAIN_GART) {
-		pl[*n].mem_type = TTM_PL_TT;
+		pl[*n].res_type = TTM_PL_TT;
 		pl[*n].flags = 0;
 		(*n)++;
 	}
 	if (domain & NOUVEAU_GEM_DOMAIN_CPU) {
-		pl[*n].mem_type = TTM_PL_SYSTEM;
+		pl[*n].res_type = TTM_PL_SYSTEM;
 		pl[(*n)++].flags = 0;
 	}
 }
@@ -373,7 +373,8 @@ set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	u64 vram_size = drm->client.device.info.ram_size;
-	unsigned i, fpfn, lpfn;
+	u64 res_start, res_end;
+	unsigned int i;
 
 	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CELSIUS &&
 	    nvbo->mode && (domain & NOUVEAU_GEM_DOMAIN_VRAM) &&
@@ -385,19 +386,19 @@ set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
 		 * at the same time.
 		 */
 		if (nvbo->zeta) {
-			fpfn = (vram_size / 2) >> PAGE_SHIFT;
-			lpfn = ~0;
+			res_start = vram_size / 2;
+			res_end = ~0;
 		} else {
-			fpfn = 0;
-			lpfn = (vram_size / 2) >> PAGE_SHIFT;
+			res_start = 0;
+			res_end = vram_size / 2;
 		}
 		for (i = 0; i < nvbo->placement.num_placement; ++i) {
-			nvbo->placements[i].fpfn = fpfn;
-			nvbo->placements[i].lpfn = lpfn;
+			nvbo->placements[i].res_start = res_start;
+			nvbo->placements[i].res_end = res_end;
 		}
 		for (i = 0; i < nvbo->placement.num_busy_placement; ++i) {
-			nvbo->busy_placements[i].fpfn = fpfn;
-			nvbo->busy_placements[i].lpfn = lpfn;
+			nvbo->busy_placements[i].res_start = res_start;
+			nvbo->busy_placements[i].res_end = res_end;
 		}
 	}
 }
@@ -1048,9 +1049,9 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 		     new_reg->mem_type == TTM_PL_VRAM) ||
 		    (old_reg->mem_type == TTM_PL_VRAM &&
 		     new_reg->mem_type == TTM_PL_SYSTEM)) {
-			hop->fpfn = 0;
-			hop->lpfn = 0;
-			hop->mem_type = TTM_PL_TT;
+			hop->res_start = 0;
+			hop->res_end = 0;
+			hop->res_type = TTM_PL_TT;
 			hop->flags = 0;
 			return -EMULTIHOP;
 		}
@@ -1222,7 +1223,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nvkm_device *device = nvxx_device(&drm->client.device);
-	u32 mappable = device->func->resource_size(device, 1) >> PAGE_SHIFT;
+	u64 mappable = device->func->resource_size(device, 1);
 	int i, ret;
 
 	/* as long as the bo isn't in vram, and isn't tiled, we've got
@@ -1245,13 +1246,13 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 			return 0;
 
 		for (i = 0; i < nvbo->placement.num_placement; ++i) {
-			nvbo->placements[i].fpfn = 0;
-			nvbo->placements[i].lpfn = mappable;
+			nvbo->placements[i].res_start = 0;
+			nvbo->placements[i].res_end = mappable;
 		}
 
 		for (i = 0; i < nvbo->placement.num_busy_placement; ++i) {
-			nvbo->busy_placements[i].fpfn = 0;
-			nvbo->busy_placements[i].lpfn = mappable;
+			nvbo->busy_placements[i].res_start = 0;
+			nvbo->busy_placements[i].res_end = mappable;
 		}
 
 		nouveau_bo_placement_set(nvbo, NOUVEAU_GEM_DOMAIN_VRAM, 0);
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 25f31d5169e5..359eee62e7f8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -194,11 +194,10 @@ nouveau_mem_intersects(struct ttm_resource *res,
 		       const struct ttm_place *place,
 		       size_t size)
 {
-	u32 num_pages = PFN_UP(size);
 
 	/* Don't evict BOs outside of the requested placement range */
-	if (place->fpfn >= (res->start + num_pages) ||
-	    (place->lpfn && place->lpfn <= res->start))
+	if (place->res_start >= res->start + size ||
+	   (place->res_end && place->res_end <= res->start))
 		return false;
 
 	return true;
@@ -209,10 +208,9 @@ nouveau_mem_compatible(struct ttm_resource *res,
 		       const struct ttm_place *place,
 		       size_t size)
 {
-	u32 num_pages = PFN_UP(size);
 
-	if (res->start < place->fpfn ||
-	    (place->lpfn && (res->start + num_pages) > place->lpfn))
+	if (res->start < place->res_start ||
+	    (place->res_end && (res->start + size) > place->res_end))
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 06a58dad5f5c..98633861b52c 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -68,28 +68,28 @@ void qxl_ttm_placement_from_domain(struct qxl_bo *qbo, u32 domain)
 	qbo->placement.placement = qbo->placements;
 	qbo->placement.busy_placement = qbo->placements;
 	if (domain == QXL_GEM_DOMAIN_VRAM) {
-		qbo->placements[c].mem_type = TTM_PL_VRAM;
+		qbo->placements[c].res_type = TTM_PL_VRAM;
 		qbo->placements[c++].flags = pflag;
 	}
 	if (domain == QXL_GEM_DOMAIN_SURFACE) {
-		qbo->placements[c].mem_type = TTM_PL_PRIV;
+		qbo->placements[c].res_type = TTM_PL_PRIV;
 		qbo->placements[c++].flags = pflag;
-		qbo->placements[c].mem_type = TTM_PL_VRAM;
+		qbo->placements[c].res_type = TTM_PL_VRAM;
 		qbo->placements[c++].flags = pflag;
 	}
 	if (domain == QXL_GEM_DOMAIN_CPU) {
-		qbo->placements[c].mem_type = TTM_PL_SYSTEM;
+		qbo->placements[c].res_type = TTM_PL_SYSTEM;
 		qbo->placements[c++].flags = pflag;
 	}
 	if (!c) {
-		qbo->placements[c].mem_type = TTM_PL_SYSTEM;
+		qbo->placements[c].res_type = TTM_PL_SYSTEM;
 		qbo->placements[c++].flags = 0;
 	}
 	qbo->placement.num_placement = c;
 	qbo->placement.num_busy_placement = c;
 	for (i = 0; i < c; ++i) {
-		qbo->placements[i].fpfn = 0;
-		qbo->placements[i].lpfn = 0;
+		qbo->placements[i].res_start = 0;
+		qbo->placements[i].res_end = 0;
 	}
 }
 
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 1a82629bce3f..f91a253b88a5 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -52,9 +52,9 @@ static void qxl_evict_flags(struct ttm_buffer_object *bo,
 {
 	struct qxl_bo *qbo;
 	static const struct ttm_place placements = {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_SYSTEM,
+		.res_start = 0,
+		.res_end = 0,
+		.res_type = TTM_PL_SYSTEM,
 		.flags = 0
 	};
 
@@ -145,7 +145,7 @@ static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	if (!old_mem) {
 		if (new_mem->mem_type != TTM_PL_SYSTEM) {
-			hop->mem_type = TTM_PL_SYSTEM;
+			hop->res_type = TTM_PL_SYSTEM;
 			hop->flags = TTM_PL_FLAG_TEMPORARY;
 			return -EMULTIHOP;
 		}
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 10c0fbd9d2b4..bc2199079a4f 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -85,31 +85,31 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
 		 */
 		if ((rbo->flags & RADEON_GEM_NO_CPU_ACCESS) &&
 		    rbo->rdev->mc.visible_vram_size < rbo->rdev->mc.real_vram_size) {
-			rbo->placements[c].fpfn =
-				rbo->rdev->mc.visible_vram_size >> PAGE_SHIFT;
-			rbo->placements[c].mem_type = TTM_PL_VRAM;
+			rbo->placements[c].res_start =
+				rbo->rdev->mc.visible_vram_size;
+			rbo->placements[c].res_type = TTM_PL_VRAM;
 			rbo->placements[c++].flags = 0;
 		}
 
-		rbo->placements[c].fpfn = 0;
-		rbo->placements[c].mem_type = TTM_PL_VRAM;
+		rbo->placements[c].res_start = 0;
+		rbo->placements[c].res_type = TTM_PL_VRAM;
 		rbo->placements[c++].flags = 0;
 	}
 
 	if (domain & RADEON_GEM_DOMAIN_GTT) {
-		rbo->placements[c].fpfn = 0;
-		rbo->placements[c].mem_type = TTM_PL_TT;
+		rbo->placements[c].res_start = 0;
+		rbo->placements[c].res_type = TTM_PL_TT;
 		rbo->placements[c++].flags = 0;
 	}
 
 	if (domain & RADEON_GEM_DOMAIN_CPU) {
-		rbo->placements[c].fpfn = 0;
-		rbo->placements[c].mem_type = TTM_PL_SYSTEM;
+		rbo->placements[c].res_start = 0;
+		rbo->placements[c].res_type = TTM_PL_SYSTEM;
 		rbo->placements[c++].flags = 0;
 	}
 	if (!c) {
-		rbo->placements[c].fpfn = 0;
-		rbo->placements[c].mem_type = TTM_PL_SYSTEM;
+		rbo->placements[c].res_start = 0;
+		rbo->placements[c].res_type = TTM_PL_SYSTEM;
 		rbo->placements[c++].flags = 0;
 	}
 
@@ -118,12 +118,12 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
 
 	for (i = 0; i < c; ++i) {
 		if ((rbo->flags & RADEON_GEM_CPU_ACCESS) &&
-		    (rbo->placements[i].mem_type == TTM_PL_VRAM) &&
-		    !rbo->placements[i].fpfn)
-			rbo->placements[i].lpfn =
-				rbo->rdev->mc.visible_vram_size >> PAGE_SHIFT;
+		    (rbo->placements[i].res_type == TTM_PL_VRAM) &&
+		    !rbo->placements[i].res_start)
+			rbo->placements[i].res_end =
+				rbo->rdev->mc.visible_vram_size;
 		else
-			rbo->placements[i].lpfn = 0;
+			rbo->placements[i].res_end = 0;
 	}
 }
 
@@ -308,13 +308,13 @@ int radeon_bo_pin_restricted(struct radeon_bo *bo, u32 domain, u64 max_offset,
 	radeon_ttm_placement_from_domain(bo, domain);
 	for (i = 0; i < bo->placement.num_placement; i++) {
 		/* force to pin into visible video ram */
-		if ((bo->placements[i].mem_type == TTM_PL_VRAM) &&
+		if ((bo->placements[i].res_type == TTM_PL_VRAM) &&
 		    !(bo->flags & RADEON_GEM_NO_CPU_ACCESS) &&
 		    (!max_offset || max_offset > bo->rdev->mc.visible_vram_size))
-			bo->placements[i].lpfn =
-				bo->rdev->mc.visible_vram_size >> PAGE_SHIFT;
+			bo->placements[i].res_end =
+				bo->rdev->mc.visible_vram_size;
 		else
-			bo->placements[i].lpfn = max_offset >> PAGE_SHIFT;
+			bo->placements[i].res_end = max_offset;
 	}
 
 	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
@@ -726,7 +726,7 @@ vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 	struct ttm_operation_ctx ctx = { false, false };
 	struct radeon_device *rdev;
 	struct radeon_bo *rbo;
-	unsigned long offset, size, lpfn;
+	u64 offset, size, res_end;
 	int i, r;
 
 	if (!radeon_ttm_bo_is_radeon_bo(bo))
@@ -748,12 +748,12 @@ vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 
 	/* hurrah the memory is not visible ! */
 	radeon_ttm_placement_from_domain(rbo, RADEON_GEM_DOMAIN_VRAM);
-	lpfn =	rdev->mc.visible_vram_size >> PAGE_SHIFT;
+	res_end = rdev->mc.visible_vram_size;
 	for (i = 0; i < rbo->placement.num_placement; i++) {
 		/* Force into visible VRAM */
-		if ((rbo->placements[i].mem_type == TTM_PL_VRAM) &&
-		    (!rbo->placements[i].lpfn || rbo->placements[i].lpfn > lpfn))
-			rbo->placements[i].lpfn = lpfn;
+		if ((rbo->placements[i].res_type == TTM_PL_VRAM) &&
+		    (!rbo->placements[i].res_end || rbo->placements[i].res_end > res_end))
+			rbo->placements[i].res_end = res_end;
 	}
 	r = ttm_bo_validate(bo, &rbo->placement, &ctx);
 	if (unlikely(r == -ENOMEM)) {
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 2220cdf6a3f6..5b14597b0ac9 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -83,9 +83,9 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
 				struct ttm_placement *placement)
 {
 	static const struct ttm_place placements = {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_SYSTEM,
+		.res_start = 0,
+		.res_end = 0,
+		.res_type = TTM_PL_SYSTEM,
 		.flags = 0
 	};
 
@@ -105,7 +105,7 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
 			radeon_ttm_placement_from_domain(rbo, RADEON_GEM_DOMAIN_CPU);
 		else if (rbo->rdev->mc.visible_vram_size < rbo->rdev->mc.real_vram_size &&
 			 bo->resource->start < (rbo->rdev->mc.visible_vram_size >> PAGE_SHIFT)) {
-			unsigned fpfn = rbo->rdev->mc.visible_vram_size >> PAGE_SHIFT;
+			u64 res_start = rbo->rdev->mc.visible_vram_size;
 			int i;
 
 			/* Try evicting to the CPU inaccessible part of VRAM
@@ -117,9 +117,9 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
 							 RADEON_GEM_DOMAIN_GTT);
 			rbo->placement.num_busy_placement = 0;
 			for (i = 0; i < rbo->placement.num_placement; i++) {
-				if (rbo->placements[i].mem_type == TTM_PL_VRAM) {
-					if (rbo->placements[i].fpfn < fpfn)
-						rbo->placements[i].fpfn = fpfn;
+				if (rbo->placements[i].res_type == TTM_PL_VRAM) {
+					if (rbo->placements[i].res_start < res_start)
+						rbo->placements[i].res_start = res_start;
 				} else {
 					rbo->placement.busy_placement =
 						&rbo->placements[i];
@@ -237,9 +237,9 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 		     new_mem->mem_type == TTM_PL_VRAM) ||
 		    (old_mem->mem_type == TTM_PL_VRAM &&
 		     new_mem->mem_type == TTM_PL_SYSTEM)) {
-			hop->fpfn = 0;
-			hop->lpfn = 0;
-			hop->mem_type = TTM_PL_TT;
+			hop->res_start = 0;
+			hop->res_end = 0;
+			hop->res_type = TTM_PL_TT;
 			hop->flags = 0;
 			return -EMULTIHOP;
 		}
diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index a2cda184b2b2..7487894c0159 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -307,8 +307,8 @@ void radeon_uvd_force_into_uvd_segment(struct radeon_bo *rbo,
 	int i;
 
 	for (i = 0; i < rbo->placement.num_placement; ++i) {
-		rbo->placements[i].fpfn = 0 >> PAGE_SHIFT;
-		rbo->placements[i].lpfn = (256 * 1024 * 1024) >> PAGE_SHIFT;
+		rbo->placements[i].res_start = 0;
+		rbo->placements[i].res_end = 256 * 1024 * 1024;
 	}
 
 	/* If it must be in VRAM it must be in the first segment as well */
@@ -321,8 +321,8 @@ void radeon_uvd_force_into_uvd_segment(struct radeon_bo *rbo,
 
 	/* add another 256MB segment */
 	rbo->placements[1] = rbo->placements[0];
-	rbo->placements[1].fpfn += (256 * 1024 * 1024) >> PAGE_SHIFT;
-	rbo->placements[1].lpfn += (256 * 1024 * 1024) >> PAGE_SHIFT;
+	rbo->placements[1].res_start += 256 * 1024 * 1024;
+	rbo->placements[1].res_end += 256 * 1024 * 1024;
 	rbo->placement.num_placement++;
 	rbo->placement.num_busy_placement++;
 }
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 882c2fa346f3..4d88b2f796ca 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -51,13 +51,13 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
 {
 	struct drm_printer p = drm_debug_printer(TTM_PFX);
 	struct ttm_resource_manager *man;
-	int i, mem_type;
+	int i, res_type;
 
 	for (i = 0; i < placement->num_placement; i++) {
-		mem_type = placement->placement[i].mem_type;
+		res_type = placement->placement[i].res_type;
 		drm_printf(&p, "  placement[%d]=0x%08X (%d)\n",
-			   i, placement->placement[i].flags, mem_type);
-		man = ttm_manager_type(bo->bdev, mem_type);
+			   i, placement->placement[i].flags, res_type);
+		man = ttm_manager_type(bo->bdev, res_type);
 		ttm_resource_manager_debug(man, &p);
 	}
 }
@@ -531,7 +531,7 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
 			*busy = !ret;
 	}
 
-	if (ret && place && (bo->resource->mem_type != place->mem_type ||
+	if (ret && place && (bo->resource->mem_type != place->res_type ||
 		!bo->bdev->funcs->eviction_valuable(bo, place))) {
 		ret = false;
 		if (*locked) {
@@ -725,7 +725,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
 	struct ww_acquire_ctx *ticket;
 	int ret;
 
-	man = ttm_manager_type(bdev, place->mem_type);
+	man = ttm_manager_type(bdev, place->res_type);
 	ticket = dma_resv_locking_ctx(bo->base.resv);
 	do {
 		ret = ttm_resource_alloc(bo, place, mem);
@@ -777,7 +777,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		const struct ttm_place *place = &placement->placement[i];
 		struct ttm_resource_manager *man;
 
-		man = ttm_manager_type(bdev, place->mem_type);
+		man = ttm_manager_type(bdev, place->res_type);
 		if (!man || !ttm_resource_manager_used(man))
 			continue;
 
@@ -803,7 +803,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 		const struct ttm_place *place = &placement->busy_placement[i];
 		struct ttm_resource_manager *man;
 
-		man = ttm_manager_type(bdev, place->mem_type);
+		man = ttm_manager_type(bdev, place->res_type);
 		if (!man || !ttm_resource_manager_used(man))
 			continue;
 
@@ -1128,7 +1128,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 	 * as an indication that we're about to swap out.
 	 */
 	memset(&place, 0, sizeof(place));
-	place.mem_type = bo->resource->mem_type;
+	place.res_type = bo->resource->mem_type;
 	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
 		return -EBUSY;
 
@@ -1159,7 +1159,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
 		struct ttm_place hop;
 
 		memset(&hop, 0, sizeof(hop));
-		place.mem_type = TTM_PL_SYSTEM;
+		place.res_type = TTM_PL_SYSTEM;
 		ret = ttm_resource_alloc(bo, &place, &evict_mem);
 		if (unlikely(ret))
 			goto out;
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index ae11d07eb63a..88871b5766d2 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -64,12 +64,12 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 	struct ttm_range_mgr_node *node;
 	struct drm_mm *mm = &rman->mm;
 	enum drm_mm_insert_mode mode;
-	unsigned long lpfn;
+	u64 res_end;
 	int ret;
 
-	lpfn = place->lpfn;
-	if (!lpfn)
-		lpfn = man->size;
+	res_end = place->res_end;
+	if (!res_end)
+		res_end = man->size;
 
 	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
 	if (!node)
@@ -85,7 +85,8 @@ static int ttm_range_man_alloc(struct ttm_resource_manager *man,
 	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
 					  PFN_UP(node->base.size),
 					  bo->page_alignment, 0,
-					  place->fpfn, lpfn, mode);
+					  place->res_start >> PAGE_SHIFT,
+					  res_end >> PAGE_SHIFT, mode);
 	spin_unlock(&rman->lock);
 
 	if (unlikely(ret)) {
@@ -119,11 +120,10 @@ static bool ttm_range_man_intersects(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
 	/* Don't evict BOs outside of the requested placement range */
-	if (place->fpfn >= (node->start + num_pages) ||
-	    (place->lpfn && place->lpfn <= node->start))
+	if (place->res_start >= (node->start + size) ||
+	    (place->res_end && place->res_end <= node->start))
 		return false;
 
 	return true;
@@ -135,10 +135,9 @@ static bool ttm_range_man_compatible(struct ttm_resource_manager *man,
 				     size_t size)
 {
 	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
-	u32 num_pages = PFN_UP(size);
 
-	if (node->start < place->fpfn ||
-	    (place->lpfn && (node->start + num_pages) > place->lpfn))
+	if (node->start < place->res_start ||
+	    (place->res_end && (node->start + size) > place->res_end))
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 7333f7a87a2f..c45c50841be3 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -179,7 +179,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 
 	res->start = 0;
 	res->size = bo->base.size;
-	res->mem_type = place->mem_type;
+	res->mem_type = place->res_type;
 	res->placement = place->flags;
 	res->bus.addr = NULL;
 	res->bus.offset = 0;
@@ -187,7 +187,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
 	res->bus.caching = ttm_cached;
 	res->bo = bo;
 
-	man = ttm_manager_type(bo->bdev, place->mem_type);
+	man = ttm_manager_type(bo->bdev, place->res_type);
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->pin_count)
 		list_add_tail(&res->lru, &bo->bdev->pinned);
@@ -225,7 +225,7 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       struct ttm_resource **res_ptr)
 {
 	struct ttm_resource_manager *man =
-		ttm_manager_type(bo->bdev, place->mem_type);
+		ttm_manager_type(bo->bdev, place->res_type);
 	int ret;
 
 	ret = man->func->alloc(man, bo, place, res_ptr);
@@ -330,7 +330,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
 		if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
 			continue;
 
-		if ((res->mem_type == heap->mem_type) &&
+		if ((res->mem_type == heap->res_type) &&
 		    (!(heap->flags & TTM_PL_FLAG_CONTIGUOUS) ||
 		     (res->placement & TTM_PL_FLAG_CONTIGUOUS)))
 			return true;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 82094c137855..e1f34ce1eb1c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -201,7 +201,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	vmw_bo_placement_set(buf,
 			     VMW_BO_DOMAIN_VRAM,
 			     VMW_BO_DOMAIN_VRAM);
-	buf->places[0].lpfn = PFN_UP(bo->resource->size);
+	buf->places[0].res_end = bo->resource->size;
 	ret = ttm_bo_validate(bo, &buf->placement, &ctx);
 
 	/* For some reason we didn't end up at the start of vram */
@@ -287,9 +287,9 @@ void vmw_bo_pin_reserved(struct vmw_bo *vbo, bool pin)
 	if (pin == !!bo->pin_count)
 		return;
 
-	pl.fpfn = 0;
-	pl.lpfn = 0;
-	pl.mem_type = bo->resource->mem_type;
+	pl.res_start = 0;
+	pl.res_end = 0;
+	pl.res_type = bo->resource->mem_type;
 	pl.flags = bo->resource->placement;
 
 	memset(&placement, 0, sizeof(placement));
@@ -752,47 +752,47 @@ set_placement_list(struct ttm_place *pl, u32 domain)
 	 * The placements are ordered according to our preferences
 	 */
 	if (domain & VMW_BO_DOMAIN_MOB) {
-		pl[n].mem_type = VMW_PL_MOB;
+		pl[n].res_type = VMW_PL_MOB;
 		pl[n].flags = 0;
-		pl[n].fpfn = 0;
-		pl[n].lpfn = 0;
+		pl[n].res_start = 0;
+		pl[n].res_end = 0;
 		n++;
 	}
 	if (domain & VMW_BO_DOMAIN_GMR) {
-		pl[n].mem_type = VMW_PL_GMR;
+		pl[n].res_type = VMW_PL_GMR;
 		pl[n].flags = 0;
-		pl[n].fpfn = 0;
-		pl[n].lpfn = 0;
+		pl[n].res_start = 0;
+		pl[n].res_end = 0;
 		n++;
 	}
 	if (domain & VMW_BO_DOMAIN_VRAM) {
-		pl[n].mem_type = TTM_PL_VRAM;
+		pl[n].res_type = TTM_PL_VRAM;
 		pl[n].flags = 0;
-		pl[n].fpfn = 0;
-		pl[n].lpfn = 0;
+		pl[n].res_start = 0;
+		pl[n].res_end = 0;
 		n++;
 	}
 	if (domain & VMW_BO_DOMAIN_WAITABLE_SYS) {
-		pl[n].mem_type = VMW_PL_SYSTEM;
+		pl[n].res_type = VMW_PL_SYSTEM;
 		pl[n].flags = 0;
-		pl[n].fpfn = 0;
-		pl[n].lpfn = 0;
+		pl[n].res_start = 0;
+		pl[n].res_end = 0;
 		n++;
 	}
 	if (domain & VMW_BO_DOMAIN_SYS) {
-		pl[n].mem_type = TTM_PL_SYSTEM;
+		pl[n].res_type = TTM_PL_SYSTEM;
 		pl[n].flags = 0;
-		pl[n].fpfn = 0;
-		pl[n].lpfn = 0;
+		pl[n].res_start = 0;
+		pl[n].res_end = 0;
 		n++;
 	}
 
 	WARN_ON(!n);
 	if (!n) {
-		pl[n].mem_type = TTM_PL_SYSTEM;
+		pl[n].res_type = TTM_PL_SYSTEM;
 		pl[n].flags = 0;
-		pl[n].fpfn = 0;
-		pl[n].lpfn = 0;
+		pl[n].res_start = 0;
+		pl[n].res_end = 0;
 		n++;
 	}
 	return n;
@@ -812,7 +812,7 @@ void vmw_bo_placement_set(struct vmw_bo *bo, u32 domain, u32 busy_domain)
 	if (drm_debug_enabled(DRM_UT_DRIVER) && bo->tbo.resource) {
 		for (i = 0; i < pl->num_placement; ++i) {
 			if (bo->tbo.resource->mem_type == TTM_PL_SYSTEM ||
-			    bo->tbo.resource->mem_type == pl->placement[i].mem_type)
+			    bo->tbo.resource->mem_type == pl->placement[i].res_type)
 				mem_compatible = true;
 		}
 		if (!mem_compatible)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index af8562c95cc3..7005ce47a2b3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -30,23 +30,23 @@
 #include <drm/ttm/ttm_placement.h>
 
 static const struct ttm_place vram_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = TTM_PL_VRAM,
+	.res_start = 0,
+	.res_end = 0,
+	.res_type = TTM_PL_VRAM,
 	.flags = 0
 };
 
 static const struct ttm_place sys_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = TTM_PL_SYSTEM,
+	.res_start = 0,
+	.res_end = 0,
+	.res_type = TTM_PL_SYSTEM,
 	.flags = 0
 };
 
 static const struct ttm_place gmr_placement_flags = {
-	.fpfn = 0,
-	.lpfn = 0,
-	.mem_type = VMW_PL_GMR,
+	.res_start = 0,
+	.res_end = 0,
+	.res_type = VMW_PL_GMR,
 	.flags = 0
 };
 
@@ -59,14 +59,14 @@ struct ttm_placement vmw_vram_placement = {
 
 static const struct ttm_place vram_gmr_placement_flags[] = {
 	{
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = TTM_PL_VRAM,
+		.res_start = 0,
+		.res_end = 0,
+		.res_type = TTM_PL_VRAM,
 		.flags = 0
 	}, {
-		.fpfn = 0,
-		.lpfn = 0,
-		.mem_type = VMW_PL_GMR,
+		.res_start = 0,
+		.res_end = 0,
+		.res_type = VMW_PL_GMR,
 		.flags = 0
 	}
 };
diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
index 8074d0f6cae5..de18b4bd542e 100644
--- a/include/drm/ttm/ttm_placement.h
+++ b/include/drm/ttm/ttm_placement.h
@@ -67,17 +67,17 @@
 /**
  * struct ttm_place
  *
- * @fpfn:	first valid page frame number to put the object
- * @lpfn:	last valid page frame number to put the object
- * @mem_type:	One of TTM_PL_* where the resource should be allocated from.
+ * @res_start:	first valid byte address to put the object
+ * @res_end:	last valid byte address to put the object
+ * @res_type:	One of TTM_PL_* where the resource should be allocated from.
  * @flags:	memory domain and caching flags for the object
  *
  * Structure indicating a possible place to put an object.
  */
 struct ttm_place {
-	unsigned	fpfn;
-	unsigned	lpfn;
-	uint32_t	mem_type;
+	u64		res_start;
+	u64		res_end;
+	uint32_t	res_type;
 	uint32_t	flags;
 };
 
-- 
2.32.0

