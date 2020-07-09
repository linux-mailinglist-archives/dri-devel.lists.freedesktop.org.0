Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF9621A51C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 18:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AADE6EAC2;
	Thu,  9 Jul 2020 16:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052FB6EABF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 16:48:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDHcoBu/xCfqis3r+YUN4eVcyIY43LmAkxCMCePgj9GyqK+U1N56THztbrRwTu5HItFsi0hCqvS37mvuuFcoOad/p1wsX3jbVsVVkz7phbdGFStYr/M6zlygjM7eCPZ+GjllSTBe/nCtlKOCxW8IlVEzis+Ye6vghk/vVTe2NNT5AdWXYTVezx47SzwJtaK7FfQcUENo8nMgT98Gpe2leedNa1vjKZq0yC5PlHrPzL85IIwvXQ6WwzMGrz4xDUHK5jsUSuVliFY3CskStrw8wA3NPxfH5q7jU7sIDb+qYLzEANUFP/UJjYzR6LjBac9ei9RsLb7CKkKhKk6ted5HJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG6FYh7YuS+YDdLREzOvyyyP6i7dkNm/urnap0D5514=;
 b=da7AKdO1vWih25WDc8Ycz9eLdXBSuri7RPC0zWOosewCYTrGknivNXAWG8qqi/tZM9++EIbPs80bETOSwcZIabarFRwqqhlZCIblvNXZF3Ea2r18V4EYGdRRAH5VQ7igLYLM4fM6CxmExuKpq6vzRnO8zsL2lb/Ehm3Xa9ooJxrpxichk26mpaxodB89DJ38s+zsDwCXks3CvFJPLt0OhuhRnvDv1Jv91pLg7GSeofva0fie2KyOpIr+RcZQHbKKYIpv+0vD0ITiROXMprNkuWKPhSF0XOdIKjeOTvp7eJNoBNdcKeHRhoPzCilrTL4bmCmks6WMEVS8L4aTiEg+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eG6FYh7YuS+YDdLREzOvyyyP6i7dkNm/urnap0D5514=;
 b=Pm+EeGXhqsGMJiTZpmSIAy86iHFtx+7gLifYgIWZ9MZx9Gbgzrc8DQ1615fMK0w2Uv+jpO9gp9ngxVzZeEQuDBLikSidP4IkB0Umk45oBYQfWgxa2TI8TIFHJOv993DP0hgFm7B9l/QdJGHqZGMHZt0csmc1ACWX2mGte6cNaUM=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none; pengutronix.de; dmarc=none action=none header.from=oss.nxp.com; 
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR04MB6239.eurprd04.prod.outlook.com
 (2603:10a6:803:fd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Thu, 9 Jul
 2020 16:47:58 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::4c0:79dd:b734:9ea7%5]) with mapi id 15.20.3153.029; Thu, 9 Jul 2020
 16:47:58 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: [PATCH v5 4/5] dt-bindings: display: imx: add bindings for DCSS
Date: Thu,  9 Jul 2020 19:47:32 +0300
Message-Id: <20200709164736.18291-5-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
References: <20200709164736.18291-1-laurentiu.palcu@oss.nxp.com>
X-ClientProxiedBy: AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18)
 To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141.ea.freescale.net (83.217.231.2) by
 AM0PR03CA0041.eurprd03.prod.outlook.com (2603:10a6:208::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 16:47:56 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fe3bf959-40fb-4804-a53f-08d82427d589
X-MS-TrafficTypeDiagnostic: VI1PR04MB6239:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6239C1D559069AA42F41370DBE640@VI1PR04MB6239.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rQxeoSSVW31NWcDYda7Wh3ySeu/CkOB6+9QFr3ZR8gF1PjxTO2HQCnt/Hm+jRqHuK2U2HAXq+AM03ziHKOLDxHbEQrcdDS39yGcHU88pGvClMLR4rkBQTsnExH8f7oTRtKJQUZgzYuWZWJTStZZrhiNLtWJo7zjavOlcdipVJtETrtBRFwoCE/c9Dskl9Zf20z9uWjvbUnHNBNnbx27v9nyjV2ko0b2DgT1p5CZKLfdUSQhXmy1vcPeq0PI+uEUsHmPZPpsqvLUbZUGSU7KmannCVbJgEwFNK4n29Ljo4pBB2IoPTSFfKhNYeZquHYMu3nObUkVJbY/60vmn6a8hXZ7L0Gk7PxT+tz800CDUeL26/w9/fj0o7DDdoBbMKed02u/bTdAM4dyGzeIeK6k+sg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(8936002)(66556008)(66476007)(186003)(16526019)(6666004)(52116002)(1076003)(86362001)(6486002)(6506007)(66946007)(4326008)(5660300002)(2616005)(26005)(956004)(7416002)(2906002)(83380400001)(110136005)(478600001)(316002)(44832011)(8676002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Us7VRVm6JtHLpvJYyx8z9HvMx0Ag677VunqGRJXXLjgfBtKOzyDyOD1ihjDkPo1z2di6sy7cmQ+VYWjC7qNkcTXnJTvo8HIMDZIubpCs0bjy+jR2XoZVJWzFjjQwk9wofPrVFcjTf2KtIZjPupKAV/1ZD7XKbXjB8DGfHfDZwoDLVhfqt3cgki+TxWaX69AHr5HrJpCBkqo0fPjKW7b0//ZVWgutkLVRaXygoPjUFFtKEKGpZe7am5gC2q97VLyad0cZ5d6/9EwrXI07eZI21XSLmLLhlpPr97cslZz5qSi1vGmIFb5zPsIS+GDX495YfYNdFHD6X4BPzQG+o6Bh59Rhlu2uoWRSKz1y4ffYW/8/XWQWySCCv39i7pWcAyETwgBgXC3l8KsaQrF5lwalSr3PQq8MB4XovbPdGcaTNNc08EExHLEfKRR6TcNeq2ZSre6yyHu06aYuY8gqfJhittu58QPbB8I/32rxBTNQGn8=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3bf959-40fb-4804-a53f-08d82427d589
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 16:47:57.9436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDU0OkFniVH1NkaUKKDf/8YUbzFJZGZWyel3iYNrpa++RBfWFHVlDm6gCTbfFuI0ZEjwfR7D06rwnYAzJ0xbFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6239
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
 laurentiu.palcu@oss.nxp.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurentiu Palcu <laurentiu.palcu@nxp.com>

Add bindings for iMX8MQ Display Controller Subsystem.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@nxp.com>
---
 .../bindings/display/imx/nxp,imx8mq-dcss.yaml | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
new file mode 100644
index 000000000000..a951409cf76d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
@@ -0,0 +1,84 @@
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
+      - description: Pixel clock, can be driver either by HDMI phy clock or MIPI
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
+  port:
+    type: object
+    description:
+      A port node pointing to the input port of a HDMI/DP or MIPI display bridge.
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
