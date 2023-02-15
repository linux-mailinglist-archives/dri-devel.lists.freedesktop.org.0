Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F4E698076
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFB810EB19;
	Wed, 15 Feb 2023 16:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7645410EB0C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DC3F42004D;
 Wed, 15 Feb 2023 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pqod8UcRfBuiC3hABJRedTN/0Nr+hGkU9F8SFZG9Bq0=;
 b=sPq1MPt1woMS7JjWMCeh+XXp6U2gHA+D3+P195PMvyjwRrSFdcfseDQS8/ZEY2SCuwxi7K
 6WSXaq8ZdctGGW8GR48ansM+neb0a795PGkEODDIl1cE9FKwHEvg879qak8UKR0vHwWWbW
 Fz+lHRyubbFU2EmGE+l0+YnALexKnFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pqod8UcRfBuiC3hABJRedTN/0Nr+hGkU9F8SFZG9Bq0=;
 b=VgaGVn33hCUAtv+PRJofFYcRBolgBvhPm3DGkXkPVTc/TADJuUnrSdiNQHCdDQEoW9TdGV
 DV99q2ByJndkcdCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74639134BA;
 Wed, 15 Feb 2023 16:15:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oIqCGxwF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 05/17] drm/cirrus: Split cirrus_mode_set() into smaller
 functions
Date: Wed, 15 Feb 2023 17:15:05 +0100
Message-Id: <20230215161517.5113-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215161517.5113-1-tzimmermann@suse.de>
References: <20230215161517.5113-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split cirrus_mode_set() into smaller functions that set the display
mode, color format and scnaline pitch individually. Better reflects
the design of the DRM modesetting pipeline.

Done in preparation of converting cirrus to regular atomic helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 63 +++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 0b02244bd9f1..60488e49bdb5 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -178,14 +178,12 @@ static void cirrus_set_start_address(struct cirrus_device *cirrus, u32 offset)
 	wreg_crt(cirrus, 0x1d, tmp);
 }
 
-static int cirrus_mode_set(struct cirrus_device *cirrus,
-			   struct drm_display_mode *mode,
-			   struct drm_framebuffer *fb)
+static void cirrus_mode_set(struct cirrus_device *cirrus,
+			    struct drm_display_mode *mode)
 {
 	int hsyncstart, hsyncend, htotal, hdispend;
 	int vtotal, vdispend;
 	int tmp;
-	int sr07 = 0, hdr = 0;
 
 	htotal = mode->htotal / 8;
 	hsyncend = mode->hsync_end / 8;
@@ -249,15 +247,21 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 
 	/* Disable Hercules/CGA compatibility */
 	wreg_crt(cirrus, VGA_CRTC_MODE, 0x03);
+}
+
+static void cirrus_format_set(struct cirrus_device *cirrus,
+			      struct drm_framebuffer *fb)
+{
+	u8 sr07, hdr;
 
 	sr07 = rreg_seq(cirrus, 0x07);
 	sr07 &= 0xe0;
-	hdr = 0;
 
 	cirrus->format = cirrus_format(fb);
 	switch (cirrus->format->format) {
 	case DRM_FORMAT_C8:
 		sr07 |= 0x11;
+		hdr = 0x00;
 		break;
 	case DRM_FORMAT_RGB565:
 		sr07 |= 0x17;
@@ -272,22 +276,11 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 		hdr = 0xc5;
 		break;
 	default:
-		return -1;
+		return;
 	}
 
 	wreg_seq(cirrus, 0x7, sr07);
 
-	/* Program the pitch */
-	cirrus->pitch = cirrus_pitch(fb);
-	tmp = cirrus->pitch / 8;
-	wreg_crt(cirrus, VGA_CRTC_OFFSET, tmp);
-
-	/* Enable extended blanking and pitch bits, and enable full memory */
-	tmp = 0x22;
-	tmp |= (cirrus->pitch >> 7) & 0x10;
-	tmp |= (cirrus->pitch >> 6) & 0x40;
-	wreg_crt(cirrus, 0x1b, tmp);
-
 	/* Enable high-colour modes */
 	wreg_gfx(cirrus, VGA_GFX_MODE, 0x40);
 
@@ -295,13 +288,25 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 	wreg_gfx(cirrus, VGA_GFX_MISC, 0x01);
 
 	wreg_hdr(cirrus, hdr);
+}
 
-	cirrus_set_start_address(cirrus, 0);
+static void cirrus_pitch_set(struct cirrus_device *cirrus,
+			     struct drm_framebuffer *fb)
+{
+	u8 cr13, cr1b;
 
-	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
-	outb(0x20, 0x3c0);
+	/* Program the pitch */
+	cirrus->pitch = cirrus_pitch(fb);
+	cr13 = cirrus->pitch / 8;
+	wreg_crt(cirrus, VGA_CRTC_OFFSET, cr13);
 
-	return 0;
+	/* Enable extended blanking and pitch bits, and enable full memory */
+	cr1b = 0x22;
+	cr1b |= (cirrus->pitch >> 7) & 0x10;
+	cr1b |= (cirrus->pitch >> 6) & 0x40;
+	wreg_crt(cirrus, 0x1b, cr1b);
+
+	cirrus_set_start_address(cirrus, 0);
 }
 
 static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
@@ -413,9 +418,14 @@ static void cirrus_pipe_enable(struct drm_simple_display_pipe *pipe,
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		return;
 
-	cirrus_mode_set(cirrus, &crtc_state->mode, plane_state->fb);
+	cirrus_mode_set(cirrus, &crtc_state->mode);
+	cirrus_format_set(cirrus, plane_state->fb);
+	cirrus_pitch_set(cirrus, plane_state->fb);
 	cirrus_fb_blit_fullscreen(plane_state->fb, &shadow_plane_state->data[0]);
 
+	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
+	outb(0x20, 0x3c0);
+
 	drm_dev_exit(idx);
 }
 
@@ -425,15 +435,18 @@ static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct cirrus_device *cirrus = to_cirrus(pipe->crtc.dev);
 	struct drm_plane_state *state = pipe->plane.state;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
-	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect rect;
 	int idx;
 
 	if (!drm_dev_enter(&cirrus->dev, &idx))
 		return;
 
-	if (state->fb && cirrus->format != cirrus_format(state->fb))
-		cirrus_mode_set(cirrus, &crtc->mode, state->fb);
+	if (state->fb) {
+		if (cirrus->format != cirrus_format(state->fb))
+			cirrus_format_set(cirrus, state->fb);
+		if (cirrus->pitch != cirrus_pitch(state->fb))
+			cirrus_pitch_set(cirrus, state->fb);
+	}
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		cirrus_fb_blit_rect(state->fb, &shadow_plane_state->data[0], &rect);
-- 
2.39.1

