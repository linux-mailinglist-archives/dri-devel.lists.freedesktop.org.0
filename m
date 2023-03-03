Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D0E6A997B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E351A10E620;
	Fri,  3 Mar 2023 14:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA7910E620
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:34:17 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 x20-20020a17090a8a9400b00233ba727724so5744630pjn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1677854057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAe1qBjWtdED9AstXrt9rv3n4n6WXsj4dKOkEJMZEYk=;
 b=BcMXu/PzVPLm7t9ercrELihthPFjuDJ7bqkzgcAMc84wyKJWRHCw6cLYfmadop3imw
 gMolLKY7rV7MrHF2xTSzgLQPP5M1PiBbr3Nikel8CUsnn5sAVB4YijvpZNFfL/QSKBAJ
 K6qkOUCKdHwNvJGelP3mAJl28Re7jkJ6/0Cb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677854057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AAe1qBjWtdED9AstXrt9rv3n4n6WXsj4dKOkEJMZEYk=;
 b=KMY8N5Q7WOilSluCYO+Dl6N3d0YtJQ694IP/lGX+mxH7H6sXh3SoJqBUcMEVODbQtq
 YUoUyRw7ipziIaUzJJIKLdU/gQ3wV1ZGnQbnualQpUMjbqtocAaPs2m2NPU+qmIjQh+p
 EObcM0NmgV8XOrZCgGNR8G6O/AScEif/GEnO2aCFFeGy/0r1vo4ny1ZdpoTepaSsp2Ye
 AU67Z4u0zmNoxZ4k/vDo8yZPw0h9Wj2ZRtOOtkusCPCq/N/geBiUe08MEbS2k/aRs8rE
 Ug1HSZtrvdNezzK5nxTcDET7dHSMT2whKl8dTF0JtFDufAvVpd+Dt1jzemtD7sHSAmPn
 HbGg==
X-Gm-Message-State: AO0yUKWHCnYvZbKRW1qT1gzcyYgddL016ESySkR28egck9EyMs8wV1i2
 3MIGRlQvv8/onaVDKgXligiygg==
X-Google-Smtp-Source: AK7set+651dq/DtmSSdzZ+LNxna1IkAVHhBLtFi25i3gdC22UNoityhet+tKs2JR4bnIyIyjcEkiZg==
X-Received: by 2002:a05:6a20:748b:b0:cd:83b1:4236 with SMTP id
 p11-20020a056a20748b00b000cd83b14236mr2145117pzd.36.1677854056777; 
 Fri, 03 Mar 2023 06:34:16 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:55e5:8423:31ee:83dd])
 by smtp.gmail.com with ESMTPSA id
 c18-20020aa781d2000000b005a8b4dcd21asm1767214pfn.15.2023.03.03.06.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:34:16 -0800 (PST)
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
Subject: [PATCH v13 03/10] drm/display: Add Type-C switch helpers
Date: Fri,  3 Mar 2023 22:33:43 +0800
Message-Id: <20230303143350.815623-4-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
In-Reply-To: <20230303143350.815623-1-treapking@chromium.org>
References: <20230303143350.815623-1-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Douglas Anderson <dianders@chromium.org>, linux-acpi@vger.kernel.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, Allen Chen <allen.chen@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Pin-yen Lin <treapking@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Alex Deucher <alexander.deucher@amd.com>,
 Stephen Boyd <swboyd@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helpers to register and unregister Type-C "switches" for bridges
capable of switching their output between two downstream devices.

The helper registers USB Type-C mode switches when the "mode-switch"
and the "reg" properties are available in Device Tree.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v13:
- Add typec_mode_switch_node_count helper
- Fix style issues

Changes in v12:
- Add fwnode_for_each_typec_mode_switch macro
- Remove a duplicated dmesg in the helper
- Used IS_REACHABLE instead to guard the function signatures

Changes in v11:
- Use fwnode helpers instead of DT
- Moved the helpers to a new file
- Use "reg" instead of "data-lanes" to determine the port number
- Dropped collected tags due to new changes

Changes in v10:
- Collected Reviewed-by and Tested-by tags
- Replaced "void *" with "typec_mux_set_fn_t" for mux_set callbacks
- Print out the node name when errors on parsing DT
- Use dev_dbg instead of dev_warn when no Type-C switch nodes available
- Made the return path of drm_dp_register_mode_switch clearer

Changes in v8:
- Fixed the build issue when CONFIG_TYPEC=m
- Fixed some style issues

Changes in v7:
- Extracted the common codes to a helper function
- New in v7

 drivers/gpu/drm/display/Makefile              |   1 +
 drivers/gpu/drm/display/drm_dp_typec_helper.c | 105 ++++++++++++++++++
 include/drm/display/drm_dp_helper.h           |  46 ++++++++
 3 files changed, 152 insertions(+)
 create mode 100644 drivers/gpu/drm/display/drm_dp_typec_helper.c

diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 17ac4a1006a8..ef80b9fde615 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -14,5 +14,6 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
 	drm_scdc_helper.o
 drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
+drm_display_helper-$(CONFIG_TYPEC) += drm_dp_typec_helper.o
 
 obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
diff --git a/drivers/gpu/drm/display/drm_dp_typec_helper.c b/drivers/gpu/drm/display/drm_dp_typec_helper.c
new file mode 100644
index 000000000000..0c705a4bca24
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_dp_typec_helper.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/usb/typec_mux.h>
+#include <drm/display/drm_dp_helper.h>
+
+static int drm_dp_register_mode_switch(struct device *dev,
+				       struct fwnode_handle *fwnode,
+				       struct drm_dp_typec_switch_desc *switch_desc,
+				       void *data, typec_mux_set_fn_t mux_set)
+{
+	struct drm_dp_typec_port_data *port_data;
+	struct typec_mux_desc mux_desc = {};
+	char name[32];
+	u32 port_num;
+	int ret;
+
+	ret = fwnode_property_read_u32(fwnode, "reg", &port_num);
+	if (ret) {
+		dev_err(dev, "Failed to read reg property: %d\n", ret);
+		return ret;
+	}
+
+	port_data = &switch_desc->typec_ports[port_num];
+	port_data->data = data;
+	port_data->port_num = port_num;
+	port_data->fwnode = fwnode;
+	mux_desc.fwnode = fwnode;
+	mux_desc.drvdata = port_data;
+	snprintf(name, sizeof(name), "%pfwP-%u", fwnode, port_num);
+	mux_desc.name = name;
+	mux_desc.set = mux_set;
+
+	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
+	if (IS_ERR(port_data->typec_mux)) {
+		ret = PTR_ERR(port_data->typec_mux);
+		dev_err(dev, "Mode switch register for port %d failed: %d\n",
+			port_num, ret);
+		return ret;
+	}
+
+	return 0;
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
+ * The port number is determined by the "reg" property of the endpoint.
+ */
+int drm_dp_register_typec_switches(struct device *dev, struct fwnode_handle *port,
+				   struct drm_dp_typec_switch_desc *switch_desc,
+				   void *data, typec_mux_set_fn_t mux_set)
+{
+	struct fwnode_handle *sw;
+	int ret;
+
+	switch_desc->num_typec_switches = typec_mode_switch_node_count(port);
+	if (!switch_desc->num_typec_switches) {
+		dev_dbg(dev, "No Type-C switches node found\n");
+		return 0;
+	}
+
+	switch_desc->typec_ports = devm_kcalloc(dev, switch_desc->num_typec_switches,
+						sizeof(struct drm_dp_typec_port_data),
+						GFP_KERNEL);
+	if (!switch_desc->typec_ports)
+		return -ENOMEM;
+
+	/* Register switches for each connector. */
+	for_each_typec_mode_switch_node(port, sw) {
+		ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
+		if (ret)
+			goto err_unregister_typec_switches;
+	}
+
+	return 0;
+
+err_unregister_typec_switches:
+	fwnode_handle_put(sw);
+	drm_dp_unregister_typec_switches(switch_desc);
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
+	unsigned int i;
+
+	for (i = 0; i < switch_desc->num_typec_switches; i++)
+		typec_mux_unregister(switch_desc->typec_ports[i].typec_mux);
+}
+EXPORT_SYMBOL(drm_dp_unregister_typec_switches);
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ab55453f2d2c..fb359b0cc8e8 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -25,6 +25,7 @@
 
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/usb/typec_mux.h>
 
 #include <drm/display/drm_dp.h>
 #include <drm/drm_connector.h>
@@ -763,4 +764,49 @@ bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8 dpcd[DP_RECEIVER_CAP_SIZ
 					       const u8 port_cap[4], u8 color_spc);
 int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_spc);
 
+struct drm_dp_typec_port_data {
+	struct typec_mux_dev *typec_mux;
+	int port_num;
+	struct fwnode_handle *fwnode;
+	void *data;
+};
+
+struct drm_dp_typec_switch_desc {
+	int num_typec_switches;
+	struct drm_dp_typec_port_data *typec_ports;
+};
+
+#define for_each_typec_mode_switch_node(port, sw)	\
+	fwnode_for_each_child_node((port), (sw))	\
+		for_each_if(fwnode_property_present((sw), "mode-switch"))
+
+static inline unsigned int typec_mode_switch_node_count(struct fwnode_handle *port)
+{
+	struct fwnode_handle *sw;
+	unsigned int count = 0;
+
+	for_each_typec_mode_switch_node(port, sw)
+		count++;
+
+	return count;
+}
+
+#if IS_REACHABLE(CONFIG_TYPEC)
+void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc);
+int drm_dp_register_typec_switches(struct device *dev, struct fwnode_handle *port,
+				   struct drm_dp_typec_switch_desc *switch_desc,
+				   void *data, typec_mux_set_fn_t mux_set);
+#else
+static inline void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
+{
+}
+static inline int drm_dp_register_typec_switches(
+		struct device *dev, struct fwnode_handle *port,
+		struct drm_dp_typec_switch_desc *switch_desc, void *data,
+		typec_mux_set_fn_t mux_set)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #endif /* _DRM_DP_HELPER_H_ */
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

