Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEBE99B19F
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 09:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDD510E2FF;
	Sat, 12 Oct 2024 07:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="DfKuqoHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2080.outbound.protection.outlook.com [40.107.103.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFF210E1D8
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 07:37:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcA8UaiORyuCFvXps/bcIvAvkCY8ZfxI0vKvo0gEZkqm24J3cTDoLVWxgD2Ekbeu4s0uHxVYovX/5B4Cb3wFDlG3Z48mqqMg21fU3E3Vk5DceYQRrHzIimw3VtXgqXEUlgclQNhNlTKZ87Jhxu3BnheeUr+ESOjCDXgCSYM5b+QbCX+InX586I+732Y2lAAgVqXm9DuwBitZyIqQonuTpoRRtthYKUBtFEryJuU2nOk/MCLiVEc6UcEqOF4X+EfjVLUxi7nOmorBNLufXFNipQA7cu7kIMiFPd51n8z5i5RuV6T0pvtYhwwwjEhxFIojsHnsbMUcgxDZdM4cP9IZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpoccCe7JR3LeaO1snJee9cE4PIqCvYayqABPxbzUGU=;
 b=DWeKzv0G8+1C9tLDhxMCYlX808TAZfnt5tWKUqLHI8I9NUlaWdn68SE5FokVL9RGIOzvz//rrccZRiRpFey7Y3M+rtDVRHorg+opmR8Hq8Bhyst8+bwDv8sK3wj7RlUrUE1fD8V0kIpmDupTZ7KeTBqmAhcmtHZRI3NFAmToSSpCAQVp0hZOpKEMXtMDSyJyKeZDkiOVHDOBhl1CWa0ReFfc/F+qFaPikU28ZrJUtHdjpVVelc15QOSOv7s3EDuwyUUs9/oBZM1IBXj1g44G3PtnJYwXWIgJV2WAF2dcYzIA44oUWdiD71atrdJ1rMPuAvSt060t7n3MrePEMcA8Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpoccCe7JR3LeaO1snJee9cE4PIqCvYayqABPxbzUGU=;
 b=DfKuqoHwk34C6Ct2lIQHYjA1KaYqnlBojF/7OU5NAkrx7TKcCj9pDWNX0earRhsZzBi4W4CD3R3+vuPuHAes7YxHNU5A6IytCvBCUrK6g9MDuJyfDZq9lxad6wXq+MBGTlWxUYm0EsMz4R/fBk1lk9SUal/Srz/55RYCxuOv3g9BoXis5mGMpCYmJLochqV7FCq1UcIUUXi3qHvFuWdLRwM3aDCMBQhoYFOXo0jg3wKYDiJ2Et8gCTavTps0KrASPJIqz8DT0dRBwYREz5Ru0Ha3+kZBsR014q9OEiYXa8gThGFMwJUqA9AdXo46Ej9SRKlLJgy2BuHB9xpUXqKcwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB6986.eurprd04.prod.outlook.com (2603:10a6:10:116::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.22; Sat, 12 Oct
 2024 07:37:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 07:37:01 +0000
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
Subject: [PATCH v2 2/9] arm64: dts: imx8mp-phyboard-pollux-rdk: Add
 panel-timing node to panel-lvds node
Date: Sat, 12 Oct 2024 15:35:36 +0800
Message-Id: <20241012073543.1388069-3-victor.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 16e09e84-f9c7-4048-8be7-08dcea90a8fa
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AuDzbZeLXmeHr4nwChwTLGnv9pAQyEU8e/jhw+FT6/yP5neuJ8f723GpEzGD?=
 =?us-ascii?Q?2AstbWw8H5g3tst+5abiNGHaDtSCHhdASJy1ApUHBVNA7uW5URflyBgueKKr?=
 =?us-ascii?Q?Mxaj6bnfKch8SQP1Vj2JtKEIhk+oVrW60SvPkWGUxZhL4mPEhzHQsN/CGWAK?=
 =?us-ascii?Q?b2YWdPCifVgakBc4Uk61mOCY2gGdSF9Gc9IMIWZUw4tUSpKvH+xuRYZyY2ZK?=
 =?us-ascii?Q?So8ud4bRMRnY9juP1KkFegvTU4LaXCA8FIrl3E9y/D6lEcnQk3Zm3x/4I2v4?=
 =?us-ascii?Q?TnTNVLF6m7cnuW16rtZ1Hph0NtcFtFC+G/vJJANy8vmOd5K8D+0IwC78NB/L?=
 =?us-ascii?Q?PUHwuZ+pdmujf8OYq8RuygJ4sEk9WtHKglz+nM6U0nklucMzbR18iWnp2X8Q?=
 =?us-ascii?Q?ff5vpdYzAg7QwvC6szuuts0myaGfQlrzhAIe/mVVYAXficAdim8M0rc6B6yY?=
 =?us-ascii?Q?ffVysuIBA56LPJpjETUL4O0Vm5OJcDZ2Ut3LoiV+Z6MJVij9NXSsYnxJEb4N?=
 =?us-ascii?Q?n+RZMuwDaT/NL0cbXpyTwmKBdd8GwKQBH3hxbZmrjI9+n5wLq+iihudLeMxY?=
 =?us-ascii?Q?OrDJGL93BbBjWAZXkfunLpEcOxYi63QYdh8TY5ZoMoK8JUBa7j3esALDNRAf?=
 =?us-ascii?Q?kAuaXPNK+EWeY5bgPC3syvIJxnJGEGKKxM6/NnYVghbkwo47zXCJg8r7Lu6R?=
 =?us-ascii?Q?Yzd6je0oVRFrZGkf1cKPkE3H0xkHTeaq2ha6SGQsRDigXshU1+rLJ/aneC3Z?=
 =?us-ascii?Q?E3ByKeKT89815Ctv9Gsctxp4MNrCwsmeC8xjtrmqBadmSWl47oltPhwvzK9i?=
 =?us-ascii?Q?67A+u4u/32xUcRy6wobU/ehW9xku0S+Et++k9YDVLfCarpJrvqCDOefDQhMH?=
 =?us-ascii?Q?9Ei2c2qWr5kvIT8hDMFzoSlqIYjBuaKeNQ3yNlBk0SveLSFOAuv8j3zkBCCy?=
 =?us-ascii?Q?wcvn25uJA4LjrlcyfDXb8sn45DUiKOFYjOxSySsya8fK55okgSl6hlCrl0Sj?=
 =?us-ascii?Q?nl0LzQaDKamsA3617ZTF9mPk8fYNyYfm6/luCsbfVYfhY003HPoSEU4shtyH?=
 =?us-ascii?Q?55Ns4iUoGmc/PJdKMlffv9hCgD9sWNZBZJ/agDXnow/wSqWcavclXaZn0/MM?=
 =?us-ascii?Q?VLgEVbxCLcgZWZD+dH7v/vnryGnnYf6cBpFj+Npy3alHCpgZOT4sDI8JpHda?=
 =?us-ascii?Q?MSWnDy25hVig0o+dnizjqcfco9z6YM5AycZUP6cpbW6TB0hYPBiUVRbezJ2z?=
 =?us-ascii?Q?TItlIW7ngLcMl85+rtHg+F2ka24TizQ3HssI+n7tJZpeP7R+nyAYvXLqELiv?=
 =?us-ascii?Q?r0cSAJpmuIRpGHSLfyHGpTeY/NeSGtIvvhXB8phnCCLYNw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RlzAyf8/Tf7QNARSYwPLoMmLWoLkq2hRnkU3yyI2fqquXw7QDz7eKwgaGWxl?=
 =?us-ascii?Q?WKB/sZf+QTt8yYVH+kUnOqc1fD1708O38XZChmnBl7q5swO8HiA3p6b0jHN4?=
 =?us-ascii?Q?VDcBfzNpvdUo29hyFMG6LZ+BCbsHwpYIch1Te3ebJU1FahftUv1brv8pLR7b?=
 =?us-ascii?Q?Jf5TwgjaYG0/1ZhlvQXj05Gi9G8A4u1GbOA88An9QrQ7D28d/6X0E1/PHxPz?=
 =?us-ascii?Q?u+MvbhLEXLDX+RnV1UniJQKHny1R+9Caa8+aYjFMUw0jncQv1n0coWXXW6Ra?=
 =?us-ascii?Q?/fqnkKIjjL+4HE9iwcsjCn67Gf99RI/iHigCTmypp1ghhnup5NKPFEsBMl/g?=
 =?us-ascii?Q?XuwgAWuiDjoPr5f0aVqg6+FuQNrtop0xY4VSkxTSBHZ+7IrBXK5Z/+Xbs3KP?=
 =?us-ascii?Q?PhPonLrNFguty+ctsvYBLcLmh8znjbhOtDk/yC1lVMrBVtFt0pCGVRKJVtYy?=
 =?us-ascii?Q?wblKulM6WbjTSqXsKzQH8TsnXN+nNT/HrRFlFY+2bgETJjK2YKxKlzZ7GRBu?=
 =?us-ascii?Q?4MpiNuQSKrvywKx1kPo2vNHh2T0Ye7MlZxDbtfANGannIbVPsz1GDJKHifzl?=
 =?us-ascii?Q?RWGdI6e9ypPB/qbvgfYUXQHMYP+86F7k0ivNBOc9rLH2kHX/lGTHtVR/7ydB?=
 =?us-ascii?Q?8FwF1tfWpNi2/mM5kkbeQLehcbQAJgXjq6Dpgovy64fD7InFzevBf1cNTEF3?=
 =?us-ascii?Q?+5MYfsgAicTkCGb8Cui286X5nCkduyytPbpneO/wjyPVqX2gpjK6+lHIuRDn?=
 =?us-ascii?Q?BvzZWdzqGodgeWK9A/0AZf0EzKqrsAFqRG9rPQpVC0h4w/7WXKHMCGmmB2ZP?=
 =?us-ascii?Q?i/UZcZyeptLwWxi6sVlkvTiPEOXUfGxna005f0AR1/AgCGCgLupGN6wDyiu7?=
 =?us-ascii?Q?IoRUFYIDgoIcyNK9GddJPpLvFAFV6AmrmWuBr4Gn+JYQ82vER0eds/OfO8lr?=
 =?us-ascii?Q?aNDjckVIYCGgNSP3XpJaJxOvkvSmy0bduGgJUPMJ4/HZ859UCiK+brdmTENI?=
 =?us-ascii?Q?HtqLN+F/IzfyTTxi7bNE1Xuis0dA9ygjORjsYhwcgsDHFxuRw59b7tJx0wOj?=
 =?us-ascii?Q?OwFJIhQ4UfLh2THz0n9GhEhbVsrxzXnlkOuuPzkpYVEteKxZyqgkfDgzSwC7?=
 =?us-ascii?Q?OAasG9jrBkaYw/lz/SRsnHCYWDrSvXjQ1vGP7UtdfUCEvNg2k/vIpgmh8H2r?=
 =?us-ascii?Q?ftYYnDQSp3T5GVZJgDaDhx3W4q6HA+PsWtXO4BAGi79nhW49gbHq7sL+Amyj?=
 =?us-ascii?Q?MHcztbGD7/a90eKBsYFthDQqXQtyWPojJCvurzH32xszf2owwJWRYDlSgbwK?=
 =?us-ascii?Q?HduDXiWpau852l6SGfEt2gGBmTaG/kBh5OYj/JilpgueZN9kW7blc2RzFrtu?=
 =?us-ascii?Q?yBQyqGTieF6tidbRGm9UzQ2I30eMvoLUK/ve9snyc0vICO3MUpfoLJjnzXDP?=
 =?us-ascii?Q?rFxbiL2aQsTkxoTKqy1j4IKiBcJc7aCvJNaiw/GOIo+UsQswHM6SoWPp5hg6?=
 =?us-ascii?Q?HyRwnPpy+/8uJrHJDSUivI6APXIJButKb1a6ujrGj2pNp4AY3SJuGxMBdLeX?=
 =?us-ascii?Q?8oyJsafn6Vb+349yUO6x6vLEpv2zSzjX5z8XkEX8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e09e84-f9c7-4048-8be7-08dcea90a8fa
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 07:37:01.3522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3xThv+tGzpq9EJ5L1YMFl6BtWJDA0bxmHVIlgSMu4IGfo7K9tIDsWDqrU4ig/HaeHwYgtHmhjqEu8rkvq3kUg==
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

Add a panel-timing node to panel-lvds node to override any fixed
display modes written in a panel driver.  This way, 74.25MHz clock
frequency specified in panel-timing node may accommodate 7-fold
519.75MHz "media_ldb" clock which is derived from 1.0395GHz
"video_pll1" clock.

This should suppress this LDB driver warning:
[   17.923709] fsl-ldb 32ec0000.blk-ctrl:bridge@5c: Configured LDB clock (72400000 Hz) does not match requested LVDS clock: 506800000 Hz

This also makes the display mode used by the panel pass mode validation
against pixel clock rate and "media_ldb" clock rate in a certain display
driver.

Fixes: 326d86e197fc ("arm64: dts: imx8mp-phyboard-pollux-rdk: add etml panel support")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
* No change.

 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 50debe821c42..20cb5363cccb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -37,6 +37,21 @@ panel1_lvds: panel-lvds {
 		backlight = <&backlight_lvds>;
 		power-supply = <&reg_vcc_3v3_sw>;
 
+		panel-timing {
+			clock-frequency = <74250000>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <72>;
+			hback-porch = <86>;
+			hsync-len = <2>;
+			vfront-porch = <15>;
+			vback-porch = <21>;
+			vsync-len = <2>;
+			hsync-active = <0>;
+			vsync-active = <0>;
+			de-active = <1>;
+		};
+
 		port {
 			panel1_in: endpoint {
 				remote-endpoint = <&ldb_lvds_ch1>;
-- 
2.34.1

