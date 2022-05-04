Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD53D51A105
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DE310EBA2;
	Wed,  4 May 2022 13:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761F510EC98;
 Wed,  4 May 2022 13:36:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcUuJilEQ99VAUMRPqTwKfeXVxq0NbZwOMLWCBJMvZJJWVm1ci9oZsXhhZcqtO6VBmCADjHNO30A2XCUlq9MpNepSr1Ll7HmHAWq2Q5/uAQUsNdM0oaW/dV2lqDJ5zWsSvafhSllxE+iVZ7PNWt+WRnJ/IxeOo68w3VVsdexIrecfSITfroDJK1H12OOiqER74HPOcDUW9/7IPutIHAxawqsY3t0cG8gl7Au5to4MGpspwbXCvuu/K2ugUyTzrq+eA/onbFg1sZv3O6kzsbJ5pzH7cxDU6aMMZMMipYbBALGZuU6otnqkTxyTC+lrSN86+1Y6PRdh+0D/qVVP6M5PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qj+mXx2NAy9JY3dAi4n7czWCed5Z7PLjZzgRjs/fKhw=;
 b=iDFYQwxx8Nb7XfsW2rKtr4Ic3DKiZAvGmOmUrEdmwoQm6+kobiOXZH0Fl7GZFWsbl3Vh3vVLY2Zpu8rExNpHStStRLkr9JntCzfXNgmUgbXsrjpJsFxIbzlG9UgmMVrj3qkXgF9WKthDHG3nd77dqxiuhZtxNZW3k1gho2s5jcNXl6wrc46gSmWSuL0wuUqxzMJm1d4WJzOeUCnfN5OSiAZbb224ANrqT7HS8vHiH/GaqWvVkBVQI1rsfgi4GqzLUmWG5kUp0DszV/Id/Eq2jwTypv8kzAUlGGoQuF701Qpc/haT1C5pM9SdsS54cxdDUIHm1MDc+x3IEfdd9wWQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qj+mXx2NAy9JY3dAi4n7czWCed5Z7PLjZzgRjs/fKhw=;
 b=FW1Bm5V76PQDYYgZix/kP8gp4F1VJ/jQmjuGT3FPWuAwGd65MWRNmv2H2ik9VOFr/2JbFR/SVJR+Dp8U9T2qtgnSfp/KorB6QwAChF1KKNKzRMOm1bbofxDH7yIoMmiF4IsaeckR5dxmYc24WN8N9kfUorYz9D9zeqISSr4QQ9o=
Received: from DS7PR03CA0234.namprd03.prod.outlook.com (2603:10b6:5:3ba::29)
 by DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.28; Wed, 4 May
 2022 13:36:31 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::e0) by DS7PR03CA0234.outlook.office365.com
 (2603:10b6:5:3ba::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25 via Frontend
 Transport; Wed, 4 May 2022 13:36:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 13:36:31 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 08:36:30 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] Revert "drm/amdgpu: disable runpm if we are the primary
 adapter"
Date: Wed, 4 May 2022 09:36:17 -0400
Message-ID: <20220504133618.1670080-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc9dcc0-83f3-44b6-4ded-08da2dd31969
X-MS-TrafficTypeDiagnostic: DM4PR12MB6445:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB644544D3564391CBF3EA90C1F7C39@DM4PR12MB6445.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LNPhbYMB3TK7ZLTG93Ugp7vSQWraMoETJuKqemVppn/nfVjNPJg6ah4qnX4G6ghBFR7HO1csTYPYhMxi+4V8UOWwk+iTTNp8yKMyXnOFFnoHALYtbRpD+bDpHud+fyz6U2TeH7RmRITbGUa1coM8tIdbyGRQbKDffGddCTIE9BcsljcoMf3iGKgAiWPeX3T+o/5A56vR9UZBsB7yh+0QWUyGrl6kmnHQfVPaEHdr+Fj0VoPJPjFUv08uylp3+YivfJyRFegXAQzyYbPFzgWUqwxocYjYuwb1goZW5Ygb28cBrCWn7LahQg2mXdfn5WBXKBS/qkTwcfYoF5yIX5dEBKPg821GkhVB0N6+4pRDGgH8ZHxOWQa+mlSbCPvEiIi1Wi39/1wzWLzP1/xebgO18hzI3LliltV4Q82PXpbisClYMs3yID/rq+AQfVZkQwEBQV+TaOxWvP0PdGDJ3kqPy+Keo3V+nBvIwZIzZIgFfdua3X04IpOQf0ENICYWNbX5JWzsDOAm8i+6d7+FkeaH5clPp7C4+LQ5ZswKGfX11aFVUNpiqSFBROriXS2e4Q/p+SH4VIBRU1JRxUOvtxMfgTTcdDGjObAu+NH2ywfOdsp1DIiW5I4hXMwbtQrRzyL2DT1VAXUoHof4Uw7eNto8WACb/WolnAhFnZXpB8DxqywYcnAtgZhHXlYp7IdzNmVpV4sAPfpvNhssF8FpM/87pYtFZQuevU3wSiWRaV9uHWY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(8676002)(4326008)(70206006)(450100002)(7696005)(5660300002)(8936002)(316002)(70586007)(6666004)(81166007)(110136005)(356005)(508600001)(36860700001)(86362001)(2616005)(16526019)(83380400001)(82310400005)(186003)(1076003)(40460700003)(336012)(426003)(47076005)(36756003)(26005)(2906002)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:36:31.2933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc9dcc0-83f3-44b6-4ded-08da2dd31969
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit b95dc06af3e683d6b7ddbbae178b2b2a21ee8b2b.

This workaround is no longer necessary.  We have a better workaround
in commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are displays attached (v3)").

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 28 -------------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  6 ------
 3 files changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index d557f4db2565..682ec660f2c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -981,7 +981,6 @@ struct amdgpu_device {
 	bool                            runpm;
 	bool                            in_runpm;
 	bool                            has_pr3;
-	bool                            is_fw_fb;
 
 	bool                            pm_sysfs_en;
 	bool                            ucode_sysfs_en;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index ebd37fb19cdb..3c198b2a86db 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -38,7 +38,6 @@
 #include <linux/mmu_notifier.h>
 #include <linux/suspend.h>
 #include <linux/cc_platform.h>
-#include <linux/fb.h>
 
 #include "amdgpu.h"
 #include "amdgpu_irq.h"
@@ -1950,26 +1949,6 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 static const struct drm_driver amdgpu_kms_driver;
 
-static bool amdgpu_is_fw_framebuffer(resource_size_t base,
-				     resource_size_t size)
-{
-	bool found = false;
-#if IS_REACHABLE(CONFIG_FB)
-	struct apertures_struct *a;
-
-	a = alloc_apertures(1);
-	if (!a)
-		return false;
-
-	a->ranges[0].base = base;
-	a->ranges[0].size = size;
-
-	found = is_firmware_framebuffer(a);
-	kfree(a);
-#endif
-	return found;
-}
-
 static void amdgpu_get_secondary_funcs(struct amdgpu_device *adev)
 {
 	struct pci_dev *p = NULL;
@@ -2000,8 +1979,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	unsigned long flags = ent->driver_data;
 	int ret, retry = 0, i;
 	bool supports_atomic = false;
-	bool is_fw_fb;
-	resource_size_t base, size;
 
 	/* skip devices which are owned by radeon */
 	for (i = 0; i < ARRAY_SIZE(amdgpu_unsupported_pciidlist); i++) {
@@ -2068,10 +2045,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	}
 #endif
 
-	base = pci_resource_start(pdev, 0);
-	size = pci_resource_len(pdev, 0);
-	is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
-
 	/* Get rid of things like offb */
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
 	if (ret)
@@ -2084,7 +2057,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	adev->dev  = &pdev->dev;
 	adev->pdev = pdev;
 	ddev = adev_to_drm(adev);
-	adev->is_fw_fb = is_fw_fb;
 
 	if (!supports_atomic)
 		ddev->driver_features &= ~DRIVER_ATOMIC;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 51bb977154eb..497478f8a5d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -185,12 +185,6 @@ int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
 			adev->runpm = true;
 			break;
 		}
-		/* XXX: disable runtime pm if we are the primary adapter
-		 * to avoid displays being re-enabled after DPMS.
-		 * This needs to be sorted out and fixed properly.
-		 */
-		if (adev->is_fw_fb)
-			adev->runpm = false;
 
 		amdgpu_runtime_pm_quirk(adev);
 
-- 
2.35.1

