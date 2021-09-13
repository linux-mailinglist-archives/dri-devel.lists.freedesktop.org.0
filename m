Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E580408619
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 10:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10C36E116;
	Mon, 13 Sep 2021 08:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF79F6E116;
 Mon, 13 Sep 2021 08:10:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SP4CT93cWL3fw4xBglYtu3IItpVn0Qh+5Iw8T6bREEOplVz8vOO753xCaE3IyUArjKrykPdTss6Mx+Nk2oPgXACNy96ZsTzjPJmoMshRFN3qAjLKAudSAq299IJr88F0stvWjArpDGBNsUcgF20z2yaJ517vtY+9CXySwd22wtscoZo81LvJ/Xhy8N+dvIpPfpulIFy6xafAWQeFOKFUQCNMfQg88JcJwlZ/zHEUlWTUKz59h8N6dwkjrzOwr9EJN8enasO7sZtBnorhqM5xcFD2tGL/MQamdsnGYxIw1qzWWswLMREEqW1kYdSsFF048LO16ssGv7jnrrJU5SdDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ux6KZU4umxWQJRC7KemNa7VGbefhLZkkPpqYRSsncNk=;
 b=hDyWfHiG1wsVOtR1nU2bbLqUqPsaDfig78y4Sz4bDVTVSi1GNX29sGU975zInfmJ1BE7wlt/yeRlfKNGY0rK+bLaRyiNsdyuI3szCs1fNbFZwBf5N2FJaNw0lTERajW6sZEO/TaAFOS7BRC9lclIfeqjXF28oJ6STLIYkQ7XgRVq3tWgfGke+4TgrmCGTcf1ULJVak+KKd/XnuLkEL22oyFwcJwN8IPmRQvamkxV1m9/XEoZkKgxB6bMKgWix9F3lzi3sCBgONhvOrSj5aQb+XI09aLaoJQk+mwj9VLXo+Zfa2Pj1NqooYPCKecT6OqCFO/aFSKTPFbimcSPIqHqxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux6KZU4umxWQJRC7KemNa7VGbefhLZkkPpqYRSsncNk=;
 b=afbS/BCzoqiMvIKOBsUqjaRd9SPnOsQfuZln2+/vkVYiq6KpOwEOaNYLGRvxyryqvq43+BN/zpw+itL4Xn82Ux1IvynriRr7c6wAXrl2GZfas5hOxcFmsO2zX4FGrakTry8rh8uusYA6PtQHnElfp7jYkyb117wuXYB0mVao5ek=
Received: from BN1PR10CA0010.namprd10.prod.outlook.com (2603:10b6:408:e0::15)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 08:10:05 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::e4) by BN1PR10CA0010.outlook.office365.com
 (2603:10b6:408:e0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Mon, 13 Sep 2021 08:10:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 08:10:05 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 13 Sep
 2021 03:10:02 -0500
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <christian.koenig@amd.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, xinhui pan <xinhui.pan@amd.com>
Subject: [RFC PATCH v2] drm/ttm: Try to check if new ttm man out of bounds
 during compile
Date: Mon, 13 Sep 2021 16:09:50 +0800
Message-ID: <20210913080950.180752-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba91e078-1786-48fb-c0a7-08d9768de4ef
X-MS-TrafficTypeDiagnostic: MN2PR12MB4319:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4319DE91DB7E4B577DA47C6A87D99@MN2PR12MB4319.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mRPa3QWtw6oqMwoZ6i4wB5rJHlnHwfkKuFEbierYl6T+ai2pw7169WyZ8ba/SbwIkeMGSOyMjcMK5gTPzL9i9KarqhP6tGcHYS8O1ymb0aB5L2t5rDarGQ1dm3kYQiT0AELt8wKqFDT+rweRYOfHHHoBylZqy+EIlf1tBKnxG0AAz/uatNM1niC/DcyHG2LMPTGB/BqjJiGC/w+XMk5ohH8lE62U5xhSX0OJWWC2zv9xFsfa+8O0Rj6+jnwAUHOLLJImAsbWYdfeSz8Y5pDEf3wh7VQV82pc7GG6bBWXx0jZKIsk1YeYjou8CTqUNRK7R3EMsQajCXGhj0pdmiJ7HDhapTL/qLHPgM8ntzLE6KmYIDz4rAOLXrz9v7iwSw3JS/IhjRXX9woSnHnTACvV/xYipctemxeQ9UsUNN2tsVTjOHQKFvp4QhayykqwUg7h+RwEImWEe5vvV6xvpb/maMC2jr2jCwbfQD8ugxamp1fPjHUTQvyX4LVdYWtxf3zwF4FS2SxZw3bBZWPqGhs6iLjMb7mcMglEVVPxW/mrazpIFw0/aMnQJNyl5NXcROemRMnc7vcWNWtRcFPEmF17fFrYcMQUzKvZaMCxZHp7Tx7jodAyaxQd3YvLbhCqODvMkLrr0Ma/jl5vxBiZOpuk2suW832jdedjEQ3C1vqzEXROn6Tj3FeBzz00VzS8XJEtYeuFZ8mPX58Bx4PG0dRCbT/C6M8UO7qFPb6DQiL+8vo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(36840700001)(46966006)(478600001)(16526019)(336012)(8676002)(82310400003)(36860700001)(4326008)(70206006)(356005)(70586007)(5660300002)(6916009)(47076005)(86362001)(54906003)(2906002)(7696005)(426003)(8936002)(81166007)(2616005)(36756003)(186003)(316002)(83380400001)(26005)(1076003)(82740400003)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 08:10:05.2580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba91e078-1786-48fb-c0a7-08d9768de4ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
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

Allow TTM know if vendor set new ttm mananger out of bounds by adding
build_bug_on.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c |  8 ++++----
 include/drm/ttm/ttm_device.h            |  3 +++
 include/drm/ttm/ttm_range_manager.h     | 18 ++++++++++++++++--
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 03395386e8a7..f2d702b66749 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -138,7 +138,7 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
  * Initialise a generic range manager for the selected memory type.
  * The range manager is installed for this device in the type slot.
  */
-int ttm_range_man_init(struct ttm_device *bdev,
+int ttm_range_man_init_nocheck(struct ttm_device *bdev,
 		       unsigned type, bool use_tt,
 		       unsigned long p_size)
 {
@@ -163,7 +163,7 @@ int ttm_range_man_init(struct ttm_device *bdev,
 	ttm_resource_manager_set_used(man, true);
 	return 0;
 }
-EXPORT_SYMBOL(ttm_range_man_init);
+EXPORT_SYMBOL(ttm_range_man_init_nocheck);
 
 /**
  * ttm_range_man_fini
@@ -173,7 +173,7 @@ EXPORT_SYMBOL(ttm_range_man_init);
  *
  * Remove the generic range manager from a slot and tear it down.
  */
-int ttm_range_man_fini(struct ttm_device *bdev,
+int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
 		       unsigned type)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, type);
@@ -197,4 +197,4 @@ int ttm_range_man_fini(struct ttm_device *bdev,
 	kfree(rman);
 	return 0;
 }
-EXPORT_SYMBOL(ttm_range_man_fini);
+EXPORT_SYMBOL(ttm_range_man_fini_nocheck);
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 07d722950d5b..6f23724f5a06 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -285,12 +285,15 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 static inline struct ttm_resource_manager *
 ttm_manager_type(struct ttm_device *bdev, int mem_type)
 {
+	BUILD_BUG_ON(__builtin_constant_p(mem_type)
+		     && mem_type >= TTM_NUM_MEM_TYPES);
 	return bdev->man_drv[mem_type];
 }
 
 static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 					  struct ttm_resource_manager *manager)
 {
+	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
 	bdev->man_drv[type] = manager;
 }
 
diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
index 22b6fa42ac20..7963b957e9ef 100644
--- a/include/drm/ttm/ttm_range_manager.h
+++ b/include/drm/ttm/ttm_range_manager.h
@@ -4,6 +4,7 @@
 #define _TTM_RANGE_MANAGER_H_
 
 #include <drm/ttm/ttm_resource.h>
+#include <drm/ttm/ttm_device.h>
 #include <drm/drm_mm.h>
 
 /**
@@ -33,10 +34,23 @@ to_ttm_range_mgr_node(struct ttm_resource *res)
 	return container_of(res, struct ttm_range_mgr_node, base);
 }
 
-int ttm_range_man_init(struct ttm_device *bdev,
+int ttm_range_man_init_nocheck(struct ttm_device *bdev,
 		       unsigned type, bool use_tt,
 		       unsigned long p_size);
-int ttm_range_man_fini(struct ttm_device *bdev,
+int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
 		       unsigned type);
+static __always_inline int ttm_range_man_init(struct ttm_device *bdev,
+		       unsigned int type, bool use_tt,
+		       unsigned long p_size)
+{
+	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
+	return ttm_range_man_init_nocheck(bdev, type, use_tt, p_size);
+}
 
+static __always_inline int ttm_range_man_fini(struct ttm_device *bdev,
+		       unsigned int type)
+{
+	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
+	return ttm_range_man_fini_nocheck(bdev, type);
+}
 #endif
-- 
2.25.1

