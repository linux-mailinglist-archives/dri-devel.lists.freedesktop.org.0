Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5AA21A86
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:59:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319D210E789;
	Wed, 29 Jan 2025 09:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C889E10E782
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:58:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ABBD51F38D;
 Wed, 29 Jan 2025 09:58:48 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8845513AA6;
 Wed, 29 Jan 2025 09:58:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kFz9H9j7mWflDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jan 2025 09:58:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 11/16] drm/ast: Validate DRM display modes against VBIOS
 modes
Date: Wed, 29 Jan 2025 10:54:57 +0100
Message-ID: <20250129095840.20629-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129095840.20629-1-tzimmermann@suse.de>
References: <20250129095840.20629-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: ABBD51F38D
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Test DRM display modes against the list of modes supported by the
VBIOS. The helper will respect the supported-modes flags in struct
ast_device. Hence only DRM display modes supported by the VBIOS
will be reported; without the current duplication of this information.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 62 +++-------------------------------
 1 file changed, 5 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 14c0c281a6834..f58ec35cb3a38 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -950,65 +950,13 @@ static enum drm_mode_status
 ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode *mode)
 {
 	struct ast_device *ast = to_ast_device(crtc->dev);
-	enum drm_mode_status status;
-
-	if (ast->support_wsxga_p) {
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
-		if (ast->support_fullhd) {
-			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
-				return MODE_OK;
-
-			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1200)) {
-				if (ast->support_wuxga)
-					return MODE_OK;
-				else
-					return MODE_NOMODE;
-			}
-		}
-	}
+	const struct ast_vbios_enhtable *vmode;
 
-	status = MODE_NOMODE;
+	vmode = ast_vbios_find_mode(ast, mode);
+	if (!vmode)
+		return MODE_NOMODE;
 
-	switch (mode->hdisplay) {
-	case 640:
-		if (mode->vdisplay == 480)
-			status = MODE_OK;
-		break;
-	case 800:
-		if (mode->vdisplay == 600)
-			status = MODE_OK;
-		break;
-	case 1024:
-		if (mode->vdisplay == 768)
-			status = MODE_OK;
-		break;
-	case 1152:
-		if (mode->vdisplay == 864)
-			status = MODE_OK;
-		break;
-	case 1280:
-		if (mode->vdisplay == 1024)
-			status = MODE_OK;
-		break;
-	case 1600:
-		if (mode->vdisplay == 1200)
-			status = MODE_OK;
-		break;
-	default:
-		break;
-	}
-
-	return status;
+	return MODE_OK;
 }
 
 static void ast_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
-- 
2.48.1

