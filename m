Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA06967496
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 06:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C805710E174;
	Sun,  1 Sep 2024 04:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TAPXIF8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79C410E179
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 04:07:17 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2023dd9b86aso24222575ad.1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2024 21:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725163637; x=1725768437;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EnT+TkOPiwvRqtG4XdBzNIXwEpZ2e3WbsaKfU3N0MOw=;
 b=TAPXIF8zHnoxBRxYh5Jzor8GiaUcBmm851XML65lJAByT4kWL7Wr48PKOmPYcuDm23
 ILAqbGUsk8ivXDe5nHCI+jeb0w2NsSKmqmLuq9JjXgnhM41EEPrh5JIdmrpwFSjiG3EN
 Rr5fA3AmoYreyxTdsIV41EqFlCv7HFo0eiZAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725163637; x=1725768437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EnT+TkOPiwvRqtG4XdBzNIXwEpZ2e3WbsaKfU3N0MOw=;
 b=cgPC7iiTVdbxAkD7xdhTM9n5z66JBRFYAoI3rXzz3+WVnXew8LjlIvxqIoUjl6HJyI
 F7znrGSsERMmjL68o0EPTEg0Slv+YzC8qnr6wrUuAwbi3dYD2VgT3QBkKPTHZPbafdas
 C807z9VyrUdqe6tIB8R4YIoq0kdm474mkSGEqBKdXjA6h/69stDHYNZ7bY36vBNHfmcN
 nAjpsLFM6UapEA/thSZvmpa7hgyfUffFQyIQwtTlPVmvehghXRzO6soKSHENKB/7pN9h
 EbfDjNeoHNc46aZgbn+lk3FF/s/tX6x0loW8NvSGzXAs7nn3IJdhCed/K5UGf9uFzHKw
 ztkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWodOwAzheea7ttZyCembKArwBdbgrUFCwy4upRdiWcoYsI2KTrLQlgqA4Wn3pQpuI09VPb3rO+Kb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ1Tf9rpJnRbHJWuvuv5N0uI8IdgqQBQBrbPREEkhUyp3Lyjiu
 LB+PqqlWDFy8pBiFaym4OLZFuQcag9mlshX0h6pW64BNsDO7ayLl0piIQYN7Ow==
X-Google-Smtp-Source: AGHT+IFy6qneRh0JJN2K30z3cDl+DrJ4fLZ39NN7FVzA1lAH0njyn66SGUGcS/pbvoFHuvYriZC5zA==
X-Received: by 2002:a17:903:1209:b0:1fa:1dd8:947a with SMTP id
 d9443c01a7336-2050c40deccmr100312495ad.46.1725163637193; 
 Sat, 31 Aug 2024 21:07:17 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-205152b12c7sm46853475ad.56.2024.08.31.21.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Aug 2024 21:07:16 -0700 (PDT)
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
Subject: [PATCH v4 07/18] drm/bridge: dp_typec: Support USB Type-C orientation
Date: Sat, 31 Aug 2024 21:06:45 -0700
Message-ID: <20240901040658.157425-8-swboyd@chromium.org>
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

Register an orientation switch for each type-c output node to support
flipping the lane mapping when the port is in reverse orientation. Only
do this when the orientation-switch property is present. This is mostly
useful for the case where the DP lanes are directly connected to the
usb-c-connector and the device doesn't have an orientation switch wired
down on the board between the connector and the DP controller.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 77 +++++++++++++++++++++----
 1 file changed, 66 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 32565f88ade7..d2832e6481d7 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -47,12 +47,16 @@ struct drm_dp_typec_bridge_data;
 /**
  * struct drm_dp_typec_bridge_typec_port - USB type-c port associated with DP bridge
  * @lane_mapping: Physical (array index) to logical (array value) USB type-C lane mapping
+ * @orientation: Orientation of USB type-c port
  * @mode_switch: DP altmode switch
+ * @orientation_switch: USB type-c orientation switch
  * @typec_data: Back pointer to type-c bridge data
  */
 struct drm_dp_typec_bridge_typec_port {
 	u32 lane_mapping[NUM_USB_SS];
+	enum typec_orientation orientation;
 	struct typec_mux_dev *mode_switch;
+	struct typec_switch_dev *orientation_switch;
 	struct drm_dp_typec_bridge_data *typec_data;
 };
 
@@ -378,17 +382,35 @@ static int dp_lane_to_typec_lane(enum dp_lane lane)
 	return -EINVAL;
 }
 
-static int typec_to_dp_lane(enum usb_ss_lane lane)
+static int typec_to_dp_lane(enum usb_ss_lane lane,
+			    enum typec_orientation orientation)
 {
-	switch (lane) {
-	case USB_SSRX1:
-		return DP_ML3;
-	case USB_SSTX1:
-		return DP_ML2;
-	case USB_SSTX2:
-		return DP_ML0;
-	case USB_SSRX2:
-		return DP_ML1;
+	switch (orientation) {
+	case TYPEC_ORIENTATION_NONE:
+	case TYPEC_ORIENTATION_NORMAL:
+		switch (lane) {
+		case USB_SSRX1:
+			return DP_ML3;
+		case USB_SSTX1:
+			return DP_ML2;
+		case USB_SSTX2:
+			return DP_ML0;
+		case USB_SSRX2:
+			return DP_ML1;
+		}
+		break;
+	case TYPEC_ORIENTATION_REVERSE:
+		switch (lane) {
+		case USB_SSRX1:
+			return DP_ML0;
+		case USB_SSTX1:
+			return DP_ML1;
+		case USB_SSTX2:
+			return DP_ML3;
+		case USB_SSRX2:
+			return DP_ML2;
+		}
+		break;
 	}
 
 	return -EINVAL;
@@ -413,6 +435,7 @@ drm_dp_typec_bridge_assign_pins(struct drm_dp_typec_bridge_dev *typec_bridge_dev
 				u32 conf,
 				struct drm_dp_typec_bridge_typec_port *port)
 {
+	enum typec_orientation orientation = port->orientation;
 	enum usb_ss_lane *lane_mapping = port->lane_mapping;
 	struct auxiliary_device *adev = &typec_bridge_dev->adev;
 	struct drm_aux_hpd_bridge_data *hpd_data = auxiliary_get_drvdata(adev);
@@ -448,7 +471,7 @@ drm_dp_typec_bridge_assign_pins(struct drm_dp_typec_bridge_dev *typec_bridge_dev
 		typec_lane = lane_mapping[typec_lane];
 
 		/* Map logical type-c lane to logical DP lane */
-		dp_lanes[i] = typec_to_dp_lane(typec_lane);
+		dp_lanes[i] = typec_to_dp_lane(typec_lane, orientation);
 	}
 
 	return 0;
@@ -496,6 +519,23 @@ static const struct drm_bridge_funcs drm_dp_typec_bridge_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 };
 
+static int drm_dp_typec_bridge_orientation_set(struct typec_switch_dev *sw,
+					       enum typec_orientation orientation)
+{
+	struct drm_dp_typec_bridge_typec_port *port;
+
+	/*
+	 * Lane remapping is in drm_dp_typec_bridge_mode_switch_set(). Whenever
+	 * an orientation changes the mode will switch in and out of DP mode,
+	 * HPD will deassert and reassert so that
+	 * drm_dp_typec_bridge_atomic_check() sees the proper state.
+	 */
+	port = typec_switch_get_drvdata(sw);
+	port->orientation = orientation;
+
+	return 0;
+}
+
 static int
 drm_dp_typec_bridge_mode_switch_set(struct typec_mux_dev *mode_switch,
 				    struct typec_mux_state *state)
@@ -544,7 +584,9 @@ drm_dp_typec_bridge_probe_typec_ports(struct drm_dp_typec_bridge_data *typec_dat
 	struct drm_dp_typec_bridge_typec_port *port;
 	size_t num_ports = typec_bridge_dev->num_typec_ports;
 	struct typec_mux_desc mode_switch_desc = { };
+	struct typec_switch_desc orientation_switch_desc = { };
 	struct fwnode_handle *fwnode;
+	bool orientation = of_property_read_bool(np, "orientation-switch");
 	const char *name;
 
 	port = devm_kcalloc(dev, num_ports, sizeof(*port), GFP_KERNEL);
@@ -587,6 +629,19 @@ drm_dp_typec_bridge_probe_typec_ports(struct drm_dp_typec_bridge_data *typec_dat
 			return PTR_ERR(port->mode_switch);
 		}
 
+		if (orientation) {
+			orientation_switch_desc.set = drm_dp_typec_bridge_orientation_set,
+			orientation_switch_desc.fwnode = fwnode;
+			orientation_switch_desc.drvdata = port;
+			orientation_switch_desc.name = name;
+			port->orientation_switch = typec_switch_register(dev,
+									 &orientation_switch_desc);
+			if (IS_ERR(port->orientation_switch)) {
+				kfree(name);
+				return PTR_ERR(port->orientation_switch);
+			}
+		}
+
 		kfree(name);
 		port++;
 	}
-- 
https://chromeos.dev

