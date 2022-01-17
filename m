Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F2A490A43
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:27:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9625E10E2DE;
	Mon, 17 Jan 2022 14:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8DD10E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 14:27:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=junHzR4jHROyyi/GPVXlq04edcTxCovLP5LDDWL0BD9UihSUOPgAGkLniyWBdqTMarCDdalDHGvjiuOchw+Feci5xNMF8/s1kGcIfGwu5De6PEGWM8xRmeF+/hLbr0ta0RfXQESV/IJAOvxMpw+JvEMcxhp9Zkenm28BO7O4JyAV9lNlz926Pu7pBW7XgctpFWzV5lH9YIbeCUYqPwoW79MnvhRcqvMK7b6rGx0Ouedm+B9uepAgcZjtYY1G7PvuzcrbRxI7zooahoEpYqYvCkwtZoUVJQyWcFH+5oDRIH+TjGxzM9EEtbHKUH4sXR4d35n9qg+w+ubXqsxNzX6PzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtNt+FM7+N2LWhyi4LbmJjvfp3Z4VtU7YslLkdjIBfQ=;
 b=BRAawlBivLN0g+qaq3npWybrGcRx+zko1sajvS2GENrGlpLg7xJc/xGXeJIsLaX6K/zBy3TpI1NgB+S3jvnNWUgvTPTYB6FAveAVuSAwOYOaHbw/pz97NHCIAWyEzBxz8xJxsxzohXjT0ZBLdaVy/+sMofAkc1gCvglS12xSZO32itfxbqgRypuYf1NoQu7sPZQ1llS0H9xgWiifryDR8WxLOt+aenTcHM08T9cE8JHPQ9zqMAxZTv2FqXfWv4HAU081gLdtKcG1iy+1Tkzr5do+8icR7hqHV3GWRZinlFK9pv25urxOpkR1TiXivgYbKSrV0usLj2NAySBH6etejg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtNt+FM7+N2LWhyi4LbmJjvfp3Z4VtU7YslLkdjIBfQ=;
 b=kZZtTq47Xt7nhngCVJ7ufHOHZVenM2OMnRKFeFhgIrc7dBRfpe3q0eA7sCkUiiFOYO2ulLnADNMPzguEWFnX40BkFiaX1JFa8qjaY71aM/aNEWUJgcWnNr6b7olOGoi7ZDyGEeIyURBPyNwPRb4GkwaYoh1PdgLjwjMhohgSNek=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB3978.jpnprd01.prod.outlook.com (2603:1096:404:d6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Mon, 17 Jan
 2022 14:27:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 14:27:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>
Subject: RE: [PATCH] drm/bridge: dw-hdmi: use safe format when first in bridge
 chain
Thread-Topic: [PATCH] drm/bridge: dw-hdmi: use safe format when first in
 bridge chain
Thread-Index: AQHYC60IbG8qGZ+c5EqsUkUuA5+zGKxnQ/NQ
Date: Mon, 17 Jan 2022 14:27:39 +0000
Message-ID: <OS0PR01MB592290D81CE917A0125C519E86579@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220117141750.1182223-1-narmstrong@baylibre.com>
In-Reply-To: <20220117141750.1182223-1-narmstrong@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4384cc6-0676-4972-d8f3-08d9d9c58413
x-ms-traffictypediagnostic: TY2PR01MB3978:EE_
x-microsoft-antispam-prvs: <TY2PR01MB3978F67217ACFD76E646D1F986579@TY2PR01MB3978.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DWPyfOuKDHFZotUfNDPGV4Z2pckcIi7X2yzhyuWwD1GQVT3rTVLk2eWVKsL63tVYzw3mjSpU8e2Tp4o05l84DzFLWSNN/zuPgfbWp9HCWjBBJ47wmhE7qZEm6lA6uJIzzQo3W7ZjxjEcb1cpzW7zXRBwHrxxUeGsfG0jToQuShzlAYGOdGJEjWGkq9qaYx9kqOjYEZGCtyzg9Z0gRfcprRfMptdvoYzmqeeamcld4OKTULUF5fOeREY1MF9oaabaM9poPxsD+tIVibEw8HBYq1XXyJiI+0krLQO1TwocWsixGM80PsZc/rY9sHHhnwvGFW+62WjRx75IGyNBVDlRhtBeKSpYknqdRuk1x7WbyM8kRBqFmLds+JHcevX5Ultxx7y6Fdi9Iu+21Mi12/M4P2ThiH60KakJd30TeDnPIkLsFEk7mWzUmVbEZ+UiFE0moCZKNHs1CZOWeRmAceJ+w+hbGcta2KkamQnIpP8kUZJn3THEjK6kcB9PyA0F9U+9Msp9kgH/SpUat+FiybfCMRIXmHRXkHlsVxaVBO7irwoTST4dmbuS8/pCPy8MZkm51J5NSAEOT6Hjwt1t72FPWEc6BCC9txE9i7pbhWcnie5yw0KSawEPuEAQVX8eA/Ba/vR80PZ6ChG5Wfv4GMLuapXrDWIXV+FHpvR7MtxAmX55xV+gTClEcXCkThMGljXi0hbQUC3vV9ACJKOERn1Zvg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(6506007)(7696005)(71200400001)(54906003)(33656002)(8676002)(5660300002)(52536014)(9686003)(8936002)(4326008)(508600001)(316002)(83380400001)(38070700005)(55016003)(38100700002)(76116006)(122000001)(26005)(86362001)(186003)(66946007)(66446008)(66556008)(64756008)(66476007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2FGLnTcJbbyPqT62+Sx5fs22KK322nBjtOwd2Tje+IeJFN7AdL9YvSM++Vek?=
 =?us-ascii?Q?1t2uJJxUrqwyyEP2JQKCRbY++AgB01DoaMcYwCMmo3RqXdTObLuR+TTSZpHE?=
 =?us-ascii?Q?R3jqq2o2eS/ExeHKUel6ibQhmUKhdKFkTCr062I95Ae1M9Rhisd2QKYXoPf8?=
 =?us-ascii?Q?xTFceGTOkZmHsJFJA82p0SMLZigBRtPsXGVTiTwvsi6Yxvqp0nINfXlzQcC7?=
 =?us-ascii?Q?5abdojknrS0wsi24+Lj0S19gdkCf0NJZhEMHF59jnhA7ftRZA+nkFuABxAUd?=
 =?us-ascii?Q?RcLmYam1898rz1T9W0zKemV/3nJKtCRPZmPFG2oTqTAiI6tHgs1hLaPI8ZBa?=
 =?us-ascii?Q?5wn9gSaWhVahBhCSHq2nNgrSY4TpVs5VWL5aWzb4q6CxWpxhu00wqFl4hB8T?=
 =?us-ascii?Q?2ti8UsqD5kzn7Jz64MGHkC/UBc8olKdX+tWoJe3UT9QCwaB1FoTqMkfODlMS?=
 =?us-ascii?Q?JKR4DlAkgr7fci/EFzOgG5fqiiHhF/rSWxSqHMxJhhZ9K1KXABekyni3TWJD?=
 =?us-ascii?Q?Owyqz5I9T4ZZAoAXHMpVl4KBmBh7JlhZ6ujM/7mw12k6CPwZ191Z+bsfE00G?=
 =?us-ascii?Q?Dc//ou601PNx6fWi0p8FWGlLcsU0F2xWctic4SeVxmJp/sQZwd9KG0ICgc3y?=
 =?us-ascii?Q?DCgt3h+f673824c3YzVULR8pv2HudVh3mh4M5XMC+uAI5vOa2YGZNr+YA6LA?=
 =?us-ascii?Q?h5W7Mh7wNKBnwPRB+tkIlSAYvJU/ZuncQunyDyWP0IhWu8VjnK5EgRAfFcXx?=
 =?us-ascii?Q?VY9njSbBmKqxphhiZECWh7ZCEJs4Du9TOETx4JW8MQ/0ldwIgEerSv9pefxq?=
 =?us-ascii?Q?vZJH1uN45mNVshxWQgpCS5Z3H/iIpNYUDJSrX8WcTWfhUjlZk0GblRfdh+Vt?=
 =?us-ascii?Q?jLkvu+JDcJHj4smcaRKG4PqaY5xqX0aaj+YtAqK02eseQpLjn0mJD81FYU0/?=
 =?us-ascii?Q?hFQbFqIYbp1Krs/iEScntZMdFq3JpalIOeu3qTachyIC0/HqHkOFUl9ILX8R?=
 =?us-ascii?Q?nYeDYY1+pwgCPDRyC+qum1W0e7RJioFKt49YFUOq93lQIZRRrRcXspaCDHcT?=
 =?us-ascii?Q?Y+piDP72wZ8AFshW0nXhMirnpfAmL78lNw38DZNJFMnrt9mfCJtkSIrYT0pv?=
 =?us-ascii?Q?DyPSVSPav56hoKaPOAE457dWkEqbQp37DOFgwu9i1zn95poFEjnlPjJjaJ7z?=
 =?us-ascii?Q?jqIQOSjEiRIM74n+k+MdZwXLgexEZhpAkcLy95CwviqyUvyd0CzTz2hdLvw/?=
 =?us-ascii?Q?f4ObltjuE2YCUSJQaiShnt3DunOH+2koVUsUjhpLCz7/tl59/4OMdX6giIXY?=
 =?us-ascii?Q?nUNMpsiJsSll3dO3pQen4NvHjd35CdhBzwreVNIJFglxMb44EmOLADx2bXFl?=
 =?us-ascii?Q?qS1gW49znpCYekMfOpBtl9LtarNO/FJ8+nhYNuG4k8K1B5VHgV7tWnf38G/5?=
 =?us-ascii?Q?e72cptcDs3LKqzqSfvbfiPZ04zesFgl/ZAXn+O0sGLAgA5uOl0+oa37tYF4p?=
 =?us-ascii?Q?e/nxDmRhmR0PQZARUZGO4pEOD+U7D8softxjy185KAgmFi3Ndq/7RJsxsVYN?=
 =?us-ascii?Q?C6IDn8xUdT3vmHO0L/UQk72DWX2m7ji0iDkIpBTC6GgRa2ghpAVOPtzZyVg/?=
 =?us-ascii?Q?RiHRqa9O0jb7fGHRAZdkwbwBaU7mtKNHm4MZjdnu0y5amVsYZUwtF4y9A+Ls?=
 =?us-ascii?Q?DWXEnQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4384cc6-0676-4972-d8f3-08d9d9c58413
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2022 14:27:39.6063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3g4wo81r8leelW34AyIpIlK7MOYnWkltu6UVu002f++aaAQe1R3auVVvVngLJXddMNsVQ368Y5nuRRsKOkDXzvbELOIUcZPZQiq0SxEsPmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3978
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
Cc: "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Thanks for the patch

> Subject: [PATCH] drm/bridge: dw-hdmi: use safe format when first in bridg=
e
> chain
>=20
> When the dw-hdmi bridge is in first place of the bridge chain, this means
> there is now way to select an input format of the dw-hdmi HW component.
>=20
> Since introduction of display-connector, negociation was broken since the
> dw-hdmi negociation code only worked when the dw-hdmi bridge was in last
> position of the bridge chain or behind another bridge also supporting
> input & output format negociation.
>=20
> Commit 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts
> callbacks") was introduced to make negociation work again by making
> display-connector act as a pass-through concerning input & output format
> negociation.
>=20
> But in the case were the dw-hdmi was single in the bridge chain, for
> example on Renesas SoCs, with the disply-connector bridge the dw-hdmi is
> no more single, breaking output format.
>=20
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Fixes: 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts
> callbacks").
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 54d8fdad395f..9f2e1cac0ae2 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2551,8 +2551,9 @@ static u32
> *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>  	if (!output_fmts)
>  		return NULL;
>=20
> -	/* If dw-hdmi is the only bridge, avoid negociating with ourselves
> */
> -	if (list_is_singular(&bridge->encoder->bridge_chain)) {
> +	/* If dw-hdmi is the first or only bridge, avoid negociating with
> ourselves */
> +	if (list_is_singular(&bridge->encoder->bridge_chain) ||
> +	    list_is_first(&bridge->chain_node,
> +&bridge->encoder->bridge_chain)) {
>  		*num_output_fmts =3D 1;
>  		output_fmts[0] =3D MEDIA_BUS_FMT_FIXED;
>=20
> @@ -2673,6 +2674,10 @@ static u32
> *dw_hdmi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>  	if (!input_fmts)
>  		return NULL;
>=20
> +	/* If dw-hdmi is the first bridge fall-back to safe output format */
> +	if (list_is_first(&bridge->chain_node, &bridge->encoder-
> >bridge_chain))
> +		output_fmt =3D MEDIA_BUS_FMT_FIXED;
> +

Based on my debugging, this looks redundant, as get_output_bus_fmts already=
 sets output_fmt =3D MEDIA_BUS_FMT_FIXED,
And *num_output_fmts =3D 1, so the function parameter output_fmt in input_b=
us_fmts will have MEDIA_BUS_FMT_FIXED
And no need to override output_fmt value.  I may be wrong here.

Regards,
Biju

>  	switch (output_fmt) {
>  	/* If MEDIA_BUS_FMT_FIXED is tested, return default bus format */
>  	case MEDIA_BUS_FMT_FIXED:
> --
> 2.25.1

