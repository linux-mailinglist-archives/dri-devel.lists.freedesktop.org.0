Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 674FF23046E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0FF6E212;
	Tue, 28 Jul 2020 07:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565376E1F1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:44:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C025AF5A;
 Tue, 28 Jul 2020 07:44:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH 07/13] drm/ast: Replace driver load/unload functions with
 device create/destroy
Date: Tue, 28 Jul 2020 09:44:19 +0200
Message-Id: <20200728074425.2749-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200728074425.2749-1-tzimmermann@suse.de>
References: <20200728074425.2749-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ast driver's load and unload functions are left-overs from when
struct drm_driver.load/unload was still in use. The PCI probe helper
allocated the DRM device and ran load to initialize it.

This patch replaces this code with device create and destroy. The
main difference is that the device's create function allocates the
DRM device and ast structures in the same place. This will be required
for switching ast to managed allocations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.c  | 24 +++++++++++-------------
 drivers/gpu/drm/ast/ast_drv.h  |  6 ++++--
 drivers/gpu/drm/ast/ast_main.c | 24 ++++++++++++++++++------
 3 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 9d04f2b5225c..ad93c35b4cf7 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -109,6 +109,7 @@ static void ast_kick_out_firmware_fb(struct pci_dev *pdev)
 
 static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
+	struct ast_private *ast;
 	struct drm_device *dev;
 	int ret;
 
@@ -118,27 +119,23 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (ret)
 		return ret;
 
-	dev = drm_dev_alloc(&ast_driver, &pdev->dev);
-	if (IS_ERR(dev))
-		return  PTR_ERR(dev);
-
-	dev->pdev = pdev;
-	pci_set_drvdata(pdev, dev);
-
-	ret = ast_driver_load(dev, ent->driver_data);
-	if (ret)
+	ast = ast_device_create(&ast_driver, pdev, ent->driver_data);
+	if (IS_ERR(ast)) {
+		ret = PTR_ERR(ast);
 		goto err_drm_dev_put;
+	}
+	dev = ast->dev;
 
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
-		goto err_ast_driver_unload;
+		goto err_ast_device_destroy;
 
 	drm_fbdev_generic_setup(dev, 32);
 
 	return 0;
 
-err_ast_driver_unload:
-	ast_driver_unload(dev);
+err_ast_device_destroy:
+	ast_device_destroy(ast);
 err_drm_dev_put:
 	drm_dev_put(dev);
 	return ret;
@@ -147,9 +144,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 static void ast_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct ast_private *ast = to_ast_private(dev);
 
 	drm_dev_unregister(dev);
-	ast_driver_unload(dev);
+	ast_device_destroy(ast);
 	drm_dev_put(dev);
 }
 
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index b401560e4e8f..f1aebc719d9e 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -159,8 +159,10 @@ static inline struct ast_private *to_ast_private(struct drm_device *dev)
 	return dev->dev_private;
 }
 
-int ast_driver_load(struct drm_device *dev, unsigned long flags);
-void ast_driver_unload(struct drm_device *dev);
+struct ast_private *ast_device_create(struct drm_driver *drv,
+				      struct pci_dev *pdev,
+				      unsigned long flags);
+void ast_device_destroy(struct ast_private *ast);
 
 #define AST_IO_AR_PORT_WRITE		(0x40)
 #define AST_IO_MISC_PORT_WRITE		(0x42)
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index dd12b55d57a2..8d46166f8462 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -30,6 +30,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
 
@@ -378,15 +379,25 @@ static int ast_get_dram_info(struct drm_device *dev)
 	return 0;
 }
 
-int ast_driver_load(struct drm_device *dev, unsigned long flags)
+struct ast_private *ast_device_create(struct drm_driver *drv,
+				      struct pci_dev *pdev,
+				      unsigned long flags)
 {
+	struct drm_device *dev;
 	struct ast_private *ast;
 	bool need_post;
 	int ret = 0;
 
+	dev = drm_dev_alloc(drv, &pdev->dev);
+	if (IS_ERR(dev))
+		return ERR_CAST(dev);
+
+	dev->pdev = pdev;
+	pci_set_drvdata(pdev, dev);
+
 	ast = kzalloc(sizeof(struct ast_private), GFP_KERNEL);
 	if (!ast)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dev->dev_private = ast;
 	ast->dev = dev;
@@ -435,16 +446,17 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto out_free;
 
-	return 0;
+	return ast;
+
 out_free:
 	kfree(ast);
 	dev->dev_private = NULL;
-	return ret;
+	return ERR_PTR(ret);
 }
 
-void ast_driver_unload(struct drm_device *dev)
+void ast_device_destroy(struct ast_private *ast)
 {
-	struct ast_private *ast = to_ast_private(dev);
+	struct drm_device *dev = ast->dev;
 
 	/* enable standard VGA decode */
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
