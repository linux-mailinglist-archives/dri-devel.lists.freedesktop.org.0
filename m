Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D7398894C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 18:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5752F10ECEC;
	Fri, 27 Sep 2024 16:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="fORN+1Gp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2022.outbound.protection.outlook.com [40.92.103.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B55510E224
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 16:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvSLZHNfNf2eAJgE+NYDkqkSEANKksnsDcVuCNjYr+87HFls/3ZY8tcKI3214ibOMSVj70IXUpB3lkGUPnrhuUkwoYPu9ECxvZDBHKge6Sth0nX7qufQxMdNW6Pcq+gvzo7ZhgUNkmzfAZDuapnbc+IlXJFPjIx4movgVA8XYh0+QOJkJUS2VjH0yOHAosHBBYhnXQhE6Fbs1FzeKItYdWD+A8/44hoYP00mopnFrQ0NiVxAdlFjsFZj6aocc731DawTVwIYOr3mC/GCr9TQz1WfxwXUY2eZ1nJjjc28zGoRdxmeTjEVeoKrayrd37NijoWPxWuhdKDwjaOPYjE8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYsdJe+QYOt1jMxj5zPOk44TMMZZZO8RLLHfku8yH14=;
 b=L9D+H6VemqU9hbP/dj99/cg5WJf9j6vHkm1LL36w1XczK2PRtwPSDaaM5HnesB++yWdL/A09ZQFmEpBrPAr9TeHELs+gM/2fRNbM2LLaIgaDNRN4lQ61ZDFYCoFLKAsnMmw2x40TExM0Bn/0uCS8Eo90UGlroBgfOq+4FwlT/7QV4UQMb4HLZh8r8lNbtqstK+2VvlqyEc6NyD3TPgG0ViWoc/rrcw8Q300Juf0TvvNvh5OYxbSFVHjpDK0t4uJdynoStadBVPrfWbiiDJbKx/130CBFzuOkaOHaYNqVOoCxsNPR5V0wBHGJVvz9DnZUQdvIABd/520mVaULlSKNpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYsdJe+QYOt1jMxj5zPOk44TMMZZZO8RLLHfku8yH14=;
 b=fORN+1Gpj6OcEU3n7nKOY9oEn79fefUH/T0sI/dien1Jbtm2SIuTOCzDdqVvxPYNtKK002wus2EQAnuKPHntX5NuVrbsTmRC8JJZjHXYEcBE8oddeMGqzBumTIriVThDZHMq7n3MIg59wzQFnL2RruxvXx9P6+/9tgkRpGnqXtAQftGlnfCUnwX47b/5833q3voy7HjjttBGaIl5sbLhpVLe9DFy5aP1C0ZKoukWL2HBP4UvlhVtorzs1NTlcp+d4xkhbqe8MvcMZVMYMleYS8DQlPE9RrsBNmnMO/IhwNnI1DaXMgGdZs06C/pKgf5KwpTKKC8qs3SF/LNbzW71Xg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB0386.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d7::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.22; Fri, 27 Sep 2024 16:48:23 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 16:48:23 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "mripard@kernel.org" <mripard@kernel.org>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
 =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <thomas@t-8ch.de>, Orlando Chamberlain
 <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 10/10] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v5 10/10] drm/tiny: add driver for Apple Touch Bars in
 x86 Macs
Thread-Index: AQHa8JvrscgdqA2wlUu74jjWDGz2sbJrgEoAgACYjIA=
Date: Fri, 27 Sep 2024 16:48:23 +0000
Message-ID: <3A637158-BA4B-49F5-8119-337FAC944915@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <3C9E8938-32EC-44AC-A783-3BFDE2F01290@live.com>
 <rq3gcr7y2eygp7gifzivxvrj3tzd7ouexz36aeluxjoufs6k6c@kulq7plg52vi>
In-Reply-To: <rq3gcr7y2eygp7gifzivxvrj3tzd7ouexz36aeluxjoufs6k6c@kulq7plg52vi>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB0386:EE_
x-ms-office365-filtering-correlation-id: f6251039-6e36-4157-2877-08dcdf143336
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|7092599003|8060799006|8062599003|461199028|19110799003|1602099012|102099032|10035399004|4302099013|440099028|3412199025;
x-microsoft-antispam-message-info: JlgJbBzGXEJdKb46TIT5OHzvTmNm+jciM+rh15RIOwYekl8hQ0LixM84Ejd6mEGmphX1TsYEuz0gOVecQpxW79VujhlSSwkMKb4PwBtW7IfBd/yoiX5VFldsl8pgsOrT1as3CpBMA16006XC9Wk1uRKRWovioiv9dhTnGUxsRRbPTW6472YXwJJK6gYyFHvUDjIIaqMMLXin6CQZV5aafHo5Zjta6mi/mqY3x7BZLQUE4xcAmbByJAi49bY2XZqY1ofbnFa23ISNJt87ZyeEJ1L8nWpG2c0wPpDBURMtQZHLTo6zoZPhvy6Sy17yLStx3SA+GxdDX6G22QkGPp7hmnj6XbsniKYA/Gwe1mIFyKXiHxY7CheFgykww252QpOyvQX5nhjJl6JC766Imt5kctmrJd3nO2ZsDZzwfsWt3Im+DYhfMXPmO6VqqBghMbTWMP93FzC6qdON4Zs3TwR5jJGMVdiinxDhGs53yKhqoKnZ+4p0rKi8aw2P3Q8QuRyWEzfEEMhFmL/MCW1skiG6jKJKs2zWFRb/ZwDIHqjMAwgrwxELpmOnr5bJ/nzflhijvaS/vtxYJSes1A5UeeYSGT0zuiv9q5tA9LcnrxMySj29Hm62kYF02vjy6CSWHL+YAjvav1Vfk5pfcgeWH84aTCsEqfUjEtx8668Rca33/ZD0/7Jl/W+9IGUk5WfAjD3ih9nfBS+m3Wd3IJi6L/cIgNH1MlVNG3wTdcppF0sIBcLWRu+l08isTrvEvDnTPu0ZR6B7mQ/CJamuTzAgJyGoZuZHTFX//wvltdRAxrMfAZDkG/n3YR3wJuLsRndMiRdaZU6HMdNZPcaO+c2TC1DlGowPpI7WZzC5xTuJ+yz8D5oLJ0Zi7twG6RuzDSTHqxM1
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzJxY1kwVTNMbHRtYnRTcndSZnFTNU1TbGJ1aEFOUkVsRjcyS1N5WFc2Vzk4?=
 =?utf-8?B?QmNXL1JTYnJNSExnR0Y5c0NCanppVWxKQTNrZG1GUDMyRHRPa1c3a0JoOUp4?=
 =?utf-8?B?QUJheDdJSnhnUnZJc09GbFBJcUorWVZRY1Z3aHJieVlIejJDUjlaQWFJQzlu?=
 =?utf-8?B?K0ZDVk5Talo1SnRjQjdkTVN5a3dRektaWW0vQ1NvbFV3cW9aM3ZhY1Btbm51?=
 =?utf-8?B?Mi8rdXlvaXc4citudklxVEhqSUQ3S1ZOYlp4eXVFYTBoUlpvRTJIT3lEY01l?=
 =?utf-8?B?eDVyQXJIVnpsbWR1U3NMVlo4TjNucFo1ZUJJYXh6cVptb0RReHBSbzhHR0s2?=
 =?utf-8?B?d2NSWWFzLzVyY3ErZ3lmL0tvc3U5dmZ5RFNKUU12TmJmUXVMaHRKVFZ6NFI5?=
 =?utf-8?B?L1JnS2l5MWFQb0F3YWhhNDN6Y3IvajJidXJsbElNa3dQZ0FPM0x5a01zMW1p?=
 =?utf-8?B?NlVCVkFnczJhQXVISHRjb2RhOUFkd2xuSWNaOXhwY3gvdzJ4MVAreHV1N2Zx?=
 =?utf-8?B?aHJrbVkydUtqdXpFZUNnTnk0OFNRc1F3dGxERUExRkszOWFEeFdQMjYzN0JX?=
 =?utf-8?B?ZUlZclVuTG9SczZPTmV3NmhvV2pzS3Y5bXNLZFEremJWd2FVSyt2VG8rYlF5?=
 =?utf-8?B?NU9aSnkwU0luTnRsaEE1SmZQMTc2TWdhWnB2eENpOEE5MjlmRlR3WStRcnRU?=
 =?utf-8?B?dnBZVGErbnVHTU1LSjJTN3BPbS83QjgraWJydGJpcGdTVHRhMGhDbHlPS2pi?=
 =?utf-8?B?UTRSeVJzN3BDYmdIK1p0ZWNCNXpDRUxZOWhPcW1xRlRwcHR3YW5QUUFOOHF1?=
 =?utf-8?B?UTdieVpyQVJSMU9hZEJId3JSS3NhRTI1NGQ5azRTUG9hUG5ibGRCZjlxbktk?=
 =?utf-8?B?NHE0UnFkRi95U3BmZlErVGc4NFBkdHBWZ09GRGNCUHRCRVlmbEpUVXhJZHN1?=
 =?utf-8?B?TCtTcmg5aC9GaGpidFB0ZWI0ODV2VkFGUDYrK3A2ek1vVkswVmZ6SHJOVW1Y?=
 =?utf-8?B?aHBvNWhKbjhHbnY2RUw4b3hhMlk3eGd2R21jbE92d1I3MHVlZGFIN0ZUbndz?=
 =?utf-8?B?RUg0NFR6empEQXFjS0x2REhxczJQaEUvMHNzNkJyci9JY0djSS9WUjhzUWVC?=
 =?utf-8?B?TXVpZVg4NUxnRzF2Z2sxVXNyc3AydnhjN3E3dm85czFXNjF1WU9IazBFVmsr?=
 =?utf-8?B?b1pUT0JvSzR5SWN1Y3pHYXo2UlNhS0lEZzQyTkF5aW9sRlRBQ2ZtNDdVWlZH?=
 =?utf-8?B?VkJMS2M1TzNMeVF0ckJUMnJSa1RVd1R6MTRoMHpzVUFFRk02MlYzT1hIa2p0?=
 =?utf-8?B?WlJIQUVUUHg5dU0waFFyYVR2WndYWi9BUDJTK09YWjgrOUZjWVA4b0NmNi9F?=
 =?utf-8?B?VUtDRUNjajNlUDloMnZKWkZPaFBocjdXZlgyaXcvRytnRmZGU3FVUmtGcGdy?=
 =?utf-8?B?cmZWUTV2NCt5eFNOMkoxT3lNZVNNWnRRNXVmeG1oVWNVd0h2VVM1eWIxc2dt?=
 =?utf-8?B?VjBsS0Z0aENmZFRwNWlnbFpUL1gyL2RHMllZODFvdTBGSVk0Y0U5REJsN3Mw?=
 =?utf-8?B?VzZHZnEzSVUxdlZNMGhBSTc1Z3M2a1RpNlllSzdrRTNnT2xlaXZicDI2U1Zr?=
 =?utf-8?B?akp6bWZjU2cvYWszRWMrcDNDZVNNeEUwejRkMUtLRm02V2pWMVVOeHBxSzNi?=
 =?utf-8?B?Z21hc01Ed3Y0bDBVejlha01zV0N6ZU5BaUM1ZXpIdVNNUkpPQkFVZkVzS0F6?=
 =?utf-8?Q?hG94XmTFMySQPBK42z5iAmkuw+qntFPWFo3I7EB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <363371DE72348D4BBAF63FC42DA0CC65@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f6251039-6e36-4157-2877-08dcdf143336
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 16:48:23.0819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0386
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

DQoNCj4gT24gMjcgU2VwIDIwMjQsIGF0IDE6MTLigK9QTSwgbXJpcGFyZEBrZXJuZWwub3JnIHdy
b3RlOg0KPiANCj4gT24gU2F0LCBBdWcgMTcsIDIwMjQgYXQgMTE6NTI6MjJBTSBHTVQsIEFkaXR5
YSBHYXJnIHdyb3RlOg0KPj4gRnJvbTogS2VyZW0gS2FyYWJheSA8a2VrcmJ5QGdtYWlsLmNvbT4N
Cj4+IA0KPj4gVGhlIFRvdWNoIEJhcnMgZm91bmQgb24geDg2IE1hY3Mgc3VwcG9ydCB0d28gVVNC
IGNvbmZpZ3VyYXRpb25zOiBvbmUNCj4+IHdoZXJlIHRoZSBkZXZpY2UgcHJlc2VudHMgaXRzZWxm
IGFzIGEgSElEIGtleWJvYXJkIGFuZCBjYW4gZGlzcGxheQ0KPj4gcHJlZGVmaW5lZCBzZXRzIG9m
IGtleXMsIGFuZCBvbmUgd2hlcmUgdGhlIG9wZXJhdGluZyBzeXN0ZW0gaGFzIGZ1bGwNCj4+IGNv
bnRyb2wgb3ZlciB3aGF0IGlzIGRpc3BsYXllZC4gVGhpcyBjb21taXQgYWRkcyBzdXBwb3J0IGZv
ciB0aGUgZGlzcGxheQ0KPj4gZnVuY3Rpb25hbGl0eSBvZiB0aGUgc2Vjb25kIGNvbmZpZ3VyYXRp
b24uDQo+PiANCj4+IE5vdGUgdGhhdCB0aGlzIGRyaXZlciBoYXMgb25seSBiZWVuIHRlc3RlZCBv
biBUMiBNYWNzLCBhbmQgb25seSBpbmNsdWRlcw0KPj4gdGhlIFVTQiBkZXZpY2UgSUQgZm9yIHRo
ZXNlIGRldmljZXMuIFRlc3Rpbmcgb24gVDEgTWFjcyB3b3VsZCBiZQ0KPj4gYXBwcmVjaWF0ZWQu
DQo+PiANCj4+IENyZWRpdCBnb2VzIHRvIEBpbWJ1c2h1byBvbiBHaXRIdWIgZm9yIHJldmVyc2Ug
ZW5naW5lZXJpbmcgbW9zdCBvZiB0aGUNCj4+IHByb3RvY29sLg0KPj4gDQo+PiBTaWduZWQtb2Zm
LWJ5OiBLZXJlbSBLYXJhYmF5IDxrZWtyYnlAZ21haWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTog
QWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4+IC0tLQ0KPj4gTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsNCj4+IGRyaXZlcnMvZ3B1L2RybS90aW55
L0tjb25maWcgICAgICB8ICAxMiArDQo+PiBkcml2ZXJzL2dwdS9kcm0vdGlueS9NYWtlZmlsZSAg
ICAgfCAgIDEgKw0KPj4gZHJpdmVycy9ncHUvZHJtL3RpbnkvYXBwbGV0YmRybS5jIHwgNjI0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gNCBmaWxlcyBjaGFuZ2VkLCA2NDMgaW5z
ZXJ0aW9ucygrKQ0KPj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS90aW55L2Fw
cGxldGJkcm0uYw0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVS
Uw0KPj4gaW5kZXggODc2NmYzZTVlLi4yNjY1ZTZjNTcgMTAwNjQ0DQo+PiAtLS0gYS9NQUlOVEFJ
TkVSUw0KPj4gKysrIGIvTUFJTlRBSU5FUlMNCj4+IEBAIC02ODg5LDYgKzY4ODksMTIgQEAgUzog
U3VwcG9ydGVkDQo+PiBUOiBnaXQgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9t
aXNjL2tlcm5lbC5naXQNCj4+IEY6IGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aSoNCj4+IA0K
Pj4gK0RSTSBEUklWRVIgRk9SIEFQUExFIFRPVUNIIEJBUlMNCj4+ICtNOiBLZXJlbSBLYXJhYmF5
IDxrZWtyYnlAZ21haWwuY29tPg0KPj4gK0w6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4+ICtTOiBNYWludGFpbmVkDQo+PiArRjogZHJpdmVycy9ncHUvZHJtL3RpbnkvYXBwbGV0
YmRybS5jDQoNCkhpIE1heGltZQ0KDQo+IA0KPiBIb3cgZG8geW91IHBsYW4gb24gbWFpbnRhaW5p
bmcgaXQ/IElmIHlvdSB3YW50IHRvIGRvIHNvIHRocm91Z2ggZHJtLW1pc2MNCj4gKGFuZCB5b3Ug
c2hvdWxkKSwgeW91IG5lZWQgdG8gbGlzdCB0aGUgZ2l0bGFiIHJlcG8gaGVyZS4NCg0KU29ycnkg
Zm9yIHRoZSBvdmVyc2lnaHQuIEluZGVlZCB0aGUgbWFpbnRhaW5lciBuZWVkcyB0byBiZSBjaGFu
Z2VkIGhlcmUsIHNpbmNlIEtlcmVtIGlzIG5vIGxvbmdlciBhY3RpdmUgb24gdDJsaW51eCwgdGhl
IG9yZ2FuaXNhdGlvbiBJIGFtIHdvcmtpbmcgd2l0aC4NCg0KSWYgYSBtYWludGFpbmVyIGlzIHJl
YWxseSBuZWVkZWQsIEnigJltIGZpbmUgd2l0aCB0YWtpbmcgdGhlIHJvbGUuIEkgY2FuIGFsc28g
cmVxdWVzdCBvdGhlciBwZW9wbGUgZnJvbSB0MmxpbnV4IHRvIHRha2UgdXAgdGhlIHJvbGUgYXMg
d2VsbC4gSWYgaXRzIG9wdGlvbmFsLCBJ4oCZbGwgcmVtb3ZlIGl0DQo+IA0KPiBBbHNvLCBJIGhh
dmVuJ3Qgc2VlbiBLZXJlbSB0YWtlIHBhcnQgb2YgdGhlIGRpc2N1c3Npb24gYXQgYWxsLiBBcmUg
dGhleQ0KPiBvayB3aXRoIHRha2luZyBvbiB0aGUgbWFpbnRhaW5lcidzIHJvbGU/DQo+IA0KPiBJ
dCdzIHJlYWxseSBjbGVhciB0byBtZSBlaXRoZXIgd2h5IHRoaXMgbmVlZHMgdG8gYmUgZ29pbmcg
dGhyb3VnaCBoaWQgYXQNCj4gYWxsLiBJcyBpdCBub3Qgc3RhbmRhbG9uZT8NCg0KVGhlIGhpZCBw
YXRjaHNldCBoYXMgdmFyaW91cyBwYXRjaGVzIHRvIGhpZC1tdWx0aXRvdWNoIHdpdGggYXJlIG5l
ZWRlZCBhbG9uZyB3aXRoIHRoZSBkcm0gZHJpdmVyLg0KDQpUaGFua3MNCkFkaXR5YQ0KDQoNCg==
