Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C259A6B666
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EB310E70E;
	Fri, 21 Mar 2025 08:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ExobrI6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id A6A6E10E700
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=QIFEp
 GGDa71359LBYe0SQ38cIHIQtkKXiHkgSEi2Dis=; b=ExobrI6LY1lT9CrJ57lKH
 tVrG61G1FIWRPOR1rYDd0n7rNChk7rbwQs+icnASncwO/z8Pf7uP+WGCdwEzS4Z+
 UTLkHDqhlI0oVyD00FlQz5KaDRj9wNTGMz9yXy33t3sG5N/yylDOa4VasmHZjki+
 EA4R/mRLYoMMTcQU4bdfBc=
Received: from ProDesk.. (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgC3lmIbKd1nvVJ9AQ--.2326S3;
 Fri, 21 Mar 2025 16:53:53 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/1] drm/bridge: Pass down connector to drm bridge detect hook
Date: Fri, 21 Mar 2025 16:53:38 +0800
Message-ID: <20250321085345.136380-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321085345.136380-1-andyshrk@163.com>
References: <20250321085345.136380-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3lmIbKd1nvVJ9AQ--.2326S3
X-Coremail-Antispam: 1Uf129KBjvAXoWfCFWfJry3KFyDAFWfCrWfXwb_yoW5JF1kKo
 WfA3sa9ayUG34xX393tF17KF4Yq3ZxKrn3WF4rK3ykWayDG3y7JFyIgFnxXFy7JFyaqr47
 Z3ZrKr1rCr17G3Wxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3DDGUUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBIXXmfdJ8EkmwAAsQ
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

From: Andy Yan <andy.yan@rock-chips.com>

In some application scenarios, we hope to get the corresponding
connector when the bridge's detect hook is invoked.

In most cases, we can get the connector by drm_atomic_get_connector_for_encoder
if the encoder attached to the bridge is enabled, however there will
still be some scenarios where the detect hook of the bridge is called
but the corresponding encoder has not been enabled yet. For instance,
this occurs when the device is hot plug in for the first time.

Since the call to bridge's detect is initiated by the connector, passing
down the corresponding connector directly will make things simpler.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c          |  3 ++-
 drivers/gpu/drm/bridge/analogix/anx7625.c             |  2 +-
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c   |  3 ++-
 drivers/gpu/drm/bridge/chrontel-ch7033.c              |  2 +-
 drivers/gpu/drm/bridge/display-connector.c            | 11 ++++++++---
 drivers/gpu/drm/bridge/ite-it6263.c                   |  3 ++-
 drivers/gpu/drm/bridge/ite-it6505.c                   |  2 +-
 drivers/gpu/drm/bridge/ite-it66121.c                  |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c              |  6 +++---
 drivers/gpu/drm/bridge/lontium-lt9611.c               |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c            |  3 ++-
 .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c  |  3 ++-
 drivers/gpu/drm/bridge/sii902x.c                      |  3 ++-
 drivers/gpu/drm/bridge/simple-bridge.c                |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c          |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c             |  3 ++-
 drivers/gpu/drm/bridge/tc358767.c                     |  5 +++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c                 |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c                    |  2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c                 |  8 +++++++-
 drivers/gpu/drm/display/drm_bridge_connector.c        |  2 +-
 drivers/gpu/drm/drm_bridge.c                          |  5 +++--
 drivers/gpu/drm/mediatek/mtk_dp.c                     |  3 ++-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                   |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.c                       |  3 ++-
 drivers/gpu/drm/msm/hdmi/hdmi.h                       |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c                |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                   |  4 ++--
 drivers/gpu/drm/xlnx/zynqmp_dp.c                      |  3 ++-
 include/drm/drm_bridge.h                              |  6 ++++--
 30 files changed, 67 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 050dae338ffe..dd0166c0b319 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -973,7 +973,8 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	return ret;
 }
 
-static enum drm_connector_status adv7511_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+adv7511_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0b97b66de577..ab5eb7f9fbca 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2450,7 +2450,7 @@ anx7625_audio_update_connector_status(struct anx7625_data *ctx,
 				      enum drm_connector_status status);
 
 static enum drm_connector_status
-anx7625_bridge_detect(struct drm_bridge *bridge)
+anx7625_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 6094ecde35ff..aeaf2e153c91 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2142,7 +2142,8 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
-static enum drm_connector_status cdns_mhdp_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+cdns_mhdp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index da17f0978a79..52ec5f901f10 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -215,7 +215,7 @@ static enum drm_connector_status ch7033_connector_detect(
 {
 	struct ch7033_priv *priv = conn_to_ch7033_priv(connector);
 
-	return drm_bridge_detect(priv->next_bridge);
+	return drm_bridge_detect(priv->next_bridge, connector);
 }
 
 static const struct drm_connector_funcs ch7033_connector_funcs = {
diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 72bc508d4e6e..41a379e0bde6 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -39,8 +39,7 @@ static int display_connector_attach(struct drm_bridge *bridge,
 	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
 }
 
-static enum drm_connector_status
-display_connector_detect(struct drm_bridge *bridge)
+static enum drm_connector_status display_connector_detect(struct drm_bridge *bridge)
 {
 	struct display_connector *conn = to_display_connector(bridge);
 
@@ -81,6 +80,12 @@ display_connector_detect(struct drm_bridge *bridge)
 	}
 }
 
+static enum drm_connector_status
+display_connector_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
+{
+	return display_connector_detect(bridge);
+}
+
 static const struct drm_edid *display_connector_edid_read(struct drm_bridge *bridge,
 							  struct drm_connector *connector)
 {
@@ -171,7 +176,7 @@ static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs display_connector_bridge_funcs = {
 	.attach = display_connector_attach,
-	.detect = display_connector_detect,
+	.detect = display_connector_bridge_detect,
 	.edid_read = display_connector_edid_read,
 	.atomic_get_output_bus_fmts = display_connector_get_output_bus_fmts,
 	.atomic_get_input_bus_fmts = display_connector_get_input_bus_fmts,
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 21152a1c28f7..27cd56eabedd 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -692,7 +692,8 @@ static int it6263_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
-static enum drm_connector_status it6263_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+it6263_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index b05fc82bb667..88266ec21b83 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3237,7 +3237,7 @@ static void it6505_bridge_atomic_post_disable(struct drm_bridge *bridge,
 }
 
 static enum drm_connector_status
-it6505_bridge_detect(struct drm_bridge *bridge)
+it6505_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
 
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index b9f90f32145d..70207ffbd1aa 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -842,7 +842,8 @@ static enum drm_mode_status it66121_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static enum drm_connector_status it66121_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+it66121_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 52da204f5740..c454648db7d0 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -408,7 +408,7 @@ lt8912_connector_detect(struct drm_connector *connector, bool force)
 	struct lt8912 *lt = connector_to_lt8912(connector);
 
 	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_DETECT)
-		return drm_bridge_detect(lt->hdmi_port);
+		return drm_bridge_detect(lt->hdmi_port, connector);
 
 	return lt8912_check_cable_status(lt);
 }
@@ -606,12 +606,12 @@ lt8912_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static enum drm_connector_status
-lt8912_bridge_detect(struct drm_bridge *bridge)
+lt8912_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 
 	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_DETECT)
-		return drm_bridge_detect(lt->hdmi_port);
+		return drm_bridge_detect(lt->hdmi_port, connector);
 
 	return lt8912_check_cable_status(lt);
 }
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 026803034231..8930c1db9bca 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -543,7 +543,8 @@ static int lt9611_regulator_enable(struct lt9611 *lt9611)
 	return 0;
 }
 
-static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+lt9611_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	unsigned int reg_val = 0;
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index f4c3ff1fdc69..898a035bd1e8 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -352,7 +352,8 @@ static void lt9611uxc_bridge_mode_set(struct drm_bridge *bridge,
 	lt9611uxc_unlock(lt9611uxc);
 }
 
-static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+lt9611uxc_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
 	unsigned int reg_val = 0;
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index a47aabf134fd..89c7114f34b1 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -120,7 +120,8 @@ drm_connector_helper_funcs ge_b850v3_lvds_connector_helper_funcs = {
 	.get_modes = ge_b850v3_lvds_get_modes,
 };
 
-static enum drm_connector_status ge_b850v3_lvds_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+ge_b850v3_lvds_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct i2c_client *stdp4028_i2c =
 			ge_b850v3_lvds_ptr->stdp4028_i2c;
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 914a2609a685..cd3225313e67 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -457,7 +457,8 @@ static int sii902x_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
-static enum drm_connector_status sii902x_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+sii902x_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 2b8954e61589..2b02214936d9 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -90,7 +90,7 @@ simple_bridge_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct simple_bridge *sbridge = drm_connector_to_simple_bridge(connector);
 
-	return drm_bridge_detect(sbridge->next_bridge);
+	return drm_bridge_detect(sbridge->next_bridge, connector);
 }
 
 static const struct drm_connector_funcs simple_bridge_con_funcs = {
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 6166f197e37b..3ed894a546d5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -875,7 +875,7 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 }
 
 static enum drm_connector_status
-dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge)
+dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 306e09a24a1c..9e10bdcd3a6f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2976,7 +2976,8 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mutex_unlock(&hdmi->mutex);
 }
 
-static enum drm_connector_status dw_hdmi_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+dw_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 39e2d3a7a27d..de30bb7a965c 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1752,7 +1752,8 @@ static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
 	.get_modes = tc_connector_get_modes,
 };
 
-static enum drm_connector_status tc_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+tc_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	bool conn;
@@ -1777,7 +1778,7 @@ tc_connector_detect(struct drm_connector *connector, bool force)
 	struct tc_data *tc = connector_to_tc(connector);
 
 	if (tc->hpd_pin >= 0)
-		return tc_bridge_detect(&tc->bridge);
+		return tc_bridge_detect(&tc->bridge, connector);
 
 	if (tc->panel_bridge)
 		return connector_status_connected;
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 01d456b955ab..38025f609b1f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1195,7 +1195,8 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(pdata->dev);
 }
 
-static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+ti_sn_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int val = 0;
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 79ab5da827e1..5261e5c75b06 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -89,7 +89,7 @@ tfp410_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
 
-	return drm_bridge_detect(dvi->next_bridge);
+	return drm_bridge_detect(dvi->next_bridge, connector);
 }
 
 static const struct drm_connector_funcs tfp410_con_funcs = {
diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index 47b74cb25b14..5d8070965542 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -76,6 +76,12 @@ static enum drm_connector_status tpd12s015_detect(struct drm_bridge *bridge)
 		return connector_status_disconnected;
 }
 
+static enum drm_connector_status
+tpd12s015_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
+{
+	return tpd12s015_detect(bridge);
+}
+
 static void tpd12s015_hpd_enable(struct drm_bridge *bridge)
 {
 	struct tpd12s015_device *tpd = to_tpd12s015(bridge);
@@ -93,7 +99,7 @@ static void tpd12s015_hpd_disable(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs tpd12s015_bridge_funcs = {
 	.attach			= tpd12s015_attach,
 	.detach			= tpd12s015_detach,
-	.detect			= tpd12s015_detect,
+	.detect			= tpd12s015_bridge_detect,
 	.hpd_enable		= tpd12s015_hpd_enable,
 	.hpd_disable		= tpd12s015_hpd_disable,
 };
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 30c736fc0067..8a5250b6f20d 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -186,7 +186,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	enum drm_connector_status status;
 
 	if (detect) {
-		status = detect->funcs->detect(detect);
+		status = detect->funcs->detect(detect, connector);
 
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index ea9525ec16b5..e00d9b371c23 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1127,12 +1127,13 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
  * The detection status on success, or connector_status_unknown if the bridge
  * doesn't support output detection.
  */
-enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge)
+enum drm_connector_status
+drm_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_DETECT))
 		return connector_status_unknown;
 
-	return bridge->funcs->detect(bridge);
+	return bridge->funcs->detect(bridge, connector);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_detect);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 3d4648d2e15f..2f7629fdfa94 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2118,7 +2118,8 @@ static void mtk_dp_update_plugged_status(struct mtk_dp *mtk_dp)
 	mutex_unlock(&mtk_dp->update_plugged_status_lock);
 }
 
-static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+mtk_dp_bdg_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 	enum drm_connector_status ret = connector_status_disconnected;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index d4ab098e1174..e32b8d216615 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1247,7 +1247,8 @@ static void mtk_hdmi_hpd_event(bool hpd, struct device *dev)
  * Bridge callbacks
  */
 
-static enum drm_connector_status mtk_hdmi_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+mtk_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 022b3e815cf3..0dc9533e510c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -18,7 +18,8 @@
  * @bridge: Pointer to drm bridge structure
  * Returns: Bridge's 'is connected' status
  */
-static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct msm_dp *dp;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a62d2aedfbb7..878a186b0b29 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -236,7 +236,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);
 
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
-		struct drm_bridge *bridge);
+		struct drm_bridge *bridge, struct drm_connector *connector);
 int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
 void msm_hdmi_hpd_disable(struct hdmi *hdmi);
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f..06d0d7a1546f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -314,7 +314,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 		container_of(work, struct hdmi_bridge, hpd_work);
 	struct drm_bridge *bridge = &hdmi_bridge->base;
 
-	drm_bridge_hpd_notify(bridge, drm_bridge_detect(bridge));
+	drm_bridge_hpd_notify(bridge, drm_bridge_detect(bridge, hdmi_bridge->hdmi->connector));
 }
 
 /* initialize bridge */
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 9ce0ffa35417..dca901e251d1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -224,8 +224,8 @@ static enum drm_connector_status detect_gpio(struct hdmi *hdmi)
 			connector_status_disconnected;
 }
 
-enum drm_connector_status msm_hdmi_bridge_detect(
-		struct drm_bridge *bridge)
+enum drm_connector_status
+msm_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a6a4a871f197..0a476a18f7b2 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1719,7 +1719,8 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 	return connector_status_disconnected;
 }
 
-static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+zynqmp_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index b0d86a685a41..adb56168f5dc 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -532,7 +532,8 @@ struct drm_bridge_funcs {
 	 *
 	 * drm_connector_status indicating the bridge output status.
 	 */
-	enum drm_connector_status (*detect)(struct drm_bridge *bridge);
+	enum drm_connector_status (*detect)(struct drm_bridge *bridge,
+					    struct drm_connector *connector);
 
 	/**
 	 * @get_modes:
@@ -1043,7 +1044,8 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
 					u32 output_fmt,
 					unsigned int *num_input_fmts);
 
-enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge);
+enum drm_connector_status
+drm_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector);
 int drm_bridge_get_modes(struct drm_bridge *bridge,
 			 struct drm_connector *connector);
 const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
-- 
2.43.0

