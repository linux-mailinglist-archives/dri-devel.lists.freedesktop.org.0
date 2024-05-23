Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FE18CD34A
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 15:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7563210E6B9;
	Thu, 23 May 2024 13:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bCufj9wb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE9E10E405
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716469826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXRCwx+E+u1r2Sus3Bp63droaYHql8aXfa0HRrPvOzs=;
 b=bCufj9wbiKf7mjqkE01lvDnS3/Pi5FRodrMEOUq8wOe2we+ptq8BV2UJs3/fEDMjO6AYzb
 obOlARzVCCnP5hUcITHqDaarY0Ju0hYQcZUSm7+rk3uIlgeN9XIhK1nOxA3YkJwLUw9oTf
 H5W+dx8soJVT1brqdph+YpaGcrNtWE8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-8umOvisXOBGRITZzEVrq8g-1; Thu, 23 May 2024 09:10:22 -0400
X-MC-Unique: 8umOvisXOBGRITZzEVrq8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7846180028D;
 Thu, 23 May 2024 13:10:20 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9743C15BF6;
 Thu, 23 May 2024 13:10:18 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 5/5] drm/nouveau: Add drm_panic support for nv50+
Date: Thu, 23 May 2024 15:00:38 +0200
Message-ID: <20240523130955.428233-6-jfalempe@redhat.com>
In-Reply-To: <20240523130955.428233-1-jfalempe@redhat.com>
References: <20240523130955.428233-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drm_panic support, for nv50+ cards.
It's enough to get the panic screen while running Gnome/Wayland on a
GTX 1650.
It doesn't support multi-plane or compressed format.
Support for other formats and older cards will come later.
Tiling is only tested on GTX1650, and might be wrong for other cards.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 127 +++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 7a2cceaee6e9..dd7aafb9198a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -30,11 +30,16 @@
 #include <nvhw/class/cl507e.h>
 #include <nvhw/class/clc37e.h>
 
+#include <linux/iosys-map.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_panic.h>
+#include <drm/ttm/ttm_bo.h>
 
 #include "nouveau_bo.h"
 #include "nouveau_gem.h"
@@ -577,6 +582,113 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	return 0;
 }
 
+/* Values found on GTX1650 */
+/* blocks level 0, 4x4 pixels */
+#define BL0_W 4
+/* blocks level 1, 8x8 pixels */
+#define BL1_W 8
+/* blocks level 2, Group of Bytes? 16x128 pixels */
+#define BL2_W 16
+
+/* get the offset in bytes inside the framebuffer, after taking tiling into account */
+static unsigned int nv50_get_tiled_offset(struct drm_scanout_buffer *sb, unsigned int gobs,
+					  unsigned int x, unsigned int y, unsigned int px_width)
+{
+	u32 blk2_x, blk2_y, bl2sz;
+	u32 blk1_x, blk1_y, bl1sz;
+	u32 blk0_x, blk0_y, bl0sz;
+	u32 nblk2w, bl2_h, off;
+
+	/* fixme - block2 height depends of the "Group of Bytes" value */
+	bl2_h = BL1_W * gobs;
+
+	bl0sz = BL0_W * BL0_W * px_width;
+	bl1sz = BL1_W * BL1_W * px_width;
+	bl2sz = BL2_W * bl2_h * px_width;
+
+	/* block level 2 coordinate */
+	blk2_x = x / BL2_W;
+	blk2_y = y / bl2_h;
+
+	x = x % BL2_W;
+	y = y % bl2_h;
+
+	/* block level 1 coordinate */
+	blk1_x = x / BL1_W;
+	blk1_y = y / BL1_W;
+
+	x = x % BL1_W;
+	y = y % BL1_W;
+
+	/* block level 0 coordinate */
+	blk0_x = x / BL0_W;
+	blk0_y = y / BL0_W;
+
+	x = x % BL0_W;
+	y = y % BL0_W;
+
+	nblk2w = DIV_ROUND_UP(sb->width, BL2_W);
+
+	off = ((blk2_y * nblk2w) + blk2_x) * bl2sz;
+	off += ((blk1_y * 2) + blk1_x) * bl1sz;
+	off += (blk0_y * 2 + blk0_x) * bl0sz;
+	off += (x + y * BL0_W) * px_width;
+
+	return off;
+}
+
+static void nv50_set_pixel(struct drm_scanout_buffer *sb, unsigned int x, unsigned int y, u32 color)
+{
+	struct drm_framebuffer *fb = sb->private;
+	unsigned int off;
+	/* According to DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D documentation,
+	 * the last 4 bits of modifier is log2(height) of each block, in GOBs
+	 */
+	unsigned int gobs = 1 << (fb->modifier & 0xf);
+
+	off = nv50_get_tiled_offset(sb, gobs, x, y, sb->format->cpp[0]);
+	iosys_map_wr(&sb->map[0], off, u32, color);
+}
+
+static int
+nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
+{
+	struct drm_framebuffer *fb;
+	struct nouveau_bo *nvbo;
+
+	if (!plane->state || !plane->state->fb)
+		return -EINVAL;
+
+	fb = plane->state->fb;
+	nvbo = nouveau_gem_object(fb->obj[0]);
+
+	/* Don't support compressed format, or multiplane yet */
+	if (nvbo->comp || fb->format->num_planes != 1)
+		return -EOPNOTSUPP;
+
+	if (nouveau_bo_map(nvbo)) {
+		pr_warn("nouveau bo map failed, panic won't be displayed\n");
+		return -ENOMEM;
+	}
+
+	if (nvbo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
+		iosys_map_set_vaddr_iomem(&sb->map[0], nvbo->kmap.virtual);
+	else
+		iosys_map_set_vaddr(&sb->map[0], nvbo->kmap.virtual);
+
+	sb->height = fb->height;
+	sb->width = fb->width;
+	sb->pitch[0] = fb->pitches[0];
+	sb->format = fb->format;
+
+	/* If tiling is enabled, use the set_pixel() to display correctly */
+	if (fb->modifier & 0xf) {
+		sb->private = (void *) fb;
+		sb->set_pixel = nv50_set_pixel;
+	}
+	return 0;
+}
+
 static const struct drm_plane_helper_funcs
 nv50_wndw_helper = {
 	.prepare_fb = nv50_wndw_prepare_fb,
@@ -584,6 +696,14 @@ nv50_wndw_helper = {
 	.atomic_check = nv50_wndw_atomic_check,
 };
 
+static const struct drm_plane_helper_funcs
+nv50_wndw_primary_helper = {
+	.prepare_fb = nv50_wndw_prepare_fb,
+	.cleanup_fb = nv50_wndw_cleanup_fb,
+	.atomic_check = nv50_wndw_atomic_check,
+	.get_scanout_buffer = nv50_wndw_get_scanout_buffer,
+};
+
 static void
 nv50_wndw_atomic_destroy_state(struct drm_plane *plane,
 			       struct drm_plane_state *state)
@@ -732,7 +852,10 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
 		return ret;
 	}
 
-	drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		drm_plane_helper_add(&wndw->plane, &nv50_wndw_primary_helper);
+	else
+		drm_plane_helper_add(&wndw->plane, &nv50_wndw_helper);
 
 	if (wndw->func->ilut) {
 		ret = nv50_lut_init(disp, mmu, &wndw->ilut);
-- 
2.45.0

