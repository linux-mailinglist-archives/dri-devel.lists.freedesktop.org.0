Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1882C7EE0FD
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 14:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9FA10E5D1;
	Thu, 16 Nov 2023 13:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D7610E5D2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 13:02:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 58D6020503;
 Thu, 16 Nov 2023 13:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700139739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PAt9mP0SWf+4DAncgko3z+8k0IejKDYG4Kv094SL4K0=;
 b=v+PKkhj5knrhQt/BRxdbnIeOmCI51TrTFjvd4paDZzeSBtZz8KKMc6E/WVGSSZJQVaEEAe
 +Dnep8CgZeidWz5cfd9jXf27MOstuHCYxyOOWuERj2U3dEliN2PZmq+OAZNIKQzNV/AVTV
 G6UrY9Jy4bF14SaBugmzLElm8eVUnSU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700139739;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=PAt9mP0SWf+4DAncgko3z+8k0IejKDYG4Kv094SL4K0=;
 b=r78LSopLf1PKkS1T4oJ02spb1VVn/bIaAw58ArymnAHppxS8Cb6ziA8M48AlYAH+q+D7y9
 qO86qtmehy/h7hAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F9381377E;
 Thu, 16 Nov 2023 13:02:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jl3KCtsSVmXJAQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 13:02:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch
Subject: [PATCH] drm/ast: Disconnect BMC if physical connector is connected
Date: Thu, 16 Nov 2023 14:02:12 +0100
Message-ID: <20231116130217.22931-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
Cc: stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many user-space compositors fail with mode setting if a CRTC has
more than one connected connector. This is the case with the BMC
on Aspeed systems. Work around this problem by setting the BMC's
connector status to disconnected when the physical connector has
a display attached. This way compositors will only see one connected
connector at a time; either the physical one or the BMC.

Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
Fixes: e329cb53b45d ("drm/ast: Add BMC virtual connector")
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: <stable@vger.kernel.org> # v6.6+
---
 drivers/gpu/drm/ast/ast_drv.h  | 13 ++++++-
 drivers/gpu/drm/ast/ast_mode.c | 62 ++++++++++++++++++++++++++++++----
 2 files changed, 67 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 2aee32344f4a2..772f3b049c169 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -174,6 +174,17 @@ to_ast_sil164_connector(struct drm_connector *connector)
 	return container_of(connector, struct ast_sil164_connector, base);
 }
 
+struct ast_bmc_connector {
+	struct drm_connector base;
+	struct drm_connector *physical_connector;
+};
+
+static inline struct ast_bmc_connector *
+to_ast_bmc_connector(struct drm_connector *connector)
+{
+	return container_of(connector, struct ast_bmc_connector, base);
+}
+
 /*
  * Device
  */
@@ -218,7 +229,7 @@ struct ast_device {
 		} astdp;
 		struct {
 			struct drm_encoder encoder;
-			struct drm_connector connector;
+			struct ast_bmc_connector bmc_connector;
 		} bmc;
 	} output;
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cb96149842851..c20534d0ef7c8 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1767,6 +1767,30 @@ static const struct drm_encoder_funcs ast_bmc_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
+static int ast_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
+					       struct drm_modeset_acquire_ctx *ctx,
+					       bool force)
+{
+	struct ast_bmc_connector *bmc_connector = to_ast_bmc_connector(connector);
+	struct drm_connector *physical_connector = bmc_connector->physical_connector;
+
+	/*
+	 * Most user-space compositors cannot handle more than one connected
+	 * connector per CRTC. Hence, we only mark the BMC as connected if the
+	 * physical connector is disconnected. If the physical connector's status
+	 * is connected or unknown, the BMC remains disconnected. This has no
+	 * effect on the output of the BMC.
+	 *
+	 * FIXME: Remove this logic once user-space compositors can handle more
+	 *        than one connector per CRTC. The BMC should always be connected.
+	 */
+
+	if (physical_connector && physical_connector->status == connector_status_disconnected)
+		return connector_status_connected;
+
+	return connector_status_disconnected;
+}
+
 static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
 {
 	return drm_add_modes_noedid(connector, 4096, 4096);
@@ -1774,6 +1798,7 @@ static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
 
 static const struct drm_connector_helper_funcs ast_bmc_connector_helper_funcs = {
 	.get_modes = ast_bmc_connector_helper_get_modes,
+	.detect_ctx = ast_bmc_connector_helper_detect_ctx,
 };
 
 static const struct drm_connector_funcs ast_bmc_connector_funcs = {
@@ -1784,12 +1809,33 @@ static const struct drm_connector_funcs ast_bmc_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_bmc_output_init(struct ast_device *ast)
+static int ast_bmc_connector_init(struct drm_device *dev,
+				  struct ast_bmc_connector *bmc_connector,
+				  struct drm_connector *physical_connector)
+{
+	struct drm_connector *connector = &bmc_connector->base;
+	int ret;
+
+	ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
+				 DRM_MODE_CONNECTOR_VIRTUAL);
+	if (ret)
+		return ret;
+
+	drm_connector_helper_add(connector, &ast_bmc_connector_helper_funcs);
+
+	bmc_connector->physical_connector = physical_connector;
+
+	return 0;
+}
+
+static int ast_bmc_output_init(struct ast_device *ast,
+			       struct drm_connector *physical_connector)
 {
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder = &ast->output.bmc.encoder;
-	struct drm_connector *connector = &ast->output.bmc.connector;
+	struct ast_bmc_connector *bmc_connector = &ast->output.bmc.bmc_connector;
+	struct drm_connector *connector = &bmc_connector->base;
 	int ret;
 
 	ret = drm_encoder_init(dev, encoder,
@@ -1799,13 +1845,10 @@ static int ast_bmc_output_init(struct ast_device *ast)
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
+	ret = ast_bmc_connector_init(dev, bmc_connector, physical_connector);
 	if (ret)
 		return ret;
 
-	drm_connector_helper_add(connector, &ast_bmc_connector_helper_funcs);
-
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret)
 		return ret;
@@ -1864,6 +1907,7 @@ static const struct drm_mode_config_funcs ast_mode_config_funcs = {
 int ast_mode_config_init(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
+	struct drm_connector *physical_connector = NULL;
 	int ret;
 
 	ret = drmm_mode_config_init(dev);
@@ -1904,23 +1948,27 @@ int ast_mode_config_init(struct ast_device *ast)
 		ret = ast_vga_output_init(ast);
 		if (ret)
 			return ret;
+		physical_connector = &ast->output.vga.vga_connector.base;
 	}
 	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
 		ret = ast_sil164_output_init(ast);
 		if (ret)
 			return ret;
+		physical_connector = &ast->output.sil164.sil164_connector.base;
 	}
 	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
 		ret = ast_dp501_output_init(ast);
 		if (ret)
 			return ret;
+		physical_connector = &ast->output.dp501.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
 		ret = ast_astdp_output_init(ast);
 		if (ret)
 			return ret;
+		physical_connector = &ast->output.astdp.connector;
 	}
-	ret = ast_bmc_output_init(ast);
+	ret = ast_bmc_output_init(ast, physical_connector);
 	if (ret)
 		return ret;
 
-- 
2.42.0

