Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 153DD48AD36
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7D110E5E3;
	Tue, 11 Jan 2022 12:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F6D10E75F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:01:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF5891F3BE;
 Tue, 11 Jan 2022 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641902462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FK3n3pWbOfFEeDvDEqSij0inR26GP3d2EQ7esARNsMY=;
 b=VSe5+MBYe2F+KkjJknjSHeixfWFWycaCj5hr+rqGlOqN2Q/hoCH6YB2lIPnLNj+PoqsQMn
 8z4ubeKEDCtWm0GqtYnuXhh+YAegs5Rk8hae6VfmzWI6KMXiOhn6QZY6Z53oV3Ukpw2aNg
 NaCNHLlIhktETsFJCgaYewx1G2QH4rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641902462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FK3n3pWbOfFEeDvDEqSij0inR26GP3d2EQ7esARNsMY=;
 b=hOZjqi7YmPxW1bo9wfdtEYPYvbCpwe/Ibq+WDi8qt+CLOSaCgfE91/IVj0a9OJKlvDeqMd
 rwr82g3RwW0AmLBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E01114001;
 Tue, 11 Jan 2022 12:01:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8JJ6JX5x3WEeFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 12:01:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH 6/8] drm/ast: Initialize encoder and connector for VGA in
 helper function
Date: Tue, 11 Jan 2022 13:00:56 +0100
Message-Id: <20220111120058.10510-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111120058.10510-1-tzimmermann@suse.de>
References: <20220111120058.10510-1-tzimmermann@suse.de>
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
Cc: jenmin_yuan@aspeedtech.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, tommy_huang@aspeedtech.com,
 arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move encoder and connector initialization into a single helper and
put all related mode-setting structures into a single place. Done in
preparation of moving transmitter code into separate helpers. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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
index f7f4034cc91e..17e4e038a3ed 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1249,25 +1249,6 @@ static int ast_crtc_init(struct drm_device *dev)
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
@@ -1315,12 +1296,10 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
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
@@ -1344,7 +1323,30 @@ static int ast_vga_connector_init(struct drm_device *dev)
 
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
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
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
@@ -1405,8 +1407,16 @@ int ast_mode_config_init(struct ast_private *ast)
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

