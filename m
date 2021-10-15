Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0876A42E8E8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 08:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4B26ECD7;
	Fri, 15 Oct 2021 06:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026C96ECD7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 06:22:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAAC361090;
 Fri, 15 Oct 2021 06:22:49 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V7 08/11] PCI/VGA: Remove empty vga_arb_device_card_gone()
Date: Fri, 15 Oct 2021 14:15:09 +0800
Message-Id: <20211015061512.2941859-9-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211015061512.2941859-1-chenhuacai@loongson.cn>
References: <20211015061512.2941859-1-chenhuacai@loongson.cn>
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

From: Bjorn Helgaas <bhelgaas@google.com>

vga_arb_device_card_gone() has always been empty.  Remove it.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpu/vga/vgaarb.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index 05174fd7e7ef..7cd989c5d03b 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -122,8 +122,6 @@ static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
 /* this is only used a cookie - it should not be dereferenced */
 static struct pci_dev *vga_default;
 
-static void vga_arb_device_card_gone(struct pci_dev *pdev);
-
 /* Find somebody in our list */
 static struct vga_device *vgadev_find(struct pci_dev *pdev)
 {
@@ -825,10 +823,6 @@ static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
 	/* Remove entry from list */
 	list_del(&vgadev->list);
 	vga_count--;
-	/* Notify userland driver that the device is gone so it discards
-	 * it's copies of the pci_dev pointer
-	 */
-	vga_arb_device_card_gone(pdev);
 
 	/* Wake up all possible waiters */
 	wake_up_all(&vga_wait_queue);
@@ -1078,9 +1072,7 @@ static ssize_t vga_arb_read(struct file *file, char __user *buf,
 	if (lbuf == NULL)
 		return -ENOMEM;
 
-	/* Shields against vga_arb_device_card_gone (pci_dev going
-	 * away), and allows access to vga list
-	 */
+	/* Protects vga_list */
 	spin_lock_irqsave(&vga_lock, flags);
 
 	/* If we are targeting the default, use it */
@@ -1097,8 +1089,6 @@ static ssize_t vga_arb_read(struct file *file, char __user *buf,
 		/* Wow, it's not in the list, that shouldn't happen,
 		 * let's fix us up and return invalid card
 		 */
-		if (pdev == priv->target)
-			vga_arb_device_card_gone(pdev);
 		spin_unlock_irqrestore(&vga_lock, flags);
 		len = sprintf(lbuf, "invalid");
 		goto done;
@@ -1442,10 +1432,6 @@ static int vga_arb_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static void vga_arb_device_card_gone(struct pci_dev *pdev)
-{
-}
-
 /*
  * callback any registered clients to let them know we have a
  * change in VGA cards
-- 
2.27.0

