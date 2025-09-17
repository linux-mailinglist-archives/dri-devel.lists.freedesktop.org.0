Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C583FB82027
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 23:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333CF10E5A3;
	Wed, 17 Sep 2025 21:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="jDXev936";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AA510E5A2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 21:45:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvcns3k0SolG1mmDyt/gAiHGGsl9uB6kP57oATrN3hRRaF7unnk+EaVbH7XnfykA0fWd8363EdMHpnn+hcO8RDbFDIpyk2jl8qkP1SD65keezbeyeLjScQUTA7H8WVgL/usjIDx4PRDZO7T2vf/UghL2Uq67sQhwG5uyQXbi+zr62uk9H4SiPX5ipiSPqPtaohJuSeDLUKsu5pXcOtncBSodAJ56S9zOm3OEuH0ZRGV7DAIfPxbJ0MyKzFHGeTQrHQsuc5UPlnw8Yv7z8wYJzieuUStK5f7dNwAECSo24Z5vbQO2430afMS29odL2QDbSsZRc4vCL6KoMhz7P0UVcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfHK9DfWlrNF8FGk5IieaKZ3Pg2exxkIsJ28e15tEuk=;
 b=AxVKd/sb+IQXZx0k/pbQ6ckbFe/psf5qk+zRlvUN+rxW+yWb09gN9CNfPoPPBu1j+tMgNJfK3Kz+92+F3Aa8Yetlv4B7LxJ0KJx9wT2D+a1CoeT2jiwXD8uTrAR7TTMo0OtZiEB7QM8f+VwOkc2rbg/pXaBBtAj/JQkUjPHHcLXcJ2KLa4gYxoxb6EIFgEcPi/a9zC0PqaPZthAQG3whk1dCIvB4TJWsiHbTQbG1uV3pcIxJYFJJnlCzvj7U2UxLZIyoHnkYIJslzj6c2e3EQ62TKcEacmqbprFNuWI0QDVEJMWMKtExs3WtIPVIkLpwiz3/nEMiJd+PtwVDVNmCJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfHK9DfWlrNF8FGk5IieaKZ3Pg2exxkIsJ28e15tEuk=;
 b=jDXev936FCBwfVU0E8XKdNim25W85qHyVFXPjVOy1agMV/IFcVKemHRkSAp8G1xKKEbsMuUJMQg5Yk8ZKq8TGbogr/GoOFlrZHXC7tFNWx3nZ4a5j3xE6hOsGPBmEdcbtZPIQT2QKJUb8RtGuUIiax7T9ExeBSNaIQCwsQQYBsk=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TY4PR01MB13839.jpnprd01.prod.outlook.com (2603:1096:405:1fc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 21:45:20 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%3]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 21:45:20 +0000
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
Subject: RE: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcI/CddGcOsGm90U+5rF/LOSoPC7SX2PuAgAATFoA=
Date: Wed, 17 Sep 2025 21:45:20 +0000
Message-ID: <OS3PR01MB8319DDE617C3F43B2304584D8A17A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
 <20250912142056.2123725-2-chris.brandt@renesas.com>
 <20250917161955.8927cc071c96641c32878b01@hugovil.com>
In-Reply-To: <20250917161955.8927cc071c96641c32878b01@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TY4PR01MB13839:EE_
x-ms-office365-filtering-correlation-id: cc2c234b-0450-4575-2b6d-08ddf6337f93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Tro60F7vx4naki3bnjRi+DBRK6MMEkpfvjLsyOFb0WUp23M8H3Yahvz1zA05?=
 =?us-ascii?Q?Mj2yv/qY/tpmVeZoM9kcBpGFoIZbKl1Ye56JfV2iazcI16K7C/KmtlPP1LW6?=
 =?us-ascii?Q?dZoaBQzs75RiIfo62mIjJQCNsxM54l10n9tgN4ZHPFI3UoKyO/mmzCPePW16?=
 =?us-ascii?Q?4djqTPSTrStsO5v5kdKh6Uq+eJvRwiDHhr96Roo3I4aj3hNbKCcrYRS0bWtd?=
 =?us-ascii?Q?HRjpEhIwvYgVjb02tfXB557BCJ2UwR6CzLNABYBhQ6cnOanaNtCtnaS/xhIo?=
 =?us-ascii?Q?vbHcOMW/yT9LUmiaiR8XfnoYqQPRnY2mrLO6J3qL6hJ18BcOUCRZCZjTuBFY?=
 =?us-ascii?Q?nzp0nJWCqnFY8tb3R8ZC5UrW9M36Hj4LVrQiTjMlUdRphIJ4K0Zx5lqyNoDL?=
 =?us-ascii?Q?YSwo9zKTeJBlg68nJ5Y15b4vEz1e4/jVuJpOyGowZRemzFs8kaVbKZLIwd0+?=
 =?us-ascii?Q?kTJaiZF4Bg/r2rOn/08OF6HBUakfCclO+ivnBOvgdsqS3z97Gjl9MkrdnprV?=
 =?us-ascii?Q?piPsXUmiR6YzxHFJbUYGT4KLYIsvYD4yosajMoGDzxubf+LQbqK+hf3y6kxx?=
 =?us-ascii?Q?ySRUBw2MYmcjrtIQ0BbN37HZQAq9GTOsej+nd/q0vFxa4ngDo6TA6IH6Pp2e?=
 =?us-ascii?Q?42eRwRzl5+HzqFLPVhNhmt9kD1/YT9u4PndCex54bi/9skrQcCH7wIXS9GE/?=
 =?us-ascii?Q?ztP4jZYpyrUtvRb3CDZzaEK9t5oxeI/i0c1lWzyz2HmKg3k5c+QAf1HROESa?=
 =?us-ascii?Q?C6MzpneW2R7itNgz/1HbOSWrnzLO2ldezeYZElFcm6hQrI8XZCvT0U2NuE9p?=
 =?us-ascii?Q?OqJ8j6h1uAkSZxOaLSn6dVlAeH9P7ek/i/J7tUeNnW5lFrJOc9FIRUsDnhW4?=
 =?us-ascii?Q?9DIkpMuLhvEh86ZAAU6RkP7lDzTC27AW772SHXlfi7FMpp+ozLIm+erCup/Q?=
 =?us-ascii?Q?zOY48X2+cFtnJUtvGDRHyAxGwVJKrvT0G9blDoaIUoaGmNqUazTukAIxXDP+?=
 =?us-ascii?Q?AtsdBerLL4CaSX5Mp79JV+ceXMo1naJPuzjEq94k8J3xQaZjJRIRkK5ztXC6?=
 =?us-ascii?Q?ximAeaLaFzExZDnKI26V6daZcPL1S8YUMuH77QOytnvFRNnAAFc1SOBCK+ii?=
 =?us-ascii?Q?xE3RGNAthIxTfkfCrvJYz+apR7ZYu53n/HITOnfiBZt9V6gqVI4g4yUQt4FR?=
 =?us-ascii?Q?F19KvcH+tSxn/HNVu6AV8FDAuAbrY25hmQQq5TnVs9hM3WcESkBYPXc2dVki?=
 =?us-ascii?Q?ByBv+9czlHVhba+UHP07RgGmJlmaOzLBHTXy+y0WY/gH3I5DFlTXMWlDTU3B?=
 =?us-ascii?Q?0NLj9ZRCBb6gpl/7CskZZXf59VjB5KV/MQpXX7P1c1tAuZ3TxZgN19xJCubf?=
 =?us-ascii?Q?6w5V535K6lpaEPAGEy3AXZwarn0Ys6PAp5VfykIL61YVXnH8YKddG3Pn9F6o?=
 =?us-ascii?Q?8UdHMp55W+CD4QK4DsSuRE61YAUWwovCXSn3VKEvygSm+OOp92fzCVNgw+76?=
 =?us-ascii?Q?eRZFm7TDHJrfT+o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SWlBmYOVByVjMjYc9P306abUuEikatZLofyF2qFCeQEBaBTBXGwsq5dTXqa+?=
 =?us-ascii?Q?gOypvpyxa+FGuYNLl2nxBHDGZ7csb3l6f+ZTFXD+m0kxPa8TAWrvr7Fwcbv4?=
 =?us-ascii?Q?Ri13rTjKg4jI+WBG8HCG91eRKaf1F9wKigR6fR1zjPPTRZaDz4jxAATADyj9?=
 =?us-ascii?Q?KvHqP+cOs3ad1PIGAsmFLz94jbHId2QntF8BYL64t07Ym948TJNNG5rUJWGf?=
 =?us-ascii?Q?S/u1KOlHKYMoiXO/3tKLAD7jIm7OmgMcJAPYAHG6dgBrCLqvB48v0HBO9VLC?=
 =?us-ascii?Q?ThabSigI7Owt3C+IJY9Yv8ywW+CKrLBHErvw2ep6pkiQfi6FkQ8BhmL+PGnf?=
 =?us-ascii?Q?53bLNnkVPefb74IRM7NQrhzC3dBXa1BfOAAcy4SXl2GU8JoMmyJn0tbntwd8?=
 =?us-ascii?Q?I4CzQdcqhBG3oDSC5kASvrlw8HpEJs97YWOPF765IhpEjwIIH7Cb8P9b53+d?=
 =?us-ascii?Q?vM2nBZf2x/XlamEpzE0Ps2dUMJt/6PO4Dor4wLFaLXQgx+zDK0Yj3p1fvTat?=
 =?us-ascii?Q?77QM4SSwCmASoh64M3v53t3QvQQJmjMxidSvccAFMwxFd4sTiJj+lfBzbz6L?=
 =?us-ascii?Q?OFfjgPIRToXiH/NDDzXmekjkFdVmXFNBQPBs7d1U3pDBuPpyTv5WAh7Gty9j?=
 =?us-ascii?Q?eDK5cMki0PyM2Nqivb/TINibKh/v+g93kLt4pJPVudttd46NIEidLylwxFwd?=
 =?us-ascii?Q?BnCpkHqKHx/tFO28SG/bfWveXhqdq4TeMKx8T7KR8QwSDlNCVXb4ZQiZl+uH?=
 =?us-ascii?Q?94hRw15Vapbt02upJmlUEk3pR/jQj4/5ZEx17tfAAY7GzaiaN/k3w06MIOF7?=
 =?us-ascii?Q?HT6JKdnW360sLlBjl5u8vutL8xk2rHGlYlwHGZkcW2WzV4GaUi64fDTytIxC?=
 =?us-ascii?Q?eBveTadyhJSPz30QqjzLJvGJYWTWuEzyyE1m3VgYmbMYfy1Ezxi94bVSpp4t?=
 =?us-ascii?Q?v1KSnt2romHUrQHzZUGkTD9xVwh9jjW784BERtqsk7rcYEHYNvCrT73pR2oC?=
 =?us-ascii?Q?tyvnI9/WgYmuiTgPU80R3OwPMzQpCPWVSZaeDplEMRm7Oi9nhbbt1T/bV9Nm?=
 =?us-ascii?Q?+0C8pLhUO63AFPuPiLNnTqDAcnonO2uerwNrHNZ/BpjljY3wcdr2F3/BTQ4n?=
 =?us-ascii?Q?lQYCtXj8ltxyRQeQYBztmw9OM7vyKC/m5EbzqnDiv1lV1zXtpKJF6CXnvXXs?=
 =?us-ascii?Q?wD0LIq6ZOjXePyTYniHHc3aITmo65POpEV0j9+mRbjv84RDiAL6mIr9xj/rP?=
 =?us-ascii?Q?3vO+N9q422gd64V8OLJpqk1F/OfdM57LdtiVBtvO5hvnqprHW0pVuldzBTlg?=
 =?us-ascii?Q?NYYNTzyBLH76YQeLRETTGxZCRRHPDNNLqRrOOYOr4UKz0WFkjO+79MGMsk+3?=
 =?us-ascii?Q?se2bob766mwSxBzcODbQ0yMM3JfrCHMp72DoPcatvYN3cVugp6CW2B55OJV/?=
 =?us-ascii?Q?eRQiPmxIEZSp8Tqa8Vsrd+7YjNfu36a7+AhitkWl90i9HeX6dX93qZsgG62P?=
 =?us-ascii?Q?lNalJBSu81gegnx1rM6GQhoQy/90hMYPOQyAZUB5SwZaR6DObrR60PwrirJb?=
 =?us-ascii?Q?uW/gKymdFbtUbsrrMRrSiKgabHPm+Nqpq1uiiOsE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2c234b-0450-4575-2b6d-08ddf6337f93
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 21:45:20.0381 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pnZkEYXunQz6KrFIfGst6eaZgTGRaNEnR3iGdVr3eAXR7R+YK2tlY9VTGCrVjTz0HutGDiK5eyGvny42+0DqaB9gBED/KCpTlBwXFWWMuC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13839
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

> If we arrive at this point, with the name of the label being "found_dsi_d=
iv" we assume that dsi div was found.

I agree with your comments about the labels.
There might not be any correct values "found".
But, then that also makes me wonder if I should print an error message, or =
even stop if we cannot find a valid
divider value.


> ... add a label "clk_valid" (or other) here, and replace "goto found_clk"=
 above with "goto clk_valid"?

clk_valid might be nice.


> If the below condition is met, it seems that you compute foutpostdiv_rate=
 for nothing here, since you will recursively call the function again and r=
ecompute it. Maybe move foutpostdiv_rate computation after the below if() b=
loc?
>
> > +	/* If foutvco is above 1.5GHz, change parent and recalculate */
> > +	if (priv->mux_dsi_div_params.clksrc && foutvco_rate > 1500000000) {
> > +		priv->mux_dsi_div_params.clksrc =3D 0;
> > +		dsi_div_ab *=3D 2;
> > +		dsi_div_target =3D PLL5_TARGET_DSI;	/* Assume MIPI-DSI */
> > +		return rzg2l_cpg_get_foutpostdiv_rate(priv, params, rate);
> > +	}

That is true. I guess that saves a couple CPU cycles that way.

As long as it's still easy to follow (since I am using a reclusive function=
), I'm fine with that.


Thank you,
Chris



-----Original Message-----
From: Hugo Villeneuve <hugo@hugovil.com>=20
Sent: Wednesday, September 17, 2025 4:20 PM
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>; Michael Turquette <mturqu=
ette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Biju Das <biju.das.jz@=
bp.renesas.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Max=
ime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; D=
avid Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Hien Huyn=
h <hien.huynh.px@renesas.com>; Nghia Vo <nghia.vo.zn@renesas.com>; linux-re=
nesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; dri-devel@lists.freed=
esktop.org
Subject: Re: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate rest=
rictions

Hi Chris,

On Fri, 12 Sep 2025 10:20:55 -0400
Chris Brandt <chris.brandt@renesas.com> wrote:

> Convert the limited MIPI clock calculations to a full range of=20
> settings based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from=20
> external sources before calculations, expose a new API to set it.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>
>=20
> ---
> v1->v2:
> - Remove unnecessary parentheses
> - Add target argument to new API
> - DPI mode has more restrictions on DIV_A and DIV_B
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 129 +++++++++++++++++++++++++++++---
>  include/linux/clk/renesas.h     |   4 +
>  2 files changed, 123 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c=20
> b/drivers/clk/renesas/rzg2l-cpg.c index 187233302818..33d799a2e8ac=20
> 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -74,6 +74,22 @@
>  #define MSTOP_OFF(conf)		FIELD_GET(GENMASK(31, 16), (conf))
>  #define MSTOP_MASK(conf)	FIELD_GET(GENMASK(15, 0), (conf))
> =20
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
> +#define PLL5_TARGET_DPI		0
> +#define PLL5_TARGET_DSI		1
> +
>  /**
>   * struct clk_hw_data - clock hardware data
>   * @hw: clock hw
> @@ -129,6 +145,12 @@ struct rzg2l_pll5_param {
>  	u8 pl5_spread;
>  };
> =20
> +/* PLL5 output will be used for DPI or MIPI-DSI */ static int=20
> +dsi_div_target =3D PLL5_TARGET_DPI;
> +
> +/* Required division ratio for MIPI D-PHY clock changes depending on=20
> +resolution and lanes. */ static int dsi_div_ab;
> +
>  struct rzg2l_pll5_mux_dsi_div_param {
>  	u8 clksrc;
>  	u8 dsi_div_a;
> @@ -557,24 +579,102 @@ rzg2l_cpg_sd_mux_clk_register(const struct=20
> cpg_core_clk *core,  }
> =20
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
> +	/* Calculate the DIV_DSI_A and DIV_DSI_B based on the final DIV DSI */
> +	for (a =3D 0; a < 4; a++) {
> +

Remove empty line.

> +		if (dsi_div_target =3D=3D PLL5_TARGET_DPI && a =3D=3D 0)
> +			continue;	/* 1/1 div not supported for DIV_DSI_A for DPI */
> +
> +		for (b =3D 0; b < 16; b++) {
> +

Remove empty line.

> +			if (dsi_div_target =3D=3D PLL5_TARGET_DPI && b !=3D 0)
> +				continue;	/* Only 1/1 div supported for DIV_DSI_B in DPI */
> +
> +			if (((1 << a) * (b + 1)) =3D=3D dsi_div_ab) {
> +				priv->mux_dsi_div_params.dsi_div_a =3D a;
> +				priv->mux_dsi_div_params.dsi_div_b =3D b;
> +
> +				goto found_dsi_div;
> +			}
> +		}
> +	}

If we arrive at this point, with the name of the label being "found_dsi_div=
" we assume that dsi div was found.

But looking at the code above, if you hit the 'continue' statements, or if =
the check for "if (((1 << a) * (b + 1)) =3D=3D dsi_div_ab) {" is not trigge=
red, is "found_dsi_div" still making sense?

Maybe its is just a matter of renaming that goto label so that it removes a=
ny confusion? (ex: found_dsi_div -> process_dsi_div or
check_clk?)

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

Again, the next goto label seems to indicate that we arrive here if the clk=
 was found, but this is not the case, and a little confusing...

> +found_clk:
> +	if (!found) {

Confusing to have a label that says "found_clk", but in reality it may not =
have been found :)

Maybe remove the "found" variable, and the found_clk label, and see rest of=
 comments below...


> +		params->pl5_intin =3D PLL5_INTIN_DEF;
> +		params->pl5_fracin =3D PLL5_FRACIN_DEF;
> +		params->pl5_refdiv =3D PLL5_REFDIV_DEF;
> +		params->pl5_postdiv1 =3D PLL5_POSTDIV_DEF;
> +		params->pl5_postdiv2 =3D PLL5_POSTDIV_DEF;
> +	}

... add a label "clk_valid" (or other) here, and replace "goto found_clk" a=
bove with "goto clk_valid"?

> =20
> -	params->pl5_intin =3D rate / MEGA;
> -	params->pl5_fracin =3D div_u64(((u64)rate % MEGA) << 24, MEGA);
> -	params->pl5_refdiv =3D 2;
> -	params->pl5_postdiv1 =3D 1;
> -	params->pl5_postdiv2 =3D 1;
>  	params->pl5_spread =3D 0x16;
> =20
>  	foutvco_rate =3D div_u64(mul_u32_u32(EXTAL_FREQ_IN_MEGA_HZ * MEGA,
> -					   (params->pl5_intin << 24) + params->pl5_fracin),
> -			       params->pl5_refdiv) >> 24;
> +		       (params->pl5_intin << 24) + params->pl5_fracin),
> +		       params->pl5_refdiv) >> 24;
>  	foutpostdiv_rate =3D DIV_ROUND_CLOSEST_ULL(foutvco_rate,
>  						 params->pl5_postdiv1 * params->pl5_postdiv2);
> =20

If the below condition is met, it seems that you compute foutpostdiv_rate f=
or nothing here, since you will recursively call the function again and rec=
ompute it. Maybe move foutpostdiv_rate computation after the below if() blo=
c?

> +	/* If foutvco is above 1.5GHz, change parent and recalculate */
> +	if (priv->mux_dsi_div_params.clksrc && foutvco_rate > 1500000000) {
> +		priv->mux_dsi_div_params.clksrc =3D 0;
> +		dsi_div_ab *=3D 2;
> +		dsi_div_target =3D PLL5_TARGET_DSI;	/* Assume MIPI-DSI */
> +		return rzg2l_cpg_get_foutpostdiv_rate(priv, params, rate);
> +	}
> +
>  	return foutpostdiv_rate;
>  }
> =20
> @@ -607,7 +707,7 @@ static unsigned long rzg2l_cpg_get_vclk_parent_rate(s=
truct clk_hw *hw,
>  	struct rzg2l_pll5_param params;
>  	unsigned long parent_rate;
> =20
> -	parent_rate =3D rzg2l_cpg_get_foutpostdiv_rate(&params, rate);
> +	parent_rate =3D rzg2l_cpg_get_foutpostdiv_rate(priv, &params, rate);
> =20
>  	if (priv->mux_dsi_div_params.clksrc)
>  		parent_rate /=3D 2;
> @@ -626,6 +726,13 @@ static int rzg2l_cpg_dsi_div_determine_rate(struct c=
lk_hw *hw,
>  	return 0;
>  }
> =20
> +void rzg2l_cpg_dsi_div_set_divider(int divider, int target) {
> +	dsi_div_ab =3D divider;
> +	dsi_div_target =3D target;
> +}
> +EXPORT_SYMBOL_GPL(rzg2l_cpg_dsi_div_set_divider);
> +
>  static int rzg2l_cpg_dsi_div_set_rate(struct clk_hw *hw,
>  				      unsigned long rate,
>  				      unsigned long parent_rate)
> @@ -859,7 +966,7 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw=20
> *hw,
> =20
>  	vclk_rate =3D rzg2l_cpg_get_vclk_rate(hw, rate);
>  	sipll5->foutpostdiv_rate =3D
> -		rzg2l_cpg_get_foutpostdiv_rate(&params, vclk_rate);
> +		rzg2l_cpg_get_foutpostdiv_rate(priv, &params, vclk_rate);
> =20
>  	/* Put PLL5 into standby mode */
>  	writel(CPG_SIPLL5_STBY_RESETB_WEN, priv->base + CPG_SIPLL5_STBY); @@=20
> -949,6 +1056,8 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *co=
re,
>  	priv->mux_dsi_div_params.clksrc =3D 1; /* Use clk src 1 for DSI */
>  	priv->mux_dsi_div_params.dsi_div_a =3D 1; /* Divided by 2 */
>  	priv->mux_dsi_div_params.dsi_div_b =3D 2; /* Divided by 3 */
> +	dsi_div_ab =3D (1 << priv->mux_dsi_div_params.dsi_div_a) *
> +		     (priv->mux_dsi_div_params.dsi_div_b + 1);
> =20
>  	return clk_hw->clk;
>  }
> diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h=20
> index 0ebbe2f0b45e..0cdbd3922cf4 100644
> --- a/include/linux/clk/renesas.h
> +++ b/include/linux/clk/renesas.h
> @@ -33,3 +33,7 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *unus=
ed, struct device *dev);
>  #define cpg_mssr_detach_dev	NULL
>  #endif
>  #endif
> +
> +#ifdef CONFIG_CLK_RZG2L
> +void rzg2l_cpg_dsi_div_set_divider(int divider, int target); #endif
> --
> 2.50.1
>=20
>=20


--
Hugo Villeneuve

