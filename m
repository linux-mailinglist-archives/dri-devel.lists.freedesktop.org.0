Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0DD8589A4
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 00:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F18810ED0C;
	Fri, 16 Feb 2024 23:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Yuxr+VUu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2BE10ECF8;
 Fri, 16 Feb 2024 23:02:54 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41GMXska026632; Fri, 16 Feb 2024 23:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=Q/1kqhU1mX8ALoEzqUkYax7mfY4rj3ukf9mbs67t9Bc=; b=Yu
 xr+VUuOKwlaTrkFW0PnzxI4kcRFpA1i+jX5QC5bX3vP2/8aQXlZbjKEBwE5SvgmG
 1yKUhqauu8H1aseeeDadLak8YZj/6Mo7mWbV+5cO4vwkQ9qI2a6UbTmzJF7jIUgJ
 0GuXYNPMHtIVyVhm8Cl/iJWX6eiw2pspboMHtpO7x25a+UR/lAtOCOFIDcA066d+
 r/LqaAl8lObSPjBtBww2BToE2OR7QpBNZh/afcHAU4cMmdjPObIVtw9YYIzZQJaP
 CYP2fOIH3UMSTI854cZL+flrlbEdatvlvn/SeY0/rM5ZxbNXRvXRXbn6hD/7zIa3
 UWnbzFxHeSCp+H9G/JSA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wa6nk9axf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 23:02:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GN2pG2032665
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 23:02:51 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 15:02:50 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v4 09/19] drm/msm/dpu: move widebus logic to its own API
Date: Fri, 16 Feb 2024 15:01:57 -0800
Message-ID: <20240216230228.26713-10-quic_parellan@quicinc.com>
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
X-Proofpoint-GUID: -tGl_X4SSsfv0CJCVPG5nLUVhQRhiN8V
X-Proofpoint-ORIG-GUID: -tGl_X4SSsfv0CJCVPG5nLUVhQRhiN8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_22,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402160182
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
index 1905e8653b77a..b53a1b545742b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -221,9 +221,21 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
 
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
@@ -1195,26 +1207,17 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
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

