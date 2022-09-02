Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6742B5AB743
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 19:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D7410E8B0;
	Fri,  2 Sep 2022 17:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8A8B10E8A9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 17:09:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,283,1654527600"; d="scan'208";a="131488033"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 03 Sep 2022 02:09:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.67])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id ADD0640078DC;
 Sat,  3 Sep 2022 02:09:08 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 10/10] drm: rcar-du: Add rcar_du_lib_vsp_init()
Date: Fri,  2 Sep 2022 18:08:26 +0100
Message-Id: <20220902170826.599262-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902170826.599262-1-biju.das.jz@bp.renesas.com>
References: <20220902170826.599262-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RZ/G2L does not have plane registers as well as it uses different
CRTC. The below functions are SoC specific
 * rcar_du_crtc_finish_page_flip()
 * __rcar_du_plane_setup
 * __rcar_du_plane_atomic_check
All other function can be handled in common code. This patch introduces
rcar_du_lib_vsp_init() to share common_init, vsp_formats and vsp_plane_funcs().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 157 +-------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 166 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h |  10 ++
 3 files changed, 178 insertions(+), 155 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index fabb616d8853..d798d97b0dd4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -13,7 +13,6 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
-#include <drm/drm_managed.h>
 #include <drm/drm_vblank.h>
 
 #include <linux/bitops.h>
@@ -85,34 +84,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-static const u32 rcar_du_vsp_formats[] = {
-	DRM_FORMAT_RGB332,
-	DRM_FORMAT_ARGB4444,
-	DRM_FORMAT_XRGB4444,
-	DRM_FORMAT_ARGB1555,
-	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_BGR888,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_BGRA8888,
-	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_UYVY,
-	DRM_FORMAT_YUYV,
-	DRM_FORMAT_YVYU,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV21,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV61,
-	DRM_FORMAT_YUV420,
-	DRM_FORMAT_YVU420,
-	DRM_FORMAT_YUV422,
-	DRM_FORMAT_YVU422,
-	DRM_FORMAT_YUV444,
-	DRM_FORMAT_YVU444,
-};
-
 static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 {
 	struct rcar_du_vsp_plane_state *state =
@@ -234,133 +205,9 @@ static const struct drm_plane_helper_funcs rcar_du_vsp_plane_helper_funcs = {
 	.atomic_update = rcar_du_vsp_plane_atomic_update,
 };
 
-static struct drm_plane_state *
-rcar_du_vsp_plane_atomic_duplicate_state(struct drm_plane *plane)
-{
-	struct rcar_du_vsp_plane_state *copy;
-
-	if (WARN_ON(!plane->state))
-		return NULL;
-
-	copy = kzalloc(sizeof(*copy), GFP_KERNEL);
-	if (copy == NULL)
-		return NULL;
-
-	__drm_atomic_helper_plane_duplicate_state(plane, &copy->state);
-
-	return &copy->state;
-}
-
-static void rcar_du_vsp_plane_atomic_destroy_state(struct drm_plane *plane,
-						   struct drm_plane_state *state)
-{
-	__drm_atomic_helper_plane_destroy_state(state);
-	kfree(to_rcar_vsp_plane_state(state));
-}
-
-static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
-{
-	struct rcar_du_vsp_plane_state *state;
-
-	if (plane->state) {
-		rcar_du_vsp_plane_atomic_destroy_state(plane, plane->state);
-		plane->state = NULL;
-	}
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (state == NULL)
-		return;
-
-	__drm_atomic_helper_plane_reset(plane, &state->state);
-}
-
-static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = rcar_du_vsp_plane_reset,
-	.destroy = drm_plane_cleanup,
-	.atomic_duplicate_state = rcar_du_vsp_plane_atomic_duplicate_state,
-	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
-};
-
-static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
-{
-	struct rcar_du_vsp *vsp = res;
-	unsigned int i;
-
-	for (i = 0; i < vsp->num_planes; ++i) {
-		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
-
-		drm_plane_cleanup(&plane->plane);
-	}
-
-	kfree(vsp->planes);
-
-	put_device(vsp->vsp);
-}
-
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs)
 {
-	struct rcar_du_device *rcdu = vsp->dev;
-	struct platform_device *pdev;
-	unsigned int num_crtcs = hweight32(crtcs);
-	unsigned int num_planes;
-	unsigned int i;
-	int ret;
-
-	/* Find the VSP device and initialize it. */
-	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		return -ENXIO;
-
-	vsp->vsp = &pdev->dev;
-
-	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_vsp_cleanup, vsp);
-	if (ret < 0)
-		return ret;
-
-	ret = vsp1_du_init(vsp->vsp);
-	if (ret < 0)
-		return ret;
-
-	num_planes = rcdu->info->num_rpf;
-
-	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
-	if (!vsp->planes)
-		return -ENOMEM;
-
-	for (i = 0; i < num_planes; ++i) {
-		enum drm_plane_type type = i < num_crtcs
-					 ? DRM_PLANE_TYPE_PRIMARY
-					 : DRM_PLANE_TYPE_OVERLAY;
-		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
-
-		plane->vsp = vsp;
-		plane->index = i;
-
-		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
-					       crtcs, &rcar_du_vsp_plane_funcs,
-					       rcar_du_vsp_formats,
-					       ARRAY_SIZE(rcar_du_vsp_formats),
-					       NULL, type, NULL);
-		if (ret < 0)
-			return ret;
-
-		drm_plane_helper_add(&plane->plane,
-				     &rcar_du_vsp_plane_helper_funcs);
-
-		drm_plane_create_alpha_property(&plane->plane);
-		drm_plane_create_zpos_property(&plane->plane, i, 0,
-					       num_planes - 1);
-
-		drm_plane_create_blend_mode_property(&plane->plane,
-					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
-					BIT(DRM_MODE_BLEND_PREMULTI) |
-					BIT(DRM_MODE_BLEND_COVERAGE));
-
-		vsp->num_planes++;
-	}
-
-	return 0;
+	return rcar_du_lib_vsp_init(vsp, np, crtcs,
+				    &rcar_du_vsp_plane_helper_funcs);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index d59dc250bbb3..7f8742005df1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -7,13 +7,19 @@
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_managed.h>
 
 #include <linux/dma-mapping.h>
+#include <linux/of_platform.h>
 #include <linux/scatterlist.h>
 
 #include <media/vsp1.h>
@@ -44,6 +50,34 @@ void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
 	vsp1_du_atomic_flush(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
+static const u32 rcar_du_vsp_formats[] = {
+	DRM_FORMAT_RGB332,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_YVYU,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YVU422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU444,
+};
+
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3])
 {
@@ -118,3 +152,135 @@ void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		sg_free_table(sgt);
 	}
 }
+
+static struct drm_plane_state *
+rcar_du_vsp_plane_atomic_duplicate_state(struct drm_plane *plane)
+{
+	struct rcar_du_vsp_plane_state *copy;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	copy = kzalloc(sizeof(*copy), GFP_KERNEL);
+	if (copy == NULL)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &copy->state);
+
+	return &copy->state;
+}
+
+static void rcar_du_vsp_plane_atomic_destroy_state(struct drm_plane *plane,
+						   struct drm_plane_state *state)
+{
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(to_rcar_vsp_plane_state(state));
+}
+
+static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
+{
+	struct rcar_du_vsp_plane_state *state;
+
+	if (plane->state) {
+		rcar_du_vsp_plane_atomic_destroy_state(plane, plane->state);
+		plane->state = NULL;
+	}
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (state == NULL)
+		return;
+
+	__drm_atomic_helper_plane_reset(plane, &state->state);
+}
+
+static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.reset = rcar_du_vsp_plane_reset,
+	.destroy = drm_plane_cleanup,
+	.atomic_duplicate_state = rcar_du_vsp_plane_atomic_duplicate_state,
+	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
+};
+
+static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
+{
+	struct rcar_du_vsp *vsp = res;
+	unsigned int i;
+
+	for (i = 0; i < vsp->num_planes; ++i) {
+		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
+
+		drm_plane_cleanup(&plane->plane);
+	}
+
+	kfree(vsp->planes);
+
+	put_device(vsp->vsp);
+}
+
+int rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
+			 unsigned int crtcs,
+			 const struct drm_plane_helper_funcs *rcar_du_vsp_plane_helper_funcs)
+{
+	struct rcar_du_device *rcdu = vsp->dev;
+	struct platform_device *pdev;
+	unsigned int num_crtcs = hweight32(crtcs);
+	unsigned int num_planes;
+	unsigned int i;
+	int ret;
+
+	/* Find the VSP device and initialize it. */
+	pdev = of_find_device_by_node(np);
+	if (!pdev)
+		return -ENXIO;
+
+	vsp->vsp = &pdev->dev;
+
+	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_vsp_cleanup, vsp);
+	if (ret < 0)
+		return ret;
+
+	ret = vsp1_du_init(vsp->vsp);
+	if (ret < 0)
+		return ret;
+
+	num_planes = rcdu->info->num_rpf;
+
+	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
+	if (!vsp->planes)
+		return -ENOMEM;
+
+	for (i = 0; i < num_planes; ++i) {
+		enum drm_plane_type type = i < num_crtcs
+					 ? DRM_PLANE_TYPE_PRIMARY
+					 : DRM_PLANE_TYPE_OVERLAY;
+		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
+
+		plane->vsp = vsp;
+		plane->index = i;
+
+		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
+					       crtcs, &rcar_du_vsp_plane_funcs,
+					       rcar_du_vsp_formats,
+					       ARRAY_SIZE(rcar_du_vsp_formats),
+					       NULL, type, NULL);
+		if (ret < 0)
+			return ret;
+
+		drm_plane_helper_add(&plane->plane,
+				     rcar_du_vsp_plane_helper_funcs);
+
+		drm_plane_create_alpha_property(&plane->plane);
+		drm_plane_create_zpos_property(&plane->plane, i, 0,
+					       num_planes - 1);
+
+		drm_plane_create_blend_mode_property(&plane->plane,
+					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+					BIT(DRM_MODE_BLEND_PREMULTI) |
+					BIT(DRM_MODE_BLEND_COVERAGE));
+
+		vsp->num_planes++;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index 3ed0681e195a..55b971cacc87 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -22,6 +22,9 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3]);
 void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 			  struct sg_table sg_tables[3]);
+int rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
+			 unsigned int crtcs,
+			 const struct drm_plane_helper_funcs *rcar_du_vsp_plane_helper_funcs);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
@@ -37,6 +40,13 @@ static inline void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp,
 					struct sg_table sg_tables[3])
 {
 }
+static inline int
+rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
+		     unsigned int crtcs,
+		     const struct drm_plane_helper_funcs *rcar_du_vsp_plane_helper_funcs)
+{
+	return -ENXIO;
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

