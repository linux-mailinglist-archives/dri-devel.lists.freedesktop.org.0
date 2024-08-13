Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC19502E3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B917210E2F2;
	Tue, 13 Aug 2024 10:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kbtJVeBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CFF10E2FA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:51 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52f04150796so6887173e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546309; x=1724151109; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z1b1Eswx9qL8T6Rd6UW0NQch1ATeb/MIAR8sy8FcP0k=;
 b=kbtJVeBPy+h+KVf/nghJ0XzlVBncKc39f41IHM6JKLJ+s5HmkhsflUVFRMUr5CMwd8
 9riGQk3WIQ3alzjKdaGG6mCAVXfSJIreR90fYna8iFnOKjvd+tvvN93ctIcUba3b/Wi2
 awKrPSG9+DJt5cVPhoyB5mZ0IwuoX1TtwQcb3CqnfuVHvatNB52Kqy5TtB4X1mvR5FR8
 q0i3cIUyUjKICYfKs19R3oO6qsVZTYJXNvUfYXVCideX1b0y2EgrKBCDG9UcRcqYqCPl
 iE6LpNk7qfiSocaHsHSLI1jCWt9nFYNrbDqzAeOQaDkxLzBC4A04QwApl8Mk7NZOvcI/
 2OTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546309; x=1724151109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z1b1Eswx9qL8T6Rd6UW0NQch1ATeb/MIAR8sy8FcP0k=;
 b=bJojHbQFLKiK3UFN52TofhtNzSO98ATBT/eXe28afPZ9dao6q0A/dYu38Ehmqqqr68
 fYi/7bRgz7yw+FvffIl4W9sh6DllNewOnIxmONXrn6Di1DARsjEEVPaZ4CBi87Adzj2g
 F7UbUaY2JYxMhfFqogb9uaSqY1HnroBhqLay4KG9HoOJiVxuehfB7q2hksZqy1Vi/e00
 TXXfLA0zYRCqWYUlm0yce+8NFuNUVB0zwVGh78QI2vo+qnijyXHAOzVJ2+3y//pEhNJv
 0a1r4WYPT3dEoPgjwXhng+QBrc1LP9swhgJm/2eLHF5AAjncHS+6DuehtNB4iqFb2WCs
 gXnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsSnwWZCKeWU7ZaB5sacu2uYxTuez6gPqLfC5fbGGZZzdCNHe8G/o+RWwQIu/CWaR/I2z3FmaHKTSsKyubbsjvIY5LI9kfmAYutRJ8Hmra
X-Gm-Message-State: AOJu0Yym4x03VLu7hnMbRBwBbb8NDTlZlcwBsK8TLqGBWN/+0XEMfWML
 BcivfXLw1NTYxm//BIm9sEDedj+N/uNapQN3n6U7oiOTUUjDcmBh
X-Google-Smtp-Source: AGHT+IHDMdoPIt0vDtMzdf2vnVHY+f/UlarsLfOsG/b/9vpdwiWF/yN55OgcMzvIyUbn7rGva+IR1w==
X-Received: by 2002:a05:6512:1592:b0:52b:bf8e:ffea with SMTP id
 2adb3069b0e04-532136840a4mr1940424e87.40.1723546308846; 
 Tue, 13 Aug 2024 03:51:48 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 08/17] drm/vkms: Allow to configure multiple connectors
Date: Tue, 13 Aug 2024 12:44:19 +0200
Message-ID: <20240813105134.17439-9-jose.exposito89@gmail.com>
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

Add a list of connector configurations to vkms_config and add as many
connector as configured during output initialization.

For backwards compatibility, create a single connector in the default
configuration.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 40 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h | 12 +++++++++
 drivers/gpu/drm/vkms/vkms_output.c | 11 +++++---
 3 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 6a8dfebee24e..a456f9db3c66 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -19,6 +19,7 @@ struct vkms_config *vkms_config_create(char *dev_name)
 	config->dev_name = dev_name;
 	config->crtcs = (struct list_head)LIST_HEAD_INIT(config->crtcs);
 	config->encoders = (struct list_head)LIST_HEAD_INIT(config->encoders);
+	config->connectors = (struct list_head)LIST_HEAD_INIT(config->connectors);
 
 	return config;
 }
@@ -30,6 +31,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	struct vkms_config *config;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
 
 	config = vkms_config_create(DEFAULT_DEVICE_NAME);
 	if (IS_ERR(config))
@@ -46,6 +48,10 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (IS_ERR(encoder_cfg))
 		return ERR_CAST(encoder_cfg);
 
+	connector_cfg = vkms_config_add_connector(config, BIT(0));
+	if (IS_ERR(connector_cfg))
+		return ERR_CAST(connector_cfg);
+
 	return config;
 }
 
@@ -53,6 +59,7 @@ void vkms_config_destroy(struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg, *crtc_tmp;
 	struct vkms_config_encoder *encoder_cfg, *encoder_tmp;
+	struct vkms_config_connector *connector_cfg, *connector_tmp;
 
 	list_for_each_entry_safe(crtc_cfg, crtc_tmp, &config->crtcs, list)
 		vkms_config_destroy_crtc(config, crtc_cfg);
@@ -60,6 +67,9 @@ void vkms_config_destroy(struct vkms_config *config)
 	list_for_each_entry_safe(encoder_cfg, encoder_tmp, &config->encoders, list)
 		vkms_config_destroy_encoder(config, encoder_cfg);
 
+	list_for_each_entry_safe(connector_cfg, connector_tmp, &config->connectors, list)
+		vkms_config_destroy_connector(config, connector_cfg);
+
 	kfree(config);
 }
 
@@ -70,6 +80,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_connector *connector_cfg;
 	int n;
 
 	seq_printf(m, "dev_name=%s\n", vkmsdev->config->dev_name);
@@ -90,6 +101,13 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		n++;
 	}
 
+	n = 0;
+	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, list) {
+		seq_printf(m, "connector(%d).possible_encoders=%d\n", n,
+			   connector_cfg->possible_encoders);
+		n++;
+	}
+
 	return 0;
 }
 
@@ -166,3 +184,25 @@ void vkms_config_destroy_encoder(struct vkms_config *config,
 	list_del(&encoder_cfg->list);
 	kfree(encoder_cfg);
 }
+
+struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *config,
+							uint32_t possible_encoders)
+{
+	struct vkms_config_connector *connector_cfg;
+
+	connector_cfg = kzalloc(sizeof(*connector_cfg), GFP_KERNEL);
+	if (!connector_cfg)
+		return ERR_PTR(-ENOMEM);
+
+	connector_cfg->possible_encoders = possible_encoders;
+	list_add_tail(&connector_cfg->list, &config->connectors);
+
+	return connector_cfg;
+}
+
+void vkms_config_destroy_connector(struct vkms_config *config,
+				   struct vkms_config_connector *connector_cfg)
+{
+	list_del(&connector_cfg->list);
+	kfree(connector_cfg);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index b717b5c0d3d9..f1dd59fc6300 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -20,12 +20,18 @@ struct vkms_config_encoder {
 	uint32_t possible_crtcs;
 };
 
+struct vkms_config_connector {
+	struct list_head list;
+	uint32_t possible_encoders;
+};
+
 struct vkms_config {
 	char *dev_name;
 	bool cursor;
 	bool overlay;
 	struct list_head crtcs;
 	struct list_head encoders;
+	struct list_head connectors;
 	/* only set when instantiated */
 	struct vkms_device *dev;
 };
@@ -52,4 +58,10 @@ struct vkms_config_encoder *vkms_config_add_encoder(struct vkms_config *config,
 void vkms_config_destroy_encoder(struct vkms_config *config,
 				 struct vkms_config_encoder *encoder_cfg);
 
+/* Connectors */
+struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *config,
+							uint32_t possible_encoders);
+void vkms_config_destroy_connector(struct vkms_config *config,
+				   struct vkms_config_connector *connector_cfg);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 4413cf88afc7..021a491de817 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -100,6 +100,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct drm_connector *connector;
+	struct vkms_config_connector *connector_cfg;
 	struct drm_encoder *encoder;
 	struct vkms_config_encoder *encoder_cfg;
 	struct vkms_crtc *vkms_crtc;
@@ -142,10 +143,6 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		}
 	}
 
-	connector = vkms_connector_init(vkmsdev, BIT(index));
-	if (IS_ERR(connector))
-		return PTR_ERR(connector);
-
 	list_for_each_entry(encoder_cfg, &vkmsdev->config->encoders, list) {
 		encoder = vkms_encoder_init(vkmsdev, encoder_cfg->possible_crtcs,
 					    encoder_cfg->index);
@@ -153,6 +150,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 			return PTR_ERR(encoder);
 	}
 
+	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, list) {
+		connector = vkms_connector_init(vkmsdev, connector_cfg->possible_encoders);
+		if (IS_ERR(connector))
+			return PTR_ERR(connector);
+	}
+
 	drm_mode_config_reset(dev);
 
 	return 0;
-- 
2.46.0

