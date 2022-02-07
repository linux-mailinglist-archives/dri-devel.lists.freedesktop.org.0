Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3343E4AC0D2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 15:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FA610F3CD;
	Mon,  7 Feb 2022 14:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DC910E338
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 14:15:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C70641F388;
 Mon,  7 Feb 2022 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644243347; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Avvw2dT4GhXv/DvB7KHUCLm9UkK6qfC/I+IdArM72Wo=;
 b=1rPdjz3tVa9wuc3xyUphLBUgeelu9F1NA1rGcQd+vYddC87jPWD0pGeEJzQafE0nNT/mOq
 fGCaBzUvDX7dwtTczrJ4FboULrQtmV3PlHbggiBZMLAQMizcgVtoU/X8wAfwO/S4Jlpn9m
 ghu0K+qx/Mz7MBbGHkdOLxn7UkbjVtM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644243347;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Avvw2dT4GhXv/DvB7KHUCLm9UkK6qfC/I+IdArM72Wo=;
 b=HeG5+PErQL/flub0Wv9DVUjDomG5LnoXwgdnDnx72SKlbxYAyzLubynCTufSY7xfw59hhT
 D1DnMXPtFak6SfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A3B413BF5;
 Mon,  7 Feb 2022 14:15:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MH/fIJMpAWKePQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Feb 2022 14:15:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, kuohsiang_chou@aspeedtech.com,
 tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 arc_sung@aspeedtech.com
Subject: [PATCH v2 6/9] drm/ast: Initialize encoder and connector for VGA in
 helper function
Date: Mon,  7 Feb 2022 15:15:41 +0100
Message-Id: <20220207141544.30015-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207141544.30015-1-tzimmermann@suse.de>
References: <20220207141544.30015-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move encoder and connector initialization into a single helper and
put all related mode-setting structures into a single place. Done in
preparation of moving transmitter code into separate helpers. No
functional changes.

v2:
	* move encoder CRTC bitmask fix into separate patch (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  8 +++--
 drivers/gpu/drm/ast/ast_mode.c | 62 ++++++++++++++++++++--------------
 2 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index e1cb31acdaac..cda50fb887ed 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -160,8 +160,12 @@ struct ast_private {
 	struct drm_plane primary_plane;
 	struct ast_cursor_plane cursor_plane;
 	struct drm_crtc crtc;
-	struct drm_encoder encoder;
-	struct ast_vga_connector connector;
+	union {
+		struct {
+			struct drm_encoder encoder;
+			struct ast_vga_connector vga_connector;
+		} vga;
+	} output;
 
 	bool support_wide_screen;
 	enum {
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 384879b27ccc..bd01aea90784 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1252,25 +1252,6 @@ static int ast_crtc_init(struct drm_device *dev)
 	return 0;
 }
 
-/*
- * Encoder
- */
-
-static int ast_encoder_init(struct drm_device *dev)
-{
-	struct ast_private *ast = to_ast_private(dev);
-	struct drm_encoder *encoder = &ast->encoder;
-	int ret;
-
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
-	if (ret)
-		return ret;
-
-	encoder->possible_crtcs = 1;
-
-	return 0;
-}
-
 /*
  * VGA Connector
  */
@@ -1318,12 +1299,10 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_vga_connector_init(struct drm_device *dev)
+static int ast_vga_connector_init(struct drm_device *dev,
+				  struct ast_vga_connector *ast_vga_connector)
 {
-	struct ast_private *ast = to_ast_private(dev);
-	struct ast_vga_connector *ast_vga_connector = &ast->connector;
 	struct drm_connector *connector = &ast_vga_connector->base;
-	struct drm_encoder *encoder = &ast->encoder;
 	int ret;
 
 	ast_vga_connector->i2c = ast_i2c_create(dev);
@@ -1347,7 +1326,30 @@ static int ast_vga_connector_init(struct drm_device *dev)
 
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
 
-	drm_connector_attach_encoder(connector, encoder);
+	return 0;
+}
+
+static int ast_vga_output_init(struct ast_private *ast)
+{
+	struct drm_device *dev = &ast->base;
+	struct drm_crtc *crtc = &ast->crtc;
+	struct drm_encoder *encoder = &ast->output.vga.encoder;
+	struct ast_vga_connector *ast_vga_connector = &ast->output.vga.vga_connector;
+	struct drm_connector *connector = &ast_vga_connector->base;
+	int ret;
+
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = 1;
+
+	ret = ast_vga_connector_init(dev, ast_vga_connector);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -1408,8 +1410,16 @@ int ast_mode_config_init(struct ast_private *ast)
 		return ret;
 
 	ast_crtc_init(dev);
-	ast_encoder_init(dev);
-	ast_vga_connector_init(dev);
+
+	switch (ast->tx_chip_type) {
+	case AST_TX_NONE:
+	case AST_TX_SIL164:
+	case AST_TX_DP501:
+		ret = ast_vga_output_init(ast);
+		break;
+	}
+	if (ret)
+		return ret;
 
 	drm_mode_config_reset(dev);
 
-- 
2.34.1

