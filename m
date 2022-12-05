Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0A1642F42
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1232B10E28C;
	Mon,  5 Dec 2022 17:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67CF10E0C4;
 Mon,  5 Dec 2022 17:44:47 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B5Gsghp005704; Mon, 5 Dec 2022 17:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=RTIPx6Gt6MSV31NF1HoxTvl37tmHMiGIQ9AukbiYeys=;
 b=faE4BzI0oppcsz34iqAsun/h5P/JAVBe9wPaZkYXi+Qj9J1e7jL8L4GDdp8m9ya/68py
 FG0A5Xn+wicx2wqwHdoY9LfACMPf+MzLXpxLLrXNrsKyC8Yhb5EjAedhh57aoKYHKKG9
 WzFlaMIxqQ6LjoCwgMM8Us9qzirAbJvjsoWBoCyeEybn9SsHkoB1Reksx2QdaX49GtI8
 /lZrNtCHG3vwluCeUy3XJc1d2MnEXkwxUE0uv5iUoRDmpYbb24a5sht8exSuwYz65dZy
 ZN5gku7+3hxLSIB4GjMBkVo0zmE/NhIPv9E0NZ+7OMWvLjKo4ILBL52DaW3WA5u5q0c7 Kg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3m7x264fxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Dec 2022 17:44:43 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B5HigEo001216
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Dec 2022 17:44:42 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 5 Dec 2022 09:44:42 -0800
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 05/13] drm/msm/dp: Stop using DP id as index in desc
Date: Mon, 5 Dec 2022 09:44:25 -0800
Message-ID: <20221205174433.16847-6-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205174433.16847-1-quic_bjorande@quicinc.com>
References: <20221205174433.16847-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: AKJM3zS629HCdG_6NpqBkCRNGulIbwCh
X-Proofpoint-ORIG-GUID: AKJM3zS629HCdG_6NpqBkCRNGulIbwCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-05_01,2022-12-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212050145
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <bjorn.andersson@linaro.org>

In the SC8280XP platform there are two identical MDSS instances, each
with the same set of DisplayPort instances, at different addresses.

By not relying on the index to define the instance id it's possible to
describe them both in the same table and hence have a single compatible.

While at it, flatten the cfg/desc structure so that the match data is
just an array of descs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---

Changes since v3:
- None

 drivers/gpu/drm/msm/dp/dp_display.c | 72 ++++++++++-------------------
 1 file changed, 25 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7ff60e5ff325..eeb292f1ad1b 100644
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
2.37.3

