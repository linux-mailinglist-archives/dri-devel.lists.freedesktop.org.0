Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC7F51187B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 15:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3052A10F43C;
	Wed, 27 Apr 2022 13:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4CC0D10F43C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 13:47:59 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1C85520E97B0;
 Wed, 27 Apr 2022 06:47:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1C85520E97B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1651067278;
 bh=s71BKG69g523heKe1yEo9VKmSL/5EGLlD50AE/SchRU=;
 h=From:To:Subject:Date:From;
 b=ifbwO0m7s/jATQqceeCrnmVeEIvhHzX2cXKpEfhAwiCd74/M8VzUv42AlybCLlOns
 rXoAQoxBIm3S8+db/8ujimleKpMTVlNzlj3vui3OcfDgu45PD4JteeDG+oO42hHoVq
 pFFnzL2EG/CJS60yxHsd3dFozwBleudDIoiEp79k=
From: Saurabh Sengar <ssengar@linux.microsoft.com>
To: ssengar@microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 sthemmin@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 deller@gmx.de, linux-hyperv@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] video: hyperv_fb: Allow resolutions with size > 64 MB for Gen1
Date: Wed, 27 Apr 2022 06:47:53 -0700
Message-Id: <1651067273-6635-1-git-send-email-ssengar@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
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

This patch fixes a bug where GEN1 VMs doesn't allow resolutions greater
than 64 MB size (eg 7680x4320). Unnecessary PCI check limits Gen1 VRAM
to legacy PCI BAR size only (ie 64MB). Thus any, resolution requesting
greater then 64MB (eg 7680x4320) would fail. MMIO region assigning this
memory shouldn't be limited by PCI bar size.

Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
---
 drivers/video/fbdev/hyperv_fb.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index c8e0ea2..58c304a 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1009,7 +1009,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	struct pci_dev *pdev  = NULL;
 	void __iomem *fb_virt;
 	int gen2vm = efi_enabled(EFI_BOOT);
-	resource_size_t pot_start, pot_end;
 	phys_addr_t paddr;
 	int ret;
 
@@ -1060,23 +1059,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	dio_fb_size =
 		screen_width * screen_height * screen_depth / 8;
 
-	if (gen2vm) {
-		pot_start = 0;
-		pot_end = -1;
-	} else {
-		if (!(pci_resource_flags(pdev, 0) & IORESOURCE_MEM) ||
-		    pci_resource_len(pdev, 0) < screen_fb_size) {
-			pr_err("Resource not available or (0x%lx < 0x%lx)\n",
-			       (unsigned long) pci_resource_len(pdev, 0),
-			       (unsigned long) screen_fb_size);
-			goto err1;
-		}
-
-		pot_end = pci_resource_end(pdev, 0);
-		pot_start = pot_end - screen_fb_size + 1;
-	}
-
-	ret = vmbus_allocate_mmio(&par->mem, hdev, pot_start, pot_end,
+	ret = vmbus_allocate_mmio(&par->mem, hdev, 0, -1,
 				  screen_fb_size, 0x100000, true);
 	if (ret != 0) {
 		pr_err("Unable to allocate framebuffer memory\n");
-- 
1.8.3.1

