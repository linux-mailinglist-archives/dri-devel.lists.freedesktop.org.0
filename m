Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FEA6DF87C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1D710E835;
	Wed, 12 Apr 2023 14:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D689C10E835
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nAGb1Ph8qtCiV3l6gZEzGLFIiZBkI1ZofAzFU6ABIMk=; b=ea0sufAEJNuIbm8Yggt38yX/bc
 l57LAAs1Op4AIrQLoVIxKZGMhveic4kQGaX4X085OKyCAZSwL9ibLKdDpqAEFP3dfqyEUfHp5btUT
 RIVa3ZtxHe05ixsHvjlELwmVI905vjAVREhNDKe+0Z6YfjFP0yB6UrLSPCf5nXz2YkrLHsdEQyayS
 rDMhS2Zby165WpBGB3tT9M5++CRBa+zyGk92taMUdf6uizqcJ7dIf+/a8BPgd6NB40MHyCaB1botN
 MJANJqdlbpnBA11Gysyv2ps6br0j9LPfsTPVbyBqcYFM+rKtxOq3ahmPA/Na6Y52yTjolfGRdpMop
 tBsLJjDw==;
Received: from [177.34.168.16] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pmbTh-00Gs4V-R3; Wed, 12 Apr 2023 16:29:42 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Rob Clark <robdclark@gmail.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: [PATCH] drm/gem: Check for valid formats
Date: Wed, 12 Apr 2023 11:29:23 -0300
Message-Id: <20230412142923.136707-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
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

Adding this check to drm_gem_fb_create() will guarantee that the
igt@kms_addfb_basic@addfb25-bad-modifier IGT test passes for drivers
using this callback.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

This patch is a recapture of a series I sent a while ago. Initially, I sent a
patch [1] similar to this one in which I introduced the format check to
drm_gem_fb_create().

Based on the feedback on the patch, I placed the check inside
framebuffer_check() [2] so that it wouldn't be needed to hit any driver-specific
code path when the check fails. Therefore, we could remove the check from the
specific drivers (i915, amdgpu, and vmwgfx).

But, with some new feedback, it was shown that introducing this check inside
framebuffer_check() is problematic for the i915 driver [3]. So, I kept the check
inside the i915 driver and removed the check from amdgpu and vmwgfx [4]. But,
this yet hasn't solved the i915 problem [5].

As we cannot add the check inside framebuffer_check() without affecting the i915
behavior, I propose going back to the original patch. This way we can guarantee
a more uniform behavior from the drivers that use the drm_gem_fb_create()
callback.

[1] https://lore.kernel.org/dri-devel/20230103125322.855089-1-mcanal@igalia.com/T/
[2] https://lore.kernel.org/dri-devel/20230109105807.18172-1-mcanal@igalia.com/T/
[3] https://lore.kernel.org/dri-devel/Y8AAdW2y7zN7DCUZ@intel.com/
[4] https://lore.kernel.org/dri-devel/20230113112743.188486-1-mcanal@igalia.com/T/
[5] https://lore.kernel.org/dri-devel/Y8FXWvEhO7GCRKVJ@intel.com/

Best Regards,
- Maíra Canal

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
2.39.2

