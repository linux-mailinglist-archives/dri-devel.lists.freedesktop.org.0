Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837CC9536F0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 17:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B40310E461;
	Thu, 15 Aug 2024 15:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="0nEzzlFC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qed1ifuV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0nEzzlFC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qed1ifuV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BA710E45C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 15:20:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A636D22207;
 Thu, 15 Aug 2024 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723735200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LjJmhH7SL7NfZ++wxB5EhbaPlMT88bnSUbyA4KEffdA=;
 b=0nEzzlFCCPVPfVsf7ry+w/IbYj9zxG02a4iV6w2AgviJKj0SCTiRzO6gK28rbkzjDdfPfH
 vmEiO4AupL2Fdr/lXvnH5YxsHvyrsKapntOU+odaHWGBpkLPrUKlQNkfuWBfWnZnLhKJGF
 buN9IlCbIToksdvomobdsDEqcSHtQlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723735200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LjJmhH7SL7NfZ++wxB5EhbaPlMT88bnSUbyA4KEffdA=;
 b=Qed1ifuVlh1EOAnYq3CKY6ietk6uSzrTSa8WM8OIcHtVPil+VytX9tpZ+rPrX01wuNie2z
 xS9NIjqba6lgtjCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723735200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LjJmhH7SL7NfZ++wxB5EhbaPlMT88bnSUbyA4KEffdA=;
 b=0nEzzlFCCPVPfVsf7ry+w/IbYj9zxG02a4iV6w2AgviJKj0SCTiRzO6gK28rbkzjDdfPfH
 vmEiO4AupL2Fdr/lXvnH5YxsHvyrsKapntOU+odaHWGBpkLPrUKlQNkfuWBfWnZnLhKJGF
 buN9IlCbIToksdvomobdsDEqcSHtQlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723735200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LjJmhH7SL7NfZ++wxB5EhbaPlMT88bnSUbyA4KEffdA=;
 b=Qed1ifuVlh1EOAnYq3CKY6ietk6uSzrTSa8WM8OIcHtVPil+VytX9tpZ+rPrX01wuNie2z
 xS9NIjqba6lgtjCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F26F13B0C;
 Thu, 15 Aug 2024 15:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CODzGaAcvmb6DAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Aug 2024 15:20:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 11/11] drm/ast: Remove BMC output
Date: Thu, 15 Aug 2024 17:18:53 +0200
Message-ID: <20240815151953.184679-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815151953.184679-1-tzimmermann@suse.de>
References: <20240815151953.184679-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

v3:
- remove struct ast_bmc_connector

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  19 ------
 drivers/gpu/drm/ast/ast_mode.c | 107 ---------------------------------
 2 files changed, 126 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index b29625d45a11..91fe07cf7b07 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -162,21 +162,6 @@ to_ast_connector(struct drm_connector *connector)
 	return container_of(connector, struct ast_connector, base);
 }
 
-/*
- * BMC
- */
-
-struct ast_bmc_connector {
-	struct drm_connector base;
-	struct drm_connector *physical_connector;
-};
-
-static inline struct ast_bmc_connector *
-to_ast_bmc_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct ast_bmc_connector, base);
-}
-
 /*
  * Device
  */
@@ -222,10 +207,6 @@ struct ast_device {
 			struct drm_encoder encoder;
 			struct ast_connector connector;
 		} astdp;
-		struct {
-			struct drm_encoder encoder;
-			struct ast_bmc_connector bmc_connector;
-		} bmc;
 	} output;
 
 	bool support_wide_screen;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 8ce1637268e1..ed496fb32bf3 100644
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
-		physical_connector = &ast->output.vga.connector.base;
 	}
 	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
 		ret = ast_sil164_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.sil164.connector.base;
 	}
 	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
 		ret = ast_dp501_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.dp501.connector.base;
 	}
 	if (ast->tx_chip_types & AST_TX_ASTDP_BIT) {
 		ret = ast_astdp_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.astdp.connector.base;
 	}
-	ret = ast_bmc_output_init(ast, physical_connector);
-	if (ret)
-		return ret;
 
 	drm_mode_config_reset(dev);
 
-- 
2.46.0

