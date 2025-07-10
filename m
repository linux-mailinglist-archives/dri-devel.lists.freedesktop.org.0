Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73EAAFFE9D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 11:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420AE10E1BF;
	Thu, 10 Jul 2025 09:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="MTR3kIa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010009.outbound.protection.outlook.com [52.101.228.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AA910E1BF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 09:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlrSMpAqQ+AQLANZaNZx9jhZuJsoxxkAxY9FNYHGn7BuKWWebocxPVucGMLTniHgv893X9AedHSdcGGFvtDwj0Zlgks7qGmTbqGiDN66k0hSdSlazQuXjZlwHhOwAXv8xIorlix9TG5JTCxW1Y8U9/keuIEeLMlTrbhYeT+Fu52wlo0h6O5SX6Dk8S4+LKPwhI1NDnvFvjfNa5rlqC9zTd4gGt6Ei8aiWWYh39grXOKtP2ZXy8V62QywNv4tGPOorqHX2DnxRIvq3s2CQMirBCTFiQcgLXUmzHKXoA+l/uxxKJ6aZKtEIT0uw841X1a+LE9oTjbxzgCI43Da5ef2cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIUqnG7f0HalOGRsOSEF400mwgql3Us+rQzuwWAY8zU=;
 b=C95p8CHG/PF2PyeybhEjhCJOhIc5Q3SvrM+VLRXBOtCT20faZ/GV0tW6RxiNjmzmRg02s7juqgsZ2PwGCXmmEy3oLPBClkkQo6TjdkDIPtp4fKnzUwI6W3vZidD5ZW/OKZovouVOUMNaUZ9zEOh1lJd3ddyaQp11Cqn9e3++fPpsVMAxot7M/lkviGSSc/ZMCVrPY2l3cgjJLYAOBWSxW/Z/sbf3MuCaVDY84pvSjMzFlhDM/ClQKH0tA2ZAJjneh3Pm1lv+EpC0zsMtnhDKZbOyWaMSre17GsJlKdr9kegKTioszs3eDqyX0c3m9NYjlzQCXUC+tcF0XFFJT7S9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIUqnG7f0HalOGRsOSEF400mwgql3Us+rQzuwWAY8zU=;
 b=MTR3kIa93SWp2uwO+W+4RArczZ2JIIJsltfXYVNLXiSJ0J/W1gJVuIICMcKNbmed/zPszp0opkhbRqwcO429KiC44XXQ8CC2j1z6t/McbGgPrA8yos/1bmtg4bizmDVyHxy1p+g47HBUociFMhsJ3HiG9q4/OTPY4DKRKjNdjmk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB9378.jpnprd01.prod.outlook.com (2603:1096:604:1d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 09:59:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 09:59:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Chris Brandt <Chris.Brandt@renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Chris
 Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHb8RPt3idI+6NLCEqifbue2Fo4mLQrF4hw
Date: Thu, 10 Jul 2025 09:59:38 +0000
Message-ID: <TY3PR01MB1134628601112EF2B32F3358D8648A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250709205532.747596-1-chris.brandt@renesas.com>
 <20250709205532.747596-2-chris.brandt@renesas.com>
In-Reply-To: <20250709205532.747596-2-chris.brandt@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB9378:EE_
x-ms-office365-filtering-correlation-id: 098c26ac-978e-4009-3597-08ddbf987bd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2tdcYhNJircLtP5bgMIDLXgmBtmfBcRRsdxC4e5mx7S1KNaLLYLoAlGrfgj4?=
 =?us-ascii?Q?8+fPR9IuT8/0+v3OHnvY7PRL6E3chEzq+kKINgN23GgmL5QdeJiuFY5Hh1vg?=
 =?us-ascii?Q?rwcszCIIm193e+d75pz++Jow6zxlhBppTU8HBIvjpkxsWgCkaAeQPgZpF7oK?=
 =?us-ascii?Q?/1J4G36x2cUMCpuNiZjh15fwxtSD70eqGkIv65uMtjsPRlFuAPyvg1B8Cl7j?=
 =?us-ascii?Q?DNVpoU25j6peoLNg5lnejLix8y9t5/XazxCHHFSAhTGLiEHZ4CnCHX67q+Kl?=
 =?us-ascii?Q?cmfZxbmrnvMKt2FilX/toiIta2mW/E+2Uk5qr+4VgX+JiO2+jquc+WpzyFci?=
 =?us-ascii?Q?i9taIFtMYATNvQLUH51bXAeDCBsnZ2BCwklCrcaVs7ogVD4Cu0woBHZhPLW9?=
 =?us-ascii?Q?Znb7YaT49Wy6OJa2W5v2lzDbiL9i5lZaFv4sBdsjx2/KIeSGK9JEky4hzZWO?=
 =?us-ascii?Q?lxSWFAN64taCnGqtNXKW8r/sdj73Ssj+ZJ+i5B7qm667F25JDpZlR4pSEXkB?=
 =?us-ascii?Q?ol2wK/dEz7ue/y7NzGs0iU8Mq5pXpuLEarf6wplTdEsF62FmoIx9DFUtKONd?=
 =?us-ascii?Q?v4u0YF7+6JWCoU9wTb5tLDvHb71MlRyJuQCjGyGHQPh8RlFSS2G81xD8y2Yf?=
 =?us-ascii?Q?1EeFbFzSPy3Hv9MhF/4+EBaloyJy8SvpesB5okq1c7fngiK9SO/wPTqnMkiU?=
 =?us-ascii?Q?o0l0EXhfVncIV4M+gd+ScSR8vSFLcK4w93rVi4Sza6YXHTO4znnUmQoTCxz9?=
 =?us-ascii?Q?UpU8VASyIDMZL+n8FRPT+lleMkQNgPo+MeNuDl86W4kla6q/Gk0Js4RRhdGt?=
 =?us-ascii?Q?w/6ohOgjlj2WNQvrkSafL16SDRYKlNTIAUo517+4c219+FKgiV5s7twf+GIB?=
 =?us-ascii?Q?/cZ7sQpUv2P5R1niZmbamIMUhtpQkLXj3pTpKTMu/JpTOFDkLHg9456UneUh?=
 =?us-ascii?Q?RI7p0S5DrHgSLRIY5JuymlEpZ+VAlHe38NxLbeLeuGOrVY6HaAlIUEro/5xt?=
 =?us-ascii?Q?8afiVgIvPI14xxOJ1d0M94LHpkP3xY9K49qGpFDYMifAYEVIcidf1d1bRjds?=
 =?us-ascii?Q?AxArO0cRmvAJJfBIBpCejuYvxIZoRMwzIjLGfXdIdN7W+CsrknMvQjUTaKtC?=
 =?us-ascii?Q?vaK9EV3sMau5UhFR+hU1CYOTG94xgd7eqkxnmkuIO+ziwHi3O6tFQTPyAJqO?=
 =?us-ascii?Q?01nLW66DqmhWCbVIAWBzytkyQgPfGW1gFsZfAmJYntLqJ/K2nE9TH40b+h6k?=
 =?us-ascii?Q?6Lcq3J7kxY+0AvoFvianww3PbC5BK7r4mC/N+YckozImKyNPqZd2Ge+oqOsH?=
 =?us-ascii?Q?3Wb7inZlvNN+FSxanpvTCTIheTJCblRFVo6bJW/3wbShLp55zlD+qzdQesRl?=
 =?us-ascii?Q?zL4PdD3Nv/ELK2Z0t2EQGm2YUgy4JXhvTOtd9Sd66gGQHpOc2gBS8NMvRpII?=
 =?us-ascii?Q?tE4JqAZLWCuqo6TEqukRq6N+JhyOoz6lLnesdZl1FwsUfNnSpeEAAV1P6hz6?=
 =?us-ascii?Q?imU1W+T4KwmYpoM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RWMkZqIMtvsgGL+9ajr6pikzvUJWMeqRCDhiEWFzZCANcdWCoQuLu6kYA8WM?=
 =?us-ascii?Q?U5cxbX+O1qvus5xveF1YBRKwyCaSRfGeOmIKzdJ0IcNJfbKFtk34V2kvzQxc?=
 =?us-ascii?Q?UGkStzILztJohl35/SZQzwi60OB677rIIAMKvqkt8/LPvenmwxWegoT1avIq?=
 =?us-ascii?Q?ePfKs5dX49Xgto+rktiiNsbXBmY/+ZNEnU1R1hlo+z0SQ9N4i5CHBqXCc+Ga?=
 =?us-ascii?Q?smioK/TqCgxrlfxLC6JWRqoUhx97ZMfI2JVm7y3os57izcN64wiNVWPhoOBR?=
 =?us-ascii?Q?3EQeFMDnzhMPW0VI4C+lVfVPyIwHhInjL4IcAqO23YY5S6BM13Nk9z6aaZG3?=
 =?us-ascii?Q?p0BDw7ja5PmcUYdgWRtIrKmks9tWZen4K9bvDVYt8+Ul0k04ujjhArCcoyrk?=
 =?us-ascii?Q?JsxQz77BhrYjrc4fbHXTJHUoS+8W3/yWdumLey2xhXnGBr2kDhpxpNLnVYZj?=
 =?us-ascii?Q?bclSbM2aawu49LQ0++4UrKNkewjC46xTxwPs4jGkFsjC74Dx3EVCs8rwxNgn?=
 =?us-ascii?Q?u9FzvNVShJnL5n1r6W1KPbtR3+pHrM/SOim8QFcVx8B/vurqdkFK8i8yx71S?=
 =?us-ascii?Q?H28lMVno0fnTlkgs070575xjkueNF6NdZ3KevloFFMrjrO5smNhJEMuTZfb8?=
 =?us-ascii?Q?he99FcisWcSdPq8QzlEP9PNK9gpgKNcxftlLanH7oV6w8ejnzRzS6jPkmZlE?=
 =?us-ascii?Q?YfKtRyI9SzEVk+6trkg8HaFWSacP1hy4WvW4Wnsi9r0HYznFtMuhBKoMssip?=
 =?us-ascii?Q?VYX45CB/SzR/7LJUoHUDzeXCJ2Mm/YglREGpUJ7xl5J0KzSH03mmK48uMyfd?=
 =?us-ascii?Q?rxecLWtjFsmu4wqnbBlBoaypIhJODvQ08fPIcQoWrOZf9PHadxkKFLOclxR3?=
 =?us-ascii?Q?KSUkpvSk8G3CyP/DB3RwwIYDHAqogcdnQnXvuVaMG+XaGNtZ7vAwYJT1AaZ3?=
 =?us-ascii?Q?BdG9TXBKaIwSKj6t1qo/p9VCW4u5XFi9LOXQrDBHcK8EX5c+ryYI38+k0Rzh?=
 =?us-ascii?Q?4qtboPLBi14FhlpTeIk00qrBRU5TMn6a12qBWlPxo1avtctetX6Toarc3FJG?=
 =?us-ascii?Q?CCPOnwgM9OEFAIBlUkS3Chh0ROnv4GzQPGAaBKnZLxyab7j8UXfSccj3Yuae?=
 =?us-ascii?Q?hbWWpM06uZ3BIPBGW38ExbiByQTAGq0BsN9j7ltUOGAvFp2z6nzvfcHnNMKH?=
 =?us-ascii?Q?mKT52irpYiBSTBVr/S7HLQIUrzN49VrRwNAFTAWfp9+lTz0I2Dr2wBKnQers?=
 =?us-ascii?Q?/qfire39ZClBLqWC4piH6wAax+hA6ogUusn7WFGXq4LNXrN4b2GpZZLxQzip?=
 =?us-ascii?Q?M+6TxtYleGcBZHREv/MbC6m7HA/dVjAQ3n6eub6+BCMv0USFxbe7lSrFzC0k?=
 =?us-ascii?Q?odvhsKZziD08aqdR5YcYWtlN4M3ic4PtW602QcMATumSM9gPiRNf39BjSt3T?=
 =?us-ascii?Q?w4sj2qy0NuY2WIFDz33Wlh/Br+l80aGqRSzqCT+6/0A4xh0a30hwRhQL0pcZ?=
 =?us-ascii?Q?7xnyCDdq0bF5eBxcHEijDinswiyfBj2RTsXybiHaipgmKMA2jT6h4QAWmjBR?=
 =?us-ascii?Q?3yl/95Jj85OPaWGpk6PmmH7tZA+zj7Edn0cVTLxeiYmYXbKX4+w1WUH6onla?=
 =?us-ascii?Q?sg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 098c26ac-978e-4009-3597-08ddbf987bd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 09:59:38.9396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jp5I2PLKhbySn4kEhgqa5NIjXNsOA8X5WKlDpJ4S7xb+OQGAy/u9hBsUgxgI4NXvnI4GUYWVOQlqDej54HFQQjZ8KvyVH7O00HWhnzO/J6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9378
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
> Sent: 09 July 2025 21:56
> Subject: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate restricti=
ons
>=20
> Convert the limited MIPI clock calculations to a full range of settings b=
ased on math including H/W
> limitation validation.
> Since the required DSI division setting must be specified from external s=
ources before calculations,
> expose a new API to set it.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 113 +++++++++++++++++++++++++++++---
>  include/linux/clk/renesas.h     |   4 ++
>  2 files changed, 107 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-=
cpg.c index
> a8628f64a03b..317e50f5b967 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -68,6 +68,19 @@
>=20
>  #define MAX_VCLK_FREQ		(148500000)
>=20
> +#define PLL5_FOUTVCO_MIN	800000000
> +#define PLL5_FOUTVCO_MAX	3000000000
> +#define PLL5_POSTDIV_MIN	1
> +#define PLL5_POSTDIV_MAX	7
> +#define PLL5_POSTDIV_DEF	1
> +#define PLL5_REFDIV_MIN		1
> +#define PLL5_REFDIV_MAX		2
> +#define PLL5_REFDIV_DEF		1
> +#define PLL5_INTIN_MIN		20
> +#define PLL5_INTIN_MAX		320
> +#define PLL5_INTIN_DEF		125
> +#define PLL5_FRACIN_DEF		0
> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw
> @@ -123,6 +136,9 @@ struct rzg2l_pll5_param {
>  	u8 pl5_spread;
>  };
>=20
> +/* Required division ratio for the MIPI clock */ int dsi_div_ab;
> +

static int dsi_div_ab;

>  struct rzg2l_pll5_mux_dsi_div_param {
>  	u8 clksrc;
>  	u8 dsi_div_a;
> @@ -548,24 +564,93 @@ rzg2l_cpg_sd_mux_clk_register(const struct cpg_core=
_clk *core,  }
>=20
>  static unsigned long
> -rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_pll5_param *params,
> +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> +			       struct rzg2l_pll5_param *params,
>  			       unsigned long rate)
>  {
>  	unsigned long foutpostdiv_rate, foutvco_rate;
> +	u8 div =3D 1;
> +	bool found =3D 0;
> +	int a, b;
> +
> +	if (priv->mux_dsi_div_params.clksrc)
> +		div =3D 2;
> +

for the DPI, DIV_DSI_B =3D 1 and DIV_DSI_A =3D{2, 4, 8}

So, you need to adjust the below calculation for DPI as well??

Not sure do we need DSI driver registering a callback with CPG driver and=20
CPG driver uses the callback to get DSI divider value and this callback
can be used to distinguish DPI from DSI??

Maybe Geert can provide more input on this?


> +	/* Calculate the DIV_DSI_A and DIV_DSI_B based on the final DIV DSI */
> +	for (a =3D 0; a < 4; a++) {
> +		for (b =3D 0; b < 16; b++) {
> +			if (((1 << a) * (b + 1)) =3D=3D dsi_div_ab) {
> +				priv->mux_dsi_div_params.dsi_div_a =3D a;
> +				priv->mux_dsi_div_params.dsi_div_b =3D b;
> +
> +				goto found_dsi_div;
> +			}
> +		}
> +	}
> +
> +found_dsi_div:
> +	/*
> +	 * Below conditions must be set for PLL5 parameters:
> +	 * - REFDIV must be between 1 and 2.
> +	 * - POSTDIV1/2 must be between 1 and 7.
> +	 * - INTIN must be between 20 and 320.
> +	 * - FOUTVCO must be between 800MHz and 3000MHz.
> +	 */
> +	for (params->pl5_postdiv1 =3D PLL5_POSTDIV_MIN;
> +	     params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
> +	     params->pl5_postdiv1++) {
> +		for (params->pl5_postdiv2 =3D PLL5_POSTDIV_MIN;
> +		     params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
> +		     params->pl5_postdiv2++) {
> +			foutvco_rate =3D rate * ((1 << priv->mux_dsi_div_params.dsi_div_a) *
> +					       (priv->mux_dsi_div_params.dsi_div_b + 1)) *
> +					      div * params->pl5_postdiv1 * params->pl5_postdiv2;
> +			if (foutvco_rate < PLL5_FOUTVCO_MIN + 1 ||
> +			    foutvco_rate > PLL5_FOUTVCO_MAX - 1)
> +				continue;
> +
> +			for (params->pl5_refdiv =3D PLL5_REFDIV_MIN;
> +			     params->pl5_refdiv < PLL5_REFDIV_MAX + 1;
> +			     params->pl5_refdiv++) {
> +				params->pl5_intin =3D (foutvco_rate * params->pl5_refdiv) /
> +						    (EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +				if (params->pl5_intin < PLL5_INTIN_MIN + 1 ||
> +				    params->pl5_intin > PLL5_INTIN_MAX - 1)
> +					continue;
> +				params->pl5_fracin =3D div_u64(((u64)
> +						     (foutvco_rate * params->pl5_refdiv) %
> +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> +				found =3D 1;
> +				goto found_clk;
> +			}
> +		}
> +	}
> +
> +found_clk:
> +	if (!found) {

Can we add a dev_dbg statement here for !found clock?

> +		params->pl5_intin =3D PLL5_INTIN_DEF;
> +		params->pl5_fracin =3D PLL5_FRACIN_DEF;
> +		params->pl5_refdiv =3D PLL5_REFDIV_DEF;
> +		params->pl5_postdiv1 =3D PLL5_POSTDIV_DEF;
> +		params->pl5_postdiv2 =3D PLL5_POSTDIV_DEF;
> +	}
>=20
> -	params->pl5_intin =3D rate / MEGA;
> -	params->pl5_fracin =3D div_u64(((u64)rate % MEGA) << 24, MEGA);
> -	params->pl5_refdiv =3D 2;
> -	params->pl5_postdiv1 =3D 1;
> -	params->pl5_postdiv2 =3D 1;
>  	params->pl5_spread =3D 0x16;
>=20
>  	foutvco_rate =3D div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
> -					   (params->pl5_intin << 24) + params->pl5_fracin),
> -			       params->pl5_refdiv) >> 24;
> +		       (params->pl5_intin << 24) + params->pl5_fracin),
> +		       params->pl5_refdiv) >> 24;
>  	foutpostdiv_rate =3D DIV_ROUND_CLOSEST_ULL(foutvco_rate,
>  						 params->pl5_postdiv1 * params->pl5_postdiv2);
>=20
> +	/* If foutvco is above 1.5GHz, change parent and recalculate */
> +	if (priv->mux_dsi_div_params.clksrc && (foutvco_rate > 1500000000)) {

Check patch is complaining:

CHECK: Unnecessary parentheses around 'foutvco_rate > 1500000000'
#146: FILE: drivers/clk/renesas/rzg2l-cpg.c:648:
+	if (priv->mux_dsi_div_params.clksrc && (foutvco_rate > 1500000000)) {
total: 0 errors, 0 warnings, 1 checks, 172 lines checked
NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplac=
e.
0002-clk-renesas-rzg2l-Remove-DSI-clock-rate-restrictions.patch has style p=
roblems, please review.


Cheers,
Biju
