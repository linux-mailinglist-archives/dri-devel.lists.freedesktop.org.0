Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE1948FB3
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BC310E358;
	Tue,  6 Aug 2024 12:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFE210E26E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:56:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 033E21FDD5;
 Tue,  6 Aug 2024 12:56:08 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C02BE13770;
 Tue,  6 Aug 2024 12:56:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uBm6LWcdsmb9PQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Aug 2024 12:56:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 9/9] drm/ast: Remove BMC output
Date: Tue,  6 Aug 2024 14:52:04 +0200
Message-ID: <20240806125601.78650-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240806125601.78650-1-tzimmermann@suse.de>
References: <20240806125601.78650-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 033E21FDD5
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Ast's BMC connector tracks the status of an underlying physical
connector and updates the BMC status accordingly. This functionality
works around GNOME's settings app, which cannot handle multiple
outputs on the same CRTC.

The workaround is now obsolete as all code for physical outputs
handle BMC support internally. Hence, remove the driver's code and
the BMC output entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |   4 --
 drivers/gpu/drm/ast/ast_mode.c | 107 ---------------------------------
 2 files changed, 111 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 3a4f80cb5c0f..a4cde495fde4 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -206,10 +206,6 @@ struct ast_device {
 			struct drm_encoder encoder;
 			struct drm_connector connector;
 		} astdp;
-		struct {
-			struct drm_encoder encoder;
-			struct ast_bmc_connector bmc_connector;
-		} bmc;
 	} output;
 
 	bool support_wide_screen;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index d823e9d85b04..ed496fb32bf3 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -34,10 +34,8 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_damage_helper.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -1309,103 +1307,6 @@ static int ast_crtc_init(struct drm_device *dev)
 	return 0;
 }
 
-/*
- * BMC virtual Connector
- */
-
-static const struct drm_encoder_funcs ast_bmc_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-static int ast_bmc_connector_helper_detect_ctx(struct drm_connector *connector,
-					       struct drm_modeset_acquire_ctx *ctx,
-					       bool force)
-{
-	struct ast_bmc_connector *bmc_connector = to_ast_bmc_connector(connector);
-	struct drm_connector *physical_connector = bmc_connector->physical_connector;
-
-	/*
-	 * Most user-space compositors cannot handle more than one connected
-	 * connector per CRTC. Hence, we only mark the BMC as connected if the
-	 * physical connector is disconnected. If the physical connector's status
-	 * is connected or unknown, the BMC remains disconnected. This has no
-	 * effect on the output of the BMC.
-	 *
-	 * FIXME: Remove this logic once user-space compositors can handle more
-	 *        than one connector per CRTC. The BMC should always be connected.
-	 */
-
-	if (physical_connector && physical_connector->status == connector_status_disconnected)
-		return connector_status_connected;
-
-	return connector_status_disconnected;
-}
-
-static int ast_bmc_connector_helper_get_modes(struct drm_connector *connector)
-{
-	return drm_add_modes_noedid(connector, 4096, 4096);
-}
-
-static const struct drm_connector_helper_funcs ast_bmc_connector_helper_funcs = {
-	.get_modes = ast_bmc_connector_helper_get_modes,
-	.detect_ctx = ast_bmc_connector_helper_detect_ctx,
-};
-
-static const struct drm_connector_funcs ast_bmc_connector_funcs = {
-	.reset = drm_atomic_helper_connector_reset,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static int ast_bmc_connector_init(struct drm_device *dev,
-				  struct ast_bmc_connector *bmc_connector,
-				  struct drm_connector *physical_connector)
-{
-	struct drm_connector *connector = &bmc_connector->base;
-	int ret;
-
-	ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
-	if (ret)
-		return ret;
-
-	drm_connector_helper_add(connector, &ast_bmc_connector_helper_funcs);
-
-	bmc_connector->physical_connector = physical_connector;
-
-	return 0;
-}
-
-static int ast_bmc_output_init(struct ast_device *ast,
-			       struct drm_connector *physical_connector)
-{
-	struct drm_device *dev = &ast->base;
-	struct drm_crtc *crtc = &ast->crtc;
-	struct drm_encoder *encoder = &ast->output.bmc.encoder;
-	struct ast_bmc_connector *bmc_connector = &ast->output.bmc.bmc_connector;
-	struct drm_connector *connector = &bmc_connector->base;
-	int ret;
-
-	ret = drm_encoder_init(dev, encoder,
-			       &ast_bmc_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, "ast_bmc");
-	if (ret)
-		return ret;
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-
-	ret = ast_bmc_connector_init(dev, bmc_connector, physical_connector);
-	if (ret)
-		return ret;
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 /*
  * Mode config
  */
@@ -1457,7 +1358,6 @@ static const struct drm_mode_config_funcs ast_mode_config_funcs = {
 int ast_mode_config_init(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
-	struct drm_connector *physical_connector = NULL;
 	int ret;
 
 	ret = drmm_mutex_init(dev, &ast->modeset_lock);
@@ -1502,29 +1402,22 @@ int ast_mode_config_init(struct ast_device *ast)
 		ret = ast_vga_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.vga.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
 		ret = ast_sil164_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.sil164.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
 		ret = ast_dp501_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.dp501.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
 		ret = ast_astdp_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.astdp.connector;
 	}
-	ret = ast_bmc_output_init(ast, physical_connector);
-	if (ret)
-		return ret;
 
 	drm_mode_config_reset(dev);
 
-- 
2.46.0

