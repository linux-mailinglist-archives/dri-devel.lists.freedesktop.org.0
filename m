Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F39F96F0E9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 12:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5395C10E9F5;
	Fri,  6 Sep 2024 10:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KanNGT5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3A210E9F7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725617104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rWNkiKJCZJsAwjWPECDxBpya+AjBIYUhQEV02VFerZM=;
 b=KanNGT5Ad97/ok4Zv60kQFXUzrq93RG6w+NMwzGLX/HKRKM3kvwSf7r8YnMnh2dZQ8H9j7
 QlErNl/nAGelRo5nzduFFDASPEMUlMHJXZebwK9U2Y06VLuTDv2RTFPlWYAZHxrj+mmO4c
 qYUNcOvU73kna/tYGQQPiHa80u5hsfk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-OVVcQLR2PTq8YpVUiWj6Ug-1; Fri,
 06 Sep 2024 06:05:02 -0400
X-MC-Unique: OVVcQLR2PTq8YpVUiWj6Ug-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6E8C91953968; Fri,  6 Sep 2024 10:05:00 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.228])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0BA26195608A; Fri,  6 Sep 2024 10:04:56 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 3/3] drm/nouveau: Add drm_panic support for nv50+
Date: Fri,  6 Sep 2024 12:03:02 +0200
Message-ID: <20240906100434.1171093-4-jfalempe@redhat.com>
In-Reply-To: <20240906100434.1171093-1-jfalempe@redhat.com>
References: <20240906100434.1171093-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
v2:
 * Rebase and drop already merged patches.
 * Rework the tiling algorithm, using "swizzle" to compute the offset
   inside the block.

 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 107 +++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 7a2cceaee6e9..50ecf6f12b81 100644
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
@@ -577,6 +582,93 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	return 0;
 }
 
+#define NV_TILE_BLK_BASE_HEIGHT 8	/* In pixel */
+#define NV_TILE_GOB_SIZE 64	/* In bytes */
+#define NV_TILE_BLK_WIDTH (NV_TILE_GOB_SIZE / 4) /* For 32 bits pixel */
+
+/* get the offset in bytes inside the framebuffer, after taking tiling into account */
+static unsigned int nv50_get_tiled_offset(struct drm_scanout_buffer *sb, unsigned int blk_h,
+					  unsigned int x, unsigned int y)
+{
+	u32 blk_x, blk_y, blk_sz, blk_off, pitch;
+	u32 swizzle;
+
+	blk_sz = NV_TILE_GOB_SIZE * blk_h;
+	pitch = DIV_ROUND_UP(sb->width, NV_TILE_BLK_WIDTH);
+
+	/* block coordinate */
+	blk_x = x / NV_TILE_BLK_WIDTH;
+	blk_y = y / blk_h;
+
+	blk_off = ((blk_y * pitch) + blk_x) * blk_sz;
+
+	y = y % blk_h;
+
+	/* Inside the block, use the fast address swizzle to compute the offset
+	 * For nvidia blocklinear, bit order is yn..y3 x3 y2 x2 y1 y0 x1 x0
+	 */
+	swizzle = (x & 3) | (y & 3) << 2 | (x & 4) << 2 | (y & 4) << 3;
+	swizzle |= (x & 8) << 3 | (y >> 3) << 7;
+
+	return blk_off + swizzle * 4;
+}
+
+static void nv50_set_pixel(struct drm_scanout_buffer *sb, unsigned int x, unsigned int y, u32 color)
+{
+	struct drm_framebuffer *fb = sb->private;
+	unsigned int off;
+	/* According to DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D documentation,
+	 * the last 4 bits of the modifier is log2(blk_height / NV_TILE_BLK_BASE_HEIGHT)
+	 */
+	unsigned int blk_h = NV_TILE_BLK_BASE_HEIGHT * (1 << (fb->modifier & 0xf));
+
+	off = nv50_get_tiled_offset(sb, blk_h, x, y);
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
+	/* Don't support compressed format, or multiplane yet. */
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
+	/* If tiling is enabled, use the set_pixel() to display correctly.
+	 * Only handle 32bits format for now.
+	 */
+	if (fb->modifier & 0xf) {
+		if (fb->format->cpp[0] != 4)
+			return -EOPNOTSUPP;
+		sb->private = (void *) fb;
+		sb->set_pixel = nv50_set_pixel;
+	}
+	return 0;
+}
+
 static const struct drm_plane_helper_funcs
 nv50_wndw_helper = {
 	.prepare_fb = nv50_wndw_prepare_fb,
@@ -584,6 +676,14 @@ nv50_wndw_helper = {
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
@@ -732,7 +832,10 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
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
2.46.0

