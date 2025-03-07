Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE141A56DCF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 006B410EBF3;
	Fri,  7 Mar 2025 16:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a3uYxwU8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6440B10EBF0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:14 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso1651038f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365253; x=1741970053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cPglBRQzm3PeNfTp1IXfadGrcc/1PZ/sWQxkyGuh1Hg=;
 b=a3uYxwU8e1FyzJ+qF/7Go/fxTAALVFtRiiHl/O2zyTG42Bqlgatt7azGCrxKI1ly42
 UW05eWdluf8HJDGoxHvXKlnzpF3nKDlFlZs8MvzJn4Pb58meiTaBKHdw9wM9102aZcpT
 NG0yp5+2cdkis/wac5yJWZ58LOebiOg5OvFGPoR+z5YW7t935BWgC6vHjxj5rogvk80E
 1+GA0QkghLF1x2bPpsg/Xq1kcPYzKU4Jysg+I/fUXxZ5rsWrYT0BgbU6DhDrn8AJ1u0o
 k3kZz43aiSIoh5rifVyLceMVw2ZKmqsRBD1FV0qr8SFed51aB+su7JBy0GxU5uBUgx8q
 5Oyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365253; x=1741970053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cPglBRQzm3PeNfTp1IXfadGrcc/1PZ/sWQxkyGuh1Hg=;
 b=ZryWC7GVO1K0wEqf2HQdDNlYt84yVCk2ZXfCbBvxAy0HwV7HQz+UxF2SPsJwuUZWu6
 5T7I9vTr94GZo3tS55LbCoxt1i25t3VFYAK67J2tIJ0K8hMSCT4+toleLHGnMS0ukeI3
 CYJkiR1KKEL7MBujaKJjjdXPJMULw9oKh+/drh/yR6nsSyQbI4YK1I9Q1W+FPxn0qutC
 QmNoW8TWMwX54T/3ft1LbMZzj/4yjPZMKRAC2ENGgshHuO6HLx7I5GLl+m3p4Xp2u3aF
 P1fptpDOBkMgDdmBTKO+/DCkARZy1VxZq7TYt6mJ+c4vSYOUTZN8GtXyJL/tJBA+TzMW
 Ha6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC4vfL/CR4hONkicOeX0QSPQd2HSRIwDFp1aSAI4gFVpPCckdlReiW1rmOSY1xQMi34QWSiTNs790=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzStWz6UeWm7K9bJqNDqhTMQ8ZH9TVx01aWDWcBcm9F58Er5TwE
 6ZSRo1oCQMGQpVReNGZVqYg2AhWD4bAFoFMnAmtXDY9hr2PdcZiN
X-Gm-Gg: ASbGncuIZbWdQgNS/OINykxDZLtg+fn5sd4Xv4NXscBPhNOVgOBUpfT4tFpIfzwDPtv
 80u+cHS8oWrAZS8Ey+Ocq4/wCSGjQq6X7sxpLQhYQax+V9vWVUVornBeZQeTH9jKMVa6wkdzuFt
 +0g63xBZvLE5N/B+1yWJXKJhiNIgk9qqUUAbcn6V4UBGpD3N72mWucpYMPIQoWJJPDPQzBUPwrN
 DiN3lbt7bHKhJND2mkZd/rkIDMETyngx9hl3R22gY/B1utPSuP7uKgZ4RJrvFxSQrYIL+85pZIl
 PlVbBGbqWD4AnK26b7Qn6HDS5GClD97FJV6UGz+K3Opiipc=
X-Google-Smtp-Source: AGHT+IF63rOdhDcyNIxc0Af2rMIu3XHsDnVUzLpB/8CyhXcU6KC2Y/tzuWU0AngWy0NaISRGyKp2tQ==
X-Received: by 2002:a5d:5f4e:0:b0:391:fcc:9ee8 with SMTP id
 ffacd0b85a97d-39132d6bc06mr2454738f8f.23.1741365252797; 
 Fri, 07 Mar 2025 08:34:12 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:34:11 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 10/16] drm/vkms: Allow to configure multiple connectors via
 configfs
Date: Fri,  7 Mar 2025 17:33:47 +0100
Message-ID: <20250307163353.5896-11-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307163353.5896-1-jose.exposito89@gmail.com>
References: <20250307163353.5896-1-jose.exposito89@gmail.com>
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

Create a default subgroup at
/config/vkms/connectors to allow to create as many connectors as
required.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 87 ++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 650dbfa76f59..744e2355db23 100644
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
2.48.1

