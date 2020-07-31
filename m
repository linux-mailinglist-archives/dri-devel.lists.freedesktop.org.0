Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76C23410C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 10:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2956EA2F;
	Fri, 31 Jul 2020 08:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB836E296
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 08:19:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DT9nyI3jkUFl45ti52k2dX+hsc/7Y5apqyqX6geOqcYTisrUPPmSwsfI20anGIGW/Kdf6BMGGCYVsOheakaM74H+9rz5sSzrg5g+S13yEhAtJbjLWuftgQysWAjw2V0g4w7eFaamYoUV7GkyhnX15pCX3bkb21kL4Zl9ca2ner9lXHGMFebyhdRcF+4Ms4xPwnqJdX55zsk+SbrzAT2+Dn+aacV3s4sxQAfYJmJpKb5AZb8PGC5b9ZYGFvaSiUUqhdEsVxNcqgUZhnRaJJCzUneQNYB1xt78LXAnBfvryKNIMPAPzAFzMiNaB1M06B/IOtwa4tpfu9kthRkaNALIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHjBSHHpzciVQ8pgO9wjOvzE8VSmoEsYdCvPubd4aXY=;
 b=D0vrPEOp6YaQz377F//FJjyoJmsz51BGyvWRVtWlPbGKTxKo9ikYeWQZeG8coIS4qKn/b23ZvomyZmV74N5yAtUMyj6VPJZZxqQDUMf2M4NK1fcGhRzd9UiPtBSlmldyWCAwM8YQLKIbiellUZKCrqPbZrDqLzlCkBdMAXVLDNOuPRR7PNCAUNNav4ImPPvpx6vnJAm0IPR+1O4CpVJSEop5AEj3hCxIuovvwI7fchBX3+09Zk+fjwiTkXxqP8XkcdAlJPsf99EQ439IxK4u0Y0o9h4JsqNLNXRzbuouKUPHyWpo/Ik+p/XHAmW6IGIcH5PQjMttdflVtoSpQXGKBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHjBSHHpzciVQ8pgO9wjOvzE8VSmoEsYdCvPubd4aXY=;
 b=c0WZ3DklG8ll32691LrtqUFUcv7+ozbydq5h6epl60m2h2NspjRT5epqcKR4NrOVVHpMIrlXoX+M51PopPdmNPXPh8clLAEWhmQMhQQge4oezkAtgsWYxKrl7kZfq2/LwxrBGt7DSdodQ3i/wTdg37ErKhR50NgFwxIdP+pLJww=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB3024.eurprd04.prod.outlook.com
 (2603:10a6:802:d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 08:19:21 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5c87:6dce:840d:d4c8]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5c87:6dce:840d:d4c8%7]) with mapi id 15.20.3216.034; Fri, 31 Jul 2020
 08:19:21 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v9 5/5] dt-bindings: display: imx: add bindings for DCSS
Date: Fri, 31 Jul 2020 11:18:33 +0300
Message-Id: <20200731081836.3048-6-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
References: <20200731081836.3048-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR06CA0141.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::46) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR06CA0141.eurprd06.prod.outlook.com (2603:10a6:208:ab::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.18 via Frontend Transport; Fri, 31 Jul 2020 08:19:20 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 75800b10-bf5b-4731-fec9-08d8352a6d6a
X-MS-TrafficTypeDiagnostic: VI1PR04MB3024:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB30249C1CC3711BE22B233AE1BE4E0@VI1PR04MB3024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t78ua61zfzI5BuAr0s+0IowvyX6kEsS7oYPHo7TFsI+yRhraqI9HVpqD1fOja+2gbm7o/0QjVYbCAWO1F1NGAXqud67hUxO1ktMpm0JCY/IJDv3mGbpp9qLud6/OKxKT5FzEledqGma2YVywjTRfidPcKKXIK8OG0D8Lu+ubTBVda66MuJb8wc4uA7Fm86RyIQtSfJhYG+e6a3dMkZRiMRskwj4P9QcgOiKnLW1343oS45FaRMO4zuXoog9eJlQrtIJrTp3uTtXAn8EFA/alhq6a9x2B5BaSTSZSDqXM6ORBj8A2ojIOYADItDWYspqq/PfGR/AmVzy7UUXmonzf1DIgOn6uKR6iT71sKvLluosQblQRTl22JQ21voDoNsy57PFfL7jR5D2c44R8Sk2eb11tP/p6mtbtR+i+XsbX1npwhrMOiHV4Bz1k7C9FIzKh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(44832011)(956004)(2616005)(5660300002)(66476007)(6666004)(1076003)(66946007)(66556008)(316002)(110136005)(2906002)(186003)(26005)(16526019)(6506007)(52116002)(83380400001)(4326008)(8676002)(6512007)(7416002)(86362001)(6486002)(478600001)(8936002)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Q57l3Nf1JlsODGiYrI424a2mb1laEoINjDh9tJC7IPwohGnvh0mFALVkSTXhMqbwsEvN3SpY9XBm+rdIObXOUOFxUqsvjfTwzzH33NC6W6nfaDeOkIq5ErgaVQ6fcpp0/869bUUG+VD6XdL5SN4XVmRQWRbuNaRelXbueZwN6n8IpvV1FYJIxD/SpOl3Z1sDkjtlo5yl/ToBaFVlBablw0ugy3w6tg4gGbS865+33Rdd9bQmbqiTqG0ilcFH2ETy/DjbopO2gelRclmjaItLfaom7PlS1Ac/vpY0qhTENS06leimHR/2+/S30/7gPyANF1/bpkMTtBp/1Mecfh5wWF9XTzcYZCZCU5Z3kP9Ah9zQiINiDQ6eCoFelhcO+4mfdm/YnvWNtEVRPSxx3AaSyCwXXf68C6jPT355S9jxQfrUMi7PS1NeJxMlX1l5ScYrdTPrrbuQpxd8K2/pw+YRpWMd6GI2rCuJXD3Xmn6oY8emRJuchFdnCs8tv47jlzrfV5FRjnv8399xWvlgM5gL7xBp56sVaS/GAjYajggHSqmMjZhCGhY7Y36aA6f2rM+DehyPIJUJenCUr9DAelwiWdokZkOU234R2daeOAEXFLn8qkprQeBcbSrWlXh1ve4PUo6Hf0vT4EDYn5GxNM8ADQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75800b10-bf5b-4731-fec9-08d8352a6d6a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 08:19:21.5121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXBrfDGtfDHu5hyAf1neyCgm5RJ3WNeeuDK2etKqcqioj8JfZAuXLi8enMTdRCahx6C16AV6hf3Htr+ziAvUIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3024
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
---
Changes in v9:
 * Include imx8mq-clock.h in the example so we can use clock names
   instead of their values;

 .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
new file mode 100644
index 000000000000..f1f25aa794d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
@@ -0,0 +1,108 @@
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
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    dcss: display-controller@32e00000 {
+        compatible = "nxp,imx8mq-dcss";
+        reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
+        interrupts = <6>, <8>, <9>;
+        interrupt-names = "ctxld", "ctxld_kick", "vblank";
+        interrupt-parent = <&irqsteer>;
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>, <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+                 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>, <&clk IMX8MQ_VIDEO2_PLL_OUT>,
+                 <&clk IMX8MQ_CLK_DISP_DTRC>;
+        clock-names = "apb", "axi", "rtrm", "pix", "dtrc";
+        assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>, <&clk IMX8MQ_CLK_DISP_RTRM>,
+                          <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
+        assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>, <&clk IMX8MQ_SYS1_PLL_800M>,
+                                 <&clk IMX8MQ_CLK_27M>;
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
