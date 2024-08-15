Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C767A9526FF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 02:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438BE10E3A5;
	Thu, 15 Aug 2024 00:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="DYoEzue1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B3D10E3A5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 00:34:43 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1fc5296e214so4557585ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723682083; x=1724286883;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Llrpv/bhvM+ILeynT8xxMAhRB4gmjRWr+CKfaVkSb14=;
 b=DYoEzue1huEo0VDkR1GWRFa7o6+1Ta46P6DUhKQCIZkyzeDlCqNiVliE6LBSYPPxzW
 0LeAvqPUD5xqhk8Yw7JQqvEdinbeqkfCnU/NQ9OTikNaPbEs1ohbsLaz7hKNYSyDEKEd
 rgyH4C+in+x5kn/KDh7AXVGAqWrhiQOlXcCGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723682083; x=1724286883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Llrpv/bhvM+ILeynT8xxMAhRB4gmjRWr+CKfaVkSb14=;
 b=H25ZDx0GpL/yspKVQEJ5+dyCPBYbNdbvgEmtipP0qey0y184PM4DkKsYbmvXCJUsBf
 H4G4cebB1zV9NuaO9HMUk7NDEcFs1wBoI+ml8zunHHyIP0TU7r7+Sgt/1cNh31g59g6F
 JK7q7VsIp79DhNIftVtNdwD6XTH1NJj8izA3Yk0ZAfCLJJ+du71cEoFuuZt899fuvpq9
 5DD7ZV4xxFzzsHWIHG3FEsFSsA7h66L6p9tGS8cz7l4hmkWWI9AuBz+7rDNcliu/PC0a
 zrNUI7DB+ZKB/XMyx4sLEP2rJIze2MBHs/EHrkyclxqS6LpJ8h0umoJbOSZoDQwp/Bmg
 mY5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKrsxtm7zJDB1iRfedeDxZV8err2MUBTjCafcS4SbsOkL2M3r166JXrmppMZg3ClFtyt/poEf+HVvuPvbWjzC2LbGsdr4u5PI8wpyF31jl
X-Gm-Message-State: AOJu0Yz55xpOYp4z46gCFx/IGeZYj6gHZ4mTeNTfJ/6qIu3ZkjCjXRSZ
 99vzSm805o9ChTHbeBcAsnaUnYnMacVWI2G4x5h1n5FQY0wNqKsurAL/LgqEvg==
X-Google-Smtp-Source: AGHT+IEVlM5ZgWwPjr8Cf8G8BgFV3d3kS53MUapqW/O1uSuFqkLJw8H1IVUD3jIv722S8xs6osc3hw==
X-Received: by 2002:a17:903:18a:b0:1fa:2b89:f549 with SMTP id
 d9443c01a7336-201d638d77dmr64360645ad.10.1723682083238; 
 Wed, 14 Aug 2024 17:34:43 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-201f03751e0sm1992385ad.177.2024.08.14.17.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 17:34:42 -0700 (PDT)
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
Subject: [PATCH v2 11/11] platform/chrome: cros_ec_typec: Handle lack of HPD
 information
Date: Wed, 14 Aug 2024 17:34:16 -0700
Message-ID: <20240815003417.1175506-12-swboyd@chromium.org>
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

Some EC firmwares on Trogdor/Strongbad boards don't properly indicate
the state of DP HPD on a type-c port. Instead, the EC only indicates
that a type-c port has entered or exited DP mode. To make matters worse,
on these boards the DP signal is muxed between two USB type-c
connectors, so we can't use the DP entry of a port to figure out which
type-c port is actually displaying DP.

Read the state of the EC's analog mux from the hpd notification callback
to figure out which type-c port is displaying DP. This circumvents the
entire host command/message interface, because it doesn't work all the
time. Stash the hpd state into the port that's muxed, and then inject
that hpd state into the struct we get from the EC. Only do this when we
have the mux-gpios property in DT, indicating that we have to read the
EC gpio state to figure this out. For now we only support a single gpio
"bit", so there can only be two USB type-c ports.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 107 +++++++++++++++++++++---
 drivers/platform/chrome/cros_ec_typec.h |   1 +
 2 files changed, 98 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 9b54b3288f5f..e6e33b7bb543 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -28,6 +29,7 @@ struct cros_typec_dp_bridge {
 	struct cros_typec_data *typec_data;
 	struct drm_dp_typec_bridge_dev *dev;
 	struct cros_typec_port *active_port;
+	struct gpio_desc *mux_gpio;
 	bool orientation;
 };
 
@@ -445,6 +447,43 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	return ret;
 }
 
+static void cros_typec_dp_bridge_hpd_notify(struct drm_dp_typec_bridge_dev *typec_bridge_dev,
+					    void *data, enum drm_connector_status status)
+{
+	struct cros_typec_dp_bridge *dp_bridge = data;
+	struct cros_typec_port *typec_port;
+	struct cros_typec_data *typec;
+	struct gpio_desc *mux_gpio;
+	struct device *dev;
+	int val;
+
+	typec = dp_bridge->typec_data;
+	typec_port = typec->ports[0];
+	dev = typec->dev;
+
+	/*
+	 * Some ECs don't notify AP when HPD goes high or low so we have to
+	 * read the EC GPIO that controls the mux to figure out which type-c
+	 * port is connected to DP by the EC.
+	 */
+	mux_gpio = dp_bridge->mux_gpio;
+	if (mux_gpio) {
+		val = gpiod_get_value_cansleep(mux_gpio);
+		if (val < 0) {
+			dev_err(dev, "Failed to read mux gpio for hpd notify\n");
+			return;
+		}
+
+		typec_port = typec->ports[val];
+	}
+
+	/* Proxy the connector status as the HPD state to replay later. */
+	typec_port->hpd_asserted = status == connector_status_connected;
+
+	/* Refresh port state. */
+	schedule_work(&typec->port_work);
+}
+
 static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
 {
 	struct device *dev = typec->dev;
@@ -471,12 +510,21 @@ static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
 	dp_bridge->typec_data = typec;
 
 	dp_bridge->orientation = fwnode_property_read_bool(devnode, "orientation");
+	dp_bridge->mux_gpio = devm_gpiod_get_optional(dev, "mux", GPIOD_ASIS);
+	if (IS_ERR(dp_bridge->mux_gpio))
+		return dev_err_probe(dev, PTR_ERR(dp_bridge->mux_gpio), "failed to get mux gpio\n");
 
 	num_lanes = fwnode_property_count_u32(ep, "data-lanes");
 	if (num_lanes < 0)
 		num_lanes = 4;
 	desc.num_dp_lanes = num_lanes;
 
+	desc.no_hpd = fwnode_property_read_bool(devnode, "no-hpd");
+	if (desc.no_hpd) {
+		desc.hpd_notify = cros_typec_dp_bridge_hpd_notify;
+		desc.hpd_data = dp_bridge;
+	}
+
 	dp_dev = devm_drm_dp_typec_bridge_alloc(dev, &desc);
 	if (IS_ERR(dp_dev))
 		return PTR_ERR(dp_dev);
@@ -582,6 +630,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 				struct ec_response_usb_pd_control_v2 *pd_ctrl)
 {
 	struct cros_typec_port *port = typec->ports[port_num];
+	struct cros_typec_port *muxed_port;
 	struct cros_typec_dp_bridge *dp_bridge = typec->dp_bridge;
 	struct typec_displayport_data dp_data;
 	u32 cable_tbt_vdo;
@@ -589,6 +638,9 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	int ret;
 	enum typec_orientation orientation;
 	bool hpd_asserted = port->mux_flags & USB_PD_MUX_HPD_LVL;
+	bool is_active_port = false;
+	struct gpio_desc *mux_gpio;
+	int val;
 
 	if (typec->pd_ctrl_ver < 2) {
 		dev_err(typec->dev,
@@ -596,15 +648,47 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 		return -ENOTSUPP;
 	}
 
-	/*
-	 * Assume the first port to have HPD asserted is the one muxed to DP
-	 * (i.e. active_port). When there's only one port this delays setting
-	 * the active_port until HPD is asserted, but before that the
-	 * drm_connector looks disconnected so active_port doesn't need to be
-	 * set.
-	 */
-	if (dp_bridge && hpd_asserted && !dp_bridge->active_port)
-		dp_bridge->active_port = port;
+	if (dp_bridge) {
+		/*
+		 * Some ECs don't notify AP when HPD goes high or low so we have to
+		 * read the EC GPIO that controls the mux to figure out which type-c
+		 * port is connected to DP by the EC.
+		 */
+		mux_gpio = dp_bridge->mux_gpio;
+		if (mux_gpio) {
+			/*
+			 * Only read the mux GPIO setting if hpd is asserted
+			 * and we need to change the active_port. Otherwise, an
+			 * active_port is already set and HPD going high or low
+			 * doesn't change the muxed port until DP mode is
+			 * exited.
+			 */
+			if (hpd_asserted && !dp_bridge->active_port) {
+				val = gpiod_get_value_cansleep(mux_gpio);
+				if (val < 0) {
+					dev_err(typec->dev, "Failed to read mux gpio\n");
+					return val;
+				}
+
+				muxed_port = typec->ports[val];
+			}
+		} else {
+			muxed_port = port;
+		}
+
+		/*
+		 * Assume the first port to have HPD asserted is the one muxed
+		 * to DP (i.e. active_port). When there's only one port this
+		 * delays setting the active_port until HPD is asserted, but
+		 * before that the drm_connector looks disconnected so
+		 * active_port doesn't need to be set.
+		 */
+		if (hpd_asserted && !dp_bridge->active_port && muxed_port == port)
+			dp_bridge->active_port = port;
+
+		if (dp_bridge->active_port == port)
+			is_active_port = true;
+	}
 
 	if (!pd_ctrl->dp_mode) {
 		dev_err(typec->dev, "No valid DP mode provided.\n");
@@ -627,7 +711,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 			return ret;
 	}
 
-	if (dp_bridge && dp_bridge->active_port == port) {
+	if (is_active_port) {
 		orientation = TYPEC_ORIENTATION_NORMAL;
 		if (dp_bridge->orientation &&
 		    port->mux_flags & USB_PD_MUX_POLARITY_INVERTED)
@@ -729,6 +813,9 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	}
 
 	dp_enabled = resp.flags & USB_PD_MUX_DP_ENABLED;
+	/* Replay HPD from the GPIO state if EC firmware is broken */
+	if (dp_enabled && port->hpd_asserted)
+		resp.flags |= USB_PD_MUX_HPD_LVL;
 
 	/* No change needs to be made, let's exit early. */
 	if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
index 74d062dc03b2..26565cd77d79 100644
--- a/drivers/platform/chrome/cros_ec_typec.h
+++ b/drivers/platform/chrome/cros_ec_typec.h
@@ -69,6 +69,7 @@ struct cros_typec_port {
 	uint8_t mux_flags;
 	uint8_t role;
 
+	bool hpd_asserted;
 	u32 lane_mapping[NUM_USB_SS];
 	struct typec_altmode *port_altmode[CROS_EC_ALTMODE_MAX];
 
-- 
https://chromeos.dev

