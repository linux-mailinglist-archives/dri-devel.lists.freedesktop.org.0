Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A26256FE16
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 12:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034818D563;
	Mon, 11 Jul 2022 10:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7DF8D55A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:04:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id w2so5580802ljj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 03:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8YXwYwGqXc3fSLxS0iC4eMPVNvIzUhTbrHj5saQFqpE=;
 b=R8FOIpm/0cJaEpC+7YTQH3kPida+1TMrG8x5D5m5ykILudsdwXJSBSR3MVPmtcG+xb
 vHL1qlJQXsQrWe/ARxxW39ub9pVTwUz9hoC7mHUy+y5qjOuhnImT6EbwqpoH6jWQZ2R6
 oZHhjnqkYjyhKlWqOzU7K6WJaeXV7XY2HXpKUO95ZPQR9rl30eGukZr1Mf4U2L8F7rkZ
 QQFPvk9oKHaUp/i/fARVWrVpos2O9jF8XTfkOUgunpkkMD2+CETe7oG+COYncvKxjP8l
 Iivr5pmqMoPgyJBAthTK4OsLvjSrFmbaclGclG5g71vRxhLadgrFzDuXaf3rvY1D16Vd
 syUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8YXwYwGqXc3fSLxS0iC4eMPVNvIzUhTbrHj5saQFqpE=;
 b=lr5uRd6nQSkdLE6z1yXDoFnRslmcWnnFtdFlKyj6VLEyhtB+l0FtcvHvu1yw/otcf3
 rF2lPvI6X1yBGJXhEiOIpZ5eMOLnp/3WP5YY2aynVMQ5Rv97FvcT0NRAGjPoFntiHOh3
 hgyP51dVoJ7G207f853gm6sZK8k+61Dls+ZzqQJBVtVpdnTXqUotBbVW/go0uD67ffdq
 Se6fbbAZAroRqfoNhBqz5Js0re7xw1V1hWx5+dloQvN/BmLAAO1beF4sFlh8wFFawNPj
 8dHs6+O44Qra8YWrJGt0ymPdDXFFD/dMACXnNsWWHi6gNA+QJcdWW/fP8ur9T80ac5TA
 qdsw==
X-Gm-Message-State: AJIora8THC601XjLbcfvdE73GHJmyFeqfrv7CYmTjuvyHEq4yz0chx4Y
 IW12vKgG4+Wl3byg1Z5nhoM57g==
X-Google-Smtp-Source: AGRyM1sd00FHL7G8+5APGm2nDbRNZiNWiLezNzzK43EyGfZ4bSijoOwzqqazHDfQKxKJ/zGpzyEjbg==
X-Received: by 2002:a05:651c:1699:b0:25b:c598:3803 with SMTP id
 bd25-20020a05651c169900b0025bc5983803mr9769524ljb.0.1657533874440; 
 Mon, 11 Jul 2022 03:04:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b0047faab456cesm1442882lfr.237.2022.07.11.03.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 03:04:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 1/2] drm/msm/dpu: use drm_dsc_config instead of
 msm_display_dsc_config
Date: Mon, 11 Jul 2022 13:04:31 +0300
Message-Id: <20220711100432.455268-2-dmitry.baryshkov@linaro.org>
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
the dpu driver, use the struct drm_dsc_config directly to pass pps data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c  | 74 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h  |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 5 files changed, 54 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c682d4e02d1b..07b22b7df2e9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -162,7 +162,7 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
- * @dsc:			msm_display_dsc_config pointer, for DSC-enabled encoders
+ * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
@@ -208,7 +208,7 @@ struct dpu_encoder_virt {
 	bool wide_bus_en;
 
 	/* DSC configuration */
-	struct msm_display_dsc_config *dsc;
+	struct drm_dsc_config *dsc;
 };
 
 #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
@@ -1791,12 +1791,12 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
 }
 
 static u32
-dpu_encoder_dsc_initial_line_calc(struct msm_display_dsc_config *dsc,
+dpu_encoder_dsc_initial_line_calc(struct drm_dsc_config *dsc,
 				  u32 enc_ip_width)
 {
 	int ssm_delay, total_pixels, soft_slice_per_enc;
 
-	soft_slice_per_enc = enc_ip_width / dsc->drm->slice_width;
+	soft_slice_per_enc = enc_ip_width / dsc->slice_width;
 
 	/*
 	 * minimum number of initial line pixels is a sum of:
@@ -1808,16 +1808,16 @@ dpu_encoder_dsc_initial_line_calc(struct msm_display_dsc_config *dsc,
 	 * 5. 6 additional pixels as the output of the rate buffer is
 	 *    48 bits wide
 	 */
-	ssm_delay = ((dsc->drm->bits_per_component < 10) ? 84 : 92);
-	total_pixels = ssm_delay * 3 + dsc->drm->initial_xmit_delay + 47;
+	ssm_delay = ((dsc->bits_per_component < 10) ? 84 : 92);
+	total_pixels = ssm_delay * 3 + dsc->initial_xmit_delay + 47;
 	if (soft_slice_per_enc > 1)
 		total_pixels += (ssm_delay * 3);
-	return DIV_ROUND_UP(total_pixels, dsc->drm->slice_width);
+	return DIV_ROUND_UP(total_pixels, dsc->slice_width);
 }
 
 static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
 				     struct dpu_hw_pingpong *hw_pp,
-				     struct msm_display_dsc_config *dsc,
+				     struct drm_dsc_config *dsc,
 				     u32 common_mode,
 				     u32 initial_lines)
 {
@@ -1835,7 +1835,7 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
 }
 
 static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
-				 struct msm_display_dsc_config *dsc)
+				 struct drm_dsc_config *dsc)
 {
 	/* coding only for 2LM, 2enc, 1 dsc config */
 	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
@@ -1858,14 +1858,15 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
 		}
 	}
 
-	pic_width = dsc->drm->pic_width;
+	dsc_common_mode = 0;
+	pic_width = dsc->pic_width;
 
 	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
 	if (enc_master->intf_mode == INTF_MODE_VIDEO)
 		dsc_common_mode |= DSC_MODE_VIDEO;
 
-	this_frame_slices = pic_width / dsc->drm->slice_width;
-	intf_ip_w = this_frame_slices * dsc->drm->slice_width;
+	this_frame_slices = pic_width / dsc->slice_width;
+	intf_ip_w = this_frame_slices * dsc->slice_width;
 
 	/*
 	 * dsc merge case: when using 2 encoders for the same stream,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index d4d1ecd416e3..9e7236ef34e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -36,7 +36,7 @@ struct msm_display_info {
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
 	bool is_te_using_watchdog_timer;
-	struct msm_display_dsc_config *dsc;
+	struct drm_dsc_config *dsc;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 184a1b27b13d..20a033cd323d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -37,7 +37,7 @@ static void dpu_hw_dsc_disable(struct dpu_hw_dsc *dsc)
 }
 
 static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
-			      struct msm_display_dsc_config *dsc,
+			      struct drm_dsc_config *dsc,
 			      u32 mode,
 			      u32 initial_lines)
 {
@@ -52,89 +52,89 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc *hw_dsc,
 	if (is_cmd_mode)
 		initial_lines += 1;
 
-	slice_last_group_size = 3 - (dsc->drm->slice_width % 3);
+	slice_last_group_size = 3 - (dsc->slice_width % 3);
 	data = (initial_lines << 20);
 	data |= ((slice_last_group_size - 1) << 18);
 	/* bpp is 6.4 format, 4 LSBs bits are for fractional part */
-	data |= dsc->drm->bits_per_pixel << 12;
-	lsb = dsc->drm->bits_per_pixel % 4;
-	bpp = dsc->drm->bits_per_pixel / 4;
+	data |= dsc->bits_per_pixel << 12;
+	lsb = dsc->bits_per_pixel % 4;
+	bpp = dsc->bits_per_pixel / 4;
 	bpp *= 4;
 	bpp <<= 4;
 	bpp |= lsb;
 
 	data |= bpp << 8;
-	data |= (dsc->drm->block_pred_enable << 7);
-	data |= (dsc->drm->line_buf_depth << 3);
-	data |= (dsc->drm->simple_422 << 2);
-	data |= (dsc->drm->convert_rgb << 1);
-	data |= dsc->drm->bits_per_component;
+	data |= (dsc->block_pred_enable << 7);
+	data |= (dsc->line_buf_depth << 3);
+	data |= (dsc->simple_422 << 2);
+	data |= (dsc->convert_rgb << 1);
+	data |= dsc->bits_per_component;
 
 	DPU_REG_WRITE(c, DSC_ENC, data);
 
-	data = dsc->drm->pic_width << 16;
-	data |= dsc->drm->pic_height;
+	data = dsc->pic_width << 16;
+	data |= dsc->pic_height;
 	DPU_REG_WRITE(c, DSC_PICTURE, data);
 
-	data = dsc->drm->slice_width << 16;
-	data |= dsc->drm->slice_height;
+	data = dsc->slice_width << 16;
+	data |= dsc->slice_height;
 	DPU_REG_WRITE(c, DSC_SLICE, data);
 
-	data = dsc->drm->slice_chunk_size << 16;
+	data = dsc->slice_chunk_size << 16;
 	DPU_REG_WRITE(c, DSC_CHUNK_SIZE, data);
 
-	data = dsc->drm->initial_dec_delay << 16;
-	data |= dsc->drm->initial_xmit_delay;
+	data = dsc->initial_dec_delay << 16;
+	data |= dsc->initial_xmit_delay;
 	DPU_REG_WRITE(c, DSC_DELAY, data);
 
-	data = dsc->drm->initial_scale_value;
+	data = dsc->initial_scale_value;
 	DPU_REG_WRITE(c, DSC_SCALE_INITIAL, data);
 
-	data = dsc->drm->scale_decrement_interval;
+	data = dsc->scale_decrement_interval;
 	DPU_REG_WRITE(c, DSC_SCALE_DEC_INTERVAL, data);
 
-	data = dsc->drm->scale_increment_interval;
+	data = dsc->scale_increment_interval;
 	DPU_REG_WRITE(c, DSC_SCALE_INC_INTERVAL, data);
 
-	data = dsc->drm->first_line_bpg_offset;
+	data = dsc->first_line_bpg_offset;
 	DPU_REG_WRITE(c, DSC_FIRST_LINE_BPG_OFFSET, data);
 
-	data = dsc->drm->nfl_bpg_offset << 16;
-	data |= dsc->drm->slice_bpg_offset;
+	data = dsc->nfl_bpg_offset << 16;
+	data |= dsc->slice_bpg_offset;
 	DPU_REG_WRITE(c, DSC_BPG_OFFSET, data);
 
-	data = dsc->drm->initial_offset << 16;
-	data |= dsc->drm->final_offset;
+	data = dsc->initial_offset << 16;
+	data |= dsc->final_offset;
 	DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
 
-	det_thresh_flatness = 7 + 2 * (dsc->drm->bits_per_component - 8);
+	det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
 	data = det_thresh_flatness << 10;
-	data |= dsc->drm->flatness_max_qp << 5;
-	data |= dsc->drm->flatness_min_qp;
+	data |= dsc->flatness_max_qp << 5;
+	data |= dsc->flatness_min_qp;
 	DPU_REG_WRITE(c, DSC_FLATNESS, data);
 
-	data = dsc->drm->rc_model_size;
+	data = dsc->rc_model_size;
 	DPU_REG_WRITE(c, DSC_RC_MODEL_SIZE, data);
 
-	data = dsc->drm->rc_tgt_offset_low << 18;
-	data |= dsc->drm->rc_tgt_offset_high << 14;
-	data |= dsc->drm->rc_quant_incr_limit1 << 9;
-	data |= dsc->drm->rc_quant_incr_limit0 << 4;
-	data |= dsc->drm->rc_edge_factor;
+	data = dsc->rc_tgt_offset_low << 18;
+	data |= dsc->rc_tgt_offset_high << 14;
+	data |= dsc->rc_quant_incr_limit1 << 9;
+	data |= dsc->rc_quant_incr_limit0 << 4;
+	data |= dsc->rc_edge_factor;
 	DPU_REG_WRITE(c, DSC_RC, data);
 }
 
 static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
-				     struct msm_display_dsc_config *dsc)
+				     struct drm_dsc_config *dsc)
 {
-	struct drm_dsc_rc_range_parameters *rc = dsc->drm->rc_range_params;
+	struct drm_dsc_rc_range_parameters *rc = dsc->rc_range_params;
 	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
 	u32 off;
 	int i;
 
 	off = DSC_RC_BUF_THRESH;
 	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++) {
-		DPU_REG_WRITE(c, off, dsc->drm->rc_buf_thresh[i]);
+		DPU_REG_WRITE(c, off, dsc->rc_buf_thresh[i]);
 		off += 4;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index 45e4118f1fa2..c0b77fe1a696 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -31,7 +31,7 @@ struct dpu_hw_dsc_ops {
 	 * @initial_lines: amount of initial lines to be used
 	 */
 	void (*dsc_config)(struct dpu_hw_dsc *hw_dsc,
-			   struct msm_display_dsc_config *dsc,
+			   struct drm_dsc_config *dsc,
 			   u32 mode,
 			   u32 initial_lines);
 
@@ -41,7 +41,7 @@ struct dpu_hw_dsc_ops {
 	 * @dsc: panel dsc parameters
 	 */
 	void (*dsc_config_thresh)(struct dpu_hw_dsc *hw_dsc,
-				  struct msm_display_dsc_config *dsc);
+				  struct drm_dsc_config *dsc);
 };
 
 struct dpu_hw_dsc {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 75ed2b36e1b3..8016d0a3aade 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -585,7 +585,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 		info.h_tile_instance[info.num_of_h_tiles++] = i;
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
 
-		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i]);
+		info.dsc = msm_dsi_get_dsc_config(priv->dsi[i])->drm;
 
 		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
 			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
-- 
2.35.1

