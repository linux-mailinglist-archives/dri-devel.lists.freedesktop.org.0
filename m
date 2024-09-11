Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A2197512E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D969C10E9C5;
	Wed, 11 Sep 2024 11:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GUTM9PTk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qd0C0vji";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GUTM9PTk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qd0C0vji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDBC10E9C5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:53:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2D99D1F8AE;
 Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCFLXB1C/RhJ76M3sQ1rjsxGbBnvbffbmvhmBe+wuHw=;
 b=GUTM9PTkNBfTIkrmZG77+hJrNC/P0XOWMReEj2SpGvAUn4FFYqV7OiNVM7spmFqrE7t+r6
 d3s4l74AY0oDHFS7jhGs8HOT0zgVv0XfCGbvnSPEL110pQjTCNWDGjjDqqOFKGIHs7VbFo
 7j8fkg8vsYHm2t5jnBtNUCxLjqNOTRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCFLXB1C/RhJ76M3sQ1rjsxGbBnvbffbmvhmBe+wuHw=;
 b=Qd0C0vjiHAzXut0tjN7DIWhUd8v2S81TWUpr2MI8wFDZudeS2NLkt3gp7pBZS4V6RFwxYM
 t3ynZOf7RPqba7DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCFLXB1C/RhJ76M3sQ1rjsxGbBnvbffbmvhmBe+wuHw=;
 b=GUTM9PTkNBfTIkrmZG77+hJrNC/P0XOWMReEj2SpGvAUn4FFYqV7OiNVM7spmFqrE7t+r6
 d3s4l74AY0oDHFS7jhGs8HOT0zgVv0XfCGbvnSPEL110pQjTCNWDGjjDqqOFKGIHs7VbFo
 7j8fkg8vsYHm2t5jnBtNUCxLjqNOTRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CCFLXB1C/RhJ76M3sQ1rjsxGbBnvbffbmvhmBe+wuHw=;
 b=Qd0C0vjiHAzXut0tjN7DIWhUd8v2S81TWUpr2MI8wFDZudeS2NLkt3gp7pBZS4V6RFwxYM
 t3ynZOf7RPqba7DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05E9E13A7E;
 Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iE0gANCE4WbGIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Sep 2024 11:53:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/10] drm/ast: dp501: Inline ast_dp501_connector_init()
Date: Wed, 11 Sep 2024 13:51:23 +0200
Message-ID: <20240911115347.899148-6-tzimmermann@suse.de>
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

Inline ast_dp501_connector_init() into its only caller. The helper
currently only does half of the connector-init work and is trivial
enough to be inlined.

Also set the local variables for encoder and connector as late as
possible, so that the compiler warns if we use them before having
initialized the instance.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_dp501.c | 43 ++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast_dp501.c
index 99bf44eec7b3..abb03d14c338 100644
--- a/drivers/gpu/drm/ast/ast_dp501.c
+++ b/drivers/gpu/drm/ast/ast_dp501.c
@@ -567,34 +567,22 @@ static const struct drm_connector_funcs ast_dp501_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_dp501_connector_init(struct drm_device *dev, struct drm_connector *connector)
-{
-	int ret;
-
-	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
-				 DRM_MODE_CONNECTOR_DisplayPort);
-	if (ret)
-		return ret;
-
-	drm_connector_helper_add(connector, &ast_dp501_connector_helper_funcs);
-
-	connector->interlace_allowed = 0;
-	connector->doublescan_allowed = 0;
-
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
-
-	return 0;
-}
+/*
+ * Output
+ */
 
 int ast_dp501_output_init(struct ast_device *ast)
 {
 	struct drm_device *dev = &ast->base;
 	struct drm_crtc *crtc = &ast->crtc;
-	struct drm_encoder *encoder = &ast->output.dp501.encoder;
-	struct ast_connector *ast_connector = &ast->output.dp501.connector;
-	struct drm_connector *connector = &ast_connector->base;
+	struct drm_encoder *encoder;
+	struct ast_connector *ast_connector;
+	struct drm_connector *connector;
 	int ret;
 
+	/* encoder */
+
+	encoder = &ast->output.dp501.encoder;
 	ret = drm_encoder_init(dev, encoder, &ast_dp501_encoder_funcs,
 			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
@@ -603,9 +591,20 @@ int ast_dp501_output_init(struct ast_device *ast)
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
-	ret = ast_dp501_connector_init(dev, connector);
+	/* connector */
+
+	ast_connector = &ast->output.dp501.connector;
+	connector = &ast_connector->base;
+	ret = drm_connector_init(dev, connector, &ast_dp501_connector_funcs,
+				 DRM_MODE_CONNECTOR_DisplayPort);
 	if (ret)
 		return ret;
+	drm_connector_helper_add(connector, &ast_dp501_connector_helper_funcs);
+
+	connector->interlace_allowed = 0;
+	connector->doublescan_allowed = 0;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
+
 	ast_connector->physical_status = connector->status;
 
 	ret = drm_connector_attach_encoder(connector, encoder);
-- 
2.46.0

