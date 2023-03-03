Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D36896A998F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D040C10E633;
	Fri,  3 Mar 2023 14:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A366910E633
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:34:54 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id d6so1607453pgu.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1677854094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPL2+zSIzGnmzuGL+a+TZPsqXdjGLShAt0xzg7pCIEg=;
 b=EqQBtN8xHKuNUzamBMd9E71j3UqrKm4Hj6s+ZqKdRJvYLeGfIkwvAOuQqgCl0+ezy9
 Ms+nbToCmblm4MRf70Xsde5oW61oh9RbgedeXuyrhBkGztLO+C7YL0QVuTAPzYqxO4J0
 QcBVxwR2RRlo1RXHMqhcaq2FuxYhdNbD74EwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677854094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPL2+zSIzGnmzuGL+a+TZPsqXdjGLShAt0xzg7pCIEg=;
 b=JzR9ENuQVTBXmjp0NO8ktftTGSSoT8zrDAMpZsBS4EC7aHS0R5H3KwC2nxdQBE+IBp
 96BwV7I4lhu4Kupdbz+t8oyTUXl4zIk7S87wdmQYUjDLjzgubXXGmpZOwjqTxHU1S2XD
 O9WEu97a/W7NHhZ5aXx5tn5XO5QrjorapJ4eYtviHMkuQvcRcWIi4vb/AxU5jiRkY4/T
 j+AXUf+Kp4nWJTTM3ZCR6KdZcofgVvE6gsdTnNiMCcMnFvHApQ6nTNH1P6FmmJ9yuB3Q
 CZ5NV6B1zXcGThjxrNU/ubT+V74mQjY+mqqSMXNN2UoVRn4R5leyG2n96gZZRUHzxHxD
 QwKA==
X-Gm-Message-State: AO0yUKUGXnk79bJDHUbbHue/4T2Aa1/079ELMiMQKn09rNd0LKp4Ffy6
 p6M5W3ntBmpP84i7Xz7EyRjV3Q==
X-Google-Smtp-Source: AK7set+TQ6Td6PWoRYN3CIERlO3Uen34twSnUZXogacQoYBKAzK0sDzpOR8BgsRbrYMrOxKrmlJRYg==
X-Received: by 2002:a62:1a17:0:b0:5d6:4847:1bd4 with SMTP id
 a23-20020a621a17000000b005d648471bd4mr1960953pfa.20.1677854094324; 
 Fri, 03 Mar 2023 06:34:54 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:55e5:8423:31ee:83dd])
 by smtp.gmail.com with ESMTPSA id
 c18-20020aa781d2000000b005a8b4dcd21asm1767214pfn.15.2023.03.03.06.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:34:54 -0800 (PST)
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
Subject: [PATCH v13 10/10] drm/bridge: it6505: Register Type C mode switches
Date: Fri,  3 Mar 2023 22:33:50 +0800
Message-Id: <20230303143350.815623-11-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230303143350.815623-1-treapking@chromium.org>
References: <20230303143350.815623-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
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

Changes in v13:
- Fix style issues

Changes in v12:
- Fixes style issues in it6505 driver
- Replaced &it6505->client->dev with it6505->dev
- Updated the error logs when parsing data-lanes property

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

 drivers/gpu/drm/bridge/ite-it6505.c | 185 +++++++++++++++++++++++++++-
 1 file changed, 181 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index d4bc388b68ac..988fe28619ab 100644
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
@@ -27,6 +29,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -401,6 +404,11 @@ struct debugfs_entries {
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
@@ -454,6 +462,9 @@ struct it6505 {
 	struct delayed_work delayed_audio;
 	struct it6505_audio_data audio;
 	struct dentry *debugfs;
+	struct completion mux_register;
+	struct drm_dp_typec_switch_desc switch_desc;
+	struct it6505_typec_port_data *port_data;
 
 	/* it6505 driver hold option */
 	bool enable_drv_hold;
@@ -3345,12 +3356,163 @@ static void it6505_shutdown(struct i2c_client *client)
 		it6505_lane_off(it6505);
 }
 
+static void it6505_typec_ports_update(struct it6505 *it6505)
+{
+	unsigned int i;
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
+	struct it6505 *it6505 = port->data;
+	struct device *dev = it6505->dev;
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
+		state->alt &&
+		state->alt->svid == USB_TYPEC_DP_SID &&
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
+	it6505->port_data = devm_kcalloc(dev, switch_desc->num_typec_switches,
+					 sizeof(struct it6505_typec_port_data),
+					 GFP_KERNEL);
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
+		ret = fwnode_property_count_u32(fwnode, "data-lanes");
+		if (ret < 0) {
+			dev_err(dev,
+				"Error on getting data lanes count from %pfwP: %d\n",
+				fwnode, ret);
+			goto unregister_mux;
+		}
+		if (ret > 2) {
+			dev_err(dev,
+				"Invalid data lanes count for mode switches from %pfwP: %d\n",
+				fwnode, ret);
+			ret = -EINVAL;
+			goto unregister_mux;
+		}
+		num_lanes = ret;
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
@@ -3370,11 +3532,25 @@ static int it6505_i2c_probe(struct i2c_client *client)
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
@@ -3446,6 +3622,7 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	it6505_debugfs_remove(it6505);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
+	it6505_unregister_typec_switches(it6505);
 }
 
 static const struct i2c_device_id it6505_id[] = {
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

