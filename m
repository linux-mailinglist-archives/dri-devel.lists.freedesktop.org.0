Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D0A21A83
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C2D10E780;
	Wed, 29 Jan 2025 09:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ibnc1zPU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nqTsRhVA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ibnc1zPU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nqTsRhVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C596B10E780
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:58:50 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 952052110B;
 Wed, 29 Jan 2025 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnWuvugpO4b8SspPi2hJOb3BqbGnzF2FSsC5iPz9LXw=;
 b=ibnc1zPUVln9agG6PBjHQUl807BaWqN5isxCn/OHBqoWtf1rlHGLntCCMcWTkavqFzVUx8
 6uA0llDiDoEBwvEjKEOo+3K1SGbM6CfaAgm04V/fLClvtp9RoPetveWSiJQSGQZukfOH8m
 vhSL0aCSJB3G5SG76yg17QEuMW+pgvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144729;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnWuvugpO4b8SspPi2hJOb3BqbGnzF2FSsC5iPz9LXw=;
 b=nqTsRhVAwhKUWT8XhhodDpKwdu9WVayzUcnOfbe9dAlcUrgmbs/S3Y9FF+qOIRRpvEondJ
 dyHG1mkCwb4Q1fDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnWuvugpO4b8SspPi2hJOb3BqbGnzF2FSsC5iPz9LXw=;
 b=ibnc1zPUVln9agG6PBjHQUl807BaWqN5isxCn/OHBqoWtf1rlHGLntCCMcWTkavqFzVUx8
 6uA0llDiDoEBwvEjKEOo+3K1SGbM6CfaAgm04V/fLClvtp9RoPetveWSiJQSGQZukfOH8m
 vhSL0aCSJB3G5SG76yg17QEuMW+pgvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144729;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bnWuvugpO4b8SspPi2hJOb3BqbGnzF2FSsC5iPz9LXw=;
 b=nqTsRhVAwhKUWT8XhhodDpKwdu9WVayzUcnOfbe9dAlcUrgmbs/S3Y9FF+qOIRRpvEondJ
 dyHG1mkCwb4Q1fDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6EA0313AA6;
 Wed, 29 Jan 2025 09:58:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aHPEGdn7mWflDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jan 2025 09:58:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 16/16] drm/ast: Only look up VBIOS mode on full modesets
Date: Wed, 29 Jan 2025 10:55:02 +0100
Message-ID: <20250129095840.20629-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129095840.20629-1-tzimmermann@suse.de>
References: <20250129095840.20629-1-tzimmermann@suse.de>
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

Only look up the VBIOS mode during atomic_check if the display mode
changes. For page flips, the previous settings still apply. Avoids the
runtime overhead of looking up the VBIOS mode on each page flip.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 52 ++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index a93994b00f40a..bd781293b6d97 100644
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
2.48.1

