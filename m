Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4EA7D74F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D563810E3A1;
	Mon,  7 Apr 2025 08:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L5BYIJhS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55F110E39A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:43 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so20233615e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013682; x=1744618482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDtCC6WPPqEmxKPhos4FDITpDjg13+QxXsw1Dug2hLM=;
 b=L5BYIJhSz7ZIRv0qLkzEpuKbyavIpvEwGPQvRIBRXd+ZkL6egX+fm8qpJV0PQPe6Gt
 yB5cBW6OlIKWbR6SWsa/0TM7SgJeU24Eo1mK51+Bj8z+EF/mCYmXeZp7dSyG7Vc9haTN
 ZGrhUXJGvs3fgaSBkLM7DWBp6sDyGJA5CQ38eQ04zucX8RLoTnospFawuZw/9aXfyUIG
 I9OsgatfZQEI7A6XqkQqdIV5X5b+VY1n9vzBafGj3gqqvbvuo5YRCGn63ulUKmUpdhod
 Y3eVxTY21L2jQbNx2GjRXCsyvHt3+DtbnymnnEcu5Qm7oubDu20aJoonstBHbKr3F3Vn
 Xpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013682; x=1744618482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDtCC6WPPqEmxKPhos4FDITpDjg13+QxXsw1Dug2hLM=;
 b=h66zJ7BaT9NQ/15qRRIvkkwpvkweGTTDuJWTtIgJcx4AJMhLlnLhvt0cYn/je3NgJd
 lT+Whp0oVyILMGagLArbBQCKGqv+SviYZ1W7mutsI5w/sKV6PnDTyx2ys9HUa3thty1X
 ivl2A+1jkro7aYn4tI24M3EDvEgoYaipq226wMEs1gzr2rh+/GWfrK0pLcUwCj4lVnVf
 75Gb0Q+k13YIQY7ZRLm4rrcwrimeeHufgckjg8w2hk3Dn8rtvFrY3vpgsviCmh8LspHy
 XKg0rK7kW4ZQ003Jlp4v7zM59zrddZJ3O9NzTjIgVD4GQgy2IfHWp3t6dyE84ZS/G+gc
 1WSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyCiANVbUxeVgmxEI1t/rW+qE4FYI0zNvghzJ6/1hMrVZXmT16L67ELvqLAiDfMNmpsxNGwy+wNtQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl+fXAVH5PIerqxPADL7n9eUmywxKXVgTQk0EjFRtwB7QLqnwO
 7v8tWkMvULnihaV2L69P/L8f1eiqGJ4NtoO+wCNJF4xmJ3Fs/DnW
X-Gm-Gg: ASbGnctRFjbeh53etec/MDyqZpTafgovyE/jDANMOnDVYwHbLjZBSBToN78pju5l4fh
 WsTXTfZpwJ3iHNtKVH8mDyqxP1N16HDESP8sdtd7e2Xf4gvU4cHlMfl9ZDURKbovWeb/bfLMuDN
 /NsufbD1qP+E4lvTYh46NK+S0ZaZe9HiqHukHfbncotYTJddH8V/Yt2O+/LPW82CHRN9/6qyqnC
 Hp4shKcXbUOrlOgo+XZmhzB/iysEOk0dffZCucfdcrQxp0nzcr31O9Xb6G1XLjYr6/Uz0zCCx80
 ROcKAkJgJ+yyLmyHb7Jx4zYrhDvMpKnpeICEqkY/K7Gj
X-Google-Smtp-Source: AGHT+IFv3N5CjA50DYh7NKzdUNFZe5+gAyJ96Kzu1deHkeTcpi2IBmRpXiK4xLtLmHZsZonXiPdJfg==
X-Received: by 2002:a05:600c:4713:b0:43d:b3:f95 with SMTP id
 5b1f17b1804b1-43ecfa35e5dmr81341465e9.28.1744013681951; 
 Mon, 07 Apr 2025 01:14:41 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:41 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 07/16] drm/vkms: Allow to attach planes and CRTCs via
 configfs
Date: Mon,  7 Apr 2025 10:14:16 +0200
Message-ID: <20250407081425.6420-8-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250407081425.6420-1-jose.exposito89@gmail.com>
References: <20250407081425.6420-1-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/planes/plane/possible_crtcs
that will contain symbolic links to the possible CRTCs for the plane.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  9 +++++
 drivers/gpu/drm/vkms/vkms_configfs.c | 58 ++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index abe7a0f5a4ab..13b96837a266 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -98,6 +98,14 @@ CRTCs have 1 configurable attribute:
 
 - writeback: Enable or disable writeback connector support by writing 1 or 0
 
+To finish the configuration, link the different pipeline items::
+
+  sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
+
+Since at least one primary plane is required, make sure to set the right type::
+
+  echo "1" | sudo tee /config/vkms/my-vkms/planes/plane0/type
+
 Once you are done configuring the VKMS instance, enable it::
 
   echo "1" | sudo tee /config/vkms/my-vkms/enabled
@@ -108,6 +116,7 @@ Finally, you can remove the VKMS instance disabling it::
 
 And removing the top level directory and its subdirectories::
 
+  sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index e9f445043268..2cf97c2b6203 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -38,11 +38,13 @@ struct vkms_configfs_device {
  *
  * @group: Top level configuration group that represents a plane.
  * Initialized when a new directory is created under "/config/vkms/planes"
+ * @possible_crtcs_group: Default subgroup of @group at "plane/possible_crtcs"
  * @dev: The vkms_configfs_device this plane belongs to
  * @config: Configuration of the VKMS plane
  */
 struct vkms_configfs_plane {
 	struct config_group group;
+	struct config_group possible_crtcs_group;
 	struct vkms_configfs_device *dev;
 	struct vkms_config_plane *config;
 };
@@ -71,6 +73,10 @@ struct vkms_configfs_crtc {
 #define plane_item_to_vkms_configfs_plane(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_plane, group)
 
+#define plane_possible_crtcs_item_to_vkms_configfs_plane(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_plane, \
+		     possible_crtcs_group)
+
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
@@ -178,6 +184,52 @@ static const struct config_item_type crtc_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int plane_possible_crtcs_allow_link(struct config_item *src,
+					   struct config_item *target)
+{
+	struct vkms_configfs_plane *plane;
+	struct vkms_configfs_crtc *crtc;
+	int ret;
+
+	if (target->ci_type != &crtc_item_type)
+		return -EINVAL;
+
+	plane = plane_possible_crtcs_item_to_vkms_configfs_plane(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	scoped_guard(mutex, &plane->dev->lock) {
+		if (plane->dev->enabled)
+			return -EBUSY;
+
+		ret = vkms_config_plane_attach_crtc(plane->config, crtc->config);
+	}
+
+	return ret;
+}
+
+static void plane_possible_crtcs_drop_link(struct config_item *src,
+					   struct config_item *target)
+{
+	struct vkms_configfs_plane *plane;
+	struct vkms_configfs_crtc *crtc;
+
+	plane = plane_possible_crtcs_item_to_vkms_configfs_plane(src);
+	crtc = crtc_item_to_vkms_configfs_crtc(target);
+
+	scoped_guard(mutex, &plane->dev->lock)
+		vkms_config_plane_detach_crtc(plane->config, crtc->config);
+}
+
+static struct configfs_item_operations plane_possible_crtcs_item_operations = {
+	.allow_link	= plane_possible_crtcs_allow_link,
+	.drop_link	= plane_possible_crtcs_drop_link,
+};
+
+static const struct config_item_type plane_possible_crtcs_group_type = {
+	.ct_item_ops	= &plane_possible_crtcs_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t plane_type_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_plane *plane;
@@ -272,6 +324,12 @@ static struct config_group *make_plane_group(struct config_group *group,
 		}
 
 		config_group_init_type_name(&plane->group, name, &plane_item_type);
+
+		config_group_init_type_name(&plane->possible_crtcs_group,
+					    "possible_crtcs",
+					    &plane_possible_crtcs_group_type);
+		configfs_add_default_group(&plane->possible_crtcs_group,
+					   &plane->group);
 	}
 
 	return &plane->group;
-- 
2.48.1

