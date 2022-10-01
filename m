Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16245F1AC7
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 10:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BA210E50D;
	Sat,  1 Oct 2022 08:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EF710E50D
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 08:07:48 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 x32-20020a17090a38a300b00209dced49cfso3554545pjb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=tVRN+SsBdMvLqk2xiEJ4U+qCZXLzKyUiTAK/FAHSFm8=;
 b=fvWn4rIBJQCtt6ZwVXmuLqGTY81bJtEKDrRXtI/bSOnj80wXc7vrV3Ty9/y42ImboE
 aC0X2Htr97s2ylchvP1hFOUFVyeMUc5pEtCOCQ4hHFZKiLueeWn4hCk23kxcOnAvScdv
 IqnT6ulAlG1hTDyLDC9wRKU0kkhWe9RopiGYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tVRN+SsBdMvLqk2xiEJ4U+qCZXLzKyUiTAK/FAHSFm8=;
 b=l3ynq3xcLmhNfzj9FY2jCFiCEjbkjUiacS3ugFyHTBbMlEUbDmhJ70j7wjIKjsyHyq
 5lhePCRu3IFs30Asfd26ZFVxj86GZjNozmDV17cbmG6FC/qvrAPZsxymQK9XkiScriZH
 CtiifOtoqRSQLPxt2mBe4+VwAK+m4B3yd8oEU4VuweKm0O2OES5EsGOle8JpZKsa2s4c
 H+MVCaMOr60FGDBzj+SQzsCXsD8bbae1NBSQ83usb5E+/xg8PNaqwfSODh6uyXYQyCQY
 ci9tRz/ZcBSR1r0lFWtrsFoaxFB19sRBpsS5v9Tfwa3NNvRvqOay6Vl6/HyoZhQdCBCB
 xWkA==
X-Gm-Message-State: ACrzQf1ry6Btrg168/brhYTB1Y9A+4pvqRsckfpw/JeWDBlszAfAoyof
 D2nmoIyqaq+0Je1v2tM5mkvfmA==
X-Google-Smtp-Source: AMsMyM4pczOShl+2vY/8S7j0Y1ekSIr+nCwbK8dbU+DnE2EtOvzK2OuZDmvl7iXQ3yxa4siDhL5qZw==
X-Received: by 2002:a17:902:db0a:b0:178:2636:b6de with SMTP id
 m10-20020a170902db0a00b001782636b6demr12925881plx.58.1664611668496; 
 Sat, 01 Oct 2022 01:07:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
 by smtp.gmail.com with ESMTPSA id
 c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 01:07:48 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v6 02/10] drm: bridge: samsung-dsim: Lookup OF-graph or Child
 node devices
Date: Sat,  1 Oct 2022 13:36:42 +0530
Message-Id: <20221001080650.1007043-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The child devices in MIPI DSI can be binding with OF-graph
and also via child nodes.

The OF-graph interface represents the child devices via
remote and associated endpoint numbers like

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

The child node interface represents the child devices via
conventional child nodes on given DSI parent like

dsi {
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

As Samsung DSIM bridge is common DSI IP across all Exynos DSI
and NXP i.MX8M host controllers, this patch adds support to
lookup the child devices whether its bindings on the associated
host represent OF-graph or child node interfaces.

v6, v5, v4, v3:
* none

v2:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 38 +++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 73dcd825c654..e41b6eeef622 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1356,18 +1356,52 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
 	struct device *dev = dsi->dev;
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

