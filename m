Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948CE94BCDC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37110E6EE;
	Thu,  8 Aug 2024 12:04:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="IFoZFlyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2056.outbound.protection.outlook.com [40.92.103.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2876210E6EE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fB9SDTgLXfjOLftk8nY1mfiLKx6yX+g9xpSVpd21pd60qEVrxiJLyTMY7z5Bhjb+ayn2t5YhqKS9tOZHBBQzOMvkNSItu5iu5wEbsTr8HCcADfi5m1gKkhJihuCULb4AKNCTvYyczRfvD95v2lhOqH2ZOtUQMwGb2M/fkQgZ8MGk+chxHCwq8aS2tUXoRdYbkbz5X6z9/Ez4BTDth6/H6bo9aZKbEwrKLEZPyM7opXas+7DNSlV6h+c9Y/PqaNycIEk2LUqZiaw2l4WplAY7I9ONHV8/jsz5nFd9SBEepEln9GzWbB13cYQwLyrw5OHuruDRISs1c8r+BoY3FKWVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+eHdKmfT4P+y/XZCPmc1BnX5ifamJTeCQ7xC7zjDJY=;
 b=WeCfdWcw8wDvfHls7yGwSCQie+HlSJX3BFm04yc+VZlHmwV51v+kjf6fT4kpkke/A+xVdthF5PvURRIm29yYiOlWc5t2o5iB0OzcBwvuNbHhPYNofO5D9BI3TcAbdiNDxC+4SLgYcg5wcFqLiJNPBl0Ts29IxBkkrkOAboKqZ3eOkkOvgGucJezGx0hp8sG+89RmqQlUNP3jys1sttQlCQMDAbuvfzrOcouBRvPML5aD1fS9BP4xx/xfKsyAToRmdRXyWdtZCHLjQ9XnA8MzWZaHtgGYXjW7dPjD12qpgiNWP0YPdSbPEeboC/cN7t+PMBBMtw1p1g4Xmzh+xglilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+eHdKmfT4P+y/XZCPmc1BnX5ifamJTeCQ7xC7zjDJY=;
 b=IFoZFlynY3/8E3zV1j0kncmGMhBvJSUNRCMk8q/LhJU1EsCSuuUCpr5nXttVkAS1wVXRTQMX4Kwx9TrBNZVpoDfFn+3rUIIF5NoFWrjoxjl7/l8OG4NXVJ8zH3DdMvUUL0VyDXSJ/PJpeIVMPJHNjTHxTaqvJPWs6ynEUB5LU1mpu34PdQt41YIT8rplm+ObTAEblluCsxKL9OiG0Ftd4qdilyBh0WXNNCMH8T2LnUH/QasLkIfMbm41K615FoNl9RuBxDRbdwpEgN23zW4gkI7YQzV+f9kW6DHSSFHYWzvFAfGHJVnc7Wv1TdULuA4kTnLIBuF/jjItIGtDuHGiUA==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB0341.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 12:03:54 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:03:54 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: Re: [PATCH v2 0/9] Touch Bar support for T2 Macs
Thread-Topic: [PATCH v2 0/9] Touch Bar support for T2 Macs
Thread-Index: AQHa6YmZn7sQ7l9lukqKo3+ZfQknULIdQvIA
Date: Thu, 8 Aug 2024 12:03:54 +0000
Message-ID: <F132A872-653D-44EF-9FA6-14CD12A7C366@live.com>
References: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
In-Reply-To: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [q0U9ezAtRR6QUqitLPobz5vAXC+azBVab64Q8Cv2Q/FR3TzAN5AxyKvYKGXiu/2u6EEDEEFoHLI=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB0341:EE_
x-ms-office365-filtering-correlation-id: 0ae9e4c3-498e-4dca-113e-08dcb7a22ca0
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|19110799003|15080799003|461199028|1602099012|440099028|3412199025|4302099013|102099032;
x-microsoft-antispam-message-info: uFKUsN+0LA4FkJxrUablr9/fK7xJfcfJuzvp6ig0MBjEb9ijBQ1AFVn1Buu8Ue5j9wBHed2oQTpgMxLozkXeOmutB5XMAtIky0sob8qN4tzicaug98bZu85KTgSsa1Ow4g8g8zQfJkh/ISfTG5kltJLpTFSlpSn04hJ5r/mNs5qiKm+/JQpPkdqpzCmbwkZtF5FatZyaijGxaaLG8W30aINson5m6IsQmFtP/Sos/1tLWOIXghx3X8FsBMczKLUuLH5JtzmfYuFqROAzAR2MtA5HpF/PBxA3SRcEL4JY8Sgmv7VLp708Waeu4EOqI2u4K6EnyRSK62idCIhu6HORBjWB4hH0FxfUseyrZJy5HaH/yxUgtfu3Ftknvh4NTsSBgwK31e+GmnDJrIczLLpNq0k6AUZ+95VbFev9CTKWB1P0q/9KmBHaGT48l0ck0njtBgsvYaXUFlEs8KTSADzX0/DPkIR6dlv7IfJ3I+sdJuFuZ64ZkOJEgaCY8PVqqvHn5o76LzfWtynYZamikLHMH0XdFZOHpeJgmuyTua0nmk64Rb4gDDn6EzgGRP/NBqZNOLUnC5ZJJhR4garqXNKEUTugK6Owc0Gdf7rZNvgni+NF0QXDQbqwY+HnK8PASGCfl5gapusQi8ISGPKRfkeP9FY1knUEbd+w7BiNFlpGIXyV43AMbi/vvBHHiji0A4ZMcAwuaSacNt7PHYKuVpBi43RLwkeN1ESeCJbNbVZENQpvY0gkzXYtkKwK2+Y/8sI8jjujQuU/rLOaPp+iRHA10MCUAKl3byaIXFBvF59ITE4=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDM1d0xlYjZWYWYwZk5QNi94aWRVK3d0WmhSM2c4UjlQbjNqYndLUXY2Y0hP?=
 =?utf-8?B?T2twMFZ1Z2ZZMjVQMTFvTzdLdDMrNlh6M0Z6V01tWWlnOTZiWjE5cEtUVlZM?=
 =?utf-8?B?cjQxemptYXI4T0x3NXFEeldNTmx1aTllYy92VWYwcWdVS1oyV0VwVEtJa1dX?=
 =?utf-8?B?eHQ2TkpIN3grWFcwUmw5TUxMT3A2WVB5UGhPZWFtaldad3NCclM1ODZ1WkdC?=
 =?utf-8?B?d1lLZXJ2WGxoZ2o5bW83T1NuRFhaY0ZIczBFMElWVTZ3K0tHRDFDaVVOUUpB?=
 =?utf-8?B?bXpxUmYzZ2diY1l6aWlXUzdnVm8vSzlIR3hIRjFSTm80ajFJU29tbnB1MmRp?=
 =?utf-8?B?a093TEFxVzdBcjFyamQwKzdIRXF5bFp2aWtGK3E5Z090eG1lSDF2blNNSVlj?=
 =?utf-8?B?a3Nta1ZFeDI4NWhZZHpzakxkNUhZb1VmdW5CbFA3eGtMb3MxNUZKc3orUkZF?=
 =?utf-8?B?UURhUS9QakdxMG9RREwzKytIRkhKdGVnaVdtTEFNb05PY2RaUkV6em1UZ2Ni?=
 =?utf-8?B?VnVld1JHU1V1QzlNQmM0OXdiNlNrWXNKbVlZZWV4bnB4U1V6WnFtYVhmcGZG?=
 =?utf-8?B?K1FzM2FDRXlMQXZPb3R4YjdDUVA3Rkk1WFc4VUhPQWNCWUZydFRzQVBZZVEx?=
 =?utf-8?B?NkRKajVXL1RKVVJuS0pFWldXM2tBcWhaVWovTmxqY2tBUmlYTzhMckhNamNS?=
 =?utf-8?B?b2VoMklENmZ1OTVyWDk1NWlUTkQvU1IzZ1drZDJQTzZrWjQxMWtBT1pPRUFQ?=
 =?utf-8?B?ZkVlUWRsTWNEbWdhWGx6bDE4MEYyNzdCd24wVWZiVGsrR01OWEw5N3hIcWhQ?=
 =?utf-8?B?eElTUWZYVmVrYUhoNnZZanBFNE42NkZ3eE5CVmU0d1h6MFJjZUFSTDdpdDBm?=
 =?utf-8?B?NDEwY3pBM0RzNmtLemE4b040ZUU3N21pdkxDTW1PaFVEVlNtdEIzMTBOcS9B?=
 =?utf-8?B?Q3VHSGFDdURBK2JndFljMkIrQXdFQ3pqNVhUQ2g5Vkk1NVl5V3RzK2ZTZ05B?=
 =?utf-8?B?WW5UaGExT2V2eVFsbnFnVFdTWWNMOG1zQ001S3RCNXNzUU9zWlJEK1JCRzBN?=
 =?utf-8?B?VlROdVJqdXd3ZmJ5STYvRTd4SU56K1VzdXlPdVRTbjNlNnpjWHZTb2hXZVdY?=
 =?utf-8?B?U2dkRFFLVytUN1BUek40SmZjamVuaVFHdXdMd2RKMnpWR1FuakxzWXVkNWgr?=
 =?utf-8?B?aHpjRG9HQ3YvNy81R1FWelF0S2ZvaEVKallUTUhRWmx5bXpGTW1ZWW9EbzhS?=
 =?utf-8?B?ME1kQVh0MWhNVU80TmZmazczVVBTd3VWTUpROGdhbXRvZXhtU3Z1ZjNrVUhO?=
 =?utf-8?B?RGxTUjhVcm5JR3hvc0dVcHF0bkYxMWI5cUhqTFlUWm41ZXc5dHVSSHhKL25j?=
 =?utf-8?B?VC9tbThaajZzV3N5RHRDSVpoTEFBY1Q3WENRMk9PTE41Vmp1Y2lLeFQyZDVM?=
 =?utf-8?B?cDBnYkozNVA4TGVJUGtWSXA3Q1FrMytST0hqVTZybExSMWdEbmZzenBHZmpz?=
 =?utf-8?B?a1hkWXJNOUo2UmRLWGJOZlZQKyswUVJGRmFLbS9oYURzMmdtYUMxMWJNWG1Q?=
 =?utf-8?B?NWQ2TjY2VXkrNXMvUlFPT0xScEE3eG1LczRvZlNDQUc5eDBnVUhhYU9IZ2pW?=
 =?utf-8?B?dFpHRVZ0b1pyK2ROWnczbWliR2ZDbHVFWDJaU1AzVDdiYjdYOWxvZ0ZrUTEv?=
 =?utf-8?B?UTRNZG9SanExdzBiNk04TjRPaUFZd3hZUE5OMnk2dDlCNjhYaDJPWUQ0ZlRD?=
 =?utf-8?Q?zwsKboxwX2XiHBMrqEccxYAj4nqXfeCpWf/kgwp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9881579FB79EC24B8316C7512494F37E@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae9e4c3-498e-4dca-113e-08dcb7a22ca0
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:03:54.0955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0341
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

TG9va3MgbGlrZSBJIG1lc3NlZCB1cCB0aGUgZW1haWwgc2VyaWVzLCBSZXNlbmRpbmcuDQoNClNv
cnJ5IGZvciB0aGUgdHJvdWJsZQ0KDQo+IE9uIDggQXVnIDIwMjQsIGF0IDU6MjPigK9QTSwgQWRp
dHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBNYWludGFp
bmVycw0KPiANCj4gVGhlIFRvdWNoIEJhcnMgZm91bmQgb24geDg2IE1hY3Mgc3VwcG9ydCB0d28g
VVNCIGNvbmZpZ3VyYXRpb25zOiBvbmUNCj4gd2hlcmUgdGhlIGRldmljZSBwcmVzZW50cyBpdHNl
bGYgYXMgYSBISUQga2V5Ym9hcmQgYW5kIGNhbiBkaXNwbGF5DQo+IHByZWRlZmluZWQgc2V0cyBv
ZiBrZXlzLCBhbmQgb25lIHdoZXJlIHRoZSBvcGVyYXRpbmcgc3lzdGVtIGhhcyBmdWxsDQo+IGNv
bnRyb2wgb3ZlciB3aGF0IGlzIGRpc3BsYXllZC4NCj4gDQo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFk
ZHMgc3VwcG9ydCBmb3IgYm90aCB0aGUgY29uZmlndXJhdGlvbnMuDQo+IA0KPiBUaGUgaGlkLWFw
cGxldGItYmwgZHJpdmVyIGFkZHMgc3VwcG9ydCBmb3IgdGhlIGJhY2tsaWdodCBvZiB0aGUgVG91
Y2ggQmFyLg0KPiBUaGlzIGVuYWJsZXMgdGhlIHVzZXIgdG8gY29udHJvbCB0aGUgYnJpZ2h0bmVz
cyBvZiB0aGUgVG91Y2ggQmFyIGZyb20NCj4gdXNlcnNwYWNlLiBUaGUgVG91Y2ggQmFyIHN1cHBv
cnRzIDMgbW9kZXMgaGVyZTogTWF4IGJyaWdodG5lc3MsIERpbSBhbmQgT2ZmLg0KPiBTbywgZGFl
bW9ucywgdXNlZCB0byBtYW5hZ2UgVG91Y2ggQmFyIGNhbiBlYXNpbHkgbWFuYWdlIHRoZXNlIG1v
ZGVzIGJ5IHdyaXRpbmcNCj4gdG8gL3N5cy9jbGFzcy9iYWNrbGlnaHQvYXBwbGV0Yl9iYWNrbGln
aHQvYnJpZ2h0bmVzcy4gSXQgaXMgbmVlZGVkIGJ5IGJvdGggdGhlDQo+IGNvbmZpZ3VyYXRpb25z
IG9mIHRoZSBUb3VjaCBCYXIuDQo+IA0KPiBUaGUgaGlkLWFwcGxldGIta2JkIGFkZHMgc3VwcG9y
dCBmb3IgdGhlIGZpcnN0IChwcmVkZWZpbmVkIGtleXMpIGNvbmZpZ3VyYXRpb24uDQo+IFRoZXJl
IGFyZSA0IG1vZGVzIGhlcmU6IEVzYyBrZXkgb25seSwgRm4gbW9kZSwgTWVkaWEga2V5cyBhbmQg
Tm8ga2V5cy4NCj4gTW9kZSBjYW4gYmUgY2hhbmdlZCBieSB3cml0aW5nIHRvIC9zeXMvYnVzL2hp
ZC9kcml2ZXJzL2hpZC1hcHBsZXRiLWtiZC88ZGV2Pi9tb2RlDQo+IFRoaXMgY29uZmlndXJhdGlv
biBpcyB3aGF0IFdpbmRvd3MgdXNlcyB3aXRoIHRoZSBvZmZpY2lhbCBBcHBsZSBCb290Y2FtcCBk
cml2ZXJzLg0KPiANCj4gUmVzdCBwYXRjaGVzIHN1cHBvcnQgdGhlIHNlY29uZCBjb25maWd1cmF0
aW9uLCB3aGVyZSB0aGUgT1MgaGFzIGZ1bGwgY29udHJvbA0KPiBvbiB3aGF0J3MgZGlzcGxheWVk
IG9uIHRoZSBUb3VjaCBCYXIuIEl0IGlzIGFjaGlldmVkIGJ5IHRoZSBwYXRjaGluZyB0aGUNCj4g
aGlkLW11bHRpdG91Y2ggZHJpdmVyIHRvIGFkZCBzdXBwb3J0IGZvciB0b3VjaCBmZWVkYmFjayBm
cm9tIHRoZSBUb3VjaCBCYXINCj4gYW5kIHRoZSBhcHBsZXRiZHJtIGRyaXZlciwgdGhhdCBkaXNw
bGF5cyB3aGF0IHdlIHdhbnQgdG8gb24gdGhlIFRvdWNoIEJhci4NCj4gVGhpcyBjb25maWd1cmF0
aW9uIGlzIHdoYXQgbWFjT1MgdXNlcy4NCj4gDQo+IFRoZSBhcHBsZXRiZHJtIGRyaXZlciBpcyBi
YXNlZCBvbiB0aGUgc2ltaWxhciBkcml2ZXIgbWFkZSBmb3IgV2luZG93cyBieQ0KPiBpbWJ1c2h1
byBbMV0uDQo+IA0KPiBDdXJyZW50bHksIGEgZGFlbW9uIG5hbWVkIHRpbnktZGZyIFsyXSBpcyBi
ZWluZyB1c2VkIHRvIGRpc3BsYXkgZnVuY3Rpb24ga2V5cw0KPiBhbmQgbWVkaWEgY29udHJvbHMg
dXNpbmcgdGhlIHNlY29uZCBjb25maWd1cmF0aW9uIGZvciBib3RoIEFwcGxlIFNpbGljb24gYW5k
DQo+IFQyIE1hY3MuDQo+IA0KPiBBIGRhZW1vbiBmb3IgdGhlIGZpcnN0IGNvbmZpZ3VyYXRpb24g
aXMgYmVpbmcgZGV2ZWxvcGVkLCBidXQgdGhhdCdzIGEgdXNlcnNwYWNlDQo+IHRoaW5nLg0KPiAN
Cj4gWzFdOiBodHRwczovL2dpdGh1Yi5jb20vaW1idXNodW8vREZSRGlzcGxheUttDQo+IFsyXTog
aHR0cHM6Ly9naXRodWIuY29tL1doYXRBbUlTdXBwb3NlZFRvUHV0SGVyZS90aW55LWRmcg0KPiAN
Cj4gdjI6DQo+ICAxLiBDbGVhbmVkIHVwIHNvbWUgY29kZSBpbiB0aGUgaGlkLWFwcGxldGIta2Jk
IGRyaXZlci4NCj4gIDIuIEZpeGVkIHdyb25nIHN1YmplY3QgaW4gZHJtL2Zvcm1hdC1oZWxwZXIg
cGF0Y2guDQo+ICAzLiBGaXhlZCBDby1kZXZlbG9wZWQtYnkgd3JvbmdseSBhZGRlZCB0byBoaWQt
bXVsdGl0b3VjaCBwYXRjaC4NCj4gDQo+IEtlcmVtIEthcmFiYXkgKDkpOg0KPiAgSElEOiBoaWQt
YXBwbGV0Yi1ibDogYWRkIGRyaXZlciBmb3IgdGhlIGJhY2tsaWdodCBvZiBBcHBsZSBUb3VjaCBC
YXJzDQo+ICBISUQ6IGhpZC1hcHBsZXRiLWtiZDogYWRkIGRyaXZlciBmb3IgdGhlIGtleWJvYXJk
IG1vZGUgb2YgQXBwbGUgVG91Y2gNCj4gICAgQmFycw0KPiAgSElEOiBtdWx0aXRvdWNoOiBzdXBw
b3J0IGdldHRpbmcgdGhlIGNvbnRhY3QgSUQgZnJvbQ0KPiAgICBISURfREdfVFJBTlNEVUNFUl9J
TkRFWCBmaWVsZHMNCj4gIEhJRDogbXVsdGl0b3VjaDogc3VwcG9ydCBnZXR0aW5nIHRoZSB0aXAg
c3RhdGUgZnJvbSBISURfREdfVE9VQ0gNCj4gICAgZmllbGRzDQo+ICBISUQ6IG11bHRpdG91Y2g6
IHRha2UgY2xzLT5tYXhjb250YWN0cyBpbnRvIGFjY291bnQgZm9yIGRldmljZXMNCj4gICAgd2l0
aG91dCBhIEhJRF9ER19DT05UQUNUTUFYIGZpZWxkIHRvbw0KPiAgSElEOiBtdWx0aXRvdWNoOiBh
bGxvdyBzcGVjaWZ5aW5nIGlmIGEgZGV2aWNlIGlzIGRpcmVjdCBpbiBhIGNsYXNzDQo+ICBISUQ6
IG11bHRpdG91Y2g6IGFkZCBkZXZpY2UgSUQgZm9yIEFwcGxlIFRvdWNoIEJhcnMNCj4gIGRybS9m
b3JtYXQtaGVscGVyOiBBZGQgY29udmVyc2lvbiBmcm9tIFhSR0I4ODg4IHRvIEJHUjg4OA0KPiAg
ZHJtL3Rpbnk6IGFkZCBkcml2ZXIgZm9yIEFwcGxlIFRvdWNoIEJhcnMgaW4geDg2IE1hY3MNCj4g
DQo+IC4uLi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXItaGlkLWFwcGxldGIta2JkICB8ICAxMyAr
DQo+IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMiAr
DQo+IGRyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jICAgICAgICAgICB8ICA1NCAr
Kw0KPiAuLi4vZ3B1L2RybS90ZXN0cy9kcm1fZm9ybWF0X2hlbHBlcl90ZXN0LmMgICAgfCAgODEg
KysrDQo+IGRyaXZlcnMvZ3B1L2RybS90aW55L0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAx
MiArDQo+IGRyaXZlcnMvZ3B1L2RybS90aW55L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAg
MSArDQo+IGRyaXZlcnMvZ3B1L2RybS90aW55L2FwcGxldGJkcm0uYyAgICAgICAgICAgICB8IDYy
NCArKysrKysrKysrKysrKysrKysNCj4gZHJpdmVycy9oaWQvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIyICsNCj4gZHJpdmVycy9oaWQvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICsNCj4gZHJpdmVycy9oaWQvaGlkLWFwcGxldGItYmwuYyAgICAg
ICAgICAgICAgICAgIHwgMjA2ICsrKysrKw0KPiBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQu
YyAgICAgICAgICAgICAgICAgfCAzMDMgKysrKysrKysrDQo+IGRyaXZlcnMvaGlkL2hpZC1tdWx0
aXRvdWNoLmMgICAgICAgICAgICAgICAgICB8ICA2MCArLQ0KPiBkcml2ZXJzL2hpZC9oaWQtcXVp
cmtzLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0NCj4gaW5jbHVkZS9kcm0vZHJtX2Zv
cm1hdF9oZWxwZXIuaCAgICAgICAgICAgICAgIHwgICAzICsNCj4gMTQgZmlsZXMgY2hhbmdlZCwg
MTM4NSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZHJpdmVyLWhpZC1hcHBsZXRiLWtiZA0K
PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3RpbnkvYXBwbGV0YmRybS5jDQo+
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1ibC5jDQo+IGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQuYw0KPiANCj4gLS0gDQo+
IDIuMzkuMyAoQXBwbGUgR2l0LTE0NikNCj4gDQoNCg==
