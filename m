Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFD195EF74
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 13:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7526110E19E;
	Mon, 26 Aug 2024 11:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="h7iQSlcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA7D10E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 11:10:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4BlhXWtpeVaUk2Pk18L+B3eWSxQcpXmZ2bOTgdvY559KncJtRVm4iv+AHgHT78QPW03diwnnF/yuJ2MhAtSTDeAM09AAN1pbIYVynZdDPK90fxRCGHmcn6mFLN7lefT5SWvpfvXHvGROF/JTkhLWRN4aVwciSDvU0XEFCFZpvOhIT7LRoa9d2TLFbqzSTUxvANfwDnWlnKSy35znBeM61e9lomo6ObZGJSfujMgEzdZjER+KeoSO1jmA1QQmGxVp6hE3Jh+IffNVp/qCEH4PhPhXjO7xsw8wlMvZgkKLL9+9UKnUarsjHaU7kTqGF1IoHziEUGtpo5CnNo3Yw0tFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lC+rB4t3gi+epT3QGr0MW0azf3eQVlm2xNRy6cTSy0=;
 b=C26sRtuC9Je8X9III4K3akxyMj4wIE9O+W9YLPFPrzkxDc33GSxATm6UtTS3UWihxN2rwStoK97aKIw6M2wh1Pl6ApJrh7PdAuTEiluVtdl1pcjb7iKyV6Zl2oOjWkFLnHAt7aX7u7L1YMNtA0v9xrzcroQwP4mJFk2rUkdWF3mgJDC5oKjPYHgZOONeHXDtbiBWCuefsrxhd4ftOXFAjrFSZv6bUkXBq3VTNEFFhLex0THQFy5Z5hbK0Ad6NynvS4J9jzQKKNXGFrovxe26P5qFOGbNMli1IrQsKOwLP/LXtbUeoBG/3JQuneJBHl2oAYQEulUlwP8nZhRGFGi2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lC+rB4t3gi+epT3QGr0MW0azf3eQVlm2xNRy6cTSy0=;
 b=h7iQSlcFxlvx1Gsxm3qTCWE8NE+fjlpQPwHcGjdagyJpNxV5j15lAhDOYJXV3h9/S0g3eOGnk9N0/oD+YAdGFEF3sGn0XNE+2HpaiOHbzfUfJchMYLZGjZOPeM46TpM/JEaLRmuZDwQe1UP5hZfgE+yqIWexKM1xcekOeRaqQU0=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYWPR01MB9836.jpnprd01.prod.outlook.com (2603:1096:400:224::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 11:10:44 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 11:10:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Conor Dooley
 <conor+dt@kernel.org>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
Thread-Topic: [PATCH v4 0/4] Add support for RZ/G2UL Display Unit
Thread-Index: AQHa9K+g3b0qbrJ9gkKCaVY3tzZtn7I0050AgAAG5zCAABZqgIAEYKMAgAAWFLA=
Date: Mon, 26 Aug 2024 11:10:43 +0000
Message-ID: <TYCPR01MB1133213BF088B3861ABDAB80A868B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
 <20240823131516.GD26098@pendragon.ideasonboard.com>
 <TY3PR01MB11346F4E01D1FA2688D2799F586882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240823150011.GO26098@pendragon.ideasonboard.com>
 <f5203242-fed4-43e7-8ba4-8f0749f7ade7@ideasonboard.com>
In-Reply-To: <f5203242-fed4-43e7-8ba4-8f0749f7ade7@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYWPR01MB9836:EE_
x-ms-office365-filtering-correlation-id: b8b0e720-c7ef-48c7-99df-08dcc5bfba83
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZktEdFZkMzBrY1ZBZTkzejYvT0U1MllFS2QzV1U3ZWI2aHloMmd3ZWloNkJm?=
 =?utf-8?B?QWQvLzVMWnBwRklxVFFsT1ZZazhldVBwMUtkcDIvQVZIRW9uMjk5UVYzc3VN?=
 =?utf-8?B?Q3R4bkIrMFJzWWRwQUpDNGx6QjNRdlFWYjhZS0NKd2hMREFaSkptNmt6Rm5r?=
 =?utf-8?B?dkU0YzRQeGRHSHJzLzhwRHhiVDFtM2pycXdaL21nQUUvYzlqZFk5Q0Vybnp5?=
 =?utf-8?B?NUdheHM2cWpWcVJZYUJKMkl4NWFTVmliNE1lTGpBdWtBYnZZVkZiSm9EZGFY?=
 =?utf-8?B?T0lKcHl4YSt5ai82QjFnTzY5RGY3UHRXSlJoalRRQUZNdGlzUlZnQjZ1eWs5?=
 =?utf-8?B?d3U5VDZMMVdDQ1dRL1Q2MUdveTU1NS8xd0IwNFhMOGxqUnJqRFBZRTZjTUZm?=
 =?utf-8?B?U3RhRWtGS2hGTkwxdm8xdDNQK0g1bnRoRDhEeUlGTDBKYTdCcVg3NDRUVmhq?=
 =?utf-8?B?Q3NLM1lvOUk3RUc4RlNqRHVtKy90dHFXNUE3MnJza1dib082N2pHcU1KT2s1?=
 =?utf-8?B?MTMxemFRbDk3S2Rpbk5jS1pUSnFBanRtVGpzTVJvTFdxY2l0K0YxLzBpbENv?=
 =?utf-8?B?V0hML2FNck1hWk1VMDg2d0RxcUdsbU9yNFkrQlJDb3BBdndESjlvK3JBNW5z?=
 =?utf-8?B?Rjh2ajNiV2xUNGJQWldEajJzeU12NGhlTGVuaDhEWDhwOTg1M1M1S1ZBT1dD?=
 =?utf-8?B?eGNtQ3hsNHk5TWpyM0JlODdhVkZVUXp0dXZlM1hVR3ZLblZ2cUNpWjNCMGI1?=
 =?utf-8?B?NkhuczUyN0JMWHVQWmppMzY3bnRoWGFzMGJuL2JWamNRRW9ROTE0TkJrUUs3?=
 =?utf-8?B?TDA0MzVjSXViRU1kekJEbmIraTlwWDk0Rk1wUUdpLzFzTHFHM0JFMVAyYVVV?=
 =?utf-8?B?Wkc4eWZNb1BQT0UzSnZvc0dGa0JWVDYvUldhU2UrWGZkaVd1TG9PWXBKQldX?=
 =?utf-8?B?WkJFSUgya0hJSmd3OW5QZFdlNTRBUGY0UGMvMTJBYktxdzFNSi9lTGNrL3h3?=
 =?utf-8?B?dTYxbmRGRzRHeHVqTzlibnpvYWl5bm1PdjRFK0RjU3p2UnRBSHRHTDY4VTN4?=
 =?utf-8?B?SUVnbWVDU0N2UjlzZ3BqUUNDelpEYXhYcURHNmNzYkgyTGEwb2JhTEM2OTkw?=
 =?utf-8?B?TUtnUi9hT3l1b0NhYnlWL1hBSFh0NU9LOHNGSUhpVXQzdXZTdHBQL3ZMRUdj?=
 =?utf-8?B?SU1qdnBHRFdGTGdHNFNvWGN6cWwzSExrT0NjVmhSNS92STF2Y2xWSHp3R3dE?=
 =?utf-8?B?M2lkRnF5Zkw2aW9JVHhsMjc0SjBUL0thS2VoR3RqT2x0TFd5dnJMVCtYQ2dr?=
 =?utf-8?B?VDZFcUJOVDFjeUovbXc1dnlNMTRQbFlhbUswSnI2RGkwakYyQURkL3pPUU9W?=
 =?utf-8?B?VDE0bkdERXJBWGlQa3FKOHJKL2lqVHBGei84K0lBajBHTGorZjcxZmt3YTIw?=
 =?utf-8?B?WWlqbTBZM1d2cVppOHZXcW5wTnpsWkhJT3RMU2RxQ29lNVZob0E3U0wwdW85?=
 =?utf-8?B?VE9xd1NQbG85YWpSUVBHQWoxSVord3ZUaUFFdit4Y25VeXlSbW8zUzNva1RV?=
 =?utf-8?B?elZrK1puR0twWUY4WURsVW5WeGlmRWZSbERxcVh4SnRLYXRJVi9SYnlEMzE0?=
 =?utf-8?B?TDNhR0ZFcUE5TUZwWlk1VWhvc3Jzd2dJVDhwVmpSdkQxWGFleWpCK0ZMUENS?=
 =?utf-8?B?VG5xR2pTcm9zRVFLRjdQWERzZHJGN2dDQStPcVVGbFVzM3ovK090b01xLzlW?=
 =?utf-8?B?ZFE2NEZCZStQWmx5VnZwTVhmaTNjemd0K0M4ejZ2Kzd1M1lGKzZ4V096QmR1?=
 =?utf-8?Q?5o1xnU2uZ/HXChBmsgSilRALHPSkfRWxxTBrY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTEwZkxCQUYvTy9vRU9EemlRbWxwV3RYRzBxOGh4RSt0dWJTUnpwS0d2a1g5?=
 =?utf-8?B?SjhUOG5XWi94N25YK3NqZEkyL1d4UHQ4YXpIREIzU2pMTC9ZZUdQdkdxOGRE?=
 =?utf-8?B?R0ptTXpNVHE3T0E1eU5mVnRjR3dKN1RJVmROVTRqaXplZmxUd1MwZVhmRlVj?=
 =?utf-8?B?THhLc0YyNFpwRG5ReDVvWlUzL1BTSWpweHJSNTdtME1LdGZETGlVMDFjNmVC?=
 =?utf-8?B?dFp2WUxZaDNCSjFDOS9FN3F4MndJYlJoSGk2MlpKODNsZERXTCttVko5bEZN?=
 =?utf-8?B?eFVTQ1hxaVpPcjRJU09nVUpraXBFMFFNcUU0YlBaU3B1YTJOTjV4blVsNXpX?=
 =?utf-8?B?YUxHTXBlYkJkMkFQcndKN3BrYVBBWENnOXhtMy95RFZCMjd1QmVhRWgzTENT?=
 =?utf-8?B?V3NVZ3ZMTWhXQzcyVlhwckVvbDV1bnd1NDg0K21UalNtaHR1NmZjSlhjMWVJ?=
 =?utf-8?B?blVuR1E3eGY4bnhFbmxQbFNqRkFKeG9jYS9SQ05jVkQrcnBmWVVRTWpNL3hv?=
 =?utf-8?B?NkUxSXJoT2Vhd2tRVUNsYW11RmI1SUU5TitnU2JPVEhjLzNUSGI3RTNrV3pU?=
 =?utf-8?B?TWliYWtZSWpYelVsUGF0OHdGZ1hoZEpEdU5PTDVXUVNldnJYQzJFa2FDOXMy?=
 =?utf-8?B?YlU4bTJuYVl1K0Jka3F3bVNkVUZEenQwQU5OZFF5SFBhOUNOSVBZV05xU0hv?=
 =?utf-8?B?bDl0T0NVdzBVQTk0enlsU0hkMFlFWGtPTVZIYllUMU8yMzR3MkhDOUlTQmNn?=
 =?utf-8?B?TjVGMFlVcEgzQWFjd2treURQWVNxSDFwZW0zdDAvOXkwVWswa290ZVdoYmYz?=
 =?utf-8?B?QkFBSjM1TjJLaEtPMHlQdzU5TDBCT25xYllUY3V0ZkZjd0NiV1JKQnJSYWRx?=
 =?utf-8?B?TSs5bjVkSzNReFBVdG5SOEFMeWxta1NsN0Q5ZFp0YWU4NlFiTkxHdnFJQ25n?=
 =?utf-8?B?SVRNR2Izbk1vVXJyVmh5N0c3V2dvZVJCMjNSR2VXY2UyVUswalVhTkYyajho?=
 =?utf-8?B?YnR6eXBUTk45MFE1ekRlenlPK3NLR0lIZ1lOQkNrNHozR2ZkTGJIeGFjZGty?=
 =?utf-8?B?bThjTEtFRjlKZGNSV1RSdHZGOExUWW1KV29ySFhIdWtxd1RaT0JtbDRTbjdE?=
 =?utf-8?B?LzBNK2x5VEJneG94TnpCR09nNUVEaWowcVQvcnlQR09hcDE4R09Nblh2ZjFB?=
 =?utf-8?B?d0tlSlp2RWV0NlZlU2RWZnAvZDBwQVNzR2huQ2JCUFlFTnVuakxKQ3l2LzJV?=
 =?utf-8?B?SnRNQmZ6N0FqTWZNcmhsOHQyWVA2aFhiSVh1VnNCMzRHTlZiSHhsMUpyL3lK?=
 =?utf-8?B?QnNObGVENWN0d1c4ZlZzNnhGREltQXJiNDdMYkRlQjBiSnB5T09MN2p2amtp?=
 =?utf-8?B?ejBLa0pubWdyS1VxbDl4OG9ra2ZHRjE4SjJLd211S3hQTW1USExFWGdvWGVx?=
 =?utf-8?B?L0NTVkFpVFNOUk1zcU9pQnA2SUlWdkNYMFlDSnVuYU5TWUViTWlyWnNwUisz?=
 =?utf-8?B?ZUxZMnhNNC9nVlkvVFRHeXk1dG5BYTFSRXBPRnlVWC93RE52d25HdlVpd2Zm?=
 =?utf-8?B?VXdUdmVNKytxZzZ2dnkzTUxkU21tMzE3OURhSm96UnZKcUgvU0RHeUVhU3BU?=
 =?utf-8?B?ZTFweE9QYlVNcFE3eHFualVrdlcvRit1SzVLb29SZXdYNGpHd1hRQ2tsZVpV?=
 =?utf-8?B?WEhqWFRKU2lTUk5pWnVONktXNU45Qk95cTNNVWQzcVpGa0xYU3ZjTFV6ZmRN?=
 =?utf-8?B?S2QxVXJPRlU4UXZzcVRuRzcxS2xxU1Arb0ZsQ1h3ZUUyYXMycW9RaHFmME1Q?=
 =?utf-8?B?ZjBvMGVCMklmTGxqanBvMGNpZ2NsNUR4NmcyOGlNOXFCMVlDWUZlV3JUMys1?=
 =?utf-8?B?a01Gc1IzSXQrMEg4RHhpd0tVb1NLQURKQ3R5NEdRcURhenl4dTBUK3pjcnlJ?=
 =?utf-8?B?Tys1QUtQazBPODlZZDdrM0t0SzJqejg4Y3dXQkJUTElYTkY3ZkVubTdyZFJu?=
 =?utf-8?B?VnFKQjB1SnBENkxkRTJQMmJDT1dWUitpNWp1U3FGTUU5dm5waG5YbFE2RFRD?=
 =?utf-8?B?eDVveFN3Rm5semYzc2N1OVZxbzBXd2poUHlrb09kWnRhL0kvVlUzaDgwRjQ5?=
 =?utf-8?B?MHlLQTNHVFo3K3NwOFFXTVFQVThpUjhqYmtNR1pVYlJHMGpKSkpmUmI4bXV1?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b0e720-c7ef-48c7-99df-08dcc5bfba83
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 11:10:43.8094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XdswOj1hD1aNr4MgLm1CbJE1nP1Q/g0cSn7Jjhc0cqOg9jPJNdaS2+l84ydL1kdUqgg9f3LjiuSugyVVHGm5W+cju5U+u9HYhHmaQU3qqAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9836
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0
IDI2LCAyMDI0IDEwOjUxIEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMC80XSBBZGQgc3Vw
cG9ydCBmb3IgUlovRzJVTCBEaXNwbGF5IFVuaXQNCj4gDQo+IEhpLA0KPiANCj4gT24gMjMvMDgv
MjAyNCAxODowMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPiBIaSBCaWp1LA0KPiA+DQo+
ID4gT24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgMDE6NTI6MTRQTSArMDAwMCwgQmlqdSBEYXMgd3Jv
dGU6DQo+ID4+IE9uIEZyaWRheSwgQXVndXN0IDIzLCAyMDI0IDI6MTUgUE0sIExhdXJlbnQgUGlu
Y2hhcnQgd3JvdGU6DQo+ID4+PiBPbiBUaHUsIEF1ZyAyMiwgMjAyNCBhdCAwNToyMzoxM1BNICsw
MTAwLCBCaWp1IERhcyB3cm90ZToNCj4gPj4+PiBUaGlzIHBhdGNoIHNlcmllcyBhaW1zIHRvIGFk
ZCBzdXBwb3J0IGZvciBSWi9HMlVMIERVLg0KPiA+Pj4+DQo+ID4+Pj4gVGhlIExDRCBjb250cm9s
bGVyIGlzIGNvbXBvc2VkIG9mIEZyYW1lIENvbXByZXNzaW9uIFByb2Nlc3Nvcg0KPiA+Pj4+IChG
Q1BWRCksIFZpZGVvIFNpZ25hbCBQcm9jZXNzb3IgKFZTUEQpLCBhbmQgRGlzcGxheSBVbml0IChE
VSkuDQo+ID4+Pj4NCj4gPj4+PiBUaGUgb3V0cHV0IG9mIExDREMgaXMgY29ubmVjdGVkIGRpc3Bs
YXkgcGFyYWxsZWwgaW50ZXJmYWNlIChEUEkpDQo+ID4+Pj4gYW5kIHN1cHBvcnRzIGEgbWF4aW11
bSByZXNvbHV0aW9uIG9mIFdYR0EgYWxvbmcgd2l0aCAyIFJQRnMgdG8NCj4gPj4+PiBzdXBwb3J0
IHRoZSBibGVuZGluZyBvZiB0d28gcGljdHVyZSBsYXllcnMgYW5kIHJhc3RlciBvcGVyYXRpb25z
DQo+ID4+Pj4gKFJPUHMpDQo+ID4+Pj4NCj4gPj4+PiBJdCBpcyBzaW1pbGFyIHRvIExDREMgSVAg
b24gUlovRzJMIFNvQ3MsIGJ1dCBkb2VzIG5vdCBoYXZlIERTSSBpbnRlcmZhY2UuDQo+ID4+Pj4N
Cj4gPj4+PiB2My0+djQ6DQo+ID4+Pj4gICAqIFJlc3RvcmVkIHRoZSBwb3J0cyBwcm9wZXJ0eSBm
b3IgUlovRzJVTCBhbmQgZGVzY3JpYmVkIHBvcnRAMCBmb3IgdGhlDQo+ID4+Pj4gICAgIERQSSBp
bnRlcmZhY2UgaW4gYmluZGluZ3MgcGF0Y2guDQo+ID4+Pj4gICAqIFJlc3RvcmVkIHRhZ3MgZnJv
bSBHZWVydCBhbmQgQ29ub3IgYXMgdGhlIGNoYW5nZSBpcyB0cml2aWFsDQo+ID4+Pj4gICAgIChS
ZXBsYWNlZCBwb3J0IDEtPjAgZnJvbSB2MikuDQo+ID4+Pj4gICAqIFVzZWQgIiYiIGluc3RlYWQg
b2YgIj09IiBpbiByemcybF9kdV9zdGFydF9zdG9wKCkgZm9yIHNjYWxhYmlsaXR5Lg0KPiA+Pj4+
ICAgKiBSZXN0b3JlZCBwb3J0IHZhcmlhYmxlIGluIHN0cnVjdCByemcybF9kdV9vdXRwdXRfcm91
dGluZw0KPiA+Pj4+ICAgKiBVcGRhdGVkIHJ6ZzJsX2R1X2VuY29kZXJzX2luaXQoKSB0byBoYW5k
bGUgcG9ydCBiYXNlZCBvbiBoYXJkd2FyZSBpbmRpY2VzLg0KPiA+Pj4+ICAgKiBSZXN0b3JlZCBw
b3J0cyBwcm9wZXJ0eSBpbiBkdSBub2RlIGFuZCB1c2VkIHBvcnRAMCBmb3IgY29ubmVjdGVkDQo+
ID4+Pj4gICAgIERQSSBpbnRlcmZhY2UuDQo+ID4+Pj4gdjItPnYzOg0KPiA+Pj4+ICAgKiBTcGxp
dCBwYXRjaCBzZXJpZXMgYmFzZWQgb24gc3Vic3lzdGVtIGZyb20gRFUgcGF0Y2ggc2VyaWVzIFsx
XS4NCj4gPj4+PiAgICogUmVwbGFjZWQgcG9ydHMtPnBvcnQgcHJvcGVydHkgZm9yIFJaL0cyVUwg
YXMgaXQgc3VwcG9ydHMgb25seSBEUEkNCj4gPj4+PiAgICAgYW5kIHJldGFpbmVkIHBvcnRzIHBy
b3BlcnR5IGZvciBSWi97RzJMLFYyTH0gYXMgaXQgc3VwcG9ydHMgYm90aCBEU0kNCj4gPj4+PiAg
ICAgYW5kIERQSSBvdXRwdXQgaW50ZXJmYWNlLg0KPiA+Pj4+ICAgKiBBZGRlZCBtaXNzaW5nIGJs
YW5rIGxpbmUgYmVmb3JlIGV4YW1wbGUuDQo+ID4+Pj4gICAqIERyb3BwZWQgdGFncyBmcm9tIENv
bm9yIGFuZCBHZWVydCBhcyB0aGVyZSBhcmUgbmV3IGNoYW5nZXMgaW4gYmluZGluZ3MNCj4gPj4+
PiAgICogQXZvaWRlZCB0aGUgbGluZSBicmVhayBpbiByemcybF9kdV9zdGFydF9zdG9wKCkgZm9y
IHJzdGF0ZS4NCj4gPj4+PiAgICogUmVwbGFjZWQgcG9ydC0+ZHVfb3V0cHV0IGluICBzdHJ1Y3Qg
cnpnMmxfZHVfb3V0cHV0X3JvdXRpbmcgYW5kDQo+ID4+Pj4gICAgIGRyb3BwZWQgdXNpbmcgdGhl
IHBvcnQgbnVtYmVyIHRvIGluZGljYXRlIHRoZSBvdXRwdXQgdHlwZSBpbg0KPiA+Pj4+ICAgICBy
emcybF9kdV9lbmNvZGVyc19pbml0KCkuDQo+ID4+Pj4gICAqIFVwZGF0ZWQgcnpnMmxfZHVfcjlh
MDdnMDQzdV9pbmZvIGFuZCByemcybF9kdV9yOWEwN2cwNDRfaW5mby4NCj4gPj4+Pg0KPiA+Pj4+
ICAgWzFdDQo+ID4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNzA5MTM1MTUy
LjE4NTA0Mi0xLWJpanUuZGFzLmp6QGJwLg0KPiA+Pj4+IHJlbmVzYXMuY29tLw0KPiA+Pj4+IHYx
LT52MjoNCj4gPj4+PiAgICogVXBkYXRlZCBjb3ZlciBsZXR0ZXIgaGVhZGVyICJEVSBJUC0+RGlz
cGxheSBVbml0Ii4NCj4gPj4+PiAgICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24gcmVsYXRl
ZCB0byBub24gQUJJIGJyZWFrYWdlIGZvciBwYXRjaCMzLg0KPiA+Pj4+ICAgKiBBZGRlZCBBY2sg
ZnJvbSBDb25vciBmb3IgYmluZGluZyBwYXRjaGVzLg0KPiA+Pj4+DQo+ID4+Pj4gQmlqdSBEYXMg
KDQpOg0KPiA+Pj4+ICAgIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiByZW5lc2FzLHJ6ZzJsLWR1OiBE
b2N1bWVudCBSWi9HMlVMIERVIGJpbmRpbmdzDQo+ID4+Pj4gICAgZHJtOiByZW5lc2FzOiByei1k
dTogQWRkIFJaL0cyVUwgRFUgU3VwcG9ydA0KPiA+Pj4NCj4gPj4+IFRoZSBmaXJzdCB0d28gcGF0
Y2hlcyBsb29rIGdvb2QgdG8gbWUuIERvIHlvdSBoYXZlIGFjY2VzcyB0bw0KPiA+Pj4gZHJtLW1p
c2MsIHdpbGwgeW91IHB1c2ggdGhlbSB5b3Vyc2VsZiwgb3IgZG8geW91IGV4cGVjdCBhIG1haW50
YWluZXIgdG8gcGljayB0aGVtIHVwID8NCj4gPj4NCj4gPj4gSSBkb27igJl0IGhhdmUgYWNjZXNz
IHRvIGRybS1taXNjLiBJIGV4cGVjdCBhIG1haW50YWluZXIgdG8gcGljayBpdA0KPiA+PiB1cChN
YXliZSB2aWEgcmNhci1kdSB0cmVlIG9yIGRybS1taXNjIHRyZWUpLCBvciBlbHNlIGlmIGl0IGlz
IG9rLCB3aGF0IGlzIHRoZSBwcm9jZWR1cmUgdG8gZ2V0DQo+IGFjY2VzcyBmb3IgZHJtLW1pc2Mg
dHJlZT8/DQo+ID4NCj4gPiBZb3UgY2FuIGZpbmQgaW5zdHJ1Y3Rpb25zIHRvIHJlcXVlc3QgZHJt
LW1pc2MgY29tbWl0IGFjY2VzcyBhdA0KPiA+IGh0dHBzOi8vZHJtLnBhZ2VzLmZyZWVkZXNrdG9w
Lm9yZy9tYWludGFpbmVyLXRvb2xzL2NvbW1pdHRlci9jb21taXQtYWMNCj4gPiBjZXNzLmh0bWwN
Cj4gPg0KPiA+IFRvbWksIHRvIGF2b2lkIGRlbGF5cywgY291bGQgeW91IHB1c2ggdGhlIGZpcnN0
IHR3byBwYXRjaGVzIHRvDQo+ID4gZHJtLW1pc2MgPw0KPiANCj4gSSBoYXZlIHB1c2hlZCB0aGUg
Zmlyc3QgdHdvIHBhdGNoZXMuDQoNClRoYW5rcyBUb21pLg0KDQpDaGVlcnMsDQpCaWp1DQo=
