Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C7D7A2877
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 22:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A94910E680;
	Fri, 15 Sep 2023 20:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A19410E67B;
 Fri, 15 Sep 2023 20:48:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FGi3gj027258; Fri, 15 Sep 2023 20:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=gDszUBcci3sH0bwn4J+q6F9DB6xrqqrnqQGFGyHbbiU=;
 b=QFLKALPRbFzZSO9D0+sm6mjb4K0qWUteVOcJIYOz1osSNyDNdne20iJjYzzQPBpYSEfX
 o6L4cB8POR6vP2fTnarfriuvWUskT7aodiIJDLD07XNffVO0SRJt9YrEaIOsVp59gc5C
 TpDbpNANEYgp+Vzb/bWd0i1ic3njMyODmxDt3x+3IqPH7Cg4ry7dtmpUqXzruo0Lxlzh
 P8y04D48gktcHg1z8YMv42ugwGtEklyy2mtMMU9kZntL3mtDuwDGQfDJsQVI25etK8qs
 NcyWG3IFsaV7bmPbwnLjyowPO2tpGgEofPdtRnIDQaBh96shZfntcBlydprI3/kjyrat FA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g86t3se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 20:48:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38FKmQZW000554
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 20:48:26 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 15 Sep 2023 13:48:25 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v2 1/7] drm/msm/dp: tie dp_display_irq_handler() with dp driver
Date: Fri, 15 Sep 2023 13:48:02 -0700
Message-ID: <1694810888-24461-2-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694810888-24461-1-git-send-email-quic_khsieh@quicinc.com>
References: <1694810888-24461-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xZpfB6a5ErEWFxfNdkSnsrNJlelaDkrI
X-Proofpoint-ORIG-GUID: xZpfB6a5ErEWFxfNdkSnsrNJlelaDkrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_17,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150186
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
 quic_abhinavk@quicinc.com, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the dp_display_irq_handler() is executed at msm_dp_modeset_init()
which ties irq registration to the DPU device's life cycle, while depending on
resources that are released as the DP device is torn down. Move register DP
driver irq handler at dp_display_probe() to have dp_display_irq_handler()
is tied with DP device.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 35 +++++++++++++----------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 -
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 76f1395..c217430 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1193,30 +1193,23 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 	return ret;
 }
 
-int dp_display_request_irq(struct msm_dp *dp_display)
+static int dp_display_request_irq(struct dp_display_private *dp)
 {
 	int rc = 0;
-	struct dp_display_private *dp;
-
-	if (!dp_display) {
-		DRM_ERROR("invalid input\n");
-		return -EINVAL;
-	}
-
-	dp = container_of(dp_display, struct dp_display_private, dp_display);
+	struct device *dev = &dp->pdev->dev;
 
-	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
 	if (!dp->irq) {
-		DRM_ERROR("failed to get irq\n");
-		return -EINVAL;
+		dp->irq = platform_get_irq(dp->pdev, 0);
+		if (!dp->irq) {
+			DRM_ERROR("failed to get irq\n");
+			return -EINVAL;
+		}
 	}
 
-	rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
-			dp_display_irq_handler,
+	rc = devm_request_irq(dev, dp->irq, dp_display_irq_handler,
 			IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
 	if (rc < 0) {
-		DRM_ERROR("failed to request IRQ%u: %d\n",
-				dp->irq, rc);
+		DRM_ERROR("failed to request IRQ%u: %d\n", dp->irq, rc);
 		return rc;
 	}
 
@@ -1287,6 +1280,10 @@ static int dp_display_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &dp->dp_display);
 
+	rc = dp_display_request_irq(dp);
+	if (rc)
+		return rc;
+
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
 	if (rc) {
 		DRM_ERROR("component add failed, rc=%d\n", rc);
@@ -1549,12 +1546,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
 
-	ret = dp_display_request_irq(dp_display);
-	if (ret) {
-		DRM_ERROR("request_irq failed, ret=%d\n", ret);
-		return ret;
-	}
-
 	ret = dp_display_get_next_bridge(dp_display);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 1e9415a..b3c08de 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -35,7 +35,6 @@ struct msm_dp {
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev);
 int dp_display_get_modes(struct msm_dp *dp_display);
-int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
 void dp_display_signal_audio_start(struct msm_dp *dp_display);
-- 
2.7.4

