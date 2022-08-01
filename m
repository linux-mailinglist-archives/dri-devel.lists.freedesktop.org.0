Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED41586C60
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 15:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53179C333C;
	Mon,  1 Aug 2022 13:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB77CC064D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:50:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A19CA4DF1A;
 Mon,  1 Aug 2022 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659361831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaaM+xgobQWgNInC0yxql3Y0zIhJUL3KoKKh1C+ERwU=;
 b=dWOVKLeU0VcnVIKagw67FeH8sCjcFMQLjMEBboPxqjOQpx9Gncr8ND/9j5W1RRDAPu1SOB
 tbPE7KpjnGl+hOnDgnQ08O3tXX5SnOnT5kNpGuZXFfcE156qFC1VhQro5noPfKaGHW5e97
 tQlii/rPg/wmgx4NN7BL/WcL1KlzQt0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659361831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kaaM+xgobQWgNInC0yxql3Y0zIhJUL3KoKKh1C+ERwU=;
 b=WNfVcTB+iyJsewhBByGC6LFt0+QImu0sWcR2vV2xcRlJh7dUUdxftpCh9dIpNu4s2UQEwP
 aYvfNHgG/vvnHsBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7727913A72;
 Mon,  1 Aug 2022 13:50:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YFEtHCfa52IDRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Aug 2022 13:50:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, geert@linux-m68k.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 2/5] drm/simpledrm: Inline device-init helpers
Date: Mon,  1 Aug 2022 15:50:25 +0200
Message-Id: <20220801135028.30647-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220801135028.30647-1-tzimmermann@suse.de>
References: <20220801135028.30647-1-tzimmermann@suse.de>
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

Inline the helpers for initializing the hardware FB, the memory
management and the modesetting into the device-creation function.
No functional changes.

In the original code, init helpers depended on values from other
init helpers. Inlining the functions ensures that steps are taken
in the correct order. It's also easier to see what happens. The
device is simple enough to be set up in one function. Only clocks
and regulators are still set up in their own helpers, as their
presence is system dependent.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 291 ++++++++++++++-----------------
 1 file changed, 128 insertions(+), 163 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index c5a0dabfb6df..f458e8bec63e 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -449,119 +449,6 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 }
 #endif
 
-/*
- *  Simplefb settings
- */
-
-static struct drm_display_mode simpledrm_mode(unsigned int width,
-					      unsigned int height)
-{
-	struct drm_display_mode mode = { SIMPLEDRM_MODE(width, height) };
-
-	mode.clock = mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;
-	drm_mode_set_name(&mode);
-
-	return mode;
-}
-
-static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
-{
-	int width, height, stride;
-	const struct drm_format_info *format;
-	struct drm_device *dev = &sdev->dev;
-	struct platform_device *pdev = sdev->pdev;
-	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
-	struct device_node *of_node = pdev->dev.of_node;
-
-	if (pd) {
-		width = simplefb_get_width_pd(dev, pd);
-		if (width < 0)
-			return width;
-		height = simplefb_get_height_pd(dev, pd);
-		if (height < 0)
-			return height;
-		stride = simplefb_get_stride_pd(dev, pd);
-		if (stride < 0)
-			return stride;
-		format = simplefb_get_format_pd(dev, pd);
-		if (IS_ERR(format))
-			return PTR_ERR(format);
-	} else if (of_node) {
-		width = simplefb_get_width_of(dev, of_node);
-		if (width < 0)
-			return width;
-		height = simplefb_get_height_of(dev, of_node);
-		if (height < 0)
-			return height;
-		stride = simplefb_get_stride_of(dev, of_node);
-		if (stride < 0)
-			return stride;
-		format = simplefb_get_format_of(dev, of_node);
-		if (IS_ERR(format))
-			return PTR_ERR(format);
-	} else {
-		drm_err(dev, "no simplefb configuration found\n");
-		return -ENODEV;
-	}
-
-	sdev->mode = simpledrm_mode(width, height);
-	sdev->format = format;
-	sdev->pitch = stride;
-
-	drm_dbg_kms(dev, "display mode={" DRM_MODE_FMT "}\n",
-		    DRM_MODE_ARG(&sdev->mode));
-	drm_dbg_kms(dev,
-		    "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
-		    &format->format, width, height, stride);
-
-	return 0;
-}
-
-/*
- * Memory management
- */
-
-static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
-{
-	struct drm_device *dev = &sdev->dev;
-	struct platform_device *pdev = sdev->pdev;
-	struct resource *res, *mem;
-	void __iomem *screen_base;
-	int ret;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-
-	ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
-	if (ret) {
-		drm_err(dev, "could not acquire memory range %pr: error %d\n",
-			res, ret);
-		return ret;
-	}
-
-	mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res),
-				      sdev->dev.driver->name);
-	if (!mem) {
-		/*
-		 * We cannot make this fatal. Sometimes this comes from magic
-		 * spaces our resource handlers simply don't know about. Use
-		 * the I/O-memory resource as-is and try to map that instead.
-		 */
-		drm_warn(dev, "could not acquire memory region %pr\n", res);
-		mem = res;
-	}
-
-	screen_base = devm_ioremap_wc(&pdev->dev, mem->start,
-				      resource_size(mem));
-	if (!screen_base)
-		return -ENOMEM;
-
-	sdev->screen_base = screen_base;
-
-	return 0;
-}
-
 /*
  * Modesetting
  */
@@ -738,6 +625,21 @@ static const struct drm_mode_config_funcs simpledrm_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+/*
+ * Init / Cleanup
+ */
+
+static struct drm_display_mode simpledrm_mode(unsigned int width,
+					      unsigned int height)
+{
+	struct drm_display_mode mode = { SIMPLEDRM_MODE(width, height) };
+
+	mode.clock = mode.hdisplay * mode.vdisplay * 60 / 1000 /* kHz */;
+	drm_mode_set_name(&mode);
+
+	return mode;
+}
+
 static const uint32_t *simpledrm_device_formats(struct simpledrm_device *sdev,
 						size_t *nformats_out)
 {
@@ -777,88 +679,151 @@ static const uint32_t *simpledrm_device_formats(struct simpledrm_device *sdev,
 	return sdev->formats;
 }
 
-static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
+static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
+							struct platform_device *pdev)
 {
-	struct drm_device *dev = &sdev->dev;
-	struct drm_display_mode *mode = &sdev->mode;
-	struct drm_connector *connector = &sdev->connector;
-	struct drm_simple_display_pipe *pipe = &sdev->pipe;
+	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
+	struct device_node *of_node = pdev->dev.of_node;
+	struct simpledrm_device *sdev;
+	struct drm_device *dev;
+	int width, height, stride;
+	const struct drm_format_info *format;
+	struct resource *res, *mem;
+	void __iomem *screen_base;
+	struct drm_connector *connector;
+	struct drm_simple_display_pipe *pipe;
 	unsigned long max_width, max_height;
 	const uint32_t *formats;
 	size_t nformats;
 	int ret;
 
+	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simpledrm_device, dev);
+	if (IS_ERR(sdev))
+		return ERR_CAST(sdev);
+	dev = &sdev->dev;
+	sdev->pdev = pdev;
+	platform_set_drvdata(pdev, sdev);
+
+	/*
+	 * Hardware settings
+	 */
+
+	ret = simpledrm_device_init_clocks(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+	ret = simpledrm_device_init_regulators(sdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (pd) {
+		width = simplefb_get_width_pd(dev, pd);
+		if (width < 0)
+			return ERR_PTR(width);
+		height = simplefb_get_height_pd(dev, pd);
+		if (height < 0)
+			return ERR_PTR(height);
+		stride = simplefb_get_stride_pd(dev, pd);
+		if (stride < 0)
+			return ERR_PTR(stride);
+		format = simplefb_get_format_pd(dev, pd);
+		if (IS_ERR(format))
+			return ERR_CAST(format);
+	} else if (of_node) {
+		width = simplefb_get_width_of(dev, of_node);
+		if (width < 0)
+			return ERR_PTR(width);
+		height = simplefb_get_height_of(dev, of_node);
+		if (height < 0)
+			return ERR_PTR(height);
+		stride = simplefb_get_stride_of(dev, of_node);
+		if (stride < 0)
+			return ERR_PTR(stride);
+		format = simplefb_get_format_of(dev, of_node);
+		if (IS_ERR(format))
+			return ERR_CAST(format);
+	} else {
+		drm_err(dev, "no simplefb configuration found\n");
+		return ERR_PTR(-ENODEV);
+	}
+	sdev->mode = simpledrm_mode(width, height);
+	sdev->format = format;
+	sdev->pitch = stride;
+
+	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sdev->mode));
+	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
+		&format->format, width, height, stride);
+
+	/*
+	 * Memory management
+	 */
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return ERR_PTR(-EINVAL);
+
+	ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
+	if (ret) {
+		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, ret);
+		return ERR_PTR(ret);
+	}
+
+	mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res), drv->name);
+	if (!mem) {
+		/*
+		 * We cannot make this fatal. Sometimes this comes from magic
+		 * spaces our resource handlers simply don't know about. Use
+		 * the I/O-memory resource as-is and try to map that instead.
+		 */
+		drm_warn(dev, "could not acquire memory region %pr\n", res);
+		mem = res;
+	}
+
+	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
+	if (!screen_base)
+		return ERR_PTR(-ENOMEM);
+	sdev->screen_base = screen_base;
+
+	/*
+	 * Modesetting
+	 */
+
 	ret = drmm_mode_config_init(dev);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
-	max_width = max_t(unsigned long, mode->hdisplay, DRM_SHADOW_PLANE_MAX_WIDTH);
-	max_height = max_t(unsigned long, mode->vdisplay, DRM_SHADOW_PLANE_MAX_HEIGHT);
+	max_width = max_t(unsigned long, width, DRM_SHADOW_PLANE_MAX_WIDTH);
+	max_height = max_t(unsigned long, height, DRM_SHADOW_PLANE_MAX_HEIGHT);
 
-	dev->mode_config.min_width = mode->hdisplay;
+	dev->mode_config.min_width = width;
 	dev->mode_config.max_width = max_width;
-	dev->mode_config.min_height = mode->vdisplay;
+	dev->mode_config.min_height = height;
 	dev->mode_config.max_height = max_height;
-	dev->mode_config.preferred_depth = sdev->format->cpp[0] * 8;
+	dev->mode_config.preferred_depth = format->cpp[0] * 8;
 	dev->mode_config.funcs = &simpledrm_mode_config_funcs;
 
+	connector = &sdev->connector;
 	ret = drm_connector_init(dev, connector, &simpledrm_connector_funcs,
 				 DRM_MODE_CONNECTOR_Unknown);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 	drm_connector_helper_add(connector, &simpledrm_connector_helper_funcs);
 	drm_connector_set_panel_orientation_with_quirk(connector,
 						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
-						       mode->hdisplay, mode->vdisplay);
+						       width, height);
 
 	formats = simpledrm_device_formats(sdev, &nformats);
 
+	pipe = &sdev->pipe;
 	ret = drm_simple_display_pipe_init(dev, pipe, &simpledrm_simple_display_pipe_funcs,
 					   formats, nformats, simpledrm_format_modifiers,
 					   connector);
 	if (ret)
-		return ret;
+		return ERR_PTR(ret);
 
 	drm_plane_enable_fb_damage_clips(&pipe->plane);
 
 	drm_mode_config_reset(dev);
 
-	return 0;
-}
-
-/*
- * Init / Cleanup
- */
-
-static struct simpledrm_device *
-simpledrm_device_create(struct drm_driver *drv, struct platform_device *pdev)
-{
-	struct simpledrm_device *sdev;
-	int ret;
-
-	sdev = devm_drm_dev_alloc(&pdev->dev, drv, struct simpledrm_device,
-				  dev);
-	if (IS_ERR(sdev))
-		return ERR_CAST(sdev);
-	sdev->pdev = pdev;
-	platform_set_drvdata(pdev, sdev);
-
-	ret = simpledrm_device_init_clocks(sdev);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = simpledrm_device_init_regulators(sdev);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = simpledrm_device_init_fb(sdev);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = simpledrm_device_init_mm(sdev);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = simpledrm_device_init_modeset(sdev);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return sdev;
 }
 
-- 
2.37.1

