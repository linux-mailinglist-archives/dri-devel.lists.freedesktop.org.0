Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164992B010E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 09:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656C46E1A8;
	Thu, 12 Nov 2020 08:16:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A263B6E134
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 06:41:43 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t18so2295617plo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 22:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cRBmLI6FMajTvMm2Htv9opYdYie4XEp5GifCJuoIgiA=;
 b=LKDBIu4sC3ynBG9hmtGI3W7nmsadRABYWGNKgoQzXJJAGqhadvqK6gGdQgecCfLh40
 1x//8mmpzNNimzTjno9DfWOOdpWW+l1/zlbiTVlWc42rIKMmqY9/4KmpkJbARf3wpIYp
 U5yU9J3IEHoRe4WMnWAIQcOaTCi3NqV+0Xn3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cRBmLI6FMajTvMm2Htv9opYdYie4XEp5GifCJuoIgiA=;
 b=WZNEAffNeanPiiLpHKcgQ9IpUwzBPanXu6m8aPWAEDfcGuzKax1UYyv1xkqCb4DrFF
 MmOM3B2kyk6pJAaxTf0KzZY4RHuD1VTCwF123Zytd4AuO3yrmwZnGyNoFKcbewPYPrQX
 JXhIumb9CdmIM9Fjr390Pv4UGe02tJ4gy+uHAfa0/Y2P9XKqWsj659IFrtybdeY8lKRd
 NqDEQyvPBHAc1HqLPDjWfuQxQA2ZnAEpFwSqt/N+A0/KKxqpS4wVuZT45P40nVzTncxY
 N9ZBon29lbm3zBHkefDjqmhRVDXIbw1dn6+QWzCDVXdbMGdyI2m4KKv4tf2u7LRjiGfJ
 s2iA==
X-Gm-Message-State: AOAM532Lbb8MoWV0GrsxK+kCn9vOtL305JflrrqKib1H/FGvl9bBK6GZ
 w6NZwGJER/osRmgnv4Iu0IOGHw==
X-Google-Smtp-Source: ABdhPJy6Nn0rYHKKBorKHtfGE5cTCrHt4//eCqrIWdt+3E09NzIwdlmxPL0q5iosvwmgdLeyh4yiPA==
X-Received: by 2002:a17:902:7c86:b029:d5:f680:f756 with SMTP id
 y6-20020a1709027c86b02900d5f680f756mr14450696pll.39.1605163303208; 
 Wed, 11 Nov 2020 22:41:43 -0800 (PST)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id w22sm4832251pge.25.2020.11.11.22.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 22:41:42 -0800 (PST)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH] drm/bridge: anx7625: Add anx7625 port switching.
Date: Thu, 12 Nov 2020 14:40:40 +0800
Message-Id: <20201112064051.3716968-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Nov 2020 08:15:51 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Prashant Malani <pmalani@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When output 2 lanes DP data, anx7625 can output to either TX1/RX1 or
TX2/RX2. In typical usage, these two TX/RX pairs corresponds to two
orientations of typec.

On some board one anx7625 is used as DPI to DP converter for two typec
ports. In this case, the TX1/RX1 and TX2/RX2 are connected to two usb
muxes, which mux the DP data with the rest of the USB3 data, and
connects to the two typec ports.

This patch adds option for anx7625 to acts as a usb typec switch and
switch output lanes based on the typec orientation, or acts as two usb
typec mux and switch output lanes depending on whether the two ports
currently has DP enabled.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

====================================================================

This is an attempt to use typec framework with how we're using anx7625
on Chrome OS asurada board.

An example of the dts for the two ports case can be found at
https://crrev.com/c/2507199/6

Sending this as a RFC patch since I'm not sure about the best approach
here. Should the logic of switching output lanes depends on ports be
coupled inside anx7625 driver, or in another driver, or is there
any existing way to accomplish this?

---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 135 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |  24 ++++
 2 files changed, 159 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 65cc05982f82..75f35a197196 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -13,6 +13,9 @@
 #include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/workqueue.h>
 
 #include <linux/of_gpio.h>
@@ -1224,6 +1227,122 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
+					  enum typec_orientation orientation)
+{
+	if (orientation == TYPEC_ORIENTATION_NORMAL) {
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
+				  SW_SEL1_SSRX_B10_B11 | SW_SEL1_ML0_A10_A11);
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
+				  SW_SEL2_SSTX_A2_A3 | SW_SEL2_ML1_B2_B3);
+	} else if (orientation == TYPEC_ORIENTATION_REVERSE) {
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
+				  SW_SEL1_SSRX_A10_A11 | SW_SEL1_ML0_B10_B11);
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
+				  SW_SEL2_SSTX_B2_B3 | SW_SEL2_ML1_A2_A3);
+	}
+}
+
+static int anx7625_usb_set_orientation(struct typec_switch *sw,
+				       enum typec_orientation orientation)
+{
+	struct anx7625_data *ctx = typec_switch_get_drvdata(sw);
+
+	anx7625_set_crosspoint_switch(ctx, orientation);
+	return 0;
+}
+
+static int anx7625_register_usb(struct device *device,
+				struct anx7625_data *ctx)
+{
+	struct typec_switch_desc sw_desc = { };
+	struct fwnode_handle *fwnode = of_fwnode_handle(device->of_node);
+
+	sw_desc.fwnode = fwnode;
+	sw_desc.drvdata = ctx;
+	sw_desc.name = fwnode_get_name(fwnode);
+	sw_desc.set = anx7625_usb_set_orientation;
+
+	ctx->typec_sw = typec_switch_register(device, &sw_desc);
+	if (IS_ERR(ctx->typec_sw))
+		return PTR_ERR(ctx->typec_sw);
+
+	return 0;
+}
+
+static void anx7625_usb_two_ports_update(struct anx7625_data *ctx)
+{
+	if (ctx->typec_ports[0].has_dp && ctx->typec_ports[1].has_dp)
+		// Both ports available, do nothing to retain the current one.
+		return;
+	else if (ctx->typec_ports[0].has_dp)
+		anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_NORMAL);
+	else if (ctx->typec_ports[1].has_dp)
+		anx7625_set_crosspoint_switch(ctx, TYPEC_ORIENTATION_REVERSE);
+}
+
+static int anx7625_usb_mux_set(struct typec_mux *mux,
+			       struct typec_mux_state *state)
+{
+	struct anx7625_port_data *data = typec_mux_get_drvdata(mux);
+
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
+	    state->alt->mode == USB_TYPEC_DP_MODE)
+		data->has_dp = true;
+	else
+		data->has_dp = false;
+
+	anx7625_usb_two_ports_update(data->ctx);
+	return 0;
+}
+
+static int anx7625_register_usb_two_ports(struct device *device,
+					  struct anx7625_data *ctx)
+{
+	struct typec_mux_desc mux_desc = { };
+	struct fwnode_handle *fwnode;
+	struct anx7625_port_data *port_data;
+	u32 port_num;
+	int ret;
+
+	device_for_each_child_node(device, fwnode) {
+		if (fwnode_property_read_u32(fwnode, "reg", &port_num))
+			continue;
+
+		if (port_num >= 2) {
+			DRM_DEV_ERROR(device, "reg too large for ports.");
+			continue;
+		}
+
+		port_data = &ctx->typec_ports[port_num];
+
+		port_data->ctx = ctx;
+		mux_desc.fwnode = fwnode;
+		mux_desc.drvdata = port_data;
+		mux_desc.name = fwnode_get_name(fwnode);
+		mux_desc.set = anx7625_usb_mux_set;
+
+		port_data->typec_mux =
+			typec_mux_register(device, &mux_desc);
+		if (IS_ERR(port_data->typec_mux)) {
+			ret = PTR_ERR(port_data->typec_mux);
+			DRM_DEV_ERROR(device,
+				      "mux register for port %d failed: %d",
+				      port_num, ret);
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	for (port_num = 0; port_num < 2; port_num++) {
+		typec_mux_unregister(ctx->typec_ports[port_num].typec_mux);
+		ctx->typec_ports[port_num].typec_mux = NULL;
+	}
+	return ret;
+}
+
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
@@ -1239,6 +1358,9 @@ static int anx7625_parse_dt(struct device *dev,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
 
+	pdata->tx_rx_to_two_ports =
+		of_property_read_bool(dev->of_node, "anx,tx-rx-to-two-ports");
+
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret < 0) {
 		if (ret == -ENODEV)
@@ -1784,6 +1906,11 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (platform->pdata.intp_irq)
 		queue_work(platform->workqueue, &platform->work);
 
+	if (platform->pdata.tx_rx_to_two_ports)
+		anx7625_register_usb_two_ports(dev, platform);
+	else
+		anx7625_register_usb(dev, platform);
+
 	platform->bridge.funcs = &anx7625_bridge_funcs;
 	platform->bridge.of_node = client->dev.of_node;
 	platform->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
@@ -1807,9 +1934,17 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 static int anx7625_i2c_remove(struct i2c_client *client)
 {
 	struct anx7625_data *platform = i2c_get_clientdata(client);
+	int i;
 
 	drm_bridge_remove(&platform->bridge);
 
+	if (platform->pdata.tx_rx_to_two_ports)
+		for (i = 0; i < 2; i++)
+			typec_mux_unregister(
+				platform->typec_ports[i].typec_mux);
+	else
+		typec_switch_unregister(platform->typec_sw);
+
 	if (platform->pdata.intp_irq)
 		destroy_workqueue(platform->workqueue);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 193ad86c5450..bf546f3a4c06 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -55,6 +55,18 @@
 #define HPD_STATUS_CHANGE 0x80
 #define HPD_STATUS 0x80
 
+#define TCPC_SWITCH_0 0xB4
+#define SW_SEL1_ML0_A10_A11 BIT(0)
+#define SW_SEL1_ML0_B10_B11 BIT(1)
+#define SW_SEL1_SSRX_A10_A11 BIT(4)
+#define SW_SEL1_SSRX_B10_B11 BIT(5)
+
+#define TCPC_SWITCH_1 0xB5
+#define SW_SEL2_ML1_B2_B3 BIT(0)
+#define SW_SEL2_ML1_A2_A3 BIT(1)
+#define SW_SEL2_SSTX_B2_B3 BIT(4)
+#define SW_SEL2_SSTX_A2_A3 BIT(5)
+
 /******** END of I2C Address 0x58 ********/
 
 /***************************************************************/
@@ -354,6 +366,7 @@ struct anx7625_platform_data {
 	int intp_irq;
 	u32 low_power_mode;
 	struct device_node *mipi_host_node;
+	bool tx_rx_to_two_ports;
 };
 
 struct anx7625_i2c_client {
@@ -366,6 +379,14 @@ struct anx7625_i2c_client {
 	struct i2c_client *tcpc_client;
 };
 
+struct anx7625_data;
+
+struct anx7625_port_data {
+	bool has_dp;
+	struct typec_mux *typec_mux;
+	struct anx7625_data *ctx;
+};
+
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
 	atomic_t power_status;
@@ -385,6 +406,9 @@ struct anx7625_data {
 	struct drm_bridge bridge;
 	u8 bridge_attached;
 	struct mipi_dsi_device *dsi;
+
+	struct typec_switch *typec_sw;
+	struct anx7625_port_data typec_ports[2];
 };
 
 #endif  /* __ANX7625_H__ */

base-commit: 3e14f70c05cda4794901ed8f976de3a88deebcc0
-- 
2.29.2.299.gdc1121823c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
