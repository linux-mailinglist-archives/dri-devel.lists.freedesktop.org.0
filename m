Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 107F9A23B62
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 10:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674F010EA50;
	Fri, 31 Jan 2025 09:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="G+2VI5z+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D2TpNvni";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G+2VI5z+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D2TpNvni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F7710E169
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:23:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 658BA1F394;
 Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ryrsb/RdLZ75t2Vq1Hu1AnfO4V8nYWoX402h4sXlk0=;
 b=G+2VI5z+voPfsu85Yd9j6F+T0j2nMt2WZpIWn8THw+qhuH6DC379z+kWHvPsYwbuEBW+x9
 GuQwGRx4oqOwK3FrOiHkFbqMtK9XL3+Du9ZnkhTbtjZHQMGvRZZtF7+vyij2Fyfo4Cdp8N
 0d2ZL6O0kpzo7xQY5siGJaBN7ho3V0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ryrsb/RdLZ75t2Vq1Hu1AnfO4V8nYWoX402h4sXlk0=;
 b=D2TpNvnif9sO+CP3DPUuyhWXpKLI5zXVWQDS98XjlrL7E9SqQhg73WoKoGyhSph5z5+1Y6
 Q1bNa7tSRIypLgCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ryrsb/RdLZ75t2Vq1Hu1AnfO4V8nYWoX402h4sXlk0=;
 b=G+2VI5z+voPfsu85Yd9j6F+T0j2nMt2WZpIWn8THw+qhuH6DC379z+kWHvPsYwbuEBW+x9
 GuQwGRx4oqOwK3FrOiHkFbqMtK9XL3+Du9ZnkhTbtjZHQMGvRZZtF7+vyij2Fyfo4Cdp8N
 0d2ZL6O0kpzo7xQY5siGJaBN7ho3V0s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Ryrsb/RdLZ75t2Vq1Hu1AnfO4V8nYWoX402h4sXlk0=;
 b=D2TpNvnif9sO+CP3DPUuyhWXpKLI5zXVWQDS98XjlrL7E9SqQhg73WoKoGyhSph5z5+1Y6
 Q1bNa7tSRIypLgCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CD4E139B1;
 Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0BmpDXiWnGd+GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:23:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 11/16] drm/ast: Validate DRM display modes against VBIOS
 modes
Date: Fri, 31 Jan 2025 10:21:11 +0100
Message-ID: <20250131092257.115596-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131092257.115596-1-tzimmermann@suse.de>
References: <20250131092257.115596-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 R_RATELIMIT(0.00)[to_ip_from(RLc3yndobo9xjuzryszaastcfq)];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
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

