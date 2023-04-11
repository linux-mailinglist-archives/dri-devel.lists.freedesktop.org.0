Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA776DD9A9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 13:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F8810E287;
	Tue, 11 Apr 2023 11:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 257E010E2AE
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 11:42:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; d="scan'208";a="155597302"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2023 20:42:52 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6A0C7400195D;
 Tue, 11 Apr 2023 20:42:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v7 02/17] drm: rcar-du: Add kms lib support
Date: Tue, 11 Apr 2023 12:42:20 +0100
Message-Id: <20230411114235.366042-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
References: <20230411114235.366042-1-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add RCar DU kms lib support for sharing the common code between
RCar and RZ/G2L DU KMS drivers by moving rcar_du_format_infos
table and rcar_du_format_infos() to the lib file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Rebased to drm-tip.
v1->v6:
 * Rebased on drm-misc-next and DU-next.
v1:
 * Created the lib suggested by Laurent.

Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220316131100.30685-6-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/rcar-du/Makefile          |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c     | 320 ---------------------
 drivers/gpu/drm/rcar-du/rcar_du_kms.h     |  16 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c | 335 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h |  27 ++
 5 files changed, 366 insertions(+), 335 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 479c8eebba5a..3ce410300334 100644
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
index adfb36b0e815..3141d447e979 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -32,326 +32,6 @@
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
-		.fourcc = DRM_FORMAT_RGBX1010102,
-		.v4l2 = V4L2_PIX_FMT_RGBX1010102,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_RGBA1010102,
-		.v4l2 = V4L2_PIX_FMT_RGBA1010102,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 1,
-	}, {
-		.fourcc = DRM_FORMAT_ARGB2101010,
-		.v4l2 = V4L2_PIX_FMT_ARGB2101010,
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
-	}, {
-		.fourcc = DRM_FORMAT_Y210,
-		.v4l2 = V4L2_PIX_FMT_Y210,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 2,
-	}, {
-		.fourcc = DRM_FORMAT_Y212,
-		.v4l2 = V4L2_PIX_FMT_Y212,
-		.bpp = 32,
-		.planes = 1,
-		.hsub = 2,
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
index f31afeeee05a..d2d4f34fe557 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
@@ -2,7 +2,7 @@
 /*
  * R-Car Display Unit Mode Setting
  *
- * Copyright (C) 2013-2014 Renesas Electronics Corporation
+ * Copyright (C) 2013-2023 Renesas Electronics Corporation
  *
  * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
  */
@@ -10,7 +10,7 @@
 #ifndef __RCAR_DU_KMS_H__
 #define __RCAR_DU_KMS_H__
 
-#include <linux/types.h>
+#include "rcar_du_kms_lib.h"
 
 struct dma_buf_attachment;
 struct drm_file;
@@ -20,18 +20,6 @@ struct drm_mode_create_dumb;
 struct rcar_du_device;
 struct sg_table;
 
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
-
 int rcar_du_modeset_init(struct rcar_du_device *rcdu);
 
 int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
new file mode 100644
index 000000000000..5921040586fc
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * R-Car Display Unit Mode Setting Lib
+ *
+ * Copyright (C) 2013-2023 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#include <drm/drm_framebuffer.h>
+
+#include <linux/videodev2.h>
+
+#include "rcar_du_kms.h"
+#include "rcar_du_regs.h"
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
+		.fourcc = DRM_FORMAT_RGBX1010102,
+		.v4l2 = V4L2_PIX_FMT_RGBX1010102,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_RGBA1010102,
+		.v4l2 = V4L2_PIX_FMT_RGBA1010102,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 1,
+	}, {
+		.fourcc = DRM_FORMAT_ARGB2101010,
+		.v4l2 = V4L2_PIX_FMT_ARGB2101010,
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
+	}, {
+		.fourcc = DRM_FORMAT_Y210,
+		.v4l2 = V4L2_PIX_FMT_Y210,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 2,
+	}, {
+		.fourcc = DRM_FORMAT_Y212,
+		.v4l2 = V4L2_PIX_FMT_Y212,
+		.bpp = 32,
+		.planes = 1,
+		.hsub = 2,
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
index 000000000000..d72069436cac
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * R-Car Display Unit Mode Setting Lib
+ *
+ * Copyright (C) 2013-2023 Renesas Electronics Corporation
+ *
+ * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
+ */
+
+#ifndef __RCAR_DU_KMS_LIB_H__
+#define __RCAR_DU_KMS_LIB_H__
+
+#include <linux/types.h>
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

