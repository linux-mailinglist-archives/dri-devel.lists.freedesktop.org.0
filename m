Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134E658D680
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C79D904E1;
	Tue,  9 Aug 2022 09:24:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0435C11226D;
 Tue,  9 Aug 2022 09:23:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5lKkbaJHUdb7gjAH8d3CWuaJmKq5+3Z5EdqHwjFt6pidsKMbtIEX21Lpc1FGCfw+3faJP66ewYNz6E5iUNXZbaf3pAKbsfwSPkVN0k6h+9vEKJeSRfrF7YkmiH0v6dURL17NL+mfuMYMbsm/l6yWhcs3oM3lTZSpU0q5EF+n1nOGeuWJfjUIeh5KTzpTTr6IaPi9gfdbMyKoYZ4+sPqff8Vk7X6VRda0qBP3YKJrdd9WMlHx2XWJBUHjIsCAdgMFBueWfzVCmZCTZ6EFqMek2CMrqEM+gPs2QeYBOkwVnrBjbPH75ouRpM/4XzixcbPQ0Yit70fG9wjdt3IJBtdzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH1z88cU1KioknbxoZoSI6DcQOJrItFETDvKaYpgLGs=;
 b=W0+RDNU6pytQGdYikTXpWG49Nz5aR38MbSXdqJqyVzHMmUVozTS4kVilNWnykSmF5i/a5ONMuS2Lhk1CKtcO1Hy6Pi4JtChKG6fNjVIIlq80hwMjE5UcikXkjeoikXuPIlQHujHTkv2ZS5/UMTP9C/JL7YfKFRtNMS1B8OImtuJwp43NyYmznmw2cUxhtuCppVj4hWWEpYnvyTVaP8t/P6tL7EUiJs/sx+8sE9bu9xcPAE7zy96tG7EPFWV5ig01dNRtI15xe3Vt4Y3j1hEIqFxPtEKvCVNjmF4ThlusOrsoq2seR65de8qJBNVzgxG/x3vJQ7VGc4DPAtzufpx+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mH1z88cU1KioknbxoZoSI6DcQOJrItFETDvKaYpgLGs=;
 b=SqsT47VOqQkOz6cSrNhAF7LYP7Eo2VXlR4zsn+KTKPOSFSNI4Ej8QN3KRZWjTqwMpjYkRLZl6P6xohZDNhbZ0K1z0Bp7h/Kv6476eMrtCApivgjreIpzECvw/wQmv4nwG2HZ7kBk0HCX7GJ9YiVjgtlsZNjyUcu3IDyy+Q5g3oA=
Received: from MW4PR04CA0360.namprd04.prod.outlook.com (2603:10b6:303:8a::35)
 by CH0PR12MB5187.namprd12.prod.outlook.com (2603:10b6:610:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 09:23:34 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::b2) by MW4PR04CA0360.outlook.office365.com
 (2603:10b6:303:8a::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18 via Frontend
 Transport; Tue, 9 Aug 2022 09:23:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Tue, 9 Aug 2022 09:23:34 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 04:23:27 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v5 4/6] drm/i915: Implement intersect/compatible functions
Date: Tue, 9 Aug 2022 02:22:28 -0700
Message-ID: <20220809092230.2808-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220809092230.2808-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220809092230.2808-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eae84a76-60a6-46db-7ac6-08da79e8d52c
X-MS-TrafficTypeDiagnostic: CH0PR12MB5187:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3XBXK9zg+cYWufpeZKQjlZz8DYRhHFghXvcQ51JU89mm4vR9pIlN/FLDgqP6pPvKgfMWhU14jU9b8KY2uYml4myDc9tEvG8MZmIarMvlwQ3xdDTX1B+akzhm9/U9cN/qpJUQa/a7NYDhIDRsNxueyraxnwZXmE2C6Mx7iULDqGiJGxJoF/HQgdzEOrcX05LznrEHZAZCaBwRuRdyuePUmClLuDoVoWstuhXYvts7zU7kBBf4kN2F3oR1hlVhvrBW4pZH8Xp8hZ7N8Lh9pcZW8rCX+j5TSjL2b3BOUZQ49P1H3OjKP7xGfwYpd1rDIQ3MXyg8kHJq4pPb28G9XAKtjpeCnsb1i8quOEzs+9JyV/FDRyqEtQPqyKArrrIyLmZ+P9N7hhs2y6s3uOeO/Zl8zWK0i7/mq7jYGL4n8bi89ZP8M2L4/1vJM9RJ5AwdGae/agRtUia12fCrTnhxJ4smUdnhq7s68WbtWuGJvDaSMHk8LgNQ2k5ncHhk/BnSwwoU3pv0Ivl2VZgXGrXKIGXYpclJGxhO9Nx6CfhNKeicb4FZ+qdn4JqejXtMPesyE/t6Y3QnG9rJdmeJjbjJNYPYjOf8kpnFYQY8qV0FJW0O0np/uIsqS67mQTm36iPSWDiFUZIReWSTCuCGnleBTIveOrf0a8nkXv85mqozAU+P0IyHUMDAOG4Tg57rukx8MWIMTP1gyjOz6fkLqFYYzr51fjrPdv3rexEyE4foNpOe+RCrAChKs83H5qEqF+l6ba4lvTxjWfGhlzRnbOuoWZ7MHHzAEGHZzqkEUltmj/jl8rnIkmLAQ/KnCtU9bK65JIZsIoOUcVVDbGzBd5a1XqC41g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(83380400001)(41300700001)(7696005)(70586007)(8676002)(4326008)(70206006)(40480700001)(316002)(1076003)(186003)(16526019)(336012)(426003)(110136005)(26005)(82740400003)(54906003)(47076005)(82310400005)(86362001)(36756003)(2906002)(2616005)(40460700003)(8936002)(81166007)(478600001)(356005)(36860700001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:23:34.0307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eae84a76-60a6-46db-7ac6-08da79e8d52c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5187
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
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
index a5109548abc0..56d017e4038b 100644
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
+	 * if the current victim resource is using any of the CPU
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

