Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1873A23336D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 15:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1BB6E8F2;
	Thu, 30 Jul 2020 13:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423FE6E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:52:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DF10B11F;
 Thu, 30 Jul 2020 13:52:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH v2 2/9] drm/ast: Separate DRM driver from PCI code
Date: Thu, 30 Jul 2020 15:51:59 +0200
Message-Id: <20200730135206.30239-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200730135206.30239-1-tzimmermann@suse.de>
References: <20200730135206.30239-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Putting the DRM driver to the top of the file and the PCI code to the
bottom makes ast_drv.c more readable. While at it, the patch prefixes
file-scope variables with ast_.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ast/ast_drv.c | 59 ++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 0b58f7aee6b0..9d04f2b5225c 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -43,9 +43,33 @@ int ast_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, ast_modeset, int, 0400);
 
-#define PCI_VENDOR_ASPEED 0x1a03
+/*
+ * DRM driver
+ */
+
+DEFINE_DRM_GEM_FOPS(ast_fops);
+
+static struct drm_driver ast_driver = {
+	.driver_features = DRIVER_ATOMIC |
+			   DRIVER_GEM |
+			   DRIVER_MODESET,
+
+	.fops = &ast_fops,
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
 
-static struct drm_driver driver;
+	DRM_GEM_VRAM_DRIVER
+};
+
+/*
+ * PCI driver
+ */
+
+#define PCI_VENDOR_ASPEED 0x1a03
 
 #define AST_VGA_DEVICE(id, info) {		\
 	.class = PCI_BASE_CLASS_DISPLAY << 16,	\
@@ -56,13 +80,13 @@ static struct drm_driver driver;
 	.subdevice = PCI_ANY_ID,		\
 	.driver_data = (unsigned long) info }
 
-static const struct pci_device_id pciidlist[] = {
+static const struct pci_device_id ast_pciidlist[] = {
 	AST_VGA_DEVICE(PCI_CHIP_AST2000, NULL),
 	AST_VGA_DEVICE(PCI_CHIP_AST2100, NULL),
 	{0, 0, 0},
 };
 
-MODULE_DEVICE_TABLE(pci, pciidlist);
+MODULE_DEVICE_TABLE(pci, ast_pciidlist);
 
 static void ast_kick_out_firmware_fb(struct pci_dev *pdev)
 {
@@ -94,7 +118,7 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&driver, &pdev->dev);
+	dev = drm_dev_alloc(&ast_driver, &pdev->dev);
 	if (IS_ERR(dev))
 		return  PTR_ERR(dev);
 
@@ -118,11 +142,9 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_drm_dev_put:
 	drm_dev_put(dev);
 	return ret;
-
 }
 
-static void
-ast_pci_remove(struct pci_dev *pdev)
+static void ast_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
@@ -217,30 +239,12 @@ static const struct dev_pm_ops ast_pm_ops = {
 
 static struct pci_driver ast_pci_driver = {
 	.name = DRIVER_NAME,
-	.id_table = pciidlist,
+	.id_table = ast_pciidlist,
 	.probe = ast_pci_probe,
 	.remove = ast_pci_remove,
 	.driver.pm = &ast_pm_ops,
 };
 
-DEFINE_DRM_GEM_FOPS(ast_fops);
-
-static struct drm_driver driver = {
-	.driver_features = DRIVER_ATOMIC |
-			   DRIVER_GEM |
-			   DRIVER_MODESET,
-
-	.fops = &ast_fops,
-	.name = DRIVER_NAME,
-	.desc = DRIVER_DESC,
-	.date = DRIVER_DATE,
-	.major = DRIVER_MAJOR,
-	.minor = DRIVER_MINOR,
-	.patchlevel = DRIVER_PATCHLEVEL,
-
-	DRM_GEM_VRAM_DRIVER
-};
-
 static int __init ast_init(void)
 {
 	if (vgacon_text_force() && ast_modeset == -1)
@@ -261,4 +265,3 @@ module_exit(ast_exit);
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_LICENSE("GPL and additional rights");
-
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
