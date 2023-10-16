Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D47C9D9A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 05:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C3B10E10F;
	Mon, 16 Oct 2023 03:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9522010E047
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 03:05:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRRrLBCkNmwZ+WV7jPA5KoBOCetcpMefvTDThqduJBW2pj/CdJoBEugrdl3t4WCPqZSQ16zHEDsQX9+ERlHLOxHld/66Q239n4kDs9ja1vUMfLbW7rkCthgk6iL6af0G8V+ptbwvfTnQ/Q0iEvbX7HcvjHPfRkWRPJh9/BZTiHIfi3242zwNEDzQ7wXjTXsx6O4UQVDPahF8ZvU42Xz+2Oz27yGYcHQpJQXyds6HOpzeP59gUDU7h9HD1tSWDx+6d/fu2eyNHKd7ykCpvVmXoxZg0yO0sOMHHhyv2lVk5qI44cSSxKKcqkV+WvF4EFmeeK665hoi4sIZyPzAF+Dt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqqMzDjTUFB9DOWnnZLMHHGbDpA5KHyVvvEtdaUCWAU=;
 b=kAPnyqBkp63Ws2PmzYFAh92axafA2sb0PqCCw9buhrzbhqFLpxV/EXrVw3Y+0ALS3XjRxy91YxS4BeH+JQbnDj0rI8qZy6fFK4lpIibyayXdjcwNZAZ8UpZVkDekrSqQ34ZXp1Ryh2raey1AOUo20WVvq3GvTxwGN/Q7EW6Yts1MOLSYr/XueHW+dvG3konLd+1d9OL45UtGbVGY7RVz/Q90pLbTw8BNxGsJ7+D0r4fNpNVilv8gupUXLdsYztDS3RKPBy56un/9DIqpnRrQn1AX/9LWzPzXqiVdYQWdqkg7t43vSuaLRoMQCIA1U3FFKPxeymXfbjSRXojoxLwTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqqMzDjTUFB9DOWnnZLMHHGbDpA5KHyVvvEtdaUCWAU=;
 b=lDEVccK9UCGoz4HnmWLWcbflxxl5W2cm0DVUw+6tBnPkqeClBGCQ815eFKTgXOvAzfPifC5AHAp/l56pK52CXgwdARc3MydKMukhFtXKr7oTO1JfzYEOh9o1dKKNO15YU4VDpN5nxHJz9ETFbbCwL3d/tTccvGOfUrIsH2/9rLw=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 03:05:58 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Mon, 16 Oct 2023
 03:05:58 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v10 4/7] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Topic: [EXT] Re: [PATCH v10 4/7] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Index: AQHZ/YCkvljU4iEKsk25DqYpOSNnO7BHUqEAgARjNaA=
Date: Mon, 16 Oct 2023 03:05:57 +0000
Message-ID: <PAXPR04MB9448C5DD9A5D3CBFBB73735CF4D7A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1697162990.git.Sandor.yu@nxp.com>
 <037c61d582df78a3309a5672ac66b9e74b396ddd.1697162990.git.Sandor.yu@nxp.com>
 <5605026.mvXUDI8C0e@steina-w>
In-Reply-To: <5605026.mvXUDI8C0e@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AM8PR04MB7298:EE_
x-ms-office365-filtering-correlation-id: e0bb3af6-dbdf-48a6-0b23-08dbcdf4d1e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: af05Dd8eMzaNuvWitGVr2F4L1IJEvfslTOJVMDUPLCzIzkzzY7AfbfHj+rVzSZPnhv2eeaDFPNPCLx+3ih4sMJ4FeviBsDBdZNtTd38+94PTeuG8ZOzfoq02B5FueZP/PILUFRZIc+g2/vhGJr73WGOVTCrlliR32K0aZQ6QXTO02YSGGIhsmZ/tyCKMevRYGrZtOR88p7ChpxSH3/Wh+dAGWmuFBb/9a6OG8wcrfLjmFB0OVj4+bHuo/ROxl3hPMgGXD7DaT3GY0dNbPs9HNiWgBlA0kGpCVHj4t92JubgBb9JOPU/wSyxNOx1teu/7VsyVhTGo7yyCFJQRxCU38RiXNDCRgcsMzY7mWahZ7fTZ7EBWQbnzqSEi/J4PiRKbEpPiAb/v0tnIOZwW06dasLl9d9JUkIVtiwpgl6c8q7TNdqdsmoGaZ33XEIDJQ5t24JaNmT+JRloBjp2NXpiDeyPejdHHxg9ZNlHmVlhhXwj/tm9bbqf4neUGNH0jctwxUYl1M0baRH60BmjCvJkriTRPE8unUIsvMUgu9krlcM7hc7GqwOtv//3yL9ck8/ZEloFPib4IyFO5nMQ7A7OSXh0DXEfdctZZ9fArMdEcpkvD086ZX9PTd2cw/eo8SuUMbyePIa1Rry6LAAh2C9Udow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(55016003)(66574015)(26005)(83380400001)(7416002)(110136005)(76116006)(54906003)(64756008)(66446008)(66556008)(66946007)(66476007)(52536014)(4326008)(8676002)(8936002)(316002)(71200400001)(9686003)(41300700001)(7696005)(6506007)(5660300002)(44832011)(478600001)(2906002)(38100700002)(38070700005)(921005)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ag7BTWaQ7+1aSXVf0Jwn8VhryNJEz4hxQDl7EjnD6NjybPVJRiXCn5m3vi?=
 =?iso-8859-1?Q?LkO+M/3xf/OdsRVhLQFWxBSQFLZ4ZeZGLWHEppSN3nABMc8XsTAtuSs+0K?=
 =?iso-8859-1?Q?qWxJt0g5xtUegmBcT3uqELYNFENgTDWlZP23zef3rEUydcW9qABsvQCNuM?=
 =?iso-8859-1?Q?DLYQYwIZvXHoiCWzVnDLkyMEErjB70fvyXU4yeco/efrriozMe+mgQHhfn?=
 =?iso-8859-1?Q?32tHcSq+5gdKFuh1cpd5qOkmbB2YUMKqC0PwBa51GyIXtTLAUyVMHMKH/d?=
 =?iso-8859-1?Q?RqWq7tHCLSkETxixlbWMBmeVsjUfyTKUiv0xusmzYRmMvTn1V+9MP8hBNO?=
 =?iso-8859-1?Q?2e/byIBygFl5alt/LoNaUZcq2V88jdjyBVZun5eBk88Tj409BOQyhUiM+B?=
 =?iso-8859-1?Q?ztENm9VgL/YWabQaUVL8wxW7K89ZHi3AZreBapNyKTF7Rl9c+0WRNVDvzY?=
 =?iso-8859-1?Q?DrNLbZNoZ74gf2dnTx/4q1AB8hG4PD/Cxhpea9azgsUW7Qj1z9TM74ptps?=
 =?iso-8859-1?Q?7z/vZgcebT7F0IBjEPQrqQ3HulEJSWBMkRhl52+0+roVpqr++EpudwfNrr?=
 =?iso-8859-1?Q?A6VRSd/VtLj65h80dsgUp9fGQKqDZiYBscKANy/nz3bWI+OvxlumXzTDAY?=
 =?iso-8859-1?Q?nSC90TFm58Xda/ZZN0B3/Og+gHvFVrLkN/yz7bx+CVR6HhsDxyA9HlaXGz?=
 =?iso-8859-1?Q?Wd04bVIMtp/m/8e8jTaJ4Mhqx4V/8kG4QBiaSxEZMMeQ1lAQ5sU3MtbQ1i?=
 =?iso-8859-1?Q?tizwGcNfRaRc5vnjcyHo5Jyzi4ISyBBnJ32vR/Ynu5XUjOLAQRkTUl4DmO?=
 =?iso-8859-1?Q?gEl2wcDIBYajspcF3kDScNICt3gbdLkmdbOCW2VHMpOEoQYtHEN1BLEgF5?=
 =?iso-8859-1?Q?Uvc+MOxiG7wJonRsgRat4VyPQhFq+sIWXQr/kyl4JzOqaYsQ1eA2P/ZYvX?=
 =?iso-8859-1?Q?xJgEM6xf+bNGUzhNZzTychKHVMlSzYhUN7uEeCa24JPg2S4gfjS7wQjsJR?=
 =?iso-8859-1?Q?HVapK2zMAyl3TzdUJ5KDWDvH51vvOB7KT+S02rRUdYR9u+szEAQOx5xWjp?=
 =?iso-8859-1?Q?NCZ5RESmvYYouSiXCU6Pf+Zcfn8ZDQ6cSWtRUmVnGjTiJpF2zB5Nv9/+MQ?=
 =?iso-8859-1?Q?CNOD6Ew1LrervEd4S9AowIDMOT1Qh/QXWX98YdT7imBaZmcapYuhDNoTPt?=
 =?iso-8859-1?Q?KlcTeW8abaWV5FDmtHE4lc6s6YO4vbmfctWidsIL598vZ5MmjbVuMtleZc?=
 =?iso-8859-1?Q?c518Akf46hxD3I2E4nlxlUPYKT3Hr1cIxIm0qCFYTvSFz0I6Qhzy39RccO?=
 =?iso-8859-1?Q?Cp6sF/usfkoGTqZ9uRA1ACHtlXPMB0vEtQFoWh2dWA1mGQHbznKn7OT7Id?=
 =?iso-8859-1?Q?Bqe1VVMyj/DDBg/LrDLWoMGRBiWyfeUjziTDWtrrFm5l0pxv+icRMCRcHP?=
 =?iso-8859-1?Q?fjV+6S1c4hYSyVMWIeXKsFPzaV6+yH5PRhhx4Y30ucfbl+1tkbhLk4Woh/?=
 =?iso-8859-1?Q?PMkFVDWjHQNkCvDXobCWmOOrTeK//zYZ1e72g2Zd+v0zCLCNBCVYWJaekK?=
 =?iso-8859-1?Q?Ef5jO6pLbYtG8ENoc60Xbhk5l+mpOnUChQkhT5CMAPuYTk0reoiYXPDYux?=
 =?iso-8859-1?Q?VU6592GAvdo0I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bb3af6-dbdf-48a6-0b23-08dbcdf4d1e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 03:05:57.9523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZASTgTfGZcnbIY6eYYhFdaOKGSorV+DzP+oykp+U9qkNzSlTdpVhe0qdEX0cZk+xu5Nhl+HoAg0E0M/E+kxHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7298
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
Cc: Oliver Brown <oliver.brown@nxp.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

Thanks your comments,

>=20
>=20
> Hi Sandor,
>=20
> thanks for the updated series.
>=20
> Am Freitag, 13. Oktober 2023, 05:24:23 CEST schrieb Sandor Yu:
> > Add a new DRM DisplayPort and HDMI bridge driver for Candence
> MHDP8501
> > used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
> > standards according embedded Firmware running in the uCPU.
> >
> > For iMX8MQ SOC, the DisplayPort/HDMI FW was loaded and activated by
> > SOC's ROM code. Bootload binary included respective specific firmware
> > is required.
> >
> > Driver will check display connector type and then load the
> > corresponding driver.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > v9->v10:
> >  - struct cdns_mhdp_device is renamed to cdns_mhdp8501_device.
> >  - update for mhdp helper driver is introduced.
> > Remove head file cdns-mhdp-mailbox.h and add cdns-mhdp-helper.h Add
> > struct cdns_mhdp_base base to struct cdns_mhdp8501_device.
> > Init struct cdns_mhdp_base base when driver probe.
> >
> >  drivers/gpu/drm/bridge/cadence/Kconfig        |  16 +
> >  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 316 ++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 365 +++++++++
> >  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 708
> ++++++++++++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 673
> +++++++++++++++++
> >  6 files changed, 2080 insertions(+)
> >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> >
> > [...]
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c new file mode
> > 100644 index 0000000000000..73d1c35a74599
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > @@ -0,0 +1,673 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Cadence MHDP8501 HDMI bridge driver
> > + *
> > + * Copyright (C) 2019-2023 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/display/drm_hdmi_helper.h> #include
> > +<drm/display/drm_scdc_helper.h> #include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_edid.h> #include <drm/drm_print.h> #include
> > +<linux/phy/phy.h> #include <linux/phy/phy-hdmi.h>
> > +
> > +#include "cdns-mhdp8501-core.h"
> > +
> > +/**
> > + * cdns_hdmi_infoframe_set() - fill the HDMI AVI infoframe
> > + * @mhdp: phandle to mhdp device.
> > + * @entry_id: The packet memory address in which the data is written.
> > + * @packet_len: 32, only 32 bytes now.
> > + * @packet: point to InfoFrame Packet.
> > + *          packet[0] =3D 0
> > + *          packet[1-3] =3D HB[0-2]  InfoFrame Packet Header
> > + *          packet[4-31 =3D PB[0-27] InfoFrame Packet Contents
> > + * @packet_type: Packet Type of InfoFrame in HDMI Specification.
> > + *
> > + */
> > +static void cdns_hdmi_infoframe_set(struct cdns_mhdp8501_device
> *mhdp,
> > +                                 u8 entry_id, u8 packet_len,
> > +                                 u8 *packet, u8 packet_type) {
> > +     u32 packet32, len32;
> > +     u32 val, i;
> > +
> > +     /* only support 32 bytes now */
> > +     if (packet_len !=3D 32)
> > +             return;
> > +
> > +     /* invalidate entry */
> > +     val =3D F_ACTIVE_IDLE_TYPE(1) | F_PKT_ALLOC_ADDRESS(entry_id);
> > +     writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
> > +     writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs +
> SOURCE_PIF_PKT_ALLOC_WR_EN);
> > +
> > +     /* flush fifo 1 */
> > +     writel(F_FIFO1_FLUSH(1), mhdp->regs +
> SOURCE_PIF_FIFO1_FLUSH);
> > +
> > +     /* write packet into memory */
> > +     len32 =3D packet_len / 4;
> > +     for (i =3D 0; i < len32; i++) {
> > +             packet32 =3D get_unaligned_le32(packet + 4 * i);
> > +             writel(F_DATA_WR(packet32), mhdp->regs +
> SOURCE_PIF_DATA_WR);
> > +     }
> > +
> > +     /* write entry id */
> > +     writel(F_WR_ADDR(entry_id), mhdp->regs +
> SOURCE_PIF_WR_ADDR);
> > +
> > +     /* write request */
> > +     writel(F_HOST_WR(1), mhdp->regs + SOURCE_PIF_WR_REQ);
> > +
> > +     /* update entry */
> > +     val =3D F_ACTIVE_IDLE_TYPE(1) | F_TYPE_VALID(1) |
> > +             F_PACKET_TYPE(packet_type) |
> F_PKT_ALLOC_ADDRESS(entry_id);
> > +     writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
> > +
> > +     writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs +
> SOURCE_PIF_PKT_ALLOC_WR_EN);
> > +}
> > +
> > +static int cdns_hdmi_get_edid_block(void *data, u8 *edid,
> > +                                 u32 block, size_t length) {
> > +     struct cdns_mhdp8501_device *mhdp =3D data;
> > +     u8 msg[2], reg[5], i;
> > +     int ret;
> > +
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +
> > +     for (i =3D 0; i < 4; i++) {
> > +             msg[0] =3D block / 2;
> > +             msg[1] =3D block % 2;
> > +
> > +             ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_HDMI_TX,
> > HDMI_TX_EDID, +
> sizeof(msg),
> msg);
> > +             if (ret)
> > +                     continue;
> > +
> > +             ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> MB_MODULE_ID_HDMI_TX,
> > +
> HDMI_TX_EDID,
> sizeof(reg) + length);
> > +             if (ret)
> > +                     continue;
> > +
> > +             ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, reg,
> sizeof(reg));
> > +             if (ret)
> > +                     continue;
> > +
> > +             ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, edid,
> length);
> > +             if (ret)
> > +                     continue;
> > +
> > +             if ((reg[3] << 8 | reg[4]) =3D=3D length)
> > +                     break;
> > +     }
> > +
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +
> > +     if (ret)
> > +             DRM_ERROR("get block[%d] edid failed: %d\n", block,
> ret);
> > +     return ret;
> > +}
> > +
> > +static int cdns_hdmi_scdc_write(struct cdns_mhdp8501_device *mhdp, u8
> > +addr,
> > u8 value) +{
> > +     u8 msg[5], reg[5];
> > +     int ret;
> > +
> > +     msg[0] =3D 0x54;
> > +     msg[1] =3D addr;
> > +     msg[2] =3D 0;
> > +     msg[3] =3D 1;
> > +     msg[4] =3D value;
> > +
> > +     mutex_lock(&mhdp->mbox_mutex);
>=20
> I don't like that locking. Sometimes the mutex is locked by HDMI driver,
> sometimes within the helper.
> What is this mutex actually protecting? Concurrent access to the mailbox =
or a
> programming sequence which must not be interrupted aka critical section?
> When TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld,
> Germany Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
>=20

There are two types of command carried over the mailbox channel, with respo=
nd and w/o respond.
mutex is used to protect a full cycle command over the mailbox channel.

In helper driver, those commands could be share by different mhdp drivers.
In HDMI driver, for example the cdns_hdmi_scdc_write function is only be ca=
lled by HDMI driver,=20
so I keep the function in MHDP8501 HDMI driver,=20
if the other mhdp want to reused it later, it should be move to helper driv=
er.

B.R
Sandor

