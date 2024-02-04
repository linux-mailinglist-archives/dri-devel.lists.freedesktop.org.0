Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56E0848E76
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 15:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED211121DC;
	Sun,  4 Feb 2024 14:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fV2Mter2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2063.outbound.protection.outlook.com [40.107.241.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB6110F98B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 14:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajHwFAc4x6eOGFZ/+fKMd8fe8jtf4tRrHnRfIMDIOv1rY/rQg9MlETYEz3XKjCL9veOmXPpuf5M9LENdmk6aR/R/8cEICR6F7Ev6XP/OTgXgNX/J66pQ+UvuLTGf83SwTX7jZaGRIDJlUFEfupy7784kw150jrvUHT+4+RN1x3Ub7pf+fkeZecqeZpLHo5HK0dXjWVhew+8Rqy46fRYGdeDtbY9NFAQRlpYgpLWgzkIJ7yAtvQPm3UV6OFV+AJIIxJVjhUGTilpedct4lzEstrAApn8/FtQxzHgTW3wx8smd++YR5K85hLAz7tOSQ0G50rs6Lz6+ycHBTBlTLlUNBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReO8c+mqtOo8d0rMLyA0rG2MEMDsJup2eT+ZyrzK7VM=;
 b=DRg0WRs/J9J5L0muC3DX/cNYTWrQoizJcO0XDnuNXRWIgF7MK2KSmrUCwZ4BRrC3KcbdoY2BXcU9TR1WdJ45i1OV5/OiHa9c5eb+ubaavo9yngmaTzA3C+kclS7iwPfmzszDjp4qnCig060Vd0TTlNX7BlhrLjxup+i/rXOWUPyxqBSJBNkbYHnGoOV7lJ0zjNNpS1DLjCR+xYIe5tNnvWiq3YcoeOEpvfGLvDciDvya5oDUbBgf488C6ydVdnL8zEhFJG2+sp/IXxflODgrxX/mBplzSxI0zZsxb1IwAEBE2g5b8/Qy1MhUDllcqVdJOiLc+gYW64s5YT1foYQNmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReO8c+mqtOo8d0rMLyA0rG2MEMDsJup2eT+ZyrzK7VM=;
 b=fV2Mter2g0la2n577RHoiMTnjVeEyOYQTY1603D+ewS86xKkncaP1SFd9E4JKoA7FUiiRJKmIOeBw7WIWPzsMsbGaims/vmnlaseTTd6/4adyehme9R4fX+cJIemqRfG6RrE1uwQh2h85G00hKKXDmebyCjVeekiAURPLWYEwH0=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB8709.eurprd04.prod.outlook.com (2603:10a6:10:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 14:29:05 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::b24c:5d0d:bb15:3e9%5]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 14:29:05 +0000
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
Subject: RE: [EXT] Re: [PATCH v12 4/7] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Topic: [EXT] Re: [PATCH v12 4/7] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Index: AQHaQtz7BFi3wCFUXk621i2JJ9y4pLDdznSAgBw/xxA=
Date: Sun, 4 Feb 2024 14:29:05 +0000
Message-ID: <PAXPR04MB94485C09E619D404CBF96891F4402@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1704785836.git.Sandor.yu@nxp.com>
 <d2d5d5bbde972eee5417c3e04db33895cf5ee88b.1704785836.git.Sandor.yu@nxp.com>
 <9223210.CDJkKcVGEf@steina-w>
In-Reply-To: <9223210.CDJkKcVGEf@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DU2PR04MB8709:EE_
x-ms-office365-filtering-correlation-id: 5435efc3-eef9-4f31-19ab-08dc258da416
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: puPFFHpoKg6af+Gmjb8fQlAd8xyXvDOEjrXzEra8Bh6JUS61INmcR8SC34xjTxshP/kyPvadD9fp4NBg2lS1aIpUbkLgCxSKxkWEsGbPxm80S3fhTQHLX07scPcJxsPFKUHTA0c2QaHOz2lz0X/VgttMRzYgorGrmVphO9Gx8ElSym8o+2lG4h8F0xKwYNElN+QtikEaEujEPg3/bN3T9PsjXDF/ah63GHRYOdk+O3YDYTEUdRwCkJ5u96V3qwJG34H3CPdpE60jxTtVvb4Fkvcq1Z64wn7sw8eM0R3LHYfnEj5N2rZs9tJkToy8WWbyLf71jO27YGX+qbZLoX/zDoDXfyblquSEx/W7G3mempz8GDF3p5PygH4msRUyasjYPDa+GElfK9zXGQGz0DE4O9I4uGPFZ4tVJ/JnSZPlj0LJsFGlysu8U6FeDO3GKjkgZsUJmCtfpBoUaxdQv7C+cE9Zuu6hb4zx6aoX0osE8dXRLrMBtMZtV/lWyRf+HYLttmf2ggp5MyuLk2xuZsDo44QZfk/5qP7s7khm2yBCzpd3dnUOQjflO0lFd9QY/FqQmarvqqI/T6XA3Z/NP7IVIP8bFrcG4ic3S0ZujhzKFi22xnHDRaap7hTGs5wLXuSs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(39850400004)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(83380400001)(66574015)(8676002)(38100700002)(7696005)(316002)(8936002)(4326008)(122000001)(110136005)(76116006)(66946007)(71200400001)(66556008)(64756008)(66446008)(2906002)(7416002)(5660300002)(30864003)(52536014)(66476007)(44832011)(54906003)(6506007)(966005)(9686003)(38070700009)(478600001)(45080400002)(86362001)(41300700001)(33656002)(921011)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?GCAWt7aCMSMUT6RUhDhqoNDb3qBxCpWtLyp4F/igI57wcTaCuUxu0ZGsnB?=
 =?iso-8859-1?Q?oUqw6NCWyaN4ybORGd2jld1nGl4fIM1FBQnniaPW8vZvZvbaDamsnhF7EL?=
 =?iso-8859-1?Q?aT3ZWIuPIrxYhVubtk92zLBRDipswBbKWV2TO0+xYmhj++7HkV9kOQ+Ry/?=
 =?iso-8859-1?Q?q4xhhGz+xaI/qXEKxfZ5cCMEEr+Pkb84hzS5ZwpZbzcgJ5PDXFmBWU8Cee?=
 =?iso-8859-1?Q?X4bZH4yID/QhOXvUzSG31mCUirqnPxJw8PxW7ozdnGx+dRYdIeB4UscEsA?=
 =?iso-8859-1?Q?87jPHf47D3uaxIWZSDsyeqqT9bK5a/XtLNinRu+hOy9miZI8vqBhfar39+?=
 =?iso-8859-1?Q?FMD6LMnUVUzUkkOExbvgXgODmbhh65mpO3ZVgdLH6CChOaZjzcQHc6B3yr?=
 =?iso-8859-1?Q?zq1Gnp3EmTFJf1vIyEHD38Uu9Ga9UYyimLJwSCu2F4KKh0ez9wVCMa9w9i?=
 =?iso-8859-1?Q?Lo/UQKSWdqm349VWQ3wEtz/5qduC3GlASDxDgx5vZ6u9xq2VQMxzJFknYL?=
 =?iso-8859-1?Q?TMi+4AxOIYj9abxZhnDCpIIlf3NaNxeIHLEwPELx8QFOFmVarKjLlWYQAf?=
 =?iso-8859-1?Q?AWs3yotbZFP3D1BeVX2K75XppIegxOlhwKxI+K/uVDjMT6wDFlv9rhJi+r?=
 =?iso-8859-1?Q?y6NuU0nN18WMwk9zaRh8DkOiX5xjWkNLFHBn3UQTEq/SbPRy/FXWPEbSXw?=
 =?iso-8859-1?Q?PZK4HMEi3/MCTbhDoZkj2BrFt3z317ZkTVPPRZZCfWlgXuTXNu6pBHrnyI?=
 =?iso-8859-1?Q?2PwdMa1TVwjQNG7Jq1e8k4svI4IETWSp1Ukvwz2lTnarR7gpBqi4ifXIel?=
 =?iso-8859-1?Q?QpO1p8MreFQTIHgLakT2JE8mVFbmcCrefMU+8Bo0Q5yCnuUFe2gwJIzZ1e?=
 =?iso-8859-1?Q?iiNTLTee4MUkc+/TXuyJjPjbWx2TtftAbnMlM6TcszEML3Zc5lexDH7DjN?=
 =?iso-8859-1?Q?EiHMVQeHZEkZqx7jNwZhJE39CJ02uMNmfy2niZBnjSCpMZTyUy8l/TvuHZ?=
 =?iso-8859-1?Q?1JeCVFNsVw8SUm3rgcLDhfN8Q0iJQXo0VD4xu8AFrfYr1wUtl5qdYCjPhu?=
 =?iso-8859-1?Q?NzAp8drbsADlLnI5cCX1Ad+0j7L3ZfGQePT3S5kaWYJiAzXXHsJ5NbjVNO?=
 =?iso-8859-1?Q?oWL0t/sTp2FR2R+UTesONvouSzgFus+ned2pqmVjGGVU8NwClC1ShpXsOI?=
 =?iso-8859-1?Q?roet8LSSCVVvCX7YGrSboufN2P7lrgsORsYS5GM3RzGucoS2AUuV/tF455?=
 =?iso-8859-1?Q?S+AjaxSuEl5BQLPWZCQKO7Uc3lC6OllfUsPFD08m0hvZbmS07Mly/381AY?=
 =?iso-8859-1?Q?a3F1evbGtCHtRFst8QIpTW8Iuc8mqFSNK+kSPYiJN5xh/XNH0zGqnIlnuD?=
 =?iso-8859-1?Q?7F7zrE6Sgqkba/+TgpmcLwcJUWnusa2PQ0eA2mb0ukLriLRlY8mICio98G?=
 =?iso-8859-1?Q?U6CNfFYS9JATJbGBMqmNcJfIGXRAm/Fm1bDdKa4pKJJ+fS71DS9Rkxj6oB?=
 =?iso-8859-1?Q?RyTr/BZLq26nwxJiNBA1JqK7qpsspSCIhEXsXFeRfnPKAg2HfUCAeGoHlE?=
 =?iso-8859-1?Q?GCm0OhFMNF8AldF8cYWJj4u06ytopTTjh565QnyQq7zuEoXBZeyWVcQBl6?=
 =?iso-8859-1?Q?0osJtx/1Vb68g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5435efc3-eef9-4f31-19ab-08dc258da416
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2024 14:29:05.2906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xDUWd5SVc5NQnLp6BxJsjG2x/SntIA/PI3uCmTnRs3QYIgwUinkOmXzZJY+TK5nlzCY8gtIRoXRbRBoWGqHD5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8709
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

Thanks your comments,

>
>
> Hi Sandor,
>
> thanks for the update.
>
> Am Mittwoch, 10. Januar 2024, 02:08:45 CET schrieb Sandor Yu:
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
> > v11->v12:
> > - Replace DRM_INFO with dev_info or dev_warn.
> > - Replace DRM_ERROR with dev_err.
> > - Return ret when cdns_mhdp_dpcd_read failed in function
> > cdns_dp_aux_transferi(). - Remove unused parmeter in function
> > cdns_dp_get_msa_misc
> >   and use two separate variables for color space and bpc.
> > - Add year 2024 to copyright.
> >
> >  drivers/gpu/drm/bridge/cadence/Kconfig        |  16 +
> >  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 315 ++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 365 +++++++++
> >  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 699
> ++++++++++++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 678
> +++++++++++++++++
> >  6 files changed, 2075 insertions(+)
> >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> >
> > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > b/drivers/gpu/drm/bridge/cadence/Kconfig index
> > e0973339e9e33..45848e741f5f4
> > 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > @@ -51,3 +51,19 @@ config DRM_CDNS_MHDP8546_J721E
> >         initializes the J721E Display Port and sets up the
> >         clock and data muxes.
> >  endif
> > +
> > +config DRM_CDNS_MHDP8501
> > +     tristate "Cadence MHDP8501 DP/HDMI bridge"
> > +     select DRM_KMS_HELPER
> > +     select DRM_PANEL_BRIDGE
> > +     select DRM_DISPLAY_DP_HELPER
> > +     select DRM_DISPLAY_HELPER
> > +     select CDNS_MHDP_HELPER
> > +     select DRM_CDNS_AUDIO
> > +     depends on OF
> > +     help
> > +       Support Cadence MHDP8501 DisplayPort/HDMI bridge.
> > +       Cadence MHDP8501 support one or more protocols,
> > +       including DisplayPort and HDMI.
> > +       To use the DP and HDMI drivers, their respective
> > +       specific firmware is required.
> > diff --git a/drivers/gpu/drm/bridge/cadence/Makefile
> > b/drivers/gpu/drm/bridge/cadence/Makefile index
> > 087dc074820d7..02c1a9f3cf6fc 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Makefile
> > +++ b/drivers/gpu/drm/bridge/cadence/Makefile
> > @@ -6,3 +6,5 @@ obj-$(CONFIG_CDNS_MHDP_HELPER) +=3D
> cdns-mhdp-helper.o
> >  obj-$(CONFIG_DRM_CDNS_MHDP8546) +=3D cdns-mhdp8546.o
> cdns-mhdp8546-y
> > :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> >  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D
> > cdns-mhdp8546-j721e.o
> > +obj-$(CONFIG_DRM_CDNS_MHDP8501) +=3D cdns-mhdp8501.o
> cdns-mhdp8501-y :=3D
> > +cdns-mhdp8501-core.o cdns-mhdp8501-dp.o
> > cdns-mhdp8501-hdmi.o diff --git
> > a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c new file mode
> > 100644 index 0000000000000..3080c7507a012
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > @@ -0,0 +1,315 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Cadence Display Port Interface (DP) driver
> > + *
> > + * Copyright (C) 2023, 2024 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> > +#include <linux/clk.h>
> > +#include <linux/irq.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_device.h>
>
> Since commit d57d584ef69de ("of: Stop circularly including of_device.h an=
d
> of_platform.h") you to explicitly include linux/platform_device.h here. P=
lease
> compile against next tree.

OK, I will check it on next tree.

>
> > +#include <linux/phy/phy.h>
> > +
> > +#include "cdns-mhdp8501-core.h"
> > +
> > [snip]
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c new file mode
> > 100644 index 0000000000000..6963c7143a3b0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> > @@ -0,0 +1,699 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Cadence MHDP8501 DisplayPort(DP) bridge driver
> > + *
> > + * Copyright (C) 2019-2024 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_print.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/phy/phy-dp.h>
> > +
> > +#include "cdns-mhdp8501-core.h"
> > +
> > +#define LINK_TRAINING_TIMEOUT_MS     500
> > +#define LINK_TRAINING_RETRY_MS               20
> > +
> > +ssize_t cdns_dp_aux_transfer(struct drm_dp_aux *aux,
> > +                          struct drm_dp_aux_msg *msg) {
> > +     struct cdns_mhdp8501_device *mhdp =3D dev_get_drvdata(aux->dev);
> > +     bool native =3D msg->request & (DP_AUX_NATIVE_WRITE &
> DP_AUX_NATIVE_READ);
> > +     int ret;
> > +
> > +     /* Ignore address only message */
> > +     if (!msg->size || !msg->buffer) {
> > +             msg->reply =3D native ?
> > +                     DP_AUX_NATIVE_REPLY_ACK :
> DP_AUX_I2C_REPLY_ACK;
> > +             return msg->size;
> > +     }
> > +
> > +     if (!native) {
> > +             dev_err(mhdp->dev, "%s: only native messages
> > + supported\n",
> __func__);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* msg sanity check */
> > +     if (msg->size > DP_AUX_MAX_PAYLOAD_BYTES) {
> > +             dev_err(mhdp->dev, "%s: invalid msg: size(%zu),
> request(%x)\n",
> > +                     __func__, msg->size, (unsigned int)msg-
> >request);
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (msg->request =3D=3D DP_AUX_NATIVE_WRITE) {
> > +             const u8 *buf =3D msg->buffer;
> > +             int i;
> > +
> > +             for (i =3D 0; i < msg->size; ++i) {
> > +                     ret =3D cdns_mhdp_dpcd_write(&mhdp->base,
> > +                                                msg->address +
> i, buf[i]);
> > +                     if (ret < 0) {
> > +                             dev_err(mhdp->dev, "Failed to write
> DPCD\n");
> > +                             return ret;
> > +                     }
> > +             }
> > +             msg->reply =3D DP_AUX_NATIVE_REPLY_ACK;
> > +             return msg->size;
> > +     }
> > +
> > +     if (msg->request =3D=3D DP_AUX_NATIVE_READ) {
> > +             ret =3D cdns_mhdp_dpcd_read(&mhdp->base, msg->address,
> > +                                       msg->buffer, msg->size);
> > +             if (ret < 0)
> > +                     return ret;
> > +             msg->reply =3D DP_AUX_NATIVE_REPLY_ACK;
> > +             return msg->size;
> > +     }
> > +     return 0;
> > +}
> > +
> > +int cdns_dp_aux_destroy(struct cdns_mhdp8501_device *mhdp) {
> > +     drm_dp_aux_unregister(&mhdp->dp.aux);
> > +
> > +     return 0;
> > +}
> > +
> > +static int cdns_dp_get_msa_misc(struct video_info *video) {
> > +     u32 msa_misc;
> > +     u8 color_space =3D 0;
> > +     u8 bpc =3D 0;
> > +
> > +     switch (video->color_fmt) {
> > +     /* set YUV default color space conversion to BT601 */
> > +     case DRM_COLOR_FORMAT_YCBCR444:
> > +             color_space =3D 6 + BT_601 * 8;
> > +             break;
> > +     case DRM_COLOR_FORMAT_YCBCR422:
> > +             color_space =3D 5 + BT_601 * 8;
> > +             break;
> > +     case DRM_COLOR_FORMAT_YCBCR420:
> > +             color_space =3D 5;
> > +             break;
> > +     case DRM_COLOR_FORMAT_RGB444:
> > +     default:
> > +             color_space =3D 0;
> > +             break;
> > +     };
> > +
> > +     switch (video->bpc) {
> > +     case 6:
> > +             bpc =3D 0;
> > +             break;
> > +     case 10:
> > +             bpc =3D 2;
> > +             break;
> > +     case 12:
> > +             bpc =3D 3;
> > +             break;
> > +     case 16:
> > +             bpc =3D 4;
> > +             break;
> > +     case 8:
> > +     default:
> > +             bpc =3D 1;
> > +             break;
> > +     };
> > +
> > +     msa_misc =3D (color_space << 1) | (bpc << 5);
>
> This looks much nicer, thanks. But please order them in descending shift
> width: bpc first then color_space.
>

OK.

> > +
> > +     return msa_misc;
> > +}
> > +
> > [snip]
> > +int cdns_dp_set_host_cap(struct cdns_mhdp8501_device *mhdp)
>
> This can be made static.

OK.

>
> > +{
> > +     u8 msg[8];
> > +     int ret;
> > +
> > +     msg[0] =3D drm_dp_link_rate_to_bw_code(mhdp->dp.rate);
> > +     msg[1] =3D mhdp->dp.num_lanes | SCRAMBLER_EN;
> > +     msg[2] =3D VOLTAGE_LEVEL_2;
> > +     msg[3] =3D PRE_EMPHASIS_LEVEL_3;
> > +     msg[4] =3D PTS1 | PTS2 | PTS3 | PTS4;
> > +     msg[5] =3D FAST_LT_NOT_SUPPORT;
> > +     msg[6] =3D mhdp->lane_mapping;
> > +     msg[7] =3D ENHANCED;
> > +
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> > +                                  DPTX_SET_HOST_CAPABILITIES,
> > +                                  sizeof(msg), msg);
> > +
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +
> > +     if (ret)
> > +             dev_err(mhdp->dev, "set host cap failed: %d\n", ret);
> > +
> > +     return ret;
> > +}
> > [snip]
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c new file mode
> > 100644 index 0000000000000..ae21f7dfe5e94
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > @@ -0,0 +1,678 @@
> > [snip]
> > +bool cdns_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> > +                              const struct drm_display_mode
> *mode,
> > +                              struct drm_display_mode
> *adjusted_mode)
>
> This can be made static.

OK, thanks!

Sandor

>
> Thanks and best regards,
> Alexander
>
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +     struct video_info *video =3D &mhdp->video_info;
> > +
> > +     /* The only currently supported format */
> > +     video->bpc =3D 8;
> > +     video->color_fmt =3D DRM_COLOR_FORMAT_RGB444;
> > +
> > +     return true;
> > +}
> > +
> > +static enum drm_connector_status
> > +cdns_hdmi_bridge_detect(struct drm_bridge *bridge) {
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     return cdns_mhdp8501_detect(mhdp); }
> > +
> > +static struct edid *cdns_hdmi_bridge_get_edid(struct drm_bridge *bridg=
e,
> > +                                           struct drm_connector
> *connector)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     return drm_do_get_edid(connector, cdns_hdmi_get_edid_block,
> > +mhdp); }
> > +
> > +static void cdns_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                                         struct drm_bridge_state
> *old_state)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     mhdp->curr_conn =3D NULL;
> > +
> > +     /* Mailbox protect for HDMI PHY access */
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +     phy_power_off(mhdp->phy);
> > +     mutex_unlock(&mhdp->mbox_mutex); }
> > +
> > +static void cdns_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                                        struct drm_bridge_state
> *old_state)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +     struct drm_atomic_state *state =3D old_state->base.state;
> > +     struct drm_connector *connector;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_connector_state *conn_state;
> > +     const struct drm_display_mode *mode;
> > +
> > +     connector =3D drm_atomic_get_new_connector_for_encoder(state,
> > +
> bridge->encoder);
> > +     if (WARN_ON(!connector))
> > +             return;
> > +
> > +     mhdp->curr_conn =3D connector;
> > +
> > +     conn_state =3D drm_atomic_get_new_connector_state(state,
> connector);
> > +     if (WARN_ON(!conn_state))
> > +             return;
> > +
> > +     crtc_state =3D drm_atomic_get_new_crtc_state(state,
> conn_state->crtc);
> > +     if (WARN_ON(!crtc_state))
> > +             return;
> > +
> > +     mode =3D &crtc_state->adjusted_mode;
> > +     dev_dbg(mhdp->dev, "Mode: %dx%dp%d\n",
> > +             mode->hdisplay, mode->vdisplay, mode->clock);
> > +     memcpy(&mhdp->mode, mode, sizeof(struct drm_display_mode));
> > +
> > +     cdns_hdmi_mode_set(mhdp);
> > +}
> > +
> > +const struct drm_bridge_funcs cdns_hdmi_bridge_funcs =3D {
> > +     .attach =3D cdns_hdmi_bridge_attach,
> > +     .detect =3D cdns_hdmi_bridge_detect,
> > +     .get_edid =3D cdns_hdmi_bridge_get_edid,
> > +     .mode_valid =3D cdns_hdmi_bridge_mode_valid,
> > +     .mode_fixup =3D cdns_hdmi_bridge_mode_fixup,
> > +     .atomic_enable =3D cdns_hdmi_bridge_atomic_enable,
> > +     .atomic_disable =3D cdns_hdmi_bridge_atomic_disable,
> > +     .atomic_duplicate_state =3D
> drm_atomic_helper_bridge_duplicate_state,
> > +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +     .atomic_reset =3D drm_atomic_helper_bridge_reset, };
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-/
> group.com%2F&data=3D05%7C02%7CSandor.yu%40nxp.com%7Cb23e376f27494
> 9cdb46c08dc17413d46%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C638410816178929125%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
> C%7C&sdata=3DtYc81WajNJAOmUvSD06cto0i%2FhVe%2BuLFxIeYm0uyMDM%3
> D&reserved=3D0
>

