Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DF8AB44D9
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 21:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9CF10E14F;
	Mon, 12 May 2025 19:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nADm2AX7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92D210E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 19:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV1uLZv5+baNbpTUFiwsyZolMxpIx8kC+FRW4hK7crco05gLqL7HhGe4tnv0/ay3D1YLsYrYRjPjr1MF1IHih2v86KTHv4wErr64PU4q+9xOUB4C2hsZEUCgWDRK2KKKwfIU9qoVwWnNqu+hIF5YND56wowbboyQZ/GNqSkN3uETKPtMq17ZCqMpjB++uHosOc/cxno6XQBcVmzpyu89fYB7khxA1oVlHmB9UkKaPTtW0irIT2VY26ZTeWa3D7i65IxyBQoX52NZ2gx4yKgtSvRsVaYarysZr5UNEUBiKDR7r4seyF1VOaxzpGU2GDbxbtf9VkJAR0DSEgB+YzYk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqfxuLWDiwUejlH1Ys5NVUgMoPuWtT9NB4UHtITIhO8=;
 b=fMWa9m/w6H5kzTHZIeb3h7vtrAvmPKdgn5VzwivtF2xhhLiHQ1oHxQk273jDsKqS/ixOqDcsPzqvYrqvWNojNjkWVyvQwhzZ5xlxq5epS8wNl/N+h9oQY2oeWG7GdSfIzW3AMpWpZ5e31JuvBPpBJKLDAX56KHYz6RiN/lKooHH6wOmULU2sO1J/Sd808dz3CEingHUh/mIHD2O/n7lDB3DrGBPBd8o26Xj1qDdPMiuaMJq9saYoqPEBH9JMqtAHO3Ng2l2eP7eAfw5TAG1THylK1k/68au9MIKSL83R1hxafQ+LRs/PJd/6SMZheU+56dMmHgzpwuG3mFxcnnvX6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqfxuLWDiwUejlH1Ys5NVUgMoPuWtT9NB4UHtITIhO8=;
 b=nADm2AX7Y5vdapLa39HIGShQ7Twe6W+tR1p4XhnQeWgwmCG1Vih9sl1YdQC42B5oBut4OIHWhaqnB0MLaHUKi//dOxtKLIWSjyCkkUeZztiPSSyG/HgiHfAhMWS72G/UwW274b4WSrqDXPcR8GFYyW6uTLC7LFu/96Hf7Rr7gzw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB9513.jpnprd01.prod.outlook.com (2603:1096:604:1ca::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 19:28:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 19:28:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 07/12] drm: renesas: rz-du: mipi_dsi: Make "rst" reset
 control optional for RZ/V2H(P)
Thread-Topic: [PATCH v5 07/12] drm: renesas: rz-du: mipi_dsi: Make "rst" reset
 control optional for RZ/V2H(P)
Thread-Index: AQHbw2sJsbadnCrA+0SsYrRk6yS7hbPPYQ5w
Date: Mon, 12 May 2025 19:28:53 +0000
Message-ID: <TY3PR01MB11346E1D51189E1707145C9A28697A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512182330.238259-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB9513:EE_
x-ms-office365-filtering-correlation-id: d5abbbbf-6807-4e00-8255-08dd918b3aee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1JNi/xlrrcJL/SBOz5FnIkVsPuFv2sSQsJJZZJ+5mcNE1I/I6tvV9UB/FH2Y?=
 =?us-ascii?Q?SCgrQWJ12eR0j9wdidpiVKx+F93GiZJLKvsd9Tw/8aIxY4lUlkKx8pkbstGM?=
 =?us-ascii?Q?+A8p0nbpDkRO2pieHAa9TLWrJ0NTnpegtmlYm1iVKWAh4LnbK0qPbLH2mq7c?=
 =?us-ascii?Q?56MvOhR4PJhIOY5JAVjBmB01obo9+cbEjL50ppKXyHatEF6CHNOZi4azQvkD?=
 =?us-ascii?Q?acyXZUfFCywUW/XLz8xCZRtMblqkoJotyK8IkRObdsCr/LqLfiBdJX9Wnfut?=
 =?us-ascii?Q?IwbMDWAiGTZvm+XPvm6V4zWUSVbD8onjh4Cn9vI49JcgocNATqfnk4XxiBVf?=
 =?us-ascii?Q?3ErOEhOuWqrC0J2S4wAmt+lvjJ8h0ut+Hr9340qFJ8oxwPryto1NEkh6uXOm?=
 =?us-ascii?Q?mCgPNTo/rRH+wJMuc0SBmOyTwrG9i2USJ+31KQo0caId6C4E7n0UCPdYW/z3?=
 =?us-ascii?Q?cq6c0NayiD4+gyY4qa+d3JKwFCBR2b1F+4rLe5qYN5V3YFaXUmvErs9A3fwk?=
 =?us-ascii?Q?n1PznsCglujCKZCh7uRcuUKnOEYTzBWWWop0DrWEWTleQbJ6dcD4MLuMxgYE?=
 =?us-ascii?Q?jMt2Hte+pGgmybzotdftRdOHH1+fNe0sv5gazilrO9rZITVUizD3rXm5EjaJ?=
 =?us-ascii?Q?sBabD1ZILrjRC5id4/BZ1cpyBa4jLY2QavO9qi3R7nCrZ2HOfeN0b/Udv9by?=
 =?us-ascii?Q?OezljD7KiKbgT2F678CDS6TbcIQT/bPR1uol0ALxTz0Jr2yRBx++mUPpPonb?=
 =?us-ascii?Q?oaN5uMaqymUoeuD4mHUr74mxGxv0Vhh9Sr8oNKE8NsjkX48Lxgn57BYyXClY?=
 =?us-ascii?Q?5RCySZyigeQrqNwIzL1cVd/Hahov/N7GnN+TofW954PBzDNWuaRCld/zXTA3?=
 =?us-ascii?Q?4n/hYoDuYFR+7mGLl/CPqIWnE/e1whV25qn2F/ICly+VCJH3DqUEGP0kb5wD?=
 =?us-ascii?Q?/1cJ/8cJX/mQqBwW1YIvliDSVwSTafwLq5xeCXfh7o/i6peCuaRC+qbPurUK?=
 =?us-ascii?Q?LslkVJUUsKNMovDDqlIPLWFvRgiODsv6DTXSMJpZfcBjKdHKpcioitRmvIjE?=
 =?us-ascii?Q?zNuf04uw6BapU1gj8HdHbA9Cem6bzsLgVcy1sR/3MPazgd+WrHTCW2nvEWjR?=
 =?us-ascii?Q?nM2gk+jFC7HBtgwWsq3Ee/3IDFKVzGXaQ5DJGAjwUw4KbF4BU0d86m1//148?=
 =?us-ascii?Q?yYIuGtizLtytsscG/zgCwOG56G3WoNvppq34+2bPFuqweJ6VAP0dn/mfA0r7?=
 =?us-ascii?Q?KHXS6OUMlPPAyfIMi+LaGe7dgx4xTH7pIMJhTHHz8mUzu8Nne1W95wRv7Apo?=
 =?us-ascii?Q?UTVuAOMq5KD36yHVp9WdFsLFfYkX0hzYbCWjOBWyhfYx2pk5FI3yQmLl12Ml?=
 =?us-ascii?Q?jEk1qc3Dpo7KvvxCcq91pRW61a7jOjeOzXnDAlZfrlk6j8UhxFaVCbWOONih?=
 =?us-ascii?Q?REKt1DxJJj+7ietaUYGdW+1gv2iTH2fmvr81aJSTpgbZpRTbNcG996oqRz4+?=
 =?us-ascii?Q?JABK4h2v8E3b6JY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ch0OIjXCQSfjdXSAurlj071aLMuP+SRkKplPaCtTxh3NI0Ib6LElX9mhV14l?=
 =?us-ascii?Q?ljg64BNiTb0XrhN/VCbRNJ0CcYaGasLix412wrZMlH4nMQ78ZzaJvJjSkaYe?=
 =?us-ascii?Q?CTAZ29GeQ0jGyyC6VVMB+dhhyYJXtDm8Vwzzrc0oXShMIffSLm0eZywV+9Qs?=
 =?us-ascii?Q?zM3VAGHHBDGVcBmqX8mHrck3OiQpzOqyM1YgTvtAy3TW0U+ifthhQHDGFtcJ?=
 =?us-ascii?Q?+mwN7z+oGpenywlnBWdz/JMdz03MG0FKrTVWHPK7FfOTrhpIwGJ1/2/yrWGN?=
 =?us-ascii?Q?KxYOsSLEkv/EZ2u6+TSSOYkpwotb+N89qejfcPzs7ninABofKOxd7BJMIW40?=
 =?us-ascii?Q?xpM+bbnsYdfPGBSvf77KiLtheJQrlxhr0dyEQfw7V1HuFhnOJ6KWxA1v5v4L?=
 =?us-ascii?Q?Ate9EBIBFJX3vdzztlFr8V9zeQjiPGj886aNE/DsPgHZjUTuRboGtaYLcl/i?=
 =?us-ascii?Q?poejVvPkY3puYqTCHzwNphRi7ppNkwvt8LVWh3khpZ5YeaakczwKUeWwAvdP?=
 =?us-ascii?Q?pbn/sOxSznht1Qn8TjCfEsFzkk80Mmxffyaayy+s8/QvPAUM1EaXo4Ggck89?=
 =?us-ascii?Q?bxd61s0jZOMSUGl5ccGguVTzrZYitxJZnpJ72PB9UEwSVdBnr3QFxImgDK48?=
 =?us-ascii?Q?cQCR7FsSFvbiX3lNNAkuhcD2WaOBgR1RK0G5CaE3lRY5vz/e/BKfdFlZ8umS?=
 =?us-ascii?Q?L9tQPJbvGyk3eQSHoX7itg0UaU5GGSiUekxF9HBTIkrGeLCazL8HBhbNMUwM?=
 =?us-ascii?Q?kElXdoCef6F+7CyGJ4oPAQt/XHcKrDYSQzaZgkS9tVX+aLdXWUeoK2d5bGq+?=
 =?us-ascii?Q?FdWNW1+O+3NLd/qb/q9H/M+GkuHAeGSuczzbXmSuHBY19bvnPlpB6MLns+H9?=
 =?us-ascii?Q?mHnvC+fwLGKMtaQekrZFnwfsEe+axY5TenHa+tDd1YG3NRl5Z5pzZeqIVA7W?=
 =?us-ascii?Q?MFndU+TOG9ItJMOubWCmbd49SrKW5etoGICTPk1DrwIQ2DstBOkSZzLzXv7i?=
 =?us-ascii?Q?gqqXhg17hOa8u0uqdSQvaxKecnu31NeHfOc8ZXvnctfvuuYCXi3CxyMRjiHv?=
 =?us-ascii?Q?MaIL7InrTGbV3W/zEq5yH654mlGMLiOnI02XvFitNTUJgu3/qoQbTvjBmp7K?=
 =?us-ascii?Q?zY4QFIg8IzxC5ufh0MnVJwVy7gRCny9wmYKVN4B3nrYqqoKLTc5zVO3h++Jn?=
 =?us-ascii?Q?h+9akcR7USFlJGPNm/5byowF75pt6ZVyUK/MeWVJLtfqaGTlCZLnweT4XJwq?=
 =?us-ascii?Q?yO7HYf+UA8iDLywqklfI6tlfFXOSHrph3KesjgY41aDYezQM0wdEGYlMi6oB?=
 =?us-ascii?Q?8qABt4hv2qYLazVIsu+eD4Ghs6ojbv2q49bWPqN/NEphEUMGhoCzYnhn3JLH?=
 =?us-ascii?Q?zYg/atP1n1va1y2O10n/9du7CIyFxQWxjeZKKIN71xbTobPZKJKcFBK09w7E?=
 =?us-ascii?Q?DMefaN8c6fhTNvlbHR1dz+343e2YyYOMWuP9J7lRS/NwWXUOv6aQDCvacyex?=
 =?us-ascii?Q?bPYzOhqGHGqsoHIWNd+PiYPF+EarkzN9DyPszsSOaTyYPnTEWFX+CFWZ6QQg?=
 =?us-ascii?Q?l1/sffD1z0dQxhu0AYFWpdOvSV892owJ6yH6yEZb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5abbbbf-6807-4e00-8255-08dd918b3aee
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 19:28:53.1522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pjX1cf8clMafruHudZ5Kz9OkUmhq9KYm3r2kVlyPsOXIubDGZZvDkjkoJKc7OTckYgB6ggOaDZXXLIGb1eMCjQrGEMmlOlsY1iqc/XOvlNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9513
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
> Sent: 12 May 2025 19:23
> Subject: [PATCH v5 07/12] drm: renesas: rz-du: mipi_dsi: Make "rst" reset=
 control optional for
> RZ/V2H(P)
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> In preparation for adding support for the Renesas RZ/V2H(P) SoC, make the=
 "rst" reset control optional
> in the MIPI DSI driver. The RZ/V2H(P) SoC does not provide this reset lin=
e, and attempting to acquire
> it using the mandatory API causes probe failure.
>=20
> Switching to devm_reset_control_get_optional_exclusive() ensures compatib=
ility with both SoCs that
> provide this reset line and those that do not, such as RZ/V2H(P).
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> v4->v5:
> - New patch
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 00c2bc6e9d6c..5fc607be0c46 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -748,7 +748,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_devic=
e *pdev)
>  	if (IS_ERR(dsi->vclk))
>  		return PTR_ERR(dsi->vclk);
>=20
> -	dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
> +	dsi->rstc =3D devm_reset_control_get_optional_exclusive(dsi->dev,
> +"rst");
>  	if (IS_ERR(dsi->rstc))
>  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
>  				     "failed to get rst\n");
> --
> 2.49.0

