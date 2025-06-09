Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A237CAD1D74
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E246110E330;
	Mon,  9 Jun 2025 12:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="RpRiLhdS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53CF10E2F8;
 Mon,  9 Jun 2025 12:25:00 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559B2CcY019972;
 Mon, 9 Jun 2025 12:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C4jB/53IaG4bPIaebV3JhZ1UcC+PCc+yeIHMr6kDTno=; b=RpRiLhdSX5qNzFdx
 yay3ez737c5fXrRKLlZyaqGBem7z3GGYUOU4dr4rTcYJTsiFtVw+Iw6TFA+aPxfR
 FYkgVoS1XxIYNi90PNIybIxCakzA0umn0LRslkGlLDIG6RBtgjgCJu6szrGDFY6D
 9wWbuwCcQCgqZHVJRhMDFjnDh5w3acfPAQyaZ7unMFoMQXoUsl5V14FfVgzb1mG1
 za6/h2dFHf9gYaYGvaCXc0+3ow6ys47pD1wT8Lv9CtqFAjoa/2nBbL79PW6z6E8V
 tdzC4hMBgOHZnRtSv/TyZEQUO5UN+NbYq1qL/xqja/DlVu6sGK0143r5mOwPWZ8D
 w775Fg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475qctsd8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COs4e014890
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:24:54 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:50 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:52 +0800
Subject: [PATCH v2 33/38] drm/msm: initialize DRM MST encoders for DP
 controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471763; l=4838;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=mLyzrhMAAj7MZruVUJuwFJSYfV2s4D9aLgGKRQ0wzuQ=;
 b=3jE/m4Rtlkne82RCwFfDtCrtgKszM56T8SYlp1eKLuaGZWSdPA8UCaYizeODFd4vMEqimwI7M
 7g5VeEyFzYqCRVph0H/VpNQrgUKtXUdMMhnDkVLXTocRipkfQljFxzU
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rUgglwcAXf1Z7hF-1l1ReHaTVXlBSZqO
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=6846d297 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=h0hcLRx82-sZQdSHUIMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfXxSr8FPZDbGZJ
 quF2QCU6+gWIHNoVcK73s6WpqJyHDVowR4AEx2sRAGXxfUoo74QaDSIK8CNICV+7RC4zuSZ8Od3
 bwHQKbpkuzaGBm+N9w4YTeffWxYNscFoN3459nloosH6+JoJzwwQveNgbjBXekrpWxJ4QDPlkbi
 OGp4u4E/IR62R5BMjL1jPUjDwEIWdxy96R/n/CCNYSjhc333Dgnr1wB2u0BhPjBjV7cjDKfvVy2
 xRnXZx2+G7SK7G2ww8lp9NqHnXrPTpXG4G4HqajWurkAdTNpvwsK9KoFQJqpUJc+9aMJB59blF2
 hgAxgZBkinz6/Zjo3f/FgWZwIh4jdF9CUmABLKFMe7bJogo8GM3GVhW40E9HlfmUV6XUFMp0Omm
 ZDUyk3xpbnWo7TRGRJ9klK84r5qCRcPfL1hnDgjf0evVivEwjAh6KqPzeSy2tmbEW/jeKe/K
X-Proofpoint-ORIG-GUID: rUgglwcAXf1Z7hF-1l1ReHaTVXlBSZqO
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

Initiliaze a DPMST encoder for each  MST capable DP controller
and the number of encoders it supports depends on the number
of streams it supports.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_display.c         | 14 ++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
 4 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index ca1ca2e51d7ead0eb34b27f3168e6bb06a71a11a..2eb4c39b111c1d8622e09e78ffafef017e28bbf6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -28,6 +28,7 @@
  * @h_tile_instance:    Controller instance used per tile. Number of elements is
  *                      based on num_of_h_tiles
  * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
+ * @stream_id		stream id for which the interface needs to be acquired
  * @vsync_source:	Source of the TE signal for DSI CMD devices
  */
 struct msm_display_info {
@@ -35,6 +36,7 @@ struct msm_display_info {
 	uint32_t num_of_h_tiles;
 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
 	bool is_cmd_mode;
+	int stream_id;
 	enum dpu_vsync_source vsync_source;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -652,7 +652,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	struct msm_display_info info;
 	bool yuv_supported;
 	int rc;
-	int i;
+	int i, stream_id;
+	int stream_cnt;
 
 	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
 		if (!priv->dp[i])
@@ -675,6 +676,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
 		}
+
+		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
+
+		if (stream_cnt > 1) {
+			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
+				info.stream_id = stream_id;
+				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
+				if (IS_ERR(encoder)) {
+					DPU_ERROR("encoder init failed for dp mst display\n");
+					return PTR_ERR(encoder);
+				}
+
+				rc = msm_dp_mst_bridge_init(priv->dp[i], encoder);
+				if (rc) {
+					DPU_ERROR("dp mst bridge %d init failed, %d\n",
+						  stream_id, rc);
+					continue;
+				}
+			}
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9dbcf4553cad70c9e3722160a87403fc815765d7..ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1417,6 +1417,20 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
 	return connector_type;
 }
 
+int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
+{
+	struct msm_dp_display_private *dp_priv;
+
+	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	return dp_priv->max_stream;
+}
+
+int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
+{
+	return msm_dp_mst_drm_bridge_init(dp_display, encoder);
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a65077855201746c37ee742364b61116565f3794..dd403107b640ee5ef333d2773b52e38e3869155f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -372,6 +372,9 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 			       const struct drm_display_mode *mode);
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
+int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
+int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
+
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -388,6 +391,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 	return -EINVAL;
 }
 
+static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
+static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.34.1

