Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CCC8291D2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 02:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFD410E552;
	Wed, 10 Jan 2024 01:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D0710E553
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 01:10:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvIhASq3ujmMNxJWnu2a9cf/CARHNWCJpaP8DBTVX+gQ7cjMtIaOSeZLrUuZlFxFsuGqJ+vIkdi8mM/3D2RNAAE6IpssA4TNCjMOefo4OQg/8A5eW8ArfA1s2dYUVwWj5l9cqeEbHw7YMdph2UHN7n/lrlGFg8mZpiqeAWSuo64oO9HLaSGrSxPnHbWYkRoPFQNZGhgzkHxR9EALxaToSTbOdZEOun6395WwXQ0IXjPaWrcp3Z246v4EEqVht1/Nxv/xfAewxg37Z3VfEwbieBTVDB0X9E/3ZwFpydewKAErjmbRAZNV3GB5qp59tgQU5Nn82HJkLpfZZ7BqMiWrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rd7usJaLdryBjT3G1X6etJaKL386mOJKtm3NvXHFrIU=;
 b=KlPCNDqUu0aicNx90g5fINdjX0nvZ9OwwCX1zUXLjet9XlixC/wTf3b+B8Ud1FEKqNvvReD0nteLq9D61AgnmvXgSNdYOYar0idSNWT4aSlGHNTINr8S+BaBTzCbL1D83Q5/Muu9FJqR28XgmHannV7KgQdXb1AIKjE9IGm3anTVZYfBhuzGfk5LluowU90pVGDTV0R5g0X6+Lv4fE5xcJ93NuKQeQat+fMU1JEYdVYn3Im8we4/9BczBH4L5MhX8oD4NzK8CAllzVMlenWJEPZw4gz38KKB3ta19r6PwqwI/JOTvV/+ZsC4IOaR/y/hrjfOfEuljxzIsdZvXpayEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rd7usJaLdryBjT3G1X6etJaKL386mOJKtm3NvXHFrIU=;
 b=j7hjr6XIB7XUEueouZ80zIn9AmIa3RPhkghCn9tI5JpT2XFJCD3HDW3e+UN4v5XIGGvnYkzn2nCoM4U3nyb5RHrDO5fH3WxoEga2dyBbVttLhTbsN/dHtJKEPSpLQcfcDfUOEIYEyO7IyjyN+4OT6/67zy+JqjnoKIqLo1RxB3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB9836.eurprd04.prod.outlook.com (2603:10a6:800:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 01:10:26 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5%5]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 01:10:26 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v12 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Wed, 10 Jan 2024 09:08:46 +0800
Message-Id: <0c2215e627cc8253a041be503d31ba8751b13b31.1704785836.git.Sandor.yu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 29aa7fdb-4b0a-4471-7e74-08dc1178eda3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9r1dzVl7T0Z2cDEdhHwThKv5lvUwYr1SvFwzETXNWhYj3iKayRdn1VnX7Dz+UMRZwHXJYPJZmkA5LcHkXD52bHb2dX5/XTCRbm6KgTwZsF+7BwIspbSVeQTa/Q6K3TqkZ+oSxVHz1fXC+NUiZK3MJ7zsEqj26YktsBe/fulz5melnsqOvVFi+9pucS0nQsmYamb3A1LzI5ZEE1fUUJBHa99kAi7aroE5Sze4H8kd+104mqvo2/0eEceYh4oDOQkx7D7xGPHRtNmVAe8zEKTem6UDyXBFHAo1Q9fVX5E3FesXDsvnH1wT1liwFD88m3RONfHvn8+XJ799RKTcase4dDYM7AnWJqXIc8aHRCS7WkcnEZjdeXGSRATqIIIrbGmvXxb+bCcqzcKX5BVZZ10GDDsX6kDe5YCsXyPNHzEa3Tr+AuhOmK/7VbjxbgfZw/o/NbMr5FpCEh1jpqwS1n3qwIyW+QZhWSy0wzAwwnKG8jqxocQxYY893bJbgEgwqBtHbsDcShOmNZfKQVY+VRMHcmOWEdfzG+I59BnmEkakYdEuxxP3dLYUFFiOdU90zBX1Esz82vI/5wMk9CG7QEIaVx5c1ae0ZYYULp8Onxdqv7mQu1IxHWDBUo6H7MRhRT8DWALwbIuaBZuF6/+QYlD1hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(38100700002)(38350700005)(36756003)(921011)(86362001)(26005)(2616005)(52116002)(6512007)(4326008)(316002)(66476007)(6486002)(8936002)(66556008)(66946007)(966005)(478600001)(6506007)(6666004)(8676002)(41300700001)(2906002)(5660300002)(7416002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DJbOzQx1sspw8w+Rdb9B8r4TRojIT+Tc8/whtZv8jMQKNByfsxVTqLtz97r0?=
 =?us-ascii?Q?b3Q2iaNYO559UtgCOmmCrA/Ua8H9B++V46WkWW65BBM2RTTgT0FH0ecbDSw0?=
 =?us-ascii?Q?cQ1g6nanvoJ32rH2BMJr9oLVFOsthPH5UJMmt9KD9I97bD1kt0T8j/we/gWj?=
 =?us-ascii?Q?Cps6Km6NBqPdADgdxOf0kcr3MrxTIW0ROyFlv0gTX4fvKhQAVLs9YKGNcAyc?=
 =?us-ascii?Q?5UgMsDp/Fj9VGgy4kyuzUz24i3PpcaQyhWVmCLOjI95w8xc/9TcoxdD2v/QL?=
 =?us-ascii?Q?q64kmRHO8vP2Bq/0PGx/59gRyuyfrTr9z4/HPpLfphYmdF7030yBRcgfCJN1?=
 =?us-ascii?Q?hoAmniobk3YOe1sh0JUusnGyp3GxExZStGOfVM7ZY72OaL49C8naD5rr3CUb?=
 =?us-ascii?Q?yGD1IylLGKwHw3WbRUsCADNlyjQyglmkP6h5ijRPYiA+NBXp94oCmCv6VGcG?=
 =?us-ascii?Q?vXyHMcYCnJM5lcn32BwlVyyzhTZ5xqIRaPZ8C01ljKSaDXGi+KsUUiaM4jUs?=
 =?us-ascii?Q?orNoh76kaPHzfy7f7swpjMX4ITlXXNxxDkCaA057U7M741gRGu6bW6FrvXF4?=
 =?us-ascii?Q?YmjLdrcJRsEW3Fr6nfk/L1guY2vg9gkYpEA663VMsdP1ZFPQh0ynMY/6oqGc?=
 =?us-ascii?Q?1LITj+wqhJ0C2eLcQ1zKP72AoYaRLWbfEAYMvqaQiKbxbD9zNA+lAiCZdmzg?=
 =?us-ascii?Q?HO95m1+qHAyyIECJ+/b+pWV5GAhnr8ZSuoWjXsPWzrEw7jB7/eui/fxq6j52?=
 =?us-ascii?Q?QHSubs8bt6ZfWs1ZwEBgmDWL9oIiZslMKmM0d4g4iJHAUhc57iL/lr4JJX4F?=
 =?us-ascii?Q?f9uZ3DF57T/Av9CLc/U2ZCW+nWTeIiNgrzEs1qJ6bjxBE2daja7JyjdokzVQ?=
 =?us-ascii?Q?wGbLSueTYnKYRV1WJeQCXaT3HN//sCJWaz9Lxu8YDdJS8IQa35LQAB27Om4W?=
 =?us-ascii?Q?98ajEQpeER+PLOcfBKJuhusSRpmxaTwA2c9pJ3jueUbIaeETSmbytYyy8QMA?=
 =?us-ascii?Q?NATLO0KRUq6LBPygjBai9PxXt5L4SvNySxdRdNmHJGUEmsfCRqh0HnYbSjbk?=
 =?us-ascii?Q?XfcG5qFC+4xQX9UXEYNz2HuE+oktAdqYD6U+JVFmcso1ID8Ne4O8HMW1i/Ki?=
 =?us-ascii?Q?+toH+9zXBXXFd9RwF7apWS2XhFl9G2znHW/3UR+Ol0NKudeuOppC9jUvu3o8?=
 =?us-ascii?Q?Cgu3v1sDHmMjWvPKpFNKRE+qS6A9fcgbQj+z91TWpU9PU/kSW2dWpfRq2f4D?=
 =?us-ascii?Q?Q7iFMt+5tGY/dGrrXY8PbQQTtjDNseCUtLuuo48bAfURNjwTPV3h2Xo3cvub?=
 =?us-ascii?Q?nHHap2jGViwg+0s3HncQRxcOplYe0zuPn4LGonRBI3Ac0+/kO1ONZxELdVj+?=
 =?us-ascii?Q?eDfoI0fhXxkkcdYTnYchLd4Uiaatlpdl/u00YEQ+Ogppee/dl6pXs/SuJ6ht?=
 =?us-ascii?Q?ccGWi16Nk9rfc8mtcgmRYTk42H8AX1otJoGKV4l+brGT1f7jP941xWXSeb42?=
 =?us-ascii?Q?kvvK+ay5RBFn8rP2pRJwtfr4oaIsK5ErdVLcBtvfqwpyCue8P3xwa3igtgHZ?=
 =?us-ascii?Q?vg9vLxrqN8IeF4EBXL21CgASzdEupEFeXTxfHOAM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29aa7fdb-4b0a-4471-7e74-08dc1178eda3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:10:26.2873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTZcDGSKiSWfpqXrRbAO+/Za7vdfv16AEliFGaO/0JMRlb4TpIKc0SkrECGTDb1Fzbja1AomkiftdSPL9fdGoQ==
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
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for Freescale iMX8MQ DP and HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v9->v12:
 *No change.

 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
new file mode 100644
index 0000000000000..917f113503dca
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

