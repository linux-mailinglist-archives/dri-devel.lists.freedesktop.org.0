Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED40C480347
	for <lists+dri-devel@lfdr.de>; Mon, 27 Dec 2021 19:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDDE10EEEA;
	Mon, 27 Dec 2021 18:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3541510EEE8;
 Mon, 27 Dec 2021 18:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnbQ0Ns8L4xZWahrMnATC+dybx0HLF8kD+G+ZAf4ZP4SFXaYEEu45D4PT9J8IOHLxj0WYA0LsH39zKWUAerUMjwhF/sawOJ3fm9xrbkunenH0PulHlxw3QRZ2XclU1iOE2VjEBYlJcwKDdsvjKgBjb96jst6xs5X0hgz1DnDWHqbR4rnzaY7ZDuaSi/LyejkXQiaY4Z1vkFRZiLmq4LTxo7ea73nKIVL0WjfffK3PtrG/qHa7a9m4Oxb4vjXqhzT08wkqXnN0g+u70iHRNMaqU1EQPbAPgRmlXVb/zQk09d02gZuF0UYfSDpiDLzXhotztcvWB08DvmHT3lKDsScsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdWhkNxtd9/J4K14eZk1dhGVPdbC5d4CyzIHw0T9AxI=;
 b=OQH2st9Jh3mRoDj50pjISoGtdYsZUmGv/pUY+aiSIq1blFGf7ctvO7qlRWRyt3GFx8FpDV2mhKPiBogAO7FMtsue9fWWWHdyHfO8kkX29QZpdC2RvO8SaNiMhifDdfwWYRn1w/sZgOk9qqMcApKvvGl8UZBm63M+86Ush2hpE6YqGRQ2uHAUIUX4msg0bH9pJvQt2089zJ877ri4jfYWj+AqSh0TyeNj+kYkiKT5vkfTx9bUQJjBWmEB6gxWEOJ+wxhN1/UWlYSgKPDbJjKxnfgtKRBiCORiqkw4RAtiRbl33bJCN9bxbUR9zecB+W+MaiwAtaJ/Nhprwph0cNiGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdWhkNxtd9/J4K14eZk1dhGVPdbC5d4CyzIHw0T9AxI=;
 b=NEECXV+6E6DlXWqmx7s8HmiFvl4c8LpHBvKf9xko1ZHHaZSpVOhwxXmSjxfGGfcga7pLkWW+fSCn3quI0o+sNVPKKj4BOwuUV+nhk1gPB5L02kNbZ2GOY8XozQDXl8QP6y96O9pQIGU2SiruA2ZiexCzK48IuD/MbpZAN3x4EZ8=
Received: from BN9PR03CA0230.namprd03.prod.outlook.com (2603:10b6:408:f8::25)
 by BY5PR12MB5509.namprd12.prod.outlook.com (2603:10b6:a03:1d7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Mon, 27 Dec
 2021 18:27:10 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::e5) by BN9PR03CA0230.outlook.office365.com
 (2603:10b6:408:f8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Mon, 27 Dec 2021 18:27:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Mon, 27 Dec 2021 18:27:09 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 27 Dec
 2021 12:27:08 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: [PATCH 2/2] drm/amdgpu: disable runpm if we are the primary adapter
Date: Mon, 27 Dec 2021 13:26:56 -0500
Message-ID: <20211227182656.2110664-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211227182656.2110664-1-alexander.deucher@amd.com>
References: <20211227182656.2110664-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ce62275-0044-44a0-5f4d-08d9c9667eb8
X-MS-TrafficTypeDiagnostic: BY5PR12MB5509:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB5509B6C5642F58BDC0A3FBABF7429@BY5PR12MB5509.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:68;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lkhqAV/jMjK43wj2z2AcbQ2QE7jLeUD8Q6s5PrzoNilXHmBmMup0Cjd42+ymyAQ8CbcrGdHl6Nccf+v1N00fGKxW86N1e2YKWKrF2TMdGDKONVhMCQCfsg0dk9MX2c4Ys5dS8TCfGWhJjEX9t/mvz1gPuA7bxzgvJThOcw6rqKcuZ5ee4RuxDzO2/ErJRh5aoM/8fvKIuDVGzWiNscYiGnL0FWr7AOROguWSsSioKaaZijyiVEJYIfEX3RL0wlhw4YlKs49iB0Dbzs5CiVG7XeYvHYJV++KniXHchx7G4jDTWLAOBQWfQSXY5N1dHTPB8cqm7Nc57kFah4u6itXaqeSD1/Tmj5ea3N5lUNHB7pjojKLuUnJ5UPYvIViBcmSLDKZwE3Enwq1sR29p8WolFEs5rm1Lcg3plZLRbHHsmtLdZkFyCEsk76QH+miq4co9gkDtUFibR+0e3A50qkMUMeUycM44CWJy0+quzWWFAD+etW9mzf/IBrzCVrpOBVKRxNFAOsDCcL29XGmSeNsPGDlLwDp4RRrCKJFt6LEpdm199fXIe/xdgul1W0MAuPG0czj7Qv/bwV/wTUDBflI4Ai00W1WhH6rlrsUN4NXMyO0oQPLX6wG4LjMcg8yxn488HgWgR7/Z4UOR2BCRCPDaMnX0BMOL9VjU/nGI+YZXOXjp+yqEBiQlzimtlu43FmjJbFa1uBUwSaRX0H4fu4DRCfoAK39SnT/tNuMcDreHETbizlStirYL+TSmxEDpPDLKYLC/C+sMn95hUAweW+d5ilInkwbOjZqPZcDTjtyiieEo9v21qqOPzOdQuHpZHZyGgS4YgaMAptVMlSbxsUJdXdyVN5HXaevzRaqsfdqP7n8Xzq5U5EFR/j73CF/3NRHNWi2XtNbTU62Yc68aCBg7xw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(7696005)(336012)(40460700001)(2616005)(2906002)(966005)(82310400004)(356005)(81166007)(83380400001)(8676002)(426003)(508600001)(6666004)(8936002)(70586007)(70206006)(47076005)(86362001)(110136005)(26005)(316002)(36756003)(5660300002)(1076003)(186003)(16526019)(36860700001)(4326008)(21314003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 18:27:09.9026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce62275-0044-44a0-5f4d-08d9c9667eb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5509
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

If we are the primary adapter (i.e., the one used by the firwmare
framebuffer), disable runtime pm.  This fixes a regression caused
by commit 55285e21f045 which results in the displays waking up
shortly after they go to sleep due to teh device coming out of
runtime suspend and sending a hotplug uevent.

v2: squash in reworked fix from Evan

Fixes: 55285e21f045 ("fbdev/efifb: Release PCI device's runtime PM ref during FB destroy")
Bug: https://bugzilla.kernel.org/show_bug.cgi?id=215203
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1840
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 28 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  6 ++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index b85b67a88a3d..7d67aec6f4a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1077,6 +1077,7 @@ struct amdgpu_device {
 	bool                            runpm;
 	bool                            in_runpm;
 	bool                            has_pr3;
+	bool                            is_fw_fb;
 
 	bool                            pm_sysfs_en;
 	bool                            ucode_sysfs_en;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 86ca80da9eea..99370bdd8c5b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -39,6 +39,7 @@
 #include <linux/mmu_notifier.h>
 #include <linux/suspend.h>
 #include <linux/cc_platform.h>
+#include <linux/fb.h>
 
 #include "amdgpu.h"
 #include "amdgpu_irq.h"
@@ -1890,6 +1891,26 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 static const struct drm_driver amdgpu_kms_driver;
 
+static bool amdgpu_is_fw_framebuffer(resource_size_t base,
+				     resource_size_t size)
+{
+	bool found = false;
+#if IS_REACHABLE(CONFIG_FB)
+	struct apertures_struct *a;
+
+	a = alloc_apertures(1);
+	if (!a)
+		return false;
+
+	a->ranges[0].base = base;
+	a->ranges[0].size = size;
+
+	found = is_firmware_framebuffer(a);
+	kfree(a);
+#endif
+	return found;
+}
+
 static int amdgpu_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
@@ -1898,6 +1919,8 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	unsigned long flags = ent->driver_data;
 	int ret, retry = 0, i;
 	bool supports_atomic = false;
+	bool is_fw_fb;
+	resource_size_t base, size;
 
 	/* skip devices which are owned by radeon */
 	for (i = 0; i < ARRAY_SIZE(amdgpu_unsupported_pciidlist); i++) {
@@ -1966,6 +1989,10 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	}
 #endif
 
+	base = pci_resource_start(pdev, 0);
+	size = pci_resource_len(pdev, 0);
+	is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
+
 	/* Get rid of things like offb */
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
 	if (ret)
@@ -1978,6 +2005,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	adev->dev  = &pdev->dev;
 	adev->pdev = pdev;
 	ddev = adev_to_drm(adev);
+	adev->is_fw_fb = is_fw_fb;
 
 	if (!supports_atomic)
 		ddev->driver_features &= ~DRIVER_ATOMIC;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 651c7abfde03..09ad17944eb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -206,6 +206,12 @@ int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
 			adev->runpm = true;
 			break;
 		}
+		/* XXX: disable runtime pm if we are the primary adapter
+		 * to avoid displays being re-enabled after DPMS.
+		 * This needs to be sorted out and fixed properly.
+		 */
+		if (adev->is_fw_fb)
+			adev->runpm = false;
 		if (adev->runpm)
 			dev_info(adev->dev, "Using BACO for runtime pm\n");
 	}
-- 
2.33.1

