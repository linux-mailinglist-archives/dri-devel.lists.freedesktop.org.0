Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C4BE4EFC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718F810E330;
	Thu, 16 Oct 2025 17:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Uxiw0WTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CED510E322
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-46fc5e54cceso8168815e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637406; x=1761242206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLtrTTPFfD+8IrWwSmDlmKNovc5NDcW2sakE1jdQk8A=;
 b=Uxiw0WTNjdOKNpovUdoVBL4UC9ORNjRYC2ydgKUvCAbgzzyt7kPXNDE6oTJYVKXrtl
 m3qbQC48uQH72p2BmoRtgmCLw5DIn1SEAF/gTOOCViZOSVCosLK/PRUhWQGx5k04gzzU
 spjNOG+MkwV/AhrKev9rci8ppFjZP1Pn4xcMNM6vVK0NHmKHdm/j75IYKjKMhUz4OPz8
 bEa1yvClYdiKDzgH5XLns/29fsu4hHkll4CiAV/wUw4UFR915XkgjqJJKMZ1VYiylxJi
 MoHvWDBYvWKLC0ni1s25dRThb77Dib8Bx4rRA5pvF2xUuhtWwnot3aUc9vYDM0A7R1Cz
 cH7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637406; x=1761242206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iLtrTTPFfD+8IrWwSmDlmKNovc5NDcW2sakE1jdQk8A=;
 b=JVj5/a/cu0hjs/j6dszrKKdN4LzBeiyNZOjFqddaorpGndP1vAaRqIMGsVmahzTA8T
 1NOHjSQTeU3cAIKyBlmZzyic5Tn5gVO2ufprcX7FO8JxiTSppM4fFsz7rpID147UVU64
 Uw/uyO9oKp+egyMKEH+gxWsh3h7Ftd2x/1UfxlbKjmNwPWLwwzxvsUNcThpQNjPnGncV
 acQ/5JN05klKgCUIM8TlCmPHlLr3RpXm0WzkIyfaiLfmN2VCmV4oKyod0717NvBLu+Fv
 p7p+kRGTiJ1SCFjbT5QUx0n/LIcowNL7xUwF2lDFtvIAi32H2O2YI2WNqRKnslxOeYjK
 EM3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfUgA3h2ySlqH0M++5etNwM8MDMR3akMNdqr1Fvf8cwLHNczMf03mUGOHz+9jcX9LeoTZuhSdluL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+uG8nJDjG8tNv0S3U993SSR0GfidYcnNyCt+vb4tMoji78NfT
 xX+q2ooBvl+V6MEL+obZed/xzFQitIezMiPOxgCYKcUXt41e0IsF0jct
X-Gm-Gg: ASbGncs9XCeYtGw2umz8VtXyiaqsyN0hIAxrkaRAXvyl1VYiTrXNuifNYlvitr1TuCb
 9PbUB5sIvoeohxiILQCA95CMJimkSaBiLuixJ3rg7wHf3RUdQEWli3z09duZQW+Tp2D8ZwWbozo
 bD7llWD6WypiW+vhABk8n2zIRk9DNz9gi4Ms3k0Wf1cg7Z8/58FmlSuX4DibIN6QxjmBcne/2tI
 b5kEiNIGIxNLKW64FzztX4dU5n5vUJ8i7RyoMGLCsPqh5uKfJVhaLl6AEulXAmOzogQjWO3ROUg
 EG9rsHtjPr36GNxSJg8Dt82T8LKYcFSv4Bue7Ji3ijHp09cgxO4SX3r5RwTT+TNhj9VgOkMdrcn
 vbTguTUC7tkVBP/jifzSZtkWXohaSn8J3bHsSxLqe2R4JKBJ/iIAPnk9yaaevRpMsEw6MWfGIdA
 /BufgIzHyeQQ==
X-Google-Smtp-Source: AGHT+IGtwT28xaTfBbSA0ncBa8fMQXZ02eYudn1PjoUHPrsoK1OdwE/M5iIpxKcnyWXvcIqcJ5fHSA==
X-Received: by 2002:a05:600c:548a:b0:471:ff3:7514 with SMTP id
 5b1f17b1804b1-47117877736mr6435215e9.12.1760637405530; 
 Thu, 16 Oct 2025 10:56:45 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:44 -0700 (PDT)
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
Subject: [PATCH v7 03/16] drm/vkms: Allow to configure multiple planes via
 configfs
Date: Thu, 16 Oct 2025 19:56:05 +0200
Message-ID: <20251016175618.10051-4-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/planes to allow to create as
many planes as required.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           | 16 ++++-
 drivers/gpu/drm/vkms/vkms_configfs.c | 88 ++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 73521b9ff0c3..c0c892e4e27c 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -71,6 +71,19 @@ By default, the instance is disabled::
   cat /config/vkms/my-vkms/enabled
   0
 
+And directories are created for each configurable item of the display pipeline::
+
+  tree /config/vkms/my-vkms
+  ├── enabled
+  └── planes
+
+To add items to the display pipeline, create one or more directories under the
+available paths.
+
+Start by creating one or more planes::
+
+  sudo mkdir /config/vkms/my-vkms/planes/plane0
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -79,8 +92,9 @@ Finally, you can remove the VKMS instance disabling it::
 
   echo "0" | sudo tee /config/vkms/my-vkms/enabled
 
-And removing the top level directory::
+And removing the top level directory and its subdirectories::
 
+  sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index ee186952971b..a7c705e00e4c 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -16,6 +16,7 @@ static bool is_configfs_registered;
  *
  * @group: Top level configuration group that represents a VKMS device.
  * Initialized when a new directory is created under "/config/vkms/"
+ * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -23,16 +24,99 @@ static bool is_configfs_registered;
  */
 struct vkms_configfs_device {
 	struct config_group group;
+	struct config_group planes_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
 	bool enabled;
 };
 
+/**
+ * struct vkms_configfs_plane - Configfs representation of a plane
+ *
+ * @group: Top level configuration group that represents a plane.
+ * Initialized when a new directory is created under "/config/vkms/planes"
+ * @dev: The vkms_configfs_device this plane belongs to
+ * @config: Configuration of the VKMS plane
+ */
+struct vkms_configfs_plane {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_plane *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
 
+#define child_group_to_vkms_configfs_device(group) \
+	device_item_to_vkms_configfs_device((&(group)->cg_item)->ci_parent)
+
+#define plane_item_to_vkms_configfs_plane(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
+
+static void plane_release(struct config_item *item)
+{
+	struct vkms_configfs_plane *plane;
+	struct mutex *lock;
+
+	plane = plane_item_to_vkms_configfs_plane(item);
+	lock = &plane->dev->lock;
+
+	scoped_guard(mutex, lock) {
+		vkms_config_destroy_plane(plane->config);
+		kfree(plane);
+	}
+}
+
+static struct configfs_item_operations plane_item_operations = {
+	.release	= &plane_release,
+};
+
+static const struct config_item_type plane_item_type = {
+	.ct_item_ops	= &plane_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_plane_group(struct config_group *group,
+					     const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_plane *plane;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	scoped_guard(mutex, &dev->lock) {
+		if (dev->enabled)
+			return ERR_PTR(-EBUSY);
+
+		plane = kzalloc(sizeof(*plane), GFP_KERNEL);
+		if (!plane)
+			return ERR_PTR(-ENOMEM);
+
+		plane->dev = dev;
+
+		plane->config = vkms_config_create_plane(dev->config);
+		if (IS_ERR(plane->config)) {
+			kfree(plane);
+			return ERR_CAST(plane->config);
+		}
+
+		config_group_init_type_name(&plane->group, name, &plane_item_type);
+	}
+
+	return &plane->group;
+}
+
+static struct configfs_group_operations planes_group_operations = {
+	.make_group	= &make_plane_group,
+};
+
+static const struct config_item_type plane_group_type = {
+	.ct_group_ops	= &planes_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_device *dev;
@@ -128,6 +212,10 @@ static struct config_group *make_device_group(struct config_group *group,
 	config_group_init_type_name(&dev->group, name, &device_item_type);
 	mutex_init(&dev->lock);
 
+	config_group_init_type_name(&dev->planes_group, "planes",
+				    &plane_group_type);
+	configfs_add_default_group(&dev->planes_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.51.0

