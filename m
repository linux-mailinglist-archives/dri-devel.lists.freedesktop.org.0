Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB155EE9B5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AA910E7CD;
	Wed, 28 Sep 2022 22:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038D210E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:48:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EE116BE;
 Thu, 29 Sep 2022 00:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405296;
 bh=vOLZA7K0L8CYFPdcY4Oam2OGtDyaQ6xHaAcWMbBxdBk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oxVmobyIZcooN5NGHOWITtQpCNTKeDrCw/dqgJPQVI+J8UopeEcAPtM32IwFKnUOh
 Un7FgVldyfr5GYxsVSTEJ2T3B3PhfE6/TfL2qjoOGVluJsfdpZfVBO5ytqie5m0phe
 gz9CBrFYbnF3e+6pTIK769d2R4UQBt+XIE9feYzA=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 34/37] drm: xlnx: zynqmp_dpsub: Support operation without
 DMA engine
Date: Thu, 29 Sep 2022 01:47:16 +0300
Message-Id: <20220928224719.3291-35-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To prepare for usage of the DPSUB as a DisplayPort bridge without
creating a DRM device, make initialization and usage of the DMA engine
optional. The flag that controls this feature is currently hardcoded to
operating with the DMA engine, this will be made dynamic based on the
device tree configuration in a subsequent change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 26 ++++++++++++++++++++------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c |  3 +++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  3 +++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 1c46f25001b7..3deed843f2ea 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -926,8 +926,10 @@ void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 {
 	unsigned int i;
 
-	for (i = 0; i < layer->drm_fmt->num_planes; i++)
-		dmaengine_terminate_sync(layer->dmas[i].chan);
+	if (layer->disp->dpsub->dma_enabled) {
+		for (i = 0; i < layer->drm_fmt->num_planes; i++)
+			dmaengine_terminate_sync(layer->dmas[i].chan);
+	}
 
 	zynqmp_disp_avbuf_disable_video(layer->disp, layer);
 	zynqmp_disp_blend_layer_disable(layer->disp, layer);
@@ -950,6 +952,9 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 
 	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
 
+	if (!layer->disp->dpsub->dma_enabled)
+		return;
+
 	/*
 	 * Set pconfig for each DMA channel to indicate they're part of a
 	 * video group.
@@ -985,6 +990,9 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 	const struct drm_format_info *info = layer->drm_fmt;
 	unsigned int i;
 
+	if (!layer->disp->dpsub->dma_enabled)
+		return 0;
+
 	for (i = 0; i < info->num_planes; i++) {
 		unsigned int width = state->crtc_w / (i ? info->hsub : 1);
 		unsigned int height = state->crtc_h / (i ? info->vsub : 1);
@@ -1032,7 +1040,7 @@ static void zynqmp_disp_layer_release_dma(struct zynqmp_disp *disp,
 {
 	unsigned int i;
 
-	if (!layer->info)
+	if (!layer->info || !disp->dpsub->dma_enabled)
 		return;
 
 	for (i = 0; i < layer->info->num_channels; i++) {
@@ -1075,6 +1083,9 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
 	unsigned int i;
 	int ret;
 
+	if (!disp->dpsub->dma_enabled)
+		return 0;
+
 	for (i = 0; i < layer->info->num_channels; i++) {
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 		char dma_channel_name[16];
@@ -1217,7 +1228,6 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
 {
 	struct platform_device *pdev = to_platform_device(dpsub->dev);
 	struct zynqmp_disp *disp;
-	struct zynqmp_disp_layer *layer;
 	struct resource *res;
 	int ret;
 
@@ -1253,8 +1263,12 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
 	if (ret)
 		goto error;
 
-	layer = &disp->layers[ZYNQMP_DPSUB_LAYER_VID];
-	dpsub->dma_align = 1 << layer->dmas[0].chan->device->copy_align;
+	if (disp->dpsub->dma_enabled) {
+		struct zynqmp_disp_layer *layer;
+
+		layer = &disp->layers[ZYNQMP_DPSUB_LAYER_VID];
+		dpsub->dma_align = 1 << layer->dmas[0].chan->device->copy_align;
+	}
 
 	dpsub->disp = disp;
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 6627a1ec7791..6e4cd4479de1 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -158,6 +158,7 @@ static int zynqmp_dpsub_parse_dt(struct zynqmp_dpsub *dpsub)
 	if (!np) {
 		dev_warn(dpsub->dev, "missing ports, update DT bindings\n");
 		dpsub->connected_ports = BIT(ZYNQMP_DPSUB_PORT_OUT_DP);
+		dpsub->dma_enabled = true;
 		return 0;
 	}
 
@@ -177,6 +178,8 @@ static int zynqmp_dpsub_parse_dt(struct zynqmp_dpsub *dpsub)
 	    (dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_GFX)))
 		dev_warn(dpsub->dev, "live video unsupported, ignoring\n");
 
+	dpsub->dma_enabled = true;
+
 	if (dpsub->connected_ports & BIT(ZYNQMP_DPSUB_PORT_LIVE_AUDIO))
 		dev_warn(dpsub->dev, "live audio unsupported, ignoring\n");
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 6ded6e45ac0a..09ea01878f2a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -48,6 +48,8 @@ enum zynqmp_dpsub_format {
  * @aud_clk: Audio clock
  * @aud_clk_from_ps: True of the audio clock comes from PS, false from PL
  * @connected_ports: Bitmask of connected ports in the device tree
+ * @dma_enabled: True if the DMA interface is enabled, false if the DPSUB is
+ *	driven by the live input
  * @drm: The DRM/KMS device data
  * @bridge: The DP encoder bridge
  * @disp: The display controller
@@ -64,6 +66,7 @@ struct zynqmp_dpsub {
 	bool aud_clk_from_ps;
 
 	unsigned int connected_ports;
+	bool dma_enabled;
 
 	struct zynqmp_dpsub_drm *drm;
 	struct drm_bridge *bridge;
-- 
Regards,

Laurent Pinchart

