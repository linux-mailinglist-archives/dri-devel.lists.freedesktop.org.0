Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D8FC50C93
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 07:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA63E10E12B;
	Wed, 12 Nov 2025 06:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EPlEranA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2D110E12B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 06:56:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vw/iy1KzvMXm4Bavn6qu+JowjmWY6txtX9iXMAON6VqIyToqY+p3RLB+oLFxDW44028hjg7c8+IX9ajDLsG5a2klyue99LeouD9gpMBI8goDKAQMUORln7JvagWEVc8nW/JB66up4FWO8qMP8CMHT34Kdhq4Jt8DOxKxXaPVJPyNFDpJcadGDbnvXdiM7JTS2UneULBqX3c8AABKHn5ZK+WDp1eSOrlBo+UCm6yrY16DsHiZGAQwcCD0UzfnmvDzp3nNr79d4hbM01kNLl0/Uvz8PfxXUZMCl8N2Bx6N/w4JI8pJcNH4HCYyvaqU09OMcAlL0EkXsbPXNVVP+fcpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFrxxMLJrgPbQn3XCpSyX/p2GkTuj9W7p5gSA1rUlVI=;
 b=B3K6WPa6hoMvEKxiQf3qhi5BndwXfKcEmWb6BLMAafCtmB93XBrrygr8e1S1fEA4bhQ8eKwzAIY8RUaFffLh4EHv7KagbDJYMCOIVxEyBUUpqnbim8up6v1Mx7TzzGCU/yPgkcmKfO34vf+J4lZivbst4+L+V3/qDBRWr0xDtX8Gbq0St7gcsCmeAGpv18D34SDdY8ZDxi/H/2DtoreNG7XG9ebhtDgJrb4gXiCkVRv+19McY7IkJs1tEykZYgZWeS6ds25ScAr/f5U7UwbxBI1MJoxKyUNCKMjbyNZ/S65UORPRdrWmriAHZKdB/kTMrHFyFEeSWuJGxFczYUjanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFrxxMLJrgPbQn3XCpSyX/p2GkTuj9W7p5gSA1rUlVI=;
 b=EPlEranAfxZdyoyNY3DTldSfJzLtuCAEcshD81Ej+mPb9ERK8xfuTOnrpxy0pHltNTkoIjLUgNQEsTlPMS0VdlVwcsaeNDXVSZNjGKL/tHr+eedfLZ05262moCovb4VhAz+mBbERleZ8wSXdWqRAP7I9MCceicr7mHdXyonTXjE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB10374.jpnprd01.prod.outlook.com (2603:1096:604:1fa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 06:56:14 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 06:56:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Chris Brandt <Chris.Brandt@renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
CC: "airlied@gmail.com" <airlied@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "geert+renesas@glider.be"
 <geert+renesas@glider.be>, Hien Huynh <hien.huynh.px@renesas.com>,
 "hugo@hugovil.com" <hugo@hugovil.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
Subject: RE: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcUIhzzvEMa+4Ez0iYgZqH/QRQ77TtxCkggADbmGA=
Date: Wed, 12 Nov 2025 06:56:14 +0000
Message-ID: <TY3PR01MB11346555E90212D667267082686CCA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <CWLP123MB44995816738B58D66F4729B0FCC0A@CWLP123MB4499.GBRP123.PROD.OUTLOOK.COM>
 <OS3PR01MB8319B194964E67E3F7EFC86E8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB8319B194964E67E3F7EFC86E8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB10374:EE_
x-ms-office365-filtering-correlation-id: 8d7e6258-c87c-4eac-1daf-08de21b8920c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YnqTXJIPbkfQ4/jDLxhLKhsi5Hdq13Z5W45hx0qgM/qNelpU505TAiJx8xDu?=
 =?us-ascii?Q?FaAJzgLBhZ1YCt5xVIkH8wAq2sdYgeYt4LdNcLAbHHyvVaLowP1p6IDbcuak?=
 =?us-ascii?Q?XdFfT/MdFsX7YZvR1puipBd4QG361pY1hKO+1rN2fzJcKZMTiZVqu6yQzO56?=
 =?us-ascii?Q?JnQjTTh4nMEuWuGu3O8hzHFOl+UaS1JEuB1KxN18ZsiXGYRL8WSD2vSdlVWz?=
 =?us-ascii?Q?7ma8qtjtWXxPWGy8dtqkUzfNL9ZS/QSj5XT6M0efEe89aIDsHLjjfPV0zFZp?=
 =?us-ascii?Q?xxz0soxe/n6wsQYj1XNxuEbU1p65ruaoHq1rhvpHGhu/gKNE/cMTG8YPK54R?=
 =?us-ascii?Q?hzAnMz5zZstan/Tn5mZQC64EOVs5j4i+0nMCDlQj2xlmLI9552EcEfC4kQDn?=
 =?us-ascii?Q?/hogvujm4tv3x72RiTqZvXJ+ckn6x07o2KhU1Or9zil3BW15znG0lvHwrtm8?=
 =?us-ascii?Q?6ACqMPoUcjrjfuxq8ZgLoLmUVLDKRPzw7KETp9gaZqV1P/xoAwAI18m+sJI7?=
 =?us-ascii?Q?58242Mxv1Hs+cOvhvsS5j1WRJ6w65eU7LKRbL200B3eC2GUPN3nXTWO7+Dbn?=
 =?us-ascii?Q?NWdKYiJF1I4lanmERZVpEeF0WgZtViZUCNYK9oPvgwPHIBFP6VFsyUSCw60Y?=
 =?us-ascii?Q?cM2BpfoEM3L7uxPHcMaaBClvWvYGkNVmElKGwkXY+zEtderY6Fi/keGR2p5U?=
 =?us-ascii?Q?6SPdO9zRQlozgMyN+LS3062nGVATqw1UtOKgpDTUBTER4UMWACsSoKqvmpp4?=
 =?us-ascii?Q?XhgvBwh7lzv0eHnZarLSTa3Zzw+WiZWcUi8T5q/vdcXGQLX99IcJUYGA+cdb?=
 =?us-ascii?Q?CHH9jQRBl3tamf+Rywm0RxnawNEbrjQIzMgNyPVGD53i+vzj5nTdGOWxtiCX?=
 =?us-ascii?Q?FUHbzEvfBAgNgI3jeT9vqampB9sLOLCFrmNQwLwFGe0YJVQsj7UEwFHYiNc7?=
 =?us-ascii?Q?YSvkecEKOU7VqYnNQFQWcDvXaFc8igXnnmqzyNS+O/AxuJQZ++ISmsTTwtyX?=
 =?us-ascii?Q?4/2OwwBiLhricY82k7TeLFTn6qHCFLg5wgqKqSpu7k1zWIrETT42AtuiwkOf?=
 =?us-ascii?Q?FQjybcW0THBcovL7A0z1837DeA0Rer0CXVp+2ef/5Bwtxsf9kpnhu1uLbNO4?=
 =?us-ascii?Q?PAf4AJGjRSr28i4NpT+mWBugow0aBVB2YtL5Udp7G3PH2z0l2xLxgLaYNtSl?=
 =?us-ascii?Q?uyxvGgMNGnstR45GVQeo3rzZ4KeOFUXvJvaqHJ+P7NicpFBmRhrg7UZ92Y2u?=
 =?us-ascii?Q?WCC9s/RSAV6CHp9BlqPEPmR7Qs72IWB0hikUcv6yiyXDxxoyyis2i9khOIKe?=
 =?us-ascii?Q?to2T/asNMMErenNEPJ4HA6xmKZZ+7KXWCx27m1WlWocWUQqesZnWjkF1K7JN?=
 =?us-ascii?Q?+UlSn/Hbcnp5uGIrFuggwXNBSubO8yHO84XsXaaQild6eGZodZHUZICDXr7q?=
 =?us-ascii?Q?F/OYZz8cZbO8vdd7XX7yNMxbeglu0YfbF7H5R51IBAKUGlUMZRUTWAJijZv0?=
 =?us-ascii?Q?hF1tZKoS9N1HtsmY9uUk+atG7f86iFktLspA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sUFzJi29JguIDrXHJ+Dm6UZnjlnZx6SOeV+0UeYBeyMpm+gbugATpATsdhIo?=
 =?us-ascii?Q?wAfoC9lmy0CRgbCSy9QCJdmGtRzRGdGnY7wqCf4s+eTv+J6+ycaHao1QJtdo?=
 =?us-ascii?Q?CwJnEwAAbiSck3OFnaukoBYc+jAYu+1hAJMzJRhj4Wp0LJM8m8toOUHIvJzA?=
 =?us-ascii?Q?rzhf7bNZ41AVEJ/YuYtJO4rpDBDLC/rJxRoSLl4jbxUROq6Ji/xCDPGIT4LM?=
 =?us-ascii?Q?ighUO+Mk4WQJT6DjmpYUK6SlTb+2gav6avOQEBHkJgw84xfVg0M6CT9bGm/m?=
 =?us-ascii?Q?3nc4NText9jvjcyjoLq5t9LCed/q/gz5LvZGHsPVfdKysHhKj9W+vuOIf0Ij?=
 =?us-ascii?Q?1hi9w3ybJysgTEEKkCtN5ixETv7gQ514H7uE4JCWYMkh3gTfZxgm122Roc4V?=
 =?us-ascii?Q?f+9nenWuTdadi83SLBnOQyK4mroclOY+h2xx8QAjOxzRZVCo+XCRccsbG1xV?=
 =?us-ascii?Q?0jmfBR3Cu+CBYtbX3SJ4tL+yqGKHCM4y8osyndCFs9RPDioGApcVqBglVO6p?=
 =?us-ascii?Q?zjo/Ztlnx5bwpjSTbBV1eZXMipfcUHw54MlebWxcz8oNdcmeL4JAdz2p26E1?=
 =?us-ascii?Q?ae60jAfjLxn/DSwKZ5BGk8gZ6rdcj55+S6j01ryVuHo2yemzCjNR/niwrLOA?=
 =?us-ascii?Q?2mNsrbkiHuVTsvK8hefd3AhC3dlMV0kueYNeaARHUNqPkG2kVeoq+cU6u1AO?=
 =?us-ascii?Q?57p53VwgzwgZMSTLf0ixmYu+XMW8AjiYk0I4Ts4aYL1rfBWUC37jqQEDqe+m?=
 =?us-ascii?Q?UW03CLyUThimpZpT8BRlllDYaBD3x/rRSNLufghwyz0fnXUxaHxfie1Z6mD0?=
 =?us-ascii?Q?MghkM9/ZCmHOe8Vnd20XXdCoZon/doTL3HI1ohAGkINtur0Ftnjp1EqNrJeZ?=
 =?us-ascii?Q?w5EMBDXYGy/m2M0w3liYWDWVHF8+9NKro7cny4bMY7ygE/0AD3RVFlfZKVjy?=
 =?us-ascii?Q?rBEb+Quyq+sO4s4w8K8dFEt0r6koxBlT7jVDIaKDhZ81sAOTNjV+g4HwSE75?=
 =?us-ascii?Q?1LF7lS0A8AGHVy8BhJLgkyIcS659e/zyEQ4WXd9aOP3WbUK31oIDtBG9mSkl?=
 =?us-ascii?Q?SSmD30uG9CldQ6XjiBrcFXJZTS4/gNac/v2eDDiNtLS7REf9oy2X10LtonUi?=
 =?us-ascii?Q?Fj5ET17gWc0pG40GsOUL4piKXpHTYsjTmcs2sbP6mHPIRg1OJFRWoogrhEsU?=
 =?us-ascii?Q?tRxeXK+MVoXHNS07HF2rrfF8ufZ63hwZfHpTKdp17QH/s4TY55cmQ1j/5U4q?=
 =?us-ascii?Q?u7NxZxV1AXnD2Kck/8fVevTbSex7i8IYPNpLIbq0IxSuA14Q+PvLd4euYHTB?=
 =?us-ascii?Q?C1r+wzQw9FKG1+/A+QGSRfLbCXBo3w3CqIFpQc7N6w/ozU5it6crrINHDGIt?=
 =?us-ascii?Q?AdQJpiwOsQifm21LlsVW/AS1jHlBmbWwj53HJYaSZHxkyFRRnabztlmamTdk?=
 =?us-ascii?Q?tuTgUgWHwp+BweiGGnug/qfLD3nH4Q+Oj9h+u5wjqpnZqQy0AD24DVDZ/349?=
 =?us-ascii?Q?7sLElk4Tq5wvV3xYR596hYI6YVytyoZhj9mhjhIz4ybXcd5uP19zwQqsIpCL?=
 =?us-ascii?Q?4OpBT5UXbYc+JGR7PTy8qTatPoqB/mQWf/qrPocznrk7z0L16x9Gbza5vsmV?=
 =?us-ascii?Q?0g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7e6258-c87c-4eac-1daf-08de21b8920c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 06:56:14.0858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yLm+yyItuQJE+oZIcbEemC/B92LjjdCgNHxGRsFHwfcVj3hrTKSs2zFe5sz5sc2u9f+jCSZq7d8038QXjYINLrrslv3CaGKdVijHAHOJQ2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10374
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

Hi Chris,

> -----Original Message-----
> From: Chris Brandt <Chris.Brandt@renesas.com>
> Sent: 11 November 2025 20:43
> Subject: RE: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate re=
strictions
>=20
> Hi Biju
>=20
> On Sat, Nov 8, 2025 3:30 AM, Biju Das wrote:
> > > +	if (dsi_div_target =3D=3D PLL5_TARGET_DPI) {
> > > +		/* Fixed settings for DPI */
> > > +		priv->mux_dsi_div_params.clksrc =3D 0;
> > > +		priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */
> > > +		priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */
> > > +		dsi_div_ab_desired =3D 8;			/* (1 << a) * (b + 1) */
> >
> > This block is duplicated may be add a helper function(), if you are pla=
nning to send another series.
>=20
> Actually, I just found another issue with the current driver when it was =
assuming everything to be
> hard-coded.
>=20
> The current code calls rzg2l_cpg_get_vclk_rate()    BEFORE   calling rzg2=
l_cpg_get_foutpostdiv_rate().
>=20
> 	vclk_rate =3D rzg2l_cpg_get_vclk_rate(hw, rate);
> 	sipll5->foutpostdiv_rate =3D
> 		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
>=20
>=20
> The problem is that rzg2l_cpg_get_vclk_rate() is using the current values=
 of dsi_div_a,  dsi_div_b and
> clksrc  to calculate a vclk.
> But, the real values of dsi_div_a, dsi_div_b and clksrc are not set until=
 later in
> rzg2l_cpg_get_foutpostdiv_rate().
>=20
> So we have a chicken-and-egg scenario.
>=20
> We can get around this by using the new "dsi_div_ab_desired" variable bec=
ause we don't care what the
> current settings are, we only care what we want them to be.
>=20
> static unsigned long rzg2l_cpg_get_vclk_rate(struct clk_hw *hw,
> 					     unsigned long rate)
> {
> -	struct sipll5 *sipll5 =3D to_sipll5(hw);
> -	struct rzg2l_cpg_priv *priv =3D sipll5->priv;
> -	unsigned long vclk;
> -
> -	vclk =3D rate / ((1 << priv->mux_dsi_div_params.dsi_div_a) *
> -		       (priv->mux_dsi_div_params.dsi_div_b + 1));
> -
> -	if (priv->mux_dsi_div_params.clksrc)
> -		vclk /=3D 2;
> -
> -	return vclk;
>=20
> + 	return rate / dsi_div_ab_desired;
> }
>=20
>=20
> Since this function is only called one place in the driver, I suggest we =
get rid of it and just do:
>=20
> 	vclk_rate =3D rate / dsi_div_ab_desired;
> 	sipll5->foutpostdiv_rate =3D
> 		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
>=20
>=20
> Finally, how this all relates to your comment is that instead of the same=
 code block in 2 places, we
> can just set the default desired divider and target in rzg2l_cpg_sipll5_r=
egister() which is always
> called early.
>=20
> 	/* Default settings for DPI */
> -	priv->mux_dsi_div_params.clksrc =3D 0;
> -	priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */
> -	priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */
> -	dsi_div_ab_desired =3D 8;			/* (1 << a) * (b + 1) */
> +	rzg2l_cpg_dsi_div_set_divider(8, PLL5_TARGET_DPI);
>=20
>=20
> I just did some testing with DPI and DSI, and so far everything works the=
 same.
>=20
>=20
> What do you think???

OK for me.

Thanks,
Biju
