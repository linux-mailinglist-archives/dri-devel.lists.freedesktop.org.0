Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF89B15F42
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 13:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0453110E44F;
	Wed, 30 Jul 2025 11:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="egjpr02H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DD010E442;
 Wed, 30 Jul 2025 11:22:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxUoMbYScfwgA8d02O0WqCYMJ2QF5c9H8a87YaJVageqJIUDjIBD7SEK3oU1/OlN0+sRKZzcEEESiTWD8rYGAS23vk+GT8cqFb4R96DucetrO+TMKdb/cmpWHoleJ8dQVGCtb38PdI92kNftwFWQ33RIX7DDBTypEgCHgI8J2aldvMWklt1rtnDGq9TBOA84Jg2zy9GxdF+zF8EzTm/d7+00vQeXAtNXEOJaChMDFFbLK50ejsvSLomjCCtc3SEQlKgDF513KP/GvvYBLfshFz2oMTM5UoOvPQ+hpuZVsXxnx9vESSc5dAdJ2HBTckGW6QSJ5b+VVfQcTrMhfNUFOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+5CfEFY2p5Er94qH1mt3BO2CFbcKPFvVWguPwvSEv8=;
 b=RGVDeaP2qSXRN1lheYvV7Q+IYPNdE44Dm9hdciKjHjcN80UlGhSxaF1OjVVcXGsNWsdkCbLHq8UUUt5nLgpjGCSz88mkOdCeaSmRch9fboVaGocf8uePC2cKtGd8M2dhDP7PYK9S50wNz3kNKqcKZvw8hQDGHEJw2EaIAr0FlODv61qCVWi0hFI4WZftCV79YKsH8CBuHgzTp3JwVRFQnNeowlVD20wnfYYonrMXB1ikoiNoTt+Hk1bgF8FznwnB4rbtH1oNag/cKMPMmbg0iDYcedrP0a0Fmwr9HqJtAm7L4JzaW9ITRqgYXOP69DZJbj8TiBx7qZ8/CaNOfGA+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+5CfEFY2p5Er94qH1mt3BO2CFbcKPFvVWguPwvSEv8=;
 b=egjpr02HTd8LKYaMJzw6c9ijmlWKmnhHxHReUHTQh24ewPDr6y4qg/9rNp37cllZ9l+6n82laDtqO3f4Fn8b56cHlJqSca0GUFomxn4aPall4T2STPsW177qY9ZPBXVSEx1VFjvCBVNjbB++pBUnHIcu3+QHjH12gkd2fa3r4jw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14872.jpnprd01.prod.outlook.com (2603:1096:405:262::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 11:22:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 11:22:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, "naveen1.kumar@intel.com"
 <naveen1.kumar@intel.com>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "uma.shankar@intel.com" <uma.shankar@intel.com>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>
Subject: RE: [PATCH v2 1/4] drm: Define user readable error codes for atomic
 ioctl
Thread-Topic: [PATCH v2 1/4] drm: Define user readable error codes for atomic
 ioctl
Thread-Index: AQHcAT3FeTvDo09940CgzCPGex9gDbRKhSoA
Date: Wed, 30 Jul 2025 11:22:12 +0000
Message-ID: <TY3PR01MB113461B465C7F642E7DE1A70C8624A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
 <20250730-atomic-v2-1-cc02ce0263dd@intel.com>
In-Reply-To: <20250730-atomic-v2-1-cc02ce0263dd@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14872:EE_
x-ms-office365-filtering-correlation-id: 0b6a8a95-2621-4b03-7dd7-08ddcf5b5481
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OGg4UEJtZEUxY0tOWEVoUXlhUEZYRFVxZ1BZRXJ2QzNXZ0lEd1dadkdvSzlp?=
 =?utf-8?B?ZVZTKzdjUHRTVk05SlBxR0hlR0FLQkR6dHUrcEprNXZKWVE0THFlSWdvcFlo?=
 =?utf-8?B?cDVsMHdqUmdQSHlSUFVYekhhdWpMUGpzQkk4dG4yazhleVF3eWpKQ2EyaEZN?=
 =?utf-8?B?U1dib2k0ZzJQMXdXRTJoQXZPcytiRWFSSG9ndllrN01vZlRjYitTeTlNSko3?=
 =?utf-8?B?dHBjZDM0bXQwSVdKYzRpY29ON1dHVm5RN2J4Nm1PcTVKL3dUOWsvbHdOOHhh?=
 =?utf-8?B?VklrYytMeGpaZFpNWEFmdnlXa2R3bFpOeEp5TllhN3BZdUsxTVpsdHNySGpo?=
 =?utf-8?B?ajk5b2pIakQwMkpLOUZ3Q3RwbFhxeTdQTGh0cGljb29jb3hKcTVHZkI4bjI3?=
 =?utf-8?B?eWw5UVlFWVlwUWpubHNMUThyWHZRZi9lZFA2Zk5iejhmQmlDRGc3VnhoZkJG?=
 =?utf-8?B?MHFmK0ZQQ1RWZzl1V1JIb3QzVGVvcGoyaWFaTzVCSDhpbVFKbTFCZ3huVFA4?=
 =?utf-8?B?UENUOEtyUjc4VHo5THI5ZjYyMnZSZ3dEajYxNU52NUdkUmNISjBIQjRIZ3JB?=
 =?utf-8?B?dXE2ZHN1bFoweEQzMi9vYm4zVVkwdW5KUEk2Z2RQUnp3cFV4NTFpdWd4K0NK?=
 =?utf-8?B?ay9ETENnQ3hWZS93SG1NVDRTZ1U4dUtBSG56NHNtbHV2RzdhTWJ1bXArOVNj?=
 =?utf-8?B?b2pmTTlmM3dGajJvcXVod25lUG1DR3R0Zjc3STk5dXpMZ2ZLVkR3SnlsdENh?=
 =?utf-8?B?bTF0OU5XbzQ2cGVKN3lHMysvM0xUeHY1QkRZc1M1bTZSYmNqSGRuNXRyaGRH?=
 =?utf-8?B?UUd1dGNNZlR0YlBsdjRVVlVNUTFYOUtrYXhOeGc5eGphdVNIZTVHK2xuZlZ4?=
 =?utf-8?B?cmhLZHFKQlF1c1U3UWVHbmtZTEFtQXJvSXZINzBMTVdVWG9HTGttMXFDbjY4?=
 =?utf-8?B?NW5OeUQ4SmJyRjA2S0pyU0xWWEt6WmxmUTY3cktTRU5kM1AwakdqZUZMZ1dY?=
 =?utf-8?B?MXQ0c0pTQ1ZYK3M2eWJMT3c1Q0ZKaG1RQ2x4RUdiM1FTNHI3ZWROWmhVTmw4?=
 =?utf-8?B?TWgxMU1lWUFDcGwwYmF6akFQUG1ZR0t5OGoybnZUUGhrZEZwa2xGYmpacjlk?=
 =?utf-8?B?di9jaDJ1SzNQbDA4b1ZVMVhLNk1GS0hYY0pkK290dGMxTnNGcytiT0NpMkFq?=
 =?utf-8?B?TGR6MTZmTmlnclkvc0g3bzMrdG0wbG9mVXUwcXlEZDJKR3hoSHFFaFdpRVd6?=
 =?utf-8?B?WHZHdGpySmh5MWdSSTNKbld0SVg1WSsxU2thWSt3S3V3Qm9OUlB5bXU1L1BB?=
 =?utf-8?B?dml2LzRPaHJBMmt5ZlU4NVFzNHhKditKVjcyNEdkNUZEOXJFZ2MzckxZeENP?=
 =?utf-8?B?QWhhN1lnN2p4dmErU1FXRTJxV3hRQk1zMEk2QXY1RVg0RUdWcmo5UjdsTGo2?=
 =?utf-8?B?aXRzS2psdTV4eEpZeWlJdS9ZUjg4WDNvaGYvK2Y1Z2JxQVdKUGE3RGdFQ1Mx?=
 =?utf-8?B?TU5qRWpqQ0pHVExxL21DWWVkeldxcjlHbnU0QXFBUTQzMTk5MU5qOHhndnl3?=
 =?utf-8?B?c1JjaURMMkl2aDRnK3VYZ1NOSU9CQ3RkckVadTRNa0pmVnhkdDZuWmdtaStl?=
 =?utf-8?B?WWFrdXlhVzFTTWJoTDBLcEJ0R2ZmdE5sMEtZdEpMMjFHcDIrLzh1OENLbmo4?=
 =?utf-8?B?bGMvQWlpTE9YL2phSENVcGdQV0pQZWsxSWJ3WG9aMm5uVnNtVU9ZTGxCTHN0?=
 =?utf-8?B?Rmx0cUpsQy9VbnF1YkdaQVhIUjJQNFNySmNqWnJ0QnIrTWYybmcxeGdGT2dx?=
 =?utf-8?B?bTI0anIyZUE3YjdtdG5SNnJxNEtVUVAyU25wYzA0cDE4bTdHQUE4cWF0d2ty?=
 =?utf-8?B?T1NaaUo2ZnAveHdZR3ZoRGpqK0ZIVnV3Y29adVFaRVhrVmltTWlsTHpyeW5i?=
 =?utf-8?B?SW8yVXhnOXp3MTZoVmRRbFVkTXdYN2RJTTQ0WUJHZlVCMVZVOVhSM1hXeFRm?=
 =?utf-8?B?SVBHK3hKL3ZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eE1YMFYxNWJxSnl0SFZMTmJkV2xBa1UxWVhTYnZObWJNL3J1M2ZzM3hlRmV2?=
 =?utf-8?B?azVKeENSUjAwM2xnU2RiY0RVZE83L2F0K1pQYWRRZm9TdzdEcEQxT1hFRHhK?=
 =?utf-8?B?YkQxZndmbkxLcWNSbTl3enBxMlI3U1J0UXF0dDJPcnByMmRrVUxnRmwxUHF2?=
 =?utf-8?B?ajdQNXdrSlovZzdnUG9uNWFUMGUyNWFac00zZldRVzUyTnFYdnE3MEZxcXZ1?=
 =?utf-8?B?cmdBWEZPTDFsM29oWjM2dkpuaWtITjFxVThDaDlDeWNBOFJFVE0zVDA5dlYr?=
 =?utf-8?B?YnFueWJVYnU3OEkzTDEyS1h4VWlzKzhMQUZ6Tlh5c1ZJdER6UkZwZEkyOTBK?=
 =?utf-8?B?YWpIdnVVMktYV3JFNndwa0RSVTd6WkEwSWYxckxibGZIaENPRnRWbHovYTU4?=
 =?utf-8?B?UE5POHNpSDV5dTZYbkwvYVhJQXFDN0xPOHgvM3lhbG1RRS93ZEZ6enlScmND?=
 =?utf-8?B?NDJkcWlWdlZtTDN0SEg4SjVuMXRvVjRwbHo4azFVZjdTdng4TTB0cFBhVCtW?=
 =?utf-8?B?U0dsd3lkbGRHM0V0TEhRcTJ5NllpZXlBeE5Xb2tTcW1ZN2FGQXd5b1NoeVBo?=
 =?utf-8?B?ZFA2bDJGVVRPT2NuTmJFYklTMVR0eHRzWG5SY3JackJHYVpLbnBnUEN0Q3Mr?=
 =?utf-8?B?OGRObmcrdHVKQUQ2UTBUbnBlbHNvYWUyQUh4Nk1ZeWt1Ull0VXVjY2RyWVRE?=
 =?utf-8?B?KzdGUjYxVFB3Tlc2Vy9tMWhUTGxzaHFCK3NsRXhxaW50RTUvcnBERVNJWFRu?=
 =?utf-8?B?QjR1T05sUnpJVm1MYWxwNW04dWh3UW9MVThzY0JiZ0srbkxDd0JKMnowSUor?=
 =?utf-8?B?NVVZZlZlL1JUNFNIa1lUNlRzQTh6UVJvRm1abnkyQ1VvL1ROcTI2ZFFqcEh1?=
 =?utf-8?B?d0p6TXBUNFpHVHUvc1BKcVJ0UlZoU3VJTnZzREdMZk01Tmd5UC90SjY3bERS?=
 =?utf-8?B?YXAvd3hHV3YwdEZKZXVxOFBNWXU1NnFucTVXNFplakk5NHJ0ZW5TSy9Uc3lU?=
 =?utf-8?B?YUdYMU8vQmNRVkRXem1ZNFFHNmFKNFMwTEMvME92SFJxZmQvRHNmcFlxcnI3?=
 =?utf-8?B?T215U1pQYkd6Ykh0bTVRMmhNeElLVGVEcWdWc1N3ak9IRHpXM0FOQWplbDRT?=
 =?utf-8?B?L3lwdmpXT1hObXRaWjUyK2gxdy95UENqUm54bHRmV0Z6bUp0RG9MSm1jemZ3?=
 =?utf-8?B?TTdHa0NFd3dDKzJPSkJUeU1XU0RFcjFyNk9GSjZENGxqa2h1cElFRmxYKzRT?=
 =?utf-8?B?a3dIWjZ6R2Z0Snp1Vy9tVHJhVDVtSmV0MHhFSUl5Zi8vZENPdXpjWXA5MHd4?=
 =?utf-8?B?R0Yvc3MvR2dsejJkTDZRNDRtNjhkSUxtOGxPMXJsK1JZYU52T1FkRVdWbGpM?=
 =?utf-8?B?dG93dDRJWXBUREVwMUVsdFlFSnJZQXAvOUpadnFsWEZCRjFmRHE2M3hUZFla?=
 =?utf-8?B?ZHFIbnNmMWdwUE1KOTJ0V0wvSHc2RkJpRVZvVFNMbnBOQTZzWDMwVlViTTZV?=
 =?utf-8?B?K09TOHZXZlg3OEJ2N3dtdU4xaEtQNkNEYmdsZ3B0alVRQXNTaGZ2cTJ1Wm1C?=
 =?utf-8?B?R3BlcVFua1FVWXBTK0FaaVIvVlJTWEZTZGNNby9zQ0ttTGNPZ3FpbS9WKzdn?=
 =?utf-8?B?dEpTQmFQZzZ0VnkzN0FXcHFkckkxaVFWR25pQWppQy8yL2pmMitxOXV0UklU?=
 =?utf-8?B?OXdVN3FkT3U5UW5STVkycjIvUG0ra0tueTVXSkxWRDByMVZPVjBaZmdPSjhU?=
 =?utf-8?B?UGwwSzh5MFk2UDNsT29VU2JONnJtVml1NUFTanFPMU8wQml5blMrdU9TMC9N?=
 =?utf-8?B?QkhXbjFYWm5pQTc4VkhKTjkyd1U2cXBlekUrZHNycWFrOG1MMEJvVXUxWHY2?=
 =?utf-8?B?eHpKTXNsSEVYK0xNcXNqZUxsL1RYcjlybEcvemNieXRxZVZUQ3ViSUhyTVRa?=
 =?utf-8?B?SU9qeHd1K1dRRzZTY2VwdFdqTGRobkwzNkQrQkdwUTdsZFdNWldNdGJWVGZs?=
 =?utf-8?B?cjNYV1NiaE43Qk9BQWNDU3RvUEFyOWZFUjM2ZUFXUXF1TmlUSnEwU0liWHB2?=
 =?utf-8?B?MVJhY2VHbExqWFBiUWJ5V3RwY1BLM29nNTMxdzlXWjRFUWpTd3ZEeldPWlhp?=
 =?utf-8?B?UThtSW1Eb3Rzb1g5ek5TaE1CUk1KUlJ6cXpZcWdTK1ZSd2RjdDVaZG44L05h?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6a8a95-2621-4b03-7dd7-08ddcf5b5481
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 11:22:12.2674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3EtmaJZc9G6Lhba558SAoF0Sh0RRe5BSklntu47nd/jhn8ANTPRMYPc61XTHrTPXr4vpZcvoIgQRzF0CVyyfx2FKftuf919ApzX0JSnva4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14872
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

SGkgQXJ1biwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBkcmktZGV2
ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IEFydW4gUiBNdXJ0aHkNCj4gU2VudDogMzAgSnVseSAyMDI1IDExOjE3DQo+IFN1YmplY3Q6IFtQ
QVRDSCB2MiAxLzRdIGRybTogRGVmaW5lIHVzZXIgcmVhZGFibGUgZXJyb3IgY29kZXMgZm9yIGF0
b21pYyBpb2N0bA0KPiANCj4gVGhlcmUgY2FuIGJlIG11bHRpcGxlIHJlYXNvbnMgZm9yIGEgZmFp
bHVyZSBpbiBhdG9taWNfaW9jdGwuIE1vc3Qgb2Z0ZW4gaW4gdGhlc2UgZXJyb3IgY29uZGl0aW9u
cyAtDQo+IEVJTlZBTCBpcyByZXR1cm5lZC4gVXNlci9Db21wb3NpdG9yIHdvdWxkIGhhdmUgdG8g
YmxpbmRseSB0YWtlIGEgY2FsbCBvbiBmYWlsdXJlIG9mIHRoaXMgaW9jdGwgc28gYXMNCj4gdG8g
dXNlIEFMTE9XX01PREVTRVQgb3IgYW55LiBJdCB3b3VsZCBiZSBnb29kIGlmIHVzZXIvY29tcG9z
aXRvciBnZXRzIGEgcmVhZGFibGUgZXJyb3IgY29kZSBvbiBmYWlsdXJlDQo+IHNvIHRoZXkgY2Fu
IHRha2UgcHJvcGVyIGNvcnJlY3Rpb25zIGluIHRoZSBuZXh0IGNvbW1pdC4NCj4gVGhlIHN0cnVj
dCBkcm1fbW9kZV9hdG9taWMgaXMgYmVpbmcgcGFzc2VkIGJ5IHRoZSB1c2VyL2NvbXBvc2l0b3Ig
d2hpY2ggaG9sZHMgdGhlIHByb3BlcnRpZXMgZm9yDQo+IG1vZGVzZXQvZmxpcC4gUmV1c2luZyB0
aGUgc2FtZSBzdHJ1Y3QgZm9yIHJldHVybmluZyB0aGUgZXJyb3IgY29kZSBpbiBjYXNlIG9mIGZh
aWx1cmUgY2FuIHNhdmUgYnkNCj4gY3JlYXRpbmcgYSBuZXcgdWFwaS9pbnRlcmZhY2UgZm9yIHJl
dHVybmluZyB0aGUgZXJyb3IgY29kZS4NCj4gVGhlIGVsZW1lbnQgJ3Jlc2VydmVkJyBpbiB0aGUg
c3RydWN0IGRybV9tb2RlX2F0b21pYyBpcyB1c2VkIGZvciByZXR1cm5pbmcgdGhlIHVzZXIgcmVh
ZGFibGUgZXJyb3INCj4gY29kZS5JdHMgYSA2NGJpdCB2YXJpYWJsZSBhbmQgc2hvdWxkIHN1ZmZp
Y2UgNjQgZXJyb3IgY29kZXMgdGhhdCBzaG91bGQgYmUgc3VmZmljaWVudC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCB8IDQwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIGIvaW5jbHVk
ZS91YXBpL2RybS9kcm1fbW9kZS5oIGluZGV4DQo+IGExMjJiZWEyNTU5Mzg3NTc2MTUwMjM2ZTNh
ODhmOTljMjRhZDMxMzguLjg3ZThmNjIzYmZhYWFiMDkxMzViZTEwNGRiMDQ5OTZmMGJlNGRjYjQg
MTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiArKysgYi9pbmNs
dWRlL3VhcGkvZHJtL2RybV9tb2RlLmgNCj4gQEAgLTExNTcsNiArMTE1Nyw0NiBAQCBzdHJ1Y3Qg
ZHJtX21vZGVfZGVzdHJveV9kdW1iIHsNCj4gIAkJRFJNX01PREVfQVRPTUlDX05PTkJMT0NLIHxc
DQo+ICAJCURSTV9NT0RFX0FUT01JQ19BTExPV19NT0RFU0VUKQ0KPiANCj4gKy8qIGF0b21pYyBu
b3Qgc2V0IGluIHRoZSBkcm1fZmlsZSAqLw0KPiArI2RlZmluZSBEUk1fTU9ERV9BVE9NSUNfQ0FQ
X05PVF9FTkFCTEVECQkJQklUKDApDQo+ICsvKiBhdG9taWMgZmxhZyBwYXNzZWQgbm90IGluIERS
TV9NT0RFX0FUT01JQ19GTEFHUyBsaXN0ICovDQo+ICsjZGVmaW5lIERSTV9NT0RFX0FUT01JQ19J
TlZBTElEX0ZMQUcJCQlCSVQoMSkNCj4gKy8qIERSTV9NT0RFX1BBR0VfRkxJUF9MRUdBQ1kgbm90
IHN1cHBvcnRlZCB3aXRoIGF0b21pYyBpb2N0bCAgKi8NCj4gKyNkZWZpbmUgRFJNX01PREVfQVRP
TUlDX1BBR0VfRkxJUF9BU1lOQwkJCUJJVCgyKQ0KPiArLyogZmxpcCBldmVudCB3aXRoIGF0b21p
YyBjaGVjayBvbmx5IG5vdCBzdXBwb3J0ZWQgKi8NCj4gKyNkZWZpbmUgRFJNX01PREVfQVRPTUlD
X0ZMSVBfRVZFTlRfV0lUSF9DSEVDS09OTFkJQklUKDMpDQo+ICsvKiBhdG9taWMgcHJvcGVydHkg
Y2hhbmdlIHJlcXVlc3RlZCBuZWVkIGZ1bGwgY3J0YyBtb2Rlc2V0ICovDQo+ICsjZGVmaW5lIERS
TV9NT0RFX0FUT01JQ19DUlRDX05FRURfRlVMTF9NT0RFU0VUCQlCSVQoNCkNCj4gKy8qIGF0b21p
YyBwcm9wZXJ0eSBjaGFuZ2UgcmVxdWVzdGVkIGhhcyBpbXBhY3Qgb24gYWxsIGNvbm5lY3RlZCBj
cnRjICovDQo+ICsjZGVmaW5lIERSTV9NT0RFX0FUT01JQ19ORUVEX0ZVTExfTU9ERVNFVAkJQklU
KDUpDQo+ICsvKiBhc3luYyBmbGlwIHN1cHBvcnRlZCBvbiBvbmx5IHByaW1hcnkgcGxhbmUgKi8N
Cj4gKyNkZWZpbmUgRFJNX01PREVfQVRPTUlDX0FTWU5DX05PVF9QUklNQVJZCQlCSVQoNikNCj4g
Ky8qIG1vZGlmaWVyIG5vdCBzdXBwb3J0ZWQgYnkgYXN5bmMgZmxpcCAqLw0KPiArI2RlZmluZSBE
Uk1fTU9ERV9BVE9NSUNfQVNZTkNfTU9ESUZJRVJfTk9UX1NVUFBPUlRFRAlCSVQoNykNCj4gKy8q
IGFzeW5jIGZsaXAgd2l0aCBwaXBlIGpvaW5lciBub3QgYWxsb3dlZCAqLw0KPiArI2RlZmluZSBE
Uk1fTU9ERV9BVE9NSUNfQVNZTkNfUElQRUpPSU5FUl9OT1RBTExPV0VECUJJVCg4KQ0KDQpGb3Ig
Y29uc2lzdGVuY3ksIE5PVEFMTE9XRUQtPk5PVF9BTExPV0VEID8/DQoNCkNoZWVycywNCkJpanUN
Cg0K
