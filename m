Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B2840D48A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 10:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D416EADE;
	Thu, 16 Sep 2021 08:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAF16EADE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:31:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9D1061207;
 Thu, 16 Sep 2021 08:31:14 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xuefeng Li <lixuefeng@loongson.cn>, Huacai Chen <chenhuacai@gmail.com>,
 Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V6 01/12] PCI/VGA: Prefer vga_default_device()
Date: Thu, 16 Sep 2021 16:29:30 +0800
Message-Id: <20210916082941.3421838-2-chenhuacai@loongson.cn>
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

Use the vga_default_device() interface consistently instead of directly
testing vga_default.  No functional change intended.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/gpu/vga/vgaarb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index 569930552957..6a5169d8578f 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -193,7 +193,7 @@ int vga_remove_vgacon(struct pci_dev *pdev)
 {
 	int ret = 0;
 
-	if (pdev != vga_default)
+	if (pdev != vga_default_device())
 		return 0;
 	vgaarb_info(&pdev->dev, "deactivate vga console\n");
 
@@ -695,7 +695,7 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
 	/* Deal with VGA default device. Use first enabled one
 	 * by default if arch doesn't have it's own hook
 	 */
-	if (vga_default == NULL &&
+	if (!vga_default_device() &&
 	    ((vgadev->owns & VGA_RSRC_LEGACY_MASK) == VGA_RSRC_LEGACY_MASK)) {
 		vgaarb_info(&pdev->dev, "setting as boot VGA device\n");
 		vga_set_default_device(pdev);
@@ -732,7 +732,7 @@ static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
 		goto bail;
 	}
 
-	if (vga_default == pdev)
+	if (vga_default_device() == pdev)
 		vga_set_default_device(NULL);
 
 	if (vgadev->decodes & (VGA_RSRC_LEGACY_IO | VGA_RSRC_LEGACY_MEM))
-- 
2.27.0

