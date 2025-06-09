Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FFFAD1D59
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08F710E2C9;
	Mon,  9 Jun 2025 12:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dwirteOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D2410E2CB;
 Mon,  9 Jun 2025 12:24:18 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598Oq3m000710;
 Mon, 9 Jun 2025 12:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lF7ZzOdhbn0/CdnQsepv7PS7B9ZKu5LlQ3AdU8W3aA0=; b=dwirteOq9gJT0wBW
 CF19myFRxAj/ElVB1qJ1+TBTBM0YqA6Hm64irTMwVge7G+WDLqU32MnQ1yUjMa+R
 Q6klhuMEo7ZVZRWYPqx/whEcz1ieKhM8gNuZCuP+wPWHym0pQE3dKKrwj7d5kHx5
 tL9ngvOdNXJzFn+f4LtcUcuRNz8DKhrteq5KBRGl/0TtADPxBA0JSL4kkLV+JUqA
 kljzx/NDSPLYNzP/4vee67qa6Sw7YZnGFjpc+nraTL5fJa6tHBB1eYxFpk+HGQZg
 +xFfXqEmqWqOahvy82n0k7u62Z6KjNWulP4iNLtjHhmmj0ioxi9IM45k9PFqEc2u
 YcltQQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2t8q1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COCIR013705
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:24:12 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:09 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:41 +0800
Subject: [PATCH v2 22/38] drm/msm/dp: move link related operations to
 dp_display_unprepare()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-22-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471758; l=3861;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=VHudlw+ZpEq1KxfOFaNAh0a3oMl08fJim7NNnc8RvC4=;
 b=RU4jV2TTm1bZsVALdSEbagfXk8iLgZGy1bs9l8bOAqzMruzBNxtON3Pa07Csuu7diDfPXV1CK
 KwSDbp7DG5nAvzZuecGKFSv/LfIc+LTIZ5swaT8e5IXEp/lsePxbBQn
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: af5yjkM3ymENJxn4Vd0BAu8YVZTCHPez
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6846d26e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=38kpAGUSSc4RVW_JurAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: af5yjkM3ymENJxn4Vd0BAu8YVZTCHPez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX4F7vwkr9tWjX
 fwDB7LfAFVmmnptn+svjDQEG4YZu88BQQDMZXTYMiYmk+rncpjKCzXIlX+sRuEw/dMtAiVpoOp/
 +WAwDK2C2AzZyeVMYnZL6rkshUJUglEHRJZQaUBJTPsK3plzkyRShcuQaVh8tjYJzdlmljCcII1
 /plfsk+90+WJQRkScUcq4KqcpqLgs+Zd7KkrzvDbtz1x78rlwDUiuxr75Rg7L8qSYrj9Ob0CNWv
 OCR+R9/qkRbg8+Nl4Kyyxh24a9Kz6tiqRwEEA3GIPmuv0cPRuBixBahxntz8pF1YII/YoEg25UQ
 JqxZl+e+5LUZj1oCLV6lvfa63n+OqfgRN2N1y/d96ZlosBfSoRb3yUhvUJIc2zdFTzcT97ufW4W
 CJCe4pmzvHbQSP1prH7ZJYZpB09xy6BIUwR6YZ9g+ACFERwJhbIiaRb3A6Qkpm087qfXoOdp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Move the link related operations to dp_display_unprepare() and keep
only stream related operations in dp_display_disable().

Make dp_display_unprepare() available to other clients such as DP MST.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++++++++++++----------------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 68c74f30255d96f13ead817b69f481f41d53eec6..ea6113d1138b382f69d726cb16ceb04d82cbbe3b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -934,18 +934,7 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 
 	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, msm_dp_panel);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0) {
-		msm_dp_ctrl_psm_config(dp->ctrl);
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
-		msm_dp_ctrl_off_link(dp->ctrl);
-		/* re-init the PHY so that we can listen to Dongle disconnect */
-		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	} else {
-		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
-		msm_dp_ctrl_off_link(dp->ctrl);
-		msm_dp_display_host_phy_exit(dp);
-	}
+	msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
 
 	msm_dp_display->power_on = false;
 
@@ -961,7 +950,6 @@ int msm_dp_display_set_stream_info(struct msm_dp *dp, struct msm_dp_panel *panel
 	struct msm_dp_display_private *msm_dp_display;
 	const int max_slots = 64;
 
-
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (!msm_dp_display) {
@@ -1665,15 +1653,29 @@ void msm_dp_display_atomic_disable(struct msm_dp *msm_dp)
 	msm_dp_display_disable_helper(msm_dp, msm_dp_display->panel);
 }
 
-static void msm_dp_display_unprepare(struct msm_dp_display_private *msm_dp_display_priv)
+void msm_dp_display_unprepare(struct msm_dp *msm_dp)
 {
-	struct msm_dp *msm_dp = &msm_dp_display_priv->msm_dp_display;
+	struct msm_dp_display_private *msm_dp_display;
+
+	msm_dp_display = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
 
 	if (!msm_dp->prepared) {
 		drm_dbg_dp(msm_dp->drm_dev, "Link already setup, return\n");
 		return;
 	}
 
+	/* dongle is still connected but sinks are disconnected */
+	if (msm_dp_display->link->sink_count == 0)
+		msm_dp_ctrl_psm_config(msm_dp_display->ctrl);
+
+	msm_dp_ctrl_off_link(msm_dp_display->ctrl);
+
+	/* re-init the PHY so that we can listen to Dongle disconnect */
+	if (msm_dp_display->link->sink_count == 0)
+		msm_dp_ctrl_reinit_phy(msm_dp_display->ctrl);
+	else
+		msm_dp_display_host_phy_exit(msm_dp_display);
+
 	pm_runtime_put_sync(&msm_dp->pdev->dev);
 
 	msm_dp->prepared = false;
@@ -1719,7 +1721,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp)
 
 	msm_dp_display_atomic_post_disable_helper(msm_dp, msm_dp_display->panel);
 
-	msm_dp_display_unprepare(msm_dp_display);
+	msm_dp_display_unprepare(msm_dp);
 }
 
 void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 96fec50601400ca44d1cdd310f2353e301874099..0b73087cbc421b4d2b895033f17892189ef68cb2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -58,4 +58,6 @@ void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp,
 					       struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_display_unprepare(struct msm_dp *dp);
+
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1

