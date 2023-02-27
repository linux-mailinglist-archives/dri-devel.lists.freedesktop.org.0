Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547676A480F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 18:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F2510E1A5;
	Mon, 27 Feb 2023 17:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A7C10E1A5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 17:32:57 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id p6so6643466plf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 09:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H0PG1U4rnB+Ux7NI0bDnLcmfUpG6Dhmd6/T4JTeOSQk=;
 b=FZHhI6h2B+ZzYPSvC+ANI8UQwnNElzReNiwquHO34fgdTzzBDksEG2Vhifm8s4RUml
 ngXqHX8KKg6Oc4eAdpF8EAHZ7dEhuKFHu1dNHloQjlIgpS8qmNFat8wNw2kNfMv0QaPa
 CfNXujq6yIUy8zjEncOGam+zHk0EonruVCuFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H0PG1U4rnB+Ux7NI0bDnLcmfUpG6Dhmd6/T4JTeOSQk=;
 b=SS+9drZ03dQ0F+mXsiBOmoew+/oYVof39b1NLFttgiQbPQheKMm2O6ZZ86uNtmOGp3
 n5S4LutyAZMl0A2zstWU5DQgdiUjmYs5NHRZR0aScqC9yUGdSZoqBhituUhj50D+yPu2
 +2DkUB9OD6yBpSedNX/5UyJzV78eufFzrV4OXpLohkeyq3FuBGIsDx2EKAJ7kTiRw2c4
 ZGXxKy4AttILmDQX1JoV0QK9zyuwv3gKRKOT9S9LvwptMaw0WLWAHQ5B6IFsKHX6BeLo
 KyBOt3mt0fKMdclYHY4YV5yzTWGTC3+ePJlKkuHH43NJjGDhnARvaGAnW/thzAwdgr3t
 Gqcw==
X-Gm-Message-State: AO0yUKWrzGptnipM+oB2iHfrtA3vP2XIiqpQnVG0JbmwklU0vnCI9Hzm
 uhqCyzeKGy47SIv4xH5JODH5LQ==
X-Google-Smtp-Source: AK7set/Eirb8+aWvfHxK7GeZMadWntTaxO2TqdlhiXydaVfzzKwpinBqCpGL6pJoO6r2G2g29wsqkw==
X-Received: by 2002:a05:6a20:728c:b0:cc:ce95:7daf with SMTP id
 o12-20020a056a20728c00b000ccce957dafmr111718pzk.53.1677519177518; 
 Mon, 27 Feb 2023 09:32:57 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a1ce:9be1:7461:c30:b70a])
 by smtp.gmail.com with ESMTPSA id
 a63-20020a639042000000b004fbb48e3e5csm4308881pge.77.2023.02.27.09.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:32:56 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v14 1/3] drm: of: Lookup if child node has DSI panel or bridge
Date: Mon, 27 Feb 2023 23:02:29 +0530
Message-Id: <20230227173231.950107-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula <linux-amarula@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Devices can also be child nodes when we also control that device
through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).

Unlike the drm_of_find_panel_or_bridge helper it requires a special
case to lookup a child node of the given parent that isn't either
port or ports.

Lookup for a child DSI node of the given parent that isn't either
port or ports. If it is found then it will directly find the panel
or bridge otherwise lookup for the child node with a given port and
endpoint number as drm_of_find_panel_or_bridge does.

Supporting this feature via existing drm_of_find_panel_or_bridge
found several issues while handling usecases.

Here is the previously failed attempt of similar and the same has
been reverted later.

commit <80253168dbfd> ("drm: of: Lookup if child node has panel or bridge")

So, add a separate helper to handle this DSI use case.

Example OF graph representation of DSI host, which has port but
not has ports and has child panel node.

dsi {
	compatible = "allwinner,sun6i-a31-mipi-dsi";
	#address-cells = <1>;
	#size-cells = <0>;

	port {
		dsi_in_tcon0: endpoint {
			remote-endpoint = <tcon0_out_dsi>;
	};

	panel@0 {
		reg = <0>;
	};
};

Example OF graph representation of DSI host, which has ports but
not has port and has child panel node.

dsi {
        compatible = "samsung,exynos5433-mipi-dsi";
        #address-cells = <1>;
        #size-cells = <0>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			reg = <0>;

                	dsi_to_mic: endpoint {
                        	remote-endpoint = <&mic_to_dsi>;
                	};
                };
        };

        panel@0 {
                reg = <0>;
        };
};

Example OF graph representation of DSI host, which has neither a port
nor a ports but has child panel node.

dsi0 {
	compatible = "ste,mcde-dsi";
	#address-cells = <1>;
	#size-cells = <0>;

	panel@0 {
		reg = <0>;
	};
};

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v14, v13, v12:
- none
Changes for v11:
- drop extra line
Changes for v10:
- new patch

 drivers/gpu/drm/drm_of.c | 112 ++++++++++++++++++++++++++++++++-------
 include/drm/drm_of.h     |  12 +++++
 2 files changed, 104 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 7bbcb999bb75..e165951e3545 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -216,6 +216,35 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
 
+static int of_drm_find_panel_or_bridge(struct device_node *remote,
+				       struct drm_panel **panel,
+				       struct drm_bridge **bridge)
+{
+	int ret = -EPROBE_DEFER;
+
+	if (panel) {
+		*panel = of_drm_find_panel(remote);
+		if (!IS_ERR(*panel))
+			ret = 0;
+		else
+			*panel = NULL;
+	}
+
+	/* No panel found yet, check for a bridge next. */
+	if (bridge) {
+		if (ret) {
+			*bridge = of_drm_find_bridge(remote);
+			if (*bridge)
+				ret = 0;
+		} else {
+			*bridge = NULL;
+		}
+	}
+
+	of_node_put(remote);
+	return ret;
+}
+
 /**
  * drm_of_find_panel_or_bridge - return connected panel or bridge device
  * @np: device tree node containing encoder output ports
@@ -238,7 +267,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge)
 {
-	int ret = -EPROBE_DEFER;
 	struct device_node *remote;
 
 	if (!panel && !bridge)
@@ -259,30 +287,74 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 	if (!remote)
 		return -ENODEV;
 
-	if (panel) {
-		*panel = of_drm_find_panel(remote);
-		if (!IS_ERR(*panel))
-			ret = 0;
-		else
-			*panel = NULL;
-	}
+	return of_drm_find_panel_or_bridge(remote, panel, bridge);
+}
+EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
 
-	/* No panel found yet, check for a bridge next. */
-	if (bridge) {
-		if (ret) {
-			*bridge = of_drm_find_bridge(remote);
-			if (*bridge)
-				ret = 0;
-		} else {
-			*bridge = NULL;
-		}
+/**
+ * drm_of_dsi_find_panel_or_bridge - return connected DSI panel or bridge device
+ * @np: device tree node containing encoder output ports
+ * @port: port in the device tree node
+ * @endpoint: endpoint in the device tree node
+ * @panel: pointer to hold returned drm_panel
+ * @bridge: pointer to hold returned drm_bridge
+ *
+ * Lookup for a child DSI node of the given parent that isn't either port
+ * or ports. If it is found then it will directly find the panel or bridge
+ * otherwise lookup for the child node with a given port and endpoint number
+ * as drm_of_find_panel_or_bridge does.
+ *
+ * Lookup a given child DSI node or a DT node's port and endpoint number,
+ * find the connected node and return either the associated struct drm_panel
+ * or drm_bridge device. Either @panel or @bridge must not be NULL.
+ *
+ * Returns zero if successful, or one of the standard error codes if it fails.
+ */
+int drm_of_dsi_find_panel_or_bridge(const struct device_node *np,
+				    int port, int endpoint,
+				    struct drm_panel **panel,
+				    struct drm_bridge **bridge)
+{
+	struct device_node *remote;
+
+	if (!panel && !bridge)
+		return -EINVAL;
+	if (panel)
+		*panel = NULL;
 
+	/**
+	 * Devices can also be child nodes when we also control that device
+	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
+	 *
+	 * Lookup for a child node of the given parent that isn't either port
+	 * or ports.
+	 */
+	for_each_available_child_of_node(np, remote) {
+		if (of_node_name_eq(remote, "port") ||
+		    of_node_name_eq(remote, "ports"))
+			continue;
+
+		goto of_find_panel_or_bridge;
 	}
 
-	of_node_put(remote);
-	return ret;
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return -ENODEV;
+
+	remote = of_graph_get_remote_node(np, port, endpoint);
+
+of_find_panel_or_bridge:
+	if (!remote)
+		return -ENODEV;
+
+	return of_drm_find_panel_or_bridge(remote, panel, bridge);
 }
-EXPORT_SYMBOL_GPL(drm_of_find_panel_or_bridge);
+EXPORT_SYMBOL_GPL(drm_of_dsi_find_panel_or_bridge);
 
 enum drm_of_lvds_pixels {
 	DRM_OF_LVDS_EVEN = BIT(0),
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 10ab58c40746..7a97157c1fa0 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -47,6 +47,10 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				int port, int endpoint,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge);
+int drm_of_dsi_find_panel_or_bridge(const struct device_node *np,
+				    int port, int endpoint,
+				    struct drm_panel **panel,
+				    struct drm_bridge **bridge);
 int drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 					  const struct device_node *port2);
 int drm_of_lvds_get_data_mapping(const struct device_node *port);
@@ -99,6 +103,14 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
 	return -EINVAL;
 }
 
+static inline int drm_of_dsi_find_panel_or_bridge(const struct device_node *np,
+						  int port, int endpoint,
+						  struct drm_panel **panel,
+						  struct drm_bridge **bridge)
+{
+	return -EINVAL;
+}
+
 static inline int
 drm_of_lvds_get_dual_link_pixel_order(const struct device_node *port1,
 				      const struct device_node *port2)
-- 
2.25.1

