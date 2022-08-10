Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E20B58F182
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 19:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C17E8DD2D;
	Wed, 10 Aug 2022 17:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1557B8BD26;
 Wed, 10 Aug 2022 17:22:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27AGXV3T009468;
 Wed, 10 Aug 2022 17:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=VyhYlud2uqfovhSZhzzloCqW5+1HfHKs87ndVD6JKqA=;
 b=V0CpsnGlbjhNrU7Ddz4E9qKCnrqJ4xm3uWadcWjXfpGdsyy68hyT56XXWlG2q0LuoPah
 +jWE97xy3aSPVE3aEyeEJZYRljBtAS5+yIoHkMDGkqcfh0a21mvyeJCW1GcUugrlPC/y
 WOMNUUqwKw4q/xZPmtMCnClSTXj7ucayleqFe1+wjfH9dc9zHe73yQyb/a/9cWZLdfX8
 y2piGc/jBrdcrXHMiHcWctTAXG8b4cT0s0aROsYU2xB4CQusAEMchW8s0YnpMkgsSEsn
 s62JXoAWabHTHAIXPPvYjaqujFGkq000SoFJ1/t8FsFsUbcPSDrCmUTexAOtLfU3jioA Jw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3huwr5k8nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 17:22:45 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.47.97.222])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27AHMh6m027332
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Aug 2022 17:22:44 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 10 Aug 2022 10:22:43 -0700
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 10 Aug 2022 10:22:42 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <dianders@chromium.org>, <vkoul@kernel.org>, <daniel@ffwll.ch>,
 <airlied@linux.ie>, <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v2] drm/msm/dp: check hpd_state before push idle pattern at
 dp_bridge_disable()
Date: Wed, 10 Aug 2022 10:22:34 -0700
Message-ID: <1660152154-17879-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YO5FJ4EgDbVWc2QJ9bjYO2-lWjYKdEBP
X-Proofpoint-ORIG-GUID: YO5FJ4EgDbVWc2QJ9bjYO2-lWjYKdEBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_11,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100053
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
 quic_khsieh@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dp_bridge_disable() is the first step toward tearing down main link.
Its major function is to start transmitting idle pattern to replace
video stream. This patch will check hpd_state to make sure main link
is enabled before commit changes of main link's configuration to
push idle pattern out to avoid system crashing due to main link clock
is disabled while access main link registers.

Changes in v2:
-- changes Fixes patch
-- fix eported-by
-- add Closes tag

Fixes: 375a126090b9 ("drm/msm/dp: tear down main link at unplug handle immediately")
Reported-by: leonard@lausen.nl
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/17
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b36f8b6..678289a 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1729,10 +1729,20 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
 	struct dp_display_private *dp_display;
+	u32 state;
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
+	mutex_lock(&dp_display->event_mutex);
+
+	state = dp_display->hpd_state;
+	if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {
+		mutex_unlock(&dp_display->event_mutex);
+		return;
+	}
+
 	dp_ctrl_push_idle(dp_display->ctrl);
+	mutex_unlock(&dp_display->event_mutex);
 }
 
 void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

