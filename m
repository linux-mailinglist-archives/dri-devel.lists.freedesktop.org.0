Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6781BA1B151
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9A410E910;
	Fri, 24 Jan 2025 08:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E08E10E8FA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:05:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EB6F921167;
 Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C90F4139CB;
 Fri, 24 Jan 2025 08:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YB/nL+RJk2coNgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 24 Jan 2025 08:05:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 15/15] drm/ast: Only look up VBIOS mode on full modesets
Date: Fri, 24 Jan 2025 08:57:53 +0100
Message-ID: <20250124080546.9956-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124080546.9956-1-tzimmermann@suse.de>
References: <20250124080546.9956-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: EB6F921167
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

Only look up the VBIOS mode during atomic_check if the display mode
changes. For page flips, the previous settings still apply. Avoids the
runtime overhead of looking up the VBIOS mode on each page flip.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 52 ++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 584fa37b8d6c3..f8c10329af079 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -996,32 +996,34 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
 	}
 
 	/*
-	 * Find the VBIOS mode and adjust the DRM display mode accordingly.
+	 * Find the VBIOS mode and adjust the DRM display mode accordingly
+	 * if a full modeset is required. Otherwise keep the existing values.
 	 */
-
-	vmode = ast_vbios_find_mode(ast, &crtc_state->mode);
-	if (!vmode)
-		return -EINVAL;
-	ast_state->vmode = vmode;
-
-	if (vmode->flags & HBorder)
-		hborder = 8;
-	if (vmode->flags & VBorder)
-		vborder = 8;
-
-	adjusted_mode->crtc_hdisplay = vmode->hde;
-	adjusted_mode->crtc_hblank_start = vmode->hde + hborder;
-	adjusted_mode->crtc_hblank_end = vmode->ht - hborder;
-	adjusted_mode->crtc_hsync_start = vmode->hde + hborder + vmode->hfp;
-	adjusted_mode->crtc_hsync_end = vmode->hde + hborder + vmode->hfp + vmode->hsync;
-	adjusted_mode->crtc_htotal = vmode->ht;
-
-	adjusted_mode->crtc_vdisplay = vmode->vde;
-	adjusted_mode->crtc_vblank_start = vmode->vde + vborder;
-	adjusted_mode->crtc_vblank_end = vmode->vt - vborder;
-	adjusted_mode->crtc_vsync_start = vmode->vde + vborder + vmode->vfp;
-	adjusted_mode->crtc_vsync_end = vmode->vde + vborder + vmode->vfp + vmode->vsync;
-	adjusted_mode->crtc_vtotal = vmode->vt;
+	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+		vmode = ast_vbios_find_mode(ast, &crtc_state->mode);
+		if (!vmode)
+			return -EINVAL;
+		ast_state->vmode = vmode;
+
+		if (vmode->flags & HBorder)
+			hborder = 8;
+		if (vmode->flags & VBorder)
+			vborder = 8;
+
+		adjusted_mode->crtc_hdisplay = vmode->hde;
+		adjusted_mode->crtc_hblank_start = vmode->hde + hborder;
+		adjusted_mode->crtc_hblank_end = vmode->ht - hborder;
+		adjusted_mode->crtc_hsync_start = vmode->hde + hborder + vmode->hfp;
+		adjusted_mode->crtc_hsync_end = vmode->hde + hborder + vmode->hfp + vmode->hsync;
+		adjusted_mode->crtc_htotal = vmode->ht;
+
+		adjusted_mode->crtc_vdisplay = vmode->vde;
+		adjusted_mode->crtc_vblank_start = vmode->vde + vborder;
+		adjusted_mode->crtc_vblank_end = vmode->vt - vborder;
+		adjusted_mode->crtc_vsync_start = vmode->vde + vborder + vmode->vfp;
+		adjusted_mode->crtc_vsync_end = vmode->vde + vborder + vmode->vfp + vmode->vsync;
+		adjusted_mode->crtc_vtotal = vmode->vt;
+	}
 
 	return 0;
 }
-- 
2.47.1

