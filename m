Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A243E68EA66
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 10:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CC210E70C;
	Wed,  8 Feb 2023 09:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2053.outbound.protection.outlook.com [40.107.212.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BF710E6F4;
 Wed,  8 Feb 2023 09:02:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+pfq4pwF+186jVNX3lWlgVIR0ObSz6pj0hu9oJ5n7XUMi47yviCS7Un97D7p1C70tFifjFkzJHiPQc9B6RKA72WqAaPNPkVCovSpVFezWo8shja64MWgDS5xPjSo7z4ybdFq6peYylX3aJd2JF8eS0JcqYZ5MCOkYTdJgDXkzgexCuGZk3qMoMaIJUfPOjX8jNzucYjx0n6wda98KjFniOsK5aYzUmjo7RNmuJS2VLtCHKrubPBN+AGVtzAKV6Y//AmmxMqylePEVVyF5YCd8we5/hEQH7SyWszVjXPlWpixtNtnDTkFGIY1KUMkFBV0OZn0LEEElZCZli90TH0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKBT7tknXpXdR9G2s2ZJFhUaKgOXiUoYqriTj76oRGc=;
 b=f0qcIqY3TdgHMVtS5gRbhBxJuhSu3zFsZ4eGvHpWzcIU7TZ6uy9ofuX9l5NgPHTU1mt3m1tuJkzPN7q0zDPEiw5XQrt73p8bswIzw0/zQH81eapvx8U4uL3Vuf1eqS+k/JmFSsgM4CH+AA0iCBG6Aih9S7lRYxQoPpLiJiebWElgID4+ixGslmbMD3o+wdum3pum/bUTouMiUogmTYvdhApibngc+uzkRXDnspzDVT3X3UXvv3/po3TEb+r0LsB7WEeLy9xyn++IYs7CSHVrgl3mJ2HxXbvwdophZwyYc0qkzldkYHiYsUZ7uzvxdhG9DiDX0een/aQhCYUZ9cbq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKBT7tknXpXdR9G2s2ZJFhUaKgOXiUoYqriTj76oRGc=;
 b=hDh6LX1UGpIGQHsHrve1rJaRBPri3XGbXbhay23QpaE48vJLt1L+RficT2VZJDofpnYIod8GChWUp+1Zr5lfPooJl4p8NPvvm2pTqP/bM7Kdob5p5uywP6ptB0DGQb1zyj93iP/n1lGZzpQyqa1SBfQU3UYsuZgmWticTjsvkhc=
Received: from BN9PR03CA0845.namprd03.prod.outlook.com (2603:10b6:408:13d::10)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Wed, 8 Feb
 2023 09:02:09 +0000
Received: from BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::18) by BN9PR03CA0845.outlook.office365.com
 (2603:10b6:408:13d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18 via Frontend
 Transport; Wed, 8 Feb 2023 09:02:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT093.mail.protection.outlook.com (10.13.177.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 09:02:08 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 8 Feb 2023 03:02:05 -0600
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-graphics-maintainer@vmware.com>
Subject: [PATCH 4/6] drm/ttm: Change the parameters of ttm_range_man_init()
 from pages to bytes
Date: Wed, 8 Feb 2023 14:31:04 +0530
Message-ID: <20230208090106.9659-4-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
References: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT093:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e13629e-225a-44ea-10aa-08db09b328a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hEItlewLzUZ0Eq0WxD/8Pe2+9eMpWZYG1TOHjDl7EFmvOOxa9DrVwm2l0zPv8VMLzhn6kXLSRXx/jPrInxJRGUbuuI4IoJRn9PSVUZBwgpanpN3x5ra5Mb0/Kz2JhLuzUWrDlfeS6jHeg1F5bqFJQk6YK8YXC63z+9J+fcNHjqjqNRo67F3PsKDXRBBFWFRg+WluoEamrb9ueDYe6ucid4O34sBDD2YTTQUAFek6yyk6rsottWHRtKNw9hL9ZSQ5KvUA08yo9G+/i3lh82UTCkv3csNWbW+o3eOjhqwmLOmd2bXzyf8FZGiaXx9gQUa8WD0VDazna22WBeEL/IxEdz+tz5aUSkhYhFYrUW+s965ON1WzN5pkLJ1XCLcwloCktMaMJywz6uXGgPdUy5CeMf8YWH3aNXuB6A+IAIy5rI2cBv5tDuKXdkPlWBUZdr7a+ucHa0FENvGpDShxRDgdyUhwWlhsaqo0tKva6Dei7DMYvPwxFgnddBTJVBYdsQGmBxfExIZtshh+E7ZXgjIreUz+LaPZLD4VlblH5y/sMJjWhkX3Bc+WLb+tVFtJkHFdMn4lPe7GFlC05VrbRQmz749euDXVaZjpO4V+SWUu2Zs8LJaDrs6Gub0B7kAd398nSoGC8hSJ7AJJZOUVcWO0CgCkdCSI8P9Ft6nkNhjGJDaHQ9pxvkG2bhIZ/K70XdF2k5UuCfvwOaqafzNMEBma67qxGfVGuZkgkRTaa9R4wEg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199018)(46966006)(40470700004)(36840700001)(7696005)(81166007)(110136005)(316002)(36860700001)(54906003)(82740400003)(356005)(40460700003)(16526019)(83380400001)(478600001)(82310400005)(186003)(70206006)(70586007)(336012)(8936002)(36756003)(2906002)(86362001)(5660300002)(26005)(8676002)(4326008)(40480700001)(1076003)(2616005)(47076005)(426003)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:02:08.8487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e13629e-225a-44ea-10aa-08db09b328a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402
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
Cc: shashank.sharma@amd.com, arunpravin.paneerselvam@amd.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>, arvind.yadav@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the parameters of ttm_range_man_init_nocheck()
size from page size to byte size.
Cleanup the PAGE_SHIFT operation on the depended caller functions.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
 drivers/gpu/drm/drm_gem_vram_helper.c   | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c     | 4 ++--
 drivers/gpu/drm/ttm/ttm_range_manager.c | 8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 2 +-
 include/drm/ttm/ttm_range_manager.h     | 6 +++---
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 6b270d4662a3..f0dabdfd3780 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -75,10 +75,10 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
 
 static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
 				    unsigned int type,
-				    uint64_t size_in_page)
+				    uint64_t size)
 {
 	return ttm_range_man_init(&adev->mman.bdev, type,
-				  false, size_in_page);
+				  false, size << PAGE_SHIFT);
 }
 
 /**
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index e7be562790de..db1915414e4a 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -999,7 +999,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 		return ret;
 
 	ret = ttm_range_man_init(&vmm->bdev, TTM_PL_VRAM,
-				 false, vram_size >> PAGE_SHIFT);
+				 false, vram_size);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 777d38b211d2..aa8785b6b1e8 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -70,13 +70,13 @@ struct radeon_device *radeon_get_rdev(struct ttm_device *bdev)
 static int radeon_ttm_init_vram(struct radeon_device *rdev)
 {
 	return ttm_range_man_init(&rdev->mman.bdev, TTM_PL_VRAM,
-				  false, rdev->mc.real_vram_size >> PAGE_SHIFT);
+				  false, rdev->mc.real_vram_size);
 }
 
 static int radeon_ttm_init_gtt(struct radeon_device *rdev)
 {
 	return ttm_range_man_init(&rdev->mman.bdev, TTM_PL_TT,
-				  true, rdev->mc.gtt_size >> PAGE_SHIFT);
+				  true, rdev->mc.gtt_size);
 }
 
 static void radeon_evict_flags(struct ttm_buffer_object *bo,
diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index ae11d07eb63a..62fddcc59f02 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -169,7 +169,7 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
  * @bdev: ttm device
  * @type: memory manager type
  * @use_tt: if the memory manager uses tt
- * @p_size: size of area to be managed in pages.
+ * @size: size of area to be managed in bytes.
  *
  * The range manager is installed for this device in the type slot.
  *
@@ -177,7 +177,7 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
  */
 int ttm_range_man_init_nocheck(struct ttm_device *bdev,
 		       unsigned type, bool use_tt,
-		       unsigned long p_size)
+		       u64 size)
 {
 	struct ttm_resource_manager *man;
 	struct ttm_range_manager *rman;
@@ -191,9 +191,9 @@ int ttm_range_man_init_nocheck(struct ttm_device *bdev,
 
 	man->func = &ttm_range_manager_func;
 
-	ttm_resource_manager_init(man, bdev, p_size);
+	ttm_resource_manager_init(man, bdev, size);
 
-	drm_mm_init(&rman->mm, 0, p_size);
+	drm_mm_init(&rman->mm, 0, size);
 	spin_lock_init(&rman->lock);
 
 	ttm_set_driver_manager(bdev, type, &rman->manager);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 9ad28346aff7..4926e7c73e75 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -700,7 +700,7 @@ static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 {
 	int ret;
 	ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
-				 dev_priv->vram_size >> PAGE_SHIFT);
+				 dev_priv->vram_size);
 	ttm_resource_manager_set_used(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
 	return ret;
 }
diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
index 7963b957e9ef..05bffded1b53 100644
--- a/include/drm/ttm/ttm_range_manager.h
+++ b/include/drm/ttm/ttm_range_manager.h
@@ -36,15 +36,15 @@ to_ttm_range_mgr_node(struct ttm_resource *res)
 
 int ttm_range_man_init_nocheck(struct ttm_device *bdev,
 		       unsigned type, bool use_tt,
-		       unsigned long p_size);
+		       u64 size);
 int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
 		       unsigned type);
 static __always_inline int ttm_range_man_init(struct ttm_device *bdev,
 		       unsigned int type, bool use_tt,
-		       unsigned long p_size)
+		       u64 size)
 {
 	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
-	return ttm_range_man_init_nocheck(bdev, type, use_tt, p_size);
+	return ttm_range_man_init_nocheck(bdev, type, use_tt, size);
 }
 
 static __always_inline int ttm_range_man_fini(struct ttm_device *bdev,
-- 
2.32.0

