Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E3B424DC0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 09:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623CF6F38A;
	Thu,  7 Oct 2021 07:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B516F38A;
 Thu,  7 Oct 2021 07:09:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7856560F48;
 Thu,  7 Oct 2021 07:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633590557;
 bh=xS7+sa6ZJW9G5NUTaitZ/9/LN/RVQ/coK+YcqMcOlp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fMtQJ/ulVAeU9Dyz4omFGXd6yMiOcYfyNEDAZC45PC0EE4IJUsOs8TWCvP6dANlER
 m4U5Z0mGjD+VoeeTp9FdNbRp6+dntsh4AKcY+ppHKxNnYuDIb+pjS8YS7XhdMPt5sD
 wOC/A+4bi4sBu822azyJCXP0cZnLUrHBVEvT4dGsvMut1K9QDSfyOSInhYfkHGOjhw
 K4FmSi8LIUt/CnDz9ATRIsBboS4Jfw66SZr0MDj+k46cEl7AaATcolh5kDG1RnS1GA
 UGgoKYTZpuFALllSu3BirdSG+ACk58/aB/POwbpw4rCVo1X+WMSVpb3BnZjLN1dkv4
 MJlGiZbqnXh8g==
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
Subject: [PATCH v2 01/11] drm/msm/dsi: add support for dsc data
Date: Thu,  7 Oct 2021 12:38:50 +0530
Message-Id: <20211007070900.456044-2-vkoul@kernel.org>
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

Display Stream Compression (DSC) parameters need to be calculated. Add
helpers and struct msm_display_dsc_config in msm_drv for this
msm_display_dsc_config uses drm_dsc_config for DSC parameters.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes since
v1:
 - Drop unused fields from msm_display_dsc_config
RFC:
 - Drop the DT parsing code
 - Port dsc param calculation from downstream

 drivers/gpu/drm/msm/dsi/dsi_host.c | 132 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h      |  18 ++++
 2 files changed, 150 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..ba24458c2e38 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -31,6 +31,8 @@
 
 #define DSI_RESET_TOGGLE_DELAY_MS 20
 
+static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc);
+
 static int dsi_get_version(const void __iomem *base, u32 *major, u32 *minor)
 {
 	u32 ver;
@@ -156,6 +158,7 @@ struct msm_dsi_host {
 	struct regmap *sfpb;
 
 	struct drm_display_mode *mode;
+	struct msm_display_dsc_config *dsc;
 
 	/* connected device info */
 	struct device_node *device_node;
@@ -1748,6 +1751,135 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
 	return -EINVAL;
 }
 
+static u32 dsi_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
+	0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54, 0x62,
+	0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
+};
+
+/* only 8bpc, 8bpp added */
+static char min_qp[DSC_NUM_BUF_RANGES] = {
+	0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13
+};
+
+static char max_qp[DSC_NUM_BUF_RANGES] = {
+	4, 4, 5, 6, 7, 7, 7, 8, 9, 10, 11, 12, 13, 13, 15
+};
+
+static char bpg_offset[DSC_NUM_BUF_RANGES] = {
+	2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
+};
+
+static int dsi_populate_dsc_params(struct msm_display_dsc_config *dsc)
+{
+	int mux_words_size;
+	int groups_per_line, groups_total;
+	int min_rate_buffer_size;
+	int hrd_delay;
+	int pre_num_extra_mux_bits, num_extra_mux_bits;
+	int slice_bits;
+	int target_bpp_x16;
+	int data;
+	int final_value, final_scale;
+	int i;
+
+	dsc->drm->rc_model_size = 8192;
+	dsc->drm->first_line_bpg_offset = 12;
+	dsc->drm->rc_edge_factor = 6;
+	dsc->drm->rc_tgt_offset_high = 3;
+	dsc->drm->rc_tgt_offset_low = 3;
+	dsc->drm->simple_422 = 0;
+	dsc->drm->convert_rgb = 1;
+	dsc->drm->vbr_enable = 0;
+
+	/* handle only bpp = bpc = 8 */
+	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
+		dsc->drm->rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
+
+	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
+		dsc->drm->rc_range_params[i].range_min_qp = min_qp[i];
+		dsc->drm->rc_range_params[i].range_max_qp = max_qp[i];
+		dsc->drm->rc_range_params[i].range_bpg_offset = bpg_offset[i];
+	}
+
+	dsc->drm->initial_offset = 6144; /* Not bpp 12 */
+	if (dsc->drm->bits_per_pixel != 8)
+		dsc->drm->initial_offset = 2048;	/* bpp = 12 */
+
+	mux_words_size = 48;		/* bpc == 8/10 */
+	if (dsc->drm->bits_per_component == 12)
+		mux_words_size = 64;
+
+	dsc->drm->initial_xmit_delay = 512;
+	dsc->drm->initial_scale_value = 32;
+	dsc->drm->first_line_bpg_offset = 12;
+	dsc->drm->line_buf_depth = dsc->drm->bits_per_component + 1;
+
+	/* bpc 8 */
+	dsc->drm->flatness_min_qp = 3;
+	dsc->drm->flatness_max_qp = 12;
+	dsc->det_thresh_flatness = 7 + 2 * (dsc->drm->bits_per_component - 8);
+	dsc->drm->rc_quant_incr_limit0 = 11;
+	dsc->drm->rc_quant_incr_limit1 = 11;
+	dsc->drm->mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
+
+	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
+	 * params are calculated
+	 */
+	dsc->slice_last_group_size = 3 - (dsc->drm->slice_width % 3);
+	groups_per_line = DIV_ROUND_UP(dsc->drm->slice_width, 3);
+	dsc->drm->slice_chunk_size = dsc->drm->slice_width * dsc->drm->bits_per_pixel / 8;
+	if ((dsc->drm->slice_width * dsc->drm->bits_per_pixel) % 8)
+		dsc->drm->slice_chunk_size++;
+
+	/* rbs-min */
+	min_rate_buffer_size =  dsc->drm->rc_model_size - dsc->drm->initial_offset +
+				dsc->drm->initial_xmit_delay * dsc->drm->bits_per_pixel +
+				groups_per_line * dsc->drm->first_line_bpg_offset;
+
+	hrd_delay = DIV_ROUND_UP(min_rate_buffer_size, dsc->drm->bits_per_pixel);
+
+	dsc->drm->initial_dec_delay = hrd_delay - dsc->drm->initial_xmit_delay;
+
+	dsc->drm->initial_scale_value = 8 * dsc->drm->rc_model_size /
+				       (dsc->drm->rc_model_size - dsc->drm->initial_offset);
+
+	slice_bits = 8 * dsc->drm->slice_chunk_size * dsc->drm->slice_height;
+
+	groups_total = groups_per_line * dsc->drm->slice_height;
+
+	data = dsc->drm->first_line_bpg_offset * 2048;
+
+	dsc->drm->nfl_bpg_offset = DIV_ROUND_UP(data, (dsc->drm->slice_height - 1));
+
+	pre_num_extra_mux_bits = 3 * (mux_words_size + (4 * dsc->drm->bits_per_component + 4) - 2);
+
+	num_extra_mux_bits = pre_num_extra_mux_bits - (mux_words_size -
+			     ((slice_bits - pre_num_extra_mux_bits) % mux_words_size));
+
+	data = 2048 * (dsc->drm->rc_model_size - dsc->drm->initial_offset + num_extra_mux_bits);
+	dsc->drm->slice_bpg_offset = DIV_ROUND_UP(data, groups_total);
+
+	/* bpp * 16 + 0.5 */
+	data = dsc->drm->bits_per_pixel * 16;
+	data *= 2;
+	data++;
+	data /= 2;
+	target_bpp_x16 = data;
+
+	data = (dsc->drm->initial_xmit_delay * target_bpp_x16) / 16;
+	final_value =  dsc->drm->rc_model_size - data + num_extra_mux_bits;
+	dsc->drm->final_offset = final_value;
+
+	final_scale = 8 * dsc->drm->rc_model_size / (dsc->drm->rc_model_size - final_value);
+
+	data = (final_scale - 9) * (dsc->drm->nfl_bpg_offset + dsc->drm->slice_bpg_offset);
+	dsc->drm->scale_increment_interval = (2048 * dsc->drm->final_offset) / data;
+
+	dsc->drm->scale_decrement_interval = groups_per_line / (dsc->drm->initial_scale_value - 8);
+
+	return 0;
+}
+
 static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 {
 	struct device *dev = &msm_host->pdev->dev;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 8b005d1ac899..367eb1092374 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -30,6 +30,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_dsc.h>
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
 
@@ -135,6 +136,20 @@ struct msm_drm_thread {
 	struct kthread_worker *worker;
 };
 
+/* DSC config */
+struct msm_display_dsc_config {
+	struct drm_dsc_config *drm;
+
+	u32 initial_lines;
+	u32 pkt_per_line;
+	u32 bytes_in_slice;
+	u32 bytes_per_pkt;
+	u32 eol_byte_num;
+	u32 pclk_per_line;
+	u32 slice_last_group_size;
+	u32 det_thresh_flatness;
+};
+
 struct msm_drm_private {
 
 	struct drm_device *dev;
@@ -229,6 +244,9 @@ struct msm_drm_private {
 	/* Properties */
 	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
 
+	/* DSC configuration */
+	struct msm_display_dsc_config *dsc;
+
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.31.1

