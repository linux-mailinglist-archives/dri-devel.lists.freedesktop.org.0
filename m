Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE86A99D4
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 15:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A210310E632;
	Fri,  3 Mar 2023 14:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1BC10E632
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 14:52:25 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so6427696pjh.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Mar 2023 06:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=75obg6WaKxGAouYp8L8vU99A5I1ZieLyIbshRx9ot/0=;
 b=nwx3nUHwxYB+MWEpPux9HLvk8V4noZ7L+o+7LujBV5Kj/aMUzpWTVRIoXDVdVIatL8
 PxKHmTzFqu8hHKTC1Y9yr6DnGMfO/UldXSuEx6m7RuJioml+wq0PoBBNuEvEzipmdG01
 y0qaUqzqQ1tzuVji8CliTx1YYQnKk2zjXQlhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=75obg6WaKxGAouYp8L8vU99A5I1ZieLyIbshRx9ot/0=;
 b=UdX7A79SS7ukNd/Oe7gUW7zIfdkoMsCxKDe1MbRP/2/eQ6lqdsTBe6nYWUThppMSsZ
 Ya4MDYs4BC7glNEfbGJc4MNTdW+k2hWZm1Ig1QZ/ecJC8Cg+rStfT/FhbObg9l73Ymq2
 KBNeB7REhFfJxR62ELmKquUwDjXn7kmW6HvRdTsPlMlkVrJ6hAMn4hIqI3rlqA1NYupf
 5Li4dliGQuk+Btc5iBSM91x0vmZFDGPCmgQoHZA2/o2MG89LI02wCu0Xspm/EGShp/H/
 iZb82QHrUbi5p2pJgUCDwGfhQ01uylLmV6g2EDfnpN7/ABXOPqoXTzkHFx1XkL7KbDJ/
 vyNg==
X-Gm-Message-State: AO0yUKXhaSAkKvfDSHggTDXL+omNwgVSGaTkDsH37LcRk2inEEXeUKjo
 26/4w308jOebV1t4IplBknEwiQ==
X-Google-Smtp-Source: AK7set9ddne/co5GxlXg9Z5y/8Uyd9N9Zo8lSmWtNpR1RY239kYYX6ZIxpoVDg7hxSfEjK9DP+o/yw==
X-Received: by 2002:a05:6a20:5487:b0:c6:d37c:2a62 with SMTP id
 i7-20020a056a20548700b000c6d37c2a62mr2981782pzk.11.1677855145441; 
 Fri, 03 Mar 2023 06:52:25 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 06:52:24 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v15 02/16] drm: exynos: dsi: Lookup OF-graph or Child node
 devices
Date: Fri,  3 Mar 2023 20:21:24 +0530
Message-Id: <20230303145138.29233-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In general, for MIPI DSI there are three ways to represent the
pipeline for an upstream bridge to find the connected downstream
panel or bridge.

1. Child panel or bridge as a conventional device tree child node.
2. Child panel or bridge as an OF-graph port node.
3. Child panel or bridge as an OF-graph ports node.

There are three different downstream panels or bridges that are
possible to connect an upstream DSI host bridge - DSI Panel,
DSI Bridge, and I2C-Configured DSI bridge.

An example of the downstream panel represented as a child node,

&dsi {
   compatible = "samsung,exynos5433-mipi-dsi";

   ports {
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

An example of the downstream bridge represented as a port node,

&i2c4 {
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

&dsi {
   compatible = "fsl,imx8mm-mipi-dsim";

   port {
        dsi_in_lcdif: endpoint@0 {
	     reg = <0>;
	     remote-endpoint = <&lcdif_out_dsi>;
	};

	dsi_out_bridge: endpoint@1 {
	     reg = <1>;
	     remote-endpoint = <&bridge_in_dsi>;
	};
   };
};

An example of the downstream bridge represented as a ports node,

&dsi {
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

In, summary it is possible to represent all three downstream slaves
devices using OF-graph port or ports node however only DSI Panel and
DSI Bridge are possible but not possible to represent I2C-Configured
DSI bridge child nodes since I2C-Configure bridges are child of I2C
node, not upstream DSI host bridge and it is must represent them
endpoint port linking.

This indeed means, the OF-graph port or ports representation is
mandatory for I2C-Configured DSI bridges.

This patch tries to add an OF-graph port or ports representation
detection code on top of existing child node detection.

It is possible to replace the entire detection code using existing
drm_of helper drm_of_find_panel_or_bridge but it will break the
Exynos DSI since the pipeline doesn't support OF-graph port or ports
node.

Overall, this patch has a combination of child and OF-graph pipeline
detections in order to support the backward compatibility of Exynos
DSI child node and i.MX8M Mini/Nano/Plus OF-graph port or ports
node pipelines.

This is the first common DSI host bridge driver that needs to support
all possible downstream connection pipeline combinations.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v15:
- droped from drm_of
- added in exynos dsi
- updated commit messages
Changes for v13, v12:
- none
Changes for v11:
- drop extra line
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 38 +++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index df15501b1075..f44a5a702ad5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1470,18 +1470,52 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *remote;
 	struct drm_panel *panel;
 	int ret;
 
-	panel = of_drm_find_panel(device->dev.of_node);
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
+	}
+
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check whether graph presents in the
+	 * device-tree node.
+	 */
+	if (!of_graph_is_present(np))
+		return -ENODEV;
+
+	remote = of_graph_get_remote_node(np, 1, 0);
+
+of_find_panel_or_bridge:
+	if (!remote)
+		return -ENODEV;
+
+	panel = of_drm_find_panel(remote);
 	if (!IS_ERR(panel)) {
 		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
 	} else {
-		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
+		dsi->out_bridge = of_drm_find_bridge(remote);
 		if (!dsi->out_bridge)
 			dsi->out_bridge = ERR_PTR(-EINVAL);
 	}
 
+	of_node_put(remote);
+
 	if (IS_ERR(dsi->out_bridge)) {
 		ret = PTR_ERR(dsi->out_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
-- 
2.25.1

