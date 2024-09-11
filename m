Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD0A975129
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5FE10E9C9;
	Wed, 11 Sep 2024 11:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="YXECGhlK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pA9I+E7W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YXECGhlK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pA9I+E7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD73E10E9C5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71A7A21A99;
 Wed, 11 Sep 2024 11:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnpoeXcEaUBhjjPeS0DZZ2guPSPZBJ2vTTE4FxwzK50=;
 b=YXECGhlK9OB/YDDwrtbpDPrrlkKYPsXJcsr/xQNZy8k/GOIl43xdiPmk6kQz84hYHMW1xF
 uvvNd0bhy7fgIkRYovNP+DB8Pop00d3BRy0fE7BNnbk5wOx1cH2IvpMPhLm1Qcpj13KTJB
 qqD8gc3clY6P6K0yXKxwtMREb9YrcLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnpoeXcEaUBhjjPeS0DZZ2guPSPZBJ2vTTE4FxwzK50=;
 b=pA9I+E7WeqwTK/ZUGyt8AXf+e3PM8nIEjigKxezt4M53UWkcoCZyzLSfuG0ytCo2k+aODk
 z/LRtvbWuzgt+wBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055631; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnpoeXcEaUBhjjPeS0DZZ2guPSPZBJ2vTTE4FxwzK50=;
 b=YXECGhlK9OB/YDDwrtbpDPrrlkKYPsXJcsr/xQNZy8k/GOIl43xdiPmk6kQz84hYHMW1xF
 uvvNd0bhy7fgIkRYovNP+DB8Pop00d3BRy0fE7BNnbk5wOx1cH2IvpMPhLm1Qcpj13KTJB
 qqD8gc3clY6P6K0yXKxwtMREb9YrcLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055631;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KnpoeXcEaUBhjjPeS0DZZ2guPSPZBJ2vTTE4FxwzK50=;
 b=pA9I+E7WeqwTK/ZUGyt8AXf+e3PM8nIEjigKxezt4M53UWkcoCZyzLSfuG0ytCo2k+aODk
 z/LRtvbWuzgt+wBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3ECFA13A7E;
 Wed, 11 Sep 2024 11:53:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CA32Dc+E4WbGIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Sep 2024 11:53:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/10] drm/ast: astdp: Inline ast_astdp_connector_init()
Date: Wed, 11 Sep 2024 13:51:19 +0200
Message-ID: <20240911115347.899148-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240911115347.899148-1-tzimmermann@suse.de>
References: <20240911115347.899148-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
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

Inline ast_astdp_connector_init() into its only caller. The helper
currently only does half of the connector-init work and is trivial
enough to be inlined.

Also set the local variables for encoder and connector as late as
possible, so that the compiler warns if we use them before having
initialized the instance.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp.c | 45 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 00b364f9a71e..dab73dc6cb87 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -414,6 +414,10 @@ static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs
 	.detect_ctx = ast_astdp_connector_helper_detect_ctx,
 };
 
+/*
+ * Output
+ */
+
 static const struct drm_connector_funcs ast_astdp_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -422,34 +426,18 @@ static const struct drm_connector_funcs ast_astdp_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_astdp_connector_init(struct drm_device *dev, struct drm_connector *connector)
-{
-	int ret;
-
-	ret = drm_connector_init(dev, connector, &ast_astdp_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret)
-		return ret;
-
-	drm_connector_helper_add(connector, &ast_astdp_connector_helper_funcs);
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
-
-	return 0;
-}
-
 int ast_astdp_output_init(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
-	struct drm_encoder *encoder = &ast->output.astdp.encoder;
-	struct ast_connector *ast_connector = &ast->output.astdp.connector;
-	struct drm_connector *connector = &ast_connector->base;
+	struct drm_encoder *encoder;
+	struct ast_connector *ast_connector;
+	struct drm_connector *connector;
 	int ret;
 
+	/* encoder */
+
+	encoder = &ast->output.astdp.encoder;
 	ret = drm_encoder_init(dev, encoder, &ast_astdp_encoder_funcs,
 			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
@@ -458,9 +446,20 @@ int ast_astdp_output_init(struct ast_device *ast)
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = ast_astdp_connector_init(dev, connector);
+	/* connector */
+
+	ast_connector = &ast->output.astdp.connector;
+	connector = &ast_connector->base;
+	ret = drm_connector_init(dev, connector, &ast_astdp_connector_funcs,
+				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret)
 		return ret;
+	drm_connector_helper_add(connector, &ast_astdp_connector_helper_funcs);
+
+	connector->interlace_allowed = 0;
+	connector->doublescan_allowed = 0;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ast_connector->physical_status = connector->status;
 
 	ret = drm_connector_attach_encoder(connector, encoder);
-- 
2.46.0

