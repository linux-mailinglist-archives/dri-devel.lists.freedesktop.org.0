Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9563851A14F
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8397410EC13;
	Wed,  4 May 2022 13:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D82010E972;
 Wed,  4 May 2022 13:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fb6H2QHb+L8o+xop9Uo9GGnWtDIhK/qHIdM8SQ6e7wu2ZMLa24x9nKD7ZG2RXRMnIdtewVhRt9iasQbc5cSr0o1cCisdGz8BtkKxULJIc7ilBZaIimw2rV4BOgyRxsKsM1dHLis05uv1BNRfHnONpnhC6ZR6PEUNqh5HyMpuKwGOZfYzEUwjwgSfrbTr25tWV6oSUzHNXP03mLUuC8JjabZzQSFG38fgJFVbHQKOfsT+nroOZomAutlkKOhYrt6+0QvtaItq0y3XaY9Qn5ol4JaDi2kLJgvwQOS8PVIXmD8SUQbW52lID6ZO3w2WvgjMt2M53PaqH+LsiZYLCylDIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qj+mXx2NAy9JY3dAi4n7czWCed5Z7PLjZzgRjs/fKhw=;
 b=KVXvz9+5pHXQaJMpQvwGDl80AI1U3KE1XCJXFSwStqh40xQbdwnm5RlcYzhtLNBXDwM3ak3tuBDikIYOXk+HARD+ZrZp7IZ7Ea1t7oRjnYy8qZKfe8MihHrALWAR42lhGkX1TdsGVYZ8Y9UWqTMaXsz4btVNAKz8ao953LKS+sEDzHnXnWIcZ/DhL4GemcxkXujRPiBkUkel78oAbKo3ZIewD0CT4FFWd7GLsGxJS0O6IUGitJMFOYdwGHL0agS+BN4c/ds3BG2ldv5WPx02kkbO5jMhDVnaW4ddcGpv+5zd29ZjFuUWd/ensvAA7nOdsua0UQtqZ432iXIFz1o7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qj+mXx2NAy9JY3dAi4n7czWCed5Z7PLjZzgRjs/fKhw=;
 b=Z7XFx6WLX0G4ODgDiPBNMHH/2jR9RgDv6/u3PLBW3M7nUtnRVlmuqUm6jE5lJCdU4knu9r0HrwPvNJT8VbODQnw57QiB5iDS5rdHcACYoTpm+/jMM8lkLM5uqIjUP5V+8bn6xxUaeQD2momZ0VoYcu9TZ837SH76YJztQJMjVuE=
Received: from DS7P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::22) by
 CH2PR12MB4199.namprd12.prod.outlook.com (2603:10b6:610:a7::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Wed, 4 May 2022 13:48:45 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::f0) by DS7P222CA0013.outlook.office365.com
 (2603:10b6:8:2e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Wed, 4 May 2022 13:48:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 13:48:45 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 08:48:44 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: [PATCH 1/2] Revert "drm/amdgpu: disable runpm if we are the primary
 adapter"
Date: Wed, 4 May 2022 09:48:32 -0400
Message-ID: <20220504134833.1672728-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bfb7d61d-aaa1-41eb-f1bf-08da2dd4cf05
X-MS-TrafficTypeDiagnostic: CH2PR12MB4199:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4199C1B648D24F6F7C547A9DF7C39@CH2PR12MB4199.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ujTmJCYpfm1e2PEk+61aIVM2aACIS+mywQEGPL9fZGdzlFWZDE+2d6vwpymDuo162WP6U1M4W56l7O4XjHwe1yAKLunyIrvvcC8QxPoWHrnQ169X28EE5f0kPb5U2oIWxWkWZ8MTviV/YNiWA7f9EGtZCBCMi3X+66MPsme2BhmNWcMTqxXYV1R+zyE5JakOVoN1Ebmxiw2Yu72d36Xz438FYUOWABqfupYAtO36N/Zu0i0jdgM95mKH5D0mpH5fCFGpJx0kjRHLrEj6LVdJz3rsxbmINKNuV80ofD5tXLC5RffwH8HatFfsO0y01zd6IDgMgedlz28hBkhkw7AMNrxXUBBYvpVjqOszubwIvl637UxpteybTOMRySUL7V/qIk8MZ+PANzGXLUooN/k7j7yBfEcyfm6SwknLj/HbZZctQc48KMB+qD8QJ6vG4YLTqaAnFYSafSthOytpfJs9MJKpngHmjiJAPX5M1/EL02zfWzmQDLI+DdujPSxI0kII6GRLZ3OCKSI66gzdQvYKp4/6+rZNm37cls/JxOlHQWofE1eIUHpQIZ2rjZxBF8ymTvfIYEMOS8ZkhSno2Id96XGSPS/yD36n4FvslkKPlXhL7umHHzmtqqhkWpgwurRxS76HFFwrcKskj7d/jPTHJv1nj6vLNyBMraNcG1LZ8x7LTDbAyTODEUxoGnoxEXXYrqc0ORxLoe5+Z0GYzuEqfldVvGuq1yY2wJS6aAkRUQY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(186003)(5660300002)(36756003)(316002)(2906002)(7696005)(36860700001)(16526019)(70206006)(83380400001)(8676002)(4326008)(70586007)(8936002)(110136005)(426003)(40460700003)(47076005)(336012)(86362001)(82310400005)(508600001)(2616005)(356005)(81166007)(6666004)(1076003)(26005)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:48:45.4842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb7d61d-aaa1-41eb-f1bf-08da2dd4cf05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4199
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

