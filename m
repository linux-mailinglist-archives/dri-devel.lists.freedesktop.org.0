Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69B87A095
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 02:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D676310EFDC;
	Wed, 13 Mar 2024 01:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="G2Bor45y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2063.outbound.protection.outlook.com [40.107.105.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B2F10EFDC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 01:15:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLHgcEzJr21hqqEL80M594OZJsLXrq6qMXIQh6XLHaXyTEFOd7sAxdGrCURdxVA1YT1mp2KBLFyGanZC6rVAxW3L4TxDB3UGDgBmPCljvPp5VfraWu9PoteUJYdKk6MVzLlHQFLcgOxmJ8JLsh/twTdS1N/NKRxeO8WVZHnXvSXZcCpRht95tqxWqRc+QfMLrt8SmSetbVfI+GqxTyvXL1+EwvqahCo75dXZd5B4GBJx6RPYSXgP9dw5nbrCnynGGsQJxD5u3RJuVYTa+eiHJ/4zl86vGwOC7DhA4PrdJOzwNEbb6aU/KgiejUgGUiB7uuLY2lT17dH9h3rMh8gETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKUIr0ze+HIhaAoZH5Jt8Dbbyoy6f5Gn0V3oONuqbco=;
 b=MbP7wS5aUPOfz67IiHZG5XTvZyOZ0zHwmyroU+PYJfM3MmEf8r2gvx8A1slmLmvSRoOQcZp10efE/BcDFmpEtwKXaBO6A1XoOjfvx7Qc2koFDunxujchSjMsEl8qo88DYncSFxYPL+cvN4++BSzZ6GYYF/byCmSUgF9Jf1WnHRJhpDJ2KwWMal0AH4M4AsjgCPyDqn6Slo5+A7yVMB1ZtNVYEkIfNpVXZHmCGdAvwoGI3kT5wlAfyWmaQxImnfFxXa+tYdghqNrzmS/KlSaX4pEbQMody+B0x39U8qVzrFfsK0bTc6RVzq2u5tOPso0BTxHhjvMCUuqKYEG8pI0K1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKUIr0ze+HIhaAoZH5Jt8Dbbyoy6f5Gn0V3oONuqbco=;
 b=G2Bor45yVM9QhCZumoqJ2EKjcbB6G+HNH0XvKNZ3EMqEmqX/Io2KcW4jXyCZzOLQQFtMD3gVBbkFYpCYSBdyLrNiQTPy4QYzb94cVDzZZYYMb6gJj7Y61N77UD9I5nZ/n+MTrjO9NJIVM5yolDPLy/famlQEqV3V9iwD+OeOG+U=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8577.eurprd04.prod.outlook.com (2603:10a6:20b:424::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 01:15:09 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::98a:d1cf:4bb2:7f52%4]) with mapi id 15.20.7362.035; Wed, 13 Mar 2024
 01:15:09 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux@ew.tq-group.com"
 <linux@ew.tq-group.com>
Subject: RE: [EXT] [PATCH v15 6/8] phy: freescale: Add DisplayPort/HDMI
 Combo-PHY driver for i.MX8MQ
Thread-Topic: [EXT] [PATCH v15 6/8] phy: freescale: Add DisplayPort/HDMI
 Combo-PHY driver for i.MX8MQ
Thread-Index: AQHab6+HIeo18TaCc0ayuWnHdsDzt7E05rAw
Date: Wed, 13 Mar 2024 01:15:09 +0000
Message-ID: <PAXPR04MB94488A50C2BDD6B859B110DAF42A2@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
 <20240306101625.795732-7-alexander.stein@ew.tq-group.com>
In-Reply-To: <20240306101625.795732-7-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AS8PR04MB8577:EE_
x-ms-office365-filtering-correlation-id: 9b0e531c-d20e-4faa-d3c7-08dc42fb06b7
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6p/sZiBN0sjjS21oDF1AShaTNqfNElWJLJixYpBu34QjxIj03uFrrE+cAWg4RWsBrso1H30FQZD37bF1/DEeu+mVbmS9+cbRNlkrykSy/Xa8nO3/Xju/P7Rf/Zu/jabWqiJ9FzAneYted3J8fTouo7M78ItWtXjzogSurhPCNwWklBU2bVVO/QYHiyDH56M8gF3hh723uNo3irA0mCM70r2U94u2ZfthR7QVlM8KwHU1nonBv7kp1oLkvEbmWcuTRAQEoMwCnLpY3pJpMWpFfCOBQLie6gGRv6vQzZT5T35hstp40qTD3vlyaADUKMiYjzqmTx62ztYdOeZ2OQlO0MmdZTPxkuWCsJkmLgwmZZ0F3zaG4rzxqeEVt9EHccYsgiRzmhqVWhrNc0hTedx9yjZiWiQOEFaCl+iTtdW2/hz6S9I1dvqIb5fzbBA/YTcSLOgxEMXHkHlhIXV4QyTEg5UIFSK4hSeHz2ciZRZuUgXCWOCfukzhMMM+nBdlQ2drEnzFU2cyUMaBG5y2o5n8oKCo1LEwKrWCc1N04mGdpwxOfyaLb+QTcY7lcArhqjiMFZaBf+L8ZCdV6DuMocqZdq3e9hmGhkGJCXD8NbUyah6iOE6UTUDs8RycB7/v1QinHmKaRYnf1OGXW2TfBpmT6VEvlOegVi8sC11SNO4TROO/X9syGVTwCaoFYu/dxQM7SVthkTrcxHJuyuLLHDfEDaAvZUpr6fNd9w/MYnkShqo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(38070700009)(921011); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/PJJGqhSBZ3NAOUQQyT/4UqyJWU4nI4KuZierd9LJzLhNAkQKUbI0CZLdAM1?=
 =?us-ascii?Q?Eb4Lujv7Uoy5MbTJU7Zdq6VtgcujEWVm0XMK2sOfRcygAx2JjPcxnBvIuoGH?=
 =?us-ascii?Q?S3ArkEDwJfBhHhhSg3PCGngrBQDVZpsUlVwYEztW8pktGjFaW5fzJmqXuLvy?=
 =?us-ascii?Q?ePrOUFLCKpvocVr0kpc82+O54HEw4pNgy2xEgX2JQ2sInfe5moXRyKUW/qGx?=
 =?us-ascii?Q?VZzgUIwhSLWm8LgT/mIB2D/ZbrY1AYgKBsY3PnmESda2Zb/AVLUmCp+nwrjR?=
 =?us-ascii?Q?M3IMf7p4yhH55iX6bzF5OVXSrFvwZHgqsUddzyswI5FzYKh/hLTtw69giKsJ?=
 =?us-ascii?Q?q4HpG95tiWqFJdVg3nUf8EPHngGSKPEAO+HX6Bd9joZ7Odh5vqXlClz9kUJM?=
 =?us-ascii?Q?02Hbod8XbJG99jBm2xIcldm2I8GMM0bqabAhC3qqvJb8DaA1D/rvYD1sVubI?=
 =?us-ascii?Q?1zd61ipcPSTApxO5MRggFoo0U1i3s5hLFdVazgdPYBA60yBIiu5KRhw3+Nqz?=
 =?us-ascii?Q?0US1vuj2T0wrZrVhx6iEaP5VPcj5ALZnRF6KQNdP01d1VjrkK/heZx1t9ad8?=
 =?us-ascii?Q?9EnWa+/d/1KeMFNpuU2qIISNnbjV+W6PHlI2MJpqyh6pX/2YzcNv0yOxtrtY?=
 =?us-ascii?Q?p3GA3FrT+wjDEGKOx+sAQcEFjUl+C3eFQaxuIPrKY4EtzQsoLXkpTlHirPNR?=
 =?us-ascii?Q?YpNcBlKcRzPS6WKEl2GoaqX0Lfq0Y5WV0uYfIbXayS2BatB3DIEE3ZnO50Pa?=
 =?us-ascii?Q?d5HGX8yaEE42c2fERog681CyBRMYOeKX0EHNCkzpBZNK/wu2AH57JdNjfrlr?=
 =?us-ascii?Q?J2c7lrjAw+7+RhKuokj4s+MT+B4AmtOIfeDsb9hPZzurObC7HS2gn8Lh9QdG?=
 =?us-ascii?Q?9ugZwBcgr0TYMCXzf9KaCJKvrZYko1Mro58LetCqkRYtlGuzT1B+QSnJSsvd?=
 =?us-ascii?Q?GvaUqYUk/zccaCrFMqFGg5zmJDm89XOHtIovBr+WPLRGvb5OSC4Q3rmoWKub?=
 =?us-ascii?Q?m7BOF/fGhGejeVKBu3hVVZAJi/0qkx/GOP7mVmkEHte3Og9rG5V1vZqall/4?=
 =?us-ascii?Q?dKq/4/2zOMAl6tOSw0HrB/qb345jkONBrVSIBGKCFJIp6l4G8VCM8aQegdek?=
 =?us-ascii?Q?6dSNbpMDFv3W4YWx9T8lneZHHblDHnPO5CyAliu5u6j8ltVgXThL8P0vBTGz?=
 =?us-ascii?Q?Uo01VVUczQGNEcFG/IHEanRSDaf3d+QdVWsxQVEyesUlvwqhqkg+72D6WML+?=
 =?us-ascii?Q?oxJYpILeg3iGH4J8DFzaMGq7Suy7b9RMw2RfzzvTZOjIaXG+flJuENzxCnPM?=
 =?us-ascii?Q?roKSRTj+bYmGv1ixzNl8h6Per//XT7rWnkBZRnnDEOdBKBoZS4rWjhtQiGk8?=
 =?us-ascii?Q?P7y4eC2kdPDUohExB3xes9gHRa6KKosIQgK+K2Ca2BABn7DZN1w+uzHBSKNz?=
 =?us-ascii?Q?dbH0gEAmTRt6gM5bJV+d6wf86ps0w7QPm4uTAYsjaVNYn9QFNec/EkEyM9k/?=
 =?us-ascii?Q?rtDX0yhbMfgND8bPCCtXuc0JFWoIC30qeTX9Mv/gSK52OcRByEHOaCEa2Moj?=
 =?us-ascii?Q?4boc3JFWNrutKrFDe28=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0e531c-d20e-4faa-d3c7-08dc42fb06b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 01:15:09.6216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PieoWp/eDgiDqf9n7Dv7INZLCxVmD7q5jSrCPwlyVPkFrlEBzURUih5q3ebRBuh9hObuH6y0CYEt8ajr5wnI0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8577
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

Hi Alexander,

Thanks for your combine HDMI and DP PHY driver into one driver.
Basically, the HDMI and DP PHY initialize process and configuration same as=
 V14.
I have verify the DP and HDMI function with the patch set.

I'm OK for the patch.

B.R
Sandor=20

>=20
>=20
> From: Sandor Yu <Sandor.yu@nxp.com>
>=20
> Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
>=20
> Cadence HDP-TX PHY could be put in either DP mode or
> HDMI mode base on the configuration chosen.
> DisplayPort or HDMI PHY mode is configured in the driver.
>=20
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/phy/freescale/Kconfig                |   10 +
>  drivers/phy/freescale/Makefile               |    1 +
>  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1402 ++++++++++++++++++
>  3 files changed, 1413 insertions(+)
>  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
>=20
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfi=
g
> index 853958fb2c063..abacbe8ba8f46 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -35,6 +35,16 @@ config PHY_FSL_IMX8M_PCIE
>           Enable this to add support for the PCIE PHY as found on
>           i.MX8M family of SOCs.
>=20
> +config PHY_FSL_IMX8MQ_HDPTX
> +       tristate "Freescale i.MX8MQ DP/HDMI PHY support"
> +       depends on OF && HAS_IOMEM
> +       depends on COMMON_CLK
> +       select GENERIC_PHY
> +       select CDNS_MHDP_HELPER
> +       help
> +         Enable this to support the Cadence HDPTX DP/HDMI PHY driver
> +         on i.MX8MQ SOC.
> +
>  endif
>=20
>  config PHY_FSL_LYNX_28G
> diff --git a/drivers/phy/freescale/Makefile b/drivers/phy/freescale/Makef=
ile
> index cedb328bc4d28..17546a4da840a 100644
> --- a/drivers/phy/freescale/Makefile
> +++ b/drivers/phy/freescale/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_FSL_IMX8MQ_HDPTX)     +=3D phy-fsl-imx8mq-hdptx.o
>  obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)       +=3D phy-fsl-imx8mq-usb.o
>  obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)       +=3D phy-fsl-imx8qm-lvds-phy.o
>  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)      +=3D phy-fsl-imx8-mipi-dphy.o
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> b/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> new file mode 100644
> index 0000000000000..3bf92718f826a
> --- /dev/null
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> @@ -0,0 +1,1402 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Cadence DP/HDMI PHY driver
> + *
> + * Copyright (C) 2022-2024 NXP Semiconductor, Inc.
> + */
> +#include <asm/unaligned.h>
> +#include <drm/bridge/cdns-mhdp-helper.h>
> +#include <linux/clk.h>
> +#include <linux/kernel.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +
> +#define ADDR_PHY_AFE   0x80000
> +
> +/* PHY registers */
> +#define CMN_SSM_BIAS_TMR                       0x0022
> +#define CMN_PLLSM0_PLLEN_TMR                   0x0029
> +#define CMN_PLLSM0_PLLPRE_TMR                  0x002a
> +#define CMN_PLLSM0_PLLVREF_TMR                 0x002b
> +#define CMN_PLLSM0_PLLLOCK_TMR                 0x002c
> +#define CMN_PLLSM0_USER_DEF_CTRL               0x002f
> +#define CMN_PSM_CLK_CTRL                       0x0061
> +#define CMN_CDIAG_REFCLK_CTRL                  0x0062
> +#define CMN_PLL0_VCOCAL_START                  0x0081
> +#define CMN_PLL0_VCOCAL_INIT_TMR               0x0084
> +#define CMN_PLL0_VCOCAL_ITER_TMR               0x0085
> +#define CMN_PLL0_INTDIV                                0x0094
> +#define CMN_PLL0_FRACDIV                       0x0095
> +#define CMN_PLL0_HIGH_THR                      0x0096
> +#define CMN_PLL0_DSM_DIAG                      0x0097
> +#define CMN_PLL0_SS_CTRL2                      0x0099
> +#define CMN_ICAL_INIT_TMR                      0x00c4
> +#define CMN_ICAL_ITER_TMR                      0x00c5
> +#define CMN_RXCAL_INIT_TMR                     0x00d4
> +#define CMN_RXCAL_ITER_TMR                     0x00d5
> +#define CMN_TXPUCAL_CTRL                       0x00e0
> +#define CMN_TXPUCAL_INIT_TMR                   0x00e4
> +#define CMN_TXPUCAL_ITER_TMR                   0x00e5
> +#define CMN_TXPDCAL_CTRL                       0x00f0
> +#define CMN_TXPDCAL_INIT_TMR                   0x00f4
> +#define CMN_TXPDCAL_ITER_TMR                   0x00f5
> +#define CMN_ICAL_ADJ_INIT_TMR                  0x0102
> +#define CMN_ICAL_ADJ_ITER_TMR                  0x0103
> +#define CMN_RX_ADJ_INIT_TMR                    0x0106
> +#define CMN_RX_ADJ_ITER_TMR                    0x0107
> +#define CMN_TXPU_ADJ_CTRL                      0x0108
> +#define CMN_TXPU_ADJ_INIT_TMR                  0x010a
> +#define CMN_TXPU_ADJ_ITER_TMR                  0x010b
> +#define CMN_TXPD_ADJ_CTRL                      0x010c
> +#define CMN_TXPD_ADJ_INIT_TMR                  0x010e
> +#define CMN_TXPD_ADJ_ITER_TMR                  0x010f
> +#define CMN_DIAG_PLL0_FBH_OVRD                 0x01c0
> +#define CMN_DIAG_PLL0_FBL_OVRD                 0x01c1
> +#define CMN_DIAG_PLL0_OVRD                     0x01c2
> +#define CMN_DIAG_PLL0_TEST_MODE                        0x01c4
> +#define CMN_DIAG_PLL0_V2I_TUNE                 0x01c5
> +#define CMN_DIAG_PLL0_CP_TUNE                  0x01c6
> +#define CMN_DIAG_PLL0_LF_PROG                  0x01c7
> +#define CMN_DIAG_PLL0_PTATIS_TUNE1             0x01c8
> +#define CMN_DIAG_PLL0_PTATIS_TUNE2             0x01c9
> +#define CMN_DIAG_PLL0_INCLK_CTRL               0x01ca
> +#define CMN_DIAG_PLL0_PXL_DIVH                 0x01cb
> +#define CMN_DIAG_PLL0_PXL_DIVL                 0x01cc
> +#define CMN_DIAG_HSCLK_SEL                     0x01e0
> +#define CMN_DIAG_PER_CAL_ADJ                   0x01ec
> +#define CMN_DIAG_CAL_CTRL                      0x01ed
> +#define CMN_DIAG_ACYA                          0x01ff
> +#define XCVR_PSM_RCTRL                         0x4001
> +#define XCVR_PSM_CAL_TMR                       0x4002
> +#define XCVR_PSM_A0IN_TMR                      0x4003
> +#define TX_TXCC_CAL_SCLR_MULT_0                        0x4047
> +#define TX_TXCC_CPOST_MULT_00_0                        0x404c
> +#define XCVR_DIAG_PLLDRC_CTRL                  0x40e0
> +#define XCVR_DIAG_HSCLK_SEL                    0x40e1
> +#define XCVR_DIAG_BIDI_CTRL                    0x40e8
> +#define XCVR_DIAG_LANE_FCM_EN_MGN_TMR          0x40f2
> +#define TX_PSC_A0                              0x4100
> +#define TX_PSC_A1                              0x4101
> +#define TX_PSC_A2                              0x4102
> +#define TX_PSC_A3                              0x4103
> +#define TX_RCVDET_EN_TMR                       0x4122
> +#define TX_RCVDET_ST_TMR                       0x4123
> +#define TX_DIAG_TX_CTRL                                0x41e0
> +#define TX_DIAG_TX_DRV                         0x41e1
> +#define TX_DIAG_BGREF_PREDRV_DELAY             0x41e7
> +#define TX_DIAG_ACYA_0                         0x41ff
> +#define TX_DIAG_ACYA_1                         0x43ff
> +#define TX_DIAG_ACYA_2                         0x45ff
> +#define TX_DIAG_ACYA_3                         0x47ff
> +#define TX_ANA_CTRL_REG_1                      0x5020
> +#define TX_ANA_CTRL_REG_2                      0x5021
> +#define TX_DIG_CTRL_REG_1                      0x5023
> +#define TX_DIG_CTRL_REG_2                      0x5024
> +#define TXDA_CYA_AUXDA_CYA                     0x5025
> +#define TX_ANA_CTRL_REG_3                      0x5026
> +#define TX_ANA_CTRL_REG_4                      0x5027
> +#define TX_ANA_CTRL_REG_5                      0x5029
> +#define RX_PSC_A0                              0x8000
> +#define RX_PSC_CAL                             0x8006
> +#define PHY_HDP_MODE_CTRL                      0xc008
> +#define PHY_HDP_CLK_CTL                                0xc009
> +#define PHY_ISO_CMN_CTRL                       0xc010
> +#define PHY_PMA_CMN_CTRL1                      0xc800
> +#define PHY_PMA_ISO_CMN_CTRL                   0xc810
> +#define PHY_PMA_ISO_PLL_CTRL1                  0xc812
> +#define PHY_PMA_ISOLATION_CTRL                 0xc81f
> +
> +/* PHY_HDP_CLK_CTL */
> +#define PLL_DATA_RATE_CLK_DIV_MASK             GENMASK(15, 8)
> +#define PLL_DATA_RATE_CLK_DIV_HBR              0x24
> +#define PLL_DATA_RATE_CLK_DIV_HBR2             0x12
> +#define PLL_CLK_EN_ACK                         BIT(3)
> +#define PLL_CLK_EN                             BIT(2)
> +#define PLL_READY                              BIT(1)
> +#define PLL_EN                                 BIT(0)
> +
> +/* PHY_PMA_CMN_CTRL1 */
> +#define CMA_REF_CLK_DIG_DIV_MASK               GENMASK(13, 12)
> +#define CMA_REF_CLK_SEL_MASK                   GENMASK(6, 4)
> +#define CMA_REF_CLK_RCV_EN_MASK                        BIT(3)
> +#define CMA_REF_CLK_RCV_EN                     1
> +#define CMN_READY                              BIT(0)
> +
> +/* PHY_PMA_ISO_PLL_CTRL1 */
> +#define CMN_PLL0_CLK_DATART_DIV_MASK           GENMASK(7, 0)
> +
> +/* TX_DIAG_TX_DRV */
> +#define TX_DRIVER_PROG_BOOST_ENABLE            BIT(10)
> +#define TX_DRIVER_PROG_BOOST_LEVEL_MASK
> GENMASK(9, 8)
> +#define TX_DRIVER_LDO_BG_DEPENDENT_REF_ENABLE  BIT(7)
> +#define TX_DRIVER_LDO_BANDGAP_REF_ENABLE       BIT(6)
> +
> +/* TX_TXCC_CAL_SCLR_MULT_0 */
> +#define SCALED_RESISTOR_CALIBRATION_CODE_ADD   BIT(8)
> +#define RESISTOR_CAL_MULT_VAL_32_128           BIT(5)
> +
> +/* CMN_CDIAG_REFCLK_CTRL */
> +#define DIG_REF_CLK_DIV_SCALER_MASK            GENMASK(14, 12)
> +#define REFCLK_TERMINATION_EN_OVERRIDE_EN      BIT(7)
> +#define REFCLK_TERMINATION_EN_OVERRIDE         BIT(6)
> +
> +/* CMN_DIAG_HSCLK_SEL */
> +#define HSCLK1_SEL_MASK
> GENMASK(5, 4)
> +#define HSCLK0_SEL_MASK
> GENMASK(1, 0)
> +#define HSCLK_PLL0_DIV2                                1
> +
> +/* XCVR_DIAG_HSCLK_SEL */
> +#define HSCLK_SEL_MODE3_MASK                   GENMASK(13, 12)
> +#define HSCLK_SEL_MODE3_HSCLK1                 1
> +
> +/* CMN_PLL0_VCOCAL_START */
> +#define VCO_CALIB_CODE_START_POINT_VAL_MASK    GENMASK(8, 0)
> +
> +/* CMN_DIAG_PLL0_FBH_OVRD */
> +#define PLL_FEEDBACK_DIV_HI_OVERRIDE_EN                BIT(15)
> +
> +/* CMN_DIAG_PLL0_FBL_OVRD */
> +#define PLL_FEEDBACK_DIV_LO_OVERRIDE_EN                BIT(15)
> +
> +/* CMN_DIAG_PLL0_PXL_DIVH */
> +#define PLL_PCLK_DIV_EN                                BIT(15)
> +
> +/* XCVR_DIAG_PLLDRC_CTRL */
> +#define DPLL_CLK_SEL_MODE3                     BIT(14)
> +#define DPLL_DATA_RATE_DIV_MODE3_MASK          GENMASK(13,
> 12)
> +
> +/* TX_DIAG_TX_CTRL */
> +#define TX_IF_SUBRATE_MODE3_MASK               GENMASK(7, 6)
> +
> +/* PHY_HDP_MODE_CTRL */
> +#define POWER_STATE_A3_ACK                     BIT(7)
> +#define POWER_STATE_A2_ACK                     BIT(6)
> +#define POWER_STATE_A1_ACK                     BIT(5)
> +#define POWER_STATE_A0_ACK                     BIT(4)
> +#define POWER_STATE_A3                         BIT(3)
> +#define POWER_STATE_A2                         BIT(2)
> +#define POWER_STATE_A1                         BIT(1)
> +#define POWER_STATE_A0                         BIT(0)
> +
> +/* PHY_PMA_ISO_CMN_CTRL */
> +#define CMN_MACRO_PWR_EN_ACK                   BIT(5)
> +
> +#define KEEP_ALIVE             0x18
> +
> +#define REF_CLK_27MHZ          27000000
> +
> +/* HDMI TX clock control settings */
> +struct hdptx_hdmi_ctrl {
> +       u32 pixel_clk_freq_min;
> +       u32 pixel_clk_freq_max;
> +       u32 feedback_factor;
> +       u32 data_range_kbps_min;
> +       u32 data_range_kbps_max;
> +       u32 cmnda_pll0_ip_div;
> +       u32 cmn_ref_clk_dig_div;
> +       u32 ref_clk_divider_scaler;
> +       u32 pll_fb_div_total;
> +       u32 cmnda_pll0_fb_div_low;
> +       u32 cmnda_pll0_fb_div_high;
> +       u32 pixel_div_total;
> +       u32 cmnda_pll0_pxdiv_low;
> +       u32 cmnda_pll0_pxdiv_high;
> +       u32 vco_freq_min;
> +       u32 vco_freq_max;
> +       u32 vco_ring_select;
> +       u32 cmnda_hs_clk_0_sel;
> +       u32 cmnda_hs_clk_1_sel;
> +       u32 hsclk_div_at_xcvr;
> +       u32 hsclk_div_tx_sub_rate;
> +       u32 cmnda_pll0_hs_sym_div_sel;
> +       u32 cmnda_pll0_clk_freq_min;
> +       u32 cmnda_pll0_clk_freq_max;
> +};
> +
> +struct cdns_hdptx_phy {
> +       struct cdns_mhdp_base base;
> +
> +       void __iomem *regs;     /* DPTX registers base */
> +       struct mutex mbox_mutex; /* mutex to protect mailbox */
> +       struct device *dev;
> +       struct phy *phy;
> +       struct clk *ref_clk, *apb_clk;
> +       u32 ref_clk_rate;
> +       bool power_up;
> +       union {
> +               struct phy_configure_opts_hdmi hdmi;
> +               struct phy_configure_opts_dp dp;
> +       };
> +};
> +
> +/* HDMI TX clock control settings, pixel clock is output */
> +static const struct hdptx_hdmi_ctrl pixel_clk_output_ctrl_table[] =3D {
> +/*Minclk  Maxclk Fdbak  DR_min   DR_max  ip_d  dig  DS    Totl */
> +{ 27000,  27000, 1000,  270000,  270000, 0x03, 0x1, 0x1,  240, 0x0bc,
> 0x030,  80, 0x026, 0x026, 2160000, 2160000, 0, 2, 2, 2, 4, 0x3,  27000,
> 27000},
> +{ 27000,  27000, 1250,  337500,  337500, 0x03, 0x1, 0x1,  300, 0x0ec,
> 0x03c, 100, 0x030, 0x030, 2700000, 2700000, 0, 2, 2, 2, 4, 0x3,  33750,
> 33750},
> +{ 27000,  27000, 1500,  405000,  405000, 0x03, 0x1, 0x1,  360, 0x11c,
> 0x048, 120, 0x03a, 0x03a, 3240000, 3240000, 0, 2, 2, 2, 4, 0x3,  40500,
> 40500},
> +{ 27000,  27000, 2000,  540000,  540000, 0x03, 0x1, 0x1,  240, 0x0bc,
> 0x030,  80, 0x026, 0x026, 2160000, 2160000, 0, 2, 2, 2, 4, 0x2,  54000,
> 54000},
> +{ 54000,  54000, 1000,  540000,  540000, 0x03, 0x1, 0x1,  480, 0x17c,
> 0x060,  80, 0x026, 0x026, 4320000, 4320000, 1, 2, 2, 2, 4, 0x3,  54000,
> 54000},
> +{ 54000,  54000, 1250,  675000,  675000, 0x04, 0x1, 0x1,  400, 0x13c,
> 0x050,  50, 0x017, 0x017, 2700000, 2700000, 0, 1, 1, 2, 4, 0x2,  67500,
> 67500},
> +{ 54000,  54000, 1500,  810000,  810000, 0x04, 0x1, 0x1,  480, 0x17c,
> 0x060,  60, 0x01c, 0x01c, 3240000, 3240000, 0, 2, 2, 2, 2, 0x2,  81000,
> 81000},
> +{ 54000,  54000, 2000, 1080000, 1080000, 0x03, 0x1, 0x1,  240, 0x0bc,
> 0x030,  40, 0x012, 0x012, 2160000, 2160000, 0, 2, 2, 2, 1, 0x1, 108000,
> 108000},
> +{ 74250,  74250, 1000,  742500,  742500, 0x03, 0x1, 0x1,  660, 0x20c,
> 0x084,  80, 0x026, 0x026, 5940000, 5940000, 1, 2, 2, 2, 4, 0x3,  74250,
> 74250},
> +{ 74250,  74250, 1250,  928125,  928125, 0x04, 0x1, 0x1,  550, 0x1b4,
> 0x06e,  50, 0x017, 0x017, 3712500, 3712500, 1, 1, 1, 2, 4, 0x2,  92812,
> 92812},
> +{ 74250,  74250, 1500, 1113750, 1113750, 0x04, 0x1, 0x1,  660, 0x20c,
> 0x084,  60, 0x01c, 0x01c, 4455000, 4455000, 1, 2, 2, 2, 2, 0x2, 111375,
> 111375},
> +{ 74250,  74250, 2000, 1485000, 1485000, 0x03, 0x1, 0x1,  330, 0x104,
> 0x042,  40, 0x012, 0x012, 2970000, 2970000, 0, 2, 2, 2, 1, 0x1, 148500,
> 148500},
> +{ 99000,  99000, 1000,  990000,  990000, 0x03, 0x1, 0x1,  440, 0x15c,
> 0x058,  40, 0x012, 0x012, 3960000, 3960000, 1, 2, 2, 2, 2, 0x2,  99000,
> 99000},
> +{ 99000,  99000, 1250, 1237500, 1237500, 0x03, 0x1, 0x1,  275, 0x0d8,
> 0x037,  25, 0x00b, 0x00a, 2475000, 2475000, 0, 1, 1, 2, 2, 0x1, 123750,
> 123750},
> +{ 99000,  99000, 1500, 1485000, 1485000, 0x03, 0x1, 0x1,  330, 0x104,
> 0x042,  30, 0x00d, 0x00d, 2970000, 2970000, 0, 2, 2, 2, 1, 0x1, 148500,
> 148500},
> +{ 99000,  99000, 2000, 1980000, 1980000, 0x03, 0x1, 0x1,  440, 0x15c,
> 0x058,  40, 0x012, 0x012, 3960000, 3960000, 1, 2, 2, 2, 1, 0x1, 198000,
> 198000},
> +{148500, 148500, 1000, 1485000, 1485000, 0x03, 0x1, 0x1,  660, 0x20c,
> 0x084,  40, 0x012, 0x012, 5940000, 5940000, 1, 2, 2, 2, 2, 0x2, 148500,
> 148500},
> +{148500, 148500, 1250, 1856250, 1856250, 0x04, 0x1, 0x1,  550, 0x1b4,
> 0x06e,  25, 0x00b, 0x00a, 3712500, 3712500, 1, 1, 1, 2, 2, 0x1, 185625,
> 185625},
> +{148500, 148500, 1500, 2227500, 2227500, 0x03, 0x1, 0x1,  495, 0x188,
> 0x063,  30, 0x00d, 0x00d, 4455000, 4455000, 1, 1, 1, 2, 2, 0x1, 222750,
> 222750},
> +{148500, 148500, 2000, 2970000, 2970000, 0x03, 0x1, 0x1,  660, 0x20c,
> 0x084,  40, 0x012, 0x012, 5940000, 5940000, 1, 2, 2, 2, 1, 0x1, 297000,
> 297000},
> +{198000, 198000, 1000, 1980000, 1980000, 0x03, 0x1, 0x1,  220, 0x0ac,
> 0x02c,  10, 0x003, 0x003, 1980000, 1980000, 0, 1, 1, 2, 1, 0x0, 198000,
> 198000},
> +{198000, 198000, 1250, 2475000, 2475000, 0x03, 0x1, 0x1,  550, 0x1b4,
> 0x06e,  25, 0x00b, 0x00a, 4950000, 4950000, 1, 1, 1, 2, 2, 0x1, 247500,
> 247500},
> +{198000, 198000, 1500, 2970000, 2970000, 0x03, 0x1, 0x1,  330, 0x104,
> 0x042,  15, 0x006, 0x005, 2970000, 2970000, 0, 1, 1, 2, 1, 0x0, 297000,
> 297000},
> +{198000, 198000, 2000, 3960000, 3960000, 0x03, 0x1, 0x1,  440, 0x15c,
> 0x058,  20, 0x008, 0x008, 3960000, 3960000, 1, 1, 1, 2, 1, 0x0, 396000,
> 396000},
> +{297000, 297000, 1000, 2970000, 2970000, 0x03, 0x1, 0x1,  330, 0x104,
> 0x042,  10, 0x003, 0x003, 2970000, 2970000, 0, 1, 1, 2, 1, 0x0, 297000,
> 297000},
> +{297000, 297000, 1500, 4455000, 4455000, 0x03, 0x1, 0x1,  495, 0x188,
> 0x063,  15, 0x006, 0x005, 4455000, 4455000, 1, 1, 1, 2, 1, 0x0, 445500,
> 445500},
> +{297000, 297000, 2000, 5940000, 5940000, 0x03, 0x1, 0x1,  660, 0x20c,
> 0x084,  20, 0x008, 0x008, 5940000, 5940000, 1, 1, 1, 2, 1, 0x0, 594000,
> 594000},
> +{594000, 594000, 1000, 5940000, 5940000, 0x03, 0x1, 0x1,  660, 0x20c,
> 0x084,  10, 0x003, 0x003, 5940000, 5940000, 1, 1, 1, 2, 1, 0x0, 594000,
> 594000},
> +{594000, 594000,  750, 4455000, 4455000, 0x03, 0x1, 0x1,  495, 0x188,
> 0x063,  10, 0x003, 0x003, 4455000, 4455000, 1, 1, 1, 2, 1, 0x0, 445500,
> 445500},
> +{594000, 594000,  625, 3712500, 3712500, 0x04, 0x1, 0x1,  550, 0x1b4,
> 0x06e,  10, 0x003, 0x003, 3712500, 3712500, 1, 1, 1, 2, 1, 0x0, 371250,
> 371250},
> +{594000, 594000,  500, 2970000, 2970000, 0x03, 0x1, 0x1,  660, 0x20c,
> 0x084,  10, 0x003, 0x003, 5940000, 5940000, 1, 1, 1, 2, 2, 0x1, 297000,
> 297000},
> +};
> +
> +/* HDMI TX PLL tuning settings */
> +struct hdptx_hdmi_pll_tuning {
> +       u32 vco_freq_bin;
> +       u32 vco_freq_min;
> +       u32 vco_freq_max;
> +       u32 volt_to_current_coarse;
> +       u32 volt_to_current;
> +       u32 ndac_ctrl;
> +       u32 pmos_ctrl;
> +       u32 ptat_ndac_ctrl;
> +       u32 feedback_div_total;
> +       u32 charge_pump_gain;
> +       u32 coarse_code;
> +       u32 v2i_code;
> +       u32 vco_cal_code;
> +};
> +
> +/* HDMI TX PLL tuning settings, pixel clock is output */
> +static const struct hdptx_hdmi_pll_tuning pixel_clk_output_pll_table[] =
=3D {
> +/*bin VCO_freq min/max  coar  cod NDAC  PMOS PTAT div-T P-Gain Coa
> V2I CAL */
> +{  1, 1980000, 1980000, 0x4, 0x3, 0x0, 0x09, 0x09, 220, 0x42, 160, 5, 18=
3 },
> +{  2, 2160000, 2160000, 0x4, 0x3, 0x0, 0x09, 0x09, 240, 0x42, 166, 6, 20=
8 },
> +{  3, 2475000, 2475000, 0x5, 0x3, 0x1, 0x00, 0x07, 275, 0x42, 167, 6, 20=
9 },
> +{  4, 2700000, 2700000, 0x5, 0x3, 0x1, 0x00, 0x07, 300, 0x42, 188, 6, 23=
0 },
> +{  4, 2700000, 2700000, 0x5, 0x3, 0x1, 0x00, 0x07, 400, 0x4c, 188, 6, 23=
0 },
> +{  5, 2970000, 2970000, 0x6, 0x3, 0x1, 0x00, 0x07, 330, 0x42, 183, 6, 22=
5 },
> +{  6, 3240000, 3240000, 0x6, 0x3, 0x1, 0x00, 0x07, 360, 0x42, 203, 7, 25=
6 },
> +{  6, 3240000, 3240000, 0x6, 0x3, 0x1, 0x00, 0x07, 480, 0x4c, 203, 7, 25=
6 },
> +{  7, 3712500, 3712500, 0x4, 0x3, 0x0, 0x07, 0x0F, 550, 0x4c, 212, 7, 25=
7 },
> +{  8, 3960000, 3960000, 0x5, 0x3, 0x0, 0x07, 0x0F, 440, 0x42, 184, 6, 22=
6 },
> +{  9, 4320000, 4320000, 0x5, 0x3, 0x1, 0x07, 0x0F, 480, 0x42, 205, 7, 25=
8 },
> +{ 10, 4455000, 4455000, 0x5, 0x3, 0x0, 0x07, 0x0F, 495, 0x42, 219, 7, 27=
2 },
> +{ 10, 4455000, 4455000, 0x5, 0x3, 0x0, 0x07, 0x0F, 660, 0x4c, 219, 7, 27=
2 },
> +{ 11, 4950000, 4950000, 0x6, 0x3, 0x1, 0x00, 0x07, 550, 0x42, 213, 7, 25=
8 },
> +{ 12, 5940000, 5940000, 0x7, 0x3, 0x1, 0x00, 0x07, 660, 0x42, 244, 8, 29=
2 },
> +};
> +
> +enum dp_link_rate {
> +       RATE_1_6 =3D 162000,
> +       RATE_2_1 =3D 216000,
> +       RATE_2_4 =3D 243000,
> +       RATE_2_7 =3D 270000,
> +       RATE_3_2 =3D 324000,
> +       RATE_4_3 =3D 432000,
> +       RATE_5_4 =3D 540000,
> +};
> +
> +#define MAX_LINK_RATE RATE_5_4
> +
> +struct phy_pll_reg {
> +       u16 val[7];
> +       u32 addr;
> +};
> +
> +static const struct phy_pll_reg phy_pll_27m_cfg[] =3D {
> +       /*  1.62    2.16    2.43    2.7     3.24    4.32    5.4
> register address */
> +       {{ 0x010e, 0x010e, 0x010e, 0x010e, 0x010e, 0x010e, 0x010e },
> CMN_PLL0_VCOCAL_INIT_TMR },
> +       {{ 0x001b, 0x001b, 0x001b, 0x001b, 0x001b, 0x001b, 0x001b },
> CMN_PLL0_VCOCAL_ITER_TMR },
> +       {{ 0x30b9, 0x3087, 0x3096, 0x30b4, 0x30b9, 0x3087, 0x30b4 },
> CMN_PLL0_VCOCAL_START },
> +       {{ 0x0077, 0x009f, 0x00b3, 0x00c7, 0x0077, 0x009f, 0x00c7 },
> CMN_PLL0_INTDIV },
> +       {{ 0xf9da, 0xf7cd, 0xf6c7, 0xf5c1, 0xf9da, 0xf7cd, 0xf5c1 },
> CMN_PLL0_FRACDIV },
> +       {{ 0x001e, 0x0028, 0x002d, 0x0032, 0x001e, 0x0028, 0x0032 },
> CMN_PLL0_HIGH_THR },
> +       {{ 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020 },
> CMN_PLL0_DSM_DIAG },
> +       {{ 0x0000, 0x1000, 0x1000, 0x1000, 0x0000, 0x1000, 0x1000 },
> CMN_PLLSM0_USER_DEF_CTRL },
> +       {{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 },
> CMN_DIAG_PLL0_OVRD },
> +       {{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 },
> CMN_DIAG_PLL0_FBH_OVRD },
> +       {{ 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000 },
> CMN_DIAG_PLL0_FBL_OVRD },
> +       {{ 0x0006, 0x0007, 0x0007, 0x0007, 0x0006, 0x0007, 0x0007 },
> CMN_DIAG_PLL0_V2I_TUNE },
> +       {{ 0x0043, 0x0043, 0x0043, 0x0042, 0x0043, 0x0043, 0x0042 },
> CMN_DIAG_PLL0_CP_TUNE },
> +       {{ 0x0008, 0x0008, 0x0008, 0x0008, 0x0008, 0x0008, 0x0008 },
> CMN_DIAG_PLL0_LF_PROG },
> +       {{ 0x0100, 0x0001, 0x0001, 0x0001, 0x0100, 0x0001, 0x0001 },
> CMN_DIAG_PLL0_PTATIS_TUNE1 },
> +       {{ 0x0007, 0x0001, 0x0001, 0x0001, 0x0007, 0x0001, 0x0001 },
> CMN_DIAG_PLL0_PTATIS_TUNE2 },
> +       {{ 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020 },
> CMN_DIAG_PLL0_TEST_MODE},
> +       {{ 0x0016, 0x0016, 0x0016, 0x0016, 0x0016, 0x0016, 0x0016 },
> CMN_PSM_CLK_CTRL }
> +};
> +
> +static int dp_link_rate_index(u32 rate)
> +{
> +       switch (rate) {
> +       case RATE_1_6:
> +               return 0;
> +       case RATE_2_1:
> +               return 1;
> +       case RATE_2_4:
> +               return 2;
> +       case RATE_2_7:
> +               return 3;
> +       case RATE_3_2:
> +               return 4;
> +       case RATE_4_3:
> +               return 5;
> +       case RATE_5_4:
> +               return 6;
> +       default:
> +               return -1;
> +       }
> +}
> +
> +static int cdns_phy_reg_write(struct cdns_hdptx_phy *cdns_phy, u32 addr,
> u32 val)
> +{
> +       return cdns_mhdp_reg_write(&cdns_phy->base, ADDR_PHY_AFE +
> (addr << 2), val);
> +}
> +
> +static u32 cdns_phy_reg_read(struct cdns_hdptx_phy *cdns_phy, u32 addr)
> +{
> +       u32 reg32;
> +
> +       cdns_mhdp_reg_read(&cdns_phy->base, ADDR_PHY_AFE + (addr
> << 2), &reg32);
> +
> +       return reg32;
> +}
> +
> +static void hdptx_dp_aux_cfg(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       /* Power up Aux */
> +       cdns_phy_reg_write(cdns_phy, TXDA_CYA_AUXDA_CYA, 1);
> +
> +       cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_1, 0x3);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_2, 36);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0100);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0300);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_3, 0x0000);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2008);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2018);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa018);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030c);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_5, 0x0000);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_4, 0x1001);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa098);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0xa198);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030d);
> +       ndelay(150);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030f);
> +}
> +
> +/* PMA common configuration for 27MHz */
> +static void hdptx_dp_phy_pma_cmn_cfg_27mhz(struct cdns_hdptx_phy
> *cdns_phy)
> +{
> +       u32 num_lanes =3D cdns_phy->dp.lanes;
> +       u16 val;
> +       int k;
> +
> +       /* Enable PMA input ref clk(CMN_REF_CLK_RCV_EN) */
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
> +       val &=3D ~CMA_REF_CLK_RCV_EN_MASK;
> +       val |=3D FIELD_PREP(CMA_REF_CLK_RCV_EN_MASK,
> CMA_REF_CLK_RCV_EN);
> +       cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
> +
> +       /* Startup state machine registers */
> +       cdns_phy_reg_write(cdns_phy, CMN_SSM_BIAS_TMR, 0x0087);
> +       cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLEN_TMR,
> 0x001b);
> +       cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLPRE_TMR,
> 0x0036);
> +       cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLVREF_TMR,
> 0x001b);
> +       cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_PLLLOCK_TMR,
> 0x006c);
> +
> +       /* Current calibration registers */
> +       cdns_phy_reg_write(cdns_phy, CMN_ICAL_INIT_TMR, 0x0044);
> +       cdns_phy_reg_write(cdns_phy, CMN_ICAL_ITER_TMR, 0x0006);
> +       cdns_phy_reg_write(cdns_phy, CMN_ICAL_ADJ_INIT_TMR,
> 0x0022);
> +       cdns_phy_reg_write(cdns_phy, CMN_ICAL_ADJ_ITER_TMR,
> 0x0006);
> +
> +       /* Resistor calibration registers */
> +       cdns_phy_reg_write(cdns_phy, CMN_TXPUCAL_INIT_TMR, 0x0022);
> +       cdns_phy_reg_write(cdns_phy, CMN_TXPUCAL_ITER_TMR,
> 0x0006);
> +       cdns_phy_reg_write(cdns_phy, CMN_TXPU_ADJ_INIT_TMR,
> 0x0022);
> +       cdns_phy_reg_write(cdns_phy, CMN_TXPU_ADJ_ITER_TMR,
> 0x0006);
> +       cdns_phy_reg_write(cdns_phy, CMN_TXPDCAL_INIT_TMR, 0x0022);
> +       cdns_phy_reg_write(cdns_phy, CMN_TXPDCAL_ITER_TMR,
> 0x0006);
> +       cdns_phy_reg_write(cdns_phy, CMN_TXPD_ADJ_INIT_TMR,
> 0x0022);
> +       cdns_phy_reg_write(cdns_phy, CMN_TXPD_ADJ_ITER_TMR,
> 0x0006);
> +       cdns_phy_reg_write(cdns_phy, CMN_RXCAL_INIT_TMR, 0x0022);
> +       cdns_phy_reg_write(cdns_phy, CMN_RXCAL_ITER_TMR, 0x0006);
> +       cdns_phy_reg_write(cdns_phy, CMN_RX_ADJ_INIT_TMR, 0x0022);
> +       cdns_phy_reg_write(cdns_phy, CMN_RX_ADJ_ITER_TMR, 0x0006);
> +
> +       for (k =3D 0; k < num_lanes; k =3D k + 1) {
> +               /* Power state machine registers */
> +               cdns_phy_reg_write(cdns_phy, XCVR_PSM_CAL_TMR  |
> (k << 9), 0x016d);
> +               cdns_phy_reg_write(cdns_phy, XCVR_PSM_A0IN_TMR |
> (k << 9), 0x016d);
> +               /* Transceiver control and diagnostic registers */
> +               cdns_phy_reg_write(cdns_phy,
> XCVR_DIAG_LANE_FCM_EN_MGN_TMR | (k << 9), 0x00a2);
> +               cdns_phy_reg_write(cdns_phy,
> TX_DIAG_BGREF_PREDRV_DELAY | (k << 9), 0x0097);
> +               /* Transmitter receiver detect registers */
> +               cdns_phy_reg_write(cdns_phy, TX_RCVDET_EN_TMR | (k
> << 9), 0x0a8c);
> +               cdns_phy_reg_write(cdns_phy, TX_RCVDET_ST_TMR | (k
> << 9), 0x0036);
> +       }
> +
> +       cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_0, 1);
> +       cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_1, 1);
> +       cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_2, 1);
> +       cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_3, 1);
> +}
> +
> +static void hdptx_dp_phy_pma_cmn_pll0_27mhz(struct cdns_hdptx_phy
> *cdns_phy)
> +{
> +       u32 num_lanes =3D cdns_phy->dp.lanes;
> +       u32 link_rate =3D cdns_phy->dp.link_rate;
> +       u16 val;
> +       int index, i, k;
> +
> +       /* DP PLL data rate 0/1 clock divider value */
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +       val &=3D ~PLL_DATA_RATE_CLK_DIV_MASK;
> +       if (link_rate <=3D RATE_2_7)
> +               val |=3D FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
> +                                 PLL_DATA_RATE_CLK_DIV_HBR);
> +       else
> +               val |=3D FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
> +                                 PLL_DATA_RATE_CLK_DIV_HBR2);
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +
> +       /* High speed clock 0/1 div */
> +       val =3D cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
> +       val &=3D ~(HSCLK1_SEL_MASK | HSCLK0_SEL_MASK);
> +       if (link_rate <=3D RATE_2_7) {
> +               val |=3D FIELD_PREP(HSCLK1_SEL_MASK,
> HSCLK_PLL0_DIV2);
> +               val |=3D FIELD_PREP(HSCLK0_SEL_MASK,
> HSCLK_PLL0_DIV2);
> +       }
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
> +
> +       for (k =3D 0; k < num_lanes; k++) {
> +               val =3D cdns_phy_reg_read(cdns_phy,
> (XCVR_DIAG_HSCLK_SEL | (k << 9)));
> +               val &=3D ~HSCLK_SEL_MODE3_MASK;
> +               if (link_rate <=3D RATE_2_7)
> +                       val |=3D FIELD_PREP(HSCLK_SEL_MODE3_MASK,
> HSCLK_SEL_MODE3_HSCLK1);
> +               cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_HSCLK_SEL |
> (k << 9)), val);
> +       }
> +
> +       /* DP PHY PLL 27MHz configuration */
> +       index =3D dp_link_rate_index(link_rate);
> +       for (i =3D 0; i < ARRAY_SIZE(phy_pll_27m_cfg); i++)
> +               cdns_phy_reg_write(cdns_phy, phy_pll_27m_cfg[i].addr,
> +                                  phy_pll_27m_cfg[i].val[index]);
> +
> +       /* Transceiver control and diagnostic registers */
> +       for (k =3D 0; k < num_lanes; k++) {
> +               val =3D cdns_phy_reg_read(cdns_phy,
> (XCVR_DIAG_PLLDRC_CTRL | (k << 9)));
> +               val &=3D ~(DPLL_DATA_RATE_DIV_MODE3_MASK |
> DPLL_CLK_SEL_MODE3);
> +               if (link_rate <=3D RATE_2_7)
> +                       val |=3D
> FIELD_PREP(DPLL_DATA_RATE_DIV_MODE3_MASK, 2);
> +               else
> +                       val |=3D
> FIELD_PREP(DPLL_DATA_RATE_DIV_MODE3_MASK, 1);
> +               cdns_phy_reg_write(cdns_phy,
> (XCVR_DIAG_PLLDRC_CTRL | (k << 9)), val);
> +       }
> +
> +       for (k =3D 0; k < num_lanes; k =3D k + 1) {
> +               /* Power state machine registers */
> +               cdns_phy_reg_write(cdns_phy, (XCVR_PSM_RCTRL | (k <<
> 9)), 0xbefc);
> +               cdns_phy_reg_write(cdns_phy, (TX_PSC_A0 | (k << 9)),
> 0x6799);
> +               cdns_phy_reg_write(cdns_phy, (TX_PSC_A1 | (k << 9)),
> 0x6798);
> +               cdns_phy_reg_write(cdns_phy, (TX_PSC_A2 | (k << 9)),
> 0x0098);
> +               cdns_phy_reg_write(cdns_phy, (TX_PSC_A3 | (k << 9)),
> 0x0098);
> +               /* Receiver calibration power state definition register *=
/
> +               val =3D cdns_phy_reg_read(cdns_phy, RX_PSC_CAL | (k <<
> 9));
> +               val &=3D 0xffbb;
> +               cdns_phy_reg_write(cdns_phy, (RX_PSC_CAL | (k << 9)),
> val);
> +               val =3D cdns_phy_reg_read(cdns_phy, RX_PSC_A0 | (k <<
> 9));
> +               val &=3D 0xffbb;
> +               cdns_phy_reg_write(cdns_phy, (RX_PSC_A0 | (k << 9)),
> val);
> +       }
> +}
> +
> +static void hdptx_dp_phy_ref_clock_type(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       u32 val;
> +
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
> +       val &=3D ~CMA_REF_CLK_SEL_MASK;
> +       /*
> +        * single ended reference clock (val |=3D 0x0030);
> +        * differential clock  (val |=3D 0x0000);
> +        *
> +        * for differential clock on the refclk_p and
> +        * refclk_m off chip pins: CMN_DIAG_ACYA[8]=3D1'b1
> +        * cdns_phy_reg_write(cdns_phy, CMN_DIAG_ACYA, 0x0100);
> +        */
> +       val |=3D FIELD_PREP(CMA_REF_CLK_SEL_MASK, 3);
> +       cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
> +}
> +
> +static int wait_for_ack(struct cdns_hdptx_phy *cdns_phy, u32 reg, u32 ma=
sk,
> +                       const char *err_msg)
> +{
> +       u32 val, i;
> +
> +       for (i =3D 0; i < 10; i++) {
> +               val =3D cdns_phy_reg_read(cdns_phy, reg);
> +               if (val & mask)
> +                       return 0;
> +               msleep(20);
> +       }
> +
> +       dev_err(cdns_phy->dev, "%s\n", err_msg);
> +       return -ETIMEDOUT;
> +}
> +
> +static int wait_for_ack_clear(struct cdns_hdptx_phy *cdns_phy, u32 reg, =
u32
> mask,
> +                             const char *err_msg)
> +{
> +       u32 val, i;
> +
> +       for (i =3D 0; i < 10; i++) {
> +               val =3D cdns_phy_reg_read(cdns_phy, reg);
> +               if (!(val & mask))
> +                       return 0;
> +               msleep(20);
> +       }
> +
> +       dev_err(cdns_phy->dev, "%s\n", err_msg);
> +       return -ETIMEDOUT;
> +}
> +
> +static int hdptx_dp_phy_power_up(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       u32 val;
> +       int ret =3D 0;
> +
> +       /* Enable HDP PLL's for high speed clocks */
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +       val |=3D PLL_EN;
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +       ret =3D wait_for_ack(cdns_phy, PHY_HDP_CLK_CTL, PLL_READY,
> +                          "Wait PLL Ack failed");
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Enable HDP PLL's data rate and full rate clocks out of PMA. */
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +       val |=3D PLL_CLK_EN;
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +       ret =3D wait_for_ack(cdns_phy, PHY_HDP_CLK_CTL,
> PLL_CLK_EN_ACK,
> +                          "Wait PLL clock enable ACK failed");
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Configure PHY in A2 Mode */
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A2);
> +       ret =3D wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A2_ACK,
> +                          "Wait A2 Ack failed");
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Configure PHY in A0 mode (PHY must be in the A0 power
> +        * state in order to transmit data)
> +        */
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A0);
> +       ret =3D wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A0_ACK,
> +                          "Wait A0 Ack failed");
> +       if (ret < 0)
> +               return ret;
> +
> +       cdns_phy->power_up =3D true;
> +
> +       return ret;
> +}
> +
> +static int hdptx_dp_phy_power_down(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       u16 val;
> +       int ret;
> +
> +       if (!cdns_phy->power_up)
> +               return 0;
> +
> +       /* Place the PHY lanes in the A3 power state. */
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A3);
> +       ret =3D wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A3_ACK,
> +                        "Wait A3 Ack failed");
> +       if (ret)
> +               return ret;
> +
> +       /* Disable HDP PLL's data rate and full rate clocks out of PMA. *=
/
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +       val &=3D ~PLL_CLK_EN;
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +       ret =3D wait_for_ack_clear(cdns_phy, PHY_HDP_CLK_CTL,
> PLL_CLK_EN_ACK,
> +                              "Wait PLL clock Ack clear failed");
> +       if (ret)
> +               return ret;
> +
> +       /* Disable HDP PLL's for high speed clocks */
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +       val &=3D ~PLL_EN;
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +       ret =3D wait_for_ack_clear(cdns_phy, PHY_HDP_CLK_CTL,
> PLL_READY,
> +                              "Wait PLL Ack clear failed");
> +       if (ret)
> +               return ret;
> +
> +       cdns_phy->power_up =3D false;
> +       return 0;
> +}
> +
> +static int cdns_hdptx_dp_configure(struct phy *phy,
> +                                  union phy_configure_opts *opts)
> +{
> +       struct cdns_hdptx_phy *cdns_phy =3D phy_get_drvdata(phy);
> +       int ret;
> +
> +       cdns_phy->dp.link_rate =3D opts->dp.link_rate;
> +       cdns_phy->dp.lanes =3D opts->dp.lanes;
> +
> +       if (cdns_phy->dp.link_rate > MAX_LINK_RATE) {
> +               dev_err(cdns_phy->dev, "Link Rate(%d) Not supported\n",
> cdns_phy->dp.link_rate);
> +               return false;
> +       }
> +
> +       /* Disable phy clock if PHY in power up state */
> +       hdptx_dp_phy_power_down(cdns_phy);
> +
> +       if (cdns_phy->ref_clk_rate =3D=3D REF_CLK_27MHZ) {
> +               hdptx_dp_phy_pma_cmn_cfg_27mhz(cdns_phy);
> +               hdptx_dp_phy_pma_cmn_pll0_27mhz(cdns_phy);
> +       } else {
> +               dev_err(cdns_phy->dev, "Not support ref clock rate\n");
> +       }
> +
> +       /* PHY power up */
> +       ret =3D hdptx_dp_phy_power_up(cdns_phy);
> +
> +       return ret;
> +}
> +
> +static bool hdptx_phy_check_alive(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       u32  alive, newalive;
> +       u8 retries_left =3D 50;
> +
> +       alive =3D readl(cdns_phy->regs + KEEP_ALIVE);
> +
> +       while (retries_left--) {
> +               udelay(2);
> +
> +               newalive =3D readl(cdns_phy->regs + KEEP_ALIVE);
> +               if (alive =3D=3D newalive)
> +                       continue;
> +               return true;
> +       }
> +       return false;
> +}
> +
> +static int hdptx_clk_enable(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       struct device *dev =3D cdns_phy->dev;
> +       u32 ref_clk_rate;
> +       int ret;
> +
> +       cdns_phy->ref_clk =3D devm_clk_get(dev, "ref");
> +       if (IS_ERR(cdns_phy->ref_clk)) {
> +               dev_err(dev, "phy ref clock not found\n");
> +               return PTR_ERR(cdns_phy->ref_clk);
> +       }
> +
> +       cdns_phy->apb_clk =3D devm_clk_get(dev, "apb");
> +       if (IS_ERR(cdns_phy->apb_clk)) {
> +               dev_err(dev, "phy apb clock not found\n");
> +               return PTR_ERR(cdns_phy->apb_clk);
> +       }
> +
> +       ret =3D clk_prepare_enable(cdns_phy->ref_clk);
> +       if (ret) {
> +               dev_err(cdns_phy->dev, "Failed to prepare ref clock\n");
> +               return ret;
> +       }
> +
> +       ref_clk_rate =3D clk_get_rate(cdns_phy->ref_clk);
> +       if (!ref_clk_rate) {
> +               dev_err(cdns_phy->dev, "Failed to get ref clock rate\n");
> +               goto err_ref_clk;
> +       }
> +
> +       if (ref_clk_rate =3D=3D REF_CLK_27MHZ) {
> +               cdns_phy->ref_clk_rate =3D ref_clk_rate;
> +       } else {
> +               dev_err(cdns_phy->dev, "Not support Ref Clock
> Rate(%dHz)\n", ref_clk_rate);
> +               goto err_ref_clk;
> +       }
> +
> +       ret =3D clk_prepare_enable(cdns_phy->apb_clk);
> +       if (ret) {
> +               dev_err(cdns_phy->dev, "Failed to prepare apb clock\n");
> +               goto err_ref_clk;
> +       }
> +
> +       return 0;
> +
> +err_ref_clk:
> +       clk_disable_unprepare(cdns_phy->ref_clk);
> +       return -EINVAL;
> +}
> +
> +static void hdptx_clk_disable(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       clk_disable_unprepare(cdns_phy->apb_clk);
> +       clk_disable_unprepare(cdns_phy->ref_clk);
> +}
> +
> +static void hdptx_hdmi_arc_config(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       u16 txpu_calib_code;
> +       u16 txpd_calib_code;
> +       u16 txpu_adj_calib_code;
> +       u16 txpd_adj_calib_code;
> +       u16 prev_calib_code;
> +       u16 new_calib_code;
> +       u16 rdata;
> +
> +       /* Power ARC */
> +       cdns_phy_reg_write(cdns_phy, TXDA_CYA_AUXDA_CYA, 0x0001);
> +
> +       prev_calib_code =3D cdns_phy_reg_read(cdns_phy,
> TX_DIG_CTRL_REG_2);
> +       txpu_calib_code =3D cdns_phy_reg_read(cdns_phy,
> CMN_TXPUCAL_CTRL);
> +       txpd_calib_code =3D cdns_phy_reg_read(cdns_phy,
> CMN_TXPDCAL_CTRL);
> +       txpu_adj_calib_code =3D cdns_phy_reg_read(cdns_phy,
> CMN_TXPU_ADJ_CTRL);
> +       txpd_adj_calib_code =3D cdns_phy_reg_read(cdns_phy,
> CMN_TXPD_ADJ_CTRL);
> +
> +       new_calib_code =3D ((txpu_calib_code + txpd_calib_code) / 2)
> +               + txpu_adj_calib_code + txpd_adj_calib_code;
> +
> +       if (new_calib_code !=3D prev_calib_code) {
> +               rdata =3D cdns_phy_reg_read(cdns_phy,
> TX_ANA_CTRL_REG_1);
> +               rdata &=3D 0xdfff;
> +               cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1,
> rdata);
> +               cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_2,
> new_calib_code);
> +               mdelay(10);
> +               rdata |=3D 0x2000;
> +               cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1,
> rdata);
> +               usleep_range(150, 250);
> +       }
> +
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0100);
> +       usleep_range(100, 200);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0300);
> +       usleep_range(100, 200);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_3, 0x0000);
> +       usleep_range(100, 200);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2008);
> +       usleep_range(100, 200);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2018);
> +       usleep_range(100, 200);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2098);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030c);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_5, 0x0010);
> +       usleep_range(100, 200);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_4, 0x4001);
> +       mdelay(5);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2198);
> +       mdelay(5);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030d);
> +       usleep_range(100, 200);
> +       cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030f);
> +}
> +
> +static void hdptx_hdmi_phy_set_vswing(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       u32 k;
> +       const u32 num_lanes =3D 4;
> +
> +       for (k =3D 0; k < num_lanes; k++) {
> +               cdns_phy_reg_write(cdns_phy, (TX_DIAG_TX_DRV | (k <<
> 9)),
> +
> TX_DRIVER_PROG_BOOST_ENABLE |
> +
> FIELD_PREP(TX_DRIVER_PROG_BOOST_LEVEL_MASK, 3) |
> +
> TX_DRIVER_LDO_BG_DEPENDENT_REF_ENABLE |
> +
> TX_DRIVER_LDO_BANDGAP_REF_ENABLE);
> +               cdns_phy_reg_write(cdns_phy,
> (TX_TXCC_CPOST_MULT_00_0 | (k << 9)), 0x0);
> +               cdns_phy_reg_write(cdns_phy,
> (TX_TXCC_CAL_SCLR_MULT_0 | (k << 9)),
> +
> SCALED_RESISTOR_CALIBRATION_CODE_ADD |
> +
> RESISTOR_CAL_MULT_VAL_32_128);
> +       }
> +}
> +
> +static int hdptx_hdmi_feedback_factor(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       u32 feedback_factor;
> +
> +       switch (cdns_phy->hdmi.color_space) {
> +       case HDMI_COLORSPACE_YUV422:
> +               feedback_factor =3D 1000;
> +               break;
> +
> +       case HDMI_COLORSPACE_YUV420:
> +               switch (cdns_phy->hdmi.bpc) {
> +               case 8:
> +                       feedback_factor =3D 500;
> +                       break;
> +               case 10:
> +                       feedback_factor =3D 625;
> +                       break;
> +               case 12:
> +                       feedback_factor =3D 750;
> +                       break;
> +               case 16:
> +                       feedback_factor =3D 1000;
> +                       break;
> +               default:
> +                       dev_dbg(cdns_phy->dev, "Invalid
> ColorDepth\n");
> +                       return 0;
> +               }
> +               break;
> +
> +       default:
> +               /* Assume RGB/YUV444 */
> +               switch (cdns_phy->hdmi.bpc) {
> +               case 10:
> +                       feedback_factor =3D 1250;
> +                       break;
> +               case 12:
> +                       feedback_factor =3D 1500;
> +                       break;
> +               case 16:
> +                       feedback_factor =3D 2000;
> +                       break;
> +               default:
> +                       feedback_factor =3D 1000;
> +               }
> +       }
> +
> +       return feedback_factor;
> +}
> +
> +static int hdptx_hdmi_phy_config(struct cdns_hdptx_phy *cdns_phy,
> +                                const struct hdptx_hdmi_ctrl
> *p_ctrl_table,
> +                                const struct hdptx_hdmi_pll_tuning
> *p_pll_table,
> +                                bool pclk_in)
> +{
> +       const u32 num_lanes =3D 4;
> +       u32 val, k;
> +       int ret;
> +
> +       /* enable PHY isolation mode only for CMN */
> +       cdns_phy_reg_write(cdns_phy, PHY_PMA_ISOLATION_CTRL,
> 0xd000);
> +
> +       /* set cmn_pll0_clk_datart1_div/cmn_pll0_clk_datart0_div dividers
> */
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_ISO_PLL_CTRL1);
> +       val &=3D ~CMN_PLL0_CLK_DATART_DIV_MASK;
> +       val |=3D FIELD_PREP(CMN_PLL0_CLK_DATART_DIV_MASK, 0x12);
> +       cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_PLL_CTRL1, val);
> +
> +       /* assert PHY reset from isolation register */
> +       cdns_phy_reg_write(cdns_phy, PHY_ISO_CMN_CTRL, 0x0000);
> +       /* assert PMA CMN reset */
> +       cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_CMN_CTRL,
> 0x0000);
> +
> +       /* register XCVR_DIAG_BIDI_CTRL */
> +       for (k =3D 0; k < num_lanes; k++)
> +               cdns_phy_reg_write(cdns_phy, XCVR_DIAG_BIDI_CTRL |
> (k << 9), 0x00ff);
> +
> +       /* Describing Task phy_cfg_hdp */
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
> +       val &=3D ~CMA_REF_CLK_RCV_EN_MASK;
> +       val |=3D FIELD_PREP(CMA_REF_CLK_RCV_EN_MASK,
> CMA_REF_CLK_RCV_EN);
> +       cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
> +
> +       /* PHY Registers */
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
> +       val &=3D ~CMA_REF_CLK_DIG_DIV_MASK;
> +       val |=3D FIELD_PREP(CMA_REF_CLK_DIG_DIV_MASK,
> p_ctrl_table->cmn_ref_clk_dig_div);
> +       cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
> +
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> +       val &=3D ~PLL_DATA_RATE_CLK_DIV_MASK;
> +       val |=3D FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
> +                         PLL_DATA_RATE_CLK_DIV_HBR2);
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> +
> +       /* Common control module control and diagnostic registers */
> +       val =3D cdns_phy_reg_read(cdns_phy, CMN_CDIAG_REFCLK_CTRL);
> +       val &=3D ~DIG_REF_CLK_DIV_SCALER_MASK;
> +       val |=3D FIELD_PREP(DIG_REF_CLK_DIV_SCALER_MASK,
> p_ctrl_table->ref_clk_divider_scaler);
> +       val |=3D REFCLK_TERMINATION_EN_OVERRIDE_EN |
> REFCLK_TERMINATION_EN_OVERRIDE;
> +       cdns_phy_reg_write(cdns_phy, CMN_CDIAG_REFCLK_CTRL, val);
> +
> +       /* High speed clock used */
> +       val =3D cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
> +       val &=3D ~(HSCLK1_SEL_MASK | HSCLK0_SEL_MASK);
> +       val |=3D FIELD_PREP(HSCLK1_SEL_MASK,
> (p_ctrl_table->cmnda_hs_clk_1_sel >> 1));
> +       val |=3D FIELD_PREP(HSCLK0_SEL_MASK,
> (p_ctrl_table->cmnda_hs_clk_0_sel >> 1));
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
> +
> +       for (k =3D 0; k < num_lanes; k++) {
> +               val =3D cdns_phy_reg_read(cdns_phy,
> (XCVR_DIAG_HSCLK_SEL | (k << 9)));
> +               val &=3D ~HSCLK_SEL_MODE3_MASK;
> +               val |=3D FIELD_PREP(HSCLK_SEL_MODE3_MASK,
> +
> (p_ctrl_table->cmnda_hs_clk_0_sel >> 1));
> +               cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_HSCLK_SEL |
> (k << 9)), val);
> +       }
> +
> +       /* PLL 0 control state machine registers */
> +       val =3D p_ctrl_table->vco_ring_select << 12;
> +       cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_USER_DEF_CTRL,
> val);
> +
> +       if (pclk_in) {
> +               val =3D 0x30a0;
> +       } else {
> +               val =3D cdns_phy_reg_read(cdns_phy,
> CMN_PLL0_VCOCAL_START);
> +               val &=3D ~VCO_CALIB_CODE_START_POINT_VAL_MASK;
> +               val |=3D
> FIELD_PREP(VCO_CALIB_CODE_START_POINT_VAL_MASK,
> +                                 p_pll_table->vco_cal_code);
> +       }
> +       cdns_phy_reg_write(cdns_phy, CMN_PLL0_VCOCAL_START, val);
> +
> +       cdns_phy_reg_write(cdns_phy, CMN_PLL0_VCOCAL_INIT_TMR,
> 0x0064);
> +       cdns_phy_reg_write(cdns_phy, CMN_PLL0_VCOCAL_ITER_TMR,
> 0x000a);
> +
> +       /* Common functions control and diagnostics registers */
> +       val =3D p_ctrl_table->cmnda_pll0_hs_sym_div_sel << 8;
> +       val |=3D p_ctrl_table->cmnda_pll0_ip_div;
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_INCLK_CTRL, val);
> +
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_OVRD, 0x0000);
> +
> +       val =3D p_ctrl_table->cmnda_pll0_fb_div_high;
> +       val |=3D PLL_FEEDBACK_DIV_HI_OVERRIDE_EN;
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_FBH_OVRD, val);
> +
> +       val =3D p_ctrl_table->cmnda_pll0_fb_div_low;
> +       val |=3D PLL_FEEDBACK_DIV_LO_OVERRIDE_EN;
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_FBL_OVRD, val);
> +
> +       if (!pclk_in) {
> +               val =3D p_ctrl_table->cmnda_pll0_pxdiv_low;
> +               cdns_phy_reg_write(cdns_phy,
> CMN_DIAG_PLL0_PXL_DIVL, val);
> +
> +               val =3D p_ctrl_table->cmnda_pll0_pxdiv_high;
> +               val |=3D PLL_PCLK_DIV_EN;
> +               cdns_phy_reg_write(cdns_phy,
> CMN_DIAG_PLL0_PXL_DIVH, val);
> +       }
> +
> +       val =3D p_pll_table->volt_to_current_coarse;
> +       val |=3D (p_pll_table->volt_to_current) << 4;
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_V2I_TUNE, val);
> +
> +       val =3D p_pll_table->charge_pump_gain;
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_CP_TUNE, val);
> +
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_LF_PROG,
> 0x0008);
> +
> +       val =3D p_pll_table->pmos_ctrl;
> +       val |=3D (p_pll_table->ndac_ctrl) << 8;
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_PTATIS_TUNE1,
> val);
> +
> +       val =3D p_pll_table->ptat_ndac_ctrl;
> +       cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_PTATIS_TUNE2,
> val);
> +
> +       if (pclk_in)
> +               cdns_phy_reg_write(cdns_phy,
> CMN_DIAG_PLL0_TEST_MODE, 0x0022);
> +       else
> +               cdns_phy_reg_write(cdns_phy,
> CMN_DIAG_PLL0_TEST_MODE, 0x0020);
> +
> +       cdns_phy_reg_write(cdns_phy, CMN_PSM_CLK_CTRL, 0x0016);
> +
> +       /* Transceiver control and diagnostic registers */
> +       for (k =3D 0; k < num_lanes; k++) {
> +               val =3D cdns_phy_reg_read(cdns_phy,
> (XCVR_DIAG_PLLDRC_CTRL | (k << 9)));
> +               val &=3D ~DPLL_CLK_SEL_MODE3;
> +               cdns_phy_reg_write(cdns_phy,
> (XCVR_DIAG_PLLDRC_CTRL | (k << 9)), val);
> +       }
> +
> +       for (k =3D 0; k < num_lanes; k++) {
> +               val =3D cdns_phy_reg_read(cdns_phy, (TX_DIAG_TX_CTRL |
> (k << 9)));
> +               val &=3D ~TX_IF_SUBRATE_MODE3_MASK;
> +               val |=3D FIELD_PREP(TX_IF_SUBRATE_MODE3_MASK,
> +
> (p_ctrl_table->hsclk_div_tx_sub_rate >> 1));
> +               cdns_phy_reg_write(cdns_phy, (TX_DIAG_TX_CTRL | (k <<
> 9)), val);
> +       }
> +
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
> +       val &=3D ~CMA_REF_CLK_SEL_MASK;
> +       /*
> +        * single ended reference clock (val |=3D 0x0030);
> +        * differential clock  (val |=3D 0x0000);
> +        * for differential clock on the refclk_p and
> +        * refclk_m off chip pins: CMN_DIAG_ACYA[8]=3D1'b1
> +        * cdns_phy_reg_write(cdns_phy, CMN_DIAG_ACYA, 0x0100);
> +        */
> +       val |=3D FIELD_PREP(CMA_REF_CLK_SEL_MASK, 3);
> +       cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
> +
> +       /* Deassert PHY reset */
> +       cdns_phy_reg_write(cdns_phy, PHY_ISO_CMN_CTRL, 0x0001);
> +       cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_CMN_CTRL,
> 0x0003);
> +
> +       /* Power state machine registers */
> +       for (k =3D 0; k < num_lanes; k++)
> +               cdns_phy_reg_write(cdns_phy, XCVR_PSM_RCTRL | (k <<
> 9), 0xfefc);
> +
> +       /* Assert cmn_macro_pwr_en */
> +       cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_CMN_CTRL,
> 0x0013);
> +
> +       /* wait for cmn_macro_pwr_en_ack */
> +       ret =3D wait_for_ack(cdns_phy, PHY_PMA_ISO_CMN_CTRL,
> CMN_MACRO_PWR_EN_ACK,
> +                          "MA output macro power up failed");
> +       if (ret < 0)
> +               return ret;
> +
> +       /* wait for cmn_ready */
> +       ret =3D wait_for_ack(cdns_phy, PHY_PMA_CMN_CTRL1, CMN_READY,
> +                          "PMA output ready failed");
> +       if (ret < 0)
> +               return ret;
> +
> +       for (k =3D 0; k < num_lanes; k++) {
> +               cdns_phy_reg_write(cdns_phy, TX_PSC_A0 | (k << 9),
> 0x6791);
> +               cdns_phy_reg_write(cdns_phy, TX_PSC_A1 | (k << 9),
> 0x6790);
> +               cdns_phy_reg_write(cdns_phy, TX_PSC_A2 | (k << 9),
> 0x0090);
> +               cdns_phy_reg_write(cdns_phy, TX_PSC_A3 | (k << 9),
> 0x0090);
> +
> +               val =3D cdns_phy_reg_read(cdns_phy, RX_PSC_CAL | (k <<
> 9));
> +               val &=3D 0xffbb;
> +               cdns_phy_reg_write(cdns_phy, RX_PSC_CAL | (k << 9),
> val);
> +
> +               val =3D cdns_phy_reg_read(cdns_phy, RX_PSC_A0 | (k <<
> 9));
> +               val &=3D 0xffbb;
> +               cdns_phy_reg_write(cdns_phy, RX_PSC_A0 | (k << 9), val);
> +       }
> +
> +       return 0;
> +}
> +
> +static int hdptx_hdmi_phy_cfg(struct cdns_hdptx_phy *cdns_phy, u32 rate)
> +{
> +       const struct hdptx_hdmi_ctrl *p_ctrl_table;
> +       const struct hdptx_hdmi_pll_tuning *p_pll_table;
> +       const u32 refclk_freq_khz =3D cdns_phy->ref_clk_rate / 1000;
> +       const bool pclk_in =3D false;
> +       u32 pixel_freq =3D rate;
> +       u32 vco_freq, char_freq;
> +       u32 div_total, feedback_factor;
> +       u32 i;
> +
> +       feedback_factor =3D hdptx_hdmi_feedback_factor(cdns_phy);
> +
> +       char_freq =3D pixel_freq * feedback_factor / 1000;
> +
> +       dev_dbg(cdns_phy->dev,
> +               "Pixel clock: (%d KHz), character clock: %d, bpc is
> (%0d-bit)\n",
> +               pixel_freq, char_freq, cdns_phy->hdmi.bpc);
> +
> +       /* Get right row from the ctrl_table table.
> +        * Check if 'pixel_freq_khz' value matches the PIXEL_CLK_FREQ
> column.
> +        * Consider only the rows with FEEDBACK_FACTOR column
> matching feedback_factor.
> +        */
> +       for (i =3D 0; i < ARRAY_SIZE(pixel_clk_output_ctrl_table); i++) {
> +               if (feedback_factor =3D=3D
> pixel_clk_output_ctrl_table[i].feedback_factor &&
> +                   pixel_freq =3D=3D
> pixel_clk_output_ctrl_table[i].pixel_clk_freq_min) {
> +                       p_ctrl_table =3D &pixel_clk_output_ctrl_table[i];
> +                       break;
> +               }
> +       }
> +       if (i =3D=3D ARRAY_SIZE(pixel_clk_output_ctrl_table)) {
> +               dev_warn(cdns_phy->dev,
> +                        "Pixel clk (%d KHz) not supported, bpc is
> (%0d-bit)\n",
> +                        pixel_freq, cdns_phy->hdmi.bpc);
> +               return -EINVAL;
> +       }
> +
> +       div_total =3D p_ctrl_table->pll_fb_div_total;
> +       vco_freq =3D refclk_freq_khz * div_total /
> p_ctrl_table->cmnda_pll0_ip_div;
> +
> +       /* Get right row from the pixel_clk_output_pll_table table.
> +        * Check if vco_freq_khz and feedback_div_total
> +        * column matching with pixel_clk_output_pll_table.
> +        */
> +       for (i =3D 0; i < ARRAY_SIZE(pixel_clk_output_pll_table); i++) {
> +               if (vco_freq =3D=3D pixel_clk_output_pll_table[i].vco_fre=
q_min
> &&
> +                   div_total =3D=3D
> pixel_clk_output_pll_table[i].feedback_div_total) {
> +                       p_pll_table =3D &pixel_clk_output_pll_table[i];
> +                       break;
> +               }
> +       }
> +       if (i =3D=3D ARRAY_SIZE(pixel_clk_output_pll_table)) {
> +               dev_warn(cdns_phy->dev, "VCO (%d KHz) not
> supported\n", vco_freq);
> +               return -EINVAL;
> +       }
> +       dev_dbg(cdns_phy->dev, "VCO frequency is (%d KHz)\n", vco_freq);
> +
> +       return hdptx_hdmi_phy_config(cdns_phy, p_ctrl_table, p_pll_table,
> pclk_in);
> +}
> +
> +static int hdptx_hdmi_phy_power_up(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       int ret =3D 0;
> +
> +       /* set Power State to A2 */
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A2);
> +
> +       cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_0, 1);
> +       cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_1, 1);
> +       cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_2, 1);
> +       cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_3, 1);
> +
> +       ret =3D wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A2_ACK,
> +                          "Wait A2 Ack failed");
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Power up ARC */
> +       hdptx_hdmi_arc_config(cdns_phy);
> +
> +       /* Configure PHY in A0 mode (PHY must be in the A0 power
> +        * state in order to transmit data)
> +        */
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A0);
> +
> +       return wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A0_ACK,
> +                           "Wait A0 Ack failed");
> +}
> +
> +static int hdptx_hdmi_phy_power_down(struct cdns_hdptx_phy *cdns_phy)
> +{
> +       u32 val;
> +
> +       val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
> +       val &=3D ~(POWER_STATE_A0 | POWER_STATE_A1 |
> POWER_STATE_A2 | POWER_STATE_A3);
> +       /* PHY_DP_MODE_CTL set to A3 power state */
> +       cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, val |
> POWER_STATE_A3);
> +
> +       return wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A3_ACK,
> +                           "Wait A3 Ack failed");
> +}
> +
> +static int cdns_hdptx_phy_on(struct phy *phy)
> +{
> +       struct cdns_hdptx_phy *cdns_phy =3D phy_get_drvdata(phy);
> +
> +       if (phy->attrs.mode =3D=3D PHY_MODE_DP)
> +               return hdptx_dp_phy_power_up(cdns_phy);
> +       else
> +               return hdptx_hdmi_phy_power_up(cdns_phy);
> +}
> +
> +static int cdns_hdptx_phy_off(struct phy *phy)
> +{
> +       struct cdns_hdptx_phy *cdns_phy =3D phy_get_drvdata(phy);
> +
> +       if (phy->attrs.mode =3D=3D PHY_MODE_DP)
> +               return hdptx_dp_phy_power_down(cdns_phy);
> +       else
> +               return hdptx_hdmi_phy_power_down(cdns_phy);
> +       return 0;
> +}
> +
> +static int
> +cdns_hdptx_phy_valid(struct phy *phy, enum phy_mode mode,
> +                         int submode, union phy_configure_opts
> *opts)
> +{
> +       u32 rate =3D opts->hdmi.pixel_clk_rate;
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(pixel_clk_output_ctrl_table); i++)
> +               if (rate =3D=3D
> pixel_clk_output_ctrl_table[i].pixel_clk_freq_min)
> +                       return 0;
> +
> +       return -EINVAL;
> +}
> +
> +static int cdns_hdptx_phy_init(struct phy *phy)
> +{
> +       return 0;
> +}
> +
> +static int cdns_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
> int submode)
> +{
> +       struct cdns_hdptx_phy *cdns_phy =3D phy_get_drvdata(phy);
> +       int ret =3D 0;
> +
> +       if (mode =3D=3D PHY_MODE_DP) {
> +               hdptx_dp_phy_ref_clock_type(cdns_phy);
> +
> +               /* PHY power up */
> +               ret =3D hdptx_dp_phy_power_up(cdns_phy);
> +               if (ret < 0)
> +                       return ret;
> +
> +               hdptx_dp_aux_cfg(cdns_phy);
> +       } else if (mode !=3D PHY_MODE_HDMI) {
> +               dev_err(&phy->dev, "Invalid PHY mode: %u\n", mode);
> +               return -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
> +static int cdns_hdptx_hdmi_configure(struct phy *phy,
> +                                    union phy_configure_opts
> *opts)
> +{
> +       struct cdns_hdptx_phy *cdns_phy =3D phy_get_drvdata(phy);
> +       int ret;
> +
> +       cdns_phy->hdmi.pixel_clk_rate =3D opts->hdmi.pixel_clk_rate;
> +       cdns_phy->hdmi.color_space =3D opts->hdmi.color_space;
> +       cdns_phy->hdmi.bpc =3D opts->hdmi.bpc;
> +
> +       /* Check HDMI FW alive before HDMI PHY init */
> +       ret =3D hdptx_phy_check_alive(cdns_phy);
> +       if (!ret) {
> +               dev_err(cdns_phy->dev, "NO HDMI FW running\n");
> +               return -ENXIO;
> +       }
> +
> +       /* Configure PHY */
> +       if (hdptx_hdmi_phy_cfg(cdns_phy, cdns_phy->hdmi.pixel_clk_rate)
> < 0) {
> +               dev_err(cdns_phy->dev, "failed to set phy pclock\n");
> +               return -EINVAL;
> +       }
> +
> +       ret =3D hdptx_hdmi_phy_power_up(cdns_phy);
> +       if (ret < 0)
> +               return ret;
> +
> +       hdptx_hdmi_phy_set_vswing(cdns_phy);
> +
> +       return 0;
> +}
> +
> +static int cdns_hdptx_configure(struct phy *phy,
> +                               union phy_configure_opts *opts)
> +{
> +       if (phy->attrs.mode =3D=3D PHY_MODE_DP)
> +               return cdns_hdptx_dp_configure(phy, opts);
> +       else
> +               return cdns_hdptx_hdmi_configure(phy, opts);
> +}
> +
> +static const struct phy_ops cdns_hdptx_phy_ops =3D {
> +       .init =3D cdns_hdptx_phy_init,
> +       .set_mode =3D cdns_hdptx_phy_set_mode,
> +       .configure =3D cdns_hdptx_configure,
> +       .power_on =3D cdns_hdptx_phy_on,
> +       .power_off =3D cdns_hdptx_phy_off,
> +       .validate =3D cdns_hdptx_phy_valid,
> +       .owner =3D THIS_MODULE,
> +};
> +
> +static int cdns_hdptx_phy_probe(struct platform_device *pdev)
> +{
> +       struct cdns_hdptx_phy *cdns_phy;
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *node =3D dev->of_node;
> +       struct phy_provider *phy_provider;
> +       struct resource *res;
> +       struct phy *phy;
> +       int ret;
> +
> +       cdns_phy =3D devm_kzalloc(dev, sizeof(*cdns_phy), GFP_KERNEL);
> +       if (!cdns_phy)
> +               return -ENOMEM;
> +
> +       dev_set_drvdata(dev, cdns_phy);
> +       cdns_phy->dev =3D dev;
> +       mutex_init(&cdns_phy->mbox_mutex);
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -ENODEV;
> +       cdns_phy->regs =3D devm_ioremap(dev, res->start,
> resource_size(res));
> +       if (IS_ERR(cdns_phy->regs))
> +               return PTR_ERR(cdns_phy->regs);
> +
> +       phy =3D devm_phy_create(dev, node, &cdns_hdptx_phy_ops);
> +       if (IS_ERR(phy))
> +               return PTR_ERR(phy);
> +
> +       cdns_phy->phy =3D phy;
> +       phy_set_drvdata(phy, cdns_phy);
> +
> +       /* init base struct for access mhdp mailbox */
> +       cdns_phy->base.dev =3D cdns_phy->dev;
> +       cdns_phy->base.regs =3D cdns_phy->regs;
> +       cdns_phy->base.mbox_mutex =3D &cdns_phy->mbox_mutex;
> +
> +       ret =3D hdptx_clk_enable(cdns_phy);
> +       if (ret) {
> +               dev_err(dev, "Init clk fail\n");
> +               return -EINVAL;
> +       }
> +
> +       phy_provider =3D devm_of_phy_provider_register(dev,
> of_phy_simple_xlate);
> +       if (IS_ERR(phy_provider)) {
> +               ret =3D PTR_ERR(phy_provider);
> +               goto clk_disable;
> +       }
> +
> +       dev_dbg(dev, "probe success!\n");
> +
> +       return 0;
> +
> +clk_disable:
> +       hdptx_clk_disable(cdns_phy);
> +
> +       return -EINVAL;
> +}
> +
> +static int cdns_hdptx_phy_remove(struct platform_device *pdev)
> +{
> +       struct cdns_hdptx_phy *cdns_phy =3D platform_get_drvdata(pdev);
> +
> +       hdptx_clk_disable(cdns_phy);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id cdns_hdptx_phy_of_match[] =3D {
> +       {.compatible =3D "fsl,imx8mq-hdptx-phy" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cdns_hdptx_phy_of_match);
> +
> +static struct platform_driver cdns_hdptx_phy_driver =3D {
> +       .probe =3D cdns_hdptx_phy_probe,
> +       .remove =3D cdns_hdptx_phy_remove,
> +       .driver =3D {
> +               .name   =3D "cdns-hdptx-phy",
> +               .of_match_table =3D cdns_hdptx_phy_of_match,
> +       }
> +};
> +module_platform_driver(cdns_hdptx_phy_driver);
> +
> +MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
> +MODULE_DESCRIPTION("Cadence HDP-TX DP/HDMI PHY driver");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1

