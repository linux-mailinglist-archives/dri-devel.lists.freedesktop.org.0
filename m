Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581939D48AF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 09:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAB210E1C3;
	Thu, 21 Nov 2024 08:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iWTGYf2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AED10E1C3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 08:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6FdubniFX3KATFhsyRJ9RQ/jzm/gqlomFRKi1myqMe93mjiLdQmO0SuEO6fLLMczAIl7LY50N+Ecvx0traSIsIA1IpW0KewTf9zrEHtUPTMSKm0e4pMhV3RtZt1e9ljc6CGTYk3tsZB+eKrWbgePq0AnFr3OCAiHP9U7dI4hxC2TEz3qW4DI4w4MbXp03xy0hg91xlYvCwHCu2zsBU3ZjH7wPLKJFxK4NMvEKLD2aFmb4prviCPYs0uL7c3uH+squsWi3OW8g4exPtpSQ+kvrkdXIOzvfuAjEnapIfPakUBzYd04rGHhIan7muz5Pv19gWIqZW8Cw5O71BpPqgXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJgdFhWlzRL1lPoc3KPHfVRM9vvUb8axUqywpjRm3XU=;
 b=VVsXX03qUbxZtSPRzhe2K8my61xbCbQB9uxt4Oldvl4+hkpCAdcutwwvDKTbl+TmnQdFZSRJZ/TC2Q3RPuceQqza2xPctnqFBmjaLm9JV/OudICQ2OYgsiMcw+gISlrDuN5kV/1mPKWVou8X2/tsPL84o/M+qq537d0QHuqJPDyPxZVCESeVemCAKITWwWQQUSjPIXmyUmkKfxLkxibH+I8Pq3qbt/gx9q+duFiaXN843qs/TZTCRHcJ1RnaKvjznSlOlB+LXLxJ6zS/ZeCQD4Jw7lwMNCRNYZA87BdVeAYfCciHpAioZ3+tDGFRLopSl0ep+pXdgLL3Jq+wlVY9KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJgdFhWlzRL1lPoc3KPHfVRM9vvUb8axUqywpjRm3XU=;
 b=iWTGYf2lNstXWX+apiJsscsC7L98KEjnLq2WM/ao/XINS5QQZtL5WSoqCfp5y7IdtwCN22uDvk1UXEIqHdr21QHTBP+nCYhNH5A9YS+n3HVycuCcJutu7GacyQ5n1MCv8C6rluf9kA0PAI6qQUgNlQDTOan64Wc2d/pjpdLdwww=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB12124.jpnprd01.prod.outlook.com (2603:1096:400:447::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Thu, 21 Nov
 2024 08:20:45 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 08:20:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Chris Brandt <Chris.Brandt@renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH] drm: renesas: rz-du: Increase supported resolutions
Thread-Topic: [PATCH] drm: renesas: rz-du: Increase supported resolutions
Thread-Index: AQHbO11syy9ggiKAbUeH3lMn2+lbMrLBZWuQ
Date: Thu, 21 Nov 2024 08:20:44 +0000
Message-ID: <TYCPR01MB1133282D199A38F438E25E8E386222@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241120150328.4131525-1-chris.brandt@renesas.com>
In-Reply-To: <20241120150328.4131525-1-chris.brandt@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB12124:EE_
x-ms-office365-filtering-correlation-id: a508be5e-bf1b-4570-e625-08dd0a056575
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TThXphEPWLIhPzB5pgTM4AydcNJQNNrefwub7TM3wBM3y2hxpR61ZmV9xpGV?=
 =?us-ascii?Q?V1vmmlNYq++MGHlsDe6utdHZ79/zWWSDcD7C8MqTz6YMG9NQN0YB27D26D/q?=
 =?us-ascii?Q?pIMSvb4fYLDltoqvatauRx888YvMGbsnNaAbU1PejlCTedsUVG9F/oC5YDoS?=
 =?us-ascii?Q?2IKWMOAL8wMNGzYMyAEXEbIW0xyD7pCC2v0HLShUFq8k3va2+kFdBQnBEb38?=
 =?us-ascii?Q?UeAvx5FpnIKzUxHWJiYir0nJqwxBY6ISh83EVXoGghxQtBgrki+sK8icVn2H?=
 =?us-ascii?Q?zlSAVFVT6kQIWIRYaSkBUnFDsRdNMjCQxQ+6MosqOhnglOBRqpg4kY78whet?=
 =?us-ascii?Q?iuwVIHQgngZaVW/6MDD9MraiiYbuaefvi+71VyzR99AQ7yzIsD01tdkqAEMB?=
 =?us-ascii?Q?cqktA7r+KZnQ4n2FYOU307/Zw3RYJNgmhQsLTwApj8GSwNE43b91dEJzPATJ?=
 =?us-ascii?Q?5ceu/8FGKfwdBE29KJHRFb918ucUhQ2/ugXP41kxy5z5myqbRbqtcA9yAC5Y?=
 =?us-ascii?Q?yakoq0S7roIrSC+ERvBPB4SbuG0cM3hGY3JLOpNeVtBQAFB7ubYB8ZtEFkI6?=
 =?us-ascii?Q?CI4A3T36XnJGhDTED06e0OBH6AUqtbt5qMibg0e/H8FfWDv5426noTlMCX+H?=
 =?us-ascii?Q?VllicIFM8BnZvxPa9A2Wc/QUlabClXPZqSfIivtCnS3ys6CUjGdUNysTNKYg?=
 =?us-ascii?Q?hsr3vlmTtLgPkN4vfVD263BeUB8X10Ju7KntwLSPhvt7y22xF3ERwx64omDj?=
 =?us-ascii?Q?NPz0uu0IdEyXduTta1WJVS7QRremiFMRhSeD7K1LzABc+hWhwBqxHHibc5d2?=
 =?us-ascii?Q?k02nhhGaBalN7sjIWm12s2IrYlxaq+dUbrbiJC0y5hUp2fgBhg2Vo1FxXvKl?=
 =?us-ascii?Q?A8OBUwiPlKRUHh9q+o4iVVMo10Nx+Do6Gx9kjjJ02rSiuuN47GoZZBSsI9R1?=
 =?us-ascii?Q?ociLQiS1C8QeVSpVnLARA9aDwriv5dNjw/fO2NbNunuypJjWMjVZy61A36K3?=
 =?us-ascii?Q?0te1Oujshg+g7mdhamET2b8Ra/4qFBDS2QmFCS2EUa/67E06ckk7+zYpjETw?=
 =?us-ascii?Q?3WneA4A1dnr1kHMj58/NYkwA05j7sYlxwuUcBQzs/ZzR9hp7TSbX5/t6UcfT?=
 =?us-ascii?Q?iIKuP+RB2F1eRZYieyGLmGJTp24HOMr4BqVTwZbsb2OHoLWVH7Q5nK6B2zJm?=
 =?us-ascii?Q?5hHYMQC/5TGB2Fhk7GPIzV4cIYPiXBMmGkZPHZD1luYS4sM48OCwsngEEEnp?=
 =?us-ascii?Q?eQ8gLmlv3A2DM6sNK6IQuRubsWTiZjK2zliaCDe1vKBNQONNnz5NG2xZnvB9?=
 =?us-ascii?Q?JAv5EI1vqvy1aU/73MdIhGf1hNycYl+n9RLV1jUy5zhlRNkZg8e8IbFu5Eu8?=
 =?us-ascii?Q?UyiaWrA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9oGQ3S8PT9d9s7Rr9oM4DyJwMSqqiM5Jydzpya+hNc3+/iSdZIAeJ3Lf4Eqp?=
 =?us-ascii?Q?oWeQC0wVniqPjQlE1B63QygnIWuEqqJFL2HmtN90+pSWVM9nuuG495tlEjvU?=
 =?us-ascii?Q?w7mM/N3a9UTdwLgJZjIBAxw29u5wwKgPFcmWa7/ZShxy8iWowmiyjrwEeeHe?=
 =?us-ascii?Q?iPtroe83cm8UBVTG2wlgDWAXIi+wO/WRgAGfARGE1LA8TMyzcGNjlClXtW8/?=
 =?us-ascii?Q?VCDFYZTjZj1v+UHG95/6xGtSgAOiF3bc0d9yaR2pEDSfDOckegcBLz3wghiK?=
 =?us-ascii?Q?zI9TgRG6j0i4AsEfsFoafAo1iiZqlCGRXZiyaupokg8CAQNp5YaV84/b+9Pp?=
 =?us-ascii?Q?IROZv+0NqYo/W4Y6EY/zIG6f0eeDy4DlE5e6+4QtgWrY4RUSWdKTm2gezcvj?=
 =?us-ascii?Q?idWOYT3VM7nF5HtKoIBCbnaAvSiO9WlQK+ZEnaydeeY5dI/Ke6/2VOqTQ3wq?=
 =?us-ascii?Q?cxn/mzjHsVzeGoMzd8rgNFALAgVkBzwCGAeUsiLcWRBp9tVO40k96zjps3vJ?=
 =?us-ascii?Q?oxCCHy40dh9fgth4+uF7Fjs7B4ohu9rUa2sOgo08Go8AjWNMhJOkRzMijrxA?=
 =?us-ascii?Q?47g77SaF90GSNSqLRXdEmmziQZ+pHj3i3qOLzoiGwNg3HKLxMO7SjFovWMsh?=
 =?us-ascii?Q?F4gzwtxrQ/SAhNViGX86Xqm3ZieIsqhK3WExCpWZJtPtO75GgNqmKZ46xkv+?=
 =?us-ascii?Q?s7VjtAu93i6bwO45row8XbVzMKdqptY2PiaHb5McJC704jjF/tu+jKlWIHK3?=
 =?us-ascii?Q?uapqTN80c5cNP7wawp3OHzM9wY1xGNP4v8uyeTSy2dB3zj/p/1DyDwwF3iwJ?=
 =?us-ascii?Q?I7rFktMJperRmXJL+fQ4YIpBRubxWnuX6NfPVogbZIdlz4NYHjen4tC/oxCG?=
 =?us-ascii?Q?svfc3/tIqiwFS+hBPMrRWS5F/6xscEzVX2Z8Go5i4e+hHRu6vGZ1O+v2r5TS?=
 =?us-ascii?Q?MJm0ZWC6YzcI+yvnMMRa20rd58B69r9DAMyL3G2CP53USZjxSmOU+5LX9n9F?=
 =?us-ascii?Q?m8uXr/B6fXXogbVZ2hmBxsetSLlQcfQ5G4duX541XANpgr7TPrk5XJcAqkTy?=
 =?us-ascii?Q?Sz3GDSn1fffiB5nHCYEC68EBQPBrDmRiGai9tmxVVXQl2VyUjdf/TssOoeWt?=
 =?us-ascii?Q?Du5nKlsLL2SAdSXiy9axR8r6LBPIb1Hm3umz5iscTkQWCSvPQeRiS5y2yJPE?=
 =?us-ascii?Q?gwia0l/cqqf2H2qDInBaE7MeI+n+2v+uoQG/1U3jiEg+1UTPTEBgYIilNpor?=
 =?us-ascii?Q?04MaeorfQqaV0JGXdqQ0KlfndWTjZpv30GdT0pcqWBkqmeTuvOTk9oxajp3A?=
 =?us-ascii?Q?n6azcugOjbV7BK/9kkS0REZtO/LEOSIXZWqHUVACo3F2wIlApTlnCYfG8jw8?=
 =?us-ascii?Q?WK4+Vla31WfBxWAWjNIdHDYcAdV1r5EdzwGmeP6YmXNQxqnOgpciJijYW+s3?=
 =?us-ascii?Q?0Tyi1SNknym78yC9xU8aNjaZ3yI5iDCPPsQC8EegmT4LJyVSApSlj4uSPK8D?=
 =?us-ascii?Q?LnGtl04fHbj6qvE8OiuQR+i1hC/70EjkQF1sEp6RSwhwtQrcMvUYyPNMCsDe?=
 =?us-ascii?Q?DzL5RQoen7rZN3aSz1tCSmpeX0af2MF5MTwtgpT2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a508be5e-bf1b-4570-e625-08dd0a056575
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 08:20:44.9337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hKQojI5690f4S57x6HkT/Lo8iSkLScmAEyqnWrm9nIvzDsNQKDuUZp8131yLR/0KfWINWYqlKTAHNe3isZsqWIbJBEwl0w9BNsAnFdF5GJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB12124
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

Hi Chris Brandt,

Thanks for the patch.

> -----Original Message-----
> From: Chris Brandt <chris.brandt@renesas.com>
> Sent: 20 November 2024 15:03
> Subject: [PATCH] drm: renesas: rz-du: Increase supported resolutions
>=20
> The supported resolutions were misrepresented in earlier versions of hard=
ware manuals.
>=20
> Fixes: 768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_kms.c
> index b99217b4e05d..90c6269ccd29 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -311,11 +311,11 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *r=
cdu)
>  	dev->mode_config.helper_private =3D &rzg2l_du_mode_config_helper;
>=20
>  	/*
> -	 * The RZ DU uses the VSP1 for memory access, and is limited
> -	 * to frame sizes of 1920x1080.
> +	 * The RZ DU was designed to support a frame size of 1920x1200 (landsca=
pe)
> +	 * or 1200x1920 (portrait).
>  	 */
>  	dev->mode_config.max_width =3D 1920;
> -	dev->mode_config.max_height =3D 1080;
> +	dev->mode_config.max_height =3D 1920;
>=20
>  	rcdu->num_crtcs =3D hweight8(rcdu->info->channels_mask);
>=20
> --
> 2.34.1

