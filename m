Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995D8896BB2
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD3810FE00;
	Wed,  3 Apr 2024 10:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=armchina.partner.onmschina.cn header.i=@armchina.partner.onmschina.cn header.b="SeJrnFQo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn
 [139.219.146.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098F910FE00
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:09:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2u/3Dhq809ooSZoavzr4mpDgxyeYi/Ei4qUTYWm3wSnP9sjOmS4LIZAFfeqJ6KfU7d+KH3MaQvxs5c7aAY536VaDfIiu18iyYiTofonm1hkinciz/rX6uecPL+xN6ONbA89q7VjWLaX3wk0wZW+xqH6HEzqW8gYWMuSoXhvcVrXgoO6nBpBgw+en58LhJmt9hHBHJ0ceFbqilbDM4Cm22Z5dxkWkPMq809/ZDAB+oEthMNLynUPQMc8MbV+hYYn4Lyjv4SQ4InXQb9QRVEwp45uLoYFBUOsFON/SKgjXCPlRtgvVBg//cqs+Etabce5lCiBL1fLVLWhDJeVMRQDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXQd47dgVlCDyeQ80I4RhS2yjfSICBMxzlctugizc1o=;
 b=Dm1yhV7wMprCcQ5ivye77FqSV1KNPIMoPJ7Z0cZsdd4p7lpsfqtUb/OSI8CIkviounuYjOg4QS/rq0VhwL9SXAYG5rNSm/gKrd8nwdr2AsoRKyydNeDKKY+u1pJN+WVU/eCU0ahjSa9XGOwCsntU0KeXEhWfdxAEZpa2MelgEcyqw2vWFdpR9n3AswEN+H6zyN19bjW5YULhdLzWeo7LBiiZRXvjGbXTCjkZekzOGUbVStnY3kiWXIxUF28lkAZ5STOy8rhtAcf1TiJM0NMmS6A9PVFGFFVwoCrkczHnYUS8HQexk+Cxlx0J/Zgd/nh5259f2MmT1hdtVNTfNVc1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=armchina.com; dmarc=pass action=none header.from=armchina.com;
 dkim=pass header.d=armchina.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armchina.partner.onmschina.cn; s=selector1-armchina-partner-onmschina-cn;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXQd47dgVlCDyeQ80I4RhS2yjfSICBMxzlctugizc1o=;
 b=SeJrnFQoR1KeECIZD2MZ3gFj7ur3DjUZ5AAMHue1I8jkMm8TtkG1y/WSQgOdbrLzXNyEcfMkPHtbNgss3132AaP3q3AoXioJm7Oh45+8ZoXh5POojqMUGK6j1gUhV1wZHo3rt0mGxqgInOnAEmAkRG9njr8S5klXfATG/Bxvikw=
Received: from SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn (10.43.108.74) by
 SH0PR01MB0556.CHNPR01.prod.partner.outlook.cn (10.43.108.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Wed, 3 Apr 2024 10:09:53 +0000
Received: from SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
 ([fe80::a8b:92ae:1d6e:9206]) by SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
 ([fe80::a8b:92ae:1d6e:9206%6]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 10:09:53 +0000
From: Dejia Shang <Dejia.Shang@armchina.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
CC: "ogabbay@kernel.org" <ogabbay@kernel.org>, "airlied@redhat.com"
 <airlied@redhat.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Toby Huang <toby.huang@armchina.com>, 
 Chengkun Sun <CK.Sun@armchina.com>
Subject: RE: About upstreaming ArmChina NPU driver
Thread-Topic: About upstreaming ArmChina NPU driver
Thread-Index: AdqAssmmBRyQVXogTfqqG4OiiK8pHwE3Pn+AAAcTR9A=
Date: Wed, 3 Apr 2024 10:09:53 +0000
Message-ID: <SH0PR01MB0634C9FC3DC0CD203FBEA249983DA@SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn>
References: <SH0PR01MB063461EBC046437C88A6AE84983BA@SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn>
 <CAFCwf12ou8zNgr-_Ru8xT+Q1RWyxywwqJmx9w1spo_MdaEPr1Q@mail.gmail.com>
In-Reply-To: <CAFCwf12ou8zNgr-_Ru8xT+Q1RWyxywwqJmx9w1spo_MdaEPr1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=armchina.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0634:EE_|SH0PR01MB0556:EE_
x-ms-office365-filtering-correlation-id: 93af7698-8f9d-4322-1478-08dc53c634b6
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nEuZ5O3pfE5AdFUO/K6yi6h9DO7OaYXIxCYA/lm+dE+AIO77mOnnxswjY6HHNp+jrhenouAaKGp6/UkkFW7U6DJBMoexBiIRdICHFxsL3VggJ6cr5oL29Niox/1S17+0ZdbYcPPQgqCPdVPD3D8FL1myXYhnzYQwe+931GcnRJmqoLK66LtD7/c+EtJaPrQeVs+5wemVsAU4vv3Cq/ex6BnAx2TAM2sBJww3gbUlktvhv6RFHXLvS3vdIUuIBZ9rLEwiqhgvnqaTdxRbDEkMPJ4o3Esr+vn4eOFenwQTPzNl2MMNEOwug0gKtP6a0i8GerEWjO8EK1UNpg+d51iufF69uPpnT5US6GqV8iSx09T2afonKzyCxxN0XZzcJ6KPmaMeLecqcK8QTtO6PuVa8LH+/zETzwHCzytSj8Bjeurb+hj37QI1CUX9U3dfMLzP8sm26Q37/q5b6j3hzRc7czuCxxkX31z52N/vXr0skr50KGyJDYsObv0rtsaH8vCEsdLsYJuf59w4FF5ZqLfjbZqnuI0O9lZyHFvuGMd2ADVlJW7Syd14qxEDdu2Ko19bcPLZ+DduxUIi5EBN4Thq9n7OZdcOb+MNpoVvRoOYjeDIflrpTz0JTniOv0l5CyEG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE; SFS:(13230031)(41320700004)(366007)(1800799015)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFBWeThZcDZjR2Z5QmREU001NjNwT1kxenBMb3g3Yy8yWXlmSmFhVUdHOVdR?=
 =?utf-8?B?S00yeDd3bGVWTmk0aXM0T2ZOZW1Xc3BPOFBrYm1iNFlQcHFwNDRIaHpWUDB6?=
 =?utf-8?B?NzR3U0p2YjBSWDJTbmdValZraEhkdkNUMW0xK1BFb1UyYUtud3FWQ2NpSEhD?=
 =?utf-8?B?TXU4azd0dzVtSlViQ0FrTFhpV3RobTFBc3hPb3ZtMEJ0M2NLTjYwQUNiM0F2?=
 =?utf-8?B?cDNBeXVqVXVNWkExc2xpNzBsVkJWb2l0eWU0ZFNubGpOQTV6RVFKbWhySFdl?=
 =?utf-8?B?NXM1VUhzUTMrMlFNaVJhS3dHL2FVNGdZVEFlN1JWdHp1cUo5dFpzY3l6dmtq?=
 =?utf-8?B?V3VYWjFnMDNUQU5RWXdtUmppc3U3MWtrRkUxUndVRU90VDFaNzZ6Z3BCYm41?=
 =?utf-8?B?b2tjcCtMR3RjVGYrUTFMWVJNbFkvSzlWRVRFcEk1b21ZOGsyVk13K3NRc0Q2?=
 =?utf-8?B?K292cDRHSFRHYVhmYW9DTEtDVU9ndGdHdFdWNU5tQkxZN1FiQlFxYU50RHJO?=
 =?utf-8?B?aWJwMWN2MUx3eVVjaVMxaDR4SmNjTTFYNmczSHcraFNrOHV5a0xJZi9OQWdt?=
 =?utf-8?B?aVZNZEJpT2lEQ3pidWI3TlVyOHBERk52QzRPUzQ1amQ4b1VTZWZPM3ZXSGJ3?=
 =?utf-8?B?TXhrbDF0Ni93NkpzOEFFUmRDaVhHU3dIdnFhTTRpTy80M0pVcklTTnF6djk4?=
 =?utf-8?B?cXliY3pmbFc3YWVqZ2liSmRaUWpXdVhUL0xuckpNR1NiNW5jbEl0ajdqRTNX?=
 =?utf-8?B?dDBWcEVnSzNwbGRZMGRybzZLVGplcllsOFBza3pyOG5jU0craStnQ25qaHV2?=
 =?utf-8?B?N1NMd0Fqd1UyYjBDWmJVODlUREhvWTRTRTJqWC9KSXp6U1N5aUtFU2Vmd2s5?=
 =?utf-8?B?R3ZpZ1g3ZWpweXFlQ3BJRWdYMmEvTUpJdUFFMGdWTXE2SGNVWkZuMmZvYy8z?=
 =?utf-8?B?NXhCSllDN25WTVR6ZHhoNlU5K3VVYkhNMVpuVDBrU0d3TUprRnN0NWUzaEMv?=
 =?utf-8?B?dU5ZSnlGNXNIY2l3WmJOWkc5MVBsbTNxa0xYMEcrMS9QWmxJdlhzZ25VQzlK?=
 =?utf-8?B?T2FmZnJkV2ZaSUNMenNDN0hTRlZJSHVBejc5emJvR2RGYVlpTGQ4dC9JS3Rl?=
 =?utf-8?B?Q3BUZE5wVlBGc2gzMnVNRi9yZ0hDd3lHdktSSzRwSEl6MW1YZmpPcEkwT0dn?=
 =?utf-8?B?dG5IZFdlQVZBNUpOTFNwYUd5S2tsN3cxcWVxZm10SFVXMUpOcWN3ek5BT3VX?=
 =?utf-8?B?amhRM2RUMmFHZ0lLS25PZm0rRU14M0pKSVVnZ21RaTZmRUlMc2FKdFBYRlFp?=
 =?utf-8?B?dWVoNHdqMFdkTGU5dkRsRWo4T0N1QnU5N0Y0N05wM3hONFhGU3VwYitDTncz?=
 =?utf-8?B?Qk44bW5mYTY1SlNqWE1MaGlFVW1pNW9tTDFvMzQ4WUNnQlYzSSswVkFENnZH?=
 =?utf-8?B?UnhUK1BKaWRxY3Q0VVk2QjcvSmdubHl1SXlRcS8rQzl5OUUzRmpnS1J4SFFP?=
 =?utf-8?B?cURsb3RGdUdrUzVsYlA5S1h0RDcrZFNtWnBQVDJoKyt6OUVleHJQcWprWjlm?=
 =?utf-8?B?RFN3UVF2SGpLdTRhRFBpSnFmdjhORTNSM2pGN1VnQ1YxYVpORVR1dmFHT0tX?=
 =?utf-8?B?U3QrRE1IenNVZzN3SWlpaU43aEVNWUxOeTRzVlRxQUlkNlp5VkFhUkdOSjEy?=
 =?utf-8?B?KytocW90ZHIrM1VRdWZwdzN1N1gveXFTUUZSdlkxbk92NSs5OHlHK3kzSTg3?=
 =?utf-8?B?RktzbzVNT1dKR1BNa3pQMWdRakV3bkdLQXYwdGFyNjRBYTk1ZjNVbnVITDZG?=
 =?utf-8?B?SG9KdG54MG1hVGR1VHFFV2F5YnBHQTFLcjJoZXU5QmcwaUYyZ1c1dVFFSXNI?=
 =?utf-8?B?S2xQUTlWZi9KNThIRW9NeDZveTFndHZGeEt0cjlvdjVUQ0o2L1REaS8xQ0RK?=
 =?utf-8?B?TFZiRktWTnkzNVJOZitlcm1QRGtpWXpjckpJbDc0LytzU1V3ZVVVcHFvZm9q?=
 =?utf-8?B?WkZ4YmFFOXdRZEZzNkNUQ2pRTHVLc3JIWlVmNzdXS3A1VmpUZ3kyNkZxeTM5?=
 =?utf-8?B?TG1FWExDNXRzUmJBZ1kwMlJ1cG82bkp5cHZ0TW01S3l6NGNFa3JUZS9ucGxC?=
 =?utf-8?Q?6IOkA36j6xLBUyDuJZ5UaG5fl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: armchina.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0634.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 93af7698-8f9d-4322-1478-08dc53c634b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 10:09:53.2288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 58b271af-432f-4dad-9dee-571f404bc6a0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: utvdLmqCRCZ/gYCwKvtEd2ujPQJy4SkMtDYedNBqHuYqEstLiuoCpKeHu4WdXL6h2RCqE2sMcF7EBbbhFCM4vw80gn6907ZqDlOpy/XwKaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0556
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE9kZWQgR2FiYmF5IDxvZGVk
LmdhYmJheUBnbWFpbC5jb20+DQo+IFNlbnQ6IDIwMjTlubQ05pyIM+aXpSAxNDoyNg0KPiBUbzog
RGVqaWEgU2hhbmcgPERlamlhLlNoYW5nQGFybWNoaW5hLmNvbT4NCj4gQ2M6IG9nYWJiYXlAa2Vy
bmVsLm9yZzsgYWlybGllZEByZWRoYXQuY29tOyBkYW5pZWxAZmZ3bGwuY2g7DQo+IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogQWJv
dXQgdXBzdHJlYW1pbmcgQXJtQ2hpbmEgTlBVIGRyaXZlcg0KPiANCj4gT24gVGh1LCBNYXIgMjgs
IDIwMjQgYXQgMTA6MDHigK9BTSBEZWppYSBTaGFuZyA8RGVqaWEuU2hhbmdAYXJtY2hpbmEuY29t
Pg0KPiB3cm90ZToNCj4gPg0KPiA+IERlYXIgS2VybmVsIE1haW50YWluZXJzLA0KPiA+DQo+ID4g
SSBhbSBhIGRyaXZlciBkZXZlbG9wZXIgYW5kIHdvdWxkIGxpa2UgdG8gdXBzdHJlYW0gdGhlIEFy
bUNoaW5hIFpob3V5aQ0KPiBOUFUgZHJpdmVyICgiWmhvdXlpIiBpcyB0aGUgYnJhbmQpIHRvIGFj
Y2VsIHN1YnN5c3RlbS4NCj4gPg0KPiA+IFRoZSBkcml2ZXIgaXMgYWxyZWFkeSBvcGVuIHNvdXJj
ZWQgKGJvdGggVU1EIGFuZCBLTUQpIGFuZCBhbnlvbmUgY2FuDQo+IGZpbmQgdGhlIGNvZGUgZnJv
bSBodHRwczovL2dpdGh1Yi5jb20vQXJtLUNoaW5hL0NvbXBhc3NfTlBVX0RyaXZlci5naXQuDQo+
ID4NCj4gPiBUaGlzIGRyaXZlciBpcyByZXNwb25zaWJsZSBmb3Igc2NoZWR1bGluZyBBSSBpbmZl
cmVuY2UgdGFza3MgdG8gdGhlIE5QVSBjb3Jlcw0KPiAoVjEvVjIvVjMpLiBTcGVjaWZpY2FsbHks
IGEgc2ltcGxpZmllZCBlbmQtdG8tZW5kIGZsb3cgaXM6DQo+ID4NCj4gPiAgICAgICAgIDEuIEEg
VEZMaXRlL09OTlggbW9kZWwgaXMgdHJhbnNmb3JtZWQgdG8gYW4gZXhlY3V0YWJsZSBiaW5hcnkN
Cj4gZmlsZSBpbiBFTEYgZm9ybWF0IGJ5IHRoZSBOTiBncmFwaCBjb21waWxlciAoZGVzaWduZWQg
YnkgQXJtQ2hpbmEpDQo+ID4gICAgICAgICAyLiBBbiBhcHBsaWNhdGlvbiBsb2FkcyB0aGUgZXhl
Y3V0YWJsZSBiaW5hcnkgZmlsZSB0byBVTUQgYW5kDQo+IHByb3ZpZGVzIHRoZSBpbnB1dCBkYXRh
Lg0KPiA+ICAgICAgICAgMy4gVU1EIHBhcnNlcyB0aGUgYmluYXJ5IGFuZCBzZW5kcyBpb2N0bHMg
dG8gS01EIChvcGVuIGRldmljZSwNCj4gZG8gbWVtb3J5IGFsbG9jYXRpb24vbW1hcC9mcmVlLCBz
dWJtaXQgdGhlIGpvYiBkZXNjcmlwdG9yKS4NCj4gPiAgICAgICAgIDQuIEtNRCBkaXNwYXRjaGVz
IHRoZSBqb2IgdG8gTlBVIGgvdywgaGFuZGxlcyBpbnRlcnJ1cHRzIGFuZA0KPiB1cGRhdGVzIHRo
ZSBleGVjdXRpb24gc3RhdHVzLg0KPiA+ICAgICAgICAgNS4gVU1EIHBvbGxzIHRoZSBzdGF0dXMg
b2YgdGhlIHByZS1zY2hlZHVsZWQgam9iLg0KPiA+ICAgICAgICAgNi4gVGhlIGFwcGxpY2F0aW9u
IGdldHMgdGhlIG91dHB1dCByZXN1bHRzLg0KPiA+DQo+ID4gU28uLi5mb3IgdGhlIHVwc3RyZWFt
aW5nLA0KPiA+DQo+ID4gUTE6IGRvIHlvdSB0aGluayBvdXIgTlBVIGRyaXZlciBpcyBzdWl0YWJs
ZSBmb3IgYWNjZWw/IElmIHRoZSBhbnN3ZXIgaXMgeWVzLA0KPiB3aGljaCB0cmVlICYgYnJhbmNo
IHNob3VsZCB0aGUgcGF0Y2hlcyBiZSBiYXNlZCBvbj8NCj4gSGkgRGVqaWEsDQo+IFllcywgaXQg
ZGVmaW5pdGVseSBzb3VuZHMgYXMgYSBnb29kIGZpdCB0byB0aGUgYWNjZWwgc3Vic3lzdGVtLg0K
PiBQbGVhc2UgYmFzZSB5b3VyIHBhdGNoZXMgb24gImRybS1taXNjLW5leHQiIGJyYW5jaCBpbiBk
cm0tbWlzYyByZXBvOg0KPiBodHRwczovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dpdC9kcm0v
ZHJtLW1pc2MuZ2l0DQo+IA0KDQpIaSBPZGVkLA0KR290IGl0Lg0KDQo+ID4NCj4gPiBRMjogaW4g
dGhyZWFkDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvZWM1NDdkMzMtMjE0Zi00OTUy
LWFhMzMtYzI3MWU5ZWRhZDYzQGtlcm4NCj4gZWwub3JnLyBzaG93aW5nIGEgc2ltaWxhciBjYXNl
LCBPZGVkIG1lbnRpb25lZCB0aGF0Og0KPiA+DQo+ID4gICAgICAgICAiSWYgd2Ugd291bGQgaGF2
ZSB1cHN0cmVhbWVkIGEgbmV3IGRyaXZlciwgdGhlIGV4cGVjdGF0aW9uDQo+IHdvdWxkIGhhdmUg
YmVlbiB0aGF0IHdlIHdvdWxkIHVzZSBzb21lIGRybSBtZWNoYW5pc21zLiIsIGFuZA0KPiA+ICAg
ICAgICAgInRoZSBtaW5pbWFsIHJlcXVpcmVtZW50IGlzIHRvIHVzZSBHRU0vQk9zIGZvciBtZW1v
cnkNCj4gbWFuYWdlbWVudCBvcGVyYXRpb25zIi4NCj4gPg0KPiA+IEkgZ3Vlc3MgdGhvc2UgcmVx
dWlyZW1lbnRzIGFyZSBhbHNvIGFwcGxpY2FibGUgZm9yIHRoZSBaaG91eWkgTlBVIEtNRD8NCj4g
Q3VycmVudGx5LCB0aGUgbWVtb3J5IG1hbmFnZW1lbnQgKE1NKSBpbiBLTUQgaXMgYmFzZWQgb24g
ZG1hLW1hcHBpbmcNCj4gQVBJcywgd2hpY2ggaGFuZGxlcyBib3RoIHJlc2VydmVkIENNQSByZWdp
b24ocykgYW5kIFNNTVUgbWFwcGVkIGJ1ZmZlcnMsDQo+IGFuZCBzdXBwb3J0cyB0aGUgZG1hLWJ1
ZiBmcmFtZXdvcmsuIE1heWJlIEkgc2hvdWxkIHJlcGxhY2UgdGhlDQo+IGltcGxlbWVudGF0aW9u
cyB3aXRoIERSTSBBUElzLg0KPiBZZXMsIHRob3NlIHJlcXVpcmVtZW50cyBkZWZpbml0ZWx5IGFw
cGx5IGhlcmUuDQo+ID4NCj4gPiBRMzogaWYgeW91IGhhdmUgbG9va2VkIGF0IHRoZSBLTUQgY29k
ZSwgZG8geW91IHRoaW5rIEkgc2hvdWxkIG1ha2UgYW55DQo+IG90aGVyIG1ham9yIGNoYW5nZSBi
ZWZvcmUgc3VibWl0dGluZyB0aGUgZmlyc3QgcGF0Y2ggc2VyaWVzPyBUaGFuayB5b3UhDQo+IEkg
dG9vayBhIHF1aWNrIGdsYW5jZS4gSW4gZ2VuZXJhbCwgaXQgc2VlbXMgdG8gYmUgb2ssIGJ1dCBJ
IG5vdGljZWQgdHdvIHRoaW5ncw0KPiByZWxhdGVkIHRvIHRoZSBpbnRlZ3JhdGlvbiB3aXRoIGRy
bS9hY2NlbDoNCj4gDQo+IDEuIFlvdSB1cyBhIHNjaGVkdWxlciBmb3IgdGhlIGpvYiBzdWJtaXNz
aW9uLCB3aGljaCBwcm92aWRlcyB0aGUgYWJpbGl0eSB0bw0KPiBkZWZlciBqb2JzLiBJbiB0aGF0
IGNhc2UsIEkgc3VnZ2VzdCB0byBjaGVjayBpZiB5b3UgY2FuIHVzZSBkcm1fc2NoZWQgaW5zdGVh
ZCBvZg0KPiB5b3VyIG93biBpbXBsZW1lbnRhdGlvbi4gTm8gcG9pbnQgaW4gcmUtaW52ZW50aW5n
IHRoZSB3aGVlbC4NCj4gMi4gWW91IHByb3ZpZGUgc2V2ZXJhbCBtZW1vcnkgem9uZXMgZm9yIGFs
bG9jYXRpb24gb2YgbWVtb3J5LiBJIHdvdWxkDQo+IHN1Z2dlc3QgaGVyZSB0byBsb29rIGF0IHVz
aW5nIHR0bSBhcyB0aGUgbWVtb3J5IG1hbmFnZXIgaW5zdGVhZCBvZg0KPiByZS1pbXBsZW1lbnRp
bmcgeW91ciBvd24uDQoNClRoYW5rcyBmb3IgeW91ciB0aW1lISBJIHdpbGwgdHJ5IHRvIHJlZmFj
dG9yIHRoZSBjb2RlIGFzIHN1Z2dlc3RlZCBhbmQgdGhlbiBzZW5kIHRoZSBmaXJzdCBwYXRjaCBz
ZXJpZXMuDQoNCj4gDQo+IEFuZCBwbGVhc2UgcmVtb3ZlIHRoZSBJTVBPUlRBTlQgTk9USUNFIGF0
IHRoZSBlbmQgb2YgeW91ciBlbWFpbHMuIEkNCj4gd291bGQgaGF2ZSB0byByZWZyYWluIGZyb20g
YW5zd2VyaW5nIHRvIGZ1cnRoZXIgZW1haWxzIGlmIHRoYXQgbm90aWNlIHJlbWFpbnMuDQoNCk5v
dyBmaXhlZC4gSSBkaWQgbm90IHJlYWxpemUgdGhhdCBiZWNhdXNlIHRoZSBzZXJ2ZXIgYXV0byBh
cHBlbmRlZCB0aGUgbm90aWNlLiBTb3JyeSBmb3IgdGhlIGluY29udmVuaWVuY2UuDQoNCkJlc3Qg
UmVnYXJkcywNCkRlamlhDQoNCj4gDQo+IFRoYW5rcywNCj4gT2RlZA0KPiANCj4gPg0KPiA+IFRo
YW5rcyBmb3IgeW91ciB0aW1lIGFuZCBsb29rIGZvcndhcmQgdG8geW91ciByZXBseX4g8J+Yig0K
PiA+DQo+ID4gQmVzdCBSZWdhcmRzLA0KPiA+IERlamlhDQo=
