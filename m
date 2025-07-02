Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F1DAF1369
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 13:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008F910E6EA;
	Wed,  2 Jul 2025 11:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="nuudi/Ue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 648D110E19E;
 Wed,  2 Jul 2025 11:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Jv
 wKybViNb+uqazo21/1J7lO+CuYe7LSyDDYoVSWx3E=; b=nuudi/UeoVBm2DmwNV
 GPKtAN8kz+/uU2bQ31KehFtBL0ykA0aUnB104Yz5LRJUv8zVVmknFkYv6YufrbcP
 2YyKWHNaF8f2VavCBpH0f5MfPyiD3eqFvLxiW4QTeXbg0UXcFFk53mISCYIIQutl
 FJJY8fq6GO1ictGukqF+9PaWA=
Received: from ProDesk.. (unknown [])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgCHTGOvFGVoldg0Aw--.49301S4;
 Wed, 02 Jul 2025 19:15:04 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, Andy Yan <andyshrk@163.com>
Subject: [PATCH v2 2/2] drm/bridge: Pass down connector to drm bridge detect
 hook
Date: Wed,  2 Jul 2025 19:14:44 +0800
Message-ID: <20250702111453.102539-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702111453.102539-1-andyshrk@163.com>
References: <20250702111453.102539-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgCHTGOvFGVoldg0Aw--.49301S4
X-Coremail-Antispam: 1Uf129KBjvAXoWfCFWxWw13tFW3KrWxXFWxCrg_yoW5Gr48to
 WfA3sa9ayUG34xX393tF17KF4Yq3ZxKrn3WF4rK3ykWayUG3y7tFyIgFnxXFy7JFyaqr47
 Z3ZrKr1rCr17GFn7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RpT5HUUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEhh+XmhlDIvFbQABsJ
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
Signed-off-by: Andy Yan <andyshrk@163.com>
---

(no changes since v1)

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
 drivers/gpu/drm/rockchip/rk3066_hdmi.c                |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                      |  3 ++-
 include/drm/drm_bridge.h                              |  6 ++++--
 31 files changed, 68 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9df18a8f2e37..cb6b6ce1669e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -864,7 +864,8 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
 	return ret;
 }
 
-static enum drm_connector_status adv7511_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+adv7511_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0ac4a82c5a6e..c0ad8f59e483 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2448,7 +2448,7 @@ anx7625_audio_update_connector_status(struct anx7625_data *ctx,
 				      enum drm_connector_status status);
 
 static enum drm_connector_status
-anx7625_bridge_detect(struct drm_bridge *bridge)
+anx7625_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 	struct device *dev = ctx->dev;
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index cb5f5a8c539a..a614d1384f71 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2143,7 +2143,8 @@ static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
-static enum drm_connector_status cdns_mhdp_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+cdns_mhdp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
 
diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index ab9274793356..54d49d4882c8 100644
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
index badd2c7f91a1..52b7b5889e6f 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -40,8 +40,7 @@ static int display_connector_attach(struct drm_bridge *bridge,
 	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
 }
 
-static enum drm_connector_status
-display_connector_detect(struct drm_bridge *bridge)
+static enum drm_connector_status display_connector_detect(struct drm_bridge *bridge)
 {
 	struct display_connector *conn = to_display_connector(bridge);
 
@@ -82,6 +81,12 @@ display_connector_detect(struct drm_bridge *bridge)
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
@@ -172,7 +177,7 @@ static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs display_connector_bridge_funcs = {
 	.attach = display_connector_attach,
-	.detect = display_connector_detect,
+	.detect = display_connector_bridge_detect,
 	.edid_read = display_connector_edid_read,
 	.atomic_get_output_bus_fmts = display_connector_get_output_bus_fmts,
 	.atomic_get_input_bus_fmts = display_connector_get_input_bus_fmts,
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index c4eedf643f39..cf813672b4ff 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -693,7 +693,8 @@ static int it6263_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
-static enum drm_connector_status it6263_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+it6263_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
 
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index b0dc9280d870..89649c17ffad 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3238,7 +3238,7 @@ static void it6505_bridge_atomic_post_disable(struct drm_bridge *bridge,
 }
 
 static enum drm_connector_status
-it6505_bridge_detect(struct drm_bridge *bridge)
+it6505_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
 
diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 6494f0842793..aa7b1dcc5d70 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -843,7 +843,8 @@ static enum drm_mode_status it66121_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static enum drm_connector_status it66121_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+it66121_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx, bridge);
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index bd83228b0f0e..342374cb8fc6 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -408,7 +408,7 @@ lt8912_connector_detect(struct drm_connector *connector, bool force)
 	struct lt8912 *lt = connector_to_lt8912(connector);
 
 	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_DETECT)
-		return drm_bridge_detect(lt->hdmi_port);
+		return drm_bridge_detect(lt->hdmi_port, connector);
 
 	return lt8912_check_cable_status(lt);
 }
@@ -607,12 +607,12 @@ lt8912_bridge_mode_valid(struct drm_bridge *bridge,
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
index ff85ac8130b4..a2d032ee4744 100644
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
index 766da2cb45a7..38fb8776c0f4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -353,7 +353,8 @@ static void lt9611uxc_bridge_mode_set(struct drm_bridge *bridge,
 	lt9611uxc_unlock(lt9611uxc);
 }
 
-static enum drm_connector_status lt9611uxc_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+lt9611uxc_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
 	unsigned int reg_val = 0;
diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index 81dde9ed7bcf..de57f8a9e98c 100644
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
index 882973e90062..d537b1d036fb 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -458,7 +458,8 @@ static int sii902x_bridge_attach(struct drm_bridge *bridge,
 	return 0;
 }
 
-static enum drm_connector_status sii902x_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+sii902x_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index c66bd913e33a..3d15ddd39470 100644
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
index f9438e39b94a..39332c57f2c5 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -876,7 +876,7 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 }
 
 static enum drm_connector_status
-dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge)
+dw_hdmi_qp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 76c6570e2a85..206b099a35e9 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2978,7 +2978,8 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mutex_unlock(&hdmi->mutex);
 }
 
-static enum drm_connector_status dw_hdmi_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+dw_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 61559467e2d2..d33cde42c25b 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1760,7 +1760,8 @@ static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
 	.get_modes = tc_connector_get_modes,
 };
 
-static enum drm_connector_status tc_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+tc_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	bool conn;
@@ -1785,7 +1786,7 @@ tc_connector_detect(struct drm_connector *connector, bool force)
 	struct tc_data *tc = connector_to_tc(connector);
 
 	if (tc->hpd_pin >= 0)
-		return tc_bridge_detect(&tc->bridge);
+		return tc_bridge_detect(&tc->bridge, connector);
 
 	if (tc->panel_bridge)
 		return connector_status_connected;
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 3d0b4bc5129d..575dc2667592 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1155,7 +1155,8 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(pdata->dev);
 }
 
-static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+ti_sn_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	int val = 0;
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 549e8e8edeb4..b80ee089f880 100644
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
index 0919364e80d1..dcf686c4e73d 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -77,6 +77,12 @@ static enum drm_connector_status tpd12s015_detect(struct drm_bridge *bridge)
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
@@ -94,7 +100,7 @@ static void tpd12s015_hpd_disable(struct drm_bridge *bridge)
 static const struct drm_bridge_funcs tpd12s015_bridge_funcs = {
 	.attach			= tpd12s015_attach,
 	.detach			= tpd12s015_detach,
-	.detect			= tpd12s015_detect,
+	.detect			= tpd12s015_bridge_detect,
 	.hpd_enable		= tpd12s015_hpd_enable,
 	.hpd_disable		= tpd12s015_hpd_disable,
 };
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 717d96530c38..3e4d561a3a32 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -210,7 +210,7 @@ drm_bridge_connector_detect(struct drm_connector *connector, bool force)
 	enum drm_connector_status status;
 
 	if (detect) {
-		status = detect->funcs->detect(detect);
+		status = detect->funcs->detect(detect, connector);
 
 		if (hdmi)
 			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 0b450b334afd..dd45d9b504d8 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1237,12 +1237,13 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
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
index a5b10b2545dc..bef6eeb30d3e 100644
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
index 6943cdc77dec..845fd8aa43c3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1174,7 +1174,8 @@ static void mtk_hdmi_hpd_event(bool hpd, struct device *dev)
  * Bridge callbacks
  */
 
-static enum drm_connector_status mtk_hdmi_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+mtk_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f222d7ccaa88..9a461ab2f32f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -20,7 +20,8 @@
  * @bridge: Pointer to drm bridge structure
  * Returns: Bridge's 'is connected' status
  */
-static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct msm_dp *dp;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 1d02d4e1ed5b..02cfd46df594 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -215,7 +215,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);
 
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
-		struct drm_bridge *bridge);
+		struct drm_bridge *bridge, struct drm_connector *connector);
 void msm_hdmi_hpd_enable(struct drm_bridge *bridge);
 void msm_hdmi_hpd_disable(struct drm_bridge *bridge);
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 53a7ce8cc7bc..46fd58646d32 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -475,7 +475,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 		container_of(work, struct hdmi_bridge, hpd_work);
 	struct drm_bridge *bridge = &hdmi_bridge->base;
 
-	drm_bridge_hpd_notify(bridge, drm_bridge_detect(bridge));
+	drm_bridge_hpd_notify(bridge, drm_bridge_detect(bridge, hdmi_bridge->hdmi->connector));
 }
 
 /* initialize bridge */
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 407e6c449ee0..114b0d507700 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -177,8 +177,8 @@ static enum drm_connector_status detect_gpio(struct hdmi *hdmi)
 			connector_status_disconnected;
 }
 
-enum drm_connector_status msm_hdmi_bridge_detect(
-		struct drm_bridge *bridge)
+enum drm_connector_status
+msm_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index e7875b52f298..ae4a5ac2299a 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -450,7 +450,7 @@ struct drm_encoder_helper_funcs rk3066_hdmi_encoder_helper_funcs = {
 };
 
 static enum drm_connector_status
-rk3066_hdmi_bridge_detect(struct drm_bridge *bridge)
+rk3066_hdmi_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 02e1feaa6115..588dd5610fa5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1720,7 +1720,8 @@ static enum drm_connector_status __zynqmp_dp_bridge_detect(struct zynqmp_dp *dp)
 	return connector_status_disconnected;
 }
 
-static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *bridge)
+static enum drm_connector_status
+zynqmp_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 7a75b449bc91..b5a3124f70ed 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -660,7 +660,8 @@ struct drm_bridge_funcs {
 	 *
 	 * drm_connector_status indicating the bridge output status.
 	 */
-	enum drm_connector_status (*detect)(struct drm_bridge *bridge);
+	enum drm_connector_status (*detect)(struct drm_bridge *bridge,
+					    struct drm_connector *connector);
 
 	/**
 	 * @get_modes:
@@ -1382,7 +1383,8 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
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

