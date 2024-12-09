Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E1F9E8D63
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 09:29:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A83410E5A1;
	Mon,  9 Dec 2024 08:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gylWFxa7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011041.outbound.protection.outlook.com [52.101.125.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A74610E5A1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 08:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NohJGl4t3R8TWe/BRxnEeH2rhcWn1G/n1tKMnpC3atq5x5jLfHHzDgDTXPBseWN/x+hIdNCG/PuLTP5RvabSerSxgNqueXU+FeCeS5RAd3Jv5RyE8NHTXZURRjMqrvseOrobTDMGCaFJbVD3eMAwQD44UHfcqe26p8HDoRa+svGQ0DRhoAdwqP97m9C6hs1jOqx2W6gY5wa0O7zKpOnb2ctFOdugEIqBg4A88OTwx1Lx9Qomj4drokM+Clz1WC4D7YOD2NPo3nYB2bp2WJmeBXYthtDcbocTM+YGja8bae+cNpkChN3FJO7RBlM9C7f1D/kjGGUuVAju3HXF/1KETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOTmSFbtEVvvAh+CN0S4oRV6xkZ03viC7LggiFLfuvc=;
 b=pVWXaYPiDrE9pFOrSVuW2CnrMQBoOrm6FO/IgIFAoSZkoy+XCLXcE11VvqI0jbBz+vMnBhWjssFG/4sjxRtO/NyXwtalLpQ3Z+wK0xLFA6nuhwVBWnIiLHFxY8Ikpd4rRaVwZQJML6FDkGYevRHJBU/ksRcDNREL243pI73Z9di8q6aaBqxeZi4OU7End1U33n1lUFeidXuz4MSepZvDqsz6WnHVKMlKaI/FvrSgYJWvVPogxnSx/XYhwBy/r3q+iInMdqD4Gy5rglLyjikeL2/hgSDWaG2Gzs1GEI1nMZXhqdGL2dyCBXt4PDPgdsCDewHO/6V7QToL+0MzJdax6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOTmSFbtEVvvAh+CN0S4oRV6xkZ03viC7LggiFLfuvc=;
 b=gylWFxa7kmqBOv4j6Mc9hbdpEHjHMHqsrVvcDVmNRRwOnqvxAPl2iDxJzRxOiaJp74yKNuyoIIN110igjDCtAL7ateKzmBRpYTaBgSO706tdi9409RTZyrjXh6bEJ71FMo9DguF8xLUKAgqD5sgMvocjwLl3+UeDKL2b+zaxUU0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6543.jpnprd01.prod.outlook.com (2603:1096:400:93::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 08:29:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.014; Mon, 9 Dec 2024
 08:29:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
Thread-Topic: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
Thread-Index: AQHbOrMYVkaJgo344UuWkeUl3s1BnLLds1nw
Date: Mon, 9 Dec 2024 08:29:40 +0000
Message-ID: <TY3PR01MB11346BF6C74FF1E5014F1E9DF863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6543:EE_
x-ms-office365-filtering-correlation-id: 6584ed05-5459-456a-d187-08dd182b9ff9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pgv6Km2vOeIZVoqcKSMIRIBxxcBc7fVzAw3nVUbFH/rh1LOOzuo6BN3lVm1R?=
 =?us-ascii?Q?3KKDnzhr+aUJhYtTSvnPQGxQCgUBzaU6uQ7IRJIw4CCCJv8Kk0KapNB9NX7k?=
 =?us-ascii?Q?00FLO4R/DPL11NCbQJS3e+FBpF7F8qOI7BP7OPyn0mjTrvsKckfs76KN6mSo?=
 =?us-ascii?Q?au8i7nexBoa2sQk6lYx7lKv74mn0gY96Vsnv4o7RW2fcIfL60xDZV/CwuCNe?=
 =?us-ascii?Q?T6TYNXR+5hIAfg+K5HcjvAKDT8Zci+0F8PC8aBsjKFqj/zxT1u90PTS0yOoQ?=
 =?us-ascii?Q?6X2NXaWQluAn84OT1oL1NAPYNwn+VaotyIa4OqNO6EL+cIXBqGF/2rs8cwIH?=
 =?us-ascii?Q?ppy123xP8B3NHu/kGyN/yGFiO+O1Mi7hfZMJsz58Zk7bEcfj5Cz08kV13DMO?=
 =?us-ascii?Q?XhtZywdtFlb0yDuA05km/JE/jdSiCF5oXla8pqwO5AXjBcmaPsaAOxHPWT9G?=
 =?us-ascii?Q?od+Bbhw4Cnyd2g/SY1EaiaGQl+XbzhSaxdEv8c/2jsvWAITWwBTPxe7lRPtH?=
 =?us-ascii?Q?0giWqMA4grInmfCb/IFvKP86IsUGr3q7nwzOq+kVxd0WUXxmFyA2elzf4Fvg?=
 =?us-ascii?Q?gQtc3CWh2xWr9Ge5NXwmj4fIjHpD2DVg9fqrYpLBnQPlXzNDKcA0Sd4yTwE1?=
 =?us-ascii?Q?/yv8l8KZyps3XUJx7sDgSNlCrh7kH84aj4x7kS7NVyewxRJ7Jm2gS6lhFhx5?=
 =?us-ascii?Q?8ti63rGAOhjakYU6o2wtj5zIFoamFdPL3L60xZHiYx7L+F9DPLr+cvS6afGt?=
 =?us-ascii?Q?A8oBEsimO60dyuJK6axrRWJrBPMOBKnykd+ICVJZXxmCIHZhYFb7lms7Njp8?=
 =?us-ascii?Q?YVFftexoIzYwhr33QQEDjYuvKJHNFZHUwushqAjDY2UMoW3yeiPyTB1sZm/O?=
 =?us-ascii?Q?i177yaQiUKCLmLbrcqEYA5w39YSbQyMu5J49NFGSjfeCpOm55I710Kjavd/7?=
 =?us-ascii?Q?GWp0rInKxFmUeE0aQdJkJranRCEp8Dx7kMODEx7znXyLxG4rGL+ZgN2ovVK9?=
 =?us-ascii?Q?mFPtdYuHb2s4zzBojJw2eRHFppoqXmcYM59T9+kpg/wT0M+ECuhLKC2seBwM?=
 =?us-ascii?Q?PLww/GpSRV/Sx9G7Jb+dHFoxWLJPCY0DzEw89Wn/DTJU+2DLyaDGHViS9c1E?=
 =?us-ascii?Q?TRadImv4NOZt1TLmK6KkZMokoYTPrq4Ql7+M3LnFmEdrbWs+0dD+D3HyMi+h?=
 =?us-ascii?Q?vUFsOF8RGjURRei8HjAZj1GD325l19Bwyq6pgIz72z3Gi0JGNNlzDvP9ZDZh?=
 =?us-ascii?Q?xJE0NoeH4qwdM05/N47COEYsqyxfByRtqp/iXoIdHMlNAAETRsejFnRkTCa0?=
 =?us-ascii?Q?DzlDBd07a8yoMmS7sZ14RQ7j3pntRc42wjoGMGT6o6FSjG/ekLaV07WeKENg?=
 =?us-ascii?Q?bdPDBjMHnP+UmX2i78Pjimq7W3DNLlb2FixuYRQQieDoSUzXIw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZP1UYfz0gIlpbgvQttUjqSo97Br6pjLrJpq5RCb4a3Ft6j6a98YAiKiPkxVC?=
 =?us-ascii?Q?cGSbhFfwgC3+E2MG+NPmIWC1cjbQeTReU/Vd2PGS/YXM0jam/viOhRT4K94e?=
 =?us-ascii?Q?caQ7apaml1PllbtBIr8edll9jX38LBzmw30v8+YwL2Mt9SiualAPN8fXVI4j?=
 =?us-ascii?Q?ChDgSLDmI2F8yC8UIV1L+to0IawO8/Qb/+kHpKdM22rOyJsN9cm8NcUZHi4x?=
 =?us-ascii?Q?YwQ8/fmg001wqBeJ2vQDwr/QfUlBDknVaPfeJ+jrbazp3bhpv+AeB4unC5FQ?=
 =?us-ascii?Q?APXESxnW8mihqU2isMW+cAcUSHctLPLFmAoUQ4e67b7PSzJWkRAuXeRsSbL3?=
 =?us-ascii?Q?1Tus6p6SlQId2EJDy5HwXMqGK8uZP8HlKjx54+d67uXAaw69b1RbM/NKhUZl?=
 =?us-ascii?Q?BbkW6Kru9dCXbK6WizibpUqMxS8CCX5B/AeT6DpgXbFKvZJNdjOfQP8K+9Gq?=
 =?us-ascii?Q?ZfJ6yGoeIp178MKT7Vx10j1KJxaZFoJmCVqcl9TDZZm/LHXfdCg44Rc591uv?=
 =?us-ascii?Q?lhsoPSPrCXlJu5hg95i0NKNgM9SFEyNOOLgBKOw8JBqG6CSCDMmOz7YW4is8?=
 =?us-ascii?Q?ozhmwBUIUJ0JAjy0MH8V1yUZz7DQ6msIjrikueJWTgKJP40Q3xR92/awfwZI?=
 =?us-ascii?Q?eQchub/L5Y9UIEZTbNPwcrochC2ZQHfZnWSiY+YXsYV5cGWX8OORfn5J7nVz?=
 =?us-ascii?Q?HTw8Mm4HDh23aeahJT+v6ADd5fKTQcC8ey/KxzOAmM61/eQx+ePZ4h/8KxEO?=
 =?us-ascii?Q?IR+ncTowgUecaN7sfrSSgvlIhYpUu5SQTL6aG/u/iuzwbn9M6PkPywl58LjN?=
 =?us-ascii?Q?MDYks6K81vsDMMIBksOvQ+uQSh40ctj38dExRTqO5L/bttVciZMK6a3OncGV?=
 =?us-ascii?Q?Pef4y0Jym78QgDPYIyrQlgz0ZGi9LauYsft3OfKfgs8Z/rchHgRqYoeoW47Z?=
 =?us-ascii?Q?l0eIzOre4MCJGuzK9kJJULQCMf1QrV9Qnda+2PpWZwCGpeY+fcCZboH+RrnN?=
 =?us-ascii?Q?CAQ6uxdR6gVxE6TgJSELHvaxA3OzeQGFOpsdQBW1O/7K+hqy7VYrUViXN/ty?=
 =?us-ascii?Q?jtUWAj77cJaaGi23qaR6LsEGNSYLxfAJrd/K5yB1BBeT31MLPE79jWBd8JD+?=
 =?us-ascii?Q?j2eDBKTyK6mdY3c4PfQq606rLORsXnErRPcLixAMoUKQGHAR0AsFWaWZCVXl?=
 =?us-ascii?Q?Rfc+Exj80ClQfw9mBY6fbsAIqTDKhNKsuKOlzdS39ukxxnnxufHUvAbvf4Ci?=
 =?us-ascii?Q?TyyRjQuniCZmLMoREFj2dbQoMPPothndLN/V+ZyDtfBbkw3SA3Nt54K0mrdr?=
 =?us-ascii?Q?h6YU3EcKSjJNxZv1jXpvCjGp12g2djsXDBY/KyAKbh2yjp7Clh+fW1jdjHW6?=
 =?us-ascii?Q?1F71zLRCrEEU4SmbjW2/yya0NC4Y9kgmSjwl4NCltYEtb50SObZ5JUoD2Mr2?=
 =?us-ascii?Q?yZsYVwIaOn1TNfwd2NTlZbuqcZTOVmU/mSPHCVVqUAUIRoqNKHCqAu9QvAVE?=
 =?us-ascii?Q?x4QLIcj+wS+HpnE0QKNgDt8L2yqKZ4CCZwQukSdxQqvJPwvWCd/Q+OCOEaMP?=
 =?us-ascii?Q?MgLfpY6hHXPkUac3l8RzIZLMGwgLRO6I8Cvj+vmauOag9CowQku1NOQNH5QP?=
 =?us-ascii?Q?fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6584ed05-5459-456a-d187-08dd182b9ff9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 08:29:40.2654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IuXdGX/lnSSbt9MuLR7lgZOErA7KcXk/WXeQi3l3jXd7FAW8yeQRQ7KVoqcRRiDuIxrmzjbcfbeFmwsuWvnUkSsdKPh2MsRnLUNm2BY9S6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6543
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

Hi All,

Gentle ping to apply the series, if you are happy.

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 19 November 2024 18:44
> Subject: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
>=20
> This patch series aims to fix 2 bugs in the ADV7535 driver
>=20
> 1) use-after-free bug in adv7533_attach_dsi()
> 2) Drop unsupported single lane.
>=20
> Changes in v6:
>  - Fixed memory leak by adding goto stattement in error path of
>    adv7511_init_regulators().
>  - Added Rb tag from Adam for patch#3.
> Changes in v5:
>  - Updated commit description for patch#1.
>  - restored host_node in struct adv7511.
>  - Dropped of_node_put() in adv7533_parse_dt() and calling of_node_put()
>    in error path of probe() and also in the remove().
> Changes in v4:
>  - Updated commit description for patch#1.
>  - Dropped host_node from struct adv7511 and instead used a local pointer
>    in probe(). Also freeing of host_node pointer after use is done in
>    probe().
>  - Added link to ADV7533 data sheet.
>  - Collected tags
> Changes in v3:
>  - Replace __free construct with readable of_node_put().
>  - Dropped single lane support from bindings and driver.
> changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped invalid Mail address Archit Taneja <architt@codeaurora.org>.
>=20
> Biju Das (3):
>   drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
>   dt-bindings: display: adi,adv7533: Drop single lane support
>   drm: adv7511: Drop dsi single lane support
>=20
>  .../bindings/display/bridge/adi,adv7533.yaml         |  2 +-
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c         | 12 ++++++++++--
>  drivers/gpu/drm/bridge/adv7511/adv7533.c             |  4 +---
>  3 files changed, 12 insertions(+), 6 deletions(-)
>=20
> --
> 2.43.0

