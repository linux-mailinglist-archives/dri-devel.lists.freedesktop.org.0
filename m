Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7627A5A5A13
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 05:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D32F10E9E1;
	Tue, 30 Aug 2022 03:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0390B10E9CB;
 Tue, 30 Aug 2022 03:33:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U3F73t028677;
 Tue, 30 Aug 2022 03:33:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=f1PuhYqLuKqfoa9fuOJowd3e5WgBPaL2/ur+tNtJk70=;
 b=e5DwsZtRnF9VXlD00tOaMvOSNjJ5xhtUtYmvqaGk+6uxvyOly472A3/q/FaMBJ3Un5L6
 qTMg12ob5Kqzr8q2/C9B72yuW9iSQPxq7L9RHFtc7aKZs1na8qg9x5+dRalBZdPkJbXq
 oSTha1BqxLbkwhntQK0YXNWlRawkKY+YTOZiVpCd0DeRHrVIsCJ0c0Kl6fCn5pivqqyr
 VKZtdLFzW3GwyE4E0LDmlh3Zk13iOg62CVaNq9BbUmW14MjwMVgJs7BtoMYE1iStdEYC
 U5e0uysWskatrsxs/KhZdUM4RLbuDL6Pi2pd645q50YrIk1wNyZOCo8cSOQ8gcCIRxzZ aw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j8x1j1ypj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 03:33:23 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27U3XMhS027099
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 03:33:22 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Mon, 29 Aug 2022 20:33:21 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [RFC PATCH 2/3] drm/msm: filter out modes for DSI bridge having
 unsupported clock
Date: Mon, 29 Aug 2022 20:33:08 -0700
Message-ID: <1661830389-22439-3-git-send-email-quic_abhinavk@quicinc.com>
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
X-Proofpoint-GUID: w28MbedrUCnN6Ag5qNbKCoWgg-BCyAWm
X-Proofpoint-ORIG-GUID: w28MbedrUCnN6Ag5qNbKCoWgg-BCyAWm
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

DSI interface used with a bridge chip connected to an external
display is subject to the same pixel clock limits as one
which is natively pluggable like DisplayPort.

Hence filter out DSI modes having an unsupported pixel clock
if its connected to a bridge which is pluggable.

Ideally, this can be accommodated into msm_dsi_modeset_init()
by passing an extra parameter but this will also affect non-dpu
targets. Till we add the same logic for non-dpu chipsets, lets
have this as a separate call.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 11 +++++++--
 drivers/gpu/drm/msm/dsi/dsi.c           |  5 +++++
 drivers/gpu/drm/msm/dsi/dsi.h           |  6 +++--
 drivers/gpu/drm/msm/dsi/dsi_host.c      | 40 ++++++++++++++++++++++++++++-----
 drivers/gpu/drm/msm/dsi/dsi_manager.c   |  2 +-
 drivers/gpu/drm/msm/msm_drv.h           |  4 ++++
 6 files changed, 58 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7a5fabc0fd4f..e6f7e07fd2a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -539,7 +539,8 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
 
 static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				    struct msm_drm_private *priv,
-				    struct dpu_kms *dpu_kms)
+				    struct dpu_kms *dpu_kms,
+				    int max_ext_pclk)
 {
 	struct drm_encoder *encoder = NULL;
 	struct msm_display_info info;
@@ -582,6 +583,8 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			break;
 		}
 
+		msm_dsi_set_max_extpclk(priv->dsi[i], max_ext_pclk);
+
 		info.h_tile_instance[info.num_of_h_tiles++] = i;
 		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
 
@@ -595,6 +598,8 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 				break;
 			}
 
+			msm_dsi_set_max_extpclk(priv->dsi[i], max_ext_pclk);
+
 			info.h_tile_instance[info.num_of_h_tiles++] = other;
 		}
 
@@ -702,7 +707,9 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
 	int rc = 0;
 	int i;
 
-	rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
+	int max_ext_pclk = dpu_kms->catalog->caps->max_ext_pclk;
+
+	rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms, max_ext_pclk);
 	if (rc) {
 		DPU_ERROR("initialize_dsi failed, rc = %d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 39bbabb5daf6..3a06a157d1b1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -265,6 +265,11 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 	return ret;
 }
 
+void msm_dsi_set_max_extpclk(struct msm_dsi *msm_dsi, int max_ext_pclk)
+{
+	 msm_dsi_host_set_max_extpclk(msm_dsi->host, max_ext_pclk);
+}
+
 void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
 {
 	msm_dsi_host_snapshot(disp_state, msm_dsi->host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 2a96b4fe7839..1be4ebb0f9c8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -93,8 +93,9 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
-enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
-					    const struct drm_display_mode *mode);
+enum drm_mode_status msm_dsi_host_mode_valid(struct mipi_dsi_host *host,
+		const struct drm_display_mode *mode,
+		struct drm_bridge *ext_bridge);
 unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
 int msm_dsi_host_register(struct mipi_dsi_host *host);
 void msm_dsi_host_unregister(struct mipi_dsi_host *host);
@@ -109,6 +110,7 @@ void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
 void msm_dsi_host_destroy(struct mipi_dsi_host *host);
 int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 					struct drm_device *dev);
+void msm_dsi_host_set_max_extpclk(struct mipi_dsi_host *host, int max_ext_pclk);
 int msm_dsi_host_init(struct msm_dsi *msm_dsi);
 int msm_dsi_runtime_suspend(struct device *dev);
 int msm_dsi_runtime_resume(struct device *dev);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 57a4c0fa614b..4428a6a66ee1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -172,6 +172,9 @@ struct msm_dsi_host {
 	int dlane_swap;
 	int num_data_lanes;
 
+	/* max pixel clock when used with a bridge chip */
+	int max_ext_pclk;
+
 	/* from phy DT */
 	bool cphy_mode;
 
@@ -2076,6 +2079,13 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 	return 0;
 }
 
+void msm_dsi_host_set_max_extpclk(struct mipi_dsi_host *host, int max_ext_pclk)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	msm_host->max_ext_pclk = max_ext_pclk;
+}
+
 int msm_dsi_host_register(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
@@ -2548,17 +2558,14 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 	return 0;
 }
 
-enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
-					    const struct drm_display_mode *mode)
+static enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
+		const struct drm_display_mode *mode)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	struct drm_dsc_config *dsc = msm_host->dsc;
 	int pic_width = mode->hdisplay;
 	int pic_height = mode->vdisplay;
 
-	if (!msm_host->dsc)
-		return MODE_OK;
-
 	if (pic_width % dsc->slice_width) {
 		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
 		       pic_width, dsc->slice_width);
@@ -2574,6 +2581,29 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
 	return MODE_OK;
 }
 
+enum drm_mode_status msm_dsi_host_mode_valid(struct mipi_dsi_host *host,
+					    const struct drm_display_mode *mode,
+					    struct drm_bridge *ext_bridge)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	/* TODO: external bridge chip with DSI having DSC */
+	if (msm_host->dsc)
+		return msm_dsi_host_check_dsc(host, mode);
+
+	/* TODO: add same logic for non-dpu targets */
+	if (!msm_host->max_ext_pclk)
+		return MODE_OK;
+
+	if (ext_bridge) {
+		if (ext_bridge->ops & DRM_BRIDGE_OP_HPD)
+			if (mode->clock > msm_host->max_ext_pclk)
+				return MODE_CLOCK_HIGH;
+	}
+
+	return MODE_OK;
+}
+
 unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host)
 {
 	return to_msm_dsi_host(host)->mode_flags;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 3a1417397283..1543a0e07d5a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -451,7 +451,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct mipi_dsi_host *host = msm_dsi->host;
 
-	return msm_dsi_host_check_dsc(host, mode);
+	return msm_dsi_host_mode_valid(host, mode, msm_dsi->external_bridge);
 }
 
 static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ea80846e7ac3..44d882b04327 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -281,6 +281,7 @@ void __init msm_dsi_register(void);
 void __exit msm_dsi_unregister(void);
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder);
+void msm_dsi_set_max_extpclk(struct msm_dsi *msm_dsi, int max_ext_pclk);
 void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi);
 bool msm_dsi_is_cmd_mode(struct msm_dsi *msm_dsi);
 bool msm_dsi_is_bonded_dsi(struct msm_dsi *msm_dsi);
@@ -299,6 +300,9 @@ static inline int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
 {
 	return -EINVAL;
 }
+static inline void msm_dsi_set_max_extpclk(struct msm_dsi *msm_dsi, int max_ext_pclk)
+{
+}
 static inline void msm_dsi_snapshot(struct msm_disp_state *disp_state, struct msm_dsi *msm_dsi)
 {
 }
-- 
2.7.4

