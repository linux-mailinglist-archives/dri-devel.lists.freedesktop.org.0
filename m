Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C3698066
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A3E10EACF;
	Wed, 15 Feb 2023 16:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4E510E580
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 16:15:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CBBD533744;
 Wed, 15 Feb 2023 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676477722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyu8khKOgc4qqreKLhcnNC0DSrsoyv00Sw+7FE3xizY=;
 b=raA0uq4xcCy+5rByB5ahKLOjwbNuqv6GwYTgLHw0rUQwnodba7ETLWEUAL9KyxtZZM+PDf
 q0qQkHSjE2tmS94+Df0YdKpn44tw04CKYhND56x1BZc+5t4/kQfousT/HwANSyiZXUI7nu
 dmkBvNlfXLEU/scXXqgUx/5qwbyCI7U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676477722;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyu8khKOgc4qqreKLhcnNC0DSrsoyv00Sw+7FE3xizY=;
 b=zEBumgpFUSdFYWzfsxCo3UIkQEPPloxxshCfrkTdrt0pIeVyp2tXBEqsbyCgr89zB+QLqF
 EdDAzKNS5FBLtDAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ED844134BA;
 Wed, 15 Feb 2023 16:15:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ILzxNhkF7WNHOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Feb 2023 16:15:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 02/17] drm/cirrus: Replace cpp value with format
Date: Wed, 15 Feb 2023 17:15:02 +0100
Message-Id: <20230215161517.5113-3-tzimmermann@suse.de>
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

Using components per pixel to describe a color format is obsolete.
Use the format info and 4CC value instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/cirrus.c | 50 ++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 7fb21db8416d..67e83fa42a32 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -58,7 +58,7 @@ struct cirrus_device {
 	struct drm_device	       dev;
 	struct drm_simple_display_pipe pipe;
 	struct drm_connector	       conn;
-	unsigned int		       cpp;
+	const struct drm_format_info   *format;
 	unsigned int		       pitch;
 	void __iomem		       *vram;
 	void __iomem		       *mmio;
@@ -126,34 +126,34 @@ static void wreg_hdr(struct cirrus_device *cirrus, u8 val)
 	iowrite8(val, cirrus->mmio + VGA_DAC_MASK);
 }
 
-static int cirrus_convert_to(struct drm_framebuffer *fb)
+static const struct drm_format_info *cirrus_convert_to(struct drm_framebuffer *fb)
 {
-	if (fb->format->cpp[0] == 4 && fb->pitches[0] > CIRRUS_MAX_PITCH) {
+	if (fb->format->format == DRM_FORMAT_XRGB8888 && fb->pitches[0] > CIRRUS_MAX_PITCH) {
 		if (fb->width * 3 <= CIRRUS_MAX_PITCH)
 			/* convert from XR24 to RG24 */
-			return 3;
+			return drm_format_info(DRM_FORMAT_RGB888);
 		else
 			/* convert from XR24 to RG16 */
-			return 2;
+			return drm_format_info(DRM_FORMAT_RGB565);
 	}
-	return 0;
+	return NULL;
 }
 
-static int cirrus_cpp(struct drm_framebuffer *fb)
+static const struct drm_format_info *cirrus_format(struct drm_framebuffer *fb)
 {
-	int convert_cpp = cirrus_convert_to(fb);
+	const struct drm_format_info *format = cirrus_convert_to(fb);
 
-	if (convert_cpp)
-		return convert_cpp;
-	return fb->format->cpp[0];
+	if (format)
+		return format;
+	return fb->format;
 }
 
 static int cirrus_pitch(struct drm_framebuffer *fb)
 {
-	int convert_cpp = cirrus_convert_to(fb);
+	const struct drm_format_info *format = cirrus_convert_to(fb);
 
-	if (convert_cpp)
-		return convert_cpp * fb->width;
+	if (format)
+		return drm_format_info_min_pitch(format, 0, fb->width);
 	return fb->pitches[0];
 }
 
@@ -263,20 +263,20 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 	sr07 &= 0xe0;
 	hdr = 0;
 
-	cirrus->cpp = cirrus_cpp(fb);
-	switch (cirrus->cpp * 8) {
-	case 8:
+	cirrus->format = cirrus_format(fb);
+	switch (cirrus->format->format) {
+	case DRM_FORMAT_C8:
 		sr07 |= 0x11;
 		break;
-	case 16:
+	case DRM_FORMAT_RGB565:
 		sr07 |= 0x17;
 		hdr = 0xc1;
 		break;
-	case 24:
+	case DRM_FORMAT_RGB888:
 		sr07 |= 0x15;
 		hdr = 0xc5;
 		break;
-	case 32:
+	case DRM_FORMAT_XRGB8888:
 		sr07 |= 0x19;
 		hdr = 0xc5;
 		break;
@@ -329,13 +329,15 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
 	iosys_map_set_vaddr_iomem(&dst, cirrus->vram);
 	iosys_map_incr(&dst, drm_fb_clip_offset(cirrus->pitch, fb->format, rect));
 
-	if (cirrus->cpp == fb->format->cpp[0]) {
+	if (cirrus->format == fb->format) {
 		drm_fb_memcpy(&dst, fb->pitches, vmap, fb, rect);
 
-	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2) {
+	} else if (fb->format->format == DRM_FORMAT_XRGB8888 &&
+		   cirrus->format->format == DRM_FORMAT_RGB565) {
 		drm_fb_xrgb8888_to_rgb565(&dst, &cirrus->pitch, vmap, fb, rect, false);
 
-	} else if (fb->format->cpp[0] == 4 && cirrus->cpp == 3) {
+	} else if (fb->format->format == DRM_FORMAT_XRGB8888 &&
+		   cirrus->format->format == DRM_FORMAT_RGB565) {
 		drm_fb_xrgb8888_to_rgb888(&dst, &cirrus->pitch, vmap, fb, rect);
 
 	} else {
@@ -450,7 +452,7 @@ static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_crtc *crtc = &pipe->crtc;
 	struct drm_rect rect;
 
-	if (state->fb && cirrus->cpp != cirrus_cpp(state->fb))
+	if (state->fb && cirrus->format != cirrus_format(state->fb))
 		cirrus_mode_set(cirrus, &crtc->mode, state->fb);
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-- 
2.39.1

