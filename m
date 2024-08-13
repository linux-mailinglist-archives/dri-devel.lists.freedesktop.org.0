Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A59502ED
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE3010E2EB;
	Tue, 13 Aug 2024 10:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PaZBITCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F33910E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:58 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52fc4388a64so7337118e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546316; x=1724151116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GIG00hBvhxwE6VfxQ1Dl1AavFjjBn2BviUu5FBbH+3g=;
 b=PaZBITCNEEh7mxUYjAqRgn/8KrpuSaeSlCr1wIuK3SA9dpZvMw15hxOKH1dJV8D/Nu
 8rmHK/2TaB0ZlPJBfbxVAuwskAojQWr8wrQlh6OUL4C+CZF8IFNaztrGskMjNDovaBB2
 gMJF5WgzBdHna6dDmuLbQ2/N5gVzp8y5n2h4CWM+1zBjqZduSP6XX+i7chhZvXXI4BSk
 chcI7p6XNQpMOgTPml1r5JC7bd98xQ+YGtsvnVG/PYiZC1sMBdPnr3sLLPscZiIzHnhn
 u3b5iw3RSuWb7o5BcPMbVIthxBVZ5LDn6LbtE+SDx6pDLADzRxEAzf81LYtmarpHGlQL
 bCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546316; x=1724151116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GIG00hBvhxwE6VfxQ1Dl1AavFjjBn2BviUu5FBbH+3g=;
 b=kv6IHlMXNLb71plEuAl2XIFJG3Vx9j9RcrIhT+SUud5laDZlgaZ3mWPBJFOTf6wQnW
 N5xTTAGzRPSJVvB/qq2h92L0hMbLtfLu1BzXnNrJlUlTapk+k2xCpjw2uxWZXBUAu0nA
 i77RxB5+IVllPumsGyA5OpKaelEnjK0nDyU/cV+ygnANJHLzM+HmAG5nTwGxJsRkiM9T
 S/5jQeV5SLCYlWzwgMa+lI0BGZrvhLvmwl31VQLF7S0omJLWx8gIxa2HJy0xniZtm6bw
 BiDB+TXSj/TmtIceSYWvKP9zULQF+F77T3tqhXQJ/lzb/IMx0727HooGag5tSP2rt9o8
 kadg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2UVw1bi35Q/el4jVXdOn2zXQ7l3NFFnoffud1itTvplmsDeWEXbhH6Af6muUcImAj4umPhaJvB1nBFGNo5GizPvapjSlrWAxMHKr9oZu5
X-Gm-Message-State: AOJu0YwTyFe/Jm7eZAfz6gY1shhiLb0fVvfs+RlieYrB8TCnQiWr42vl
 E6UhMnC3dNQTKlNutjXUDtxGMX/isBM04wnua4Zpgt3yy1y5huCh
X-Google-Smtp-Source: AGHT+IHG61sFSXaG2KPmxHnV7dm/Gc1K15rhK/tEp3tOyYNwnbyxbnWi9QRN7AYcotU8SvHARdSFyw==
X-Received: by 2002:a05:6512:31ce:b0:52e:9b15:1c60 with SMTP id
 2adb3069b0e04-53213680d76mr1857158e87.48.1723546315942; 
 Tue, 13 Aug 2024 03:51:55 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:55 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 14/17] drm/vkms: Allow to configure multiple encoders
Date: Tue, 13 Aug 2024 12:44:25 +0200
Message-ID: <20240813105134.17439-15-jose.exposito89@gmail.com>
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
 Documentation/gpu/vkms.rst           |  16 +++
 drivers/gpu/drm/vkms/vkms_config.h   |   3 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 184 ++++++++++++++++++++++++---
 3 files changed, 188 insertions(+), 15 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index c69be063d3b4..b6ceb8c48310 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -75,6 +75,7 @@ And directories are created for each configurable item of the display pipeline::
 
   tree /config/vkms/my-vkms
     /config/vkms/my-vkms
+    ├── connectors
     ├── crtcs
     ├── enabled
     └── encoders
@@ -100,16 +101,31 @@ Encoders can be linked to CRTCs by creating a symbolic link under
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
 
+Next, create one or more connectors::
+
+  sudo mkdir /config/vkms/my-vkms/connectors/connector0
+
+The status of the connector can be changed writing ``1`` (connected), ``2``
+(disconnected) or ``3`` (unknown) to the ``status`` attribute and they can be
+linked to encoders by creating a symbolic link under ``possible_encoders``::
+
+  sudo ln -s /config/vkms/my-vkms/encoders/encoder0 /config/vkms/my-vkms/connectors/connector0/possible_encoders
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
 
+Note that the connector ``status`` can be changed once the VKMS instance is
+enabled to emulate hot-plug/unplug.
+
 Finally, you can remove the VKMS instance disabling it::
 
   echo "0" | sudo tee /config/vkms/my-vkms/enabled
 
 Or removing the top level directory and its subdirectories::
 
+  sudo rm /config/vkms/my-vkms/connectors/*/possible_encoders/*
+  sudo rmdir /config/vkms/my-vkms/connectors/*
   sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index f9423533a7f3..cf45e3f6ae92 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -40,6 +40,9 @@ struct vkms_config_connector {
 	enum drm_connector_status status;
 	/* only set when instantiated */
 	struct drm_connector *connector;
+	/* only used if created from configfs */
+	struct config_group connector_group;
+	struct config_group possible_encoders_group;
 };
 
 struct vkms_config {
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index c0b62fb93dc0..d2369f53e2d8 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -21,6 +21,8 @@ static bool is_configfs_registered;
  * Each of its items represent a CRTC
  * @encoders_group: Default subgroup of @device_group at
  * "/config/vkms/encoders". Each of its items represent a encoder
+ * @connectors_group: Default subgroup of @device_group at
+ * "/config/vkms/connectors". Each of its items represent a connector
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @enabled: Protected by @lock. The device is created or destroyed when this
  * option changes
@@ -30,6 +32,7 @@ struct vkms_configfs {
 	struct config_group device_group;
 	struct config_group crtcs_group;
 	struct config_group encoders_group;
+	struct config_group connectors_group;
 
 	/* protected by @lock */
 	struct mutex lock;
@@ -57,6 +60,18 @@ struct vkms_configfs {
 #define encoder_possible_crtcs_item_to_vkms_config_encoder(item) \
 	container_of(to_config_group(item), struct vkms_config_encoder, possible_crtcs_group)
 
+#define connectors_group_to_vkms_configfs(group) \
+	container_of(group, struct vkms_configfs, connectors_group)
+
+#define connectors_item_to_vkms_configfs(item) \
+	container_of(to_config_group(item), struct vkms_configfs, connectors_group)
+
+#define connector_item_to_vkms_config_connector(item) \
+	container_of(to_config_group(item), struct vkms_config_connector, connector_group)
+
+#define connector_possible_encoders_item_to_vkms_config_connector(item) \
+	container_of(to_config_group(item), struct vkms_config_connector, possible_encoders_group)
+
 static ssize_t crtc_cursor_show(struct config_item *item, char *page)
 {
 	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
@@ -287,6 +302,154 @@ static struct config_item_type encoders_group_type = {
 	.ct_owner = THIS_MODULE,
 };
 
+static int connector_possible_encoders_allow_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_config_connector *connector_cfg;
+	struct vkms_config_encoder *encoder_cfg;
+
+	if (target->ci_type != &encoder_group_type)
+		return -EINVAL;
+
+	connector_cfg = connector_possible_encoders_item_to_vkms_config_connector(src);
+	encoder_cfg = encoders_item_to_vkms_config_encoder(target);
+
+	if (connector_cfg->possible_encoders & BIT(encoder_cfg->index))
+		return -EINVAL;
+
+	connector_cfg->possible_encoders |= BIT(encoder_cfg->index);
+
+	return 0;
+}
+
+static void connector_possible_encoders_drop_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_config_connector *connector_cfg;
+	struct vkms_config_encoder *encoder_cfg;
+
+	connector_cfg = connector_possible_encoders_item_to_vkms_config_connector(src);
+	encoder_cfg = encoders_item_to_vkms_config_encoder(target);
+
+	connector_cfg->possible_encoders &= ~BIT(encoder_cfg->index);
+}
+
+static struct configfs_item_operations connector_possible_encoders_item_ops = {
+	.allow_link = &connector_possible_encoders_allow_link,
+	.drop_link = &connector_possible_encoders_drop_link,
+};
+
+static struct config_item_type connector_possible_encoders_group_type = {
+	.ct_item_ops = &connector_possible_encoders_item_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+static ssize_t connector_status_show(struct config_item *item, char *page)
+{
+	struct vkms_config_connector *connector_cfg =
+		connector_item_to_vkms_config_connector(item);
+
+	return sprintf(page, "%d\n", connector_cfg->status);
+}
+
+static ssize_t connector_status_store(struct config_item *item, const char *page,
+				      size_t count)
+{
+	struct vkms_configfs *configfs;
+	struct vkms_config_connector *connector_cfg;
+	int status;
+
+	if (kstrtoint(page, 10, &status))
+		return -EINVAL;
+
+	switch (status) {
+	case connector_status_connected:
+	case connector_status_disconnected:
+	case connector_status_unknown:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	configfs = connectors_item_to_vkms_configfs(item->ci_parent);
+	connector_cfg = connector_item_to_vkms_config_connector(item);
+
+	vkms_update_connector_status(configfs->vkms_config, connector_cfg, status);
+
+	return (ssize_t)count;
+}
+
+CONFIGFS_ATTR(connector_, status);
+
+static struct configfs_attribute *connector_group_attrs[] = {
+	&connector_attr_status,
+	NULL,
+};
+
+static const struct config_item_type connector_group_type = {
+	.ct_attrs = connector_group_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
+static struct config_group *make_connectors_group(struct config_group *group,
+						  const char *name)
+{
+	struct vkms_configfs *configfs = connectors_group_to_vkms_configfs(group);
+	struct vkms_config_connector *connector_cfg;
+	int ret;
+
+	mutex_lock(&configfs->lock);
+
+	if (configfs->enabled) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	connector_cfg = vkms_config_add_connector(configfs->vkms_config, 0,
+						  connector_status_connected);
+	if (IS_ERR(connector_cfg)) {
+		ret = PTR_ERR(connector_cfg);
+		goto err_unlock;
+	}
+
+	config_group_init_type_name(&connector_cfg->connector_group, name,
+				    &connector_group_type);
+
+	config_group_init_type_name(&connector_cfg->possible_encoders_group,
+				    "possible_encoders",
+				    &connector_possible_encoders_group_type);
+	configfs_add_default_group(&connector_cfg->possible_encoders_group,
+				   &connector_cfg->connector_group);
+
+	mutex_unlock(&configfs->lock);
+
+	return &connector_cfg->connector_group;
+
+err_unlock:
+	mutex_unlock(&configfs->lock);
+	return ERR_PTR(ret);
+}
+
+static void drop_connectors_group(struct config_group *group,
+				  struct config_item *item)
+{
+	struct vkms_configfs *configfs = connectors_group_to_vkms_configfs(group);
+	struct vkms_config_connector *connector_cfg =
+		connector_item_to_vkms_config_connector(item);
+
+	vkms_config_destroy_connector(configfs->vkms_config, connector_cfg);
+}
+
+static struct configfs_group_operations connectors_group_ops = {
+	.make_group = &make_connectors_group,
+	.drop_item = &drop_connectors_group,
+};
+
+static struct config_item_type connectors_group_type = {
+	.ct_group_ops = &connectors_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs *configfs = config_item_to_vkms_configfs(item);
@@ -341,9 +504,7 @@ static struct config_group *make_device_group(struct config_group *group,
 					      const char *name)
 {
 	struct vkms_configfs *configfs;
-	struct vkms_config_connector *connector_cfg = NULL;
 	char *config_name;
-	int ret;
 
 	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
 		return ERR_PTR(-EINVAL);
@@ -358,8 +519,8 @@ static struct config_group *make_device_group(struct config_group *group,
 	config_name = config_item_name(&configfs->device_group.cg_item);
 	configfs->vkms_config = vkms_config_create(config_name);
 	if (IS_ERR(configfs->vkms_config)) {
-		ret = PTR_ERR(configfs->vkms_config);
-		goto err_kfree;
+		kfree(configfs);
+		return ERR_CAST(configfs->vkms_config);
 	}
 
 	config_group_init_type_name(&configfs->crtcs_group, "crtcs",
@@ -372,19 +533,12 @@ static struct config_group *make_device_group(struct config_group *group,
 	configfs_add_default_group(&configfs->encoders_group,
 				   &configfs->device_group);
 
-	connector_cfg = vkms_config_add_connector(configfs->vkms_config, BIT(0),
-						  connector_status_connected);
-	if (IS_ERR(connector_cfg)) {
-		ret = PTR_ERR(connector_cfg);
-		goto err_kfree;
-	}
+	config_group_init_type_name(&configfs->connectors_group, "connectors",
+				    &connectors_group_type);
+	configfs_add_default_group(&configfs->connectors_group,
+				   &configfs->device_group);
 
 	return &configfs->device_group;
-
-err_kfree:
-	kfree(configfs);
-	kfree(connector_cfg);
-	return ERR_PTR(ret);
 }
 
 static void drop_device_group(struct config_group *group,
-- 
2.46.0

