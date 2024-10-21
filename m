Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69DA9A5AC3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3DB10E418;
	Mon, 21 Oct 2024 06:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RGpz2I8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2080.outbound.protection.outlook.com [40.107.247.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE01810E418
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:47:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sw31jPdXJ+ZmGlio2OzjdiTlQAbay6xIzqspReLwsciy2Hz7goxapbrPuLKmWonzCvAiManyHC0zTzPexIMkn3ckH1unlVgQpiQKNiERAVH2HMiL00HYdKLW9Qr86sGrnhgzgaiimecOHWNAcoJMLfd0BBl5Di1598c7ThL6q97DNIDPRg/EUdWc0psjYjIlB3P/U2nMlUD+ReixOM+mKwlL2X43DcdfUtesKY3LX3Vi0GkCZtDRBwgZ3Lg0yZite+UNsMIyPaZVRz6AU3QPFzTmU4EG/P0q0grt/YAMH1ZcDc/3iShIbiQQw6xzHjiD3oa7dKMQHcVglPaEeZxjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIIIq3WaqTPlRAkCDorVhCsrdfeZZ79oo7pSGQXQ3FU=;
 b=yx9Dj4xJO9F9/sxlIU4HIc/5qk4v8JStoYHXVWCV/zNa9Rc8q8gMAqBy+oapVK2DMhXAck02mB6SEEYDJ7SF11cpDiYGV0HwwH473e41yoX3cPgrRsSYKIIbkeQKAf41CGOspWx4GJ82r1L6OzocrqWvYXWV6OP3VZBTCg8Xvs4thXN2jydW8FoPeMez+g90tsa1SH0KeWh1srFemKMfOwUdBGJ/GQY+cGYTyVICt61YAULis2n6PvJYF90xT+tODUBY3+YY4LT8REJxfu2jpHJXJO/dsSrbn/EPYzZI7FgGZIrN44Lth+uNiP+0SxCFW9Fth+UjhEtpQjG88tS9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIIIq3WaqTPlRAkCDorVhCsrdfeZZ79oo7pSGQXQ3FU=;
 b=RGpz2I8iDc8vmiYY7zv+nRKQ/KPSu5gYuyZEsuGF3fJW57v3KO3TFH+VCsz2ss6MaQY/HrG34G6wxS1L2MqlgUrD6adotrWDVNqt7Zc7xMRcSE0KYWzEsaNApdDL8zPQ7kltCdoAE2gSbVIgX01J6Tn9sgppHOmieftQUKkVMuwSSjrRkjoiW2b36TnKWqUbZ1ysQ4VVbcUYWwf/3MCw+r6l3iLAyPwVjBwuePyaoid8WBX8b7es+VEcmMzLGPQ9HZ5/HNpIfiryEx1NdfUQhoFt4Cr0d2YDzRvWH2bgJTXdSl69i+R+OD/a6rk6tU1Tu9ylzgRcV9GXtNcGrN2V4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Mon, 21 Oct
 2024 06:47:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 06:47:39 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: [PATCH v3 13/15] arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter
 cards
Date: Mon, 21 Oct 2024 14:44:44 +0800
Message-Id: <20241021064446.263619-14-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021064446.263619-1-victor.liu@nxp.com>
References: <20241021064446.263619-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0111.apcprd03.prod.outlook.com
 (2603:1096:4:91::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf15aff-3a74-4bd8-36e1-08dcf19c4123
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Vt4HKkC4hQZxxwr6b2eY1fI9w8u2qCQkjHf6cvnCqDdlrvmfGotvbBSXimi?=
 =?us-ascii?Q?mhKN/2dHDrBNMMx6pdgNReOqkSrDBossVZJOo2vdgQddJoMkzHLk9iSxEcOU?=
 =?us-ascii?Q?3xz2Asa31eIeu2j8hgvwxuvGWWLFmkbHB/a1ES5npFh4hALZjKOoOHBXZuHZ?=
 =?us-ascii?Q?V/HVjP4nfurfVhhzz0jrTf63RtaHL4fwtDA7kl/cZcwEEqbnf0NWYJ3h5h6d?=
 =?us-ascii?Q?cs8DITTO5mWoRRXFSkrraU2WpovJ9SLP4GqEp2ZtL2ESNxLtqtDFy6qKYE+n?=
 =?us-ascii?Q?yPuPR7OLVQS8NiiwB7T0ySVER6w9AhIvC5CGfQK2qNfZYp6+NRqPSHVIbWTX?=
 =?us-ascii?Q?LbGZTqLAiiu/K5p4KgjBOyKWW+Fn9BprsjBKHnFuI3kcpr09q1VbecOfVgZa?=
 =?us-ascii?Q?VagNWBwRGEaacN7lDy/gKtmBVdFCbVad0BHc5NhCQsuDAMuLX8nt0amZP9uz?=
 =?us-ascii?Q?xh/EtmhVdTbtnVkzzSZph3yD4JDvhq/QYUMe5nST7FLPo2chLXWjW8+wXmcw?=
 =?us-ascii?Q?54l1lJu9S4JL87urV5IhU2g6Nk+dipNmBpLQ1aiqEcwuqfTUgWMb7Jll+fcx?=
 =?us-ascii?Q?M1ClHxLCfPP/V3fQkVgpMZJ4TZXhDvvj+mKAw6jICPeJMfnLziI/t3DkjlzE?=
 =?us-ascii?Q?irxvcwnRbmL9t9Gjzqm4U497wz9Tgbie2179YO0RGDA+sgnPwoczDFsxY35R?=
 =?us-ascii?Q?lHoOJGfS6n4Pk3KQPSPKfn8FSF5l9GgBk/9iNjPcApD6NJd0s0pD/9abz1QW?=
 =?us-ascii?Q?MPS8iFoogQZbWgBl1OjMFvjGPHIiqoHcAaXlQoGEeGeO+cSyhDH0cWN/WycW?=
 =?us-ascii?Q?WsJh29XeBsI1QPdguHsN2PtxhrlE+rUEwhjf3NNuIiiJrP5MFTre8ChyCoOC?=
 =?us-ascii?Q?h6PGRZOER7yCBUcDVp6x7sWXlPccXJUXZqp7rA3itF0dJs9hRqIVhf2m3X+J?=
 =?us-ascii?Q?obiYq3nWqPIqZOf48iqj8zITn7v9QNRlHCd4joNZZZbcRSEGK4dTxqzVJjyd?=
 =?us-ascii?Q?lAeh05IWE89r1UWTN3sz3imjbYCQpmzGmosqrxK89yu8rsmcjSjIBttYwfz1?=
 =?us-ascii?Q?e+6tv91g/1OUzM8vjSq+YlLXX0l+B3LjCra5E0vzIvlqAhF9aKSUUOd2ifuJ?=
 =?us-ascii?Q?cbDE2r5mXO6Sde6nNB18Ru6dfpx3qp7MPBuFCm4zJFAzx7qxjw1yH9esgHHH?=
 =?us-ascii?Q?/E95IEJpMpliDixKCBGSP48guVefqq5VWjZvh3JD73lBQi8uSGUTCuPJq82+?=
 =?us-ascii?Q?cOtBkESVuosBPCbLVQVlXl+MeMm7k6IzOYUNacHW5kZyz9+B5FnX/A2RFW+Q?=
 =?us-ascii?Q?qOuUkJt74fv6qMxh6xc8+V2/y3vhW7bO0sTJSzNjSBRWi0DO1wiT4LPVs3pd?=
 =?us-ascii?Q?DE6+LShIIvZVjG+0wZgz1xZRWWZi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+iwuP7C6olibC+5ScIOhPmtkh7CeB4TkAdBTELy05A0g2Un3xCMib3/EkKJT?=
 =?us-ascii?Q?xPhIhjTOHyOUpPwlK9EQORauy/JASCSZ3YQT5ceVlJWiBfmUxP8y1lhukdw1?=
 =?us-ascii?Q?Pgdxs2s/76gGw4k15xtMO3zhCOu2UUCwAHBH7oZzVLLfsUp57/F+W/NZwTXt?=
 =?us-ascii?Q?YAcVretIPCUnv1kv5whpp1IhKdECrXzRI6rS4VntC1Qq6t44ji/gX7L4pKEK?=
 =?us-ascii?Q?JnlsHepRLWfS52HfhIVJI/wshciifWRx9soEqUZWkTuMvdU5vwKSxZp+w0yr?=
 =?us-ascii?Q?sDJGFsZR0x6TKFjeaW6b9JVIgYOsjiLq0oMsu77l5zTWErQQXN8rfL0R16DR?=
 =?us-ascii?Q?C2hJ42TJ1qjKr6E7pkK9YYVKfKBf6SVbaK2h7ME0sltgbpvm/R5NoKemkeh9?=
 =?us-ascii?Q?8wapqli9Pa6FPTbESG2vsUbe7Fa1Px2Ys3Eu+2ohdO0eDHZ1f8w3Us2bilek?=
 =?us-ascii?Q?yaKhxUyIQtPtDbGkQ0Qb8mWrgvXNTJbX/Zp9903r7kOK4oTzbkNnIYaqnjCp?=
 =?us-ascii?Q?blA3xBuGZgw16wTC5hpbqFoZtNYLFi8wHT6DORPs2ZJEmK+2m8CSYBDW6o1+?=
 =?us-ascii?Q?DoElta87si0sx42kbHJIeibArrJr4YtZf/jFFHlqZatz3C5rypgqbmB5R47d?=
 =?us-ascii?Q?pxIhO4E+aHBpifGYOUjmnd6boAOuCaeqjGvOLqf0c5nffbIaTbLyl32HFM8W?=
 =?us-ascii?Q?znoqboCJoHUBlDEJ635G2nuMowIEEZr7PHtlM0VrKb0W17ZZRK2z/UIJwBT5?=
 =?us-ascii?Q?2nREm5OIOx7PVfeNyaDQyCsss5oHzzIh7ZY6KZBgmPVeyHuhRTlx7PoM3Yr6?=
 =?us-ascii?Q?wELB6hChJr7y6w1rIfU2lsy6+TvCJ4wt//CZdVdIbY89/Hx9HwjrLh/446ng?=
 =?us-ascii?Q?fUS+Hw0rAEAwK2YOXDXeEDEdSdJtCtKni8X0jt06e08+1x+0UXofCV3211Yc?=
 =?us-ascii?Q?8cQFjHS7PHJ/+MW2BjnAblkR33Q/KYULg9ofDvX+zq9um8XnCGz4WxJbEmsz?=
 =?us-ascii?Q?Vs3Dyb1noRMbwbacKvWqDjZ2EMd7Ur2BQAMm/XBVDov5Z17ni87pdx2F3zm9?=
 =?us-ascii?Q?n3JZoOdIPS3iiuZ0jSGQ4TD5qrEO1lHQYTDwfbIGweda3tZjq/K3qzx9jucK?=
 =?us-ascii?Q?XXAUPaKsQi3kE4yMg4xCnZku9rB/Ua9m/8FKsYBQiCcrqwC8v2ExhD1N4XuO?=
 =?us-ascii?Q?tV4GeXuhpcDiPQKjjHiJ5puoSMCriJSP9/m06y3bEtJWZWQX1Bl6X5dQPuQ9?=
 =?us-ascii?Q?totsM8s80SeeTMzdAxhAvSY3DBFUfRYA4dRcv0K9ZCckRiHIAyKmEPUjYQWl?=
 =?us-ascii?Q?0P0ZEqxcWOLjpzpdfNI9s74cfj050qKBqXE7R0WaE04BpLtnsDt3g2GlBgUe?=
 =?us-ascii?Q?QWDQOhgNYcSELqr4Vyz3+41kwwe1KK7gyFre96DFU0T1Fk3c/x/i0SXGaGHR?=
 =?us-ascii?Q?s6BsCEbk9eH9/9Umcb49n4lcpem3O/QymFt4DQe6WYCDFv6Bl2ZwBw9gvswh?=
 =?us-ascii?Q?7o12EHp6WNzKB2r/ZSwFpphjv9adkdnx8KKgyudP4UPcTkYXCeKbLQIskc0i?=
 =?us-ascii?Q?5iF4xYNeeQH2mIitnZFY+OWbZ3bHWfuC7mWuXjxb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf15aff-3a74-4bd8-36e1-08dcf19c4123
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 06:47:39.2474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUDwxqoI+RPzjqhxmzsZhE4jFWQVjFGHVK61KN9JbFDBWqp/oStJTmYGWACUCdxluNxriGElQDCkdMk9wByL8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
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
index 91b72a1d5bb8..efef313b2dcf 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -207,7 +207,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-yavia.dtb
 
+imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtbo
+imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-hdmi.dtbo
+imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
+imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
 imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
 
 imx8mp-tqma8mpql-mba8mpxl-lvds-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds.dtbo
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

