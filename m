Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10352C16901
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E5110E07C;
	Tue, 28 Oct 2025 19:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WWU/+yxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD63D10E07C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 19:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=araGgB/ontp8g+1314ydYuDBCQROuOqn/cOj9lOg5d9hVWWY+KzEgHLfp/EavEYz3vwYgRe3KpiSqTVNo+P+sulYHFjwN6yHPjyzp3WqPL8T9VzTV89AK+tgurHcgDwiYB3MnkPoRDkDxJKAkv6bTyWXRYPB5ri4EM5Br1PwPcJojy5bO5u9gtaJR9xzVCQ2t3jdIf6whBAcQZdtHdp8xLJp3D+A+mB63aFIIDYEoSBYH5JTMloTLvSHlrVg2i69EvFBlhw5YBNJCs4FYrm/CHyPkPE4FDISNyTNQRKHYNPcaIcKNhyl4Gckb+qsDU9UGGaxwgDt4NkrIiCjxiJZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTuwpk8ja9eIQ3TLAfXw726VTmXabfYZpXN3s2tODQE=;
 b=y/wL30kGbhbcXFXjvbDQTlU9XMhBcy73W5s9Nr3ArZxom948qrmBxUdBfuy/b6BvnASpktpT6DqwQ1zjcoju8GkX2k5k9wZ4YjGLiK2tS/htqlpSSd/ukm0SH3Tp/h1KHn7vPTBgvgxZPPh1ad0BHuLN3gnhSQc0AILTzLoaXr3p59FZHdE1IxtOfNvHzXvmS0XyI1ioEaQgL3W0lafTBQUaGiXlhae5JDJGZ1KQrebpb14SOtcpdc3liVXX8HV41agF5yNx/znkxVITpwTOZNHj55/qBkAvucr6W4tfi0unkunmyq9Lb4gFubBYQuukeKRBNi8vGYhckPkwEhgxsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTuwpk8ja9eIQ3TLAfXw726VTmXabfYZpXN3s2tODQE=;
 b=WWU/+yxtwQ+vnXflV0tENQoXtcj1qLkGesRecWqlNsCezed4yEp/svxTVfFPQsb4z4DHluhYGZPwnuEqC8XeUc3YIrqEE68daBMqgTWjyJ8fHw0SyKfxjKZJGunnFzlA04nT0/LSms0Fc2FPLQxojjA8M4TsmGgmjOkvdRT539c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12805.jpnprd01.prod.outlook.com (2603:1096:405:1b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 19:06:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 19:06:31 +0000
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
Thread-Index: AQHcQ6/1Ivscv3eD0kOXKb/C6I0GV7TQDy2AgAe2Q4CAAAXbAIAAErMAgAAVY3A=
Date: Tue, 28 Oct 2025 19:06:30 +0000
Message-ID: <TY3PR01MB11346376337E4C12C677446C986FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
 <20251023143141.a1a274104e3704dd8680f901@hugovil.com>
 <TYCPR01MB83278181C69129D2283C7AC38AFDA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
 <20251028123848.57512e792da671b6f8f50be0@hugovil.com>
 <OS3PR01MB83198C16302EAAB7D2A163DC8AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB83198C16302EAAB7D2A163DC8AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12805:EE_
x-ms-office365-filtering-correlation-id: a65e212b-64c9-45ca-a1e5-08de16551aae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?C0rMR6COv1peM4wdpVm5Pa7S8RdxADNGZtrdAyOVNBharD7DTQtY/5YqYx6C?=
 =?us-ascii?Q?LP3Z5Zti7vKFsLeawXhsHPC0I0/qeX0UKqiSKPYs6tPnUVce5STy+NJBKZNW?=
 =?us-ascii?Q?+g/0/UUaAcxhVrq5cXt0DW6JzAcNX7ZeSVqxWw8IbLUJyVZsl9R8Xm8dh3r3?=
 =?us-ascii?Q?tVP29f4BkUYoYGEpi2j8KXcdjHSlZDclrcdpnP8w0DT9IlR7jLGI8FgRGuZU?=
 =?us-ascii?Q?R8vIuLjOTLqyl5sB2tJbDoBReBzgZskkdpMw30yW6jDZzCZfz5dryTazNELr?=
 =?us-ascii?Q?D1anZTjGfXFLtVSklHVN3QVI7nZAFbDTIhpuH/Szt2OQy6mXC2y4wBoarFTS?=
 =?us-ascii?Q?YJWVvIKvgnok+i+ImwWK6v24RcZf2bq4TqM1ftc4aBK8342fVohDF5gx4Zf+?=
 =?us-ascii?Q?r5+a2gBrHI3lqac03VwkxZ5LaHbpDQPCUXPqhJQLTLoQBBwR0dszQ0DJSDhC?=
 =?us-ascii?Q?f8fbGZ2lbkmRTRBeT8TBBwXN0RVSEjS8hm6yu0VOfMcQ880It92iZGdRX8vk?=
 =?us-ascii?Q?zzAms8NhqQ9gtUctAJ4Q52DvejeWL+WL2jub3cInbKE8R3NfoqiH5SrA++1w?=
 =?us-ascii?Q?SUvdV6UGqSKtK0ZzLdreGt7X9DHBuL1eexKdJ34pISTQ67qUHaEJlgmKRFrx?=
 =?us-ascii?Q?bdXzDm5Ksv4NL+cRLgXu5D2qwaTBQ8MBOak5yLggP7qtrQFo9gs1TkhZpFox?=
 =?us-ascii?Q?yZ18EzWT1UHfCT8a3nNc2Mr7rVkLWOyF79wv7IWIxgGRTvdQ2RoUZ77VYRPU?=
 =?us-ascii?Q?M7/C1uxD3rdmwSGUMFMiPkBgBMfE5kA0VBz+f6fPW8k3y8PYxTQfa7rAUIsZ?=
 =?us-ascii?Q?4BgwleyqXICQtLgPmMvAEAXMqUVPRk/EGMJMKGvjaxe9VfwBtIc70x/3oatI?=
 =?us-ascii?Q?W76IUvIu205Ww6LT36p+4S8/g7ZrVMbi5q8/bd0WgHnfK2Ecdc7GRUISKetJ?=
 =?us-ascii?Q?dLsyTluByEYaM2iXm+P60KmSn6QHm1/3vQUwH5Qw3Li+kph2H043JH3mIZ/Q?=
 =?us-ascii?Q?9IdEhuCHWUpGuJ7pQ1/SJDXfSG+lBS6mXi7uYepEUQO9b8P6dH0uFoI+0MG/?=
 =?us-ascii?Q?LRenRxOrWxiKl6AKpCho9xzOxJnsFPzOM7orqezyF/O7UxM5rI25R+pyFWtp?=
 =?us-ascii?Q?0R9DR/PRk0KtpzrO69U2sV4lwjSRhS2mtMBvH9uvRFP76Isk4XS7ERGiW47b?=
 =?us-ascii?Q?A0MTc/LLbzDaWP3cZUgB3+AFtgXEWBJi6IBIMnStXnq1YTSDtZ6TkA1IpjZm?=
 =?us-ascii?Q?VmLxFtWTLZuB/uvXS0s6gxfnNc0Li/H7hRGm89a4JdMYvE/z/4Re9xM2+mxM?=
 =?us-ascii?Q?JjY/Bw5ZleQcGuoHtuNB/IqFzJ1pa2rTJE6oio4XRLTIk+8Gwf+6NYEfSdga?=
 =?us-ascii?Q?evCgWs1m3D2zjag60xGuFnNqzefspDSPyhRtlYefS2lqU6BOHwtGE4VA/Cha?=
 =?us-ascii?Q?nsP8jyt5iN6AjAEFO/HL9z/9uQVkgtDJsbRvjIJytCya+tYIWZ+n8w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?awZaW6NaolTwdSLH2Mhyln8qT8Q8YIQPbw5nycMZ381ZN5BbsaTG8H1pdWaJ?=
 =?us-ascii?Q?bFHWOsLHnPyjY6COUgL8hg5aTzPvdk0LyjRRdXhRBapI9sIWaAhbN7vWTqCr?=
 =?us-ascii?Q?yJuf5IkV9bZPBWOnsolu3grNyDwTvJLblrlqBOU/6GwUOuejxgHAvjuczujT?=
 =?us-ascii?Q?a1Uaz7cxmSIiDVMPnL6CNf3Klqpq4PBb5uaTEtk4zH4KZspCG1+4NcooYMk7?=
 =?us-ascii?Q?imCsk6fqbh9BLRjbFZ+BZKFzuJL7rgAt+D+knfaPwvgaT0sQFX9Tsi2abej4?=
 =?us-ascii?Q?qPFZdPIho7+Vbh9p7r3dK9nLTVexHCGXsK9M2UtSyHAyYPPb7Mdp9KRJrh+n?=
 =?us-ascii?Q?fsWjyukNrjIcoD8gGcApjHzu56ORDI99xL4I2Lc3gXvMRtUAWdwD+6vbFB//?=
 =?us-ascii?Q?UT4e3LqFG4SwJEJmEy21tiaotbMkaqUTi5WoH4qOe0U6CfDZqVDByqNB5keK?=
 =?us-ascii?Q?z8zGWoJ5+/h4GkTglgYZ1t6RLv8eZQ777hD4Oj2BU8TBKMIOo6aX/KFkw+s0?=
 =?us-ascii?Q?fvF4hRyVSJTour4cc5fP3IwUbY0TKwHu3LyFUTAXCIZU/KBXmBhVgtdws8oN?=
 =?us-ascii?Q?fZkC5hnYkHLFGMjGdt9T2VOY8zSeJiQJenSVfLa8Fdo1hNGuepTq4jJi3zHS?=
 =?us-ascii?Q?UYUeA/uBuvtdvPAvf5EnvqPgVoYBw853Eibiqu/dfWH935eXYd1cg2FtL2kE?=
 =?us-ascii?Q?ABf6rCiHAqzAmyyD7B0FOewsz17NJRWW1hVN7Twlofu5BGHyxO+KsR9Muyw5?=
 =?us-ascii?Q?TU3VAVHYjQHb2y7QAm/HREqR6xTjK31mv5srEHoyvv9mpUtmkbLmWmguhftk?=
 =?us-ascii?Q?lE42hUO25cHHjJWoTXz61++e6AwhhHmzQQunfx7hCQKhEFUhI6iV9eXCl4ZM?=
 =?us-ascii?Q?7d0Kxj7aNvpRNuM8BJggQ0xPrwyG0HXj3MVGzR1Dg3dfXp6qElDYbto32mOE?=
 =?us-ascii?Q?G50I+oC1FF1yUJ09QdoV367JvVaqy6V/TDzrzxQge7M6FmtXPItTNc6ccNnD?=
 =?us-ascii?Q?51hZqjO0En+q9gAWcrnjhA/Ac5OafSsIipsjqI54LxbqnuT8q3InomezPVdr?=
 =?us-ascii?Q?lix06dNwUj+w0njiMHKFbGfm4xDqqYd9ckjBOzo+m0QLGKsWftFfOeGxbF8S?=
 =?us-ascii?Q?tVfuESrr0ALSzVnaJOaETjBCgTOGYT1DRv9WZqIzAU+QjBMk9YruqL3mE5LF?=
 =?us-ascii?Q?k4Z26HzLZlMCzEppx2Ai83iyrVJV8Rsq9Ntxb4BN+UIaMbc2kyjWPHojHuh2?=
 =?us-ascii?Q?9nKKyT3bmSeNCy9fd5dJi3qrR7ihG3TlGIPke8cesxJJOoBhplICZPo00zm9?=
 =?us-ascii?Q?0+5drpT/0Q4K6tUIMk2YBt4u/Yb53ZKFXO/vvQR0WBdu8ScEwlcYppGQ9E7C?=
 =?us-ascii?Q?0a5dWJfnvZmH0SDd04yEz+vsVvNxghHTifkcvmii4kS1g6ims9EBG6AoVsmE?=
 =?us-ascii?Q?kQR/VLh4bxaZaYl+bs9H+hoHEqXJ/PX9B8pOFZAJzRohOGCM7U89SeJcKSut?=
 =?us-ascii?Q?wjHcKBjKBMKpAXTcuBwNLFzhmZe3oEldr5/awojJRehYbpttc+LSXQzogA5S?=
 =?us-ascii?Q?NURidPsVd07+rb+PiGcqbBvZS6GpubIQrhtudQoWHFoVdU4njo8n6PbmLOqG?=
 =?us-ascii?Q?EQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65e212b-64c9-45ca-a1e5-08de16551aae
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 19:06:30.8321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p2Zu56huggubOqHRC8D/LLQ9qKQsZgfbJoToKPIwyeEqc3bElTD/wcHX+cpuJ09UXRT/6/U113weWL9Legl9lnmTml5EC+HXgGMwU8naVTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12805
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
> Sent: 28 October 2025 17:46
> Subject: RE: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate re=
strictions
>=20
> Hi Hugo,
>=20
> On Tue, Oct 28, 2025 12:39 PM, Hugo Villeneuve wrote:
>=20
> > > > If we arrive at this point, it seems that these values:
> > > >     priv->mux_dsi_div_params.dsi_div_a
> > > >     priv->mux_dsi_div_params.dsi_div_b
> > > >
> > > > were not initialised by the previous loop. Is this expected? If yes=
, maybe a comment would help?
> >
> > So are the uninitialised values valid at all?
>=20
> Actually, after some more testing......I remember what I did.
>=20
> The PLL5 needs to support both the MIPI-DSI and DPI (Parallel) use cases.
>=20
> But, since the execution paths are different in the kernel for MIPI vs DP=
I, I needed to make the
> default settings for DPI knowing that if MIPI-DSI was used, they would ge=
t overwritten (hence the new
> API was introduced)
>=20
> However, current defaults today in the driver are illegal for DPI, even t=
hough they clearly work in
> real life on all the RZ/G2UL boards.
> 	priv->mux_dsi_div_params.clksrc =3D 1; /* Use clk src 1 for DSI */
> 	priv->mux_dsi_div_params.dsi_div_a =3D 1; /* Divided by 2 */
> 	priv->mux_dsi_div_params.dsi_div_b =3D 2; /* Divided by 3 */
>=20
> Side note, that code comment "Use clk src 1 for DSI " is wrong ...it shou=
ld say "DPI"

Why?=20

This is correct as per hardware manual page 283 and [1] and [2]

[1] https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/clk/renesas/r=
9a07g044-cpg.c#L142 -->RZ/G2L.

[2] https://elixir.bootlin.com/linux/v6.18-rc3/source/drivers/clk/renesas/r=
9a07g043-cpg.c#L159 -->RZ/G2UL

Cheers,
Biju
