Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDDF65ECEB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC35310E721;
	Thu,  5 Jan 2023 13:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEBC10E721
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:25:27 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id q64so1391490pjq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TxDVqo3j0Vfy19O732ATm6YrcmqibNv5A9jU3CRWw/I=;
 b=QDExGRPJYfDyLL5q0RGYHzoY/xBPJW807tYT1OC/k3YPOLecLMFfvRcyVW7yjaE341
 UnNj/IQzZBuH86w41NKrPSwrUIbNAWMRfb8vyTHiMDZLBgP+ZhNfRDjMqaZq/vMBw/d2
 gSu7jj2v/rMLADP8TePJ9VpOs8eSoyne80Bec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TxDVqo3j0Vfy19O732ATm6YrcmqibNv5A9jU3CRWw/I=;
 b=vJLvtaTIvW4ISLVaCfXa3t7AL6KUaaEh8m7LCGUYUn1Gf+Zso2RP8cjoR55NJOXeZT
 wdSX4uYj4KVgrfb0o67gUppDEGi+ABk3HSznt59smjzw2phQR1paQZw/AfRw/VOk9ZU5
 /+2xWPoFsHrPHsF/6lkySSFb8yllLoKz/JUYanTDBkHTwy0nmI0HSlcG0lsMyj/2OqVK
 qb9mj43h9YFhbCv5sLMOm8FA6HfKZPf+DuhvgIL+0TObtC552IH4XZs72FIxFsLgTJwL
 GPjGlzrDgODbh79mk0IryNSQNTtHoKfzwcI/k0TyMGdC1grKb8Wsj2C++8DuPQZZgOg/
 IIEQ==
X-Gm-Message-State: AFqh2kqTzfVKKcbNGI1uUV7UX6lcAU1BzRQqQDqW3aBIaLMPu0TECnX0
 3ylgktn6Z3dWSOS2Yt0K+8QcQw==
X-Google-Smtp-Source: AMrXdXvqjXgs4v7V1k44iz3YVnnhIfNxWUQBFT8yOU9ZQaxZFGWTLAnFYnIKY2N79BrTDimoBCX1Ig==
X-Received: by 2002:a17:90a:6e0b:b0:219:d72:2ea5 with SMTP id
 b11-20020a17090a6e0b00b002190d722ea5mr52493539pjk.2.1672925126818; 
 Thu, 05 Jan 2023 05:25:26 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:7a61:eb85:2e3:2bd0])
 by smtp.gmail.com with ESMTPSA id
 gk22-20020a17090b119600b00225e670e4c7sm1372682pjb.35.2023.01.05.05.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:25:26 -0800 (PST)
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
Subject: [PATCH v7 3/9] drm/display: Add Type-C switch helpers
Date: Thu,  5 Jan 2023 21:24:51 +0800
Message-Id: <20230105132457.4125372-4-treapking@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230105132457.4125372-1-treapking@chromium.org>
References: <20230105132457.4125372-1-treapking@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 shaomin Deng <dengshaomin@cdjrlc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helpers to register and unregister Type-C "switches" for bridges
capable of switching their output between two downstream devices.

The helper registers USB Type-C mode switches when the "mode-switch"
and the "data-lanes" properties are available in Device Tree.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v7:
- Extracted the common codes to a helper function
- New in v7

 drivers/gpu/drm/display/drm_dp_helper.c | 132 ++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  16 +++
 2 files changed, 148 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 16565a0a5da6..02a026f905ec 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -30,11 +30,13 @@
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <linux/string_helpers.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/dynamic_debug.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_panel.h>
@@ -3891,3 +3893,133 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
 EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
 
 #endif
+
+#if IS_ENABLED(CONFIG_TYPEC)
+static int drm_dp_register_mode_switch(struct device *dev, struct device_node *node,
+				       struct drm_dp_typec_switch_desc *switch_desc,
+				       void *data, void *mux_set)
+{
+	struct drm_dp_typec_port_data *port_data;
+	struct typec_mux_desc mux_desc = {};
+	char name[32];
+	u32 dp_lanes[2];
+	int ret, num_lanes, port_num = -1;
+
+	num_lanes = drm_of_get_data_lanes_count(node, 0, 2);
+	if (num_lanes <= 0) {
+		dev_err(dev, "Error on getting data lanes count: %d\n",
+			num_lanes);
+		return num_lanes;
+	}
+
+	ret = of_property_read_u32_array(node, "data-lanes", dp_lanes, num_lanes);
+	if (ret) {
+		dev_err(dev, "Failed to read the data-lanes variable: %d\n",
+			ret);
+		return ret;
+	}
+
+	port_num = dp_lanes[0] / 2;
+
+	port_data = &switch_desc->typec_ports[port_num];
+	port_data->data = data;
+	mux_desc.fwnode = &node->fwnode;
+	mux_desc.drvdata = port_data;
+	snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
+	mux_desc.name = name;
+	mux_desc.set = mux_set;
+
+	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(port_data->typec_mux)) {
+		ret = PTR_ERR(port_data->typec_mux);
+		dev_err(dev, "Mode switch register for port %d failed: %d\n",
+			port_num, ret);
+	}
+
+	return ret;
+}
+
+/**
+ * drm_dp_register_typec_switches() - register Type-C switches
+ * @dev: Device that registers Type-C switches
+ * @port: Device node for the switch
+ * @switch_desc: A Type-C switch descriptor
+ * @data: Private data for the switches
+ * @mux_set: Callback function for typec_mux_set
+ *
+ * This function registers USB Type-C switches for DP bridges that can switch
+ * the output signal between their output pins.
+ *
+ * Currently only mode switches are implemented, and the function assumes the
+ * given @port device node has endpoints with "mode-switch" property.
+ * Register the endpoint as port 0 if the "data-lanes" property falls in 0/1,
+ * and register it as port 1 if "data-lanes" falls in 2/3.
+ */
+int drm_dp_register_typec_switches(struct device *dev, struct device_node *port,
+				   struct drm_dp_typec_switch_desc *switch_desc,
+				   void *data, void *mux_set)
+{
+	struct device_node *sw;
+	int ret = 0;
+
+	for_each_child_of_node(port, sw) {
+		if (of_property_read_bool(sw, "mode-switch"))
+			switch_desc->num_typec_switches++;
+	}
+
+	if (!switch_desc->num_typec_switches) {
+		dev_warn(dev, "No Type-C switches node found\n");
+		return ret;
+	}
+
+	switch_desc->typec_ports = devm_kcalloc(
+		dev, switch_desc->num_typec_switches,
+		sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
+
+	if (!switch_desc->typec_ports)
+		return -ENOMEM;
+
+	/* Register switches for each connector. */
+	for_each_child_of_node(port, sw) {
+		if (!of_property_read_bool(sw, "mode-switch"))
+			continue;
+		ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
+		if (ret) {
+			dev_err(dev, "Failed to register mode switch: %d\n", ret);
+			of_node_put(sw);
+			break;
+		}
+	}
+
+	if (ret)
+		drm_dp_unregister_typec_switches(switch_desc);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_dp_register_typec_switches);
+
+/**
+ * drm_dp_unregister_typec_switches() - unregister Type-C switches
+ * @switch_desc: A Type-C switch descriptor
+ */
+void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
+{
+	int i;
+
+	for (i = 0; i < switch_desc->num_typec_switches; i++)
+		typec_mux_unregister(switch_desc->typec_ports[i].typec_mux);
+}
+EXPORT_SYMBOL(drm_dp_unregister_typec_switches);
+#else
+void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
+{
+}
+EXPORT_SYMBOL(drm_dp_register_typec_switches);
+int drm_dp_register_typec_switches(struct device *dev, struct device_node *port,
+				   struct drm_dp_typec_switch_desc *switch_desc,
+				   void *data, void *mux_set)
+{
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_unregister_typec_switches);
+#endif
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ab55453f2d2c..fef0a9a0d8ea 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -763,4 +763,20 @@ bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8 dpcd[DP_RECEIVER_CAP_SIZ
 					       const u8 port_cap[4], u8 color_spc);
 int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
 
+struct drm_dp_typec_port_data {
+	struct typec_mux_dev *typec_mux;
+	void *data;
+	bool dp_connected;
+};
+
+struct drm_dp_typec_switch_desc {
+	int num_typec_switches;
+	struct drm_dp_typec_port_data *typec_ports;
+};
+
+void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc);
+int drm_dp_register_typec_switches(struct device *dev, struct device_node *port,
+				   struct drm_dp_typec_switch_desc *switch_desc,
+				   void *data, void *mux_set);
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
2.39.0.314.g84b9a713c41-goog

