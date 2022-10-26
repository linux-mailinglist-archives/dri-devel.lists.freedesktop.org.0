Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB2860D9CA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 05:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7472F10E35B;
	Wed, 26 Oct 2022 03:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF3E10E33E;
 Wed, 26 Oct 2022 03:26:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q36mXo031450;
 Wed, 26 Oct 2022 03:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=ZnJpMqmfhKYp2/T4VQHOFWCyerBbM9lfkzEFJYDWu+s=;
 b=g1/7mHM6o0Z3BcZnjNfVQI/+9g++DSfeSpUyiYM9xJqxoa0VjEmDuKMzlKcAMnrPUpf0
 SEJ/rszkvZWoeLb9waCfd48pvfrLzPMwIa+i3mb3dYtZ+NEIAOz7QKwPQHafRtPWMBQC
 K88G+4F0RLPKFsM3V6+1Kx0h4Ms+RFXiok8NjEORsT7xTluxrFuXKFwRk63R+MOMnAML
 n4nbBpqONwdWlJEaRkKuSNmFUTp34pC1TPom9tTnv92TRpI/vUEfrEHsCWYmLTbvvXoj
 4jMEcWpeQh1wXu6aZUiE/XQPxDEJ3HarAZtzYupjhU7twTd93Q3VkRBMff5mjVzHXJv5 6A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kebr9t1yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 03:26:34 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29Q3QXMZ002599
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 03:26:33 GMT
Received: from th-lint-050.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 25 Oct 2022 20:26:33 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 04/12] drm/msm/dp: Stop using DP id as index in desc
Date: Tue, 25 Oct 2022 20:26:16 -0700
Message-ID: <20221026032624.30871-5-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221026032624.30871-1-quic_bjorande@quicinc.com>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DEYfCUG5m5QtVR2MR9oC9WevvnCaX1SK
X-Proofpoint-ORIG-GUID: DEYfCUG5m5QtVR2MR9oC9WevvnCaX1SK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_15,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210260016
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Kuogee
 Hsieh <quic_khsieh@quicinc.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Changes since v2:
- None

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
2.37.3

