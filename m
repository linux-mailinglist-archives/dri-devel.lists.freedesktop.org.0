Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF20967495
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 06:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BFF410E15F;
	Sun,  1 Sep 2024 04:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="OK/BUqA8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B6610E12C
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 04:07:16 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-70df4b5cdd8so2136152a34.1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 21:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725163635; x=1725768435;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DuEX+B1LPDkO0gwsNaxgdZWm0YsScz9kUEVqR8xaDPo=;
 b=OK/BUqA8GEbJxrpERB/9s7v7PKbEzbpyRkNrYvFuGTcjRSVPJaytvarvWxl6kSCHga
 1GNR5n+zkaTFNwRLbBpyLTH7TT1qZIBpH7qBeUegSyAEBS4bgo5zm0buxLsoZ+4hDcTK
 +A83uCqeRVNeJWxcZ9mckdhdvYOLaoDwb8m7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725163635; x=1725768435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DuEX+B1LPDkO0gwsNaxgdZWm0YsScz9kUEVqR8xaDPo=;
 b=hCo1sfJ8J1VgPTOGi8xJjoE9tsgsSPXUMfeKmHGmdhbw5+daOtfhOGiPTCYx2weNhm
 3ECKddagA3oZv2ChqU0qCxmGhgcidr41IeUnnOkUZGyqvQBQq4MVjy/zr267GGvaN2Cb
 3+J0QnEmA1uLQuE4aUshnxw2Y2yfeufNroM7/tCUKy23Ku4puE2OBbxbbaP13fEKHLxe
 4QVti9GeDmmS+JCJIT1D6m1vIY5F0M2NxnRoGSUfkN3CGIiFrc3Dhs9Y0KD74gaudyE0
 SgBVz2rElArpzLMdCDEkHkLPJIzXQ2Pvn7Cj0wxQMMkCKpenov2OUjTc32v4vfOpQ/Vz
 Yxkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEADEE/rlbffHxSxclwEFHbW+ieUUgylOl71Y47xFdcgZNooIw6241x2eBM6ObYHOT75kCVcTd1K4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU59F94sFHimNKLdu+TWnTNYKUMXVFDTxc2fur5SJVUGZI6/lk
 BTddGgj3Hs213BQq9CdY2877QLcUZ4dy7SS93rJNxEmGaTVuezpo5S+ECxxNnA==
X-Google-Smtp-Source: AGHT+IFhd/v0o75TM3Av0ILjq1OZC+BzETv/i1P77qiiQwfgv/wDUywsLFLtblWnZq5CeTacIW+EAQ==
X-Received: by 2002:a05:6358:60cc:b0:1b5:fa48:5973 with SMTP id
 e5c5f4694b2df-1b7ef5fd67cmr625729455d.4.1725163634887; 
 Sat, 31 Aug 2024 21:07:14 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2d85b119c26sm6611649a91.14.2024.08.31.21.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2024 21:07:14 -0700 (PDT)
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
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 06/18] drm/bridge: aux-hpd: Support USB Type-C DP altmodes
 via DRM lane assignment
Date: Sat, 31 Aug 2024 21:06:44 -0700
Message-ID: <20240901040658.157425-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240901040658.157425-1-swboyd@chromium.org>
References: <20240901040658.157425-1-swboyd@chromium.org>
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

Extend the aux-hpd bridge driver to support assigning DP lanes to USB
type-c pins based on typec mux state entry. Existing users of this
driver only need the HPD signaling support, so leave that in place and
wrap the code with a variant that supports more features of USB type-c
DP altmode, i.e. pin configurations. Prefix that code with
'drm_dp_typec_bridge' to differentiate it from the existing
'drm_aux_hpd_bridge' code.

Parse the struct typec_mux_state members to determine if DP altmode has
been entered and if HPD is asserted or not. Signal HPD to the drm bridge
chain when HPD is asserted. Similarly, parse the pin assignment and map
the DP lanes to the usb-c output lanes, taking into account any lane
remapping from the data-lanes endpoint property. Pass that lane mapping
to the previous drm_bridge in the bridge chain during the atomic check
phase.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 483 +++++++++++++++++++++++-
 include/drm/bridge/aux-bridge.h         |  17 +
 2 files changed, 488 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 6886db2d9e00..32565f88ade7 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -7,8 +7,14 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
 #include <drm/bridge/aux-bridge.h>
 
 static DEFINE_IDA(drm_aux_hpd_bridge_ida);
@@ -18,6 +24,80 @@ struct drm_aux_hpd_bridge_data {
 	struct device *dev;
 };
 
+enum dp_lane {
+	DP_ML0 = 0,	/* DP pins 1/3 */
+	DP_ML1 = 1,	/* DP pins 4/6 */
+	DP_ML2 = 2,	/* DP pins 7/9 */
+	DP_ML3 = 3,	/* DP pins 10/12 */
+};
+
+#define NUM_DP_ML	(DP_ML3 + 1)
+
+enum usb_ss_lane {
+	USB_SSRX1 = 0,	/* Type-C pins B11/B10 */
+	USB_SSTX1 = 1,	/* Type-C pins A2/A3 */
+	USB_SSTX2 = 2,	/* Type-C pins A11/A10 */
+	USB_SSRX2 = 3,	/* Type-C pins B2/B3 */
+};
+
+#define NUM_USB_SS	(USB_SSRX2 + 1)
+
+struct drm_dp_typec_bridge_data;
+
+/**
+ * struct drm_dp_typec_bridge_typec_port - USB type-c port associated with DP bridge
+ * @lane_mapping: Physical (array index) to logical (array value) USB type-C lane mapping
+ * @mode_switch: DP altmode switch
+ * @typec_data: Back pointer to type-c bridge data
+ */
+struct drm_dp_typec_bridge_typec_port {
+	u32 lane_mapping[NUM_USB_SS];
+	struct typec_mux_dev *mode_switch;
+	struct drm_dp_typec_bridge_data *typec_data;
+};
+
+/**
+ * struct drm_dp_typec_bridge_data - DP over USB type-c drm_bridge
+ * @dp_lanes: Physical (array value) to logical (array index) DP lane mapping
+ * @num_lanes: Number of valid lanes in @dp_lanes
+ * @hpd_bridge: hpd_bridge data
+ */
+struct drm_dp_typec_bridge_data {
+	u8 dp_lanes[NUM_DP_ML];
+	size_t num_lanes;
+	struct drm_aux_hpd_bridge_data hpd_bridge;
+};
+
+static inline struct drm_dp_typec_bridge_data *
+hpd_bridge_to_typec_bridge_data(struct drm_aux_hpd_bridge_data *hpd_data)
+{
+	return container_of(hpd_data, struct drm_dp_typec_bridge_data, hpd_bridge);
+}
+
+static inline struct drm_dp_typec_bridge_data *
+to_drm_dp_typec_bridge_data(struct drm_bridge *bridge)
+{
+	struct drm_aux_hpd_bridge_data *hpd_data;
+
+	hpd_data = container_of(bridge, struct drm_aux_hpd_bridge_data, bridge);
+
+	return hpd_bridge_to_typec_bridge_data(hpd_data);
+}
+
+struct drm_dp_typec_bridge_dev {
+	struct auxiliary_device adev;
+	size_t max_lanes;
+	size_t num_typec_ports;
+};
+
+static inline struct drm_dp_typec_bridge_dev *
+to_drm_dp_typec_bridge_dev(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	return container_of(adev, struct drm_dp_typec_bridge_dev, adev);
+}
+
 static void drm_aux_hpd_bridge_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
@@ -30,6 +110,22 @@ static void drm_aux_hpd_bridge_release(struct device *dev)
 	kfree(adev);
 }
 
+static void drm_dp_typec_bridge_release(struct device *dev)
+{
+	struct drm_dp_typec_bridge_dev *typec_bridge_dev;
+	struct auxiliary_device *adev;
+
+	typec_bridge_dev = to_drm_dp_typec_bridge_dev(dev);
+	adev = &typec_bridge_dev->adev;
+
+	ida_free(&drm_aux_hpd_bridge_ida, adev->id);
+
+	of_node_put(adev->dev.platform_data);
+	of_node_put(adev->dev.of_node);
+
+	kfree(typec_bridge_dev);
+}
+
 static void drm_aux_hpd_bridge_free_adev(void *_adev)
 {
 	auxiliary_device_uninit(_adev);
@@ -133,6 +229,111 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 }
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
+/**
+ * devm_drm_dp_typec_bridge_alloc - Allocate a USB type-c DisplayPort bridge
+ * @parent: device instance providing this bridge
+ * @np: device node pointer corresponding to this bridge instance
+ *
+ * Creates a DRM bridge with the type set to DRM_MODE_CONNECTOR_DisplayPort,
+ * which terminates the bridge chain and is able to send the HPD events along
+ * with remap DP lanes to match USB type-c DP altmode pin assignments.
+ *
+ * Return: device instance that will handle created bridge or an error code
+ * encoded into the pointer.
+ */
+struct drm_dp_typec_bridge_dev *
+devm_drm_dp_typec_bridge_alloc(struct device *parent, struct device_node *np)
+{
+	struct drm_dp_typec_bridge_dev *typec_bridge_dev;
+	struct auxiliary_device *adev;
+	int ret, num_dp_lanes;
+	struct device_node *dp_ep __free(device_node) = NULL;
+	struct device_node *remote_ep;
+	struct device_node *ep_node;
+	struct of_endpoint ep;
+
+	typec_bridge_dev = kzalloc(sizeof(*typec_bridge_dev), GFP_KERNEL);
+	if (!typec_bridge_dev)
+		return ERR_PTR(-ENOMEM);
+	adev = &typec_bridge_dev->adev;
+
+	for_each_endpoint_of_node(np, ep_node) {
+		of_graph_parse_endpoint(ep_node, &ep);
+		/* Only consider available endpoints */
+		if (!of_device_is_available(ep_node))
+			continue;
+		/* Only consider connected nodes */
+		remote_ep = of_graph_get_remote_endpoint(ep_node);
+		of_node_put(remote_ep);
+		if (!remote_ep)
+			continue;
+
+		if (ep.port == 2)
+			dp_ep = of_node_get(ep_node);
+		else if (ep.port == 0)
+			typec_bridge_dev->num_typec_ports++;
+	}
+
+	if (!typec_bridge_dev->num_typec_ports) {
+		kfree(adev);
+		return ERR_PTR(dev_err_probe(parent, -ENODEV, "Missing typec endpoint(s) port@0\n"));
+	}
+
+	if (!dp_ep) {
+		kfree(adev);
+		return ERR_PTR(dev_err_probe(parent, -ENODEV, "Missing DP endpoint port@2\n"));
+	}
+
+	num_dp_lanes = of_property_count_u32_elems(dp_ep, "data-lanes");
+	if (num_dp_lanes < 0)
+		num_dp_lanes = NUM_DP_ML;
+
+	typec_bridge_dev->max_lanes = num_dp_lanes;
+
+	ret = ida_alloc(&drm_aux_hpd_bridge_ida, GFP_KERNEL);
+	if (ret < 0) {
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	adev->id = ret;
+	adev->name = "dp_typec_bridge";
+	adev->dev.parent = parent;
+	adev->dev.of_node = of_node_get(parent->of_node);
+	adev->dev.release = drm_dp_typec_bridge_release;
+	adev->dev.platform_data = of_node_get(np);
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		of_node_put(adev->dev.platform_data);
+		of_node_put(adev->dev.of_node);
+		ida_free(&drm_aux_hpd_bridge_ida, adev->id);
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	ret = devm_add_action_or_reset(parent, drm_aux_hpd_bridge_free_adev, adev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return typec_bridge_dev;
+}
+EXPORT_SYMBOL_GPL(devm_drm_dp_typec_bridge_alloc);
+
+/**
+ * devm_drm_dp_typec_bridge_add - register a USB type-c DisplayPort bridge
+ * @dev: struct device to tie registration lifetime to
+ * @typec_bridge_dev: USB type-c DisplayPort bridge to be registered
+ *
+ * Returns: zero on success or a negative errno
+ */
+int devm_drm_dp_typec_bridge_add(struct device *dev, struct drm_dp_typec_bridge_dev *typec_bridge_dev)
+{
+	struct auxiliary_device *adev = &typec_bridge_dev->adev;
+
+	return devm_drm_dp_hpd_bridge_add(dev, adev);
+}
+EXPORT_SYMBOL_GPL(devm_drm_dp_typec_bridge_add);
+
 /**
  * drm_aux_hpd_bridge_notify - notify hot plug detection events
  * @dev: device created for the HPD bridge
@@ -161,32 +362,290 @@ static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
 }
 
+static int dp_lane_to_typec_lane(enum dp_lane lane)
+{
+	switch (lane) {
+	case DP_ML0:
+		return USB_SSTX2;
+	case DP_ML1:
+		return USB_SSRX2;
+	case DP_ML2:
+		return USB_SSTX1;
+	case DP_ML3:
+		return USB_SSRX1;
+	}
+
+	return -EINVAL;
+}
+
+static int typec_to_dp_lane(enum usb_ss_lane lane)
+{
+	switch (lane) {
+	case USB_SSRX1:
+		return DP_ML3;
+	case USB_SSTX1:
+		return DP_ML2;
+	case USB_SSTX2:
+		return DP_ML0;
+	case USB_SSRX2:
+		return DP_ML1;
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * drm_dp_typec_bridge_assign_pins - Assign DisplayPort (DP) lanes to USB type-c pins
+ * @typec_bridge_dev: USB type-c DisplayPort bridge
+ * @conf: DisplayPort altmode configure command VDO content
+ * @port: The USB type-c output port to assign pins to
+ *
+ * Assign DP lanes to the @port's USB type-c pins for the DP altmode
+ * configuration @conf, while taking into account the USB type-c lane_mapping.
+ * Future atomic checks on this bridge will request the lane assignment from
+ * the previous bridge so that the DP signal is sent to the assigned USB type-c
+ * pins.
+ *
+ * Return: 0 on success, negative value for failure.
+ */
+static int
+drm_dp_typec_bridge_assign_pins(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+				u32 conf,
+				struct drm_dp_typec_bridge_typec_port *port)
+{
+	enum usb_ss_lane *lane_mapping = port->lane_mapping;
+	struct auxiliary_device *adev = &typec_bridge_dev->adev;
+	struct drm_aux_hpd_bridge_data *hpd_data = auxiliary_get_drvdata(adev);
+	struct drm_dp_typec_bridge_data *data;
+	u8 *dp_lanes;
+	size_t num_lanes, max_lanes;
+	int i, typec_lane;
+	u8 pin_assign;
+
+	if (!hpd_data)
+		return -EINVAL;
+
+	data = hpd_bridge_to_typec_bridge_data(hpd_data);
+	dp_lanes = data->dp_lanes;
+
+	pin_assign = DP_CONF_GET_PIN_ASSIGN(conf);
+	if (pin_assign == DP_PIN_ASSIGN_D)
+		num_lanes = 2;
+	else
+		num_lanes = 4;
+	max_lanes = typec_bridge_dev->max_lanes;
+	data->num_lanes = num_lanes = min(num_lanes, max_lanes);
+
+	for (i = 0; i < num_lanes; i++) {
+		/* Get physical type-c lane for DP lane */
+		typec_lane = dp_lane_to_typec_lane(i);
+		if (typec_lane < 0) {
+			dev_err(&adev->dev, "Invalid type-c lane configuration at DP_ML%d\n", i);
+			return -EINVAL;
+		}
+
+		/* Map physical to logical type-c lane */
+		typec_lane = lane_mapping[typec_lane];
+
+		/* Map logical type-c lane to logical DP lane */
+		dp_lanes[i] = typec_to_dp_lane(typec_lane);
+	}
+
+	return 0;
+}
+
+static int drm_dp_typec_bridge_atomic_check(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state)
+{
+	struct drm_dp_typec_bridge_data *data;
+	struct drm_lane_cfg *in_lanes;
+	u8 *dp_lanes;
+	size_t num_lanes;
+	int i;
+
+	data = to_drm_dp_typec_bridge_data(bridge);
+	num_lanes = data->num_lanes;
+	if (!num_lanes)
+		return 0;
+	dp_lanes = data->dp_lanes;
+
+	in_lanes = kcalloc(num_lanes, sizeof(*in_lanes), GFP_KERNEL);
+	if (!in_lanes)
+		return -ENOMEM;
+
+	bridge_state->input_bus_cfg.lanes = in_lanes;
+	bridge_state->input_bus_cfg.num_lanes = num_lanes;
+
+	for (i = 0; i < num_lanes; i++)
+		in_lanes[i].logical = dp_lanes[i];
+
+	return 0;
+}
+
 static const struct drm_bridge_funcs drm_aux_hpd_bridge_funcs = {
 	.attach	= drm_aux_hpd_bridge_attach,
 };
 
+static const struct drm_bridge_funcs drm_dp_typec_bridge_funcs = {
+	.attach	= drm_aux_hpd_bridge_attach,
+	.atomic_check = drm_dp_typec_bridge_atomic_check,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+};
+
+static int
+drm_dp_typec_bridge_mode_switch_set(struct typec_mux_dev *mode_switch,
+				    struct typec_mux_state *state)
+{
+	struct drm_dp_typec_bridge_typec_port *port;
+	const struct typec_displayport_data *dp_data;
+	struct drm_dp_typec_bridge_data *typec_data;
+	struct drm_dp_typec_bridge_dev *typec_bridge_dev;
+	struct device *dev;
+	int ret;
+	enum drm_connector_status status;
+
+	port = typec_mux_get_drvdata(mode_switch);
+	typec_data = port->typec_data;
+	dev = typec_data->hpd_bridge.dev;
+	typec_bridge_dev = to_drm_dp_typec_bridge_dev(dev);
+
+	if (state->mode == TYPEC_STATE_SAFE || state->mode == TYPEC_STATE_USB) {
+		drm_aux_hpd_bridge_notify(dev, connector_status_disconnected);
+	} else if (state->alt && state->alt->svid == USB_TYPEC_DP_SID) {
+		dp_data = state->data;
+		ret = drm_dp_typec_bridge_assign_pins(typec_bridge_dev, state->mode, port);
+		if (ret)
+			return ret;
+
+		if (dp_data->status & DP_STATUS_HPD_STATE)
+			status = connector_status_connected;
+		else
+			status = connector_status_disconnected;
+
+		drm_aux_hpd_bridge_notify(dev, status);
+	}
+
+	return 0;
+}
+
+static int
+drm_dp_typec_bridge_probe_typec_ports(struct drm_dp_typec_bridge_data *typec_data,
+				      struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+				      struct device_node *np)
+{
+	struct device *dev = &typec_bridge_dev->adev.dev;
+	struct device_node *typec_ep, *remote_ep;
+	struct of_endpoint ep;
+	const u32 mapping[] = { 0, 1, 2, 3 };
+	struct drm_dp_typec_bridge_typec_port *port;
+	size_t num_ports = typec_bridge_dev->num_typec_ports;
+	struct typec_mux_desc mode_switch_desc = { };
+	struct fwnode_handle *fwnode;
+	const char *name;
+
+	port = devm_kcalloc(dev, num_ports, sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	for_each_endpoint_of_node(np, typec_ep) {
+		of_graph_parse_endpoint(typec_ep, &ep);
+		/* Only look at the usbc output port (port@0) */
+		if (ep.port != 0)
+			continue;
+		/* Only consider available endpoints */
+		if (!of_device_is_available(typec_ep))
+			continue;
+		/* Only consider connected nodes */
+		remote_ep = of_graph_get_remote_endpoint(typec_ep);
+		of_node_put(remote_ep);
+		if (!remote_ep)
+			continue;
+
+		port->typec_data = typec_data;
+		if (of_property_read_u32_array(ep.local_node, "data-lanes",
+					       port->lane_mapping,
+					       ARRAY_SIZE(port->lane_mapping))) {
+			memcpy(port->lane_mapping, mapping, sizeof(mapping));
+		}
+
+		fwnode = of_fwnode_handle(typec_ep);
+		name = kasprintf(GFP_KERNEL, "%s-%d", dev_name(dev), ep.id);
+		if (!name)
+			return -ENOMEM;
+
+		mode_switch_desc.set = drm_dp_typec_bridge_mode_switch_set;
+		mode_switch_desc.fwnode = fwnode;
+		mode_switch_desc.name = name;
+		mode_switch_desc.drvdata = port;
+		port->mode_switch = devm_typec_mux_register(dev, &mode_switch_desc);
+		if (IS_ERR(port->mode_switch)) {
+			kfree(name);
+			return PTR_ERR(port->mode_switch);
+		}
+
+		kfree(name);
+		port++;
+	}
+
+	return 0;
+}
+
+enum drm_aux_bridge_type {
+	DRM_AUX_HPD_BRIDGE,
+	DRM_AUX_TYPEC_BRIDGE,
+};
+
 static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
 				    const struct auxiliary_device_id *id)
 {
-	struct drm_aux_hpd_bridge_data *data;
+	struct device *dev = &auxdev->dev;
+	struct drm_aux_hpd_bridge_data *hpd_data;
+	struct drm_dp_typec_bridge_dev *typec_bridge_dev;
+	struct drm_dp_typec_bridge_data *typec_data;
+	struct drm_bridge *bridge;
+	struct device_node *np = dev_get_platdata(dev);
+	u8 dp_lanes[] = { DP_ML0, DP_ML1, DP_ML2, DP_ML3 };
+	int ret;
 
-	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
+	if (id->driver_data == DRM_AUX_HPD_BRIDGE) {
+		hpd_data = devm_kzalloc(dev, sizeof(*hpd_data), GFP_KERNEL);
+		if (!hpd_data)
+			return -ENOMEM;
+		bridge = &hpd_data->bridge;
+		bridge->funcs = &drm_aux_hpd_bridge_funcs;
+	} else if (id->driver_data == DRM_AUX_TYPEC_BRIDGE) {
+		typec_data = devm_kzalloc(dev, sizeof(*typec_data), GFP_KERNEL);
+		if (!typec_data)
+			return -ENOMEM;
+		hpd_data = &typec_data->hpd_bridge;
+		bridge = &hpd_data->bridge;
+		bridge->funcs = &drm_dp_typec_bridge_funcs;
+		typec_bridge_dev = to_drm_dp_typec_bridge_dev(dev);
+		memcpy(typec_data->dp_lanes, dp_lanes, sizeof(typec_data->dp_lanes));
+		ret = drm_dp_typec_bridge_probe_typec_ports(typec_data, typec_bridge_dev, np);
+		if (ret)
+			return ret;
+	} else {
+		return -ENODEV;
+	}
 
-	data->dev = &auxdev->dev;
-	data->bridge.funcs = &drm_aux_hpd_bridge_funcs;
-	data->bridge.of_node = dev_get_platdata(data->dev);
-	data->bridge.ops = DRM_BRIDGE_OP_HPD;
-	data->bridge.type = id->driver_data;
+	hpd_data->dev = dev;
+	bridge->of_node = dev_get_platdata(dev);
+	bridge->ops = DRM_BRIDGE_OP_HPD;
+	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
 
-	auxiliary_set_drvdata(auxdev, data);
+	auxiliary_set_drvdata(auxdev, hpd_data);
 
-	return devm_drm_bridge_add(data->dev, &data->bridge);
+	return devm_drm_bridge_add(dev, bridge);
 }
 
 static const struct auxiliary_device_id drm_aux_hpd_bridge_table[] = {
-	{ .name = KBUILD_MODNAME ".dp_hpd_bridge", .driver_data = DRM_MODE_CONNECTOR_DisplayPort, },
+	{ .name = KBUILD_MODNAME ".dp_hpd_bridge", .driver_data = DRM_AUX_HPD_BRIDGE, },
+	{ .name = KBUILD_MODNAME ".dp_typec_bridge", .driver_data = DRM_AUX_TYPEC_BRIDGE, },
 	{},
 };
 MODULE_DEVICE_TABLE(auxiliary, drm_aux_hpd_bridge_table);
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..73fc8582ec07 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -20,12 +20,17 @@ static inline int drm_aux_bridge_register(struct device *parent)
 }
 #endif
 
+struct drm_dp_typec_bridge_dev;
+
 #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
 struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, struct device_node *np);
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
 void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+struct drm_dp_typec_bridge_dev *devm_drm_dp_typec_bridge_alloc(struct device *parent,
+							       struct device_node *np);
+int devm_drm_dp_typec_bridge_add(struct device *dev, struct drm_dp_typec_bridge_dev *typec_bridge_dev);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,6 +49,18 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
+static inline struct drm_dp_typec_bridge_dev *
+devm_drm_dp_typec_bridge_alloc(struct device *parent, struct device_node *np)
+{
+	return NULL;
+}
+
+static inline int devm_drm_dp_typec_bridge_add(struct device *dev,
+					       struct drm_dp_typec_bridge_dev *typec_bridge_dev)
+{
+	return 0;
+}
+
 static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
 {
 }
-- 
https://chromeos.dev

