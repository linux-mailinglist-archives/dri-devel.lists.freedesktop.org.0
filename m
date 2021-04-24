Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0626C36A01E
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 10:25:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA7C6E1E0;
	Sat, 24 Apr 2021 08:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33936E1ED
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 08:25:39 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c4so11711851wrt.8
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 01:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xy1V1Mpjuu/j3aeXtk3AWOCLxBSZkbzjIzUOVTBCy0k=;
 b=dSJntp5ekSiIKVvN6cFGUqcLf01b8TxwPUyJrjtAWIciSvhgTAxSeBy/aFnfhuZr6x
 x/1lvdyqR8+5l+2NOTxjSasrm3PeER83OZPAny+lurxrpUw5MS64K8RNQ2UTCsfH5JRe
 YgLqJvsQpvS7s691wch1elp5m3V5ur58lEIL2C9wam9kw+Z8DZaZ/blXeprGPP4aGjaG
 jEw5qvlXRUXASTqsNYIBevj9nlhH08eFMx/FOofX5DMu8pkwLOC+BBT40HZlIKXyhFTX
 GCDrsFQOvuw/czgeBuxQZaqQXLS2zk1jUJJM+LMpb5JNOvTaDQDmQZ079Rfku4xjpK10
 M5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xy1V1Mpjuu/j3aeXtk3AWOCLxBSZkbzjIzUOVTBCy0k=;
 b=rRlQQXowPk5pbdePnPUNUU5TdLzDbzdFXZMxbBr/Gdj9e9YmpBgSG1RwlL+kQWBmK+
 wfxeicHxQk5bE8YrUxQcla4Sxh/hITXNBvOBQQOFnta4H1etcrm1FK4WuOSAGfpwWL7g
 5wy5dbO0YJ2LBT1hB/9Yp282eW5W6Ln2s5GP6/pnN7hZqtqC+fivY+xDDJIZu2hdhxA0
 zwfLRyzE8iTmnf02rjeaxrJA0rRgQNxtwGg0emneGRrnvWfImb8G+ZmJYoQVKDTBz8vq
 s1Dam/VbuTP5UUUAT65G1Lg71yLz2aSWVhh0Z2UQfaJNHwFSkkLBDZGFJ6+LeDz55LKV
 etdA==
X-Gm-Message-State: AOAM531j8PhjKycdw7nKXfkk+MYptW/e6JkBEGdBogilyUZsvHKAkanm
 +EFbZ0nSO1oE3lsk8WE9/+XjghOpuv0waZZ5
X-Google-Smtp-Source: ABdhPJzwFKH2VUvMZ74g3hCfnG8TdPb4S4BEBEP7tCQpYDrKCbF0IAA8Mw8MbRXfI4cYEVg/FsypAw==
X-Received: by 2002:adf:e50d:: with SMTP id j13mr9514888wrm.80.1619252738288; 
 Sat, 24 Apr 2021 01:25:38 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id q19sm12980121wmc.44.2021.04.24.01.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 01:25:37 -0700 (PDT)
Date: Sat, 24 Apr 2021 05:25:31 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/4] drm/vkms: add XRGB planes composition
Message-ID: <07bcf4643d11da9480599fe1b165e478bff58b25.1619250933.git.melissa.srw@gmail.com>
References: <cover.1619250933.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1619250933.git.melissa.srw@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for composing XRGB888 planes in addition to the ARGB8888
format. In the case of an XRGB plane at the top, the composition consists
of copying the RGB values of a pixel from src to dst and clearing alpha
channel, without the need for alpha blending operations for each pixel.

Blend equations assume a completely opaque background, i.e., primary plane
is not cleared before pixel blending but alpha channel is explicitly
opaque (a = 0xff). Also, there is room for performance evaluation in
switching pixel blend operation according to the plane format.

v4:
- clear alpha channel (0xff) after blend color values by pixel
- improve comments on blend ops to reflect the current state
- describe in the commit message future improvements for plane composition

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 56 ++++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_plane.c    |  7 ++--
 2 files changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 02642801735d..7e01bc39d2a1 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_vblank.h>
@@ -64,7 +65,17 @@ static u8 blend_channel(u8 src, u8 dst, u8 alpha)
 	return new_color;
 }
 
-static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
+/**
+ * alpha_blend - alpha blending equation
+ * @argb_src: src pixel on premultiplied alpha mode
+ * @argb_dst: dst pixel completely opaque
+ *
+ * blend pixels using premultiplied blend formula. The current DRM assumption
+ * is that pixel color values have been already pre-multiplied with the alpha
+ * channel values. See more drm_plane_create_blend_mode_property(). Also, this
+ * formula assumes a completely opaque background.
+ */
+static void alpha_blend(const u8 *argb_src, u8 *argb_dst)
 {
 	u8 alpha;
 
@@ -72,8 +83,16 @@ static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
 	argb_dst[0] = blend_channel(argb_src[0], argb_dst[0], alpha);
 	argb_dst[1] = blend_channel(argb_src[1], argb_dst[1], alpha);
 	argb_dst[2] = blend_channel(argb_src[2], argb_dst[2], alpha);
-	/* Opaque primary */
-	argb_dst[3] = 0xFF;
+}
+
+/**
+ * x_blend - blending equation that ignores the pixel alpha
+ *
+ * overwrites RGB color value from src pixel to dst pixel.
+ */
+static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
+{
+	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);
 }
 
 /**
@@ -82,16 +101,20 @@ static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
  * @vaddr_src: source address
  * @dst_composer: destination framebuffer's metadata
  * @src_composer: source framebuffer's metadata
+ * @pixel_blend: blending equation based on plane format
  *
- * Blend the vaddr_src value with the vaddr_dst value using the pre-multiplied
- * alpha blending equation, since DRM currently assumes that the pixel color
- * values have already been pre-multiplied with the alpha channel values. See
- * more drm_plane_create_blend_mode_property(). This function uses buffer's
- * metadata to locate the new composite values at vaddr_dst.
+ * Blend the vaddr_src value with the vaddr_dst value using a pixel blend
+ * equation according to the plane format and clearing alpha channel to an
+ * completely opaque background. This function uses buffer's metadata to locate
+ * the new composite values at vaddr_dst.
+ *
+ * TODO: completely clear the primary plane (a = 0xff) before starting to blend
+ * pixel color values
  */
 static void blend(void *vaddr_dst, void *vaddr_src,
 		  struct vkms_composer *dst_composer,
-		  struct vkms_composer *src_composer)
+		  struct vkms_composer *src_composer,
+		  void (*pixel_blend)(const u8 *, u8 *))
 {
 	int i, j, j_dst, i_dst;
 	int offset_src, offset_dst;
@@ -119,7 +142,9 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 
 			pixel_src = (u8 *)(vaddr_src + offset_src);
 			pixel_dst = (u8 *)(vaddr_dst + offset_dst);
-			alpha_blending(pixel_src, pixel_dst);
+			pixel_blend(pixel_src, pixel_dst);
+			/* clearing alpha channel (0xff)*/
+			memset(vaddr_dst + offset_dst + 3, 0xff, 1);
 		}
 		i_dst++;
 	}
@@ -131,6 +156,8 @@ static void compose_plane(struct vkms_composer *primary_composer,
 {
 	struct drm_gem_object *plane_obj;
 	struct drm_gem_shmem_object *plane_shmem_obj;
+	struct drm_framebuffer *fb = &plane_composer->fb;
+	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
 
 	plane_obj = drm_gem_fb_get_obj(&plane_composer->fb, 0);
 	plane_shmem_obj = to_drm_gem_shmem_obj(plane_obj);
@@ -138,8 +165,13 @@ static void compose_plane(struct vkms_composer *primary_composer,
 	if (WARN_ON(!plane_shmem_obj->vaddr))
 		return;
 
-	blend(vaddr_out, plane_shmem_obj->vaddr,
-	      primary_composer, plane_composer);
+	if (fb->format->format == DRM_FORMAT_ARGB8888)
+		pixel_blend = &alpha_blend;
+	else
+		pixel_blend = &x_blend;
+
+	blend(vaddr_out, plane_shmem_obj->vaddr, primary_composer,
+	      plane_composer, pixel_blend);
 }
 
 static int compose_active_planes(void **vaddr_out,
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 135140f8e87a..da4251aff67f 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -16,8 +16,9 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_XRGB8888,
 };
 
-static const u32 vkms_cursor_formats[] = {
+static const u32 vkms_plane_formats[] = {
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888
 };
 
 static struct drm_plane_state *
@@ -200,8 +201,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 	int nformats;
 
 	if (type == DRM_PLANE_TYPE_CURSOR) {
-		formats = vkms_cursor_formats;
-		nformats = ARRAY_SIZE(vkms_cursor_formats);
+		formats = vkms_plane_formats;
+		nformats = ARRAY_SIZE(vkms_plane_formats);
 		funcs = &vkms_primary_helper_funcs;
 	} else {
 		formats = vkms_formats;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
