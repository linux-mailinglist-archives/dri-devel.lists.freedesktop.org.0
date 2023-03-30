Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE396D0F5D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 21:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3923210F011;
	Thu, 30 Mar 2023 19:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AE910F011;
 Thu, 30 Mar 2023 19:51:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myYFKsEsnlfUuHqAlp68XUfPLm8CUX5T/jmxsXw5wZPM9oTQEtRy3h3FRTOdO8SGCwQWpz4K0azNh08JjmN6kYAgBuQ4jMYZywYp+MIuaYG54ojubwpvakI1UY6y1gzZQceTjAwqWzQcrktgk5WCoVwSalqLePlfrOe62k2WIdCqxcFJ+jOQKZI0f/SmCWTU7W3yEeYhAiV8m1jpcjbEw11MG1Wbix47E4E4oEmgdsR6x+tVABPvS1Gdj77jWbEyQdhSvD0dwHbOvLVDdQUv+SLb/0/gEdmMrmYwwCrU9H0NsVmsUNfDu+GiMDSTHzeOtSuBYmhiDlrU1TSGcY5/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7S9+RDDkJGfiS+DGf0jdHl9cA5bb3DMPMo+sgRy87E=;
 b=oKgm/SWElFM1dDyQsPYIKGtQKqugjKJJ8URpNPjyFJF7edt/iuGlRC/NOxXTVVg5Heh6e2G9n4nZ+XEEI09j96Cwa5c3R+XXt9BnNJgJiOXoVEhmZece8Nvm869J0xxK9TUSXD5ZMkCv2SxGSZINCugKySmuSVRI/lpum+gh2gBB6g9U1pf/Ns3y8Vlt9TUcVVDmlgQMEhn0dqmyMN9zQTh5IKKADsB+Yc+QbZEXjSo0PFJ6J27lNV0AeseY3b+fBG1I2o4RnMS0dRN4r629LRrO64GZ9qBnWPKL5Wqmv/cnIB49fGt1NgA7qF69RObhGSUPU8CnSzCsindlU8LhFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7S9+RDDkJGfiS+DGf0jdHl9cA5bb3DMPMo+sgRy87E=;
 b=sp0oDECLOzwsOPUPJL280P/N3/FHHveuBrXACznPKl7VrRsXGArSMMdIRDELBSM1YQgmBU6wfyvVLTYbJ2KgbWqN8MpJqsANEduBqZvrgOqX9F6l+bve7fUe+hIBEKV2HUr7Ju0XPkg7yHDiSDLjQsWG/gSeHk1lfXTx2gp3KgU=
Received: from CY5PR15CA0144.namprd15.prod.outlook.com (2603:10b6:930:67::11)
 by SA0PR12MB4397.namprd12.prod.outlook.com (2603:10b6:806:93::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 19:51:15 +0000
Received: from CY4PEPF0000C971.namprd02.prod.outlook.com
 (2603:10b6:930:67:cafe::5f) by CY5PR15CA0144.outlook.office365.com
 (2603:10b6:930:67::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Thu, 30 Mar 2023 19:51:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C971.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Thu, 30 Mar 2023 19:51:15 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Mar
 2023 14:51:14 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: add NUMA node id to the pool
Date: Thu, 30 Mar 2023 15:50:43 -0400
Message-ID: <20230330195043.1136322-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C971:EE_|SA0PR12MB4397:EE_
X-MS-Office365-Filtering-Correlation-Id: e1268895-6037-4607-a41e-08db31581f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewwFVpSgFE5YlhupQEnMKZNqkgnETTsDo3JEDw5LhMSN8auWN6CSYF81WWmaEw+eByqXLRFOI9ph3SkRZ3QfwFFndb5FgfSqZ2PJRhG96e9Cb91ANUzfQdT6LW7rBzio0PUzPFm8ZS9rP9smfagSv2x2+z1ybasjzt7PDbji32n/oAzWavjYiPosICdiDx0x09oGvU9N7QY/OeGSszQeaVS16QIxcuxIJmcjkTDsGodQiyTaXEESifL+VGBmrjSIKyiuS3xIFOw7XdmgR7aDZLGpG735F9PXyoCg2+jCyzWuEK3nhedhitD34QXsAbtMmH6Gmo2Zs3MSiW5tMEMT3j711/lKbRc9hQo3mi1N9tYUronAjFWVD/xhfMWivu96ow3t2lg5Mgj19eUosXaylBxVamUxVIwidOA8TbAFOzoaCM8wcWhC1vu8pf3YgA/0bg6edA4QfRDEnfMA4JUw2KwRkiAzgRRGFWHo3TGe5XgqZqlnW47+xyb+LlUt/6bvVQSpDfH3UDgzn1B8zA95wERJjJlKdegvI0/ixcNd21bOm6c7pr20VFRu+mqG9/ub6ww+/VaQzShaHH/093Y/I3dJalkUda68TgOqGu3aTMWC5mUWJXhdktUx0koQ4AoC0BTztviLEii5q0K1rXQB4aup2olphd2ooEt71xyrTMOGGE/xIxB3wil78zSSekD3CP22wW1qGyBEecuWJW7SPhpytIh6qLB0NZva4yaHfbo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(8676002)(4326008)(40460700003)(82310400005)(450100002)(70586007)(70206006)(66574015)(47076005)(83380400001)(5660300002)(426003)(2616005)(336012)(41300700001)(8936002)(7696005)(36756003)(186003)(16526019)(6666004)(478600001)(316002)(54906003)(26005)(40480700001)(1076003)(81166007)(356005)(2906002)(110136005)(36860700001)(82740400003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 19:51:15.1185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1268895-6037-4607-a41e-08db31581f24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C971.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4397
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Graham Sider <graham.sider@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

This allows backing ttm_tt structure with pages from different NUMA
pools.

Tested-by: Graham Sider <graham.sider@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c |  2 +-
 drivers/gpu/drm/ttm/ttm_pool.c   | 13 ++++++++-----
 include/drm/ttm/ttm_pool.h       |  4 +++-
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e7147e304637..4a8164a5320f 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -218,7 +218,7 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 	bdev->funcs = funcs;
 
 	ttm_sys_man_init(bdev);
-	ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
+	ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);
 
 	bdev->vma_manager = vma_manager;
 	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 9f6764bf3b15..1068a41cded1 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -92,7 +92,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 			__GFP_KSWAPD_RECLAIM;
 
 	if (!pool->use_dma_alloc) {
-		p = alloc_pages(gfp_flags, order);
+		p = alloc_pages_node(pool->nid, gfp_flags, order);
 		if (p)
 			p->private = order;
 		return p;
@@ -286,7 +286,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 						  enum ttm_caching caching,
 						  unsigned int order)
 {
-	if (pool->use_dma_alloc)
+	if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE)
 		return &pool->caching[caching].orders[order];
 
 #ifdef CONFIG_X86
@@ -523,29 +523,32 @@ EXPORT_SYMBOL(ttm_pool_free);
  *
  * @pool: the pool to initialize
  * @dev: device for DMA allocations and mappings
+ * @nid: NUMA node to use for allocations
  * @use_dma_alloc: true if coherent DMA alloc should be used
  * @use_dma32: true if GFP_DMA32 should be used
  *
  * Initialize the pool and its pool types.
  */
 void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
-		   bool use_dma_alloc, bool use_dma32)
+		   int nid, bool use_dma_alloc, bool use_dma32)
 {
 	unsigned int i, j;
 
 	WARN_ON(!dev && use_dma_alloc);
 
 	pool->dev = dev;
+	pool->nid = nid;
 	pool->use_dma_alloc = use_dma_alloc;
 	pool->use_dma32 = use_dma32;
 
-	if (use_dma_alloc) {
+	if (use_dma_alloc || nid != NUMA_NO_NODE) {
 		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
 			for (j = 0; j < MAX_ORDER; ++j)
 				ttm_pool_type_init(&pool->caching[i].orders[j],
 						   pool, i, j);
 	}
 }
+EXPORT_SYMBOL(ttm_pool_init);
 
 /**
  * ttm_pool_fini - Cleanup a pool
@@ -559,7 +562,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
 {
 	unsigned int i, j;
 
-	if (pool->use_dma_alloc) {
+	if (pool->use_dma_alloc || pool->nid != NUMA_NO_NODE) {
 		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
 			for (j = 0; j < MAX_ORDER; ++j)
 				ttm_pool_type_fini(&pool->caching[i].orders[j]);
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index ef09b23d29e3..23bd8be6d4f8 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -61,12 +61,14 @@ struct ttm_pool_type {
  * struct ttm_pool - Pool for all caching and orders
  *
  * @dev: the device we allocate pages for
+ * @nid: which numa node to use
  * @use_dma_alloc: if coherent DMA allocations should be used
  * @use_dma32: if GFP_DMA32 should be used
  * @caching: pools for each caching/order
  */
 struct ttm_pool {
 	struct device *dev;
+	int nid;
 
 	bool use_dma_alloc;
 	bool use_dma32;
@@ -81,7 +83,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
 
 void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
-		   bool use_dma_alloc, bool use_dma32);
+		   int nid, bool use_dma_alloc, bool use_dma32);
 void ttm_pool_fini(struct ttm_pool *pool);
 
 int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
-- 
2.39.2

