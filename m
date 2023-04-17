Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0106E51CD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0010E5E5;
	Mon, 17 Apr 2023 20:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FD510E5E3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 20:21:52 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AD7F93F95F;
 Mon, 17 Apr 2023 22:21:50 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 17 Apr 2023 22:21:48 +0200
Subject: [PATCH v2 09/17] drm/msm/dpu: Move autorefresh disable from CMD
 encoder to pingpong
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v2-9-ef76c877eb97@somainline.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
X-Mailer: b4 0.12.2
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This autorefresh disable logic in the physical command-mode encoder
consumes three callbacks to the pingpong block, and will explode in
unnecessary complexity when the same callbacks need to be called on the
interface block instead to accommodate INTF TE support.  To clean this
up, move the logic into the pingpong block under a disable_autorefresh
callback, replacing the aforementioned three get_autorefresh,
setup_autorefresh and get_vsync_info callbacks.

The same logic will have to be replicated to the interface block when it
receives INTF TE support, but it is less complex than constantly
switching on a "has_intf_te" boolean to choose a callback.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 60 ++--------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    | 47 +++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    | 25 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  4 ++
 4 files changed, 57 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 74470d068622..a60fb8d3736b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -36,10 +36,6 @@
 #define DEFAULT_TEARCHECK_SYNC_THRESH_START	4
 #define DEFAULT_TEARCHECK_SYNC_THRESH_CONTINUE	4
 
-#define DPU_ENC_WR_PTR_START_TIMEOUT_US 20000
-
-#define DPU_ENC_MAX_POLL_TIMEOUT_US	2000
-
 static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc);
 
 static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
@@ -574,28 +570,8 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 			atomic_read(&phys_enc->pending_kickoff_cnt));
 }
 
-static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
-		struct dpu_encoder_phys *phys_enc)
-{
-	struct dpu_hw_pp_vsync_info info;
-
-	if (!phys_enc)
-		return false;
-
-	phys_enc->hw_pp->ops.get_vsync_info(phys_enc->hw_pp, &info);
-	if (info.wr_ptr_line_count > 0 &&
-	    info.wr_ptr_line_count < phys_enc->cached_mode.vdisplay)
-		return true;
-
-	return false;
-}
-
 static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
 {
-	struct dpu_encoder_phys_cmd *cmd_enc =
-		to_dpu_encoder_phys_cmd(phys_enc);
-	int trial = 0;
-
 	if (!phys_enc)
 		return;
 	if (!phys_enc->hw_pp)
@@ -603,37 +579,11 @@ static void dpu_encoder_phys_cmd_enable_te(struct dpu_encoder_phys *phys_enc)
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return;
 
-	/* If autorefresh is already disabled, we have nothing to do */
-	if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
-		return;
-
-	/*
-	 * If autorefresh is enabled, disable it and make sure it is safe to
-	 * proceed with current frame commit/push. Sequence fallowed is,
-	 * 1. Disable TE
-	 * 2. Disable autorefresh config
-	 * 4. Poll for frame transfer ongoing to be false
-	 * 5. Enable TE back
-	 */
-	_dpu_encoder_phys_cmd_connect_te(phys_enc, false);
-	phys_enc->hw_pp->ops.setup_autorefresh(phys_enc->hw_pp, 0, false);
-
-	do {
-		udelay(DPU_ENC_MAX_POLL_TIMEOUT_US);
-		if ((trial * DPU_ENC_MAX_POLL_TIMEOUT_US)
-				> (KICKOFF_TIMEOUT_MS * USEC_PER_MSEC)) {
-			DPU_ERROR_CMDENC(cmd_enc,
-					"disable autorefresh failed\n");
-			break;
-		}
-
-		trial++;
-	} while (dpu_encoder_phys_cmd_is_ongoing_pptx(phys_enc));
-
-	_dpu_encoder_phys_cmd_connect_te(phys_enc, true);
-
-	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc),
-			 "disabled autorefresh\n");
+	if (phys_enc->hw_pp->ops.disable_autorefresh) {
+		phys_enc->hw_pp->ops.disable_autorefresh(phys_enc->hw_pp,
+							 DRMID(phys_enc->parent),
+							 phys_enc->cached_mode.vdisplay);
+	}
 }
 
 static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index b18efd640abd..dea270c0936f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -228,6 +228,49 @@ static u32 dpu_hw_pp_get_line_count(struct dpu_hw_pingpong *pp)
 	return line;
 }
 
+static void dpu_hw_pp_disable_autorefresh(struct dpu_hw_pingpong *pp,
+					  uint32_t encoder_id, u16 vdisplay)
+{
+	struct dpu_hw_pp_vsync_info info;
+	int trial = 0;
+
+	/* If autorefresh is already disabled, we have nothing to do */
+	if (!dpu_hw_pp_get_autorefresh_config(pp, NULL))
+		return;
+
+	/*
+	 * If autorefresh is enabled, disable it and make sure it is safe to
+	 * proceed with current frame commit/push. Sequence followed is,
+	 * 1. Disable TE
+	 * 2. Disable autorefresh config
+	 * 4. Poll for frame transfer ongoing to be false
+	 * 5. Enable TE back
+	 */
+
+	dpu_hw_pp_connect_external_te(pp, false);
+	dpu_hw_pp_setup_autorefresh_config(pp, 0, false);
+
+	do {
+		udelay(DPU_ENC_MAX_POLL_TIMEOUT_US);
+		if ((trial * DPU_ENC_MAX_POLL_TIMEOUT_US)
+				> (KICKOFF_TIMEOUT_MS * USEC_PER_MSEC)) {
+			DPU_ERROR("enc%d pp%d disable autorefresh failed\n",
+				  encoder_id, pp->idx - PINGPONG_0);
+			break;
+		}
+
+		trial++;
+
+		dpu_hw_pp_get_vsync_info(pp, &info);
+	} while (info.wr_ptr_line_count > 0 &&
+		 info.wr_ptr_line_count < vdisplay);
+
+	dpu_hw_pp_connect_external_te(pp, true);
+
+	DPU_DEBUG("enc%d pp%d disabled autorefresh\n",
+		  encoder_id, pp->idx - PINGPONG_0);
+}
+
 static int dpu_hw_pp_dsc_enable(struct dpu_hw_pingpong *pp)
 {
 	struct dpu_hw_blk_reg_map *c = &pp->hw;
@@ -260,10 +303,8 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 	c->ops.setup_tearcheck = dpu_hw_pp_setup_te_config;
 	c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
 	c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
-	c->ops.get_vsync_info = dpu_hw_pp_get_vsync_info;
-	c->ops.setup_autorefresh = dpu_hw_pp_setup_autorefresh_config;
-	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
 	c->ops.get_line_count = dpu_hw_pp_get_line_count;
+	c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
 	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
 	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
 	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index cf94b4ab603b..851b013c4c4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -61,9 +61,6 @@ struct dpu_hw_dither_cfg {
  *  Assumption is these functions will be called after clocks are enabled
  *  @setup_tearcheck : program tear check values
  *  @enable_tearcheck : enables tear check
- *  @get_vsync_info : retries timing info of the panel
- *  @setup_autorefresh : configure and enable the autorefresh config
- *  @get_autorefresh : retrieve autorefresh config from hardware
  *  @setup_dither : function to program the dither hw block
  *  @get_line_count: obtain current vertical line counter
  */
@@ -89,28 +86,14 @@ struct dpu_hw_pingpong_ops {
 			bool enable_external_te);
 
 	/**
-	 * provides the programmed and current
-	 * line_count
-	 */
-	int (*get_vsync_info)(struct dpu_hw_pingpong *pp,
-			struct dpu_hw_pp_vsync_info  *info);
-
-	/**
-	 * configure and enable the autorefresh config
-	 */
-	void (*setup_autorefresh)(struct dpu_hw_pingpong *pp,
-				  u32 frame_count, bool enable);
-
-	/**
-	 * retrieve autorefresh config from hardware
+	 * Obtain current vertical line counter
 	 */
-	bool (*get_autorefresh)(struct dpu_hw_pingpong *pp,
-				u32 *frame_count);
+	u32 (*get_line_count)(struct dpu_hw_pingpong *pp);
 
 	/**
-	 * Obtain current vertical line counter
+	 * Disable autorefresh if enabled
 	 */
-	u32 (*get_line_count)(struct dpu_hw_pingpong *pp);
+	void (*disable_autorefresh)(struct dpu_hw_pingpong *pp, uint32_t encoder_id, u16 vdisplay);
 
 	/**
 	 * Setup dither matix for pingpong block
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f4..e7fc67381c2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -118,6 +118,10 @@ struct vsync_info {
 	u32 line_count;
 };
 
+#define DPU_ENC_WR_PTR_START_TIMEOUT_US 20000
+
+#define DPU_ENC_MAX_POLL_TIMEOUT_US	2000
+
 #define to_dpu_kms(x) container_of(x, struct dpu_kms, base)
 
 #define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)

-- 
2.40.0

