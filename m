Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B9AC059D
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E6539B123;
	Thu, 22 May 2025 07:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="T8xXCREi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B14B10E6E2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 20:38:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivnSgx22L3WFzr/jk/5YyepPXg8QNkhn2UZGdqrYI6CSVwwZ4VxkyF7cicQhUd8+EchOS3ddoIG+h85L5vy9vZvwOt64sbVnOKrk/05LZUeGTEQcj+QAJsXKGptnNJh/Q7bogoNERDff566Xp3AM6+T0HNS/Mx7OP3Afr+HqA7/3orE0aV/nczrNhXyjuBhuPssdJKawsPnZFxh/abXoQhBvtD53pHnzp9ncX97DmUqB0/kw7l7XmsIqKmRsBaY0SVBM7VK5n7lafCqsusI+pcljMa+ufmsVJcmteUkxNyugeNY01RiC8u8Lq49ir5AxzDXXI8aQY0AtD5Be28phFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HkfGUNNbarxj5EczJ2N3EuwN1zSOfPnUTvFwlU+CuQM=;
 b=w0V6VZHp3wiRTJ+j7V5oVIh/+PKUxO5K15Fczsco//cPU4u/gu5O5K7LPw5irdwJeI48tpa0rFpnFA0UVVZf6HQuGzMDyYSrcEty6620bwyfVBEMsgHOngaT+iIm8pl/TAtuCpyJdIwJRhv/Po8LCnojB6qvtmUyUDG4eH08frSSusz4DnN5+Yy8jWZvgzy8tuGKkK4+xjmeREuid3p7bA2Ht0d/954o8x/y6X6/38nqIAJL0LN1xrK/C12NHAUuY+lT0r43u1u/XRmelMmJtipmCVsXDbhq7TN4utU+uWVuaCUEtMB1jgRP9ENPFR3puvzikAnx8ilG/iN54uLyHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkfGUNNbarxj5EczJ2N3EuwN1zSOfPnUTvFwlU+CuQM=;
 b=T8xXCREi9sLGPhc/hmovYyqtw0yhe33jQToJg5Au6Z6BUj1ndL7EgMH0yOQjrjKeBrDDShOdyghfHFGmG/CR57gGraQCe4GqehJQ4pDgbSGsTS8cRTZKCGGmOpeoXE3L51weKmKY2qpZhCSpj9cZ1YwLSWtetNuA3DrsWloBqGw=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYCPR01MB10310.jpnprd01.prod.outlook.com (2603:1096:400:1e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 21 May
 2025 20:38:19 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%6]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 20:38:19 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>, Hugo
 Villeneuve <hugo@hugovil.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
Thread-Topic: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
Thread-Index: AQHbylwFhVVE5Hn9nUKcOcoNt/ZXy7Pde/mAgAAORXA=
Date: Wed, 21 May 2025 20:38:19 +0000
Message-ID: <OS3PR01MB83195093A44C507B8CF07B268A9EA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250521142350.2134431-1-chris.brandt@renesas.com>
 <TY3PR01MB1134626C4D2C38B5BBED1485D869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134626C4D2C38B5BBED1485D869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYCPR01MB10310:EE_
x-ms-office365-filtering-correlation-id: c7a3e36a-35b1-4d7a-f376-08dd98a76c1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?13ZGvgPjO78dOjpqeuNV2wEQHJvZXT7aauOPzCWTKvaYDlJ3ioHdQcgx0Dec?=
 =?us-ascii?Q?B2p1fqKGnpyywIaBem9tfSYwbrgdm6C88/+hz0KI7s/l/Xf25BWk8ZQBYJb5?=
 =?us-ascii?Q?aBz96Irge85VHMtI1bDTB+0LUXAeoA8n5ERnNamQsv37XS4nBj7JiwSHGvnL?=
 =?us-ascii?Q?ZFz9kkCEkWBTFbhhsKwTDWvTZ8v6JZkleAJGtJ7Qmu+529zrd38ivGS8nzqE?=
 =?us-ascii?Q?ATyr/HgZyAagyw/M/fMvUfHCj+5hDau9LnGq66fvJtI1D+SgtLMeYq53+EuD?=
 =?us-ascii?Q?6rx5FHBu8KH0/Qhb8OqxkEEJSSTloCTeu42jCOAvqWhNefRDIu+lm+6NabCg?=
 =?us-ascii?Q?V8gW7mFcBAcXXpEZADqsWlH3oasNOZjrrY6s8eBGtom16wUuyCnwuMoeQiiE?=
 =?us-ascii?Q?/v5CfFWZOdBsBgUf7Ulb0DRCCKtCoxxnEsQK3dNg9zXvO5y1jTJ5vmyDYG7T?=
 =?us-ascii?Q?NBR/uqc+sMY8EOcEGzlKoOpdoGEUNmm4JSHHImnKHWULJnfrZYoj/+NZTb03?=
 =?us-ascii?Q?hOILKNAaa/XPRqgMbHFz3Hox9IWvOi1cvH7LfCIIjByyO54u7ml4bOsT286u?=
 =?us-ascii?Q?g12Ist/nSkToEwV7L1KilKbZcjtILHN9OuGhsK4VNiN9/POG9qmMvvsNf1gW?=
 =?us-ascii?Q?ElOdOMG0Q/Dpcrr434nNCR122qNcP7xmrKtB1/R37sfxwOevAoejDPQBZqpV?=
 =?us-ascii?Q?+raJMtrkd3tYe++b8TyClCHLmMokXigpzExeFAFQB8iTmHfmHvgj8pydEwnG?=
 =?us-ascii?Q?uNnZuZzkxtoE7MWIhRlf8LJDSJik0C8UAKFdsXiMzE32FH10AB8KY6AOJ/9g?=
 =?us-ascii?Q?1zM0XtK1n7WWNgxZCkgaNkZTCxaI/b6zAJmWn4UO7+LwmllRnQjYiJNU2ZWw?=
 =?us-ascii?Q?F0GfzhQL0tz3aDrcwhueYZlqjInpIj48k18IfISzZpkPEIQOA/DzB4dJJZLM?=
 =?us-ascii?Q?qOdIt5iifDewLZZJAJuaBy9FighrYGvI8k45E1UKDVAc6lw0+5W6S1VlgNiH?=
 =?us-ascii?Q?+2K6BacQaWrvAjOtZXj8ip629RNbNIKvi2S1+vK21FU7Lp1//fYoTO0i+D+e?=
 =?us-ascii?Q?9tGTj7NfCeW3m+KQJg8fMfoz8NmFDnRIju8qa89Q9QaSNwpMtzD/PfTQty6X?=
 =?us-ascii?Q?Izf9x4VFUYlgOjoJDm6e9q6RP6ulXbrTUzMLZdoKfPnGVV232YTlj5lA6olw?=
 =?us-ascii?Q?jyw1IWvkQTrQKh/AMjEsfzW50tNBvruyFMW7bD/X25q0JGBKPbeVEJuAd2cK?=
 =?us-ascii?Q?8mg8nd1FIulDRsgB+eWoT/VFaRvvTbKt0WUV03iArnO3q4p9t6WkY9uKD4gT?=
 =?us-ascii?Q?caHrI7vkU9y7SA0XgAZoOEss04vAVD6hmThCrw4IkmUeoR6C0Uj2ZX1Zcls6?=
 =?us-ascii?Q?pVQC1g1Dd/zwKq/Ltz/gqpk5UyTtsPpvrynetTp4/ZpxdEpkQo1TqPg5ABxh?=
 =?us-ascii?Q?o4jeQ+d+d539kJ11mmGlZg/w5A5EVMuU6pAEWoMvYptGuSJwfhLoYSbKF40k?=
 =?us-ascii?Q?WEdkDmXrFQxapls=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GAi74qoGdz1DPwqa5Sq2PaqUguTWp0S2PtGhZAwAfOOnK8ZaFdw4iPIilJsp?=
 =?us-ascii?Q?ptJyfv9WfZVf5+tNJpok/VTJ3SqptsJNYjftetP09UH18C8DFpQMDG8eLbv2?=
 =?us-ascii?Q?4iZtV06ZTfLU6jLUf1Gi0/97DoYzK5A4rzhCpkl/TlnwQG1RcV7CEPxcCwEz?=
 =?us-ascii?Q?WLW1UI/5vBtEVOzYVDmgdqg7e67g1ODwKVNyJRi8vX7IZhxOMry62W5MLHH7?=
 =?us-ascii?Q?w3J/YE40JWrQa+i9G4O/TNrTFpc+1EQFjKRK0vhAKYdNGoOEhhtYHw+Td9k5?=
 =?us-ascii?Q?U+vw2UkTnz81jUNMiU0D706Go8FeY9OgNxVhUpi3WrAx6owrpBWRbDhaRIzL?=
 =?us-ascii?Q?V2Ws8V5s0Mf3yJs8MBAg2zsdRv7lkUICGPBl8YfL7+cgJpDAiYQWlSD+LTex?=
 =?us-ascii?Q?/epRVZff+7f/3zvBwsCDZQfqUx+VRHZF8Nw7x6VrN8T1RoCEeLapvSiuHeob?=
 =?us-ascii?Q?+b5nGwmTzUCI1k6ZNf6plsEHlAgnUYqqBmdQPixnyEUCWnwqLJkgKjqe1Afa?=
 =?us-ascii?Q?L9B+wLyie1vNdWMXLhp9bAEXKuc3fZEneGV/a8Jpiy/ffVWqHpQIuQa7T9te?=
 =?us-ascii?Q?wVrxPXo+6QQ+Q3r1V+GI6OEM262Uuz2G2tGf5+quDWUfqbth5SWL6n23XmL+?=
 =?us-ascii?Q?P29UDOnufIKtbJBZKTRJ2Pe1C9SIpJ6CxJvHnCZNlIsYM8aiffLhk9rNmKP5?=
 =?us-ascii?Q?W0x+qNhSRAc7ZPonja2STQ4dhGgRiuYDmc7xTj5ZSifCnD0n1SMLKkCbdC0z?=
 =?us-ascii?Q?J0A4uO6HseomlGD6Fb7nwZEJGizJha73R04cXhEnYHwvVbNaXZE9FaF7h8fz?=
 =?us-ascii?Q?9A4EFx5XI0AZjbBLaNaYakhzO8hzrntYQrvL0zLOeqolrZ92Ix2hyrzGe5he?=
 =?us-ascii?Q?VE5hs9fJ3XNKEq3y2/wFlYefxbqNnYTS2ZUPcxavygG5DiPAmIW6iFOdZdP3?=
 =?us-ascii?Q?tWEnBlpFf4X2w/O+xAntJzAVqqvqLZLlryRvnf7nrgIlMxyMvaMUfNridc4V?=
 =?us-ascii?Q?Lov6aQfyF6YH14CgJUuPPVMPfVCk9MAs8sTWqaxBbVg3v33MqoH9jYHp8ly6?=
 =?us-ascii?Q?MFZiktOPY/0gooGvuqfOnSv7OiRYdGlQg0IZ/ChYO1efTzSca2JeEBMrgyoJ?=
 =?us-ascii?Q?KfEXgIusEUBTfUH1IZ4MKuP+h3GaXKrRjMtKCTKP9hVKBJ7zeyk7gh2f3Xaj?=
 =?us-ascii?Q?ryi6Ps3X9htvNYrlExw3by1EpxDHAVyJTDToz4wttDUXat3bANIeQemEm6cg?=
 =?us-ascii?Q?0TnxY9vTPaJJ2dvofR9ef5NYK6VjM7l2yhlvgGawNGrT4Bz0bh75WsZkIUVq?=
 =?us-ascii?Q?9Am//dGI1p9w9E0aUk76kQGTK7tlEkdenYfHxRzdMU6yssLkhSYTVRCNjb5M?=
 =?us-ascii?Q?pYh0vTMwsTBtjkGSKS6p5RxmzbIqGGTUiyBYcMDT/0GKaDWhOq3lV3kVj3NO?=
 =?us-ascii?Q?4tWrNXBl2dIyZKipi1cs5fQbr7l0ilTtyG6HC1x94+rw6vO2/2HrH1wu8Rt+?=
 =?us-ascii?Q?EBcYU/zrAFWAtg84+0Z3b6lh4eg7KexgiyHyDhps7GngolzjcUEilQdSr7gH?=
 =?us-ascii?Q?aUS+3Up1Oe64Kk52o06YUGfe6Sj91iJoqNX2XjB2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a3e36a-35b1-4d7a-f376-08dd98a76c1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 20:38:19.7264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Kvf4m8WzcOLbmtLyqtSaObVU6L/Bc2PCA0PN1L/RhxFgVbvQnNRZEHFPEk4lORZQhf36Ueg5H7izXWXkLBeffyzPhOcwnEwGv5wEPsICTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10310
X-Mailman-Approved-At: Thu, 22 May 2025 07:24:12 +0000
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

Hi Biju,

> Check patch is complaining about Alignment. Please check and fix it.
>
> scripts/checkpatch.pl --strict *.patch

I ran checkpatch first like I always do, but I didn't use --strict.
I didn't even know there was such a thing.

I'll send a V2

Thanks!

Chris


-----Original Message-----
From: Biju Das <biju.das.jz@bp.renesas.com>=20
Sent: Wednesday, May 21, 2025 3:41 PM
To: Chris Brandt <Chris.Brandt@renesas.com>; Maarten Lankhorst <maarten.lan=
khorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmerm=
ann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter =
<simona@ffwll.ch>; Hien Huynh <hien.huynh.px@renesas.com>; Hugo Villeneuve =
<hugo@hugovil.com>
Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; Chr=
is Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable

Hi Chris Brandt,

Thanks for the patch.

> -----Original Message-----
> From: Chris Brandt <chris.brandt@renesas.com>
> Sent: 21 May 2025 15:24
> Subject: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
>=20
> When drm_panel.prepare_prev_first is set to true in a panel driver,=20
> the panel expects the MIPI DSI hardware to be already configured=20
> before the panel's prepare function is called because it might need to se=
nd DCS commands.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c=20
> b/drivers/gpu/drm/renesas/rz- du/rzg2l_mipi_dsi.c index=20
> 4550c6d84796..b31affddfc81 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -531,7 +531,7 @@ static int rzg2l_mipi_dsi_attach(struct drm_bridge *b=
ridge,
>  				 flags);
>  }
>=20
> -static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> +static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge=20
> +*bridge,
>  					 struct drm_atomic_state *state)

Check patch is complaining about Alignment. Please check and fix it.

scripts/checkpatch.pl --strict *.patch
CHECK: Alignment should match open parenthesis
#26: FILE: drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:536:
+static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)

Cheers,
Biju

>  {
>  	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge); @@=20
> -549,6 +549,13 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_bri=
dge *bridge,
>  		return;
>=20
>  	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> +}
> +
> +static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_atomic_state *state) {
> +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> +	int ret;
>=20
>  	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
>  	if (ret < 0)
> @@ -592,6 +599,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_b=
ridge_ops =3D {
>  	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +	.atomic_pre_enable =3D rzg2l_mipi_dsi_atomic_pre_enable,
>  	.atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
>  	.atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
>  	.mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid,
> --
> 2.34.1

