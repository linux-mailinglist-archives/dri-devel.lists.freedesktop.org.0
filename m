Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA4F9502E0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D278810E2F1;
	Tue, 13 Aug 2024 10:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OxaOYIRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CC710E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:48 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4281d812d3eso52674065e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546306; x=1724151106; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R6Mz2KhFZzROn/KIWb00LTNVvXvYG/m4Vfb07jwptv4=;
 b=OxaOYIRXPDmM2BpVYATRBmNvt11Qf7iReYV8ZWZBEHDhqKD6qWyWykaFDvKZF3mdiP
 esh5KOeHNQEThoiSxPKzxLTfwEwh3jvJz+GA033mvFwF95jJHzVde7TXaVSG/5FNK3n9
 nsrwUFYa/Tu/BO9pqUJZwTo7xO5CMAY4QmoDKPqNeK+lyT8UHZW4NZ8ONX1aeNUKLR/3
 Jnr8mlOiqEUSe2HYz4sIdPaGQfTbv+x0Yyc8kuvvoZZSEWyoxUhkWY9vXCAXKx/HrwhW
 Z/QURWBVJRwBzXITWVR7UNMxPijYrUfp2J8kfBwi5FCEv8isX+yBVVx6HHFRqLnja3Oi
 4piQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546306; x=1724151106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6Mz2KhFZzROn/KIWb00LTNVvXvYG/m4Vfb07jwptv4=;
 b=FKECuQPI/ugtH389DJs/r+2rRoJ/zXbebS4/M3vkaS22uVdTJhGBRiIX5m4IWcFj1/
 nQ6a0kBmSrvPPMoEeGwY54BJv9VmTQn5rjaJdjzrstpenlBlVS8GExBk1baiqM1hsDXm
 eZmz5jZfDalfNZjo6d8hmhrX6AM4QRWIselgQVNd1rawApjsRwMssIIAfoTUBwX0RHaL
 G90aGeh24HAGX8K05/+tWXftdBdN12A1J8GD2nLPc0/jU3lVYXf8nAAt7LgWVozvIOyI
 3cCxvOcLt+ka8Dh1cBvhJwgyMXKB7r68EEbp3sqCq7EkGpLtsMoRYhqZPvrCCoop544R
 bOsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdsWU55V8fpdEg9hgQd4e6vgke9CsEakrx4JthiKo4F3HtVP9Pw1EozuVjQfTRAkfVbmBa/BlYglogAnWEV8fV35ehm9EZrKktpGgEMbCk
X-Gm-Message-State: AOJu0Yy0QfYgI+01wjIY/9ZV34Aof3Vf4DZmPUMnhpZUMXpEmT3Yavmk
 JmmDfQ/o8m7NamEhnRi9Hjq2mB2M6W9w9fubU6wCEd4G2g7q9n4Y
X-Google-Smtp-Source: AGHT+IFc1MxDOM9KHwmSg4MIeIUEJ0CdqAeobEZZY+JR1Ums0WJRTX2kswhgxVkQAvgh3eiXBXE65g==
X-Received: by 2002:a05:600c:6d3:b0:426:59d3:8cae with SMTP id
 5b1f17b1804b1-429d633e764mr21330055e9.13.1723546306306; 
 Tue, 13 Aug 2024 03:51:46 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:45 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 06/17] drm/vkms: Allow to configure multiple encoders
Date: Tue, 13 Aug 2024 12:44:17 +0200
Message-ID: <20240813105134.17439-7-jose.exposito89@gmail.com>
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

Add a list of encoder configurations to vkms_config and add as many
encoders as configured during output initialization.

For backwards compatibility, create a single encoder in the default
configuration.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 50 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h | 13 ++++++++
 drivers/gpu/drm/vkms/vkms_output.c | 14 ++++++---
 3 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 3af750071f04..6a8dfebee24e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -18,6 +18,7 @@ struct vkms_config *vkms_config_create(char *dev_name)
 
 	config->dev_name = dev_name;
 	config->crtcs = (struct list_head)LIST_HEAD_INIT(config->crtcs);
+	config->encoders = (struct list_head)LIST_HEAD_INIT(config->encoders);
 
 	return config;
 }
@@ -28,6 +29,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 {
 	struct vkms_config *config;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
@@ -40,16 +42,24 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (IS_ERR(crtc_cfg))
 		return ERR_CAST(crtc_cfg);
 
+	encoder_cfg = vkms_config_add_encoder(config, BIT(0));
+	if (IS_ERR(encoder_cfg))
+		return ERR_CAST(encoder_cfg);
+
 	return config;
 }
 
 void vkms_config_destroy(struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
+	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
 
 	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, list)
 		vkms_config_destroy_crtc(config, crtc_cfg);
 
+	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, list)
+		vkms_config_destroy_encoder(config, encoder_cfg);
+
 	kfree(config);
 }
 
@@ -59,6 +69,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_encoder *encoder_cfg;
 	int n;
 
 	seq_printf(m, "dev_name=%s\n", vkmsdev->config->dev_name);
@@ -72,6 +83,13 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		n++;
 	}
 
+	n = 0;
+	list_for_each_entry(encoder_cfg, &vkmsdev->config->encoders, list) {
+		seq_printf(m, "encoder(%d).possible_crtcs=%d\n", n,
+			   encoder_cfg->possible_crtcs);
+		n++;
+	}
+
 	return 0;
 }
 
@@ -116,3 +134,35 @@ void vkms_config_destroy_crtc(struct vkms_config *config,
 	list_del(&crtc_cfg->list);
 	kfree(crtc_cfg);
 }
+
+struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config,
+						    uint32_t possible_crtcs)
+{
+	struct vkms_config_encoder *encoder_cfg;
+
+	encoder_cfg = kzalloc(sizeof(*encoder_cfg), GFP_KERNEL);
+	if (!encoder_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	encoder_cfg->possible_crtcs = possible_crtcs;
+
+	encoder_cfg->index = 0;
+	if (!list_empty(&config->encoders)) {
+		struct vkms_config_encoder *last;
+
+		last = list_last_entry(&config->encoders,
+				       struct vkms_config_encoder, list);
+		encoder_cfg->index = last->index + 1;
+	}
+
+	list_add_tail(&encoder_cfg->list, &config->encoders);
+
+	return encoder_cfg;
+}
+
+void vkms_config_destroy_encoder(struct vkms_config *config,
+				 struct vkms_config_encoder *encoder_cfg)
+{
+	list_del(&encoder_cfg->list);
+	kfree(encoder_cfg);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index bc40a0e3859a..b717b5c0d3d9 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -14,11 +14,18 @@ struct vkms_config_crtc {
 	bool writeback;
 };
 
+struct vkms_config_encoder {
+	struct list_head list;
+	unsigned int index;
+	uint32_t possible_crtcs;
+};
+
 struct vkms_config {
 	char *dev_name;
 	bool cursor;
 	bool overlay;
 	struct list_head crtcs;
+	struct list_head encoders;
 	/* only set when instantiated */
 	struct vkms_device *dev;
 };
@@ -39,4 +46,10 @@ struct vkms_config_crtc *vkms_config_add_crtc(struct vkms_config *config,
 void vkms_config_destroy_crtc(struct vkms_config *config,
 			      struct vkms_config_crtc *crtc_cfg);
 
+/* Encoders */
+struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config,
+						    uint32_t possible_crtcs);
+void vkms_config_destroy_encoder(struct vkms_config *config,
+				 struct vkms_config_encoder *encoder_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 15f0b72af325..7afe37aea52d 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -30,7 +30,8 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 };
 
 static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device,
-					     uint32_t possible_crtcs)
+					     uint32_t possible_crtcs,
+					     unsigned int index)
 {
 	struct drm_encoder *encoder;
 	int ret;
@@ -49,6 +50,7 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device,
 		return ERR_PTR(ret);
 	}
 
+	encoder->index = index;
 	encoder->possible_crtcs = possible_crtcs;
 
 	return encoder;
@@ -74,6 +76,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector = &output->connector;
 	struct drm_encoder *encoder;
+	struct vkms_config_encoder *encoder_cfg;
 	struct vkms_crtc *vkms_crtc;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_plane *primary, *cursor = NULL;
@@ -123,9 +126,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 
 	drm_connector_helper_add(connector, &vkms_conn_helper_funcs);
 
-	encoder = vkms_encoder_init(vkmsdev, BIT(0));
-	if (IS_ERR(encoder))
-		return PTR_ERR(encoder);
+	list_for_each_entry(encoder_cfg, &vkmsdev->config->encoders, list) {
+		encoder = vkms_encoder_init(vkmsdev, encoder_cfg->possible_crtcs,
+					    encoder_cfg->index);
+		if (IS_ERR(encoder))
+			return PTR_ERR(encoder);
+	}
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {
-- 
2.46.0

