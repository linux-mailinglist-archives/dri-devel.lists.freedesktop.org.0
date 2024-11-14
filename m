Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF29C8369
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 07:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBC110E79D;
	Thu, 14 Nov 2024 06:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Nc/JCm89";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4124010E79D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 06:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rasy45/llKKmfa5JUUFDF2XMncLIXcKNmKK60iw764oSC1tIb7FphccTOX1lb7ZcrGZ56i7jIYiFBxxPqSbfU6xaykNVX96NnOg3NBz91jJCdZC3wIp5DoWWkffUaMLImkIl9lStz09NyWGuPr6oJ1zdeHBx8C8unLS0zpLI3AYhKPz39MIdIulleZMgBTtYMdNklKfRRQtb8mif6HHAz3zhFQcJB8BjXV5H3sPPW4jR/XCQUqF09AHUkUasitrC3SgkXQQZJY2Jqtv1Sh3D8/jHPsWtYG9LwiWCkmLsMJtkJy2zM/Bo7MrqZKwRA8oTQeoW7k3K9HD+xY07CG8qQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQoLLMELUK6qwz8SrDwOfCPuBwAAblGh3ab8Fo0eZno=;
 b=NYlZYViAPQruCxxrdSdiNUX18DL3H13adO+6IAuMBzQRRinWRECx+Fa0NGiXYC6fpRo5+4y6A/k6yeuJtkabiBGjRErjJMzUNruyW4v0akEZ+SP/7E8rKjM8wsFunzAqALdVgLhuX0RtKcvUjtffVP3/AwmLTOE8hCaHD+hdpEFu8SYMYFQjX/GfbJPE7wJlFltRkNbMIwDRX9T4NTGG5n6A8MhUD7NxdnMXJo2FBjUhIgCXOu8nHpDI121NszqevjPtJsUvmniq8J8w8Sn3D3npXe8lNF0+2g66GiwVhaHhP4HsbPBjCG36QE3XwErEZ4GI0u420dYRSOkw9zEQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQoLLMELUK6qwz8SrDwOfCPuBwAAblGh3ab8Fo0eZno=;
 b=Nc/JCm89AIMxTx/JOKIloAdA1Zj1Qssge1vT6qrf3DMWpVst4u9YR1iLqgGUzBbgxIvOVaQaGMly64rfYJmzDPw7050NoCw64NBy1qV6RhafGgNN0aWk9cXaRkAuHgFGxDVsXenuu4LmUb3Pww5U0Jyt/6SSPRclyM6Nnscn96ZqqOxugH5+saL0BSJyCwFATvZrK+t6+TeIbGwMfak7hZRm09qZmO3xKUPTVjr4He2Wdb7K1tJlB7I/ISqDpbjdrWmW6kGpLanjEE29nWDqnLqnvk+ZPs2puk22MkxIh9ppiXAoBcIRb+nHLykjiKQLe9gVhjMHHEmVgozRjPAKxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 06:57:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 06:57:42 +0000
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
Subject: [PATCH v7 0/7] Add ITE IT6263 LVDS to HDMI converter support
Date: Thu, 14 Nov 2024 14:57:52 +0800
Message-Id: <20241114065759.3341908-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0048.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::17)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 770c6375-65d4-4d49-33a3-08dd0479a2c1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k8KM5NkI6x/KQ9ljCjUvvdj6QWhzNAVWDjyutUew8ftCa16oOpeV1+TRE50l?=
 =?us-ascii?Q?AF+5vq5Hz4AA6H8Y6ihc9VGgaqC1iA+CNAZcAnw6DazzQjV+h2c6/7CvrjWg?=
 =?us-ascii?Q?uouKVSpmIA4oPcziAgFN6QKYK/XTUQ+xny8X9l5cRUDUFrTwq31rVDyZjcOB?=
 =?us-ascii?Q?WFs1Pqlytv/Rb829wPZbkefmXpG+VbgrL/ZjDtp1cXwCpzJMCx7GZFelTJfO?=
 =?us-ascii?Q?4Rdl8Qz5+IQi6jIX7SEiZFaseuwFClZ6DoURXM3L7ZZMynsuSMLAIaxZn2AC?=
 =?us-ascii?Q?ds2r6ZE5UiZYek5clW2BBJAsbgMDXfu33QRgNSfidh2+maBGpBa9SLgMG6vv?=
 =?us-ascii?Q?1fgdq9Q6xgVNRYqV/dwUaOVw/pRXIKHc/BH4Ub/3cc1zF7qUqG54tRqBqkMc?=
 =?us-ascii?Q?bPRyprjEVZbGNFeVRo/qGsM6xDock/HygOcZQWwI0nqcPU1P6IBuQeYbfcyT?=
 =?us-ascii?Q?3pwUMU+kntE8499rxFU0A3pPdfmSojmt6LmNIOTE/c3F//KtrOn+oIpWJuhD?=
 =?us-ascii?Q?csq7nEuamyvmNXfDUSq/uyHCt47nbIejmDgSiU/iaXMSYN9kcMoeBVGRcapt?=
 =?us-ascii?Q?f1OoLwol79ra/TUa1gi1tZSix+Dytu7qYJyRh5bfNeemWrHQ5zSgxE9PzDPn?=
 =?us-ascii?Q?GxJaigbNVR76xAmdopTaJIZ4xMYsqq6vRAPPyHYcoAZlG6gfYK5ipKGzuJcr?=
 =?us-ascii?Q?8pVo+WOP8PA3UWUdSetGTnhEyd1MIjfleoO4tCdhQOvWssF1vHm9yAxLaV0m?=
 =?us-ascii?Q?lSkrNJJOAk2VzT3YsjrHL0spn/wilAe+b1YBQxZx9YWYu8FhI+srt7Y3ypoh?=
 =?us-ascii?Q?/pCgs1h5w0iTNKI03w5L8g3bRF2CdnqrTP3y7zqAsE2E8z/mcE3JP7XYoKrh?=
 =?us-ascii?Q?qtxjXMBg7CY09YJCbWeZcB8tmGAO1waBH+zNO6kSuOnT65EYostLreDVYIHv?=
 =?us-ascii?Q?bfySUa8Jm5izlGXFX8cjqpH/3a5Oqf5KtlgMz6loGSN9/xTwSNQ45Q/O+YDZ?=
 =?us-ascii?Q?uvgbaZnEWmWAfVayFN1W/gTWWr2UCZebC7iOrpBgNecSgBzWT/R62srm7nIp?=
 =?us-ascii?Q?UDCbCGI7axbTLcfnAOaTuNOATS6lFz+bI5W6t/mrF/bClTT2lmcBmIYOO31Z?=
 =?us-ascii?Q?B3j6usZWLVejVipfTdVpwXONG6/lBWZEq6GE52lFUATE9KVLxZkeBkCCDMC7?=
 =?us-ascii?Q?F6W1iFVrf/QeoHeA6tEaPHFxGBB+LdH0wCroB0w2CaORXFm9qaLfNToFCaRw?=
 =?us-ascii?Q?mSxAI5M/xZm/ANgSzraC63HDsOrbSKc5YudF54FG4YPAyHDA4nPBxHNPr1Es?=
 =?us-ascii?Q?gXCDEOtOinjQYWCHyLgtGM8d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TOgv3g7dLU5ENzK63PLmA6Qibd/79q5Nc5MKEqGMy+yrPy691Up2FDndrJGU?=
 =?us-ascii?Q?eo0nj1B45D7CbnwCHf/CyS6/d1zC2J/5ARK8vpIFJu29kLTw16tR4HvGTYU7?=
 =?us-ascii?Q?osT7qXl39Coul/oOaL2tZVyiXpGj5S/U/bvgH24U3Kmzjg094fPT2m12jB+U?=
 =?us-ascii?Q?ljAafSkjShASkB/8NKLxNuX2svH/PpaMhJxmSkP8nHtdlEj2CgumHbeSarGQ?=
 =?us-ascii?Q?FW1qwOdSRicp+QRxBGaejTU9hbdlC/bGmirJcKCTssOgacLlpTE7Pqq4j+WA?=
 =?us-ascii?Q?0Ro5GUevt3nmznVHBfG7qa+9jL0tQa/zBXUj1zFfeJbFODfXfaCXAJ1IjVUF?=
 =?us-ascii?Q?UUwkJ7YmkX+s5scqVQeUzE/WaQdXpQ9xy1ISAKH4EWcvzTqFKqDlbdphtmWX?=
 =?us-ascii?Q?lfZUtvFASmMoNEXqmGZTvXzIWs0YSa00h0jmi29pecn8+MT1gTl/261ZsQSF?=
 =?us-ascii?Q?RBvuWmeCjuTaHk3mAaDT27O5NkrQZkutiS9ZR0BCTOcSUtmFnfp4CrHukaqK?=
 =?us-ascii?Q?WOLviYSjYSGPEUgFUZiJTHinF8bClQrx9GmlVGq0LJWqlpwD3w4zJZEQd0DV?=
 =?us-ascii?Q?kvQ1+0BRplGLVFuU3Adh6ihgYHaNiZmCH3OuGz7+dra0tAgpBiB3AfPev9nu?=
 =?us-ascii?Q?4W8u/Q5CT+isdQalq5EWt4cVikaVwKHHc6AISZvzKeYDY6fBTrDfqAsTkG7W?=
 =?us-ascii?Q?CxAk6ltlH2zWNvYeVVOrfw/TbyIepP5ayT9h+UIs+kQFtF0UKOzD3jS6l8KR?=
 =?us-ascii?Q?mmcmXPpbaNxFI1ZDTVJIg3VqtOQFJchvcudLRXx7EzfsckoW3GvcH1KGq4da?=
 =?us-ascii?Q?uBa3YJbVkX9O8RVBOwHCbpfQyCdlG1ALhTlYatMuh5bobl/PlqdJ6HKfWwzs?=
 =?us-ascii?Q?tkV3lGoqRloefd+GO4OCLeq4svS03JWtQN2hdSxAdk+SCeNU1S5Ds5lUPcmU?=
 =?us-ascii?Q?ZGZv0lybMEOLw0mHnNHXb101c2p34Q2nP3zbC5xpMvb3kfwIj1m8EWgXO24k?=
 =?us-ascii?Q?bJhBZeH2QJ4tGKVAIhR6TwBbuDLyIQbDnzeBI+I4q6KXDNkGTxumTu8Lq8m7?=
 =?us-ascii?Q?ncM+Vk2VbCaJ8tBXyIN+OQ0MwymDREBcr2WEQeAGzQejzC+menbAPSupQRox?=
 =?us-ascii?Q?vkySAnYp26KIy2Ywy0HEOqrDFN50qh1AKb72M5XQGwt11iFpRGa4vB2UxfVg?=
 =?us-ascii?Q?TUYgyCs1Gx0TsJFf7P6qwjrzDs3jJ5CnweEBrMbGCM8yCgb4gNJNsGU7/NhM?=
 =?us-ascii?Q?h4IkJjLW7xD3xqjHzf3Xqx9Gh2vaZxthjAdyNI0J+msr1oXWC1qkRbf7OPvb?=
 =?us-ascii?Q?7NXVoSBo10KHDDKhCRAqg8MAnvsSPS1o2tfBUVi5Gh8oppx5M+2898ydF2aJ?=
 =?us-ascii?Q?IkA4XnW6S/+n41iF+VTcKeOwPHJsAW5WFLAOI15einLWfwJqSRf1urI6EbBC?=
 =?us-ascii?Q?Kjh1WmZcjze8qNepj4V7WBWkwBOygLYJy2GgCpZ3ybmQtAwEUf6KNWT0x1TQ?=
 =?us-ascii?Q?QlQCPJljjLMjMv6pfgO2zrbg+nWIQsxpHMIjfNwu9uqoUsLYqnQ6S+ZR6sLn?=
 =?us-ascii?Q?f0k/UD8PoB+gQlfHPTZz1Wcm5VwqRneQ5O3NHzxp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770c6375-65d4-4d49-33a3-08dd0479a2c1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 06:57:42.8955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Zfe5cupvE0xR4pUi38G/WLGxr7/YvnF0IX+YAmLxw7i8RZ4rz7RuRtyRwVWxv6tfgz1IzLL5vfiYqSrl8ZCww==
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

This patch series aims to add ITE IT6263 LVDS to HDMI converter on
i.MX8MP EVK.

Since IT6263 DT binding and driver were picked up from v5 and landed
in drm-misc, this patch series contains patches almost all i.MX8MP
SoC/platform specific.

Patch 1 is a preparation patch to allow display mode of an existing
panel to pass the added mode validation logic in patch 3.

Patch 2 is a preparation patch to drop CLK_SET_RATE_PARENT flag for
media_disp{1,2}_pix clocks.  Patch 5 depends on patch 2.

Patch 3 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
the next non-panel bridge, that is the IT6263 in this case.

Patch 4 adds mode validation logic to i.MX8MP LDB bridge driver against
"ldb" clock so that it can filter out unsupported display modes read
from EDID.

Patch 5 adds mode validation logic to i.MX8MP LDB bridge driver against
"pix" clock so that it can filter out display modes which are not
supported by pixel clock tree.

Patch 6 adds DT overlays to support NXP adapter cards[1][2] with IT6263
populated.

Patch 7 enables the IT6263 bridge driver in defconfig.

Note that patch 3 and 4 depend on patch[3] in shawnguo/imx/fixes.

Since this patch series is related to another one[4] authored by Marek,
Maxime asked for a proper description[5] about the exact problem.

Admittedly, it's a bit complicated.  Here, I'm trying to do so and explain
a bit more.

[ Description ]
It's a clock problem about shared i.MX8MP video PLL between MIPI DSI and
LVDS display pipelines.  The pipelines are driven by separate DRM driver
instances, hence there is no way to negotiate a dynamically changeable
PLL rate to satisfy both of them.  The only solution is to assign a
sensible/unchangeable clock rate for the PLL in DT.

Admittedly, sys_pll3_out can be another clock source to derive pixel clock
for i.MX8MP MIPI DSI display pipeline if a particalur i.MX8MP platform
doesn't use audio(sys_pll3_out is supposed to derive audio AXI clock running
at nominal 600MHz).  However, for i.MX8MP platforms with audio features,
the shared video PLL case has to be handled and it determines that the above
solution(unchangeable PLL rate assigned in DT) has to be used no matter
sys_pll3_out is for display or audio, because the separate DRM driver
instances really don't know if they are sharing the video PLL or not.

[[ i.MX8MP Display Hardware ]]
i.MX8MP SoC supports three display pipelines:

 -----------------------------           ------------------------
| imx8mp_media_disp_pix_sels  |         | imx8mp_media_ldb_sels  |
 -----------------------------           ------------------------
|  osc_24m (fixed 24MHz)      |         |  osc_24m (fixed 24MHz) |
|*-video_pll1_out (video)     |         |  sys_pll2_333m (sys)   |
|  audio_pll2_out (audio)     |         |  sys_pll2_100m (sys)   |
|  audio_pll1_out (audio)     |         | -sys_pll1_800m (sys)   |
| -sys_pll1_800m (sys)        |         | -sys_pll2_1000m (sys)  |
| -sys_pll2_1000m (sys)       |         |  clk_ext2 (external)   |
|  sys_pll3_out (audio ?)     |         |  audio_pll2_out (audio)|
|  clk_ext4 (external)        |         |*-video_pll1_out (video)|
 -----------------------------           ------------------------
             ||                                     |
 -----------------------------           ------------------------
|   media_disp{1,2}_pix       |         |        media_ldb       |
 ----------------------------- mux+div   ------------------------ mux+div
             ||                                     |
 -----------------------------           ------------------------
| media_disp{1,2}_pix_root_clk|         |   media_ldb_root_clk   |
 ----------------------------- gate      ------------------------ gate
             ||                                     | (LVDS serial clock)
             ||                                     V
	     || (Disp2 Pclk)  --------      ------------------
	     | ------------> | LCDIF2 | -> |       LDB        | -> panel/bridge
	     |                --------      ------------------
	     |  (Disp1 Pclk)  --------      ------------------
	      -------------> | LCDIF1 | -> | Samsung MIPI DSI | -> panel/bridge
	                      --------      ------------------
                              --------      ------------------      ----------
                             | LCDIF3 | -> | Synopsys HDMI TX | -> | HDMI PHY |
                              --------      ------------------     |     +    |
                                 ^                                 |    PLL   |
                                 |                                  ----------
                                 | (Disp3 pclk)                         | |
                                  --------------------------------------  |
                                                                          V
                                                                    panel/bridge

* video_pll1_out is supposed to be used by video outputs.

- LCDIF2 + LDB can only use the *same* video_pll1_out, sys_pll1_800m or
  sys_pll2_1000m.

[[ i.MX8MP Display Drivers ]]
LCDIF: drivers/gpu/drm/mxsfb/lcdif_*.c
Three LCDIFv3 display controllers are driven by three imx-lcdif DRM instances
separately.

LDB: drivers/gpu/drm/bridge/fsl-ldb.c

Samsung MIPI DSI: drivers/gpu/drm/bridge/samsung-dsim.c

Synopsys HDMI TX: drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c

[[ Problem - Shared Video PLL Between Samsung MIPI DSI and LDB ]]
osc_24m, audio_pll*, sys_pll* and clk_ext* are not for video outputs,
because:
a. Aparently, osc_24m runs at fixed 24MHz which is too low for most displays.
b. Audio subsystem may consume all audio_pll*.
c. sys_pll* are system clocks which are supposed to run at fixed typical
   rates, e.g., sys_pll2_1000m runs at 1000MHz.
d. sys_pll3_out is supposed to derive audio AXI clock running at nominal
   600MHz(i.MX8MP data sheet specifies the rate), see NXP downstream kernel:
   https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx8mp-evk-ndm.dts#L19
   https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx8mp-ddr4-evk.dts#L25
e. clk_ext* are external clocks without known capabilities.

So, the only eligible video_pll1_out is supposed to be shared between LDB
and Samsung MIPI DSI in the two separate display pipelines if sys_pll3_out
is already used to derive the audio AXI clock.

With the shared video_pll1_out, drivers for the two display pipelines cannot
change the PLL clock rate in runtime, since the pipelines are driven by two
DRM driver instances.

[[ Solution ]]
Assign the PLL clock source(s) and the PLL clock rate(s) in DT.  Disallow
display drivers to change the PLL clock source(s) or rate(s) in runtime
including LCDIF driver and bridge drivers.  With sensible PLL clock rate(s),
typical display modes like 1920x1080@60 can be supported if external HDMI
bridges are connected, and panel display modes can be too.  Also the unneeded
CLK_SET_RATE_PARENT flag can be dropped for media_disp{1,2}_pix clocks.
If needed, bridge drivers just call clk_round_rate() to validate clocks so
that unsupported display modes can be filtered out.  Although the
unchangeable PLL clock rate disallows more potential display modes, the
solution works for single/dual/triple display pipelines(OFC, hardware designers
should pick panel/bridge display devices carefully first by considering clock
resources).

[1] https://www.nxp.com/part/IMX-LVDS-HDMI
[2] https://www.nxp.com/part/IMX-DLVDS-HDMI
[3] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/
[4] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=896900&state=%2A&archive=both
[5] https://lore.kernel.org/linux-arm-kernel/3341a6a7-ac0e-4594-a670-b3a6d583b344@nxp.com/T/#m587e6a25bdab542d5d99abbf01caaca89495b1d5

v7:
* Put pixel clock properly by adding a dev managed action in fsl_ldb_probe()
  in patch 5.
* Collect R-b tag on patch 7.

v6:
* Drop CLK_SET_RATE_PARENT flag for media_disp{1,2}_pix clocks in patch 2.
* Get pixel clock from display controller's OF node and validate it's
  clock rate in patch 5 instead of taking the sibling "ldb "clock as
  pixel clock in patch 4.

Liu Ying (7):
  arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set "media_disp2_pix"
    clock rate to 70MHz
  Revert "clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure
    parent rate"
  drm/bridge: fsl-ldb: Get the next non-panel bridge
  drm/bridge: fsl-ldb: Use clk_round_rate() to validate "ldb" clock rate
  drm/bridge: fsl-ldb: Use clk_round_rate() to validate "pix" clock rate
  arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter cards
  arm64: defconfig: Enable ITE IT6263 driver

 arch/arm64/boot/dts/freescale/Makefile        |  8 ++
 .../imx8mp-evk-imx-lvds-hdmi-common.dtsi      | 29 +++++++
 ...8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso | 44 ++++++++++
 ...imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi | 43 ++++++++++
 .../imx8mp-evk-lvds0-imx-lvds-hdmi.dtso       | 28 ++++++
 ...8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso | 44 ++++++++++
 ...imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi | 43 ++++++++++
 .../imx8mp-evk-lvds1-imx-lvds-hdmi.dtso       | 28 ++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  6 ++
 .../imx8mp-skov-revb-mi1010ait-1cp1.dts       |  8 +-
 arch/arm64/configs/defconfig                  |  1 +
 drivers/clk/imx/clk-imx8mp.c                  |  4 +-
 drivers/clk/imx/clk.h                         |  4 -
 drivers/gpu/drm/bridge/fsl-ldb.c              | 86 ++++++++++++-------
 14 files changed, 337 insertions(+), 39 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso

-- 
2.34.1

