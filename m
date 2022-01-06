Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD332485CD9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 01:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1F210E507;
	Thu,  6 Jan 2022 00:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0B010E507
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 00:07:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E8E1619B3;
 Thu,  6 Jan 2022 00:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE0AC36AE9;
 Thu,  6 Jan 2022 00:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641427636;
 bh=C6KG2kcCxpsFyVSNmALMR/2GCwyeWTKSnI/4BGoxUoE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f457AHD9FVJHYzosV38scmZKeO3EPaPaj/f8uNRwf3lXL3ox3vEH6dh8XN7RZhNSc
 9cfFdOyJXgEJaUkAvKspqSHC7gPtd7DJs3Ak4egJ9H3ybTJeIusxXwY/nY31JzKiGF
 +g6Eihpecee3KsXv5sn5ilR4rWjY2DAQQPOg2xUeARwXDkYMrwhxZ1Bmz/ATUrsdYZ
 fxmrjrKKrZBgsOb++gyLpjQJR2grraeKofaijrDn4DfE67Wfq9E+m7qfZ5sg4KnSXi
 MTJlNJLG2UkUb0IRPnoW9ILp0NMrTRWwZQOsCkyskM7Zex3ImNfV0FslqGx/rDNIw/
 9EVgv1m7w7hNw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v8 02/10] vgaarb: Factor out vga_select_framebuffer_device()
Date: Wed,  5 Jan 2022 18:06:50 -0600
Message-Id: <20220106000658.243509-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106000658.243509-1-helgaas@kernel.org>
References: <20220106000658.243509-1-helgaas@kernel.org>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Xuefeng Li <lixuefeng@loongson.cn>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

On x86 and ia64, if a VGA device BARs include a framebuffer reported by
platform firmware, we select the device as the default VGA device.  Factor
this code to a separate function.  No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Bruno Prémont <bonbons@linux-vserver.org>
---
 drivers/gpu/vga/vgaarb.c | 99 +++++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index ef5ad4c432f5..36d9140c64f6 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -565,6 +565,58 @@ void vga_put(struct pci_dev *pdev, unsigned int rsrc)
 }
 EXPORT_SYMBOL(vga_put);
 
+static void __init vga_select_framebuffer_device(struct pci_dev *pdev)
+{
+#if defined(CONFIG_X86) || defined(CONFIG_IA64)
+	struct device *dev = &pdev->dev;
+	u64 base = screen_info.lfb_base;
+	u64 size = screen_info.lfb_size;
+	u64 limit;
+	resource_size_t start, end;
+	unsigned long flags;
+	int i;
+
+	/* Select the device owning the boot framebuffer if there is one */
+
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
+		flags = pci_resource_flags(pdev, i);
+
+		if ((flags & IORESOURCE_MEM) == 0)
+			continue;
+
+		start = pci_resource_start(pdev, i);
+		end  = pci_resource_end(pdev, i);
+
+		if (!start || !end)
+			continue;
+
+		if (base < start || limit >= end)
+			continue;
+
+		if (!vga_default_device())
+			vgaarb_info(dev, "setting as boot device\n");
+		else if (pdev != vga_default_device())
+			vgaarb_info(dev, "overriding boot device\n");
+		vga_set_default_device(pdev);
+	}
+#endif
+}
+
 static bool vga_arb_integrated_gpu(struct device *dev)
 {
 #if defined(CONFIG_ACPI)
@@ -1446,54 +1498,9 @@ static void __init vga_arb_select_default_device(void)
 	struct pci_dev *pdev, *found = NULL;
 	struct vga_device *vgadev;
 
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
 	list_for_each_entry(vgadev, &vga_list, list) {
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
+		vga_select_framebuffer_device(vgadev->pdev);
 	}
-#endif
 
 	if (!vga_default_device()) {
 		list_for_each_entry_reverse(vgadev, &vga_list, list) {
-- 
2.25.1

