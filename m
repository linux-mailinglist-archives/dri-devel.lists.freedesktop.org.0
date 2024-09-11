Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02126975130
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 13:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3D110E9CD;
	Wed, 11 Sep 2024 11:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="y5CTC7PG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VPTEPXRh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y5CTC7PG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VPTEPXRh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C427610E9C8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 11:53:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 89D2B1F8B0;
 Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqL9oH/1j0QLe4KlOd5LBQYtOsNFy2J4Dxdo9ebyB9g=;
 b=y5CTC7PG7o9FvkLfLobRNZz5u0ITHp47+IWgQlCy+wr0AmJwIhEQC1VCG9okMoxBXrZRKW
 FGGFIt33Hka9NSI/2x+PQkc0Dy6+qy1mwU+FfwC7cYXztG9HKycfrcDXMBsttaBG/Z0id/
 PxIh3r+yDmCPEfMEMnYThQoVQh9mpfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqL9oH/1j0QLe4KlOd5LBQYtOsNFy2J4Dxdo9ebyB9g=;
 b=VPTEPXRhoF7UdQQrLHJCzvsv6LqCAMWznsZ9Yku3cODRrcrKqmYU6kdTtxQf+TV9b23zOD
 tHo9Gui7CuC3XGDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1726055632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqL9oH/1j0QLe4KlOd5LBQYtOsNFy2J4Dxdo9ebyB9g=;
 b=y5CTC7PG7o9FvkLfLobRNZz5u0ITHp47+IWgQlCy+wr0AmJwIhEQC1VCG9okMoxBXrZRKW
 FGGFIt33Hka9NSI/2x+PQkc0Dy6+qy1mwU+FfwC7cYXztG9HKycfrcDXMBsttaBG/Z0id/
 PxIh3r+yDmCPEfMEMnYThQoVQh9mpfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1726055632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqL9oH/1j0QLe4KlOd5LBQYtOsNFy2J4Dxdo9ebyB9g=;
 b=VPTEPXRhoF7UdQQrLHJCzvsv6LqCAMWznsZ9Yku3cODRrcrKqmYU6kdTtxQf+TV9b23zOD
 tHo9Gui7CuC3XGDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 626B013A7E;
 Wed, 11 Sep 2024 11:53:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SP2yFtCE4WbGIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Sep 2024 11:53:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/10] drm/ast: sil164: Inline ast_sil164_connector_init()
Date: Wed, 11 Sep 2024 13:51:25 +0200
Message-ID: <20240911115347.899148-8-tzimmermann@suse.de>
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
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 R_RATELIMIT(0.00)[to_ip_from(RLc3yndobo9xjuzryszaastcfq)];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[]
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

Inline ast_sil164_connector_init() into its only caller. The helper
currently only does half of the connector-init work and is trivial
enough to be inlined. While at it, remove the error message from the
call to ast_ddc_create(). The function already warns on errors.

Also set the local variables for encoder and connector as late as
possible, so that the compiler warns if we use them before having
initialized the instance.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_sil164.c | 55 +++++++++++++++-----------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_sil164.c b/drivers/gpu/drm/ast/ast_sil164.c
index 496c7120e515..6a72268d2314 100644
--- a/drivers/gpu/drm/ast/ast_sil164.c
+++ b/drivers/gpu/drm/ast/ast_sil164.c
@@ -71,52 +71,49 @@ static const struct drm_connector_funcs ast_sil164_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static int ast_sil164_connector_init(struct drm_device *dev, struct drm_connector *connector)
+/*
+ * Output
+ */
+
+int ast_sil164_output_init(struct ast_device *ast)
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
+	encoder = &ast->output.sil164.encoder;
+	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
 		return ret;
-	}
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	/* connector */
 
+	ast_connector = &ast->output.sil164.connector;
+	connector = &ast_connector->base;
 	ret = drm_connector_init_with_ddc(dev, connector, &ast_sil164_connector_funcs,
 					  DRM_MODE_CONNECTOR_DVII, ddc);
 	if (ret)
 		return ret;
-
 	drm_connector_helper_add(connector, &ast_sil164_connector_helper_funcs);
 
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
-
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
 
-	return 0;
-}
-
-int ast_sil164_output_init(struct ast_device *ast)
-{
-	struct drm_device *dev = &ast->base;
-	struct drm_crtc *crtc = &ast->crtc;
-	struct drm_encoder *encoder = &ast->output.sil164.encoder;
-	struct ast_connector *ast_connector = &ast->output.sil164.connector;
-	struct drm_connector *connector = &ast_connector->base;
-	int ret;
-
-	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
-			       DRM_MODE_ENCODER_TMDS, NULL);
-	if (ret)
-		return ret;
-	encoder->possible_crtcs = drm_crtc_mask(crtc);
-
-	ret = ast_sil164_connector_init(dev, connector);
-	if (ret)
-		return ret;
 	ast_connector->physical_status = connector->status;
 
 	ret = drm_connector_attach_encoder(connector, encoder);
-- 
2.46.0

