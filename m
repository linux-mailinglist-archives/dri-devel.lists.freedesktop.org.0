Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF08227CC9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 12:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826306E56D;
	Tue, 21 Jul 2020 10:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30046.outbound.protection.outlook.com [40.107.3.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A846E56D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 10:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcRqM7/FtUH89pXv7/7TZT+e+s5adOUiZwB5T9WAqBmxGK5UhiNuei3JvNOy7oKkEZYo8X5ht0mYd3NKSOaq/zXI7zsrWB+t3WEpRpjOSPNCTSV27ZCwQqfn2O/OSwMpdqswnzFOEfg8NnW/rs5uVZ4DKD+V2c4u5KWUbH2dHgT/YmTaqlUU7lBpn9eeovI63GyYunthXviKdygjgWTgJAscMjpjuqr+KMDpAnJSL3SFdb43GxXehrLtN4FFrc2jFRxGK0Oy5Vf7p4c1n2UE3QyngbZMO+UkHFAoHtm+Dyfo+BDFEU3vFTZAlVtgm+iUjzEvz7f3hXDrgvDbQiBxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9daiHRo1mxt5cacqv8wV10od6W29rxvawkioiNZ+kE=;
 b=mbrDjIO1n2Fldqh3TVPaHRxTPdN9/jcKfd92mq4mCKfCe6I+FIptJOYH073rYeCENBn5/+6u4qxsnMJhpHOZt3Z2RFiOsu/I0wg6aENbBWd9FD0UsuNQc3TIVvjREIH+wFsoyRX+RUidpWVYnKor5kK9kFjUPNlHZI9uOGEoUrrib/4z6h+32uFxRWaKM2OvY5UJ2ioC6ZEt0HvED3ZN/hSVWrIz0zvtPfbCcyr2E11ATIPHb8wfJwI53hd7P/jiZQ2OdBcdrlwe44WtyyQhvlLqsN5n1VrHGcfPDyLLEpeBJ/YZQpw1/Bj+xHLeJFKYlZZHOmcep705iZ4EsnvGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9daiHRo1mxt5cacqv8wV10od6W29rxvawkioiNZ+kE=;
 b=E59PGy6gPZSju3Udf5UR0qkB1tf/MpMZ0N7QqGmL6QnMKCqnoIhSAh/1Eipy7jZ5Uf1il0c78+mA3bZPwzRqOr5zNkPhzi0+QMoY8InhKv6RkkX6UNM9/WyaDLUJJ2WGYmXWurPpvzYiHtrl/CLr778JQg4jlsXaBYy9zNLX8bs=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR0402MB2735.eurprd04.prod.outlook.com
 (2603:10a6:800:b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Tue, 21 Jul
 2020 10:20:44 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 10:20:44 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v7 5/5] dt-bindings: display: imx: add bindings for DCSS
Date: Tue, 21 Jul 2020 13:20:04 +0300
Message-Id: <20200721102007.18368-6-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721102007.18368-1-laurentiu.palcu@oss.nxp.com>
References: <20200721102007.18368-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM3PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:207:8::24) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0138.eurprd07.prod.outlook.com (2603:10a6:207:8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.15 via Frontend Transport; Tue, 21 Jul 2020 10:20:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: df7006a5-ddac-4e88-9126-08d82d5fba6c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2735:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB27358FDA551F20E1019B1A42BE780@VI1PR0402MB2735.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PdxoxZtFO03W+qIZdpeJpRVESvQTO1bThuxB15+XHAIxfQ1lL/Npp799rXqO9LmILitjfp8SyINHnnw2o/Cbg/bCCe6C2I5dmbWfDYUKTIWapJ46fyRCYtfA+30u4xpGhASDqv5CZ7TcNq3iS6eFU5bm05A18hPUPzZV8k7G35UpqG1weCMgKGdgUugUQ2PVSeEhztigrnLhXhlLilIX7UMeV5PTs/WZ5ffRHsV/e8sJf0KlfINTDAfJd3kDmZfw8F/LjCkMlAg5YKNzilByWWPEFZv9SSwL9EExf+UmfUxAaFUL71rnZJypndM/VUnKF5LaRLxFTCB2KtrUDR5bZOyr68WBcDLvKc5UDIkqtwUYLmU39P+JcQWJK/qZBFDyLhgFxrkoHEDix6u6/Qthxx0TfcuT/8bZSc76/0LRZ6PJlmfnmACOHOGcTPaVJ/UW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(26005)(4326008)(66476007)(66946007)(66556008)(6512007)(2906002)(5660300002)(478600001)(1076003)(8936002)(7416002)(6506007)(110136005)(8676002)(52116002)(316002)(956004)(6666004)(86362001)(44832011)(2616005)(16526019)(6486002)(83380400001)(186003)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: BEasuGRCZ9SlMcj7DL2sdJZmctX6VXSf+kK7IbL8E1mTiUzJ3MnG/YaYsGYoHOXgqOsyoTDFx9SceP9yx6Y9OLoz1IKTL4ZMoXO4LAdzd4gmkeKmmM09Ouwd4eGu6AiWhmGnrtuBjjqAEHu7ZlxBokjR8ia/vC8Zv+i1vx2JwgDoodBeRYsL7RjHnAeI23DsE/mTiIjXaQuxT0IRIVNH3ZkGcryprWAoIatU3X6qZKTWf5utzwlqSbdOaWSASfh3t0p7BynJLw/kTUHXiAJC3uwFwoIpOzct0jK0MvnE0Iz0MSAkTzYk+1vn3uZ3KtzRMIF87sjii/lmLxoQN5E3oQIACkWgOo6rmDnv1Jzfbhda8m4JILQz4OEorz5urFixdahKTTDHWpuz2MxjiXPjOL9WlQcnG16LFTWaKb5LyL22PkkjZxbM453HlLUaAd7oq+p1ypPZvBQrh9XYPyyD/dZr6+UKuag+h6SuZ2JH3Po=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7006a5-ddac-4e88-9126-08d82d5fba6c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 10:20:44.7104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfJVIL9ReUHDzhwnKJlNAMECJP6VJwZ+mZu6cVV/emFO5Tj4Jyg4DMjFyMmao7Xro+VeQJhXJF663BhmCQH/qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2735
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
