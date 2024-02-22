Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8485F6B7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 12:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF2D10E0F6;
	Thu, 22 Feb 2024 11:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AC4D10E0F6
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 11:26:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.06,177,1705330800"; d="scan'208";a="198851322"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 22 Feb 2024 20:26:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.13])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id B2AE94212B12;
 Thu, 22 Feb 2024 20:26:45 +0900 (JST)
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
Subject: [PATCH v2] drm: renesas: rz-du: Fix redefinition errors related to
 rzg2l_du_vsp_*()
Date: Thu, 22 Feb 2024 11:26:43 +0000
Message-Id: <20240222112643.110326-1-biju.das.jz@bp.renesas.com>
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

CONFIG_DRM_RCAR_VSP is related to R-Car and not related to RZ/G2L
specific. This caused the below build issue. Fix this errors by replacing
CONFIG_DRM_RCAR_VSP->CONFIG_VIDEO_RENESAS_VSP1. While at it, use
IS_ENABLED() macro.

drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:47:6: error: redefinition of 'rzg2l_du_vsp_enable'
   47 | void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
      |      ^~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h:18,
                 from drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:30:
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:72:20: note: previous definition of 'rzg2l_du_vsp_enable' with type 'void(struct rzg2l_du_crtc *)'
   72 | static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc) { };
      |                    ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:61:6: error: redefinition of 'rzg2l_du_vsp_disable'
   61 | void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
      |      ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:73:20: note: previous definition of 'rzg2l_du_vsp_disable' with type 'void(struct rzg2l_du_crtc *)'
   73 | static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc) { };
      |                    ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:66:6: error: redefinition of 'rzg2l_du_vsp_atomic_flush'
   66 | void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:74:20: note: previous definition of 'rzg2l_du_vsp_atomic_flush' with type 'void(struct rzg2l_du_crtc *)'
   74 | static inline void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc) { };
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:76:19: error: redefinition of 'rzg2l_du_vsp_get_drm_plane'
   76 | struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:75:33: note: previous definition of 'rzg2l_du_vsp_get_drm_plane' with type 'struct drm_plane *(struct rzg2l_du_crtc *, unsigned int)'
   75 | static inline struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:302:5: error: redefinition of 'rzg2l_du_vsp_init'
  302 | int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
      |     ^~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:66:19: note: previous definition of 'rzg2l_du_vsp_init' with type 'int(struct rzg2l_du_vsp *, struct device_node *, unsigned int)'
   66 | static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
      |                   ^~~~~~~~~~~~~~~~~

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20240222124610.383e1ce3@canb.auug.org.au/T/#u
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped EXPORT symbol as both *_crtc.o and *_vsp.o are within the single module.
 * Updated the commit description.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

