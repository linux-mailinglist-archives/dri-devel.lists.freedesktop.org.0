Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9035751A14B
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60AF10E057;
	Wed,  4 May 2022 13:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40CE10E057;
 Wed,  4 May 2022 13:48:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5nHmusXRB1z8GwcFGhvXCFT4QQJ3KNaO5kO6Daxw7UVq+2obnhdTpeeeG6EHAg2IMFTiJlrlI339OGdNypErjlSn/S62MsRBVeIfG5dIPOf7oeXnaSdFrN+Qw2mTQYXVGoA/IMssm4JGNb+ZjNijm7CqAVseMPsSEKfjFMvRXmW2AQA7H2xj0jdjpoBPS/k37EBKoBN/Et6hyX7Zffr7T7FlURw90827rWyS1CSNkGx+eQ7R+W9CMUjVE+Ziqv8sdKP7stb5DBYLIExyyoAt/lWdVDxRdSuDsYKqoCjYh3KfpsoJFmto6HO9OIUSG+s3Vd6sSANYSo5D1PsaWMt6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNEwRkM/oeT/JZA1BHdLz+fGM1EKplmX67+VQp95irA=;
 b=esepTZaxeGhF4Zvf05EgmJ21A8CDWJUtLiM5CDup8bcfhg0jSYp0lZszV2IoE/7AKmXyS2j1N04jdbfdfP/EqNI3vX6sNh73yptc/XNLlkqUs/ZwHlYVvBHe6kMygOdRNt/0iB2bTOCiUcq4AVwW4swMt64870+7heKrpOxOqDW38JIkCBEBDGa5ynccxBRa8YvxlmMKntJ6zbj10R8WpJSjCtGkpSdbylsH1LJ522wUHE7N7VwYe2RsVbnwD2KXBdMHeTat9B2ixWA2nLLzE7f5UpFsX87xZfUfYm9W/8agf/iIFW+GXEUqQp6xKQfn12OHxS/HsT3Wn6PGg1+6TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNEwRkM/oeT/JZA1BHdLz+fGM1EKplmX67+VQp95irA=;
 b=aeMnP1QpRyhbLkbbOh7YGqZb9DBJPlcF4iPnkd+oIIjpgp3uw508y2WVHy10Bl53bSYgrVRGBVFUpwCUFI/m3OUiMQM65hfMWTdarlbNtGagVmBFC6Tn/KsoSclG47gdV23pgFSCIJIKHoZFzWLV54lRb704NRep8jV01pu8Z54=
Received: from DS7P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::16) by
 BN6PR1201MB0146.namprd12.prod.outlook.com (2603:10b6:405:59::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 13:48:46 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::40) by DS7P222CA0020.outlook.office365.com
 (2603:10b6:8:2e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Wed, 4 May 2022 13:48:46 +0000
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
 2022 08:48:45 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: [PATCH 2/2] Revert "fbdev: fbmem: add a helper to determine if an
 aperture is used by a fw fb"
Date: Wed, 4 May 2022 09:48:33 -0400
Message-ID: <20220504134833.1672728-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504134833.1672728-1-alexander.deucher@amd.com>
References: <20220504134833.1672728-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54ab7a14-707b-4a11-b241-08da2dd4cf48
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0146:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0146836327D47F4CEC5893A5F7C39@BN6PR1201MB0146.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jF8Xx5t4R1RCNzidacs5CDY9jZWvh3AtWK8bpy/zTEjtfWaZyvAU8RpT86KrVVnIwSzaHaqkuecJK8iLlwrZMrSPSYzikWs03b3/louHicsLXISxo/2clxU69loVyI34RhTQh8e7vDq9ZTyyo/XVwGCsgA3QO25SAwArvXAyDAcYxHFUgV65NVQ8tLC6yDQ3+ab6JkYErX3hJu6Rz5gWdu5w8MpKuFB7XOdjJBxikGlaFiwhJdss8YGV7hfGYqB2IEGQZmZ8bRfybIG1YtDQFId9l2z4f9tskjab52+mg9h+1qOqVn7ZsnSTMWcW3CycsnelydEFksEy8n7UxGcZWSvCPUksxm/ecY7hbgolHV6/PjQofo6zN5P+fuhuA+ibC3b3KGfZd7Od+HWRYY0slTihIWS7j/Qx6JrZlFaOa0F5Wq0RrAy2KDQxCYsvMeB0V8aJ+8WYeYLa46tSjuHoSCmEC6NTtFDpzP9Z/sBUT1tc0XsC43uF0uYLvLcO/zRTvJU3QEuUe3ULsyGl5wVZTW5hQDKygNgBfkNRpvy5pQs1iYHHFytZcSJ83BVOzWT4VJKJKlfGqauJ/aSzP9MhbAn8X3cWBSwXe2n5svAu1iAsRrAHaeb8eMKRuOFAycA0q+7gTBJ5/BKxyVCxxca37WDlrc4FzMeeGnuOPVkgUjzyhNu2GNzb1Gl9cy0Tt7G64NxZl09uXz8GmQmaQ1MVJA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(40460700003)(47076005)(336012)(426003)(70206006)(82310400005)(70586007)(83380400001)(81166007)(8676002)(110136005)(36860700001)(2616005)(16526019)(186003)(1076003)(316002)(2906002)(26005)(86362001)(6666004)(356005)(36756003)(5660300002)(7696005)(508600001)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:48:45.9217 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ab7a14-707b-4a11-b241-08da2dd4cf48
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0146
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

This reverts commit 9a45ac2320d0a6ae01880a30d4b86025fce4061b.

This was added a helper for amdgpu to workaround a runtime pm regression
caused by a runtime pm fix in efifb.  We now have a better workarouund
in amdgpu in
commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are displays attached (v3)")
so this workaround is no longer necessary.  Since amdgpu was the only
user of this interface, we can remove it.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/video/fbdev/core/fbmem.c | 47 --------------------------------
 include/linux/fb.h               |  1 -
 2 files changed, 48 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index ad9aac06427a..700ac4a83329 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1783,53 +1783,6 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 }
 EXPORT_SYMBOL(remove_conflicting_framebuffers);
 
-/**
- * is_firmware_framebuffer - detect if firmware-configured framebuffer matches
- * @a: memory range, users of which are to be checked
- *
- * This function checks framebuffer devices (initialized by firmware/bootloader)
- * which use memory range described by @a. If @a matchesm the function returns
- * true, otherwise false.
- */
-bool is_firmware_framebuffer(struct apertures_struct *a)
-{
-	bool do_free = false;
-	bool found = false;
-	int i;
-
-	if (!a) {
-		a = alloc_apertures(1);
-		if (!a)
-			return false;
-
-		a->ranges[0].base = 0;
-		a->ranges[0].size = ~0;
-		do_free = true;
-	}
-
-	mutex_lock(&registration_lock);
-	/* check all firmware fbs and kick off if the base addr overlaps */
-	for_each_registered_fb(i) {
-		struct apertures_struct *gen_aper;
-
-		if (!(registered_fb[i]->flags & FBINFO_MISC_FIRMWARE))
-			continue;
-
-		gen_aper = registered_fb[i]->apertures;
-		if (fb_do_apertures_overlap(gen_aper, a)) {
-			found = true;
-			break;
-		}
-	}
-	mutex_unlock(&registration_lock);
-
-	if (do_free)
-		kfree(a);
-
-	return found;
-}
-EXPORT_SYMBOL(is_firmware_framebuffer);
-
 /**
  * remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
  * @pdev: PCI device
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 9a77ab615c36..147d582dab41 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -612,7 +612,6 @@ extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 					       const char *name);
 extern int remove_conflicting_framebuffers(struct apertures_struct *a,
 					   const char *name, bool primary);
-extern bool is_firmware_framebuffer(struct apertures_struct *a);
 extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
 extern int fb_show_logo(struct fb_info *fb_info, int rotate);
 extern char* fb_get_buffer_offset(struct fb_info *info, struct fb_pixmap *buf, u32 size);
-- 
2.35.1

