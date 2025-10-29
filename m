Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AFBC1B406
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A7710E7C2;
	Wed, 29 Oct 2025 14:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IMNlMIls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CCF10E7C2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:36:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D49811A174A;
 Wed, 29 Oct 2025 14:36:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AB0C5606E8;
 Wed, 29 Oct 2025 14:36:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 95996117F813D; Wed, 29 Oct 2025 15:36:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZbJg/Ukh5zMJtkFjzl+I9BgVwlaHjwOBuN87NBSPDvA=;
 b=IMNlMIlssFkqvlfvP4DWIjddvg2gfqj6Xbm1W9TUp9vDqG9WqhP5HjYOd1bGee8FD1/XJs
 LDg9CK0LRQzLYd+ClIXUXbJBYEDBHm/UCQeZv4kVcJF6/HI3X8KGxY628E/RY0Sod7Cqpi
 Fnt3aP6G4K3zhlBjUZLztazX2i+3dX0buVDUKsEFR/YTt/feq9GtdKE6gC6N1fyFSsWI8f
 9IUYMdT2l52W8sR9zvyVSwfuGJlc6WC0cg7E2J/nlEYkYrAldxmWFnUame5Nt2EfyFTdB5
 TgaRYq9JqU4WtJt+u8CTZbkw40urDSsZ+fgidz30jybd18njJZ7C31A3FjLg2A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:36:38 +0100
Subject: [PATCH RESEND v2 01/32] drm/drm_mode_config: Add helper to get
 plane type name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-1-a49a2d4cba26@bootlin.com>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Wsj1m7hVEtg7sU79/U1qOzzdUOMLj+fgjBm3lz+0CaE=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ6GCMhQDbZXDVLtQpYyBwfKOHOtYWQFZxnW
 j2db4rNjnOJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImegAKCRAgrS7GWxAs
 4sAQD/9ul8waCfMvZl0bPQ0CcIsEPzX5b8SLOw25Sah3ZsE7/ObQr1sHFuOGGU5QU3AoJSA0mD9
 Itdqk0ztk5+SnEvEiJTHhI/Ehj6h/eBCfxRl/NyxknIITJZ+Z6FQiBxse1azBCx8RrOEfhfMp5n
 /PDqfSkxBYPQh53bmgydUzH1+rOuKYkAlNmTjBgsXq0QHfjLcEdhQXdsrs15OgEPfCqgsyP1ZJq
 3ySzEP9pgRh71X5A+oFsoC6cetSV7ybYKrTFcE/37w/c6nYTlxx1LYIa6+WLmlsP36mEqz+jlNO
 bL9Ff39KOxJmdl3gFKRImHqu98G8R7pc0OnZcsxpaSwl0PA9xuf4vh+oSLl64iwPT0dO24Y+Irm
 wW8RBrY+0GfoH5v4ZDhHZqu7B3UPs4FNlpRtAf9/EWnNiFP+Wl+PTTU2gWvbv1WC0YZOAj/bI1D
 34OB9JvCmZMqD2lRhsFB7jhj9bSttf4XBjVej8HIgZrymAgc6d/abNBgw7rOq4XnmYt6wC+w0Gu
 Ob3f53VnGOaGEg9m2il5RtVtJw+urL7zgAhe0qvfM8k9s+9wCVwojeCaMjRAU8tOqX4oLWNMwCO
 7ZhrUd0zyoJ79bUHhkhINc30qaIA78imXYrNVb3gkN8XcFHg0DQGsZnRDs+7H2HI2/3CGE7VTjz
 /4hMxH4LrzmWRKQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

Create and export an helper to display plane type using the
property string. This could be used to display debug
information in VKMS.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_mode_config.c | 13 +++++++++++++
 include/drm/drm_mode_config.h     |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 25f376869b3a..1a1a3f43db4d 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -226,6 +226,19 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
 	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
 };
 
+/**
+ * drm_get_plane_type_name - return a string for plane name
+ * @type: plane type to compute name of
+ */
+const char *drm_get_plane_type_name(enum drm_plane_type type)
+{
+	if (type < ARRAY_SIZE(drm_plane_type_enum_list))
+		return drm_plane_type_enum_list[type].name;
+	else
+		return "(unknown)";
+}
+EXPORT_SYMBOL(drm_get_plane_type_name);
+
 static int drm_mode_create_standard_properties(struct drm_device *dev)
 {
 	struct drm_property *prop;
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 2e848b816218..89f3dd46178d 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -30,6 +30,7 @@
 #include <linux/llist.h>
 
 #include <drm/drm_modeset_lock.h>
+#include <drm/drm_plane.h>
 
 struct drm_file;
 struct drm_device;
@@ -983,4 +984,6 @@ static inline int drm_mode_config_init(struct drm_device *dev)
 void drm_mode_config_reset(struct drm_device *dev);
 void drm_mode_config_cleanup(struct drm_device *dev);
 
+const char *drm_get_plane_type_name(enum drm_plane_type type);
+
 #endif

-- 
2.51.0

