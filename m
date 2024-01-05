Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD8D824D5D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 04:20:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F383210E173;
	Fri,  5 Jan 2024 03:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2087.outbound.protection.outlook.com [40.107.8.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF7610E55F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 03:20:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ep1Hypwpruhm3uw7f5aNkP39Ds2XkYqt5tidXBcXNFTAYchgc/sU5lIpnUKqQYZMU7WXeprJ50SK3rmUL5cuD6UMffqMycwJkV8rdon3Bmf9b9t43G8QsglVaXQMiEut+owQAwLdd1l6QZ41qy9SF5S/+QQAuF2oc27jnr5F/izo67ruYgSHwl03dOdpJs488fp7U2uZAA/64Go0T1+okS61uxPgY6j64B2AvJ0lARx0h7Nnp3/T6ozLk9Mu6ZeIpow/gw3eqyGYkkF6gvfF5K42SPyCd1nVYIM1pCtdmgWFwJDIJwX1NxwIMQIdPhO20SztNxLJZRjtJphXWY075g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALnky16Bwck3cEtwOBdujEj4DzfYQRQNDpXWOLuBmkY=;
 b=cTBcn6DZN7uYpnsbUJ4GuDX/3uyS6DYxBfdoL4lMwMrGdSvlc6+7Mr24nrzaQ+6hNcW+nJUahc0xYZyseLTN1onfVMaqCYj9o6MUj7Yz40WScKJQ0coTp65frQj/HdSPAVp+4+lECrUXGXdP7o/DskaZn4jJV8JwXKeh/dxbSwjgId/JAcfF+Z3mBmYRVHQcP+gonMX8Y6nOyWfnsMpNMC6NfwQ2lRl51ream08pn9hMkJX6KG1VNsl82tlY+AoG5knJ8bMh7+tcGNlo6tTKOqL08PlWrIXLrpymXbW9P+AclVw/p21SRwcAn08/zRGgJ9XDs7roNQnrCnEiQqJeZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALnky16Bwck3cEtwOBdujEj4DzfYQRQNDpXWOLuBmkY=;
 b=O/1JnOar1dP2VE33Dyqw26s7o9Yz9pUAJSnulq7ftD8oeDp1K0M0xFIQvjDNB/e5UFawrRY907JwUU0pgpRPxzQ3OvzKnfRdqWnk8qG28f/Tl3WZAQ5cHR9QbodPep9ksozDlyfHyNIHbFbwrTZRYC8OIPp+Zx/OxLKbFUtSR/Y=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB8445.eurprd04.prod.outlook.com (2603:10a6:10:2cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 03:20:25 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::e6e0:d026:3089:17d5%5]) with mapi id 15.20.7159.013; Fri, 5 Jan 2024
 03:20:25 +0000
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
Subject: RE: [EXT] Re: [PATCH v11 4/7] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Topic: [EXT] Re: [PATCH v11 4/7] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Index: AQHaAMdJUk9cD8MfYECN0AnPeJDlHbBN6/wAgARXcIA=
Date: Fri, 5 Jan 2024 03:20:24 +0000
Message-ID: <PAXPR04MB944894031725D7DA351E23AFF4662@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1697524277.git.Sandor.yu@nxp.com>
 <8fecdc0e3655c00269089186cbe451c402920fc0.1697524277.git.Sandor.yu@nxp.com>
 <3064881.CbtlEUcBR6@steina-w>
In-Reply-To: <3064881.CbtlEUcBR6@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DB9PR04MB8445:EE_
x-ms-office365-filtering-correlation-id: af4d0f2b-d21f-47c1-803c-08dc0d9d421e
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6NA/bpJ96y1USOTvCmKGXCaGgZySc0GiX5AsfBFBbX+ITPS6lBCoZ9a9be/a44RJ2NS4cIp/DTooRG4He0prmjvRI+zsN6U1OBPBGoMCB6vd5yRbQwXhuKYrgRbNruresVtGN+Rr5w4TiB4czXzqqk+vGzPjYbxmYIe/2D3ffI1pSmpsVbBOhymrXfYKBItuWYgPDRsuaQMKFkSYiAOw80pFIQ/4AMZ5icpXtKFYxUF3wCvevQ6oixJEn23Hlx4SX8fcfLqqppl/gQz2vdZeyjfv1OWx/DSCWg+fv/RIoKamr9q8QqFMTsjIN9X26ncic+m7nXrNepl0grLanfx7PfAXetqytSj5O1Cb7ZZObPHJWKk0Xmdm5G3E3yu4JVgrrvYm1ivRtvLcrlOpVeCBstdAuugItQo9myRJ3pKiiBsHfobHA4g2vaV+Qg4i7PSoWRYjqOOL5jZ33Z2Qoy6HlNorlbgq5CUurlVUDf/g0p5oUJNYkVRQ6LZ/GRzASfTrR7nZxWWa0Ivx6Hv8xcQtpGOY2M9CIpy23USEt63OXHONmKQ2U1am3hP4gT51N8UQQNmwSG1KhTUo+zsn/MLAKMW1+RmNI1NGlO3Mj0qIOpyUCKdXtcGyA3XF2rgcjolRLsQHwdC22AG1hDqu0QeHuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(26005)(7696005)(45080400002)(71200400001)(6506007)(9686003)(86362001)(55016003)(66574015)(83380400001)(8676002)(4326008)(52536014)(8936002)(316002)(54906003)(7416002)(30864003)(2906002)(5660300002)(44832011)(110136005)(33656002)(966005)(478600001)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(122000001)(38100700002)(41300700001)(921011)(38070700009)(559001)(579004)(309714004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?a3LUr2KiDOmj3DH/hTBWA88TIkWuYbX28lriTZqRvTJFJ9/7pZrh/DegzP?=
 =?iso-8859-1?Q?sMRB+cY/lD37VESMciTC2JmCCwPEjgyjAXYdrJ9tOrhzdfQ2utVl7qO16H?=
 =?iso-8859-1?Q?72avrXB+cjr13wsRqvtRpH3/D7l/e4Z5jo0pvf4UpJ1pUbzCunBagJI8+/?=
 =?iso-8859-1?Q?CDmELHWv/R19Q8ETXUwP/q323ZDB83SlZL/bVhyrbaTPzuRjk5+MiI0Rin?=
 =?iso-8859-1?Q?hEDO/z76Zi2TFmUV7wsDcT6bXV5jHjw1Gn3olgEMDeFy8Ynf+jwhxPoZJT?=
 =?iso-8859-1?Q?G0Yi/wKsEnX4LBBeEIpWaThDxYJVfTxPHMXGWzJmCc9A2yxOm7mWv0REcW?=
 =?iso-8859-1?Q?ZUAy4ZI6SCcvAMeZnmuTCkk7ZGqe+OU2pRyyTLtTXDMWF8/8oEuZ3OaQsp?=
 =?iso-8859-1?Q?rxkctJHJWL6eiArBhkwasHYlVH2n6OXq3zYjSw3yYOtuDVv/EUdhEiORVZ?=
 =?iso-8859-1?Q?fUzRk2hRCfWyiLpAfMF0g4FcpplkQZwNUyaih+6ydhDRsaPxeaBHzMg5hc?=
 =?iso-8859-1?Q?Cq5MxyJMi2UldYC6Wlkr/kWYLCFjpzyBVm7ZP4YKKfgRhDhCJ9XT3+LP48?=
 =?iso-8859-1?Q?xVQWFsmpO64OIK9kyOyHiGasP58ta0zDy81wQZFYWl+PMuvXvWexpE/tHf?=
 =?iso-8859-1?Q?d+M9fnww55zzFYWLMFA4laatuUp4z4moJm1NJ1XBMNjm79yBdbjLpR/s6A?=
 =?iso-8859-1?Q?ofIjMyFzUvQozWGLXCxCug8Q82dtbqfnLjheTI/KMsXRAYfBu4qSLs/T2H?=
 =?iso-8859-1?Q?2FDOgnNKJ949xw3wlZ8QSU8ElmSUFYUeEYoznXScU0Q5f4fGdAWkmNRHws?=
 =?iso-8859-1?Q?Z+1D3KtBuspW3mmj6RQU8yU5jvI/bfIAWh7jBV2rgLsdMr2erToyBMf/aq?=
 =?iso-8859-1?Q?8BNwwWULoljjs5NcZEX6Wa35NvZISB839o0VGLKq9vIZCiJaogtRPZ2V3o?=
 =?iso-8859-1?Q?uTMvLhXFR3MHqgavCC+mALuekI25HHFa5strLoUDWanoDlkHK9aTBa4Pab?=
 =?iso-8859-1?Q?p/Nbg04KJZQhtIkjhadR3Qs6QCijTWjdk7QCQO9lz5ceYIXfiNrh488YGU?=
 =?iso-8859-1?Q?tIHoxbIRj00EU97LMzJ8i4znTW1AZ+VI2UOAOGQ+VyH4cVLl/e1Pj7VqHw?=
 =?iso-8859-1?Q?Xh2DLqBuAIDmaU+ZBLymjGbx5iVIyO3cmGKLESAnGMrqsqbnQO8VZ9/JLM?=
 =?iso-8859-1?Q?Yss2uwWEzrknfivY32e5/W/aByQrthMOy6stYOumc285s5RcJ3g/wAxxty?=
 =?iso-8859-1?Q?cb02OSd9hBjQsZsPfBIVvnm+NvrK5KEXSTcVPAUMxvhd8nlqiikNXf1kl7?=
 =?iso-8859-1?Q?yuaoURBuEN6fzXJ4gb9XPqJ7DAvZclOOI7DaA3RSV1V/5kww8ZmiQXqC4F?=
 =?iso-8859-1?Q?0QRftOrRTJDLVeJ9toOlJMkH9aDPeSHEv4eyFszYFXeR+uDrmdJzr7Hwph?=
 =?iso-8859-1?Q?r3Y2Nafbmjkc6GGgnsgC0C6fwFpGOwI3n+5FKDP9rJcoA0kS/l6oMmv1bO?=
 =?iso-8859-1?Q?oIHaKyQrubKEDYI6+qI1lFHOO8E8X9y2+V/W+b/IjCRCTO09lMELfA7yCc?=
 =?iso-8859-1?Q?UulAiiCvhIGJ/6iQ6aeDxg2wc8kzjyeFBiekN0Ub1bIVMeTjgRoVa2VGSH?=
 =?iso-8859-1?Q?HL/fgueAWofqk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4d0f2b-d21f-47c1-803c-08dc0d9d421e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 03:20:24.9472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hdJCuOD5JrNuGBfocw/Ry8zZrnGyOVELmiOVrmJlIYUsZXAT+zLQq3k5U/73fZ1Xe+R6Gxov7ZSVEpXi+r3Rlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8445
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
> thanks for the patch.
>
> Am Dienstag, 17. Oktober 2023, 09:04:00 CEST schrieb Sandor Yu:
> > Add a new DRM DisplayPort and HDMI bridge driver for Candence
> MHDP8501
> > used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
> > standards according embedded Firmware running in the uCPU.
> >
> > For iMX8MQ SOC, the DisplayPort/HDMI FW was loaded and activated by
> > SOC's ROM code. Bootload binary included respective specific firmware
> > is required.
> >
> > Driver will check display connector type and
> > then load the corresponding driver.
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > v10->v11:
> > - remove MODULE_ALIAS() from mhdp8501 driver.
> >
> > v9->v10:
> >  - struct cdns_mhdp_device is renamed to cdns_mhdp8501_device.
> >  - update for mhdp helper driver is introduced.
> > Remove head file cdns-mhdp-mailbox.h and add cdns-mhdp-helper.h
> > Add struct cdns_mhdp_base base to struct cdns_mhdp8501_device.
> > Init struct cdns_mhdp_base base when driver probe.
> >
> >  drivers/gpu/drm/bridge/cadence/Kconfig        |  16 +
> >  drivers/gpu/drm/bridge/cadence/Makefile       |   2 +
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 315 ++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 365 +++++++++
> >  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 708
> ++++++++++++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 673
> +++++++++++++++++
> >  6 files changed, 2079 insertions(+)
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> >
> > diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig
> > b/drivers/gpu/drm/bridge/cadence/Kconfig index
> 0b7b4626a7af0..81685ab4e874a
> > 100644
> > --- a/drivers/gpu/drm/bridge/cadence/Kconfig
> > +++ b/drivers/gpu/drm/bridge/cadence/Kconfig
> > @@ -50,3 +50,19 @@ config DRM_CDNS_MHDP8546_J721E
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
> >  cdns-mhdp8546-y :=3D cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
> >  cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) +=3D
> cdns-mhdp8546-j721e.o
> > +obj-$(CONFIG_DRM_CDNS_MHDP8501) +=3D cdns-mhdp8501.o
> > +cdns-mhdp8501-y :=3D cdns-mhdp8501-core.o cdns-mhdp8501-dp.o
> > cdns-mhdp8501-hdmi.o diff --git
> > a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c new file mode
> 100644
> > index 0000000000000..23860a260e637
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> > @@ -0,0 +1,315 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Cadence Display Port Interface (DP) driver
> > + *
> > + * Copyright (C) 2023 NXP Semiconductor, Inc.
> > + *
> > + */
> > +#include <drm/drm_of.h>
> > +#include <drm/drm_print.h>
> > +#include <linux/clk.h>
> > +#include <linux/irq.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_device.h>
> > +#include <linux/phy/phy.h>
> > +
> > +#include "cdns-mhdp8501-core.h"
> > +
> > +static int cdns_mhdp8501_read_hpd(struct cdns_mhdp8501_device
> *mhdp)
> > +{
> > +     u8 status;
> > +     int ret;
> > +
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_GENERAL,
> > +                                  GENERAL_GET_HPD_STATE, 0,
> NULL);
> > +     if (ret)
> > +             goto err_get_hpd;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> MB_MODULE_ID_GENERAL,
> > +
> GENERAL_GET_HPD_STATE,
> > +                                         sizeof(status));
> > +     if (ret)
> > +             goto err_get_hpd;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, &status,
> sizeof(status));
> > +     if (ret)
> > +             goto err_get_hpd;
> > +
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +
> > +     return status;
> > +
> > +err_get_hpd:
> > +     DRM_ERROR("read hpd  failed: %d\n", ret);
>
> Use dev_err() instead, there is a device pointer available.

OK.

>
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +
> > +     return ret;
> > +}
> > +
> > +enum drm_connector_status cdns_mhdp8501_detect(struct
> cdns_mhdp8501_device
> > *mhdp) +{
> > +     u8 hpd =3D 0xf;
> > +
> > +     hpd =3D cdns_mhdp8501_read_hpd(mhdp);
> > +     if (hpd =3D=3D 1)
> > +             return connector_status_connected;
> > +     else if (hpd =3D=3D 0)
> > +             return connector_status_disconnected;
> > +
> > +     DRM_INFO("Unknown cable status, hdp=3D%u\n", hpd);
>
> I suppose this is a somewhat unexpected return value. Shouldn't this be
> DRM_WARN instead to indicate something went wrong?
> Despite that dev_warn (or dev_info) should be used.

OK, will use dev_warn.

>
> > +     return connector_status_unknown;
> > +}
> > +
> > +static void hotplug_work_func(struct work_struct *work)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D container_of(work,
> > +                                                  struct
> cdns_mhdp8501_device,
> > +
> hotplug_work.work);
> > +     enum drm_connector_status status =3D
> cdns_mhdp8501_detect(mhdp);
> > +
> > +     drm_bridge_hpd_notify(&mhdp->bridge, status);
> > +
> > +     if (status =3D=3D connector_status_connected) {
> > +             /* Cable connedted  */
>
> Small typo: Cable connected

OK, thanks.

>
> > +             DRM_INFO("HDMI/DP Cable Plug In\n");
>
> drm_info()
>
> > +             enable_irq(mhdp->irq[IRQ_OUT]);
> > +     } else if (status =3D=3D connector_status_disconnected) {
> > +             /* Cable Disconnedted  */
>
> Small typo: Cable Disconnected

OK.

>
> > +             DRM_INFO("HDMI/DP Cable Plug Out\n");
>
> drm_info()
>
> > +             enable_irq(mhdp->irq[IRQ_IN]);
> > +     }
> > +}
> > +
> > +static irqreturn_t cdns_mhdp8501_irq_thread(int irq, void *data)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D data;
> > +
> > +     disable_irq_nosync(irq);
>
> Is it really necessary to enable/disable the IRQ_IN and IRQ_OUT interrupt=
s
> upon each IRQ event?

There are no mask and status registers for IRQ_IN and IRQ_OUT, so they shou=
ld not enable at the same time.
We has to disable one IRQ here and enable another in hotplug_work_func().

> The actual status is returned by the firmware using
> cdns_mhdp8501_read_hpd()
> anyway. There is a small window between the IRQ happening here and
> enabling
> the other one in hotplug_work_func() where an IRQ event is lost.

Yes, IRQ event will lost in the small window,
but the HPD status is not missing,
HDMI/DP firmware will keep updating latest HPD status in the windows,
then driver will get the correct status from FW by function cdns_mhdp8501_r=
ead_hpd() before enable IRQ.

> IMHO both IRQs should be enabled at all time and let
> cdns_mhdp8501_read_hpd()
> return whether the connector is connected or disconnected.
>

> > +
> > +     mod_delayed_work(system_wq, &mhdp->hotplug_work,
> > +                      msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static int cdns_mhdp8501_dt_parse(struct cdns_mhdp8501_device
> *mhdp,
> > +                               struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct device_node *np =3D dev->of_node;
> > +     struct device_node *remote;
> > +
> > +     remote =3D of_graph_get_remote_node(np, 1, 0);
> > +     if (!remote) {
> > +             dev_err(dev, "fail to get remote node\n");
> > +             of_node_put(remote);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* get connector type */
> > +     if (of_device_is_compatible(remote, "hdmi-connector")) {
> > +             mhdp->connector_type =3D
> DRM_MODE_CONNECTOR_HDMIA;
> > +
> > +     } else if (of_device_is_compatible(remote, "dp-connector")) {
> > +             mhdp->connector_type =3D
> DRM_MODE_CONNECTOR_DisplayPort;
> > +
> > +     } else {
> > +             dev_err(dev, "Unknown connector type\n");
> > +             of_node_put(remote);
> > +             return -EINVAL;
> > +     }
> > +
> > +     of_node_put(remote);
> > +     return true;
> > +}
> > +
> > +static void cdns_mhdp8501_add_bridge(struct cdns_mhdp8501_device
> *mhdp)
> > +{
> > +     if (mhdp->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
> > +             mhdp->bridge.funcs =3D &cdns_hdmi_bridge_funcs;
> > +     } else if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort) {
> > +             mhdp->bridge.funcs =3D &cdns_dp_bridge_funcs;
> > +     } else {
> > +             dev_err(mhdp->dev, "Unsupported connector type!\n");
> > +             return;
> > +     }
> > +
> > +     mhdp->bridge.type =3D mhdp->connector_type;
> > +     mhdp->bridge.driver_private =3D mhdp;
> > +     mhdp->bridge.of_node =3D mhdp->dev->of_node;
> > +     mhdp->bridge.ops =3D DRM_BRIDGE_OP_DETECT |
> DRM_BRIDGE_OP_EDID |
> > +                        DRM_BRIDGE_OP_HPD;
> > +     drm_bridge_add(&mhdp->bridge);
> > +}
> > +
> > +static int cdns_mhdp8501_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct cdns_mhdp8501_device *mhdp;
> > +     struct resource *res;
> > +     u32 reg;
> > +     int ret;
> > +
> > +     mhdp =3D devm_kzalloc(dev, sizeof(*mhdp), GFP_KERNEL);
> > +     if (!mhdp)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&mhdp->mbox_mutex);
> > +     mhdp->dev =3D dev;
> > +
> > +     INIT_DELAYED_WORK(&mhdp->hotplug_work, hotplug_work_func);
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     if (!res)
> > +             return -ENODEV;
> > +
> > +     mhdp->regs =3D devm_ioremap(dev, res->start, resource_size(res));
> > +     if (IS_ERR(mhdp->regs))
> > +             return PTR_ERR(mhdp->regs);
>
> You can use devm_platform_ioremap_resource instead, no?

No, this base address should be share with PHY drivers.

>
> > +
> > +     ret =3D cdns_mhdp8501_dt_parse(mhdp, pdev);
> > +     if (ret < 0)
> > +             return -EINVAL;
> > +
> > +     mhdp->phy =3D devm_of_phy_get_by_index(dev, pdev->dev.of_node,
> 0);
> > +     if (IS_ERR(mhdp->phy))
> > +             return dev_err_probe(dev, PTR_ERR(mhdp->phy), "no PHY
> configured\n");
> > +
> > +     mhdp->irq[IRQ_IN] =3D platform_get_irq_byname(pdev, "plug_in");
> > +     if (mhdp->irq[IRQ_IN] < 0)
> > +             return dev_err_probe(dev, mhdp->irq[IRQ_IN], "No
> plug_in
> irq number\n");
> > +
> > +     mhdp->irq[IRQ_OUT] =3D platform_get_irq_byname(pdev,
> "plug_out");
> > +     if (mhdp->irq[IRQ_OUT] < 0)
> > +             return dev_err_probe(dev, mhdp->irq[IRQ_OUT], "No
> plug_out
> irq
> > number\n"); +
> > +     irq_set_status_flags(mhdp->irq[IRQ_IN], IRQ_NOAUTOEN);
>
> As mentioned above both interrupts should be enabled at all the time.

Same reason as above.

>
> > +     ret =3D devm_request_threaded_irq(dev, mhdp->irq[IRQ_IN],
> > +                                     NULL,
> cdns_mhdp8501_irq_thread,
> > +                                     IRQF_ONESHOT,
> dev_name(dev),
> mhdp);
> > +     if (ret < 0) {
> > +             dev_err(dev, "can't claim irq %d\n", mhdp->irq[IRQ_IN]);
> > +             return -EINVAL;
> > +     }
> > +
> > +     irq_set_status_flags(mhdp->irq[IRQ_OUT], IRQ_NOAUTOEN);
>
> See above.

Same reason as above.

>
> > +     ret =3D devm_request_threaded_irq(dev, mhdp->irq[IRQ_OUT],
> > +                                     NULL,
> cdns_mhdp8501_irq_thread,
> > +                                     IRQF_ONESHOT,
> dev_name(dev),
> mhdp);
> > +     if (ret < 0) {
> > +             dev_err(dev, "can't claim irq %d\n",
> mhdp->irq[IRQ_OUT]);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* set default lane mapping */
> > +     mhdp->lane_mapping =3D LANE_MAPPING_NORMAL;
> > +
> > +     mhdp->plat_data =3D of_device_get_match_data(dev);
> > +     if (mhdp->plat_data) {
> > +             if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort)
> > +                     mhdp->lane_mapping =3D mhdp->plat_data-
> >dp_lane_mapping;
> > +             else if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_HDMIA)
> > +                     mhdp->lane_mapping =3D mhdp->plat_data-
> >hdmi_lane_mapping;
> > +     }
> > +
> > +     dev_set_drvdata(dev, mhdp);
> > +
> > +     /* init base struct for access mhdp mailbox */
> > +     mhdp->base.dev =3D mhdp->dev;
> > +     mhdp->base.regs =3D mhdp->regs;
> > +     mhdp->base.mbox_mutex =3D &mhdp->mbox_mutex;
> > +
> > +     if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort) {
> > +             drm_dp_aux_init(&mhdp->dp.aux);
> > +             mhdp->dp.aux.name =3D "mhdp8501_dp_aux";
> > +             mhdp->dp.aux.dev =3D dev;
> > +             mhdp->dp.aux.transfer =3D cdns_dp_aux_transfer;
> > +     }
> > +
> > +     /* Enable APB clock */
> > +     mhdp->apb_clk =3D devm_clk_get(dev, NULL);
> > +     if (IS_ERR(mhdp->apb_clk))
> > +             return dev_err_probe(dev, PTR_ERR(mhdp->apb_clk),
> > +                                  "couldn't get apb clk\n");
> > +
> > +     clk_prepare_enable(mhdp->apb_clk);
> > +
> > +     /*
> > +      * Wait for the KEEP_ALIVE "message" on the first 8 bits.
> > +      * Updated each sched "tick" (~2ms)
> > +      */
> > +     ret =3D readl_poll_timeout(mhdp->regs + KEEP_ALIVE, reg,
> > +                              reg & CDNS_KEEP_ALIVE_MASK,
> 500,
> > +                              CDNS_KEEP_ALIVE_TIMEOUT);
> > +     if (ret) {
> > +             dev_err(dev, "device didn't give any life sign: reg %d\n"=
,
> reg);
> > +             goto clk_disable;
> > +     }
> > +
> > +     /* Mailbox protect for HDMI PHY access */
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +     ret =3D phy_init(mhdp->phy);
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to initialize PHY: %d\n", ret);
> > +             goto clk_disable;
> > +     }
> > +
> > +     /* Enable cable hotplug detect */
> > +     if (cdns_mhdp8501_read_hpd(mhdp))
> > +             enable_irq(mhdp->irq[IRQ_OUT]);
> > +     else
> > +             enable_irq(mhdp->irq[IRQ_IN]);
> > +
> > +     cdns_mhdp8501_add_bridge(mhdp);
> > +
> > +     return 0;
> > +
> > +clk_disable:
> > +     clk_disable_unprepare(mhdp->apb_clk);
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int cdns_mhdp8501_remove(struct platform_device *pdev)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D
> platform_get_drvdata(pdev);
> > +
> > +     if (mhdp->connector_type =3D=3D
> DRM_MODE_CONNECTOR_DisplayPort)
> > +             cdns_dp_aux_destroy(mhdp);
> > +
> > +     drm_bridge_remove(&mhdp->bridge);
> > +     clk_disable_unprepare(mhdp->apb_clk);
> > +
> > +     return 0;
> > +}
> > +
> > +static struct mhdp8501_plat_data imx8mq_mhdp_drv_data =3D {
> > +     .hdmi_lane_mapping =3D LANE_MAPPING_FLIPPED,
> > +     .dp_lane_mapping =3D LANE_MAPPING_IMX8MQ_DP,
> > +};
> > +
> > +static const struct of_device_id cdns_mhdp8501_dt_ids[] =3D {
> > +     { .compatible =3D "fsl,imx8mq-mhdp8501",
> > +       .data =3D &imx8mq_mhdp_drv_data
> > +     },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(of, cdns_mhdp8501_dt_ids);
> > +
> > +static struct platform_driver cdns_mhdp8501_driver =3D {
> > +     .probe =3D cdns_mhdp8501_probe,
> > +     .remove =3D cdns_mhdp8501_remove,
> > +     .driver =3D {
> > +             .name =3D "cdns-mhdp8501",
> > +             .of_match_table =3D cdns_mhdp8501_dt_ids,
> > +     },
> > +};
> > +
> > +module_platform_driver(cdns_mhdp8501_driver);
> > +
> > +MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
> > +MODULE_DESCRIPTION("Cadence MHDP8501 bridge driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h new file mode
> 100644
> > index 0000000000000..97170be57ffcb
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> > @@ -0,0 +1,365 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Cadence MHDP 8501 Common head file
> > + *
> > + * Copyright (C) 2019-2023 NXP Semiconductor, Inc.
> > + *
> > + */
> > +
> > +#ifndef _CDNS_MHDP8501_CORE_H_
> > +#define _CDNS_MHDP8501_CORE_H_
> > +
> > +#include <drm/bridge/cdns-mhdp-helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_connector.h>
> > +#include <drm/display/drm_dp_helper.h>
> > +#include <linux/bitops.h>
> > +
> > +#define ADDR_IMEM                    0x10000
> > +#define ADDR_DMEM                    0x20000
> > +
> > +/* APB CFG addr */
> > +#define APB_CTRL                     0
> > +#define XT_INT_CTRL                  0x04
> > +#define MAILBOX_FULL_ADDR            0x08
> > +#define MAILBOX_EMPTY_ADDR           0x0c
> > +#define MAILBOX0_WR_DATA             0x10
> > +#define MAILBOX0_RD_DATA             0x14
> > +#define KEEP_ALIVE                   0x18
> > +#define VER_L                                0x1c
> > +#define VER_H                                0x20
> > +#define VER_LIB_L_ADDR                       0x24
> > +#define VER_LIB_H_ADDR                       0x28
> > +#define SW_DEBUG_L                   0x2c
> > +#define SW_DEBUG_H                   0x30
> > +#define MAILBOX_INT_MASK             0x34
> > +#define MAILBOX_INT_STATUS           0x38
> > +#define SW_CLK_L                     0x3c
> > +#define SW_CLK_H                     0x40
> > +#define SW_EVENTS0                   0x44
> > +#define SW_EVENTS1                   0x48
> > +#define SW_EVENTS2                   0x4c
> > +#define SW_EVENTS3                   0x50
> > +#define XT_OCD_CTRL                  0x60
> > +#define APB_INT_MASK                 0x6c
> > +#define APB_STATUS_MASK                      0x70
> > +
> > +/* Source phy comp */
> > +#define PHY_DATA_SEL                 0x0818
> > +#define LANES_CONFIG                 0x0814
> > +
> > +/* Source CAR Addr */
> > +#define SOURCE_HDTX_CAR                      0x0900
> > +#define SOURCE_DPTX_CAR                      0x0904
> > +#define SOURCE_PHY_CAR                       0x0908
> > +#define SOURCE_CEC_CAR                       0x090c
> > +#define SOURCE_CBUS_CAR                      0x0910
> > +#define SOURCE_PKT_CAR                       0x0918
> > +#define SOURCE_AIF_CAR                       0x091c
> > +#define SOURCE_CIPHER_CAR            0x0920
> > +#define SOURCE_CRYPTO_CAR            0x0924
> > +
> > +/* clock meters addr */
> > +#define CM_CTRL                              0x0a00
> > +#define CM_I2S_CTRL                  0x0a04
> > +#define CM_SPDIF_CTRL                        0x0a08
> > +#define CM_VID_CTRL                  0x0a0c
> > +#define CM_LANE_CTRL                 0x0a10
> > +#define I2S_NM_STABLE                        0x0a14
> > +#define I2S_NCTS_STABLE                      0x0a18
> > +#define SPDIF_NM_STABLE                      0x0a1c
> > +#define SPDIF_NCTS_STABLE            0x0a20
> > +#define NMVID_MEAS_STABLE            0x0a24
> > +#define I2S_MEAS                     0x0a40
> > +#define SPDIF_MEAS                   0x0a80
> > +#define NMVID_MEAS                   0x0ac0
> > +
> > +/* source vif addr */
> > +#define BND_HSYNC2VSYNC                      0x0b00
> > +#define HSYNC2VSYNC_F1_L1            0x0b04
> > +#define HSYNC2VSYNC_STATUS           0x0b0c
> > +#define HSYNC2VSYNC_POL_CTRL         0x0b10
> > +
> > +/* MHDP TX_top_comp */
> > +#define SCHEDULER_H_SIZE             0x1000
> > +#define SCHEDULER_V_SIZE             0x1004
> > +#define HDTX_SIGNAL_FRONT_WIDTH              0x100c
> > +#define HDTX_SIGNAL_SYNC_WIDTH               0x1010
> > +#define HDTX_SIGNAL_BACK_WIDTH               0x1014
> > +#define HDTX_CONTROLLER                      0x1018
> > +#define HDTX_HPD                     0x1020
> > +#define HDTX_CLOCK_REG_0             0x1024
> > +#define HDTX_CLOCK_REG_1             0x1028
> > +
> > +/* DPTX hpd addr */
> > +#define HPD_IRQ_DET_MIN_TIMER                0x2100
> > +#define HPD_IRQ_DET_MAX_TIMER                0x2104
> > +#define HPD_UNPLGED_DET_MIN_TIMER    0x2108
> > +#define HPD_STABLE_TIMER             0x210c
> > +#define HPD_FILTER_TIMER             0x2110
> > +#define HPD_EVENT_MASK                       0x211c
> > +#define HPD_EVENT_DET                        0x2120
> > +
> > +/* DPTX framer addr */
> > +#define DP_FRAMER_GLOBAL_CONFIG              0x2200
> > +#define DP_SW_RESET                  0x2204
> > +#define DP_FRAMER_TU                 0x2208
> > +#define DP_FRAMER_PXL_REPR           0x220c
> > +#define DP_FRAMER_SP                 0x2210
> > +#define AUDIO_PACK_CONTROL           0x2214
> > +#define DP_VC_TABLE(x)                       (0x2218 + ((x) << 2))
> > +#define DP_VB_ID                     0x2258
> > +#define DP_MTPH_LVP_CONTROL          0x225c
> > +#define DP_MTPH_SYMBOL_VALUES                0x2260
> > +#define DP_MTPH_ECF_CONTROL          0x2264
> > +#define DP_MTPH_ACT_CONTROL          0x2268
> > +#define DP_MTPH_STATUS                       0x226c
> > +#define DP_INTERRUPT_SOURCE          0x2270
> > +#define DP_INTERRUPT_MASK            0x2274
> > +#define DP_FRONT_BACK_PORCH          0x2278
> > +#define DP_BYTE_COUNT                        0x227c
> > +
> > +/* DPTX stream addr */
> > +#define MSA_HORIZONTAL_0             0x2280
> > +#define MSA_HORIZONTAL_1             0x2284
> > +#define MSA_VERTICAL_0                       0x2288
> > +#define MSA_VERTICAL_1                       0x228c
> > +#define MSA_MISC                     0x2290
> > +#define STREAM_CONFIG                        0x2294
> > +#define AUDIO_PACK_STATUS            0x2298
> > +#define VIF_STATUS                   0x229c
> > +#define PCK_STUFF_STATUS_0           0x22a0
> > +#define PCK_STUFF_STATUS_1           0x22a4
> > +#define INFO_PACK_STATUS             0x22a8
> > +#define RATE_GOVERNOR_STATUS         0x22ac
> > +#define DP_HORIZONTAL                        0x22b0
> > +#define DP_VERTICAL_0                        0x22b4
> > +#define DP_VERTICAL_1                        0x22b8
> > +#define DP_BLOCK_SDP                 0x22bc
> > +
> > +/* DPTX glbl addr */
> > +#define DPTX_LANE_EN                 0x2300
> > +#define DPTX_ENHNCD                  0x2304
> > +#define DPTX_INT_MASK                        0x2308
> > +#define DPTX_INT_STATUS                      0x230c
> > +
> > +/* DP AUX Addr */
> > +#define DP_AUX_HOST_CONTROL          0x2800
> > +#define DP_AUX_INTERRUPT_SOURCE              0x2804
> > +#define DP_AUX_INTERRUPT_MASK                0x2808
> > +#define DP_AUX_SWAP_INVERSION_CONTROL        0x280c
> > +#define DP_AUX_SEND_NACK_TRANSACTION 0x2810
> > +#define DP_AUX_CLEAR_RX                      0x2814
> > +#define DP_AUX_CLEAR_TX                      0x2818
> > +#define DP_AUX_TIMER_STOP            0x281c
> > +#define DP_AUX_TIMER_CLEAR           0x2820
> > +#define DP_AUX_RESET_SW                      0x2824
> > +#define DP_AUX_DIVIDE_2M             0x2828
> > +#define DP_AUX_TX_PREACHARGE_LENGTH  0x282c
> > +#define DP_AUX_FREQUENCY_1M_MAX              0x2830
> > +#define DP_AUX_FREQUENCY_1M_MIN              0x2834
> > +#define DP_AUX_RX_PRE_MIN            0x2838
> > +#define DP_AUX_RX_PRE_MAX            0x283c
> > +#define DP_AUX_TIMER_PRESET          0x2840
> > +#define DP_AUX_NACK_FORMAT           0x2844
> > +#define DP_AUX_TX_DATA                       0x2848
> > +#define DP_AUX_RX_DATA                       0x284c
> > +#define DP_AUX_TX_STATUS             0x2850
> > +#define DP_AUX_RX_STATUS             0x2854
> > +#define DP_AUX_RX_CYCLE_COUNTER              0x2858
> > +#define DP_AUX_MAIN_STATES           0x285c
> > +#define DP_AUX_MAIN_TIMER            0x2860
> > +#define DP_AUX_AFE_OUT                       0x2864
> > +
> > +/* source pif addr */
> > +#define SOURCE_PIF_WR_ADDR           0x30800
> > +#define SOURCE_PIF_WR_REQ            0x30804
> > +#define SOURCE_PIF_RD_ADDR           0x30808
> > +#define SOURCE_PIF_RD_REQ            0x3080c
> > +#define SOURCE_PIF_DATA_WR           0x30810
> > +#define SOURCE_PIF_DATA_RD           0x30814
> > +#define SOURCE_PIF_FIFO1_FLUSH               0x30818
> > +#define SOURCE_PIF_FIFO2_FLUSH               0x3081c
> > +#define SOURCE_PIF_STATUS            0x30820
> > +#define SOURCE_PIF_INTERRUPT_SOURCE  0x30824
> > +#define SOURCE_PIF_INTERRUPT_MASK    0x30828
> > +#define SOURCE_PIF_PKT_ALLOC_REG     0x3082c
> > +#define SOURCE_PIF_PKT_ALLOC_WR_EN   0x30830
> > +#define SOURCE_PIF_SW_RESET          0x30834
> > +
> > +#define LINK_TRAINING_NOT_ACTIV              0
> > +#define LINK_TRAINING_RUN            1
> > +#define LINK_TRAINING_RESTART                2
> > +
> > +#define CONTROL_VIDEO_IDLE           0
> > +#define CONTROL_VIDEO_VALID          1
> > +
> > +#define INTERLACE_FMT_DET            BIT(12)
> > +#define VIF_BYPASS_INTERLACE         BIT(13)
> > +#define TU_CNT_RST_EN                        BIT(15)
> > +#define INTERLACE_DTCT_WIN           0x20
> > +
> > +#define DP_FRAMER_SP_INTERLACE_EN    BIT(2)
> > +#define DP_FRAMER_SP_HSP             BIT(1)
> > +#define DP_FRAMER_SP_VSP             BIT(0)
> > +
> > +/* Capability */
> > +#define AUX_HOST_INVERT                      3
> > +#define FAST_LT_SUPPORT                      1
> > +#define FAST_LT_NOT_SUPPORT          0
> > +#define LANE_MAPPING_NORMAL          0x1b
> > +#define LANE_MAPPING_FLIPPED         0xe4
> > +#define LANE_MAPPING_IMX8MQ_DP               0xc6
> > +#define ENHANCED                     1
> > +#define SCRAMBLER_EN                 BIT(4)
> > +
> > +#define FULL_LT_STARTED                      BIT(0)
> > +#define FASE_LT_STARTED                      BIT(1)
> > +#define CLK_RECOVERY_FINISHED                BIT(2)
> > +#define EQ_PHASE_FINISHED            BIT(3)
> > +#define FASE_LT_START_FINISHED               BIT(4)
> > +#define CLK_RECOVERY_FAILED          BIT(5)
> > +#define EQ_PHASE_FAILED                      BIT(6)
> > +#define FASE_LT_FAILED                       BIT(7)
> > +
> > +#define TU_SIZE                              30
> > +#define CDNS_DP_MAX_LINK_RATE                540000
> > +
> > +#define F_HDMI_ENCODING(x) (((x) & ((1 << 2) - 1)) << 16)
> > +#define F_VIF_DATA_WIDTH(x) (((x) & ((1 << 2) - 1)) << 2)
> > +#define F_HDMI_MODE(x) (((x) & ((1 << 2) - 1)) << 0)
> > +#define F_GCP_EN(x) (((x) & ((1 << 1) - 1)) << 12)
> > +#define F_DATA_EN(x) (((x) & ((1 << 1) - 1)) << 15)
> > +#define F_HDMI2_PREAMBLE_EN(x) (((x) & ((1 << 1) - 1)) << 18)
> > +#define F_PIC_3D(x) (((x) & ((1 << 4) - 1)) << 7)
> > +#define F_BCH_EN(x) (((x) & ((1 << 1) - 1)) << 11)
> > +#define F_SOURCE_PHY_MHDP_SEL(x) (((x) & ((1 << 2) - 1)) << 3)
> > +#define F_HPD_VALID_WIDTH(x) (((x) & ((1 << 12) - 1)) << 0)
> > +#define F_HPD_GLITCH_WIDTH(x) (((x) & ((1 << 8) - 1)) << 12)
> > +#define F_HDMI2_CTRL_IL_MODE(x) (((x) & ((1 << 1) - 1)) << 19)
> > +#define F_SOURCE_PHY_LANE0_SWAP(x) (((x) & ((1 << 2) - 1)) << 0)
> > +#define F_SOURCE_PHY_LANE1_SWAP(x) (((x) & ((1 << 2) - 1)) << 2)
> > +#define F_SOURCE_PHY_LANE2_SWAP(x) (((x) & ((1 << 2) - 1)) << 4)
> > +#define F_SOURCE_PHY_LANE3_SWAP(x) (((x) & ((1 << 2) - 1)) << 6)
> > +#define F_SOURCE_PHY_COMB_BYPASS(x) (((x) & ((1 << 1) - 1)) << 21)
> > +#define F_SOURCE_PHY_20_10(x) (((x) & ((1 << 1) - 1)) << 22)
> > +#define F_PKT_ALLOC_ADDRESS(x) (((x) & ((1 << 4) - 1)) << 0)
> > +#define F_ACTIVE_IDLE_TYPE(x) (((x) & ((1 << 1) - 1)) << 17)
> > +#define F_FIFO1_FLUSH(x) (((x) & ((1 << 1) - 1)) << 0)
> > +#define F_PKT_ALLOC_WR_EN(x) (((x) & ((1 << 1) - 1)) << 0)
> > +#define F_DATA_WR(x) (x)
> > +#define F_WR_ADDR(x) (((x) & ((1 << 4) - 1)) << 0)
> > +#define F_HOST_WR(x) (((x) & ((1 << 1) - 1)) << 0)
> > +#define F_TYPE_VALID(x) (((x) & ((1 << 1) - 1)) << 16)
> > +#define F_PACKET_TYPE(x) (((x) & ((1 << 8) - 1)) << 8)
> > +
> > +/* Reference cycles when using lane clock as reference */
> > +#define LANE_REF_CYC                 0x8000
> > +
> > +/* HPD Debounce */
> > +#define HOTPLUG_DEBOUNCE_MS          200
> > +
> > +/* HPD IRQ Index */
> > +#define IRQ_IN    0
> > +#define IRQ_OUT   1
> > +#define IRQ_NUM   2
> > +
> > +/* FW check alive timeout */
> > +#define CDNS_KEEP_ALIVE_TIMEOUT              2000
> > +#define CDNS_KEEP_ALIVE_MASK         GENMASK(7, 0)
> > +
> > +enum voltage_swing_level {
> > +     VOLTAGE_LEVEL_0,
> > +     VOLTAGE_LEVEL_1,
> > +     VOLTAGE_LEVEL_2,
> > +     VOLTAGE_LEVEL_3,
> > +};
> > +
> > +enum pre_emphasis_level {
> > +     PRE_EMPHASIS_LEVEL_0,
> > +     PRE_EMPHASIS_LEVEL_1,
> > +     PRE_EMPHASIS_LEVEL_2,
> > +     PRE_EMPHASIS_LEVEL_3,
> > +};
> > +
> > +enum pattern_set {
> > +     PTS1 =3D BIT(0),
> > +     PTS2 =3D BIT(1),
> > +     PTS3 =3D BIT(2),
> > +     PTS4 =3D BIT(3),
> > +     DP_NONE =3D BIT(4)
> > +};
> > +
> > +enum vic_color_depth {
> > +     BCS_6 =3D 0x1,
> > +     BCS_8 =3D 0x2,
> > +     BCS_10 =3D 0x4,
> > +     BCS_12 =3D 0x8,
> > +     BCS_16 =3D 0x10,
> > +};
> > +
> > +enum vic_bt_type {
> > +     BT_601 =3D 0x0,
> > +     BT_709 =3D 0x1,
> > +};
> > +
> > +enum {
> > +     MODE_DVI,
> > +     MODE_HDMI_1_4,
> > +     MODE_HDMI_2_0,
> > +};
> > +
> > +struct video_info {
> > +     int bpc;
> > +     int color_fmt;
> > +};
> > +
> > +struct mhdp8501_plat_data {
> > +     int hdmi_lane_mapping;
> > +     int dp_lane_mapping;
> > +};
> > +
> > +struct cdns_mhdp8501_device {
> > +     struct cdns_mhdp_base base;
> > +
> > +     struct device *dev;
> > +     void __iomem *regs;
> > +     struct drm_connector *curr_conn;
> > +     struct drm_bridge bridge;
> > +     struct clk *apb_clk;
> > +     struct phy *phy;
> > +
> > +     struct video_info video_info;
> > +     struct drm_display_mode mode;
> > +
> > +     int irq[IRQ_NUM];
> > +     struct delayed_work hotplug_work;
> > +     int connector_type;
> > +     u32 lane_mapping;
> > +
> > +     /* protect mailbox communications with the firmware */
> > +     struct mutex mbox_mutex;
> > +
> > +     const struct mhdp8501_plat_data *plat_data;
> > +
> > +     union {
> > +             struct _dp_data {
> > +                     u32 rate;
> > +                     u8 num_lanes;
> > +                     struct drm_dp_aux aux;
> > +                     u8 dpcd[DP_RECEIVER_CAP_SIZE];
> > +             } dp;
> > +             struct _hdmi_data {
> > +                     u32 hdmi_type;
> > +             } hdmi;
> > +     };
> > +};
> > +
> > +extern const struct drm_bridge_funcs cdns_dp_bridge_funcs;
> > +extern const struct drm_bridge_funcs cdns_hdmi_bridge_funcs;
> > +
> > +ssize_t cdns_dp_aux_transfer(struct drm_dp_aux *aux, struct
> drm_dp_aux_msg
> > *msg); +enum drm_connector_status cdns_mhdp8501_detect(struct
> > cdns_mhdp8501_device *mhdp); +int cdns_dp_aux_destroy(struct
> > cdns_mhdp8501_device *mhdp);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c new file mode
> 100644
> > index 0000000000000..5576db967cac6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> > @@ -0,0 +1,708 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Cadence MHDP8501 DisplayPort(DP) bridge driver
> > + *
> > + * Copyright (C) 2019-2023 NXP Semiconductor, Inc.
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
> > +                          struct drm_dp_aux_msg *msg)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D
> dev_get_drvdata(aux->dev);
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
> supported\n",
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
> > +                                                msg->address
> +
> i, buf[i]);
> > +                     if (!ret)
> > +                             continue;
>
> I personally don't like this style. I would prefer checking for 'if (ret)=
' to
> bail out in error case.

OK.

>
> > +                     DRM_DEV_ERROR(mhdp->dev, "Failed to write
> DPCD\n");
>
> Please replace all DRM_ macros, see [1] for details. As you don't have a
> drm_dev you will most probably need a dev_err & friends.

OK I will do it.

>
> > +
> > +                     return ret;
> > +             }
> > +             msg->reply =3D DP_AUX_NATIVE_REPLY_ACK;
> > +             return msg->size;
> > +     }
> > +
> > +     if (msg->request =3D=3D DP_AUX_NATIVE_READ) {
> > +             ret =3D cdns_mhdp_dpcd_read(&mhdp->base,
> msg->address,
> > +                                       msg->buffer, msg->size);
> > +             if (ret < 0)
> > +                     return -EIO;
>
> Any specific reason to return -EIO instead of ret? You return ret in case=
 of
> error from cdns_mhdp_dpcd_write as well.

No, will return ret in next version.

>
> > +             msg->reply =3D DP_AUX_NATIVE_REPLY_ACK;
> > +             return msg->size;
> > +     }
> > +     return 0;
> > +}
> > +
> > +int cdns_dp_aux_destroy(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     drm_dp_aux_unregister(&mhdp->dp.aux);
> > +
> > +     return 0;
> > +}
> > +
> > +static int cdns_dp_get_msa_misc(struct video_info *video,
> > +                             struct drm_display_mode *mode)
>
> mode is unused.

OK will remove it.

>
> > +{
> > +     u32 msa_misc;
> > +     u8 val[2] =3D {0};
>
> Please use two separate variables for color space and bpc.

OK.

>
> > +
> > +     switch (video->color_fmt) {
> > +     /* set YUV default color space conversion to BT601 */
> > +     case DRM_COLOR_FORMAT_YCBCR444:
> > +             val[0] =3D 6 + BT_601 * 8;
> > +             break;
> > +     case DRM_COLOR_FORMAT_YCBCR422:
> > +             val[0] =3D 5 + BT_601 * 8;
> > +             break;
> > +     case DRM_COLOR_FORMAT_YCBCR420:
> > +             val[0] =3D 5;
> > +             break;
> > +     case DRM_COLOR_FORMAT_RGB444:
> > +     default:
> > +             val[0] =3D 0;
> > +             break;
> > +     };
> > +
> > +     switch (video->bpc) {
> > +     case 6:
> > +             val[1] =3D 0;
> > +             break;
> > +     case 10:
> > +             val[1] =3D 2;
> > +             break;
> > +     case 12:
> > +             val[1] =3D 3;
> > +             break;
> > +     case 16:
> > +             val[1] =3D 4;
> > +             break;
> > +     case 8:
> > +     default:
> > +             val[1] =3D 1;
> > +             break;
> > +     };
> > +
> > +     msa_misc =3D 2 * val[0] + 32 * val[1];
>
> Is this multiplication intended to do bit shifting?

Yes, it will replace by bit shifting.

>
> > +
> > +     return msa_misc;
> > +}
> > +
> > +static int cdns_dp_config_video(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     struct video_info *video =3D &mhdp->video_info;
> > +     struct drm_display_mode *mode =3D &mhdp->mode;
> > +     bool h_sync_polarity, v_sync_polarity;
> > +     u64 symbol;
> > +     u32 val, link_rate, rem;
> > +     u8 bit_per_pix, tu_size_reg =3D TU_SIZE;
> > +     int ret;
> > +
> > +     bit_per_pix =3D (video->color_fmt =3D=3D
> DRM_COLOR_FORMAT_YCBCR422) ?
> > +                   (video->bpc * 2) : (video->bpc * 3);
> > +
> > +     link_rate =3D mhdp->dp.rate / 1000;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, BND_HSYNC2VSYNC,
> > VIF_BYPASS_INTERLACE); +      if (ret)
> > +             goto err_config_video;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> HSYNC2VSYNC_POL_CTRL, 0);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     /*
> > +      * get a best tu_size and valid symbol:
> > +      * 1. chose Lclk freq(162Mhz, 270Mhz, 540Mhz), set TU to 32
> > +      * 2. calculate VS(valid symbol) =3D TU * Pclk * Bpp / (Lclk * La=
nes)
> > +      * 3. if VS > *.85 or VS < *.1 or VS < 2 or TU < VS + 4, then set
> > +      *    TU +=3D 2 and repeat 2nd step.
> > +      */
> > +     do {
> > +             tu_size_reg +=3D 2;
> > +             symbol =3D tu_size_reg * mode->clock * bit_per_pix;
> > +             do_div(symbol, mhdp->dp.num_lanes * link_rate * 8);
> > +             rem =3D do_div(symbol, 1000);
> > +             if (tu_size_reg > 64) {
> > +                     ret =3D -EINVAL;
> > +                     DRM_DEV_ERROR(mhdp->dev,
> > +                                   "tu error, clk:%d, lanes:%d,
> rate:%d\n",
> > +                                   mode->clock,
> mhdp->dp.num_lanes,
> link_rate);
> > +                     goto err_config_video;
> > +             }
> > +     } while ((symbol <=3D 1) || (tu_size_reg - symbol < 4) ||
> > +              (rem > 850) || (rem < 100));
> > +
> > +     val =3D symbol + (tu_size_reg << 8);
> > +     val |=3D TU_CNT_RST_EN;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, DP_FRAMER_TU, val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     /* set the FIFO Buffer size */
> > +     val =3D div_u64(mode->clock * (symbol + 1), 1000) + link_rate;
> > +     val /=3D (mhdp->dp.num_lanes * link_rate);
> > +     val =3D div_u64(8 * (symbol + 1), bit_per_pix) - val;
> > +     val +=3D 2;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, DP_VC_TABLE(15), val);
> > +
> > +     switch (video->bpc) {
> > +     case 6:
> > +             val =3D BCS_6;
> > +             break;
> > +     case 10:
> > +             val =3D BCS_10;
> > +             break;
> > +     case 12:
> > +             val =3D BCS_12;
> > +             break;
> > +     case 16:
> > +             val =3D BCS_16;
> > +             break;
> > +     case 8:
> > +     default:
> > +             val =3D BCS_8;
> > +             break;
> > +     };
> > +
> > +     val +=3D video->color_fmt << 8;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, DP_FRAMER_PXL_REPR,
> val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     v_sync_polarity =3D !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
> > +     h_sync_polarity =3D !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
> > +
> > +     val =3D h_sync_polarity ? DP_FRAMER_SP_HSP : 0;
> > +     val |=3D v_sync_polarity ? DP_FRAMER_SP_VSP : 0;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, DP_FRAMER_SP, val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     val =3D (mode->hsync_start - mode->hdisplay) << 16;
> > +     val |=3D mode->htotal - mode->hsync_end;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> DP_FRONT_BACK_PORCH, val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     val =3D mode->hdisplay * bit_per_pix / 8;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, DP_BYTE_COUNT, val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     val =3D mode->htotal | ((mode->htotal - mode->hsync_start) << 16)=
;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, MSA_HORIZONTAL_0,
> val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     val =3D mode->hsync_end - mode->hsync_start;
> > +     val |=3D (mode->hdisplay << 16) | (h_sync_polarity << 15);
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, MSA_HORIZONTAL_1,
> val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     val =3D mode->vtotal;
> > +     val |=3D (mode->vtotal - mode->vsync_start) << 16;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, MSA_VERTICAL_0, val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     val =3D mode->vsync_end - mode->vsync_start;
> > +     val |=3D (mode->vdisplay << 16) | (v_sync_polarity << 15);
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, MSA_VERTICAL_1, val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     val =3D cdns_dp_get_msa_misc(video, mode);
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, MSA_MISC, val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, STREAM_CONFIG, 1);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     val =3D mode->hsync_end - mode->hsync_start;
> > +     val |=3D mode->hdisplay << 16;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, DP_HORIZONTAL, val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     val =3D mode->vdisplay;
> > +     val |=3D (mode->vtotal - mode->vsync_start) << 16;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, DP_VERTICAL_0, val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     val =3D mode->vtotal;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, DP_VERTICAL_1, val);
> > +     if (ret)
> > +             goto err_config_video;
> > +
> > +     ret =3D cdns_mhdp_dp_reg_write_bit(&mhdp->base, DP_VB_ID, 2, 1,
> 0);
> > +
> > +err_config_video:
> > +     if (ret)
> > +             DRM_DEV_ERROR(mhdp->dev, "config video
> failed: %d\n",
> ret);
> > +     return ret;
> > +}
> > +
> > +static void cdns_dp_pixel_clk_reset(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     u32 val;
> > +
> > +     /* reset pixel clk */
> > +     cdns_mhdp_reg_read(&mhdp->base, SOURCE_HDTX_CAR, &val);
> > +     cdns_mhdp_reg_write(&mhdp->base, SOURCE_HDTX_CAR, val &
> 0xFD);
> > +     cdns_mhdp_reg_write(&mhdp->base, SOURCE_HDTX_CAR, val);
> > +}
> > +
> > +static int cdns_dp_set_video_status(struct cdns_mhdp8501_device *mhdp,
> int
> > active) +{
> > +     u8 msg;
> > +     int ret;
> > +
> > +     msg =3D !!active;
> > +
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> > DPTX_SET_VIDEO, +                                  sizeof(msg),
> &msg);
> > +     if (ret)
> > +             DRM_DEV_ERROR(mhdp->dev, "set video status
> failed: %d\n",
> ret);
> > +
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +
> > +     return ret;
> > +}
> > +
> > +static int cdns_dp_training_start(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     unsigned long timeout;
> > +     u8 msg, event[2];
> > +     int ret;
> > +
> > +     msg =3D LINK_TRAINING_RUN;
> > +
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +
> > +     /* start training */
> > +     ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> > +                                  DPTX_TRAINING_CONTROL,
> sizeof(msg), &msg);
> > +     if (ret)
> > +             goto err_training_start;
> > +
> > +     timeout =3D jiffies + msecs_to_jiffies(LINK_TRAINING_TIMEOUT_MS);
> > +     while (time_before(jiffies, timeout)) {
> > +             msleep(LINK_TRAINING_RETRY_MS);
> > +             ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> > +                                          DPTX_READ_EVENT,
> 0,
> NULL);
> > +             if (ret)
> > +                     goto err_training_start;
> > +
> > +             ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> > +
> DPTX_READ_EVENT, sizeof(event));
> > +             if (ret)
> > +                     goto err_training_start;
> > +
> > +             ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base,
> event,
> sizeof(event));
> > +             if (ret)
> > +                     goto err_training_start;
> > +
> > +             if (event[1] & CLK_RECOVERY_FAILED) {
> > +                     DRM_DEV_ERROR(mhdp->dev, "clock recovery
> failed\n");
> > +             } else if (event[1] & EQ_PHASE_FINISHED) {
> > +                     mutex_unlock(&mhdp->mbox_mutex);
> > +                     return 0;
> > +             }
> > +     }
> > +
> > +     ret =3D -ETIMEDOUT;
> > +
> > +err_training_start:
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +
> > +     DRM_DEV_ERROR(mhdp->dev, "training failed: %d\n", ret);
> > +     return ret;
> > +}
> > +
> > +static int cdns_dp_get_training_status(struct cdns_mhdp8501_device
> *mhdp)
> > +{
> > +     u8 status[13];
> > +     int ret;
> > +
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> > +                                  DPTX_READ_LINK_STAT, 0,
> NULL);
> > +     if (ret)
> > +             goto err_get_training_status;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> > +
> DPTX_READ_LINK_STAT,
> > +                                         sizeof(status));
> > +     if (ret)
> > +             goto err_get_training_status;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, status,
> sizeof(status));
> > +     if (ret)
> > +             goto err_get_training_status;
> > +
> > +     mhdp->dp.rate =3D drm_dp_bw_code_to_link_rate(status[0]);
> > +     mhdp->dp.num_lanes =3D status[1];
> > +
> > +err_get_training_status:
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +
> > +     if (ret)
> > +             DRM_DEV_ERROR(mhdp->dev, "get training status failed:
> %d\n",
> > +                           ret);
> > +     return ret;
> > +}
> > +
> > +static int cdns_dp_train_link(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     int ret;
> > +
> > +     ret =3D cdns_dp_training_start(mhdp);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to start
> training %d\n",
> > +                           ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D cdns_dp_get_training_status(mhdp);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to get training stat
> %d\n",
> > +                           ret);
> > +             return ret;
> > +     }
> > +
> > +     DRM_DEV_DEBUG_KMS(mhdp->dev, "rate:0x%x, lanes:%d\n",
> mhdp->dp.rate,
> > +                       mhdp->dp.num_lanes);
> > +     return ret;
> > +}
> > +
> > +int cdns_dp_set_host_cap(struct cdns_mhdp8501_device *mhdp)
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
> > +             DRM_DEV_ERROR(mhdp->dev, "set host cap
> failed: %d\n",
> ret);
> > +
> > +     return ret;
> > +}
> > +
> > +static int cdns_dp_get_edid_block(void *data, u8 *edid,
> > +                               unsigned int block, size_t length)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D data;
> > +     u8 msg[2], reg[2], i;
> > +     int ret;
> > +
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +
> > +     for (i =3D 0; i < 4; i++) {
> > +             msg[0] =3D block / 2;
> > +             msg[1] =3D block % 2;
> > +
> > +             ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> > +                                          DPTX_GET_EDID,
> sizeof(msg), msg);
> > +             if (ret)
> > +                     continue;
> > +
> > +             ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> MB_MODULE_ID_DP_TX,
> > +
> DPTX_GET_EDID,
> > +                                                 sizeof(reg) +
> length);
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
> > +             if (reg[0] =3D=3D length && reg[1] =3D=3D block / 2)
> > +                     break;
> > +     }
> > +
> > +     if (ret)
> > +             DRM_DEV_ERROR(mhdp->dev, "get block[%d] edid failed:
> %d\n",
> > +                           block, ret);
> > +
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +     return ret;
> > +}
> > +
> > +static void cdns_dp_mode_set(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     union phy_configure_opts phy_cfg;
> > +     int ret;
> > +
> > +     cdns_dp_pixel_clk_reset(mhdp);
> > +
> > +     /* Get DP Caps  */
> > +     ret =3D drm_dp_dpcd_read(&mhdp->dp.aux, DP_DPCD_REV,
> mhdp->dp.dpcd,
> > +                            DP_RECEIVER_CAP_SIZE);
> > +     if (ret < 0) {
> > +             DRM_ERROR("Failed to get caps %d\n", ret);
> > +             return;
> > +     }
> > +
> > +     mhdp->dp.rate =3D drm_dp_max_link_rate(mhdp->dp.dpcd);
> > +     mhdp->dp.num_lanes =3D drm_dp_max_lane_count(mhdp->dp.dpcd);
> > +
> > +     /* check the max link rate */
> > +     if (mhdp->dp.rate > CDNS_DP_MAX_LINK_RATE)
> > +             mhdp->dp.rate =3D CDNS_DP_MAX_LINK_RATE;
> > +
> > +     phy_cfg.dp.lanes =3D mhdp->dp.num_lanes;
> > +     phy_cfg.dp.link_rate =3D mhdp->dp.rate;
> > +     phy_cfg.dp.set_lanes =3D false;
> > +     phy_cfg.dp.set_rate =3D false;
> > +     phy_cfg.dp.set_voltages =3D true;
> > +
> > +     /* Mailbox protect for DP PHY access */
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +     ret =3D phy_configure(mhdp->phy, &phy_cfg);
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> > +                     __func__, ret);
> > +             return;
> > +     }
> > +
> > +     /* Video off */
> > +     ret =3D cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to valid
> video %d\n",
> ret);
> > +             return;
> > +     }
> > +
> > +     /* Line swapping */
> > +     cdns_mhdp_reg_write(&mhdp->base, LANES_CONFIG, 0x00400000
> |
> > mhdp->lane_mapping); +
> > +     /* Set DP host capability */
> > +     ret =3D cdns_dp_set_host_cap(mhdp);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to set host
> cap %d\n",
> ret);
> > +             return;
> > +     }
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> DP_AUX_SWAP_INVERSION_CONTROL,
> > +                               AUX_HOST_INVERT);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to set host
> invert %d\n",
> ret);
> > +             return;
> > +     }
> > +
> > +     ret =3D cdns_dp_config_video(mhdp);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to config
> video %d\n",
> ret);
> > +             return;
> > +     }
> > +}
> > +
> > +static int cdns_dp_bridge_attach(struct drm_bridge *bridge,
> > +                              enum drm_bridge_attach_flags flags)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +             DRM_ERROR("do not support creating a
> drm_connector\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     mhdp->dp.aux.drm_dev =3D bridge->dev;
> > +
> > +     return drm_dp_aux_register(&mhdp->dp.aux);
> > +}
> > +
> > +static enum drm_mode_status
> > +cdns_dp_bridge_mode_valid(struct drm_bridge *bridge,
> > +                       const struct drm_display_info *info,
> > +                       const struct drm_display_mode *mode)
> > +{
> > +     enum drm_mode_status mode_status =3D MODE_OK;
> > +
> > +     /* We don't support double-clocked modes */
> > +     if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
> > +         mode->flags & DRM_MODE_FLAG_INTERLACE)
> > +             return MODE_BAD;
> > +
> > +     /* MAX support pixel clock rate 594MHz */
> > +     if (mode->clock > 594000)
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     /* 4096x2160 is not supported */
> > +     if (mode->hdisplay > 3840)
>
> Comment does not match code.

OK.

>
> > +             return MODE_BAD_HVALUE;
> > +
> > +     if (mode->vdisplay > 2160)
> > +             return MODE_BAD_VVALUE;
> > +
> > +     return mode_status;
> > +}
> > +
> > +static enum drm_connector_status
> > +cdns_dp_bridge_detect(struct drm_bridge *bridge)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     return cdns_mhdp8501_detect(mhdp);
> > +}
> > +
> > +static struct edid *cdns_dp_bridge_get_edid(struct drm_bridge *bridge,
> > +                                         struct drm_connector
> *connector)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     return drm_do_get_edid(connector, cdns_dp_get_edid_block,
> mhdp);
> > +}
> > +
> > +static void cdns_dp_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                                       struct drm_bridge_state
> *old_state)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
> > +     mhdp->curr_conn =3D NULL;
> > +
> > +     /* Mailbox protect for DP PHY access */
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +     phy_power_off(mhdp->phy);
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +}
> > +
> > +static void cdns_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> > +                                      struct drm_bridge_state
> *old_state)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +     struct drm_atomic_state *state =3D old_state->base.state;
> > +     struct drm_connector *connector;
> > +     struct video_info *video =3D &mhdp->video_info;
> > +     struct drm_crtc_state *crtc_state;
> > +     struct drm_connector_state *conn_state;
> > +     const struct drm_display_mode *mode;
> > +     int ret;
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
> > +
> > +     switch (connector->display_info.bpc) {
> > +     case 10:
> > +             video->bpc =3D 10;
> > +             break;
> > +     case 6:
> > +             video->bpc =3D 6;
> > +             break;
> > +     default:
> > +             video->bpc =3D 8;
> > +             break;
> > +     }
> > +
> > +     /* The only currently supported format */
> > +     video->color_fmt =3D DRM_COLOR_FORMAT_RGB444;
> > +
> > +     DRM_INFO("Mode: %dx%dp%d\n", mode->hdisplay, mode->vdisplay,
> mode-
> >clock);
> > +     memcpy(&mhdp->mode, mode, sizeof(struct drm_display_mode));
> > +
> > +     cdns_dp_mode_set(mhdp);
> > +
> > +     /* Link trainning */
> > +     ret =3D cdns_dp_train_link(mhdp);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed link train %d\n",
> ret);
> > +             return;
> > +     }
> > +
> > +     ret =3D cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_VALID);
> > +     if (ret) {
> > +             DRM_DEV_ERROR(mhdp->dev, "Failed to valid
> video %d\n",
> ret);
> > +             return;
> > +     }
> > +}
> > +
> > +const struct drm_bridge_funcs cdns_dp_bridge_funcs =3D {
> > +     .attach =3D cdns_dp_bridge_attach,
> > +     .mode_valid =3D cdns_dp_bridge_mode_valid,
> > +     .detect =3D cdns_dp_bridge_detect,
> > +     .get_edid =3D cdns_dp_bridge_get_edid,
> > +     .atomic_enable =3D cdns_dp_bridge_atomic_enable,
> > +     .atomic_disable =3D cdns_dp_bridge_atomic_disable,
> > +     .atomic_duplicate_state =3D
> drm_atomic_helper_bridge_duplicate_state,
> > +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +     .atomic_reset =3D drm_atomic_helper_bridge_reset,
>
> Can you please sort the entries in the same order as
> cdns_hdmi_bridge_funcs?
> This makes it easier to detect which entries are provided in both files.
>

OK.

> > +};
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c new file mode
> 100644
> > index 0000000000000..73d1c35a74599
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
> > +#include <drm/display/drm_hdmi_helper.h>
> > +#include <drm/display/drm_scdc_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_edid.h>
> > +#include <drm/drm_print.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/phy/phy-hdmi.h>
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
> > +                                 u8 *packet, u8 packet_type)
> > +{
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
> > +                                 u32 block, size_t length)
> > +{
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
>
> Please replace all DRM_ macros, see [1] for details. As you don't have a
> drm_dev you will most probably need a dev_err & friends.
>
> [1]
> https://lore.ke/
> rnel.org%2Flinux-arm-kernel%2F285db5bc-f901-e09f-7f86-6638d260c283%4
> 0linaro.org%2FT%2F%23ma30715ccd9004ad19a6741c3f6b3dfd68d526018&
> data=3D05%7C01%7CSandor.yu%40nxp.com%7Cf09434a5d5fd48d090e308dbcf
> 0deb19%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638331430
> 937142084%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj
> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata
> =3Dh72fs%2BkA2pTNbM1MuAPYSHbkw0ScLLYu2zeeSmdKE5I%3D&reserved=3D0
>

OK

> > +     return ret;
> > +}
> > +
> > +static int cdns_hdmi_scdc_write(struct cdns_mhdp8501_device *mhdp, u8
> addr,
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
> > +
> > +     ret =3D cdns_mhdp_mailbox_send(&mhdp->base,
> MB_MODULE_ID_HDMI_TX,
> > HDMI_TX_WRITE, +                                   sizeof(msg),
> msg);
> > +     if (ret)
> > +             goto err_scdc_write;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_header(&mhdp->base,
> MB_MODULE_ID_HDMI_TX,
> > +                                         HDMI_TX_WRITE,
> sizeof(reg));
> > +     if (ret)
> > +             goto err_scdc_write;
> > +
> > +     ret =3D cdns_mhdp_mailbox_recv_data(&mhdp->base, reg,
> sizeof(reg));
> > +     if (ret)
> > +             goto err_scdc_write;
> > +
> > +     if (reg[0] !=3D 0)
> > +             ret =3D -EINVAL;
> > +
> > +err_scdc_write:
> > +
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +
> > +     if (ret)
> > +             DRM_ERROR("scdc write failed: %d\n", ret);
> > +     return ret;
> > +}
> > +
> > +static int cdns_hdmi_ctrl_init(struct cdns_mhdp8501_device *mhdp, int
> > protocol) +{
> > +     u32 reg0, reg1, val;
> > +     int ret;
> > +
> > +     /* Set PHY to HDMI data */
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, PHY_DATA_SEL,
> > F_SOURCE_PHY_MHDP_SEL(1)); +  if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_HPD,
> > +                               F_HPD_VALID_WIDTH(4) |
> F_HPD_GLITCH_WIDTH(0));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* open CARS */
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_PHY_CAR,
> 0xF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_HDTX_CAR,
> 0xFF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_PKT_CAR, 0xF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_AIF_CAR, 0xF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_CIPHER_CAR,
> 0xF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_CRYPTO_CAR,
> 0xF);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SOURCE_CEC_CAR, 3);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     reg0 =3D 0x7c1f;
> > +     reg1 =3D 0x7c1f;
> > +     if (protocol =3D=3D MODE_HDMI_2_0) {
> > +             reg0 =3D 0;
> > +             reg1 =3D 0xFFFFF;
> > +     }
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CLOCK_REG_0,
> reg0);
> > +     if (ret < 0)
> > +             return ret;
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CLOCK_REG_1,
> reg1);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* set hdmi mode and preemble mode data enable */
>
> Please stick to consistent uppercase when naming HDMI.
>

OK.

> > +     val =3D F_HDMI_MODE(protocol) | F_HDMI2_PREAMBLE_EN(1) |
> F_DATA_EN(1)
> |
> > +                     F_HDMI2_CTRL_IL_MODE(1) | F_BCH_EN(1) |
> F_PIC_3D(0XF);
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +
> > +     return ret;
> > +}
> > +
> > +static int cdns_hdmi_mode_config(struct cdns_mhdp8501_device *mhdp,
> > +                              struct drm_display_mode *mode,
> > +                              struct video_info *video_info)
> > +{
> > +     int ret;
> > +     u32 val;
> > +     u32 vsync_lines =3D mode->vsync_end - mode->vsync_start;
> > +     u32 eof_lines =3D mode->vsync_start - mode->vdisplay;
> > +     u32 sof_lines =3D mode->vtotal - mode->vsync_end;
> > +     u32 hblank =3D mode->htotal - mode->hdisplay;
> > +     u32 hactive =3D mode->hdisplay;
> > +     u32 vblank =3D mode->vtotal - mode->vdisplay;
> > +     u32 vactive =3D mode->vdisplay;
> > +     u32 hfront =3D mode->hsync_start - mode->hdisplay;
> > +     u32 hback =3D mode->htotal - mode->hsync_end;
> > +     u32 vfront =3D eof_lines;
> > +     u32 hsync =3D hblank - hfront - hback;
> > +     u32 vsync =3D vsync_lines;
> > +     u32 vback =3D sof_lines;
> > +     u32 v_h_polarity =3D ((mode->flags & DRM_MODE_FLAG_NHSYNC) ?
> 0 : 1) +
> > +                     ((mode->flags & DRM_MODE_FLAG_NVSYNC) ?
> 0 : 2);
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SCHEDULER_H_SIZE,
> (hactive <<
> 16) +
> > hblank); +    if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, SCHEDULER_V_SIZE,
> (vactive <<
> 16) +
> > vblank); +    if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> HDTX_SIGNAL_FRONT_WIDTH,
> (vfront <<
> > 16) + hfront); +      if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> HDTX_SIGNAL_SYNC_WIDTH,
> (vsync <<
> > 16) + hsync); +       if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> HDTX_SIGNAL_BACK_WIDTH,
> (vback <<
> > 16) + hback); +       if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base,
> HSYNC2VSYNC_POL_CTRL,
> > v_h_polarity); +      if (ret < 0)
> > +             return ret;
> > +
> > +     /* Reset Data Enable */
> > +     cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> > +     val &=3D ~F_DATA_EN(1);
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* Set bpc */
> > +     val &=3D ~F_VIF_DATA_WIDTH(3);
> > +     switch (video_info->bpc) {
> > +     case 10:
> > +             val |=3D F_VIF_DATA_WIDTH(1);
> > +             break;
> > +     case 12:
> > +             val |=3D F_VIF_DATA_WIDTH(2);
> > +             break;
> > +     case 16:
> > +             val |=3D F_VIF_DATA_WIDTH(3);
> > +             break;
> > +     case 8:
> > +     default:
> > +             val |=3D F_VIF_DATA_WIDTH(0);
> > +             break;
> > +     }
> > +
> > +     /* select color encoding */
> > +     val &=3D ~F_HDMI_ENCODING(3);
> > +     switch (video_info->color_fmt) {
> > +     case DRM_COLOR_FORMAT_YCBCR444:
> > +             val |=3D F_HDMI_ENCODING(2);
> > +             break;
> > +     case DRM_COLOR_FORMAT_YCBCR422:
> > +             val |=3D F_HDMI_ENCODING(1);
> > +             break;
> > +     case DRM_COLOR_FORMAT_YCBCR420:
> > +             val |=3D F_HDMI_ENCODING(3);
> > +             break;
> > +     case DRM_COLOR_FORMAT_RGB444:
> > +     default:
> > +             val |=3D F_HDMI_ENCODING(0);
> > +             break;
> > +     }
> > +
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* set data enable */
> > +     val |=3D F_DATA_EN(1);
> > +     ret =3D cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +
> > +     return ret;
> > +}
> > +
> > +static int cdns_hdmi_disable_gcp(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     u32 val;
> > +
> > +     cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> > +     val &=3D ~F_GCP_EN(1);
> > +
> > +     return cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +}
> > +
> > +static int cdns_hdmi_enable_gcp(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     u32 val;
> > +
> > +     cdns_mhdp_reg_read(&mhdp->base, HDTX_CONTROLLER, &val);
> > +     val |=3D F_GCP_EN(1);
> > +
> > +     return cdns_mhdp_reg_write(&mhdp->base, HDTX_CONTROLLER,
> val);
> > +}
> > +
> > +static void cdns_hdmi_sink_config(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     struct drm_scdc *scdc =3D
> &mhdp->curr_conn->display_info.hdmi.scdc;
> > +     u32 char_rate =3D mhdp->mode.clock * mhdp->video_info.bpc / 8;
> > +     u8 buff =3D 0;
> > +
> > +     /* Default work in HDMI1.4 */
> > +     mhdp->hdmi.hdmi_type =3D MODE_HDMI_1_4;
> > +
> > +     /* check sink support SCDC or not */
> > +     if (!scdc->supported) {
> > +             DRM_INFO("Sink Not Support SCDC\n");
> > +             return;
> > +     }
> > +
> > +     if (char_rate > 340000) {
> > +             /*
> > +              * TMDS Character Rate above 340MHz should working in
> HDMI2.0
> > +              * Enable scrambling and TMDS_Bit_Clock_Ratio
> > +              */
> > +             buff =3D SCDC_TMDS_BIT_CLOCK_RATIO_BY_40 |
> SCDC_SCRAMBLING_ENABLE;
> > +             mhdp->hdmi.hdmi_type =3D MODE_HDMI_2_0;
> > +     } else if (scdc->scrambling.low_rates) {
> > +             /*
> > +              * Enable scrambling and HDMI2.0 when scrambling
> capability of sink
> > +              * be indicated in the HF-VSDB LTE_340Mcsc_scramble bit
> > +              */
> > +             buff =3D SCDC_SCRAMBLING_ENABLE;
> > +             mhdp->hdmi.hdmi_type =3D MODE_HDMI_2_0;
> > +     }
> > +
> > +     /* TMDS config */
> > +     cdns_hdmi_scdc_write(mhdp, SCDC_TMDS_CONFIG, buff);
> > +}
> > +
> > +static void cdns_hdmi_lanes_config(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     /* Line swapping */
> > +     cdns_mhdp_reg_write(&mhdp->base, LANES_CONFIG, 0x00400000
> |
> > mhdp->lane_mapping); +}
> > +
> > +static int cdns_hdmi_colorspace(int color_fmt)
> > +{
> > +     int color_space;
> > +
> > +     switch (color_fmt) {
> > +     case DRM_COLOR_FORMAT_YCBCR444:
> > +             color_space =3D HDMI_COLORSPACE_YUV444;
> > +             break;
> > +     case DRM_COLOR_FORMAT_YCBCR422:
> > +             color_space =3D HDMI_COLORSPACE_YUV422;
> > +             break;
> > +     case DRM_COLOR_FORMAT_YCBCR420:
> > +             color_space =3D HDMI_COLORSPACE_YUV420;
> > +             break;
> > +     case DRM_COLOR_FORMAT_RGB444:
> > +     default:
> > +             color_space =3D HDMI_COLORSPACE_RGB;
> > +             break;
> > +     }
> > +
> > +     return color_space;
> > +}
> > +
> > +static int cdns_hdmi_avi_info_set(struct cdns_mhdp8501_device *mhdp,
> > +                               struct drm_display_mode *mode)
> > +{
> > +     struct hdmi_avi_infoframe frame;
> > +     struct drm_connector_state *conn_state =3D mhdp->curr_conn->state=
;
> > +     struct drm_display_mode *adj_mode;
> > +     enum hdmi_quantization_range qr;
> > +     u8 buf[32];
> > +     int ret;
> > +
> > +     /* Initialise info frame from DRM mode */
> > +     drm_hdmi_avi_infoframe_from_display_mode(&frame,
> mhdp->curr_conn,
> mode);
> > +
> > +     frame.colorspace =3D
> cdns_hdmi_colorspace(mhdp->video_info.color_fmt);
> > +
> > +     drm_hdmi_avi_infoframe_colorimetry(&frame, conn_state);
> > +
> > +     adj_mode =3D &mhdp->bridge.encoder->crtc->state->adjusted_mode;
> > +
> > +     qr =3D drm_default_rgb_quant_range(adj_mode);
> > +
> > +     drm_hdmi_avi_infoframe_quant_range(&frame, mhdp->curr_conn,
> > +                                        adj_mode, qr);
> > +
> > +     ret =3D hdmi_avi_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1)=
;
> > +     if (ret < 0) {
> > +             DRM_ERROR("failed to pack AVI infoframe: %d\n", ret);
> > +             return -1;
> > +     }
> > +
> > +     buf[0] =3D 0;
> > +     cdns_hdmi_infoframe_set(mhdp, 0, sizeof(buf), buf,
> > HDMI_INFOFRAME_TYPE_AVI); +
> > +     return 0;
> > +}
> > +
> > +static void cdns_hdmi_vendor_info_set(struct cdns_mhdp8501_device
> *mhdp,
> > +                                   struct drm_display_mode
> *mode)
> > +{
> > +     struct hdmi_vendor_infoframe frame;
> > +     u8 buf[32];
> > +     int ret;
> > +
> > +     /* Initialise vendor frame from DRM mode */
> > +     ret =3D drm_hdmi_vendor_infoframe_from_display_mode(&frame,
> mhdp-
> >curr_conn,
> > mode); +      if (ret < 0) {
> > +             DRM_INFO("No vendor infoframe\n");
> > +             return;
> > +     }
> > +
> > +     ret =3D hdmi_vendor_infoframe_pack(&frame, buf + 1, sizeof(buf) -=
 1);
> > +     if (ret < 0) {
> > +             DRM_WARN("Unable to pack vendor infoframe: %d\n",
> ret);
> > +             return;
> > +     }
> > +
> > +     buf[0] =3D 0;
> > +     cdns_hdmi_infoframe_set(mhdp, 3, sizeof(buf), buf,
> > HDMI_INFOFRAME_TYPE_VENDOR); +}
> > +
> > +static void cdns_hdmi_drm_info_set(struct cdns_mhdp8501_device
> *mhdp)
> > +{
> > +     struct drm_connector_state *conn_state;
> > +     struct hdmi_drm_infoframe frame;
> > +     u8 buf[32];
> > +     int ret;
> > +
> > +     conn_state =3D mhdp->curr_conn->state;
> > +
> > +     if (!conn_state->hdr_output_metadata)
> > +             return;
> > +
> > +     ret =3D drm_hdmi_infoframe_set_hdr_metadata(&frame, conn_state);
> > +     if (ret < 0) {
> > +             DRM_DEBUG_KMS("couldn't set HDR metadata in
> infoframe\n");
> > +             return;
> > +     }
> > +
> > +     ret =3D hdmi_drm_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1)=
;
> > +     if (ret < 0) {
> > +             DRM_DEBUG_KMS("couldn't pack HDR infoframe\n");
> > +             return;
> > +     }
> > +
> > +     buf[0] =3D 0;
> > +     cdns_hdmi_infoframe_set(mhdp, 3, sizeof(buf), buf,
> > HDMI_INFOFRAME_TYPE_DRM); +}
> > +
> > +static void cdns_hdmi_mode_set(struct cdns_mhdp8501_device *mhdp)
> > +{
> > +     struct drm_display_mode *mode =3D &mhdp->mode;
> > +     union phy_configure_opts phy_cfg;
> > +     int ret;
> > +
> > +     /* video mode check */
> > +     if (mode->clock =3D=3D 0 || mode->hdisplay =3D=3D 0 || mode->vdis=
play =3D=3D
> 0)
> > +             return;
> > +
> > +     cdns_hdmi_lanes_config(mhdp);
> > +
> > +     phy_cfg.hdmi.pixel_clk_rate =3D mode->clock;
> > +     phy_cfg.hdmi.bpc =3D mhdp->video_info.bpc;
> > +     phy_cfg.hdmi.color_space =3D
> > cdns_hdmi_colorspace(mhdp->video_info.color_fmt); +
> > +     /* Mailbox protect for HDMI PHY access */
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +     ret =3D phy_configure(mhdp->phy, &phy_cfg);
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +     if (ret) {
> > +             dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
> > +                     __func__, ret);
> > +             return;
> > +     }
> > +
> > +     cdns_hdmi_sink_config(mhdp);
> > +
> > +     ret =3D cdns_hdmi_ctrl_init(mhdp, mhdp->hdmi.hdmi_type);
> > +     if (ret < 0) {
> > +             DRM_ERROR("%s, ret =3D %d\n", __func__, ret);
> > +             return;
> > +     }
> > +
> > +     /* Config GCP */
> > +     if (mhdp->video_info.bpc =3D=3D 8)
> > +             cdns_hdmi_disable_gcp(mhdp);
> > +     else
> > +             cdns_hdmi_enable_gcp(mhdp);
> > +
> > +     ret =3D cdns_hdmi_avi_info_set(mhdp, mode);
> > +     if (ret < 0) {
> > +             DRM_ERROR("%s ret =3D %d\n", __func__, ret);
> > +             return;
> > +     }
> > +
> > +     /* vendor info frame is enabled only for HDMI1.4 4K mode */
> > +     cdns_hdmi_vendor_info_set(mhdp, mode);
> > +
> > +     cdns_hdmi_drm_info_set(mhdp);
> > +
> > +     ret =3D cdns_hdmi_mode_config(mhdp, mode, &mhdp->video_info);
> > +     if (ret < 0) {
> > +             DRM_ERROR("CDN_API_HDMITX_SetVic_blocking ret
> =3D %d\n",
> ret);
> > +             return;
> > +     }
> > +}
> > +
> > +static int cdns_hdmi_bridge_attach(struct drm_bridge *bridge,
> > +                                enum drm_bridge_attach_flags
> flags)
> > +{
> > +     if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > +             DRM_ERROR("do not support creating a
> drm_connector\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static enum drm_mode_status
> > +cdns_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> > +                         const struct drm_display_info *info,
> > +                         const struct drm_display_mode *mode)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +     enum drm_mode_status mode_status =3D MODE_OK;
> > +     union phy_configure_opts phy_cfg;
> > +     int ret;
> > +
> > +     /* We don't support double-clocked and Interlaced modes */
> > +     if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
> > +         mode->flags & DRM_MODE_FLAG_INTERLACE)
> > +             return MODE_BAD;
> > +
> > +     /* MAX support pixel clock rate 594MHz */
> > +     if (mode->clock > 594000)
> > +             return MODE_CLOCK_HIGH;
> > +
> > +     /* 4096x2160 is not supported */
> > +     if (mode->hdisplay > 3840 || mode->vdisplay > 2160)
>
> Comment does not match code. Despite that separately check for vdisplay
> and
> return MODE_BAD_VVALUE if it's too big.
>

OK, thanks your detail review comments.

Sandor

> Best regards,
> Alexander
>
> > +             return MODE_BAD_HVALUE;
> > +
> > +     /* Check modes supported by PHY */
> > +     phy_cfg.hdmi.pixel_clk_rate =3D mode->clock;
> > +
> > +     /* Mailbox protect for HDMI PHY access */
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +     ret =3D phy_validate(mhdp->phy, PHY_MODE_HDMI, 0, &phy_cfg);
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +     if (ret < 0)
> > +             return MODE_CLOCK_RANGE;
> > +
> > +     return mode_status;
> > +}
> > +
> > +bool cdns_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> > +                              const struct drm_display_mode
> *mode,
> > +                              struct drm_display_mode
> *adjusted_mode)
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
> > +cdns_hdmi_bridge_detect(struct drm_bridge *bridge)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     return cdns_mhdp8501_detect(mhdp);
> > +}
> > +
> > +static struct edid *cdns_hdmi_bridge_get_edid(struct drm_bridge *bridg=
e,
> > +                                           struct
> drm_connector
> *connector)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     return drm_do_get_edid(connector, cdns_hdmi_get_edid_block,
> mhdp);
> > +}
> > +
> > +static void cdns_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
> > +                                         struct
> drm_bridge_state
> *old_state)
> > +{
> > +     struct cdns_mhdp8501_device *mhdp =3D bridge->driver_private;
> > +
> > +     mhdp->curr_conn =3D NULL;
> > +
> > +     /* Mailbox protect for HDMI PHY access */
> > +     mutex_lock(&mhdp->mbox_mutex);
> > +     phy_power_off(mhdp->phy);
> > +     mutex_unlock(&mhdp->mbox_mutex);
> > +}
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
> > +     DRM_INFO("Mode: %dx%dp%d\n", mode->hdisplay, mode->vdisplay,
> mode-
> >clock);
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
> > +     .atomic_reset =3D drm_atomic_helper_bridge_reset,
> > +};
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq/
> -group.com%2F&data=3D05%7C01%7CSandor.yu%40nxp.com%7Cf09434a5d5fd
> 48d090e308dbcf0deb19%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C
> 0%7C638331430937142084%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
> LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C
> %7C%7C&sdata=3DdsINd06yxEdG84HIvu5Fjj3rl6VyDVKb26gsr7i5MiU%3D&rese
> rved=3D0
>

