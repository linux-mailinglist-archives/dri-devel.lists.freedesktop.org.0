Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C0657211
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 03:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFDB10E37E;
	Wed, 28 Dec 2022 02:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E132310E37D;
 Wed, 28 Dec 2022 02:16:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BS1cqnZ002141; Wed, 28 Dec 2022 02:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=xpwQYPvfF7M2ny2Mrmu4NKAivyR1gnmTU100F0C3cr0=;
 b=ExPRjOQyp1SRUysX8+EI12ZuWQvc3KKAhNW3Z+ekqcsZ6+RvPZ9OD7RHylXvVaWnlaQ8
 h8UoaEFnLEs7KSsmkKPChgajA+EzXN2jjFKTDJLPcWdTAh7OYx2foKJTJ7theHJ/buM8
 NCCnIKuB3AH05jw91mBJVxhDvYAao0a8fEoxuOqaNDiD5rsaMywk78VWJh/7nIvuJIb4
 djGzAUqsybaF0VWy42S6XsWPzss2eX9ZizFzr7YFqtWYFdGmAwGpUsOtemuMyYTjlUGV
 CVIzh/HoVafmqnZc0KbM+q6w1BAZBkZMVXH5DCTULiv73tbojNO3RKXvczPeVGozBWrN iw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mnq4qx02v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 02:16:37 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BS2GblO025156
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Dec 2022 02:16:37 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 27 Dec 2022 18:16:36 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v6 2/2] drm/msm/dp: enhance dp controller isr
Date: Tue, 27 Dec 2022 18:16:25 -0800
Message-ID: <1672193785-11003-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1672193785-11003-1-git-send-email-quic_khsieh@quicinc.com>
References: <1672193785-11003-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: FYGMwOnaPkAXkGr1t6Zs8m250HRgnDF5
X-Proofpoint-ORIG-GUID: FYGMwOnaPkAXkGr1t6Zs8m250HRgnDF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_18,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280015
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
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dp_display_irq_handler() is the main isr handler with the helps
of two sub isr, dp_aux_isr and dp_ctrl_isr, to service all DP
interrupts on every irq triggered. Current all three isr does
not return IRQ_HANDLED if there are any interrupts it had
serviced. This patch fix this ambiguity by having all isr
return IRQ_HANDLED if there are interrupts had been serviced
or IRQ_NONE otherwise.

Changes in v5:
-- move complete into dp_aux_native_handler()
-- move complete into dp_aux_i2c_handler()
-- restore null ctrl check at isr
-- return IRQ_NODE directly

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Suggested-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 95 ++++++++++++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_aux.h     |  2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 ++++-
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++--
 5 files changed, 89 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index cc3efed..d01ff45 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -162,45 +162,84 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
 	return i;
 }
 
-static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
+static irqreturn_t dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
 {
-	if (isr & DP_INTR_AUX_I2C_DONE)
+	irqreturn_t ret = IRQ_NONE;
+
+	if (isr & DP_INTR_AUX_I2C_DONE) {
 		aux->aux_error_num = DP_AUX_ERR_NONE;
-	else if (isr & DP_INTR_WRONG_ADDR)
+		ret = IRQ_HANDLED;
+	} else if (isr & DP_INTR_WRONG_ADDR) {
 		aux->aux_error_num = DP_AUX_ERR_ADDR;
-	else if (isr & DP_INTR_TIMEOUT)
+		ret = IRQ_HANDLED;
+	} else if (isr & DP_INTR_TIMEOUT) {
 		aux->aux_error_num = DP_AUX_ERR_TOUT;
-	if (isr & DP_INTR_NACK_DEFER)
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_NACK_DEFER) {
 		aux->aux_error_num = DP_AUX_ERR_NACK;
+		ret = IRQ_HANDLED;
+	}
+
 	if (isr & DP_INTR_AUX_ERROR) {
 		aux->aux_error_num = DP_AUX_ERR_PHY;
 		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		ret = IRQ_HANDLED;
 	}
+
+	if (ret == IRQ_HANDLED)
+		complete(&aux->comp);
+
+	return ret;
 }
 
-static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
+static irqreturn_t dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
 {
+	irqreturn_t ret = IRQ_NONE;
+
 	if (isr & DP_INTR_AUX_I2C_DONE) {
 		if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
 			aux->aux_error_num = DP_AUX_ERR_NACK;
 		else
 			aux->aux_error_num = DP_AUX_ERR_NONE;
-	} else {
-		if (isr & DP_INTR_WRONG_ADDR)
-			aux->aux_error_num = DP_AUX_ERR_ADDR;
-		else if (isr & DP_INTR_TIMEOUT)
-			aux->aux_error_num = DP_AUX_ERR_TOUT;
-		if (isr & DP_INTR_NACK_DEFER)
-			aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
-		if (isr & DP_INTR_I2C_NACK)
-			aux->aux_error_num = DP_AUX_ERR_NACK;
-		if (isr & DP_INTR_I2C_DEFER)
-			aux->aux_error_num = DP_AUX_ERR_DEFER;
-		if (isr & DP_INTR_AUX_ERROR) {
-			aux->aux_error_num = DP_AUX_ERR_PHY;
-			dp_catalog_aux_clear_hw_interrupts(aux->catalog);
-		}
+
+		return IRQ_HANDLED;
 	}
+
+	if (isr & DP_INTR_WRONG_ADDR) {
+		aux->aux_error_num = DP_AUX_ERR_ADDR;
+		ret = IRQ_HANDLED;
+	} else if (isr & DP_INTR_TIMEOUT) {
+		aux->aux_error_num = DP_AUX_ERR_TOUT;
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_NACK_DEFER) {
+		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_I2C_NACK) {
+		aux->aux_error_num = DP_AUX_ERR_NACK;
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_I2C_DEFER) {
+		aux->aux_error_num = DP_AUX_ERR_DEFER;
+		ret = IRQ_HANDLED;
+	}
+
+	if (isr & DP_INTR_AUX_ERROR) {
+		aux->aux_error_num = DP_AUX_ERR_PHY;
+		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		ret = IRQ_HANDLED;
+	}
+
+	if (ret == IRQ_HANDLED)
+		complete(&aux->comp);
+
+	return ret;
 }
 
 static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
@@ -409,14 +448,14 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	return ret;
 }
 
-void dp_aux_isr(struct drm_dp_aux *dp_aux)
+irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux)
 {
 	u32 isr;
 	struct dp_aux_private *aux;
 
 	if (!dp_aux) {
 		DRM_ERROR("invalid input\n");
-		return;
+		return IRQ_NONE;
 	}
 
 	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
@@ -425,17 +464,15 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
 
 	/* no interrupts pending, return immediately */
 	if (!isr)
-		return;
+		return IRQ_NONE;
 
 	if (!aux->cmd_busy)
-		return;
+		return IRQ_NONE;
 
 	if (aux->native)
-		dp_aux_native_handler(aux, isr);
+		return dp_aux_native_handler(aux, isr);
 	else
-		dp_aux_i2c_handler(aux, isr);
-
-	complete(&aux->comp);
+		return dp_aux_i2c_handler(aux, isr);
 }
 
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index e930974..511305d 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -11,7 +11,7 @@
 
 int dp_aux_register(struct drm_dp_aux *dp_aux);
 void dp_aux_unregister(struct drm_dp_aux *dp_aux);
-void dp_aux_isr(struct drm_dp_aux *dp_aux);
+irqreturn_t dp_aux_isr(struct drm_dp_aux *dp_aux);
 void dp_aux_init(struct drm_dp_aux *dp_aux);
 void dp_aux_deinit(struct drm_dp_aux *dp_aux);
 void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 3854c9f..cb0acb1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1982,27 +1982,35 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	return ret;
 }
 
-void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
+irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
 	u32 isr;
+	irqreturn_t ret = IRQ_NONE;
 
 	if (!dp_ctrl)
-		return;
+		return IRQ_NONE;
 
 	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
 
 	isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
+	/* no interrupts pending, return immediately */
+	if (!isr)
+		return IRQ_NONE;
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
 		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
 		complete(&ctrl->video_comp);
+		ret = IRQ_HANDLED;
 	}
 
 	if (isr & DP_CTRL_INTR_IDLE_PATTERN_SENT) {
 		drm_dbg_dp(ctrl->drm_dev, "idle_patterns_sent\n");
 		complete(&ctrl->idle_comp);
+		ret = IRQ_HANDLED;
 	}
+
+	return ret;
 }
 
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 9f29734..c3af06d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -25,7 +25,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off_link(struct dp_ctrl *dp_ctrl);
 int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
-void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
+irqreturn_t dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
 void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
 struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
 			struct dp_panel *panel,	struct drm_dp_aux *aux,
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bfd0aef..d40bfbd 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1192,7 +1192,7 @@ static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
 static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct dp_display_private *dp = dev_id;
-	irqreturn_t ret = IRQ_HANDLED;
+	irqreturn_t ret = IRQ_NONE;
 	u32 hpd_isr_status;
 
 	if (!dp) {
@@ -1206,27 +1206,33 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
 			dp->dp_display.connector_type, hpd_isr_status);
 		/* hpd related interrupts */
-		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK)
+		if (hpd_isr_status & DP_DP_HPD_PLUG_INT_MASK) {
 			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
+			ret = IRQ_HANDLED;
+		}
 
 		if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
 			dp_add_event(dp, EV_IRQ_HPD_INT, 0, 0);
+			ret = IRQ_HANDLED;
 		}
 
 		if (hpd_isr_status & DP_DP_HPD_REPLUG_INT_MASK) {
 			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
 			dp_add_event(dp, EV_HPD_PLUG_INT, 0, 3);
+			ret = IRQ_HANDLED;
 		}
 
-		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
+		if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK) {
 			dp_add_event(dp, EV_HPD_UNPLUG_INT, 0, 0);
+			ret = IRQ_HANDLED;
+		}
 	}
 
 	/* DP controller isr */
-	dp_ctrl_isr(dp->ctrl);
+	ret |= dp_ctrl_isr(dp->ctrl);
 
 	/* DP aux isr */
-	dp_aux_isr(dp->aux);
+	ret |= dp_aux_isr(dp->aux);
 
 	return ret;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

