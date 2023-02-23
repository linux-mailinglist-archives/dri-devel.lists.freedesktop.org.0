Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6696A0B4A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CCF10EB89;
	Thu, 23 Feb 2023 13:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9888010EB89;
 Thu, 23 Feb 2023 13:57:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NB5IvO016391; Thu, 23 Feb 2023 13:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=l8TV4wziODhnWMNfw51Yr1Ob/oEB18/ZBAhON/fJ9/o=;
 b=hYWmX5KvseEOkyNv/snqVaqd6YneAhGD/A7bnEj8Kv0L6Db3PsnTegxLQXAHTU9ELxwY
 zBK+IsYQ4EoICwza6GncJh8cH2Z/1e6xW9jHMwIIgS7MNJbvePxwtZXxW+rRkWQlSWR5
 wY61X7PbHa8jq3HHxmnc0ERLjIEgjUuo5iVRxU9X6iyZRNUqIZU4+0BqotpYcn48DC1/
 Yt79DXH4tFrUNLtkdNj+ZgYnA4ALpkIrSs1Jsw8aVDpG0hwHxv79EwcPuX50x1XL9gUQ
 l6NxGx77r8PNzmluG7UksTRZDZTqZxBvdRSBqLvJNP39hqgujltHGTUcJy//Zfgwc2Ue BQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nwyc5hhax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 13:57:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31NDvD13031304
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 13:57:13 GMT
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Thu, 23 Feb 2023 05:57:07 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 1/2] drm/msm/dp: enumerate edp panel during driver probe
Date: Thu, 23 Feb 2023 19:26:34 +0530
Message-ID: <20230223135635.30659-2-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
References: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HX9OIdFG-Im8kzouc5ZoKZuS9ygLzk_8
X-Proofpoint-GUID: HX9OIdFG-Im8kzouc5ZoKZuS9ygLzk_8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_08,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230114
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dianders@chromium.org, quic_bjorande@quicinc.com, quic_vproddut@quicinc.com,
 airlied@linux.ie, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 seanpaul@chromium.org, dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The eDP panel is identified and enumerated during probe of the panel-edp
driver. The current DP driver triggers this panel-edp driver probe while
getting the panel-bridge associated with the eDP panel from the platform
driver bind. If the panel-edp probe is deferred, then the whole bunch of
MDSS parent and child drivers have to defer and roll back.

So, we want to move the panel enumeration from bind to probe so that the
probe defer is easier to handle and also both the drivers appear consistent
in panel enumeration. This change moves the DP driver panel-bridge
enumeration to probe.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 149 ++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/dp/dp_catalog.c |  12 +++
 drivers/gpu/drm/msm/dp/dp_catalog.h |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c |  80 ++++++---------
 4 files changed, 182 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index cc3efed593aa..5da95dfdeede 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -110,7 +110,7 @@ static ssize_t dp_aux_write(struct dp_aux_private *aux,
 }
 
 static ssize_t dp_aux_cmd_fifo_tx(struct dp_aux_private *aux,
-			      struct drm_dp_aux_msg *msg)
+			      struct drm_dp_aux_msg *msg, bool poll)
 {
 	ssize_t ret;
 	unsigned long time_left;
@@ -121,10 +121,16 @@ static ssize_t dp_aux_cmd_fifo_tx(struct dp_aux_private *aux,
 	if (ret < 0)
 		return ret;
 
-	time_left = wait_for_completion_timeout(&aux->comp,
+	if (!poll) {
+		time_left = wait_for_completion_timeout(&aux->comp,
 						msecs_to_jiffies(250));
-	if (!time_left)
-		return -ETIMEDOUT;
+		if (!time_left)
+			return -ETIMEDOUT;
+	} else {
+		ret = dp_catalog_aux_poll_and_get_hw_interrupt(aux->catalog);
+		if (!ret)
+			dp_aux_isr(&aux->dp_aux);
+	}
 
 	return ret;
 }
@@ -238,7 +244,7 @@ static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
  */
 static void dp_aux_transfer_helper(struct dp_aux_private *aux,
 				   struct drm_dp_aux_msg *input_msg,
-				   bool send_seg)
+				   bool send_seg, bool poll)
 {
 	struct drm_dp_aux_msg helper_msg;
 	u32 message_size = 0x10;
@@ -278,7 +284,7 @@ static void dp_aux_transfer_helper(struct dp_aux_private *aux,
 		helper_msg.address = segment_address;
 		helper_msg.buffer = &aux->segment;
 		helper_msg.size = 1;
-		dp_aux_cmd_fifo_tx(aux, &helper_msg);
+		dp_aux_cmd_fifo_tx(aux, &helper_msg, poll);
 	}
 
 	/*
@@ -292,7 +298,7 @@ static void dp_aux_transfer_helper(struct dp_aux_private *aux,
 	helper_msg.address = input_msg->address;
 	helper_msg.buffer = &aux->offset;
 	helper_msg.size = 1;
-	dp_aux_cmd_fifo_tx(aux, &helper_msg);
+	dp_aux_cmd_fifo_tx(aux, &helper_msg, poll);
 
 end:
 	aux->offset += message_size;
@@ -300,6 +306,122 @@ static void dp_aux_transfer_helper(struct dp_aux_private *aux,
 		aux->segment = 0x0; /* reset segment at end of block */
 }
 
+/*
+ * This function does the real job to process an AUX transaction.
+ * It will call aux_reset() function to reset the AUX channel,
+ * if the waiting is timeout.
+ */
+static ssize_t dp_aux_transfer_init(struct drm_dp_aux *dp_aux,
+			       struct drm_dp_aux_msg *msg)
+{
+	ssize_t ret;
+	int const aux_cmd_native_max = 16;
+	int const aux_cmd_i2c_max = 128;
+	struct dp_aux_private *aux;
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+
+	aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
+
+	/* Ignore address only message */
+	if (msg->size == 0 || !msg->buffer) {
+		msg->reply = aux->native ?
+			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
+		return msg->size;
+	}
+
+	/* msg sanity check */
+	if ((aux->native && msg->size > aux_cmd_native_max) ||
+	    msg->size > aux_cmd_i2c_max) {
+		DRM_ERROR("%s: invalid msg: size(%zu), request(%x)\n",
+			__func__, msg->size, msg->request);
+		return -EINVAL;
+	}
+
+	mutex_lock(&aux->mutex);
+	if (!aux->initted) {
+		ret = -EIO;
+		goto exit;
+	}
+
+	/*
+	 * For eDP it's important to give a reasonably long wait here for HPD
+	 * to be asserted. This is because the panel driver may have _just_
+	 * turned on the panel and then tried to do an AUX transfer. The panel
+	 * driver has no way of knowing when the panel is ready, so it's up
+	 * to us to wait. For DP we never get into this situation so let's
+	 * avoid ever doing the extra long wait for DP.
+	 */
+	if (aux->is_edp) {
+		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
+		if (ret) {
+			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
+			goto exit;
+		}
+	}
+
+	dp_aux_update_offset_and_segment(aux, msg);
+	dp_aux_transfer_helper(aux, msg, true, true);
+
+	aux->read = msg->request & (DP_AUX_I2C_READ & DP_AUX_NATIVE_READ);
+	aux->cmd_busy = true;
+
+	if (aux->read) {
+		aux->no_send_addr = true;
+		aux->no_send_stop = false;
+	} else {
+		aux->no_send_addr = true;
+		aux->no_send_stop = true;
+	}
+
+	ret = dp_aux_cmd_fifo_tx(aux, msg, true);
+
+	/* TODO: why is fifo_rx necessary here?
+	 * Ideally fifo_rx need not be executed for an aux write
+	 */
+	ret = dp_aux_cmd_fifo_rx(aux, msg);
+
+	if (ret < 0) {
+		if (aux->native) {
+			aux->retry_cnt++;
+			if (!(aux->retry_cnt % MAX_AUX_RETRIES))
+				dp_catalog_aux_update_cfg(aux->catalog);
+		}
+		/* reset aux if link is in connected state */
+		if (dp_catalog_link_is_connected(aux->catalog))
+			dp_catalog_aux_reset(aux->catalog);
+	} else {
+		aux->retry_cnt = 0;
+		switch (aux->aux_error_num) {
+		case DP_AUX_ERR_NONE:
+			if (aux->read)
+				ret = dp_aux_cmd_fifo_rx(aux, msg);
+			msg->reply = aux->native ? DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
+			break;
+		case DP_AUX_ERR_DEFER:
+			msg->reply = aux->native ?
+				DP_AUX_NATIVE_REPLY_DEFER : DP_AUX_I2C_REPLY_DEFER;
+			break;
+		case DP_AUX_ERR_PHY:
+		case DP_AUX_ERR_ADDR:
+		case DP_AUX_ERR_NACK:
+		case DP_AUX_ERR_NACK_DEFER:
+			msg->reply = aux->native ? DP_AUX_NATIVE_REPLY_NACK : DP_AUX_I2C_REPLY_NACK;
+			break;
+		case DP_AUX_ERR_TOUT:
+			ret = -ETIMEDOUT;
+			break;
+		}
+	}
+
+	aux->cmd_busy = false;
+
+exit:
+	mutex_unlock(&aux->mutex);
+
+	return ret;
+}
+
 /*
  * This function does the real job to process an AUX transaction.
  * It will call aux_reset() function to reset the AUX channel,
@@ -355,7 +477,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	}
 
 	dp_aux_update_offset_and_segment(aux, msg);
-	dp_aux_transfer_helper(aux, msg, true);
+	dp_aux_transfer_helper(aux, msg, true, false);
 
 	aux->read = msg->request & (DP_AUX_I2C_READ & DP_AUX_NATIVE_READ);
 	aux->cmd_busy = true;
@@ -368,7 +490,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 		aux->no_send_stop = true;
 	}
 
-	ret = dp_aux_cmd_fifo_tx(aux, msg);
+	ret = dp_aux_cmd_fifo_tx(aux, msg, false);
 	if (ret < 0) {
 		if (aux->native) {
 			aux->retry_cnt++;
@@ -535,6 +657,15 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
 	aux->catalog = catalog;
 	aux->retry_cnt = 0;
 
+	/*
+	 * Use the drm_dp_aux_init() to use the aux adapter
+	 * before registering aux with the DRM device.
+	 */
+	aux->dp_aux.name = "dpu_dp_aux";
+	aux->dp_aux.dev = dev;
+	aux->dp_aux.transfer = dp_aux_transfer_init;
+	drm_dp_aux_init(&aux->dp_aux);
+
 	return &aux->dp_aux;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 676279d0ca8d..ccf0400176f0 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -258,6 +258,18 @@ int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
 				2000, 500000);
 }
 
+int dp_catalog_aux_poll_and_get_hw_interrupt(struct dp_catalog *dp_catalog)
+{
+	u32 aux;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	return readl_poll_timeout(catalog->io->dp_controller.ahb.base +
+				REG_DP_INTR_STATUS,
+				aux, aux & DP_INTERRUPT_STATUS1,
+				250, 250000);
+}
+
 static void dump_regs(void __iomem *base, int len)
 {
 	int i;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 1f717f45c115..ad4a9e0f71f2 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -87,6 +87,7 @@ void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
+int dp_catalog_aux_poll_and_get_hw_interrupt(struct dp_catalog *dp_catalog);
 
 /* DP Controller APIs */
 void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bde1a7ce442f..a5dcef040b74 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -275,13 +275,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
 	dp->dp_display.drm_dev = drm;
 	priv->dp[dp->id] = &dp->dp_display;
 
-	rc = dp->parser->parse(dp->parser);
-	if (rc) {
-		DRM_ERROR("device tree parsing failed\n");
-		goto end;
-	}
-
-
 	dp->drm_dev = drm;
 	dp->aux->drm_dev = drm;
 	rc = dp_aux_register(dp->aux);
@@ -290,12 +283,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
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
@@ -787,6 +774,12 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
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
@@ -803,6 +796,12 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
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
@@ -1338,12 +1337,29 @@ static int dp_display_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, &dp->dp_display);
 
+	if (dp->dp_display.is_edp) {
+		dp_display_host_init(dp);
+		dp_display_host_phy_init(dp);
+		dp_catalog_ctrl_hpd_config(dp->catalog);
+
+		rc = devm_of_dp_aux_populate_bus(dp->aux, NULL);
+
+		dp_display_host_phy_exit(dp);
+		dp_display_host_deinit(dp);
+
+		if (rc) {
+			DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
+			goto error;
+		}
+	}
+
 	rc = component_add(&pdev->dev, &dp_display_comp_ops);
 	if (rc) {
 		DRM_ERROR("component add failed, rc=%d\n", rc);
 		dp_display_deinit_sub_modules(dp);
 	}
 
+error:
 	return rc;
 }
 
@@ -1546,40 +1562,8 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 {
 	int rc;
 	struct dp_display_private *dp_priv;
-	struct device_node *aux_bus;
-	struct device *dev;
 
 	dp_priv = container_of(dp, struct dp_display_private, dp_display);
-	dev = &dp_priv->pdev->dev;
-	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
-
-	if (aux_bus && dp->is_edp) {
-		dp_display_host_init(dp_priv);
-		dp_catalog_ctrl_hpd_config(dp_priv->catalog);
-		dp_display_host_phy_init(dp_priv);
-		enable_irq(dp_priv->irq);
-
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
-
-		rc = devm_add_action_or_reset(dp->drm_dev->dev,
-						of_dp_aux_depopulate_bus_void,
-						dp_priv->aux);
-		if (rc)
-			goto error;
-	} else if (dp->is_edp) {
-		DRM_ERROR("eDP aux_bus not found\n");
-		return -ENODEV;
-	}
 
 	/*
 	 * External bridges are mandatory for eDP interfaces: one has to
@@ -1597,12 +1581,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 		return 0;
 	}
 
-error:
-	if (dp->is_edp) {
-		disable_irq(dp_priv->irq);
-		dp_display_host_phy_exit(dp_priv);
-		dp_display_host_deinit(dp_priv);
-	}
 	return rc;
 }
 
-- 
2.39.0

