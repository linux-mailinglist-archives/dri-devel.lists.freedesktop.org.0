Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AFB6A868D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 17:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AEF10E514;
	Thu,  2 Mar 2023 16:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529D010E1B4;
 Thu,  2 Mar 2023 16:34:25 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322EdGWc003184; Thu, 2 Mar 2023 16:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=eo2nQg77us1PQ8ET6X6MkgsO2Gdmg3yPFXTsx/qwwBQ=;
 b=LIWLaFhnsc0OiICTifnTXibasCpykKpAZa+GPTYS658qErsrLkmgXafP7NJ4hAXO+NLj
 xtH49v9dwpD5WfR1uSh8nxw8sy4hzyOW02Hv2EBRLmu2CYS1oT+e9rx9SdUiZnSebaYF
 42GvWNh53j2jBES/kBED+JgJGpNP0lARUFvNikbWJLCcBXeGGY4pZs6o42hjvANX5Rec
 yWnlVlcMopF2A99zlJYrDQLZn5YJYc2O2vau0KfWCeXSXGwiMqjkzF2QAynjBQ3eM8wF
 Ym1S/aJluISZj06wylh2XMo9tloKsdg5upTDl3pf6NV42dkLXiGlS+jD0TO5aBafOVMI cA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p28cfbq84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:34:23 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 322GYMd9019936
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Mar 2023 16:34:22 GMT
Received: from vpolimer-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 2 Mar 2023 08:34:17 -0800
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v14 08/14] drm/msm/dp: use atomic callbacks for DP bridge ops
Date: Thu, 2 Mar 2023 22:03:11 +0530
Message-ID: <1677774797-31063-9-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1677774797-31063-1-git-send-email-quic_vpolimer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: U6g8OU3P1zh0uUCw3WJ-3lZ5DvoSOSMk
X-Proofpoint-ORIG-GUID: U6g8OU3P1zh0uUCw3WJ-3lZ5DvoSOSMk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_08,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=903
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303020142
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, quic_khsieh@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use atomic variants for DP bridge callback functions so that
the atomic state can be accessed in the interface drivers.
The atomic state will help the driver find out if the display
is in self refresh state.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 ++++++---
 drivers/gpu/drm/msm/dp/dp_drm.c     | 6 +++---
 drivers/gpu/drm/msm/dp/dp_drm.h     | 9 ++++++---
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bde1a7c..985287e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1652,7 +1652,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void dp_bridge_enable(struct drm_bridge *drm_bridge)
+void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+			     struct drm_bridge_state *old_bridge_state)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
@@ -1707,7 +1708,8 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	mutex_unlock(&dp_display->event_mutex);
 }
 
-void dp_bridge_disable(struct drm_bridge *drm_bridge)
+void dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+			      struct drm_bridge_state *old_bridge_state)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
@@ -1718,7 +1720,8 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
 	dp_ctrl_push_idle(dp_display->ctrl);
 }
 
-void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
+void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+				   struct drm_bridge_state *old_bridge_state)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 275370f..3252d50 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -94,9 +94,9 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset           = drm_atomic_helper_bridge_reset,
-	.enable       = dp_bridge_enable,
-	.disable      = dp_bridge_disable,
-	.post_disable = dp_bridge_post_disable,
+	.atomic_enable          = dp_bridge_atomic_enable,
+	.atomic_disable         = dp_bridge_atomic_disable,
+	.atomic_post_disable    = dp_bridge_atomic_post_disable,
 	.mode_set     = dp_bridge_mode_set,
 	.mode_valid   = dp_bridge_mode_valid,
 	.get_modes    = dp_bridge_get_modes,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 250f7c6..afe79b8 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -23,9 +23,12 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder);
 
-void dp_bridge_enable(struct drm_bridge *drm_bridge);
-void dp_bridge_disable(struct drm_bridge *drm_bridge);
-void dp_bridge_post_disable(struct drm_bridge *drm_bridge);
+void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+			     struct drm_bridge_state *old_bridge_state);
+void dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+			      struct drm_bridge_state *old_bridge_state);
+void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+				   struct drm_bridge_state *old_bridge_state);
 enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode);
-- 
2.7.4

