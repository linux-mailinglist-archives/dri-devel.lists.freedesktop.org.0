Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC3972D7BA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 05:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8000410E312;
	Tue, 13 Jun 2023 03:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58A4E10E30E;
 Tue, 13 Jun 2023 03:02:02 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:47948.1267835893
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id A70B21002F7;
 Tue, 13 Jun 2023 11:01:59 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-7vx9t with ESMTP id
 a017ae4872414e4aa6dd165875a604cc for bhelgaas@google.com; 
 Tue, 13 Jun 2023 11:02:00 CST
X-Transaction-ID: a017ae4872414e4aa6dd165875a604cc
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v7 2/8] PCI/VGA: Deal only with VGA class devices
Date: Tue, 13 Jun 2023 11:01:45 +0800
Message-Id: <20230613030151.216625-3-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230613030151.216625-1-15330273260@189.cn>
References: <20230613030151.216625-1-15330273260@189.cn>
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Deal only with the VGA devcie(pdev->class == 0x0300), so replace the
pci_get_subsys() function with pci_get_class(). Filter the non-PCI display
device(pdev->class != 0x0300) out. There no need to process the non-display
PCI device.

Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index c1bc6c983932..22a505e877dc 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -754,10 +754,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 	struct pci_dev *bridge;
 	u16 cmd;
 
-	/* Only deal with VGA class devices */
-	if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
-		return false;
-
 	/* Allocate structure */
 	vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
 	if (vgadev == NULL) {
@@ -1500,7 +1496,9 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 	struct pci_dev *pdev = to_pci_dev(dev);
 	bool notify = false;
 
-	vgaarb_dbg(dev, "%s\n", __func__);
+	/* Only deal with VGA class devices */
+	if (pdev->class != PCI_CLASS_DISPLAY_VGA << 8)
+		return 0;
 
 	/* For now we're only intereted in devices added and removed. I didn't
 	 * test this thing here, so someone needs to double check for the
@@ -1510,6 +1508,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 	else if (action == BUS_NOTIFY_DEL_DEVICE)
 		notify = vga_arbiter_del_pci_device(pdev);
 
+	vgaarb_dbg(dev, "%s: action = %lu\n", __func__, action);
+
 	if (notify)
 		vga_arbiter_notify_clients();
 	return 0;
@@ -1534,8 +1534,8 @@ static struct miscdevice vga_arb_device = {
 
 static int __init vga_arb_device_init(void)
 {
+	struct pci_dev *pdev = NULL;
 	int rc;
-	struct pci_dev *pdev;
 
 	rc = misc_register(&vga_arb_device);
 	if (rc < 0)
@@ -1545,11 +1545,13 @@ static int __init vga_arb_device_init(void)
 
 	/* We add all PCI devices satisfying VGA class in the arbiter by
 	 * default */
-	pdev = NULL;
-	while ((pdev =
-		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
-			       PCI_ANY_ID, pdev)) != NULL)
+	while (1) {
+		pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev);
+		if (!pdev)
+			break;
+
 		vga_arbiter_add_pci_device(pdev);
+	}
 
 	pr_info("loaded\n");
 	return rc;
-- 
2.25.1

