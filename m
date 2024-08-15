Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D479536EC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 17:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4FF10E456;
	Thu, 15 Aug 2024 15:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBDE10E45A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 15:19:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6AD74221DA;
 Thu, 15 Aug 2024 15:19:58 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3288213983;
 Thu, 15 Aug 2024 15:19:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +D0jC54cvmb6DAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Aug 2024 15:19:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 02/11] drm/ast: Add struct ast_connector
Date: Thu, 15 Aug 2024 17:18:44 +0200
Message-ID: <20240815151953.184679-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815151953.184679-1-tzimmermann@suse.de>
References: <20240815151953.184679-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6AD74221DA
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
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

Add struct ast_connector to track a connector's physical status. With
the upcoming BMC support, the physical status can be different from the
reported status.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c     |  7 ++++++-
 drivers/gpu/drm/ast/ast_dp501.c  | 11 +++++++++--
 drivers/gpu/drm/ast/ast_drv.h    | 24 ++++++++++++++++++++----
 drivers/gpu/drm/ast/ast_mode.c   |  8 ++++----
 drivers/gpu/drm/ast/ast_sil164.c | 20 ++++++++++++++++++--
 drivers/gpu/drm/ast/ast_vga.c    | 20 ++++++++++++++++++--
 6 files changed, 75 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 549c823c9529..c7f0f9b5dc3a 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -364,6 +364,7 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
 						 struct drm_modeset_acquire_ctx *ctx,
 						 bool force)
 {
+	struct ast_connector *ast_connector = to_ast_connector(connector);
 	struct drm_device *dev = connector->dev;
 	struct ast_device *ast = to_ast_device(connector->dev);
 	enum drm_connector_status status = connector_status_disconnected;
@@ -392,6 +393,8 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
 
 	mutex_unlock(&ast->modeset_lock);
 
+	ast_connector->physical_status = status;
+
 	return status;
 }
 
@@ -432,7 +435,8 @@ int ast_astdp_output_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder = &ast->output.astdp.encoder;
-	struct drm_connector *connector = &ast->output.astdp.connector;
+	struct ast_connector *ast_connector = &ast->output.astdp.connector;
+	struct drm_connector *connector = &ast_connector->base;
 	int ret;
 
 	ret = drm_encoder_init(dev, encoder, &ast_astdp_encoder_funcs,
@@ -446,6 +450,7 @@ int ast_astdp_output_init(struct ast_device *ast)
 	ret = ast_astdp_connector_init(dev, connector);
 	if (ret)
 		return ret;
+	ast_connector->physical_status = connector->status;
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 478efa226170..3904f98ef846 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -540,11 +540,16 @@ static int ast_dp501_connector_helper_detect_ctx(struct drm_connector *connector
 						 struct drm_modeset_acquire_ctx *ctx,
 						 bool force)
 {
+	struct ast_connector *ast_connector = to_ast_connector(connector);
 	struct ast_device *ast = to_ast_device(connector->dev);
+	enum drm_connector_status status = connector_status_disconnected;
 
 	if (ast_dp501_is_connected(ast))
 		return connector_status_connected;
-	return connector_status_disconnected;
+
+	ast_connector->physical_status = status;
+
+	return status;
 }
 
 static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
@@ -584,7 +589,8 @@ int ast_dp501_output_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder = &ast->output.dp501.encoder;
-	struct drm_connector *connector = &ast->output.dp501.connector;
+	struct ast_connector *ast_connector = &ast->output.dp501.connector;
+	struct drm_connector *connector = &ast_connector->base;
 	int ret;
 
 	ret = drm_encoder_init(dev, encoder, &ast_dp501_encoder_funcs,
@@ -598,6 +604,7 @@ int ast_dp501_output_init(struct ast_device *ast)
 	ret = ast_dp501_connector_init(dev, connector);
 	if (ret)
 		return ret;
+	ast_connector->physical_status = connector->status;
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 3a4f80cb5c0f..b29625d45a11 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -146,6 +146,22 @@ static inline struct ast_plane *to_ast_plane(struct drm_plane *plane)
 	return container_of(plane, struct ast_plane, base);
 }
 
+/*
+ * Connector
+ */
+
+struct ast_connector {
+	struct drm_connector base;
+
+	enum drm_connector_status physical_status;
+};
+
+static inline struct ast_connector *
+to_ast_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct ast_connector, base);
+}
+
 /*
  * BMC
  */
@@ -192,19 +208,19 @@ struct ast_device {
 	struct {
 		struct {
 			struct drm_encoder encoder;
-			struct drm_connector connector;
+			struct ast_connector connector;
 		} vga;
 		struct {
 			struct drm_encoder encoder;
-			struct drm_connector connector;
+			struct ast_connector connector;
 		} sil164;
 		struct {
 			struct drm_encoder encoder;
-			struct drm_connector connector;
+			struct ast_connector connector;
 		} dp501;
 		struct {
 			struct drm_encoder encoder;
-			struct drm_connector connector;
+			struct ast_connector connector;
 		} astdp;
 		struct {
 			struct drm_encoder encoder;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index d823e9d85b04..8ce1637268e1 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1502,25 +1502,25 @@ int ast_mode_config_init(struct ast_device *ast)
 		ret = ast_vga_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.vga.connector;
+		physical_connector = &ast->output.vga.connector.base;
 	}
 	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
 		ret = ast_sil164_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.sil164.connector;
+		physical_connector = &ast->output.sil164.connector.base;
 	}
 	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
 		ret = ast_dp501_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.dp501.connector;
+		physical_connector = &ast->output.dp501.connector.base;
 	}
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
 		ret = ast_astdp_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.astdp.connector;
+		physical_connector = &ast->output.astdp.connector.base;
 	}
 	ret = ast_bmc_output_init(ast, physical_connector);
 	if (ret)
diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
index 6e17d84f994e..05f991aa34ca 100644
--- a/drivers/gpu/drm/ast/ast_sil164.c
+++ b/drivers/gpu/drm/ast/ast_sil164.c
@@ -21,9 +21,23 @@ static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
  * Connector
  */
 
+static int ast_sil164_connector_helper_detect_ctx(struct drm_connector *connector,
+						  struct drm_modeset_acquire_ctx *ctx,
+						  bool force)
+{
+	struct ast_connector *ast_connector = to_ast_connector(connector);
+	enum drm_connector_status status;
+
+	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
+
+	ast_connector->physical_status = status;
+
+	return status;
+}
+
 static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
 	.get_modes = drm_connector_helper_get_modes,
-	.detect_ctx = drm_connector_helper_detect_from_ddc,
+	.detect_ctx = ast_sil164_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs ast_sil164_connector_funcs = {
@@ -67,7 +81,8 @@ int ast_sil164_output_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder = &ast->output.sil164.encoder;
-	struct drm_connector *connector = &ast->output.sil164.connector;
+	struct ast_connector *ast_connector = &ast->output.sil164.connector;
+	struct drm_connector *connector = &ast_connector->base;
 	int ret;
 
 	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
@@ -79,6 +94,7 @@ int ast_sil164_output_init(struct ast_device *ast)
 	ret = ast_sil164_connector_init(dev, connector);
 	if (ret)
 		return ret;
+	ast_connector->physical_status = connector->status;
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
index 2ea0763844f3..fdbd0daca7dc 100644
--- a/drivers/gpu/drm/ast/ast_vga.c
+++ b/drivers/gpu/drm/ast/ast_vga.c
@@ -21,9 +21,23 @@ static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
  * Connector
  */
 
+static int ast_vga_connector_helper_detect_ctx(struct drm_connector *connector,
+					       struct drm_modeset_acquire_ctx *ctx,
+					       bool force)
+{
+	struct ast_connector *ast_connector = to_ast_connector(connector);
+	enum drm_connector_status status;
+
+	status = drm_connector_helper_detect_from_ddc(connector, ctx, force);
+
+	ast_connector->physical_status = status;
+
+	return status;
+}
+
 static const struct drm_connector_helper_funcs ast_vga_connector_helper_funcs = {
 	.get_modes = drm_connector_helper_get_modes,
-	.detect_ctx = drm_connector_helper_detect_from_ddc,
+	.detect_ctx = ast_vga_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs ast_vga_connector_funcs = {
@@ -67,7 +81,8 @@ int ast_vga_output_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder = &ast->output.vga.encoder;
-	struct drm_connector *connector = &ast->output.vga.connector;
+	struct ast_connector *ast_connector = &ast->output.vga.connector;
+	struct drm_connector *connector = &ast_connector->base;
 	int ret;
 
 	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
@@ -79,6 +94,7 @@ int ast_vga_output_init(struct ast_device *ast)
 	ret = ast_vga_connector_init(dev, connector);
 	if (ret)
 		return ret;
+	ast_connector->physical_status = connector->status;
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
-- 
2.46.0

