Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101ABAA8653
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 14:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7234710E090;
	Sun,  4 May 2025 12:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PjVfI+8Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C854910E090
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 12:33:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNtlsMUSP1VfVLQwJ2N7pJec0yUMG6vRQe+ZXmwK7rwPVvaG9IJ07zssEmmf+SB450P1tmA6H5fYBgFB4S5vDKa1IS0a2FbnK5hzR6/U4fdV4djDDZ+KS+CKbxoQrlX5iCL3WFYHCcEHjg7nNqzkW8lfIM7eg4B9mBF8niLOYyX+LSy0s76yTq/upiUEcx3/Ov2EuklHs5lBLhfihU98hT9u+m6Ptfv6wwSLCK8fTrkoRg0a+dqGPAerIwLXs27iaRan9iaawp0XlCqb07Pto+6I8rdHaNy26mrUrBpsfvbQ7OkpH2zF14HF51JK6AN2OkL0UaCdlQEzs+FXfIWl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oe4HXKKDvts6EGBS8oLwx7LvK99rRMyohcjvDTc7Srg=;
 b=y+eLaM7wAa4R2wooJ+ZpAd6UgZzmhWq8IAQ9wpBEsH3cHKjBVchPsc6Rmx7ibWyic6mAMOZQLP7Rj7BvAjajdUdb9P3EXl+uiX4mJvVJzbIYMIbtYLR6fmWXlZZVkOQLB+kw8pdmvhbGbqGgkTWwMsxuJA5HxE5M6Lw0pxODCOh2QvHQoA83EzWG4SszA7Xi4hT+Xhe6gfYQwnK+cyqSbwyCeSK/Xt/DZRCXr+zFROsZatTm7TutVJDo+MlKHxevb9HQ9wq3Scex2w02ch2oesGOJx6LzoVuVMeYes2PnX5YoiESE59dml+mGkHU2fPOOKWux7rvwaNP7xtvHsnTcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe4HXKKDvts6EGBS8oLwx7LvK99rRMyohcjvDTc7Srg=;
 b=PjVfI+8YkzKi2kHCM4298m+2s+alO1VGO+d8GBw5vdfffCy/hegZq4sr2+WlKOcdBJG51bLaGlfjqPgQzW4tePs/HH18OcppcMcq573VxFOk3axXXl2GYOj1EJFQT4bAdMTuQjydqmrt1R7RyP6Wi3azmJl6wF0voPysfemjEyY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB12626.jpnprd01.prod.outlook.com (2603:1096:604:33c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Sun, 4 May
 2025 12:33:02 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8699.022; Sun, 4 May 2025
 12:33:02 +0000
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
Subject: RE: [PATCH v4 08/15] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
Thread-Topic: [PATCH v4 08/15] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
Thread-Index: AQHbuhBCz0rjkP3SmUeE6uPVNrOVcbPCaOlw
Date: Sun, 4 May 2025 12:33:01 +0000
Message-ID: <TY3PR01MB11346F143A2F83CAD8733BD2E868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250430204112.342123-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB12626:EE_
x-ms-office365-filtering-correlation-id: 80c1b86f-2144-4e47-912b-08dd8b07cf8b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?AzNqYojQAsiFEsad32dsHXMSSeaLuT8OE7EeotvvlElFEZnxXXU+cpXTdUVg?=
 =?us-ascii?Q?kkCPPE7fEmasa4YZekZQHAlU4mLkO02K3aOW+JAFEx41ZcW2ffLFwMklQzkK?=
 =?us-ascii?Q?MGhR/mut+oCFkxsPN6izV3JO7RrFiz6YUhvi0m/uDWv+qBezrEikuHvzc6cv?=
 =?us-ascii?Q?fB8gn6hYDJc5rtbaSLMKBIeKaVCNUC0B3JHRZoSW80ZnIoi2cq0SKu51hIkL?=
 =?us-ascii?Q?IdCxV2cm0YzhGxzm955GC4tDialzppIS97N9bAmzSYhtFdncPtmyWDzwNcda?=
 =?us-ascii?Q?uiK/Ecob2WGL2TS7ODYj+5VPOyG44hrnR5qGCXnAaOIM3ZdzQXhmyhQexfrz?=
 =?us-ascii?Q?b+9RARfaMJxEGSndid0FFyZmuzFNEPZvJ7SbGzuy6HKtZeivEuu3Mzlm9fmI?=
 =?us-ascii?Q?mUjI65k2BjgD0NYdYkgxo6YKNaFFOjB/MJC/zQOC5wRMa4Z7JNB9nUNVQ33U?=
 =?us-ascii?Q?jitGJ5z1T0N7TBgYF9VCI6sQSMubg/U9eD17NzDj/qbae9Erjwd614LuuKCw?=
 =?us-ascii?Q?Rqh9nltcugU5KHzs+IIMtUzL0WlXVj4zehROoNXrlQAo4l9+qjn48qVyPO/z?=
 =?us-ascii?Q?uaB2z79jxNRuLfWBk79aTQg009S1KgYEWgtpQ100VYGYJdCXMsMf8GaFFWbG?=
 =?us-ascii?Q?3Sg4VO8UfWvmKD2d4se/TUKyplJtJfaznvCO9xedoFOF7I0KoI20YazUTPHe?=
 =?us-ascii?Q?OhbMIsZDb0Wwfd3AztBuyxZSSj4Figy5AuOa5d6Qysa+BgdoU+O1CCPlNm2R?=
 =?us-ascii?Q?/jGC+hgMCSX2ByLe17/2se+hpIztNk3MVoJ01cp+M/YgnyY0FQuEYQZ/AUSR?=
 =?us-ascii?Q?wQ/Zpfyvq3USWRexQ/zHDHV/pAZKv10bAu9N/WP0U18H6caacqYdI00I3QB1?=
 =?us-ascii?Q?6gFYeCEL76s3f9XKm0HbOZv3rLwQIXS82hNT0/Cxz/lSpZ/3OvOjHuVF+ggK?=
 =?us-ascii?Q?SOJUI461inm8JItYBbqqLkwljQoYMI36H7R0Av73qEKzhl+AERxJwftxJ6VI?=
 =?us-ascii?Q?UZhLKFQINRVuCbhpyn2zb3F0uKOCkIqCN6MzTiQ5i3bM3jlPfqoqjHOafTqP?=
 =?us-ascii?Q?Xi5BwO0opJgrufPjhWbeG99kw305/Z1VxMGK6qONlqqHygisWzNFNzObpYPk?=
 =?us-ascii?Q?/Z50q9OMDOg7pbQM+RvNCfl0rTQO7heSJuUkydpvByz5LNNu/9bheEAAZYtG?=
 =?us-ascii?Q?muRJ2+Y/BgvShYRHhBCY/AVPeqYnHxOkwIKuKb9biYNKTeOk/pu4hxDjEkdD?=
 =?us-ascii?Q?zir48qdBioG0lXtNMKv1LYQicGiqjDGTxpvw6xBAlcyHh337Xo83SLdJ0bPZ?=
 =?us-ascii?Q?OtSY4kh4qm7Asf1A4KZU9FBuFSoeOSYc6LjXvzUC7XbwRqlW+7izM847mxNc?=
 =?us-ascii?Q?/mDw2zpOPIqeoU7CFSI8lLqdrbWiiX2AsuDKAEKZoP9P76VxeGmOozz0F8sQ?=
 =?us-ascii?Q?YkgBLhUkqkZPtZYLWIM1p4eVy5eYKd0XSN8MKoGuEnbNJ1DSZZNgmZsm363g?=
 =?us-ascii?Q?DsSQk6VqZKmwrDw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H07LQC9VXK5xSwWHP6l/dgS899KBOl6jdfDHewSlko+FA6ZJ2CX0CQ7gHdv5?=
 =?us-ascii?Q?jkkWkG8U0an8e5i6R9LfSO1Mhxafln07AL/IQJodhxRCq2nQwl71cnWVATZC?=
 =?us-ascii?Q?3gFXDX7V04wyfNB+bVgcc/9pbNFzrZggBA5Tgg61yAju4e/csDDmvA3IikPX?=
 =?us-ascii?Q?tDACE7+9E6OAYjZDmFeH1xdNVy0DptgNhKALxLh1q4672U7VQJ7ZJHI7MNYF?=
 =?us-ascii?Q?rJ2HaHVKzWsI536y63SBdTCZNB+hp0Rwmt2+slb6XIS0L8moRZ9qT5IXanz6?=
 =?us-ascii?Q?UUVNTGQ1/vAWkYekOmFX0A9G+L2xRBg0JoeUaBwMm+E28LujB9fSb//GEgtp?=
 =?us-ascii?Q?NJ0GGmGiO5NvKhNXfV0ylk8FAYnsZEAx6d3Zl+kFkKpWY8XwllmhsDvGKLrh?=
 =?us-ascii?Q?mPSTgrNp3kazHg2EwqDX+QKl1Qrl9fjKJOuCX+zckNXmP0HOkGw4hqhivi3D?=
 =?us-ascii?Q?Xxham+dRZOE1uFT/KeKFRfwQ1a460uUwc/cOpmi+DkAa2/qtADJg9BFP0vcd?=
 =?us-ascii?Q?nm991TeHQ7tZhMa5/qNfsdDSpOjbpnOjBSH9akHxgX3P4Ea3Fglq+uwLNNr+?=
 =?us-ascii?Q?Ba6OPVavpYR1ZfnMzXXqcZrh7rFalLQN+24EAedV8nGcUu4hENm4xL8B3pZw?=
 =?us-ascii?Q?CUQzdyYVJKYc4oGG5WXfcAXgqv08jcv+cd5zYsEbkWQ/Tj2YngEZXdKpKD+w?=
 =?us-ascii?Q?GVDOlFQqJXizx9DQCpkWQXPoqwUpEjgYBXSIKh72bpxNpS50U+V2oeZ2tgW0?=
 =?us-ascii?Q?NsAQuCnrapTh1aCJIeRZCJRZXZkNcI9aCGu/Atz1d3XGW1V8MN5P4ZyAI7Yy?=
 =?us-ascii?Q?G9LNtPTDBrxm8YetzvgEimZ3ZrmXiCsAlKR/Mk9UwvQPJ/EpEB87I2LubS/n?=
 =?us-ascii?Q?jp/F9e9z3oImsO44QqYwuuGA7Ntt8j0N/3URKObt+h7U1LnA0oSgDO+UIcty?=
 =?us-ascii?Q?xfr9E9kTe9xPSG8mWaMUK9qzOjPQM5COBRf9wJsShpXiMKoSea83Kdz0APb3?=
 =?us-ascii?Q?YLhTNrZ5Eulw+QEjRBvT1C4/7IHxvjHsXhKUioJKtcwoVZ7KtM1TjpySgZ3f?=
 =?us-ascii?Q?gDXpkabERlbhPmYc4Xi39AUxw+BLrsV/IrKty9pUyxkaN7D7W/KlRMEcUUX6?=
 =?us-ascii?Q?qUiGCQAsridnWcNq26zCXWl4B4/MjS/PfehsZqalcnxtgSSAmOIGcRYUOEeG?=
 =?us-ascii?Q?nlGPtvhahvTDXlpCvaW0y/RC0IWYcDoPFqisZ/PCoR4nqp1UVR4c6ZeWFlvB?=
 =?us-ascii?Q?5zMckihAtDy/ypBkT642AADn5bgMiABtJHj733Mr0qTxUND/xDgxWEfgVz14?=
 =?us-ascii?Q?fesoWsxX4vn+5Y4qJOlVbv+0Rw5PYFvG8Mg6ed+nB9CNqlBOLHyQGf7LpJL2?=
 =?us-ascii?Q?t2zBCXeFaddmuL7o19zbPrpgKsNDWS31+pprfoQAkpQEP0Sdnz5wv+0QtUK6?=
 =?us-ascii?Q?568wC0w4QYHDxF0qRScre049V/gFGUqegWa0+j2WbBdQOaxfM3KxJmd5mqZS?=
 =?us-ascii?Q?wqjAKeoip3bXUOhGnLyu4AzF2U8OLh16aWZLJuk+hWBdfnuQgZZ+SBClSJOX?=
 =?us-ascii?Q?W33RnxvxkJF2IkRcFFA47WQ9N9yLY4Vh+gNyL1H3+OQ/QrJyTZ5mkyx5lb+e?=
 =?us-ascii?Q?sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c1b86f-2144-4e47-912b-08dd8b07cf8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 12:33:01.9519 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T3mDWX+Fy6t/JzoIvobzLHsTrFfMOCeAd+eqvCvKPEgM5tGIBYU6ZboiBMKAGWF6sZT3m7Aba6rcQmk3jhHePOfMQaa71ft65GBHnnnveV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12626
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
> Sent: 30 April 2025 21:41
> Subject: [PATCH v4 08/15] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSF=
REQ calculation
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual VC=
LK rate instead of the mode
> clock. The relationship between HSCLK and VCLK is:
>=20
>     vclk * bpp <=3D hsclk * 8 * lanes
>=20
> Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that HSF=
REQ accurately reflects the
> clock rate set in hardware, leading to better precision in data transmiss=
ion.
>=20
> Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division whe=
n computing `hsfreq`. Also,
> update unit conversions to use correct scaling factors for better clarity=
 and correctness.
>=20
> Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ th=
reshold comparisons to use Hz
> instead of kHz to ensure correct behavior.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - Used MILLI instead of KILO
>=20
> v2->v3:
> - No changes
>=20
> v1->v2:
> - No changes
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 ++++++++++---------
>  1 file changed, 15 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index c5f698cd74f1..911c955a3a76 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/math.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
> @@ -15,6 +16,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> +#include <linux/units.h>
>=20
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -199,7 +201,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi=
_dsi *dsi,
>  	/* All DSI global operation timings are set with recommended setting */
>  	for (i =3D 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
>  		dphy_timings =3D &rzg2l_mipi_dsi_global_timings[i];
> -		if (hsfreq <=3D dphy_timings->hsfreq_max)
> +		if (hsfreq <=3D (dphy_timings->hsfreq_max * MILLI))
>  			break;
>  	}
>=20
> @@ -258,7 +260,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mip=
i_dsi *dsi)  static int
> rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  				  const struct drm_display_mode *mode)  {
> -	unsigned long hsfreq;
> +	unsigned long hsfreq, vclk_rate;
>  	unsigned int bpp;
>  	u32 txsetr;
>  	u32 clstptsetr;
> @@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_=
dsi *dsi,
>  	u32 golpbkt;
>  	int ret;
>=20
> +	ret =3D pm_runtime_resume_and_get(dsi->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	clk_set_rate(dsi->vclk, mode->clock * MILLI);
>  	/*
>  	 * Relationship between hsclk and vclk must follow
>  	 * vclk * bpp =3D hsclk * 8 * lanes
> @@ -280,13 +288,8 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_=
dsi *dsi,
>  	 * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
>  	 */
>  	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> -	hsfreq =3D (mode->clock * bpp) / dsi->lanes;
> -
> -	ret =3D pm_runtime_resume_and_get(dsi->dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	clk_set_rate(dsi->vclk, mode->clock * 1000);
> +	vclk_rate =3D clk_get_rate(dsi->vclk);

Not sure, If there is a requested vclk for example, 108.45 MHz and get_rate=
() is returning
only 108MHz, do we need to propagate/print this error(like requested vs act=
ual, if there is a mismatch)
as there is change in resolution?

Otherwise LGTM
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju


> +	hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
>=20
>  	ret =3D rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
>  	if (ret < 0)
> @@ -304,12 +307,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
>  	 * - data lanes: maximum 4 lanes
>  	 * Therefore maximum hsclk will be 891 Mbps.
>  	 */
> -	if (hsfreq > 445500) {
> +	if (hsfreq > 445500000) {
>  		clkkpt =3D 12;
>  		clkbfht =3D 15;
>  		clkstpt =3D 48;
>  		golpbkt =3D 75;
> -	} else if (hsfreq > 250000) {
> +	} else if (hsfreq > 250000000) {
>  		clkkpt =3D 7;
>  		clkbfht =3D 8;
>  		clkstpt =3D 27;
> @@ -753,7 +756,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_devic=
e *pdev)
>  	 * mode->clock and format are not available. So initialize DPHY with
>  	 * timing parameters for 80Mbps.
>  	 */
> -	ret =3D rzg2l_mipi_dsi_dphy_init(dsi, 80000);
> +	ret =3D rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
>  	if (ret < 0)
>  		goto err_phy;
>=20
> --
> 2.49.0

