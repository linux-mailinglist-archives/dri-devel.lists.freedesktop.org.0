Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F409577AE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 00:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4783A10E441;
	Mon, 19 Aug 2024 22:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="En+opNyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712F610E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 22:39:15 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2d3dc25b1b5so2738170a91.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724107155; x=1724711955;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qqiNpgy6qhsHsbRqJzjRPUET6f40RWIPa40iMsEsB6U=;
 b=En+opNyurSrsFF2/zY+RMEsdDHRfB/xc55Ew8WczkQZBBrzJJSlaAjP7ll2jzO3j7i
 0WHWkAGLxSah3w/9e+dmb1GfUvQtH/pYJRxKgeKW5jejba+ruYuPsSG1JDAxfiUnYv9g
 y+s+QrBffiCW00FQ8zl7X2ZmTEVyQXlahfYuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724107155; x=1724711955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qqiNpgy6qhsHsbRqJzjRPUET6f40RWIPa40iMsEsB6U=;
 b=XjaTk+2NER5s5reCFAcMKWOuZLqv/72SGNwurFGc98XmoZqiQ7nBgN3Gl/ABeUmCUd
 Enyg0Ad2dxfuUjJRhXtVuNZ4KMgzNrpArHxRJ/CFpfSmA47kUQIv7gP4g7Aulu+8Tf3Z
 w6MdcN8X6aLzFVFinnuxIxXIQ+snoeL17SIbCqx+adN4nlv1WoNWvSNEpOQFwlifJmTb
 MluOz6rNYOFwFLKwqHFZTp66bWnAVX84s5x8FOzm2Ncu7DoBwjsCkgjqTWtIhXWnR0qi
 5VfhJiMFPvIGgoJzqosUqVFjRYXSd0YD4m51cS/3LG2LGfudS9IcsCFXazR1gkMUrf0x
 XjlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+bc1kF6ZLBzHHO3jzdaupmjofbc/JRtLYg6xW2r9bA2E2bIg6BXVqXQO3OuZMwTi6P+8dU6y0fGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx104vAlq1rHmgDE6RjFSpjJyhqPKFrVkFbNdMz9U3HgXgAEdq8
 hPshIa0Bx34D+sYrsm1XK+msoY1QCpmg0XQq2ZwkkzeVzLqHRGvdWfYHO11WvA==
X-Google-Smtp-Source: AGHT+IGbD6wqCEPU07zp1VlQIl5l/bCLG6vLLJV+MCZulU1ILwbw1OtdCfW8oWf+Bxk7YL5dc7qdwQ==
X-Received: by 2002:a17:90a:a887:b0:2c9:81a2:e8da with SMTP id
 98e67ed59e1d1-2d3e03e8cd8mr10769468a91.35.1724107154768; 
 Mon, 19 Aug 2024 15:39:14 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com.
 [34.125.73.210]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2d3eb68d82asm7555063a91.4.2024.08.19.15.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 15:39:14 -0700 (PDT)
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
Subject: [PATCH v3 17/17] platform/chrome: cros_ec_typec: Handle lack of HPD
 information
Date: Mon, 19 Aug 2024 15:38:31 -0700
Message-ID: <20240819223834.2049862-18-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819223834.2049862-1-swboyd@chromium.org>
References: <20240819223834.2049862-1-swboyd@chromium.org>
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

Stash the HPD state in this case whenever the drm_bridge is notified of
a connector status change and kick off the port worker so that the
type-c port state can be re-evaluated. If an analog mux is in use, read
the mux to figure out which type-c port signaled HPD. Once we know which
port is actually signaling HPD, inject that state into the message
received from the EC. This simplifies the rest of the logic as it can
all stay the same with respect to picking the first port to assert HPD,
etc.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 79 +++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b32abd14825c..991361abbc31 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -28,6 +29,8 @@ struct cros_typec_dp_bridge {
 	struct cros_typec_data *typec_data;
 	struct drm_dp_typec_bridge_dev *dev;
 	struct cros_typec_port *active_port;
+	struct gpio_desc *mux_gpio;
+	bool hpd_asserted;
 };
 
 #define DP_PORT_VDO	(DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D)) | \
@@ -429,6 +432,18 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	return ret;
 }
 
+static void cros_typec_dp_bridge_hpd_notify(void *data, enum drm_connector_status status)
+{
+	struct cros_typec_dp_bridge *dp_bridge = data;
+	struct cros_typec_data *typec = dp_bridge->typec_data;
+
+	/* Proxy the connector status as the HPD state to replay later. */
+	dp_bridge->hpd_asserted = status == connector_status_connected;
+
+	/* Refresh port state. */
+	schedule_work(&typec->port_work);
+}
+
 static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
 {
 	struct device *dev = typec->dev;
@@ -445,9 +460,19 @@ static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
 	typec->dp_bridge = dp_bridge;
 	dp_bridge->typec_data = typec;
 
+	dp_bridge->mux_gpio = devm_gpiod_get_optional(dev, "mux", GPIOD_ASIS);
+	if (IS_ERR(dp_bridge->mux_gpio))
+		return dev_err_probe(dev, PTR_ERR(dp_bridge->mux_gpio), "failed to get mux gpio\n");
+
 	dp_dev = devm_drm_dp_typec_bridge_alloc(dev, dev->of_node);
 	if (IS_ERR(dp_dev))
 		return PTR_ERR(dp_dev);
+
+	if (fwnode_property_read_bool(dev_fwnode(dev), "no-hpd")) {
+		drm_dp_typec_bridge_add_hpd_notify(dp_dev, cros_typec_dp_bridge_hpd_notify,
+						   dp_bridge);
+	}
+
 	dp_bridge->dev = dp_dev;
 
 	return devm_drm_dp_typec_bridge_add(dev, dp_dev);
@@ -648,6 +673,59 @@ static int cros_typec_enable_usb4(struct cros_typec_data *typec,
 	return typec_mux_set(port->mux, &port->state);
 }
 
+/* Inject HPD state into the EC's response if EC firmware is broken. */
+static void cros_typec_inject_hpd(struct ec_response_usb_pd_mux_info *resp,
+				  struct cros_typec_port *port,
+				  struct cros_typec_dp_bridge *dp_bridge)
+{
+	struct cros_typec_data *typec = port->typec_data;
+	struct gpio_desc *mux_gpio;
+	int val;
+
+	if (!dp_bridge)
+		return;
+
+	/* Don't need to inject HPD level when DP isn't enabled */
+	if (!(resp->flags & USB_PD_MUX_DP_ENABLED))
+		return;
+
+	/*
+	 * The default setting is HPD deasserted. Ignore if nothing to inject.
+	 */
+	if (!dp_bridge->hpd_asserted)
+		return;
+
+	/*
+	 * Some ECs don't notify AP when HPD goes high or low so we have to
+	 * read the EC GPIO that controls the mux to figure out which type-c
+	 * port is connected to DP by the EC.
+	 */
+	mux_gpio = dp_bridge->mux_gpio;
+	if (!mux_gpio)
+		return;
+
+	/*
+	 * Only read the mux GPIO setting if we need to change the active_port.
+	 * Otherwise, an active_port is already set and HPD going high or low
+	 * doesn't change the muxed port until DP mode is exited.
+	 */
+	if (!dp_bridge->active_port) {
+		val = gpiod_get_value_cansleep(mux_gpio);
+		if (val < 0) {
+			dev_err(typec->dev, "Failed to read mux gpio\n");
+			return;
+		}
+		if (typec->ports[val] != port)
+			return;
+	} else if (port != dp_bridge->active_port) {
+		return;
+	}
+
+	/* Inject HPD from the GPIO state if EC firmware is broken. */
+	if (dp_bridge->hpd_asserted)
+		resp->flags |= USB_PD_MUX_HPD_LVL;
+}
+
 static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 				struct ec_response_usb_pd_control_v2 *pd_ctrl)
 {
@@ -669,6 +747,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			 port_num, ret);
 		return ret;
 	}
+	cros_typec_inject_hpd(&resp, port, dp_bridge);
 
 	/* No change needs to be made, let's exit early. */
 	if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
-- 
https://chromeos.dev

