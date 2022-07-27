Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A46582A58
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 18:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0118E683;
	Wed, 27 Jul 2022 16:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 37DA710E13D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 16:08:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,195,1654527600"; d="scan'208";a="129334718"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 28 Jul 2022 01:08:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.195])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8685C40183E9;
 Thu, 28 Jul 2022 01:08:05 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 02/10] drm: rcar-du: Move rcar_du_vsp_plane_cleanup_fb()
Date: Wed, 27 Jul 2022 17:07:45 +0100
Message-Id: <20220727160753.1774761-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com>
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

Move rcar_du_vsp_plane_cleanup_fb() to RCar DU vsp lib so that
it can be shared by both RCar and RZ/G2L DU vsp drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 12 ------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 12 ++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h |  6 ++++++
 3 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 72128915a2ff..c9090e581b12 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -124,18 +124,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
 			      plane->index, &cfg);
 }
 
-static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
-					 struct drm_plane_state *state)
-{
-	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(state);
-	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
-
-	if (!state->visible)
-		return;
-
-	rcar_du_vsp_unmap_fb(vsp, state->fb, rstate->sg_tables);
-}
-
 static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index 40d44bf521c0..9062837e68da 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -181,6 +181,18 @@ void rcar_du_vsp_unmap_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 	}
 }
 
+void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
+				  struct drm_plane_state *state)
+{
+	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(state);
+	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
+
+	if (!state->visible)
+		return;
+
+	rcar_du_vsp_unmap_fb(vsp, state->fb, rstate->sg_tables);
+}
+
 static struct drm_plane_state *
 rcar_du_vsp_plane_atomic_duplicate_state(struct drm_plane *plane)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index d79cdf7d7316..094ada022fe5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -68,6 +68,8 @@ int rcar_du_lib_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 			 const struct drm_plane_helper_funcs *rcar_du_vsp_plane_helper_funcs);
 int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *state);
+void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
+				  struct drm_plane_state *state);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
@@ -95,6 +97,10 @@ static inline int rcar_du_vsp_plane_prepare_fb(struct drm_plane *plane,
 {
 	return -ENXIO;
 }
+static inline void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
+						struct drm_plane_state *state)
+{
+}
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

