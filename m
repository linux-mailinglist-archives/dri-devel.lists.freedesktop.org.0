Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991956FE17
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 12:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205698D564;
	Mon, 11 Jul 2022 10:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292218D55F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:04:37 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id r9so5570559ljp.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rkcgHk2NAVn7wF87zct59ERFHaqHncReok/tEG464pM=;
 b=H6ip8EFcqqO3NHMxG6iETjg5BpNNgPxuDyfz0iLw9orvJdH+y+i5PMq7gaT1YgZJRW
 ii25KP5z4ivuKpI7WZPRjJZEhN3FItgfYUepHvyWFKwZ3d/WgWZ3CD+LgQ5UyvU55/Db
 QjjcWGmIrNY4nZ2tosKElRDTBtQzyELEsp7nNjmwBZcrrfkLZs42k07CdXdIgjmIHTA9
 qeouqLJji23LWf0IEoQWW7BGKuKxZdbd8JSjS+ywHGv/6G9ybHBWyrWUnzrMHhoe0+v/
 2NPlhpGG5l24LkHGMJjuB1QzrXg/lJWT+n9DBIX/XllUzf8S5K48WfgryCbGRF/Vr1aL
 /anA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkcgHk2NAVn7wF87zct59ERFHaqHncReok/tEG464pM=;
 b=7C/8eZzQP8PGWHwTjddqgCam3MaEg4PjOe+k+3XVW5su75bYbbMWZZypSdtx5nTaJl
 AIv6O2l9/e8CO3q/NXyoZf6WMMi7TVFFzNoeISAfhpOlSs2dciAm62KPmIDE9X1Ex4ZW
 1z39LhlyN1nYE4SXA7NwS4+xzkVvpIUpb/ORAjfZG1iDdtcd4FKU5AUxE6GULBvXi78r
 H4k7M4P66QVGPs804KxA268fNFKCmm2tcHz+11A46n2xzJNMMdaLaATQpocmMTMCANcC
 E1XRCfpedSKNPcIvbCTRfNIwvPfTnN/trnHDTDN+8DgusB6b1jRQAIz7duV45G3zxF3c
 HxhA==
X-Gm-Message-State: AJIora/EXYZhy2uZ3Keo377yvFYHLcfj/IdFFEwhlyJXjT942fd/NP/S
 6N55hngpPo/bkWhl56DxBEkyzQ==
X-Google-Smtp-Source: AGRyM1vAOVleeqJCo0xYAiqPV70Jd/31zDjMPg2OATc2JCAkA4qbltNDvwx8EN26lA9nRPjlNu8PTw==
X-Received: by 2002:a2e:aa8e:0:b0:25d:5ac8:854d with SMTP id
 bj14-20020a2eaa8e000000b0025d5ac8854dmr8762508ljb.324.1657533875313; 
 Mon, 11 Jul 2022 03:04:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b0047faab456cesm1442882lfr.237.2022.07.11.03.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 03:04:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/2] drm/msm/dsi: use drm_dsc_config instead of
 msm_display_dsc_config
Date: Mon, 11 Jul 2022 13:04:32 +0300
Message-Id: <20220711100432.455268-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711100432.455268-1-dmitry.baryshkov@linaro.org>
References: <20220711100432.455268-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to use the struct msm_display_dsc_config wrapper inside
the dsi driver, use the struct drm_dsc_config directly to pass pps data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.c           |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.h           |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c      | 157 +++++++++++-------------
 drivers/gpu/drm/msm/msm_drv.h           |   9 +-
 5 files changed, 79 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 8016d0a3aade..75ed2b36e1b3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -585,7 +585,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		info.h_tile_instance[info.num_of_h_tiles++] = i;
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
 
-		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i])->drm;
+		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
 
 		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
 			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 1625328fa430..8f1ed31b048a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -21,7 +21,7 @@ bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi)
 	return !(host_flags & MIPI_DSI_MODE_VIDEO);
 }
 
-struct msm_display_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
+struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
 {
 	return msm_dsi_host_get_dsc_config(msm_dsi->host);
 }
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 580a1e6358bf..df46cdda1b43 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -154,7 +154,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
 void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
 void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host);
-struct msm_display_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
+struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host);
 
 /* dsi phy */
 struct msm_dsi_phy;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a34078497af1..15e108be1901 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -33,7 +33,7 @@
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
-static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc);
+static int dsi_populate_dsc_params(struct drm_dsc_config *dsc);
 
 static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
 {
@@ -161,7 +161,7 @@ struct msm_dsi_host {
 	struct regmap *sfpb;
 
 	struct drm_display_mode *mode;
-	struct msm_display_dsc_config *dsc;
+	struct drm_dsc_config *dsc;
 
 	/* connected device info */
 	struct device_node *device_node;
@@ -916,7 +916,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
 
 static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mode, u32 hdisplay)
 {
-	struct msm_display_dsc_config *dsc = msm_host->dsc;
+	struct drm_dsc_config *dsc = msm_host->dsc;
 	u32 reg, intf_width, reg_ctrl, reg_ctrl2;
 	u32 slice_per_intf, total_bytes_per_intf;
 	u32 pkt_per_line;
@@ -927,24 +927,24 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	 * compress mode registers
 	 */
 	intf_width = hdisplay;
-	slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
+	slice_per_intf = DIV_ROUND_UP(intf_width, dsc->slice_width);
 
 	/* If slice_per_pkt is greater than slice_per_intf
 	 * then default to 1. This can happen during partial
 	 * update.
 	 */
-	if (slice_per_intf > dsc->drm->slice_count)
-		dsc->drm->slice_count = 1;
+	if (slice_per_intf > dsc->slice_count)
+		dsc->slice_count = 1;
 
-	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm->slice_width);
-	bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width * dsc->drm->bits_per_pixel, 8);
+	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
+	bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8);
 
-	dsc->drm->slice_chunk_size = bytes_in_slice;
+	dsc->slice_chunk_size = bytes_in_slice;
 
 	total_bytes_per_intf = bytes_in_slice * slice_per_intf;
 
 	eol_byte_num = total_bytes_per_intf % 3;
-	pkt_per_line = slice_per_intf / dsc->drm->slice_count;
+	pkt_per_line = slice_per_intf / dsc->slice_count;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -1009,7 +1009,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	}
 
 	if (msm_host->dsc) {
-		struct msm_display_dsc_config *dsc = msm_host->dsc;
+		struct drm_dsc_config *dsc = msm_host->dsc;
 
 		/* update dsc params with timing params */
 		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
@@ -1018,9 +1018,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			return;
 		}
 
-		dsc->drm->pic_width = mode->hdisplay;
-		dsc->drm->pic_height = mode->vdisplay;
-		DBG("Mode %dx%d\n", dsc->drm->pic_width, dsc->drm->pic_height);
+		dsc->pic_width = mode->hdisplay;
+		dsc->pic_height = mode->vdisplay;
+		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
 
 		/* we do the calculations for dsc parameters here so that
 		 * panel can use these parameters
@@ -1841,7 +1841,7 @@ static char bpg_offset[DSC_NUM_BUF_RANGES] = {
 	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
 };
 
-static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc)
+static int dsi_populate_dsc_params(struct drm_dsc_config *dsc)
 {
 	int mux_words_size;
 	int groups_per_line, groups_total;
@@ -1854,98 +1854,98 @@ static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc)
 	int final_value, final_scale;
 	int i;
 
-	dsc->drm->rc_model_size = 8192;
-	dsc->drm->first_line_bpg_offset = 12;
-	dsc->drm->rc_edge_factor = 6;
-	dsc->drm->rc_tgt_offset_high = 3;
-	dsc->drm->rc_tgt_offset_low = 3;
-	dsc->drm->simple_422 = 0;
-	dsc->drm->convert_rgb = 1;
-	dsc->drm->vbr_enable = 0;
+	dsc->rc_model_size = 8192;
+	dsc->first_line_bpg_offset = 12;
+	dsc->rc_edge_factor = 6;
+	dsc->rc_tgt_offset_high = 3;
+	dsc->rc_tgt_offset_low = 3;
+	dsc->simple_422 = 0;
+	dsc->convert_rgb = 1;
+	dsc->vbr_enable = 0;
 
 	/* handle only bpp = bpc = 8 */
 	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
-		dsc->drm->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
+		dsc->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
 
 	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
-		dsc->drm->rc_range_params[i].range_min_qp = min_qp[i];
-		dsc->drm->rc_range_params[i].range_max_qp = max_qp[i];
-		dsc->drm->rc_range_params[i].range_bpg_offset = bpg_offset[i];
+		dsc->rc_range_params[i].range_min_qp = min_qp[i];
+		dsc->rc_range_params[i].range_max_qp = max_qp[i];
+		dsc->rc_range_params[i].range_bpg_offset = bpg_offset[i];
 	}
 
-	dsc->drm->initial_offset = 6144; /* Not bpp 12 */
-	if (dsc->drm->bits_per_pixel != 8)
-		dsc->drm->initial_offset = 2048;	/* bpp = 12 */
+	dsc->initial_offset = 6144; /* Not bpp 12 */
+	if (dsc->bits_per_pixel != 8)
+		dsc->initial_offset = 2048;	/* bpp = 12 */
 
 	mux_words_size = 48;		/* bpc == 8/10 */
-	if (dsc->drm->bits_per_component == 12)
+	if (dsc->bits_per_component == 12)
 		mux_words_size = 64;
 
-	dsc->drm->initial_xmit_delay = 512;
-	dsc->drm->initial_scale_value = 32;
-	dsc->drm->first_line_bpg_offset = 12;
-	dsc->drm->line_buf_depth = dsc->drm->bits_per_component + 1;
+	dsc->initial_xmit_delay = 512;
+	dsc->initial_scale_value = 32;
+	dsc->first_line_bpg_offset = 12;
+	dsc->line_buf_depth = dsc->bits_per_component + 1;
 
 	/* bpc 8 */
-	dsc->drm->flatness_min_qp = 3;
-	dsc->drm->flatness_max_qp = 12;
-	dsc->drm->rc_quant_incr_limit0 = 11;
-	dsc->drm->rc_quant_incr_limit1 = 11;
-	dsc->drm->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
+	dsc->flatness_min_qp = 3;
+	dsc->flatness_max_qp = 12;
+	dsc->rc_quant_incr_limit0 = 11;
+	dsc->rc_quant_incr_limit1 = 11;
+	dsc->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
 
 	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
 	 * params are calculated
 	 */
-	groups_per_line = DIV_ROUND_UP(dsc->drm->slice_width, 3);
-	dsc->drm->slice_chunk_size = dsc->drm->slice_width * dsc->drm->bits_per_pixel / 8;
-	if ((dsc->drm->slice_width * dsc->drm->bits_per_pixel) % 8)
-		dsc->drm->slice_chunk_size++;
+	groups_per_line = DIV_ROUND_UP(dsc->slice_width, 3);
+	dsc->slice_chunk_size = dsc->slice_width * dsc->bits_per_pixel / 8;
+	if ((dsc->slice_width * dsc->bits_per_pixel) % 8)
+		dsc->slice_chunk_size++;
 
 	/* rbs-min */
-	min_rate_buffer_size =  dsc->drm->rc_model_size - dsc->drm->initial_offset +
-				dsc->drm->initial_xmit_delay * dsc->drm->bits_per_pixel +
-				groups_per_line * dsc->drm->first_line_bpg_offset;
+	min_rate_buffer_size =  dsc->rc_model_size - dsc->initial_offset +
+				dsc->initial_xmit_delay * dsc->bits_per_pixel +
+				groups_per_line * dsc->first_line_bpg_offset;
 
-	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->drm->bits_per_pixel);
+	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->bits_per_pixel);
 
-	dsc->drm->initial_dec_delay = hrd_delay - dsc->drm->initial_xmit_delay;
+	dsc->initial_dec_delay = hrd_delay - dsc->initial_xmit_delay;
 
-	dsc->drm->initial_scale_value = 8 * dsc->drm->rc_model_size /
-				       (dsc->drm->rc_model_size - dsc->drm->initial_offset);
+	dsc->initial_scale_value = 8 * dsc->rc_model_size /
+				       (dsc->rc_model_size - dsc->initial_offset);
 
-	slice_bits = 8 * dsc->drm->slice_chunk_size * dsc->drm->slice_height;
+	slice_bits = 8 * dsc->slice_chunk_size * dsc->slice_height;
 
-	groups_total = groups_per_line * dsc->drm->slice_height;
+	groups_total = groups_per_line * dsc->slice_height;
 
-	data = dsc->drm->first_line_bpg_offset * 2048;
+	data = dsc->first_line_bpg_offset * 2048;
 
-	dsc->drm->nfl_bpg_offset = DIV_ROUND_UP(data, (dsc->drm->slice_height - 1));
+	dsc->nfl_bpg_offset = DIV_ROUND_UP(data, (dsc->slice_height - 1));
 
-	pre_num_extra_mux_bits = 3 * (mux_words_size + (4 * dsc->drm->bits_per_component + 4) - 2);
+	pre_num_extra_mux_bits = 3 * (mux_words_size + (4 * dsc->bits_per_component + 4) - 2);
 
 	num_extra_mux_bits = pre_num_extra_mux_bits - (mux_words_size -
 			     ((slice_bits - pre_num_extra_mux_bits) % mux_words_size));
 
-	data = 2048 * (dsc->drm->rc_model_size - dsc->drm->initial_offset + num_extra_mux_bits);
-	dsc->drm->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
+	data = 2048 * (dsc->rc_model_size - dsc->initial_offset + num_extra_mux_bits);
+	dsc->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
 
 	/* bpp * 16 + 0.5 */
-	data = dsc->drm->bits_per_pixel * 16;
+	data = dsc->bits_per_pixel * 16;
 	data *= 2;
 	data++;
 	data /= 2;
 	target_bpp_x16 = data;
 
-	data = (dsc->drm->initial_xmit_delay * target_bpp_x16) / 16;
-	final_value =  dsc->drm->rc_model_size - data + num_extra_mux_bits;
-	dsc->drm->final_offset = final_value;
+	data = (dsc->initial_xmit_delay * target_bpp_x16) / 16;
+	final_value =  dsc->rc_model_size - data + num_extra_mux_bits;
+	dsc->final_offset = final_value;
 
-	final_scale = 8 * dsc->drm->rc_model_size / (dsc->drm->rc_model_size - final_value);
+	final_scale = 8 * dsc->rc_model_size / (dsc->rc_model_size - final_value);
 
-	data = (final_scale - 9) * (dsc->drm->nfl_bpg_offset + dsc->drm->slice_bpg_offset);
-	dsc->drm->scale_increment_interval = (2048 * dsc->drm->final_offset) / data;
+	data = (final_scale - 9) * (dsc->nfl_bpg_offset + dsc->slice_bpg_offset);
+	dsc->scale_increment_interval = (2048 * dsc->final_offset) / data;
 
-	dsc->drm->scale_decrement_interval = groups_per_line / (dsc->drm->initial_scale_value - 8);
+	dsc->scale_decrement_interval = groups_per_line / (dsc->initial_scale_value - 8);
 
 	return 0;
 }
@@ -2165,17 +2165,8 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	msm_host->dev = dev;
 	panel = msm_dsi_host_get_panel(&msm_host->base);
 
-	if (!IS_ERR(panel) && panel->dsc) {
-		struct msm_display_dsc_config *dsc = msm_host->dsc;
-
-		if (!dsc) {
-			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
-			if (!dsc)
-				return -ENOMEM;
-			dsc->drm = panel->dsc;
-			msm_host->dsc = dsc;
-		}
-	}
+	if (!IS_ERR(panel) && panel->dsc)
+		msm_host->dsc = panel->dsc;
 
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
@@ -2659,22 +2650,22 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
 					    const struct drm_display_mode *mode)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
-	struct msm_display_dsc_config *dsc = msm_host->dsc;
+	struct drm_dsc_config *dsc = msm_host->dsc;
 	int pic_width = mode->hdisplay;
 	int pic_height = mode->vdisplay;
 
 	if (!msm_host->dsc)
 		return MODE_OK;
 
-	if (pic_width % dsc->drm->slice_width) {
+	if (pic_width % dsc->slice_width) {
 		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
-		       pic_width, dsc->drm->slice_width);
+		       pic_width, dsc->slice_width);
 		return MODE_H_ILLEGAL;
 	}
 
-	if (pic_height % dsc->drm->slice_height) {
+	if (pic_height % dsc->slice_height) {
 		pr_err("DSI: pic_height %d has to be multiple of slice %d\n",
-		       pic_height, dsc->drm->slice_height);
+		       pic_height, dsc->slice_height);
 		return MODE_V_ILLEGAL;
 	}
 
@@ -2771,7 +2762,7 @@ void msm_dsi_host_test_pattern_en(struct mipi_dsi_host *host)
 				DSI_TEST_PATTERN_GEN_CMD_STREAM0_TRIGGER_SW_TRIGGER);
 }
 
-struct msm_display_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host)
+struct drm_dsc_config *msm_dsi_host_get_dsc_config(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ae49e56ac026..8075a0e010a5 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -96,11 +96,6 @@ struct msm_drm_thread {
 	struct kthread_worker *worker;
 };
 
-/* DSC config */
-struct msm_display_dsc_config {
-	struct drm_dsc_config *drm;
-};
-
 struct msm_drm_private {
 
 	struct drm_device *dev;
@@ -289,7 +284,7 @@ void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi
 bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi);
-struct msm_display_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
+struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi);
 #else
 static inline void __init msm_dsi_register(void)
 {
@@ -319,7 +314,7 @@ static inline bool msm_dsi_is_master_dsi(struct msm_dsi *msm_dsi)
 	return false;
 }
 
-static inline struct msm_display_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
+static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_dsi)
 {
 	return NULL;
 }
-- 
2.35.1

