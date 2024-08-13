Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC76F9502DC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD53610E2EC;
	Tue, 13 Aug 2024 10:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i0MYMbLP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A47E10E2EA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:44 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-52efd855adbso6672956e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546302; x=1724151102; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dQhdCIG6a+LBFR6SphoPahDGZ++LmLY0vx0sk4HKH/c=;
 b=i0MYMbLPNUgfuUhdyJacZywVlPGm872HWRgFodFe9MSD/4pwiImkClBgLsivP1mcB7
 FdUgfyoLE6C/K8uC2l4r5F/52wh2XG4/mWnQbhKE2E/K1JtpOeH1/w8/MRTaXRbEuKvY
 +COBwmhXF38dzKRG6Xts1sukhCOK/DxCqoEsXXoK0JQBj7o2vDJlAWcqzm40c/nj7PVF
 rL/hiHhCecB/a417QbyW1U2klj6k7tH03LfvuXcBHfOTZn8xtFA+2Z3Bup+msqmD0Ww1
 RXw1J7PvCWBuoEPOZYN4fpukRJNGPUKFcWUQKLn9E+EI5MWVKKdSjZ9kEV0jlVEJPQVZ
 Pjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546302; x=1724151102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dQhdCIG6a+LBFR6SphoPahDGZ++LmLY0vx0sk4HKH/c=;
 b=cTWiifRqhyagspRzykukxBj+ApENl8Ljnqd+kHr7enZlXobaa7xZSapkzmE71Jd+6L
 eRUoefwEMjzOVsmUpGsFKA1gJLYtwhO1LiP4c8o/3+wPy2jJ0RUAXN+WQt/lfxNny3w1
 IwyZkIhFv9lMG7UTwaOpRSvQnjdO3ZEoOWhLNjVfVMU3j27mAtagHCgoAKEzpdYkzLfv
 q4AjJJpOX/n1xaBfOvedwqABnJlVTn2EptuS/2D0p/S/Z4wEZlZeCUZNehNpEgwVqqiJ
 m6ON5acOzSd57rnzZNt5d0AVOnxi/cpGEk5E/CP2nax8sLXEeRffdYBH5I9r9pccLpOl
 D0nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxodfIsRj7AVnDHTEGr+SXjXs7yaCQfpX8OBaP77ggHHoItuOKSui/NhRMJfS9EGfdBpmJLq0NqjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4FURjqBkt1omd1F42sAidPkAVfypoDG57llx4mG2vCAuHsw34
 EaCnu0ybk9Sl+vSnAfPIHJNKqYFpPelnTF7dg7WuS5MlWmqBXGtv
X-Google-Smtp-Source: AGHT+IGz72xfDrVPTMYgNZfRCFDLS7p2EH5rjzJWTApdrx62JJLa/NcdcQnhtxEsWIZrL7727HPLLA==
X-Received: by 2002:a05:6512:282c:b0:52c:cd4f:b95b with SMTP id
 2adb3069b0e04-53213657d99mr2098654e87.22.1723546302294; 
 Tue, 13 Aug 2024 03:51:42 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:40 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 03/17] drm/vkms: Set device name from vkms_config
Date: Tue, 13 Aug 2024 12:44:14 +0200
Message-ID: <20240813105134.17439-4-jose.exposito89@gmail.com>
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

In order to be able to create multiple devices, the device name needs to
be unique.

Allow to set it in the VKMS configuration.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 7 +++++--
 drivers/gpu/drm/vkms/vkms_config.h | 3 ++-
 drivers/gpu/drm/vkms/vkms_drv.c    | 2 +-
 drivers/gpu/drm/vkms/vkms_drv.h    | 2 ++
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 4c7cda16dfd8..6ab8091bf72f 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -8,7 +8,7 @@
 #include "vkms_config.h"
 #include "vkms_drv.h"
 
-struct vkms_config *vkms_config_create(void)
+struct vkms_config *vkms_config_create(char *dev_name)
 {
 	struct vkms_config *config;
 
@@ -16,6 +16,8 @@ struct vkms_config *vkms_config_create(void)
 	if (!config)
 		return ERR_PTR(-ENOMEM);
 
+	config->dev_name = dev_name;
+
 	return config;
 }
 
@@ -25,7 +27,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 {
 	struct vkms_config *config;
 
-	config = vkms_config_create();
+	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
 		return config;
 
@@ -47,6 +49,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 
+	seq_printf(m, "dev_name=%s\n", vkmsdev->config->dev_name);
 	seq_printf(m, "writeback=%d\n", vkmsdev->config->writeback);
 	seq_printf(m, "cursor=%d\n", vkmsdev->config->cursor);
 	seq_printf(m, "overlay=%d\n", vkmsdev->config->overlay);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 83181760b02b..ba06aad32799 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -8,6 +8,7 @@
 struct vkms_device;
 
 struct vkms_config {
+	char *dev_name;
 	bool writeback;
 	bool cursor;
 	bool overlay;
@@ -16,7 +17,7 @@ struct vkms_config {
 };
 
 /* VKMS Config */
-struct vkms_config *vkms_config_create(void);
+struct vkms_config *vkms_config_create(char *dev_name);
 struct vkms_config *vkms_config_default_create(bool enable_cursor,
 					       bool enable_writeback,
 					       bool enable_overlay);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 4e36989589f9..2f9d1db0cfae 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -160,7 +160,7 @@ static int vkms_create(struct vkms_config *config)
 	struct platform_device *pdev;
 	struct vkms_device *vkms_device;
 
-	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
+	pdev = platform_device_register_simple(config->dev_name, -1, NULL, 0);
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5c523ca27f22..87e44b51a03f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -12,6 +12,8 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_writeback.h>
 
+#define DEFAULT_DEVICE_NAME "vkms"
+
 #define XRES_MIN    10
 #define YRES_MIN    10
 
-- 
2.46.0

