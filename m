Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC164625BCE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 14:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBD310E827;
	Fri, 11 Nov 2022 13:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B460D10E822;
 Fri, 11 Nov 2022 13:57:07 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ABDoaW3002151; Fri, 11 Nov 2022 13:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc : subject : date : message-id; s=qcppdkim1;
 bh=2PT9ekc92Lt0QyNi8JjY4fmIbc6g40PvUICbYND34o4=;
 b=KA5RmwkIJuTeNuVC1P/RELKvZkI12LrSVM3hnh2ZFLH6D/ydAodt2wextWFx8zEpp5b9
 JWYZk/LPIq1j7PygstxOMMeW9ojtblf/nLTwPbW0B2uzs2QvuNehf/JXnkxh/z9mjMoi
 YmbFuFsh12S8q5rPY/7Eixe6J/W3F7DGyQaQeimszbCRSFG+00QZ1aDgbRw40r6sXvNe
 mLh1mrkDJK4LLmiAelbpai8vMV9gzbsVDeptsycICQh7uzeTnHEIb2Kw3R4hCoUfYUjJ
 M1trykNuNDmPw3bG8Q1E/8RJuxjDZZ45j6Bc1lALq17WGsBwMBz2qn75hh2dERouEuFV Ig== 
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ksada22ny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Nov 2022 13:57:05 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2ABDv2oe032184; 
 Fri, 11 Nov 2022 13:57:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3kngwkm2q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 11 Nov 2022 13:57:02 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ABDv1Lt032178;
 Fri, 11 Nov 2022 13:57:01 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 2ABDv1Tt032175;
 Fri, 11 Nov 2022 13:57:01 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id D5B5D3892; Fri, 11 Nov 2022 05:57:00 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [v1] drm/msm/disp/dpu1: populate disp_info with connector type
Date: Fri, 11 Nov 2022 05:56:59 -0800
Message-Id: <1668175019-10960-1-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: e3xo3x1DB_6eXyQ3ETBigcsHHaPRvXY3
X-Proofpoint-GUID: e3xo3x1DB_6eXyQ3ETBigcsHHaPRvXY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_08,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110093
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, robdclark@chromium.org,
 dianders@chromium.org, quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, dmitry.baryshkov@linaro.org, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Populate disp_info with connector type. Since DRM encoder type
for few encoders can be similar (like eDP and DP) this information
will be useful to differentiate interfaces.

Changes in v1:
- add connector type in the disp_info (Dmitry)
- add helper functions to know encoder type
- update commit text reflecting the change

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 26 +++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 ++
 drivers/gpu/drm/msm/dp/dp_display.c         |  5 ++++
 drivers/gpu/drm/msm/msm_drv.h               |  7 ++++-
 5 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b..c9058aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -217,6 +217,40 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
 };
 
+bool dpu_encoder_is_external(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+
+	if (!drm_enc)
+		return false;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	return (dpu_enc->disp_info.connector_type ==
+			DRM_MODE_CONNECTOR_DisplayPort);
+}
+
+bool dpu_encoder_is_virtual(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+
+	if (!drm_enc)
+		return false;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	return (dpu_enc->disp_info.connector_type == DRM_MODE_CONNECTOR_WRITEBACK);
+}
+
+bool dpu_encoder_is_primary(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+
+	if (!drm_enc)
+		return false;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	return((dpu_enc->disp_info.connector_type == DRM_MODE_CONNECTOR_DSI) ||
+		(dpu_enc->disp_info.connector_type == DRM_MODE_CONNECTOR_eDP));
+}
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
@@ -2412,7 +2446,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_encoder *drm_enc = NULL;
 	struct dpu_encoder_virt *dpu_enc = NULL;
-	int ret = 0;
+	int ret = 0, intf_i;
 
 	dpu_enc = to_dpu_encoder_virt(enc);
 
@@ -2424,13 +2458,17 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 	timer_setup(&dpu_enc->frame_done_timer,
 			dpu_encoder_frame_done_timeout, 0);
 
+	intf_i = disp_info->h_tile_instance[0];
 	if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
+	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS) {
 		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
-				priv->dp[disp_info->h_tile_instance[0]]);
+				priv->dp[intf_i]);
+		disp_info->connector_type =
+			msm_dp_get_connector_type(priv->dp[intf_i]);
+	}
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236e..d361c5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -25,16 +25,18 @@
  * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
- * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @is_cmd_mode:        Boolean to indicate if the CMD mode is requested
+ * @connector_type:     DRM_MODE_CONNECTOR_ type
  * @is_te_using_watchdog_timer:  Boolean to indicate watchdog TE is
- *				 used instead of panel TE in cmd mode panels
- * @dsc:		DSC configuration data for DSC-enabled displays
+ *                      used instead of panel TE in cmd mode panels
+ * @dsc:                DSC configuration data for DSC-enabled displays
  */
 struct msm_display_info {
 	int intf_type;
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int connector_type;
 	bool is_te_using_watchdog_timer;
 	struct drm_dsc_config *dsc;
 };
@@ -224,4 +226,22 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
  */
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
+/**
+* dpu_encoder_is_external - find if the encoder is of type DP
+* @drm_enc:    Pointer to previously created drm encoder structure
+*/
+bool dpu_encoder_is_external(struct drm_encoder *drm_enc);
+
+/**
+* dpu_encoder_is_virtual - find if the encoder is of type Writeback
+* @drm_enc:    Pointer to previously created drm encoder structure
+*/
+bool dpu_encoder_is_virtual(struct drm_encoder *drm_enc);
+
+/**
+* dpu_encoder_is_primary - find if the encoder is of type DSI or eDP
+* @drm_enc:    Pointer to previously created drm encoder structure
+*/
+bool dpu_encoder_is_primary(struct drm_encoder *drm_enc);
+
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0d94eec0d..0709da2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -574,6 +574,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 
 		memset(&info, 0, sizeof(info));
 		info.intf_type = encoder->encoder_type;
+		info.connector_type = DRM_MODE_CONNECTOR_DSI;
 
 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
 		if (rc) {
@@ -676,6 +677,7 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 	/* use only WB idx 2 instance for DPU */
 	info.h_tile_instance[0] = WB_2;
 	info.intf_type = encoder->encoder_type;
+	info.connector_type = DRM_MODE_CONNECTOR_WRITEBACK;
 
 	rc = dpu_encoder_setup(dev, encoder, &info);
 	if (rc) {
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bfd0aef..53f65dd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1509,6 +1509,11 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 	return dp->wide_bus_en;
 }
 
+int msm_dp_get_connector_type(const struct msm_dp *dp_display)
+{
+	return dp_display->connector_type;
+}
+
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 {
 	struct dp_display_private *dp;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ea80846..2ecba6f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -331,7 +331,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
-
+int msm_dp_get_connector_type(const struct msm_dp *dp_display);
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -365,6 +365,11 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 	return false;
 }
 
+static inline int msm_dp_get_connector_type(const struct msm_dp *dp_display)
+{
+	return 0;
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4
-- 
2.7.4

