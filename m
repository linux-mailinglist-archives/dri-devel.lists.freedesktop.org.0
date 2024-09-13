Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98302977928
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A3710EC9B;
	Fri, 13 Sep 2024 07:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CsJ8FaQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FFD10EC9F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726211465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ANNgLqlDsK2GEZg0OWThjkQlD6f7PCxsPZ0zCB2M9/Q=;
 b=CsJ8FaQ1qE9x6nLipUZXl3kzjEMzKTLROnFmNN8DL2DvDdzX7Q9V+4DjsjfwTH74D8vq8p
 tJ5JP6FEAsoGXHmJWX1afdApodFwUo54tOZVNISdhK+7RN8B7vov0orEBV+pa5+WHK+/Ab
 QeaKjk7MU89V1W0UFk/gcJn/X5Xxwjs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-460-5bPV_2iVPfuiDD7BAFpvMA-1; Fri,
 13 Sep 2024 03:11:02 -0400
X-MC-Unique: 5bPV_2iVPfuiDD7BAFpvMA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D3F4C1956048; Fri, 13 Sep 2024 07:11:00 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.27])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D4C4719560AA; Fri, 13 Sep 2024 07:10:56 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>, James Jones <jajones@nvidia.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v3 2/2] drm/nouveau: Add drm_panic support for nv50+
Date: Fri, 13 Sep 2024 09:03:11 +0200
Message-ID: <20240913071036.574782-3-jfalempe@redhat.com>
In-Reply-To: <20240913071036.574782-1-jfalempe@redhat.com>
References: <20240913071036.574782-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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
   
v3:
 * Fix support for Tesla GPU, which have simpler tiling.
 * Use nouveau_framebuffer_get_layout() to get the tiling parameters.
 * Have 2 set_pixel() functions, depending on GPU family.

 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 139 +++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 7a2cceaee6e9..419c5f359711 100644
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
@@ -577,6 +582,125 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	return 0;
 }
 
+#define NV_TILE_BLK_BASE_HEIGHT_TESLA 4 /* In pixel */
+#define NV_TILE_BLK_BASE_HEIGHT 8	/* In pixel */
+#define NV_TILE_GOB_SIZE 64	/* In bytes */
+#define NV_TILE_BLK_WIDTH (NV_TILE_GOB_SIZE / 4) /* For 32 bits pixel */
+
+/* Only used by drm_panic get_scanout_buffer() and set_pixel(), so it is
+ * protected by the drm panic spinlock
+ */
+static u32 nv50_panic_blk_h;
+
+/* Return the framebuffer offset of the start of the block where pixel(x,y) is */
+static u32
+nv50_get_block_off(unsigned int x, unsigned int y, unsigned int width)
+{
+	u32 blk_x, blk_y, blk_columns;
+
+	blk_columns = DIV_ROUND_UP(width, NV_TILE_BLK_WIDTH);
+	blk_x = x / NV_TILE_BLK_WIDTH;
+	blk_y = y / nv50_panic_blk_h;
+
+	return ((blk_y * blk_columns) + blk_x) * NV_TILE_GOB_SIZE * nv50_panic_blk_h;
+}
+
+/* Turing and later have 2 level of tiles inside the block */
+static void
+nv50_set_pixel_swizzle(struct drm_scanout_buffer *sb, unsigned int x,
+		       unsigned int y, u32 color)
+{
+	u32 blk_off, off, swizzle;
+
+	blk_off = nv50_get_block_off(x, y, sb->width);
+
+	y = y % nv50_panic_blk_h;
+
+	/* Inside the block, use the fast address swizzle to compute the offset
+	 * For nvidia blocklinear, bit order is yn..y3 x3 y2 x2 y1 y0 x1 x0
+	 */
+	swizzle = (x & 3) | (y & 3) << 2 | (x & 4) << 2 | (y & 4) << 3;
+	swizzle |= (x & 8) << 3 | (y >> 3) << 7;
+	off = blk_off + swizzle * 4;
+
+	iosys_map_wr(&sb->map[0], off, u32, color);
+}
+
+static void
+nv50_set_pixel(struct drm_scanout_buffer *sb, unsigned int x, unsigned int y,
+	       u32 color)
+{
+	u32 blk_off, off;
+
+	blk_off = nv50_get_block_off(x, y, sb->width);
+
+	x = x % NV_TILE_BLK_WIDTH;
+	y = y % nv50_panic_blk_h;
+	off = blk_off + (x + y * NV_TILE_BLK_WIDTH) * 4;
+
+	iosys_map_wr(&sb->map[0], off, u32, color);
+}
+
+static u32
+nv50_get_block_height(u32 tile_mode, u16 chipset)
+{
+	if (chipset < 0xc0)
+		return NV_TILE_BLK_BASE_HEIGHT_TESLA * (1 << tile_mode);
+	else
+		return NV_TILE_BLK_BASE_HEIGHT * (1 << (tile_mode >> 4));
+}
+
+static int
+nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
+{
+	struct drm_framebuffer *fb;
+	struct nouveau_bo *nvbo;
+	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	u16 chipset = drm->client.device.info.chipset;
+	u32 tile_mode;
+	u8 kind;
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
+		iosys_map_set_vaddr_iomem(&sb->map[0], (void __iomem *) nvbo->kmap.virtual);
+	else
+		iosys_map_set_vaddr(&sb->map[0], nvbo->kmap.virtual);
+
+	sb->height = fb->height;
+	sb->width = fb->width;
+	sb->pitch[0] = fb->pitches[0];
+	sb->format = fb->format;
+
+	nouveau_framebuffer_get_layout(fb, &tile_mode, &kind);
+	if (kind) {
+		/* If tiling is enabled, use set_pixel() to display correctly.
+		 * Only handle 32bits format for now.
+		 */
+		if (fb->format->cpp[0] != 4)
+			return -EOPNOTSUPP;
+		nv50_panic_blk_h = nv50_get_block_height(tile_mode, chipset);
+		if (chipset >= 0x160)
+			sb->set_pixel = nv50_set_pixel_swizzle;
+		else
+			sb->set_pixel = nv50_set_pixel;
+	}
+	return 0;
+}
+
 static const struct drm_plane_helper_funcs
 nv50_wndw_helper = {
 	.prepare_fb = nv50_wndw_prepare_fb,
@@ -584,6 +708,14 @@ nv50_wndw_helper = {
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
@@ -732,7 +864,10 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
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

