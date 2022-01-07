Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C589B48700F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 03:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4FE10EDB6;
	Fri,  7 Jan 2022 02:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABDE10EDAE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 02:01:39 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g11so10306399lfu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 18:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2kKn6GMuD4BqegleOJkLqeWgWY3ZMCteXaiTRVTlMIo=;
 b=i7DNpypGI8bXIGruxJcqRVnAcTF+Ol9RNHPOWcQzajIGaQCD4ZzKgLde6eB3/mPlM6
 00kRB/LuyFlq0Z5hHBHAPjISpH4QxuDKXNse8TWu65vufTZfv3xPADgWnY0Rbln2sf9P
 fFPxoC/DiW9hAa1HA0FzJjb4woLyzZSH+RCbIXQRFen1xc8aAGDK9IqcpRzYHgsbjZSy
 JCbRVFJ92BkQMtTzDOhtbxtXFoZ1hoY3cROk52sCY/pcGjaGR6lTsmbsm5X8pvxgV3yR
 3lgNxQo83I/UMgEIpnNZ57rS/nRfeTR9hgwFsiA761LWt3w8k6j57r6S8WsFFEi1H539
 XVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2kKn6GMuD4BqegleOJkLqeWgWY3ZMCteXaiTRVTlMIo=;
 b=AjKd6A5ecICky+ZTYfQRfDm5LdldMeO1Hi1HJOfYsTf0gwCzSj1UNgH8eXp1CHoeiR
 /bfCE6xq9hG8j0AtTc1qT+oAgA9iX19OrRoUfjdpJ5Bfw+npuGKkLaW98vZG3RBgr6Lu
 ev6d4xjguSZmdIfkGNxVbDZOaibXOXJSLg/cTh6N2HGy5AO26jkUoitD6TdTICIMvq1X
 qVpLTpJptez3zsWdfYcaobgB8vz+n2Fw3F8sRtXAtHxlRZvDOrOd/erBAFbGqVakyrwq
 Qx84ZYRBzRF1KkmNeUKzGW0Od/7FSQcyNNiNgWDSZLHJYsbj6MU4q27luP6MNefN7GFN
 HPQA==
X-Gm-Message-State: AOAM532Xlc5Mdp6xibjX/YNxa5pUERABQqzH5yekEJABzescPfWx4pmD
 GGf1u1N7j/cHZuRNoDx6/izyUQ==
X-Google-Smtp-Source: ABdhPJz5xHUBta+uGoDHY1+JibbmT1vgv4ULhTGAi2zQOKi1MoW9Zu2dZUnbNFhJkYKsx0aUA/2SXQ==
X-Received: by 2002:a05:6512:4ca:: with SMTP id
 w10mr52955617lfq.32.1641520898064; 
 Thu, 06 Jan 2022 18:01:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 18:01:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [RFC PATCH 3/7] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
Date: Fri,  7 Jan 2022 05:01:28 +0300
Message-Id: <20220107020132.587811-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is little point in having both connector and root bridge
implementation in the same driver. Move connector's functionality to the
bridge to let next bridge in chain to override it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  22 +++---
 drivers/gpu/drm/msm/dp/dp_drm.c     | 111 ++++++++++------------------
 2 files changed, 51 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 184a1d1470e6..539aac117184 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1476,17 +1476,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_display->encoder = encoder;
 
-	dp_display->connector = dp_drm_connector_init(dp_display);
-	if (IS_ERR(dp_display->connector)) {
-		ret = PTR_ERR(dp_display->connector);
-		DRM_DEV_ERROR(dev->dev,
-			"failed to create dp connector: %d\n", ret);
-		dp_display->connector = NULL;
-		return ret;
-	}
-
-	priv->connectors[priv->num_connectors++] = dp_display->connector;
-
 	dp_display->bridge = msm_dp_bridge_init(dp_display, dev, encoder);
 	if (IS_ERR(dp_display->bridge)) {
 		ret = PTR_ERR(dp_display->bridge);
@@ -1498,6 +1487,17 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	priv->bridges[priv->num_bridges++] = dp_display->bridge;
 
+	dp_display->connector = dp_drm_connector_init(dp_display);
+	if (IS_ERR(dp_display->connector)) {
+		ret = PTR_ERR(dp_display->connector);
+		DRM_DEV_ERROR(dev->dev,
+			"failed to create dp connector: %d\n", ret);
+		dp_display->connector = NULL;
+		return ret;
+	}
+
+	priv->connectors[priv->num_connectors++] = dp_display->connector;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 80f59cf99089..5f093d90d227 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 
 #include "msm_drv.h"
@@ -20,24 +21,16 @@ struct msm_dp_bridge {
 
 #define to_dp_display(x)     container_of((x), struct msm_dp_bridge, bridge)
 
-struct dp_connector {
-	struct drm_connector base;
-	struct msm_dp *dp_display;
-};
-#define to_dp_connector(x) container_of(x, struct dp_connector, base)
-
 /**
- * dp_connector_detect - callback to determine if connector is connected
- * @conn: Pointer to drm connector structure
- * @force: Force detect setting from drm framework
- * Returns: Connector 'is connected' status
+ * dp_bridge_detect - callback to determine if connector is connected
+ * @bridge: Pointer to drm bridge structure
+ * Returns: Bridge's 'is connected' status
  */
-static enum drm_connector_status dp_connector_detect(struct drm_connector *conn,
-		bool force)
+static enum drm_connector_status dp_bridge_detect(struct drm_bridge *bridge)
 {
 	struct msm_dp *dp;
 
-	dp = to_dp_connector(conn)->dp_display;
+	dp = to_dp_display(bridge)->dp_display;
 
 	DRM_DEBUG_DP("is_connected = %s\n",
 		(dp->is_connected) ? "true" : "false");
@@ -48,10 +41,11 @@ static enum drm_connector_status dp_connector_detect(struct drm_connector *conn,
 
 /**
  * dp_connector_get_modes - callback to add drm modes via drm_mode_probed_add()
+ * @bridge: Poiner to drm bridge
  * @connector: Pointer to drm connector structure
  * Returns: Number of modes added
  */
-static int dp_connector_get_modes(struct drm_connector *connector)
+static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	int rc = 0;
 	struct msm_dp *dp;
@@ -61,7 +55,7 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 	if (!connector)
 		return 0;
 
-	dp = to_dp_connector(connector)->dp_display;
+	dp = to_dp_display(bridge)->dp_display;
 
 	dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
 	if (!dp_mode)
@@ -102,18 +96,20 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 }
 
 /**
- * dp_connector_mode_valid - callback to determine if specified mode is valid
- * @connector: Pointer to drm connector structure
+ * dp_bridge_mode_valid - callback to determine if specified mode is valid
+ * @bridge: Pointer to drm bridge structure
+ * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-static enum drm_mode_status dp_connector_mode_valid(
-		struct drm_connector *connector,
-		struct drm_display_mode *mode)
+static enum drm_mode_status dp_bridge_mode_valid(
+		struct drm_bridge *bridge,
+		const struct drm_display_info *info,
+		const struct drm_display_mode *mode)
 {
 	struct msm_dp *dp_disp;
 
-	dp_disp = to_dp_connector(connector)->dp_display;
+	dp_disp = to_dp_display(bridge)->dp_display;
 
 	if ((dp_disp->max_pclk_khz <= 0) ||
 			(dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
@@ -123,55 +119,6 @@ static enum drm_mode_status dp_connector_mode_valid(
 	return dp_display_validate_mode(dp_disp, mode->clock);
 }
 
-static const struct drm_connector_funcs dp_connector_funcs = {
-	.detect = dp_connector_detect,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
-static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
-	.get_modes = dp_connector_get_modes,
-	.mode_valid = dp_connector_mode_valid,
-};
-
-/* connector initialization */
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
-{
-	struct drm_connector *connector = NULL;
-	struct dp_connector *dp_connector;
-	int ret;
-
-	dp_connector = devm_kzalloc(dp_display->drm_dev->dev,
-					sizeof(*dp_connector),
-					GFP_KERNEL);
-	if (!dp_connector)
-		return ERR_PTR(-ENOMEM);
-
-	dp_connector->dp_display = dp_display;
-
-	connector = &dp_connector->base;
-
-	ret = drm_connector_init(dp_display->drm_dev, connector,
-			&dp_connector_funcs,
-			dp_display->connector_type);
-	if (ret)
-		return ERR_PTR(ret);
-
-	drm_connector_helper_add(connector, &dp_connector_helper_funcs);
-
-	/*
-	 * Enable HPD to let hpd event is handled when cable is connected.
-	 */
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
-
-	drm_connector_attach_encoder(connector, dp_display->encoder);
-
-	return connector;
-}
-
 static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 				const struct drm_display_mode *mode,
 				const struct drm_display_mode *adjusted_mode)
@@ -211,6 +158,9 @@ static const struct drm_bridge_funcs dp_bridge_ops = {
 	.disable      = dp_bridge_disable,
 	.post_disable = dp_bridge_post_disable,
 	.mode_set     = dp_bridge_mode_set,
+	.mode_valid   = dp_bridge_mode_valid,
+	.get_modes    = dp_bridge_get_modes,
+	.detect       = dp_bridge_detect,
 };
 
 struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
@@ -228,7 +178,12 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 
 	bridge = &dp_bridge->bridge;
 	bridge->funcs = &dp_bridge_ops;
-	bridge->encoder = encoder;
+	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+
+	bridge->ops =
+		DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_HPD |
+		DRM_BRIDGE_OP_MODES;
 
 	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (rc) {
@@ -249,3 +204,17 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 
 	return bridge;
 }
+
+/* connector initialization */
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
+{
+	struct drm_connector *connector = NULL;
+
+	connector = drm_bridge_connector_init(dp_display->drm_dev,  dp_display->encoder);
+	if (IS_ERR(connector))
+		return connector;
+
+	drm_connector_attach_encoder(connector, dp_display->encoder);
+
+	return connector;
+}
-- 
2.34.1

