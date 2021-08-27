Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A852F3F9635
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 10:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC226E8F6;
	Fri, 27 Aug 2021 08:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1336E8F6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 08:34:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C04160EB3;
 Fri, 27 Aug 2021 08:34:42 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V4 05/10] PCI/VGA: Move vga_arb_integrated_gpu() earlier in
 file
Date: Fri, 27 Aug 2021 16:31:24 +0800
Message-Id: <20210827083129.2781420-6-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210827083129.2781420-1-chenhuacai@loongson.cn>
References: <20210827083129.2781420-1-chenhuacai@loongson.cn>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move vga_arb_integrated_gpu() earlier in file to prepare for future patch.
No functional change intended.

[bhelgaas: split to separate patch]
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/vgaarb.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index c984c76b3fd7..1f8fb37be5fa 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -563,6 +563,20 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 }
 EXPORT_SYMBOL(vga_put);
 
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
 /*
  * Rules for using a bridge to control a VGA descendant decoding: if a bridge
  * has only one VGA descendant then it can be used to control the VGA routing
@@ -1416,20 +1430,6 @@ static struct miscdevice vga_arb_device = {
 	MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
 };
 
-#if defined(CONFIG_ACPI)
-static bool vga_arb_integrated_gpu(struct device *dev)
-{
-	struct acpi_device *adev = ACPI_COMPANION(dev);
-
-	return adev && !strcmp(acpi_device_hid(adev), ACPI_VIDEO_HID);
-}
-#else
-static bool vga_arb_integrated_gpu(struct device *dev)
-{
-	return false;
-}
-#endif
-
 static void __init vga_arb_select_default_device(void)
 {
 	struct pci_dev *pdev, *found = NULL;
-- 
2.27.0

