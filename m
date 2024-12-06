Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A989E65B8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 05:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A0510F019;
	Fri,  6 Dec 2024 04:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EQ3eniz+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478C810E5FA;
 Fri,  6 Dec 2024 04:33:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B63jhgS006176;
 Fri, 6 Dec 2024 04:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /5Y45DvRkIZ2E9DbC5fTzPSzG+f00kr5eR8ZlzDK2Q4=; b=EQ3eniz+JC/50mNL
 LmjTtRfPIYSwjn1cJs0V7GLSItS4Er3kvBBQRb72wV4TwGUj/V9p6lC7r3Rtycql
 9slCn+NM/Scqkpa6BRaPz6oDsB7D9V5XR5Fxvmf5anjLjwb2nVP3XFPPQopsoJ8g
 mEK4Ie9ZM1KU+T2VydafI/y/ATPd2kkPsOAr0EXxfMT6Gro/9T9RfQmZwBlkY0Zj
 /w30YRmEjOUshWqVC8FJZaB8LTMZU166d2VaxxBDEvYWpZcPFBOZ205YGz4Y9be/
 jD7XMJ5CF0+5oMilU1mE1A6tvEdfBb68/g9MfzfwRam1ZCnT9Ay05HsY01G55/cB
 DAuyyA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bsn6r38e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2024 04:32:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Wc3Y007182
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Dec 2024 04:32:38 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:38 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:31:56 -0800
Subject: [PATCH 25/45] drm/msm/dp: move link related operations to
 dp_display_unprepare()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-25-f8618d42a99a@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=3429;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=14V75o1SPe7H9ddkxkBHxWgMoqi9JZx53WyII8n5MEk=;
 b=zkBwVqqBBLj10CQZJfdka/sIshlip+jKNLeZzAQ5BMSb2QnxK+6Ke3FrVVVraMpzr9Y67/4Ja
 xhuS6l2yxBOBg4FcWieQ3NhdtyZMXZ8LvLjc9GDrNv45KSdjeHa8jzK
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: GV7CNVUsjVBWZ68eJO7WB5z1e86tk3R4
X-Proofpoint-ORIG-GUID: GV7CNVUsjVBWZ68eJO7WB5z1e86tk3R4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0
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

Move the link related operations to dp_display_unprepare() and keep
only stream related operations in dp_display_disable().

Make dp_display_unprepare() available to other clients such as DP MST.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 31 ++++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e169cd22db960c0c30707ddbe6a79999dc2a273d..d5b8fd1d4d736ffa7929b9798601dcef0dea5211 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -936,20 +936,8 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
 
 	msm_dp_ctrl_clear_vsc_sdp_pkt(dp->ctrl, msm_dp_panel);
 
-	/* dongle is still connected but sinks are disconnected */
-	if (dp->link->sink_count == 0)
-		msm_dp_ctrl_psm_config(dp->ctrl);
-
 	msm_dp_ctrl_stream_clk_off(dp->ctrl, msm_dp_panel);
 
-	msm_dp_ctrl_off_link(dp->ctrl);
-
-	/* re-init the PHY so that we can listen to Dongle disconnect */
-	if (dp->link->sink_count == 0)
-		msm_dp_ctrl_reinit_phy(dp->ctrl);
-	else
-		msm_dp_display_host_phy_exit(dp);
-
 	msm_dp_display->power_on = false;
 
 	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
@@ -1678,15 +1666,28 @@ void msm_dp_display_atomic_disable(struct msm_dp *msm_dp)
 	msm_dp_display_disable_helper(msm_dp, msm_dp_display->panel);
 }
 
-static void msm_dp_display_unprepare(struct msm_dp_display_private *msm_dp_display_priv)
+void msm_dp_display_unprepare(struct msm_dp *msm_dp)
 {
-	struct msm_dp *msm_dp = &msm_dp_display_priv->msm_dp_display;
+	struct msm_dp_display_private *msm_dp_display;
 
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
@@ -1732,7 +1733,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp)
 
 	msm_dp_display_atomic_post_disable_helper(msm_dp, msm_dp_display->panel);
 
-	msm_dp_display_unprepare(msm_dp_display);
+	msm_dp_display_unprepare(msm_dp);
 }
 
 void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 2b23f2bf7535d3fd513d40a8411a1903fcd560b0..82eb1c6ed1467b21742bda8eaae9c51d3207e997 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -65,4 +65,6 @@ void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
 void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp,
 					       struct msm_dp_panel *msm_dp_panel);
 
+void msm_dp_display_unprepare(struct msm_dp *dp);
+
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1

