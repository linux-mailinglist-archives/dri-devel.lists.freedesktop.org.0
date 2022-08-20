Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA1859AC52
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 09:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C10010E2BE;
	Sat, 20 Aug 2022 07:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D646010E26E;
 Sat, 20 Aug 2022 07:33:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVbGXiiEr3MYy/A+qls0nuHtDBKkqVWLNIBJsOLzlfYBmRZDg4uF1ZVmTdG4wUbpzZSLahvQ0lCMaCuv9d+wjUWzXXOZ8/5zahY1cAiXxnofEMSsQQ9uZ37uCZlEtYS1C8XXFQ1Z6yWZ2zzNUckLKwfK7yU877aqwQnhfSMZ5bDUmgKFWCH2VnsOHQcvkCW0WgRoW6VNy9oNkOXIrjP1evdk948CKOPZwngcL46RZsvnDZWvos3u/RgM+xYknJEo4BzEdzBdLs3a9CJjekTTReyvFV8mZ5km4aiJaKya2A2dIHG/pNggQWBV+ISYlOOyxlfvNrY11QEXZTFc3PVIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YGgqsa8+hfPc3oj9jZRKdiBG2yoW56ue1TfBPO5wU0=;
 b=JEmYwlaox8SolaRkc9ar/YOZtDZziJ0QGjyhrFThvU7GEedL29wQ0/6ubuu6Lo3oF5beMGtQeMa/cFZ8M0X7m00y6Fa50yaNpIrwnhN+NtgtbjaoM8vHR84EdCxITro2ZcYuhZimNpWFbr1kW4yKpU7GXyAgUoo2Q3NgF8DQe6hSLJ+ix5iepBBoMbSjKZRnruB3N+MLnMmV1Yzsfgi8FICjm0prJ75fyoophpRmdzlJJ+kZlSG9NRqNUzCAky4GQXCiIl8NzhZ+WBY281EqMPBJ43qhDwIi+sfdDxc2S+tScLbn0/oQIR5D/v33hHRk0MVzcgUv+otnl21Oq35a1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YGgqsa8+hfPc3oj9jZRKdiBG2yoW56ue1TfBPO5wU0=;
 b=fxTgHNvAR1el2e2CHVzcBlTDOQqph7bXkLv/PdouwjvlmvcuPqK48+RxTVYmcgBixRTq3GEuCHNl1dYqCIc4k1abnpasjrMSo1OOw7mQRsQE84RwLpcH+poq5oDDgg2a501nIb+X5VEC4idKoRBv0vBvSstRVo9s1nurRUzzul8=
Received: from MW4PR03CA0349.namprd03.prod.outlook.com (2603:10b6:303:dc::24)
 by BN6PR12MB1812.namprd12.prod.outlook.com (2603:10b6:404:108::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Sat, 20 Aug
 2022 07:33:40 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::ba) by MW4PR03CA0349.outlook.office365.com
 (2603:10b6:303:dc::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.20 via Frontend
 Transport; Sat, 20 Aug 2022 07:33:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.15 via Frontend Transport; Sat, 20 Aug 2022 07:33:39 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sat, 20 Aug 2022 02:33:36 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v6 4/6] drm/i915: Implement intersect/compatible functions
Date: Sat, 20 Aug 2022 00:33:02 -0700
Message-ID: <20220820073304.178444-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ab1042-4c1f-4357-fdd6-08da827e4d28
X-MS-TrafficTypeDiagnostic: BN6PR12MB1812:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bG6zOJ1aZQ3F4CSxWjMeLtbenOfIy0rQw/Vb0Lhi/66vnAX20TIbNNPG/t/INLN2WbHbzOOR+BzR28HcIAk83PX/ZZhBsuAqMwcMzfir14oxrufd/aUbGIQmsMZnasbHKdgHScCVNeOvdXhtKBy/TsBYh11bPlfNNN83p9cqW9K7EGidTPIfIoNV/AiWtOAgWjaiLuxgEYcy0HA2iUOTfOzqWOhpVE3UISi2JVkDY46AK2nnioTInl+ztw9P/olf1usnvbDAm60C4NdYRaKhjfoOnNeByRUDZ810cOFxLIjYJEFK22W63hu8TZsa/XgXSfPDtaqtEATYJTZv9Yjw+VZO1KXKEjZdArxeUTnL9sK5WBM4pTBa1nAapG7+DSafFg86qdtcZlwkCnPoLECAjZT0kjx98UIKZOPXkegAURl19sOjW4gRmmCiWRI9qxKM/E7tJZqYWCgrzz+J7EFf9VFYAgHTzubiKKYYtKqfuSUzNM1cAm98J2D8LLqg1os6gCJyAn6zsIIsCKZz8n7beSvqtYHWNnWIdY/gJaiOp+NOHnB5kOuxKzsnudmyIBhPWQSQJMlsv32w2Zoi66JLCH6PPPYogXXFwP88Dq+d0y2kcM4hyqC9eogSzw3cVjsIpJou0JPj170GLeRjML4w2P+YYT4PDJkpI0iFOWGsIhbE4/xOofapvH1Co+Knw1VHjsEqqR8dr5Eyp+LqZO3i3m9wQQIZ/be2GgOMyJXKzXzD3dTU4b80aQ3iWDDOjUYsirxtYFj+YShl+MsPtwaIsL1DIyKj5q3Ke0RErvh/xvA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(396003)(40470700004)(36840700001)(46966006)(36860700001)(86362001)(40460700003)(81166007)(356005)(82740400003)(70586007)(70206006)(54906003)(316002)(110136005)(8936002)(2906002)(5660300002)(4326008)(8676002)(186003)(1076003)(83380400001)(2616005)(82310400005)(426003)(336012)(47076005)(16526019)(26005)(478600001)(7696005)(6666004)(40480700001)(41300700001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2022 07:33:39.6493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ab1042-4c1f-4357-fdd6-08da827e4d28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1812
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
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 41 +----------
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 5a5cf332d8a5..bc9c432edffe 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -361,7 +361,6 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 				       const struct ttm_place *place)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
-	struct ttm_resource *res = bo->resource;
 
 	if (!obj)
 		return false;
@@ -378,45 +377,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
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
index 427de1aaab36..e19452f0e100 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -173,6 +173,77 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
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
@@ -200,6 +271,8 @@ static void i915_ttm_buddy_man_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func i915_ttm_buddy_manager_func = {
 	.alloc = i915_ttm_buddy_man_alloc,
 	.free = i915_ttm_buddy_man_free,
+	.intersects = i915_ttm_buddy_man_intersects,
+	.compatible = i915_ttm_buddy_man_compatible,
 	.debug = i915_ttm_buddy_man_debug,
 };
 
-- 
2.25.1

