Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 431DC233369
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 15:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09B56E8F7;
	Thu, 30 Jul 2020 13:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2805A6E8F0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:52:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39DBEAD75;
 Thu, 30 Jul 2020 13:52:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 emil.l.velikov@gmail.com, kraxel@redhat.com, yc_chen@aspeedtech.com
Subject: [PATCH v2 1/9] drm/ast: Embed CRTC and connector in struct ast_private
Date: Thu, 30 Jul 2020 15:51:58 +0200
Message-Id: <20200730135206.30239-2-tzimmermann@suse.de>
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

Only single instances of CRTC and connector are supported per
device. Embed both in ast's structure and remove the individual
memory allocations. DRM's CRTC cleanup helpers replace the rsp.
destroy function in ast.

While at it, also convert to_ast_connector() to a function.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/ast/ast_drv.h  | 33 +++++++++++++++++++--------------
 drivers/gpu/drm/ast/ast_mode.c | 34 +++++++---------------------------
 2 files changed, 26 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index e3a264ac7ee2..e7564055fa70 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -98,6 +98,22 @@ enum ast_tx_chip {
 #define AST_HWC_SIGNATURE_HOTSPOTX	0x14
 #define AST_HWC_SIGNATURE_HOTSPOTY	0x18
 
+struct ast_i2c_chan {
+	struct i2c_adapter adapter;
+	struct drm_device *dev;
+	struct i2c_algo_bit_data bit;
+};
+
+struct ast_connector {
+	struct drm_connector base;
+	struct ast_i2c_chan *i2c;
+};
+
+static inline struct ast_connector *
+to_ast_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct ast_connector, base);
+}
 
 struct ast_private {
 	struct drm_device *dev;
@@ -119,9 +135,11 @@ struct ast_private {
 		unsigned int next_index;
 	} cursor;
 
-	struct drm_encoder encoder;
 	struct drm_plane primary_plane;
 	struct drm_plane cursor_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct ast_connector connector;
 
 	bool support_wide_screen;
 	enum {
@@ -226,19 +244,6 @@ static inline void ast_open_key(struct ast_private *ast)
 
 #define AST_VIDMEM_DEFAULT_SIZE AST_VIDMEM_SIZE_8M
 
-struct ast_i2c_chan {
-	struct i2c_adapter adapter;
-	struct drm_device *dev;
-	struct i2c_algo_bit_data bit;
-};
-
-struct ast_connector {
-	struct drm_connector base;
-	struct ast_i2c_chan *i2c;
-};
-
-#define to_ast_connector(x) container_of(x, struct ast_connector, base)
-
 struct ast_vbios_stdtable {
 	u8 misc;
 	u8 seq[4];
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 154cd877d9d1..78f28a4e6ed8 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -831,12 +831,6 @@ static void ast_crtc_reset(struct drm_crtc *crtc)
 	__drm_atomic_helper_crtc_reset(crtc, &ast_state->base);
 }
 
-static void ast_crtc_destroy(struct drm_crtc *crtc)
-{
-	drm_crtc_cleanup(crtc);
-	kfree(crtc);
-}
-
 static struct drm_crtc_state *
 ast_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
 {
@@ -872,7 +866,7 @@ static void ast_crtc_atomic_destroy_state(struct drm_crtc *crtc,
 static const struct drm_crtc_funcs ast_crtc_funcs = {
 	.reset = ast_crtc_reset,
 	.gamma_set = drm_atomic_helper_legacy_gamma_set,
-	.destroy = ast_crtc_destroy,
+	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
 	.atomic_duplicate_state = ast_crtc_atomic_duplicate_state,
@@ -882,27 +876,19 @@ static const struct drm_crtc_funcs ast_crtc_funcs = {
 static int ast_crtc_init(struct drm_device *dev)
 {
 	struct ast_private *ast = to_ast_private(dev);
-	struct drm_crtc *crtc;
+	struct drm_crtc *crtc = &ast->crtc;
 	int ret;
 
-	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
-	if (!crtc)
-		return -ENOMEM;
-
 	ret = drm_crtc_init_with_planes(dev, crtc, &ast->primary_plane,
 					&ast->cursor_plane, &ast_crtc_funcs,
 					NULL);
 	if (ret)
-		goto err_kfree;
+		return ret;
 
 	drm_mode_crtc_set_gamma_size(crtc, 256);
 	drm_crtc_helper_add(crtc, &ast_crtc_helper_funcs);
 
 	return 0;
-
-err_kfree:
-	kfree(crtc);
-	return ret;
 }
 
 /*
@@ -1021,7 +1007,6 @@ static void ast_connector_destroy(struct drm_connector *connector)
 	struct ast_connector *ast_connector = to_ast_connector(connector);
 	ast_i2c_destroy(ast_connector->i2c);
 	drm_connector_cleanup(connector);
-	kfree(connector);
 }
 
 static const struct drm_connector_helper_funcs ast_connector_helper_funcs = {
@@ -1039,15 +1024,11 @@ static const struct drm_connector_funcs ast_connector_funcs = {
 
 static int ast_connector_init(struct drm_device *dev)
 {
-	struct ast_connector *ast_connector;
-	struct drm_connector *connector;
-	struct drm_encoder *encoder;
-
-	ast_connector = kzalloc(sizeof(struct ast_connector), GFP_KERNEL);
-	if (!ast_connector)
-		return -ENOMEM;
+	struct ast_private *ast = to_ast_private(dev);
+	struct ast_connector *ast_connector = &ast->connector;
+	struct drm_connector *connector = &ast_connector->base;
+	struct drm_encoder *encoder = &ast->encoder;
 
-	connector = &ast_connector->base;
 	ast_connector->i2c = ast_i2c_create(dev);
 	if (!ast_connector->i2c)
 		drm_err(dev, "failed to add ddc bus for connector\n");
@@ -1064,7 +1045,6 @@ static int ast_connector_init(struct drm_device *dev)
 
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
 
-	encoder = list_first_entry(&dev->mode_config.encoder_list, struct drm_encoder, head);
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
