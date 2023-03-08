Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA466B0EE7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8E310E693;
	Wed,  8 Mar 2023 16:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D3410E693
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:40:32 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id l1so17052984pjt.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+udTIu1ct3G8jeCaDXjf5KrilADcli7EoE7on9WYgu0=;
 b=PqE7wz15JeimxJbi1nS3Z5y1VJWeHTpMNvtbETJBe7hr0bZ7OupYtjzXoib7WXF9gr
 TNQBqrNGHxb7VZnOILg5cb5vq5QonxU2MyavRPGdakUGRDIVPcCCKD83M23FiI9srCgP
 4eFSTlUR3i878tZD3iSuy6txBeBKHtIBDZTCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+udTIu1ct3G8jeCaDXjf5KrilADcli7EoE7on9WYgu0=;
 b=65vfi0pSn52PAZ3Ki20HNiaZe2GqzLiTJ71WZzB9Z5GEl+5GAsEqaA9hRO2PtLwEci
 MUDu6j8FLTQzOdv80eKWYcHB4Hkl0GcCkQnq6sI08wKt0WUktatYNpjH+ydUcMqnEOzA
 /tZtZanNvDHPGA8ERKoFno5XpJ3SyJsyb8Osv4xZRIyGyRSqDFASFDZNC/kWBnpJF5Nn
 Sg1NHVu9OGu+GVv7jop/3Qb9+QCANoKLSeClTtxUseYQqpPqgPDxC6PmWDq2+KIGxhOT
 PPQKBEwMi5Mgb/3qYpi28lIDXeArjQkOB4Y9kKmZyHKWX2Vp8Wze5qHw2AaDjmpVNPPv
 Tuhg==
X-Gm-Message-State: AO0yUKWbBEbtdybxdCUGhGHgp0zJSLwdNZktTseNkq4dhZq2Mbeja1hJ
 8azmx2qu6sVlao4BZF639tz6Mg==
X-Google-Smtp-Source: AK7set94DrWst1cTG4qj6qYVtYEgKPswGeGtyDVSiS+srxpAeVAalvzdisDZENFBAsbZKRkhzC6+4w==
X-Received: by 2002:a17:902:ea11:b0:19c:e05a:ea6 with SMTP id
 s17-20020a170902ea1100b0019ce05a0ea6mr22145963plg.56.1678293631715; 
 Wed, 08 Mar 2023 08:40:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:40:31 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 02/16] drm: exynos: dsi: Lookup OF-graph or Child node
 devices
Date: Wed,  8 Mar 2023 22:09:39 +0530
Message-Id: <20230308163953.28506-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
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

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- collect TB from Marek S
- collect RB from Marek V
- fix multiline comment
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
index df15501b1075..bb0d2502ea02 100644
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
+	/*
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

