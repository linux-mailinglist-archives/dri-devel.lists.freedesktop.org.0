Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4264C3902
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB0810E8D2;
	Thu, 24 Feb 2022 22:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427F010E8EE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:48:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7484E61B9D;
 Thu, 24 Feb 2022 22:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB09C340E9;
 Thu, 24 Feb 2022 22:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645742894;
 bh=OQ79FR504d+gFFyAR5sZLOpMzAP/vH2wBNOitSrOZAk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AeKhJkzruTB8zp3fGZOv1HkV7XVgDJphckkliH5trrpWOFw66kBTRlT5k3M4B5mnV
 cxuGBe2Uw3Vis59EOZ3jSFbmLq5G0YgLl1HnnUnplsKx4ZA0ftRDdv7wlVslq8Y/tR
 GDgk7tWkJBDdmOlGVu98D054aywl4OlonYTFrOBhDA51Ky5riSZqIWWhlzpoNhEtDf
 fTG8ncona3g3qfE0lppvPF6v68Rjs48Oevu+GcVAh8rfaskZLmeeSMWlIadHW63TCG
 E+5g2acWsU8y2ki8SE1hINgghhGbMzOs5ZBgc1LsWTZ0Llc5RBD+xwl27aoIAmTWpB
 GMFnZ2WyMpRRA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v9 05/11] PCI/VGA: Move firmware default device detection to
 ADD_DEVICE path
Date: Thu, 24 Feb 2022 16:47:47 -0600
Message-Id: <20220224224753.297579-6-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224224753.297579-1-helgaas@kernel.org>
References: <20220224224753.297579-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Huacai Chen <chenhuacai@loongson.cn>

Previously we selected the firmware default device, i.e., one that owns the
boot framebuffer, as the default device in vga_arb_select_default_device().
This was only done in the vga_arb_device_init() subsys_initcall, so devices
enumerated later, e.g., by pcibios_init(), were not eligible.

Fix this by moving the firmware default device selection from
vga_arb_select_default_device() to vga_arbiter_add_pci_device(), which is
called after every PCI device is enumerated, either by the
vga_arb_device_init() subsys_initcall or as an ADD_DEVICE notifier.

Note that if vga_arb_select_default_device() previously found a device
owning the boot framebuffer, it unconditionally set it to be the default
VGA device, and no subsequent device could replace it.

[bhelgaas: commit log, restructure slightly]
Link: https://lore.kernel.org/r/20211015061512.2941859-7-chenhuacai@loongson.cn
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Cc: Bruno Prémont <bonbons@linux-vserver.org>
---
 drivers/pci/vgaarb.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 58e0a12e623b..c3323ab4f98e 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -72,6 +72,7 @@ struct vga_device {
 	unsigned int io_norm_cnt;	/* normal IO count */
 	unsigned int mem_norm_cnt;	/* normal MEM count */
 	bool bridge_has_one_vga;
+	bool is_firmware_default;	/* device selected by firmware */
 	unsigned int (*set_decode)(struct pci_dev *pdev, bool decode);
 };
 
@@ -565,10 +566,9 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 }
 EXPORT_SYMBOL(vga_put);
 
-static void __init vga_select_framebuffer_device(struct pci_dev *pdev)
+static bool vga_is_firmware_default(struct pci_dev *pdev)
 {
 #if defined(CONFIG_X86) || defined(CONFIG_IA64)
-	struct device *dev = &pdev->dev;
 	u64 base = screen_info.lfb_base;
 	u64 size = screen_info.lfb_size;
 	u64 limit;
@@ -583,15 +583,6 @@ static void __init vga_select_framebuffer_device(struct pci_dev *pdev)
 
 	limit = base + size;
 
-	/*
-	 * Override vga_arbiter_add_pci_device()'s I/O based detection
-	 * as it may take the wrong device (e.g. on Apple system under
-	 * EFI).
-	 *
-	 * Select the device owning the boot framebuffer if there is
-	 * one.
-	 */
-
 	/* Does firmware framebuffer belong to us? */
 	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
 		flags = pci_resource_flags(pdev, i);
@@ -608,13 +599,10 @@ static void __init vga_select_framebuffer_device(struct pci_dev *pdev)
 		if (base < start || limit >= end)
 			continue;
 
-		if (!vga_default_device())
-			vgaarb_info(dev, "setting as boot device\n");
-		else if (pdev != vga_default_device())
-			vgaarb_info(dev, "overriding boot device\n");
-		vga_set_default_device(pdev);
+		return true;
 	}
 #endif
+	return false;
 }
 
 static bool vga_arb_integrated_gpu(struct device *dev)
@@ -635,6 +623,7 @@ static bool vga_arb_integrated_gpu(struct device *dev)
 static bool vga_is_boot_device(struct vga_device *vgadev)
 {
 	struct vga_device *boot_vga = vgadev_find(vga_default_device());
+	struct pci_dev *pdev = vgadev->pdev;
 
 	/*
 	 * We select the default VGA device in this order:
@@ -645,6 +634,18 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
 	 *   Other device (see vga_arb_select_default_device())
 	 */
 
+	/*
+	 * We always prefer a firmware default device, so if we've already
+	 * found one, there's no need to consider vgadev.
+	 */
+	if (boot_vga && boot_vga->is_firmware_default)
+		return false;
+
+	if (vga_is_firmware_default(pdev)) {
+		vgadev->is_firmware_default = true;
+		return true;
+	}
+
 	/*
 	 * A legacy VGA device has MEM and IO enabled and any bridges
 	 * leading to it have PCI_BRIDGE_CTL_VGA enabled so the legacy
@@ -1531,10 +1532,6 @@ static void __init vga_arb_select_default_device(void)
 	struct pci_dev *pdev, *found = NULL;
 	struct vga_device *vgadev;
 
-	list_for_each_entry(vgadev, &vga_list, list) {
-		vga_select_framebuffer_device(vgadev->pdev);
-	}
-
 	if (!vga_default_device()) {
 		list_for_each_entry_reverse(vgadev, &vga_list, list) {
 			struct device *dev = &vgadev->pdev->dev;
-- 
2.25.1

