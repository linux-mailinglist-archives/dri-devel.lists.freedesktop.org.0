Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8A19C836D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 07:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADE910E7A1;
	Thu, 14 Nov 2024 06:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="d+SZS1hT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52E010E7A0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 06:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbXtoPQWL9Mbn3UX/vBv4JCYbKy0tZvDBkcg6ZankbA4WeQyIPXwGf1XBau2rB3uNhN7TBB1tQfp1RZZlHcYbD4BTJGAhHDNUOcP3/Nv00r2EYhYTq0T4OsIe1fZ1CTF7hGf92pxGtefWsCKlwP1l6aDZx8Hvom+TC0OJpkZHMmh33Her71yEWVNKAkek2TGZLPxfsAzvTOOJEOYRxdFzEF+j/RzQTcVLtIXzeils76Ytw4KsSIUpxSdtdWBpjJA9AupOsmtk6KZMk9XkVMs2auIkaj4iM22fIp7S3vivfWoxNFkalL0bZz40IYJDroDSHJfDJLTTwdAFq+tTlezng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRynxFW9aNZQni5CG0EFRzQH66e0Aj08vs5GffqmRC8=;
 b=oMNmAdokxkAjMocjAaPrgHEm0WTgiIweULjSm3Mk6Zcm26mHu00ereKqOQuhgWlIrd9AdmikyTJc9+Cg/djUb6JKtSoPC1P9bJBMfDF5EHywYOUb5bPa216cRE4NBEx8VffiTher62NUafLg3G3fOC5dm6Zt7N81lO0FIyBvgaVqNcm7c8EZbFcleOop2vnA71b7H5TemjohHx5Ya7B7P6wI5dzeSF9lZbbvAZOJ3HzKrwDoUEWx7IVAN8g/6yswBa4VAddtNwFvBilYukrOtVyaq1bjQa5KRTGuOWmOLgUWjh7Kwbq209M0ue7gme9FxihiqhLUeDB26K8eUq0r3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRynxFW9aNZQni5CG0EFRzQH66e0Aj08vs5GffqmRC8=;
 b=d+SZS1hTvGYGEYobzErRfVJsoVMFzTkPMFfoRXMdXnIQUVxKaqnq62GK9I0CAAzaMnJ+17gi0gZ0BdQe+T/B6RL1HvswCf8LhMWRdZKV2oq99DKdVqYE/oeKNLmEiAP99EQRmXBWYEjrNnZy+rJeGuO1Z4/v3qj6TkoQ/b+Cy5if4iKGN66fPGFA9pHk1AR/2jb28nYmayggHbeuv7lH/lc2WI3sRT5Y5YE2bg1hKY/p2KRdl/1rE2GUlQ6bJmoAggVNTwuXC1IgAAwbvk6wdw6Q4/e7CjH5IrQwDaBkIu5/e9w4eISByklJ4UR15b6z8Ot+nqDDurk8A5Rn34GhVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:57:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:57:54 +0000
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
Subject: [PATCH v7 1/7] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set
 "media_disp2_pix" clock rate to 70MHz
Date: Thu, 14 Nov 2024 14:57:53 +0800
Message-Id: <20241114065759.3341908-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114065759.3341908-1-victor.liu@nxp.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9839db-a379-49ff-5e07-08dd0479a986
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0/vmQY21x8FBnPgL18ueYA4gfcgNGFsMRXWClyqNHDpRRgN2YE+MZkUCeDeM?=
 =?us-ascii?Q?MNjI/+a7AHLrHpeLiK0vb+/VUn8igN0d2Vtkmp6vPXJZXFGRQM9KPQR+8HcZ?=
 =?us-ascii?Q?LPmQG9F/CsDZENL4/1rXIAAZdD+lrZRppCVQzyYlaYIqXLJMiI06GjMflTwv?=
 =?us-ascii?Q?o+RG+lQiOvJol/l9HicmjWlu9G5CteixQT4mp8SdxS+87i0L2q1IwQx2kHj4?=
 =?us-ascii?Q?5J/cEDWPOinlpz1n9IMOUid8Eb+RXNyskX5gwHh1quCnvg+WzOSAn6LTNeTN?=
 =?us-ascii?Q?ZTCac8pny/IAbaV3p5SEbvibkGRcIbHxLElsEG4zzrrZqy9YL0zYRNl3Mrqa?=
 =?us-ascii?Q?Z/mvn5+63680PMmFpYzG7aUP5qHXJ2+GUeFRFG6mPHIjaI5/kLsf9HTTmFyC?=
 =?us-ascii?Q?D84wK9SgbST8LJzPXo6Eb31tsyMhXHpqPVKyi2yB6jSxyzVaUXLzoz83ULar?=
 =?us-ascii?Q?NrqqL45ak6+oQ2MU2W27I+MK9DucvJVX3LsJV7xyXe4TShramwnPgOltGm6S?=
 =?us-ascii?Q?Utnv6vmHUOOYcKTs+fkJhiouruPIWUShFRAWC9moSZUuxKROP1wqIYKFRjWa?=
 =?us-ascii?Q?StY0EexI8a+vxHelm6TxBIM+TKEuVwSdVZmzQ5GwX6KnP6DQSu39s0hSGTqZ?=
 =?us-ascii?Q?4xSUQxzt17tC0p9i0eJXTo0iR8wmoV30ZgWNjUjof86QpSm/iiB3ohLdbTMD?=
 =?us-ascii?Q?REGHcNTEozh1GfqZk57rKKpFZ6lNh7pFdlyHABD1h4Xe7UkFgmfWUzjU8D/5?=
 =?us-ascii?Q?BMRawkIJYnS4zbEhReOdvx26f024+HGcyDhk+xqbut+yJhbh9vLCLjE6djdX?=
 =?us-ascii?Q?JZM/vdaSGKtJPT3Ff7TMYs6rdqPWkVDMB8V3lQRKZ7aIdIspDVoXL85OJmml?=
 =?us-ascii?Q?KaPI54eCzbR/wmOq5B1nImD6h7bpfyV1E05gJGrNOT15+exGMpsCfGvJeHza?=
 =?us-ascii?Q?f6YKPKNLmTH6kZgHE2xOR2DrjnzMJeLbamRqpLt21XBp9Cyo+saNm53VVcba?=
 =?us-ascii?Q?O7WJ7cZX1UpCWlse3ebbJ7naJtpF5gT9NK3CZvVx367IBbFaYP7fxHfcbnbP?=
 =?us-ascii?Q?EGmZW7ymJWg8l4K7H8t5OgqwrB+UrOVF2IMwZAjMONHEGwtD45NlOSvMlIOz?=
 =?us-ascii?Q?96+wjPq0gHNUsn9UvKX3+ulrrXFCzMjFjucvDHbAf+ubNl2QztkIMQgdu+Dn?=
 =?us-ascii?Q?SrIteBRsiU/S6xUkXjFCPH0Af22axjRwl0P7htRN05tRvTSNUL3zPlYy0LrC?=
 =?us-ascii?Q?hogpTc1kZWrss8T892479gLfiu4DG7NaQsdes1syqpvvtsxxcMr3qOcWpEly?=
 =?us-ascii?Q?FA9wGW751gaOGfmcnW7zRUDU8sMGFPEI5BEGnSR4vh+iyAPNWISlcwThq9V9?=
 =?us-ascii?Q?Qxxi8z0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EUgVbm+0ofDiqJIMjvQJ7hevPYNTgL7ItC8sbHJRt2IEgBaytT0NVpdd1YFq?=
 =?us-ascii?Q?8onjMXEhpxF2WCiCrlCvlYFW67QTUSuTIeoDdNss5ErUdNtB83h1P2dz6Pfj?=
 =?us-ascii?Q?KaCRZfHRGq2JpLSSFAX62WPN8ipPlt1LHwBQQBHqE1awLLIb30crDWM82sVR?=
 =?us-ascii?Q?m7lOmdHxqB75sy/nPtQstBmHrjLsRCbJIS3JWfg/tUkW4RlafPkiw2YY+Ob9?=
 =?us-ascii?Q?GQQysK/0+1Fye9DJyLj5buzb5VbM4xOa4soVnGkOQt3YEJiRARl6TTZ+C1tX?=
 =?us-ascii?Q?/nbUg2eB+IzlOERUYuFAHB4QF96n671e4Nc8Q/sbdGGPFSkapDI0gUhTGyNj?=
 =?us-ascii?Q?CvwdRcjrckGikuFPplqSr4d2Ft4K/rZsK/0zmsh5gPYYk8tTZpBRW8T8H0hy?=
 =?us-ascii?Q?SDO4vmgwwIKV1LR2O+ruT4tT59C6mmpYpq8IvvYuhn/QEbi5NJxFdxXYJ1V/?=
 =?us-ascii?Q?5eqkGaYPrPjO0Vm752zwKb9tDTR0DEsQ9fXhCclrr9Fty6do+/tRS4MO8BVe?=
 =?us-ascii?Q?/kfqLVQ2rDGbwJXQiB2cT5l2U7JikFl+tB5ceZmtXklrMTz7tl80gEJMfJRM?=
 =?us-ascii?Q?JqWO4sGOKmrEovHO26U03mlTh1zd7OMAzCWX4qBXjI9nSm7NAa0npE8mCiiw?=
 =?us-ascii?Q?obRjbWv9y65fd4nH/TKvjN4F6oGTpLvHZtSV0ukz1FkO7HDxkv/XbL142GO4?=
 =?us-ascii?Q?MVLxCe53CrHihHuZdA/QFWfCvG12F3sL+T3XoI4z1OPVlLI8TyAsnUQbmNNe?=
 =?us-ascii?Q?kjS/n0M6vRk1NaAMjvm8nd/2Wkntu3Pb4FUUTfSDSRWF2ujkB7JBTG4aYsO1?=
 =?us-ascii?Q?POO9kfVKRPOoEZDD1iDSUT4OYFw63ffPP2sCvv6yEE/FyB6yNtBtPdS9PMd9?=
 =?us-ascii?Q?L7HurjxE5G6RezWQe8IzOZj7f38rYm09obfunzuC2695vogHGDoFtbBmRds1?=
 =?us-ascii?Q?NiMItFoKWzxInPKaAn8Lrjsb3jWCRIrbtQ5MLxJzDQ9dRjq6uD7eCp0p9xiB?=
 =?us-ascii?Q?ruXTKrX5tREZXFhp1559OwaEps6Ykt4xbDFYuPGJZGX9T6wZ9VNFtO5OQXil?=
 =?us-ascii?Q?1eOzvHmKNVwF1jcY8d+i4lmGaH33Se0rQ7ri07OYTkVOgsKWZTTBX3BrDnMv?=
 =?us-ascii?Q?XayGM0byu5o9VdLZR718b1wZ4VUwnrclkHo+9XqYoeuAtYa4Fpy18K6HwhQJ?=
 =?us-ascii?Q?4r6Cfe+RTxXz0YFWUC595iGAeCzWAdgf3vMTLrP/lT9oH84dYz89TW9mwj3V?=
 =?us-ascii?Q?T/zpMaUvb0h6Fq+di+GjNNFkYKL6x+RpIiJB+V5CgRXtpKJyEOV2KLGCDG2N?=
 =?us-ascii?Q?i3EUg7bDMNdAVrbWbAAZSmFzpTfHG0BJcQ6OIBZQ4F+LCW9rkRJCPB9eAU+d?=
 =?us-ascii?Q?gnOSjWy/PhVVjsBsNRl/EKQLeVKDy/P1hnCyRjJpiu7KOZ5AhlcpK8c+HKYX?=
 =?us-ascii?Q?CUdwqDJKBSU5K8z2Q9k7dvUQV95RGkU7RzvQHU4KWrzKHfPjWZm32CXgII0e?=
 =?us-ascii?Q?jkFIZ2YZTPkw7xpodQ3yxZTnx+i/LzsxJss6SQx1SRxadxDDG7A7tCalmzDb?=
 =?us-ascii?Q?OrXeDQ1/bWVfq+6qlM8sVpHGaPx/tanMqaF3f9h0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9839db-a379-49ff-5e07-08dd0479a986
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:57:54.1215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3FIja4xpmwsMA4erbdme4LdUcsFF7c6plzRh9n2vlQP7rfPrNZhUJU4Us1W/xAtFXuyrWAWpD7TA7nAqdnYrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510
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
v7:
* No change.

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

