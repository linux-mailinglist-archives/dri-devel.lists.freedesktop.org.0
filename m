Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE0631A33
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 08:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F4A10E14C;
	Mon, 21 Nov 2022 07:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130072.outbound.protection.outlook.com [40.107.13.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8E510E146
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axoOL8txmmJhFxK5nxv+AsR97ghqRLyHq3/lSlE67oImp5ynuZnujShcN0JmVlYXoW42WYp0xBGHoDH5OkbnEy5f3/PI8nmqXl/GFgSr9JOLfNBpYZI9TVYdV1xLBPjHLKXdyLCtY2XUFJLdZm/o4BOjQLz0xihav+5r/GoWNRicYIeiZkKdUCpx7My5zuIa6HieNTrSiBULK8rZoXePDwNkxNTHDUtZq0gKlU0Pn0xq4aSbqspLA2kA9yZdv4/dr+Pa5QODaBsJ5Xoa2MC3VOFQ4SKi34uNO5NUDLCOiohSlsLWf6+5Og9zL46QW8hBgaW1EA8wORh44fPRmPbt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH3voCuq35A/PdRJVKCJ4L56DgSWpqFlC8gP/Wds8dQ=;
 b=M6D2KF/MQhuRKVSkYS7dOIlJc//3wh3gtHbJJwlY/YZvCV+ddEA+N7Uc3sZta/a7/ZulUL0665q3yapPb6KeaezV1NtP6AnF0yFqtDieT3eRduMX/bt9eBxRqmsNQKmFlM1XlZEOyC52rnxc2Iz3YRTs2Zot1bJc1iNjyoKdXB/JERp5i8k+B0IVdJx7XGAvD1J2XdhXhbLN5kLn499NPkBSk1Mjrc+YcCj9WOgevj/Mv+c2Bt/S3QsQcrRVCz053aSTHQW71G6qsswdDABh8sau+InLJAA7Baf/B2+xaO5A4QxeulMKfwREEbiux6IWyjCYL0RPndqYsM14PZJTNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH3voCuq35A/PdRJVKCJ4L56DgSWpqFlC8gP/Wds8dQ=;
 b=nCFCnKIxWbSWoLbJGlgF+pnwmcDOgzGqkz3CuhHUAM9nFeSDrr0y1aLjlY/54Drnu2pCu11yXLIxDUbUD8lmmZ6fvnWh6M0UUNfxSPUFx7bUYvHE7AX0h4slEbgAm82I8dQTH/NO6Yfuo+LiKdyW0egCTlTDT/fHxa+IF/5GBHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DBBPR04MB7769.eurprd04.prod.outlook.com (2603:10a6:10:1e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:27:07 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:27:07 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, kishon@ti.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 alexander.stein@ew.tq-group.com
Subject: [PATCH v4 02/10] dt-bindings: display: bridge: Add MHDP DP for i.MX8MQ
Date: Mon, 21 Nov 2022 15:23:52 +0800
Message-Id: <f09833038399e4ed0ff845724fc99bcf8b2793c9.1669013346.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669013346.git.Sandor.yu@nxp.com>
References: <cover.1669013346.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DBBPR04MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: 032c2706-724f-4a43-e05b-08dacb91cba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +I9vd1QaF1HdX33vJFrR+8DBfnFR9K3i2iv7/y+BtaVjM1i7edBVYdZjrH6afOVn3GihnwrzMOq84tDMEqjfpDYzja3Fn5BuXVXppLXyneaOr/lkQifiKyujkw7m6zpFpITnnpIO6VFexmUNW2/9Gv4j0qoDvCHNtSK+a3wi69iXFK8LD+4qhpqa7RcOtOC8XL4wcuGWSC2jNmOqAPMsvHGC6Lbi8zDqK9Yhy70TgkxLL2knVPekuiflBKLNTWYCjw5VFyPJlrhMasGJT4rmHtMph94MkU8W4IsBwAbHyokI4GHnVVNdoU05ZIrYeoNse0tIAM32RdgK5DOH2uvIYon05J+EP6ahO10Uy6ob51u21WAxfp6umDFVyAqakrex+7kF7pyfEYdhO79CmbjTyzqPocOD7noIjFjq81IhlNN4cOU858+kfOlfhMcbt8uAOVGJF92WmO2StRSYs9TToMlR3BZTXwfCwCwtZE3Cc/fnW6Eu1bnGKurAOcTiI/xMU5Ra27xuCy3ZYIEA12lWMoiOhWoUjgv78YZ8takqXqzJNGcio5Gv4Pqv60QYHI6vK/gFkfoxEbRUnbgMEDGi6AKRmArcTEDCHR3OlJXYfLVlqSuh6IZ26pXsSRKfmDQVHGHFQi665N5BJdOnjxKVDrbKpqs7FoIRkC61eMMsoib5so1uZR77nvMC5cAHSf086Yo2pwHLG1hWuDIW3TDmmLwjxXgLXWjN46ZxYgwEWT1YYiZs/FS3HByfSmfkVzgt8b/CrNJv0hVowRiBzodP4/UegIgBysZV+YXxHiL0xVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(86362001)(36756003)(8936002)(5660300002)(7416002)(2616005)(2906002)(186003)(316002)(52116002)(4326008)(6506007)(6666004)(66476007)(66946007)(8676002)(66556008)(6512007)(478600001)(38350700002)(38100700002)(26005)(921005)(41300700001)(83380400001)(6486002)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wR9Fj8eTcoMBcPQrPCryWvue4QJvHx8JTOMZwN1BWsMvtgZ1vrrMU7I0avoc?=
 =?us-ascii?Q?78v4JjQpmGoXp7GGnI5S37JQSPvPfM3rDZqcwDp8fFvVBPuxorZp0k0SCPES?=
 =?us-ascii?Q?XFdlqtKokumMfS38jkpmBDVNrq/icOWejdK4FHQR5dO0POEtAG3e5AEW/eRB?=
 =?us-ascii?Q?mT7pFSPUuiX8/N2fcviLvnRsVXmkNda3qonMfS+uKnRjV69eCHGp5BZWYgJG?=
 =?us-ascii?Q?nB8lhZjhUknYBgyicumewEqOnhhdRjJ6EisfQzglVVJvnLszG8Dba5piEXdB?=
 =?us-ascii?Q?LhTEV0ZqAIcMDquc3/0PuMCEjg30J0QmyLy3lRJl1DfcAjpisY7o/eac1DF0?=
 =?us-ascii?Q?5oUTJgD2WAVhpS+YRs5CTvA/F1tpo5Hadq7YFNnaR3vL0gmRmZzvsZww68WC?=
 =?us-ascii?Q?ZVtv6DHPxXDlr4jcVUoAhRSMxw6MMQw8JsxzHZsA6XA8m78vi8/ztmz9Skr9?=
 =?us-ascii?Q?MAXAHB84ZJiuwDBJAXalVwqVd/KC+OP7nxqYEIzurXClyxA/lqR//loBCTPg?=
 =?us-ascii?Q?JXnpNV7AD17Sm3r3Gxqe0kHRVknHCyYZ59lPSYEYzIb5Cg2SIfy8LJsr98td?=
 =?us-ascii?Q?TDKa46id1Y8LmzlQVKYPnjcK/j0MUhAUsnRz4MlvNjZsutjanusZr59LmiIW?=
 =?us-ascii?Q?EzY/64ntJsSA4qPuqRAqZVHpgE0cimMlhSam5od+7FtioslBvLMXMwtiWiu8?=
 =?us-ascii?Q?0rp1jtvqgkewRsMG8AkfKjGshKMpkRYXl6bP22z3peQuAgjfIgOGdWu1FEpT?=
 =?us-ascii?Q?iWdBqHd8dTMEmdDmC2CiB/96tmVOA4p/3ejw0v0raXTVsohvihhVlPjcSc0C?=
 =?us-ascii?Q?smUkLvu7MPPaa1xsfPWiJPpkePlH1na3c1zjz+I3C+zl3nMod+442k7RMVKN?=
 =?us-ascii?Q?9fL8tzF+8Bhw20ip5Sx+JdxjD2cmXuQHuoV1ltm/zSjzpx9UGu/+g3i+xjzc?=
 =?us-ascii?Q?IXBkZH2Re7gMjG6PSEE9+aMV2/l2NxkHBGZBVgH2s9aNg3dzJnr1KScCccbw?=
 =?us-ascii?Q?Sy0XsuBnpzNuj5QFZdhrF1WFhJn4DJlcRvNWlwYx20L35+ZXdPLWiNLPTQrx?=
 =?us-ascii?Q?zO7Oh6vyoaIMok7SJuJnXVfbK3UGDpbxDRzGn3Uwga0gp1kuNQB1smp/Bu+R?=
 =?us-ascii?Q?KKP1XLR4SGC0xMbrcY5AKuOtjp8usInaU1SA1/aAG5+J497QE3KDIuTFJHI2?=
 =?us-ascii?Q?NBPl09jPrjUun6bjUAd2+ZOB7IaqKl1qoco64QXS69tf/WhYHgKvF0folO2V?=
 =?us-ascii?Q?Q6NvOwydwA+Ed0GY+OBkIVBwwTHg86QUfTCMY50wuhhdDKkPblIQ/OjQx/mK?=
 =?us-ascii?Q?yFPx0OrFP1IMKwFYbX2j4dKo8B6OyYPnyU1jqZcCVcOz7TBaE7SBRiIl25lJ?=
 =?us-ascii?Q?c4UhOgtQfqnGApjph09srYG/AJYVfkR6CiMEsDzqZPFqVOIgVDUdFdjs6GDd?=
 =?us-ascii?Q?1zaIE863Mkt/XhTG4qSGWJ0JyhyGsEJbAEvHbR7Z/kI9ALlTazw0H+E/sYHl?=
 =?us-ascii?Q?WvC/BIpBfeHHqWE5Jf8ORyDlHhnKFlxlDcMNjCneO+w0YboBFtAipjmXNfyw?=
 =?us-ascii?Q?Feq7DUY2Rt3M+zQxd1k64eG6Ez8uYl1X1r1NsI79?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032c2706-724f-4a43-e05b-08dacb91cba0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:27:07.5860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xhv/tv+g3fmGa/4JthgrPSCXlu6QAi3/y4MM1iFEu9sq5qUMFSgFDmQM9+LQyIwq0iDa2fSerz39l1QyNlbNcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7769
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, linux-imx@nxp.com,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for i.MX8MQ MHDP DisplayPort.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../display/bridge/cdns,mhdp-imx8mq-dp.yaml   | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
new file mode 100644
index 000000000000..d82f3ceddaa8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp-imx8mq-dp.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp-imx8mq-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP Displayport bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  The Cadence MHDP Displayport TX interface.
+
+properties:
+  compatible:
+    enum:
+      - cdns,mhdp-imx8mq-dp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: MHDP DP APB clock.
+
+  phys:
+    maxItems: 1
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
+          Output port to DP connector.
+
+    required:
+      - port@0
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
+    mhdp_dp: dp-bridge@32c00000 {
+        compatible = "cdns,mhdp-imx8mq-dp";
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
+        };
+    };
-- 
2.34.1

