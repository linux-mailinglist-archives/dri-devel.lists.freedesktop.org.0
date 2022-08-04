Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BCF58999C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429BA91F7E;
	Thu,  4 Aug 2022 09:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02A0925FF;
 Thu,  4 Aug 2022 09:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQJLlXXMyWIzE8Wtn5Bp2gP4Fg2C7KgtudrxNhJRhHmJlSfahauQbnAcoMyYVux+EgE2APX8nf1KIeeV0ISvH4tWpy3Xg0hf1AxHfLUmXGhK5H6CCl3gSWloPIl7/ViU26SQVk7bttnZsvb9raMBgSdN3hyzJ43QY9tB6geciDYmsPiDmPONdGAuhtMGhUTKsM3OFDpm1yXt7wht4BcXnEqyFsuq9eCXo4vpFcPP1aMabDi2dixOLqfi0HgQAuCmoqnol1U+6T13SxNmeXWghUFjN8dCttsfJWvRvfWgFJqkw1I5obhh/KXMxtBzaU5rh4CgDyMbhIWQ04TFTGJL/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPHHccRpfMj9lmchI/FXDkHjKDExdECryMsOiwW9K6I=;
 b=HnV7P8JpyWe0UbZdArNY2BqS6uymxcRs9JVDhWJYrOpfIQtHtMqTU0EEKTUsTvVvMSa6qpcSo+oDg/PLeJ1XHv/eho+k9aM+DuVepdFz6TUCLNhR05Bc2fnpEtfNTKz7ayDloerw8eRQi49e2HdWROPzWLE87pfyVzAQXv3qjj5J7I3hjqcq1ziDw/0iDXh60j9eE7kFfHUaboVeQTyhTYCzSpztSry+k2l70BnnWgCqG4Jf66za5sG+kU7NPDS3QelR0GWa47W33d/Qb8gkcYGLuwcnmZb1MZh6ZsDeAY6Aj45GHt41pLvBPUjCErw6tBq+0hzWhUYdMnu7nzVj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPHHccRpfMj9lmchI/FXDkHjKDExdECryMsOiwW9K6I=;
 b=UDUieYVIodQZutx/6Vq9tAoD/lAzncfjD6yc91PMlgJ4W9pTXGUJgeZQmUQbP71ASGZmaPvVUFEuNwiEWqWZ68zzjnI+y9UDwfG9TA6vIVXbZC7H4twKABNbcCA/IEEtyif3wWTWkOkBExbRHbx/3Mw8lnDTogfIQO3S7MSpNVs=
Received: from DM5PR07CA0066.namprd07.prod.outlook.com (2603:10b6:4:ad::31) by
 DM5PR12MB1882.namprd12.prod.outlook.com (2603:10b6:3:112::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.14; Thu, 4 Aug 2022 09:00:20 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::48) by DM5PR07CA0066.outlook.office365.com
 (2603:10b6:4:ad::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Thu, 4 Aug 2022 09:00:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5504.14 via Frontend Transport; Thu, 4 Aug 2022 09:00:20 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 4 Aug 2022 04:00:17 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v4 3/6] drm/amdgpu: Implement intersect/compatible functions
Date: Thu, 4 Aug 2022 01:59:49 -0700
Message-ID: <20220804085952.6137-3-Arunpravin.PaneerSelvam@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5979139f-f64e-4bf0-9541-08da75f7c28e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1882:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kA54K+KAJyOiIlAHMyLruEmyEp7wNRlAo+eeUg8b1TyJGrqt8sWhn9oGkhknAa/saj10vjzh6N2MyfEigB4U4wN5aVqDEakXIVa1Yjc2fQjoVPeyZE7qXfXvXdoNnSm6jaDWhN7K9aj5RCyYPfuwyoPOMcvaVo7DNN9LUfNOrxXFHvmnqnfknQPXtc03cn/SmTmKY2fA7J/zbXfA04qwIXBeUSkccJ1FKrMfK6b6k4HsrNze54Fj7fNWXGJlHaBLK3YjCrSpaV3D+J95DIIaOrUwIv2giR7ixNaY6KCk4K5Fb1Ng+CtWgTYgbk98UlDbr3ACvkAL2oRTIAIlKt/dwV6eY2tVbqcpPco9EI4TMOTq/bz+COOgu5vJix4+/z+j9ozspHvXTRVCgFXoPrl1HEGNvqxbAlI6fZ40yRaRdxB1TDPyVlGpO6tGLtgvEhllKkHCUW3afrSNhHaTstE+qMANHKA90hQZ3eBUJ4Q8zW8vEVBUrs8Hc8AI7RJ8nX8D9+BGSQERWXm+j8VDNedT9B26TO79lef+SroSr3FuIL4ZX3Dk1tVjKnhB6W2dADk442R+xkfhujj5FG+MLAP40MZrxKHI5u2XJ7yibreg47UVJ55b/ArwewzBZOM7gYY0ptWzUeZUVDIuyO75enyNXWorgAmrYMWsEhZsuAGAo2kQSKXLpeWAEZIma5QZruhDqYN5HAfi+F25zLJKQVUcgiKHJTReCeR3dNLZDcDrd2G7HXMV1HGkIfHulIpoMAbK6lQPWZWjeA0r8H4/gqwvn8Y0OuDYrskqAjcSz/2c+eIOa5/PDRR8oNHRs70gEXzVUMI6playxAAZwXXBeDOVXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(376002)(396003)(36840700001)(40470700004)(46966006)(336012)(4326008)(2616005)(86362001)(8676002)(5660300002)(1076003)(70586007)(426003)(478600001)(70206006)(82740400003)(36756003)(356005)(16526019)(47076005)(186003)(7696005)(82310400005)(36860700001)(54906003)(110136005)(81166007)(316002)(83380400001)(26005)(40460700003)(6666004)(8936002)(40480700001)(41300700001)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 09:00:20.6748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5979139f-f64e-4bf0-9541-08da75f7c28e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1882
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

