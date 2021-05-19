Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3722F388FAD
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 15:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C106EDC2;
	Wed, 19 May 2021 13:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C0A6EDC2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 13:57:37 +0000 (UTC)
Received: from 1-171-221-38.dynamic-ip.hinet.net ([1.171.221.38]
 helo=localhost) by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1ljMhX-0005vU-6q; Wed, 19 May 2021 13:57:31 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH] vgaarb: Use ACPI HID name to find integrated GPU
Date: Wed, 19 May 2021 21:57:23 +0800
Message-Id: <20210519135723.525997-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: alexander.deucher@amd.com, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 3d42f1ddc47a ("vgaarb: Keep adding VGA device in queue") assumes
the first device is an integrated GPU. However, on AMD platforms an
integrated GPU can have higher PCI device number than a discrete GPU.

Integrated GPU on ACPI platform generally has _DOD and _DOS method, so
use that as predicate to find integrated GPU. If the new strategy
doesn't work, fallback to use the first device as boot VGA.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/vga/vgaarb.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index 5180c5687ee5..949fde433ea2 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -50,6 +50,7 @@
 #include <linux/screen_info.h>
 #include <linux/vt.h>
 #include <linux/console.h>
+#include <linux/acpi.h>
 
 #include <linux/uaccess.h>
 
@@ -1450,9 +1451,23 @@ static struct miscdevice vga_arb_device = {
 	MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
 };
 
+#if defined(CONFIG_ACPI)
+static bool vga_arb_integrated_gpu(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+
+	return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
+}
+#else
+static bool vga_arb_integrated_gpu(struct device *dev)
+{
+	return false;
+}
+#endif
+
 static void __init vga_arb_select_default_device(void)
 {
-	struct pci_dev *pdev;
+	struct pci_dev *pdev, *found = NULL;
 	struct vga_device *vgadev;
 
 #if defined(CONFIG_X86) || defined(CONFIG_IA64)
@@ -1505,20 +1520,26 @@ static void __init vga_arb_select_default_device(void)
 #endif
 
 	if (!vga_default_device()) {
-		list_for_each_entry(vgadev, &vga_list, list) {
+		list_for_each_entry_reverse(vgadev, &vga_list, list) {
 			struct device *dev = &vgadev->pdev->dev;
 			u16 cmd;
 
 			pdev = vgadev->pdev;
 			pci_read_config_word(pdev, PCI_COMMAND, &cmd);
 			if (cmd & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) {
-				vgaarb_info(dev, "setting as boot device (VGA legacy resources not available)\n");
-				vga_set_default_device(pdev);
-				break;
+				found = pdev;
+				if (vga_arb_integrated_gpu(dev))
+					break;
 			}
 		}
 	}
 
+	if (found) {
+		vgaarb_info(&found->dev, "setting as boot device (VGA legacy resources not available)\n");
+		vga_set_default_device(found);
+		return;
+	}
+
 	if (!vga_default_device()) {
 		vgadev = list_first_entry_or_null(&vga_list,
 						  struct vga_device, list);
-- 
2.31.1

