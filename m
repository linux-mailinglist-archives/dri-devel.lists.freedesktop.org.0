Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40E997512F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BCC10E9CC;
	Wed, 11 Sep 2024 11:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74DF10E9C5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:53:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BADF71F8B3;
 Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90FC513A7C;
 Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aIsNItCE4WbGIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Sep 2024 11:53:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 08/10] drm/ast: vga: Inline ast_vga_connector_init()
Date: Wed, 11 Sep 2024 13:51:26 +0200
Message-ID: <20240911115347.899148-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911115347.899148-1-tzimmermann@suse.de>
References: <20240911115347.899148-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: BADF71F8B3
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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

Inline ast_vga_connector_init() into its only caller. The helper
currently only does half of the connector-init work and is trivial
enough to be inlined. While at it, remove the error message from the
call to ast_ddc_create(). The function already warns on errors.

Also set the local variables for encoder and connector as late as
possible, so that the compiler warns if we use them before having
initialized the instance.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_vga.c | 55 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_vga.c b/drivers/gpu/drm/ast/ast_vga.c
index 3e815da43fbd..5c79b773af57 100644
--- a/drivers/gpu/drm/ast/ast_vga.c
+++ b/drivers/gpu/drm/ast/ast_vga.c
@@ -71,52 +71,49 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
+/*
+ * Output
+ */
+
+int ast_vga_output_init(struct ast_device *ast)
 {
-	struct ast_device *ast = to_ast_device(dev);
+	struct drm_device *dev = &ast->base;
+	struct drm_crtc *crtc = &ast->crtc;
 	struct i2c_adapter *ddc;
+	struct drm_encoder *encoder;
+	struct ast_connector *ast_connector;
+	struct drm_connector *connector;
 	int ret;
 
+	/* DDC */
+
 	ddc = ast_ddc_create(ast);
-	if (IS_ERR(ddc)) {
-		ret = PTR_ERR(ddc);
-		drm_err(dev, "failed to add DDC bus for connector; ret=%d\n", ret);
+	if (IS_ERR(ddc))
+		return PTR_ERR(ddc);
+
+	/* encoder */
+
+	encoder = &ast->output.vga.encoder;
+	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret)
 		return ret;
-	}
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	/* connector */
 
+	ast_connector = &ast->output.vga.connector;
+	connector = &ast_connector->base;
 	ret = drm_connector_init_with_ddc(dev, connector, &ast_vga_connector_funcs,
 					  DRM_MODE_CONNECTOR_VGA, ddc);
 	if (ret)
 		return ret;
-
 	drm_connector_helper_add(connector, &ast_vga_connector_helper_funcs);
 
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
-
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	return 0;
-}
-
-int ast_vga_output_init(struct ast_device *ast)
-{
-	struct drm_device *dev = &ast->base;
-	struct drm_crtc *crtc = &ast->crtc;
-	struct drm_encoder *encoder = &ast->output.vga.encoder;
-	struct ast_connector *ast_connector = &ast->output.vga.connector;
-	struct drm_connector *connector = &ast_connector->base;
-	int ret;
-
-	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
-			       DRM_MODE_ENCODER_DAC, NULL);
-	if (ret)
-		return ret;
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-
-	ret = ast_vga_connector_init(dev, connector);
-	if (ret)
-		return ret;
 	ast_connector->physical_status = connector->status;
 
 	ret = drm_connector_attach_encoder(connector, encoder);
-- 
2.46.0

