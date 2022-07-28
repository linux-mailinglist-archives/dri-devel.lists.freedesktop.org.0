Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA24B584184
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33A4113661;
	Thu, 28 Jul 2022 14:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7F310E175;
 Thu, 28 Jul 2022 14:34:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuJoyEaYpo3IK8+DAwOS5YTZnJydAnTE2DsdHRv3VzAVgvWtlR3/+UUX0xFkDL8sh7tHbVzWQUKZlWrtWLP+0aNiULYTbhq2GYTkGr1x8n5PiJB0RN5TcHcwczwyB9dW7l8htuz/GUQ6fqG+oSRPaSLyV+4a8d5u5gN73T2sXdjkjEQm7ZKHfpRSLTWIf1QPPl6fr1jNYV/+GBnLmJRg3PdrQ194+FHCxmCu6zlEKaQSQ5rZNr2S3jyw11EWAycqWvHFgwq6CBKemV470G/I4lzdGX3V0aJFPsBJ1mORV/yGVFOIePZ41F6zTkkj1nB1RP/05WCiybmFLsQqgucP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlQU8N9o4xcYU7E3SQCd1aZWdyux9rh/qHLE1sWMmZA=;
 b=Jh1oBfADZZ0iy+3j0nOeIbKnVXoNeVY47RoAuKDAzLF3TZbdSLDyNIPdO8E0dcLBhxgVv7fCIHQ+vTSNIhQkDkKT3s14QayK/yOaMkyTwukvKCmkV5vax1Og/m4e5cSqZR+QX7MbN0okrcgX+Gdc5ue7vUlaCWjG5faDU23Og8oWjmkQYZXZ9oQ0uM1yLxNbYdj9C0cQRXT5j/ZeE/NRxWmL1ECJvB2cOErtmT4soOuU9EV3s0Hfu/jWUrfSSdmT9QSXg2uze2X7v/xKMkSXhPc/Uhf/h90iGzJUcGjTMLcm2RaBQnmkfHdJhYWfQ3mJF8DtTAC49osm7C4xBboseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlQU8N9o4xcYU7E3SQCd1aZWdyux9rh/qHLE1sWMmZA=;
 b=NmdyM+hj/hYW6oMGn/WECszB+NUprnzE8TvUYi9rrSMiutrQ143AqmhtaR09STWt1AS4OC5o/OD7EqS9AVRziKXn3yaJNAkPlfVn0izFT/ii3KOV7w4FkGq/NEvRte6PDYtuP+uGbInB7v8uTAITl/Pa4pDianh4xwIzYTabuRs=
Received: from MW2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:907::24) by
 MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 14:34:22 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::ae) by MW2PR16CA0011.outlook.office365.com
 (2603:10b6:907::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 14:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5482.11 via Frontend Transport; Thu, 28 Jul 2022 14:34:22 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 28 Jul 2022 09:34:18 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 4/6] drm/i915: Implement intersect/compatible functions
Date: Thu, 28 Jul 2022 07:33:13 -0700
Message-ID: <20220728143315.968590-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220728143315.968590-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c81635b-4da5-4952-62f9-08da70a64356
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4x2D1Lx5ynnwfIBFtJj/Ws2xabMYiKdAAopIdgtAD3FqLoNXLM4PwlrjptWDlEkOhBE5Ug2AlzyG119FBf1zTLw9ZUrIk5pQB9HuBL51c8Na5T4++IUKBV4i6TlrbTITSHZy6PdYOUKXUv/aJUEMd2mRos9rHWJyRU4BIBtTnxHwXzJRbddzwmb+XXtJqElCiY11IseW2QHKqSxX43BYNew/4areo9sZNnzILNYleCkFVGzYNsice7XoggmDvCsAwA7UAQ0/lEDEJpjo/uMVN+ZoZUJzKzdjp7astgCTUlSAuGbGP1z1CWa8akLpPlK8QM7lqquS58bEunrsCueFX2L1ioNL1NFTD6VSad2r+ApLyoQfScVqvIYoYuBgckTXWmznQ1hrgjXWM7wIrjte5dKQNgl6+4iDrhnippFXw8s+pEHuMHaiIHdtwErL+zA2xaCYwZsFJditgS3jZ1frdEnTi1Z5wQRLrbeTbOhsw54JaSH6X8X82rm76+lfMMMFsk5FJIYHh2dK0WMtgekU6u1zdyZouewQJoCZuegIe1KasAFmhVWj08VCpbA5horneGa2+wCYmJwhmYfBgPuVXT1UenanuMaSpEgLxxJWcyBTJxqMVWGKPORXsyDdJAl8stNtisPLSA6ZJu+HI0izrn6uYkmPJQiRL+AZzpvKvWTJ+ncfjCqBVW2clyGu4Jv0+JcZAgxL4lCIcPzj9IIUq0uTiPyfZTOHIaRvPu+slNuQKKfRZhinmOZVPTUFsA5Q2+skDUkd4v65GCkS8qP7no9UIBNKyluBciXFYTDAXlvVhSybWIirneJhgKoRxzHRd6HfuEO2OVE5dOQnY4vEdg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(40470700004)(46966006)(41300700001)(6666004)(7696005)(478600001)(40480700001)(82310400005)(2906002)(36756003)(86362001)(26005)(54906003)(316002)(110136005)(4326008)(356005)(82740400003)(81166007)(186003)(16526019)(1076003)(2616005)(336012)(47076005)(426003)(5660300002)(8676002)(70206006)(70586007)(40460700003)(8936002)(83380400001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 14:34:22.0932 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c81635b-4da5-4952-62f9-08da70a64356
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
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

v2: move the bits that are specific to buddy_man (Matthew)

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 39 +-----------
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 62 +++++++++++++++++++
 2 files changed, 64 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 70e2ed4e99df..54eead15d74b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -396,43 +396,8 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
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
+	if (res->mem_type == I915_PL_LMEM0)
+		return ttm_bo_eviction_valuable(bo, place);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index a5109548abc0..9d2a31154d58 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -178,6 +178,66 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
 	kfree(bman_res);
 }
 
+static bool i915_ttm_buddy_man_intersect(struct ttm_resource_manager *man,
+					 struct ttm_resource *res,
+					 const struct ttm_place *place,
+					 size_t size)
+{
+	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
+	u32 start, num_pages = PFN_UP(size);
+	struct drm_buddy_block *block;
+
+	if (!place->fpfn && !place->lpfn)
+		return true;
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
+		start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
+		/* Don't evict BOs outside of the requested placement range */
+		if (place->fpfn >= (start + num_pages) ||
+		    (place->lpfn && place->lpfn <= start))
+			return false;
+	}
+
+	return true;
+}
+
+static bool i915_ttm_buddy_man_compatible(struct ttm_resource_manager *man,
+					  struct ttm_resource *res,
+					  const struct ttm_place *place,
+					  size_t size)
+{
+	struct i915_ttm_buddy_resource *bman_res = to_ttm_buddy_resource(res);
+	u32 start, num_pages = PFN_UP(size);
+	struct drm_buddy_block *block;
+
+	if (!place->fpfn && !place->lpfn)
+		return true;
+
+	if (!place->fpfn &&
+	    place->lpfn == i915_ttm_buddy_man_visible_size(man))
+		return bman_res->used_visible_size == res->num_pages;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &bman_res->blocks, link) {
+		start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
+		if (start < place->fpfn ||
+		    (place->lpfn && (start + num_pages) > place->lpfn))
+			return false;
+	}
+
+	return true;
+}
+
 static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 				     struct drm_printer *printer)
 {
@@ -205,6 +265,8 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
 	.alloc = i915_ttm_buddy_man_alloc,
 	.free = i915_ttm_buddy_man_free,
+	.intersects = i915_ttm_buddy_man_intersect,
+	.compatible = i915_ttm_buddy_man_compatible,
 	.debug = i915_ttm_buddy_man_debug,
 };
 
-- 
2.25.1

