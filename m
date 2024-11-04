Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F589BAB63
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9C610E365;
	Mon,  4 Nov 2024 03:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lL4uD74V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2071.outbound.protection.outlook.com [40.107.103.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A4810E369
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:30:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWmo/60Ug9Ks9rfDMxuHoEpHUYC0q10ZZqngUAphdH++8XHQAss43iDP1cY4Zwp877bZ20Uk5ztv8sjp0pm+vgUa318V+vuw/W5fskl4i3ctOthyxPTEPl+Y/b/QZk1PtNzioMn79S/J8J+0cMCzFUfjs2Me/1U5WyjwoT1mDrBBSbh25xm0cwJyKvIayK/9QHzpiU+ukRq27HXZQ5OLJRGIV9JHGn1YI6HEgsHtkL9nEtCVRK4ZAE4EzSiobl5Mxaexof6YWLivEdR/0Oe3u1siTlu+qWj+pukgqXmQdxIXvfLtfPD73I3iY+UaHMybABRbmADitUHgKFvC40uoAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbJ9XbZuqLr25AYGYkFfYATwPGAgJkNgwwjJ/htPoUk=;
 b=S5pCXCe2OHZ0cwkDDWsfdjumfPi7n1I05fDBpfQctluivAXQJTpPTZlTTcKb5uXxy/Qp05kfKvwidhNqIz7iuZauedKUg+kFpp1sguQTCgo1DLe61QFe8+JYnJHn8u2N+lGtVpoV5Z89bzX+eMn/v8/HTkqlZ9selwTI6XvUX6ciDjMCgAe9AQ3Vz8jq15IaEVhf8zTSpNPy/Oa/46w2Fe3l8AL9+cIKWSSA1Y/l7UtiPcjihSsLCUCJ/eN29yO+H5FOj9eJU53OygTTWuewicmtP60R2tWo41RjHoXHsNlsRlMZclPSxP2y5S+mME2puBNB24l/gApbVrEzeFmGuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbJ9XbZuqLr25AYGYkFfYATwPGAgJkNgwwjJ/htPoUk=;
 b=lL4uD74V/iUowqHIXJ1cllQujqcVAkz2gyN3BMTYFycKnvSKXIOB0CFIdjf74SRjKFBE+jTTkFURQBUTxrkh2QGtk45tFSrWYoHf8qS6r8h9b6rUrnZ/cXo5ujJcftwiCR4J5HnRedSGPXsc1yH5cCtkZOVshoHi3akx63TQEvO9MAdwh2aBfHBGBAMD5YGmcKGZ03e1POOX7X5YC30ve+BuRno+ZoaNLoRiIuXA0WpWsjFsNxdzKkIdLHRadtDGMSeYz4tHbvTlVKLvYl+jMc5Ubt4y3py2MdrqAFXKRGtaqLfDpjnBZP9R13CWLuweAnepT0SvydZvqBSXXwXGHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:30:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:30:21 +0000
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
Subject: [PATCH v5 11/13] arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter
 cards
Date: Mon,  4 Nov 2024 11:28:04 +0800
Message-Id: <20241104032806.611890-12-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 674ba1fc-1672-4763-062a-08dcfc81031d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c534rbdz4BFudq0f0TuprZwFbyctonM3o/IbJ//L67TKAE8QM+OWaVnRhr0I?=
 =?us-ascii?Q?ffOZsRfR3puDl/OG8eBQH5gm4LUmDdLOgOd6XiZNDU4dskQGQIndhsiAqt4y?=
 =?us-ascii?Q?JXC5F19Ikg3fxgo/fnk78GFu6cUY02sHy6uRTxiUS03nMx3wSS2/M/9IVBVP?=
 =?us-ascii?Q?aXg1VWgqqlt7+dORk1Y+7oz15QwHw+/VeeTgouM6ht+Y1XqygUuJORn9Aq4/?=
 =?us-ascii?Q?n7bCe2gili0+rTjfrkYEzWvHNhtBaVCknEAyzxZZJaydFYeCbitFBbr81PI3?=
 =?us-ascii?Q?6MsLegKfCodmwJi4T5DbpsA86WsgS6NxPvkl39dbmIDa+EncalXyt7bxBsWA?=
 =?us-ascii?Q?n6pp7yYNKUhKZCG+w34uWPU8wY+t03haWzBL79s3OlW+ZjrTFx1cfNP0PLlS?=
 =?us-ascii?Q?qV4X/HHr+W7ymXD5EcfpX8APaTmFyZItzJpruyQUFw3ZTbI8qBQ36uWqjaXm?=
 =?us-ascii?Q?jKBIxxxqrI/9JrOlePD+TYcfwtO4FpRZRYYiS5FM0k6MEw+dlXl5ZoMsm8Np?=
 =?us-ascii?Q?W3Y5+UQe36eBlGQ2htsG9GNwGqFLchSd93tMpc3MG5TbpL8hTP3JauacXtm0?=
 =?us-ascii?Q?hQn3KejPS162RDasUSRrvJTdlKBZ9GScgeCPuLeiCv8z7/Nahp0jiqdQetH8?=
 =?us-ascii?Q?wzcGk/jIFRQo0AYKzg9SpPAeRKxLiO/WLsQr9QINFwSJ+IP7UXDyDdMq4YSs?=
 =?us-ascii?Q?SSjdlYftv7GWmglH+8/dBD6GG+pvE4iZxQqexXQtXU2I0e51GfWTWZkUIjIU?=
 =?us-ascii?Q?OyF3aPOWuqjX9+8tAj036Wj3dJCBgVjuXv863+OWOlgJxCIvQse1pGGT+BMA?=
 =?us-ascii?Q?I2E+Hg1hYZ9fPWZ9OYoE6mxvtme9ELw+hlBnOyH/oa6EgWIjheW1wgBkkBzk?=
 =?us-ascii?Q?ba/yXSNCzdLavZQErBye+rVtUdRUfcPZNt+PoJdLDFwvBZO6TbtdSye6jLvj?=
 =?us-ascii?Q?NZs4NbaKMxfotxM9pRGtrDdje4XCHOJrhiBpdk2DvI3UdQ9elLDnu9VgwX45?=
 =?us-ascii?Q?QBIeXVNZUiF4zJGBNwKY2/xvorC6K+AtwN3YDeI5kxw8Kcnj66AFomNJZaGv?=
 =?us-ascii?Q?hSBlTz3Q0XrbZCgcuFl54V9IVd8hZbwk4wE/6A/2b/6wGMVxOTzorkZ1MWk/?=
 =?us-ascii?Q?H81YhyQDzd6WmvD+SDvYGdTYBqMNUpJYa0AQlrak2Bgl0KhcU8xZD2piDYCN?=
 =?us-ascii?Q?CbclvTea40C9IJNYHU2lewl8mraSxNsBb9x3SGvI9RMvsoVZ85sVzEqwURjd?=
 =?us-ascii?Q?Xtsd5eZN53tJ0ViL8+HOqFGgpP7jjHbSKyaODLIPrednGAyjZPYsjM3C+b5q?=
 =?us-ascii?Q?YKBsU2sanbz4hKW2F1sTOPZEwvzmttnbuki2BZdZfk7LTav8qU7ihuHI5P8P?=
 =?us-ascii?Q?BbnwoR4Iw5/KkzjAxIb84oe0H+hX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NkAaMsn+e00OTEl8saykWx36CFpFK1Idj3xXogFfSCLq0qzA3azvkcsRoyxP?=
 =?us-ascii?Q?LFqxIpYM/A2ZDUFm1yTsHFLFAJJGEM56cSmPkrmv0pq/YJEodgwuj5zC+pH2?=
 =?us-ascii?Q?8/F3+0BhDaBjVn7o49e74tTe7Df3dxCG14EAt3eJeENsZUwsQ71WsGvqAsht?=
 =?us-ascii?Q?ViuDG8rUVLyiZmLuscXd/64NjQwGqVsrH30++2EqGhqiUeH3J5pk/45p1RXc?=
 =?us-ascii?Q?NQYu4lvSkYeo7H+g5iPG3K5VsjQ73VAr/HxFO2aYybwQ7785RL9CIKBhy36X?=
 =?us-ascii?Q?0l3WzJRbJcv6yaFJJePSOBe5LLzwMhrZQts2kaa9iP0HLHZzxtk/TzutdnNP?=
 =?us-ascii?Q?ny1RTApAGPouP4eEIW3W81ngB1g2nXqQxcfm098msDbiDspGEegrHpvgH1hZ?=
 =?us-ascii?Q?RvIjNVtuZ1aXRs9PnzL2Zw2UtKaU9/1nZ4JaZtyJtdWx0oBGT9jx/Q8H65jz?=
 =?us-ascii?Q?e9p9I7uVROcM7bIYKCCZcfUxhAuNqKO/s3qQHctJ7/hyF5HEP/YvNyoweaii?=
 =?us-ascii?Q?gpIrlu0W0YITZTOxxTSQ42X9KRRHK6V2piOzWmwakxR6Lv4Zrv5gf9DIqWAI?=
 =?us-ascii?Q?d9VGQvpc0gcV8roPrZtqdsrOgV+vtA6+PowPszg0JoWpJNDJ+wVI0YX3v8XQ?=
 =?us-ascii?Q?eY5uRtnbwCCDomfTH23dzYDFzg0Wwbf4FYL6Gdr7hXksG9Ad3Ged5Jb4uuLR?=
 =?us-ascii?Q?FmP2J6tRTGQELIXaqjNITKXdgSL0b9uqHqICZfDcOt83Txu81gBmYZBYDt29?=
 =?us-ascii?Q?X3C1jIu7Qkld0ioWjcNSwqoPB9T7GkMCxiCK89ZVBBwQPOe1sIBhxnWTfOPU?=
 =?us-ascii?Q?uYImj3CpNGJCFwoHh8M2PmkRRx9/mq0IzX/RO1l9IbBaRi4H+6NNfJ8jPf7Q?=
 =?us-ascii?Q?OKsS1OqKw1zhVAyUVGdo/zUj9TGMQT5IFS3FGYMz4gDsv+bccqU1O410SZKe?=
 =?us-ascii?Q?KQgdKY1wWVe9PWteynskBRsj1TJaLxy8Em5oCh8zkr2oljt6K9M+UTiBhdVG?=
 =?us-ascii?Q?XxG94dzdMpwlXafI8gytqqNHK4p9er8GWAijX1OrnQkHuppQu1oCm33eQBdQ?=
 =?us-ascii?Q?DT6LYOnX/kcre70dpdtkevkPct80jXXh3t0MBwOMpkbw5XCyoKUdDqhpyPyZ?=
 =?us-ascii?Q?aEo6tW1XSR1L3SKSnW0iUwPWuTVh6FfC4aGPr9WKNOfQWOgaeopPA8Vn4Uzs?=
 =?us-ascii?Q?HZSZaHd1wwKcNoEA+iNitc2YXZkZK3eiVew75edv9TpEhZ3UfqJIEMyAXuM+?=
 =?us-ascii?Q?pCJ0XoqkAAdxoupSOuUMp1caUfGWUKA/GDfTVmbFIj6pxJ889Ylcds8R5Nw1?=
 =?us-ascii?Q?xB/mtiFKT/sMIRY+4fSRXSYfruij+hVJ2Asldirctccv4eaZ6qBcWj8ooiCm?=
 =?us-ascii?Q?bUKhuWni0lu3rrj4Pv9xdVRIscyXiiIZ1cg7I3uYxXC4RJDyGV1dwaag0TGF?=
 =?us-ascii?Q?ZOncGAMVdpg7jcRc7nOiUWRkETdOvPmmmw0ASPjpCToTrstHrhHUjIb/5LOH?=
 =?us-ascii?Q?wah2vKDmneE6Pyjo0fGlNlU5yJpzrD8LU1MJe58XQ8IEfmNAWEpd/GBhAYGn?=
 =?us-ascii?Q?HsNgtPVks9IYiu4r8KvMLvrc9bhgDjEnmFMAdKYn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674ba1fc-1672-4763-062a-08dcfc81031d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:30:21.5166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYsUnyeS1kHfIl5iisU7B2tnTe4VYryd6E8O4Ex9zQJoc/tBldDSKFB/atD8dGrJtLx7+58aL3Oq/ltf8jf8Aw==
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

One ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
and IMX-DLVDS-HDMI adapter cards.

Card IMX-LVDS-HDMI supports single LVDS link(IT6263 link1).
Card IMX-DLVDS-HDMI supports dual LVDS links(IT6263 link1 and link2).

Only one card can be enabled with one i.MX8MP EVK.

Add dedicated overlays to support the below four connections:
1) imx8mp-evk-lvds0-imx-lvds-hdmi.dtso:
   i.MX8MP EVK LVDS0 connector <=> LVDS adapter card J6(IT6263 link1)

2) imx8mp-evk-lvds1-imx-lvds-hdmi.dtso:
   i.MX8MP EVK LVDS1 connector <=> LVDS adapter card J6(IT6263 link1)

3) imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso:
   i.MX8MP EVK LVDS0 connector <=> DLVDS adapter card channel0(IT6263 link1)
   i.MX8MP EVK LVDS1 connector <=> DLVDS adapter card channel1(IT6263 link2)

4) imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso:
   i.MX8MP EVK LVDS1 connector <=> DLVDS adapter card channel0(IT6263 link1)
   i.MX8MP EVK LVDS0 connector <=> DLVDS adapter card channel1(IT6263 link2)

Part links:
https://www.nxp.com/part/IMX-LVDS-HDMI
https://www.nxp.com/part/IMX-DLVDS-HDMI

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v5:
* No change.

v4:
* Rebase this patch upon next-20241025 to resolve conflicts when apply.

v3:
* Use data-mapping DT property instead of ite,lvds-link-num-data-lanes.
  (Dmitry, Biju)

v2:
* Add ite,lvds-link-num-data-lanes properties.

 arch/arm64/boot/dts/freescale/Makefile        |  8 ++++
 .../imx8mp-evk-imx-lvds-hdmi-common.dtsi      | 29 ++++++++++++
 ...8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso | 44 +++++++++++++++++++
 ...imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi | 43 ++++++++++++++++++
 .../imx8mp-evk-lvds0-imx-lvds-hdmi.dtso       | 28 ++++++++++++
 ...8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso | 44 +++++++++++++++++++
 ...imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi | 43 ++++++++++++++++++
 .../imx8mp-evk-lvds1-imx-lvds-hdmi.dtso       | 28 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  6 +++
 9 files changed, 273 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 2a69b7ec6d6d..63b7259b1042 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -209,8 +209,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 
+imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
+imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
+imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
+imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
 imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx8mp-evk-pcie-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
new file mode 100644
index 000000000000..44b30e9b3fde
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	lvds-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "J2";
+		type = "a";
+
+		port {
+			lvds2hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
new file mode 100644
index 000000000000..4008d2fd36d6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+			dual-lvds-odd-pixels;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			it6263_lvds_link2: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&it6263_lvds_link2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
new file mode 100644
index 000000000000..6eae7477abf8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx8mp-evk-imx-lvds-hdmi-common.dtsi"
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it6263: hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "jeida-24";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_en>;
+		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+		ivdd-supply = <&reg_buck5>;
+		ovdd-supply = <&reg_vext_3v3>;
+		txavcc18-supply = <&reg_buck5>;
+		txavcc33-supply = <&reg_vext_3v3>;
+		pvcc1-supply = <&reg_buck5>;
+		pvcc2-supply = <&reg_buck5>;
+		avcc-supply = <&reg_vext_3v3>;
+		anvdd-supply = <&reg_buck5>;
+		apvdd-supply = <&reg_buck5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				it6263_out: endpoint {
+					remote-endpoint = <&lvds2hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
new file mode 100644
index 000000000000..9e11f261ad13
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
new file mode 100644
index 000000000000..af2e73e36a1b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+			dual-lvds-even-pixels;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-odd-pixels;
+
+			it6263_lvds_link2: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&it6263_lvds_link2>;
+			};
+		};
+
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
new file mode 100644
index 000000000000..8cc9d361c2a4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx8mp-evk-imx-lvds-hdmi-common.dtsi"
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it6263: hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "jeida-24";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_lvds_en>;
+		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+		ivdd-supply = <&reg_buck5>;
+		ovdd-supply = <&reg_vext_3v3>;
+		txavcc18-supply = <&reg_buck5>;
+		txavcc33-supply = <&reg_vext_3v3>;
+		pvcc1-supply = <&reg_buck5>;
+		pvcc2-supply = <&reg_buck5>;
+		avcc-supply = <&reg_vext_3v3>;
+		anvdd-supply = <&reg_buck5>;
+		apvdd-supply = <&reg_buck5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				it6263_out: endpoint {
+					remote-endpoint = <&lvds2hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
new file mode 100644
index 000000000000..527a893a71b2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+#include "imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi"
+
+&it6263 {
+	ports {
+		port@0 {
+			reg = <0>;
+
+			it6263_lvds_link1: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	ports {
+		port@2 {
+			ldb_lvds_ch1: endpoint {
+				remote-endpoint = <&it6263_lvds_link1>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index d26930f1a9e9..68e12a752edd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -938,6 +938,12 @@ MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL         0x400001c2
 		>;
 	};
 
+	pinctrl_lvds_en: lvdsengrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10	0x1c0
+		>;
+	};
+
 	pinctrl_pcie0: pcie0grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C4_SCL__PCIE_CLKREQ_B	0x60 /* open drain, pull up */
-- 
2.34.1

