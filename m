Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB8D7FDEC0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 18:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951D610E656;
	Wed, 29 Nov 2023 17:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD3A10E649;
 Wed, 29 Nov 2023 17:47:26 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ATEK6QZ014748; Wed, 29 Nov 2023 17:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=uIxf+ZKLGL7g2ELKPG4AkNXCOvEGLX2PrXKPG5Fuh8U=;
 b=a9L1OYFlhWZzd9BjJaF67t+G/svlSf//VMFVy7Bb33Y23rWxziQkHbT0c2UshpAGlGDb
 o62nm/xD/l6ifdOhHAIPZJ19PkDKXReW1nsjvhZZv+R9ghj+PJLv6vCCla2CTPxudfJR
 rvEFoRmPQCe9PCNRlkM9rMjkwe8Mqeaa9NKK3p8rHTBmh7WEv6SyB3LaQlaTnvM9bIki
 M9JEZAn6zjusDrfm6ahYQG5ze6bDuhplorB8Sj5MwS7+O7TPUELT4NiVpbTbPXV1jdwj
 DO4bwvdRpsFYiIdYAWAYsr36LG2paAQDU5VXJwGz9q/PMZzMy+kVMMkAQqTWyi9RYT+n GQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unmrab90a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Nov 2023 17:47:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ATHlIor030343
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Nov 2023 17:47:18 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 29 Nov 2023 09:47:17 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v8 7/7] drm/msm/dp: move of_dp_aux_populate_bus() to eDP
 probe()
Date: Wed, 29 Nov 2023 09:46:50 -0800
Message-ID: <1701280010-32476-8-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1701280010-32476-1-git-send-email-quic_khsieh@quicinc.com>
References: <1701280010-32476-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jrJ2Lk_wETXBPOMFc--QE-c4VuyBKUnk
X-Proofpoint-ORIG-GUID: jrJ2Lk_wETXBPOMFc--QE-c4VuyBKUnk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_15,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290135
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

Currently eDP population is done at msm_dp_modeset_init() which happen
at binding time. Move eDP population to be done at display probe time
so that probe deferral cases can be handled effectively.
wait_for_hpd_asserted callback is added during drm_dp_aux_init()
to ensure eDP's HPD is up before proceeding eDP population.

Changes in v5:
-- inline dp_display_auxbus_population() and delete it

Changes in v4:
-- delete duplicate initialize code to dp_aux before drm_dp_aux_register()
-- delete of_get_child_by_name(dev->of_node, "aux-bus") and inline the
   function
-- not initialize rc = 0

Changes in v3:
-- add done_probing callback into devm_of_dp_aux_populate_bus()

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 34 ++++++++++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.c | 59 +++++++++++++++----------------------
 2 files changed, 51 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 10b6eeb..03f4951 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -479,7 +479,6 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
 
 int dp_aux_register(struct drm_dp_aux *dp_aux)
 {
-	struct dp_aux_private *aux;
 	int ret;
 
 	if (!dp_aux) {
@@ -487,12 +486,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
 		return -EINVAL;
 	}
 
-	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
-
-	aux->dp_aux.name = "dpu_dp_aux";
-	aux->dp_aux.dev = aux->dev;
-	aux->dp_aux.transfer = dp_aux_transfer;
-	ret = drm_dp_aux_register(&aux->dp_aux);
+	ret = drm_dp_aux_register(dp_aux);
 	if (ret) {
 		DRM_ERROR("%s: failed to register drm aux: %d\n", __func__,
 				ret);
@@ -507,6 +501,21 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
 	drm_dp_aux_unregister(dp_aux);
 }
 
+static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
+				 unsigned long wait_us)
+{
+	int ret;
+	struct dp_aux_private *aux;
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+
+	pm_runtime_get_sync(aux->dev);
+	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+	pm_runtime_put_sync(aux->dev);
+
+	return ret;
+}
+
 struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 			      bool is_edp)
 {
@@ -530,6 +539,17 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 	aux->catalog = catalog;
 	aux->retry_cnt = 0;
 
+	/*
+	 * Use the drm_dp_aux_init() to use the aux adapter
+	 * before registering AUX with the DRM device so that
+	 * msm eDP panel can be detected by generic_dep_panel_probe().
+	 */
+	aux->dp_aux.name = "dpu_dp_aux";
+	aux->dp_aux.dev = dev;
+	aux->dp_aux.transfer = dp_aux_transfer;
+	aux->dp_aux.wait_hpd_asserted = dp_wait_hpd_asserted;
+	drm_dp_aux_init(&aux->dp_aux);
+
 	return &aux->dp_aux;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6693582..cfbc610 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1199,6 +1199,17 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	return NULL;
 }
 
+static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
+{
+	int rc;
+
+	rc = component_add(aux->dev, &dp_display_comp_ops);
+	if (rc)
+		DRM_ERROR("eDP component add failed, rc=%d\n", rc);
+
+	return rc;
+}
+
 static int dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1264,10 +1275,18 @@ static int dp_display_probe(struct platform_device *pdev)
 	if (rc)
 		goto err;
 
-	rc = component_add(&pdev->dev, &dp_display_comp_ops);
-	if (rc) {
-		DRM_ERROR("component add failed, rc=%d\n", rc);
-		goto err;
+	if (dp->dp_display.is_edp) {
+		rc = devm_of_dp_aux_populate_bus(dp->aux, dp_auxbus_done_probe);
+		if (rc) {
+			DRM_ERROR("eDP auxbus population failed, rc=%d\n", rc);
+			goto err;
+		}
+	} else {
+		rc = component_add(&pdev->dev, &dp_display_comp_ops);
+		if (rc) {
+			DRM_ERROR("component add failed, rc=%d\n", rc);
+			goto err;
+		}
 	}
 
 	return rc;
@@ -1283,7 +1302,6 @@ static void dp_display_remove(struct platform_device *pdev)
 
 	component_del(&pdev->dev, &dp_display_comp_ops);
 	dp_display_deinit_sub_modules(dp);
-
 	platform_set_drvdata(pdev, NULL);
 }
 
@@ -1389,29 +1407,8 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 {
 	int rc;
 	struct dp_display_private *dp_priv;
-	struct device_node *aux_bus;
-	struct device *dev;
 
 	dp_priv = container_of(dp, struct dp_display_private, dp_display);
-	dev = &dp_priv->dp_display.pdev->dev;
-	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
-
-	if (aux_bus && dp->is_edp) {
-		/*
-		 * The code below assumes that the panel will finish probing
-		 * by the time devm_of_dp_aux_populate_ep_devices() returns.
-		 * This isn't a great assumption since it will fail if the
-		 * panel driver is probed asynchronously but is the best we
-		 * can do without a bigger driver reorganization.
-		 */
-		rc = of_dp_aux_populate_bus(dp_priv->aux, NULL);
-		of_node_put(aux_bus);
-		if (rc)
-			goto error;
-	} else if (dp->is_edp) {
-		DRM_ERROR("eDP aux_bus not found\n");
-		return -ENODEV;
-	}
 
 	/*
 	 * External bridges are mandatory for eDP interfaces: one has to
@@ -1424,17 +1421,9 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 	if (!dp->is_edp && rc == -ENODEV)
 		return 0;
 
-	if (!rc) {
+	if (!rc)
 		dp->next_bridge = dp_priv->parser->next_bridge;
-		return 0;
-	}
 
-error:
-	if (dp->is_edp) {
-		of_dp_aux_depopulate_bus(dp_priv->aux);
-		dp_display_host_phy_exit(dp_priv);
-		dp_display_host_deinit(dp_priv);
-	}
 	return rc;
 }
 
-- 
2.7.4

