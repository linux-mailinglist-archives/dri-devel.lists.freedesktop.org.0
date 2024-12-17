Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1D69F4473
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 07:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D3010E70C;
	Tue, 17 Dec 2024 06:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="mOCOWszO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A76310E70C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffiSQmrDD7b745mejZEBRz2tJUnreLuWtZi18SJMb44j6LT9/FvsthhaHWMdhGUiFHGGtliNP8rw2LTO/BwBV9R8okvF+HES5pNd3JcBeUrdhnBmBb0mwYHjypUUKs5Dh3HoG8MMwoeDySU4BDtYYiuj96OQmoWteFu+P/l7TW0W784KGMA5DO8WlsiJBo9d1BAOd/5g52qyjDOU9Z5GRnrijV9TqLvOBkZRhpfz2TrRoiPGXwCz29yA3hLy3Z2INMnW4I7WdJCRoeEpEh0YLQ4lOU7QnN8NdtsMuwLK+AVv3yQhymGLt6Xo0KmgMu00tCja2MHyOwIZ4mhWd1tB2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG3uQ2auhJ6kNzPfGS/qi8zibr84bCF54NG1AAQ+IFk=;
 b=iSNLla8YFRD9YCXUXU09ox0OqroGS1Xo8ocJyzkfpThvA/mPbcgTl0Qh2mGmwumskhg7hYZywZcJ3KQiXO/JhU6W5/ukkwQma4ATvR3qnSnZk2Z1O2JianXi3Y3F+FoIZyXheDNoBUDPIpzaOyE3jRPU+BMK6O9H3kdWOOa2EYs3liFOvi1su3+PQLGzpX0fdzZf95MyuNpeCdxpXeGF3HlDGBMwyPTPxxK4+843WThOWCMi+cclTAtPd42KAnzHKOenU1K9lf4ULNq4kS3ewkWUHNZl6wMmplwgKb+jEqt5Z5c7ZGjUVS3S5OJz0X6OoJNRfXemEHzBoPyVfy2PfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG3uQ2auhJ6kNzPfGS/qi8zibr84bCF54NG1AAQ+IFk=;
 b=mOCOWszOqfc+Ng91Ze6jTihxv2qIHxgEnd6DnNxnn77KLOelC5txhxS3zoSkYEAEgBmFvmNsLwDaZtwipeRoqMIdrf68rysXanJNCu4d/iM2OVhYm5/5aqf5lQET/8OK79VdeMzpsFD6aSGqWuNf4om89PDOGyy6Z79+7cT3FLuoVKzitAIho8Iu5nYiVwldq/W0GGjeYEuNPVdWO9o2U1xluLBYvNbUarAFdMfQ8uo4zp+6WkpSJ53r8YQrA+3pL1kLTgTZrmCChW+RjmmWVC9iTaEnT8qOpKDyCGoPzSixGUdjffE7rq5Rgzi2MCajhKJeGab88o+o8x0Ut2DyRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB9009.eurprd04.prod.outlook.com (2603:10a6:20b:42d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 06:54:21 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 06:54:21 +0000
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
Subject: [PATCH v20 9/9] arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI
 support
Date: Tue, 17 Dec 2024 14:51:51 +0800
Message-Id: <e72920a199e245d0e1f71f3a62af6c603e4b1f39.1734340233.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734340233.git.Sandor.yu@nxp.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: b05446bf-e9ac-4b39-546c-08dd1e67a2a6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rrt274jKbxJA4CuKFORSmn0gUequF6U7v7f7YHr0SRXpIhPhVs/Xxh+emDJ1?=
 =?us-ascii?Q?mshpioTqqeehg55ZgfsvPV0LmaJP0N/9dsYJcZEtlKZ7pjDShBnY3eyl4jgW?=
 =?us-ascii?Q?Ty4pnOamorQ0Mof+XJZh8oiNejc+s4N4BKD3p0xlcGwUvh2jV4ytGVIHzW3h?=
 =?us-ascii?Q?ICpY4wbtATjtllUg05kBi7K+/Q/QZlzJ2tetrQSje7LaxS0KaE02KZO2tWjG?=
 =?us-ascii?Q?53bDpkkwyHBU64qe8HKB/6RqR79w04uAWKR2b4FuDOjPA2P8psvMzqMUxLDx?=
 =?us-ascii?Q?5CHN3FRFrMvKGUHLRyz0++EyInbdqB5pVklHbb4AwQN7YSAMfR0quyLuHDVJ?=
 =?us-ascii?Q?N7MmLkEKoALGxHmTCYrDauhRtagFLePDL8NQcIROEb8RhKPnKqpo0XJQI1pN?=
 =?us-ascii?Q?L9wFTXyJBnsMV+2BCkkFc/qd3EtygwxP3hlXMLqSNBf2lB9/9O9uV4KItJjw?=
 =?us-ascii?Q?C+vhcmtwT8Xzws5G4tbTK0IFrO41oFqNtPSW4u8+i6EZQqKK+WVX/WgS41Im?=
 =?us-ascii?Q?t/qO9v1L4R/AVnYZweCJbWVcKJ+f6xJoQ00GglCyfuxsr2jQzQTxmYYLaNx/?=
 =?us-ascii?Q?sst/A4pzl/WZGNFf0jnJpUuqdmB8yQUIlBXJ01/+SRsCYZLyXN2EoHlnSMHn?=
 =?us-ascii?Q?KRjL3IVij5XdEWu9oLmeXAOzXQWntiZC5Co8c20Yv1T9iqxNVVyc/DSUSCVs?=
 =?us-ascii?Q?18VA1s/PpqDnqG6wsbkOPw7zeJLpJfV1q9kcW5j1+lud6ZQo4z8+YY3Uy7U1?=
 =?us-ascii?Q?fwklbgXfpynQUW5iUUe53ZXdx5Xb2M6bVIxVHQNrfHWgxP1/WYlHHyUlJuKj?=
 =?us-ascii?Q?DZNNylu5uNlKYykItTm0G3UdN7vfhZZ68kfYrMyXXtYRlUoUYU4USvRpue4X?=
 =?us-ascii?Q?ytEIA0UOxnsCZDJH1X/U0xsvMMnKi3IaLMgEMDAQFoRNfLtpBpa9jDPtb1/P?=
 =?us-ascii?Q?wSEPDrRSfez965DSf0gyT2TTFRqR5oc8U1R23jKbPgiXkRUGUaqeGB2dy4mZ?=
 =?us-ascii?Q?1oR7Y1hrXQX1Hp9gapjqYt2d5hiQUUJRtob0QbHgnmn93mCdJ4WYyr+/rMIv?=
 =?us-ascii?Q?UScR+ebd131/gOQhKTTdk8nZ2rAFrDKVgrW0ZgqLLD5E3J5hY4SLeX8OtGHs?=
 =?us-ascii?Q?GCJTFYy/AULDHEurqPNYUQMNRHcgQkW/6WH5HJplFz/kXO1zwLoF01WejBeV?=
 =?us-ascii?Q?nVdWT9bhsxZzdODzCjYcOERcnRJMSd9lYhZzX/uyqqeug0PCcMjNXRb8EnwS?=
 =?us-ascii?Q?qyfiUctig0hXv7s+vn2c13dyowbQ6xUL+f5NR9E55IdCoenqNZalypf8kTVU?=
 =?us-ascii?Q?YhSQ+ZrByZf3HFWh7SkQj5MAS356e27SwFx9A4+1jImV/tPLOhixc2ebF0AM?=
 =?us-ascii?Q?B5NXv3SBFSG4XNoyop4vOAfjR/kzD/HUjdeuYRSIz02dLn0jaQkOWvFzrDQK?=
 =?us-ascii?Q?S6mIiJ5cvY8x/J+chAhLPO5BX3CVU6OqdD+sDpSbndSzumjpUEe0YQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M7T0pIvT6rPxN7W8CaCtBKOog51yBbAsZvr0cT/W2nVxiVynqhpVW/cr3eQl?=
 =?us-ascii?Q?2wQSiCvRTt5/5IhabinilbW003aSrm3Jky6ZKE+qonBvSqETKAujt3wtvU+v?=
 =?us-ascii?Q?SKR2wIFygOsdytmIsDiVL2fTkhoPQNLHcc08OHDsBFdXqk1IIrsKIPIJJmlE?=
 =?us-ascii?Q?M0smGaih2zEUvTEcCZnpTmQ7sHg1U5ceKj1Kwt1JQdmKVBtphVHJ4/VmcfNx?=
 =?us-ascii?Q?looSctVKgcRVVoyMw6xto/q3m0Lyq112QIHUVHrlovWtlR+uD5hJsH76ApHh?=
 =?us-ascii?Q?q2i0xH7AzYnENiPQEXCnMe0Chh6ny89tgI8stvUIOkIlZwagNcVInzpfFPhm?=
 =?us-ascii?Q?xSur5rAjGRPmJWO9PhOyRYLJ0t0kDxrkN+4b2NhSCTj/Wt8UHIDdI6dOdOlB?=
 =?us-ascii?Q?xmNgFoOPIsiVVcEweem6FlS+Tj3LTvjvfUNtGpcCNyFcKZ7dktrFgRzI+9bm?=
 =?us-ascii?Q?8pvJ8f7tbdF2IaXfoi0LtPRYSAgg/+9oPTo3lYYh6jz4TW9aKiYWiPl19jhK?=
 =?us-ascii?Q?ZBDACLakZycDbho2UIMkv4lrw70w5ocboeuSdJfmNDQueyVvIrSrVorvoLvB?=
 =?us-ascii?Q?0APB0PoXkW6ZUhRtif2wZAWYAbdPmn9C+a8qg1mjZOJWM+xB4KYe46eF/dy/?=
 =?us-ascii?Q?GCIc7OeUhrqes4fOA8kohlK7mg72P9iz/X8DXtLwqkGwX+sO0ZRnuMvwGsHc?=
 =?us-ascii?Q?ICfivpusq47n0DF9sjckqbARDIE+T6EovfyfAzaooHrNpCA7X2jqmB1nM0eK?=
 =?us-ascii?Q?e/hZjaAjrTdO6a6fLdKCYlBGoFsvgYJsZNbMSZzlAxI9HATfnTXOyP3tMuiC?=
 =?us-ascii?Q?XMD++BDDrtcQwarMPn/Dl2QaLKTTjYknj8ju+lOUYkMCl685Ax0tteytRnoa?=
 =?us-ascii?Q?oQoi9IBMhw4KwfYsdzXPkFGeraBHHfBtJcG9vhwAVb2n2C1sFiOJ0S82gUiw?=
 =?us-ascii?Q?wSCeeJHrlQyRDsY+ux36Xbi1Q7reoWSEYtBYQt2nvBUf1/JKtke1QLicEpvK?=
 =?us-ascii?Q?O1Uc6lFFs/3QFAJGiI/ZR4FPoRJz6TsFywzu88z3QKzfn3JSXwnCUWiFhO1G?=
 =?us-ascii?Q?FheDrbSNN5QyAxq04G6QsJtZoaklff6ascUZzobVFeH7SdxkypUO8KTvUZp0?=
 =?us-ascii?Q?hVNprMh3eRU01rbr0/XQGCky4JL4QMTqbjd3ROw3wXrNSFxOXnzqSVBXo2a3?=
 =?us-ascii?Q?LDVjrfQY/HuP82++LEE1vLcmWa1BqQeJ+laZdXaFjmuIHYf+8048xAhwvnOp?=
 =?us-ascii?Q?evbrA6yUzYlNXNhHCPZK4oIT/UI8cF8p9B6wovU2RWrSnIp+7oh+xw7dbcA+?=
 =?us-ascii?Q?LXLKDtUgdwp1K1v/v+758Sz+StcsBIbhogooas7J8jlD/uN8jIhzEXH59RSx?=
 =?us-ascii?Q?3JNOO2xBH0nJCD3xL7i1MZyPfNvdgo6H2jX6Dl6bIap7m3jtpxhsej+EqMhA?=
 =?us-ascii?Q?DLdFVWu8cTG2otlXSInrJFsZFEzrTXR17YJN62T+GkBmlrLH3yYrd0+dIKm5?=
 =?us-ascii?Q?py2ED3acLu+Uh6ih1FyAOFTmE3fTHFiLT8Z2UOPLkXP1vG60FuZjbvyc8z0I?=
 =?us-ascii?Q?1D1CAAoQZtb7JPVEZpNCrVMfWNmsyIMD7Y9kb2EQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b05446bf-e9ac-4b39-546c-08dd1e67a2a6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 06:54:21.8144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgDf458k8OcN9pjy4Xu30peORAydpazqNyWYYGZCYKItzqASz0GQruEBDs5xR4lTbh9Rz/faENSSAXQj8L738w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9009
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
v19->v20:
 *No change

v18->v19:
- Move property data-lanes to endpoint of port@1

v17->v18:
- replace lane-mapping with data-lanes

 .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   | 26 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     | 11 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
index 0165f3a259853..5ba06a411c6a1 100644
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
@@ -91,6 +103,20 @@ &led2 {
 	gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
 };
 
+&mhdp {
+	status = "okay";
+	ports {
+		port@1 {
+			reg = <1>;
+
+			mhdp_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
 /* PCIe slot on X36 */
 &pcie0 {
 	reset-gpio = <&expander0 14 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 58e3865c28895..d04b75a76dfe6 100644
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

