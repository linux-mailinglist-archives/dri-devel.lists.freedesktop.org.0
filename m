Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E49526FB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 02:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C5010E39F;
	Thu, 15 Aug 2024 00:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QmSw+QPN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C2410E39F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 00:34:38 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-201ee6b084bso4004115ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723682078; x=1724286878;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eay7JVeaRdUdJgh2AiNC6S0SBArgtOAmkTCpf0gbN4k=;
 b=QmSw+QPNReyVnhuendrTGonVyC9meq0xUqo+lHIogkk9mbL3SjuRFffwl/Nye2W2Ok
 dBXoAnulYghm57DyJ3BTI5zJdKzstBrONSRWFBQXSB1N8eXpILNKG6QXVM2E5w6ky7qC
 49btVzL19AvY3lu6BIA50GjBEXk1Xjypj3GJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723682078; x=1724286878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eay7JVeaRdUdJgh2AiNC6S0SBArgtOAmkTCpf0gbN4k=;
 b=HG20byQ4Z430bd7LH6hXquIB0sj3Dyr5HF6q9GiANJiAkRZvCXbXKcG5Lp/BrxQ/7+
 SD0FiqinW9Qz1MaJZB8467k+KPUeqQGoXS5OeCWm1KS9VZjJNhDtbsu8CwiryADcwk0j
 JkJOs7lm4zL2t6WJcEr9BrohVTAVLOz3BWKULZJG6vj84S1CJeLqRzHM3Ns67iJsJuNV
 wesa57LDD8dHXwxAWu1jBiFsKjh8bMWEqUltAl2YdcS2vS1hbUwxvxTD0lxcJDCdpiz3
 X0UZag8vhy2IDGCygrCRNsb/+NLZ22zwH84LpjYw1fTS9WzkesKHVFuQTeWZpnXC66T7
 MtLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIF2I/3KrNLqJGa5HbySgvtif5iSvAI4NFDfDqTZ8beH+7vOPDWvGEk85y4C3YoFtkoA1lFV59AAxfyMDf67zKK1yONNGmchiRImhIQsH2
X-Gm-Message-State: AOJu0Yy7tQK5gf0iqtYeTG0N9R3g4I870tauaWAJtwTddOS/GwMHnbkM
 YjNyLRyBD7b+Hd6XyZLoaY7qgzQC7M0OBXcnggbyqZmPa7mFUi+UkxmsFZF8dA==
X-Google-Smtp-Source: AGHT+IHpwP//FMDrEpT41s5mxfmyYIk9kyHXUIvacsVcLLg/D2b+GUUjbBYfSj/U5sQTScK5NqQIqA==
X-Received: by 2002:a17:902:cec2:b0:1fd:a360:447b with SMTP id
 d9443c01a7336-201d6487f50mr53664315ad.52.1723682077796; 
 Wed, 14 Aug 2024 17:34:37 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-201f037aeadsm1985745ad.138.2024.08.14.17.34.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 17:34:37 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>, Robert Foss <rfoss@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v2 08/11] platform/chrome: cros_ec_typec: Add support for
 signaling DP HPD via drm_bridge
Date: Wed, 14 Aug 2024 17:34:13 -0700
Message-ID: <20240815003417.1175506-9-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
In-Reply-To: <20240815003417.1175506-1-swboyd@chromium.org>
References: <20240815003417.1175506-1-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can imagine that logically the EC is a device that has some number of
DisplayPort (DP) connector inputs, some number of USB3 connector inputs,
and some number of USB type-c connector outputs. If you squint enough it
looks like a USB type-c dock. Logically there's a crossbar pin
assignment capability within the EC that can assign USB and DP lanes to
USB type-c lanes in the connector (i.e. USB type-c pin configurations).
In reality, the EC is a microcontroller that has some TCPCs and
redrivers connected to it over something like i2c and DP/USB from the AP
is wired directly to those ICs, not the EC.

This design allows the EC to abstract many possible USB and DP hardware
configurations away from the AP (kernel) so that the AP can largely deal
with USB and DP without thinking about USB Type-C much at all. The DP
and USB data originate in the AP, not the EC, so it helps to think that
the EC takes the DP and USB data as input to mux onto USB type-c ports
even if it really doesn't do that. With this split design, the EC
forwards the DP HPD state to the DP hardware via a GPIO that's connected
to the DP phy.

Having that HPD state signaled directly to the DP phy uses precious
hardware resources, a pin or two and a wire, and it also forces the TCPM
to live on the EC. If we want to save costs and move more control of USB
type-c to the kernel it's in our interest to get rid of the HPD pin
entirely and signal HPD to the DP phy some other way. Luckily, the EC
already exposes information about the USB Type-C stack to the kernel via
the host command interface in the "google,cros-ec-typec" compatible
driver, which parses EC messages related to USB type-c and effectively
"replays" those messages to the kernel's USB typec subsystem. This
includes the state of HPD, which can be interrogated and acted upon by
registering a 'struct typec_mux_dev' with the typec subsystem or by
hooking directly into this cros_ec_typec driver.

On DT based systems, the DP display pipeline is abstracted via a 'struct
drm_bridge'. If we want to signal HPD state from within the kernel we
need to hook into the drm_bridge framework somehow to call
drm_bridge_hpd_notify() when HPD state changes in the typec framework.
Use the newly added drm_dp_typec_bridge code to do this. When the EC
notifies AP of a type-c event, look at the port state and set the
connector state to connected or disconnected based on the HPD level when
the port is in DP mode.

To keep this patch minimal, only signal HPD state to the drm_bridge
chain. Later patches will add more features. Eventually we'll be able to
inform userspace about which usb-c-connector node is displaying DP and
what USB devices are connected to a connector.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/Kconfig         |  1 +
 drivers/platform/chrome/cros_ec_typec.c | 64 ++++++++++++++++++++++++-
 drivers/platform/chrome/cros_ec_typec.h |  4 +-
 3 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 7dbeb786352a..0aee8a77f1d6 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -231,6 +231,7 @@ config CROS_EC_TYPEC
 	depends on MFD_CROS_EC_DEV && TYPEC
 	depends on CROS_USBPD_NOTIFY
 	depends on USB_ROLE_SWITCH
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	default MFD_CROS_EC_DEV
 	help
 	  If you say Y here, you get support for accessing Type C connector
diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 4d305876ec08..5cbc6b3df906 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -9,6 +9,7 @@
 #include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_usbpd_notify.h>
 #include <linux/platform_device.h>
@@ -16,11 +17,18 @@
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_tbt.h>
 
+#include <drm/bridge/aux-bridge.h>
+
 #include "cros_ec_typec.h"
 #include "cros_typec_vdm.h"
 
 #define DRV_NAME "cros-ec-typec"
 
+struct cros_typec_dp_bridge {
+	struct cros_typec_data *typec_data;
+	struct drm_dp_typec_bridge_dev *dev;
+};
+
 #define DP_PORT_VDO	(DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
 				DP_CAP_DFP_D | DP_CAP_RECEPTACLE)
 
@@ -334,6 +342,9 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	u32 port_num = 0;
 
 	nports = device_get_child_node_count(dev);
+	/* Don't count any 'ports' child node */
+	if (of_graph_is_present(dev->of_node))
+		nports--;
 	if (nports == 0) {
 		dev_err(dev, "No port entries found.\n");
 		return -ENODEV;
@@ -347,6 +358,10 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	/* DT uses "reg" to specify port number. */
 	port_prop = dev->of_node ? "reg" : "port-number";
 	device_for_each_child_node(dev, fwnode) {
+		/* An OF graph isn't a connector */
+		if (fwnode_name_eq(fwnode, "ports"))
+			continue;
+
 		if (fwnode_property_read_u32(fwnode, port_prop, &port_num)) {
 			ret = -EINVAL;
 			dev_err(dev, "No port-number for port, aborting.\n");
@@ -413,6 +428,36 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	return ret;
 }
 
+static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
+{
+	struct device *dev = typec->dev;
+	struct cros_typec_dp_bridge *dp_bridge;
+	struct fwnode_handle *ep __free(fwnode_handle);
+	struct drm_dp_typec_bridge_dev *dp_dev;
+	struct drm_dp_typec_bridge_desc desc = {
+		.of_node = dev->of_node,
+	};
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	if (!ep) {
+		/* There isn't a DP input endpoint. Ignore. */
+		return 0;
+	}
+
+	dp_bridge = devm_kzalloc(dev, sizeof(*dp_bridge), GFP_KERNEL);
+	if (!dp_bridge)
+		return -ENOMEM;
+	typec->dp_bridge = dp_bridge;
+	dp_bridge->typec_data = typec;
+
+	dp_dev = devm_drm_dp_typec_bridge_alloc(dev, &desc);
+	if (IS_ERR(dp_dev))
+		return PTR_ERR(dp_dev);
+	dp_bridge->dev = dp_dev;
+
+	return devm_drm_dp_typec_bridge_add(dev, dp_dev);
+}
+
 static int cros_typec_usb_safe_state(struct cros_typec_port *port)
 {
 	int ret;
@@ -612,6 +657,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 				struct ec_response_usb_pd_control_v2 *pd_ctrl)
 {
 	struct cros_typec_port *port = typec->ports[port_num];
+	struct cros_typec_dp_bridge *dp_bridge = typec->dp_bridge;
 	struct ec_response_usb_pd_mux_info resp;
 	struct ec_params_usb_pd_mux_info req = {
 		.port = port_num,
@@ -619,6 +665,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	struct ec_params_usb_pd_mux_ack mux_ack;
 	enum typec_orientation orientation;
 	int ret;
+	bool dp_enabled;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
 			  &req, sizeof(req), &resp, sizeof(resp));
@@ -628,6 +675,8 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 		return ret;
 	}
 
+	dp_enabled = resp.flags & USB_PD_MUX_DP_ENABLED;
+
 	/* No change needs to be made, let's exit early. */
 	if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
 		return 0;
@@ -659,8 +708,14 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
-	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
+	} else if (dp_enabled) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
+		if (dp_bridge) {
+			drm_dp_typec_bridge_notify(dp_bridge->dev,
+						   port->mux_flags & USB_PD_MUX_HPD_LVL ?
+						   connector_status_connected :
+						   connector_status_disconnected);
+		}
 	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
@@ -677,6 +732,9 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	}
 
 mux_ack:
+	if (dp_bridge && !dp_enabled)
+		drm_dp_typec_bridge_notify(dp_bridge->dev, connector_status_disconnected);
+
 	if (!typec->needs_mux_ack)
 		return ret;
 
@@ -1261,6 +1319,10 @@ static int cros_typec_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = cros_typec_init_dp_bridge(typec);
+	if (ret < 0)
+		return ret;
+
 	INIT_WORK(&typec->port_work, cros_typec_port_work);
 
 	/*
diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
index deda180a646f..37c9a3ae3402 100644
--- a/drivers/platform/chrome/cros_ec_typec.h
+++ b/drivers/platform/chrome/cros_ec_typec.h
@@ -27,6 +27,8 @@ struct cros_typec_altmode_node {
 	struct list_head list;
 };
 
+struct cros_typec_dp_bridge;
+
 /* Platform-specific data for the Chrome OS EC Type C controller. */
 struct cros_typec_data {
 	struct device *dev;
@@ -35,12 +37,12 @@ struct cros_typec_data {
 	unsigned int pd_ctrl_ver;
 	/* Array of ports, indexed by port number. */
 	struct cros_typec_port *ports[EC_USB_PD_MAX_PORTS];
+	struct cros_typec_dp_bridge *dp_bridge;
 	struct notifier_block nb;
 	struct work_struct port_work;
 	bool typec_cmd_supported;
 	bool needs_mux_ack;
 };
-
 /* Per port data. */
 struct cros_typec_port {
 	struct typec_port *port;
-- 
https://chromeos.dev

