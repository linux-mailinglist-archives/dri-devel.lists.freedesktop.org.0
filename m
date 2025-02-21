Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206CAA3FFD7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 20:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9074210E23A;
	Fri, 21 Feb 2025 19:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="sJe5gGLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010005.outbound.protection.outlook.com [52.103.67.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9D010E23A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 19:37:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgTveET2V/YxO70ao9nd5oOz0XwRp4c2oSNL7MX0Jd0Ss8MoswOWp69YC7JCvkuFgwcdqdbKL5klmmd9YCj1KH3y4QEGNPj4D0pGRJvmgNo+4BB86TXuzKZ+Kp++dVXCMSrq0ol0HsIamimAhiXdRvGBozeKSKhuDVahMHQYGGCFQfsbI4vQ/KdzmhjovoIXMjlIJx3Ps2z377MPCW0FIWI2ytWF0uqpogqSoBvIrzLyy25IlkoW8q+ZTl/W5pdpOsQ+8XxDQBpg/FWcdmdgoKW61yeUtmr3Ol4pVNy+nFmuQ0moafC04V0Kb6LdPkG1+FtoGSCNU+fH8myThnKmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8tKytOpBle4gow0BjsokYNAHYiq4MYb27Ei22Crb3E=;
 b=CaixqQ5kKCK1wkUc/nonM62K8x2ci0Ir2amNABeCqGGmvO0yuCmFgG+8Sqna5qp+odLH0pXfzJTvgYb6a/QErKmmUs6C08Ly+PpK2mEMfYU7ZLZ0GuM23R3mrRDID4hJNHIzSYr4VI8g8MephEl2N/mj44DTiBNC2bvq5yZryp2Uy4GyEdFBM5Kbh4SuwDbq7iG+uCsxC/79Mb4ryrJH2TaLMboSgLJ1q5TwqIg5dW2nMVZvI88uhQP07YAGEaQHxuM1s4bV8zPWd7NnWQ5Uynkhhm5W62TmdwbjuBJE6ysQX4v1bnXyippE94KYvhwQhbXRAk4Hy5+Ylyx6DtxrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8tKytOpBle4gow0BjsokYNAHYiq4MYb27Ei22Crb3E=;
 b=sJe5gGLq60RSLNq5YxO2DtEAqePEJ1YQYsfBQzxx1oejsUSxMTlw2SLcd61oCfY4B7kdDiNeTFCwu8UHfy5NJgIP85QbBI1IS4BqAsUxHHZ4WC6I8TSEvsVKf0aF3RC+0p/wzu7IW/ULZqVSSy8DbE3dNBfbgWGQ8+OCDRSNrEoRZf4AQgK3wZbp7j+R6YGmoaPX+dzkMnnYvMVGY+zuRV8CiZ7tt5wA9tHYb7kX73IxJa4DzI40KcsL8YjgjnNtDcDSxInjBFH+v3wEF4wFYhjfxIGOVei139a3987y9CH7lte/Ts+JJg9ctRHVsCfBZ+TAKayaQthVvwgq/9amjA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MA0PR01MB9356.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 19:37:18 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 19:37:18 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "pmladek@suse.com" <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, Jonathan Corbet
 <corbet@lwn.net>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 Andrew Morton <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, Kerem Karabay
 <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, Orlando Chamberlain
 <orlandoch.dev@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, Asahi Linux Mailing List
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbhFT0fOUl25FNLkutUStd1OCiELNR4j8AgABFEQA=
Date: Fri, 21 Feb 2025 19:37:17 +0000
Message-ID: <ED4B4FD3-CD26-4200-97E0-BC01B3408A4C@live.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
 <Z7ib8uH91rKdoyjP@smile.fi.intel.com>
In-Reply-To: <Z7ib8uH91rKdoyjP@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MA0PR01MB9356:EE_
x-ms-office365-filtering-correlation-id: 48fb68b8-ea39-432d-a2b2-08dd52af26bb
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|7092599003|461199028|15080799006|8062599003|8060799006|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?utf-8?B?UmZoZFZXVkl1anlPZ2wrMlB6ZDJBRHdmbzVpZ1VlY21nWjE2aTBUTmpMcGdy?=
 =?utf-8?B?RHloWWxiRzl5YWtzNDdNZyt2T1I5UW5qLzFzSW1UcFlSc0Q5L2h2UjZVWlNB?=
 =?utf-8?B?alRoV1F1YWs5bVlIZm52NVlUQkVBSEhIZ2JpMGNNS3hiYWlRbFgrd1kwTndY?=
 =?utf-8?B?UnlNaS9DbzhUMnFoSlEwN21abW51VG1HWHh1VUxJMm8wTmliSm5BN211SEVY?=
 =?utf-8?B?cFlLRkJscVpOTmhwNlk3YUtHK0FjeWc1bXhVK2JpT2lYYUxDOFNsNmQwNW9M?=
 =?utf-8?B?VllZcFlYMDhCWDcwKzZEVDNPcHdNWFJQSWFVTXJSNFdrdktRSHY3WHptUDRN?=
 =?utf-8?B?dThXM040U291MEVGVFZFalkvWjNFaDZmMDE2VWxqcEZ4cnoyUHU0N25TV0hF?=
 =?utf-8?B?UnVMYzRLd3FYQ2dOcTd5cHJwMDhpb0pnZzhhRDZNWGtqeXFHdTArZE1iQ3N1?=
 =?utf-8?B?ZFZJaldRaXBNaFZ5MUZmMklMVjVWSmYyVk8vVGZzUHBBc2VZR0VNT3dzTjZy?=
 =?utf-8?B?OFNRKzBqd3ZITmZ3Qm9zQmJSZ05SUGpBUUd3c21IZjdjK2FDYXhWTTk5MCtE?=
 =?utf-8?B?a09LV29NanBDeG9NeEl4OE01cmswK2g3d0dnYXcvY1FiTUdNZ3RwREV0TXpI?=
 =?utf-8?B?R3FOUUc4MFg3eWw0QXQ2WGZYZWlITktVUHl3K1RiNHVKL0t0RWdxN1pHSEUy?=
 =?utf-8?B?eVBPRjRjTS9mLzZBUEg0ZWdyVis3NmYwck5PVVhUMVBwdHljZW13a0cxYTNi?=
 =?utf-8?B?R3BXa3hoWGg5S01FMTVZRlk2WDNVSnk0NGx4a3dmQ1RRTXdKUjFaaVRuSnBT?=
 =?utf-8?B?ckpJcWJkNHk0STBTalo3RnAyTXgxU3pyZ1VVeDQ1MTB5aDdmNkhwODZPeXg1?=
 =?utf-8?B?QjNocVVCK1M1enFWMFFQQUZpUmcyRnJhZ1k1VTVMN2dYbU5TdStYSXp1TnZB?=
 =?utf-8?B?aXRzbUxHb0kxYXBJMzk5THZiNXRENWJVSHNwZ25yNG16OUJwTzhtMTJvZm1y?=
 =?utf-8?B?UmZNNHBvRDVUREJoUDM0d0ZZbWx0Y0ZBZTBDT0hiQUthdG85ekQvOXo4VGRI?=
 =?utf-8?B?T2xKcXo5b3NpNDM2N3JJSlJLUmR0Ly9USnkxZ2VuLzRrWitDWXA0TGpvVVlp?=
 =?utf-8?B?RVdKMWlaeXFGOW5mdnZ5T2pSMExGM1hLYWpCdTF0Sjc3eCsrNkJxWHRyOWRZ?=
 =?utf-8?B?TnhyVy9tNkloZ0dOYjg0a0kwTlBqWm5IS1BGVXc4bzNEeDFDVlV3ZFRLMGw5?=
 =?utf-8?B?c2VXVEhRMk5QTElkc3FjRURlUjJpWmFMd1VQRjdYcDVXZHBDd3NCSWdNS3Mr?=
 =?utf-8?B?dXRnVTZMZmp0TjE1akx1N3BsT0d0Z2wxUzRLRGFhbjRZRU9iei9rRVAvR0JE?=
 =?utf-8?B?ZU5DdytvekU4VjE4S1JjQ3VXbk9pRGR1VHlENkJrZ1pqTVVPeUtlK2lSbDJ0?=
 =?utf-8?B?ZER3a0hISWV6NEVSSFNWU2hVVTBuU2xWOFN5OHl3PT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXA3eFhldEpHNkF5WFBtLzFXTEZqcjl4Q0hpbHc1WFdkaGZNRjhzUnovSzF4?=
 =?utf-8?B?eVpDMVo1MXRrQU1xMUFhRzNRRmdsU3VTZjB3Uk82ajd0SzA5Q3RHWjJkSkRt?=
 =?utf-8?B?UjF0YlRFTTRRd0M1RUNzdTlVNnpSeU5PalVjKzQ1Z1FuRmN2VkJvaERTczFw?=
 =?utf-8?B?Ky9QaFo3alN5Myt2eXQ0TzFkaTBlYjBqcHhBT2YxWXhydEl2TGhaalZuQkN1?=
 =?utf-8?B?ZGVaMm5wVHhLOUdXVEJnN21NU0xwTHUrRjl0enBvTXhaYnpRUVRZMTk5cU5Q?=
 =?utf-8?B?ck1wM3dnNkFXbE5YZkNzOG4wb05EMTVTVVVYZzJydkhHVTlmdkxvbXd6VXFU?=
 =?utf-8?B?NTR4MU1aQlp6dC8rRmY4T0RPendidjhPY1VoVFF1TGdOQ1BCb29qMEUvUWNv?=
 =?utf-8?B?VlJoanI2NTNzcTJUNlpkbER3RE54TmlJNU9CRGFwSEU3ZENRWXZxaXV2ZnNv?=
 =?utf-8?B?TGpvV1F5c1hDMFJGVmMwb0psT1I3aUU4VEwyWUNGVWdydFl2ME1EUzkwZFVF?=
 =?utf-8?B?bDRDQ08waFZtelZreENWa0lacGkzRk1RYUVZR2hiY3NyVmdUSjJ4OWROcUxq?=
 =?utf-8?B?bnc0ZG45c1JZcUlPR3FkWU9iS21wQXIyNTdpK3dMV1M0U1gyUFAzYnRPSUwv?=
 =?utf-8?B?TEl4LzNZVGdVb2xJbEYvaGJibjVpMmVybzBpeityYktZNEl0NHhyc2hUbXZ5?=
 =?utf-8?B?YXl1bzRvaVI4cEQ1T3EwL1hnUTEzYVZ3dlZ1UUhxQ1c5UTZjMitQeXJhVUNR?=
 =?utf-8?B?UWVOdExrUUJWdmIxMFFJSU45Uk55ZmQ1NzJReWF1Wmp0WHhhKzRmU0JKNVpJ?=
 =?utf-8?B?djdycXJpbFBIaTFMS3ZxaVFmbXBvaWdWeG9uR0Z2TW5zSi9IM1R0UW80OWo5?=
 =?utf-8?B?U29iUWlxL2FqR1ZvMVBwUXlnMWtPYUlrSElpZzRpTnJyYURCd1MxVGlXb2Rx?=
 =?utf-8?B?a0pQcEk5UGRWdWdkU0lxOEhiOFRxcytPOE9yRlpUYXhhT0NlQjFtNVczSG5W?=
 =?utf-8?B?NWxaQnBGSExGOXNCcCt2d290dTdWRFR5RTJXdUw5TkF3V004N1lsK1ZBS1VQ?=
 =?utf-8?B?Z2QyWUt4US92OVRUQVd3UU5QVldNRzJuMlZmVjNiV3BQQjRZVVdmd3Z4c0dO?=
 =?utf-8?B?M3I1QXFZMGpFTlpybUMySmtaYW43V1hLVG1xcG9vNEs4L2d3UG43MEpKNGEx?=
 =?utf-8?B?YUJ3Mng4YlRVSHlOK09OS0dyK2F6VzVBRVA0Z0R4TFU5VUxzZEFhRjNnOGJY?=
 =?utf-8?B?SHA4M3BBdkR1Q2dyWWpMUTcwQjVuQlVJZnMxdGJyK2lwN25YMGs2dFlKMU5r?=
 =?utf-8?B?akNMYTJUaVRMcTRnT1IwU1NhRmxyZ3dIUXA2cVA4K3p2MmFuNTZvWUFRTEpT?=
 =?utf-8?B?OWk2MFJMR2RUZG41My9EQkZjbjV0UlhuaFVMSEdBNkVqOWlnRVZQaTRCa255?=
 =?utf-8?B?bm55NFFpVHRsbWhOdlZLNExMQ202QldVMWlETkFRN3pnQmpvaTdQQWV1TitE?=
 =?utf-8?B?YmlrdVVOWVp5cnVSTk9Sa2syc3lGcS9tSS9FdkZ2Qkd6dlQvc2pzTlVqNGNF?=
 =?utf-8?B?RndTZ05CcEF1cFA1dGRQY3l1aTdHYlZBSlcxMTExcFhlUEpsS2RyQWh6dFND?=
 =?utf-8?B?Zm5YYVI1Vk9paVdYZjhuU1E2TS9rdXZhbGc1SXVMbjdiKzV6WmZEelJydUJl?=
 =?utf-8?B?QS9naS9oRTl4MXlhU1VOOWFRNlNNZmdxcFJMSGZLYnZuVjc3ZFV5STA4ZXBi?=
 =?utf-8?Q?9scwzxaY2L0dlFuacRCSxOwvZTHyREozcRsMBA4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F82B7E04235DD7428252E3DE8B9DA1CF@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 48fb68b8-ea39-432d-a2b2-08dd52af26bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 19:37:17.8773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9356
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

DQoNCj4gT24gMjEgRmViIDIwMjUsIGF0IDg6NTnigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4gT24gRnJpLCBGZWIgMjEsIDIwMjUgYXQgMTE6Mzc6
MTNBTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiBGcm9tOiBIZWN0b3IgTWFydGluIDxt
YXJjYW5AbWFyY2FuLnN0Pg0KPiANCj4gRmlyc3Qgb2YgYWxsLCBJIGRvIG5vdCBzZWUgdGhlIGNv
dmVyIGxldHRlci4gSXMgaXQgb25seSBhbiBpc3N1ZSBvbiBteSBzaWRlPw0KDQpUaGVzZSBhcmUg
bGl0ZXJhbGx5IDMgcGF0Y2hlcyB0aGF0IGFyZSBzZWxmIGV4cGxhbmF0b3J5LiBJcyB0aGlzIGEg
aGFyZCBhbmQgZmFzdCBydWxlIHRoYXQgYSBjb3ZlciBsZXR0ZXIgTVVTVCBiZSB0aGVyZT8NCg0K
PiANCj4+ICVwNGNjIGlzIGRlc2lnbmVkIGZvciBEUk0vVjRMMiBGT1VSQ0NzIHdpdGggdGhlaXIg
c3BlY2lmaWMgcXVpcmtzLCBidXQNCj4+IGl0J3MgdXNlZnVsIHRvIGJlIGFibGUgdG8gcHJpbnQg
Z2VuZXJpYyA0LWNoYXJhY3RlciBjb2RlcyBmb3JtYXR0ZWQgYXMNCj4+IGFuIGludGVnZXIuIEV4
dGVuZCBpdCB0byBhZGQgZm9ybWF0IHNwZWNpZmllcnMgZm9yIHByaW50aW5nIGdlbmVyaWMNCj4+
IDMyLWJpdCBGT1VSQ0NzIHdpdGggdmFyaW91cyBlbmRpYW4gc2VtYW50aWNzOg0KPj4gDQo+PiAl
cDRjaCAgIEhvc3QtZW5kaWFuDQo+PiAlcDRjbCBMaXR0bGUtZW5kaWFuDQo+PiAlcDRjYiBCaWct
ZW5kaWFuDQo+PiAlcDRjciBSZXZlcnNlLWVuZGlhbg0KPj4gDQo+PiBUaGUgZW5kaWFubmVzcyBk
ZXRlcm1pbmVzIGhvdyBieXRlcyBhcmUgaW50ZXJwcmV0ZWQgYXMgYSB1MzIsIGFuZCB0aGUNCj4+
IEZPVVJDQyBpcyB0aGVuIGFsd2F5cyBwcmludGVkIE1TQnl0ZS1maXJzdCAodGhpcyBpcyB0aGUg
b3Bwb3NpdGUgb2YNCj4+IFY0TC9EUk0gRk9VUkNDcykuIFRoaXMgY292ZXJzIG1vc3QgcHJhY3Rp
Y2FsIGNhc2VzLCBlLmcuICVwNGNyIHdvdWxkDQo+PiBhbGxvdyBwcmludGluZyBMU0J5dGUtZmly
c3QgRk9VUkNDcyBzdG9yZWQgaW4gaG9zdCBlbmRpYW4gb3JkZXINCj4+IChvdGhlciB0aGFuIHRo
ZSBoZXggZm9ybSBiZWluZyBpbiBjaGFyYWN0ZXIgb3JkZXIsIG5vdCB0aGUgaW50ZWdlcg0KPj4g
dmFsdWUpLg0KPiANCj4gU2Vjb25kLCBkb24ndCBpc3N1ZSB2ZXJzaW9ucyB0b28gZmFzdCwgZ2l2
ZSBhdCBsZWFzdCBhIGZldyBkYXlzIGZvciB0aGUNCj4gcmV2aWV3ZXJzIHRvIGhhdmUgYSBjaGFu
Y2Ugb24gbG9va2luZyBpbnRvIGl0Lg0KDQpTdXJlLCBJ4oCZbGwgdGFrZSBjYXJlIG9mIHRoYXQu
DQoNCkJUVywgYSBmb3VuZCBhIHR5cG86DQoNCisgc3RhdGljIGNvbnN0IHN0cnVjdCBmb3VyY2Nf
c3RydWN0IHRyeV9jaCA9IHsNCisgMHg0MTQyNDM0NCwgIkFCQ0QgKDB4NDE0MjQzNDQpIiwNCisg
fTsNCisgc3RydWN0IGNvbnN0IHN0cnVjdCBmb3VyY2Nfc3RydWN0IHRyeV9jciA9IHsNCisgMHg0
MTQyNDM0NCwgIkRDQkEgKDB4NDQ0MzQyNDEpIiwNCisgfTsNCisgc3RhdGljIGNvbnN0IHN0cnVj
dCBmb3VyY2Nfc3RydWN0IHRyeV9jbCA9IHsNCisgbGUzMl90b19jcHUoMHg0MTQyNDM0NCksICJB
QkNEICgweDQxNDI0MzQ0KSIsDQorIH07DQorIHN0cnVjdCBjb25zdCBzdHJ1Y3QgZm91cmNjX3N0
cnVjdCB0cnlfY2IgPSB7DQorIGJlMzJfdG9fY3B1KDB4NDE0MjQzNDQpLCAiQUJDRCAoMHg0MTQy
NDM0NCkiLA0KKyB9Ow0KDQpNaXN0eXBlZCBzdHJ1Y3QgaW5zdGVhZCBvZiBzdGF0aWMuIFdpbGwg
Zml4IGluIHY0Lg==
