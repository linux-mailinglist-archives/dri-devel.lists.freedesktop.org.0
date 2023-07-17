Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51097755DD0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A8610E200;
	Mon, 17 Jul 2023 08:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8A310E201
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:05:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axEhqd/CXtNCwS1cvYuH7cPnKWK3oPhBA9V61tJD+mjHf8CotHrc7qzbpcdbncoIfu92RuJyhHp1122f2QAeJ//XSEs6DHcSfUSGKy1FFgK551CX0Hz0cgOqhgMSYqhLJ0vnEtv5Hp4q5TKApxSu1eJncbg5yUsGBOFQwhabPhp2Shu0/WB7IIoLwDn0J0FJD+0fJDDKGSAovrCpDvmRv3rKtosgBpbQoBZ6kEXXbTSxgvgcEN4xD4l553GXFWhnBAbTQt9YQdDiO1f+NE9znUANrbE6sYxL5d5YX/uttGftQfWlS9FvdhM6EEeDtPBef4gltYuz9iuCSSJ8Rleodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEAButjKjZV6yIrjaRZKLOABAlIPEWIS0tVAbM4HBsg=;
 b=GbqIjGvn9Bc5n8IEvbh79D5Cs4unMwzBFcyR7tfup3LMzzHHO8UJQuMd8SVxXPRfnGIWU6tTpCNY7Crr1qRK1AMx7ou6Al7j1JlLXC8DJpbv/E8PimAl6ziNFf4//ysREoasdMbWPS7zIqbNvJCGtydMMUPjSn6rh3dNRVq5Q+clhj7mrovoReBPp8ik3uVkygzlokzxxUNG992CJ6RCLRcqAedAQSZ7nZQtqDaqzh6MoEjKPCeLW67bEPMsVvNah5uG/zgjvca2atXznXKjgpJJOQctHSbPoLFJpAnAF+qjpt5NXQEqTxRlKtIQ3w4mev17gnsLGi26ouXecZ5l8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gEAButjKjZV6yIrjaRZKLOABAlIPEWIS0tVAbM4HBsg=;
 b=diJAFQsacBFscostgPzT3lR5RFdmvLhrmJEfHvJJ1Cf++6cceghV+H/TUFtqCAP8fqeUacs29IvGruNI6cfT1xCSwZZ5Sf540WTvSuAmR8ck6YIvcCH6adkWwBBftokMMRUFqUqaXoXO8yHuR62cMI9TovS+WLcZ0oojVV6PGMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DBBPR04MB8025.eurprd04.prod.outlook.com (2603:10a6:10:1e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 08:05:13 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 08:05:13 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v7 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Mon, 17 Jul 2023 16:03:51 +0800
Message-Id: <a782c749ecf8192a4f89ba270e30c7fb1d245c51.1689580812.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689580812.git.Sandor.yu@nxp.com>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DBBPR04MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 94babcfe-f37b-4bc9-def2-08db869c8c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZjn9ZcxHc2MJ6Uatyeht5iwk8ZtsX6nN6qSJ3nX4veBpgZoL4E6KF5MCYOrJAe80/dHqAtI5rYeKZiYZRjx/QPAQVvfXzxc+rhfYv5YKO3q35BXVZW28bsGAKR+JTzMr4oU16TrnUflFixsmth4snWNtDd8zYYKH6vR7BatVu3sDAEM5b7KJnVJrfXHMrvLuyh5ERl9mUXZGmzTwKfoMDDXeh9hEgn9qxYNAXXBupGSASchqJk1QckqmPUuUMp79zBG83btK9GC33jVhPQAPVVAeLkOX8PdHa8tHwqNFE4JwxRxjtk5jbGowVn228AF79GX3pzggm0V/abuCrU1VJjQMWyeWsx4sCc2CtqcN8Oh5hyGMQa1+KKiZtnAS69WyxURSHqnNmGFkdYXN1WFBVkPfpoKKjCvFD3LOeDxj1ax5cyTbV5yQc4zH/thm7xerVjjCc50ADXEKv6YLyg0X2uJEkqlZ9kePmWniuRo4vX5O/AbuWgCkeNQIzGm/vVEyGw4ZGDFSc+bUk1LttaTu7dLmn2jmBfymnTz36mtYjvpEIk2jW31BewwuqQG4YFM33vgFLcmP+p66GIYqZsxJ1mjPuVgtEv/6c154ImpS9JVrq7ukXWkY/H/tOYq1pY4jDM361MnowMl9Cn5dOK9Ix1yH1cqlFwydeL44Uu5yN/osgINa3QFRA34IBlpLYE2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(6486002)(52116002)(26005)(6506007)(966005)(6512007)(36756003)(2616005)(83380400001)(38350700002)(86362001)(38100700002)(186003)(921005)(8936002)(8676002)(2906002)(41300700001)(478600001)(7416002)(5660300002)(4326008)(316002)(66556008)(66476007)(66946007)(6666004)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SVzocXgqxAibyh3a4u1HmhvWwGKamyQoPcQtAqqyqUrz++CnGOniY6EirKCN?=
 =?us-ascii?Q?RUlCPAsDVdFfbfwAsFPB7OWdZeRti4+f1YgBtRRwlIPWeIGDlUELe0I8+SRb?=
 =?us-ascii?Q?Gbn2Qvu0gjFfCwc6VyO+ExodhpAl7nUN2f9VevR/jm7Twxqxw9vg3bd5uT9U?=
 =?us-ascii?Q?PYMRQrHKjqfl0CbZdOzltsdkjDihMpfxjpZRAmsyHfCsFMGQdi18hI06ONWO?=
 =?us-ascii?Q?WrOxDCipfgC8PjIf96/H3DoC0zk6zceB67PjW66m+fsYmMdhbzOW8r05fPL7?=
 =?us-ascii?Q?0ubFI8rhf4XCAJ5tufgXrEOExT9T1EVOOa2dEDu8tYjNNl0SE9274e03KL41?=
 =?us-ascii?Q?PEW98LuplxU0S19+xv2XS76pji0Pq5ennc0XdZuO7TLH9jl90Q21PxYmSmLP?=
 =?us-ascii?Q?sMYJhyG4pDEyCQdsfikWis943lZUfFCljIMfdSWIU32Shqz+xEXxVMazXcba?=
 =?us-ascii?Q?krZZWVmIcZ9Jr6uxt70UdHFcShhPrfnstggOlUXyGr0KwjEEonEx4HEKD4hm?=
 =?us-ascii?Q?Pk1ZYv0ihpFGYQVDV03M6YCcRLWwZl6eyWtZhlhNgg88mLtLMqEGzcgdZ7qj?=
 =?us-ascii?Q?NmNhCh/0iuHJHSCGXZLFjxv919KOQdFlwIonILgj7EsOWtFcMpYw5rJVV11t?=
 =?us-ascii?Q?KwM8NJBCz52ViMUlkKw62vgQA88rgDsxAM97eILE0b/XLR9V0hYlYun3SoYL?=
 =?us-ascii?Q?tHCatYqIv41pOwlzE3gK59fh2P+yFI7SqkFPIuJ2XKCz8yRrzv9jHEVZIreh?=
 =?us-ascii?Q?vGCcYh0Qzh0mdv++CAkdXUqTv3u3dwR9H5qOvGnXiotx65yeS4IcmO3phtxy?=
 =?us-ascii?Q?N5MH8T6LXRqHGdT9F9o57HQyAdPRiPXDkVjTWqQpmX9KvrPfPlayOumhxQOK?=
 =?us-ascii?Q?k+UGRve6z12q7GkUJCPb98fYzJBZrY9u1+ljARm7e0IBICk1F6ji64pzmeSF?=
 =?us-ascii?Q?m6z4LCXOfBD1YUrOGma80xtG9mFhqFbUo2uw4ch4EPfIAB/t5GTuqlJGExok?=
 =?us-ascii?Q?fy2NthyOy9SrP+2PRV3at+4EkV3qP034MePD051JWUXnHgQfVppLWJNBANL4?=
 =?us-ascii?Q?1iU0jcdUnQj312ZVv8T4gHugzkyg42PtT6BZW+Tw0qvvwE1u7i5OVT9oJh12?=
 =?us-ascii?Q?kx+Ch2j1XXHbyJp2UvyZqfrmcVZcmJBWzgEb2QizhMmaY0gtoYWwLFj9LxNv?=
 =?us-ascii?Q?hiBpWPJEhBzvWYKstqRKiThue2AU8hNEmIpvM2W57u2uyVsZeLQsEN4AJ8DS?=
 =?us-ascii?Q?1DRVW2jTEw/4t278Jyfej3SlNx8e+TzyWsgxRk9CTj/JpnkHvnG9jJL1Zz2v?=
 =?us-ascii?Q?1IUELVH3xL8qwdrEUyljfq5qRnQvosOcHIZOzYRPep62yaKDt6K8RkdjHBi8?=
 =?us-ascii?Q?Is6rmI7Kye2bKwedaKcTe24aA4CpwxYKNxedOE3ye4n1rnceNMvXZPZ8iKD8?=
 =?us-ascii?Q?5oFM1I7gvjZTuEmP0u1gT7nVm/+6d8TdhCt9n7//POVMm0iB8KSxWXCT+FbO?=
 =?us-ascii?Q?kBKecNFJRJ7JEJHQZJs0X+Xjy+QI7vogELPWbIAyOrXUqPN4UJJwVLdswrXj?=
 =?us-ascii?Q?kHxaRnBLTNTRMWNNnWZJH7A2Okzj5SnUlXpQhSNJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94babcfe-f37b-4bc9-def2-08db869c8c32
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 08:05:13.0407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hs6grkqllBG0D2fKEtRNe2BBQF7WPrVepDx/BMAQmYWpqTMafhdkABG3ERyW9KK6zEWQ7+pJlo5Fo+rZHxU51w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8025
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
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
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

