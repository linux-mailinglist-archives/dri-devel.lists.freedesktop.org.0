Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF235817AD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 18:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE50D8FA37;
	Tue, 26 Jul 2022 16:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FED991DE9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 16:42:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,194,1654527600"; d="scan'208";a="129198093"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 27 Jul 2022 01:42:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.4])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5E08F400D0DB;
 Wed, 27 Jul 2022 01:42:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 03/10] drm: rcar-du: Add kms lib support
Date: Tue, 26 Jul 2022 17:42:01 +0100
Message-Id: <20220726164208.1048444-4-biju.das.jz@bp.renesas.com>
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

Add RCar DU kms lib support by moving rcar_du_format_infos table and
rcar_du_format_infos() to the lib file to share the common code between
RCar and RZ/G2L DU KMS drivers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/Makefile          |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 290 -------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h     |  24 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 324 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  35 +++
 5 files changed, 363 insertions(+), 313 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 651da6a7ad67..bcded406b16c 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -6,7 +6,8 @@ rcar-du-drm-y := rcar_du_crtc.o \
 		 rcar_du_kms.o \
 		 rcar_du_plane.o \
 
-rcar-du-drm-$(CONFIG_DRM_RCAR_LIB) += rcar_du_encoder_lib.o
+rcar-du-drm-$(CONFIG_DRM_RCAR_LIB) += rcar_du_encoder_lib.o \
+				      rcar_du_kms_lib.o
 
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 761451ee5263..b63808025578 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -33,296 +33,6 @@
 #include "rcar_du_vsp.h"
 #include "rcar_du_writeback.h"
 
-/* -----------------------------------------------------------------------------
- * Format helpers
- */
-
-static const struct rcar_du_format_info rcar_du_format_infos[] = {
-	{
-		.fourcc = DRM_FORMAT_RGB565,
-		.v4l2 = V4L2_PIX_FMT_RGB565,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-		.pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
-		.edf = PnDDCR4_EDF_NONE,
-	}, {
-		.fourcc = DRM_FORMAT_ARGB1555,
-		.v4l2 = V4L2_PIX_FMT_ARGB555,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_ARGB,
-		.edf = PnDDCR4_EDF_NONE,
-	}, {
-		.fourcc = DRM_FORMAT_XRGB1555,
-		.v4l2 = V4L2_PIX_FMT_XRGB555,
-		.bpp = 16,
-		.planes = 1,
-		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_ARGB,
-		.edf = PnDDCR4_EDF_NONE,
-	}, {
-		.fourcc = DRM_FORMAT_XRGB8888,
-		.v4l2 = V4L2_PIX_FMT_XBGR32,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 1,
-		.pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
-		.edf = PnDDCR4_EDF_RGB888,
-	}, {
-		.fourcc = DRM_FORMAT_ARGB8888,
-		.v4l2 = V4L2_PIX_FMT_ABGR32,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 1,
-		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_16BPP,
-		.edf = PnDDCR4_EDF_ARGB8888,
-	}, {
-		.fourcc = DRM_FORMAT_UYVY,
-		.v4l2 = V4L2_PIX_FMT_UYVY,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 2,
-		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
-		.edf = PnDDCR4_EDF_NONE,
-	}, {
-		.fourcc = DRM_FORMAT_YUYV,
-		.v4l2 = V4L2_PIX_FMT_YUYV,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 2,
-		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
-		.edf = PnDDCR4_EDF_NONE,
-	}, {
-		.fourcc = DRM_FORMAT_NV12,
-		.v4l2 = V4L2_PIX_FMT_NV12M,
-		.bpp = 12,
-		.planes = 2,
-		.hsub = 2,
-		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
-		.edf = PnDDCR4_EDF_NONE,
-	}, {
-		.fourcc = DRM_FORMAT_NV21,
-		.v4l2 = V4L2_PIX_FMT_NV21M,
-		.bpp = 12,
-		.planes = 2,
-		.hsub = 2,
-		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
-		.edf = PnDDCR4_EDF_NONE,
-	}, {
-		.fourcc = DRM_FORMAT_NV16,
-		.v4l2 = V4L2_PIX_FMT_NV16M,
-		.bpp = 16,
-		.planes = 2,
-		.hsub = 2,
-		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
-		.edf = PnDDCR4_EDF_NONE,
-	},
-	/*
-	 * The following formats are not supported on Gen2 and thus have no
-	 * associated .pnmr or .edf settings.
-	 */
-	{
-		.fourcc = DRM_FORMAT_RGB332,
-		.v4l2 = V4L2_PIX_FMT_RGB332,
-		.bpp = 8,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_ARGB4444,
-		.v4l2 = V4L2_PIX_FMT_ARGB444,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_XRGB4444,
-		.v4l2 = V4L2_PIX_FMT_XRGB444,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_RGBA4444,
-		.v4l2 = V4L2_PIX_FMT_RGBA444,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_RGBX4444,
-		.v4l2 = V4L2_PIX_FMT_RGBX444,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_ABGR4444,
-		.v4l2 = V4L2_PIX_FMT_ABGR444,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_XBGR4444,
-		.v4l2 = V4L2_PIX_FMT_XBGR444,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_BGRA4444,
-		.v4l2 = V4L2_PIX_FMT_BGRA444,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_BGRX4444,
-		.v4l2 = V4L2_PIX_FMT_BGRX444,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_RGBA5551,
-		.v4l2 = V4L2_PIX_FMT_RGBA555,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_RGBX5551,
-		.v4l2 = V4L2_PIX_FMT_RGBX555,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_ABGR1555,
-		.v4l2 = V4L2_PIX_FMT_ABGR555,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_XBGR1555,
-		.v4l2 = V4L2_PIX_FMT_XBGR555,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_BGRA5551,
-		.v4l2 = V4L2_PIX_FMT_BGRA555,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_BGRX5551,
-		.v4l2 = V4L2_PIX_FMT_BGRX555,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_BGR888,
-		.v4l2 = V4L2_PIX_FMT_RGB24,
-		.bpp = 24,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_RGB888,
-		.v4l2 = V4L2_PIX_FMT_BGR24,
-		.bpp = 24,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_RGBA8888,
-		.v4l2 = V4L2_PIX_FMT_BGRA32,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_RGBX8888,
-		.v4l2 = V4L2_PIX_FMT_BGRX32,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_ABGR8888,
-		.v4l2 = V4L2_PIX_FMT_RGBA32,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_XBGR8888,
-		.v4l2 = V4L2_PIX_FMT_RGBX32,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_BGRA8888,
-		.v4l2 = V4L2_PIX_FMT_ARGB32,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_BGRX8888,
-		.v4l2 = V4L2_PIX_FMT_XRGB32,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_YVYU,
-		.v4l2 = V4L2_PIX_FMT_YVYU,
-		.bpp = 16,
-		.planes = 1,
-		.hsub = 2,
-	}, {
-		.fourcc = DRM_FORMAT_NV61,
-		.v4l2 = V4L2_PIX_FMT_NV61M,
-		.bpp = 16,
-		.planes = 2,
-		.hsub = 2,
-	}, {
-		.fourcc = DRM_FORMAT_YUV420,
-		.v4l2 = V4L2_PIX_FMT_YUV420M,
-		.bpp = 12,
-		.planes = 3,
-		.hsub = 2,
-	}, {
-		.fourcc = DRM_FORMAT_YVU420,
-		.v4l2 = V4L2_PIX_FMT_YVU420M,
-		.bpp = 12,
-		.planes = 3,
-		.hsub = 2,
-	}, {
-		.fourcc = DRM_FORMAT_YUV422,
-		.v4l2 = V4L2_PIX_FMT_YUV422M,
-		.bpp = 16,
-		.planes = 3,
-		.hsub = 2,
-	}, {
-		.fourcc = DRM_FORMAT_YVU422,
-		.v4l2 = V4L2_PIX_FMT_YVU422M,
-		.bpp = 16,
-		.planes = 3,
-		.hsub = 2,
-	}, {
-		.fourcc = DRM_FORMAT_YUV444,
-		.v4l2 = V4L2_PIX_FMT_YUV444M,
-		.bpp = 24,
-		.planes = 3,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_YVU444,
-		.v4l2 = V4L2_PIX_FMT_YVU444M,
-		.bpp = 24,
-		.planes = 3,
-		.hsub = 1,
-	},
-};
-
-const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(rcar_du_format_infos); ++i) {
-		if (rcar_du_format_infos[i].fourcc == fourcc)
-			return &rcar_du_format_infos[i];
-	}
-
-	return NULL;
-}
-
 /* -----------------------------------------------------------------------------
  * Frame buffer
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
index f31afeeee05a..58a66dc355bf 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -2,7 +2,7 @@
 /*
  * R-Car Display Unit Mode Setting
  *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
+ * Copyright (C) 2013-2022 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
@@ -10,27 +10,7 @@
 #ifndef __RCAR_DU_KMS_H__
 #define __RCAR_DU_KMS_H__
 
-#include <linux/types.h>
-
-struct dma_buf_attachment;
-struct drm_file;
-struct drm_device;
-struct drm_gem_object;
-struct drm_mode_create_dumb;
-struct rcar_du_device;
-struct sg_table;
-
-struct rcar_du_format_info {
-	u32 fourcc;
-	u32 v4l2;
-	unsigned int bpp;
-	unsigned int planes;
-	unsigned int hsub;
-	unsigned int pnmr;
-	unsigned int edf;
-};
-
-const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc);
+#include "rcar_du_kms_lib.h"
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
new file mode 100644
index 000000000000..40ccd8635c34
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * R-Car Display Unit Mode Setting Lib
+ *
+ * Copyright (C) 2013-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/wait.h>
+
+#include "rcar_du_crtc.h"
+#include "rcar_du_drv.h"
+#include "rcar_du_encoder.h"
+#include "rcar_du_kms.h"
+#include "rcar_du_regs.h"
+#include "rcar_du_vsp.h"
+#include "rcar_du_writeback.h"
+
+/* -----------------------------------------------------------------------------
+ * Format helpers
+ */
+
+static const struct rcar_du_format_info rcar_du_format_infos[] = {
+	{
+		.fourcc = DRM_FORMAT_RGB565,
+		.v4l2 = V4L2_PIX_FMT_RGB565,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+		.pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
+		.edf = PnDDCR4_EDF_NONE,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB1555,
+		.v4l2 = V4L2_PIX_FMT_ARGB555,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_ARGB,
+		.edf = PnDDCR4_EDF_NONE,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB1555,
+		.v4l2 = V4L2_PIX_FMT_XRGB555,
+		.bpp = 16,
+		.planes = 1,
+		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_ARGB,
+		.edf = PnDDCR4_EDF_NONE,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB8888,
+		.v4l2 = V4L2_PIX_FMT_XBGR32,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+		.pnmr = PnMR_SPIM_TP | PnMR_DDDF_16BPP,
+		.edf = PnDDCR4_EDF_RGB888,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB8888,
+		.v4l2 = V4L2_PIX_FMT_ABGR32,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+		.pnmr = PnMR_SPIM_ALP | PnMR_DDDF_16BPP,
+		.edf = PnDDCR4_EDF_ARGB8888,
+	}, {
+		.fourcc = DRM_FORMAT_UYVY,
+		.v4l2 = V4L2_PIX_FMT_UYVY,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 2,
+		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
+		.edf = PnDDCR4_EDF_NONE,
+	}, {
+		.fourcc = DRM_FORMAT_YUYV,
+		.v4l2 = V4L2_PIX_FMT_YUYV,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 2,
+		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
+		.edf = PnDDCR4_EDF_NONE,
+	}, {
+		.fourcc = DRM_FORMAT_NV12,
+		.v4l2 = V4L2_PIX_FMT_NV12M,
+		.bpp = 12,
+		.planes = 2,
+		.hsub = 2,
+		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
+		.edf = PnDDCR4_EDF_NONE,
+	}, {
+		.fourcc = DRM_FORMAT_NV21,
+		.v4l2 = V4L2_PIX_FMT_NV21M,
+		.bpp = 12,
+		.planes = 2,
+		.hsub = 2,
+		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
+		.edf = PnDDCR4_EDF_NONE,
+	}, {
+		.fourcc = DRM_FORMAT_NV16,
+		.v4l2 = V4L2_PIX_FMT_NV16M,
+		.bpp = 16,
+		.planes = 2,
+		.hsub = 2,
+		.pnmr = PnMR_SPIM_TP_OFF | PnMR_DDDF_YC,
+		.edf = PnDDCR4_EDF_NONE,
+	},
+	/*
+	 * The following formats are not supported on Gen2 and thus have no
+	 * associated .pnmr or .edf settings.
+	 */
+	{
+		.fourcc = DRM_FORMAT_RGB332,
+		.v4l2 = V4L2_PIX_FMT_RGB332,
+		.bpp = 8,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB4444,
+		.v4l2 = V4L2_PIX_FMT_ARGB444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_XRGB4444,
+		.v4l2 = V4L2_PIX_FMT_XRGB444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGBA4444,
+		.v4l2 = V4L2_PIX_FMT_RGBA444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGBX4444,
+		.v4l2 = V4L2_PIX_FMT_RGBX444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ABGR4444,
+		.v4l2 = V4L2_PIX_FMT_ABGR444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_XBGR4444,
+		.v4l2 = V4L2_PIX_FMT_XBGR444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRA4444,
+		.v4l2 = V4L2_PIX_FMT_BGRA444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRX4444,
+		.v4l2 = V4L2_PIX_FMT_BGRX444,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGBA5551,
+		.v4l2 = V4L2_PIX_FMT_RGBA555,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGBX5551,
+		.v4l2 = V4L2_PIX_FMT_RGBX555,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ABGR1555,
+		.v4l2 = V4L2_PIX_FMT_ABGR555,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_XBGR1555,
+		.v4l2 = V4L2_PIX_FMT_XBGR555,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRA5551,
+		.v4l2 = V4L2_PIX_FMT_BGRA555,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRX5551,
+		.v4l2 = V4L2_PIX_FMT_BGRX555,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGR888,
+		.v4l2 = V4L2_PIX_FMT_RGB24,
+		.bpp = 24,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGB888,
+		.v4l2 = V4L2_PIX_FMT_BGR24,
+		.bpp = 24,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGBA8888,
+		.v4l2 = V4L2_PIX_FMT_BGRA32,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGBX8888,
+		.v4l2 = V4L2_PIX_FMT_BGRX32,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ABGR8888,
+		.v4l2 = V4L2_PIX_FMT_RGBA32,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_XBGR8888,
+		.v4l2 = V4L2_PIX_FMT_RGBX32,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRA8888,
+		.v4l2 = V4L2_PIX_FMT_ARGB32,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_BGRX8888,
+		.v4l2 = V4L2_PIX_FMT_XRGB32,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_YVYU,
+		.v4l2 = V4L2_PIX_FMT_YVYU,
+		.bpp = 16,
+		.planes = 1,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_NV61,
+		.v4l2 = V4L2_PIX_FMT_NV61M,
+		.bpp = 16,
+		.planes = 2,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUV420,
+		.v4l2 = V4L2_PIX_FMT_YUV420M,
+		.bpp = 12,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YVU420,
+		.v4l2 = V4L2_PIX_FMT_YVU420M,
+		.bpp = 12,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUV422,
+		.v4l2 = V4L2_PIX_FMT_YUV422M,
+		.bpp = 16,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YVU422,
+		.v4l2 = V4L2_PIX_FMT_YVU422M,
+		.bpp = 16,
+		.planes = 3,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_YUV444,
+		.v4l2 = V4L2_PIX_FMT_YUV444M,
+		.bpp = 24,
+		.planes = 3,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_YVU444,
+		.v4l2 = V4L2_PIX_FMT_YVU444M,
+		.bpp = 24,
+		.planes = 3,
+		.hsub = 1,
+	},
+};
+
+const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rcar_du_format_infos); ++i) {
+		if (rcar_du_format_infos[i].fourcc == fourcc)
+			return &rcar_du_format_infos[i];
+	}
+
+	return NULL;
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
new file mode 100644
index 000000000000..5fa488abb681
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * R-Car Display Unit Mode Setting Lib
+ *
+ * Copyright (C) 2013-2022 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#ifndef __RCAR_DU_KMS_LIB_H__
+#define __RCAR_DU_KMS_LIB_H__
+
+#include <linux/types.h>
+
+struct dma_buf_attachment;
+struct drm_file;
+struct drm_device;
+struct drm_gem_object;
+struct drm_mode_create_dumb;
+struct rcar_du_device;
+struct sg_table;
+
+struct rcar_du_format_info {
+	u32 fourcc;
+	u32 v4l2;
+	unsigned int bpp;
+	unsigned int planes;
+	unsigned int hsub;
+	unsigned int pnmr;
+	unsigned int edf;
+};
+
+const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc);
+
+#endif /* __RCAR_DU_KMS_LIB_H__ */
-- 
2.25.1

