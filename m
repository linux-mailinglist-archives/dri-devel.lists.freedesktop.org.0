Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9F18291CD
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 02:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFBC10E554;
	Wed, 10 Jan 2024 01:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818C210E552
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 01:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vtkoj8kXWQCmtS1vX/PfPkysb/gq/NRqkzibMwv5e9RZBg8mMZowZrzZHN5rIOt0r8KUtQt5OT0hG1ddx2AMTDcXZkwdSiWri7LkkfwYM4uZnwuXYVrm/uaGxen8y+qMB4TN1s2uFBCQSx1fYMHb7q2L0YsvnE0Z78BgqlEQcU9ApwLykCkAA6snmG1sziDDSEWw2KrpyoXSLyb73qARJusLl0Ge+IP0BaLWVhOolsp4a0jpvn1s2RaGnHdLJpSYf5tBSPtA/3uHLzETHl2Z4aioSVOib0FEGqN9jvl6Ztbeqa71a86hQrRFqoJJee/WQCr7OaLySxgCPQtLx66nLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3pL2LCrHukCRQy9fQEtsI0PyqQvwlm3/xp/GIovThc=;
 b=oEL0/n0/WijqSCTgqET5BF0b30sJGYA3UQyQHL0Hze5WZD3ZAVEeeZtzdTqRtflrfn5P9ciPX8y6e4EWECPP98OcbA05tYcvz3Cya3n1cMglf+tWbjhCYF1sQdUQD7qmy+enMJUjAjzv9OmFjJ9JN2zn3Ua4iJiRWw67rINd2Q58iG16v6G8HjTybRzI+iLvjs8fXukyTpcWU48OXMVZqJVov4982o2NJlG8xWB+jVYYsNl/ZuqRYTO4UoR1oMkBy33o1diCbDqVVVVGJyR+z2DGqRfELSO2QuTtAyloQ1qgM58yNtCvV02PfRhH3Hy3J7Bi33M/aLTN+NnE+T127g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3pL2LCrHukCRQy9fQEtsI0PyqQvwlm3/xp/GIovThc=;
 b=WKw+j2j4np0U7RW2OVDee1dLIwZgaFL2NvkfwU8UKIvF1E5mBWvlnhhaY2SfyzR803lIp2xqey/aUYrEeGIt6dbikQZJIfQS9JqZYhAdaOK9xuRJscCdxnjfZgc30oF6DVD0Z0v1hoOrQ2upDxkTUXcyv/a8EtVP50JrkZG20hw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB9836.eurprd04.prod.outlook.com (2603:10a6:800:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 01:10:12 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5%5]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 01:10:12 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v12 3/7] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Wed, 10 Jan 2024 09:08:44 +0800
Message-Id: <5b93362c9157b8b70a522989821c870211c021c1.1704785836.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704785836.git.Sandor.yu@nxp.com>
References: <cover.1704785836.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI1PR04MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 758a2b8b-3cdb-4fb5-fee9-08dc1178e58d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EP8lkvUHa9n/6N40WYfUZZ4IfMNCUtr6urSHPUICW6ILHVKCXb1rNq9U7oLQsoZq8ZKhEgfGRyL53slid0xEs2YG30QxBpMoW69DvaXT2yO7k5l4XImXxh/aQUULyWoPZ3hA42iIYLdXtPsJ5p5Zk20cF9vraie2jSBAmOI2zIcbUOR6pDq6BhsHyUNyoPoj+Pv4BH491WIrfOv64FlgzVRtMtP/JNhlzupBuQ277V1QQx/+h+UfbruDeVSXH/nKTOFNTVYa6Dh+VpzoEz3T19W3tTYYDVoqqMzjMFgD/zxL45bz7Zcj36OmnuOwgkWCHEL9gVGni01n5mAS5azhHcJMPCco/o/DfaUijD/bsPovzvLmv42/lntctGOQFag3X1b8rxxey0C9yaiGvTuv+1juB4UtIta1Q86rzVTovnM9kEds0XMVk5iT8SYrxvwTyCN6Fj/u4gfOa9yM//lv03WaVzH9zIIMxnGIAlYus/5rs+7bo1BUmHizs07GAo07OfVUpzUKAC8SKLwbRzUozKU8wMQRvKcTgDtaxx9K5ILfkodoIfpqY4TQjDelMHWhunZ1g1qEnH0LsGjpM4/evsNldN1pqrK/o/SkKSAPDTYm21Mwc1pUpdyG7jJMg2/O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(38100700002)(38350700005)(36756003)(921011)(86362001)(26005)(2616005)(52116002)(6512007)(4326008)(316002)(66476007)(6486002)(8936002)(66556008)(66946007)(966005)(478600001)(6506007)(6666004)(8676002)(41300700001)(2906002)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x8KiTbUzgcV7C3M7aC0W/uGUqXJvm5sONJXT/rNxoZHVbzAIFbkTwbq3/9RN?=
 =?us-ascii?Q?k6LUuh5MjUxZLUOquMuxsszzsFUE3hR3xrYJAShUA0WfdPjQhApXFkltaIAF?=
 =?us-ascii?Q?bEuPCrMlxPkl5nQxD4CQd6fcpwEZeDRAs2cW++W8ILgc2t02clBsErd4IM+W?=
 =?us-ascii?Q?MxCIudK6u0wVlhkEsOnuJMyURUGkokAPs14sPd5wnGGyEywSWZp2hg3Zg1hb?=
 =?us-ascii?Q?0CaYelWyOkGzBve6bDP2VgK3mfhbl315tfqS3fkU1C+Xjfb2a712ylEXARbx?=
 =?us-ascii?Q?zLeOaa0AuPQy5MbmxN37wc4h74GExtsclRuGP/azz6h1UCbTvOnjwb+WDwoD?=
 =?us-ascii?Q?OZVuWx09BsU9vKGveg30rpypTCLr0SQGm/lzGm91aeUeKC3k6P7+Vm0DWIjG?=
 =?us-ascii?Q?eY5czJ1fAAgfjbQ+mEabkNlhUi4WdhTG1eIs+SeZ6wHyEEj0NrNfKLG3+gOk?=
 =?us-ascii?Q?hLQuUkprXuzhKfKzcCI2B5YIAivspiUu19aQqM/tOQ9v+i9dVAP3/ARo3nQC?=
 =?us-ascii?Q?wbPJBj/AIIeiy1wdEFaFI/6WsES1F2J+ovme+/66yRUvcGlnzo+gmRZ1ntti?=
 =?us-ascii?Q?8F3fi3ZnKX9HpjzmRDCDhLr+RUwVkgoUakZ48kHMxpMzQo4QxMU20YJRVEnz?=
 =?us-ascii?Q?sDgNWtWMAhZzQhUdIY/uABn3p7TJNJL518S8iEQi7VySq3I4X7Zaw4bWOezL?=
 =?us-ascii?Q?VWyW9sBEsRKHmxoYKd0t2qmPWz6ta13jkaxfU6hovoHX7rPT7usWsEKjAXEs?=
 =?us-ascii?Q?nwiXt+dbGr3Cka5f9QH+OIgFvZWJC9+KP6I+YEkKIisaCavkiRAexdaFGYkr?=
 =?us-ascii?Q?SPcbGjsMOPhz73kRrk6TRyYlobi5baCpS9TXdOLCDTpJ+RbksI9Vcc8nZD0W?=
 =?us-ascii?Q?4uc2YVKe5W6nU9GN90yhX9dWcolEzDvSZz0tqvbI8UWYj8pt5rUWyLYcL7Qk?=
 =?us-ascii?Q?HUcT3iVNdo3GTrFxTDoS++5SEXf4zaktNyrCWHhqsSvqHzp7lKjFpJPBctJ9?=
 =?us-ascii?Q?7dSxonyTSj/SYkRwfhg/XHgFxfUGicEHLZ2DAkBtTKFSy/lfxqkvzZXDnDrI?=
 =?us-ascii?Q?YNqxx0NIAjnbkPsGyZsunoQFBT5f2f1fM0p0Rrl94Iz8kAeeQvnIxUcK9O7T?=
 =?us-ascii?Q?NAmjM10REo5Y/yReOWVsf9sM1tieyOIdPaaO7iiAFZEUPb0969S6ZKXxYAS+?=
 =?us-ascii?Q?kWw4k5AlXkpA16bnNpZb2JCCoOIPrrit16atSWAugHLo2HD8zbp6Q8G227Nj?=
 =?us-ascii?Q?zfwUa3BntVc5I3eAgp4WmSXch5oFZsf1TUiX0io34Sb4/KWGGHyUpajrS40F?=
 =?us-ascii?Q?9n8xknWeu29JkERWDycMAn8j+D72M8tP+CWFJotJ+wuHQvnRBnAriHUptc4W?=
 =?us-ascii?Q?UoDSgbgTI7CUUjmtPH/y4yM9JlA1d95ru32Ple1G+AiDehR3bYTgwiRg97eZ?=
 =?us-ascii?Q?OHWc/ZEu3x3gvJYaH8IS88H3gLjr4Dx7w3xqwY+WXgiBNIS809DcZlbTYpNR?=
 =?us-ascii?Q?R80D183hj6gfMRcwzlqInNEr2nXeK8FfQuoTphes92Zlyk57+I59d7L3FgH+?=
 =?us-ascii?Q?Uu4zq5v+HLbr0Ed0bD0NGf8BIIMivLSV5v92vdtD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 758a2b8b-3cdb-4fb5-fee9-08dc1178e58d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:10:12.7134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oiIRjMYwMo0Htljn3iuiJAce/1bw2sFRct3uAXnOYd4cmnvtfnXJBZVhZHsfGMgUoDwJswJy/BOdULJG5TJOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9836
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
v9->v12:
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

