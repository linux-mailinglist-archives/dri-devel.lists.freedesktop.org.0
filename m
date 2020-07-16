Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B03A2222F3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2DD6EC59;
	Thu, 16 Jul 2020 12:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8D46EC57
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:53:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7CC0AF83;
 Thu, 16 Jul 2020 12:53:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, noralf@tronnes.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 4/6] drm/ast: Move VRAM size detection to ast_mm.c
Date: Thu, 16 Jul 2020 14:53:51 +0200
Message-Id: <20200716125353.31512-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200716125353.31512-1-tzimmermann@suse.de>
References: <20200716125353.31512-1-tzimmermann@suse.de>
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

VRAM size detection is only relevant to the memory management. Move
the code into ast_mm.c.

While at it, rename the function to ast_get_vram_size(). The function
argument's type is now struct ast_private. The result is stored in a
local variable and not in struct ast_private any longer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 -
 drivers/gpu/drm/ast/ast_main.c | 38 ++--------------------------
 drivers/gpu/drm/ast/ast_mm.c   | 45 +++++++++++++++++++++++++++++++++-
 3 files changed, 46 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index c8c442e9efdc..9a770e5b36d1 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -110,7 +110,6 @@ struct ast_private {
 	uint32_t dram_bus_width;
 	uint32_t dram_type;
 	uint32_t mclk;
-	uint32_t vram_size;
 
 	int fb_mtrr;
 
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 860a43a64b31..b162cc82204d 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -378,38 +378,6 @@ static int ast_get_dram_info(struct drm_device *dev)
 	return 0;
 }
 
-static u32 ast_get_vram_info(struct drm_device *dev)
-{
-	struct ast_private *ast = to_ast_private(dev);
-	u8 jreg;
-	u32 vram_size;
-	ast_open_key(ast);
-
-	vram_size = AST_VIDMEM_DEFAULT_SIZE;
-	jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xaa, 0xff);
-	switch (jreg & 3) {
-	case 0: vram_size = AST_VIDMEM_SIZE_8M; break;
-	case 1: vram_size = AST_VIDMEM_SIZE_16M; break;
-	case 2: vram_size = AST_VIDMEM_SIZE_32M; break;
-	case 3: vram_size = AST_VIDMEM_SIZE_64M; break;
-	}
-
-	jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0x99, 0xff);
-	switch (jreg & 0x03) {
-	case 1:
-		vram_size -= 0x100000;
-		break;
-	case 2:
-		vram_size -= 0x200000;
-		break;
-	case 3:
-		vram_size -= 0x400000;
-		break;
-	}
-
-	return vram_size;
-}
-
 int ast_driver_load(struct drm_device *dev, unsigned long flags)
 {
 	struct ast_private *ast;
@@ -456,10 +424,8 @@ int ast_driver_load(struct drm_device *dev, unsigned long flags)
 	ret = ast_get_dram_info(dev);
 	if (ret)
 		goto out_free;
-	ast->vram_size = ast_get_vram_info(dev);
-	drm_info(dev, "dram MCLK=%u Mhz type=%d bus_width=%d size=%08x\n",
-		 ast->mclk, ast->dram_type,
-		 ast->dram_bus_width, ast->vram_size);
+	drm_info(dev, "dram MCLK=%u Mhz type=%d bus_width=%d\n",
+		 ast->mclk, ast->dram_type, ast->dram_bus_width);
 
 	ret = ast_mm_init(ast);
 	if (ret)
diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index f0a96cae68c9..aaeb19d01052 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -33,13 +33,56 @@
 
 #include "ast_drv.h"
 
+static u32 ast_get_vram_size(struct ast_private *ast)
+{
+	u8 jreg;
+	u32 vram_size;
+
+	ast_open_key(ast);
+
+	vram_size = AST_VIDMEM_DEFAULT_SIZE;
+	jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xaa, 0xff);
+	switch (jreg & 3) {
+	case 0:
+		vram_size = AST_VIDMEM_SIZE_8M;
+		break;
+	case 1:
+		vram_size = AST_VIDMEM_SIZE_16M;
+		break;
+	case 2:
+		vram_size = AST_VIDMEM_SIZE_32M;
+		break;
+	case 3:
+		vram_size = AST_VIDMEM_SIZE_64M;
+		break;
+	}
+
+	jreg = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0x99, 0xff);
+	switch (jreg & 0x03) {
+	case 1:
+		vram_size -= 0x100000;
+		break;
+	case 2:
+		vram_size -= 0x200000;
+		break;
+	case 3:
+		vram_size -= 0x400000;
+		break;
+	}
+
+	return vram_size;
+}
+
 int ast_mm_init(struct ast_private *ast)
 {
+	u32 vram_size;
 	int ret;
 	struct drm_device *dev = ast->dev;
 
+	vram_size = ast_get_vram_size(ast);
+
 	ret = drmm_vram_helper_init(dev, pci_resource_start(dev->pdev, 0),
-				    ast->vram_size);
+				    vram_size);
 	if (ret) {
 		drm_err(dev, "Error initializing VRAM MM; %d\n", ret);
 		return ret;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
