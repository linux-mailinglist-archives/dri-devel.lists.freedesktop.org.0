Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126BCA3FFC7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 20:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D75CC10E23F;
	Fri, 21 Feb 2025 19:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="HGpt6CUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011038.outbound.protection.outlook.com
 [52.103.67.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7B510E23F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 19:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7CLOXm1nqMWlcITgk455RevWCbI13bLXdgEhjU/Ry7S5EuAWqZhcNo+2brGtMjc8pNCz2HdyLb2TkhW82McsFfG0x/cmOYGoy4irOCMTwMV2gnNmX6InBwDDwqdKjQSXyyfLm/ah2a+IwupQjALeoDNs6OyVUV2sG7QZ4CYRxSHNpkNPhE9PyWqBqosc/TmWP2aIOAamVQD3x9yhxjkYL4ERWyjLiErnt1SfQlFBAsAM0LiCnxg1NL1DOV/sWqFQZexuzOk9orQP54GU6ZHe9PNLHYX8Suw7gG+nYSfSyCqZ030HOqaCvbvbnerVVqhJr/sVlb8Ton2WiOir2W19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhHb8Ygq385bHqaDHY5hWTKbKF55pMnhlUdMsJpFius=;
 b=CQIaFN2WHyUurczJAQq6grXNGiUKt7aX0B7k+AQHWH4PNoZeUaOn0cy2nr3OUWabI9RYTrEBiXaRtaG2hGGxGIv7vGAhTnld8QJaRwRpQZ18vk1vqj/rhpyccLZwdty5w+4nPP0fCEUwoBdL9VrmsXeqB/xIBqvvV99h/yzAkYOvU027xyIZFZ7YbwzPE7gYfp9nXYjnoDP7KUlkhYVJWARrXfB0wLRdJbRkTJSyut77QG3c1uScHCEmTf0LQzxqlpPNptWm9e03l1aLIzsS3p2TfSAOQywwjs65RQ+Uao+vCao/moDk4dMTG8b55FT23dBvR93z2+OnMErtkFxygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhHb8Ygq385bHqaDHY5hWTKbKF55pMnhlUdMsJpFius=;
 b=HGpt6CUmLdm2XXqApanFcVNR16eX85WPbx/XVACj7DBn0alA5hVCuU2Y1Sa2kHn8DIbWjcNKelIKsvX62xWBqr9Kx9YwDXhEB9pPqgdkyh985qKUFMRWe8eIJWFPBdFA6YBBSBuaWhJshfrbVM+lzL/fHKg98Q9JQj3F0no2WJ0xW+V8ni92tdX9bs78mWjVoJTtEd4B/eRT9HpNqzRSrjuVTp0SCyES1VgmYo+JwfxCXo7jkMDvc7ZlDJ3+ZysPbSczIutZVMEeGrn0enXoQAW7qoX8IZf93A58l0nno0mxE0vDoDuhftzHhMOEBKWMLvxrdDsZPLfJN0USpSBAlw==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MA0PR01MB9356.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 19:35:53 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 19:35:53 +0000
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
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NR4q0AgABFegA=
Date: Fri, 21 Feb 2025 19:35:53 +0000
Message-ID: <9C31901A-2C5C-478B-BB1C-D4705939EE4D@live.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <Z7ibRHb2FS1cTx0O@smile.fi.intel.com>
In-Reply-To: <Z7ibRHb2FS1cTx0O@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MA0PR01MB9356:EE_
x-ms-office365-filtering-correlation-id: 46589f68-487a-4416-6ec3-08dd52aef475
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|7092599003|15080799006|461199028|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?eUhUQTRYS1pad3BmNERxaXBLM1ZpN1k0aS9BWExCRmVvWWxQSXcycGV6bHhz?=
 =?utf-8?B?T0RWSGkwUC9pQUNQbk9mUTBiZlhJMWxPdGRpUWtPaTRjcEtZUFRiS2VqR1JJ?=
 =?utf-8?B?cHFiYi9PdFlTQnU4NkcvMFh2alIrV3lIVklHaWdFdklqVzVmaHZtWCs2dzNQ?=
 =?utf-8?B?Vk80WXhEaThDcTRKZzQ5Ync2eWdZVU1WT1ZLNVI2dGQvNkFUamJ4MXEwMXRx?=
 =?utf-8?B?NFl0b1kvYldHVWNmbTVSb0VSTXFqZVA5R28zSkRlV2EvaEp1SXd2WHFDRk1K?=
 =?utf-8?B?aWNpWEo4Qk9mYnpxODU0YWRxc3krdGZjZTNMbjJFZ2UrUFE4bGVvYTFzWjdM?=
 =?utf-8?B?eTBZakpZSFJ5b0lIcHJrOFZnNDg5cVBYU2FKRFFKYTdNR3NneVhtcDB4MzEy?=
 =?utf-8?B?OUxJVzRoZjNVZFJMY3VveGlaV09NSDJHdjkrR2hObGh4dXFUUm00OHFwN1Y3?=
 =?utf-8?B?eExkUS9vWVQwbFZwZEpZdnBnWlJjSGZSNlJNQ3dMMmt0OGtzd1BrRC96UHp3?=
 =?utf-8?B?amM0TnFnWGYxb3VhbUdHbHRqZkkyNDF4emJjeWhOTkpsUzlsSlRBMlo0TUt4?=
 =?utf-8?B?Y01aWHhwZW1lc1NUamE1aUNORWhFdVZUZUM2S1pSeDFXa1o3TjFZanNPRGY2?=
 =?utf-8?B?YlVBTlV5eThFUzdOSTdkOERrc3orZ2lYVW1HU2NqQzdmc0Q4Sk92akNZWkN2?=
 =?utf-8?B?QVAyYkRwWXptSmhGOUxOZVNWZDZydXVWWE92VWlnTTNJdW1RZi96cjdWeVIw?=
 =?utf-8?B?K24zSzgyOWlRc1FqVTVwcHF2MTFXeUFsUmZrY0RaOUtoNFZkQy8vSThFN2VD?=
 =?utf-8?B?Wi80VFE1SFdNQ3ZFaExjVmN1MlBTVWVGNWNZNlkxSnBlWUJlaDNVNzl6WGJU?=
 =?utf-8?B?bUZsWmc4QytBdDlsdDBkckRHWFNGdmhqdlF1YVVnMXl3azNIWUEyUmZ6NjBE?=
 =?utf-8?B?Y3NjckRBMytkR1VkSytuSmZ6Tk02RXBuVTR1OUI1dWxrZ1g5NURsNzAwZkUy?=
 =?utf-8?B?VitQQWtwaXNpM3kzNk1KMUxVU2dFTXlNdU5GbFRna2VoaDkvTEJSbjk4TDZY?=
 =?utf-8?B?NGFZY0FXT2ZLM2Z2bzdYZXVnaUUyRFVsbGhUWXh3bWE4Q2l4R0M2WUhzNUFk?=
 =?utf-8?B?U3NjMVN4MHBuVTJ4aTA3U3p1dnRWVHlOdXZzd1BRdUsyUWN4UnFVWE5ZekJ0?=
 =?utf-8?B?SjlTMFM2QmJ1MTZwdy9HUENGZ3Z1b1V0bjlOeWRKbGNoVDNacDVLRDJHbzhZ?=
 =?utf-8?B?TVpNMlJyMUZjZDVkSUVIOFdiaWZISkg0ZlljWTRWSWUvQXhZcEFyekFuNllX?=
 =?utf-8?B?L2xnRU5wTDM3TWp0UmJlQ0NVS094eHc0VGJLTFVaNUdUSnNrYUE0YW9Yc1ZD?=
 =?utf-8?B?NTU4VDBmTWxxSEVER0JMZ3hhemRtWUEyTFl3V3lubGF1eUM3MlJBQ1ZnZGdZ?=
 =?utf-8?B?bzc5NlhJTHFKVjFiK09NQ0hmSCtVRlBtcyttckh2eHZhMDA5VTJ5ZHZUeGFl?=
 =?utf-8?Q?F/3HnI=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ck4waHRnK3d3TVBhS1hDVDVEUURDTFZlRCtqL3BTTU12ZktrWFN0VnN3YmRQ?=
 =?utf-8?B?c3VybzBnQjc1WXlnaDJYTjhtd2g4bEgyU3pCa0QvUlVWQ0dlc2xjWk5jNXRr?=
 =?utf-8?B?dTRBU2w1aC96Mi9Hejh0bnQ2WVo4b0EyWjRCVnUyakZiREE5Vy9HZ2cvRUdS?=
 =?utf-8?B?cXhlMWRQRyszbkZBbWdUMk5pZ2o3N0tnYStNSmZDR1FMQ1VsVGo5RGJ2ZExO?=
 =?utf-8?B?OG1LYlAvbWpveTBzZ2sxa1hQN0lHMGxrb09YYWVVSmN0UGx4bWpIMTRrdGhq?=
 =?utf-8?B?NjNCSlNCRXZWQ3lVc2ZGNE5pZUpKcWRKN0tWWUdqVnA2L3NOcmxRbzcySVdO?=
 =?utf-8?B?VUI2NUI3M05oZThMQ0ExN3dzRjcvT0dBZGRVMVhsQ1NrRTNEWWF3cHlzNk1C?=
 =?utf-8?B?QW1Rb1NCT0pXK3laWStWQzk5dmdkZ09NTEV5dHIraGVIRDZ5TlpUOFViQ2I5?=
 =?utf-8?B?OWpISFY5OGlEb3haRUhienZ6QWhBNmJJR1BvTzV6d0VNdFJUSnBIRlltRytM?=
 =?utf-8?B?MmJqVU9OVk4vWUxqWkRKM2F3R3QzTytDVCtoS3Fha3hOenpQbG8zdk5aVmtQ?=
 =?utf-8?B?N3A4aTJxYm5uN0JEejlJTXp1MXFqOFl6dTBRMHZSekF3UnR1NXZua0djc2Vt?=
 =?utf-8?B?ZGliblU5SWVRYmgwQ1hmOHRHaXlGZXhtMjVEVjJyT2VZZTQvUklrRkYzbmd5?=
 =?utf-8?B?YzJnVEx5MytUcC9hL0xQNW82WTBWWEFjT1p5MzJhMm5nMmhyVExQOWJFZUJD?=
 =?utf-8?B?WG80alJzTS94L3VyRTJVQk95b1M3dXZjMEJOQjhlaW9tWHdSQnl3TlVWYnZE?=
 =?utf-8?B?WEVnaEh2RE5BTmRWNmZnNGN3SUFiTUVDYlNHb0N6dHNma0d1eVYycy81SmR5?=
 =?utf-8?B?VEIyUmNseEs1VTRUTm1hRlZSYThBc3E0eDdKaTZwb1Y3ZnRuZFI5YVdnbFNi?=
 =?utf-8?B?UURtTFRvbzZIUEQ2bVRZSzZlODk5d240M2RrdXMxamRVUEk3bU1mZVJQMDJp?=
 =?utf-8?B?Vk5PTG41Tk8yK3Rvby9CSFdsUVZqdWRzT28zL0NaMlp6TEFsOUNsTjNPVFRv?=
 =?utf-8?B?UkdSSkxUNTc2d0lBYkgrb0F4SHV0MnR1ZW1MNDFnRWxIYXZ6bEJlYW1YNkxj?=
 =?utf-8?B?UUpqTTU4U1B6Z0E0TWtpVSthUXJWeGZGS3VhbW4zNjdnYkZtZzVDSGQ5SmRI?=
 =?utf-8?B?Sk9mRXJJcnNxQVMwQU9NaEF3MTRVWGlRa2g4bmd6VDZPdDZqbUlDY3BwSTB1?=
 =?utf-8?B?MGc1QmZtdmxyVDFYeUVRR2FOeFJSUi9OL29lSkFmWDN1ajZMOFlwVmNQOFdF?=
 =?utf-8?B?N1JnNm91S05KYzBaMHdZODFKakZLT2VaMUVkOVkxNE51RTVhTXN3YmtJMUxL?=
 =?utf-8?B?R0lGMVZza0lXNlNKRXVvOEFYamFhSFpRamZiVCtabWgwQ0pwWnFycnVXM0Fv?=
 =?utf-8?B?VEdPWjdBUVluRmluTFNYRWdqeGtsWlR5MHU4TEtPN0ZHRU1vLzFaUjd1Sjhw?=
 =?utf-8?B?UFYzRHZXWTZ6cG5SUWJtNVFuL1hhaytDYzBJcVYwNHZ2L2UwWE9wdlFuOW5Q?=
 =?utf-8?B?bDA2MDJtYTJzZEd4dW5xbityUGpWVHhVZ3oybGxKaVlqaFJoNllWeFcvdVRj?=
 =?utf-8?B?dHFXZ1JLcE9YL2ZoMVd1YVpWSnpKdG1JNkFKeG52cXQzVnhjWWY3NU12Mml1?=
 =?utf-8?B?QUlkMGpYNlBQdHl2WlFnZ1dUenhMUFRRSEg1cFk4RlBNYXpxVVBNL0lhdXo4?=
 =?utf-8?Q?UXu1gUm0GURjCq7TbABMsYKxg0Ihbw6pXxfEUef?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AE3B161A2B73540BFA6CEB60C661B47@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 46589f68-487a-4416-6ec3-08dd52aef475
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 19:35:53.5308 (UTC)
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

DQoNCj4gT24gMjEgRmViIDIwMjUsIGF0IDg6NTfigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4gT24gVGh1LCBGZWIgMjAsIDIwMjUgYXQgMDQ6Mzk6
MjNQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiBGcm9tOiBIZWN0b3IgTWFydGluIDxt
YXJjYW5AbWFyY2FuLnN0Pg0KPj4gDQo+PiAlcDRjYyBpcyBkZXNpZ25lZCBmb3IgRFJNL1Y0TDIg
Rk9VUkNDcyB3aXRoIHRoZWlyIHNwZWNpZmljIHF1aXJrcywgYnV0DQo+PiBpdCdzIHVzZWZ1bCB0
byBiZSBhYmxlIHRvIHByaW50IGdlbmVyaWMgNC1jaGFyYWN0ZXIgY29kZXMgZm9ybWF0dGVkIGFz
DQo+PiBhbiBpbnRlZ2VyLiBFeHRlbmQgaXQgdG8gYWRkIGZvcm1hdCBzcGVjaWZpZXJzIGZvciBw
cmludGluZyBnZW5lcmljDQo+PiAzMi1iaXQgRk9VUkNDcyB3aXRoIHZhcmlvdXMgZW5kaWFuIHNl
bWFudGljczoNCj4+IA0KPj4gJXA0Y2ggICBIb3N0LWVuZGlhbg0KPj4gJXA0Y2wgTGl0dGxlLWVu
ZGlhbg0KPj4gJXA0Y2IgQmlnLWVuZGlhbg0KPj4gJXA0Y3IgUmV2ZXJzZS1lbmRpYW4NCj4+IA0K
Pj4gVGhlIGVuZGlhbm5lc3MgZGV0ZXJtaW5lcyBob3cgYnl0ZXMgYXJlIGludGVycHJldGVkIGFz
IGEgdTMyLCBhbmQgdGhlDQo+PiBGT1VSQ0MgaXMgdGhlbiBhbHdheXMgcHJpbnRlZCBNU0J5dGUt
Zmlyc3QgKHRoaXMgaXMgdGhlIG9wcG9zaXRlIG9mDQo+PiBWNEwvRFJNIEZPVVJDQ3MpLiBUaGlz
IGNvdmVycyBtb3N0IHByYWN0aWNhbCBjYXNlcywgZS5nLiAlcDRjciB3b3VsZA0KPj4gYWxsb3cg
cHJpbnRpbmcgTFNCeXRlLWZpcnN0IEZPVVJDQ3Mgc3RvcmVkIGluIGhvc3QgZW5kaWFuIG9yZGVy
DQo+PiAob3RoZXIgdGhhbiB0aGUgaGV4IGZvcm0gYmVpbmcgaW4gY2hhcmFjdGVyIG9yZGVyLCBu
b3QgdGhlIGludGVnZXINCj4+IHZhbHVlKS4NCj4gDQo+IC4uLg0KPiANCj4+IG9yaWcgPSBnZXRf
dW5hbGlnbmVkKGZvdXJjYyk7DQo+PiAtIHZhbCA9IG9yaWcgJiB+QklUKDMxKTsNCj4+ICsgc3dp
dGNoIChmbXRbMl0pIHsNCj4+ICsgY2FzZSAnaCc6DQo+PiArIHZhbCA9IG9yaWc7DQo+PiArIGJy
ZWFrOw0KPj4gKyBjYXNlICdyJzoNCj4+ICsgb3JpZyA9IHN3YWIzMihvcmlnKTsNCj4+ICsgdmFs
ID0gb3JpZzsNCj4+ICsgYnJlYWs7DQo+PiArIGNhc2UgJ2wnOg0KPiANCj4+ICsgb3JpZyA9IGxl
MzJfdG9fY3B1KG9yaWcpOw0KPj4gKyB2YWwgPSBvcmlnOw0KPj4gKyBicmVhazsNCj4+ICsgY2Fz
ZSAnYic6DQo+PiArIG9yaWcgPSBiZTMyX3RvX2NwdShvcmlnKTsNCj4gDQo+IEkgZG8gbm90IHNl
ZSB0aGF0IG9yaWcgaXMgYSB1bmlvbiBvZiBkaWZmZXJlbnQgdHlwZXMuIEhhdmUgeW91IHJ1biBz
cGFyc2U/DQo+IEl0IHdpbGwgZGVmaW5pdGVseSBjb21wbGFpbiBvbiB0aGlzIGNvZGUuDQoNCkRv
ZXMgdGhpcyBsb29rIGdvb2Qgbm93PyBNYWRlIG9yaWcgYSB1bmlvbi4NCg0KY2hhciAqZm91cmNj
X3N0cmluZyhjaGFyICpidWYsIGNoYXIgKmVuZCwgY29uc3QgdTMyICpmb3VyY2MsIGNvbnN0IGNo
YXIgKmZtdCwgc3RydWN0IHByaW50Zl9zcGVjIHNwZWMpIA0Kew0KY2hhciBvdXRwdXRbc2l6ZW9m
KCIwMTIzIGxpdHRsZS1lbmRpYW4gKDB4MDEyMzQ1NjcpIildOw0KY2hhciAqcCA9IG91dHB1dDsN
CnVuc2lnbmVkIGludCBpOw0KYm9vbCBwaXhlbF9mbXQgPSBmYWxzZTsNCnUzMiB2YWw7DQoNCnVu
aW9uIHsNCnUzMiByYXc7DQpfX2xlMzIgbGU7DQpfX2JlMzIgYmU7DQp9IG9yaWc7DQoNCmlmIChm
bXRbMV0gIT0gJ2MnKQ0KcmV0dXJuIGVycm9yX3N0cmluZyhidWYsIGVuZCwgIiglcDQ/KSIsIHNw
ZWMpOw0KDQppZiAoY2hlY2tfcG9pbnRlcigmYnVmLCBlbmQsIGZvdXJjYywgc3BlYykpDQpyZXR1
cm4gYnVmOw0KDQpvcmlnLnJhdyA9IGdldF91bmFsaWduZWQoZm91cmNjKTsNCg0Kc3dpdGNoIChm
bXRbMl0pIHsNCmNhc2UgJ2gnOg0KdmFsID0gb3JpZy5yYXc7DQpicmVhazsNCmNhc2UgJ3InOg0K
dmFsID0gc3dhYjMyKG9yaWcucmF3KTsNCmJyZWFrOw0KY2FzZSAnbCc6DQp2YWwgPSBsZTMyX3Rv
X2NwdShvcmlnLmxlKTsNCmJyZWFrOw0KY2FzZSAnYic6DQp2YWwgPSBiZTMyX3RvX2NwdShvcmln
LmJlKTsNCmJyZWFrOw0KY2FzZSAnYyc6DQp2YWwgPSBzd2FiMzIob3JpZy5yYXcgJiB+QklUKDMx
KSk7DQpwaXhlbF9mbXQgPSB0cnVlOw0KYnJlYWs7DQpkZWZhdWx0Og0KcmV0dXJuIGVycm9yX3N0
cmluZyhidWYsIGVuZCwgIiglcDQ/KSIsIHNwZWMpOw0KfQ0KDQpmb3IgKGkgPSAwOyBpIDwgc2l6
ZW9mKHUzMik7IGkrKykgew0KdW5zaWduZWQgY2hhciBjID0gdmFsID4+ICgoMyAtIGkpICogOCk7
DQoqcCsrID0gaXNhc2NpaShjKSAmJiBpc3ByaW50KGMpID8gYyA6ICcuJzsNCn0NCg0KaWYgKHBp
eGVsX2ZtdCkgew0KKnArKyA9ICcgJzsNCnN0cmNweShwLCBvcmlnLnJhdyAmIEJJVCgzMSkgPyAi
YmlnLWVuZGlhbiIgOiAibGl0dGxlLWVuZGlhbiIpOw0KcCArPSBzdHJsZW4ocCk7DQp9DQoNCipw
KysgPSAnICc7DQoqcCsrID0gJygnOw0KcCArPSBzcHJpbnRmKHAsICIweCUwOHgiLCBvcmlnLnJh
dyk7DQoqcCsrID0gJyknOw0KKnAgPSAnXDAnOw0KDQpyZXR1cm4gc3RyaW5nX25vY2hlY2soYnVm
LCBlbmQsIG91dHB1dCwgc3BlYyk7DQp9DQoNCg==
