Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146A204C1C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 10:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569566E96C;
	Tue, 23 Jun 2020 08:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9516E973
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:19:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7B70ADFF;
 Tue, 23 Jun 2020 08:19:03 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH 08/14] drm/ast: Add helper to hide cursor
Date: Tue, 23 Jun 2020 10:18:55 +0200
Message-Id: <20200623081901.10667-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623081901.10667-1-tzimmermann@suse.de>
References: <20200623081901.10667-1-tzimmermann@suse.de>
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

As the inverse to ast_cursor_show(), ast_cursor_hide() disables the
HW cursor.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 5 +++++
 drivers/gpu/drm/ast/ast_drv.h    | 1 +
 drivers/gpu/drm/ast/ast_mode.c   | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 8f8fdc831830..5421241015d6 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -284,3 +284,8 @@ int ast_cursor_show(struct ast_private *ast, int x, int y,
 
 	return 0;
 }
+
+void ast_cursor_hide(struct ast_private *ast)
+{
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, 0x00);
+}
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index b00091798ef5..92af0637ac48 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -321,5 +321,6 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb);
 void ast_cursor_page_flip(struct ast_private *ast);
 int ast_cursor_show(struct ast_private *ast, int x, int y,
 		    unsigned int offset_x, unsigned int offset_y);
+void ast_cursor_hide(struct ast_private *ast);
 
 #endif
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 4836e2ba5508..7863a49968b4 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -683,7 +683,7 @@ ast_cursor_plane_helper_atomic_disable(struct drm_plane *plane,
 {
 	struct ast_private *ast = to_ast_private(plane->dev);
 
-	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, 0x00);
+	ast_cursor_hide(ast);
 }
 
 static const struct drm_plane_helper_funcs ast_cursor_plane_helper_funcs = {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
