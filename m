Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 730984B0CF4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C4A10E832;
	Thu, 10 Feb 2022 11:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270FA10E82F;
 Thu, 10 Feb 2022 11:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644494316; x=1676030316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=zRIri8zqgjHIXhwXyup9g2V7q3Zva4+VTQrkKNHh2HY=;
 b=PzUE7r5mRG/cdCb0Kkk+/4z93k0HWuuGfvNkcerRyBxy/NjQSu06is5g
 uh86BOBNu4YpZ/7Bum8Oe3wNnD+aKU1FkMtUsPb7g0Olkoxj5I2aM93z+
 VEuJNp08yrIAKhlAxQl6IW318dyyJvY8gMk5q7yKyYe+ydGDpGdA0NU88 c=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 10 Feb 2022 03:58:35 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 03:58:34 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 03:58:34 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 03:58:27 -0800
From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <agross@kernel.org>,
 <bjorn.andersson@linaro.org>, <robh+dt@kernel.org>, <robdclark@gmail.com>,
 <seanpaul@chromium.org>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <krzysztof.kozlowski@canonical.com>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH v4 5/5] drm/msm/dp: Add driver support to utilize drm panel
Date: Thu, 10 Feb 2022 17:27:35 +0530
Message-ID: <1644494255-6632-6-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
 quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support in the DP driver to utilize the custom eDP panels
from drm/panels.

An eDP panel is always connected to the platform. So, the eDP
connector can be reported as always connected. The display mode
will be sourced from the panel. The panel mode will be set after
the link training is completed.

Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
---

Changes in v4:
  - Remove obvious comments
  - Define separate connector_ops for eDP
  - Remove unnecessary checks

Changes in v3:
  None

 drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 62 +++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_parser.h  |  3 ++
 3 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7cc4d21..5d314e6 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1513,6 +1513,9 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
 		return -EINVAL;
 	}
 
+	if (dp->connector_type == DRM_MODE_CONNECTOR_eDP)
+		dp_hpd_plug_handle(dp_display, 0);
+
 	mutex_lock(&dp_display->event_mutex);
 
 	/* stop sentinel checking */
@@ -1577,6 +1580,9 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
+	if (dp->connector_type == DRM_MODE_CONNECTOR_eDP)
+		dp_hpd_unplug_handle(dp_display, 0);
+
 	mutex_lock(&dp_display->event_mutex);
 
 	/* stop sentinel checking */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d4d360d..2436329 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -123,6 +123,25 @@ static enum drm_mode_status dp_connector_mode_valid(
 	return dp_display_validate_mode(dp_disp, mode->clock);
 }
 
+static int edp_connector_get_modes(struct drm_connector *connector)
+{
+	struct msm_dp *dp;
+
+	dp = to_dp_connector(connector)->dp_display;
+
+	return drm_bridge_get_modes(dp->panel_bridge, connector);
+}
+
+static enum drm_mode_status edp_connector_mode_valid(
+		struct drm_connector *connector,
+		struct drm_display_mode *mode)
+{
+	if (mode->clock > EDP_MAX_PIXEL_CLK_KHZ)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static const struct drm_connector_funcs dp_connector_funcs = {
 	.detect = dp_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -132,11 +151,24 @@ static const struct drm_connector_funcs dp_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static const struct drm_connector_funcs edp_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
 static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
 	.get_modes = dp_connector_get_modes,
 	.mode_valid = dp_connector_mode_valid,
 };
 
+static const struct drm_connector_helper_funcs edp_connector_helper_funcs = {
+	.get_modes = edp_connector_get_modes,
+	.mode_valid = edp_connector_mode_valid,
+};
+
 /* connector initialization */
 struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 {
@@ -154,18 +186,28 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
 
 	connector = &dp_connector->base;
 
-	ret = drm_connector_init(dp_display->drm_dev, connector,
-			&dp_connector_funcs,
-			dp_display->connector_type);
-	if (ret)
-		return ERR_PTR(ret);
+	if (dp_display->connector_type == DRM_MODE_CONNECTOR_eDP) {
+		ret = drm_connector_init(dp_display->drm_dev, connector,
+				&edp_connector_funcs, DRM_MODE_CONNECTOR_eDP);
+		if (ret)
+			return ERR_PTR(ret);
+
+		drm_connector_helper_add(connector,
+				&edp_connector_helper_funcs);
+	} else {
+		ret = drm_connector_init(dp_display->drm_dev, connector,
+				&dp_connector_funcs,
+				DRM_MODE_CONNECTOR_DisplayPort);
+		if (ret)
+			return ERR_PTR(ret);
 
-	drm_connector_helper_add(connector, &dp_connector_helper_funcs);
+		drm_connector_helper_add(connector, &dp_connector_helper_funcs);
 
-	/*
-	 * Enable HPD to let hpd event is handled when cable is connected.
-	 */
-	connector->polled = DRM_CONNECTOR_POLL_HPD;
+		/*
+		 * Enable HPD to let hpd event is handled when cable is connected.
+		 */
+		connector->polled = DRM_CONNECTOR_POLL_HPD;
+	}
 
 	drm_connector_attach_encoder(connector, dp_display->encoder);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 3172da0..58c4f27 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -17,6 +17,9 @@
 #define DP_MAX_PIXEL_CLK_KHZ	675000
 #define DP_MAX_NUM_DP_LANES	4
 
+/* Maximum validated clock */
+#define EDP_MAX_PIXEL_CLK_KHZ	285550
+
 enum dp_pm_type {
 	DP_CORE_PM,
 	DP_CTRL_PM,
-- 
2.7.4

