Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6906EB3E2B8
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C0B10E440;
	Mon,  1 Sep 2025 12:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ER940Bls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A946410E43F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-45b7d497ab9so37066065e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729564; x=1757334364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+JgtE5NuuXHXwQbDBEsNd3TAksX6P3TmTjBg+zdfY+I=;
 b=ER940BlsU/5ryzTF+PDQRNUCAqTBIf/eTPyzReWo5jGYFxCUa4iISYLE4Y8pjw2VtG
 d+zebHvHaJ3Wb81/EQO+9ViyhZ7vrg2BCFM+NnI8KpCl1b3GkUqVvUiYPGaDWqSBcmHa
 mJQhiAZaDTdDHF2hU/Jziyf8ORFp02Odc+hrmnS5FfwOnq+OwvFrsVX28CVQExkO4/Wd
 jzowRTuooXffKxgfgALyBMDXihcRvZY/BD4ZGkk74+lxkoS2DTfxOdg1FbO3H0E3bwt+
 3daEUigPNEOYVQVRuZhVUN1cqMuAC4EiaB1iDo30kMdmcwgOkJaHhxv7/AsMQMFDfPd8
 4YZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729564; x=1757334364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JgtE5NuuXHXwQbDBEsNd3TAksX6P3TmTjBg+zdfY+I=;
 b=XZzEFZYaEywTy43CKEuscFkGdkGtelqXDtoSHLeEPSa9cGTR5MS6hT09C0dc3nBmKy
 16KoV5Lg1PAm9Bd/6kwbsKmcx0E65Zw/uaa0nqlFResePP3mNc4vYoOx2UvfWLaCAPZv
 m6zKv4rA+dYACT8TdwXCMJzSC1mABy37IyJt21iL0RTkdnFsL4HskzQJc2hfNPP2jk5R
 T3+m5L8BGqwy8IbAtr4M4BQECiTu3pLDQeRpP5TeOqlJbJ8fjuO6+tWbxysj1c8KGDY3
 7uN7tsW/s1l4palETSfnsBxa1HBgddYYiLE6X302UPN33R4qgnnlmtfqd1Ce0kxDwFtC
 2ebQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvvXzMwrPTmHQOfYDR3gS3f+e+l6Ng0HnigqFzT5WuYwoyr/NUw+XiecXb0atOzUSOmuR2hDahsFA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOF0WO6sFfxlnhn4F6X99Zsv/04XA5vKYimFBKUVKHrugIddAa
 Wm7q5d/ozHsyrzqiIAZhuPMjAZHx/5JmG8MAeYjLQGWjCpnUqk7BIL99
X-Gm-Gg: ASbGncvL+c1Pnl2I9yuCOiqLhH5rgJYXJ6KHu0tT0LTAVFdSxdcJ/vtFG/kbtKPHBab
 /dgmfcxIbFmD6rgoPsISdn+EtHyC76mwK6U3C8+5wd6amWb0ECzO8d3+3lnLRxqfoGrowS++NWU
 f6Nkz99p6BmBEMKTaDCrnxhZZoq4ciJRzDJPpPyadTuOuN/HX/hgEyWPqgeJbwQVJruvrZ/+8E8
 aGoVsponOQGLI78/O9uP2/2jGFTBkYxP5Pe9NJzWRu5T6XmJrQtRFy2ZJBVSFZuvwbvPLo56V5w
 Y/uv+pJSYjGcQSH5a/USeOkWedbJoWPDIcHrFIkaufD2qFq2UwJO5geCyxCZj+mGnoTmBHrKzAs
 gUaqMRG9pCmh1WVY4mcWMCF2oMeDXMBb7EMqGC4k=
X-Google-Smtp-Source: AGHT+IFUS9N82v4LejUCnaAT3ShRWZlyXqFT/fzgSHXZJE0Z1sfiw8nQGQijs8Remh450z6mWmsI/g==
X-Received: by 2002:adf:f10c:0:b0:3d2:45f0:45bd with SMTP id
 ffacd0b85a97d-3d245f04afbmr4208349f8f.23.1756729563972; 
 Mon, 01 Sep 2025 05:26:03 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:26:03 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v6 08/16] drm/vkms: Allow to configure multiple encoders via
 configfs
Date: Mon,  1 Sep 2025 14:25:33 +0200
Message-ID: <20250901122541.9983-9-jose.exposito89@gmail.com>
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

Create a default subgroup at /config/vkms/encoders to allow to create as
many encoders as required.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  6 ++
 drivers/gpu/drm/vkms/vkms_configfs.c | 87 ++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index c79fca3d3a11..622fbfa12a84 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -76,6 +76,7 @@ And directories are created for each configurable item of the display pipeline::
   tree /config/vkms/my-vkms
   ├── crtcs
   ├── enabled
+  ├── encoders
   └── planes
 
 To add items to the display pipeline, create one or more directories under the
@@ -98,6 +99,10 @@ CRTCs have 1 configurable attribute:
 
 - writeback: Enable or disable writeback connector support by writing 1 or 0
 
+Next, create one or more encoders::
+
+  sudo mkdir /config/vkms/my-vkms/encoders/encoder0
+
 To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
@@ -119,6 +124,7 @@ And removing the top level directory and its subdirectories::
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
+  sudo rmdir /config/vkms/my-vkms/encoders/*
   sudo rmdir /config/vkms/my-vkms
 
 Testing With IGT
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 2cf97c2b6203..0df86e63570a 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -18,6 +18,7 @@ static bool is_configfs_registered;
  * Initialized when a new directory is created under "/config/vkms/"
  * @planes_group: Default subgroup of @group at "/config/vkms/planes"
  * @crtcs_group: Default subgroup of @group at "/config/vkms/crtcs"
+ * @encoders_group: Default subgroup of @group at "/config/vkms/encoders"
  * @lock: Lock used to project concurrent access to the configuration attributes
  * @config: Protected by @lock. Configuration of the VKMS device
  * @enabled: Protected by @lock. The device is created or destroyed when this
@@ -27,6 +28,7 @@ struct vkms_configfs_device {
 	struct config_group group;
 	struct config_group planes_group;
 	struct config_group crtcs_group;
+	struct config_group encoders_group;
 
 	struct mutex lock;
 	struct vkms_config *config;
@@ -63,6 +65,20 @@ struct vkms_configfs_crtc {
 	struct vkms_config_crtc *config;
 };
 
+/**
+ * struct vkms_configfs_encoder - Configfs representation of a encoder
+ *
+ * @group: Top level configuration group that represents a encoder.
+ * Initialized when a new directory is created under "/config/vkms/encoders"
+ * @dev: The vkms_configfs_device this encoder belongs to
+ * @config: Configuration of the VKMS encoder
+ */
+struct vkms_configfs_encoder {
+	struct config_group group;
+	struct vkms_configfs_device *dev;
+	struct vkms_config_encoder *config;
+};
+
 #define device_item_to_vkms_configfs_device(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_device, \
 		     group)
@@ -80,6 +96,10 @@ struct vkms_configfs_crtc {
 #define crtc_item_to_vkms_configfs_crtc(item) \
 	container_of(to_config_group((item)), struct vkms_configfs_crtc, group)
 
+#define encoder_item_to_vkms_configfs_encoder(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_encoder, \
+		     group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -344,6 +364,69 @@ static const struct config_item_type plane_group_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static void encoder_release(struct config_item *item)
+{
+	struct vkms_configfs_encoder *encoder;
+	struct mutex *lock;
+
+	encoder = encoder_item_to_vkms_configfs_encoder(item);
+	lock = &encoder->dev->lock;
+
+	scoped_guard(mutex, lock) {
+		vkms_config_destroy_encoder(encoder->dev->config, encoder->config);
+		kfree(encoder);
+	}
+}
+
+static struct configfs_item_operations encoder_item_operations = {
+	.release	= &encoder_release,
+};
+
+static const struct config_item_type encoder_item_type = {
+	.ct_item_ops	= &encoder_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *make_encoder_group(struct config_group *group,
+					       const char *name)
+{
+	struct vkms_configfs_device *dev;
+	struct vkms_configfs_encoder *encoder;
+
+	dev = child_group_to_vkms_configfs_device(group);
+
+	scoped_guard(mutex, &dev->lock) {
+		if (dev->enabled)
+			return ERR_PTR(-EBUSY);
+
+		encoder = kzalloc(sizeof(*encoder), GFP_KERNEL);
+		if (!encoder)
+			return ERR_PTR(-ENOMEM);
+
+		encoder->dev = dev;
+
+		encoder->config = vkms_config_create_encoder(dev->config);
+		if (IS_ERR(encoder->config)) {
+			kfree(encoder);
+			return ERR_CAST(encoder->config);
+		}
+
+		config_group_init_type_name(&encoder->group, name,
+					    &encoder_item_type);
+	}
+
+	return &encoder->group;
+}
+
+static struct configfs_group_operations encoders_group_operations = {
+	.make_group	= &make_encoder_group,
+};
+
+static const struct config_item_type encoder_group_type = {
+	.ct_group_ops	= &encoders_group_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static ssize_t device_enabled_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_device *dev;
@@ -447,6 +530,10 @@ static struct config_group *make_device_group(struct config_group *group,
 				    &crtc_group_type);
 	configfs_add_default_group(&dev->crtcs_group, &dev->group);
 
+	config_group_init_type_name(&dev->encoders_group, "encoders",
+				    &encoder_group_type);
+	configfs_add_default_group(&dev->encoders_group, &dev->group);
+
 	return &dev->group;
 }
 
-- 
2.51.0

