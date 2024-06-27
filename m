Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A34C91AB7E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5648110EAF1;
	Thu, 27 Jun 2024 15:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="EkY1nfym";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kej9vOdm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EkY1nfym";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kej9vOdm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9860E10E052
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 15:36:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3ECBD1FBF8;
 Thu, 27 Jun 2024 15:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719502603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URfts1H0gaSe2yTvyEOE5fcRPdnPBxACWMn9Z6QdBnw=;
 b=EkY1nfymdL/hh/sHbYyPiAAqsnXpNpp7uaMjYjveoCw1Hq5D/0ZdH6NpNIQchcP7h6diOB
 sVP7fqFcUaZXn9iQ6L+Nq+lgr7Pdqd5+cF/M378Rmnmn3c1T2dcMMSfFKnuStsy7aEFJ99
 GeXbTs+HT64vdC0DFVbl+5S9e1h016o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719502603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URfts1H0gaSe2yTvyEOE5fcRPdnPBxACWMn9Z6QdBnw=;
 b=Kej9vOdmVmXTRap+6xUlpVmCp1lfXTuAK3okDsLFNRO/6MsZ8LQMHQxntAXVC/hd9ciWdP
 CpCSlM45LgznmQAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719502603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URfts1H0gaSe2yTvyEOE5fcRPdnPBxACWMn9Z6QdBnw=;
 b=EkY1nfymdL/hh/sHbYyPiAAqsnXpNpp7uaMjYjveoCw1Hq5D/0ZdH6NpNIQchcP7h6diOB
 sVP7fqFcUaZXn9iQ6L+Nq+lgr7Pdqd5+cF/M378Rmnmn3c1T2dcMMSfFKnuStsy7aEFJ99
 GeXbTs+HT64vdC0DFVbl+5S9e1h016o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719502603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URfts1H0gaSe2yTvyEOE5fcRPdnPBxACWMn9Z6QdBnw=;
 b=Kej9vOdmVmXTRap+6xUlpVmCp1lfXTuAK3okDsLFNRO/6MsZ8LQMHQxntAXVC/hd9ciWdP
 CpCSlM45LgznmQAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F38701384C;
 Thu, 27 Jun 2024 15:36:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yJcfOgqHfWbmCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jun 2024 15:36:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/8] drm/ast: Program mode for AST DP in atomic_mode_set
Date: Thu, 27 Jun 2024 17:27:47 +0200
Message-ID: <20240627153638.8765-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627153638.8765-1-tzimmermann@suse.de>
References: <20240627153638.8765-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
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

The CRTC's atomic flush function contains code to program the
display mode ot the AST DP chip. Move the code to the connector's
atomic_mode_set callback. The DRM atomic-modesetting code invoke
this callback as part of the atomic commit.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 7f9f77b7ee73..421fcdad40e4 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1190,7 +1190,6 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct ast_device *ast = to_ast_device(dev);
 	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
-	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
 
 	/*
 	 * The gamma LUT has to be reloaded after changing the primary
@@ -1204,10 +1203,6 @@ ast_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 		else
 			ast_crtc_set_gamma_linear(ast, ast_crtc_state->format);
 	}
-
-	//Set Aspeed Display-Port
-	if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
-		ast_dp_set_mode(crtc, vbios_mode_info);
 }
 
 static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
@@ -1635,6 +1630,17 @@ static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
+static void ast_astdp_encoder_helper_atomic_mode_set(struct drm_encoder *encoder,
+						     struct drm_crtc_state *crtc_state,
+						     struct drm_connector_state *conn_state)
+{
+	struct drm_crtc *crtc = crtc_state->crtc;
+	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc_state);
+	struct ast_vbios_mode_info *vbios_mode_info = &ast_crtc_state->vbios_mode_info;
+
+	ast_dp_set_mode(crtc, vbios_mode_info);
+}
+
 static void ast_astdp_encoder_helper_atomic_enable(struct drm_encoder *encoder,
 						   struct drm_atomic_state *state)
 {
@@ -1656,6 +1662,7 @@ static void ast_astdp_encoder_helper_atomic_disable(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs ast_astdp_encoder_helper_funcs = {
+	.atomic_mode_set = ast_astdp_encoder_helper_atomic_mode_set,
 	.atomic_enable = ast_astdp_encoder_helper_atomic_enable,
 	.atomic_disable = ast_astdp_encoder_helper_atomic_disable,
 };
-- 
2.45.2

