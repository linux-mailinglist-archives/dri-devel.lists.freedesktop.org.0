Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8E0755DCB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8384510E1FD;
	Mon, 17 Jul 2023 08:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2055.outbound.protection.outlook.com [40.107.7.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EE010E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XC0hjned1idEb6OQctgvngSguGSrIDHAYYt/fmW38nd+n9DTdUBJphGHCIv7Xk/VAUNBNBLkUcNqGaTc2hUg4RxDQ1eZs7RCLPFauPl89BCFwoJ/Ss47/VC/S8kpS1M7MvR7FdSZwFKFiZtIan9GclwH+vQ+nULO0xYHZkJLpSM/rYWvzywpLUxoyf3w1f1AMu6PFi9WRLkaVRQ1mWZHZ4JBpr7yavtUrWSkvwCUQbxu47llv51oL82Bbf0UaxsYLNtT1eFf1GGFhmM4XIQLEtEkRv940mKDdE8xDV2KLBLsiqSc6m0Aq/yJbh1cENE/JeF7x/mMc5odrwzjOUaT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N823OSuiIJYHE9/47U9dAmlLZH3VJAlMgCDiCJL2EK4=;
 b=bx22Z1NboC+TezrovFipYVW/X8PfsTuy7jFpd1EcGO5cCpz1DazuSs7/N5iJEEPkYCe8ElKyzgrYWz3qjue1vPp+jptTjvcEIaqiuTJuE9I41aZ395qLESW53nryf1Dc/jgh6SrK+GxG6/Vv/NflMcgzUARqUnwZyuyWSUuxcDtM+7udu7fsmfDWEWn/iiJMNAf6FtIcmurH7PTUgjLpmVkpvoAwsfstt+ci+Mpmw2+ef3+NNZ4KApOj3Jj5jB9pHBs6uWzd12N5sDI1F1omtGPEvj8CtlJkm7FYovdDjqPpu5aNBta2HeGT8htyuQlYNvE+hXRPy2wWaLVETLXgow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N823OSuiIJYHE9/47U9dAmlLZH3VJAlMgCDiCJL2EK4=;
 b=YITlmQwdrisK+lRaatIfqynf+O1gW+kgDg55YGzbYyw3CpIxsO9aRxPfRt9QpfBRJemNtaUtTMoaRJTMBCkClKzIvV+5UXPWfrqYjLCFs03Cy1L6SBqRHJhHzZztgA97ttzg17/35B0/65jxkFj4p9J5aC8xtFZl83GD00LDTWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DBBPR04MB8025.eurprd04.prod.outlook.com (2603:10a6:10:1e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 08:04:59 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 08:04:59 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v7 3/7] dt-bindings: display: bridge: Add Cadence MHDP850
Date: Mon, 17 Jul 2023 16:03:49 +0800
Message-Id: <3646ea4d279838c78e00af1d746e3de34351b083.1689580812.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689580812.git.Sandor.yu@nxp.com>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DBBPR04MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ac4956-9e5c-4bf6-3d76-08db869c8433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dy0Kz6PTzq/zW6CpTOqOEJTaRi9NSW7/SIba7sZiJLwEY/5YdA/Jgi8koy3IDE9f+KT4c+LpjiVM48q/2yj/Udibx2y+n0TOPQJ4yetafjpDvts6l5ddslX58O4phDhCN86TDb1XFDAXDCiYWD8ogpT/Zmp0LfXj3eNZvRa5ZxKhy8rPgm1qS05o4Xby/xBqi8gsK6rjRiK87Wm3B0oJKHFgI7xBGnHFYFZmDyCE98uX+gntBU4Hl0fEnk+R1rPlKQLGE9aq78SShGqUIYkg+ckwThmt2UOGtdWNBzywCsKa/Jhkf8SGln8qFGTJ9QbzpINo7pNSmzi/ZpCTDXx2ho7ej5WzW4sMutBeJQ4sZqGYBJPOC6GckUUY40muYlqokI791JD/K/YF75sFeQp+/czv32KvyM4iREPJ0f+AgXDppgGA14VLXweYZZ333YK+Vmwy4BqnjuIFKlXlIe3ugPR7geaWP3GXxsHWGGtRCuYtYQdaXdYjU1GkuuVX6H2wduXt4NoS0Kms+FfWy/bEhJhtaTXWaq4obBuyRYfpHxqg5JxkJEVLIGMgx53SUyaysQMK4sqyuJ2mFSllqHKlCh5RCa9kd5+6rGr5FfjBVfLpqooJbHFdKHMDmgndOmy4naorQ15gyT1I/pjJ1FIf61I9XuR5nZMqK+6Lw9LZfyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(6486002)(52116002)(26005)(6506007)(966005)(6512007)(36756003)(2616005)(83380400001)(38350700002)(86362001)(38100700002)(186003)(921005)(8936002)(8676002)(2906002)(41300700001)(478600001)(7416002)(5660300002)(4326008)(316002)(66556008)(66476007)(66946007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fbPT8A3pZicOxNVxYrB8a2pqFTxL6WV9h8iwlcvCWZDV8YMXNFYr4Eu44+XU?=
 =?us-ascii?Q?Cs2bC+okW+QSSYeSRGVg2kpCF79ayL9mbWudtkZfLoNMF3mJ8BjevUwEAE8B?=
 =?us-ascii?Q?lm+mXXnQ7b1oGZWjr7rBYm7tBgToDhCczpNnjdwesIwuTfjXK4dTji5dayHh?=
 =?us-ascii?Q?gX/f8KLiASgd1YRAxJb5MXrYFzlKMuGOfojcdYgyOlWO1jv77tRdhRttu42n?=
 =?us-ascii?Q?TDBHd+htQJEQTcUAtVduPQFC2MBylOrWMQJp7SWTsx6w0ucy+QASDA/jSQzO?=
 =?us-ascii?Q?uyHaPt/Ewo/KGb60ha8mgRPha7lbUX/XcATv7bUS1TVNwWUGXj7GdDy+V9Jk?=
 =?us-ascii?Q?mGcKTWoco8TaRhrZPLHuWOILeY5cS3BbJV1ohTQeOdH2h0ZMEAjydvtNwdcj?=
 =?us-ascii?Q?UpCcgWmTeIMDBJbM0zK1x+7dio/aGFy0Nm2a0ApnNPVEnHxWQzpXot7Mv0mo?=
 =?us-ascii?Q?QWC7xx+WLye+S6M5UbhzUW7ftfK5RItj8wIiklRyVmhw3KkGQskidRXOnZfA?=
 =?us-ascii?Q?IR5GkuSd1CnUWMkBWM78vZ+YEG2f7AjRJaPY+57C2OJNMKcYd6m8qjGp78cl?=
 =?us-ascii?Q?L6UT1y+YTwiL3gozOu7xE/7GcCd4LrKZ9/SwIXlDLKaagop+JYQ8k2gzq1Qs?=
 =?us-ascii?Q?TPFt04nGYmbmTOKRN4MoSlzF3LFP0vVirApzaJb1uVfcXL9u6xio1l4LUiNO?=
 =?us-ascii?Q?UtrwVFYevxAV5te0KPg+hlKJ7Xrs2/CcUoPQvdjFem+4yLtBg5qmh/U1mwYP?=
 =?us-ascii?Q?fDXQIdh15U/gXTzjxobkOOsrAsR3LHCFbVNY6sn63VZLhUd5hSnXGMxmK5X1?=
 =?us-ascii?Q?/zEjYSwbOOxs/Gm4jDnV+vfELNZ+PKwi4bNFEb2iGHej77cqoAmmKsgMY1Gg?=
 =?us-ascii?Q?pSUx/cvH8Xhi8nXVjdMfFyi0YhpkJNrasQLGmt/6xQdIwChdW/woegmv6ifb?=
 =?us-ascii?Q?MjSbORezMJ+IDpiRhO4owahgdCA/vv4iR6fVM0mmsBs/OxMiKza2SC//bpeX?=
 =?us-ascii?Q?83dz1qHmFU8akIcvRdU3Uth5WcjfX4VTEwtGNJLLcct03z5XK6yLtDarkxb/?=
 =?us-ascii?Q?dWHQ4yUCcgTyzQCWYvV5C19mQPb5NMO4AmC97DaguGSgEMtvAHv4YLsJUZrX?=
 =?us-ascii?Q?A/l5aFQSp3P4pA30l8ExTjJmH5BPjv/eO5kCpYSLsn6rtHhf8/oz1HCU/u6i?=
 =?us-ascii?Q?bQwRAZ144nANA9afZ567EipI7HrLztpRfT82Bn4sBczGOKxHG+9EZi+xO4Hy?=
 =?us-ascii?Q?r0B1m6jweBZ9BxchNGlCuAElx2BQKoxwMSty41atmj4W2sZUCiIImLbayCu8?=
 =?us-ascii?Q?fcymkungHlaZEEywysphQgySzrTrUgtuVr5/LunYAc+eACk/8XmM7Iu07VIG?=
 =?us-ascii?Q?jxZwiez6cFtGcaNG3ijPbLEY0bXL2jya82IwK2/8gYbZKQ5KgNxVaS3Vw+5t?=
 =?us-ascii?Q?Swg2ZEk78ECEPtW2EStaT160ZBeTlrZ6au6FDBRi7weqAkdl1de2O3GFvzdP?=
 =?us-ascii?Q?M/zKv+vY6GyO89b5aI/Sx+hjjj4dYQ7ne+lkNTvtne4IrWM9HKTZ3zQbU4Iu?=
 =?us-ascii?Q?H1GUy+Mbx7MV17UtgF4sx8aKOhg7n0fQ1IVdbOIa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ac4956-9e5c-4bf6-3d76-08db869c8433
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 08:04:59.5769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFAA+0NYn2HEVDfQ4sVXBNRJlJYQcDHaA7IOfhTS/oUSTIPtIugIrBqt/0LPVBHyKPlusecyxfOC1at1aptgyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8025
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
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge..

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../display/bridge/cdns,mhdp8501.yaml         | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 000000000000..b983ee765f54
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,105 @@
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
+      - cdns,mhdp8501
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
+    mhdp_dp: dp-bridge@32c00000 {
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

