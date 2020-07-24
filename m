Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BFF22C1B3
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 11:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA9E6E4EC;
	Fri, 24 Jul 2020 09:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50058.outbound.protection.outlook.com [40.107.5.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0736E4EA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 09:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPsRHAKVOgkiuzcYhmh7lvgY5wQ5Yqj0dEvu7S7khz1Lt9gcghAaEn7ijIAfUjFx+0eCYyY04JnrNHBx6MZv3oAWJyLe1Rot1JDA3HL/oJD0bL67bcdZkLkwjM45bfac8x9MqAiEnSYmPfcjeyP5u5ULToz/RxPPAB4qC2x37T5aONnwpwvxbG6zNnh58Z7lLTETryyDd9MMxphwnm1ZYiJrLNIABtBRZwbgtdkeHO/2kAhq8RJ0etlCJYrN0wDXvkgBluh4dQ3/eIcmCwxx6ZYfW5Oh5/h7LMcUDzGoHIyyu1EXdJ6gqjOk74rHlZvjxSZmJ+CMsGLJvdQZFteksw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9daiHRo1mxt5cacqv8wV10od6W29rxvawkioiNZ+kE=;
 b=BpCFOGoWdoAMikrro5kiXz+yLq4J7SjL3g6DsSvIu+xa0QpgVeaMiSFUr8Qe8NkIix+czh3w9cPoevF+95lSFLAw6o46V/JxWnOazzS2zTvWCzuZWbarzaraY2U1wuSq6k0/1N3+GdKePzyFz8fsjCY4gz/HH2MfiXAP81j9QuQ7stmL1jW8rZNmhzLweJnyCZmrVveWiWJC1lun0KiZCVwDo3R2LoEx+cJk7bGNNKRZWPxkm+n7aq/qrrmooBnbiOFVmkBtwzT4dNUJzlUXL7TZuqji1Psg32VlRNXvGTcVmG3bI+Rxht0nNsoMY8FdMTTm7bBtr4SoIq6kRgWj8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9daiHRo1mxt5cacqv8wV10od6W29rxvawkioiNZ+kE=;
 b=Z6dx0SmBNre4H3JGu/5HeNApa/MGez+F0oSVdhtsD76FEmF8G5CnMYbo1fa4BCO4aT8zaTdO9V/XXl1l6q2YwRuap2qnXyzGvYL3fUcmcBe+64gWklmV9hbdeoZKde0muME0451WlSPuJw+GAwR8I/Uei5D7D+goWyZPJ8AOwSs=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6960.eurprd04.prod.outlook.com
 (2603:10a6:803:12d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Fri, 24 Jul
 2020 09:08:31 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.028; Fri, 24 Jul 2020
 09:08:31 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v8 5/5] dt-bindings: display: imx: add bindings for DCSS
Date: Fri, 24 Jul 2020 12:07:34 +0300
Message-Id: <20200724090736.12228-6-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
References: <20200724090736.12228-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::45) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23 via Frontend Transport; Fri, 24 Jul 2020 09:08:29 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5c2ca092-6efe-460e-1631-08d82fb122ab
X-MS-TrafficTypeDiagnostic: VI1PR04MB6960:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6960B8CDFBD007751A16D8C3BE770@VI1PR04MB6960.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R97y8X2nI5d4/lsCbk1AH1hjP1hMzjZ8czKvXMCYCI5PC12Ln14OksOhGRzXMa95nuNnAFgb0IpRSHxwEtOufddq2XJR6rFCCACGGj/v+IIotYrpg5F8F42SBBsjmcd8a9fJsjne5KxTz93zWzbQAgkxkx68hXPk6n3Fx+hnOUTxKu+W/cuJBYaJ996ccRl2v28Qh7q+VNAHDg4hDNQmD238Yy/ZQDcfv3hp0KLHpfBMTub3vx2dWD6j9qgIilfqlEtF1iWQgXte7d2gXCCyrUapcnG4J0Qd64g+Fa6dF8N84LEBJY/MC1T0AmMXnZpK5Cvn7BW1MQAytaWf+qbLTd0WfhhO0auFUbkr/H4OzXYZd9TeaPyfmTYpYygutFUTkIPBblehLgQUKAtnaL5/Qf3xOXMvvoxfT0i8qyZi/5nXdgFIbSITVJV0cYJImI0k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(26005)(5660300002)(186003)(86362001)(6506007)(83380400001)(478600001)(1076003)(16526019)(52116002)(2616005)(66556008)(66946007)(66476007)(6512007)(6666004)(956004)(8676002)(2906002)(6486002)(4326008)(7416002)(44832011)(8936002)(110136005)(316002)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5wd+JxmKF9bgbwFPb996qaLNvnQKLtphCJqM22sNaCL2420djbeNG9wYt8JMGawxuqL/YqoaKJLJ+Jhhl7aQvSViwU/L7ZFD8UKeh9JiRFJwPog4mYEzZ04lxrveI4wYhvGA1xRhDOe9a2yGLFqxYsOlEBOf7gLNF7PD3uZG9A9cPjFD595Z8EG97rmX+sDLNgfOBZXmiKR8JKOq1h3/TbuSmukAxU94uGawkdDC48j9y+3G+lvQQ29i7As5D4iXHwhzuWmH8rEuPZrfVULjaFZ/DnfQPeCXxd/E0SJKmpQUJ+PjNTiRWCwHLgHW9c0JT5NBnhLIWZOqbXV7PAEqR2mgKJUxKArvNcTzycmk4mlfchfDPYyEvQHP2IAJRsJ3gETpDUQdRJ9gELOB1xKROLdVXWynnErUhFq7YpB12YH1uS1XThH0Uy6ELN1NdMnw8ZAiskDAO5AatWBBZ34xWR08kTraK1jyzBXkgJzBanY=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2ca092-6efe-460e-1631-08d82fb122ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 09:08:31.2088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYMZ3iJqSt5vSTkYWtDWa4HpoL39ij4eB4DQrad0HabwwqRoA3n5QXN3OJC2Jv57hBQZKxQD4PO/QL2kVkajQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6960
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
Cc: devicetree@vger.kernel.org, agx@sigxcpu.org, lukas@mntmn.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurentiu.palcu@oss.nxp.com, Laurentiu Palcu <laurentiu.palcu@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Add bindings for iMX8MQ Display Controller Subsystem.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
new file mode 100644
index 000000000000..68e4635e4874
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 NXP
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/display/imx/nxp,imx8mq-dcss.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: iMX8MQ Display Controller Subsystem (DCSS)
+
+maintainers:
+  - Laurentiu Palcu <laurentiu.palcu@nxp.com>
+
+description:
+
+  The DCSS (display controller sub system) is used to source up to three
+  display buffers, compose them, and drive a display using HDMI 2.0a(with HDCP
+  2.2) or MIPI-DSI. The DCSS is intended to support up to 4kp60 displays. HDR10
+  image processing capabilities are included to provide a solution capable of
+  driving next generation high dynamic range displays.
+
+properties:
+  compatible:
+    const: nxp,imx8mq-dcss
+
+  reg:
+    items:
+      - description: DCSS base address and size, up to IRQ steer start
+      - description: DCSS BLKCTL base address and size
+
+  interrupts:
+    items:
+      - description: Context loader completion and error interrupt
+      - description: DTG interrupt used to signal context loader trigger time
+      - description: DTG interrupt for Vblank
+
+  interrupt-names:
+    items:
+      - const: ctxld
+      - const: ctxld_kick
+      - const: vblank
+
+  clocks:
+    items:
+      - description: Display APB clock for all peripheral PIO access interfaces
+      - description: Display AXI clock needed by DPR, Scaler, RTRAM_CTRL
+      - description: RTRAM clock
+      - description: Pixel clock, can be driven either by HDMI phy clock or MIPI
+      - description: DTRC clock, needed by video decompressor
+
+  clock-names:
+    items:
+      - const: apb
+      - const: axi
+      - const: rtrm
+      - const: pix
+      - const: dtrc
+
+  assigned-clocks:
+    items:
+      - description: Phandle and clock specifier of IMX8MQ_CLK_DISP_AXI_ROOT
+      - description: Phandle and clock specifier of IMX8MQ_CLK_DISP_RTRM
+      - description: Phandle and clock specifier of either IMX8MQ_VIDEO2_PLL1_REF_SEL or
+                     IMX8MQ_VIDEO_PLL1_REF_SEL
+
+  assigned-clock-parents:
+    items:
+      - description: Phandle and clock specifier of IMX8MQ_SYS1_PLL_800M
+      - description: Phandle and clock specifier of IMX8MQ_SYS1_PLL_800M
+      - description: Phandle and clock specifier of IMX8MQ_CLK_27M
+
+  assigned-clock-rates:
+    items:
+      - description: Must be 800 MHz
+      - description: Must be 400 MHz
+
+  port:
+    type: object
+    description:
+      A port node pointing to the input port of a HDMI/DP or MIPI display bridge.
+
+additionalProperties: false
+
+examples:
+  - |
+    dcss: display-controller@32e00000 {
+        compatible = "nxp,imx8mq-dcss";
+        reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+        interrupts = <6>, <8>, <9>;
+        interrupt-names = "ctxld", "ctxld_kick", "vblank";
+        interrupt-parent = <&irqsteer>;
+        clocks = <&clk 248>, <&clk 247>, <&clk 249>,
+                 <&clk 254>,<&clk 122>;
+        clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+        assigned-clocks = <&clk 107>, <&clk 109>, <&clk 266>;
+        assigned-clock-parents = <&clk 78>, <&clk 78>, <&clk 3>;
+        assigned-clock-rates = <800000000>,
+                               <400000000>;
+        port {
+            dcss_out: endpoint {
+                remote-endpoint = <&hdmi_in>;
+            };
+        };
+    };
+
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
