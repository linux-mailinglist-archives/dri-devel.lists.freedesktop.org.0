Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CAE446E28
	for <lists+dri-devel@lfdr.de>; Sat,  6 Nov 2021 14:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1C66E19A;
	Sat,  6 Nov 2021 13:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FA76EC94
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 21:22:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636147344; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=SH7TiQPY9xoClVKmEaVb9enouiZD2YzkjSWXVR8O3+k=;
 b=NVPjtyFn8jED0RxihcQbeggDrMLstMffi2Q0s3vJxTImxfCX9GeS9JeaaNxpA0a+vbU29Ucl
 IOtVYQV/5tWyMilXJ9WBIWxQyporQQBNNLQNqhRUSiAiRCZJ+MpI5AJ70EFrML8dFE7AtraB
 C5QRV48WGnGp1nLO2OtAYzT3N0E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6185a08fe736dec45bfd3308 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Nov 2021 21:22:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B0DA7C43619; Fri,  5 Nov 2021 21:22:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 57F2BC4338F;
 Fri,  5 Nov 2021 21:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 57F2BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 dmitry.baryshkov@linaro.org, bjorn.andersson@linaro.org
Subject: [PATCH v2] drm/msm/dp: employ bridge mechanism for display enable and
 disable
Date: Fri,  5 Nov 2021 14:22:12 -0700
Message-Id: <1636147332-11797-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 06 Nov 2021 13:41:19 +0000
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  7 +++
 drivers/gpu/drm/msm/dp/dp_display.c         | 18 +++---
 drivers/gpu/drm/msm/dp/dp_display.h         |  1 +
 drivers/gpu/drm/msm/dp/dp_drm.c             | 91 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               | 16 +++--
 6 files changed, 120 insertions(+), 34 deletions(-)

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
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 27d98b5..d16337f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -557,6 +557,13 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 				  encoder->base.id, rc);
 			return rc;
 		}
+
+		rc = msm_dp_bridge_init(priv->dp[i], dev, encoder);
+		if (rc) {
+			DPU_ERROR("failed to setup DPU bridge %d: rc:%d\n",
+				encoder->base.id, rc);
+			return rc;
+		}
 	}
 
 	return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e41dd40..e9ea6ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -569,8 +569,8 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data);
-static int dp_display_disable(struct dp_display_private *dp, u32 data);
+static int __dp_display_enable(struct dp_display_private *dp, u32 data);
+static int __dp_display_disable(struct dp_display_private *dp, u32 data);
 
 static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
 {
@@ -855,7 +855,7 @@ static int dp_display_prepare(struct msm_dp *dp_display)
 	return 0;
 }
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data)
+static int __dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
 
@@ -898,7 +898,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
 	return 0;
 }
 
-static int dp_display_disable(struct dp_display_private *dp, u32 data)
+static int __dp_display_disable(struct dp_display_private *dp, u32 data)
 {
 	struct msm_dp *dp_display = &dp->dp_display;
 
@@ -1569,12 +1569,12 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	if (state == ST_DISPLAY_OFF)
 		dp_display_host_init(dp_display, true);
 
-	dp_display_enable(dp_display, 0);
+	__dp_display_enable(dp_display, 0);
 
 	rc = dp_display_post_enable(dp);
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
-		dp_display_disable(dp_display, 0);
+		__dp_display_disable(dp_display, 0);
 		dp_display_unprepare(dp);
 	}
 
@@ -1614,7 +1614,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
 
-	dp_display_disable(dp_display, 0);
+	__dp_display_disable(dp_display, 0);
 
 	rc = dp_display_unprepare(dp);
 	if (rc)
@@ -1633,8 +1633,8 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
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
index f33e315..e7bea97 100644
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
@@ -162,3 +171,85 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	return connector;
 }
+
+static int dp_bridge_attach(struct drm_bridge *drm_bridge,
+				enum drm_bridge_attach_flags flags)
+{
+	return 0;
+}
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
+	.attach       = dp_bridge_attach,
+	.mode_fixup   = NULL,
+	.pre_enable   = NULL,
+	.enable       = dp_bridge_enable,
+	.disable      = dp_bridge_disable,
+	.post_disable = dp_bridge_post_disable,
+	.mode_set     = dp_bridge_mode_set,
+};
+
+int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+			struct drm_encoder *encoder)
+{
+	int rc;
+	struct msm_drm_private *priv;
+	struct msm_dp_bridge *dp_bridge;
+	struct drm_bridge *bridge;
+
+	dp_bridge = kzalloc(sizeof(*dp_bridge), GFP_KERNEL);
+	if (!dp_bridge)
+		return -ENOMEM;
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
+		return rc;
+	}
+
+	priv = dev->dev_private;
+	priv->bridges[priv->num_bridges++] = bridge;
+	dp_display->bridge = bridge;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 4bb797e..9a2092f 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -388,8 +388,10 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
 int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
 int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
 void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode);
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode);
+int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+			struct drm_encoder *encoder);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
@@ -426,10 +428,16 @@ static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
 }
 static inline void msm_dp_display_mode_set(struct msm_dp *dp,
 				struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
 {
 }
+static inline int msm_dp_bridge_init(struct msm_dp *dp_display,
+				struct drm_device *dev,
+				struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
 
 static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

