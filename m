Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E14FDA8767B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 05:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3939E10E468;
	Mon, 14 Apr 2025 03:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="dogDnQJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958AE10E468
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 03:51:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C83eE5m5PGxEAHtmlUIFhwsH6EyVsceGMlGl6YLfxQG4ZME6Mtfyi745RwNQk8Mmy5A3eB749KWJ6Rg9/ii0rVC+vTpiUIwz+P98+2vH3t+ICfcP8hlemHWZQtH4Vh5WFytf78DMy1BoX3QVT5Vruo+YQ/x1hqXykq+G8a/92ZxfJIJT7Ll3jLjzlpemPhRAbx9WlKGQlxuT+EwBGZkoUO6+qcUlT1sejrKl9T/GA8TP1Pz3cONFo+6d+2Qm8qvrPV7EtlAhet8lT6Cvk2TGzfzGaSAV/zABdwuWdfqQcL+R2P8oO74m4J7REkx0C3WBVZDxmkjmAkM0HQ6w4FQeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3I5rpOE492FXe+rM2/4fr41qgO9hOp3+RBSCSRoXCA=;
 b=RyNWMcfDhBxPGxDGB2xSPowMTmKTrSwItSBmiLRwO1U0xQmnlxMoUcncqR9DA5oWAGB+LcnLwyBkSgOlscejRkQ38vefgNuD3eW3NOUTFJCITQHnvO0xXL/hx9mFzitR1JnQVWb9ZqE6v8Vscsa07FQnf1smSO/5pJAemy0D5mFHTJav/V6W3qIgNlb1uWdl1Haf050BE0izfxpzcl1O3K4h3OMHKA6szeDwj7uFTKWegGd/4VVQrdUlQzeANijsEw2R7NI4zH95cONF+rQLtq8lDUcO5WWE46qSZsjMSxoBJkN116gqdbl2Yd/S8El5af/0NQ91yBO1RqvPAgBY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3I5rpOE492FXe+rM2/4fr41qgO9hOp3+RBSCSRoXCA=;
 b=dogDnQJOcWuRMGNhrS1M2sPvToiwX88H5avhusV03GULq3lyjf8cjGKjs45F1mYnT53N9m6CG7bZsCHNJmCu7cKAXtcTiupAYF2/aIQSmMXYybvEC7966EmkCU7PCI9pSRBHOW/533CkJpe3Ui0y/7BZXr1aHkfvn524Aygmi16yRut5i1VLRE4omU9xsjsFCJjCpRLrtEev656VZGDFzPr8DSCZFmBWBuCmYoaB4KI8dkTxFs+zWld014XA/1yp/7j5idB59ys3B9pzCCUwaIYTeeEqFrG+otKLqGRAAEwLYpMyEVNOFrnaR6Hpgfp0Y4YQ2s/lo3ej0HfVYKxrZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9205.eurprd04.prod.outlook.com (2603:10a6:20b:44c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 03:51:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:51:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, Frank.Li@nxp.com, lumag@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, u.kleine-koenig@baylibre.com,
 francesco@dolcini.it, dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v9 17/19] arm64: dts: imx8qxp: Add MIPI-LVDS
 combo subsystems
Date: Mon, 14 Apr 2025 11:50:26 +0800
Message-Id: <20250414035028.1561475-18-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a863bfc-1cd5-4b68-c052-08dd7b07a89b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lmhnXKda1XZfD0XDrsLU0YaoTYM0c6LqJEQliqoAT5bYGkHdDl9GUydQnu57?=
 =?us-ascii?Q?KrhuC95JgsAJJJ3As2cbjXsGcY2+l9ldrlPkZxwGqbmfJmrW9LdVx5lX+WPj?=
 =?us-ascii?Q?1awkCZyyiU79joaKES47znBrnMr1FEyk7+vpT2Sj9py7QlRhwYWkjxKd0PjN?=
 =?us-ascii?Q?qfUapEHB3CGeTKT1x++JJuj/gscJIKsZldRpfu3HbH3YrOVDQiBpTaB/PUSU?=
 =?us-ascii?Q?R/zBtBVEK5d4E+w+vclSfFmAx/Cr6jZEef3Z2QQrW7YkfGtrBcUoaXUHC05o?=
 =?us-ascii?Q?e/mC+aOKsCZf9eoaPX6EJSC6gNsFWgIZ0qk1WMDfWrnqEegzPQF8jRV7GQrP?=
 =?us-ascii?Q?0Tbbw/Tse2BR4nbkD/uwQ2mzA+cmmx0AZhHzKEcGyJ7MUPVEpDkFj9UFURFd?=
 =?us-ascii?Q?g5as6fyFoAqeZtdbRScPWKN6FPMR6aMRwdkuS02LwBEWgEkDq6JYOVtzNVwa?=
 =?us-ascii?Q?WxwsyNgirXWVgahI133PC+VrCSStQ8hiqpoTW8Sdj8VCKnAS2RTvjhGeGzfH?=
 =?us-ascii?Q?X/VkxOf55m7EfczSuG3pCbCHrT4eGJfsPs6GA7ZN0aq2qcPreOT/DEaKGRg3?=
 =?us-ascii?Q?AU7o8TC9eN5HsMKP3lUspdUHteHm+DRo2yNpnYhLKLmESjHZr0ZSas0eAYsY?=
 =?us-ascii?Q?mWLoYMOcUuowsMUC/OBGgBkRikWLVFuhgI0r+8BVZtEym1pYi2dF8SCCjhE+?=
 =?us-ascii?Q?PNCC4GQ8rhqNwKCVjqBeYqRWo9HBURqC7a7sBpgM2T4+vf1cGBjWzEw+f6uB?=
 =?us-ascii?Q?FZjGSB63/+1+85wE7HUU1XEGKA2I81xdNgDYRoeQZNNLOgIUAwWQm7hjfBxM?=
 =?us-ascii?Q?uQDsfJnjFifmpggc9E9dz6oqcC63CVCjRcdcSMynMBxLS0hPQbFzE+HG4gRM?=
 =?us-ascii?Q?MHyCAzb/lRs39R7PIGVXdFTkJoSBoEdygoLmLcwuqvSF04sJw33JSHRPqAqO?=
 =?us-ascii?Q?rbNReiPM0EEogc/UldkKVXqU2QpvBuDdujFz/0hJxGsxfe5QYk0hHt+GcLc6?=
 =?us-ascii?Q?nquPjCg9G4+ekTGlhroDdOJ7g89jT9YDcqb8YFyStLoqFIreAjYqSzqlH3ua?=
 =?us-ascii?Q?svsxjJ2oJP6qR51GJmO5PkWlznseJH3LnyI0PLIIQLZa1ptm/J+RRzlsvRnL?=
 =?us-ascii?Q?abB5u0+ctX5Vg3dbaLzRbnXcFr2bpeE1xwGYJ8Ngo7f7D0BQBUjchpntUc1h?=
 =?us-ascii?Q?cKTB83oWHetFbnGneH8JMDCEVQEsH080gMBR156DqRMlWipZVCcvHiWZAW3J?=
 =?us-ascii?Q?3ggO5vGivs3o/iE2ccmWagyru3W0S7QC19abNRwjzxzUER3QY1vhsVb5nfhe?=
 =?us-ascii?Q?sbW7nD0xJADkrLgEdclF12nnwSCFqKnvl4ucLiNtUlej99nf2WqEGWhPf3Md?=
 =?us-ascii?Q?Yz7GIzbQ77jf5ovBbAjxCmdDNhqcF3UXQ7eEZZ1d6Fi8j+u3idGSmeVxumRo?=
 =?us-ascii?Q?BOqKwr3Tgvw+OMTQtbHrbGAyqLTs/MhTrVUCO5Q60lufPdzys5igVg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7rrVcGFpInRSI1czIfL5F20g5FaOIN+dWsE0k8kI9itBjmIEM1ltB9btlNM8?=
 =?us-ascii?Q?XCPZrPJUmdQi9DMHVNYHCPBpYTJNP9ZHY1uZsTS9iVAOJoioDCGcjsufZZNl?=
 =?us-ascii?Q?/9sdTVud5Zc/ORMO6Dzqg8DZnPuz1nCNjfi1wIkVdhHNV4wuanHY+UsIOXdH?=
 =?us-ascii?Q?OtP9n5mAEEAQE5b31GlYtqHaTg35JOLDZFuFuhr0BWUaWLSfaogWMeXTZeCr?=
 =?us-ascii?Q?Q3B05QE2B0T0UbLu2Zhi9Kf8ZJLWwUevQ20qNEW85BivgIm+7AQdOEabBmkc?=
 =?us-ascii?Q?RYDQB2eRkOFLLkdsOGs2Rr8zfaGVZi0albYdWH93kH+U6PanLORyrw2Gw4c8?=
 =?us-ascii?Q?KaNIlKmIa85Op5YeV90a9RIGlrJntapmJQAea2wpLEQ4x220f4CjNGdJym2b?=
 =?us-ascii?Q?g80QtEKoDzF9TJlh5yag5QdHg6GjmZyRSGNal4AI1+NsoxNT5jgdYoD0VZZW?=
 =?us-ascii?Q?MdCbT2XcRZFbF/uOQiO/xt2c5/rU5/DNAjwHlzGXbaRnN10hMlUG9zjjIdT6?=
 =?us-ascii?Q?FZJKz/3TAryXO21MR3wtQ8tMiqIx931BBDWOGscz9zu1o4NBK29CCM/ZCZNk?=
 =?us-ascii?Q?oG+DhXpdiay9BBIITvkTM9hJQrnoN00lPOchuuqwmrj5bGQ9YdjpFMfmGIRR?=
 =?us-ascii?Q?FlTKGk5XuguGfDuWyos2OmvTtiMcHyj4P9EZNNoN1XZMtiL1OmX9K6O9mCa3?=
 =?us-ascii?Q?admHImzs3qTspsMrKvx+uIVi/Q27ksH457rJlxXEmXP4MfIueSWZskBZEXV1?=
 =?us-ascii?Q?3ooCxmczfm4J8Tdb96aELx9AJVjCgGaQaRxwUP0QtkPikDSBKJ53l2MWY0L+?=
 =?us-ascii?Q?F9sXyHFI1KrSSHlanTd29QEwcaoFUT/bbHswJ0zQLw3teANY60T7jqlH3ylk?=
 =?us-ascii?Q?7joBQsBtz9DdqaCM+jsZ/+5oBHhAdXOMPfp1bfKLJm5iRlrZxB59wIV5zZxG?=
 =?us-ascii?Q?QX+VrKMdzSmjMSPw9hSQHE8MRxil9UsJ1sKXJwfzUoFmEqwrY/7GV3BMIdH8?=
 =?us-ascii?Q?uwlQKU5hW93FhojZU2rh2qmIvP3pGUTlpq6xwnH1nEaG37YfzrSz5lX/fZjr?=
 =?us-ascii?Q?XQcZxukR8vnhBeykjD/c5jBhNkHsVOi1qoWiS16IBbInYNw7G3t3fMx+nXuB?=
 =?us-ascii?Q?/q8050iisDsJAwDxgxLVLG/lBwFuGQW3MBybgfTovT7o90RB6zlJLuVBuaNX?=
 =?us-ascii?Q?twBRW1QuBuA/VFpuQPRSV5Ct5vejnWg9h+vWbJ9wG/04OYjMffHGPdQW75mZ?=
 =?us-ascii?Q?xUc7VndKnS0pZqADz4aSzTnLwOIZ9j0Q/cWPiX8iPXM4BEs7iAW7xCYe3tjt?=
 =?us-ascii?Q?qE5MdJpMNP+9jcPRlQ9047yFAK5OAiQjegJSkPj5CgoZoiSzev3ol5LsFjC6?=
 =?us-ascii?Q?8/YxmK2DvPZ9VT3dLqjR0m5tf4UwmZiDQARK1+SM2WIwpGH0Truq/K/C0Emf?=
 =?us-ascii?Q?HMTBAYR5CHDOHfCV6KotNgpbldIW70PAmhezLWaf1yw1DeFKaeTbBrcRRWAi?=
 =?us-ascii?Q?GCULvZBWEC+LQk5fo0ZytETF7gJlKD1VEm1me87cvEZnwLtJr+nB1qRiDxyP?=
 =?us-ascii?Q?ImYQbhtqcJ171Kv5pn+JbifHDZbsoPIPJsSsQqIL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a863bfc-1cd5-4b68-c052-08dd7b07a89b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:51:38.2675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eARl7zXgMKRIpoDJlKtaYJILujqgMNb2mc3rB/YNhBnI94i/OnL8RybsLuWV86BF+MmcjgczNGcUeyJ/2omVxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9205
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

The MIPI-LVDS combo subsystems are peripherals of pixel link MSI
bus in i.MX8qxp display controller subsystem.  Add the MIPI-LVDS
combo subsystems.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v9:
* No change.

v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch. (Francesco)

 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     |   4 +
 .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   3 +
 3 files changed, 444 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
index 299720d8c99e..94c46a20597c 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
@@ -152,10 +152,12 @@ port@1 {
 
 				dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
 					reg = <0>;
+					remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link0>;
 				};
 
 				dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
 					reg = <1>;
+					remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link0>;
 				};
 			};
 
@@ -207,10 +209,12 @@ port@1 {
 
 				dc0_pixel_link1_mipi_lvds_1_pxl2dpi: endpoint@0 {
 					reg = <0>;
+					remote-endpoint = <&mipi_lvds_1_pxl2dpi_dc0_pixel_link1>;
 				};
 
 				dc0_pixel_link1_mipi_lvds_0_pxl2dpi: endpoint@1 {
 					reg = <1>;
+					remote-endpoint = <&mipi_lvds_0_pxl2dpi_dc0_pixel_link1>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
new file mode 100644
index 000000000000..fa7e7c33518e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
@@ -0,0 +1,437 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+
+/ {
+	mipi_lvds_0_ipg_clk: clock-mipi-lvds0-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <120000000>;
+		clock-output-names = "mipi_lvds_0_ipg_clk";
+	};
+
+	mipi_lvds_1_ipg_clk: clock-mipi-lvds1-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <120000000>;
+		clock-output-names = "mipi_lvds_1_ipg_clk";
+	};
+};
+
+&dc0_pl_msi_bus {
+	mipi_lvds_0_irqsteer: interrupt-controller@56220000 {
+		compatible = "fsl,imx-irqsteer";
+		reg = <0x56220000 0x1000>;
+		interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <1>;
+		clocks = <&mipi_lvds_0_lis_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+	};
+
+	mipi_lvds_0_csr: syscon@56221000 {
+		compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
+		reg = <0x56221000 0x1000>;
+		clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+
+		mipi_lvds_0_pxl2dpi: pxl2dpi {
+			compatible = "fsl,imx8qxp-pxl2dpi";
+			fsl,sc-resource = <IMX_SC_R_MIPI_0>;
+			power-domains = <&pd IMX_SC_R_MIPI_0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+			};
+		};
+
+		mipi_lvds_0_ldb: ldb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "fsl,imx8qxp-ldb";
+			clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
+				 <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+			clock-names = "pixel", "bypass";
+			assigned-clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>;
+			assigned-clock-parents = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+			power-domains = <&pd IMX_SC_R_LVDS_0>;
+			status = "disabled";
+
+			channel@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				phys = <&mipi_lvds_0_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
+					};
+				};
+			};
+
+			channel@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				phys = <&mipi_lvds_0_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
+					};
+				};
+			};
+		};
+	};
+
+	mipi_lvds_0_lis_lpcg: clock-controller@56223000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56223000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_0_lis_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0>;
+	};
+
+	mipi_lvds_0_di_mipi_lvds_regs_lpcg: clock-controller@56223004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56223004 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_0_di_mipi_lvds_regs_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0>;
+	};
+
+	mipi_lvds_0_pwm_lpcg: clock-controller@5622300c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5622300c 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_0_PWM_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_0_ipg_clk>,
+			 <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>,
+				<IMX_LPCG_CLK_1>;
+		clock-output-names = "mipi_lvds_0_pwm_lpcg_clk",
+				     "mipi_lvds_0_pwm_lpcg_ipg_clk",
+				     "mipi_lvds_0_pwm_lpcg_32k_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0_PWM_0>;
+	};
+
+	mipi_lvds_0_i2c0_lpcg: clock-controller@56223010 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56223010 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_0_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_0_i2c0_lpcg_clk",
+				     "mipi_lvds_0_i2c0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_0_I2C_0>;
+	};
+
+	mipi_lvds_0_pwm: pwm@56224000 {
+		compatible = "fsl,imx8qxp-pwm", "fsl,imx27-pwm";
+		reg = <0x56224000 0x1000>;
+		interrupt-parent = <&mipi_lvds_0_irqsteer>;
+		interrupts = <12>;
+		clocks = <&mipi_lvds_0_pwm_lpcg IMX_LPCG_CLK_4>,
+			 <&mipi_lvds_0_pwm_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "ipg", "per";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_0_PWM_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		#pwm-cells = <3>;
+		power-domains = <&pd IMX_SC_R_MIPI_0_PWM_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_0_i2c0: i2c@56226000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x56226000 0x1000>;
+		interrupt-parent = <&mipi_lvds_0_irqsteer>;
+		interrupts = <8>;
+		clocks = <&mipi_lvds_0_i2c0_lpcg IMX_LPCG_CLK_0>,
+			 <&mipi_lvds_0_i2c0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		power-domains = <&pd IMX_SC_R_MIPI_0_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_0_phy: phy@56228300 {
+		compatible = "fsl,imx8qxp-mipi-dphy";
+		reg = <0x56228300 0x100>;
+		clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
+		clock-names = "phy_ref";
+		assigned-clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
+		assigned-clock-parents = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
+		#phy-cells = <0>;
+		fsl,syscon = <&mipi_lvds_0_csr>;
+		power-domains = <&pd IMX_SC_R_MIPI_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_1_irqsteer: interrupt-controller@56240000 {
+		compatible = "fsl,imx-irqsteer";
+		reg = <0x56240000 0x1000>;
+		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <1>;
+		clocks = <&mipi_lvds_1_lis_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+	};
+
+	mipi_lvds_1_csr: syscon@56241000 {
+		compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
+		reg = <0x56241000 0x1000>;
+		clocks = <&mipi_lvds_1_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+
+		mipi_lvds_1_pxl2dpi: pxl2dpi {
+			compatible = "fsl,imx8qxp-pxl2dpi";
+			fsl,sc-resource = <IMX_SC_R_MIPI_1>;
+			power-domains = <&pd IMX_SC_R_MIPI_1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					mipi_lvds_1_pxl2dpi_dc0_pixel_link1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&dc0_pixel_link1_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_1_pxl2dpi_dc0_pixel_link0: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dc0_pixel_link0_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mipi_lvds_1_ldb_ch0_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+
+					mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mipi_lvds_1_ldb_ch1_mipi_lvds_1_pxl2dpi>;
+						status = "disabled";
+					};
+				};
+			};
+		};
+
+		mipi_lvds_1_ldb: ldb {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "fsl,imx8qxp-ldb";
+			clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_MISC2>,
+				 <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
+			clock-names = "pixel", "bypass";
+			assigned-clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_MISC2>;
+			assigned-clock-parents = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
+			power-domains = <&pd IMX_SC_R_LVDS_1>;
+			status = "disabled";
+
+			channel@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				phys = <&mipi_lvds_1_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_1_ldb_ch0_mipi_lvds_1_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch0>;
+					};
+				};
+			};
+
+			channel@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				phys = <&mipi_lvds_1_phy>;
+				phy-names = "lvds_phy";
+				status = "disabled";
+
+				port@0 {
+					reg = <0>;
+
+					mipi_lvds_1_ldb_ch1_mipi_lvds_1_pxl2dpi: endpoint {
+						remote-endpoint = <&mipi_lvds_1_pxl2dpi_mipi_lvds_1_ldb_ch1>;
+					};
+				};
+			};
+		};
+	};
+
+	mipi_lvds_1_lis_lpcg: clock-controller@56243000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56243000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_1_lis_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1>;
+	};
+
+	mipi_lvds_1_di_mipi_lvds_regs_lpcg: clock-controller@56243004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56243004 0x4>;
+		#clock-cells = <1>;
+		clocks = <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_1_di_mipi_lvds_regs_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1>;
+	};
+
+	mipi_lvds_1_pwm_lpcg: clock-controller@5624300c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5624300c 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_1_PWM_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_1_ipg_clk>,
+			 <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>,
+				<IMX_LPCG_CLK_1>;
+		clock-output-names = "mipi_lvds_1_pwm_lpcg_clk",
+				     "mipi_lvds_1_pwm_lpcg_ipg_clk",
+				     "mipi_lvds_1_pwm_lpcg_32k_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1_PWM_0>;
+	};
+
+	mipi_lvds_1_i2c0_lpcg: clock-controller@56243010 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x56243010 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_MIPI_1_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&mipi_lvds_1_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>,
+				<IMX_LPCG_CLK_4>;
+		clock-output-names = "mipi_lvds_1_i2c0_lpcg_clk",
+				     "mipi_lvds_1_i2c0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_MIPI_1_I2C_0>;
+	};
+
+	mipi_lvds_1_pwm: pwm@56244000 {
+		compatible = "fsl,imx8qxp-pwm", "fsl,imx27-pwm";
+		reg = <0x56244000 0x1000>;
+		interrupt-parent = <&mipi_lvds_1_irqsteer>;
+		interrupts = <12>;
+		clocks = <&mipi_lvds_1_pwm_lpcg IMX_LPCG_CLK_4>,
+			 <&mipi_lvds_1_pwm_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "ipg", "per";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_1_PWM_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		#pwm-cells = <3>;
+		power-domains = <&pd IMX_SC_R_MIPI_1_PWM_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_1_i2c0: i2c@56246000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x56246000 0x1000>;
+		interrupt-parent = <&mipi_lvds_1_irqsteer>;
+		interrupts = <8>;
+		clocks = <&mipi_lvds_1_i2c0_lpcg IMX_LPCG_CLK_0>,
+			 <&mipi_lvds_1_i2c0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_MIPI_1_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		power-domains = <&pd IMX_SC_R_MIPI_1_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_lvds_1_phy: phy@56248300 {
+		compatible = "fsl,imx8qxp-mipi-dphy";
+		reg = <0x56248300 0x100>;
+		clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_PHY>;
+		clock-names = "phy_ref";
+		assigned-clocks = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_PHY>;
+		assigned-clock-parents = <&clk IMX_SC_R_LVDS_1 IMX_SC_PM_CLK_BYPASS>;
+		#phy-cells = <0>;
+		fsl,syscon = <&mipi_lvds_1_csr>;
+		power-domains = <&pd IMX_SC_R_MIPI_1>;
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 9fb4bac708a0..0acc93675a87 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -34,6 +34,8 @@ aliases {
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mipi-dphy0 = &mipi_lvds_0_phy;
+		mipi-dphy1 = &mipi_lvds_1_phy;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -334,6 +336,7 @@ map0 {
 #include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-vpu.dtsi"
 #include "imx8qxp-ss-dc.dtsi"
+#include "imx8qxp-ss-mipi-lvds.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.34.1

