Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD9BC16451
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:46:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CF710E076;
	Tue, 28 Oct 2025 17:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="J1YlVcY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F1310E076
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 17:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oG/AoBv90nsDHTyCQPFRLmhl1414k2PyddrbivJ/0K9Dzf3bU+ZhIlQZKpRX1oSy70qitlRunnv3vTwXliGMXFETUrslQqC0T4A24bDrtUSzTgs3cBoUBSQifDLoe9A2TZS4gpa2EjoxTDJQIdeQ3jHeZty1rKk7HkXj3w0C0jOdm5ZgYDeSLKFbqn2jo47VIk2oESzDLQfY32u0aRGMaHHJ88xONCAxt0rVB+6lhnVxJy0qgVzSh96951C5xkk+KXmxlnuCr58/IoQtrcbe7y6rRreG/M7ujk5Evbpo0zsOdNfE21NtGbUeZ5N1TkF9igWX3I7GzNt40+l1JWHl0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkDnp7Zzu1KOokeVxTU2K+VjkSHJrJ3WkyYJE904uAE=;
 b=q9FBVfcdpG0vDcB46knMheBGMeVOU1R5ADhA8KDqdIWubQo+MoRGQV7KlgIFMWoDWu7xHfEJy30yZnQR9S66KNG5SpqZyN/cYtwcx93S58EVC/8A7TOt97G6wdtU4VdOt6390jjK8QyynU7ng7+e1tKbHKpNcKg9BVEPd4vBzsG5ulHagt+rqRTk4Jzj2yry2DDaLyZQB+WpWwFHTxcihEgWig36HBNEvah9ganRoxq5Sg+5Mad8hjbmdjbAOpV3J4wfMT8X1miBgJBhDFx4l+x0DV57X+5boP/JvgbwveWwsXig/4xEu+770kcFukSas2uiBjkYEhilm/RxJg5pbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkDnp7Zzu1KOokeVxTU2K+VjkSHJrJ3WkyYJE904uAE=;
 b=J1YlVcY6V2e1zppjOBXV9L5W7at2KV5t2nsd9q+SHxpPg0/CLahZYyG7RVHCLWeoyoo4ki1wOHhPKG9ikNWFcS0dRRjNQCIVPf6HxrXVt0CoH2vjlRnPS8ai1l2TKPG0f+ju50QW7NKdVaNPFZN1TCzP7bAHVEBEb8wuyPn90Sg=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OS7PR01MB12130.jpnprd01.prod.outlook.com (2603:1096:604:265::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 17:45:51 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 17:45:44 +0000
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
Subject: RE: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcQ6/1iluAkL2rhkmyfDQl5Q3u3rTQDy2AgAej4YCAABg9AIAADeEQ
Date: Tue, 28 Oct 2025 17:45:44 +0000
Message-ID: <OS3PR01MB83198C16302EAAB7D2A163DC8AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
 <20251023143141.a1a274104e3704dd8680f901@hugovil.com>
 <TYCPR01MB83278181C69129D2283C7AC38AFDA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
 <20251028123848.57512e792da671b6f8f50be0@hugovil.com>
In-Reply-To: <20251028123848.57512e792da671b6f8f50be0@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OS7PR01MB12130:EE_
x-ms-office365-filtering-correlation-id: 0ef382c3-7b6a-414d-2499-08de1649d1e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?f3OLXi8clTw/ZzAMQC048ksyPLXDOByzw2mtlPqS3klwL0J7qAxuYaWgxmdF?=
 =?us-ascii?Q?qYG/Lu0SKMmWW3pRWqH7WbODQBb/RrU9NwofZ7eXrQBMDG7+5reYu/4Dh5G6?=
 =?us-ascii?Q?H4YY03rIBlS410z/fLG0kgvby5J4rFndkLyV0YRtanKLKgOyLT18rCXAK7nh?=
 =?us-ascii?Q?GiJnHvDWOlcWYObJausbI6FwJpSaYRcxb0rESf2vDCDY2zaxUiRU3Av/fn8R?=
 =?us-ascii?Q?0+/Fzcijm8akllRrqaZOHGZ3RrAwUlYXAusG9n00qhbVNlBvtFY6WAzm2jsW?=
 =?us-ascii?Q?AcJXyeL6LWA5i/s+jRZHz213I3kNJeNE6y4Egv/dSOkOTE+e/RqeP4sRjnRK?=
 =?us-ascii?Q?wKbc85SgMFt5irEDGCf1E3Xdkj9kcM7VokfXFjdyBdvQufDHYqEPIi6CrryP?=
 =?us-ascii?Q?wCrkzN0zfy3f8V8DmmKqmout2i6YyP2B445oLtDOC8peq+o80UqtmPA1Z/Kd?=
 =?us-ascii?Q?krj1Ak9wnNMMFKvT7IJY1hu6V5PvkN/ShJolOb4egaygdgr62d9u2whaP+cc?=
 =?us-ascii?Q?Endv9wDZ1+bVuS/QmCqufnv0qgOuQz9UsjadTPqb72683vAuKOhLZdQB9j37?=
 =?us-ascii?Q?105Gky8qpLpCjZ25ySW13HK3EhrjFA70ddTS1u2YpwHk6ZfpS6rQIDb42eRR?=
 =?us-ascii?Q?wXovfEErkkkN5pXUPd4gigUOajwqQG6JdCWRF48xgNxMoENBf0IGXOugQL2g?=
 =?us-ascii?Q?kyj/cklKotSNFyDauWEk1navXyvKSMCMyxJJQoaomnHXU4+2tLrdE9ueTXKK?=
 =?us-ascii?Q?mxMryqNwa1mMZcbBRhgYIv7GM3i9dz4KorMZGdV2TK0exyPf4DTRDxJ0rNaP?=
 =?us-ascii?Q?sHMU6w3eTLqnCuc3ZDxUmJaCE8tjDeRee2xkZc0OfIPVCpc8k2k5gfvvleL0?=
 =?us-ascii?Q?SQ9+IIskZE1b4GwiqUU3cmAnsa9TV2LmRLbyYQkEdmvs/rZ5UYA33wDojwhu?=
 =?us-ascii?Q?cuIQmYw3+oN35ueyH7Fjkucsawot8bA3Ay1mj2KeA1szuOrmKSNQKSx6SxkA?=
 =?us-ascii?Q?XgoxNhhXS6iJO2CVHokAQZUXwEyJ0PDqwJ0+DKb6x46mgJ0LfoKwhiMAbHFd?=
 =?us-ascii?Q?lqcKQ3FXAhHOH8vfKN9e8KRdTfUHbSr/wGB/YnT2n5A53rQ7vveZtnKprSwj?=
 =?us-ascii?Q?3dlI1DwO+Cbx2i23ABb6yPiIHyAFgjq5xyjRpO3Xp9r1rpvMM2oTYoFf99MU?=
 =?us-ascii?Q?YGz58dsqzDC05/6JhFQ/5AY+2loDCPaQjq2NExYSWUNu+UYPvysRHk/rfudw?=
 =?us-ascii?Q?xNMphFaQdejjuJCMM5POj2tOPvhgA9Q1xw/saPCO0u50DiXyudt3jYH/RqUC?=
 =?us-ascii?Q?Q51BpRgwZP++p+CPIAS8i1+mZTzqAv31XsihT83pOJqulelmcvbIyMNfPQfX?=
 =?us-ascii?Q?DfXqxFiCtg+13LlLbDkL3U9RhyUaUHV/iezrrbLaeGkw8CCsM9Jlp8o66GeA?=
 =?us-ascii?Q?13QrCH07lE/XDIcqOsRM9tfEnszzjz5FrbRtLYZAHsBR8djjrj8W3bLLv0U3?=
 =?us-ascii?Q?aWHDuRG7eA1O79wFZxOZ1073/SRfc4NX8oGC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sdj4qQ5Fgayeszb5WItKsSGWQF6JX7k9pPrcioL7sNSlBPv7/WU1IOi1uux4?=
 =?us-ascii?Q?AMeJkrb5t8cWrLUxmI8a+Bx4Gx1QdvSuriROQBwgJcA8wpzQusgTMvcixdSL?=
 =?us-ascii?Q?6EU2k93hzR292vqvQFEdqL4RshHrAvCUtyMKtP96oTDkCEb78uozPLnEujou?=
 =?us-ascii?Q?dKG4Mjl6DqmX5ThptGrARd4q7iUK+9/mQUqj75n7kUYSqYJrOqqrKz3xX72R?=
 =?us-ascii?Q?o9EyRPOBKusqIXZLxPTzjIi4+WkWlwDPpHzNQlCf9Ztm1kOU8uQOwduOqzTY?=
 =?us-ascii?Q?xDramxyRhDy+kE6jQIbyHvN6+P2FX2mY3ci47ub9FLV5L5IJEGQ7N7BNtyrK?=
 =?us-ascii?Q?QKlB1G1AM5wTa2XLEIEzsEcyhnYxQ/nLXKeC7tkVQqRyqqEiyUANLMZUcMf3?=
 =?us-ascii?Q?EukBsKwjXILHY1uHl1W8ah1Kc5OtUsUjY349SRhuYCRTYTrEnF9Gs2Bd+AOg?=
 =?us-ascii?Q?Gc1kJnkAZ1ktQtwdbJ47Cl1ayN7A5deio9laruMHiC13bqH9wLeo/eMxx4AZ?=
 =?us-ascii?Q?Mn5i39Raj9nQ1R1mp05HHe/awifFWE+Y0aDNVDyiQsq8akS8znFpn8HufLq8?=
 =?us-ascii?Q?RdGGs1ui5uDc3xp0LPFa2Q1MVTMBstftOuIow8WEgUBCv3PZjW9+M4eGwp1x?=
 =?us-ascii?Q?NSKLEQnYOMbW0NQBulm+RFxH7xdoE9EqnIj5QxQMhnnvSY6IVy4zNo3CSTK5?=
 =?us-ascii?Q?5ThhA1kk4u2FqzUKJpvk/3HPsu1lPCRGtMObbztrHWBYiIocU99nMPdrRarz?=
 =?us-ascii?Q?4Wryojmxv3uNJWkQXEqP/s+MDVV4iUjPWjbzsmVsLp6dtrdYJGny/pxirEIw?=
 =?us-ascii?Q?dZDAyu4g0rizEzdE8bnYW7Sj8kMXHbqlCUuH3dVUrVUv+E+uyTZ9FszIS1/R?=
 =?us-ascii?Q?dfCyuD/YSo2zxixy0y+RHgRv8LvOLeAbyLIrLwKscJG87EnUI9D8oecLcOUR?=
 =?us-ascii?Q?Kv4nOuQhu9NRib1e9K6+2MFBvAoR3rs/GnA0tLXzwAOSN+xQHk7aeH4l7pML?=
 =?us-ascii?Q?VKTWRWVqR8bibxv6PhgmCgaZ58XzHvyNcsOKWuYwvE53R5CQt85+Km3naXOh?=
 =?us-ascii?Q?bgGfFabKjwPmlGy52avpYNj7s250sVXUsb1EDxnYg2e+q4SFtyknYarwm3NO?=
 =?us-ascii?Q?FYVDHEkpzdhGubmwDNsPYI9uqGsbpyXh/FlhzF2XwFFED9IvrdDX3lzQoTUd?=
 =?us-ascii?Q?+i96UEsvnXdeCwKDPR9g4Dlm4QveoZQXf5Ezdrbx7VyPudZcs7NJ2AON8m1D?=
 =?us-ascii?Q?qapGt/8+DOebeVPWp4nPVAbzOxFvDKrTTckpmAkXqWfi5nik64MpvxBYh+c2?=
 =?us-ascii?Q?bPEAPI7L1eH9IbCiIYM1crUfP9JXrx3yqsyT/MUgmooM/Bjq0YulH0h7UnxB?=
 =?us-ascii?Q?EBDfzzOskXMC2600ke7d0Dv10Shj2pxDEIZv8jsO6HK1Nzip1Vwbx4UKnxi+?=
 =?us-ascii?Q?J1R9Db2HzkFTsrWwNouVZv+IrqgTQtP3Wy7r6DAAJMXn4SOm2DnyjGJ6ye9i?=
 =?us-ascii?Q?1Y8OWgeGuaWkhLL0iGDIBpwdWOMeLdFy8l+R/wfiyOZ8PPsnqbWfKW9Nliy4?=
 =?us-ascii?Q?3Wa2K0a8w/1szxd+CkENJgG8Y2FVsrYZ9sLqm3VT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ef382c3-7b6a-414d-2499-08de1649d1e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 17:45:44.2833 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhMiL9BfrnBE8lLYN0a8gwqauUthYXyT7ADmaNZqnP8v0LGn6orNABTxDYts6K/2cP1yRMFqPy59F/3QkIXsPo0Pp0/9mDpYrLYCK4xRuqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12130
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

On Tue, Oct 28, 2025 12:39 PM, Hugo Villeneuve wrote:

> > > If we arrive at this point, it seems that these values:
> > >     priv->mux_dsi_div_params.dsi_div_a
> > >     priv->mux_dsi_div_params.dsi_div_b
> > >
> > > were not initialised by the previous loop. Is this expected? If yes, =
maybe a comment would help?
>
> So are the uninitialised values valid at all?

Actually, after some more testing......I remember what I did.

The PLL5 needs to support both the MIPI-DSI and DPI (Parallel) use cases.

But, since the execution paths are different in the kernel for MIPI vs DPI,=
 I needed to make the default settings for DPI
knowing that if MIPI-DSI was used, they would get overwritten (hence the ne=
w API was introduced)

However, current defaults today in the driver are illegal for DPI, even tho=
ugh they clearly work in real life on all the RZ/G2UL boards.
	priv->mux_dsi_div_params.clksrc =3D 1; /* Use clk src 1 for DSI */
	priv->mux_dsi_div_params.dsi_div_a =3D 1; /* Divided by 2 */
	priv->mux_dsi_div_params.dsi_div_b =3D 2; /* Divided by 3 */

Side note, that code comment "Use clk src 1 for DSI " is wrong ...it should=
 say "DPI"

So what we have today works fine, but technically does not match the hardwa=
re manual for the DPI case.
I need to change the code around for the DPI case and test again to make su=
re nothing breaks.

Ugh!

> > dev_warn(priv->dev, "Failed to calculate exact PLL5 settings\n");
>
> Similar to my comment above, would it be a good idea to add something lik=
e "Failed to calculate exact PLL5 settings, using defaults\n" ?

I can agree to that.
I'll change the message.

Chris
