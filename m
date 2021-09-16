Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78A40D4A2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 10:34:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74E96EB04;
	Thu, 16 Sep 2021 08:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC0C6EB04
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:34:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A59B061216;
 Thu, 16 Sep 2021 08:34:49 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V6 07/12] PCI/VGA: Remove vga_arb_select_default_device()
Date: Thu, 16 Sep 2021 16:29:36 +0800
Message-Id: <20210916082941.3421838-8-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210916082941.3421838-1-chenhuacai@loongson.cn>
References: <20210916082941.3421838-1-chenhuacai@loongson.cn>
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

This patch is the last step of the rework: Since vga_arb_update_default_
device() is complete, we can remove vga_arb_select_default_device() and
its call-site.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpu/vga/vgaarb.c | 89 ----------------------------------------
 1 file changed, 89 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index 042e1f1371fc..05174fd7e7ef 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -1514,92 +1514,6 @@ static struct miscdevice vga_arb_device = {
 	MISC_DYNAMIC_MINOR, "vga_arbiter", &vga_arb_device_fops
 };
 
-static void __init vga_arb_select_default_device(void)
-{
-	struct pci_dev *pdev, *found = NULL;
-	struct vga_device *vgadev;
-
-#if defined(CONFIG_X86) || defined(CONFIG_IA64)
-	u64 base = screen_info.lfb_base;
-	u64 size = screen_info.lfb_size;
-	u64 limit;
-	resource_size_t start, end;
-	unsigned long flags;
-	int i;
-
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		base |= (u64)screen_info.ext_lfb_base << 32;
-
-	limit = base + size;
-
-	list_for_each_entry(vgadev, &vga_list, list) {
-		struct device *dev = &vgadev->pdev->dev;
-		/*
-		 * Override vga_arbiter_add_pci_device()'s I/O based detection
-		 * as it may take the wrong device (e.g. on Apple system under
-		 * EFI).
-		 *
-		 * Select the device owning the boot framebuffer if there is
-		 * one.
-		 */
-
-		/* Does firmware framebuffer belong to us? */
-		for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
-			flags = pci_resource_flags(vgadev->pdev, i);
-
-			if ((flags & IORESOURCE_MEM) == 0)
-				continue;
-
-			start = pci_resource_start(vgadev->pdev, i);
-			end  = pci_resource_end(vgadev->pdev, i);
-
-			if (!start || !end)
-				continue;
-
-			if (base < start || limit >= end)
-				continue;
-
-			if (!vga_default_device())
-				vgaarb_info(dev, "setting as boot device\n");
-			else if (vgadev->pdev != vga_default_device())
-				vgaarb_info(dev, "overriding boot device\n");
-			vga_set_default_device(vgadev->pdev);
-		}
-	}
-#endif
-
-	if (!vga_default_device()) {
-		list_for_each_entry_reverse(vgadev, &vga_list, list) {
-			struct device *dev = &vgadev->pdev->dev;
-			u16 cmd;
-
-			pdev = vgadev->pdev;
-			pci_read_config_word(pdev, PCI_COMMAND, &cmd);
-			if (cmd & (PCI_COMMAND_IO | PCI_COMMAND_MEMORY)) {
-				found = pdev;
-				if (vga_arb_integrated_gpu(dev))
-					break;
-			}
-		}
-	}
-
-	if (found) {
-		vgaarb_info(&found->dev, "setting as boot device (VGA legacy resources not available)\n");
-		vga_set_default_device(found);
-		return;
-	}
-
-	if (!vga_default_device()) {
-		vgadev = list_first_entry_or_null(&vga_list,
-						  struct vga_device, list);
-		if (vgadev) {
-			struct device *dev = &vgadev->pdev->dev;
-			vgaarb_info(dev, "setting as boot device (VGA legacy resources not available)\n");
-			vga_set_default_device(vgadev->pdev);
-		}
-	}
-}
-
 static int __init vga_arb_device_init(void)
 {
 	int rc;
@@ -1629,9 +1543,6 @@ static int __init vga_arb_device_init(void)
 			vgaarb_info(dev, "no bridge control possible\n");
 	}
 
-	vga_arb_select_default_device();
-
-	pr_info("loaded\n");
 	return rc;
 }
 subsys_initcall(vga_arb_device_init);
-- 
2.27.0

