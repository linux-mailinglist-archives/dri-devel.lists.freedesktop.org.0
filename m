Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC3199C24E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0E610E3B0;
	Mon, 14 Oct 2024 07:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RzZJ20U9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B3B10E3B0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:58:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsionu7PMdw0GyEYoH3ztZHNzlkdxHeMH/zDf7HSpvy8YftF+czpHevapKLjhbEMGtCvvHW9u3qS9eG0bfqDegQzkXIdqj07K7DxT8c2TF9eInjGV6M254dvYU8wfIaM11mC6qWeNLuzoOfpPIBP3pH4DSlxLLJmGqMGYVTbmoVfBNiJPEj2d0EMgNgx1OCbBKDgRcJK2/DF7CWfdKVwFGYkPe40v8hx4yYPP0lPDCUhqEGscZr1ZYTZmOrM7bML/vCpT7sOwEEgNTltqT+1nU94+v2+aQcKPjt+9TkZNzwGffXzGedHFlTkWRZYTuxAe47ptMble47nDSs0bGirsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DevDmQh5ddccANShg226xhCeXdESZUkGidiS5berPoI=;
 b=tcKJTCXDw1/rIl5RJkAv3GEhI9ttg+orX9bkaNsKwpUYRDVm5nZxEMD6wF3LZATYbPCzqIYDWbJuHMPnLS/raHIuUCBMCJIAKKP4tQNznkDo+ZjUbR4Y9WpEAokvvhlQGz3TgNxZVpKqSw1tT3OWzXRVK6zH/96OjNQKn7IL7J0gGDKYAF2MrokOkA4kWL6J4OUwl/jOBLtPsQjatQpTN6WQVdTvI57ZPfALfpEXjJNFQcXpmtUVnlcWuK02CrWOLCqt6BJMlOe1j7Kn0R21RGkYzTX18vEvRH8gWRCtuxSm8yIIpJL4MN82k1WSbSGSILFaJfO9zFxDQr2AMILX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DevDmQh5ddccANShg226xhCeXdESZUkGidiS5berPoI=;
 b=RzZJ20U9jDesRDkm7kxB0ZBwcLmxaFunz+iWZ3DR8FrWtPO9+hZGgtJ15kDWNd6ZUFu/kp4F/QewJIkiRrdq/iGIWagPmSPml49iifZj5PnyByx0UcAn7D/9E/C5nofg4isjMg29/KrM8XKHmN/8D6oo67xISAiIXzONsO7ot1U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB11117.jpnprd01.prod.outlook.com (2603:1096:400:36b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 07:58:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 07:58:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se"
 <jonas@kwiboo.se>, "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "y.moog@phytec.de"
 <y.moog@phytec.de>, "marex@denx.de" <marex@denx.de>,
 "isaac.scott@ideasonboard.com" <isaac.scott@ideasonboard.com>
Subject: RE: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
Thread-Topic: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
Thread-Index: AQHbHHmcAQrmzLsoUU25rfXdj34z0LKCyOiAgAAMWYCAAoXDgIAAYU0AgAAhkXCAAAa6IA==
Date: Mon, 14 Oct 2024 07:58:51 +0000
Message-ID: <TY3PR01MB113460C5EF7E6760DD5966BA886442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241012073543.1388069-1-victor.liu@nxp.com>
 <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com>
 <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com>
 <TY3PR01MB11346530A53C8085561713B6086442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346530A53C8085561713B6086442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB11117:EE_
x-ms-office365-filtering-correlation-id: b1680d6e-74f3-4138-1eb7-08dcec260af5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dk1uYkpxSW94cmlacjh3VVg1c0plWEFFZEhGdEs4VWpZaVdjNE83S2JzTmcx?=
 =?utf-8?B?dk1DMHlSV0Nka0l0bUR0azFIZU95K2dwTE15NXhqa0hKZ2VNbW9Mb1VKLzFZ?=
 =?utf-8?B?NDRsNTIwOWpudFBRRVRkT3h1aXFtVDlScnVHU2FSbDNUQWUvZlZ2VDEzMjF3?=
 =?utf-8?B?WVVGeXZaU2x2ZmhENm8rYktFM09BcTFLemYvRElTcEJ0dU15SVcrZFlIUVVS?=
 =?utf-8?B?UElhT0YveEltZ2lIbkNmcUIzTkw0YlNWaERoVTZaYmg5dWtXcFBGRnlzamFp?=
 =?utf-8?B?amlLQW5MSEFubEhWU2pLWDRtc0RXNUNNdERTVHlNOXZSSmlMUzRBQUlia0dr?=
 =?utf-8?B?U0JoTmNxQTBhTUg5bC83ejlaVlJwWTQ2TVpmYWlNbU0ra09EQXdCcTV5YzdR?=
 =?utf-8?B?Y3cybzFTVThacDF1MFdYQ0xUcElyNU5jSlFWRDNpTjNTU1ZYU3JKWDlySUs5?=
 =?utf-8?B?T2ZrQlRRU3NUM05DalhQV2ZGY1ZvazlsUHhaTDArTFFnRklzUFg0cjRNNkJz?=
 =?utf-8?B?MzVYMVpiUUEydFNvc052T1dtMDhJVVV3d1VGQnBSblRqNjQ1SkY5WDlpYzMv?=
 =?utf-8?B?dzE1UVhjRGZ1ejYrM1Z0QUMwWDZFNUZldkhUbS9QQStyd05UZ3BQS2pMbEtQ?=
 =?utf-8?B?MXJUeW42SmpoZFROY1pMNmxlMEhzR3ZTNHZsM3NReVhORCtZQXMrdTVHdlVj?=
 =?utf-8?B?Uk5wZzZxNUJPdklwMkVteVRsbFYxL0NDdEozVzZ5WDFaSk1oTjh0bmdpRnJW?=
 =?utf-8?B?SnpOTVZZajJYcm5NSGZGaVRRZWVEVFh5ckQ1YXJUQ1Z5K1BuUWJOSUsrVTFR?=
 =?utf-8?B?QWZGQ0YrOUIzVWhLcEpVOFI3ejlQTHhLaGlJZkpOZHBMN2F2UCs1OXI2bGIz?=
 =?utf-8?B?TGN3c1U4dEJFeW5PcHlzZUR3ekE2WGRrMnBGMStBR3JhN2R1ZkhEczZITGQ3?=
 =?utf-8?B?SC90bXVtb2tpQ2kycTFrQ1NxTlRlc04yRGc5YUdVT25CQmNKSXNXalp1SW04?=
 =?utf-8?B?TVJnOU1lbytUdnd6TFJiSGhUVjNPSTBQcWFRY1ErNVFZLzFxTHlMclNibjZk?=
 =?utf-8?B?VXo5bzNVNngvS3NJWnU2NGozaW9jZVM2ZnZPb1VJcWhwYS9wT0M3dFg4WStP?=
 =?utf-8?B?aGlpSjJZaTU5WitCSFROb2Y0TXZIMnN4VEx0SjJkazNKZGtJS0ExUzFneDJ3?=
 =?utf-8?B?bS9WZE5tOStiOHB4cnpQand4RXlkSmF2WTF2QmJMQlZvRjNYcmI1b0FKNURa?=
 =?utf-8?B?RExTSHVndTlaMGduTnVTdHFpR2RJTmZjRW5xRVRGTlh5UjZBU0VzdG9aVUVP?=
 =?utf-8?B?TmU4SGN4WXYweElMRjhVYVVHU3M3aVFWMnMrK1FkWWtJcTV1Q2RBTVBvODBx?=
 =?utf-8?B?SHdicjVnclpuUGJkTXlnUnU4b1FWTzNRNVdNeThYK1ZJbXorN3FwS1NORVEw?=
 =?utf-8?B?OEVrN08xaytuYnRrZlVrYXRCcU1hdTQxMlRpQ252blFUS3h1cmljVGt1SVY3?=
 =?utf-8?B?MkNJSnRxUGt3bjJiNi9VTDdVMEE5cit0bmpyUGl1RS9aaEpOa00zNk05WEYr?=
 =?utf-8?B?aGZRV3MyYWc2QTFYd0lsVWlVMVkvcWxOQ2laV2tsNU1zRmwrelloQzZrUTZr?=
 =?utf-8?B?ckhrY0NMbWt1dnZHSmNXWC9KSGtKZUtuWFludjJLaG5TaUE0ZTJKTzAyejZQ?=
 =?utf-8?B?Q09qQlVYcko1VCtVbTZwVXl0RzRVZloyck9NN3Q3YmF3UytMZVV4RStRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WStGcUs1NFVGSU93UEMybGp4QThCRUhCQ0lydHRKZ0tQM05lUTlwUGlpalNp?=
 =?utf-8?B?aGNyVlp3REw1WEUvWHZXRDFoQURZby9STEs3bEpURTlPS2dGZVo4YmN1RGFY?=
 =?utf-8?B?dG1lbkdvUUZ6dEt5bUY4SkdoZjNEdzRvdmFSTndPNzZ5dWQ5MEN5T3Z3TDlI?=
 =?utf-8?B?a0tEM2ViMnBHUjlZQTVMYTJWQ0diZXNaaVlHZ05jeVZCU1pRYWdiM1RLalcw?=
 =?utf-8?B?cFA2WUk2UnhPaGR4aHRESlhwZS9OTHhVNmZ5Yk4rUWFWcjU1VlZhSDRVSFBt?=
 =?utf-8?B?ZmdGWWc2WFZjVXA1UTF4WnUrNTRkZUdsdWlmUHg0b3AxcEt5enVYWGt5TElM?=
 =?utf-8?B?TXJ1bHZpcWxTbDNCcnZhRzZId0g1Z2ptZWlSN3RxWXQ3MHpyK09wR2NnU3M0?=
 =?utf-8?B?Zk9qVzgrOURXd0p2NEFTYTdlYlhEZVcxRWFBVGxmSmpkUHJVYXhVWG02YU1G?=
 =?utf-8?B?bmNmQlJjeVR6TzZ3dkc1ZSs4Qm9FRWMxUDFndHNacERkR2htM1FacEpTejlC?=
 =?utf-8?B?RXkvTk8zMjVwRmZmdC9lb0VjMXZmUy9kL2MwVVFqbkNiSDVMVVo0OFdLaDly?=
 =?utf-8?B?bFF0dEpOQlNSRDdmVmI1UGpCMTZoVkxHQitocDNOdjR4U3lVNEp6aVdxZith?=
 =?utf-8?B?YTc1WmUyN0JTRjZLVlJDTkVxaFgvaVBnWE5ydWdwUHNzN2Y5M1BIUDRzMW1m?=
 =?utf-8?B?TkYzekd1V0hNaDdGeEZQTXNndnhTbDRRaGJPVm8wSE40aklpcWVHVWtrWmR3?=
 =?utf-8?B?VWdoS3MyMUo1cURHaXFDeU14OVNGVktTV1A0SUI1dUp1OC9PaTJML25SWlM4?=
 =?utf-8?B?NjRDbjI0NEhkWmU3UnMrWHp5QkxiS0UxWlgyaDkzM0JvYm5oWTNHYVY1elFU?=
 =?utf-8?B?MkllUUd1Q3ZCQytvbmJpL3FGcC9sRDdtWG5BdnlVMEFNSDAvN3JPalo5TWtN?=
 =?utf-8?B?VGJZVHhGMFNSSFJyWkxrVFEyS04xYXk5d2FRRm5VQXBqMEhSclUzZGdhNnJS?=
 =?utf-8?B?R0JySFZkbFV5c1ExVlFRMWRnREpsOGxualJVTnVHUEpybFRmSHFXT1VEckpD?=
 =?utf-8?B?WmltaHg5VXIyWXZFTll1SGN5aFpDRy9jNDAwbEIyN3RTQ25TUlJ1di8yQWlV?=
 =?utf-8?B?UXFSbWJxQUZmN2VUK2hvaHUrRlNEY0UyQVF0QmhLNVNUanQwSzQ5Z0VRbUZs?=
 =?utf-8?B?KzV5OWxtNHRROVFzRFJZaE9HdjZySzRNUTNmTGV5eXNoV3QzUHlrTHJqSm9L?=
 =?utf-8?B?L01JS0R1YnFBa2F2UVBoaVQyREZtOUt3QldnTXFYTnpiZ3hMZTMvaWNRQXdB?=
 =?utf-8?B?Qmo0WDhQRXVldnY3UGdtTVJ3WGdITk42bjlUZWJxNmxjMEtDeEwrRUVVTEJu?=
 =?utf-8?B?RWVrR0xMejNOWVhQMDFMbHBYTG1VcnZ0RjdMaXdHSlFYZDlwcFkvUTJFUmM2?=
 =?utf-8?B?MG94N2owOGV3cWFIcnUySk5KbC9SNUVnYWhEc3dXejlGNzYxR2FLYk1kcnEw?=
 =?utf-8?B?RVVNVkZteElKSVRnZ1BDMFJXNnVWZTFpckZCQnhBREg1WnA5MUdOVHpvYTdr?=
 =?utf-8?B?bFlpYTNrcWVYdUdBbGFnbzRJMkNxUjJVakZWNzBwV2tKT0IwMzNta0Q2Zi9P?=
 =?utf-8?B?aFk4a0lFTVZBT0dQYlRaZ3lMV3hZcWorUXlSTm1vK1hNdDBnS0ViclZlcUxF?=
 =?utf-8?B?d25NRkoxcHc3emdNUGt5Vi94TE02eHNtSzlCVFZ0eWFKRTRxWk5EZUMyaVlX?=
 =?utf-8?B?bGRXVlNWVnFrR1FVSUNKSG9XSmxxenpzck8xaFluNG0zMG01WVkxU0ZUV2hi?=
 =?utf-8?B?b1Z2amViMWs0MXhSeUZVT3JINnJuUW85M1VXK2gyTHd2K2N1dWlFVXFSS2hM?=
 =?utf-8?B?YnNsa0tUTlRuVCtialNzTHJrbWNmLzBlWmRUSllGVGtROXFua040NFZkL3Vx?=
 =?utf-8?B?NjlFMDk1WUZyOUVJa0QzU1lEbE52UjNUWm85NWI2MGU3OXVNc2dGOHZGajhT?=
 =?utf-8?B?WHk0UzNmTFk0K29tOVJORmkxR2lUN0JCVEFKMDJja0RsZkpXWkt6VklwT1ZM?=
 =?utf-8?B?a3BMZ3BLelB1WUtaUjNwczJjUFlrVXpBSnNMMEw1ZVdMMnhRU3JaUjJVRTZH?=
 =?utf-8?Q?3jyTUXYBHGGyvbtHZmJR43gU8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1680d6e-74f3-4138-1eb7-08dcec260af5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 07:58:51.6229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTGyZ3HORkoQtHB1AkKcHCfzWjBfE59PehHCDk2L9r7kzxDivoCc1Ml4CqforfPkUcXN3YbUy62RThxzsRcXa2T55mCudBzyMFQUoTRMmbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11117
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmlqdSBEYXMNCj4gU2Vu
dDogTW9uZGF5LCBPY3RvYmVyIDE0LCAyMDI0IDg6MzkgQU0NCj4gVG86IExpdSBZaW5nIDx2aWN0
b3IubGl1QG54cC5jb20+OyBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFy
by5vcmc+DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gaW14QGxp
c3RzLmxpbnV4LmRldjsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBhbmRy
emVqLmhhamRhQGludGVsLmNvbTsNCj4gbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZzsgcmZvc3NA
a2VybmVsLm9yZzsgbGF1cmVudC5waW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPjsNCj4gam9uYXNAa3dpYm9vLnNlOyBqZXJuZWouc2tyYWJlY0BnbWFpbC5jb207IGFp
cmxpZWRAZ21haWwuY29tOyBzaW1vbmFAZmZ3bGwuY2g7DQo+IG1hYXJ0ZW4ubGFua2hvcnN0QGxp
bnV4LmludGVsLmNvbTsgbXJpcGFyZEBrZXJuZWwub3JnOyB0emltbWVybWFubkBzdXNlLmRlOyBy
b2JoQGtlcm5lbC5vcmc7DQo+IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9y
Zzsgc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj4ga2VybmVs
QHBlbmd1dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207IGNhdGFsaW4ubWFyaW5hc0Bhcm0u
Y29tOyB3aWxsQGtlcm5lbC5vcmc7DQo+IHF1aWNfYmpvcmFuZGVAcXVpY2luYy5jb207IGdlZXJ0
K3JlbmVzYXNAZ2xpZGVyLmJlOyBhcm5kQGFybmRiLmRlOyBuZnJhcHJhZG9AY29sbGFib3JhLmNv
bTsNCj4gby5yZW1wZWxAcGVuZ3V0cm9uaXguZGU7IHkubW9vZ0BwaHl0ZWMuZGU7IG1hcmV4QGRl
bnguZGU7IGlzYWFjLnNjb3R0QGlkZWFzb25ib2FyZC5jb20NCj4gU3ViamVjdDogUkU6IFtQQVRD
SCB2MiA1LzldIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBicmlkZ2U6IEFkZCBJVEUgSVQ2MjYzIExW
RFMgdG8gSERNSSBjb252ZXJ0ZXINCj4gDQo+IEhpIExpdSBhbmQgRG1pdHJ5LA0KPiANCj4gPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IExpdSBZaW5nIDx2aWN0b3IubGl1
QG54cC5jb20+DQo+ID4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDE0LCAyMDI0IDY6MzQgQU0NCj4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDUvOV0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IGJyaWRn
ZTogQWRkIElURQ0KPiA+IElUNjI2MyBMVkRTIHRvIEhETUkgY29udmVydGVyDQo+ID4NCj4gPiBP
biAxMC8xNC8yMDI0LCBEbWl0cnkgQmFyeXNoa292IHdyb3RlOg0KPiA+ID4gT24gU2F0LCBPY3Qg
MTIsIDIwMjQgYXQgMDU6MTQ6MTNQTSArMDgwMCwgTGl1IFlpbmcgd3JvdGU6DQo+ID4gPj4gT24g
MTAvMTIvMjAyNCwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gPiA+Pj4gT24gU2F0LCBPY3Qg
MTIsIDIwMjQgYXQgMDM6MzU6MzlQTSArMDgwMCwgTGl1IFlpbmcgd3JvdGU6DQo+ID4gPj4+PiBE
b2N1bWVudCBJVEUgSVQ2MjYzIExWRFMgdG8gSERNSSBjb252ZXJ0ZXIuDQo+ID4gPj4+Pg0KPiA+
ID4+Pj4gUHJvZHVjdCBsaW5rOg0KPiA+ID4+Pj4gaHR0cHM6Ly93d3cuaXRlLmNvbS50dy9lbi9w
cm9kdWN0L2NhdGUxL0lUNjI2Mw0KPiA+ID4+Pj4NCj4gPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IExp
dSBZaW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4gPj4+PiAtLS0NCj4gPiA+Pj4+IHYyOg0K
PiA+ID4+Pj4gKiBEb2N1bWVudCBudW1iZXIgb2YgTFZEUyBsaW5rIGRhdGEgbGFuZXMuICAoQmlq
dSkNCj4gPiA+Pj4+ICogU2ltcGxpZnkgcG9ydHMgcHJvcGVydHkgYnkgZHJvcHBpbmcgIm9uZU9m
Ii4gIChSb2IpDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRn
ZS9pdGUsaXQ2MjYzLnlhbWwgICB8IDI3NiArKysrKysrKysrKysrKysrKysNCj4gPiA+Pj4+ICAx
IGZpbGUgY2hhbmdlZCwgMjc2IGluc2VydGlvbnMoKykgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+
ID4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0
ZSxpdDYyNjMueWFtbA0KPiA+ID4+Pj4NCj4gPiA+Pj4+IGRpZmYgLS1naXQNCj4gPiA+Pj4+IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDYy
NjMueWFtDQo+ID4gPj4+PiBsDQo+ID4gPj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUsaXQ2MjYzLnlhbQ0KPiA+ID4+Pj4gbA0KPiA+ID4+
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYmMy
YmJlYzA3NjIzDQo+ID4gPj4+PiAtLS0gL2Rldi9udWxsDQo+ID4gPj4+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjI2Mw0KPiA+
ID4+Pj4gKysrIC55DQo+ID4gPj4+PiArKysgYW1sDQo+ID4gPj4+PiBAQCAtMCwwICsxLDI3NiBA
QA0KPiA+ID4+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlKSAlWUFNTA0KPiA+ID4+Pj4gKzEuMg0KPiA+ID4+Pj4gKy0tLQ0KPiA+ID4+
Pj4gKyRpZDoNCj4gPiA+Pj4+ICtodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5
L2JyaWRnZS9pdGUsaXQ2MjYzLnlhbWwjDQo+ID4gPj4+PiArJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gPj4+PiArDQo+ID4gPj4+PiAr
dGl0bGU6IElURSBJVDYyNjMgTFZEUyB0byBIRE1JIGNvbnZlcnRlcg0KPiA+ID4+Pj4gKw0KPiA+
ID4+Pj4gK21haW50YWluZXJzOg0KPiA+ID4+Pj4gKyAgLSBMaXUgWWluZyA8dmljdG9yLmxpdUBu
eHAuY29tPg0KPiA+ID4+Pj4gKw0KPiA+ID4+Pj4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gPj4+PiAr
ICBUaGUgSVQ2MjYzIGlzIGEgaGlnaC1wZXJmb3JtYW5jZSBzaW5nbGUtY2hpcCBEZS1TU0MoRGUt
U3ByZWFkDQo+ID4gPj4+PiArU3BlY3RydW0pIExWRFMNCj4gPiA+Pj4+ICsgIHRvIEhETUkgY29u
dmVydGVyLiAgQ29tYmluZWQgd2l0aCBMVkRTIHJlY2VpdmVyIGFuZCBIRE1JIDEuNGENCj4gPiA+
Pj4+ICt0cmFuc21pdHRlciwNCj4gPiA+Pj4+ICsgIHRoZSBJVDYyNjMgc3VwcG9ydHMgTFZEUyBp
bnB1dCBhbmQgSERNSSAxLjQgb3V0cHV0IGJ5IGNvbnZlcnNpb24gZnVuY3Rpb24uDQo+ID4gPj4+
PiArICBUaGUgYnVpbHQtaW4gTFZEUyByZWNlaXZlciBjYW4gc3VwcG9ydCBzaW5nbGUtbGluayBh
bmQNCj4gPiA+Pj4+ICtkdWFsLWxpbmsgTFZEUyBpbnB1dHMsDQo+ID4gPj4+PiArICBhbmQgdGhl
IGJ1aWx0LWluIEhETUkgdHJhbnNtaXR0ZXIgaXMgZnVsbHkgY29tcGxpYW50IHdpdGggSERNSQ0K
PiA+ID4+Pj4gKzEuNGEvM0QsIEhEQ1ANCj4gPiA+Pj4+ICsgIDEuMiBhbmQgYmFja3dhcmQgY29t
cGF0aWJsZSB3aXRoIERWSSAxLjAgc3BlY2lmaWNhdGlvbi4NCj4gPiA+Pj4+ICsNCj4gPiA+Pj4+
ICsgIFRoZSBJVDYyNjMgYWxzbyBlbmNvZGVzIGFuZCB0cmFuc21pdHMgdXAgdG8gOCBjaGFubmVs
cyBvZiBJMlMNCj4gPiA+Pj4+ICsgZGlnaXRhbCBhdWRpbywgIHdpdGggc2FtcGxpbmcgcmF0ZSB1
cCB0byAxOTJLSHogYW5kIHNhbXBsZSBzaXplDQo+ID4gPj4+PiArIHVwIHRvIDI0IGJpdHMuIElu
IGFkZGl0aW9uLCAgYW4gUy9QRElGIGlucHV0IHBvcnQgdGFrZXMgaW4NCj4gPiA+Pj4+ICsgY29t
cHJlc3NlZCBhdWRpbyBvZiB1cCB0byAxOTJLSHoNCj4gPiBmcmFtZSByYXRlLg0KPiA+ID4+Pj4g
Kw0KPiA+ID4+Pj4gKyAgVGhlIG5ld2x5IHN1cHBvcnRlZCBIaWdoLUJpdCBSYXRlKEhCUikgYXVk
aW8gYnkgSERNSQ0KPiA+ID4+Pj4gKyBzcGVjaWZpY2F0aW9ucyB2MS4zIGlzICBwcm92aWRlZCBi
eSB0aGUgSVQ2MjYzIGluIHR3byBpbnRlcmZhY2VzOg0KPiA+ID4+Pj4gKyB0aGUgZm91ciBJMlMg
aW5wdXQgcG9ydHMgb3IgdGhlICBTL1BESUYgaW5wdXQgcG9ydC4gIFdpdGggYm90aA0KPiA+ID4+
Pj4gKyBpbnRlcmZhY2VzIHRoZSBoaWdoZXN0IHBvc3NpYmxlIEhCUiBmcmFtZSByYXRlICBpcyBz
dXBwb3J0ZWQgYXQgdXAgdG8gNzY4S0h6Lg0KPiA+ID4+Pj4gKw0KPiA+ID4+Pj4gK3Byb3BlcnRp
ZXM6DQo+ID4gPj4+DQo+ID4gPj4+IE5vIExWRFMgZGF0YS1tYXBwaW5nIHN1cHBvcnQ/DQo+ID4g
Pj4NCj4gPiA+PiBJdCBpcyBlbm91Z2ggdG8gZG9jdW1lbnQgbnVtYmVyIG9mIExWRFMgbGluayBk
YXRhIGxhbmVzIGJlY2F1c2UgT1MNCj4gPiA+PiBzaG91bGQgYmUgYWJsZSB0byBkZXRlcm1pbmUg
dGhlIGRhdGEtbWFwcGluZyBieSBsb29raW5nIGF0IHRoZQ0KPiA+ID4+IG51bWJlciBhbmQgdGhl
IGRhdGEtbWFwcGluZyBjYXBhYmlsaXR5IG9mIHRoZSBvdGhlciBzaWRlIG9mIHRoZSBMVkRTIGxp
bmsuDQo+ID4gPg0KPiA+ID4gRnJvbSB3aGF0IEkgY2FuIHNlZSwgZGF0YS1tYXBwaW5nIGlzIHNw
ZWNpZmllZCBvbiB0aGUgY29uc3VtZXIgc2luaw0KPiA+ID4gc2lkZSBvZiB0aGUgTFZEUyBsaW5r
LiBUaGlzIG1lYW5zIGl0IHNob3VsZCBnbyB0byB0aGUgYnJpZGdlJ3MgZGV2aWNlIG5vZGUuDQo+
ID4NCj4gPiBUaGVuLCBJIHdvbid0IGRlZmluZSBkYXRhLWxhbmVzLCBiZWNhdXNlIGRhdGEtbWFw
cGluZyBpbXBsaWVzIGl0LA0KPiA+IGUuZy4sIGplaWRhLTI0IGltcGxpZXMgZGF0YSBsYW5lcyAw
LzEvMi8zLCBzZWUgbHZkcy1kYXRhLW1hcHBpbmcueWFtbC4NCj4gPg0KPiA+IFBsZWFzZSBsZXQg
bWUga25vdyB3aGljaCBvbmUgeW91IHByZWZlci4NCj4gDQo+IEFzc3VtZSBhIHRvcCBsZXZlbCB1
c2UgY2FzZSB3aGVyZSBhIHVzZXIgY2hhbmdlcyB0aGUgZm9ybWF0IGZyb20gSkVEQUkgdG8gVkVT
QSB1c2luZyBPbiBzY3JlZW4gZGlzcGxheQ0KPiBvciBtb2RldGVzdChpZiBzb21lIG9uZSBhZGRz
IHN1cHBvcnQgZm9yIGx2ZHMtbWFwcGluZykgdGhlbiBzZXR0aW5nIG9mIHRoZSBsdmRzIGRhdGEg
bWFwcGluZyBzaG91bGQgYmUNCj4gZHluYW1pYy4NCj4gDQo+IE1heWJlIGZvciBpbml0aWFsIHZl
cnNpb24gaGFyZGNvZGUgd2l0aCBKRURBSSBvciBWRVNBIGFzIGRlZmF1bHQgYW5kIHByb3ZpZGUg
YSB3YXkgdG8gb3ZlcnJpZGUgdGhlDQo+IGhvc3QgZHJpdmVyIGFuZCBicmlkZ2Ugd2l0aCByZXF1
ZXN0ZWQgbHZkcy1kYXRhIG1hcHBpbmcgZHluYW1pY2FsbHkgbGF0ZXI/Pw0KPiANCg0KTWF5YmUg
dXNlIHJldCA9IGRybV9vZl9sdmRzX2dldF9kYXRhX21hcHBpbmcoYnVzX25vZGUpOyB0byBnZXQg
TFZEUyBkYXRhIG1hcHBpbmcgc2VlIExWRFMgcGFuZWwgZHJpdmVyPz8NCmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvdHJl
ZS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtY29kZWMuYz9oPW5leHQtMjAyNDEwMTEjbjE3
Mw0KDQpDaGVlZXJzLA0KQmlqdQ0KDQoNCg==
