Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F126B00941
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 18:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CB110E385;
	Thu, 10 Jul 2025 16:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="n0RvN3vI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303D310E385
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 16:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQyI1Bmmx+FN6hZqghI3s3RenQyR1wU4d+dwDQaALumJ2XlNaloxZBZhGEVRWHGyI0PXTrxO0RBUmou9THvlPym7hSSDG3jTfLfn4H21kFThBpbg/F59dxLM2DrmwBU+ZCMyMIXCCUJAYivl1awDxgPNlOHcTHdYbllF4bk/SRryQoD68pydzDDuk3gQlJNwPz7Aaf2GFefEjhHUFezLxQ4g2rGSZCpD3wlsfYzoT3buUeeM/lUr+5FDhg0ivpX7VjepyAQTkVKu3wMkGdwOh7u1LvIL9QJrNf3Mjr9F+1ZuXxv8OIN+Yg+SP3MBmX+uEDioT2pVC3iTLJNDUBSZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ft7q4/9ieD0SBxlm/jTNWuVSrZXRNyxwCSnIgDbOLQk=;
 b=QLgCa1Nj8P05/YYYu71nT3N7Z/Drptbmo8QrUi9HjENgJFWWr5+r6avXPw2ELr5VXj8/tc0yAGtOPT17Xb6f59l4zD6don0jOCbxtS4E7ds9I+QsOqmPbq/fTtsSnrXln4lzUuqSGwWBInZTZd98tam+Xe/cDCH+W2z3pYeks9r2n2J5XHGwzUthgovGadtDJJeuSGAKIzpEucp8mPcP7x+db4R2qyoB5zD7Akj4L97P7OeY0SRMVfX0MiAhrKk0l17W9HBW5rlxzyYjFRjPvfiSoB+/svgR5Qgayz91eX8bqXtzVZIB86VT225ZnhvscqEHd0Cu9t1Qt6YpvkA86A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ft7q4/9ieD0SBxlm/jTNWuVSrZXRNyxwCSnIgDbOLQk=;
 b=n0RvN3vI/xnccWUqOKHpZ9ZpgdbMsSU/mCsqDs1NqTnpU2KX4/qrUYXu/HiorOzquYxiphuDAZ8amTO2tptYd4m8n/rCD7dHs6dPljWHCFBoCTrv5wY0uZ8xp1aQUzAiSQveE7+h6mSLFPYnQ2Xm4Aa0g2NCdRI86ocl0WVKA58=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OSCPR01MB14837.jpnprd01.prod.outlook.com (2603:1096:604:3b0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 16:53:02 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%6]) with mapi id 15.20.8922.023; Thu, 10 Jul 2025
 16:53:02 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
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
Thread-Index: AQHb8RPtwZ8i4xlUvk2VQsSahgwNBLQrIIkAgAAw8rA=
Date: Thu, 10 Jul 2025 16:53:02 +0000
Message-ID: <OS3PR01MB8319CD026C1E27CD7FB736F28A48A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250709205532.747596-1-chris.brandt@renesas.com>
 <20250709205532.747596-2-chris.brandt@renesas.com>
 <TY3PR01MB1134628601112EF2B32F3358D8648A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134628601112EF2B32F3358D8648A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OSCPR01MB14837:EE_
x-ms-office365-filtering-correlation-id: e7cb62dd-e0bb-463c-8843-08ddbfd23bd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SFoRBn06RQlst62nDthhtrJm+RJ4qLt9QGq7EJBsgAP7tFkuISX10v7U9S2S?=
 =?us-ascii?Q?+0iCHhuL8awUPehFO5Q2Upd4kaff3nYpDxdAq89tt42YmhKj98QtNtyrydgY?=
 =?us-ascii?Q?JDX4vlSTDxAo+ZfvcGkzj2QLzBB+6aClvNwk+EMORaJD0wGh7BIkskJ3udSn?=
 =?us-ascii?Q?Ck8KdHJk8LZoR8ZgnmE3bK4g/3PI2Jrx+0xk56B8Td+oqasgFwQW3Ycp57xO?=
 =?us-ascii?Q?ZQO6VDx02J2X9XYLB2FW+iXndJ9VdthpZihqIBtYGoPQ3DDIQWm4JJo/Z7JH?=
 =?us-ascii?Q?q/A3LF7Fg7f8LVbeWn3c4nAA3riJ9wukTVp5Cj4NpKYT3rf2EIUHOlAAxp+S?=
 =?us-ascii?Q?CzkUcYG6qJ8erqm219kMSb/fwDKk22FTGYJmiqmxRTryX4GV1wxQkt4Bldzh?=
 =?us-ascii?Q?rQOM2lHFHSNBjOzzXcE/5iVJBdLvHJgi7PMu9Du3eOnJcHQ3jo8yfJw0n1hd?=
 =?us-ascii?Q?zh6HT84ffeg6BwOz9KT774FzEKB1QBb5Sg2BaTKHaccAPj1t6h0wey2YiP7B?=
 =?us-ascii?Q?nJUc6lzlh3yFKwzkeUYQ1tEKD4WYgwFLz9RZ2cuXTw5FP84+mTlV4/b9dPub?=
 =?us-ascii?Q?4woNO1JSzlkartm+DEOeFlMCCGTAE4WkyTNAB1km1S8gYULz37bdaepSatu9?=
 =?us-ascii?Q?i/PkkD9vbLZj5ELHcQEUlvFlc/qmX4N3sFn1UcK2Ov8QH962pAo0QCjAu53v?=
 =?us-ascii?Q?bEt2+sJfb6bB3X31d+i0X0VnNZzFCvbXffAK1qQyqbnGtcTZJyecJfi/ViIy?=
 =?us-ascii?Q?1jlS8+8jTTB+gEDUENuuOuRhslmDU3hn0Q+T/J7vReqRAVFZZy5YtlXed/Wf?=
 =?us-ascii?Q?suvrMm09dBhMJj3vyauXT2YopfDeP25H0w1n3ROiynf1QuoWc4twlhD7hlNs?=
 =?us-ascii?Q?npZItISxGcKzJJfR1sK8nsDgBvVbM1K9nHkJGi1Z2S6P2k81kIJrzIlv14tf?=
 =?us-ascii?Q?4adqXfjgA4UGx4LsXIzvtbjcocc4pHOiZufZ/l1DJwtLGxgqWt4UYxP3TOol?=
 =?us-ascii?Q?oeLP2OdhlskxargDljDtO+YCe+9XiIadSHJtPS2HDruFg1fVC0S1lJy5eCyH?=
 =?us-ascii?Q?KmGmjeTa88O9bn3QO79DQkeGCj960OsC2nPABYD5MOuEdOpovltOPBTN4HSC?=
 =?us-ascii?Q?EBOQNTBxwpNHyRmqC8eKmr7LtIV+O8VcZWsZ7Dp6T2yZyZAsPF8FZdEDBGCC?=
 =?us-ascii?Q?7JP03okm4AJ1v7vXQ1gGScWH0c5EAZAzDkjNba3pfKbRlIVOPxK4mhogOOcU?=
 =?us-ascii?Q?vEA1XfAm9HUV6B7hE+LDDKS5t7UWea8+/JTkoYNIWr8Id+gQyZeTB8E6IMF4?=
 =?us-ascii?Q?TfHDl2HZIkEKGMUxT9cshsL05j2ikUb+EPZmFu1k3GTPyIZuomhA+EjTA/YO?=
 =?us-ascii?Q?i/tjMxmsqyT/u1FrzB3rDauVYUnYjWVj44FN7H1rM21Cfxn8BMhqmeCPjY6X?=
 =?us-ascii?Q?P35aYsHMD5pyiEo0/7ZW/ZWMXj91MSPEhDWyXc0fpMW5LxDmuQSnRr8vOTjH?=
 =?us-ascii?Q?BqMCl08l06eaH1Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9ndicyL2yyYON+4+4ZShE/f+xwnm6kJ3giPD5wns0eXQVhBkYJFWRvFDVS0H?=
 =?us-ascii?Q?rlj/JWg7aUTeupsEXyf8QOhz8XlpErLwl0s2NkD0OdtNhk6HlXMwl1VbtAZ+?=
 =?us-ascii?Q?7QrtG/AZK06VkK6wY2HpANc4JOJHbtDS8PObvDV9zxanj7ps/2CD40AC5FmL?=
 =?us-ascii?Q?pljXKQbuzPQFMZaMb6K0tTrUY3Ap7islDnCOHofRtIXUcB/rAXqaZQNaRFDl?=
 =?us-ascii?Q?I5ZnRsFgqgKZKnUGy4qPj6PkO9EuRtlziJq3agQAzwAuN+hLZ2IxrjemW1am?=
 =?us-ascii?Q?E1Jkmf2iwzmFdCtE/IlpWEDW9W9JCxqu90hD7YSg2iihoWoS8QQtAiuuXNVw?=
 =?us-ascii?Q?dfOTdiApBTvyANSR2ZWPOQ1VfalY7r73IHaeOfdF9hayJJQxnpUxBNWlFQq1?=
 =?us-ascii?Q?Y/GgbNGqNYQYObrOu/jnA+ytnxmoRcyxA5frhpUP6/GqEjMqx610kK9EUH35?=
 =?us-ascii?Q?pI52vUOcHAJSPMOgc31Py9oi4r6LYmGAHxO4k2wF7n14GnxvfAVPOYA6Z6No?=
 =?us-ascii?Q?cxOsdqbZ2OtqptQ2xdsLD2QRmVd5UqUUk0TLUqhhb3hv4UsfXpj6UuhE1AC8?=
 =?us-ascii?Q?exnazj8BE47C9XBOE91eK2Kv/DqWzWg+5TCu1DyLzQZAaKg9cPdL5Abk61ho?=
 =?us-ascii?Q?+nEsFy1XFB0UM9lcOfM7JS84bYbRmVtcli6NQk/XXVZ9EHKZZ2Q+Py7Iss/k?=
 =?us-ascii?Q?CFhcGghdb7FBFT/RaeNMXphHdJd3CGAi3MjoVRPlp8QdIj5dUXqisK8MkpoN?=
 =?us-ascii?Q?vI0vfiaE+gV4C8CEXs5O1xL5Sg/ZIpcgo/njcs6Frhoy4IOe4JENw95H/HSX?=
 =?us-ascii?Q?T1X9MV8U1RKgT8kfk8jzy20UZV5MiIvecWKMtNG9R1/a4bEpXjDtMTGzC8RY?=
 =?us-ascii?Q?C/rLiHQhMw8I2JvJBbEHUosf8T2jSQ8P7y0OnKDDt4g/PrwFoXuFee9XvR2b?=
 =?us-ascii?Q?hCA9W5Q76i64rU+C43t2blB6dwfBFoLHzKKdNl33rI/bqJIFYlF6YeRL0VZz?=
 =?us-ascii?Q?U5lAFMEMhLr0tH5V+2JhMQDYbMJ7EzmHPfLPgq+yVrQkB42Vo1DvoCpgJOWK?=
 =?us-ascii?Q?Re4oVNhyQnUGdgbrq4cUq0tpsf4RBfUYYmTq+NHX5a+qPwGxEcqH8PpnURQN?=
 =?us-ascii?Q?3viS2TuG/Su75WzWIsJh817fMnaPi/C6sazM5U5y/hTdXZFeaB9pm/XRbSvv?=
 =?us-ascii?Q?7hdtI3Rx8CM5cykq6Br87lkdDDO2UL9U17BvjHA4u25IcDW21SxMVvIv6VAC?=
 =?us-ascii?Q?zBzJd4OlpvsaVbLXk88bOgLpB9jIMDQJBoUbgCq7yUeD2VEekyPyyY5uIEF9?=
 =?us-ascii?Q?FUxIwfhTSj3EsbMVdLhPI2RabNQaCbDdp5zDHIJrry1Wj4PLszcDg4TbYQmA?=
 =?us-ascii?Q?Hpo2HQ12ye/U7ZG+n0vPC0ckK1ilTzLZLETLh1oqoJMATE5QXMbjtxKzRMTD?=
 =?us-ascii?Q?q/Lbn0p5oG/8Lve5j9ZTOch/fwTd1/1us2Mty6orTmhAipSurvNBCnrOv13V?=
 =?us-ascii?Q?3phgvAEPWYDj0XAq31uFw0E3r1EPtpiwE3SL5pD4dHwz/3F1FL8XhX6/hrDt?=
 =?us-ascii?Q?fHCLJgDRfmG+PH2984Qk46xl4VMWbOyAtaouJELO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cb62dd-e0bb-463c-8843-08ddbfd23bd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 16:53:02.3843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DM7xSrylHWe6BOI/ApQ2qheiB75Jmii7U0bmH+4BiMT6hFZQUA5WvicM/RQ8e4PK4iipozKelCMO4Vy5CKQVeEvT8POAvXH/rmlCtdgNoMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14837
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

Hi Biju,

Thank you for your review!


> > +/* Required division ratio for the MIPI clock */=20
> > +int dsi_div_ab;
>
> static int dsi_div_ab;

Good catch.


> for the DPI, DIV_DSI_B =3D 1 and DIV_DSI_A =3D{2, 4, 8}
>
> So, you need to adjust the below calculation for DPI as well??

You bring up a good point.

And looking at the hardware manual again, there are other restrictions when=
 using FOUTPOSTDIV (straight PLL) compared to FOUT1PH0 (PLL/2).

From a chip design standpoint, they just expect to have 'one big driver tha=
t configures everything at once'.

> Not sure do we need DSI driver registering a callback with CPG driver and=
 CPG driver uses the callback to get DSI divider value and this callback ca=
n be used to distinguish DPI from DSI??

Ya, you can't just tell the CPG driver to 'give me this rate'. There is so =
much other information that it needs to have before it can set up the regis=
ters.
Hmm....


> > +found_clk:
> > +	if (!found) {
>
> Can we add a dev_dbg statement here for !found clock?

Yes, good idea.
That was in the original driver before I started pulling out all the printk=
 statements.


> > +	/* If foutvco is above 1.5GHz, change parent and recalculate */
> > +	if (priv->mux_dsi_div_params.clksrc && (foutvco_rate > 1500000000))=20
> > +{
>=20
> Check patch is complaining:
>=20
> CHECK: Unnecessary parentheses around 'foutvco_rate > 1500000000'
> #146: FILE: drivers/clk/renesas/rzg2l-cpg.c:648:
> +	if (priv->mux_dsi_div_params.clksrc && (foutvco_rate > 1500000000)) {

I saw that...but I thought the ( ) makes it a little easier to read.

But, what's the general rule here? Make checkpatch come out perfect?
What's your thoughts?

Chris



-----Original Message-----
From: Biju Das <biju.das.jz@bp.renesas.com>=20
Sent: Thursday, July 10, 2025 6:00 AM
To: Chris Brandt <Chris.Brandt@renesas.com>; Geert Uytterhoeven <geert+rene=
sas@glider.be>; Michael Turquette <mturquette@baylibre.com>; Stephen Boyd <=
sboyd@kernel.org>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; M=
axime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;=
 David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Hien Hu=
ynh <hien.huynh.px@renesas.com>; Nghia Vo <nghia.vo.zn@renesas.com>; Hugo V=
illeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; dri-devel=
@lists.freedesktop.org; Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate restric=
tions

Hi Chris Brandt,

Thanks for the patch.

> -----Original Message-----
> From: Chris Brandt <chris.brandt@renesas.com>
> Sent: 09 July 2025 21:56
> Subject: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate=20
> restrictions
>=20
> Convert the limited MIPI clock calculations to a full range of=20
> settings based on math including H/W limitation validation.
> Since the required DSI division setting must be specified from=20
> external sources before calculations, expose a new API to set it.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Signed-off-by: hienhuynh <hien.huynh.px@renesas.com>
> Signed-off-by: Nghia Vo <nghia.vo.zn@renesas.com>
> ---
>  drivers/clk/renesas/rzg2l-cpg.c | 113 +++++++++++++++++++++++++++++---
>  include/linux/clk/renesas.h     |   4 ++
>  2 files changed, 107 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c=20
> b/drivers/clk/renesas/rzg2l-cpg.c index
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
> +/* Required division ratio for the MIPI clock */=20
> +int dsi_div_ab;

static int dsi_div_ab;

>  struct rzg2l_pll5_mux_dsi_div_param {
>  	u8 clksrc;
>  	u8 dsi_div_a;
> @@ -548,24 +564,93 @@ rzg2l_cpg_sd_mux_clk_register(const struct=20
> cpg_core_clk *core,  }
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

Not sure do we need DSI driver registering a callback with CPG driver and C=
PG driver uses the callback to get DSI divider value and this callback can =
be used to distinguish DPI from DSI??

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
> +	if (priv->mux_dsi_div_params.clksrc && (foutvco_rate > 1500000000))=20
> +{

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
