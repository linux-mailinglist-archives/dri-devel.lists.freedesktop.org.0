Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D593AEE7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 11:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7A710E661;
	Wed, 24 Jul 2024 09:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="A1fqPNEz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9399110E653
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGDQupRDfuLPSpJZFVtS33ALI1kXb9ipKbcqsmNbonSqAlxoeQlhOh9TKjQJmCpqT0VWgzgSbs1/iAK3ZI9hoL8PYKYu3H6IObak/ImyciK+97qWgUgWdgMOzAPY/w+NJhZkazrNnQVwRIrXIlzr5qXwmc4rNa6wl6mJGLjiObbbHRTdNwnkMWB8CDyNyMUVXGojQI/t/zBzIrF8EyhTx6P62wd+E1tXtEFPf5GvwdvgETuFCob6g7E8gxaUe0QlkWoXlwBBj44T7DVIULTuU/eemOw6nnolsAlt2HRClYhRj64s3Vk743GaV7QuSS/X0PBx4002AS9JVVF4FEPjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1zJ++lLLfnng3kJIC53jnI9Qwm6t5pxCXAjpWe6Ffw=;
 b=MneMsPHIFNYUBzOum1xC3nl99yQJGqN56fV1Jjn3pxi/APB8tRqvfjSllgy5vtIdrZx6t3aCYRdCEWp4Zn5HM7UHo6KlxTX4aLHKl0EMaqx1AMkgqGzIbdkC5MbdpIW1pcU9o+8pnx4a77F7Hm9E9jaMvj93S79cpNQsmAt4m+SgjFntTCfhCHAUqgnD9Raj/uXg1P/caR7M8JrXEkP/wzLvqyf00YN8VwMivBd7vbzV0b5mMrxbKIPiCWFGcm5H1zHhsnKoAldEYaYlpVhfucdmim/+z24KdyBT+sJeFG1JEGifWrSipLjTw/kVe/lFSx9+Hk6yPOQwCCB9+2xU1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1zJ++lLLfnng3kJIC53jnI9Qwm6t5pxCXAjpWe6Ffw=;
 b=A1fqPNEz2slVgkhKQTjmcvpXEg7FW1LGcaiu4aUgSS2c0pumknw5LrdAMh9wc0Ki5+fpenqMmvReVHfpgBAf1fD6y2Dtd1oS8BL46TgK77mcLBU/51mabm/LH4MzC0l2aIjk2R564shX4fr9gh4KGTjAPmlTn2TlTKuA5v6Q0waKikrw/6jfcII8I3BCedB9oQfxI7oCny7TtaYYqBunGMp0YEJ2M22X7VWSux45Rs5qxV7zDENbhGKWydoJsIez1+ms3SzgL/ZpMmuqfMiTht5yhp+/TSYtP07x/E6A44eTdpJJNsckpKcvb+Xr5qK/73i6SQ56ymoI3VjHSn90rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8040.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 24 Jul
 2024 09:22:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 09:22:55 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: [DO NOT MERGE PATCH v3 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
Date: Wed, 24 Jul 2024 17:29:47 +0800
Message-Id: <20240724092950.752536-17-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20240724092950.752536-1-victor.liu@nxp.com>
References: <20240724092950.752536-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c46d992-f31a-4611-b108-08dcabc2332a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3vOuVXqYIHMweI+C0KRYQk5qEmWJHXEWX0b3F3ngyyhjZT2Y2A7DLNfiBH2c?=
 =?us-ascii?Q?4oEgW8GGS2UmngHkdF6YG4nggb+VfXSI/YX/f1sTwKKrEyrcB2ZNAt1ZKbtI?=
 =?us-ascii?Q?iadIXIx+84Npphdvg11/Q215fiwbH93G3LpOcO3peGNUGwFglbSfrJJhcKLf?=
 =?us-ascii?Q?AIS6XH/VTzD/RJ7MFr24LOI9tMcyQsKXuTIBx8bUOFoGi+rBkNI6s7CIGQm0?=
 =?us-ascii?Q?w5kXfKy5yZYD0gVj7AD/lyGeTeDki1o8C4T6j3dbu8IUm1eGJX3wZLKLyoxc?=
 =?us-ascii?Q?ZMNxlWsTmky34FFHLkt+RFlVuklrLV2K14dJ/ybXIQTsDZEL4QpFCcebYWy3?=
 =?us-ascii?Q?OqofEhXJbrX9gP6KvvgWB0ytVm4Cag7252c4bMe5S4TCw9WkMU/zFge7Y7TD?=
 =?us-ascii?Q?zKwT698Oe1yqzWxx2ixAdHqazdVMTy4Ph8kYk47U21bVOMGxDmcuy6yPiCO+?=
 =?us-ascii?Q?TIWZb6LEgAwn/H62+vLGQMPeCuB4Oh7ZWCveWqQjiMxJTWMo5driM/1ISY95?=
 =?us-ascii?Q?n9JCqk9/vJlB0pMK0i5xz8MdOdaxWFEPcL5ly2gnm3BFs5ViT44FHkN71+L/?=
 =?us-ascii?Q?Ams3P9n3Yo6lHCd001UZkaG9Aq6BvCqgk6YpyzKI1DPrE2Masz6VSNqiTCLq?=
 =?us-ascii?Q?reLLljPwT/3mMGTEpGTvO437rddBapDbvd6o0njGjoPTtc2EHL2s0jdezDrm?=
 =?us-ascii?Q?2o4ZoEjYfCs2MgbTdj5FcxlgQ3Ax0N6qJdtdZlrG1wtf57Y1k8YE2MCE9eH0?=
 =?us-ascii?Q?andn3m5bud3aWfeyyONMZtv2I7q6OnWLqhJpzy2ClSVF3NS4m7sLOARCOTz4?=
 =?us-ascii?Q?6LCnBtHsHxH8qxeGtT80DzIz9euqTZj/7j4hxZblLtDft/fcoJyXhXOhxfZI?=
 =?us-ascii?Q?8NQgcZ88z6C9UJ1dssndE9lvehXLKAX/xZoxAk7Ep3DhTO+k6oJzovG4a+GK?=
 =?us-ascii?Q?mna88naP1vStEnyBHz2GNW7oV8BxolCILoj0xJ71fYg8MClC/Z3VplIoW69/?=
 =?us-ascii?Q?KNfQ/a/9KQ9txZyNoid/qxaIBDy5rWtuc20IdP4gBfszEW1dBSzvtNrHWdWD?=
 =?us-ascii?Q?hnC3CRMXpWYZMpCMnxedskTSS7RC2T+MMD6nsVyDyNhjyideMkq9C7xWsN0/?=
 =?us-ascii?Q?ycep6sjvyB92Wjzick0kv5pzPxCYnDYCqNs+fo7ohDpx7cQ/xnBH03t4wiaS?=
 =?us-ascii?Q?NILt8mcgNVf/cQz5Gt1990i4IhJiYscxNRG5SGclF9uj60qNJiTJUwqrKmta?=
 =?us-ascii?Q?8UQ1cnBZBOAsfgIMLCRaMgrYZKchvYoQqElUyZuWrc3vMdhzIVN+vel6Lh4k?=
 =?us-ascii?Q?zbLPWjxspl40H+f9CPK6CzK7a5za7dIsmjZYR36B6VhqX62arWUsj0AZDRQS?=
 =?us-ascii?Q?zF7c7GONSQo7JhSDyCz3NLOUydVPWsbM9U4MXjIhZXQrHoUfSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TFzGwV7G9QWJolmTpmIqSDj9QGv/rCs6BmjzzQTmQNzhmzxl+Lx0/XZPrNPi?=
 =?us-ascii?Q?ImSydGAlFc2UmdyiPm9KYiAyt6S6HEgXad1WMjeFKmGsYUFIVEV16Mg7cOPH?=
 =?us-ascii?Q?wgAYL26+gJuuwP6YnBluKdvFFY6f7JVyomCfY/WnC6scJLKM1dPhTaDdeimU?=
 =?us-ascii?Q?0MATrjVwU04NrXoVhhBEMf8AN26+GKoVslTiWmJMiFvElZDz7XgBdts8JKSR?=
 =?us-ascii?Q?AmWAdyHfi/D2qnfHdA/d3Sq0AaOXFEs1bEZbXqZjwCOOJVtPZRY2mt7W5wNC?=
 =?us-ascii?Q?jB7UWiSXNe78mtDRZg7JTwXcxdi10ax+clPlXrnQctd56csF7kel5eDGmW+T?=
 =?us-ascii?Q?dtyvAGr9S68A7uYYMxhWyx2QwSKdFO34C8+UH0rijQBjy46sCbu1fBGTeC/F?=
 =?us-ascii?Q?9UEdbeSyB6Fyj42Rx/QHCuwFh2it1JIP3dji+gnMy89Ht212f44rbayahrMj?=
 =?us-ascii?Q?u/SQrZY7rQ94y7EnKDWGNUAO853/Sj0+OlRoMd9uSvuhmJmKQwqXrIx/gP9b?=
 =?us-ascii?Q?scQnVro6v7T3qdSaQaWA7/cVGOiRMNC0tcw9mGkPcIa7rRJN2nb+EE78OLBn?=
 =?us-ascii?Q?TwQ2NZ0xrVImmRyMep162uTYwKhuT9zUFodinmuGwaerLH/eQxYY14nzPvfh?=
 =?us-ascii?Q?ch1Un2T9DJDhAqb/upQFa8zc6TiZc2xQ27IE4shTNDdM/mKeuknRLhnvsPfT?=
 =?us-ascii?Q?svW2LGa6D36gNwA5mXIWuzx8tBDr1WnoX29MT7CIFZ7Tehy1SRUs65QxSMrd?=
 =?us-ascii?Q?z+KbWJfehhuUvuGPC9s0OaEnCoVkBPYdAsWUUtr0iGkkL4Q12rLd7fyUmhjt?=
 =?us-ascii?Q?DOLOd7+WeGQIf+UcSKPBKMZ+JNU+gi4v1so5zpBgRtJxgqTpvfPJuaWiLqeO?=
 =?us-ascii?Q?V9hMIeWgkxE/h8ra0nN8N1+JKGhFkgXNYcr8KUB3mr7JDOLZl5FKhgJ4u8Dh?=
 =?us-ascii?Q?U73HUh5w4hi1XlIJYRE3xYKjsnazBpPtLFyt1quCUebJ+GISYgYmGAcFErJy?=
 =?us-ascii?Q?jb5Kb19rNO4DB8Kr/VG/fVkWhSGha1FooCnaN3f38v32Syu2R0t8Z27qW0a0?=
 =?us-ascii?Q?21jgfcq0y859f8w1YHO1JzhcBURmsuElgSwDG2mmX3pVsawr+SsVyszptroE?=
 =?us-ascii?Q?bz3nlQOc/QjtRKHRQv/aaPABA32WcKhKBfAc2Z0C7lTSQXV8VJtckqRhXDV9?=
 =?us-ascii?Q?46du137FBZ3AI9KY3dS6mJH+Msuimjncm1MLOecE48J+wAOtzx8iOOsVP0Jx?=
 =?us-ascii?Q?/JmMJQHnjLPMxYC7sTaAjMOMr0LsQeQ5jbt/MZy+C1zkhTPCxxRuuaydpxd4?=
 =?us-ascii?Q?zhLq+Kzaeurj4u9F/8yN8OFVa/XOYwtBXv3jOiELRTfD00ipTF09PmaPI8YE?=
 =?us-ascii?Q?/jVABQEk423TLaN3VdK6tV4UTR1Vbom1ZCM4P08+1eGGq8gcAfzdmnsIGhd+?=
 =?us-ascii?Q?+ZqxQWS6AzBpECM+dnW+4l6uO+KKGRW8MBNUsRCMvbvNG9DGQngsj7lb0Q3P?=
 =?us-ascii?Q?kJcymfevDP9jBtR86pbt7+SOvs1hRHP9LZGp6roLjo+q9fmHxdNJ4wej+lUN?=
 =?us-ascii?Q?TiliTR7jSKIKLsvgdzwaxkBGYtRsDHCsv3w5UG2O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c46d992-f31a-4611-b108-08dcabc2332a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:22:55.3061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrAGr8qEGvUdT+uFV8VpBaDC2nMFmXW5kXic5tk46gTmV0DsuiHVTldRecYddAYz9re84Dfv00BE+Gj0ON8qhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8040
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

Add display controller subsystem in i.MX8qxp SoC.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
* No change.

v2:
* New patch. (Krzysztof)

 .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 ++++++++++++++++++
 .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 236 ++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  25 +-
 3 files changed, 668 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
new file mode 100644
index 000000000000..0db345204b89
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+dc0_axi_ext_clk: clock-dc0-axi-ext {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <800000000>;
+	clock-output-names = "dc0_axi_ext_clk";
+};
+
+dc0_axi_int_clk: clock-dc0-axi-int {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <400000000>;
+	clock-output-names = "dc0_axi_int_clk";
+};
+
+dc0_cfg_clk: clock-dc0-cfg {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <100000000>;
+	clock-output-names = "dc0_cfg_clk";
+};
+
+dc0_subsys: bus@56000000 {
+	compatible = "simple-bus";
+	#address-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0x56000000 0x0 0x56000000 0x1000000>;
+
+	dc0_irqsteer: interrupt-controller@56000000 {
+		compatible = "fsl,imx-irqsteer";
+		reg = <0x56000000 0x1000>;
+		interrupt-controller;
+		interrupt-parent = <&gic>;
+		#interrupt-cells = <1>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&dc0_lis_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "ipg";
+		fsl,channel = <0>;
+		fsl,num-irqs = <512>;
+	};
+
+	dc0_disp_lpcg: clock-controller@56010000 {
+		reg = <0x56010000 0x4>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC0>,
+			 <&clk IMX_SC_R_DC_0 IMX_SC_PM_CLK_MISC1>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_1>;
+		clock-output-names = "dc0_disp0_lpcg_clk", "dc0_disp1_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_lis_lpcg: clock-controller@56010004 {
+		reg = <0x56010004 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_lis_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_disp_ctrl_link_mst0_lpcg: clock-controller@56010008 {
+		reg = <0x56010008 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_disp_ctrl_link_mst0_lpcg_msi_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_pixel_combiner_lpcg: clock-controller@56010010 {
+		reg = <0x56010010 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "dc0_pixel_combiner_lpcg_apb_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_lpcg: clock-controller@56010014 {
+		reg = <0x56010014 0x4>;
+		#clock-cells = <1>;
+		clocks = <&dc0_cfg_clk>, <&dc0_axi_int_clk>;
+		clock-indices = <IMX_LPCG_CLK_4>, <IMX_LPCG_CLK_5>;
+		clock-output-names = "dc0_lpcg_cfg_clk",
+				     "dc0_lpcg_axi_clk";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+
+	dc0_pc: pixel-combiner@56020000 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x56020000 0x10000>;
+		clocks = <&dc0_pixel_combiner_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "apb";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+		status = "disabled";
+
+		channel@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			status = "disabled";
+
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_combiner_ch0_dc0_disp0: endpoint {
+					remote-endpoint = <&dc0_disp0_dc0_pixel_combiner_ch0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dc0_pixel_combiner_ch0_dc0_pixel_link0: endpoint {
+					remote-endpoint = <&dc0_pixel_link0_dc0_pixel_combiner_ch0>;
+				};
+			};
+		};
+
+		channel@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			status = "disabled";
+
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_combiner_ch1_dc0_disp1: endpoint {
+					remote-endpoint = <&dc0_disp1_dc0_pixel_combiner_ch1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				dc0_pixel_combiner_ch1_dc0_pixel_link1: endpoint {
+					remote-endpoint = <&dc0_pixel_link1_dc0_pixel_combiner_ch1>;
+				};
+			};
+		};
+	};
+
+	dc0: display-controller@56180000 {
+		reg = <0x56180000 0x40000>;
+		clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
+		power-domains = <&pd IMX_SC_R_DC_0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		status = "disabled";
+
+		dc0_intc: interrupt-controller@56180040 {
+			reg = <0x56180040 0x60>;
+			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+			interrupt-controller;
+			interrupt-parent = <&dc0_irqsteer>;
+			#interrupt-cells = <1>;
+			interrupts = <448>, <449>, <450>,  <64>,
+				      <65>,  <66>,  <67>,  <68>,
+				      <69>,  <70>, <193>, <194>,
+				     <195>, <196>, <197>,  <72>,
+				      <73>,  <74>,  <75>,  <76>,
+				      <77>,  <78>,  <79>,  <80>,
+				      <81>, <199>, <200>, <201>,
+				     <202>, <203>, <204>, <205>,
+				     <206>, <207>, <208>,   <5>,
+				       <0>,   <1>,   <2>,   <3>,
+				       <4>,  <82>,  <83>,  <84>,
+				      <85>, <209>, <210>, <211>,
+				     <212>;
+			interrupt-names = "store9_shdload",
+					  "store9_framecomplete",
+					  "store9_seqcomplete",
+					  "extdst0_shdload",
+					  "extdst0_framecomplete",
+					  "extdst0_seqcomplete",
+					  "extdst4_shdload",
+					  "extdst4_framecomplete",
+					  "extdst4_seqcomplete",
+					  "extdst1_shdload",
+					  "extdst1_framecomplete",
+					  "extdst1_seqcomplete",
+					  "extdst5_shdload",
+					  "extdst5_framecomplete",
+					  "extdst5_seqcomplete",
+					  "disengcfg_shdload0",
+					  "disengcfg_framecomplete0",
+					  "disengcfg_seqcomplete0",
+					  "framegen0_int0",
+					  "framegen0_int1",
+					  "framegen0_int2",
+					  "framegen0_int3",
+					  "sig0_shdload",
+					  "sig0_valid",
+					  "sig0_error",
+					  "disengcfg_shdload1",
+					  "disengcfg_framecomplete1",
+					  "disengcfg_seqcomplete1",
+					  "framegen1_int0",
+					  "framegen1_int1",
+					  "framegen1_int2",
+					  "framegen1_int3",
+					  "sig1_shdload",
+					  "sig1_valid",
+					  "sig1_error",
+					  "reserved",
+					  "cmdseq_error",
+					  "comctrl_sw0",
+					  "comctrl_sw1",
+					  "comctrl_sw2",
+					  "comctrl_sw3",
+					  "framegen0_primsync_on",
+					  "framegen0_primsync_off",
+					  "framegen0_secsync_on",
+					  "framegen0_secsync_off",
+					  "framegen1_primsync_on",
+					  "framegen1_primsync_off",
+					  "framegen1_secsync_on",
+					  "framegen1_secsync_off";
+		};
+
+		dc0_pixel_engine: pixel-engine@56180800 {
+			reg = <0x56180800 0xac00>;
+			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_constframe0: constframe@56180960 {
+				reg = <0x56180960 0xc>, <0x56184400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst0: extdst@56180980 {
+				reg = <0x56180980 0x1c>, <0x56184800 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <3>, <4>, <5>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe4: constframe@561809a0 {
+				reg = <0x561809a0 0xc>, <0x56184c00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst4: extdst@561809c0 {
+				reg = <0x561809c0 0x1c>, <0x56185000 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <6>, <7>, <8>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe1: constframe@561809e0 {
+				reg = <0x561809e0 0xc>, <0x56185400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst1: extdst@56180a00 {
+				reg = <0x56180a00 0x1c>, <0x56185800 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <9>, <10>, <11>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_constframe5: constframe@56180a20 {
+				reg = <0x56180a20 0xc>, <0x56185c00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_extdst5: extdst@56180a40 {
+				reg = <0x56180a40 0x1c>, <0x56186000 0x28>;
+				reg-names = "pec", "cfg";
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <12>, <13>, <14>;
+				interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			};
+
+			dc0_fetchwarp2: fetchwarp@56180a60 {
+				reg = <0x56180a60 0x10>, <0x56186400 0x190>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_fetchlayer0: fetchlayer@56180ac0 {
+				reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend0: layerblend@56180ba0 {
+				reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend1: layerblend@56180bc0 {
+				reg = <0x56180bc0 0x10>, <0x5618a800 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend2: layerblend@56180be0 {
+				reg = <0x56180be0 0x10>, <0x5618ac00 0x20>;
+				reg-names = "pec", "cfg";
+			};
+
+			dc0_layerblend3: layerblend@56180c00 {
+				reg = <0x56180c00 0x10>, <0x5618b000 0x20>;
+				reg-names = "pec", "cfg";
+			};
+		};
+
+		dc0_display_engine0: display-engine@5618b400 {
+			reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
+			reg-names = "top", "cfg";
+			interrupt-parent = <&dc0_intc>;
+			interrupts = <15>, <16>, <17>;
+			interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_framegen0: framegen@5618b800 {
+				reg = <0x5618b800 0x98>;
+				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <18>, <19>, <20>, <21>,
+					     <41>, <42>, <43>, <44>;
+				interrupt-names = "int0", "int1", "int2", "int3",
+						  "primsync_on", "primsync_off",
+						  "secsync_on", "secsync_off";
+			};
+
+			dc0_tcon0: tcon@5618c800 {
+				reg = <0x5618c800 0x588>;
+
+				port {
+					dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
+						remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
+					};
+				};
+			};
+		};
+
+		dc0_display_engine1: display-engine@5618b420 {
+			reg = <0x5618b420 0x14>, <0x5618d400 0x1c00>;
+			reg-names = "top", "cfg";
+			interrupt-parent = <&dc0_intc>;
+			interrupts = <25>, <26>, <27>;
+			interrupt-names = "shdload", "framecomplete", "seqcomplete";
+			power-domains = <&pd IMX_SC_R_DC_0_PLL_1>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dc0_framegen1: framegen@5618d400 {
+				reg = <0x5618d400 0x98>;
+				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
+				interrupt-parent = <&dc0_intc>;
+				interrupts = <28>, <29>, <30>, <31>,
+					     <45>, <46>, <47>, <48>;
+				interrupt-names = "int0", "int1", "int2", "int3",
+						  "primsync_on", "primsync_off",
+						  "secsync_on", "secsync_off";
+			};
+
+			dc0_tcon1: tcon@5618e400 {
+				reg = <0x5618e400 0x588>;
+
+				port {
+					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
+						remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_disp1>;
+					};
+				};
+			};
+		};
+	};
+
+	dc0_pl_msi_bus: bus@56200000 {
+		reg = <0x56200000 0x100000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		interrupt-parent = <&dc0_irqsteer>;
+		interrupts = <320>;
+		ranges;
+		clocks = <&dc0_disp_ctrl_link_mst0_lpcg IMX_LPCG_CLK_4>,
+			 <&dc0_disp_ctrl_link_mst0_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "msi", "ahb";
+		power-domains = <&pd IMX_SC_R_DC_0>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
new file mode 100644
index 000000000000..299720d8c99e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2024 NXP
+ */
+
+&dc0 {
+	compatible = "fsl,imx8qxp-dc";
+};
+
+&dc0_constframe0 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe1 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe4 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_constframe5 {
+	compatible = "fsl,imx8qxp-dc-constframe";
+};
+
+&dc0_disp_ctrl_link_mst0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_disp_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_display_engine0 {
+	compatible = "fsl,imx8qxp-dc-display-engine";
+};
+
+&dc0_display_engine1 {
+	compatible = "fsl,imx8qxp-dc-display-engine";
+};
+
+&dc0_extdst0 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst1 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst4 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_extdst5 {
+	compatible = "fsl,imx8qxp-dc-extdst";
+};
+
+&dc0_fetchlayer0 {
+	compatible = "fsl,imx8qxp-dc-fetchlayer";
+};
+
+&dc0_fetchwarp2 {
+	compatible = "fsl,imx8qxp-dc-fetchwarp";
+};
+
+&dc0_framegen0 {
+	compatible = "fsl,imx8qxp-dc-framegen";
+};
+
+&dc0_framegen1 {
+	compatible = "fsl,imx8qxp-dc-framegen";
+};
+
+&dc0_intc {
+	compatible = "fsl,imx8qxp-dc-intc";
+};
+
+&dc0_layerblend0 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend1 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend2 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_layerblend3 {
+	compatible = "fsl,imx8qxp-dc-layerblend";
+};
+
+&dc0_lis_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_pc {
+	compatible = "fsl,imx8qxp-pixel-combiner";
+};
+
+&dc0_pixel_combiner_lpcg {
+	compatible = "fsl,imx8qxp-lpcg";
+};
+
+&dc0_pixel_engine {
+	compatible = "fsl,imx8qxp-dc-pixel-engine";
+};
+
+&dc0_pl_msi_bus {
+	compatible = "fsl,imx8qxp-display-pixel-link-msi-bus", "simple-pm-bus";
+};
+
+&dc0_tcon0 {
+	compatible = "fsl,imx8qxp-dc-tcon";
+};
+
+&dc0_tcon1 {
+	compatible = "fsl,imx8qxp-dc-tcon";
+};
+
+&scu {
+	dc0_pixel_link0: dc0-pixel-link0 {
+		compatible = "fsl,imx8qxp-dc-pixel-link";
+		fsl,dc-id = /bits/ 8 <0>;
+		fsl,dc-stream-id = /bits/ 8 <0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* from dc0 pixel combiner channel0 */
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_link0_dc0_pixel_combiner_ch0: endpoint {
+					remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_pixel_link0>;
+				};
+			};
+
+			/* to PXL2DPIs in MIPI/LVDS combo subsystems */
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				status = "disabled";
+
+				dc0_pixel_link0_mipi_lvds_0_pxl2dpi: endpoint@0 {
+					reg = <0>;
+				};
+
+				dc0_pixel_link0_mipi_lvds_1_pxl2dpi: endpoint@1 {
+					reg = <1>;
+				};
+			};
+
+			/* unused */
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* to imaging subsystem */
+			port@4 {
+				reg = <4>;
+				status = "disabled";
+			};
+		};
+	};
+
+	dc0_pixel_link1: dc0-pixel-link1 {
+		compatible = "fsl,imx8qxp-dc-pixel-link";
+		fsl,dc-id = /bits/ 8 <0>;
+		fsl,dc-stream-id = /bits/ 8 <1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* from dc0 pixel combiner channel1 */
+			port@0 {
+				reg = <0>;
+
+				dc0_pixel_link1_dc0_pixel_combiner_ch1: endpoint {
+					remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_pixel_link1>;
+				};
+			};
+
+			/* to PXL2DPIs in MIPI/LVDS combo subsystems */
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+				status = "disabled";
+
+				dc0_pixel_link1_mipi_lvds_1_pxl2dpi: endpoint@0 {
+					reg = <0>;
+				};
+
+				dc0_pixel_link1_mipi_lvds_0_pxl2dpi: endpoint@1 {
+					reg = <1>;
+				};
+			};
+
+			/* to parallel display interface in ADMA subsystem */
+			port@2 {
+				reg = <2>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@3 {
+				reg = <3>;
+				status = "disabled";
+			};
+
+			/* unused */
+			port@4 {
+				reg = <4>;
+				status = "disabled";
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 0313f295de2e..c4e6f1a3ac0d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -20,6 +20,27 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		dc0 = &dc0;
+		dc0-constframe0 = &dc0_constframe0;
+		dc0-constframe1 = &dc0_constframe1;
+		dc0-constframe4 = &dc0_constframe4;
+		dc0-constframe5 = &dc0_constframe5;
+		dc0-display-engine0 = &dc0_display_engine0;
+		dc0-display-engine1 = &dc0_display_engine1;
+		dc0-extdst0 = &dc0_extdst0;
+		dc0-extdst1 = &dc0_extdst1;
+		dc0-extdst4 = &dc0_extdst4;
+		dc0-extdst5 = &dc0_extdst5;
+		dc0-fetchlayer0 = &dc0_fetchlayer0;
+		dc0-fetchwarp2 = &dc0_fetchwarp2;
+		dc0-framegen0 = &dc0_framegen0;
+		dc0-framegen1 = &dc0_framegen1;
+		dc0-layerblend0 = &dc0_layerblend0;
+		dc0-layerblend1 = &dc0_layerblend1;
+		dc0-layerblend2 = &dc0_layerblend2;
+		dc0-layerblend3 = &dc0_layerblend3;
+		dc0-tcon0 = &dc0_tcon0;
+		dc0-tcon1 = &dc0_tcon1;
 		ethernet0 = &fec1;
 		ethernet1 = &fec2;
 		gpio0 = &lsio_gpio0;
@@ -202,7 +223,7 @@ psci {
 		method = "smc";
 	};
 
-	system-controller {
+	scu: system-controller {
 		compatible = "fsl,imx-scu";
 		mbox-names = "tx0",
 			     "rx0",
@@ -319,6 +340,7 @@ map0 {
 	#include "imx8-ss-vpu.dtsi"
 	#include "imx8-ss-cm40.dtsi"
 	#include "imx8-ss-gpu0.dtsi"
+	#include "imx8-ss-dc0.dtsi"
 	#include "imx8-ss-adma.dtsi"
 	#include "imx8-ss-conn.dtsi"
 	#include "imx8-ss-ddr.dtsi"
@@ -327,6 +349,7 @@ map0 {
 
 #include "imx8qxp-ss-img.dtsi"
 #include "imx8qxp-ss-vpu.dtsi"
+#include "imx8qxp-ss-dc.dtsi"
 #include "imx8qxp-ss-adma.dtsi"
 #include "imx8qxp-ss-conn.dtsi"
 #include "imx8qxp-ss-lsio.dtsi"
-- 
2.34.1

