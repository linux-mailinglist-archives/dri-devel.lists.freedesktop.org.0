Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4338F85D1B0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 08:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D780C10E3DB;
	Wed, 21 Feb 2024 07:47:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QX6ZdvSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2049.outbound.protection.outlook.com [40.107.13.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1CB10E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 07:47:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfXzgqzVb65cdXvQ3SYo1LEkAAVrxJSaOGfX6wdWaVMtzR9T4N9vTD2PidAIhWbI8wdlEtCIACIDJFuTPRB5qb++ezCCsxyPtC+qJ5KWT7giF+OChi14STOAJI+SnDRpcfAomVG16FqsRzjPNqqHpqaU+fUD5r6CG+/oxTtUkOb+CDSje7X/YHu8Z5E0OQvu/EPJHzGeyMHBldtJWowM7fbKSgrOShHve3YD5kc2azAJSfc4fK2L8cH+5oa6hFyoI+DIoknjrHbflkdWb7Q2agGqso35krOF/6RP1yRD1ANBnuMZRJxb3j6HrO+sgqswO7f5MN+ijlgO+U0rjxR1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PbYy4XHe7vweG6d+Os+BMd1cHgv4xJ7mdLmJQ5QK5Y=;
 b=XA/xuv+q6KWBmjr9Fj0Iy0d9pYrAl1leycR8GQ2fXNMryHm3WhcIPTbe2IDk9gq7L57fuujDDQ1EE4quJD9Erff3Iex0r9AdLl1ah4Am8tTOaj5SKFCIzQWGUI0096HXvoKpLyNOd59D1IOjTuPYGNYviM8h+XqwpOy9Cu9jLTyDbqPLiDhECmm9daioiTkOmQgiE6alrVLV65y9nFqmcUNdnTCOxH8rFWigCLxLRXYhqetg3YChXjmVeJfaIIOQ5M9sEx/Mq77EOXjoztKR6icQVBeG+r3lXxT0+gs5JSnXn07b1MRuDcB80OfD3AdlG4Ssorl9wpJVtQIlze5PwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PbYy4XHe7vweG6d+Os+BMd1cHgv4xJ7mdLmJQ5QK5Y=;
 b=QX6ZdvSfyTSqTznoxo11snM67iFPF65b6uU777M9rNbHFT11PI4kyueAT1y9bJ01soNgKr9SGqSoktHoioILgUBR4tWKbuVv1G8fJxm84I+B0Zd+th73sE1cj7HxuqnEZM8tIep2K6Me+vd/ZI+HA/i+mHPr3FXZT2s4KTlgjW8=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM9PR04MB7650.eurprd04.prod.outlook.com (2603:10a6:20b:281::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Wed, 21 Feb
 2024 07:47:52 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9%5]) with mapi id 15.20.7292.029; Wed, 21 Feb 2024
 07:47:52 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
 <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>
Subject: Re: [PATCH v14 7/7] phy: freescale: Add HDMI PHY driver for i.MX8MQ
Thread-Topic: [PATCH v14 7/7] phy: freescale: Add HDMI PHY driver for i.MX8MQ
Thread-Index: AQHaZJpGxMD7Cd02sUC+SylT3jmyvw==
Date: Wed, 21 Feb 2024 07:47:52 +0000
Message-ID: <PAXPR04MB9448DE5926B60C36D5BFC96AF4572@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1708395604.git.Sandor.yu@nxp.com>
 <eb8c8aa5e5511d2bd462d05022764f67f7bb47c9.1708395604.git.Sandor.yu@nxp.com>
 <22191690.EfDdHjke4D@steina-w>
In-Reply-To: <22191690.EfDdHjke4D@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AM9PR04MB7650:EE_
x-ms-office365-filtering-correlation-id: 16328d34-4794-4fe1-0041-08dc32b1687e
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7FLRS3mV5dSqbFwwjzg/fC7n7z65M9o42gk/f1nAO4glsbPqlR5RRi/pVyWiuTG4YhwbiF3q9SOvo81A3eVUX13XQ/ZxurGCwXyyucJYU+I1S6t2QG9xV0PK11slly2vvZL8lJzGiAv68+nxHkbkREIto/wnwSkmRektz2+a3qvVqz5ltZY8oaaA1yOJbWFzeFJtHK2vKJ5YqBholSbycUrj3fhABuZnHHG4Dv/x2SQcbK0bd5blMZjWVyhzTbD+6uCk1mRg04VUR+IyinslEzcEDrIxCA1XLpzOltxhaI1novcxbY6++8RC2kS9NXrl2LDaXu71jApUYHNH+OfwCHf5kqAXts4H7yl1qN/AxoIDim5VAnXhToe/YPu6Jot8t/V0qHsvXrEJZSFs8WkhkXPOK8Crdhg3Im3l6IKYnn0L79huF56EaiKNY4hu/PM3EiPK9ZjW9qCBpT1GkxD4QS/gVCLALee4EFiDl4g54TCaCa8mJGHzqqE5V/ZbsycWpzhp1hR4mULXknNwUtH2o0i22oMVsISHzG4liTvvM5ibNM3ueGHu1xGRHqQY/DLzAFU8FmQuNjkBF5t7y9f10Tw/lVbSFKpiCaxOm0G3X2mjCBpfrKVqD2eR45IHJ1YP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009)(921011); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8rzGr0d0DK0UDKjPGxBoCmGG0Xlk/DwFco7nhyDanKcumX92gtGFv25evV?=
 =?iso-8859-1?Q?845/geqJmnnc6AjWxqTVAID/BlPGSeSgqGCCISI68IwJXLEERsklq2juz/?=
 =?iso-8859-1?Q?CBJmZqW+8VCkzN+Bx+WMgBQIiYdTXBhLNZ0FqddzzyQLhw607cqDMVTb50?=
 =?iso-8859-1?Q?KgamJwOBkgKwKL6IpoyxAcIUHrUUdqhMl2bg0IwBKUQIiqbwj0MNAHxq2W?=
 =?iso-8859-1?Q?hApDwQqE9GyBcA9/0h/8vk3FqimfPUXy5hywv0iRipeHyNEFnYp0DIVtRa?=
 =?iso-8859-1?Q?WVlY+pRllxPR6rHTm5vfvxJi96+KY3XPJqPVoADALa4AS51/x/ZsCiQz4O?=
 =?iso-8859-1?Q?+tykGpfbgNq8SYPXmHo+u5/QHAbLxDrBozTkwfzDerv2rK/Cy7OqtC0L1R?=
 =?iso-8859-1?Q?1Hb/HX5Zs9yStvofwwGxxzzVihm4S6mVx8FHRTFAl5xb6efAuhAUzLVBQ0?=
 =?iso-8859-1?Q?dwPAt/WKb/Mms7Ref6rN8GCQnETTb0ZooptEmApDO/8z/jhVPcQvsOHIZk?=
 =?iso-8859-1?Q?imeEV/Q7oAXMDNIYQSkevfWtZK6/USYPiQ/LWf9Ld+UsJoNzkaNwnRMHSQ?=
 =?iso-8859-1?Q?vPti/7PEqFPRTe6eEF0XoSbg0xfb3h0RmkCO4N3niq7rmO8FQlRTgqr/bf?=
 =?iso-8859-1?Q?xAWn0iynce73q+08wDZpx5QpX28retCaVg6KELfne6eauzSgnjrgoVbauB?=
 =?iso-8859-1?Q?xoeVhXU/HI6NB2zjMwU+unITabrXKxNA8b4JcUZ5csS65BZ5k5ib2T9cd3?=
 =?iso-8859-1?Q?SNEcvN1tqnVMM9heYva1tytn5GQnYIf8VqA8WDqXGap4atblMsS+Yajd3r?=
 =?iso-8859-1?Q?VAFWjAo9OzZ3BBRXVLy5z+LJ8TbpyQ8ktDiS2pVKiKdskra8D8RyKUs9bj?=
 =?iso-8859-1?Q?S6mJkOTLLKtZeDGjb4X0nSxUaEdjSnvOcK0KOrouFyhwgGbct6rInCOXIj?=
 =?iso-8859-1?Q?A7fhtzF4GQEAEgNz0hC9oyV9UEgtTZ6QbQwxyy/rWIvXIF170qhshn4Spv?=
 =?iso-8859-1?Q?zzDyTl4NMjCixsidQm5crN5xTAyvdLR+wdxZA04RQn3baKuC1aAofuk/eJ?=
 =?iso-8859-1?Q?BPQfdIhmfhThZhWQSLTlRp9d8WTkyRfAfX78YoKxt06P7dEKbR9eIVW+WV?=
 =?iso-8859-1?Q?GElj5gmaFOToCZwdQ9wGQm70+NT5K2ipczit2TSRBPvM+dcdIKS/NyKMEY?=
 =?iso-8859-1?Q?/rYiD6Q5nFA0FSpoOWWiClh0x3L/TAU8yELWuIMZqgSpVST4dOcsk69SUo?=
 =?iso-8859-1?Q?TEWs8zHc/b/n/RYsQq3mpIqfiXb9clvy/prhx4f5xrsPytDosNhVDAFNrp?=
 =?iso-8859-1?Q?952CpHCRgP8H+tssgPkfMRqW/S15qWX2Ng4ApT/RrDHY4POerGwQcGeAC3?=
 =?iso-8859-1?Q?uBIZ+zBqgihTLSUAS7/KipxgibEzreKcPv1effsN041BQ790Jn4EIt1i94?=
 =?iso-8859-1?Q?TMcy9oh1mxpT/3Wd71V0Uw+C/4AP/JfDDztNunWPUqCpAHW9tle+z0nbtn?=
 =?iso-8859-1?Q?qURBrE8v9EiLrIIwO64yfZCgASOSuTDv7/UubZAVoDGIIXFGDp4ypPCvW0?=
 =?iso-8859-1?Q?VFHWTs5fd2dM4u5ABRQBW8UP0rJTPwy0JKxwCQ+HZtoyvvE4xJUOn7LHbS?=
 =?iso-8859-1?Q?VBB1Ew6Ag9jeU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16328d34-4794-4fe1-0041-08dc32b1687e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 07:47:52.3417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vPlZS1bRSYCaDfp1CRdd5YQzVI/hqOMWwnB23UpmbkYfyavC4fBBPJ/rPfMD2z29Zj0tKFOeiu6GQDxgQuvcSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7650
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

Thanks for your comments,

>
> Hi,
>
> thanks for the update.
>
> Am Dienstag, 20. Februar 2024, 04:23:55 CET schrieb Sandor Yu:
> > Add Cadence HDP-TX HDMI PHY driver for i.MX8MQ.
> >
> > Cadence HDP-TX PHY could be put in either DP mode or HDMI mode base
> on
> > the configuration chosen.
> > HDMI PHY mode is configurated in the driver.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>
> This still works as before. I noticed there is a lot of code duplication =
with
> patch 6. IMHO these PHY drivers should be merged into a single one where
> the mode is configured using phy_set_mode() from cdns-mhdp8501-core.c.
> This nicely matches my concerns regarding patch 5.
>
Yes, there are some registers offset are same and the clock management func=
tion could be reused for DP and HDMI PHY driver.
But because of HDMI and DP PHY totally different work mode, the functions i=
n struct phy_ops,
Such as ->init, ->power_on/off and ->configure could not combine into a sin=
gle one,
So separate DP and HDMI PHY driver should be a better resolution.

B.R
Sandor


> Best regards,
> Alexander
>
> > ---
> > v13->v14:
> >  *No change.
> >
> > v12->v13:
> > - Fix build warning
> >
> > v11->v12:
> > - Adjust clk disable order.
> > - Return error code to replace -1 for function wait_for_ack().
> > - Use bool for variable pclk_in.
> > - Add year 2024 to copyright.
> >
> >  drivers/phy/freescale/Kconfig               |  10 +
> >  drivers/phy/freescale/Makefile              |   1 +
> >  drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c | 960
> > ++++++++++++++++++++
> >  3 files changed, 971 insertions(+)
> >  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
> >
> > diff --git a/drivers/phy/freescale/Kconfig
> > b/drivers/phy/freescale/Kconfig index c39709fd700ac..14f47b7cc77ab
> > 100644
> > --- a/drivers/phy/freescale/Kconfig
> > +++ b/drivers/phy/freescale/Kconfig
> > @@ -45,6 +45,16 @@ config PHY_FSL_IMX8MQ_DP
> >         Enable this to support the Cadence HDPTX DP PHY driver
> >         on i.MX8MQ SOC.
> >
> > +config PHY_FSL_IMX8MQ_HDMI
> > +     tristate "Freescale i.MX8MQ HDMI PHY support"
> > +     depends on OF && HAS_IOMEM
> > +     depends on COMMON_CLK
> > +     select GENERIC_PHY
> > +     select CDNS_MHDP_HELPER
> > +     help
> > +       Enable this to support the Cadence HDPTX HDMI PHY driver
> > +       on i.MX8MQ SOC.
> > +
> >  endif
> >
> >  config PHY_FSL_LYNX_28G
> > diff --git a/drivers/phy/freescale/Makefile
> > b/drivers/phy/freescale/Makefile index 47e5285209fa8..1380ac31c2ead
> > 100644
> > --- a/drivers/phy/freescale/Makefile
> > +++ b/drivers/phy/freescale/Makefile
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  obj-$(CONFIG_PHY_FSL_IMX8MQ_DP)              +=3D
> phy-fsl-imx8mq-dp.o
> > +obj-$(CONFIG_PHY_FSL_IMX8MQ_HDMI)    +=3D phy-fsl-imx8mq-hdmi.o
> >  obj-$(CONFIG_PHY_FSL_IMX8MQ_USB)     +=3D phy-fsl-imx8mq-usb.o
> >  obj-$(CONFIG_PHY_MIXEL_LVDS_PHY)     +=3D phy-fsl-imx8qm-lvds-phy.o
> >  obj-$(CONFIG_PHY_MIXEL_MIPI_DPHY)    +=3D phy-fsl-imx8-mipi-dphy.o
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
> > b/drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
> > new file mode 100644
> > index 0000000000000..537b1f45c91cc
> > --- /dev/null
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-hdmi.c
> > @@ -0,0 +1,960 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Cadence High-Definition Multimedia Interface (HDMI) PHY driver
> > + *
> > + * Copyright (C) 2022-2024 NXP Semiconductor, Inc.
> > + */
> > +#include <asm/unaligned.h>
> > +#include <drm/bridge/cdns-mhdp-helper.h> #include <linux/clk.h>
> > +#include <linux/kernel.h> #include <linux/phy/phy.h> #include
> > +<linux/platform_device.h> #include <linux/io.h>
> > +
> > +#define ADDR_PHY_AFE 0x80000
> > +
> > +/* PHY registers */
> > +#define CMN_SSM_BIAS_TMR                     0x0022
> > +#define CMN_PLLSM0_USER_DEF_CTRL             0x002f
> > +#define CMN_PSM_CLK_CTRL                     0x0061
> > +#define CMN_CDIAG_REFCLK_CTRL                        0x0062
> > +#define CMN_PLL0_VCOCAL_START                        0x0081
> > +#define CMN_PLL0_VCOCAL_INIT_TMR             0x0084
> > +#define CMN_PLL0_VCOCAL_ITER_TMR             0x0085
> > +#define CMN_TXPUCAL_CTRL                     0x00e0
> > +#define CMN_TXPDCAL_CTRL                     0x00f0
> > +#define CMN_TXPU_ADJ_CTRL                    0x0108
> > +#define CMN_TXPD_ADJ_CTRL                    0x010c
> > +#define CMN_DIAG_PLL0_FBH_OVRD                       0x01c0
> > +#define CMN_DIAG_PLL0_FBL_OVRD                       0x01c1
> > +#define CMN_DIAG_PLL0_OVRD                   0x01c2
> > +#define CMN_DIAG_PLL0_TEST_MODE                      0x01c4
> > +#define CMN_DIAG_PLL0_V2I_TUNE                       0x01c5
> > +#define CMN_DIAG_PLL0_CP_TUNE                        0x01c6
> > +#define CMN_DIAG_PLL0_LF_PROG                        0x01c7
> > +#define CMN_DIAG_PLL0_PTATIS_TUNE1           0x01c8
> > +#define CMN_DIAG_PLL0_PTATIS_TUNE2           0x01c9
> > +#define CMN_DIAG_PLL0_INCLK_CTRL             0x01ca
> > +#define CMN_DIAG_PLL0_PXL_DIVH                       0x01cb
> > +#define CMN_DIAG_PLL0_PXL_DIVL                       0x01cc
> > +#define CMN_DIAG_HSCLK_SEL                   0x01e0
> > +#define XCVR_PSM_RCTRL                               0x4001
> > +#define TX_TXCC_CAL_SCLR_MULT_0                      0x4047
> > +#define TX_TXCC_CPOST_MULT_00_0                      0x404c
> > +#define XCVR_DIAG_PLLDRC_CTRL                        0x40e0
> > +#define XCVR_DIAG_PLLDRC_CTRL                        0x40e0
> > +#define XCVR_DIAG_HSCLK_SEL                  0x40e1
> > +#define XCVR_DIAG_BIDI_CTRL                  0x40e8
> > +#define TX_PSC_A0                            0x4100
> > +#define TX_PSC_A1                            0x4101
> > +#define TX_PSC_A2                            0x4102
> > +#define TX_PSC_A3                            0x4103
> > +#define TX_DIAG_TX_CTRL                              0x41e0
> > +#define TX_DIAG_TX_DRV                               0x41e1
> > +#define TX_DIAG_BGREF_PREDRV_DELAY           0x41e7
> > +#define TX_DIAG_ACYA_0                               0x41ff
> > +#define TX_DIAG_ACYA_1                               0x43ff
> > +#define TX_DIAG_ACYA_2                               0x45ff
> > +#define TX_DIAG_ACYA_3                               0x47ff
> > +#define TX_ANA_CTRL_REG_1                    0x5020
> > +#define TX_ANA_CTRL_REG_2                    0x5021
> > +#define TX_DIG_CTRL_REG_2                    0x5024
> > +#define TXDA_CYA_AUXDA_CYA                   0x5025
> > +#define TX_ANA_CTRL_REG_3                    0x5026
> > +#define TX_ANA_CTRL_REG_4                    0x5027
> > +#define TX_ANA_CTRL_REG_5                    0x5029
> > +#define RX_PSC_A0                            0x8000
> > +#define RX_PSC_CAL                           0x8006
> > +#define PHY_HDP_MODE_CTRL                    0xc008
> > +#define PHY_HDP_CLK_CTL                              0xc009
> > +#define PHY_ISO_CMN_CTRL                     0xc010
> > +#define PHY_PMA_CMN_CTRL1                    0xc800
> > +#define PHY_PMA_ISO_CMN_CTRL                 0xc810
> > +#define PHY_PMA_ISO_PLL_CTRL1                        0xc812
> > +#define PHY_PMA_ISOLATION_CTRL                       0xc81f
> > +
> > +/* PHY_HDP_CLK_CTL */
> > +#define PLL_DATA_RATE_CLK_DIV_MASK           GENMASK(15, 8)
> > +#define PLL_DATA_RATE_CLK_DIV_HBR            0x24
> > +#define PLL_DATA_RATE_CLK_DIV_HBR2           0x12
> > +#define PLL_CLK_EN_ACK_EN                    BIT(3)
> > +#define PLL_CLK_EN                           BIT(2)
> > +#define PLL_READY                            BIT(1)
> > +#define PLL_EN                                       BIT(0)
> > +
> > +/* PHY_PMA_CMN_CTRL1 */
> > +#define CMA_REF_CLK_DIG_DIV_MASK             GENMASK(13, 12)
> > +#define CMA_REF_CLK_SEL_MASK                 GENMASK(6, 4)
> > +#define CMA_REF_CLK_RCV_EN_MASK                      BIT(3)
> > +#define CMA_REF_CLK_RCV_EN                   1
> > +#define CMN_READY                            BIT(0)
> > +
> > +/* PHY_PMA_ISO_PLL_CTRL1 */
> > +#define CMN_PLL0_CLK_DATART_DIV_MASK         GENMASK(7, 0)
> > +
> > +/* TX_DIAG_TX_DRV */
> > +#define TX_DRIVER_PROG_BOOST_ENABLE          BIT(10)
> > +#define TX_DRIVER_PROG_BOOST_LEVEL_MASK
> GENMASK(9, 8)
> > +#define TX_DRIVER_LDO_BG_DEPENDENT_REF_ENABLE        BIT(7)
> > +#define TX_DRIVER_LDO_BANDGAP_REF_ENABLE     BIT(6)
> > +
> > +/* TX_TXCC_CAL_SCLR_MULT_0 */
> > +#define SCALED_RESISTOR_CALIBRATION_CODE_ADD BIT(8)
> > +#define RESISTOR_CAL_MULT_VAL_32_128         BIT(5)
> > +
> > +/* CMN_CDIAG_REFCLK_CTRL */
> > +#define DIG_REF_CLK_DIV_SCALER_MASK          GENMASK(14, 12)
> > +#define REFCLK_TERMINATION_EN_OVERRIDE_EN    BIT(7)
> > +#define REFCLK_TERMINATION_EN_OVERRIDE               BIT(6)
> > +
> > +/* CMN_DIAG_HSCLK_SEL */
> > +#define HSCLK1_SEL_MASK
> GENMASK(5, 4)
> > +#define HSCLK0_SEL_MASK
> GENMASK(1, 0)
> > +
> > +/* XCVR_DIAG_HSCLK_SEL */
> > +#define HSCLK_SEL_MODE3_MASK                 GENMASK(13, 12)
> > +#define HSCLK_SEL_MODE3_HSCLK1                       1
> > +
> > +/* CMN_PLL0_VCOCAL_START */
> > +#define VCO_CALIB_CODE_START_POINT_VAL_MASK  GENMASK(8, 0)
> > +
> > +/* CMN_DIAG_PLL0_FBH_OVRD */
> > +#define PLL_FEEDBACK_DIV_HI_OVERRIDE_EN              BIT(15)
> > +
> > +/* CMN_DIAG_PLL0_FBL_OVRD */
> > +#define PLL_FEEDBACK_DIV_LO_OVERRIDE_EN              BIT(15)
> > +
> > +/* CMN_DIAG_PLL0_PXL_DIVH */
> > +#define PLL_PCLK_DIV_EN                              BIT(15)
> > +
> > +/* XCVR_DIAG_PLLDRC_CTRL */
> > +#define DPLL_CLK_SEL_MODE3                   BIT(14)
> > +
> > +/* TX_DIAG_TX_CTRL */
> > +#define TX_IF_SUBRATE_MODE3_MASK             GENMASK(7, 6)
> > +
> > +/* PHY_HDP_MODE_CTRL */
> > +#define POWER_STATE_A3_ACK                   BIT(7)
> > +#define POWER_STATE_A2_ACK                   BIT(6)
> > +#define POWER_STATE_A1_ACK                   BIT(5)
> > +#define POWER_STATE_A0_ACK                   BIT(4)
> > +#define POWER_STATE_A3                               BIT(3)
> > +#define POWER_STATE_A2                               BIT(2)
> > +#define POWER_STATE_A1                               BIT(1)
> > +#define POWER_STATE_A0                               BIT(0)
> > +
> > +/* PHY_PMA_ISO_CMN_CTRL */
> > +#define CMN_MACRO_PWR_EN_ACK                 BIT(5)
> > +
> > +#define KEEP_ALIVE           0x18
> > +
> > +#define REF_CLK_27MHZ                27000000
> > +
> > +/* HDMI TX clock control settings */
> > +struct hdptx_hdmi_ctrl {
> > +     u32 pixel_clk_freq_min;
> > +     u32 pixel_clk_freq_max;
> > +     u32 feedback_factor;
> > +     u32 data_range_kbps_min;
> > +     u32 data_range_kbps_max;
> > +     u32 cmnda_pll0_ip_div;
> > +     u32 cmn_ref_clk_dig_div;
> > +     u32 ref_clk_divider_scaler;
> > +     u32 pll_fb_div_total;
> > +     u32 cmnda_pll0_fb_div_low;
> > +     u32 cmnda_pll0_fb_div_high;
> > +     u32 pixel_div_total;
> > +     u32 cmnda_pll0_pxdiv_low;
> > +     u32 cmnda_pll0_pxdiv_high;
> > +     u32 vco_freq_min;
> > +     u32 vco_freq_max;
> > +     u32 vco_ring_select;
> > +     u32 cmnda_hs_clk_0_sel;
> > +     u32 cmnda_hs_clk_1_sel;
> > +     u32 hsclk_div_at_xcvr;
> > +     u32 hsclk_div_tx_sub_rate;
> > +     u32 cmnda_pll0_hs_sym_div_sel;
> > +     u32 cmnda_pll0_clk_freq_min;
> > +     u32 cmnda_pll0_clk_freq_max;
> > +};
> > +
> > +struct cdns_hdptx_hdmi_phy {
> > +     struct cdns_mhdp_base base;
> > +
> > +     void __iomem *regs;     /* DPTX registers base */
> > +     struct mutex mbox_mutex; /* mutex to protect mailbox */
> > +     struct device *dev;
> > +     struct phy *phy;
> > +     struct clk *ref_clk, *apb_clk;
> > +     u32 ref_clk_rate;
> > +     u32 pixel_clk_rate;
> > +     enum hdmi_colorspace color_space;
> > +     u32 bpc;
> > +};
> > +
> > +/* HDMI TX clock control settings, pixel clock is output */ static
> > +const struct hdptx_hdmi_ctrl pixel_clk_output_ctrl_table[] =3D {
> > +/*Minclk  Maxclk Fdbak  DR_min   DR_max  ip_d  dig  DS    Totl
> */
> > +{ 27000,  27000, 1000,  270000,  270000, 0x03, 0x1, 0x1,  240, 0x0bc,
> > +0x030,  80, 0x026, 0x026, 2160000, 2160000, 0, 2, 2, 2, 4, 0x3,
> > +27000,  27000}, { 27000,  27000, 1250,  337500,  337500, 0x03, 0x1,
> > +0x1,  300, 0x0ec, 0x03c, 100, 0x030, 0x030, 2700000, 2700000, 0, 2,
> > +2, 2, 4, 0x3,  33750,  33750}, { 27000,  27000, 1500,  405000,
> > +405000, 0x03, 0x1, 0x1,  360, 0x11c, 0x048, 120, 0x03a, 0x03a,
> > +3240000, 3240000, 0, 2, 2, 2, 4, 0x3,  40500,  40500}, { 27000,
> > +27000, 2000,  540000,  540000, 0x03, 0x1, 0x1,  240, 0x0bc, 0x030,
> > +80, 0x026, 0x026, 2160000, 2160000, 0, 2, 2, 2, 4, 0x2,  54000,
> > +54000}, { 54000,  54000, 1000,  540000,  540000, 0x03, 0x1, 0x1,
> > +480, 0x17c, 0x060,  80, 0x026, 0x026, 4320000, 4320000, 1, 2, 2, 2,
> > +4, 0x3,  54000,  54000}, { 54000,  54000, 1250,  675000,  675000,
> > +0x04, 0x1, 0x1,  400, 0x13c, 0x050,  50, 0x017, 0x017, 2700000,
> > +2700000, 0, 1, 1, 2, 4, 0x2,  67500,  67500}, { 54000,  54000, 1500,
> > +810000,  810000, 0x04, 0x1, 0x1,  480, 0x17c, 0x060,  60, 0x01c,
> > +0x01c, 3240000, 3240000, 0, 2, 2, 2, 2, 0x2,  81000,  81000}, {
> > +54000,  54000, 2000, 1080000, 1080000, 0x03, 0x1, 0x1,  240, 0x0bc,
> > +0x030,  40, 0x012, 0x012, 2160000, 2160000, 0, 2, 2, 2, 1, 0x1,
> > +108000, 108000}, { 74250,  74250, 1000,  742500,  742500, 0x03, 0x1,
> > +0x1,  660, 0x20c, 0x084,  80, 0x026, 0x026, 5940000, 5940000, 1, 2,
> > +2, 2, 4, 0x3,  74250,  74250}, { 74250,  74250, 1250,  928125,
> > +928125, 0x04, 0x1, 0x1,  550, 0x1b4, 0x06e,  50, 0x017, 0x017,
> > +3712500, 3712500, 1, 1, 1, 2, 4, 0x2,  92812,  92812}, { 74250,
> > +74250, 1500, 1113750, 1113750, 0x04, 0x1, 0x1,  660, 0x20c, 0x084,
> > +60, 0x01c, 0x01c, 4455000, 4455000, 1, 2, 2, 2, 2, 0x2, 111375,
> > +111375}, { 74250,  74250, 2000, 1485000, 1485000, 0x03, 0x1, 0x1,
> > +330, 0x104, 0x042,  40, 0x012, 0x012, 2970000, 2970000, 0, 2, 2, 2,
> > +1, 0x1, 148500, 148500}, { 99000,  99000, 1000,  990000,  990000,
> > +0x03, 0x1, 0x1,  440, 0x15c, 0x058,  40, 0x012, 0x012, 3960000,
> > +3960000, 1, 2, 2, 2, 2, 0x2,  99000,  99000}, { 99000,  99000, 1250,
> > +1237500, 1237500, 0x03, 0x1, 0x1,  275, 0x0d8, 0x037,  25, 0x00b,
> > +0x00a, 2475000, 2475000, 0, 1, 1, 2, 2, 0x1, 123750, 123750}, {
> > +99000,  99000, 1500, 1485000, 1485000, 0x03, 0x1, 0x1,  330, 0x104,
> > +0x042,  30, 0x00d, 0x00d, 2970000, 2970000, 0, 2, 2, 2, 1, 0x1,
> > +148500, 148500}, { 99000,  99000, 2000, 1980000, 1980000, 0x03, 0x1,
> > +0x1,  440, 0x15c, 0x058,  40, 0x012, 0x012, 3960000, 3960000, 1, 2,
> > +2, 2, 1, 0x1, 198000, 198000}, {148500, 148500, 1000, 1485000,
> > +1485000, 0x03, 0x1, 0x1,  660, 0x20c, 0x084,  40, 0x012, 0x012,
> > +5940000, 5940000, 1, 2, 2, 2, 2, 0x2, 148500, 148500}, {148500,
> > +148500, 1250, 1856250, 1856250, 0x04, 0x1, 0x1,  550, 0x1b4, 0x06e,
> > +25, 0x00b, 0x00a, 3712500, 3712500, 1, 1, 1, 2, 2, 0x1, 185625,
> > +185625}, {148500, 148500, 1500, 2227500, 2227500, 0x03, 0x1, 0x1,
> > +495, 0x188, 0x063,  30, 0x00d, 0x00d, 4455000, 4455000, 1, 1, 1, 2,
> > +2, 0x1, 222750, 222750}, {148500, 148500, 2000, 2970000, 2970000,
> > +0x03, 0x1, 0x1,  660, 0x20c, 0x084,  40, 0x012, 0x012, 5940000,
> > +5940000, 1, 2, 2, 2, 1, 0x1, 297000, 297000}, {198000, 198000, 1000,
> > +1980000, 1980000, 0x03, 0x1, 0x1,  220, 0x0ac, 0x02c,  10, 0x003,
> > +0x003, 1980000, 1980000, 0, 1, 1, 2, 1, 0x0, 198000, 198000},
> > +{198000, 198000, 1250, 2475000, 2475000, 0x03, 0x1, 0x1,  550, 0x1b4,
> > +0x06e,  25, 0x00b, 0x00a, 4950000, 4950000, 1, 1, 1, 2, 2, 0x1,
> > +247500, 247500}, {198000, 198000, 1500, 2970000, 2970000, 0x03, 0x1,
> > +0x1,  330, 0x104, 0x042,  15, 0x006, 0x005, 2970000, 2970000, 0, 1,
> > +1, 2, 1, 0x0, 297000, 297000}, {198000, 198000, 2000, 3960000,
> > +3960000, 0x03, 0x1, 0x1,  440, 0x15c, 0x058,  20, 0x008, 0x008,
> > +3960000, 3960000, 1, 1, 1, 2, 1, 0x0, 396000, 396000}, {297000,
> > +297000, 1000, 2970000, 2970000, 0x03, 0x1, 0x1,  330, 0x104, 0x042,
> > +10, 0x003, 0x003, 2970000, 2970000, 0, 1, 1, 2, 1, 0x0, 297000,
> > +297000}, {297000, 297000, 1500, 4455000, 4455000, 0x03, 0x1, 0x1,
> > +495, 0x188, 0x063,  15, 0x006, 0x005, 4455000, 4455000, 1, 1, 1, 2,
> > +1, 0x0, 445500, 445500}, {297000, 297000, 2000, 5940000, 5940000,
> > +0x03, 0x1, 0x1,  660, 0x20c, 0x084,  20, 0x008, 0x008, 5940000,
> > +5940000, 1, 1, 1, 2, 1, 0x0, 594000, 594000}, {594000, 594000, 1000,
> > +5940000, 5940000, 0x03, 0x1, 0x1,  660, 0x20c, 0x084,  10, 0x003,
> > +0x003, 5940000, 5940000, 1, 1, 1, 2, 1, 0x0, 594000, 594000},
> > +{594000, 594000,  750, 4455000, 4455000, 0x03, 0x1, 0x1,  495, 0x188,
> > +0x063,  10, 0x003, 0x003, 4455000, 4455000, 1, 1, 1, 2, 1, 0x0,
> > +445500, 445500}, {594000, 594000,  625, 3712500, 3712500, 0x04, 0x1,
> > +0x1,  550, 0x1b4, 0x06e,  10, 0x003, 0x003, 3712500, 3712500, 1, 1,
> > +1, 2, 1, 0x0, 371250, 371250}, {594000, 594000,  500, 2970000,
> > +2970000, 0x03, 0x1, 0x1,  660, 0x20c, 0x084,  10, 0x003, 0x003,
> > +5940000, 5940000, 1, 1, 1, 2, 2, 0x1, 297000, 297000}, };
> > +
> > +/* HDMI TX PLL tuning settings */
> > +struct hdptx_hdmi_pll_tuning {
> > +     u32 vco_freq_bin;
> > +     u32 vco_freq_min;
> > +     u32 vco_freq_max;
> > +     u32 volt_to_current_coarse;
> > +     u32 volt_to_current;
> > +     u32 ndac_ctrl;
> > +     u32 pmos_ctrl;
> > +     u32 ptat_ndac_ctrl;
> > +     u32 feedback_div_total;
> > +     u32 charge_pump_gain;
> > +     u32 coarse_code;
> > +     u32 v2i_code;
> > +     u32 vco_cal_code;
> > +};
> > +
> > +/* HDMI TX PLL tuning settings, pixel clock is output */ static const
> > +struct hdptx_hdmi_pll_tuning pixel_clk_output_pll_table[] =3D { /*bin
> > +VCO_freq min/max  coar  cod NDAC  PMOS PTAT div-T P-Gain Coa V2I
> CAL
> > +*/ {  1, 1980000, 1980000, 0x4, 0x3, 0x0, 0x09, 0x09, 220, 0x42, 160,
> > +5, 183 }, {  2, 2160000, 2160000, 0x4, 0x3, 0x0, 0x09, 0x09, 240,
> > +0x42, 166, 6, 208 }, {  3, 2475000, 2475000, 0x5, 0x3, 0x1, 0x00,
> > +0x07, 275, 0x42, 167, 6, 209 }, {  4, 2700000, 2700000, 0x5, 0x3,
> > +0x1, 0x00, 0x07, 300, 0x42, 188, 6, 230 }, {  4, 2700000, 2700000,
> > +0x5, 0x3, 0x1, 0x00, 0x07, 400, 0x4c, 188, 6, 230 }, {  5, 2970000,
> > +2970000, 0x6, 0x3, 0x1, 0x00, 0x07, 330, 0x42, 183, 6, 225 }, {  6,
> > +3240000, 3240000, 0x6, 0x3, 0x1, 0x00, 0x07, 360, 0x42, 203, 7, 256
> > +}, {  6, 3240000, 3240000, 0x6, 0x3, 0x1, 0x00, 0x07, 480, 0x4c, 203,
> > +7, 256 }, {  7, 3712500, 3712500, 0x4, 0x3, 0x0, 0x07, 0x0F, 550,
> > +0x4c, 212, 7, 257 }, {  8, 3960000, 3960000, 0x5, 0x3, 0x0, 0x07,
> > +0x0F, 440, 0x42, 184, 6, 226 }, {  9, 4320000, 4320000, 0x5, 0x3,
> > +0x1, 0x07, 0x0F, 480, 0x42, 205, 7, 258 }, { 10, 4455000, 4455000,
> > +0x5, 0x3, 0x0, 0x07, 0x0F, 495, 0x42, 219, 7, 272 }, { 10, 4455000,
> > +4455000, 0x5, 0x3, 0x0, 0x07, 0x0F, 660, 0x4c, 219, 7, 272 }, { 11,
> > +4950000, 4950000, 0x6, 0x3, 0x1, 0x00, 0x07, 550, 0x42, 213, 7, 258
> > +}, { 12, 5940000, 5940000, 0x7, 0x3, 0x1, 0x00, 0x07, 660, 0x42, 244,
> > +8, 292 }, };
> > +
> > +static int cdns_phy_reg_write(struct cdns_hdptx_hdmi_phy *cdns_phy,
> > +u32 addr, u32 val) {
> > +     return cdns_mhdp_reg_write(&cdns_phy->base, ADDR_PHY_AFE +
> (addr
> > +<< 2), val); }
> > +
> > +static u32 cdns_phy_reg_read(struct cdns_hdptx_hdmi_phy *cdns_phy,
> > +u32 addr) {
> > +     u32 reg32;
> > +
> > +     cdns_mhdp_reg_read(&cdns_phy->base, ADDR_PHY_AFE + (addr <<
> 2),
> > + &reg32);
> > +
> > +     return reg32;
> > +}
> > +
> > +static int wait_for_ack(struct cdns_hdptx_hdmi_phy *cdns_phy, u32 reg,
> u32 mask,
> > +                     const char *err_msg) {
> > +     u32 val, i;
> > +
> > +     for (i =3D 0; i < 10; i++) {
> > +             val =3D cdns_phy_reg_read(cdns_phy, reg);
> > +             if (val & mask)
> > +                     return 0;
> > +             msleep(20);
> > +     }
> > +
> > +     dev_err(cdns_phy->dev, "%s\n", err_msg);
> > +     return -ETIMEDOUT;
> > +}
> > +
> > +static bool hdptx_phy_check_alive(struct cdns_hdptx_hdmi_phy
> > +*cdns_phy) {
> > +     u32  alive, newalive;
> > +     u8 retries_left =3D 50;
> > +
> > +     alive =3D readl(cdns_phy->regs + KEEP_ALIVE);
> > +
> > +     while (retries_left--) {
> > +             udelay(2);
> > +
> > +             newalive =3D readl(cdns_phy->regs + KEEP_ALIVE);
> > +             if (alive =3D=3D newalive)
> > +                     continue;
> > +             return true;
> > +     }
> > +     return false;
> > +}
> > +
> > +static int hdptx_hdmi_clk_enable(struct cdns_hdptx_hdmi_phy
> > +*cdns_phy) {
> > +     struct device *dev =3D cdns_phy->dev;
> > +     u32 ref_clk_rate;
> > +     int ret;
> > +
> > +     cdns_phy->ref_clk =3D devm_clk_get(dev, "ref");
> > +     if (IS_ERR(cdns_phy->ref_clk)) {
> > +             dev_err(dev, "phy ref clock not found\n");
> > +             return PTR_ERR(cdns_phy->ref_clk);
> > +     }
> > +
> > +     cdns_phy->apb_clk =3D devm_clk_get(dev, "apb");
> > +     if (IS_ERR(cdns_phy->apb_clk)) {
> > +             dev_err(dev, "phy apb clock not found\n");
> > +             return PTR_ERR(cdns_phy->apb_clk);
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(cdns_phy->ref_clk);
> > +     if (ret) {
> > +             dev_err(cdns_phy->dev, "Failed to prepare ref clock\n");
> > +             return ret;
> > +     }
> > +
> > +     ref_clk_rate =3D clk_get_rate(cdns_phy->ref_clk);
> > +     if (!ref_clk_rate) {
> > +             dev_err(cdns_phy->dev, "Failed to get ref clock rate\n");
> > +             goto err_ref_clk;
> > +     }
> > +
> > +     if (ref_clk_rate =3D=3D REF_CLK_27MHZ) {
> > +             cdns_phy->ref_clk_rate =3D ref_clk_rate;
> > +     } else {
> > +             dev_err(cdns_phy->dev, "Not support Ref Clock
> Rate(%dHz)\n", ref_clk_rate);
> > +             goto err_ref_clk;
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(cdns_phy->apb_clk);
> > +     if (ret) {
> > +             dev_err(cdns_phy->dev, "Failed to prepare apb clock\n");
> > +             goto err_ref_clk;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_ref_clk:
> > +     clk_disable_unprepare(cdns_phy->ref_clk);
> > +     return -EINVAL;
> > +}
> > +
> > +static void hdptx_hdmi_clk_disable(struct cdns_hdptx_hdmi_phy
> > +*cdns_phy) {
> > +     clk_disable_unprepare(cdns_phy->apb_clk);
> > +     clk_disable_unprepare(cdns_phy->ref_clk);
> > +}
> > +
> > +static void hdptx_hdmi_arc_config(struct cdns_hdptx_hdmi_phy
> > +*cdns_phy) {
> > +     u16 txpu_calib_code;
> > +     u16 txpd_calib_code;
> > +     u16 txpu_adj_calib_code;
> > +     u16 txpd_adj_calib_code;
> > +     u16 prev_calib_code;
> > +     u16 new_calib_code;
> > +     u16 rdata;
> > +
> > +     /* Power ARC */
> > +     cdns_phy_reg_write(cdns_phy, TXDA_CYA_AUXDA_CYA, 0x0001);
> > +
> > +     prev_calib_code =3D cdns_phy_reg_read(cdns_phy,
> TX_DIG_CTRL_REG_2);
> > +     txpu_calib_code =3D cdns_phy_reg_read(cdns_phy,
> CMN_TXPUCAL_CTRL);
> > +     txpd_calib_code =3D cdns_phy_reg_read(cdns_phy,
> CMN_TXPDCAL_CTRL);
> > +     txpu_adj_calib_code =3D cdns_phy_reg_read(cdns_phy,
> CMN_TXPU_ADJ_CTRL);
> > +     txpd_adj_calib_code =3D cdns_phy_reg_read(cdns_phy,
> > + CMN_TXPD_ADJ_CTRL);
> > +
> > +     new_calib_code =3D ((txpu_calib_code + txpd_calib_code) / 2)
> > +             + txpu_adj_calib_code + txpd_adj_calib_code;
> > +
> > +     if (new_calib_code !=3D prev_calib_code) {
> > +             rdata =3D cdns_phy_reg_read(cdns_phy,
> TX_ANA_CTRL_REG_1);
> > +             rdata &=3D 0xdfff;
> > +             cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1,
> rdata);
> > +             cdns_phy_reg_write(cdns_phy, TX_DIG_CTRL_REG_2,
> new_calib_code);
> > +             mdelay(10);
> > +             rdata |=3D 0x2000;
> > +             cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1,
> rdata);
> > +             usleep_range(150, 250);
> > +     }
> > +
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0100);
> > +     usleep_range(100, 200);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x0300);
> > +     usleep_range(100, 200);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_3, 0x0000);
> > +     usleep_range(100, 200);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2008);
> > +     usleep_range(100, 200);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2018);
> > +     usleep_range(100, 200);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2098);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030c);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_5, 0x0010);
> > +     usleep_range(100, 200);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_4, 0x4001);
> > +     mdelay(5);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_1, 0x2198);
> > +     mdelay(5);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030d);
> > +     usleep_range(100, 200);
> > +     cdns_phy_reg_write(cdns_phy, TX_ANA_CTRL_REG_2, 0x030f); }
> > +
> > +static void hdptx_hdmi_phy_set_vswing(struct cdns_hdptx_hdmi_phy
> > +*cdns_phy) {
> > +     u32 k;
> > +     const u32 num_lanes =3D 4;
> > +
> > +     for (k =3D 0; k < num_lanes; k++) {
> > +             cdns_phy_reg_write(cdns_phy, (TX_DIAG_TX_DRV | (k <<
> 9)),
> > +
> TX_DRIVER_PROG_BOOST_ENABLE |
> > +
> FIELD_PREP(TX_DRIVER_PROG_BOOST_LEVEL_MASK, 3) |
> > +
> TX_DRIVER_LDO_BG_DEPENDENT_REF_ENABLE |
> > +
> TX_DRIVER_LDO_BANDGAP_REF_ENABLE);
> > +             cdns_phy_reg_write(cdns_phy,
> (TX_TXCC_CPOST_MULT_00_0 | (k << 9)), 0x0);
> > +             cdns_phy_reg_write(cdns_phy,
> (TX_TXCC_CAL_SCLR_MULT_0 | (k << 9)),
> > +
> SCALED_RESISTOR_CALIBRATION_CODE_ADD |
> > +
> RESISTOR_CAL_MULT_VAL_32_128);
> > +     }
> > +}
> > +
> > +static int hdptx_hdmi_feedback_factor(struct cdns_hdptx_hdmi_phy
> > +*cdns_phy) {
> > +     u32 feedback_factor;
> > +
> > +     switch (cdns_phy->color_space) {
> > +     case HDMI_COLORSPACE_YUV422:
> > +             feedback_factor =3D 1000;
> > +             break;
> > +
> > +     case HDMI_COLORSPACE_YUV420:
> > +             switch (cdns_phy->bpc) {
> > +             case 8:
> > +                     feedback_factor =3D 500;
> > +                     break;
> > +             case 10:
> > +                     feedback_factor =3D 625;
> > +                     break;
> > +             case 12:
> > +                     feedback_factor =3D 750;
> > +                     break;
> > +             case 16:
> > +                     feedback_factor =3D 1000;
> > +                     break;
> > +             default:
> > +                     dev_dbg(cdns_phy->dev, "Invalid
> ColorDepth\n");
> > +                     return 0;
> > +             }
> > +             break;
> > +
> > +     default:
> > +             /* Assume RGB/YUV444 */
> > +             switch (cdns_phy->bpc) {
> > +             case 10:
> > +                     feedback_factor =3D 1250;
> > +                     break;
> > +             case 12:
> > +                     feedback_factor =3D 1500;
> > +                     break;
> > +             case 16:
> > +                     feedback_factor =3D 2000;
> > +                     break;
> > +             default:
> > +                     feedback_factor =3D 1000;
> > +             }
> > +     }
> > +
> > +     return feedback_factor;
> > +}
> > +
> > +static int hdptx_hdmi_phy_config(struct cdns_hdptx_hdmi_phy *cdns_phy,
> > +                              const struct hdptx_hdmi_ctrl
> *p_ctrl_table,
> > +                              const struct hdptx_hdmi_pll_tuning
> *p_pll_table,
> > +                              bool pclk_in) {
> > +     const u32 num_lanes =3D 4;
> > +     u32 val, k;
> > +     int ret;
> > +
> > +     /* enable PHY isolation mode only for CMN */
> > +     cdns_phy_reg_write(cdns_phy, PHY_PMA_ISOLATION_CTRL,
> 0xd000);
> > +
> > +     /* set cmn_pll0_clk_datart1_div/cmn_pll0_clk_datart0_div dividers
> */
> > +     val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_ISO_PLL_CTRL1);
> > +     val &=3D ~CMN_PLL0_CLK_DATART_DIV_MASK;
> > +     val |=3D FIELD_PREP(CMN_PLL0_CLK_DATART_DIV_MASK, 0x12);
> > +     cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_PLL_CTRL1, val);
> > +
> > +     /* assert PHY reset from isolation register */
> > +     cdns_phy_reg_write(cdns_phy, PHY_ISO_CMN_CTRL, 0x0000);
> > +     /* assert PMA CMN reset */
> > +     cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_CMN_CTRL, 0x0000);
> > +
> > +     /* register XCVR_DIAG_BIDI_CTRL */
> > +     for (k =3D 0; k < num_lanes; k++)
> > +             cdns_phy_reg_write(cdns_phy, XCVR_DIAG_BIDI_CTRL |
> (k <<
> > + 9), 0x00ff);
> > +
> > +     /* Describing Task phy_cfg_hdp */
> > +     val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
> > +     val &=3D ~CMA_REF_CLK_RCV_EN_MASK;
> > +     val |=3D FIELD_PREP(CMA_REF_CLK_RCV_EN_MASK,
> CMA_REF_CLK_RCV_EN);
> > +     cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
> > +
> > +     /* PHY Registers */
> > +     val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
> > +     val &=3D ~CMA_REF_CLK_DIG_DIV_MASK;
> > +     val |=3D FIELD_PREP(CMA_REF_CLK_DIG_DIV_MASK,
> p_ctrl_table->cmn_ref_clk_dig_div);
> > +     cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
> > +
> > +     val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_CLK_CTL);
> > +     val &=3D ~PLL_DATA_RATE_CLK_DIV_MASK;
> > +     val |=3D FIELD_PREP(PLL_DATA_RATE_CLK_DIV_MASK,
> > +                       PLL_DATA_RATE_CLK_DIV_HBR2);
> > +     cdns_phy_reg_write(cdns_phy, PHY_HDP_CLK_CTL, val);
> > +
> > +     /* Common control module control and diagnostic registers */
> > +     val =3D cdns_phy_reg_read(cdns_phy, CMN_CDIAG_REFCLK_CTRL);
> > +     val &=3D ~DIG_REF_CLK_DIV_SCALER_MASK;
> > +     val |=3D FIELD_PREP(DIG_REF_CLK_DIV_SCALER_MASK,
> p_ctrl_table->ref_clk_divider_scaler);
> > +     val |=3D REFCLK_TERMINATION_EN_OVERRIDE_EN |
> REFCLK_TERMINATION_EN_OVERRIDE;
> > +     cdns_phy_reg_write(cdns_phy, CMN_CDIAG_REFCLK_CTRL, val);
> > +
> > +     /* High speed clock used */
> > +     val =3D cdns_phy_reg_read(cdns_phy, CMN_DIAG_HSCLK_SEL);
> > +     val &=3D ~(HSCLK1_SEL_MASK | HSCLK0_SEL_MASK);
> > +     val |=3D FIELD_PREP(HSCLK1_SEL_MASK,
> (p_ctrl_table->cmnda_hs_clk_1_sel >> 1));
> > +     val |=3D FIELD_PREP(HSCLK0_SEL_MASK,
> (p_ctrl_table->cmnda_hs_clk_0_sel >> 1));
> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_HSCLK_SEL, val);
> > +
> > +     for (k =3D 0; k < num_lanes; k++) {
> > +             val =3D cdns_phy_reg_read(cdns_phy,
> (XCVR_DIAG_HSCLK_SEL | (k << 9)));
> > +             val &=3D ~HSCLK_SEL_MODE3_MASK;
> > +             val |=3D FIELD_PREP(HSCLK_SEL_MODE3_MASK,
> > +
> (p_ctrl_table->cmnda_hs_clk_0_sel >> 1));
> > +             cdns_phy_reg_write(cdns_phy, (XCVR_DIAG_HSCLK_SEL |
> (k << 9)), val);
> > +     }
> > +
> > +     /* PLL 0 control state machine registers */
> > +     val =3D p_ctrl_table->vco_ring_select << 12;
> > +     cdns_phy_reg_write(cdns_phy, CMN_PLLSM0_USER_DEF_CTRL,
> val);
> > +
> > +     if (pclk_in) {
> > +             val =3D 0x30a0;
> > +     } else {
> > +             val =3D cdns_phy_reg_read(cdns_phy,
> CMN_PLL0_VCOCAL_START);
> > +             val &=3D ~VCO_CALIB_CODE_START_POINT_VAL_MASK;
> > +             val |=3D
> FIELD_PREP(VCO_CALIB_CODE_START_POINT_VAL_MASK,
> > +                               p_pll_table->vco_cal_code);
> > +     }
> > +     cdns_phy_reg_write(cdns_phy, CMN_PLL0_VCOCAL_START, val);
> > +
> > +     cdns_phy_reg_write(cdns_phy, CMN_PLL0_VCOCAL_INIT_TMR,
> 0x0064);
> > +     cdns_phy_reg_write(cdns_phy, CMN_PLL0_VCOCAL_ITER_TMR,
> 0x000a);
> > +
> > +     /* Common functions control and diagnostics registers */
> > +     val =3D p_ctrl_table->cmnda_pll0_hs_sym_div_sel << 8;
> > +     val |=3D p_ctrl_table->cmnda_pll0_ip_div;
> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_INCLK_CTRL, val);
> > +
> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_OVRD, 0x0000);
> > +
> > +     val =3D p_ctrl_table->cmnda_pll0_fb_div_high;
> > +     val |=3D PLL_FEEDBACK_DIV_HI_OVERRIDE_EN;
> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_FBH_OVRD, val);
> > +
> > +     val =3D p_ctrl_table->cmnda_pll0_fb_div_low;
> > +     val |=3D PLL_FEEDBACK_DIV_LO_OVERRIDE_EN;
> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_FBL_OVRD, val);
> > +
> > +     if (!pclk_in) {
> > +             val =3D p_ctrl_table->cmnda_pll0_pxdiv_low;
> > +             cdns_phy_reg_write(cdns_phy,
> CMN_DIAG_PLL0_PXL_DIVL,
> > + val);
> > +
> > +             val =3D p_ctrl_table->cmnda_pll0_pxdiv_high;
> > +             val |=3D PLL_PCLK_DIV_EN;
> > +             cdns_phy_reg_write(cdns_phy,
> CMN_DIAG_PLL0_PXL_DIVH, val);
> > +     }
> > +
> > +     val =3D p_pll_table->volt_to_current_coarse;
> > +     val |=3D (p_pll_table->volt_to_current) << 4;
> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_V2I_TUNE, val);
> > +
> > +     val =3D p_pll_table->charge_pump_gain;
> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_CP_TUNE, val);
> > +
> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_LF_PROG,
> 0x0008);
> > +
> > +     val =3D p_pll_table->pmos_ctrl;
> > +     val |=3D (p_pll_table->ndac_ctrl) << 8;
> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_PTATIS_TUNE1,
> val);
> > +
> > +     val =3D p_pll_table->ptat_ndac_ctrl;
> > +     cdns_phy_reg_write(cdns_phy, CMN_DIAG_PLL0_PTATIS_TUNE2,
> val);
> > +
> > +     if (pclk_in)
> > +             cdns_phy_reg_write(cdns_phy,
> CMN_DIAG_PLL0_TEST_MODE, 0x0022);
> > +     else
> > +             cdns_phy_reg_write(cdns_phy,
> CMN_DIAG_PLL0_TEST_MODE,
> > + 0x0020);
> > +
> > +     cdns_phy_reg_write(cdns_phy, CMN_PSM_CLK_CTRL, 0x0016);
> > +
> > +     /* Transceiver control and diagnostic registers */
> > +     for (k =3D 0; k < num_lanes; k++) {
> > +             val =3D cdns_phy_reg_read(cdns_phy,
> (XCVR_DIAG_PLLDRC_CTRL | (k << 9)));
> > +             val &=3D ~DPLL_CLK_SEL_MODE3;
> > +             cdns_phy_reg_write(cdns_phy,
> (XCVR_DIAG_PLLDRC_CTRL | (k << 9)), val);
> > +     }
> > +
> > +     for (k =3D 0; k < num_lanes; k++) {
> > +             val =3D cdns_phy_reg_read(cdns_phy, (TX_DIAG_TX_CTRL |
> (k << 9)));
> > +             val &=3D ~TX_IF_SUBRATE_MODE3_MASK;
> > +             val |=3D FIELD_PREP(TX_IF_SUBRATE_MODE3_MASK,
> > +
> (p_ctrl_table->hsclk_div_tx_sub_rate >> 1));
> > +             cdns_phy_reg_write(cdns_phy, (TX_DIAG_TX_CTRL | (k <<
> 9)), val);
> > +     }
> > +
> > +     val =3D cdns_phy_reg_read(cdns_phy, PHY_PMA_CMN_CTRL1);
> > +     val &=3D ~CMA_REF_CLK_SEL_MASK;
> > +     /*
> > +      * single ended reference clock (val |=3D 0x0030);
> > +      * differential clock  (val |=3D 0x0000);
> > +      * for differential clock on the refclk_p and
> > +      * refclk_m off chip pins: CMN_DIAG_ACYA[8]=3D1'b1
> > +      * cdns_phy_reg_write(cdns_phy, CMN_DIAG_ACYA, 0x0100);
> > +      */
> > +     val |=3D FIELD_PREP(CMA_REF_CLK_SEL_MASK, 3);
> > +     cdns_phy_reg_write(cdns_phy, PHY_PMA_CMN_CTRL1, val);
> > +
> > +     /* Deassert PHY reset */
> > +     cdns_phy_reg_write(cdns_phy, PHY_ISO_CMN_CTRL, 0x0001);
> > +     cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_CMN_CTRL, 0x0003);
> > +
> > +     /* Power state machine registers */
> > +     for (k =3D 0; k < num_lanes; k++)
> > +             cdns_phy_reg_write(cdns_phy, XCVR_PSM_RCTRL | (k <<
> 9),
> > + 0xfefc);
> > +
> > +     /* Assert cmn_macro_pwr_en */
> > +     cdns_phy_reg_write(cdns_phy, PHY_PMA_ISO_CMN_CTRL, 0x0013);
> > +
> > +     /* wait for cmn_macro_pwr_en_ack */
> > +     ret =3D wait_for_ack(cdns_phy, PHY_PMA_ISO_CMN_CTRL,
> CMN_MACRO_PWR_EN_ACK,
> > +                        "MA output macro power up failed");
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* wait for cmn_ready */
> > +     ret =3D wait_for_ack(cdns_phy, PHY_PMA_CMN_CTRL1, CMN_READY,
> > +                        "PMA output ready failed");
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     for (k =3D 0; k < num_lanes; k++) {
> > +             cdns_phy_reg_write(cdns_phy, TX_PSC_A0 | (k << 9),
> 0x6791);
> > +             cdns_phy_reg_write(cdns_phy, TX_PSC_A1 | (k << 9),
> 0x6790);
> > +             cdns_phy_reg_write(cdns_phy, TX_PSC_A2 | (k << 9),
> 0x0090);
> > +             cdns_phy_reg_write(cdns_phy, TX_PSC_A3 | (k << 9),
> > + 0x0090);
> > +
> > +             val =3D cdns_phy_reg_read(cdns_phy, RX_PSC_CAL | (k <<
> 9));
> > +             val &=3D 0xffbb;
> > +             cdns_phy_reg_write(cdns_phy, RX_PSC_CAL | (k << 9),
> > + val);
> > +
> > +             val =3D cdns_phy_reg_read(cdns_phy, RX_PSC_A0 | (k << 9))=
;
> > +             val &=3D 0xffbb;
> > +             cdns_phy_reg_write(cdns_phy, RX_PSC_A0 | (k << 9), val);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int hdptx_hdmi_phy_cfg(struct cdns_hdptx_hdmi_phy *cdns_phy,
> > +u32 rate) {
> > +     const struct hdptx_hdmi_ctrl *p_ctrl_table;
> > +     const struct hdptx_hdmi_pll_tuning *p_pll_table;
> > +     const u32 refclk_freq_khz =3D cdns_phy->ref_clk_rate / 1000;
> > +     const bool pclk_in =3D false;
> > +     u32 pixel_freq =3D rate;
> > +     u32 vco_freq, char_freq;
> > +     u32 div_total, feedback_factor;
> > +     u32 i;
> > +
> > +     feedback_factor =3D hdptx_hdmi_feedback_factor(cdns_phy);
> > +
> > +     char_freq =3D pixel_freq * feedback_factor / 1000;
> > +
> > +     dev_dbg(cdns_phy->dev,
> > +             "Pixel clock: (%d KHz), character clock: %d, bpc is
> (%0d-bit)\n",
> > +             pixel_freq, char_freq, cdns_phy->bpc);
> > +
> > +     /* Get right row from the ctrl_table table.
> > +      * Check if 'pixel_freq_khz' value matches the PIXEL_CLK_FREQ
> column.
> > +      * Consider only the rows with FEEDBACK_FACTOR column
> matching feedback_factor.
> > +      */
> > +     for (i =3D 0; i < ARRAY_SIZE(pixel_clk_output_ctrl_table); i++) {
> > +             if (feedback_factor =3D=3D
> pixel_clk_output_ctrl_table[i].feedback_factor &&
> > +                 pixel_freq =3D=3D
> pixel_clk_output_ctrl_table[i].pixel_clk_freq_min) {
> > +                     p_ctrl_table =3D &pixel_clk_output_ctrl_table[i];
> > +                     break;
> > +             }
> > +     }
> > +     if (i =3D=3D ARRAY_SIZE(pixel_clk_output_ctrl_table)) {
> > +             dev_warn(cdns_phy->dev,
> > +                      "Pixel clk (%d KHz) not supported, bpc is
> (%0d-bit)\n",
> > +                      pixel_freq, cdns_phy->bpc);
> > +             return -EINVAL;
> > +     }
> > +
> > +     div_total =3D p_ctrl_table->pll_fb_div_total;
> > +     vco_freq =3D refclk_freq_khz * div_total /
> > + p_ctrl_table->cmnda_pll0_ip_div;
> > +
> > +     /* Get right row from the pixel_clk_output_pll_table table.
> > +      * Check if vco_freq_khz and feedback_div_total
> > +      * column matching with pixel_clk_output_pll_table.
> > +      */
> > +     for (i =3D 0; i < ARRAY_SIZE(pixel_clk_output_pll_table); i++) {
> > +             if (vco_freq =3D=3D pixel_clk_output_pll_table[i].vco_fre=
q_min
> &&
> > +                 div_total =3D=3D
> pixel_clk_output_pll_table[i].feedback_div_total) {
> > +                     p_pll_table =3D &pixel_clk_output_pll_table[i];
> > +                     break;
> > +             }
> > +     }
> > +     if (i =3D=3D ARRAY_SIZE(pixel_clk_output_pll_table)) {
> > +             dev_warn(cdns_phy->dev, "VCO (%d KHz) not supported\n",
> vco_freq);
> > +             return -EINVAL;
> > +     }
> > +     dev_dbg(cdns_phy->dev, "VCO frequency is (%d KHz)\n", vco_freq);
> > +
> > +     return hdptx_hdmi_phy_config(cdns_phy, p_ctrl_table,
> > +p_pll_table, pclk_in); }
> > +
> > +static int hdptx_hdmi_phy_power_up(struct cdns_hdptx_hdmi_phy
> > +*cdns_phy) {
> > +     int ret =3D 0;
> > +
> > +     /* set Power State to A2 */
> > +     cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A2);
> > +
> > +     cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_0, 1);
> > +     cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_1, 1);
> > +     cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_2, 1);
> > +     cdns_phy_reg_write(cdns_phy, TX_DIAG_ACYA_3, 1);
> > +
> > +     ret =3D wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A2_ACK,
> > +                        "Wait A2 Ack failed");
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* Power up ARC */
> > +     hdptx_hdmi_arc_config(cdns_phy);
> > +
> > +     /* Configure PHY in A0 mode (PHY must be in the A0 power
> > +      * state in order to transmit data)
> > +      */
> > +     cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A0);
> > +
> > +     return wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A0_ACK,
> > +                         "Wait A0 Ack failed"); }
> > +
> > +static int hdptx_hdmi_phy_power_down(struct cdns_hdptx_hdmi_phy
> > +*cdns_phy) {
> > +     u32 val;
> > +
> > +     val =3D cdns_phy_reg_read(cdns_phy, PHY_HDP_MODE_CTRL);
> > +     val &=3D ~(POWER_STATE_A0 | POWER_STATE_A1 |
> POWER_STATE_A2 | POWER_STATE_A3);
> > +     /* PHY_DP_MODE_CTL set to A3 power state */
> > +     cdns_phy_reg_write(cdns_phy, PHY_HDP_MODE_CTRL, val |
> > + POWER_STATE_A3);
> > +
> > +     return wait_for_ack(cdns_phy, PHY_HDP_MODE_CTRL,
> POWER_STATE_A3_ACK,
> > +                         "Wait A3 Ack failed"); }
> > +
> > +static int cdns_hdptx_hdmi_phy_on(struct phy *phy) {
> > +     struct cdns_hdptx_hdmi_phy *cdns_phy =3D phy_get_drvdata(phy);
> > +
> > +     return hdptx_hdmi_phy_power_up(cdns_phy);
> > +}
> > +
> > +static int cdns_hdptx_hdmi_phy_off(struct phy *phy) {
> > +     struct cdns_hdptx_hdmi_phy *cdns_phy =3D phy_get_drvdata(phy);
> > +
> > +     hdptx_hdmi_phy_power_down(cdns_phy);
> > +     return 0;
> > +}
> > +
> > +static int
> > +cdns_hdptx_hdmi_phy_valid(struct phy *phy, enum phy_mode mode,
> > +                       int submode, union phy_configure_opts *opts)
> {
> > +     u32 rate =3D opts->hdmi.pixel_clk_rate;
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(pixel_clk_output_ctrl_table); i++)
> > +             if (rate =3D=3D
> pixel_clk_output_ctrl_table[i].pixel_clk_freq_min)
> > +                     return 0;
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int cdns_hdptx_hdmi_phy_init(struct phy *phy) {
> > +     return 0;
> > +}
> > +
> > +static int cdns_hdptx_hdmi_configure(struct phy *phy,
> > +                                  union phy_configure_opts *opts)
> {
> > +     struct cdns_hdptx_hdmi_phy *cdns_phy =3D phy_get_drvdata(phy);
> > +     int ret;
> > +
> > +     cdns_phy->pixel_clk_rate =3D opts->hdmi.pixel_clk_rate;
> > +     cdns_phy->color_space =3D opts->hdmi.color_space;
> > +     cdns_phy->bpc =3D opts->hdmi.bpc;
> > +
> > +     /* Check HDMI FW alive before HDMI PHY init */
> > +     ret =3D hdptx_phy_check_alive(cdns_phy);
> > +     if (!ret) {
> > +             dev_err(cdns_phy->dev, "NO HDMI FW running\n");
> > +             return -ENXIO;
> > +     }
> > +
> > +     /* Configure PHY */
> > +     if (hdptx_hdmi_phy_cfg(cdns_phy, cdns_phy->pixel_clk_rate) < 0) {
> > +             dev_err(cdns_phy->dev, "failed to set phy pclock\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     ret =3D hdptx_hdmi_phy_power_up(cdns_phy);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     hdptx_hdmi_phy_set_vswing(cdns_phy);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct phy_ops cdns_hdptx_hdmi_phy_ops =3D {
> > +     .init =3D cdns_hdptx_hdmi_phy_init,
> > +     .configure =3D cdns_hdptx_hdmi_configure,
> > +     .power_on =3D cdns_hdptx_hdmi_phy_on,
> > +     .power_off =3D cdns_hdptx_hdmi_phy_off,
> > +     .validate =3D cdns_hdptx_hdmi_phy_valid,
> > +     .owner =3D THIS_MODULE,
> > +};
> > +
> > +static int cdns_hdptx_hdmi_phy_probe(struct platform_device *pdev) {
> > +     struct cdns_hdptx_hdmi_phy *cdns_phy;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct device_node *node =3D dev->of_node;
> > +     struct phy_provider *phy_provider;
> > +     struct resource *res;
> > +     struct phy *phy;
> > +     int ret;
> > +
> > +     cdns_phy =3D devm_kzalloc(dev, sizeof(*cdns_phy), GFP_KERNEL);
> > +     if (!cdns_phy)
> > +             return -ENOMEM;
> > +
> > +     dev_set_drvdata(dev, cdns_phy);
> > +     cdns_phy->dev =3D dev;
> > +     mutex_init(&cdns_phy->mbox_mutex);
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     if (!res)
> > +             return -ENODEV;
> > +     cdns_phy->regs =3D devm_ioremap(dev, res->start, resource_size(re=
s));
> > +     if (IS_ERR(cdns_phy->regs))
> > +             return PTR_ERR(cdns_phy->regs);
> > +
> > +     phy =3D devm_phy_create(dev, node, &cdns_hdptx_hdmi_phy_ops);
> > +     if (IS_ERR(phy))
> > +             return PTR_ERR(phy);
> > +
> > +     phy->attrs.mode =3D PHY_MODE_HDMI;
> > +
> > +     cdns_phy->phy =3D phy;
> > +     phy_set_drvdata(phy, cdns_phy);
> > +
> > +     /* init base struct for access mhdp mailbox */
> > +     cdns_phy->base.dev =3D cdns_phy->dev;
> > +     cdns_phy->base.regs =3D cdns_phy->regs;
> > +     cdns_phy->base.mbox_mutex =3D &cdns_phy->mbox_mutex;
> > +
> > +     ret =3D hdptx_hdmi_clk_enable(cdns_phy);
> > +     if (ret) {
> > +             dev_err(dev, "Init clk fail\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     phy_provider =3D devm_of_phy_provider_register(dev,
> of_phy_simple_xlate);
> > +     if (IS_ERR(phy_provider)) {
> > +             ret =3D PTR_ERR(phy_provider);
> > +             goto clk_disable;
> > +     }
> > +
> > +     dev_dbg(dev, "probe success!\n");
> > +
> > +     return 0;
> > +
> > +clk_disable:
> > +     hdptx_hdmi_clk_disable(cdns_phy);
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int cdns_hdptx_hdmi_phy_remove(struct platform_device *pdev) {
> > +     struct cdns_hdptx_hdmi_phy *cdns_phy =3D
> > +platform_get_drvdata(pdev);
> > +
> > +     hdptx_hdmi_clk_disable(cdns_phy);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id cdns_hdptx_hdmi_phy_of_match[] =3D {
> > +     {.compatible =3D "fsl,imx8mq-hdmi-phy" },
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, cdns_hdptx_hdmi_phy_of_match);
> > +
> > +static struct platform_driver cdns_hdptx_hdmi_phy_driver =3D {
> > +     .probe =3D cdns_hdptx_hdmi_phy_probe,
> > +     .remove =3D cdns_hdptx_hdmi_phy_remove,
> > +     .driver =3D {
> > +             .name   =3D "cdns-hdptx-hdmi-phy",
> > +             .of_match_table =3D cdns_hdptx_hdmi_phy_of_match,
> > +     }
> > +};
> > +module_platform_driver(cdns_hdptx_hdmi_phy_driver);
> > +
> > +MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
> > +MODULE_DESCRIPTION("Cadence HDP-TX HDMI PHY driver");
> > +MODULE_LICENSE("GPL");
> >
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-/
> group.com%2F&data=3D05%7C02%7CSandor.yu%40nxp.com%7C68abe9642bd9
> 4d237a4e08dc3200861a%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C
> 0%7C638440225041723926%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%
> 7C&sdata=3DQVMdobK1UfMi1Pnjg5YLEvfLbPDjLm7xzIEV5Y97xEw%3D&reserve
> d=3D0
>

