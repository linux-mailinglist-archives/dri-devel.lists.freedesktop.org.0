Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B57D9B4217
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 07:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6E510E5A3;
	Tue, 29 Oct 2024 06:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FikMmXVS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2383E10E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 06:05:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBERm6Fuk3/b+oZ5c3yfoRKtvi3nY0b8m0eQpqd5kZcuEa07Zou+z9L1/DTddiLkK3EHdOdhtCrt572TR9LeameOyasVEYSQkZO10SpNK52GVJCAyVaO8+P2rBoP3JMqXeJfi/PCMaZRQPDavmHb+N8eovK5ERh+kwlPfQGzAa6nMdW71gRVAyockZFiJ46HIWSqOKJfEqKceqi4h7aAwKwfOcUbdIoTADkp/ssQzsHPunpQkNgnFsSzXDSQEVJGJxYS/idjhxT62vgJ5dn+UmpcJlOP5Vouuytg+nqrimv77MayZlwl8V+hFHuOQczNTFvuaeN/eW2G3Ie5QheHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP1qGzQpYoM1VEAb59R95gqmXNmVKTOyigOzO9Bk3oU=;
 b=sbeyUkkFmU/mqqvuWIauvOk1R7pH06JnHoRfYwWCHMG9JhQlQlZUsrTmSO1N7rKWQuxU12+UGsX8wLIXCg2K9fEktPqcAERXkcOSZ4rEhe90bD6tR6+UgDFs/5Ty2bsyyzXJBk1Fkq7w0s+9jVdHJWuxzBqkU+Pkeov18Il5tFcWUirURnc3KpwikqA69TzJtl11JoNF6qX052miUf+9Iqrf2fgEnbSg0CGvLF+225BQOLyeCtqdRpfax8zcM0GWw4b5uU/mElT18GvffjfW0xKWuiDit55sCRuWlQgmr78ONIg2X1p2ajPN7Ft/gyG9d4IaTifvXLCu24OzjpRY1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP1qGzQpYoM1VEAb59R95gqmXNmVKTOyigOzO9Bk3oU=;
 b=FikMmXVSoXzSYIhh4HWu2vyj9tWrLGiweYPZreeeZAHAOJBJL9qEuEJx7jIkt/QUNsGbJ19bMQdGbC0k0XPlrBzXFU4w2rhFxN/yZx8CWb2BQ8XreB+olwLOnjOfK4a8ulcIzH5uYOfqvzmWd8vlljygDNfktNf/tYu39MXVRwJfkJvvBdSQo/beY1jjiR7TqPT65jOoXZ0uvDXV5247SKGEWcMnRxfufTUQV7nijnII3p5/frqpXyZn2qNmBt+cPF6S/qLgWWZmp4CR0+M1F6i3ZtOPCzVXmt+K8AG9+FNuj27TmbkxG668X34n032EEedT1s+piV3+/KgIPBuk6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB8488.eurprd04.prod.outlook.com (2603:10a6:20b:41b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Tue, 29 Oct
 2024 06:05:17 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 06:05:17 +0000
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
Subject: [PATCH v18 8/8] arm64: dts: imx8mq: tqma8mq-mba8mx: Enable HDMI
 support
Date: Tue, 29 Oct 2024 14:02:16 +0800
Message-Id: <3c52cbe438f1bf10f4d1ec7867452c24d8ded8d1.1730172244.git.Sandor.yu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM9PR04MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 86641273-bceb-4b6c-74be-08dcf7dfa95b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PfXGjpzT17qHdFE5TNZdwJAZRoBAe18sUsdGoLsQlwH7DCzdlboGRHEaqw1l?=
 =?us-ascii?Q?Ztwxj9bF3KNsyntHqHuo7EZdwPShKzoJYpPl04DhZ1CdXsxI+hX7UV5lqU+z?=
 =?us-ascii?Q?MwCCEiDAF+5Tf2SfyhXu8PGIwmkjz5/hNUE6dw6IC/JBVSA02mh6nFY8Tmio?=
 =?us-ascii?Q?ebBYrI87ea2xruLwrjV1BKx2LSu+eD1diOG+NaGTa5aB/2OX5R/ncysqdzQv?=
 =?us-ascii?Q?2lqEfCqSyui6gBPHG+6SuNnFV82el17Rgggf41IiIQfSFQ46HTd4Odz8auhp?=
 =?us-ascii?Q?yCIXNwaHIMkrZNETrHGsCur2Asdj1g5h+j5r0Pd4cpUkhYG/5RNxr94aC/gC?=
 =?us-ascii?Q?AdHCaDQhVFq4fMbTH9ji+n134PvcmaTWt2KAr8axrFvbPkWD3X07gT1gLDFa?=
 =?us-ascii?Q?eITWno3tqtDwdPKcbnQcTjgJT+TYnnECBNbumygdvd1X/yyINmCyQ8Z3o32M?=
 =?us-ascii?Q?wXUnqC6aS3BeM7B5t1samjQa/8jLUDfcFefNihvHFrAwW3syryxlYEZZrRvD?=
 =?us-ascii?Q?6E5c1a7/JI2jDCreVP3sLiI1s4wvBfcukHxlE4o8+N+wHjeqHBw74IRPR5en?=
 =?us-ascii?Q?LbHwmpnIH5oxZnH7l7I6HeYC/Sy1NM9Eg4uUrQN9BgFEfhTUhhFLSkIgHPN+?=
 =?us-ascii?Q?x3IRMhS8YL4xi/ofP2IegZqVdbcr9N6/xSIS7t5Wh60em7yI6avItkPPV77G?=
 =?us-ascii?Q?w4YLJxxo44CXVh4w5dZjW1AeAwVLkTewLd2G2EgrPdkAe4ww8fkL4WdaSGZC?=
 =?us-ascii?Q?ZcqYYWgB+shu8kU6TlhdkaYsQgOZCU3MQ/Hmh9qqMTaBIPa/+Sx/UwMVDfEM?=
 =?us-ascii?Q?xYKKdL3GViRlr6JALYwJKpwFZW8EIcf0Jcrdr3XKNMwCkBMbOvvVB4K3hM9S?=
 =?us-ascii?Q?cGdOF2Z+zbNLD14om6uoHQd0LVYzCG5BrBf9FhSktUkEk3Ru0OINrB3ygfnI?=
 =?us-ascii?Q?uWjqOjbkavlqOZKgEUfExMSAIkEaADXLyBlR3dZdt1640JV+kUM5+3wUgR7E?=
 =?us-ascii?Q?IT6cMwrYkCP6uc62d1OI+rCarVwHmeRRdK9Utckfbnx/BOUBp+O0lyClol0R?=
 =?us-ascii?Q?32R0iHuqD50XXiwUZZwRkOhwYRlLo53fTfSIWdEdVhBRaNoNhgBm6aa09Hyz?=
 =?us-ascii?Q?IzypmSDPb8rKlU48HujC2VdrleNg+2/NBnqaycbWnPRpkWXBN37TWPS84yyu?=
 =?us-ascii?Q?7896PY2kAl0XxQKYORZ061J47U9PlYRytfRbpkLbx0rThCFav4gWfblhxf4b?=
 =?us-ascii?Q?mx3ghbyCQ3HmxNuiPL1VZWFs6L82JsSmLq6mi55vsOLJ2pd/b1xdUH7ONNC4?=
 =?us-ascii?Q?5y5jlKFmafVk6DNvGJibZTcqXgz2xmdmWgcebIH6gmVsj5UbXMu4pkNTZkCJ?=
 =?us-ascii?Q?rByazRTTkmI100kqQMey/qifDo5n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jxbEnbhqu1VmJ8p2JA17+qf09DOmGeUwXZEOGRk3eMKw89M/Jy7aNhnfm4G7?=
 =?us-ascii?Q?O+ftrvBHyCFLXSSFaFAkGy+kydnvsLezBDACL0k71ADG/7SpesKdbcLJ42ij?=
 =?us-ascii?Q?Aq0ekZ/gbYmQvYbz8ed4vFoiDQoDgNyqWZKrDP8gf3x5BbLce1Yic2l/hhi7?=
 =?us-ascii?Q?5Ne9wLQJ2oEMzhdPSeHQl8CkH84yUfYcfE9MEaOBcLBRB1dtYd1cOXZHWyxy?=
 =?us-ascii?Q?+KHUpZ9gF0k9JNAkz2AjzQUzMWZ21fd2Z4AhkOLsyzVHdBEU6egFf+qhFv0l?=
 =?us-ascii?Q?6HzlSJco3tCayKP6mKNk64bN2HcMDeW9x/DuKjkb3+UzVf6VUXBV9V09/uOh?=
 =?us-ascii?Q?leGo3k3Yb8S/W2n1pFNzDdFPJfbPZR4jjODr4eb2iE2Bg7T8UDQVwvdLWIHJ?=
 =?us-ascii?Q?2TV+l2MLbTJdVYnwqvFZPaqOrDn4R3qxfbhfqLdX73U+C9nE6Cod0EMjVN2Z?=
 =?us-ascii?Q?sRWXQCHRLXSJe/OXptxoBEhCTWnVh0qT/Gzr0/7ZeN3iS9LAnRtiqPR7FId0?=
 =?us-ascii?Q?B/z3dPpOKhSHC6ZTSVJWCuzR4CZtJUJ/JQyY8zLSbPNVy2t1j+KIrpWnx/JF?=
 =?us-ascii?Q?JES8qCJh20eY1gkjCwLTorO05+6sL+164v0GiKz9y7r+PbTUebyickp9WzK3?=
 =?us-ascii?Q?20Bg/ysXK+PqRDsVbO+5pN/joH5qSExCXLiVC+tvBQomYdZY1mNmH6YlgXNO?=
 =?us-ascii?Q?1gLg/grCgDgsOXF3A2WiPgYWOYlz+L70Kkn/zGtGm4vc1d0JYg+tZTsryWp+?=
 =?us-ascii?Q?fozpYQ+JSJ1mCdqe2iVrMzLsabgxV5B6u8i0o6+SaPExCITvMqClLqc+HvM6?=
 =?us-ascii?Q?zGlNvHmNEHwWWJli/OAhL1UPuEksLMVoe+XbPUHwRNoOHjgBrJAKyaDcBIAr?=
 =?us-ascii?Q?+tcbBdnKpj74PH5huD+ZCbMY2UKt42P/K8skj/NhclXgvm94K6fDjiPPzLsi?=
 =?us-ascii?Q?fsPH1PEH1QHcx3tWsAtFWqNUou8ytVWdhaborEROe8klAqEDOkqD6Rq1naHO?=
 =?us-ascii?Q?L5V/+bSdl4YbfOxOwuG8JRmZuCdj0zhQJk4OaBouXdOUeQdJNgWzk8wdfVbs?=
 =?us-ascii?Q?hM6kKUkI3gXWCWb5IEDDEUPjZk1JLxQDkEIM7rfWpVB1N7JinlP3/fzjU215?=
 =?us-ascii?Q?4EngIIoQpO3np8PftxqctIoDiDpvMyLiGQMKoQpTr93csnBe2olDUoMHPIUL?=
 =?us-ascii?Q?F1URLxz0s3B9Y+hfKDt0EzTpRUrwp4Vu3qVCQTWIDWD1tlVWwlNqzgqJt5q3?=
 =?us-ascii?Q?PVP2SLJnWhVumgqcYmFHZklfgnlNgU2AldpFDGxuT6bbPNEi4MZotRbI4+US?=
 =?us-ascii?Q?+0pOAQVOjLbR4XhZpBlBtUj/4vf6/uGkGsUQNoCCOb7JvIng7NKezpnx0S2P?=
 =?us-ascii?Q?O+yXueqkgpsZLxV5jZ6IZSzPWrjj9ypVHMywOyOwzEfr1VOOnH3Qp/HOYSSM?=
 =?us-ascii?Q?Nm/nQFlQ+cMa3B1UTMwjZj0dvPS4WHRoHQTavzgadSpvCkV6i9tiVAAahKa+?=
 =?us-ascii?Q?NymEM4eEXzvN3sJJQBurgg2+kpkIfVoB5XnMSQEXp1UScLHQWoiyx6n8r2KN?=
 =?us-ascii?Q?USwrfVEa74cGkjguReDBysDZJQHTgl4vwISBLxXK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86641273-bceb-4b6c-74be-08dcf7dfa95b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 06:05:17.2886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5bmJWw3OyyNCxFGQxDMrX+f1/MnS50hqq/KcKkdbPdpdzZZWiRwKAXkHF2NzNbbeomQnLTOssTIx3VfAuGqpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8488
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
v17->v18:
- replace lane-mapping with data-lanes

 .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   | 21 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     | 11 ++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
index 0165f3a259853..9bbc33e9ca299 100644
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
@@ -91,6 +103,15 @@ &led2 {
 	gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
 };
 
+&mhdp {
+	data-lanes = <1 2 3 4>;
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
index c60c7a9e54aff..fedc284ebb506 100644
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

