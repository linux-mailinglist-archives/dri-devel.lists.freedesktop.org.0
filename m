Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D507850895
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 11:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F03610E5C7;
	Sun, 11 Feb 2024 10:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="fYkZ1z7/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2052.outbound.protection.outlook.com [40.92.22.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5B710E69A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 15:23:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNpn9mYPYy/eaUWmHfkN+f9wff376Nve7B5s9jmtoyT+4+S+WrKmgm2L+bqQIehAjaND+yvvgm8ylRw5jezHPg3Mt6VyVz+gcOYxZe/fCTrzOpVFgTAUXoJBSBUL9qwwFGpGJoiLpCh/ZyKYBZM4cDer3Tgmchvk2rnb61AAfe0LSIfD718t6ukql8Fde2usnrCjwT25AVaUMnU6NPUcwtiYgiiCZWX2o9g7dgmVai9GQ7GBlsVD1XlpOjNvnv98pE9a3szOPoae8HzTP5ZzI9N4SrKMvBnGWDsb49Z8AnEtLcFOnOvZBVuxHKbkqn0meR4instXDEDG/H2xUGp3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUfMkjYRCHMwcc/PuT/pGiasnbb2/rP9yyX+goTs5ek=;
 b=ag2t8gTOY4e65RSUnzpGvXZo7WDM+lx6VxVBW7MPN0Rvyum8u+un28ONF8xYf3tPWQl0AtuoLEHfOdUDb+LvQnwQ3uZozbULNiXBKTfHt7p3ibvtWnnGay4cFDInnZz7WSZqU+BHP/53DK/bFGPwYY6foKkYmO7wyxx5MeJeClWbOZ2XgPlG27wcr40/5Nnr31aFalVdsDoy2YstBtVeI3VO95jWFRI/6XZH7GpBi1yeFZJzgYWPW+SEJpEGayLGuiFODlK5iMa/jxvwjLX9lAJqU2BWlms7yOxTseDTL1i26KI2RaTvQoUEyBrZBCt7j4eKn8OMVheMH8d+SEIu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUfMkjYRCHMwcc/PuT/pGiasnbb2/rP9yyX+goTs5ek=;
 b=fYkZ1z7/G77F9cDS1dlvPoG4tat/WzV2TrNL1HAZvMQUJsodl8guYC1XUB2LBFKy7PPiSv9i0UB5TClZKrvNZZWbxGr8YWrjiQuYALyrzJUxkbk3UPcCdyBho3Nqr6ADUaANr/kekUXYSpN+WrhEDfWFugBtJv6aFWczZK/qvLxMUHKgmzlwWNjSdYeOpQPJPie9JC3Jod7FyUdsfDzAjRZtabvYUl34F9Myqa4dYt2vZTggB8phw9TGUVZqCJU3iNy55GXh+7Y+Q+Owjf4wuUpR4peRzWLpcC0kXgoWLpdJ/ZDd4tkd3WXX21IqustXaPJcjmqxOUUqOtDtEkk5+A==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by LV3PR02MB10080.namprd02.prod.outlook.com (2603:10b6:408:196::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Fri, 9 Feb
 2024 15:23:34 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::67a9:f3c0:f57b:86dd%5]) with mapi id 15.20.7249.027; Fri, 9 Feb 2024
 15:23:34 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: "wei.liu@kernel.org" <wei.liu@kernel.org>, "deller@gmx.de" <deller@gmx.de>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "decui@microsoft.com" <decui@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>, "javierm@redhat.com"
 <javierm@redhat.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>
Subject: RE: [PATCH 1/1] fbdev/hyperv_fb: Fix logic error for Gen2 VMs in
 hvfb_getmem()
Thread-Topic: [PATCH 1/1] fbdev/hyperv_fb: Fix logic error for Gen2 VMs in
 hvfb_getmem()
Thread-Index: AQHaVNQQLtKdxJeAI0qs1qW1SCByZbD1JHwAgA0F6sA=
Date: Fri, 9 Feb 2024 15:23:33 +0000
Message-ID: <SN6PR02MB4157811F082C62B6132EC283D44B2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240201060022.233666-1-mhklinux@outlook.com>
 <f2fe331b-06cb-4729-888f-1f5eafe18d0f@suse.de>
In-Reply-To: <f2fe331b-06cb-4729-888f-1f5eafe18d0f@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [hlyXUCXXUDeLkpOFyz8O/zgiTaxl2Nxi]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|LV3PR02MB10080:EE_
x-ms-office365-filtering-correlation-id: 58988543-62ef-4a11-8954-08dc2983146b
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gLYVhxo90gHNrueQsgWfpgb0NsCOFzejIo1oc9Ed76ZAxUgmJMJ+jWyuAM2EmAtgIHRu+LJpZmrXfHB+bCrABMaSmLGOxFsA4srcG8t2RT8Wng8Xf3FUCwYGYP4Bo9tyH2PqLVKi1W1/fTk/WNoE8GctlyLp2w7Adj998qQ8e9Yuz3AkTztWl8aWG6Rd9bNDUktmRQ4adYRPiRd5WHt0ReA9m9RohDDUfJnOmgJLQ1L7oui21Bv+tEbZJKgHSHmwYMa4ZTEYUz95K4kcwHCkm45OjntF9pjCIKt6BKx5yNFo5ytLWVsuTCjAKQrm5U/rcny8JBI0UGJGUcI3A8yYdOIhHzuVYmspHY67JbuNsyJFcKYyoQsgGS8jt+4FsTyZJE0WeyHEI/XTj+ih8nf6WKTE1bJ54uYLwuNc98agtz7UnY6y8VZUlnVfoAKrUQPES8ImklgzG4HMzP+7IR7zIe7NxneMT/DayMHG36+NHjQA8OUEYfJq0DBo8n7a+fkHbsltZqdGaUF+DDge3yW3oB5PoaAC6Mb5ly7YVcu0wCP74v7PDQy5WR8SE0/5FuUu
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkJ6WHA4dVU0bWxDNlBCTzRqL3h0T2Jsc3ZoQjZDVlJtcnlZZVlaWjljcXpv?=
 =?utf-8?B?cGsxN0JmV0FzSlh5RzFiNlJzZjlvOXlKeVlqUG5Wc3dJRGtjMTJxZGxaL0s5?=
 =?utf-8?B?RlphdDVjdjJzVkNVelRNeFczeVNiczZkbzZWazJ6M3pnQVlFVXZIdTR3TUlX?=
 =?utf-8?B?eDRwYTkwZzFRaExva2wySDk2NStEcFgzVWMzOXVkMVBNdnNZL3kxMkhXODNn?=
 =?utf-8?B?STN4NFljQTFiQUxxOFVJZ1pTMVlIVDVzRlZtTXFjOVZ4UzR6U29zVm5YdTZh?=
 =?utf-8?B?UTRUZUZkU2c5NFl2WmJwY0dqNzFSaXlEbzNZRWNEWDE0ZHpsUDRZSVhYMHYy?=
 =?utf-8?B?MWlDUDdFc0dZYVhzOXlwZmVTVnQzSFlveGxGd1hZQlY3dkJocWI5aCtoci9r?=
 =?utf-8?B?NE9OVHFZbU5LY1hTSmlEL0ZGMHo5cGJmMjUvZGNZaXgyMUVzMEs4ZWxNc2I1?=
 =?utf-8?B?TXlHbnNWaU5nT0VmSFdtdlkyZXF0Y1hyZGZCRnJ6TW5tTTFXdHhLRExCd0l3?=
 =?utf-8?B?Qmlmc0N2MFNWTGloM2JpUTRrK0ZaQ2NSTjE1UW9CYnZkTEpHM2srT1k5QjR3?=
 =?utf-8?B?dzFFaGRmL1FiVnM5Znp1VG9SeUlheVpkbmtlT0dzT284R0s2ZUtvbXZVMGpy?=
 =?utf-8?B?MUExNzNuTkRHK3BEV2pjV1MwaWpyN2hnUzhSMFkvK0RUcGJHRlN6V2hDR09a?=
 =?utf-8?B?S0IvUFFRaTFOZlNoSDJVc3BKQ0NwTUJJcjFSb1hSbGJJS2N5cmxkT0dTdEkv?=
 =?utf-8?B?SnNtdUY2TDlqRG5hWnhpUU8rd290TjNEbURqQUthck9WL0E2SFZGUExHbkRH?=
 =?utf-8?B?Ujc1MG9sY09FNEtDRWdvazkrZjArRFYycEhwMHBXb0RoM0Z1TDVJNDI4Sis4?=
 =?utf-8?B?SVhvb2ZZUzVycElnREN1cW8vZzlZYndRcWdSSnhpWU5XVTlHMUlxV25JMUlQ?=
 =?utf-8?B?VGxXTldNbGdpN0NvcURxazJmU1FoUmZxL1ZEOTFKL2d3UGcvNlRrQ2RENDRN?=
 =?utf-8?B?MnkycGpZUlpBem81dk1mNHlvVWcwTHdzSVUxQjRhUGxFZkV0U3Vpb0RONVcy?=
 =?utf-8?B?R2hVUkU3dHpjTmZJajlOMmUyVFNjd01uYlpiQkVqM1k0ZnprT1UvdkMzd0V2?=
 =?utf-8?B?a20vWGFoNFhrNkplSzJFc0kwSWVSTTVqTE9DSnpVZDdkdS9GRktYVisrRXk4?=
 =?utf-8?B?MGVVZlJNa0VldDdpMlhoTGlPR3RncUtiM2JxaWtLbk1OZmtVeE14YXZxbzI2?=
 =?utf-8?B?T2Z3VTh2dHF1NzMvRGNkVUI2bWhJS0FKdDdkbHNmR1pOYmt6MW9lUHZ2TXdB?=
 =?utf-8?B?MnVhYUF4dThmTzYxYUpqejYzVzB3RndSTnRuSGExU0toY3hvdXdIZWkrVUJS?=
 =?utf-8?B?UjJ5VUZmeEpmRUdMU0tScVdvKzJBandJT2IyN2V5NGRCK1Z2MWhSeWxjSE9n?=
 =?utf-8?B?Qmp6dzdyV21JWVFYaHVxWk9BaEIwQkozeGFpL2VSZ2NzY3RuOHJBNnRaYzZx?=
 =?utf-8?B?NlZ0S2tlcVliclJOdFRqQW1FTml1dVdmeHFtOXVLU2JpQm94L3hralBUazZ1?=
 =?utf-8?B?cVZCbW5VTTZURGRROEd1U09MOTM3TW1HY0M2dkU3dzlRVlkvZ2g1WGZCVlBm?=
 =?utf-8?Q?UvdT1Jy/sq6VpOpu5eKn3GJ3VDFjtEjWj2F8gcbERdnE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 58988543-62ef-4a11-8954-08dc2983146b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2024 15:23:33.9747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR02MB10080
X-Mailman-Approved-At: Sun, 11 Feb 2024 10:04:53 +0000
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

RnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IFNlbnQ6IFRodXJz
ZGF5LCBGZWJydWFyeSAxLCAyMDI0IDEyOjE3IEFNDQo+IA0KPiBIaQ0KPiANCj4gQW0gMDEuMDIu
MjQgdW0gMDc6MDAgc2NocmllYiBtaGtlbGxleTU4QGdtYWlsLmNvbToNCj4gPiBGcm9tOiBNaWNo
YWVsIEtlbGxleSA8bWhrbGludXhAb3V0bG9vay5jb20+DQo+ID4NCj4gPiBBIHJlY2VudCBjb21t
aXQgcmVtb3ZpbmcgdGhlIHVzZSBvZiBzY3JlZW5faW5mbyBpbnRyb2R1Y2VkIGEgbG9naWMNCj4g
PiBlcnJvci4gVGhlIGVycm9yIGNhdXNlcyBodmZiX2dldG1lbSgpIHRvIGFsd2F5cyByZXR1cm4g
LUVOT01FTQ0KPiA+IGZvciBHZW5lcmF0aW9uIDIgVk1zLiBBcyBhIHJlc3VsdCwgdGhlIEh5cGVy
LVYgZnJhbWUgYnVmZmVyDQo+ID4gZGV2aWNlIGZhaWxzIHRvIGluaXRpYWxpemUuIFRoZSBlcnJv
ciB3YXMgaW50cm9kdWNlZCBieSByZW1vdmluZw0KPiA+IGFuICJlbHNlIGlmIiBjbGF1c2UsIGxl
YXZpbmcgR2VuMiBWTXMgdG8gYWx3YXlzIHRha2UgdGhlIC1FTk9NRU0NCj4gPiBlcnJvciBwYXRo
Lg0KPiA+DQo+ID4gRml4IHRoZSBwcm9ibGVtIGJ5IHJlbW92aW5nIHRoZSBlcnJvciBwYXRoICJl
bHNlIiBjbGF1c2UuIEdlbiAyDQo+ID4gVk1zIG5vdyBhbHdheXMgcHJvY2VlZCB0aHJvdWdoIHRo
ZSBNTUlPIG1lbW9yeSBhbGxvY2F0aW9uIGNvZGUsDQo+ID4gYnV0IHdpdGggImJhc2UiIGFuZCAi
c2l6ZSIgZGVmYXVsdGluZyB0byAwLg0KPiANCj4gSW5kZWVkLCB0aGF0J3MgaG93IGl0IHdhcyBz
dXBwb3NlZCB0byB3b3JrLiBJREsgaG93IEkgZGlkbid0IG5vdGljZSB0aGlzDQo+IGJ1Zy4gVGhh
bmtzIGEgbG90IGZvciB0aGUgZml4Lg0KPiANCj4gPg0KPiA+IEZpeGVzOiAwYWEwODM4Yzg0ZGEg
KCJmYmRldi9oeXBlcnZfZmI6IFJlbW92ZSBmaXJtd2FyZSBmcmFtZWJ1ZmZlcnN3aXRoIGFwZXJ0
dXJlIGhlbHBlcnMiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgS2VsbGV5IDxtaGtsaW51
eEBvdXRsb29rLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCg0KV2VpIExpdSBhbmQgSGVsZ2UgRGVsbGVyIC0tDQoNClNob3Vs
ZCB0aGlzIGZpeCBnbyB0aHJvdWdoIHRoZSBIeXBlci1WIHRyZWUgb3IgdGhlIGZiZGV2IHRyZWU/
ICAgSSdtIG5vdA0KYXdhcmUgb2YgYSByZWFzb24gdGhhdCBpdCByZWFsbHkgbWF0dGVycywgYnV0
IGl0IG5lZWRzIHRvIGJlIG9uZSBvciB0aGUNCm90aGVyLCBhbmQgc29vbmVyIHJhdGhlciB0aGFu
IGxhdGVyLCBiZWNhdXNlIHRoZSBIeXBlci1WIGRyaXZlciBpcyBicm9rZW4NCnN0YXJ0aW5nIGlu
IDYuOC1yYzEuDQoNCk1pY2hhZWwNCg0KPiANCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvaHlwZXJ2X2ZiLmMgfCAyIC0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlv
bnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9m
Yi5jDQo+IGIvZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYw0KPiA+IGluZGV4IGMyNmVl
NmZkNzNjOS4uOGZkY2NmMDMzYjJkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvaHlwZXJ2X2ZiLmMNCj4gPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5j
DQo+ID4gQEAgLTEwMTAsOCArMTAxMCw2IEBAIHN0YXRpYyBpbnQgaHZmYl9nZXRtZW0oc3RydWN0
IGh2X2RldmljZSAqaGRldiwNCj4gc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ID4gICAJCQlnb3Rv
IGdldG1lbV9kb25lOw0KPiA+ICAgCQl9DQo+ID4gICAJCXByX2luZm8oIlVuYWJsZSB0byBhbGxv
Y2F0ZSBlbm91Z2ggY29udGlndW91cyBwaHlzaWNhbCBtZW1vcnkgb24gR2VuIDEgVk0uIFVzaW5n
IE1NSU8gaW5zdGVhZC5cbiIpOw0KPiA+IC0JfSBlbHNlIHsNCj4gPiAtCQlnb3RvIGVycjE7DQo+
ID4gICAJfQ0KPiA+DQo+ID4gICAJLyoNCj4gDQoNCg0K
