Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0BD9C52A8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 11:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E70C10E5A2;
	Tue, 12 Nov 2024 10:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="MKy3iYus";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BCB10E5A8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 10:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POMjIveUCSH2q51lrwnvpTw3KjcvDALzd6WZeymFmohL3jhnqWDqKNG726vfJ18b3wx/WrW/dsOkX4URMCWlVTg0ScsmyARTaM7KREhfPAlckcHVp6hFZbYTcM0N5eosFMplchAwAZgDXUne3sBBTPiPsNl2XeM3plZ38AxLx9yoLjrQ9IZi6CYjvlPFZFufyy9ymc01p3LoocStID+m+/il37jQHG0byymtTWdJ78N91F8NVKzxTNxGg80LBC5xVdUHZYGS/fDScrX9oQsSXqyiQX16oiFEahTDilE95PXK3GqU3KYkQ7tzxMwyU4rixbdyN7Rqqhz9tm0lEV/TMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KtOlUGMPti2KXux/yOWTORdOt+SidR8q0ovrN+aSmw=;
 b=UIxu3QZdChdEUQJM/lrBljn4hyZCYOIUyKsS7bRFiY5KSnNhxO7dTF4vog5MRZxZ7JRYq7MuCM27SkJxz8uTrWM+mJsBBwElVmPOVPzrSmgRdZWLU+cQaWYq2s5xJZj1ZkDpTS6oglOaqnGbQmCAXsjgGk/TAoa9ZwdSYy/yO+RITNxWD4N2cqVyQC2at3B/ibAxgETNmFy/M4nTCKqrIsg4kzXETuUrwfOycv2YjlV5JkwUSw4qUQxcx7Uq+1UK4R4n32fsa/GI5nBqCXY/P2IQYXpAcRgSgOWmNXTPZF5J4+mJ+Bea0UYdNUYQxlTdchfoQyp3JXtpmI0H+XuZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KtOlUGMPti2KXux/yOWTORdOt+SidR8q0ovrN+aSmw=;
 b=MKy3iYuscugUYAZkuGsTlodicNP3kzJdnWK6ABSFMhOPIGeuSx97E14aZYXvypkX760tLGX/watMJ4qDhYH04XQxbXJl4pFIvj0TUoQYEXdjb8EmHYFMBLCwmqfkHfGpFKHN0S0MAvEb9TWBk2mBKydZoZrGej7AcPVp+e9NDR5ZF1yuPJ2cAczO4NJKUzpAieL/Aw7qMUY+DX+rH5GsFfaM6LaIL6qqptcQkMcXcg3TU+VXU+iPdV2GqO77GeK7fYIQoHkYj+OfhOKQVSg9eaQGcUdAMm9A06y7byxiQQI1TZMNcw8sva63QQX/2NSfyHqq3dUuJYYNLfXwAnwzjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8256.eurprd04.prod.outlook.com (2603:10a6:102:1c6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 10:05:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:05:54 +0000
From: Liu Ying <victor.liu@nxp.com>
To: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
Subject: [PATCH v6 1/7] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set
 "media_disp2_pix" clock rate to 70MHz
Date: Tue, 12 Nov 2024 18:05:41 +0800
Message-Id: <20241112100547.2908497-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112100547.2908497-1-victor.liu@nxp.com>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:3:18::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: f477ad38-a8ef-4793-3225-08dd03019807
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wyXcZKUGJ5Dy5PsmDokaYAb4A5lob0cArqfIMepRRiVTLUcYIJZdhfyzmko1?=
 =?us-ascii?Q?3u28WwXZssFLXr7bsCjXR7vjnN6Q0FnrsarC1sD+YoncQKybqcfe2phM32rM?=
 =?us-ascii?Q?Io4tbXUjwcgstNqmfKG0OjKiqwuka2B80wKxorwg+G0VC+1GKBBcEHDy6iXZ?=
 =?us-ascii?Q?lybqZGVWiDSg9bLYPNvUi5zR+IW5CHn/HhTCCQoYAHfPX8kO5xLLzmtdijz4?=
 =?us-ascii?Q?83Q5DTPxSgSCbMvi5o8ARkJIzf572gZgsi8AplZAcfO7FZdKHKyLDpAwsyhO?=
 =?us-ascii?Q?revdO/42KO6Z5BWbFqVjos0Oilm1dkM56f3lh6uAqQcJU8qv5TF6SEQoVvnh?=
 =?us-ascii?Q?1K9Ec6zBjmdGICEM5b2W3kNN/FdAqV9JIYU9PUMH/MY/kODJXHgCFice2JzW?=
 =?us-ascii?Q?5H4vRVUimjdS4qTG5J6EJ83A/PAegdynObgUPCQorit2+cJyuYRrGbnCH0+7?=
 =?us-ascii?Q?YMoQx6Xj0b4AV+FeDmiRmdjUD3L3jzFyeIpP8Z29TiF1d1sMD1U3n0ddv+ds?=
 =?us-ascii?Q?DME8fVO4ab68Q4ioVM5D51piFmeD+rOya61JuofPbn7585s6Vng5Gqa0j1xf?=
 =?us-ascii?Q?phIgg4J7rcyvtqRKc4g48T98NFltg/bLDdwzaQzGkj0ZYx2s194a5lEzQTQb?=
 =?us-ascii?Q?bRD1T1sl95s2bGzSQcBR6ayc599WlFROY6dTAReP+80JLIh0isjcBjkPRHVG?=
 =?us-ascii?Q?o/Novtm2vvSXpTTvxPJs3xMbj4mkdq+kOYVvfYyofzqN4r0r7mrBL0aiTugd?=
 =?us-ascii?Q?+gVm1t/8vIVy96i6bXc7bDznH7oLXva86KZY9FuOaCGAtb3XOYlW9i50xzQW?=
 =?us-ascii?Q?eAh0Kt557V/pCnk9mGZAOTIbvQ+8dwWKjT6XemUiaBXcm99gj98E93VpuOQI?=
 =?us-ascii?Q?3sybBKExN+sexKPjsB3+K+9DiCO0wC0h8R0568sRiCDBXk5htcxHiSyw2Xul?=
 =?us-ascii?Q?zYmkWKf6MdYGZSmRN4fg2wOC2EQcUdQG6UOEMVi/Io6dl1wzPse10j9/4Z3Y?=
 =?us-ascii?Q?evDiesBbWF6cYb9XYsorTGhgC1lHIr9kKZMCEhNoB0K33bbYqF14b9A3OnCY?=
 =?us-ascii?Q?1G4Rxe7BCWpt5aqW1FCfDiUPOjFQdF/HKKjyynph5lQWriUwEatxj1DoRvnn?=
 =?us-ascii?Q?Ms3mn0888q2bAE+me8wh7djfFQ2yj+hWVth+BXWwBTPL1xwuXf+MBLV+9tRV?=
 =?us-ascii?Q?H5AASKiacDO5I4Xzi3NT9A4OKqNimhzZsSYXFY4QxgLKZjn7PZhAUSB5rv0u?=
 =?us-ascii?Q?sfulJLs1Y3FGQbn4x/75v633tWkWqFnPJRyIuVwl5GA0YhVoemvUFYVOGnc/?=
 =?us-ascii?Q?m8mCx1eyJcXagjDcBetHjkmtzQm1/wuPyPR/LDJpVUcyboVn3o5MQyK/4M18?=
 =?us-ascii?Q?TR/v3Rs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9sBdl5aKLfYUEgMEqgFdrWLhrI7OtgDRzztii0QR4O87MozXaRskmJUJDpri?=
 =?us-ascii?Q?ZhdymJYRlIon0QP059fWAoegjroW7JFGnK1q36kV/wyiC1akSgu5K1GNBXxW?=
 =?us-ascii?Q?mt8VI19WKNecyUlvxnYLfaZhxQyvtmgzeERjK8i2vMkn5/C+1aTj7bDISlEG?=
 =?us-ascii?Q?rHQPw//ysag7RdtsZ/NsHZfmkPbVbyVJhhhahMbDYo5GXNPk869iLGLyo9P9?=
 =?us-ascii?Q?+1qwlgpF9oOLUdhMPTo3FYQpPdSCmfbj7NS8oL0SEDtCes0nOpHXFek2gP7r?=
 =?us-ascii?Q?OQkblLVb49cKUvmx7copir4yqE+bcCLSpVECB7PppD/T/gzOns8RSnchHS3U?=
 =?us-ascii?Q?tBGoL6P26/rpp6P/M4EJoqaXXv4QdAisBGq0Xsm2a1tAuY2SesOe0Y2bllsq?=
 =?us-ascii?Q?DdBk04VTtZmQDmC/OdpiTLpwRcSKLlUVPfQq1mHm+1IvrMaOKcD98oftkPr5?=
 =?us-ascii?Q?kYOuCKohKuKNu9LeY1rMBM8eGnOJMIVUgxBA9wvQGo6w48s8dqxtmqz5HN2E?=
 =?us-ascii?Q?5Qt+Vfpqiw1n6s9V19AN3WIo5VIR/E3Cy2pQqFMCsKABHq2ZmZ4zHj4pUANB?=
 =?us-ascii?Q?HQqysbkwLsArDYANiQDxUO0PWOHBdjt7wxOPN3OBmDvOVV9GjMxqS9+Kol/J?=
 =?us-ascii?Q?04mF4cPf1DZSVXIzJ9J4X4WkCFzOUWOk0vHB6c49nNj6J/6eefgmucIscr4p?=
 =?us-ascii?Q?DCTnWMIIpaUbzVIv8F5XnCgpPhrRRVEo30VtoVgQDIQ1T45MNqIhyhHaFKIr?=
 =?us-ascii?Q?ueDwji0clO4oE8FGvPDSZUojLllu3ICNgx61MuYTkoWrDguCn+fky3y7gsY/?=
 =?us-ascii?Q?12PCzp64sDqlQmjV7LvSxqV6S5MAfWSoCvwYptItLT4LEI+6D05Ob2VG19BR?=
 =?us-ascii?Q?TELGkjAOqTBJtn4tKZGdA8YuMR7h4GWEbdmEZ28YK8ZvXhz3Hytjx3DePX9A?=
 =?us-ascii?Q?kmNjbCCXkYLgOwj8/2MQnkE49ALuXfENTCe3alqzSfOeR/gBy/9kr4Dwv5rP?=
 =?us-ascii?Q?aM46/wuvjoZxnCLcpdwx+pXuSCCZsXuiXRfWUw6dQ5AXuRL3eVNbN1wH/LhK?=
 =?us-ascii?Q?9xDYjgTqTWkCQd60pDJKYUbjAmqSxeYYXe1oGfVEj/JN1BZrIGxz8rcpcMSP?=
 =?us-ascii?Q?D95V7+zZXcuDpynCb1j4PN+aBNPyJymfJFs3+AqCMzJTDM0UPJeASRwNukpy?=
 =?us-ascii?Q?FisL2fzd+8DDTG073U69jyFpelAUYpZ2XcUb8iuH0iicQxb7jry2ODNkRXrj?=
 =?us-ascii?Q?0OWb2h3tAQkLbXM+S2fl7b38KJOiXghGpuHTU6QRRc1AD/AA2QhsduFvSk+C?=
 =?us-ascii?Q?f9CHe5Pvx/jNbdxNcVoVPVaYH69RpnipWCAG8Qr51uv1Uds9XihcgqTy1ONK?=
 =?us-ascii?Q?CVLyc9ef2NwrBnixcpfi5Pb0FU+4b+/vLRyrwbze+/OSbT0GsWDWdIH5o4wP?=
 =?us-ascii?Q?VfHUecqZ/5DGCfBSb8boQl3P8fLiSV5UD7WnlHyy7bYVw3Woa7dHU43q3gK9?=
 =?us-ascii?Q?G9SQItFLNF9bqFnwdH4gOBbdbpLlkTezaaNHjDbIcdGbfHISAqxjU3na4OgC?=
 =?us-ascii?Q?pSW1+ma+VPxFBzjYF3lbJdP6aq5EWR9pjHtvLMSy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f477ad38-a8ef-4793-3225-08dd03019807
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:05:53.9985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlZGL78HDRb7ON8TOJhrCsBq3hfUOLNqNgijZus3TniQj+O+IJCJxdlNTb686nj9MZ0Ya+z9wCNPVfiR5WwHVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8256
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
v6:
* No change.

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

