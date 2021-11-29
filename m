Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F7461C72
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 18:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84616E3B7;
	Mon, 29 Nov 2021 17:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406756E428;
 Mon, 29 Nov 2021 17:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638205458; x=1669741458;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=3ohmcwXUg0K8xofo5SVJyfgRNwFnqhhSko0Xjjj7ve8=;
 b=IiAql9NMm8k1nLK7AxQzJU89SuAwL3Bn91q67Nh+ii2QZPzp2C72fX0U
 BXQfZOFEQjfERJXpccqUulCmumaYl3xfcoE2jSW9t1tYFYJ9rfZCOxtoe
 AgKgG2uv7ejgQy9Zhj0QBPJ2D8jpcQu55/9mQ8mD/vmqb/tlQJ6yUG90z k=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 29 Nov 2021 09:04:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 09:04:17 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 29 Nov 2021 09:04:16 -0800
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 29 Nov 2021 09:04:16 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <swboyd@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
 <bjorn.andersson@linaro.org>
Subject: [PATCH v5] drm/msm/dp: employ bridge mechanism for display enable and
 disable
Date: Mon, 29 Nov 2021 09:04:04 -0800
Message-ID: <1638205444-4616-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the msm_dp_*** functions implement the same sequence which would
happen when drm_bridge is used. hence get rid of this intermediate layer
and align with the drm_bridge usage to avoid customized implementation.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Changes in v2:
-- revise commit text
-- rename dp_bridge to msm_dp_bridge
-- delete empty functions

Changes in v3:
-- replace kzalloc() with devm_kzalloc()
-- replace __dp_display_enable() with dp_display_enable()
-- replace __dp_display_disable() with dp_display_disable()

Changes in v4:
-- msm_dp_bridge_init() called from msm_dp_modeset_init() same as dsi

Changes in v5:
-- delete attach, mode_fixup and pre_enable from dp_bridge_ops
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 --------
 drivers/gpu/drm/msm/dp/dp_display.c         | 16 +++++-
 drivers/gpu/drm/msm/dp/dp_display.h         |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c             | 77 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               | 12 +++--
 5 files changed, 100 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 31050aa..c4e08c4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1003,9 +1003,6 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)
-		msm_dp_display_mode_set(dpu_enc->dp, drm_enc, mode, adj_mode);
-
 	list_for_each_entry(conn_iter, connector_list, head)
 		if (conn_iter->encoder == drm_enc)
 			conn = conn_iter;
@@ -1181,14 +1178,6 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_virt_enable_helper(drm_enc);
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
-		ret = msm_dp_display_enable(dpu_enc->dp, drm_enc);
-		if (ret) {
-			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
-				ret);
-			goto out;
-		}
-	}
 	dpu_enc->enabled = true;
 
 out:
@@ -1214,11 +1203,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	/* wait for idle */
 	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
-		if (msm_dp_display_pre_disable(dpu_enc->dp, drm_enc))
-			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
-	}
-
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
@@ -1243,11 +1227,6 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
-		if (msm_dp_display_disable(dpu_enc->dp, drm_enc))
-			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
-	}
-
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2f113ff..89a8d43 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1571,6 +1571,18 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	}
 
 	priv->connectors[priv->num_connectors++] = dp_display->connector;
+
+	dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
+	if (IS_ERR(dp_display->bridge)) {
+		ret = PTR_ERR(dp_display->bridge);
+		DRM_DEV_ERROR(dev->dev,
+			"failed to create dp bridge: %d\n", ret);
+		dp_display->bridge = NULL;
+		return ret;
+	}
+
+	priv->bridges[priv->num_bridges++] = dp_display->bridge;
+
 	return 0;
 }
 
@@ -1674,8 +1686,8 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 }
 
 void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
 {
 	struct dp_display_private *dp_display;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 76f45f9..2237e80 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -13,6 +13,7 @@
 struct msm_dp {
 	struct drm_device *drm_dev;
 	struct device *codec_dev;
+	struct drm_bridge *bridge;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 	struct drm_panel *drm_panel;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f33e315..15c0309e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -5,12 +5,21 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "dp_drm.h"
 
+
+struct msm_dp_bridge {
+	struct drm_bridge bridge;
+	struct msm_dp *dp_display;
+};
+
+#define to_dp_display(x)     container_of((x), struct msm_dp_bridge, bridge)
+
 struct dp_connector {
 	struct drm_connector base;
 	struct msm_dp *dp_display;
@@ -162,3 +171,71 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	return connector;
 }
+
+static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+
+	msm_dp_display_mode_set(dp_display, drm_bridge->encoder, mode, adjusted_mode);
+}
+
+static void dp_bridge_enable(struct drm_bridge *drm_bridge)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+
+	msm_dp_display_enable(dp_display, drm_bridge->encoder);
+}
+
+static void dp_bridge_disable(struct drm_bridge *drm_bridge)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+
+	msm_dp_display_pre_disable(dp_display, drm_bridge->encoder);
+}
+
+static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+
+	msm_dp_display_disable(dp_display, drm_bridge->encoder);
+}
+
+static const struct drm_bridge_funcs dp_bridge_ops = {
+	.enable       = dp_bridge_enable,
+	.disable      = dp_bridge_disable,
+	.post_disable = dp_bridge_post_disable,
+	.mode_set     = dp_bridge_mode_set,
+};
+
+struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+			struct drm_encoder *encoder)
+{
+	int rc;
+	struct msm_dp_bridge *dp_bridge;
+	struct drm_bridge *bridge;
+
+	dp_bridge = devm_kzalloc(dev->dev, sizeof(*dp_bridge), GFP_KERNEL);
+	if (!dp_bridge)
+		return ERR_PTR(-ENOMEM);
+
+	dp_bridge->dp_display = dp_display;
+
+	bridge = &dp_bridge->bridge;
+	bridge->funcs = &dp_bridge_ops;
+	bridge->encoder = encoder;
+
+	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (rc) {
+		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
+		kfree(dp_bridge);
+		return ERR_PTR(rc);
+	}
+
+	return bridge;
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 4bb797e..c18a959 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -388,8 +388,12 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
 int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
 int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
 void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode);
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode);
+
+struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display,
+					struct drm_device *dev,
+					struct drm_encoder *encoder);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
@@ -426,8 +430,8 @@ static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
 }
 static inline void msm_dp_display_mode_set(struct msm_dp *dp,
 				struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
 {
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

