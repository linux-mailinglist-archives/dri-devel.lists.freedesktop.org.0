Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFFE4D05DB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 19:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D1110E0F3;
	Mon,  7 Mar 2022 18:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4876A10E025
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 18:00:08 +0000 (UTC)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83AC8B6C;
 Mon,  7 Mar 2022 19:00:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646676007;
 bh=7GnlsHeL9MDTdwZOlEToDD/Ya3nglGn1iT+wlz721dQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ogfGNwOMkHIZxJaUjQGXGW3hc0/8hVU5ccDudAo4P43J7GjAIU6XDWj9ZpXyiZme9
 M3iRFhpF+4vZHo+I4iUtAjEakqhgHK0i7J/bPhpuNmBC/cA5NLyQSrCKLyCEe3NZU8
 IghAyW2WG9QZcQxmLVLwLc6pSSP0i2E8G7DD1OQc=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/4] drm/bridge: ti-sn65dsi86: Support hotplug detection
Date: Mon,  7 Mar 2022 17:59:55 +0000
Message-Id: <20220307175955.363057-5-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the SN65DSI86 is used in DisplayPort mode, its output is likely
routed to a DisplayPort connector, which can benefit from hotplug
detection. Support it in such cases, with polling mode only for now.

The implementation is limited to the bridge operations, as the connector
operations are legacy and new users should use
DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v1:

- Document the no_hpd field
- Rely on the SN_HPD_DISABLE_REG default value in the HPD case
- Add a TODO comment regarding IRQ support
[Kieran]
- Fix spelling s/assrted/asserted/
- Only enable HPD on DisplayPort connector.
- Support IRQ based hotplug detect
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 133 +++++++++++++++++++++++---
 1 file changed, 120 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 461f963faa0b..febb4e672ece 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -68,6 +68,7 @@
 #define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
 #define  HPD_DISABLE				BIT(0)
+#define  HPD_DEBOUNCED_STATE			BIT(4)
 #define SN_GPIO_IO_REG				0x5E
 #define  SN_GPIO_INPUT_SHIFT			4
 #define  SN_GPIO_OUTPUT_SHIFT			0
@@ -104,10 +105,24 @@
 #define SN_PWM_EN_INV_REG			0xA5
 #define  SN_PWM_INV_MASK			BIT(0)
 #define  SN_PWM_EN_MASK				BIT(1)
+#define SN_IRQ_EN_REG				0xE0
+#define  IRQ_EN					BIT(0)
+#define SN_IRQ_HPD_REG				0xE6
+#define  IRQ_HPD_EN				BIT(0)
+#define  IRQ_HPD_INSERTION_EN			BIT(1)
+#define  IRQ_HPD_REMOVAL_EN			BIT(2)
+#define  IRQ_HPD_REPLUG_EN			BIT(3)
+#define  IRQ_HPD_PLL_UNLOCK_EN			BIT(5)
 #define SN_AUX_CMD_STATUS_REG			0xF4
 #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
 #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
 #define  AUX_IRQ_STATUS_NAT_I2C_FAIL		BIT(6)
+#define SN_IRQ_HPD_STATUS_REG			0xF5
+#define  IRQ_HPD_STATUS				BIT(0)
+#define  IRQ_HPD_INSERTION_STATUS		BIT(1)
+#define  IRQ_HPD_REMOVAL_STATUS			BIT(2)
+#define  IRQ_HPD_REPLUG_STATUS			BIT(3)
+#define  IRQ_PLL_UNLOCK				BIT(5)
 
 #define MIN_DSI_CLK_FREQ_MHZ	40
 
@@ -166,6 +181,11 @@
  * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
  * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
  * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
+ *
+ * @no_hpd:       Disable hot-plug detection as instructed by device tree (used
+ *                for instance for eDP panels whose HPD signal won't be asserted
+ *                until the panel is turned on, and is thus not usable for
+ *                downstream device detection).
  */
 struct ti_sn65dsi86 {
 	struct auxiliary_device		bridge_aux;
@@ -200,6 +220,8 @@ struct ti_sn65dsi86 {
 	atomic_t			pwm_pin_busy;
 #endif
 	unsigned int			pwm_refclk_freq;
+
+	bool				no_hpd;
 };
 
 static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
@@ -314,23 +336,25 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
 	ti_sn_bridge_set_refclk_freq(pdata);
 
 	/*
-	 * HPD on this bridge chip is a bit useless.  This is an eDP bridge
-	 * so the HPD is an internal signal that's only there to signal that
-	 * the panel is done powering up.  ...but the bridge chip debounces
-	 * this signal by between 100 ms and 400 ms (depending on process,
-	 * voltage, and temperate--I measured it at about 200 ms).  One
+	 * As this is an eDP bridge, the output will be connected to a fixed
+	 * panel in most systems. HPD is in that case only an internal signal
+	 * to signal that the panel is done powering up. The bridge chip
+	 * debounces this signal by between 100 ms and 400 ms (depending on
+	 * process, voltage, and temperate--I measured it at about 200 ms). One
 	 * particular panel asserted HPD 84 ms after it was powered on meaning
 	 * that we saw HPD 284 ms after power on.  ...but the same panel said
 	 * that instead of looking at HPD you could just hardcode a delay of
-	 * 200 ms.  We'll assume that the panel driver will have the hardcoded
-	 * delay in its prepare and always disable HPD.
+	 * 200 ms. HPD is thus a bit useless. For this type of use cases, we'll
+	 * assume that the panel driver will have the hardcoded delay in its
+	 * prepare and always disable HPD.
 	 *
-	 * If HPD somehow makes sense on some future panel we'll have to
-	 * change this to be conditional on someone specifying that HPD should
-	 * be used.
+	 * However, on some systems, the output is connected to a DisplayPort
+	 * connector. HPD is needed in such cases. To accommodate both use
+	 * cases, enable HPD only when requested.
 	 */
-	regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
-			   HPD_DISABLE);
+	if (pdata->no_hpd)
+		regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
+				   HPD_DISABLE, HPD_DISABLE);
 
 	pdata->comms_enabled = true;
 
@@ -1164,6 +1188,36 @@ static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
 	pm_runtime_put_sync(pdata->dev);
 }
 
+static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int val;
+
+	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
+
+	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
+					 : connector_status_disconnected;
+}
+
+static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	/* The device must remain active for HPD to function */
+	pm_runtime_get_sync(pdata->dev);
+	regmap_write(pdata->regmap, SN_IRQ_HPD_REG,
+		     IRQ_HPD_EN | IRQ_HPD_INSERTION_EN |
+		     IRQ_HPD_REMOVAL_EN | IRQ_HPD_REPLUG_EN);
+}
+
+static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	regmap_write(pdata->regmap, SN_IRQ_HPD_REG, 0);
+	pm_runtime_put_autosuspend(pdata->dev);
+}
+
 static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
 					  struct drm_connector *connector)
 {
@@ -1185,6 +1239,9 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.enable = ti_sn_bridge_enable,
 	.disable = ti_sn_bridge_disable,
 	.post_disable = ti_sn_bridge_post_disable,
+	.detect = ti_sn_bridge_detect,
+	.hpd_enable = ti_sn_bridge_hpd_enable,
+	.hpd_disable = ti_sn_bridge_hpd_disable,
 	.get_edid = ti_sn_bridge_get_edid,
 };
 
@@ -1264,6 +1321,14 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 		return PTR_ERR(pdata->next_bridge);
 	}
 
+	pdata->no_hpd = of_property_read_bool(np, "no-hpd");
+	if (pdata->next_bridge->type != DRM_MODE_CONNECTOR_DisplayPort &&
+	    !pdata->no_hpd) {
+		dev_warn(pdata->dev,
+			 "HPD support requires a DisplayPort connector\n");
+		pdata->no_hpd = true;
+	}
+
 	ti_sn_bridge_parse_lanes(pdata, np);
 
 	ret = ti_sn_bridge_parse_dsi_host(pdata);
@@ -1272,7 +1337,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = np;
-	pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
+	pdata->bridge.ops = (pdata->no_hpd ? 0 : DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_HPD)
+			  | DRM_BRIDGE_OP_EDID;
 	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
@@ -1840,6 +1906,34 @@ static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
 				       pdata->supplies);
 }
 
+static irqreturn_t ti_sn65dsi86_irq_handler(int irq, void *arg)
+{
+	struct ti_sn65dsi86 *pdata = arg;
+	int ret;
+	int hpd;
+
+	ret = regmap_read(pdata->regmap, SN_IRQ_HPD_STATUS_REG, &hpd);
+	if (ret || !hpd)
+		return IRQ_NONE;
+
+	if (hpd & IRQ_HPD_INSERTION_STATUS)
+		drm_bridge_hpd_notify(&pdata->bridge, connector_status_connected);
+
+	if (hpd & IRQ_HPD_REMOVAL_STATUS)
+		drm_bridge_hpd_notify(&pdata->bridge, connector_status_disconnected);
+
+	/* When replugged, ensure we trigger a detect to update the display */
+	if (hpd & IRQ_HPD_REPLUG_STATUS)
+		drm_bridge_hpd_notify(&pdata->bridge, connector_status_disconnected);
+
+	/* reset the status registers */
+	regmap_write(pdata->regmap, SN_IRQ_HPD_STATUS_REG,
+		     IRQ_HPD_STATUS | IRQ_HPD_INSERTION_STATUS |
+		     IRQ_HPD_REMOVAL_STATUS | IRQ_HPD_REPLUG_STATUS);
+
+	return IRQ_HANDLED;
+}
+
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -1881,6 +1975,16 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return dev_err_probe(dev, PTR_ERR(pdata->refclk),
 				     "failed to get reference clock\n");
 
+	if (client->irq > 0) {
+		ret = devm_request_threaded_irq(dev, client->irq, NULL,
+						ti_sn65dsi86_irq_handler,
+						IRQF_ONESHOT, "sn65dsi86-irq",
+						pdata);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to register DP interrupt\n");
+	}
+
 	pm_runtime_enable(dev);
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
 	if (ret)
@@ -1888,6 +1992,9 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
 	pm_runtime_use_autosuspend(pdata->dev);
 
+	/* Enable interrupt handling */
+	regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);
+
 	ti_sn65dsi86_debugfs_init(pdata);
 
 	/*
-- 
2.32.0

