Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30292AA5D6A
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 12:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F3C10E229;
	Thu,  1 May 2025 10:53:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="hPtzxx9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010043.outbound.protection.outlook.com [52.101.228.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1356310E229
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 10:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aor5KRWgRMHJriAWWoCmsxbTqDimccipM0bNis0klf4B7RsbU5SNK+g5N9dXGcu9qE8hWLEUxCVmlyiCKwTu/n4puf34t+KrjrPHHe/ckcxpH4vBnoUANX0ECZGpWeS4mmz+u9VqJE1ypNi6VUjwfa7/Z688orGnishxFMecs+BDsFc2Do5jMm0FSuHRHSvz2rMDaKTQF2qU3WJMs+8bWz5tlRWwsx5M8hVDfk0i9AnWNwe+Zhuc8Ocet7iRWywIKCEpcsP2iDa1s/JzTRAbFTqR2nbghLlZ4TBEEuMDwHWt1W6smipg2pHgx6xkIOeSTM/UfgaEEn7evTL58C8lZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4fi85Bm5lp1iTCbBNcr3JOPHPmS+QKDOt8VOHOJpNU=;
 b=QEcYFnj8704VyrfykBNo2GNGvTdQEbR8n2wBDjEF9mpAguMrHN2ztL7YEh058XndJQcdTQKJ3BpLI0ob5YStYGrn9FeLM2tlMUcgd/x+mjuGtRFNjuzUQ+C9E0QEQIMwycwk0Cq9hdMzQed8usU35E4Tbbeh1PEOR+DuSQ46tl0EZcxFLwcmSjA1GMWaNynCiagqMjwbhh/5SR3wAMSfzSJzD/YjT0LKFBAXi4fI1N2h04EqCgkeEu/pL9A848zZ/5CDW39OCay3mp9PhvIbYzqzNeCI8V73Rdw7NOiPLXq95BjunmD1ne5Ll3RfYrwtLQe2zOthGWQvVIeDLXpLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4fi85Bm5lp1iTCbBNcr3JOPHPmS+QKDOt8VOHOJpNU=;
 b=hPtzxx9Pzo32jMntFPURA4y4TDG2cV7qrzT/jNwmAQIEWVYsOb69pKF52c2hFN39eWD2Tm4BVqY6OLUyox7c3cqH03Yyhh41HYrDIecFK3EBNqIL9Dwrbvo6dvVxf0NTGZZSBa+hXONLWRqYGk/DjsoZ0cbov4GnXOGXHQa2PLo=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYYPR01MB12402.jpnprd01.prod.outlook.com (2603:1096:405:f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 10:38:50 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8678.033; Thu, 1 May 2025
 10:38:50 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Prabhakar
 <prabhakar.csengg@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 01/15] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
Thread-Topic: [PATCH v4 01/15] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
Thread-Index: AQHbuhA9yR4y/aB+SEKPdjdOmI3YDrO9iOiAgAAMC2A=
Date: Thu, 1 May 2025 10:38:50 +0000
Message-ID: <TYCPR01MB1209317F533E528616A4C2492C2822@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <f9a7c9fd-bd49-4cf0-9a86-a8e65b4fb6a5@oracle.com>
In-Reply-To: <f9a7c9fd-bd49-4cf0-9a86-a8e65b4fb6a5@oracle.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYYPR01MB12402:EE_
x-ms-office365-filtering-correlation-id: 66a6677a-0368-4621-4d2a-08dd889c5c62
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?Sy9ZVzN0NGczQ2tXVklUdm1EckJKRGp3dGgyMEtyNWIyN3dzZWdJQ3l0L0R3?=
 =?utf-8?B?b1JoVlBOOXUvMStndzd5R2xTRDZjS0lrRG9xMnNjQWhLNi84MmZOK1R4cVBW?=
 =?utf-8?B?ZGR6M3NubTVhcGlwMGIwME9MVHFZOWNDVlRadmxHSkMrWStud1pHQU5pSVJk?=
 =?utf-8?B?ZmdDL3kvak1pcFdBTURZZW9ORjNsWXFhZ0pNaGVRd1Zwa3cwNS9HaDFINUFy?=
 =?utf-8?B?STVTKzBnOG9KTThwYm80b0dKK0poWHVoMmQxS0JEZWVDWWwzMjUram5odUpm?=
 =?utf-8?B?eVhnZU4wSDFjQjZaOXo3V2hCTU5XY3pmU2MrRURLYXJMMC91M3g4S2NPQjVF?=
 =?utf-8?B?MStiT05udmFUcXZHbFlJWExLUnlhKzdLTERRdVp5VFdPdENSODRhRS9WUEl5?=
 =?utf-8?B?TXhNOHg3T2NIUyswd3Q3SFAwbk40LzNBQitSRlFlTFNNSFNRQ0JEdTF1TEpR?=
 =?utf-8?B?ODNnNkVMRUkybFJ0UGtiNzVEOVdaY29jamZCcHdpNW9pN0pKRHRZVGx1cW1k?=
 =?utf-8?B?MDNmMjYrSml6OVk0dDhheWo5Q1h0cDM4YWJObXVEOThDL1N1eEYvMURRYTZS?=
 =?utf-8?B?VXl1QUszTlFLa2dvQ1czZmNzbmlHcUtTbVllRnFmdVcrMEtkUnVvT2xUVlBy?=
 =?utf-8?B?VDA1bk9tM3l0ZWhHV09EMWhRdFBpZkZEYXBKK2NuU0lpbGFXam5HUDVCUE5M?=
 =?utf-8?B?eU1aQ3FzUWcxMldXNWdZZXZQekhLMDBRc1phUm1DOFJXZnBZRk9pMUJjVkFx?=
 =?utf-8?B?cWphQml3Qm1iblpHNzA5WUZ0SDVoYm93blZ5ZjBYWEpyS0k0RnZPQWJGT2VJ?=
 =?utf-8?B?OUwxRDdOanJDK2tqRlFBbjZ3THlrbVhHQVUrSktyMFZVQ1R0Qy9NM1lSYS90?=
 =?utf-8?B?NVBIVDVDQXpuT2JqV0Mwa1ZWazRtcHg0UnNjWmI4SGJJVG9jK3J2bE55OEc3?=
 =?utf-8?B?VjRWYTI5ckhsMjVtSmFuUVBJOVR1MVoxMnpkOU9zZUtjM09QVHNzRWhkYU9F?=
 =?utf-8?B?SUpUZlJubEZDU0czMDFPSEJ6QWhoSFR6bDlqbFpqVUx6YTRvQUgzOUoxMThv?=
 =?utf-8?B?ZGxUTEJvdG1aMkZIS3dweXcvQVNwd0YxK1NZVW8xN2JJRHpObDc0My9YR0p0?=
 =?utf-8?B?Rzh5SmdVNXdYSEZYVDhzSkZpTkNub1N5TlFrdGV0ZGJudmZBTjVNSlUwYXRX?=
 =?utf-8?B?S3pGR3NUcTZaOGFOb3kvbXZzWEhweXNDUUVYTGQ3SlIyNmRCd2ZpWXBjOXpt?=
 =?utf-8?B?cXdScUM2elRRMWlFWElwaDlHMEFCR0RoUFN1R1puNCtsbGc2elNrVzJnaTYr?=
 =?utf-8?B?L2hPem1laGVhdWlleWsvTFdiZkY4cndha0RMTUlkaEY2dlVLNXk0SFd6MDdv?=
 =?utf-8?B?a2xTNzFyeHJvUVg5a2ozbnhkbjcvcnRZR0t4YWpwOWtrTUhoVkgvQmcxcHRU?=
 =?utf-8?B?aFdhMVp2TzQva1A3K1ZyMUlNOUk5NkNCU0hRcDV2WWZ0S2pna2dFYVIxTUNN?=
 =?utf-8?B?dFNRZjljT1d5VVFXVDhOQ0xHY01YdmZKMGQwRzZLTHExeDFhbHg2eDRZVS96?=
 =?utf-8?B?dVNWYzZuSnNCZG1Lb083WlVDc3paMmQzd1RIVHpJLzhHSXNycFVMVUlMODg1?=
 =?utf-8?B?Y0JZK3puZXcwdGRoV2tkOFUwVE4yV1g5STdDL0I4L0tWbHZKNlZjUmtxanFV?=
 =?utf-8?B?QndZWFpxZHE3T0tod2kwaGx0eVJ2RjFQSVU1d2lvaE5KV2ZWREtnSzBVQWRR?=
 =?utf-8?B?dTRpSElIOFpBREhac2cvczRiSURpTjRnazZac1ArMXJRSENkZ0hGT0lHNkIw?=
 =?utf-8?B?TFErcEdNY0Rmd2U5ekxZS1ltQlVDcTNIaXNBSTNVTE4rUGJYeExQdFFGeWYy?=
 =?utf-8?B?dStWS0VpKzEvWExETFlzeFNLRml0WFFVKzNiSU4yaU1scno5dmQ0ejVwSkhx?=
 =?utf-8?B?QWVNZ1JuNW1POERzTUVadTE3OHFiTXUwQnhYM2tUdVVmZmxPUU5WYVRMNm4z?=
 =?utf-8?B?bVIxMDdpVzZnREJtUmNObVg3d3R5U0srN05xRHZheG9vOHl3YzVNV1FIc3ZX?=
 =?utf-8?Q?nS9JPA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB12093.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?em11c01CN095VGIvQ21SdlhnNVVFdUxFdHFwQUc1emFVQXgrUjFYNEJHSVQz?=
 =?utf-8?B?QkJzUjN3N1NGSHgxMjl1UW1UL1ozY2pqbCtZSjR1eTZMUTRpS2FoK3lEU2xC?=
 =?utf-8?B?T2ZwWnEwazVnVGJUeVlYbXZuUGhnem9UUk5wQmN0WnMyZkF2cm9VWWpSRjlY?=
 =?utf-8?B?anhaZ0hNUFVmVVp0VnMyd3MydVRxSEJNOWFXMS9peTNtZC8vYWJMSUhPNFEz?=
 =?utf-8?B?NEpHMzJoZE0vNzNBTU9xWmJKS1o3YWpiYmg5NjlZRSt0UUNnemFLSDlSVGNq?=
 =?utf-8?B?N3FuaWlVSXkrVlJacXdVZDcwdk1zK2VmVFZPdVMvQnpmZWVsT0dSSE9QU28z?=
 =?utf-8?B?eGU5aWJyZXhSMFJHaUVSbmRjS3I3WVZPeGxFQmRWTktQc1FNSDMwT2wyMVdX?=
 =?utf-8?B?OXVpaE85MXNNMmpWMFFhMHAwN3VSYXRUK0JYem4ybWRHZUVXSGN0R3RiQzdm?=
 =?utf-8?B?bXk4eGdIRC9Ld1RqT1ZYd2MyM0I2UDdKL3E4Z2YvUzdUZTYxUlh6VDNXTXh6?=
 =?utf-8?B?TDJMY2w2NVpWQTdGbmNDbnplTlhSN3Rob0FTSFVKMFhWTXpOaUtyMTZpdWM3?=
 =?utf-8?B?YjE0a0E5YjhzLzFJLzFCNEdjLzZqM1FnbFNqdnJOc3hIcFNjbm4vbVVrZG5z?=
 =?utf-8?B?WEFPbzY0YkM1bDhVdHVuOHJTWWtLQWh6NmNNSS9GaVZXWThHMjJmbVplTVZN?=
 =?utf-8?B?YmJKTVRRWWNhVklJNklOQXN5KzVrZkx2ODNRT09SZ3d1aU16dHR3dUErU0pj?=
 =?utf-8?B?bkpoYWFvTFZKYUswNTZyMnlwdVFMaTZWUVptbzYxME4vdlhXbFN2Qy9hQmlR?=
 =?utf-8?B?QlhGd3puV2ZoOCtsdThwOGI2MWxLcW1HNGpJUEduZTh4K3FabVFSbjREekNW?=
 =?utf-8?B?d0QrQlRiOE1mNVRjTFc2Zk9nOHRyOHZhZ2FPcSt5NGZNZjAvRjhEZktXY1dm?=
 =?utf-8?B?RWw2M09OMUdXWFRDS0R4cFdXdVlQeGV4K2xuYkwxemFlSk4rbFNPOTZ0YkxW?=
 =?utf-8?B?Wm1xRzVkcy9xSjN5SGxLb1lpMk0rZ0htaEowYmt6anhVQjlYM1ZWZ1RMOGww?=
 =?utf-8?B?RCtsa3grL2xhYWE4WVMwQmVCTDE3cndZb1JZZEVIQ3BXTU1oQ1JaV2ZKekU0?=
 =?utf-8?B?QWpqRTZjdjUyUzdxRkNENGV3c0pXaWY0OTVpN0NZemoxWENKaGFTSFErb0tv?=
 =?utf-8?B?SGZsemhqTklHN1BsaWlLaDM2Vk1MTmtpQzNzTGkvTUtmbDVKMXFzMmg5ay9U?=
 =?utf-8?B?NjRDTUdWM1l1cTErcGZDQ05LZXVLbnNzN0VITmNmQ1FESnpNRGJueXNJUTRV?=
 =?utf-8?B?bzdDVFFKcFhUSU5lazFIeGt1eG51d0FyNVdVRnY4anVhd25UWjIxdCtXUVpZ?=
 =?utf-8?B?N3lBdWgvUWtwblkvMnRhalF4R1dsb1l6R2lKKytYYTF2ektsMGZid1FRSWUw?=
 =?utf-8?B?T2QwQmN1dGVOWEZlTmN3SS9POWFDa2lBaEt4eWI3K2J0YlA0N1Z6ZG1jSHZO?=
 =?utf-8?B?WlBwazdYL09LenFBdU0xWmtTZi83aXJWR3BqZ2VQWkErb0hLK3hESklWbldr?=
 =?utf-8?B?RUoxQjJKOHE0NTBhNTJYQmFnNlhNNzR0VmVIcTBmdnQ3T0JLZS9QWTVNZ00x?=
 =?utf-8?B?Q2t3UGxDc2F6VktlVFFlVnczZVlmdkRtdHNoNkRNbTZUcWdYSkw4Y1FNVm1I?=
 =?utf-8?B?dlo4ZmY2blhnZ3JQc3lQUE1hRFdiYTByK0ZpUkd5bE1qNWVzemJlTmFvVEZa?=
 =?utf-8?B?Wjh6aGtnNm5KcWo2QitidmNMRUZwTjdwNGoyOXVBcndzZ29WODRsVWIwd2hz?=
 =?utf-8?B?KzkxK1VLL0ZvZHY2bjR2NGtEZjkxazNBMSsyZ2tqRFljQ3p5T0MyNUtTZldh?=
 =?utf-8?B?dlBvZGRxNVRYZmNCNzArbFB5M2hzanFWTWRQOEpHa2htT1N3aVJ0N1J3dDNB?=
 =?utf-8?B?eTRqaktETTFUY3NUWHRlTm0xYmNVQXpNMFlVZ3ZkbGZyVVRsc2FBSmFqZ0lG?=
 =?utf-8?B?ZURXUnN1UTI5bHhJR1pmaUZzS3VVcW9yd1M3Y2tOYXdBbGdtY2czZy9JOHNP?=
 =?utf-8?B?NTZRZDhzTE4vcnRDdTNjN2tXM0kvR2ZCSUZjQWFJZEtxaWttNDVYd09VMWVp?=
 =?utf-8?B?VVIxVUhxZ0dSYkpyMGpwV3EvR3V4ZHdlRkJrWjFuM2Npb1BpM01oYjRuMmta?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a6677a-0368-4621-4d2a-08dd889c5c62
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 10:38:50.2433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U6gHE4N3QZBC7BRgpFIAUcRvirkMSafj+sDvRfNkm801WjiwcWa+LmNJ2f0s6+tsN+alKK2buVEwhejwTa758TmCciTkthhGGDFvWtr/yGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12402
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

SGkgQWxvaywNCg0KVGhhbmtzIGZvciB5b3VyIGVtYWlsLg0KDQo+IEZyb206IEFMT0sgVElXQVJJ
IDxhbG9rLmEudGl3YXJpQG9yYWNsZS5jb20+DQo+IFNlbnQ6IDAxIE1heSAyMDI1IDEwOjUxDQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDEvMTVdIGNsazogcmVuZXNhczogcnp2MmgtY3BnOiBB
ZGQgc3VwcG9ydCBmb3IgRFNJIGNsb2Nrcw0KPiANCj4gDQo+IE9uIDAxLTA1LTIwMjUgMDI6MTAs
IFByYWJoYWthciB3cm90ZToNCj4gPiBGcm9tOiBMYWQgUHJhYmhha2FyPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEFkZCBzdXBwb3J0IGZvciBQTExE
U0kgYW5kIFBMTERTSSBkaXZpZGVyIGNsb2Nrcy4NCj4gPg0KPiA+IEludHJvZHVjZSB0aGUgYHJl
bmVzYXMtcnp2MmgtZHNpLmhgIGhlYWRlciB0byBjZW50cmFsaXplIGFuZCBzaGFyZQ0KPiA+IFBM
TERTSS1yZWxhdGVkIGRhdGEgc3RydWN0dXJlcywgbGltaXRzLCBhbmQgYWxnb3JpdGhtcyBiZXR3
ZWVuIHRoZSBSWi9WMkgNCj4gPiBDUEcgYW5kIERTSSBkcml2ZXJzLg0KPiA+DQo+ID4gVGhlIERT
SSBQTEwgaXMgZnVuY3Rpb25hbGx5IHNpbWlsYXIgdG8gdGhlIENQRydzIFBMTERTSSwgYnV0IGhh
cyBzbGlnaHRseQ0KPiA+IGRpZmZlcmVudCBwYXJhbWV0ZXIgbGltaXRzIGFuZCBvbWl0cyB0aGUg
cHJvZ3JhbW1hYmxlIGRpdmlkZXIgcHJlc2VudCBpbg0KPiA+IENQRy4gVG8gZW5zdXJlIHByZWNp
c2UgZnJlcXVlbmN5IGNhbGN1bGF0aW9ucy1lc3BlY2lhbGx5IGZvciBtaWxsaUh6LWxldmVsDQo+
ID4gYWNjdXJhY3kgbmVlZGVkIGJ5IHRoZSBEU0kgZHJpdmVyLXRoZSBzaGFyZWQgYWxnb3JpdGht
IGFsbG93cyBib3RoIGRyaXZlcnMNCj4gPiB0byBjb21wdXRlIFBMTCBwYXJhbWV0ZXJzIGNvbnNp
c3RlbnRseSB1c2luZyB0aGUgc2FtZSBsb2dpYyBhbmQgaW5wdXQNCj4gPiBjbG9jay4NCj4gPg0K
PiA+IENvLWRldmVsb3BlZC1ieTogRmFicml6aW8gQ2FzdHJvPGZhYnJpemlvLmNhc3Ryby5qekBy
ZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm88ZmFicml6aW8u
Y2FzdHJvLmp6QHJlbmVzYXMuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXI8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gDQo+IEFja2Vk
LWJ5OiBBbG9rIFRpd2FyaSA8YWxvay5hLnRpd2FyaUBvcmFjbGUuY29tPg0KDQpJIGFtIG5vdCBz
dXJlIGl0IG1ha2VzIHNlbnNlIGZvciB5b3UgdG8gQWNrIHRoaXMgcGF0Y2g/DQpQbGVhc2UgaGF2
ZSBhIGxvb2sgYXQgdGhlIHByb2Nlc3MgaGVyZToNCmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9j
L0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0DQoNClBlcmhhcHMg
eW91IG1lYW50IHRvIGFkZCB5b3VyIFJldmlld2VkLWJ5IHRhZyBpbnN0ZWFkPw0KDQpDaGVlcnMs
DQpGYWINCg0KPiANCj4gVGhhbmtzLA0KPiBBbG9rDQo=
