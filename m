Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B39EB3E2B7
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D98E10E43F;
	Mon,  1 Sep 2025 12:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MzhzyuWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5932D10E441
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-45b8b7ac427so6072095e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729563; x=1757334363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S92TFORdFpPvYJUBMVUr5Ti+IlOYwkoe/RCwplITijU=;
 b=MzhzyuWEhydjHqZKo1KJkHRvqE/TdFS33zY3Dj2J2MqkLmh3cihKtlC6xQtLt/sDwa
 AFi/xk4/6m80WbBl81/rJXUs0sY+YEGyfs/1zQ4B8ED7ClQAwMj4il84Fb70LSQvGaWX
 F858HagEjYN+QXvTY8nbfY8HRnXJGxxP+bzXUxR6n98dK7BcnAItj1QDISrGLhmn8Xpw
 2FUflbFSf6AJlaEGnbXYHk8ZcsIXMao0gKoz92sacTnkHN8yfu3uROyD/B90ve4+8Dek
 HNFVm3VEbKudsapB5D1TVEfssdcwm8dtPHSdtd1q737BvNMUP8ye/AYq4fXV5c59rVqQ
 m11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729563; x=1757334363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S92TFORdFpPvYJUBMVUr5Ti+IlOYwkoe/RCwplITijU=;
 b=dbnv09C6lAxZMY7wxNePM3xxXbdlZ/vB78GS48WLjLz8deWdw+kXZLOXx9JTcdXY9j
 cUET8GhUyjFh2B4D911+T5lLqKIv+9IhoiTnutVvEPyAcrwo0zg8Z3aCK5v4dla5dG5i
 FGc3dmYNFFI/Hc6YiL/Y59Wpmtdn0Ru8x7SZc5c6okLW+8S8YcCQOQN52tC8cY91+1sc
 tJhKye2zpiRpEFrtlmqjg71/r8PuI1VdNOBTZU/O0lz/jxpP4xAlJ7Na82MjNlv/k5A1
 FuhnTFNOE1Kr9KlMwEpenI1f2cnORXdxRj7RWZrDb+CqYNa6rMuyjqR0nRTYeWHpnN6k
 SIuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU70rWD0QVQGA4bDgI5KEyoEXf+JCmNKdxLmGDQFhMsBrKBGx6VTGq9uA3FxLA0e/3gtKdTvd8209c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV9NQhHUC6+UAK0Tx/MnunrvJQiuw2jLhrP3JPeWm7lYQq1lLZ
 oRjIK7HWg8TgswPtMJJ+cJk2HKz7z/RXPM6dNPxGqYOz1GbvgfvB/h4g
X-Gm-Gg: ASbGncs0RSB3+P+T8+IsA+npklqh6SVlNnw+UT3DxiCo0ixPGbj6u017kixc80C4ZYP
 wIWDIMGvK0Dx8Igm5Awnh2aRxP6AzPkcNasEgPMwXw09XPHKoJpMHRKXvewAmOrME4anJWV9W0A
 6uosjEGoiXmEoc4BYTCD5jrgTS7eTvLsV8yiawVpMBOKvHAQJlzswuIBRHyNmS3MXtOsHAaoWfY
 qroteuzBKy02069sonkBzrLrxyG/ajVvvss9De67Sgh8vOZXWzb9slZBXdg+yjtN8m1f5R6frif
 CeXiAAu74p2SgRSSeiu9KGpahrWC5ijgMLbtWIZxcTG7FI+3hNGMLs7mBowZdzORmNEddt4vdYi
 Gicj6BxP/V7kYhWmTjw==
X-Google-Smtp-Source: AGHT+IF8n8jun5wPEd0Tp7welazHHZJACkUZPP6YFYKmHpTRnTGqX90j4tqRwzGL6bHiiTUh4a335g==
X-Received: by 2002:a05:600c:35c2:b0:459:e466:1bec with SMTP id
 5b1f17b1804b1-45b928b8bbdmr3288095e9.2.1756729562704; 
 Mon, 01 Sep 2025 05:26:02 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:26:02 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v6 07/16] drm/vkms: Allow to attach planes and CRTCs via
 configfs
Date: Mon,  1 Sep 2025 14:25:32 +0200
Message-ID: <20250901122541.9983-8-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/planes/plane/possible_crtcs
that will contain symbolic links to the possible CRTCs for the plane.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  9 +++++
 drivers/gpu/drm/vkms/vkms_configfs.c | 58 ++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 9f76918bb1d1..c79fca3d3a11 100644
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
2.51.0

