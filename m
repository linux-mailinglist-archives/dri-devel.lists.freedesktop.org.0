Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D9ABE4F1E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C13110E337;
	Thu, 16 Oct 2025 17:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mawfqcDt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B658210E0E8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:56 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so5762325e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637415; x=1761242215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C7w7rSx8/aFkCH550GdudR6K0Utw/IdDPjF/QW3Etas=;
 b=mawfqcDtPIazeN9c/ZyVs1ewHg2HtfVzEPPlmfasC9Vg03pRJJ4r9EblYISPmFC5ce
 ErlxNE+4o+fZMPCl8GCAkaXlRwJ3grnl0iv9tww2hbBd4q5bfr039cj/YLMtXQ3WfxAz
 ctzvweibZomuhUBu18GRTtf/J9ZOcFrNdqY3ZXYCMTefJYYEDk4dHzHbE8JBTR/O7qaa
 RzZfaT8OYFep0v7i0nWzT/rCoVCI9dnoKlrOFSHEVS3vUFARZUz07inNyE7sCNN5A06k
 cXOo0Zi7iaXUSnrauaGYG3JmFOwrcN9/W0W0qUFRdRg+HW7vvt+si0msVyn/3dvrcnlm
 4ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637415; x=1761242215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C7w7rSx8/aFkCH550GdudR6K0Utw/IdDPjF/QW3Etas=;
 b=SWeoWLWm2+ttXvO590M7Htta2QXwlgu4OBXWHWQ4qOXiwzd8L0UTK9QW+Q077HjVA2
 FUjxYz6/fNUh/cS6ovj7Kkd2I8Zym+YK6dh8IgjuokSUmp6VRmbiJKQcRgWNGqpY2OLn
 itRmsb2/ZLYJA/0hpBeH+0JCrnQ2OOKuUsn3BaGrw5kazxhyJURbvvBEoq+n9Wwo8QQ3
 Kwnj/VCJ5nmHsk+FgeYActKAq84m5FsDSAaC4F5sr5a4hq7CFGrBQUG9Qr9viLIFk26E
 c7HGHvAO281snlNvyu4kJeVE5Hh7FfQAmhCNmEuV7Ywc0I8anb1BmcaJ/IyKPm1ioGRk
 b6zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqF0bprQzZUG5qatond8abHgB3lUdmKIqRDblbdIT7vRU2+izFfqsPXO2fOihDlW01mGT5PjChtDs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBAwfFtvkKcRF8UXgjQzhoB46/MgBuqWCmFH1PuQnnJoA3F4K1
 d0eZ0RQjkSuB6pUAPzSAWCKDlUIFwRwQ2ke2uSREJbkSfbCtGGb62qE8
X-Gm-Gg: ASbGncsZ0WxPGiAoGk7COQgHjFpXqv7uVyquhe227nUgu325CKH1DYNzkLfpZM77G3z
 WecTrTKNi3tVoXM+p3uE4KmdaVcefjoCWX9Qdg2defNb27uu6rAl4YMzhARbSIZsNQ204tyXwCx
 mc9Ug1pdz+K5v9AlfiEux69E+gM9NXiiWC+luG5kcRWRk7xp2sKpRCEEajX+ah8gCdbTicNb1D0
 IIAoV9adqBqF76lN/5C44p/vbb6vWHwFtpmaPnwQ1kp8chQODSagBbCFs1xXsabqjHp0ZwUCjQS
 nE9Z2X62F7e61X9b+GVpPA0vMD8d9W2hPftybHLjuetRRcrK9yCFNlJLY8Vf078gYClFYabX5hX
 S+4m6NmfAAWUmPeUANywQq0I7uXw4fCE+JDBTZnJrKRitS9CwKy/ZGbzvs0gfCIVQ4ore5cxHbg
 DYs+NEA8PtQw==
X-Google-Smtp-Source: AGHT+IECLJH3tyU8psXcO7Z3x88TzFB53y1mnPVi5423SNjlU5NpQAE5ErgxGxlx1kXh5/HNZN89YA==
X-Received: by 2002:a05:600c:474b:b0:46e:4e6d:79f4 with SMTP id
 5b1f17b1804b1-47117877525mr8220675e9.15.1760637415128; 
 Thu, 16 Oct 2025 10:56:55 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:54 -0700 (PDT)
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
Subject: [PATCH v7 11/16] drm/vkms: Allow to attach connectors and encoders
 via configfs
Date: Thu, 16 Oct 2025 19:56:13 +0200
Message-ID: <20251016175618.10051-12-jose.exposito89@gmail.com>
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
/config/vkms/connectors/connector/possible_encoders that will contain
symbolic links to the possible encoders for the connector.

Tested-by: Mark Yacoub <markyacoub@google.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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

