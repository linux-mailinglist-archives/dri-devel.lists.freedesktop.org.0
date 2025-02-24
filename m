Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38FBA41AA4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 11:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EB010E1EE;
	Mon, 24 Feb 2025 10:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="KU6IiZrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011027.outbound.protection.outlook.com
 [52.103.68.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE4C10E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 10:19:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vl2YaEI9stO4iqQ0C1E2eniwX0QMPB+Y3W1nGvWEyoV83dFgKWQPk4TDyi1M0xL8cZantxWN09RN4qjMIA2iyUL+2WactwyGbu+O4kgGlwkts0sjn4XxGrM8aRBOrQiYe9wBRidli51S6FIVyl161nRXRbNhaW59RvuQru6ProRPboPxZgew0ER1EwQDppLe2RBIrti64WTz8+1YZ8FUox6UU5OYk9sxi9nETI55uz59vjPZAd3e2+wB3NxA0ZsO8E2HX7irTRuknSyPHApfy9iv6hbkSV/wDSEU0tdHyWstFmG5UcUKKgE42G/JNQx8eSw1SBDitAyiRoWhPffoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjPViEA/IeVQHsGJpTFnny8x+tuqBIf65SJpMtvvBps=;
 b=a+9kAqKLY5wpHX+Kltnzatx7gVFKXKwFmLMzGiaueXsOYueXqRmih1maqV8/Rg4g2PlA5+tdi+LCnHSJ+EcKvhYScq8kVmrqkORkgy6XHy7qZqRFVa84kLl9i1bxOeR6+yNm0zRrWNle4EoLFNjk4p1ud9obYiMiLUzQ5J4xQF3AagIl7S7SGNpy7a0zGKvqC1TUkq9/M+wgCN2liN4OaGumsiG59c5tbBD7kgvC7jycbeYD7H3L5QLFMAdQnPkC3EU5IraTY9q3uxqhnF6j07Gpr1ZxW724oyEOXyAgTjK7GDhIF4R4VkBiazRVfheETHr9dxU+4cvJGIWgbCdUfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjPViEA/IeVQHsGJpTFnny8x+tuqBIf65SJpMtvvBps=;
 b=KU6IiZrOvtVJYFKnecEuGazb45KBYdFFa0xP3Ttm1tVrcGgqyDk0aAi7JXV6ZFo01b07BlLvGgaEWuDpv6QvsKatzjiskOPVC7FOKBRaQzJbNcwMYSeZV+YpKXLBtni9RZkIdazfky/GLmoqCiBgFhd9pRUBBK7owOIl2mW5IRmTRxG5jRiA9TV57Flr0n7WXXkSwCBET2JqeirpdHn55T5sFFt6OIAiXssRtApqGIxW4KMg8Uyo8+R1qcjqqmW0XsoIUvEP2cXRqZJTLr0KFiQXEiIKUHudX09MXQkJnzLy4GDmUkOB4lFjQFwn+iF4wS/gIPQ82MtVZ3FbVWliTg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB7697.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 10:18:49 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:18:48 +0000
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
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NTekUAgALDg4CAAAXIWg==
Date: Mon, 24 Feb 2025 10:18:48 +0000
Message-ID: <PN3PR01MB9597CF2907CBBD6ED43D5E62B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <6CB20172-906F-4D13-B5E4-100A9CF74F02@live.com>
 <Z7xCr4iPmIkPoWGC@smile.fi.intel.com>
In-Reply-To: <Z7xCr4iPmIkPoWGC@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB7697:EE_
x-ms-office365-filtering-correlation-id: 462b6411-1767-4005-4453-08dd54bca113
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|15080799006|7092599003|6072599003|461199028|440099028|4302099013|3412199025|10035399004|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?TU5HcFpYMmg5VXkrOEV4NHJFVG9NbHF3MU00TXUzTXk3dUN5U0RxRy94T29H?=
 =?utf-8?B?Tm1QczNoQWY5RVFaR2I0dmlWSTdBRHV3UmxMQjJiOFBQUjlkbGZqUXJZSzd3?=
 =?utf-8?B?K3VQOG9ZUWpWTldLUkFJeWpKZzdrWmpWT0VCMjlIbzRMdGE5MWl6SzlXM0JU?=
 =?utf-8?B?Zlh3WFRlc1o5YUxEd2lwZlJrbm1DOUQ1WGFLMHYyRUhpQTkwQmVHdll4ZHZp?=
 =?utf-8?B?TWgwRDZyMmo2T3h0dmozcnZzRjIxQUwrUFZ2M2tseUtwc1M2c0lzdndSMERR?=
 =?utf-8?B?UFg2S3hwZkcwT0lRNXhpSnhEN1lTR1pXWnFPSHA5T2hrbTZReWZ0NUh1aDB5?=
 =?utf-8?B?QmZpVXp0MVZkb1Vjc25jWG1kYkliN3JVSjR3MlNrR3pHNTgwbTFmc0VHTll1?=
 =?utf-8?B?Ui9naVh1YWxxaFNkNmE2WGdkN1dkckhVdkRibHFRazRPbnFoVnhRQzlxd1J3?=
 =?utf-8?B?UzRLQmpqaGUvdjdKMWI1eWpyaGI2WThRdmVtdnFDbGVHZ1BUQmV4Ymw2a3Vu?=
 =?utf-8?B?M0xUZCtBeHR5N2NpVEt6RU12aWh1Z2JlZUt1YndST3VhM0JYVTZqb1ZYLzQ4?=
 =?utf-8?B?L0JycDJ1dHovRGxIamJ1R2ZhUzhmTnl0cGpmR1ZkTnVYTXhzQzNLbG1xZjho?=
 =?utf-8?B?WWQzTVRVZll3OU5NTGFoUkRLTjg0ZVNJUXIvUUhBWm5HRnpjM2tYWFZUSktz?=
 =?utf-8?B?NXcyYmo5Vlg1VnJCM2c0KzczQVlmbXU0QkYvUWpCNDF6ZUsrYW41YWRzNlkx?=
 =?utf-8?B?Mnh3bW9oN1pvNkQ5ZldORFZ2aXY3K1BXdkFJT2l4aGppdTlXTlA2MENsbTlV?=
 =?utf-8?B?OEN6VGR1V0o3b1BaVEdUN0hnM1JFc3lPN1FtY2lBYnNZRFRpWTQ4TGpSVDJX?=
 =?utf-8?B?YzBqejVMZlVyekxyNFVrT3FjZlVPYlJpOUYySkFpUWJmU294RHNrZHlNRWZT?=
 =?utf-8?B?YmVya1kzU1JtNEM4YWN0bmpYVUhuYVdXbVkwYU95d2h0RkVoTjBPRnBjazlJ?=
 =?utf-8?B?d3BTUmRHUERtVU1BYkxtMFZ6Qkw4ZW5Va201YVdYUkJnOWcyeWVqSUNEOVVp?=
 =?utf-8?B?TkRhSXdiVThiTzZhNCtnZi92Z1hUb1JFS0Q5U1VTbzZ3dGhpaTJoV2pFL2l0?=
 =?utf-8?B?b3RFbVhGUEd4dWZRU1RFTDUramZMdEpJNGQvVTExTDNnc084VzZPY1oyeUtZ?=
 =?utf-8?B?OUZ4eVFSYVhRYVVOMmlud1ZXY201RFdmbm1DcWVMVmo5dm1VdlBpY2dabWV4?=
 =?utf-8?B?UjRBRmdIQ0loQmpFQm11aW1FRytjM1FubUZFcDFCdkZnQU1hdURhbkFmcHEw?=
 =?utf-8?B?REhGRnBqS3ZRWWdGUWNycTZtUnJlOXdNWnkyL3UvRjIyQSsrTVBTUWsvblpC?=
 =?utf-8?B?d2hHODYyUHg2MGdmakViTUQ0TlBNZm5iTlo5ZCsxVGpmN08xK0Y1NDZmeE9z?=
 =?utf-8?B?QnZkWjFub0h4K3RUZ0FBbnZQV2lTbUdQZFhSTzBZOTVkU2xzQnBlbEMzLzdk?=
 =?utf-8?B?WW9BYzZyNzJiZGMzUkhUQm1uZHJOMUk1UTlYVkowa25ueUFCYWYxbmJuRktp?=
 =?utf-8?B?WVJFc1VmNHd5eng1cXhsbVZtY1BvR3A5RHAySGo0QWlYUGJGNkt2OUVyQmlj?=
 =?utf-8?B?bEZGZVBCRWV2aDlmWmdVVEFMZmV4YldNRGF3WERLOVgwNVpxVitlYmFSMGpU?=
 =?utf-8?B?a1hKQlI3aWhFaC9UcWJRdXBhaFpsOTBwMXc2NWhLa1dLcy9hN2h2R0tnPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDdQejQ5RjhidG84ejhaemtSeFJPWXpkMjhyVkdPYnlpS3RKNDNJeXBTc0lG?=
 =?utf-8?B?YmM0VGVVR2U3bExGOXBDTEV4UHdEaVhpSm9nR2FyK0dWS1JUMGZLcysrcEVP?=
 =?utf-8?B?OHJUcHcrT0p2cUhhdFpFZkxJdWdTMHNoKzBlemlSZzl4cDRqbURPNGN3Szd0?=
 =?utf-8?B?dXlzdzJRSmZoMGRUMXFCaFlSbFdFMWJMZmlaWmJpZlhEbXFOblo1V1dMNHFY?=
 =?utf-8?B?ZXpMU0FRQVMwUlczMkhyanBEVzYyNG1VdFRpcWNFcitCY3ZQQ0JRUTh6R2lh?=
 =?utf-8?B?QXBCdHlLa2tkWEEzdDhycjFHS1AxUDgxTWtoNnlYRHlQSGMzeW83M2NsVVIx?=
 =?utf-8?B?UTY1TnJ1dTN4SnRoWGViS1lIWlpvanhJUkR3TjBrbHhBdVhIY216U1A0K0F3?=
 =?utf-8?B?bE56VTZXbEhvRGhDN2FEK0lVMGNuQjhzUmxxYXRoS1ZmY0MzeGVNU2J6QkRD?=
 =?utf-8?B?dDlOK2g2Z2tkZ09KalovemFYQk5FSS9vcjNVOTdHUGVQUjRIRTV6d0hjZUQ0?=
 =?utf-8?B?dVR0QlUrVEFUbWlrSlVueUMwTjg1cUJ4K1orOFJvdWEvUTllL3NXVFQ4OTJZ?=
 =?utf-8?B?c2VsQ2c0ck5vZEpYdVVPSHptT0tEV0tCWE8yamtFZ2NXdWRLYitpblBZUGFj?=
 =?utf-8?B?MkRYM1IzRzcxSFpFMW80bUFkQ3FlVnZqYVRVQ3JGRTdSVkRZMGEyM24vc3pI?=
 =?utf-8?B?aWRZK3NKNW9ZWFJBVWtWQ2tPUXRtWkJrNEFFSWIrMkhLZTNWeHg0bUdpTndM?=
 =?utf-8?B?WGhrSFJHU2lkbkJHbk9SVkpidUhmMytmcjQrV05aSkhaSkh5Z0lBNTV6TmpJ?=
 =?utf-8?B?a1UzbmxsYzNZZ0N0di8wYU9VeDNNQ2dPdmFWVmY5dFRNeGpFbEhZNXAyazdD?=
 =?utf-8?B?aFZQY1VodnB5NXM3ajF0Rk5vUm96MWZWWUhJeXFaNy8vb1ZsYStBeENuM1Vs?=
 =?utf-8?B?YnNTL3d0M2FGMlREVE5uN1hOeXVDeXQrTWxEWkpqaTVpV2FrMTNkUTRJUUJr?=
 =?utf-8?B?OEhLOVdaeFFEQmdmdUZQOGplelBRS01Rb0NvRmZsV3JlYWlwNDEzeWVhODJZ?=
 =?utf-8?B?UkpqZC9kZnFCU2x6NFNhRlVTcm85c2RMZjVjUHhqV2NmeTFEMmdVaHloRkFi?=
 =?utf-8?B?dUVwNURVRHducE1ZSlEyZkFUOFQ1K1orREtDVk9lQXpPMHQ1M0F1MkZPSlhz?=
 =?utf-8?B?alZ5alNyTGxwSHRwWFdvbEhkSWYvclN0Y2F1NlB5RUhtMnJYM2FEOEFGWUZh?=
 =?utf-8?B?WUp5Vk0ra1VJUmJRZ2ZHUlNMQ2h0WkdyRVkzQUgzZ0FRVnhiSThWUndYMWU0?=
 =?utf-8?B?bXk1OUFOa2FUWWo5K01GVno5QmVuREpYNEJydU5TY2RQRnlPanBJVFVhOXdE?=
 =?utf-8?B?cFp0WkR1Q080NGU2cm9mbGJ2Z2luT25TdE13Qk8yczlEV28yUXJCb1pGVFpP?=
 =?utf-8?B?TTBCNjJxOW53QmRVTS8zWFdrbXN1YWlOYVk1TDVPTkRyeFcvYVBYbld4QUxP?=
 =?utf-8?B?cjRSaThUWjYyZ2d6dmhqeTlGS04xejY5cnhkdVU4ejRqUTBtYk5mNk9lcThi?=
 =?utf-8?B?RnZtSUtVVTU3SFBibjRVTENrMWNIbndJNnZnaGJ0SVdiWnFuSnFtR2JveUFY?=
 =?utf-8?B?VXMxbkNvOVdhRC82SG9kUTFJZlZqMUFDemgzVWpPWEhUS2srMlJSSlpNbjY4?=
 =?utf-8?B?MG4yK1JCbmd2NFVvL0o4bDEwMWVjelpRaVZnRnQzTjhRRGpZc01hSDVQdjha?=
 =?utf-8?Q?gLvDAhjiKe+pePYe5A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 462b6411-1767-4005-4453-08dd54bca113
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 10:18:48.9408 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7697
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDM6MjjigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gU2F0LCBGZWIgMjIsIDIwMjUgYXQgMDM6
NDY6MDNQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IE9uIDIwIEZlYiAyMDI1LCBh
dCAxMDowOeKAr1BNLCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPiB3cm90ZToN
Cj4+PiANCj4+PiAlcDRjYyBpcyBkZXNpZ25lZCBmb3IgRFJNL1Y0TDIgRk9VUkNDcyB3aXRoIHRo
ZWlyIHNwZWNpZmljIHF1aXJrcywgYnV0DQo+Pj4gaXQncyB1c2VmdWwgdG8gYmUgYWJsZSB0byBw
cmludCBnZW5lcmljIDQtY2hhcmFjdGVyIGNvZGVzIGZvcm1hdHRlZCBhcw0KPj4+IGFuIGludGVn
ZXIuIEV4dGVuZCBpdCB0byBhZGQgZm9ybWF0IHNwZWNpZmllcnMgZm9yIHByaW50aW5nIGdlbmVy
aWMNCj4+PiAzMi1iaXQgRk9VUkNDcyB3aXRoIHZhcmlvdXMgZW5kaWFuIHNlbWFudGljczoNCj4+
PiANCj4+PiAlcDRjaCAgIEhvc3QtZW5kaWFuDQo+Pj4gJXA0Y2wgTGl0dGxlLWVuZGlhbg0KPj4+
ICVwNGNiIEJpZy1lbmRpYW4NCj4+PiAlcDRjciBSZXZlcnNlLWVuZGlhbg0KPj4+IA0KPj4+IFRo
ZSBlbmRpYW5uZXNzIGRldGVybWluZXMgaG93IGJ5dGVzIGFyZSBpbnRlcnByZXRlZCBhcyBhIHUz
MiwgYW5kIHRoZQ0KPj4+IEZPVVJDQyBpcyB0aGVuIGFsd2F5cyBwcmludGVkIE1TQnl0ZS1maXJz
dCAodGhpcyBpcyB0aGUgb3Bwb3NpdGUgb2YNCj4+PiBWNEwvRFJNIEZPVVJDQ3MpLiBUaGlzIGNv
dmVycyBtb3N0IHByYWN0aWNhbCBjYXNlcywgZS5nLiAlcDRjciB3b3VsZA0KPj4+IGFsbG93IHBy
aW50aW5nIExTQnl0ZS1maXJzdCBGT1VSQ0NzIHN0b3JlZCBpbiBob3N0IGVuZGlhbiBvcmRlcg0K
Pj4+IChvdGhlciB0aGFuIHRoZSBoZXggZm9ybSBiZWluZyBpbiBjaGFyYWN0ZXIgb3JkZXIsIG5v
dCB0aGUgaW50ZWdlcg0KPj4+IHZhbHVlKS4NCj4gDQo+IC4uLg0KPiANCj4+IEJUVywgYWZ0ZXIg
bG9va2luZyBhdCB0aGUgY29tbWVudHMgYnkgTWFydGluIFsxXSwgaXRzIGFjdHVhbGx5IGJldHRl
ciB0byB1c2UNCj4+IGV4aXN0aW5nIHNwZWNpZmllcnMgZm9yIHRoZSBhcHBsZXRiZHJtIGRyaXZl
ci4gIFRoZSBkcml2ZXIgbmVlZHMgdGhlIGhvc3QNCj4+IGVuZGlhbiBhcyBwcm9wb3NlZCBieSB0
aGlzIHBhdGNoLCBzbyBpbnN0ZWFkIG9mIHRoYXQsIHdlIGNhbiB1c2UgJS40cw0KPiANCj4gRG8g
eW91IG1lYW4gdGhpcyBwYXRjaCB3aWxsIG5vdCBiZSBuZWVkZWQ/IElmIHRoaXMgYSBjYXNlLCB0
aGF0IHdvdWxkIGJlIHRoZQ0KPiBiZXN0IHNvbHV0aW9uLg0KDQpJIHRlc3RlZCB3aXRoICU0cEUs
IGFuZCB0aGUgcmVzdWx0cyBhcmUgZGlmZmVyZW50IGZyb20gZXhwZWN0ZWQuIFNvIHRoaXMgd291
bGQgYmUgcHJlZmVycmVkLiBLaW5kbHkgc2VlIG15IGxhdGVzdCBlbWFpbCB3aXRoIGEgcHJvcG9z
ZWQgd29ya2Fyb3VuZCBmb3IgdGhlIHNwYXJzZSB3YXJuaW5ncy4NCj4gDQo+PiBbMV06IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FzYWhpL0U3NTNCMzkxLUQyQ0ItNDIxMy1BRjgyLTY3OEFERDVB
NzY0NEBjdXRlYml0Lm9yZy8NCj4+IA0KPj4gQWx0ZXJuYXRpdmVseSB3ZSBjb3VsZCBhZGQgYSBo
b3N0IGVuZGlhbiBvbmx5LiBPdGhlciBlbmRpYW5zIGFyZSBub3QgcmVhbGx5DQo+PiB1c2VkIGJ5
IGFueSBkcml2ZXIgQUZBSUsuIFRoZSBob3N0IGVuZGlhbiBpcyBiZWluZyB1c2VkIGJ5IGFwcGxl
dGJkcm0gYW5kDQo+PiBBc2FoaSBMaW51eOKAmSBTTUMgZHJpdmVyIG9ubHkuDQo+IA0KPiAtLQ0K
PiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+IA0KPiANCg==
