Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DB3A41B7C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 11:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588D110E20F;
	Mon, 24 Feb 2025 10:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="ZL4zhsvm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011024.outbound.protection.outlook.com
 [52.103.68.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40DF10E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 10:44:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ibUL1TpjxXUiVJFtlQgp74mAM4tUsdOL+8CZ0Org8Xq2MZc1j1uCt6xBcpzzLbMHnh5NFuC0TxuoIHIwhjRU6LDB3f05rIV4b38JDqitpe+wFI0J5nEEH3PbuVPk4ZkH3ujZd4mwxsrVWMEZXAbx8U2BPZmY9xHkakDmbZIsIIDBcrd2JJ8R7G1ZrQ/ZSuGPvvCN/HomxmU7XHdjbfh0vIIuLRBuWnW1M0Rymadu6GhiNc2NOn/kWuPbPKiGtaM1Y3DoJoX6JJLALTCBBnjg00PEvP9BqNPvJdjNg1LNhI9yceH/wZjvjjxuqZ3qH44v3qY1QX9KUoeYL9Zp/PZkaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHWcO1la+ffhd7Kl/V0Jr1qEuwC6dWYu4yJtuwtoXOU=;
 b=pKLq7w1ZPW1NdgN4RybaCUYLXZgv+2qKPv1G9lBgCgZDMtHJkfTTNlNAPKGarPJeaodJWyS6OerPBL4Va7oYkHd0klzoZ2fIMvLRg+xQTX/GuqKwgFA7QucGhfypGa302kOolDCH3IVcMsIt9ycsKH2gfoWulpSs97OfEDXhVLo7Yc+/Ihqu0oO3o/M7plN5WjUpUHtmR1HUoom5sRbh8y8KO1cQc96DG9okB5ommNtfuORZ2bVxCEi139K2nOSMPc3ptVjrhkq2okkX5vHdex3kXKA6nR1z5VAedaQn5R9MLu+cyrgN0pXUsYW/Sznic74wYc++EKCwgT+E+mspdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHWcO1la+ffhd7Kl/V0Jr1qEuwC6dWYu4yJtuwtoXOU=;
 b=ZL4zhsvm3ZYmaNLN5CmK6CKlWgoLS6wmcTCcx66T8j9GpbF2IlfETj7RInJFVsMI62ms5LpM81gNK3oB1COrvUKJPTIp5KVBNQzDlaqQWQ/M8BW4aDQxZEooNLO46vi0aWYqg9srtCd315/uzv8u6JouFImsVnH2CyewIf/EpAY//I/PUfWZo33OM5W5tO2KekbSp8lWxS6dgqPIua9HOY1vU5tF9/ziBjajvt/+5vecHXXJf6ru0hP12AEoktO7deREm3z+Uttwu1IXSuPZ2ZXdq+Ye/LSCM4G4nwXW4z/qJ8nAZ2RDrbBi9h5p5Z86f4H0+dYg4OMEfzlAihcZJQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB9949.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:151::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 10:43:54 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:43:54 +0000
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
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NTekUAgALDg4CAAAXIWoAAAXgAgAACWAWAAAJegIAAANVG
Date: Mon, 24 Feb 2025 10:43:54 +0000
Message-ID: <PN3PR01MB9597DDF5CD7965128C2075DBB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <6CB20172-906F-4D13-B5E4-100A9CF74F02@live.com>
 <Z7xCr4iPmIkPoWGC@smile.fi.intel.com>
 <PN3PR01MB9597CF2907CBBD6ED43D5E62B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7xIxFT-eB_OTGzm@smile.fi.intel.com>
 <PN3PR01MB9597FA2077E6FD498E8CDDD9B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7xMt2Kp1pFuMar2@smile.fi.intel.com>
In-Reply-To: <Z7xMt2Kp1pFuMar2@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB9949:EE_
x-ms-office365-filtering-correlation-id: 7b38f614-9b0e-4a2d-7410-08dd54c02275
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|19110799003|8060799006|6072599003|7092599003|15080799006|461199028|3412199025|4302099013|440099028|10035399004|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?Ym54MFFKMHA0TGtUYy9ZZWZIaG0wczdjT1FCRHp6bGc5aGpjbG9qdC9hVzJH?=
 =?utf-8?B?TlRLSkJSWFVodStzOCtMZHBwSkovMHlFQVZHQXMray9TMURWd3dVekVibHBt?=
 =?utf-8?B?L0pWZWFRbWY1NHEyVzVjeFFJOE9rU2IxR2pIVkI4QXl0QmxJdi9TaHpDeW4r?=
 =?utf-8?B?L2h4L0hXbTVDUmhoUzNLZm9yYUEvUFRnU1JOSE44THc2NzV5RklFaFNxTXZY?=
 =?utf-8?B?K3M5UFpNQ1dzWFE1Y3prM2JLMkZYY0VxWEJoVm1tQXN6T3lnUHIwL1NGdmN1?=
 =?utf-8?B?eFFDVHNwSGRVS1htNHc1bkpQbFpIM0U0OGhhSkFRUmZCdjd1aHIzbng0R3ds?=
 =?utf-8?B?dUhIN3gzMktuRTd6VnlWbkhFZTd3cHRWSEkwRGxHbHl6WnNGWWdhSWtweHNi?=
 =?utf-8?B?cE9HY2M0SUgxNEs2UGIvd004ckI5Qk1KekFCSm5Hb1ZWSWNRc21INkl5SXZO?=
 =?utf-8?B?dmo3M0RMYUJ4Z1ZrdHZDczQvOEJOaVVHTDlEcit2SzRTam1YdStXSjR6Ujgz?=
 =?utf-8?B?QzNNZWpUUXdwMlhNR25HNDJSalNHdmhVeFpOTEZzaFZRR25kR0QrdkVPN0NV?=
 =?utf-8?B?QURYNmk4eXlyWWJ5ZjVQUktrdmlCaldlMEpudXd1WjRQVDBWblo4WGxHUFlB?=
 =?utf-8?B?a2pXN1FaRU9sQjFoZk85d21PRXJZT25ZckNyUDUwbDlMSVBZMnFLOVVxMW5k?=
 =?utf-8?B?cjhzMzBubTZFdW1mNUdLamFjRFZVZnlPbFYya0NZUGYxZldJZHM1ZWhUQWdq?=
 =?utf-8?B?VW9DbUZNMFhwQmkyMlpRbGxDSEg0Y1QwNnpHcFRGay83QXZoMW9vVUtaNmxN?=
 =?utf-8?B?bjVQNTFIZjhsUFlxL1g1dW93R0V6Rkp3ZEYxcC85cit3K3dPV2hNdEVUc3ZW?=
 =?utf-8?B?Q1JIcUNFVEdiczB3eVJQVXg3akNmVnJHa1ByUERRWnV6Zk9iM3RtamtGT1JZ?=
 =?utf-8?B?djlLd2hyeGRsc1c0SmhLblluYnFJYXgzNldCZzM2cFNYVHZFV1cvNGM2MVlK?=
 =?utf-8?B?dGxaK29ZMnZYTzRpQ2toZ0kyeTRySk9qMXc2dTJzTWdxQXFqcmlCWlhLR0Nj?=
 =?utf-8?B?WVBaUnBkbTFHMUZYb1Z5Yk9saERmK3I2TnZ4V1UzTktEalBENGo2Uk8yUU15?=
 =?utf-8?B?YURDR05Iem5NVnIyTEFsbmdUd2R5YmZBQ2habTQxNnFibzY4ZGYwMkFIVS92?=
 =?utf-8?B?KzBWZEs2d3NVZlFEbUNINXZBUEJBQUZHVDQ2dmlQUFVaMWZ2bkxlak5oZUl3?=
 =?utf-8?B?S1VTbGdwUUhKYlVlcFc2ZnJOVk9XV2dhN3BPZUdlcTFDemFtY1YxbEh3TlpM?=
 =?utf-8?B?SXVocG8vdHNFWjVrclM1eFE4c0Z3OWUrZDg5M1lwazdkeVpzbFVFS1p6UFhX?=
 =?utf-8?B?WFNMUk1SL1ZoRzRocTJ4OXpWL3lyWUVxNGswY2RMci9VcmQwTDEwUXpheDdq?=
 =?utf-8?B?SzhvWEt1T1cvUnZrVzdKMVg4dWNlRVVaSHc4dkI1L1BHa0ZnSUREQUpSOElG?=
 =?utf-8?B?LzF2NmtQRXMxRFhBdE5ya3AyMEw0d3J5c0I3L0JnV0FodE51R2k4d3M0SFlq?=
 =?utf-8?B?b2NJaGV6NVdGeWZmeTR2eXcrNzdqYjk0em9NVEFlWUlFU3dPbkU0YStSQUt2?=
 =?utf-8?B?VnJSUEswQzNpSnBWdnlBSHQxM3dQbHZoTHFOZ2pxSGd2aXEwNXpkTi92RFpW?=
 =?utf-8?B?elcvVDN0a0xQNmQ2a3oyZXJ1cmxoWnpGTE9hSU13ajBlai90N2l3K1hBPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGtDK090YWtVd216UEkyeHdkVUpKQjFtQVJWM2psaktRUDFmTmc5UkoxY2xo?=
 =?utf-8?B?a1JKczcxS2RiMlJXbGlzd00yaWpQbnFWQjBGODJuZjk4bEsyRWc2Q3M1Wk9U?=
 =?utf-8?B?TExVUE1PUTlNZGZweFlGTkRRcG5zOE1reUVQazgzOGFram91RC9Mb2R3akF1?=
 =?utf-8?B?RU94WkFvU1FKSC9VWWk4cm9iaVhzdnlHY05FakhqK3JXVUpML2xhcW1PMEhJ?=
 =?utf-8?B?L09obkFWV0JWZG9KWXd6dW03ZG5UaGdhSWVhSktKalpiczFIL0pxejZWdU1l?=
 =?utf-8?B?UDlFTjI3NzBWYTB6RGc1NWVZU1NxS3lVRnZtbS9kajlzSXpDMzhWQXhwQXRE?=
 =?utf-8?B?aFBhUXJHemIvLzA3dGpPeEFncjZTUloyeXBWTStrWXFadWJkall6S05lbTdp?=
 =?utf-8?B?dnhiSVNiMEZ2OUJXdU9LUCtsZzZHTEVsdVd6OUNCaFYxQ2xVYS9HWnZ6YlhY?=
 =?utf-8?B?WXhvSjBCQ2NvUnlNRzhKNFhtM3JnUkVXMVN0SkllK1FqaUFFOTVvQWE3dGo1?=
 =?utf-8?B?ektqRmh1Vkx6Q1lZTE1iWCtvdkdEcHp0L2habGNkR25taVNZejcvTTZoNXUx?=
 =?utf-8?B?RVhlNWEwUGJSb2JFVkxaZk43WHRXVkw4elFUdUEwVHNHREpzbWt6NnZwSnVK?=
 =?utf-8?B?aDNvOC9kbm53MVVxTkpkMC9uYjBieHNDbVZKV2QyL1Q5MEZjZEY5ZEhoTzRt?=
 =?utf-8?B?VEVJS0phc1J2WWk4UVNCT2M1VGR2aHZOcVgxM0lUUEVTNFFZcnVnYk5IU2Mr?=
 =?utf-8?B?UjYyNzdvMXBXT05uMmxKUW9oZjlOZmMyQSt0SEtzMUw1S25uWHF4WjlTcVJQ?=
 =?utf-8?B?UEVHWGJiNGJDQUQ0bm9PbFh1NkUrdGRBbURYVEFKSjlpcXpIWGM0SDcvRFdF?=
 =?utf-8?B?VEt5QmtGOWlMdGRPcG91ZElnTitzcEtHYkZKdzA1QnBGTDF6eENyUEg0U1p2?=
 =?utf-8?B?YmVaUXZzVmhoRGhRQ2d6N2Ivbk40QW5KYnJxK1NVL2RNWDdJOTEzWnZqeGRV?=
 =?utf-8?B?SXllUlpkMGR2VmwrK2orajJ2ZXJ3MXJLZHkzUSs1RGtRSVJ0eis5OWhsN3px?=
 =?utf-8?B?R1hpRkdidEh6K3JMV0pXVVd1WEROTVlMNDZjckdXSW1qUmtXUkIxR3d4VUNI?=
 =?utf-8?B?ZnBMdGt5YnhVZXJ0RDY2ZVQ0Tkh5aDVueE93cWRhTmQ1Tk4rK2c3c0RIMGM3?=
 =?utf-8?B?SnZCaUJxZEpqTnlOaFQwY1hXWnhBaWErRFFKMmg2WS9ZeGMyQUJnQm5MSE5D?=
 =?utf-8?B?Q2FsUzVFQUR5YnRWcW5Ma2MvQ1RrL3ZaZWpaNGlhQVU0VjBObVVld1VCS1ls?=
 =?utf-8?B?eStnMmlpNzRoeEJBVUxzdjBmeXhMZitkSlFrVkVZejFuVWFIc2ZuSTkwUi9y?=
 =?utf-8?B?M21HK3REYkVFT3QzckxEbnFHd2tCNjVkVDZscFVIR0JWVXY0S3NKU0ZFejFP?=
 =?utf-8?B?SkkrRlgyaFNOZG5IbDVTZ0NpNEJRU3YzKzd3WVE1VkthZk9OVDd3QTRkRitt?=
 =?utf-8?B?RFBJK3B1OFc1U3habWFOeFRxNjJRNi9yankzWkRYa0lsYzlrMVJUV2JKdERJ?=
 =?utf-8?B?bzJ2a2NreWtLa3QyZnhDdm0vazJzN1ZmVE5BM2RBd1BtcXRFeUMyci9qNWR4?=
 =?utf-8?Q?nR/Oy2bZJLJhuLZzrIel5xHMuCSrvVjUe7r5s2ewFO/c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b38f614-9b0e-4a2d-7410-08dd54c02275
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 10:43:54.4516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9949
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDQ6MTHigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMTA6
MzI6MjdBTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IE9uIDI0IEZlYiAyMDI1LCBh
dCAzOjU04oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+
PiDvu79PbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAxMDoxODo0OEFNICswMDAwLCBBZGl0eWEgR2Fy
ZyB3cm90ZToNCj4+Pj4+PiBPbiAyNCBGZWIgMjAyNSwgYXQgMzoyOOKAr1BNLCBhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20gd3JvdGU6DQo+Pj4+PiDvu79PbiBTYXQsIEZlYiAyMiwg
MjAyNSBhdCAwMzo0NjowM1BNICswMDAwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+Pj4+Pj4+IE9u
IDIwIEZlYiAyMDI1LCBhdCAxMDowOeKAr1BNLCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxp
dmUuY29tPiB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4+Pj4+Pj4gJXA0Y2MgaXMgZGVzaWduZWQg
Zm9yIERSTS9WNEwyIEZPVVJDQ3Mgd2l0aCB0aGVpciBzcGVjaWZpYyBxdWlya3MsIGJ1dA0KPj4+
Pj4+PiBpdCdzIHVzZWZ1bCB0byBiZSBhYmxlIHRvIHByaW50IGdlbmVyaWMgNC1jaGFyYWN0ZXIg
Y29kZXMgZm9ybWF0dGVkIGFzDQo+Pj4+Pj4+IGFuIGludGVnZXIuIEV4dGVuZCBpdCB0byBhZGQg
Zm9ybWF0IHNwZWNpZmllcnMgZm9yIHByaW50aW5nIGdlbmVyaWMNCj4+Pj4+Pj4gMzItYml0IEZP
VVJDQ3Mgd2l0aCB2YXJpb3VzIGVuZGlhbiBzZW1hbnRpY3M6DQo+Pj4+Pj4+IA0KPj4+Pj4+PiAl
cDRjaCAgIEhvc3QtZW5kaWFuDQo+Pj4+Pj4+ICVwNGNsIExpdHRsZS1lbmRpYW4NCj4+Pj4+Pj4g
JXA0Y2IgQmlnLWVuZGlhbg0KPj4+Pj4+PiAlcDRjciBSZXZlcnNlLWVuZGlhbg0KPj4+Pj4+PiAN
Cj4+Pj4+Pj4gVGhlIGVuZGlhbm5lc3MgZGV0ZXJtaW5lcyBob3cgYnl0ZXMgYXJlIGludGVycHJl
dGVkIGFzIGEgdTMyLCBhbmQgdGhlDQo+Pj4+Pj4+IEZPVVJDQyBpcyB0aGVuIGFsd2F5cyBwcmlu
dGVkIE1TQnl0ZS1maXJzdCAodGhpcyBpcyB0aGUgb3Bwb3NpdGUgb2YNCj4+Pj4+Pj4gVjRML0RS
TSBGT1VSQ0NzKS4gVGhpcyBjb3ZlcnMgbW9zdCBwcmFjdGljYWwgY2FzZXMsIGUuZy4gJXA0Y3Ig
d291bGQNCj4+Pj4+Pj4gYWxsb3cgcHJpbnRpbmcgTFNCeXRlLWZpcnN0IEZPVVJDQ3Mgc3RvcmVk
IGluIGhvc3QgZW5kaWFuIG9yZGVyDQo+Pj4+Pj4+IChvdGhlciB0aGFuIHRoZSBoZXggZm9ybSBi
ZWluZyBpbiBjaGFyYWN0ZXIgb3JkZXIsIG5vdCB0aGUgaW50ZWdlcg0KPj4+Pj4+PiB2YWx1ZSku
DQo+Pj4+PiANCj4+Pj4+IC4uLg0KPj4+Pj4gDQo+Pj4+Pj4gQlRXLCBhZnRlciBsb29raW5nIGF0
IHRoZSBjb21tZW50cyBieSBNYXJ0aW4gWzFdLCBpdHMgYWN0dWFsbHkgYmV0dGVyIHRvIHVzZQ0K
Pj4+Pj4+IGV4aXN0aW5nIHNwZWNpZmllcnMgZm9yIHRoZSBhcHBsZXRiZHJtIGRyaXZlci4gIFRo
ZSBkcml2ZXIgbmVlZHMgdGhlIGhvc3QNCj4+Pj4+PiBlbmRpYW4gYXMgcHJvcG9zZWQgYnkgdGhp
cyBwYXRjaCwgc28gaW5zdGVhZCBvZiB0aGF0LCB3ZSBjYW4gdXNlICUuNHMNCj4+Pj4+IA0KPj4+
Pj4gRG8geW91IG1lYW4gdGhpcyBwYXRjaCB3aWxsIG5vdCBiZSBuZWVkZWQ/IElmIHRoaXMgYSBj
YXNlLCB0aGF0IHdvdWxkIGJlIHRoZQ0KPj4+Pj4gYmVzdCBzb2x1dGlvbi4NCj4+Pj4gDQo+Pj4+
IEkgdGVzdGVkIHdpdGggJTRwRSwgYW5kIHRoZSByZXN1bHRzIGFyZSBkaWZmZXJlbnQgZnJvbSBl
eHBlY3RlZC4gU28gdGhpcw0KPj4+PiB3b3VsZCBiZSBwcmVmZXJyZWQuIEtpbmRseSBzZWUgbXkg
bGF0ZXN0IGVtYWlsIHdpdGggYSBwcm9wb3NlZCB3b3JrYXJvdW5kIGZvcg0KPj4+PiB0aGUgc3Bh
cnNlIHdhcm5pbmdzLg0KPj4+IA0KPj4+ICUuNHMgc291bmRlZCBva2F5LCBidXQgJTRwRSBpcyBh
bHdheXMgYWJvdXQgZXNjYXBpbmcgYW5kIHRoZSByZXN1bHQgbWF5IG9jY3VweQ0KPj4+ICU0eCBt
ZW1vcnkgKG9jdGFsIGVzY2FwaW5nIG9mIG5vbi1wcmludGFibGUgY2hhcmFjdGVycykuIE9mIGNv
dXJzZSwgeW91IG1heSB2YXJ5DQo+Pj4gdGhlIGVzY2FwaW5nIGNsYXNzZXMsIGJ1dCBJSVJDIHRo
ZSBvY3RhbCBvciBoZXggZXNjYXBpbmcgaXMgdW5jb25kaXRpb25hbC4NCj4+IA0KPj4gJS40cyBp
cyB1c2VkIGZvciB1bnNpZ25lZCBpbnQgaWlyYywgaGVyZSBpdCdzIF9fbGUzMi4NCj4gDQo+IE5v
LCBpdCdzIHVzZWQgdG8gJ2NoYXIgKicuIGluIGNhc2Ugb25lIG1heSBndWFyYW50ZWUgdGhhdCBp
dCBhdCBsZWFzdCBpcw0KPiBmb3VyIGNoYXJhY3RlcnMgbG9uZy4NCg0KU3RpbGwgdGhlIGFyZ3Vt
ZW50IGhlcmUgaXMgX19sZTMyLiAlcDRoIGlzIHNob3dpbmcgcmV2ZXJzZSB2YWx1ZXMgdGhhbiB3
aGF0ICU0cEUgYXMgd2VsbCBhcyAlLjRzIHNob3dzLg0KPiANCj4+Pj4+PiBbMV06IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FzYWhpL0U3NTNCMzkxLUQyQ0ItNDIxMy1BRjgyLTY3OEFERDVBNzY0
NEBjdXRlYml0Lm9yZy8NCj4+Pj4+PiANCj4+Pj4+PiBBbHRlcm5hdGl2ZWx5IHdlIGNvdWxkIGFk
ZCBhIGhvc3QgZW5kaWFuIG9ubHkuIE90aGVyIGVuZGlhbnMgYXJlIG5vdCByZWFsbHkNCj4+Pj4+
PiB1c2VkIGJ5IGFueSBkcml2ZXIgQUZBSUsuIFRoZSBob3N0IGVuZGlhbiBpcyBiZWluZyB1c2Vk
IGJ5IGFwcGxldGJkcm0gYW5kDQo+Pj4+Pj4gQXNhaGkgTGludXjigJkgU01DIGRyaXZlciBvbmx5
Lg0KPiANCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiAN
Cj4gDQo=
