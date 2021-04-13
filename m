Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8728935D962
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 09:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5326E217;
	Tue, 13 Apr 2021 07:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139716E217
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 07:55:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id k128so8172554wmk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 00:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0GvgA1racKrpTSVDZjQw5lJlS7yNUXjRv+Dx3EsFT4g=;
 b=dNA/9VJ50JpvT/XEnMMrUUVREDlPw5geW9D36H6UAEvuxC9LgSyaKtDhIghnY94Rj0
 R/EkoxcH5SNlTZ6SMsM+cW4elttN/j8bHNzx8MFU5pVp2U1xpr7HgMeU3DxqYyAx6GEm
 smbYVigLpuXmIgS20D5ICvO1R8vOAN1yDfffLSlXr2raeXOXvykyk9lFOi4rHTjFp0a+
 09snzHjaffpv0EZdJZDALkONDvrYnCCPXG5mNKtsCpqs7SewOZBGeerOmnnzLsFEBBWz
 wGT1B33i96vdHx8zf+zW5Pmi31WL/j6wgD/XvH8of+F0DIkj/CQAL/U97JmIlRHHMWLf
 r+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0GvgA1racKrpTSVDZjQw5lJlS7yNUXjRv+Dx3EsFT4g=;
 b=D+iSeVb1RG4MBO6/FjJnYOMM9jYjSKK3jkULmnv+XqVlRt6oM/HDrZLITOaeCUAq24
 lll4ZN+YY+ECt5SqY7qd78zsmAiZkJbK0Ang2IlYgX5TVdL79JY564jeaGwUcduknypj
 VA8Nlor9RBpbr5Gkr7XE0L3oImSKLowNO+SNPOMYofImHP1XSuvpgPUKms2lZ65z11+W
 qym1X/9/5tBDHWl5vLHpc1Wmcfwl1U8sYFZns7lAAXTflFODyTQmf8rVOpfQBjwW/w63
 HWWpvXuH/dP1pv6rGQkuSR78RP4+vCO9Tb1xkrJ1NZb36FjExObJEwxb0nFRDcT0aQU7
 ubfw==
X-Gm-Message-State: AOAM530oFms+teW36Hn/MKvDKTKIoNNraldSqjNjn0NEhtbHFZEbd/um
 BbXp/MR7HASJKSipluf5O2WjCeTjphNmww==
X-Google-Smtp-Source: ABdhPJzrD4wsIIQAipKufrdkCpobubzhYCjmT70tPGudPiqGwEboMR8/Zb6CX0SXZtu47m4EH1CIEA==
X-Received: by 2002:a05:600c:4f4f:: with SMTP id
 m15mr2767598wmq.29.1618300499457; 
 Tue, 13 Apr 2021 00:54:59 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id a7sm20755813wrn.50.2021.04.13.00.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 00:54:58 -0700 (PDT)
Date: Tue, 13 Apr 2021 04:54:52 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/vkms: add XRGB planes composition
Message-ID: <e117eb967eae9fe45589a266335f4d99860144c1.1618299945.git.melissa.srw@gmail.com>
References: <cover.1618299945.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1618299945.git.melissa.srw@gmail.com>
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
