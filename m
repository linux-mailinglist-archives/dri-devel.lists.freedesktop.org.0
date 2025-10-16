Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B873BE4F0E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3655D10E312;
	Thu, 16 Oct 2025 17:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C5sab+ww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CE610E09F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso5293115e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637410; x=1761242210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Iw4dctPK4SDmV/YtpTKXRG3Xw3gr179LpM994cXNRU=;
 b=C5sab+wwFVQPFLO81asivAqC7Ffn6Uw7MdxDce7trYp1bK22VRTcdPWrKmFrAaNO2C
 OM57dj/7x+razbyAnAqFCKjCGbiAdATV0HaqcCZKK3/OvQIoVjFTH3cg4jkcIRMxKr+x
 4C8SkVsi/ocXyLt9UwOI4jROC94ea4KW03+FtXTq75QnehjH1mJ6HIQUjtCxiENWABqi
 USwzIRsQ30rnui5vR+Po50nHVTdMDGiPxE34YZ1+ziROMMn335JHncZBshGuo0J0/rWN
 eO6ixEEfxTtJu5VNrWJyUbqfC04KG/iuXqfE+anblyQQQyHW7vfJH1xtYGsCLJpZ4HCy
 9dZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637410; x=1761242210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Iw4dctPK4SDmV/YtpTKXRG3Xw3gr179LpM994cXNRU=;
 b=tQOZXg8Ovt3SazoIQmWO3EIEU8fSjkvcPhzbxya+VL/8ka9scafWQVAjBLOpSHHjzY
 80PQ0YvyE+nitQpE7c7TomhaaDzJTpjtb7i5dPzeirgRdzkdyu/vPkEHe2F1MQIbNrt0
 LLw20Oi4GzDXhvAv5ZMqkovfHyiSNO7yuIBRre4mQtKq3mTOGX9jyDVxgqvNAgdJPP4p
 d0dqCBEi5CmEn/cdcqQGyXUC8jEqIDNaSWQoSo/K4IxPNEWuVMOz4kB7wamC7xAQcFVo
 Jpkwxrc78dVq3vmJtwth/a3IT4JxgH3wElT9QEm8aVVZV6kYzy6Un4D7mh51nu89qT17
 mriQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkVb6GUAkaMlr804SZHJVazBLckePwsNLXZe2USBMxz+jE5VSbz5+C/W2mdrjhqzME3+LvCMCNi9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGKQ9R0JsRvaFftNeFfyrwNP1i1t3WNYJyqlWO1KG7R4vDRldm
 1JEKW6V6j78QtWsKKP0QQ+bMP1gDsCZHSpfndSNMeAuyrfi/WcZepSpD
X-Gm-Gg: ASbGncuBQkO5PrZXKCj6CgTNvWLPkyLRyovPOyGT5lGyT6T8wIrx8NjbrQuf4uP26Y9
 jaW18TgGKAzDnE0H0daNCDshMDf17XMO35p1xbM0MuS3HpJF77AEWPYYBDXLv8ekS8Djc7DJ17I
 8WGtlkdT8ZL151t+phUuwhE/reaPSUC/N9leHUI8e9UjBwLlM5nJeHrL3XJ43jRQm56OGq2GTCZ
 fKsC58BlCv/PYn/EGt+UcTzP7QlSEZVc8uDxQQGgt9fexQw2zMxrh4++Vs+YDMdS/VqXBVFFX/u
 q0QH9dZZLwMQb9G6N1KKovcqxmtyiewvBYumPhDUtUG8zquiQSl0W56eU80ejnmFFol7gK3hajQ
 DAI1sfjI34BIK8EJr8rKDPGyuJ4D3iTJPniHi2TIiV+Oab93LlzNXQrmEtDKDQ0RP83p6uDiC2P
 Xa7eR4S+6w+g==
X-Google-Smtp-Source: AGHT+IFbOz3W2+G2OoxdcsQZgc8xrH4wObe7H+Oo9COB4yc/aLa7cjWM7GvW3Eu2iI/PG6oUer5LMw==
X-Received: by 2002:a05:600c:5287:b0:471:1337:7220 with SMTP id
 5b1f17b1804b1-47117874810mr6737745e9.3.1760637410421; 
 Thu, 16 Oct 2025 10:56:50 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:50 -0700 (PDT)
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
Subject: [PATCH v7 07/16] drm/vkms: Allow to attach planes and CRTCs via
 configfs
Date: Thu, 16 Oct 2025 19:56:09 +0200
Message-ID: <20251016175618.10051-8-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/planes/plane/possible_crtcs
that will contain symbolic links to the possible CRTCs for the plane.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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

