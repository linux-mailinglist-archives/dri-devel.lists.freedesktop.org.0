Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F114B230469
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703876E209;
	Tue, 28 Jul 2020 07:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607CB6E203
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:44:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 03FC4AFD1;
 Tue, 28 Jul 2020 07:44:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH 10/13] drm/ast: Embed struct drm_device in struct ast_private
Date: Tue, 28 Jul 2020 09:44:22 +0200
Message-Id: <20200728074425.2749-11-tzimmermann@suse.de>
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

Turns struct ast_private into a subclass of struct drm_device by
embedding the latter. This allows for using DRM's managed device
allocation.

The use of struct drm_device.dev_private is deprecated. The patch
converts the last remaining users to to_ast_private().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c |  6 ++---
 drivers/gpu/drm/ast/ast_drv.c    |  2 +-
 drivers/gpu/drm/ast/ast_drv.h    |  4 +--
 drivers/gpu/drm/ast/ast_main.c   | 42 ++++++++++----------------------
 drivers/gpu/drm/ast/ast_mm.c     |  2 +-
 drivers/gpu/drm/ast/ast_mode.c   |  2 +-
 drivers/gpu/drm/ast/ast_post.c   |  2 +-
 7 files changed, 22 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 8d693c8b346f..6c96f74cdb9e 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -57,7 +57,7 @@ static void ast_cursor_release(struct drm_device *dev, void *ptr)
  */
 int ast_cursor_init(struct ast_private *ast)
 {
-	struct drm_device *dev = ast->dev;
+	struct drm_device *dev = &ast->base;
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
 	void __iomem *vaddr;
@@ -168,7 +168,7 @@ static void update_cursor_image(u8 __iomem *dst, const u8 *src, int width, int h
 
 int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 {
-	struct drm_device *dev = ast->dev;
+	struct drm_device *dev = &ast->base;
 	struct drm_gem_vram_object *gbo;
 	int ret;
 	void *src;
@@ -217,7 +217,7 @@ static void ast_cursor_set_base(struct ast_private *ast, u64 address)
 
 void ast_cursor_page_flip(struct ast_private *ast)
 {
-	struct drm_device *dev = ast->dev;
+	struct drm_device *dev = &ast->base;
 	struct drm_gem_vram_object *gbo;
 	s64 off;
 
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index ad93c35b4cf7..c394383a7979 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -124,7 +124,7 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		ret = PTR_ERR(ast);
 		goto err_drm_dev_put;
 	}
-	dev = ast->dev;
+	dev = &ast->base;
 
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index f1aebc719d9e..86c9a7ac712b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -116,7 +116,7 @@ to_ast_connector(struct drm_connector *connector)
 }
 
 struct ast_private {
-	struct drm_device *dev;
+	struct drm_device base;
 
 	void __iomem *regs;
 	void __iomem *ioregs;
@@ -156,7 +156,7 @@ struct ast_private {
 
 static inline struct ast_private *to_ast_private(struct drm_device *dev)
 {
-	return dev->dev_private;
+	return container_of(dev, struct ast_private, base);
 }
 
 struct ast_private *ast_device_create(struct drm_driver *drv,
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 8d46166f8462..792fb7f616ec 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -388,25 +388,17 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
 	bool need_post;
 	int ret = 0;
 
-	dev = drm_dev_alloc(drv, &pdev->dev);
-	if (IS_ERR(dev))
-		return ERR_CAST(dev);
+	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_private, base);
+	if (IS_ERR(ast))
+		return ast;
+	dev = &ast->base;
 
 	dev->pdev = pdev;
 	pci_set_drvdata(pdev, dev);
 
-	ast = kzalloc(sizeof(struct ast_private), GFP_KERNEL);
-	if (!ast)
-		return ERR_PTR(-ENOMEM);
-
-	dev->dev_private = ast;
-	ast->dev = dev;
-
 	ast->regs = pci_iomap(dev->pdev, 1, 0);
-	if (!ast->regs) {
-		ret = -EIO;
-		goto out_free;
-	}
+	if (!ast->regs)
+		return ERR_PTR(-EIO);
 
 	/*
 	 * If we don't have IO space at all, use MMIO now and
@@ -421,17 +413,16 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
 	/* "map" IO regs if the above hasn't done so already */
 	if (!ast->ioregs) {
 		ast->ioregs = pci_iomap(dev->pdev, 2, 0);
-		if (!ast->ioregs) {
-			ret = -EIO;
-			goto out_free;
-		}
+		if (!ast->ioregs)
+			return ERR_PTR(-EIO);
 	}
 
 	ast_detect_chip(dev, &need_post);
 
 	ret = ast_get_dram_info(dev);
 	if (ret)
-		goto out_free;
+		return ERR_PTR(ret);
+
 	drm_info(dev, "dram MCLK=%u Mhz type=%d bus_width=%d\n",
 		 ast->mclk, ast->dram_type, ast->dram_bus_width);
 
@@ -440,29 +431,22 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
 
 	ret = ast_mm_init(ast);
 	if (ret)
-		goto out_free;
+		return ERR_PTR(ret);
 
 	ret = ast_mode_config_init(ast);
 	if (ret)
-		goto out_free;
+		return ERR_PTR(ret);
 
 	return ast;
-
-out_free:
-	kfree(ast);
-	dev->dev_private = NULL;
-	return ERR_PTR(ret);
 }
 
 void ast_device_destroy(struct ast_private *ast)
 {
-	struct drm_device *dev = ast->dev;
+	struct drm_device *dev = &ast->base;
 
 	/* enable standard VGA decode */
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
 
 	ast_release_firmware(dev);
 	kfree(ast->dp501_fw_addr);
-
-	kfree(ast);
 }
diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 9186ec3ebbe0..8392ebde504b 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -85,9 +85,9 @@ static void ast_mm_release(struct drm_device *dev, void *ptr)
 
 int ast_mm_init(struct ast_private *ast)
 {
+	struct drm_device *dev = &ast->base;
 	u32 vram_size;
 	int ret;
-	struct drm_device *dev = ast->dev;
 
 	vram_size = ast_get_vram_size(ast);
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index dceb11a320b2..4a4010fdfd2d 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1180,7 +1180,7 @@ static const struct drm_mode_config_funcs ast_mode_config_funcs = {
 
 int ast_mode_config_init(struct ast_private *ast)
 {
-	struct drm_device *dev = ast->dev;
+	struct drm_device *dev = &ast->base;
 	int ret;
 
 	ret = ast_cursor_init(ast);
diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
index b1d42a639ece..8902c2f84bf9 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -365,8 +365,8 @@ static void ast_init_dram_reg(struct drm_device *dev)
 
 void ast_post_gpu(struct drm_device *dev)
 {
-	u32 reg;
 	struct ast_private *ast = to_ast_private(dev);
+	u32 reg;
 
 	pci_read_config_dword(dev->pdev, 0x04, &reg);
 	reg |= 0x3;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
