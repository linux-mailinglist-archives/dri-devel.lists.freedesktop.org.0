Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642EA4AC0D4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 15:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159A510F3FF;
	Mon,  7 Feb 2022 14:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F172210F15F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 14:15:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A087E21102;
 Mon,  7 Feb 2022 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644243348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Or1ao2gZCmJBplnnUNkWqNhSSXgyzrMDyk4LMoxhGU8=;
 b=kGFo1VCRl/VLTNVQPbM6usan+k/ZDHdhgPs+Stao/kfj6nBmcj6KZBm93kFgneA9hrF1oO
 ZiPgieyBMpZZuJEPJ6WCIr9r+XZvw+3G13D4JCszfc3sUr1O66s6dWkW9CI58keuvPgrv+
 z50U4BY8OwaQMn8wCQWnIaEPCEe6t8c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644243348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Or1ao2gZCmJBplnnUNkWqNhSSXgyzrMDyk4LMoxhGU8=;
 b=bamhLfwZgEI9zg9a6czodpR3nuqOpd4xXO7k6l2uCO9T2m33GoK87I1ojne3M4RdNFPi+1
 3TSIid4BLSrj/SAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60E3B13C28;
 Mon,  7 Feb 2022 14:15:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MB+uFpQpAWKePQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Feb 2022 14:15:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, kuohsiang_chou@aspeedtech.com,
 tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 arc_sung@aspeedtech.com
Subject: [PATCH v2 9/9] drm/ast: Move SIL164-based connector code into
 separate helpers
Date: Mon,  7 Feb 2022 15:15:44 +0100
Message-Id: <20220207141544.30015-10-tzimmermann@suse.de>
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

Add helpers for initializing SIL164-based connectors. These used to be
handled by the VGA connector code. But SIL164 provides output via DVI-I,
so set the encoder and connector types accordingly.

If a SIL164 chip has been detected, ast will now create a DVI-I
connector instead of a VGA connector.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h  | 15 ++++++
 drivers/gpu/drm/ast/ast_mode.c | 99 +++++++++++++++++++++++++++++++++-
 2 files changed, 112 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 420d19d8459e..c3a582372649 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -140,6 +140,17 @@ to_ast_vga_connector(struct drm_connector *connector)
 	return container_of(connector, struct ast_vga_connector, base);
 }
 
+struct ast_sil164_connector {
+	struct drm_connector base;
+	struct ast_i2c_chan *i2c;
+};
+
+static inline struct ast_sil164_connector *
+to_ast_sil164_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct ast_sil164_connector, base);
+}
+
 /*
  * Device
  */
@@ -165,6 +176,10 @@ struct ast_private {
 			struct drm_encoder encoder;
 			struct ast_vga_connector vga_connector;
 		} vga;
+		struct {
+			struct drm_encoder encoder;
+			struct ast_sil164_connector sil164_connector;
+		} sil164;
 		struct {
 			struct drm_encoder encoder;
 			struct drm_connector connector;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 12dbf5b229e6..6f4aa8e8b0ab 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1347,6 +1347,100 @@ static int ast_vga_output_init(struct ast_private *ast)
 	return 0;
 }
 
+/*
+ * SIL164 Connector
+ */
+
+static int ast_sil164_connector_helper_get_modes(struct drm_connector *connector)
+{
+	struct ast_sil164_connector *ast_sil164_connector = to_ast_sil164_connector(connector);
+	struct edid *edid;
+	int count;
+
+	if (!ast_sil164_connector->i2c)
+		goto err_drm_connector_update_edid_property;
+
+	edid = drm_get_edid(connector, &ast_sil164_connector->i2c->adapter);
+	if (!edid)
+		goto err_drm_connector_update_edid_property;
+
+	count = drm_add_edid_modes(connector, edid);
+	kfree(edid);
+
+	return count;
+
+err_drm_connector_update_edid_property:
+	drm_connector_update_edid_property(connector, NULL);
+	return 0;
+}
+
+static const struct drm_connector_helper_funcs ast_sil164_connector_helper_funcs = {
+	.get_modes = ast_sil164_connector_helper_get_modes,
+};
+
+static const struct drm_connector_funcs ast_sil164_connector_funcs = {
+	.reset = drm_atomic_helper_connector_reset,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static int ast_sil164_connector_init(struct drm_device *dev,
+				     struct ast_sil164_connector *ast_sil164_connector)
+{
+	struct drm_connector *connector = &ast_sil164_connector->base;
+	int ret;
+
+	ast_sil164_connector->i2c = ast_i2c_create(dev);
+	if (!ast_sil164_connector->i2c)
+		drm_err(dev, "failed to add ddc bus for connector\n");
+
+	if (ast_sil164_connector->i2c)
+		ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
+						  DRM_MODE_CONNECTOR_DVII,
+						  &ast_sil164_connector->i2c->adapter);
+	else
+		ret = drm_connector_init(dev, connector, &ast_sil164_connector_funcs,
+					 DRM_MODE_CONNECTOR_DVII);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &ast_sil164_connector_helper_funcs);
+
+	connector->interlace_allowed = 0;
+	connector->doublescan_allowed = 0;
+
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+
+	return 0;
+}
+
+static int ast_sil164_output_init(struct ast_private *ast)
+{
+	struct drm_device *dev = &ast->base;
+	struct drm_crtc *crtc = &ast->crtc;
+	struct drm_encoder *encoder = &ast->output.sil164.encoder;
+	struct ast_sil164_connector *ast_sil164_connector = &ast->output.sil164.sil164_connector;
+	struct drm_connector *connector = &ast_sil164_connector->base;
+	int ret;
+
+	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	ret = ast_sil164_connector_init(dev, ast_sil164_connector);
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
  * DP501 Connector
  */
@@ -1492,14 +1586,15 @@ int ast_mode_config_init(struct ast_private *ast)
 
 	switch (ast->tx_chip_type) {
 	case AST_TX_NONE:
-	case AST_TX_SIL164:
 		ret = ast_vga_output_init(ast);
 		break;
+	case AST_TX_SIL164:
+		ret = ast_sil164_output_init(ast);
+		break;
 	case AST_TX_DP501:
 		ret = ast_dp501_output_init(ast);
 		break;
 	}
-
 	if (ret)
 		return ret;
 
-- 
2.34.1

