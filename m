Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 804AA65C055
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 13:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5512810E248;
	Tue,  3 Jan 2023 12:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B162210E248
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rrjfYkVQcHziUlXhd4F9sIKuafwfSevTX3Pxl4gEzrU=; b=dUgM41gXiHhT6nxqVOsjh4aHw3
 7YMoqkLQM5PeDpQnTE7/cycYRxgcgOc8x15aTSD7JI5OJJN4PLsv5vfG8drj46krr1lnGWR1FEWme
 CMwldRGD/8u52QEAUF1nUzJHzz92Dm2CDvYAh1EyICOE2+4qtE7SAJl0NLv54cnzoxTaHSH9ccVsC
 0snOAS+rARgQaSQpY2hXwE0cEvjsrK+isF4QRYDg4XZ+HyteX83gQlLOc81/CxnovqzR9rPlzVx+d
 yJ2esdGiR2ADlunBH1/3BZKJ2nvgi2ZQU9e4d94iasTQbV947q/zDiulhtkXfkXhZ2onQpT+hweIt
 959t2uXw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pCgod-00G8cz-Jv; Tue, 03 Jan 2023 13:54:52 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/gem: Check for valid formats
Date: Tue,  3 Jan 2023 09:53:23 -0300
Message-Id: <20230103125322.855089-1-mcanal@igalia.com>
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
 Documentation/gpu/todo.rst                   | 7 ++-----
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 9 +++++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

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
index e93533b86037..b8a615a138cd 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 
 #include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
@@ -164,6 +165,14 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 		return -EINVAL;
 	}
 
+	if (drm_drv_uses_atomic_modeset(dev) &&
+	    !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
+				      mode_cmd->modifier[0])) {
+		drm_dbg(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
+			&mode_cmd->pixel_format, mode_cmd->modifier[0]);
+		return -EINVAL;
+	}
+
 	for (i = 0; i < info->num_planes; i++) {
 		unsigned int width = mode_cmd->width / (i ? info->hsub : 1);
 		unsigned int height = mode_cmd->height / (i ? info->vsub : 1);
-- 
2.38.1

