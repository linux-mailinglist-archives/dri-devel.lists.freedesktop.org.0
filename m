Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79E859CC5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 08:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B7210E085;
	Mon, 19 Feb 2024 07:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Kd//NOQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2088.outbound.protection.outlook.com [40.107.15.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1201010E085
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 07:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqJH5NPOKWBeP+d/sE261MLDIfbuNcCOYpip4Sscz9hrZ3MPNFLj5BkG6rU8qkGQsVzLXHQsr+NXuFUCsb6cEN4Ncn4x0GzbmZIDYJLmAma7JUGTl/CNa+h5RNDHF/Z5VQS0yMsxGZvqDmTDfLrxaUTSOXnaDVUVZxYJvMGj4VOofMcY1jkgancRKPRsb2GLUFKgJ2Q/YiieVkMKHKiZDbCS4IBalrQy9nyprj7KtVPKkizpdq4DLPn5xGDRv/H/O5iq9foMr/g0z5yu4i1rUoAi6fPe6e6/cHrZ8nCC6Aei2EjGb8mO5+UmgF1zBFEYbA/xX5BLotVlQqtYYI6DRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fOlKrhhJREJW+rln1r05pWwcE7CoUF3q80sOghrdO0=;
 b=LpTeVTCE/MCAjPwE+dPx4p/4tofkd3xS6xeOnWdivr3lX3YhtWE+l2zudmqPZxsPmx/NttqjHY4NsnQLNtTKBmCqdci57HE95NcbFIbLq3xQedr3GP4K5C84X4DBaywhijGfw+NgyVU1OuA8qyofSy6vS3FnMnNsy4kWE1ymmRkN01mkPAHY0597kRM+zKFqkgtt49U4JD4XLgzOrkwmg3I8kzfMFzsDutqaRM0xL6K0SpBv++zYLi7NKF7AY0spB23FNZPTvrXk4yVmZGGsr5QtGrtiX3gIM3FH9b2AVkywscX/eaVcg9aBNR3wC53EkCG5BoxuHAYQ2qNtCMHrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fOlKrhhJREJW+rln1r05pWwcE7CoUF3q80sOghrdO0=;
 b=Kd//NOQC4VPZBk+/dmcszQItz7l4IwDjaqrMwx+q/yXh/bvWptPcBzTABgrmVOPvt24b9xzs7VVKzeam3FVtEe4uSi3AnSuKBiV/29qzN0MHNtzTUc6v9b/mMEb6jBJWSMRlRZMyM46o/a8gKzuCqmfhzARwSv1830r/Wj/9yRw=
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 by AM9PR04MB7601.eurprd04.prod.outlook.com (2603:10a6:20b:285::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Mon, 19 Feb
 2024 07:24:25 +0000
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4272:e277:dda3:2446]) by DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4272:e277:dda3:2446%2]) with mapi id 15.20.7292.029; Mon, 19 Feb 2024
 07:24:25 +0000
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
Subject: RE: [EXT] Re: [PATCH v13 4/7] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Topic: [EXT] Re: [PATCH v13 4/7] drm: bridge: Cadence: Add MHDP8501
 DP/HDMI driver
Thread-Index: AQHaV1QsTfsqjPM64Eapj6JNsPkB8bEMnvWAgAS6OOA=
Date: Mon, 19 Feb 2024 07:24:25 +0000
Message-ID: <DB9PR04MB94522ED2DB0D32A0792EAB33F4512@DB9PR04MB9452.eurprd04.prod.outlook.com>
References: <cover.1707040881.git.Sandor.yu@nxp.com>
 <5bd01470cf971e2385ecd169c3d5ac659a020973.1707040881.git.Sandor.yu@nxp.com>
 <3549548.iIbC2pHGDl@steina-w>
In-Reply-To: <3549548.iIbC2pHGDl@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9452:EE_|AM9PR04MB7601:EE_
x-ms-office365-filtering-correlation-id: dee72258-9aa3-48a3-67c1-08dc311bcd23
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a0HsB/y02FxsRatPN9H42C/ro80kDgdQsnWJfWYlqh7YzWTmn4UXkCg1Z2PCl4bxZZS6+exQtOuDE07GKL2VrkHXvYOB8BpmzwdzXpOLnIjfQvaOSE9oZSQIyBeuQzbsjxeKNQMgakdn1zPvuTtjhMVpw2+wcFv1f6rJ2qTDm9ddAolEmVrEsR5z4frtJpd3OqDP54mZR/7RLydNSVTkClPha5p7A/S17l67ll+DfgOROoU+EcYpWXApS6UBTGsybV4AXo2vtvqsA/5IRu8RjNcygSGbg9aq3WrriMxkGfaL9AE5b0iklcxCQfo5roygBxoiU9oPE72BgaqHp/1VK/n4RuH53xbl7gepQqjYtl6O6c4b0x8qGvYHHCZNpaahL/xlS8jEEA0az+hvZBsiH74IakkN5mrpgqaHHXbowmLRIVNWoARnDPUCEv5CVdsG9cg3NbOod4H3zDPdLU63T0seKNNMKKI8MXX1D82PA+R/ex844S/IOM4s9kr6jWEdvFtsytCQOloy7X0ExXihwyOKtCqr+nvs3mzX6avTaB+9qTa5/Uh5Bkkl4oeygmQF89uhIkWgJ1xyObbYPQllZuprIJaELmKJ5COmT33HGuia9TSQJc3XKyPYJYN6USCy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9452.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(396003)(346002)(136003)(366004)(230922051799003)(230273577357003)(186009)(64100799003)(1800799012)(451199024)(55016003)(966005)(45080400002)(71200400001)(478600001)(9686003)(41300700001)(2906002)(5660300002)(4326008)(7416002)(44832011)(52536014)(76116006)(6506007)(316002)(7696005)(66556008)(8936002)(110136005)(54906003)(66946007)(66446008)(64756008)(66476007)(8676002)(83380400001)(66574015)(86362001)(38070700009)(38100700002)(122000001)(33656002)(921011)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hpItkqBrAa//KvFRd65TFmI0zEmtNGQRsT/AQkf+Lr4CDu93mG9/A8eFwt?=
 =?iso-8859-1?Q?eQxsqqZmaGLSnfPWqlBbc3Z0p7x2aOQNJl69GoPAOq03RJpMgjMLmU1Ey2?=
 =?iso-8859-1?Q?TEkqxZLZPaf99vtbjatYe+NrxboZ1yK3oPlpBT9vMKFS72EkA/meisL5kx?=
 =?iso-8859-1?Q?rip3RUEmeJ7Hs2w5YukVy8hTO4vZHWY0/qVuPBHJr45N6Pu+Upk4ScbQxO?=
 =?iso-8859-1?Q?11XlzHakP8zcYt4fD40zEPxfkfwasi5XQyypmglm+85hq8PjUH8z52q/qf?=
 =?iso-8859-1?Q?c8+MEd8OTsYBEpsDW1497iUx/5V2SigHm9cGncc4+QDaNUJrnOTWusXFlo?=
 =?iso-8859-1?Q?uKig8PUiY6rCW2fMKX4zBqcdgoS9EaEejFDZECEUCw1XO8Cnkj0nN7kqQd?=
 =?iso-8859-1?Q?XnFNTZUtiwz9f4rB0lYf+eDtOJ9bm2H+Dy2leQ8+GmnHQtEw5ZvCDfhwAd?=
 =?iso-8859-1?Q?NSeDBZUgmSIPl52c8uOok9suJSTTNirBEtB0iQzLMPSpTCMP064EOb3FQ/?=
 =?iso-8859-1?Q?+MeJRO1hppp3QFI41CNZIG79UrHuBLSNDS6mkMUJwa/Z0Q1xBU8EiAHzj8?=
 =?iso-8859-1?Q?jCN+WUHt3i+52yapcknMnZLIu9fgUxl/+phcAY7U5i42Ntg70Irkr5tS1t?=
 =?iso-8859-1?Q?zGfanYGrjrGag8bi37/Cu5UJeA1A43D0SKWo1MsZIQ5NGjx9F6hsdfleMZ?=
 =?iso-8859-1?Q?kO6N3nRHFO9eYOcE1JGGp0VhUFL0UNOanPvXOjQ7GLclSYSRURvyJf77mC?=
 =?iso-8859-1?Q?U/ERH/A13skLw+C90F4BHXJ3Izvj4I1e3ZOntG7/bFrE/e2FSs0uMGRN2S?=
 =?iso-8859-1?Q?GQKINXWv0bjjDdGta1A381MDFrmxkdUnWG5e2956pdJlY69J4o2agZe6yQ?=
 =?iso-8859-1?Q?tXMhFQ5G7rEVy4cr0x4zQUo4PHpDx0wuLK4KCBMxt7+Gnv4OrvIAF0Mu/J?=
 =?iso-8859-1?Q?XQ/bWBEzP1PlX8Dj6szBxSN1/VaMNthAr5qaRKGLiv9Jx8pRwfQqylsH47?=
 =?iso-8859-1?Q?PLR+j1bNnCWyUr7vaaJMWA9AdwK1XrJ0wFDyj6gdqCXVOUC41m4eivSToj?=
 =?iso-8859-1?Q?Tw9Bd7wmt8t44NhLKOB0CUV5eO3LrUIShkSTmNOmQokQdsGkVI0r03nhdB?=
 =?iso-8859-1?Q?52jL18ak4KdYZZGY3qv3UiSDOgzBxifziQemed3QyVIl+DLA8WTdPKH7ir?=
 =?iso-8859-1?Q?4jtLvi6D+esmOn8rsWGjL3wgjyoXq4bqZNXghTjKCqlwstKeWnt9QKf/Ol?=
 =?iso-8859-1?Q?xlvE1tCIeo59aXE02+8blsLNovqm0zeY8ipK+6bZBEu2yzq3zZOAdYJrsn?=
 =?iso-8859-1?Q?L5BcMjzEo4U5F5xTHTbDsutoLlmRKZvdYbJqkEQ+BPCvb2Wa1iLlJx9/W6?=
 =?iso-8859-1?Q?2ACy1y9O+F5l97B7bNljp30sfCQZCJhywb19lhS0N9KXwjHgkN/QzE6uvM?=
 =?iso-8859-1?Q?F1qDXm3imlwgrqtVotO+Ydreb4z5HQ9cxzUDhAgt6VcGoATlvG6K1dylwJ?=
 =?iso-8859-1?Q?bc+s7F4jWMsjowrAnFeSKE1GaGoIQV7rv5F+IaNuXleZ07LAAu3epdjyMO?=
 =?iso-8859-1?Q?Tmf1Kk80YNd+j+Qzl4HgwMWMdf4fJVajRtIYhdbA3oQLMGb4mo6G6zRwIi?=
 =?iso-8859-1?Q?i7ddZl1zUeEQs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee72258-9aa3-48a3-67c1-08dc311bcd23
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 07:24:25.5154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y20q7goMgV6w0i/lMVYDHYyv7XMie5UcCNLo3MTT8iq6DzWLwRy6L1dymNdrtpNbh+kOMB8RIBkVQhr2W0eE8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7601
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
get_edid function will be replace by edid_read as community update in the n=
ext version.

B.R
Sandor

>
>
> Hi Sandor,
>
> thanks for the update.
>
> Am Sonntag, 4. Februar 2024, 11:21:49 CET schrieb Sandor Yu:
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
> > v12->v13:
> > - Explicitly include linux/platform_device.h for cdns-mhdp8501-core.c
> > - Fix build warning
> > - Order bit bpc and color_space in descending shit.
> >
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
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.c   | 316 ++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-core.h   | 365 +++++++++
> >  .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 699
> ++++++++++++++++++
> >  .../drm/bridge/cadence/cdns-mhdp8501-hdmi.c   | 679
> +++++++++++++++++
> >  6 files changed, 2077 insertions(+)
> >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.c
> >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-core.h
> >  create mode 100644
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> >  create mode 100644
> > drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> >
> > [snip]
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c new file mode
> > 100644 index 0000000000000..0117cddb85694
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
> > @@ -0,0 +1,699 @@
> > [snip]
> > +
> > +const struct drm_bridge_funcs cdns_dp_bridge_funcs =3D {
> > +     .attach =3D cdns_dp_bridge_attach,
> > +     .detect =3D cdns_dp_bridge_detect,
> > +     .get_edid =3D cdns_dp_bridge_get_edid,
>
> Please note that with commits d807ad80d811b ("drm/bridge: add
> ->edid_read hook and drm_bridge_edid_read()") and 27b8f91c08d99
> ("drm/bridge: remove ->get_edid
> callback") the API has slightly changed meanwhile.
>
> > +     .mode_valid =3D cdns_dp_bridge_mode_valid,
> > +     .atomic_enable =3D cdns_dp_bridge_atomic_enable,
> > +     .atomic_disable =3D cdns_dp_bridge_atomic_disable,
> > +     .atomic_duplicate_state =3D
> drm_atomic_helper_bridge_duplicate_state,
> > +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +     .atomic_reset =3D drm_atomic_helper_bridge_reset, };
> > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c new file mode
> > 100644 index 0000000000000..e6ed13b9f9ca3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-hdmi.c
> > @@ -0,0 +1,679 @@
> > [snip]
> > +
> > +const struct drm_bridge_funcs cdns_hdmi_bridge_funcs =3D {
> > +     .attach =3D cdns_hdmi_bridge_attach,
> > +     .detect =3D cdns_hdmi_bridge_detect,
> > +     .get_edid =3D cdns_hdmi_bridge_get_edid,
>
> Please note that with commits d807ad80d811b ("drm/bridge: add
> ->edid_read hook and drm_bridge_edid_read()") and 27b8f91c08d99
> ("drm/bridge: remove ->get_edid
> callback") the API has slightly changed meanwhile.
>
> > +     .mode_valid =3D cdns_hdmi_bridge_mode_valid,
> > +     .mode_fixup =3D cdns_hdmi_bridge_mode_fixup,
> > +     .atomic_enable =3D cdns_hdmi_bridge_atomic_enable,
> > +     .atomic_disable =3D cdns_hdmi_bridge_atomic_disable,
> > +     .atomic_duplicate_state =3D
> drm_atomic_helper_bridge_duplicate_state,
> > +     .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > +     .atomic_reset =3D drm_atomic_helper_bridge_reset, };
>
> Please rebase your patch series, thanks.
>
> Best regards,
> Alexander
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq-/
> group.com%2F&data=3D05%7C02%7CSandor.yu%40nxp.com%7Cfc532fc168004f
> 07439308dc2ebdf280%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C638436640551238910%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C
> &sdata=3DE1%2Fd8VTcDiXL3uhGDlHz7synQjRD%2BN1hDoHlbB72RiY%3D&reser
> ved=3D0
>

