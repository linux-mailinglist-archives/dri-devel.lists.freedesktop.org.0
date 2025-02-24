Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595CAA4219A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE51410E3B7;
	Mon, 24 Feb 2025 13:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="M0qMAvqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010002.outbound.protection.outlook.com
 [52.103.68.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C0610E242
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 10:52:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvQvALPFqb15uakBV+c9n965Bebxu86gL0greX2j9NzgVdq6TfEx/s2vyP5V5/SniQgHH4IY+bw56qySkaJCnOhPTjxD1VYuKCkcZWWucjkFMytwD7QV+92JxqrHQsd7MH6L6Ms5YPIuZcIu1DKD92w5PpPYTHid9Kg/nRwvjhSD3eciMAdjlgGWM1xkzcTGS+TOzbXhQzIfIMmQmzosRcFY7nuk6YTxsVydo4qXU8/sPSyqx2a8KaNAAj0s7YjaLYZkSKRckaSIYErOfNh7+kUhi7z5b26tAqlGeQpdwuyUncbIPqTS7l3KgUwCNFK7fggLK3M5ixWk33j6M9R4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9e0dHRBYbgItmFiT+C8L2qGLGOuQYH6WC50YKUNl87s=;
 b=MsshX2qNAGEbOiNnvEQpUaxsLJphS4YD5Q/5HBrgvGaYAWtVr2Ro8vhQ6NUZvJ5JNRM3h+uQ5EkRkgy4CZASmZyqAAshOJcvEp7zm6VJRc7jlVA3L73OfDDHFW4uvhKrFCCzmES5vC5MEokr5+tv63jfoLNFAjnEyIYLiVmqXBe6OIF6+u9yeXqU3DrpU3cw6rsh/VnuwaUUDkxsUDxIwvoRWxg5HD5nkdWcXSqPlCzSNV8Tc/cCf88d23YmTCyWjKrg4P8hp1sXIUE2IZRgRjO8rjt8zMw4QNHar0Agd8MbTjWEBos4TXuLLclLYvCNgCXqcJ0CxDibp6gG75zvfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9e0dHRBYbgItmFiT+C8L2qGLGOuQYH6WC50YKUNl87s=;
 b=M0qMAvqYykObpc33b1Z1RsBN/QwRYjYPlhama9UNfwzEO2QewZEacC5cwZf+5ugnHfJJoYqNNWcBb7Q5OWCWiH2vVWpXvJ8xwr15LQt7zE5mM2+eqrTo1ZrJUlTwxjfGTa+l4xV1yKW1Rhr/Xc6PPY/q34+RGuRrH8kOWKwS95lD6LwzmiZjZdiKbFyPuBsGkaoS58Vn0ih2zwPlsroicHST7s9EX3D7ydhO9CiTSNY2bX4FrhFVKJQdoe5mAOdZhDJsZzdARJ88SQB806lNIcaXfGSsMq/9qaXZC88528n81aIcAgg6ppE1N+LtcfV/N4RN5xsgnZCZYYpbNNXygA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9352.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 10:52:21 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:52:21 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "corbet@lwn.net"
 <corbet@lwn.net>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "kekrby@gmail.com"
 <kekrby@gmail.com>, "admin@kodeit.net" <admin@kodeit.net>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>, "evepolonium@gmail.com"
 <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NTekUAgALDg4CAAAXIWoAAAXgAgAACWAWAAAJegIAAANVGgAABVQCAAAEH9A==
Date: Mon, 24 Feb 2025 10:52:21 +0000
Message-ID: <PN3PR01MB9597EB4DD5B9BDB90658B18CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <6CB20172-906F-4D13-B5E4-100A9CF74F02@live.com>
 <Z7xCr4iPmIkPoWGC@smile.fi.intel.com>
 <PN3PR01MB9597CF2907CBBD6ED43D5E62B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7xIxFT-eB_OTGzm@smile.fi.intel.com>
 <PN3PR01MB9597FA2077E6FD498E8CDDD9B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7xMt2Kp1pFuMar2@smile.fi.intel.com>
 <PN3PR01MB9597DDF5CD7965128C2075DBB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7xOiK92jFfDqujz@smile.fi.intel.com>
In-Reply-To: <Z7xOiK92jFfDqujz@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB9352:EE_
x-ms-office365-filtering-correlation-id: 2d1df150-9562-4fe8-b3fb-08dd54c150ad
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|19110799003|8060799006|15080799006|6072599003|461199028|7092599003|4302099013|3412199025|440099028|10035399004|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?czdNVGgxdCtNcG8xTklDU2tEWHRuVmVZYmU1UGIzUTJ6Q0xmNXQ0dENLdFRU?=
 =?utf-8?B?cE1VbW1nRmNYWVUyTDNsVXNWNDVIUFEzL1dOK1FkeWlBS3dBUTN1aDhlVEIy?=
 =?utf-8?B?UVRjbnFiMkJqY1Iwc2x5N3BON0VvQWtrZVdXWEx6YXdINk1Gek5DUGJCVWhE?=
 =?utf-8?B?cGNpSGdMV3FrQW9Ea3pLNDlGMG5CMC9XUVJ1VXc5bVZWUUx5NFNIcWZIZE4w?=
 =?utf-8?B?L0NCUGNUSVJrdFg1Smh2ZVZnOTI1QVdvN1NRc1V2Z3dpdkg2cGFwM3ZZeis4?=
 =?utf-8?B?bWVLdEE3M2d6QksrK1Z2SC9lcmpnR1FXZ0dIaFROa0VmTThRWDh0YXBuL2Mz?=
 =?utf-8?B?aXltZ25EQjFTTnp3YmliM1k4V3Nhb24ra3AyMy9PeGVQeVp5QUVLSFEwQWEy?=
 =?utf-8?B?WldhbzErL1BnbnVNWTdCN3IyMTJMZkpSbm9xbW85SDJtcm01bk5FeTZyK0p5?=
 =?utf-8?B?THNIczhueW1EOXZaVGYvelVkZmJRcTMycWVsd2c4ckdqV0FnanNrWUNTdFJl?=
 =?utf-8?B?Y1liMk5zRUNsZWExeXR4Z3BPSXQwMWhMdTNNc1lvU3J2Q1p4QWdtVTczdmQ2?=
 =?utf-8?B?MFVMbytJc2lPTFJKOVVUUGl2OEF5clExYjh6Wm91QUhNeGROU1U3d0I5aW1U?=
 =?utf-8?B?dy8rZWNLbXd4UlcwenZEajhEVXBOV096aW1rMzY4SWZSU1EwTUJDbG9kbGVv?=
 =?utf-8?B?ckxjcU5iQVdadUhvWDJ6Q2ZkSmxrU1R2NEErVnlaN29vZ0N5MDBrajR0aEVK?=
 =?utf-8?B?SWRKdXRQQ3N6NnlJVGtMeU91VldtbUgvZGRhZVhJOExqVDBEY2JpNUtBZ1A5?=
 =?utf-8?B?Q3gxbzdhT3laZFcyNDRaK0ZzSzNhME1UbUxHVXZrMkpmUjhDQlNORFFMNGFh?=
 =?utf-8?B?MmNjS28zK2k2ckRhKzBNOHlYc0dONTdzN1NxNUNreW13OHgxeGY3VytGK0lp?=
 =?utf-8?B?c0RhTHhLNTVKODI4bm5TV290SnJUSG5FNW1hODRtVTRRUmxYb0ovMnFvUnNF?=
 =?utf-8?B?d3I4QTVTT01PVVFtRVhkYUZlTDFaQmpsb1dPRW05am1xdUQ2Tm4wT2xHejJ1?=
 =?utf-8?B?Q3NxditNN0tzSzdBc0dWK0srNStLV2lmaDVDSUlHVkppYTgzK1QvMHY2VE1m?=
 =?utf-8?B?am5uS1FBeUNxQW1TdnBUdWNCbWpEMGZZeXd3MGo1T3MzMCtqV0xSNGZOVFIr?=
 =?utf-8?B?TUdTUGxIUStCK3Y1VzFzOFNqMk1JSjgwa2ZRK1g2VmtQM0xQLy9VS25BdmVu?=
 =?utf-8?B?WUFQZUlLTXV0ZXF6a1hVbEl3L0tVVFpwTXV0T0s2UFlsdytnVFVQNWN3dVo0?=
 =?utf-8?B?WnBXYkFQcThnaU55UllQUjJwMWwyVUE0UzFyaUxTNTlEdUFzUmxhY3JkZ3po?=
 =?utf-8?B?b3NpUDE1VTBJbFcxYWVXK3g3bC9PMzAwcUZUVXVPVkpQS2lWV3RCSGpOKzNK?=
 =?utf-8?B?U084YVZHOTFkMVY2MzlrcFdTY2ptY3MydWtNaXBpZEpsZmcwZm4wZE1PU3hm?=
 =?utf-8?B?ZjdGN0JSZTM1SVVkRGVFY1BGcWV4QXVMN0FlZzNCVTZtZlZabEtlMzZSTWVy?=
 =?utf-8?B?U0FMTEZieUhhSXBZcmNBeS8vMlJTVTdkNGhwM3lzb2c0cW5CZkJ0bkFnanVD?=
 =?utf-8?B?bDJTKzZnakRnMnkydmNWd3h0UUw3bDY4Wkw0MngyMmw5MkZkM3pldDFINFE1?=
 =?utf-8?B?eFd5dUFEUVVuSVZlT0NLbDQwd1ZiTjRBMFhzZENVRDcvc1ZNMytoS2ZnPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUhrQkMySTVKOGNMbHNMeEEvR01qRVF3Sy9aRkw4Y3dhK0NteGNWRldCbDBI?=
 =?utf-8?B?Qy92OGFXZzYzUzBObHFnVGpLRVdxNVVtc3RuY0lUQ0R6OENla2xsS1dNby80?=
 =?utf-8?B?LzBVNWF4T1pyejdaWE13ZzJpNUZZa1lZcHpiek1JR05kMndaaFU2bExubGVC?=
 =?utf-8?B?VGJZWlZydndWMjE4R05WWTFkYUdndCtDbWJmU0I5aWtBSnVVdEc0UW5BMGM4?=
 =?utf-8?B?ZStwRlJaQjU5RE5Sd0VwYStlTHhJcE91Q2orb0dLOTgzUHlwVHkwb2R2LzNO?=
 =?utf-8?B?Zk9tYXNuZzVZKzNBbWo4Y3VrOVNFNThoNTBWQkxoUllSUGZpZityOU8vbkpE?=
 =?utf-8?B?Ym0vb3NpTmtwWUZNLzBTNzZRODVJSkFySzdoWVhUOXZzeXdieU5oUlJNNDky?=
 =?utf-8?B?aVQyeTZaemdrTXpWU0lXTG1XS0VBQnF1MEt0N1k1azhNdFRTVkVObkx2dTRk?=
 =?utf-8?B?akVvZ1BwWFMxdUs4VVpXTWM1Z25uNFhRMVZ3VDB6b1B6ZHNIbCt5cnZTdUU2?=
 =?utf-8?B?ZVdwOW9ocmpNMG5WczEvWENKWldBV0kvdDV2NjdmY1FJaDBvQ0E0QlNrWTFn?=
 =?utf-8?B?ME5zUFlUSFZZakNCbE1Od2lQVjk1UW1wM2dJVDdIWjBpVE9LcDVkSkZ1QnlM?=
 =?utf-8?B?Z20xeHFsYUNNOVJHSFlEL1RWZUpqelRMaGFrODUvZlk2anJiblZ4d2tzdldn?=
 =?utf-8?B?djdxZkFqZDdwTk52ME5EYXpsMlE3VjFZaFFCZUJwZzFhbnIzejIwZFhrRUM0?=
 =?utf-8?B?WnIxZjFhYmFMdy80QUdjRElkYjVBMU1sOC94cWlPOVpZNXN1TUNXc3FoSzNP?=
 =?utf-8?B?NEhDZ2FwOXdXY0l3Q1BVWjZPb0NKNkttT0pzUDB2SlA2UElveXJ5bXVvV0Fy?=
 =?utf-8?B?eDMxTVBhM3BiZytHQTQvYkVDNlkzSnZMVVBJQlo4blAwVU40MUFLai9rNlVZ?=
 =?utf-8?B?VGtOQmZKUmZuSHhXZkwrQy9ZTDRHb3RZaU5rdDc5cmJ1QnZOMWV6bFJ0K0Zm?=
 =?utf-8?B?aURPMUg0NWZjU0dsWUZ6UFhXWm1pdWVxcTBJRnFQK0pId1JzOEt5TWIvQnpY?=
 =?utf-8?B?a0M2d1h5U01EckRMWHlvcTM4NUlCNWVKTlBTdlZTbnArdmt1MnFvOUlxeGtZ?=
 =?utf-8?B?Z2J3L2g3dk9odWdXdDh5R0EzZm45SWltZjR4ZE5BU09YZFV6ZW5zeHN6Y2g1?=
 =?utf-8?B?NUtGd0ZFU3Z5ZWJ1WExZS1M3cUkvdzZ2Q1hkTWw1YnFzZnh4RVY3aUszenU5?=
 =?utf-8?B?d1VpaDFockwxdWtaNVlTZWpmQys2b055c2NPVWF5NUxiS3I2MUdsMDgxQmJH?=
 =?utf-8?B?VTc5QVpISWlSQ2VKRXZtN3JDNDNOWG1mVjVnUmdUWDRaVyt3bHhGYUtGbHpL?=
 =?utf-8?B?dDlqNWVTbzR5anM2cDluL1R1c2F6RDVFY25iWXFLM1hGUHJLNDNoK2RsbVNt?=
 =?utf-8?B?a1p0VlRVOE16bDVNSWgyYWwxMU9MUzZxR3U4VlE4YXRzalg4TUhTUEVES2NR?=
 =?utf-8?B?R2RrTDJuUjFuOVk4ZGZFYTFud3JTYmc0bHJnY3R0NUFtTU02OTE1dS9kMnhG?=
 =?utf-8?B?Q0YxUVJEV3IwYnJ5cFExSVdsRDRsQVJQUkozOHZacDBLeThjZkNFUFU0TlJD?=
 =?utf-8?Q?Hn0NJvM5jP1n1nO3PrpBEwcyykBqWH9zpt8chAXfMRgY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1df150-9562-4fe8-b3fb-08dd54c150ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 10:52:21.5292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9352
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDQ6MTnigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMTA6
NDM6NTRBTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IE9uIDI0IEZlYiAyMDI1LCBh
dCA0OjEx4oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+
PiDvu79PbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAxMDozMjoyN0FNICswMDAwLCBBZGl0eWEgR2Fy
ZyB3cm90ZToNCj4+Pj4+PiBPbiAyNCBGZWIgMjAyNSwgYXQgMzo1NOKAr1BNLCBhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20gd3JvdGU6DQo+Pj4+PiDvu79PbiBNb24sIEZlYiAyNCwg
MjAyNSBhdCAxMDoxODo0OEFNICswMDAwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+Pj4+Pj4+IE9u
IDI0IEZlYiAyMDI1LCBhdCAzOjI44oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVs
LmNvbSB3cm90ZToNCj4+Pj4+Pj4g77u/T24gU2F0LCBGZWIgMjIsIDIwMjUgYXQgMDM6NDY6MDNQ
TSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+Pj4+Pj4+IE9uIDIwIEZlYiAyMDI1LCBh
dCAxMDowOeKAr1BNLCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPiB3cm90ZToN
Cj4gDQo+IC4uLg0KPiANCj4+Pj4+Pj4+PiAlcDRjYyBpcyBkZXNpZ25lZCBmb3IgRFJNL1Y0TDIg
Rk9VUkNDcyB3aXRoIHRoZWlyIHNwZWNpZmljIHF1aXJrcywgYnV0DQo+Pj4+Pj4+Pj4gaXQncyB1
c2VmdWwgdG8gYmUgYWJsZSB0byBwcmludCBnZW5lcmljIDQtY2hhcmFjdGVyIGNvZGVzIGZvcm1h
dHRlZCBhcw0KPj4+Pj4+Pj4+IGFuIGludGVnZXIuIEV4dGVuZCBpdCB0byBhZGQgZm9ybWF0IHNw
ZWNpZmllcnMgZm9yIHByaW50aW5nIGdlbmVyaWMNCj4+Pj4+Pj4+PiAzMi1iaXQgRk9VUkNDcyB3
aXRoIHZhcmlvdXMgZW5kaWFuIHNlbWFudGljczoNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiAlcDRj
aCAgIEhvc3QtZW5kaWFuDQo+Pj4+Pj4+Pj4gJXA0Y2wgTGl0dGxlLWVuZGlhbg0KPj4+Pj4+Pj4+
ICVwNGNiIEJpZy1lbmRpYW4NCj4+Pj4+Pj4+PiAlcDRjciBSZXZlcnNlLWVuZGlhbg0KPj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4+IFRoZSBlbmRpYW5uZXNzIGRldGVybWluZXMgaG93IGJ5dGVzIGFyZSBp
bnRlcnByZXRlZCBhcyBhIHUzMiwgYW5kIHRoZQ0KPj4+Pj4+Pj4+IEZPVVJDQyBpcyB0aGVuIGFs
d2F5cyBwcmludGVkIE1TQnl0ZS1maXJzdCAodGhpcyBpcyB0aGUgb3Bwb3NpdGUgb2YNCj4+Pj4+
Pj4+PiBWNEwvRFJNIEZPVVJDQ3MpLiBUaGlzIGNvdmVycyBtb3N0IHByYWN0aWNhbCBjYXNlcywg
ZS5nLiAlcDRjciB3b3VsZA0KPj4+Pj4+Pj4+IGFsbG93IHByaW50aW5nIExTQnl0ZS1maXJzdCBG
T1VSQ0NzIHN0b3JlZCBpbiBob3N0IGVuZGlhbiBvcmRlcg0KPj4+Pj4+Pj4+IChvdGhlciB0aGFu
IHRoZSBoZXggZm9ybSBiZWluZyBpbiBjaGFyYWN0ZXIgb3JkZXIsIG5vdCB0aGUgaW50ZWdlcg0K
Pj4+Pj4+Pj4+IHZhbHVlKS4NCj4+Pj4+Pj4gDQo+Pj4+Pj4+IC4uLg0KPj4+Pj4+PiANCj4+Pj4+
Pj4+IEJUVywgYWZ0ZXIgbG9va2luZyBhdCB0aGUgY29tbWVudHMgYnkgTWFydGluIFsxXSwgaXRz
IGFjdHVhbGx5IGJldHRlciB0byB1c2UNCj4+Pj4+Pj4+IGV4aXN0aW5nIHNwZWNpZmllcnMgZm9y
IHRoZSBhcHBsZXRiZHJtIGRyaXZlci4gIFRoZSBkcml2ZXIgbmVlZHMgdGhlIGhvc3QNCj4+Pj4+
Pj4+IGVuZGlhbiBhcyBwcm9wb3NlZCBieSB0aGlzIHBhdGNoLCBzbyBpbnN0ZWFkIG9mIHRoYXQs
IHdlIGNhbiB1c2UgJS40cw0KPj4+Pj4+PiANCj4+Pj4+Pj4gRG8geW91IG1lYW4gdGhpcyBwYXRj
aCB3aWxsIG5vdCBiZSBuZWVkZWQ/IElmIHRoaXMgYSBjYXNlLCB0aGF0IHdvdWxkIGJlIHRoZQ0K
Pj4+Pj4+PiBiZXN0IHNvbHV0aW9uLg0KPj4+Pj4+IA0KPj4+Pj4+IEkgdGVzdGVkIHdpdGggJTRw
RSwgYW5kIHRoZSByZXN1bHRzIGFyZSBkaWZmZXJlbnQgZnJvbSBleHBlY3RlZC4gU28gdGhpcw0K
Pj4+Pj4+IHdvdWxkIGJlIHByZWZlcnJlZC4gS2luZGx5IHNlZSBteSBsYXRlc3QgZW1haWwgd2l0
aCBhIHByb3Bvc2VkIHdvcmthcm91bmQgZm9yDQo+Pj4+Pj4gdGhlIHNwYXJzZSB3YXJuaW5ncy4N
Cj4+Pj4+IA0KPj4+Pj4gJS40cyBzb3VuZGVkIG9rYXksIGJ1dCAlNHBFIGlzIGFsd2F5cyBhYm91
dCBlc2NhcGluZyBhbmQgdGhlIHJlc3VsdCBtYXkgb2NjdXB5DQo+Pj4+PiAlNHggbWVtb3J5IChv
Y3RhbCBlc2NhcGluZyBvZiBub24tcHJpbnRhYmxlIGNoYXJhY3RlcnMpLiBPZiBjb3Vyc2UsIHlv
dSBtYXkgdmFyeQ0KPj4+Pj4gdGhlIGVzY2FwaW5nIGNsYXNzZXMsIGJ1dCBJSVJDIHRoZSBvY3Rh
bCBvciBoZXggZXNjYXBpbmcgaXMgdW5jb25kaXRpb25hbC4NCj4+Pj4gDQo+Pj4+ICUuNHMgaXMg
dXNlZCBmb3IgdW5zaWduZWQgaW50IGlpcmMsIGhlcmUgaXQncyBfX2xlMzIuDQo+Pj4gDQo+Pj4g
Tm8sIGl0J3MgdXNlZCB0byAnY2hhciAqJy4gaW4gY2FzZSBvbmUgbWF5IGd1YXJhbnRlZSB0aGF0
IGl0IGF0IGxlYXN0IGlzDQo+Pj4gZm91ciBjaGFyYWN0ZXJzIGxvbmcuDQo+IA0KPj4gU3RpbGwg
dGhlIGFyZ3VtZW50IGhlcmUgaXMgX19sZTMyLiAlcDRoIGlzIHNob3dpbmcgcmV2ZXJzZSB2YWx1
ZXMgdGhhbiB3aGF0DQo+PiAlNHBFIGFzIHdlbGwgYXMgJS40cyBzaG93cy4NCj4gDQo+IEZvciBf
X2xlMzIgdGhlICUuNHMgd2lsbCBwcmludCBmcm9tIExTQiB0byBNU0IgYW5kIG90aGVyd2lzZSBm
b3IgX19iZTMyLg0KPiBZb3UgY2FuIHByb3ZpZGUgYW55IGNvbnZlcnNpb24geW91IHdhbnQgdG8g
aGF2ZSBpdCBzdGFibGUgYmV0d2Vlbg0KPiB0aGUgZW5kaWFuZXNzZXMuIEluIGFueSBjYXNlIGxv
b2tpbmcgYXQgdGhlIERSTSBwYXRjaCBpdCBtaWdodCBiZSB0aGF0DQo+IHRoZSBlbnRpcmUgZHJp
dmVyIGdvdCB0aGUgZW5kaWFuZXNzIHdyb25nLiBIYXZlIHlvdSBjaGVja2VkIG15IGNvbW1lbnQN
Cj4gdGhlcmU/DQoNCmRybSBkcml2ZXJzIGhhdmUgYSAlcDRjYyBhbHJlYWR5IHVwc3RyZWFtLiBJ
IHRoaW5rIHdlIG5lZWQgdGhhdCB0aGVuLg0KPiANCj4+Pj4+Pj4+IFsxXTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYXNhaGkvRTc1M0IzOTEtRDJDQi00MjEzLUFGODItNjc4QURENUE3NjQ0QGN1
dGViaXQub3JnLw0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBBbHRlcm5hdGl2ZWx5IHdlIGNvdWxkIGFk
ZCBhIGhvc3QgZW5kaWFuIG9ubHkuIE90aGVyIGVuZGlhbnMgYXJlIG5vdCByZWFsbHkNCj4+Pj4+
Pj4+IHVzZWQgYnkgYW55IGRyaXZlciBBRkFJSy4gVGhlIGhvc3QgZW5kaWFuIGlzIGJlaW5nIHVz
ZWQgYnkgYXBwbGV0YmRybSBhbmQNCj4+Pj4+Pj4+IEFzYWhpIExpbnV44oCZIFNNQyBkcml2ZXIg
b25seS4NCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28N
Cj4gDQo+IA0K
