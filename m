Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FE55AB73B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 19:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EED10E8A4;
	Fri,  2 Sep 2022 17:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 002F510E8A9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 17:08:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,283,1654527600"; d="scan'208";a="131488006"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 03 Sep 2022 02:08:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.67])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B01940078DC;
 Sat,  3 Sep 2022 02:08:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 05/10] drm: rcar-du: Move rcar_du_vsp_atomic_begin()
Date: Fri,  2 Sep 2022 18:08:21 +0100
Message-Id: <20220902170826.599262-6-biju.das.jz@bp.renesas.com>
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

Move rcar_du_vsp_atomic_begin() to RCar DU VSP lib.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     | 5 -----
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     | 2 --
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 5 +++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h | 2 ++
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index bed3f2a3c4a5..685e3e8f6ddb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -88,11 +88,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
-{
-	vsp1_du_atomic_begin(crtc->vsp->vsp, crtc->vsp_pipe);
-}
-
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc)
 {
 	struct vsp1_du_atomic_pipe_config cfg = { { 0, } };
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 8fbfa86c93e0..83a2f3e85860 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -61,7 +61,6 @@ to_rcar_vsp_plane_state(struct drm_plane_state *state)
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs);
 void rcar_du_vsp_enable(struct rcar_du_crtc *crtc);
-void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 		       struct sg_table sg_tables[3]);
@@ -75,7 +74,6 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 	return -ENXIO;
 }
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
-static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc) { };
 static inline int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp,
 				     struct drm_framebuffer *fb,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
index e22d4e535268..f6c0cae7c4af 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -15,3 +15,8 @@ void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
 {
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
 }
+
+void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
+{
+	vsp1_du_atomic_begin(crtc->vsp->vsp, crtc->vsp_pipe);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
index d91c043bbced..8c22042d4a80 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -12,8 +12,10 @@
 
 #ifdef CONFIG_DRM_RCAR_VSP
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
+void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 #else
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
+static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
 #endif
 
 #endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

