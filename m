Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7E9502E6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB2F10E2F6;
	Tue, 13 Aug 2024 10:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O5fTSs79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FACC10E2EE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:53 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52efa16aad9so6971099e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546312; x=1724151112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZqQI2pSvN1r3euYPp2vCyWNVjuvi3Z3cQv0iU7vYqtw=;
 b=O5fTSs79yy8w8D7RfdOObpUc5Hj5z0SFp0TI4zlFgawoKDm38lhrZ3fJPudXof9sux
 XJG6os899PC/qm/whDK7M/lOVPB2otJQhEeLFQTqgYNJuF70s81ZHqFSEH3suGkW0Vjb
 Lg/kT1EbbRS7+r0v45aLmGppNhy1jTs5+TUNgC3lBJPol1FhrPTKdB6wDztii5F0gOVH
 1T0LTzjAW8U+jLDIeUYb6VMUPTq6v2ekhMyFQPJ+dcXPCZrGUovARsHabAUSn5krUz5U
 jSN//3pVBkwi09qJ8bHYhP9xl30CZqPULrSaaKrFjCq1VFonaBr++z6WycE7UEx/jc/U
 5h1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546312; x=1724151112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZqQI2pSvN1r3euYPp2vCyWNVjuvi3Z3cQv0iU7vYqtw=;
 b=i4xiR6Z6cV9D5H0sgzzfGSJBU21AHilxzS6SXar7ylpV1s/zYo7i7Za9V9hcmIBKW4
 5p7LidbEgtgiBNvSROizjT7vCA5vvmVQm7uEQRz+wLLPgXjTLMH07bOFQhPKCq0Ji1Im
 o6YMmea6g6/m3kPElBkp46WOKJkaaAHWZmy6MtRULXc0fVRzVefECb4FNYQPDqfOfGUh
 5caLd0xmnSjxve8rvotqjfykE5sJ3TUJ+Yble3ZENRnOlqW5KKHPzOKDdB4YonPjBm+z
 fsxunP6mo/AHEu2BHH3YFrI4BcqJUhsa3xYYnedPOmhxSd8jEj1NHokEKKGfcHImAeAX
 e0nA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdKj5Ex2TQrefbckQm1uKtRn72xZYAcxeb1U+vEuttVHqY4GejxNN37IuSXPhVJH82FB2kyBtcgLwocZboQa/vLj0RKgT3JQyEKLn99Awi
X-Gm-Message-State: AOJu0Yw3Cyi2ZXy4+TIWGv7cDQhw+KJF+n+wczaXiKBm1/IwWzvuV5Ve
 2JIAxNN4mz3A+HwKOFfy6n279fQ8cxvMmEzu7dD7aIflOBFNF7Ez
X-Google-Smtp-Source: AGHT+IEE/5oIBKt+yDiQMW0HbZMqJpQ32z2JEVYHvnsw69984l4lJ/4s/IJTZ5H3jFbn7gTtOtW3Rw==
X-Received: by 2002:a05:6512:114c:b0:52c:d80e:55a5 with SMTP id
 2adb3069b0e04-53213693ec2mr2061169e87.41.1723546311208; 
 Tue, 13 Aug 2024 03:51:51 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:50 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 10/17] drm/vkms: Allow to change connector status
Date: Tue, 13 Aug 2024 12:44:21 +0200
Message-ID: <20240813105134.17439-11-jose.exposito89@gmail.com>
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

Store the connector status in vkms_config_connector and use the stored
value to update the connector status in the drm_connector_funcs.detect()
function.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 18 ++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_config.h | 12 +++++++++++-
 drivers/gpu/drm/vkms/vkms_output.c | 20 ++++++++++++++++++++
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index d95a42a6745a..e8e5c02c9d43 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -3,6 +3,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_debugfs.h>
 
 #include "vkms_config.h"
@@ -56,7 +57,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
 	if (IS_ERR(encoder_cfg))
 		return ERR_CAST(encoder_cfg);
 
-	connector_cfg = vkms_config_add_connector(config, BIT(0));
+	connector_cfg = vkms_config_add_connector(config, BIT(0), connector_status_connected);
 	if (IS_ERR(connector_cfg))
 		return ERR_CAST(connector_cfg);
 
@@ -124,6 +125,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, list) {
 		seq_printf(m, "connector(%d).possible_encoders=%d\n", n,
 			   connector_cfg->possible_encoders);
+		seq_printf(m, "connector(%d).status=%d\n", n,
+			   connector_cfg->status);
 		n++;
 	}
 
@@ -229,7 +232,8 @@ void vkms_config_destroy_encoder(struct vkms_config *config,
 }
 
 struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *config,
-							uint32_t possible_encoders)
+							uint32_t possible_encoders,
+							enum drm_connector_status status)
 {
 	struct vkms_config_connector *connector_cfg;
 
@@ -238,6 +242,7 @@ struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *conf
 		return ERR_PTR(-ENOMEM);
 
 	connector_cfg->possible_encoders = possible_encoders;
+	connector_cfg->status = status;
 	list_add_tail(&connector_cfg->list, &config->connectors);
 
 	return connector_cfg;
@@ -249,3 +254,12 @@ void vkms_config_destroy_connector(struct vkms_config *config,
 	list_del(&connector_cfg->list);
 	kfree(connector_cfg);
 }
+
+void vkms_update_connector_status(struct vkms_config *config,
+				  struct vkms_config_connector *connector_cfg,
+				  enum drm_connector_status status)
+{
+	connector_cfg->status = status;
+	if (config->dev)
+		drm_kms_helper_hotplug_event(&config->dev->drm);
+}
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 25dab63e7ae7..3237406fa3a3 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -6,6 +6,8 @@
 #include <linux/list.h>
 #include <linux/types.h>
 
+#include <drm/drm_connector.h>
+
 struct vkms_device;
 
 struct vkms_config_plane {
@@ -29,6 +31,9 @@ struct vkms_config_encoder {
 struct vkms_config_connector {
 	struct list_head list;
 	uint32_t possible_encoders;
+	enum drm_connector_status status;
+	/* only set when instantiated */
+	struct drm_connector *connector;
 };
 
 struct vkms_config {
@@ -72,8 +77,13 @@ void vkms_config_destroy_encoder(struct vkms_config *config,
 
 /* Connectors */
 struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *config,
-							uint32_t possible_encoders);
+							uint32_t possible_encoders,
+							enum drm_connector_status status);
 void vkms_config_destroy_connector(struct vkms_config *config,
 				   struct vkms_config_connector *connector_cfg);
 
+void vkms_update_connector_status(struct vkms_config *config,
+				  struct vkms_config_connector *connector_cfg,
+				  enum drm_connector_status status);
+
 #endif /* _VKMS_CONFIG_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index a5b1ab326cdd..511cc2c14c44 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -7,7 +7,25 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 
+static enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
+						       bool force)
+{
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(connector->dev);
+	enum drm_connector_status status = connector->status;
+	struct vkms_config_connector *connector_cfg;
+
+	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, list) {
+		if (connector_cfg->connector == connector) {
+			status = connector_cfg->status;
+			break;
+		}
+	}
+
+	return status;
+}
+
 static const struct drm_connector_funcs vkms_connector_funcs = {
+	.detect = vkms_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -155,6 +173,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		connector = vkms_connector_init(vkmsdev, connector_cfg->possible_encoders);
 		if (IS_ERR(connector))
 			return PTR_ERR(connector);
+
+		connector_cfg->connector = connector;
 	}
 
 	drm_mode_config_reset(dev);
-- 
2.46.0

