Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C0AAE18B
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502B910E7FE;
	Wed,  7 May 2025 13:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ChmM3fDU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2D610E7FD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:54:50 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so1835965e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746626089; x=1747230889; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B3uzv8jS+uSjYAUFvNNOH03DRX+MgvgGsMjkekl49eM=;
 b=ChmM3fDUhXw6FaUcG5GYc0ZnAknX6Z2Ayq/JEmEqGHc3Z6Z56Z6nsPr0PhObpk4nGk
 q0xyUf8B6fGnS6l++pG9GcVtd3c/X20Y1M0umgo8XO/jc+pXDGQX8Z32e8XCDAVojQz2
 u583+vmqCXTfy29FgBTxUAUH+HdTTlCdQielpXLeBZCYvD1B4DXa44W6FYRhu0UOrBcL
 vwGBjndd9Hy2lUm+4eVjP0Q3ynZI/3w2PrJSDRkarHH+B+fSF2QtOS/DlL62/6xRxKZy
 RE+ymB9mvM7In2tIYN3oFtCLA3NHLPd7ZRXaLUMDofDBwQau4Q4POzaCeHuKPFys8ZgV
 UaTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746626089; x=1747230889;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B3uzv8jS+uSjYAUFvNNOH03DRX+MgvgGsMjkekl49eM=;
 b=t62JEL9B3QhTzd4Q7o0iZRz2fzN3IGcrYHwnByaHTVEceBqFsRqqiX7OvCp9kLeGEi
 zfOnbBULVg+0x9yhq3sZyTKkPW/La37lUKY5X7ES5n8/NzUtQ3qHNPu3fVweq2zCs5A5
 ypwdOVbr7wGkEv12r+PwUW9Ku8k3XD1XuWeiNbW3ay4q92regtfo6C/zDFlllXJfXYy2
 9GA6qFQaqVBjN7qY3RLYESv5dVAtgxt4l96GyVXu+t08lw1UXM2lGJABWU7odmc+jLP3
 +dgbvRs6f7z804Fd9WG0v14e3KpcEpsxhTA9fhdo9ZJknvCHBXoudHVGdvHrnwpr4ALR
 u1rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTqBhupD78rfVQl6cQ3D6lBgVdLg7H0KOLxqCyVkVw95iZL6J0WM3OkC0nWJrXV/bOOzf5E/W8/K0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFntazajfouEe7hEo/CFUUgDl+BUz8pjoqKiAouYUv6XbZJdIg
 k1d3tbzadPmmYlDVmtLp8ZF3N2fJcX5wSLAUlGc5GBUt/gHkNaFU
X-Gm-Gg: ASbGnctJoc3iE49jvp4Sgls1SyODlpFvZIfJD9q03W2rKmfcoWammhopngxNwLKmHy1
 tPoYg2MAwqUwuh6rblpYyEnWyW+oIxWCGDyVX521XTHAIlp2HKos3SUqVva9dxR1qDvi5TfabHQ
 PQw6Gk0nRhjeUxX2aJP1R4OLraBYrJrwNnsealkeV9Pbadkis3vqg+rBZ8YyxSu/arkYhtDHfBM
 HLmAdkYZKjvyjZZXXvODExEgT3VbxyOsVUrGzWuSLR4b6pRXnB8Fs8qvgMipMkLSNIrcvvuJUKN
 3/ya5MhwSE4Z+QQbicFsGC3LB8237FoegPY8NI7cPQ==
X-Google-Smtp-Source: AGHT+IFhyGvbpgkCU5AP3HdDVlcdPRh5RZxhB17iCeWUo+nHhayzPhUu6soRosDlT9+Jqt85AM07wg==
X-Received: by 2002:a05:600c:1e1d:b0:441:d2d8:bd8b with SMTP id
 5b1f17b1804b1-441d44c2821mr28333185e9.8.1746626089109; 
 Wed, 07 May 2025 06:54:49 -0700 (PDT)
Received: from fedora.. ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:48 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 11/16] drm/vkms: Allow to attach connectors and encoders
 via configfs
Date: Wed,  7 May 2025 15:54:26 +0200
Message-ID: <20250507135431.53907-12-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
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
/config/vkms/connectors/connector/possible_encoders that will contain
symbolic links to the possible encoders for the connector.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 62 ++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 744e2355db23..74126d2e32e4 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -112,6 +112,7 @@ To finish the configuration, link the different pipeline items::
 
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/planes/plane0/possible_crtcs
   sudo ln -s /config/vkms/my-vkms/crtcs/crtc0 /config/vkms/my-vkms/encoders/encoder0/possible_crtcs
+  sudo ln -s /config/vkms/my-vkms/encoders/encoder0 /config/vkms/my-vkms/connectors/connector0/possible_encoders
 
 Since at least one primary plane is required, make sure to set the right type::
 
@@ -129,6 +130,7 @@ And removing the top level directory and its subdirectories::
 
   sudo rm /config/vkms/my-vkms/planes/*/possible_crtcs/*
   sudo rm /config/vkms/my-vkms/encoders/*/possible_crtcs/*
+  sudo rm /config/vkms/my-vkms/connectors/*/possible_encoders/*
   sudo rmdir /config/vkms/my-vkms/planes/*
   sudo rmdir /config/vkms/my-vkms/crtcs/*
   sudo rmdir /config/vkms/my-vkms/encoders/*
diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
index 692e1b708012..8e90acbebd6a 100644
--- a/drivers/gpu/drm/vkms/vkms_configfs.c
+++ b/drivers/gpu/drm/vkms/vkms_configfs.c
@@ -88,11 +88,14 @@ struct vkms_configfs_encoder {
  *
  * @group: Top level configuration group that represents a connector.
  * Initialized when a new directory is created under "/config/vkms/connectors"
+ * @possible_encoders_group: Default subgroup of @group at
+ * "connector/possible_encoders"
  * @dev: The vkms_configfs_device this connector belongs to
  * @config: Configuration of the VKMS connector
  */
 struct vkms_configfs_connector {
 	struct config_group group;
+	struct config_group possible_encoders_group;
 	struct vkms_configfs_device *dev;
 	struct vkms_config_connector *config;
 };
@@ -126,6 +129,10 @@ struct vkms_configfs_connector {
 	container_of(to_config_group((item)), struct vkms_configfs_connector, \
 		     group)
 
+#define connector_possible_encoders_item_to_vkms_configfs_connector(item) \
+	container_of(to_config_group((item)), struct vkms_configfs_connector, \
+		     possible_encoders_group)
+
 static ssize_t crtc_writeback_show(struct config_item *item, char *page)
 {
 	struct vkms_configfs_crtc *crtc;
@@ -528,6 +535,55 @@ static const struct config_item_type connector_item_type = {
 	.ct_owner	= THIS_MODULE,
 };
 
+static int connector_possible_encoders_allow_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_configfs_encoder *encoder;
+	int ret;
+
+	if (target->ci_type != &encoder_item_type)
+		return -EINVAL;
+
+	connector = connector_possible_encoders_item_to_vkms_configfs_connector(src);
+	encoder = encoder_item_to_vkms_configfs_encoder(target);
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		if (connector->dev->enabled)
+			return -EBUSY;
+
+		ret = vkms_config_connector_attach_encoder(connector->config,
+							   encoder->config);
+	}
+
+	return ret;
+}
+
+static void connector_possible_encoders_drop_link(struct config_item *src,
+						  struct config_item *target)
+{
+	struct vkms_configfs_connector *connector;
+	struct vkms_configfs_encoder *encoder;
+
+	connector = connector_possible_encoders_item_to_vkms_configfs_connector(src);
+	encoder = encoder_item_to_vkms_configfs_encoder(target);
+
+	scoped_guard(mutex, &connector->dev->lock) {
+		vkms_config_connector_detach_encoder(connector->config,
+						     encoder->config);
+	}
+}
+
+static struct configfs_item_operations connector_possible_encoders_item_operations = {
+	.allow_link	= connector_possible_encoders_allow_link,
+	.drop_link	= connector_possible_encoders_drop_link,
+};
+
+static const struct config_item_type connector_possible_encoders_group_type = {
+	.ct_item_ops	= &connector_possible_encoders_item_operations,
+	.ct_owner	= THIS_MODULE,
+};
+
 static struct config_group *make_connector_group(struct config_group *group,
 						 const char *name)
 {
@@ -554,6 +610,12 @@ static struct config_group *make_connector_group(struct config_group *group,
 
 		config_group_init_type_name(&connector->group, name,
 					    &connector_item_type);
+
+		config_group_init_type_name(&connector->possible_encoders_group,
+					    "possible_encoders",
+					    &connector_possible_encoders_group_type);
+		configfs_add_default_group(&connector->possible_encoders_group,
+					   &connector->group);
 	}
 
 	return &connector->group;
-- 
2.49.0

