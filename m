Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B53E4DB097
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 14:11:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC6EB10E55A;
	Wed, 16 Mar 2022 13:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A838E10E553
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 13:11:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,186,1643641200"; d="scan'208";a="114619624"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 16 Mar 2022 22:11:23 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1B107429C365;
 Wed, 16 Mar 2022 22:11:20 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 6/7] drm: rcar-du: Factorise rcar_du_vsp{complete, enable,
 plane_atomic_check}
Date: Wed, 16 Mar 2022 13:10:59 +0000
Message-Id: <20220316131100.30685-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
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

RZ/G2L SoC's does not have group/plane registers compared to RCar, hence
it needs a different CRTC implementation. Factorise rcar_du_vsp{complete,
enable,plane_atomic_check} so that it can support RZ/G2L SoC without any
code changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
RFC->v1:
 * New patch
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c |  3 +++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  9 +++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 12 ++++++++----
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 0df1430b9664..b944885d7f65 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -38,6 +38,9 @@ static struct rcar_du_crtc_helper_funcs rcar_crtc_helper_funcs = {
 	.du_planes_init = rcar_du_planes_init,
 	.du_crtc_create = rcar_du_crtc_create,
 	.du_atomic_check_planes = rcar_du_atomic_check_planes,
+	.__du_plane_setup = __rcar_du_plane_setup,
+	.__du_plane_atomic_check = __rcar_du_plane_atomic_check,
+	.du_crtc_finish_page_flip = rcar_du_crtc_finish_page_flip,
 };
 
 static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 164cd9854aaf..bb2146621eb4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -66,6 +66,9 @@ struct rcar_du_output_routing {
  * @du_planes_init: pointer to du_plane_init function
  * @du_crtc_create: pointer to du_crtc_create function
  * @du_atomic_check_planes: pointer to du_atomic_check_planes function
+ * @__du_plane_setup: pointer to __du_plane_setup function
+ * @__du_plane_atomic_check: pointer to __du_plane_atomic_check function
+ * @du_crtc_finish_page_flip: pointer to du_crtc_finish_page_flip function
  */
 struct rcar_du_crtc_helper_funcs {
 	int (*du_planes_init)(struct rcar_du_group *rgrp);
@@ -73,6 +76,12 @@ struct rcar_du_crtc_helper_funcs {
 			      unsigned int hwindex);
 	int (*du_atomic_check_planes)(struct drm_device *dev,
 				      struct drm_atomic_state *state);
+	void (*__du_plane_setup)(struct rcar_du_group *rgrp,
+				 const struct rcar_du_plane_state *state);
+	int (*__du_plane_atomic_check)(struct drm_plane *plane,
+				       struct drm_plane_state *state,
+				const struct rcar_du_format_info **format);
+	void (*du_crtc_finish_page_flip)(struct rcar_du_crtc *rcrtc);
 };
 
 /*
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index cf045a203aa5..41928a94c903 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -35,12 +35,13 @@
 static void rcar_du_vsp_complete(void *private, unsigned int status, u32 crc)
 {
 	struct rcar_du_crtc *crtc = private;
+	struct rcar_du_device *rcdu = crtc->dev;
 
 	if (crtc->vblank_enable)
 		drm_crtc_handle_vblank(&crtc->crtc);
 
 	if (status & VSP1_DU_STATUS_COMPLETE)
-		rcar_du_crtc_finish_page_flip(crtc);
+		rcdu->info->fns->du_crtc_finish_page_flip(crtc);
 	if (status & VSP1_DU_STATUS_WRITEBACK)
 		rcar_du_writeback_complete(crtc);
 
@@ -82,7 +83,7 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	else
 		state.hwindex = crtc->index % 2;
 
-	__rcar_du_plane_setup(crtc->group, &state);
+	rcdu->info->fns->__du_plane_setup(crtc->group, &state);
 
 	/*
 	 * Ensure that the plane source configuration takes effect by requesting
@@ -294,12 +295,15 @@ static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
 					  struct drm_atomic_state *state)
 {
+	struct rcar_du_vsp *vsp = to_rcar_vsp_plane(plane)->vsp;
+	struct rcar_du_device *rcdu = vsp->dev;
+
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(new_plane_state);
 
-	return __rcar_du_plane_atomic_check(plane, new_plane_state,
-					    &rstate->format);
+	return rcdu->info->fns->__du_plane_atomic_check(plane, new_plane_state,
+							&rstate->format);
 }
 
 static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
-- 
2.17.1

