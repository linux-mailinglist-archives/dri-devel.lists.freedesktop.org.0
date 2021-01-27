Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5457305AAE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 13:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BFA6E5CC;
	Wed, 27 Jan 2021 12:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB456E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 12:03:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5BBEAE65;
 Wed, 27 Jan 2021 12:03:08 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH 06/12] drm/ast: Add cursor-plane data structure
Date: Wed, 27 Jan 2021 13:02:56 +0100
Message-Id: <20210127120302.13532-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127120302.13532-1-tzimmermann@suse.de>
References: <20210127120302.13532-1-tzimmermann@suse.de>
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

Cursor state is currently located throughout struct ast_private. Having
struct ast_cursor_plane as dedicated data structure for cursors helps to
organize the modesetting code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/ast/ast_mode.c |  5 +++--
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2761fa547c35..9eefd3f01f4c 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -81,6 +81,9 @@ enum ast_tx_chip {
 #define AST_DRAM_4Gx16   7
 #define AST_DRAM_8Gx16   8
 
+/*
+ * Cursor plane
+ */
 
 #define AST_MAX_HWC_WIDTH	64
 #define AST_MAX_HWC_HEIGHT	64
@@ -99,6 +102,20 @@ enum ast_tx_chip {
 #define AST_HWC_SIGNATURE_HOTSPOTX	0x14
 #define AST_HWC_SIGNATURE_HOTSPOTY	0x18
 
+struct ast_cursor_plane {
+	struct drm_plane base;
+};
+
+static inline struct ast_cursor_plane *
+to_ast_cursor_plane(struct drm_plane *plane)
+{
+	return container_of(plane, struct ast_cursor_plane, base);
+}
+
+/*
+ * Connector with i2c channel
+ */
+
 struct ast_i2c_chan {
 	struct i2c_adapter adapter;
 	struct drm_device *dev;
@@ -116,6 +133,10 @@ to_ast_connector(struct drm_connector *connector)
 	return container_of(connector, struct ast_connector, base);
 }
 
+/*
+ * Device
+ */
+
 struct ast_private {
 	struct drm_device base;
 
@@ -136,7 +157,7 @@ struct ast_private {
 	} cursor;
 
 	struct drm_plane primary_plane;
-	struct drm_plane cursor_plane;
+	struct ast_cursor_plane cursor_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct ast_connector connector;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 968ee0c69ec3..9dc70aa62fef 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -932,7 +932,8 @@ static const struct drm_plane_funcs ast_cursor_plane_funcs = {
 static int ast_cursor_plane_init(struct ast_private *ast)
 {
 	struct drm_device *dev = &ast->base;
-	struct drm_plane *cursor_plane = &ast->cursor_plane;
+	struct ast_cursor_plane *ast_cursor_plane = &ast->cursor_plane;
+	struct drm_plane *cursor_plane = &ast_cursor_plane->base;
 	size_t size, i;
 	struct drm_gem_vram_object *gbo;
 	int ret;
@@ -1178,7 +1179,7 @@ static int ast_crtc_init(struct drm_device *dev)
 	int ret;
 
 	ret = drm_crtc_init_with_planes(dev, crtc, &ast->primary_plane,
-					&ast->cursor_plane, &ast_crtc_funcs,
+					&ast->cursor_plane.base, &ast_crtc_funcs,
 					NULL);
 	if (ret)
 		return ret;
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
