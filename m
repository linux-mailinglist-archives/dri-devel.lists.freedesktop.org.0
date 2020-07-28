Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8823046B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 09:44:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F7F6E20A;
	Tue, 28 Jul 2020 07:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDA66E1D5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 07:44:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26111AFD4;
 Tue, 28 Jul 2020 07:44:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH 11/13] drm/ast: Managed release of ast firmware
Date: Tue, 28 Jul 2020 09:44:23 +0200
Message-Id: <20200728074425.2749-12-tzimmermann@suse.de>
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

The ast driver loads firmware for the DP501 display encoder. The
patch replaces the removal code with a managed release function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp501.c | 23 ++++++++++++++---------
 drivers/gpu/drm/ast/ast_drv.h   |  1 -
 drivers/gpu/drm/ast/ast_main.c  |  3 ---
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 4b85a504825a..88121c0e0d05 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -8,11 +8,24 @@
 
 MODULE_FIRMWARE("ast_dp501_fw.bin");
 
+static void ast_release_firmware(void *data)
+{
+	struct ast_private *ast = data;
+
+	release_firmware(ast->dp501_fw);
+	ast->dp501_fw = NULL;
+}
+
 static int ast_load_dp501_microcode(struct drm_device *dev)
 {
 	struct ast_private *ast = to_ast_private(dev);
+	int ret;
+
+	ret = request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->dev);
+	if (ret)
+		return ret;
 
-	return request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->dev);
+	return devm_add_action_or_reset(dev->dev, ast_release_firmware, ast);
 }
 
 static void send_ack(struct ast_private *ast)
@@ -435,11 +448,3 @@ void ast_init_3rdtx(struct drm_device *dev)
 		}
 	}
 }
-
-void ast_release_firmware(struct drm_device *dev)
-{
-	struct ast_private *ast = to_ast_private(dev);
-
-	release_firmware(ast->dp501_fw);
-	ast->dp501_fw = NULL;
-}
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 86c9a7ac712b..02908d005b99 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -312,7 +312,6 @@ bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
 bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
 u8 ast_get_dp501_max_clk(struct drm_device *dev);
 void ast_init_3rdtx(struct drm_device *dev);
-void ast_release_firmware(struct drm_device *dev);
 
 /* ast_cursor.c */
 int ast_cursor_init(struct ast_private *ast);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 792fb7f616ec..e3b7748335a3 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -442,11 +442,8 @@ struct ast_private *ast_device_create(struct drm_driver *drv,
 
 void ast_device_destroy(struct ast_private *ast)
 {
-	struct drm_device *dev = &ast->base;
-
 	/* enable standard VGA decode */
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
 
-	ast_release_firmware(dev);
 	kfree(ast->dp501_fw_addr);
 }
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
