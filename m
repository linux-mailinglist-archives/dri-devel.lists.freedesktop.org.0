Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE24FAE81BD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 13:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9AB10E6F8;
	Wed, 25 Jun 2025 11:42:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FObUdLnf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8606210E70D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfup0KdsXxyZn/AtitkhxZh/vF/jixbOiHTXg/yv6d/GE1U22NcJkBixq+DOja8uSGMu9B2upETTDpWTpRdX5mupuvs+w48oj0b3nKFJtjpm6uQTFtbsed8PM4kD3QwfBZl1OpuPz8dBQDrhiCd4uCBeMHziUW7zJ7aH7ei72FnIZ2l/OSyC8Ft/kbAohm8v1OOEl3o/2F2pOVm1eyuzfexEAV/16QMLyfiNQZvg0Gp+omRpK2Mb6l+NT5KUxSnetW2hmPwFOJ569QBC4+KjI/0XJdPQFg/zR+WLETR1dzvL4m7207vvlHBmNnvrfT9/J3zPLYR7Pl/+EnBaarwYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeEzo7a40YaYpwasjDDGFcM3reFUsLrsBhqCklRf3Hs=;
 b=SjA9Jp5CuTyAb6lU09ukIxqHu87FVZZoOcYNwph9aMzXCYXZ2ppnLvet1ppcRzJJ+JGLpdLU/2NSgA2H3pHemjPmvi7SfUhB3xh0/3ZCDIGRtrXyqfWEMJ6RxbyeBDrZSFA/tJ3PygD6W/TXqcUH+Vt/Xu3crIXdJga+93heKzd2cF5fcYe09ldq7+5qopIXYdW8i3AmOKSwArTrSxpSg1cfCHugfBNiYaXa2kyOePnPP7x3HJnHc0CafiwPz+sb2FvctL+0q8Mj22/8R4pmQgB40T4Z25Yh+wFTiuzrT6PTH0de0p2+bSA5ZXLaOmZjaLxR7rLnVtEqs0eMHGqdAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeEzo7a40YaYpwasjDDGFcM3reFUsLrsBhqCklRf3Hs=;
 b=FObUdLnfhzmwp/oEPGKY4VWyyq90UDD18966medAZMUL051dqwfqakvaEzUZe9Yj1Cad71wMy6wRAIS6/V7wdL/Xwz2RiNFt4hSixIMMh7tLYpnX+WqQ3J4/2b88teK3YUCAEVmYBSbihjdKnVYBFBcCO1H8tuc0kemjaRZ1ysw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB15920.jpnprd01.prod.outlook.com (2603:1096:604:3d7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 11:42:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 11:42:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Topic: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Index: AQHb0YbxoLXThBVJyEq0KQgkc6A6OrQAr/1QgAUFOYCAAABy8IAM3RaAgAEw7pA=
Date: Wed, 25 Jun 2025 11:42:45 +0000
Message-ID: <TY3PR01MB113468C96544DBE6526D51177867BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A62FDF84C5F2C1240BBF8677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sZfTgOENXfR2NnykgjGHd+2-vS9Jk-dNLWTVQyAGbQTw@mail.gmail.com>
 <TYCPR01MB11332F40696148C7216866D3B8670A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CA+V-a8txzBEwSSNEgoPkxBGAoQDrdGFtnYoLo49SqN-aZUUVXw@mail.gmail.com>
In-Reply-To: <CA+V-a8txzBEwSSNEgoPkxBGAoQDrdGFtnYoLo49SqN-aZUUVXw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB15920:EE_
x-ms-office365-filtering-correlation-id: 5d5e1c0a-0e58-42e0-d99f-08ddb3dd6714
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SDBmWGoxVDhjNjAwUnFlTVZtWHhDNVA1TFlRdVhtbTJhMjRRTkl6MFJjMGdy?=
 =?utf-8?B?bWlnUWtINTlGSW9SS3NvR1o0OFRaK3AyeCtsb0tEMVh5T2ZGaEVqNnVKcE5Y?=
 =?utf-8?B?RCs0NjVKbkU2bVRVUzdVV3ZseXFlWFNOTzM2SlNlQmg0RTR3cjZVczlLdGdt?=
 =?utf-8?B?ejRKektZVm1KMmNQaHFKV2YzUUxQZy9ZOHBpR1pEYWl4NkJlMkY0ZzZOWkhN?=
 =?utf-8?B?TVpWOVNHZk0yWkkycnkwNlArcStkanlzSEZiMjBRMnlibU8vMVBvd25ZRVVh?=
 =?utf-8?B?SEU3YnM3YTFlbUpiUEhMV01OVW9vNkZJcW8vRVplcnV3OTNUMVBCTjNGZERq?=
 =?utf-8?B?Vlp3NFc4cVJORDcwckUySm1panpkK0lLR0Z4bEtjM0QzYzh2Y0l5MDcxWDY1?=
 =?utf-8?B?dnZzQUlMTjJ1THNIYVpsdi9mQVM2M1ZaVlpscjd2a0FGRDBzTkxMams2dFR4?=
 =?utf-8?B?WmZsbEczVkkyWjdZYm9wTmJIdENuTkh5SmFtN1R2S1BINkQ4V0FtOGROYjQv?=
 =?utf-8?B?VzlvSndTQVlrcStwdDF1WFRIbkhMYWFlS1ptZDVqSUdIUzFvRVZzVW1TeVZV?=
 =?utf-8?B?QmpXUVdEc1dLaW1CVmU4VWphR1Npa0NPZHZvZzZTckdFSDlCVTcreFJhMUw3?=
 =?utf-8?B?SDg0S2wrMmJhYVBHN3l3OWk3UFNldEdEcmR6VndZQUs4bUFVaWtvdmZzNzNy?=
 =?utf-8?B?Mm5vL3QyeGVDanhWTlIzQzJHNmx0elV6QXpLMXM3S1JJN3g1REt5RUpyYkx4?=
 =?utf-8?B?KzdhY3ZvMjZWWDNMb3NOMW9pOFVFTklFOVNIdjNoNXp5cm1XTXE3VEl0MUNJ?=
 =?utf-8?B?eE1UK0xRc1JWRUJaUDF0YklzazNNY3RZbVlmZFdnSndxenU3eUZNcVlpMWRa?=
 =?utf-8?B?aGZFK0swYldpS01wamZ2Y1BKWjc5a0N4ck51VlR4SHNYVHdhbnkyTmRMNWlH?=
 =?utf-8?B?VXU3QnZVV2JpZi9UbWtuRDBxVWpZVTlMaXVES1BRN3R6MWlEU3dqTGE0MWlm?=
 =?utf-8?B?N2txU0d6TWxyQ0RLSzd3S2t4c09ZTXk3TWZoSFZPekJRV1QrbDZsdnRRZTEw?=
 =?utf-8?B?ZE9iVVdRUENieFhTaStxcEd5aTU2RkcyRWIyS2c3OThodDJQaEF0SVFiUDht?=
 =?utf-8?B?NkV6amNRR3ZKZGVpSENySFV5cCtkR1YxY0RzOTNFK3habXdOQU52R3g2bklQ?=
 =?utf-8?B?eDVobXgrQXBER1VlWWI2OFozRGo3WHNjK2NndUkwWFl0RzdPdU9wY3NUeVRs?=
 =?utf-8?B?Mjcyb2lucG9OU2dvZU5xUW9CeWtJQ1BNK0pHSEs5dTVmRllHRDFaNmZQeEgy?=
 =?utf-8?B?ZkxyMXQvSXJQS2JLSVpWUmhHako0cWE2S1RZbTNRZ0dmWXdKR0VoNDI0eEYz?=
 =?utf-8?B?aGNYS3FGa1JUNFl0SXpJNzR4L1B0Zk9TZ3hjVHg5UFU2MWI4QUlzTHcrQ1E2?=
 =?utf-8?B?bGVQcmdYQlh1SWNjckZnSkxuWVZldGxZMU14eDZQeUhkYXNOSUpyaFNRSGJR?=
 =?utf-8?B?SFNMMks1QmhNQVNzemttUGJFdityK0FnMTNZN3Z0Mm5LVmQ1TTdRVUVaSStn?=
 =?utf-8?B?SWdLM2ZqNngreGYvWUptNUo4T29HcS9GeitRdllrRkNVOVBXc1dWRkVRay95?=
 =?utf-8?B?RDdIZ0ZEckwzYmxGVGhJTFFrU2JoRHg1NlJRVDJXZ3V6bTZDd1dVUklYaFZi?=
 =?utf-8?B?bXRXVmZDTGlUa1daMitCcHNtNGRPcXNaMVBEb2FOWmkwbFRjdVdzK1hMcFR6?=
 =?utf-8?B?Z1RLd2daU3pLUkVDYXdOZjdsZ2YyVkRQSGpKU1ZJaXQ1dGkzN2dvNW90ZTR0?=
 =?utf-8?B?Uk1lMEVvR1RIRGFxMWpFOTFzQUZtNUZBYVNqZ2V3NGZkNjUzMVIzTDduWWVS?=
 =?utf-8?B?ZDNhK09YZzFkS2kvUGt5RFQ5S2ZqUDMxcTIxVDZFbE1MTSsyWG5aQ1RUNWF3?=
 =?utf-8?B?UG5YdUQvZDZLLytpU3NpL2ljUnkvNmREemhTNEp0VlBXNkxIbVJmaGcybmdW?=
 =?utf-8?Q?vQ+FKCEKrqLfIEJDycABvnpw2Za/U8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDNGdHkwVGh2VG5PWUlocU4zc3YxUjhQb2lxSnJWWmxGeTNCRXFrQ3MyRStE?=
 =?utf-8?B?c0lwT0V3K200Z3g1T3dTc1BBdmNNSlN5d3FadkF1Z01WRWRXY01WWm9iczNC?=
 =?utf-8?B?Q2lKL0tZdDVsVmkyV3Ric3lpaXRSZFNqa3Y4Z1o1ekkvZ0hrdmN5Zk5YUlR5?=
 =?utf-8?B?MnAvRU1VT29YYjBFMzR5UDhHR29Fc1JBN3k0VzVXYUZmOElsU2I4TDgxeGhU?=
 =?utf-8?B?dm1RMTBPWUovSU43T2NrR0J6bkdMeHl0djlLYzBndGhRbENidURvMUdseVcz?=
 =?utf-8?B?cVlGeTVGRW8xOUsrYXFUMW5FVHBhUjZmbC93amI4ZS9hdHRTclY0Z0NxeTlB?=
 =?utf-8?B?akFoU0VEQWk5YTdiN0lmMXVSbnFZTEIvZUwwYWc3a2c1UWhzajdvWExNNWxF?=
 =?utf-8?B?K3J4azdDY1FxbTRhbHBlQUtFTjB4Q3UxR3V6WVh6MVYyOVVtTm92VUZJY2FF?=
 =?utf-8?B?dWF4aHFZcjB2ZnlrVHN6cTdIOEV5M2F6TXpqdnZjMlVWUWtSeVNreVBVRFF3?=
 =?utf-8?B?Um0rdzk5SGg5OXFBUWdHR005M2FFWER4TGlIUml0SEFlMExFbmY1VnY1MXox?=
 =?utf-8?B?MWRzaGVOVVJVYmxQTGVLRnVKS2dGa1p0ZlRqNnF5WTdUVTNnM2tSeldzSHRV?=
 =?utf-8?B?R3RSb0JsN1hHdm95VkduQmlUWDVWMVRHNStWblhEVnJVZDl6d3RlcktobHVV?=
 =?utf-8?B?L0tpVjdqMTErSnZkeURaQWI1MUlkUjFRNVhZMmJBbEp2Rkt3OE1RMWdtcnlt?=
 =?utf-8?B?SWRycDRpaVdPaWJwckduSlRPUVBZOFpTYk1mNXQyMCtPNHNrZUd2T09mSnhT?=
 =?utf-8?B?TzBSYTJXVVBFNEY3R2hoQnUxVWVEcjNkbWxrcE1JQ0N3bVpHeXZMZVVJcjRO?=
 =?utf-8?B?S3JVNHNIOEdlRzFvQnJtc3dJLzNRVzZscDhMK2xkNGpoNnphTWFLRHRiNVZK?=
 =?utf-8?B?bDJ4em9acmN2TzdHVjlOc0hrbkFxU3FiaVZmVUZGaENLaGt3UDgxUFJ1enky?=
 =?utf-8?B?OVJWZmNTVkQxbXErN1BUek5GQW1pNk9SaHloQkI3SWtaUUN2dG81MVhlVk5x?=
 =?utf-8?B?Nkx5cnZSUlFWVmVtWE5TcUNFeHNmZE9QMHRLeXd6cGQ5d0xlejBNeHZ4NFVC?=
 =?utf-8?B?V1M4NUpkMERPNHpuZ2I2Rld1ZWRBR2tmVDRzNGtuK2NnS0NSeUcxYW5laHB5?=
 =?utf-8?B?S2o1TjAybGtKdGNIbHQ1MjRqM1B5L2M5T3J2RE9kSnVPb0N2bW0yeU91OHBo?=
 =?utf-8?B?OGFCUHFISG1PU2t3czN2MGk2U2xmU3B2N0FGa2ZTbW9GdUJLWGJ2VTVJRnlS?=
 =?utf-8?B?Tklhc3RHTkt2eU1sQVFyWlUvOWpxckdIQTBFNmtCYU16NUxRcmhyclViaW5E?=
 =?utf-8?B?c0tZN090UlJLNDdXaTMxcC9yd1BVbEZmUDNTR2pPSXp6NkZ5allMSEVBbjBs?=
 =?utf-8?B?YlMzN1FFZld0cklDbXF0cS9qOUVZdjF1TDAzek15MWV1Y1ZJcWNBSG9QMkMz?=
 =?utf-8?B?VHJyaGNrdjk0M1N0NjlQT2ZyazhCaXBSYjJ4OTZpUUovVHJ4bnloalZpUEY0?=
 =?utf-8?B?MExrdGVzSjlWVGZoNGtvK2F1YVlIVGhBVFBXOEk1S3dCV1hQSFNyNE5iaTRa?=
 =?utf-8?B?VkNDb0JiV1FzaTlXcThnZlU0dEZwZFdJL1IwcER5NStmNG9xNi95bmwra0Jv?=
 =?utf-8?B?T3JEMkxYKzFtMFY4VHhiNWhwcit1VEV2bWJ2UnJkTEJvWCtFWkozSE9Ga2gz?=
 =?utf-8?B?Z29GUTZ5TWtBQkRnMDhXUWk4MWRURVZyMTZHVlltaWRldnYvR002OFRaQ0ho?=
 =?utf-8?B?ZEREQWF6aFpUZlZKK2Yzck9MMjFhZkQ2dVdwSHpJZ1VuSFpONjdMZDBYM2pI?=
 =?utf-8?B?U1VsL2p1eEZzOXB5OU13OGcvT0J3NzVTbGt4bVBuZ2E4Rm9IUmtQaStGVkdt?=
 =?utf-8?B?SUVSckNpSkdZd09CSVdqMmxlNFY4ZGR6M0lPNkh0UnUxSGZ1eWNQUktCeGxz?=
 =?utf-8?B?WTJObTB1SUQxek1QdXRJOGpPc3dKMzZTbU92dVVSdVZ3TE9SUzJYZFJnbnFF?=
 =?utf-8?B?MXd3dk1VWnN0TzdjeU9zNVVuY3o1UEN5R0JKcXF5Wk9FUnlxMTkxY3psYmVv?=
 =?utf-8?Q?PWQjoA2+FSGOcWoOT8QPnBJ2D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5e1c0a-0e58-42e0-d99f-08ddb3dd6714
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 11:42:45.4482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LrWIQyfqSuFxZfng7kNz943HodK0KAdwtR1wZ0GcEbaX+J1Ju3SBh09GKlgMZTi9gOXoVy7AyxGYYXXMWdLrtkIGURFBj9DmPjkKc/zhny4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15920
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

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMjQgSnVu
ZSAyMDI1IDE2OjE2DQo+ID4NCj4gPiBUaGVyZSB3aWxsIGJlIGRldGVybWluZV9jbGsgZm9sbG93
ZWQgYnkgc2V0X2Nsb2NrIGZvciBzZXR0aW5nIG5ldyByYXRlDQo+ID4gZm9yIFBMTCBEU0koZHNp
LT52Y2xrICogdGhlIGRpdmlkZXIgdmFsdWUpIEZvciBlZzogIHZjbGtfbWF4ID0gMTg3LjUNCj4g
PiBNSHosIERTSSBEaXZpZGVyIHJlcXVpcmVkID0gMTYgVGhlbiBzZXQgUExMX0RTSSA9IDE4Ny41
ICogMTYgTUh6IHVzaW5nIGNsa19zZXQuDQo+ID4NCj4gVGhpcyB3aWxsIHRyaWdnZXIgdGhlIGFs
Z29yaXRobSB0d2ljZSwgc28gSSdsbCBnbyB3aXRoIHRoZSBjdXJyZW50IGFwcHJvYWNoIHdoaWNo
IGlzIG9wdGltYWwuDQoNCk9LLg0KDQpDaGVlcnMsDQpCaWp1DQo=
