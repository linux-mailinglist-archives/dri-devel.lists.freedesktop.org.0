Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A73E3DA6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325468999E;
	Mon,  9 Aug 2021 01:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822218991D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:13 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC7A6213D;
 Mon,  9 Aug 2021 03:35:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472912;
 bh=4Kmu2LrSZemYfEwvUkOr6rizDAUCMr0joXo+otkcgSE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kpb4AWvMD+Qp5kjpBilzCS3nXMSICl1n89x9UU9EKYRfw1Z+1IXyPzWlHki2Y5Lfa
 43JNqjNy5Blv+0YtjIVvonQHdUJqMjReLW1vEtxlvzSLm9jwcobFoGXYqHuIGDGIk0
 j3PchnIde5OlmpKQdf6YS/7RnPtr114rBc4q64Js=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 19/36] drm: xlnx: zynqmp_dpsub: Move pclk from zynqmp_disp to
 zynqmp_dpsub
Date: Mon,  9 Aug 2021 04:34:40 +0300
Message-Id: <20210809013457.11266-20-laurent.pinchart@ideasonboard.com>
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

The video clock is an external resource from the DPSUB point of view,
not a resource internal to the display controller. Move it to the
zynqmp_dpsub structure, to allow accessing it from outside the disp
code.

While at it, rename the fields from pclk and pclk_from_ps to vid_clk and
vid_clk_from_ps, to better reflect their purpose and match the
documentation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 36 ++++++-----------------------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 17 ++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  4 ++++
 3 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index b88efb6407a7..767ec5e5cfa4 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -168,8 +168,6 @@ struct zynqmp_disp_layer {
  * @audio.clk: Audio clock
  * @audio.clk_from_ps: True of the audio clock comes from PS, false from PL
  * @layers: Layers (planes)
- * @pclk: Pixel clock
- * @pclk_from_ps: True of the video clock comes from PS, false from PL
  */
 struct zynqmp_disp {
 	struct device *dev;
@@ -191,9 +189,6 @@ struct zynqmp_disp {
 	} audio;
 
 	struct zynqmp_disp_layer layers[ZYNQMP_DISP_NUM_LAYERS];
-
-	struct clk *pclk;
-	bool pclk_from_ps;
 };
 
 /* -----------------------------------------------------------------------------
@@ -1407,7 +1402,7 @@ static void zynqmp_disp_enable(struct zynqmp_disp *disp)
 
 	zynqmp_disp_avbuf_enable(disp);
 	/* Choose clock source based on the DT clock handle. */
-	zynqmp_disp_avbuf_set_clocks_sources(disp, disp->pclk_from_ps,
+	zynqmp_disp_avbuf_set_clocks_sources(disp, disp->dpsub->vid_clk_from_ps,
 					     disp->audio.clk_from_ps, true);
 	zynqmp_disp_avbuf_enable_channels(disp);
 	zynqmp_disp_avbuf_enable_audio(disp);
@@ -1435,13 +1430,13 @@ static int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
 	long diff;
 	int ret;
 
-	ret = clk_set_rate(disp->pclk, mode_clock);
+	ret = clk_set_rate(disp->dpsub->vid_clk, mode_clock);
 	if (ret) {
-		dev_err(disp->dev, "failed to set a pixel clock\n");
+		dev_err(disp->dev, "failed to set the video clock\n");
 		return ret;
 	}
 
-	rate = clk_get_rate(disp->pclk);
+	rate = clk_get_rate(disp->dpsub->vid_clk);
 	diff = rate - mode_clock;
 	if (abs(diff) > mode_clock / 20)
 		dev_info(disp->dev,
@@ -1472,9 +1467,9 @@ zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	zynqmp_disp_setup_clock(disp, adjusted_mode->clock * 1000);
 
-	ret = clk_prepare_enable(disp->pclk);
+	ret = clk_prepare_enable(disp->dpsub->vid_clk);
 	if (ret) {
-		dev_err(disp->dev, "failed to enable a pixel clock\n");
+		dev_err(disp->dev, "failed to enable the video clock\n");
 		pm_runtime_put_sync(disp->dev);
 		return;
 	}
@@ -1514,7 +1509,7 @@ zynqmp_disp_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 	spin_unlock_irq(&crtc->dev->event_lock);
 
-	clk_disable_unprepare(disp->pclk);
+	clk_disable_unprepare(disp->dpsub->vid_clk);
 	pm_runtime_put_sync(disp->dev);
 }
 
@@ -1669,23 +1664,6 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	if (IS_ERR(disp->audio.base))
 		return PTR_ERR(disp->audio.base);
 
-	/* Try the live PL video clock */
-	disp->pclk = devm_clk_get(disp->dev, "dp_live_video_in_clk");
-	if (!IS_ERR(disp->pclk))
-		disp->pclk_from_ps = false;
-	else if (PTR_ERR(disp->pclk) == -EPROBE_DEFER)
-		return PTR_ERR(disp->pclk);
-
-	/* If the live PL video clock is not valid, fall back to PS clock */
-	if (IS_ERR_OR_NULL(disp->pclk)) {
-		disp->pclk = devm_clk_get(disp->dev, "dp_vtc_pixel_clk_in");
-		if (IS_ERR(disp->pclk)) {
-			dev_err(disp->dev, "failed to init any video clock\n");
-			return PTR_ERR(disp->pclk);
-		}
-		disp->pclk_from_ps = true;
-	}
-
 	zynqmp_disp_audio_init(disp);
 
 	ret = zynqmp_disp_create_layers(disp);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index a7a80c435fa9..6ef9885644aa 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -216,6 +216,23 @@ static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
 		return ret;
 	}
 
+	/* Try the live PL video clock */
+	dpsub->vid_clk = devm_clk_get(dpsub->dev, "dp_live_video_in_clk");
+	if (!IS_ERR(dpsub->vid_clk))
+		dpsub->vid_clk_from_ps = false;
+	else if (PTR_ERR(dpsub->vid_clk) == -EPROBE_DEFER)
+		return PTR_ERR(dpsub->vid_clk);
+
+	/* If the live PL video clock is not valid, fall back to PS clock */
+	if (IS_ERR_OR_NULL(dpsub->vid_clk)) {
+		dpsub->vid_clk = devm_clk_get(dpsub->dev, "dp_vtc_pixel_clk_in");
+		if (IS_ERR(dpsub->vid_clk)) {
+			dev_err(dpsub->dev, "failed to init any video clock\n");
+			return PTR_ERR(dpsub->vid_clk);
+		}
+		dpsub->vid_clk_from_ps = true;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 82a7ce136c2c..f5500bb2af5e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -33,6 +33,8 @@ enum zynqmp_dpsub_format {
  * @drm: The DRM/KMS device
  * @dev: The physical device
  * @apb_clk: The APB clock
+ * @vid_clk: Video clock
+ * @vid_clk_from_ps: True of the video clock comes from PS, false from PL
  * @encoder: The dummy DRM encoder
  * @connector: The DP connector
  * @bridge: The DP encoder bridge
@@ -45,6 +47,8 @@ struct zynqmp_dpsub {
 	struct device *dev;
 
 	struct clk *apb_clk;
+	struct clk *vid_clk;
+	bool vid_clk_from_ps;
 
 	struct drm_encoder encoder;
 	struct drm_connector *connector;
-- 
Regards,

Laurent Pinchart

