Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7145817B9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 18:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B74593093;
	Tue, 26 Jul 2022 16:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A97DC92A49
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:42:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,194,1654527600"; d="scan'208";a="129198125"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 27 Jul 2022 01:42:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.4])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0D3FD40083D5;
 Wed, 27 Jul 2022 01:42:38 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 07/10] drm: rcar-du: Move vsp rcar_du_vsp_{map,unmap}_fb()
Date: Tue, 26 Jul 2022 17:42:05 +0100
Message-Id: <20220726164208.1048444-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726164208.1048444-1-biju.das.jz@bp.renesas.com>
References: <20220726164208.1048444-1-biju.das.jz@bp.renesas.com>
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

Move vsp rcar_du_vsp_{map,unmap}_fb() to RCar DU VSP lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 75 -----------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     | 15 -----
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 75 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h | 15 +++++
 4 files changed, 90 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index becc587c5169..18e16097cf53 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -153,68 +153,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 			      plane->index, &cfg);
 }
 
-int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
-		       struct sg_table sg_tables[3])
-{
-	struct rcar_du_device *rcdu = vsp->dev;
-	unsigned int i, j;
-	int ret;
-
-	for (i = 0; i < fb->format->num_planes; ++i) {
-		struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(fb, i);
-		struct sg_table *sgt = &sg_tables[i];
-
-		if (gem->sgt) {
-			struct scatterlist *src;
-			struct scatterlist *dst;
-
-			/*
-			 * If the GEM buffer has a scatter gather table, it has
-			 * been imported from a dma-buf and has no physical
-			 * address as it might not be physically contiguous.
-			 * Copy the original scatter gather table to map it to
-			 * the VSP.
-			 */
-			ret = sg_alloc_table(sgt, gem->sgt->orig_nents,
-					     GFP_KERNEL);
-			if (ret)
-				goto fail;
-
-			src = gem->sgt->sgl;
-			dst = sgt->sgl;
-			for (j = 0; j < gem->sgt->orig_nents; ++j) {
-				sg_set_page(dst, sg_page(src), src->length,
-					    src->offset);
-				src = sg_next(src);
-				dst = sg_next(dst);
-			}
-		} else {
-			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
-					      gem->paddr, gem->base.size);
-			if (ret)
-				goto fail;
-		}
-
-		ret = vsp1_du_map_sg(vsp->vsp, sgt);
-		if (ret) {
-			sg_free_table(sgt);
-			goto fail;
-		}
-	}
-
-	return 0;
-
-fail:
-	while (i--) {
-		struct sg_table *sgt = &sg_tables[i];
-
-		vsp1_du_unmap_sg(vsp->vsp, sgt);
-		sg_free_table(sgt);
-	}
-
-	return ret;
-}
-
 static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 					struct drm_plane_state *state)
 {
@@ -236,19 +174,6 @@ static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 	return drm_gem_plane_helper_prepare_fb(plane, state);
 }
 
-void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
-			  struct sg_table sg_tables[3])
-{
-	unsigned int i;
-
-	for (i = 0; i < fb->format->num_planes; ++i) {
-		struct sg_table *sgt = &sg_tables[i];
-
-		vsp1_du_unmap_sg(vsp->vsp, sgt);
-		sg_free_table(sgt);
-	}
-}
-
 static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 					 struct drm_plane_state *state)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 5bc539562255..a6ddeb6d57ea 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -16,10 +16,6 @@
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs);
 void rcar_du_vsp_enable(struct rcar_du_crtc *crtc);
-int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
-		       struct sg_table sg_tables[3]);
-void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
-			  struct sg_table sg_tables[3]);
 #else
 static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 				   struct device_node *np,
@@ -28,17 +24,6 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 	return -ENXIO;
 }
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
-static inline int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp,
-				     struct drm_framebuffer *fb,
-				     struct sg_table sg_tables[3])
-{
-	return -ENXIO;
-}
-static inline void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp,
-					struct drm_framebuffer *fb,
-					struct sg_table sg_tables[3])
-{
-}
 #endif
 
 #endif /* __RCAR_DU_VSP_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index dc51368044c1..337b3913fe73 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -56,3 +56,78 @@ void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
 
 	vsp1_du_atomic_flush(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
+
+int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
+		       struct sg_table sg_tables[3])
+{
+	struct rcar_du_device *rcdu = vsp->dev;
+	unsigned int i, j;
+	int ret;
+
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(fb, i);
+		struct sg_table *sgt = &sg_tables[i];
+
+		if (gem->sgt) {
+			struct scatterlist *src;
+			struct scatterlist *dst;
+
+			/*
+			 * If the GEM buffer has a scatter gather table, it has
+			 * been imported from a dma-buf and has no physical
+			 * address as it might not be physically contiguous.
+			 * Copy the original scatter gather table to map it to
+			 * the VSP.
+			 */
+			ret = sg_alloc_table(sgt, gem->sgt->orig_nents,
+					     GFP_KERNEL);
+			if (ret)
+				goto fail;
+
+			src = gem->sgt->sgl;
+			dst = sgt->sgl;
+			for (j = 0; j < gem->sgt->orig_nents; ++j) {
+				sg_set_page(dst, sg_page(src), src->length,
+					    src->offset);
+				src = sg_next(src);
+				dst = sg_next(dst);
+			}
+		} else {
+			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
+					      gem->paddr, gem->base.size);
+			if (ret)
+				goto fail;
+		}
+
+		ret = vsp1_du_map_sg(vsp->vsp, sgt);
+		if (ret) {
+			sg_free_table(sgt);
+			goto fail;
+		}
+	}
+
+	return 0;
+
+fail:
+	while (i--) {
+		struct sg_table *sgt = &sg_tables[i];
+
+		vsp1_du_unmap_sg(vsp->vsp, sgt);
+		sg_free_table(sgt);
+	}
+
+	return ret;
+}
+
+void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
+			  struct sg_table sg_tables[3])
+{
+	unsigned int i;
+
+	for (i = 0; i < fb->format->num_planes; ++i) {
+		struct sg_table *sgt = &sg_tables[i];
+
+		vsp1_du_unmap_sg(vsp->vsp, sgt);
+		sg_free_table(sgt);
+	}
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index a2045c51c496..c045f8c38e4e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -59,10 +59,25 @@ to_rcar_vsp_plane_state(struct drm_plane_state *state)
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
+int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
+		       struct sg_table sg_tables[3]);
+void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
+			  struct sg_table sg_tables[3]);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc) { };
+static inline int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp,
+				     struct drm_framebuffer *fb,
+				     struct sg_table sg_tables[3])
+{
+	return -ENXIO;
+}
+static inline void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp,
+					struct drm_framebuffer *fb,
+					struct sg_table sg_tables[3])
+{
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

