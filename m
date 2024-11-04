Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 586409BAB43
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 04:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B2F10E359;
	Mon,  4 Nov 2024 03:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="miz2Nq6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2061.outbound.protection.outlook.com [40.107.103.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4629A10E359
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 03:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mux00vnXQVzX4rPmtkP/qhJUQGeDTIyQS1FdYuEIC5nWyIZqO36myyGJd7HBSWbkdKJYblpI37ndEXj2WtJPVH4gklx+4Uj589cxdI2MOuAauFATqUpmdRXTpLNwS/TLYi73r02Bnn8Uwqsg8UX5Hf3S601zKARfsb6bMGFMgoj1eml0oIJKCmTu94EcwYApQmNQaoY4Y2KvwmFyGWMWKi3cBmX53ij+7SJDQssrr1XbAL71DF3fsv8BQXSsrsFYnem9+B5ZH6VIy4T/7Ygmytf8oxzKgWi1d7tM5C0RW48sWzlchB+L4mxiOgkDSwhgbWdlWHW7YNClV39EFslBsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KFZ7gfPci27VMeiVXgC6lAJFf3NowklCctn7LuqAgs=;
 b=bpHVm4hU3f1AJpAn0FqxUZxQT2rpc+xdxbpvWncV/iOhZKCR4J8CoXRaVuLMXDu1ZthfaBxTQ5ZSAsgjxWSyt6FuL2ZHWdKXnoUbR3nDFc/YqQ2QjcPSmDL0E7Yx1ZwQHn9PlRsyd4FVNaXTnaXxZsNQ6LbPTLtW9RaSzk9dHrw3otWlALPFAqHw24D7S8SauokP5rP3ZKq1NpEk71SJTubZxcX0foBvEoXwDB75F98/uP9bJi1dN/UmgbAfn72dlf74We46cLbYtJN62n7Hruv0MC6ipbt+Cgl8Gnjg3BzS30u3NrC5iOwnS4LVzPLKX0x0l29xUxTgoHUumrnywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KFZ7gfPci27VMeiVXgC6lAJFf3NowklCctn7LuqAgs=;
 b=miz2Nq6f2+YdOXHekP4oL0RPTgCTJuqmUUyyoKb1bE2x6kJ7BGAkQ5dKMPsfbgKiVi6NRBy9M7Ti2iJmExP5u3NGtmfM4OlqqRmcTvJGvzWcK6KHv0bPnRoI9Na9P6OI5nLDGPQja7EFCCesKtNlHCWrr0iGYxg9gz3bXjnjHzFabPamvKFNi/0tCph2jEE9nfc0/KJIvotQZoyh8S65MZT0saV+utG5nAIMMxhRS7q9p9bmdtqxSs3XLzpu77s7Ufd11VIDveKKzQwRAOKW/PUCLE6LvHyF0RlxFncfj9q43b6jGuSucxYYRTSt6/afXx4T5AJng/XhnjOJcuTeMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 03:28:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:28:23 +0000
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
Subject: [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter support
Date: Mon,  4 Nov 2024 11:27:53 +0800
Message-Id: <20241104032806.611890-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::28)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: e36e87b0-90ec-482c-0794-08dcfc80bc8b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M1ff186rKQ7/PhqilJ6pzfrQYy44YEugJiMtmeOyn8xJ2zeCeETMcvvJhLmk?=
 =?us-ascii?Q?xV1R4jDCwTAbK/bNTOsArBhrZ1oQoFrfhDDbX7RJjQf/8IgybmVBL4zEoWUU?=
 =?us-ascii?Q?Gl6FOynDfkbbpUX4MEp6e4Udfz5RbIt5qnqQcPQA+RcU5Z0oRgyzi/q/BaqN?=
 =?us-ascii?Q?9tPJq6ciwXTek6stpotP0QPP6Ksh6yMkYy5hiaMtU4WhVPgI1o7Ob4Hsbu/X?=
 =?us-ascii?Q?gA4IGGMiZa1Ibv4XJPEQjH0uqHqq+dWkeqeiYV1pQjT9JxbSCwCjSXA2WBdJ?=
 =?us-ascii?Q?S0N6xZrLlY0LD8sZX+lt3v4v1Q8brlYrpznrMDHgvI/2Ws03bU8L+el3RCoV?=
 =?us-ascii?Q?x2WyUQW8NlcliqjyzIaSuuC/JjZeOJrxnA2y15trVOOznWWDu/eY1TOGxSuX?=
 =?us-ascii?Q?udMdFPzasolsQzDqn2RMOvpOlnUolbIeqnLC5QXkUBOcNdT22ZDqkcfnUdJ1?=
 =?us-ascii?Q?GgkTeafPZDXB1XEtOmX7p9l4+H0bcvDa4Xkw2TT5fudnN5/48ecFtiHOp6nA?=
 =?us-ascii?Q?VjjZzK39gn7RpmEfwmYCGhaObC7ckdxWGfqIVBRyS9yUO1yFTPQ8m3kr8p9k?=
 =?us-ascii?Q?w/NMP7iypv0LKG2jPeIhWgrbYHssd0pjBVEY0bUPicXDVCnqt8M6ffYcncjI?=
 =?us-ascii?Q?2trlRbF0NxDq7Q4gD0/5f9MWtF58k4Kpncksf8FcgW0iA27YMdqqQdzw+/Co?=
 =?us-ascii?Q?Lwyuqw/2BazdKH/kPStOfwfli4Tm7auSUu1WupEnhuUekMs1EmCTGeYYOMnA?=
 =?us-ascii?Q?NFxrJtBN2k/sP6o8ZZNQoeczqFF219b2dbVgxnb5Ks0GFoR1NvpaYRHPbv0s?=
 =?us-ascii?Q?cz7sifhHaGf3fIYD6lNvW9FHLCLtR5elcl5wxwy5oMZH/N+b0Q6Uef6TQdHT?=
 =?us-ascii?Q?lpgRKNH29ircVyYJwHXYWprS7UXeg7giTg+1pUw7pDOVdJdWAn+rVxON96o3?=
 =?us-ascii?Q?I3E+p8vJfUPwZfowP9m/GxeLKHC+QLSoqO4et5QiCvOekraILQ9jXypwPVUe?=
 =?us-ascii?Q?lAF8dwgrvQ5IU8oji/fm6ZFT6buDAofbLXV/6lOUCSnugCOLkLejDWuAPCqA?=
 =?us-ascii?Q?/HpjUpTSDVuCHimDh3LcxaiNW6LuqhAAZTbLwZ9BVhQLyn1SOIEPnyiBN/Dx?=
 =?us-ascii?Q?MRL4ng91YUisI2wCqrgs7wnGXv4vrh+ux5lOtOhHRMWBCVruLni3UiJw6PpX?=
 =?us-ascii?Q?Cc76vmmA4jeiGt4FEK0oZ+Go3mqGHKqUePU0OsvxPvX+f9hzTiTc+E87ikXh?=
 =?us-ascii?Q?DgUSlqvgA3Ydfd/YaO3jKA4s8kiu558szr5RXxdRvsZKpzEqsONuLx/p6f9i?=
 =?us-ascii?Q?LZ01sBkt4qt73uBaD4wz2oxdKJj/nLthg7MAPqtYrf9iSPYgtdbGaZGC4jYq?=
 =?us-ascii?Q?OQQGroUNqkUAZWJPwmymtpijY4wG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AO0bMu3oUUfZftemyEYLlEOSVCdONQFlxm2VY4h8hy62pJid8yAYIv98iO+P?=
 =?us-ascii?Q?6zDl8GlErcVR4fD8Db7WsCKYtxiD/GF1gHLiDSXf/udGJgrDDOnVukOfGI77?=
 =?us-ascii?Q?gaQm5h9U1j0zIT0MRDYiDk7qUspTMbrZYqt2jGrxiLVx/i/GzxGtBKzTFa8v?=
 =?us-ascii?Q?VmcbeM9k6qRNjpkU6L2D+gVTx5Voe9X5Ag5Q4gGsm/1K041p703o16Kz26Kt?=
 =?us-ascii?Q?51jRzA6buu69rL95QYTw37Ld5O8AO5muFaDbcHkvyuQuyHrquHJ8dTyqPs6R?=
 =?us-ascii?Q?+/Iu80zp3MimnNTFbopAcD7LuhaHB0sd3H0y8HTdYMhg1fNT37kTXvOrMntN?=
 =?us-ascii?Q?rzozi8oNT8LbN0uZRK2TYsTBg1llDI2mHHclH4C2hJUWHnN8Rscas/eVrVuy?=
 =?us-ascii?Q?a10Fs4O3an0vyKmFqy+eP5l3Q+ddackaYDW4jQ3kGm+wVeSKh4+oxzNd4Hn9?=
 =?us-ascii?Q?D44A4153F9D/c47bPDzEPLlGPOE9UN6jafY1ZT3+gJpc3csHvFARXLj+EcAr?=
 =?us-ascii?Q?Wto5PHujyyrYhN7tCNirihv30pAx/ZoN+fqA1uAHk++R9OyRl6y8ec9XCV/c?=
 =?us-ascii?Q?KBCrhUbQsmaU40qSfsFxtWOwb+IwZYlXCfHXzeqUR8b0rSh2Ab4LXN50hkPK?=
 =?us-ascii?Q?uAE4gCw9n19vcQMcPRnN9k19uKBm+9ResW/9wiqhQjFLCzm4VWhZ9N1Nu8B6?=
 =?us-ascii?Q?Vi+Svqs0xJtBcV8xJRH7o6gQ1yo+EPN3VdQE42XUYekSszsLiu2iApecBWKF?=
 =?us-ascii?Q?k+aU8PouNBh+zrktPZuptizpxSScUUo+LxW4IeKe7+/n9VVwMUl4f5S/J1hL?=
 =?us-ascii?Q?Q71cmZJ8fGrkje0j7tCE/lx3hCG8zvbTCuRzU4Fqw3dWGYYLWTCfXb7mJxpq?=
 =?us-ascii?Q?aKo5xKT/rTGO/73KOGVh0HNefDHWwQ2e7PivKq4N0T//Zqu1x/dCTUuPiB65?=
 =?us-ascii?Q?WEwFqKM1j76NFhnU1r4wzvscGQ3LPTmoMDGBbfmhHEyetLnbyJ++lKNYqmU3?=
 =?us-ascii?Q?gd/WxgMvOhOrcrJEOuyhro6Y17+RKZL2Nw4Hkj/gdViITtCUu1d71q/MnOJy?=
 =?us-ascii?Q?Uu9rn8PCbPvF1qMi+dym+3RcpsOYk8ZooQI6WfFirA7pGKvyvSwSaFGT9y+P?=
 =?us-ascii?Q?WjSjIA7KJoxW7tWl8sR5L/4vnoN0V7YjPz0mCF9m4DhtuXy6xR0OG67Zz7Qb?=
 =?us-ascii?Q?0IBOWNdzjqYAqEPHZuBhk3qdeSPjDzpDJQIlK0/wDqzIeGmxuFg0Y0yJ+49t?=
 =?us-ascii?Q?KpWGg0HN+imHsr9qD63//Fc9xG37Ex/Vyc3noHEYfLnzvpjAC3PBzH3mcoex?=
 =?us-ascii?Q?e4kvTomLpS+c94TCxvRTNIgaJPiucoHz9PpLGJxCxo4PZoMW5+QoSA2gPX5n?=
 =?us-ascii?Q?eBCgannZiu1DiIF1XkxqNyjqYeoTWtETBL9V6cAJAF2m4VLeJ+RoJ2ns/ZyG?=
 =?us-ascii?Q?3mH2bFA1FBW8074Ye41bnEJs1uFf2MdfxUI9zmPBQUCkSgDhxrXhKYxVszna?=
 =?us-ascii?Q?l7TpOt7Lx//lM1twdpjF3uY+8srZSwQDKUvRVjQw/DLsuDJXd6mHxsXPNVIf?=
 =?us-ascii?Q?/Z5mphEPlGNIUwFq888bFjU2wN74BmddI5/I2GP9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e36e87b0-90ec-482c-0794-08dcfc80bc8b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:28:23.1054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpBYzPJQXUf6/sVQwvzx76rrnG0arOea4ggPYEJ8i+OaIyyUj2uG17ZsVqLw8XXAgpZL1/qfRHgJeQVVyi7xFw==
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

Hi,

This patch series aims to add ITE IT6263 LVDS to HDMI converter on
i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
the IT6263 supports LVDS input and HDMI 1.4 output by conversion
function.  IT6263 product link can be found at [1].

Patch 1 is a preparation patch to allow display mode of an existing
panel to pass the added mode validation logic in patch 3.

Patch 2 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
the next non-panel bridge, that is the IT6263 in this case.

Patch 3 adds mode validation logic to i.MX8MP LDB bridge driver against
"ldb" clock so that it can filter out unsupported display modes read
from EDID.

Patch 4 adds MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} support, as they
are supported by IT6263.

Patch 5 makes drm_of.c use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG}.

Patch 6 supports getting dual-link LVDS pixel order for the sink side as
needed by IT6263 driver.

Patch 7 documents jeida-30 and vesa-30 data mappings in lvds-data-mapping.yaml,
as needed by IT6263 DT binding.

Patch 8 extracts common dual-link LVDS display properties into new
lvds-dual-ports.yaml so that IT6263 DT binding can reference it.

Patch 9 adds DT binding for IT6263.

Patch 10 adds IT6263 bridge driver.  Only video output is supported.

Patch 11 adds DT overlays to support NXP adapter cards[2][3] with IT6263
populated.

Patch 12 enables the IT6263 bridge driver in defconfig.

Patch 13 updates MAINTAINERS to add maintainer for IT6263 driver.

Note that patch 3 depends on patch[4] in shawnguo/imx/fixes.

[1] https://www.ite.com.tw/en/product/cate1/IT6263
[2] https://www.nxp.com/part/IMX-LVDS-HDMI
[3] https://www.nxp.com/part/IMX-DLVDS-HDMI
[4] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20241017031146.157996-1-marex@denx.de/

v5:
* Use patternProperties to define port@0 and port@1 in lvds-dual-ports.yaml
  in patch 8.  (Biju)
* Require port@0 or port@1 in lvds-dual-ports.yaml in patch 8.
* Collect R-b tags.

v4:
* Squash change for advantech,idk-2121wr.yaml and
  panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml in patch 8.  (Rob)
* Improve description in lvds-dual-ports.yaml in patch 8.  (Krzysztof)
* Require dual-lvds-odd-pixels or dual-lvds-even-pixels DT properties for port@1
  in ite,it6263.yaml in patch 9.
* Drop "data-mirror: true" from ite,it6263.yaml in patch 9.
* Use local variable reset_gpio in IT6263 driver's probe() in patch 10.  (Biju)
* Move pixel clock rate validation from mode_valid callback to
  hdmi_tmds_char_rate_valid callback in IT6263 driver in patch 10.  (Maxime)
* Document IT6263 video processing throughput constraints by adding comments
  in IT6263 driver in patch 10.  (Maxime)
* Fix IT6263 LVDS 8-bit color depth macro BIT8 in IT6263 driver in patch 10.
* Drop 30-bit LVDS data bit order validation in IT6263 driver in patch 10.
* Rebase patch 11 upon next-20241025 to resolve conflicts when apply.
* Collect R-b and A-b tags.

v3:
* Use assigned-clock-rates DT property to set pixel clock rate for
  "multi-inno,mi1010ait-1cp" LVDS panel in patch 1 instead of using
  panel-timing node.  (Marek)
* Drop the patch for fixing pixel clock rate for "edt,etml1010g3dra"
  LVDS panel because there is already another better patch[4].
* Collect Dmitry's R-b tag for patch 2.
* Define MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG,JEIDA} in patch 4.
* Use MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA,SPWG} in drm_of.c in patch 5.
* Add drm_of_lvds_get_dual_link_pixel_order_sink() in patch 6.  (Dmitry)
* Document jeida-30 and vesa-30 in lvds-data-mapping.yaml in patch 7.
* Extract dual-link LVDS display common properties(patch 8-10).  (Dmitry)
* Reference lvds-dual-ports.yaml in ite,it6263.yaml in patch 11.  (Dmitry)
* Add data-mapping DT property in ite,it6263.yaml in patch 11.  (Dmitry, Biju)
* Allow data-mirror in ite,it6263.yaml in patch 11.
* Drop ite,lvds-link-num-data-lanes DT property from ite,it6263.yaml
  in patch 11.  (Dmitry, Biju)
* Use HDMI connector framework in IT6263 driver in patch 12.  (Maxime)
* Control the missing HDMI_REG_AVI_INFOFRM_CTRL register in IT6263 driver
  in patch 12.
* Validate the maximal HDMI TMDS character rate in IT6263 driver in patch 12.
  (Dmitry)
* Get LVDS data mapping from data-mapping DT property in IT6263 driver
  in patch 12.  (Dmitry, Biju)
* Validate 30bit LVDS data bit order by checking data-mirror DT property
  in IT6263 driver in patch 12.
* Use drm_of_lvds_get_dual_link_pixel_order_sink() in IT6263 driver
  in patch 12.  (Dmitry)
* Initialize a bridge connector instead of open coding in IT6263 driver
  in patch 12.  (Dmitry)
* Add a comment that IT6263 chip has no HPD IRQ support in IT6263 driver
  in patch 12.  (Dmitry)
* Use devm_drm_bridge_add() instead of drm_bridge_add() in IT6263 driver
  in patch 12.  (Dmitry)
* Fix a minor build warning reported by kernel test robot in IT6263 driver
  in patch 12.
* Use data-mapping DT property instead of ite,lvds-link-num-data-lanes
  in i.MX8MP evk DT files in patch 13.  (Dmitry, Biju)

v2:
* Add more comments in fsl-ldb.c and commit message about pixel clock
  rate validation for patch 4.  (Maxime)
* Document number of LVDS link data lanes in patch 5.  (Biju)
* Simplify ports property by dropping "oneOf" in patch 5.  (Rob)
* Add AVI inforframe support in patch 6.  (Maxime)
* Add DRM_MODE_CONNECTOR_HDMIA in patch 6.  (Biju)
* Rename it6263_reset() to it6263_hw_reset() in patch 6.  (Biju)
* Check number of LVDS link data lanes in patch 6.  (Biju)
* Add ite,lvds-link-num-data-lanes properties in patch 7.
* Update MAINTAINERS.  (Maxime)

Liu Ying (13):
  arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set "media_disp2_pix"
    clock rate to 70MHz
  drm/bridge: fsl-ldb: Get the next non-panel bridge
  drm/bridge: fsl-ldb: Use clk_round_rate() to validate "ldb" clock rate
  media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
  drm: of: Get MEDIA_BUS_FMT_RGB101010_1X7X5_{JEIDA, SPWG} LVDS data
    mappings
  drm: of: Add drm_of_lvds_get_dual_link_pixel_order_sink()
  dt-bindings: display: lvds-data-mapping: Add 30-bit RGB pixel data
    mappings
  dt-bindings: display: Document dual-link LVDS display common
    properties
  dt-bindings: display: bridge: Add ITE IT6263 LVDS to HDMI converter
  drm/bridge: Add ITE IT6263 LVDS to HDMI converter
  arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter cards
  arm64: defconfig: Enable ITE IT6263 driver
  MAINTAINERS: Add maintainer for ITE IT6263 driver

 .../bindings/display/bridge/ite,it6263.yaml   | 250 +++++
 .../bindings/display/lvds-data-mapping.yaml   |  31 +
 .../bindings/display/lvds-dual-ports.yaml     |  63 ++
 .../display/panel/advantech,idk-2121wr.yaml   |  14 +-
 .../panel/panel-simple-lvds-dual-ports.yaml   |  20 +-
 .../media/v4l/subdev-formats.rst              | 156 ++-
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/freescale/Makefile        |   8 +
 .../imx8mp-evk-imx-lvds-hdmi-common.dtsi      |  29 +
 ...8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso |  44 +
 ...imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi |  43 +
 .../imx8mp-evk-lvds0-imx-lvds-hdmi.dtso       |  28 +
 ...8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso |  44 +
 ...imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi |  43 +
 .../imx8mp-evk-lvds1-imx-lvds-hdmi.dtso       |  28 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   6 +
 .../imx8mp-skov-revb-mi1010ait-1cp1.dts       |   8 +-
 arch/arm64/configs/defconfig                  |   1 +
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/fsl-ldb.c              |  55 +-
 drivers/gpu/drm/bridge/ite-it6263.c           | 898 ++++++++++++++++++
 drivers/gpu/drm/drm_of.c                      |  82 +-
 include/drm/drm_of.h                          |   9 +
 include/uapi/linux/media-bus-format.h         |   4 +-
 25 files changed, 1814 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
 create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso
 create mode 100644 drivers/gpu/drm/bridge/ite-it6263.c

-- 
2.34.1

