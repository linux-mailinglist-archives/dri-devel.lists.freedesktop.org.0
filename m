Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895B9872405
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 17:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B62111240B;
	Tue,  5 Mar 2024 16:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="Ne3XjBWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11olkn2010.outbound.protection.outlook.com [40.92.20.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193D211240B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 16:23:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eii4+Zz4BFowYX8GVUMdXDJXBFfB8lQIR5aw0YIth4RGU10nfyOOmoLtO/CIWSg516cLeLqPcPy1C/w9YXIVZSSKLI7MqOaXBuevx7ojfx4TCAFwILKeR4wdDzXMVE2liaM3LdnK++ds2E4RZjUsMSKilqWjja1dCuw3rbpYxul0OqxdMg1XLN2QcvFqoDPUBCmjo6vaNpPLcc+O9uuKgF5hDhu6wDBwG3/mN0ZK3puSROikRIRiA87J61Bq4Lmj2XvjDwXImKKqmIYeuWtwDwCGtzuNz40pn4w8wKXgbXrZMBI6DYLhWUPRR9B5bsFVSo+UNsnBIOeDYhCGzupMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPktfKQSQAhVzKW+fbnL05NBszRecILRCviqKE9rMbI=;
 b=B2bTrWY7SAjsnaiRl9typk/msdxYMY1Qb98G9WXqonBGjpjbnXnTMu92Y6yyhGJQe44mizaepGu+oGyXUpf5kV1eZZmweGqzFmMocbdjAQgOppv1eMC74eJ/GmpTsfwlc32RBUXJp517liAgguK9YYOxYVpgm6YcSqT/MQ/bVV8+/1CXu7701WBorwqdwy64//vWsEon2LF7YLgs3ZLVU1AjNgOIOr03uSQiqIVUImIPRgdQ413uAJWPzeKqOxaaUi2DNW2w53BagpDsV2l1ior8REfyRnBnRZydJTNeSHhBJ9ZKiSvLYwZ48eC8+qlL+ZO7Wif/z7dSmjAHX6uB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPktfKQSQAhVzKW+fbnL05NBszRecILRCviqKE9rMbI=;
 b=Ne3XjBWbeEW1ZAXs8+CQzpjMEj0ngy9a0ONhgSISYTAuh1/Y3yZYspSlSqicqIpF//MknnWUTG2g5ou9DA9ZRN7M9gV5iZEmzhcDmrViHQXrb+mtGlhEh3ApEIQwKhKvj9CihO+ylqQzv0a1si+fAviZVqrmoxZvHIYRMGGuitYUNcfF0y1wCVSnDeBQQy7ffUGbWjRNRhYCy87dxFF7HXFhj5ggv1jI8DUgj2vEE8aIyQr5STfFlgfGlK/zzr3A7SX4dcJ1fR3w1d0A1ud7A1cVati088+vvbvObJQwm7u/bGyB/peACMU3ibf4X73yN495u1shTTUbAGcT99HefA==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by BY5PR02MB7089.namprd02.prod.outlook.com (2603:10b6:a03:238::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 16:23:08 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd%5]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 16:23:08 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, John Ogness
 <john.ogness@linutronix.de>, Jocelyn Falempe <jfalempe@redhat.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Vetter
 <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>, "Peter Zijlstra
 (Intel)" <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Kefeng Wang <wangkefeng.wang@huawei.com>, Lukas
 Wunner <lukas@wunner.de>, Uros Bizjak <ubizjak@gmail.com>, Petr Mladek
 <pmladek@suse.com>, Daniel Thompson <daniel.thompson@linaro.org>, Douglas
 Anderson <dianders@chromium.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, David
 Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: RE: [RFC] How to test panic handlers, without crashing the kernel
Thread-Topic: [RFC] How to test panic handlers, without crashing the kernel
Thread-Index: AQHaa8nPQ+IlvdtNEEeAC9DI6HKUj7EoGboAgAAIk4CAATYNgA==
Date: Tue, 5 Mar 2024 16:23:07 +0000
Message-ID: <SN6PR02MB4157AF2E765F7ED3B9487351D4222@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <266579a9-fde6-40ff-b13d-fb2312db406c@redhat.com>
 <87edcpn1l3.fsf@jogness.linutronix.de>
 <15015345-3068-2fb8-aa38-f32acf27e1d0@igalia.com>
In-Reply-To: <15015345-3068-2fb8-aa38-f32acf27e1d0@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [xCpC5RLfe+/OJOJ5/WxtOw==]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|BY5PR02MB7089:EE_
x-ms-office365-filtering-correlation-id: 21698ce2-4163-4393-d87b-08dc3d308b0d
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5V8Qhf/zlzvBuyQ4IxmyWAZ6RbeYEKRDtNF3mYGIfyERRXTpFhpOnX4IVY7HqeowaMURPXDA25exaNeqnhhLtG/0bXxnDPP4YmYKuLL1vqihQaDgkrb+Hv/jg8/V3ZmzjmUjpvZvy7jKpJ+Tn6qSSTt+9dsd/PPF8ry0p3GyiamKC3acrgpGHGs16n2IMgSlIMlqvoUY+IAoPpMPSH2UNbWDiVGXjGcXdm/nY1sszVXRmORDEBcghIINOyS6vaVfLfgepxU1Bg8agtSFOZccu7kybh1mLP6EgDewGHMqTpsMkL2+HB/itB0p40X7dm11NqORdmd8TfYvgIyTG6SnfkiPIsVDSyClBhIjkpe9LRVkKuDefN6IE4SuEIIlwrM2aZ7PkBAcbvgDZB1xnEWx4aGrOgDectA8qwcwYngce1hyKhLm+pCuYVt5vsgpdkavx6vK8i79bR+6e7abD8cXTHNKsDKsTov8IG17sftEpCY38qmxs2a7l8HYNW+5xhnB2R5OB7N2PZzITZFqoomuLbc2AuQHSo2gdJ9X9o+EqSA20z+9e855Qq+RYbDbox8m
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTRzLzVzbmFHd01IS3dySGQ5M3JRUGRoczZGQ21FdFJweGVoUVBPVmxlNndk?=
 =?utf-8?B?bEttZEZLb3VEM0hPUHlxbitBYXBReVRPNkl6RE5qYitQaFBZUlpmZ1ljdkdN?=
 =?utf-8?B?UktEMXRFZmRFOWZqeTBFQVVwS2E4RlRmbWFqRVVIa3ZTYWRVbGhGd211MUZw?=
 =?utf-8?B?V0pNeDNJWGVLVWZScDVTWE5MVW9Db1FZLzgzT3Y3ME5iRzVVOXNrVkpITjhy?=
 =?utf-8?B?ZlRkVG1IVTZXVjlHR2pNSkZZT1J5VTd2eHV4NVQ0aHdFb3dFVGFONktkVy9P?=
 =?utf-8?B?NGtYdXJCQ1JhVlU5R3I0TFRic21nOUowNmVlbWxma0N6eDNXdXlBNGhvTSsw?=
 =?utf-8?B?OENNLzhBUml2Y3RnNEhvcHI5M0dlMk1oTDB1eUhUNXBNWXR3cFNRSU9Mb1Ev?=
 =?utf-8?B?ZVJ3dWZCdjlFWCtuYUd5K1FVN3RhaDQxMnlJVlV3SHphb3QrdURpUkVDYlFE?=
 =?utf-8?B?eWh4UUY1aHByMEFDRExKc3VKT1NwWThIcEtrMWVRc2FHTU5teVR4SXdBUWtl?=
 =?utf-8?B?L3JtYnZZdHJUZThNQTdVTi94OFFpWXhEWUgyTUNZL1JNRkpLVDdqOEZwbnhU?=
 =?utf-8?B?dWt1VktxV1p5RUZhamxEUmZFelhjeHd3QmRaNGVzZFZudWcvU29KL1BTdHht?=
 =?utf-8?B?WlZTeXZaRTVUMGsvbWorTnFraGVZRERicmNPbDJSZXhSY3h0Zjd1VzZoZjVP?=
 =?utf-8?B?dDd4R1dPUHVuUGdDM28vcHF0cVhrSDIxUWw2disxNWRCNVNVTklzVkcrRFJr?=
 =?utf-8?B?SmRqeXp6OG1jTWV4SVFhODgvUFZHQ01vdVZndnV3KzRZc2s5WjdDcWdrMzFK?=
 =?utf-8?B?d0JhdU00NGg1NFEzMFc2S2FiZ3JCZEJESW04V21HSlU4ZlBBMnkrZnFBdFU2?=
 =?utf-8?B?Nm9CN2dYUEd2UHpHVE84TnI2OWFZOGZQUUJFZUMyaWdvV1dpTnhleUN5S29k?=
 =?utf-8?B?UFI1WSt3SENXcmd2V3dnR01Ic3ZwN0RvSUlIRjAwbUxzV0lDOTduMjJVMVBa?=
 =?utf-8?B?WnJYaTN5SnBVTlpHZkZqVUhKUnlxbU1ibHc1QSt0NTdoWENOZFZVN2Jwb2ZT?=
 =?utf-8?B?anJrczk1M1hnekhEYjlqQmM3emtsTE1haFRNMlcxYi9SYU5UVk9OdTlGdVRn?=
 =?utf-8?B?dWpxVjBOVjVwR2JvU1kzeGNTbFprMEszK0N6THRYOFFPUVk2c05tdmpHNVc1?=
 =?utf-8?B?Z1VrZ0lYWkI4bmZDNENJQUhaTW42djVaRlhlN2lMYW1kalJEYXBPdWtYeDBI?=
 =?utf-8?B?eEFNMkowenNkemtnSVFNRHRZbnpaby91d2pvZFJyRzJ1S05Nb2NHdnNxaVQ5?=
 =?utf-8?B?SWlhem5oRFN2YlJzWnVyRUkzVno4aUFSbXdqZHVKU3krTlR1aFpraTJDMUZH?=
 =?utf-8?B?NDFWcE1yQjJaK3VoYzkzWS9rcVAxSDd2QjJOUkR1MUZvWTBVVHNDaCtGRy9k?=
 =?utf-8?B?TUZwZ3RyMlNBc3dwSkh1WXZMT0MvQWNrekQrNDM5NkRDOVc4NEZTbk9xVVBD?=
 =?utf-8?B?SWdwalVpbmR6NlpCVEp2R2tRdTJYMnZ5UW5ab3FwRkVaZVZkVndCNlVTUW9t?=
 =?utf-8?Q?XVdhvoSIVYz/uTwipNP6hP31267I2sJHcVx3JHwpJCyMhU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 21698ce2-4163-4393-d87b-08dc3d308b0d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 16:23:08.0079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7089
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

RnJvbTogR3VpbGhlcm1lIEcuIFBpY2NvbGkgPGdwaWNjb2xpQGlnYWxpYS5jb20+IFNlbnQ6IE1v
bmRheSwgTWFyY2ggNCwgMjAyNCAxOjQzIFBNDQo+IA0KPiBPbiAwNC8wMy8yMDI0IDE4OjEyLCBK
b2huIE9nbmVzcyB3cm90ZToNCj4gPiBbLi4uXQ0KPiA+PiBUaGUgc2Vjb25kIHF1ZXN0aW9uIGlz
IGhvdyB0byBzaW11bGF0ZSBhIHBhbmljIGNvbnRleHQgaW4gYQ0KPiA+PiBub24tZGVzdHJ1Y3Rp
dmUgd2F5LCBzbyB3ZSBjYW4gdGVzdCB0aGUgcGFuaWMgbm90aWZpZXJzIGluIENJLCB3aXRob3V0
DQo+ID4+IGNyYXNoaW5nIHRoZSBtYWNoaW5lLg0KPiA+DQo+ID4gSSdtIHdvbmRlcmluZyBpZiBh
ICJmYWtlIHBhbmljIiBjYW4gYmUgaW1wbGVtZW50ZWQgdGhhdCBxdWllc2NlcyBhbGwgdGhlDQo+
ID4gb3RoZXIgQ1BVcyB2aWEgTk1JIChzaW1pbGFyIHRvIGtkYikgYW5kIHRoZW4gY2FsbHMgdGhl
IHBhbmljDQo+ID4gbm90aWZpZXJzLiBBbmQgZmluYWxseSByZWxlYXNlcyBldmVyeXRoaW5nIGJh
Y2sgdG8gbm9ybWFsLiBUaGF0IG1pZ2h0DQo+ID4gcHJvZHVjZSBhIGZhaXJseSByZWFsaXN0aWMg
cGFuaWMgc2l0dWF0aW9uIGFuZCBzaG91bGQgYmUgZmFpcmx5DQo+ID4gbm9uLWRlc3RydWN0aXZl
IChkZXBlbmRpbmcgb24gd2hhdCB0aGUgbm90aWZpZXJzIGRvIGFuZCBob3cgbG9uZyB0aGV5DQo+
ID4gdGFrZSkuDQo+ID4NCj4gDQo+IEhpIEpvY2VseW4gLyBKb2huLA0KPiANCj4gb25lIGNvbmNl
cm4gaGVyZSBpcyB0aGF0IHRoZSBwYW5pYyBub3RpZmllcnMgYXJlIGtpbmQgb2YgYSBubyBtYW4n
cw0KPiBsYW5kLCBzbyB3ZSBjYW4gaGF2ZSB2ZXJ5IHNpbXBsZSAvIHNhZmUgb25lcywgd2hpbGUg
b3RoZXJzIGFyZQ0KPiBkZXN0cnVjdGl2ZSBpbiBuYXR1cmUuDQo+IA0KPiBBbiBleGFtcGxlIG9m
IGEgZ29vZCBiZWhhdmluZyBub3RpZmllciB0aGF0IGlzIGRlc3RydWN0aXZlIGlzIHRoZQ0KPiBI
eXBlci1WIG9uZSwgdGhhdCBkZXN0cm95cyBhbiBlc3NlbnRpYWwgaG9zdC1ndWVzdCBpbnRlcmZh
Y2UgKGNhbGxlZA0KPiAidm1idXMgY29ubmVjdGlvbiIpLiBXaGF0IGhhcHBlbnMgaWYgd2UgdHJp
Z2dlciB0aGlzIG9uZSBqdXN0IGZvcg0KPiB0ZXN0aW5nIHB1cnBvc2VzIGluIGEgZGVidWdmcyBp
bnRlcmZhY2U/IExpa2VseSB0aGUgZ3Vlc3Qgd291bGQgZGllLi4uDQo+IA0KPiBbK0NDaW5nIE1p
Y2hhZWwgS2VsbGV5IGhlcmUgc2luY2UgaGUgc2VlbXMgaW50ZXJlc3RlZCBpbiBwYW5pYyBhbmQg
aXMNCj4gYWxzbyBleHBlcnQgaW4gSHlwZXItViwganVzdCBpbiBjYXNlIG15IGV4YW1wbGUgaXMg
Ym9ndXMuXQ0KDQpUaGUgSHlwZXItViBleGFtcGxlIGlzIHZhbGlkLiBBZnRlciBodl9wYW5pY192
bWJ1c191bmxvYWQoKQ0KaXMgY2FsbGVkLCB0aGUgVk0gd29uJ3QgYmUgYWJsZSB0byBkbyBhbnkg
ZGlzaywgbmV0d29yaywgb3IgZ3JhcGhpY3MNCmZyYW1lIGJ1ZmZlciBJL08uIFRoZXJlJ3Mgbm8g
cmVjb3Zlcnkgc2hvcnQgb2YgcmVzdGFydGluZyB0aGUgVk0uDQoNCk1pY2hhZWwNCg0KW0kgaGF2
ZSByZXRpcmVkIGZyb20gTWljcm9zb2Z0LiAgSSdtIHN0aWxsIG9jY2FzaW9uYWxseSBjb250cmli
dXRpbmcNCnRvIExpbnV4IGtlcm5lbCB3b3JrIHdpdGggZW1haWwgbWhrbGludXhAb3V0bG9vay5j
b20uXQ0KDQo+IA0KPiBTbywgbWF5YmUgdGhlIHByb2JsZW0gY291bGQgYmUgc3BsaXQgaW4gMjog
dGhlIG5vbi1ub3RpZmllcnMgcG9ydGlvbiBvZg0KPiB0aGUgcGFuaWMgcGF0aCwgYW5kIHRoZSB0
aGUgbm90aWZpZXJzOyBtYXliZSByZXN0cmljdGluZyB0aGUgbm90aWZpZXJzDQo+IHlvdSdkIHJ1
biBpcyBhIHdheSB0byBjaXJjdW12ZW50IHRoZSByaXNrcywgbGlrZSBpZiB5b3UgY291bGQgcGFz
cyBhDQo+IGxpc3Qgb2YgdGhlIHNwZWNpZmljIG5vdGlmaWVycyB5b3UgYWltIHRvIHRlc3QsIHRo
aXMgY291bGQgYmUNCj4gaW50ZXJlc3RpbmcuIExldCdzIHNlZSB3aGF0IHRoZSBvdGhlcnMgdGhp
bmsgYW5kIHRoYW5rcyBmb3IgeW91ciB3b3JrIGluDQo+IHRoZSBEUk0gcGFuaWMgbm90aWZpZXIg
PSkNCj4gDQo+IENoZWVycywNCj4gDQo+IA0KPiBHdWlsaGVybWUNCg0K
