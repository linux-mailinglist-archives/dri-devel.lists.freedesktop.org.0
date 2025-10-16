Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F194BE4F11
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC40D10E322;
	Thu, 16 Oct 2025 17:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SAAaH5SH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7510E0E8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:55 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b85so952270f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637414; x=1761242214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=shMWPvpLGjrKhi5mqB9amNwRWIAGapj+R8HHzVpz0Ms=;
 b=SAAaH5SHzz0znSlzpncYZ0pV0MpPM5LzvFLT4iQz1IdvV24X8zg+1KplYKtTR3/3qu
 5rmqSH+51mgMma9ZyqoD2m8wlP2b9IhHffVuF+4CtnSXR8Oi14FoL0qe34VrheYyk0qP
 CqEtRF4JDmISNRDMOSPUH8BGV7ahTDPVsN6cIIhnV2dwxpGRfZMZffEu116rqYbMHv7t
 26tTd6k/wKjR6EofJ9Tn13ITIOu8FU0aQFSAufIjfoDaec/1bCXTRy9Z3oSXppKIn4g8
 l7S/H7/JQhu2ij8ES/sIRdSEwb9bejtwCcYcX1F0WBj8izRIsS0+aB2wc0nMu6Xpm9TO
 Pv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637414; x=1761242214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=shMWPvpLGjrKhi5mqB9amNwRWIAGapj+R8HHzVpz0Ms=;
 b=atM3pMYYnz+Eu/Q1WPIVBUahBK2HQPr2KgmfxVwhVRaJxrN9eLuuCnnbdqcs/5Re7A
 BuIijW3uYvvFW6ak7FN7uMPAgEk3fqkPULLa0DLb2Vzg4sUGzVPf5Vhuo49KowZItQic
 rEoI8DR8lWYi5UFYuDVFbK6rOG9tWn+F4lrGuxRgvlMvosY8EDZlHB4trW87B6GJJ3qv
 8jIz6guDwsI+Qu4zXIpBb6TyBhaymYtOV1HRXwluXeXQ+vw/6oOl66xW0PbtjnsVaqFT
 9tSMKD+LzPoDrNydZjTSh7MNCXl2PWEQ9AO7kA8Id1nvRX35n598S2rbIFkUsI78ir/H
 1iDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5oSQD44EJZnXPbeQnBBWVRL+ImRFUem9rk6auFHPGCL47SlFXhz/dQ/UfO9vwaeylWQ34PgPqyBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIqpylnrc6AvdkS2TLATUK8szoMU5GRZAT8qjkbnuoarc8YLN6
 RoZ+0lS7G0cb99ktFhb/73OE9oSouEDBanruuU9I+kCYvUdCP5fsBSeS
X-Gm-Gg: ASbGncvriRGrsK4MBZLRURAdAJWgJVoRboWQvwa4WnzR6OCHweY+45IoVZOHJrQQTaW
 xoy3DENZf6p8z77Dxb8LSIpze9qPoBqrnQSEDtpnRQQ9adNZzJxkbUtiNcV8Kz7Lj8LEarQdbUN
 BbeFMP+/OhAzVnCBXhj+AAKy17zDOEYLfp+xO/sMHMohdFAykKvEbJZOF9yc93vGi8XCZZXtcyf
 4R6V8mYbUB5yL3i6XKmHjbe1bneaygRKiJlZbwzK0f9zjIDr22m++aum7cl88iF3WdTA52oN4C+
 Pw9ZX5/iGA3dPrw14UpWmD96C14z4aUtqrzIbWYavFspjn2qdKcW29XN6KrJYS8zpXO2R+Jr61p
 OEXxYgUF7pcRz4IuQ9K3qwUYRKwIDvkGV74OwHQgzkRVIsvNsjkQn5a3+1LI/F9rE0PY16IzOpB
 xE/EcuHLMuxA==
X-Google-Smtp-Source: AGHT+IFBqpMFmNajovNOjH5ujqR7J+H08sNbKwm0IQ3czO2wNshvulU7VoFpV0v2RuhzWQjvaWTbEw==
X-Received: by 2002:a05:6000:200c:b0:3ee:1578:3181 with SMTP id
 ffacd0b85a97d-42704db2b7amr741938f8f.49.1760637413931; 
 Thu, 16 Oct 2025 10:56:53 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v7 10/16] drm/vkms: Allow to configure multiple connectors via
 configfs
Date: Thu, 16 Oct 2025 19:56:12 +0200
Message-ID: <20251016175618.10051-11-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016175618.10051-1-jose.exposito89@gmail.com>
References: <20251016175618.10051-1-jose.exposito89@gmail.com>
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
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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

