Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A00622B4C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 13:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08CD10E5B6;
	Wed,  9 Nov 2022 12:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE53B10E5B9;
 Wed,  9 Nov 2022 12:17:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9Bss2q005769; Wed, 9 Nov 2022 12:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=CdTmhLsvahS8DyB5hTADkYwJmhKHVqmUl2b80r1yvIU=;
 b=IMeSKx2DoNQcGApmXIbSoAc5orM72d2GXXM+Aw7wtA3L+/AU7E1AHd3Lo7sWtcEHe9VB
 EZB3CXYQhq0q/KhBenDYfDf4JuTwTLCh2mKTkK6W2k16mDG/dNBWBnDuxwTdS1+ATlJX
 Ad+T6nVBb0l8EAULj+Ck0/yWd9cpYqx9ReQWsHDfXlWfPGu/YmIXTOE2TiRW9YUjZYBm
 RcrsW3PGIes1piIciN5ZO/F2sHPpKRErW+gLk9J/20eVgPcUf7k7sDXpE+r3+0V18b01
 JQB9+BhVgHZ4ntrUmkBDzTleYX/ZSXnNi4lrrOXCNT8RYZyTWlGxIjy/oMjYSVJj+vf2 mw== 
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kr6e4ry7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 12:17:02 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 2A9CGpPU008029; 
 Wed, 9 Nov 2022 12:16:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3kngwkn0x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 09 Nov 2022 12:16:59 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A9CFMwM007153;
 Wed, 9 Nov 2022 12:16:58 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com
 [10.204.66.210])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 2A9CGwq9008050;
 Wed, 09 Nov 2022 12:16:58 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id 8928B48B5; Wed,  9 Nov 2022 04:16:57 -0800 (PST)
From: Kalyan Thota <quic_kalyant@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 2/4] drm/msm/disp/dpu1: populate disp_info if an interface is
 external
Date: Wed,  9 Nov 2022 04:16:44 -0800
Message-Id: <1667996206-4153-2-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
References: <1667996206-4153-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: RrrzVp19uIoHOoGXyWQEZ7S6Bdf7-kMy
X-Proofpoint-GUID: RrrzVp19uIoHOoGXyWQEZ7S6Bdf7-kMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_05,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211090094
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

DRM encoder type is same for eDP and DP (DRM_MODE_ENCODER_TMDS)
populate is_external information in the disp_info so as to
differentiate between eDP and DP on the DPU encoder side.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 14 +++++++++++---
 drivers/gpu/drm/msm/dp/dp_display.c         |  5 +++++
 drivers/gpu/drm/msm/msm_drv.h               |  7 ++++++-
 4 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b..5d6ad1f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2412,7 +2412,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_encoder *drm_enc = NULL;
 	struct dpu_encoder_virt *dpu_enc = NULL;
-	int ret = 0;
+	int ret = 0, intf_i;
 
 	dpu_enc = to_dpu_encoder_virt(enc);
 
@@ -2424,13 +2424,16 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
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
+		disp_info->is_external = msm_dp_is_external(priv->dp[intf_i]);
+	}
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
@@ -2455,6 +2458,17 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 
 }
 
+bool dpu_encoder_is_external(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+
+	if (!drm_enc)
+		return false;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	return dpu_enc->disp_info.is_external;
+}
+
 struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 		int drm_enc_mode)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 9e7236e..43f0d8b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -25,16 +25,18 @@
  * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
- * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @is_cmd_mode:        Boolean to indicate if the CMD mode is requested
+ * @is_external:        Boolean to indicate if the intf is external
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
+	bool is_external;
 	bool is_te_using_watchdog_timer;
 	struct drm_dsc_config *dsc;
 };
@@ -128,6 +130,12 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder);
 void dpu_encoder_virt_runtime_resume(struct drm_encoder *encoder);
 
 /**
+ * dpu_encoder_is_external - find if the encoder is of type external
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
+bool dpu_encoder_is_external(struct drm_encoder *drm_enc);
+
+/**
  * dpu_encoder_init - initialize virtual encoder object
  * @dev:        Pointer to drm device structure
  * @disp_info:  Pointer to display information structure
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bfd0aef..0bbdcca5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1509,6 +1509,11 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 	return dp->wide_bus_en;
 }
 
+bool msm_dp_is_external(const struct msm_dp *dp_display)
+{
+	return (dp_display->connector_type == DRM_MODE_CONNECTOR_DisplayPort);
+}
+
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
 {
 	struct dp_display_private *dp;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ea80846..3b9f8d2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -331,7 +331,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
 
 void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
-
+bool msm_dp_is_external(const struct msm_dp *dp_display);
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -365,6 +365,11 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 	return false;
 }
 
+static inline bool msm_dp_is_external(const struct msm_dp *dp_display)
+{
+	return false;
+}
+
 #endif
 
 #ifdef CONFIG_DRM_MSM_MDP4
-- 
2.7.4

