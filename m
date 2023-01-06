Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FAB65FE9B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 11:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6808810E856;
	Fri,  6 Jan 2023 10:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D00710E856
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 10:16:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5872224932;
 Fri,  6 Jan 2023 10:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673000207; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0YeJ9PyidcSIpCleNhIZu9zDRlCYDjXbs+633ZHALjg=;
 b=obxJ7JWwkcN2lZM5QRooZDNSHad1xvrABcPTAIIfYqjbEer7kPymK6SFrn03iQCCJkV0ex
 a8GKUlVBB87Iz1VufkAGnGQPjIV0n2R5l42YtOOLN609EaI+8cBKPHakhTv99sE3mmwGcC
 S5CRM8LkfuGQIualQKcyWleTSqCd3F0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673000207;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0YeJ9PyidcSIpCleNhIZu9zDRlCYDjXbs+633ZHALjg=;
 b=FkbWtdOek4g08C3SR0EEtAQGExxreVWKJXTSm0geJT/3kZV3G0zmuiqC3A76I1d75PWTCk
 rwMZH5i0d7LmwFCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24B78139D5;
 Fri,  6 Jan 2023 10:16:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Bon6Bw/1t2M6fwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Jan 2023 10:16:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, mcanal@igalia.com, steev@kali.org,
 dmitry.baryshkov@linaro.org, javierm@redhat.com, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v3] drm/fb-helper: Replace bpp/depth parameter by color mode
Date: Fri,  6 Jan 2023 11:16:43 +0100
Message-Id: <20230106101643.31497-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
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

Replace the combination of bpp and depth with a single color-mode
argument. Handle special cases in simpledrm and ofdrm. Hard-code
XRGB8888 as fallback format for cases where no given format works.

The color-mode argument accepts the same values as the kernel's video
parameter. These are mostly bpp values between 1 and 32. The exceptions
are 15, which has a color depth of 15 and a bpp value of 16; and 32,
which has a color depth of 24 and a bpp value of 32.

v3:
	* fix ofdrm build (Maxime)
v2:
	* minimize changes (Daniel)
	* use drm_driver_legacy_fb_format() (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c  | 39 +++++++++++++++++---------------
 drivers/gpu/drm/tiny/ofdrm.c     |  7 +++++-
 drivers/gpu/drm/tiny/simpledrm.c |  7 +++++-
 3 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 1369ca4ae39b..2feb4b0a1477 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1756,24 +1756,21 @@ static uint32_t drm_fb_helper_find_format(struct drm_fb_helper *fb_helper, const
 	return DRM_FORMAT_INVALID;
 }
 
-static uint32_t drm_fb_helper_find_cmdline_format(struct drm_fb_helper *fb_helper,
-						  const uint32_t *formats, size_t format_count,
-						  const struct drm_cmdline_mode *cmdline_mode)
+static uint32_t drm_fb_helper_find_color_mode_format(struct drm_fb_helper *fb_helper,
+						     const uint32_t *formats, size_t format_count,
+						     unsigned int color_mode)
 {
 	struct drm_device *dev = fb_helper->dev;
 	uint32_t bpp, depth;
 
-	if (!cmdline_mode->bpp_specified)
-		return DRM_FORMAT_INVALID;
-
-	switch (cmdline_mode->bpp) {
+	switch (color_mode) {
 	case 1:
 	case 2:
 	case 4:
 	case 8:
 	case 16:
 	case 24:
-		bpp = depth = cmdline_mode->bpp;
+		bpp = depth = color_mode;
 		break;
 	case 15:
 		bpp = 16;
@@ -1784,7 +1781,7 @@ static uint32_t drm_fb_helper_find_cmdline_format(struct drm_fb_helper *fb_helpe
 		depth = 24;
 		break;
 	default:
-		drm_info(dev, "unsupported bpp value of %d\n", cmdline_mode->bpp);
+		drm_info(dev, "unsupported color mode of %d\n", color_mode);
 		return DRM_FORMAT_INVALID;
 	}
 
@@ -1817,10 +1814,10 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int prefe
 		drm_client_for_each_connector_iter(connector, &conn_iter) {
 			struct drm_cmdline_mode *cmdline_mode = &connector->cmdline_mode;
 
-			surface_format = drm_fb_helper_find_cmdline_format(fb_helper,
-									   plane->format_types,
-									   plane->format_count,
-									   cmdline_mode);
+			surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
+									      plane->format_types,
+									      plane->format_count,
+									      cmdline_mode->bpp);
 			if (surface_format != DRM_FORMAT_INVALID)
 				break; /* found supported format */
 		}
@@ -1829,17 +1826,23 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int prefe
 		if (surface_format != DRM_FORMAT_INVALID)
 			break; /* found supported format */
 
-		/* try preferred bpp/depth */
-		surface_format = drm_fb_helper_find_format(fb_helper, plane->format_types,
-							   plane->format_count, preferred_bpp,
-							   dev->mode_config.preferred_depth);
+		/* try preferred color mode */
+		surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
+								      plane->format_types,
+								      plane->format_count,
+								      preferred_bpp);
 		if (surface_format != DRM_FORMAT_INVALID)
 			break; /* found supported format */
 	}
 
 	if (surface_format == DRM_FORMAT_INVALID) {
+		/*
+		 * If none of the given color modes works, fall back
+		 * to XRGB8888. Drivers are expected to provide this
+		 * format for compatibility with legacy applications.
+		 */
 		drm_warn(dev, "No compatible format found\n");
-		return -EAGAIN;
+		surface_format = drm_driver_legacy_fb_format(dev, 32, 24);
 	}
 
 	info = drm_format_info(surface_format);
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 39c5fd463fec..6e349ca42485 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -1352,6 +1352,7 @@ static int ofdrm_probe(struct platform_device *pdev)
 {
 	struct ofdrm_device *odev;
 	struct drm_device *dev;
+	unsigned int color_mode;
 	int ret;
 
 	odev = ofdrm_device_create(&ofdrm_driver, pdev);
@@ -1363,7 +1364,11 @@ static int ofdrm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, drm_format_info_bpp(odev->format, 0));
+	color_mode = drm_format_info_bpp(odev->format, 0);
+	if (color_mode == 16)
+		color_mode = odev->format->depth; // can be 15 or 16
+
+	drm_fbdev_generic_setup(dev, color_mode);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 7355617f38d3..f658b99c796a 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -802,6 +802,7 @@ static int simpledrm_probe(struct platform_device *pdev)
 {
 	struct simpledrm_device *sdev;
 	struct drm_device *dev;
+	unsigned int color_mode;
 	int ret;
 
 	sdev = simpledrm_device_create(&simpledrm_driver, pdev);
@@ -813,7 +814,11 @@ static int simpledrm_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	drm_fbdev_generic_setup(dev, drm_format_info_bpp(sdev->format, 0));
+	color_mode = drm_format_info_bpp(sdev->format, 0);
+	if (color_mode == 16)
+		color_mode = sdev->format->depth; // can be 15 or 16
+
+	drm_fbdev_generic_setup(dev, color_mode);
 
 	return 0;
 }
-- 
2.39.0

