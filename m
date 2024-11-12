Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DF69C52B1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 11:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD50810E5AC;
	Tue, 12 Nov 2024 10:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZdTfqyBJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2049.outbound.protection.outlook.com [40.107.241.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BD410E5AC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 10:06:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glynZ8WSDM3JbpSdG+2QaU0tnfhw9owzMdOfehxPWh93unk9iJzWdnU166FlXzt7QS3XmhmkvuNDNt67eb3R0Dwd7qW8zvbM5gw6CbzWSecRuidKT35j4JGlvwBSO1iAwIOCjZ2d26IQCFZsXtKKOs60WzywOWtzc3PSOOquDn0sPOcw456TlivopoMcR36k6d2JrvB8njIQyeu5R9jWZ3H46LoHg8+XQ0+kETTwQpyTTLZhxcVB/hctQY+zA7TBk/rxcDJbhg7NaABOpfVTL5Hw48AR0M2NOS1QP8miFwSZyit7moG+oIqo/jJsZjIVcHuf3fmxo2trDY8wFVRhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wz76/czXOIyAUXsPpq8BGSSQVqXZUrTtitXNwj+2qq0=;
 b=UPiuHXCp2ssEmcJQtXfvbg6Lps1LqbjJJnWVdTQwP8D+tPHfvrh8EIarotg7ntHKPerowfvXqFeCfC0T142KT26/mLbdXWL1cuTDme8l38KUTXR+Dt+ROpoYFEdEFm7mdzkpfZU09+gQir/mMeQcglAKdDQip26PIagCrpmaLXNmIONnjF9NrYOEl1Ek0vXvhVzbPZic9KJ5D2k19lig/eBdRd8EZEMzKhfM6sdRSRwWSGG8omw1LqDGYt5BQggeTeWnnL6duGKhC9DftdoD7ppwW2OV6EOxYUTtWs3OhhgLMVk/ECxoX+oWF8XGpyp3LChwlxoibnW5Fbgz9yTpsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wz76/czXOIyAUXsPpq8BGSSQVqXZUrTtitXNwj+2qq0=;
 b=ZdTfqyBJp668sD+Nac1yCTDvotiTumkWxmAJne+0UEyxdE6W2y/mu/dPBMpz8A25VjDAKJgGEdaet3c+G7t/3L/r9aNdEX5hiuAp5/CFv80OwhU6EFsX6wyg56IdlbutyH2/y1Vl5xQrMyOmhYS4phqZHb3d1g8I9ABYHCo7upA4x0UDxF1oGn0jhEnFmdXPynAQB4MaLy3+z5je3T9d5iVJOoDSOhOkF551K7MPBcVe99zl85vDhdWK3K7sXXAYK6fdgEHdq5GKNPbXE2vBOOayoltm7g6xfK66LZQ3TxbXkK9dD6uRlRJ+1TijqYynJUFj8YRA8FaNs8Wz8sjKjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7879.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 10:06:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 10:06:40 +0000
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
Subject: [PATCH v6 6/7] arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter
 cards
Date: Tue, 12 Nov 2024 18:05:46 +0800
Message-Id: <20241112100547.2908497-7-victor.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a6e98b-9895-4b90-9ae1-08dd0301b3ee
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k/Q6DPlNLfcfh0LSancEgO5zDncCxFWNyGdhpiZ2/zQiPGQMJARW0l0d21oi?=
 =?us-ascii?Q?6NC6lvtsVNHoMk/mbSEPN3nQ1fXgM19eu7BPdl0XgkshaPP48Mg9zHV+Nsu/?=
 =?us-ascii?Q?Va7TcTP0KASQmGmmr9bz+8TJyZaSx2T3b/57pIWSgtORghoRazuaIVFC/glT?=
 =?us-ascii?Q?G5+ws4bgmQatVAQwSpX1u/c7KraTweum6syqqNwFbj5mgVFGBm5RuiTl8Z0p?=
 =?us-ascii?Q?YKIxR2E5O3x8lbSUtcgHtD095uUzO1Q5r7amky/1uEUgFxoK4aK3IXzJW68N?=
 =?us-ascii?Q?pRHi3EulpTnlplEFUCSq1go8Py2AX2WSpLqWMKqPpSI90hdUm+J+63Q+FvjY?=
 =?us-ascii?Q?VAXEFijQF41huQ4Sa7bjTvjzMTQ/2sIKilKxGTVv7yXL//hfC9C6z4upVUft?=
 =?us-ascii?Q?cI7TqfEwBbRiqtoUu3yL5KZLT84uxd0hQrveSFzRbgYk0+T7jKBYyJW8ER2X?=
 =?us-ascii?Q?f+FNwoa4zPt7Cwl2mL5eFW3OQkbmMPN9OGB3yQ3354AhZfZSDKpHTX8PbLQf?=
 =?us-ascii?Q?TRgVmOy5tP88tJhLimqndHYSR/l3EbViFq9gPGuLNJ52uMjH2tPvTUPN5AUC?=
 =?us-ascii?Q?EJXIXFzQ07YEtJuwXVhtTixtoNbbJBk3dxWD39DJmx0wgJue9LwqPin+IevO?=
 =?us-ascii?Q?JDrbPxXhMAx8YBaiu8C/xMf3CrGQLruJrEtf8qDj51RTepwTOYl3DV2ve9HP?=
 =?us-ascii?Q?LUMURcEyOvxtcESjHnIbkm4SK1H4DIXgDlhpeVJHFISwccE8VK6wxR3e3WKV?=
 =?us-ascii?Q?DwP9vhr6FVr8Sl4o/ON3hBWZPOT4vEWB8IqPAdLXKXWLI6rtd/A8dfFUA/TX?=
 =?us-ascii?Q?TqIsf4xucf7P/NOivPp+gn1k41jNUwBukWNSUy0ByrQBLs+Sy3qvHDfPtReQ?=
 =?us-ascii?Q?2Tb7oQo/vfxXu62ukZFXMj/1XnQZAvPhumOSCZG4DWYyUjz41GNP6pNyjGt2?=
 =?us-ascii?Q?HPtU74wF1VRTnCiIdUDb292L8XOTxQAXjaKoccjJNroUAZEiPE8FzPUXdEmf?=
 =?us-ascii?Q?mPjbJXkAb0rlMvmka1rU4MSQ25h9Qrvkc0St6s28BJofL6sW/XyuQZitQgqj?=
 =?us-ascii?Q?vOhJ9Gy1COurAo2ali3KOaBSTChuiqsPQrTN8yzOLnNt4IchHScvE3XX4Z8z?=
 =?us-ascii?Q?qrDL7NCbVWJfkFA++1IcwwgTIvxMYXs4NzJGhkPumlqNIGWhjQEkDkw8azFh?=
 =?us-ascii?Q?6/i3Xf0MRr5JeFO0IWjLGcOn/5U5BWvMkBhXTQiEgSKDmMImCCjItV0GJjeM?=
 =?us-ascii?Q?/qWrK4YYXfv2sF1Il1T7MFWgadUxDQ84/WFyAIXeBCFd0xXqF2k5dt4vKK8Q?=
 =?us-ascii?Q?ndywsxwqWtfBHZ/nizfLyDnB3E7PnZt+KPWlw57RbY0UX5eXpuRpU2P2uB8F?=
 =?us-ascii?Q?9EH+q2scZy5/3qaj+5z6QQHrUhXX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L4vdBXWNNOzs2t3TPhOI3imrIYTVYrDJDKrFLf9W0k3/9w7Aq8Q51GxOjQKp?=
 =?us-ascii?Q?EXHGkp9uZZHt+YEVMx9i04I2iyJJ66BWxOcmuNnKYytAQd6V7LzcRAI85Jb9?=
 =?us-ascii?Q?rlysOKH6DquUtXYi3vGQHxoFogf3uSujltUl5VGmUl5fZLGzSaHj7Lvuzkqy?=
 =?us-ascii?Q?CgUYuZjlwEOz0CfA1KHH5x9r7g2wWKNCNoj1AES2VMyQ/7qYA7TRdTekSfk9?=
 =?us-ascii?Q?7wCFdPw3BH3mb57Tkxqlb0P8cGMmKOHbuJjWYpdWiPB7PV6NMj8ieJt4xC2i?=
 =?us-ascii?Q?oRLiER7s7+FCLrrVTUDmWdyz4tHynCkHbZOYsCeSiJF/l6j8m11QRGnc15n6?=
 =?us-ascii?Q?01fI9NRXo1Fr+qQVAg9HXM4gYOUBTEkqj8SJY24b+7x6Jl2cHGEufshk5fB2?=
 =?us-ascii?Q?5rnGA86ppmRTMutPaQvBALq+F65oPcqWd63bhF9fOXoQWMEkqxkvvGoNJpCG?=
 =?us-ascii?Q?BTfn4ipyqfG4rX5BhiMbI9AOiaXC9qDpkyT3lJS3hIklEAiNWW8/fFLieijd?=
 =?us-ascii?Q?gV5a3KArRPq1xajWMx6n+MLzUZ0OPnJuIdvkUPzVesy3ApkTl3L2qi2VFvPz?=
 =?us-ascii?Q?Miw0KWhXc0nP6YtkeBfPTb8+8vBQCNgLGfKbRaQBhbfz6Zn1HuKsfBbH3rQc?=
 =?us-ascii?Q?LrYGbzLfv/cfxp3Eg5GmoKuBNt5sQJSoEZW/IPbNjAc9+YJOByOWn1dKgXNQ?=
 =?us-ascii?Q?JYXd9zLBkW01biQJGqdqfOKucqosEDbCBfOyWE/OhMJ9FEG1mcIppenhjyCj?=
 =?us-ascii?Q?OuOPO743yppCdGtnLpwC33eYLtzqmqqrzDkwqBPwJ1UZVwpVKiN7vTw6T6MN?=
 =?us-ascii?Q?uq8p30ER/kXk4gcFe3nAPsbyQ6tHksAy32/ioUybCW9AKYyl99MTEzevUuqy?=
 =?us-ascii?Q?KfCErAdIFqsTbTLhvK2XsNW2Afe47ksqgPdFc+c3HoRWSSkGimfrF3c1lv6o?=
 =?us-ascii?Q?Riv5yElktXenYMtQ/Z20pitTUt19GPDroqGr+kMJ2E1IZThuWCUMZaRzwuyu?=
 =?us-ascii?Q?Kra/n9uEiYKtd96BxAEgJ8x/M8x3L2MnWAwlERS6bCiowJ25yoFwn5xMss9j?=
 =?us-ascii?Q?q0JBXezaK0X8Pucu6c5EviSB0CMzybx2Hj2Cp0I5WOGg7w9yilWBPxJWbvIz?=
 =?us-ascii?Q?tOSJkR18Hu7r+qjX4PT38CbYrxZyNsysGhYL8DDzfk0OXEeGbrtENkY1FRmK?=
 =?us-ascii?Q?MPPvQnie8zjPu9sdaAUWWYOuSk2aAoLpP7RSMsqza8JV25cVnd2CKlI+TtGL?=
 =?us-ascii?Q?83K39qJUg2q3kZBnT/DkaIOE1tVzXcfkzvvrJ04URs8+/jOFGzpDCv9N2/GG?=
 =?us-ascii?Q?cgfCKTyB4lFg0J2/VP0tYqQeAH1Y53bpGyPjhNindqKVRYAE5Ja3HXTzIr74?=
 =?us-ascii?Q?+8pRc0iqi8qYlUAjMZ7lEYo9nKeS+1JanDRPPwFoBBBdDeTR4dsYvHalWhrU?=
 =?us-ascii?Q?Xbe30VLC/sDja5ejpfxzbPRCzEX59hdS+Hk74hHp6CWGDISxtzxmdxM4Mh2N?=
 =?us-ascii?Q?rZFi/EGxl+IbfaCdemCxVJgWl5iEbWg3yb14J386IPALE1oTQ4C9weSdLA66?=
 =?us-ascii?Q?AAjiYj06i/0u0sYV/JL6y4+mZ5ARFOVYkZ5j7TKf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a6e98b-9895-4b90-9ae1-08dd0301b3ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 10:06:40.7493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmchHrMDVGUfepJ3hziRa35MbUgPYbMmuaL75hFWOn19aHnbDeg+Lo1YSqPMHdOc0f1U8VKS9yeIxfffx0P+sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7879
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
v6:
* No change.

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
index 42e6482a31cb..e2e828b352e7 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -211,8 +211,16 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-ivy.dtb
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

