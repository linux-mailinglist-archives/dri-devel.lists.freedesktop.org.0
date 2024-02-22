Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4346A85F51C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 10:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFA810E446;
	Thu, 22 Feb 2024 09:56:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1EB910E7AF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:56:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.06,177,1705330800"; d="scan'208";a="198839012"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 22 Feb 2024 18:56:37 +0900
Received: from localhost.localdomain (unknown [10.226.93.13])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4B7AD41F0CE0;
 Thu, 22 Feb 2024 18:56:33 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: renesas: rz-du: Fix redefinition errors related to
 rzg2l_du_vsp_*()
Date: Thu, 22 Feb 2024 09:56:30 +0000
Message-Id: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the redefinition errors for the below functions on x86 by replacing
CONFIG_DRM_RCAR_VSP->IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1) and adding
EXPORT_SYMBOL_GPL for all:
 1) rzg2l_du_vsp_init()
 2) rzg2l_du_vsp_enable()
 3) rzg2l_du_vsp_disable()
 4) rzg2l_du_vsp_atomic_flush()
 5) rzg2l_du_vsp_get_drm_plane()

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20240222124610.383e1ce3@canb.auug.org.au/T/#u
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 5 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
index 0ae6331d6430..d0e597fb1459 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
@@ -57,11 +57,13 @@ void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
 
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
+EXPORT_SYMBOL_GPL(rzg2l_du_vsp_enable);
 
 void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
 {
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
 }
+EXPORT_SYMBOL_GPL(rzg2l_du_vsp_disable);
 
 void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
 {
@@ -72,6 +74,7 @@ void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
 
 	vsp1_du_atomic_flush(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
+EXPORT_SYMBOL_GPL(rzg2l_du_vsp_atomic_flush);
 
 struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
 					     unsigned int pipe_index)
@@ -88,6 +91,7 @@ struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
 
 	return plane ? plane : ERR_PTR(-EINVAL);
 }
+EXPORT_SYMBOL_GPL(rzg2l_du_vsp_get_drm_plane);
 
 static const u32 rzg2l_du_vsp_formats[] = {
 	DRM_FORMAT_RGB332,
@@ -347,3 +351,4 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(rzg2l_du_vsp_init);
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
index 12d98f04bf89..322eb80dcbaf 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
@@ -54,7 +54,7 @@ to_rzg2l_vsp_plane_state(struct drm_plane_state *state)
 	return container_of(state, struct rzg2l_du_vsp_plane_state, state);
 }
 
-#ifdef CONFIG_DRM_RCAR_VSP
+#if IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1)
 int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 		      unsigned int crtcs);
 void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc);
-- 
2.25.1

