Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65259B22CF
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 03:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F3610E310;
	Mon, 28 Oct 2024 02:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Hc+yp6EB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062.outbound.protection.outlook.com [40.107.104.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BAF10E310
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 02:38:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuGidjX492DCgy5OhsSvC0UdfdprYbXWe6jSzk9BOHsUC0fe2093gl8/7sbbCBmu4sQukyhjfgxX/GyxyGoaDxXH9ssldm8p9/0EW7pUsA42TcwOXgM27i2Cg06GHsL3X4zhF92hhlVFpy6dboqoSLtIGHY63pBcLPuU0O5ERDGVgNruIzTLathzChRBhB307KE2Er7Bq1PscwfoZZB2yQNEtPzRsfFjAkTdqZQY019p0Wl6/wiRz+7S/gqyGDn9BHam7yOMY8yyFdWDy/GCb9UlwnUvn0FhIsrEyw/j8tluV+CX3SE+jc64hwObXP161D0WL0wm5tOPMwm7fZaTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5MlxF+iOvQYNaGKgfap1AYx0PBdE+afeQkEdLBjw/k=;
 b=C4v8otplVPWr+xtdXeyb6STBOapqAuToClEjwlVzP9J/Vm0lkme2UJWIpt/0IsmIVe/fWqICKjB7N7+PkIM7iTArxgk9ZRzIWoHo9n4CCFF+v+aU5SdDlqsXg4HrwcjF5fr0Ycl8GhU23dwVmdPA8xcBM4yY/IyMEezS+f4EQhuG2gDeBVE/BBR22nyJLSY5AGnLcLnqQipK5H8/9yN2Qgj7vhz/LMXJtVw52hf3QdPzdjOLXVeHRkuG64scGkUDJA46oiq1VbjNjCzj5zrGqesYcZohyJYbYrLOpyoHSY68F3wnG9LFbDgtKtZEOJRdrcRtOemfsdAi1MjnbJZ3PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5MlxF+iOvQYNaGKgfap1AYx0PBdE+afeQkEdLBjw/k=;
 b=Hc+yp6EB9GqnCUoCz5Ya/BnwSdRH1BmdOFSccBCErbV/YGgrQKTbGgclvGDTaoaJ2BVxLpbRMHt+w6+U8Mld5u4z+cSK1K01Tvc/TZxtS3nVY/L1g8mfl93BFqh6Wy1IQci4D/5PlNqrDo0oH+R7NMovKXQ3zVJsQU9Z8YQ/Ve6+Wt77cx+POJ6UnpSrcoT9G/QcD2d93zeZzv3sh9C8Ykhk/FQdugudKjAwQdVFtjqbR9ibQHIGBzfV3P5iE2lQPsPXRBGGld7KMQh51ZEY3pfw9t6Lg+imySFXMiNfIMCSnaU03TZMDPcSb9HiR+IHwHWtke5xIqoxJ4LFQuAjqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 28 Oct
 2024 02:37:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 02:37:55 +0000
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
Subject: [PATCH v4 01/13] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set
 "media_disp2_pix" clock rate to 70MHz
Date: Mon, 28 Oct 2024 10:37:28 +0800
Message-Id: <20241028023740.19732-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028023740.19732-1-victor.liu@nxp.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8709:EE_
X-MS-Office365-Filtering-Correlation-Id: f454bb6a-cee3-45f2-2968-08dcf6f98736
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|376014|7416014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+YM2LQ2m3j9KuHpFHI2aWBzRFvmf1M4OGTuagDjyJSEp2f12nk84lx8JEsIa?=
 =?us-ascii?Q?Lla3AaFZarHWNv2iOC5VcdDrv57nie40/q7OyhdvcFNynubryR/ctQEUJtiN?=
 =?us-ascii?Q?8ftzwwjOB56Udu16Z5HFMGGXtioYT2JSRARPm8clc61pu0N+PPyECT0Z4t8X?=
 =?us-ascii?Q?qcyYYV1ouqAkokEWENtQAFT1IO8LPUxFty/aaDgyHklzNfRHRihWfEiZFgCJ?=
 =?us-ascii?Q?x5NpIu8Q1SPzNxRlLjN8xiMTRVKHgXN2crg12bcWHEXS00UwkDomQhmNQQ92?=
 =?us-ascii?Q?fi6sRFAZflwg+3qtFl9GGNBVKfFbBlua61JobBw9s1morH4oHhMj9y9rHb6C?=
 =?us-ascii?Q?Bk6JNHj1Ci4ss/Ukzlc+prEQoq5//rPP9FyWyiv8DphFUaknnxwk8J3g674d?=
 =?us-ascii?Q?tGtr/ktAOIazsRVGqWQrN+h49YILHuJnuzOirXkenC14m7ez+ve2GZtHQE31?=
 =?us-ascii?Q?ln/5VRW9ZgvxjRaJEJm536dy1cO7L/sLEeqjuB1C8NFaG1EJUEHhRCdw48MI?=
 =?us-ascii?Q?lbmbgoMJHGDwrSffvev9zJjbDcWqZm9CKC1wVTa9TA1PxazdGFiTLN7Nof2f?=
 =?us-ascii?Q?oq6e6IGPmPQYN3EUmeKQlK5QHCBiz4O+TJwctYtYZJnlbmSiSG89hdy3ARb9?=
 =?us-ascii?Q?C+nZfRW4Kpo4reCJ2JNFYSDmvGIwVAP/VjwX0cLjaHxi/Bz4QZxxXW95VWwA?=
 =?us-ascii?Q?+5w62VWdU0H9glqZrIkvAdlduz6tXlv2KcUquSJ5MDQRl4+k707aS6GX6Df8?=
 =?us-ascii?Q?D5XD83pVeMht6iBSUuA2QpcUnHl9M798aUCoiICVRRi1Bo31aB7GmCdSx+ti?=
 =?us-ascii?Q?8nICS8dZy5Sav2+RqWWqN0y8Nj+VlZX8ZytVdiybxHaYYo7cbc4VqWehwdVh?=
 =?us-ascii?Q?1mokGMyc/bpiOzjcE9PCC+bcnV/C19Y9t/ZC+YTJu0Bpw3yDBwmuqv1HIISN?=
 =?us-ascii?Q?HgCdVEmU+E3VDLIpY2icPRpddMvqxlbXk9mqcM9tvB8DtbMsE5laHpLw18rj?=
 =?us-ascii?Q?KXUTznod/8hBdEhwlsGaelt+C2CBWwaHMYbSm/zMPGm5sPTeTqxEkMJwiXn3?=
 =?us-ascii?Q?3hzZBonnM1Lq/MFPL8M8Z2k95HugB0q44gGdusLDl8SvJK1eyrNfj0ds8Gt6?=
 =?us-ascii?Q?TXbEVTcKnCCUfnLzHKgavch6y045GTfJK89P+tVrSpX0SXF92Htt6lE0H9xN?=
 =?us-ascii?Q?cmGFGHQXGzPX4hF5quUvtIqSLighvEgOaQBvZXeWW8OqC6R3EyflVYLIDIBD?=
 =?us-ascii?Q?aVw86ViMtu9BusKPpOdkEhKwpsJYTnYIu9U0A3bhnjW5mffSemlMviaryBAq?=
 =?us-ascii?Q?TAJck9hMalAcP/vR2r8QxMpg5r+sLUKj30XLpgmDHSBDf1zHlDYg4ti9Qrh2?=
 =?us-ascii?Q?CZB31N0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(376014)(7416014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?37NlHQhFS26Vmhye5UtUJnary9SlEll9pTSSfFjQ9VKyNgtz8SbNKKGt1/DC?=
 =?us-ascii?Q?bVhV0t3GL/VQn9ubttoEg0VmRthR/Bd8S0cH8D6lVeVjNTLELLBRrWAYXLPB?=
 =?us-ascii?Q?VtA8csZRjabaJYbRd/WRZ49YFZkP02tmjaXgQ34l3HLHg4myGYJ7MjJwJTxA?=
 =?us-ascii?Q?R7AGKS1njTkHGw92U632Od58YuOxFeqm2Usyb+NzwiD9mOMx1ItT/0Y4zhxK?=
 =?us-ascii?Q?0PYMw6fELrQaTDWCyYByCoWa7kfGWoLiruP5ASC8aCoK2u6+2aPKGB+WeANR?=
 =?us-ascii?Q?Z0CHACIYdiThh/KuEzVMSAINKkbmni7RzP3NVozWpO3YoUlkS97r1SaPtwGY?=
 =?us-ascii?Q?VyMP6RnzGuz2Ohih8llW/x3vKLGaeVmCEIN8++h1fGCQV+FMA2hLNM8KyeyP?=
 =?us-ascii?Q?RWsbB2Bh4GUic2kBPkJvHxpeN/n5rW/mm5YPxP9AgNjmonwvSoD5bOGimZZ0?=
 =?us-ascii?Q?WdjE52eDoX+UC6E494bKaNeSFabHwd7Lf6FrSrTz4PSoQOcZXl5GQ/ykmsUp?=
 =?us-ascii?Q?ebApX1JgLQeL4feIir3xHhb04I5n4gWwhMuA2W3XMz7RMeTD7tvzM1Ip7qfu?=
 =?us-ascii?Q?zkQqgmsPQvdkLXSIrxLVSKq73+Yw8736xb6vA4UPXP79Xlj41zS/estMUkRo?=
 =?us-ascii?Q?Cl1Vxk/go6cRXVix01Fnmk1QpHOe965c3soTkfjYRK8mdhmZvZ/y0jplDHfU?=
 =?us-ascii?Q?nWzVIrz66iC85/HLYjM2Y47UA9JQ69AilFChLCxApo1hU1PwiyuSFQUeGR+S?=
 =?us-ascii?Q?xiNPRrmFQXobF/14XSaX3Jaod9hu9DtGcGci+sRCarH5JoVnfykgA/z8+mH0?=
 =?us-ascii?Q?ZpQ8Cga8ulRakSwQr9F63xjAM0Fh1d7i1obT/XF09wU/hxZDnbwgvs6KWyHg?=
 =?us-ascii?Q?dj6xcwroUHKUY7Hvfa9vpQ2opQ8jeKoWD40Rf2SWHy+lR4LVLlXTWcnAEUq8?=
 =?us-ascii?Q?sSY3t0u0ornu4jkYacQQt8WA7aWQ57b6J8vV26eFHeLNGjS76FGkycTajzXQ?=
 =?us-ascii?Q?eg54FJlknBpqrWekiC/GuEQpKhRGEQmpBeUoVBv6Fiqk+YjzPTcFkbkNstuz?=
 =?us-ascii?Q?gy74oWC0rTrlbvgU8b8uGBXi1+YHxUp6U8erUCS5sTBkhGYYmAYoJUdoCYEL?=
 =?us-ascii?Q?1RHXYMnOH1WMRjbYRyM0iGv4Dh4/rEAc6VzaUn2tqxmzRCKxC+cGe17XfFXi?=
 =?us-ascii?Q?6qbw6XABYT9f1MKgHmxNZEabBUBdme4FdrqYUymc7VEDu0XbZ+ctBm/ZpB98?=
 =?us-ascii?Q?f9ejkkCzsjYuBNDjuM6o2fDzNrwlE49XjPvqFlbN/tAfqBKz7e1zm7ZQkCDu?=
 =?us-ascii?Q?WS+5nOb4bjaMh9aXpZ4Z16qu2jOvYJo9iXSKc/TBZy64GDKtRQAkAy5869RF?=
 =?us-ascii?Q?UOLKl0/svJi+44vIXDtjBARB1BZ43RxyvwDhxNcR/s5wSoetr8IAR7d/wWLz?=
 =?us-ascii?Q?Nm3ga5cLqeXRg/qdqKWo8NIIUQVYvQ+F6GFOukzEbFm4+5t8pNExMgYVYzNi?=
 =?us-ascii?Q?CU2Ly7kD3QgMgZR+qX1CuH1lugKjltTkq6jnEnazHiN2vnBgUjvZQs/Hwl+N?=
 =?us-ascii?Q?Gfxx6kjBoGJnHqIfbEXkKzuniacebiUIm33LOj4j?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f454bb6a-cee3-45f2-2968-08dcf6f98736
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 02:37:55.8163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lf1231Aze39Pz7TGpBd2YUz6oJdt/XoBI5VxDFZWQGONi1+TUM+GsQzZWSGePEZ6i1Pwafe3CAFeRW5NE+Mp4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709
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

