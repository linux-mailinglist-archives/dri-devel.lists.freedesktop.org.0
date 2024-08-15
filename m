Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BF9526F3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 02:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F86010E370;
	Thu, 15 Aug 2024 00:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="RLmZ3uYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D86210E370
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 00:34:27 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-201cd78c6a3so3558665ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723682067; x=1724286867;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OxnfdKsnABkmxy+Awu1gzrCm5LBU5v/4gHba1EU76+4=;
 b=RLmZ3uYqx/nwC77j4PNAWMkJM//65yieS68/HNX2P5B8zW2Pua5MVCEy3T3eAtMoqf
 UCDs/o9rhvnWXNcViEy95/1wglGMwlWVTcI74PFRJF3GREtub+zPdDOCuhbyyxXrwI16
 4Kyl6XXy/5/Flvl3ZhiYqPyT7TZC1lnKW+RaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723682067; x=1724286867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OxnfdKsnABkmxy+Awu1gzrCm5LBU5v/4gHba1EU76+4=;
 b=nKZjKaeEN7ZQbsCRHWkVB+TO1kkQzUxXc2zo/ljjDM6eexq4llGmOCgBUKXoq3t93G
 H9AABAZ+4XhOtDrXd87uIDBH9gGu3VVVKdPYN+ydeWTDbobtBcUPKsKjSbOXEFL8zubu
 urqN7x2Bs8Aj1LSscAvw5jqC7xYK4225wWhCStFPx1GCxbDv1XWYjis4n6ShHPyB3NCO
 gnLJ1ApGeLxkzQzJcnDaEDPNpnhBgIx+rlKiCz2pYvjXCkkceM7GT3i9XNPQGZEBC5LS
 lt8kf2ot7ovI6inWyTr7YJNCilTGU4GY5632ccdp3zDo6oUbsiSmdOA+FmKbpUOSW0pG
 PBkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR+pcMzWWvkP2lrdm9ipo5jI8s0NmkZdbjzmqVs4fL+4FBlmwBSi7LeZg+nlJ7TGm8Perdlw/exN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmGM76iwuskEjZ+soQL38XAD7bxH/AqdT/gAPSgkxV4C5PvEHf
 Ttl5S0Yy3h2HIZfWZ4Y6wpc1GsEqVEKt6sQLDRAtsY+Ytx5mBgu0pbdRiVOSLw==
X-Google-Smtp-Source: AGHT+IFOEYBYeh7yn8STFWbC43QluLLJJx9fWEole1fT2NjhKt+vfyJrK42tLqT8J/p9fFuXb0i9UA==
X-Received: by 2002:a17:903:110d:b0:1fb:3ce5:122d with SMTP id
 d9443c01a7336-201d6487ed6mr55729075ad.41.1723682067050; 
 Wed, 14 Aug 2024 17:34:27 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-201f03203efsm2036895ad.118.2024.08.14.17.34.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 17:34:26 -0700 (PDT)
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
Subject: [PATCH v2 03/11] drm/bridge: aux-hpd: Support USB Type-C DP altmodes
 via DRM lane assignment
Date: Wed, 14 Aug 2024 17:34:08 -0700
Message-ID: <20240815003417.1175506-4-swboyd@chromium.org>
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

Extend the aux-hpd bridge driver to support assigning DP lanes to USB
Type-C pins. Existing users of this driver only need the HPD signaling
support, so leave that in place and wrap the code with a variant that
supports more features of USB Type-C DP altmode, i.e. pin
configurations. Prefix that code with 'drm_dp_typec_bridge' to
differentiate it from the existing 'drm_aux_hpd_bridge' code.

Users allocate the bridge by passing a struct drm_dp_typec_bridge_desc
to devm_drm_dp_typec_bridge_alloc() and then use the returned pointer
for further operations like notifying HPD to the bridge chain or setting
the DP altmode pin configuration. All these APIs take an opaque struct
drm_dp_typec_bridge_dev pointer so that the wrong 'struct device' can't
be mistakenly used.

Note: The pin assignment function doesn't actively change the lane
configuration. Instead it stashes the lane assignment and requests the
assignment on the previous bridge in the chain during the atomic check
phase. Assume the USB Type-C pins are in the normal orientation for now.
A future patch will support type-c port orientation.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 319 +++++++++++++++++++++++-
 include/drm/bridge/aux-bridge.h         |  52 ++++
 2 files changed, 359 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 6886db2d9e00..716b2220bdd5 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -7,8 +7,11 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/usb/typec_dp.h>
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_print.h>
 #include <drm/bridge/aux-bridge.h>
 
 static DEFINE_IDA(drm_aux_hpd_bridge_ida);
@@ -18,6 +21,48 @@ struct drm_aux_hpd_bridge_data {
 	struct device *dev;
 };
 
+enum dp_lane {
+	DP_ML0 = 0,	/* DP pins 1/3 */
+	DP_ML1 = 1,	/* DP pins 4/6 */
+	DP_ML2 = 2,	/* DP pins 7/9 */
+	DP_ML3 = 3,	/* DP pins 10/12 */
+};
+
+struct drm_dp_typec_bridge_data {
+	u8 dp_lanes[DP_ML3 + 1];
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
@@ -30,6 +75,22 @@ static void drm_aux_hpd_bridge_release(struct device *dev)
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
@@ -133,6 +194,72 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 }
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
+/**
+ * devm_drm_dp_typec_bridge_alloc - Allocate a USB type-C DisplayPort bridge
+ * @parent: device instance providing this bridge
+ * @desc: device node pointer corresponding to this bridge instance
+ *
+ * Creates a DRM bridge with the type set to DRM_MODE_CONNECTOR_DisplayPort,
+ * which terminates the bridge chain and is able to send the HPD events along
+ * with remap DP lanes to match USB type-c DP altmode pin assignments.
+ *
+ * Return: device instance that will handle created bridge or an error code
+ * encoded into the pointer.
+ */
+struct drm_dp_typec_bridge_dev *
+devm_drm_dp_typec_bridge_alloc(struct device *parent, const struct drm_dp_typec_bridge_desc *desc)
+{
+	struct drm_dp_typec_bridge_dev *typec_bridge_dev;
+	struct auxiliary_device *adev;
+	int ret;
+
+	typec_bridge_dev = kzalloc(sizeof(*typec_bridge_dev), GFP_KERNEL);
+	if (!typec_bridge_dev)
+		return ERR_PTR(-ENOMEM);
+	adev = &typec_bridge_dev->adev;
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
+	adev->dev.platform_data = of_node_get(desc->of_node);
+	typec_bridge_dev->max_lanes = desc->num_dp_lanes;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		of_node_put(adev->dev.platform_data);
+		of_node_put(adev->dev.of_node);
+		ida_free(&drm_aux_hpd_bridge_ida, adev->id);
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	return typec_bridge_dev;
+}
+EXPORT_SYMBOL_GPL(devm_drm_dp_typec_bridge_alloc);
+
+/**
+ * devm_drm_dp_typec_bridge_add - register a USB type-C DisplayPort bridge
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
@@ -155,38 +282,206 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 }
 EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
 
+/**
+ * drm_dp_typec_bridge_notify - notify hot plug detection events
+ * @typec_bridge_dev: device created for the type-C bridge
+ * @status: output connection status
+ *
+ * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
+ * detection events for bridges created via devm_drm_dp_typec_bridge_alloc().
+ *
+ * This function shall be called in a context that can sleep.
+ */
+void drm_dp_typec_bridge_notify(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+				enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify(&typec_bridge_dev->adev.dev, status);
+}
+EXPORT_SYMBOL_GPL(drm_dp_typec_bridge_notify);
+
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     enum drm_bridge_attach_flags flags)
 {
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
+ * drm_dp_typec_bridge_assign_pins - Assign DisplayPort (DP) lanes to USB type-C pins
+ * @typec_bridge_dev: Device created for the type-c bridge
+ * @conf: DisplayPort altmode configure command VDO content
+ * @lane_mapping: Physical (array index) to logical (array value) USB type-C lane mapping
+ *
+ * Assign DP lanes to the USB type-C pins for the DP altmode configuration
+ * @conf, while taking into account the USB type-C @lane_mapping. Future atomic
+ * checks on this bridge will request the lane assignment from the previous
+ * bridge so that the DP signal is sent to the proper USB type-C pins.
+ *
+ * Return: 0 on success, negative value for failure.
+ */
+int drm_dp_typec_bridge_assign_pins(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+				     u32 conf,
+				     enum usb_ss_lane lane_mapping[NUM_USB_SS])
+{
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
+EXPORT_SYMBOL_GPL(drm_dp_typec_bridge_assign_pins);
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
+	struct drm_dp_typec_bridge_data *typec_data;
+	struct drm_bridge *bridge;
+	u8 dp_lanes[] = { DP_ML0, DP_ML1, DP_ML2, DP_ML3 };
 
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
+		memcpy(typec_data->dp_lanes, dp_lanes, sizeof(typec_data->dp_lanes));
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
index c2f5a855512f..aaace808772c 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -20,12 +20,40 @@ static inline int drm_aux_bridge_register(struct device *parent)
 }
 #endif
 
+struct drm_dp_typec_bridge_dev;
+
+/**
+ * struct drm_dp_typec_bridge_desc - drm_dp_typec_bridge descriptor
+ * @of_node: device node pointer corresponding to this bridge instance
+ * @num_dp_lanes: number of input DP lanes possible (1, 2 or 4)
+ */
+struct drm_dp_typec_bridge_desc {
+	struct device_node *of_node;
+	size_t num_dp_lanes;
+};
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
 #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
 struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, struct device_node *np);
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
 void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+struct drm_dp_typec_bridge_dev *devm_drm_dp_typec_bridge_alloc(struct device *parent,
+							       const struct drm_dp_typec_bridge_desc *desc);
+int devm_drm_dp_typec_bridge_add(struct device *dev, struct drm_dp_typec_bridge_dev *typec_bridge_dev);
+void drm_dp_typec_bridge_notify(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+				enum drm_connector_status status);
+int drm_dp_typec_bridge_assign_pins(struct drm_dp_typec_bridge_dev *typec_bridge_dev, u32 conf,
+				     enum usb_ss_lane lane_mapping[NUM_USB_SS]);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +72,33 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
+static inline struct drm_dp_typec_bridge_dev *
+devm_drm_dp_typec_bridge_alloc(struct device *parent, const struct drm_dp_typec_bridge_desc *desc)
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
+
+static inline void drm_dp_typec_bridge_notify(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+					      enum drm_connector_status status)
+{
+}
+
+static inline int drm_dp_typec_bridge_assign_pins(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+						  u32 conf,
+						  enum usb_ss_lane lane_mapping[NUM_USB_SS])
+{
+	return 0;
+}
 #endif
 
 #endif
-- 
https://chromeos.dev

