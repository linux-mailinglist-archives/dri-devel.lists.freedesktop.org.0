Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7137999D49
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91FB10EA4A;
	Fri, 11 Oct 2024 06:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C0810EA4C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:57:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD5D921A74;
 Fri, 11 Oct 2024 06:57:10 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A9CF1370C;
 Fri, 11 Oct 2024 06:57:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mACvHEbMCGcRfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Oct 2024 06:57:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, airlied@redhat.com,
 jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/7] drm/ast: Track physical connector status in struct
 drm_connector
Date: Fri, 11 Oct 2024 08:43:11 +0200
Message-ID: <20241011065705.6728-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241011065705.6728-1-tzimmermann@suse.de>
References: <20241011065705.6728-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: BD5D921A74
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set bmc_attached for all connectors and let DRM's probe helpers
track the physical and logical connector state. Remove such logic
and related data structures from ast.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c     | 21 ++++++---------------
 drivers/gpu/drm/ast/ast_dp501.c  | 17 ++++-------------
 drivers/gpu/drm/ast/ast_drv.h    | 24 ++++--------------------
 drivers/gpu/drm/ast/ast_sil164.c | 17 ++++-------------
 drivers/gpu/drm/ast/ast_vga.c    | 28 ++++------------------------
 5 files changed, 22 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 0e282b7b167c..b62c39479367 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -328,9 +328,9 @@ static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 						   struct drm_atomic_state *state)
 {
 	struct ast_device *ast = to_ast_device(encoder->dev);
-	struct ast_connector *ast_connector = &ast->output.astdp.connector;
+	struct drm_connector *connector = &ast->output.astdp.connector;
 
-	if (ast_connector->physical_status == connector_status_connected) {
+	if (connector->physical_status == connector_status_connected) {
 		ast_dp_set_phy_sleep(ast, false);
 		ast_dp_link_training(ast);
 
@@ -360,10 +360,9 @@ static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
 
 static int ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ast_connector *ast_connector = to_ast_connector(connector);
 	int count;
 
-	if (ast_connector->physical_status == connector_status_connected) {
+	if (connector->physical_status == connector_status_connected) {
 		struct ast_device *ast = to_ast_device(connector->dev);
 		const struct drm_edid *drm_edid;
 
@@ -391,7 +390,6 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
 						 struct drm_modeset_acquire_ctx *ctx,
 						 bool force)
 {
-	struct ast_connector *ast_connector = to_ast_connector(connector);
 	struct ast_device *ast = to_ast_device(connector->dev);
 	enum drm_connector_status status = connector_status_disconnected;
 	bool phy_sleep;
@@ -410,11 +408,7 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
 
 	mutex_unlock(&ast->modeset_lock);
 
-	if (status != ast_connector->physical_status)
-		++connector->epoch_counter;
-	ast_connector->physical_status = status;
-
-	return connector_status_connected;
+	return status;
 }
 
 static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {
@@ -439,7 +433,6 @@ int ast_astdp_output_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder;
-	struct ast_connector *ast_connector;
 	struct drm_connector *connector;
 	int ret;
 
@@ -456,8 +449,7 @@ int ast_astdp_output_init(struct ast_device *ast)
 
 	/* connector */
 
-	ast_connector = &ast->output.astdp.connector;
-	connector = &ast_connector->base;
+	connector = &ast->output.astdp.connector;
 	ret = drm_connector_init(dev, connector, &ast_astdp_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret)
@@ -466,10 +458,9 @@ int ast_astdp_output_init(struct ast_device *ast)
 
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
+	connector->bmc_attached = true;
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	ast_connector->physical_status = connector->status;
-
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 9e19d8c17730..8ffe30c74d3d 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -503,10 +503,9 @@ static const struct drm_encoder_helper_funcs ast_dp501_encoder_helper_funcs = {
 
 static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ast_connector *ast_connector = to_ast_connector(connector);
 	int count;
 
-	if (ast_connector->physical_status == connector_status_connected) {
+	if (connector->physical_status == connector_status_connected) {
 		struct ast_device *ast = to_ast_device(connector->dev);
 		const struct drm_edid *drm_edid;
 
@@ -534,18 +533,13 @@ static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector
 						 struct drm_modeset_acquire_ctx *ctx,
 						 bool force)
 {
-	struct ast_connector *ast_connector = to_ast_connector(connector);
 	struct ast_device *ast = to_ast_device(connector->dev);
 	enum drm_connector_status status = connector_status_disconnected;
 
 	if (ast_dp501_is_connected(ast))
 		status = connector_status_connected;
 
-	if (status != ast_connector->physical_status)
-		++connector->epoch_counter;
-	ast_connector->physical_status = status;
-
-	return connector_status_connected;
+	return status;
 }
 
 static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
@@ -570,7 +564,6 @@ int ast_dp501_output_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder;
-	struct ast_connector *ast_connector;
 	struct drm_connector *connector;
 	int ret;
 
@@ -587,8 +580,7 @@ int ast_dp501_output_init(struct ast_device *ast)
 
 	/* connector */
 
-	ast_connector = &ast->output.dp501.connector;
-	connector = &ast_connector->base;
+	connector = &ast->output.dp501.connector;
 	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
 				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret)
@@ -597,10 +589,9 @@ int ast_dp501_output_init(struct ast_device *ast)
 
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
+	connector->bmc_attached = true;
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	ast_connector->physical_status = connector->status;
-
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 21ce3769bf0d..a6887e90dc17 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -141,22 +141,6 @@ static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
 	return container_of(plane, struct ast_plane, base);
 }
 
-/*
- * Connector
- */
-
-struct ast_connector {
-	struct drm_connector base;
-
-	enum drm_connector_status physical_status;
-};
-
-static inline struct ast_connector *
-to_ast_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct ast_connector, base);
-}
-
 /*
  * Device
  */
@@ -190,19 +174,19 @@ struct ast_device {
 	union {
 		struct {
 			struct drm_encoder encoder;
-			struct ast_connector connector;
+			struct drm_connector connector;
 		} vga;
 		struct {
 			struct drm_encoder encoder;
-			struct ast_connector connector;
+			struct drm_connector connector;
 		} sil164;
 		struct {
 			struct drm_encoder encoder;
-			struct ast_connector connector;
+			struct drm_connector connector;
 		} dp501;
 		struct {
 			struct drm_encoder encoder;
-			struct ast_connector connector;
+			struct drm_connector connector;
 		} astdp;
 	} output;
 
diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
index be01254dd48a..aba5b8aa4307 100644
--- a/drivers/gpu/drm/ast/ast_sil164.c
+++ b/drivers/gpu/drm/ast/ast_sil164.c
@@ -23,10 +23,9 @@ static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
 
 static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ast_connector *ast_connector = to_ast_connector(connector);
 	int count;
 
-	if (ast_connector->physical_status == connector_status_connected) {
+	if (connector->physical_status == connector_status_connected) {
 		count = drm_connector_helper_get_modes(connector);
 	} else {
 		drm_edid_connector_update(connector, NULL);
@@ -48,16 +47,11 @@ static int ast_sil164_connector_helper_detect_ctx(struct drm_connector *connecto
 						  struct drm_modeset_acquire_ctx *ctx,
 						  bool force)
 {
-	struct ast_connector *ast_connector = to_ast_connector(connector);
 	enum drm_connector_status status;
 
 	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
 
-	if (status != ast_connector->physical_status)
-		++connector->epoch_counter;
-	ast_connector->physical_status = status;
-
-	return connector_status_connected;
+	return status;
 }
 
 static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
@@ -83,7 +77,6 @@ int ast_sil164_output_init(struct ast_device *ast)
 	struct drm_crtc *crtc = &ast->crtc;
 	struct i2c_adapter *ddc;
 	struct drm_encoder *encoder;
-	struct ast_connector *ast_connector;
 	struct drm_connector *connector;
 	int ret;
 
@@ -104,8 +97,7 @@ int ast_sil164_output_init(struct ast_device *ast)
 
 	/* connector */
 
-	ast_connector = &ast->output.sil164.connector;
-	connector = &ast_connector->base;
+	connector = &ast->output.sil164.connector;
 	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
 					  DRM_MODE_CONNECTOR_DVII, ddc);
 	if (ret)
@@ -114,10 +106,9 @@ int ast_sil164_output_init(struct ast_device *ast)
 
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
+	connector->bmc_attached = true;
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	ast_connector->physical_status = connector->status;
-
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
index abe0fff8485c..d78f00c47cc5 100644
--- a/drivers/gpu/drm/ast/ast_vga.c
+++ b/drivers/gpu/drm/ast/ast_vga.c
@@ -23,10 +23,9 @@ static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
 
 static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
-	struct ast_connector *ast_connector = to_ast_connector(connector);
 	int count;
 
-	if (ast_connector->physical_status == connector_status_connected) {
+	if (connector->physical_status == connector_status_connected) {
 		count = drm_connector_helper_get_modes(connector);
 	} else {
 		drm_edid_connector_update(connector, NULL);
@@ -44,25 +43,9 @@ static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 	return count;
 }
 
-static int ast_vga_connector_helper_detect_ctx(struct drm_connector *connector,
-					       struct drm_modeset_acquire_ctx *ctx,
-					       bool force)
-{
-	struct ast_connector *ast_connector = to_ast_connector(connector);
-	enum drm_connector_status status;
-
-	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
-
-	if (status != ast_connector->physical_status)
-		++connector->epoch_counter;
-	ast_connector->physical_status = status;
-
-	return connector_status_connected;
-}
-
 static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
 	.get_modes = ast_vga_connector_helper_get_modes,
-	.detect_ctx = ast_vga_connector_helper_detect_ctx,
+	.detect_ctx = drm_connector_helper_detect_from_ddc,
 };
 
 static const struct drm_connector_funcs ast_vga_connector_funcs = {
@@ -83,7 +66,6 @@ int ast_vga_output_init(struct ast_device *ast)
 	struct drm_crtc *crtc = &ast->crtc;
 	struct i2c_adapter *ddc;
 	struct drm_encoder *encoder;
-	struct ast_connector *ast_connector;
 	struct drm_connector *connector;
 	int ret;
 
@@ -104,8 +86,7 @@ int ast_vga_output_init(struct ast_device *ast)
 
 	/* connector */
 
-	ast_connector = &ast->output.vga.connector;
-	connector = &ast_connector->base;
+	connector = &ast->output.vga.connector;
 	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
 					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret)
@@ -114,10 +95,9 @@ int ast_vga_output_init(struct ast_device *ast)
 
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
+	connector->bmc_attached = true;
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	ast_connector->physical_status = connector->status;
-
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ret;
-- 
2.46.0

