Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FFD88B0EC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 21:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EC810E623;
	Mon, 25 Mar 2024 20:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sJal2bBO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kktDlZ/B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sJal2bBO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kktDlZ/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F1210E2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 20:09:00 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A8385CB51;
 Mon, 25 Mar 2024 20:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711397339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=re7+YDMMxGgWuy/gX2rfVKRPxV8uoLgGwtOPSL0TYAk=;
 b=sJal2bBOOujWrgCUVcgyNnq/AkLY7DauJmuRBNCJCMU9dtxLuS/3zIKxduJoeW2wZMAuEY
 FsVN7cHyY1enxWe3lezMgbGt9QwCBW69veNgUZPwxVKl0lijJz638Q164HSiIlCA5cY+nI
 7Q05APQyhIQFuAMLN3UJiGlDvkuhuZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711397339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=re7+YDMMxGgWuy/gX2rfVKRPxV8uoLgGwtOPSL0TYAk=;
 b=kktDlZ/BMU8+UvSkKql2/Rc/hbKCTFoQFCJ1k+DGRm1VtdqBLDNVsr7VajJl6vcLrmF04W
 0rcySustOzLt5oBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1711397339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=re7+YDMMxGgWuy/gX2rfVKRPxV8uoLgGwtOPSL0TYAk=;
 b=sJal2bBOOujWrgCUVcgyNnq/AkLY7DauJmuRBNCJCMU9dtxLuS/3zIKxduJoeW2wZMAuEY
 FsVN7cHyY1enxWe3lezMgbGt9QwCBW69veNgUZPwxVKl0lijJz638Q164HSiIlCA5cY+nI
 7Q05APQyhIQFuAMLN3UJiGlDvkuhuZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1711397339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=re7+YDMMxGgWuy/gX2rfVKRPxV8uoLgGwtOPSL0TYAk=;
 b=kktDlZ/BMU8+UvSkKql2/Rc/hbKCTFoQFCJ1k+DGRm1VtdqBLDNVsr7VajJl6vcLrmF04W
 0rcySustOzLt5oBA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E84313AC6;
 Mon, 25 Mar 2024 20:08:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id QEVpJdrZAWaVcAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Mar 2024 20:08:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, sui.jingfeng@linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH v6 03/13] drm/ast: Remove struct ast_{vga,sil165}_connector
Date: Mon, 25 Mar 2024 21:06:48 +0100
Message-ID: <20240325200855.21150-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325200855.21150-1-tzimmermann@suse.de>
References: <20240325200855.21150-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[];
 R_RATELIMIT(0.00)[to_ip_from(RL9pqk354j4esf7wsagg6iyf8a)];
 RCVD_COUNT_THREE(0.00)[3]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCPT_COUNT_SEVEN(0.00)[11];
 FREEMAIL_TO(0.00)[redhat.com,linux.dev,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,gmail.com];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[]
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both, struct ast_vga_connector and struct ast_sil164_connector, are
now wrappers around struct drm_connector. Remove them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
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

