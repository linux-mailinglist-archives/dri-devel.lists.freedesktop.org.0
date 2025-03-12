Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE4CA5E434
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 20:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5729910E341;
	Wed, 12 Mar 2025 19:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="q+Qls1fE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010007.outbound.protection.outlook.com
 [52.103.68.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CD610E341
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 19:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwG1qqjCEBekhWzCNotDHsWCyBfKeoOViWs4eqi7V34a3/C57vdC2I7bi4vvwXU5HqBPk4+LI7goCZv2r7wFptrHx0rLnSicIEc+nrGHsYqrkG8dlWJQBCQWlQIqXKZNGx+0upyJ7Gf67du+Z97EF3QKS9eUm0jxPFg/4Gqf3LtOw+1mG7gCC1bJ94LCWcr+9nCZkP41gikYPz9DtJbgj3jVJBl7sb64+Ec/AW9quKNEckwvyDkeIligb1ifcdIn9A2mpRkCh/9HJNm0/oAqSFcyksVyZrTNLtXwyZo7i8lz7JxHwOrRecmWA3NybIQZ0f5vWs/wShGPhshTwBJ0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPaVyW/jdsWnbxDu/v0f46NA/aQ5D4hEdttoziC2Tf0=;
 b=B3NZlZdIRdDYFgsyhKSTAhdJ1raNelogjnBt6j1WkQNUcD4WGMQGq4DfVWe+8BUVEf4a8MaXFZQubuc63qsMfKv1qq08hnKD4dBrEORR69/luqPAZBZ/+6PFdyYGSj+4jRqlZvhsE2VJpkKSgPSwXY+D+KKXXT7I1dEkOYVOQ+asWEU3U6hMAu0HvhJmi5/QA8SzcyWoBlacg31dbvSUFiMy8MNGhAdKEIVdVSwqqhjVT97HY+ZNqAUYaZ2KHoyjwAj0rUK6rqbfjMaXfqQ8C2QMUCs2b9zA0pDHWOne21qnM3SmHLWf7kxX1cGNlAl61oFXxCDWs6mrRXlFB/AnCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPaVyW/jdsWnbxDu/v0f46NA/aQ5D4hEdttoziC2Tf0=;
 b=q+Qls1fEtXmhKsiYHt1erqNQRE4qeg1Nm9/x2u5gXGrchXjx81VHgJ/q8b2YazP4jKBLxXWN56U54CtXKdfObZHTp/nIMVVLBdcB4yIgUPK7XhpFwGMcYeNkhLDG/ZbX3E5ZJLngJyH0zxbuaJ7vKMU5ocHffS0MnmhOMgQ834fCiOMKWrJNKI2fVN8GX7u3MCxXZAwN2Zj0H2A1JXHMUmqroiHTF76+bfo7h2QD79qSbwX7RJySKJ0sJRQpdDHgVO4Fa2I7Iz5dvQZxQL2TrlGuuIYwWL5ayxEnsTvQkLYbvpxVTWpUzE+xPnjIXGpkEhVpmTvJdkYhy11uisqfQA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9320.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 19:14:36 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 19:14:36 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Sven Peter <sven@svenpeter.dev>
CC: Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, 
 Maxime Ripard <mripard@kernel.org>, "airlied@redhat.com"
 <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Petr Mladek <pmladek@suse.com>, Steven
 Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jonathan Corbet
 <corbet@lwn.net>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>, "joe@perches.com" <joe@perches.com>, 
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Topic: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Index: AQHbky3sGKkFjHx1MkmFN9rVUAvYHLNvYl0AgAAA5jqAAAKdAIAAAT1vgAA66ACAAD2b+A==
Date: Wed, 12 Mar 2025 19:14:36 +0000
Message-ID: <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
 <376C9BD3-2F41-4511-BE52-1B8468FE2CB3@live.com>
 <b74df4b5-ecda-45ba-a98a-c84b0a29e380@suse.de>
 <PN3PR01MB9597AC6A02B0BF873920D94CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <9092a9ed-aecf-40bd-9d15-b53d60d035b5@suse.de>
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
In-Reply-To: <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB9320:EE_
x-ms-office365-filtering-correlation-id: f831e18a-dee5-4ab3-de12-08dd619a214a
x-ms-exchange-slblob-mailprops: YfhX3sd/0TWYnBBcTvvGLlHdY79wcCjUgfp6Gv71JMZXbHfQkVf3VRqIhj+2bytVWWUfBngYUMNxKrB9LVmduOQVLbZBxs1U5TRJuQ+Uve9lbqf04uthFg+WlveZKX9FzOK5rV/INgNQTBTRkQ3sBlBsY9hO/XB4Ls27zlae4tI9x54qhvwpPBhOLQi6+hT/6oegM/eQ8MRDUiuM36LWGaJfv73cSlxt+gzEGHBFt6VPSKfqvwjycpQ/w0DuZ6hUYBhL0vsMKDgggBqZBKSFz/IZu0mTX8oP1+6jPFrtE8VUSmBXe8GZPGT38p/WVtByA2AzqyjBBdl+UQyW/BeGunMlwla1znbtZUOor+N3SDtR34PrBdTiVxdTeFiRTx/vMEJ3M+mGnBQql0Ea/C6zJh+Bt//ldZjVkH8dpQQBwGOB0dFlddk+Wk+mSKcnoWQ3RRnYCzf3HajYBF0gzvs56e+j0i3D8ltD6fhZoIc3JLp+cVtMTgrSzv13srF7h3imolzrBVXVEX1txDyOtKTwQjaxAeTc9Ra6oBSej1f0e2RWKNKE+8jxUdZpCPdWaZB+kr5ZGlQmasRqsQ//n55WsqLmEVmqGDT1Eh3f7Nsf9Hp6c1cW1kLanTUbGFMFfH1f67RspbqnPb8V7XXVp3LUqDeP+pKwAwTOPeP1ytvozNcqMTKsXRDQOFEXwdvYm/gZqZXdERUj7Y4DInbdgoOKV0QUPdDSEooOWYlKbLnu5jgbM2gH2NhVLX/hSi5BesmGAss7QlXPCch+ZdZXCbNuQhVzMn6Tea/MK/hT8Xl5+b4=
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|461199028|19110799003|7092599003|15080799006|6072599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?RGdwSUxrdWRjRHlCanV4NkJ2TUNjZ0hxU0FnSWN4UUJKNkJsSms1OWNZeHZ4?=
 =?utf-8?B?RFh0Zm1wdHVzV1ZueXhyRldPKy9uZ29ZVGJGcXA4OGgwUkVhd3FJZFZOUTY2?=
 =?utf-8?B?aDRxbE9pdzdDVFJzb25VbVFyVTR1NXpkdGVmanFXOWpUVGl4UVRjcjZFMDRI?=
 =?utf-8?B?MXFrTWlwK3czS0Z4UmVTSTVkYnBYcy8ydFBqOXdvREJJanE1ZlhBSGZQUk5r?=
 =?utf-8?B?WkJLYXZneTlHeWsrY2dmQThxTlAxYzVMN2svdHVqSTcvQkg5UVVlQUIvMktS?=
 =?utf-8?B?cjU4RzBkM21JZkd4WExJUkwvdnJ3Ym5RSk0ydXNjcXpSdWl3NUJJdTJENWhh?=
 =?utf-8?B?WjhDYjY3aXFHcnZpYmFQYUJITXBKTTVkUGRpWUdtM1EwbmNLNjAxamRoMkxS?=
 =?utf-8?B?RUVVR0tFVU9KY2srWDljZis5TGYwR1ZmbE1CYmQ1UGROdEdmMjZ3cnRhd2dF?=
 =?utf-8?B?TjhLSzJMRkgxRFNjTk5MVmM0RWRqRm4vM1M4Njh2b0MvR21VWVNTcjVwcXZr?=
 =?utf-8?B?aHdNcFlrU2NtOE5pL29oUXpaUEVROEZZM0xLMWd0UEZPSDZiR2M4MTVoRTVq?=
 =?utf-8?B?NHNiMnR0S082blNpOFBIeFd6YiswY28zUUFOMXlva2tFb3psUGpKK2NBemU3?=
 =?utf-8?B?SGpNV1h0T1ovZVFmaW9VdUVBVG1xaGwxbFpweUVtUkJ0dWJNWkRORWU2QXU3?=
 =?utf-8?B?WWZLUmZRVlllcXNhc2VMQUJjNld1dnFEYTdkK2xrOG1YelUrUG1PZkpOdXlK?=
 =?utf-8?B?RGdlSzZsU0dxOUhSVU5Bb2g4L1NUcmd2ZFZuRnl6KzlMWEs0OUluRlh3YXo0?=
 =?utf-8?B?VTZiWFAwMGR4ODNnWGR1TWg4S01qbzhIdUk0NEpzY2NFSy9ZL1RZQzFQVmVC?=
 =?utf-8?B?VHZjU09XZGxVMTVCUEhoQkZtQzBUbk0yNXVVbStVSnl4SjA1TXBUdzRRTmwr?=
 =?utf-8?B?dml1RDc3M2t2TW00dEZydGN3cjlRVm92OHBtckZTYzRzOFhNeTF5a1cyajFK?=
 =?utf-8?B?SldTQ1h4Wkc4N2lhdkRDOVV3M282TVVZZzF5Vk43MDcyMzZiOHhHdFhjaG1j?=
 =?utf-8?B?WWNlRVo2d2ZHVitQaWR3ZFFRQktiL3lPK2FiSTEvRVZkRFBzN1JROWUxc1ox?=
 =?utf-8?B?cTlLM0JiNzc2eWdBek9TREJadG1FVHgvVUZkZUxnblFjbG1SVkg2a0xFTS9L?=
 =?utf-8?B?YjVYSXdUb3JyMUM5alJoS2xVYyt6KytKWWlNQjZNM3ZMbllkUlUvaHdZeGZa?=
 =?utf-8?B?Znl3V1E0clU4aEpxeGd3Yi8xWmhBaFMxWWVSVkNXa01CdW9PblZGSE95QkFn?=
 =?utf-8?B?WFN5MDFnZWMxcit6YTl5YW9aS2ZnS2ZyMldkWHdaMzlyUFgvSkpSbThMRDhD?=
 =?utf-8?B?RUtEamNaUG9ITzI2VFI0S3RCbit3RjdwOXgrbVMyVzVpWmh2MEk2aEFLeXVK?=
 =?utf-8?B?SEtteHE5cm9kK2pXVlFrcnMxaHMwZDJzZG4wbzNaMFpkc0tGZnQzcVl4ejU3?=
 =?utf-8?Q?OWR23A=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzJNdTV6Sm1Ranl1ZlhMMzdNZkp1SURnaldyUzVmdVZPMFBwTDRPc2ZtUDFG?=
 =?utf-8?B?V05RK2pZU0RGS2FuckpiVTFuNCsrd2ttMnltYnUwL09LMVlwalJwdFdxSzNT?=
 =?utf-8?B?ZnlrcVRzSkNpN0pldU1ya1JRdjhFQkVEaVpxTm9nRjlOVnFjNHNXMDRicDFW?=
 =?utf-8?B?WXZiL0xvVXFmdXpLelozZEVpVHBBaHlxcVNKMUxvOC9NK2FlVW9jY2hDeDFV?=
 =?utf-8?B?Y2VYRlVReGM4dTFkMG5icXlMRG5GYlVnUHk1RUk4cnFLRWNwek01V2NFdFR5?=
 =?utf-8?B?WVJJeDF5TS92K3V2bndHa0kwaDVRVmh5ekltVTRoNHgzdFFsdHhYelBuSzMv?=
 =?utf-8?B?bGFlSHpZZ2J1NmpMdWpvZmNyU05KSHVLZkFDRjRRZUZ1MUt5cXlUV0J2UDgv?=
 =?utf-8?B?N0xGVkJBMFQxODNoMlBVV3NJRTRaZjhrNHRYUU9GNGMzVG9iU0pMeTZkZlBW?=
 =?utf-8?B?Rk5wUmJKbFlVTlFKa2YrQzZDM2wrcDFscXN3UE0xOVpsZ1NsdjdHeWVFZlVU?=
 =?utf-8?B?NGg2a3E3dnBPZ1NuOGVRck1oK3JkdDZuc3pCclc3S3NINjNqVXA1UWIrREtC?=
 =?utf-8?B?QTdheGw3TTExWkpEanVGWElNQXpLZ2c2MjBFclhZVk80MnZCVnozL3hTdUVB?=
 =?utf-8?B?ZXpSU3c1OU5WNUxlMXJYZ3dPT3I2cHRWWlFvdmR1clFsNjRQRXl4MEhOdlJa?=
 =?utf-8?B?a2FhSUZMSk1vNWlTSUdzL3UzRit5RDBRSEFLYUNwQW0yQkFaZnlkS05LNkwv?=
 =?utf-8?B?YUdTanFlL0dCMjh2b1BOMHpVZVl6YmhBanJFN01URFp5NjVwcnJyK0R2dHkx?=
 =?utf-8?B?TlZGWWZhYWk0NnZVTHgyMHZWTW5xbVl5NWNRb2NndE1PRlVaR0pNQmVINVZm?=
 =?utf-8?B?Ty95d0tBTHFvdFRIcmR4aWljYm1yQ0hUanhJamdqN1lGeWpPYUNEVzUwYTAw?=
 =?utf-8?B?NWF4S2I3ekdnVFJ3Rnhkclh5UkppNzZNUWt6SnQzQjFJN1VPSTdNWEhsQVVF?=
 =?utf-8?B?dDNMVXAwL3RPakpoSU5tK1pPRVlUQ0hOdUhrbFhPT2w4NkhKeVNSOVk1cVdY?=
 =?utf-8?B?blpsUTZmdTdqKzhpejRPTVNIWGc3bEhNZWJzSzQ0QUdCNW1UQzBac2VSc3I0?=
 =?utf-8?B?akE4MHlIOHFFMDVoWXpjSXV1MWFjZ2dJWGRiZzdrNjRwV3VPa2loczZtcnc2?=
 =?utf-8?B?UlgvZnFNc2FzRkV2T25JT1hVbkgzTTllV1YvWUVKVlplTUtsNysvRmwybXJs?=
 =?utf-8?B?NU1weVV6a1dDSVBBakQxOGt6KzBrRTZBWXpwQzFtRk5QUHN1T1dSK2NlaVh3?=
 =?utf-8?B?bzdtVWhYVGw4aGRiLzFEWHR5Vmk1emNsL1FoTzdjYUtPTXVNbHFQVlNTbHNh?=
 =?utf-8?B?WjBXQ1JjUmxHanpNanJtOExuaHpEMGlLZGVTZ2Z3MVI1d3Fka1ovOWNjQ2FG?=
 =?utf-8?B?WWFxUlZaZnBUSHo1MHllaW15YTZnbUxyUTVUTFFOVnZ3TTdjZzYyNCt4UTQx?=
 =?utf-8?B?UktTNzFtcHBxbWpJNEJGRzZJWHJkd09HQlhER0lRSWpQMW1ENGVkSHN4M2xS?=
 =?utf-8?B?MXZuR2c4NlhIdG42dnJyanR5NWQwTFRLOGZiTGxzQVVCd1NIQUZLc2E5WGdB?=
 =?utf-8?Q?kUXe3umUnC1q44eZLSG9Rb2gSz4CNe9VYh6EhetPi/Sg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f831e18a-dee5-4ab3-de12-08dd619a214a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 19:14:36.7879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9320
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

DQoNCj4gT24gMTIgTWFyIDIwMjUsIGF0IDk6MDXigK9QTSwgU3ZlbiBQZXRlciA8c3ZlbkBzdmVu
cGV0ZXIuZGV2PiB3cm90ZToNCj4gDQo+IO+7v0hpLA0KPiANCj4gDQo+IE9uIFdlZCwgTWFyIDEy
LCAyMDI1LCBhdCAxMzowMywgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IE9uIDEyIE1hciAyMDI1
LCBhdCA1OjI54oCvUE0sIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3
cm90ZToNCj4+PiANCj4+PiDvu79IaQ0KPj4+IA0KPj4+PiBBbSAxMi4wMy4yNSB1bSAxMjo0OSBz
Y2hyaWViIEFkaXR5YSBHYXJnOg0KPj4+PiANCj4+Pj4+PiBPbiAxMiBNYXIgMjAyNSwgYXQgNTox
NuKAr1BNLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+
Pj4+PiANCj4+Pj4+IO+7v0hpDQo+Pj4+PiANCj4+Pj4+PiBBbSAxMi4wMy4yNSB1bSAxMDowNSBz
Y2hyaWViIEFkaXR5YSBHYXJnOg0KPj4+Pj4+IEZyb206IEhlY3RvciBNYXJ0aW4gPG1hcmNhbkBt
YXJjYW4uc3Q+DQo+Pj4+Pj4gDQo+Pj4+Pj4gJXA0Y2MgaXMgZGVzaWduZWQgZm9yIERSTS9WNEwy
IEZvdXJDQ3Mgd2l0aCB0aGVpciBzcGVjaWZpYyBxdWlya3MsIGJ1dA0KPj4+Pj4+IGl0J3MgdXNl
ZnVsIHRvIGJlIGFibGUgdG8gcHJpbnQgZ2VuZXJpYyA0LWNoYXJhY3RlciBjb2RlcyBmb3JtYXR0
ZWQgYXMNCj4+Pj4+PiBhbiBpbnRlZ2VyLiBFeHRlbmQgaXQgdG8gYWRkIGZvcm1hdCBzcGVjaWZp
ZXJzIGZvciBwcmludGluZyBnZW5lcmljDQo+Pj4+Pj4gMzItYml0IEZvdXJDQ3Mgd2l0aCB2YXJp
b3VzIGVuZGlhbiBzZW1hbnRpY3M6DQo+Pj4+Pj4gDQo+Pj4+Pj4gJXA0Y2ggICAgSG9zdCBieXRl
IG9yZGVyDQo+Pj4+Pj4gJXA0Y24gICAgTmV0d29yayBieXRlIG9yZGVyDQo+Pj4+Pj4gJXA0Y2wg
ICAgTGl0dGxlLWVuZGlhbg0KPj4+Pj4+ICVwNGNiICAgIEJpZy1lbmRpYW4NCj4+Pj4+IFRoYXQg
bG9va3MgbGlrZSBzb21lb25lIHRyeWluZyB0byBiZSB0b28gY2xldmVyIGZvciB0aGVpciBvd24g
Z29vZC4gSnVzdCBteSAyIGN0cy4NCj4+Pj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgeW91IGFy
ZSB0cnlpbmcgdG8gc2F5LiBBbnl3YXlzLCBJIHRob3VnaHQgaXQncyBvYnZpb3VzLCBidXQgUGV0
cidzIEFjayBpcyBzdGlsbCBsZWZ0IGFuZCB0aHVzIGNhbm5vdCBiZSBtZXJnZWQgaW50byBEUk0g
Zm9yIG5vdyB1bmxlc3MgaGUgc2F5cyBzbyBpbiB0aGlzIHRocmVhZC4NCj4+PiANCj4+PiBJJ20g
dHJ5aW5nIHRvIHNheSB0aGF0IHRoZSBhdXRob3Igb2YgdGhpcyBwYXRjaCBmb3VuZCB0aGUgJXA0
Y2MgZnVuY3Rpb25hbGl0eSBhbmQgb3Zlci1nZW5lcmFsaXplZCB0aGUgZmVhdHVyZS4gU291cmNl
IGNvZGUgc2hvdWxkIGV4cHJlc3MgdGhlIGlkZWEgb2Ygd2hhdCBpdCdzIGRvaW5nIGluIGNsZWFy
IHRlcm1zLiAlcDRjaCBzb21laG93IGRvZXNuJ3QgZG8gdGhhdCBmb3IgbWUuIFByaW50aW5nIDQg
Ynl0ZXMgaW4gdmFyaW91cyBvcmRlcnMgd2l0aG91dCBjb250ZXh0IHNlZW1zIGFyYml0cmFyeSBh
bmQgY29uZnVzaW5nLg0KPj4+IA0KPj4+IChJIGRvbid0IHJlYWxseSBoYXZlIGEgc2F5IGhlcmUu
IEknbSBqdXN0IGFza2luZyB0byByZWNvbnNpZGVyIHRoaXMgY2hhbmdlLikNCj4+IA0KPj4gQWgg
SSBzZWUuIEknbGwgY2hlY2tvdXQgdGhlIG1hY3JvcyB5b3Ugc2VudC4gVGhlIEFzYWhpIExpbnV4
IFNNQw0KPj4gZHJpdmVycyB3b3VsZCBuZWVkIHRoZXNlIGFzIHdlbGwsIHNvIEknbGwgcHJvYmFi
bHkgZmlyc3Qgd2FpdCBmb3IgdGhlDQo+PiB2c3ByaW50ZiBtYWludGFpbmVycyBhbmQgYWxzbyBB
c2FoaSBMaW51eCBtYWludGFpbmVycyBmb3IgdGhlaXIgdmlld3MuDQo+IA0KPiBJIGRvbid0IGhh
dmUgYSBzdHJvbmcgb3BpbmlvbiBlaXRoZXIgd2F5OiBmb3IgU01DIEkganVzdCBuZWVkIHRvIHBy
aW50DQo+IEZvdXJDQyBrZXlzIGZvciBkZWJ1Z2dpbmcgLyBpbmZvcm1hdGlvbiBpbiBhIGZldyBw
bGFjZXMuDQo+IA0KPiBJJ20gcHJlcGFyaW5nIHRoZSBTTUMgZHJpdmVyIGZvciB1cHN0cmVhbWlu
ZyBhZ2FpbiAoYWZ0ZXIgYSB0d28geWVhciBkZWxheSA6LSgpDQo+IGFuZCB3YXMganVzdCBnb2lu
ZyB0byB1c2UgbWFjcm9zIHRvIHByaW50IHRoZSBTTUMgRm91ckNDIGtleXMgc2ltaWxhciB0bw0K
PiBEUk1fTU9ERV9GTVQvRFJNX01PREVfQVJHIGZvciBub3cgdG8ga2VlcCB0aGUgc2VyaWVzIHNt
YWxsZXIgYW5kIHJldmlzaXQNCj4gdGhlIHRvcGljIGxhdGVyLg0KPiANCj4gUmlnaHQgbm93IEkg
aGF2ZSB0aGVzZSBpbiBteSBsb2NhbCB0cmVlIChvbmx5IGNvbXBpbGUgdGVzdGVkIHNvIGZhcik6
DQo+IA0KPiAjZGVmaW5lIFNNQ19LRVlfRk1UICIlYyVjJWMlYyAoMHglMDh4KSINCj4gI2RlZmlu
ZSBTTUNfS0VZX0FSRyhrKSAoayk+PjI0LCAoayk+PjE2LCAoayk+PjgsIChrKSwgKGspDQoNClRo
YXQgc2VlbXMgdG8gYmUgYSBuaWNlIGFsdGVybmF0aXZlLCB3aGljaCBJIGd1ZXNzIFRob21hcyB3
YXMgYWxzbyBzdWdnZXN0aW5nLg0KDQo+IHdoaWNoIGFyZSB0aGVuIHVzZWQgbGlrZSB0aGlzOg0K
PiANCj4gICAgZGV2X2luZm8oZGV2LA0KPiAgICAgICAgIkluaXRpYWxpemVkICglZCBrZXlzICIg
U01DX0tFWV9GTVQgIiAuLiAiIFNNQ19LRVlfRk1UICIpXG4iLA0KPiAgICAgICAgIHNtYy0+a2V5
X2NvdW50LCBTTUNfS0VZX0FSRyhzbWMtPmZpcnN0X2tleSksDQo+ICAgICAgICAgU01DX0tFWV9B
Ukcoc21jLT5sYXN0X2tleSkpOw0KPiANCj4gQmVzdCwNCj4gDQo+IFN2ZW4NCg==
