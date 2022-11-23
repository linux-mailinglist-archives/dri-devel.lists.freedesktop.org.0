Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7462463672B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 18:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98BF10E5D8;
	Wed, 23 Nov 2022 17:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5699210E5DA
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 17:29:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; d="scan'208";a="143666657"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0201140ADCC6;
 Thu, 24 Nov 2022 02:29:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 12/19] drm: rcar-du: Move rcar_du_vsp_plane_atomic_update()
Date: Wed, 23 Nov 2022 17:28:59 +0000
Message-Id: <20221123172906.2919734-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
References: <20221123172906.2919734-1-biju.das.jz@bp.renesas.com>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move rcar_du_vsp_plane_atomic_update() to RCar DU vsp lib so that
both RCar and RZ/G2L DU vsp drivers can share this function.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Updated rcar_du_vsp_plane_setup()
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 70 ----------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 71 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h |  7 +++
 3 files changed, 78 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 77a15450fca9..8d6ab048f5a5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -84,61 +84,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
-{
-	struct rcar_du_vsp_plane_state *state =
-		to_rcar_vsp_plane_state(plane->plane.state);
-	struct rcar_du_crtc *crtc = to_rcar_crtc(state->state.crtc);
-	struct drm_framebuffer *fb = plane->plane.state->fb;
-	const struct rcar_du_format_info *format;
-	struct vsp1_du_atomic_config cfg = {
-		.pixelformat = 0,
-		.pitch = fb->pitches[0],
-		.alpha = state->state.alpha >> 8,
-		.zpos = state->state.zpos,
-	};
-	u32 fourcc = state->format->fourcc;
-	unsigned int i;
-
-	cfg.src.left = state->state.src.x1 >> 16;
-	cfg.src.top = state->state.src.y1 >> 16;
-	cfg.src.width = drm_rect_width(&state->state.src) >> 16;
-	cfg.src.height = drm_rect_height(&state->state.src) >> 16;
-
-	cfg.dst.left = state->state.dst.x1;
-	cfg.dst.top = state->state.dst.y1;
-	cfg.dst.width = drm_rect_width(&state->state.dst);
-	cfg.dst.height = drm_rect_height(&state->state.dst);
-
-	for (i = 0; i < state->format->planes; ++i)
-		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
-			   + fb->offsets[i];
-
-	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
-		switch (fourcc) {
-		case DRM_FORMAT_ARGB1555:
-			fourcc = DRM_FORMAT_XRGB1555;
-			break;
-
-		case DRM_FORMAT_ARGB4444:
-			fourcc = DRM_FORMAT_XRGB4444;
-			break;
-
-		case DRM_FORMAT_ARGB8888:
-			fourcc = DRM_FORMAT_XRGB8888;
-			break;
-		}
-	}
-
-	format = rcar_du_format_info(fourcc);
-	cfg.pixelformat = format->v4l2;
-
-	cfg.premult = state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI;
-
-	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
-			      plane->index, &cfg);
-}
-
 static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
@@ -150,21 +95,6 @@ static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 					    &rstate->format);
 }
 
-static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
-					struct drm_atomic_state *state)
-{
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
-	struct rcar_du_vsp_plane *rplane = to_rcar_vsp_plane(plane);
-	struct rcar_du_crtc *crtc = to_rcar_crtc(old_state->crtc);
-
-	if (new_state->visible)
-		rcar_du_vsp_plane_setup(rplane);
-	else if (old_state->crtc)
-		vsp1_du_atomic_update(rplane->vsp->vsp, crtc->vsp_pipe,
-				      rplane->index, NULL);
-}
-
 static const struct drm_plane_helper_funcs rcar_du_vsp_plane_helper_funcs = {
 	.prepare_fb = rcar_du_vsp_plane_prepare_fb,
 	.cleanup_fb = rcar_du_vsp_plane_cleanup_fb,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index 56ed232326f7..2573d293da18 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -25,6 +25,7 @@
 #include <media/vsp1.h>
 
 #include "rcar_du_drv.h"
+#include "rcar_du_kms.h"
 #include "rcar_du_writeback.h"
 
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
@@ -78,6 +79,61 @@ static const u32 rcar_du_vsp_formats[] = {
 	DRM_FORMAT_YVU444,
 };
 
+static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
+{
+	struct rcar_du_vsp_plane_state *state =
+		to_rcar_vsp_plane_state(plane->plane.state);
+	struct rcar_du_crtc *crtc = to_rcar_crtc(state->state.crtc);
+	struct drm_framebuffer *fb = plane->plane.state->fb;
+	const struct rcar_du_format_info *format;
+	struct vsp1_du_atomic_config cfg = {
+		.pixelformat = 0,
+		.pitch = fb->pitches[0],
+		.alpha = state->state.alpha >> 8,
+		.zpos = state->state.zpos,
+	};
+	u32 fourcc = state->format->fourcc;
+	unsigned int i;
+
+	cfg.src.left = state->state.src.x1 >> 16;
+	cfg.src.top = state->state.src.y1 >> 16;
+	cfg.src.width = drm_rect_width(&state->state.src) >> 16;
+	cfg.src.height = drm_rect_height(&state->state.src) >> 16;
+
+	cfg.dst.left = state->state.dst.x1;
+	cfg.dst.top = state->state.dst.y1;
+	cfg.dst.width = drm_rect_width(&state->state.dst);
+	cfg.dst.height = drm_rect_height(&state->state.dst);
+
+	for (i = 0; i < state->format->planes; ++i)
+		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
+			   + fb->offsets[i];
+
+	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
+		switch (fourcc) {
+		case DRM_FORMAT_ARGB1555:
+			fourcc = DRM_FORMAT_XRGB1555;
+			break;
+
+		case DRM_FORMAT_ARGB4444:
+			fourcc = DRM_FORMAT_XRGB4444;
+			break;
+
+		case DRM_FORMAT_ARGB8888:
+			fourcc = DRM_FORMAT_XRGB8888;
+			break;
+		}
+	}
+
+	format = rcar_du_format_info(fourcc);
+	cfg.pixelformat = format->v4l2;
+
+	cfg.premult = state->state.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI;
+
+	vsp1_du_atomic_update(plane->vsp->vsp, crtc->vsp_pipe,
+			      plane->index, &cfg);
+}
+
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3])
 {
@@ -186,6 +242,21 @@ void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 	rcar_du_vsp_unmap_fb(vsp, state->fb, rstate->sg_tables);
 }
 
+void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
+				     struct drm_atomic_state *state)
+{
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct rcar_du_vsp_plane *rplane = to_rcar_vsp_plane(plane);
+	struct rcar_du_crtc *crtc = to_rcar_crtc(old_state->crtc);
+
+	if (new_state->visible)
+		rcar_du_vsp_plane_setup(rplane);
+	else if (old_state->crtc)
+		vsp1_du_atomic_update(rplane->vsp->vsp, crtc->vsp_pipe,
+				      rplane->index, NULL);
+}
+
 static struct drm_plane_state *
 rcar_du_vsp_plane_atomic_duplicate_state(struct drm_plane *plane)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index c14cd2f545d9..0e1bf59d5133 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -29,6 +29,8 @@ int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *state);
 void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 				  struct drm_plane_state *state);
+void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
+				     struct drm_atomic_state *state);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
@@ -64,6 +66,11 @@ static inline void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 						struct drm_plane_state *state)
 {
 }
+
+static inline void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
+						   struct drm_atomic_state *state)
+{
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

