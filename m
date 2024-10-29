Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13F09B4212
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1AA10E59C;
	Tue, 29 Oct 2024 06:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="kRpCLCHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DD910E5A0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:04:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ez+iWVmwQXLXZn2FecvRawBIr5KiR9Gt5+i8wj3jLz6AFIqYlsN/sCn7tY28rvOFajXj6H3BK2LeoMx7siRRN/IG07k3xIJJ/SqdXHjv2V/In3yshbvvKZAlA5POIwGdRRdtzG6SeSXwKulza4/naTjasNeI5zGMTl/Um/19DYFm4434H3OsOz7sKfPyTGqRG1gND7xvx+7OoSt8wHu1iWO/0SVNg5Nnj0QTt/LHokYB/EKggTD+7T2uE7QvK4cHRZmjwXfy18+jjWwMaQM+q9bYN5yWevvDzV2oMw0cE8hEFq10Z6O5dNHSK6y7jJkoZZyPSHdX8iBARLpGN5Hcbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCSy6Thi3KfrjSiwuIK2L4yx6OrdwaOZplvEEPyRWy0=;
 b=QzdRFx6ZYVO2nt3cBMSfpKClF1ce+M6CkTL1DX54N6MJ787IZ2c3lRwdt1/ROq8f+D1J/Lrs9NZrsMEOCe7xrgsCGMZfYti8k31mXHnT4l34S9yI90XADPfCk3kH5NEAoUCaonztFC0VJcIXO1iojMV8J2To00TLiZSVIKI4PPP7/VwpwbedAs6miDkK3/iQ5shjR1PSYAKe4IYFgJMqLC41jrXDBXgIvi3hZ1JIQdcEsZkGO9Sd3m31B8WTJ01GSQsmINtmTiQA4TGK14To2jzBZ/1nIjoLUJ+ofFXUSPA9FiG2lh22+sXO/Cie6VYIJ8GwxmtWe+vhcvJl82SShQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCSy6Thi3KfrjSiwuIK2L4yx6OrdwaOZplvEEPyRWy0=;
 b=kRpCLCHFLc3yCxqOizY9mofuAjNYVxUPSCMTNsgY84DH0r93JcTlzNxa6ScaEkrPlYbZuwJJn1EuqVJniWS3hJifEb842GfjaHuMHDKZexvEzQk5ltcPUkde2sJsJ2c15q9gNHpjuiXUtkIYxjfKDDew6OGCQpHLiZd7EcONgiGKezPwTlCMGGrabvqbtXf6FOWzoPPKucbvB3JYaOYs4v+vRFtRMHomc96sy1dTSls1MyrtQnl/79/Q1/GffxiPffftE2jcfRzBUAhxcfaVI66ZZz2MLCb2XSLvvrdlh8BcirRb2aZlQmpZmuDXHvxlRljL+UjEE2s6DYVUWyXHAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB10202.eurprd04.prod.outlook.com (2603:10a6:150:1c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 06:04:56 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 06:04:56 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v18 5/8] dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
Date: Tue, 29 Oct 2024 14:02:13 +0800
Message-Id: <ac00d2b923bf66122ad24059d6eab6039137ad63.1730172244.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730172244.git.Sandor.yu@nxp.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB10202:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d2fe62-9feb-4da0-ce90-08dcf7df9ccf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cUinJ5m351KWg4fweIJk5jaPn+vkL6UQ+7R3UGPYPsp+jxDdNJlu8dkotb1U?=
 =?us-ascii?Q?0nrRPlVjOBMLhzJG4nSgg7EVxbGjYUrNpqwElq5f8AGFUfDtLPYDQQXLlLYZ?=
 =?us-ascii?Q?6jyIdSMqvltG0Y5Q46fZGk8j/6RssrFVhrk/AUq/QsLfpXvwZ9/LnpuiNyZr?=
 =?us-ascii?Q?eeZ9RN/xQ486XvXxi/lKy74dHokPonI4FtzwtBO5kp7EHMSoRz54X2N0y3JI?=
 =?us-ascii?Q?gPyIqHnUwjWFr5pFOzI23efFomPcRvkkuYX4ngyi3tRO5Zzfsi4wQFXF7BVW?=
 =?us-ascii?Q?L3C61mnNxAJEH7ZZTCCDkrr92wZjrH/oBZe3n2PNMjBKweIJT9v2bmyCND+L?=
 =?us-ascii?Q?+In9HjwvwIboSElKKcXt3C/0g66eiKnFQbWA+07Lf3mNQIfyUuY9rX+ETtfs?=
 =?us-ascii?Q?UabRqYLPTJ79h+ejOMprvAA3R0T5PY3YkQHxB77HteZ3QeoWaHlJCE32KOxH?=
 =?us-ascii?Q?/vqKht5r1JywXxPaAnOOwIlvS9VqkW3bm4gvt1GlkZQhgmO+9MpGj0mHiDou?=
 =?us-ascii?Q?MPdlJ8W8e52przgmliSYUGSF5Q2HYVYVZaG5+pa+aqEQIqv3yGHYqInwwHcU?=
 =?us-ascii?Q?V8peEe71xucNW2Oh1Z0zKmQ71JCp9hs8PfeFGKSWCNkv/6mfHsc+9tDiq0q9?=
 =?us-ascii?Q?ccLCTjynGf2d2YbQJPcOmX+9ntGZckoWU+DF+e11aYZdRhW+6Hi1ziYbgwjz?=
 =?us-ascii?Q?5CdxLCviLxfy9itpTbYI9ANYDivGDPEelPBNAnVNZZN47xJhTjQ5ddaWZlfS?=
 =?us-ascii?Q?7QpuUwUQDZVEL0kOpA0V4qDoC4EZb9gM1fnOFA3VKqLHneUxY4UBRrz6euli?=
 =?us-ascii?Q?GRPnrrOlCiU89tXTSZ6coqr9CaCjDwfKM8bDe5zSX20ZY5WaJBq2Dp6MXo06?=
 =?us-ascii?Q?es4eWfWDIoV0DqzoxEgA/ODlWeCTuTpkApHK+dVYWdB2w71d3E5x2Tu44GH0?=
 =?us-ascii?Q?q0x6Lpcw48kgFObSg/eTfU584h2y54qF5KkvAMaUW4F7ffRKuc06vrCozuQ+?=
 =?us-ascii?Q?rJXjLQ0/yiXEMI8fsBKIwMgmPR1PwBiUdJ9dbNooqlvYGTrPlS80KZezyjvN?=
 =?us-ascii?Q?KZqnRAN3A5ZI/+sn9Fu59HrA5l4EwmZlB97F/O4mHmWjf1QlOCqjDb1Sve+1?=
 =?us-ascii?Q?emrCdhmm0FR8Y/DcFBZNyMIMggFK1GzkhsMi5qZykaYeq50pqkJhVSSsxrxK?=
 =?us-ascii?Q?SPd7RJno6+crFZ5Uc6ZX+EHAsHFv4dQzD+Y5byQYgbyYI6XGGmgy1Oq9I/EG?=
 =?us-ascii?Q?Gwpi8CTpKA6FSmnxmHmvt3Ls0ZNZ/EQd8+AC1MZr5E3cDUUmGj5qTvZEv2gR?=
 =?us-ascii?Q?FUoiXNphiynxA2rk/Seq+dohvD4Scb69ATo8/Nfpek8zPw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tS/j0rqj1PSmVlBaUtoxhQ6B5HT8GhDnuGKoucQiOkxgxSPHLdLGSntVNlfH?=
 =?us-ascii?Q?28rjhfidq72seLIiJvA7XtUf4qwvFc49IgqceEevP2NyQfmB/rtM4PdP5Sd6?=
 =?us-ascii?Q?OO9gS6WdMyACYlNW3Cyg8/+L4JMj+O9zD2xx+SLyO8HZw0hKb0eclXHRVpL6?=
 =?us-ascii?Q?k3qSdFiYsPc+AE0wrjDuF9G9XSgzhThlMVqUwd8eoYoDdW26akYWPv+yOVq6?=
 =?us-ascii?Q?5RiSoZFOsTHosWoZIXA4W+isihdKvzBmivFcPAiFc3EZUxhN5YM3sd+dnIlt?=
 =?us-ascii?Q?F0aTMOXQ0b0UvGfyT2KW0tOrPNpJeUjcBCCf5i6577APVkuQYEovkANHTF7C?=
 =?us-ascii?Q?xiFmNcSuICcxwmyP4r+kFKGEF7KQFTSSes1W3GnGmr4u8zh5ZiD9W7ugqda2?=
 =?us-ascii?Q?mxl2//t+fGx9DtuXmGNMjs7LeCTcjs9IJLmAIoZSaVab+31PXr2ipevMKYhH?=
 =?us-ascii?Q?KFKoiWzOPry/0g2DO0gfC8E4N5feJx+QXW+woRuHHR4pklgvErEaq+EyoBPL?=
 =?us-ascii?Q?J3X4twnMS9ARqhBkGeMhyTWmVAxl5WFa2sjXODldY9WzEDo6c6ZthkfQjg2k?=
 =?us-ascii?Q?uJQPTmA30db4tLE+uEVAM0sytDyTdJBWaepT37Mli9lrlp/FAO5qrQNtXC4n?=
 =?us-ascii?Q?9oN9wqR+WPk4NEEyDeYUofR02v5YlRdIWhvaX2XtITEUzJzF1YmuHzkHKtmd?=
 =?us-ascii?Q?CjCnZGFIGDEOX5T5teGdFdY04jbgEFasKd7MDxLiWuyKCeEp27LmAT3dWopw?=
 =?us-ascii?Q?VaG7ZKDAuuKfzdXW/Hfk9XVteFXBDtvNQbrOEoKkI8WDEjkJ7KfkA8q5KPpr?=
 =?us-ascii?Q?KrwPfFoGbESIOoj8UEKrifWDXQli94Wk5k4S2aaFWfS5f1tOEDUHXA+ASI97?=
 =?us-ascii?Q?6VgysOtpSPgM1pLdGNbNlKAPnHoWXaIK0Gd9y4S6ejX7XmHerxqB60p9q1hx?=
 =?us-ascii?Q?ospleHDXfCeYmen7h2M4ArkhOWOSKSH2aFazuYj+gDSsaljtLhJ2xGBl1wv9?=
 =?us-ascii?Q?7eh9xNcjNsq+EKEXtOQZYYGcDU9qiMgLY6A2vRt8eEJgPfCX8T8lYx7N30VG?=
 =?us-ascii?Q?FzWPOCbKiQav39dW73xneaLbw6M8lIfNmu0IaqDAnBmQut59Ad+xhp47zWjg?=
 =?us-ascii?Q?yESeEtADR+E00D19vmusazHVCrusAwIyREdoJYLj044nFb3FY1biXa4ixlPW?=
 =?us-ascii?Q?db1MyF0tdkTx2GXJ3TRi+QN9RnTLewykfTzSDYWA+oLB5YuWU/XsMEO3pvR8?=
 =?us-ascii?Q?NeIvwk4lLis3p1hArCTfLpvm1MhFNQK44kStLfetVpZPgzdQ2o4TiY5zogEg?=
 =?us-ascii?Q?0zmZmlmVCmB7e7uSQ4njoODkYyhswTk52usDbI86Vx/iQFw+a8ehvVbkGN5g?=
 =?us-ascii?Q?PooJlu2Oh4pyLNCSiyz+6berUFvYqlsFFU5v8a1MCLkztvYx3naHP9bSgrRb?=
 =?us-ascii?Q?ta6p+A9v7CjuumpHIda7EYy6AGZdHrgJkE8/KMCr5UIR+CqCakh5sHDsUwiS?=
 =?us-ascii?Q?lMbgW79QJsFCilcH5zZF1U25XyKS3oBwgFfVMVVVPn+ajjBXBjLFDBKx+Dno?=
 =?us-ascii?Q?LdQDLiczfZGgBqHlY3VTfLssFuyrXYezXGuTaFf2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d2fe62-9feb-4da0-ce90-08dcf7df9ccf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:04:56.2882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQJ1KQgTeCFLxr0O6Jp8+fr9vBOTXsR7ENDCRlO+ozDM2BVEmnerDh53qiRy7l4DCRz+5UaDdyWm+aQCb7fCIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10202
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
v9->v18:
 *No change.

 .../bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml  | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
new file mode 100644
index 0000000000000..c17a645e71bad
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-dp-hdmi-phy.yaml
@@ -0,0 +1,51 @@
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
+    const: fsl,imx8mq-hdptx-phy
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
+        compatible = "fsl,imx8mq-hdptx-phy";
+        reg = <0x32c00000 0x100000>;
+        #phy-cells = <0>;
+        clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        clock-names = "ref", "apb";
+    };
-- 
2.34.1

