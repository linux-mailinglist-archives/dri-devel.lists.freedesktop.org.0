Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FD185B14B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 04:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B8510E0CB;
	Tue, 20 Feb 2024 03:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Rh2qZCuF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2074.outbound.protection.outlook.com [40.107.15.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9B910E07E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 03:25:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTlwSvkeBKAJyuGlP9m9GlMOHR7aYAb36dQ7E6dfJHqE9Z+WDgBNy60thQbjFxkszIeHyKuFkVN0kERzRKDNZlKP8xkkXtDm1EAKNU0Cn2F31J1QCzZA6DEyh3U09RQpxDEEJbIEUEmqVtCtIPisLGNT1lsOEV9qdXJSsAc4yvektNNRHu7+cfE0lgzibk3mNEl4sOw7TtkzqHkWVpCpEcLgJG3pQ2lr8VB70rU9fHqaYXsSdDGOM2phd+AeT0TFY534ZYpnB8sef+pVA+wxDDFdQKht80cbIKH7hfZnMtPMk3faHJS2PGUasj8jZP+0Rdmbs8KpO1V5Cq5Ootga0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4je+WGS66Ydl/PYW+Q/0sM04RsaeoDR/ZlchiHIlLmM=;
 b=Ebs8gw2ilMWoGyG79/LD7IRRU+Ozjth7W1JVGMikW1fR9vCxRyXGyyxuALSxC6CJx3X1c/um4nJvwsJDTASuvTBLkoSodcBigtjJkmc5NSSEuvl9GRkhOtBjRUzUnEYDwEzB0yC6U/VRxb7CCRjbyPwL2ENQ71ovRxTau7xwPIEVymeLVyEywdwS8ZfDVaQbZcJQIJJAN0pZb1fiyECUKkXvmkCZtm0amHtmVbBAOSwQ9Ss8iHwP1njFjtSrRocOcseGPcCHulJpgCw4/VH+MEASmbfLmEUXvO9ZRDFZE7o9tqFP6IleNy6J3PPQ9HDnOW45MhCoUAoVt7u4xmb8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4je+WGS66Ydl/PYW+Q/0sM04RsaeoDR/ZlchiHIlLmM=;
 b=Rh2qZCuFRL/F+jHtRo/V5KJeo853Q0wCyo0cxH0YHuqG+eqai/Zcl/42V1eEXlJTJwFFNlzOMcXptUquOhEb8HTy+zGxyQCtGTwkgTJ42ujA+FGUouqvpUVvsWkgH/bEe4aARNKM0wQddINTWVpyS3CUmmm20oOMIojY0fz9x/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 by AM8PR04MB7268.eurprd04.prod.outlook.com (2603:10a6:20b:1de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 03:25:38 +0000
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4272:e277:dda3:2446]) by DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4272:e277:dda3:2446%2]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 03:25:38 +0000
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
 Rob Herring <robh@kernel.org>
Subject: [PATCH v14 5/7] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Tue, 20 Feb 2024 11:23:53 +0800
Message-Id: <8ddbb34b5f6bf2414bdb03f9e7cd9da70e4e7228.1708395604.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708395604.git.Sandor.yu@nxp.com>
References: <cover.1708395604.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To DB9PR04MB9452.eurprd04.prod.outlook.com
 (2603:10a6:10:367::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9452:EE_|AM8PR04MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: b05f9949-29ce-4d0c-b656-08dc31c39bc5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upcaUvb3w/55fpkc69CrzvwNh3ZWjS5T9Q9h5WxALB9d5UvpQYb8Qmx6a681+PlQiG+RLcKdeSHa/At6uIARvGA0Afo2oYhbmWzVM/OJPwR7nf9hSKABlSU42GU4gBByxD/cAdObny1VxSWvpu9eZLU1oS627aW/FItUk+1KuN/L7NOBNLp6xzQTRaU5pEtCUD6uQa26d3QOFNXhScETr4QM7h1DfnSczaIs4GFJ3fz+VuP4UEGB3bkSvtKraUih8wTpBNzFPz8Y1rUZSlKXa9q15fALMdTZIdv42zZ/UUoDdbd5AOHXA51v5wi+curnBYpx7/gEOgqxjjNYA4qk0K94gO5vdUc5tG+IwMqeYAuGrMlLUeMT+K5y5eWlkNvwweVQCl8XXHfw8K8orGUBtD7x+4Gfgsz7ZoDnmO4qBO1xQLWcb9n+a/UhmAYJHZpPEmhHGgWO/PCkSFoBLlWh93zujfVC75rR+t6rbPAT88/1MTNTholIOEwu6eOade4LpHRNb8BY1ik3FGXHxU9NLZvw37CDqufzgMdR2Q/LimH0JlUod+A8X4xNyvmEiV5CwKj3DZBtG9S1HP6rlINqdKiB1MQtNCX77ITFwMDj+J14q2G/WsfpN5pbqfMQhPVD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9452.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W4Npc8hTTCtfrNxXOJXW37n/1OIh7REeYk7nPMr6N/v7+pjawRZ3CygOW7JN?=
 =?us-ascii?Q?s+bs+gEHmNEAwl7m2HciKJ5lECdR65IS0vGlKKN+bw+0LM5lCmsJtzrUJ9Ih?=
 =?us-ascii?Q?De2wMnfoFFqfLLb0SDwXKiIA6g6ujNtzeKArrcMw9Y9X1sbhA0WjX9w8QkTu?=
 =?us-ascii?Q?De8AOfAFbfZBiXNt9bcs4SBU6muyo5Ai21SG4p2cQOpCgeo8KIjQ/YqVerIX?=
 =?us-ascii?Q?SW515YFPqTCYFx5Sht/tltmLAM+z8FYXZvOCXY9uB4Y0yb33mkpw8rRF7RaO?=
 =?us-ascii?Q?HL3ONRIh430s0szFYFDT2uMWDTRZ2Eyfi26dJX1Vp88wVTADGu716RT08Auj?=
 =?us-ascii?Q?3g7VoMqvNQAUKeRU2pFwIxs/Lq7rXIjWJhyk2HWIsGmeQ6R1jofNDlLOc4BZ?=
 =?us-ascii?Q?D5i7dtU1+auOt5Ph0VH71sut4DqqFJDlx6BXXPZcsJoaltz5DEOoj09Rr0wr?=
 =?us-ascii?Q?zilchsqVBwTa7Znvfgc25eINOI/iDi51RJUj9qh+TfZL+02zqeiSgWzRv610?=
 =?us-ascii?Q?VfzIiSucSQGK4n/ig4ubD3/e9dG78GBkEZYzi7grqr09RyvtQECTABkD+ZK2?=
 =?us-ascii?Q?NTWAjwSGLc7juvb80Cb4LK1SfkPj2LqmuqwxhJ0WFMRLk6YT1TzgyvDdZ+g1?=
 =?us-ascii?Q?B0a78qv0oC5MODK3UQepZxqmbfBZKoUZrRs1ttmh5V465jm8JjOD+8P1tCk+?=
 =?us-ascii?Q?4RhxoBRim0dmR6EBKDtGJoa1dFUQY3ZcjtQufFZy+zOIKs5bSu2OTncSB6SD?=
 =?us-ascii?Q?IpykKriz2DKmDLdseSfRivPLOw0HTwHXXu9O9+Navq7BWfk9N9CQLOtsVEGc?=
 =?us-ascii?Q?zUHb+7dS0AZY3R46AZDmfkyTwFdPkdxW5eQUAEK9j+tQyOSuAzpRGi3zo7lc?=
 =?us-ascii?Q?Rj8Jq/pE+bXqSsI1xB9pfzPQRgZTgU29N4oAB/fenHJmHbPhLDxS8+eajBH/?=
 =?us-ascii?Q?XxTPp0uh29zMk5PJl4yOluVn5A79mv7JrM/tGSoWI3hA+llXu5QJKrrs+1Sa?=
 =?us-ascii?Q?icKXq8Dgf0hxXJDHfIou9LfLKE4D0gva2dAtWrAJAUIyleMonUzXRDJrhw4x?=
 =?us-ascii?Q?5FVpgymWJw0hAjMxbqFjKyvYPqhFhf2nSkh/mD5TnWDSaeoyTl4Hu/p0pk1q?=
 =?us-ascii?Q?bJjDdmmKex2Zq5u3Kuqa8J0x/dxodErgiadri/Pl/bBS0s85WdubGKrZlc4B?=
 =?us-ascii?Q?4Qqb0Np2fwE1M364CtLUghfxPSL8ZVX/wFgHS6RqV5bIv/DhXBwRCV99wwpQ?=
 =?us-ascii?Q?9EfUhfXIYwcOMyb/wmWXRaY8pdi6JTVhgB3K8Eu/6w1F5uiAer/pPfUcv/7Q?=
 =?us-ascii?Q?PCKAMMhMH6DDT+bRo9hry4zdJuB92HVl7T9XVxiIt3+mZxfr1u6G7L7R59pN?=
 =?us-ascii?Q?BmHJ80b7Bo2ySK33LQztcwcX7/pY4DWPPlbFcokypfRKrjCCa475WOQ3XVc4?=
 =?us-ascii?Q?koEsfB2pAzctKOcItMBQ+cD+q8+0VZlrHn/cE2jdTTtHr37JY/QnwUCqowGU?=
 =?us-ascii?Q?o2nR2WFkq9XyzYQiL2nz7iT+3X5lEFUyakcR4tuE15Mdmj0zmoooGQOqt/kd?=
 =?us-ascii?Q?fPRkZv6Utgp+8S1ejBMbidqv067mqMH8NiPUHWGH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05f9949-29ce-4d0c-b656-08dc31c39bc5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 03:25:38.3235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7mVFuXHjT7ZPgPSPXmZ6hsnnUHD3CjaUqECJGzodGEaXGMq5VAs8cRtliaTwFOukfkBxhviJNIKY7hOKyZ2ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7268
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

Add bindings for Freescale iMX8MQ DP and HDMI PHY.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v9->v14:
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

