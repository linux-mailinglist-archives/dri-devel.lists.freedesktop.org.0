Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD424075DC
	for <lists+dri-devel@lfdr.de>; Sat, 11 Sep 2021 11:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E29C6EB5F;
	Sat, 11 Sep 2021 09:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC126EB5F
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Sep 2021 09:35:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76F02610F8;
 Sat, 11 Sep 2021 09:35:16 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V5 04/11] PCI/VGA: Split out vga_arb_update_default_device()
Date: Sat, 11 Sep 2021 17:30:49 +0800
Message-Id: <20210911093056.1555274-5-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210911093056.1555274-1-chenhuacai@loongson.cn>
References: <20210911093056.1555274-1-chenhuacai@loongson.cn>
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

This patch is the first step of the rework: If there's no default VGA
device, and we find a VGA device that owns the legacy VGA resources, we
make that device the default. Split this logic out from vga_arbiter_add_
pci_device() into a new function, vga_arb_update_default_device().

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/vgaarb.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 29e725ebaa43..f8f95244d499 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -579,6 +579,21 @@ static bool vga_arb_integrated_gpu(struct device *dev)
 }
 #endif
 
+static void vga_arb_update_default_device(struct vga_device *vgadev)
+{
+	struct pci_dev *pdev = vgadev->pdev;
+
+	/*
+	 * If we don't have a default VGA device yet, and this device owns
+	 * the legacy VGA resources, make it the default.
+	 */
+	if (!vga_default_device() &&
+	    ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
+		vgaarb_info(&pdev->dev, "setting as boot VGA device\n");
+		vga_set_default_device(pdev);
+	}
+}
+
 /*
  * Rules for using a bridge to control a VGA descendant decoding: if a bridge
  * has only one VGA descendant then it can be used to control the VGA routing
@@ -706,15 +721,7 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 		bus = bus->parent;
 	}
 
-	/* Deal with VGA default device. Use first enabled one
-	 * by default if arch doesn't have it's own hook
-	 */
-	if (!vga_default_device() &&
-	    ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
-		vgaarb_info(&pdev->dev, "setting as boot VGA device\n");
-		vga_set_default_device(pdev);
-	}
-
+	vga_arb_update_default_device(vgadev);
 	vga_arbiter_check_bridge_sharing(vgadev);
 
 	/* Add to the list */
-- 
2.27.0

