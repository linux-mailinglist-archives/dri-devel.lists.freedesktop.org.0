Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DC636740
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 18:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163CE10E5E1;
	Wed, 23 Nov 2022 17:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8FB7310E5CF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 17:29:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.96,187,1665414000"; d="scan'208";a="143666653"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 24 Nov 2022 02:29:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.61])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id E0F2240ADCCF;
 Thu, 24 Nov 2022 02:29:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v6 10/19] drm: rcar-du: Move rcar_du_vsp_plane_prepare_fb()
Date: Wed, 23 Nov 2022 17:28:57 +0000
Message-Id: <20221123172906.2919734-11-biju.das.jz@bp.renesas.com>
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

Move rcar_du_vsp_plane_prepare_fb() to RCar DU vsp lib so that
both RCar and RZ/G2L DU vsp drivers can share this function.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Fix checkpatch warning.
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 21 ---------------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h |  8 ++++++++
 3 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index d798d97b0dd4..b26c30902118 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -139,27 +139,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 			      plane->index, &cfg);
 }
 
-static int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
-					struct drm_plane_state *state)
-{
-	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(state);
-	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
-	int ret;
-
-	/*
-	 * There's no need to prepare (and unprepare) the framebuffer when the
-	 * plane is not visible, as it will not be displayed.
-	 */
-	if (!state->visible)
-		return 0;
-
-	ret = rcar_du_vsp_map_fb(vsp, state->fb, rstate->sg_tables);
-	if (ret < 0)
-		return ret;
-
-	return drm_gem_plane_helper_prepare_fb(plane, state);
-}
-
 static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 					 struct drm_plane_state *state)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index 7f8742005df1..1a5988cdf41a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -140,6 +140,27 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 	return ret;
 }
 
+int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
+				 struct drm_plane_state *state)
+{
+	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(state);
+	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
+	int ret;
+
+	/*
+	 * There's no need to prepare (and unprepare) the framebuffer when the
+	 * plane is not visible, as it will not be displayed.
+	 */
+	if (!state->visible)
+		return 0;
+
+	ret = rcar_du_vsp_map_fb(vsp, state->fb, rstate->sg_tables);
+	if (ret < 0)
+		return ret;
+
+	return drm_gem_plane_helper_prepare_fb(plane, state);
+}
+
 void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 			  struct sg_table sg_tables[3])
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index 2a346c0d5a76..cf2e8a4549e2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -25,6 +25,8 @@ void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 int rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 			 unsigned int crtcs,
 			 const struct drm_plane_helper_funcs *rcar_du_vsp_plane_helper_funcs);
+int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
+				 struct drm_plane_state *state);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
@@ -49,6 +51,12 @@ rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 {
 	return -ENXIO;
 }
+
+static inline int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
+					       struct drm_plane_state *state)
+{
+	return -ENXIO;
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

