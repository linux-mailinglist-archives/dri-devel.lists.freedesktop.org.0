Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C514948DD14
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 18:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE41C10E12F;
	Thu, 13 Jan 2022 17:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F53A10E12F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 17:45:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tmmg56/xi7nPjSzPZtxsarLAzrigp9dXV41LSFHfanztCpbal7F4jJ+DPTphc+1xhWCfaJWwPu++1U/NHfPZn0HukaU0NpxitoEgaqTE3BW5vsJQlPk5/2pVqQiVlsPHktwcbf5TZwB04jZwIT58aPlQoM9iODgkxe/fkmIPPUebUI5UJajpRB1vMsD+v6q+6HjHPyeJdPURT4UphORetb1I5oDvuoIgRBPXKjsaKWT/EqWw9sBvk4k72qAs2HF3ijeCRDBDFrN4eHwgeBbrPgpJ20fNAKSaWs382TRcrbNm1STQoBh46uDaM0LLUfg8s2l9cc/ZzRT4lBx/38KdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlvEuCk5diMjU1mmr/Fzxp8HFgEWfHaxvteL6NPrlHo=;
 b=X8PZ3H0N6wMqhpXgP5NBk0wtmpdnAkJjVVcMocELBY5pkYOxH0A+FBBnfMxb7qNT/+N25dR6eIEWAVHS0Skyoest2SZ6swIwfF8FDjSSA8vy4auqCqiPsPqaxER3K2HDWLs3SHSHrkrHJkHK/K5rmBPNCNH2byYY2JEn8HYdCa08Q2+SjeO/QyzEQtmACO46yMxJmS2L7DrYWISgqCVvKx8TyeOzKhx2w5a22dpzkDHRznVphvwECxrImdSs2VL+prJr+0JcfJxPL+4a2UmYqIBXzb1YqqTB6dBDNtXHtpgOomVbfzxKYbcqJI5Fr83jccGne1+F/ESgvXwyAl2PcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlvEuCk5diMjU1mmr/Fzxp8HFgEWfHaxvteL6NPrlHo=;
 b=FNNh6yHJSZuhrmLA+S+rhA0bG/MAGiFyh5+4slhh7T5zOXVzTekWdlU1LymuW8teM79fNWiWvb8oWYIiBXZOv8cRRb22RqkUY2MYk+VIxwK1ETTZR0/FW7M+voMH6M3rDEfNWA7Skhvi0T69aYjhbyLBvX48701hksXB3hJsnl0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5951.jpnprd01.prod.outlook.com (2603:1096:400:43::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Thu, 13 Jan
 2022 17:45:05 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 17:45:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>
Subject: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
Thread-Topic: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
Thread-Index: AdgIo2084AmwtmkvSTyKeewhRhjVqA==
Date: Thu, 13 Jan 2022 17:45:05 +0000
Message-ID: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b42d319-ae7d-4434-e8db-08d9d6bc6f04
x-ms-traffictypediagnostic: TYCPR01MB5951:EE_
x-microsoft-antispam-prvs: <TYCPR01MB5951F2EC50C4784EBC269BC286539@TYCPR01MB5951.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:597;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /R9rAZ2g3l9BSNlDNkkXKn3ZYHfAiDlH/go9izJv7C9aHlOK4BO6GZm9saaSI0Kb3WYKmZRGe1GcVdb8BVoLFaKp+GNBN84YMvIrWk3Qy0F1I8QUvk5tdekxqRMV1Yy75b9CIZ/du9vTjav3GIAY/Dejv8hCGAXkTlcCtVkxZlgdXFwdHGlwzB+4oOCuZNYyFyPdbIO5e5MHQqAnTB/uYN3+gO2KOJkYD0kcl/RuEltkno3hPgtF42qCrIFaOjWmlZQFCntwjYZoDF/I92ZCSrZa9bGvMbiU2Rh1t3wwZUQivGLp8lV33ZPOWIsDGA95RM1bNwz1BVbvS7ITLAtyVY+8OExdGHWZ0mdbdxrG9CnXoKKKynX+axEgU4W8KLz6YWpXSiG5dTxz4vppC2OKecscW/JakzdB9EkOm7X95XzsCdoxkFXBNzIgNRlhH+CJZhDL+3RShxyJ9kUflXJzSJlx19CHBdiTMbtJFDeq0uIxMgthULNXblYA551Eanp+GXCTLXrx3XrAf6qrpYxn5NeIdmyLJvFYj7kEHG2CzYqdAMR+tvwEy0U1P4lwlXp2+YNb/p+U3aSlR1rpsgPs5g3PT2aBbTIiG0OuWWQPp/cqFrv/EsQZc9nu6WhlvvD/4yPxOarylobFEkSfyPj+nCjPVvE0jCw6EyWB0h8l8ow+SfvYzAGlmz54AZwX1n8xuP5bc5JBDpOf//WqEdh/og==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(110136005)(54906003)(33656002)(5660300002)(52536014)(71200400001)(8936002)(9686003)(8676002)(7696005)(122000001)(6506007)(2906002)(316002)(38100700002)(4744005)(4326008)(38070700005)(186003)(86362001)(508600001)(55016003)(76116006)(26005)(66476007)(66556008)(66446008)(66946007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a4lcRhYZQLymtQcvirpA6C4iQvybnloFcd8ObMFI1JpFAtDYsXmFYT0Oedcz?=
 =?us-ascii?Q?9OTfgHlhgs6QVSEEOxTVGLciv6zmjqTX0AyIpozZKIhgKL44+zpJmkamW8yh?=
 =?us-ascii?Q?CxFZvgDEzs/Vj4G63giuMXilbCCUB7zkkX8EPgi01yoNsbGbyGhlzd4HasGV?=
 =?us-ascii?Q?HXMAxlmKWAKa5nPiJQzKFafeLDDmPXTrrJ8S0IT6aYFVuayaTchHv3XFshQj?=
 =?us-ascii?Q?rAcbMVb173CsTZwu1rA5eV9uKx8qtpBxb15xjlafgT2Vcis7RZZq1mh8awCf?=
 =?us-ascii?Q?QSwH/lEGkK6tU+7PvliWJhc3CVOhH0bVrAyujbW2lkmzZwjZsbYbDLsVIGJ8?=
 =?us-ascii?Q?DAmewWQgv6h0xqVQ7TQ+XmtFmrwbsPq96P9hbjOppLjWFypp9sGcEtV6qJ76?=
 =?us-ascii?Q?VETens+eG3Tkz3fW6uYLh6TKn+chxjqAf9uQfYIh0RiLBnHVewd0xTRE82Xm?=
 =?us-ascii?Q?dIiIrIcdQ26TK0Z0D5t5S4R2N4nn3iuLfFbZnA3xN15Nae3dbiJNq6HEmFtC?=
 =?us-ascii?Q?k4FsaZApIEZyECDomxLibU/cztUqKOCbQ3BAE0IVhd6IwNvHf6I1yGSyMJKL?=
 =?us-ascii?Q?G4P4IPXk2oPsgbQ7vyqIu3T6/lvJ28AL49wkNf4p+TXxj3Ay3Dt//bKKyQss?=
 =?us-ascii?Q?1MMNxZuwD+pJBJAa/HSuxu0XJ2t5pmxA9LoBfCzdZYcr8w+Wlnlp1b6/bMGw?=
 =?us-ascii?Q?uceamjTKPjpCtmYfjWKdubD2gN+yDY2EQDcJCmQc0U7MZzsjuaeNjuFXauMK?=
 =?us-ascii?Q?zx8hkQ6YvklQVO+k0OaIJTnck7l6uIKo+1vMsPTN4KQDaQMrSsauL3H3kghw?=
 =?us-ascii?Q?UQRReaEgWus8X6eJ1acM3PkIXPSDeuRqN5qJYq0AIRU1luWchxqqre+Zghz1?=
 =?us-ascii?Q?toWEk1qowNNlmqKFCOhC43DAZEtsGgBr3AVL835pkQYaWn29GR3BC/P2mf3M?=
 =?us-ascii?Q?ilpFfTd9hRKM90SHefmz7P9dEt0cPdv6Cs8nLNnf35GOcYe8t7Rg4MhCnZFJ?=
 =?us-ascii?Q?+eFfTRJhH6/gLjphiUkKFb8/jsc8/p31rJQOSEixqSWzsYJptejmjF9Vi6eX?=
 =?us-ascii?Q?k3YJKOyda+5k5SuRQTBPGVLe3PBXxZONU0FyP6vviyEmWCdOR6nGXXlH8jmG?=
 =?us-ascii?Q?1QYSemqugfCBrurKmOXwSREclgjX53T0oCmXLzYX9k27WHirIDwHJoZAMfGw?=
 =?us-ascii?Q?lKxD0OnAYLXldTz8yBhrUz7+4y5tXT66PFtfyhapRFi9QUDQwXa+NHRwIsCb?=
 =?us-ascii?Q?PUyipvT1xPBmyA281E4iPHd6dEx0Abcl1067iUSHBwAZHEDvh6a3nkhN/AvD?=
 =?us-ascii?Q?xtI8sMN9kxnOUps4NerTtRQTIfAxMLZkfscDncsTc/Zb2PM2piIj1outvVsc?=
 =?us-ascii?Q?lzOBwfiWnLHGVbeRItjzwwz2wU9KqLynQoQrcR+OpbOXstVVP511JjVzWzOy?=
 =?us-ascii?Q?3+rMdJ95of2IcP2fLG4v6zvClCmw7yRd9NMtrhMVjDL0Zslf5KPr67lg+zDJ?=
 =?us-ascii?Q?xZUEFMaKtIbtGPcCJZyEngYgaoms8qlGZr7H1To+QH46KyOj+r3PLhFmlEDZ?=
 =?us-ascii?Q?7A1UKKbkMMTU5eUuLMMmVvkkMbQnturPYg1vGocb4ykzrQ81wcO5lnZoR5NC?=
 =?us-ascii?Q?mMsU6jyUckuwbN+pEfjZ0OyVkAwB4kVi8rKi4tnrJS+64e2AAPYzWNRjLROK?=
 =?us-ascii?Q?Z7pCWA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b42d319-ae7d-4434-e8db-08d9d6bc6f04
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 17:45:05.3955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gkr6LEXrFt9057qp3TR4d2I7AJI4J6ELz/TlRgh4SREqeN1uGEzH3NUPdu94HTKnoTWNDZYbNQ2EtEPdEifaStACM6v5FMgdi1O678YteYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5951
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
Cc: "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour) till the co=
mmit
7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts callbac=
ks").

After this patch, the screen becomes greenish(may be it is setting it into =
YUV format??).

By checking the code, previously it used to call get_input_fmt callback and=
 set colour as RGB24.

After this commit, it calls get_output_fmt_callbck and returns 3 outputform=
ats(YUV16, YUV24 and RGB24)
And get_input_fmt callback, I see the outputformat as YUV16 instead of RGB2=
4.

Not sure, I am the only one seeing this issue with dw_HDMI driver.

Regards,
Biju
