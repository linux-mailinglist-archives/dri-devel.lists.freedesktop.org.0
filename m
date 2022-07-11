Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90F56FCDF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F628BBBD;
	Mon, 11 Jul 2022 09:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2766A14A3F1;
 Mon, 11 Jul 2022 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1657532911; x=1689068911;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=QqSZUWmfilHMHP4Yj179aJwceeQUx/oJvSsXM245WDw=;
 b=U023LT/yPzMmhwgJdp71ggn66pjTEOz81bxztbdzrR7dpmt1/eELMDjD
 wxjswPOeVcY2Io9r5z1A64+Sd8VObpQZBUPQOlrlLRvmiXl68sADYMUNY
 kuCdGUZtNK6s1FQXuXM6aU7NewpYRRhdvnNQ/HferpRbiJPorABNazDyq U=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 11 Jul 2022 02:48:31 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 11 Jul 2022 02:48:30 -0700
X-QCInternal: smtphost
Received: from vpolimer-linux.qualcomm.com ([10.204.67.235])
 by ironmsg02-blr.qualcomm.com with ESMTP; 11 Jul 2022 15:18:05 +0530
Received: by vpolimer-linux.qualcomm.com (Postfix, from userid 463814)
 id 592873E48; Mon, 11 Jul 2022 15:18:04 +0530 (IST)
From: Vinod Polimera <quic_vpolimer@quicinc.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v5 03/10] drm/msm/dp: use atomic callbacks for DP bridge ops
Date: Mon, 11 Jul 2022 15:17:52 +0530
Message-Id: <1657532880-12897-4-git-send-email-quic_vpolimer@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657532880-12897-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1657532880-12897-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com, quic_khsieh@quicinc.com,
 dianders@chromium.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use atomic variants for DP bridge callback functions so that
the atomic state can be accessed in the interface drivers.
The atomic state will help the driver find out if the display
is in self refresh state.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 ++++++---
 drivers/gpu/drm/msm/dp/dp_drm.c     | 18 +++++++++++-------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bce7793..5bd6677 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1652,7 +1652,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void dp_bridge_enable(struct drm_bridge *drm_bridge)
+void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+			     struct drm_bridge_state *old_bridge_state)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
@@ -1716,7 +1717,8 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	mutex_unlock(&dp_display->event_mutex);
 }
 
-void dp_bridge_disable(struct drm_bridge *drm_bridge)
+void dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+			      struct drm_bridge_state *old_bridge_state)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
@@ -1727,7 +1729,8 @@ void dp_bridge_disable(struct drm_bridge *drm_bridge)
 	dp_ctrl_push_idle(dp_display->ctrl);
 }
 
-void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
+void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+				   struct drm_bridge_state *old_bridge_state)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 62d58b9..9d0fc74 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -61,13 +61,17 @@ static int dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *
 }
 
 static const struct drm_bridge_funcs dp_bridge_ops = {
-	.enable       = dp_bridge_enable,
-	.disable      = dp_bridge_disable,
-	.post_disable = dp_bridge_post_disable,
-	.mode_set     = dp_bridge_mode_set,
-	.mode_valid   = dp_bridge_mode_valid,
-	.get_modes    = dp_bridge_get_modes,
-	.detect       = dp_bridge_detect,
+	.atomic_enable = dp_bridge_atomic_enable,
+	.atomic_disable = dp_bridge_atomic_disable,
+	.atomic_post_disable = dp_bridge_atomic_post_disable,
+	.mode_set = dp_bridge_mode_set,
+	.mode_valid = dp_bridge_mode_valid,
+	.get_modes = dp_bridge_get_modes,
+	.detect = dp_bridge_detect,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_check = edp_bridge_atomic_check,
 };
 
 struct drm_bridge *dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
-- 
2.7.4

