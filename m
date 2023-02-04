Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B0D68AA0E
	for <lists+dri-devel@lfdr.de>; Sat,  4 Feb 2023 14:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843D410E0EA;
	Sat,  4 Feb 2023 13:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC8E10E0EA
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Feb 2023 13:31:09 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 5so1486824pgd.3
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Feb 2023 05:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDdE5NdckiHy7s3iR+29eACsJFzbSzvAEe6P9LTse94=;
 b=Hz0kyWgw+U+yiGOtooHjui9iU0tOd7FbPKhO3OLwtdfR05IN2otq+XuXU1Gxv/03rX
 Qc2lJpfUfuUzZHCPorxB/cAMMSmW5XrenDlrdhF7VZp0pbNj2a408FfH50BC4pXCFEfi
 Ef8CASHmgb7KUHf1sVK2C7PwWfUDf79sFjVYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FDdE5NdckiHy7s3iR+29eACsJFzbSzvAEe6P9LTse94=;
 b=GWnZNdzSE8JEMqtEOrTv0mE7Z8wZCM9ub2GCXg3x/bKCkC24aRaPIvEhtN/7/hGQ6F
 7XK1kxxS7vUewJQk6zwh3ByBR/iDuBPTuWxvDWfljz0qs1buYRicWGbusMS8mPJUXlnW
 k0FCSI4gHOl/SsiXq7CPI+vnvDaefKRNrL3QLwth5G/hiHfuJzrXGaSxY41Ya7aba9b8
 KPjRcmjEh0CvUK9JvVP/JAUWsOgSff6CyJSrBs6WCs0HPtI913mSIuZUpYtZniyCvo/J
 aqHLKclSei2vKScgZNuLkgdBb3jxr6bgTKOJarrUAH7x3HrAufOl/tQX22L8Horj3921
 FUPg==
X-Gm-Message-State: AO0yUKUshjeSs63IWxUkME0AmwrRinQUfCOGB1gzpXZEw5a++Jz2AcQs
 PDzx07LZb0NDEmIhCNC5JHkfOg==
X-Google-Smtp-Source: AK7set/ST5MLArUDet2tLQK9J0+VohaIXzVsS4E6jCWdVpVRrJ7e/uh76fYN2/hcEpb0onEGLzDJcA==
X-Received: by 2002:a62:388e:0:b0:590:6a57:9901 with SMTP id
 f136-20020a62388e000000b005906a579901mr11048988pfa.18.1675517469476; 
 Sat, 04 Feb 2023 05:31:09 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:c1ad:2bdc:7b5a:72e3])
 by smtp.gmail.com with ESMTPSA id
 144-20020a621596000000b00593ce7ebbaasm3655639pfv.184.2023.02.04.05.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 05:31:09 -0800 (PST)
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
Subject: [PATCH v11 3/9] drm/display: Add Type-C switch helpers
Date: Sat,  4 Feb 2023 21:30:34 +0800
Message-Id: <20230204133040.1236799-4-treapking@chromium.org>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230204133040.1236799-1-treapking@chromium.org>
References: <20230204133040.1236799-1-treapking@chromium.org>
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
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, linux-acpi@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helpers to register and unregister Type-C "switches" for bridges
capable of switching their output between two downstream devices.

The helper registers USB Type-C mode switches when the "mode-switch"
and the "reg" properties are available in Device Tree.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

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
 drivers/gpu/drm/display/drm_dp_typec_helper.c | 114 ++++++++++++++++++
 include/drm/display/drm_dp_helper.h           |  31 +++++
 3 files changed, 146 insertions(+)
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
index 000000000000..b11a268da57f
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_dp_typec_helper.c
@@ -0,0 +1,114 @@
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
+
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
+	fwnode_for_each_child_node(port, sw) {
+		if (fwnode_property_present(sw, "mode-switch"))
+			switch_desc->num_typec_switches++;
+	}
+
+	if (!switch_desc->num_typec_switches) {
+		dev_dbg(dev, "No Type-C switches node found\n");
+		return 0;
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
+	fwnode_for_each_child_node(port, sw) {
+		if (!fwnode_property_present(sw, "mode-switch"))
+			continue;
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
+	dev_err(dev, "Failed to register mode switch: %d\n", ret);
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
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index ab55453f2d2c..d9213739de72 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -25,6 +25,7 @@
 
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/usb/typec_mux.h>
 
 #include <drm/display/drm_dp.h>
 #include <drm/drm_connector.h>
@@ -763,4 +764,34 @@ bool drm_dp_downstream_rgb_to_ycbcr_conversion(const u8 dpcd[DP_RECEIVER_CAP_SIZ
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
+#ifdef CONFIG_TYPEC
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
2.39.1.519.gcb327c4b5f-goog

