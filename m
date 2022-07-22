Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B057FA1A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 09:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F069611386E;
	Mon, 25 Jul 2022 07:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364131125ED
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 21:32:17 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id z18so4275540qki.2
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1BGyLBuq3meNkdub1LpDqA0SaKJWYBl5yTRibnE/+hE=;
 b=kAfLZfqnVGSljWjnAtlpkQJDWBJSH4MK+UbIahboS+sE0OI+pVFANMnIulcwGJEHTB
 uvYoLI2W8mHVG1U32SdvfnHQwwlQHm5nQvuJLAtjhMuw31ks877Jvc7sfa9fKBxIpwgJ
 DCh8jn0tUYSREZ7iofhjBUZT8RfAN98RBwq8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1BGyLBuq3meNkdub1LpDqA0SaKJWYBl5yTRibnE/+hE=;
 b=36lVDdwK7FSm5FEIE6iqvpTj3xmWxmMsXcv0TO+ZgEaRBQZ8K9lMrLMPomow8tC+uQ
 NKIp/v60iwrKwV3AEhE2fTxQnIrxC2shlFZk6ADeoZlFGnR+j7J6B6zRA0dtCkAATldl
 2M5qrzTi5qfxsvKkLk2aL7RhxiYFQ+l0jx7SC5hJYGduvjG4SfWR5Gyri7WkG/dzsZio
 nAlypApOAE3M3+n5JxJ2HqsOtdl3U5soMQk3/0z6YlOT59emcVq+DeT0GHzCFmEO3wm1
 8drphx1qn69GKF2lKiCEdD1zw19kzjhEybX7s4Xl4ecGh0xa1RKrvbmGruxVY2VR0t4W
 gHNA==
X-Gm-Message-State: AJIora+vAlkQ2E9kZdXGDpIezLZhYiT/ZOYM8r+mN+HHSbXzOVaPaPZc
 rKBsgSDTcFGBXYRZ4XykFAB+hw==
X-Google-Smtp-Source: AGRyM1ueVogzyNnEKniOH7KLiF3z2/QNoYa4glGiiucBzlM+Ve+6eA+egLuG+oZNOoJZpFTWzwF++Q==
X-Received: by 2002:a37:644b:0:b0:6b5:d62f:7ed with SMTP id
 y72-20020a37644b000000b006b5d62f07edmr1500662qkb.143.1658525536305; 
 Fri, 22 Jul 2022 14:32:16 -0700 (PDT)
Received: from jshargo (pool-108-14-42-16.nycmny.fios.verizon.net.
 [108.14.42.16]) by smtp.gmail.com with ESMTPSA id
 x9-20020a05620a448900b006b614fe291bsm4657187qkp.28.2022.07.22.14.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 14:32:16 -0700 (PDT)
From: Jim Shargo <jshargo@chromium.org>
To: jshargo@google.com, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 1/5] drm/vkms: Merge default_config and device
Date: Fri, 22 Jul 2022 17:32:09 -0400
Message-Id: <20220722213214.1377835-2-jshargo@chromium.org>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
In-Reply-To: <20220722213214.1377835-1-jshargo@chromium.org>
References: <20220722213214.1377835-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Jul 2022 07:23:20 +0000
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
Cc: Jim Shargo <jshargo@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a small refactor to make ConfigFS support easier.

vkms_config is now a member of vkms_device and we now store a top-level
reference to vkms_device.

This should be a no-op refactor.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_drv.c    | 58 +++++++++---------------------
 drivers/gpu/drm/vkms/vkms_drv.h    |  5 ++-
 drivers/gpu/drm/vkms/vkms_output.c |  6 ++--
 3 files changed, 22 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f7..81ed9417e511 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -37,7 +37,7 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-static struct vkms_config *default_config;
+static struct vkms_device *vkms_device;
 
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
@@ -91,13 +91,9 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 static int vkms_config_show(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
-
-	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
-	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
-	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
+	seq_printf(m, "writeback=%d\n", vkms_device->config.writeback);
+	seq_printf(m, "cursor=%d\n", vkms_device->config.cursor);
+	seq_printf(m, "overlay=%d\n", vkms_device->config.overlay);
 
 	return 0;
 }
@@ -158,11 +154,10 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	return vkms_output_init(vkmsdev, 0);
 }
 
-static int vkms_create(struct vkms_config *config)
+static int vkms_create(void)
 {
 	int ret;
 	struct platform_device *pdev;
-	struct vkms_device *vkms_device;
 
 	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
 	if (IS_ERR(pdev))
@@ -179,9 +174,11 @@ static int vkms_create(struct vkms_config *config)
 		ret = PTR_ERR(vkms_device);
 		goto out_devres;
 	}
+	
 	vkms_device->platform = pdev;
-	vkms_device->config = config;
-	config->dev = vkms_device;
+	vkms_device->config.cursor = enable_cursor;
+	vkms_device->config.writeback = enable_writeback;
+	vkms_device->config.overlay = enable_overlay;
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
 					   DMA_BIT_MASK(64));
@@ -207,6 +204,8 @@ static int vkms_create(struct vkms_config *config)
 
 	drm_fbdev_generic_setup(&vkms_device->drm, 0);
 
+	vkms_device->initialized = true;
+
 	return 0;
 
 out_devres:
@@ -218,46 +217,23 @@ static int vkms_create(struct vkms_config *config)
 
 static int __init vkms_init(void)
 {
-	struct vkms_config *config;
-
-	config = kmalloc(sizeof(*config), GFP_KERNEL);
-	if (!config)
-		return -ENOMEM;
-
-	default_config = config;
-
-	config->cursor = enable_cursor;
-	config->writeback = enable_writeback;
-	config->overlay = enable_overlay;
-
-	return vkms_create(config);
+	return vkms_create();
 }
 
-static void vkms_destroy(struct vkms_config *config)
+static void __exit vkms_exit(void)
 {
 	struct platform_device *pdev;
 
-	if (!config->dev) {
-		DRM_INFO("vkms_device is NULL.\n");
+	if (!vkms_device || !vkms_device->initialized) {
 		return;
 	}
 
-	pdev = config->dev->platform;
+	pdev = vkms_device->platform;
 
-	drm_dev_unregister(&config->dev->drm);
-	drm_atomic_helper_shutdown(&config->dev->drm);
+	drm_dev_unregister(&vkms_device->drm);
+	drm_atomic_helper_shutdown(&vkms_device->drm);
 	devres_release_group(&pdev->dev, NULL);
 	platform_device_unregister(pdev);
-
-	config->dev = NULL;
-}
-
-static void __exit vkms_exit(void)
-{
-	if (default_config->dev)
-		vkms_destroy(default_config);
-
-	kfree(default_config);
 }
 
 module_init(vkms_init);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 91e63b12f60f..c7ebc4ee6b14 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -99,15 +99,14 @@ struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
-	/* only set when instantiated */
-	struct vkms_device *dev;
 };
 
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
 	struct vkms_output output;
-	const struct vkms_config *config;
+	struct vkms_config config;
+	bool initialized;
 };
 
 #define drm_crtc_to_vkms_output(target) \
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index ba0e82ae549a..d0061c82003a 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -63,7 +63,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
-	if (vkmsdev->config->overlay) {
+	if (vkmsdev->config.overlay) {
 		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
 			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
 			if (ret)
@@ -71,7 +71,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		}
 	}
 
-	if (vkmsdev->config->cursor) {
+	if (vkmsdev->config.cursor) {
 		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
 		if (IS_ERR(cursor))
 			return PTR_ERR(cursor);
@@ -103,7 +103,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		goto err_attach;
 	}
 
-	if (vkmsdev->config->writeback) {
+	if (vkmsdev->config.writeback) {
 		writeback = vkms_enable_writeback_connector(vkmsdev);
 		if (writeback)
 			DRM_ERROR("Failed to init writeback connector\n");
-- 
2.37.1.359.gd136c6c3e2-goog

