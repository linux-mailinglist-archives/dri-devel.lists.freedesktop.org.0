Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C645817A8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 18:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7117E91B6C;
	Tue, 26 Jul 2022 16:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5624929DC
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:42:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,194,1654527600"; d="scan'208";a="129198103"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 27 Jul 2022 01:42:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.4])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4B03640083D5;
 Wed, 27 Jul 2022 01:42:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 04/10] drm: rcar-du: Add vsp lib support
Date: Tue, 26 Jul 2022 17:42:02 +0100
Message-Id: <20220726164208.1048444-5-biju.das.jz@bp.renesas.com>
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

Add RCar DU vsp lib support by moving rcar_du_vsp_disable()
to the lib file so that same function can be used by both
RCar and RZ/G2L DU VSP drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/Kconfig           |  5 ++
 drivers/gpu/drm/rcar-du/Makefile          |  1 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c     |  5 --
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h     | 47 +----------------
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c | 40 ++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h | 64 +++++++++++++++++++++++
 6 files changed, 111 insertions(+), 51 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 684462c40ae3..f8e1341be5f8 100644
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
index bcded406b16c..cee1f69926db 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -10,6 +10,7 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LIB) += rcar_du_encoder_lib.o \
 				      rcar_du_kms_lib.o
 
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
+rcar-du-drm-$(CONFIG_DRM_RCAR_VSP_LIB)	+= rcar_du_vsp_lib.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
 
 obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index dbc68cdabcff..b84d120b6ce0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -89,11 +89,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
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
index 67630f0b6599..04d1c1416b16 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -10,56 +10,12 @@
 #ifndef __RCAR_DU_VSP_H__
 #define __RCAR_DU_VSP_H__
 
-#include <drm/drm_plane.h>
-
-struct drm_framebuffer;
-struct rcar_du_format_info;
-struct rcar_du_vsp;
-struct sg_table;
-
-struct rcar_du_vsp_plane {
-	struct drm_plane plane;
-	struct rcar_du_vsp *vsp;
-	unsigned int index;
-};
-
-struct rcar_du_vsp {
-	unsigned int index;
-	struct device *vsp;
-	struct rcar_du_device *dev;
-	struct rcar_du_vsp_plane *planes;
-	unsigned int num_planes;
-};
-
-static inline struct rcar_du_vsp_plane *to_rcar_vsp_plane(struct drm_plane *p)
-{
-	return container_of(p, struct rcar_du_vsp_plane, plane);
-}
-
-/**
- * struct rcar_du_vsp_plane_state - Driver-specific plane state
- * @state: base DRM plane state
- * @format: information about the pixel format used by the plane
- * @sg_tables: scatter-gather tables for the frame buffer memory
- */
-struct rcar_du_vsp_plane_state {
-	struct drm_plane_state state;
-
-	const struct rcar_du_format_info *format;
-	struct sg_table sg_tables[3];
-};
-
-static inline struct rcar_du_vsp_plane_state *
-to_rcar_vsp_plane_state(struct drm_plane_state *state)
-{
-	return container_of(state, struct rcar_du_vsp_plane_state, state);
-}
+#include "rcar_du_vsp_lib.h"
 
 #ifdef CONFIG_DRM_RCAR_VSP
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs);
 void rcar_du_vsp_enable(struct rcar_du_crtc *crtc);
-void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
 int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
@@ -74,7 +30,6 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 	return -ENXIO;
 }
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
-static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc) { };
 static inline int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
new file mode 100644
index 000000000000..045ec55e87f5
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * R-Car Display Unit VSP-Based Compositor Lib
+ *
+ * Copyright (C) 2015-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_vblank.h>
+
+#include <linux/bitops.h>
+#include <linux/dma-mapping.h>
+#include <linux/of_platform.h>
+#include <linux/scatterlist.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
+
+#include <media/vsp1.h>
+
+#include "rcar_du_drv.h"
+#include "rcar_du_kms.h"
+#include "rcar_du_vsp.h"
+#include "rcar_du_writeback.h"
+
+void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
+{
+	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
new file mode 100644
index 000000000000..6c0aff046cdf
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp_lib.h
@@ -0,0 +1,64 @@
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
+#include <drm/drm_plane.h>
+
+struct drm_framebuffer;
+struct rcar_du_format_info;
+struct rcar_du_vsp;
+struct sg_table;
+
+struct rcar_du_vsp_plane {
+	struct drm_plane plane;
+	struct rcar_du_vsp *vsp;
+	unsigned int index;
+};
+
+struct rcar_du_vsp {
+	unsigned int index;
+	struct device *vsp;
+	struct rcar_du_device *dev;
+	struct rcar_du_vsp_plane *planes;
+	unsigned int num_planes;
+};
+
+static inline struct rcar_du_vsp_plane *to_rcar_vsp_plane(struct drm_plane *p)
+{
+	return container_of(p, struct rcar_du_vsp_plane, plane);
+}
+
+/**
+ * struct rcar_du_vsp_plane_state - Driver-specific plane state
+ * @state: base DRM plane state
+ * @format: information about the pixel format used by the plane
+ * @sg_tables: scatter-gather tables for the frame buffer memory
+ */
+struct rcar_du_vsp_plane_state {
+	struct drm_plane_state state;
+
+	const struct rcar_du_format_info *format;
+	struct sg_table sg_tables[3];
+};
+
+static inline struct rcar_du_vsp_plane_state *
+to_rcar_vsp_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct rcar_du_vsp_plane_state, state);
+}
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

