Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE18501E2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 02:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B61111200E;
	Sat, 10 Feb 2024 01:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="oc7tyYAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9710F703;
 Sat, 10 Feb 2024 01:52:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41A1X11C009462; Sat, 10 Feb 2024 01:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=Guh+OurFKiSlRKlacw84R3RhZNe8CR6WG8RGONYMKSs=; b=oc
 7tyYAuzKQ8QV0CyL4ysYWIySA28pRepg678iDOPqMpofyKkl4rIpqx1ersf6IHkU
 bOMAbooliGUoVR2pj1GWscTeDvfwXK4uRaFB6oJMyBk2i3anc5XrvAJ0DvwhssrS
 714w72D/W6WPPXcOzsQn/S4zc/69yQfG0isRQg6Qsd8kqCxtgtp3ZGD6+yoM0hb3
 cH+oUjHIPSuVQEEJ2tqzUSNa7nEZiDH+krvC5O4iQw8d7swRSTLzwiewSY4Gamoe
 zhq721BXotCgwe/x+Kmf4pmZrzVCzoEMhqtkoHC0fdM9S9p+wFVOxaFO2KTANXsC
 YUysIw8ZfNZM1k66ulKw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5xgr03j2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41A1qhpR028026
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:43 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 9 Feb 2024 17:52:43 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v2 09/19] drm/msm/dpu: move widebus logic to its own API
Date: Fri, 9 Feb 2024 17:52:00 -0800
Message-ID: <20240210015223.24670-10-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240210015223.24670-1-quic_parellan@quicinc.com>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2-c7V9lqFIxIF9zl9diC28Ximdzis_vH
X-Proofpoint-ORIG-GUID: 2-c7V9lqFIxIF9zl9diC28Ximdzis_vH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_01,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402100012
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

Widebus enablement is decided by the interfaces based on their specific
checks and that already happens with DSI/DP specific helpers. Let's
invoke these helpers from dpu_encoder_is_widebus_enabled() to make it
cleaner overall.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 29 ++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +++
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3c55d6290b708..7e7796561009a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -225,9 +225,21 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 {
-	const struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	const struct dpu_encoder_virt *dpu_enc;
+	struct msm_drm_private *priv = drm_enc->dev->dev_private;
+	const struct msm_display_info *disp_info;
+	int index;
+
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	disp_info = &dpu_enc->disp_info;
+	index = disp_info->h_tile_instance[0];
+
+	if (disp_info->intf_type == INTF_DP)
+		return msm_dp_wide_bus_available(priv->dp[index]);
+	else if (disp_info->intf_type == INTF_DSI)
+		return msm_dsi_wide_bus_enabled(priv->dsi[index]);
 
-	return dpu_enc->wide_bus_en;
+	return false;
 }
 
 bool dpu_encoder_is_dsc_enabled(const struct drm_encoder *drm_enc)
@@ -1199,26 +1211,17 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
 	struct drm_display_mode *cur_mode = NULL;
-	struct msm_drm_private *priv = drm_enc->dev->dev_private;
-	struct msm_display_info *disp_info;
-	int index;
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
-	disp_info = &dpu_enc->disp_info;
-	index = disp_info->h_tile_instance[0];
-
 	dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
 
 	atomic_set(&dpu_enc->frame_done_timeout_cnt, 0);
 
-	if (disp_info->intf_type == INTF_DP)
-		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(priv->dp[index]);
-	else if (disp_info->intf_type == INTF_DSI)
-		dpu_enc->wide_bus_en = msm_dsi_wide_bus_enabled(priv->dsi[index]);
-
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
 
+	dpu_enc->wide_bus_en = dpu_encoder_is_widebus_enabled(drm_enc);
+
 	trace_dpu_enc_enable(DRMID(drm_enc), cur_mode->hdisplay,
 			     cur_mode->vdisplay);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index fe6b1d312a742..67aef59c1f99c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -156,6 +156,10 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
  */
 int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
 
+/**
+ * dpu_encoder_is_widebus_enabled - return bool value if widebus is enabled
+ * @drm_enc:    Pointer to previously created drm encoder structure
+ */
 bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc);
 
 /**
-- 
2.39.2

