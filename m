Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22EBA1B149
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA6210E907;
	Fri, 24 Jan 2025 08:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Vg17V5rX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3dBy1zbq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vg17V5rX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3dBy1zbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2B510E902
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 435A62117B;
 Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737705956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRuPU40We1q3jIxauNe8XniJZEhIQL7McVA/8DQKtK8=;
 b=Vg17V5rXh6tAFyHAX+NaLcz/D/r/sHk1s0O446KmQi+9+qzWpEyvXJWDpxEBhMZ4DtPYeA
 nvN9IupKi9EJPF9VhGGpTgv2EFQjhu7Oeb8vFuOm4ael0WQ5RyEfTyg43wu+GhWbD8TBc1
 naAJj2ngfPjsgXbbZb1KkOd3vFKmXwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737705956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRuPU40We1q3jIxauNe8XniJZEhIQL7McVA/8DQKtK8=;
 b=3dBy1zbqNlHTbNE0OogTCN3QBQekjATGJImPfIWAlH3/WXsJEoOb8rw0++5CjkCH9lZuQz
 aUeDJkbgG6hePUAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1737705956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRuPU40We1q3jIxauNe8XniJZEhIQL7McVA/8DQKtK8=;
 b=Vg17V5rXh6tAFyHAX+NaLcz/D/r/sHk1s0O446KmQi+9+qzWpEyvXJWDpxEBhMZ4DtPYeA
 nvN9IupKi9EJPF9VhGGpTgv2EFQjhu7Oeb8vFuOm4ael0WQ5RyEfTyg43wu+GhWbD8TBc1
 naAJj2ngfPjsgXbbZb1KkOd3vFKmXwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1737705956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRuPU40We1q3jIxauNe8XniJZEhIQL7McVA/8DQKtK8=;
 b=3dBy1zbqNlHTbNE0OogTCN3QBQekjATGJImPfIWAlH3/WXsJEoOb8rw0++5CjkCH9lZuQz
 aUeDJkbgG6hePUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20BD7139CB;
 Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0Bq+BuRJk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/15] drm/ast: Validate DRM display modes against VBIOS modes
Date: Fri, 24 Jan 2025 08:57:49 +0100
Message-ID: <20250124080546.9956-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124080546.9956-1-tzimmermann@suse.de>
References: <20250124080546.9956-1-tzimmermann@suse.de>
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

Test DRM display modes against the list of modes supported by the
VBIOS. The helper will respect the supported-modes flags in struct
ast_device. Hence only DRM display modes supported by the VBIOS
will be reported; without the current duplication of this information.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 62 +++-------------------------------
 1 file changed, 5 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index e3d15d30aeeae..372abff1c8673 100644
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
2.47.1

