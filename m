Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199D79AB64D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 20:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806DB10E6EE;
	Tue, 22 Oct 2024 18:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Jy8ezpqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486F210E6EC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 18:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729623381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VOzq4T50fZyYLmRt/2e9SF+eLnqabVHyt6C4AdsRK3A=;
 b=Jy8ezpqybNknb15K+SqosYAi/YEuZp0qps6LEL1xSfDWCKW3VJfOBfvEZ3D0tMHcfwoi5O
 miThPbIM/ijhL4sI65SZWcAHOZdqywWEUK1ME0BUg9oxFKkTNfVagvcQFsm1lEPJ0ZJWk1
 kjdl8eJZ5ACOoVz4xg0HUUL5XwhxNSM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-Y9rtsdf8MlqLr-o7c28eNQ-1; Tue,
 22 Oct 2024 14:56:18 -0400
X-MC-Unique: Y9rtsdf8MlqLr-o7c28eNQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0A65C1956083; Tue, 22 Oct 2024 18:56:17 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.145])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0AD041956056; Tue, 22 Oct 2024 18:56:13 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v4 3/3] drm/nouveau: Add drm_panic support for nv50+
Date: Tue, 22 Oct 2024 20:39:49 +0200
Message-ID: <20241022185553.1103384-4-jfalempe@redhat.com>
In-Reply-To: <20241022185553.1103384-1-jfalempe@redhat.com>
References: <20241022185553.1103384-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Add drm_panic support for nv50+ cards.
It's enough to get the panic screen while running Gnome/Wayland with
an nv50+ nvidia GPU.
It doesn't support multi-plane or compressed format yet.
Tiling is tested on GTX1650 (Turing), GeForce GT 1030 (Pascal) and
Geforce 8800 GTS (Tesla).

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---

v4:
 * Refactor get_scanout_buffer() to use the new dispnv50/tile.h
 * use drm_warn() instead of pr_warn() in get_scanout_buffer

 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 129 +++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 7a2cceaee6e97..45c5efbab4a32 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -30,14 +30,20 @@
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
+#include "tile.h"
 
 static void
 nv50_wndw_ctxdma_del(struct nv50_wndw_ctxdma *ctxdma)
@@ -577,6 +583,114 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 	return 0;
 }
 
+/* Only used by drm_panic get_scanout_buffer() and set_pixel(), so it is
+ * protected by the drm panic spinlock
+ */
+static u32 nv50_panic_blk_h;
+
+/* Return the framebuffer offset of the start of the block where pixel(x,y) is */
+static u32
+nv50_get_block_off(unsigned int x, unsigned int y, unsigned int pitch)
+{
+	u32 blk_x, blk_y, blk_columns;
+
+	blk_columns = nouveau_get_width_in_blocks(pitch);
+	blk_x = (x * 4) / NV_TILE_GOB_WIDTH_BYTES;
+	blk_y = y / nv50_panic_blk_h;
+
+	return ((blk_y * blk_columns) + blk_x) * NV_TILE_GOB_WIDTH_BYTES * nv50_panic_blk_h;
+}
+
+/* Turing and later have 2 level of tiles inside the block */
+static void
+nv50_set_pixel_swizzle(struct drm_scanout_buffer *sb, unsigned int x,
+		       unsigned int y, u32 color)
+{
+	u32 blk_off, off, swizzle;
+
+	blk_off = nv50_get_block_off(x, y, sb->pitch[0]);
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
+	x = x % (NV_TILE_GOB_WIDTH_BYTES / 4);
+	y = y % nv50_panic_blk_h;
+	off = blk_off + x * 4 + y * NV_TILE_GOB_WIDTH_BYTES;
+
+	iosys_map_wr(&sb->map[0], off, u32, color);
+}
+
+static int
+nv50_wndw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
+{
+	struct drm_framebuffer *fb;
+	struct nouveau_bo *nvbo;
+	struct nouveau_drm *drm = nouveau_drm(plane->dev);
+	u16 chipset = drm->client.device.info.chipset;
+	u8 family = drm->client.device.info.family;
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
+		drm_warn(plane->dev, "nouveau bo map failed, panic won't be displayed\n");
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
+		nv50_panic_blk_h = nouveau_get_gob_height(family) *
+				   nouveau_get_gobs_in_block(tile_mode, chipset);
+
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
@@ -584,6 +698,14 @@ nv50_wndw_helper = {
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
@@ -732,7 +854,10 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
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
2.47.0

