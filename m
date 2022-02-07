Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5B54AC0CE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 15:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79CB10E338;
	Mon,  7 Feb 2022 14:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF9C10E4CC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 14:15:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B660A210FE;
 Mon,  7 Feb 2022 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644243346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuJ297UaQASg8TrhivnulJsFUqEUp7itRSIUKrFfqNQ=;
 b=FuyQ4Q1TbEXkSWWcVR3LHQGv3Xf/xFDe+2zRJIK80utt/X7QFT6IZX71o8kCKw5np5vfTM
 40EZKOOa6vMSp3KKkPmL/Cn/m60/ks+lfmPDBXPGIPK1dae18V+3/49wchOxAWJ95JYmRK
 40B5BCo3gjFRzynkCAvey+G4cAFkVuQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644243346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kuJ297UaQASg8TrhivnulJsFUqEUp7itRSIUKrFfqNQ=;
 b=Yt3/41EyLgzGvvw3T9EORPCmN9cHT8hA7kJt5TrIC4uo3TfItzSVIIlFhKEgLSM/JE/HOA
 lt7b6KLk6kq3vDCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D05813BF5;
 Mon,  7 Feb 2022 14:15:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aD6gHZIpAWKePQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Feb 2022 14:15:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, kuohsiang_chou@aspeedtech.com,
 tommy_huang@aspeedtech.com, jenmin_yuan@aspeedtech.com,
 arc_sung@aspeedtech.com
Subject: [PATCH v2 2/9] drm/ast: Move connector mode_valid function to CRTC
Date: Mon,  7 Feb 2022 15:15:37 +0100
Message-Id: <20220207141544.30015-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207141544.30015-1-tzimmermann@suse.de>
References: <20220207141544.30015-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The tests in ast_mode_valid() verify the correct resolution for the
supplied mode. This is a limitation of the CRTC, so move the function
to the CRTC helpers. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 129 +++++++++++++++++----------------
 1 file changed, 66 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 51cc6fef1b92..ab0a86cecbba 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1005,6 +1005,71 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
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
@@ -1107,6 +1172,7 @@ ast_crtc_helper_atomic_disable(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
+	.mode_valid = ast_crtc_helper_mode_valid,
 	.atomic_check = ast_crtc_helper_atomic_check,
 	.atomic_flush = ast_crtc_helper_atomic_flush,
 	.atomic_enable = ast_crtc_helper_atomic_enable,
@@ -1241,71 +1307,8 @@ static int ast_get_modes(struct drm_connector *connector)
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

