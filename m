Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D738ABCD
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 13:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EF86F3FE;
	Thu, 20 May 2021 11:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9D76F3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 11:31:06 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD4C7D41;
 Thu, 20 May 2021 13:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1621510264;
 bh=00Yw5HQerCSsg0Wc2kD6gfUeKHXBE1N8aG835OP6AJk=;
 h=From:To:Cc:Subject:Date:From;
 b=NL+9FMeBAG7ImIspcupKBbUd9ujItMRpcwONTbstqqf9UJOVXpx4wtafeErtm6yXs
 TWOtBDp8XthVEmTrSj8l7RF8inVRYDbiFq3P40jrzFf+r8WGmBevncm9poB9KQudlv
 ttGcZGIvoyAR/3N3YaAcEDzMBCD0ey6xK+UsQbew=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm: xlnx: zynqmp: Add zynqmp_disp_layer_is_video() to
 simplify the code
Date: Thu, 20 May 2021 14:30:57 +0300
Message-Id: <20210520113057.13069-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.1
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Michal Simek <michal.simek@xilinx.com>,
 Quanyang Wang <quanyang.wang@windriver.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quanyang Wang <quanyang.wang@windriver.com>

Add a new function zynqmp_disp_layer_is_video() to simplify the code
that judges if a layer is the video layer.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[Renamed is_layer_vid() to zynqmp_disp_layer_is_video()]]
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 39 +++++++++++++++++-------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 01c6ce7784dd..a578ab3d5f89 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -434,30 +434,35 @@ static void zynqmp_disp_avbuf_write(struct zynqmp_disp_avbuf *avbuf,
 	writel(val, avbuf->base + reg);
 }
 
+static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
+{
+	return layer->id == ZYNQMP_DISP_LAYER_VID;
+}
+
 /**
  * zynqmp_disp_avbuf_set_format - Set the input format for a layer
  * @avbuf: Audio/video buffer manager
- * @layer: The layer ID
+ * @layer: The layer
  * @fmt: The format information
  *
  * Set the video buffer manager format for @layer to @fmt.
  */
 static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp_avbuf *avbuf,
-					 enum zynqmp_disp_layer_id layer,
+					 struct zynqmp_disp_layer *layer,
 					 const struct zynqmp_disp_format *fmt)
 {
 	unsigned int i;
 	u32 val;
 
 	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_FMT);
-	val &= layer == ZYNQMP_DISP_LAYER_VID
+	val &= zynqmp_disp_layer_is_video(layer)
 	    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
 	    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
 	val |= fmt->buf_fmt;
 	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_FMT, val);
 
 	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
-		unsigned int reg = layer == ZYNQMP_DISP_LAYER_VID
+		unsigned int reg = zynqmp_disp_layer_is_video(layer)
 				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
 				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
 
@@ -573,19 +578,19 @@ static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *avbuf)
 /**
  * zynqmp_disp_avbuf_enable_video - Enable a video layer
  * @avbuf: Audio/video buffer manager
- * @layer: The layer ID
+ * @layer: The layer
  * @mode: Operating mode of layer
  *
  * Enable the video/graphics buffer for @layer.
  */
 static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
-					   enum zynqmp_disp_layer_id layer,
+					   struct zynqmp_disp_layer *layer,
 					   enum zynqmp_disp_layer_mode mode)
 {
 	u32 val;
 
 	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
-	if (layer == ZYNQMP_DISP_LAYER_VID) {
+	if (zynqmp_disp_layer_is_video(layer)) {
 		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
 		if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
 			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
@@ -605,17 +610,17 @@ static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
 /**
  * zynqmp_disp_avbuf_disable_video - Disable a video layer
  * @avbuf: Audio/video buffer manager
- * @layer: The layer ID
+ * @layer: The layer
  *
  * Disable the video/graphics buffer for @layer.
  */
 static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf *avbuf,
-					    enum zynqmp_disp_layer_id layer)
+					    struct zynqmp_disp_layer *layer)
 {
 	u32 val;
 
 	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
-	if (layer == ZYNQMP_DISP_LAYER_VID) {
+	if (zynqmp_disp_layer_is_video(layer)) {
 		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
 		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
 	} else {
@@ -807,7 +812,7 @@ static void zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *blend,
 		}
 	}
 
-	if (layer->id == ZYNQMP_DISP_LAYER_VID)
+	if (zynqmp_disp_layer_is_video(layer))
 		reg = ZYNQMP_DISP_V_BLEND_IN1CSC_COEFF(0);
 	else
 		reg = ZYNQMP_DISP_V_BLEND_IN2CSC_COEFF(0);
@@ -818,7 +823,7 @@ static void zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *blend,
 		zynqmp_disp_blend_write(blend, reg + 8, coeffs[i + swap[2]]);
 	}
 
-	if (layer->id == ZYNQMP_DISP_LAYER_VID)
+	if (zynqmp_disp_layer_is_video(layer))
 		reg = ZYNQMP_DISP_V_BLEND_IN1CSC_OFFSET(0);
 	else
 		reg = ZYNQMP_DISP_V_BLEND_IN2CSC_OFFSET(0);
@@ -1025,7 +1030,7 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
  */
 static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
 {
-	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer->id,
+	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer,
 				       ZYNQMP_DISP_LAYER_NONLIVE);
 	zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
 
@@ -1046,7 +1051,7 @@ static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 	for (i = 0; i < layer->drm_fmt->num_planes; i++)
 		dmaengine_terminate_sync(layer->dmas[i].chan);
 
-	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer->id);
+	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
 	zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
 }
 
@@ -1067,7 +1072,7 @@ static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
 	layer->drm_fmt = info;
 
-	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer->id,
+	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer,
 				     layer->disp_fmt);
 
 	/*
@@ -1244,8 +1249,8 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 			drm_formats[j] = layer->info->formats[j].drm_fmt;
 
 		/* Graphics layer is primary, and video layer is overlay. */
-		type = i == ZYNQMP_DISP_LAYER_GFX
-		     ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
+		type = zynqmp_disp_layer_is_video(layer)
+		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
 		ret = drm_universal_plane_init(disp->drm, &layer->plane, 0,
 					       &zynqmp_disp_plane_funcs,
 					       drm_formats,
-- 
Regards,

Laurent Pinchart

