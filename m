Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBACB7C7C02
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 05:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC0D10E58F;
	Fri, 13 Oct 2023 03:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061.outbound.protection.outlook.com [40.107.105.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6131B10E58F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 03:25:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCfM6ZlDlWTP4Q0CrqEzeJYlOznrG7Tao78gGvNSEtHAoiROA3HaglzDjna5L2HdRV7P9g1HduNV2nZn7bMNpOxXvcGek8X2sMkOeIQuGgn4ou1FIJfPeFfG0+v9Jb746JVP+xAMvtbzu7R1pt68fO3rEzF8oXiLpuYM/3u/JgsrPFcPozl+/n18oTb/cDs3rqufl8b0tyT1dBh6RC492dnbZc9HQxGj1+Jebm+t5wy5kY/jZIlVuLhmFtgJfYkvoHzmk+TXlnY/sPgi7hwQrRRiZUAUS/OlGRaH8HAYZsRw2PyBIl1FB+jq/55ATCjV1oDmY54UK54E4oKW/Rd5Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vBEwotyLrsPJ3kBb/DvSPFe0GtrkZjwF473uYQNiMM=;
 b=nKwCDdzwx0dgOj8+oLvml8P3l+dLppJYHJeMQrMsBF3L1Xux81qojb7DZUFJ0XyzXm2IM3VGvXlO6FGBCHFzRrHWxKLGyqEuqA0TT4WwslXpbrZV9vz5F0cF37ZZF/C5s+lXHcphOOAjvGhPIeWaWjlk0HosKwZQilEWCUhDfCwlihHvx4dnwDmHFJgPMls/3kWL0UsuTeqcKeHRgHQfSMwFGYGV+/F6j0dVvbn6KbehZmprveXaVRzmDP5JiCJYypzzrb0rqNmcMU2Gn6hpct2Ri8685iE0Vam+njf3vK7NQP7bbUybQmQvKlCwMRNg9+bV64qYaUyezLIyrmUySA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vBEwotyLrsPJ3kBb/DvSPFe0GtrkZjwF473uYQNiMM=;
 b=WctbGJuMg8Ny22LJ+jCTD+zVxSirQekfaCNQjz3npR0eV4vh90tNbsZU8jZpkCaXWaJ0hXFgefBfmMWDnjYy4kzO6mgcyVu4wqVd7WLh6SX4hOLn0CuQlxFMI1YdJXBTkKJOG7k0WK3S9zfxZEY8+/BI8jB90PGXEYrC73kjPrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM0PR04MB6978.eurprd04.prod.outlook.com (2603:10a6:208:17d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 03:25:54 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 03:25:54 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v10 3/7] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Fri, 13 Oct 2023 11:24:22 +0800
Message-Id: <5f4149da672773ed5386c3c20cfde1276ab5b0d3.1697162990.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697162990.git.Sandor.yu@nxp.com>
References: <cover.1697162990.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM0PR04MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e2bc07d-4437-42ed-1f9f-08dbcb9c1ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljBzN9Jn/2Z7HxdOGHltmTNZ2j7Ba6vBXiupH+PuY/bbQ8+y7k2YYtV2W75dm5Xg+kwBcPxcnVDF78yWmkxS9XfX91PYzBC4Sq+Q+G+n4dMf4TY/WVqrJBBMqxP7d3KJFHgNaymM1oMma5r5WJ0KuZGrsOExZNPjvGfUOTk764rpKmk34OP+/TT20M3WVswKwUI5+FT073WpO90khprlQYo+11A6GMXTXzU+MrZQLehJmBHuC+XzEJPT8EOp1QmvHsGSZbSTaLOzueYLIjP6bhpqBNOn+Oq4UByJzecHOvuaFEompzLfJsbfcXZDyPhd6vej50b5Dxna2+cI3O0Ia3miccUZi7uApxDU6uAKZc3kRaZ+Iza0Rdfk6Eba/tveZwt5YVmLKVaVB1F8m2JlnESPf/V5Rd/Ofu1dRLUCVVxDuaY7rfI4lprFoxjMMtj0yoAYDaMHDcr7bay2m3qMl9ONUUBEfM0T6W+ppoW3swUgfcpTAUNFQOiTvRTtEcRwK++uqc5FkThxkM6nQDOlu6kCiQzSPsDZmY7FEjIEkNR9NlVOEQ8oUxtHIBGhGwnDO6cKdiAq8dZlIibi6yL0x25o4l7OtsQTD2bGhVXPYDhNGBTwzpsVN+mgaYiuhuB7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(86362001)(7416002)(921005)(36756003)(2906002)(38350700002)(38100700002)(41300700001)(52116002)(6666004)(6506007)(6512007)(8936002)(8676002)(5660300002)(478600001)(966005)(6486002)(66946007)(66556008)(66476007)(316002)(26005)(4326008)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SvrddLtt0utH0SJzIyLq0jk+ohpr/qfhLbP0nYRnmHeJxUmne9Cqskbrc1/9?=
 =?us-ascii?Q?+a/WqztpbBnkoges3ZxiInGxStiKsLMw4614S9Aaem4hxvKlaeoqm8vJ9J90?=
 =?us-ascii?Q?AkqIuDvxvl2F80sZ1Uql8mfrdSfQKqHqEtre0UFzQOUH5SZYo0XAXY4itIZ3?=
 =?us-ascii?Q?FxvVeTJsKTZm7deESmIq0ZjRmrI0zuQ8vVqEji3DucBmeC81Ow0t4mQ/i9Hg?=
 =?us-ascii?Q?yThUa6Se5A8COmXnXwUPIE2aVBv8n/TxTRAi7yWqa1owT49JNIR8dpFtaFZx?=
 =?us-ascii?Q?i618z/k9vON8y7lih/mPIyUNhsbGVjORsFSV1Td5XB6SDshV8WAbsk7lspki?=
 =?us-ascii?Q?oqL+OZAcldrXHmrF8+MDoJyQoyq7egUSMsjN3tqowFQCMGdHuNxysFTQK/9g?=
 =?us-ascii?Q?nVmfFZoTYUXbjaN+d1+eI6B1Qyg40f5gnauoM66zsQOPi7EKe+dH5j/mhkiw?=
 =?us-ascii?Q?ZfdrW6KybV6bMCy0KgMr8OYSbXhYUdoCpXv0JvAM40nbT5XK+M+Er3eOrBpv?=
 =?us-ascii?Q?beCGtPYkXWHmp8/ANs9CNy82nEEbDOxAEx6uZT3m/CPyZIexW3b+ueJuuG+2?=
 =?us-ascii?Q?zJKviWU5Wxz+YGZL+OVw3KCsi4nOZUDInvIr/p/1HxadkXdEOfu3AXNQwRVd?=
 =?us-ascii?Q?Fn8TYPuBmA5kvQ+t6JQGyseUKwTvLZ10d66/hIAeZ+N3glbb6Z77yE/B0XI7?=
 =?us-ascii?Q?CnRGSgNp8Z86Tj9FGcfNfUQOl91J8Veg93487LMQL7h8TvyPZKEMTWwKRydU?=
 =?us-ascii?Q?1slfpt9uZQLKagodfGOOTrzUo/G75yj8LGJUpbSod4xwuvSrk2SlMNPLMKnT?=
 =?us-ascii?Q?8dzn9GhhYqydq2zuyLkVrhjL3unYArWI0PtK1p2yMpbDYrK4B82sCnpcXXfK?=
 =?us-ascii?Q?f43GgEqduwp4CW/YtR3uIf20QqWi5lPapZtDF9dv5wg3fhTQtSDVDRk9xMmR?=
 =?us-ascii?Q?MqKJzeAXvl7J2W/58iAOECcFLAzpfPLk43x6a9mz+3h35w/kmRdRwakLQzxC?=
 =?us-ascii?Q?ulYgYbHOKuLP2tFq1R8FVzrgSU6BuKRKyCdsMvS8FmwF4e27YlnYNrKG0k9c?=
 =?us-ascii?Q?wUGiFiBYyazQda209WRAUM65b+1hAuju49rplkX+zNTmve79YZC6vMJMJXlk?=
 =?us-ascii?Q?vRKv361QevV9wxiHv1PIgYbjIkZdz02kYHEdhtSqvVO3G0XpP7frZITIbqDX?=
 =?us-ascii?Q?PEcoWymJyDLUSfOGB2DzhfV9NUHZc4C3r/cBFheytSqBN7H86m0iG5Bnjog3?=
 =?us-ascii?Q?ttlGF69AcDDIENrzL8K4rtsEExd3qjgNpyQNgT1Dqya9z7Q/rVJwe0xIBkG9?=
 =?us-ascii?Q?XV9OLAembdfYFzK+H2A4BB4g136UexBYuHOYVIYL18DBR9z8FYPZnZjbw7jD?=
 =?us-ascii?Q?UhhAsc5KtCHgY/TkPOFvRORJ7F17g+a9o8UNaJLvXPfdHoVt3Z28c97pvafN?=
 =?us-ascii?Q?Ax+w2rH3ofCpy18R7Uwl+Vz8p4eaKsi91QDuAD7VGSyBgY/zYsNIP6ePR84M?=
 =?us-ascii?Q?p+qwFI7T+XgLj3BI2/urLIjdhoOzIyv5B9uhw14sjOMiaHJTN4mRNaJLnxTD?=
 =?us-ascii?Q?2wa2PTdMfeaFItL4+NC/v3YAEtNxWaiR3vh7t7HH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2bc07d-4437-42ed-1f9f-08dbcb9c1ba1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 03:25:54.3593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3eiuVyKiE1CiZVCDYnO7AE4c4TL0nriZi05jsOBjbG9n1oSncwcGxOgPVhbQxucgtiLdHPeZqPS3K84AjIJwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6978
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-imx@nxp.com,
 kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v9->v10:
 *No change.

 .../display/bridge/cdns,mhdp8501.yaml         | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 0000000000000..3ae643845cfee
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
+      phandle to the DisplayPort or HDMI PHY
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
+        phys = <&dp_phy>;
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

