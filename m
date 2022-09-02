Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E41DE5AB739
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 19:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EA810E8AA;
	Fri,  2 Sep 2022 17:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E0A910E8A9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 17:08:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,283,1654527600"; d="scan'208";a="133510991"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 03 Sep 2022 02:08:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.67])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1E71D40078DC;
 Sat,  3 Sep 2022 02:08:44 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 04/10] drm: rcar-du: Add vsp lib support
Date: Fri,  2 Sep 2022 18:08:20 +0100
Message-Id: <20220902170826.599262-5-biju.das.jz@bp.renesas.com>
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

Add RCar DU vsp lib support by moving rcar_du_vsp_disable()
to the lib file so that same function can be used by both
RCar and RZ/G2L DU VSP drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/Kconfig           |  5 +++++
 drivers/gpu/drm/rcar-du/Makefile          |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |  5 -----
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     |  4 ++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 17 +++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h | 19 +++++++++++++++++++
 6 files changed, 44 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 369af45b5ff9..64d47d9f9131 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -76,3 +76,8 @@ config DRM_RCAR_LIB
 	bool
 	default y
 	depends on DRM_RCAR_DU
+
+config DRM_RCAR_VSP_LIB
+	bool
+	default y
+	depends on DRM_RCAR_VSP
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 3ce410300334..8fc924cf37a7 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -10,6 +10,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LIB) += rcar_du_encoder_lib.o \
 				      rcar_du_kms_lib.o
 
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
+rcar-du-drm-$(CONFIG_DRM_RCAR_VSP_LIB)	+= rcar_du_vsp_lib.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
 
 obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index e465aef41585..bed3f2a3c4a5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -88,11 +88,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
-{
-	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
-}
-
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
 {
 	vsp1_du_atomic_begin(crtc->vsp->vsp, crtc->vsp_pipe);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 67630f0b6599..8fbfa86c93e0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -12,6 +12,8 @@
 
 #include <drm/drm_plane.h>
 
+#include "rcar_du_vsp_lib.h"
+
 struct drm_framebuffer;
 struct rcar_du_format_info;
 struct rcar_du_vsp;
@@ -59,7 +61,6 @@ to_rcar_vsp_plane_state(struct drm_plane_state *state)
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs);
 void rcar_du_vsp_enable(struct rcar_du_crtc *crtc);
-void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
@@ -74,7 +75,6 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 	return -ENXIO;
 }
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
-static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc) { };
 static inline int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
new file mode 100644
index 000000000000..e22d4e535268
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * R-Car Display Unit VSP-Based Compositor Lib
+ *
+ * Copyright (C) 2015-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#include <media/vsp1.h>
+
+#include "rcar_du_drv.h"
+
+void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
+{
+	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
new file mode 100644
index 000000000000..d91c043bbced
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * R-Car Display Unit VSP-Based Compositor Lib
+ *
+ * Copyright (C) 2015-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#ifndef __RCAR_DU_VSP_LIB_H__
+#define __RCAR_DU_VSP_LIB_H__
+
+#ifdef CONFIG_DRM_RCAR_VSP
+void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
+#else
+static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
+#endif
+
+#endif /* __RCAR_DU_VSP_LIB_H__ */
-- 
2.25.1

