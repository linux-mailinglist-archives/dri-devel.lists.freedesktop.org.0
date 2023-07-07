Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89F74BA2E
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 01:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333C510E623;
	Fri,  7 Jul 2023 23:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87D410E624;
 Fri,  7 Jul 2023 23:53:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 367NqBeB016633; Fri, 7 Jul 2023 23:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=pTMAB5PRvHWQfm3DiiBdUhozgrLr6doK97zX9JZPqig=;
 b=d4iZlSB59FLCg8h7DNHMPMlzuuFOAL5yOn7JZ0ujm0XI2VpcCTp+j0jOrSHGHC4UfSHS
 JguunJM1yjJsGiQOVk8CH5a50wlLBsPxZ7ixToI3PBE4eJ5cUF0PtLh9A0s1HqUaamNY
 8/RFmoLEtIf11is7ZgNRAX151nxGctJopLWc61o9RYArFtFjO8gtAHISPscf++s1tgva
 ZMVW/gflS1TFF1JHydL+/GZfFgfQNUah+UsPGtzD4hlKeyen14X4ammXshS4Up3UUdBC
 oJmcM8BBbL0S8yrnDDn4+WmVAd6dh9JTvVsvcid/SadNPWYrMjpKPcKy+ZX2aoAFShMc qg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rpdxw2714-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 23:52:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 367NquKm008813
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 7 Jul 2023 23:52:56 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 7 Jul 2023 16:52:55 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 4/5] drm/msm/dp: move relevant dp initialization code from
 bind() to probe()
Date: Fri, 7 Jul 2023 16:52:22 -0700
Message-ID: <1688773943-3887-5-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: dBxxMFLhYyURnTSf4Z9_mYG73vInbMws
X-Proofpoint-ORIG-GUID: dBxxMFLhYyURnTSf4Z9_mYG73vInbMws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070217
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

In preparation of moving edp of_dp_aux_populate_bus() to
dp_display_probe(), move dp_display_request_irq(),
dp->parser->parse() and dp_power_client_init() to dp_display_probe()
too.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 48 +++++++++++++++++--------------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 -
 2 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 44580c2..185f1eb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -290,12 +290,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-	rc = dp_power_client_init(dp->power);
-	if (rc) {
-		DRM_ERROR("Power client create failed\n");
-		goto end;
-	}
-
 	rc = dp_register_audio_driver(dev, dp->audio);
 	if (rc) {
 		DRM_ERROR("Audio registration Dp failed\n");
@@ -752,6 +746,12 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
+	rc = dp->parser->parse(dp->parser);
+	if (rc) {
+		DRM_ERROR("device tree parsing failed\n");
+		goto error;
+	}
+
 	dp->catalog = dp_catalog_get(dev, &dp->parser->io);
 	if (IS_ERR(dp->catalog)) {
 		rc = PTR_ERR(dp->catalog);
@@ -768,6 +768,12 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error;
 	}
 
+	rc = dp_power_client_init(dp->power);
+	if (rc) {
+		DRM_ERROR("Power client create failed\n");
+		goto error;
+	}
+
 	dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
@@ -1196,26 +1202,20 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
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
+		dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
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
 		DRM_ERROR("failed to request IRQ%u: %d\n",
@@ -1290,6 +1290,8 @@ static int dp_display_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &dp->dp_display);
 
+	dp_display_request_irq(dp);
+
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
 	if (rc) {
 		DRM_ERROR("component add failed, rc=%d\n", rc);
@@ -1574,12 +1576,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
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

