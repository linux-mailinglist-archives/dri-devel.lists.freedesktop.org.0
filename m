Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879B35A5A10
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 05:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F4510E9D6;
	Tue, 30 Aug 2022 03:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C5F10E8A2;
 Tue, 30 Aug 2022 03:33:27 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U202I9020890;
 Tue, 30 Aug 2022 03:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=x+k/jQa7M69GQnoGJnwgVGHvBFAN8UjdEX2S2MvhKiI=;
 b=c4XyRGkSaXj6bSyCLqdv7Ubdfau54f5aVlytFZXQp2z6xR8SBv5GBmAERyJgUwhDnKDf
 b6W8ywPwH38o7ELaZJclImmAENhimQC/PMNCXXkgLGYsGw1RKMN0is2xF5G4eINE+BL3
 b0KOnFcuRx7GEM5Ya2YSHLKK1soRD1Ue609qSy5KBNcZtluwTfk08/nDHNHW8rivK8gn
 evcA6ejb14WlbKG5L3Sjca+MkVf8AK4ODcqXQ/OYHq2WIC3kJGVvqus/eATsynKAf5+Z
 D73BK5IGzJF42pc/aCH+EZ5pEaioOrBawnltoXWeE6PzFpsFY96RCgWLfQJFK4HOGJMK zg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j8x1j1ypk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 03:33:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27U3XMQV026932
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 03:33:22 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 29 Aug 2022 20:33:23 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH 3/3] drm/msm: filter out modes for DP/eDP bridge having
 unsupported clock
Date: Mon, 29 Aug 2022 20:33:09 -0700
Message-ID: <1661830389-22439-4-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZfRuI8pI0BWZ4RaHVlRvughh-m_QBed5
X-Proofpoint-ORIG-GUID: ZfRuI8pI0BWZ4RaHVlRvughh-m_QBed5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_13,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300015
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
Cc: dianders@chromium.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Filter out DP/eDP modes having an unsupported pixel clock by
replacing the current hard-coded limit with the per chipset advertised
value.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  7 ++++---
 drivers/gpu/drm/msm/dp/dp_display.c     | 16 +++++++++++++---
 drivers/gpu/drm/msm/dp/dp_parser.h      |  1 -
 drivers/gpu/drm/msm/msm_drv.h           |  5 +++--
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e6f7e07fd2a6..7857ce58b615 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -614,7 +614,8 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 
 static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 					    struct msm_drm_private *priv,
-					    struct dpu_kms *dpu_kms)
+					    struct dpu_kms *dpu_kms,
+					    int max_ext_pclk)
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
@@ -632,7 +633,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		}
 
 		memset(&info, 0, sizeof(info));
-		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
+		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, max_ext_pclk);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			drm_encoder_cleanup(encoder);
@@ -715,7 +716,7 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 		return rc;
 	}
 
-	rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms);
+	rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms, max_ext_pclk);
 	if (rc) {
 		DPU_ERROR("initialize_DP failed, rc = %d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bfd0aeff3f0d..8b91d8adf921 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -117,6 +117,7 @@ struct dp_display_private {
 
 	bool wide_bus_en;
 
+	int max_ext_pclk;
 	struct dp_audio *audio;
 };
 
@@ -986,8 +987,15 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 	if (dp->is_edp)
 		return MODE_OK;
 
-	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
-		return MODE_CLOCK_HIGH;
+	/*
+	 * If DP/eDP supports HPD natively or through a bridge, need to make
+	 * sure that we filter out the modes with pixel clock higher than the
+	 * chipset capabilities
+	 */
+	if ((bridge->ops & DRM_BRIDGE_OP_HPD) ||
+			(dp->next_bridge && (dp->next_bridge->ops & DRM_BRIDGE_OP_HPD)))
+		if (mode->clock > dp_display->max_ext_pclk)
+			return MODE_CLOCK_HIGH;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	link_info = &dp_display->panel->link_info;
@@ -1587,7 +1595,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 }
 
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
-			struct drm_encoder *encoder)
+			struct drm_encoder *encoder, int max_ext_pclk)
 {
 	struct msm_drm_private *priv;
 	struct dp_display_private *dp_priv;
@@ -1599,6 +1607,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	priv = dev->dev_private;
 	dp_display->drm_dev = dev;
 
+	dp_priv->max_ext_pclk = max_ext_pclk;
+
 	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
 
 	ret = dp_display_request_irq(dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 866c1a82bf1a..c94b793027a2 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -13,7 +13,6 @@
 #include "msm_drv.h"
 
 #define DP_LABEL "MDSS DP DISPLAY"
-#define DP_MAX_PIXEL_CLK_KHZ	675000
 #define DP_MAX_NUM_DP_LANES	4
 
 enum dp_pm_type {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 44d882b04327..39e8cdde6152 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -329,7 +329,7 @@ static inline struct drm_dsc_config *msm_dsi_get_dsc_config(struct msm_dsi *msm_
 int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
-			 struct drm_encoder *encoder);
+			 struct drm_encoder *encoder, int max_ext_pclk);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
@@ -346,7 +346,8 @@ static inline void __exit msm_dp_unregister(void)
 }
 static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 				       struct drm_device *dev,
-				       struct drm_encoder *encoder)
+				       struct drm_encoder *encoder,
+				       int max_ext_pclk)
 {
 	return -EINVAL;
 }
-- 
2.7.4

