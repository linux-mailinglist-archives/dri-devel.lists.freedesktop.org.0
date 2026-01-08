Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC9D047FC
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 17:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E892110E369;
	Thu,  8 Jan 2026 16:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mNLamhB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AEC910E369
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 16:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEH1MsK9ZY1k3PCbTCqKt72UT8t/1DMoN5a5ixw+rpyAD+6dEgn+15wJZn07bOzgspBKIEbdrH/3+uIX4UPyjk97kKsi1dfueWDoIqFrN2kXQg4YkYV21YClRU7BXm1qdIqt/7Tsl8WWPmeNoKO+D+hGXYCUR4SnPqtNr+w6aFrrWw8J52eSaGYA3Al8qIJXQea0aRYZK1sPdIV4263P28xuZHd42dNBa/1F5jtjA6Lqnb9pQwTg/i1Vo8tiVESdVynY9EZ5NjY8qSVODz2PIeDIVB+UB6wa4sdDyA+J1p7FDxJpMckVxcXfEPbe0xXKFX13gvfXMvov+yPj5CnM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/3Y7P+gs6973yt+CzsfUuTIQVExb895fOl99y2ogqg=;
 b=s7x/O8nkl9AZBsyx9/xF4nlRN4BamJl2zqayYoTPjSvyr2g2X2fhRLkc3LE67OrzUHIp+SQUfWDWk84rDz0K/U5bt6QxBrX4y0v2rZpeBsl7gE2gWDNwRKys1Uq2inzHedJA/AvQnLHUoHmwj+NPrvxMO2lJrdcMGnmCCUxxn7UA7OJksvaNWZovuWyOyreKCN5Hy+DLIoO6UJLf+hLOXolzJ1KTUpywFx+2+dP98mt8Tua78EjyyW9qMNc1k3+CpsR6ctUh51c+V6P1ZK1XHZfssU/ECW9PYjTMTPoP1jIeTNWb2ZozZ7SvJR/L7Zhy5ln5xpgIFr3Bd4TpfyNdHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/3Y7P+gs6973yt+CzsfUuTIQVExb895fOl99y2ogqg=;
 b=mNLamhB3ybyN3QDOljrc/ubUj6qjdR8qUBz9erdFAnQBkn7/Ikz2Xe2VJ3GeCUzX8lu6lN18pJBNv4984qfRnh3iAUajWqS8Tv1JJ09TnDtXPhYgPP/4VILuw3n6gncAn973M0OnCFVSz02AxpdVQ1hMCyiZYUzdBfQ4QiUJKO8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY1PR01MB10769.jpnprd01.prod.outlook.com (2603:1096:400:322::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 16:44:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9520.001; Thu, 8 Jan 2026
 16:44:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, Claudiu.Beznea
 <claudiu.beznea@tuxon.dev>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Chris Brandt
 <Chris.Brandt@renesas.com>
Subject: RE: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
Thread-Topic: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
Thread-Index: AQHcgH7+LfMjCpngTEmutarkKkFyQ7VIbNOAgAAJDQA=
Date: Thu, 8 Jan 2026 16:44:37 +0000
Message-ID: <TY3PR01MB11346AA75CAA2496A06BCEC438685A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260107164839.a490a194d975edc399d72d01@hugovil.com>
 <f2aaa95a-fb69-46d8-ba0b-fdc793273455@tuxon.dev>
 <20260108105319.6bef21d3fc60b261792d07c6@hugovil.com>
In-Reply-To: <20260108105319.6bef21d3fc60b261792d07c6@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY1PR01MB10769:EE_
x-ms-office365-filtering-correlation-id: 5f6ad3af-ab12-4044-8117-08de4ed5365c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YwbVMBqLCE2PMgO9NTHd6pG0Dw52F0ezQkNhZPM99ahffucYmoouNj0KgD8D?=
 =?us-ascii?Q?Sld0nSMqkw9UfWjVhK2Nfp1lwjpRs6J3fjjQDDSS+5jEaJ7+DOeVP1DUlB9+?=
 =?us-ascii?Q?5rUQGlzjtWfRBts2eQ2IJFBdwFuDmXkm53r5qKIsqWtXrBHkhubXQClG0Hyc?=
 =?us-ascii?Q?objuZn32ZYWgzh94NxTAmIseX7WoKIBfwZqXhHwZJ/Q9mtZW5m/MD+EkALbn?=
 =?us-ascii?Q?MY2bS0XysR1KGuLqdNTCTKF9eKpWD/E4CX8OD/5FjZmMv4YrCcsL8H2EMeKS?=
 =?us-ascii?Q?YfONIE+wwlzMTwqYTeSugzXgFGbqJdEpelZrWq/FpbSwjnVdADT/p0m1mRda?=
 =?us-ascii?Q?3chALCF2Ug1306u2JuzZxT7j2Ec7366DoXL7NMn19XD5oS4mW0NL9tlr0l4U?=
 =?us-ascii?Q?16OwnT+RI1NQfZaq7iloXRqOOEiajPp1H1Pro4RSG+ePpkRD9/z8IF3BJfB/?=
 =?us-ascii?Q?LtgbzSYUUOXh3oATR++1mpDIL4Dt8KZeNDdvJrx7QWO/RMIq3bLggvUKAyHC?=
 =?us-ascii?Q?UpUNMts1+KSEs1tdpaEh5jY+OQYkyifuQebc4BestW3fanPamx0jRpE0rWLr?=
 =?us-ascii?Q?54Rx4jJMbBVqHCK2HlUrdtoy7kfy93N0hl5TdAD7f7XIxpzTiQ2TDlcjFqcL?=
 =?us-ascii?Q?QYhoQkRXt6UaoZqUe9yFT08AYVnlIGXlLHd5+eAaMWt1cs+NnYm1cDU456zz?=
 =?us-ascii?Q?kI7eERiPVoC9nHspMcGKsUuL0PgBBQovuYfHqQT8w8vVALKWuUfikxVVH27q?=
 =?us-ascii?Q?Ks1FN84ce7hRIDeW12yUSWGHtt5B5WcDb32LXziY3ML/oSGBrjbSw8XdLo0H?=
 =?us-ascii?Q?KDDfUjyBaU+8yd/YXyIiDjSGeBmtsNlKYp1dcRjsbsGPs9xYdUY01gsyC42q?=
 =?us-ascii?Q?8kblzSzHrhaSaPjEwoPsTT1SPMzNkbFVEQ9auujbHFAHlPDksdJmzFeSU7K8?=
 =?us-ascii?Q?DerKM4/Q4Uphh86Q35thCg51fNH+sYR6Aixq3tksBvFR7jGf8LgD7Z6y/LBf?=
 =?us-ascii?Q?W2IZqRGV0t0Qggq4XyxiraD6KLEAEY13JcXlcSyoFEX7glCBFp1iJ8e2Y51j?=
 =?us-ascii?Q?aLv+ukt01iCRrT1kAEgbJRJ+jwSugGFZ2eIahxAVOnYJceacAOfQN+wk9gXV?=
 =?us-ascii?Q?XAXobdyLf8MwxvCBvewtPUfGfin3zFu9FQfdcWMsj2pwFUwhbkmrtv9FQft5?=
 =?us-ascii?Q?9K6KNj3SaHMHSOQg5LHLnQd+hkn9A5Rojlnp/Fc/adxgVOCZE+gxrKaDJ3ba?=
 =?us-ascii?Q?3C0XnhzDlxEF9SoJ+qId2BLOWOdgLelusy7L0xpLk0nIWovkcoGGkWsKx8De?=
 =?us-ascii?Q?vG9HCYTey40RzlfSKm3fK1V0RV5ezRTb0lm5L0lPCCEYCtf8K6NX+rgFX9+V?=
 =?us-ascii?Q?U1ZjAD6vF5dWGDpXsOKVyEzSbf+RoYm0362ry7g3Q1piaNGSUeXq544M5e+k?=
 =?us-ascii?Q?ONFjYcKQfkPXxrw5nrNt0ihWtxLAX3cKc8KxjwUSqeLImppWeo9eUQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KQoSvSeyzYU9PZ0PuRzjBZDbSKDUKr0QEVKfVZv0M2bILQdL/0eSEuAQUd6S?=
 =?us-ascii?Q?JCkgXPi3sMHHuudoAAJUdSQXzpIsPvZzPf7W4m9NnKs/KhwptQW/mdCyDwQU?=
 =?us-ascii?Q?u2HxEtrai0hAwduiP6FXDAS0wOre7mf0RvgYp4PEoruDGCRlPOdWyEHEsVRb?=
 =?us-ascii?Q?cZFd+gMMcXKCkOGofwlLtt+cZn/oNJ/Hd2o5RfqngY5wt7Z14WymyPBRpzIi?=
 =?us-ascii?Q?3V8fMzcEMK3H1A3ArQ1H/yJVWcOQNNaj6qjBGrSONSGL4pXOQVFZAfTc6VBZ?=
 =?us-ascii?Q?I37IUrmfNWCflsdYPoKW/ql8Gg6byYzw4VB2Il1doc7aleNfqlteSkXgh5NW?=
 =?us-ascii?Q?ENy6FaEPe+q6/6GNrGMPgmWaHYziu/qS0jJ0XLnBcyxXU/CQAy077TY+keu8?=
 =?us-ascii?Q?CyirvAUPduF7KULRpmsoTGosH1/1SbFB7SoA+3pdhboZVAPOhAw9jPeD/zoN?=
 =?us-ascii?Q?faa3vhmUW4Wtd0sZ8iU/df7TKq2y+OkPQRuXfhKKjqaJrIoC4uPFVEW3hDa1?=
 =?us-ascii?Q?53OObC3tBtexP+aCZtk83UrPtSqYyMTHI26vtcyhp0dpONoA8vYj8IcjOKDN?=
 =?us-ascii?Q?RPb2MtB+NvJLuK21osw+8ShrJKDcg/NNDtzh+K/8OYYfj7B45KmHH5ZRQ8q7?=
 =?us-ascii?Q?NJtPP/wlcGg3OE0tusD9WgkSTbEkewqr4zkzQQzq5iEetePYSkxtRanHnPGI?=
 =?us-ascii?Q?fzzYs/AgMFmxYJ+e+JomM3f2hebBsMi8tmkViFdgEv/m6CdqbbNgFBH9l7um?=
 =?us-ascii?Q?qTWVCnU98DFGDtKeC8II8W52sDIZ2/E+n4zRFzqoszX874+tWxcJTLi/4/+C?=
 =?us-ascii?Q?50+zNndJ7ivqiZCifCH7UzBbyXIPEmajn9Kc3HnX7ZiZz+LueBCMcHQVlrxm?=
 =?us-ascii?Q?PEBSJouwyWn6kyA49IH35qmkGsEnVU1ZJc6shG9Ay3t/xfDj0kywZoe7owL9?=
 =?us-ascii?Q?DQSAQlUSCK3P5HFGneulwEPn3m7E7kmBS/mHK+kfPYxn30zEN/rNn6Ue1cXD?=
 =?us-ascii?Q?PjBM5I1pCE1etv6uMfyV1d7BT6h9shTLXst+FpeakaEQ67PYCPpvE1F3Eenn?=
 =?us-ascii?Q?JMsk6ySx/cSh9uWLF4k7bektjajRy+g/2V9oWVvFgEIrzZglw2+zLqBM/hWO?=
 =?us-ascii?Q?cqwTxwEv0pEqcJ7K/fyBsJW2i/hOWNaI7a7xDhjFZeuAOf+JTsF4iM6udlX3?=
 =?us-ascii?Q?k9rknsJ2p8f6VaD7SYLNbGLikJTBRnD6/T3QkkJkv7DiCOuEB+88+ovj/urQ?=
 =?us-ascii?Q?3dtMdtdrNXGW1hTCQSvMn0q8pSj4jYNuEIIM6EcN/aCGkH7u6IFdK9c+N8TX?=
 =?us-ascii?Q?OGqas/ID/eWtzBz+iyZWhE+TtrMN9zVhaKvyUT6XTn1f675MC5jXH4zqiaDy?=
 =?us-ascii?Q?RltdNHc7MicknurpHT6ByqyPyKEEGfwCUbctPG3gOU81QareOIwvvttmtqD+?=
 =?us-ascii?Q?FVnCEkF3YDGcZLrJGqrAupQC5tyl5vUdRTrtXg1jWqQf7IaZ6Q5NCvkUlsOj?=
 =?us-ascii?Q?Pb4jiQ9mSOCzFr6PrMGSwS1rvec1vhX8W/7lqSarhsMadmM2UF+4+nr3g2Rp?=
 =?us-ascii?Q?t+WVkwhfKAHgk+7+XkUrCY33Z8WyyIhH6mcxiXHhESFlFHjNjr1XhnRtyZmW?=
 =?us-ascii?Q?ZSnVfN0efm7kLjVq4BmnCiZaHnxbWWt//+585IYqWwxJL6BX4KvQhIQUFV4q?=
 =?us-ascii?Q?V6yplzu63lPnezVOP/RZUOkBtpMMher3rFtQ+N70ttBd85vDBJcjPCQ4TOhn?=
 =?us-ascii?Q?DE5X1OJddQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6ad3af-ab12-4044-8117-08de4ed5365c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 16:44:37.9901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ao6QPkQhA15kbrkHGOqiNfxuJ7XJliP2m/3CGmPLynT2jCjuhfcy+6oXp1suJp/OB4oMU9HJj2k+mXf01y6OLCwM7d2ygQmKF1vN9/1rZ0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10769
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

Hi Hugo Villeneuve,

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 08 January 2026 15:53
> Subject: Re: [BUG] drm/panel: ilitek-ili9881c: kernel panic on reboot
>=20
> Hi Claudiu,
>=20
> On Thu, 8 Jan 2026 11:12:54 +0200
> Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>=20
> > Hi, Hugo,
> >
> > On 1/7/26 23:48, Hugo Villeneuve wrote:
> > > Hi,
> > > when issuing a reboot command, I encounter the following kernel panic=
:
> > >
> > > [   36.183478] SError Interrupt on CPU1, code 0x00000000be000011 -- S=
Error
> > > [   36.183492] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G =
  M                6.19.0-
> rc4-arm64-renesas-00019-g067a81578add #62 NONE
> > > [   36.183504] Tainted: [M]=3DMACHINE_CHECK
> > > [   36.183507] Hardware name: Gecko ECO2 nxtpad (DT)
> > > [   36.183512] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
> > > [   36.183519] pc : rzg2l_mipi_dsi_host_transfer+0x114/0x458
> > > [   36.183538] lr : rzg2l_mipi_dsi_host_transfer+0x98/0x458
> > > [   36.183547] sp : ffff8000813db860
> > > [   36.183550] x29: ffff8000813db890 x28: ffff800080c602c0 x27: ffff0=
00009dd7450
> > > [   36.183563] x26: ffff800080c5fcc0 x25: ffff000009dd7450 x24: ffff8=
00080e1f7a8
> > > [   36.183573] x23: ffff000009dd7400 x22: 0000000000000000 x21: ffff0=
00009dd7430
> > > [   36.183582] x20: ffff8000813db8e8 x19: 0000000002050028 x18: 00000=
000ffffffff
> > > [   36.183592] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8=
000813db220
> > > [   36.183602] x14: 0000000000000000 x13: ffff800081255bc0 x12: 00000=
000000009a2
> > > [   36.183611] x11: 0000000000000336 x10: ffff8000812b28d0 x9 : ffff8=
00081255bc0
> > > [   36.183621] x8 : ffff800081399000 x7 : ffff00000a042600 x6 : 00000=
00000000000
> > > [   36.183631] x5 : 0000000000000805 x4 : 0000000002000000 x3 : 00000=
00000000028
> > > [   36.183640] x2 : 0000000049627000 x1 : ffff800080c60b40 x0 : ffff8=
00081780000
> > > [   36.183652] Kernel panic - not syncing: Asynchronous SError Interr=
upt
> > > [   36.183657] CPU: 1 UID: 0 PID: 1 Comm: systemd-shutdow Tainted: G =
  M                6.19.0-
> rc4-arm64-renesas-00019-g067a81578add #62 NONE
> > > [   36.183665] Tainted: [M]=3DMACHINE_CHECK
> > > [   36.183668] Hardware name: devboard1 (DT)
> > > [   36.183672] Call trace:
> > > [   36.183675]  show_stack+0x18/0x24 (C)
> > > [   36.183692]  dump_stack_lvl+0x34/0x8c
> > > [   36.183702]  dump_stack+0x18/0x24
> > > [   36.183708]  vpanic+0x314/0x35c
> > > [   36.183716]  nmi_panic+0x0/0x64
> > > [   36.183722]  add_taint+0x0/0xbc
> > > [   36.183728]  arm64_serror_panic+0x70/0x80
> > > [   36.183735]  do_serror+0x28/0x68
> > > [   36.183742]  el1h_64_error_handler+0x34/0x50
> > > [   36.183751]  el1h_64_error+0x6c/0x70
> > > [   36.183758]  rzg2l_mipi_dsi_host_transfer+0x114/0x458 (P)
> > > [   36.183770]  mipi_dsi_device_transfer+0x44/0x58
> > > [   36.183781]  mipi_dsi_dcs_set_display_off_multi+0x9c/0xc4
> > > [   36.183792]  ili9881c_unprepare+0x38/0x88
> > > [   36.183802]  drm_panel_unprepare+0xbc/0x108
> > > [   36.183814]  panel_bridge_atomic_post_disable+0x50/0x60
> > > [   36.183823]  drm_atomic_bridge_call_post_disable+0x24/0x4c
> > > [   36.183835]  drm_atomic_bridge_chain_post_disable+0xa8/0x100
> > > [   36.183845]  drm_atomic_helper_commit_modeset_disables+0x2fc/0x5f8
> > > [   36.183856]  drm_atomic_helper_commit_tail_rpm+0x24/0x7c
> > > [   36.183865]  commit_tail+0xa4/0x18c
> > > [   36.183874]  drm_atomic_helper_commit+0x17c/0x194
> > > [   36.183884]  drm_atomic_commit+0x8c/0xcc
> > > [   36.183892]  drm_atomic_helper_disable_all+0x200/0x210
> > > [   36.183901]  drm_atomic_helper_shutdown+0xa8/0x150
> > > [   36.183911]  rzg2l_du_shutdown+0x18/0x24
> > > [   36.183920]  platform_shutdown+0x24/0x34
> > > [   36.183931]  device_shutdown+0x128/0x284
> > > [   36.183938]  kernel_restart+0x44/0xa4
> > > [   36.183950]  __do_sys_reboot+0x178/0x270
> > > [   36.183959]  __arm64_sys_reboot+0x24/0x30
> > > [   36.183968]  invoke_syscall.constprop.0+0x50/0xe4
> > > [   36.183979]  do_el0_svc+0x40/0xc0
> > > [   36.183988]  el0_svc+0x3c/0x164
> > > [   36.183995]  el0t_64_sync_handler+0xa0/0xe4
> > > [   36.184002]  el0t_64_sync+0x198/0x19c
> > > [   36.184020] Kernel Offset: disabled
> > > [   36.184022] CPU features: 0x200000,00020001,4000c501,0400720b
> > > [   36.184028] Memory Limit: none
> > > [   36.495305] ---[ end Kernel panic - not syncing: Asynchronous SErr=
or Interrupt ]---
> > >
> > > The problem is present since linux-6.18-rc1, but not in linux-6.17. I=
 also confirm the bug is
> present in linux-6.19-rc4.
> > >
> > > The bug seems to be happening in rzg2l_mipi_dsi_host_transfer().
> > >
> > > After bisecting, here is the first bad commit:
> > >
> > >      commit 56de5e305d4b ("clk: renesas: r9a07g044: Add MSTOP for
> > > RZ/G2L")
> > >
> > > Reverting this change makes the bug disappear.
> > >
> > > My limited understanding seems to indicate that the MIPI/DSI host
> > > may no longer be available/on when the panel tries to send MIPI/DSI
> > > commands in ili9881c_unprepare(), maybe because the MIPI/DSI clock ha=
s been stopped...
> > >
> > > The exact same board with two other panels (jd9365da and st7703) does=
n't have the bug.
> >
> > Could you please provide the output of command:
> >
> > cat /sys/kernel/debug/mstop
> >
> > for both cases?
>=20
> Here it is for the panel which has the bug:
>=20
> ----------------------------------
>                            MSTOP
>                      clk   -------------------------
> clk_name             cnt   cnt   off   val    shared
> --------             ----- ----- ----- ------ ------
> gic                  1     1     0xb80 0x0
> ia55_clk             2     2     0xb70 0x0    ia55_pclk ia55_clk
> ia55_pclk            1     2     0xb70 0x0    ia55_pclk ia55_clk
> dmac_aclk            2     1     0xb80 0x0
> dmac_pclk            1     1     0xb80 0x0
> ostm0_pclk           0     0     0xb7c 0x10
> ostm1_pclk           1     1     0xb7c 0x0
> ostm2_pclk           1     1     0xb7c 0x0
> mtu_x_mck            0     0     0xb64 0x4
> gpt_pclk             1     1     0xb64 0x0
> poeg_a_clkp          0     0     0xb64 0x20
> poeg_b_clkp          0     0     0xb64 0x40
> poeg_c_clkp          0     0     0xb64 0x80
> poeg_d_clkp          0     0     0xb64 0x100
> wdt0_pclk            1     2     0xb7c 0x0    wdt0_pclk wdt0_clk
> wdt0_clk             1     2     0xb7c 0x0    wdt0_pclk wdt0_clk
> wdt1_pclk            0     0     0xb7c 0x8    wdt1_pclk wdt1_clk
> wdt1_clk             0     0     0xb7c 0x8    wdt1_pclk wdt1_clk
> spi_clk2             0     0     0xb64 0x2    spi_clk2 spi_clk
> spi_clk              0     0     0xb64 0x2    spi_clk2 spi_clk
> sdhi0_imclk          1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sd=
hi0_clk_hs sdhi0_aclk
> sdhi0_imclk2         2     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sd=
hi0_clk_hs sdhi0_aclk
> sdhi0_clk_hs         1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sd=
hi0_clk_hs sdhi0_aclk
> sdhi0_aclk           1     4     0xb6c 0x0    sdhi0_imclk sdhi0_imclk2 sd=
hi0_clk_hs sdhi0_aclk
> sdhi1_imclk          0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk2 sd=
hi1_clk_hs sdhi1_aclk
> sdhi1_imclk2         0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk2 sd=
hi1_clk_hs sdhi1_aclk
> sdhi1_clk_hs         0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk2 sd=
hi1_clk_hs sdhi1_aclk
> sdhi1_aclk           0     0     0xb6c 0x2    sdhi1_imclk sdhi1_imclk2 sd=
hi1_clk_hs sdhi1_aclk
> gpu_clk              1     1     0xb80 0x0
> cru_sysclk           0     0     0xb78 0x8    cru_sysclk cru_vclk cru_pcl=
k cru_aclk
> cru_vclk             0     0     0xb78 0x8    cru_sysclk cru_vclk cru_pcl=
k cru_aclk
> cru_pclk             0     0     0xb78 0x8    cru_sysclk cru_vclk cru_pcl=
k cru_aclk
> cru_aclk             0     0     0xb78 0x8    cru_sysclk cru_vclk cru_pcl=
k cru_aclk
> dsi_pll_clk          1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi=
_aclk dsi_pclk dsi_vclk
> dsi_lpclk
> dsi_sys_clk          1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi=
_aclk dsi_pclk dsi_vclk
> dsi_lpclk
> dsi_aclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi=
_aclk dsi_pclk dsi_vclk
> dsi_lpclk
> dsi_pclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi=
_aclk dsi_pclk dsi_vclk
> dsi_lpclk
> dsi_vclk             1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi=
_aclk dsi_pclk dsi_vclk
> dsi_lpclk
> dsi_lpclk            1     6     0xb78 0x0    dsi_pll_clk dsi_sys_clk dsi=
_aclk dsi_pclk dsi_vclk
> dsi_lpclk
> lcdc_a               3     1     0xb78 0x0    lcdc_a lcdc_p
> lcdc_p               3     1     0xb78 0x0    lcdc_a lcdc_p
> lcdc_clk_d           3     1     0xb78 0x0
> ssi0_pclk            0     0     0xb64 0x400  ssi0_pclk ssi0_sfr
> ssi0_sfr             0     0     0xb64 0x400  ssi0_pclk ssi0_sfr
> ssi1_pclk            0     0     0xb64 0x800  ssi1_pclk ssi1_sfr
> ssi1_sfr             0     0     0xb64 0x800  ssi1_pclk ssi1_sfr
> ssi2_pclk            0     0     0xb64 0x1000 ssi2_pclk ssi2_sfr
> ssi2_sfr             0     0     0xb64 0x1000 ssi2_pclk ssi2_sfr
> ssi3_pclk            0     0     0xb64 0x2000 ssi3_pclk ssi3_sfr
> ssi3_sfr             0     0     0xb64 0x2000 ssi3_pclk ssi3_sfr
> usb0_host            3     1     0xb6c 0x0
> usb1_host            0     0     0xb6c 0x80
> usb0_func            1     1     0xb6c 0x0
> usb_pclk             5     1     0xb6c 0x0
> eth0_axi             0     0     0xb6c 0x4    eth0_axi eth0_chi
> eth0_chi             0     0     0xb6c 0x4    eth0_axi eth0_chi
> eth1_axi             0     0     0xb6c 0x8    eth1_axi eth1_chi
> eth1_chi             0     0     0xb6c 0x8    eth1_axi eth1_chi
> i2c0                 0     0     0xb68 0x400
> i2c1                 0     0     0xb68 0x800
> i2c2                 0     0     0xb68 0x1000
> i2c3                 0     0     0xb68 0x2000
> scif0                2     1     0xb68 0x0
> scif1                0     0     0xb68 0x4
> scif2                0     0     0xb68 0x8
> scif3                0     0     0xb68 0x10
> scif4                0     0     0xb68 0x20
> sci0                 0     0     0xb68 0x80
> sci1                 0     0     0xb68 0x100
> rspi0                0     0     0xb64 0x4000
> rspi1                0     0     0xb64 0x8000
> rspi2                0     0     0xb68 0x1
> canfd                0     0     0xb68 0x200
> gpio                 1     1     0xb70 0x0
> adc_adclk            0     0     0xb68 0x4000 adc_adclk adc_pclk
> adc_pclk             0     0     0xb68 0x4000 adc_adclk adc_pclk
> tsu_pclk             1     1     0xb68 0x0
> ----------------------------------
>=20
> I do not have acces to the other panels for the moment to run the same co=
mmand.
>=20
>=20
> > Also, could you please check if the following diff solves your problem:
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index 5edd45424562..62957632a96f 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -1282,6 +1282,10 @@ static ssize_t
> > rzg2l_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
> >                  value |=3D SQCH0DSC0AR_FMT_SHORT;
> >          }
> >
> > +       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +       if (ret)
> > +               return ret;
> > +
> >          rzg2l_mipi_dsi_link_write(dsi, SQCH0DSC0AR, value);
> >
> >          /*
> > @@ -1322,6 +1326,8 @@ static ssize_t
> > rzg2l_mipi_dsi_host_transfer(struct
> > mipi_dsi_host *host,
> >                          ret =3D packet.payload_length;
> >          }
> >
> > +       pm_runtime_put(dsi->dev);
> > +
> >          return ret;
> >   }
>=20
> I confirm that it fixes the bug, altought I assume this is just for testi=
ng and is not the "proper"
> fix.

Pre-MSTOP case during reboot, without clk it is accessing registers)(mstop =
off always)
it won't crash. But looks like you may have ignored timeout error from [1].

Post MSTOP case, if you access registers with mstop on, it will lead to cra=
sh.

and the patch fixes crash.=20

Basically, you are accessing link register after video is stopped with this=
 panel.
Looks like it is a fix for me.=20

Better check if there is any timeout error[1] with this patch. if not,
It is proper fix.

[1] https://elixir.bootlin.com/linux/v6.19-rc4/source/drivers/gpu/drm/renes=
as/rz-du/rzg2l_mipi_dsi.c#L893

Cheers,
Biju



