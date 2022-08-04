Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 275BB5899A7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102DF92609;
	Thu,  4 Aug 2022 09:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D1A9264E;
 Thu,  4 Aug 2022 09:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eU3DWMcYg+XqNbLciaPZ9dryhw+QoAfXuS57A6FnMZmie7G2NRZMlfaxjt8OyMN0/hCk0ySprR1oJcN+vTkn72Hv0ZGb3ogyd3soLCjsXzpwcGS5k0ZHlE9/xsoJCqm2OrDWYjcrPz9YdRkl2fe+WGer1xNsR1/MtKU1IxLz2UGzxcKBKvepYSQS46SsCOk6a3AyiQswp/BGip3MeezkRL35TZ7n9DJQ6cTkZ/DmydtHnV6ss+2GL+ohj8DRXxT7rndaziapFtJ/ab2vP6VKuS+pdnTYyFECw5IkWgcxBxDz5Y7Z1Pu+cmt5S+80PjLFL3Ar4Gn0MUVy11WTthRMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P9tpxEaB9H+0VuEg7QtLVPr4IenZyBgrAZNW10uBIA=;
 b=HlOgdlISGtO++QEHqGPa5byyoh7v+oFAy67mphr2lGnqtg9Yk51ILliqhRC777pJj+l2QaXC38UXvm8hfwwLh5zgn5ivqBIaXA5f8ZCz5u0zpEkpKRkS91qrxsyfCOZ0Ugf+7f1HxGx7c4RORe4y6slzm+WcQYyy1kkkQjs06xLcH6UYLKM/pN/CkoP52yWf54VJfBFcsvgwEo8x5vxSK/daYrmwaj60LP4GKtYr0m6PZjLCUlajegymkU/YOZ1H6DSsN+hSH+G4CeCdIjI8/Ki3VCuPwoDM2f/Tc3AOpwpC169NGDVKaqcE/SGEHCbTkIJbP6blIUNzclZs9E0L0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3P9tpxEaB9H+0VuEg7QtLVPr4IenZyBgrAZNW10uBIA=;
 b=t1bvsnreYLURjo1mEJrYMjiStAlHlI42NOG/EtMw5cIlYZ+VpzHMjdfMXLGhXi87zzofLlr+AvCeoVdG+KRVO+Yr/WNfOaTgIC49/sD8UgNUR1/7dpq7qZnCg6SWMFyktpEjfNmYxkx5t9nSPq0VlqnWYpzvtabcqJoKfSDF50s=
Received: from DS7PR03CA0118.namprd03.prod.outlook.com (2603:10b6:5:3b7::33)
 by BL0PR12MB5692.namprd12.prod.outlook.com (2603:10b6:208:8e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Thu, 4 Aug
 2022 09:00:24 +0000
Received: from DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::bd) by DS7PR03CA0118.outlook.office365.com
 (2603:10b6:5:3b7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16 via Frontend
 Transport; Thu, 4 Aug 2022 09:00:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT047.mail.protection.outlook.com (10.13.172.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 09:00:24 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 04:00:20 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 4/6] drm/i915: Implement intersect/compatible functions
Date: Thu, 4 Aug 2022 01:59:50 -0700
Message-ID: <20220804085952.6137-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220804085952.6137-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220804085952.6137-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76031d69-0c19-4027-d007-08da75f7c4a9
X-MS-TrafficTypeDiagnostic: BL0PR12MB5692:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4LL10k8AvdpXxtmBOyIyvksije/JmJOB0qOKiaWv6urguqGNRXaW2T1t9CwyIA7UrGtRewSuqVqVYGFYYMWFxnu1eHPy7xrBSF5yXGKW9pTkSeAkMtW7/ZbmrOb+vAG8YOOIuoeZeQJt1hF5B2Le1IGPMY7GcBGLH0QM6DPBBvb2yxtnw21gPRLwwDE08SZYFns0MukL23RQEgbSb8ivsLUcSGQA0LNVQS3uzuYvyEXuaki2hajniYqqKP4db0YDgqduZMMI2CtbfWCeE9Yy8LGx689bnLevGhrZvTKniDuaBhktiSfO+ph53UcT7MNDFIyTXJs0ishC49Mf345+nMghkyc4lgOhaZXXsWq4BaS6YA9WRPiK0oBsxB8Zes+oFID28TMNojZ1/mAFeu42pwYZ4viCuCILHImn5pW01kw1Hbs4D84+zqCM7bsFlqwMrC92I7IplRLaHXIV+Ym9VkW5W6+/8k5IB6LxkBQ18ObAU7YzqGnJV/dHTmiwn1px6/ifkzMGAO6obIcZLpIuWuPCvOtpXRXKbUoq8c7TEUdkZXV3dzaA1bczXtNs2k7sldJvO7vTmflumBSQccctuIhJz/UjcQJ5Hnqjx/DrgpCG80O+FBZVutjxmEvihDAIw0ApEqu0a0dKk1+/NxptjiB1Th9bJaB/Xa3RPGvIIpDB9Md3rrPSJrlrAE2h+d7D0YuZT5IzbmGzV9QvQIDIv6vR9sqpbbhDC8yiAeTzFtNgmbHbki7mhxiLY9uLnaV4oKan+3/R8s/pa6noaKDRbsLQJfORtu7bgPLEuZjgfodFLoJKJvnQVtaOgiwFKQmZ2URtzNodh0Z1oUsDkguNmw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(376002)(40470700004)(46966006)(36840700001)(8676002)(83380400001)(16526019)(4326008)(2616005)(1076003)(186003)(36860700001)(36756003)(70586007)(8936002)(70206006)(5660300002)(2906002)(356005)(478600001)(6666004)(7696005)(40480700001)(316002)(41300700001)(54906003)(26005)(110136005)(86362001)(82310400005)(426003)(40460700003)(47076005)(82740400003)(81166007)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 09:00:24.2244 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76031d69-0c19-4027-d007-08da75f7c4a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5692
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implemented a new intersect and compatible callback function
fetching start offset from drm buddy allocator.

v3: move the bits that are specific to buddy_man (Matthew)
v4: consider the block size /range (Matthew)

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 41 +----------
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 70e2ed4e99df..bf5fd6886ca0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -379,7 +379,6 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 				       const struct ttm_place *place)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
-	struct ttm_resource *res = bo->resource;
 
 	if (!obj)
 		return false;
@@ -396,45 +395,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 	if (!i915_gem_object_evictable(obj))
 		return false;
 
-	switch (res->mem_type) {
-	case I915_PL_LMEM0: {
-		struct ttm_resource_manager *man =
-			ttm_manager_type(bo->bdev, res->mem_type);
-		struct i915_ttm_buddy_resource *bman_res =
-			to_ttm_buddy_resource(res);
-		struct drm_buddy *mm = bman_res->mm;
-		struct drm_buddy_block *block;
-
-		if (!place->fpfn && !place->lpfn)
-			return true;
-
-		GEM_BUG_ON(!place->lpfn);
-
-		/*
-		 * If we just want something mappable then we can quickly check
-		 * if the current victim resource is using any of the CPU
-		 * visible portion.
-		 */
-		if (!place->fpfn &&
-		    place->lpfn == i915_ttm_buddy_man_visible_size(man))
-			return bman_res->used_visible_size > 0;
-
-		/* Real range allocation */
-		list_for_each_entry(block, &bman_res->blocks, link) {
-			unsigned long fpfn =
-				drm_buddy_block_offset(block) >> PAGE_SHIFT;
-			unsigned long lpfn = fpfn +
-				(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
-
-			if (place->fpfn < lpfn && place->lpfn > fpfn)
-				return true;
-		}
-		return false;
-	} default:
-		break;
-	}
-
-	return true;
+	return ttm_bo_eviction_valuable(bo, place);
 }
 
 static void i915_ttm_evict_flags(struct ttm_buffer_object *bo,
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index a5109548abc0..9def01d5f368 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -178,6 +178,77 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 	kfree(bman_res);
 }
 
+static bool i915_ttm_buddy_man_intersects(struct ttm_resource_manager *man,
+					  struct ttm_resource *res,
+					  const struct ttm_place *place,
+					  size_t size)
+{
+	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
+	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
+	struct drm_buddy *mm = &bman->mm;
+	struct drm_buddy_block *block;
+
+	if (!place->fpfn && !place->lpfn)
+		return true;
+
+	GEM_BUG_ON(!place->lpfn);
+
+	/*
+	 * If we just want something mappable then we can quickly check
+	 * if the current victim resource is using any of the CP
+	 * visible portion.
+	 */
+	if (!place->fpfn &&
+	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
+		return bman_res->used_visible_size > 0;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &bman_res->blocks, link) {
+		unsigned long fpfn =
+			drm_buddy_block_offset(block) >> PAGE_SHIFT;
+		unsigned long lpfn = fpfn +
+			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
+
+		if (place->fpfn < lpfn && place->lpfn > fpfn)
+			return true;
+	}
+
+	return false;
+}
+
+static bool i915_ttm_buddy_man_compatible(struct ttm_resource_manager *man,
+					  struct ttm_resource *res,
+					  const struct ttm_place *place,
+					  size_t size)
+{
+	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
+	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
+	struct drm_buddy *mm = &bman->mm;
+	struct drm_buddy_block *block;
+
+	if (!place->fpfn && !place->lpfn)
+		return true;
+
+	GEM_BUG_ON(!place->lpfn);
+
+	if (!place->fpfn &&
+	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
+		return bman_res->used_visible_size == res->num_pages;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &bman_res->blocks, link) {
+		unsigned long fpfn =
+			drm_buddy_block_offset(block) >> PAGE_SHIFT;
+		unsigned long lpfn = fpfn +
+			(drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
+
+		if (fpfn < place->fpfn || lpfn > place->lpfn)
+			return false;
+	}
+
+	return true;
+}
+
 static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 				     struct drm_printer *printer)
 {
@@ -205,6 +276,8 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
 	.alloc = i915_ttm_buddy_man_alloc,
 	.free = i915_ttm_buddy_man_free,
+	.intersects = i915_ttm_buddy_man_intersects,
+	.compatible = i915_ttm_buddy_man_compatible,
 	.debug = i915_ttm_buddy_man_debug,
 };
 
-- 
2.25.1

