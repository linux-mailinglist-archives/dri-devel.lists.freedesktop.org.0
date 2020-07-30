Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A9D233371
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 15:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE316E8FE;
	Thu, 30 Jul 2020 13:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B966E8F8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:52:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58F55B130;
 Thu, 30 Jul 2020 13:52:21 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH v2 9/9] drm/ast: Managed device release
Date: Thu, 30 Jul 2020 15:52:06 +0200
Message-Id: <20200730135206.30239-10-tzimmermann@suse.de>
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

This turns the ast's device cleanup code into a managed release helper
function. Note that the code uses devres helpers. The release function
switches the device back to VGA mode and therefore runs during HW device
cleanup; not at DRM device cleanup.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ast/ast_drv.c  | 17 +++--------------
 drivers/gpu/drm/ast/ast_drv.h  |  1 -
 drivers/gpu/drm/ast/ast_main.c | 22 ++++++++++++++++------
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index c394383a7979..f0b4af1c390a 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -120,35 +120,24 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		return ret;
 
 	ast = ast_device_create(&ast_driver, pdev, ent->driver_data);
-	if (IS_ERR(ast)) {
-		ret = PTR_ERR(ast);
-		goto err_drm_dev_put;
-	}
+	if (IS_ERR(ast))
+		return PTR_ERR(ast);
 	dev = &ast->base;
 
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
-		goto err_ast_device_destroy;
+		return ret;
 
 	drm_fbdev_generic_setup(dev, 32);
 
 	return 0;
-
-err_ast_device_destroy:
-	ast_device_destroy(ast);
-err_drm_dev_put:
-	drm_dev_put(dev);
-	return ret;
 }
 
 static void ast_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct ast_private *ast = to_ast_private(dev);
 
 	drm_dev_unregister(dev);
-	ast_device_destroy(ast);
-	drm_dev_put(dev);
 }
 
 static int ast_drm_freeze(struct drm_device *dev)
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index af26483106bd..c1af6b725933 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -162,7 +162,6 @@ static inline struct ast_private *to_ast_private(struct drm_device *dev)
 struct ast_private *ast_device_create(struct drm_driver *drv,
 				      struct pci_dev *pdev,
 				      unsigned long flags);
-void ast_device_destroy(struct ast_private *ast);
 
 #define AST_IO_AR_PORT_WRITE		(0x40)
 #define AST_IO_MISC_PORT_WRITE		(0x42)
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 67e20727d82d..d62749a10cdd 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -380,6 +380,18 @@ static int ast_get_dram_info(struct drm_device *dev)
 	return 0;
 }
 
+/*
+ * Run this function as part of the HW device cleanup; not
+ * when the DRM device gets released.
+ */
+static void ast_device_release(void *data)
+{
+	struct ast_private *ast = data;
+
+	/* enable standard VGA decode */
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
+}
+
 struct ast_private *ast_device_create(struct drm_driver *drv,
 				      struct pci_dev *pdev,
 				      unsigned long flags)
@@ -438,11 +450,9 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
 	if (ret)
 		return ERR_PTR(ret);
 
-	return ast;
-}
+	ret = devm_add_action_or_reset(dev->dev, ast_device_release, ast);
+	if (ret)
+		return ERR_PTR(ret);
 
-void ast_device_destroy(struct ast_private *ast)
-{
-	/* enable standard VGA decode */
-	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
+	return ast;
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
