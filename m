Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04194740322
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 20:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97C110E31A;
	Tue, 27 Jun 2023 18:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254AA10E31A
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 18:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id C5A3D402C8;
 Tue, 27 Jun 2023 20:23:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mLcOPf5stLo; Tue, 27 Jun 2023 20:23:48 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1687890228; bh=pLNhNjla8VA0jESGDcl+r03g5pKhwn2en6STGAjDebw=;
 h=From:To:Cc:Subject:Date;
 b=cFZdg5TC6VtXCZjMQYERogQq6NJE5is1P3TCXQiKjVTHysSga6eItPnqis5GoDgBd
 +okaEbFb9H/S2Uhe3hOZf8K1weNIYdm+qg52bpeUqIt56WaJ23gvPOt/Ad6g2UF6TU
 sfQzXorMxwwSIQfIMrFQkKynjxi392IYvQPYhdwgp/VIPHJPoLSom7Xikzht3prB4T
 J7UOETEqmzsYY3H2YONFLhymygJzIn1yO9LjAMH0B7BhYCCORO6t+bzQBeP10qjxpk
 ZHAQzLqmjCxEYJiHuQeyPIqDlTPGb3Mmd03l/7XmqdTdeJTa7tdb1JLHJVRQbYltms
 2Kibl+BP+oNoQ==
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm: Replace drm_framebuffer plane size functions with its
 equivalents
Date: Tue, 27 Jun 2023 15:22:39 -0300
Message-Id: <20230627182239.15676-1-gcarlos@disroot.org>
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
Cc: matthew.d.roper@intel.com, tvrtko.ursulin@linux.intel.com,
 stanislav.lisovskiy@intel.com, andrealmeid@igalia.com,
 juhapekka.heikkila@gmail.com, tales.aparecida@gmail.com,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, mripard@kernel.org,
 mairacanal@riseup.net, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 niranjana.vishwanathapura@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The functions drm_framebuffer_plane{width,height} and
fb_plane_{width,height} do exactly the same job of its
equivalents drm_format_info_plane_{width,height} from drm_fourcc.

The only reason to have these functions on drm_framebuffer
would be if they would added a abstraction layer to call it just
passing a drm_framebuffer pointer and the desired plane index,
which is not the case, where these functions actually implements
just part of it. In the actual implementation, every call to both
drm_framebuffer_plane_{width,height} and fb_plane_{width,height} should
pass some drm_framebuffer attribute, which is the same as calling the
drm_format_info_plane_{width,height} functions.

The drm_format_info_pane_{width,height} functions are much more
consistent in both its implementation and its location on code. The
kind of calculation that they do is intrinsically derivated from the
drm_format_info struct and has not to do with drm_framebuffer, except
by the potential motivation described above, which is still not a good
justificative to have drm_framebuffer functions to calculate it.

So, replace each drm_framebuffer_plane_{width,height} and
fb_plane_{width,height} call to drm_format_info_plane_{width,height}
and remove them.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 drivers/gpu/drm/drm_framebuffer.c       | 64 ++-----------------------
 drivers/gpu/drm/i915/display/intel_fb.c |  2 +-
 include/drm/drm_framebuffer.h           |  5 --
 3 files changed, 5 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index aff3746dedfb..efed4cd7965e 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -151,24 +151,6 @@ int drm_mode_addfb_ioctl(struct drm_device *dev,
 	return drm_mode_addfb(dev, data, file_priv);
 }
 
-static int fb_plane_width(int width,
-			  const struct drm_format_info *format, int plane)
-{
-	if (plane == 0)
-		return width;
-
-	return DIV_ROUND_UP(width, format->hsub);
-}
-
-static int fb_plane_height(int height,
-			   const struct drm_format_info *format, int plane)
-{
-	if (plane == 0)
-		return height;
-
-	return DIV_ROUND_UP(height, format->vsub);
-}
-
 static int framebuffer_check(struct drm_device *dev,
 			     const struct drm_mode_fb_cmd2 *r)
 {
@@ -196,8 +178,8 @@ static int framebuffer_check(struct drm_device *dev,
 	info = drm_get_format_info(dev, r);
 
 	for (i = 0; i < info->num_planes; i++) {
-		unsigned int width = fb_plane_width(r->width, info, i);
-		unsigned int height = fb_plane_height(r->height, info, i);
+		unsigned int width = drm_format_info_plane_width(info, r->width, i);
+		unsigned int height = drm_format_info_plane_height(info, r->height, i);
 		unsigned int block_size = info->char_per_block[i];
 		u64 min_pitch = drm_format_info_min_pitch(info, i, width);
 
@@ -1136,44 +1118,6 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb)
 }
 EXPORT_SYMBOL(drm_framebuffer_remove);
 
-/**
- * drm_framebuffer_plane_width - width of the plane given the first plane
- * @width: width of the first plane
- * @fb: the framebuffer
- * @plane: plane index
- *
- * Returns:
- * The width of @plane, given that the width of the first plane is @width.
- */
-int drm_framebuffer_plane_width(int width,
-				const struct drm_framebuffer *fb, int plane)
-{
-	if (plane >= fb->format->num_planes)
-		return 0;
-
-	return fb_plane_width(width, fb->format, plane);
-}
-EXPORT_SYMBOL(drm_framebuffer_plane_width);
-
-/**
- * drm_framebuffer_plane_height - height of the plane given the first plane
- * @height: height of the first plane
- * @fb: the framebuffer
- * @plane: plane index
- *
- * Returns:
- * The height of @plane, given that the height of the first plane is @height.
- */
-int drm_framebuffer_plane_height(int height,
-				 const struct drm_framebuffer *fb, int plane)
-{
-	if (plane >= fb->format->num_planes)
-		return 0;
-
-	return fb_plane_height(height, fb->format, plane);
-}
-EXPORT_SYMBOL(drm_framebuffer_plane_height);
-
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb)
 {
@@ -1189,8 +1133,8 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 
 	for (i = 0; i < fb->format->num_planes; i++) {
 		drm_printf_indent(p, indent + 1, "size[%u]=%dx%d\n", i,
-				  drm_framebuffer_plane_width(fb->width, fb, i),
-				  drm_framebuffer_plane_height(fb->height, fb, i));
+				  drm_format_info_plane_width(fb->format, fb->width, i),
+				  drm_format_info_plane_height(fb->format, fb->height, i));
 		drm_printf_indent(p, indent + 1, "pitch[%u]=%u\n", i, fb->pitches[i]);
 		drm_printf_indent(p, indent + 1, "offset[%u]=%u\n", i, fb->offsets[i]);
 		drm_printf_indent(p, indent + 1, "obj[%u]:%s\n", i,
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 446bbf7986b6..5de2453ff7a3 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -1113,7 +1113,7 @@ static int intel_fb_offset_to_xy(int *x, int *y,
 		return -EINVAL;
 	}
 
-	height = drm_framebuffer_plane_height(fb->height, fb, color_plane);
+	height = drm_format_info_plane_height(fb->format, fb->height, color_plane);
 	height = ALIGN(height, intel_tile_height(fb, color_plane));
 
 	/* Catch potential overflows early */
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index 0dcc07b68654..80ece7b6dd9b 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -292,11 +292,6 @@ static inline void drm_framebuffer_assign(struct drm_framebuffer **p,
 	     &fb->head != (&(dev)->mode_config.fb_list);			\
 	     fb = list_next_entry(fb, head))
 
-int drm_framebuffer_plane_width(int width,
-				const struct drm_framebuffer *fb, int plane);
-int drm_framebuffer_plane_height(int height,
-				 const struct drm_framebuffer *fb, int plane);
-
 /**
  * struct drm_afbc_framebuffer - a special afbc frame buffer object
  *
-- 
2.39.3

