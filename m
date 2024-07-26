Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F4D93CE46
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 08:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C9010E17A;
	Fri, 26 Jul 2024 06:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CAuXMEtt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97ED910E17A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 06:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Edc4i34XqO37wLn3aTFxMiqyU2fJSuEX+maRJSFqQfNgy/voru1qSJwujk9GtFbxHMAJKE7KaAEunICY58K7/4hSWg6qoECtkImVBCRgaT0PXKXF9ZiPI4whd926SrU5yFfSyWdUG6rw45+1RjSI3lACXVPfOz5zYqKoRr+6Wu8S0NLqGhbXmb1VD/7Rap++lp7OfighxIL3tl6e5CNfFr00eUZiLNrNEF+E2v0uu3Tl/XtqpKkIzWODxYUkGu5fLSbvNlOVt1JpFMqI1TICmmWdkpKaqtEXx8rm19njb/ZDs/yNFmn2odLpzRACh+msiVetcuzpyDee03z6O/pbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49Wf9uGevXP/V2CbnDdnacO7G3O4CTmL/fdgQijpdx8=;
 b=ySvKk3oDoeC0uDfjfT/UCr4FG1QA4yO6htdKe1kD8jvrlmqi+GYR4XZ73gY4zryNQ7A5BCDuZ9KzITHiBrKr/oQ2z44zr9QVy7LsfgiqIM6GI4+1aEQPvUQfZhotuHp75CCBWcUV5+ia9MxWByp6FZ0SPdzVbvVmJfjNqMqXUpeG9uY99C2rwztDNCAoNvT7nlRulDGTwIqhGhU5/LTvwAyBxEXQ3XEIlWgZuY2leoXZaSTmU448Hzujv6frRKmwQUde7kOD/0RPD83EHjREx8J6w7LbIr1CwnUialN8vwJzde5Dee5wY7Dak446tVWHJRu/0hFDeYVZcu4gFO9fGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49Wf9uGevXP/V2CbnDdnacO7G3O4CTmL/fdgQijpdx8=;
 b=CAuXMEtt0+RlFCCN4ypPDIQYLV5Yq2/BJTh+BesvcjxSOOOwZqnmXnx9o6EGEGWrrvJuT0gic5bydqnjX6tdBW7pbO1Tb/Ofp6PG5kPmG6qo6hKwKRiTuAaqrcptp0ZOSptm6AFWGputiaY3vdTlu3uXuTiUxpD6eZb2fVdATb9/JDpvq9I3mWKh8wVhDDiedWZ57xOphXgWQ9vIWfo/8q236o5PqlXB0L67CRLNGSCX/+JcseaOixmTKctlSLt6MnzmGSULCterSFO4WFr1mVgw+5JdXo4BN/4KfkZjdKVGtNt55Y/moa4izOYRKaIpXf4RoihDcy5hmqjuswjpFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9775.eurprd04.prod.outlook.com (2603:10a6:10:4ce::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 06:50:15 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 06:50:14 +0000
From: Liu Ying <victor.liu@nxp.com>
To: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, saravanak@google.com
Subject: [RFC PATCH] ARM: dts: imx53-qsb: Add MCIMX-LVDS1 display module
 support
Date: Fri, 26 Jul 2024 14:50:12 +0800
Message-Id: <20240726065012.618606-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9775:EE_
X-MS-Office365-Filtering-Correlation-Id: f877974c-56f9-4925-9eb0-08dcad3f33f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C/3n1W6g3693pVTiPMk08aG8Hj1/tMYB9Kq+Z1JGoSyZ/dBq0l0VwculmgUr?=
 =?us-ascii?Q?QLcCd/JfRPlQPLh7SHih0fS313vxTCLwWpu65PnGHI7dd8rYrn9U3xAVDF8n?=
 =?us-ascii?Q?E/Va4S9+HWhYf29LK64meCgMOm7YBEY+QifkUP2rr93YQAfetoOA0GUjMs0e?=
 =?us-ascii?Q?zOL8HHt4ihH8SUjOA/zl9d6NYBAFlRxhO65aV4UhfMVQBULVK6MA6h4CnMcm?=
 =?us-ascii?Q?jupQuuhzfl4G1FVB7jhjmlTKMFQU3uqVUxeb8gWTksSbO3UFhEMxq4GSyxAo?=
 =?us-ascii?Q?awWrNk8mT0ltXl7Rre0g7LhM5GGKy1qqcHanucNtV9KevPaN6Lk3Jj79o7TG?=
 =?us-ascii?Q?U+yExCUZLtjUtNO4qbneUmFqi8yoXxkpbNS8jnqFlpU+Jl/2dTQTV2uuUJ3t?=
 =?us-ascii?Q?a4OmmxrBoI5SbggAgPXGdc/n0ADGtBHxxSnhmo2cNbjIfmQLM4CKDcH9T4Ss?=
 =?us-ascii?Q?8JYZWjYcThn2NT5Aabg5FikoR73Y4SjjiB7lEOqt0P9Xhpe7TFdgMiuUH26K?=
 =?us-ascii?Q?bGT7kcdOos6DhIPbncm5RqD2SLtdr6bmYE4NuimgRqInyhexqaxoodI72FEZ?=
 =?us-ascii?Q?UQpeiVAHqifNQAVL7w/HO7XIQbW9oIo2CNeSwwcjOnSUR/TIvPh3sk57jAxo?=
 =?us-ascii?Q?aNp+8a5OKqVtryoIZ0n1IsZXdax4C0aMWbXFSdM+rOI/iAAtPVHdNvZBfZuI?=
 =?us-ascii?Q?KBP51k197FAPJdLD7C1qotcV1Se960oJ2Apxw3VFETfA8Cl5f5o6O71nMPXJ?=
 =?us-ascii?Q?u0IjrLMSoTfli7QWjIgVAWWq0Q1ZBe6MPmuek+J8A3T5J/H2xM/gw8VJLBu5?=
 =?us-ascii?Q?0EAmUYr9oUAplFG6w/VyQYd/hGsqfhUZooMs8ibKfhIQgUtY6L2KTFnKw0j4?=
 =?us-ascii?Q?DlVACcTYHDfagVPP3ChIjFV8CpSxgL2GTvGdt0ddhccE2Vyk/BKkiyhvwBpn?=
 =?us-ascii?Q?onnUjpgzpRXVHDRDHPnupwYq/ET9QDQfsH1mei1VFfA0oI0c9wc/nppxR9Hx?=
 =?us-ascii?Q?PfErc3WrUUZByGDHT7Lm+WFA02+ruIGf3ImZskz51kmW1FAdI5N+82huDY2q?=
 =?us-ascii?Q?fW3IcNJYXl1xd0m2r8g4yjX0mVlUz2gf8TSWROQwAk8aBe9IvuNoUqDPOB51?=
 =?us-ascii?Q?mH0a87BF1HRINUyraAYQwmjhZqfhmwCNRX5Q4ozR6sJmmEVvYna6FoldSFAG?=
 =?us-ascii?Q?dR/4jqyxkzLfiHEnNdzTsRq7taquqCnUtScFHnWuRm/UDAewb4UOLB6P7YGd?=
 =?us-ascii?Q?n7uXmLhbQoqgdzQ/FIKZNWlCgCiiODkTBALJk9THFCRqQEHWQmK2kRUnxAI+?=
 =?us-ascii?Q?oF1l4/P444HELOx8C2xi0DRupouJzxs4ya1s1UY7804HndNzcZD45IkhiCFy?=
 =?us-ascii?Q?LVpdlRHPa0rXMAB75TkpQ/bEMwSBACkcAGLnwQ9HLv1pmc5FiQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/3BE7ZpKz5WZFt2dF4qNQ8VhLUvPCB/1UF4q3Nd98LUSs2zeDwQGveb+tmuL?=
 =?us-ascii?Q?DDreh+cVvzCjadeu+QjvvGPIGq+BSe/QX1SqH9Y2AQo5enqVgsD5ZvlbCiSf?=
 =?us-ascii?Q?o+9sHTdocg+1coeS7b96DilEVETmWqDLJb6WuBWhUs3VqLIstmUBHF7kgRpj?=
 =?us-ascii?Q?OW1qGt3gaJygWS0Im9FcQG5aryyo6HA+BWk9jX8QTzMKLLd5fZ/EBxEwMkum?=
 =?us-ascii?Q?dhvKVA+kQznAeziF9LohJ64Tq+zTBAFP7CyxZn0YsBfEx965eTyHJV19Q5YD?=
 =?us-ascii?Q?TLeiVnPR1srKPwIaR7ltej/w3U9SHU9zZ+zXn7k5jkXhuQUUk/Mr2mM3ah/D?=
 =?us-ascii?Q?oAZcjb9txrB3jIjJut3VJqal474ZRrb8i8RXhkTgy+tJ6/RFVfY+s2naDqF/?=
 =?us-ascii?Q?ZwMJv7j/LE2zGXjY4e76PNmtKJROFIGz4U577tx6lvlS83EgAv7I/Y1YpBio?=
 =?us-ascii?Q?DbyKhGOycpe0IHzKE5LBXa/TKARD9H+FAK5rVBBy9wf0FcOGS0T2q+57HOzB?=
 =?us-ascii?Q?C1yri9fAb0pQs48Qey7s6e8mihQFgLLK6USXivYnehjw5NMQyaELZ9dP620w?=
 =?us-ascii?Q?xVHijQgdS4+1NwMxyn0nakUB3tDaYQOLY9l/bcPYXOT3TicXV0aF8iWGyv3t?=
 =?us-ascii?Q?gYQEU1H/TBWOw0SIkIfsBO7ziGjktUm5Ix8vBt0lQDRKOQrBMeG+xDxEhYvm?=
 =?us-ascii?Q?PuJq041q11b7iTrEfMpZ8Ogq67uw1MQbn+GQvf0cSSQ7qW8Si1Z+jHG20uiY?=
 =?us-ascii?Q?lGTuXtthxf6dbGyUMoAY1iGMeDvHeUU/mBZ9yJaJJqgYDtXPCQyK3vmj0sr4?=
 =?us-ascii?Q?QTmMyyefC8rIXFe4pYNdWFkGeDlCVd+Fat4hDUfVHqSqZYvOAsVHDQIDi44v?=
 =?us-ascii?Q?9Qe+Y7hNiClDe6MctlnYDBE4IXntNI9jGNhJFFCMRLvcsk3z95RQXnywOeUi?=
 =?us-ascii?Q?9wVXR4gt8MDft4lB1GodMKW3rdgL/4iI8VPhrPij3etZIL0kCABdEG3R1Awj?=
 =?us-ascii?Q?vaD4IO0XSj5bzN5+yFFrhn7Is508E/x21ALpD58KEquV64cuifDGQXy49bk9?=
 =?us-ascii?Q?LROHJgU01aqfFEujbivS2nRSDd6BRpikrgNtf32BIujvP14r8fgDHW70BqxV?=
 =?us-ascii?Q?wp3mfYUdaYA654re1BH7HYJt/KbWT5eZsn9sO/zdW7fUmm4vzu0vO5oIxlV6?=
 =?us-ascii?Q?jgmbulEHHuGP1lZlh8zw2Ayy1JIGdIPpjWHj8h4cXXu1AQXgo9XDke4OZvmd?=
 =?us-ascii?Q?9Xfh2O2uu3Ay2gbijkGPHXC6P6m2yQQsImIECOTWHmSGyTB9gKZq+emlqYWf?=
 =?us-ascii?Q?Cmmoix33zrZjRlIudPqITukx1TzVxlthBhWkDvRFL28jIFeQgTlBrDiaKCCJ?=
 =?us-ascii?Q?RcL6pvwTRPBi6hwptjunkMgtsgGuIy93cTRLxu4hB/oYrcpgW5+XkUHFOVx+?=
 =?us-ascii?Q?Wmh2SE+A2xFI5zT1zj3uTqxM616WGTrwyNaphoAIA5duqjgSrSzLaHkgaOC+?=
 =?us-ascii?Q?FyMooYB1vc4LCi0Hz3dvZ72TfYb8mE1w9UIA1EftISCiJpN+CiTPcCBVhrgc?=
 =?us-ascii?Q?jcREdMQf6Nzz5MPSl6gmmEh5lGc+exsraEPZHUmo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f877974c-56f9-4925-9eb0-08dcad3f33f6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 06:50:14.7889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Uih8CVvpSkya9BgEoD8liHv1F3K3Mxjr0HYmPWFW90c/eEX+T1NStkgZgLIw1qVlpceMR5OkDZjzydv2xJw2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9775
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

MCIMX-LVDS1[1] display module integrates a HannStar HSD100PXN1 LVDS
display panel and a touch IC.  Add an overlay to support the LVDS
panel on i.MX53 QSB / QSRB platforms.

[1] https://www.nxp.com/part/MCIMX-LVDS1

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
I mark RFC in patch subject prefix because if the DT overlay is used, both ldb
and panel devices end up as devices deferred.  However, if the DT overlay is
not used and the devices are defined in imx53-qsb-common.dtsi, then they can be
probed ok.

With a dev_err_probe() added to imx_ldb_probe() in imx-ldb.c, devices_deferred
indicates 53fa8008.ldb and panel-lvds kind of depend on each other.

root@imx53qsb:~# cat /sys/kernel/debug/devices_deferred
53fa8008.ldb    imx-ldb: failed to find panel or bridge for channel0
panel-lvds      platform: wait for supplier /soc/bus@50000000/ldb@53fa8008/lvds-channel@0

It looks like the issue is related to fw_devlink, because if "fw_devlink=off"
is added to kernel bootup command line, then the issue doesn't happen.

Saravana, DT folks, any ideas?

Thanks.

 arch/arm/boot/dts/nxp/imx/Makefile            |  4 ++
 .../boot/dts/nxp/imx/imx53-qsb-common.dtsi    |  4 +-
 .../dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso    | 43 +++++++++++++++++++
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 92e291603ea1..7116889e1515 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -46,8 +46,10 @@ dtb-$(CONFIG_SOC_IMX53) += \
 	imx53-ppd.dtb \
 	imx53-qsb.dtb \
 	imx53-qsb-hdmi.dtb \
+	imx53-qsb-mcimx-lvds1.dtb \
 	imx53-qsrb.dtb \
 	imx53-qsrb-hdmi.dtb \
+	imx53-qsrb-mcimx-lvds1.dtb \
 	imx53-sk-imx53.dtb \
 	imx53-sk-imx53-atm0700d4-lvds.dtb \
 	imx53-sk-imx53-atm0700d4-rgb.dtb \
@@ -57,7 +59,9 @@ dtb-$(CONFIG_SOC_IMX53) += \
 	imx53-usbarmory.dtb \
 	imx53-voipac-bsb.dtb
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
+imx53-qsb-mcimx-lvds1-dtbs := imx53-qsb.dtb imx53-qsb-mcimx-lvds1.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
+imx53-qsrb-mcimx-lvds1-dtbs := imx53-qsrb.dtb imx53-qsb-mcimx-lvds1.dtbo
 dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-alti6p.dtb \
 	imx6dl-apf6dev.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
index 05d7a462ea25..430792a91ccf 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi
@@ -16,7 +16,7 @@ memory@70000000 {
 		      <0xb0000000 0x20000000>;
 	};
 
-	backlight_parallel: backlight-parallel {
+	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm2 0 5000000 0>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
@@ -89,7 +89,7 @@ panel_dpi: panel {
 		compatible = "sii,43wvf1g";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_display_power>;
-		backlight = <&backlight_parallel>;
+		backlight = <&backlight>;
 		enable-gpios = <&gpio3 24 GPIO_ACTIVE_HIGH>;
 
 		port {
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
new file mode 100644
index 000000000000..27f6bedf3d39
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx53-qsb-mcimx-lvds1.dtso
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel-lvds {
+		compatible = "hannstar,hsd100pxn1";
+		backlight = <&backlight>;
+		power-supply = <&reg_3p2v>;
+
+		port {
+			panel_lvds_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
+
+&ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	lvds-channel@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <18>;
+		status = "okay";
+
+		port@2 {
+			reg = <2>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_lvds_in>;
+			};
+		};
+	};
+};
-- 
2.34.1

