Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CD3E3DA5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE56089996;
	Mon,  9 Aug 2021 01:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECBA8991D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:13 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 697D2E57;
 Mon,  9 Aug 2021 03:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472912;
 bh=+ZJKXj5mLPaFaxwiHNi1G+byeSJidVOOrk7c4SFlYJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KHVV/cD5RLDH8yNS/YiJDA8doZo0x8bLmKEJA6aVgSoRB3rmO4zfHO3xNKUU/kPL6
 lQxg7a4Q+WGOWdoyFSfA3unnsaXdeUVxG+s0XyTGe1slFZO6oTDzdhb1k6FW+NX2nb
 dW82XxF5BEN3CJzAwT0ib5vke4hmNGuR4jauaCW8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 20/36] drm: xlnx: zynqmp_dpsub: Move audio clk from
 zynqmp_disp to zynqmp_dpsub
Date: Mon,  9 Aug 2021 04:34:41 +0300
Message-Id: <20210809013457.11266-21-laurent.pinchart@ideasonboard.com>
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

The audio clock is an external resource from the DPSUB point of view,
not a resource internal to the display controller. Move it to the
zynqmp_dpsub structure, to allow accessing it from outside the disp
code.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 54 ++---------------------------
 drivers/gpu/drm/xlnx/zynqmp_disp.h  |  2 --
 drivers/gpu/drm/xlnx/zynqmp_dp.c    |  8 ++---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 54 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  7 ++++
 5 files changed, 65 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 767ec5e5cfa4..bd21eb77589f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -165,8 +165,6 @@ struct zynqmp_disp_layer {
  * @blend.base: Register I/O base address for the blender
  * @avbuf.base: Register I/O base address for the audio/video buffer manager
  * @audio.base: Registers I/O base address for the audio mixer
- * @audio.clk: Audio clock
- * @audio.clk_from_ps: True of the audio clock comes from PS, false from PL
  * @layers: Layers (planes)
  */
 struct zynqmp_disp {
@@ -184,8 +182,6 @@ struct zynqmp_disp {
 	} avbuf;
 	struct {
 		void __iomem *base;
-		struct clk *clk;
-		bool clk_from_ps;
 	} audio;
 
 	struct zynqmp_disp_layer layers[ZYNQMP_DISP_NUM_LAYERS];
@@ -891,25 +887,6 @@ static void zynqmp_disp_audio_disable(struct zynqmp_disp *disp)
 				ZYNQMP_DISP_AUD_SOFT_RESET_AUD_SRST);
 }
 
-static void zynqmp_disp_audio_init(struct zynqmp_disp *disp)
-{
-	/* Try the live PL audio clock. */
-	disp->audio.clk = devm_clk_get(disp->dev, "dp_live_audio_aclk");
-	if (!IS_ERR(disp->audio.clk)) {
-		disp->audio.clk_from_ps = false;
-		return;
-	}
-
-	/* If the live PL audio clock is not valid, fall back to PS clock. */
-	disp->audio.clk = devm_clk_get(disp->dev, "dp_aud_clk");
-	if (!IS_ERR(disp->audio.clk)) {
-		disp->audio.clk_from_ps = true;
-		return;
-	}
-
-	dev_err(disp->dev, "audio disabled due to missing clock\n");
-}
-
 /* -----------------------------------------------------------------------------
  * ZynqMP Display external functions for zynqmp_dp
  */
@@ -928,32 +905,6 @@ void zynqmp_disp_handle_vblank(struct zynqmp_disp *disp)
 	drm_crtc_handle_vblank(crtc);
 }
 
-/**
- * zynqmp_disp_audio_enabled - If the audio is enabled
- * @disp: Display controller
- *
- * Return if the audio is enabled depending on the audio clock.
- *
- * Return: true if audio is enabled, or false.
- */
-bool zynqmp_disp_audio_enabled(struct zynqmp_disp *disp)
-{
-	return !!disp->audio.clk;
-}
-
-/**
- * zynqmp_disp_get_audio_clk_rate - Get the current audio clock rate
- * @disp: Display controller
- *
- * Return: the current audio clock rate.
- */
-unsigned int zynqmp_disp_get_audio_clk_rate(struct zynqmp_disp *disp)
-{
-	if (zynqmp_disp_audio_enabled(disp))
-		return 0;
-	return clk_get_rate(disp->audio.clk);
-}
-
 /**
  * zynqmp_disp_get_crtc_mask - Return the CRTC bit mask
  * @disp: Display controller
@@ -1403,7 +1354,8 @@ static void zynqmp_disp_enable(struct zynqmp_disp *disp)
 	zynqmp_disp_avbuf_enable(disp);
 	/* Choose clock source based on the DT clock handle. */
 	zynqmp_disp_avbuf_set_clocks_sources(disp, disp->dpsub->vid_clk_from_ps,
-					     disp->audio.clk_from_ps, true);
+					     disp->dpsub->aud_clk_from_ps,
+					     true);
 	zynqmp_disp_avbuf_enable_channels(disp);
 	zynqmp_disp_avbuf_enable_audio(disp);
 
@@ -1664,8 +1616,6 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	if (IS_ERR(disp->audio.base))
 		return PTR_ERR(disp->audio.base);
 
-	zynqmp_disp_audio_init(disp);
-
 	ret = zynqmp_disp_create_layers(disp);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index f402901afb23..1b7f90a81857 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -31,8 +31,6 @@ struct zynqmp_disp;
 struct zynqmp_dpsub;
 
 void zynqmp_disp_handle_vblank(struct zynqmp_disp *disp);
-bool zynqmp_disp_audio_enabled(struct zynqmp_disp *disp);
-unsigned int zynqmp_disp_get_audio_clk_rate(struct zynqmp_disp *disp);
 uint32_t zynqmp_disp_get_crtc_mask(struct zynqmp_disp *disp);
 
 int zynqmp_disp_drm_init(struct zynqmp_dpsub *dpsub);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 363015d248ab..7bd5769804e9 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1251,7 +1251,7 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
 		reg = drm_dp_bw_code_to_link_rate(dp->mode.bw_code);
 		zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_N_VID, reg);
 		zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_M_VID, mode->clock);
-		rate = zynqmp_disp_get_audio_clk_rate(dp->dpsub->disp);
+		rate = zynqmp_dpsub_get_audio_clk_rate(dp->dpsub);
 		if (rate) {
 			dev_dbg(dp->dev, "Audio rate: %d\n", rate / 512);
 			zynqmp_dp_write(dp, ZYNQMP_DP_TX_N_AUD, reg);
@@ -1260,7 +1260,7 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
 	}
 
 	/* Only 2 channel audio is supported now */
-	if (zynqmp_disp_audio_enabled(dp->dpsub->disp))
+	if (zynqmp_dpsub_audio_enabled(dp->dpsub))
 		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CHANNELS, 1);
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_USER_PIX_WIDTH, 1);
@@ -1371,7 +1371,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	/* Enable the encoder */
 	dp->enabled = true;
 	zynqmp_dp_update_misc(dp);
-	if (zynqmp_disp_audio_enabled(dp->dpsub->disp))
+	if (zynqmp_dpsub_audio_enabled(dp->dpsub))
 		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 1);
 	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN, 0);
 	if (dp->status == connector_status_connected) {
@@ -1405,7 +1405,7 @@ static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
 	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
 			ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL);
-	if (zynqmp_disp_audio_enabled(dp->dpsub->disp))
+	if (zynqmp_dpsub_audio_enabled(dp->dpsub))
 		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 0);
 	pm_runtime_put_sync(dp->dev);
 }
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 6ef9885644aa..ba52dbed5ba0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -198,6 +198,36 @@ static const struct dev_pm_ops zynqmp_dpsub_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(zynqmp_dpsub_suspend, zynqmp_dpsub_resume)
 };
 
+/* -----------------------------------------------------------------------------
+ * DPSUB Configuration
+ */
+
+/**
+ * zynqmp_dpsub_audio_enabled - If the audio is enabled
+ * @dpsub: DisplayPort subsystem
+ *
+ * Return if the audio is enabled depending on the audio clock.
+ *
+ * Return: true if audio is enabled, or false.
+ */
+bool zynqmp_dpsub_audio_enabled(struct zynqmp_dpsub *dpsub)
+{
+	return !!dpsub->aud_clk;
+}
+
+/**
+ * zynqmp_dpsub_get_audio_clk_rate - Get the current audio clock rate
+ * @dpsub: DisplayPort subsystem
+ *
+ * Return: the current audio clock rate.
+ */
+unsigned int zynqmp_dpsub_get_audio_clk_rate(struct zynqmp_dpsub *dpsub)
+{
+	if (zynqmp_dpsub_audio_enabled(dpsub))
+		return 0;
+	return clk_get_rate(dpsub->aud_clk);
+}
+
 /* -----------------------------------------------------------------------------
  * Probe & Remove
  */
@@ -216,14 +246,16 @@ static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
 		return ret;
 	}
 
-	/* Try the live PL video clock */
+	/*
+	 * Try the live PL video clock, and fall back to the PS clock if the
+	 * live PL video clock isn't valid.
+	 */
 	dpsub->vid_clk = devm_clk_get(dpsub->dev, "dp_live_video_in_clk");
 	if (!IS_ERR(dpsub->vid_clk))
 		dpsub->vid_clk_from_ps = false;
 	else if (PTR_ERR(dpsub->vid_clk) == -EPROBE_DEFER)
 		return PTR_ERR(dpsub->vid_clk);
 
-	/* If the live PL video clock is not valid, fall back to PS clock */
 	if (IS_ERR_OR_NULL(dpsub->vid_clk)) {
 		dpsub->vid_clk = devm_clk_get(dpsub->dev, "dp_vtc_pixel_clk_in");
 		if (IS_ERR(dpsub->vid_clk)) {
@@ -233,6 +265,24 @@ static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
 		dpsub->vid_clk_from_ps = true;
 	}
 
+	/*
+	 * Try the live PL audio clock, and fall back to the PS clock if the
+	 * live PL audio clock isn't valid. Missing audio clock disables audio
+	 * but isn't an error.
+	 */
+	dpsub->aud_clk = devm_clk_get(dpsub->dev, "dp_live_audio_aclk");
+	if (!IS_ERR(dpsub->aud_clk)) {
+		dpsub->aud_clk_from_ps = false;
+		return 0;
+	}
+
+	dpsub->aud_clk = devm_clk_get(dpsub->dev, "dp_aud_clk");
+	if (!IS_ERR(dpsub->aud_clk)) {
+		dpsub->aud_clk_from_ps = true;
+		return 0;
+	}
+
+	dev_info(dpsub->dev, "audio disabled due to missing clock\n");
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index f5500bb2af5e..55d90f4130b2 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -35,6 +35,8 @@ enum zynqmp_dpsub_format {
  * @apb_clk: The APB clock
  * @vid_clk: Video clock
  * @vid_clk_from_ps: True of the video clock comes from PS, false from PL
+ * @aud_clk: Audio clock
+ * @aud_clk_from_ps: True of the audio clock comes from PS, false from PL
  * @encoder: The dummy DRM encoder
  * @connector: The DP connector
  * @bridge: The DP encoder bridge
@@ -49,6 +51,8 @@ struct zynqmp_dpsub {
 	struct clk *apb_clk;
 	struct clk *vid_clk;
 	bool vid_clk_from_ps;
+	struct clk *aud_clk;
+	bool aud_clk_from_ps;
 
 	struct drm_encoder encoder;
 	struct drm_connector *connector;
@@ -65,4 +69,7 @@ static inline struct zynqmp_dpsub *to_zynqmp_dpsub(struct drm_device *drm)
 	return container_of(drm, struct zynqmp_dpsub, drm);
 }
 
+bool zynqmp_dpsub_audio_enabled(struct zynqmp_dpsub *dpsub);
+unsigned int zynqmp_dpsub_get_audio_clk_rate(struct zynqmp_dpsub *dpsub);
+
 #endif /* _ZYNQMP_DPSUB_H_ */
-- 
Regards,

Laurent Pinchart

