Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86AF9E553F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 13:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D271A10EE37;
	Thu,  5 Dec 2024 12:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ShUinkUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010052.outbound.protection.outlook.com [52.101.228.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF46310EE37
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 12:19:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSyYba+F/n16RzmRGkbgT/GkkvXWF5p042CG9eFLLXDF4wdcV8UTznm0vxpa/++JG2xLQHiqTFx1QfeDqLw+IEcBwwJ3yYTWpZQbnLA9iEzFycJJ0AQSd4Y1VsUhmVdYpAshKVo7RvriPfiIeygFL/b9TUZG7bRVjntvWg4vv++gQ0YHhbgSDhagqCw5ivEWGsHVauJHFP63rtFWVRqQ/50dGiodGbBljNEhbObrqJn2X86qyI2MiITkE75maiR/GtEqQXjlLuY21zrDb20d2LteomEC4JLN7sx3jdQLXfyPTtnMTCJNiCI8Xhvo91akktY9LpKFduvf2SNoTR7jWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Spz58FjUTeGGY4euc/G6BYjjVuyv0q1tmHa0PuEKT3A=;
 b=XA+Smsu0/mI6U2c2IXizq0WqAp+OYdsBE3G+u7Q93+x6zd/C8oIInv5xgoS0lxhx5t/GqBvUpSW51tluGV6HpyDrHdLG2vnnaGG5Ab54Bt8W7swLz4RhlmqT3w/27KgNgZRg66eABegzNySpd2vviJeVbocCp74EX2tuvyPtdf/ktgtQ7UhCUxHLE83Asb8PiCPszc0dDhWAKeJ6MWtp+iNuQqtgqjzu2pPdhAMv3MUoyUe5ZYXjzDOz07YPs9eZPtsyYEsycza/JTLE5TMefmNwLpEbBtzC9fUepvbkqyMiYc9kTmGD7DGVlP0H5kl1DgNPN67JqfccylB1qrRMyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Spz58FjUTeGGY4euc/G6BYjjVuyv0q1tmHa0PuEKT3A=;
 b=ShUinkUycCwQcoaPHmmAti50h772KQkjQDsIKF4Dk7WZ/IWDWT9RpYwKb5pO3NGwRfJue1xgjEutx0B/XCxPFvuPpED5+om73//WME/yWW9hHXMRGRTDDC8OJaz0hGYgEUE8N159aBbVG9Am95Q1SNtIKm6z1eSQwbzd58rVqlU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10587.jpnprd01.prod.outlook.com (2603:1096:400:2fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Thu, 5 Dec
 2024 12:19:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.014; Thu, 5 Dec 2024
 12:19:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Liu Ying
 <victor.liu@nxp.com>
CC: "tomm.merciai@gmail.com" <tomm.merciai@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tommaso
 Merciai <tommaso.merciai.xr@bp.renesas.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Thread-Topic: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Thread-Index: AQHbRafhYhDs5vdfJ0a+HUDeBItd1LLUyJ2AgACpQ4CAADJI0IABuUCAgAAs6YCAAAhxUA==
Date: Thu, 5 Dec 2024 12:19:11 +0000
Message-ID: <TY3PR01MB11346B32E8CA9C0E4E677C09A86302@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <hd2kom5acz47c3mkjuauxhauahkt7vq2qoilppwn34iidldhos@rb5ydcayhtlj>
 <054a0278-428f-49cb-b0f0-182c5bb3b61b@nxp.com>
 <TY3PR01MB113469CCF62FCC801F15C6B2286372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <3243b983-2f22-4254-b7e6-0f7ef0ae725c@nxp.com>
 <CAA8EJpqAjx+K2GdKt=gLxsETa7nvH57f3RVbhhL6EftiN_8EuA@mail.gmail.com>
In-Reply-To: <CAA8EJpqAjx+K2GdKt=gLxsETa7nvH57f3RVbhhL6EftiN_8EuA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10587:EE_
x-ms-office365-filtering-correlation-id: 729f8b02-1169-42f2-c5a6-08dd152706ca
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YngveFNNU0dDSlBUSyt1SlQ2OFJlMHJaN0E2ZnF5SkQ3d3dPeDEyTVN6ajBM?=
 =?utf-8?B?dkJWVmh2akR2eXoyMkxJQ3duNjBCMTJqT2JoRUcvTi9KOVdtQ3JoNHowb2lw?=
 =?utf-8?B?TDNjUlBoOVlWTGowUVlEK3FSS2Rvd1BvUEpkZXRYMjVxMElSUWJ3bVUxdVgr?=
 =?utf-8?B?eU1JNlNSUUZTMlAxUW8wanF0SjFReG9GZEVCSEhnMG9ocHREZ3VhTHFLUllN?=
 =?utf-8?B?QjdxcXlXU2tPY3Q2bnR6T2o2N1FFRnVnVEp5Q21aN05LSUorV0Z5ME9sVURt?=
 =?utf-8?B?RWNjc3lJZ1BjdDR4QWY1NUcveUVsNVA1WHFYY3NHUXh2bGZPd21mVWI4U21V?=
 =?utf-8?B?UWdtVkRwdURxSzQ5azh5clBHVS94Y00xRm1GTU1vQlRLR1JRUW9ET3FoaHVZ?=
 =?utf-8?B?V05qekdhZ1l6Sy9GSmRrTUxRNWpMVU9FMUYraDBCTGNQcjJKRlVLMktJRU9E?=
 =?utf-8?B?eFNXSUMyMU1RaFBkQ2UwbWVsSjFVdTQ0VS9rS2pXUFZNUjVlRlRmcXpabldC?=
 =?utf-8?B?WjRsMG9admpRd1huNVZSMWhlWlBIdUFZTkJrTG0xaGh3SXA5MzhaRC9sR3l3?=
 =?utf-8?B?SWF3c0hCRWw1QktKSThyWGpEL0pmejBocldxMnVJSTQwaWZkMGRaZndQWkph?=
 =?utf-8?B?WnZUVXFMSENZazB0Qy9SSGNXc3dOM0RKTklkOXp5MFdoSjRFNTNVMitEbTRv?=
 =?utf-8?B?cHVHd1RTcXRSZ3ZXS2M2NW5OKy83bnp0YkFNL0c2aWdSbG5HWkw1Y05reFJP?=
 =?utf-8?B?NUp4a05aWEVoMWxvV2c1TC85ZlpXSTFKZ29sRzA4ZDFPbGlDRU5iK2FvUSsz?=
 =?utf-8?B?emtmbndOSVlxQk0vcUR2VURPVWNDWUFOUG9EZThQUHpPV3dOZGVkVUFKWnNN?=
 =?utf-8?B?bGV6dStweEpleHJ5UEo1N3k4UTNYOTcvK0djY1E5MjlFTHluZ09oVnNRN0ZJ?=
 =?utf-8?B?ZlRaQXp4ZHAxc2ZQaG1ZQnF2WUZLQWJiNEFNUjFGZVpVd1Y5RlU2eHFLZ1F1?=
 =?utf-8?B?MC81Qk9OK3BzSXVYYkFXQTdlVW1BWVRHU2ZXQ08rb2d6V0M1UmQ4NFJuMzdU?=
 =?utf-8?B?SGxyR2txNzZVR0dhUUhiZUNSOEp1M3dRbGo1Q0NCSk0yRUNLeGtmaHpPbDFh?=
 =?utf-8?B?TURlaU9Ha1FsWDdPMnplWGU3MWhSeGY1YlpySzFIQTRRYnZ6UjlNeGtZK1E1?=
 =?utf-8?B?NExaYU5OQllsWWREbU9zTFVFaFUvRVlkNFdOU210N29rUlNvTnRSKzNqd2Jx?=
 =?utf-8?B?R1ZjMldyVjYzL1hzOVFVYndRVkFrc0QwdUU2eHpGaXlrRkVTZ3pmeXJDWTg3?=
 =?utf-8?B?dG1Rb0lDdzhjL0F0ZHYwcnkyVzVVUG43MTQrYStZcGJqdnZKRWhjbDFNR0Rl?=
 =?utf-8?B?QU5TSlprUkFEUzJqRTg3NFozMUNOOThHL2pJV2QxRDdORkp3VEc5OFE2WmxY?=
 =?utf-8?B?VWJkMW95ZWV1dDVYT2k1VVFqM2VqTExTTWlwNUlpYUk1MnBBTzZOVFZZc2Zo?=
 =?utf-8?B?WUtBaUJqUE5QU1FzYngzc2VJakFZM3VlcityM0cvZDFCZzRMRXlMVW5vU0lI?=
 =?utf-8?B?ZEZIV1UvQlZxUDA0eldDaU95RnNaYlIzeW5mWlIxamUyNCtkTFY0ZmlUaDRN?=
 =?utf-8?B?K09nMjlIVC9HZ0F1ZWZYRlVwSHhOd2h0c0xOZkhOUHAwcitBMlR3eFg4ZkRp?=
 =?utf-8?B?aStCWXlQaVFUTzcwVk5hTHo5YVp2aFFpbm85cDB3Szdxanlramh0czRXQXNq?=
 =?utf-8?B?MmVIblhyOG9QV0g4Slp3S1ZHcHNhQ3pFc20vdjRPa21WQy94N0gveEZuSXZL?=
 =?utf-8?B?Y1cxcDV1OG9mVlRBWnJvbkN6ZkM2OVdmRFhBMXNqbEhaaG1sN1NHZUZjbzhC?=
 =?utf-8?B?L29pNkphRXo5cnNrbmNCZktCSGVNbktXaE50VlZZeG40RGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2J6b2RvSVBPTjFyUEF3aGtPb0NOUUJSMHFjaTJFcWRLb2Fsdk4veWlFbDhq?=
 =?utf-8?B?emN2d2RjU2RmSWYyYzhDZU5UdU04VHhXejlGNnBCYmNnWnRHUFRaVlhZU1l3?=
 =?utf-8?B?d1h3c09VL0lvajN2bXhocjZiYnhvMU5WT3lwZ1lMSmlQUnM2S1ByOHBFeEJs?=
 =?utf-8?B?UzlRbE41WUJ4Yzg5Y3BMZmgwa1BZVVhKOVdjVGhlS0JZdW5QVTgzSnFIREtK?=
 =?utf-8?B?VnlIejJHejBNSmFicS9MV28yK21laU9iejFoaXpXZVRINjBDTVJWdVF1R3V3?=
 =?utf-8?B?bSt6dUkyZVlaT2w1bHJzWldqUXltQklqejVPVnhzWERWc2cvaHlBbVQyb244?=
 =?utf-8?B?NnlJcVAzcnIyMlpaQ3pMdGh4emZtVVdRV0JMcGs5aHJ0eXh1ZTRWZEtWU1Jl?=
 =?utf-8?B?LzdhUzg3NXZDSUFoWFlTL2w5TzFiN2h4Z1JRTThiVnBuajBlYkcrYWZFRk5D?=
 =?utf-8?B?R1d6V0lNWWtDeXF6cUwraTluWlJHb3RVdERyWVU4elJKdFpEdHhYU0NrcU1W?=
 =?utf-8?B?Wm5TV0FMZHcvRFBaMjl6ZHU5eWg0czMzYTlJVWNqaElCOExWWVl3RC9KbDRi?=
 =?utf-8?B?MHJENlhJakk5TmJsV0wrRTRkVW4xQWsvTEdPUTNDUU12RnlZbnF2ZkNxU0hp?=
 =?utf-8?B?dTMvZnpwQzVCSzJmSUsrMWxScmo5YWI1STZHbE96U0F4RnJjOW5teXBqRWpZ?=
 =?utf-8?B?Z2ZydnYrL1FWVHg3cUQ0MjVYdTJia1RkaG8yUVZKV1lKVmxhYlAvbjBTNzZ1?=
 =?utf-8?B?d2ROcXpHeFN6TmJoTkQxclEvL0N0TFlMRFBNd0l3cEtYd1BZNERYVXdBT091?=
 =?utf-8?B?YXN0R20xU0lJTGQyM2QrVDh3TG8ydDFYejg4TExlN3pDOXh0OHlpME1NbG9P?=
 =?utf-8?B?TUpGb24zdEQvUnorNTRVV0dPL0NqR05uTFpiY3RsS3VIU3NZTlpjYk8vOFIz?=
 =?utf-8?B?V1lvZVZ1d2IyVmI1T2t1elJOOXdTY0J1Qk9ONjN1VXVFbG4zQk5pSTBTR1Ri?=
 =?utf-8?B?ZXlPVHFBZ0JpZm9hNDdlanpxN1BVRU5XUkRIZFdONGdKQnorL1lORHJZV1ZP?=
 =?utf-8?B?dmRkOUpJY2E2Q2ljUEJOak1TSitjQW9NNWxzb2FSMnZvbjFNL1IzalptbFdO?=
 =?utf-8?B?dHFzSU9ITU9nRWJBSGNBOG9TYjUvMkFkb01oUDlCbys0czlzV2ZKdDdIUkJV?=
 =?utf-8?B?d1ppSkwxbEphQlV6Vm5UZVllL1FFV1ljSmxNbEZxNWFyQVhaZXZabUFXc1gz?=
 =?utf-8?B?MmhLdlZENVYvaDFnTmhYQnJoMjhHVTNkakdHNCt5Y2tlSTFSOVZBUE4xcEpu?=
 =?utf-8?B?WWtUQ3dFU0ZsWDkzUGcxdDJoNmlvN0tIU1FHUFRVLzNGZXJuQ0orS3I2ODJT?=
 =?utf-8?B?M3lhMzhuU212Y1VhUDZEOGZFSzJ5MEtEbkUrdTMyT3NOT1MranE5K0t5Tmd2?=
 =?utf-8?B?RXdrOWhtQlYwUTBHK3dDMlhOdEZIOStCVkVZNXp5Smg2M1NYaVBOSi9Fck1Q?=
 =?utf-8?B?TFNIVHhSQnhtQXQwRjFQN0dqMnBSai9sTEVpZXdzTEI3VmRESmxqK1NpTkZu?=
 =?utf-8?B?ZkVmTFRxN3ZKRVFzU3VkZ0ViSkRkVFJ2cVRQeHVxVGQ1ZWVKLzNreHl5aE82?=
 =?utf-8?B?UStIcWljekpjT1BLMitVRExrRnNaM1VOcUhHR1ppKzF3WEtwS3VsOU9NaTRx?=
 =?utf-8?B?K2plME56TEUxRC9ZOFhMLzZ5dXI3ZWNKdXlxYTFJVk1haUI1SG9abXRPa3Vz?=
 =?utf-8?B?SnhmRjVycmlCZE5mZGc0MnBpNDVIeFhhTm1RY2tIVFdlRFpxL05rSm10VS9D?=
 =?utf-8?B?QTFtY2NuWkhOam9Qd0E2b21SMndKRkU4UXhtc1FwOTAxTjFETUFNanBaSlNQ?=
 =?utf-8?B?SmNXZXB3emp1bzhESG1yaWNUKzNrWWZ0aWxPQjUvM0tLZG1mSXlDRGNKMEM1?=
 =?utf-8?B?L2UyQURzemRmcVI5dVp3TjlKOGhUdUNEdHoxTkhCUEZqMmlTaW5QbnluVGJu?=
 =?utf-8?B?ZjlxS3Mwc0E0NkIwSUNqVVZUYTZjcDNZMHJJUDZReFE5VTZ6SUF3NGVhdS9h?=
 =?utf-8?B?Y2w0ZHdGWktJbGtoZmtMU0NCZ2dtSnlzaGoyVnE5QU9yVXMyM0N2TFJIQWJI?=
 =?utf-8?B?aG5ZTnBnc082U1FoWmsxandsVS81STRGQnlJcE1ldmMrWGxkN2l3RS9IM0Fi?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729f8b02-1169-42f2-c5a6-08dd152706ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 12:19:11.8092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71ha9bnXAb5hlPMaeM4F2CR6E2xEO7LqiNMB/TX2ht+d8zgr2I9K0O2jb4tx4BcHiWmf0MKkXX5Zv1hntfejHLrzB6qbGAiJ6vUL9pR7XeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10587
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

SGkgRG1pdHJ5IEJhcnlzaGtvdiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+IFNl
bnQ6IDA1IERlY2VtYmVyIDIwMjQgMTE6NDMNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2Jy
aWRnZTogaXRlLWl0NjI2MzogU3VwcG9ydCBWRVNBIGlucHV0IGZvcm1hdA0KPiANCj4gT24gVGh1
LCA1IERlYyAyMDI0IGF0IDExOjAxLCBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPiB3cm90
ZToNCj4gPg0KPiA+IE9uIDEyLzA0LzIwMjQsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gSGkgTGl1
IFlpbmcsDQo+ID4NCj4gPiBIaSBCaWp1LA0KPiA+DQo+ID4gPg0KPiA+ID4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4gPj4gRnJvbTogTGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNv
bT4NCj4gPiA+PiBTZW50OiAwNCBEZWNlbWJlciAyMDI0IDAzOjQzDQo+ID4gPj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gZHJtL2JyaWRnZTogaXRlLWl0NjI2MzogU3VwcG9ydCBWRVNBIGlucHV0DQo+
ID4gPj4gZm9ybWF0DQo+ID4gPj4NCj4gPiA+PiBPbiAxMi8wNC8yMDI0LCBEbWl0cnkgQmFyeXNo
a292IHdyb3RlOg0KPiA+ID4+PiBPbiBUdWUsIERlYyAwMywgMjAyNCBhdCAwNjoyMToyOVBNICsw
MTAwLCB0b21tLm1lcmNpYWlAZ21haWwuY29tIHdyb3RlOg0KPiA+ID4+Pj4gRnJvbTogVG9tbWFz
byBNZXJjaWFpIDx0b21tYXNvLm1lcmNpYWkueHJAYnAucmVuZXNhcy5jb20+DQo+ID4gPj4+Pg0K
PiA+ID4+Pj4gSW50cm9kdWNlIGl0NjI2M19pc19pbnB1dF9idXNfZm10X3ZhbGlkKCkgYW5kIHJl
ZmFjdG9yIHRoZQ0KPiA+ID4+Pj4gaXQ2MjYzX2JyaWRnZV9hdG9taWNfZ2V0X2lucHV0X2J1c19m
bXRzKCkgZnVuY3Rpb24gdG8gc3VwcG9ydA0KPiA+ID4+Pj4gVkVTQSBmb3JtYXQgYnkgc2VsZWN0
aW5nIHRoZSBMVkRTIGlucHV0IGZvcm1hdCBiYXNlZCBvbiB0aGUgTFZEUw0KPiA+ID4+Pj4gZGF0
YSBtYXBwaW5nIGFuZCB0aGVyZWJ5IHN1cHBvcnQgYm90aCBKRUlEQSBhbmQgVkVTQSBpbnB1dCBm
b3JtYXRzLg0KPiA+ID4+Pg0KPiA+ID4+PiBGb3IgdGhlIHBhdGNoIGl0c2VsZiwNCj4gPiA+Pj4N
Cj4gPiA+Pj4gUmV2aWV3ZWQtYnk6IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZA
bGluYXJvLm9yZz4NCj4gPiA+Pj4NCj4gPiA+Pj4gQSBtb3JlIGdlbmVyaWMgcXVlc3Rpb246IGlz
IHRoZSBicmlkZ2UgbGltaXRlZCB0byA0IGxhbmVzIG9yIGRvZXMNCj4gPiA+Pj4gaXQgc3VwcG9y
dCAzLWxhbmUgb3IgNS1sYW5lIGNvbmZpZ3VyYXRpb25zPw0KPiA+ID4+DQo+ID4gPj4gQWNjb3Jk
aW5nIHRvIGl0ZSxpdDYyNjMueWFtbCwgdGhlIGJyaWRnZSBzdXBwb3J0cyBhbGwgdGhlIGRhdGEN
Cj4gPiA+PiBtYXBwaW5ncyhqZWlkYS17MTgsMjQsMzB9IGFuZCB2ZXNhLQ0KPiA+ID4+IHsyNCwz
MH0pIGxpc3RlZCBpbiBsdmRzLWRhdGEtbWFwcGluZy55YW1sLiAgbHZkcy1kYXRhLW1hcHBpbmcu
eWFtbA0KPiA+ID4+IHNwZWNpZmllcyB0aGUgZGF0YSBsYW5lcygzLzQvNSkgdXNlZCBieSBlYWNo
IG9mIHRoZSBkYXRhIG1hcHBpbmdzLiAgU28sIHRoZSBicmlkZ2Ugc3VwcG9ydHMgMywgNA0KPiBv
ciA1IGRhdGEgbGFuZXMuDQo+ID4gPg0KPiA+ID4gSW4gUmVuZXNhcyBTTUFSQyBSWi9HM0UgTFZE
UyBhZGQgb24gYm9hcmQsIG9ubHkgNCBMVkRTIFJ4IGxhbmVzIGNvbm5lY3RlZC4gVGhlIDV0aCBv
bmUgaXMNCj4gdW5jb25uZWN0ZWQuDQo+ID4gPiBXaGF0IGlzIHRoZSBzaXR1YXRpb24gaW4geW91
ciBib2FyZCBMaXUgWWluZz8NCj4gPg0KPiA+IFRoZSBhZGFwdGVyIGNhcmRzIEknbSB1c2luZyB0
byBjb25uZWN0IHdpdGggaS5NWDhNUCBFVksgaGF2ZSBvbmx5IDQNCj4gPiBMVkRTIGRhdGEgbGFu
ZXMgcm91dGVkIG91dC4NCj4gDQo+IFdoYXQgYWJvdXQgdGhlIGJyaWRnZSBTb0MuIEkgZG9uJ3Qg
dW5kZXJzdGFuZCB3aHkgdGhlIGRyaXZlciBnZXRzIGxpbWl0ZWQgYnkgYSBwYXJ0aWN1bGFyIGFk
ZC1vbiBjYXJkLg0KDQpCcmlkZ2UgU29DIHN1cHBvcnRzIHVwIHRvIDUgUnggTGFuZXMuIEJ1dCB2
ZW5kb3JzIGRvIHRoZSB3aXJpbmcgdG8gYnJpZGdlIFNvQyBhbmQgDQpjdXJyZW50bHkgYXMgZmFy
IGFzIHdlIGtub3cgdGhlcmUgYXJlIDIgYm9hcmRzIHdpdGggSVRFIDYyNjMgYnJpZGdlIFNvQyBh
bmQgYm90aCBvZg0KdGhlbSBoYXMgNCBMVkRTIHJ4IGxhbmVzIGNvbm5lY3RlZCBhbmQgYm90aCB2
ZXNhLTI0IGFuZCBKZWlkYS0yNCBmb3JtYXRzIGFyZSB0ZXN0ZWQuDQoNCkNoZWVycywNCkJpanUN
Cg0KDQo=
