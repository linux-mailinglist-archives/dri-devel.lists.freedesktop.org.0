Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BD1923D94
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47B910E1EB;
	Tue,  2 Jul 2024 12:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="k07n8/el";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2076.outbound.protection.outlook.com [40.107.103.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7855D10E5D9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:24:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhtG1svESeKV9GNZIe4ULWjucGG3ZxhbtwaE9t3kFmJ3uPbnI1Bxxjg5RyG50zCxZXE/JY0eWoeIHyibjP1nEZmiBUOruJ/qlBERwnUEOUPlTiY2n/Go/4vFGGOZdbMxq5rbseZlRNOrrkJTxvJjMIB5F9a7JIWKwCjIRkDOV8QIWio6cT3351nDgMIgeLyRalmKJLBm1M0htmz16GnCFGgjuDffOhRGK/iwiS3nL7Icc105WqnDV6cnxm4mSOuKWnqUt6jo++Ip2NcnMORpjnOpzr6PrxeeASkE+wDuO6xD9P8q0KcOQsHN7qkzuiZJJnkbaD1XN1awdeZm6RdmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roWjBXpqQ9CSbQWBEY7CJj8qxVM/h3pWvr7OeyIVX8E=;
 b=MdQ3OzO4z0dKC8fVhiyS6gVCJP/rmfWzYTJ3k7th3INUNmZ5NqMEVETb8SvZOVLHcxqgWh4JLMcam/4hxd9epMBJXD1LUnKNOdyfPFQt9e8bLKPiLCFTar34VNxQbR9orlt3m/MjObIh5Zuu5e+kzRS+9op4UoQplUJwCnXPSVN/2zyoeRFoQmH8ddWZT5HyyBAfKKirMCeInp95jBKHaG9H79jbQ5YcjEMOSiVsqEzgGqwyl7mQfkHqNQHuLVIulrE7chnROBvEIuw6XQGCLYSS8zXLmkwIfyoDsjwZXV9/5hM2cEuleDwVzJWuA4ruOKE2LjYydoMJ3tgWJieT2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roWjBXpqQ9CSbQWBEY7CJj8qxVM/h3pWvr7OeyIVX8E=;
 b=k07n8/elEU2/7lMIXiKMy4qnbY8iHgCnVNc2Kn4FxUKXcpwvyMBVrvSI8wADRjn3cNHwQB1CW88Jg76BH8qJgHdekDarCg8JoaHPpkdmT+Ih2i5cUkwysBqp/CD6pfk3UqA1L4+vjuXTY9Zhc2mBT9LhgzUVbvBVGY2EAxfIhgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 12:24:12 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 12:24:12 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v16 3/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Tue,  2 Jul 2024 20:22:35 +0800
Message-Id: <fee3a0ffc47ca29aefec61f476dec950b673bb24.1719903904.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719903904.git.Sandor.yu@nxp.com>
References: <cover.1719903904.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM7PR04MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 63fad24f-b517-4724-05af-08dc9a91e16e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dX3/iUd3kjvGScWo6jbvFeyqXsmGIz1iLvm445SCepJSxuRouRb2rMEGX5Tk?=
 =?us-ascii?Q?+tV71bQl5vPDCzApTUNUV1vNFEjHBDXKCcRcbyA6Y7L0ofioQ8Yby2iyePfw?=
 =?us-ascii?Q?P37826CBWEf1x6NUFfUVyRi2D51WpAWwAJ1BkRUtvzwGp2u/X8tXrOAhz2mE?=
 =?us-ascii?Q?hmdcv02iWuZjivebSmmDMHBG25be3Q8ZcxSdgd+6rna3Gmn1xm31M/C2J5vr?=
 =?us-ascii?Q?5kF4hDYGirVS2NkeDUiFBJ4FPh0Zt644/VEWXznZmaxGNCxPFphWSqbeRBFi?=
 =?us-ascii?Q?lqBU4pMqDN+epFnLDR0KWV8yYSVKpXBdz+60/PagCk+lNcOG2S7KbwV4Upf8?=
 =?us-ascii?Q?FiwkC1Gks29/7aH3RFlKwhRjturrA9k/Iuszf4xK16rczdCrrQHzvUPnv9As?=
 =?us-ascii?Q?yYxCZJJNrRKwPV0TnCNDKtpknbWIzM6EtrtEsc7OeVndtqokAE7R3vtHiEAk?=
 =?us-ascii?Q?xh1Hf1/eBu4KY1g4BP0B7WH1rH/TLbTirzGHWrxQwuBWZZmIqeGjcKiREKVA?=
 =?us-ascii?Q?bG+Byz85PYsLxHaHN7slBJU7ywPo12QLr/GKSitH8y9OVqHTe1aZd8uBOBMX?=
 =?us-ascii?Q?RElCsG6PTOHoT7l9aw+UoNctyMQN5v0SULK2ytCjyOK6NrtSCHy9VRZF1uKz?=
 =?us-ascii?Q?lHV3qlFe3/XyeF5qGRlwNMrXCmYdDXxMuyHnly0nyAxCvzBbLM/fcFIb1Edj?=
 =?us-ascii?Q?NOObqgIdunfpSB2tcT+UGOacgnzgxGHhPRnwgXVh3GDv6XXMV5fRQPu01HPk?=
 =?us-ascii?Q?TeUv7dnjO/AZ6ROhRAaeTc4uFNVCr7mZIEPcXsxYHwZIb3zC6xwEbZEB7CRe?=
 =?us-ascii?Q?dCVmxEcgiNWYqfIMD19uJ9TNjLK0OFooRSARmaq/R1mzWhY/jgXvm700+NS6?=
 =?us-ascii?Q?g4pB5Tj45gSmG1kxe2arPtcRAGwB7x+8ZyuvMXxcE7h66WFs4o/7/pYgUnfO?=
 =?us-ascii?Q?yrK2NnsyI8K7N58qE3afizCXg5DlVLaQtWtSAo92UqsWZApKSN5HXXIhjMta?=
 =?us-ascii?Q?LEWlZjebv3F/wpUMcnhgSFxoGU/d2sC43W7jwLI53JQ/E6kHRg0Qh0umV62z?=
 =?us-ascii?Q?+rqTMoZTlbASTehAgOaDl7OcRb4W+uySbC+a4ymhHdmk6PzOlVJF9aY+3tf0?=
 =?us-ascii?Q?iiz6Q+pB8XKCNcw/iqJaWIzKkYJbBIZuYvUggpJpZ3hMnMPe+seDNKPbhdLr?=
 =?us-ascii?Q?bO93iM8x10m7u1JhibYAoanfBKxh+aOEkL7E0VrU07/dbeHWHvK8WcuNQvZ6?=
 =?us-ascii?Q?ThypsYDhAZ1BVIdJjdACm8k6xto6ed6Cb6fAF4NYMXOKy8g2B/27ZUY4RO9V?=
 =?us-ascii?Q?93N2QEqIcIcblgZ/GrGXnyXT20bGG8SBm0Bom6oFtFmPTMzzZh1e/HqC39pQ?=
 =?us-ascii?Q?yVQjAsx99B7cy9C3yJ2381dWD9pX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+UD12Q3E8dsWvdDw+klw6asEZlA7m9hIBzzxnxQNi/obOgHxplbhrzoQmUk/?=
 =?us-ascii?Q?RWCZZqKF6JquxpknjL/mf5r6kG0WV1dvVXctQR89pkc4JKt+zJnGMESR49gP?=
 =?us-ascii?Q?59sGfdssuxgXq347AwdA3xJI/H0mwWAKnR68HQR2CfWBq93lPu/RMciZ1lwT?=
 =?us-ascii?Q?BhoXMT8jWQIDnDyCrL+8lo+q0dxcuogzpB074t2g1+6+XK13uYxG7fl3zajR?=
 =?us-ascii?Q?DDwNYjM0eyV9jaQjMEqgTO1+LjMk+l/xJ90vh95bqJrHdijGviFa1ZW7TFYD?=
 =?us-ascii?Q?3CdPoRjjLLOHDPGfWjdzlKOvLIPJHyVpGud4SKJbYVy1Vc7vDDqGk/V3OFLT?=
 =?us-ascii?Q?ZnCBNOWsfKE9OM/sngwES1tWlMTqWjPrpOozhga/vCmxfJdFJgPkx3kUceqJ?=
 =?us-ascii?Q?Wpn4+MRrGL0BpQaIsJDGqKuEBMS2SCXVqRnvY7UeXWrhcA1ZgBYtIkzZrXZS?=
 =?us-ascii?Q?zdiBhzymFE6cqMKDepmlcqgVDRwDDIBAITZBWvhU2Vw2Rf7qM3/lhhMkJbpW?=
 =?us-ascii?Q?PvMadBX5x/ACB7NjOJRgIXgeXpIGlLxxhUL2tTyGdrPs/9UA4voTow0OA77U?=
 =?us-ascii?Q?h++1S9mXykFRW/5o6I8aUS6yDofl3XVW+illFPohxSOyfmCmgWmuBRJZ1now?=
 =?us-ascii?Q?qs2ycRbgbOEKpoXtfEwFLEgOqHnJyEn5qnC3C8qo+8XvBG/1qg7iBg/feCUh?=
 =?us-ascii?Q?DmSUmx7tzJtGi9XNwSoIegssv0iZyCbGbDINLCAk6SV0UmGoQqtTLA0jbZ66?=
 =?us-ascii?Q?wQOBOmtNgGJsV2GMb9ZsUAKssiendN0mf+N+M5HK800w++U/rHHe3Of1m0nl?=
 =?us-ascii?Q?23posCvw18M29wdRYjl8jxux8eTriEqgvWi7k1oRyNXrM58lZqI8omEYtAE7?=
 =?us-ascii?Q?FPLB6RmmacMBw+I2PKKT9i+MY+b7290KaAhq0Rt6sdNe+FHN+42u/yUbw6BD?=
 =?us-ascii?Q?p6tQr8UJtWSLEtQ0JVXNVbutZq5kCmUuWchxvR5dUm1MwmxeCiXlBxJAKQdz?=
 =?us-ascii?Q?q6pqGg6BSyC/9YZm+7zK5dF1zk+XejQCWToQ2H4eH3hCP1gH1x81Z+bByh7f?=
 =?us-ascii?Q?cUhmCBW91CnhDETitkbQjJJ8gDVnh0kA/ioADKwfq2V8hlWYWh8PF37odOIf?=
 =?us-ascii?Q?LfBQHpyj4RRWNclZ706BiZZCAxBNXtCvQKdt7dAstu5LwIukmVpihHFEAog9?=
 =?us-ascii?Q?2eLEsWT861w1tVQLxy907aTrOikfNAv/zSiAOudOA1Ha7aa4cW1xWL3sV6rD?=
 =?us-ascii?Q?IPRRgkwZd/cTRzxxxl6V297DiM7ytkzPdGtulInVpAt/7HefEVBMOLkClp1Z?=
 =?us-ascii?Q?7MWnPemZFn1Y8Qbu5MokG9+wCSjXyrDkHpnUO5Jfhf8gis/QxvtQ2RYX72xr?=
 =?us-ascii?Q?m9bnFFzn0ZoR/FNeNyGiIerYDB4RXJW/R7n6L+iGf0ZJXl/Hvx5WCQkbmuWD?=
 =?us-ascii?Q?IY9p57+CEUDmyfK+NEOXGLNS/PT3jh9d8hXzjACi5HtpoEDX6ln2Aztv/i65?=
 =?us-ascii?Q?dKnDAwaZhx4ke/2puQFrRt6jkpKHUgprMuZa/R11pexJv+yRcTNsikZubPWy?=
 =?us-ascii?Q?NciVPlg0w2t0AnqwVENBGXicah+1jWT0+yTq4yI3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fad24f-b517-4724-05af-08dc9a91e16e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 12:24:12.4705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgsEqgOl9D8NKqBvbwbfbgG9iUrBoxaS2mw3RMAAEbQYqq//9n2stL3Z5+4Z2DPtGdUnfDP/e7WszJQc5f7mEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
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

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v9->v16:
 *No change

 .../display/bridge/cdns,mhdp8501.yaml         | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 000000000000..8eff6c24fb87
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

