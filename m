Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8997EBCEF3C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 05:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D676410E2CD;
	Sat, 11 Oct 2025 03:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="da10MMBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D9210E2CD
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 03:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1760153974;
 bh=I+9VZd8ncfeVgeNOJmnK4qXS7xKrszSITd2o9mJrpgk=;
 h=From:To:Subject:Date:Message-Id;
 b=da10MMBnr4rwUTEzen+9H13o55/spDebfoXfN+bJlD/KVlcXprdonR8sav/fi7Tfb
 9k51tZO34ke8dLB/5rpM6vwzaq657mI6yFpN9SKGpgk7rPx9ahE3p1UIUNO3bU+Fj/
 1RdBcdLRx3zpcEfxM0Dncf33kvBBuRzV61bc75M4=
X-QQ-mid: zesmtpgz4t1760153582tfa4e78e4
X-QQ-Originating-IP: X/0VlKA+6cH7OdhhqAvAEf8JtUEhJg6/vIwCpP7V4A0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 11 Oct 2025 11:33:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17538726750189010641
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 6/8] drm/rockchip: cdn-dp: Add multiple bridges to support
 PHY port selection
Date: Sat, 11 Oct 2025 11:32:31 +0800
Message-Id: <20251011033233.97-7-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251011033233.97-1-kernel@airkyi.com>
References: <20251011033233.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NakEBl84zUNhI/bl5diWmhJv8hkt7rlA+ITx2DSrQNYaDbbbX/uUYJ1b
 vVjIZn/fE9uOSmyxUaahLEEYADwjaJVeyTDVdzCH6sl5+ClKsfl1AI6DM8Yw2sq7O5R9KfI
 I2tYB54vWzPdwYLeoHjuj4o0eyfLDRB8GWW6MZYjTTsyMO+79wUhw78w8sp5DEWmGN8PuYo
 Dqi8lF1kpu2foHdsuVDHbMzifECgUS4SG8n+m7Zvt6vn2kG3sYEQMJhEZo1qgSKuHqMQ930
 0g5kUpza1JsEFOODxLssKCHbdLMgetok2Ea8VNpNG68rWRWqdcRjW60Z/whIBPjV4eNzLRL
 +mlhJ4MYCTqnyaXYvhdwR0H6xUe46ydVcsGb6SQhXUTNUcMVTz8kUJM7xQH+1FMGyWU1BWw
 HI1iHh9UJaNF2wBQmtnJ7xIk75dRGZlTbOOqu+YbN44Yqub627vtK0kUR6mcMZ6kaI0mJsw
 q2EvktCqu7C6Bp14hLOv10TCsquPcDnbToJkaq702XMuvOEvc8pYpK4I677hWzN0YVQSPVd
 83NbxEJO6wf+PWMrbOIW+V8X7i1dRhuDjpq4UptI+V1YfaQbZ0NnmvVB8Qc4qefQnk0bwv6
 INWQ0FJKbaLj5rF122rjMkTPdh8sFxbEyoTEbkcA/OPzYVvWmb/jaSvyNOKojJ0Ki03WkjB
 kuLKn+b0ssUcZbHGKJSjgsafxFPB7K1L9sAKF8UXyO2duDgkWyZf8roJq7dBV1jAZWSp1sk
 S+cVbNh1ZajpV1A0RFqPCoRwv/z53Y4fRkHR1Lm8jJ0Lv/UEm+lBtrhA/Q3MfDZRd5fmQNT
 TuFWiufMrrB5gvv63SPdCMgY5w7y4Yp1m3I1mjEG6Svel/D8g9Zp43xOj59gSDJzIJZxd8M
 eSRwaqL9sEc4Wr1ui+MCPc5hzA2IDMeGv53mkyemP0ygCNaft+0Mmq9osP45NuZ1oBfEj3F
 Kc3BRhM8/Qol01nSxs9Mj56Cn2FJcT4QZcw9Js6ObQspbEWPG9bXXsk36nVUjBEeRX4drjn
 TlMU+j8MZ6mTX2xq0t/VtasVuAOVo=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
the CDN-DP can be switched to output to one of the PHYs. If both ports
are plugged into DP, DP will select the first port for output.

This patch adds support for multiple bridges, enabling users to flexibly
select the output port. For each PHY port, a separate encoder and bridge
are registered.

The change is based on the DRM AUX HPD bridge, rather than the
extcon approach. This requires the DT to correctly describe the
connections between the first bridge in bridge chain and DP
controller. For example, the bridge chain may be like this:

PHY aux birdge -> fsa4480 analog audio switch bridge ->
onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge

In this case, the connection relationships among the PHY aux bridge
and the DP contorller need to be described in DT.

In addition, the cdn_dp_parse_hpd_bridge_dt() will parses it and
determines whether to register one or two bridges.

Since there is only one DP controller, only one of the PHY ports can
output at a time. The key is how to switch between different PHYs,
which is handled by cdn_dp_switch_port() and cdn_dp_enable().

There are two cases:

1. Neither bridge is enabled. In this case, both bridges can
independently read the EDID, and the PHY port may switch before
reading the EDID.

2. One bridge is already enabled. In this case, other bridges are not
allowed to read the EDID. So we will try to return the cached EDID.

Since the scenario of two ports plug in at the same time is rare,
I don't have a board which support two TypeC connector to test this.
Therefore, I tested forced switching on a single PHY port, as well as
output using a fake PHY port alongside a real PHY port.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v5:
- By parsing the HPD bridge chain, set the connector's of_node to the
of_node corresponding to the USB-C connector.
- Return EDID cache when other port is already enabled.

 drivers/gpu/drm/rockchip/Kconfig       |   2 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 355 +++++++++++++++++++++----
 drivers/gpu/drm/rockchip/cdn-dp-core.h |  24 +-
 3 files changed, 324 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index faf50d872be3..7472ec923cfd 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -55,6 +55,8 @@ config ROCKCHIP_CDN_DP
 	select DRM_DISPLAY_HELPER
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_AUX_BRIDGE
+	select DRM_AUX_HPD_BRIDGE
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the cdn DP driver. If you want to enable Dp on
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 1e27301584a4..ded6cc415cd2 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -27,16 +27,17 @@
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
 
-static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
+static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
+			      struct cdn_dp_port *port);
+
+static inline struct cdn_dp_bridge *bridge_to_dp_bridge(struct drm_bridge *bridge)
 {
-	return container_of(bridge, struct cdn_dp_device, bridge);
+	return container_of(bridge, struct cdn_dp_bridge, bridge);
 }
 
-static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
+static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
 {
-	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
-
-	return container_of(rkencoder, struct cdn_dp_device, encoder);
+	return bridge_to_dp_bridge(bridge)->parent;
 }
 
 #define GRF_SOC_CON9		0x6224
@@ -191,14 +192,27 @@ static int cdn_dp_get_sink_count(struct cdn_dp_device *dp, u8 *sink_count)
 static struct cdn_dp_port *cdn_dp_connected_port(struct cdn_dp_device *dp)
 {
 	struct cdn_dp_port *port;
-	int i, lanes;
+	int i, lanes[MAX_PHY];
 
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
-		lanes = cdn_dp_get_port_lanes(port);
-		if (lanes)
+		lanes[i] = cdn_dp_get_port_lanes(port);
+		if (!dp->hpd_bridge_valid)
 			return port;
 	}
+
+	if (dp->hpd_bridge_valid) {
+		/* If more than one port is available, pick the last active port */
+		if (dp->active_port > 0 && lanes[dp->active_port])
+			return dp->port[dp->active_port];
+
+		/* If the last active port is not available, pick an available port in order */
+		for (i = 0; i < dp->bridge_count; i++) {
+			if (lanes[i])
+				return dp->port[i];
+		}
+	}
+
 	return NULL;
 }
 
@@ -253,12 +267,45 @@ static const struct drm_edid *
 cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
-	const struct drm_edid *drm_edid;
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
+	struct cdn_dp_port *port = dp->port[dp_bridge->id];
+	struct cdn_dp_port *prev_port;
+	const struct drm_edid *drm_edid = NULL;
+	int i, ret;
 
 	mutex_lock(&dp->lock);
+
+	/* More than one port is available */
+	if (dp->bridge_count > 1 && !port->phy_enabled) {
+		for (i = 0; i < dp->bridge_count; i++) {
+			/* Another port already enable */
+			if (dp->bridge_list[i] != dp_bridge && dp->bridge_list[i]->enabled)
+				goto get_cache;
+			/* Find already enabled port */
+			if (dp->port[i]->phy_enabled)
+				prev_port = dp->port[i];
+		}
+
+		/* Switch to current port */
+		if (prev_port) {
+			ret = cdn_dp_switch_port(dp, prev_port, port);
+			if (ret)
+				goto get_cache;
+		}
+	}
+
 	drm_edid = drm_edid_read_custom(connector, cdn_dp_get_edid_block, dp);
+	/* replace edid cache */
+	if (dp->edid_cache[dp_bridge->id])
+		drm_edid_free(dp->edid_cache[dp_bridge->id]);
+	dp->edid_cache[dp_bridge->id] = drm_edid_dup(drm_edid);
+
 	mutex_unlock(&dp->lock);
+	return drm_edid;
 
+get_cache:
+	drm_edid = drm_edid_dup(dp->edid_cache[dp_bridge->id]);
+	mutex_unlock(&dp->lock);
 	return drm_edid;
 }
 
@@ -267,12 +314,13 @@ cdn_dp_bridge_mode_valid(struct drm_bridge *bridge,
 			 const struct drm_display_info *display_info,
 			 const struct drm_display_mode *mode)
 {
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
 	u32 requested, actual, rate, sink_max, source_max = 0;
 	u8 lanes, bpc;
 
 	/* If DP is disconnected, every mode is invalid */
-	if (!dp->connected)
+	if (!dp_bridge->connected || !dp->connected)
 		return MODE_BAD;
 
 	switch (display_info->bpc) {
@@ -550,6 +598,54 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
 	return drm_dp_channel_eq_ok(link_status, min(port->lanes, sink_lanes));
 }
 
+static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
+			      struct cdn_dp_port *port)
+{
+	int ret;
+
+	if (dp->active)
+		return 0;
+
+	ret = cdn_dp_disable_phy(dp, prev_port);
+	if (ret)
+		goto out;
+	ret = cdn_dp_enable_phy(dp, port);
+	if (ret)
+		goto out;
+
+	ret = cdn_dp_get_sink_capability(dp);
+	if (ret) {
+		cdn_dp_disable_phy(dp, port);
+		goto out;
+	}
+
+	dp->active = true;
+	dp->lanes = port->lanes;
+
+	if (!cdn_dp_check_link_status(dp)) {
+		dev_info(dp->dev, "Connected with sink; re-train link\n");
+
+		ret = cdn_dp_train_link(dp);
+		if (ret) {
+			dev_err(dp->dev, "Training link failed: %d\n", ret);
+			goto out;
+		}
+
+		ret = cdn_dp_set_video_status(dp, CONTROL_VIDEO_IDLE);
+		if (ret) {
+			dev_err(dp->dev, "Failed to idle video %d\n", ret);
+			goto out;
+		}
+
+		ret = cdn_dp_config_video(dp);
+		if (ret)
+			dev_err(dp->dev, "Failed to configure video: %d\n", ret);
+	}
+
+out:
+	return ret;
+}
+
 static void cdn_dp_display_info_update(struct cdn_dp_device *dp,
 				       struct drm_display_info *display_info)
 {
@@ -571,6 +667,7 @@ static void cdn_dp_display_info_update(struct cdn_dp_device *dp,
 static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_atomic_state *state)
 {
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
 	struct drm_connector *connector;
 	int ret, val;
 
@@ -580,7 +677,7 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 
 	cdn_dp_display_info_update(dp, &connector->display_info);
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp->encoder.encoder);
+	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp_bridge->encoder.encoder);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dp->dev, "Could not get vop id, %d", ret);
 		return;
@@ -599,6 +696,9 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 
 	mutex_lock(&dp->lock);
 
+	if (dp->hpd_bridge_valid)
+		dp->active_port = dp_bridge->id;
+
 	ret = cdn_dp_enable(dp);
 	if (ret) {
 		DRM_DEV_ERROR(dp->dev, "Failed to enable bridge %d\n",
@@ -631,6 +731,7 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 		goto out;
 	}
 
+	dp_bridge->enabled = true;
 out:
 	mutex_unlock(&dp->lock);
 }
@@ -638,9 +739,11 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
 static void cdn_dp_bridge_atomic_disable(struct drm_bridge *bridge, struct drm_atomic_state *state)
 {
 	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
 	int ret;
 
 	mutex_lock(&dp->lock);
+	dp_bridge->enabled = false;
 
 	if (dp->active) {
 		ret = cdn_dp_disable(dp);
@@ -827,6 +930,16 @@ static int cdn_dp_audio_mute_stream(struct drm_bridge *bridge,
 	return ret;
 }
 
+static void cdn_dp_bridge_hpd_notify(struct drm_bridge *bridge,
+			   enum drm_connector_status status)
+{
+	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
+	struct cdn_dp_device *dp = bridge_to_dp(bridge);
+
+	dp->bridge_list[dp_bridge->id]->connected = status == connector_status_connected;
+	schedule_work(&dp->event_work);
+}
+
 static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -837,6 +950,7 @@ static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
 	.atomic_disable = cdn_dp_bridge_atomic_disable,
 	.mode_valid = cdn_dp_bridge_mode_valid,
 	.mode_set = cdn_dp_bridge_mode_set,
+	.hpd_notify = cdn_dp_bridge_hpd_notify,
 
 	.dp_audio_prepare = cdn_dp_audio_prepare,
 	.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
@@ -885,7 +999,8 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 {
 	struct cdn_dp_device *dp = container_of(work, struct cdn_dp_device,
 						event_work);
-	int ret;
+	bool connected;
+	int i, ret;
 
 	mutex_lock(&dp->lock);
 
@@ -944,9 +1059,12 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
 
 out:
 	mutex_unlock(&dp->lock);
-	drm_bridge_hpd_notify(&dp->bridge,
-			      dp->connected ? connector_status_connected
-					    : connector_status_disconnected);
+	for (i = 0; i < dp->bridge_count; i++) {
+		connected = dp->connected && dp->bridge_list[i]->connected;
+		drm_bridge_hpd_notify(&dp->bridge_list[i]->bridge,
+				      connected ? connector_status_connected
+						: connector_status_disconnected);
+	}
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,
@@ -966,28 +1084,16 @@ static int cdn_dp_pd_event(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
-static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
+static int cdn_bridge_add(struct device *dev,
+			  struct drm_bridge *bridge,
+			  struct drm_bridge *hpd_bridge,
+			  struct drm_encoder *encoder)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
-	struct drm_encoder *encoder;
+	struct drm_device *drm_dev = dp->drm_dev;
+	struct drm_bridge *last_bridge = NULL;
 	struct drm_connector *connector;
-	struct cdn_dp_port *port;
-	struct drm_device *drm_dev = data;
-	int ret, i;
-
-	ret = cdn_dp_parse_dt(dp);
-	if (ret < 0)
-		return ret;
-
-	dp->drm_dev = drm_dev;
-	dp->connected = false;
-	dp->active = false;
-	dp->active_port = -1;
-	dp->fw_loaded = false;
-
-	INIT_WORK(&dp->event_work, cdn_dp_pd_event_work);
-
-	encoder = &dp->encoder.encoder;
+	int ret;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dev->of_node);
@@ -1002,23 +1108,33 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
 
-	dp->bridge.ops =
-			DRM_BRIDGE_OP_DETECT |
-			DRM_BRIDGE_OP_EDID |
-			DRM_BRIDGE_OP_HPD |
-			DRM_BRIDGE_OP_DP_AUDIO;
-	dp->bridge.of_node = dp->dev->of_node;
-	dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
-	dp->bridge.hdmi_audio_dev = dp->dev;
-	dp->bridge.hdmi_audio_max_i2s_playback_channels = 8;
-	dp->bridge.hdmi_audio_spdif_playback = 1;
-	dp->bridge.hdmi_audio_dai_port = -1;
-
-	ret = devm_drm_bridge_add(dev, &dp->bridge);
+	if (hpd_bridge) {
+		ret = drm_bridge_attach(encoder, hpd_bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+		if (ret)
+			return ret;
+
+		last_bridge = hpd_bridge;
+		while (drm_bridge_get_next_bridge(last_bridge))
+			last_bridge = drm_bridge_get_next_bridge(last_bridge);
+	}
+
+	bridge->ops =
+		DRM_BRIDGE_OP_DETECT |
+		DRM_BRIDGE_OP_EDID |
+		DRM_BRIDGE_OP_HPD |
+		DRM_BRIDGE_OP_DP_AUDIO;
+	bridge->of_node = last_bridge ? last_bridge->of_node : dp->dev->of_node;
+	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+	bridge->hdmi_audio_dev = dp->dev;
+	bridge->hdmi_audio_max_i2s_playback_channels = 8;
+	bridge->hdmi_audio_spdif_playback = 1;
+	bridge->hdmi_audio_dai_port = -1;
+
+	ret = devm_drm_bridge_add(dev, bridge);
 	if (ret)
 		return ret;
 
-	ret = drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
 
@@ -1031,6 +1147,128 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	drm_connector_attach_encoder(connector, encoder);
 
+	return 0;
+}
+
+static int cdn_dp_parse_hpd_bridge_dt(struct cdn_dp_device *dp)
+{
+	struct device_node *np = dp->dev->of_node;
+	struct device_node *port __free(device_node) = of_graph_get_port_by_id(np, 1);
+	struct drm_bridge *bridge;
+	int count = 0;
+	int ret = 0;
+	int i;
+
+	/* If device use extcon, do not use hpd bridge */
+	for (i = 0; i < dp->ports; i++) {
+		if (dp->port[i]->extcon) {
+			dp->bridge_count = 1;
+			return 0;
+		}
+	}
+
+	/*
+	 *
+	 * &dp_out {
+	 *	dp_controller_output0: endpoint@0 {
+	 * 		remote-endpoint = <&dp_phy0_in>
+	 * 	};
+	 *
+	 * 	dp_controller_output1: endpoint@1 {
+	 * 		remote-endpoint = <&dp_phy1_in>
+	 * 	};
+	 * };
+	 *
+	 * &tcphy0_dp {
+	 * 	port {
+	 * 		tcphy0_typec_dp: endpoint@0 {
+	 * 			reg = <0>;
+	 * 			remote-endpoint = <&usbc0_dp>;
+	 * 		};
+	 *
+	 * 		dp_phy0_in: endpoint@1 {
+	 * 			reg = <1>;
+	 * 			remote-endpoint = <&dp_controller_output0>;
+	 * 		};
+	 * 	};
+	 * };
+	 *
+	 * &tcphy1_dp {
+	 * 	...
+	 * };
+	 *
+	 */
+
+	/* One endpoint may correspond to one HPD bridge. */
+	for_each_of_graph_port_endpoint(port, dp_ep) {
+		struct device_node *phy_bridge_node __free(device_node) =
+			of_graph_get_remote_port_parent(dp_ep);
+
+		bridge = of_drm_find_bridge(phy_bridge_node);
+		if (!bridge) {
+			ret = -EPROBE_DEFER;
+			goto out;
+		}
+
+		dp->hpd_bridge_valid = true;
+		dp->hpd_bridge_list[count].bridge = bridge;
+		dp->hpd_bridge_list[count].parent = dp;
+		dp->hpd_bridge_list[count].id = count;
+		count++;
+	}
+
+out:
+	dp->bridge_count = count ? count : 1;
+	return ret;
+}
+
+static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
+{
+	struct cdn_dp_device *dp = dev_get_drvdata(dev);
+	struct drm_bridge *bridge, *hpd_bridge;
+	struct drm_encoder *encoder;
+	struct cdn_dp_port *port;
+	struct drm_device *drm_dev = data;
+	struct cdn_dp_bridge *bridge_list;
+	int ret, i;
+
+	ret = cdn_dp_parse_dt(dp);
+	if (ret < 0)
+		return ret;
+
+	ret = cdn_dp_parse_hpd_bridge_dt(dp);
+	if (ret)
+		return ret;
+
+	dp->drm_dev = drm_dev;
+	dp->connected = false;
+	dp->active = false;
+	dp->active_port = -1;
+	dp->fw_loaded = false;
+
+	for (i = 0; i < dp->bridge_count; i++) {
+		bridge_list = devm_drm_bridge_alloc(dev, struct cdn_dp_bridge, bridge,
+						    &cdn_dp_bridge_funcs);
+		if (IS_ERR(bridge_list))
+			return PTR_ERR(bridge_list);
+		bridge_list->id = i;
+		bridge_list->parent = dp;
+		if (!dp->hpd_bridge_valid)
+			bridge_list->connected = true;
+		dp->bridge_list[i] = bridge_list;
+	}
+
+	for (i = 0; i < dp->bridge_count; i++) {
+		encoder = &dp->bridge_list[i]->encoder.encoder;
+		bridge = &dp->bridge_list[i]->bridge;
+		hpd_bridge = dp->hpd_bridge_list[i].bridge;
+		ret = cdn_bridge_add(dev, bridge, hpd_bridge, encoder);
+		if (ret)
+			return ret;
+	}
+
+	INIT_WORK(&dp->event_work, cdn_dp_pd_event_work);
+
 	for (i = 0; i < dp->ports; i++) {
 		port = dp->port[i];
 
@@ -1058,10 +1296,17 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dp->encoder.encoder;
+	struct drm_encoder *encoder;
+	int i;
 
 	cancel_work_sync(&dp->event_work);
-	encoder->funcs->destroy(encoder);
+	for (i = 0; i < dp->bridge_count; i++) {
+		encoder = &dp->bridge_list[i]->encoder.encoder;
+		encoder->funcs->destroy(encoder);
+	}
+
+	for (i = 0; i < MAX_PHY; i++)
+		drm_edid_free(dp->edid_cache[i]);
 
 	pm_runtime_disable(dev);
 	if (dp->fw_loaded)
@@ -1112,10 +1357,10 @@ static int cdn_dp_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 
-	dp = devm_drm_bridge_alloc(dev, struct cdn_dp_device, bridge,
-				   &cdn_dp_bridge_funcs);
-	if (IS_ERR(dp))
-		return PTR_ERR(dp);
+	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
 	dp->dev = dev;
 
 	match = of_match_node(cdn_dp_dt_ids, pdev->dev.of_node);
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index e9c30b9fd543..1a6ac6f1551b 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -38,6 +38,8 @@ enum vic_pxl_encoding_format {
 	Y_ONLY = 0x10,
 };
 
+struct cdn_dp_device;
+
 struct video_info {
 	bool h_sync_polarity;
 	bool v_sync_polarity;
@@ -63,16 +65,34 @@ struct cdn_dp_port {
 	u8 id;
 };
 
+struct cdn_dp_bridge {
+	struct cdn_dp_device *parent;
+	struct drm_bridge bridge;
+	struct rockchip_encoder encoder;
+	bool connected;
+	bool enabled;
+	int id;
+};
+
+struct cdn_dp_hpd_bridge {
+	struct cdn_dp_device *parent;
+	struct drm_bridge *bridge;
+	int id;
+};
+
 struct cdn_dp_device {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct drm_bridge bridge;
-	struct rockchip_encoder encoder;
+	int bridge_count;
+	struct cdn_dp_bridge *bridge_list[MAX_PHY];
+	struct cdn_dp_hpd_bridge hpd_bridge_list[MAX_PHY];
+	const struct drm_edid *edid_cache[MAX_PHY];
 	struct drm_display_mode mode;
 	struct platform_device *audio_pdev;
 	struct work_struct event_work;
 
 	struct mutex lock;
+	bool hpd_bridge_valid;
 	bool connected;
 	bool active;
 	bool suspended;
-- 
2.49.0

