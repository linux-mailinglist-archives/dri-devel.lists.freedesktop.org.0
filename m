Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C928A56DCC
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F5410EBEE;
	Fri,  7 Mar 2025 16:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dyh1psd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6323610EBEE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:34:10 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso24148055e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365249; x=1741970049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VdvTo+glOxdqzKi9x0MlR4nPEnMDWOMdVsZOru5+zTg=;
 b=Dyh1psd7MoIGZTc1Kf7B2C1UxupRGC33DREJz3hk50yw+HyLCnwDQAsrcni/2jw1W3
 Vf6RxAc312AMldtWuNcPT35dkEec6J9aZ/p1EM3qxSLpYs84+UjD/RlzVaTUh+WqK/A4
 NQaKvmdx8dTPtULVjtN1yiN0EKz7uEcQQ8792wQR31Gg9RDiQJL6f8hfQl8oIaXeE5lv
 Um5oRS78z9LKebzsNnglO/YhQt5jB+bESHBPMC1954FfngAfYqfeR50NyJptoVTNvhK+
 1K7iPENEp7UFlKLEBOkga/qnv5J50wv4nax1f+ZLcp+u+irjqFtJMoaOkJEqEBe8/G++
 NJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365249; x=1741970049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdvTo+glOxdqzKi9x0MlR4nPEnMDWOMdVsZOru5+zTg=;
 b=aSgOoiNTu76/vfPZ7p2fOAh7ecnBLEbAJG9zdskO6SRZ0hG2LyOG1rrev0o0bOUprY
 uZExUIXo3B8wAZPrdwgOOlsT+tuNhk58oAmg0L8s9U4/a6NBsXyzVfQKB3opBomdFta7
 gjy1hljdX6rachqMiDvvDcnb9PjKcJt+EmKioJ1uCd6hDBThcRj/M6MpjcmLQCe5HquS
 Y9fKPMIGV2r/0aZ/8Hq3sWytcDu89eQ64/3IwCWTVjt7DbT3ErVPqQGee7rW3AHXG1Iw
 eEFChJZdM51nDc1XUokK0AYFEk1zo8DsaStvJntAXUo7LSw25bbZDDrtkiQAQTS6e0Td
 MUgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8lFanYqIBOColywVqnSSt+udTQRmVGbbvwSj0y6yEqoePtZozdqCHqwDCqt6LolxxDKn2M9MWVlc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxou3YMVfMTuW0r62ynXJ41RI9+KnA6FN3n+senfVaqPNSvmgzQ
 iqJF/NErDHmffLmCt3l3UGCbrpbJAcjQ1/ok4aCpyV3USYyEIt5c
X-Gm-Gg: ASbGncvSWSiUXFWC2nw9Qsuax8bjFsj7xZ7lkOpVp9GhvqD0pQBOE0CUeW+lfP9Cg8Q
 eFCP2RB/t+gTes9RhHpElRPTxRWfCY70aTwSNk68nd/dbklILnyAx89CCmCN55vyMvMjYmCgpgQ
 SYk6wubXh3L/1wUANESaEemF9iCQQdLH+FPgSjsyta0tvSS1oG4h4HBC59T0YbCzCvXooWCeIKZ
 6DH1qiqcLYMmYu25cvUfY8AZNkbPuTo3SX669uJ7+dSUDlSchWOszjRvu6hl5EEZttPJbWfWXtO
 7yPIU82FlwLiqTNkIuRMATOgnUZ4VaNPjJSYkGD+RkMpCJQ=
X-Google-Smtp-Source: AGHT+IFPRccxnoFktNFSGhc7+pjS3ePButwIioS5C1b+Nw+vSpBYT06wzWLbIJFKik54mEQ9Ap2++w==
X-Received: by 2002:a05:600c:8581:b0:43c:e409:b8a7 with SMTP id
 5b1f17b1804b1-43ce409bb17mr4439105e9.9.1741365248662; 
 Fri, 07 Mar 2025 08:34:08 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:34:07 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 07/16] drm/vkms: Allow to attach planes and CRTCs via
 configfs
Date: Fri,  7 Mar 2025 17:33:44 +0100
Message-ID: <20250307163353.5896-8-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/planes/plane/possible_crtcs
that will contain symbolic links to the possible CRTCs for the plane.

Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
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

