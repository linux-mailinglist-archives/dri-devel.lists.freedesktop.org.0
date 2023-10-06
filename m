Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915AE7BC149
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 23:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1D410E576;
	Fri,  6 Oct 2023 21:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C99510E575;
 Fri,  6 Oct 2023 21:39:01 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 396LF0L0023886; Fri, 6 Oct 2023 21:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=zBySumyWUsTUJ5MWaB2XFCUX7En9cQIYGAhkyMs/2jM=;
 b=djrX4fGT6m/IQ+TNS9G8n5xkSN/u6NT+kWtcwKsIdFUVRlx/vVoCfxRD32PPDH9uwZfJ
 ihfj0Y1ei3jxsq4m5h2ge6zScAC24BIZzcULo9CoB7GPnFpFZkoPudy/4t8pR1OLcB0Y
 2g8zQMi/CAa71ce+GDRRHTKfvMraPbGOsxjxib/N+6NQJTjVL4/OT/x3gNWDneJR1sQz
 n+ig77nRhkeIe9gbbr2iIRQqcEz0S47nJsCpCn0NOMWtlKADbrJ7IIkYb7fFtdZlncAq
 Rg6rVwIfmD5V9MYcJf4ynVWpuMTj1pEUzpDvGCM0a5O2n2UhONUK0FztM0D9xvRT9crg Rw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3thrjdvd8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Oct 2023 21:38:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 396LctFr030895
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Oct 2023 21:38:55 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 6 Oct 2023 14:38:54 -0700
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v6 4/7] drm/msm/dp: move parser->parse() and
 dp_power_client_init() to probe
Date: Fri, 6 Oct 2023 14:38:35 -0700
Message-ID: <1696628318-15095-5-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1696628318-15095-1-git-send-email-quic_khsieh@quicinc.com>
References: <1696628318-15095-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mxeyiVF2MEJX3St54dornCjpIyMMi6HG
X-Proofpoint-GUID: mxeyiVF2MEJX3St54dornCjpIyMMi6HG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_15,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060166
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

Original both parser->parse() and dp_power_client_init() are done at
dp_display_bind() since eDP population is done at binding time.
In the preparation of having eDP population done at probe() time,
move both function from dp_display_bind() to dp_display_probe().

Changes in v6:
-- move dp_power_client_deinit() to remove()

Changes in v5:
-- explain why parser->parse() and dp_power_client_init() are moved to probe time
-- tear down sub modules if failed

Changes in v4:
-- split this patch out of "incorporate pm_runtime framework into DP driver" patch

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 32663ea..89fad67 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -276,11 +276,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	dp->dp_display.drm_dev = drm;
 	priv->dp[dp->id] = &dp->dp_display;
 
-	rc = dp->parser->parse(dp->parser);
-	if (rc) {
-		DRM_ERROR("device tree parsing failed\n");
-		goto end;
-	}
 
 
 	dp->drm_dev = drm;
@@ -291,11 +286,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
 		goto end;
 	}
 
-	rc = dp_power_client_init(dp->power);
-	if (rc) {
-		DRM_ERROR("Power client create failed\n");
-		goto end;
-	}
 
 	rc = dp_register_audio_driver(dev, dp->audio);
 	if (rc) {
@@ -328,7 +318,6 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 
 	of_dp_aux_depopulate_bus(dp->aux);
 
-	dp_power_client_deinit(dp->power);
 	dp_unregister_audio_driver(dev, dp->audio);
 	dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
@@ -1250,6 +1239,18 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
+	rc = dp->parser->parse(dp->parser);
+	if (rc) {
+		DRM_ERROR("device tree parsing failed\n");
+		goto err;
+	}
+
+	rc = dp_power_client_init(dp->power);
+	if (rc) {
+		DRM_ERROR("Power client create failed\n");
+		goto err;
+	}
+
 	/* setup event q */
 	mutex_init(&dp->event_mutex);
 	init_waitqueue_head(&dp->event_q);
@@ -1284,6 +1285,7 @@ static int dp_display_remove(struct platform_device *pdev)
 	struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
 
 	component_del(&pdev->dev, &dp_display_comp_ops);
+	dp_power_client_deinit(dp->power);
 	dp_display_deinit_sub_modules(dp);
 
 	platform_set_drvdata(pdev, NULL);
-- 
2.7.4

