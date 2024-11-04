Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B59BAB46
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8395A10E35A;
	Mon,  4 Nov 2024 03:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="F9S9r0NB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2055.outbound.protection.outlook.com [40.107.104.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989CF10E35A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:28:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5h55l2+0En03tovNWez4cwmPUhX9R9/w3xUNZXfM4oArgSXhZqoKqcWlSD60fTXXfkNT+/USWqZWBGQrJYLM37cBFxw5e3YDQVaAuH6Z3Fiwnre5++mWqEVKxJhcMrb3ApxY+f1fAC3lN6RCDrngyILKY3HyktxcsbO6srTkbZJk/+LpvPDsgJbEI5tISlu5bKoh9gNvo52hmhmvcmE1R+1PYQ/X7aA9xQfwlbXoSGsnvlTZE9mNsGE3yiIo+5j6TONJMOK+TfQ8mhYhniScxmYhCz/3P0D+mhI5M+qSx3eRzloX0VGHbaA2UNQtF6OOEUN+x6NJaNEQQ1vWGIcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xK9QuciZD3bIE5z9vrb6bf25cs0xqPZ1iCmWd+HMrk0=;
 b=ccCI1JWrCIhkPbClBjtj+F5PXf7WCagAlzReCdLtNkKdSeo/PC4anoO2HfRqu6UWPV7t8qA6X+bFdv6frRzAhQ9QEvuCZoXXn+hFVguUudAFeo7uB5oRADRjVyF18SCW1EMmjSStmlfJtMQUAlFpOra1EPoSlEKOu3ipNfyjdg+fUG2QEgQKzpNth5B/0apR8B3ofl4bsRIw6mk+AnRLj7yk2cKI3yN4htM0elE0uEu6UfPKbn0drHWJbCeKYPVy0nNcKo6Knu5wBvdT4W2UISIufsG2tW8PxzWa7pkxTTNXlH6LwFca6iZClMbX2OIpJRn0XAVBL4OzPwMRw4YuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xK9QuciZD3bIE5z9vrb6bf25cs0xqPZ1iCmWd+HMrk0=;
 b=F9S9r0NB1ZJyDnqEXtPnbVEbd+Q2cK5Lcn9ofbf0bdEi/bkX19JP18knxmznX2oY0Q0jXhKTLZnJVjche+iuTn1vcL4Xomybwy9032tGNGeV+qoUqxb6hl5/Fwqk36eZDXte7tHs+/AuvURHWFz/FtagedOc4j63XnKtCNHFy7qVclDGx6szUAW92p4nXdguSvRFbpznJs1aTOoVwvj8OTczuei+1hL8PPonO0NXEML3OwRxMeF0Hw7eps25fCWmwpdPqK0AFAsBXG8l+c5XiOsEdCPZrEvrT+1Z1P1MrHLCoKU7BPj1Q+uRqcJHm/RoVC8/yQWl0tXG+XV/x2J6yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:28:33 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:28:33 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v5 01/13] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set
 "media_disp2_pix" clock rate to 70MHz
Date: Mon,  4 Nov 2024 11:27:54 +0800
Message-Id: <20241104032806.611890-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104032806.611890-1-victor.liu@nxp.com>
References: <20241104032806.611890-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8f2ebf-1ee6-4ac0-dd60-08dcfc80c2dd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m0dv3yPBRBSGBtzZUFeJlgZznAaqQLq67QRn2iSF6HFjwCHhssp+ptprLktK?=
 =?us-ascii?Q?ivlZ4zyx5/9DUvseAU4mUrZaUJ1Axw7rvzuxaNOMYXFMnJZH1txvgKE4XcIQ?=
 =?us-ascii?Q?gr3CvvXiL8YHNeiBtwI8xKKP5amus4cRFF09dPSP1ZHKui2XVkBqyhhRl5Hj?=
 =?us-ascii?Q?clRFkHOUk6tXY0OFQsbAJsg9B/OPqB8ffQwb8FsbMcgqaMzi9i0neStE6VCo?=
 =?us-ascii?Q?mnV1zXEzBzkWGJT/TQ8sP16ljXKIT27KeadZ0EZQWS/TSmbAEBoAc651ncQT?=
 =?us-ascii?Q?fIYDclPJi1MWiz+3+T/kJscIa8lHacT54f899xy2C41mYByLmWeszx2o8oP8?=
 =?us-ascii?Q?yDBB99okwzTcAzudSAYdVqJVI2aK12I+d87LQtrLuk69jO5Mr76LmxTB9suU?=
 =?us-ascii?Q?PuhyJPISLXYTOK/8l+MRhsxKX6p2u09X/haZxsxk6WQS9E3OmyiKzkFQNAau?=
 =?us-ascii?Q?g4Q2ijojNa3VP+nls1cQsysVygDJJIqtx4bqEpzTI/1C9yvkkUAlUPFg1EC3?=
 =?us-ascii?Q?nOMLUzgpfIZ4c3C3AZaqG4MzlURVGfAq1YwJk2Fb5k5ie3MBHxiBo7LGwr9A?=
 =?us-ascii?Q?fqPZg0rljmHk1ZzK6eQ+bal3owa26O304s6wq4TIomTsv6AU6UD3wCBoA0yz?=
 =?us-ascii?Q?ynWdKMuA8Zpy/dTWYDocUNqAb71XsEb3f3QhJ+4m1HqLT7GPSnXs9BXYqow8?=
 =?us-ascii?Q?ZLF/DmCIp4k7fFYCr4T2mawwc0M5wFwgn+cWBN2iE4wzJMSuAzWU5zz0tx3G?=
 =?us-ascii?Q?FFitfhQispgKEt2D16v7zTdUUZqsKsd+K2uEa5u/vL0km3ivyzrV0/4h+M8I?=
 =?us-ascii?Q?hevJfcTPGFkBomQ7vJDMhYkaGBhBJ3phmgSv93Vl51Ke4kHZkhkU5CQg2UOg?=
 =?us-ascii?Q?ASGETpQ8/tixYAHwOZePM2evBnwm/nZzR2w0ZNFKPsFo7aQbrH0DG2Z/Mf5i?=
 =?us-ascii?Q?rNeQjyVmo4X2JC2JLcgwvLz45Xsdpr3uYo7aGkwEP/1LvXP6UxUhOzelgscF?=
 =?us-ascii?Q?zPb/eZnYpckZDxJAN5fIrJoKt6tGXCBzidcoSj0A0jvlAkzlUWb55+Z5Y1/O?=
 =?us-ascii?Q?Ick7YXDPDn6ifQjEuG3iBTFZmE79+Ke9Rj0o5JHyg2RU2m/lclmi2GagZNEf?=
 =?us-ascii?Q?lCqBAMYwVZr5otL7mS7UvaIu4ZpGOZe/IjqXePJUpq8ykGddlB2jJEkzm+eh?=
 =?us-ascii?Q?1+HcG1uVhyILk95XBWC8Q+dehKwFoUvwse2rJ2/TniA/JGehkSj93FD/aRZ/?=
 =?us-ascii?Q?09g2YI7lPndpdlYDEIW5viIH/k9HLkJKhAX4FfUdMpxshtKtK1dN1U5xP4Hb?=
 =?us-ascii?Q?Ydvsg31CabGqQU5bUM4X9QF4t4tL707xkT98iCmTb9QTwkGaIPMvXZKZHEOq?=
 =?us-ascii?Q?Nmv38Mw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RHQ+EUWJv0XQxhJt5AUSa7VCcq7v4CWheFAqbTkrIbSzSepC9SvS3Q6bNCli?=
 =?us-ascii?Q?zwNYkxdnT2d56+WKAVyz1jj4vc6dRim05AuhfqiGvboteb3aj4gPZVxGPX3E?=
 =?us-ascii?Q?nYe5L9d8joNAwfQoNFR1zLpExkdi3fO+IOCJaWRuIIJHzKWws+8u8A+ayxk3?=
 =?us-ascii?Q?Ywc0hTnOfDz/mZjnIYYVtq2aPwOw2r6/iMvJY5ZREs9sOvD1m2YECKCA89Ij?=
 =?us-ascii?Q?ITlvoTfBy92Je2rpeXDxnevlLOf/rQk1UvFbcQUYJqKNX5DypW+AiAYRO5ml?=
 =?us-ascii?Q?Veid5ZU6zSTtm/hW0E+A+BmBd/rvKVToWjdzMPh4qLQx2uYyunRu85ghT8gh?=
 =?us-ascii?Q?1h7HXMRFqgI0PKPUHi+iGMZ5PpQWAXDXCyIAyn5j6bwlZ6q4ylf023wTvFbt?=
 =?us-ascii?Q?X7SaaEpij0q8hNrG+PDNJz+fijP5yYM5h/0sDNiQoj5pErD1aI6jTH/nSB3k?=
 =?us-ascii?Q?4GZbO33OXaYGHY5TiRv8KRDICx+2J2Vz4wU9OAqySh++iA1zcgLNvSwQRGOU?=
 =?us-ascii?Q?/iVmx9bP9rKzoDLMHHhTjbY3NPVk9U0tsKw9bhEayElR75wyBNOR+5T/r1vq?=
 =?us-ascii?Q?c9+T3DQL0XOMX4OMzsA2fkGHCGwND9jgzn17Mzwn9sGkx1aOjnesG1QelSVN?=
 =?us-ascii?Q?LBiPKmwuxT3MvrRfQMbVuX6qcqr5O5S5gOL3x5vyxfaBxrnp+lqFAXoYvL4p?=
 =?us-ascii?Q?8HQxxT7lqZNfSoUAU5wuBPCarAgPOLQfTDEwW+T5EIkcd2ShRJSGGPGdyiSr?=
 =?us-ascii?Q?fUC+mMWgZh9M5FB+ZNZoS3YmoVmemcEjUemUcjyaXVPhnLQIuWz4SGM95obf?=
 =?us-ascii?Q?AqR8jxhUAbi2l0/2aRNZv7M6aPPidy7zuXVLhCsJ1yoWhRhyibPookGgIGC3?=
 =?us-ascii?Q?Km7mmProfsFk2tzZQMTTVGE4Rr9cRpj5KtJ7ZghHqmM4mi8GpqwBg0zCLokr?=
 =?us-ascii?Q?cORYz4LfhCVIPFJTSavfmMeb0LULbX8rzleqktr8QwFu5xH2ydH1XrajUdBR?=
 =?us-ascii?Q?NH2ZTsl1GcDYtthpXQ7g/ZnyhEix5k7af2+aT5QNoMqQQPlKRoUG/lwizDDx?=
 =?us-ascii?Q?a2A20zFrpICv1vPU5zGVjMTnygZ0ocrImxl4rfyQ7xF7UbsEOGaSjqfXQBNe?=
 =?us-ascii?Q?pAci19Jmj1BzoXt66TMrJ/MLuj6MZxmmZ68NZ4HE1Eel3MBXyZDeCyPbtnaY?=
 =?us-ascii?Q?BN/fl4pGEI0nSZ5sjTcL7SgClNZnkImw4Sd8q9SDnoKg6sSm2JmxgiYCTdiL?=
 =?us-ascii?Q?3m6A4FbJRQY4BKgAhfdrXMWB4rocjmBA+v6EsJydjDqy4YVqrukQ9FgqxG47?=
 =?us-ascii?Q?fd0JgU5UYWaXjHemztjW+tqM7lLYztg0txIYP7P6RdJpNyLPNF0yy8MaWYju?=
 =?us-ascii?Q?PKEiGyM4cGtuV2QfDH6ydRvsjbkcdJHWXbo6DYc0g9J4XYedCCn+3QvKpGVl?=
 =?us-ascii?Q?4aOYpyuRpCRqIumFQ+5Qic1tVeFNSQIDIGcrymtN/gBp0Oqm4s9ez/pNyADr?=
 =?us-ascii?Q?k0k3JkRFUklsUQAQQ+R84h+/3G2xLksXAYe61A60K3qQImSCZMi9LxAZKFwc?=
 =?us-ascii?Q?SUPHIttCZ7xMlQF3itT0PS+FNsgIMMOH++gcejNF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8f2ebf-1ee6-4ac0-dd60-08dcfc80c2dd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:28:33.7547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d3XsKJj/oe1nwK0TjhuR2TY47z90EaT3Si3ZJtaG+zmXJvXC4gaeAbPRhjwAioQ0ic9NC7dEzY/db46dQlp0kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602
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

The LVDS panel "multi-inno,mi1010ait-1cp" used on this platform has
a typical pixel clock rate of 70MHz.  Set "media_disp2_pix" clock rate
to that rate, instead of the original 68.9MHz.  The LVDS serial clock
is controlled by "media_ldb" clock.  It should run at 490MHz(7-fold the
pixel clock rate due to single LVDS link).  Set "video_pll1" clock rate
and "media_ldb" to 490MHz to achieve that.

This should be able to suppress this LDB driver warning:
[   17.206644] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (70000000 Hz) does not match requested LVDS clock: 490000000 Hz

This also makes the display mode used by the panel pass mode validation
against pixel clock rate and "media_ldb" clock rate in a certain display
driver.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* No change.

v4:
* No change.

v3:
* New patch.

 .../dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
index 30962922b361..2c75da5f064f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
@@ -52,7 +52,7 @@ &lcdif2 {
 
 &lvds_bridge {
 	/* IMX8MP_CLK_MEDIA_LDB = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
-	assigned-clock-rates = <482300000>;
+	assigned-clock-rates = <490000000>;
 	status = "okay";
 
 	ports {
@@ -70,10 +70,10 @@ &media_blk_ctrl {
 	 */
 	assigned-clock-rates = <500000000>, <200000000>, <0>,
 		/* IMX8MP_CLK_MEDIA_DISP2_PIX = pixelclk of lvds panel */
-		<68900000>,
+		<70000000>,
 		<500000000>,
-		/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_LDB * 2 */
-		<964600000>;
+		/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_LDB */
+		<490000000>;
 };
 
 &pwm4 {
-- 
2.34.1

