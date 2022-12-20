Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA9F652468
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A1910E0E8;
	Tue, 20 Dec 2022 16:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DB710E37D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 16:12:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D43FC76492;
 Tue, 20 Dec 2022 16:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671552711; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwKDZ7L7dzwUpdldpIk7p3hjaKS1oeqU1DlDlETZDCg=;
 b=rd3ZZzRsQzXzA/dQ9oEwmkP2qnuqTn9CKEywvg7oqk7HwvN6z7g/hTMHhpAnBAGolZddss
 a01II64EgkOxBRsbAbvI+rsWBauRMK86RujtK6dJ0H7p7fuYc0L0pQCv0sPZTy6LcIkper
 kpnVmNudTjfKJqF7jy41QHOOyqecsoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671552711;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwKDZ7L7dzwUpdldpIk7p3hjaKS1oeqU1DlDlETZDCg=;
 b=YYda0/CgYJcSVIvvWBLxJQ4MStAuah1fRjCPUoAWF9J6/rsueykuTIJCslv6sW9xBPlftT
 gX6GyLq05IeVcuBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4B3B13910;
 Tue, 20 Dec 2022 16:11:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cK5fJ8feoWMiZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Dec 2022 16:11:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 11/13] drm/fb-helper: Fix single-probe color-format
 selection
Date: Tue, 20 Dec 2022 17:11:43 +0100
Message-Id: <20221220161145.27568-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220161145.27568-1-tzimmermann@suse.de>
References: <20221220161145.27568-1-tzimmermann@suse.de>
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

Fix the color-format selection of the single-probe helper. Go
through all user-specified values and test each for compatibility
with the driver. If none is supported, use the driver-provided
default. This guarantees that the console is always available in
any color format at least.

Until now, the format selection of the single-probe helper tried
to either use a user-specified format or a 32-bit default format.
If the user-specified format was not supported by the driver, the
selection failed and the display remained blank.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 172 +++++++++++++++++---------------
 1 file changed, 94 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index af1495394d38..1369ca4ae39b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1726,6 +1726,70 @@ int drm_fb_helper_pan_display(struct fb_var_screeninfo *var,
 }
 EXPORT_SYMBOL(drm_fb_helper_pan_display);
 
+static uint32_t drm_fb_helper_find_format(struct drm_fb_helper *fb_helper, const uint32_t *formats,
+					  size_t format_count, uint32_t bpp, uint32_t depth)
+{
+	struct drm_device *dev = fb_helper->dev;
+	uint32_t format;
+	size_t i;
+
+	/*
+	 * Do not consider YUV or other complicated formats
+	 * for framebuffers. This means only legacy formats
+	 * are supported (fmt->depth is a legacy field), but
+	 * the framebuffer emulation can only deal with such
+	 * formats, specifically RGB/BGA formats.
+	 */
+	format = drm_mode_legacy_fb_format(bpp, depth);
+	if (!format)
+		goto err;
+
+	for (i = 0; i < format_count; ++i) {
+		if (formats[i] == format)
+			return format;
+	}
+
+err:
+	/* We found nothing. */
+	drm_warn(dev, "bpp/depth value of %u/%u not supported\n", bpp, depth);
+
+	return DRM_FORMAT_INVALID;
+}
+
+static uint32_t drm_fb_helper_find_cmdline_format(struct drm_fb_helper *fb_helper,
+						  const uint32_t *formats, size_t format_count,
+						  const struct drm_cmdline_mode *cmdline_mode)
+{
+	struct drm_device *dev = fb_helper->dev;
+	uint32_t bpp, depth;
+
+	if (!cmdline_mode->bpp_specified)
+		return DRM_FORMAT_INVALID;
+
+	switch (cmdline_mode->bpp) {
+	case 1:
+	case 2:
+	case 4:
+	case 8:
+	case 16:
+	case 24:
+		bpp = depth = cmdline_mode->bpp;
+		break;
+	case 15:
+		bpp = 16;
+		depth = 15;
+		break;
+	case 32:
+		bpp = 32;
+		depth = 24;
+		break;
+	default:
+		drm_info(dev, "unsupported bpp value of %d\n", cmdline_mode->bpp);
+		return DRM_FORMAT_INVALID;
+	}
+
+	return drm_fb_helper_find_format(fb_helper, formats, format_count, bpp, depth);
+}
 
 static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferred_bpp,
 				      struct drm_fb_helper_surface_size *sizes)
@@ -1736,100 +1800,52 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int prefe
 	struct drm_connector_list_iter conn_iter;
 	struct drm_connector *connector;
 	struct drm_mode_set *mode_set;
-	int best_depth = 0;
+	uint32_t surface_format = DRM_FORMAT_INVALID;
+	const struct drm_format_info *info;
 
-	memset(sizes, 0, sizeof(struct drm_fb_helper_surface_size));
-	sizes->surface_depth = 24;
-	sizes->surface_bpp = 32;
+	memset(sizes, 0, sizeof(*sizes));
 	sizes->fb_width = (u32)-1;
 	sizes->fb_height = (u32)-1;
 
-	/*
-	 * If driver picks 8 or 16 by default use that for both depth/bpp
-	 * to begin with
-	 */
-	if (preferred_bpp != sizes->surface_bpp)
-		sizes->surface_depth = sizes->surface_bpp = preferred_bpp;
-
-	drm_connector_list_iter_begin(fb_helper->dev, &conn_iter);
-	drm_client_for_each_connector_iter(connector, &conn_iter) {
-		struct drm_cmdline_mode *cmdline_mode;
-
-		cmdline_mode = &connector->cmdline_mode;
-
-		if (cmdline_mode->bpp_specified) {
-			switch (cmdline_mode->bpp) {
-			case 8:
-				sizes->surface_depth = sizes->surface_bpp = 8;
-				break;
-			case 15:
-				sizes->surface_depth = 15;
-				sizes->surface_bpp = 16;
-				break;
-			case 16:
-				sizes->surface_depth = sizes->surface_bpp = 16;
-				break;
-			case 24:
-				sizes->surface_depth = sizes->surface_bpp = 24;
-				break;
-			case 32:
-				sizes->surface_depth = 24;
-				sizes->surface_bpp = 32;
-				break;
-			}
-			break;
-		}
-	}
-	drm_connector_list_iter_end(&conn_iter);
-
-	/*
-	 * If we run into a situation where, for example, the primary plane
-	 * supports RGBA5551 (16 bpp, depth 15) but not RGB565 (16 bpp, depth
-	 * 16) we need to scale down the depth of the sizes we request.
-	 */
 	drm_client_for_each_modeset(mode_set, client) {
 		struct drm_crtc *crtc = mode_set->crtc;
 		struct drm_plane *plane = crtc->primary;
-		int j;
 
 		drm_dbg_kms(dev, "test CRTC %u primary plane\n", drm_crtc_index(crtc));
 
-		for (j = 0; j < plane->format_count; j++) {
-			const struct drm_format_info *fmt;
-
-			fmt = drm_format_info(plane->format_types[j]);
+		drm_connector_list_iter_begin(fb_helper->dev, &conn_iter);
+		drm_client_for_each_connector_iter(connector, &conn_iter) {
+			struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
 
-			/*
-			 * Do not consider YUV or other complicated formats
-			 * for framebuffers. This means only legacy formats
-			 * are supported (fmt->depth is a legacy field) but
-			 * the framebuffer emulation can only deal with such
-			 * formats, specifically RGB/BGA formats.
-			 */
-			if (fmt->depth == 0)
-				continue;
-
-			/* We found a perfect fit, great */
-			if (fmt->depth == sizes->surface_depth) {
-				best_depth = fmt->depth;
-				break;
-			}
+			surface_format = drm_fb_helper_find_cmdline_format(fb_helper,
+									   plane->format_types,
+									   plane->format_count,
+									   cmdline_mode);
+			if (surface_format != DRM_FORMAT_INVALID)
+				break; /* found supported format */
+		}
+		drm_connector_list_iter_end(&conn_iter);
 
-			/* Skip depths above what we're looking for */
-			if (fmt->depth > sizes->surface_depth)
-				continue;
+		if (surface_format != DRM_FORMAT_INVALID)
+			break; /* found supported format */
 
-			/* Best depth found so far */
-			if (fmt->depth > best_depth)
-				best_depth = fmt->depth;
-		}
+		/* try preferred bpp/depth */
+		surface_format = drm_fb_helper_find_format(fb_helper, plane->format_types,
+							   plane->format_count, preferred_bpp,
+							   dev->mode_config.preferred_depth);
+		if (surface_format != DRM_FORMAT_INVALID)
+			break; /* found supported format */
 	}
-	if (sizes->surface_depth != best_depth && best_depth) {
-		drm_info(dev, "requested bpp %d, scaled depth down to %d",
-			 sizes->surface_bpp, best_depth);
-		sizes->surface_depth = best_depth;
+
+	if (surface_format == DRM_FORMAT_INVALID) {
+		drm_warn(dev, "No compatible format found\n");
+		return -EAGAIN;
 	}
 
+	info = drm_format_info(surface_format);
+	sizes->surface_bpp = drm_format_info_bpp(info, 0);
+	sizes->surface_depth = info->depth;
+
 	/* first up get a count of crtcs now in use and new min/maxes width/heights */
 	crtc_count = 0;
 	drm_client_for_each_modeset(mode_set, client) {
-- 
2.39.0

