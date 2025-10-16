Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE85BE4F06
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1593E10E345;
	Thu, 16 Oct 2025 17:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Va83fetk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718EE10E313
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:54 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso8407465e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637413; x=1761242213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+76MRDg5x75qLvTgM55RSRxFBkfbhy3lMLwDXf3nB0=;
 b=Va83fetk/Zl24XJoSU7V7Bt6FYWvB6ponHI7JY+W6+5EJFzdIR97PhejTp6M5ld0Uo
 184Z3QnDQfpn/82g6scBhthsRyOFL011kxejUp+S2ut2h03uAx9F5XPped5iWKT6trTD
 Hq10/01lpPaNFyUo6ohMVCRHj8Aeinm7xAExn65F2GgN0HZIvMJA8hjhD0MUXaDUmEwB
 fbtsUnFCbeRUYKvVzWh0HfQWr1ObQ99O0/ix1U5AlX8FL7uqGcAUELDoweNEnwZw9gcw
 BekS+QzR/fvDZSxpycq9umK3En2/5QzVDGFT8T47Yast16DqGVgiNlGdbc7ere6fNv1F
 byJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637413; x=1761242213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+76MRDg5x75qLvTgM55RSRxFBkfbhy3lMLwDXf3nB0=;
 b=btfUlhnWnikn9sP0m0F0nPt34/EFBA21KkPkEOO6KjQ/cYIJsp+A4XB6Pm/7AthriU
 hf5AnVaU2ihcNo8Y9ybnuopDYUnoccNQZRYEk8yoTLgnRg1F6zoaAIMO5wtSxxC6Kzrk
 JYeJ2a64YoKQfpZoTiHouTxvDwbwY2Y0conrYOg/Jvg2i5qcNfTgvn8ZOnkCtr2utm8W
 W8DBvbalAQ3RVrJBsK0LRNzjzPIyN1N0TJwYGR6FKmr6oyz0I5CDkuB2j6+wFJjzqeQt
 lDajSo6NIykdTgcp6YthZnw8ODTKplz+9e3jOLmRiJjGCO3Qdo6ZD4GuB6H98tcmjxu7
 6gjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYw80W6l3naVPio2SxXvrkclzjIhYhaf0Y881oCJe95x8QIUljIKhdBuz7IH8Gx65xYq2CkPEkJ5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGqin50I5+XgNnWS0wTe4FgmYfv2y6Zq3AZg/TfH4/vScwmv0Y
 m15eGHaUNru6UMh5zovMWSaJeC5vtKrBcHRDgwFp433yaooLMZcHp/rQ
X-Gm-Gg: ASbGncslDioimH/GWRO48fm2OVs4mCRNlb4U0vPUOznVjCxWQ0DMCv72M1VFWNSS4+n
 tQGM0BPlDjFaGZMEyzrNV3kOTLsfLD5rxGFpPFLQ3g0OVH35eQbWih6IzXC3fSi1TmE50wTCj9r
 B1ETlvsYfE/PWjmvIDxX1X7hdYMTpH5HaCzkKNQq4e4gTi30FmQjg1KphwE/oX7/tIl1fIUvE+j
 KCWhGfCLXcG014IT6ikBtgeLgGateSMeDkroM66cU7RueVg31vtSMM8cZAu5xevIjyC5plFMTqY
 Oy3m9mP47NePkBCo10rWxG9GJtDbOUTvSFYm5lxVqp9TD+6GtmPAxlrJyhL9Wg3QmTsXwaia47E
 s2j0A+7zTVuQVUtyMQfQ6tgzce9FtUlSN9mFlWNEP0kljXaskAlPUHxPr18JtRR6qnQAFj4FltK
 Y=
X-Google-Smtp-Source: AGHT+IEF6nd3NHJ6Hz3jHyY6wSRTMjjKhpeimqR36CbQEX1fUeaE1iql6yjy3XpMlOobsyfjzfShmw==
X-Received: by 2002:a05:600c:b8d:b0:46f:b42e:e39a with SMTP id
 5b1f17b1804b1-4711792c24emr6649585e9.39.1760637412794; 
 Thu, 16 Oct 2025 10:56:52 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:52 -0700 (PDT)
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
Subject: [PATCH v7 09/16] drm/vkms: Allow to attach encoders and CRTCs via
 configfs
Date: Thu, 16 Oct 2025 19:56:11 +0200
Message-ID: <20251016175618.10051-10-jose.exposito89@gmail.com>
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

Create a default subgroup at
/config/vkms/encoders/encoder/possible_crtcs that will contain symbolic
links to the possible CRTCs for the encoder.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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

