Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494D8923D9D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEF910E5D9;
	Tue,  2 Jul 2024 12:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="d7tHIHW3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2065.outbound.protection.outlook.com [40.107.103.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC3E10E5DC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:24:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivs8/xc1DIwE7I7JNq51q6DNK1lstkLztgLlZAelcLovSRVAYxyoGErbNGj7ZKJgOoM9K+UcF0RovPi1g19MnWUWeXMs4v7Qyyie8OC0oGUY/DkznlpoxVWcFqptBFG5yRAaaMx5IUgeWphGlbKr3qh87QymugG3vUDvJK0FEIK6LTyq84jmt5OmVlnvwA2CXW3Ic9Q/aLYa+l8SRslBGbQAG9XU3leGGZ2PQzLGq4uKuAoFC7/tgxxddi3e1n9FdqBkgW7x+gHVuXlShRQ3FAadbMOYgtGRfiQ4n29aXMl6Vz23NA4Lhg9hK+1l/aoVNo9b1qDieUX2w3zpXik3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zz+u4KiCh+PJizTzFPikS+LpxSJJQYp7FITN/arVoQI=;
 b=PYtkA/j/J3LohrlJWWrCGSZ77783ruQ+qpaTVRDSeXJCuepbe9ArnsPDziixvACJjDRKMzpiie0tiDKYyMSGy5U/YBEhakt0a7dmtjLrqiIhkIsFteNt5R1bQQtP/SN2alKR2Btazqr0MUh50qyzGzdmjEM7ssz/Y1I/TiZ+3eIRqd/JUrFyh/KYUqTnNTZ3l4myh+tTwsKcfJkVLh7YEI02zE7V7+Aje7xpPei2c6mi6nMbt/QyaOIyPmKDQLVnf8PW1vKFDGKm08FZtXYICLsOhbQdCj3BAGd2wFJbkEX2+k9czOnFcpbrxgiPuRiB5bOR9BkZhmTsQdUfEPhzpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zz+u4KiCh+PJizTzFPikS+LpxSJJQYp7FITN/arVoQI=;
 b=d7tHIHW39tdvZ82//RENbp0RFLlOJXxJu8lVxrfo5KdqPACppnE543wuPXW8spP29U3jDV8vff54AMROBN+hjcgyhCd1Q+6ocUBM34CBEBhHYRvSEEYalbV8g/S5ogE9r8Hg3pM66eVixskiiOY9XscrjlxLa+y2v2Tt0oDj2yM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 12:24:48 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 12:24:48 +0000
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
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v16 8/8] arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI
 support
Date: Tue,  2 Jul 2024 20:22:40 +0800
Message-Id: <f2fbda1f83ecdb52bd9fc3516dd3d7bd4970f87a.1719903904.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719903904.git.Sandor.yu@nxp.com>
References: <cover.1719903904.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM7PR04MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 51eb9bfa-851f-4c0c-5769-08dc9a91f718
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w1EUcZFOT8iCAYF6CQRLgk7BiWgotThjCXAxmfyO+ZFuIpzeyScuDQLlsNrw?=
 =?us-ascii?Q?4wwC8gjAD+TCx4e105ku99JKPrDrvYSgJyjSO9YsAZDvHzD533DHuVQ6gxpR?=
 =?us-ascii?Q?IOJB0+HGL9tRrF/RQXCzWQf9WNqtgP58zx7WC7dCI8KP3tEtoSGyiUbL4zMH?=
 =?us-ascii?Q?XpRdurS7EHvDfWMxRAllP43fIbf1WhYAW819Yj9JgSVYuLMe6eocDrlnnEor?=
 =?us-ascii?Q?CO0X4VVuC02BOtOY5DTrjkrASe2IE0gdoJdoMkNcki26yVi86sF3ZYFGI/Y3?=
 =?us-ascii?Q?lDUTn20kRQvpLhuYKtmVYN/35QRUPI5Mu9y4QMISuUYE8L4CgvmHy1HiaiOn?=
 =?us-ascii?Q?HuB65ib0lbA1eB0i1H1iQkwSV9sN46MjSMNQe4MNDPB6bpzJYcfAp2vusV5t?=
 =?us-ascii?Q?0viccTNUZe6ePi0khz0MT2gWaojh+Bu1ax4DfAJahWgZUcDyUbaKbfmfSA6B?=
 =?us-ascii?Q?h1prE64Rd7uJSlJxZgs5P6E/UfhwCmruXjsmmZoA8yTUnH7jsilz6ap5Y6Tc?=
 =?us-ascii?Q?pwk9eg5R5Hm3oTYUVe0cF9/NdjqUIsVkeR5vdniK4gtjQLr89tjBq1iLJNN7?=
 =?us-ascii?Q?iCnfh6r5X09q7k2xSTxN5kArVNh0BU3QK0KPQ8Ys3QDbSSDBLWk8GumpCz30?=
 =?us-ascii?Q?tLoP/U3Wq4awFjK9O9ZZvi+2caWCsxbNVvEEmUnOJeVOQIJgVx1XglFg3xBb?=
 =?us-ascii?Q?1sDcM3TfxBVRr4NbO6DUcn462WfbDOkZO+tCG5LoU4gOnLCzS0qgism03WQi?=
 =?us-ascii?Q?NoxXdgUv+SMfVFxIC4Hp9uhWjYNFurwrEuYyguDbeuFHJKsalPvAjVmmoWN5?=
 =?us-ascii?Q?uJ5b9hS1vbE9fwSI5D8jhri6pPz+i3lF7M/MZcXof7C8Oomucx4brq3pbHd2?=
 =?us-ascii?Q?sTSYyoy2Qv5MyDw3hRzpA4eisaRjL1fVlxguYX19m5T5cDxampv+nJxK5D0X?=
 =?us-ascii?Q?7aQZ1AnTIgWFlFnWv5CcBq5wANtpS7TxjtVPIgW/duvWstOXZYXNdOVsxOuM?=
 =?us-ascii?Q?18DK946tNyC7kMb7vy+cwTjqyPVhHTru5RsgqfvxL+W62fgFj72psE6qnWi2?=
 =?us-ascii?Q?g3e6iIfd0jtEu2wsZ9LguQKnKHooObQCbdXn2rTM3ZKqLzT+fqkTp+cVi3fd?=
 =?us-ascii?Q?3Af1+VfHv/aSnQj+LFAw3AREBF1SHGt/RWWjzDjID/cw/99l/N+IZxzPSZGC?=
 =?us-ascii?Q?jm+7pvkB+m06XRafBh8oB2uC6obV/2vcuBtD4UlcayPoD/7/jWUnMqNroidX?=
 =?us-ascii?Q?uGw05+zzGwt4+1KTNJIunDGsojoBR01V0W10qgC7d+Sos2Rzg1qg1xFh8+W4?=
 =?us-ascii?Q?+7ZD3cpGR9yshhNLISZfJVu6FxUn77dVyQ3TlH56MTRQ9ARNfxe72WBEMY/a?=
 =?us-ascii?Q?sVWguSa04RtCfedLF4smax6dvAbOTOsB2XxVtpcAqyL7P5YJF7uVmu6y+D7y?=
 =?us-ascii?Q?svd8eG7sUug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TiLj/x4uePQDMRrhLvlnggazq7vLJ7o6OhjLmx7kVeRGVLKCgdlDjG8Ocv+Y?=
 =?us-ascii?Q?fPIJ6SRXXRjqNXqH4sVVXXLq+7QNR+0qVg4OZupd4dQSO3qTB5eh/fYxda0q?=
 =?us-ascii?Q?WrCeIpfn+ATv5awajaVZ4vDZR6iXoUqJRn0hkI/rc+w7TdIhpNKF510V4bBr?=
 =?us-ascii?Q?YbNxsOrpwQ9cg339r2p3O3TpjXsS5Rn8I01x6ZTup3AVH0OM6zlVLF7YVugY?=
 =?us-ascii?Q?N2aZwcDgMZE2YmDZeNZKJh6Khw3mv4fj1u/undCuZtQf6zzmu93EQxRFKwsf?=
 =?us-ascii?Q?I8zIM8tAgow823JXGf/J0a0Vw/5sjSkT9BnmOJRJnmRDhYjK1zFDt8AMoygc?=
 =?us-ascii?Q?cDhVj0usgXaUNNTGDIV85ap28gjRX1M0mZGtB8V77BkwqWoW2ZD22/Pf0TLV?=
 =?us-ascii?Q?ixot3PBAsjXu5WaerF3M0Ro315pX3d7CS5yFQ7BOtosgpoFAcHug4HCJjTEB?=
 =?us-ascii?Q?A0Ppo/v6XXvuma08SJNu7oGrJBqzKH3qEZT5j56ffD9RUt0IYrhaZUZ6eDMg?=
 =?us-ascii?Q?mzkIMseZnnoh1mun48zhnriFtagtBZzObU7UAmVWiAuKjaUZ5bXoNeaLCwoy?=
 =?us-ascii?Q?sFBNOpcbuFpw33ZR7xYhPn0kk4aKGTjAKIGEH6TiAl+TZf1Fcnl3QoR9w5bk?=
 =?us-ascii?Q?SLNyfLCyHPp47Dvw9xEDtqR1IIPFvJikVBqf97M8uZadMNi1JLJLNP2Gu1nw?=
 =?us-ascii?Q?vfXPPEs6vbTnzDUb9rlABXFpGSwqtN8gqBj/BZdsLi+waGZhoeLr2yG7/dHw?=
 =?us-ascii?Q?SkVYyr4iNeWaDhQWDy9tDsv472rMp5az+CgpbWmKwsMcbEpdI921LkZtBq0h?=
 =?us-ascii?Q?tAspPKItTpj5FxySNEDP+K0Gtrplk5wCn3C5fy+ftaIdynqSase57JcWtVkW?=
 =?us-ascii?Q?0q/hmfA6FTDBGI6idjER4Toaz29m4WFOdoSuoLya7U+MjYjGoWb0yteKgH51?=
 =?us-ascii?Q?g/li3XaiWO/vex14uuVjfwiPSUxE7Gpe6b9gxiLscSXJ3AsQX19nCp98rHur?=
 =?us-ascii?Q?d6K89ZTtt0gb4kntGyMscBV8Gxa1tawyVDsrWLpjOOFobBXOEedGRH4RaAzC?=
 =?us-ascii?Q?IshMRxDGRxI4fQqUaxzxdWVdmpba1zQJyNZ/bh7kkyZrfwL62B8Q/IDsXsVC?=
 =?us-ascii?Q?1KNzGdWkN1fDKpqlTV2tajpkYfX8ktOOoh/hgj+SfZ4MRxM3XD85poDaJLeL?=
 =?us-ascii?Q?vKUP1AyVYry1LjA3o+m+W2YQfjaXtJzTlx9AYp8PMjRZ5VGI6hyE9NhgLAPj?=
 =?us-ascii?Q?AB1rWnq7X9ohi9Ou5/jiNgVx6QNGO1LxV9FDFtMr1bRDksC/dVeQxlciM5wv?=
 =?us-ascii?Q?TdSYfkx97qLKDf3cnj18oaeA8CVdI0uRtuQUu0sW1TkM50tw4G9flM0GhYgn?=
 =?us-ascii?Q?o5NqVbJFLbj2x2MpID0bmJrieYk5TBKU5wJUdbpUzAndCfAxJ6t+Fxwcz/T2?=
 =?us-ascii?Q?RHcPSaFcUCinrCHEv50kcvsIbkEQ9sawSEAqmV4O0FlcmpguP+NaY7KD9aBo?=
 =?us-ascii?Q?8md2lkIXp2vTQ+oXgP55kPUbX6IvQtRHrFxv957h6Qx1TvJe69Gog+EOPsZg?=
 =?us-ascii?Q?KvqFAguFVf41kZ2dpq2TogGS8q/4feLvArRKQmgC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51eb9bfa-851f-4c0c-5769-08dc9a91f718
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 12:24:48.8499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJQeOk1c5+yzErtBUqcqQzxU/R2XTUNEtFhCSiGboEJT2PVcbg63NVKroP371XbkTydKCjKj+TIwyVm/jXf1jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870
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

From: Alexander Stein <alexander.stein@ew.tq-group.com>

Add HDMI connector and connect it to MHDP output. Enable peripherals
for HDMI output.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   | 20 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     | 11 ++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
index 0165f3a25985..406c8229097c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
@@ -53,6 +53,10 @@ &btn2 {
 	gpios = <&gpio3 17 GPIO_ACTIVE_LOW>;
 };
 
+&dcss {
+	status = "okay";
+};
+
 &gpio_leds {
 	led3 {
 		label = "led3";
@@ -60,6 +64,14 @@ led3 {
 	};
 };
 
+&hdmi_connector {
+	port {
+		hdmi_connector_in: endpoint {
+			remote-endpoint = <&mhdp_out>;
+		};
+	};
+};
+
 &i2c1 {
 	expander2: gpio@25 {
 		compatible = "nxp,pca9555";
@@ -91,6 +103,14 @@ &led2 {
 	gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
 };
 
+&mhdp {
+	status = "okay";
+};
+
+&mhdp_out {
+	remote-endpoint = <&hdmi_connector_in>;
+};
+
 /* PCIe slot on X36 */
 &pcie0 {
 	reset-gpio = <&expander0 14 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 815241526a0d..ebc479070b29 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -89,6 +89,17 @@ gpio_delays: gpio-delays {
 		gpio-line-names = "LVDS_BRIDGE_EN_1V8";
 	};
 
+	hdmi_connector: connector {
+		compatible = "hdmi-connector";
+		label = "X11";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+			};
+		};
+	};
+
 	panel: panel-lvds {
 		/*
 		 * Display is not fixed, so compatible has to be added from
-- 
2.34.1

