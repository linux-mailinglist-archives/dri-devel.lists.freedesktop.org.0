Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A376591186
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFAEB3751;
	Fri, 12 Aug 2022 13:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A13B36C1;
 Fri, 12 Aug 2022 13:31:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hI/J6XWb8raYZm6aKTUGbpRMScvf6qDZINEA7cvfYUMxhjkrqA++71EU9Qy2pjpXqixAshRIzUDpezgc9JJ6O3rshIqrxPvGheoW7u1CnxihteOKjCO97zHP2dQjBEntEWknVrh7KpvbmeCAIWFY+znDaUmQ8rWl3CvhrpoPdujiTyukE/8wY6Pw9gdXWWaBIxlUtrPRIGIF4R2cB19sp6vdqRdS3y+F/Qx+oLeBwHyGF/+FSsuSVAM5CykFGVo+N1qvuqT3rfAMP2iY6qbakpmavIzXgC3l6PWOxiHqhthIef37jInd1abxzODo9Nq/mu3Jmw2Y5ZmejXiKFoCRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scMOqfcP1qGowKeT/jRiEGcVMFV36S/FsQ8WLNECLhc=;
 b=SJS1jdA0IExAzcvNMJ/uhW1L5lxmxpm6ZiuBLrEnJVp0Z4GA8vGS8OUJT0U+X/WFOlVYp/vbaWp/2h9JuEDsFx8ycS3gahTn0BIvEvyGpQXNC7w6KC+/tPC9wdoV+SwU3SoPOaEE62ulsTjaIH9/0LJnVzlVlXO7Nbl61LW5YepC29CwFyge0HyRQyH2neMZiMOvV9mztD2yYz7t8hiaq2NAoGsQ8Nk8Cuj5blK0JNMkwrk8c3E78X9f6o/Gvcj7bwMhA9Z68lhCN8Z3c2hCTiAhQYO3DWSHTLjLIMqajoq918+Kf2/AFSbBPTjHWXLTqtAWlYNRoC9vENJXydtdYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scMOqfcP1qGowKeT/jRiEGcVMFV36S/FsQ8WLNECLhc=;
 b=3pko2RZCTFqsIm31UcJQX/+scQvNmrO20lEeFz026itAlfXonS1/4jT95EhPQxnEwIC/Ml66rY/PuWZzKSc7u+6aRLSlZZ7mtKCaznsKQfC+aylAt7RdngyZaYOD5dZo9EltQ8aeqID+D91fUuEoIKxuEltfsseKVWdCMaAi260=
Received: from DM6PR17CA0026.namprd17.prod.outlook.com (2603:10b6:5:1b3::39)
 by BN7PR12MB2772.namprd12.prod.outlook.com (2603:10b6:408:26::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 13:31:52 +0000
Received: from DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::be) by DM6PR17CA0026.outlook.office365.com
 (2603:10b6:5:1b3::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.19 via Frontend
 Transport; Fri, 12 Aug 2022 13:31:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT080.mail.protection.outlook.com (10.13.173.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Fri, 12 Aug 2022 13:31:52 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 08:31:22 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 4/6] drm/i915: Implement intersect/compatible functions
Date: Fri, 12 Aug 2022 06:30:46 -0700
Message-ID: <20220812133048.2814-4-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25e5cab8-17db-4f75-6337-08da7c670470
X-MS-TrafficTypeDiagnostic: BN7PR12MB2772:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBkEFgPDJtKGosgh59HhRfNtTA7N2Sn3h8XljjxB6OSWtENYE3OezkahICeXWaBpaOx43dcJOputHMwrct1/zUbmlaehMvme6Q2KhXqOfs3OEE524HP8sYICBzn2D7R3vXfAl6iKEUbsjYrD56lYe9Y5zBX7zrPf+gOX2GY54GHmkVDWKBVmZkLJTIQI7fNM/QGcb+7d/K28hiy8YkO784lHhCd3fcxGwhj+fYK4nR97KI9PExyVk//Ea9x7TNrlh7vgqpPOBicER3HeTZC6xveRXFV59bEE3Ek6b+28kndkgBqwg1tZz+D5WPEMMcId+vsqFJsHTeAp02RdQPzTwegF3PZMMpMCNgwmc6eFi912k4GavlltDoIFfz/mbLu3IuruzB4I3NGRTlshVE2nn/5KSVXknFLGuTmxvz/C5ChA3KlgNLhf7IARPinJjoF1EUkzVkOF2vkGbsDE+7zFvzP/4UNF3Ff8cxNzIp/nwv5kJ80seumb9x289WNpbb+leIS/Jw3XNIzaQ1XD7leS1CdW72R2OoH4LoYpyEl6WbSyhtRVvdlnUuXZfqKw8iWlD4VWqV6VPypzuHMc/lF0XJOzAtfVDKK8mq+W3xowriBiy4vlkfQ8OeBnmFZ3O0mS5zCX4kmoQAHInWycePPbjGVA1c1v/rSHk5d1J/UEAH0q5qogvi3yQ1n4buJvaZ974tKQwLbFKvV0Ww8vE+hw97qolRkrwUeqXJsWOoyPTrVK+wLIFE6mWd2C3ma+M/LD5Y6QHEPNfMcKhAFLj6jEaRDZFqYmkDfCLCN8OmcBtozl7tCD955ErAHuNwzE/X+qIyYLcfMh4IlXxYFhDpSlPw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(46966006)(40470700004)(2616005)(47076005)(356005)(336012)(426003)(83380400001)(16526019)(26005)(186003)(82740400003)(1076003)(81166007)(36756003)(8936002)(40480700001)(5660300002)(2906002)(110136005)(316002)(86362001)(54906003)(6666004)(41300700001)(478600001)(4326008)(7696005)(8676002)(70586007)(70206006)(36860700001)(82310400005)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 13:31:52.3359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e5cab8-17db-4f75-6337-08da7c670470
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2772
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

