Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BB635D375
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 00:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F11C6E0B8;
	Mon, 12 Apr 2021 22:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250EB6E0B8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 22:50:54 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a4so14524568wrr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=WysvM+m5VwbV557IphflOcYyXOFKkhTC+rz/uG3NQ2o=;
 b=TG/Z4n8rIz8mkA70My0Kihj4XSsVXDLyHfffmJOuAiH2WK4oTamQ4uiLO8MHOtic7m
 Voc1hvfHLfOYzGLPxXgzPrBjgceDBrYMCLBcD7pq6vSXb3o3MLG+BYy1CyTsCMaTccoO
 IsDQ4ErK9Iy0kx6nWKV6/OsP2/qprbj6dKjPpWXXU1m4uHpyCPOYYmfPUPjnDUlS2MRG
 GZHvzy2eBLcKmEZ+lpw8ER9kXy0ZgvPfGlPsnLLLlrcgOpW08tGRjXKU5j6BfHVclm2q
 JFUVUkU5W/YiBpEU91mgy4BgvK6ElzjqiIe0i5MADZzc3CG5LBusFXAZbV1jxMVU56CY
 Y9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=WysvM+m5VwbV557IphflOcYyXOFKkhTC+rz/uG3NQ2o=;
 b=SnCJTTUL6SGGKmR3e4rnpOWckJzmcmCDBGBZ6gemqSga+C6nAvrb4SX89DoJQ7RwE/
 warzX0LIAniyqEycBva7OQ5dnjwX4LJDsSog5BasBMIwz+RQGf4fT5l+vX1rMEnZZcKn
 oWqcryhthNRw5LZsS+Wp+wRUpfCehIj3WqiWSbADUrptp7bFqfS1iW/POAwftcccRdOM
 6DkNNCqVLh+PZk1vjwfMKjsnVLFOI2zSO3IGEYJSabrsmZLbl5Sjuf0d/2dNAacBdt1h
 J6tinM8JHaTRp0BBpfKkWTNCmNB4XLre58WIPbU7EzBUmJr5zge0Qoc/AWvQMT2k6rnL
 Kcfw==
X-Gm-Message-State: AOAM531Th2RoShwKLXG8QIxY3z0nVOFLfjwPfqu4OHkQPKSUmrlaSt6I
 4Aac6TqZ5D+oK8uoM5Z/dzc=
X-Google-Smtp-Source: ABdhPJyqJLKsh+Go2sELh1NobBnhWLE4/nWD+fuCNTE15XRXrIju8NJFgPHQHVgGfKWIOS6+sn/+jw==
X-Received: by 2002:adf:e901:: with SMTP id f1mr2628257wrm.44.1618267852896;
 Mon, 12 Apr 2021 15:50:52 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id f12sm19278875wrr.61.2021.04.12.15.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 15:50:52 -0700 (PDT)
Date: Mon, 12 Apr 2021 19:50:44 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Simon Ser <contact@emersion.fr>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: [PATCH v2 3/4] drm/vkms: add XRGB planes composition
Message-ID: <20210412225044.ehpqssv2ujt4kfrb@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for composing XRGB888 planes in addition to the
ARGB8888 format. In the case of an XRGB plane at the top, the
composition consists of just copying the RGB values of a
pixel from src to dst, without the need for alpha blending
operations for each pixel.

Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 22 ++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_plane.c    |  7 ++++---
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index be8f1d33c645..7fe1fdb3af39 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_vblank.h>
@@ -76,6 +77,11 @@ static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
 	argb_dst[3] = 0xFF;
 }
 
+static void x_blending(const u8 *xrgb_src, u8 *xrgb_dst)
+{
+	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);
+}
+
 /**
  * blend - blend value at vaddr_src with value at vaddr_dst
  * @vaddr_dst: destination address
@@ -91,7 +97,8 @@ static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
  */
 static void blend(void *vaddr_dst, void *vaddr_src,
 		  struct vkms_composer *dst_composer,
-		  struct vkms_composer *src_composer)
+		  struct vkms_composer *src_composer,
+		  void (*pixel_blend)(const u8 *, u8 *))
 {
 	int i, j, j_dst, i_dst;
 	int offset_src, offset_dst;
@@ -119,7 +126,7 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 
 			pixel_src = (u8 *)(vaddr_src + offset_src);
 			pixel_dst = (u8 *)(vaddr_dst + offset_dst);
-			alpha_blending(pixel_src, pixel_dst);
+			pixel_blend(pixel_src, pixel_dst);
 		}
 		i_dst++;
 	}
@@ -131,6 +138,8 @@ static void compose_planes(struct vkms_composer *primary_composer,
 {
 	struct drm_gem_object *plane_obj;
 	struct drm_gem_shmem_object *plane_shmem_obj;
+	struct drm_framebuffer *fb = &plane_composer->fb;
+	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
 
 	plane_obj = drm_gem_fb_get_obj(&plane_composer->fb, 0);
 	plane_shmem_obj = to_drm_gem_shmem_obj(plane_obj);
@@ -138,8 +147,13 @@ static void compose_planes(struct vkms_composer *primary_composer,
 	if (WARN_ON(!plane_shmem_obj->vaddr))
 		return;
 
-	blend(vaddr_out, plane_shmem_obj->vaddr,
-	      primary_composer, plane_composer);
+	if (fb->format->format == DRM_FORMAT_ARGB8888)
+		pixel_blend = &alpha_blending;
+	else
+		pixel_blend = &x_blending;
+
+	blend(vaddr_out, plane_shmem_obj->vaddr, primary_composer,
+	      plane_composer, pixel_blend);
 }
 
 static int composite(void **vaddr_out,
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 36562846f6cb..1d35b727dd31 100644
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
