Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8705CC755FA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 17:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6961510E77A;
	Thu, 20 Nov 2025 16:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="pM/KiCCg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010010.outbound.protection.outlook.com [52.101.228.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD1910E77A
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 16:33:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoD3xqib9PJvr3kAMBX0QClRr24CVWiXsZDqUA2fs1ZmY8I9Tt/erzy6mcIRhdSwIrYqT7wH3wkScFqbWszALH3mTjiqQfEM+1mIf4c4BkW88Eb9FDRu1PG7H3LZCqhX1Vv+THmFNl6f5WTMj3bYoOTr/aOchr+gonbEJ0UNJvOJz6c3SXMQcwYStIlGvBblniQmL2f0bT+WbBAZjg+cP1YohR6fJMwAdEgufZ0Nee5VwCVanrZv0leU2FWi1Be+cT+I5fd6dFdsasGHVSrhee5TUC70tzcI3OMpkBysPtDreSq9MbZL9coo7QlxzG5dVLK8TROo/AT1nr5NKB4ESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBEbs4rLaDaL2DKebcKKkmWjbYAp7dbesY92B0qXcvA=;
 b=p7zgOuRvrsTUlgFl7MdRLEa4MYor0TKcIUN2XI0uNJBZ1Vi0VNsk2EeR6LPXPrtFxUK3ygx+18iFLyaJL/Q4aEpmnvXcA+jaHQo1sOX9EslexsAGKcaDiCcWzbK/ZuVeoovdVQfLc2EpvShnMUJlMzcAdAufFCCDfPrXolJaAPCepyBnn6dHe6hzfhr9NKzIov1oqcKWZ8NG/MEQKHLU/a+mKM2VWZ/QZFLDxUkKeYwTsNSzaiBnEKPyFZs8V5aqdrsda6nWjrzn1vzuOQ/fVjRfUdYJ4qr2p979kHubWYDCE+RrFaiYgYv2kbOOw3/TgXka4M+UnNt/+j7VODM2DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBEbs4rLaDaL2DKebcKKkmWjbYAp7dbesY92B0qXcvA=;
 b=pM/KiCCgimWZ1VXohBK0jwIiOddl2j/Ear39QplX0ICmEyxh0PQWyEUAykKFLSh9jeRZ9VY76GMNYzCZR/Af6ti5c6O6c+Jv6d7jIwkGQVtN/Z41LNbAmWYHZvGG15jdg+aK4m4ce+vx4pfAbj85Di/RezkrynV5NZETlKzp/jA=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OSAPR01MB7182.jpnprd01.prod.outlook.com (2603:1096:604:141::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 16:32:56 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 16:32:56 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: geert <geert@linux-m68k.org>, Hugo Villeneuve <hugo@hugovil.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcWPwxRrBR+pEeF0OW1RdaNVw7mbT7p0iAgAAIsICAABOqsA==
Date: Thu, 20 Nov 2025 16:32:56 +0000
Message-ID: <OS3PR01MB8319E19274F06844DAA089F18AD4A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com>
 <20251120094743.48a0db4ead55c3968cb0cb3d@hugovil.com>
 <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
In-Reply-To: <CAMuHMdWeZsrE=pVroosOg6y-pjsE9CqyoBi5P_Ja5kZ0fgbY4w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OSAPR01MB7182:EE_
x-ms-office365-filtering-correlation-id: 80cb23be-c9a7-4306-8381-08de28527609
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?YkVKaWhoSEFCUWkrT1F5QXpvTEVna3R2VS80c3RKWmFncFlPR2JwcW9iemVn?=
 =?utf-8?B?OUFmNHpReUZRUVkrOGpIczZ5NWV1eXhleHkwL1RxWEhoQlNSSEZZYTRlcnl5?=
 =?utf-8?B?L1NIZ1IraUFIcHNORi9leVArRXlualB2OGtEaEZnVmJzRysvdllRbGE0Wlln?=
 =?utf-8?B?Q1RQeHZDbk9IYXl2SE1FSHZPMmJ0TFY1WjE3N1I5QVBmQy9KRFNXOS9ZWUlh?=
 =?utf-8?B?clppVGZzNms5U25qa1pDZGNzMlZSRkZDVDU3dTMycTc3cHJmYVNWRmJkUVFK?=
 =?utf-8?B?K2I1a05LNk1HRXNlem14R0hVdXNLMWx3QXU4VjVWQ0ZLSDNwaUVKbFJVMEQw?=
 =?utf-8?B?bWsvS3ZFOUIwNTliaXN3V0FSbmllUElONjZMRW1hTDI3SjdybUFlZkFXZnZZ?=
 =?utf-8?B?aUpYbVVRVGdmK1pYV1lpdjVXTjJ4MWI3MmtqUDVnWVZDSW1JMUtZeWJkUXND?=
 =?utf-8?B?ZU9kQnlmU3hGUXdVNXhiNm0rMXBqU1ErWmZYejlzRzBObThOejJuZ2NjeHcy?=
 =?utf-8?B?M2IyWUVLU3I0MTdDTEllNFZQV3ZKWmYvN0lBNWJ6QlVLRGs4VDQrQlZPTkR6?=
 =?utf-8?B?ekNENjJ5RCtiZDM5MTJSQU95a2xMZ2dCbHhLS0pSd1hhVWp4akxrMzRDaWox?=
 =?utf-8?B?djg2d1FPZVdIdng1cDR6MVVpNTZhSDhQTGVrWWlMQjMvSjJnVlVOdkEwU214?=
 =?utf-8?B?b2lHdzNNOG9jdmtiQ3h4MkZyT2RFclA3TmxyckZ1dXpmTjJ6cDdqT3JRU1FK?=
 =?utf-8?B?dHo2Tmw0dmp4SjRmQjkyKzd1QmkzVTNwTzVtRkxVWVBxalBNUFM0SG55L2U3?=
 =?utf-8?B?b1E4djBwdXdTNkNGWHA1R25EVjZOWGFwQmJOeWh1TkxXUTllNEpFODgxMnZw?=
 =?utf-8?B?a243RENlSzlmdGtsZ1NualZpWVlXSGhCMjFleUhsTEhpbVFHdnM1ZUFnOHhU?=
 =?utf-8?B?QTdSZFZtNklHS0hPSEdnSUV5RkQxOU9kZml4LzkyNHBUQnBLeTZIekwrUFVN?=
 =?utf-8?B?QnlyZXdrbXVzaENyVFpSaUJINmQwTFlJaWdQcFMydW1OK0wwV2t3WDVWY2cv?=
 =?utf-8?B?ZTE3T1JOM1k5SEN1ZEZCZGVDK21XUlBXNGRHSFhyUWw0Uk9xMmsvcjNuRE5S?=
 =?utf-8?B?UUQ0OEVtQTd3MjJPRTB0enpBT0toMjhwN1FLcGpFN3NlbkhXT0thOVlnaE1u?=
 =?utf-8?B?bFFWMTM1YmozNDA1WlBEd0hzazJ3d0lEOUo5ZlozUTlmMzFxYlR0bld4YXM5?=
 =?utf-8?B?MlJQQkduTlNkL01leWpXUDZsZHVONFg4c3RudjZkbnM4N21GMktmbDNMd3Q4?=
 =?utf-8?B?ZkYxMWlyRDZQVVhkeHdKaVdQdjV6endKVGpCdEdQME04MFQyaU4ydk10SDRu?=
 =?utf-8?B?cTVKRHpoU2xCVlUvNFE5Q3dHR2wxeVJEM3pIOVBrQTZjd2cwTVY0VkdzZTJJ?=
 =?utf-8?B?T095dlQyRmhzZ1lMK2pEdzJRT3FBVXk3UXdTenBtK2hoZlFGQlBvTDZnR3cz?=
 =?utf-8?B?SjkrVlpxdE1WMVNSbkxFMzQvbWJJZmcxNkV4RnhQM0xEcSsxcTBhOTVFdmRl?=
 =?utf-8?B?RnRCK0g3QWlySGk3LzNNOWlXV3FXbDhTZ1VuUEpuVTBOanF4eStNV21kWUIz?=
 =?utf-8?B?SkpoWFl1aEE3MlNvSlB6NGJDeGpKYnJ4MjFPWDBwK1pyVXVLRkEwYlJONm5K?=
 =?utf-8?B?cTkxSStYOVJ0cU1JTUROMnlEODRjMVFLaVlyRjljdEh4RUV5Q2QrTE42YW9L?=
 =?utf-8?B?ZHlmY083R1FCOVpPMjE5VU4zTHVQWCtaU1NwOHRaYVhpRFppZWxxK2tueVIr?=
 =?utf-8?B?TU40OXZSMUZ1bmVYeTZRU3J3QUxYa0tRMXoreXN5bWc1M1NFZys3SjlFODQ5?=
 =?utf-8?B?cG5lVVVHSmRQelIrZExkbGRXMWZIa2lHRmdVTTF5SWxzaCsxZ28vdERqblho?=
 =?utf-8?B?NnkvTW1Hc052MlRJSTJMNDlHQ2pkMDZtVThkRW5pSVJveFl1L3VJcEJ0a1BD?=
 =?utf-8?B?RWFsc3llMWFmRmxYVmNFbTVqNE5MK203TGR0a1NEK1JVMHVKZlh0TkhEaEtJ?=
 =?utf-8?Q?Q/SPR9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWV4d1R4cmRMenNqL0Q2TXZpcFlMOTEvMk5jcytqeWVFYTV0V210T3NuUDQz?=
 =?utf-8?B?bFh1UGJZZlIyYVJKM3UxM0ZkY1BXMU5zV3U3VHVacEN4N29UTDNkWDNpakRH?=
 =?utf-8?B?ZkRTN05nZS9RV2VGREkvczlZR3JTSzU4SG1pYmhBN2pKL0hIcCt4SGo3RS8v?=
 =?utf-8?B?cmZ3U2g4TWNKSDBvTzFucFEwRktFMGpWc1Q0Wm9VUWdwMjZjNXRCeGpsb051?=
 =?utf-8?B?QzhtcllXQndOalVONU1wVzhzS1dWZ0pGY0ZaY25IVHU0aHdIdHF6VXBiLzZG?=
 =?utf-8?B?ZHRXaVVQbUpDeTlROWlxM1M4ZE5rcC9ldll2NE1mNE9IdS9rajdlaU1Da1po?=
 =?utf-8?B?dEIwUWdpRkJQekRJRVdRL1E4U0YrUVpLYUJiRWZGWmx4VDFVL2h2KzRzaGtW?=
 =?utf-8?B?S2EzbWtzbzdiTWMxK1o5K092cUthSkszMnlFSWFvZHI1WEtxZXZvNGN1Nmpo?=
 =?utf-8?B?bFNHWnNvVE9ndFhzMXJwTkYvZFNpdGE4cndkcWZrckFYUk8vTUVrL2pYemQw?=
 =?utf-8?B?RVZVaVpFWEVFRjM2QW81VzFnTm80QVN4MFBHSnF0WS9adGFZVFh3MjNMZHVz?=
 =?utf-8?B?Um9JV01qcnZXQm82ZUJ6NU1pZHl4MERoL2UvODZNOXQ4MUZtRHo5cUJ6ZGsv?=
 =?utf-8?B?UGhSNFg1MDdaKzNYT0tJbXlXNVlhbVVxYVlwV0VQS1BVWTlmaEhzaERrWi9x?=
 =?utf-8?B?RmJRNGJ6bDBEN01RVUoxaG5TS01WOVprT3g2Szl4R2hNckVkbm1wbnRRdkU1?=
 =?utf-8?B?aFpiTGRCUTB2L2RRVHJHOGNhSm9TOHp3RWl6dS9ySDVtd1BnVUJFdGMwSzZl?=
 =?utf-8?B?UWlSdlk3WVpWWU9iK3M1M1ZUbkhUZXNWTkw4dGk3SEs4YXIzNktnWGJ1djRk?=
 =?utf-8?B?WWZ3aTdjT05DT3hjSjZKanBzbVhud2VYN1FoTUwrN3BTMWZuZ28zdVZ5b2Z5?=
 =?utf-8?B?SUdYbk8xTnljS3dCK2pOSWNYUVlGeXVnQnVqV0xQYXlQWU8rYTNQenR6ZnZN?=
 =?utf-8?B?MDl0SWlHV1FXVkoybGlGK3RvQnVoUnk3L1YzNTZMNW9icXQ3MkZDamRMblJw?=
 =?utf-8?B?RG14SGQ3dWZGUkdRYzY4ZlNwc2paK0RhU215ZzFnbmVvK0lhcksxb1BaL1R5?=
 =?utf-8?B?a0VOcXFoLzh5dVhZeFBiWTZPaW96VGd6eWNqcW56SHhsRW9uQnc5djhoZ1ln?=
 =?utf-8?B?U2pWSmg0SU9seVJhNGc1bGhSeE5vL1VBUGh5Z3h2b2FoMGpoTWVxN1NSTHBu?=
 =?utf-8?B?YUM1RHVoa2JpNUJDTGxXaG55ZGY0T095RVUvbmJDZmtnbThxRVMvK0tMeHJH?=
 =?utf-8?B?MHJkUUN5NUZ3azIzWWNzcU1QbVU1clVjTXdmTkJDVW82eit0WFE0RWFMdUVJ?=
 =?utf-8?B?OVh4WExTS01iZ01QcjR3SHZvTW9scWFxbDdaditmQmVZKzZsd1FwK2lueStB?=
 =?utf-8?B?RE1UaDI4SVA5V3VTYVZDZWloT0JFUmFQVG85NGhseVB1WXpKQm9tbktLWjFP?=
 =?utf-8?B?QmRXRE1yT1U5ek1oT1lHUGxCMmtpNFJkN2xRZzMrVHV3eTNmd05tVnBVcFBO?=
 =?utf-8?B?dnN5QmtJdVEzZEpvRE84dlVwSkM3aTdBckp5K1BIZ0EyaFArNEVtblN1bzZW?=
 =?utf-8?B?bnNOSmo2dkxiTDRwOFE5MWwwVlFId29GcTZkTXpycE1BR0M1dWNJVTRRODNP?=
 =?utf-8?B?SEUwR3BtOTZjQW9SS3dCcVkvMXc0empwNE5FNWFOTkRtODJrM1lYVW1JY1Za?=
 =?utf-8?B?RzhtZHQ5WGE2MlRnSU9qRzFHaWFrYWJ6S0lIZmxPdld2YUIrSURPMEx6ejBF?=
 =?utf-8?B?RTBwV1Q3OVJwbERHbGl2UGhGSkhoK0V6U0cvYnlHWnFjb0c4SEUvM1ZmWUF1?=
 =?utf-8?B?WXBGTEtRV2hEVU5XQm8zejJZQ3lhVXErYzV3Rm4zalg2a0ZpOUEzVlJqTnhi?=
 =?utf-8?B?Qmw4ZVJ0NG9mOE9rRW9vMFBOWGpJOUhWUTFiVUQxNTRhNVdxQ2tqK1NWT1Ja?=
 =?utf-8?B?bndGQ2IrWExwclZZUjhFVGlSdnBlNHFvb21GSmlzNVYwbnlRNVlQKzgvQzBn?=
 =?utf-8?B?eFR3SlpIcEh0T3pHN0I1aFRDL1FqamsyeFdOQ3VTME1XdGRsWmpQWGtkZ2pZ?=
 =?utf-8?Q?lGJdhilhO/4TNFX3nD+r0Myv8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cb23be-c9a7-4306-8381-08de28527609
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 16:32:56.5320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yxpdos+siOr2TouYxQxKUR1jbyYpEqRsB5LEpd7/hOnwJAfIdPCXcyX1Xx5vy43vxrA4tWg9j+ljErih1ITi/2i+BgSm2F9tYe0ZGxz9M/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7182
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

SGkgR2VlcnQsDQoNCk9uIFRodSwgTm92IDIwLCAyMDI1IDEwOjE5IEFNLCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6DQo+ID4gTWF5YmUgdXNlOg0KPiA+DQo+ID4gI2RlZmluZSByemcybF9jcGdf
ZHNpX2Rpdl9zZXRfZGl2aWRlciguLi4pIGRvIHsgfSB3aGlsZSAoMCkNCj4NCj4gSSBhc3N1bWUg
eW91IGFyZSBzYXlpbmcgdGhpcyBpbiB0aGUgY29udGV4dCBvZiB0aGUga2VybmVsIHRlc3Qgcm9i
b3QncyByZXBvcnQ/DQo+DQo+IFN0YXRpYyBpbmxpbmUgZnVuY3Rpb25zIG9mZmVyIG1vcmUgc2Fm
ZXR5LiBKdXN0IHMvdTgvdTggZGl2aWRlci8gc2hvdWxkIGZpeCB0aGUgVz0xIGlzc3VlLg0KDQpZ
ZXMsIHRoYXQgd2FzIGEgbWlzdGFrZS90eXBvIG9uIG15IHBhcnQuIE9vcHMuDQpJJ2xsIGJlIGZp
eGluZyB0aGF0IGZvciBteSBuZXh0IHN1Ym1pc3Npb24uDQoNCkF0IHRoZSBtb21lbnQsIEknbSBt
b3ZpbmcgdG8gdGhlICJyZW5lc2FzLWNsayIgcmVwby9icmFuY2ggYmVjYXVzZSBCaWp1IG1lbnRp
b25lZCBteSBwYXRjaHNldCBkb2VzIG5vdCBhcHBseSBjbGVhbmx5Lg0KDQpDaHJpcw0K
