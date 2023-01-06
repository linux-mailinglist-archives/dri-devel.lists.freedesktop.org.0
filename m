Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A265FE01
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 10:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A14E10E845;
	Fri,  6 Jan 2023 09:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B9410E845
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 09:34:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ECBAD24742;
 Fri,  6 Jan 2023 09:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672997638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VIVcywoeFnpyXfwm6p5A/RLOZscdU3JQ4IiPfZz9MPI=;
 b=AZCLWuRer0t3aSO/evMRoc2S/Fs/E7QbrXru0NF3/Ts9Hf2Ujl09BgZC5fa4WfZXvPR7D3
 EnClB8kjI9XNHzj7pyvzWemGpEK1giW3UixcSkeAxNm3OD/vzjOV1IuIdZ/AAQwKsgioIx
 oZ2hub0Yu2Pj8fN9OnwHsmYQFL4VIYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672997638;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VIVcywoeFnpyXfwm6p5A/RLOZscdU3JQ4IiPfZz9MPI=;
 b=++/95IOgKNueXQbgWNENGQxbwU1yW2+mWUzu12/IhgEfTTzEv11LwviGl24f2UkJ/0xt/O
 /HEpomDd8ws/3eAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B730413596;
 Fri,  6 Jan 2023 09:33:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zLG5Kwbrt2P2agAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Jan 2023 09:33:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, mcanal@igalia.com, steev@kali.org,
 dmitry.baryshkov@linaro.org, javierm@redhat.com, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH][RFC] drm/fb-helper: Replace bpp/depth parameter by color mode
Date: Fri,  6 Jan 2023 10:33:57 +0100
Message-Id: <20230106093357.22009-1-tzimmermann@suse.de>
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c     | 64 ++++++++++++++++-------------
 drivers/gpu/drm/drm_fbdev_generic.c |  5 ---
 drivers/gpu/drm/tiny/ofdrm.c        |  7 +++-
 drivers/gpu/drm/tiny/simpledrm.c    |  7 +++-
 4 files changed, 47 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 1369ca4ae39b..8dcbe3693fc0 100644
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
@@ -1784,14 +1781,14 @@ static uint32_t drm_fb_helper_find_cmdline_format(struct drm_fb_helper *fb_helpe
 		depth = 24;
 		break;
 	default:
-		drm_info(dev, "unsupported bpp value of %d\n", cmdline_mode->bpp);
+		drm_info(dev, "unsupported color mode of %d\n", color_mode);
 		return DRM_FORMAT_INVALID;
 	}
 
 	return drm_fb_helper_find_format(fb_helper, formats, format_count, bpp, depth);
 }
 
-static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferred_bpp,
+static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, unsigned int color_mode,
 				      struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
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
+								      color_mode);
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
+		surface_format = DRM_FORMAT_XRGB8888;
 	}
 
 	info = drm_format_info(surface_format);
@@ -1899,7 +1902,7 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int prefe
 	return 0;
 }
 
-static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferred_bpp,
+static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, unsigned int color_mode,
 				    struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
@@ -1908,7 +1911,7 @@ static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferr
 	int ret;
 
 	mutex_lock(&client->modeset_mutex);
-	ret = __drm_fb_helper_find_sizes(fb_helper, preferred_bpp, sizes);
+	ret = __drm_fb_helper_find_sizes(fb_helper, color_mode, sizes);
 	mutex_unlock(&client->modeset_mutex);
 
 	if (ret)
@@ -1931,13 +1934,13 @@ static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferr
  * the ->fb_probe callback.
  */
 static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
-					 int preferred_bpp)
+					 unsigned int color_mode)
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_fb_helper_surface_size sizes;
 	int ret;
 
-	ret = drm_fb_helper_find_sizes(fb_helper, preferred_bpp, &sizes);
+	ret = drm_fb_helper_find_sizes(fb_helper, color_mode, &sizes);
 	if (ret) {
 		/* First time: disable all crtc's.. */
 		if (!fb_helper->deferred_setup)
@@ -2116,7 +2119,7 @@ static void drm_setup_crtcs_fb(struct drm_fb_helper *fb_helper)
 /* Note: Drops fb_helper->lock before returning. */
 static int
 __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
-					  int bpp_sel)
+					  unsigned int color_mode)
 {
 	struct drm_device *dev = fb_helper->dev;
 	struct fb_info *info;
@@ -2127,10 +2130,10 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
 	height = dev->mode_config.max_height;
 
 	drm_client_modeset_probe(&fb_helper->client, width, height);
-	ret = drm_fb_helper_single_fb_probe(fb_helper, bpp_sel);
+	ret = drm_fb_helper_single_fb_probe(fb_helper, color_mode);
 	if (ret < 0) {
 		if (ret == -EAGAIN) {
-			fb_helper->preferred_bpp = bpp_sel;
+			fb_helper->preferred_bpp = color_mode;
 			fb_helper->deferred_setup = true;
 			ret = 0;
 		}
@@ -2176,7 +2179,7 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
 /**
  * drm_fb_helper_initial_config - setup a sane initial connector configuration
  * @fb_helper: fb_helper device struct
- * @bpp_sel: bpp value to use for the framebuffer configuration
+ * @color_mode: color mode to use for the framebuffer configuration
  *
  * Scans the CRTCs and connectors and tries to put together an initial setup.
  * At the moment, this is a cloned configuration across all heads with
@@ -2214,15 +2217,18 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
  * RETURNS:
  * Zero if everything went ok, nonzero otherwise.
  */
-int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper, int bpp_sel)
+int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper, int color_mode)
 {
 	int ret;
 
 	if (!drm_fbdev_emulation)
 		return 0;
 
+	if (color_mode < 0)
+		return -EINVAL; // TODO: update function to use unsigned int
+
 	mutex_lock(&fb_helper->lock);
-	ret = __drm_fb_helper_initial_config_and_unlock(fb_helper, bpp_sel);
+	ret = __drm_fb_helper_initial_config_and_unlock(fb_helper, color_mode);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 0a4c160e0e58..db8c06402e47 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -478,11 +478,6 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
 	 * will select XRGB8888 for the framebuffer formats. All drivers
 	 * have to support XRGB8888 for backwards compatibility with legacy
 	 * userspace, so it's the safe choice here.
-	 *
-	 * TODO: Replace struct drm_mode_config.preferred_depth and this
-	 *       bpp value with a preferred format that is given as struct
-	 *       drm_format_info. Then derive all other values from the
-	 *       format.
 	 */
 	if (!preferred_bpp)
 		preferred_bpp = 32;
diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 39c5fd463fec..745a8b44517f 100644
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
+	color_mode = drm_format_info_bpp(sdev->format, 0);
+	if (color_mode == 16)
+		color_mode = sdev->format->depth; // can be 15 or 16
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

