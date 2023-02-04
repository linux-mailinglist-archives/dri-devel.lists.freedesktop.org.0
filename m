Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77A568AA1D
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 14:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9454510E20E;
	Sat,  4 Feb 2023 13:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D561110E20C
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Feb 2023 13:31:47 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id bd15so5537836pfb.8
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Feb 2023 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daGp5PoG0OrPfl60A6az47mpAJxpghRoHNP94dlB8eU=;
 b=L7dAfUNBrb1nRVOe/tgmzBeRDWXGSr9dg4Jb4hBT2EXsfRGOEzDIJAz9ADGKorArqM
 jH9X7fM/3wzCbcwwKKc0JDT+YDN6VUULeCr4Ui9tJUhNgyPEpqdRJsiqbU8bg6emCw6g
 x4WWCNGmVncvIbkeCLlsBNBaVHzXCdnh5F6/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=daGp5PoG0OrPfl60A6az47mpAJxpghRoHNP94dlB8eU=;
 b=CIpIqJBO35g6v5Ap9W8LS2d2xICF8D+WojP3ULcM2pLB7zpRzd76QoPQ9RwK55Mf1C
 XBXIFZByVBPMbSsg5Uul1XHXLVqbnk6f4MVselBHuUT7uxKDxELx57p1LBQkGugu1pGh
 9nlIK5OIv4iSnqi3vPQ0W4GQGFTzYI8HY0gS3KcWLtTrRRfNhe+nY8zd2xUC9h502dQq
 WtblKUDo/3Lip1twkzwCJMoNG86Zul74alY/ONOYNsq4g3W8yTDAbNq5gSLJtndVrrcM
 kyjgmlB7YIL7O6HWeimGIf2QdBvpsrxnhxJxSkxzHioTnN9WQlcVsuFSTgpvL/94sWxX
 apfA==
X-Gm-Message-State: AO0yUKXtqMa20dpY2xxytf4Slp/mUT3A1Mjlju6NV8qTwkpZk84yPsBA
 S/fpzyoc2HTN4GyKhAs6vqKOiA==
X-Google-Smtp-Source: AK7set/40ct+tyVMRwiWGG4iS8StGf6zvFVDZqXkxGxyiA7MdgelG9KQ4yQA25mKOo/brEg68xULxg==
X-Received: by 2002:a62:5254:0:b0:594:1f1c:3d2f with SMTP id
 g81-20020a625254000000b005941f1c3d2fmr6530068pfb.4.1675517507366; 
 Sat, 04 Feb 2023 05:31:47 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:c1ad:2bdc:7b5a:72e3])
 by smtp.gmail.com with ESMTPSA id
 144-20020a621596000000b00593ce7ebbaasm3655639pfv.184.2023.02.04.05.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 05:31:47 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
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
Subject: [PATCH v11 9/9] drm/bridge: it6505: Register Type C mode switches
Date: Sat,  4 Feb 2023 21:30:40 +0800
Message-Id: <20230204133040.1236799-10-treapking@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230204133040.1236799-1-treapking@chromium.org>
References: <20230204133040.1236799-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, linux-acpi@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, chrome-platform@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Register USB Type-C mode switches when the "mode-switch" property and
relevant port are available in Device Tree. Configure the "lane_swap"
state based on the entered alternate mode for a specific Type-C
connector, which ends up updating the lane swap registers of the it6505
chip.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v11:
- Added back "data-lanes" parsing logics
- Removed Kconfig dependency
- Updated the usage of the private data

Changes in v7:
- Fixed style issues in it6505 driver
- Removed the redundant sleep in it6505 driver
- Removed DT property validation in it6505 driver
- Rebased to drm-misc-next
- Extracted common codes to another commit

Changes in v6:
- Changed it6505_typec_mux_set callback function to accommodate with
  the latest drm-misc patches
- Changed the driver implementation to accommodate with the new binding
- Squashed to a single patch

 drivers/gpu/drm/bridge/ite-it6505.c | 179 +++++++++++++++++++++++++++-
 1 file changed, 175 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 9cda2df21b88..902f27875177 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -17,6 +17,8 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/wait.h>
 
 #include <crypto/hash.h>
@@ -28,6 +30,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -402,6 +405,11 @@ struct debugfs_entries {
 	const struct file_operations *fops;
 };
 
+struct it6505_typec_port_data {
+	bool dp_connected;
+	bool lane_swap;
+};
+
 struct it6505 {
 	struct drm_dp_aux aux;
 	struct drm_bridge bridge;
@@ -455,6 +463,9 @@ struct it6505 {
 	struct delayed_work delayed_audio;
 	struct it6505_audio_data audio;
 	struct dentry *debugfs;
+	struct completion mux_register;
+	struct drm_dp_typec_switch_desc switch_desc;
+	struct it6505_typec_port_data *port_data;
 
 	/* it6505 driver hold option */
 	bool enable_drv_hold;
@@ -3346,12 +3357,157 @@ static void it6505_shutdown(struct i2c_client *client)
 		it6505_lane_off(it6505);
 }
 
+static void it6505_typec_ports_update(struct it6505 *it6505)
+{
+	int i;
+
+	/* Check if both ports available and do nothing to retain the current one */
+	if (it6505->port_data[0].dp_connected && it6505->port_data[1].dp_connected)
+		return;
+
+	for (i = 0; i < 2; i++) {
+		if (it6505->port_data[i].dp_connected)
+			it6505->lane_swap = it6505->port_data[i].lane_swap;
+	}
+}
+
+static int it6505_typec_mux_set(struct typec_mux_dev *mux,
+				struct typec_mux_state *state)
+{
+	struct drm_dp_typec_port_data *port = typec_mux_get_drvdata(mux);
+	struct it6505 *it6505 = (struct it6505 *) port->data;
+	struct device *dev = &it6505->client->dev;
+	struct drm_dp_typec_switch_desc switch_desc = it6505->switch_desc;
+	bool old_dp_connected, new_dp_connected;
+
+	if (switch_desc.num_typec_switches == 1)
+		return 0;
+
+	mutex_lock(&it6505->extcon_lock);
+	wait_for_completion(&it6505->mux_register);
+
+	old_dp_connected = it6505->port_data[0].dp_connected ||
+			   it6505->port_data[1].dp_connected;
+
+	it6505->port_data[port->port_num].dp_connected =
+		state->alt && state->alt->svid == USB_TYPEC_DP_SID &&
+		state->alt->mode == USB_TYPEC_DP_MODE;
+
+	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
+		it6505->port_data[0].dp_connected, it6505->port_data[1].dp_connected);
+
+	new_dp_connected = it6505->port_data[0].dp_connected ||
+			   it6505->port_data[1].dp_connected;
+
+	if (it6505->enable_drv_hold) {
+		dev_dbg(dev, "enable driver hold\n");
+		goto unlock;
+	}
+
+	it6505_typec_ports_update(it6505);
+
+	if (!old_dp_connected && new_dp_connected) {
+		int ret = pm_runtime_get_sync(dev);
+
+		/*
+		 * pm_runtime_force_suspend() disables runtime PM when the
+		 * system enters suspend state. But on system resume, mux_set
+		 * can be triggered before pm_runtime_force_resume() re-enables
+		 * runtime PM. This makes the bridge stay powered off if the
+		 * downstream display is connected when the system is suspended.
+		 * Handling the error here to make sure the bridge is powered
+		 * on, and leave the PM runtime usage count incremented so
+		 * the future runtime PM calls is balanced.
+		 */
+		if (ret < 0)
+			it6505_poweron(it6505);
+
+		complete_all(&it6505->extcon_completion);
+	}
+
+	if (old_dp_connected && !new_dp_connected) {
+		reinit_completion(&it6505->extcon_completion);
+		pm_runtime_put_sync(dev);
+		if (it6505->bridge.dev)
+			drm_helper_hpd_irq_event(it6505->bridge.dev);
+		memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
+	}
+
+unlock:
+	mutex_unlock(&it6505->extcon_lock);
+	return 0;
+}
+
+static void it6505_unregister_typec_switches(struct it6505 *it6505)
+{
+	drm_dp_unregister_typec_switches(&it6505->switch_desc);
+}
+
+static int it6505_register_typec_switches(struct device *dev, struct it6505 *it6505)
+{
+	struct device_node *port_node = of_graph_get_port_by_id(dev->of_node, 1);
+	struct drm_dp_typec_switch_desc *switch_desc = &it6505->switch_desc;
+	int ret;
+	u32 dp_lanes[4];
+	unsigned int i, num_lanes;
+
+	ret = drm_dp_register_typec_switches(dev, &port_node->fwnode,
+					     &it6505->switch_desc, it6505,
+					     it6505_typec_mux_set);
+	if (ret)
+		return ret;
+
+	it6505->port_data = devm_kcalloc(
+		dev, switch_desc->num_typec_switches,
+		sizeof(struct it6505_typec_port_data), GFP_KERNEL);
+
+	if (!it6505->port_data) {
+		ret = -ENOMEM;
+		goto unregister_mux;
+	}
+
+	for (i = 0; i < switch_desc->num_typec_switches; i++) {
+		struct drm_dp_typec_port_data *port = &switch_desc->typec_ports[i];
+		struct fwnode_handle *fwnode = port->fwnode;
+
+		num_lanes = fwnode_property_read_u32_array(fwnode, "data-lanes",
+							   NULL, 0);
+
+		if (num_lanes <= 0 || num_lanes > 2) {
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
+		it6505->port_data[i].lane_swap = (dp_lanes[0] / 2 == 1);
+	}
+	complete_all(&it6505->mux_register);
+
+	return 0;
+
+unregister_mux:
+	complete_all(&it6505->mux_register);
+	it6505_unregister_typec_switches(it6505);
+	return ret;
+}
+
 static int it6505_i2c_probe(struct i2c_client *client)
 {
 	struct it6505 *it6505;
 	struct device *dev = &client->dev;
 	struct extcon_dev *extcon;
-	int err, intp_irq;
+	int err, intp_irq, ret;
 
 	it6505 = devm_kzalloc(&client->dev, sizeof(*it6505), GFP_KERNEL);
 	if (!it6505)
@@ -3371,11 +3527,25 @@ static int it6505_i2c_probe(struct i2c_client *client)
 	if (PTR_ERR(extcon) == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 	if (IS_ERR(extcon)) {
-		dev_err(dev, "can not get extcon device!");
-		return PTR_ERR(extcon);
+		if (PTR_ERR(extcon) != -ENODEV)
+			dev_warn(dev, "Cannot get extcon device: %ld\n",
+				 PTR_ERR(extcon));
+		it6505->extcon = NULL;
+	} else {
+		it6505->extcon = extcon;
 	}
 
-	it6505->extcon = extcon;
+	init_completion(&it6505->mux_register);
+	ret = it6505_register_typec_switches(dev, it6505);
+	if (ret) {
+		if (ret != -ENODEV)
+			dev_warn(dev, "Didn't register Type-C switches, err: %d\n",
+				 ret);
+		if (!it6505->extcon) {
+			dev_err(dev, "Both extcon and typec-switch are not registered.\n");
+			return -EINVAL;
+		}
+	}
 
 	it6505->regmap = devm_regmap_init_i2c(client, &it6505_regmap_config);
 	if (IS_ERR(it6505->regmap)) {
@@ -3447,6 +3617,7 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	it6505_debugfs_remove(it6505);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
+	it6505_unregister_typec_switches(it6505);
 }
 
 static const struct i2c_device_id it6505_id[] = {
-- 
2.39.1.519.gcb327c4b5f-goog

