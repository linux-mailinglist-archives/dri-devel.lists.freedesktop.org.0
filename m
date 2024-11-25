Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65669D826E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB4710E5EF;
	Mon, 25 Nov 2024 09:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="isoAAVsg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897A410E5EF
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=skvxkUTn/9IySCvXX05OWLqHjbhN0MTQTXhxCPM6WyCEJ8Oh1aktFxPg0N+5AAXAzfef/71CUw4lwrnKABhPfMdMcJcS3Xe2bjuTB5wh/zZk1oIc9Nm0m3FvGDTSycmwrJgDW5kPclWChOa/AwTP40Vt3lqpQrKJW7v/Qi+sFrY0Wxbd/BCuWuHB1UTJzPtuJYrBo2Nom6fOmJDHB+EO5mNEQZ62x5conK0+t1PaDH+98SeVgWqIKoftSvt+DExW+s3JTHOlRIFOEaZI20TWHmXRmTmxvoab0YiDG1GJ2On3fa8FnWS04LUSPAL8hrg8Pn32ogecWgUrLjcMZJYkzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/VhZEPBoIaJ+QqSDmKmNhEmPSGdCWPx52wcRoAdGe0=;
 b=PC+9m3cB7kT/kMFAtmPHQDJuYZD7ASHLZQ3KPofkU93KWybdBE8Ndo+wmoFJKRFlCb8/DtsHMVtQpc9CQEhD3bd/x2kLPOTF5/L5CaWd2ViTPod3HbktqmKiMjwIxUHKspmHKICgFY7CwcO4jGQmya7tODfM0Whr1AskPCE44VnSc5pILHX/pur8Ynr1T4+BqVl8YD/x9DLQED0SRpeY1Bq2PwxhU5bPb+sIbOIuLyRYrkOk0hZDlt1xkFT7bnmLh57/KzHQA1cwtQPyoYdkFPKlnfSw8B7EZ/dwBjZ7Q4joFlKjkI2WUE443PcMNCHjZmOY8bls+gmDY2OvrlHM8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/VhZEPBoIaJ+QqSDmKmNhEmPSGdCWPx52wcRoAdGe0=;
 b=isoAAVsgPqGeAq80mb1CLQDlO7xzg76PnHqHOg4+wXn8i4IWoJowSVvHG0nTnKaNKCQqgZwQN6RuqSkoZ4aMIFWDDDaYm/gxiqYmJhClpOUfW7RHZVra1aZGfm7KwmZA3uxLtRzdhpCb08lPpzGuw80tXT8MbwOsNCyyUD/HBVVD/ZZ5RIs4cn8CuxIbmZ+DVcaSYoPLWxaJeopc1rfnvn49Uib1qSmrUNKMdCZbKnfNoV53N/q40Q9IwNHewoTlApM2XRgEagnYyBTvCIHPSRJjtd9Bs51SrOU9gxJL4A2+SHAmC0MQV7NNWrBkGlEFkzhlO+f8GhI+hAq0v0utCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 09:35:12 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:35:12 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v4 17/19] arm64: dts: imx8qxp: Add MIPI-LVDS
 combo subsystems
Date: Mon, 25 Nov 2024 17:33:14 +0800
Message-Id: <20241125093316.2357162-18-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125093316.2357162-1-victor.liu@nxp.com>
References: <20241125093316.2357162-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: dc017914-52e6-4486-1841-08dd0d3475af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AfvTrplM52GiNXEMAUBTiqFJ6JApOn7pKWvHQACRu/iw9v8n4VuW3GGi9shB?=
 =?us-ascii?Q?4VpfaeGjRXOLpULMs2Iaf2FmCYkYFuKqoN/3OrfEJxJcrMgsUYgqhVzbVtUW?=
 =?us-ascii?Q?FUM3Y/P0T9mcCcPS6j3SNQ+77A3QiUBtzQAMoIXJ/N31I5ZHI5pclUmpr0kq?=
 =?us-ascii?Q?47Haax7oLleu/Dsg1ftqfg639CkEzHrUGVhfQpQrkORCX6zCV5mpHZci0QfS?=
 =?us-ascii?Q?det2pSxsVRAZqNLlQgyIeW0Nef17DKngyU+HWZHCjurooMXpot7j/KXXjrag?=
 =?us-ascii?Q?Yqsdp9p0ceaHaH/EMeZG/HxkdG4zRT9yevRuLBh6236EjakD1D+qOfIAky/U?=
 =?us-ascii?Q?BffGuvhh9klZ7j1U+z9znt2CQIZPdRZXuJ25PfeGfglkvJ2dyvOF6oj/Cezi?=
 =?us-ascii?Q?AYeuisfkL3Iw60sGcWTffRiNZYVrvt5GyZf4MrBXZwbe6tenA6un8SXt4a+7?=
 =?us-ascii?Q?l7tbsJFIqoj4K4l4e6ox7ZSySq03bEtCZ7q9QVHWjK/RF9Xfj73LwaNwuLlU?=
 =?us-ascii?Q?b+IEW+LTRYAdnXWikPVWiQiNvjNGATi02KqW5vCaBX7hXJAjgwHqUs60gYGn?=
 =?us-ascii?Q?fYr7F5eaIDL6QZSIx11s/b+TqgZ/CmWTqv4phNfW/whshjawXgdX/5npaJ34?=
 =?us-ascii?Q?qJCcnElgdF6bR2BxN8r8fw35kCCpGWmr3joSuP457D60CQr/fX4v/YSV9bji?=
 =?us-ascii?Q?MTekKou9kj9/1hSlu8NH/qlezvS+hmcBcSR+lE/u3yJdkMRWKN9fci1GmGj4?=
 =?us-ascii?Q?5NDGavKG3OxkAKeHExB2v8LGfxqKNgBU0L4W01mCUqbocjDAn+OKdsLKWpxG?=
 =?us-ascii?Q?8yqAYyYwOyAk9QppbOfBd1Jq3leyWVcfIYg9y2ZKeCUXAGNRS6UcVxB2UT3J?=
 =?us-ascii?Q?Akwk+AYeCLMw0HV7SJlK6ABLz2Nr6zls+LHcrBBuhqPOc9zgRMCpfDCLRa5Z?=
 =?us-ascii?Q?MQPmg8vmTCVjbG8kFbiu3R/fi3INdTMZugSx8EL2r6xZsPhMAXJ7r1sjN4Wd?=
 =?us-ascii?Q?CCG/uYo1erkORHn0Pkl9fXbhc1yl5+1rGNYrG+VSQmnKbPd3hdQ13dVZ8i6p?=
 =?us-ascii?Q?sP6bM0NRmISc4mHDmHS0slG7ulKjKSvcjJPa7rnWZFcPhVP25jexFtUiG12Z?=
 =?us-ascii?Q?AatF08MrKLCFC8RWzwdtlX4XGW8CA6PiXlq69g3X1g0gEWL6Ow3tWAYGGRAB?=
 =?us-ascii?Q?jZN8YprWRaA6CfO4CD/Y5Yk/nfPQCto3wWn/bJOIOoMJwqt03t2L1OQ69XDs?=
 =?us-ascii?Q?n4EyLDIH44E4IWCtZqks//ar4Ltz/vf6+Khkx3NAJRKV2TJmQtlUfXtCDOuI?=
 =?us-ascii?Q?2kDWr0E9+7Fp2TGYNm8wOOiBU4J1dIzqZFGe5Euw4NSdli8qnw1XMKWnIAuC?=
 =?us-ascii?Q?TF+nZyw/XBToXtxRDzjAAGw5Day4idiyCdqj3WpfCwBVmGWAEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bzAYT0xETkhxwgI9RpA10bJG6rkTn4MlvJVVReVWXQHyj9lOntG+h8ZNDadQ?=
 =?us-ascii?Q?Ev+t4RhyfbYWI5uCDzXmX/d75LopumBOBF1Z5QKYX86LAQvxz3B3eeg6GMy8?=
 =?us-ascii?Q?Or6LhXae1K6p9pcAHSdH6J6/c3/LS5K9ZENXn2mLXOoImh1QMXhkdk7xYOOS?=
 =?us-ascii?Q?XJsNmUgDlnErCVYYkBkTazoahEdEoJFJIvspw52kc0hOIvmiQTyKL1QQxc/X?=
 =?us-ascii?Q?DLDFq2qYDk1g/K1hVtumotyeMDiqhRUzpo9knh6JFYVqsVvdTYPjPTNXf4+h?=
 =?us-ascii?Q?STMDvuCHx3et2hxoHRfmqHU+xy/4OIfHdOcLTwpQ8x6hMjKtp4uWNDfnxH9H?=
 =?us-ascii?Q?t+4gIVKRMjNRETKv/q3vgKtkAfy/xon7mGFnGItFb73PWDM275Ske814nMuY?=
 =?us-ascii?Q?/4avnsnrkbw1mvijCsxI3j7FRdamR1ayH5AVGYoFm0gqGb1AWvmVGwdND9lz?=
 =?us-ascii?Q?Mn3bXtKvhFtbCh0y4ASBkomTEOEhC4kvkOY/F4nYGTok1MTvv+5gVKbXYdco?=
 =?us-ascii?Q?PeQeT+/Q77ycgFvqqT8D+usjCxCBkk5LBPgZpJmQb0SuRU8I5PJWMk638nCF?=
 =?us-ascii?Q?4WEcTF68TH+Mhklr8FnOO7eSqHtu98WDdbPvE0mrAfhV7hM9ajdDc7hea2AR?=
 =?us-ascii?Q?+U2795ZLS2XbcQeBgj337kNph7mctFdH79oFOKf4b9tnRJyteTVFiVQL9Wdf?=
 =?us-ascii?Q?exbfhxQD07CyUSNLgu3Tn9tftENsIyUf1vtzbQPPv6zKWrY5P7PZGW7HCg0z?=
 =?us-ascii?Q?a3QzHldZ94Hr6V+heBrvCUO0qSHzbJrQoDeBIxgP8KHG7Yg/OekjHdA/JXZR?=
 =?us-ascii?Q?wEDYmqBfqaeN1HPoZ7+HRDN6TBpEojpTzzzhMD5OMG06rCj6RTgm0jOIxjqB?=
 =?us-ascii?Q?+09V5+tM8jq+8TOEvr0GmQwyKaYTaGZZ9z5U9bSXvjsEzYpRQD8tq9OtcypT?=
 =?us-ascii?Q?wsRE68n024a3mSypjymFWDOSwQRTkHEKkdXcF/2D4ULCe/frfzwGNtYEqRBg?=
 =?us-ascii?Q?XtKg7euZiEC3fhAOMnSBr4ndwMJ8riwqvsBHGqr/UnBQMx6tRhitVjzFn/O0?=
 =?us-ascii?Q?0ceM2MNbyluFVdv/9vaXg4aL2wOiGvKpf/+AWFizZjbVxDw5klTbm0/OX2L4?=
 =?us-ascii?Q?Rl2lJL7dqB8dK3vRd9gWIoXzhZmvRvrRXO0FTmZpi7VbHPahyRBmVzPs27+e?=
 =?us-ascii?Q?agSom4Mbd1P6s5tTMJJlKciaPFwqkHZ0bIpADFQ/RBt93bKYYH9sQz7wwpz3?=
 =?us-ascii?Q?kO72a7cx9fF4vbOTJr6StxO+Mp/uuWqTS+Sc1xaxC4htt/z+9JgYFzHLiQUn?=
 =?us-ascii?Q?a5K4SezfJmMhjD0cHhAheLaCT/8XcT9s0HgSh6paWufJHPqqj5s4ZFR/e/4+?=
 =?us-ascii?Q?fuoMjaHLWyAflGftVI9405/BFL/g6HOLT8aLI3L/p57GPi5T0JEo2psDI1vJ?=
 =?us-ascii?Q?8G5TmqpoK5V3CwPzS4MNjory6QcBBGPUoWtunSOjfqAe5DC3jZoEDtNEwyVn?=
 =?us-ascii?Q?Ar/26hKGR7/+ImwvSqenrbGAZTugoH6ufwOZ0GpE7fu0AyJMKP/SCoWsHMYa?=
 =?us-ascii?Q?Jq2b57fT4nwkbLlgnH0uUNNYI0bbFTjlV2XwROCy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc017914-52e6-4486-1841-08dd0d3475af
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:35:12.2574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Us3Xj8IcpD+JSsiFZ6o4aGauC0UdwU8leTt7fYr6dPVbfp0N8gogiyh33aOHjrp3trRHW9WxQ23UTKqk30aHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384
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
index 35cc82cbbcd1..25adc1090dec 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -55,6 +55,8 @@ aliases {
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		mipi-dphy0 = &mipi_lvds_0_phy;
+		mipi-dphy1 = &mipi_lvds_1_phy;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -355,6 +357,7 @@ map0 {
 #include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-vpu.dtsi"
 #include "imx8qxp-ss-dc.dtsi"
+#include "imx8qxp-ss-mipi-lvds.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.34.1

