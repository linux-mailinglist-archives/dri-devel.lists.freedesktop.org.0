Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A5824D5C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 04:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F238310E106;
	Fri,  5 Jan 2024 03:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2043.outbound.protection.outlook.com [40.107.247.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D0E10E0FA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 03:20:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgiFx3hIFcWGBqxsX7N5jZ77u3ilUGVAAO7tovW58+Vy5vT9fkmd3KVF0PQDlIxWFkgaEvc65nWfEXa0tjkEnKwSIiRrfBB6zcT07YaTmpI5aKbg1ji3EBrmHsecsP41ASzI0oS4aKvhpBsUU8c2xcaPzdIy1gEEcoJiQ+Ab0SFXAMXKdEb/p2JJxPBC4MZ3qazMSTxj3cwqtQO/E1Cz64y+Z2eAQJhZfacVlLvLbzj1E6/FDpXvlqBwM4dm0XJZZS1UpnLHfGfK+GODtGdWdRlKPA3IlHlNA2e5eTLst3SXJf8DZ/FZzvgc/LJ9d5FFeezbLqoqpsPPEK7U4TSuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqDKJKnfg2p+j7PDMpRdDIlwpYETqSjUTwNeX5m8OTg=;
 b=S3L7/vpHqueyAhgIWJhjWAmDas3auvXMxP2DbuZ3CTnTqjd/SS3hThwg8R6lIpqDP3lZOOa0xdusgwTEVqqYDDw8L6UowdlVQN4B87PoerVqFis/m+CQ3dZY4tL+PrGTSZhIKYFjfBemT/9zdIp6UA7CR5pDMjWHJZITGdcwyO85MX2qlkR7wK8K+HLNLju6/hbEgrKVZwc/vl1CzVNbaGARmt+gOIH9+C3wWo7OZEDeFsKDJhcvgnJcEFP6Vu+0qClfi/pF9EKlSi8P3WhFKqqbpPTBsbVZv2vhWu5V3bs+L61kPPbrwltIGyHHT8cjYIMvHNWF+qCjbnP7ebIOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqDKJKnfg2p+j7PDMpRdDIlwpYETqSjUTwNeX5m8OTg=;
 b=kl7Cb8zru/RULlwOFi9/Nk0t2ZrwtdWDYHD+VfPTsvThr4eWKXDA38os9vA6I/jSQWBHh6yPj0EBVeB1fJsThOR1EyVGe4UpEp/dbEo17As/3pWYTnwfWRUWdUM0MfGE19LWdmjnM3nWJFj5ePirlqerLi8/Trf8maO/jTcQ+KI=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI1PR04MB6927.eurprd04.prod.outlook.com (2603:10a6:803:139::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 03:20:22 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5%5]) with mapi id 15.20.7159.013; Fri, 5 Jan 2024
 03:20:22 +0000
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
Subject: RE: [EXT] Re: [PATCH v11 1/7] drm: bridge: Cadence: Creat mhdp helper
 driver
Thread-Topic: [EXT] Re: [PATCH v11 1/7] drm: bridge: Cadence: Creat mhdp
 helper driver
Thread-Index: AQHaAMdGgoEeNDwI2ESaG+6R5PX6orBNwOSAgAR3eiA=
Date: Fri, 5 Jan 2024 03:20:22 +0000
Message-ID: <PAXPR04MB9448BCD7BCBCE88AE50F996CF4662@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1697524277.git.Sandor.yu@nxp.com>
 <c4b4b7a56fe79c62f5138593f8048ab5385eac09.1697524277.git.Sandor.yu@nxp.com>
 <2582168.Lt9SDvczpP@steina-w>
In-Reply-To: <2582168.Lt9SDvczpP@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|VI1PR04MB6927:EE_
x-ms-office365-filtering-correlation-id: 3ba47b84-4171-4912-42c7-08dc0d9d405e
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 27sXNUvwPKCPslpzz7zHxPRMIKCvdLAJfv3GwSX6kwqIcFJAcw0gZcJ3dObCUFN1fQT6RiYgIpOjEmOfGYLZH0lY+tGMHR9c/Dvy2ZUiGE9dS2m0jAn0ZRrh3qk/YsyDG2hLk0bLt/esaVaEGXsPB5tVE8nOv9XcIe7WXjUchu0hkGTRQoyk0FgeaDZI71vxNsWgyXBtGyF2gRnqv2Y9HDKBk8Y4EbRjN3HI7ws9IdeHFFlDU4OFuPk+1BL/osJ46SDoAnFf1lNOO4mdX0ymv3POIrP21S1Dp9UbI4vjyFxThotBZskwkqWpqG7kUkhGoSad4bRY3fNhp2/AwdmoPNZGsEdsZk3MoGB4/jUUU2dBuj4u4sf4KJaY+ftgN+/uFONrT2jonR0sPmxIDxKkh4KOIV7uLjdu5zroKNzhcTXV/7I5PgCd0NOj13qgTh5s3RHEMAPEEexKsnlG6stcw2SeIxM04D3cdv80EE2PN3Az2v+3GlzXmsOH++X311CZD6FqHBoQ1aP4GktTdBlpgz7QaDg1oxScupAd/4XwAWBAmWWRUrZt6cDsepJEVVyFfxxrFHn2WLmb5UyVwicN4tz/lFhUKzBJnYaDzCyXK3w1XZNzdhxvRRdn427YLA+0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(39860400002)(396003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(66574015)(26005)(7696005)(71200400001)(9686003)(6506007)(86362001)(55016003)(83380400001)(52536014)(4326008)(316002)(54906003)(110136005)(8676002)(8936002)(7416002)(30864003)(2906002)(44832011)(5660300002)(33656002)(478600001)(45080400002)(966005)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(122000001)(38100700002)(921011)(41300700001)(38070700009)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?j3rurTxIEgdpdpVuBb+4RO3MktWh4r/RBWS2nbc08MY2k+r4aGsCpa2cT5?=
 =?iso-8859-1?Q?f2WqDjUor1cImP/ry3WeM0KTbQ5CYSQVeor9ZKbm3PfAT41ncJe3BwDfih?=
 =?iso-8859-1?Q?+1HeKJdpeTNPRvvoN+JCjOSfmE3BmL7U8rXfdLN81+VPSZKUTFOB+ElOpx?=
 =?iso-8859-1?Q?t+8I9e6uDiKdVF2+gCCRs0rzvazdsAx1cfIYJ7La+Z+zUxsS37JR6WMusr?=
 =?iso-8859-1?Q?pqaUrPQtnIbb8LM+Q+PkB7si/N6MJ/DuqIv/6d5JfylKsA2WPHL6PY305a?=
 =?iso-8859-1?Q?Jk58//4vxLDiRFY7AUJxt8n8+BpusNMO1gfKCAceTRZEzOthZEcgOlC/91?=
 =?iso-8859-1?Q?mPXVYZbEKMe8EpOhtBfYHnthrcBNApwOIdHzsUsqU4NhNQ1/2GLwSGNOPT?=
 =?iso-8859-1?Q?1nq451S/d7a58Z1PZS7S5UWK18z22Os7itknxk5e+EWfYBgmT9cHCuVPUA?=
 =?iso-8859-1?Q?iMvmxRcTK4hssELtdyBHLDhfyiqDPVZ3Jr3Q7Yw9gEYqG4fzklvtGYbrMA?=
 =?iso-8859-1?Q?7uCK6h1lD9IvF3+FVcbZRV2v3PV0Ei6xpiRGDL5+pfzYk8/5u2bVox1aKL?=
 =?iso-8859-1?Q?zGuiNKzEzTUdygxA0xialXegmCOdBjnNjHtGCu/f5O3ZBeFbNTRO0Io+dB?=
 =?iso-8859-1?Q?7puz+S2uDECS4IgcbBSWFRR4W0k1c2dHDgkOlnjcegLXkOfdgYSX2ViJHO?=
 =?iso-8859-1?Q?Lu1P3URsZqkqQkR+LmqjX+uW8AsjXogpeoycYkX2T6exFqBAudXiyQ7cT4?=
 =?iso-8859-1?Q?PCkclTjA6LI34vhpHF0ro7E6sLvWZRv6GwdASX5x3MWe4R/zmGk60zYZdk?=
 =?iso-8859-1?Q?xaHcrM41q2VrDs1wvuMWMD01s6ZlKozbW0wl46ib1DD6Lce3a3EDwijFe3?=
 =?iso-8859-1?Q?43l30sjvhUibgfDEgqvzGA7AfNMKqF+UrDj8O45xLPqPJcLB2vIzwmvLSu?=
 =?iso-8859-1?Q?kp0Tfv58076nUY75HbLZtMCnUZh2qio7sarbmZfzgggdI/CdCBYrMarDnH?=
 =?iso-8859-1?Q?PB1vKO+ftAu/GNQWAOqdTvR0hqS/dRkvwnR9x3RljpkodX1aTYZtD7mff/?=
 =?iso-8859-1?Q?vhh7bkl130lMW6YRlLZX284vIzZEJli7bMGMgcOhjg+HUiAqLxj/4+bX5H?=
 =?iso-8859-1?Q?Jpxo8v+NxKb3MIisadPq2iy8+CGpVXnqSp3oEf00YDqE9XiZ4YcoZkc0TU?=
 =?iso-8859-1?Q?/4zoTX8MrBFGdGsZw/TdUA9N72nvCEqs4CJSo8hf68Dy/+IDU2l9HwvQE1?=
 =?iso-8859-1?Q?Znyt32c06W6XsqPOKoKBbNK8KUGUgbWNt7kuu9Ufvc8WL1uhBSE2gLy0jK?=
 =?iso-8859-1?Q?2GZDvaPRhJRAN7Yt6OIXc081iBTjlPUiyQkDOxAkt1BC9C80dgOfUIMm/U?=
 =?iso-8859-1?Q?a+kDPiNIDiaa9OsV2L7PWxWDI/fHMlVf5hMUYlziSNdCrOsyyjG0JuoWmE?=
 =?iso-8859-1?Q?RKozDHiyloN1+8oCH4/0y2Kffs0rDZ/w2usrY4FQkqbQAzp3j2LURZX7ds?=
 =?iso-8859-1?Q?SJlWUqfOhEdPBJYxczNWcv/g+9dGVgF+wHf1yJLf0cx3LH/AjeBRPLE1u3?=
 =?iso-8859-1?Q?Ttxa1C0WBRdZCG0KTsoTmyN07rgMXgbjBb75hXqgfwqHsz5xkAz6HHD1hd?=
 =?iso-8859-1?Q?O57UD1w2yuJ0Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba47b84-4171-4912-42c7-08dc0d9d405e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 03:20:22.0514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNu4ax8G6TZY0fVXSxkpmi9g8uoH9nKmFrLoClDAmyXzLUarnR23cRYkgBNwBT2iUePFANJtF/1NZVI3PkyaZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6927
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

Thanks for your comments,

>
> Hi Sandor,
>
> thanks for the update.
>
> One small typo in the commit message: 'Creat' -> 'Create'
>
> Am Dienstag, 17. Oktober 2023, 09:03:57 CEST schrieb Sandor Yu:
> > MHDP8546 mailbox access functions will be share to other mhdp driver
> > and Cadence HDP-TX HDMI/DP PHY drivers.
> > Create a new mhdp helper driver and move all those functions into.
> >
> > cdns_mhdp_reg_write() is renamed to cdns_mhdp_dp_reg_write(), because
> > it use the DPTX command ID DPTX_WRITE_REGISTER.
> >
> > New cdns_mhdp_reg_write() is created with the general command ID
> > GENERAL_REGISTER_WRITE.
> >
> > rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver, use
> > cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write() same
> as
> > the other mailbox access functions.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> > v10->v11:
> > - rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver, use
> > cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write() same
> as
> > the other mailbox access functions.
> > - use static for cdns_mhdp_mailbox_write() and
> > cdns_mhdp_mailbox_read() and remove them from
> EXPORT_SYMBOL_GPL().
> >
> > v9->v10:
> >  *use mhdp helper driver to replace macro functions,  move maibox
> > access function and mhdp hdmi/dp common API  functions into the
> > driver.
> >
> >  drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +
> >  drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
> >  .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 304 +++++++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 403 +++---------------
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
> >  include/drm/bridge/cdns-mhdp-helper.h         |  94 ++++
> >  6 files changed, 476 insertions(+), 374 deletions(-)  create mode
> > 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> >  create mode 100644 include/drm/bridge/cdns-mhdp-helper.h
> >
> > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > b/drivers/gpu/drm/bridge/cadence/Kconfig index
> > ec35215a20034..0b7b4626a7af0
> > 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > @@ -20,6 +20,9 @@ config DRM_CDNS_DSI_J721E
> >         the routing of the DSS DPI signal to the Cadence DSI.
> >  endif
> >
> > +config CDNS_MHDP_HELPER
> > +     tristate
> > +
> >  config DRM_CDNS_MHDP8546
> >       tristate "Cadence DPI/DP bridge"
> >       select DRM_DISPLAY_DP_HELPER
> > @@ -27,6 +30,7 @@ config DRM_CDNS_MHDP8546
> >       select DRM_DISPLAY_HELPER
> >       select DRM_KMS_HELPER
> >       select DRM_PANEL_BRIDGE
> > +     select CDNS_MHDP_HELPER
> >       depends on OF
> >       help
> >         Support Cadence DPI to DP bridge. This is an internal diff
> > --git a/drivers/gpu/drm/bridge/cadence/Makefile
> > b/drivers/gpu/drm/bridge/cadence/Makefile index
> > c95fd5b81d137..087dc074820d7 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > @@ -2,6 +2,7 @@
> >  obj-$(CONFIG_DRM_CDNS_DSI) +=3D cdns-dsi.o  cdns-dsi-y :=3D
> > cdns-dsi-core.o
> >  cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) +=3D cdns-dsi-j721e.o
> > +obj-$(CONFIG_CDNS_MHDP_HELPER) +=3D cdns-mhdp-helper.o
> >  obj-$(CONFIG_DRM_CDNS_MHDP8546) +=3D cdns-mhdp8546.o
> cdns-mhdp8546-y
> > :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> >  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D
> > cdns-mhdp8546-j721e.o diff --git
> > a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c new file mode
> > 100644 index 0000000000000..8cabd79ad9663
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > @@ -0,0 +1,304 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/bridge/cdns-mhdp-helper.h> #include
> > +<linux/dev_printk.h> #include <linux/module.h>
> > +
> > +/* Mailbox helper functions */
> > +static int cdns_mhdp_mailbox_read(struct cdns_mhdp_base *base) {
> > +     int ret, empty;
> > +
> > +     WARN_ON(!mutex_is_locked(base->mbox_mutex));
>
> Actually this should be moved to cdns_mhdp_mailbox_recv_header() and
> cdns_mhdp_mailbox_recv_data().

Yes, it could be moved to cdns_mhdp_mailbox_send() only and removed from cd=
ns_mhdp_mailbox_read()
cdns_mhdp_mailbox_write(), but those mailbox access functions are move from=
 cdns-mhdp8546-core.c,
I think it had better keep the same implement in this patch set. Another pa=
tch may need to fix it.

>
> > +     ret =3D readx_poll_timeout(readl, base->regs +
> CDNS_MAILBOX_EMPTY,
> > +                              empty, !empty, MAILBOX_RETRY_US,
> > +                              MAILBOX_TIMEOUT_US);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return readl(base->regs + CDNS_MAILBOX_RX_DATA) & 0xff; }
> > +
> > +static int cdns_mhdp_mailbox_write(struct cdns_mhdp_base *base, u8
> > +val) {
> > +     int ret, full;
> > +
> > +     WARN_ON(!mutex_is_locked(base->mbox_mutex));
>
> I think this should be moved to cdns_mhdp_mailbox_send() as well.

Same reply as above.

>
> > +     ret =3D readx_poll_timeout(readl, base->regs + CDNS_MAILBOX_FULL,
> > +                              full, !full, MAILBOX_RETRY_US,
> > +                              MAILBOX_TIMEOUT_US);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     writel(val, base->regs + CDNS_MAILBOX_TX_DATA);
> > +
> > +     return 0;
> > +}
>
> Nice, much better having these as static now.

Thanks.

>
> > +int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
> > +                               u8 module_id, u8 opcode,
> > +                               u16 req_size) {
> > +     u32 mbox_size, i;
> > +     u8 header[4];
> > +     int ret;
> > +
> > +     /* read the header of the message */
> > +     for (i =3D 0; i < sizeof(header); i++) {
> > +             ret =3D cdns_mhdp_mailbox_read(base);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             header[i] =3D ret;
> > +     }
> > +
> > +     mbox_size =3D get_unaligned_be16(header + 2);
> > +
> > +     if (opcode !=3D header[0] || module_id !=3D header[1] ||
> > +         req_size !=3D mbox_size) {
> > +             /*
> > +              * If the message in mailbox is not what we want, we
> > + need
> to
> > +              * clear the mailbox by reading its contents.
> > +              */
> > +             for (i =3D 0; i < mbox_size; i++)
> > +                     if (cdns_mhdp_mailbox_read(base) < 0)
> > +                             break;
> > +
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_header);
> > +
> > +int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
> > +                             u8 *buff, u16 buff_size) {
> > +     u32 i;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < buff_size; i++) {
> > +             ret =3D cdns_mhdp_mailbox_read(base);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             buff[i] =3D ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_data);
> > +
> > +int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8
> module_id,
> > +                        u8 opcode, u16 size, u8 *message) {
> > +     u8 header[4];
> > +     int ret, i;
> > +
> > +     header[0] =3D opcode;
> > +     header[1] =3D module_id;
> > +     put_unaligned_be16(size, header + 2);
> > +
> > +     for (i =3D 0; i < sizeof(header); i++) {
> > +             ret =3D cdns_mhdp_mailbox_write(base, header[i]);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     for (i =3D 0; i < size; i++) {
> > +             ret =3D cdns_mhdp_mailbox_write(base, message[i]);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send);
> > +
> > +/* General helper functions */
> > +int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32
> > +*value) {
> > +     u8 msg[4], resp[8];
> > +     int ret;
> > +
> > +     put_unaligned_be32(addr, msg);
> > +
> > +     mutex_lock(base->mbox_mutex);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
> > +                                  GENERAL_REGISTER_READ,
> > +                                  sizeof(msg), msg);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_header(base,
> MB_MODULE_ID_GENERAL,
> > +
> GENERAL_REGISTER_READ,
> > +                                         sizeof(resp));
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_data(base, resp, sizeof(resp));
> > +     if (ret)
> > +             goto out;
> > +
> > +     /* Returned address value should be the same as requested */
> > +     if (memcmp(msg, resp, sizeof(msg))) {
> > +             ret =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     *value =3D get_unaligned_be32(resp + 4);
> > +
> > +out:
> > +     mutex_unlock(base->mbox_mutex);
> > +     if (ret) {
> > +             dev_err(base->dev, "Failed to read register\n");
> > +             *value =3D 0;
> > +     }
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_reg_read);
> > +
> > +int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32
> > +val) {
> > +     u8 msg[8];
> > +     int ret;
> > +
> > +     put_unaligned_be32(addr, msg);
> > +     put_unaligned_be32(val, msg + 4);
> > +
> > +     mutex_lock(base->mbox_mutex);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
> > +                                  GENERAL_REGISTER_WRITE,
> > +                                  sizeof(msg), msg);
> > +
> > +     mutex_unlock(base->mbox_mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_reg_write);
> > +
> > +/* DPTX helper functions */
> > +int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr,
> u32
> > +val) {
> > +     u8 msg[6];
> > +     int ret;
> > +
> > +     put_unaligned_be16(addr, msg);
> > +     put_unaligned_be32(val, msg + 2);
> > +
> > +     mutex_lock(base->mbox_mutex);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > +                                  DPTX_WRITE_REGISTER,
> sizeof(msg),
> msg);
> > +
> > +     mutex_unlock(base->mbox_mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write);
> > +
> > +int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
> > +                            u8 start_bit, u8 bits_no, u32 val) {
> > +     u8 field[8];
> > +     int ret;
> > +
> > +     put_unaligned_be16(addr, field);
> > +     field[2] =3D start_bit;
> > +     field[3] =3D bits_no;
> > +     put_unaligned_be32(val, field + 4);
> > +
> > +     mutex_lock(base->mbox_mutex);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > +                                  DPTX_WRITE_FIELD,
> sizeof(field),
> field);
> > +
> > +     mutex_unlock(base->mbox_mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write_bit);
> > +
> > +int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
> > +                     u32 addr, u8 *data, u16 len) {
> > +     u8 msg[5], reg[5];
> > +     int ret;
> > +
> > +     put_unaligned_be16(len, msg);
> > +     put_unaligned_be24(addr, msg + 2);
> > +
> > +     mutex_lock(base->mbox_mutex);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > +                                  DPTX_READ_DPCD, sizeof(msg),
> msg);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_header(base,
> MB_MODULE_ID_DP_TX,
> > +                                         DPTX_READ_DPCD,
> > +                                         sizeof(reg) + len);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_data(base, data, len);
> > +
> > +out:
> > +     mutex_unlock(base->mbox_mutex);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_read);
> > +
> > +int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8
> > +value) {
> > +     u8 msg[6], reg[5];
> > +     int ret;
> > +
> > +     put_unaligned_be16(1, msg);
> > +     put_unaligned_be24(addr, msg + 2);
> > +     msg[5] =3D value;
> > +
> > +     mutex_lock(base->mbox_mutex);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
> > +                                  DPTX_WRITE_DPCD,
> sizeof(msg),
> msg);
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_header(base,
> MB_MODULE_ID_DP_TX,
> > +                                         DPTX_WRITE_DPCD,
> sizeof(reg));
> > +     if (ret)
> > +             goto out;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
> > +     if (ret)
> > +             goto out;
> > +
> > +     if (addr !=3D get_unaligned_be24(reg + 2))
> > +             ret =3D -EINVAL;
>
> No need to have the mutex locked while doing this check. This should be
> moved below 'out' label.

It is to check the recv data for cdns_mhdp_mailbox_recv_data() only,
if moved below "out" label, it will run for every maibox failed.
So it have to be keep in mutex lock.

>
> > +out:
> > +     mutex_unlock(base->mbox_mutex);
> > +
> > +     if (ret)
> > +             dev_err(base->dev, "dpcd write failed: %d\n", ret);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_write);
> > +
> > +MODULE_DESCRIPTION("Cadence MHDP Helper driver");
> > +MODULE_AUTHOR("Sandor Yu <Sandor.yu@nxp.com>");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c index
> > 6af565ac307ae..9d9dbb976868c 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > @@ -73,298 +73,28 @@ static void cdns_mhdp_bridge_hpd_disable(struct
> > drm_bridge *bridge) mhdp->regs + CDNS_APB_INT_MASK);  }
> >
> > -static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp) -{
> > -     int ret, empty;
> > -
> > -     WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> > -
> > -     ret =3D readx_poll_timeout(readl, mhdp->regs +
> CDNS_MAILBOX_EMPTY,
> > -                              empty, !empty, MAILBOX_RETRY_US,
> > -                              MAILBOX_TIMEOUT_US);
> > -     if (ret < 0)
> > -             return ret;
> > -
> > -     return readl(mhdp->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
> > -}
> > -
> > -static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8
> > val) -{
> > -     int ret, full;
> > -
> > -     WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
> > -
> > -     ret =3D readx_poll_timeout(readl, mhdp->regs +
> CDNS_MAILBOX_FULL,
> > -                              full, !full, MAILBOX_RETRY_US,
> > -                              MAILBOX_TIMEOUT_US);
> > -     if (ret < 0)
> > -             return ret;
> > -
> > -     writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
> > -
> > -     return 0;
> > -}
> > -
> > -static int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_device
> *mhdp,
> > -                                      u8 module_id, u8 opcode,
> > -                                      u16 req_size)
> > -{
> > -     u32 mbox_size, i;
> > -     u8 header[4];
> > -     int ret;
> > -
> > -     /* read the header of the message */
> > -     for (i =3D 0; i < sizeof(header); i++) {
> > -             ret =3D cdns_mhdp_mailbox_read(mhdp);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             header[i] =3D ret;
> > -     }
> > -
> > -     mbox_size =3D get_unaligned_be16(header + 2);
> > -
> > -     if (opcode !=3D header[0] || module_id !=3D header[1] ||
> > -         req_size !=3D mbox_size) {
> > -             /*
> > -              * If the message in mailbox is not what we want, we need
> to
> > -              * clear the mailbox by reading its contents.
> > -              */
> > -             for (i =3D 0; i < mbox_size; i++)
> > -                     if (cdns_mhdp_mailbox_read(mhdp) < 0)
> > -                             break;
> > -
> > -             return -EINVAL;
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> > -static int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_device
> *mhdp,
> > -                                    u8 *buff, u16 buff_size)
> > -{
> > -     u32 i;
> > -     int ret;
> > -
> > -     for (i =3D 0; i < buff_size; i++) {
> > -             ret =3D cdns_mhdp_mailbox_read(mhdp);
> > -             if (ret < 0)
> > -                     return ret;
> > -
> > -             buff[i] =3D ret;
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> > -static int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8
> > module_id, -                            u8 opcode, u16 size, u8
> *message)
> > -{
> > -     u8 header[4];
> > -     int ret, i;
> > -
> > -     header[0] =3D opcode;
> > -     header[1] =3D module_id;
> > -     put_unaligned_be16(size, header + 2);
> > -
> > -     for (i =3D 0; i < sizeof(header); i++) {
> > -             ret =3D cdns_mhdp_mailbox_write(mhdp, header[i]);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > -
> > -     for (i =3D 0; i < size; i++) {
> > -             ret =3D cdns_mhdp_mailbox_write(mhdp, message[i]);
> > -             if (ret)
> > -                     return ret;
> > -     }
> > -
> > -     return 0;
> > -}
> > -
> > -static
> > -int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr, u32
> > *value) -{
> > -     u8 msg[4], resp[8];
> > -     int ret;
> > -
> > -     put_unaligned_be32(addr, msg);
> > -
> > -     mutex_lock(&mhdp->mbox_mutex);
> > -
> > -     ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
> > -                                  GENERAL_REGISTER_READ,
> > -                                  sizeof(msg), msg);
> > -     if (ret)
> > -             goto out;
> > -
> > -     ret =3D cdns_mhdp_mailbox_recv_header(mhdp,
> MB_MODULE_ID_GENERAL,
> > -
> GENERAL_REGISTER_READ,
> > -                                         sizeof(resp));
> > -     if (ret)
> > -             goto out;
> > -
> > -     ret =3D cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));
> > -     if (ret)
> > -             goto out;
> > -
> > -     /* Returned address value should be the same as requested */
> > -     if (memcmp(msg, resp, sizeof(msg))) {
> > -             ret =3D -EINVAL;
> > -             goto out;
> > -     }
> > -
> > -     *value =3D get_unaligned_be32(resp + 4);
> > -
> > -out:
> > -     mutex_unlock(&mhdp->mbox_mutex);
> > -     if (ret) {
> > -             dev_err(mhdp->dev, "Failed to read register\n");
> > -             *value =3D 0;
> > -     }
> > -
> > -     return ret;
> > -}
> > -
> > -static
> > -int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u16 addr, u32
> > val) -{
> > -     u8 msg[6];
> > -     int ret;
> > -
> > -     put_unaligned_be16(addr, msg);
> > -     put_unaligned_be32(val, msg + 2);
> > -
> > -     mutex_lock(&mhdp->mbox_mutex);
> > -
> > -     ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > -                                  DPTX_WRITE_REGISTER,
> sizeof(msg),
> msg);
> > -
> > -     mutex_unlock(&mhdp->mbox_mutex);
> > -
> > -     return ret;
> > -}
> > -
> >  static
> > -int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
> > -                         u8 start_bit, u8 bits_no, u32 val)
> > -{
> > -     u8 field[8];
> > -     int ret;
> > -
> > -     put_unaligned_be16(addr, field);
> > -     field[2] =3D start_bit;
> > -     field[3] =3D bits_no;
> > -     put_unaligned_be32(val, field + 4);
> > -
> > -     mutex_lock(&mhdp->mbox_mutex);
> > -
> > -     ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > -                                  DPTX_WRITE_FIELD,
> sizeof(field),
> field);
> > -
> > -     mutex_unlock(&mhdp->mbox_mutex);
> > -
> > -     return ret;
> > -}
> > -
> > -static
> > -int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
> > -                     u32 addr, u8 *data, u16 len)
> > -{
> > -     u8 msg[5], reg[5];
> > -     int ret;
> > -
> > -     put_unaligned_be16(len, msg);
> > -     put_unaligned_be24(addr, msg + 2);
> > -
> > -     mutex_lock(&mhdp->mbox_mutex);
> > -
> > -     ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > -                                  DPTX_READ_DPCD, sizeof(msg),
> msg);
> > -     if (ret)
> > -             goto out;
> > -
> > -     ret =3D cdns_mhdp_mailbox_recv_header(mhdp,
> MB_MODULE_ID_DP_TX,
> > -                                         DPTX_READ_DPCD,
> > -                                         sizeof(reg) + len);
> > -     if (ret)
> > -             goto out;
> > -
> > -     ret =3D cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
> > -     if (ret)
> > -             goto out;
> > -
> > -     ret =3D cdns_mhdp_mailbox_recv_data(mhdp, data, len);
> > -
> > -out:
> > -     mutex_unlock(&mhdp->mbox_mutex);
> > -
> > -     return ret;
> > -}
> > -
> > -static
> > -int cdns_mhdp_dpcd_write(struct cdns_mhdp_device *mhdp, u32 addr, u8
> > value)
> > +int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp,
> bool
> > enable) {
> > -     u8 msg[6], reg[5];
> > +     u8 status;
> >       int ret;
> >
> > -     put_unaligned_be16(1, msg);
> > -     put_unaligned_be24(addr, msg + 2);
> > -     msg[5] =3D value;
> > -
> >       mutex_lock(&mhdp->mbox_mutex);
> >
> > -     ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > -                                  DPTX_WRITE_DPCD,
> sizeof(msg),
> msg);
> > -     if (ret)
> > -             goto out;
> > -
> > -     ret =3D cdns_mhdp_mailbox_recv_header(mhdp,
> MB_MODULE_ID_DP_TX,
> > -                                         DPTX_WRITE_DPCD,
> sizeof(reg));
> > -     if (ret)
> > -             goto out;
> > +     status =3D enable ? FW_ACTIVE : FW_STANDBY;
>
> Initialising status can be done outside of the locked mutex.
OK.
>
> > -     ret =3D cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
> > +     ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_GENERAL,
> > +                                  GENERAL_MAIN_CONTROL,
> sizeof(status), &status);
> >       if (ret)
> >               goto out;
> >
> > -     if (addr !=3D get_unaligned_be24(reg + 2))
> > -             ret =3D -EINVAL;
> > -
> > -out:
> > -     mutex_unlock(&mhdp->mbox_mutex);
> > -
> > -     if (ret)
> > -             dev_err(mhdp->dev, "dpcd write failed: %d\n", ret);
> > -     return ret;
> > -}
> > -
> > -static
> > -int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp,
> bool
> > enable) -{
> > -     u8 msg[5];
> > -     int ret, i;
> > -
> > -     msg[0] =3D GENERAL_MAIN_CONTROL;
> > -     msg[1] =3D MB_MODULE_ID_GENERAL;
> > -     msg[2] =3D 0;
> > -     msg[3] =3D 1;
> > -     msg[4] =3D enable ? FW_ACTIVE : FW_STANDBY;
> > -
> > -     mutex_lock(&mhdp->mbox_mutex);
> > -
> > -     for (i =3D 0; i < sizeof(msg); i++) {
> > -             ret =3D cdns_mhdp_mailbox_write(mhdp, msg[i]);
> > -             if (ret)
> > -                     goto out;
> > -     }
> > -
> > -     /* read the firmware state */
> > -     ret =3D cdns_mhdp_mailbox_recv_data(mhdp, msg, sizeof(msg));
> > +     ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> MB_MODULE_ID_GENERAL,
> > +
> GENERAL_MAIN_CONTROL,
> > +                                         sizeof(status));
> >       if (ret)
> >               goto out;
> >
> > -     ret =3D 0;
> > +     ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, &status,
> sizeof(status));
> >
> >  out:
> >       mutex_unlock(&mhdp->mbox_mutex); @@ -382,18 +112,18 @@
> int
> > cdns_mhdp_get_hpd_status(struct cdns_mhdp_device
> > *mhdp)
> >
> >       mutex_lock(&mhdp->mbox_mutex);
> >
> > -     ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > +     ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> >                                    DPTX_HPD_STATE, 0, NULL);
> >       if (ret)
> >               goto err_get_hpd;
> >
> > -     ret =3D cdns_mhdp_mailbox_recv_header(mhdp,
> MB_MODULE_ID_DP_TX,
> > +     ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> > + MB_MODULE_ID_DP_TX,
> >                                           DPTX_HPD_STATE,
> >                                           sizeof(status));
> >       if (ret)
> >               goto err_get_hpd;
> >
> > -     ret =3D cdns_mhdp_mailbox_recv_data(mhdp, &status, sizeof(status)=
);
> > +     ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, &status,
> sizeof(status));
> >       if (ret)
> >               goto err_get_hpd;
> >
> > @@ -424,22 +154,22 @@ int cdns_mhdp_get_edid_block(void *data, u8
> *edid,
> >               msg[0] =3D block / 2;
> >               msg[1] =3D block % 2;
> >
> > -             ret =3D cdns_mhdp_mailbox_send(mhdp,
> MB_MODULE_ID_DP_TX,
> > +             ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> >                                            DPTX_GET_EDID,
> sizeof(msg), msg);
> >               if (ret)
> >                       continue;
> >
> > -             ret =3D cdns_mhdp_mailbox_recv_header(mhdp,
> MB_MODULE_ID_DP_TX,
> > +             ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> >
> DPTX_GET_EDID,
> >                                                   sizeof(reg) +
> length);
> >               if (ret)
> >                       continue;
> >
> > -             ret =3D cdns_mhdp_mailbox_recv_data(mhdp, reg,
> sizeof(reg));
> > +             ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, reg,
> sizeof(reg));
> >               if (ret)
> >                       continue;
> >
> > -             ret =3D cdns_mhdp_mailbox_recv_data(mhdp, edid, length);
> > +             ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, edid,
> length);
> >               if (ret)
> >                       continue;
> >
> > @@ -464,17 +194,17 @@ int cdns_mhdp_read_hpd_event(struct
> > cdns_mhdp_device
> > *mhdp)
> >
> >       mutex_lock(&mhdp->mbox_mutex);
> >
> > -     ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > +     ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> >                                    DPTX_READ_EVENT, 0, NULL);
> >       if (ret)
> >               goto out;
> >
> > -     ret =3D cdns_mhdp_mailbox_recv_header(mhdp,
> MB_MODULE_ID_DP_TX,
> > +     ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> > + MB_MODULE_ID_DP_TX,
> >                                           DPTX_READ_EVENT,
> sizeof(event));
> >       if (ret < 0)
> >               goto out;
> >
> > -     ret =3D cdns_mhdp_mailbox_recv_data(mhdp, &event, sizeof(event));
> > +     ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, &event,
> sizeof(event));
> >  out:
> >       mutex_unlock(&mhdp->mbox_mutex);
> >
> > @@ -512,20 +242,20 @@ int cdns_mhdp_adjust_lt(struct
> cdns_mhdp_device
> > *mhdp, unsigned int nlanes,
> >
> >       mutex_lock(&mhdp->mbox_mutex);
> >
> > -     ret =3D cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
> > +     ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> >                                    DPTX_ADJUST_LT,
> >                                    sizeof(payload), payload);
> >       if (ret)
> >               goto out;
> >
> >       /* Yes, read the DPCD read command response */
> > -     ret =3D cdns_mhdp_mailbox_recv_header(mhdp,
> MB_MODULE_ID_DP_TX,
> > +     ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> > + MB_MODULE_ID_DP_TX,
> >                                           DPTX_READ_DPCD,
> >                                           sizeof(hdr) +
> DP_LINK_STATUS_SIZE);
> >       if (ret)
> >               goto out;
> >
> > -     ret =3D cdns_mhdp_mailbox_recv_data(mhdp, hdr, sizeof(hdr));
> > +     ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, hdr,
> > + sizeof(hdr));
> >       if (ret)
> >               goto out;
> >
> > @@ -533,7 +263,7 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device
> > *mhdp, unsigned int nlanes, if (addr !=3D DP_LANE0_1_STATUS)
> >               goto out;
> >
> > -     ret =3D cdns_mhdp_mailbox_recv_data(mhdp, link_status,
> > +     ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, link_status,
> >                                         DP_LINK_STATUS_SIZE);
> >
> >  out:
> > @@ -847,7 +577,7 @@ static ssize_t cdns_mhdp_transfer(struct
> > drm_dp_aux *aux, unsigned int i;
> >
> >               for (i =3D 0; i < msg->size; ++i) {
> > -                     ret =3D cdns_mhdp_dpcd_write(mhdp,
> > +                     ret =3D cdns_mhdp_dpcd_write(&mhdp->base,
> >                                                  msg->address
> +
> i, buf[i]);
> >                       if (!ret)
> >                               continue; @@ -859,7 +589,7 @@
> static
> > ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux, return ret;
> >               }
> >       } else {
> > -             ret =3D cdns_mhdp_dpcd_read(mhdp, msg->address,
> > +             ret =3D cdns_mhdp_dpcd_read(&mhdp->base,
> msg->address,
> >                                         msg->buffer, msg->size);
> >               if (ret) {
> >                       dev_err(mhdp->dev, @@ -887,12 +617,12 @@
> static
> > int cdns_mhdp_link_training_init(struct
> > cdns_mhdp_device *mhdp) if (!mhdp->host.scrambler)
> >               reg32 |=3D CDNS_PHY_SCRAMBLER_BYPASS;
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG,
> reg32);
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_ENHNCD,
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_ENHNCD,
> >                           mhdp->sink.enhanced &
> mhdp->host.enhanced);
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_LANE_EN,
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_LANE_EN,
> >                           CDNS_DP_LANE_EN_LANES(mhdp-
> >link.num_lanes));
> >
> >       cdns_mhdp_link_configure(&mhdp->aux, &mhdp->link); @@ -913,7
> > +643,7 @@ static int cdns_mhdp_link_training_init(struct
> > cdns_mhdp_device *mhdp) return ret;
> >       }
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG,
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG,
> >                           CDNS_PHY_COMMON_CONFIG |
> >                           CDNS_PHY_TRAINING_EN |
> >                           CDNS_PHY_TRAINING_TYPE(1) | @@
> -1058,7
> > +788,7 @@ static bool cdns_mhdp_link_training_channel_eq(struct
> > cdns_mhdp_device *mhdp, CDNS_PHY_TRAINING_TYPE(eq_tps);
> >       if (eq_tps !=3D 4)
> >               reg32 |=3D CDNS_PHY_SCRAMBLER_BYPASS;
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG,
> reg32);
> >
> >       drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
> >                          (eq_tps !=3D 4) ? eq_tps |
> DP_LINK_SCRAMBLING_DISABLE :
> > @@ -1322,7 +1052,7 @@ static int cdns_mhdp_link_training(struct
> > cdns_mhdp_device *mhdp, mhdp->host.scrambler ? 0 :
> >                          DP_LINK_SCRAMBLING_DISABLE);
> >
> > -     ret =3D cdns_mhdp_reg_read(mhdp,
> CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &reg32);
> > +     ret =3D cdns_mhdp_reg_read(&mhdp->base,
> > + CDNS_DP_FRAMER_GLOBAL_CONFIG,
> > &reg32); if (ret < 0) {
> >               dev_err(mhdp->dev,
> >                       "Failed to read
> CDNS_DP_FRAMER_GLOBAL_CONFIG
> %d\n",
> > @@ -1333,13 +1063,13 @@ static int cdns_mhdp_link_training(struct
> > cdns_mhdp_device *mhdp, reg32 |=3D
> CDNS_DP_NUM_LANES(mhdp->link.num_lanes);
> >       reg32 |=3D CDNS_DP_WR_FAILING_EDGE_VSYNC;
> >       reg32 |=3D CDNS_DP_FRAMER_EN;
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> reg32);
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_FRAMER_GLOBAL_CONFIG,
> reg32);
> >
> >       /* Reset PHY config */
> >       reg32 =3D CDNS_PHY_COMMON_CONFIG |
> CDNS_PHY_TRAINING_TYPE(1);
> >       if (!mhdp->host.scrambler)
> >               reg32 |=3D CDNS_PHY_SCRAMBLER_BYPASS;
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG,
> reg32);
> >
> >       return 0;
> >  err:
> > @@ -1347,7 +1077,7 @@ static int cdns_mhdp_link_training(struct
> > cdns_mhdp_device *mhdp, reg32 =3D CDNS_PHY_COMMON_CONFIG |
> > CDNS_PHY_TRAINING_TYPE(1);
> >       if (!mhdp->host.scrambler)
> >               reg32 |=3D CDNS_PHY_SCRAMBLER_BYPASS;
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG,
> reg32);
> >
> >       drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
> >                          DP_TRAINING_PATTERN_DISABLE); @@
> -1461,7
> > +1191,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device
> > *mhdp) mhdp->link.num_lanes =3D cdns_mhdp_max_num_lanes(mhdp);
> >
> >       /* Disable framer for link training */
> > -     err =3D cdns_mhdp_reg_read(mhdp,
> CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
> > +     err =3D cdns_mhdp_reg_read(&mhdp->base,
> > + CDNS_DP_FRAMER_GLOBAL_CONFIG,
> > &resp); if (err < 0) {
> >               dev_err(mhdp->dev,
> >                       "Failed to read
> CDNS_DP_FRAMER_GLOBAL_CONFIG
> %d\n",
> > @@ -1470,7 +1200,7 @@ static int cdns_mhdp_link_up(struct
> > cdns_mhdp_device
> > *mhdp) }
> >
> >       resp &=3D ~CDNS_DP_FRAMER_EN;
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> resp);
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_FRAMER_GLOBAL_CONFIG,
> resp);
> >
> >       /* Spread AMP if required, enable 8b/10b coding */
> >       amp[0] =3D cdns_mhdp_get_ssc_supported(mhdp) ?
> DP_SPREAD_AMP_0_5 :
> > 0; @@ -1837,7 +1567,7 @@ static void cdns_mhdp_configure_video(struct
> > cdns_mhdp_device *mhdp, if (mode->flags &
> DRM_MODE_FLAG_INTERLACE)
> >               bnd_hsync2vsync |=3D
> CDNS_IP_DET_INTERLACE_FORMAT;
> >
> > -     cdns_mhdp_reg_write(mhdp,
> CDNS_BND_HSYNC2VSYNC(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> > + CDNS_BND_HSYNC2VSYNC(stream_id),
> >                           bnd_hsync2vsync);
> >
> >       hsync2vsync_pol_ctrl =3D 0;
> > @@ -1845,10 +1575,10 @@ static void cdns_mhdp_configure_video(struct
> > cdns_mhdp_device *mhdp, hsync2vsync_pol_ctrl |=3D
> > CDNS_H2V_HSYNC_POL_ACTIVE_LOW;
> >       if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> >               hsync2vsync_pol_ctrl |=3D
> CDNS_H2V_VSYNC_POL_ACTIVE_LOW;
> > -     cdns_mhdp_reg_write(mhdp,
> CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
> >                           hsync2vsync_pol_ctrl);
> >
> > -     cdns_mhdp_reg_write(mhdp,
> CDNS_DP_FRAMER_PXL_REPR(stream_id),
> pxl_repr);
> > +     cdns_mhdp_reg_write(&mhdp->base,
> > + CDNS_DP_FRAMER_PXL_REPR(stream_id),
> > pxl_repr);
> >
> >       if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> >               dp_framer_sp |=3D CDNS_DP_FRAMER_INTERLACE; @@
> -1856,19
> > +1586,19 @@ static void cdns_mhdp_configure_video(struct
> > cdns_mhdp_device *mhdp, dp_framer_sp |=3D
> CDNS_DP_FRAMER_HSYNC_POL_LOW;
> >       if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> >               dp_framer_sp |=3D CDNS_DP_FRAMER_VSYNC_POL_LOW;
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_SP(stream_id),
> dp_framer_sp);
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_FRAMER_SP(stream_id),
> > dp_framer_sp);
> >
> >       front_porch =3D mode->crtc_hsync_start - mode->crtc_hdisplay;
> >       back_porch =3D mode->crtc_htotal - mode->crtc_hsync_end;
> > -     cdns_mhdp_reg_write(mhdp,
> CDNS_DP_FRONT_BACK_PORCH(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_FRONT_BACK_PORCH(stream_id),
> >                           CDNS_DP_FRONT_PORCH(front_porch) |
> >                           CDNS_DP_BACK_PORCH(back_porch));
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_BYTE_COUNT(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_BYTE_COUNT(stream_id),
> >                           mode->crtc_hdisplay * bpp / 8);
> >
> >       msa_h0 =3D mode->crtc_htotal - mode->crtc_hsync_start;
> > -     cdns_mhdp_reg_write(mhdp,
> CDNS_DP_MSA_HORIZONTAL_0(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_MSA_HORIZONTAL_0(stream_id),
> >
> CDNS_DP_MSAH0_H_TOTAL(mode->crtc_htotal) |
> >
> CDNS_DP_MSAH0_HSYNC_START(msa_h0));
> >
> > @@ -1877,11 +1607,11 @@ static void cdns_mhdp_configure_video(struct
> > cdns_mhdp_device *mhdp,
> CDNS_DP_MSAH1_HDISP_WIDTH(mode->crtc_hdisplay);
> >       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> >               msa_horizontal_1 |=3D
> CDNS_DP_MSAH1_HSYNC_POL_LOW;
> > -     cdns_mhdp_reg_write(mhdp,
> CDNS_DP_MSA_HORIZONTAL_1(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_MSA_HORIZONTAL_1(stream_id),
> >                           msa_horizontal_1);
> >
> >       msa_v0 =3D mode->crtc_vtotal - mode->crtc_vsync_start;
> > -     cdns_mhdp_reg_write(mhdp,
> CDNS_DP_MSA_VERTICAL_0(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> > + CDNS_DP_MSA_VERTICAL_0(stream_id),
> >
> CDNS_DP_MSAV0_V_TOTAL(mode->crtc_vtotal) |
> >
> CDNS_DP_MSAV0_VSYNC_START(msa_v0));
> >
> > @@ -1890,7 +1620,7 @@ static void cdns_mhdp_configure_video(struct
> > cdns_mhdp_device *mhdp,
> CDNS_DP_MSAV1_VDISP_WIDTH(mode->crtc_vdisplay);
> >       if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> >               msa_vertical_1 |=3D CDNS_DP_MSAV1_VSYNC_POL_LOW;
> > -     cdns_mhdp_reg_write(mhdp,
> CDNS_DP_MSA_VERTICAL_1(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> > + CDNS_DP_MSA_VERTICAL_1(stream_id),
> >                           msa_vertical_1);
> >
> >       if ((mode->flags & DRM_MODE_FLAG_INTERLACE) && @@
> -1902,14
> > +1632,14 @@ static void cdns_mhdp_configure_video(struct
> > cdns_mhdp_device *mhdp, if (pxlfmt =3D=3D DRM_COLOR_FORMAT_YCBCR420)
> >               misc1 =3D CDNS_DP_TEST_VSC_SDP;
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_MISC(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_MSA_MISC(stream_id),
> >                           misc0 | (misc1 << 8));
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_HORIZONTAL(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_HORIZONTAL(stream_id),
> >                           CDNS_DP_H_HSYNC_WIDTH(hsync) |
> >
> CDNS_DP_H_H_TOTAL(mode->crtc_hdisplay));
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_0(stream_id),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_VERTICAL_0(stream_id),
> >
> CDNS_DP_V0_VHEIGHT(mode->crtc_vdisplay) |
> >                           CDNS_DP_V0_VSTART(msa_v0));
> >
> > @@ -1918,13 +1648,13 @@ static void cdns_mhdp_configure_video(struct
> > cdns_mhdp_device *mhdp, mode->crtc_vtotal % 2 =3D=3D 0)
> >               dp_vertical_1 |=3D CDNS_DP_V1_VTOTAL_EVEN;
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_1(stream_id),
> dp_vertical_1);
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_VERTICAL_1(stream_id),
> > dp_vertical_1);
> >
> > -     cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_VB_ID(stream_id), 2, 1,
> > -                             (mode->flags &
> DRM_MODE_FLAG_INTERLACE) ?
> > -                             CDNS_DP_VB_ID_INTERLACED : 0);
> > +     cdns_mhdp_dp_reg_write_bit(&mhdp->base,
> > + CDNS_DP_VB_ID(stream_id), 2,
> 1,
> > +                                (mode->flags &
> DRM_MODE_FLAG_INTERLACE) ?
> > +                                CDNS_DP_VB_ID_INTERLACED :
> 0);
> >
> > -     ret =3D cdns_mhdp_reg_read(mhdp,
> CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &framer);
> > +     ret =3D cdns_mhdp_reg_read(&mhdp->base,
> > + CDNS_DP_FRAMER_GLOBAL_CONFIG,
> > &framer); if (ret < 0) {
> >               dev_err(mhdp->dev,
> >                       "Failed to read
> CDNS_DP_FRAMER_GLOBAL_CONFIG
> %d\n",
> > @@ -1933,7 +1663,7 @@ static void cdns_mhdp_configure_video(struct
> > cdns_mhdp_device *mhdp, }
> >       framer |=3D CDNS_DP_FRAMER_EN;
> >       framer &=3D ~CDNS_DP_NO_VIDEO_MODE;
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> framer);
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_FRAMER_GLOBAL_CONFIG,
> framer);
> >  }
> >
> >  static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp, @@
> > -1966,15 +1696,15 @@ static void cdns_mhdp_sst_enable(struct
> > cdns_mhdp_device *mhdp,
> >
> >       mhdp->stream_id =3D 0;
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_TU,
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_TU,
> >                           CDNS_DP_FRAMER_TU_VS(vs) |
> >                           CDNS_DP_FRAMER_TU_SIZE(tu_size) |
> >                           CDNS_DP_FRAMER_TU_CNT_RST_EN);
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_LINE_THRESH(0),
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_LINE_THRESH(0),
> >                           line_thresh & GENMASK(5, 0));
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_STREAM_CONFIG_2(0),
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_STREAM_CONFIG_2(0),
> >                           CDNS_DP_SC2_TU_VS_DIFF((tu_size - vs >
> 3) ?
> >                                                  0 : tu_size -
> vs));
> >
> > @@ -2009,13 +1739,13 @@ static void cdns_mhdp_atomic_enable(struct
> > drm_bridge *bridge, mhdp->info->ops->enable(mhdp);
> >
> >       /* Enable VIF clock for stream 0 */
> > -     ret =3D cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
> > +     ret =3D cdns_mhdp_reg_read(&mhdp->base, CDNS_DPTX_CAR,
> &resp);
> >       if (ret < 0) {
> >               dev_err(mhdp->dev, "Failed to read
> CDNS_DPTX_CAR %d\n",
> ret);
> >               goto out;
> >       }
> >
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_CAR,
> >                           resp | CDNS_VIF_CLK_EN |
> CDNS_VIF_CLK_RSTN);
> >
> >       connector =3D drm_atomic_get_new_connector_for_encoder(state,
> > @@ -2083,16 +1813,16 @@ static void cdns_mhdp_atomic_disable(struct
> > drm_bridge *bridge, cdns_mhdp_hdcp_disable(mhdp);
> >
> >       mhdp->bridge_enabled =3D false;
> > -     cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &resp);
> > +     cdns_mhdp_reg_read(&mhdp->base,
> CDNS_DP_FRAMER_GLOBAL_CONFIG,
> &resp);
> >       resp &=3D ~CDNS_DP_FRAMER_EN;
> >       resp |=3D CDNS_DP_NO_VIDEO_MODE;
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG,
> resp);
> > +     cdns_mhdp_reg_write(&mhdp->base,
> CDNS_DP_FRAMER_GLOBAL_CONFIG,
> resp);
> >
> >       cdns_mhdp_link_down(mhdp);
> >
> >       /* Disable VIF clock for stream 0 */
> > -     cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
> > -     cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
> > +     cdns_mhdp_reg_read(&mhdp->base, CDNS_DPTX_CAR, &resp);
> > +     cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_CAR,
> >                           resp & ~(CDNS_VIF_CLK_EN |
> CDNS_VIF_CLK_RSTN));
> >
> >       if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
> > @@ -2502,6 +2232,11 @@ static int cdns_mhdp_probe(struct
> > platform_device
> > *pdev)
> >
> >       platform_set_drvdata(pdev, mhdp);
> >
> > +     /* init base struct for access mailbox  */
> > +     mhdp->base.dev =3D mhdp->dev;
> > +     mhdp->base.regs =3D mhdp->regs;
> > +     mhdp->base.mbox_mutex =3D &mhdp->mbox_mutex;
> > +
> >       mhdp->info =3D of_device_get_match_data(dev);
> >
> >       clk_prepare_enable(clk);
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h index
> > bad2fc0c73066..f08db38c82bbd 100644
> > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
> > @@ -15,6 +15,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/spinlock.h>
> >
> > +#include <drm/bridge/cdns-mhdp-helper.h>
> >  #include <drm/display/drm_dp_helper.h>  #include <drm/drm_bridge.h>
> > #include <drm/drm_connector.h> @@ -27,10 +28,6 @@ struct phy;
> >  #define CDNS_APB_CTRL                                0x00000
> >  #define CDNS_CPU_STALL                               BIT(3)
> >
> > -#define CDNS_MAILBOX_FULL                    0x00008
> > -#define CDNS_MAILBOX_EMPTY                   0x0000c
> > -#define CDNS_MAILBOX_TX_DATA                 0x00010
> > -#define CDNS_MAILBOX_RX_DATA                 0x00014
> >  #define CDNS_KEEP_ALIVE                              0x00018
> >  #define CDNS_KEEP_ALIVE_MASK                 GENMASK(7, 0)
> >
> > @@ -198,45 +195,10 @@ struct phy;
> >  #define CDNS_DP_BYTE_COUNT(s)
> (CDNS_DPTX_STREAM(s) + 0x7c)
> >  #define CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT      16
> >
> > -/* mailbox */
> > -#define MAILBOX_RETRY_US                     1000
> > -#define MAILBOX_TIMEOUT_US                   2000000
> > -
> > -#define MB_OPCODE_ID                         0
> > -#define MB_MODULE_ID                         1
> > -#define MB_SIZE_MSB_ID                               2
> > -#define MB_SIZE_LSB_ID                               3
> > -#define MB_DATA_ID                           4
> > -
> > -#define MB_MODULE_ID_DP_TX                   0x01
> > -#define MB_MODULE_ID_HDCP_TX                 0x07
> > -#define MB_MODULE_ID_HDCP_RX                 0x08
> > -#define MB_MODULE_ID_HDCP_GENERAL            0x09
> > -#define MB_MODULE_ID_GENERAL                 0x0a
> > -
> > -/* firmware and opcodes */
> > +/* firmware */
> >  #define FW_NAME
> "cadence/
> mhdp8546.bin"
> >  #define CDNS_MHDP_IMEM
> 0x10000
> >
> > -#define GENERAL_MAIN_CONTROL                 0x01
> > -#define GENERAL_TEST_ECHO                    0x02
> > -#define GENERAL_BUS_SETTINGS                 0x03
> > -#define GENERAL_TEST_ACCESS                  0x04
> > -#define GENERAL_REGISTER_READ                        0x07
> > -
> > -#define DPTX_SET_POWER_MNG                   0x00
> > -#define DPTX_GET_EDID                                0x02
> > -#define DPTX_READ_DPCD                               0x03
> > -#define DPTX_WRITE_DPCD                              0x04
> > -#define DPTX_ENABLE_EVENT                    0x05
> > -#define DPTX_WRITE_REGISTER                  0x06
> > -#define DPTX_READ_REGISTER                   0x07
> > -#define DPTX_WRITE_FIELD                     0x08
> > -#define DPTX_READ_EVENT                              0x0a
> > -#define DPTX_GET_LAST_AUX_STAUS                      0x0e
> > -#define DPTX_HPD_STATE                               0x11
> > -#define DPTX_ADJUST_LT                               0x12
> > -
> >  #define FW_STANDBY                           0
> >  #define FW_ACTIVE                            1
> >
> > @@ -352,6 +314,8 @@ struct cdns_mhdp_hdcp {  };
> >
> >  struct cdns_mhdp_device {
> > +     struct cdns_mhdp_base base;
> > +
> >       void __iomem *regs;
> >       void __iomem *sapb_regs;
> >       void __iomem *j721e_regs;
> > diff --git a/include/drm/bridge/cdns-mhdp-helper.h
> > b/include/drm/bridge/cdns-mhdp-helper.h new file mode 100644 index
> > 0000000000000..477e67601ee5f
> > --- /dev/null
> > +++ b/include/drm/bridge/cdns-mhdp-helper.h
> > @@ -0,0 +1,94 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023 NXP Semiconductor, Inc.
> > + */
> > +#ifndef __CDNS_MHDP_HELPER_H__
> > +#define __CDNS_MHDP_HELPER_H__
> > +
> > +#include <asm/unaligned.h>
> > +#include <linux/iopoll.h>
> > +
> > +/* mailbox regs offset */
> > +#define CDNS_MAILBOX_FULL                    0x00008
> > +#define CDNS_MAILBOX_EMPTY                   0x0000c
> > +#define CDNS_MAILBOX_TX_DATA                 0x00010
> > +#define CDNS_MAILBOX_RX_DATA                 0x00014
> > +
> > +#define MAILBOX_RETRY_US                     1000
> > +#define MAILBOX_TIMEOUT_US                   2000000
> > +
> > +/* Module ID Code */
> > +#define MB_MODULE_ID_DP_TX                   0x01
> > +#define MB_MODULE_ID_HDMI_TX                 0x03
> > +#define MB_MODULE_ID_HDCP_TX                 0x07
> > +#define MB_MODULE_ID_HDCP_RX                 0x08
> > +#define MB_MODULE_ID_HDCP_GENERAL            0x09
> > +#define MB_MODULE_ID_GENERAL                 0x0A
> > +
> > +/* General Commands */
> > +#define GENERAL_MAIN_CONTROL                 0x01
> > +#define GENERAL_TEST_ECHO                    0x02
> > +#define GENERAL_BUS_SETTINGS                 0x03
> > +#define GENERAL_TEST_ACCESS                  0x04
> > +#define GENERAL_REGISTER_WRITE                       0x05
> > +#define GENERAL_WRITE_FIELD                  0x06
> > +#define GENERAL_REGISTER_READ                        0x07
> > +#define GENERAL_GET_HPD_STATE                        0x11
> > +
> > +/* DPTX Commands */
> > +#define DPTX_SET_POWER_MNG                   0x00
> > +#define DPTX_SET_HOST_CAPABILITIES           0x01
> > +#define DPTX_GET_EDID                                0x02
> > +#define DPTX_READ_DPCD                               0x03
> > +#define DPTX_WRITE_DPCD                              0x04
> > +#define DPTX_ENABLE_EVENT                    0x05
> > +#define DPTX_WRITE_REGISTER                  0x06
> > +#define DPTX_READ_REGISTER                   0x07
> > +#define DPTX_WRITE_FIELD                     0x08
> > +#define DPTX_TRAINING_CONTROL                        0x09
> > +#define DPTX_READ_EVENT                              0x0a
> > +#define DPTX_READ_LINK_STAT                  0x0b
> > +#define DPTX_SET_VIDEO                               0x0c
> > +#define DPTX_SET_AUDIO                               0x0d
> > +#define DPTX_GET_LAST_AUX_STAUS                      0x0e
> > +#define DPTX_SET_LINK_BREAK_POINT            0x0f
> > +#define DPTX_FORCE_LANES                     0x10
> > +#define DPTX_HPD_STATE                               0x11
> > +#define DPTX_ADJUST_LT                               0x12
> > +
> > +/* HDMI TX Commands */
> > +#define HDMI_TX_READ                         0x00
> > +#define HDMI_TX_WRITE                                0x01
> > +#define HDMI_TX_UPDATE_READ                  0x02
> > +#define HDMI_TX_EDID                         0x03
> > +#define HDMI_TX_EVENTS                               0x04
> > +#define HDMI_TX_HPD_STATUS                   0x05
> > +
> > +struct cdns_mhdp_base {
> > +     struct device *dev;
> > +     void __iomem *regs;
> > +     /* protect mailbox communications with the firmware */
> > +     struct mutex *mbox_mutex;
> > +};
> > +
> > +/* Mailbox helper functions */
> > +int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8
> module_id,
> > +                        u8 opcode, u16 size, u8 *message);
>
> Any reason to move the declaration for send before recv? It seems reasona=
ble
> to have the in alphabetical order.

OK.

>
> > +int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
> > +                               u8 module_id, u8 opcode, u16
> req_size);
> > +int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
> > +                             u8 *buff, u16 buff_size);
>
> AFAICS while calling a sequence of these 3 functions mhdp->mbox_mutex is
> locked. This should be noted here.

OK, I will add notes in the next version.

Best regards,
Sandor
>
> Best regards,
> Alexander
>
> > +/* General commands helper functions */ int cdns_mhdp_reg_read(struct
> > +cdns_mhdp_base *base, u32 addr, u32 *value); int
> > +cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val);
> > +
> > +/* DPTX commands helper functions */
> > +int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr,
> u32
> > +val); int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16
> > +addr, +
>
> >       u8 start_bit, u8 bits_no, u32 val);
> > +int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
> > +                     u32 addr, u8 *data, u16 len); int
> > +cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8
> > +value);
> > +
> > +#endif /* __CDNS_MHDP_HELPER_H__ */
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq/
> -group.com%2F&data=3D05%7C01%7CSandor.yu%40nxp.com%7C7dae84b9c73
> 944b20c8308dbcef85e20%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> C0%7C638331338392509262%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%
> 7C%7C%7C&sdata=3DenWq7M9EPSL8b6P%2BlNDyeoQ9oceS%2FkVtW7CqakrO
> GU0%3D&reserved=3D0
>

