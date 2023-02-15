Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B63698068
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5CB10EB0F;
	Wed, 15 Feb 2023 16:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C30910EB0B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 63C6120049;
 Wed, 15 Feb 2023 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477724; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gU/P5ULcp37n3qnNdtlz1Fd6+7it/Y/VwEk7sGQhzmQ=;
 b=ghhMRtm+vdkrW7/QfAlEchXDRgb7cOCvbijDa6KDLty90+Q6I+rDfgBeCrvWesXCGRw3hf
 lKemS66z/wQMPY8rfww9rfkkf+sgkCkVrXWLA7Q2L0uB65YnQdQcgbOxubN/hzR3jCSF99
 vkfV2m10L6d4kmJaiRat25OZkaimmro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477724;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gU/P5ULcp37n3qnNdtlz1Fd6+7it/Y/VwEk7sGQhzmQ=;
 b=xAGHbOZjgiPPCnzMJnY36xnTnzJvQ5HkhP4/vR+D1AvQVrmQ91cpx3J+3hDWTfdaAshWnR
 Db0h/z9Smnq4cbCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3E6F134BA;
 Wed, 15 Feb 2023 16:15:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iBb0NRsF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 04/17] drm/cirrus: Move drm_dev_{enter,
 exit}() into DRM helpers
Date: Wed, 15 Feb 2023 17:15:04 +0100
Message-Id: <20230215161517.5113-5-tzimmermann@suse.de>
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

Call drm_dev_enter() and drm_dev_exit() immediately after entering
cirrus' DRM helper functions. Remove these calls from other functions.
Each enter/exit block in the DRM helpers covers the full hardware
update. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 71fa07535298..0b02244bd9f1 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -159,13 +159,9 @@ static int cirrus_pitch(struct drm_framebuffer *fb)
 
 static void cirrus_set_start_address(struct cirrus_device *cirrus, u32 offset)
 {
-	int idx;
 	u32 addr;
 	u8 tmp;
 
-	if (!drm_dev_enter(&cirrus->dev, &idx))
-		return;
-
 	addr = offset >> 2;
 	wreg_crt(cirrus, 0x0c, (u8)((addr >> 8) & 0xff));
 	wreg_crt(cirrus, 0x0d, (u8)(addr & 0xff));
@@ -180,8 +176,6 @@ static void cirrus_set_start_address(struct cirrus_device *cirrus, u32 offset)
 	tmp &= 0x7f;
 	tmp |= (addr >> 12) & 0x80;
 	wreg_crt(cirrus, 0x1d, tmp);
-
-	drm_dev_exit(idx);
 }
 
 static int cirrus_mode_set(struct cirrus_device *cirrus,
@@ -190,12 +184,9 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 {
 	int hsyncstart, hsyncend, htotal, hdispend;
 	int vtotal, vdispend;
-	int tmp, idx;
+	int tmp;
 	int sr07 = 0, hdr = 0;
 
-	if (!drm_dev_enter(&cirrus->dev, &idx))
-		return -1;
-
 	htotal = mode->htotal / 8;
 	hsyncend = mode->hsync_end / 8;
 	hsyncstart = mode->hsync_start / 8;
@@ -281,7 +272,6 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 		hdr = 0xc5;
 		break;
 	default:
-		drm_dev_exit(idx);
 		return -1;
 	}
 
@@ -311,7 +301,6 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
 	outb(0x20, 0x3c0);
 
-	drm_dev_exit(idx);
 	return 0;
 }
 
@@ -321,18 +310,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 {
 	struct cirrus_device *cirrus = to_cirrus(fb->dev);
 	struct iosys_map dst;
-	int idx;
-
-	if (!drm_dev_enter(&cirrus->dev, &idx))
-		return -ENODEV;
 
 	iosys_map_set_vaddr_iomem(&dst, cirrus->vram);
 	iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
 
 	drm_fb_blit(&dst, &cirrus->pitch, cirrus->format->format, vmap, fb, rect);
 
-	drm_dev_exit(idx);
-
 	return 0;
 }
 
@@ -425,9 +408,15 @@ static void cirrus_pipe_enable(struct drm_simple_display_pipe *pipe,
 {
 	struct cirrus_device *cirrus = to_cirrus(pipe->crtc.dev);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	int idx;
+
+	if (!drm_dev_enter(&cirrus->dev, &idx))
+		return;
 
 	cirrus_mode_set(cirrus, &crtc_state->mode, plane_state->fb);
 	cirrus_fb_blit_fullscreen(plane_state->fb, &shadow_plane_state->data[0]);
+
+	drm_dev_exit(idx);
 }
 
 static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
@@ -438,12 +427,18 @@ static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect rect;
+	int idx;
+
+	if (!drm_dev_enter(&cirrus->dev, &idx))
+		return;
 
 	if (state->fb && cirrus->format != cirrus_format(state->fb))
 		cirrus_mode_set(cirrus, &crtc->mode, state->fb);
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
 		cirrus_fb_blit_rect(state->fb, &shadow_plane_state->data[0], &rect);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_simple_display_pipe_funcs cirrus_pipe_funcs = {
-- 
2.39.1

