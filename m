Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3138DAD79E3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 20:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37DB10E066;
	Thu, 12 Jun 2025 18:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CcoPp2e+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9099110E066
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 18:46:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvE3Nn3ZXEMgjG8FbVZXAH4xW+QObo3rZJrEslIl54maPjan/pfLlHObNAqIzGJ05W5zDPevZ5IYqBpTp5n4PTt7jj+ExB8EN/iSZuA1EO1XiTpclVtbEXtsxYt2L+xAwvmxSoaZYEd7ZmQuk9JvuWI1SbymOZYW/5vN/nekFtWEg+6FAAnFO8LhFD3nYVfipk9k32ie1jGw4745LZ6Vi8lHx4x9K86jxwyvbVAwPtWKwUOY4LGDLlJZTYzyz/ZZbxmVKFkCdEwXEXGlOZW6UuOSXwZOkO0ToK5E5/BV5otckKoRfV1WRc9xu92IbRQ/lbkGPQ4CoWgg15BAkQNygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iG1Ur8aUNdurEfk8KHXS9ES11l5BPvKWs1c/plCaoQ=;
 b=dIsCVipEkTQW2YptoG0nOda0k/nWm5poYDlZsaGo/G2I95glIn4s6fduxT0Cq7YMvAYHnIx1gHOO68F1ag9vsx+yVJ1obFAAi0rM7i3ysw6N8js2h3Afjzj0fhf8uclRr0LcAFff3EjCMidtIIPvwOtXIJ/Yr0lEOx/aeqRsLwV1sEbCfyr6bmA67Ftz62nplkjRaD35JkWCIS084vgKZhOnafBhFrZfripYulewU5AQL2munz8kA7CBkZjICJRCaeFccXrQcAuJXf+cwk/7fyI5CjXVbm7vBlVtEFCOxUo+TfjLvDgZJfc/in1Jf0yS1qpbtOP2JELLQB3YfU+T/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iG1Ur8aUNdurEfk8KHXS9ES11l5BPvKWs1c/plCaoQ=;
 b=CcoPp2e+nk71m6YahAlnxC2C13WrcQlKcalOASPhLLA7dYp/S5bvDMEVt1m3HuRzIN/pAOTI+5KuQcJ1dG8mmVk6zRqnJGqYIm1gYPhllapytPOApk43PJzoL8atWCYwcgF4JH7EciT6qaYhIOXeezKAYpZPdQYAd2rTuLb6D4k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13443.jpnprd01.prod.outlook.com (2603:1096:604:331::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Thu, 12 Jun
 2025 18:46:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8835.023; Thu, 12 Jun 2025
 18:45:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v7 0/9] drm: renesas: rz-du: mipi_dsi: Prepare driver to
 support RZ/V2H(P) SoC
Thread-Topic: [PATCH v7 0/9] drm: renesas: rz-du: mipi_dsi: Prepare driver to
 support RZ/V2H(P) SoC
Thread-Index: AQHb2ZHKfJ0kCzT1QEqvZdyBd28TS7P/4RPg
Date: Thu, 12 Jun 2025 18:45:56 +0000
Message-ID: <TY3PR01MB1134613C19F77704DBE20C15C8674A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13443:EE_
x-ms-office365-filtering-correlation-id: 381c066e-d3b0-4362-bc5c-08dda9e15dff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wgpQJwKsp9LIazJJ0GkYWwIJBxQI0bypJ2rjcLcvfnv85EFK+KVhYx/aFRuj?=
 =?us-ascii?Q?87NgEtIXgwgh0gGE7CIF5TnhbE2c8L23uJVjQTQCN05wHKPHLM22uSBNPrk9?=
 =?us-ascii?Q?QbUS+l80ewSzecn6f+U78CPsm4d55RGZDlFj1Tox2bgdzgoMQNEHXF+TP2W9?=
 =?us-ascii?Q?kJd6geK/GtX98K8poVjxO7cdPPRavtenLcqYsn2kc692SrNTGAZBKqIaz6fQ?=
 =?us-ascii?Q?O081pS55KVkuPulg3UhtUOI4H3Md2dvj4y8378cifWZm9WGRpJfBTD7Qur3F?=
 =?us-ascii?Q?GAnyVNHOzUnEtL167FQd+WK8YorsG6Lev9jOMXPzBE6/zPDwjXBvUmPxold1?=
 =?us-ascii?Q?P6TsRyDHW+nKQxYbXwIZjjdt/GQZPlmR2L6gT+TvHbX1PoRpFlUcVFXcPaVv?=
 =?us-ascii?Q?Cs5m5Gp/Axl4YvZt/dc+uur6BfsiMF/6ErFCVMDazixuNrdhw0/Ld+5nMlL5?=
 =?us-ascii?Q?XXud6O8nwC54IqxjerjbcZAnMJ2grT9OeEr3hiMXlhp+ffkCeGr+/IEIHXVZ?=
 =?us-ascii?Q?jeRGVRAZ5cvl1CAi1Jr60I+Y5bpku7E2VGpfTo9ZRCOYJ/S49EjVnuKVdhHZ?=
 =?us-ascii?Q?E/RRy04gXi6mxaIloIcvHsuVCZBmBbBmT83t1/NXUTGWv06DvYZy1veuiOVD?=
 =?us-ascii?Q?N9CZ7T900lYNkhzf529Bb+mwlKfDrsfUo1bxqOWLuIAD4N+xrBoRqGtLaNTU?=
 =?us-ascii?Q?WDko5FHQ/cXBQ69pFTVQcba7rkWyFDCsqCkHuLDbckxh6gihiJoEsk1W+vIq?=
 =?us-ascii?Q?uZWpbwVgG0vE6Y1tMmnWTTpVHvynefKs9pTtB4d6Y5w8VbbkFqJxMVdRyarx?=
 =?us-ascii?Q?6ooO71Ifps4pjux1wMvQjPEMqR/+TmerhZoCMpOQdFWnHFy/5IcDh4AtuZdM?=
 =?us-ascii?Q?68/QclAuaLcfWVdrdoBKVr9YDHeYRGRbb8MNo8wd4zc1oKu03CxVzJa0CDNf?=
 =?us-ascii?Q?eyMzyiP0NRHoQ6U7z30cUGQzNwbAgibyuZnetlHfEtwov2EnrEP6RgxgXN28?=
 =?us-ascii?Q?JQLdOZTOqLXSFYNr0vij+Vm34HRcNWVuBfHzotiffUpuE980dbqaib1wtn4e?=
 =?us-ascii?Q?aBaw5jcNA2jSo9gFkMjOpaPudQ97UyVNvHszqZGXWh+UxEbDPON43uAxCSMb?=
 =?us-ascii?Q?zU54cNJVRMeMnGzVix31b0OUJH/Z4f6H0ieZtAbJlAmgL8vIKpviPFrzkCnG?=
 =?us-ascii?Q?KvIUC2dbfcTOufBrZM5CDKO6kPoOf3gsxHGpzSpw+FtkKNp+NCrKTpbsE27p?=
 =?us-ascii?Q?zmaBtRo7es6Ft6/L5OZcrZ83hKiN5RUjmVomFMVUvL4q3Uuvq035SxYPRf85?=
 =?us-ascii?Q?RjMkvr2q3RMuaP40kYRw92bb922aedo5Ck/j99MK1apX9IGGPdciwrvgvvpH?=
 =?us-ascii?Q?QcPxNZdURRO7KW43HBrp7nUGlhAwWBEEgZrIjanskN+kEZWu7Z2BKro6arKM?=
 =?us-ascii?Q?vhn067z0gnqQu0MyNI5fLywyOCu16Q+cUn4BlRbxn7DbRQuQG4iZjHCPRNcT?=
 =?us-ascii?Q?XYAPVYYe56fD2Ls=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nLkOnA+wsZGLi8pBu7Q6bGNOkPhhXbSnm8D7S1M1H4ZGTK6JE9HaiA9afatC?=
 =?us-ascii?Q?MkBRmGQr58zK/nq83PKgXl5/nsWVuWsv2hmKKTg1oGSVxbCR2uHpoudio/kQ?=
 =?us-ascii?Q?X+80GqyrT1aRFbahjnUAc5ppPKsPZqEYYigNw5cTsjGdxa+uhOTQTDRyQdq6?=
 =?us-ascii?Q?bZ8vQPgxG8GymwNQ4QFk9xSejmAlgOe9/tKNuGnNM3ZKBDifcwGITrfKgUq5?=
 =?us-ascii?Q?ZicT1c8z6YBj4ew0HJlvU9uMQ6gJa8Poj+VLNfDNyDpUpcUdyPdMYI//5kib?=
 =?us-ascii?Q?t846B8PnXKJM+dpz3rhGgCQCRPkN7UUJt+ZjO6LswlaAULzazcV5FiVr3D0y?=
 =?us-ascii?Q?2JwSOG8PCQX8dVDebT9iV3QGmbRHYnYlU9AjlJF8evEBLRCEeFd8p8guPNLZ?=
 =?us-ascii?Q?PSBpOfvDAWYsMiZmqCE+Gs+XniI8rxI/jvZHwx3xUN28CusVMcfOQ18WDBIi?=
 =?us-ascii?Q?88pDAITQ6QjbHd8kY64ol9Pgsn5Q4YZg2NUBdr4upSHel8U4XrLcvAyalSPD?=
 =?us-ascii?Q?2RWZwKTZvTiq9GUjIxuMLXRE2FZ5+x4kBRIHhpkGJVPm87bQ8cH3ZL7NV4Aa?=
 =?us-ascii?Q?OYmOB7aJ0BGbZjUgEAIcN3B5rQTBuF0bJQElj1RqxcCLw57VNWBHHxbKurn1?=
 =?us-ascii?Q?5AkvHJz/FTu9rUTHsEoIKXjwrQxrU59KC+Yh4dAWPogeHlmFNKuPBCNh7ymi?=
 =?us-ascii?Q?x5AgG5zU1sD2DhDLKCf82N/wOkp063pvPa8+erjPeEOudmSgwqj9lUDPebWp?=
 =?us-ascii?Q?vfisl2t7nQG2JP5L8tgqGimEQ7vUa6XgSheN6K6DA3JhDkqZDFe5fH30CZOx?=
 =?us-ascii?Q?0xHYSynwR04W+zPbkfyB4HPT7DwdHBaaUh614c4UzgyJyD5UJRkXGIUL5ap8?=
 =?us-ascii?Q?fsjabopVyvOMdwagEpwkzMJGliCm5vV1vbNC9PdTdf8CbwpYzxpt6eljJxrR?=
 =?us-ascii?Q?IsoKFG3ZCzu2kuoZYXNpqN8p8MSFQW6wI6Z5U5kk3qze08KfKoG0WcxDb+Pu?=
 =?us-ascii?Q?AdPgWxsYwhtqP5W6tFBQhCXIKz8k9EAzaGioL363Bup/ESB4Wct/W9r1TNbx?=
 =?us-ascii?Q?S4ZzZBFUn5ukfVvYzYfQ9viQcFZDegGC/OkB+8BGki4b4QZux56VRf/8VWLh?=
 =?us-ascii?Q?wODLhF3O6WNJcYxbZoFAX+F970IVFY+K82WLj7tDBxV+eEAQgkD/J9B2uIIl?=
 =?us-ascii?Q?SnjnMZ9pbnfVh3lQq4x3PORmZmUrd0Q+aNnWiIn7SPjYuwpdujdOgDiUIw7j?=
 =?us-ascii?Q?lNGZ/e70VQBqRW24RyEbP2fhiPkxds2+64yEL4SpG/iJ8XnpAy5zBwsqgkW3?=
 =?us-ascii?Q?xkQ0qQwjA0x6lX3Fd1K/yQoKwaK49j98EiaekeZXHUkYyZc7ztqY86O/bUWF?=
 =?us-ascii?Q?bB9FfJa2aStYIDnB4gpUFPapMxKi0KIB/wmN1xhdlZnn7QDFa/mArCRAXPo6?=
 =?us-ascii?Q?wEAhWFyTCGwlF9eKxvDMvQJhO4f/TR8/kH8Kjy6JTg4iQhMPBdpkQOVVRNJE?=
 =?us-ascii?Q?xXAmD8K8s3iI4IoQ/5iD8/cPgVbJIeYnUFbPyCHTS/2BHW+NR3Vh5R3wsDzh?=
 =?us-ascii?Q?J3Kh/jSu0E5G50OX4yt5ovqo4TV9BJrM+jpP14JGJpS/BFuHIJlNyaQFPJH/?=
 =?us-ascii?Q?xw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381c066e-d3b0-4362-bc5c-08dda9e15dff
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 18:45:56.5825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cyXONNBg8dlsvVmMs4iNmK+r0AvLe2vevlQIF/gsIf1qNWbfQion3xVV0103DlMrLRNozT2HSRHKBvHmKW5IPki/xBU33h4TJmRRUadFFJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13443
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



> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 09 June 2025 23:56
> Subject: [PATCH v7 0/9] drm: renesas: rz-du: mipi_dsi: Prepare driver to =
support RZ/V2H(P) SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Hi All,
>=20
> This patch series prepares the MIPI DSI driver to support the Renesas
> RZ/V2H(P) SoC. These patches were originally part of series [0], but I ha=
ve split them into two parts
> to make them easier to review and merge.
>=20
> v6->v7:
> - Rebased the changes on drm-misc/next
> - Dropped DU patches as they are already applied
> - Fixed revie comments from Laurent
> - Dropped patch 12/12 from v6 "drm: renesas: rz-du: mipi_dsi: Add
>   support for LPCLK clock handling" as suggested by Laurent
>=20
> v5->v6:
> - Added reviewed tag from Biju and Laurent
> - Updated commit messages
> - Dropped parentheses around the calculation
> - Added min_dclk above max_dclk in rzg2l_mipi_dsi_hw_info
> - Renamed dphy_late_init to dphy_startup_late_init
>=20
> v4->v5:
> - Split up the series
> - Added Reviewed-by tag from Biju
> - Dropped feature flags for reset and LPCLK
> - Patch 07/12 is new.
>=20
> v3->v4:
> - Corrected parameter name in rzv2h_dsi_get_pll_parameters_values()
>   description freq_millihz
> - Used MILLI instead of KILO
> - Made use of mul_u32_u32() for multiplication
> - In rzv2h_dphy_find_ulpsexit() made the array static const.
>=20
> v2->v3:
> - Update the commit message for patch 1/15 to clarify the purpose
>   of `renesas-rzv2h-dsi.h` header
> - Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
> - Replaced *_mhz to *_millihz for clarity
> - Updated u64->u32 for fvco limits
> - Initialized the members in declaration order for
>   RZV2H_CPG_PLL_DSI_LIMITS() macro
> - Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
> - Replaced `unsigned long long` with u64
> - Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
>   rzv2h_cpg_pll_clk_recalc_rate() instead
> - In rzv2h_cpg_plldsi_div_set_rate() followed the same style
>   of RMW-operation as done in the other functions
> - Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
> - Dropped rzv2h_cpg_plldsi_clk_register() and reused
>   rzv2h_cpg_pll_clk_register() instead
> - Added a guard in renesas-rzv2h-dsi.h header
> - Reverted CSDIV0_DIVCTL2() to use DDIV_PACK()
> - Renamed plleth_lpclk_div4 -> cdiv4_plleth_lpclk
> - Renamed plleth_lpclk -> plleth_lpclk_gear
> - Collected reviewed tag from Krzysztof for patch 3/15
> - Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it
>   is not needed.
> - Simplified V2H DSI timings array to save space
> - Switched to use fsleep() instead of udelay()
>=20
> v1->v2:
> - Rebased the changes on top of v6.15-rc1
> - Kept the sort order for schema validation
> - Added  `port@1: false` for RZ/V2H(P) SoC
> - Added enum for RZ/V2H as suggested by Krzysztof as the list
>   will grow in the future (while adding RZ/G3E SoC).
> - Added Reviewed-by tag from Biju and Krzysztof.
> - Replaced individual flags as reset flag
> - Dropped unused macros
> - Added missing LPCLK flag to rzvv2h info
> - Dropped FCP and VSP documentation patch and sent them separately
>=20
> Cheers,
> Prabhakar
>=20
> Lad Prabhakar (9):
>   drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
>   drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
>   drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
>   drm: renesas: rz-du: mipi_dsi: Add OF data support
>   drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional for
>     RZ/V2H(P)
>   drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency
>     calculations
>   drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
>   drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for
>     RZ/V2H(P)
>   drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring
>     VCLK and mode validation
>=20
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 151 +++++++++++++-----
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   2 -
>  2 files changed, 114 insertions(+), 39 deletions(-)
>=20
> --
> 2.49.0

Applied to drm-misc-next

Thanks,
Biju

