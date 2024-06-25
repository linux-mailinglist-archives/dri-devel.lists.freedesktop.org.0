Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0BA9168B0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 15:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A92610E050;
	Tue, 25 Jun 2024 13:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="r/gXecTb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Je11pMjE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r/gXecTb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Je11pMjE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B8010E050
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 13:18:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 188291F455;
 Tue, 25 Jun 2024 13:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719321500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MmH4yt+HWmDaWLhPLDqPzdZSoHOxRwQL99wHiD1yLC0=;
 b=r/gXecTbemK1dzNYMrkLPsCm8dfPiHwm6GJiyv/C3rsicdTKb8oCeO0vjHLj/rVEAiSdEx
 g7ko/+Dwz2KwVxYGcUIOFHFoovWEDXZQpUP/fo2atdPJxDjLCNnc+13eT44Lz0z/kGNKM+
 t6cc/YnO1KAW+a+ZKnJ3mNGz5aZusrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719321500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MmH4yt+HWmDaWLhPLDqPzdZSoHOxRwQL99wHiD1yLC0=;
 b=Je11pMjEqt85KUftPYETxba4pbtP+b0WBhtoV8/w3bxIIfcJGWeTglNfvfd5vBj9tvsmSl
 FmK/DnfrpmVUlrDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1719321500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MmH4yt+HWmDaWLhPLDqPzdZSoHOxRwQL99wHiD1yLC0=;
 b=r/gXecTbemK1dzNYMrkLPsCm8dfPiHwm6GJiyv/C3rsicdTKb8oCeO0vjHLj/rVEAiSdEx
 g7ko/+Dwz2KwVxYGcUIOFHFoovWEDXZQpUP/fo2atdPJxDjLCNnc+13eT44Lz0z/kGNKM+
 t6cc/YnO1KAW+a+ZKnJ3mNGz5aZusrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1719321500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MmH4yt+HWmDaWLhPLDqPzdZSoHOxRwQL99wHiD1yLC0=;
 b=Je11pMjEqt85KUftPYETxba4pbtP+b0WBhtoV8/w3bxIIfcJGWeTglNfvfd5vBj9tvsmSl
 FmK/DnfrpmVUlrDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D1DF01384C;
 Tue, 25 Jun 2024 13:18:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id nNLaMZvDemYnFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Jun 2024 13:18:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/ast: Inline drm_simple_encoder_init()
Date: Tue, 25 Jun 2024 15:18:09 +0200
Message-ID: <20240625131815.14514-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

The function drm_simple_encoder_init() is a trivial helper and
deprecated. Replace it with the regular call to drm_encoder_init().
Resolves the dependency on drm_simple_kms_helper.h. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++++++++++++++++++----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 6695af70768f..2fd9c78eab73 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -45,7 +45,6 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "ast_ddc.h"
 #include "ast_drv.h"
@@ -1358,6 +1357,14 @@ static int ast_crtc_init(struct drm_device *dev)
 	return 0;
 }
 
+/*
+ * VGA Encoder
+ */
+
+static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 /*
  * VGA Connector
  */
@@ -1411,7 +1418,8 @@ static int ast_vga_output_init(struct ast_device *ast)
 	struct drm_connector *connector = &ast->output.vga.connector;
 	int ret;
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
+	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
 	if (ret)
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
@@ -1427,6 +1435,14 @@ static int ast_vga_output_init(struct ast_device *ast)
 	return 0;
 }
 
+/*
+ * SIL164 Encoder
+ */
+
+static const struct drm_encoder_funcs ast_sil164_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 /*
  * SIL164 Connector
  */
@@ -1480,7 +1496,8 @@ static int ast_sil164_output_init(struct ast_device *ast)
 	struct drm_connector *connector = &ast->output.sil164.connector;
 	int ret;
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(dev, encoder, &ast_sil164_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
@@ -1496,6 +1513,14 @@ static int ast_sil164_output_init(struct ast_device *ast)
 	return 0;
 }
 
+/*
+ * DP501 Encoder
+ */
+
+static const struct drm_encoder_funcs ast_dp501_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 /*
  * DP501 Connector
  */
@@ -1578,7 +1603,8 @@ static int ast_dp501_output_init(struct ast_device *ast)
 	struct drm_connector *connector = &ast->output.dp501.connector;
 	int ret;
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(dev, encoder, &ast_dp501_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
@@ -1594,6 +1620,14 @@ static int ast_dp501_output_init(struct ast_device *ast)
 	return 0;
 }
 
+/*
+ * ASPEED Display-Port Encoder
+ */
+
+static const struct drm_encoder_funcs ast_astdp_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 /*
  * ASPEED Display-Port Connector
  */
@@ -1688,7 +1722,8 @@ static int ast_astdp_output_init(struct ast_device *ast)
 	struct drm_connector *connector = &ast->output.astdp.connector;
 	int ret;
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(dev, encoder, &ast_astdp_encoder_funcs,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
 		return ret;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-- 
2.45.2

