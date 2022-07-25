Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A85257FE92
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6532F99F84;
	Mon, 25 Jul 2022 11:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0CF99E89;
 Mon, 25 Jul 2022 11:43:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmA7qcDeD6MHUXOh+y0jPqdKqld/i2kH5kQKWtPyUBB32OSI6DUdpqQvwJgBCEpWM3ZBHcpMX0hfi9nGTVe8gzsevKKhvZ/GKHCsAJjhXYNTPnm78h6fm0ln1LGdYAx4i37R4govRK/owek+kuUbpJ0LnJv0msvN4RWRJbMNdv/5NhX9Y0hHMyqZ0LtmB5O7obO3D7tP/5T1+ow1pQXg/BN2ZFPhpJGv/seQHvRXdeSxldza+7cW9Zu46wqREX5NzyBixUrwBfDR5mqJy0qHo2FYjir+VvPBUGkk8LvWapTLk33LtTdjOqWHGZvALioiNCDERE/uymdZeMIyoqCJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eu6/Jn0OeipnEWgNPwNvmzf33x0p+W/hApFzmWBtGiA=;
 b=AVKXhDcsYoIVaIZm0D6UvsPLlmeeOA39sc74ioAlrz0JBmttVxPJoL/s38gS0jArXwQSXPAdcorjunkG5kPfyRdvPb4iBAw73LmWTt4MbDSSxo5R7+9i9EpbvFZJB3QKfY/SamREMwKypYJOfJPZ+KmlmAdwt5g6yvnbkarz9/FOZvyRFVhQwR/4pHOpaIlazH1ptkOKkgn7ZwES5uqCyc8T6/UkAtSn0XeHPB38QMqH6AD/uYxsjjMZ4+jBMpgqIAol+QzpsbGmCqB9SXyYhGry1RggXt1st9snJ/F6l5GpoBCRpfpElqMXuh/y1Jfx1eXoHPF/4m2JbiS3FaoYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu6/Jn0OeipnEWgNPwNvmzf33x0p+W/hApFzmWBtGiA=;
 b=JXumshWQ0fUtnqpk0o98J6ch2DL+cVleQfJz9cenwlstKTb9KfWbQPMx1ezHhc4HBt3BxNTHT1L4UDkI181cQ6oz1/7VRhAUKcEyLE4JAviRwDA4TmUjUnyhBit0TDO62Y8HqoHdKb5JavyQrTw7EUdt4VOb0K1rTgf3RpEPdJ8=
Received: from BN9PR03CA0433.namprd03.prod.outlook.com (2603:10b6:408:113::18)
 by MN2PR12MB4487.namprd12.prod.outlook.com (2603:10b6:208:264::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 11:43:32 +0000
Received: from BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::12) by BN9PR03CA0433.outlook.office365.com
 (2603:10b6:408:113::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Mon, 25 Jul 2022 11:43:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT059.mail.protection.outlook.com (10.13.177.120) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 11:43:32 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 06:43:29 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 3/6] drm/amdgpu: Implement intersect/compatible functions
Date: Mon, 25 Jul 2022 04:42:37 -0700
Message-ID: <20220725114240.4844-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60bf2e58-e3a9-4481-1d0e-08da6e32e6a2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4487:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ni7ojCaeAnNRXDAgQcKg9YJ7sa1/OAm/7DVA+VyGDHtYzIqwWHWoaoJ05MAAOGMHYt6zeZDOlkSbHsKp3RmU7X/1WleWByYHP3DXDpSnntrGkmCBxefZGgII+gm/9xmnA1NJLGHYXYfxzy83KZr3ix8kV7M39mTFJ1g0+mMe4xGRg8Pygb9G+HCF6C8E/mPa6bEO3mOEOj9Cl7yFlXTcXDNibXE+8OR+fQp2txHs1y4N6IpedqZQ1dmhQV7dBN5evZaQfQ075Ecoo/SVl6XRyomc/cQRl/2lRCkA/YFEYWX7bTllxGtMtURf4F6lo4TLI2rpFrutQVq0+ZiDUYVp2oKs+O90XhSFW4sEDtwXejt298WDnUKTTOfAWKV3z5VU3SVnU//JcsLCw5mRULnn/kVAoI+yLsWV8ZiioxPJnGcvKhKIhMRHAvij+v+7zcDRHD7cRfv9XWRvP6b5JATR+Bx0e+hhLOJS0scQc5whbeF07p/KSvbLw8Fh6nFPNFM9g+1Arx42zDqbity3cyeXCjT+cjegWtZ2cUuj0sP+ZBVVxBr44W/UJ7+iYkxff+hOaiw9OkZkq8oyENt180ZhJ0Z4uyJTHMnBE6+ATU7LBkZzmht8fLagMDHw7WsmQWK7qbwwSwnM06TWzhrUJvViKPmNlBt3DTNSwZRYqTCXEZYL5iiDYGcB/DkG7shtDwIPgorY6Mn31LoFM0CP9qKse4Fuwkwa6vPRjRqrs8SSNxXeN9qH6Y9UMUujZ7/QpbxLjTK0U4jgRVpSC6kuuY1pexPC0ObilDhtjC9RI1n8IQTY1gFozJ/N2sFj4N5Bg0EHKdcmvKiSK6oVaW+VZL07Zg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(36840700001)(40470700004)(46966006)(86362001)(478600001)(6666004)(54906003)(7696005)(1076003)(36756003)(356005)(110136005)(26005)(2616005)(82740400003)(41300700001)(186003)(426003)(16526019)(47076005)(336012)(83380400001)(70586007)(8676002)(40480700001)(82310400005)(316002)(5660300002)(4326008)(70206006)(8936002)(2906002)(40460700003)(36860700001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 11:43:32.2525 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bf2e58-e3a9-4481-1d0e-08da6e32e6a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4487
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 38 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 63 ++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8c6b2284cf56..9be484164afe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -204,6 +204,42 @@ void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
 	amdgpu_gart_invalidate_tlb(adev);
 }
 
+/**
+ * amdgpu_gtt_mgr_intersect - test for intersection
+ *
+ * @man: Our manager object
+ * @res: The resource to test
+ * @place: The place for the new allocation
+ * @size: The size of the new allocation
+ *
+ * Simplified intersection test, only interesting if we need GART or not.
+ */
+static bool amdgpu_gtt_mgr_intersect(struct ttm_resource_manager *man,
+				     struct ttm_resource *res,
+				     const struct ttm_place *place,
+				     size_t size)
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
+	.intersect = amdgpu_gtt_mgr_intersect,
+	.compatible = amdgpu_gtt_mgr_compatible,
 	.debug = amdgpu_gtt_mgr_debug
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 7a5e8a7b4a1b..cd1825cb6361 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -720,6 +720,67 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
 	return atomic64_read(&mgr->vis_usage);
 }
 
+/**
+ * amdgpu_vram_mgr_intersect - test each drm buddy block for intersection
+ *
+ * @man: TTM memory type manager
+ * @res: The resource to test
+ * @place: The place to test against
+ * @size: Size of the new allocation
+ *
+ * Test each drm buddy block for intersection for eviction decision.
+ */
+static bool amdgpu_vram_mgr_intersect(struct ttm_resource_manager *man,
+				      struct ttm_resource *res,
+				      const struct ttm_place *place,
+				      size_t size)
+{
+	struct amdgpu_vram_mgr_resource *mgr = to_amdgpu_vram_mgr_resource(res);
+	u32 start, num_pages = PFN_UP(size);
+	struct drm_buddy_block *block;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &mgr->blocks, link) {
+		start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
+		/* Don't evict BOs outside of the requested placement range */
+		if (place->fpfn >= (start + num_pages) ||
+		    (place->lpfn && place->lpfn <= start))
+			return false;
+	}
+
+	return true;
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
+	u32 start, num_pages = PFN_UP(size);
+	struct drm_buddy_block *block;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, &mgr->blocks, link) {
+		start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
+		if (start < place->fpfn ||
+		    (place->lpfn && (start + num_pages) > place->lpfn))
+			return false;
+	}
+
+	return true;
+}
+
 /**
  * amdgpu_vram_mgr_debug - dump VRAM table
  *
@@ -753,6 +814,8 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
 	.alloc	= amdgpu_vram_mgr_new,
 	.free	= amdgpu_vram_mgr_del,
+	.intersect = amdgpu_vram_mgr_intersect,
+	.compatible = amdgpu_vram_mgr_compatible,
 	.debug	= amdgpu_vram_mgr_debug
 };
 
-- 
2.25.1

