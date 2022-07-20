Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5F057B1E6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECCB10F89D;
	Wed, 20 Jul 2022 07:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CCF112DFE;
 Wed, 20 Jul 2022 07:41:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EX4RjaRurYs6MH1Nh4/7oJ66/kOtRP6qV5COCrm79IBPPVv0+JE9EK++GCrjk6zpCYuqIpFAZQ64RutU43/DrgX3o4zKSO/APZTQonlVJ6qyAbIrUux8ciWGsZWeHsgZH13W8y0eLXPWKo9a0vK2kHSSXD+5iO9NynxZFoni5Ru84OCB/ZM1U5OG9AM0t6+ZqA/8QxooEN/I7e6tXRRYg1JTWI+qx4o7ghJgTZ2H0/PwgNZ8eNxcrk5hvHh/Y4JRFFKR7GBZ9oMAr1PdupVh0b53wij+Z5XknLt/nPCQ5IRjog6q3xEe8ZiSW9kBAewaDEyQ9xBM+rct2P9fnVh+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OPPj3QAAHn20AYoFGDi7yilZrCG8NFC7DOWFrAYBKg=;
 b=W9us5pTAgWxWsFizC9XFl+Di0huXawAtMFqJ5L/d4Ewa3rNv1pZqqe0xlAZlb0VzvJNrWTUdGSml+6VGQ9HsDMyYZLY7ubV1FyQX4Wqb3CkxTWjLBwu4neR8/Sv1vYGNQ0wkuTUo1O5Jau5Nae7wa2tzExU8PThQ9qF35UJuRlveNBF8U216gp4Z8sYEtYsqYvjKbysZG8RBt/gE8X5e3fsqJ+3FJix+JL/bPv0Hs9q7MyOjFBDz5crfXAV90gtaXODw41Vh9yqesz2FXvIcNlz5OMy4cyUyX0HAL5Q7uIbAmgXPnOp5dnsM3Nx1heKZlL2kJE8k7+fiPL7ZsNVVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OPPj3QAAHn20AYoFGDi7yilZrCG8NFC7DOWFrAYBKg=;
 b=3fuSlNZSH4PS9QAiEnQ0qIPV7SEA8JYfJ53Ssu66kWl/WRvwYCTw8hBhj+ttpVkmVOiKO3mPAn9JsDNA1Ioe1xdKq8IS2GjWJJABivIbXOD6mr0+1I03BxM22q0s3+cR791ukxNPZ1SUtzOiTolsorciTN6JUI/uPtBhXg2Ofi4=
Received: from DM5PR08CA0040.namprd08.prod.outlook.com (2603:10b6:4:60::29) by
 MWHPR12MB1568.namprd12.prod.outlook.com (2603:10b6:301:e::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.20; Wed, 20 Jul 2022 07:40:58 +0000
Received: from DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::a5) by DM5PR08CA0040.outlook.office365.com
 (2603:10b6:4:60::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19 via Frontend
 Transport; Wed, 20 Jul 2022 07:40:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT054.mail.protection.outlook.com (10.13.173.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 07:40:57 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 02:40:54 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/ttm: add new intersect callback to res mgr
Date: Wed, 20 Jul 2022 00:36:03 -0700
Message-ID: <20220720073606.3885-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b6adc26-fd25-42d3-9bbc-08da6a232f8d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1568:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4LvSus88MGf++mju7nqN6n6Qe1P3Dw+7INdRq/o33nu6Z9MW6eFhhjwPzSypZooGGBVpouxjxZh2+59vfqV3TRXA0dl0U+WClpZJ4PdXJOD3KehGmOhe7mSPIz+pSPoi8n8+DQAApgfJp+8pGO5KWDfLH4SaahF3cmlYcQ50M2/Bn2OP70k8QYj0WzfPT47tllpvdok16laND9YNJ3pcjUektF3c8rCZBi9NeTaGXzgY0vtE663sCPt1syd7RMyNuh/88Hwri0NiqH39UHI8OgJZwZjJFcznCf7EXLrYRHJN5GDMokC9TE8gi2cMJn2SsJj/yrIbKTjNXZ9N52E35bqNBdAEDYyfXWI0tLjXKyrvUq4zPqgn+rRbtPMXl0WBJMRNOmm/Wn5eyYSdJ3JNYIHVcO1Ou20fXda9mwtMWK4di2y3xpWVfpHdb+PEClSMc1s/hloOAoPrtY6e/lJ8hJlwLJ6ns/yMudLC7WKca3b/1TG92kNiBhj/JQHeEygwcNbWiZWvDCV/tgPSSeQkmWL7n1nYG/CpkheBPadk/DosPoi/s5pGki/lMg9Fiec1na5EHoJTtfTIzcM9MikB9MqNhSqma0qLKjBQnZIFlFfwRJrxJnMLBFrPXPFXbtTUR2i6jlmWjeDPUg+LTbKuONW0ZOCeewkwEsbGf4K+t7F6aDK1Ahl4PfpD4JNKB0/UDdNNuXXPacK+j48vKLqn9/XTfjIEpoUCYyMFUtOk/+1gUtUYsDSRn/2xrbsyG/0GJ38BzXJjPUQWkRo26FMrjxwzaje+bPGFaBzs0b8hI3DKhQKU5cdvDyKn7CK/R0KF7WFQN6OB33mHdQgXqT4B8Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(40470700004)(46966006)(81166007)(82310400005)(7696005)(83380400001)(47076005)(26005)(426003)(6666004)(2906002)(41300700001)(336012)(1076003)(2616005)(478600001)(36756003)(16526019)(54906003)(40460700003)(186003)(40480700001)(110136005)(5660300002)(70206006)(316002)(82740400003)(86362001)(70586007)(356005)(8676002)(4326008)(36860700001)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 07:40:57.9462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6adc26-fd25-42d3-9bbc-08da6a232f8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1568
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
 christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- This allows the resource manager to handle intersection
  of placement and resources.

- Add callback function to amdgpu driver module fetching
  start offset from buddy allocator.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  | 19 +++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 33 ++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_range_manager.c      | 17 ++++++++++
 drivers/gpu/drm/ttm/ttm_resource.c           | 28 +++++++++++++++++
 include/drm/ttm/ttm_resource.h               | 20 ++++++++++++
 5 files changed, 117 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 8c6b2284cf56..727c80134aa6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -204,6 +204,24 @@ void amdgpu_gtt_mgr_recover(struct amdgpu_gtt_mgr *mgr)
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
 /**
  * amdgpu_gtt_mgr_debug - dump VRAM table
  *
@@ -225,6 +243,7 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
 	.alloc = amdgpu_gtt_mgr_new,
 	.free = amdgpu_gtt_mgr_del,
+	.intersect = amdgpu_gtt_mgr_intersect,
 	.debug = amdgpu_gtt_mgr_debug
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 28ec5f8ac1c1..ed0d10fe0b88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -720,6 +720,38 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
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
+	struct list_head *list = &mgr->blocks;
+	struct drm_buddy_block *block;
+	u32 num_pages = PFN_UP(size);
+	u32 start;
+
+	/* Check each drm buddy block individually */
+	list_for_each_entry(block, list, link) {
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
@@ -753,6 +785,7 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
 	.alloc	= amdgpu_vram_mgr_new,
 	.free	= amdgpu_vram_mgr_del,
+	.intersect = amdgpu_vram_mgr_intersect,
 	.debug	= amdgpu_vram_mgr_debug
 };
 
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index d91666721dc6..bf5de1978ead 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -113,6 +113,22 @@ static void ttm_range_man_free(struct ttm_resource_manager *man,
 	kfree(node);
 }
 
+static bool ttm_range_man_intersect(struct ttm_resource_manager *man,
+				    struct ttm_resource *res,
+				    const struct ttm_place *place,
+				    size_t size)
+{
+	struct drm_mm_node *node = &to_ttm_range_mgr_node(res)->mm_nodes[0];
+	u32 num_pages = PFN_UP(size);
+
+	/* Don't evict BOs outside of the requested placement range */
+	if (place->fpfn >= (node->start + num_pages) ||
+	    (place->lpfn && place->lpfn <= node->start))
+		return false;
+
+	return true;
+}
+
 static void ttm_range_man_debug(struct ttm_resource_manager *man,
 				struct drm_printer *printer)
 {
@@ -126,6 +142,7 @@ static void ttm_range_man_debug(struct ttm_resource_manager *man,
 static const struct ttm_resource_manager_func ttm_range_manager_func = {
 	.alloc = ttm_range_man_alloc,
 	.free = ttm_range_man_free,
+	.intersect = ttm_range_man_intersect,
 	.debug = ttm_range_man_debug
 };
 
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 20f9adcc3235..84c21f92b422 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -253,6 +253,34 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 }
 EXPORT_SYMBOL(ttm_resource_free);
 
+/**
+ * ttm_resource_intersect - test for intersection
+ *
+ * @bdev: TTM device structure
+ * @res: The resource to test
+ * @place: The placement to test
+ * @size: How many bytes the new allocation needs.
+ *
+ * Test if @res intersects with @place and @size. Used for testing if evictions
+ * are valueable or not.
+ */
+bool ttm_resource_intersect(struct ttm_device *bdev,
+			    struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size)
+{
+	struct ttm_resource_manager *man;
+
+	if (!res)
+		return false;
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	if (!place || !man->func->intersect)
+		return true;
+
+	return man->func->intersect(man, res, place, size);
+}
+
 static bool ttm_resource_places_compat(struct ttm_resource *res,
 				       const struct ttm_place *places,
 				       unsigned num_placement)
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index ca89a48c2460..3f3ab2a8a69e 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -88,6 +88,22 @@ struct ttm_resource_manager_func {
 	void (*free)(struct ttm_resource_manager *man,
 		     struct ttm_resource *res);
 
+	/**
+	 * struct ttm_resource_manager_func member intersect
+	 *
+	 * @man: Pointer to a memory type manager.
+	 * @res: Pointer to a struct ttm_resource to be checked.
+	 * @place: Placement to check against.
+	 * @size: Size of the check.
+	 *
+	 * Test if @res intersects with @place + @size. Used to judge if
+	 * evictions are valueable or not.
+	 */
+	bool (*intersect)(struct ttm_resource_manager *man,
+			  struct ttm_resource *res,
+			  const struct ttm_place *place,
+			  size_t size);
+
 	/**
 	 * struct ttm_resource_manager_func member debug
 	 *
@@ -329,6 +345,10 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
+bool ttm_resource_intersect(struct ttm_device *bdev,
+			    struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size);
 bool ttm_resource_compat(struct ttm_resource *res,
 			 struct ttm_placement *placement);
 void ttm_resource_set_bo(struct ttm_resource *res,
-- 
2.25.1

