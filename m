Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784CB9502E4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 12:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24C910E2F4;
	Tue, 13 Aug 2024 10:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BDrYfwGA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660F010E2EE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:51:56 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42808071810so40378295e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723546315; x=1724151115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F/G5AnsYa7zmUTR/MiH01m+WsCKhEwrbdAUk5c5JpIU=;
 b=BDrYfwGAQ1mUuDdQPrLOonO0uMxETKmYjGIGO1SE5l2bkFwXAZ5W/uA9wj1uQCwf+A
 0vy1t5o57/E5NTHrY2fzeGcodO4Y3Ff1q9i/mkI11MnFSfgmeQ99o0J4dIEW0dUc+U+x
 KdFbkFNwHDu/zkUOBvu5BuVUrCQnC0zKhhllSeDU2tOs2dMgZMdhzUmetUM2c14jdUPE
 LKmNlEKaB0N1Qzsv0/+sjowEErxGU9rpTfuTUBsU6WC1HZGY7Zc5AtRnugv3UpV39+OM
 lLRt+yYXp5kRWWr7y/dRY//ghQWZuCxaMcYkIcFn1swlKA9USWTKwLLYGTPy+3h9B8xV
 9QPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723546315; x=1724151115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F/G5AnsYa7zmUTR/MiH01m+WsCKhEwrbdAUk5c5JpIU=;
 b=H/scolfpYl5FaTY9kpWEiolUIAWWLG7K51cYr8UrGsImtkeNx/41gPsoOyrQkeZLic
 DliRYH1LN+yPJ4q7tWSECdpNFrIRim4o0D2OlKkybKnOmjAotqMGOzjK0PqzDegkqfMH
 EJ9lcJiqBeEnzBBa1RVeujBNPC8RhPskkuvXw/+JPONKNMK2Hwxz/MwqnufyrVXGGKZs
 FIAZMLDBXsDdMvs+vI8R92yjK0ttTG5gyhaiiwFbDNOyi6Nq2EPmXQ3BKfEnveVQ7qew
 w6wZLaBdEmsMhuUIAWy09AjerdldRRbHeaIKlAMdSE+Fid/GkjuqINEiK2nruYSIDdXY
 ZlWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKXb3QUYKdqn0U8NKl6F/zItTQpYm44oxrg/NcvV71L9H4dk2bQzv95hQtZ7Rjzy1eUuC4sjpHHUMKAMqXyZPFDICnZmBBvGkR8kqNMJf1
X-Gm-Message-State: AOJu0YxVOmudczoHBKJeFFaz1cUCdaoGa3bFqEho1B8x0V0dqo5rtatO
 0JBvL1Z6mVBTQ4IMA/GB+8UxL+7X6kkoCLrtBk8MIq2a/lfRvd0a
X-Google-Smtp-Source: AGHT+IH8LR+1P5qUwpzWamxktmdZ24m1L+TeHAheXbr8p/lSB6gOBODyUIlICFjkqU13hylsNNiByA==
X-Received: by 2002:a05:600c:450e:b0:425:7796:8e2c with SMTP id
 5b1f17b1804b1-429d4805ac3mr20794595e9.12.1723546314557; 
 Tue, 13 Aug 2024 03:51:54 -0700 (PDT)
Received: from fedora.. ([213.94.26.172]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d877e066sm17290785e9.1.2024.08.13.03.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 03:51:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: rodrigosiqueiramelo@gmail.com
Cc: melissa.srw@gmail.com, mairacanal@riseup.net, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [RFC PATCH 13/17] drm/vkms: Allow to configure multiple encoders via
 configfs
Date: Tue, 13 Aug 2024 12:44:24 +0200
Message-ID: <20240813105134.17439-14-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/encoders to allow to create as
many encoders as required. When the encoder is created the
possible_crtcs subgroup is created allowing to link encoders and CRTCs.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  14 ++-
 drivers/gpu/drm/vkms/vkms_config.h   |   3 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 127 +++++++++++++++++++++++++--
 3 files changed, 136 insertions(+), 8 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 0886349ad4a0..c69be063d3b4 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -76,7 +76,8 @@ And directories are created for each configurable item of the display pipeline::
   tree /config/vkms/my-vkms
     /config/vkms/my-vkms
     ├── crtcs
-    └── enabled
+    ├── enabled
+    └── encoders
 
 To add items to the display pipeline, create one or more directories under the
 available paths.
@@ -90,6 +91,15 @@ CRTCs have 2 configurable attributes:
 - cursor: Enable or disable cursor plane support
 - writeback: Enable or disable writeback connector support
 
+Continue by creating one or more encoders::
+
+  sudo mkdir /config/vkms/my-vkms/encoders/encoder0
+
+Encoders can be linked to CRTCs by creating a symbolic link under
+``possible_crtcs``::
+
+  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -100,6 +110,8 @@ Finally, you can remove the VKMS instance disabling it::
 
 Or removing the top level directory and its subdirectories::
 
+  sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
+  sudo rmdir /config/vkms/my-vkms/encoders/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index f96a0456a3d7..f9423533a7f3 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -29,6 +29,9 @@ struct vkms_config_encoder {
 	struct list_head list;
 	unsigned int index;
 	uint32_t possible_crtcs;
+	/* only used if created from configfs */
+	struct config_group encoder_group;
+	struct config_group possible_crtcs_group;
 };
 
 struct vkms_config_connector {
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 04278a39cd3c..c0b62fb93dc0 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -19,6 +19,8 @@ static bool is_configfs_registered;
  * Initialized when a new directory is created under "/config/vkms/"
  * @crtcs_group: Default subgroup of @device_group at "/config/vkms/crtcs".
  * Each of its items represent a CRTC
+ * @encoders_group: Default subgroup of @device_group at
+ * "/config/vkms/encoders". Each of its items represent a encoder
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @enabled: Protected by @lock. The device is created or destroyed when this
  * option changes
@@ -27,6 +29,7 @@ struct vkms_configfs {
 	struct vkms_config *vkms_config;
 	struct config_group device_group;
 	struct config_group crtcs_group;
+	struct config_group encoders_group;
 
 	/* protected by @lock */
 	struct mutex lock;
@@ -45,6 +48,15 @@ struct vkms_configfs {
 #define crtcs_item_to_vkms_config_crtc(item) \
 	container_of(to_config_group(item), struct vkms_config_crtc, crtc_group)
 
+#define encoders_group_to_vkms_configfs(group) \
+	container_of(group, struct vkms_configfs, encoders_group)
+
+#define encoders_item_to_vkms_config_encoder(item) \
+	container_of(to_config_group(item), struct vkms_config_encoder, encoder_group)
+
+#define encoder_possible_crtcs_item_to_vkms_config_encoder(item) \
+	container_of(to_config_group(item), struct vkms_config_encoder, possible_crtcs_group)
+
 static ssize_t crtc_cursor_show(struct config_item *item, char *page)
 {
 	struct vkms_config_crtc *crtc_cfg = crtcs_item_to_vkms_config_crtc(item);
@@ -171,6 +183,110 @@ static struct config_item_type crtcs_group_type = {
 	.ct_owner = THIS_MODULE,
 };
 
+static int encoder_possible_crtcs_allow_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_crtc *crtc_cfg;
+
+	if (target->ci_type != &crtc_group_type)
+		return -EINVAL;
+
+	encoder_cfg = encoder_possible_crtcs_item_to_vkms_config_encoder(src);
+	crtc_cfg = crtcs_item_to_vkms_config_crtc(target);
+
+	if (encoder_cfg->possible_crtcs & BIT(crtc_cfg->index))
+		return -EINVAL;
+
+	encoder_cfg->possible_crtcs |= BIT(crtc_cfg->index);
+
+	return 0;
+}
+
+static void encoder_possible_crtcs_drop_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_config_crtc *crtc_cfg;
+
+	encoder_cfg = encoder_possible_crtcs_item_to_vkms_config_encoder(src);
+	crtc_cfg = crtcs_item_to_vkms_config_crtc(target);
+
+	encoder_cfg->possible_crtcs &= ~BIT(crtc_cfg->index);
+}
+
+static struct configfs_item_operations encoder_possible_crtcs_item_ops = {
+	.allow_link = &encoder_possible_crtcs_allow_link,
+	.drop_link = &encoder_possible_crtcs_drop_link,
+};
+
+static struct config_item_type encoder_possible_crtcs_group_type = {
+	.ct_item_ops = &encoder_possible_crtcs_item_ops,
+	.ct_owner = THIS_MODULE,
+};
+
+static const struct config_item_type encoder_group_type = {
+	.ct_owner = THIS_MODULE,
+};
+
+static struct config_group *make_encoders_group(struct config_group *group,
+						const char *name)
+{
+	struct vkms_configfs *configfs = encoders_group_to_vkms_configfs(group);
+	struct vkms_config_encoder *encoder_cfg;
+	int ret;
+
+	mutex_lock(&configfs->lock);
+
+	if (configfs->enabled) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	encoder_cfg = vkms_config_add_encoder(configfs->vkms_config, 0);
+	if (IS_ERR(encoder_cfg)) {
+		ret = PTR_ERR(encoder_cfg);
+		goto err_unlock;
+	}
+
+	config_group_init_type_name(&encoder_cfg->encoder_group, name,
+				    &encoder_group_type);
+
+	config_group_init_type_name(&encoder_cfg->possible_crtcs_group,
+				    "possible_crtcs",
+				    &encoder_possible_crtcs_group_type);
+	configfs_add_default_group(&encoder_cfg->possible_crtcs_group,
+				   &encoder_cfg->encoder_group);
+
+	mutex_unlock(&configfs->lock);
+
+	return &encoder_cfg->encoder_group;
+
+err_unlock:
+	mutex_unlock(&configfs->lock);
+	return ERR_PTR(ret);
+}
+
+static void drop_encoders_group(struct config_group *group,
+				struct config_item *item)
+{
+	struct vkms_configfs *configfs = encoders_group_to_vkms_configfs(group);
+	struct vkms_config_encoder *encoder_cfg =
+		encoders_item_to_vkms_config_encoder(item);
+
+	vkms_config_destroy_encoder(configfs->vkms_config, encoder_cfg);
+}
+
+static struct configfs_group_operations encoders_group_ops = {
+	.make_group = &make_encoders_group,
+	.drop_item = &drop_encoders_group,
+};
+
+static struct config_item_type encoders_group_type = {
+	.ct_group_ops = &encoders_group_ops,
+	.ct_owner = THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs *configfs = config_item_to_vkms_configfs(item);
@@ -225,7 +341,6 @@ static struct config_group *make_device_group(struct config_group *group,
 					      const char *name)
 {
 	struct vkms_configfs *configfs;
-	struct vkms_config_encoder *encoder_cfg = NULL;
 	struct vkms_config_connector *connector_cfg = NULL;
 	char *config_name;
 	int ret;
@@ -252,11 +367,10 @@ static struct config_group *make_device_group(struct config_group *group,
 	configfs_add_default_group(&configfs->crtcs_group,
 				   &configfs->device_group);
 
-	encoder_cfg = vkms_config_add_encoder(configfs->vkms_config, BIT(0));
-	if (IS_ERR(encoder_cfg)) {
-		ret = PTR_ERR(encoder_cfg);
-		goto err_kfree;
-	}
+	config_group_init_type_name(&configfs->encoders_group, "encoders",
+				    &encoders_group_type);
+	configfs_add_default_group(&configfs->encoders_group,
+				   &configfs->device_group);
 
 	connector_cfg = vkms_config_add_connector(configfs->vkms_config, BIT(0),
 						  connector_status_connected);
@@ -269,7 +383,6 @@ static struct config_group *make_device_group(struct config_group *group,
 
 err_kfree:
 	kfree(configfs);
-	kfree(encoder_cfg);
 	kfree(connector_cfg);
 	return ERR_PTR(ret);
 }
-- 
2.46.0

