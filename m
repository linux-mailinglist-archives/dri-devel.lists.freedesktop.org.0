Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0936D48034A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Dec 2021 19:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F4310EEED;
	Mon, 27 Dec 2021 18:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9717910EEEC;
 Mon, 27 Dec 2021 18:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqBBXYA9Qd0QvRnqyMWDovfk9bEWIqN2/Mo7vgfHnxoXorQ7r4oGZfiwpn/p4QckQcfN0uYD50I9DtND5O+ds5IRVEMoEreIYQWx9qONoveKWof8VMcmlMfUIp7wG5WCZPMHaRPVvFac/xE6PAnH1cEik53N2N6DcjaX+oTNWF2Wv9AB8EnipEA7zSoaoRLJGiRRURuob+2q9gEVhUMQb4YDtGfOYmSdJOsLK6Gylf4R9R7No08ApqJ4hWEnti/wssbWptTBqVlAWDayMcCAOCcpQ/VVZXiuJpK1GH6Pf5/zMAf1bDHUYCBYj+HQF5C60riw6E6BAPogJjUurkZrWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW+p8NKGCiwOFZOb7xERZK7JbWeLxtGJ/fWV75NyPUc=;
 b=F3L7smnc6Lu6VywC3OXagOY2qmA2YLETwhKZP6sRE/GqekzY/0mEl59CjHRK2NZQJzZfDLnHrEBkOtvdLisdABDMaHy9voeKXhNeU5jKDPOLs+AaHxwscVjBPFsvzUNiB9mCxBraO0dTuwdnEnGt/b7Ls/PR2A11NUvt6jjRc6Wc6M9t/YXN8l+52eMeBv5LMTeBfv8dqH40i7np0YSKKur7ktoAWWgIp3HMgT6VYP6iKXsj4vw/pQH0zItiVJQWP0IW8JTPYL9EfCVr+PZcaMmLsSeNA2IA/h9ICT0LdRERMZ6OSYsM0LaPyrIhTn9zLFevhNkSP9amRQpRHz/8Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW+p8NKGCiwOFZOb7xERZK7JbWeLxtGJ/fWV75NyPUc=;
 b=Vfbp3tIMt2UjEihFdQI+NIZRpAGR2bwSdUp6WRRiflV5GpKWIDcBMgi5cHZBcN+z19bcUqrv/nPFCzR5Nv+hdR3jIOfmDgfxc6CQC3Z+IcypNznaEaAW9OLklT5D04KK/zwwcOaWm99dzgrESbn2zTOEU+21j9HxTyFvYfb8aKk=
Received: from BN9PR03CA0227.namprd03.prod.outlook.com (2603:10b6:408:f8::22)
 by MWHPR12MB1840.namprd12.prod.outlook.com (2603:10b6:300:114::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Mon, 27 Dec
 2021 18:27:09 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::48) by BN9PR03CA0227.outlook.office365.com
 (2603:10b6:408:f8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18 via Frontend
 Transport; Mon, 27 Dec 2021 18:27:09 +0000
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
Subject: [PATCH 1/2] fbdev: fbmem: add a helper to determine if an aperture is
 used by a fw fb
Date: Mon, 27 Dec 2021 13:26:55 -0500
Message-ID: <20211227182656.2110664-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b45c6d42-4ae1-4118-8e01-08d9c9667e43
X-MS-TrafficTypeDiagnostic: MWHPR12MB1840:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB18403162C4B0C39955BF23F9F7429@MWHPR12MB1840.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Tqj7gXIkQx6ow2uXsHc/pJVSGPT+5Wik4Uo3iDI7CaufVoIR+b4H+5k5kgqxNgb/WCJnj0bygrZ+RxMqj07A72qaF+fdg6AhrjxvsoRlABoXY4z+0WngmfiJ4rU7TXFS6FG3zn/FyoNqJpkxNMmC01+asZ37X3ywi21QuxdP2LMjZXJcll5T0xRBukYSYyu+UIAo893Hbe3LrsoScj8sc9kFvNJVP6oWn7kQiGFWyD/O8HxD/O/f86mo5aa1H6/tVzbpOtq4bEFehsfuTUcX/J2gndlbqJJ1SQjnZn8LxWlY/pl/b8Yl9s6oDaS9eG5FNlanhHMN68je0H+5NfF7HOILXlJqWNZfwraEbrjsfQ4JAztsCiwXR08lnN9A62uWH3ETOPkXxHZ2Iyn2a3f+2UMTdRZku2PDCy0khYLT1WCYQ9epywRaF5SFK78MX6HPbjKtZeLoTeFetnZGSzPzRvkruI2AO4nwYP+kNSBTxXoB/YSkWJPhKozm8sqIGj5odmlgWp32E27CXxO8w09gREIHxu3u6cnB6rbIgpKzHLsRZFYwzgvIsWgVzYfUJLn5bABdPpCNOfEpDJW+jQTWUipxnQDfBOs9v8VXsRuolov0PmEIUhn1myjzvtRmIR/QyuHLqQVkeM6nLWU1s57ex4+SY804TmUbH/mX9uxgfjjrxUw9vQ/Q/cs2lJ6sRGizu+mRO1ubRy11hvsQVYFCcH15p0w4QHq7xUJ4ZxOeCfv7nebagUsR9/W4tdXms+TELmJDUWwpINjfR2rA8l0WEFQK0Mrsfu/CXNET+a7rPMFoqdiXi+abWEIlCB+9q3byonclxm1BhzvR5GoKBbapm2k9Nj04ZMAES92zFHMIrKPCGfkdk/rh1lyy2TLLg0N
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(46966006)(36840700001)(316002)(16526019)(26005)(186003)(7696005)(110136005)(336012)(5660300002)(86362001)(426003)(8936002)(1076003)(356005)(36860700001)(2616005)(8676002)(47076005)(81166007)(70586007)(70206006)(508600001)(966005)(82310400004)(83380400001)(40460700001)(6666004)(36756003)(2906002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 18:27:09.1370 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b45c6d42-4ae1-4118-8e01-08d9c9667e43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1840
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

Add a function for drivers to check if the a firmware initialized
fb is corresponds to their aperture.  This allows drivers to check if the
device corresponds to what the firmware set up as the display device.

Bug: https://bugzilla.kernel.org/show_bug.cgi?id=215203
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1840
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/video/fbdev/core/fbmem.c | 47 ++++++++++++++++++++++++++++++++
 include/linux/fb.h               |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 826175ad88a2..0fa7ede94fa6 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1762,6 +1762,53 @@ int remove_conflicting_framebuffers(struct apertures_struct *a,
 }
 EXPORT_SYMBOL(remove_conflicting_framebuffers);
 
+/**
+ * is_firmware_framebuffer - detect if firmware-configured framebuffer matches
+ * @a: memory range, users of which are to be checked
+ *
+ * This function checks framebuffer devices (initialized by firmware/bootloader)
+ * which use memory range described by @a. If @a matchesm the function returns
+ * true, otherwise false.
+ */
+bool is_firmware_framebuffer(struct apertures_struct *a)
+{
+	bool do_free = false;
+	bool found = false;
+	int i;
+
+	if (!a) {
+		a = alloc_apertures(1);
+		if (!a)
+			return false;
+
+		a->ranges[0].base = 0;
+		a->ranges[0].size = ~0;
+		do_free = true;
+	}
+
+	mutex_lock(&registration_lock);
+	/* check all firmware fbs and kick off if the base addr overlaps */
+	for_each_registered_fb(i) {
+		struct apertures_struct *gen_aper;
+
+		if (!(registered_fb[i]->flags & FBINFO_MISC_FIRMWARE))
+			continue;
+
+		gen_aper = registered_fb[i]->apertures;
+		if (fb_do_apertures_overlap(gen_aper, a)) {
+			found = true;
+			break;
+		}
+	}
+	mutex_unlock(&registration_lock);
+
+	if (do_free)
+		kfree(a);
+
+	return found;
+}
+EXPORT_SYMBOL(is_firmware_framebuffer);
+
 /**
  * remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
  * @pdev: PCI device
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 6f3db99ab990..3da95842b207 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -610,6 +610,7 @@ extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
 					       const char *name);
 extern int remove_conflicting_framebuffers(struct apertures_struct *a,
 					   const char *name, bool primary);
+extern bool is_firmware_framebuffer(struct apertures_struct *a);
 extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
 extern int fb_show_logo(struct fb_info *fb_info, int rotate);
 extern char* fb_get_buffer_offset(struct fb_info *info, struct fb_pixmap *buf, u32 size);
-- 
2.33.1

