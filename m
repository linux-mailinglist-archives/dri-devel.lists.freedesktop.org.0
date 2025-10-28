Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2482C16BD2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A489210E65E;
	Tue, 28 Oct 2025 20:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PQwljgnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010035.outbound.protection.outlook.com [52.101.229.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A616010E664
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 20:11:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8z6400X9aM3O5shnx7xW2MeVM7nF8A7l6pbMXcNPWpRAhm2JJD+qV17hfMxXqsUsv5ofOnxOt2/r2gFQi5gtrKuG5lkLZwVCHeq0YkCeaDda7uDzJ1aSlILf/FnQgEqqad/CogC5r+63gK7RP9IulN4L1h2jFKxruN1hp0Ph0tCCjRY/bMrXythHa488c4edUgny9qskNSTS0DueVWW+Ph9j660AqMF7lAaxViiU6L/iRMi/58AeTS37AefEFJ1tPc2eo797cUcN/5p7lx9bp3t4YpYhpLMzM2IVs7Aa/pXGHMCA2uTEYcfBxC3ZRDhqjnWtdmxaCMf/h15T0fImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxsHhdRJzfBoQQEJ6Stja0+z1/KyMnwdHgIwe1QJhx4=;
 b=Ya0e2PmFWS+ceNIPY69p9bKvnbmeF3Lj7KcpXeEvg8wCeVi/CwhWZr5vge2Wex2ZnVziQ5wdrQhN1mC+/+ikkq0bFLUJJxhreVmIqMXrBYe56RN7S3MeYRM7M1/N828fsXMuVFdErR8dUYIDPBljwiG5+XpdIKgyjUCqfNaJpC9iuLRddvQ+YgXCvQb1eaVRGuKzI/3FVNmH0WnBkH2d/9wCkMhlffk+SkCKjtC8FFgOl0d6Ofn3MzRNiqZgwtLmVAeMSKvJkbzJZGVav1Z82R7dHCkbhcENGKmrEHl2+nKARENVnOiXe7CzSuFYbezUXNEGyMvza2UBLrTeBuh2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxsHhdRJzfBoQQEJ6Stja0+z1/KyMnwdHgIwe1QJhx4=;
 b=PQwljgnQZBZM7a3ZpXwz2Im308TtaFnMXLxuMzoA/uKmj2Rz3kkbWxm+Ygk8t73U0524OWFRIO9GWRuenAEaePDgzbJjugpkLKvjQNQ4NWy/6H7Y/3A5DogsmvYz85yXM4y0DI7RzByLIXesmupFZBVG1XGWJeLgPmdrSKPXg4Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15996.jpnprd01.prod.outlook.com (2603:1096:604:3cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 20:11:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 20:11:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Chris Brandt <Chris.Brandt@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcQ6/1Ivscv3eD0kOXKb/C6I0GV7TQDy2AgAe2Q4CAAAXbAIAAErMAgAAVY3CAAAt8gIAABA6w
Date: Tue, 28 Oct 2025 20:11:46 +0000
Message-ID: <TY3PR01MB113468E6C9835E2EB063EEA0386FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
 <20251023143141.a1a274104e3704dd8680f901@hugovil.com>
 <TYCPR01MB83278181C69129D2283C7AC38AFDA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
 <20251028123848.57512e792da671b6f8f50be0@hugovil.com>
 <OS3PR01MB83198C16302EAAB7D2A163DC8AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346376337E4C12C677446C986FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <OS3PR01MB83193390A5D983E66DAB62528AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB83193390A5D983E66DAB62528AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15996:EE_
x-ms-office365-filtering-correlation-id: beb62639-b222-4243-cdb9-08de165e386a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JxT56JQMw/1sBg2Tp6rHH6N/segeK1W3vz88ORdj/DurDFd4DO4snTSjsxK0?=
 =?us-ascii?Q?b9vuHNbgA/v50pCocaOYrfiVzWIfkGri002yDhEM8U/lLuhYn3KYVE4+hUh8?=
 =?us-ascii?Q?gT8yIXriiLrtrqf77i0DSiHpeDh80XoSmj9y7KfP8EGQFK/8TR0JFbX2whtq?=
 =?us-ascii?Q?nBaaMB5IcwSBIXbTQUZKfYbYgBrp9hb7LM9tRSmor1vKjT6T4i6Elc+EWguO?=
 =?us-ascii?Q?m7/Pt211ZBpcDiaQxiBJmJhRv0LacCNRhIW8X+FaU7durVcg6EDdDrY2l3Ld?=
 =?us-ascii?Q?1nlwhHPFXi0hPwuOWGfw6mk2P+sxwcQSVaFxWUjYJ7ID6svaQUAlZbUElBuX?=
 =?us-ascii?Q?97sqwOBwHvselzYiVKA7URL55HzKP8mOsnwZBlCqoV3GzApQV3R8HqCL4ykS?=
 =?us-ascii?Q?fAHglwMCI8/4tDZCSYLwdh6Gwa7DCjhkm04K9PioxpdAbHyxcAnrcBwwHmpK?=
 =?us-ascii?Q?9uiwOPUk0JUHXCpOypSjHzpBhPwu22MDW7qhMG1OpMhJFanDECDn1Tv8Lj7U?=
 =?us-ascii?Q?ZKsMHYbNttUz5KbYKN52b6YFHbq7p36CEO//bN3keyFtZbwKeFhxHCfgXoaE?=
 =?us-ascii?Q?gj1zsAlPIpGZB+4bDjhhZv2Ay5cHVBAOxAaFW5+IwHpqgn8H7PXS6w8KPJIM?=
 =?us-ascii?Q?gJJLJb9Nu8AB0D6ABMhyLt8CK9q2GQezhQVb5H0MKmHVRJFlRXJkrjsarnjZ?=
 =?us-ascii?Q?uts+EFAtFj8Dgz5oi4UyNV33SVyo8K7Gk3Vg7BQ4XMI5U77Bj0pOC4TeBwYB?=
 =?us-ascii?Q?WZYkzUk3kiAPPuBwSqzVGyS1PxXVHnaqmlXvcL13ZQ6uPtbV+Yw1EAc3ZbRY?=
 =?us-ascii?Q?lDDvTlIy8zHhdjQV5ZxxrZ5UdbiUE3sdiA3OrZUAVpm3BlOvRlhcTp4biycJ?=
 =?us-ascii?Q?PwWLUmpMptxyAvd9/DEE7kctIfLTbsZy6k5tGpShK+G8/Rmu5RAjp7b7pAZ+?=
 =?us-ascii?Q?hbbs2pd/vw8VmQ2HreJqGPwM5AJ+L6sEqdpFBUxsZohCU3kNrXBH+ii43gHF?=
 =?us-ascii?Q?TScJ4DZNxkxd17SK9urshkPey0/9KXZ3aBhHxe7cWn78XRNJ8CYByeeFWIzw?=
 =?us-ascii?Q?TVbdm9Tlm4YRm/5TBHVR+LiXlapePVVc4/wHgm7g+COCwTKMp+oPRrb+D0fF?=
 =?us-ascii?Q?1D1Di/w51lqj3h4sQfisdKwQYHXz6EwiBIheaC1k9+MuRnDJM4ZzjcFsZ+AF?=
 =?us-ascii?Q?okdE78HmZYWwZ+iZBls7C2aWV3PIZc3pUsnkeybPEjWgVIFEUJcCjFJrSWIk?=
 =?us-ascii?Q?zv0wLkgFD316TntzJAzaqhNDJCbe5I+kB2mgNB+6CVftVsgkp9D0JeAgbkp6?=
 =?us-ascii?Q?BSYFMCXJ0JaN4HrK+xweIuhAwgpRJOYTW+Pnb7uV/PMesJk2DWG8GevGOr5X?=
 =?us-ascii?Q?LvibDnCA35FG9YTphP2JrO21NNdXZ67ayfbJkBxi/SHcnB0HkcksYA1xNoza?=
 =?us-ascii?Q?czwK2hXMFyRVsVK6Tv01kJdvTJlvnas6b5QWCGDbl4Y+XaAUJhrEVg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NpN5momTP8Sm/dpYqOzWcMc+MFrOGs2vzsnVw+k42jeMg0/Vl0YPpwym5jfQ?=
 =?us-ascii?Q?1gkvn1cCcGxF5sFR30qNqUP7NLOf7JWqnWt0SWjU440SRhIONuUAvgEa0sSr?=
 =?us-ascii?Q?mHQmpFZJKEqlJfnxXhspt8cQzq+KeukxUGlV075ZmAzBUsKDVQCll+QKUhXl?=
 =?us-ascii?Q?Im9ZGkLNolcWkvCZ7N4SMhpbhypFKQMxFJ/uHIXfHpTRCjkmnuyltOe5+fMy?=
 =?us-ascii?Q?ijnVlcLXiQICt6JQF8wf5RnrJzDyJOmd8bDwQbtEVVplDVxy++Ukyat2SVxT?=
 =?us-ascii?Q?mA9XaW+/pCSGKaA4z+SbT9tmwpIAhTuDjhk3h+u7wRWziaIeiMkVHeCAvuNO?=
 =?us-ascii?Q?piIjccZziue9c7LhHq5lxcm65djMz2inyDdl8HQsa744mNvZO4Pnf5l78rmn?=
 =?us-ascii?Q?7kJZmru4b3p031jZSGFzE/2sD3huLBAMOETvrtRe86/ZKvV4kCleu1e49VIX?=
 =?us-ascii?Q?4u1TQmcfeYXe3iY2r89pA0J/g6MMAq1zFjHmz37XcVtn/ugmiRbQlfb/Sjzi?=
 =?us-ascii?Q?pM82ZBV7v9GZ2l5I+GSz3RLBxk8sYB3xKvzeCZshSoZuEJfyfSEDXZNT4DhE?=
 =?us-ascii?Q?lgBHnWwYuJgRjoeE7bSLFssL9mUFUKAy0zn19BZ6GR9t69g0d4/dbmZPW9NX?=
 =?us-ascii?Q?Ml3QezLqa+TvGGSqRiWps+KGuI2yD+kkImQ3lDPw5veSJYv7biX2J07k5qQA?=
 =?us-ascii?Q?PHJYuYsKFA0p/eujWjafuiRKZG4ZS21Xlo6kTgzE7VzF2z0uCaIHVNEpZEuD?=
 =?us-ascii?Q?asC55bjNVjfCv0gqyBhVn4+dC6IsRA82YMmIJTVowjyvxu89CwBxoZlfqlU4?=
 =?us-ascii?Q?IJmEB0XWNLdpHTgcC18Rd5Z3JAUIL/QSUObiiqwDvZnaBanC9CazmP5EwZVc?=
 =?us-ascii?Q?RD/gAI++If10ev9CgaHMZIcLNQz3d9dUDkUwkFbWeUCJtoJVDmsymmAllhcN?=
 =?us-ascii?Q?JwiH64Lc60OPbBzancR3gosctWnitZvHovHlyf/1AZUP4YXD3MkQpVM/tWXg?=
 =?us-ascii?Q?YpNQKQhC/Y6QJvIju1ybIfiJEpxjKuO3bv1SauWXYSnqlXGGX6oXGHT7u+Ll?=
 =?us-ascii?Q?UsHKyBbDRdnJPA83UR34/uWdDZBP7QCQ/AoLQT+BeUrb283lvENNA+ODMGuD?=
 =?us-ascii?Q?3GOXwyXNyUFY+HW5KVdvhB/Tj1/sZA4iA1bq+j537bWvVDO6zCLJRHT4QyIb?=
 =?us-ascii?Q?17/NyPhvGbaioo9lbb6hajXy/8gFUZQqzJjK/tilhOavO6l0zp/v4X9KyxP9?=
 =?us-ascii?Q?qGr1v6fSd/NRRZ+XJg+UxUqYR7rVJh2K52l/3x069eHaojrsIYfpq2TCn8IT?=
 =?us-ascii?Q?85AQIEHx44rK6NR2QJvrZlKkQ1PNVjHTndavILJ73QyS8OHRUqXzcDDPkSB1?=
 =?us-ascii?Q?qi9EIl0Sb38JDC7MiEvn+ICPGL1h5gLU49LImQ5PttPVMUbRtRms5u2UE1Af?=
 =?us-ascii?Q?230lTQioN4+fmhkC8g18qM3G5YJbT23czaiajmx/ICwJzIs0f8kU0mYFJMH4?=
 =?us-ascii?Q?5GTWNaQ43G2YRanKi0fxgAadpEuvhYLCq3y584dPbJVWQOiOt3kuHTtaeTAh?=
 =?us-ascii?Q?rSsj+ciGVGVLIbG9l6fWGDHkVMS/2qtz3N7Kna185qCMRIqflEPwh8JYqITR?=
 =?us-ascii?Q?nA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb62639-b222-4243-cdb9-08de165e386a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 20:11:46.1917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: naztYPHzId22WsqZefR0NCvEk9zJbEtraqpLWiVr6Uta+MANhnhXiAhfCfTAqsnoyFm0FHmxRdCO1PRtFtA3skpgAK/WzxPnX2wApMdYUWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15996
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
> Sent: 28 October 2025 19:43
> Subject: RE: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate re=
strictions
>=20
> Hi Biju,
>=20
> On Tue, Oct 28, 2025 3:07 PM, Biju Das wrote:
>=20
> > > However, current defaults today in the driver are illegal for DPI,
> > > even though they clearly work in real life on all the RZ/G2UL boards.
> > > 	priv->mux_dsi_div_params.clksrc =3D 1; /* Use clk src 1 for DSI */
> > > 	priv->mux_dsi_div_params.dsi_div_a =3D 1; /* Divided by 2 */
> > > 	priv->mux_dsi_div_params.dsi_div_b =3D 2; /* Divided by 3 */
> > >
> > > Side note, that code comment "Use clk src 1 for DSI " is wrong ...it =
should say "DPI"
> >
> > Why?
> >
> > This is correct as per hardware manual page 283 and [1] and [2]
>=20
> For "DPI", both RZ/G2L and RZ/G2UL have the same table and same restricti=
ons.
>=20
> Valid values for register bits for DIVDSIA_SET =3D  1,2,3 Valid values fo=
r register bits for DIVDSIB_SET
> =3D 0
>=20
> Remember, this is for DPI (not MIPI-DSI)
>=20
> You were the one that pointed this out to me.
>=20
> The driver needs to default to DPI mode (PLL5_TARGET_DPI ) because for RZ=
/G2UL, no one is going to
> call the new API to change it.
>=20
> > > 	priv->mux_dsi_div_params.dsi_div_a =3D 1; /* Divided by 2 */
> > > 	priv->mux_dsi_div_params.dsi_div_b =3D 2; /* Divided by 3 */
>=20
> So the current defaults of DIV_B =3D 2 is no good.
> DIV_B must always be '0'
>=20
>=20
> I just changed the code to this,
>=20
> 	/* Default settings for DPI */
> 	priv->mux_dsi_div_params.clksrc =3D 1;
> 	priv->mux_dsi_div_params.dsi_div_a =3D 3; /* Divided by 8 */
> 	priv->mux_dsi_div_params.dsi_div_b =3D 0; /* Divided by 1 */
> 	dsi_div_ab =3D (priv->mux_dsi_div_params.dsi_div_b + 1) <<
> 		     priv->mux_dsi_div_params.dsi_div_a;
>=20
> And on a RZ/G2UL (DPI) EVK, resolutions between 640x48 to 1920x1080 all w=
ork.
>=20
> Do you agree? Or am I missing something?

I was referring to your comment
" Side note, that code comment "Use clk src 1 for DSI " is wrong ...it shou=
ld say "DPI""

DPI always use FOUTPOSTDIV. So, clksrc=3D0 always for RZ/G2UL.
See [1] and [2]

It is illegal clksrc=3D1(FOUT1PH0) for RZ/G2UL. You can cross check mux reg=
ister value
with RZ/G2UL.

DSI uses mux and it can take clksrc=3D0(FOUTPOSTDIV) or clksrc=3D1(FOUT1PH0=
)

[1] https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/clk/renesas/r=
9a07g043-cpg.c#L159
[2] https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/clk/renesas/r=
zg2l-cpg.c#L738

Cheers,
Biju




