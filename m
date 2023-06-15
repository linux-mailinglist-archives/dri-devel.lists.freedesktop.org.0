Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557D2730CB3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 03:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B2B10E110;
	Thu, 15 Jun 2023 01:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DE610E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 01:41:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ac0rPAlAIxg7+fNBIRbqqXtQj9ydi/846ZCPd+IjNi6/G9amMmyfgttSiXQUBqdl72rwT2e3c6rlPPG6E/0VYNQctooAsPc5su/illo7MUqIHEqs05BgmkKtqEhNiouT9h4reKVudQBsVsk4QEyFkFQHlXrjMajgIV1FEOHuR4A/ryCJLR1BHfc73EMs/zU61c63s/+UG74JkFP8yKEsvWhf4wWkGtFsxpQ2940bjMFvLPeKz/vBUBB0juOQPIBDGxqNxjh5QV6VIvYZ6O+8fLGt7XEaJqlAD1c8CwE5cuxykbRVmqqchfp4cLgKBQfbFWMEComiGLAP0rf35oqaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8hvg7VN9BVjRU9SRlrK3LZEVemcCiXDnSCvA9fTIV4=;
 b=CEPEVbG2+0CmBx+dJTjPMErcNCwSDPvYti9Z40g1JE8EP7ZJVzX4CFQlPMFi6mYXfWs1DqGvnGwOc8/OFbvKJjdYHcj8iRYH0LND6bYCsFPObW7SH7s41FKhBPbVq8miqP5F9e+hhvwWEAd4hatWz2QWfacu/U1W64+1bdHydWGar00r7xTGS0FZ9cuj4B6ZGUFYCL3S/Vy/2Rbmt/w4fDi/wZv0f5ejg1BQNH00EzTydQ2aEmYnqZBoEmhN+5CyOfanuaANrCcetXiRdL6HAux8BuOxfBB78mnP7tKa/K8w67QuVHSpl3kFECt0ZmqV1YTVtekedL0CRUf8I/D+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8hvg7VN9BVjRU9SRlrK3LZEVemcCiXDnSCvA9fTIV4=;
 b=UItp1MwSVBhuvlcWZ5mjwAfwP7nEamNfUoO0N8YG0Z6KvtEx3a7mwBZhSP5ho9TlLwE2intO5i5DODMF/Z3jTbd9NLcn0P/Uz3wlq+R1I8ZqRGkHlc8fJhZnLg8hwXpcFvUv22GLi6ACKZGtIpgw3VGwSvHUtkD8qvuSxwakHtQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 01:41:26 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 01:41:25 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v6 2/8] dt-bindings: display: bridge: Add Cadence MHDP8501
 HDMI and DP
Date: Thu, 15 Jun 2023 09:38:12 +0800
Message-Id: <8687f2221299b120e12f29fdccf264e120227bd7.1686729444.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686729444.git.Sandor.yu@nxp.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee113f2-bb04-4b48-5231-08db6d41a146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IcCg/hpVt7kMnQ/MfSZu4vnt685xxuPtixFLnC2AiPoOV8R/PdTiKMvLcGRvxBZK+VGCE2LU8Wiyh2Rfcb6Iq/K2C0sCLNpWvhv0PUkkkOF9xPstvGsPyqWtWOPsSnNmfGA2aYmlvz8HbEKu8gri5A+/dk2bStRxx7US0YlGehCt6Ef67WDUVUVMsPSOj4PhIrjLhLTaxYqCDtnC3bjh3WFhrP/fkJe34DNCh3TPdAzDT0V9n+eDJdcRUiYQBSOQaWxUgsmurpgz+y46cOCbg4aIdlGqlanUqohkQGsT5M7VMKIrgX67uQhD4SVqyvGIjEi7lQewspSmllxmHuZ1N3lrYa9qt7U7kAoy0C+d1co3vllDBWK7knE2rwMDy4yrwrGTVkPXmF/xs33V1ll5WvkwnxSMbM5mMdHIesSe2hUwSbaMRUpkob1ZD7+HWf/E6S76HsGwplxJfmYG5W1AOC4Szcg+nf8cq6DrBGdr8tW8DU7JXjduhUrv9GFftPKWkeU8UCxUF4Nv56TQ/nvsihj3DwpfV4AfyYBGK+THXkRg90RzfdaBHk06o7lTF9haqWG7qvD33ve3NJ505d2TEf+IkK3POAijwEo8Y17UM6qE08T/J6ILWSKVzUx06j9KR3T0SZghwXToFfEz5Xdz8+Kr6LTqxxBarvQAUKEftsU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199021)(2616005)(186003)(2906002)(83380400001)(6666004)(66476007)(66946007)(66556008)(52116002)(316002)(36756003)(8936002)(41300700001)(8676002)(6486002)(966005)(86362001)(4326008)(478600001)(26005)(6512007)(6506007)(7416002)(38100700002)(38350700002)(5660300002)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZcxUoiLvA08nS7iqv1WBhkOKIQ81e07B+Fd/tP42pWI0WpMNua575RBvVQbn?=
 =?us-ascii?Q?u4KbreEyhIfq95WJnBHgMOxB5YBEZsi4FnnBrOog5b9pGseqzNYCOAW4S/ee?=
 =?us-ascii?Q?vV7cMPDuhkLUC0zgsr/9VrXQ7Sd9ASKB4zYFWyTc5wzTaEKj1jMBYIHt0MzL?=
 =?us-ascii?Q?Mw9x+zZqqNVfhxRCdX7bT6C2OVfOaMvHN36dxLl84Csprbtu58DfeywXAnwH?=
 =?us-ascii?Q?uE/sgprjV81BOgTBkGxcVOjtq9MZ0FEEonOXez+S4Biian4wnT5COlu3AyGZ?=
 =?us-ascii?Q?WKB1Mz3qhT7NOmIGTUO7DgIRBY8arfBrmPqDm8ggN/jbSivFeW5ohY96j8le?=
 =?us-ascii?Q?46PFn022K/NiSo+UOIbNMSaJR+T6UYN3fh6oiEkHOLVdNqyLx/w90egflIRz?=
 =?us-ascii?Q?czrK5o/1DSQhw8Vm9iGFLZxHyPvymW4hiHBFwljNZGZNYaqicbo2kKvzgeTN?=
 =?us-ascii?Q?Vq9DTuKQLgzom3S+2OVxvCjR5SQSe8l1khI9MMEeXA5UlXdp++ausTtgZRTE?=
 =?us-ascii?Q?0f3ZVKaB5pgtBP6bWR57lqz5VLUC1crHV996bDwUXStOGUO04m9hwU9VBT3Y?=
 =?us-ascii?Q?wQndgqJlYXeTVi6G37dO1KWVMQ9562H2toorq08jnhzKj6eTBGoSvWrtc9Iq?=
 =?us-ascii?Q?KYySj+Xfw/vnr5nhVuUcNgiAAyyza45yDcmtIB3wkUwQtucVWBJt7bBGhCjM?=
 =?us-ascii?Q?9ScD937R2pfPnSPCqGskzlYr6S79DqavoyF6gYmo3HgwNA7XpMBKdAAO2wda?=
 =?us-ascii?Q?uX/eOZuJ0YZApjKu4dBeMw9dMrIWRDKtMSCfy+whf1vjSrxy9NeHVY8b9PSb?=
 =?us-ascii?Q?TYcpO70Vyhob5dhbiuF9aWa0VPQ/OACGraDiGlTJfKmi6Wlf7Zk41WmEIzDD?=
 =?us-ascii?Q?67VmU13OMjy6VimCPegSyeg6ti5kMql7UwpBaBuPfdfhrjUvjuBzzhPIajri?=
 =?us-ascii?Q?+7unPfPaSsPTA8JGu2NC91sdkven65ECWFGyqV1i7/vj6XXE5Aw0tzkSJoI+?=
 =?us-ascii?Q?4zukIkS5suiz2TKXWLmRmqnsHdurkXr94G2reQQwsAA/LRDI/8XPcHKBOWWd?=
 =?us-ascii?Q?qlRa0NjH86ucl+me90SMShgZoCNI58u4iYtR1jxTvvNiSvx/z0GPrgJLi0WI?=
 =?us-ascii?Q?n+kS9qzof5HYDmymz9VI0I4tcKQetrA2rzPmlksC6cqJAm1OTOE7hcrKR9gX?=
 =?us-ascii?Q?XmT55uhI9KA3vACEYe4lsqg2N7hoIAyhLof9qkuNdk623ynYPhw1/l2d+9Y7?=
 =?us-ascii?Q?xgq65HTCMEI0d0e7zJ7vu/MIn8XPeFWI+2tNkkJODl5exH4vk0S/5TROiCeI?=
 =?us-ascii?Q?FINXIXXVjPLwjJEX3Zo88HGJPFQl3/UDWMwRxq0op9+HeZPM+7xUfd0XFedB?=
 =?us-ascii?Q?aHA7m8+7O7VB5Zvq/auE9t6YkIOoOfE35MvmOvi42uZtzxBgNNf6Hw9uwxgP?=
 =?us-ascii?Q?lwPpSt0mF0sh6ud+mBe0Nce36Ld/rxJsEfb/99ubSsePAeCElaYl6f1my45p?=
 =?us-ascii?Q?KD+T+Z3ExGE+z98JQZqjoIVv00Hd0hFb1DMn7/u7x0tMYGp3f6fRMwxMo4bs?=
 =?us-ascii?Q?O5p3E9u/3/a8eW6TSC/R8IXZVqUEtST6BLNxEuk3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee113f2-bb04-4b48-5231-08db6d41a146
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 01:41:25.1226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4upGUkBAJJlUwshUPjElRrSdwL9CJnzwllEh0LNa6WjIWTRtpF+itYMlNfU0zVpvODbYtJkdnHRnItVwXdUyhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
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

Add bindings for Cadence MHDP8501 DisplayPort and HDMI driver.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../display/bridge/cdns,mhdp8501.yaml         | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 000000000000..a54756815e6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,105 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP8501 Displayport bridge
+
+maintainers:
+  - Sandor Yu <Sandor.yu@nxp.com>
+
+description:
+  The Cadence MHDP8501 Displayport/HDMI TX interface.
+
+properties:
+  compatible:
+    enum:
+      - cdns,mhdp8501-dp
+      - cdns,mhdp8501-hdmi
+      - fsl,imx8mq-mhdp8501-dp
+      - fsl,imx8mq-mhdp8501-hdmi
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
+          Output port to DP/HDMI connector.
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
+        compatible = "fsl,imx8mq-mhdp8501-dp";
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
+                    remote-endpoint = <&dp_con>;
+                };
+            };
+        };
+    };
-- 
2.34.1

