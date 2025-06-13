Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F19BAD8319
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 08:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2ED10E1AA;
	Fri, 13 Jun 2025 06:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Gc89fVcL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FCB10E1AA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 06:17:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QfyTJHSHFzJGK3cdb6WHEyCeUtjcrWKy+Az4oqWBAP1VjWnGB4b0yptV0H5TuwXp5ClJzi57+q6fwWEk9MSMN34tBWrgsDDqDivSpr9UZ3gwnqFWyoBFHLv+EnJ0JSU7DjoND7FQSG+28LILnlKJP2ToTbDnEnbgFkAKWV7eOGW7diCdC2OysyAfyttkzXacduoBWfGePfGEneUDTYhGvraQh9/vzJrWl1t4e1WcjrWj/aiGqd5Fqvy7KBJJOdbqmHgwN8aiV3rWzOEQQDKG3i3ulHmJe3ltYCDK8TMRo1lIhN+mP7B8ypQBRjpiG52IIV/jb4BubRa2mt5pbDdFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDYLvrrltn2sSyePDMOtn/IjppSAkxXRQn0ip8dDZO0=;
 b=rAUHh52/f0AZcM6SW/Pw0aN9J4F2nYLd3v0we1x8FDzOyfkAxYSs8csuknJhgkim4h73cFU6llE7cOUsb2HpyeCsd+0h0nSbb+s2GIUD/hQOjo8BWtMsqlp3MM1dCHJzhZHIcT4co1Nyht5GVGyotqv7w71Nb3lr/8Q7WckuyCE/DHixhZ+mhjC1Z5UsLA9AMFTTg08qsSFxDWyeks8VyUc81DF/UF4lJ6wYNnpAQH8lPuySTmD01STH3pmDk9ONFS07AfRBPhAzdz2j0lxkdCURWsu2713eknis2pQL5nEid9RHXuX+d45tpuvbKnjtOg6AKNHPDAZH0Cw6wZYWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDYLvrrltn2sSyePDMOtn/IjppSAkxXRQn0ip8dDZO0=;
 b=Gc89fVcLZuVsCCfXpzjHIXjzYULWHh4PmlyuXID7d2DgDBQW7Rhy8fST7yi7cKvsWFyS3jrY7BEfgE6hx1KJGGIo4NqYC3sIcJThOhA7G+onFcnvXW7PM1eo3YVyJFOkhKoOnZHr2Fn4J1DSxUb5tf5I65f4gW1Gw1U7I8MWxv4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14677.jpnprd01.prod.outlook.com (2603:1096:604:3a0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Fri, 13 Jun
 2025 06:17:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8835.023; Fri, 13 Jun 2025
 06:17:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Topic: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Index: AQHb0YbxoLXThBVJyEq0KQgkc6A6OrQAr/1Q
Date: Fri, 13 Jun 2025 06:17:55 +0000
Message-ID: <TY3PR01MB11346A62FDF84C5F2C1240BBF8677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530171841.423274-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14677:EE_
x-ms-office365-filtering-correlation-id: 06519645-4070-49d4-eaeb-08ddaa420921
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wo3vyZZYR+F1BavUFfLkvwdQ1tWDrjHsNNVp/6U5cts/nEzTJLeOmoLVwo+Q?=
 =?us-ascii?Q?2mR+vjxyJE5HdAD9PUNYB2VuR53aWfMdc7GHaeDrk5eUccLLakIpDUF5do5m?=
 =?us-ascii?Q?4TxrwjLXgxhsYsuXdeHEo+Y6CSB9Hm4+GJ6DmHp7nXi4i/GgY88vXwbSNXie?=
 =?us-ascii?Q?y4BkdYigkRoxYJ84QuD2wSDeb2Lqpr7nmdd7/m0zcGNRMHokqA86jmlRWQe0?=
 =?us-ascii?Q?wqC5otvidKDKsCpHiXiyn1lZ4Yrsi2b+AlCGsWkAl8zS52uv6vFIqJPQ2aNs?=
 =?us-ascii?Q?yf/lHBZ+08sfzxw5qs9zU94ufuZiiHQ73LaP8vTbkH52Z35iGh53C8K26UU6?=
 =?us-ascii?Q?GmKGq4TAcvwZIqGVCVzEeKs+8iueEcPesX9V1iP+l3KG4e/OV7g1ADTyZZhx?=
 =?us-ascii?Q?GYCqkn+YMzGqS0/GRRoxbMsaUPY5cj0+rHBMF91rzaGbq/7q3YsBgJlLomqK?=
 =?us-ascii?Q?gEYSdlRaO8idg+eAVCGclKJsP3wXQA/zPx4jQD2PwwrwN9ooM/LYwYkeX2rS?=
 =?us-ascii?Q?KYKdIChKtVbPKWR2zqjsWideilb8o62w2/1SkLv2LKaaowt7RxIlDhcCp2hT?=
 =?us-ascii?Q?WoQMCijCNQg2SrpD4ZhfDiN25s7l8eSvoO8Z1uz4QBnDjtBzHu126INz6l1/?=
 =?us-ascii?Q?kVFoA2lMF/PSixwBUujmZZLXkMd9+swk7JJD/5vaB1azDBdsRvGvVOVxRKxB?=
 =?us-ascii?Q?j6XFB8pxw5GUwOFqXmieTl45YxyNemV2+AjC4UPAnUORDx9oYKNnSWUqBIVk?=
 =?us-ascii?Q?0/GmkBU1rmGwPJEQbVIZokyR6ikBqYhoviwxdxJFzy2oEwm5WAL45rei4oYv?=
 =?us-ascii?Q?Q6QhdO5OeAT+OjRrjJxa4blNL+0NqFuboUDXJRa89jdRzLglM2U4A/tv8nSB?=
 =?us-ascii?Q?f1P5VU/fYCfeAcEw8wczmuIBpFZ/9ZwYRtuWc4Y0LgbiJ8atlcVm592/orid?=
 =?us-ascii?Q?FSHcF9BmVzlf9q+AXGxdZc863guceKrN6CbOmHGbs7RjzlRx5Kkav0X5ZxId?=
 =?us-ascii?Q?vZD0fqHRMJdV8prKky0S7bja3J5IDfo5Tnawf2EBz1w2KzRuEoKmioY1SKJ9?=
 =?us-ascii?Q?T4euiZxWdbXgEd3vm5QleMx0Fq8YnkKaVrCe/eR2YyOuGZ1jJp7y6SQvPHoJ?=
 =?us-ascii?Q?be8Yqjh1Vi4SfTPZxokNJUoDTvUXOW2xSJZJ3V35NSlpnMpfhyq49SMqswSV?=
 =?us-ascii?Q?WolUhhO4am8us1PaAgJBDKaVUqmMglO9O5eSozecalBrraSYAf4cXMVLI/GA?=
 =?us-ascii?Q?2JqmAhKacIHai+gOFXbnT2rR9Wy6rXqWn5vgLQdCVj2cgudrUJ0HI9/01uup?=
 =?us-ascii?Q?W+/xcmRKgCtMbzO5frQ8ESAr6obOjmpi9gwdsBV4L81uaRyIreAt7cKDl3cm?=
 =?us-ascii?Q?Byb+XFQZikpp84mvVzDSIy4u2JLeq1T67E0fri2X9tqCQiqvRrFbjvNn5/2J?=
 =?us-ascii?Q?F/u+SXdfHvwFakmxNyyc1JfyF4FF5hUL8ES2k3xjLZgenk+7ohmyXIrYeHi2?=
 =?us-ascii?Q?nPJfPGe/Av3JXEs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+JiVN4Ud6BN6ig221CtV0cmgl1hqA9XsuHnTpXmpZ7jL14S2z1inuzf8odo3?=
 =?us-ascii?Q?k4dq72e4IJJcIvFcRZHJOW9MUoVt6cuvK371pDnql37hlRHqoQ22dhqynWWE?=
 =?us-ascii?Q?yepucpsP0BmJRuIFttBYB4uxJqUUpXJD1zKDFGPrzcN8IG5Au5XHeDDs7UFV?=
 =?us-ascii?Q?7+oTwDFRLHDEgvCYhd66iQq3e0RtWQ2sb6QSEAyf+ZHP8dVCck4GichQ+9UK?=
 =?us-ascii?Q?v7gvhLSnXdZwQm+dG70560QS1bdVuKdztnaC+Io1ko24Cy99Mvq8s/WmLu6k?=
 =?us-ascii?Q?aehc+OqYHegwcwP/W1F+0zOPwHTmmiC4NmTCMM20JDDtZ/8spqHxk56T9fSZ?=
 =?us-ascii?Q?BfdoekS32vETjzJKOXlGFYxM56mDjmP9L5DKyns+ji9Chncw7BPUFnwsdzXx?=
 =?us-ascii?Q?nWax3SZ0wgwe4tzLR/RO8zKmONxCSIxq8BzMKLWEP9kVFCvH/Yns+kTOrmPb?=
 =?us-ascii?Q?77MiDRlcJf2nlHH5uwVMTkNYJ+vvIRPVc/SrEuDwq8skTTRaDdVpE5uJyuDU?=
 =?us-ascii?Q?fwkKcaVlYT4AqEhDPR2FA/62//Ansbp+jkaySeYr8r9kxvwBUaXmvul3btl5?=
 =?us-ascii?Q?dAZBsiXqjQtAtvRQMZqfaN3hyfShHUuF1AXER2/sRBlKozeF1jGwqpkwAuw+?=
 =?us-ascii?Q?SCbYC6WSRWpQL8V8dGAG4YNgtpbfWffAjjmZvMq0E0sSVBIvbWbuWtd8l1Bb?=
 =?us-ascii?Q?GqK9IqDsKSLs262rgn2yczpg6CnYA0Clgm78enuzvhgucQtadN+7vfSbWpfQ?=
 =?us-ascii?Q?ubAvk3ffcJxsW6XCb88urKxS+WaAyhqTFV3ZDvqgeDuiOogOL0Y3cZnMvXEs?=
 =?us-ascii?Q?a07YX/PS45PzRG3T/JbkPbWtn78+NIKOUYnRCViFkxHg5YQn01xIvPr11E34?=
 =?us-ascii?Q?jLQl3aALHPMg+wbHxK8vPCf4PmhND0kW5V6nk2lsUnRw1QLeU3/+pqU9todR?=
 =?us-ascii?Q?hBOeodfjPExWUJ7tMAYt6XVtCHWtGOm9wqeBexyX60/f1lPqJKPXxcUqyYvr?=
 =?us-ascii?Q?U47TiEwcsTjiQvw7gWOi8MQUCVQ/L0BlGucpHw//3SPbPmfiTgvy4Bd1xC+i?=
 =?us-ascii?Q?DDrz5+W7nVufhX0EcDA1K7fT8zCfupASbr0pitSvbaKZr24TmrkWKCpXzfYU?=
 =?us-ascii?Q?I9D26eU7iO+KOfKrO69DE7fdRHoT7FC2hX+WDC+gvkIcDWfs0Rzb9Wnr6qmh?=
 =?us-ascii?Q?+G9XPdY2tgijTo/3J+vjlSXL/3shxytMrFUUmn8N9aro4Zbbiycb34p+Snyi?=
 =?us-ascii?Q?3/ts06Tk1VlBxhOh9mcGiX6WnD3ysJuEG2/3ZZ21gVxZW1x0xWVWzXvgGNWm?=
 =?us-ascii?Q?0ht1F+HRmLGCNUhFImCEPcV8krDvMVltTW/EDUwwI8D56tyzhd//6CMqBDQ5?=
 =?us-ascii?Q?TxBTTt5h7LaEmZCKbHuRW7RwDX3FM8ji/hIvi6dSzzCrPVKFnFeJT3Asz0ZX?=
 =?us-ascii?Q?vA3eTUPx98rrNmYj6nYig6tUFuBSZ82Ecg39XulrUCEYupXdQ6r6MumVukga?=
 =?us-ascii?Q?4d56BArz6ABgXpGqBdM0wcAJ69O+wgQTtoJI3eLSKrCOnTJxxQGchDrppcUl?=
 =?us-ascii?Q?eL3xWWjV/E6zVKE+NQWqzcqLUQFRwGeUTgugKkOr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06519645-4070-49d4-eaeb-08ddaa420921
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 06:17:55.4056 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwL6BKc9yLR28qwDuOtUtlXiw6L9Fz2xy/zaTRgiITDbyTja84D/caLV8mgOT4S6G7NyITyF/2hrn5Wt8UL0Hyp7ewItsap/gE+a4K0wavc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14677
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

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 May 2025 18:19
> Subject: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for RZ=
/V2H(P) SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add DSI support for Renesas RZ/V2H(P) SoC.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v5->v6:
> - Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
>   PHYTCLKSETR_* and PHYTHSSETR_* macros.
> - Replaced 10000000UL with 10 * MEGA
> - Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
> - Replaced `i -=3D 1;` with `i--;`
> - Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
>   RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
>   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
>   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.
>=20
> v4->v5:
> - No changes
>=20
> v3->v4
> - In rzv2h_dphy_find_ulpsexit() made the array static const.
>=20
> v2->v3:
> - Simplifed V2H DSI timings array to save space
> - Switched to use fsleep() instead of udelay()
>=20
> v1->v2:
> - Dropped unused macros
> - Added missing LPCLK flag to rzv2h info
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
>  2 files changed, 379 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index a31f9b6aa920..ea554ced6713 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2022 Renesas Electronics Corporation
>   */
>  #include <linux/clk.h>
> +#include <linux/clk/renesas-rzv2h-dsi.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -30,6 +31,9 @@
>=20
>  #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
>=20
> +#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ	(80 * MEGA)
> +#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ	(1500 * MEGA)
> +
>  struct rzg2l_mipi_dsi;
>=20
>  struct rzg2l_mipi_dsi_hw_info {
> @@ -40,6 +44,7 @@ struct rzg2l_mipi_dsi_hw_info {
>  			      u64 *hsfreq_millihz);
>  	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
>  					    unsigned long mode_freq);
> +	const struct rzv2h_pll_div_limits *cpg_dsi_limits;
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
>  	unsigned long min_dclk;
> @@ -47,6 +52,11 @@ struct rzg2l_mipi_dsi_hw_info {
>  	u8 features;
>  };
>=20
> +struct rzv2h_dsi_mode_calc {
> +	unsigned long mode_freq_khz;
> +	u64 mode_freq_hz;
> +};
> +
>  struct rzg2l_mipi_dsi {
>  	struct device *dev;
>  	void __iomem *mmio;
> @@ -68,6 +78,18 @@ struct rzg2l_mipi_dsi {
>  	unsigned int num_data_lanes;
>  	unsigned int lanes;
>  	unsigned long mode_flags;
> +
> +	struct rzv2h_dsi_mode_calc mode_calc;
> +	struct rzv2h_plldsi_parameters dsi_parameters; };
> +
> +static const struct rzv2h_pll_div_limits rzv2h_plldsi_div_limits =3D {
> +	.fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA },
> +	.m =3D { .min =3D 64, .max =3D 1023 },
> +	.p =3D { .min =3D 1, .max =3D 4 },
> +	.s =3D { .min =3D 0, .max =3D 5 },
> +	.k =3D { .min =3D -32768, .max =3D 32767 },
> +	.csdiv =3D { .min =3D 1, .max =3D 1 },
>  };
>=20
>  static inline struct rzg2l_mipi_dsi *
> @@ -184,6 +206,155 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mi=
pi_dsi_global_timings[] =3D {
>  	},
>  };
>=20
> +struct rzv2h_mipi_dsi_timings {
> +	const u8 *hsfreq;
> +	u8 len;
> +	u8 start_index;
> +};
> +
> +enum {
> +	TCLKPRPRCTL,
> +	TCLKZEROCTL,
> +	TCLKPOSTCTL,
> +	TCLKTRAILCTL,
> +	THSPRPRCTL,
> +	THSZEROCTL,
> +	THSTRAILCTL,
> +	TLPXCTL,
> +	THSEXITCTL,
> +};
> +
> +static const u8 tclkprprctl[] =3D {
> +	15, 26, 37, 47, 58, 69, 79, 90, 101, 111, 122, 133, 143, 150, };
> +
> +static const u8 tclkzeroctl[] =3D {
> +	9, 11, 13, 15, 18, 21, 23, 24, 25, 27, 29, 31, 34, 36, 38,
> +	41, 43, 45, 47, 50, 52, 54, 57, 59, 61, 63, 66, 68, 70, 73,
> +	75, 77, 79, 82, 84, 86, 89, 91, 93, 95, 98, 100, 102, 105,
> +	107, 109, 111, 114, 116, 118, 121, 123, 125, 127, 130, 132,
> +	134, 137, 139, 141, 143, 146, 148, 150, };
> +
> +static const u8 tclkpostctl[] =3D {
> +	8, 21, 34, 48, 61, 74, 88, 101, 114, 128, 141, 150, };
> +
> +static const u8 tclktrailctl[] =3D {
> +	14, 25, 37, 48, 59, 71, 82, 94, 105, 117, 128, 139, 150, };
> +
> +static const u8 thsprprctl[] =3D {
> +	11, 19, 29, 40, 50, 61, 72, 82, 93, 103, 114, 125, 135, 146, 150, };
> +
> +static const u8 thszeroctl[] =3D {
> +	18, 24, 29, 35, 40, 46, 51, 57, 62, 68, 73, 79, 84, 90,
> +	95, 101, 106, 112, 117, 123, 128, 134, 139, 145, 150, };
> +
> +static const u8 thstrailctl[] =3D {
> +	10, 21, 32, 42, 53, 64, 75, 85, 96, 107, 118, 128, 139, 150, };
> +
> +static const u8 tlpxctl[] =3D {
> +	13, 26, 39, 53, 66, 79, 93, 106, 119, 133, 146,	150,
> +};
> +
> +static const u8 thsexitctl[] =3D {
> +	15, 23, 31, 39, 47, 55, 63, 71, 79, 87,
> +	95, 103, 111, 119, 127, 135, 143, 150, };
> +
> +static const struct rzv2h_mipi_dsi_timings rzv2h_dsi_timings_tables[] =
=3D {
> +	[TCLKPRPRCTL] =3D {
> +		.hsfreq =3D tclkprprctl,
> +		.len =3D ARRAY_SIZE(tclkprprctl),
> +		.start_index =3D 0,
> +	},
> +	[TCLKZEROCTL] =3D {
> +		.hsfreq =3D tclkzeroctl,
> +		.len =3D ARRAY_SIZE(tclkzeroctl),
> +		.start_index =3D 2,
> +	},
> +	[TCLKPOSTCTL] =3D {
> +		.hsfreq =3D tclkpostctl,
> +		.len =3D ARRAY_SIZE(tclkpostctl),
> +		.start_index =3D 6,
> +	},
> +	[TCLKTRAILCTL] =3D {
> +		.hsfreq =3D tclktrailctl,
> +		.len =3D ARRAY_SIZE(tclktrailctl),
> +		.start_index =3D 1,
> +	},
> +	[THSPRPRCTL] =3D {
> +		.hsfreq =3D thsprprctl,
> +		.len =3D ARRAY_SIZE(thsprprctl),
> +		.start_index =3D 0,
> +	},
> +	[THSZEROCTL] =3D {
> +		.hsfreq =3D thszeroctl,
> +		.len =3D ARRAY_SIZE(thszeroctl),
> +		.start_index =3D 0,
> +	},
> +	[THSTRAILCTL] =3D {
> +		.hsfreq =3D thstrailctl,
> +		.len =3D ARRAY_SIZE(thstrailctl),
> +		.start_index =3D 3,
> +	},
> +	[TLPXCTL] =3D {
> +		.hsfreq =3D tlpxctl,
> +		.len =3D ARRAY_SIZE(tlpxctl),
> +		.start_index =3D 0,
> +	},
> +	[THSEXITCTL] =3D {
> +		.hsfreq =3D thsexitctl,
> +		.len =3D ARRAY_SIZE(thsexitctl),
> +		.start_index =3D 1,
> +	},
> +};
> +
> +static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq) {
> +	static const unsigned long hsfreq[] =3D {
> +		1953125UL,
> +		3906250UL,
> +		7812500UL,
> +		15625000UL,
> +	};
> +	static const u16 ulpsexit[] =3D {49, 98, 195, 391};
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(hsfreq); i++) {
> +		if (freq <=3D hsfreq[i])
> +			break;
> +	}
> +
> +	if (i =3D=3D ARRAY_SIZE(hsfreq))
> +		i--;
> +
> +	return ulpsexit[i];
> +}
> +
> +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index) {
> +	const struct rzv2h_mipi_dsi_timings *timings;
> +	u16 i;
> +
> +	timings =3D &rzv2h_dsi_timings_tables[index];
> +	for (i =3D 0; i < timings->len; i++) {
> +		unsigned long hsfreq =3D timings->hsfreq[i] * 10 * MEGA;
> +
> +		if (freq <=3D hsfreq)
> +			break;
> +	}
> +
> +	if (i =3D=3D timings->len)
> +		i--;
> +
> +	return timings->start_index + i;
> +};
> +
>  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg=
, u32 data)  {
>  	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg); @@ -308,6=
 +479,160 @@ static int
> rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
>  	return 0;
>  }
>=20
> +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi=
,
> +					      unsigned long mode_freq)
> +{
> +	struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> +	struct rzv2h_plldsi_parameters dsi_parameters;
> +	u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
> +	unsigned int bpp, i;
> +
> +	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +
> +	for (i =3D 0; i < 10; i +=3D 1) {
> +		unsigned long hsfreq;
> +		bool parameters_found;
> +
> +		mode_freq_hz =3D mul_u32_u32(mode_freq, KILO) + i;
> +		mode_freq_millihz =3D mode_freq_hz * MILLI;
> +		parameters_found =3D rzv2h_dsi_get_pll_parameters_values(dsi->info->cp=
g_dsi_limits,
> +								       &cpg_dsi_parameters,
> +								       mode_freq_millihz);
> +		if (!parameters_found)
> +			continue;
> +
> +		hsfreq_millihz =3D DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.freq_milli=
hz * bpp,
> +						       dsi->lanes);
> +		parameters_found =3D rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi=
_div_limits,
> +								       &dsi_parameters,
> +								       hsfreq_millihz);
> +		if (!parameters_found)
> +			continue;
> +
> +		if (abs(dsi_parameters.error_millihz) >=3D 500)
> +			continue;
> +
> +		hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
> +		if (hsfreq >=3D RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ &&
> +		    hsfreq <=3D RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ) {
> +			memcpy(&dsi->dsi_parameters, &dsi_parameters, sizeof(dsi->dsi_paramet=
ers));
> +			dsi->mode_calc.mode_freq_khz =3D mode_freq;
> +			dsi->mode_calc.mode_freq_hz =3D mode_freq_hz;
> +			return MODE_OK;
> +		}
> +	}
> +
> +	return MODE_CLOCK_RANGE;
> +}
> +
> +static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned lon=
g mode_freq,
> +				u64 *hsfreq_millihz)
> +{
> +	struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_parameters=
;
> +	unsigned long status;
> +
> +	if (dsi->mode_calc.mode_freq_khz !=3D mode_freq) {
> +		status =3D rzv2h_dphy_mode_clk_check(dsi, mode_freq);
> +		if (status !=3D MODE_OK) {
> +			dev_err(dsi->dev, "No PLL parameters found for mode clk %lu\n",
> +				mode_freq);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	clk_set_rate(dsi->vclk, dsi->mode_calc.mode_freq_hz);

Not sure, Can we use the DSI divider required based on the data rate (vclk,=
 bpp and numlanes) here

and then the set parent clk of PLLDSI as well here (dsi->vclk * the divider=
 value) ??

24MHZ->PLL DSI->DSI DIVIDER->VCLOCK

Maybe then the clock framework has all the information for setting PLL_DSI =
and DSI_DIVIDER clks??

Cheers,
Biju


> +	*hsfreq_millihz =3D dsi_parameters->freq_millihz;
> +
> +	return 0;
> +}
> +
> +static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> +				    u64 hsfreq_millihz)
> +{
> +	struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_parameters=
;
> +	unsigned long lpclk_rate =3D clk_get_rate(dsi->lpclk);
> +	u32 phytclksetr, phythssetr, phytlpxsetr, phycr;
> +	struct rzg2l_mipi_dsi_timings dphy_timings;
> +	u16 ulpsexit;
> +	u64 hsfreq;
> +
> +	hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
> +
> +	if (dsi_parameters->freq_millihz =3D=3D hsfreq_millihz)
> +		goto parameters_found;
> +
> +	if (rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
> +						dsi_parameters, hsfreq_millihz))
> +		goto parameters_found;
> +
> +	dev_err(dsi->dev, "No PLL parameters found for HSFREQ %lluHz\n", hsfreq=
);
> +	return -EINVAL;
> +
> +parameters_found:
> +	dphy_timings.tclk_trail =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKTRAILCTL);
> +	dphy_timings.tclk_post =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKPOSTCTL);
> +	dphy_timings.tclk_zero =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKZEROCTL);
> +	dphy_timings.tclk_prepare =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKPRPRCTL);
> +	dphy_timings.ths_exit =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSEXITCTL);
> +	dphy_timings.ths_trail =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSTRAILCTL);
> +	dphy_timings.ths_zero =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSZEROCTL);
> +	dphy_timings.ths_prepare =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSPRPRCTL);
> +	dphy_timings.tlpx =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TLPXCTL);
> +	ulpsexit =3D rzv2h_dphy_find_ulpsexit(lpclk_rate);
> +
> +	phytclksetr =3D FIELD_PREP(PHYTCLKSETR_TCLKTRAILCTL, dphy_timings.tclk_=
trail) |
> +		      FIELD_PREP(PHYTCLKSETR_TCLKPOSTCTL, dphy_timings.tclk_post) |
> +		      FIELD_PREP(PHYTCLKSETR_TCLKZEROCTL, dphy_timings.tclk_zero) |
> +		      FIELD_PREP(PHYTCLKSETR_TCLKPRPRCTL, dphy_timings.tclk_prepare);
> +	phythssetr =3D FIELD_PREP(PHYTHSSETR_THSEXITCTL, dphy_timings.ths_exit)=
 |
> +		     FIELD_PREP(PHYTHSSETR_THSTRAILCTL, dphy_timings.ths_trail) |
> +		     FIELD_PREP(PHYTHSSETR_THSZEROCTL, dphy_timings.ths_zero) |
> +		     FIELD_PREP(PHYTHSSETR_THSPRPRCTL, dphy_timings.ths_prepare);
> +	phytlpxsetr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYTLPXSETR) & ~PHYTLPXSET=
R_TLPXCTL;
> +	phytlpxsetr |=3D FIELD_PREP(PHYTLPXSETR_TLPXCTL, dphy_timings.tlpx);
> +	phycr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYCR) & ~GENMASK(9, 0);
> +	phycr |=3D FIELD_PREP(PHYCR_ULPSEXIT, ulpsexit);
> +
> +	/* Setting all D-PHY Timings Registers */
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTCLKSETR, phytclksetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTHSSETR, phythssetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTLPXSETR, phytlpxsetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYCR, phycr);
> +
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET0R,
> +				 FIELD_PREP(PLLCLKSET0R_PLL_S, dsi_parameters->s) |
> +				 FIELD_PREP(PLLCLKSET0R_PLL_P, dsi_parameters->p) |
> +				 FIELD_PREP(PLLCLKSET0R_PLL_M, dsi_parameters->m));
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R,
> +				 FIELD_PREP(PLLCLKSET1R_PLL_K, dsi_parameters->k));
> +	fsleep(20);
> +
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, PLLENR_PLLEN);
> +	fsleep(500);
> +
> +	return 0;
> +}
> +
> +static void rzv2h_mipi_dsi_dphy_startup_late_init(struct rzg2l_mipi_dsi
> +*dsi) {
> +	fsleep(220);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYRSTR, PHYRSTR_PHYMRSTN); }
> +
> +static void rzv2h_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi) {
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, 0); }
> +
>  static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  				  const struct drm_display_mode *mode)  { @@ -410,6 +735,9 @@ static=
 void
> rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
>  	case 18:
>  		vich1ppsetr =3D VICH1PPSETR_DT_RGB18;
>  		break;
> +	case 16:
> +		vich1ppsetr =3D VICH1PPSETR_DT_RGB16;
> +		break;
>  	}
>=20
>  	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) && @@ -862,6 +11=
90,22 @@ static void
> rzg2l_mipi_dsi_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>=20
> +RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
> +
> +static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info =3D {
> +	.dphy_init =3D rzv2h_mipi_dsi_dphy_init,
> +	.dphy_startup_late_init =3D rzv2h_mipi_dsi_dphy_startup_late_init,
> +	.dphy_exit =3D rzv2h_mipi_dsi_dphy_exit,
> +	.dphy_mode_clk_check =3D rzv2h_dphy_mode_clk_check,
> +	.dphy_conf_clks =3D rzv2h_dphy_conf_clks,
> +	.cpg_dsi_limits =3D &rzv2h_cpg_pll_dsi_limits,
> +	.phy_reg_offset =3D 0x10000,
> +	.link_reg_offset =3D 0,
> +	.min_dclk =3D 5440,
> +	.max_dclk =3D 187500,
> +	.features =3D RZ_MIPI_DSI_FEATURE_16BPP, };
> +
>  static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {
>  	.dphy_init =3D rzg2l_mipi_dsi_dphy_init,
>  	.dphy_exit =3D rzg2l_mipi_dsi_dphy_exit, @@ -872,6 +1216,7 @@ static co=
nst struct
> rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {  };
>=20
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> +	{ .compatible =3D "renesas,r9a09g057-mipi-dsi", .data =3D
> +&rzv2h_mipi_dsi_info, },
>  	{ .compatible =3D "renesas,rzg2l-mipi-dsi", .data =3D &rzg2l_mipi_dsi_i=
nfo, },
>  	{ /* sentinel */ }
>  };
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/driver=
s/gpu/drm/renesas/rz-
> du/rzg2l_mipi_dsi_regs.h
> index 16efe4dc59f4..87963871cacd 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -40,6 +40,39 @@
>  #define DSIDPHYTIM3_THS_TRAIL(x)	((x) << 8)
>  #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
>=20
> +/* RZ/V2H DPHY Registers */
> +#define PLLENR				0x000
> +#define PLLENR_PLLEN			BIT(0)
> +
> +#define PHYRSTR				0x004
> +#define PHYRSTR_PHYMRSTN		BIT(0)
> +
> +#define PLLCLKSET0R			0x010
> +#define PLLCLKSET0R_PLL_S		GENMASK(2, 0)
> +#define PLLCLKSET0R_PLL_P		GENMASK(13, 8)
> +#define PLLCLKSET0R_PLL_M		GENMASK(25, 16)
> +
> +#define PLLCLKSET1R			0x014
> +#define PLLCLKSET1R_PLL_K		GENMASK(15, 0)
> +
> +#define PHYTCLKSETR			0x020
> +#define PHYTCLKSETR_TCLKTRAILCTL        GENMASK(7, 0)
> +#define PHYTCLKSETR_TCLKPOSTCTL         GENMASK(15, 8)
> +#define PHYTCLKSETR_TCLKZEROCTL         GENMASK(23, 16)
> +#define PHYTCLKSETR_TCLKPRPRCTL         GENMASK(31, 24)
> +
> +#define PHYTHSSETR			0x024
> +#define PHYTHSSETR_THSEXITCTL           GENMASK(7, 0)
> +#define PHYTHSSETR_THSTRAILCTL          GENMASK(15, 8)
> +#define PHYTHSSETR_THSZEROCTL           GENMASK(23, 16)
> +#define PHYTHSSETR_THSPRPRCTL           GENMASK(31, 24)
> +
> +#define PHYTLPXSETR			0x028
> +#define PHYTLPXSETR_TLPXCTL             GENMASK(7, 0)
> +
> +#define PHYCR				0x030
> +#define PHYCR_ULPSEXIT                  GENMASK(9, 0)
> +
>  /* --------------------------------------------------------*/
>=20
>  /* Link Status Register */
> @@ -116,6 +149,7 @@
>=20
>  /* Video-Input Channel 1 Pixel Packet Set Register */
>  #define VICH1PPSETR			0x420
> +#define VICH1PPSETR_DT_RGB16		(0x0e << 16)
>  #define VICH1PPSETR_DT_RGB18		(0x1e << 16)
>  #define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
>  #define VICH1PPSETR_DT_RGB24		(0x3e << 16)
> --
> 2.49.0

