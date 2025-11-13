Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58670C54EEB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 01:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3DD10E128;
	Thu, 13 Nov 2025 00:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="n98OwLG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011022.outbound.protection.outlook.com [40.107.74.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B8C10E128
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 00:40:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WweObo82HRXlnxbkXwyNqRRWHp1jFUOXMn97JOpp6Q+AhorIBwaFTGayNAzFrZ/dn12np3n4N0lTEczNBoufXF3RdWZicz2M8DcnvPschBCdTvF9Qbk9LN5SU5kXyeOp9SzBAxUNo4CrYXPU6GdKm5O8nxuQfpd+3K/WX3GhvHa4vMxbjLaN7HImTpDaNmhq8ROrWSIG9gCgBFzm6VE3yhnbXM7wuDDwXo+LB6DVmoIvdSvFE6PY21/IlzE6oPG6rL0M+mGe+BxfFniD2POpxiQ7p7Iq+3sdDLYmEycNBcpeE8F3x98VJ+AFL9ERalYSHuI+BIeY/CtYUwzMoeW9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXdTek2C7kaRi+TiSLrdiZHQoxn5PZIUMuK0hBvfkLM=;
 b=LqZZCRHfqYcTna5fhq+GOQP05I6TyXFNY3OTPpdKaiLMBpREjgj3fpdKjPKTS9RgXHvu/HaYQQ9jAxB1QvY7P4LoTMF5LOPskhqMDQyPPDLDwObp/g6uNpTczo5EKt45Ee3IAQtJucouoiqI3nKqzPEuwMbTbSIzaqxM5FKGOcM9vwQFv11tGzkoZI02pcxqlsmu1noi6lg+FTWjLHAY/Pl4fYmB729rdITl0CaOmso4+YxLVgQWKwVlL6kQW9/iMkZ+iRTXMtPVvzjbpQuugaI5WVV3iNzqf74VJziwU2F8bIIACO/XrtiqQVl1ta71I1vN9Mk1uqnwmpErozXbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXdTek2C7kaRi+TiSLrdiZHQoxn5PZIUMuK0hBvfkLM=;
 b=n98OwLG2zkuCLNAVv3tGLx4Vi9Z/ClVXpdx2jm5E9Pep6CNz5A1kLeoz+nBd3WJsIWFynAy0+8lB/SJVmQFXiwOVBsgNAHdO53g0wM0LHtKilDISaEXCuz2OMRcesq2ZgAob+6Xkys0TSA7AjzdO1mRqVDhKTazccW2VUUFXoLE=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OS9PR01MB17271.jpnprd01.prod.outlook.com (2603:1096:604:407::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 00:40:00 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 00:39:59 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v4 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcTqM02+OCahzeqkGZBdprKCVrd7Tuf+oAgAEz9lA=
Date: Thu, 13 Nov 2025 00:39:59 +0000
Message-ID: <OS3PR01MB83195D658E18C009B4FDF2BB8ACDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
 <20251105222530.979537-2-chris.brandt@renesas.com>
 <20251111234122.5542a64223c6e286ca89dbd8@hugovil.com>
In-Reply-To: <20251111234122.5542a64223c6e286ca89dbd8@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OS9PR01MB17271:EE_
x-ms-office365-filtering-correlation-id: 3d18f0ad-5561-4428-fd98-08de224d2d17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?rjL2VDZVkoGhYd4G47YQ1rXTzbbBqdCjtAdNwXJyHczdjQJglGsT6eG5xxfj?=
 =?us-ascii?Q?iJr9EMqGQH8Jyp73Vs/AFUKE2IvKqtHQgC44VVmhTTQKOngcCfGrFX9BIhOq?=
 =?us-ascii?Q?WnWph+3PbVafUw7mRVkjCGUnMLXejrvWovl/XDysSv9l76QS4W+OUJhr8zzL?=
 =?us-ascii?Q?jruyViwrNZtYYvKY+Uj5q7DycgpPa+Nl+WAKFG92VNTr/itWtXJ6yYcyJpbG?=
 =?us-ascii?Q?+wBM7GhSZ9Qa9BKhDBb2PI119NP7eL1pEZyn6O4gT1gjMk2aM8wyRyxQzi0Z?=
 =?us-ascii?Q?7Kp4a6HzFxVTMJXKzfBeSbqmCZzIY1vQJutSL8IwxGc/Fg/I2CRsj75Vcgsd?=
 =?us-ascii?Q?yrGvBsRc+mipNAD8GzjU9gW3ZLjenWFtqSQIS1VhoxNpPPgKiF3v3NW/Ef7/?=
 =?us-ascii?Q?nfVOVOHJCZvkV9rOntn05Xme6xZzALThox3Rzqughcj86ov6692NMZ61nUT1?=
 =?us-ascii?Q?OVLDMDq6ZMtmzjqNsipMsQXC416tuWs5TUa5el2moWc3eoEnGk6i+w2V+U/s?=
 =?us-ascii?Q?IX8X1pG7IUYsAAAUZcpxeynUXSlWN1/osdRd9Gi0i4Bjt0KWQM0Egy4gQwyr?=
 =?us-ascii?Q?/FktYek72dU3K4u87F+8YGzkcPOrecZehbkMZPmim428wzg7nWAvUGkUgzx3?=
 =?us-ascii?Q?vqN48y9sr4mdFow/4YrNNpGf/s9eQxgya08HCGydfZYmp8QdKyKi/4KQejbX?=
 =?us-ascii?Q?ra6Mky/VtV2/+G+nRHiQTdDeZvC4jyEfVYBBiixdknfpqBIXM1GZ+cKITnxO?=
 =?us-ascii?Q?aOsfL5N7wQNyOb8vSI67qaPlD+G14srEwT2B0bbuEW/BZoqox4S6qKZOnUfB?=
 =?us-ascii?Q?qkQ+hWayoJunYRaTtvW2ZYv2aXM9SBKDAZtZ+oDGzBwjIRXf78nQBbHCkLtF?=
 =?us-ascii?Q?JYzU/7GuEI9w/1vqnZmtZeDQ+/yFRVy7PCFfQnBfYCkK2WyDxl1kmhM4N5Sy?=
 =?us-ascii?Q?UBfQOR7UN8EQxb8tj7cRLfp5Q74f+AE38k5VX1sx7iTiLbb84DLea0OOu+1h?=
 =?us-ascii?Q?mOU9rnuGooWtUZUMXn3urM+4uySKy5cszTgxYShh7F4C24VPin/UFgwfg+R0?=
 =?us-ascii?Q?LEYHqB+1b65Xj3iECLsigb54EGdFXvfFR8waJYZ39OW5L05zcTsiDV/VURrz?=
 =?us-ascii?Q?gHBvFgK9Xz4al52EVVgGebsHQPy7BcbR+Lyz538jNLdjQxKOVTjSrHsVVBND?=
 =?us-ascii?Q?YMK/Zk2MSPVm43oXaik5jSL2ANYytk4Fq8sAn9eso92/6WoBnFcZv7iY2fTB?=
 =?us-ascii?Q?TkRgRk1ETTFH9bpHdmCA9kiN4i+3YZMUg+08Ryg0JjxcyH+QyWeaKJN86vqt?=
 =?us-ascii?Q?RLBS3W7Dv7m3i8VgpFodn8FGPYE+2YFeN+Ur5Tv1vC916iBRUmBBLa/ppBEq?=
 =?us-ascii?Q?PReD4JTPj0ogiroxOR0kFJeAOMTjVE+DtGJYKpH4Kt+9UVVFFgNRZIevDgrn?=
 =?us-ascii?Q?Z9JWBPVGZP+Qs9qUW1Fzi4iqu0y4N0HlKRyhu8qAfTi87ZHyHLuKk/itugmy?=
 =?us-ascii?Q?bN0aV0VmaKlL2I37MhfQ3H9WGMCa7yjRo6KL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EorhZV5hIzKQ84+zzayS2ydWsuUTgLs/tNqdMmDgUeARAnygeoAo40vtgTSR?=
 =?us-ascii?Q?/MfJXveoxcQFwtDy75FjwPZmTq9bCflDUg36Kv/gLjYyiGbDZHTWybMkjUO/?=
 =?us-ascii?Q?G5tYaQ+VdpbzjanvciPk4OZkGWMIlJia917Y7ErLdeEH6MNcniktWSmHLWNm?=
 =?us-ascii?Q?GU9X2QrdnpLOE6tpLAzOrHlGNP/4kuWrcmhBd0n+oAIAVtjQ0cl8o2WRnwTU?=
 =?us-ascii?Q?U+z5t3JnJqNJ4JDuWpPmTbgRmsM+c8zDUTY0euWYvMonvTAJez5a0QaYYx/z?=
 =?us-ascii?Q?lLSbKakFZQugnxAWqtgpZzZ3uTR8ausiKoXFaiF1lDnpzis/h5KhAgRATyFB?=
 =?us-ascii?Q?ds7CAWgI4OrBx9YNwMG94P9ooKCF+x0I+0qsyclSe1Vb5WBc1BtLLjNYKdQZ?=
 =?us-ascii?Q?sfLBzx+F2W/X45xGRHslqpC+1qkWQMFz3rhTcme4g2NLqRjPqWiLrljijRoa?=
 =?us-ascii?Q?DKPBzQvY0VLSlpxkUiYkyk+9MOq9a7hiy+0pl2CsAbjRZ9ehfhCKKB3epXkh?=
 =?us-ascii?Q?VwTsKchEaL0ZAwH4AWpheffC7eAuFXs7ejS30fmjSooONvWiiTwr95aTKLF8?=
 =?us-ascii?Q?MUsIJNyfsanLuzOc1BiM8VsI5zL8IkMBzouc3RxXcd+wF3qpAG60qN9enmz6?=
 =?us-ascii?Q?efMDOuoPTxHeLDYw4rQ1odW1eDr3yqQaIz0xeRjQCmMhhTknjom1p4rdL6iV?=
 =?us-ascii?Q?ocdU6pgzaQzRbne2VxtqiGQEKLPhgezu381jddxYSU7lETwJZ9W69GisLccm?=
 =?us-ascii?Q?cbF65U/pbzQBbOMpZ0Kio83jlqXjB/JbiKluNuYP9oTP/hQZ/Sk7JsiZa9md?=
 =?us-ascii?Q?sRZflgyotGDNsLaZiMxbO04hc98YDC/TM8p5/1xpuVTY5ybldOuZClHXMXL0?=
 =?us-ascii?Q?k3EIj43rU8tL30m3Q32ZW7A1uZdQBv+eSUuLqOR3SgHK/jT5c7OUAmuYDtI8?=
 =?us-ascii?Q?lupYWnxs2c7jT+Hik74b1dW/m28c5fJxjTcRd9SUPe5BUtbYUBJtwAGEqHOb?=
 =?us-ascii?Q?oFzOQfmP9xDaSs0/pJpp9gtsHKXHWhA3hjt4W1t4YIo48P37BP4TSmzuorC1?=
 =?us-ascii?Q?JSPHAL86NmBe/se+ejGWGnLUSM8lutOTqi6n0E+pxwuTvnMeTFpQn3T42o9T?=
 =?us-ascii?Q?eNEyUOnzs6j7ZtUjOdX+Z2RYiKYZ3u2cuPf7gEzmjrE1waJELpBtaFtcxwCB?=
 =?us-ascii?Q?7rSjT+mnQAZKo93KLIE+U/pNTquHmHfwEbwThjrBPmKCuAtRsIcL36qz6icd?=
 =?us-ascii?Q?aTsmKptLp7VMEUg/dfOjCDBADPcf8OIkfjTmOb8yP7saXQoiF/CK32AEMSVM?=
 =?us-ascii?Q?RRVsbv0dgPnEasSwNWnfD/XhHqNl4O0ptfTyrko5GGqGgmIsdXIplmGuzZ83?=
 =?us-ascii?Q?EcMjXz5Y18r+EYF/qpVNwreU+nFhRiDdoZseY+dAwEImzPGUA27JCBVuuZlA?=
 =?us-ascii?Q?cCzuRK8OawRJHmA6kz48QoKqg8IF/PTXZucbCFChnGMsIBotcg79Ku3asNHF?=
 =?us-ascii?Q?j9rmdxofDX7oWVQJQu9+yve1SFImSk5olqGejXWcdsk472ZkX386KPEIzZJO?=
 =?us-ascii?Q?/nOseNflbJSe/frAqhtezLnL1aJFxQ37+y7S5D0h?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d18f0ad-5561-4428-fd98-08de224d2d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 00:39:59.7237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iTc//a06+LP9fLfFNUSXrjx4ySsXOcwIsTdbDv0jm1a4T9XQGQqo58bZs3wsj5PlcwRK0aJclDGvkqb7b15Z/tP3nyKxsuEFCmbS61TJ+Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17271
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

Hi Hugo,

Thank you for your review.

On Tue, Nov 11, 2025 11:41 PM, Hugo Villeneuve wrote:
> > +/* Required division ratio for MIPI D-PHY clock depending on number of=
 lanes and bpp. */
> >+static unsigned int dsi_div_ab_desired;
>
> giving a maximum of 24 * 2 / 1 =3D 48
>
> So change type to u8?

Done.

I also changed the API function:

-void rzg2l_cpg_dsi_div_set_divider(unsigned int divider, int target);
+void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target);

But, I kept "target" as int because it is an enum.
Any comment on changing that to "u8" as well???


> > +rzg2l_cpg_get_foutpostdiv_rate(struct rzg2l_cpg_priv *priv,
> > +			       struct rzg2l_pll5_param *params,
> >  			       unsigned long rate)
> >  {
> >  	unsigned long foutpostdiv_rate, foutvco_rate;
> > +	unsigned long hsclk;
> > +	unsigned int a, b, odd;
> > +	unsigned int dsi_div_ab_calc;
> > +
>
> Based on my tests, it seems we can arrive at this point with a non-initia=
lized dsi_div_ab_desired (0). Since valid
> values are from 1 to 128, add a check for this before using it.

I think at first, we need to understand how that is happening and fix that =
code path.
If this function is being called before the dsi_div_ab_desired is set to a =
valid value, then the code might make bad calculations and decisions.


> > +		/* Determine the correct clock source based on even/odd of the divid=
er */
> > +		odd =3D dsi_div_ab_desired & 1;
> > +		if (odd) {
> > +			/* divider is odd */
>
> You can drop this comment, as your "odd" variable is self-explanatory.
>
> > +			priv->mux_dsi_div_params.clksrc =3D 0;	/* FOUTPOSTDIV */
> > +			dsi_div_ab_calc =3D dsi_div_ab_desired;
> > +		} else {
> > +			/* divider is even */
>
> ditto.

Done.


> > +
> > +			/* FOUTPOSTDIV: DIV_DSI_A must always be 1/1 */
> > +			if (odd && a !=3D 0)
> > +				continue;
>
> Use break instead of continue?

Done.
Changed to break;

> > +
> > +			for (b =3D 0; b < 16; b++) {
> > +				/* FOUTPOSTDIV: DIV_DSI_B must always be odd divider 1/(b+1) */
> > +				if (odd && b & 1)
> > +					continue;
> > +
> > +				if ((b + 1) << a =3D=3D dsi_div_ab_calc) {
>
>
> It took me a while to decipher this :)
>
> Use an inline function to compute div_ab to improve readability, and you =
can reuse this function elsewhere instead of hardcoding the div_ab value (t=
o for example):
>
> static inline u8 rzg2l_cpg_div_ab(u8 a, u8 b) {
>	return (b + 1) << a;
> }
>
> and then:
>
>     ...
>     if (rzg2l_cpg_div_ab(a, b) =3D=3D dsi_div_ab_calc) {
>     ...
>

OK. I can live with that.

During the reviews, the code kept getting more and more optimized and trimm=
ed down, which then became harder to follow.


> > +	if (dsi_div_target =3D=3D PLL5_TARGET_DPI) {
> > +		/* Fixed settings for DPI */
> > +		priv->mux_dsi_div_params.clksrc =3D 0;
> > +		priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */
> > +		priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */
> > +		dsi_div_ab_desired =3D 8;			/* (1 << a) * (b + 1) */
> > +	}
>
> Here this block could be combined as an if/else-if:
>
>     if (dsi_div_target =3D=3D PLL5_TARGET_DPI) {
>         ...
>     } else if (dsi_div_target =3D=3D PLL5_TARGET_DSI) {
>         ...

Done.


> > +				if (params->pl5_intin < PLL5_INTIN_MIN ||
> > +				    params->pl5_intin > PLL5_INTIN_MAX)
> > +					continue;
>
> Insert line for readability

Done.




> > -	foutpostdiv_rate =3D DIV_ROUND_CLOSEST_ULL(foutvco_rate,
> > -						 params->pl5_postdiv1 * params->pl5_postdiv2);
> > +
> > +	foutpostdiv_rate =3D DIV_ROUND_CLOSEST(foutvco_rate,
> > +					     params->pl5_postdiv1 * params->pl5_postdiv2);
> > =20
> >  	return foutpostdiv_rate;
>
> You can drop foutpostdiv_rate intermediate variable and return directly, =
all on one line:
>
>     return DIV_ROUND_CLOSEST(foutvco_rate, params->pl5_postdiv1 * params-=
>pl5_postdiv2);

Done.


> >  	vclk_rate =3D rzg2l_cpg_get_vclk_rate(hw, rate);
> >  	sipll5->foutpostdiv_rate =3D
> > -		rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
> > +		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
>
> Before this patch, rzg2l_cpg_get_foutpostdiv_rate() seemed to always retu=
rn a valid rate. Therefore, no validation was done of the computed rate.
>
> Now with your patch it may return "0" if the rate is invalid. Therefore y=
ou need to check for this here and return a corresponding error code.

I saw for some clock drivers, if they could not get the correct rate, they =
just return '0' as the rate.

But, I do see in some other drivers, they return -EINVAL, so I can do that =
as well.

=20
> > -	priv->mux_dsi_div_params.clksrc =3D 1; /* Use clk src 1 for DSI */
> > -	priv->mux_dsi_div_params.dsi_div_a =3D 1; /* Divided by 2 */
> > -	priv->mux_dsi_div_params.dsi_div_b =3D 2; /* Divided by 3 */
> > +	/* Default settings for DPI */
> > +	priv->mux_dsi_div_params.clksrc =3D 0;
> > +	priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */
> > +	priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */
> > +	dsi_div_ab_desired =3D 8;			/* (1 << a) * (b + 1) */
>
> Use inline function rzg2l_cpg_div_ab() previously suggested.

I plan on getting rid of this code block anyway.
It's not needed.



Cheers

Chris
