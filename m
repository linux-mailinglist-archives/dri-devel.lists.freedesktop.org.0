Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A846048AD3B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF1810EC32;
	Tue, 11 Jan 2022 12:01:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC7E10E81D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:01:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1ECDA21709;
 Tue, 11 Jan 2022 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641902463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnJTv4FZLCK3b6ntnD3qJLUDKLlS5bdFfbJHYajgECE=;
 b=vxBEMtP5IiTYI6Wlb/m6lai21XZLfTcViVtLTR+4/hDJyO73dxUbTufn0SQakqtiw2n1lc
 yrqW1VcfjPJ6WwlN67CNqF/MVkOIb46GxEEwh5xNAh4ykm49KKtBvntFWKvvyHOeWK9RUF
 YR0tP+aiJq9/tMe3JLB0FVP93ALRg2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641902463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YnJTv4FZLCK3b6ntnD3qJLUDKLlS5bdFfbJHYajgECE=;
 b=JaLjLm0puFgB2dkCtCA4mm0kkhUtqhGNMA4fJgM2FZvGQ0nn3dE5oW64Zg5lyTuRAmlTan
 qza9pEc6FW8Fu2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D91B813DD4;
 Tue, 11 Jan 2022 12:01:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GO0CNH5x3WEeFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 12:01:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH 7/8] drm/ast: Move DP501-based connector code into separate
 helpers
Date: Tue, 11 Jan 2022 13:00:57 +0100
Message-Id: <20220111120058.10510-8-tzimmermann@suse.de>
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

Add helpers for DP501-based connectors. DP501 provides output via
DisplayPort. This used to be handled by the VGA connector code.

If a DP501 chip has been detected, ast will now create a DisplayPort
connector instead of a VGA connector.

Remove the DP501 code from ast_vga_connector_helper_get_modes(). Also
remove the call to drm_connector_update_edid_property(), which is
performed by drm_get_edid().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |   4 ++
 drivers/gpu/drm/ast/ast_mode.c | 128 +++++++++++++++++++++++++++------
 2 files changed, 109 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index cda50fb887ed..420d19d8459e 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -165,6 +165,10 @@ struct ast_private {
 			struct drm_encoder encoder;
 			struct ast_vga_connector vga_connector;
 		} vga;
+		struct {
+			struct drm_encoder encoder;
+			struct drm_connector connector;
+		} dp501;
 	} output;
 
 	bool support_wide_screen;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 17e4e038a3ed..a0f4f042141e 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -40,6 +40,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -1256,30 +1257,22 @@ static int ast_crtc_init(struct drm_device *dev)
 static int ast_vga_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct ast_vga_connector *ast_vga_connector = to_ast_vga_connector(connector);
-	struct ast_private *ast = to_ast_private(connector->dev);
-	struct edid *edid = NULL;
-	bool flags = false;
-	int ret;
+	struct edid *edid;
+	int count;
 
-	if (ast->tx_chip_type == AST_TX_DP501) {
-		edid = kmalloc(128, GFP_KERNEL);
-		if (!edid)
-			return -ENOMEM;
+	if (!ast_vga_connector->i2c)
+		goto err_drm_connector_update_edid_property;
 
-		flags = ast_dp501_read_edid(connector->dev, (u8 *)edid);
-		if (!flags) {
-			kfree(edid);
-			edid = NULL;
-		}
-	}
-	if (!flags && ast_vga_connector->i2c)
-		edid = drm_get_edid(connector, &ast_vga_connector->i2c->adapter);
-	if (edid) {
-		drm_connector_update_edid_property(connector, edid);
-		ret = drm_add_edid_modes(connector, edid);
-		kfree(edid);
-		return ret;
-	}
+	edid = drm_get_edid(connector, &ast_vga_connector->i2c->adapter);
+	if (!edid)
+		goto err_drm_connector_update_edid_property;
+
+	count = drm_add_edid_modes(connector, edid);
+	kfree(edid);
+
+	return count;
+
+err_drm_connector_update_edid_property:
 	drm_connector_update_edid_property(connector, NULL);
 	return 0;
 }
@@ -1351,6 +1344,92 @@ static int ast_vga_output_init(struct ast_private *ast)
 	return 0;
 }
 
+/*
+ * DP501 Connector
+ */
+
+static int ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
+{
+	void *edid;
+	bool succ;
+	int count;
+
+	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
+	if (!edid)
+		goto err_drm_connector_update_edid_property;
+
+	succ = ast_dp501_read_edid(connector->dev, edid);
+	if (!succ)
+		goto err_kfree;
+
+	drm_connector_update_edid_property(connector, edid);
+	count = drm_add_edid_modes(connector, edid);
+	kfree(edid);
+
+	return count;
+
+err_kfree:
+	kfree(edid);
+err_drm_connector_update_edid_property:
+	drm_connector_update_edid_property(connector, NULL);
+	return 0;
+}
+
+static const struct drm_connector_helper_funcs ast_dp501_connector_helper_funcs = {
+	.get_modes = ast_dp501_connector_helper_get_modes,
+};
+
+static const struct drm_connector_funcs ast_dp501_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector *connector)
+{
+	int ret;
+
+	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
+				 DRM_MODE_CONNECTOR_DisplayPort);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &ast_dp501_connector_helper_funcs);
+
+	connector->interlace_allowed = 0;
+	connector->doublescan_allowed = 0;
+
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+
+	return 0;
+}
+
+static int ast_dp501_output_init(struct ast_private *ast)
+{
+	struct drm_device *dev = &ast->base;
+	struct drm_crtc *crtc = &ast->crtc;
+	struct drm_encoder *encoder = &ast->output.dp501.encoder;
+	struct drm_connector *connector = &ast->output.dp501.connector;
+	int ret;
+
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = ast_dp501_connector_init(dev, connector);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 /*
  * Mode config
  */
@@ -1411,10 +1490,13 @@ int ast_mode_config_init(struct ast_private *ast)
 	switch (ast->tx_chip_type) {
 	case AST_TX_NONE:
 	case AST_TX_SIL164:
-	case AST_TX_DP501:
 		ret = ast_vga_output_init(ast);
 		break;
+	case AST_TX_DP501:
+		ret = ast_dp501_output_init(ast);
+		break;
 	}
+
 	if (ret)
 		return ret;
 
-- 
2.34.1

