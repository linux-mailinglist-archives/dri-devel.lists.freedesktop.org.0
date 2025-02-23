Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B494A42110
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6E910E402;
	Mon, 24 Feb 2025 13:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="PpGEuzpN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011026.outbound.protection.outlook.com
 [52.103.67.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B3810E00A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 14:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ry3Cbx7yjGtrAc8jfNre97NmwrLGFO8YAK9P00Sfow4w0hS0OW4MXlIqnx7O//rabn2qOj5QGNMo+2Pdy6pn3nSmYVXm2MMaejbFxsflG2kjWwwWHrqufBRjhFZeTJJADNF5Jxh17V2Bpy8Wxc9wNKJJyf8wuAW96dRDZN5DB9yFbYGO4SS+3XQtlJlVUN85qyMxFmEIYwmkImoE1oJrS/Ea4pvBxXsplqPcv8fb5xuWm/OQgcpZH3zQGON/DgwWY2E6+O7xZ5RJQRqC8fJQFe4i4bCewSVNy0JLUDZO75yeWBWfzAtVmSxtw8eLU3QLpUusfj8UEHAwGtVmBuweeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCa/93h9xurjc0rBGSbdnuQcbF0mrWMlzjTpK8dJczg=;
 b=ULHKZ6AshTSN5JwA9oc3TbClFL6WpM66P386zwXYHPrY+c1AbEEEjxrJYrhQUhEQ0JQckrcRflb5Hzk+5LcxZOJgfAIoemBsxUIxRxty+0kJgAUszTLx/5+WLQK/k1WouwvWntlV/JjUYw0STtkAECggmfcvs2Yxa7Uyes3nFJnyu21vF70TPhcG5LQcbAQSOI1lNmc+/c+0+aFUsGS8HBo1NHd1RAL67M2zRItgFxbkMMJwD3nwv9+f8hK2w/2BU1eLIZEX3eftYjq4Ypmph+/G1p4Y5m8enKvLQOnrTUiPDOVoqB0bu4yWTDDaQCUfXYg4OgJZqf6b4wQHPzKOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCa/93h9xurjc0rBGSbdnuQcbF0mrWMlzjTpK8dJczg=;
 b=PpGEuzpNVb3Myliyg63e10RwIv9U4c4xhPO9RLVESogTzA9U9uTMHF9grvRwbaXStdTLj9qcNGp+O+WfbOsFjCYpCx2i5j3Pij6EZIL/BICX6RybvT9mHGtKA/Ca8zek4emgPFfTDYf5ZdnVx32+lrx53IF9kDrusyid+aC6rgDkjPEaMtfBdiIDo4FO0EwMPvM6K3Z6wQMuq+cU00dRAiv0YWx90P/OVBhRQ0y/AM6LAztTzMzVG7QkVtp339dM11X5uX6q8sU1RagGsmdv/0T/pKikIocHU73Y/K1Seb6WBqGkh2kfY/WeBj7toRE+HvugQh7UhHRtSI+euazzLA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MA0PR01MB7924.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Sun, 23 Feb
 2025 14:58:26 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Sun, 23 Feb 2025
 14:58:26 +0000
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
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhFUNsu7CitoQSEyg6//EGVnJDbNR53mAgAA5FACAABkMgIAA0A4AgAA2iQCAAb3fAA==
Date: Sun, 23 Feb 2025 14:58:25 +0000
Message-ID: <99EA7DFC-E157-4589-9D24-623D4B5A37B6@live.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
 <Z7igVXqvRYTVFpXU@smile.fi.intel.com>
 <A373EDB5-528D-4ECF-8CF3-4F96DE6E3797@live.com>
 <Z7jlORk0MiMFTmp6@smile.fi.intel.com>
 <E8256A03-5D13-4B8B-932D-70E734E580FE@live.com>
 <2500F60C-DEB0-49C8-B67B-49351C802646@live.com>
In-Reply-To: <2500F60C-DEB0-49C8-B67B-49351C802646@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MA0PR01MB7924:EE_
x-ms-office365-filtering-correlation-id: 15c570c9-957b-4f94-25fd-08dd541a8682
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|461199028|19110799003|15080799006|7092599003|8060799006|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?RkVjU3QvTWNRQWdjN2Y2QXcxamdqdHJwVzlWU2NTVlo1aU1jVjNDc2I0MUVs?=
 =?utf-8?B?R2RqTVFRVDA1QnhUSmI1ODBWWGNtdVJyQnlFdnlXY2VSMEZmb2I4aTNKTTJF?=
 =?utf-8?B?dG9TZ2doeFJTQ1NlL3hMaUNkNEpCYU5WY1I4c1Y4TTVyVjNyUUxwdGZHd3Fl?=
 =?utf-8?B?RDM0UUdQa2VCTFNIaTZNZW41bzc1QWViU1dsYjlYL3dUOHJXbllvRHcrWU45?=
 =?utf-8?B?c2luTHdPc0ltbW5zSXl1Q0ZGcmZJeE9BelVpcHJFZE5Mc2Z5UUNlR05jZTFE?=
 =?utf-8?B?NFBDblo3am1LV0V6bDNnNGFPYXoxbkJISmc5dnlHYW9qZGxtWXFPWlhxM3JR?=
 =?utf-8?B?NWptMjVENUR2Wk5xeWhOYlZGQjlIRXpOUmttblRSRUFFVUQ3ei94NmtrSkFS?=
 =?utf-8?B?KzFsSDY0cGpabFRqcE5xMFVEOVJscWZRdnJjRzU3bEdmaHh0a1RPSzBYeTVz?=
 =?utf-8?B?RlZMN0d4bUpGRTNuSmkrdTR2UTBsZUZXNzFYaWVWc09qOGdVRXdlY3lRRk1m?=
 =?utf-8?B?ZTlpUXhZUGswOHNlNG40NCtRamlwbVU4YktBYVZsbEZzWWZvdVA1dHBuaDlp?=
 =?utf-8?B?eUhVaXAyVVNwY1hVK2tKUnVseVpCcEhCTmMyaDdyV0pjZ0ZVU2hyMm5rTUVM?=
 =?utf-8?B?azJsc2pNcmdwYVdtOXRXOUd2NWZZc0FzYnVoMlYvTWdneEF5VldDcmVTd2tY?=
 =?utf-8?B?SVhpaHRERnFzSUdFcmg1cEhHY1BhTTBGRUJBMTQyRGNXNXcwVk0wKy9ZSTgx?=
 =?utf-8?B?TnBGUnhyRFdhOXhBMkR1OGRKL2VzM2k2bEdNSzZqWHJiVjFRc0N4QzJYV3lX?=
 =?utf-8?B?MGpmSXpvNXZldUZJbFZxalBUNUIrdDQweDRra3hzUmR1SEFqL0l4Y0RNSmgy?=
 =?utf-8?B?VmhLdlh5c1VXV0FONVk5aU9DNm5wWTlabmJUM2NSV0hFc3dXRW1VenhFV3lC?=
 =?utf-8?B?V1E1dUVlRGxjQXQwSnRtbDVpdmIvVGNIVnJKVllaQVpodWJkai9DZlUzQlBW?=
 =?utf-8?B?L0Z3d2ZFa2pweGg3UUk4UzhYckM0VzdzT0ptZFNhMGtjN04xRkRuT01ybE5y?=
 =?utf-8?B?UnpBa3hZUEkrRFV3N041cGJSNEVBR1Z2b2dVeG5Ddi9MQXpKaG90bzQ2L3lW?=
 =?utf-8?B?NSttSkNSVFFnV0tUTzk1MnYxd0ZrYktWRHVhcXJGK25FTHd4Y2E0cm5yYVJW?=
 =?utf-8?B?VS9UcmsvRzdDbFZvcWQ4SU1vVjNSOTdMT2JmMjNDWnk1K0xvQlZJNVh3YWNk?=
 =?utf-8?B?Y2VkbERpUmdzTDlWN0dlbjNzdTVLeHYza1IxRVdrK0VCMWpqdDJ4NmNpSUVl?=
 =?utf-8?B?QWF0SjE5NXBXelhKQkpVZ2x3Vi9YRGhycmRlZzFOQWVJdFJhb0MrYmN2SXJa?=
 =?utf-8?B?NVJxNStKZDJSbmt6Tmdjc0J1bUoyaVB5cVVLNUVvOTJqWkY2UWxTL0Q2WUc5?=
 =?utf-8?B?d216VFJOZWtDOVhKZy9UTlllV3ErMkdCWjFndFJmQ1RlY0xTQi9HOWlHZnNP?=
 =?utf-8?Q?QsB3oA=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGxqREdhVGcyajJiQTJySEkrR0RDU0t1YzdvNWova3hqOFF0WjZ0U2RSMi9i?=
 =?utf-8?B?dlZhdEgrZkw1bWFWSlpUL29KRFF3N2xyTERoYjgrRjZ3NzM3WGZuNWNGN2lC?=
 =?utf-8?B?TjkwWXczY21MNTlQZGFycGJxbzVMMFRkTU02VkxYOU9seVhEOVdVcGhsLzFy?=
 =?utf-8?B?MjVCandYbWg4YU9CMlNrSzRZYS9tZkdsT1JWbnAyaWZUd1N1MUVnOWgzNURm?=
 =?utf-8?B?cWpONjNUT2Qwd0dlc0JSOUNCUFFoM0IvL0l6VmRTcGJPSjg2NXlQa0NMTHRR?=
 =?utf-8?B?MVBPWi9KYmNmSXVOTG01bEt1T0JSL1U0dzExM0pReHR4dDczMmJGTjRselNZ?=
 =?utf-8?B?elJ3Y1Nldkt0S0lLUE9CL2cvK3lITDNjQVE5NTdiYWZSR1o0M3NWUFlzdmx0?=
 =?utf-8?B?Ri9BNFlLeEpwNGhnZ3dLZms3dWJ5TkpZNTBaQW9uZTF0R3pUemlTOXRuSGtv?=
 =?utf-8?B?OGNOTmlGK0sxT1VESmoxeTVxb25oN0dQNXpYYVZXOUhqak56Znk2U3VNd2hx?=
 =?utf-8?B?ZkhUOEtNT0ZmK0IxYmZGR0ttSzJONGV5UXBhWVFyM2oySGxZOHYrSmFCNGw4?=
 =?utf-8?B?NmpYMHlySmVTc3FtOENId0JUaEJvWWN2cWovWFhXVkQ5TGQrdStSUDZTUFA5?=
 =?utf-8?B?NlFPa0MyNFlaTjBZcTR6M0o2U2Q1SUhOTytNQ05wUzdXeUY4RHd5aFRFeW41?=
 =?utf-8?B?MDlUTUJzTGlqaERCclNZenFkclpUT3p2N0xKTUVuZ0p6dFl5eXBOZEJwMUVT?=
 =?utf-8?B?VHl1ZWhRdHp5bkZ6NGQ0K2htU1hGK0svUDBvamNXWTFHM2ZwQWZXbUY0QUhH?=
 =?utf-8?B?QnVHRHlNNTJVYjVDcXJUR21wQ29YK3RPdkNtTVJsb2ZGYVhIT1paWGZYVlph?=
 =?utf-8?B?MUk2WFRIS2pRcGJvcU9lMWdzblhhZU1ubmRaZmZSUmdacjZnVHpCM2NCRDdH?=
 =?utf-8?B?aXNla1ZzdCt0eVNndG5tSnBvejhkSVhvWlQxSXhVZFlrdW1DR2UwRE84T3pV?=
 =?utf-8?B?QkwyR3p3TVZ4RWV0bkkveHpTM2JqeG50STJDTFFubkE1Uld5Z1lSM0d4WEZK?=
 =?utf-8?B?bno4d2taVnNUTDUyaU9Xb3RnaW93aGUrS29FaE54RG9CRmd4RExHTVBieGhO?=
 =?utf-8?B?QkR1UWJXQUxtUzUxWXc2UC9DQUZpUnNrV0FuYVFvSmxLQlY4aTRUN3p5ZENH?=
 =?utf-8?B?NjVvOVpZT2U3QkpqSk9YZlJ4SVVoWHJXTmMxVUVrVFBTWnhzaWJ5ZE4vS0xM?=
 =?utf-8?B?YzY4eGJhM1JvVVFSRm11ME9GZzVvcktEaHlYa01QQWI0SGlLaEdpT01kakVj?=
 =?utf-8?B?UTFleDJ0YklpWHF1TmxpSU1XSGpGZG5pTHFTZ0cvM01uaTdyZkZ4aTBKQTdW?=
 =?utf-8?B?MEZRYWZIRmViUXYxZnBydmZtQmFiNWNHMURpcS9GaEpkcmpXd1llRmNjZGlS?=
 =?utf-8?B?WHVMN3kvNGFqbDJKM25PTDBRVjNYcWRtNVJ4OWUrcmwrZzBEV0pUbzFqYUFr?=
 =?utf-8?B?c3B6WW9FdWlyclg1U05tcDFQV08xL3M2MmZJZ2I3NnlFdnAycUFtNjZ2SlM3?=
 =?utf-8?B?RTNSRkYvdkNvUHZlVkIyMndSdzRFcWh4MERDTFBYZEJBU09mVlhzWHpkVEcz?=
 =?utf-8?B?Yk1sZ3VxVmgrSy9CNXBVOUlMa3doZnhXd2FGTTBPTGU5aDkvKzdwK1F0Sy9L?=
 =?utf-8?B?NWE1US9kQjdsT2FzT0VCSEhMS3cxM3NoUG4rWklGc2NYbk50Z0xNZm5mNkxC?=
 =?utf-8?Q?EW0YM8rdhYU3yn7LLfbTEmtMwNXSL7wyUiBprmE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F57940E28981E6489689EAC144A4A23A@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c570c9-957b-4f94-25fd-08dd541a8682
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2025 14:58:25.8456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7924
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

DQoNCj4gT24gMjIgRmViIDIwMjUsIGF0IDU6NTLigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAyMiBGZWIgMjAyNSwgYXQg
MjozN+KAr1BNLCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPiB3cm90ZToNCj4+
IA0KPj4+IA0KPj4+IFdoYXQgcGFkZGluZywgcGxlYXNlPyBXaHkgVENQIFVBUEkgaGVhZGVycyBk
byBub3QgaGF2ZSB0aGVzZSBhdHRyaWJ1dGVzPw0KPj4+IFRoaW5rIGFib3V0IGl0LCBhbmQgdGhp
bmsgYWJvdXQgd2hhdCBhY3R1YWxseSBfX3BhY2tlZCBkb2VzIGFuZCBob3cgaXQgYWZmZWN0cw0K
Pj4+IChiYWRseSkgdGhlIGNvZGUgZ2VuZXJhdGlvbi4gT3RoZXJ3aXNlIGl0IGxvb2tzIGxpa2Ug
YSBjYXJnbyBjdWx0Lg0KPj4+IA0KPj4+PiBJIHRyaWVkIHJlbW92aW5nIF9fcGFja2VkIGJ0dyBh
bmQgZHJpdmVyIG5vIGxvbmdlciB3b3Jrcy4NCj4+PiANCj4+PiBTbywgeW91IG5lZWQgdG8gZmlu
ZCBhIGp1c3RpZmljYXRpb24gd2h5LiBCdXQgZGVmaW5pdGVseSBub3QgZHVlIHRvIHBhZGRpbmcg
aW4NCj4+PiBtYW55IG9mIHRoZW0uIFRoZXkgY2FuIGdvIHdpdGhvdXQgX19wYWNrZWQgYXMgdGhl
eSBhcmUgbmF0dXJhbGx5IGFsaWduZWQuDQo+PiANCj4+IEFscmlnaHQsIEkgZGlkIHNvbWUgZGVi
dWdnaW5nLCBiYXNpY2FsbHkgcHJpbnRrIHNpemVvZihzdHJ1Y3QpLiBEaWQgaXQgZm9yIGJvdGgg
cGFja2VkIGFuZCB1bnBhY2tlZCB3aXRoIHRoZSBmb2xsb3dpbmcgcmVzdWx0czoNCj4+IA0KPj4g
RmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2VybmVsOiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJt
X21zZ19yZXF1ZXN0X2hlYWRlciBpcyAxNg0KPj4gRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2Vy
bmVsOiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX21zZ19yZXF1ZXN0X2hlYWRlcl91bnBhY2tl
ZCBpcyAxNg0KPj4gDQo+PiBGZWIgMjIgMTM6MDI6MDMgTWFjQm9vayBrZXJuZWw6IHNpemUgb2Yg
c3RydWN0IGFwcGxldGJkcm1fbXNnX3Jlc3BvbnNlX2hlYWRlciBpcyAyMA0KPj4gRmViIDIyIDEz
OjAyOjAzIE1hY0Jvb2sga2VybmVsOiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX21zZ19yZXNw
b25zZV9oZWFkZXJfdW5wYWNrZWQgaXMgMjANCj4+IA0KPj4gRmViIDIyIDEzOjAyOjAzIE1hY0Jv
b2sga2VybmVsOiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX21zZ19zaW1wbGVfcmVxdWVzdCBp
cyAzMg0KPj4gRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2VybmVsOiBzaXplIG9mIHN0cnVjdCBh
cHBsZXRiZHJtX21zZ19zaW1wbGVfcmVxdWVzdF91bnBhY2tlZCBpcyAzMg0KPj4gDQo+PiBGZWIg
MjIgMTM6MDI6MDMgTWFjQm9vayBrZXJuZWw6IHNpemUgb2Ygc3RydWN0IGFwcGxldGJkcm1fbXNn
X2luZm9ybWF0aW9uIGlzIDY1DQo+PiBGZWIgMjIgMTM6MDI6MDMgTWFjQm9vayBrZXJuZWw6IHNp
emUgb2Ygc3RydWN0IGFwcGxldGJkcm1fbXNnX2luZm9ybWF0aW9uX3VucGFja2VkIGlzIDY4DQo+
PiANCj4+IEZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBw
bGV0YmRybV9mcmFtZSBpcyAxMg0KPj4gRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2VybmVsOiBz
aXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX2ZyYW1lX3VucGFja2VkIGlzIDEyDQo+PiANCj4+IEZl
YiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9m
Yl9yZXF1ZXN0X2Zvb3RlciBpcyA4MA0KPj4gRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2VybmVs
OiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX2ZiX3JlcXVlc3RfZm9vdGVyX3VucGFja2VkIGlz
IDgwDQo+PiANCj4+IEZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1
Y3QgYXBwbGV0YmRybV9mYl9yZXF1ZXN0IGlzIDQ4DQo+PiBGZWIgMjIgMTM6MDI6MDMgTWFjQm9v
ayBrZXJuZWw6IHNpemUgb2Ygc3RydWN0IGFwcGxldGJkcm1fZmJfcmVxdWVzdF91bnBhY2tlZCBp
cyA0OA0KPj4gDQo+PiBGZWIgMjIgMTM6MDI6MDMgTWFjQm9vayBrZXJuZWw6IHNpemUgb2Ygc3Ry
dWN0IGFwcGxldGJkcm1fZmJfcmVxdWVzdF9yZXNwb25zZSBpcyA0MA0KPj4gRmViIDIyIDEzOjAy
OjA0IE1hY0Jvb2sga2VybmVsOiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX2ZiX3JlcXVlc3Rf
cmVzcG9uc2VfdW5wYWNrZWQgaXMgNDANCj4+IA0KPj4gU28sIHRoZSBkaWZmZXJlbmNlIGluIHNp
emVvZiBpbiB1bnBhY2tlZCBhbmQgcGFja2VkIGlzIG9ubHkgaW4gYXBwbGV0YmRybV9tc2dfaW5m
b3JtYXRpb24uIFNvLCBJIGtlcHQgdGhpcyBwYWNrZWQsIGFuZCByZW1vdmVkIGl0IGZyb20gb3Ro
ZXJzLiBUaGUgVG91Y2ggQmFyIHN0aWxsIHdvcmtzLg0KPj4gDQo+PiBTbyBtYXliZSBrZWVwIGp1
c3QgdGhpcyBwYWNrZWQ/DQo+IA0KPiBBbmQgZm9yIGp1c3RpZmljYXRpb24gd2h5IGRyaXZlciB3
YXMgbm90IHdvcmtpbmcsIHdpdGggYXBwbGV0YmRybV9tc2dfaW5mb3JtYXRpb24gbm90IHBhY2tl
ZCBpcyBiZWNhdXNlIHNpemVvZihzdHJ1Y3QgYXBwbGV0YmRybV9tc2dfaW5mb3JtYXRpb24pIGlz
IGJlaW5nIHVzZWQgaW4ga3phbGxvYyBpbiB0aGUgZHJpdmVyLiBTaW1pbGFyIGlzIHRoZSBjYXNl
IGZvciBtb3N0IG90aGVyIF9fcGFja2VkIHN0cnVjdHMuDQoNCkkgdHJpZWQgdG8gZGVidWcgYSBi
aXQgbW9yZSBhbmQgaXRzIG5vdCByZWFsbHkgdGhlIGt6YWxsb2MgbG9naWMsIHJhdGhlciBpdHMg
dGhlIFVTQiBiaXQgdGhhdOKAmXMgY2F1c2luZyB0aGUgaXNzdWU6DQoNCkNvZGU6DQoNCnN0YXRp
YyBpbnQgYXBwbGV0YmRybV9yZWFkX3Jlc3BvbnNlKHN0cnVjdCBhcHBsZXRiZHJtX2RldmljZSAq
YWRldiwNCgkJCQkgICAgc3RydWN0IGFwcGxldGJkcm1fbXNnX3Jlc3BvbnNlX2hlYWRlciAqcmVz
cG9uc2UsDQoJCQkJICAgIHNpemVfdCBzaXplLCBfX2xlMzIgZXhwZWN0ZWRfcmVzcG9uc2UpDQp7
DQoJc3RydWN0IHVzYl9kZXZpY2UgKnVkZXYgPSBhZGV2X3RvX3VkZXYoYWRldik7DQoJc3RydWN0
IGRybV9kZXZpY2UgKmRybSA9ICZhZGV2LT5kcm07DQoJaW50IHJldCwgYWN0dWFsX3NpemU7DQoJ
Ym9vbCByZWFkaW5lc3Nfc2lnbmFsX3JlY2VpdmVkID0gZmFsc2U7DQoNCnJldHJ5Og0KCXJldCA9
IHVzYl9idWxrX21zZyh1ZGV2LCB1c2JfcmN2YnVsa3BpcGUodWRldiwgYWRldi0+aW5fZXApLA0K
CQkJICAgcmVzcG9uc2UsIHNpemUsICZhY3R1YWxfc2l6ZSwgQVBQTEVUQkRSTV9CVUxLX01TR19U
SU1FT1VUKTsNCglpZiAocmV0KSB7DQoJCWRybV9lcnIoZHJtLCAiRmFpbGVkIHRvIHJlYWQgcmVz
cG9uc2UgKCVkKVxuIiwgcmV0KTsNCgkJcmV0dXJuIHJldDsNCgl9DQoNCgkvKg0KCSAqIFRoZSBk
ZXZpY2UgcmVzcG9uZHMgdG8gdGhlIGZpcnN0IHJlcXVlc3Qgc2VudCBpbiBhIHBhcnRpY3VsYXIN
CgkgKiB0aW1lZnJhbWUgYWZ0ZXIgdGhlIFVTQiBkZXZpY2UgY29uZmlndXJhdGlvbiBpcyBzZXQg
d2l0aCBhIHJlYWRpbmVzcw0KCSAqIHNpZ25hbCwgaW4gd2hpY2ggY2FzZSB0aGUgcmVzcG9uc2Ug
c2hvdWxkIGJlIHJlYWQgYWdhaW4NCgkgKi8NCglpZiAocmVzcG9uc2UtPm1zZyA9PSBBUFBMRVRC
RFJNX01TR19TSUdOQUxfUkVBRElORVNTKSB7DQoJCWlmICghcmVhZGluZXNzX3NpZ25hbF9yZWNl
aXZlZCkgew0KCQkJcmVhZGluZXNzX3NpZ25hbF9yZWNlaXZlZCA9IHRydWU7DQoJCQlnb3RvIHJl
dHJ5Ow0KCQl9DQoNCgkJZHJtX2Vycihkcm0sICJFbmNvdW50ZXJlZCB1bmV4cGVjdGVkIHJlYWRp
bmVzcyBzaWduYWxcbiIpOw0KCQlyZXR1cm4gLUVJTzsNCgl9DQoNCglpZiAoYWN0dWFsX3NpemUg
IT0gc2l6ZSkgew0KCQlkcm1fZXJyKGRybSwgIkFjdHVhbCBzaXplICglZCkgZG9lc24ndCBtYXRj
aCBleHBlY3RlZCBzaXplICglbHUpXG4iLA0KCQkJYWN0dWFsX3NpemUsIHNpemUpOw0KCQlyZXR1
cm4gLUVJTzsNCgl9DQoNCglpZiAocmVzcG9uc2UtPm1zZyAhPSBleHBlY3RlZF9yZXNwb25zZSkg
ew0KCQlkcm1fZXJyKGRybSwgIlVuZXhwZWN0ZWQgcmVzcG9uc2UgZnJvbSBkZXZpY2UgKGV4cGVj
dGVkICVwNGNoIGZvdW5kICVwNGNoKVxuIiwNCgkJCSZleHBlY3RlZF9yZXNwb25zZSwgJnJlc3Bv
bnNlLT5tc2cpOw0KCQlyZXR1cm4gLUVJTzsNCgl9DQoNCglyZXR1cm4gMDsNCn0NCg0KRXJyb3I6
DQoNCkZlYiAyMyAyMDowMDoyOSBNYWNCb29rIGtlcm5lbDogYXBwbGV0YmRybSA3LTY6Mi4xOiBb
ZHJtXSAqRVJST1IqIEFjdHVhbCBzaXplICg2NSkgZG9lc24ndCBtYXRjaCBleHBlY3RlZCBzaXpl
ICg2OCkNCg0KU28gSU1PLCB3ZSBzdGlsbCBuZWVkIHRoaXMgc3RydWN0IHRvIHJlbWFpbiBwYWNr
ZWQuDQoNCj4gDQo+IE1heWJlIHRoZSBhdXRob3Igd2FudGVkIHRvIGtlZXAgdGhpcyB2YWx1ZSBj
b25zaXN0ZW50IGFjcm9zcyB2YXJpb3VzIGNvbXBpbGVyIG9wdGlvbnM/IEkgZG9u4oCZdCB0aGlu
ayBDUFUgYXJjaGl0ZWN0dXJlIHJlYWxseSBtYXR0ZXJzIGhlcmUgdGhvdWdoIHNpbmNlIHRoaXMg
ZHJpdmVyIGlzIGV4Y2x1c2l2ZWx5IGZvciB4ODZfNjQgSW50ZWwgTWFjcy4NCg0KDQo=
