Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AE36CDA4F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 15:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D30410EAAC;
	Wed, 29 Mar 2023 13:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F51310EAAE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:17:52 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso18570912pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 06:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680095872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X83RR+xeESh5armnw5mGiS+y5yBuHI5QecAlLL/Hrnk=;
 b=lCODPpW/6NxhsoH726H+bFRXt5XZc7LKq4hAaV3YeLWK5IMBumMR4yJb/Wt8sExtxK
 puC7UrYd1T7eTsINqVAVPwu88M4f147yZ3A6mk3sksWdq256N61iaKoTgCFzf24/y7Qy
 8PpJKb0ZCbl2HJzucEIc5ef2XK7FWGQcc/Luw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680095872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X83RR+xeESh5armnw5mGiS+y5yBuHI5QecAlLL/Hrnk=;
 b=sMUyQwI4bKy6DHI9TneBu5Zb5+NqD5NkC/4NDYMZRCBwAafyhJ/TYY7nDpnIWzXYJF
 4wjizncu39jvHNEC6a+wcpaKQ1WBM9kE/tBeh4SehnfdqQ26CmK7+aos5tKCli7OdpXa
 bGi3hSbD3b9ArmBRpqvftVlWh6LNW8UMqbbO7Bj/mtOI7DsnlT1lYBbJIe2npvjdIzbW
 tPpYVwNxscpr9M+Y8zX5aDiGKYvuktbJlpstW9ZMxX048DjOZK+5w0dvlIbVSfoLy7NL
 FKoDAhxZQSconnoTzUJr9kszBx9qKUdsJDz0vkhKjxlFN/2dyzuVN+Ro7lwvh3NnRbtb
 uKwg==
X-Gm-Message-State: AAQBX9fxu0fI8/+z5NUtt7y/IBvdOm15atSVQyCdH4bF1Ehr/sqF2dbc
 VEEkdVkq7CKvOsC75yy5XVSKWw==
X-Google-Smtp-Source: AKy350bvnAVlh1xYW9HG76iWL/Smz7l1Nuh3q62WlCnnyB3NpALkEXM8Qt8pTetJI11rS1iXbF3tzg==
X-Received: by 2002:a17:90b:1e43:b0:23d:1b50:1ebe with SMTP id
 pi3-20020a17090b1e4300b0023d1b501ebemr22546115pjb.27.1680095871927; 
 Wed, 29 Mar 2023 06:17:51 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a047:206d:4722:c4fa:e845])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090b071000b0023f5c867f82sm1400192pjz.41.2023.03.29.06.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 06:17:51 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 01/12] drm: of: Lookup if child node has DSI panel or bridge
Date: Wed, 29 Mar 2023 18:46:07 +0530
Message-Id: <20230329131615.1328366-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329131615.1328366-1-jagan@amarulasolutions.com>
References: <20230329131615.1328366-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

An example of the downstream panel represented as a child node:

dsi {
	compatible = "allwinner,sun6i-a31-mipi-dsi";

	port {
	     dsi_in_tcon0: endpoint {
	          remote-endpoint = <tcon0_out_dsi>;
	     };
	};

	panel@0 {
	     compatible = "feixin,k101-im2ba02";
	     reg = <0>;
	};
};

An example of the downstream bridge represented as a port node:

dsi {
       compatible = "allwinner,sun6i-a31-mipi-dsi";

       port {
             dsi_in_tcon0: endpoint@0 {
	          reg = <0>;
		  remote-endpoint = <tcon0_out_dsi>;
	     };

	     dsi_out_bridge: endpoint@1 {
	   	  reg = <1>;
		  remote-endpoint = <&bridge_in_dsi>;
	     };
	};

	bridge: bridge@0 {
             compatible = "chipone,icn6211";
             reg = <0>;

	     ports {
	 	  bridge_in: port@0 {
                         reg = <0>;

                         bridge_in_dsi: endpoint {
                                remote-endpoint = <&dsi_out_bridge>;
                         };
                  };

                  bridge_out: port@1 {
                         reg = <1>;

                         bridge_out_panel: endpoint {
                                remote-endpoint = <&panel_out_bridge>;
                         };
                  };
             };
       };
};

An example of the downstream bridge represented as a ports node:

i2c4 {
       bridge@2c {
	     compatible = "ti,sn65dsi84";

             ports {
                  port@0 {
                         reg = <0>;

                         bridge_in_dsi: endpoint {
                                remote-endpoint = <&dsi_out_bridge>;
                                data-lanes = <1 2>;
                         };
                  };

	          port@2 {
	                 reg = <2>;

                         bridge_out_panel: endpoint {
                                remote-endpoint = <&panel_out_bridge>;
                         };
                  };
             };
       };
};

dsi {
       compatible = "fsl,imx8mm-mipi-dsim";

       ports {
	     port@0 {
	          reg = <0>;

	          dsi_in_lcdif: endpoint@0 {
		         reg = <0>;
		         remote-endpoint = <&lcdif_out_dsi>;
	          };
	     };

	     port@1 {
	          reg = <1>;

	          dsi_out_bridge: endpoint {
		         remote-endpoint = <&bridge_in_dsi>;
	          };
	     };
      };
};

An example of the downstream bridge represented as a child node, but
whose host neither a port nor a ports:

dsi0 {
       compatible = "ste,mcde-dsi";

       panel@0 {
             reg = <0>;
       };
};

In, summary the DSI downstream devices are likely to be Panel, Bridge
and I2C-Configured Bridge.

It is possible to connect all three devices using upstream OF-graph port
or ports node however only Panel and Bridge are possible to connect via
child node but not possible to connect I2C-Configured Bridge via child
node since I2C-Configure bridges are child of I2C not upstream DSI hosts
and it must represent them via port or ports with endpoint linking.

This indeed means, the OF-graph port or ports representation is
mandatory for I2C-Configured DSI bridges.

This patch tries to add an OF-graph port or ports representation
detection code on top of existing child node detection.

Overall, this patch makes use of a single standardized DRM helper
for a given DSI pipeline representing downstream devices as child
or OF-graph port or OF-graph ports node.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v7:
- new patch

 drivers/gpu/drm/drm_of.c | 112 ++++++++++++++++++++++++++++++++-------
 include/drm/drm_of.h     |  12 +++++
 2 files changed, 104 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 177b600895d3..87cfd685318a 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -217,6 +217,35 @@ int drm_of_encoder_active_endpoint(struct device_node *node,
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
@@ -239,7 +268,6 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_panel **panel,
 				struct drm_bridge **bridge)
 {
-	int ret = -EPROBE_DEFER;
 	struct device_node *remote;
 
 	if (!panel && !bridge)
@@ -260,30 +288,74 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
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
index 082a6e980d01..5e0d958121ce 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -49,6 +49,10 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
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
@@ -101,6 +105,14 @@ static inline int drm_of_find_panel_or_bridge(const struct device_node *np,
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

