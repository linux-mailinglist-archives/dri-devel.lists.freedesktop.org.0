Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190EF443854
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 23:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579A4738DE;
	Tue,  2 Nov 2021 22:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2967738DD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 22:21:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635891660; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UcGjU5LftLQLEAFIbcCc387grVSqMMM1MiLZ3YIsL2Q=;
 b=uOu+nSZJiHimWOvoli28KVKQ5utImtq7qitTmvhyAEr4eSU4rfFXwQ1GUiwDKtxkQpc022zj
 nythv9GjX0KraBNMkFcEk+otvAYLTSmTwMF0cCs2EAjfh5pjxSltdtPqWov04U/jk0gKdHji
 PBzLg0sgXSGGw/PIfnCkxDzsSb0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6181b9ca883b2746f76480f3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 22:20:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D8CB1C43618; Tue,  2 Nov 2021 22:14:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E7CF4C4338F;
 Tue,  2 Nov 2021 22:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E7CF4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 dmitry.baryshkov@linaro.org, bjorn.andersson@linaro.org
Subject: [PATCH] drm/msm/dp: employ bridge mechanism for display enable and
 disable
Date: Tue,  2 Nov 2021 15:13:44 -0700
Message-Id: <1635891224-16357-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
 Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current display mode_set, enable and disable functions are implemented
as function called directly from drm encoder. This patch have display
mode_set, enable and disable be implemented as callback function of drm
bridge.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  21 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   8 ++
 drivers/gpu/drm/msm/dp/dp_display.c         |  26 +++----
 drivers/gpu/drm/msm/dp/dp_display.h         |   8 ++
 drivers/gpu/drm/msm/dp/dp_drm.c             | 113 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               |  29 ++-----
 6 files changed, 147 insertions(+), 58 deletions(-)

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
index 27d98b5..3bbd09c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -557,6 +557,14 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 				  encoder->base.id, rc);
 			return rc;
 		}
+
+		rc = msm_dp_bridge_init(priv->dp[i], dev, encoder);
+                if (rc) {
+			DPU_ERROR("failed to setup DPU bridge %d: rc:%d\n",
+				  encoder->base.id, rc);
+			return rc;
+                }
+
 	}
 
 	return rc;
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e41dd40..317f963 100644
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
 
@@ -1533,7 +1533,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	return 0;
 }
 
-int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
+int dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 {
 	int rc = 0;
 	struct dp_display_private *dp_display;
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
 
@@ -1590,7 +1590,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 	return rc;
 }
 
-int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
+int dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 {
 	struct dp_display_private *dp_display;
 
@@ -1601,7 +1601,7 @@ int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 	return 0;
 }
 
-int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
+int dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 {
 	int rc = 0;
 	u32 state;
@@ -1614,7 +1614,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 	/* stop sentinel checking */
 	dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
 
-	dp_display_disable(dp_display, 0);
+	__dp_display_disable(dp_display, 0);
 
 	rc = dp_display_unprepare(dp);
 	if (rc)
@@ -1632,9 +1632,9 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 	return rc;
 }
 
-void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
+void dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode)
 {
 	struct dp_display_private *dp_display;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 76f45f9..4fb6ada 100644
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
@@ -40,4 +41,11 @@ int dp_display_get_test_bpp(struct msm_dp *dp_display);
 void dp_display_signal_audio_start(struct msm_dp *dp_display);
 void dp_display_signal_audio_complete(struct msm_dp *dp_display);
 
+int dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
+int dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
+int dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
+void dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
+				const struct drm_display_mode *mode,
+				const struct drm_display_mode *adjusted_mode);
+
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f33e315..812a091 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -3,14 +3,25 @@
  * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/platform_device.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "dp_drm.h"
 
+
+struct dp_bridge {
+        struct drm_bridge bridge;
+        struct msm_dp *dp_display;
+};      
+
+#define to_dp_display(x)     container_of((x), struct dp_bridge, bridge)
+
 struct dp_connector {
 	struct drm_connector base;
 	struct msm_dp *dp_display;
@@ -162,3 +173,105 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	return connector;
 }
+
+
+static int dp_bridge_attach(struct drm_bridge *dp_bridge,
+                                enum drm_bridge_attach_flags flags)
+{
+	return 0;
+}
+
+static bool dp_bridge_mode_fixup(struct drm_bridge *drm_bridge,
+                                  const struct drm_display_mode *mode,
+                                  struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
+                                const struct drm_display_mode *mode,
+                                const struct drm_display_mode *adjusted_mode)
+{
+	struct dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+
+	dp_display_mode_set(dp_display, drm_bridge->encoder, mode, adjusted_mode);
+}
+
+static void dp_bridge_pre_enable(struct drm_bridge *drm_bridge)
+{
+
+}
+
+static void dp_bridge_enable(struct drm_bridge *drm_bridge)
+{
+	struct dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+
+	dp_display_enable(dp_display, drm_bridge->encoder);
+}
+
+static void dp_bridge_disable(struct drm_bridge *drm_bridge)
+{
+	struct dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+
+	dp_display_pre_disable(dp_display, drm_bridge->encoder);
+}
+
+static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
+{
+	struct dp_bridge *dp_bridge = to_dp_display(drm_bridge);
+	struct msm_dp *dp_display = dp_bridge->dp_display;
+
+	dp_display_disable(dp_display, drm_bridge->encoder);
+}
+
+static const struct drm_bridge_funcs dp_bridge_ops = {
+        .attach       = dp_bridge_attach,
+        .mode_fixup   = dp_bridge_mode_fixup,
+        .pre_enable   = dp_bridge_pre_enable,
+        .enable       = dp_bridge_enable,
+        .disable      = dp_bridge_disable,
+        .post_disable = dp_bridge_post_disable,
+        .mode_set     = dp_bridge_mode_set,
+};
+
+int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+			struct drm_encoder *encoder)
+{
+	int rc = 0;
+        struct msm_drm_private *priv = NULL;
+        struct dp_bridge *dp_bridge;
+	struct drm_bridge *bridge;
+        
+        dp_bridge = kzalloc(sizeof(*dp_bridge), GFP_KERNEL);
+        if (!dp_bridge) {
+                rc = -ENOMEM;
+                goto error;
+        }
+
+        dp_bridge->dp_display = dp_display;
+
+	bridge = &dp_bridge->bridge;
+        bridge->funcs = &dp_bridge_ops;
+        bridge->encoder = encoder;
+
+        rc = drm_bridge_attach(encoder, bridge, NULL, 0);
+        if (rc) {
+                DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
+                goto error_free_bridge;
+        }
+
+        priv = dev->dev_private;
+	priv->bridges[priv->num_bridges++] = bridge;
+	dp_display->bridge = bridge;
+
+        return 0;
+
+error_free_bridge:
+        kfree(bridge);
+error:
+        return rc;
+
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 4bb797e..ed21dcb 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -384,12 +384,8 @@ int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			 struct drm_encoder *encoder);
-int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
-int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
-int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
-void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode);
+int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
+			 struct drm_encoder *encoder);
 void msm_dp_irq_postinstall(struct msm_dp *dp_display);
 void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display);
 
@@ -409,27 +405,12 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
 {
 	return -EINVAL;
 }
-static inline int msm_dp_display_enable(struct msm_dp *dp,
-					struct drm_encoder *encoder)
-{
-	return -EINVAL;
-}
-static inline int msm_dp_display_disable(struct msm_dp *dp,
-					struct drm_encoder *encoder)
-{
-	return -EINVAL;
-}
-static inline int msm_dp_display_pre_disable(struct msm_dp *dp,
-					struct drm_encoder *encoder)
+static inline int msm_dp_bridge_init(struct msm_dp *dp_display,
+				       struct drm_device *dev,
+				       struct drm_encoder *encoder)
 {
 	return -EINVAL;
 }
-static inline void msm_dp_display_mode_set(struct msm_dp *dp,
-				struct drm_encoder *encoder,
-				struct drm_display_mode *mode,
-				struct drm_display_mode *adjusted_mode)
-{
-}
 
 static inline void msm_dp_irq_postinstall(struct msm_dp *dp_display)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

