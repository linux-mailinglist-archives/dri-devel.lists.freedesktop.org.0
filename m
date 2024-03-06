Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E128733C8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 11:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8B81124F7;
	Wed,  6 Mar 2024 10:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="eWZovwG2";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rYhZgUQ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1781124FA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 10:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1709720217; x=1741256217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SYXuJLH9FFcXEVhHyLPfYAcOMpPiLaLB8rAER9c/HTM=;
 b=eWZovwG2m7rQWbnYzdzlaF6qrOvGEAketCWKq2l3yon+MyHhBJLltBTH
 QcpzyFrz4lEVb0p/z80Jt7dVA38weHjfOSuSHmIduRhG+3dt5m5PVU4X+
 aKcVFlbTlwsP03iWgPl/l35nRLMNvJGi8PEFlQ69287nnnbu9KlOscpMC
 q4BR6SaMWEUZcUuj6IjABsInaUpLVTgMDRo55++UpMtsanqk3URyhHp26
 DU4VMMWbnEiz1E91nzE+Ee9tJzfWaAlM8eJkklgG5Z1R8iYKvA3Pq4etd
 WDOopAYT9hNxzx+YkY/yLzuDT9cH6w3Rxvs/vnhwu7VEbkqD6TpxLjegO Q==;
X-IronPort-AV: E=Sophos;i="6.06,208,1705359600"; d="scan'208";a="35760900"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 06 Mar 2024 11:16:55 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F3FC3170271; Wed,  6 Mar 2024 11:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1709720211; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=SYXuJLH9FFcXEVhHyLPfYAcOMpPiLaLB8rAER9c/HTM=;
 b=rYhZgUQ3x/SFTNW52NjWbD5oKJS9QFl2l4oHmuNiMrbMPKMVrvbw+WcgSNFTzN6K24zCwN
 J2+oOT3KuHyqguogvZyocc21FAPDSgOTG7/dmIkEGbEoh4pe7o8O9WqfuCqv0yvYAf4BId
 dI93sJxQUakxTETPqOZSe1fea5G2DRvoWc5ej5EbhDHMJdnxSJlizrQjMe6DDN4yPb9WtW
 tFOnqbHlsY37DtoBMz6gDnwPHn+6QWpc7ODKa25bS6c63i5sffuVHwJf0gCAt4bd9WX6As
 WlWQZq/RdRrcaCLNqqO5vMZNrV9yZYsmTd5fnj7QGDhqrynItaCMwNiZrR52Wg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandor Yu <Sandor.yu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v15 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Wed,  6 Mar 2024 11:16:20 +0100
Message-Id: <20240306101625.795732-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
References: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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

From: Sandor Yu <Sandor.yu@nxp.com>

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/bridge/cdns,mhdp8501.yaml         | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 0000000000000..8eff6c24fb87f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP8501 DP/HDMI bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  Cadence MHDP8501 DisplayPort/HDMI interface.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mhdp8501
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: MHDP8501 DP/HDMI APB clock.
+
+  phys:
+    maxItems: 1
+    description:
+      phandle to the DP/HDMI PHY
+
+  interrupts:
+    items:
+      - description: Hotplug cable plugin.
+      - description: Hotplug cable plugout.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port from display controller output.
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port to DisplayPort or HDMI connector.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+  - phys
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mhdp: display-bridge@32c00000 {
+        compatible = "fsl,imx8mq-mhdp8501";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        phys = <&mdhp_phy>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                mhdp_in: endpoint {
+                    remote-endpoint = <&dcss_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                mhdp_out: endpoint {
+                    remote-endpoint = <&dp_connector>;
+                };
+            };
+        };
+    };
-- 
2.34.1

