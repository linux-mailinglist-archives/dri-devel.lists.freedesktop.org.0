Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73265C159
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 14:59:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4CD10E260;
	Tue,  3 Jan 2023 13:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F270110E260
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RwhJh94aptbx/atfAeoh9G9VXUeORvLjp6e1451D384=; b=ZjzVoIPQH2BBmxE7WWIV5AfLE4
 Myp4n/+F0JJWost/WMlDLQ9Q0c9eYkDnspr6VbkbfEqsSXqjP3cmSV9uA692ffU9ae5orZfqa8b4P
 uFW29CyB7DaL/lCGBOIUbTrw0Fw7pHRyZ8Z7feocunNii8iAjKp8pH7eBniATaSgtoXpqYf27QE/I
 FMD5YupEHQov9b0UP57VtQjWnP87XSOVcyje/mCWnuxmyGLywOsQpeKJ45/9tvS5k1dvtmOd5RiLt
 WUApIOChavRhzkJCY2RicyaiAtyCb6jumi3kXkZ6z9FxQwhMuos5lqR/HR97iNK8aQm9G5goD9CPy
 gHj53SyA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pChp8-00GBM0-2g; Tue, 03 Jan 2023 14:59:26 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/gem: Check for valid formats
Date: Tue,  3 Jan 2023 10:59:16 -0300
Message-Id: <20230103135916.897118-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, drm_gem_fb_create() doesn't check if the pixel format is
supported, which can lead to the acceptance of invalid pixel formats
e.g. the acceptance of invalid modifiers. Therefore, add a check for
valid formats on drm_gem_fb_create().

Moreover, note that this check is only valid for atomic drivers,
because, for non-atomic drivers, checking drm_any_plane_has_format() is
not possible since the format list for the primary plane is fake, and
we'd therefor reject valid formats.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

v1 -> v2: https://lore.kernel.org/dri-devel/20230103125322.855089-1-mcanal@igalia.com/T/
- Check the modifier for each pixel plane in multi-plane formats (Thomas Zimmermann).
- Use drm_dbg_kms() instead of drm_dbg() (Thomas Zimmermann).

---
 Documentation/gpu/todo.rst                   |  7 ++-----
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 13 +++++++++++++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 1f8a5ebe188e..68bdafa0284f 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -276,11 +276,8 @@ Various hold-ups:
 - Need to switch to drm_fbdev_generic_setup(), otherwise a lot of the custom fb
   setup code can't be deleted.

-- Many drivers wrap drm_gem_fb_create() only to check for valid formats. For
-  atomic drivers we could check for valid formats by calling
-  drm_plane_check_pixel_format() against all planes, and pass if any plane
-  supports the format. For non-atomic that's not possible since like the format
-  list for the primary plane is fake and we'd therefor reject valid formats.
+- Need to switch to drm_gem_fb_create(), as now drm_gem_fb_create() checks for
+  valid formats for atomic drivers.

 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
   version of the varios drm_gem_fb_create functions. Maybe called
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index e93533b86037..92d748f8553f 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>

 #include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
@@ -164,6 +165,18 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
		return -EINVAL;
	}

+	if (drm_drv_uses_atomic_modeset(dev)) {
+		for (i = 0; i < info->num_planes; i++) {
+			if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
+						      mode_cmd->modifier[i])) {
+				drm_dbg_kms(dev,
+					    "Unsupported pixel format %p4cc / modifier 0x%llx\n",
+					    &mode_cmd->pixel_format, mode_cmd->modifier[i]);
+				return -EINVAL;
+			}
+		}
+	}
+
	for (i = 0; i < info->num_planes; i++) {
		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
--
2.38.1

