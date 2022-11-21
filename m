Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EB6631A41
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 08:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59DF10E150;
	Mon, 21 Nov 2022 07:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311A310E150
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:27:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHAClpkFkP6K1/U3wHJq+PUEDmceZz0SQ6sSU19Fy98q8RTVCmkvYh+u27E+6cJrFrH0PMMUM5FHUoQeCSmGKTTnLWJGsz5iZb93mUflNgY+E9Tm7XTBoF0yOSMF3vPVAxOBEuzf0Dc/5dEwaI6outSs0ksb7YNMssU2j4fNhoyURVVP3S4JZ7E6iq2+51giXmyLj/R8NaNTbbgnfX7/1L0f1NkPRQgE5aDINQDWt1TPpnie8S3ZhFzplqJyXBmWS3cJ39nhXVV1zALpammBEtfTVmlRscnDtcJI3x92xgDuhpS/aAKRu6oi1MQWg1FQCPOl7ahsPkrbL2dF+ImWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9epFDKSsaiyKLOfhCmab/z/00W+EHXD63nTtH3BEAvo=;
 b=BwH0wcm50RbFKlPkag8a4V8JgLBq0lVhFpd6nd6LJNNms11tacH7bpLyw+HRryyTJxjTn+A5QQfHsXnAG5Pvc5OxbTW4x23Fecui6056hKZ1o0hniJFnf0ot2Nq4oi2h1Ozs7GCS14i9m7QPh289vgcjiRcig3xKHY7sHGA/PJVd3Kj9d/e/QEkgxsoDGaIMcXDiqK6IjYUZ1YzoVaqQsAorWXyl0wGjlEmlSgIneUIciIfZRWpyXlhGn6PatjykVHVht1Gc466CPN0kE2y+lq2IGtEWVjjSlrOhuJIgL5VChBfj8gfekwBtdQ++TB5m/T6AFJoSr/zhsxrMpKvFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9epFDKSsaiyKLOfhCmab/z/00W+EHXD63nTtH3BEAvo=;
 b=pOTXxh8boQ4KRFa9zbfqU+PAKl1U+0pth50fgk1n1DUVfyStAq4/PeKDX3F2IuInE8I4/JE/7u9oAKyH1TBHsAqT+6dMGGjaZ5DRwg2GWM4636X8mEOdvzucbmeTNpXW8+4f0trsDAcRR2s35iF/nX8l16T0wyXckNXM9sm4Pc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB7638.eurprd04.prod.outlook.com (2603:10a6:20b:291::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:27:55 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:27:55 +0000
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
Subject: [PATCH v4 09/10] dt-bindings: phy: Add Cadence HDP-TX HDMI PHY
Date: Mon, 21 Nov 2022 15:23:59 +0800
Message-Id: <2c5da069419541e22b29079467887f1a1bd3cc69.1669013346.git.Sandor.yu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 18860caa-4a65-4f30-accf-08dacb91e7ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kiN4RpFdOo0ehiyQLLdMlEZbOdx48OwD3ZgjiP3XR7gedeGmbVzHv4y7XUWlJCbZLCnzHqmSbdaOARwFeJKesEt6L1E8DN03Gy7Y2vuzv8paqJb4GfRY9WiHAubT58jJoyDohnreuLHFSpMbDCv34V8uHMNOEMrDret2GzlZ+AB1O9K4n0v/i5lb71rxdK4QZm8IYpa2LiUvOHVJ7a/toe2eUjTuCxpkLKtudLJgC2/hmb48poRgKYbupNmo2SRvO/f0dhnUcLo5Tb567m2NxWLxOWn1hMTlGLsMltqnSqhWoPn013GHLabqdLFcXfMIuBXu9dOUSEjSQ2vqLcI5QcVaoyHktip21y2UNnBUbdpi1iW0w/PP3x9/WQ0c9T5vszGc67uO4FfXjm22azcDc/UJ4Dl+s/MSBYPBPolcpTYLkrJtygn9rcntG39Q9w9pg8VSzxLruxtu/YlVg4qmJIjGoL9UpNu14M97yT368hq+LBRb6jbGE2ryA1uMMFQb7cSNci+IIHAhAXpBxBpHtyVHlrEkEnSgLKBhlpPPERVODfSO4bM1ZeAjYEfdDN+xFJEAsxT0+1R7qUt3+eCQLAzld+yf+F2qLF1SYSKkml5uFTe5LrrUAK0e5TSj7SNcq5MO/rWQCcVLlnu9Y7dYtOsLznyxLQDpFMIkp/OAlaiNC6mP8rCWLLzaj2jsn4v6W1o5jZmQD02c9KRvUetNe1YMLxXbJf9vIYm7d+03sVC478pp8FHZgfconRTQ+9KZ2Eb6lYNHla9nbq+OAAks3j1NlRWE7/N6Gdq8Ip6WBuQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199015)(7416002)(8936002)(8676002)(5660300002)(4326008)(66556008)(66476007)(66946007)(41300700001)(86362001)(921005)(6486002)(966005)(478600001)(2906002)(6506007)(26005)(52116002)(316002)(6512007)(186003)(83380400001)(2616005)(38100700002)(38350700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gergtp+pRD9bztFfHxHbbU94Np/p1o4HdNVaXHu6ThEj4wq1eWoPRlDMP7Nq?=
 =?us-ascii?Q?tLOshl+REn9Vscy6y/qPCHWVe8GVYSLJjSlYttde68snRK5SWfhexEXMI+vy?=
 =?us-ascii?Q?9DIFg0tAs1wAz67MbRRdKXW1aQx7dr+VZdUo+3jIb77uTgyps90ZSgkXfDrX?=
 =?us-ascii?Q?Cxeku7mMznJFe4Q8qoqgs5HDR3De0Pv7qf0bcCHySaRB75/BN64V3sViPC4g?=
 =?us-ascii?Q?nJpEBHXA255juI3ebCyaZzzgW80xs7KVb8esz1HY6uiYdFB5NlX22yCqIUOf?=
 =?us-ascii?Q?LwkB1nzb180XLbZtBew0eAY5otLK4+tS4kWik1OI4E7hIllIc8J80fEGwvqW?=
 =?us-ascii?Q?+L77dIlPmeMPIqOHdUHY8vrbMMCaT8l8nSYCp3rQjucHCEOJhzu8j+UzeNPU?=
 =?us-ascii?Q?sCQV3DaTg6pg1Y+e04CYIY53c+mOsowMy87xvgUVqEeg6QSkiCNKos88V+n8?=
 =?us-ascii?Q?ZpEguQMKwAlp6poJ35EVUl6Rc431P1V82owrIlFV76jA1cFxk01dPAlrlU2N?=
 =?us-ascii?Q?PgSDfXmwcbhughuUenP/j2CQL7hY56EDP8c4fxrOyQh5wjfMx5+ZCccZWC8c?=
 =?us-ascii?Q?XxFCmAoXO67mclahkGYWrvvhVK2sgoWtTUC1lGJbdisxHs8jv3iVSS9rLz9b?=
 =?us-ascii?Q?bY/uO1KuifEa9fC9ibm4BTH5X9KIj64f3Yn/aHDbQc8jj+IW7kV3KTdeRf9k?=
 =?us-ascii?Q?qybeHSMw7E84L+E58S1WJx6tPhMqY6vONDuuypHMxD0Gv+xUlNvJI3/FzgkV?=
 =?us-ascii?Q?89Fsx2ip4SwTUKQiZpWOLiHplNxsOMq8WpH1A3PEMaT7/A4cUNqEDn+5A+LX?=
 =?us-ascii?Q?2vu9ca6f38e9ooO+iOjZFBmwQy1EYfHtVeAo2LLfYuDTpch6QcvGABKGFa5g?=
 =?us-ascii?Q?0mBVpbk9ksR7SHo8KwkwQp3h9MAkrX6mCxxky01LGBC6ufQD5ChbbZwKBen3?=
 =?us-ascii?Q?QH/36rykgU1UVa0OBnVdDTyMfcpRl7qU8CGdg+Ces7yd2LdwWL5NFOQgFWb3?=
 =?us-ascii?Q?G55zzboK/z/s9eJ+9Llj5IwUz8WlqR+oAQywVTR5RjeZWuscFMSwoBFsBNZp?=
 =?us-ascii?Q?YwC2V1rk1tHiAFbrvRBlTyRx0G23cV/4ogZwGcrQ1OFQXMzHgpTtxVctlut1?=
 =?us-ascii?Q?Bt8p7QA4LQWqBVWwt4gYL4iGiCbiQHqm8zGW8lvIafBHaFWfyS47igzZFFZs?=
 =?us-ascii?Q?F8qNn3nsPl13+mpUbvhsrRVb3U8JT5V1ul+PDUmmElP+O6WsAMTKMvYrA/Ry?=
 =?us-ascii?Q?Nk37vniL/QbZlVEds5G6ZfaIF67gy+jqEjs6T8f/Fk9H8SHtA4Fl4r33gvut?=
 =?us-ascii?Q?AH3Hwd7rTz1HFEYYNtndtYABmwpdwI62ZbFMfEbR7BQyZnrQ+/hUTryDf1YY?=
 =?us-ascii?Q?pvXpnmb8Z8Pe5J+7utjTpIYMF8QKI+uBBRn8y6ypSW2CK+WTL181tO62+Bnt?=
 =?us-ascii?Q?zky2jlqoXPP+Wg98hh/+KwZ1Qmjw3mZEAuFmhPtDytv2LpxQMWMYXfP3VvVI?=
 =?us-ascii?Q?fF/Y/uy8KrnJpHcd9wdZFef5tKyc7qhTNVDJIUtHHXJc4x3h7+/ug1R0gpVZ?=
 =?us-ascii?Q?QdTTawB5Mx05sD0vNQOVV1e+QHV33qDff20X299p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18860caa-4a65-4f30-accf-08dacb91e7ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:27:54.9834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4PfBVgRgkOoaVXXjXi3B+tcLmhVEerl4W2WGe80MryxC1bUTHyRRVq7i3XLvj+YwvpR4hJdv117XCSwf2IX/A==
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

Add bindings for Cadence HDP-TX HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../bindings/phy/cdns,hdptx-hdmi-phy.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
new file mode 100644
index 000000000000..99352e655eec
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns,hdptx-hdmi-phy.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cdns,hdptx-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence HDP-TX(HDMI/DisplayPort) PHY for HDMI protocol
+
+maintainers:
+  - Sandor Yu <sandor.yu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - cdns,hdptx-hdmi-phy
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
+    hdmi_phy: phy@32c00000 {
+        compatible = "cdns,hdptx-hdmi-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "refclk", "apbclk";
+    };
-- 
2.34.1

