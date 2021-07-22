Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82793D2F31
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 23:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C296F3DC;
	Thu, 22 Jul 2021 21:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455276F384
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 21:29:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC55660E8F;
 Thu, 22 Jul 2021 21:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626989386;
 bh=DBFGdtf/Y0RQscrMiQqVmzQYk7VU6kgtFbhfE0dmbe0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oB5ivAIL6i7OG7Vjlo/Pwa/F7XRs3t4iKASXXzOoKETkvWhwRASCts65oNuUjVZYM
 ASMYjNqoWHHhwvxuDjyXGG/ST41bIYrYzU0FFq82CZ+Fsk7rtl41CB9sHqafZu6R1h
 2hnVZP5S2DNvVpUL2OCHrrJvA0CcdNCVX1qD/WqtyWfNwv4Fz+q8BaK+lLxvIYCTgX
 UAjTPnwyl+QYBvvDs1QcXrAU5j9Xx0gGXskIqakQm+vLJidqzxIXXLEi22MqKZVwwn
 HC853tL71UxE3Yc20Gd5Me04yvTO90k2mbP8IgJELqxdtsFLGcrES3NeJvR8NABzUH
 aonnQ/Hccg/ZA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH v2 9/9] PCI/VGA: Rework default VGA device selection
Date: Thu, 22 Jul 2021 16:29:20 -0500
Message-Id: <20210722212920.347118-10-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722212920.347118-1-helgaas@kernel.org>
References: <20210722212920.347118-1-helgaas@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Huacai Chen <chenhuacai@loongson.cn>

Needs a better subject and a commit log.

Link: https://lore.kernel.org/r/20210705100503.1120643-1-chenhuacai@loongson.cn
---
 drivers/pci/vgaarb.c | 158 ++++++++++++++++++-------------------------
 1 file changed, 66 insertions(+), 92 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index dd07b1c3205f..0b059a2fc749 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -580,16 +580,79 @@ static bool vga_arb_integrated_gpu(struct device *dev)
 static void vga_arb_update_default_device(struct vga_device *vgadev)
 {
 	struct pci_dev *pdev = vgadev->pdev;
+	struct device *dev = &pdev->dev;
+	struct vga_device *vgadev_default;
+#if defined(CONFIG_X86) || defined(CONFIG_IA64)
+	int i;
+	unsigned long flags;
+	u64 base = screen_info.lfb_base;
+	u64 size = screen_info.lfb_size;
+	u64 limit;
+	resource_size_t start, end;
+#endif
 
 	/*
 	 * If we don't have a default VGA device yet, and this device owns
 	 * the legacy VGA resources, make it the default.
 	 */
-	if (!vga_default_device() &&
-	    ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
-		vgaarb_info(&pdev->dev, "setting as boot VGA device\n");
+	if (!vga_default_device()) {
+		if ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)
+			vgaarb_info(dev, "setting as boot VGA device\n");
+		else
+			vgaarb_info(dev, "setting as boot device (VGA legacy resources not available)\n");
 		vga_set_default_device(pdev);
 	}
+
+	vgadev_default = vgadev_find(vga_default);
+
+	/* Overridden by a better device */
+	if (vgadev_default && ((vgadev_default->owns & VGA_RSRC_LEGACY_MASK) == 0)
+		&& ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
+		vgaarb_info(dev, "overriding boot VGA device\n");
+		vga_set_default_device(pdev);
+	}
+
+	if (vga_arb_integrated_gpu(dev)) {
+		vgaarb_info(dev, "overriding boot VGA device\n");
+		vga_set_default_device(pdev);
+	}
+
+#if defined(CONFIG_X86) || defined(CONFIG_IA64)
+	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		base |= (u64)screen_info.ext_lfb_base << 32;
+
+	limit = base + size;
+
+	/*
+	 * Override vga_arbiter_add_pci_device()'s I/O based detection
+	 * as it may take the wrong device (e.g. on Apple system under
+	 * EFI).
+	 *
+	 * Select the device owning the boot framebuffer if there is
+	 * one.
+	 */
+
+	/* Does firmware framebuffer belong to us? */
+	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
+		flags = pci_resource_flags(vgadev->pdev, i);
+
+		if ((flags & IORESOURCE_MEM) == 0)
+			continue;
+
+		start = pci_resource_start(vgadev->pdev, i);
+		end  = pci_resource_end(vgadev->pdev, i);
+
+		if (!start || !end)
+			continue;
+
+		if (base < start || limit >= end)
+			continue;
+
+		if (vgadev->pdev != vga_default_device())
+			vgaarb_info(dev, "overriding boot device\n");
+		vga_set_default_device(vgadev->pdev);
+	}
+#endif
 }
 
 /*
@@ -1444,92 +1507,6 @@ static struct miscdevice vga_arb_device = {
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
@@ -1549,9 +1526,6 @@ static int __init vga_arb_device_init(void)
 			       PCI_ANY_ID, pdev)) != NULL)
 		vga_arbiter_add_pci_device(pdev);
 
-	vga_arb_select_default_device();
-
-	pr_info("loaded\n");
 	return rc;
 }
 subsys_initcall(vga_arb_device_init);
-- 
2.25.1

