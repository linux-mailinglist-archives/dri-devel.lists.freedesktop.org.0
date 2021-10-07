Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ADF424DDB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 09:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021116F3A5;
	Thu,  7 Oct 2021 07:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A466F39F;
 Thu,  7 Oct 2021 07:09:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7E1060F48;
 Thu,  7 Oct 2021 07:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633590593;
 bh=5SIg1H21MX/hCm1F3bGfCUgLnnWbidC9vJ4dGXhr5AE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V2vPpW6URIXB8EXlO/SWlmEyKJNVd4duIWq+LLfp566GdTAZjz11+z59FdHNgf9/w
 GXNznnesDQ5WlX5SNQN1il46UuIove9eBKzYQPCK9/T1h42LYqm8t65HFeWWAg9gMQ
 zkCkWauhrnihcpNuL7S+hWQRkOQdipz0UIpakY9PD7wuIPbkFfrd6rkWjdXbCjCy0q
 fVGKkqaNcoh1hWObeJX8seTcmqa3ZRg0aEVK2+cAvIqRSJLJALx20wXHh2GZz69bMa
 N4V6GCyDiusns5wQeiAmyH8mgB4AFEHYDj0eQ7c4aB6UjNVQ2BXY2NThoA82pt83df
 6GQg57WP746Ow==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 08/11] drm/msm/disp/dpu1: Add support for DSC in encoder
Date: Thu,  7 Oct 2021 12:38:57 +0530
Message-Id: <20211007070900.456044-9-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007070900.456044-1-vkoul@kernel.org>
References: <20211007070900.456044-1-vkoul@kernel.org>
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

We need to configure the encoder for DSC configuration and calculate DSC
parameters for the given timing so this patch adds that support by
adding dpu_encoder_prep_dsc() which is invoked when DSC is enabled.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes since
v1:
 - Remove duplicate defines
 - Update changelog

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 139 +++++++++++++++++++-
 1 file changed, 138 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0e9d3fa1544b..aac51c1bdf94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -21,6 +21,7 @@
 #include "dpu_hw_intf.h"
 #include "dpu_hw_ctl.h"
 #include "dpu_hw_dspp.h"
+#include "dpu_hw_dsc.h"
 #include "dpu_formats.h"
 #include "dpu_encoder_phys.h"
 #include "dpu_crtc.h"
@@ -136,6 +137,7 @@ enum dpu_enc_rc_states {
  * @cur_slave:		As above but for the slave encoder.
  * @hw_pp:		Handle to the pingpong blocks used for the display. No.
  *			pingpong blocks can be different than num_phys_encs.
+ * @hw_dsc:		Handle to the DSC blocks used for the display.
  * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
  *			for partial update right-only cases, such as pingpong
  *			split where virtual pingpong does not generate IRQs
@@ -181,6 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	bool intfs_swapped;
 
@@ -977,7 +980,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
-	int num_lm, num_ctl, num_pp;
+	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
+	int num_lm, num_ctl, num_pp, num_dsc;
 	int i, j;
 
 	if (!drm_enc) {
@@ -1035,6 +1039,13 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
 						: NULL;
 
+	if (priv->dsc) {
+		num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+			drm_enc->base.id, DPU_HW_BLK_DSC, hw_dsc, ARRAY_SIZE(hw_dsc));
+		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+			dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
+	}
+
 	cstate = to_dpu_crtc_state(drm_crtc->state);
 
 	for (i = 0; i < num_lm; i++) {
@@ -1778,10 +1789,132 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
 			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
 }
 
+static void
+dpu_encoder_dsc_pclk_param_calc(struct msm_display_dsc_config *dsc, u32 width)
+{
+	int slice_count, slice_per_intf;
+	int bytes_in_slice, total_bytes_per_intf;
+
+	if (!dsc || !dsc->drm->slice_width || !dsc->drm->slice_count) {
+		DPU_ERROR("Invalid DSC/slices\n");
+		return;
+	}
+
+	slice_count = dsc->drm->slice_count;
+	slice_per_intf = DIV_ROUND_UP(width, dsc->drm->slice_width);
+
+	/*
+	 * If slice_count is greater than slice_per_intf then default to 1.
+	 * This can happen during partial update.
+	 */
+	if (slice_count > slice_per_intf)
+		slice_count = 1;
+
+	bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
+				      dsc->drm->bits_per_pixel, 8);
+	total_bytes_per_intf = bytes_in_slice * slice_per_intf;
+
+	dsc->eol_byte_num = total_bytes_per_intf % 3;
+	dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
+	dsc->bytes_in_slice = bytes_in_slice;
+	dsc->bytes_per_pkt = bytes_in_slice * slice_count;
+	dsc->pkt_per_line = slice_per_intf / slice_count;
+}
+
+static void
+dpu_encoder_dsc_initial_line_calc(struct msm_display_dsc_config *dsc,
+				  u32 enc_ip_width)
+{
+	int ssm_delay, total_pixels, soft_slice_per_enc;
+
+	soft_slice_per_enc = enc_ip_width / dsc->drm->slice_width;
+
+	/*
+	 * minimum number of initial line pixels is a sum of:
+	 * 1. sub-stream multiplexer delay (83 groups for 8bpc,
+	 *    91 for 10 bpc) * 3
+	 * 2. for two soft slice cases, add extra sub-stream multiplexer * 3
+	 * 3. the initial xmit delay
+	 * 4. total pipeline delay through the "lock step" of encoder (47)
+	 * 5. 6 additional pixels as the output of the rate buffer is
+	 *    48 bits wide
+	 */
+	ssm_delay = ((dsc->drm->bits_per_component < 10) ? 84 : 92);
+	total_pixels = ssm_delay * 3 + dsc->drm->initial_xmit_delay + 47;
+	if (soft_slice_per_enc > 1)
+		total_pixels += (ssm_delay * 3);
+	dsc->initial_lines = DIV_ROUND_UP(total_pixels, dsc->drm->slice_width);
+}
+
+static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
+				     struct dpu_hw_pingpong *hw_pp,
+				     struct msm_display_dsc_config *dsc,
+				     u32 common_mode)
+{
+	if (hw_dsc->ops.dsc_config)
+		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode);
+
+	if (hw_dsc->ops.dsc_config_thresh)
+		hw_dsc->ops.dsc_config_thresh(hw_dsc, dsc);
+
+	if (hw_pp->ops.setup_dsc)
+		hw_pp->ops.setup_dsc(hw_pp);
+
+	if (hw_pp->ops.enable_dsc)
+		hw_pp->ops.enable_dsc(hw_pp);
+}
+
+static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
+				 struct msm_display_dsc_config *dsc)
+{
+	/* coding only for 2LM, 2enc, 1 dsc config */
+	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
+	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
+	int this_frame_slices;
+	int intf_ip_w, enc_ip_w;
+	int dsc_common_mode;
+	int pic_width;
+	int i;
+
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		hw_pp[i] = dpu_enc->hw_pp[i];
+		hw_dsc[i] = dpu_enc->hw_dsc[i];
+
+		if (!hw_pp[i] || !hw_dsc[i]) {
+			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
+			return;
+		}
+	}
+
+	dsc_common_mode = 0;
+	pic_width = dsc->drm->pic_width;
+
+	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
+	if (enc_master->intf_mode == INTF_MODE_VIDEO)
+		dsc_common_mode |= DSC_MODE_VIDEO;
+
+	this_frame_slices = pic_width / dsc->drm->slice_width;
+	intf_ip_w = this_frame_slices * dsc->drm->slice_width;
+
+	dpu_encoder_dsc_pclk_param_calc(dsc, intf_ip_w);
+
+	/*
+	 * dsc merge case: when using 2 encoders for the same stream,
+	 * no. of slices need to be same on both the encoders.
+	 */
+	enc_ip_w = intf_ip_w / 2;
+	dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
+
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
+		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode);
+}
+
 void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	struct dpu_encoder_phys *phys;
+	struct msm_drm_private *priv;
 	bool needs_hw_reset = false;
 	unsigned int i;
 
@@ -1809,6 +1942,10 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 			dpu_encoder_helper_hw_reset(dpu_enc->phys_encs[i]);
 		}
 	}
+
+	priv = drm_enc->dev->dev_private;
+	if (priv->dsc)
+		dpu_encoder_prep_dsc(dpu_enc, priv->dsc);
 }
 
 void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
-- 
2.31.1

