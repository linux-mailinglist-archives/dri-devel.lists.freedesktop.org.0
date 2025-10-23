Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2BAC027CD
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 18:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C3310E076;
	Thu, 23 Oct 2025 16:47:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="Akg/Ica9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010054.outbound.protection.outlook.com [52.101.228.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D8810E076
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 16:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeIgM41w4Ghc38oRMyhg+QA/uXADjRMpi3GDtEpTjGJzXrFwkoeLCeLw3gYvmEuZT9g+t8QEgnvDW5DLuSD5Jr+hZS8XKT4A3C6HK8hspFjgozA849tH89/CLxk4L1AI6pqUvtBOcRJddzBFHQ7r6gWkd1hROAXtFLqQHf7MV8oDaOynP7bfCVV1d38P4cK8hGqMRzl+MoTGiz/YzQYqM8u1BuSKWGaTmMMUghW2gBFYRIuhOHTeiATNOp8u2D0FH/rB89rb1yHEZi9LAw40Jue0nnB8qsDVj0fVTbNkQe5e16XrgVrnRbNzPQi0mBT/WiQJkTYreItQ1E98Wq9dhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFbItsdMRNKtnhkgLborDD6DaCcPGZXF1Ff6iWYiyrw=;
 b=S9Xuk3sVEnH1KbpX+Schfrujpkd4EEzDpJwseQWf/Mgo5zRN50BR/xj5V40mBpOza+u98J48HNm+rR/B9kF43PCV2t3s0pF5Xm4nwPHzjNFrb+KLB7PSuL/E25EooMsg4qz3k/AAeTNYdxB2oINz36MYvuEYv6cS0LU0Z1E4InHUB2vbB7kZrCAz8mgtqsLTgRx+ZZmhVQTC/IuvcYgLZYaRDVHovn0thumaq2BPPvacURCG4rajeIFtHy1xv/eS6Vxvi890nYZc0uDi27DC3ysymGThYHeDyD35pXspSOmKFqZoF3s5Wk6ZnMWu2If4AVOzCSjpB6i/z3rJY1cTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFbItsdMRNKtnhkgLborDD6DaCcPGZXF1Ff6iWYiyrw=;
 b=Akg/Ica9Fm/uiiJ5i9xnCyEAVdV5LO/lYvdQbaKq5IheNRswNcXy9mViFaA/ig6qvkJItOaTdC3z/bSfwxIZiqWEjFvhIEaR9sv5dSNVXnqO9/no9r0wUWuQKXks/jfXZkJwPdh3of1d8Vf+xL/zl3sXB7IwOibGgx4GRHNENxY=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYCPR01MB11621.jpnprd01.prod.outlook.com (2603:1096:400:3b8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 16:47:17 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 16:47:17 +0000
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
Thread-Index: AQHcQ6/1iluAkL2rhkmyfDQl5Q3u3rTO9w4AgADrIhA=
Date: Thu, 23 Oct 2025 16:47:17 +0000
Message-ID: <OS3PR01MB8319C5F67878677D380EC53D8AF0A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
 <20251022235903.1091453-2-chris.brandt@renesas.com>
 <20251022214906.eaf123bd740ac9e396a65570@hugovil.com>
In-Reply-To: <20251022214906.eaf123bd740ac9e396a65570@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYCPR01MB11621:EE_
x-ms-office365-filtering-correlation-id: 7d76da6e-00a8-43bc-605c-08de1253d37d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xwREsFSVMWQX2MRCkqkv3FRZ4APYPk/MQANwKCBIyEa6cjx+lHXuAB1AJzFm?=
 =?us-ascii?Q?JpTFysCwATZpcuM5O0walrBqXhZD6p0yE8CDgrBc5F9ijGTsiiHN4LduDsfo?=
 =?us-ascii?Q?VyOOT6CTzeiMfPXW3c6w+e8UwkkABbIGCQgVlDlERB51pywR+8F3YpzMXyAx?=
 =?us-ascii?Q?LXVOiH+2DrIXNrAmeTOnOdXAhBQ+R8o24y5ljyZACASqdaYiXwR5RjpYF9G9?=
 =?us-ascii?Q?RajD1Xq11iRmn2psc0ywYpbLtFYh8+/dtABWKVVi0/MReHslFnCzJevsKhvU?=
 =?us-ascii?Q?WIzOq6Inh25KOr+FfdKNHTWSrIjTMivLiC2omNtZJzOueMDMe0rmHEMD+hot?=
 =?us-ascii?Q?5KC8RHBaX/1Muc7bN1dqmPSfrgmqg0S3AI99FzH+DyjP5lkFvjI/K5SrPk+O?=
 =?us-ascii?Q?tfEtaPC4sg+PTIMgt6YG3D0sr238/ZBDNFWStAcMGgEKFcPR9Vz1pv060zo5?=
 =?us-ascii?Q?+Tc7AZN0uL9VQ7WERY+J1Cbw1X9Css9hTLNrNfQ92W73paMHES+aa/Wvj8TW?=
 =?us-ascii?Q?RN1hKfZSeHb3hJzZGV4TjCrT8VwPscxDEuLyjE1HsTZJ9+xMY10DQ5TM/cEY?=
 =?us-ascii?Q?JbJfujTrUGr8ao1DZMOT49os/6uY4nX6WVJKDC8K36R8hCtpwTqlFL9K0WsM?=
 =?us-ascii?Q?2sOwc7133x922oSGs0sUc11GVFe8Oi+loOZTkOHdCLKDRhqb8dOWoFGs5ozl?=
 =?us-ascii?Q?6cREDhJck9hn+WZ8ad35/PkQSZz2/0cXjLADLAaoI0grM9Vfddib2XgYfYSR?=
 =?us-ascii?Q?6ZpOb+eQmFGHmvNwJrgPcOpQu9gOR4rt4VII8YvdMRXFmOHWzBpbuKLeIbPY?=
 =?us-ascii?Q?oSYrHwxYc+pC82hNYcBmCRbqnQeYu1Q6gU2BOk1Ycg3qfLNX3vI6GvV5/G0A?=
 =?us-ascii?Q?t1G3Jtvk6goAm6zZYEL9h7PgY6wLU6BpDPati/E8GtpzLE50Y6g78uVttMgp?=
 =?us-ascii?Q?rQOD9MlZV88ilTQzxVK1tTe+sPcoxrPanpEEB5LsrQxXawmhEURK/rWcrN3x?=
 =?us-ascii?Q?Fu9df20Gsqc16e+WX0NSNH/qY1B7UUj5uhd7Dyw08o5n+jvtTFjjJ/91KIPc?=
 =?us-ascii?Q?Vlq9Xrg6Ysp06LcVnhVx7D0xjl5a9UgYGCjMEIg9N8OiKSQQppSlg8rUCQA6?=
 =?us-ascii?Q?cfcphGM/45s9kME85R3WUtzN5xyi1j4ke/AJ3UtqqSXPdsqOCX6lc1ewLL+1?=
 =?us-ascii?Q?qLr9x1q+hWjHyg+sa7Vl+Je7SX2PJz0sXLSwP5Hf32OQI2mV96ufIpIFUKQF?=
 =?us-ascii?Q?9YHoxf70y9K4FMx7EFa77GUX9jXIV//LyNBYgFNzcyrrK9gMtlmO2kLqPZUm?=
 =?us-ascii?Q?CxwI1R3kty9/mHYpbZ04FIiV+2bgjR/OoaWrMUZKvHJ8udP5yrwkpQ2P1btg?=
 =?us-ascii?Q?7jAjT1+p7PdYPNKvg/vMA4gk9VhEhJ/n/5Ye+tFxAzo7aG15ONuP6Sf3/hoo?=
 =?us-ascii?Q?IOruoUWv/5sNEG3nbcEFK/AAAnbOpKcQPxkWBn0mjK+bpzXoybVKrrZCVvG6?=
 =?us-ascii?Q?y1P+iXOWNh33o21OVit61qwUrm9v1FDKWUB7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k/a6P5bj5O2CAE0tYX1IL6b5c8w3vuOAYit3XdKciiuhDcLIl/dUWTYhSaAw?=
 =?us-ascii?Q?CJHtnmmvdcZ1lpyVT3keKBNtd72zP1Zs7Dol0gHxEUdvfzqbHX16NrO8384Q?=
 =?us-ascii?Q?prR0A4qQYeafD8t3unSgdfgHLbYRGt72g4IReJCeVRWyK+kqxgkJT6jb4ZDD?=
 =?us-ascii?Q?p8wa2TH3X6aKhR+uLAtYA0AWCXV9t9o0DDGz/jB1EQYjThCIb/9qd3tW+FQ/?=
 =?us-ascii?Q?CZgpcziTQemIhbGmC8QMzpfJMKxBLOIykhSoocs6pu4TKN/COjprSs+SX7SY?=
 =?us-ascii?Q?D5baUcXr57kK3kjloHqaJhtH6O6xfjN/ov3bj++X2hscqUdQB2fzUtFhv4LZ?=
 =?us-ascii?Q?SnhSi2PYobm32umNFCgFMhvguqgQSPKZm0eEyKJU+L9JsDdGqq+9cVEHEK/k?=
 =?us-ascii?Q?dNYoslv0R3mNfWUgbsac6cA6R0NwYR5DyOjRl4lWWdEjrqjokNtSk8dMl98K?=
 =?us-ascii?Q?Yjcjop3IZQuObX7tV8idb7GthMk3jn8pHjUNYmIh8D9iGhOJxzUJGV8LmKOp?=
 =?us-ascii?Q?9GRl5Yx7PVOIu+vA74+cGZK1DCWgDi1/yIqhHUP17soAhc3Ms9iTNT1erWlg?=
 =?us-ascii?Q?HjN7MQMq19FeLe1zDpY9FT8bgCHJfoIaQSBG+Shw4CmYkDSU+Z6x7ztplGND?=
 =?us-ascii?Q?St/NELLFOtK6FBHp8hS1fGB5mcWn+oRhpv1m0WXpDm5ZvN1ElwAlgqLgQY0x?=
 =?us-ascii?Q?5iITPB921nUf1DrcWAT7hnAz0BWyMvZJPPb8BGpFw1Jwz9yl2r2jyG/iaOH3?=
 =?us-ascii?Q?Z7BMSemzzv7c9n7T6QyOASPjJbsm4soM6SRL0ikcbuF1ZhSMkGR6u8QbghxB?=
 =?us-ascii?Q?nBTCeiXYk5oqCKug04zyS6p8KKnbb1vsvEdiZZAjkQBrZw2+xUlC6GIQhpvd?=
 =?us-ascii?Q?6Q090/Z3bOxLsOTP6r+Oybgn1Oss78M9/xByCCleBingdrS0JH6Wu3LGa15K?=
 =?us-ascii?Q?elOc76fpCPK5Ir+2BhbuNML9paudLVnHNLK7UYHZxjdef2N3GutB1+WpXeIC?=
 =?us-ascii?Q?PirU3Q35WEIvKXz4GZGukavM3SCuUiPli8fZ4ZUrpryuPrMyszF7at9AsSRb?=
 =?us-ascii?Q?bRg5P3V86DPOjwk7icaMu+9FQSBHXwXNh2/fy9p6XzJnwxLnAF+ttXJ8pDAI?=
 =?us-ascii?Q?csEXMrIPkWqNzX3sssUkyWM/jvjIjH00BgLsE/mw8Ga/1o18/WBPTdRbJRxD?=
 =?us-ascii?Q?twkxHmeUVBKmxpQ+2iHsS8nzeu+aDum9wh9URB0woij/2noJL7Y94+RV7454?=
 =?us-ascii?Q?dsxb8qf0qfgwQ5dKZlKii6Y1a3Yjev/gVAxPTH9TGpzxGm93jAcvkBdptGoU?=
 =?us-ascii?Q?HbBLIbFthubrSAuNcJPuM0kZoBMB81H5WzRIgOexngT1v9O+AjsQec01sLti?=
 =?us-ascii?Q?iHHMENU2UlGqkD4htBag8UvIGl2EYbwWe/rK7LwsXZ9SHzEOR5p3Aj50lxmA?=
 =?us-ascii?Q?Dbd5/l0OI/xdvQRuJf2mDpbXy1m+iJ520c6ZA/k4uL8y67p6BWGCFJJL35Yr?=
 =?us-ascii?Q?4tD2cGE8zlAC5w5r7zy1aMpE8pPxCz+QPinPt/Go5GAp6IuWfXWFVVOQR+X6?=
 =?us-ascii?Q?D21QVyubvaucF6sXXO3F4A6WzRa/ZWcK18EIrSGy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d76da6e-00a8-43bc-605c-08de1253d37d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 16:47:17.2843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBUf7H7adx8FZh83qs0Ov4AbsQrtlwMAOnAzUwWrSAVrqcweemfjS0KflPVSsu3PXiap9jsivs1PJ2M7dWQyFWSync3VzAZDsIZJHo+P9+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11621
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

On Wed, Oct 22, 2025 9:49 PM, Hugo Villeneuve wrote:

> > +	for (params->pl5_postdiv1 =3D PLL5_POSTDIV_MIN;
> > +	     params->pl5_postdiv1 < PLL5_POSTDIV_MAX + 1;
>
> I think it would be easier to read/understand like this:
>     params->pl5_postdiv1 <=3D PLL5_POSTDIV_MAX;
>
> > +	     params->pl5_postdiv1++) {
> > +		for (params->pl5_postdiv2 =3D PLL5_POSTDIV_MIN;
> > +		     params->pl5_postdiv2 < PLL5_POSTDIV_MAX + 1;
>
> Ditto

OK. I can agree with that.


> > +				params->pl5_fracin =3D div_u64(((u64)
> > +						     (foutvco_rate * params->pl5_refdiv) %
> > +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
> > +
> > +				params->pl5_fracin =3D div_u64((u64)
> > +						     ((foutvco_rate * params->pl5_refdiv) %
> > +						     (EXTAL_FREQ_IN_MEGA_HZ * MEGA)) << 24,
> > +						     EXTAL_FREQ_IN_MEGA_HZ * MEGA);
>
> Remove second identical block?

Wow! How did that get in there????

Thanks !

I'll wait a little to see if there are any other comments, then I'll send V=
4


Chris
