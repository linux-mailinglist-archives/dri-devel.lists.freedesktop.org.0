Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A0D87F940
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 09:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273E110F61A;
	Tue, 19 Mar 2024 08:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="onrSKafq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+7FpLxMf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="onrSKafq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+7FpLxMf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FC110F58D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:14:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AA92837506;
 Tue, 19 Mar 2024 08:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kpp/fYlAlri1GHTVXTS2+gw7YQQ2JUSx6YI1uvgkjk=;
 b=onrSKafqvRWe3n7z1ajJ3rW/bITKV9mw0E07/9sDlrYaEGXV6FfPsxAdFSp82HDKn37xLC
 hhUqeujhRKtLw26QM0Nt69vq/WwDg40rBeO202k4NzBg10li8clrL+fkkqxR1GVqHohRiS
 VYFRGWwaoxvrNr5giqOVcbS5FvM9t7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836074;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kpp/fYlAlri1GHTVXTS2+gw7YQQ2JUSx6YI1uvgkjk=;
 b=+7FpLxMfQ7ClZtZWq9CLHHKQ+dI9XM81s8jw2NvvZ8C4xEJzHncbsJBWnG8eYHij0ezpDf
 AXDYKsysbZT+iQCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710836074; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kpp/fYlAlri1GHTVXTS2+gw7YQQ2JUSx6YI1uvgkjk=;
 b=onrSKafqvRWe3n7z1ajJ3rW/bITKV9mw0E07/9sDlrYaEGXV6FfPsxAdFSp82HDKn37xLC
 hhUqeujhRKtLw26QM0Nt69vq/WwDg40rBeO202k4NzBg10li8clrL+fkkqxR1GVqHohRiS
 VYFRGWwaoxvrNr5giqOVcbS5FvM9t7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710836074;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kpp/fYlAlri1GHTVXTS2+gw7YQQ2JUSx6YI1uvgkjk=;
 b=+7FpLxMfQ7ClZtZWq9CLHHKQ+dI9XM81s8jw2NvvZ8C4xEJzHncbsJBWnG8eYHij0ezpDf
 AXDYKsysbZT+iQCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 665E513700;
 Tue, 19 Mar 2024 08:14:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qOKZF2pJ+WWLeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Mar 2024 08:14:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v4 03/12] drm/ast: Remove struct ast_{vga,sil165}_connector
Date: Tue, 19 Mar 2024 09:00:23 +0100
Message-ID: <20240319081430.10165-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319081430.10165-1-tzimmermann@suse.de>
References: <20240319081430.10165-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 1.99
X-Spam-Flag: NO
X-Spamd-Bar: +
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=onrSKafq;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+7FpLxMf
X-Spamd-Result: default: False [1.99 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RLgk4u1ri6nhg6f1rtzmk7keyw)];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[9];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: *
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AA92837506
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

Both, struct ast_vga_connector and struct ast_sil164_connector, are
now wrappers around struct drm_connector. Remove them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/ast/ast_drv.h  | 24 ++----------------------
 drivers/gpu/drm/ast/ast_mode.c | 22 ++++++++--------------
 2 files changed, 10 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index cb0e4f332be80..12ad1c0fe151b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -158,26 +158,6 @@ struct ast_i2c_chan {
 	struct i2c_algo_bit_data bit;
 };
 
-struct ast_vga_connector {
-	struct drm_connector base;
-};
-
-static inline struct ast_vga_connector *
-to_ast_vga_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct ast_vga_connector, base);
-}
-
-struct ast_sil164_connector {
-	struct drm_connector base;
-};
-
-static inline struct ast_sil164_connector *
-to_ast_sil164_connector(struct drm_connector *connector)
-{
-	return container_of(connector, struct ast_sil164_connector, base);
-}
-
 struct ast_bmc_connector {
 	struct drm_connector base;
 	struct drm_connector *physical_connector;
@@ -220,11 +200,11 @@ struct ast_device {
 	struct {
 		struct {
 			struct drm_encoder encoder;
-			struct ast_vga_connector vga_connector;
+			struct drm_connector connector;
 		} vga;
 		struct {
 			struct drm_encoder encoder;
-			struct ast_sil164_connector sil164_connector;
+			struct drm_connector connector;
 		} sil164;
 		struct {
 			struct drm_encoder encoder;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 38c31a7283a69..cbda04fca7107 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1385,10 +1385,8 @@ static const struct drm_connector_funcs ast_vga_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_vga_connector_init(struct drm_device *dev,
-				  struct ast_vga_connector *ast_vga_connector)
+static int ast_vga_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
-	struct drm_connector *connector = &ast_vga_connector->base;
 	struct ast_i2c_chan *i2c;
 	int ret;
 
@@ -1419,8 +1417,7 @@ static int ast_vga_output_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder = &ast->output.vga.encoder;
-	struct ast_vga_connector *ast_vga_connector = &ast->output.vga.vga_connector;
-	struct drm_connector *connector = &ast_vga_connector->base;
+	struct drm_connector *connector = &ast->output.vga.connector;
 	int ret;
 
 	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
@@ -1428,7 +1425,7 @@ static int ast_vga_output_init(struct ast_device *ast)
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = ast_vga_connector_init(dev, ast_vga_connector);
+	ret = ast_vga_connector_init(dev, connector);
 	if (ret)
 		return ret;
 
@@ -1485,10 +1482,8 @@ static const struct drm_connector_funcs ast_sil164_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_sil164_connector_init(struct drm_device *dev,
-				     struct ast_sil164_connector *ast_sil164_connector)
+static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
 {
-	struct drm_connector *connector = &ast_sil164_connector->base;
 	struct ast_i2c_chan *i2c;
 	int ret;
 
@@ -1519,8 +1514,7 @@ static int ast_sil164_output_init(struct ast_device *ast)
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
 	struct drm_encoder *encoder = &ast->output.sil164.encoder;
-	struct ast_sil164_connector *ast_sil164_connector = &ast->output.sil164.sil164_connector;
-	struct drm_connector *connector = &ast_sil164_connector->base;
+	struct drm_connector *connector = &ast->output.sil164.connector;
 	int ret;
 
 	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
@@ -1528,7 +1522,7 @@ static int ast_sil164_output_init(struct ast_device *ast)
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = ast_sil164_connector_init(dev, ast_sil164_connector);
+	ret = ast_sil164_connector_init(dev, connector);
 	if (ret)
 		return ret;
 
@@ -1940,13 +1934,13 @@ int ast_mode_config_init(struct ast_device *ast)
 		ret = ast_vga_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.vga.vga_connector.base;
+		physical_connector = &ast->output.vga.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_SIL164_BIT) {
 		ret = ast_sil164_output_init(ast);
 		if (ret)
 			return ret;
-		physical_connector = &ast->output.sil164.sil164_connector.base;
+		physical_connector = &ast->output.sil164.connector;
 	}
 	if (ast->tx_chip_types & AST_TX_DP501_BIT) {
 		ret = ast_dp501_output_init(ast);
-- 
2.44.0

