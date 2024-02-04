Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7198848CC3
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 11:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2222310EC2A;
	Sun,  4 Feb 2024 10:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FOy+Cmg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2076.outbound.protection.outlook.com [40.107.104.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D3310EC2A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 10:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N23BAxmlROEoaWu8m2/+hzTwcnFwmViUip0Iou/RzfzFN64ircUnpeutvNiQQrjwSR1Pa4y3dA2yOoY+5xcjNiJbSpG6/JGgMgnkAbsBU5pvF1kmigR9JtOXIidwQ6mqUUkyw5vyK0dlA6tx2IYAFpwsEhbf79AYCNx06NVGfwxeR/1pNILlQmUSi3cASLgN1wdZtVxEuUxRh1WSZaY/YvDeAISwe3x0EmBWm0mWDOYDQK9f7DXzSproekd8WKL3JmHS1I0ajLqoOTyybP/TkHrookBWUEEgRRiJyztQM1pgZzOXjf8NsQ6uFqixMEwvJbnLJUQWZpezNVpqGydrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEm5P23uaKJj4NeuE2vtg4Fr1V4FvPcBzCv7JrZiDV0=;
 b=IkNWFWC1CAhDtOgTYEMO1CMho/h46OvDaWCYd8cEsaI7IRG6Q1niBBAreILdZAylAifALat+h9jtckuUxkp7SIZwE1rrj/1/7B2s58mv+0FDn0F0G0xcPH74xuzbkTmOvZB2U9YGXM17tgvNtrJM48E8me4BMxM52UpGDU7UI4FX9oOYh2ozro+NdZdIv/0HnshIslfl+vC3YW9FLLYyLKogHWagRe2ykEtSRk05CQYtjSkaQTnU3pQQlpRiHctCSpUqo1QCG07+E/d09V3S6FY9WCtMP4BnkLLDBpmJ2r7u//vGQa7dwGmiFvkjH9WvrKWp/iAqWiQ4mixT1UYcQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEm5P23uaKJj4NeuE2vtg4Fr1V4FvPcBzCv7JrZiDV0=;
 b=FOy+Cmg3OyfXPLXzwx8e8cp5RgL9c3faWFqMFGJjY3NHEbeyQvw+NTKTVNHHtCeGMvW4XggV33e4phaNsmNaDBg6VRvAFtVM1S9XZ0U0SpGI3drAucem4zjDOSEBP0uhBUNivIkIeqOOrhkXfRwlVlOTt2ryvdr/NV7VNKWGvW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6966.eurprd04.prod.outlook.com (2603:10a6:20b:109::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 10:23:13 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9%5]) with mapi id 15.20.7249.025; Sun, 4 Feb 2024
 10:23:13 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v13 3/7] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Sun,  4 Feb 2024 18:21:48 +0800
Message-Id: <84e90f01aabfae52d1e1506417d2dd31aa302964.1707040881.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707040881.git.Sandor.yu@nxp.com>
References: <cover.1707040881.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM7PR04MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e739532-3628-4df4-b345-08dc256b4b08
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /aK0SapGMyqSOCTPOtl8KXdvQ8B9jJ9KmPDQsQxTFaX4O8NitM92c6LV406ZM69gnR0TVjMfKCszSRuxiVPsCgE1PA0CYqw/XpPrRg8uug9RpSzfqPSng8AOziufIed/8Qc4zmdVB0Qn+XJP6NMDElbc9rqLfbSFlzelgQA97gyPYeThBrcVpgvk8/THLK8uCFl0DQ0a+VGAxAvnAJ7IlaeWk8rgMr66VlDSKXez5dB2LYgmJ2+H7fFfVOb3o5G93zzZGKZwicJ892wtdgq3MrWd0AK3pILUjbk6Y4SRmC5WV4nTTJ8JRGDx7JkYwAHw7dkgA+CXfh21+ybvfpsWco0LpLL0tsE5NirrQQcQh2xsz/rViikC5acaiRPmgHMyRub7L/wbCV8GLakhs14EzzJsO7n3s7j5Z1MfnriXeBPdslk+dVY3+hYdPLEXGZYrtDe5NOW7FK1bLVc5ZgU5jrJR1+2HnTIXGOhQQuFflqBASdygLd8R9GaQaVKXsaJCTMAQkx74DmP9dude3E2GlddGOSqcSh0eT6IXq9rVrZbklz2a2vMCUzsNSfWmVvnHGHSl47E8EbugxKhUw9WVKYbb4s797+mII2fUBsD7xPFJSdk/OgWGPZtqIBMjHbxW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(396003)(136003)(366004)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(83380400001)(26005)(2616005)(6512007)(86362001)(6506007)(52116002)(478600001)(6486002)(966005)(38350700005)(66946007)(66556008)(66476007)(4326008)(8676002)(316002)(8936002)(6666004)(38100700002)(36756003)(41300700001)(2906002)(7416002)(5660300002)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DUK3pmo/T/zjzoBiLRtJw6xU3ruCC2VmJ2CyvXlYxOd5abS9CbYvfaTVap4w?=
 =?us-ascii?Q?Zv2EiKJLC23j5RpiD3g8C3uh2n6sWtN12uZ7+rOGtPDKh+ZanQ3ZQNZgKuVj?=
 =?us-ascii?Q?7i45GcvYYd4CyuCXJIe+lzfbLQpKmyvgC74VjxsaPFvuUTnNgYujsLfv1vxk?=
 =?us-ascii?Q?j/fMOPu+2qAgdA4Tu0JNzcxPL32/OmeLOd2d/8myTkAEox1B3NAY43sRohz5?=
 =?us-ascii?Q?TE2kpYKdPwi8ubuNF6TfoyC1vJKv2FZboty4qtVIJiUpJ6lngmd8HQtck/HS?=
 =?us-ascii?Q?M/SyH68yDgXVAJEfz3sHP4CFOx+nIQE8ppNJC2jxcRuTRwVB+LbhspNCG9D4?=
 =?us-ascii?Q?gF8aMtbTGhAZv98h/WnUcYmGslS0PbwTvtIxUM2oSvZEfkW3DWJhKqK0s5CB?=
 =?us-ascii?Q?X7dPfvd35OyRX7YpG5elMLXsVjZgk+XSvw9bSVqcEBGTXHZDBYwi/yEHGw35?=
 =?us-ascii?Q?kytMGOWQj8+zsmPPx5K2YjQ1NEmLO9ZvgZy7FGoyGwiuH4uBBe4fK0BHi2XJ?=
 =?us-ascii?Q?YoPR28+2JX658OGkT+kMzTjDREzq1iptsMAq6/GBcOSchIjJzCC0pl/kalfH?=
 =?us-ascii?Q?i6aZLtaPWe7wNveNBK0ZcyKmv+cn+xqykD4mYMbMo0KBsIsARt9xYlvPfcvo?=
 =?us-ascii?Q?bd/0vgbwNnGoSBCiAm5tpfMFbw7E8Xco0K8a78S/+QdSJcudEA87AzQ+dG7M?=
 =?us-ascii?Q?7T7TfBGSLp+012DmS0KMiJBiAJmXBQVR07z9dZgA5rjEky2Mo/kE5d+vBZqL?=
 =?us-ascii?Q?vgHvqG2fvlJq9hwpLnj0Dd4sVSXVIlBEG+62JkR5czPsGVGUoHrSCYHPvW5o?=
 =?us-ascii?Q?7UqF/fLj1M/Q9QbqloRvNBbr83IyBnZCnRExFgo2keEdtqLWWinvNKcsa9zN?=
 =?us-ascii?Q?g7RDs7wc6ZDCzTUskBtoc25drxyta2mWZZk3TQjPRxpIEfjTk0MpYXiA5J4u?=
 =?us-ascii?Q?fOmntT1FcyE4zwFKa7Gzb4OCNzb8re8CzF3UeU5y8/6gH6TzQoEhdto4w1eY?=
 =?us-ascii?Q?MSLgG9XFEKqa/7JccD4LRsZNGOsYv+Okmd58494qJFQU6X9DROexIHE7UHoP?=
 =?us-ascii?Q?h4fxhMMCVU/T0SnRk8WiX+1KLRq4td4kgSXCkL3jwwE7TDoQObV0ALGHp3AU?=
 =?us-ascii?Q?DELAxEfWay52ujQLRvDxX8Jxqf2EoFo3JIAdxnEt10G0xRB2kn9QdAVDcIvp?=
 =?us-ascii?Q?TRbO/mHvhbL2nnNKmQo75/t5dPVsXWgTLcu/iHhUgrbHBWDE9INaeGec4J4R?=
 =?us-ascii?Q?naouTY+oeVCBxC5ky0NhQeUX29zSvMBAoVao6kVmlzra+onlDxI3bqq7JaYG?=
 =?us-ascii?Q?UXpGDOKufOG1GAJYGOArKpuscZ7jmHw5KRaVIYitQfWFlMXFVhdcBwPXDpOe?=
 =?us-ascii?Q?xN82jllI6ByvCdUriEeEifUC03hntbGy7lA5hBdLyReppefAA26mCa3HP0RN?=
 =?us-ascii?Q?mzv/qgeSZz0RZPEK3NhvUSLjRAcQ5QGCY5QVJyueOuV9IucA4btaEUqd/EBU?=
 =?us-ascii?Q?L/rBJPCeQ286Y+lEsByKbLNe49A128gBjRvHPWjpneJFY5pfvxDK4m8UB/BX?=
 =?us-ascii?Q?6tps7X51IaHfSah9ifB8biHzIgyLlOqLueK0ZGf5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e739532-3628-4df4-b345-08dc256b4b08
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 10:23:13.2624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sj3qiotKyZyoMOMpcr2c3z+si0f1FcBL8LNgTqNaIaa6VxcpEV7KIQl/L6un6O4ttIuHpfUBNS99dz1/GM/MNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6966
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
v9->v13:
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

