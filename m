Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A73D385EE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 20:32:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF0910E16A;
	Fri, 16 Jan 2026 19:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="dlmZiRUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7EA10E16A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 19:32:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsG04aTGi7naNxb7XhsWtAYi8Hu5AWjmlOXKk2ZosWNrtakURQMNItGbrKpquuiEPz52XFH6s9vCwF219ZpY/oYvhlGRK+6bCOG7cy2lrQwEHup+wQxhxQp/81D2xyQSkpYbYAm0nqrTH8q84a/BGCBQNThCKqU3x9CbuIoThp7HggBGC9cyrfzxJrAeVqLvkCIrTALI0QNFGTidZw8xDsbUF1Bf8okkkdUwUbLARkJY4F9ZXSjxByNO8ilgRVvbXtJYV38iomXlEMMsts04wHRNADfbhBqU0MOLxVgaj4jiwNkhMCYy16m9ZTrPqyeew2pxcKAD/f5GQqj2Jwrn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJEMEUIxop839QGbgbNe7gvsjV5UN4GmzgSarA9Ugwg=;
 b=qjoSROSGJYNyDUh1uf8IqXv8TJVl0u/eT5pi8ipjBeAfLJRjAC9PuDyr8lCRV1y6QX0Qfwf92vAkXFbMbR1JQhbGSc+PuTWHKsBf1eGrMc8ccToXbCtfKuz6R+Jt4s5w3xCOPbPvMwmG5nRhlLaEW6aKfy6mvPzVAGMCmfWsBq3hPI3Ql1gfVLZzd0kNTXI2yEHAa9cZjfheyRrMermdbKGPGJIKVUsLkyzQXhRypCEWHPtY3vUC53lv+BX0SxDxyThAtLJBd5eL1X5UxR9ZeM/UfZPqXqfhfMCr5go37yhJ/PK3fXPmIeUDQNAf1UQiE1CBcUDKArvMvSOS4Bsc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJEMEUIxop839QGbgbNe7gvsjV5UN4GmzgSarA9Ugwg=;
 b=dlmZiRUWejcbRts5FHw61jrih2/1ChoJYcxOddldtvUOQYxzKik6puBPsMN1a/0Y8q97vtmxCjBEJ3T3bTRNg+JLMiPENp43u5gCS39hePY56T/22vO+zW6l+Bwrht3cvWkTYUyY0ggcjNFMZECKSp7wV5wYzAQwtThXCiPjh8A=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYVPR01MB10732.jpnprd01.prod.outlook.com (2603:1096:400:2ad::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.8; Fri, 16 Jan
 2026 19:32:29 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 19:32:29 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v6 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v6 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcXUO7FScFUVs6uE+xTE7uY45vjrVU17yAgACquRA=
Date: Fri, 16 Jan 2026 19:32:29 +0000
Message-ID: <OS3PR01MB83190C28CC87EB7CF17D8B188A8DA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251124131003.992554-1-chris.brandt@renesas.com>
 <20251124131003.992554-2-chris.brandt@renesas.com>
 <CAMuHMdU9cd3caJb8pk6S6anc_jNKnWMHoUmhezUwz7eBUmvAOQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU9cd3caJb8pk6S6anc_jNKnWMHoUmhezUwz7eBUmvAOQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYVPR01MB10732:EE_
x-ms-office365-filtering-correlation-id: eb2953f3-5222-4cf4-61e1-08de5535fcbb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TXdsTktNNG4xMDZBbEw0RjluMEdDYmIrYTVVMGdSNE92MmhiSVFKQXdzZ09S?=
 =?utf-8?B?REF3UWlIQkpoWnhrN3lKVXhOS0M1NGEyZHR2aEJSb1pYWUkvZXVoUlNjaFF0?=
 =?utf-8?B?WVRheFR3QVMybHVCallqSC9IVm1XSXE3NUQ4ZWVyWEhocWdBcm1pWTB0YTJl?=
 =?utf-8?B?VTZmUjNHVlFoZDhIR1hhVjc0dWlaTVFVZ3Q1aVFaY2k1MkkvTHhnZ1VSZk1Q?=
 =?utf-8?B?K2dCRDc4NnhpZmYrMzdYV2JzM3JCWko1UDdIY1llTWVWTkgxMGRaaG1RaFN5?=
 =?utf-8?B?anB1QThvMDhUNHVNaDFpNm4wb05IQ3NXNzdPUW9kNWZsTENaYks1cDFFOXZj?=
 =?utf-8?B?Vnp6SWloam1yMThDQlZlRnhEa0hDYVozNGhCUUhIY1B6bEpRZVNNTVZHdDBM?=
 =?utf-8?B?VkFoektpNGh6eGFIU3I1c0Nlc01USERyV24zaitiZHBQeUd6ZEJuWkdYQW13?=
 =?utf-8?B?MzNrUjN5cU5wbmU4SDFPT3huTDFMT0VvYUFqa0xKamVOVStFelZyMmRBMGNk?=
 =?utf-8?B?UFZ6YSt0S3V0U3BOSnZSTXhBV0dUdThJNkxHMldZMUl0bGM4TlpTcmprcHAy?=
 =?utf-8?B?MUltNXlZNDZJeWVEcFc5UDdLL0ZyaGVMOWdCclpwOFdkUGVmYnZqKzBTWFhp?=
 =?utf-8?B?YUo1Y1BFRkFjY3hSZlFpSUlLUG9pNG55N3gxV01QMjgvUml6TlZVd1VMRmdr?=
 =?utf-8?B?WUx0eFRQckdHMFhwczZsbFJBMWxlWTFVMGtWSGt5M2MrTElnbU1qcVlFWHla?=
 =?utf-8?B?R29DczlCaHVJTG1UUjFCeW5NRlROOTdHaHM5dDNZM3lSNFpXK1lvZEIyQXha?=
 =?utf-8?B?WlJuTDRYeVhIZy9PT3J6ZVRrVjNPMnJ5OTJvOGVzYWxDQ3lqV0dhZFk2RGl1?=
 =?utf-8?B?TjgxVG9TdXQ4MDlTb0NIWmFUR1dDcFo4bCtHRThFVU5xWHprNlUyT3ZSbWlN?=
 =?utf-8?B?cVM2Rk9NU1hVK3dSSUNML0kwSEF6S3o5STJ5SzMrajB0TjZ0S0NqakNOamdz?=
 =?utf-8?B?VjlPam81aG5FSi9EZ242ODZ2bjBGblJRb2NyVm5FaTAwZlNjem9qeTBuVng5?=
 =?utf-8?B?L0NvbE5iWXc3d1R6dkNaaXZ1NU0xc3dONkN2cmsvSkhnQnRGN2tObkNQaWtq?=
 =?utf-8?B?Y2ViT1E0VEJMNmhGaDhyT0hLMTRxREUycDM1QnFBdllCZi83c1pDYjNtNlp1?=
 =?utf-8?B?MENlUzN4NHBOQWp0SnlReXN3MDlLaS8zaS9GWno2Z1N6Wm8wWGFzL0xReFlz?=
 =?utf-8?B?NkVwd0ZndytJc1R1dy9iS0FuSzRqejFGYkdkN0YxRzVEbUJBSEYrWWMzWm41?=
 =?utf-8?B?TmF3Y1V3cDJzVTJOWVR5anFPbCtQbkpzMVhseVQ0NC96anVKV1ZJVko3Uzls?=
 =?utf-8?B?MU5PTHpFWktLeXRnWFpoMnNOYVNRTHExSTEyQnVYSEpFMHZ1OUFkZnczb1dM?=
 =?utf-8?B?cW43U0doeFJwRTdJR2xCR2srYWhhbDdVY2xvY0RnVkdBZU5iMXhORVB1cStn?=
 =?utf-8?B?eTcra3hwK2lMbEV3VGVWWnFhaDVsS29NcjIybVBuSlVNNWVMNkZNdmpJOENQ?=
 =?utf-8?B?OWlJWVZEWHhlL1lrN2Uya2IvTitzRUpOR3BIYUEvdTNmTmhnUW9oT3NaeEJN?=
 =?utf-8?B?MU1TL0cxZ2hWRFNaMmxKcHZ4VVI3UTNrTG1PMHZTakpsazdwY0RrWjdFdEdo?=
 =?utf-8?B?S3RCeENiRFVEM1pYbnc5ZkhFVy9BS0IrUkhIVGRXdndPWGNDdUJ2OHJxb0Jl?=
 =?utf-8?B?eDE1cFlXbWZxMXViTmF2ZEZvaS96M3pXZDVEVXBkL2VMU0J6R3NWM2lORUpi?=
 =?utf-8?B?RFd6ZG9Ia1U4Zlp2b3prUmU5VE1WSEZySG1paThqQVNwSVFYQXoyQ1R1UEhK?=
 =?utf-8?B?dGZzeThUdEpYQTVpMmpsQU1wd29mbW5FYnZ3cUQxVm1SVy9SZHY5cDhJMll3?=
 =?utf-8?B?dndCeXYxK2tLSTlBWDM5aVUwNVJoQ3NZNkYzZlBDYjdVcURhWmpwL1d3aWth?=
 =?utf-8?B?cHNadklIV2FvRkhVZWk4NzdCSnFneXNqOFNKZ2pNSWVzaGhyeS9heWtaeWpV?=
 =?utf-8?B?cnhLcTJCV1NmQlZoYi9reWIzbER3WHljNkpsZHgwelhsTndOb0c2VE1YQkxz?=
 =?utf-8?B?MzZja0p0aUdmQTh1dFhqSzBZWTgrSW5KNUxUL0FDQlNWQmFBWncvUjN2Y1Qx?=
 =?utf-8?Q?WR2HnZXdLeDm4sCy2tKyHjQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFJvWkIxdXpNTmo4UTZLNDF5RW83SzQ4NXdEK3N3encyeHBRQjVCemRWcWZM?=
 =?utf-8?B?ak9JalRsc2xudUFxQkJLaDU4dktBSUNHRUxDc3V1SzVvMVQ4MVhLNnkwKzUz?=
 =?utf-8?B?QmRlcnJsQVBHS1FPek5oai9XQXpyVC9Ub0hVSHhLU3J0VDRGV01vLzc2U0pW?=
 =?utf-8?B?Ly93c1JJQm83YURmQlhPRk91ZDAzMHliV3ZpNG9kYnJld09nWS9TY2h1ZW9y?=
 =?utf-8?B?SDEvWkYzbkNBdVRvNmZSMGRXOStIZU9aOFZKWGQzRm9OdFZXZ2ZpRUNna0pm?=
 =?utf-8?B?Z2hJOGw2R0ZwVVVnakFUdllNMW12Q3dibHFRYU41RnFNc2RmUGZzL0h4VG4w?=
 =?utf-8?B?YlZwQlMwZDRTZktaOVVGdG8welRESzNQWW1jVVlsK3hDcytzOFpHV2VTclZ3?=
 =?utf-8?B?M2F2WmJLeDhMUWRkTjNsUXZlRFd1bkloNFY2QkphTjR2Y1hJZVVhNi80SDlR?=
 =?utf-8?B?SHRUVllPN1VRVkZ2cTJLZFFGKzZvblpFU2gyZjYvMm9iSG1FWGZOdXQrcndG?=
 =?utf-8?B?ZVlHR2RoWTN2NDNMdXcrWmNSVGJxMFF4YWFoK2RiR1lYZDQyUHZSOG5QQ3ZS?=
 =?utf-8?B?TmxJZmlva25FU1YrZFlJZTB4RUpLMlFmMGZMMEM5aVQxSjFnT3ZOQ1c3ZFlM?=
 =?utf-8?B?clFWTXhRTjdYa2piZE9CSUE0TkpKeiswZ2drSldyU3M3NzRjVVpxZ3ltWjZu?=
 =?utf-8?B?RzgrV3pPYzlkRTA5eVJIY25QUm9UeXFLS2FjWllMc1MvYzNIUWFJTTlXaWRC?=
 =?utf-8?B?OEhsVHRuamFwcitRY21Nclo5anM1dm9vRGpZOVJvRHJqTTdQWVVJTlVEVTd6?=
 =?utf-8?B?cFl6dHhsVFl6eHhBbkV4SmthMEdwMldOYlpoaHp0Z1dVZkdld1ZLZGUyby9H?=
 =?utf-8?B?U1JEREgyMXBEWTBLd1FwWTVSMFNLcUt4eXB2YUV3WDYyN29aMzdpeC82Y0hD?=
 =?utf-8?B?ci96NHhXc0l6VDJLMGRhcHoyTUhScmxoeStVZDRWcEtvZXMvSXRoRGJ2QzJm?=
 =?utf-8?B?SSt4UFdKWWJXR0IvWTNXc0JHSkhKUmR3OWdSMlYydEZnNGhKR3hLY3JYd0hp?=
 =?utf-8?B?SVR4bVBJcXRIWDVnWEdEZXFvbkhUcTF3dlR3VCs0NGhTcThBcWMxR2t1R3Ay?=
 =?utf-8?B?cnhvSnRQT2xPTnU4djJqVng0RlduRDlFTUZXdENZOHVtbkRiZ0h2ZVcyZWcr?=
 =?utf-8?B?ekVTOTh3MFZPdVBXNkxHbnlZNDVnWlBOTC95TEhoYSs0cHprM3grOUUzUjlL?=
 =?utf-8?B?VnlPaG9od3dDYVgyeE1KNFNTanprTlZ2NGFMV0d3b25CZ1dJRXIveU9aN3pk?=
 =?utf-8?B?eDJPSzc1NWYxdjNOSTQrMVVhdGkzd1RvVmcwdVI0VXhZVmhuVzdZMWtsK1A3?=
 =?utf-8?B?ZFpnRzZNa0M2QmFib0UwZ3BkUTV4Ri9qTm1yRDAyeDRhTVJRWEhBV2RHK2lC?=
 =?utf-8?B?bHlqNEo3ZllMSTFyaU5EUGhNWWs3NEYwRU9vOHdhQUVnYnVZbnJTSDg3ZXJV?=
 =?utf-8?B?dUMza0xDUnl1RWhSV1FvbldUT3d4RytDVEZ0ajZnUGVCWW1Oa0h3cHN5SlNs?=
 =?utf-8?B?dnIydldNWmpUeG1KUk9Pajg4NDdJUzBNS1FadDNMcGl4dU1kYXJFVnVoaW5S?=
 =?utf-8?B?V3lqOGlYRFZBYVhvZERJd28zSVVzWUFHZnA3eHBoa3VMLzl5bGRlNytPS2x5?=
 =?utf-8?B?RjE5WVVLVTEyMUZXem1taVZicVQ3QzdwZWY3bEFLalkxT2wvaml5RndKTWpn?=
 =?utf-8?B?MytRcWtneVNFV05ObE9DRVhEcHNWc3h0blhTNEpPaTZYSittK0RqWTFydlBD?=
 =?utf-8?B?cEpZRThUV204YXZJK1YrSFY5YnBmNnlpRUJycVFtK0N1TnlWRXBTMzlUSlQ5?=
 =?utf-8?B?cVd6REliN0o0SjBqSlh4QlJ4ZFd4dXVLNmkxZk0xQWRHNzZqNW00UHpEUUY0?=
 =?utf-8?B?ekNhMXNFVXJXa2E4RUJxSUxTbWpCUDZkSzgvUk5pdW9MajQrVUNlYzJVQWFV?=
 =?utf-8?B?TS9uS2hwSVVjc0tndHFRbnV1ODcyU0hqaEVTRUdnSkxMVFlSdllZdnBuYWdQ?=
 =?utf-8?B?UnRQOFFDbVBVM2FMaG1kemZhUHVnZXorRW1FVFFwdWNsMSt1cXozU1BlWVRy?=
 =?utf-8?B?TE5QQ01MbUZZcWNLZjArR2tiL3NpM1M0NWdNRWJhRmdvclp5SGdNaXJhL2RG?=
 =?utf-8?B?TGVyNHEyNGg5elZiZHFpQzlsbVBUamtuUG1mMVdGREllMlZWMmdYd1A4Q3pl?=
 =?utf-8?B?WWxSK3JGazVXK3Qwc21jR3hSTVpqUnEzckJJUm5uU2FOT2E0akp4NmFVb29p?=
 =?utf-8?B?aEFmc0ZBTnRZRGIxa25xOE9wWEhVcFUvS1JCWkw5UmQ0R0hPWXU3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2953f3-5222-4cf4-61e1-08de5535fcbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 19:32:29.4567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLi7rZpVuCS/Jtyh8/1O+rtqXSRrNnA8TQF4GzI2f//2gTBQHjsH7MyPr4gWYokFY6biSO8A/5CSsJTaT6VFrCOzUvkplQn7DJMt/rNLLBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10732
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

SGkgR2VlcnQsDQoNCk9uIEZyaSwgSmFuIDE2LCAyMDI2IDQ6MTkgQU0sIEdlZXJ0IFV5dHRlcmhv
ZXZlbiB3cm90ZToNCg0KPiAuLi4gdGhpcyBkaXZpc2lvbiBuZWVkcyB0byBiZSB1cGRhdGVkIHRv
IERJVl9VNjRfUk9VTkRfQ0xPU0VTVCwgdG8gZml4IGJ1aWxkIGZhaWx1cmVzIG9uIDMyLWJpdCwg
YXMgcmVwb3J0ZWQgYnkgdGhlIGtlcm5lbCB0ZXN0IHJvYm90Lg0KPiBJIHdpbGwgZm9sZCBpbiB0
aGUgZml4Lg0KDQpUaGFuayB5b3UgIQ0KDQpDaGVlcnMNCg0KQ2hyaXMNCg0K
