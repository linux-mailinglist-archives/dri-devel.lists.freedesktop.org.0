Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B70A427A5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 17:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE86F10E45D;
	Mon, 24 Feb 2025 16:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="AfO6HReZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010003.outbound.protection.outlook.com [52.103.67.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C79910E45C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:17:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdP2tU1oilGtAOGTGiGOUYWS4y2PWuxFZtyFS+np51pS2n+1R9hq3tGvovU3LYfBRxmjMFGWMX4CN+ySczfx+HcI/gtFLhuhsSEJ9bCXFvShqAXR8QFYqKGoC7Vvf/bbVbaJneDCU6hiFx4n6tAekmxrfJQ6DKiU3FCl/SQJoRF2cMJvJeuToow9y8XAJSH2hRU1b1XJ+5s/2SN+Vc0zrcZTcTaBOTNjFuFAIi9kzYMmHO+A/FFRnCwePl47J0aYS9DnsPLkbEYij+2zD24UHqEUnegre4Nsqlo6SPENx5h60jLZG/Ckzcx5kTLOJE/8Gc7qVkMZKg2dSP546nD9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXyVKJ1fuHQRroKAPje4wDu9RMfSS3V/8KedG/dFjyM=;
 b=MrJpkNn4233dvEYyCLy17cew07QLDfz0Q6qHmvmPkkFAah1kC/ks/oYRyvg+GSihFNPM3HfeQe1FqjfHaJeOutFIOxQhS8cKjnxelmm+5sHL0r7WM3kQXL1NCGAOqMmrlnpyibvwl/9zXEwdJ8HHWDxFS+6aDq8rLMLP15Dp80oMS888QLKlW/3n0rZrqWB3HLcjF0RwU9EZRSOrUl1euzi8ANFrlUAgDI35WbzgRyQWlfn0BGWRRUNEqRxZ2bfWfT6KUknU/2DehiM2gJ4kuSnddzWbJrqVC3ak7eoPSJuhg7ZqqBKb0c6fKwpVnQ/whte2761MdmSaO5DWH7Ql/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXyVKJ1fuHQRroKAPje4wDu9RMfSS3V/8KedG/dFjyM=;
 b=AfO6HReZMRwsNXcGpqsG8jyrvnbP7+AQH3AcFgu/8lpNkTAwN4aFWTzBdZEw6HFQW+Zt4c3AUdDgn1krWqPb3J3TLz0FULNIDTMBx07/8bRHhuFeoCzpick7IkxGNOAXA9ziSNpGFDT8qVWXVp5ay8BWZ2kr88PXMgz1iXvGeLO4MwlYyAIyBHv8TM0Xfozxa4JH65U4ufu4AJfBPRZHyeVxVZ63VABuX7GzgYrWL7mYV5STr9TtMAb0LZqB7Vf8SPVJlZQIccqsghjSnXV2wbORtyW5W0lAlUq+nAlbFbvdmmDxQA3uBz82nHHaKjPQj0+zC5HlHpaNiIOFp8HZww==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNXPR01MB7074.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 16:17:38 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 16:17:38 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "linux@rasmusvillemoes.dk"
 <linux@rasmusvillemoes.dk>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
CC: "kekrby@gmail.com" <kekrby@gmail.com>, "admin@kodeit.net"
 <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>,
 "evepolonium@gmail.com" <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
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
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NWp9L1
Date: Mon, 24 Feb 2025 16:17:38 +0000
Message-ID: <PN3PR01MB95971110670F02685E6AF519B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
In-Reply-To: <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PNXPR01MB7074:EE_
x-ms-office365-filtering-correlation-id: 66ac91ae-0ac4-4f14-c43a-08dd54eec1d2
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|6072599003|7092599003|461199028|19110799003|8062599003|8060799006|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info: =?utf-8?B?UkxOR29pWWo0aDdvN2Ird2R4Rmw3NEo0OHJNS2lxSWpIM09OMDBYUXlGSy9x?=
 =?utf-8?B?TDM4bUdNSEgxNVVaZm9mY2FCM2ZuYktRNTB5Zm9tbWdobExKSkxzcytYOHBx?=
 =?utf-8?B?ckVteDRycXkvczhqYmMwRldlYkNBNlNuOXdYc1U0cm1TQjgvU0lkT05sbG50?=
 =?utf-8?B?WkFrcXlJZUJkNVNWZXppdldPT1VEMXhUbTUzaHpENDNOUXdseHdnOTZxNVV2?=
 =?utf-8?B?TWliY3oxWUdvSk4xRGJ2b0xvcXJYcHc1TVR0dEVRQlhHV29NUE1FeGNEQWlo?=
 =?utf-8?B?Y2NjM3Z2Z1pJbDFzcGdjQ2Vxak41SUdaQkdLU1VOKzkxdThpa3VmRUxDdGJy?=
 =?utf-8?B?djRncTd4cVJacHp5cDBZTmF2Rm02R00zaWdMVS9VcFFSWTFIdGFBSCtjZFJP?=
 =?utf-8?B?eDRRd0dGZVB3cUt6cTU2R3RRV0xEaG5maHRCTGw1R2hTeElma2xzaDI3cXBJ?=
 =?utf-8?B?NUF2b1ptMXFVTVNIdUs3bk5WZzI1R2kwOUN5c2ZtN1ZXS2RZVHV1ZkFuR1Ar?=
 =?utf-8?B?ck9GWkNheThMSmpTMTFBbFZYMzdpdk5yYXZVMnJaMkVjdDdZU1ZYcVlSUUJi?=
 =?utf-8?B?SEhXYmpEWXBJd3Q5eVdUVmg2RzNrZkpobXNPc3JEemVhbzF2bnZFNVdQbjFR?=
 =?utf-8?B?cTMxUWx6VFUxYWcxOThHQ09GNHQ0NjBFaG0vbVdTZjlUMmJTcGpDaWU3Zzhx?=
 =?utf-8?B?dEZWL0t0Wk9oTmVJYTdZN3hxOFFNclI4SjJhRjRoZmNyeWZBTXlNeWlzMElz?=
 =?utf-8?B?RjFlREVYbGlQckZ0TE91NTFHTGZGdk1MOWNLcVBQNVRRZ2VoRVFVdVdnY1Nr?=
 =?utf-8?B?Zk5DWUJqQ3g0WVdOU2kvNysyRi94WTVqY3NxK0JTRWg2WXZaZ25MNnExRUli?=
 =?utf-8?B?a3VvY0VmT2NMckU3dWVKOXZNMjVnUlljOFY3QnkyS3BaeTliTENPVE1WM2dS?=
 =?utf-8?B?YVRBQWF6ODFNV3hVNUEvdHFReUU1SU1ub3RRVjZFMmV1aVZjK0MzQlBBa0dx?=
 =?utf-8?B?ZTlNaGQrb29MZ0VjU1hISmRSVkRwYnhncWwvVjhEa1hGSWZSVnlnaEZhc29Z?=
 =?utf-8?B?OXorUzA0UzhNM0U4aE01cVFzUVpQaE82dkluRHRkU0IwOEtQc2tlY215Zk1C?=
 =?utf-8?B?QUdEYUVkekp3aWxkZkRVanNoSFczdHptcmtYbHNUakJqdWNwU0VJeTlOYTkr?=
 =?utf-8?B?SnJRZUR2WXNKTlEvcFdIeVY5SHU5RW54YkRCa1BURGRBL1BFWnlYaStOK3Qx?=
 =?utf-8?B?dHU1SG5xRjlra0U5YzZNcTZ2SFlOc1BWMEhzVmY1aXQrNkJUdUVCNTRCakcw?=
 =?utf-8?B?cUxGdXdXVGRkTXlGbEtqdDVtemt6OENLUzkwSW5qOFZZRHNIS3ZUSjFUZmNV?=
 =?utf-8?B?Ry9HZzRabG9tUTF5aUcwZENHdjhQK0ZXeWgxSnFyRGxFendkWUZCaEMvOGhX?=
 =?utf-8?B?Ui91Qlg2Z1dlYy9BK1o2YTFVaXEyZkphY3ZjQTIwYW1WczByTGFqT2cvVlRa?=
 =?utf-8?Q?mWlzcN2wriaLs2wb2yiBkjLl8+H?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjlzTmtwQ3BoNitZWS82L1ZKejc5Tjd6cisxUkNuUkw2K3JrVHJVaUo3bnVF?=
 =?utf-8?B?MTg0dzIzSTNpRERtV0RSandFdmNHS2Y1YjdtSjYyOHJQUUhiNGxTWGNBdWFq?=
 =?utf-8?B?SWs1dGNNUy9MamEvY3ZhOC9BMG9nbmFNNUQySlF2NW0wT3hRNHJ2UUQrUCsz?=
 =?utf-8?B?WlhHRXVhbCtnNUdhNHBDbWJpQ2M2UW1tUmpkeW1kRHE0b0RpVExMZU1wL2R3?=
 =?utf-8?B?NGNiUzZyazMzZy9RalVHSEt3SUY3RXVZLzdaQTVmNTg1M3ZmSWtTUlRSTldv?=
 =?utf-8?B?VnRBcEhqUGdtQjJkM0x0TjRkbWhYbG1HVG5GSXhUV3lxU0dIbU1mV3VOS0xq?=
 =?utf-8?B?MDFMTEtvQWRWZ1Q3MnBjZGtrK09MTUxtL01Kb0g5SVpFbThJVmYvcWNMblZv?=
 =?utf-8?B?VURZSUJ4WSt0Q0J5dWo2QTVPWlN4QTIybkZUTE54Vm15WWcrNTZDNVVxNThm?=
 =?utf-8?B?dTRwdFFqZDZOUlZvUW52d3hVOXF1MXlwWmFudW1qWHp0RXhrYWIyeDJvdTkr?=
 =?utf-8?B?bU1FNVRjY1l1aXlUTjhYdS9vZ25LYzYwOHpLem83ZGJMKzdUOVdRUG1RL2lK?=
 =?utf-8?B?Vld3dVNORzRUL3dXVjlrYnpTRkl3bDhQK3U5dHZqVkN6SGFUMW9BQnVaUXBp?=
 =?utf-8?B?VzgrWWh0YktNSTNjRTRmWkVacVZQUU5VckM3eks0OHdHK1ZRa3hIeGlmZkJ6?=
 =?utf-8?B?dzNFWFhFNjJGNHl5ekx3SVlGRTlldUZPdWR1ZDlhOWNyQ25Rd1NvR2JJd3Ri?=
 =?utf-8?B?b0xHaGxwU2lyc3FpTUJBWnZHZWFvaVBxVllmNGYrRjNqelJneHVtQlo1d0RT?=
 =?utf-8?B?S2VzVGhWcG5zM000ekNiZkZmREIva05vOFhHNXFXNXd5cGVsRk1RbWRHcTdw?=
 =?utf-8?B?ejRGRmoxR2Qwa09TZkwwTy82ZW1qclphRmQ3MUp5UjlCek5NVjVBR2wrSjVH?=
 =?utf-8?B?U0puczhuN25EbzhNcjZSTkFOK2FmbFRveW01MklMT2U5QUZoQW5ycGlUcm1i?=
 =?utf-8?B?eTBFYmUvU2RiYjVyY2FBcWZONDFjRzlqVzZGcnhoSmxvckJ4NlZkMTA0ZXov?=
 =?utf-8?B?RFhXZTBOeWFmRmZrWWlYcm9nZGdjbXg1bnpYb2hBWG4yZ294d2t3MDkvRFUv?=
 =?utf-8?B?a3Zhb1FYcW4wQytJL3BRcHdDa2NjWS9sdnB2Y2dianhZNEs5SkM4OUJNbklJ?=
 =?utf-8?B?RGRITEx3TVF0SUhJT0hmendVQlRXT3dGamF4dHRkTCsvMGpYMmIrN1dlempK?=
 =?utf-8?B?MStYd1lMQmxhbXJvV1RzU1pSZndnTEQ1bzVpc0NSZzZrQmZVaEl4TzNkcTNa?=
 =?utf-8?B?azcvMGc4ZEVOeXRyTnU2ckpmU3ZSWStLLytOSlFDM0dLdkFjSmpkeTNCM2pK?=
 =?utf-8?B?MzB5RHR3UW5oSmFDTU9IMkJTdkw4eUhVa1ZrOFlpWUhGdDJYUFc2TGJITmlR?=
 =?utf-8?B?akhlMHR1bnczN2R3V0VZamtWZHBma3BGRmF5TjNKVklneWd6QTBpd0FSMCs3?=
 =?utf-8?B?U1BMMmZHNFArS0V3R3FGTmtiQVpISS9tRGtkM0d0L3JJRVFmZnBaU1B1N0Zo?=
 =?utf-8?B?OXNLOWZSM0lBYWtTNE0rRFlLbUgvemQwbmZmMFVjem5TSkNRclFJd2tBZnNH?=
 =?utf-8?Q?KvzpAvNVdSK4tzIKrdQcSG88O6dLbwblje0PWduvNXVc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ac91ae-0ac4-4f14-c43a-08dd54eec1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 16:17:38.6825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7074
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

SSByZXF1ZXN0IHRoZSBwcmludGsgbWFpbnRhaW5lcnMgZm9yIHRoZWlyIHZpZXdzIG9uIHdoZXRo
ZXIgaWYgdGhleSBhcmUgb2sgd2l0aCB0aGUgc3BhcnNlIGVycm9ycyBpbiB0aGlzIG9yaWdpbmFs
IHBhdGNoLg0KDQo+IE9uIDIwIEZlYiAyMDI1LCBhdCAxMDowOeKAr1BNLCBBZGl0eWEgR2FyZyA8
Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPiB3cm90ZToNCj4gDQo+IO+7v0Zyb206IEhlY3RvciBNYXJ0
aW4gPG1hcmNhbkBtYXJjYW4uc3Q+DQo+IA0KPiAlcDRjYyBpcyBkZXNpZ25lZCBmb3IgRFJNL1Y0
TDIgRk9VUkNDcyB3aXRoIHRoZWlyIHNwZWNpZmljIHF1aXJrcywgYnV0DQo+IGl0J3MgdXNlZnVs
IHRvIGJlIGFibGUgdG8gcHJpbnQgZ2VuZXJpYyA0LWNoYXJhY3RlciBjb2RlcyBmb3JtYXR0ZWQg
YXMNCj4gYW4gaW50ZWdlci4gRXh0ZW5kIGl0IHRvIGFkZCBmb3JtYXQgc3BlY2lmaWVycyBmb3Ig
cHJpbnRpbmcgZ2VuZXJpYw0KPiAzMi1iaXQgRk9VUkNDcyB3aXRoIHZhcmlvdXMgZW5kaWFuIHNl
bWFudGljczoNCj4gDQo+ICVwNGNoICAgSG9zdC1lbmRpYW4NCj4gJXA0Y2wgICAgTGl0dGxlLWVu
ZGlhbg0KPiAlcDRjYiAgICBCaWctZW5kaWFuDQo+ICVwNGNyICAgIFJldmVyc2UtZW5kaWFuDQo+
IA0KPiBUaGUgZW5kaWFubmVzcyBkZXRlcm1pbmVzIGhvdyBieXRlcyBhcmUgaW50ZXJwcmV0ZWQg
YXMgYSB1MzIsIGFuZCB0aGUNCj4gRk9VUkNDIGlzIHRoZW4gYWx3YXlzIHByaW50ZWQgTVNCeXRl
LWZpcnN0ICh0aGlzIGlzIHRoZSBvcHBvc2l0ZSBvZg0KPiBWNEwvRFJNIEZPVVJDQ3MpLiBUaGlz
IGNvdmVycyBtb3N0IHByYWN0aWNhbCBjYXNlcywgZS5nLiAlcDRjciB3b3VsZA0KPiBhbGxvdyBw
cmludGluZyBMU0J5dGUtZmlyc3QgRk9VUkNDcyBzdG9yZWQgaW4gaG9zdCBlbmRpYW4gb3JkZXIN
Cj4gKG90aGVyIHRoYW4gdGhlIGhleCBmb3JtIGJlaW5nIGluIGNoYXJhY3RlciBvcmRlciwgbm90
IHRoZSBpbnRlZ2VyDQo+IHZhbHVlKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlY3RvciBNYXJ0
aW4gPG1hcmNhbkBtYXJjYW4uc3Q+DQo+IFNpZ25lZC1vZmYtYnk6IEFkaXR5YSBHYXJnIDxnYXJn
YWRpdHlhMDhAbGl2ZS5jb20+DQo+IC0tLQ0KPiB2MiAtPiBBZGQgdGhpcyBwYXRjaA0KPiBEb2N1
bWVudGF0aW9uL2NvcmUtYXBpL3ByaW50ay1mb3JtYXRzLnJzdCB8IDMyICsrKysrKysrKysrKysr
KysrKysNCj4gbGliL3Rlc3RfcHJpbnRmLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAzOSAr
KysrKysrKysrKysrKysrKysrLS0tLQ0KPiBsaWIvdnNwcmludGYuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKy0tLS0NCj4gc2NyaXB0cy9jaGVja3Bh
dGNoLnBsICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPiA0IGZpbGVzIGNoYW5nZWQsIDk3
IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vY29yZS1hcGkvcHJpbnRrLWZvcm1hdHMucnN0IGIvRG9jdW1lbnRhdGlvbi9jb3Jl
LWFwaS9wcmludGstZm9ybWF0cy5yc3QNCj4gaW5kZXggZWNjY2MwNDczLi45OTgyODYxZmEgMTAw
NjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vY29yZS1hcGkvcHJpbnRrLWZvcm1hdHMucnN0DQo+
ICsrKyBiL0RvY3VtZW50YXRpb24vY29yZS1hcGkvcHJpbnRrLWZvcm1hdHMucnN0DQo+IEBAIC02
NDgsNiArNjQ4LDM4IEBAIEV4YW1wbGVzOjoNCj4gICAgJXA0Y2MgICAgWTEwICBsaXR0bGUtZW5k
aWFuICgweDIwMzAzMTU5KQ0KPiAgICAlcDRjYyAgICBOVjEyIGJpZy1lbmRpYW4gKDB4YjIzMTU2
NGUpDQo+IA0KPiArR2VuZXJpYyBGb3VyQ0MgY29kZQ0KPiArLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiArDQo+ICs6Og0KPiArICAgICVwNGNbaHJibF0gICAgZ1AwMCAoMHg2NzUwMzAzMCkNCj4gKw0K
PiArUHJpbnQgYSBnZW5lcmljIEZvdXJDQyBjb2RlLCBhcyBib3RoIEFTQ0lJIGNoYXJhY3RlcnMg
YW5kIGl0cyBudW1lcmljYWwNCj4gK3ZhbHVlIGFzIGhleGFkZWNpbWFsLg0KPiArDQo+ICtUaGUg
YWRkaXRpb25hbCBgYGhgYCwgYGByYGAsIGBgYmBgLCBhbmQgYGBsYGAgc3BlY2lmaWVycyBhcmUg
dXNlZCB0byBzcGVjaWZ5DQo+ICtob3N0LCByZXZlcnNlZCwgYmlnIG9yIGxpdHRsZSBlbmRpYW4g
b3JkZXIgZGF0YSByZXNwZWN0aXZlbHkuIEhvc3QgZW5kaWFuDQo+ICtvcmRlciBtZWFucyB0aGUg
ZGF0YSBpcyBpbnRlcnByZXRlZCBhcyBhIDMyLWJpdCBpbnRlZ2VyIGFuZCB0aGUgbW9zdA0KPiAr
c2lnbmlmaWNhbnQgYnl0ZSBpcyBwcmludGVkIGZpcnN0OyB0aGF0IGlzLCB0aGUgY2hhcmFjdGVy
IGNvZGUgYXMgcHJpbnRlZA0KPiArbWF0Y2hlcyB0aGUgYnl0ZSBvcmRlciBzdG9yZWQgaW4gbWVt
b3J5IG9uIGJpZy1lbmRpYW4gc3lzdGVtcywgYW5kIGlzIHJldmVyc2VkDQo+ICtvbiBsaXR0bGUt
ZW5kaWFuIHN5c3RlbXMuDQo+ICsNCj4gK1Bhc3NlZCBieSByZWZlcmVuY2UuDQo+ICsNCj4gK0V4
YW1wbGVzIGZvciBhIGxpdHRsZS1lbmRpYW4gbWFjaGluZSwgZ2l2ZW4gJih1MzIpMHg2NzUwMzAz
MDo6DQo+ICsNCj4gKyAgICAlcDRjaCAgICBnUDAwICgweDY3NTAzMDMwKQ0KPiArICAgICVwNGNy
ICAgIDAwUGcgKDB4MzAzMDUwNjcpDQo+ICsgICAgJXA0Y2IgICAgMDBQZyAoMHgzMDMwNTA2NykN
Cj4gKyAgICAlcDRjbCAgICBnUDAwICgweDY3NTAzMDMwKQ0KPiArDQo+ICtFeGFtcGxlcyBmb3Ig
YSBiaWctZW5kaWFuIG1hY2hpbmUsIGdpdmVuICYodTMyKTB4Njc1MDMwMzA6Og0KPiArDQo+ICsg
ICAgJXA0Y2ggICAgZ1AwMCAoMHg2NzUwMzAzMCkNCj4gKyAgICAlcDRjciAgICAwMFBnICgweDMw
MzA1MDY3KQ0KPiArICAgICVwNGNiICAgIGdQMDAgKDB4Njc1MDMwMzApDQo+ICsgICAgJXA0Y2wg
ICAgMDBQZyAoMHgzMDMwNTA2NykNCj4gKw0KPiBSdXN0DQo+IC0tLS0NCj4gDQo+IGRpZmYgLS1n
aXQgYS9saWIvdGVzdF9wcmludGYuYyBiL2xpYi90ZXN0X3ByaW50Zi5jDQo+IGluZGV4IDU5ZGJl
NGY5YS4uZWU4NjAzMjdlIDEwMDY0NA0KPiAtLS0gYS9saWIvdGVzdF9wcmludGYuYw0KPiArKysg
Yi9saWIvdGVzdF9wcmludGYuYw0KPiBAQCAtNzc2LDIxICs3NzYsNDYgQEAgc3RhdGljIHZvaWQg
X19pbml0IGZ3bm9kZV9wb2ludGVyKHZvaWQpDQo+ICAgIHNvZnR3YXJlX25vZGVfdW5yZWdpc3Rl
cl9ub2RlX2dyb3VwKGdyb3VwKTsNCj4gfQ0KPiANCj4gK3N0cnVjdCBmb3VyY2Nfc3RydWN0IHsN
Cj4gKyAgICB1MzIgY29kZTsNCj4gKyAgICBjb25zdCBjaGFyICpzdHI7DQo+ICt9Ow0KPiArDQo+
ICtzdGF0aWMgdm9pZCBfX2luaXQgZm91cmNjX3BvaW50ZXJfdGVzdChjb25zdCBzdHJ1Y3QgZm91
cmNjX3N0cnVjdCAqZmMsIHNpemVfdCBuLA0KPiArICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBjaGFyICpmbXQpDQo+ICt7DQo+ICsgICAgc2l6ZV90IGk7DQo+ICsNCj4gKyAgICBmb3IgKGkg
PSAwOyBpIDwgbjsgaSsrKQ0KPiArICAgICAgICB0ZXN0KGZjW2ldLnN0ciwgZm10LCAmZmNbaV0u
Y29kZSk7DQo+ICt9DQo+ICsNCj4gc3RhdGljIHZvaWQgX19pbml0IGZvdXJjY19wb2ludGVyKHZv
aWQpDQo+IHsNCj4gLSAgICBzdHJ1Y3Qgew0KPiAtICAgICAgICB1MzIgY29kZTsNCj4gLSAgICAg
ICAgY2hhciAqc3RyOw0KPiAtICAgIH0gY29uc3QgdHJ5W10gPSB7DQo+ICsgICAgc3RydWN0IGZv
dXJjY19zdHJ1Y3QgY29uc3QgdHJ5X2NjW10gPSB7DQo+ICAgICAgICB7IDB4MzIzMTU2NGUsICJO
VjEyIGxpdHRsZS1lbmRpYW4gKDB4MzIzMTU2NGUpIiwgfSwNCj4gICAgICAgIHsgMHhiMjMxNTY0
ZSwgIk5WMTIgYmlnLWVuZGlhbiAoMHhiMjMxNTY0ZSkiLCB9LA0KPiAgICAgICAgeyAweDEwMTEx
MjEzLCAiLi4uLiBsaXR0bGUtZW5kaWFuICgweDEwMTExMjEzKSIsIH0sDQo+ICAgICAgICB7IDB4
MjAzMDMxNTksICJZMTAgIGxpdHRsZS1lbmRpYW4gKDB4MjAzMDMxNTkpIiwgfSwNCj4gICAgfTsN
Cj4gLSAgICB1bnNpZ25lZCBpbnQgaTsNCj4gKyAgICBzdHJ1Y3QgZm91cmNjX3N0cnVjdCBjb25z
dCB0cnlfY2ggPSB7DQo+ICsgICAgICAgIDB4NDE0MjQzNDQsICJBQkNEICgweDQxNDI0MzQ0KSIs
DQo+ICsgICAgfTsNCj4gKyAgICBzdHJ1Y3QgZm91cmNjX3N0cnVjdCBjb25zdCB0cnlfY3IgPSB7
DQo+ICsgICAgICAgIDB4NDE0MjQzNDQsICJEQ0JBICgweDQ0NDM0MjQxKSIsDQo+ICsgICAgfTsN
Cj4gKyAgICBzdHJ1Y3QgZm91cmNjX3N0cnVjdCBjb25zdCB0cnlfY2wgPSB7DQo+ICsgICAgICAg
IGxlMzJfdG9fY3B1KDB4NDE0MjQzNDQpLCAiQUJDRCAoMHg0MTQyNDM0NCkiLA0KPiArICAgIH07
DQo+ICsgICAgc3RydWN0IGZvdXJjY19zdHJ1Y3QgY29uc3QgdHJ5X2NiID0gew0KPiArICAgICAg
ICBiZTMyX3RvX2NwdSgweDQxNDI0MzQ0KSwgIkFCQ0QgKDB4NDE0MjQzNDQpIiwNCj4gKyAgICB9
Ow0KPiANCj4gLSAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRSh0cnkpOyBpKyspDQo+IC0g
ICAgICAgIHRlc3QodHJ5W2ldLnN0ciwgIiVwNGNjIiwgJnRyeVtpXS5jb2RlKTsNCj4gKyAgICBm
b3VyY2NfcG9pbnRlcl90ZXN0KHRyeV9jYywgQVJSQVlfU0laRSh0cnlfY2MpLCAiJXA0Y2MiKTsN
Cj4gKyAgICBmb3VyY2NfcG9pbnRlcl90ZXN0KCZ0cnlfY2gsIDEsICIlcDRjaCIpOw0KPiArICAg
IGZvdXJjY19wb2ludGVyX3Rlc3QoJnRyeV9jciwgMSwgIiVwNGNyIik7DQo+ICsgICAgZm91cmNj
X3BvaW50ZXJfdGVzdCgmdHJ5X2NsLCAxLCAiJXA0Y2wiKTsNCj4gKyAgICBmb3VyY2NfcG9pbnRl
cl90ZXN0KCZ0cnlfY2IsIDEsICIlcDRjYiIpOw0KPiB9DQo+IA0KPiBzdGF0aWMgdm9pZCBfX2lu
aXQNCj4gZGlmZiAtLWdpdCBhL2xpYi92c3ByaW50Zi5jIGIvbGliL3ZzcHJpbnRmLmMNCj4gaW5k
ZXggNTZmZTk2MzE5Li4xMzczM2E0ZGEgMTAwNjQ0DQo+IC0tLSBhL2xpYi92c3ByaW50Zi5jDQo+
ICsrKyBiL2xpYi92c3ByaW50Zi5jDQo+IEBAIC0xNzgxLDI3ICsxNzgxLDUzIEBAIGNoYXIgKmZv
dXJjY19zdHJpbmcoY2hhciAqYnVmLCBjaGFyICplbmQsIGNvbnN0IHUzMiAqZm91cmNjLA0KPiAg
ICBjaGFyIG91dHB1dFtzaXplb2YoIjAxMjMgbGl0dGxlLWVuZGlhbiAoMHgwMTIzNDU2NykiKV07
DQo+ICAgIGNoYXIgKnAgPSBvdXRwdXQ7DQo+ICAgIHVuc2lnbmVkIGludCBpOw0KPiArICAgIGJv
b2wgcGl4ZWxfZm10ID0gZmFsc2U7DQo+ICAgIHUzMiBvcmlnLCB2YWw7DQo+IA0KPiAtICAgIGlm
IChmbXRbMV0gIT0gJ2MnIHx8IGZtdFsyXSAhPSAnYycpDQo+ICsgICAgaWYgKGZtdFsxXSAhPSAn
YycpDQo+ICAgICAgICByZXR1cm4gZXJyb3Jfc3RyaW5nKGJ1ZiwgZW5kLCAiKCVwND8pIiwgc3Bl
Yyk7DQo+IA0KPiAgICBpZiAoY2hlY2tfcG9pbnRlcigmYnVmLCBlbmQsIGZvdXJjYywgc3BlYykp
DQo+ICAgICAgICByZXR1cm4gYnVmOw0KPiANCj4gICAgb3JpZyA9IGdldF91bmFsaWduZWQoZm91
cmNjKTsNCj4gLSAgICB2YWwgPSBvcmlnICYgfkJJVCgzMSk7DQo+ICsgICAgc3dpdGNoIChmbXRb
Ml0pIHsNCj4gKyAgICBjYXNlICdoJzoNCj4gKyAgICAgICAgdmFsID0gb3JpZzsNCj4gKyAgICAg
ICAgYnJlYWs7DQo+ICsgICAgY2FzZSAncic6DQo+ICsgICAgICAgIG9yaWcgPSBzd2FiMzIob3Jp
Zyk7DQo+ICsgICAgICAgIHZhbCA9IG9yaWc7DQo+ICsgICAgICAgIGJyZWFrOw0KPiArICAgIGNh
c2UgJ2wnOg0KPiArICAgICAgICBvcmlnID0gbGUzMl90b19jcHUob3JpZyk7DQo+ICsgICAgICAg
IHZhbCA9IG9yaWc7DQo+ICsgICAgICAgIGJyZWFrOw0KPiArICAgIGNhc2UgJ2InOg0KPiArICAg
ICAgICBvcmlnID0gYmUzMl90b19jcHUob3JpZyk7DQo+ICsgICAgICAgIHZhbCA9IG9yaWc7DQo+
ICsgICAgICAgIGJyZWFrOw0KPiArICAgIGNhc2UgJ2MnOg0KPiArICAgICAgICAvKiBQaXhlbCBm
b3JtYXRzIGFyZSBwcmludGVkIExTQi1maXJzdCAqLw0KPiArICAgICAgICB2YWwgPSBzd2FiMzIo
b3JpZyAmIH5CSVQoMzEpKTsNCj4gKyAgICAgICAgcGl4ZWxfZm10ID0gdHJ1ZTsNCj4gKyAgICAg
ICAgYnJlYWs7DQo+ICsgICAgZGVmYXVsdDoNCj4gKyAgICAgICAgcmV0dXJuIGVycm9yX3N0cmlu
ZyhidWYsIGVuZCwgIiglcDQ/KSIsIHNwZWMpOw0KPiArICAgIH0NCj4gDQo+ICAgIGZvciAoaSA9
IDA7IGkgPCBzaXplb2YodTMyKTsgaSsrKSB7DQo+IC0gICAgICAgIHVuc2lnbmVkIGNoYXIgYyA9
IHZhbCA+PiAoaSAqIDgpOw0KPiArICAgICAgICB1bnNpZ25lZCBjaGFyIGMgPSB2YWwgPj4gKCgz
IC0gaSkgKiA4KTsNCj4gDQo+ICAgICAgICAvKiBQcmludCBub24tY29udHJvbCBBU0NJSSBjaGFy
YWN0ZXJzIGFzLWlzLCBkb3Qgb3RoZXJ3aXNlICovDQo+ICAgICAgICAqcCsrID0gaXNhc2NpaShj
KSAmJiBpc3ByaW50KGMpID8gYyA6ICcuJzsNCj4gICAgfQ0KPiANCj4gLSAgICAqcCsrID0gJyAn
Ow0KPiAtICAgIHN0cmNweShwLCBvcmlnICYgQklUKDMxKSA/ICJiaWctZW5kaWFuIiA6ICJsaXR0
bGUtZW5kaWFuIik7DQo+IC0gICAgcCArPSBzdHJsZW4ocCk7DQo+ICsgICAgaWYgKHBpeGVsX2Zt
dCkgew0KPiArICAgICAgICAqcCsrID0gJyAnOw0KPiArICAgICAgICBzdHJjcHkocCwgb3JpZyAm
IEJJVCgzMSkgPyAiYmlnLWVuZGlhbiIgOiAibGl0dGxlLWVuZGlhbiIpOw0KPiArICAgICAgICBw
ICs9IHN0cmxlbihwKTsNCj4gKyAgICB9DQo+IA0KPiAgICAqcCsrID0gJyAnOw0KPiAgICAqcCsr
ID0gJygnOw0KPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsIGIvc2NyaXB0cy9j
aGVja3BhdGNoLnBsDQo+IGluZGV4IDdiMjhhZDMzMS4uMjE1MTZmNzUzIDEwMDc1NQ0KPiAtLS0g
YS9zY3JpcHRzL2NoZWNrcGF0Y2gucGwNCj4gKysrIGIvc2NyaXB0cy9jaGVja3BhdGNoLnBsDQo+
IEBAIC02OTA0LDcgKzY5MDQsNyBAQCBzdWIgcHJvY2VzcyB7DQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgKCRleHRlbnNpb24gZXEgImYiICYmDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGRl
ZmluZWQgJHF1YWxpZmllciAmJiAkcXVhbGlmaWVyICF+IC9edy8pIHx8DQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgKCRleHRlbnNpb24gZXEgIjQiICYmDQo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgZGVmaW5lZCAkcXVhbGlmaWVyICYmICRxdWFsaWZpZXIgIX4gL15jYy8pKSB7DQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgZGVmaW5lZCAkcXVhbGlmaWVyICYmICRxdWFsaWZpZXIg
IX4gL15jW2NobGJyXS8pKSB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgJGJhZF9zcGVjaWZp
ZXIgPSAkc3BlY2lmaWVyOw0KPiAgICAgICAgICAgICAgICAgICAgICAgIGxhc3Q7DQo+ICAgICAg
ICAgICAgICAgICAgICB9DQo+IC0tDQo+IDIuNDMuMA0KPiANCg==
