Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BF36FD270
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 00:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019F310E41E;
	Tue,  9 May 2023 22:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5724710E41B;
 Tue,  9 May 2023 22:15:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ampaMCd7xIAMbjuC5bfjgXbjnKSUYQEJ4Z1ngw0CQ6JL+P2qXcF816h2rsw0c0upAeC7eAvvz+uxLAdLQmnKpA2a5y9WrpTicktiJWDZ93MQ0r6ojjIb9E+n/sd7Ota0PTFnzgRlCepBKvOTM/5u/DpwAxlzAOJW65WUZkLug+ACC3ArE/WMOjyllZ3OSr91WFKI+24k/OdE54u4o2YoHyR6B+Hb1h2cX2E6roEYjaEh6gmGM7lo+ibohfQRXdBQXlO/ZwEgyLhXNMh/e97uMI3hf5VA+6Bxv1PHPAFIUD10yd+9gXizi5V3iFgvN+GlLP76UN8beO2FfXe47jzcgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NY217qADMG7VF9uUfKvWt3SvicNbGLYCg4EOhtbiP1E=;
 b=TEwTw0HZHnzsE3MzSaXnIW84U5wPu53j8qD/FQ38WKxP718XbBPXbVgDBhqAAFT3fb7OFWWEcj6yL7yohNG0cKcasfTCod27m4YhNdI32Y2hFBsYnMRMXu168Uh6tWnqm3Gg6zvhWmwz0qgSy9tOZuS/VSKn5qAh+HTGm9QS6Zn4hI7z0cboaFcBbN2QDI5ozSi+xRiA3cSuAYWM4TcU6WBwwIkay5FUDMkyaj96+BmOO55BCDtererT2vub5y53/CgVhM1SxlGneZcWcKdAJjGmT7hHr4cPW4p02oISuIxi5FFaAFf4tMqQ7P0Elzq+Fv16ZHTaVumKlRSagyzM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NY217qADMG7VF9uUfKvWt3SvicNbGLYCg4EOhtbiP1E=;
 b=Qa7UB8Lp9O9YnnkZMDyVe57Bp/DoSXjkjWWENe3PLDinlrl5hZz/4Oj+K1EIfC7BWwz/HjDuf5VpQBFBut5HuuTCzwCbcCE+mOp6Vj/xKkCxnkmHBNOwN3li2JMcDBDELgYeZJ0gQdZGl3ndJv7RfYwZJz88xhXGWET1adygWmE=
Received: from BN8PR12CA0029.namprd12.prod.outlook.com (2603:10b6:408:60::42)
 by CY5PR12MB6408.namprd12.prod.outlook.com (2603:10b6:930:3b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 22:15:31 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:60:cafe::7b) by BN8PR12CA0029.outlook.office365.com
 (2603:10b6:408:60::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.18 via Frontend
 Transport; Tue, 9 May 2023 22:15:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.18 via Frontend Transport; Tue, 9 May 2023 22:15:31 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 9 May
 2023 17:15:28 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/amdgpu: Set TTM pools for memory partitions
Date: Tue, 9 May 2023 18:15:15 -0400
Message-ID: <20230509221516.477025-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509221516.477025-1-alexander.deucher@amd.com>
References: <20230509221516.477025-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|CY5PR12MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: fa501250-ec23-47aa-b2ef-08db50dae6ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: anNVKc/BJ0AtkOy1msj7+SrZivGVTfvIXgMf9li02BzM1aDGEPWn30c7XXKoosK1z4RJk0lYM+gmlw+LpGiFJW4mbAOIisVbZeVREBJR10lUO4dsqSiIoFJPdNvXXcgjZx2/+XBNzikiyyx5JlL0eWeIZ4TRQBKJzplXs1LnzOUWRCxBcUBa4lBEQOlCObDhBG7h9aAG2Bh9gD/rcDo5IcD4tVwD6ua6RevkGBHbbshzgg8CydbXt0cl8jGrjDchLOO937EC2y1kqJTkjFWEZfasrXIkDI5Yhldmeq/tAjPZ5LR6BjsUsAMN6eeNGw16SHryhhYKiDk/bi90Mm3VIx4u1Fmp8zSWE29x9amDC3ffSuyYMFffyoEuH575AmDRLNoS/MVQm7vuV6o8LEpL9CBJvJeBfUYQ8ACkx8lMMgYBFJ1kd++qdl7+xU1FCEL12WPQn1+i312Dfei5xVu6Xk1SfYqUO4FKQN+hdmiTZbp5tI00YXC+0EVaRhjjyPu5kSu+S01mCOYRkGZj9FInY/vnYz0CeiLpvI6tW2ujrDZLyMnjOpEw+vo24HmElz1Yn+TU+lJVaQqpiiMFAdEZA/ozZF7Nq6RKBs8QB8caDOtDEsEtGBXOoJ6fZMX5ww4nfU8fCBzUG+f9nnM55BngyRRJue4CqgRG68/54vSHZdcP0QZzRO3HBBx8Xwrpfz1xjirr+M+jcUScYn04BkuARph9VRNKqgGmcL/YLDCElgg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(2616005)(2906002)(186003)(36860700001)(336012)(86362001)(4326008)(41300700001)(36756003)(16526019)(450100002)(70206006)(70586007)(47076005)(1076003)(83380400001)(426003)(26005)(5660300002)(40460700003)(7696005)(82310400005)(6666004)(110136005)(82740400003)(81166007)(54906003)(40480700001)(356005)(316002)(8936002)(8676002)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 22:15:31.0149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa501250-ec23-47aa-b2ef-08db50dae6ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6408
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
Cc: Philip Yang <Philip.Yang@amd.com>, Mukul
 Joshi <mukul.joshi@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Philip Yang <Philip.Yang@amd.com>

For native mode only, create TTM pool for each memory partition to store
the NUMA node id, then the TTM pool will be selected using memory
partition id to allocate memory from the correct partition.

Acked-by: Christian König <christian.koenig@amd.com>
(rajneesh: changed need_swiotlb and need_dma32 to false for pool init)
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Acked-and-tested-by:  Mukul Joshi <mukul.joshi@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 61 ++++++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
 2 files changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 1582ef092bf1..f4f92133f505 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -635,6 +635,7 @@ struct amdgpu_ttm_tt {
 	struct task_struct	*usertask;
 	uint32_t		userflags;
 	bool			bound;
+	int32_t			pool_id;
 };
 
 #define ttm_to_amdgpu_ttm_tt(ptr)	container_of(ptr, struct amdgpu_ttm_tt, ttm)
@@ -1063,6 +1064,7 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
 		return NULL;
 	}
 	gtt->gobj = &bo->base;
+	gtt->pool_id = NUMA_NO_NODE;
 
 	if (abo->flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC)
 		caching = ttm_write_combined;
@@ -1089,6 +1091,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(ttm);
+	struct ttm_pool *pool;
 	pgoff_t i;
 	int ret;
 
@@ -1103,7 +1106,11 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 	if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
 		return 0;
 
-	ret = ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
+	if (adev->mman.ttm_pools && gtt->pool_id >= 0)
+		pool = &adev->mman.ttm_pools[gtt->pool_id];
+	else
+		pool = &adev->mman.bdev.pool;
+	ret = ttm_pool_alloc(pool, ttm, ctx);
 	if (ret)
 		return ret;
 
@@ -1124,6 +1131,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 {
 	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(ttm);
 	struct amdgpu_device *adev;
+	struct ttm_pool *pool;
 	pgoff_t i;
 
 	amdgpu_ttm_backend_unbind(bdev, ttm);
@@ -1142,7 +1150,13 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 		ttm->pages[i]->mapping = NULL;
 
 	adev = amdgpu_ttm_adev(bdev);
-	return ttm_pool_free(&adev->mman.bdev.pool, ttm);
+
+	if (adev->mman.ttm_pools && gtt->pool_id >= 0)
+		pool = &adev->mman.ttm_pools[gtt->pool_id];
+	else
+		pool = &adev->mman.bdev.pool;
+
+	return ttm_pool_free(pool, ttm);
 }
 
 /**
@@ -1732,6 +1746,41 @@ static int amdgpu_ttm_reserve_tmr(struct amdgpu_device *adev)
 	return 0;
 }
 
+static int amdgpu_ttm_pools_init(struct amdgpu_device *adev)
+{
+	int i;
+
+	if (!adev->gmc.is_app_apu || !adev->gmc.num_mem_partitions)
+		return 0;
+
+	adev->mman.ttm_pools = kcalloc(adev->gmc.num_mem_partitions,
+				       sizeof(*adev->mman.ttm_pools),
+				       GFP_KERNEL);
+	if (!adev->mman.ttm_pools)
+		return -ENOMEM;
+
+	for (i = 0; i < adev->gmc.num_mem_partitions; i++) {
+		ttm_pool_init(&adev->mman.ttm_pools[i], adev->dev,
+			      adev->gmc.mem_partitions[i].numa.node,
+			      false, false);
+	}
+	return 0;
+}
+
+static void amdgpu_ttm_pools_fini(struct amdgpu_device *adev)
+{
+	int i;
+
+	if (!adev->gmc.is_app_apu || !adev->mman.ttm_pools)
+		return;
+
+	for (i = 0; i < adev->gmc.num_mem_partitions; i++)
+		ttm_pool_fini(&adev->mman.ttm_pools[i]);
+
+	kfree(adev->mman.ttm_pools);
+	adev->mman.ttm_pools = NULL;
+}
+
 /*
  * amdgpu_ttm_init - Init the memory management (ttm) as well as various
  * gtt/vram related fields.
@@ -1758,6 +1807,12 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;
 	}
+
+	r = amdgpu_ttm_pools_init(adev);
+	if (r) {
+		DRM_ERROR("failed to init ttm pools(%d).\n", r);
+		return r;
+	}
 	adev->mman.initialized = true;
 
 	/* Initialize VRAM pool with all of VRAM divided into pages */
@@ -1905,6 +1960,8 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 	if (!adev->mman.initialized)
 		return;
 
+	amdgpu_ttm_pools_fini(adev);
+
 	amdgpu_ttm_training_reserve_vram_fini(adev);
 	/* return the stolen vga memory back to VRAM */
 	if (!adev->gmc.is_app_apu) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index da6544fdc8dd..8ef048a0a33e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -49,6 +49,7 @@ struct amdgpu_gtt_mgr {
 
 struct amdgpu_mman {
 	struct ttm_device		bdev;
+	struct ttm_pool			*ttm_pools;
 	bool				initialized;
 	void __iomem			*aper_base_kaddr;
 
-- 
2.40.1

