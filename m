Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FB98589AC
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 00:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8642F10ED12;
	Fri, 16 Feb 2024 23:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NG+YMwrA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D681510ED11;
 Fri, 16 Feb 2024 23:03:01 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41GN2xrE002661; Fri, 16 Feb 2024 23:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=vuK6gOxVkwn2lUG9ukK1xht1IrFn/ka7svRgp9SnQls=; b=NG
 +YMwrAwV84fAG/za8YLmH6pRP3V3GQ7I7vOw10TNLLmVGR+ShW5b6lzzYfWSWGtb
 giLlzX39ZOkO6u09E8bnMVXSLgC/FbiIRyc4kpgZYVUdH+d+V3KbqMfw+eRl1QGd
 QoQplD/fibfxJr3MUDh21sk/8TTosDOnf68bcr9c4MTHdOj5ZP5Tz8JRPjuJNf8J
 zEM2x/Jhlle8EWF98hC+74j/t5dh33Ub0Q4B/JCEhVjaF+PoQgMhq6y/47FKaOmS
 dfF02KLUs9wDy/1c1RvDXyWLndRp8EA26vw2LjMo5ZPZGodkzcgRfmYV7lrU/NrO
 L8BRYyp/RCGfIThm+J2w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wa51xhg2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 23:02:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GN2w4E031569
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 23:02:58 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 15:02:58 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v4 16/19] drm/msm/dpu: modify encoder programming for CDM over
 DP
Date: Fri, 16 Feb 2024 15:02:04 -0800
Message-ID: <20240216230228.26713-17-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216230228.26713-1-quic_parellan@quicinc.com>
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OTYas2jwFafVJ3W87hXjslGZFqkU-Aw2
X-Proofpoint-GUID: OTYas2jwFafVJ3W87hXjslGZFqkU-Aw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_22,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160182
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

Adjust the encoder format programming in the case of video mode for DP
to accommodate CDM related changes.

Changes in v4:
	- Remove hw_cdm check in dpu_encoder_needs_periph_flush()
	- Remove hw_cdm check when getting the fmt_fourcc in
	  dpu_encoder_phys_vid_enable()

Changes in v2:
	- Move timing engine programming to a separate patch from this
	  one
	- Move update_pending_flush_periph() invocation completely to
	  this patch
	- Change the logic of dpu_encoder_get_drm_fmt() so that it only
	  calls drm_mode_is_420_only() instead of doing additional
	  unnecessary checks
	- Create new functions msm_dp_needs_periph_flush() and it's
	  supporting function dpu_encoder_needs_periph_flush() to check
	  if the mode is YUV420 and VSC SDP is enabled before doing a
	  peripheral flush

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 35 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 13 +++++++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 16 +++++++++
 drivers/gpu/drm/msm/dp/dp_display.c           | 18 ++++++++++
 drivers/gpu/drm/msm/msm_drv.h                 | 17 ++++++++-
 5 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b53a1b545742b..84778adc7f791 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -218,6 +218,41 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *drm_enc;
+	struct dpu_encoder_virt *dpu_enc;
+	struct drm_display_info *info;
+	struct drm_display_mode *mode;
+
+	drm_enc = phys_enc->parent;
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	info = &dpu_enc->connector->display_info;
+	mode = &phys_enc->cached_mode;
+
+	if (drm_mode_is_420_only(info, mode))
+		return DRM_FORMAT_YUV420;
+
+	return DRM_FORMAT_RGB888;
+}
+
+bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
+{
+	struct drm_encoder *drm_enc;
+	struct dpu_encoder_virt *dpu_enc;
+	struct msm_display_info *disp_info;
+	struct msm_drm_private *priv;
+	struct drm_display_mode *mode;
+
+	drm_enc = phys_enc->parent;
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	disp_info = &dpu_enc->disp_info;
+	priv = drm_enc->dev->dev_private;
+	mode = &phys_enc->cached_mode;
+
+	return phys_enc->hw_intf->cap->type == INTF_DP &&
+	       msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
+}
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index f43d57d9c74e1..211a3d90eb690 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -341,6 +341,19 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
  */
 unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc);
 
+/**
+ * dpu_encoder_get_drm_fmt - return DRM fourcc format
+ * @phys_enc: Pointer to physical encoder structure
+ */
+u32 dpu_encoder_get_drm_fmt(struct dpu_encoder_phys *phys_enc);
+
+/**
+ * dpu_encoder_needs_periph_flush - return true if physical encoder requires
+ *	peripheral flush
+ * @phys_enc: Pointer to physical encoder structure
+ */
+bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc);
+
 /**
  * dpu_encoder_helper_split_config - split display configuration helper function
  *	This helper function may be used by physical encoders to configure
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index f02411b062c4c..86c57c8b7e784 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -415,8 +415,12 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl;
+	const struct dpu_format *fmt;
+	u32 fmt_fourcc;
 
 	ctl = phys_enc->hw_ctl;
+	fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
+	fmt = dpu_get_dpu_format(fmt_fourcc);
 
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
@@ -425,6 +429,8 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 
 	dpu_encoder_helper_split_config(phys_enc, phys_enc->hw_intf->idx);
 
+	dpu_encoder_helper_phys_setup_cdm(phys_enc, fmt, CDM_CDWN_OUTPUT_HDMI);
+
 	dpu_encoder_phys_vid_setup_timing_engine(phys_enc);
 
 	/*
@@ -440,6 +446,16 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 	if (ctl->ops.update_pending_flush_merge_3d && phys_enc->hw_pp->merge_3d)
 		ctl->ops.update_pending_flush_merge_3d(ctl, phys_enc->hw_pp->merge_3d->idx);
 
+	if (ctl->ops.update_pending_flush_cdm && phys_enc->hw_cdm)
+		ctl->ops.update_pending_flush_cdm(ctl, phys_enc->hw_cdm->idx);
+
+	/*
+	 * Peripheral flush must be updated whenever flushing SDP packets is needed.
+	 * SDP packets are required for any YUV format (YUV420, YUV422, YUV444).
+	 */
+	if (ctl->ops.update_pending_flush_periph && dpu_encoder_needs_periph_flush(phys_enc))
+		ctl->ops.update_pending_flush_periph(ctl, phys_enc->hw_intf->idx);
+
 skip_flush:
 	DPU_DEBUG_VIDENC(phys_enc,
 		"update pending flush ctl %d intf %d\n",
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3b7c3a7fd4993..b5a67835ce6d1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1398,6 +1398,24 @@ void __exit msm_dp_unregister(void)
 	platform_driver_unregister(&dp_display_driver);
 }
 
+bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
+			       const struct drm_display_mode *mode)
+{
+	struct dp_display_private *dp;
+	const struct drm_display_info *info;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	info = &dp_display->connector->display_info;
+
+	return dp->panel->vsc_sdp_supported && drm_mode_is_420_only(info, mode);
+}
+
+bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
+			       const struct drm_display_mode *mode)
+{
+	return msm_dp_is_yuv_420_enabled(dp_display, mode);
+}
+
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 {
 	struct dp_display_private *dp;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 16a7cbc0b7dd8..b876ebd48effe 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -387,7 +387,10 @@ void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			 struct drm_encoder *encoder);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
-
+bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
+			       const struct drm_display_mode *mode);
+bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
+			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
 #else
@@ -409,6 +412,18 @@ static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm
 {
 }
 
+static inline bool msm_dp_is_yuv_420_enabled(const struct msm_dp *dp_display,
+					     const struct drm_display_mode *mode)
+{
+	return false;
+}
+
+static inline bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
+					     const struct drm_display_mode *mode)
+{
+	return false;
+}
+
 static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 {
 	return false;
-- 
2.39.2

