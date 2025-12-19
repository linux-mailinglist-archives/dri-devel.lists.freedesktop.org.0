Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132DCCF336
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 10:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C57E10E1BD;
	Fri, 19 Dec 2025 09:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pLiWIPBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010070.outbound.protection.outlook.com [52.101.228.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE63910E1BD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 09:49:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FL4AADiPRC4yNOT4nup9NgfcF8TSN2GktiOsKv69JNh8HZfpkDAGJXnqzpPhJ+Dm1mJzAzuyTlv91Y6CoAkeTLk0AMeS3gMhEuNiBdmzuDchkpfvcl+C5Qc9F7QJR0shHQEIY/ut9V6mOReIXPe/MV3NGnEzU4OCGXeiyzzbpOjbcKXj68u6BPsxBf+5vSH/HFp1/u8J66zwu10+betmtHfQtLfYwv8hyAyE97LV50TVPw5Sp+6zLdg/9uRHF7OEkEP40kvKchPQmN2sIdeJjapkzZJbGimi/xhxBGo55nvauIxhRxrW4ALbsgX0AFQtQg1ypnTBLHRO+HzHjzuhig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNtLemDUj8IVWqIXRBloKdz9mlCLCS7RRtKb9GBnXy8=;
 b=szufwCGbpcQJWvQNHe5zbcMIQgMtlqZ3TfVzLqenLDHY99ctQCXW8CJ1FPwfPhwXetUADI7qxMGBWTS1IJgavZu/CiSPGLDbtrnJZX3BwKGz/eenvWE8GU2Pb5YUBS3FYcWzxUb/z1Wg52HU5nheFL4NtuIT8IyDQblBsmenD+yL6aXE1TpODxkmQgkGJI4ntNlNBp1noqO1b7aYeRndfvjxYeJ28y9nTFER85F49Znf3eZLGsAM/sYn8xbld4ip2rbs2REHbPjweOXrCVHLmu8+INkYn7k4ChtyysNZUYiVyLXCzDchMjzZUxU+FO0+bfx/zr7fDryJT8ZUINXz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNtLemDUj8IVWqIXRBloKdz9mlCLCS7RRtKb9GBnXy8=;
 b=pLiWIPBDPm0jCMsHBrYTd3qn9SKrNs3DnJaTCGeuwuIOM07jDgdqIihWy/Fhg+eZGCiO6ZljdjhIQ6l1EjbQjUY6Fh8dSBQf6IcBBzBOss5XJvUonyTXBKnOuIN6lVLK0zR5NfSdhlI8eT1tUtq1bcNBwGeIsVcnJRj0eQuhDTI=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY1PR01MB10850.jpnprd01.prod.outlook.com (2603:1096:400:321::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 09:49:53 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%2]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 09:49:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, =?iso-8859-1?Q?Adri=E1n_Larumbe?=
 <adrian.larumbe@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Thread-Topic: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Thread-Index: AQHcZFOA+GIugFCTB06Le7W8wzatY7Uo0NWQ
Date: Fri, 19 Dec 2025 09:49:53 +0000
Message-ID: <TYCPR01MB11332FE6BEA86E8FBBD4707DC86A9A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY1PR01MB10850:EE_
x-ms-office365-filtering-correlation-id: d431faa0-8a2b-475a-7daa-08de3ee3f5cd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?8Kw0QpHBnMB+djVwgFb+Jbp8P95tpZeoCmeWgUGTT+Y6OzwjmbdJ0Qag9A?=
 =?iso-8859-1?Q?L2Aq7wO4bRM91QFsn7tuiuF+OMC/JhwT5gcn3waMCVhYAm99wmc8mRiygG?=
 =?iso-8859-1?Q?0qYmOTQQMV0OESzAWzZ3cct9yO+ILCuvG8yRtecTOOna7MDMvvkmtYumLb?=
 =?iso-8859-1?Q?8Nxb8KmtUvUbrtcUWuDlL1UrvOmRYMG1vj/9n0qMYLaDBudYJDl249pmzZ?=
 =?iso-8859-1?Q?tSp6qRhPj2c+jFLkaW1cZIQcPtMuMfOs+n7I3fiVJ4tHeUMggiLpGFRwA3?=
 =?iso-8859-1?Q?vGJIPvCvU2b5OFNwl41nEHaODgAHs60GSu5b2AqjIOjSVJgjSXYtnrgQNQ?=
 =?iso-8859-1?Q?9fpIwAAY7L3o4cIbT0WvKgT48wOmZiNaPuuNV2RC4PCt9w6fstabZ99iT9?=
 =?iso-8859-1?Q?Yt+R1z77aOSLciK07WHJcVHXfg0/r77BoZQSimnCgfXavDplxGyFGn6+OL?=
 =?iso-8859-1?Q?qrrFLja+hLAOZTqp9ZlPsdqoWknBJ1RC5pNFsE85PFIBZIBwJeIrGGmUfg?=
 =?iso-8859-1?Q?SyLCQvQXCWXAvyByGKB6Ex3wOHMO0QnXmOCi+UNPmnM80q/yhb4X9/FH1T?=
 =?iso-8859-1?Q?AqORCruFVHhnXM4exHHEefFPcKzF4D/FvkSPuP2iKM5N9lkFb0B73UQEvE?=
 =?iso-8859-1?Q?ExKqNE1/SxEtB2NkIuEe21vUNGMgCSsCnJmRcZBoz4jX4XVq9alSTIlmef?=
 =?iso-8859-1?Q?P7rqe1kk7PVD+1pNStVRPvt20JkF837wIEu2ZYjtN/9vMHuEW3D5YbWzOI?=
 =?iso-8859-1?Q?OO98RjUMml5JeaSSsikue3zPYzSlJlZnTwaHt5n0BcM0LtV/EQbuj1miPC?=
 =?iso-8859-1?Q?T82vav/bRT+9paQ8weMPwP4SVbsIrvITY99yYVwIV386R4lTZ4SA7u0zVo?=
 =?iso-8859-1?Q?lS4l4jEde0YxzwVJMauwbRqJMequ2oUv3K9zLh4EznPnHkatQOnOvbhXEz?=
 =?iso-8859-1?Q?0bQuI7r77r/8dp+w7GafCQ3C5/ylTVnMKR9/Axu1+H8l/SZC9WYJEg+iRZ?=
 =?iso-8859-1?Q?/iOVjry5vQKmeU8ae2GVwUuFKENeE1lhqFubos457p3x0vB/1iFWs1Rc+Y?=
 =?iso-8859-1?Q?kTAdFubZ8uJxzEISXCtkhqCVbJ1ppv/evmIDNKgQCnPvKqO+BUXRvCuTXp?=
 =?iso-8859-1?Q?Z82xZonF4NBlwWsiRsUngzCDB8F24VdVpAgHET4V06qexCLwHGSMQWRcsQ?=
 =?iso-8859-1?Q?iIRH5SeboOQjH4oNh9vtP0SFrMijG3jGtYhYFdeRmn4VahOPaljpQfLDz0?=
 =?iso-8859-1?Q?Iz0F/tcbz2H+wPl5Hjxus8e8zxDGyUn+6AOz00uLQilIOOmRl6MzyJJb0i?=
 =?iso-8859-1?Q?Qy5bctnPGdEo/4d9EhFVzrxvcrsDcSsgAo6RDmujf5ZQv8/CynK8FL2rpz?=
 =?iso-8859-1?Q?GujgUddF8WrAoesu/flUQhSHqtWcyVdj+yLf7UxLSXveE6VSwP0TQ+oofE?=
 =?iso-8859-1?Q?zPeZpqpj8YPGTpRjA/FUYBdvsKgfdWx9OqeS/Thn2H+YPSR7OrUWobwfQG?=
 =?iso-8859-1?Q?Pr5kC6xMe+QpzP2NSe7VES2b7Mc9Mymu5nIg9uBpBk5RTfcJ3RqYKhf/K9?=
 =?iso-8859-1?Q?6vwRee6ZJVIVi4bK0N81yeX7RWu8PhGsN5ew/V6a/kVNA8h6wA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MVdw6szD3n9K/QAyZ4WdXZhdy73OMB0rB7IblQf6cXMBrA5vBS9CRsu6ei?=
 =?iso-8859-1?Q?ftfiyL5T33d7hTbn1bDpiQPyw7sCodGDgNalx1QSsOiVyW8i9DZq3BpMDu?=
 =?iso-8859-1?Q?6WvvL20YYsjaJdj3eCoWs4ERgKZ82gaE5pzSZN4RLkb3GCAZ/IluO2uuX0?=
 =?iso-8859-1?Q?dUncaHDLAEvN1aIl9aNX2f3YFUKJcL0tnXeTb9gLfuWG4EbQ7MsvyAw4By?=
 =?iso-8859-1?Q?jCoYZB6uQrXcQ2NqCAvNMUHVaSRrUrh3YIYAj91rvnUE4Ol2/ryTcXUAYM?=
 =?iso-8859-1?Q?PEHz+76rVOTdtO/KNJBdl+9+vFE/NvTd54UrI/UM6R7UgM2kU66fntmkv3?=
 =?iso-8859-1?Q?/Gwd7U2j7CIcySi78DW/I7+Siccsfr/7Df7CplqTBI55BlKXm+cmXPEVhc?=
 =?iso-8859-1?Q?nz6ihzkFW1jZNknQt7C9XmuVamiMw5PA4SW6votZetyL0XlW8rFfbckQbk?=
 =?iso-8859-1?Q?W322g/axUasremZiIb+unwIJcXLlTfMkJVqi2i6l8mXMhU0vd2EZa91K1k?=
 =?iso-8859-1?Q?K8YEE8Snk6uooVZTjjgi56KGPEnULwbJ6qJpHf7pf3fzCkRpHJJT6nz/r8?=
 =?iso-8859-1?Q?TTMOcQbTvC3dT+PiTO42/y4OcxEGxHHeXVf8WOU6I8bFObQlkcgniQkd1x?=
 =?iso-8859-1?Q?CSvApPZep1uQ3TUt/ozWgvp7wAyi+GWI3Z0APiSCLAyE0kuI3mYTLzMSk2?=
 =?iso-8859-1?Q?eK7vH/AT0r1uetY9xGHK/G1KQ2u6ILSnLpsxYtHAIvX1PjjNCANPvAtVPs?=
 =?iso-8859-1?Q?fCKv1fZmO3kqoBgnp537LjwDQYIsyN9ZzZpAYEYcwGJGpcPhNLK+1zsXFV?=
 =?iso-8859-1?Q?tQHA4GM1O9wt6pJBLn5MzJGIbuFMHmZy3AfVYvOAif6SCewtTBmNy9lBys?=
 =?iso-8859-1?Q?SURd+sUIzTeOYC0Ux0XBAzjUsPoNxRrroTGgoESKDzSz+f/cmQNoeWxkfT?=
 =?iso-8859-1?Q?+gGnh0YJHovXhnmwBdQNXyQsl2FNcn9LfX2HiYYT4QRwz5MFex07UGs5KD?=
 =?iso-8859-1?Q?T8smZM/MCb8gx/ObocqOUhadsorGrILBrfkqA+XEWl4IWQh5AtMFy7nofM?=
 =?iso-8859-1?Q?sUz7vS5BY8oMx4LN8YtEb/kBu9pprVh38dYKE8x0QSuO2ubFgXHgfw43X5?=
 =?iso-8859-1?Q?LbooLEpii0tbv94uXu9FDXA4qZLO+eU4mmF6aOGWbmKCED7E180ML1nIEP?=
 =?iso-8859-1?Q?g15zdkTqeDu1KaBbmcI8Q8CHRgngBiRI0vrnpUi8yo1lETgAVBAgGWvrhs?=
 =?iso-8859-1?Q?p3BzArfjIdh0UQHwCc6UuKyV8kQrMabIvpSTE4HEo6etNh16Daz/loPIIc?=
 =?iso-8859-1?Q?oXUSh6hwcfJ7wRCkjn5fNio2QO6VrLqeVu2IObq+fWUivL5VCFoDum0WvH?=
 =?iso-8859-1?Q?qLAFY61O/052MYtus05kSE8UQ1kIw9edBz85IyGSZCTjKV36zVRGXFWLHi?=
 =?iso-8859-1?Q?8T/P5WUB4Wy3Dhs7ZDaOhhcPeVIjo6fv1mwpxT5BEfwIMbenka1XTkKbOy?=
 =?iso-8859-1?Q?lR11vpKdVs5Bwroawyt62mqaM61agcwsONm4qQXug0cZU4AaLewShwGsva?=
 =?iso-8859-1?Q?1ZAnEFqpsfr+yPtcFGg2s8SUHA7Z8UrWbrgPuS68jLGCtKuNoFkU6Ni3cs?=
 =?iso-8859-1?Q?+zNlSvOR9bWKVvkQCQGXZKGbWI1s0YZE50G7fTmt//yIhv7t4SFIVfng?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d431faa0-8a2b-475a-7daa-08de3ee3f5cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 09:49:53.5155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jo7cM0ATvxvNa+q+dZLZtIhFfwgdmAWocE5QwwJbxQYEg3zVMPkRZAb0gZRtrr+nk/of9+07twSIaV+wkkpqzLcY8eebh52NWGXiTsKWq6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10850
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

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 03 December 2025 12:51
> Subject: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> RZ/G3E SoC is embedded with Mali-G52 GPU system. The system hangs after S=
TR in the following
> condition:
>=20
> STR -> Wakeup from STR -> Unload panfrost using 'modprobe -r panfrost'.
>=20
> Fix this issue by asserting/deasserting the reset during suspend/resume.
> Rename the variable allwinner_h616_data->default_pm_rt_data for data reus=
e and make it as generic GPU
> PM runtime data.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/pa=
nfrost/panfrost_drv.c
> index 7d8c7c337606..e553f183c780 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -976,7 +976,7 @@ static const struct panfrost_compatible default_data =
=3D {
>  	.pm_domain_names =3D NULL,
>  };
>=20
> -static const struct panfrost_compatible allwinner_h616_data =3D {
> +static const struct panfrost_compatible default_pm_rt_data =3D {
>  	.num_supplies =3D ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names =3D default_supplies,
>  	.num_pm_domains =3D 1,
> @@ -1056,6 +1056,7 @@ static const struct of_device_id dt_match[] =3D {
>  	  .data =3D &amlogic_data, },
>  	{ .compatible =3D "amlogic,meson-g12a-mali",
>  	  .data =3D &amlogic_data, },
> +	{ .compatible =3D "renesas,r9a09g047-mali", .data =3D &default_pm_rt_da=
ta
> +},
>  	{ .compatible =3D "arm,mali-t604", .data =3D &default_data, },
>  	{ .compatible =3D "arm,mali-t624", .data =3D &default_data, },
>  	{ .compatible =3D "arm,mali-t628", .data =3D &default_data, }, @@ -1073=
,7 +1074,7 @@ static const
> struct of_device_id dt_match[] =3D {
>  	{ .compatible =3D "mediatek,mt8188-mali", .data =3D &mediatek_mt8188_da=
ta },
>  	{ .compatible =3D "mediatek,mt8192-mali", .data =3D &mediatek_mt8192_da=
ta },
>  	{ .compatible =3D "mediatek,mt8370-mali", .data =3D &mediatek_mt8370_da=
ta },
> -	{ .compatible =3D "allwinner,sun50i-h616-mali", .data =3D &allwinner_h6=
16_data },
> +	{ .compatible =3D "allwinner,sun50i-h616-mali", .data =3D
> +&default_pm_rt_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> --
> 2.43.0

Gentle ping.

Cheers,
Biju

