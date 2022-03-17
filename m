Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1FA4DC750
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 14:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A71610EBB3;
	Thu, 17 Mar 2022 13:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5022F10EBB1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 13:13:06 +0000 (UTC)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71208493;
 Thu, 17 Mar 2022 14:13:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1647522784;
 bh=Hi+FWC8Co0gEia7jaGPAW/1py87J1SaX5z05kXCvEG8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tJEckVUr+mtgVruuF3ttV9HtJ3SH+EsSBor0SUKGu3R0LljjoizgPsKyz6H3hDzo0
 P3an91bItsirgpAHppN+YSAuldkSxCHYEQNEglk97d7zeptsJMhyvLz/eYGLMvPrcs
 YzliFAldvxCtT3Wk91Yd7rW/lcVBCyewG8/8a6q8=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/3] drm/bridge: ti-sn65dsi86: Support hotplug detection
Date: Thu, 17 Mar 2022 13:12:50 +0000
Message-Id: <20220317131250.1481275-4-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220317131250.1481275-1-kieran.bingham+renesas@ideasonboard.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the SN65DSI86 is used in DisplayPort mode, its output is likely
routed to a DisplayPort connector, which can benefit from hotplug
detection. Support it in such cases, with both polling mode and IRQ
based detection.

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

Changes since v2: [Kieran]
 - Use unsigned int for values read by regmap
 - Update HPD support warning message
 - Only enable OP_HPD if IRQ support enabled.
 - Only register IRQ handler during ti_sn_bridge_probe()
 - Store IRQ in the struct ti_sn65dsi86
 - Register IRQ only when !no-hpd
 - Refactor DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_HPD handling

Since v3:
 - Fix commit message
 - Remove stray debug print
 - initialise val in case of regmap read error in ti_sn_bridge_detect
 - Ensure pm-runtime reference held for ti_sn_bridge_detect
 - Reset status immediately after reading to reduce risk of lost
   interrupts during ti_sn65dsi86_irq_handler()
 - Reset only the IRQ bits set during ti_sn65dsi86_irq_handler()
 - Enable / disable IRQ during hpd_{enable,disable}
   This ensures the handler completes before it is disabled.
 - Extra comments to detail the notification process in
   ti_sn65dsi86_irq_handler()
 - Move SN_IRQ_EN_REG handling to hpd_{enable,disable} calls.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 159 +++++++++++++++++++++++---
 1 file changed, 146 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 910bf3d41d2f..0cc0409dcdd4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -69,6 +69,7 @@
 #define  BPP_18_RGB				BIT(0)
 #define SN_HPD_DISABLE_REG			0x5C
 #define  HPD_DISABLE				BIT(0)
+#define  HPD_DEBOUNCED_STATE			BIT(4)
 #define SN_GPIO_IO_REG				0x5E
 #define  SN_GPIO_INPUT_SHIFT			4
 #define  SN_GPIO_OUTPUT_SHIFT			0
@@ -105,10 +106,24 @@
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
 
@@ -167,6 +182,12 @@
  * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
  * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
  * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
+ *
+ * @no_hpd:       Disable hot-plug detection as instructed by device tree (used
+ *                for instance for eDP panels whose HPD signal won't be asserted
+ *                until the panel is turned on, and is thus not usable for
+ *                downstream device detection).
+ * @irq:          IRQ number for the device.
  */
 struct ti_sn65dsi86 {
 	struct auxiliary_device		bridge_aux;
@@ -201,6 +222,9 @@ struct ti_sn65dsi86 {
 	atomic_t			pwm_pin_busy;
 #endif
 	unsigned int			pwm_refclk_freq;
+
+	bool				no_hpd;
+	int				irq;
 };
 
 static const struct regmap_range ti_sn65dsi86_volatile_ranges[] = {
@@ -315,23 +339,25 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
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
 
@@ -1134,6 +1160,46 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(pdata->dev);
 }
 
+static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int val = 0;
+
+	pm_runtime_get_sync(pdata->dev);
+	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
+	pm_runtime_put_autosuspend(pdata->dev);
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
+
+	enable_irq(pdata->irq);
+
+	regmap_write(pdata->regmap, SN_IRQ_EN_REG, IRQ_EN);
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
+	regmap_write(pdata->regmap, SN_IRQ_EN_REG, 0);
+
+	disable_irq(pdata->irq);
+
+	pm_runtime_put_autosuspend(pdata->dev);
+}
+
 static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
 					  struct drm_connector *connector)
 {
@@ -1147,6 +1213,9 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
 	.get_edid = ti_sn_bridge_get_edid,
+	.detect = ti_sn_bridge_detect,
+	.hpd_enable = ti_sn_bridge_hpd_enable,
+	.hpd_disable = ti_sn_bridge_hpd_disable,
 	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
 	.atomic_enable = ti_sn_bridge_atomic_enable,
 	.atomic_disable = ti_sn_bridge_atomic_disable,
@@ -1217,6 +1286,38 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn65dsi86 *pdata)
 	return 0;
 }
 
+static irqreturn_t ti_sn65dsi86_irq_handler(int irq, void *arg)
+{
+	struct ti_sn65dsi86 *pdata = arg;
+	int ret;
+	unsigned int hpd;
+
+	ret = regmap_read(pdata->regmap, SN_IRQ_HPD_STATUS_REG, &hpd);
+	if (ret || !hpd)
+		return IRQ_NONE;
+
+	/* reset the status register */
+	regmap_write(pdata->regmap, SN_IRQ_HPD_STATUS_REG, hpd);
+
+	/*
+	 * These notify calls will not reset the connector status themselves,
+	 * but request a call to ti_sn_bridge_detect() to confirm the status
+	 * if the notify status differs from the current state.
+	 */
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
+	return IRQ_HANDLED;
+}
+
 static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
@@ -1230,6 +1331,14 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 		return PTR_ERR(pdata->next_bridge);
 	}
 
+	pdata->no_hpd = of_property_read_bool(np, "no-hpd");
+	if (pdata->next_bridge->type != DRM_MODE_CONNECTOR_DisplayPort &&
+	    !pdata->no_hpd) {
+		dev_warn(pdata->dev,
+			 "HPD support only implemented for full DP connectors\n");
+		pdata->no_hpd = true;
+	}
+
 	ti_sn_bridge_parse_lanes(pdata, np);
 
 	ret = ti_sn_bridge_parse_dsi_host(pdata);
@@ -1241,9 +1350,32 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
-	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
+	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
 		pdata->bridge.ops = DRM_BRIDGE_OP_EDID;
 
+		if (!pdata->no_hpd)
+			pdata->bridge.ops |= DRM_BRIDGE_OP_DETECT;
+	}
+
+	if (!pdata->no_hpd && pdata->irq > 0) {
+		ret = devm_request_threaded_irq(pdata->dev, pdata->irq, NULL,
+						ti_sn65dsi86_irq_handler,
+						IRQF_ONESHOT, "sn65dsi86-irq",
+						pdata);
+		if (ret)
+			return dev_err_probe(pdata->dev, ret,
+					     "Failed to register DP interrupt\n");
+
+		/* Enable IRQ based HPD */
+		pdata->bridge.ops |= DRM_BRIDGE_OP_HPD;
+
+		/*
+		 * Keep the IRQ disabled initially. It will only be enabled when
+		 * requested through ti_sn_bridge_hpd_enable().
+		 */
+		disable_irq(pdata->irq);
+	}
+
 	drm_bridge_add(&pdata->bridge);
 
 	ret = ti_sn_attach_host(pdata);
@@ -1825,6 +1957,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return -ENOMEM;
 	dev_set_drvdata(dev, pdata);
 	pdata->dev = dev;
+	pdata->irq = client->irq;
 
 	mutex_init(&pdata->comms_mutex);
 
-- 
2.32.0

