Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BCBAA867A
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 14:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9814810E26D;
	Sun,  4 May 2025 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XUQVoRcR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07FA10E26D
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 12:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjW8c8TMe5P2wacDkT0iFBqdvgU00cjx/9qXf8UO+uSvrNE+ukf8xt/QTII24GHiPKzzhyQBNPvR1S95iyP1tP6SLExK19Sml6NQUVQY/XX62kS37d0fpCX38htFVJ9dqHTRIldhJEVT7cd6emh0gvsM7SS20fmz0QcFAAYtvnmZi2+gtH8XtNKBYLUmIY063pUKVDobD47uO6RCZevg80+UDCXx9nXFzXB8Jzqs9ZyzO2Cea43nokjCBP+mNqKWJH8fss/2lJn8AJxmMphm0ONro3uQxXSBcbDOkUOxYkxAqW04DDgDuKquubdfv49B0qEalNn/qDAOMcdL4vBe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfPtxVVwz+wQwEOsHhncEq7vvuKx9lv3N+SBa098XtE=;
 b=sseuvE/u6AYzgDa0Nr6DQIGWJ4w6/aYH7zqv1LJFiLcj3uAv8i/1Yoh+Mt9o8tVqeC6/2DoStwyLkSy0O4YN5LlxdaKg2JSKvOhemDcdS/7C37ZndR6Nj2pfom7plWtT8bUdXHYUSvZ8Rvml0K/ddayYzRttA60Mjar23+oDAjWHP2yoH/gwiRAJzxsRH2y/6i0cG9s7C1LW+9stwlKWLoYeQS/+/r2FO0w93mZpTGuFJMKZueTbFhVrpOC37kH4bqzRhtbGOBDo86FW8sIA6xMv6r/eX/87J7T6bGdXGJgGgqXJF29EjQdOZ4RglOjc/uJelvslcuuOZnEoLeP34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfPtxVVwz+wQwEOsHhncEq7vvuKx9lv3N+SBa098XtE=;
 b=XUQVoRcRMwd/CoxHIL1N7UcNgVmmr2Ukb8jEG75ZhWSQv2vwtwtYaSSWr6N2ne+n/WUN8CYKnKDMig68IclnOjMl7gV3u0yU8FSxAIwWn5XAY8VGVetWEvj71weg58eQeJGWBOQMV3NyW8p5i3Gv5EQti5qTMztehuPO2iwh7xk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7108.jpnprd01.prod.outlook.com (2603:1096:400:c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sun, 4 May
 2025 12:56:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8699.022; Sun, 4 May 2025
 12:56:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 13/15] drm: renesas: rz-du: mipi_dsi: Add function
 pointers for configuring VCLK and mode validation
Thread-Topic: [PATCH v4 13/15] drm: renesas: rz-du: mipi_dsi: Add function
 pointers for configuring VCLK and mode validation
Thread-Index: AQHbuhBF2EWRnNV3BkSiJnjoi8XEwLPCc27g
Date: Sun, 4 May 2025 12:56:01 +0000
Message-ID: <TY3PR01MB11346DABE0B187463A47D473C868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250430204112.342123-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7108:EE_
x-ms-office365-filtering-correlation-id: 949e4dd2-508e-4ff0-de7a-08dd8b0b061a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?KUi7NPRqWZAvbO4aUjKONEXY1onmXs7uvWrcgvPdh8pMp5D0bT5YR/4IgPqj?=
 =?us-ascii?Q?90kJZXc0ViPAuZQ9xgEbT8cEEQYcQRUDKIB1vjzhvgNHDHLESRyr6J0FonX7?=
 =?us-ascii?Q?AHHry+zjNzDXJyFFO3cKwXMkMQQrRCAT6uoD8/DpN2WO5r17ZI3eleEg5yrb?=
 =?us-ascii?Q?MALiluuEqzugnIyo80jw6ccuFPmONeKnoXZ/UoHYmoyEZDs+Qq1GbGD0HxpR?=
 =?us-ascii?Q?ztgXFRAgqdJ6ARyt0a02tNWvFGxybiMMs4nr1rfoFU+1iDmfba9PiHy315rI?=
 =?us-ascii?Q?+s59f4VpmQtI/F11LDxcHG0cVSRfZW/w+VXBA2gWBon0oxKlxm3+t8POfrCP?=
 =?us-ascii?Q?aStTL8DuTjdlupTpl/1X7rTyJw/1hdK6tw4jiRfjayX8nQ2rh9HoBkGpbngu?=
 =?us-ascii?Q?xhAAKk4mtXcj9ThYZautPWTsWIVMzrVJaT4BybrETtSNUYQRNzc9suVncVP6?=
 =?us-ascii?Q?yleXplvTom+wVa5cSk8tK6GHBBxWedMm6kdMcUw8m032qPN/V/XvKAGoUkA9?=
 =?us-ascii?Q?tmePBWUbVn0MOAt9Ji9ys4tJjsrhaz7YK4BB1kqQ4slQg5HQQ5246IBeoOF7?=
 =?us-ascii?Q?j8AgY6VzAPwFUStxIilFX3VuAjbN39EyRsgvw097zF2OZlAnp7AIIqeVFfnl?=
 =?us-ascii?Q?ylPnEeD+BhIUYa6gecPeJLVCZnZzJd5CVUQelCbyRjl8wCZ3SjKjdiAQWq0I?=
 =?us-ascii?Q?+2ADW4XI2DhuAdFczGunujTWhCyCwIOrhXuCoHnaOXUrypnYr79uDvKqWRju?=
 =?us-ascii?Q?ploU0C/beYqSi9ljZeHZZkQqULWY+77Vowi4Mee1A1InsTzts+KfnpiYAAx5?=
 =?us-ascii?Q?Z3x4yLlYSjaNjehzR0yiVOfliDzo75GRAPlMEDVyiq8dD4jMn5+r4eqEDUX/?=
 =?us-ascii?Q?/TQLZS1fn1DTGQT7+kltLFXZhg/IKoeKroGVOVYpVOFBYMXW3w4awYJ1UwsL?=
 =?us-ascii?Q?KR7YiRGZARf8pKU4dQmohC05bdJBaZEKBCpKevhcM6NH0LgYPFQKTk8IdSRk?=
 =?us-ascii?Q?2QawrLjB/opNLfKnUBo8UxB4OAtK8CUTZAVPzkyC+TCRR3AlYIIMDwQwpzhP?=
 =?us-ascii?Q?zVkhb5pk/1Vkw5+1W3UzEYxdaUqozJCsWBmUDGb66PS3vKWQhu4EhxHTtOdO?=
 =?us-ascii?Q?uSF5VaU0S8KmeeqGcjZu3M55sdEzJ0zBV75jLhtA2kjHWsPTYrLQp+7Bz+xD?=
 =?us-ascii?Q?l7v0wxWdrRuxv26juOrnEZ9XNvjtoqEfhAhVT+4JdoV4HhhE3KSpIxYOHt0H?=
 =?us-ascii?Q?dbHnvwwWuKLhEJ6U+68hTmFqCluOTi5Mo7AjlsPsMmJZb9G1Gu7iirPwwLzQ?=
 =?us-ascii?Q?zl3rzNOX0q/fgBPutodukz+zwzhr1NXf7kjNmntstjdi8w3SWjsUZMGVy4Gg?=
 =?us-ascii?Q?+U5RAZYHMPmMKpYltA4SnoiVb9HtRaEPLG7ZIkpwHuEksNILyrzodKKMHcjV?=
 =?us-ascii?Q?sHA6pEyoCGni2a3f2nzbZRbYD+bBp4qZDlFL+VBpGkGDkrnfdJc7vgd/qdC5?=
 =?us-ascii?Q?c3fU1C8Tp6xDWyw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QN61l+ZRC5F9Wp/O9Qw9IwUg5b1+DVrtvDl7RssasNLehAMBWNxCEx6FFK/X?=
 =?us-ascii?Q?nNreWFfGj72C5y4tAxkeHAphGfH8SgpF9lkUvtVJ3XVvJPcGZCjeFzIJuR1T?=
 =?us-ascii?Q?iZEOOcj9IO1DmJztCvARufatHoryWSokrn3dUNDNmfCXAV5qxNXM+m4HwNMH?=
 =?us-ascii?Q?CKaI7h4GX2wTps9/Te0JjKupGwr7+07jkIpvMUgUW6Eo9F+KDGIjquWHJezO?=
 =?us-ascii?Q?zH+1nWNYgSP3hBG4k/xsazauK8KlZZOYWrdzG0RVHc+1VGt5gGZCHLXESNSB?=
 =?us-ascii?Q?ldAk3jFbOfL4vJrQuTueLdiuFKTEBzg5eNglVZCj6RzY86shZuQeE4hICXqr?=
 =?us-ascii?Q?S4UokajjYixhiS/6TEkWU8fKQSAHFwdYFYBpZDiDdFeFTvokaAJGRJb5NlaP?=
 =?us-ascii?Q?cbZoPsWLo0fz341nNgio9gya9weFMwjIF/OJh4JVg5UY2MNNVMBFakb5grsK?=
 =?us-ascii?Q?nXKi9ndoSVHt/hOVDIDwrrd/Fr0EUwZGCFTpwPWXgtecgF/7Vse4MgLMIKPN?=
 =?us-ascii?Q?c+qGkQ/vtyLbVaXBUvnrzuKc20iBRO5H5npWqq3i8QVkf3L4GXzz5M6ajZl9?=
 =?us-ascii?Q?2FPYt2ExlHXbbUxhVnx3XXaZI+tsV4/NuTkZidoG5tgq+PA/Cu1FFwLdUkVI?=
 =?us-ascii?Q?dmJEWJTPqHYSvr555+DcfRvjPPQjiXI/EgoNHFUf0Hirw+rRr3J4LGNfmtum?=
 =?us-ascii?Q?XzA2S3EwnIX4TRS6jaLC/flWCc0PvpZSTzDhRbozVu27A9ACJiIT+x9PS1Qo?=
 =?us-ascii?Q?y69S+p2vBlpImKvWXl34Z4Bu/i9msJ966J8iSMmtkfw7k/QObMXf2F5i9Fbx?=
 =?us-ascii?Q?kOOBa5Ia7ZEJrMpAvifp/Jh3e1G5s4SuY31SsLHDKDBphDeg/QuiLS33bvXp?=
 =?us-ascii?Q?e6148r3X9Gfda2PGfjjQ4NDBg+TcbLEqXhW9ZjSao254yTe0HGQJhPH95j1h?=
 =?us-ascii?Q?wyJohbXpaJ1jq4LDAxK9cwv71sTFNgYQP5HeeZ33+7NqAKxXzid0YEbsYzLH?=
 =?us-ascii?Q?3lN/7w0ksZC4nI4KoFMIVXk7UpB+Ga+nfCbgPv59tNeKfBJGyMiIq7KckdmX?=
 =?us-ascii?Q?kpapNVPGe6sdrQz+f56Ty/rrtdKaFb157yxrD3xoNY1AqjrzkHAR7A+KCIYC?=
 =?us-ascii?Q?Qxs8sJ8uy2PNunrooflv8QhSfWDInozDrUlJJHuKDFGmd9Wyag8PGt44w1eK?=
 =?us-ascii?Q?11ei2wRtm81AAE9d1WD1z+Xy9I0wRM6i87d+UW1eg/Gk2KK55L+ciLt3aUs4?=
 =?us-ascii?Q?eBTUcbkLyFUQeqOswG3xcBeQppVc2vBTwzS1iYGkFcfX7to709/ySqU+Sa2c?=
 =?us-ascii?Q?EeUSWkPbLe6WvHpyavlTJRqAFYE4aFKyPNx7TrbAbuWgsXT/wMFtdnWpVflq?=
 =?us-ascii?Q?X9xW0EyXpK2XAl40S9M24tZ7gRRinVFJxNgqY43BHmQIXxwolAnP5yZZucXf?=
 =?us-ascii?Q?8ZO4Fn/4O1Lr5n+TtjzU0xK/+BEmPPCBQWVd9f2cTzESgX0HIylsAcWbAiQZ?=
 =?us-ascii?Q?JTppfvrIfry81wJl9KbEkqmmpM9O69iA69kTVPOGVqNAHV1YRzxNGA7zG6nh?=
 =?us-ascii?Q?w47jBRxFu11GfmadZ9OnwZlGytfn3mgnXj+lorK5HZQ9aS7d82re/b0hw7BH?=
 =?us-ascii?Q?lw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949e4dd2-508e-4ff0-de7a-08dd8b0b061a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 12:56:01.9300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zyjY5J/prBapG+s/8PFr0TEBgqT1VGZoiJf3YdUOYeqVpq2OH/TnXJQrJYw16EE1UFgfwZbS6qAzUagxbKNsrIbnc1TbYlBdFg23uhdhuoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7108
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

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 April 2025 21:41
> Subject: [PATCH v4 13/15] drm: renesas: rz-du: mipi_dsi: Add function poi=
nters for configuring VCLK
> and mode validation
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Introduce `dphy_conf_clks` and `dphy_mode_clk_check` callbacks in `rzg2l_=
mipi_dsi_hw_info` to
> configure the VCLK and validate supported display modes.
>=20
> On the RZ/V2H(P) SoC, the DSI PLL dividers need to be as accurate as poss=
ible. To ensure compatibility
> with both RZ/G2L and RZ/V2H(P) SoCs, function pointers are introduced.
>=20
> Modify `rzg2l_mipi_dsi_startup()` to use `dphy_conf_clks` for clock confi=
guration and
> `rzg2l_mipi_dsi_bridge_mode_valid()` to invoke `dphy_mode_clk_check` for =
mode validation.
>=20
> This change ensures proper operation across different SoC variants by all=
owing fine-grained control
> over clock configuration and mode validation.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> v3->v4:
> - Replaced KILO with MILLI
>=20
> v2->v3:
> - Replaced unsigned long long with u64
>=20
> v1->v2:
> - No changes
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 59 +++++++++++++------
>  1 file changed, 42 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 66eef39af35e..df43ff59e08e 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -37,6 +37,10 @@ struct rzg2l_mipi_dsi_hw_info {
>  	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
>  	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
>  	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> +	int (*dphy_conf_clks)(struct rzg2l_mipi_dsi *dsi, unsigned long mode_fr=
eq,
> +			      u64 *hsfreq_millihz);
> +	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
> +					    unsigned long mode_freq);
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
>  	unsigned long max_dclk;
> @@ -276,12 +280,36 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_m=
ipi_dsi *dsi)
>  	reset_control_assert(dsi->rstc);
>  }
>=20
> +static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned lon=
g mode_freq,
> +				u64 *hsfreq_millihz)
> +{
> +	unsigned long vclk_rate;
> +	unsigned int bpp;
> +
> +	clk_set_rate(dsi->vclk, mode_freq * MILLI);
> +	/*
> +	 * Relationship between hsclk and vclk must follow
> +	 * vclk * bpp =3D hsclk * 8 * lanes
> +	 * where vclk: video clock (Hz)
> +	 *       bpp: video pixel bit depth
> +	 *       hsclk: DSI HS Byte clock frequency (Hz)
> +	 *       lanes: number of data lanes
> +	 *
> +	 * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
> +	 */
> +	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +	vclk_rate =3D clk_get_rate(dsi->vclk);
> +	*hsfreq_millihz =3D DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * =
MILLI),
> +						dsi->lanes);
> +
> +	return 0;
> +}
> +
>  static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  				  const struct drm_display_mode *mode)  {
> -	unsigned long hsfreq, vclk_rate;
> +	unsigned long hsfreq;
>  	u64 hsfreq_millihz;
> -	unsigned int bpp;
>  	u32 txsetr;
>  	u32 clstptsetr;
>  	u32 lptrnstsetr;
> @@ -295,21 +323,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_=
dsi *dsi,
>  	if (ret < 0)
>  		return ret;
>=20
> -	clk_set_rate(dsi->vclk, mode->clock * MILLI);
> -
> -	/*
> -	 * Relationship between hsclk and vclk must follow
> -	 * vclk * bpp =3D hsclk * 8 * lanes
> -	 * where vclk: video clock (Hz)
> -	 *       bpp: video pixel bit depth
> -	 *       hsclk: DSI HS Byte clock frequency (Hz)
> -	 *       lanes: number of data lanes
> -	 *
> -	 * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
> -	 */
> -	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> -	vclk_rate =3D clk_get_rate(dsi->vclk);
> -	hsfreq_millihz =3D DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * M=
ILLI), dsi->lanes);
> +	ret =3D dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_millihz);
> +	if (ret < 0)
> +		goto err_phy;
>=20
>  	ret =3D dsi->info->dphy_init(dsi, hsfreq_millihz);
>  	if (ret < 0)
> @@ -616,6 +632,14 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *=
bridge,
>  	if (mode->clock < dsi->info->min_dclk)
>  		return MODE_CLOCK_LOW;
>=20
> +	if (dsi->info->dphy_mode_clk_check) {
> +		enum drm_mode_status status;
> +
> +		status =3D dsi->info->dphy_mode_clk_check(dsi, mode->clock);
> +		if (status !=3D MODE_OK)
> +			return status;
> +	}
> +
>  	return MODE_OK;
>  }
>=20
> @@ -835,6 +859,7 @@ static void rzg2l_mipi_dsi_remove(struct platform_dev=
ice *pdev)  static const
> struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {
>  	.dphy_init =3D rzg2l_mipi_dsi_dphy_init,
>  	.dphy_exit =3D rzg2l_mipi_dsi_dphy_exit,
> +	.dphy_conf_clks =3D rzg2l_dphy_conf_clks,
>  	.link_reg_offset =3D 0x10000,
>  	.max_dclk =3D 148500,
>  	.min_dclk =3D 5803,
> --
> 2.49.0

