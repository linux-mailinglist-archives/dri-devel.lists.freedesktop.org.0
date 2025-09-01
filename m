Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A7B3E2BD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D094610E441;
	Mon,  1 Sep 2025 12:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gtwSBrmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F5110E43B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:26:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-45b8b8d45b3so10018875e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756729569; x=1757334369; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whOVHJAOahoMLucD4mGkfc/iuTQbzIwEjfulDz04PLY=;
 b=gtwSBrmZdHvZUbqhWqrXxwh/2SBTNLn74hAvFc+OVPBw4wBOhpXkhkDCQaFamjjFG9
 IA1GgWsc49nf9TwV15F33RepCsMqTfmXDz7Khf7Egdr6I1MdiY0BipfE7wkQHvDhI7f6
 WiiwANhiOjja9OaqoDTkJTgkRlfLjYYtm99WqaT3qn/19Xe1CrEwm+il9ZotGAXycHOE
 l9P9Uvux3zCZV73aElUnumUmh/Uf86X/W4rkxE/3q1P6i9bEjKSKAYH5U+soEyapM6eO
 MtL1Rb4FO9Bj4U+CKb9ulsf5RRNCOt43saKi8KPG8D0gpfXUY//e0R+rh6hLrIEK590o
 ySvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729569; x=1757334369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whOVHJAOahoMLucD4mGkfc/iuTQbzIwEjfulDz04PLY=;
 b=Xa5WgO6rzvheex+/ksPhOYquSvI6QIq46mopeMTmioecXYD0MJmsVA9NtSiV6A1OtJ
 ZqqvwJ72+M/0XYQoDMI9X8oC+2PiDVhy+dXATxOqtAwSfsUu9BWcZTleS+cwIb0U19GO
 ZD7E95cRgsuahSkIGS6bGEUmaKwTiLb4HPWkjoobAlmYMKGtqzegpDnwiH+Wym03E2p1
 4IIUdILvGSMYCnQluN57fmZDXfN7dpVwsGmQ4wMC6dl+NToyCqMfkxCS0814h3xUNfUt
 v4IX0Z0X6vGr0ZROZAUN7RfPnt8SOJnN4m2DwnW2X8Mwyd28JnLkT2ACeczPE7rrtvll
 CdhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpZncG1i/LthrHXMEenJa/eWCgeIuhDPDmlwKSCRnAv1AakDQsndSnVWglFdg95M/0G7ENnQeUxZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKleRfR28VWwILfjozBnkKl3gSiayhihLKTzyq2X0k3UBfaRDH
 /lTkfTjmeR0i3RFogKHQ51eDHuR/Tsri0VfZnc65U7KxdEamEkJ/r0q4
X-Gm-Gg: ASbGncun1yxH2jUfT9iWj7VM/qlQYfZggpm4DBVdtAXwZf7UomMRpSFI+OE4fI/Disj
 8pAzbjuER1NVEHXgzfkj0qwKmt09ODEtT1ncxOcsyBKruDVVkKmv7h6CzGIe2NNmUjez4YszMiZ
 A8qMiRi6zuSGOY+9uDZ8Jz+kvPtKQOtxq91UIi/wu8LWOzXDamzvKyuiMSCHOaDjrgJ9AQFjUpe
 mZZhYqaAYh/PZ333MA7+PRvRrWh8ly1wOh7Xr5TGqMBiSOcQ79Q9ODnrjXRJtEcSG9XGKx6257X
 00NB6i/jrHNco5bUrmW7p0D7glQAUci7p2y0Z0XN8r4w2W3Pk1AEJgdARIxqyNkdB3zKGZGuALd
 /57/Ct03VHVtcCXcPlTVVc51vFzqg
X-Google-Smtp-Source: AGHT+IFEqVYalH4LP7GApA+3RHzluMAgFEDYygQcy3rt/FHlPm0MC8iYalSmAfccw0g2lQYKSvVGPg==
X-Received: by 2002:a05:600c:1e87:b0:45b:47e1:ef68 with SMTP id
 5b1f17b1804b1-45b855bec6emr60723135e9.35.1756729568494; 
 Mon, 01 Sep 2025 05:26:08 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b74950639sm207297055e9.17.2025.09.01.05.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 05:26:07 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v6 11/16] drm/vkms: Allow to attach connectors and encoders
 via configfs
Date: Mon,  1 Sep 2025 14:25:36 +0200
Message-ID: <20250901122541.9983-12-jose.exposito89@gmail.com>
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
/config/vkms/connectors/connector/possible_encoders that will contain
symbolic links to the possible encoders for the connector.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst           |  2 +
 drivers/gpu/drm/vkms/vkms_configfs.c | 62 ++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index b799102d54ac..31a3880ad83c 100644
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
2.51.0

