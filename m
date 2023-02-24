Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6596A2182
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 19:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F96710ECE0;
	Fri, 24 Feb 2023 18:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDBB110ECE0;
 Fri, 24 Feb 2023 18:30:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31OFkQvN024245; Fri, 24 Feb 2023 18:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=dgvQa8CmPE5BVE0cHwpo1N2gjIqFpZorHLJU3v0F05g=;
 b=SaxLtKrfPD9yKZiJ9nbhKOgDVPC9Lk163eOYUc6oNPwaMJxd5J3oLlcqiYoR6Epac/qL
 RzuXzKbHB9OlzZJthzaZxvsZDL/vu5KgqLs5hFqV1pcbDWlqaHKaY5uqSekOAUVwXTDq
 aU0Kpom8LSQNbY/gxGV+ClxLC9+y+J0n1YJqXz52QHFdJyZYJsgANm+dF8WR4uubv05m
 d1N7VD0AM983PCksqTu1BUSdhg3hG4Qgn5FCbQbBC5/QT6SvFod/wrtH5Fay1IFO+9q8
 rm322c16YWO8r1K3qE/DtBL/HX53EMCgBEAelEP5mS6juxbY3FuRYY+fFR6KVDoXvXZ6 hg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny05mre8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 18:30:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31OIU611020461
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Feb 2023 18:30:06 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 24 Feb 2023 10:30:06 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@gmail.com>, <agross@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH] drm/msm/dp: check core_initialized flag at both host_init()
 and host_deinit()
Date: Fri, 24 Feb 2023 10:29:58 -0800
Message-ID: <1677263398-13801-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Un4DeNeBPrw8ZWiQG_muEsoh48V6PoZv
X-Proofpoint-ORIG-GUID: Un4DeNeBPrw8ZWiQG_muEsoh48V6PoZv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0 mlxscore=0
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240146
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
system booting up. Since host_init() of external DP is executed at hpd
thread context, this test case may created a scenario that host_deinit()
from pm_suspend() run before host_init() if hpd thread has no chance to
run during booting up while suspend request command was issued.
At this scenario system will crash at aux register access at host_deinit()
since aux clock had not yet been enabled by host_init().  Therefore we
have to ensure aux clock enabled by checking core_initialized flag before
access aux registers at pm_suspend.

Fixes: 989ebe7bc446 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
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

