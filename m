Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB78CD0A1F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 16:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B946B10E4A7;
	Fri, 19 Dec 2025 15:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M1DOvb3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D86510F02A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 15:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5lyXHQpJuPZhcw6/qjsLzpk6AsfrIRZoq+0MIjigH934mU0mskIZYY09bJbxzwLp/dmy82MX7IgL6+5GyYV9RNycag4rAUE81IDe5Jvl22K7cKJfQkLCcYyNeRiuq6o+1mpo+pOWTS+7rF+tJYPjzB6HMx4gwm1bE3wPq9D3Bnz3y2ZbnaGagjHOwghj1K0g3Bvdk5zRZBeYHUEgWu8ZWbq0CDSTHX5OkcHX9iJJUxKjtKGghIDPRQ+Mnb/UuuviPxu1XF9fANwaBJox+v5brnv0FepNt5nzUkoabD32fWF19+9zywnUAHzd0coHfW1gcn3Bg16PMDjUUxRlBchrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZEJcSC9dBS0xth6NS4/s5U+hzCkOh4wwiiBPp1Ym6s=;
 b=tp2UWgunnB10LLMVHirWis5Ku4ddYnY9jyCxyc2OBih3KgGpLkmwArCUKuRQpBCVBiyf0IAOMqUuWKDTg832cfcAKPT5nxfRyh/HKklC6PCJlU+TiqieRwV6EKpdQLamM6Rt1XlsivBJAZrztvQYGSjzt3PCmGqlPCAbReqZ3wM6LSNIi4EaefKm1hAPmvMwWLc5UFZUvv4Iv5OGqvMcMrDHi+uPEIUyTAg6BZu8EHKnJ2c+Z2rvavr1XhuakAWyC24glzPVPYFEBO7Th1gro+A/SLq0ZbajT9xfmzAuvGHLcjf2L65S2cgBtSAIHrM6owpBDzRVAPoDWOkbxaT1gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZEJcSC9dBS0xth6NS4/s5U+hzCkOh4wwiiBPp1Ym6s=;
 b=M1DOvb3p87K2OKCrBP6GWxnagDWy6bvOWK+8coI+oPfN7DBkZfEqj5u0K+91/vpIcAoGLwVpVACoHABawdV+dLy76JA6gjReP1Ms0ZLTI5X/UPlBiWvkWWqq5LsdalY3jVEwtnThvDUGgFVWtffciEt8S7CyYiF7wBJscjYUesQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7059.jpnprd01.prod.outlook.com (2603:1096:400:c0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:50:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 15:50:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: =?utf-8?B?QWRyacOhbiBMYXJ1bWJl?= <adrian.larumbe@collabora.com>,
 biju.das.au <biju.das.au@gmail.com>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Thread-Topic: [PATCH] drm/panfrost: Add GPU_PM_RT support for RZ/G3E SoC
Thread-Index: AQHcZFOA+GIugFCTB06Le7W8wzatY7Uo0NWQgAADboCAAAEqYIAAEFcAgABPHSA=
Date: Fri, 19 Dec 2025 15:50:38 +0000
Message-ID: <TY3PR01MB1134652ADCC3E78D51D7674C486A9A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251203125104.67596-1-biju.das.jz@bp.renesas.com>
 <TYCPR01MB11332FE6BEA86E8FBBD4707DC86A9A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <zdeak3e65wt2jw7n6rcskyeokmyt7cxhsrvwaeqodp2yjxw7kg@vbqza5hpnrym>
 <TY3PR01MB1134676D5905B0AC0127955DC86A9A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20251219120414.58c89125@fedora>
In-Reply-To: <20251219120414.58c89125@fedora>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7059:EE_
x-ms-office365-filtering-correlation-id: 12d628e3-d63d-4774-eb29-08de3f165b34
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?b3BpemYxSVVTNGtONUtzN3dsbk45V3lMOC9uY0VOVklQMWRUUlhxTjFBNmZh?=
 =?utf-8?B?V25RM20vTmtPNE9zVUx5Q0lyWjJFT0tYcGU3b2syeVBXSllmWU5MLzVEc0FP?=
 =?utf-8?B?aFQzRkxDbkxhSllLTTlWNTRtUkEwK0RyYzRaTGlZN2dVSHVOYzB5eW1tSUho?=
 =?utf-8?B?aDllbDFTRWpPN2lkMWxGbXV1dVV2YWt6SjNTcFRLcHRvZmY0N3BVNU5zWUN0?=
 =?utf-8?B?U3dsZlhLUzdvNVNpVGxwOEM5N1RWS1ZnYm9JWTlnRC90RHdCVm5YRG0wUWdS?=
 =?utf-8?B?L3licmYyVGNBbXdkRkpBQ3RWUDZYM2NnWStObVczQVR4UHBGNnM5aEZ3TUxl?=
 =?utf-8?B?SElmSTByZ2RIUE9IMzNoeUR2SEJjS29vRDRwRHZSa2VLcUdKRnVjNVh3SU5a?=
 =?utf-8?B?bTBxMkNPUXMzWVRVVFdsS2lqQXpoWmtKRmtHcFluV0M4TTNvOE82VExTV2lv?=
 =?utf-8?B?cXEzcDNtZ1VUdWd0eFR1SW12bE90YW9RTFF6QU0za2ZNelRlOGltZkt6V3lI?=
 =?utf-8?B?UGl2RGpwd2dYeXNSODlmbVR5YlkyWnhqcGhpRG1pTDB2WENuZ1doaTdPRWZD?=
 =?utf-8?B?YmJQY1ZYM3FHYzlZc09yZWsraUVrd2FWMkRJK1BHQU9ja1F5MmpFK3JHQkg2?=
 =?utf-8?B?bHlqT0xCM3hnNThKdE8rbHlyaHo3SzJXZjhZQW9HdmQ2NDBpMGdzc1ZQMi9q?=
 =?utf-8?B?d1pSU24zcmR5YStOMmlRZ05sSUVXNnhXdTdaUnlXMFVGRjFUVkthMndCb3M0?=
 =?utf-8?B?VXlLZ3dMeXJLVmxCYmpRNHVQSHc2eHpvazhsYndrR2NiZi9hS09yaVJ0Y2hp?=
 =?utf-8?B?eWtZd21mbmZ1WW9kZHFqNXRrL2VOVCtDZy9wbTVKTnJGcDQ4dTV4ZkFmeGlL?=
 =?utf-8?B?MWlNVmdCdWhXZDVhb0lQS1VLWlBOUnc0V0hPMEZlbnNHVWV6V1JaZ2RiSXhm?=
 =?utf-8?B?dDFXQ3BaL2IwUkZTZVBobUd0c05tTXp0NkRjR0pNSVh1dUg0RHR4cUY1WWRW?=
 =?utf-8?B?OFphMjU1ZWkzNGJGejNBdkZIRGdnUHNZU0tzUkRFbmRnbDVMejVKODFQWFhp?=
 =?utf-8?B?K1V4WG1OQ2xQV1NKM2RJMGF3aWtlNGZIdy9RTG1IQnk1ZWRVM0JVSXduc3Uz?=
 =?utf-8?B?YnYvc1RJOERyOGdycndHZmdhR1Z4VmRFUVhyVG41bVBWclRMWkhuQ3hyNHZC?=
 =?utf-8?B?ME9aZlRTdG9CdUx1ZlRIbkxNeGJHd0h0U3hQcWJiZEdPdDFxVGFtYW5IcjUz?=
 =?utf-8?B?Qk9obDFQdTNYV2d3TzhYUHhYVjExL3RnRTZ5eHp5ZHlxWXJ5Qk5NUmhHUkpw?=
 =?utf-8?B?YnU0RGtHb3haZlE5MlFuZGhheHNPeHRRbE15dFhsakYzSVcwL2kyMzV6WnNv?=
 =?utf-8?B?akhSUk13OFFSNUR3NVBDT21lQW03eGJSaGxxQkVITDNJb25kRGpRbXNIS3BH?=
 =?utf-8?B?VEVEcnVPYS8zSFNaa2ZxYlVteGxoL1lpSm5Yejd4aEdjQ2U1YzRmdkhWbitH?=
 =?utf-8?B?UDMxSlo3OVdUVldab0xWRHczNTJPNmdXbGs3Z2R0K0RzS1loRk1MRXN5bnFZ?=
 =?utf-8?B?SDAzQmhSSm5qaFM1cW1vVGZnQTNoeWNqQUdVQWtsRll1czEzU0hIckR3NUJ1?=
 =?utf-8?B?SllOY1ZOYWtjY1BUek1MU3VKb2ZsQ2VxYktXcDc0OEttcHFCbDhiV1praldT?=
 =?utf-8?B?eGpqRkVTQUhRZy8wVUYvNnQrUVlKK2JsU21DQ0dCT0tCMXBEVXJRTk5DdWpl?=
 =?utf-8?B?WUEzRFQwamE2U05xNnh3Y3ZOT2thaTBYbHAyY3IwTVJxbEJsYzFTK2M3SDFV?=
 =?utf-8?B?NExBRHk5QktYdHFYbHF4c21DSVl6ZFYyZytiaEl4YnFQOHAwcDZmZ2NpRlRk?=
 =?utf-8?B?UVFpMmNjanNLYURHZXhDS0xwWkx5RUVDeFRkUWxQRjBVQlE1QXdlRlI1cDVQ?=
 =?utf-8?B?ZDF6alZRZGF1U0EySm9USEFCc0t5MUluWHVrVEZibEJqWU5ZNVo0V3lSeUg0?=
 =?utf-8?B?b3VXNTJtVFRVd0J6aG1UMUdJR1ZaOUNWcXMrVkR2MUVNZDNiS29RU3J0a28w?=
 =?utf-8?Q?FMW/ux?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0paNXUzR0VPRFFKK1hYTE16Ymx2UG1Ca0RCTjZHUVFxbEtrWFJOOHZHL2Vi?=
 =?utf-8?B?bkEwVHRIeTRGRkhOaUx2aVExZDVYNEFVWkFlTGRRbysyVmdSWWU2L0dOYjFn?=
 =?utf-8?B?MGpFM1NocDdGVUNYTE5ONTBPazdxZlRERU1SSG01akR5a3ZDVW5sZjBTL1ZH?=
 =?utf-8?B?S2hDekFLYnNteHdhZ0ZwMHJSajY0dk1jZ213OEFCWVdzQmFrd2lOY0hiWUdH?=
 =?utf-8?B?QWZWR1hxOHJKWTZyVlNvbDRBRG5WYjBwUHROL1ZWN1FHVzdBeS8zRUlBMncw?=
 =?utf-8?B?cjhjYWdkU2NpWWY2S3pyNCtYQlVsQUIwZUJSZGM0VG0rL1RNSGVkWk14ZDQv?=
 =?utf-8?B?UWJUWFpDVkNXaHNacm5TTDgvZkRvQTYraHYvZ0sydU12ODZNT2grdFhTcjdy?=
 =?utf-8?B?dW1pZy9HMjdQMEE1VmVPa1p6amozelJYaFltU2gwb0lLY1VzNWM4VkpIVWQv?=
 =?utf-8?B?MHB2UUFmdDVPYUw3aC9TQmpybnNUWjFLcWN4TTFZRXJGNktjd2tEejEvdVNW?=
 =?utf-8?B?c0p3a2NUTXVSdHpjWGtkakxNTXBvcVQ2R3lLN1lBS2RJcFk4TmtQTVU0MUo3?=
 =?utf-8?B?eHdsanpJSEZaVVlBdm40RXMwSGkzOHRSYzZYckhFNkF6cWRyelZZZ2RLSGZH?=
 =?utf-8?B?enJLOVJRTDYyREFnZzZzVnZXdDlOT3pSRXUwSE55UnJNOFQvM1FXL0FmMUtB?=
 =?utf-8?B?THRzWkg2dXdPbGFvWkNFekczWFY0UzVHNFFZUHZhallvMCs5K2ExV1U4Ykkr?=
 =?utf-8?B?bXN5SkJOU2xQdjRxQ2tqMDY4ZzZqU28zQ29aclRVSUtaeGYvd0ZKNXZKRlha?=
 =?utf-8?B?bEdieWQ0SzFQVmg0c0pVWnBQSTl4dHpmeGx4YTdINHBjS1lyOUZuRmNRVDNm?=
 =?utf-8?B?QWFHc2hFc2ZQbGNKRDFYUWIwQVhhVEI4R0tkd2tZZWViTGRVcG1WVExPaTYy?=
 =?utf-8?B?RUtFR202UUVJYm9jalBDVHI1VnMvcmRLVFRFcmJPL09wclRmWWx3Q2xISFV0?=
 =?utf-8?B?Z3dJU09oZVUzaG1CSHdEQ2sxU3Z0bmcza3VnZmxDT3lQYy9vbFplYnJLYWxH?=
 =?utf-8?B?Ymg1WkM5UUJaVmFKMFluVzlHbzJZTDI1bmhUNFA0cWliZEFkYTdwV2o3YnBv?=
 =?utf-8?B?NC9GN3Q0UHJxT1pwK0QzMXZKZ0ExVVhhMG82cnBFdWwvU3ZmZ2lSd1hTTzk0?=
 =?utf-8?B?dXA1dm1xOS9ST0IxZEM2M3IvbHhxUFdJY2lhNkoxS01PcjVLODlnMHBMdWxa?=
 =?utf-8?B?aXpkZTVyYTJuTy9VWEVncGRNcVJ4RnZBS3RKamJWeEFnNmN5K3Y2RXBMeHVs?=
 =?utf-8?B?MHBsTXlwWDdTWTlTdWpYRnNDUWRVSXNEQ0F5c3FVQWhyT0Q0c0lydExrVWt5?=
 =?utf-8?B?Zm1kZmF0c2hmR1lYa1AwdHljUzI0Zi8rWGRIZkZYbWNyeWdCYzJyTGRlNHZq?=
 =?utf-8?B?d2RuOURnUmhVTngvTWtYWXdDRHJLUDN5blFrVUJFQ0ZxcnJXNHd4MnJ3L2d1?=
 =?utf-8?B?SVBuZ2cxaXY2aERJY3ZWeE9YMWZNei8rK1Q2SnVsWVFPWmhqajh3SjlzSzJS?=
 =?utf-8?B?Z25oR0QwT3orUUJJN0tKQytKNExnWHNrZ2VWQTR3WVJkUUFVdyswU2dvL0tB?=
 =?utf-8?B?dHBjSWtYbHZmQ1ZZWUQ2TkphSzg2SFg4VEM1cE1OZVNFek9ySnpuOW1LWHhF?=
 =?utf-8?B?NjBrb2FCVWRDcUxiRmFtaXdmVmNRZmNjV1puVVlZTk9wYkxXTHh0WENzMkNx?=
 =?utf-8?B?U0kvbXlYTDNjMUtxUExHa1RKbnFKcURaN1d6UWowZWdLZGlXQlBreE93L0dY?=
 =?utf-8?B?ek5OdmVZY0JEamhMNjBIWWh3bVVKNk15YVJMVkxzZCtWbkpDdThMZFJOUGFX?=
 =?utf-8?B?SjNzQ1FFdUJBRVJoV0s2bmVLc1J0WmhXNFhtVFEvT1pGMHo4TCtSblZ4dFgx?=
 =?utf-8?B?Wkt3MUtxdFY4RWNGUTk3anBIanhEc2k1UGV5SzlmU0FSVkxDK0xYUWQ2T2Zs?=
 =?utf-8?B?aGlLWUx0Z0JCLzkrQlBaQWU0NER4VnFPNFRNL2RmR0haa3I3UHhkWVRJMmhl?=
 =?utf-8?B?ZW9RRVIreG5kVlg3TFdkMjRIeHByeFpBVTBVamtZdHFlWWh3OEdUbUFJSlRm?=
 =?utf-8?B?dHpjN3VvV2s4c0N3TnBvSlFNU2RUYmcwVmRmNFVNU2dJYVBtTFB4T3diZ0Ja?=
 =?utf-8?B?eHJsVEhWRFR0TTRGT1g5eHpNZ21TUkpjWWV3Mk5qWHhqdGx6VmRHMm9xcm82?=
 =?utf-8?B?MnNWbERrZ09mdHg1am16eTFhcEVMSktJK1JFcGRNOGVNVk11MlRPa3JoR2p1?=
 =?utf-8?B?eTZTWEtSSmg2TThFQ3FJSmRuMGJXMk5wd0dGWjNxczNEZnVUZU9Hdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d628e3-d63d-4774-eb29-08de3f165b34
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 15:50:38.4851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7x3xc0iyeA50pzVQDfzKBt8JfYUb7bBtaQcou96ZDyFip8jOM+flQmesa8Rpn4Z/UEtj6qs+wq7wq3BFVDjz4hDnNAugATm+CuFXlIJJ144=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7059
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

SGkgQm9yaXMgQnJlemlsbG9uLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYgT2YgQm9yaXMgQnJlemlsbG9uDQo+IFNlbnQ6IDE5IERlY2VtYmVyIDIwMjUgMTE6
MDQNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3BhbmZyb3N0OiBBZGQgR1BVX1BNX1JUIHN1
cHBvcnQgZm9yIFJaL0czRSBTb0MNCj4gDQo+IE9uIEZyaSwgMTkgRGVjIDIwMjUgMTA6MTM6NDUg
KzAwMDANCj4gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4g
DQo+ID4gSGkgQWRyacOhbiBMYXJ1bWJlLA0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogQWRyacOhbiBMYXJ1bWJlIDxhZHJpYW4ubGFydW1iZUBjb2xs
YWJvcmEuY29tPg0KPiA+ID4gU2VudDogMTkgRGVjZW1iZXIgMjAyNSAxMDowMg0KPiA+ID4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gZHJtL3BhbmZyb3N0OiBBZGQgR1BVX1BNX1JUIHN1cHBvcnQgZm9y
IFJaL0czRQ0KPiA+ID4gU29DDQo+ID4gPg0KPiA+ID4gSGkgQmlqdSwNCj4gPiA+DQo+ID4gPiBJ
J2xsIGJlIG1lcmdpbmcgeW91ciBwYXRjaC4gSXQnbGwgYmUgbXkgZmlyc3QgdGltZSBhcyBhIFBh
bmZyb3N0DQo+ID4gPiBtYWludGFpbmVyLCBzbyBiZWFyIG1lIHdpdGggbWUgd2hpbGUgSSBiZWNv
bWUgZmFtaWxpYXIgd2l0aCB0aGUgcHJvY2Vzcy4NCj4gPg0KPiA+IE9LLiBUaGFua3MuDQo+ID4N
Cj4gPiBGWUksIEkganVzdCB1c2UgdGhlIGJlbG93IDQgY29tbWFuZHMgYmFzZWQgb24gdGhlIGRv
Y3VtZW50YXRpb24gdG8gbWVyZ2UgYSBwYXRjaCBhZnRlciB0aGUgaW5pdGlhbA0KPiBkaW0gc2V0
dXAuDQo+ID4NCj4gPiA9PiAuL21haW50YWluZXItdG9vbHMvZGltIHVwZGF0ZS1icmFuY2hlcyA9
PiAuL21haW50YWluZXItdG9vbHMvZGltDQo+ID4gY2hlY2tvdXQgZHJtLW1pc2MtbmV4dCA9PiBj
dXJsIHh4eCB8IC4vbWFpbnRhaW5lci10b29scy9kaW0NCj4gPiBhcHBseS1icmFuY2ggZHJtLW1p
c2MtbmV4dA0KPiANCj4gT3INCj4gDQo+ICMgZGltIGI0LXNoYXphbSAyMDI1MTIwMzEyNTEwNC42
NzU5Ni0xLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tDQo+IA0KPiBpZiB5b3UgZmluZCBpdCBz
aW1wbGVyIHRvIHBhc3MgYSBnZXQgdGhlIE1lc3NhZ2UtSUQgdGhhbiBzZWFyY2hpbmcgZm9yIGEg
bGluayB0byBwYXNzIHRvIGN1cmwuDQoNClRoYW5rIHlvdSBmb3IgdGhlIGluZm8uDQoNCkNoZWVy
cywNCkJpanUNCg==
