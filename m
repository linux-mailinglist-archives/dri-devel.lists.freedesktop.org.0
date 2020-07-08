Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1092181B7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8CE6E89A;
	Wed,  8 Jul 2020 07:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6596E6E89E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 07:49:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CEDDDAF36;
 Wed,  8 Jul 2020 07:49:14 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, noralf@tronnes.org,
 emil.l.velikov@gmail.com, yc_chen@aspeedtech.com
Subject: [PATCH 6/6] drm/ast: Use managed MM initialization
Date: Wed,  8 Jul 2020 09:49:12 +0200
Message-Id: <20200708074912.25422-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708074912.25422-1-tzimmermann@suse.de>
References: <20200708074912.25422-1-tzimmermann@suse.de>
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

Cleaning up ast's MM code with ast_mm_fini() resets the write-combine
flags on the VRAM I/O memory. Drop ast_mm_fini() in favor of an auto-
release callback. Releasing the device also executes the callback.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 -
 drivers/gpu/drm/ast/ast_main.c |  1 -
 drivers/gpu/drm/ast/ast_mm.c   | 23 ++++++++++++-----------
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 9a770e5b36d1..e3a264ac7ee2 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -291,7 +291,6 @@ int ast_mode_config_init(struct ast_private *ast);
 #define AST_MM_ALIGN_MASK ((1 << AST_MM_ALIGN_SHIFT) - 1)
 
 int ast_mm_init(struct ast_private *ast);
-void ast_mm_fini(struct ast_private *ast);
 
 /* ast post */
 void ast_enable_vga(struct drm_device *dev);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 87e5baded2a7..dd12b55d57a2 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -452,6 +452,5 @@ void ast_driver_unload(struct drm_device *dev)
 	ast_release_firmware(dev);
 	kfree(ast->dp501_fw_addr);
 
-	ast_mm_fini(ast);
 	kfree(ast);
 }
diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
index 4cf30bf6414a..52debea8d1c7 100644
--- a/drivers/gpu/drm/ast/ast_mm.c
+++ b/drivers/gpu/drm/ast/ast_mm.c
@@ -28,8 +28,9 @@
 
 #include <linux/pci.h>
 
-#include <drm/drm_print.h>
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "ast_drv.h"
 
@@ -73,6 +74,15 @@ static u32 ast_get_vram_size(struct ast_private *ast)
 	return vram_size;
 }
 
+static void ast_mm_release(struct drm_device *dev, void *ptr)
+{
+	struct ast_private *ast = to_ast_private(dev);
+
+	arch_phys_wc_del(ast->fb_mtrr);
+	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
+				pci_resource_len(dev->pdev, 0));
+}
+
 int ast_mm_init(struct ast_private *ast)
 {
 	struct drm_vram_mm *vmm;
@@ -95,14 +105,5 @@ int ast_mm_init(struct ast_private *ast)
 	ast->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
 					pci_resource_len(dev->pdev, 0));
 
-	return 0;
-}
-
-void ast_mm_fini(struct ast_private *ast)
-{
-	struct drm_device *dev = ast->dev;
-
-	arch_phys_wc_del(ast->fb_mtrr);
-	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
-				pci_resource_len(dev->pdev, 0));
+	return drmm_add_action_or_reset(dev, ast_mm_release, NULL);
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
