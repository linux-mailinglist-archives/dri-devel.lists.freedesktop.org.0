Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC336A4CB2
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 22:05:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D878610E21D;
	Mon, 27 Feb 2023 21:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796DF10E21D;
 Mon, 27 Feb 2023 21:04:56 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RKvCqV007373; Mon, 27 Feb 2023 21:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=ziTSNs2w1gPgKI5IplUtCEzZNpMIPg+DqPtMLsQ79xM=;
 b=CNftfVD2pkWXCARdYcV5+dRhFStTQyUuDB58/JUl8UZadXA+3wOioec4PsyLW8Jqfs3A
 0rTWQwDDC8UnvTSUGdDbLq4CQ5RYicjVF6SqjyLIhjUNNE/sCtmUUJG5Si9oXxOapMlT
 lGyiuClCUqCX/PFqD4eKA+rwmr+ZVuaBKYuK3WRUFIHVP5HPqD5xSB6HMSVANvHGzitF
 3cMNCEve9KUBxlpWRiQZFZ4nWTnOiQzJ9QDKeIwF3EJuvINt94NcLbW8AiFzW80YyD7I
 2rsYxztFM8bVRz1Tb9cB2436xRoBWHZeKuue847+e6N5eQd+eXTY+CaQzKA+X0Zbki7h +g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p0u3jsgch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 21:04:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31RL4nKC006493
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 21:04:49 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 27 Feb 2023 13:04:49 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v2] drm/msm/dp: check core_initialized flag at both
 host_init() and host_deinit()
Date: Mon, 27 Feb 2023 13:04:37 -0800
Message-ID: <1677531877-10849-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: jwe3n-let1_Y8wDzAveWvp3Op7pmIJuY
X-Proofpoint-GUID: jwe3n-let1_Y8wDzAveWvp3Op7pmIJuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270168
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a reboot/suspend test case where system suspend is forced during
system booting up. Since dp_display_host_init() of external DP is executed
at hpd thread context, this test case may created a scenario that
dp_display_host_deinit() from pm_suspend() run before dp_display_host_init()
if hpd thread has no chance to run during booting up while suspend request
command was issued. At this scenario system will crash at aux register
access at dp_display_host_deinit() since aux clock had not yet been enabled
by dp_display_host_init().  Therefore we have to ensure aux clock enabled
by checking core_initialized flag before access aux registers at pm_suspend.

Changes in v2:
-- at commit text, dp_display_host_init() instead of host_init()
-- at commit text, dp_display_host_deinit() instead of host_deinit()

Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bde1a7c..1850738 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -460,10 +460,12 @@ static void dp_display_host_init(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_power_init(dp->power, false);
-	dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
-	dp_aux_init(dp->aux);
-	dp->core_initialized = true;
+	if (!dp->core_initialized) {
+		dp_power_init(dp->power, false);
+		dp_ctrl_reset_irq_ctrl(dp->ctrl, true);
+		dp_aux_init(dp->aux);
+		dp->core_initialized = true;
+	}
 }
 
 static void dp_display_host_deinit(struct dp_display_private *dp)
@@ -472,10 +474,12 @@ static void dp_display_host_deinit(struct dp_display_private *dp)
 		dp->dp_display.connector_type, dp->core_initialized,
 		dp->phy_initialized);
 
-	dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
-	dp_aux_deinit(dp->aux);
-	dp_power_deinit(dp->power);
-	dp->core_initialized = false;
+	if (dp->core_initialized) {
+		dp_ctrl_reset_irq_ctrl(dp->ctrl, false);
+		dp_aux_deinit(dp->aux);
+		dp_power_deinit(dp->power);
+		dp->core_initialized = false;
+	}
 }
 
 static int dp_display_usbpd_configure_cb(struct device *dev)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

