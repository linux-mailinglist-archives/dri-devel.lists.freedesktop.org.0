Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BAB9D9953
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 15:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AFA10E8C3;
	Tue, 26 Nov 2024 14:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Z+FdTL2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC3D10E8C3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 14:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nukvMPb3ldf1BlZeEpHzihK6pHSUibu1QhS4yS0mYd2WmLNrZOjioUw13tUaC8Gt2lDy9x8y88KQ3w9p35e6PF+SAqkd952dCxBjb97IqjHB9giua1PHEgL3/FU7latssDxCH2g7fAsHedIshkGt3i4LMbRBEkbgWmwJHR41U93f49Alzf5cLE0mwGjM6BlIhQ1qAwDKfMfaNcCi5YPmhV6j+6FFvxeqFz6W29NhSwH0GPb0wI8IjnHW6Vfo4dhT1SXlxZ+u7F0fzl8N6k0Z5EBwNLHmzlaleDkjPWJH222bCWq76ugCB5Opev4Z1MxxCW3OKkVg8prtFDApsNNH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2O6ed6EeRK5MGgtc5Ywc1zLxsiIGCPAOtpd0mLEja6c=;
 b=wSMMPdhplulZiUcCq2qPyZcXgqbAEU9pBvR8Q5tZCIuyBxiYsj2jmnmQKun+zTewDhETNc4KNzCnKKX1eCrwpHzWd2dvGhb1EjhI8VdVLiNtIYo3tLOb5M9WWyQCahgNpQjz75SgCwBrhpl4P/zpFMIKBom/CSGms2EOAeYIHnIuHmvHSrhZH8l/JtMdHmUnOx93tH0XT87sHaEslXc/wkcA099ZWp4Tr42i/cRPFt/HHdgelEIAoRQ/ww6dD94j97CLrzxC3oEPpYT4/SuHcKlZHNOu2cbKF6646GrjHkMsLRm0UXKvJv8iu8Qj0zbQolNlRBkDZY42p/xQoCaCxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2O6ed6EeRK5MGgtc5Ywc1zLxsiIGCPAOtpd0mLEja6c=;
 b=Z+FdTL2R0//I7BvSfg3TaT5DJfSu6EhuFkYAoHgcjhjycI8Uo91jWs874j83F0vmzmz9BFsW4WzuuAcEUswU9tH8JrIE4Vada259IbFlHozRfGu4tABaUhzci6I7J2a2iVl7tHKCNqSg4pVc29dkxafp1ogCrcLrF+LbePCrxmFNScW8MKwbErGuJA5JChnDA4JOx7AY0gr5E9cyhjgvBOzkWtdLoaDP1D4bKCT3QPcwRUrxIQaEulDkAPBVnkAepKmCFZO+3czU128OqLoV9q2jRkHn+RBxuy/T+7P96KRleFx8lHMi98Gbnduo5Xpv4r3ARP4Nv5HIyk/J4U0FiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PA2PR04MB10422.eurprd04.prod.outlook.com (2603:10a6:102:417::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 14:14:02 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 14:14:01 +0000
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
Subject: [PATCH v19 8/8] arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI
 support
Date: Tue, 26 Nov 2024 22:11:53 +0800
Message-Id: <ae6f043294e1d34c2473d657bb01ff967b85ef0d.1732627815.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732627815.git.Sandor.yu@nxp.com>
References: <cover.1732627815.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PA2PR04MB10422:EE_
X-MS-Office365-Filtering-Correlation-Id: d08d1407-9ee3-4aa1-a5d0-08dd0e24939f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5ismR0dc7o9Ppb56XfjoEKXZxGLjr/6nETR/ohM1KiLI2weliH3zUv9MsfaD?=
 =?us-ascii?Q?zSVavpDAGqo9rCejNKU6N8XRjHBqZGc/gWAGiLvRQ04jyeYedTY36POhqBhR?=
 =?us-ascii?Q?T/dvwXMD0dSjJITBw8dXN7xwOvINj5fznqbxk8isiarZ8oJe38MMKD4MgmMv?=
 =?us-ascii?Q?RNs//2BM95RI3J6XFkie2OK5HZfdrI1S7GCUhSHWYTI75EA7U2CZd12jKpVD?=
 =?us-ascii?Q?YJIlYgAMP9aWUEfUlgc8a/0zDnXDd5NQTtcyGoso8Z7gyROhbbyjABMyYOCD?=
 =?us-ascii?Q?Ncv3x3vhdcwqwblOjsqTT5RvP/iv/XnSxuNHPyWlh2G66F0ccZyTHJQOpq72?=
 =?us-ascii?Q?dFOQoxXaXNJLDmW5QOYd3RtViAcE9XYeBe/Bvt/QJXiy+D6oiYYi2Ub5fX77?=
 =?us-ascii?Q?SQDiSB74t/fXF0ZAAfMg3XvMYc74xZwwc6oaUTmk8TbDsAiAM6jhjNLUlt86?=
 =?us-ascii?Q?KTn+bWLbhKwuU0f4dwQHYxHTAizes1AxqTXX2ShHqiyOFJC5gCaJJKPHU0ag?=
 =?us-ascii?Q?wpecmuIxV5/05mt1c26Z6u7sdQ5hCGIlMaI/HEHznnCHp7AZlgGV+G93OdSL?=
 =?us-ascii?Q?xV7+BQaS3KF09uGzfzpL8qa9KqnfUIA/5zpdMDllWP7o1XmUlELOLwEMl30b?=
 =?us-ascii?Q?NJZR3VS8IWwjkpzx6i2iVmOWKDo6Lo8icqjWdXSwPcGMLb1VNUK26Utt2KPl?=
 =?us-ascii?Q?KoLpduyB8W/w63Y1p/XEzPk6gvsLEY8eVPJyQ3BujV/DqnJ1XC5D1tJwFdPB?=
 =?us-ascii?Q?385oUm+ZsmJeh/YQRrH7DtyJ0vzzdjgi1l768TtIT/Dx6KDGhAjk84eAnzMu?=
 =?us-ascii?Q?e7rztOdOM8F3+dnRrglvPhuYHhYiJWEavDXaVczR+RJRIzgUWPDqjXddsan6?=
 =?us-ascii?Q?0lTTVamJb+piNNvSvrqI9giPdNW4v4ltdVtIGt5ul1H9gfZ3gT9pOVmtMG8f?=
 =?us-ascii?Q?I90B2MG1nTHOIv/Q8Bt/j2COId+fj0G8nid8gK3cH9IEbulz7IsvRIVfy/LD?=
 =?us-ascii?Q?wp8XqrgQ1WDg/6FcNgc9mbA1INv2sKBRKrkfXBg1EoiQ0l0GR92Nhae2/fe6?=
 =?us-ascii?Q?OQfCXKmBPNReo3+1F0VjaCfA51lqH4o0EzlrChCotMyfLPaPFFrCYIod/Hxi?=
 =?us-ascii?Q?b+6G7L3Dao7O1rdBDvM0hoMiy39CWywI2/tvBbMLUF8eAHxJWFbvpBXCKjwb?=
 =?us-ascii?Q?8jQP+If0o2mAK2RLjxPDgEFK5V21bGrm2Hl/FW/QW345bGlMQ8OArRjLWvzp?=
 =?us-ascii?Q?k8xiwxG3zGocL6BvSYOt3IutumVwaq0kh22alEhTbMXQZ2vUY6PgS1yFHAbE?=
 =?us-ascii?Q?YtJEdlDHe39KNtOdFyWc49P5XeRpPo9Ifzwn6c/Eng2vxlgN3/tA7e+5hPtf?=
 =?us-ascii?Q?k61yEaCIuhS6bxirRFGSPgi6iHNR/sDe2IHgeVYitv0V+XiwjmI5HLrSRl3r?=
 =?us-ascii?Q?w54pPH+/im8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LBLgpkO3q1kOETFBSDEF7P3cM0pjxBIgVNgfsRKfOLNFTVmUSD7XqX8pxlXP?=
 =?us-ascii?Q?bSdPgRAHCyoD5YM0F1ZEfzMA852+w0//sGGT3KSu8VTTbsyaHcOWIo5Sv1jJ?=
 =?us-ascii?Q?epJa/cb3Rd+ndRHXRw03yfrkPiRl18f4uPdpNS1+/4CIVbigejQRlqOqUP0x?=
 =?us-ascii?Q?J5yad4q30zvL9ailVaOSe/bu3fMS1ZDRxNR5Ca+VDfBGB6Y5WOXGvwzj2/c5?=
 =?us-ascii?Q?NMzHmF7CHUA/1A4lf0X4Cg3WbBifbYU+QvQ3ujtwCV7X/KeohQH6iQKzueob?=
 =?us-ascii?Q?lOHwgZayXjSYqCMiYVq0Rm+YPN4nzzpXasdB7TIJZV0WeeBqp6phkONn3njd?=
 =?us-ascii?Q?a5DORf/gfDiCaywtux+gox2M2cEhYmv7NGRefZHkRlMtUrSle4odmuWY7yjZ?=
 =?us-ascii?Q?RHOR+GEq2EdhKwTw3vuQ5VDmFbKOXru3Bau14cB9CuqOPVlHa/cYXHbj8jdS?=
 =?us-ascii?Q?eu7544ZQH+hrVgUE7cZp/LKqL/WTJqTHY+5oE8UtFvvqyfD7DvhPZESPkJhC?=
 =?us-ascii?Q?CmJr967C5ASkzKf0inF0pkNrZljY4+6lDKBmTaNA9quLaDEgD2i4F4e+ffyB?=
 =?us-ascii?Q?qKImuXeSjdLxdDuRslrfCyCGW584QjhFWf1Y90FLkSWSKsbLmthttfg3mgFT?=
 =?us-ascii?Q?Dy7JvAPrAyJTGbpq8+ELr4z7i74AKlTSyAB2pa+zKwmjLUN6LwBG1A46pTRp?=
 =?us-ascii?Q?hy1ru7hDK5iJqDqBqf7Omi0jq+l0/2VVF0HK38syVqo4G+TnY2tALOWRFcqb?=
 =?us-ascii?Q?D4DuybntZNQN+IRxzRKLVHsDzwZlspkFnvgnNO2+rv1M/i8wqHXOPAjRRv/w?=
 =?us-ascii?Q?mtsTSNfffR0ZgjCYUOli9i3jsiFbuszdDbLXNavkdjLqs1JeJm5jHwFeU9mG?=
 =?us-ascii?Q?YU6A7tbzJztsS6eMbTt2EFKbNfPMA5nG67WctUgSrlOtR0GJ30GxbJ5DNA5E?=
 =?us-ascii?Q?l8z7ymMCyrCXL1dr8YSWJU5zhvuc7dXXa+VVRVMUUuUkHDGnvtg9z/aPHCax?=
 =?us-ascii?Q?5Tip73xgy1yKaguxQ2K+8+bH6TsGfYEbLNFk5qRy+cwjrSpCoGYvnZXMlzz9?=
 =?us-ascii?Q?wsiBZtchuiO1WPhKVK4yKYABY3Zz0QiC0v7MIttZ/UT2UpUMLx6OO9vU4F9Z?=
 =?us-ascii?Q?j7Fs8xujdnpcSDNJlsVm9A5eqVY66bSP326j8DRUsVQXBumzObKP32Be7lKb?=
 =?us-ascii?Q?zBIHoBlBxezuRR2+K+gRhzE5xamh5OzPcZb4hB5k+SbH/0a766rQ9lpZoYiT?=
 =?us-ascii?Q?pXZgRlb+USpLtAedVyp/+eT1yLK3NBpKZUlSvZNBOe0YPPUMJyzCH/KRR97R?=
 =?us-ascii?Q?6maWGr54iFzyLmTswU7lqDOhDyITKgJh6upLZNbMw5TfMqzjdaVaHsSAMTZ7?=
 =?us-ascii?Q?hh54GMjCdpjtgXxAiMBEguk9ikOuIiOtlCPAie29rLrWk7vxuas3c4ylzvLj?=
 =?us-ascii?Q?BNvk1qLrLeZv/h8JWb/yN95PZzppH0MBHccfbd1WX0o7kxRFVlaOQ2EDfyDA?=
 =?us-ascii?Q?Lh0IvTZ/fCfnk4bhx0qkqi8hcToUV7c0Rrdo9/mudC/6Ar0xigRLa7lomeux?=
 =?us-ascii?Q?0zJXE0WgpIEksUVQimGuRl10QHW3tl5VZy+57Uwl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08d1407-9ee3-4aa1-a5d0-08dd0e24939f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 14:14:01.9070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJEJ9atQcAuLatBFDuYI8G+6+rPExO26wuwOZNonxE62QxNpWQLmDErKqsf+h/1r+uE11AcKSCLwSKS1eU2jqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10422
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

