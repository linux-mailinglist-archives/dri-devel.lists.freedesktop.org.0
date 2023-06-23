Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6100F73C40D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 00:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B8F10E6DC;
	Fri, 23 Jun 2023 22:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4012710E6D7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 22:25:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f8fcaa31c7so15198685e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687559133; x=1690151133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKukKTNolk7o3JwLovvGiZSWB7MAEKhSelWOQgYadOg=;
 b=nMpjrKdcnJ8XhmRMfB91CKOQkjOP9VFD/yB0lnj8RKVvNm+yU85lRkWGQtqRoix7+3
 47pIxJVbS1xpdiMdCdKV6hv+q7WMVtM2+ElPY7CbjHDjzOLt22K1p5+ndYZpo0MgD2Bt
 BGRG2sg6gUwO5FJDdghj8JwU5V3CjwMse3+Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687559133; x=1690151133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mKukKTNolk7o3JwLovvGiZSWB7MAEKhSelWOQgYadOg=;
 b=HQs6VQUvqccGVjw9ckH8GXUjMkivydPf8MOOif0AUGQJF8ZhY8uKxH4eMIMHHSyApK
 xwJG/snQp8oYHrSyW7CK9Rdi9ha1qjn3JMYNKcsRsxf7EctQ80D7tYCgDqiwETMZDAz3
 yrL0LwJ6gM94eZrY+46yeUHSU6OkUyD6+2kbIi25Y+swz3jSAii2/edAG5HDwFTkgGlU
 liBKj6ukSUVF4lH6MV6NAsSrczpXN7zmifj5wCbJpwWDuB5UbkYzrM5Sq3/GrzM6vaQ8
 VcMxxKTaZ8Hs6hy8qaXyIzgxx1PYy9nJbcRE8l7yzOUKmMF+t92Vi2DTu9aTjcqb698Y
 jg5w==
X-Gm-Message-State: AC+VfDxmWhMgtuGp645R9zQmcTRObx/Dh3LyOAaWuuUgp0SjFzzAAtXl
 pNrL/9m92FvdXihLhLUe85DezA==
X-Google-Smtp-Source: ACHHUZ7rsXQXJQmsIskpsoN95A1IWOFJKMU7V7NSVLFldsmXoPhlG5DDcXS3z9jdHUMyzCYrVoS/KQ==
X-Received: by 2002:a5d:58d1:0:b0:30f:bcfd:c690 with SMTP id
 o17-20020a5d58d1000000b0030fbcfdc690mr23643997wrf.38.1687559133379; 
 Fri, 23 Jun 2023 15:25:33 -0700 (PDT)
Received: from big-boopo.mynetworksettings.com
 (pool-108-46-233-209.nycmny.fios.verizon.net. [108.46.233.209])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a5d4106000000b0030c2e3c7fb3sm453223wrp.101.2023.06.23.15.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 15:25:33 -0700 (PDT)
From: Jim Shargo <jshargo@chromium.org>
To: mairacanal@riseup.net, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/6] drm/vkms: Provide platform data when creating VKMS
 devices
Date: Fri, 23 Jun 2023 18:23:45 -0400
Message-ID: <20230623222353.97283-4-jshargo@chromium.org>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230623222353.97283-1-jshargo@chromium.org>
References: <20230623222353.97283-1-jshargo@chromium.org>
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
Cc: Jim Shargo <jshargo@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a small refactor to make ConfigFS support easier. This should be
a no-op refactor.

Signed-off-by: Jim Shargo <jshargo@chromium.org>
---
 drivers/gpu/drm/vkms/vkms_drv.c    | 13 +++++++++++--
 drivers/gpu/drm/vkms/vkms_drv.h    |  9 ++++++---
 drivers/gpu/drm/vkms/vkms_output.c |  2 +-
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index aa2bee82b757..d43121addf66 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -152,12 +152,14 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
-	return vkms_output_init(vkmsdev, 0);
+	return vkmsdev->is_default ? vkms_output_init_default(vkmsdev) :
+				     -ENOSYS;
 }
 
 static int vkms_platform_probe(struct platform_device *pdev)
 {
 	int ret;
+	struct vkms_device_setup *vkms_device_setup = pdev->dev.platform_data;
 	struct vkms_device *vkms_device;
 	void *grp;
 
@@ -177,6 +179,7 @@ static int vkms_platform_probe(struct platform_device *pdev)
 	vkms_device->config.cursor = enable_cursor;
 	vkms_device->config.writeback = enable_writeback;
 	vkms_device->config.overlay = enable_overlay;
+	vkms_device->is_default = vkms_device_setup->is_default;
 
 	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
 					   DMA_BIT_MASK(64));
@@ -240,6 +243,9 @@ static int __init vkms_init(void)
 {
 	int ret;
 	struct platform_device *pdev;
+	struct vkms_device_setup vkms_device_setup = {
+		.is_default = true,
+	};
 
 	ret = platform_driver_register(&vkms_platform_driver);
 	if (ret) {
@@ -247,8 +253,11 @@ static int __init vkms_init(void)
 		return ret;
 	}
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	pdev = platform_device_register_data(NULL, DRIVER_NAME, 0,
+					     &vkms_device_setup,
+					     sizeof(vkms_device_setup));
 	if (IS_ERR(pdev)) {
+		DRM_ERROR("Unable to register default vkms device\n");
 		platform_driver_unregister(&vkms_platform_driver);
 		return PTR_ERR(pdev);
 	}
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 4c3274838ec7..84b35aa1dc5a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -121,17 +121,20 @@ struct vkms_output {
 	struct vkms_plane planes[VKMS_MAX_PLANES];
 };
 
-struct vkms_device;
-
 struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
 };
 
+struct vkms_device_setup {
+	bool is_default;
+};
+
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
+	bool is_default;
 	struct vkms_output output;
 	struct vkms_config config;
 };
@@ -155,7 +158,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
 				 struct drm_plane *primary,
 				 struct drm_plane *cursor);
 
-int vkms_output_init(struct vkms_device *vkmsdev, int index);
+int vkms_output_init_default(struct vkms_device *vkmsdev);
 
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 				   enum drm_plane_type type);
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 6b4a77780d3c..3b5e272a8b33 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -80,7 +80,7 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
 	return encoder;
 }
 
-int vkms_output_init(struct vkms_device *vkmsdev, int index)
+int vkms_output_init_default(struct vkms_device *vkmsdev)
 {
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-- 
2.41.0.162.gfafddb0af9-goog

