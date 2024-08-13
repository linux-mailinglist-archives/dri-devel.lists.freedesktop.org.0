Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388A09502E1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2461810E2F3;
	Tue, 13 Aug 2024 10:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T2h5SDR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1D710E2EE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-428f5c0833bso36002095e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546308; x=1724151108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yPJvcbH5lYbi1tdr48EenmYPKkhD5TMeNHQFHVN3Exg=;
 b=T2h5SDR78fqv6SAVpDOQK5OD3Rc2pbl39GdFj4djxLWr5RKc4Srwx10RKoKcI8xWGZ
 8zqI8HtAbe1SgfpaEO9Uc/HLZPClnARskUoRMOEc5tUCuNi0tiXzpj8ciqmoiun4OrOo
 G/PfMxHobkSjS65nnXUbjTuXXZCXqS0kRUuK2QH6p+L1Z7/UU1Lv0jrIKzXrVugfTyet
 DzyAdP6yTFnTYKL9hxkF+mpJSmiywUP1XkGZsZNUoM4lqVMw2C/GTR5FQLuav1jiKIiO
 NxbvDx0DVBosZcwxS/KvVFYDT/QvKKIrLEs0B2Nv5anqHbKfKCE//85tmxuoPX6E6Gzn
 AOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546308; x=1724151108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPJvcbH5lYbi1tdr48EenmYPKkhD5TMeNHQFHVN3Exg=;
 b=UYpllTJf6o8Tgpbt8PXaBvd/HMNm8lHDTLPlyD3xxsOlMLmhUXq2c9uUE0Rg08lCzu
 j8j8bFa1zwGhx3q4wJliDMFOmDN5r72sJPjXXlTB7CM5B3DuvBqlcVJnuP3mm7w9bJw8
 7AEqaUzFF9d5xvA+HIiJOO6Zfhs1+8PvJ7iHo2FlysHe+nhG7/hdEb3IhuLUA3fwmHdS
 zAJaHSssudU1/2XHBLjvUXl00tAu1kiFYcTV7TTVQyhctJeaLahymaPficYnxq3SeQ8r
 5Oo9k9nXJKujFipPTplElJwznbDRhmVQXUBClwCuf4aYx8Jr3ecnLhu2dTlC1S0JIcFg
 8pWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjVCPxLIAMBA71Blmumi87BPjRgTiNma+7hAIfH08VK0Zv8gAhS94TurNXwbvuOXtkDrcdfgnzRQZv0NrGuIQDcp0HHT3zMghr5bv2ncx8
X-Gm-Message-State: AOJu0YyFGIl6Hpb7aBzcDLQ7p0Fqet4/OuCYR7jeiPqIwAuygs9YUxnk
 jSo9dxYxvH6rwKL97sLJFikaaT3DjEHnOq2NEB+aRxAH6fDlD/sK
X-Google-Smtp-Source: AGHT+IHcFaaF5NVEVnvtNiV476r9AqohxbQTNIubIsJ2CbGH8C94GlKmoddxaTxdje9PNBr2TQhbQA==
X-Received: by 2002:a05:600c:1c17:b0:426:6981:1bd with SMTP id
 5b1f17b1804b1-429d6280c76mr19765785e9.5.1723546307600; 
 Tue, 13 Aug 2024 03:51:47 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:46 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 07/17] drm/vkms: Use managed memory to create connectors
Date: Tue, 13 Aug 2024 12:44:18 +0200
Message-ID: <20240813105134.17439-8-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240813105134.17439-1-jose.exposito89@gmail.com>
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A future patch will allow to create multiple connectors. Use managed
memory to simplify the code.

Refactor, no functional changes.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h    |  5 ---
 drivers/gpu/drm/vkms/vkms_output.c | 53 +++++++++++++++++-------------
 2 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 2466e8b0231f..cac37d21654a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -121,14 +121,9 @@ struct vkms_crtc {
 
 struct vkms_config;
 
-struct vkms_output {
-	struct drm_connector connector;
-};
-
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
-	struct vkms_output output;
 	struct list_head crtcs;
 	const struct vkms_config *config;
 };
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 7afe37aea52d..4413cf88afc7 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -9,7 +9,6 @@
 
 static const struct drm_connector_funcs vkms_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -29,6 +28,33 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.get_modes    = vkms_conn_get_modes,
 };
 
+static struct drm_connector *vkms_connector_init(struct vkms_device *vkms_device,
+						 uint32_t possible_encoders)
+{
+	struct drm_connector *connector;
+	int ret;
+
+	connector = drmm_kzalloc(&vkms_device->drm, sizeof(*connector), GFP_KERNEL);
+	if (!connector) {
+		DRM_ERROR("Failed to allocate connector\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ret = drmm_connector_init(&vkms_device->drm, connector,
+				  &vkms_connector_funcs,
+				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+	if (ret) {
+		DRM_ERROR("Failed to init connector\n");
+		kfree(connector);
+		return ERR_PTR(ret);
+	}
+
+	connector->possible_encoders = possible_encoders;
+	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
+
+	return connector;
+}
+
 static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device,
 					     uint32_t possible_crtcs,
 					     unsigned int index)
@@ -72,9 +98,8 @@ static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index)
 
 int vkms_output_init(struct vkms_device *vkmsdev, int index)
 {
-	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector = &output->connector;
+	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct vkms_config_encoder *encoder_cfg;
 	struct vkms_crtc *vkms_crtc;
@@ -117,14 +142,9 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		}
 	}
 
-	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
-				 DRM_MODE_CONNECTOR_VIRTUAL);
-	if (ret) {
-		DRM_ERROR("Failed to init connector\n");
-		return ret;
-	}
-
-	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
+	connector = vkms_connector_init(vkmsdev, BIT(index));
+	if (IS_ERR(connector))
+		return PTR_ERR(connector);
 
 	list_for_each_entry(encoder_cfg, &vkmsdev->config->encoders, list) {
 		encoder = vkms_encoder_init(vkmsdev, encoder_cfg->possible_crtcs,
@@ -133,18 +153,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 			return PTR_ERR(encoder);
 	}
 
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret) {
-		DRM_ERROR("Failed to attach connector to encoder\n");
-		goto err_attach;
-	}
-
 	drm_mode_config_reset(dev);
 
 	return 0;
-
-err_attach:
-	drm_connector_cleanup(connector);
-
-	return ret;
 }
-- 
2.46.0

