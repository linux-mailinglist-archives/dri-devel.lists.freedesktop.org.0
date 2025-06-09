Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B64AAD1D57
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D0810E2D5;
	Mon,  9 Jun 2025 12:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bsvqnURJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FFB10E2CD;
 Mon,  9 Jun 2025 12:24:16 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BVbaS020195;
 Mon, 9 Jun 2025 12:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 UCBpW5D5PoAr7b0E+MX1X/7H3ujhSZqeOMnn6ZsoZ4c=; b=bsvqnURJk83S3Qbo
 4J+550lGzT7CxLUnQQO2UtXh4iGhIUodATE8Xnwfng29PeGAERqHjMlI95P/MHjV
 n9rzU84TULZt6tVoQWY1H5EsmnqP+dW+/hg+dWpJe4KRC6ILfpsteRkfFfo/imSS
 6a7QCnqb7zRdPxwEBHVdeLbKsRgzgxKEHxCLT0RgMUGOt25M6Xl4AOsQ0wfEYpoa
 LcU8Cd4KDBuoXAqQOXaovb/VvNFUQur1DMa6b9XGOKCGc5mn++6KE3VVpcRKyT9l
 ddLwRBfSeRFcG3SEz962ygsp12tpoZ+Fhp1OmmzEKBiT9430IUdv1ntpz9P+iDAa
 2tILPg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qctsd5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CO9AD000790
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:24:09 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:05 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:40 +0800
Subject: [PATCH v2 21/38] drm/msm/dp: abstract out the dp_display stream
 helpers to accept a panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-21-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Yongxing Mou" <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471758; l=9108;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=YmX+keB/dlSIHTOdBqaRE4iXa1/W7j1Ov1mbMemnFAo=;
 b=2eAD6eTm86IU7Muc6pyTtt0MfteyhgLe0zLCXRTBU0TntMpHXQadbcnmNmmQIKLGEnqio7akl
 ExCaRnk/06QAfcYGxhYEGwpnn1sQqGLxPp496N/h51AjboChO2Mlzl5
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7cx6TguXUWdvul_cdE6yooyHWvKtt0cC
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846d26a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8K8LDW8wUMBAfiAu:21 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=COk6AnOGAAAA:8 a=ch7_Potwfo3UzasD460A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX/Lb41JrDZitN
 7koiiHOlSTobJiOq8cSpnoIiNEz/pau8aWo/eJbbmWoaVLxrWEJxIAE8gcJPgMSgFop2ndWiSob
 XY7WN2cVk2VYWe6Wqkqlz87EQRS2bjpHr8I1GS5uCqjvmOA6ED7Lc0G/rPlM2XbgcLkFHDQQiUb
 r+mOdQIQl1ofrkn9cBlRkl+vwy7QHlY8Xzy5vyRWJz+I2nOdQrzza2+yuLU6SEjslk2hTvPKnKd
 kSxGHF33LZ9TTPtbG5ow+KP2weKZNF1AuYN199RopqMxzACSKaowvWVAh3Y7m3VUaB74W2BsMF5
 7cf9M7b2bDt8I8TXYeb88ezaGwRhdbLlR5mJZvHJSTGQpnKKiuNW6ZOE58dkQyz6LJEZgAJfeQ4
 wSMrYilr0vabUsXFbn9J5HF1aeAfR+TpDqUleXgzjnBFCMjoKlw6ug8kliOOpK0nlPis/jFd
X-Proofpoint-ORIG-GUID: 7cx6TguXUWdvul_cdE6yooyHWvKtt0cC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Currently the dp_display bridge helpers, in particular the
dp_display_enable()/dp_display_disable() use the cached panel.
To be able to re-use these helpers for MST use-case abstract the
helpers to use the panel which is passed in to them.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 95 ++++++++++++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.h |  8 ++++
 2 files changed, 75 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 754e6e1fedf2c116911e85e4cdac1110e88b2056..68c74f30255d96f13ead817b69f481f41d53eec6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -866,7 +866,8 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
 	return rc;
 }
 
-static int msm_dp_display_enable(struct msm_dp_display_private *dp)
+static int msm_dp_display_enable(struct msm_dp_display_private *dp,
+				 struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
@@ -877,7 +878,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
 		return 0;
 	}
 
-	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel, dp->max_stream);
+	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
 	if (!rc)
 		msm_dp_display->power_on = true;
 
@@ -923,14 +924,15 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
 	msm_dp_display->audio_enabled = false;
 }
 
-static int msm_dp_display_disable(struct msm_dp_display_private *dp)
+static int msm_dp_display_disable(struct msm_dp_display_private *dp,
+				  struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
 
 	if (!msm_dp_display->power_on)
 		return 0;
 
-	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, dp->panel);
+	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, msm_dp_panel);
 
 	/* dongle is still connected but sinks are disconnected */
 	if (dp->link->sink_count == 0) {
@@ -1597,7 +1599,7 @@ void msm_dp_display_atomic_prepare(struct msm_dp *dp)
 	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
-void msm_dp_display_atomic_enable(struct msm_dp *dp)
+void msm_dp_display_enable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
 {
 	int rc = 0;
 
@@ -1607,16 +1609,14 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp)
 
 	mutex_lock(&msm_dp_display->event_mutex);
 
-	msm_dp_display_set_stream_info(dp, msm_dp_display->panel, 0, 0, 0, 0, 0);
-
 	if (dp->prepared) {
-		rc = msm_dp_display_enable(msm_dp_display);
+		rc = msm_dp_display_enable(msm_dp_display, msm_dp_panel);
 		if (rc)
 			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
 		rc = msm_dp_display_post_enable(dp);
 		if (rc) {
 			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-			msm_dp_display_disable(msm_dp_display);
+			msm_dp_display_disable(msm_dp_display, msm_dp_panel);
 		}
 	}
 
@@ -1627,14 +1627,25 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp)
 	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
-void msm_dp_display_atomic_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp)
+{
+	struct msm_dp_display_private *msm_dp_display;
+
+	msm_dp_display = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_set_stream_info(msm_dp, msm_dp_display->panel, 0, 0, 0, 0, 0);
+
+	msm_dp_display_enable_helper(msm_dp, msm_dp_display->panel);
+}
+
+void msm_dp_display_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (msm_dp_display->mst_supported)
-		msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_display->panel);
+		msm_dp_ctrl_push_vcpf(msm_dp_display->ctrl, msm_dp_panel);
 	else
 		msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 
@@ -1645,21 +1656,30 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
 	}
 }
 
-static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
+void msm_dp_display_atomic_disable(struct msm_dp *msm_dp)
 {
-	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	struct msm_dp_display_private *msm_dp_display;
 
-	if (!msm_dp_display->prepared) {
-		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
+	msm_dp_display = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_disable_helper(msm_dp, msm_dp_display->panel);
+}
+
+static void msm_dp_display_unprepare(struct msm_dp_display_private *msm_dp_display_priv)
+{
+	struct msm_dp *msm_dp = &msm_dp_display_priv->msm_dp_display;
+
+	if (!msm_dp->prepared) {
+		drm_dbg_dp(msm_dp->drm_dev, "Link already setup, return\n");
 		return;
 	}
 
-	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
+	pm_runtime_put_sync(&msm_dp->pdev->dev);
 
-	msm_dp_display->prepared = false;
+	msm_dp->prepared = false;
 }
 
-void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
 {
 	u32 hpd_state;
 	struct msm_dp_display_private *msm_dp_display;
@@ -1678,7 +1698,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 
 	msm_dp_display_audio_notify_disable(msm_dp_display);
 
-	msm_dp_display_disable(msm_dp_display);
+	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
 
 	hpd_state =  msm_dp_display->hpd_state;
 	if (hpd_state == ST_DISCONNECT_PENDING) {
@@ -1686,24 +1706,32 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 		msm_dp_display->hpd_state = ST_DISCONNECTED;
 	}
 
-	msm_dp_display_unprepare(msm_dp_display);
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 
 	mutex_unlock(&msm_dp_display->event_mutex);
 }
 
-void msm_dp_display_mode_set(struct msm_dp *dp,
-			     const struct drm_display_mode *mode,
-			     const struct drm_display_mode *adjusted_mode)
+void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp)
 {
 	struct msm_dp_display_private *msm_dp_display;
-	struct msm_dp_panel *msm_dp_panel;
 
-	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
-	msm_dp_panel = msm_dp_display->panel;
+	msm_dp_display = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_atomic_post_disable_helper(msm_dp, msm_dp_display->panel);
+
+	msm_dp_display_unprepare(msm_dp_display);
+}
+
+void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
+				    const struct drm_display_mode *mode,
+				    const struct drm_display_mode *adjusted_mode,
+				    struct msm_dp_panel *msm_dp_panel)
+{
+	struct msm_dp_display_private *msm_dp_display;
 
-	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
+	msm_dp_display = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_set_mode(msm_dp, adjusted_mode, msm_dp_panel);
 
 	/* populate wide_bus_support to different layers */
 	msm_dp_display->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
@@ -1712,6 +1740,17 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
 		false : msm_dp_display->wide_bus_supported;
 }
 
+void msm_dp_display_mode_set(struct msm_dp *msm_dp,
+			     const struct drm_display_mode *mode,
+			     const struct drm_display_mode *adjusted_mode)
+{
+	struct msm_dp_display_private *msm_dp_display;
+
+	msm_dp_display = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
+
+	msm_dp_display_mode_set_helper(msm_dp, mode, adjusted_mode, msm_dp_display->panel);
+}
+
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 10a5be9337cf9b2ea90b3061ef8d0d6de3282431..96fec50601400ca44d1cdd310f2353e301874099 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -49,5 +49,13 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
 int msm_dp_display_set_stream_info(struct msm_dp *dp, struct msm_dp_panel *panel,
 				   enum msm_dp_stream_id stream_id,
 				   u32 start_slot, u32 num_slots, u32 pbn, int vcpi);
+void msm_dp_display_enable_helper(struct msm_dp *msm_dp, struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_disable_helper(struct msm_dp *msm_dp, struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
+				    const struct drm_display_mode *mode,
+				    const struct drm_display_mode *adjusted_mode,
+				    struct msm_dp_panel *msm_dp_panel);
+void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp,
+					       struct msm_dp_panel *msm_dp_panel);
 
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1

