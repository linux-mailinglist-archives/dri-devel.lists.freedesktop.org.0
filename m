Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C20459117E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 15:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232EDB3704;
	Fri, 12 Aug 2022 13:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEE1B369E;
 Fri, 12 Aug 2022 13:31:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwIG2it1RgM/A8c/dkIOMh2XU+DdULsCZt0ktXTafr6q8fLWY2aEq1QoAAeeBVzP3XfOxOPz98AvgD1kvFPDCCK2jAZ8v30pK9kOHkmQb8CG7c01etsD5CY7t3C5NQeWUqviFyE5rI26F0RUOn+0vHEgZKQ4Lzh6YuFoaWb6kSybwFDLxwf757uhR0XbAa5CKBt+9fBUDm8GfNOFR4ScEyOy/zVeNj7PawSu7gMHmJ2GAOsbTJAuNksskiu2R7MgjHPEdhAwWA6qI4AZ7V9mxz/SQft3Krr+uPYrc7lOoKgFHFYKRrUocftK1nslnDnfpgIirU1azYMuqUoRGVQQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HF8zDwAy2Ee8I89SYasO8/aBp+tZMHZMt4rS7rwMtM=;
 b=VmSq1hnH9cz7xBggc21vtJtToDEkWVWbEV8O/Lu/tRaAvVLE/WLfprWh3J5Gsa2hiweJow35taQTcTTOfFUIDCQXYHrf9A16hzgNfRj9YVHgKWwdEi4RZr6bK0/IOIX8T90sJ7uJEaZ2fcZeeLXgpdIOghP++5EPpU230A8gZXw96bG18w3psZxAoMFx5OUw6Szhuc6vvXgSKZ24qMmXZLdj3Xs2Y8aLqwuFT5TkgTE/GPzzYOIMoccw5OQ9xZ3WfIUqieV/xswuHQeubLaNTdV2xxgvJiu/fpGfXU1y4Pp9t3T23ngBBmDo+HyCsLosBpgms/1S8xs6LTlgl2kpdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HF8zDwAy2Ee8I89SYasO8/aBp+tZMHZMt4rS7rwMtM=;
 b=rRE93e8m8A7wZwW4OlBAFX/tomgKccn3F/BqbgMZBYtBPF+Z0CXzCblmkMVt9pWBUPGrwhbnRbKF1cvwMb/D1VfeQUmo0TeTo8LEsOIri/svUZIsk6x8WY+JU1qvQZ6G4YdnUCTRYDfejduJe7Wesgp8Wd7qiDFAhYq9sQqSIck=
Received: from DM6PR02CA0146.namprd02.prod.outlook.com (2603:10b6:5:332::13)
 by DM8PR12MB5464.namprd12.prod.outlook.com (2603:10b6:8:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Fri, 12 Aug
 2022 13:31:23 +0000
Received: from DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::fd) by DM6PR02CA0146.outlook.office365.com
 (2603:10b6:5:332::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17 via Frontend
 Transport; Fri, 12 Aug 2022 13:31:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT048.mail.protection.outlook.com (10.13.173.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Fri, 12 Aug 2022 13:31:23 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 12 Aug 2022 08:31:20 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v6 3/6] drm/amdgpu: Implement intersect/compatible functions
Date: Fri, 12 Aug 2022 06:30:45 -0700
Message-ID: <20220812133048.2814-3-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 288b8860-3beb-4868-2ff8-08da7c66f311
X-MS-TrafficTypeDiagnostic: DM8PR12MB5464:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oWYwKd4+mbhjNeAoudfXGzvxtJ1kuh/HwCR8GovueNMbs+LAy25OaS91zE6dmQwxMeskOrkLpJ1YCEAmrZidQ8xezMRGxGjF2KpCLCXFNlfKxI8qQpf7NK4LnaCzySKobPLm4Qd/mQPkBb2lkFgvcYd4XAII+pRBiJjW+4ZYsvfPbZOSrsMYpCLc+pSDSxI7hwu6R4dcKIrcVK7l/ch2v3znwHsZ+MrywP4MwacnNwUoVUqcZ4X0mFrT2qApABfzzXzL1fhOVGBxQLFVA7EvF4UqcTzFnWJn2WCgfcshHz66GBZj9X+sjjFxVBZYSrgled1PCBd5/mPsogI3AXRUNOEppg77a24aKNBu1FUa27UivKVesw9b8ze/ueGNUR6QFesLufaLrsn+ntO4Dtpfd1KQinAs7YL214ghTwCropO08uLacxDnbGbrTwqXw/FEoXu//3aMFLJBW9/p51hxqQrHHwmtI9NQrgjZXtMQw1iTp+tkTHmW2ug1QChFG7TN4C6FaoV6U/6KRH7wgBGaqFeBOMQ1SzkEJD7E8HnRHCpcYA/FplE9uCSUp3mJS/HkwAPsFCZyq+7McY5J1S9me0I0/AAxgPDGxhMqJ9D2/bowm/qY9Sj0/zabKsbptopr4RgA3UDTN3L27lxYd3eWwa1lWQ3v0GCW7gYl665ZulHvaumlYSzesdRTgaV3tb8VKORPVGAxa1Lfv88if660MwfFI9UuA1pMytnKf4DPWgyQJnRehcq/4w7fojN8AFoCo2dUJCQDVZpzrrAlFLbNpG5jEYzHGXF05cTVssN0qGjMsOgpEImiNIejXniaLQXErL77xZKhLf0h352ZFxklxg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(40470700004)(46966006)(36840700001)(356005)(26005)(5660300002)(41300700001)(36756003)(336012)(82740400003)(2906002)(478600001)(7696005)(1076003)(81166007)(6666004)(40480700001)(82310400005)(70206006)(8936002)(8676002)(83380400001)(86362001)(110136005)(2616005)(40460700003)(4326008)(36860700001)(426003)(54906003)(16526019)(70586007)(316002)(47076005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 13:31:23.1907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 288b8860-3beb-4868-2ff8-08da7c66f311
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5464
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
index 28ec5f8ac1c1..d1a2619fa89f 100644
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

