Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF98C58D685
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143FD90AB1;
	Tue,  9 Aug 2022 09:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9BF8F980;
 Tue,  9 Aug 2022 09:23:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZ2B4fZZyfNgntfgUGViJ83xO/SG6slvQN3ke202jS9hBXBQvrE3MUqb9LlNF4wCLUPeWo8CmIwgQImwpjKT+3dmS4sTuNlhZ1tOR5rHP/erPlBb6ZI9KnLY6k8PDStniskX7w+J0e/ftckajVtU0DTpmqbXDIbJbW0lqN2CmsjJwcv2AkGV2kKNKatR7CPaMNQYNfFtcgTm4p7ME3OMrrM3nB1m76Mtz3dXhAN0PUPKjhm/UAs7BUezV/9PIpEYBhtYO8KwQF2iaFwHVwLpOj6iimo7S18Wzy9Lo0pT/SklZ5QwtfM4OOmMqVnInr9ypT5lvBon3r9EKmUL4z4sAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPHHccRpfMj9lmchI/FXDkHjKDExdECryMsOiwW9K6I=;
 b=AbCx3a/fudGwhuTlFl4qMNfSe8LiBUjr3HHuek0jiWlbl2nAfFRqW5a9E+pLZxCZCWRVvnu75QYFi6qPp1s+1a5Qg9RKTiS8yx2YOxWFMRew4RYaRSjQH5kevdMdRdM2y7sRRYBQcVn6aBBx81RmphYFIiToi8Bf7v6jP72iBTKXSN6Ik2qteplkeBnUq+SnGn4Nyy2TuffB7gWWbB9vF2TWZyLYqovVwmcYd5DHZBN4dhesoa65hRE8otWpo2YMy5NChkyk24qO5hBNuYFd3kfXb0muzJlRmdzxt7+icCH3V39Uaw2pmSK5vgqeqDdF8j0ZrHjgRWN7r4Dciku3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPHHccRpfMj9lmchI/FXDkHjKDExdECryMsOiwW9K6I=;
 b=GAE1SPOpp+RDMv/hQ98e5IDelWz5dbUeS5NHmFYZXkBzHRIIiPg6eEbclRgrV0JbtGrR14z0RPB7R2PyDL4h8qHP107xc/G9vJOZLuMEAQEutz2IjIlkD2JgrSLnTQNtl4HUi7fT0dhYaXszA0kiMdxmkUNQNnelcCeDnU3oLwk=
Received: from MW4PR04CA0230.namprd04.prod.outlook.com (2603:10b6:303:87::25)
 by BL1PR12MB5158.namprd12.prod.outlook.com (2603:10b6:208:31c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 09:23:38 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::da) by MW4PR04CA0230.outlook.office365.com
 (2603:10b6:303:87::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18 via Frontend
 Transport; Tue, 9 Aug 2022 09:23:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Tue, 9 Aug 2022 09:23:38 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 04:23:24 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v5 3/6] drm/amdgpu: Implement intersect/compatible functions
Date: Tue, 9 Aug 2022 02:22:27 -0700
Message-ID: <20220809092230.2808-3-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: d5dc3adb-438d-453d-3356-08da79e8d7c6
X-MS-TrafficTypeDiagnostic: BL1PR12MB5158:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CbCfjIoyxRz/jEaLT7ZHxkAPnyx09byn/sW3BhyJ8dgAza4vQBAe3aCaltmZy2sTFGPz/0d+3iAhV2bsYEGqk8hLj0ZE1oQFAhP/7UZQvQxguIdSCCZ5BXR5tm7KjNd/VES6zradHSCKCoTh5Zw8buAssq5N3qKtbgqRZi1BREbictACLjpX3oYVW5CSUJZtpWrEJmHu1HDJtHBpHogd9Pu+4aAsoRaZQJrtz4d82IZc9gJtHj76Iu5AUwE9+q7mZIe/PTojG3ZHVCKSCEWVaMBssIcytnUmkLuZ/2gJL/e7ki7ucSdiKAjdsTUp1XdHgpsEt7UuAlxsqD+Aea4QD1VJu458K8yHtgWTx1Dvof7+xOoZabPm74kDLQrXD7/hWY6ZgqenLDUW6aHPJ+IGbGQ5UlHGqeCvfgpVmGp2RToH3bC3yVr12cb8EH7d+jbCjWPgxjaJT0TMCXXvb0WLsHq7W7MC3wmOxTw5hUf7QhGLS6p11wayVUOyjb6Re2Z9KbsA6Tv8SPPpVXTMFcGkPO09BHbKFlmsZnBNaBaoJgTYjkTKbKWn7Io7Vb7DPb+vXeLWM2nYdGSklyN6MpAkzKSFrCA6sfvSug+BcZ6FjEccxexeV9FooOO5OKkuWtMCsYIGGnC2swdgD1Zgt1AQTfLgNe4E5M1gGCWDHsayrpOFMXW+HZ8zcYp7THccBEe1IBIHNo1lJFKAhkx5lvLYKhyD0rSTaPGc/mR8BmBNAqgfBiQUXvH+cN2tVqNAPZglDn4ufhqm4XcGvG42LSzYTgQniBZUcwoMSu4nLuCjtuNSPHzuZRZ1KSrqdOLeQmGsopW1W/Y9lqogPHY6vYVM8g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(110136005)(36756003)(70586007)(54906003)(70206006)(8676002)(40460700003)(4326008)(36860700001)(86362001)(5660300002)(316002)(8936002)(478600001)(40480700001)(41300700001)(1076003)(7696005)(2906002)(83380400001)(26005)(81166007)(356005)(2616005)(336012)(47076005)(82740400003)(426003)(82310400005)(16526019)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 09:23:38.3779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5dc3adb-438d-453d-3356-08da79e8d7c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5158
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
fetching start offset from backend drm buddy allocator.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 38 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 68 ++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8c6b2284cf56..1f3302aebeff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -204,6 +204,42 @@ void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
 	amdgpu_gart_invalidate_tlb(adev);
 }
 
+/**
+ * amdgpu_gtt_mgr_intersects - test for intersection
+ *
+ * @man: Our manager object
+ * @res: The resource to test
+ * @place: The place for the new allocation
+ * @size: The size of the new allocation
+ *
+ * Simplified intersection test, only interesting if we need GART or not.
+ */
+static bool amdgpu_gtt_mgr_intersects(struct ttm_resource_manager *man,
+				      struct ttm_resource *res,
+				      const struct ttm_place *place,
+				      size_t size)
+{
+	return !place->lpfn || amdgpu_gtt_mgr_has_gart_addr(res);
+}
+
+/**
+ * amdgpu_gtt_mgr_compatible - test for compatibility
+ *
+ * @man: Our manager object
+ * @res: The resource to test
+ * @place: The place for the new allocation
+ * @size: The size of the new allocation
+ *
+ * Simplified compatibility test.
+ */
+static bool amdgpu_gtt_mgr_compatible(struct ttm_resource_manager *man,
+				      struct ttm_resource *res,
+				      const struct ttm_place *place,
+				      size_t size)
+{
+	return !place->lpfn || amdgpu_gtt_mgr_has_gart_addr(res);
+}
+
 /**
  * amdgpu_gtt_mgr_debug - dump VRAM table
  *
@@ -225,6 +261,8 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
 	.alloc = amdgpu_gtt_mgr_new,
 	.free = amdgpu_gtt_mgr_del,
+	.intersects = amdgpu_gtt_mgr_intersects,
+	.compatible = amdgpu_gtt_mgr_compatible,
 	.debug = amdgpu_gtt_mgr_debug
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 7a5e8a7b4a1b..dcf2a6400e8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -720,6 +720,72 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
 	return atomic64_read(&mgr->vis_usage);
 }
 
+/**
+ * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
+ *
+ * @man: TTM memory type manager
+ * @res: The resource to test
+ * @place: The place to test against
+ * @size: Size of the new allocation
+ *
+ * Test each drm buddy block for intersection for eviction decision.
+ */
+static bool amdgpu_vram_mgr_intersects(struct ttm_resource_manager *man,
+				       struct ttm_resource *res,
+				       const struct ttm_place *place,
+				       size_t size)
+{
+	struct amdgpu_vram_mgr_resource *mgr = to_amdgpu_vram_mgr_resource(res);
+	struct drm_buddy_block *block;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &mgr->blocks, link) {
+		unsigned long fpfn =
+			amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
+		unsigned long lpfn = fpfn +
+			(amdgpu_vram_mgr_block_size(block) >> PAGE_SHIFT);
+
+		if (place->fpfn < lpfn &&
+		    (place->lpfn && place->lpfn > fpfn))
+			return true;
+	}
+
+	return false;
+}
+
+/**
+ * amdgpu_vram_mgr_compatible - test each drm buddy block for compatibility
+ *
+ * @man: TTM memory type manager
+ * @res: The resource to test
+ * @place: The place to test against
+ * @size: Size of the new allocation
+ *
+ * Test each drm buddy block for placement compatibility.
+ */
+static bool amdgpu_vram_mgr_compatible(struct ttm_resource_manager *man,
+				       struct ttm_resource *res,
+				       const struct ttm_place *place,
+				       size_t size)
+{
+	struct amdgpu_vram_mgr_resource *mgr = to_amdgpu_vram_mgr_resource(res);
+	struct drm_buddy_block *block;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &mgr->blocks, link) {
+		unsigned long fpfn =
+			amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
+		unsigned long lpfn = fpfn +
+			(amdgpu_vram_mgr_block_size(block) >> PAGE_SHIFT);
+
+		if (fpfn < place->fpfn ||
+		    (place->lpfn && lpfn > place->lpfn))
+			return false;
+	}
+
+	return true;
+}
+
 /**
  * amdgpu_vram_mgr_debug - dump VRAM table
  *
@@ -753,6 +819,8 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
 	.alloc	= amdgpu_vram_mgr_new,
 	.free	= amdgpu_vram_mgr_del,
+	.intersects = amdgpu_vram_mgr_intersects,
+	.compatible = amdgpu_vram_mgr_compatible,
 	.debug	= amdgpu_vram_mgr_debug
 };
 
-- 
2.25.1

