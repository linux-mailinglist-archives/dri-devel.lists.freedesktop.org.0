Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF096B337
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6336710E6A9;
	Wed,  4 Sep 2024 07:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Up2hICz8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E394510E6A9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 07:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvQEgb/5E79sJLDNj7T6oQZSUvSumJOTXaWILliLE8QptFubxa2SB+qoDS5E31xP3QcV5RqOohPCw2LrCIJ4B2C2ufIwuST2nsOVJyYvgeluPrw2OhDAdAMf/EHbGEGSAsj3Ih1tF2n8bDKDUxgjsQmd/fztyxa+IQe+zenls779ncs41CKmIhjWCHVIb5kx3FjOkmSul3O0MwRh6Ksw3qh7gF+6y44pJMJI4mjbE2pCnK3zH8P811M1ius9QIg3LzBFvPp8iIOC4+HTlrhSI3s2wbhW2CTNDvb4+8VqN+6l7n63dPEgUP4aDNglSf/rzV04Q5rGIj0R9fmYQzQbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7L0rEXKA4wk2784oNx0F+s2n37dHeh19QmY3B3c2sY=;
 b=c0yYoArYda26MWLhTazQaf+Cy4oQtMM1Z8+A83B9NTqSKyXRSn9/CEvLxf6M6d4ff41cquK++XZ9emN85QI+aA5qCW5NgBQJKwcAMSSGH7h0LNfjiH4WimkTnxOLOBvUUfGwePh2ciL84g3U1Y7JXS+UBIU9YVntB9gt5QumspqehSs0B5vTzffO7PlSWQL8wiAJ69w0U6k6feboti7V8lt7eXxYu2AJS2YSJDfhZ6jrRhwjr49PJnBNQTPKUitATx+Pos0u5+stlIe9DPMJx7K9jSMlzk2BD2TKtmeItCItTn2RVp44n4mNpY81BUA8+bjdHwS0uEBki10/iDFtJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gehealthcare.com; dmarc=pass action=none
 header.from=gehealthcare.com; dkim=pass header.d=gehealthcare.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7L0rEXKA4wk2784oNx0F+s2n37dHeh19QmY3B3c2sY=;
 b=Up2hICz8LNNEqhKPLpk0zcfD/auBxkqSEBoXFWrwVEIvm0QxH6FkB4PSOlaZ/4j8EH4FSx0rtjuY+eqTBiZkxIxxpJx7Uya6cRSuCdzXkiuXWIBerodYvEm5sP8VVAjmgP6Ote3RwzGOESMg9P3dNWlmTT6GkJD16zSRaurVsfOSckNMmVap8HNaf8shqfJby0tfTmyxnR6UWz4Gngt9EnVzKHI0vsC77CnghNaHn9s04l+hJi4CgWJC1O4Fkf9LkBWGLfK2hxC2Hou9Vdyfw99AfocacNwjT5lSgwBJV/Er1WrTL958SHKIx/VAOyvuNTG+GIak+Wu6d8fI7yo8IA==
Received: from PH0PR22MB3884.namprd22.prod.outlook.com (2603:10b6:510:2a1::22)
 by SA1PR22MB4722.namprd22.prod.outlook.com (2603:10b6:806:3cf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Wed, 4 Sep
 2024 07:47:15 +0000
Received: from PH0PR22MB3884.namprd22.prod.outlook.com
 ([fe80::d41a:c85c:91fb:d6a4]) by PH0PR22MB3884.namprd22.prod.outlook.com
 ([fe80::d41a:c85c:91fb:d6a4%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 07:47:14 +0000
From: "Pu, Hui" <Hui.Pu@gehealthcare.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Sasha Levin
 <sashal@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, "Wang, Huan Kitty"
 <HuanWang@gehealthcare.com>, "Wang, Tao1" <taowang@gehealthcare.com>,
 "sebastian.reichel@collabora.com" <sebastian.reichel@collabora.com>, "Ray,
 Ian" <ian.ray@gehealthcare.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm: imx: ipuv3-plane: fix HDMI cannot work for odd
 screen resolutions
Thread-Topic: [PATCH] drm: imx: ipuv3-plane: fix HDMI cannot work for odd
 screen resolutions
Thread-Index: AQHa/nQ6EpgruDDrAUGt+3bjowYOHrJHKG2AgAAXlbA=
Date: Wed, 4 Sep 2024 07:47:14 +0000
Message-ID: <PH0PR22MB388419B45F79DD56CB334B58E19C2@PH0PR22MB3884.namprd22.prod.outlook.com>
References: <20240904024315.120-1-hui.pu@gehealthcare.com>
 <2024090452-canola-unwoven-1c6c@gregkh>
In-Reply-To: <2024090452-canola-unwoven-1c6c@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gehealthcare.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3884:EE_|SA1PR22MB4722:EE_
x-ms-office365-filtering-correlation-id: ec83aba7-ca47-414f-6132-08dcccb5caec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?LuwQ7WVXBGWtAu1HAE5N6Di51/ju0z5nyuPJfgeQmsqSziRMfBFC4uWwy31F?=
 =?us-ascii?Q?aGNbO7ZNoqlf4+ZVILGYSDsUcvCwUQiVrzZEqDRIa8DUsqyjWoRcuSjZyC1e?=
 =?us-ascii?Q?4rIAHREx5R9xK8PNp9XBejiMlz0PLq6VYjbaP4Dzm/WfDEAOWqlfLcnYAcvH?=
 =?us-ascii?Q?LFz5nxAoeGVgjW5rdKmUfcnlSRdHe9UuSP9EnKdx9kxofdpMU/oP9YlUKvTn?=
 =?us-ascii?Q?q7Nba/8iq8BIfv+6ZMojvX0kOayIlz7CTL/HBe5AWurEFz1Feo8byxEf+zof?=
 =?us-ascii?Q?J8rNY8IAB9Xt32pVOmNLbHCmXPSPPycSMbtn+6ro+HkLjVKjahmYa3omifnT?=
 =?us-ascii?Q?QioWTpJFX6crlwtGeD3Wxy+QXjrRW+V9ljbrlfz3piFom9uEoPOl/eersQGv?=
 =?us-ascii?Q?y/vRKQd1PGGJOi9e+0tOLxC96tjkkNFG3xS6rK2DcEoc4ZM75nVIuCaKCqlL?=
 =?us-ascii?Q?uNrl0jQ+ozWMxmXD/VuO36Z/AKk+/xBCs+vTYxTlLUMXB4Wkk+Q3kdKOYhwe?=
 =?us-ascii?Q?M6EXwYW2eWpTZO1hND9+H0VBlJMD/VjbpMJwUXubmu31t3wzROJBUXaxvxjL?=
 =?us-ascii?Q?AL8Q2l1ZhTbXQkujxa0W14RLtICXvS1nrrsD65Z6eYTwyQ12w+uy9ht30fre?=
 =?us-ascii?Q?xbSIWAeDjvc6K+C5JnyEIqLrKT9+7GwmKeCm/L0W7Z1Nl68iNacKViFcwcpc?=
 =?us-ascii?Q?WEdoR/dSK3W31szmbKxg7RxTPlc9Wh+8btnMnOQbjEbZGCxoClaow6uHYDLu?=
 =?us-ascii?Q?ZLJHFs0ZsRXXRV/dVJW1CYAKjeqm0V4aDvVP3kvey+o7BA1PttJ6kyr9YNnt?=
 =?us-ascii?Q?yx1bZzg6HTLzYerl45WXF16F/B2f35xL82Xy9+IG+6YBOzQ6JJV6vQxJzspo?=
 =?us-ascii?Q?AOSyAevEZ9ukxjbvG+pGiPYx4t/xLa44P3Qj9xmyZQWO4A1/O6oE4CTxdgNK?=
 =?us-ascii?Q?8zOkrb+ehBin0C4ZS+AK5B7wOJQdmvW0jM7QWjOLVs61W/KXGjCZMB0kZIE/?=
 =?us-ascii?Q?CYlYyYIm01J+gPmvVVKtF43x3k6JbnRHnh6lW5q7Vxw5BLhO7FPxkjt3coOD?=
 =?us-ascii?Q?KExWUqg1Jm9aT0ujC86XfmRPrewwrtE6DCwYtyeAbWMmuVekW0W9f668dNWd?=
 =?us-ascii?Q?tFQI1as5JW1Eky6MbWJdnKyIekEWF3G3+A+k2tegvilsus02HKmoltJvmgeV?=
 =?us-ascii?Q?Z183dXpEYJZrKvjngB/hfsQ1tk2RgTIl3sIQGjoIFsokJXq5iJ5lL4q8zP1Q?=
 =?us-ascii?Q?mys2w/DUv1rw401+Hd22kg2cGDtxXaCh8eLuY5NXClIIyVOLj6eAa+GqEmam?=
 =?us-ascii?Q?o2fBnU+CCAuiyRBAeAUpkVKIHTfz55LGWYlqqNXPc8fp4/a0FiTy5A3wB2XF?=
 =?us-ascii?Q?wl8jLH0xL7Helf4UsKjFOCkRK3fO+5IAcbuIIsg2RRrvpxVIRg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3884.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fIgz5awNX27Qp9MJqlRzkyP6h5Ix5a+sX6FBJXbhgHNe2mbCDSzrXe9r4Sw5?=
 =?us-ascii?Q?GalwrQBznmfGTnVB0L88vGFmTmk13ISQMuVQ+wQkvU1j2JNbBkVO6p8LSpbE?=
 =?us-ascii?Q?yudXVxQ6sAAu6UqU50uwXkK+ZaWt3E7L5yIqlgE/JtrIwV69D/8iBap3rcY9?=
 =?us-ascii?Q?fCwTqAOE8HN8oZBE7U0FOsYwfHfFDNBNQFKdZlQcbFw/vHmLy818rKPtlYPz?=
 =?us-ascii?Q?Gck4pufuJ2PbFgqFQyKkNGlOQ4Q39BtdKDVGTmuEuLODhwvNVtL/a1LGsKTi?=
 =?us-ascii?Q?KnpIvDCvmV4fAF4JTVrMx6vajxRsyfUh6G9pZDhviUgWPZwQ5waSLbu/GHcK?=
 =?us-ascii?Q?1pNfJ+k30XIYb+lBWjzMAGCjsUA3XHKb/CNk+npr4SzoWoS/GWs7F2CoxUlV?=
 =?us-ascii?Q?sRkFpc1m5nnZuvavHVmAWtieq5vnMI64txOAaSpVQoH4PvOISk3wcGEq5Otj?=
 =?us-ascii?Q?hhQmj7b7GHbKuQN3IMuMGOJNaPIwXt71RgyQbLCKamCmNrNrz5Q6dbl6fHYD?=
 =?us-ascii?Q?McqA9nPUfL7vd02OsETrGjPg63g2aywZh2p73kmU2dez+QCRzZAhai8LJ1JX?=
 =?us-ascii?Q?8HY7PMLbmDuU6C4w4aUfE8uzOrpzz3KQn1D5ZOQcVSUP9qZ8jJyGunbGzuGs?=
 =?us-ascii?Q?zoVXAOS0lXe0NCiQQMB1gqoqFWDPJ2fY9X6qicz5c+yfVLEwIB0akYNykt+D?=
 =?us-ascii?Q?fPGj1l81x1t41gz+vJaPxqzouTx0wYdumSadRDUjV4OErQnXTeRXBiNuv1IU?=
 =?us-ascii?Q?e6gBgJw3r6ePMuuYG9arcu6QIsPlPAhBzyjVeU86dJcolOflnQ4Xhu++ssMv?=
 =?us-ascii?Q?7u41GuSZqPL+06xWn26oYi/vJBH2HIxZ3Ne4oHUy172Y7jjI9knivGvRpKHh?=
 =?us-ascii?Q?xen+8NfIceZPbEYSAiFdYFin2J+5BcfftLRLGDKwee2JMZ6RXvjuw18COxAJ?=
 =?us-ascii?Q?D2tkjjEeJugz/qzPvI5rR5O+SF5kb03qnNnsSnq0kX5EdRLYcYLlxPdyQvLT?=
 =?us-ascii?Q?ZCl0ZsXsZx31Nl0x7EM7Th4iMRH4+ijJYTZBrcKHv86lDInOnAff8PD1klkJ?=
 =?us-ascii?Q?LKQR78Fx45r+61n0vwGoABOgC5K6mdY+bKL/vsKCN5Kn/7Xt7ljmc1W7QrHV?=
 =?us-ascii?Q?YsVIkhoHLwamQT9FZGNUyjiK1CLNtdCJNCwQ9UNAt7VGUnk9EQnCvNNXMTwR?=
 =?us-ascii?Q?vrcZpYo/ZfVMUG6/VgS0B46vd8sD1UIA0RfAPlyBdJCEkpl675x3LKdkP4Tt?=
 =?us-ascii?Q?MG+x4wmXuUaXfRIUj2h/d1pPmB+BC2MkMHq9AaAUMLj4wYZm/atj7kWhuFW0?=
 =?us-ascii?Q?Xuke2WC8BWgPDBoHDpNQ4EQDAgcnPC8xshcqjxGEsw3j+uA6Bcut/ItZUAJ1?=
 =?us-ascii?Q?usIrOkppYbyqsAarQ1Tu2kZARQgIzsohWnVUdoxndspakRGl0HhJzvCKbD9C?=
 =?us-ascii?Q?XL6DvUlqAs8VUfzQecq6kUqKpyD+tWAsLm9mt1snJnhviHtRFBMn398oQfGy?=
 =?us-ascii?Q?A6sfOcChexosrCgnWojwd0i8L6xPQknmSjUEaKfpKqhySdfc47ip4nPvHUqC?=
 =?us-ascii?Q?/WJzYzAy0yJFABIpkq2c7YbtJSJjI2WbAfS3hgjPQiMVhji7iq5fFONzuhky?=
 =?us-ascii?Q?Dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3884.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec83aba7-ca47-414f-6132-08dcccb5caec
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 07:47:14.5176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4GG3hX6v1WqV6DWmfwySEBV/+K3F0G0JGV0P3tC4JNkeCg2ixZVBe2YIhyhb2lrRzMGAQeM3wUd5P4luEnGGbTFgJU53XppGIPxpJ/CcBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB4722
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

> On Wed, Sep 04, 2024 at 05:43:15AM +0300, Paul Pu wrote:
> > This changes the judgement of if needing to round up the width or not,
> > from using the `dp_flow` to the plane's type.
> >
> > The `dp_flow` can be -22(-EINVAL) even the plane is a PRIMARY one.
> > See `client_reg[]` in `ipu-common.c`.
> >
> > [    0.605141] [drm:ipu_plane_init] channel 28, dp flow -22,
> possible_crtcs=3D0x0
> >
> > Per the commit message in commit: 71f9fd5bcf09, using the plane type fo=
r
> > judging if rounding up is needed is correct.
> >
> > Fixes: 71f9fd5bcf09 ("drm/imx: ipuv3-plane: Fix overlay plane width")
>=20
> That id is not in Linus's tree :(

Thank you, I got it.

>=20
> > Cc: stable@vger.kernel.org
> >
> > Signed-off-by: Paul Pu <hui.pu@gehealthcare.com>
>=20
> No need for the blank line before this.

OK.

>=20
> thanks,
>=20
> greg k-h
