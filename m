Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07850886753
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 08:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3901710ED3D;
	Fri, 22 Mar 2024 07:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nR6dUVtJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D670510ED3D;
 Fri, 22 Mar 2024 07:08:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWaeaDkrxoZHtjQmjs+pVo67OAI5/FT0j0Ho/WqKQUL5V+BO6j78GSODTOWMdjXd3I7ZhuDuFyLoi2PcI+6gOFb6DmtB+SU5aFWio+fCs6Ey1aVWMwPEsIcnX2lgbLvvRB5fFZ/VwbszHBWmakyNQ0xs3vjAReYmIPFJcVb8zAdFxdzBU4/1lkmkCzMGk/UlNkHKBligct2Fi8Xw8GDocyODrETqVJaB1cMwHMNMJ2naZjgdh3IpbtyD7i42zHFkrRx3Z23DutI7o9ndD/+/JunP/t/e078hqQtxEyKO+U3jKe6fdJEbnBdDFqEi5jXvM9GdxO4YiqcfaDag9LTLQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WS1XrUjCnoipY3xtN+JXgw8PuYhjGQdMVdsCD2GI5QY=;
 b=lOyjxfFPF+RgETttASkUoIXKVS7lv14vAWuiDsbkjs2icZvb6pULmdpClvuPBAhXUyoiMXYfQCiqUg9mQ3Y0z1P4ZmlSbZrDHus+z3vju1zd2DTZyRMEk5aUYTXI51V1n+GA7ku/I40J7zrGffpx13BzYGmAgiy+VwVybiw9sDV0MI0ngDCQtUawUY0PymITRhLP6XNiyl66+xebwKk8nGwEp3Xc+6/P6Oy7O3KSsXx6W4DU7ZoBfd3Q6osbzA1+IsP0SIwkMFY4gz5WBF7tcyaIowAK1BX6stjF3GAIDO0R3MjKeTKwlzGgThTWbm1a23DHNXaljPkXkpd+yfFQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WS1XrUjCnoipY3xtN+JXgw8PuYhjGQdMVdsCD2GI5QY=;
 b=nR6dUVtJfUUB13TBzDM2v1vxEktMbbPhyjSVSE3B1oURGWV7kL+Z1Cd84ng6SCclTJr7d05XfapKCKJvagl2akPcCm7H4dj37mNW7+qrOkHUzWpkOslxtWjOoQaPRHjPuTcDAg/vAAVVzopWKbmecJljY+w/2wva1g3c+Fy1tgA=
Received: from BLAPR03CA0135.namprd03.prod.outlook.com (2603:10b6:208:32e::20)
 by MW3PR12MB4394.namprd12.prod.outlook.com (2603:10b6:303:54::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 07:08:22 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::8f) by BLAPR03CA0135.outlook.office365.com
 (2603:10b6:208:32e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19 via Frontend
 Transport; Fri, 22 Mar 2024 07:08:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Fri, 22 Mar 2024 07:08:22 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 22 Mar
 2024 02:08:21 -0500
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <felix.kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Joe Greathouse <joseph.greathouse@amd.com>
Subject: [PATCH] drm/ttm: Implement strict NUMA pool allocations
Date: Fri, 22 Mar 2024 03:07:53 -0400
Message-ID: <20240322070753.69324-1-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|MW3PR12MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: 861ced98-a609-44ac-a775-08dc4a3edc1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wCOA6TMj5EY3CImRpUNZS56gq2ia7xf3IhSpwDuXpZ4/Nv++2xp9J/X+o1Y0ubgZefX2Ob/Y6UWFTbwYvNobTg35nCWjYmCJ94iRJT59PZyGXZ5mJZG2HUlCQTYre8NGDyS7qs6orjL1j7AV45Ph8vQfWHQrOVGX514sc64zinA0azcCrKb9XAn1apDF//OgKNKUjcLyLIuvJZ43iyoZGQu5E5zQpn/B0BugObGqbZRReGFHVoofiq5JDBIhzlb8GhWCfC5uZuTv46hC7YU+HdbHyqEJitO0jkj1vmWk06OqdR9h7grVSGxOg4wUtyVbaxABpbRKujz5AUtuEZqjiNx5e5eGkhm+zFT102/UW6JUbev4whaHyzKiL+krN3kWvEaiO0O51R5E5lZenbgLeYis2+9e5yoHt+32CUu3b6XSEO8U7yShTXkVBEXqc5USDr0PPRZgXzIrEamsuhaUYJBIFO5c77OzMP6ihzIDOhTyJkr0JW6DmtQe6JuR6BYKyftsVSNohsSrLCwSKJcNeHjHWnpb/UEpamFZRE2qXib3jzrJT9K759WO6NwS7NEyU0c55I92/eFN5OGHwlJkuUmRhvhNZp2us8H3Kxrc++UQ6sJJjXFThss80B7N2OvnffrAIITW9pF8lfOtt4+zQbREJGroy58rVLTNB55Pnm+EXgQpW2oXkPjNSKhm5+S7vVStal66dZxPx7Rg0TaJG5xMN1T6dPL3HaRRmr27KBrJ+tOHB+1q7drn1LMMXryl
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 07:08:22.0723 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 861ced98-a609-44ac-a775-08dc4a3edc1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change allows TTM to be flexible to honor NUMA localized
allocations which can result in significant performance improvement on a
multi socket NUMA system. On GFXIP 9.4.3 based AMD APUs, we see
manyfold benefits of this change resulting not only in ~10% performance
improvement in certain benchmarks but also generating more consistent
and less sporadic results specially when the NUMA balancing is not
explecitely disabled. In certain scenarios, workloads show a run-to-run
variability e.g. HPL would show a ~10x performance drop after running
back to back 4-5 times and would recover later on a subsequent run. This
is seen with memory intensive other workloads too. It was seen that when
CPU caches were dropped e.g. sudo sysctl -w vm.drop_caches=1, the
variability reduced but the performance was still well below a good run.

Use of __GFP_THISNODE flag ensures that during memory allocation, kernel
prioritizes memory allocations from the local or closest NUMA node
thereby reducing memory access latency. When memory is allocated using
__GFP_THISNODE flag, memory allocations will predominantly be done on
the local node, consequency, the shrinkers may priotitize reclaiming
memory from caches assocoated with local node to maintain memory
locality and minimize latency, thereby provide better shinker targeting.

Reduced memory pressure on remote nodes, can also indirectly influence
shrinker behavior by potentially reducing the frequency and intensity of
memory reclamation operation on remote nodes and could provide improved
overall system performance.

While this change could be more beneficial in general, i.e., without the
use of a module parameter, but in absence of widespread testing, limit
it to the AMD GFXIP 9.4.3 based ttm pool initializations only.


Cc: Joe Greathouse <joseph.greathouse@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h       |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c   |  8 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c   |  7 ++++++-
 drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 10 +++++-----
 drivers/gpu/drm/ttm/ttm_device.c          |  2 +-
 drivers/gpu/drm/ttm/ttm_pool.c            |  7 ++++++-
 include/drm/ttm/ttm_pool.h                |  4 +++-
 7 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9c62552bec34..96532cfc6230 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -253,6 +253,7 @@ extern int amdgpu_user_partt_mode;
 extern int amdgpu_agp;
 
 extern int amdgpu_wbrf;
+extern bool strict_numa_alloc;
 
 #define AMDGPU_VM_MAX_NUM_CTX			4096
 #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 80b9642f2bc4..a183a6b4493d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -781,6 +781,14 @@ int queue_preemption_timeout_ms = 9000;
 module_param(queue_preemption_timeout_ms, int, 0644);
 MODULE_PARM_DESC(queue_preemption_timeout_ms, "queue preemption timeout in ms (1 = Minimum, 9000 = default)");
 
+/**
+ * DOC: strict_numa_alloc(bool)
+ * Policy to force NUMA allocation requests from the proximity NUMA domain only.
+ */
+bool strict_numa_alloc;
+module_param(strict_numa_alloc, bool, 0444);
+MODULE_PARM_DESC(strict_numa_alloc, "Force NUMA allocation requests to be satisfied from the closest node only (false = default)");
+
 /**
  * DOC: debug_evictions(bool)
  * Enable extra debug messages to help determine the cause of evictions
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index b0ed10f4de60..a9f78f85e28c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1768,6 +1768,7 @@ static int amdgpu_ttm_reserve_tmr(struct amdgpu_device *adev)
 
 static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
 {
+	bool policy = true;
 	int i;
 
 	if (!adev->gmc.is_app_apu || !adev->gmc.num_mem_partitions)
@@ -1779,11 +1780,15 @@ static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
 	if (!adev->mman.ttm_pools)
 		return -ENOMEM;
 
+	/* Policy not only depends on the module param but also on the ASIC
+	 * setting use_strict_numa_alloc as well.
+	 */
 	for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
 		ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
 			      adev->gmc.mem_partitions[i].numa.node,
-			      false, false);
+			      false, false, policy && strict_numa_alloc);
 	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
index 2d9cae8cd984..6ff47aac570a 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
@@ -87,7 +87,7 @@ static struct ttm_pool *ttm_pool_pre_populated(struct kunit *test,
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 
-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
 
 	err = ttm_pool_alloc(pool, tt, &simple_ctx);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -152,7 +152,7 @@ static void ttm_pool_alloc_basic(struct kunit *test)
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 
 	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, params->use_dma_alloc,
-		      false);
+		      false, false);
 
 	KUNIT_ASSERT_PTR_EQ(test, pool->dev, devs->dev);
 	KUNIT_ASSERT_EQ(test, pool->nid, NUMA_NO_NODE);
@@ -219,7 +219,7 @@ static void ttm_pool_alloc_basic_dma_addr(struct kunit *test)
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 
-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
 
 	err = ttm_pool_alloc(pool, tt, &simple_ctx);
 	KUNIT_ASSERT_EQ(test, err, 0);
@@ -349,7 +349,7 @@ static void ttm_pool_free_dma_alloc(struct kunit *test)
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 
-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false);
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, true, false, false);
 	ttm_pool_alloc(pool, tt, &simple_ctx);
 
 	pt = &pool->caching[caching].orders[order];
@@ -380,7 +380,7 @@ static void ttm_pool_free_no_dma_alloc(struct kunit *test)
 	pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_NULL(test, pool);
 
-	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false);
+	ttm_pool_init(pool, devs->dev, NUMA_NO_NODE, false, false, false);
 	ttm_pool_alloc(pool, tt, &simple_ctx);
 
 	pt = &pool->caching[caching].orders[order];
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index f5187b384ae9..540e8a44f015 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -215,7 +215,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
 
 	ttm_sys_man_init(bdev);
 
-	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32);
+	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32, false);
 
 	bdev->vma_manager = vma_manager;
 	spin_lock_init(&bdev->lru_lock);
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index dbc96984d331..73aafd06c361 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -447,6 +447,9 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	else
 		gfp_flags |= GFP_HIGHUSER;
 
+	if (pool->use_strict_numa_alloc)
+		gfp_flags |= __GFP_THISNODE;
+
 	for (order = min_t(unsigned int, MAX_ORDER, __fls(num_pages));
 	     num_pages;
 	     order = min_t(unsigned int, order, __fls(num_pages))) {
@@ -555,7 +558,8 @@ EXPORT_SYMBOL(ttm_pool_free);
  * Initialize the pool and its pool types.
  */
 void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
-		   int nid, bool use_dma_alloc, bool use_dma32)
+		   int nid, bool use_dma_alloc, bool use_dma32,
+		   bool use_strict_numa_alloc)
 {
 	unsigned int i, j;
 
@@ -565,6 +569,7 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 	pool->nid = nid;
 	pool->use_dma_alloc = use_dma_alloc;
 	pool->use_dma32 = use_dma32;
+	pool->use_strict_numa_alloc = use_strict_numa_alloc;
 
 	if (use_dma_alloc || nid != NUMA_NO_NODE) {
 		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 30a347e5aa11..6b7bdc952466 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -72,6 +72,7 @@ struct ttm_pool {
 
 	bool use_dma_alloc;
 	bool use_dma32;
+	bool use_strict_numa_alloc;
 
 	struct {
 		struct ttm_pool_type orders[MAX_ORDER + 1];
@@ -83,7 +84,8 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
 
 void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
-		   int nid, bool use_dma_alloc, bool use_dma32);
+		   int nid, bool use_dma_alloc, bool use_dma32,
+		   bool use_strict_numa_alloc);
 void ttm_pool_fini(struct ttm_pool *pool);
 
 int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
-- 
2.34.1

