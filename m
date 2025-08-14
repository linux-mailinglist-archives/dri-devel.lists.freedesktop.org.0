Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD4B25B97
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 08:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE1710E7F2;
	Thu, 14 Aug 2025 06:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DlfGACu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010059.outbound.protection.outlook.com [52.101.229.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D942F10E7F2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 06:08:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxsEVQfaEbVGyruOjEmXl2P5+cZqOHkBOqhbsA/nhV139RVpwIdixrma6R281TKbj6+DuWEBGtkDb7lqJnBLmumjDOBazT8UP13lmQhtqrosQ1QN9NhMy/QlfVB/ugijyEsTL4xUavXwhs1UUM/iM3pIrhe49+xCKG6vQnMq1m62VIiBWRz5tNUYjFW/OBoKvCPYPxb3DWaZtaBpfAVMHUyBL0XcW+EW7ORF/yz4pMItSo2j4kGT9tKwyLoZkDK6PnQQ2N9D2NgRiBdgI3kX2CGlPQRnxkL2uBzjsmuwwFtqX0kKdOU0yf4hFXBe72UubneEWLmBmStIejh6xoVjww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17IjWCPqFEFK+FUtPrhwYPzOlXAXjA06/QJg5J0sQ+o=;
 b=BsYIoCVusPTNQbA8GiHObDz6V3o+/iMjKnhxg8ZgOgqRAc+eMni70V+DS0K/OEQV8DIX7rGjH/KtGjLA1mwBXyLv4Tg57NR6dBFT5cWeuG9XC6Ce5gXz81lm4ESFM8euaLwio1exD824a6dkLWdckFL9j9yMyEwV8jmmhYCP1AmVXIWtl7XhMPiM+0ow5+Lt+RCc23fOV0maq6Z/0WnSqn0oxdAicbIy79SujIZrcJGAZR/gklPaliT3X0h9EYtsp2lLKTq1e13c67vH5WKEYztb6LmE7jE4aY8USKe8owqI7zs/SMw6IjjZlJQ/qzxIGFI94hMU2UkiFaI06eexbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17IjWCPqFEFK+FUtPrhwYPzOlXAXjA06/QJg5J0sQ+o=;
 b=DlfGACu3qmRHvbpgDwqCkllPm4OAHYg9aKUWAhQHe1KC3kIKJkRB0sl8VrIf4xn6nVfReXkOH+RtC5YD/zXO/yvCgy+MDskorQmebZ7dh738TOCzU1eGtrAq3t2pBnk0ang9LWoDyqwEANDDZFXSSEoVIPxilW5WDfDp3q1vn5I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9909.jpnprd01.prod.outlook.com (2603:1096:400:20f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 06:07:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 06:07:58 +0000
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHb8RPt3idI+6NLCEqifbue2Fo4mLQrF4hwgAB8ggCANkypUA==
Date: Thu, 14 Aug 2025 06:07:58 +0000
Message-ID: <TY3PR01MB113468C7F195036B28A70E9508635A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250709205532.747596-1-chris.brandt@renesas.com>
 <20250709205532.747596-2-chris.brandt@renesas.com>
 <TY3PR01MB1134628601112EF2B32F3358D8648A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <OS3PR01MB8319CD026C1E27CD7FB736F28A48A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB8319CD026C1E27CD7FB736F28A48A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9909:EE_
x-ms-office365-filtering-correlation-id: 1e5b932f-6966-4c08-8252-08dddaf8eaf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?c4uKroFVEObSUu+8fxewIHJm2I1TmnoTfeN5RuMZJF92+XYScgMOOb6iI4Wr?=
 =?us-ascii?Q?IXy6oqRWqYeqTgyaBqNRECK0Y/r/gPBgCmQqFQT9ni/PJob2avecbrHBzcvr?=
 =?us-ascii?Q?VCDdkZqFMdzScG+8nyXyr/SdP7fs0IcHhq/VcpuZrg3zx2X3t1QCMwoTQMWa?=
 =?us-ascii?Q?9rw7PbhhnX217iH5w7IQI83PqOCMLX01AlMOKgBTCDNzqLoIcxi6r49WC6G9?=
 =?us-ascii?Q?rfzy2GGEp80JJTDNYoWUBOk4Zkq2yXKjKkFXMRSJf76Ddgy63tvpcJRB68lJ?=
 =?us-ascii?Q?Dd8Y5E4odjJuP6Pm9CH7YGFsezKWg2cOTTZBOkiB0fSRymFsdbTMxJVCn5jp?=
 =?us-ascii?Q?+g+UKwbQicqFyp/t3Co1kLz9LYnflQAi9OYJ7NYwLKGuoeySEI9zV3IO2UiP?=
 =?us-ascii?Q?DxOj4yKDK9B+5qgHDEw/Lq8gOYLvJKKoHi3PrOfnIxZ/hfU8Bu/UU0bKZc0/?=
 =?us-ascii?Q?rzVGgE1VOzrmos1UmlsSETBO++5epEi6grwVaYrnr1cx2SCwjnJZwMgpK7Ga?=
 =?us-ascii?Q?Py9LbmXCMw5iBP48p0/+k04wvfW8ws2I5BeyrgAsBfZy2TBU+T+eGhFnG9w5?=
 =?us-ascii?Q?7qjxH1q13zWgTlVMaOPVlAvTpVyzyEvikUF0RhhIJjyOUS57C5TodUcdFbE6?=
 =?us-ascii?Q?3gqwQnFY00jiiKRZ13oYX7Rrb2dSUV6jNGyajah1QtgRKfvUHDeAmIvcDFr8?=
 =?us-ascii?Q?2nJLvZ+ziKm2XQF2vaPFk5WyK6NdcvBQW0oCa88RUu7n7S2WcbyuLWmAkau+?=
 =?us-ascii?Q?OjWrDVQNxAyy5EXF3PAKMmiLBSU9ow0wAFJqkgwFPbMKY6oS0fspE3kU/3TH?=
 =?us-ascii?Q?mQCKgbZf/4inyDPwNNUDpsRQoA5knWf8AxTb8853WSWpmKQx5uywUap0KKGy?=
 =?us-ascii?Q?0En9nD3QfYW9cSQEEWPNXsRc9CHtLke0jJBRaO2WWtYaLjKvXsLejSPOU3a5?=
 =?us-ascii?Q?6Nr/86yTfoW6DdM6GhdAv8cy1QX/iIm9JopAFovB+LqNNlkwA0ZPIZlG1H8Q?=
 =?us-ascii?Q?fCC6iHg46tRaRDS+4jjpPeeSsMG399vmJ9oK2KDZLWALwB3HvXMPneFqZuVF?=
 =?us-ascii?Q?YAR8sY3iTB5qU1EC4uLAgg+R4Ad4nVLFaJsesGgcE5gqVCF1gLVXqiJq2f+Z?=
 =?us-ascii?Q?TIRdevip3BNiWieRSQvet6OZaljay35QooLkl0lX2+NMqjehsiAZhfpT0EzF?=
 =?us-ascii?Q?YS9l5AkCcbN3ayif93PolEQpVqIh1P7JRxsJBuf+/wCqGORSW2/irexE786p?=
 =?us-ascii?Q?14MHvJSH1JhEINr1Teqk8xF6EIzceRdOCzLdlSS/+IsCVM1dq4/nCU2yszFI?=
 =?us-ascii?Q?SEm85H86HHZEe0OGox0VcpkUtj06WcFgxGVxOXrCkE9uvAyqYK2XLUdnBF2/?=
 =?us-ascii?Q?ZeSFJY2KsicU9M+mYNqnDF67EuqfoZsWhEAuWxHinJIMUUfwGeRVbVCfiq0l?=
 =?us-ascii?Q?S+VE9jyYGCrGuO96dVk+6c0xZ0OONuGqZeoJ7psvM+PKT64YYz9Vb5SuDFQJ?=
 =?us-ascii?Q?Duujc+zoWEhuGQQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ebr9z4xMs4uX5QqOXxc87e0q9zJvMDKFt3CFAUnhRCu+jBiNfWpy36V/chmn?=
 =?us-ascii?Q?1Qs1Rwt4BXc/snlHdLgRdIIGQ+b9hj6E/M3X6ZIfHW4AowfJtsuowvIQKH1F?=
 =?us-ascii?Q?T7Gwmf9l5nQu9H63DhaTDKWXua5sWxhmfP6Gy8e/XvK4F08klltT2PGrP2y3?=
 =?us-ascii?Q?fsy2Dks6xr+Yc7cOAmmlJUkTIRrLlEpObggPaxfFqybZ7hCk0Bd/1+ISdcDY?=
 =?us-ascii?Q?KzZVzwJHtKZsd7kJwGcVaLYcT3+c4Jk5TozhMUXjGuWkqmdv2KaJBn0b1e3u?=
 =?us-ascii?Q?Z8uxfNKWOoAqsxK25gsUsih+66mYyEKRwCElr0wSdsA/KhLuup7GIXWSTDLz?=
 =?us-ascii?Q?RlbnDMBsUOf1pmNNcETIPLk7d8gFOmUhzwTzXoIw/xdQ6OT5fBhT7NgUZvK3?=
 =?us-ascii?Q?jFr1eFk/fAwaHsWQp6zRaGbRQC0Bs9Ynt6EePRnd1AFWA2OzYba5m5DpKGz9?=
 =?us-ascii?Q?eSQIYz2xwxyyQjAWsh6yjo8h1UVkipaMgkEXm+pNSMajRakI0rdDEdeKVawZ?=
 =?us-ascii?Q?xQIC2tUnwXSoAi++BD+sa0aPc4CS7x9XwLC0Bb1IiliO3hthY87grBtxbaEq?=
 =?us-ascii?Q?q7VaBrEoW6vEbr03JjJ7c0nyqvhWzA9xQX0hlBI/RLRrd9DaQQNN5t4vseqA?=
 =?us-ascii?Q?9ipclkjq3gGpds0XTuk/dZVVkHLOVC5p4a2BsiOza96HBL8IJ3102crGn56p?=
 =?us-ascii?Q?l+tNeNdvXMdfreR20reYoMHpaE0WILthsYEcQ/0vD0Zhu+PIP2gy0Jp4hbb+?=
 =?us-ascii?Q?SnmIG5jo5rverxPRfnr+8WR87jvlq5Inh/MP9rOTMwDLSrPhEtmc/OGKBQ5y?=
 =?us-ascii?Q?XV9JzGG36WbLqFjmD3l+2rn6z/LXSmAc/dJOr936tvvKQevzYrEaXrU2b7aZ?=
 =?us-ascii?Q?CiPu2Kxk1E264pGRQ5KBjJk43QkGC93iqIcByNBmSjX4Uy5hCUEuhX7Or7LQ?=
 =?us-ascii?Q?iuXZSuInIdnDzjZSotFbFbhX9ZDM/Dxrtlp2X77tp2a1gNlN4a8KAW/Y1fST?=
 =?us-ascii?Q?F2GYFKUctU5xKpkIT2NN0NDZbZ6z2+jinnQjcqfLDJjR/W+SOD4WXf0mZF7p?=
 =?us-ascii?Q?B2SpbwFV4E4JZyyXC5oe3VxYopBjcXd98hMTF92PXGbL10m1dDR8DUivobg0?=
 =?us-ascii?Q?yzHERuj702XPaJX0d2YHUgpSQCgvR8vFuTtBdIuUmmro92UnTpspqxRzkjry?=
 =?us-ascii?Q?4Ar4ouS3UgiNmoj26lYI34Sw1T6uFdT5Bpp4t1+NizOOlrrHBMxEiCENktuz?=
 =?us-ascii?Q?gjoKJ2lMOYHqBRrip8lwxjn1FY5G7yfMptBjJztP5ZNZgWEo2u6IYfQzZ1zq?=
 =?us-ascii?Q?6PZzKdCOyhqJy4qXzQ6sUtCkaRSaxAeEp8bG8P8PZlGdDFJkABHi/R+4B089?=
 =?us-ascii?Q?Ly5xSfOD40Ty+8a1GRTbm32WXeqNJk8qFrNqT0Fw4gRLQOFOY/4Q3AsCuwnN?=
 =?us-ascii?Q?+An2Af0rT+8Mh7w02t0MUHv5bWGjnsvBuUg2BAwjPeN6zDTl2R7vWhtmnT9Z?=
 =?us-ascii?Q?mmCKD2D7cZPuBawFcTETzhwZYXRKwPeRNrXoP1GP8sN5M3+jBZsS2nrpiNh9?=
 =?us-ascii?Q?4Qfnb7iI6cSE6IU6jZ+wm+4IPgNeI0pbCcDlhl2cWGiSAk1NNRzcfP5nCkt7?=
 =?us-ascii?Q?jA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5b932f-6966-4c08-8252-08dddaf8eaf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 06:07:58.4577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tuWav3SW6uOykpWJFLya3/TMKZXmIUYLQr0AKqQT6ia/Wfi5joyfSQOqeBw3F4CHSwXNrpF6LyRQhMEWAJkfpyoiSgWyThhn/mN8JgrBCJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9909
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
> Sent: 10 July 2025 17:53
> Subject: RE: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate restr=
ictions
>=20
> Hi Biju,
>=20
> Thank you for your review!
>=20
>=20
> > > +/* Required division ratio for the MIPI clock */ int dsi_div_ab;
> >
> > static int dsi_div_ab;
>=20
> Good catch.
>=20
>=20
> > for the DPI, DIV_DSI_B =3D 1 and DIV_DSI_A =3D{2, 4, 8}
> >
> > So, you need to adjust the below calculation for DPI as well??
>=20
> You bring up a good point.
>=20
> And looking at the hardware manual again, there are other restrictions wh=
en using FOUTPOSTDIV (straight
> PLL) compared to FOUT1PH0 (PLL/2).
>=20
> From a chip design standpoint, they just expect to have 'one big driver t=
hat configures everything at
> once'.
>=20
> > Not sure do we need DSI driver registering a callback with CPG driver a=
nd CPG driver uses the
> callback to get DSI divider value and this callback can be used to distin=
guish DPI from DSI??
>=20
> Ya, you can't just tell the CPG driver to 'give me this rate'. There is s=
o much other information that
> it needs to have before it can set up the registers.
> Hmm....
>=20
>=20
> > > +found_clk:
> > > +	if (!found) {
> >
> > Can we add a dev_dbg statement here for !found clock?
>=20
> Yes, good idea.
> That was in the original driver before I started pulling out all the prin=
tk statements.
>=20
>=20
> > > +	/* If foutvco is above 1.5GHz, change parent and recalculate */
> > > +	if (priv->mux_dsi_div_params.clksrc && (foutvco_rate >
> > > +1500000000)) {
> >
> > Check patch is complaining:
> >
> > CHECK: Unnecessary parentheses around 'foutvco_rate > 1500000000'
> > #146: FILE: drivers/clk/renesas/rzg2l-cpg.c:648:
> > +	if (priv->mux_dsi_div_params.clksrc && (foutvco_rate > 1500000000))
> > +{
>=20
> I saw that...but I thought the ( ) makes it a little easier to read.
>=20
> But, what's the general rule here? Make checkpatch come out perfect?
> What's your thoughts?

I just ran check patch and it complained this.=20
I am leaving Geert to comment on this.

Cheers,
Biju

