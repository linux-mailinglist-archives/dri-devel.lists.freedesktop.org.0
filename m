Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F468ABCF14
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 08:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0010E10E096;
	Tue, 20 May 2025 06:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NTrd3k0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F29610E096
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 06:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8R/spHeRm2HAG608aUTcMUvVCPj0c//Ikh2B41MrH9I3jtw6rEbdtk43fOewFQwi6f0UT361j1Up5v2q6UJ8xFpxdYmRdQBkrFjMK8NNPMsIH7spzxqqiNygTl3ePjSIIXX8pm+IEp4XPq3Zomqymn5lNEz3pHopEClJ+DfyUlF3wD/0+wSqnWGQqZgU+v5R+OvDbglbzqvf4/di3vzbpgA/+4JpfugCZ+9nyBOtp2Se6Rxa8d/KTNnB/ClkgSJsBkVZXogePN83VFIYqzmy0EZIj4n3JX8Q/aR6LJmLZRRs8xG30oHx01O9mBAknlBFxhoyBn59oAgYxOdqTm+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZL1KfzY7RHk53/Ao0X+a7soNu8BrIK+/Qd7rwceCXk=;
 b=gLbdGCD7aSxeuoX2uhSikj62kBRpCDS4kse7jo97NrpEgZXNFUgglmHIfkUTdN7fgz22VH0F83BJ/N+4jy35vNxwMaosYKoUb0vBw8f0q1PYpAzOspNC20FUdfGHgW5VoJXtk5qEdJTahgQSHhpJ/Q1QCEKJCxuNmW7qnzAik7UQP665bcmXqj2U0LUN6kaL7sBW48W/GnB20LH67hrS/k2+G5CfzbI0GIu26rWzMUYHnWkACJtDhHAjECGHWr86/laeKN54E6mhSfe8RuZiuIfcooxY4L3GtWtXSKJusayZqQaS1RXU05BKH55uXlZRMMoU7iyFyJ7ss1nStBCJxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZL1KfzY7RHk53/Ao0X+a7soNu8BrIK+/Qd7rwceCXk=;
 b=NTrd3k0XRS5F8CzK6zFp9NsU/j0HJGFlUBbmhxUAP/Cqv7uxYZfN0Jf4+ayM05xL7+IE8QQqrzdahDusRca9XpOWY6O3SXSCfPwrWYMU2P2rJ4J1X2/j5D+wOdIW02z07n9XDvJQ4f9enJCGEoewD26faYLheD8x+UugnPX4oUk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10540.jpnprd01.prod.outlook.com (2603:1096:400:308::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 06:19:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 06:19:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
Thread-Topic: [PATCH v5 1/4] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
Thread-Index: AQHbw224ZOJewiVCbk2YSxLSjM8/RrPbFTeg
Date: Tue, 20 May 2025 06:19:32 +0000
Message-ID: <TY3PR01MB11346175FD9CBA5CA81EA3A51869FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250512184302.241417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10540:EE_
x-ms-office365-filtering-correlation-id: 8bbf545e-4aff-478a-8e1b-08dd9766490a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1ia5h6SegD4RSdzITiFyTc6G0dS8TZzWLDbcT0TA0OGeSuHauZkrHEgXWJgw?=
 =?us-ascii?Q?44/GuNFw6wxaAPjf+zm/iLB9LFTSVlsumWfNGj99SVX10gRe55LHRTT/tenJ?=
 =?us-ascii?Q?ft68FPmS1Up+ZPnFO9Fh+2XsVJf5YstPHsEU2ixpLfMALy6YG+cxMFAXpaRx?=
 =?us-ascii?Q?ObqkCTKddUsyQ8izXOnd/md9tEDFDVRyVUiftNebIl7QIfRXhtp/jbghSm1B?=
 =?us-ascii?Q?jV4OrQZJj8YAvtEtnAFTQ/kRpyqKTKYkRcRqnwA3ZbGdBIpwEyJL1O3aq3fE?=
 =?us-ascii?Q?DuJe9ONCFpNpa9AkT6zmWJPWvmtKqU4lstQY6MVm+k0dJOBImUe3qPYqodvW?=
 =?us-ascii?Q?1hh7CUq2JQYc7OLAa0byQFWVh1VNFle1DB9Lv16c31GFH+pKUQAGohmxTSxP?=
 =?us-ascii?Q?dhezhR0zyTeudYaZ8iN+ejy7CToyhijVG71HVXEghXHtyt2THXhGicb5VAfB?=
 =?us-ascii?Q?F831Oln+CqrQ1Yip/OFmp4V370+f5Dgy4nRUEfUO0a+j2su6j0Y6dS4Zlffp?=
 =?us-ascii?Q?wVyjbSm0o1UQm+kQskKI04YuqaQDOLeOkXG6JTqJs8EMaf6sKF2yLYwsCL0C?=
 =?us-ascii?Q?S7ipeFe2I172b5iTullqxeMcEiP8TzkQztjW5mhmnl9oecldoU/eyCyW2q8B?=
 =?us-ascii?Q?PW54YJkER4toQfxLlrcvzjGIysBn3kadEC0JuHTMqkv7EAXez73Quz5JLdgX?=
 =?us-ascii?Q?3qf+0KNuJrnoiqDckDcplUqgm8EzFAqGYXPmEOOxBfRLGigNZGijSDGDhrXe?=
 =?us-ascii?Q?eJit0JzTP9kLkkqyomzLO8B7MYtcNjjLUOPa3KttiYunmepPN/p9Mu5PcldF?=
 =?us-ascii?Q?mMM4JoVLYU6Y4bO93iKIXJNz/f9X5069vikY5tJLRWNKgGHEDZc9hkoxndit?=
 =?us-ascii?Q?nnXhKzxU6BUzHyOAw/8RR+lwuH7zxL1O/6Id9TStQCHQKAWimqtCM2vMaI+3?=
 =?us-ascii?Q?9HwsVajtDBZPdLiL8jOFoh82rBCoo5LjUYnOXyqkuyV4VnMtE/8iPyIYcww4?=
 =?us-ascii?Q?gW80LenTe2vxMb1T/kZG/K/3YWBIwdce+9aY8WXOtHWiag65XTk0dtGxJBfV?=
 =?us-ascii?Q?D7PQJZUUxuB9RKceIImc5gqzXZCklkCspwEnzpOg0YPlEVcDQRvHxUAi9N0c?=
 =?us-ascii?Q?9Qsc99Tt0JRi6/cmAYa29hcFzoFosBPhAF91AYtJ9rIwA8QOhjYNVbgXcV1A?=
 =?us-ascii?Q?AwsH+ClDR0zOHNMc6g+OqKt+954YB5fF3uY2V8FaWQhh78CrKNe0SwoNf5Kv?=
 =?us-ascii?Q?J2I1P3UAF2CC3u5F0aR+Qs068Px/IYtc57hgw9gm7My/fT+GpAhveEldWuis?=
 =?us-ascii?Q?9uTQBWLGi6YxKUSFQBZ/0k8Omf6ip2fJB6g/kfeUJuOhGxjznsJFUaqsOQ2H?=
 =?us-ascii?Q?H0jC5vExpbQtHO0cCDjxBTt2Kr+TVRz9KMIbs2zigZaKLsaPlv9DMVc7XEwG?=
 =?us-ascii?Q?17cLKV2WDXHb9Z241gh7I3dVR6l09d1ALIbzCpHGOSEOKSKPRAQTVWi3b+rE?=
 =?us-ascii?Q?lHan2i5//PD4jzs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Yu6IuO/pt0jVBlXYQtEo0DAp2uPERfemFlwqOFj4YiPV1fJoccm+mixNhtP5?=
 =?us-ascii?Q?s9ykEhEBKx06sRnFHtJepmAsGLxd2Y9JZtUVDCNQZuPWswgqJ7DiFeIftk+P?=
 =?us-ascii?Q?AoeyHrZpB27NTSqqxAAuCMbrbOFoUl/G4o+uBBtnsKHbnViy8uveIlwx0hHK?=
 =?us-ascii?Q?6Ai8FQAc7z48vX4c+Ht31gVPKSUVZwyKeFSWk/ZN6Zp/Ug90/asZF9s2H4N9?=
 =?us-ascii?Q?x/DaWZk4bD06VuLZj03sll1dibljUAmmQsxMnaS4rX+v960YCxl4haf79+wS?=
 =?us-ascii?Q?VqUj3vCmqQ45SEAdiT6+i2pejE6ps09L+AFosl5aD5Pvud8/0oFoNOaInIjB?=
 =?us-ascii?Q?E78io0l0iHgncPUdJbJYq5Ai6Ri82KS4H9rOER7Ivoh3xIcoOFmPvVzkdxos?=
 =?us-ascii?Q?59gvOhpnR7v7Pfo0Xo9S7NtqxMUPsZQKTEvxhFBJqZEbec1PivGwpmiXvCfm?=
 =?us-ascii?Q?1+O1Qkp6223ym0eAMXfMNXjp9sXBy6Fx2vK+bkH0D7CxF4yfm10Dun+1HAwt?=
 =?us-ascii?Q?Cr3ip+qRyVmjNuxyqfplsy051zy5uSUYJ3/0ahn4AuJfHjlGJgdF4f7AmaHg?=
 =?us-ascii?Q?J2xhfNtgGsIbFvgsUTF32fdRJ7p+nj43yMFBVGxfFmCRePK1jLYc9EWFLalx?=
 =?us-ascii?Q?eST+ig7ZGt48UpgSHsEwKl30hf6VEcxac2DgmKjHrjC8qsLKZ/OxkctSiyI3?=
 =?us-ascii?Q?AjGQgbNvI7L58rv/PW5PdrL2i7Fu9pOp8+sMv5UUWhNgkEPubXfk0A+Vfttq?=
 =?us-ascii?Q?I3lkQW1FUvWiImS/pgLZdscPzH+V4gLaEdK8BviWFZChnHDHZaRQHzPxYOeB?=
 =?us-ascii?Q?AYa/WPsxJtoqJJffLAOdWe/UquDq8413c5oSJs64llPaWE4DHGUc9wpJAMZU?=
 =?us-ascii?Q?Olsik5ECx/IYEHgXI8gjsHJHRzIyHTiTb9jgIR4PC9nusszrtXYxkxweR71E?=
 =?us-ascii?Q?7TVh0KGEsd08mS0zggT30wUDa9NYd3MgTbleaYD0uqLELRdL0fYheBX7tJfZ?=
 =?us-ascii?Q?UdS+EBJSu/ouDfX/5qWUWNfSKwBHxmv3/bDUoRxIZ68u0eGpWgBYz5UirUnJ?=
 =?us-ascii?Q?QvkzU31soLYqiECLOeC0xB+As8d/ejRjHUEwmxyXzhewQl/kbLcxtZkO1yH0?=
 =?us-ascii?Q?k1vs2u2uG+GIaURWTQziH6Zy6uygnAMs+aFA89FKSfWT3VrCu9ycTGJ4ocG/?=
 =?us-ascii?Q?wHN5I9FMYESxqgZF/2Zx653aeWTJZJvpHJLm5gXkfAUvP2EoNOrATJCNxHrp?=
 =?us-ascii?Q?Ba7TVQjV8d1QtM9DEYaM82jhTJ+lerGJMXwjtIRi1En9SL0OI9lLZyrMrwU6?=
 =?us-ascii?Q?PM6Xfe8cNHoFFx3Vh6EbVb2/8thVxcjEbsw8h6MAS44OHdNk8hD0TDwqRxwi?=
 =?us-ascii?Q?gmOGbryQx0f0AbV0U7jY1fSSkRBrdMesbDhMslAxOnFCLsNtkJI3451XSNKO?=
 =?us-ascii?Q?AeZclvFwF9AxO4lFOPzqaO0lpYaOOe49Rkg+ww+KSrUbaCq8hUWeSoOroMBS?=
 =?us-ascii?Q?d9g/2zz8172dO9gVuyfs3/UUDCYQflH0/Qy/Nu+f2TzGffsVIfLAni7qx27A?=
 =?us-ascii?Q?7DyirEQCUuNosvc2mwRIpKZdWqhkKHGUyCJRk5oHJF8o43YVxRfeLC5FtR6B?=
 =?us-ascii?Q?XQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbf545e-4aff-478a-8e1b-08dd9766490a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 06:19:32.3966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kais4eBzaFr9RccVntaxqQxTQmXsJ1jmpSOVigiNynaX/J0E8zzkdjxPknsKCd0pNwhjKroY51zEkbaOwN2C1DbQoCuoHSUQPAt3r/v5DeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10540
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

Hi Geert, Stephen,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 12 May 2025 19:43
> Subject: [PATCH v5 1/4] clk: renesas: rzv2h-cpg: Add support for DSI cloc=
ks
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for PLLDSI and PLLDSI divider clocks.
>=20
> Introduce the `renesas-rzv2h-dsi.h` header to centralize and share PLLDSI=
-related data structures,
> limits, and algorithms between the RZ/V2H CPG and DSI drivers.
>=20
> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly=
 different parameter limits
> and omits the programmable divider present in CPG. To ensure precise freq=
uency calculations-especially
> for milliHz-level accuracy needed by the DSI driver-the shared algorithm =
allows both drivers to
> compute PLL parameters consistently using the same logic and input clock.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
> - No changes
>=20
> v3->v4:
> - Corrected parameter name in rzv2h_dsi_get_pll_parameters_values()
>   description freq_millihz
>=20
> v2->v3:
> - Update the commit message to clarify the purpose of `renesas-rzv2h-dsi.=
h`
>   header
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
> - Added a gaurd in renesas-rzv2h-dsi.h header
>=20
> v1->v2:
> - No changes
> ---
>  drivers/clk/renesas/rzv2h-cpg.c       | 237 +++++++++++++++++++++++++-
>  drivers/clk/renesas/rzv2h-cpg.h       |  14 ++
>  include/linux/clk/renesas-rzv2h-dsi.h | 211 +++++++++++++++++++++++
>  3 files changed, 460 insertions(+), 2 deletions(-)  create mode 100644 i=
nclude/linux/clk/renesas-
> rzv2h-dsi.h
>=20
> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c index
> 882e301c2d1b..ccf6a664e71d 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -14,9 +14,13 @@
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/clk/renesas-rzv2h-dsi.h>
>  #include <linux/delay.h>
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/minmax.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -26,6 +30,7 @@
>  #include <linux/refcount.h>
>  #include <linux/reset-controller.h>
>  #include <linux/string_choices.h>
> +#include <linux/units.h>
>=20
>  #include <dt-bindings/clock/renesas-cpg-mssr.h>
>=20
> @@ -48,6 +53,7 @@
>  #define CPG_PLL_STBY(x)		((x))
>  #define CPG_PLL_STBY_RESETB	BIT(0)
>  #define CPG_PLL_STBY_RESETB_WEN	BIT(16)
> +#define CPG_PLL_STBY_SSCGEN_WEN BIT(18)
>  #define CPG_PLL_CLK1(x)		((x) + 0x004)
>  #define CPG_PLL_CLK1_KDIV(x)	((s16)FIELD_GET(GENMASK(31, 16), (x)))
>  #define CPG_PLL_CLK1_MDIV(x)	FIELD_GET(GENMASK(15, 6), (x))
> @@ -79,6 +85,8 @@
>   * @last_dt_core_clk: ID of the last Core Clock exported to DT
>   * @mstop_count: Array of mstop values
>   * @rcdev: Reset controller entity
> + * @dsi_limits: PLL DSI parameters limits
> + * @plldsi_div_parameters: PLL DSI and divider parameters configuration
>   */
>  struct rzv2h_cpg_priv {
>  	struct device *dev;
> @@ -95,6 +103,9 @@ struct rzv2h_cpg_priv {
>  	atomic_t *mstop_count;
>=20
>  	struct reset_controller_dev rcdev;
> +
> +	const struct rzv2h_pll_div_limits *dsi_limits;
> +	struct rzv2h_plldsi_parameters plldsi_div_parameters;
>  };
>=20
>  #define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
> @@ -150,6 +161,24 @@ struct ddiv_clk {
>=20
>  #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
>=20
> +/**
> + * struct rzv2h_plldsi_div_clk - PLL DSI DDIV clock
> + *
> + * @dtable: divider table
> + * @priv: CPG private data
> + * @hw: divider clk
> + * @ddiv: divider configuration
> + */
> +struct rzv2h_plldsi_div_clk {
> +	const struct clk_div_table *dtable;
> +	struct rzv2h_cpg_priv *priv;
> +	struct clk_hw hw;
> +	struct ddiv ddiv;
> +};
> +
> +#define to_plldsi_div_clk(_hw) \
> +	container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
> +
>  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)  {
>  	struct pll_clk *pll_clk =3D to_pll(hw);
> @@ -198,6 +227,188 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw *=
hw)
>  	return ret;
>  }
>=20
> +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
> +						      unsigned long parent_rate)
> +{
> +	struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> +	struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> +	struct ddiv ddiv =3D dsi_div->ddiv;
> +	u32 div;
> +
> +	div =3D readl(priv->base + ddiv.offset);
> +	div >>=3D ddiv.shift;
> +	div &=3D clk_div_mask(ddiv.width);
> +	div =3D dsi_div->dtable[div].div;
> +
> +	return DIV_ROUND_CLOSEST_ULL(parent_rate, div); }
> +
> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +					       struct clk_rate_request *req) {
> +	struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> +	struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> +	struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_div_para=
meters;
> +	u64 rate_millihz;
> +
> +	/*
> +	 * Adjust the requested clock rate (`req->rate`) to ensure it falls wit=
hin
> +	 * the supported range of 5.44 MHz to 187.5 MHz.
> +	 */
> +	req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> +
> +	rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> +	if (rate_millihz =3D=3D dsi_dividers->error_millihz + dsi_dividers->fre=
q_millihz)
> +		goto exit_determine_rate;
> +
> +	if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> +						 dsi_dividers, rate_millihz)) {
> +		dev_err(priv->dev,
> +			"failed to determine rate for req->rate: %lu\n",
> +			req->rate);
> +		return -EINVAL;
> +	}
> +
> +exit_determine_rate:
> +	req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
> +
> +	return 0;
> +};
> +
> +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> +					 unsigned long rate,
> +					 unsigned long parent_rate)
> +{
> +	struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> +	struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> +	struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_div_para=
meters;
> +	struct ddiv ddiv =3D dsi_div->ddiv;
> +	const struct clk_div_table *clkt;
> +	bool div_found =3D false;
> +	u32 val, shift, div;
> +
> +	div =3D dsi_dividers->csdiv;
> +	for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> +		if (clkt->div =3D=3D div) {
> +			div_found =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (!div_found)
> +		return -EINVAL;
> +
> +	shift =3D ddiv.shift;
> +	val =3D readl(priv->base + ddiv.offset) | DDIV_DIVCTL_WEN(shift);
> +	val &=3D ~(clk_div_mask(ddiv.width) << shift);
> +	val |=3D (u32)clkt->val << shift;
> +	writel(val, priv->base + ddiv.offset);
> +
> +	return 0;
> +};
> +
> +static const struct clk_ops rzv2h_cpg_plldsi_div_ops =3D {
> +	.recalc_rate =3D rzv2h_cpg_plldsi_div_recalc_rate,
> +	.determine_rate =3D rzv2h_cpg_plldsi_div_determine_rate,
> +	.set_rate =3D rzv2h_cpg_plldsi_div_set_rate, };
> +
> +static struct clk * __init
> +rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
> +				  struct rzv2h_cpg_priv *priv)
> +{
> +	struct rzv2h_plldsi_div_clk *clk_hw_data;
> +	struct clk **clks =3D priv->clks;
> +	struct clk_init_data init;
> +	const struct clk *parent;
> +	const char *parent_name;
> +	struct clk_hw *clk_hw;
> +	int ret;
> +
> +	parent =3D clks[core->parent];
> +	if (IS_ERR(parent))
> +		return ERR_CAST(parent);
> +
> +	clk_hw_data =3D devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNE=
L);
> +	if (!clk_hw_data)
> +		return ERR_PTR(-ENOMEM);
> +
> +	clk_hw_data->priv =3D priv;
> +	clk_hw_data->ddiv =3D core->cfg.ddiv;
> +	clk_hw_data->dtable =3D core->dtable;
> +
> +	parent_name =3D __clk_get_name(parent);
> +	init.name =3D core->name;
> +	init.ops =3D &rzv2h_cpg_plldsi_div_ops;
> +	init.flags =3D core->flag;
> +	init.parent_names =3D &parent_name;
> +	init.num_parents =3D 1;
> +
> +	clk_hw =3D &clk_hw_data->hw;
> +	clk_hw->init =3D &init;
> +
> +	ret =3D devm_clk_hw_register(priv->dev, clk_hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return clk_hw->clk;
> +}
> +
> +static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
> +					unsigned long rate,
> +					unsigned long *parent_rate)
> +{
> +	return clamp(rate, 25000000UL, 375000000UL); }
> +
> +static int rzv2h_cpg_pll_set_rate(struct clk_hw *hw,
> +				  unsigned long rate,
> +				  unsigned long parent_rate)
> +{
> +	struct pll_clk *pll_clk =3D to_pll(hw);
> +	struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> +	struct rzv2h_plldsi_parameters *dsi_dividers;
> +	struct pll pll =3D pll_clk->pll;
> +	u16 offset =3D pll.offset;
> +	u32 val;
> +	int ret;
> +
> +	/* Put PLL into standby mode */
> +	writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offset));
> +	ret =3D readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
> +					val, !(val & CPG_PLL_MON_LOCK),
> +					100, 2000);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to put PLLDSI into standby mode");
> +		return ret;
> +	}
> +
> +	dsi_dividers =3D &priv->plldsi_div_parameters;
> +	/* Output clock setting 1 */
> +	writel((dsi_dividers->k << 16) | (dsi_dividers->m << 6) | (dsi_dividers=
->p),
> +	       priv->base + CPG_PLL_CLK1(offset));
> +
> +	/* Output clock setting 2 */
> +	val =3D readl(priv->base + CPG_PLL_CLK2(offset));
> +	writel((val & ~GENMASK(2, 0)) | dsi_dividers->s,
> +	       priv->base + CPG_PLL_CLK2(offset));
> +
> +	/* Put PLL to normal mode */
> +	writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> +	       priv->base + CPG_PLL_STBY(offset));
> +
> +	/* PLL normal mode transition, output clock stability check */
> +	ret =3D readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
> +					val, (val & CPG_PLL_MON_LOCK),
> +					100, 2000);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to put PLLDSI into normal mode");
> +		return ret;
> +	}
> +
> +	return 0;
> +};
> +
>  static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>  						   unsigned long parent_rate)
>  {
> @@ -219,6 +430,12 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(s=
truct clk_hw *hw,
>  	return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(clk1));  }
>=20
> +static const struct clk_ops rzv2h_cpg_plldsi_ops =3D {
> +	.recalc_rate =3D rzv2h_cpg_pll_clk_recalc_rate,
> +	.round_rate =3D rzv2h_cpg_plldsi_round_rate,
> +	.set_rate =3D rzv2h_cpg_pll_set_rate,
> +};
> +
>  static const struct clk_ops rzv2h_cpg_pll_ops =3D {
>  	.is_enabled =3D rzv2h_cpg_pll_clk_is_enabled,
>  	.enable =3D rzv2h_cpg_pll_clk_enable,
> @@ -228,7 +445,8 @@ static const struct clk_ops rzv2h_cpg_pll_ops =3D {  =
static struct clk * __init
> rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
>  			   struct rzv2h_cpg_priv *priv,
> -			   const struct clk_ops *ops)
> +			   const struct clk_ops *ops,
> +			   bool turn_on)
>  {
>  	void __iomem *base =3D priv->base;
>  	struct device *dev =3D priv->dev;
> @@ -258,6 +476,13 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk=
 *core,
>  	pll_clk->base =3D base;
>  	pll_clk->priv =3D priv;
>=20
> +	if (turn_on) {
> +		/* Disable SSC and turn on PLL clock when init */
> +		writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB |
> +		       CPG_PLL_STBY_SSCGEN_WEN,
> +		       base + CPG_PLL_STBY(pll_clk->pll.offset));
> +	}
> +
>  	ret =3D devm_clk_hw_register(dev, &pll_clk->hw);
>  	if (ret)
>  		return ERR_PTR(ret);
> @@ -499,7 +724,7 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk=
 *core,
>  			clk =3D clk_hw->clk;
>  		break;
>  	case CLK_TYPE_PLL:
> -		clk =3D rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
> +		clk =3D rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops,
> +false);
>  		break;
>  	case CLK_TYPE_DDIV:
>  		clk =3D rzv2h_cpg_ddiv_clk_register(core, priv); @@ -507,6 +732,12 @@
> rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
>  	case CLK_TYPE_SMUX:
>  		clk =3D rzv2h_cpg_mux_clk_register(core, priv);
>  		break;
> +	case CLK_TYPE_PLLDSI:
> +		clk =3D rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_plldsi_ops, =
true);
> +		break;
> +	case CLK_TYPE_PLLDSI_DIV:
> +		clk =3D rzv2h_cpg_plldsi_div_clk_register(core, priv);
> +		break;
>  	default:
>  		goto fail;
>  	}
> @@ -1043,6 +1274,8 @@ static int __init rzv2h_cpg_probe(struct platform_d=
evice *pdev)
>  	priv->last_dt_core_clk =3D info->last_dt_core_clk;
>  	priv->num_resets =3D info->num_resets;
>=20
> +	priv->dsi_limits =3D info->plldsi_limits;
> +
>  	for (i =3D 0; i < nclks; i++)
>  		clks[i] =3D ERR_PTR(-ENOENT);
>=20
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-=
cpg.h index
> cd6bcd4f2901..6f662fa86ac4 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -100,6 +100,7 @@ struct smuxed {
>  #define CPG_CDDIV3		(0x40C)
>  #define CPG_CDDIV4		(0x410)
>  #define CPG_CSDIV0		(0x500)
> +#define CPG_CSDIV1		(0x504)
>=20
>  #define CDDIV0_DIVCTL1	DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
>  #define CDDIV0_DIVCTL2	DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
> @@ -168,6 +169,8 @@ enum clk_types {
>  	CLK_TYPE_PLL,
>  	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
>  	CLK_TYPE_SMUX,		/* Static Mux */
> +	CLK_TYPE_PLLDSI,	/* PLLDSI */
> +	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
>  };
>=20
>  #define DEF_TYPE(_name, _id, _type...) \ @@ -195,6 +198,14 @@ enum clk_t=
ypes {
>  		 .num_parents =3D ARRAY_SIZE(_parent_names), \
>  		 .flag =3D CLK_SET_RATE_PARENT, \
>  		 .mux_flags =3D CLK_MUX_HIWORD_MASK)
> +#define DEF_PLLDSI(_name, _id, _parent, _pll_packed) \
> +	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI, .parent =3D _parent, .cfg.pll =3D
> +_pll_packed) #define DEF_PLLDSI_DIV(_name, _id, _parent, _ddiv_packed, _=
dtable) \
> +	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_DIV, \
> +		 .cfg.ddiv =3D _ddiv_packed, \
> +		 .dtable =3D _dtable, \
> +		 .parent =3D _parent, \
> +		 .flag =3D CLK_SET_RATE_PARENT)
>=20
>  /**
>   * struct rzv2h_mod_clk - Module Clocks definitions @@ -295,6 +306,7 @@ =
struct rzv2h_reset {
>   *
>   * @num_mstop_bits: Maximum number of MSTOP bits supported, equivalent t=
o the
>   *		    number of CPG_BUS_m_MSTOP registers multiplied by 16.
> + * @plldsi_limits: PLL DSI parameters limits
>   */
>  struct rzv2h_cpg_info {
>  	/* Core Clocks */
> @@ -313,6 +325,8 @@ struct rzv2h_cpg_info {
>  	unsigned int num_resets;
>=20
>  	unsigned int num_mstop_bits;
> +
> +	const struct rzv2h_pll_div_limits *plldsi_limits;
>  };
>=20
>  extern const struct rzv2h_cpg_info r9a09g047_cpg_info; diff --git a/incl=
ude/linux/clk/renesas-rzv2h-
> dsi.h b/include/linux/clk/renesas-rzv2h-dsi.h
> new file mode 100644
> index 000000000000..faecb5d49c20
> --- /dev/null
> +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> @@ -0,0 +1,211 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/V2H(P) DSI CPG helper
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +#ifndef __RENESAS_RZV2H_DSI_H__
> +#define __RENESAS_RZV2H_DSI_H__
> +
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/units.h>
> +
> +#define OSC_CLK_IN_MEGA		(24 * MEGA)
> +
> +struct rzv2h_pll_div_limits {
> +	struct {
> +		u32 min;
> +		u32 max;
> +	} fvco;
> +
> +	struct {
> +		u16 min;
> +		u16 max;
> +	} m;
> +
> +	struct {
> +		u8 min;
> +		u8 max;
> +	} p;
> +
> +	struct {
> +		u8 min;
> +		u8 max;
> +	} s;
> +
> +	struct {
> +		s16 min;
> +		s16 max;
> +	} k;
> +
> +	struct {
> +		u8 min;
> +		u8 max;
> +	} csdiv;
> +};
> +
> +struct rzv2h_plldsi_parameters {
> +	u64 freq_millihz;
> +	s64 error_millihz;
> +	u16 m;
> +	s16 k;
> +	u8 csdiv;
> +	u8 p;
> +	u8 s;
> +};
> +
> +#define RZV2H_CPG_PLL_DSI_LIMITS(name)					\
> +	static const struct rzv2h_pll_div_limits (name) =3D {		\
> +		.fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA },	\
> +		.m =3D { .min =3D 64, .max =3D 533 },				\
> +		.p =3D { .min =3D 1, .max =3D 4 },				\
> +		.s =3D { .min =3D 0, .max =3D 6 },				\
> +		.k =3D { .min =3D -32768, .max =3D 32767 },			\
> +		.csdiv =3D { .min =3D 2, .max =3D 32 },			\
> +	}								\
> +
> +/**
> + * rzv2h_dsi_get_pll_parameters_values - Finds the best combination of
> +PLL parameters
> + * and divider value for a given frequency.
> + *
> + * @limits: Pointer to the structure containing the limits for the PLL
> +parameters and
> + * divider values
> + * @pars: Pointer to the structure where the best calculated PLL
> +parameters and divider
> + * values will be stored
> + * @freq_millihz: Target output frequency in millihertz
> + *
> + * This function calculates the best set of PLL parameters (M, K, P, S)
> +and divider
> + * value (CSDIV) to achieve the desired frequency.
> + * There is no direct formula to calculate the PLL parameters and the
> +divider value,
> + * as it's an open system of equations, therefore this function uses an
> +iterative
> + * approach to determine the best solution. The best solution is one
> +that minimizes
> + * the error (desired frequency - actual frequency).
> + *
> + * Return: true if a valid set of divider values is found, false otherwi=
se.
> + */
> +static __maybe_unused bool
> +rzv2h_dsi_get_pll_parameters_values(const struct rzv2h_pll_div_limits *l=
imits,
> +				    struct rzv2h_plldsi_parameters *pars,
> +				    u64 freq_millihz)
> +{
> +	struct rzv2h_plldsi_parameters p, best;
> +
> +	/* Initialize best error to maximum possible value */
> +	best.error_millihz =3D S64_MAX;
> +
> +	for (p.csdiv =3D limits->csdiv.min; p.csdiv <=3D limits->csdiv.max; p.c=
sdiv +=3D 2) {
> +		for (p.p =3D limits->p.min; p.p <=3D limits->p.max; p.p++) {
> +			u32 fref =3D OSC_CLK_IN_MEGA / p.p;
> +
> +			for (p.s =3D limits->s.min; p.s <=3D limits->s.max; p.s++) {
> +				u16 two_pow_s =3D 1 << p.s;
> +				u16 divider =3D two_pow_s * p.csdiv;
> +
> +				for (p.m =3D limits->m.min; p.m <=3D limits->m.max; p.m++) {
> +					u64 output_m, output_k_range;
> +					s64 pll_k, output_k;
> +					u64 fvco, output;
> +
> +					/*
> +					 * The frequency generated by the combination of the
> +					 * PLL + divider is calculated as follows:
> +					 *
> +					 * Freq =3D Ffout / csdiv
> +					 *
> +					 * With:
> +					 * Ffout =3D Ffvco / 2^(pll_s)
> +					 * Ffvco =3D (pll_m + (pll_k / 65536)) * Ffref
> +					 * Ffref =3D 24MHz / pll_p
> +					 *
> +					 * Freq can also be rewritten as:
> +					 * Freq =3D Ffvco / (2^(pll_s) * csdiv))
> +					 *      =3D Ffvco / divider
> +					 *      =3D (pll_m * Ffref) / divider + ((pll_k / 65536) * Ffref) /
> divider
> +					 *      =3D output_m + output_k
> +					 *
> +					 * Every parameter has been determined at this point, but pll_k.
> +					 * Considering that:
> +					 * -32768 <=3D pll_k <=3D 32767
> +					 * Then:
> +					 * -0.5 <=3D (pll_k / 65536) < 0.5
> +					 * Therefore:
> +					 * -Ffref / (2 * divider) <=3D output_k < Ffref / (2 * divider)
> +					 */
> +
> +					/* Compute output M component (in mHz) */
> +					output_m =3D DIV_ROUND_CLOSEST_ULL(p.m * fref * 1000ULL,
> +									 divider);
> +					/* Compute range for output K (in mHz) */
> +					output_k_range =3D DIV_ROUND_CLOSEST_ULL(fref * 1000ULL,
> +									       divider * 2);
> +					/*
> +					 * No point in continuing if we can't achieve the
> +					 * desired frequency
> +					 */
> +					if (freq_millihz <  (output_m - output_k_range) ||
> +					    freq_millihz >=3D (output_m + output_k_range))
> +						continue;
> +
> +					/*
> +					 * Compute the K component
> +					 *
> +					 * Since:
> +					 * Freq =3D output_m + output_k
> +					 * Then:
> +					 * output_k =3D Freq - output_m
> +					 *          =3D ((pll_k / 65536) * Ffref) / divider
> +					 * Therefore:
> +					 * pll_k =3D (output_k * 65536 * divider) / Ffref
> +					 */
> +					output_k =3D freq_millihz - output_m;
> +					pll_k =3D div64_s64(output_k * 65536ULL * divider, fref);
> +					pll_k =3D DIV_S64_ROUND_CLOSEST(pll_k, 1000);
> +
> +					/* Validate K value within allowed limits */
> +					if (pll_k < limits->k.min || pll_k > limits->k.max)
> +						continue;
> +
> +					p.k =3D pll_k;
> +
> +					/* Compute (Ffvco * 65536) */
> +					fvco =3D ((p.m * 65536ULL) + p.k) * fref;
> +					if ((fvco < (limits->fvco.min * 65536ULL)) ||
> +					    (fvco > (limits->fvco.max * 65536ULL)))
> +						continue;
> +
> +					/* PLL_M component of (output * 65536 * PLL_P) */
> +					output =3D p.m * 65536ULL * OSC_CLK_IN_MEGA;
> +					/* PLL_K component of (output * 65536 * PLL_P) */
> +					output +=3D p.k * OSC_CLK_IN_MEGA;
> +					/* Make it in mHz */
> +					output *=3D 1000ULL;
> +					output /=3D 65536ULL * p.p * divider;
> +
> +					p.error_millihz =3D freq_millihz - output;
> +					p.freq_millihz =3D output;
> +
> +					/* If an exact match is found, return immediately */
> +					if (p.error_millihz =3D=3D 0) {
> +						*pars =3D p;
> +						return true;
> +					}
> +
> +					/* Update best match if error is smaller */
> +					if (abs(best.error_millihz) > abs(p.error_millihz))
> +						best =3D p;
> +				}
> +			}
> +		}
> +	}
> +
> +	/* If no valid parameters were found, return false */
> +	if (best.error_millihz =3D=3D S64_MAX)
> +		return false;
> +
> +	*pars =3D best;
> +	return true;
> +}

Are you ok with this approach? or some other generic method in clock Framew=
ork to handle the milli Hertz ??

for eg: Maybe like introducing get and set to retrieve
the fractional part in clock Framework to handle the milli Hertz?

Cheers,
Biju

> +
> +#endif	/* __RENESAS_RZV2H_DSI_H__ */
> --
> 2.49.0

