Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE865ECFA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4194510E72C;
	Thu,  5 Jan 2023 13:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB2110E72C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:26:03 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so2002529pjj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fc4dD/OSI6AqbJN6YW1eI7+8gfamDs+/wg3E3xEDFpk=;
 b=ilDKqTMCwbDsM/lv+BsibAMEc7MfUxkjTAzYnzjGW2+rIv6FFQbbaXmBYJ7Eo/oa7s
 SyrbqLiZMOSyHLmInSxl0JwTdGvvxkuYV1siaWprQ9kU5KaeOfNdlwrir300ixSDzssE
 alY0xIq2WeyEPVosjG2SfMIOr9zkKgCD3UHwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fc4dD/OSI6AqbJN6YW1eI7+8gfamDs+/wg3E3xEDFpk=;
 b=wYiP5nxfcZKzBMmK6bhFRbCx3PybNpqjpBnQRH6c31StdLI6TLKQaBUweqVOKktsjV
 VlbbJ8bhtEe3DHjPUq0RDKcEHkPBEceVw8VAvrDw8cSTbgtIjnyfSvizikAPCs2iE0+4
 nqJ5jn9SKd6zWKz5mhTEGYb8rTSt+yDBxg3+poaWY+bzKwJ681CC+rl0nkGyMuiOW9ZY
 BGosgWBxgoUUFU3y7Tn1vakR32qEMOfGti4T+xWCQaDyM0iI6hGYyQcNMp7njMwzNF7G
 4WKwKYFPFXl/25id+4jlfrrYoXsSstMrH8kpqVWjFFpqaqdQOl4o2sdW810YDRqLwy26
 QGLQ==
X-Gm-Message-State: AFqh2koBLRd7dhNwxwC69JRHyzZc5ty9W0AThQzDNWpoeDt1P6Py81kd
 5zZhfuA7YbZ7MoxS7qelW5scZg==
X-Google-Smtp-Source: AMrXdXuqaC7MI7vTBvMovZr57wepZh7B/ugct7iXMnFx/sRimRJd0yTpskFUwNzpcePam0sInKQhyw==
X-Received: by 2002:a17:90b:a15:b0:226:23c7:bb39 with SMTP id
 gg21-20020a17090b0a1500b0022623c7bb39mr27981382pjb.44.1672925162905; 
 Thu, 05 Jan 2023 05:26:02 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:7a61:eb85:2e3:2bd0])
 by smtp.gmail.com with ESMTPSA id
 gk22-20020a17090b119600b00225e670e4c7sm1372682pjb.35.2023.01.05.05.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:26:02 -0800 (PST)
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
Subject: [PATCH v7 9/9] drm/bridge: it6505: Register Type C mode switches
Date: Thu,  5 Jan 2023 21:24:57 +0800
Message-Id: <20230105132457.4125372-10-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230105132457.4125372-1-treapking@chromium.org>
References: <20230105132457.4125372-1-treapking@chromium.org>
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
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Pin-yen Lin <treapking@chromium.org>,
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Xin Ji <xji@analogixsemi.com>,
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

 drivers/gpu/drm/bridge/Kconfig      |   1 +
 drivers/gpu/drm/bridge/ite-it6505.c | 119 +++++++++++++++++++++++++++-
 2 files changed, 116 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 737578dd57ed..33803f581562 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -87,6 +87,7 @@ config DRM_FSL_LDB
 config DRM_ITE_IT6505
 	tristate "ITE IT6505 DisplayPort bridge"
 	depends on OF
+	depends on TYPEC || TYPEC=n
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 9cda2df21b88..d9be09e889e2 100644
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
 
@@ -455,6 +458,7 @@ struct it6505 {
 	struct delayed_work delayed_audio;
 	struct it6505_audio_data audio;
 	struct dentry *debugfs;
+	struct drm_dp_typec_switch_desc switch_desc;
 
 	/* it6505 driver hold option */
 	bool enable_drv_hold;
@@ -3346,12 +3350,105 @@ static void it6505_shutdown(struct i2c_client *client)
 		it6505_lane_off(it6505);
 }
 
+static void it6505_typec_ports_update(struct it6505 *it6505)
+{
+	struct drm_dp_typec_switch_desc switch_desc = it6505->switch_desc;
+
+	/* Check if both ports available and do nothing to retain the current one */
+	if (switch_desc.typec_ports[0].dp_connected && switch_desc.typec_ports[1].dp_connected)
+		return;
+
+	if (switch_desc.typec_ports[0].dp_connected)
+		it6505->lane_swap = false;
+	else if (switch_desc.typec_ports[1].dp_connected)
+		it6505->lane_swap = true;
+}
+
+static int it6505_typec_mux_set(struct typec_mux_dev *mux,
+				struct typec_mux_state *state)
+{
+	struct drm_dp_typec_port_data *port_data = typec_mux_get_drvdata(mux);
+	struct it6505 *it6505 = (struct it6505 *) port_data->data;
+	struct device *dev = &it6505->client->dev;
+	struct drm_dp_typec_switch_desc switch_desc = it6505->switch_desc;
+	bool old_dp_connected, new_dp_connected;
+
+	if (switch_desc.num_typec_switches == 1)
+		return 0;
+
+	mutex_lock(&it6505->extcon_lock);
+
+	old_dp_connected = switch_desc.typec_ports[0].dp_connected ||
+			   switch_desc.typec_ports[1].dp_connected;
+
+	port_data->dp_connected = state->alt &&
+				  state->alt->svid == USB_TYPEC_DP_SID &&
+				  state->alt->mode == USB_TYPEC_DP_MODE;
+
+	dev_dbg(dev, "mux_set dp_connected: c0=%d, c1=%d\n",
+		switch_desc.typec_ports[0].dp_connected, switch_desc.typec_ports[1].dp_connected);
+
+	new_dp_connected = switch_desc.typec_ports[0].dp_connected ||
+			   switch_desc.typec_ports[1].dp_connected;
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
+	struct device_node *port = of_graph_get_port_by_id(dev->of_node, 1);
+
+	return drm_dp_register_typec_switches(dev, port, &it6505->switch_desc,
+					      it6505, it6505_typec_mux_set);
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
@@ -3371,11 +3468,24 @@ static int it6505_i2c_probe(struct i2c_client *client)
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
@@ -3447,6 +3557,7 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	it6505_debugfs_remove(it6505);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
+	it6505_unregister_typec_switches(it6505);
 }
 
 static const struct i2c_device_id it6505_id[] = {
-- 
2.39.0.314.g84b9a713c41-goog

