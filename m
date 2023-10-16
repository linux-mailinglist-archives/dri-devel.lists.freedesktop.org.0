Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6090C7C9D98
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 05:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF5010E0E6;
	Mon, 16 Oct 2023 03:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB69710E047
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 03:05:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldjrR+toNvvptj1+x63K2pqQqei28QS/J6XXYAkrWW2oaIxgmA8Jog365TFlVMyY5En/lBCtYDGIHRtWdBhsnO15imtQeD5zExmimbuwMCgRicsxB6fLICqYQJ/KRHSOGXpAjcWIM5cR8eJwQI/MSi5aM2DV3V5Gmbv3UbuvfJEpuR3SDdqHcnwkhUp7pFzQn3pY60kzYzoTdIrTbdBM1caPVgSiqoH1bDWi0YO46e7WSUI30WiooN1pk5V06gvkNeMcRbYwIRUZ/u/TIOaGApBcjzMeYGIS17kTjuCRTOAhdaUQDMZrGbkXJ3h9sw9w1wSlI2BGTxX6w50thNLjgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzJZQ7b66mQCsQUQoBwAkYjhCUeI6Eo1kbaSC9qYxd0=;
 b=MKMH4spgW5AbT5SHJnlLr8qvM/u4EwrvgTU1OlwGyK2ySmrntaU8Tij+mFDndZiQcqnTARHygCIsj8UKqzOXAi7PjU9QDNOkWOAGkcRYIICLEt0cxxCpc4Js2TuCKHckC/QYf8IEPNSpgVS3h+StZ2TfN2KmVZ0HMJEvhU8MG3MHEiIkP8iJEu8GAhACvu/Mb2h8W9ufJWyi4zY6RnsVy7GBEIBH+XyGMJF0YaZGd8/Rp+EpyKytplXEO0bWrvujUg0QroFqziNf0t7APnyUMIMpiU6Ti846Q2xwyjqRDugAt7zFTCb35NdAYE8/0J7ckQSiylaivP1atEdOaIKLew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzJZQ7b66mQCsQUQoBwAkYjhCUeI6Eo1kbaSC9qYxd0=;
 b=P2eIA66G1FKAfjTSMwVPaR/MtztwViFj1OTuIvZ4tIktd0s6DTlIF/f3KsIrurfKkkJ+Ht9BiH7EKjpjKU1jvub3d5RzLJbLgtoR2ooCNhj21KDvvC0jk4f5AGG5mZD/qwje8JbS3019IwF1jVaMpOJFRC6E6n0fyB2zDcMHssg=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB7298.eurprd04.prod.outlook.com (2603:10a6:20b:1df::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 03:05:54 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Mon, 16 Oct 2023
 03:05:54 +0000
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
Subject: RE: [EXT] Re: [PATCH v10 1/7] drm: bridge: Cadence: Creat mhdp helper
 driver
Thread-Topic: [EXT] Re: [PATCH v10 1/7] drm: bridge: Cadence: Creat mhdp
 helper driver
Thread-Index: AQHZ/YCho5kXVsQF4U27TlHQArLRzLBHUtUAgAA6AfA=
Date: Mon, 16 Oct 2023 03:05:54 +0000
Message-ID: <PAXPR04MB9448AC9D8090E1F5F7E39C0EF4D7A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1697162990.git.Sandor.yu@nxp.com>
 <d9695d40842ccfd2faab7be9dbc3aa385fec0293.1697162990.git.Sandor.yu@nxp.com>
 <8621221.DvuYhMxLoT@steina-w>
In-Reply-To: <8621221.DvuYhMxLoT@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AM8PR04MB7298:EE_
x-ms-office365-filtering-correlation-id: ee10df08-ce49-4d3b-f571-08dbcdf4cf94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5lOR8XRxQpbXyKcxdrcWZAfGXu6bxbPf5AUkcGbQScL62OJVwB15oZrEg2ECz5CY3KEC2QU4w6Hs1+PFjLQjpEBL5Ke5BurQ3fTmueNqQaOasEJSC2phCb/NhW4GVkNttmwpXi/46ur8rdtfgKnoy321HUIL7CCS01IzgzLZRpfcwcujSTTR9SHBpVdzRGiBunXVn7AOm4Um0yqWDOq8XO3mx8w50dsHqNRKImAGaawLG1RCSnPHBQeK0Myxz9kNvR+c6tSOVVRg9sSPcgusfWrrWpCykk9zE2ypyt2uLOv4fIiwMz/yc1LhTikdSmKwYkTNFB5kWpNpju0i9rQVGaLbBasxHmLN02Yxi0karPvltcGGRu6kjBtU1Qr3PKKYK5H/UD5VNgA9fSVXxKUzpRU8iwOOv6wApnXbw4g8jR+2vXOiPD69q6hHLsKCSeeWU8O+1AM6loG3sQ/w6ajkoTyEt4yiAXvBdx1WTXFPKHoM6MT1NAapfWl00TQs/CERCCdhVlMgxiyviyLeSuLHcf32079P/xb95oyWd2CHUWhfW0TqbzoQHlTQctXmUpIulo6vWZyuX9uRQqYICZb5bR/U8taVBbTUsnfT0GxCKUyJT3zccMxP4tleAH09dstsfq5kMxSEBdZiOle4VYliKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(55016003)(66574015)(26005)(30864003)(83380400001)(7416002)(110136005)(76116006)(54906003)(64756008)(66446008)(66556008)(66946007)(66476007)(52536014)(4326008)(8676002)(8936002)(316002)(71200400001)(9686003)(41300700001)(7696005)(6506007)(5660300002)(44832011)(478600001)(2906002)(38100700002)(38070700005)(921005)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CV/KEfPhWAo3BuCMafGJJ/iXRBO192fjumIShv0Cvt4NuOfjA43AzSnJMz?=
 =?iso-8859-1?Q?ZywJnSSfX5vXlo/bnstcbfFmWF/N/8Ad9ortpkYzTSdksJGVGoAXGBpJtw?=
 =?iso-8859-1?Q?LN7rv5/2df852HPGjvmYT+PBPisIpm5OMXkleTOi2eJlZWeZdxYNsFzC+H?=
 =?iso-8859-1?Q?3krFkqk1lEiBNn3l/8U9FQEMGjBfHcpz1Og9+9FldC5xTPEJ4EwlqjNNPz?=
 =?iso-8859-1?Q?7fdYPpGmiu/oxXgfac+jQCBOkOWMoDpNGuThMcMTTliSO4GOraLmfRmX79?=
 =?iso-8859-1?Q?ZYEWmculhVAzI1kUSZAASxtHdnkqNSQdLHAAZlKcP3W2lK6CZRL0prs2NI?=
 =?iso-8859-1?Q?GsSY2wGVtHsMOVKlbQ0iWyBD/AseXQ7ibUR21nBB6xG6nrHWoP0J5Z7Dnx?=
 =?iso-8859-1?Q?DUZ0ViU1/t9K6k0SeHFjp7Znyp5+9D21Q682Ei8H3NCnSB5JMOcpCHqV4D?=
 =?iso-8859-1?Q?dsLEWQRc9j/rRptfQ4Uvv5NhA1jV/c1xHn1UBZAhEcLjUMdD8pOfSNpVaI?=
 =?iso-8859-1?Q?1mgaOgQAmNVbnU+KWgi/3L85u4wTs5rDhRru41whoCk/1nGEgUG0iWoe1j?=
 =?iso-8859-1?Q?pZ3kqV41aeFFC2mrrFhHLLgZPqZjhKk4B3y81Z+Q3bABE7rQqgb2TmkNb4?=
 =?iso-8859-1?Q?Ubnmv6ocAygLQD+R9Q6d5QXzDHtUOIDWUZ/qHB0XFOpgCC5UUwTuYcytN5?=
 =?iso-8859-1?Q?oEnywfyJqY50WE58VpS9W5rDb09HknUl6dDfdcRflwFg6AqUCrA4TGSkA9?=
 =?iso-8859-1?Q?CMQdAiudgMj6rrey+a1j4Vm6u9Fsgcfyb50DNIAJYUgFpp80s39jZQukl3?=
 =?iso-8859-1?Q?JPqtUUHamaTy/SOyoKPCrxhONkdOBxeHqRuNZoMGHFOxnf8j3troXsrRFY?=
 =?iso-8859-1?Q?UCzIo/NQ4aXPJbfAj0+/0q1fzPFzTMC6vrQDPJFr0FtBCQT4+DXlErbFzR?=
 =?iso-8859-1?Q?LNZbOH6kyYH15dppxP71urJ3JZkdG8ON7dqQ4lGfyg6y1L40vf9/RUDnGK?=
 =?iso-8859-1?Q?lt3cwQl5f3rL5+n1HFqHoVW9y96tC+ri70V7C7gYjRQAg0Xe9lnjvpwp6N?=
 =?iso-8859-1?Q?t0OZLab6SvO8NWyom8Fb0edULE2fTDhpAR1/MjiOCm7dGAsk8YdjdmxaMb?=
 =?iso-8859-1?Q?e5Cl3LGGnfGTNdsp6f0PglHwUvExKHDs25UpBgO0nAtCKpayZv5FW2fW5C?=
 =?iso-8859-1?Q?2g/q20U9oPmfgDA9U4cYjS0BdiMs+2Dw5pmcsTMr9/UvtI9to2fUWidV2P?=
 =?iso-8859-1?Q?a1x2PBht/i4sBxgE4NsJ9TuJiD6WPKdohxs72FWiVpjd/+fneGyvn0Tt+m?=
 =?iso-8859-1?Q?j4tYy6JgnOJxEN2DKDNAzuziuvtTczd3DQ0LwL+IPMC722lhGJDtLaIMud?=
 =?iso-8859-1?Q?BTjoIL3MFRMuGseB6oV9zEJJssJO54mzJm1jDa0bGUArGfHfeqemRvsqxQ?=
 =?iso-8859-1?Q?vfYWpf/H/fZ/n07ZzD1AOQu6vwwHuGL4sXSVH1qp2K3pP2oA/dAy1SqMoQ?=
 =?iso-8859-1?Q?AHLjds9DJZxUi8UU+ed9hfz1pX6XoR17mD6xFAIC8ZgJQwqMH7TGoucgFU?=
 =?iso-8859-1?Q?jFRD5NP2pN/SHI7kAsS42Ad4BA5NIocJy2X3q5Nc5C36HnS0BS3w4GBVFF?=
 =?iso-8859-1?Q?oK0czI5giU95w=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee10df08-ce49-4d3b-f571-08dbcdf4cf94
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 03:05:54.1098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yLS0EfI+hIKuIak13IO7Yk1AWyVT6A0iNzZOwsjuBR64VcHPJnj76dP8ay0ACNgPspLpJlSknx7S56pRb0ooYw==
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
> Hi Sandor,
>=20
> thanks for the updated series.
>=20
> Am Freitag, 13. Oktober 2023, 05:24:20 CEST schrieb Sandor Yu:
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
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> > v9->v10:
> >  *use mhdp helper driver to replace macro functions,  move maibox
> > access function and mhdp hdmi/dp common API  functions into the
> > driver.
> >
> >  drivers/gpu/drm/bridge/cadence/Kconfig        |   4
> >  drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
> >  .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 306 ++++++++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 383 +++---------------
> >  .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
> >  include/drm/bridge/cdns-mhdp-helper.h         |  96 +++++
> >  6 files changed, 473 insertions(+), 361 deletions(-)  create mode
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
> > 100644 index 0000000000000..2e3eee40494f0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
> > @@ -0,0 +1,306 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/bridge/cdns-mhdp-helper.h> #include
> > +<linux/dev_printk.h> #include <linux/module.h>
> > +
> > +/* Mailbox helper functions */
> > +int cdns_mhdp_mailbox_read(struct cdns_mhdp_base *base) {
> > +     int ret, empty;
> > +
> > +     WARN_ON(!mutex_is_locked(base->mbox_mutex));
> > +
> > +     ret =3D readx_poll_timeout(readl, base->regs +
> CDNS_MAILBOX_EMPTY,
> > +                              empty, !empty, MAILBOX_RETRY_US,
> > +                              MAILBOX_TIMEOUT_US);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return readl(base->regs + CDNS_MAILBOX_RX_DATA) & 0xff; }
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_read);
>=20
> No need to export this. You can make this function actually static.

OK, I will change it to static in the next version.

>=20
> > +
> > +int cdns_mhdp_mailbox_write(struct cdns_mhdp_base *base, u8 val) {
> > +     int ret, full;
> > +
> > +     WARN_ON(!mutex_is_locked(base->mbox_mutex));
> > +
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
> > +EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_write);
>=20
> No need to export that one as well. You can make this function actually s=
tatic
> as these two functions are only called from the helper itself.

mhdp8546 driver need this function.=20

>=20
> > +
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
> > +
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
> > [...]
> > diff --git a/include/drm/bridge/cdns-mhdp-helper.h
> > b/include/drm/bridge/cdns-mhdp-helper.h new file mode 100644 index
> > 0000000000000..b89db9e842266
> > --- /dev/null
> > +++ b/include/drm/bridge/cdns-mhdp-helper.h
> > @@ -0,0 +1,96 @@
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
> > +int cdns_mhdp_mailbox_read(struct cdns_mhdp_base *base); int
> > +cdns_mhdp_mailbox_write(struct cdns_mhdp_base *base, u8 val);
>=20
> You can remove these two declarations.

cdns_mhdp_mailbox_read will be removed. Thanks!

B.R
Sandor

>=20
> Best regards,
> Alexander
>=20
> Best regards,
> > +int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
> > +                               u8 module_id, u8 opcode, u16
> req_size);
> > +int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
> > +                             u8 *buff, u16 buff_size); int
> > +cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
> > +                        u8 opcode, u16 size, u8 *message);
> > +
> > +/* General commands helper functions */ int cdns_mhdp_reg_read(struct
> > +cdns_mhdp_base *base, u32 addr, u32 *value); int
> > +cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val);
> > +
> > +/* DPTX commands helper functions */
> > +int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr,
> u32
> > +val); int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16
> > +addr, +
>=20
> >       u8 start_bit, u8 bits_no, u32 val);
> > +int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
> > +                     u32 addr, u8 *data, u16 len); int
> > +cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8
> > +value);
> > +
> > +#endif /* __CDNS_MHDP_HELPER_H__ */
>=20
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
>=20
>=20

