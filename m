Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE24631A38
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 08:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2F310E14E;
	Mon, 21 Nov 2022 07:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70070.outbound.protection.outlook.com [40.107.7.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4471B10E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:27:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDy1YQMh6J8hI7aphXt0fe23/GGIWRRdFEz2gq1tmpER3q+7hHQtL0GPZM0nXC8LVOHK6Z+fX+0YmgKCXKFXpcPQOIpw30qaDCv4FgiymH7OhNH7KQQbCxX6Vzew0F6m/kArW0atRl6/2z5M7xryNJSygHhECaFj4zqfPWWOnIOpMyXLy1Wt4xNsAVcHwHYVITnJq2bZqb+k3Jy5u6ge8OhrQFgtP/cvozczWGjw5UA48b4Allwh1e4wpZZjqsT2OSci9bYM/k4cF7aqLepR3eAVBUDrTfRLMyou0uJFAEFgyO1WIhzgpLxa4eDyOahmwjuvSyZ0Yh3pssw67WrYXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjTJ6MF3Rn1jPo0En4pkyhMXJaPfNS+Sm8q173QdKvc=;
 b=oHzrkIvYM3Pr+tZPiBskhh7EdANj658S9O7cwqfHpDsexwuq1KkPe54BLBmq9yzBFCJ+cbDGyGSisNu2Q9qPB3oIms0qowKzzFhbDVsubvlJd6sU9RwP6ruEGXmyrYvbWDo4/qQZq+7HiCi8/O2B5tPTZQhFnKyCBOh6JxaqNvLTAulGMzAgAkQNgkE49O7Qa1Li5N3+3G3LetkrOzQUPv/cgUZrCAgJOY//84z8gKJudT4DPM73hBhZrkzMwNUE9Vh6liwbC0caF0dsuLlM2ZTEstb7BwrKCsaJVYPOZ6C8D2/8FOYws8I2hewaWwsmy5GatttcdG5jSEHriE7YNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjTJ6MF3Rn1jPo0En4pkyhMXJaPfNS+Sm8q173QdKvc=;
 b=WDsxlML3pLvdx7WNimqKTgKF9m5fCIUimtBBVNGfUeuNn1SGTnYqmuS3RCKWfXoUXu/TvVTyGG8/ppvpj7RkLUFZQbLVGNkBKbN5dJ45jSLGdVtBruA2LvkJOSlAvXuBc4A6ffkshQvWr175NBpSucfZqly1cjYCZgY7O2qiInQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB7638.eurprd04.prod.outlook.com (2603:10a6:20b:291::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:27:42 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:27:42 +0000
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
Subject: [PATCH v4 07/10] dt-bindings: phy: Add Cadence HDP-TX DP PHY
Date: Mon, 21 Nov 2022 15:23:57 +0800
Message-Id: <5f8a3f15f744e201171c20505e1e3c47f5a27dce.1669013346.git.Sandor.yu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbd77de-61ee-48f4-1bc6-08dacb91e02d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Wab5kWvK2mUfE+xNlK7PZDTOMOcLtc0xGeE6eTIn8BmS4hXY7pXOhB6pO5SUZcrRZBevGuPOY40laIllvydMXQEgHHM3Q4Xb9hkWCPZf4fbVXBfdX9QpS/+3pDCe0q/uR4771BSWATqC3PkvlrAIPIlznyugSx6hihBoWqCTPF13r2OcKoIeAtFeEfDgX+yVWbqsUlBsg6OVcNVHNDHzWQdBvs4VbDIdL97Nssj9k/qez2wvnhH4wHQyhfZkN7deJpiaktKLPAhRiJTS/O0JEcc9VXnrfpLlc+Hx0How2hxiN23gvOxsusIN7wTERoGAOs+L/iKp1CSn0XHMR16BER28oTeQ86ODXbixJ8QdmWUszohzCvzdKaZ8H6WeiOgtbBpdLXt8U/OkIUqTMtLbgM18kXSI04wOf/D4KI/Twj5FyyEajuw/eACtR/Be6HdA9Dw5y8e5LPhct/wEAKghceMRORu78HtSz7JbMHyu7Y3NKE4OTKIuVx1o2X6b5XYaY+MIcLGFa8wSdJjIJtENltYsAnzjt+NzEw8EVdtg8hJLIxx8RVdnvmo+PwzhCM5w9IRHwYWAgqFw/IJ5zcJNZj6EaOu8PK8y2yIjlSHPhjpEnf0bXVM500u398blHqY8b50Xe79k58vz3ObvTTAp8grK7jJVrzPPLZFz6QA0MahTIvkXxBqZJOa/uLLP9zddcuQAe2LWOoJkCfNReD1B050lQbqY5QiggDvt2Z9cD2TBzTj0NkaJ59cAKpXm03Y0bGzPAt6qFsMMRIzecqznvHtVcz0/uIMWUo2J1lW/XA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199015)(7416002)(8936002)(8676002)(5660300002)(4326008)(66556008)(66476007)(66946007)(41300700001)(86362001)(921005)(6486002)(966005)(478600001)(2906002)(6666004)(6506007)(26005)(52116002)(316002)(6512007)(186003)(83380400001)(2616005)(38100700002)(38350700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?puNrU/8BZccFld0MVqOVuoWQHBHGe+XQrs/RSMOieYf3JSXlm3Rl/cra7Y1S?=
 =?us-ascii?Q?4EM5txELThcDV4rjll0yFO7X+JgHHPnUCjS87xMZP4lgJcl4OPaJdYHc5VGq?=
 =?us-ascii?Q?Xo2RuBFt2627r16ircoqiqK3l/JjvxR1wPQnOPKoUnLU8BYqnlQ4C3DXNzRi?=
 =?us-ascii?Q?GECA6MgheiUEmzaulFPGIemhf19JcMam6mSiSHfrestuD58xs1S8lH74G1SI?=
 =?us-ascii?Q?l13Xbi+9V9a+LIHq4DINDzMzm2t54BlB9EzjmkK6hn6UNKWDg9Pt7LoVDjHM?=
 =?us-ascii?Q?N4umMRdiZsgjhWlYgJQN52jJWBbdj0gylzfSfU/BoXpTL/T5lAGaky1mCfeq?=
 =?us-ascii?Q?CX6bb6FXYxssMHmq8S/g86sluvp2g2GGTF03O8mEl3BjWg21aIAFnvd0oDwo?=
 =?us-ascii?Q?7eRO1QlYbe4jpVogkJHhVCF9yr51p/Om9p21biRslyUVLjbP8BBDmYLBLwrM?=
 =?us-ascii?Q?jHQk1qlwJlRrfrEPnvS5xE0iOuJ5T6IesveXtUDcIT8cHMeMcfCEGudoJt9J?=
 =?us-ascii?Q?35hB6dMPcZKPNP15xKx2BRvOr/sB2ZzpfHFOhVDA82/YGNe/Ry/r8bEM0gZ+?=
 =?us-ascii?Q?P7hxIVE347NFf9rq5WyrOSHqiTm6StBuQm8wSGzD3cxYMjSaa8cb43Bbd7vQ?=
 =?us-ascii?Q?5LULOGR+0X0R/+RZWQ/ofxqUgchvmqCxH+FMS0L10ZpntAoCNcgWc8F2uOBX?=
 =?us-ascii?Q?ufx4Z+/3IR3DPxGJ+L0cmg1mHX6rFx+jGS14cDlcl31eMtfW8dYcW46c0h+O?=
 =?us-ascii?Q?1QHnG1GVqURLZnzIrFzK1I6odYFn4vGTPOuOBEVuZYtQoI4IA9ZTD70Uthxw?=
 =?us-ascii?Q?J4Jwg9N2rqwfTfyNmQPSp9J0RRKGUJteJfqqFfg3k/WvpJL/7IVEYXNPIOe4?=
 =?us-ascii?Q?n9icyMWTrodKosAEExL50sssADJiOFfe3ymcIkHaC7RuGVjm85nmXzeY5NvF?=
 =?us-ascii?Q?7toqb71Jeo4d8iji0Ai9uIhsCjaA1yA7ME88ZBeV2Br8AQ+CwMkhq2aKnlZJ?=
 =?us-ascii?Q?vuGlWZhcF7txwlNAY3IqSe51mv32QoDz354bbnzcWZSHyv+coMHIp9TOgLcT?=
 =?us-ascii?Q?kuciPqQIWPdjjFrjKHYHPYUvjKUf/MIIOWhSynj7yKs5cwBXjQswK7pUqWOT?=
 =?us-ascii?Q?NQ6PLVm8bcenSpgsm09JrG9Ai5BWXSD+E6xwDfjfmamok4GMbvCLF1dyXvN+?=
 =?us-ascii?Q?gI35z65ZWVEYFcQyOHAwcuYsT+vsJzFcxTEVSL28nXjvwAxdLhKw+AKzVgTX?=
 =?us-ascii?Q?Mpm5/nUns+zrbQtVv11tiIQlxLhlmYF4RpxgY8iiNMUYNftoHEOFD5JbSOCU?=
 =?us-ascii?Q?Zv51By4otuyBJPlqPKj8aJbjNYzqbcBDI7BowqfevLCOEszIvIG8tJMfa8Z3?=
 =?us-ascii?Q?57qtN86CcKM2cBzFheM+oQ2MG7DYv1z3NrqdpFNZi2O4MPVPFnTU7Lk9kU2f?=
 =?us-ascii?Q?/Zx1lQn6Jpnrs3Ty/2+pvukZffK0zINsE7iuHtohRzxa1OpZe0Wje6B72Fhb?=
 =?us-ascii?Q?9P4nKpORUiEuu+x3MF38pWwNAPnTMWvLbWuvDsIshx9NVXw3+zy/kUo+2mSa?=
 =?us-ascii?Q?5uVD/xm+Vja+ZA3FE/dQ5N2Zq90jo8PRXR6xbJer?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbd77de-61ee-48f4-1bc6-08dacb91e02d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:27:41.9970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8Hc6H2OjrbdsCdPPMUt1cRyPEVVRcXA4PVj44eVwDPHYXs5oapbdHFQkia8hGemynKRB0n07nxz1RJ572d8nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7638
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

Add bindings for Cadence HDP-TX DisplayPort PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../bindings/phy/cdns,hdptx-dp-phy.yaml       | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
new file mode 100644
index 000000000000..b997c15ff0bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns,hdptx-dp-phy.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cdns,hdptx-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence HDP-TX(HDMI/DisplayPort) PHY for DisplayPort protocol
+
+maintainers:
+  - Sandor Yu <sandor.yu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - cdns,hdptx-dp-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PHY reference clock.
+      - description: APB clock.
+
+  clock-names:
+    items:
+      - const: refclk
+      - const: apbclk
+
+  "#phy-cells":
+    const: 0
+
+  cdns,num-lanes:
+    description:
+      Number of lanes.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3, 4]
+    default: 4
+
+  cdns,max-bit-rate:
+    description:
+      Maximum DisplayPort link bit rate to use, in Mbps
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [2160, 2430, 2700, 3240, 4320, 5400]
+    default: 5400
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/phy/phy.h>
+    dp_phy: phy@32c00000 {
+        compatible = "cdns,hdptx-dp-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "refclk", "apbclk";
+        cdns,num-lanes = <4>;
+        cdns,max-bit-rate = <5400>;
+    };
-- 
2.34.1

