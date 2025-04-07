Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E3BA7E0D6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427C110E3B3;
	Mon,  7 Apr 2025 14:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="AmbIzCK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011036.outbound.protection.outlook.com
 [52.103.67.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBA510E3B3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 14:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hclf58rwZ5EekaaaX7G6e9BzHf7l+7OZm8VV+vg+xexyMc371LaaJyRcpzS7Ay2RCEItg9dVcu+/MpD1H1woV/7otZbnREZ2922uKvLP2Plw87CdjmsMaDBoXDNUW5FGoQI2rXWHt27TAcwRd6/EN80pLxfC//h6/ob7MD2+UUIH5F3YzacFBSorDQgWrwatPcgUGNuNT4TfEd2xUPNBS5EI+xNYYCczRTog1k/nyQhuU3+1+c/IcQt9bnGRpET2ltLe5mUivWsdxOB3u48tA8iAO+iYGAGpuqAXPvSgEUDnfMDqXplVWvsZhitRmtH48fmnAUAbWeFUwXHDSneyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdmO5FXd/XjLipUXo2eKONhDQIvcAJeNWtPMPf4jXKs=;
 b=RCBMjq/GCMw847mPnDEB0CW1o6sB7L6Wl97APkS9bwhJ54sz9ND4RCK3GNZwOIRfhJfZZdThAAjuDNf4eZlLZ9Zb3uH+RnyqVwZ9nt5HU5piQAjJ4HlUFgRjhDhsfGLfrnmtq4wmfmKhdBetrTuoC6ki9sjrETI6GzHtNRr0ivgO8vMbGnXqJuLVkWMOcTsr8Da2sJTIzxXCDLohy0E0Zzh+kp9GjEB2QszsXOe7BX1N3eepp7wxZ01vYbhFiOx3aPwDHjUF3AOI1HzHIyo7ke2TYNAo9XH2D1F4JOug24yHv6bpv8QHEKryxNzbI5OYf0SboaxktmSkRv9dUcsl7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdmO5FXd/XjLipUXo2eKONhDQIvcAJeNWtPMPf4jXKs=;
 b=AmbIzCK/6njm1OA1no3TAmhvuW1If9mA/MZ+COr0fEMzktec8Tom6V6wtG82V+UWYXbxvhDz0oeqHG5HbH1YqjTrfZ3mcayTLbq/eJM/HINbvdQTM2z1wz2pdX5zt8oguUxPl9s/dkQO6PcikmJR6xNvA5RLdwAFRB06qHAcb77Tb19+snDpZ5pRVVk9efcdBGh5AbusNdtWMppznFp3QA2Og7Ngf/cMMWoCbSvUpROwyKTx+2eKPgw51vJjg7v23MOTJh7LveRgYw3PrsmnuKCUsXqLDiiZc3vdcVEYFBbd4Vywrn6VVe23/XHi80n0Ay7OVeGbvIhInzuyUAY/ag==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAXPR01MB4454.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 14:17:00 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 14:17:00 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>, Petr Mladek
 <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann
 <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard
 <mripard@kernel.org>, "airlied@redhat.com" <airlied@redhat.com>, Simona
 Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>, Kees Cook <kees@kernel.org>, "tamird@gmail.com"
 <tamird@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Hector Martin
 <marcan@marcan.st>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH v3 0/3] Use proper printk format in appletbdrm
Thread-Topic: [PATCH v3 0/3] Use proper printk format in appletbdrm
Thread-Index: AQHbp8HmxJN8LS0hCEKm1MGctLhrbLOYOfoAgAAF9Uo=
Date: Mon, 7 Apr 2025 14:17:00 +0000
Message-ID: <PN3PR01MB9597E19A55EAFC3E7B191F5FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597596DA5DA9FC02825CF0FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_PZXPAklfkMlx6O@smile.fi.intel.com>
In-Reply-To: <Z_PZXPAklfkMlx6O@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAXPR01MB4454:EE_
x-ms-office365-filtering-correlation-id: 1631ec31-49a3-4a60-63aa-08dd75dedd0b
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|19110799003|8062599003|8060799006|15080799006|6072599003|7092599003|10035399004|4302099013|3412199025|440099028|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?dzRzdzV3bU5xbmM5NWYrRm5USXlnRXlycm5Wa0ZmS092R3FBb1lOc0IvWG9X?=
 =?utf-8?B?TWRFb1RXN3AyYUJSclFPL05ZMjFwOC85Zy9ZcVdsazA4cHp2VG1pUVNsa0FT?=
 =?utf-8?B?NWp4YW1CYzFwYUJNbXNNV2pYS0tMNjZJUERkendQRWVCNG1mNDRieXdFY0x4?=
 =?utf-8?B?dnpoSEtYdENzWHRzbkRXbklTd0J4bzErRUZjZmFqQU9MZU5NL3cxdVJZREdC?=
 =?utf-8?B?WWxVZDhDTkI0UElCcmFNNTk3bkt3NjE2ZGxvTTFWSW5OQm5jbEhGTnZWMWpV?=
 =?utf-8?B?Q1ZYYW9Hb0x6WnIzY1dGOFNFeEg0VEJxOGxrU1B3OXpNMHBFQ1J5WDg4NXVP?=
 =?utf-8?B?aUJjTVJnWEpuTGpHNi9SdTQ0UndOeFVUZXRMVmtDR0Vzb08rWXFvVlp4all3?=
 =?utf-8?B?NVp1anNsS0xGU1NWdG54RThLdnE4WTRJVys1ei9NSTVWekR0MzFtai9QSUVS?=
 =?utf-8?B?UmxYd0J1N2lYbTRqbmlzNHAwaXpmdnhNM2FmZXYzdVZPZXVwaVZoWGxnVEk5?=
 =?utf-8?B?eWtoaXpjV205L0lhQWRqWjlReWt4ZmU3VThNVlVpeHhUdXA4a0JWa0M4a0xQ?=
 =?utf-8?B?Ym05VFhNNk1xZGJ0dVllY3VsQlFFNHhaWUZmN3lGUW1hMnNWeExOaUM0eUF5?=
 =?utf-8?B?MEN0dmtlbjVlTDc3bW1Jd2xFR3ZjdnpXQVFrNFdlWG5KZWo4U1hvVTRUeGVX?=
 =?utf-8?B?Ylhrc05lUVJCOTI5T0xWYXpkVStZb1NncFk3a3dXRGhLTG9sRUhNREN1Z2hK?=
 =?utf-8?B?MUUzTGFlMkt0c2RkcitJNCsxc0l5TTBmYWV1Y0pLaGRjbkpEOGZoQnUxVWNQ?=
 =?utf-8?B?bjI0cDZCa3ZHSlBSTGRYNU1tOXBZQmNEeTJ6dGcweVoxa0dwcjd2MWE5elVL?=
 =?utf-8?B?cG4xZ0kyUGtaZmZoR0FONnBMdEV3YUJQdTNFMjJETjUyRDk3RzhYNEhld2xu?=
 =?utf-8?B?S0VQbFZodzZLTHdtTjhERjBqTzFmTU1KVXlwRmxFQXNveXFGSElFZEFLTkZm?=
 =?utf-8?B?Sk95WTBzNG5BNmtNaVJXeUFMdkFmSzQzUWcydzN0TmlFTmd4Q3ozaW9KdmZ0?=
 =?utf-8?B?SW1ZeWpHck9EZzY2QUFjajVHbXBCWXUzNDZLaUVhOEMwWEtzQ3dXVktIZzdR?=
 =?utf-8?B?OVZPcm1peUJxaVR1WitJUWx4NnZPOHd1RUlUVHJISGR5Zkl0aTBTTThmYTQ4?=
 =?utf-8?B?Wm9yUkwvV0w2VnM5ZXg0dmJQc05FOFVnS2hQUlU2SmxnbkIrM3NHSnRwaUNy?=
 =?utf-8?B?Ti91ZU1oWFJzRjdSbDN6MGxCZFVxMjBWUG9wYTZnMmlmSEI3MGxuRHZ5L0dl?=
 =?utf-8?B?Sko0WE54VmZ1ZmhYVkRkZ21qS2swOW9vTTNJOHBVdFh4R0RLRit6c0pobFJN?=
 =?utf-8?B?RXpUdS9kQ2hmbEpaa2VXeFBXQ3BHbWQxM01lM0ZObjJWMTZCQ1g2aFRhcUE1?=
 =?utf-8?B?VEo4Y0gzb25jVnBzNU5BYi9GN1hUNTNqNEtPQTZKVkZKUEkvRDg4a21aN3Fr?=
 =?utf-8?B?YVMxRDlsVlhGR2ZncE85bU85b0tOWWFUd2ZtSTRoS3hvU3lYaFBLK3U5dVcz?=
 =?utf-8?B?M3F4ZjJSaWxWcloxcUhzZFpObG1yK25SUDJPbll6Mm5wOW81c1EzRjJJdkxY?=
 =?utf-8?B?L1ZXSzhvRkFHRmRHRUk5ZlU0MU82UHNGUURiSWpPNStDeTZyelhGODZjb2tt?=
 =?utf-8?B?U1RMOW52b1NDb1lYaXRYbFVUK2FjVU1qMGlDeUFLL3dTWkVZYkJ2UDduQStB?=
 =?utf-8?Q?5DCBFDrRuFKgCPOv8g=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGZZdk01TlE1QWJqSVdYWVVNcUMwbFdhK1ZNUGJ4UzEvMUprcTVaYS9ncThC?=
 =?utf-8?B?aHI3QnQxdGhEZ1hqV2k1RHdCWGxJNnJFN3N5VGlTeFJtc3pBYjYvLzNkaDh5?=
 =?utf-8?B?ZmVrV1VPdnM4YjBYamVDUXYrOG5JT095dytaWmROTjU2SUZLUnpYQ3ZUck5x?=
 =?utf-8?B?emJ1R1dCMFJkTlI5YXVuOWFwQUJqT0tPcnU5Rjg2Vyt2bEhRWWNrQXZUckxR?=
 =?utf-8?B?WUE3RExRbUxSYW1FN0JkelZkTC9wQmRIWEFMWE9malpBSmJDWEErZ1ZjSThO?=
 =?utf-8?B?TXhJdXlrWW90b1o4QWhVV0puZ3Nsdmt3WFlpMi9KaDNJUlU2Z1BMS3RBdllC?=
 =?utf-8?B?TzdOTzlTNXdURmVCdlpnZmhJWGJyYmNtM1ROZmM2QmhsMHVEYnpiSzRqWXU0?=
 =?utf-8?B?c0cyQlJDbmZXK0xKa2ZZazNyQVcwVmpmZEJpTExHY0twSm4rRlB2V3F6Kytq?=
 =?utf-8?B?L2ZXTW5xQzBWT1piTFgyK0UxM1h5L2R6SUFabmhKU0dPbklZSkJ5aGh4T002?=
 =?utf-8?B?RlZOeTBtUkRaTkVodzd6eDJhb0VSbDhEVGVMVVJvTnRrUGRzNTF2aGJ1aEo0?=
 =?utf-8?B?RWFTcFNuUnRUZC8vcmJxKzUrOU9GOW9Pa3B4VWlvTHhMcEdacG81cTc4M0p2?=
 =?utf-8?B?c1UwMGlTTjl4aXFzM2RpaWdJdDNsUzdCdnpaYTFNRTJGc1A3ZU5uUUx2TGtS?=
 =?utf-8?B?WDNiMklBSHo2R1N3eCt5clNMOTVnZ3BHdmNJVTJJOGMrODhRK1BibGgvTXFU?=
 =?utf-8?B?Y0lkRWpnc0x6WEZWUlpqcXhCbE9ud3pSZ0FjQ0tmRVRUT2NzeHZheEdHOEd1?=
 =?utf-8?B?YmN4Q2tJemtOeU5MbFJQaW84UnZ4WVZEV2JUTHVIeEY3dThEd2pzVnRQR2xy?=
 =?utf-8?B?cVQ0NmdwclZJMVdidkJrSFU1VEV2Z1BUT1BQK2pKMjJLN1ladjNjZjNJQzly?=
 =?utf-8?B?R3g5dXBuc2g2Ky9QbmJsd3d5YUxTTWZOSnc1a3UvVWRNd1NUQkd3RVNGME1k?=
 =?utf-8?B?R1p5blp1YWxOY3RzYXlMbS9GUWx2ZEZmRGRFMzNIMyt5aVVYb2g3V0hqYmJv?=
 =?utf-8?B?RVhwMnNwdVk2WWhsclJDN0U0bElyRWV1bTc2bFMycStNTjFKaStNZittZlVP?=
 =?utf-8?B?M1oveExZejViV215cHErbHM0OGwwclpDNE1oTE9oQmpjL3Q4bU9nN3lrVFpv?=
 =?utf-8?B?SW8wWUd0VHM1SnlMODdlQXFzL2k2VVlNNXU1aFRCVm83Qk02L0kxWjFuYUlu?=
 =?utf-8?B?OVIxQkl1VVpJdFJyUWtUR1ZvUlJ5RUpSeEFib0lybzFzZUdreTgrVHA0MlpY?=
 =?utf-8?B?aGlrQStyY2luYk53MGxEK3gwUWFDU2plQUFCNkgzcUdOSm0zcHMyeEtmVlRK?=
 =?utf-8?B?SjhITS9nWnV0UkZNaGRFNEZoUEZjaDdxQm9UVXNsWEZQVkJtQlhEMXphMTFv?=
 =?utf-8?B?eUFIY01ubUQvcnB0M3JteGh1ZllSWGsyK0czTkthMHhXN1F4Z3BERU8xVERM?=
 =?utf-8?B?MFlEelZTamhCVTkvYnNtb2lFVlZONC9Bck14bFhicythVU1mWmJMNmRvSHUz?=
 =?utf-8?B?UlFiVmo5Q1ZCYU1FVU84anpZUlh5VFgxYThoNXN2M0dwclpoY290YUx5VVdO?=
 =?utf-8?Q?SlnOo4T/GxMKy3V3duiUtoXnkA1Uw1FjtPaGOxCeXoTg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1631ec31-49a3-4a60-63aa-08dd75dedd0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 14:17:00.8010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4454
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

DQoNCj4gT24gNyBBcHIgMjAyNSwgYXQgNzoyNuKAr1BNLCBBbmR5IFNoZXZjaGVua28gPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79PbiBNb24sIEFw
ciAwNywgMjAyNSBhdCAwNzowNToxM1BNICswNTMwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+IFRo
ZSB2c3ByaW50IHBhdGNoIHdhcyBvcmlnaW5hbGx5IGJlaW5nIHNlbnQgYXMgYSBzZXBlcmF0ZSBw
YXRjaCBbMV0sIGFuZA0KPj4gSSB3YXMgd2FpdGluZyBpdCB0byBiZSB0YWtlbiB1cC4gQnV0IGFz
IHN1Z2dlc3RlZCBieSBQZXRyLCBJJ20gc2VuZGluZw0KPj4gdGhlbSB2aWEgRFJNLg0KPiANCj4g
DQo+IFlvdXIgbWVzc2FnZSBpcyBkZXRhY2hlZCBmcm9tIHRoZSB0aHJlYWQsIG1ha2Ugc3VyZSB5
b3UgdXNlIHByb3BlciB0b29scywgZS5nLg0KDQpJdCdzIG5vdCBhIHByb2JsZW0gd2l0aCB0b29s
cywgaXQncyBhIHByb2JsZW0gd2l0aCBteSBlbWFpbCBwcm92aWRlci4NCg0KTWljcm9zb2Z0IG5v
dyBzdXBwb3J0cyBvbmx5IG9hdXRoMiBmb3IgU01UUCwgd2hpY2ggZ2l0IHNlbmQtZW1haWwgZG9l
c24ndCBzdXBwb3J0LiBJIGhhZCBkb25lIGEgZmV3IHRlc3RzIHVzaW5nIG1zbXRwIHdpdGggZ2l0
IHNlbmQtZW1haWwsIGJ1dCBtc210cCBhbHNvIGhhZCB0aGlzIGRldGFjaGVkIGZyb20gdGhyZWFk
IGJ1Zywgc2luY2UgaXQgZG9lc24ndCByZWFkIHRoZSBtZXNzYWdlIGlkIHNwZWNpZmllZCBieSBn
aXQgc2VuZC1lbWFpbC4gSSd2ZSBiZWVuIHVzaW5nIG1hY09TIG1haWwgZm9yIGEgbG9uZyB0aW1l
IGZvciBrZXJuZWwgcGF0Y2hlcywgYnV0IHNpbmNlIGl0IHdhcyBhIHBhaW4gdG8gcmVib290IHRv
IG1hY09TIGV2ZXJ5IHRpbWUgZm9yIHRoaXMuIFNvIEkganVzdCB0cmllZCB1c2luZyB0aHVuZGVy
YmlyZCBpbiBMaW51eCB0aGlzIHRpbWUuIE5vdyB0aGlzIHRpbWUsIGl0IHdhcyBhIGNvbmZpZ3Vy
YXRpb24gaXNzdWUgaW4gdGh1bmRlcmJpcmQsIGluIHdoaWNoIGl0IHdhcyBtYWtpbmcgYSBjb3B5
IG9mIHRoZSBzZW50IGVtYWlsIGluIG15IHNlbnQgZm9sZGVyLCByZXN1bHRpbmcgaW4gMiBjb3Bp
ZXMgdGhlcmUuIEkgcmVwbGllZCB0byB0aGUgY29waWVkIG9uZSBieSBtaXN0YWtlLiBJJ3ZlIGZp
bmFsbHkgZml4ZWQgdGhpcyBpc3N1ZSBhcyB3ZWxsLCBzbyBzaG91bGQgYmUgZ29vZCBpbiBmdXR1
cmUuDQoNCj4gDQo+IGBnaXQgZm9ybWF0LXBhdGNoIC0tdGhyZWFkIC0tY292ZXItbGV0dGVyIC12
MyAuLi5gIGdpdmVzIHRoZSBjb3JyZWN0IHJlc3VsdC4NCj4gDQo+IC4uLg0KPiANCj4+IFsxXTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xQTAzQTVCNC05M0FDLTQzMDctQUU2QS00QTRD
NEI3RTk0NzJAbGl2ZS5jb20vDQo+IA0KPiBFdmVuIGhlcmUgeW91IGNhbiB1c2UgTGluazogdGFn
DQoNCkFscmlnaHQuDQo+IA0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzFB
MDNBNUI0LTkzQUMtNDMwNy1BRTZBLTRBNEM0QjdFOTQ3MkBsaXZlLmNvbS8gWzFdDQo+IA0KPiAt
LQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+IA0KPiANCg==
