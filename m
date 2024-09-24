Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E76983DC1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9617E10E4E7;
	Tue, 24 Sep 2024 07:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IVQNBKbL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Z26biKS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IVQNBKbL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6Z26biKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0C810E4E3;
 Tue, 24 Sep 2024 07:17:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 47AB91FBDD;
 Tue, 24 Sep 2024 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPrLhl15Yx9mzoVd22qY9GeieA1ObVSqEHVL3eupvM4=;
 b=IVQNBKbLdxN665QYqFb7C995SIT2boCa2xPpUyFjJNdtlX/3AgooSbECXLkLLkeaL6tE5p
 FXHKMMufwlnZNaWdWskVnL9WIAQmjnimuQNbnWPaaBfXdMf4cjzRDxW98xA5qthxbRPV/f
 Nq4cmasOn6g3VUM5sLo3mRO2F1CLJ7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPrLhl15Yx9mzoVd22qY9GeieA1ObVSqEHVL3eupvM4=;
 b=6Z26biKS2ibDK+arnYRCUyyt2Cxv0wgwt1qYDYiO+SZLx11wv8F8jjYQ90mVHveKWGpsTa
 c4mnxqo/ZwnPJTBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727162259; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPrLhl15Yx9mzoVd22qY9GeieA1ObVSqEHVL3eupvM4=;
 b=IVQNBKbLdxN665QYqFb7C995SIT2boCa2xPpUyFjJNdtlX/3AgooSbECXLkLLkeaL6tE5p
 FXHKMMufwlnZNaWdWskVnL9WIAQmjnimuQNbnWPaaBfXdMf4cjzRDxW98xA5qthxbRPV/f
 Nq4cmasOn6g3VUM5sLo3mRO2F1CLJ7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727162259;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPrLhl15Yx9mzoVd22qY9GeieA1ObVSqEHVL3eupvM4=;
 b=6Z26biKS2ibDK+arnYRCUyyt2Cxv0wgwt1qYDYiO+SZLx11wv8F8jjYQ90mVHveKWGpsTa
 c4mnxqo/ZwnPJTBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06AFE13AE2;
 Tue, 24 Sep 2024 07:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aIpxAJNn8mb3YAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Sep 2024 07:17:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jfalempe@redhat.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 01/80] drm/fbdev-helper: Move color-mode lookup into 4CC
 format helper
Date: Tue, 24 Sep 2024 09:11:59 +0200
Message-ID: <20240924071734.98201-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924071734.98201-1-tzimmermann@suse.de>
References: <20240924071734.98201-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[10];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 TAGGED_RCPT(0.00)[renesas]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

The color mode as specified on the kernel command line gives the user's
preferred color depth and number of bits per pixel. Move the
color-mode-to-format conversion from fbdev helpers into a 4CC helper,
so that it can be shared among DRM clients.

v2:
- fix grammar in commit message (Laurent)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 70 +++++++--------------------------
 drivers/gpu/drm/drm_fourcc.c    | 30 +++++++++++++-
 include/drm/drm_fourcc.h        |  1 +
 3 files changed, 45 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 29c53f9f449c..af1fe79c701d 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1441,67 +1441,27 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 EXPORT_SYMBOL(drm_fb_helper_pan_display);
 
 static uint32_t drm_fb_helper_find_format(struct drm_fb_helper *fb_helper, const uint32_t *formats,
-					  size_t format_count, uint32_t bpp, uint32_t depth)
+					  size_t format_count, unsigned int color_mode)
 {
 	struct drm_device *dev = fb_helper->dev;
 	uint32_t format;
 	size_t i;
 
-	/*
-	 * Do not consider YUV or other complicated formats
-	 * for framebuffers. This means only legacy formats
-	 * are supported (fmt->depth is a legacy field), but
-	 * the framebuffer emulation can only deal with such
-	 * formats, specifically RGB/BGA formats.
-	 */
-	format = drm_mode_legacy_fb_format(bpp, depth);
-	if (!format)
-		goto err;
+	format = drm_driver_color_mode_format(dev, color_mode);
+	if (!format) {
+		drm_info(dev, "unsupported color mode of %d\n", color_mode);
+		return DRM_FORMAT_INVALID;
+	}
 
 	for (i = 0; i < format_count; ++i) {
 		if (formats[i] == format)
 			return format;
 	}
-
-err:
-	/* We found nothing. */
-	drm_warn(dev, "bpp/depth value of %u/%u not supported\n", bpp, depth);
+	drm_warn(dev, "format %p4cc not supported\n", &format);
 
 	return DRM_FORMAT_INVALID;
 }
 
-static uint32_t drm_fb_helper_find_color_mode_format(struct drm_fb_helper *fb_helper,
-						     const uint32_t *formats, size_t format_count,
-						     unsigned int color_mode)
-{
-	struct drm_device *dev = fb_helper->dev;
-	uint32_t bpp, depth;
-
-	switch (color_mode) {
-	case 1:
-	case 2:
-	case 4:
-	case 8:
-	case 16:
-	case 24:
-		bpp = depth = color_mode;
-		break;
-	case 15:
-		bpp = 16;
-		depth = 15;
-		break;
-	case 32:
-		bpp = 32;
-		depth = 24;
-		break;
-	default:
-		drm_info(dev, "unsupported color mode of %d\n", color_mode);
-		return DRM_FORMAT_INVALID;
-	}
-
-	return drm_fb_helper_find_format(fb_helper, formats, format_count, bpp, depth);
-}
-
 static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 				      struct drm_fb_helper_surface_size *sizes)
 {
@@ -1531,10 +1491,10 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 			if (!cmdline_mode->bpp_specified)
 				continue;
 
-			surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
-									      plane->format_types,
-									      plane->format_count,
-									      cmdline_mode->bpp);
+			surface_format = drm_fb_helper_find_format(fb_helper,
+								   plane->format_types,
+								   plane->format_count,
+								   cmdline_mode->bpp);
 			if (surface_format != DRM_FORMAT_INVALID)
 				break; /* found supported format */
 		}
@@ -1544,10 +1504,10 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 			break; /* found supported format */
 
 		/* try preferred color mode */
-		surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
-								      plane->format_types,
-								      plane->format_count,
-								      fb_helper->preferred_bpp);
+		surface_format = drm_fb_helper_find_format(fb_helper,
+							   plane->format_types,
+							   plane->format_count,
+							   fb_helper->preferred_bpp);
 		if (surface_format != DRM_FORMAT_INVALID)
 			break; /* found supported format */
 	}
diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 193cf8ed7912..3a94ca211f9c 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -36,7 +36,6 @@
  * @depth: bit depth per pixel
  *
  * Computes a drm fourcc pixel format code for the given @bpp/@depth values.
- * Useful in fbdev emulation code, since that deals in those values.
  */
 uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint32_t depth)
 {
@@ -140,6 +139,35 @@ uint32_t drm_driver_legacy_fb_format(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_driver_legacy_fb_format);
 
+/**
+ * drm_driver_color_mode_format - Compute DRM 4CC code from color mode
+ * @dev: DRM device
+ * @color_mode: command-line color mode
+ *
+ * Computes a DRM 4CC pixel format code for the given color mode using
+ * drm_driver_color_mode(). The color mode is in the format used and the
+ * kernel command line. It specifies the number of bits per pixel
+ * and color depth in a single value.
+ *
+ * Useful in fbdev emulation code, since that deals in those values. The
+ * helper does not consider YUV or other complicated formats. This means
+ * only legacy formats are supported (fmt->depth is a legacy field), but
+ * the framebuffer emulation can only deal with such formats, specifically
+ * RGB/BGA formats.
+ */
+uint32_t drm_driver_color_mode_format(struct drm_device *dev, unsigned int color_mode)
+{
+	switch (color_mode) {
+	case 15:
+		return drm_driver_legacy_fb_format(dev, 16, 15);
+	case 32:
+		return drm_driver_legacy_fb_format(dev, 32, 24);
+	default:
+		return drm_driver_legacy_fb_format(dev, color_mode, color_mode);
+	}
+}
+EXPORT_SYMBOL(drm_driver_color_mode_format);
+
 /*
  * Internal function to query information for a given format. See
  * drm_format_info() for the public API.
diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index ccf91daa4307..c3f4405d6662 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -313,6 +313,7 @@ drm_get_format_info(struct drm_device *dev,
 uint32_t drm_mode_legacy_fb_format(uint32_t bpp, uint32_t depth);
 uint32_t drm_driver_legacy_fb_format(struct drm_device *dev,
 				     uint32_t bpp, uint32_t depth);
+uint32_t drm_driver_color_mode_format(struct drm_device *dev, unsigned int color_mode);
 unsigned int drm_format_info_block_width(const struct drm_format_info *info,
 					 int plane);
 unsigned int drm_format_info_block_height(const struct drm_format_info *info,
-- 
2.46.0

