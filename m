Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A64122F51
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B0A6EA0A;
	Tue, 17 Dec 2019 14:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB8F6EA02
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id CCD422927C2
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 11/34] drm/komeda: Provide and use komeda_fb_get_pixel_addr
 variant not requiring a fb
Date: Tue, 17 Dec 2019 15:49:57 +0100
Message-Id: <20191217145020.14645-12-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217145020.14645-1-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a variant of the function which doesn't need neither
struct drm_framebuffer nor container_of it. Maintain current interface
for existing users.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../arm/display/komeda/komeda_framebuffer.c   | 68 +++++++++++++++----
 .../arm/display/komeda/komeda_framebuffer.h   |  7 ++
 2 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 5d035f6a76a6..08f31478c6a8 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -123,7 +123,12 @@ komeda_fb_none_afbc_size_check(struct komeda_dev *mdev,
 			return -EINVAL;
 		}
 
-		min_size = komeda_fb_get_pixel_addr(kfb, 0, fb->height, i)
+		min_size = komeda_fb_get_pixel_addr_nofb(info,
+							 mode_cmd->modifier[0],
+							 mode_cmd->pitches,
+							 mode_cmd->offsets,
+							 obj,
+							 0, mode_cmd->height, i)
 			 - to_drm_gem_cma_obj(obj)->paddr;
 		if (obj->size < min_size) {
 			DRM_DEBUG_KMS("The fb->obj[%d] size: 0x%zx lower than the minimum requirement: 0x%llx.\n",
@@ -237,12 +242,56 @@ int komeda_fb_check_src_coords(const struct komeda_fb *kfb,
 	return 0;
 }
 
+dma_addr_t
+komeda_fb_get_pixel_addr_impl(const struct drm_format_info *format,
+			      u64 modifier,
+			      const unsigned int *pitches,
+			      const unsigned int *offsets,
+			      const struct drm_gem_cma_object *obj,
+			      int x, int y, int plane)
+{
+	u32 offset, plane_x, plane_y, block_w, block_sz;
+
+	offset = offsets[plane];
+	if (modifier) {
+		block_w = drm_format_info_block_width(format, plane);
+		block_sz = format->char_per_block[plane];
+		plane_x = x / (plane ? format->hsub : 1);
+		plane_y = y / (plane ? format->vsub : 1);
+
+		offset += (plane_x / block_w) * block_sz
+			+ plane_y * pitches[plane];
+	}
+
+	return obj->paddr + offset;
+}
+
+dma_addr_t
+komeda_fb_get_pixel_addr_nofb(const struct drm_format_info *format,
+			      u64 modifier,
+			      const unsigned int *pitches,
+			      const unsigned int *offsets,
+			      struct drm_gem_object *obj,
+			      int x, int y, int plane)
+{
+	const struct drm_gem_cma_object *cma_obj;
+
+	if (plane >= format->num_planes) {
+		DRM_DEBUG_KMS("Out of max plane num.\n");
+		return -EINVAL;
+	}
+
+	cma_obj = to_drm_gem_cma_obj(obj);
+
+	return komeda_fb_get_pixel_addr_impl(format, modifier, pitches, offsets,
+					     cma_obj, x, y, plane);
+}
+
 dma_addr_t
 komeda_fb_get_pixel_addr(struct komeda_fb *kfb, int x, int y, int plane)
 {
 	struct drm_framebuffer *fb = &kfb->base;
 	const struct drm_gem_cma_object *obj;
-	u32 offset, plane_x, plane_y, block_w, block_sz;
 
 	if (plane >= fb->format->num_planes) {
 		DRM_DEBUG_KMS("Out of max plane num.\n");
@@ -251,18 +300,9 @@ komeda_fb_get_pixel_addr(struct komeda_fb *kfb, int x, int y, int plane)
 
 	obj = drm_fb_cma_get_gem_obj(fb, plane);
 
-	offset = fb->offsets[plane];
-	if (!fb->modifier) {
-		block_w = drm_format_info_block_width(fb->format, plane);
-		block_sz = fb->format->char_per_block[plane];
-		plane_x = x / (plane ? fb->format->hsub : 1);
-		plane_y = y / (plane ? fb->format->vsub : 1);
-
-		offset += (plane_x / block_w) * block_sz
-			+ plane_y * fb->pitches[plane];
-	}
-
-	return obj->paddr + offset;
+	return komeda_fb_get_pixel_addr_impl(fb->format, fb->modifier,
+					     fb->pitches, fb->offsets,
+					     obj, x, y, plane);
 }
 
 /* if the fb can be supported by a specific layer */
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
index c61ca98a3a63..2f1f421d3e7f 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
@@ -42,6 +42,13 @@ int komeda_fb_check_src_coords(const struct komeda_fb *kfb,
 			       u32 src_x, u32 src_y, u32 src_w, u32 src_h);
 dma_addr_t
 komeda_fb_get_pixel_addr(struct komeda_fb *kfb, int x, int y, int plane);
+dma_addr_t
+komeda_fb_get_pixel_addr_nofb(const struct drm_format_info *format,
+			      u64 modifier,
+			      const unsigned int *pitches,
+			      const unsigned int *offsets,
+			      struct drm_gem_object *obj,
+			      int x, int y, int plane);
 bool komeda_fb_is_layer_supported(struct komeda_fb *kfb, u32 layer_type,
 		u32 rot);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
