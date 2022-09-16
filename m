Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D2D5BB68B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 07:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9388C10E2CD;
	Sat, 17 Sep 2022 05:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A847B10E51D;
 Fri, 16 Sep 2022 20:00:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GJm8qS013452;
 Fri, 16 Sep 2022 20:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=hWZ9jntpaOvM7/1sCNwN3AuAcy5qp9/mh/BRgZjz1Io=;
 b=lEqdZE8AP1Zmqp4B3M6Q6ptJUR+TceqS/2bW4jBKSNjm2niLiKebYpURVzSX+Z9lu6eq
 5mZ5c+3/+CdEmox9s3FlKZlO3FSz9DvjtHnJsJSGif4JeLgaq0bt/QrsVaugezTkDfvy
 qjIKv1SYbvzHE14zyaKA7N1taQIunpzwZsck1vtaMxtisYq9mLbpLDcKZ7L5ClDBo4PP
 X9+PoKkTZz+fnvRHcBAFMKzdJQ0gvAT5zoAKw2rw+++aVdtY9lsO13TZPgPZq6ZSK0WK
 UkHyS0/P9ZU/gW3cRB1bTmMs7gfZDXFGxRRo8eBm4kHnUUn5WnG9dGhO1dIyJm8LSHMM VA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jmymc82d2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 20:00:36 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28GK0ZB5029461
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Sep 2022 20:00:35 GMT
Received: from core-thresher1.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 16 Sep 2022 13:00:35 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 2/7] drm/msm/dp: Stop using DP id as index in desc
Date: Fri, 16 Sep 2022 13:00:23 -0700
Message-ID: <20220916200028.25009-3-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220916200028.25009-1-quic_bjorande@quicinc.com>
References: <20220916200028.25009-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: is4-wwUPFWlYgfuwTsRatFBzTiYCxZ7w
X-Proofpoint-ORIG-GUID: is4-wwUPFWlYgfuwTsRatFBzTiYCxZ7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_12,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 clxscore=1011 bulkscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160144
X-Mailman-Approved-At: Sat, 17 Sep 2022 05:33:33 +0000
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

In the SC8280XP platform there are two identical MDSS instances, each
with the same set of DisplayPort instances, at different addresses.

By not relying on the index to define the instance id it's possible to
describe them both in the same table and hence have a single compatible.

While at it, flatten the cfg/desc structure so that the match data is
just an array of descs.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 72 ++++++++++-------------------
 1 file changed, 25 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bfd0aeff3f0d..2d9bbc335786 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -122,61 +122,41 @@ struct dp_display_private {
 
 struct msm_dp_desc {
 	phys_addr_t io_start;
+	unsigned int id;
 	unsigned int connector_type;
 	bool wide_bus_en;
 };
 
-struct msm_dp_config {
-	const struct msm_dp_desc *descs;
-	size_t num_descs;
-};
-
 static const struct msm_dp_desc sc7180_dp_descs[] = {
-	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-};
-
-static const struct msm_dp_config sc7180_dp_cfg = {
-	.descs = sc7180_dp_descs,
-	.num_descs = ARRAY_SIZE(sc7180_dp_descs),
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	{}
 };
 
 static const struct msm_dp_desc sc7280_dp_descs[] = {
-	[MSM_DP_CONTROLLER_0] =	{ .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
-	[MSM_DP_CONTROLLER_1] =	{ .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
-};
-
-static const struct msm_dp_config sc7280_dp_cfg = {
-	.descs = sc7280_dp_descs,
-	.num_descs = ARRAY_SIZE(sc7280_dp_descs),
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
+	{}
 };
 
 static const struct msm_dp_desc sc8180x_dp_descs[] = {
-	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-	[MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-	[MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
-};
-
-static const struct msm_dp_config sc8180x_dp_cfg = {
-	.descs = sc8180x_dp_descs,
-	.num_descs = ARRAY_SIZE(sc8180x_dp_descs),
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP },
+	{}
 };
 
 static const struct msm_dp_desc sm8350_dp_descs[] = {
-	[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
-};
-
-static const struct msm_dp_config sm8350_dp_cfg = {
-	.descs = sm8350_dp_descs,
-	.num_descs = ARRAY_SIZE(sm8350_dp_descs),
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	{}
 };
 
 static const struct of_device_id dp_dt_match[] = {
-	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
-	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
-	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
-	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
-	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_cfg },
-	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_cfg },
+	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
+	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
+	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
+	{ .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_descs },
+	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
+	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
 	{}
 };
 
@@ -1262,10 +1242,9 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 	return 0;
 }
 
-static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev,
-						     unsigned int *id)
+static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pdev)
 {
-	const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
+	const struct msm_dp_desc *descs = of_device_get_match_data(&pdev->dev);
 	struct resource *res;
 	int i;
 
@@ -1273,11 +1252,9 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	if (!res)
 		return NULL;
 
-	for (i = 0; i < cfg->num_descs; i++) {
-		if (cfg->descs[i].io_start == res->start) {
-			*id = i;
-			return &cfg->descs[i];
-		}
+	for (i = 0; i < descs[i].io_start; i++) {
+		if (descs[i].io_start == res->start)
+			return &descs[i];
 	}
 
 	dev_err(&pdev->dev, "unknown displayport instance\n");
@@ -1299,12 +1276,13 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (!dp)
 		return -ENOMEM;
 
-	desc = dp_display_get_desc(pdev, &dp->id);
+	desc = dp_display_get_desc(pdev);
 	if (!desc)
 		return -EINVAL;
 
 	dp->pdev = pdev;
 	dp->name = "drm_dp";
+	dp->id = desc->id;
 	dp->dp_display.connector_type = desc->connector_type;
 	dp->wide_bus_en = desc->wide_bus_en;
 	dp->dp_display.is_edp =
-- 
2.17.1

