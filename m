Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B57873A4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 17:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA9610E580;
	Thu, 24 Aug 2023 15:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDBB10E585
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 15:08:55 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3c6b:f703:5ab5:f36d])
 by laurent.telenet-ops.be with bizsmtp
 id dT8t2A00D01sfPQ01T8th5; Thu, 24 Aug 2023 17:08:53 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qZBwx-001dhP-Ip;
 Thu, 24 Aug 2023 17:08:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qZBx7-000Vz6-83;
 Thu, 24 Aug 2023 17:08:53 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 6/8] drm/fb-helper: Pass buffer format via
 drm_fb_helper_surface_size
Date: Thu, 24 Aug 2023 17:08:44 +0200
Message-Id: <df91abce8e86bdf71b9062718b7643c3c143788b.1692888745.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692888745.git.geert@linux-m68k.org>
References: <cover.1692888745.git.geert@linux-m68k.org>
MIME-Version: 1.0
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_fb_helper_single_fb_probe() first calls drm_fb_helper_find_sizes(),
followed by drm_fbdev_generic_helper_fb_probe():
  - The former tries to find a suitable buffer format, taking into
    account limitations of the whole display pipeline,
  - The latter just calls drm_mode_legacy_fb_format() again.

Simplify this by passing the buffer format between these functions
via a new buffer format member in the drm_fb_helper_surface_size
structure.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Javier Martinez Canillas <javierm@redhat.com>
---
v2:
  - Fix accidental debug level increase,
  - Add Reviewed-by, Tested-by.
---
 drivers/gpu/drm/drm_fb_helper.c     | 1 +
 drivers/gpu/drm/drm_fbdev_generic.c | 9 ++++-----
 include/drm/drm_fb_helper.h         | 2 ++
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d612133e2cf7ec99..4dc28fdcc1e0a6a4 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1564,6 +1564,7 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 	info = drm_format_info(surface_format);
 	sizes->surface_bpp = drm_format_info_bpp(info, 0);
 	sizes->surface_depth = info->depth;
+	sizes->surface_format = surface_format;
 
 	/* first up get a count of crtcs now in use and new min/maxes width/heights */
 	crtc_count = 0;
diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index d647d89764cb9894..3830d25bcc3ad035 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -77,16 +77,15 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	struct fb_info *info;
 	size_t screen_size;
 	void *screen_buffer;
-	u32 format;
 	int ret;
 
-	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
+	drm_dbg_kms(dev, "surface width(%d), height(%d), bpp(%d) and format(%p4cc)\n",
 		    sizes->surface_width, sizes->surface_height,
-		    sizes->surface_bpp);
+		    sizes->surface_bpp, &sizes->surface_format);
 
-	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
 	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
-					       sizes->surface_height, format);
+					       sizes->surface_height,
+					       sizes->surface_format);
 	if (IS_ERR(buffer))
 		return PTR_ERR(buffer);
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 375737fd6c36ed19..aa3d62a531d12f37 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -45,6 +45,7 @@ struct drm_fb_helper;
  * @surface_height: scanout buffer height
  * @surface_bpp: scanout buffer bpp
  * @surface_depth: scanout buffer depth
+ * @surface_format: scanout buffer format (optional)
  *
  * Note that the scanout surface width/height may be larger than the fbdev
  * width/height.  In case of multiple displays, the scanout surface is sized
@@ -61,6 +62,7 @@ struct drm_fb_helper_surface_size {
 	u32 surface_height;
 	u32 surface_bpp;
 	u32 surface_depth;
+	u32 surface_format;
 };
 
 /**
-- 
2.34.1

