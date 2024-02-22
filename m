Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E28602F2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B6710EA69;
	Thu, 22 Feb 2024 19:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="jqOMIJPy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D650E10EA5B;
 Thu, 22 Feb 2024 19:40:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41M7hPbb022213; Thu, 22 Feb 2024 19:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=Q7t9OJC0ojL4yxbW9lA6PYhl1OcPicECa2MRPnBpSXA=; b=jq
 OMIJPy6DKUd2UUGyU/P5HZ3pG9IN62OQP5g3xRUrCg8LW43rFM+B1p278wTCO5fM
 p6JfBXQOf01FtWJ5RQmn+m7xaw6b9MXhnUFbmwILddAXOUjPLwQGAz8OerAnZ+Eo
 vs6jN8ka5fkAyBFUnexgn2HFYM99ImGvQH7+YIEEBCNsMRoxUrmQTsEyUe5xP5mV
 ERecBX90a2Xh0pfkvFCmpHBAdiWKYuEAzRMycPti6HpEdVvlzflgIMYqtAfg6roY
 LzfB+BqGg9y1fX0upI89/gNzfQEzCrsGs2AJZO6JBVqBcGNbLaQIy9UuvDoFhzj2
 0VntcUjjncQg6i/qedWA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3we24aj9f6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 19:40:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MJejsc021813
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Feb 2024 19:40:45 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 11:40:44 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v5 07/19] drm/msm/dp: store mode YUV420 information to be used
 by rest of DP
Date: Thu, 22 Feb 2024 11:39:52 -0800
Message-ID: <20240222194025.25329-8-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222194025.25329-1-quic_parellan@quicinc.com>
References: <20240222194025.25329-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: PGncBj5cBPXhmv1lgUZBEzbBl41VXG6j
X-Proofpoint-ORIG-GUID: PGncBj5cBPXhmv1lgUZBEzbBl41VXG6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220154
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

Wide bus is not supported when the mode is YUV420 in DP. In preparation
for changing the DPU programming to reflect this, the value and
assignment location of wide_bus_en for the DP submodules must be
changed. Move it from boot time in dp_init_sub_modules() to run time in
dp_display_mode_set.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 792191f67717f..1a84f68e2b59a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -785,10 +785,6 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	/* populate wide_bus_supported to different layers */
-	dp->ctrl->wide_bus_en = dp->wide_bus_supported;
-	dp->catalog->wide_bus_en = dp->wide_bus_supported;
-
 	return rc;
 
 error_ctrl:
@@ -809,6 +805,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
 	dp->panel->dp_mode.bpp = mode->bpp;
 	dp->panel->dp_mode.capabilities = mode->capabilities;
+	dp->panel->dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
 	dp_panel_init_panel_info(dp->panel);
 	return 0;
 }
@@ -1403,6 +1400,9 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
 
 	dp = container_of(dp_display, struct dp_display_private, dp_display);
 
+	if (dp->dp_mode.out_fmt_is_yuv_420)
+		return false;
+
 	return dp->wide_bus_supported;
 }
 
@@ -1616,6 +1616,15 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 
 	dp_display->dp_mode.h_active_low =
 		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
+
+	dp_display->dp_mode.out_fmt_is_yuv_420 =
+		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
+
+	/* populate wide_bus_support to different layers */
+	dp_display->ctrl->wide_bus_en =
+		dp_display->dp_mode.out_fmt_is_yuv_420 ? false : dp_display->wide_bus_supported;
+	dp_display->catalog->wide_bus_en =
+		dp_display->dp_mode.out_fmt_is_yuv_420 ? false : dp_display->wide_bus_supported;
 }
 
 void dp_bridge_hpd_enable(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index a0dfc579c5f9f..6ec68be9f2366 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -19,6 +19,7 @@ struct dp_display_mode {
 	u32 bpp;
 	u32 h_active_low;
 	u32 v_active_low;
+	bool out_fmt_is_yuv_420;
 };
 
 struct dp_panel_in {
-- 
2.39.2

