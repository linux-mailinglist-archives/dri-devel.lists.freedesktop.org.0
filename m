Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CBD3F9645
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 10:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091D66E8F8;
	Fri, 27 Aug 2021 08:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980596E8F8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 08:37:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 699BB60F4F;
 Fri, 27 Aug 2021 08:37:04 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V4 08/10] PCI/VGA: Log bridge control messages when adding
 devices
Date: Fri, 27 Aug 2021 16:31:27 +0800
Message-Id: <20210827083129.2781420-9-chenhuacai@loongson.cn>
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

Previously vga_arb_device_init() iterated through all VGA devices and
indicated whether legacy VGA routing to each could be controlled by an
upstream bridge.

But we determine that information in vga_arbiter_add_pci_device(), which we
call for every device, so we can log it there without iterating through the
VGA devices again.

Note that we call vga_arbiter_check_bridge_sharing() before adding the
device to vga_list, so we have to handle the very first device separately.

[bhelgaas: commit log, split another piece to separate patch, fix
list_empty() issue]
Link: https://lore.kernel.org/r/20210705100503.1120643-1-chenhuacai@loongson.cn
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/vgaarb.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 4cecb599f5ed..dd07b1c3205f 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -609,8 +609,10 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
 
 	vgadev->bridge_has_one_vga = true;
 
-	if (list_empty(&vga_list))
+	if (list_empty(&vga_list)) {
+		vgaarb_info(&vgadev->pdev->dev, "bridge control possible\n");
 		return;
+	}
 
 	/* okay iterate the new devices bridge hierarachy */
 	new_bus = vgadev->pdev->bus;
@@ -649,6 +651,11 @@ static void vga_arbiter_check_bridge_sharing(struct vga_device *vgadev)
 		}
 		new_bus = new_bus->parent;
 	}
+
+	if (vgadev->bridge_has_one_vga)
+		vgaarb_info(&vgadev->pdev->dev, "bridge control possible\n");
+	else
+		vgaarb_info(&vgadev->pdev->dev, "no bridge control possible\n");
 }
 
 /*
@@ -1527,7 +1534,6 @@ static int __init vga_arb_device_init(void)
 {
 	int rc;
 	struct pci_dev *pdev;
-	struct vga_device *vgadev;
 
 	rc = misc_register(&vga_arb_device);
 	if (rc < 0)
@@ -1543,15 +1549,6 @@ static int __init vga_arb_device_init(void)
 			       PCI_ANY_ID, pdev)) != NULL)
 		vga_arbiter_add_pci_device(pdev);
 
-	list_for_each_entry(vgadev, &vga_list, list) {
-		struct device *dev = &vgadev->pdev->dev;
-
-		if (vgadev->bridge_has_one_vga)
-			vgaarb_info(dev, "bridge control possible\n");
-		else
-			vgaarb_info(dev, "no bridge control possible\n");
-	}
-
 	vga_arb_select_default_device();
 
 	pr_info("loaded\n");
-- 
2.27.0

