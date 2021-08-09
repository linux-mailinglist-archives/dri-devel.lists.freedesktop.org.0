Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AB33E3DB3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D8489A76;
	Mon,  9 Aug 2021 01:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42E25899B0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:19 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B623638DA;
 Mon,  9 Aug 2021 03:35:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472918;
 bh=PRV04kw3Zg1+q/n8lVvUb/zQkgQCgt3C3Br7D3MYOQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tFxptFQ7IMVo3ls947dM/yHL9pfeEqJr3HNvHahpx731E38joFLEEJEHttWrRu1AX
 +8SJ2xdfjnjpRU3/RQtemi90YdAo89UfYE+VhQ03BjzcUQrfPl70UkgCSr+ceRgRw0
 q3OCn+O09rXUlyG6Upj8H1CIZ0rVHpGDwcSFxSVs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 32/36] drm: xlnx: zynqmp_dpsub: Allow configuration of layer
 mode
Date: Mon,  9 Aug 2021 04:34:53 +0300
Message-Id: <20210809013457.11266-33-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
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

Add a mode parameter to the zynqmp_disp_layer_enable() to set the layer
mode, to prepare for live mode support.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 30 +++++++++---------------------
 drivers/gpu/drm/xlnx/zynqmp_disp.h | 13 ++++++++++++-
 drivers/gpu/drm/xlnx/zynqmp_kms.c  |  2 +-
 3 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 5c39df0fbe59..ebb55e5ab824 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -77,16 +77,6 @@ struct zynqmp_disp_format {
 	const u32 *sf;
 };
 
-/**
- * enum zynqmp_disp_layer_mode - Layer mode
- * @ZYNQMP_DISP_LAYER_NONLIVE: non-live (memory) mode
- * @ZYNQMP_DISP_LAYER_LIVE: live (stream) mode
- */
-enum zynqmp_disp_layer_mode {
-	ZYNQMP_DISP_LAYER_NONLIVE,
-	ZYNQMP_DISP_LAYER_LIVE
-};
-
 /**
  * struct zynqmp_disp_layer_dma - DMA channel for one data plane of a layer
  * @chan: DMA channel
@@ -130,7 +120,7 @@ struct zynqmp_disp_layer {
 
 	const struct zynqmp_disp_format *disp_fmt;
 	const struct drm_format_info *drm_fmt;
-	enum zynqmp_disp_layer_mode mode;
+	enum zynqmp_dpsub_layer_mode mode;
 };
 
 /**
@@ -518,27 +508,25 @@ static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp *disp)
  * zynqmp_disp_avbuf_enable_video - Enable a video layer
  * @disp: Display controller
  * @layer: The layer
- * @mode: Operating mode of layer
  *
  * Enable the video/graphics buffer for @layer.
  */
 static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp *disp,
-					   struct zynqmp_disp_layer *layer,
-					   enum zynqmp_disp_layer_mode mode)
+					   struct zynqmp_disp_layer *layer)
 {
 	u32 val;
 
 	val = zynqmp_disp_avbuf_read(disp, ZYNQMP_DISP_AV_BUF_OUTPUT);
 	if (zynqmp_disp_layer_is_video(layer)) {
 		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
-		if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
+		if (layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)
 			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
 		else
 			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE;
 	} else {
 		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
 		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
-		if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
+		if (layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)
 			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
 		else
 			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE;
@@ -913,17 +901,17 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 /**
  * zynqmp_disp_layer_enable - Enable a layer
  * @layer: The layer
+ * @mode: Operating mode of layer
  *
  * Enable the @layer in the audio/video buffer manager and the blender. DMA
  * channels are started separately by zynqmp_disp_layer_update().
  */
-void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
+void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
+			      enum zynqmp_dpsub_layer_mode mode)
 {
-	zynqmp_disp_avbuf_enable_video(layer->disp, layer,
-				       ZYNQMP_DISP_LAYER_NONLIVE);
+	layer->mode = mode;
+	zynqmp_disp_avbuf_enable_video(layer->disp, layer);
 	zynqmp_disp_blend_layer_enable(layer->disp, layer);
-
-	layer->mode = ZYNQMP_DISP_LAYER_NONLIVE;
 }
 
 /**
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index 9b8b202224d9..123cffac08be 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -42,6 +42,16 @@ enum zynqmp_dpsub_layer_id {
 	ZYNQMP_DPSUB_LAYER_GFX,
 };
 
+/**
+ * enum zynqmp_dpsub_layer_mode - Layer mode
+ * @ZYNQMP_DPSUB_LAYER_NONLIVE: non-live (memory) mode
+ * @ZYNQMP_DPSUB_LAYER_LIVE: live (stream) mode
+ */
+enum zynqmp_dpsub_layer_mode {
+	ZYNQMP_DPSUB_LAYER_NONLIVE,
+	ZYNQMP_DPSUB_LAYER_LIVE,
+};
+
 void zynqmp_disp_enable(struct zynqmp_disp *disp);
 void zynqmp_disp_disable(struct zynqmp_disp *disp);
 int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
@@ -52,7 +62,8 @@ void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
 
 u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 				   unsigned int *num_formats);
-void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
+void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer,
+			      enum zynqmp_dpsub_layer_mode mode);
 void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
 void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 				  const struct drm_format_info *info);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 922d6c80c16b..f8d94e8da19b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -122,7 +122,7 @@ static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
 
 	/* Enable or re-enable the plane if the format has changed. */
 	if (format_changed)
-		zynqmp_disp_layer_enable(layer);
+		zynqmp_disp_layer_enable(layer, ZYNQMP_DPSUB_LAYER_NONLIVE);
 }
 
 static const struct drm_plane_helper_funcs zynqmp_dpsub_plane_helper_funcs = {
-- 
Regards,

Laurent Pinchart

