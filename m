Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D411B3E2B9
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511D710E442;
	Mon,  1 Sep 2025 12:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CXNL+OMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB0F10E442
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:06 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-45b7da4101fso10918165e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729565; x=1757334365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p5emT1txqOTQl8l8EdMKxfHnYSU0tdBtClIdWbUlfFA=;
 b=CXNL+OMmytHo2pqFdFKczuipTLZ52ect2gBTOZiaAX/UUnYz1rUII14PHadwaWvroI
 +1lyguIMY5TNNLm6ruVzVLCqvi6wplBs7s0SfoLp8jPaoN7bPR/x+sVGNd2cOfwmNFV/
 LGt+9jIJale63VykQ5FeFhZn9dCemslRSb331M9Cr6bApJajwdw721dVzAY6f2ZqBQ2E
 wmC7l7Sui1hiaxzEkNCBjOrcnMaUEqYxNXbB2G0qltWxAwE+oJ0+2DK2cnT8CrtPXPMi
 jCklrCMTiekkbeRBRa3W5vu9NgtNlAw9Zzlh0j+7YQNFo7bAYYwnMrJVmtstBn4aFABu
 elFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729565; x=1757334365;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p5emT1txqOTQl8l8EdMKxfHnYSU0tdBtClIdWbUlfFA=;
 b=C8QhSXFQo5s0iDdWp4YSjxHJA7cbhLjm0dQ+ZInqNhvVaBAzmbGz9xXjBmCc2PuFzD
 DRrJ1E2NVl1xGbqrBlGWvF7q7A1cNmvNBETXoFNK4vxI/7tUrGkkkhyCGQEYhk9FkIu+
 SH9HxzEZOAfGHk/2YIEk9r7cibl5BSRvk7koYlUyyjiOF/J9N9Z14lQBvSQLVak4exCc
 zNCm0OeYz/OxnVroV88mXoE1NswwZJYUOyU9aHKvd0LSN2EQ+Sr8LlatMUnjwxiGMfjG
 YoirK24l28VE+nU8rAz8ugKdjra91B1FbGs/zlD7S1wbymDZu13vbrM8Ko6aoU4EGfDZ
 wYrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOWnSe+pXSA/o3hw15mqyVl4YZGma8ThKQMqngfDqBfzQ62D4UUfGtmYibhv4AWDgpH8XLl+PDwik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEjMXwwJVbH5AwhpsWIeu8FgFQH8iwcxWHESJZjwEIjgW8+I/5
 7+n/LHXxksLGrM1C61VUETlh1Ct8QmitKXwm1hczLhOTMPyntnxEhhgj
X-Gm-Gg: ASbGncsIs2csoINW138+vWliDtkoCxM5tywuOWD8C4fuBor3X/AvpS4gDjOu3ifJ672
 rbx9ThcOnJXpQhogWSUUP9/R37Bq3sc4C3yJHAsQEclhSYPaC4HTP5PAm988yDRMIVLMjWIKo4E
 9mO1MFjc1aGvV/OG38N+ewuMpwATj5OzJFmUAq4GylMY/92HbaItNrgcWr0W6CWt2QYaWw7iGyE
 WFndQBwjZyndwPUhexbdMzVM7eBWsgUpkZN9htSlgEhLQjxsBv2jt/NEBlwzWvj0bR5q5zjCK1H
 gt5rMzcnjEPJrrmD8L/JWgsiKT9XXt7KPn+jiWh8gREvzSCxYH9GeRqmAQtdBBHk7dgTVXypaVt
 EKpyiIvWzZTUPaPWATjUccObhPAZM
X-Google-Smtp-Source: AGHT+IH9OUHSYnmDvfNvwQVhN2EaEpCAmFC2+CVmXG8+ZkONOcCBzxF4EINwhVpS1L3JpXR2CwAlgg==
X-Received: by 2002:a05:600c:4452:b0:455:f187:6203 with SMTP id
 5b1f17b1804b1-45b855983cfmr53456195e9.27.1756729565277; 
 Mon, 01 Sep 2025 05:26:05 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:26:04 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v6 09/16] drm/vkms: Allow to attach encoders and CRTCs via
 configfs
Date: Mon,  1 Sep 2025 14:25:34 +0200
Message-ID: <20250901122541.9983-10-jose.exposito89@gmail.com>
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
/config/vkms/encoders/encoder/possible_crtcs that will contain symbolic
links to the possible CRTCs for the encoder.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 58 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 622fbfa12a84..585effe90550 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -106,6 +106,7 @@ Next, create one or more encoders::
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
+  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
 
 Since at least one primary plane is required, make sure to set the right type::
 
@@ -122,6 +123,7 @@ Finally, you can remove the VKMS instance disabling it::
 And removing the top level directory and its subdirectories::
 
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
+  sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 0df86e63570a..7de601e39d2b 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -70,11 +70,13 @@ struct vkms_configfs_crtc {
  *
  * @group: Top level configuration group that represents a encoder.
  * Initialized when a new directory is created under "/config/vkms/encoders"
+ * @possible_crtcs_group: Default subgroup of @group at "encoder/possible_crtcs"
  * @dev: The vkms_configfs_device this encoder belongs to
  * @config: Configuration of the VKMS encoder
  */
 struct vkms_configfs_encoder {
 	struct config_group group;
+	struct config_group possible_crtcs_group;
 	struct vkms_configfs_device *dev;
 	struct vkms_config_encoder *config;
 };
@@ -100,6 +102,10 @@ struct vkms_configfs_encoder {
 	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
 		     group)
 
+#define encoder_possible_crtcs_item_to_vkms_configfs_encoder(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
+		     possible_crtcs_group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -364,6 +370,52 @@ static const struct config_item_type plane_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int encoder_possible_crtcs_allow_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct vkms_configfs_crtc *crtc;
+	int ret;
+
+	if (target->ci_type != &crtc_item_type)
+		return -EINVAL;
+
+	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	scoped_guard(mutex, &encoder->dev->lock) {
+		if (encoder->dev->enabled)
+			return -EBUSY;
+
+		ret = vkms_config_encoder_attach_crtc(encoder->config, crtc->config);
+	}
+
+	return ret;
+}
+
+static void encoder_possible_crtcs_drop_link(struct config_item *src,
+					     struct config_item *target)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct vkms_configfs_crtc *crtc;
+
+	encoder = encoder_possible_crtcs_item_to_vkms_configfs_encoder(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	scoped_guard(mutex, &encoder->dev->lock)
+		vkms_config_encoder_detach_crtc(encoder->config, crtc->config);
+}
+
+static struct configfs_item_operations encoder_possible_crtcs_item_operations = {
+	.allow_link	= encoder_possible_crtcs_allow_link,
+	.drop_link	= encoder_possible_crtcs_drop_link,
+};
+
+static const struct config_item_type encoder_possible_crtcs_group_type = {
+	.ct_item_ops	= &encoder_possible_crtcs_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static void encoder_release(struct config_item *item)
 {
 	struct vkms_configfs_encoder *encoder;
@@ -413,6 +465,12 @@ static struct config_group *make_encoder_group(struct config_group *group,
 
 		config_group_init_type_name(&encoder->group, name,
 					    &encoder_item_type);
+
+		config_group_init_type_name(&encoder->possible_crtcs_group,
+					    "possible_crtcs",
+					    &encoder_possible_crtcs_group_type);
+		configfs_add_default_group(&encoder->possible_crtcs_group,
+					   &encoder->group);
 	}
 
 	return &encoder->group;
-- 
2.51.0

