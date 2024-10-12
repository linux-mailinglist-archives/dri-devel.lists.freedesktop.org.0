Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9099B19D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 09:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DAF10E1CF;
	Sat, 12 Oct 2024 07:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QCn9q/S+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2066.outbound.protection.outlook.com [40.107.103.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1509B10E1CF
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 07:36:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgXD9c6fux24/Uphq64gr1oZi7M96el8xo1ABsKsSt5AzU6rlumD1qPEpb81dHMK4xX0K/Bya8NCnafGf5wwYe2mKMOHcgNi/Hvqw3z0hiZ1oiaX8+WS91gfiUKi7MnEsGOZmVWmGo7jqDJJ+hnGvZj1bJhL7uNj4yr8bK39j5FWahViCaD87UsxgUIc0sRS1yiMVnbpdT1xlZE8JyFWHlVzWopU4RK5C5SUqNtZYSTtEEgsI+eS4i4A/cgMEB6mJ/JqevcxaDZDMUZxv/0VPMtC5DqqE8OZsHusiAm2vGG+1J7rXQ872ID5ukB9VZO0dMlNONFdTdarZyxsgLAozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJ9bcJ7eO0m7WN6p3IL8AAXUN7kEvTpvsG1AROKT7RA=;
 b=maSrJPnZTe2fG9HXOIGwltg7aei8BoLQ6UOvmzRZZYe4C7QaSa8TK/+NG8/fjMEkW8OKrD/8+KHmMSTqj5cAkXZ48QGh/Tws1OJ2hxp9wSmCEIluhb4y7sEEp17rTxFvQFTJ9F3ISGF+85uWdkMrz3D0cSrXW1r/U9TILAmjxSIj7Hq04X+PzWC+dQVshyKoIUOKqyWL8BIlHBXN2vCXAosGI1Rs679Fa4FF8yGhein9UGEBD3Umz96nMTju+rgYQTzZisDY0lH83itvwAYECx+VG273YBRSyEX9t/hO9cGjJEz+XLGTWISVyeE/TIn+ToLp3y5GhLw/Lo9pfkTMSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJ9bcJ7eO0m7WN6p3IL8AAXUN7kEvTpvsG1AROKT7RA=;
 b=QCn9q/S+9CDVeTY/o+jIgPDtu85PvlJByA76QCdW4/1JnCttXJ79tGKSDgNDPKzMawwWy7XWSS3Vyu+nSy3w8IcDPrn1PgKidZoDNKBhzZ18AYpTu20scupev2wgRyRyMkiEhvqDjVWfHoT7vE0YwQYF540pkMnRlXW7vUo4RffRXJsl7O26yMwGXy7/61/vzN3oeFohcYifRRoHeRaxvWPrDhFoFusP2xsxj3cTFByL5VFQo7WEhQhz4f4WkF0xIkGYSmgxpP5zTuzzGHyqxoW9jhTIIaQAe8jQa+cGw876g6Btq9d36rRNMUl2TYND0SVVX6hYlrdSECF9VmcFIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Sat, 12 Oct
 2024 07:36:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 07:36:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 o.rempel@pengutronix.de, y.moog@phytec.de, marex@denx.de,
 isaac.scott@ideasonboard.com, biju.das.jz@bp.renesas.com
Subject: [PATCH v2 1/9] arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Add
 panel-timing node to panel node
Date: Sat, 12 Oct 2024 15:35:35 +0800
Message-Id: <20241012073543.1388069-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012073543.1388069-1-victor.liu@nxp.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc45098-594e-49b9-ec5c-08dcea90a38f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+E5bKBWbNV4/Df9Ce2SeP3sChWY4WZYorO+zpOKHyHkRtI49w616JJpHSxfh?=
 =?us-ascii?Q?wtkuO2QifwY+CK8slxbcRg8POpU/wdzmeTvS0uClz5ITyyywNEk8tpxK6ZXB?=
 =?us-ascii?Q?ZIpi1bFb0sPVETeuE4YMDiXi9Yu9IR2pBpPC48Vb2OZDcFl7Hq++Uh4PYD7K?=
 =?us-ascii?Q?npiGSRTFImEnvzzLaNxANn7C/v4pjLCn32QeO+/h4JO7NV7aQucB47eGerZW?=
 =?us-ascii?Q?Z0fQEtIW+aLxVr8dckZpU50eiB6sS9k9wr0dgn6t33af2TXc/Mh94o4pn8m1?=
 =?us-ascii?Q?PAZ/QUlPw/OIAmjnY3PxPGljxzQRyFLgiH69Gpbx/yDJNRAMW2Usw9eV6b5G?=
 =?us-ascii?Q?a7ORBx5p+OWwprF7jt1WKpYuWZg4o6FiMjKVX09a4fN6HQgRv0qnMLIM8P2P?=
 =?us-ascii?Q?QQVFKa8fQ5vC62B4EgWtAIgTF5chBoiiJmwmdwJZKBjHMdPe3oAaXgTRCbSw?=
 =?us-ascii?Q?QZrt73zZZKcoY3zOm6lmusU6lKmwrQCgIX2GFunetEu4MbKCznyutgqDv95q?=
 =?us-ascii?Q?6c5AbnepecSHiKIfYnbZKkr/7N1FrfXtLcogDVc9E7y1BEMPcQfpw8iKT3oN?=
 =?us-ascii?Q?NCHqt5fFk1LhC0a/FIbpT3PG/RO3FMrlwK0vCzLBmkt/Z4TPHBAiZEOIhGhq?=
 =?us-ascii?Q?SgoVRyAdIaSvnNHcoXG3tm/KLMBB4yWVrxQF/FplKcZVaP1upMl4p/mhpNKR?=
 =?us-ascii?Q?DeBqP+S1FuQfPKtZZVkzMs2XBfNS7F9E5UFV2wkisyQ6ISoZaOFxJ7wlOG21?=
 =?us-ascii?Q?i+D5esVxgGrjR4te0jEsRUMG3ZevjkzC5ioKVWwLvGiPHUvGvHwRFAEdVzWj?=
 =?us-ascii?Q?/3meTJsgVhL9YJneHJDU/h0CyVZS6iD4+ZY+NpApEsZJh+SM0PpZAuSfTyNx?=
 =?us-ascii?Q?nc5ks5FYWfEPkfiQosP60HB7gC3874mx9LSYqjxmMU03KHgb2/6BJVdg3HIo?=
 =?us-ascii?Q?2KKTcpVKIOLW5K+vHDzun0yjplrOltAhYg2HSSY2RC9MAqH0FRhsogzTQqbM?=
 =?us-ascii?Q?GWaxxA6jha0OZTr9AXhFTIB98uSmpdAJtTnjt7/APN14hPJoL6IpBfhjSpQJ?=
 =?us-ascii?Q?HSjRc+cxLTqAgsFgzSudfF281vkKqYbu3x86rMjphqo5dzi+qOIr7qVIXKno?=
 =?us-ascii?Q?NiLFlTNoEymU08cG+ZrRU5MHFBtyAMjSvnYjCF8MffW4Npgob8DtGawiwSOq?=
 =?us-ascii?Q?Uc5Wq4Fgu3Xk1X39uoT4BWj5lNkcI7FbyIRCe3vWhpANA+361yCECEixN/P9?=
 =?us-ascii?Q?+GrWkNc9bCke+mA/livPiGugOJxtwPWwQz17xG7rukETkuCc8oPElBp9Cj93?=
 =?us-ascii?Q?1eHVYH0L03yCoWCIvGJEaxEW/iMsLEBxcAVwUYh6L9XWRA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J6oH6PtML9RsLCmNL7tiFSCt1kUe6kDozqFEVCRiB2x8TRQ2lkE5P32RdrK5?=
 =?us-ascii?Q?MUY7gAf/Uq1Hb1Kbp6vDI3l5hS3ysw6BrYDwaLjY/+9hD+W4nuwRyGqy+eDt?=
 =?us-ascii?Q?E8EMMy7AA1/5uAjtVj4leIhiJsoHwnwPV2JP0wGibJxvgwvXcsCRH3VhXGyw?=
 =?us-ascii?Q?2c2SyKcu3ZABdx8vMYKD+olphgJTVyLAS6kFYrwGytp3VfsipAG0ChYzgqz6?=
 =?us-ascii?Q?ldZpjL7cXlcJbr98UR9I6v8yFfFJaLHYpqv2gy36B3HeLdF42SBEbZHY/vQg?=
 =?us-ascii?Q?jusiFlPqzpXhsWSzHX+vC9xjeEZoOIWV09hlHYaY140FSOlD9C3/yTIIyzOl?=
 =?us-ascii?Q?UsYHYJxdiL7QEBgY5GyOPyVR4f0X3dJNCL4bM1oFUFnauMALXv8l2ZCtED25?=
 =?us-ascii?Q?dCFYo1I1rJpDxKFVqDLWyYrke/+7WvN0jFUxeB3zvYXvbZkXmABf+UBMw1yC?=
 =?us-ascii?Q?UrsYRQps2TcA/u2dhZmmWcxIp2Qo0WnBxZoMC1ZL69WrYhSL4NWyF+Xu7KhG?=
 =?us-ascii?Q?bRfPw9ewK7Y0Ah30lWuFP84HxdfAgLJV0SAhKzyREy5FzVPafbzbglzIg7Mn?=
 =?us-ascii?Q?NyJDc0dkgaRLl5S8ROG4iwP5xWoDUkEsTgkpnktl1qYU69Ig5viq3zp0p9LF?=
 =?us-ascii?Q?ZJYgBIgz2XpboY2O5iawjoBegz3Vc+C7pqX1zISsICCcfuVlyDMQngz2NlBH?=
 =?us-ascii?Q?ZduvdRi+EY+YWeMxi+Lrvk2lev1zFX2h8YqUyNJf3389OgVqJzRhiFnoU5SX?=
 =?us-ascii?Q?23uaUHvRp0NzcnERSDbx+haEAGCrSOuBMc9orqxQUVK2ge8l4Uv1oFm3nfXB?=
 =?us-ascii?Q?AdP/dywLpZ2vMAY09Lb/JIA2Q8MpasAdsFCLtE26cqLXlDLY08efWD+U8cP/?=
 =?us-ascii?Q?MtPIUBYwilx57IbZ5nS7pSYnd20q5MzgA3K7r8gDwYaj+hZJSGVypN+bCPXW?=
 =?us-ascii?Q?O0XFj1FiSkNj9tS5d5x4I2xW4l94Udshp3VbyyVLmTGIOme9BCt/AVtCisC+?=
 =?us-ascii?Q?u+DA8hzwbaUu7I1cLNsYQgM3jj6fsDX0tvl7mPbHhnbhImFKfvAnoqfiO/hr?=
 =?us-ascii?Q?YfBCAmT78cqPJ9X3ZX4Tevcfhfp28dJVbleTjxBc7sNgd9X8PaVO7gn4AG3l?=
 =?us-ascii?Q?gt5bWPpjLPedGlSD+v/WOcTjX1An90Aoy1V/6UnF3g5A+BD+jIB9/N315n7D?=
 =?us-ascii?Q?RGTheAR0EJ1MznF/s5O1flIGvvDXixXFtjkzVAKVK05/6VAYZaZQAUhwlRfx?=
 =?us-ascii?Q?7yaRpFwpyi/7Ep4R1b29i5ezCpskLrgDVIGFiYUPnYStKcYYQ9AYOMQitxEQ?=
 =?us-ascii?Q?iQJCuJqHZLtNe5gVlDtCPvuPis1A07OUC19rjvXY7gApfcLWZkHjSRf4NYqG?=
 =?us-ascii?Q?yMM1g/ddblZ1aspK83fuzrEQkddBIC17s1OhXD2kI6tF7VVa6S1jLSwICKOu?=
 =?us-ascii?Q?6sTiIZV0N1eaFKwJMxW2NOkCoF0PH2p7fk0401Hv2ubswnHM1b0JtylgAd0I?=
 =?us-ascii?Q?eDn2/4hrM2dVQImcb8eDVGASAP5hHS/VFEyEx9zQKr1cgIF0Fx/SwF46c34M?=
 =?us-ascii?Q?5lTv50qwrkHQlahLHmwY2MuLAwdZI5iYq5zkVdsW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc45098-594e-49b9-ec5c-08dcea90a38f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 07:36:52.2126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQkUmNHdYr1vYnuUal8BljU7VjLNTSt19h3gS74/JWdRfqurZd7PN+F+DrGRsKUbB4FJBz1KSqxrGa1PYgqdLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6986
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

Add a panel-timing node to panel node to override any fixed display
modes written in a panel driver.  This way, 68.9MHz clock frequency
specified in panel-timing node may accommodate 7-fold 482.3MHz
"media_ldb" clock which is derived from 964.6MHz "video_pll1" clock.
The above clock frequencies align to the clock rates assigned in the
lvds_bridge node and media_blk_ctrl node in this DT file.

This should be able to suppress this LDB driver warning:
[   17.206644] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (70000000 Hz) does not match requested LVDS clock: 490000000 Hz

This also makes the display mode used by the panel pass mode validation
against pixel clock rate and "media_ldb" clock rate in a certain display
driver.

Fixes: 6d382d51d979 ("arm64: dts: freescale: Add SKOV IMX8MP CPU revB board")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* No change.

 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
index 3c2efdc59bfa..4e9f76de7462 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts
@@ -13,6 +13,21 @@ panel {
 		backlight = <&backlight>;
 		power-supply = <&reg_tft_vcom>;
 
+		panel-timing {
+			clock-frequency = <68900000>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <30>;
+			hback-porch = <30>;
+			hsync-len = <10>;
+			vfront-porch = <5>;
+			vback-porch = <5>;
+			vsync-len = <5>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+		};
+
 		port {
 			in_lvds0: endpoint {
 				remote-endpoint = <&ldb_lvds_ch0>;
-- 
2.34.1

