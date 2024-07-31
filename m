Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADDA94349A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 19:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C236C10E062;
	Wed, 31 Jul 2024 17:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="En1ua2B4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E5610E168;
 Wed, 31 Jul 2024 17:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1722445249;
 bh=rQaVG/O25AerGy2gOaY8XL7CTvpz0JJwpNoEJXB80TY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=En1ua2B4t6o6KKMCIr8w5/9rTs4IM6+m6dhQ9SqHfnN/VORWqNLMG7PhKj6AEHHz8
 v1tyRP8rJrHDd/ttf/dbtIZ+h1nFtAb9aTY1DjWUi84h3eU3QTclIHQWPFaHyNijVZ
 mYN2fFcgl6A3r8Qj4SWE6UeEnEgAaR7cb6vvUxQA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 31 Jul 2024 19:00:46 +0200
Subject: [PATCH v3 1/2] drm/connector: add
 drm_connector_get_cmdline_min_brightness_override()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240731-amdgpu-min-backlight-quirk-v3-1-46d40bb21a62@weissschuh.net>
References: <20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net>
In-Reply-To: <20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722445249; l=2611;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rQaVG/O25AerGy2gOaY8XL7CTvpz0JJwpNoEJXB80TY=;
 b=+3iwRZMLJ9s+ZBHbrf2ZfwWi7C4r4hwIkIIf9rLDxZtzQq2crujBBzQA4QtGx8HvF/5LqHJiQ
 d85gOQcvIjHDNLs7/0/Fyigf5g5FkDZlTmISEHV/A31ZHoqBbmD2xTk
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

Add a helper which can read a overridden minimum backlight value from the
kernel cmdline.
This is useful if the minimum backlight as reported by machines VBT
does not match the user expectations.

As an example, the minimum backlight brightness on the Framework 13
matte panel is too high.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/drm_connector.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ab6ab7ff7ea8..d0b3d5d6c7c2 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -34,6 +34,7 @@
 #include <drm/drm_utils.h>
 
 #include <linux/property.h>
+#include <linux/string.h>
 #include <linux/uaccess.h>
 
 #include <video/cmdline.h>
@@ -3399,3 +3400,36 @@ struct drm_tile_group *drm_mode_create_tile_group(struct drm_device *dev,
 	return tg;
 }
 EXPORT_SYMBOL(drm_mode_create_tile_group);
+
+/**
+ * drm_connector_get_cmdline_min_brightness_override - read an overridden
+ * minimum brightness value from the cmdline
+ * @connector: connector to query
+ *
+ * Read an minimum brightness override from the kernel cmdline if present.
+ * The parameter takes the form "video=CONNECTOR_NAME:min-brightness=VALUE".
+ *
+ * RETURNS:
+ * negative error or override value in the range [0, 255]
+ */
+int drm_connector_get_cmdline_min_brightness_override(struct drm_connector *connector)
+{
+	const char *option, *value_str;
+	int err;
+	u8 val;
+
+	option = video_get_options(connector->name);
+	if (!option)
+		return -ENOENT;
+
+	value_str = option + str_has_prefix(option, "min-brightness=");
+	if (value_str == option)
+		return -EINVAL;
+
+	err = kstrtou8(value_str, 10, &val);
+	if (err)
+		return err;
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(drm_connector_get_cmdline_min_brightness_override);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c754651044d4..64d86604cc6e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2357,6 +2357,8 @@ bool drm_connector_has_possible_encoder(struct drm_connector *connector,
 					struct drm_encoder *encoder);
 const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
 
+int drm_connector_get_cmdline_min_brightness_override(struct drm_connector *connector);
+
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
  * @connector: &struct drm_connector pointer used as cursor

-- 
2.46.0

