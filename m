Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB89730CB9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 03:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7902F10E170;
	Thu, 15 Jun 2023 01:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2075.outbound.protection.outlook.com [40.107.15.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CC910E47F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 01:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6vbeH69KaZCswgLp6l5SZfhsHmKm/wTiVZyneZQlZJkYFmaf4DoFfvRmcvsGn3I37Rc6toB+LNPOjfgEZrbxa2Az3PmD37CJ1MWXsz5Qs2TWMCUMYgL9W2wqhPOWCVFlv7nT98+NvU9adGVJheOYLfZ4reuo7OYPBJdor1r/IDuTJc7TdnS1eSef6ySUhcJt8AAh+GmXL0sMycXQ+ayoul8boc7WG209NvS7R8VwMVb18qHlzc4g4t+bZ2EIAmruC3yIL19goQge4sJ20hXucsSFYQxlnmkNdW5aG6flAqTw9HSUzFgax7osxZrkZw5W6aWEG+l+Jh5DzruWlCjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEAButjKjZV6yIrjaRZKLOABAlIPEWIS0tVAbM4HBsg=;
 b=STKlGI5f77aFsJ5Vxl1cecvKaUQ6BDQRbt8o9XIqm3NPVc9DykDbydiwnyKQiPvVxddUGL40rFXgSNOtQabPt0OAnTbdLqYRxa9Dd3uJRePjLf2o+Xt1csbMb7XiZY23x1fQc/UsFPLumaLIb/dCBzQfW4/fJRrxxQEYq7H1gV/TKRk8xyfkiAeagyQKExMrcYTr6SGN4KWKVT4gsoWjKq+dyeCSWNIVRvWixjnpdqrBdZCeHfO2XDJFuNAS6g25ZAKA9fJWsUKMR9JF/li5iscgpjzDYTLaJ1RHt6kl6svD+CTmtlVd+JVCvYGuqkbXTR/snTSjlRWO5aBR/7NqqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEAButjKjZV6yIrjaRZKLOABAlIPEWIS0tVAbM4HBsg=;
 b=GySavb9E+VtG7QLG/OEFJOhCEdj11DP3JkZfP1sGuCS2dIboqgWTOIJK/Oamlwu62khkWiAUGVYWT5V94Wr76X9s6jMkB//SbDyZod2A8aIJg0097gMStagr1Ox17u9pNb9zGPkxmT3iULjBcd2bSft7y02UcBAAbGiP6fx2I/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 01:41:49 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 01:41:49 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v6 6/8] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Thu, 15 Jun 2023 09:38:16 +0800
Message-Id: <2ccb849de420ced29b3f9be38e12664e1919b631.1686729444.git.Sandor.yu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: cc2684ac-f2b3-4878-ffd8-08db6d41affe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v6Xa621iHbcmJBfqZmuFc8NCuAENxXcYsLHFqcO94GOwH3J5hg5GcxmGEra1AkWqHOlvbcQ6FClYim7o2ovyE5hajjTvXSpOCkeE5S+WhFdRlTRf7/3rX2+AvTJ23RB+DD11zRn9tM+hQVuFGgjF74CEIkMk/jS1JNLqU8oR+GqjjmdiL7LPYCrWElESX7K9UrNwEKIBDBpMGRkJMD9R7YSf0npm6LDseKwo6ePbBrBLEmI1GN8Jvcb9/kJCec1x3BHLIa109Rzq0bM7l0YT42tPZMiecvHVvFTgBRSWpMgA4oWnsCDdzMATQlvafVFlykm9QiUJKarZQkvY1ZFyZPXqVfmWqtbDCZbf9UFqSZStSO9V6fmiYrzEBAcT+6lXL/Zp3yAt253CevZeizloM9RFmI2ryLhBo+WW0psnrG9UZNrVCFELUen9zOdtAQ9lVkoz9810ONCC4HpUyaM/3l/CYEKCI1v7BB9GSu8+NEcxZ3Jh/wAsUooM11mYj2NgeRjvSz9+4NS0/Y1w8Lbif8IioHICX0fRDMVNGjM6uIgqpinu4ndS0GoqwLTfBLNkM/g9/gOIvID6ugp8mbaPe2NBXnioi1+WwlB4js5zYCU027QabrYnatr+6qZdfnqe7kqJeKUR0UbzkjpozxswzArR6bKEXy+Whg1o08glLx/QlBkl9TOUrNU8jzqIiOHH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199021)(2616005)(186003)(2906002)(83380400001)(6666004)(66476007)(66946007)(66556008)(52116002)(316002)(36756003)(8936002)(41300700001)(8676002)(6486002)(966005)(86362001)(4326008)(478600001)(26005)(6512007)(6506007)(7416002)(38100700002)(38350700002)(5660300002)(921005)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q5cX8xlR82G736TMazrhxj0Rdh7JY1WZyxtiE+rJUvYAOP+xdLKQWonOhCeA?=
 =?us-ascii?Q?55s98iZgww8MBTUMBr1KsaLJOMOn1ASwKIQ/ED6Rm1SELW0AlgEQkhsE/yyW?=
 =?us-ascii?Q?bnlJESw+xReogFcWmDWER50yCWT4rQTG8jn91w8EQbC6nmrqms2iwhlKJg4p?=
 =?us-ascii?Q?oVXt62mXXqTDdpd1dtE3IVJR76JtKPBD1jL2PQ0DYZnZz4kCAfcNvwfDzQau?=
 =?us-ascii?Q?1YkcOTNX5SUdgcGaaQg/5TO+NvHawJ42YvapLtW0oXpSJrxRmatwNivcNMrz?=
 =?us-ascii?Q?GrYtD8JPrKnvwSdmyENNuY1S7lPaA/iPsir2iAVM8VzLfpWm5PrM4ZoxJp3/?=
 =?us-ascii?Q?x5KyNkNgxqQsIaPujkZ1amVXAhPZfORasjFQKXPL8a3VuCIjURGrxEl/3ZTh?=
 =?us-ascii?Q?xmToEnrEj6wgj3QS7tikCzIj4l+LfOc+OPL4skesdD7ke33PQTwWg0Bk9o21?=
 =?us-ascii?Q?QfK+hBLeeEfgO840CXBzQDoZSLgLj4Rdu6hoqfIbZ/bIlcSugCr1CbndF9c1?=
 =?us-ascii?Q?NchE0CmR/ahs14UWKkxi5B47ZwxTX32bKTsxsJYjV2M9BqLjZJ/wpVav2bDd?=
 =?us-ascii?Q?43n5FWW5dvvgcoDtHtxT5F+/whKG17bde8enWUN00/zAAQujyPoTkFXVbqjs?=
 =?us-ascii?Q?DNC7Wkr9I5xaTNNEDamux97e582KHL+AsB5dkiU2yeM0Q099sJIg7B7BOpzL?=
 =?us-ascii?Q?oN5Ie/8jN54j4K+fT+bffJ3EHiR8KOl43g3EAY4NVtV4W9LNSwpDFo8TdomB?=
 =?us-ascii?Q?gd7gkbVcKgkh2V6KvaMmVw5RbcCzUc5e2SFWBCAsvvusQp05tJNYPMrTcXWb?=
 =?us-ascii?Q?3m/mYEf8Vqr0DsOJ0cBTD4xfHi0NJ8K//4yHX0TmD2Q1SYTQ8q3Z/yVdIMDb?=
 =?us-ascii?Q?vNlXE5BWJfeuCFDB06LG/H0byVpojljD9EEoxFDie0jotNihNDuORaHMvjfS?=
 =?us-ascii?Q?KGJY5q4EtjUtDvMSe0le+VypM2k0L8rdHR7FfH7itwXlYIsHQhEBos933HeI?=
 =?us-ascii?Q?+ThfmxyzYIqcj3N3et3zTH8wWxGHAtRgVrKP27yugPZWygxLN2ijr4nZU5wL?=
 =?us-ascii?Q?nTsVM38lK72YuScAnbU+hfSgyoD1/ptcA6O2FUA2elVNjt37to1wrCsotJgb?=
 =?us-ascii?Q?H9JcTOst7Fpuuq4eBWsyO5PudvcoEX+0uQJ7WhudHYFnInXXRDJ6pD08D+KS?=
 =?us-ascii?Q?VQp7yzSs6z5l+03MhBb5koIoObSN5t3uT8CmRb6qinXiiEdQf5X/tXUbPURF?=
 =?us-ascii?Q?MBxzo2kqyTP9u4OqndHi+fCGLwLd2OcPtyEhyPcsZ+XoQeHSrfNnUHp+0eTL?=
 =?us-ascii?Q?08KsStrwkCs5FnO61uOmtTlVk11HdEtc/qHjg+aXnVpoKrGHBsTqwm5fZKS5?=
 =?us-ascii?Q?0uSgdO7HPYalykGmpMKLlQ/15nQ9HfXhe1h75K+Z6vB7TQfRzv/2Z8454cZr?=
 =?us-ascii?Q?/kxLxBT0hk4gZf0gkccTrKLPtacKdABo8M8d1rfCc7ihisbWN6XWj5Oy/Onz?=
 =?us-ascii?Q?URwu59/9gnKpqnwfZUS+/vR6yWuyE0PgPt0sYw0ysR0g+DBfKR0zncLBtnGJ?=
 =?us-ascii?Q?MqFAtOR5MjOEYODbWmEAWAdkPOf9oBd3G5JKdzMP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2684ac-f2b3-4878-ffd8-08db6d41affe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 01:41:49.8172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +99pvw3J875JzcJBBPeSI7J+ITpKFf6z9Sp+XnIfGeb4OjDSlO8YsFT2pAHzy9w1X+2VrDAtwKGAnb3/wBlXqA==
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

Add bindings for Freescale iMX8MQ DP and HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
new file mode 100644
index 000000000000..917f113503dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8mq-dp-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence HDP-TX DP/HDMI PHY for Freescale i.MX8MQ SoC
+
+maintainers:
+  - Sandor Yu <sandor.yu@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-dp-phy
+      - fsl,imx8mq-hdmi-phy
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
+      - const: ref
+      - const: apb
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
+    dp_phy: phy@32c00000 {
+        compatible = "fsl,imx8mq-dp-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "ref", "apb";
+    };
-- 
2.34.1

