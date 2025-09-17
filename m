Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B55B80FC4
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 18:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2042310E0A5;
	Wed, 17 Sep 2025 16:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WatL5zcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5C710E584
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 16:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnz3UQBhMKKRsVPSIc8kDA16i73CNKQDIdqIhZpKpgAHp0IzRyrsvPat+DKuQ3rgwiJ8Iis95d3bd1Uhhnoxvmu0ErUDmue/0cVPOyCgmM9cXsfweEjDrVFZRKKoQIcOgRPJcMty9fGChDGPcayAB5wZarg8lyBNm9aHCh/b4Vi3caSL5GYvNhxs7Dw2jez2dZxyQg5fVFQxxw/SX/u4g8H6DLrMcxN8UUlYszqKl6pkmXg0dYlV6H6sY3RvTyZWcHkoR2H10vzlbtCSvgvw7F/z/wGJ9B7N9A8Qn3fMcDHVmCiPosfyKGTnVjod3/p0dyXWgiC0FhKZETd31w+NIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n705BwisJKl4k9c4hnEtFRomUlzyQnnTWx2fX/UOxKw=;
 b=WQAfTThZ1qG6SlQ0OfNZNRXs41HHLVtacNERHqzZLmWYTUUXyMFwEl2C4qpLwGWnLwfnDo0XURQda+jWmhcAdS/9n29FeXbdhSa/yrQKGr2peTjTGo4KXy9tZ6KzFknO/jiunOcZHxxrMXTPHt96xCd2KwsSy1uBdlYvNuA4HIhBvgYKDMefJzYq0hAHn1y6GSZuJvGidkWPL4ELlQhQb5Ms0RRusGdL3MKKlNW/7RwN2FBYQTGSh4EwIeO4ekeEyikBUIHWbM/yWnFs5YKSHEtwyUT7VVOKaWHb54c+UgCi9f4MOvJaaSaZlxkYWhu8kGb6/jgyl6OQ5ZGNiLW9UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n705BwisJKl4k9c4hnEtFRomUlzyQnnTWx2fX/UOxKw=;
 b=WatL5zcb4PvcE1fvX5wSk4YUKjK9B+3hMlb2InLz4JRfu3sikP1eQRha3I1nTUSF9+pe59XMR0Fz7KWkSHFoE0ovgLJqNtZaYYuScMj9o2ll28Qdq1OwboIYR71s3Zkphw0V73/uknmM/iDw085FlcX5BsW67z8iL7wQ4VuoBy8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB8167.jpnprd01.prod.outlook.com (2603:1096:400:116::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 16:28:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 16:28:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>, Chris Brandt <Chris.Brandt@renesas.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, magnus.damm
 <magnus.damm@gmail.com>
Subject: RE: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
Thread-Topic: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
Thread-Index: AQHcHO5DkziJYuZpG0uP0S9PdlSgdLSMY2uAgAFLCQCAAGfOAIAJj1Iw
Date: Wed, 17 Sep 2025 16:28:08 +0000
Message-ID: <TY3PR01MB113469BFFE54EA48AA8ECCA088617A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com>
 <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
 <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com>
In-Reply-To: <f1e671a3-77af-4ae2-aa6e-bde93aaa54b7@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB8167:EE_
x-ms-office365-filtering-correlation-id: d007cda9-254d-4516-6827-08ddf6072f9b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?T1VML2lMWGYvUWgvQmlQQzBFQnVIQUJXMnpxdXRSTFBTbDVoek1FeEVHR3J6?=
 =?utf-8?B?MExYTGdhVHd6NU45UUJwc25xYjRsUnQ5R0laM21QeWI0WnlEbjEzN2gvUUx2?=
 =?utf-8?B?ay9abFBCNUs5UkRya1FsYlBXQzNMWXp4Y3J3alMxdnBqaXE5cTBQVXIveHZS?=
 =?utf-8?B?QktReGZOeW9DRGRZNSsyT01tem1LT3p3ZGc4UHU0cERrK3d4VlpEVTNoT1V1?=
 =?utf-8?B?K2tQMVNDdnowV1RKY1NlRWZYOHZ1VGJTUWxybUN6T24rWEIreEw2bHFsdkky?=
 =?utf-8?B?ckh0WjFtRE42clpHRmpEa3UyR3JTL3pmRUl1UEJFMlRUS25NYm1YNVNMWGsy?=
 =?utf-8?B?WFNxR1pMbDVTTGlZODIycjQzbys4V1NMVFZGaHN1bE5acThXUlhtZHV5dXFD?=
 =?utf-8?B?bmtXdTh5R3drcUJBQ3VkYkJkNFlnVXN1KzY2NVJNRS9ZN0tGNW8zZ0hsVlQ1?=
 =?utf-8?B?ZnBUTjRYU2JPVUpDcC9rK3RDbnJRc2VJNjFudDJsazI5RmdhTDNlOXpLYVc1?=
 =?utf-8?B?dWovbEk5alQrSnpQNGZyeEpGT1cvdXRPQUFEWG1HRmVsVHlRbk41K1E5MHk3?=
 =?utf-8?B?QkFCWmRCcmJMQ0JSVmhNSTJhOUJPTjhKaWJHbHBXcnRDNTdjYUhXcmErOEJ2?=
 =?utf-8?B?N1FJNjhMWUN0UGZZZjFRYnlPZnNKamMzaitXY3ZRN0dmTTVvYXFoM1RXVVI2?=
 =?utf-8?B?ZFZWaC9namw2NWlkU3BXNzBVZHA1SFBrbFBjK1RqV1pyZ1gzcGlWa2N5d2xW?=
 =?utf-8?B?bHZvRWxkV1NaYy95OGdTajY5MVZVblBGQk8wZ1VLRzY3Mis1TnZueHpPdFFI?=
 =?utf-8?B?SnlPNlo3b0tHd2RCdXZNQ05wNnlDbVNSVmNOZWRxSCt3d1RQT0NGNi8wSmww?=
 =?utf-8?B?UzROcTdtemUybG8vM1lJM0VtRXNyWjI4OEpENzcveUh6NzlXeVhFaGtpVWRl?=
 =?utf-8?B?OTd5aTdEQVd1RGwxc1lRcHBuaTQ2OFFINE1jY3p3MVdUcGRPam55QlhjTXFB?=
 =?utf-8?B?VzdjTVZkQ1JabHJud1BjSEJFRW5iTmRxUTVhN1YyRFgzTUErbzJpaXNwTFVt?=
 =?utf-8?B?N0ZhZVkzSWIzMjdKR0hVeGlGTTEzSmhIUk9jbXJ5UUpudGtQUFVaY2FFNWtw?=
 =?utf-8?B?WElMVFh2anBXRGhscExMUTdlNm8ybHc5bUJpZFJDRU1tS3hLN0JZRlJPY3Jy?=
 =?utf-8?B?L0NYZ2g0SCtDVVUyU29hOTRLUGQ4SGYrcExMaEtTNTRxbzBZZ2ZjM2k2VzFp?=
 =?utf-8?B?K0ZkcDNWcHBiQkx5cm9hRTY0TE5Ub0YrNlpwWnM3aTZuS25ZeWpCYVFoa0E1?=
 =?utf-8?B?Zm5LbTdjNCs1NkxMVC9hWHNHOUJ1QkJrcllLYk9KTFJ0TXhhSWRGUUxDdlJs?=
 =?utf-8?B?aFJ3dDQ5WE5Gbk9oN0E3NG5mWW1MSHFkYk1UUFJoZ0RwN0liajI5MFh6Vit5?=
 =?utf-8?B?TGlUUkRRY0ROVFo3UlFPWU05RzFZTnpzVzV0dTluN1FDT0YvU0N2aUFwT1dn?=
 =?utf-8?B?Ym5BaGo5emkxSTlZMmpDckZaRkJZOG94aEVtbXM5bmh5UWdTdHBpNm0rNVky?=
 =?utf-8?B?THkwdGRmV0llYWFUbmlyNTNNU0EwM1BwRUFTR01PNkFLM1B1dlVpVndnUENt?=
 =?utf-8?B?V28yNm16UFpxVm9XNnhHcldHQ1dneGNwSHdSZmFEK2FUMnRZU21IR1U3UnF5?=
 =?utf-8?B?NlVNNXpXVEg3RGxTUEFJOUs5b0Zyb2lMU2lmWGV2eVBEcGVZSnZ4aWoyYTBv?=
 =?utf-8?Q?7j8FgUt0brCrR4jh4M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2plcTdFcFMzVS9Ybmd5NWNyZ2FmVWQ1ay9sUEc5NUIyV3MwdVk5ZE1oTjM2?=
 =?utf-8?B?ekFEWjJTb1ozZjRka3Z5V1Nzd0xHa1hPNE5JTnZCelhBbGVVQ0NFaHB6UVJ6?=
 =?utf-8?B?ZDVFZ0t6clE4N0tLMWs0WjlNaEdtdE9mQk1DTlhIT2pCbWdtMUd6MkdkQTlN?=
 =?utf-8?B?Szgremc2TTVpRkxzYVYzbWZCVU5BMGwvY2FjMmZ5c0oxODdKbXI5TlRsZ0tV?=
 =?utf-8?B?dkY4SXA2RFhqVHR1VTJPaWJJeHYrVmxMdFdSY3cyU25xL3F6UnV1UENZRVFw?=
 =?utf-8?B?aUxmMUtOWHFIRXl4ZHVucmJmbGdzbjQwUFdEaGRBTWUrZklkVXNNUGkzY21r?=
 =?utf-8?B?YW52S2NhQ2wwOG5zd3NJOGU0blJ4Nkp2eTRYS25xTWtteC9HUC8wK1g4N09M?=
 =?utf-8?B?QmdvTUFkZWo1cXZoUXFXRWVjcW5HWkRzWVEwSDVUTWY0Z2xBQTgvUktkbE1j?=
 =?utf-8?B?YWl3Z3Rodk81Wlo2Y0p5dXdPVWs4UWswWWZTZUcyOUhZMGp4Z0RiNmo0MDJ4?=
 =?utf-8?B?SFJNRkJCWnVqNmt0MnJ2anVPVFlvYmo3SzNSMGs0Q3BneTFVYU9FSjNBUTl2?=
 =?utf-8?B?YWxVNmFBUXpyZ3o0SThsN3l3ZHFQYzg1VHk1aGlOYmFwWkMrSGVtemJKOExQ?=
 =?utf-8?B?QXVmWmJIYlRTdyt2M0svdnFVVXM3dXRQT1VWSEJvU2VxdVM0ejN6anZCOGk5?=
 =?utf-8?B?WTZPL0VKdGlwQnRjWE1Nc3E4dDdvV05nMG1YaUI0NXF3L21mbGZsb0krek1P?=
 =?utf-8?B?aVZ3VjVOcngxaFJnM1ZtSnduTFJEa3F5Rk1IMnlxS1RhSUR3bFF1aFkrWjRl?=
 =?utf-8?B?UUh2MVE5QW5zWTgwc2E1K1JvRElCZ3JwYkhuRGlsU2k3R1dwUUpLWEhSNnpQ?=
 =?utf-8?B?cmMxaWpSb05BdjJSQlVNY091V0pYM1A4dWV0ZXlNb3U2bjlxem0xaGxHOGsw?=
 =?utf-8?B?UWlYaTBQeDVabW1vMkNNS1NvS3ViS1J6bnRybFRuOWltcWtEbVBIVW1ITFRY?=
 =?utf-8?B?NDBtalZIUEtDUEhEVE9SbFBUQXFYQkR0eWlEeHhiTHFMd1FxNlQ1VWM2eVQr?=
 =?utf-8?B?OGp2MElkN2x6Y1RKd0l5Z1NVcEtlaHJ1Z1lmUCtZMDJ6THl4VlhuNksrL3du?=
 =?utf-8?B?TTRRWkpHNjRQUHQ2cG1mYVFPU1NzK0ozSndVdVUyWTdIQzlkZ0RMd2ZzQXFr?=
 =?utf-8?B?dVF2UWRrT25NU05OYlZBS2NwbEVQS2FKVnkzcXR3dENheUlmVW1TL3VqT2ht?=
 =?utf-8?B?UHNvZEFzYm1YQlBQZjdzeHFXSTE1UEs5VlY2T2g1aUJVWUE4Qy83YmVCTnd4?=
 =?utf-8?B?ajl6TGlvUlRwV09YRWZORStyYUo2U3BRTVVGeXdSSDRNNVMzdkVBTnh5U1V3?=
 =?utf-8?B?UkMxWURnS2tDNVo1TVlxbnNTWCtEOWNSaHJndmRIeEZzM0tSR1o5SXIxT2cw?=
 =?utf-8?B?cUxOTjF3QU45NldsYUtscnRZWE5vRjByN083YjloSTUyd1BYeDEvckh0OU1D?=
 =?utf-8?B?OHpIRUNjQS92Q3JkUTBXa3p4TlNYcDJINXNURXFCSU1MZDEwczZ2ZE4ycVpi?=
 =?utf-8?B?cjNnVysrZjdJY2l5RjJDWDlsOVRhSWxLanRqT09sc3lwTnJxTTIyYjFXeGVK?=
 =?utf-8?B?NUJrbnpuN3ZOeGo3QS9pTVRJWHQzMXNSVWVqYVVqUWMvQm82UjdhdlJBelNS?=
 =?utf-8?B?bDJYZHZ0L3RlQ2l3VTl3OTVsVnJHbmxGUnc5cC9PQ1pJMGczT2NxdnF6QUNm?=
 =?utf-8?B?VDM3dWlXc2J6NUJGM3E3WFhNYTJ2ek12ZXBkb25ZbmZqNWJCWmZpKzg3UXNU?=
 =?utf-8?B?RHFOV3FvS2txaFJxSm9SYW9CWHhscUpXQkNYeDkxTXRPWWZsSGZrcW5oR3p4?=
 =?utf-8?B?aUlmKzd2eWV3b2paRUpmQjZjZDIySHJjK1U3MXpobzhNcnZWbkhuU3BmYURJ?=
 =?utf-8?B?blpvWEFpcGZrRmQxa1NjUkUxOWIySHBibHk1ZjlEWU9rS3htekJrbUt0MHVT?=
 =?utf-8?B?VVFuQWljR05zdzNQMmVHajRVWHVuc0V2OERxYU15L0hYM0FOb1lYUkZMSlNM?=
 =?utf-8?B?d2FNbXZibFFoVW0yaUVMVEZVdWozV0w4RDhPSWEwWUF2NGIzMHRMQ2p1RWhZ?=
 =?utf-8?B?RmZFd0h5TWdQK3U2S3ZyYUliUFovYkF2akxOR0NuQVlwQnhoS1B0Nk5RWjVw?=
 =?utf-8?B?M1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d007cda9-254d-4516-6827-08ddf6072f9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 16:28:08.0228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PEVaLWOigfofZx8ihAaAvM60CP93eJcGWRBeCSl+u/mMK2YhUZsE8JaqQsUhFh/gDiFIqfXrSuDV5k0XJ4sx5ePwYhqT06Z3Pw/Sjp6mxWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8167
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

SGkgVG9taSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW4rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50
OiAxMSBTZXB0ZW1iZXIgMjAyNSAxNToyNg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDIvNl0g
Y2xrOiByZW5lc2FzOiByenYyaC1jcGc6IEFkZCBzdXBwb3J0IGZvciBEU0kgY2xvY2tzDQo+IA0K
PiBIaSwNCj4gDQo+IE9uIDExLzA5LzIwMjUgMTE6MTQsIExhZCwgUHJhYmhha2FyIHdyb3RlOg0K
PiA+IEhpIFRvbWksDQo+ID4NCj4gPiBPbiBXZWQsIFNlcCAxMCwgMjAyNSBhdCAxOjMw4oCvUE0g
VG9taSBWYWxrZWluZW4NCj4gPiA8dG9taS52YWxrZWluZW4rcmVuZXNhc0BpZGVhc29uYm9hcmQu
Y29tPiB3cm90ZToNCj4gPj4NCj4gPj4gSGksDQo+ID4+DQo+ID4+IE9uIDAzLzA5LzIwMjUgMTk6
MTcsIFByYWJoYWthciB3cm90ZToNCj4gPj4+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPj4+DQo+ID4+PiBBZGQgc3VwcG9y
dCBmb3IgUExMRFNJIGFuZCBQTExEU0kgZGl2aWRlciBjbG9ja3MuDQo+ID4+Pg0KPiA+Pj4gSW50
cm9kdWNlIHRoZSBgcmVuZXNhcy1yenYyaC1jcGctcGxsLmhgIGhlYWRlciB0byBjZW50cmFsaXpl
IGFuZA0KPiA+Pj4gc2hhcmUgUExMRFNJIHJlbGF0ZWQgZGF0YSBzdHJ1Y3R1cmVzLCBsaW1pdHMs
IGFuZCBhbGdvcml0aG1zIGJldHdlZW4NCj4gPj4+IHRoZQ0KPiA+Pj4gUlovVjJIKFApIENQRyBh
bmQgRFNJIGRyaXZlcnMuDQo+ID4+Pg0KPiA+Pj4gVGhlIERTSSBQTEwgaXMgZnVuY3Rpb25hbGx5
IHNpbWlsYXIgdG8gdGhlIENQRydzIFBMTERTSSwgYnV0IGhhcw0KPiA+Pj4gc2xpZ2h0bHkgZGlm
ZmVyZW50IHBhcmFtZXRlciBsaW1pdHMgYW5kIG9taXRzIHRoZSBwcm9ncmFtbWFibGUNCj4gPj4+
IGRpdmlkZXIgcHJlc2VudCBpbiBDUEcuIFRvIGVuc3VyZSBwcmVjaXNlIGZyZXF1ZW5jeSBjYWxj
dWxhdGlvbnMsDQo+ID4+PiBlc3BlY2lhbGx5IGZvciBtaWxsaUh6LWxldmVsIGFjY3VyYWN5IG5l
ZWRlZCBieSB0aGUgRFNJIGRyaXZlciwgdGhlDQo+ID4+PiBzaGFyZWQgYWxnb3JpdGhtIGFsbG93
cyBib3RoIGRyaXZlcnMgdG8gY29tcHV0ZSBQTEwgcGFyYW1ldGVycw0KPiA+Pj4gY29uc2lzdGVu
dGx5IHVzaW5nIHRoZSBzYW1lIGxvZ2ljIGFuZCBpbnB1dCBjbG9jay4NCj4gPj4NCj4gPj4gQ2Fu
IHlvdSBlbGFib3JhdGUgYSBiaXQgbW9yZSB3aHkgYSBuZXcgY2xvY2sgQVBJcyBhcmUgbmVlZGVk
IGZvciB0aGUNCj4gPj4gRFNJIFBMTD8gVGhpcyBpcyB0aGUgZmlyc3QgdGltZSBJIGhhdmUgaGVh
cmQgYSBEU0kgVFggKHdlbGwsIGFueSBJUCkNCj4gPj4gcmVxdWlyZSBtb3JlIHByZWNpc2lvbiB0
aGFuIEh6LiBJcyB0aGF0IHJlYWxseSB0aGUgY2FzZT8gQXJlIHRoZXJlIG90aGVyIHJlYXNvbnM/
DQo+ID4+DQo+ID4gSW0gcGFzdGluZyB0aGUgc2FtZSByZXBseSBmcm9tIEZhYg0KPiA+IChodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvVFlDUFIwMU1CMTIwOTNBN0Q5OTM5MkJDM0Q2QjVFNTg2
NEMyQkMyQFQNCj4gPiBZQ1BSMDFNQjEyMDkzLmpwbnByZDAxLnByb2Qub3V0bG9vay5jb20vI3Qp
DQo+ID4gZm9yIHRoZSBzaW1pbGFyIGNvbmNlcm4uDQo+ID4NCj4gPiBUaGUgUExMIGZvdW5kIGlu
c2lkZSB0aGUgRFNJIElQIGlzIHZlcnkgc2ltaWxhciB0byB0aGUgUExMRFNJIGZvdW5kIGluDQo+
ID4gdGhlIENQRyBJUCBibG9jaywgYWx0aG91Z2ggdGhlIGxpbWl0cyBmb3Igc29tZSBvZiB0aGUg
cGFyYW1ldGVycyBhcmUNCj4gDQo+IFRoYW5rcy4gQXMgZGlzY3Vzc2VkIG9uIGNoYXQsIHRoaXMg
Y29uZnVzZWQgbWU6IFRoZXJlJ3MgYSBQTExEU0kgb24gQ1BHLCB3aGljaCBkb2Vzbid0IHByb3Zp
ZGUgYSBEU0kNCj4gY2xvY2ssIGJ1dCBhIHBpeGVsIGNsb2NrLiBBbmQgdGhlbiB0aGVyZSdzIGEg
UExMIGluIHRoZSBEU0kgRC1QSFkgd2hpY2ggcHJvdmlkZXMgdGhlIERTSSBjbG9jay4NCj4gDQo+
IEEgZmV3IGNvbW1lbnRzIG92ZXJhbGwgc29tZSBmb3IgdGhpcyBkcml2ZXIgYnV0IGFsc28gdGhl
IGRzaSBkcml2ZXI6DQo+IA0KPiBUaGlzIGhhcmRjb2RlcyB0aGUgcmVmY2xrIHJhdGUgdG8gMjQg
TUh6IHdpdGggUlpfVjJIX09TQ19DTEtfSU5fTUVHQSBpbiB0aGUgaGVhZGVyIGZpbGUuIFRoYXQg
ZG9lc24ndA0KPiBmZWVsIHJpZ2h0LCBzaG91bGRuJ3QgdGhlIHJlZmNsayByYXRlIGNvbWUgZnJv
bSB0aGUgY2xvY2sgZnJhbWV3b3JrIHdpdGggY2xrX2dldF9yYXRlKCk/DQo+IA0KPiBXaGlsZSBu
b3QgdjJoIHJlbGF0ZWQsIEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byBoYXZlIGEgY29tbWVu
dCBpbiB0aGUgZHNpIGRyaXZlciBhYm91dCBob3cgdGhlIGcybA0KPiBocyBjbG9jayByYXRlIGlz
IGRlcml2ZWQgZGlyZWN0bHkgZnJvbSB0aGUgcGl4ZWwgY2xvY2suDQoNCk5vdyB0aGUgcGF0Y2gg
WzFdIGhhcyB0aGlzIGluZm8NCg0KWzFdDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NTA5MTIxNDIwNTYuMjEyMzcyNS0zLWNocmlzLmJyYW5kdEByZW5lc2FzLmNvbS8NCg0KQ2hlZXJz
LA0KQmlqdQ0KDQoNCg0KDQo=
