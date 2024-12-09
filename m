Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C689E9CD9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 18:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F308310E0C2;
	Mon,  9 Dec 2024 17:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SSjaF6bW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011026.outbound.protection.outlook.com [52.101.125.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176EF10E0C2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 17:20:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yidu6IWeYJOEaZLLCgEupmm07Sa9FfqmW0dFXs8dv0KxvhUPZ0jJsPizfGlkpd50bX76nJ8iGaMtCadKRbodjYgQ+q7+44CAglEWjSUehYfHdG3X1a/2iczVXmlYnF6ba06ZPEyZ7pautxBeE8AC0Uu665CoBbxXyp/b8bDS+b47H+HHdL3UGIf4a+poo+/lL1W2oCSkfnrDzFYNr8YwTAFQiI/I0DnUgBW//WmDPTMUZLBgQs4llLqm/suPy8bVSOLD6Jda3m/WczLe+bU58ZIdSl4HV6x/IRNaCOjsWgmJm/fVxyZZ8N89x76prlj8TIPN7I3JNhPiQPySXeOIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOgThsc4yH2lwefvdqNGObCatyiwTUuywx/HjItNEHc=;
 b=SX4Sa3M3i1Nv6jbsuREEN2AVT+3CwJcCtoPr9XvogwZlUHJDRvhyXD+1oIcn8j8qxv+IFjdUAsFmEjYDySpp6MB66kmF3Vfd5KosUX5bfYYMUa2UKjNU/09Rl3/SjK9KJlBsXW7MDtn1X4kz9/dRrNsJyuPhZcn+f58e8i/jtHuLWOZ/UK2n2m6oVN5QYn0Z47g7W6OcSz5zb7jbYkYJIRquetTg2r118xty8MSD3aLnpJzYJ+EI9+7kbt0yNT6yKeQttalwrAUbOoOnjqKZ/wBlG/kC/Z+nEjYwSaKMmZYiCzC7cc/UDPV21PQ3lh1W+tiqSRQh963A+siOU/ysVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOgThsc4yH2lwefvdqNGObCatyiwTUuywx/HjItNEHc=;
 b=SSjaF6bWIz7YCp2SQxzAnZ+YYd2b2aWuiY4Os4xV7Zbi2t9JF/RI1c0ah0y8XIQ6r/nAX0Gz6qX04Dlcku+O7fX0pSOUuX8u6x8sVMSKX/QjundaXyozDGkgS7srdis7YqsGTDtIvbYXpLSZ+JogYEjJ4g6hN/vG8/DZ6P8m42s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYBPR01MB5536.jpnprd01.prod.outlook.com (2603:1096:404:801f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 17:20:37 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.014; Mon, 9 Dec 2024
 17:20:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "tomm.merciai@gmail.com" <tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tommaso
 Merciai <tommaso.merciai.xr@bp.renesas.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Liu Ying <victor.liu@nxp.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm/bridge: ite-it6263: Support VESA-24 input format
Thread-Topic: [PATCH v2] drm/bridge: ite-it6263: Support VESA-24 input format
Thread-Index: AQHbRuwVEIszzOuAxkqYA8eIG2ZXArLeLz0A
Date: Mon, 9 Dec 2024 17:20:35 +0000
Message-ID: <TY3PR01MB1134691B576B196F987F942FE863C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYBPR01MB5536:EE_
x-ms-office365-filtering-correlation-id: c317a718-2a08-4c25-c87c-08dd1875cb41
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ni7MAxndQEuini3V0rIgFOsSfzk/2zzlrLcHmUj36zZkZHSEHB8PhEogmolp?=
 =?us-ascii?Q?WstLA6m7jF/gkhzgEHXzi/lN9/q6vU9JyBGpo1bA3DKMH1iWimfXrm8pF5FW?=
 =?us-ascii?Q?QMdy/IqA2bkBclRWXv6dmHx1tfLVs2vUeRDCqhb7JV31f/YyUYFhhaXZYab8?=
 =?us-ascii?Q?28knOmTwfMmoOP2WwFd7XXX3FbX0RPeuWmX7UyLavuQ9uFtw/IQ0JhVbuoqH?=
 =?us-ascii?Q?qVE6jxywTA95YfJu6Cil882uwfxFy+cGcswWeth9EhatGC90D4E2+eODhx7M?=
 =?us-ascii?Q?JerirRKiQF2I9ZWXXNo/6Le5TtZfyTCU5ewCUhHZiGHkDm6PnreOiNwAunAz?=
 =?us-ascii?Q?amc6HnWNHK3PqLrZExEa2RACCwwJ6niqyLVrwXrob3sCBXTw18DM4Cmj7UqF?=
 =?us-ascii?Q?JH5p3BMKe3ZdbViSTfz9/72h9yvmmNKBPO2p8Cska0QV41yGLEiydItFh8gZ?=
 =?us-ascii?Q?wJESl6iejux9vC61jE7RFORjq5JWQlkOmlDeU4qeaDzU/PJZpyUHT5HP7Z3e?=
 =?us-ascii?Q?xnbe50jYNV3xjN9UybhqnFLoa+5GBHZaQ5dxIPyBbCTR7t4bsnKcKJPtQiRr?=
 =?us-ascii?Q?E1Zl6KyKf7wl0/QiTABlP2TcgLT6VzV7tw3lQwbtyYjFvaSAuY8/akQVgeoW?=
 =?us-ascii?Q?5UbB9yKaIdIlwp59oiD3AAACE7X6FSajZJL5cHOHjFvowbK7k7ASeCouUFIs?=
 =?us-ascii?Q?9tDXHzLmbtuwqFxlUp/WsjsCJGc37KaWojHyw261gBJMaixDywnb4kRJI450?=
 =?us-ascii?Q?nDL255aNODmfsS+M1XF6YIsKC4jt/apE7nxz/NgWnd4lK1J/NYAKrB+o3fSX?=
 =?us-ascii?Q?Wz3ZQVe3nOfRslms3vz1IWSpdZ1ne+EocjGdX+icMdlSROjvYxASD8ULXxrj?=
 =?us-ascii?Q?xyB0WLM2e1ExXqEVy2YCL+TmvASQjzA3cbPPRASwYqa8J7RosMsT7Vccwj87?=
 =?us-ascii?Q?w6QkVdjhbxPysemCOz5jQkmgzCj/lHAsYOMxiXHhEkS+mkIBcyULC4ttMzRb?=
 =?us-ascii?Q?Y4V4/Uc6Njj9OTVTHhgjGp8JwhGr5nEpDF8ZUCjTSfEpIHXH1JHiXGh6yYf/?=
 =?us-ascii?Q?ZU1Xru8FjKgEAsM2a0AMlX4jB3A0UtoAXWvzU5NGV4imXDRF/ZpSH39TSJNT?=
 =?us-ascii?Q?bMx6dsKReNo568uWsmfhb4oPV7k/4LfOIL1QPN0aQr/gBeLRphWmOTR4mceP?=
 =?us-ascii?Q?uM5XDdKSjA8FKnqmWXR3aj2kOmkwdtnv9IqLCT5BvHSYAGBHTb6jca4bvArN?=
 =?us-ascii?Q?/9ajjSdtGEAq8Ugc2yi7R/cRxk60SR57rQPqZkmcy9VWMNQ6frB0Bu1rhNki?=
 =?us-ascii?Q?NYUY1SMER4KzcFx/tFWIGOH8LUEF8c8+5xNMQWwfP5oCprYouqAMaktocMUG?=
 =?us-ascii?Q?wJgdZ75BuOn5k1Fy5m4TUw2SrsjNqc29MAjM9Az6LhF+DzWWjw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y+TFBDvLD2FCdjCs19f7T+q6JAGEhzZOZwqpQwjhxEk+LYPPK6IqQJJNU8u+?=
 =?us-ascii?Q?LlnUfisTvll+uWlujhxF1hiLRQ2G8B1hlmPbxQ6Z/YRQX02zam7hluo+0QP7?=
 =?us-ascii?Q?IVxpA7I0HdfDQpF/7fCdvZhcmaDOQkvwazYRFcfWqZ+whqA0d4TY0lCY6a1T?=
 =?us-ascii?Q?/sbmXgNnuBv8f7BNc2p9eTHCWt+AeES/yfQiQrQgaHPObfD+rpvyM9gjmaKi?=
 =?us-ascii?Q?wXb8n76sYAq55C1iSnK6YhR/txe0xmmr7DWmelQx5zfrw5vYglsDrXGQaD2k?=
 =?us-ascii?Q?W0UQfyHmQYB0DA3ArswMf2Va6x0xYVqFf4wxNtTNgFHK41FW3RMuQAUZ0c93?=
 =?us-ascii?Q?pEQ0CdhABnBjwQa6frIVnDQegRG/cOWXl/nMs8I6STzfY3letqUo3yV32d8x?=
 =?us-ascii?Q?SiAJJskhjRfE0+QCcmRp/8TXKAsy93aDGv9fZmGWOly0rcyBaz9kT2yGT5Vp?=
 =?us-ascii?Q?JwrD09pq2goAsR5l+C5/qVE5rABEXnNaGn48DYHpDH9kWZP8TGcsUsQWOViK?=
 =?us-ascii?Q?dvDjlsdjd3C+2p29xNT0NSZd2vlc8ff7mSStIwlXtyqCDG0ScOdKRP+Rz1Zu?=
 =?us-ascii?Q?i/PnhNSU3W99MB2yqHgRZHIuT7shT6bTLuQ/1FAEbdUKY+TN5Si/V4DBN9Rv?=
 =?us-ascii?Q?JoKYJCXP5MtqAjLuN4Y04OfTk/VXKfZr788MnE2XAj7LzeS0qfw0ZExCKPWm?=
 =?us-ascii?Q?ibghwjGn8tQFoqDmnHpF4i6vK9fCgtH2w76r+OEoCtvmTgUyIshPnJoQq6H+?=
 =?us-ascii?Q?jrBVKox2s8AsNjm/I+WhoSFp4PaUs1XYoJ2b5+L78D1keyF9of+erqb3jvA3?=
 =?us-ascii?Q?TJS65jAuctWLYDZRtoFR2H1NL0Ld1106bGK5gGmn4exSQgHeHsnn9hROE2F+?=
 =?us-ascii?Q?PSFmX4v7CNSPhzL02dw9PY50ULbAQqjqnoB+PjwNBqwzxRjyAOuvBYXbWjOv?=
 =?us-ascii?Q?6f6diZRjoW8OYQWH5VXpLGv+piH2oup96XzRAVMqkqNkouf0Iwvd+XLIvRS9?=
 =?us-ascii?Q?+tpfean74eA2AFblKbO7MogA0necur6uNk50lGTGb6MdHAkrfD5zM7fi7Md7?=
 =?us-ascii?Q?XMNjd+02t71f61MuDALACPWVW0jCyL0HlsgMCWY75pgmbOx6WqS+fMP3SvtA?=
 =?us-ascii?Q?IFs0KYweBVzS/QwiAqoJPyvjg4zouYE+0Tl6nf5ytKcXV97LZW1g4Ulkv6nw?=
 =?us-ascii?Q?p0a4+6XgRYr1/xHB9fv96MdsOR5p2cOM7K95AkcGt6QrcYsu39fez37e0wAv?=
 =?us-ascii?Q?M5zGYHWG6XLkRyZj4IxPRM0XQRBYztVDA+CDCf3P2yU6kqCObF5i9qcGablS?=
 =?us-ascii?Q?LD6ZV9VGQD/+8OcfqFRX/dLbzS+z7HctnhzvsBO1uPz+bHRmQqCd+eUYQEYh?=
 =?us-ascii?Q?+kwvhrvFOOiTcTnHRi/HC31bFJHcaAFBiyg3oWPWbj000m0cRuX7dsfua/9Y?=
 =?us-ascii?Q?0iFvyLitbeAQWOGOfRNHSCKX9KUZaJXsbkm2D4j5xdaluw57VO9MhHFbeB+H?=
 =?us-ascii?Q?RwYjiRc1FiU6ByAmPLkodK88/C0ud37xK64lenPX/bqdcrhYGFG3FJ/0aNpc?=
 =?us-ascii?Q?KBPDCMF4ffGfcQS4c2quISuGW+iOZ8kcPJeoYesqi0S16QFHcss5uFSmKzmP?=
 =?us-ascii?Q?wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c317a718-2a08-4c25-c87c-08dd1875cb41
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 17:20:35.6211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9yOZGUKrPSrBbzQzwtQuPgo77YAnKMz1Qv2CIgmcmSFng+rO5HLRylrhqIFoMajK+z99VCFDbJ0FGExGCv7X0iR78lSljX3fZ5ZnclMX6fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5536
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

Hi Tommaso Merciai,

> -----Original Message-----
> From: tomm.merciai@gmail.com <tomm.merciai@gmail.com>
> Sent: 05 December 2024 08:02
> Subject: [PATCH v2] drm/bridge: ite-it6263: Support VESA-24 input format
>=20
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>=20
> Introduce it6263_is_input_bus_fmt_valid() and refactor the
> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA-24 for=
mat by selecting the LVDS
> input format based on the LVDS data mapping and thereby support both JEID=
A-24 and VESA-24 input
> formats.
>=20
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
