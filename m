Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85FA9E657C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B869510E3FE;
	Fri,  6 Dec 2024 04:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NjEkIeG9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C7E10E3D5;
 Fri,  6 Dec 2024 04:33:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaNNU004665;
 Fri, 6 Dec 2024 04:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fJt8SBdtjUT7GaSvBuWYIjlho4MPPLaHNX8e0b88y6k=; b=NjEkIeG95OFb0de9
 CehhUZG0zG+xZoQiDm9u//NmvPhJrgkHs6mPHPzCIrLY7V5Pow0hr+P/xESvK7cE
 IRqu2BTJbJG86nKYxpRxWHJIpgvFAgBf5ClPmhNkjtx8SfzTbqDeD+9cwzbYyOxi
 1Pnw86vi885YcaKPa1XLly1ZLTX3l+Q1Vr7Pq5qk6TxBY4HLvSWuYE6s5HZoAAca
 SDs7OIsdYy6XiGaTEEBW9jfOjm8JSwvQ5O0hqJxJQNL9+AFoTQ0CiUEFut4FhtSj
 8XGz5O/4T32m8Tsy2anmQNnLCAk+lELj6i1jLRDUqbzR2QJtK+GCN+mmyxIajhN3
 1F9tzg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba142k7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64WRdC017189
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:27 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:27 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:37 -0800
Subject: [PATCH 06/45] drm/msm/dp: remove dp_display's dp_mode and use
 dp_panel's instead
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-6-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, "Chandan
 Uddaraju" <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
 Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=4707;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=HvU8ieFt/hI/fEje4LFS/cP6jsBHZg15RdzK1YmGaEo=;
 b=Pz3z5E4XUkJSoSF4lKcr0tsZaBEpvYiehXHL3fcPkS4uRAltYToFwb++Sp9yEaQs1GiILKurd
 4yBRiwb1LLbAwhoLVawlBt/5yba+O970itukjVTkpkoT+p15m0Pkdfe
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: eRUAKKasdK08N5VpcBDIwV6MDfASLpu9
X-Proofpoint-ORIG-GUID: eRUAKKasdK08N5VpcBDIwV6MDfASLpu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030
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

dp_display caches the current display mode and then passes it onto
the panel to be used for programming the panel params. Remove this
two level passing and directly populated the panel's dp_display_mode
instead.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 46 ++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 052db80c6a365f53c2c0a37d3b69ea2b627aea1f..4bd85ae754429333aa423c985368344cd03c7752 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -90,7 +90,6 @@ struct msm_dp_display_private {
 	struct msm_dp_panel   *panel;
 	struct msm_dp_ctrl    *ctrl;
 
-	struct msm_dp_display_mode msm_dp_mode;
 	struct msm_dp msm_dp_display;
 
 	/* wait for audio signaling */
@@ -1436,10 +1435,13 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
 bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
 {
 	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
 
 	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
 
-	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
+	dp_panel = dp->panel;
+
+	if (dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		return false;
 
 	return dp->wide_bus_supported;
@@ -1501,10 +1503,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	bool force_link_train = false;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
-		DRM_ERROR("invalid params\n");
-		return;
-	}
 
 	if (dp->is_edp)
 		msm_dp_hpd_plug_handle(msm_dp_display, 0);
@@ -1516,13 +1514,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
-	if (rc) {
-		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
-		mutex_unlock(&msm_dp_display->event_mutex);
-		return;
-	}
-
 	state =  msm_dp_display->hpd_state;
 
 	if (state == ST_CONNECTED && !dp->power_on) {
@@ -1599,37 +1590,40 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 	struct msm_dp_panel *msm_dp_panel;
+	struct msm_dp_display_mode msm_dp_mode;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 	msm_dp_panel = msm_dp_display->panel;
 
-	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
+	memset(&msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
 
 	if (msm_dp_display_check_video_test(dp))
-		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
+		msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
 	else /* Default num_components per pixel = 3 */
-		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
+		msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
 
-	if (!msm_dp_display->msm_dp_mode.bpp)
-		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
+	if (!msm_dp_mode.bpp)
+		msm_dp_mode.bpp = 24; /* Default bpp */
 
-	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
+	drm_mode_copy(&msm_dp_mode.drm_mode, adjusted_mode);
 
-	msm_dp_display->msm_dp_mode.v_active_low =
-		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
+	msm_dp_mode.v_active_low =
+		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
 
-	msm_dp_display->msm_dp_mode.h_active_low =
-		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
+	msm_dp_mode.h_active_low =
+		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
 
-	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
+	msm_dp_mode.out_fmt_is_yuv_420 =
 		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
 		msm_dp_panel->vsc_sdp_supported;
 
+	msm_dp_display_set_mode(dp, &msm_dp_mode);
+
 	/* populate wide_bus_support to different layers */
 	msm_dp_display->ctrl->wide_bus_en =
-		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
+		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
 	msm_dp_display->catalog->wide_bus_en =
-		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
+		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
 }
 
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)

-- 
2.34.1

