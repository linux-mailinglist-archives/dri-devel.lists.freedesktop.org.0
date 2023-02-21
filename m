Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE76169DD4A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 10:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F8E10E135;
	Tue, 21 Feb 2023 09:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1019D10E135
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 09:51:59 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 99so4252431pjz.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 01:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MI7fl4Cvu4w/OrrGgCoyznp7usRIq03eAmRQgjljPLs=;
 b=IsfW+Qt/D4OqN5Q4nsjXi6INiv+I+qW2EZUaARMF7peQj3EUC3CaAY+AQp5DvLNoBO
 /2Za+VeX7EG2jniGWvlh8hls4jtEMxlNDJL+X9iRmlMW6obnj+z+K66rXgeQHcGuYI0f
 5eGGf7DLLjwJ2OHrlPub8Ef1hRgsNhf+SQ/W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MI7fl4Cvu4w/OrrGgCoyznp7usRIq03eAmRQgjljPLs=;
 b=NmV5EEcQeggpz30t7xx0nm6fAoYOFMALUZYmJWOjSxukRn0koZUPIrtGmCDKqzfoE9
 GvnU1bhzroEw5XGfen5YmXNBbdM/BV5EWfs9Su2mwKJMMLLc5gU3sMJgwmNsGmNYqNQt
 NKxnyoCWEQ67Gwzi8thgVnwgbfB/pF2VtUPamGHs6rUv9+3M0xbeEwDVTXAxespY4XyK
 aWQdkgc7b6fQSx0mhJNKR1/bQLJhDE3Ocd3K+YyRQsthw4hypsFw1SOEy/lj6KaJ2HoM
 R9wSSHCtaQFydhvn+nvEmCxXq3BWT9HvVEUX59DLL2SYbMzdt87DFrSwG4WmvYrU4QSL
 NuwQ==
X-Gm-Message-State: AO0yUKVb0UTORZr++JSPb2O9r1eS9v0nhLHujkLrBGpsreIL/QDpmZDU
 WAJOc2gAZe0/U9kcqtpfc9meeA==
X-Google-Smtp-Source: AK7set/6uNCFKtuYFeMrmDTvzKg66fbj89ikJemVgOJquqfhQOJI7SWPdNQfmtW99vj9DCEXM4vX3w==
X-Received: by 2002:a05:6a20:7f8c:b0:cb:88c4:72c2 with SMTP id
 d12-20020a056a207f8c00b000cb88c472c2mr1051972pzj.17.1676973118638; 
 Tue, 21 Feb 2023 01:51:58 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:a1f5:f58d:584e:5906])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a656099000000b004eca54eab50sm3524918pgu.28.2023.02.21.01.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:51:58 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v12 07/10] drm/bridge: anx7625: Register Type C mode switches
Date: Tue, 21 Feb 2023 17:50:51 +0800
Message-Id: <20230221095054.1868277-8-treapking@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
In-Reply-To: <20230221095054.1868277-1-treapking@chromium.org>
References: <20230221095054.1868277-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, chrome-platform@lists.linux.dev,
 Allen Chen <allen.chen@ite.com.tw>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register USB Type-C mode switches when the "mode-switch" property and
relevant ports are available in Device Tree. Configure the crosspoint
switch based on the entered alternate mode for a specific Type-C
connector.

Crosspoint switch can also be used for switching the output signal for
different orientations of a single USB Type-C connector, but the
orientation switch is not implemented yet. A TODO is added for this.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v12:
- Fixed style issues in anx7625 driver
- Fixed the inverted orientation setting in anx7625 driver
- Changed "&ctx->client->dev" to "ctx->dev"
- Updated the error logs when parsing data-lanes property

Changes in v11:
- Added back "data-lanes" parsing logics
- Removed Kconfig dependency
- Updated the usage of the private data
- Dropped Tested-by tag because of the new changes

Changes in v10:
- Added a TODO for implementing orientation switch for anx7625
- Updated the commit message for the absence of orientation switch
- Fixed typo in the commit message
- Collected Tested-by tag

Changes in v7:
- Fixed style issues in anx7625 driver
- Removed DT property validation in anx7625 driver.
- Extracted common codes to another commit.

Changes in v6:
- Squashed to a single patch

 drivers/gpu/drm/bridge/analogix/anx7625.c | 148 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |  20 +++
 2 files changed, 168 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index cd628a2e2e50..62133aba0f8c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -15,6 +15,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/workqueue.h>
 
 #include <linux/of_gpio.h>
@@ -2571,6 +2573,145 @@ static void anx7625_runtime_disable(void *data)
 	pm_runtime_disable(data);
 }
 
+static void anx7625_set_crosspoint_switch(struct anx7625_data *ctx,
+					  enum typec_orientation orientation)
+{
+	if (orientation == TYPEC_ORIENTATION_NORMAL) {
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
+				  SW_SEL1_SSRX_RX1 | SW_SEL1_DPTX0_RX2);
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
+				  SW_SEL2_SSTX_TX1 | SW_SEL2_DPTX1_TX2);
+	} else if (orientation == TYPEC_ORIENTATION_REVERSE) {
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_0,
+				  SW_SEL1_SSRX_RX2 | SW_SEL1_DPTX0_RX1);
+		anx7625_reg_write(ctx, ctx->i2c.tcpc_client, TCPC_SWITCH_1,
+				  SW_SEL2_SSTX_TX2 | SW_SEL2_DPTX1_TX1);
+	}
+}
+
+static void anx7625_typec_two_ports_update(struct anx7625_data *ctx)
+{
+	int i;
+	/* Check if both ports available and do nothing to retain the current one */
+	if (ctx->port_data[0].dp_connected && ctx->port_data[1].dp_connected)
+		return;
+
+	for (i = 0; i < 2; i++) {
+		if (ctx->port_data[i].dp_connected)
+			anx7625_set_crosspoint_switch(ctx,
+						      ctx->port_data[i].orientation);
+	}
+}
+
+static int anx7625_typec_mux_set(struct typec_mux_dev *mux,
+				 struct typec_mux_state *state)
+{
+	struct drm_dp_typec_port_data *port = typec_mux_get_drvdata(mux);
+	struct anx7625_data *ctx = port->data;
+	struct device *dev = ctx->dev;
+	struct drm_dp_typec_switch_desc switch_desc = ctx->switch_desc;
+	bool new_dp_connected, old_dp_connected;
+
+	if (switch_desc.num_typec_switches == 1)
+		return 0;
+
+	wait_for_completion(&ctx->mux_register);
+
+	old_dp_connected = ctx->port_data[0].dp_connected ||
+			   ctx->port_data[1].dp_connected;
+
+	ctx->port_data[port->port_num].dp_connected =
+		state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
+		state->alt->mode == USB_TYPEC_DP_MODE;
+
+	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
+		ctx->port_data[0].dp_connected, ctx->port_data[1].dp_connected);
+
+	new_dp_connected = ctx->port_data[0].dp_connected ||
+			   ctx->port_data[1].dp_connected;
+
+	/* DP on, power on first */
+	if (!old_dp_connected && new_dp_connected)
+		pm_runtime_get_sync(dev);
+
+	anx7625_typec_two_ports_update(ctx);
+
+	/* DP off, power off last */
+	if (old_dp_connected && !new_dp_connected)
+		pm_runtime_put_sync(dev);
+
+	return 0;
+}
+
+static void anx7625_unregister_typec_switches(struct anx7625_data *ctx)
+{
+	drm_dp_unregister_typec_switches(&ctx->switch_desc);
+}
+
+static int anx7625_register_typec_switches(struct device *dev, struct anx7625_data *ctx)
+{
+	struct device_node *port_node = of_graph_get_port_by_id(dev->of_node, 1);
+	struct drm_dp_typec_switch_desc *switch_desc = &ctx->switch_desc;
+	int ret;
+	u32 dp_lanes[4];
+	unsigned int i, num_lanes;
+
+	/*
+	 * Currently, only mode switch is implemented.
+	 * TODO: Implement Type-C orientation switch for anx7625.
+	 */
+	ret = drm_dp_register_typec_switches(dev, &port_node->fwnode,
+					     &ctx->switch_desc, ctx,
+					     anx7625_typec_mux_set);
+	if (ret)
+		return ret;
+
+	ctx->port_data = devm_kcalloc(
+		dev, switch_desc->num_typec_switches,
+		sizeof(struct anx7625_typec_port_data), GFP_KERNEL);
+
+	if (!ctx->port_data) {
+		ret = -ENOMEM;
+		goto unregister_mux;
+	}
+
+	for (i = 0; i < switch_desc->num_typec_switches; i++) {
+		struct drm_dp_typec_port_data *port = &switch_desc->typec_ports[i];
+		struct fwnode_handle *fwnode = port->fwnode;
+
+		num_lanes = fwnode_property_count_u32(fwnode, "data-lanes");
+
+		if (num_lanes < 0) {
+			dev_err(dev,
+				"Error on getting data lanes count from %pfwP: %d\n",
+				fwnode, num_lanes);
+			ret = num_lanes;
+			goto unregister_mux;
+		}
+
+		ret = fwnode_property_read_u32_array(fwnode, "data-lanes",
+						     dp_lanes, num_lanes);
+		if (ret) {
+			dev_err(dev,
+				"Failed to read the data-lanes variable: %d\n",
+				ret);
+			goto unregister_mux;
+		}
+
+		ctx->port_data[i].orientation = (dp_lanes[0] / 2 == 0) ?
+			TYPEC_ORIENTATION_REVERSE : TYPEC_ORIENTATION_NORMAL;
+		ctx->port_data[i].dp_connected = false;
+	}
+	complete_all(&ctx->mux_register);
+
+	return 0;
+
+unregister_mux:
+	complete_all(&ctx->mux_register);
+	anx7625_unregister_typec_switches(ctx);
+	return ret;
+}
+
 static int anx7625_i2c_probe(struct i2c_client *client)
 {
 	struct anx7625_data *platform;
@@ -2608,6 +2749,7 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 
 	mutex_init(&platform->lock);
 	mutex_init(&platform->hdcp_wq_lock);
+	init_completion(&platform->mux_register);
 
 	INIT_DELAYED_WORK(&platform->hdcp_work, hdcp_check_work_func);
 	platform->hdcp_workqueue = create_workqueue("hdcp workqueue");
@@ -2678,6 +2820,10 @@ static int anx7625_i2c_probe(struct i2c_client *client)
 	if (platform->pdata.intp_irq)
 		queue_work(platform->workqueue, &platform->work);
 
+	ret = anx7625_register_typec_switches(dev, platform);
+	if (ret && ret != -ENODEV)
+		dev_warn(dev, "Didn't register Type-C switches, err: %d\n", ret);
+
 	platform->bridge.funcs = &anx7625_bridge_funcs;
 	platform->bridge.of_node = client->dev.of_node;
 	if (!anx7625_of_panel_on_aux_bus(&client->dev))
@@ -2729,6 +2875,8 @@ static void anx7625_i2c_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&platform->bridge);
 
+	anx7625_unregister_typec_switches(platform);
+
 	if (platform->pdata.intp_irq)
 		destroy_workqueue(platform->workqueue);
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 5af819611ebc..5a200da34800 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -55,6 +55,18 @@
 #define HPD_STATUS_CHANGE 0x80
 #define HPD_STATUS 0x80
 
+#define TCPC_SWITCH_0 0xB4
+#define SW_SEL1_DPTX0_RX2 BIT(0)
+#define SW_SEL1_DPTX0_RX1 BIT(1)
+#define SW_SEL1_SSRX_RX2 BIT(4)
+#define SW_SEL1_SSRX_RX1 BIT(5)
+
+#define TCPC_SWITCH_1 0xB5
+#define SW_SEL2_DPTX1_TX2 BIT(0)
+#define SW_SEL2_DPTX1_TX1 BIT(1)
+#define SW_SEL2_SSTX_TX2 BIT(4)
+#define SW_SEL2_SSTX_TX1 BIT(5)
+
 /******** END of I2C Address 0x58 ********/
 
 /***************************************************************/
@@ -449,6 +461,11 @@ struct anx7625_i2c_client {
 	struct i2c_client *tcpc_client;
 };
 
+struct anx7625_typec_port_data {
+	bool dp_connected;
+	enum typec_orientation orientation;
+};
+
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
 	struct platform_device *audio_pdev;
@@ -479,6 +496,9 @@ struct anx7625_data {
 	struct drm_connector *connector;
 	struct mipi_dsi_device *dsi;
 	struct drm_dp_aux aux;
+	struct completion mux_register;
+	struct drm_dp_typec_switch_desc switch_desc;
+	struct anx7625_typec_port_data *port_data;
 };
 
 #endif  /* __ANX7625_H__ */
-- 
2.39.2.637.g21b0678d19-goog

