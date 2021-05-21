Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124D38C6F1
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52866F63E;
	Fri, 21 May 2021 12:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040A46F629;
 Fri, 21 May 2021 12:50:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 116D3613DF;
 Fri, 21 May 2021 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621601434;
 bh=IJdaAJsGZtOuXPGkO/yJepto4E3r/nhHQEJSn5d6nzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mg84n5785SSsuasRZZAL7KfM6X/vWVQVg9V4H5Quty+P6KbLN0DakaqNPmWvrRKFu
 MtJ6NwrNDzqDSwNje+ToUdKiXLh9c7dK4OSGyb+QcoExyAkF2XeBojqW8P+WANAiKw
 X9IXsZakJg+GbmftXTQ203RW44BY0+742Rar42RS0ZbJuyNZ0faBxZo1zwnUxBnLcN
 Tj7KkoZVXyz/LmFpURNZJ/oVbrK5oJA9jHVhHdsuRyowEFxn242tKi+3BdMf+g3EmM
 SH9c4RzzVyZNlPHfSJlNXDmeTs0VYjgk5J+UdlwQnhiDkIjJkleNfKsSK8mnlfZYtM
 VopQOOR+1OEkg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH 05/13] drm/msm/dsi: add support for dsc data
Date: Fri, 21 May 2021 18:19:37 +0530
Message-Id: <20210521124946.3617862-9-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210521124946.3617862-1-vkoul@kernel.org>
References: <20210521124946.3617862-1-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSC needs some configuration from device tree, add support to read and
store these params and add DSC structures in msm_drv

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 171 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h      |  32 ++++++
 2 files changed, 203 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 8a10e4343281..e0c0f627d15e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -156,6 +156,7 @@ struct msm_dsi_host {
 	struct regmap *sfpb;
 
 	struct drm_display_mode *mode;
+	struct msm_display_dsc_config *dsc;
 
 	/* connected device info */
 	struct device_node *device_node;
@@ -1744,6 +1745,168 @@ static int dsi_host_parse_lane_data(struct msm_dsi_host *msm_host,
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
+	int i;
+
+	dsc->drm.rc_model_size = 8192;
+	dsc->drm.first_line_bpg_offset = 15;
+	dsc->drm.rc_edge_factor = 6;
+	dsc->drm.rc_tgt_offset_high = 3;
+	dsc->drm.rc_tgt_offset_low = 3;
+	dsc->drm.simple_422 = 0;
+	dsc->drm.convert_rgb = 1;
+	dsc->drm.vbr_enable = 0;
+
+	/* handle only bpp = bpc = 8 */
+	for (i = 0; i < DSC_NUM_BUF_RANGES - 1 ; i++)
+		dsc->drm.rc_buf_thresh[i] = dsi_dsc_rc_buf_thresh[i];
+
+	for (i = 0; i < DSC_NUM_BUF_RANGES; i++) {
+		dsc->drm.rc_range_params[i].range_min_qp = min_qp[i];
+		dsc->drm.rc_range_params[i].range_max_qp = max_qp[i];
+		dsc->drm.rc_range_params[i].range_bpg_offset = bpg_offset[i];
+	}
+
+	dsc->drm.initial_offset = 6144;
+	dsc->drm.initial_xmit_delay = 512;
+	dsc->drm.initial_scale_value = 32;
+	dsc->drm.first_line_bpg_offset = 12;
+	dsc->drm.line_buf_depth = dsc->drm.bits_per_component + 1;
+
+	/* bpc 8 */
+	dsc->drm.flatness_min_qp = 3;
+	dsc->drm.flatness_max_qp = 12;
+	dsc->det_thresh_flatness = 7;
+	dsc->drm.rc_quant_incr_limit0 = 11;
+	dsc->drm.rc_quant_incr_limit1 = 11;
+	dsc->drm.mux_word_size = DSC_MUX_WORD_SIZE_8_10_BPC;
+
+	/* FIXME: need to call drm_dsc_compute_rc_parameters() so that rest of
+	 * params are calculated
+	 */
+
+	i = dsc->drm.slice_width % 3;
+	switch (i) {
+	case 0:
+		dsc->slice_last_group_size = 2;
+		break;
+
+	case 1:
+		dsc->slice_last_group_size = 0;
+		break;
+
+	case 2:
+		dsc->slice_last_group_size = 0;
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int dsi_host_parse_dsc(struct msm_dsi_host *msm_host,
+			      struct device_node *np)
+{
+	struct device *dev = &msm_host->pdev->dev;
+	struct msm_display_dsc_config *dsc;
+	bool is_dsc_enabled;
+	u32 data;
+	int ret;
+
+	is_dsc_enabled = of_property_read_bool(np, "qcom,mdss-dsc-enabled");
+
+	if (!is_dsc_enabled)
+		return 0;
+
+	dsc = kzalloc(sizeof(*dsc), GFP_KERNEL);
+	if (!dsc)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(np, "qcom,mdss-dsc-version", &data);
+	if (ret) {
+		dsc->drm.dsc_version_major = 0x1;
+		dsc->drm.dsc_version_minor = 0x1;
+	} else {
+		dsc->drm.dsc_version_major = (data >> 4) & 0xf;
+		dsc->drm.dsc_version_minor = data & 0xf;
+	}
+
+	ret = of_property_read_u32(np, "qcom,mdss-scr-version", &data);
+	if (ret)
+		dsc->scr_rev = 0;
+	else
+		dsc->scr_rev = data & 0xff;
+
+	ret = of_property_read_u32(np, "qcom,mdss-slice-height", &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read dsc slice height\n");
+		goto err;
+	}
+	dsc->drm.slice_height = data;
+
+	ret = of_property_read_u32(np, "qcom,mdss-slice-width", &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read dsc slice width\n");
+		goto err;
+	}
+	dsc->drm.slice_width = data;
+
+	ret = of_property_read_u32(np, "qcom,mdss-slice-per-pkt", &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read mdss-slice-per-pkt\n");
+		goto err;
+	}
+	dsc->slice_per_pkt = data;
+
+	ret = of_property_read_u32(np, "qcom,mdss-bit-per-component", &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read mdss-bit-per-component\n");
+		goto err;
+	}
+	dsc->drm.bits_per_component = data;
+
+	ret = of_property_read_u32(np, "qcom,mdss-bit-per-pixel", &data);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "failed to read bit-per-pixel\n");
+		goto err;
+	}
+	dsc->drm.bits_per_pixel = data;
+
+	dsc->drm.block_pred_enable = of_property_read_bool(np,
+			 "qcom,mdss-block-prediction-enable");
+
+	dsi_populate_dsc_params(dsc);
+
+	msm_host->dsc = dsc;
+
+	return 0;
+
+err:
+	kfree(dsc);
+	return ret;
+}
+
 static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 {
 	struct device *dev = &msm_host->pdev->dev;
@@ -1763,6 +1926,14 @@ static int dsi_host_parse_dt(struct msm_dsi_host *msm_host)
 		return 0;
 	}
 
+	ret = dsi_host_parse_dsc(msm_host, np);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "%s: invalid dsc configuration %d\n",
+			__func__, ret);
+		ret = -EINVAL;
+		goto err;
+	}
+
 	ret = dsi_host_parse_lane_data(msm_host, endpoint);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "%s: invalid lane configuration %d\n",
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2668941df529..26661dd43936 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -30,6 +30,7 @@
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_dsc.h>
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
 
@@ -70,6 +71,16 @@ enum msm_mdp_plane_property {
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
+/**
+ * enum msm_display_compression_type - compression method used for pixel stream
+ * @MSM_DISPLAY_COMPRESSION_NONE:	Pixel data is not compressed
+ * @MSM_DISPLAY_COMPRESSION_DSC:	DSC compresison is used
+ */
+enum msm_display_compression_type {
+	MSM_DISPLAY_COMPRESSION_NONE,
+	MSM_DISPLAY_COMPRESSION_DSC,
+};
+
 /**
  * enum msm_display_caps - features/capabilities supported by displays
  * @MSM_DISPLAY_CAP_VID_MODE:           Video or "active" mode supported
@@ -134,6 +145,24 @@ struct msm_drm_thread {
 	struct kthread_worker *worker;
 };
 
+/* DSC config */
+struct msm_display_dsc_config {
+	struct drm_dsc_config drm;
+	u8 scr_rev;
+
+	u32 initial_lines;
+	u32 pkt_per_line;
+	u32 bytes_in_slice;
+	u32 bytes_per_pkt;
+	u32 eol_byte_num;
+	u32 pclk_per_line;
+	u32 slice_last_group_size;
+	u32 slice_per_pkt;
+	u32 det_thresh_flatness;
+	u32 extra_width;
+	u32 pps_delay_ms;
+};
+
 struct msm_drm_private {
 
 	struct drm_device *dev;
@@ -227,6 +256,9 @@ struct msm_drm_private {
 	/* Properties */
 	struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
 
+	/* DSC configuration */
+	struct msm_display_dsc_config *dsc;
+
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.26.3

