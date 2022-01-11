Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B3648AD39
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 13:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65EC10E6CD;
	Tue, 11 Jan 2022 12:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B34010E4D0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 12:01:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CD4271F3B1;
 Tue, 11 Jan 2022 12:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641902461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hftsS6tlLjhi0YJUwdxhQxiNZlqnMwacMAl2TusQ3A=;
 b=bUqE5sqOIJO9V9I0kDpg+oYEfBw+a55cjSjOWdlQnIQ+x4M246NMExw3HZ2NaCe4xU1HkH
 QgKc0m+Wishe3760HfVdcSQs6z3nJ+iBah1ILzBp0kCCqPh186wU7bBX+6GToqARdFV1ZH
 843L8yKKLcUsVUB9E5+eCYYXAFypjIQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641902461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hftsS6tlLjhi0YJUwdxhQxiNZlqnMwacMAl2TusQ3A=;
 b=EUhREwm8B1WKqLUB6MumJTeGUx+V9AG3JuTzc424XGyiMTEM5l5S/30BXJyJzVISj2+5+G
 BMlj6bZGksD5aVBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9495E13DD4;
 Tue, 11 Jan 2022 12:01:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AJwOI31x3WEeFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 12:01:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 kuohsiang_chou@aspeedtech.com
Subject: [PATCH 2/8] drm/ast: Move connector mode_valid function to CRTC
Date: Tue, 11 Jan 2022 13:00:52 +0100
Message-Id: <20220111120058.10510-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111120058.10510-1-tzimmermann@suse.de>
References: <20220111120058.10510-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: jenmin_yuan@aspeedtech.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, tommy_huang@aspeedtech.com,
 arc_sung@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tests in ast_mode_valid() verify the correct resolution for the
supplied mode. This is a limitation of the CRTC, so move the function
to the CRTC helpers. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 129 +++++++++++++++++----------------
 1 file changed, 66 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 20626c78a693..c555960a488a 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1002,6 +1002,71 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
 	}
 }
 
+static enum drm_mode_status
+ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
+{
+	struct ast_private *ast = to_ast_private(crtc->dev);
+	enum drm_mode_status status;
+	uint32_t jtemp;
+
+	if (ast->support_wide_screen) {
+		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
+			return MODE_OK;
+		if ((mode->hdisplay == 1280) && (mode->vdisplay == 800))
+			return MODE_OK;
+		if ((mode->hdisplay == 1440) && (mode->vdisplay == 900))
+			return MODE_OK;
+		if ((mode->hdisplay == 1360) && (mode->vdisplay == 768))
+			return MODE_OK;
+		if ((mode->hdisplay == 1600) && (mode->vdisplay == 900))
+			return MODE_OK;
+
+		if ((ast->chip == AST2100) || (ast->chip == AST2200) ||
+		    (ast->chip == AST2300) || (ast->chip == AST2400) ||
+		    (ast->chip == AST2500)) {
+			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
+				return MODE_OK;
+
+			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1200)) {
+				jtemp = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
+				if (jtemp & 0x01)
+					return MODE_NOMODE;
+				else
+					return MODE_OK;
+			}
+		}
+	}
+
+	status = MODE_NOMODE;
+
+	switch (mode->hdisplay) {
+	case 640:
+		if (mode->vdisplay == 480)
+			status = MODE_OK;
+		break;
+	case 800:
+		if (mode->vdisplay == 600)
+			status = MODE_OK;
+		break;
+	case 1024:
+		if (mode->vdisplay == 768)
+			status = MODE_OK;
+		break;
+	case 1280:
+		if (mode->vdisplay == 1024)
+			status = MODE_OK;
+		break;
+	case 1600:
+		if (mode->vdisplay == 1200)
+			status = MODE_OK;
+		break;
+	default:
+		break;
+	}
+
+	return status;
+}
+
 static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -1104,6 +1169,7 @@ ast_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
+	.mode_valid = ast_crtc_helper_mode_valid,
 	.atomic_check = ast_crtc_helper_atomic_check,
 	.atomic_flush = ast_crtc_helper_atomic_flush,
 	.atomic_enable = ast_crtc_helper_atomic_enable,
@@ -1238,71 +1304,8 @@ static int ast_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
-static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
-			  struct drm_display_mode *mode)
-{
-	struct ast_private *ast = to_ast_private(connector->dev);
-	int flags = MODE_NOMODE;
-	uint32_t jtemp;
-
-	if (ast->support_wide_screen) {
-		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
-			return MODE_OK;
-		if ((mode->hdisplay == 1280) && (mode->vdisplay == 800))
-			return MODE_OK;
-		if ((mode->hdisplay == 1440) && (mode->vdisplay == 900))
-			return MODE_OK;
-		if ((mode->hdisplay == 1360) && (mode->vdisplay == 768))
-			return MODE_OK;
-		if ((mode->hdisplay == 1600) && (mode->vdisplay == 900))
-			return MODE_OK;
-
-		if ((ast->chip == AST2100) || (ast->chip == AST2200) ||
-		    (ast->chip == AST2300) || (ast->chip == AST2400) ||
-		    (ast->chip == AST2500)) {
-			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
-				return MODE_OK;
-
-			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1200)) {
-				jtemp = ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
-				if (jtemp & 0x01)
-					return MODE_NOMODE;
-				else
-					return MODE_OK;
-			}
-		}
-	}
-	switch (mode->hdisplay) {
-	case 640:
-		if (mode->vdisplay == 480)
-			flags = MODE_OK;
-		break;
-	case 800:
-		if (mode->vdisplay == 600)
-			flags = MODE_OK;
-		break;
-	case 1024:
-		if (mode->vdisplay == 768)
-			flags = MODE_OK;
-		break;
-	case 1280:
-		if (mode->vdisplay == 1024)
-			flags = MODE_OK;
-		break;
-	case 1600:
-		if (mode->vdisplay == 1200)
-			flags = MODE_OK;
-		break;
-	default:
-		return flags;
-	}
-
-	return flags;
-}
-
 static const struct drm_connector_helper_funcs ast_connector_helper_funcs = {
 	.get_modes = ast_get_modes,
-	.mode_valid = ast_mode_valid,
 };
 
 static const struct drm_connector_funcs ast_connector_funcs = {
-- 
2.34.1

