Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803EA6784B8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005FB10E543;
	Mon, 23 Jan 2023 18:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C082310E544;
 Mon, 23 Jan 2023 18:25:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NHlP0E000963; Mon, 23 Jan 2023 18:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=wvGH7/Rlwu45QOGwJN13yXrhRNE0SHq+W0b9xLXNsQs=;
 b=m0XBfHv7USXGDogxjmHHFwyzbGFNalDyXPtOhbcQjffrtqzEmWJHWO/DRbTGhMCVlHvX
 UV693DpfdQ5HDZh383hZdsTesyd825KaW9HXLyfuTUuylpv+hcjtQE+T9aSMlIChYLcF
 zCc4LpAU2I1DWJk4R5EpwFo+mkixQtTC4JWvPSCOWW0NsQINOpwI2P2D0eWks+5NB3t2
 23M5FOzPJ9RLKklraFW9Naa4G9IpXMDIB+wFGwmZr3vXrTzKEDV/FJv9qJbHB/cuUr5p
 l++ctGHAtQquCsF/6227WBfy89OaHuMY+AfQprrh2S4wHR03mBrp9o6rBUCWUqj/d3w0 SA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89f5bjwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:25:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIP6wZ006672
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:25:06 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:25:05 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 12/14] drm/msm/disp/dpu1: revise timing engine programming
 to work for DSC
Date: Mon, 23 Jan 2023 10:24:32 -0800
Message-ID: <1674498274-6010-13-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lS_pj5WykZ6oueGJ-WRvafge6-UlJhoW
X-Proofpoint-GUID: lS_pj5WykZ6oueGJ-WRvafge6-UlJhoW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230176
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current implementation timing engine programming does not consider
compression factors. This patch add consideration of DSC factors
while programming timing engine.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  14 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 132 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   6 +-
 5 files changed, 110 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 2d864f9..3330e185 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -279,6 +279,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	if (phys_enc->hw_pp->merge_3d)
 		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
 
+	phys_enc->hw_intf->hw_rev = phys_enc->dpu_kms->core_rev;
+
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	phys_enc->hw_intf->ops.setup_timing_gen(phys_enc->hw_intf,
 			&timing_params, fmt);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 7b0b092..c6ee789 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -43,16 +43,22 @@
 #define DPU_HW_VER_500	DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
 #define DPU_HW_VER_501	DPU_HW_VER(5, 0, 1) /* sm8150 v2.0 */
 #define DPU_HW_VER_510	DPU_HW_VER(5, 1, 1) /* sc8180 */
-#define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250 */
+#define DPU_HW_VER_600	DPU_HW_VER(6, 0, 0) /* sm8250, kona */
 #define DPU_HW_VER_620	DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
 #define DPU_HW_VER_630	DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
 #define DPU_HW_VER_650	DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
-#define DPU_HW_VER_700	DPU_HW_VER(7, 0, 0) /* sm8350 */
+#define DPU_HW_VER_700	DPU_HW_VER(7, 0, 0) /* sm8350, lahaina */
 #define DPU_HW_VER_720	DPU_HW_VER(7, 2, 0) /* sc7280 */
 #define DPU_HW_VER_800	DPU_HW_VER(8, 0, 0) /* sc8280xp */
-#define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450 */
+#define DPU_HW_VER_810	DPU_HW_VER(8, 1, 0) /* sm8450, waipio */
 #define DPU_HW_VER_900	DPU_HW_VER(9, 0, 0) /* sm8550 */
 
+/* Avoid using below IS_XXX macros outside catalog, use feature bit instead */
+#define IS_DPU_MAJOR_SAME(rev1, rev2)   \
+		(DPU_HW_MAJOR((rev1)) == DPU_HW_MAJOR((rev2)))
+#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
+		(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
+
 #define IS_MSM8996_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_170)
 #define IS_MSM8998_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_300)
 #define IS_SDM845_TARGET(rev) IS_DPU_MAJOR_MINOR_SAME((rev), DPU_HW_VER_400)
@@ -240,6 +246,7 @@ enum {
  * @DPU_INTF_INPUT_CTRL         Supports the setting of pp block from which
  *                              pixel data arrives to this INTF
  * @DPU_INTF_TE                 INTF block has TE configuration support
+ * @DPU_INTF_TE_ALIGN_VSYNC     INTF block has POMS Align vsync support
  * @DPU_DATA_HCTL_EN            Allows data to be transferred at different rate
                                 than video timing
  * @DPU_INTF_MAX
@@ -247,6 +254,7 @@ enum {
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
 	DPU_INTF_TE,
+	DPU_INTF_TE_ALIGN_VSYNC,
 	DPU_DATA_HCTL_EN,
 	DPU_INTF_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 7ce66bf..238efdb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
@@ -44,6 +44,7 @@
 #define   INTF_DEFLICKER_STRNG_COEFF    0x0F4
 #define   INTF_DEFLICKER_WEAK_COEFF     0x0F8
 
+#define   INTF_REG_SPLIT_LINK           0x080
 #define   INTF_DSI_CMD_MODE_TRIGGER_EN  0x084
 #define   INTF_PANEL_FORMAT             0x090
 #define   INTF_TPG_ENABLE               0x100
@@ -65,9 +66,9 @@
 
 #define INTF_CFG_ACTIVE_H_EN	BIT(29)
 #define INTF_CFG_ACTIVE_V_EN	BIT(30)
-
 #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
 #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
+#define INTF_CFG2_ALIGN_VSYNC_TO_TE BIT(16)
 
 #define INTF_MISR_CTRL			0x180
 #define INTF_MISR_SIGNATURE		0x184
@@ -91,6 +92,16 @@ static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
 	return ERR_PTR(-EINVAL);
 }
 
+static inline void _check_and_set_comp_bit(struct dpu_hw_intf *ctx,
+		bool dsc_4hs_merge, bool compression_en, u32 *intf_cfg2)
+{
+	if (((DPU_HW_MAJOR(ctx->hw_rev) >= DPU_HW_MAJOR(DPU_HW_VER_700)) && compression_en)
+		|| (IS_DPU_MAJOR_SAME(ctx->hw_rev, DPU_HW_VER_600) && dsc_4hs_merge))
+		(*intf_cfg2) |= BIT(12);
+	else if (!compression_en)
+		(*intf_cfg2) &= ~BIT(12);
+}
+
 static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 		const struct intf_timing_params *p,
 		const struct dpu_format *fmt)
@@ -113,82 +124,96 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	/* read interface_cfg */
 	intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
 
-	if (ctx->cap->type == INTF_DP)
+	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP)
 		dp_intf = true;
 
 	hsync_period = p->hsync_pulse_width + p->h_back_porch + p->width +
-	p->h_front_porch;
+			p->h_front_porch;
 	vsync_period = p->vsync_pulse_width + p->v_back_porch + p->height +
-	p->v_front_porch;
+			p->v_front_porch;
 
 	display_v_start = ((p->vsync_pulse_width + p->v_back_porch) *
-	hsync_period) + p->hsync_skew;
+			hsync_period) + p->hsync_skew;
 	display_v_end = ((vsync_period - p->v_front_porch) * hsync_period) +
-	p->hsync_skew - 1;
+			p->hsync_skew - 1;
+
+	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
 
 	hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
 	hsync_end_x = hsync_period - p->h_front_porch - 1;
 
-	if (p->width != p->xres) { /* border fill added */
-		active_h_start = hsync_start_x;
-		active_h_end = active_h_start + p->xres - 1;
-	} else {
-		active_h_start = 0;
-		active_h_end = 0;
-	}
-
-	if (p->height != p->yres) { /* border fill added */
-		active_v_start = display_v_start;
-		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
-	} else {
-		active_v_start = 0;
-		active_v_end = 0;
-	}
-
-	if (active_h_end) {
-		active_hctl = (active_h_end << 16) | active_h_start;
-		intf_cfg |= INTF_CFG_ACTIVE_H_EN;
-	} else {
-		active_hctl = 0;
-	}
-
-	if (active_v_end)
-		intf_cfg |= INTF_CFG_ACTIVE_V_EN;
-
-	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
-	display_hctl = (hsync_end_x << 16) | hsync_start_x;
-
 	/*
 	 * DATA_HCTL_EN controls data timing which can be different from
 	 * video timing. It is recommended to enable it for all cases, except
 	 * if compression is enabled in 1 pixel per clock mode
 	 */
+	if (!p->compression_en || p->wide_bus_en)
+		intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
+
 	if (p->wide_bus_en)
-		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
+		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
 
+	/*
+	 * If widebus is disabled:
+	 * For uncompressed stream, the data is valid for the entire active
+	 * window period.
+	 * For compressed stream, data is valid for a shorter time period
+	 * inside the active window depending on the compression ratio.
+	 *
+	 * If widebus is enabled:
+	 * For uncompressed stream, data is valid for only half the active
+	 * window, since the data rate is doubled in this mode.
+	 * p->width holds the adjusted width for DP but unadjusted width for DSI
+	 * For compressed stream, data validity window needs to be adjusted for
+	 * compression ratio and then further halved.
+	 */
 	data_width = p->width;
 
+	if (p->compression_en) {
+		if (p->wide_bus_en)
+			data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 6);
+		else
+			data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3);
+	} else if (!dp_intf && p->wide_bus_en) {
+		data_width = p->width >> 1;
+	} else {
+		data_width = p->width;
+	}
+
 	hsync_data_start_x = hsync_start_x;
 	hsync_data_end_x =  hsync_start_x + data_width - 1;
 
+	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 	display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
 
 	if (dp_intf) {
 		/* DP timing adjustment */
 		display_v_start += p->hsync_pulse_width + p->h_back_porch;
 		display_v_end   -= p->h_front_porch;
+	}
+
+	intf_cfg |= INTF_CFG_ACTIVE_H_EN;
+	intf_cfg |= INTF_CFG_ACTIVE_V_EN;
+	active_h_start = hsync_start_x;
+	active_h_end = active_h_start + p->xres - 1;
+	active_v_start = display_v_start;
+	active_v_end = active_v_start + (p->yres * hsync_period) - 1;
 
-		active_h_start = hsync_start_x;
-		active_h_end = active_h_start + p->xres - 1;
-		active_v_start = display_v_start;
-		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
+	active_hctl = (active_h_end << 16) | active_h_start;
 
-		active_hctl = (active_h_end << 16) | active_h_start;
+	if (dp_intf) {
 		display_hctl = active_hctl;
 
-		intf_cfg |= INTF_CFG_ACTIVE_H_EN | INTF_CFG_ACTIVE_V_EN;
+		if (p->compression_en) {
+			active_data_hctl = (hsync_start_x + p->extra_dto_cycles) << 16;
+			active_data_hctl += hsync_start_x;
+
+			display_data_hctl = active_data_hctl;
+		}
 	}
 
+	_check_and_set_comp_bit(ctx, p->dsc_4hs_merge, p->compression_en, &intf_cfg2);
+
 	den_polarity = 0;
 	if (ctx->cap->type == INTF_HDMI) {
 		hsync_polarity = p->yres >= 720 ? 0 : 1;
@@ -202,7 +227,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	}
 	polarity_ctl = (den_polarity << 2) | /*  DEN Polarity  */
 		(vsync_polarity << 1) | /* VSYNC Polarity */
-		(hsync_polarity << 0);  /* HSYNC Polarity */
+		 (hsync_polarity << 0);  /* HSYNC Polarity */
 
 	if (!DPU_FORMAT_IS_YUV(fmt))
 		panel_format = (fmt->bits[C0_G_Y] |
@@ -216,6 +241,17 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 				(COLOR_8BIT << 4) |
 				(0x21 << 8));
 
+	if (p->wide_bus_en)
+		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN;
+
+	/* Synchronize timing engine enable to TE */
+	if ((ctx->cap->features & BIT(DPU_INTF_TE_ALIGN_VSYNC))
+			&& p->poms_align_vsync)
+		intf_cfg2 |= INTF_CFG2_ALIGN_VSYNC_TO_TE;
+
+	if (ctx->cfg.split_link_en)
+		DPU_REG_WRITE(c, INTF_REG_SPLIT_LINK, 0x3);
+
 	DPU_REG_WRITE(c, INTF_HSYNC_CTL, hsync_ctl);
 	DPU_REG_WRITE(c, INTF_VSYNC_PERIOD_F0, vsync_period * hsync_period);
 	DPU_REG_WRITE(c, INTF_VSYNC_PULSE_WIDTH_F0,
@@ -233,11 +269,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
-		DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
-		DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
-		DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
-	}
+	DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
+	DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
+	DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
 }
 
 static void dpu_hw_intf_enable_timing_engine(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 643dd10..57be86d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
  */
 
@@ -10,6 +10,7 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_hw_mdss.h"
 #include "dpu_hw_util.h"
+#include "dpu_hw_top.h"
 
 struct dpu_hw_intf;
 
@@ -33,6 +34,11 @@ struct intf_timing_params {
 	u32 hsync_skew;
 
 	bool wide_bus_en;
+	bool compression_en;
+	u32 extra_dto_cycles;   /* for DP only */
+	bool dsc_4hs_merge;     /* DSC 4HS merge */
+	bool poms_align_vsync;  /* poms with vsync aligned */
+	u32 dce_bytes_per_line;
 };
 
 struct intf_prog_fetch {
@@ -86,11 +92,13 @@ struct dpu_hw_intf_ops {
 
 struct dpu_hw_intf {
 	struct dpu_hw_blk_reg_map hw;
+	u32 hw_rev;	/* mdss hw_rev */
 
 	/* intf */
 	enum dpu_intf idx;
 	const struct dpu_intf_cfg *cap;
 	const struct dpu_mdss_cfg *mdss;
+	struct split_pipe_cfg cfg;
 
 	/* ops */
 	struct dpu_hw_intf_ops ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
index a1a9e44..1212fa2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
@@ -1,5 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _DPU_HW_TOP_H
@@ -34,12 +36,14 @@ struct traffic_shaper_cfg {
  * @intf      : Interface id for main control path
  * @split_flush_en: Allows both the paths to be flushed when master path is
  *              flushed
+ * @split_link_en:  Check if split link is enabled
  */
 struct split_pipe_cfg {
 	bool en;
 	enum dpu_intf_mode mode;
 	enum dpu_intf intf;
 	bool split_flush_en;
+	bool split_link_en;
 };
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

