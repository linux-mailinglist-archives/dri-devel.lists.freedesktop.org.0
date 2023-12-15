Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86421814450
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 10:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2661710E220;
	Fri, 15 Dec 2023 09:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2097.outbound.protection.outlook.com [40.107.114.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A6F10E220
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 09:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKpzYXrE5joSEtGKhJzNRewZt1/PY1hf5MMpO3dwHic01BFqVAD1Dv4ZxwgA08nPQgNJFjUkHtP/pIkWfNoVn/DNY7VpJsFXo08MoXLyNLAbwzl9u8nsAGe/VFqdnFop1iExXGpr5kAbjTjrCIZ8+NMwIi3hJLe6qArVUffGPAtLsSUpq2qY0RhiXZaogwBxx0n0kAg+f1/m4NvLcetiRGyg0eB/HzfyLygIPbYn/onSQXZ9tVmp5SqXLqjpQLPwskbhJoTaZSNeKqfhALqW4WDStL0YWCdgQrcUFBTw1095DnCBhfH4WdEF0Z2SybcU19Ctzx5qDHBgbYBl3Wgm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHlXBPqoT51Ts8b2S6hrfWmIm/7nhnnxDWaLsEHLkZo=;
 b=JjODsrLcPwvlkFzIh4N1wR3ElOps6vuThxBucBng0nrKrOvnfFFbZgK4iZYSXAeHGmx8sCPqUj3N/Ccr1TOT32fA67+uxscwk6ZUNUK6nuBwtBBNKmWkWLlgVtUItSczHLsIU0x0uMUiaIGZVKGTBbGKMiBPDXHEMHuiYt4rWPWYVXdk3fFmbVnlih8avHBJ+IheskyJ5PTLJtmETx4bxa3hoqg5ubIxo/00azYHGi7F/Uj+TqdmRNiyCZ607eMnkjsmnCoLZCjlN23IKpxqCi0mMCRDNBCLvL9YXep8W8jjcLnp3Xp5NXK0JuOnoy3xmCIYYA0V3ECvZH1a6Kxceg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHlXBPqoT51Ts8b2S6hrfWmIm/7nhnnxDWaLsEHLkZo=;
 b=bJ6Q4Qq5QH+0WrfzFQzSNOVNOlnbPzhl7z9Hi30v/MzhR6YBca1i2lrjfUsAHgayzcKZ0Su0CIn2WqC0CeOuqSEUzuN3MnbNY5MoIdK3uaJoEe+CcEN1IItzJsIq8lxXHbrvMCvOPT5b0unSS1NEPNuczl78UTOnfOuYzt7CQwA=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TY1PR01MB10706.jpnprd01.prod.outlook.com
 (2603:1096:400:31d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.12; Fri, 15 Dec
 2023 09:15:40 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 09:15:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Thread-Topic: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Thread-Index: AQHaGIfbNkLqQJf+iUioLkutiw4N1LCqPUPg
Date: Fri, 15 Dec 2023 09:15:40 +0000
Message-ID: <TYCPR01MB11269D843BCF84CC0335208438693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231116122424.80136-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TY1PR01MB10706:EE_
x-ms-office365-filtering-correlation-id: d13bfba2-705f-4b60-0d4b-08dbfd4e685f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: POeUPOgYbcyvJ7ZTcNt6m5TlsCNmxxMfOu0KCm6nQVB1AyaHItTE40puc+QCymypv2xWwLs2zC/r7nhF+Z5I2c+4Yw8Eja/acU4oI3tNT18bmMi4LQ5aymGyDCHmoVAGAwr2xuqDB3jrQXAr68oBoDuIEcPbDm8CcyP1LXbycA63fMZXT7n2QTsI89k8J8wplBEWmF407DsBlDisnlwZgQtl5D0v8AUSF8nt3AxGz5CWx2uK+5/QNAod2VJPPcVlvgBJ7JdiV6zgaJOJerdVm79WdIBnfVmuuZE+lKyDgkq104y2IoCTfHGEDzzjP5dEIEeiu2W5TOnP1cWijk+pMoMxw8w2RPBqaRhEYQ8OU02fw/yKS60IIQDB/Gd9XyUz70B/b6ZL16wLv3oztcgaal8hdVEmgRFgWiBzNrr/nHf5xDPdrhtBERwLtplGA5dXHHdDZzx0FNOxNRXosxJCmT0nSQ4djD3plm+tqJIwmcZCf7of2emAvl/6ptQ1lU2hbo2OgMFdrjpLwFfrbs5bcC0phFxpoDeP/GyTKVO8UOfS3Q+omUHKQhXWumtHInY3LsQzgXFlA2/yrgn/NdT8hoYi5tHHJsWKm8ZusyTDXg/YnbkKnsRxo8xGCBjizSaF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(26005)(6506007)(7696005)(71200400001)(53546011)(9686003)(83380400001)(5660300002)(52536014)(4326008)(41300700001)(2906002)(478600001)(8676002)(8936002)(76116006)(110136005)(66946007)(316002)(54906003)(64756008)(66446008)(66476007)(66556008)(33656002)(86362001)(122000001)(38100700002)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JhhHFuLDfnxKJBgwScGo3Utw+we2QKSGH/4ZjYbdjkXrIUaS+839PPpGp8Ol?=
 =?us-ascii?Q?GKifJOwdPBkbxwwbEIMkAIOIqbglOGra/KfPu3sADjcdN7QH5NP/7D6fAbDf?=
 =?us-ascii?Q?0oVsiXALRi0QGItRx8kXYiVW+b64BNWIOPSsXkD8kJZrBaFW+wqlsPCyw7Jd?=
 =?us-ascii?Q?fV+tBb3vEAEb82bCtXTnOCuO3Qq1hkOVfWRnxpWZHUIgvAU9mem4jt+pJI14?=
 =?us-ascii?Q?Xjc3wk9y8GOi0H3dG5TdHJQ+8vfPXrY84uMhoitmhaKXLwbbqnWG5ECN3rQR?=
 =?us-ascii?Q?QNKHx/vYNu3XcazyUREkWKmvUVFh7YKAnRDLaB6ne68Zfg+ldhulO51lSkMo?=
 =?us-ascii?Q?B8tgaAFljMogXiExVJCO4qxaVq9gJN1v8Rz8v5cmtz317vpqztXNzCLhtOan?=
 =?us-ascii?Q?SWsV9mrvzbfZLNfu0ouUy3OOHf0v5Kq6Zd5+iEF/8B3CeO4ECTh1OPEcaCGM?=
 =?us-ascii?Q?6Ick1ITu0jGHBinyFbK/EultL3rLsLcwAXBxtiXmAhjU89u+GREd1/5eE6eY?=
 =?us-ascii?Q?NAfCgD7XtS1t9HKncG70CIj0tNUR9CVfRvDzWzVdjCkQgOMHsiABXX2gNopG?=
 =?us-ascii?Q?Fg7gKnZImOZTUT22EbWKexCyczet7RIlvPnyCFA2iIgj6Szrb5mEziUZYavu?=
 =?us-ascii?Q?oQaSqogx2CkPkzxKo8oCyiUiHNGNQuKw9YTbX4BFAy+YEexusufK9kFdGvQ9?=
 =?us-ascii?Q?KaeX+3pWEFG+MRBwA4M66YmkCLMtb5r/jo7t6x9VPvRooSUmeTiRUw2b0JyG?=
 =?us-ascii?Q?7sBTVPnLEH51244qAupTTMOlCv2N/2jqQw8CKTs5EyWXvHL8/xNnqzyjvWoS?=
 =?us-ascii?Q?XBvAwELDKoYbKbmJhEh4niYdR+cJ1sPQhA5FBOfNXCbVgykpfBEu3b7llsyc?=
 =?us-ascii?Q?aE2Zqa+2JR5TKLzC9L4pnHOvvk5AUcqsDGT4e59UaBZuA+rjGmxLqCzssqjf?=
 =?us-ascii?Q?I3vi2+lZCd6E1LLHHazdVssdu6SbXXFaT9DztgRXW6h0qGbEvZ98KavIWW/s?=
 =?us-ascii?Q?PrbwawBgz0AdP+soVJdOoOGbz/OjhS8w1uSf2KNuGKivQI9Qw1DkSwheVigu?=
 =?us-ascii?Q?wrDfxCFmZJKC7ndZNDJyYwbRZ055bDd8fo73OCgq4kij8+Cgw+t4kQrRoPoo?=
 =?us-ascii?Q?3i/LeNobT5i/77XCMRd4Y7SRtsl1yM2ufZkpkXWqgMpapqu4MNBKS8vOQoE5?=
 =?us-ascii?Q?yoryfUGG0ruYwDG7XYZOfEZVURxjkAaGrZBkNtxDcvw9vbiec6MZagrBB7/B?=
 =?us-ascii?Q?ItKD37E6VMddTh0GnKHA5RnQGCjKTiOFGq52BrEVsQdIZgvPyHRCkk+3Zwjv?=
 =?us-ascii?Q?v2A7M3+/lXtuTYLgewQjveNbwOGaviAJ5PkIINxeUDR4IdG2djf9gQu+uWZg?=
 =?us-ascii?Q?njNBXfnitrmt8APSGYptmlSqe3Hrqzhxssq4me8ynRWOpftmAFOiHBcbO+Ie?=
 =?us-ascii?Q?XywsJTOet+MtNisRLQRrMGpWBrDlh+JtZ/f412HlK7/ONL6RO6ZmJGZlM96h?=
 =?us-ascii?Q?EVis2Xbqp5+nZC1LvmcRdlbe65X83ig6S2OxSvb7307NopCZbICa56hUkEKa?=
 =?us-ascii?Q?oeq9u3utxoFQGFpDLAO+IoztHWloJePm95yPMZvfc/I7vQskxosyp2XV77eR?=
 =?us-ascii?Q?Xg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13bfba2-705f-4b60-0d4b-08dbfd4e685f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 09:15:40.3297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AbqGGY5giLl5nY34voNqYC1QbY0zy9xir1wUYFyyAz1OfvrtqvIwWgraxpSj7vao8WeNLqX8HF3a6VmJ8lbA1c+cBCrcjqF385ZiBkh6ozA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10706
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
Cc: "biju.das.au" <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping.

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Thursday, November 16, 2023 12:24 PM
> Subject: [PATCH v2] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
>=20
> The rcar_du_vsps_init() doesn't free the np allocated by
> of_parse_phandle_with_fixed_args() for the non-error case.
>=20
> Fix memory leak for the non-error case.
>=20
> While at it, replace the label 'error'->'done' as it applies to non-error
> case as well and update the error check condition for rcar_du_vsp_init()
> to avoid breakage in future, if it returns positive value.
>=20
> Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the sam=
e
> VSP")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Replaced the label 'error'->'done' as it applies to non-error case as
>    well.
>  * Update the error check condition for rcar_du_vsp_init() to avoid
>    breakage in future, if it returns positive value.
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index 70d8ad065bfa..4c8fe83dd610 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -705,7 +705,7 @@ static int rcar_du_vsps_init(struct rcar_du_device
> *rcdu)
>  		ret =3D of_parse_phandle_with_fixed_args(np, vsps_prop_name,
>  						       cells, i, &args);
>  		if (ret < 0)
> -			goto error;
> +			goto done;
>=20
>  		/*
>  		 * Add the VSP to the list or update the corresponding
> existing @@ -743,13 +743,11 @@ static int rcar_du_vsps_init(struct
> rcar_du_device *rcdu)
>  		vsp->dev =3D rcdu;
>=20
>  		ret =3D rcar_du_vsp_init(vsp, vsps[i].np, vsps[i].crtcs_mask);
> -		if (ret < 0)
> -			goto error;
> +		if (ret)
> +			goto done;
>  	}
>=20
> -	return 0;
> -
> -error:
> +done:
>  	for (i =3D 0; i < ARRAY_SIZE(vsps); ++i)
>  		of_node_put(vsps[i].np);
>=20
> --
> 2.25.1

Cheers,
Biju

