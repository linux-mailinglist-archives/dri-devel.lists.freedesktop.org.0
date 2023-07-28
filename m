Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AAF766828
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C589C10E6A9;
	Fri, 28 Jul 2023 09:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D5810E6A9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:06:24 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
 by xavier.telenet-ops.be with bizsmtp
 id SZ6N2A00V0d1nm801Z6NdC; Fri, 28 Jul 2023 11:06:23 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPJQH-002llF-Bx;
 Fri, 28 Jul 2023 11:06:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPJQU-00Ao3C-EX;
 Fri, 28 Jul 2023 11:06:22 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v2] drm/gem-fb-helper: Consistenly use drm_dbg_kms()
Date: Fri, 28 Jul 2023 11:06:21 +0200
Message-Id: <7d56615fbef2d4d0e5f4c4a23f57269bf8bdb71f.1690535176.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All debug messages in drm_gem_framebuffer_helper.c use drm_dbg_kms(),
except for one, which uses drm_dbg().
Replace the outlier by drm_dbg_kms() to restore consistency.

Fixes: c91acda3a380bcaf ("drm/gem: Check for valid formats")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
v2:
  - Add Reviewed-by.
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index b8a615a138cd675f..3bdb6ba37ff42fb6 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -168,8 +168,8 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
 	if (drm_drv_uses_atomic_modeset(dev) &&
 	    !drm_any_plane_has_format(dev, mode_cmd->pixel_format,
 				      mode_cmd->modifier[0])) {
-		drm_dbg(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
-			&mode_cmd->pixel_format, mode_cmd->modifier[0]);
+		drm_dbg_kms(dev, "Unsupported pixel format %p4cc / modifier 0x%llx\n",
+			    &mode_cmd->pixel_format, mode_cmd->modifier[0]);
 		return -EINVAL;
 	}
 
-- 
2.34.1

