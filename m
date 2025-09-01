Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB775B3E2BB
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA67A10E43E;
	Mon,  1 Sep 2025 12:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cyeCKqvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC97810E444
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:08 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45b84367affso19200655e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729567; x=1757334367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+EdjA0vhrNddd+9i5gDB5y7gnZlz2SruMLXGVcghljI=;
 b=cyeCKqvM6IzQzfczsAYwXAtgq5D8fSHGEFlDy5Bcd63mvuV+yiZyM/pGf2Jx4YZdds
 BkPmZfaf8JMWiHxsDhgFTHAqH1yPKZSR5QqKhaBbhK2M9rnGiuZVgk5jybsU0oSPeBLL
 FZN732AvTxMhWGSX1fbd1IiuUaU7pMx22p2uoXM1HN8Dr0RLwMqiDwOAgBqeGgGKzt+V
 Kuyia/fMlf5zKgQMSeU0IpwmqjxroMLpdEnwpbArXU52JIJLmhrG3IBrXQ/wvEdkVVMW
 tvaJ2Bp9ttTQUZFK/P3siskM3e7oaHXJPP4wX1bnHzV0IYAUXxnQk7DBYnYwu7vPKa4U
 H7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729567; x=1757334367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+EdjA0vhrNddd+9i5gDB5y7gnZlz2SruMLXGVcghljI=;
 b=w6G3c3iX6dqwMVBPEIz8fAJq1iITpM3xCeJuC9K6K5JQylJq1EvwFlOiB9rfAFsRxN
 webJLWdPnMSJa1MeIEt/jvRfqtB/dbx7hrl9Rh1XQ2fZJ+dvSOxEb0RPS3MWjN7l7dMc
 XfKfD7jqwumgnwiW8apsABr/BE6BKLDMsbIxVJVRLMJB/3Ku8yKxIMju7sZtzlna+e3d
 rrxSw3lo4m5QLq3EtflvCcMvzpH9NrSnGjrHZUa1FQrLLwUpc7L/xQsRes3Ha/q7Ikfk
 Cm69gNhK2Gpce379VoI2y3+54odr4hBedHYdK64EdwsB4ODxeZkMLL5CYezb30wUF7oO
 Zy3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVacaWWLSK/0IQDGOrnh2AZKmoV97aTP71D/SAeTBlod7Jn3GZw4W/7F0SmUS3XxByoQNTzSPx8ooY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDbSVHq7jZwrwRWgBj5mhNoKAFgV3gAsFP4WN/R5CR3VvniNGw
 K95VgNCGLT+bZ2tyMVw8Cwl81eN8Anor24TSl5lqBo+VqvVzoGrn5CBO
X-Gm-Gg: ASbGnctpo3gyv/d0tuVokX5HsBOUTNR+EJ6uI8GpAEN5ZmTVCQa5LssnRFbOW7jA9Ob
 31N2KIxZHH9TmtBGpvl32rqflOCCqNnAj9z4+wxUlQcG3XZJlYsu1IY5ykGfSehXLfCYaV6U0u6
 DLrnnJnZPzLqBzMFZOp+jBFn47qQsfTBBK3IS/eNDxcbNplAFrZeK8ZA84IDyQvJz/LKm4cT5Oz
 TmBqy6UtUkOuWc6fGi5eVXvIvKX6RXyNWbXF8ul6rmma1k59mCQJtl4B8NMLqMBAp2hvwWsqFor
 WdljvNtcv5h2MyPTtqvpxfM7c1toQYP97VwBTgmrfx2iaFDPcKHSYFuI+T27sk0aGRevj09mxBc
 rrnAifbqF3cg8YGkhCw==
X-Google-Smtp-Source: AGHT+IHOAqp/LTkHn6qqCuhKN9S0f6/aF1NMMUjbDRqd5pkFBV9AV+5lbxu0lm/Ili6PnKTocBLI3w==
X-Received: by 2002:a05:600c:3115:b0:45b:81b4:1917 with SMTP id
 5b1f17b1804b1-45b8555c359mr65565965e9.10.1756729566932; 
 Mon, 01 Sep 2025 05:26:06 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:26:05 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v6 10/16] drm/vkms: Allow to configure multiple connectors via
 configfs
Date: Mon,  1 Sep 2025 14:25:35 +0200
Message-ID: <20250901122541.9983-11-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901122541.9983-1-jose.exposito89@gmail.com>
References: <20250901122541.9983-1-jose.exposito89@gmail.com>
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

Create a default subgroup at
/config/vkms/connectors to allow to create as many connectors as
required.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 87 ++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 585effe90550..b799102d54ac 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -74,6 +74,7 @@ By default, the instance is disabled::
 And directories are created for each configurable item of the display pipeline::
 
   tree /config/vkms/my-vkms
+  ├── connectors
   ├── crtcs
   ├── enabled
   ├── encoders
@@ -103,6 +104,10 @@ Next, create one or more encoders::
 
   sudo mkdir /config/vkms/my-vkms/encoders/encoder0
 
+Last but not least, create one or more connectors::
+
+  sudo mkdir /config/vkms/my-vkms/connectors/connector0
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
@@ -127,6 +132,7 @@ And removing the top level directory and its subdirectories::
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
+  sudo rmdir /config/vkms/my-vkms/connectors/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 7de601e39d2b..692e1b708012 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -19,6 +19,7 @@ static bool is_configfs_registered;
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
  * @encoders_group: Default subgroup of @group at "/config/vkms/encoders"
+ * @connectors_group: Default subgroup of @group at "/config/vkms/connectors"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -29,6 +30,7 @@ struct vkms_configfs_device {
 	struct config_group planes_group;
 	struct config_group crtcs_group;
 	struct config_group encoders_group;
+	struct config_group connectors_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -81,6 +83,20 @@ struct vkms_configfs_encoder {
 	struct vkms_config_encoder *config;
 };
 
+/**
+ * struct vkms_configfs_connector - Configfs representation of a connector
+ *
+ * @group: Top level configuration group that represents a connector.
+ * Initialized when a new directory is created under "/config/vkms/connectors"
+ * @dev: The vkms_configfs_device this connector belongs to
+ * @config: Configuration of the VKMS connector
+ */
+struct vkms_configfs_connector {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_connector *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
@@ -106,6 +122,10 @@ struct vkms_configfs_encoder {
 	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
 		     possible_crtcs_group)
 
+#define connector_item_to_vkms_configfs_connector(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_connector, \
+		     group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -485,6 +505,69 @@ static const struct config_item_type encoder_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static void connector_release(struct config_item *item)
+{
+	struct vkms_configfs_connector *connector;
+	struct mutex *lock;
+
+	connector = connector_item_to_vkms_configfs_connector(item);
+	lock = &connector->dev->lock;
+
+	scoped_guard(mutex, lock) {
+		vkms_config_destroy_connector(connector->config);
+		kfree(connector);
+	}
+}
+
+static struct configfs_item_operations connector_item_operations = {
+	.release	= &connector_release,
+};
+
+static const struct config_item_type connector_item_type = {
+	.ct_item_ops	= &connector_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_connector_group(struct config_group *group,
+						 const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_connector *connector;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	scoped_guard(mutex, &dev->lock) {
+		if (dev->enabled)
+			return ERR_PTR(-EBUSY);
+
+		connector = kzalloc(sizeof(*connector), GFP_KERNEL);
+		if (!connector)
+			return ERR_PTR(-ENOMEM);
+
+		connector->dev = dev;
+
+		connector->config = vkms_config_create_connector(dev->config);
+		if (IS_ERR(connector->config)) {
+			kfree(connector);
+			return ERR_CAST(connector->config);
+		}
+
+		config_group_init_type_name(&connector->group, name,
+					    &connector_item_type);
+	}
+
+	return &connector->group;
+}
+
+static struct configfs_group_operations connectors_group_operations = {
+	.make_group	= &make_connector_group,
+};
+
+static const struct config_item_type connector_group_type = {
+	.ct_group_ops	= &connectors_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_device *dev;
@@ -592,6 +675,10 @@ static struct config_group *make_device_group(struct config_group *group,
 				    &encoder_group_type);
 	configfs_add_default_group(&dev->encoders_group, &dev->group);
 
+	config_group_init_type_name(&dev->connectors_group, "connectors",
+				    &connector_group_type);
+	configfs_add_default_group(&dev->connectors_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.51.0

