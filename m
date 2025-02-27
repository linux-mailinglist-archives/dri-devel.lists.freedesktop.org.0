Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E143AA47977
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 10:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA6210EA91;
	Thu, 27 Feb 2025 09:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="uqTEpEh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011035.outbound.protection.outlook.com
 [52.103.67.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9068310EA76
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 09:42:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwvnOh6xHWDOxZGo38gPdWHDHA1iivjAozYhuUyryPOpJeJ0C7mPHFCEZcXb42h+Zsy/bnDPmhtTF94iiWMGqsWwvSshztAwbAp4wYCxtfKnisQ8Pqz6XJebYEjL9Mh3gvBTWNoHLyNrZxrEVoYKSP8GBfoSw6SlCsFPBV+/5+ztOY3RxHT2mEyN7SCI17r4B3wxYATc4i8k4R9dZjrzIbIM6nCasY0m40q/ZglrLvukCdKlaNkWtNT5ObZDW9w2DOWCQzm47W1edUn2WuHmN7JjFDxV8rvY6LS0jxiJMwzZwAk3B3D8Ukc+suh4vIlTMiHz/9VnomTFVmiDnPaaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIyYqJPXoMq4uQ2Rw7fMF46fcnLT/OqkTH0smp74VUQ=;
 b=vLm8gC9FT8jjdF6MVSeWIZuTzXA81yoGvpYWbooBOCnRRNZf23GfGEjJuNgvesa3fW9Dr7P1a01JDbK9tWxIx3NaUp2ar1ONnfcvM00qEUFk0sFlo5Ts7Mt6TE5c9gVjys8NvCrUqZwdDbjTcKc97NgIfZE8qosPylLkyOvTl/smL/SNwc0lLyvMLy+J/kHkAgOeTIR7L/kZrvQ6VndiN9zzMLiHg2UeF7Y+iunIHYoJl/rJGVdQTR2e1V0yBo4wDv1BOY+57MBPLg36wA1L01H1SLII1Si+drsYZdEnbR7T3hG7cKGCGfzTlFuOHNJFmiONVzbfTCIjmZ69ctO0kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIyYqJPXoMq4uQ2Rw7fMF46fcnLT/OqkTH0smp74VUQ=;
 b=uqTEpEh2GsokU+k7IdP80DLc9buxkFj1LZwiiUyLD1QZ6zQX2Mhd/MOnEtDF4rb+1kbflEqXcGASg5IQGHWKOskckk306EzXJ9o1qUxMtSMcVkroZRGT8rTM5GsLrllVx3XgqfLW2yBdoWsDSZMT8K81AnAf82kniHqGEGxQuc5d4BCOfz5f0vETpcl+D0MZDCebbgwp8WEgVv96fP8ZjRDomf1eDpb22UQvFXu6IDtkZyD9ZNTZzMezIcfEo3SGpg6XvZGwR4ufho4J/eWJsigRzm3udjQLWx4jiDN/AJoxv6L7Ue4RcgwHUhr2d7JPGen8uUHFztv5jYas7qIbZg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB6302.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:7c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 09:42:00 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 09:42:00 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v7 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v7 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbiGghd8w5M/djj0yxVG2lSXCRHLNa5MkAgAACGH0=
Date: Thu, 27 Feb 2025 09:42:00 +0000
Message-ID: <PN3PR01MB9597D311510957F1FDABE143B8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <361DAD47-01E8-4ED9-BC8C-0F98B08FFA5C@live.com>
 <FCAC702C-F84A-47F9-8C78-BBBB34D08500@live.com>
 <72610225-c6e0-413a-a791-468635743fc2@suse.de>
In-Reply-To: <72610225-c6e0-413a-a791-468635743fc2@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB6302:EE_
x-ms-office365-filtering-correlation-id: 8bf861d1-2ab6-47f1-a14c-08dd5712fbf8
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|8062599003|12121999004|19110799003|7092599003|461199028|6072599003|15080799006|4302099013|3412199025|10035399004|440099028|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?MmJ0OXhnTzllUUFrc3g4cXRMZUsxM1Q1aWp6ZFNPUU56SGJFK29wYlVGTFMv?=
 =?utf-8?B?emd1Z0dFZUlDZnhHdHBBbS95QkYzdXhqODRtWHdYYTNKWTBPNXB4a1dPNXMv?=
 =?utf-8?B?bHJTbmYxSVJURDJ6K0dseStJdmNtNjRHVnd1dnNBYlZrYTZHK2hNS1hBbS80?=
 =?utf-8?B?TUZzdmtpbGFOdktuNFM2NUlPd1dJeU1DQytlWndQeWRHSmFjUTVDRjhuSEFn?=
 =?utf-8?B?TksrRk94UzdSYWhCazVOQktJbWs3UWRBbW1ma0tEaFV6cm9zWTQwaUtJRmJs?=
 =?utf-8?B?L0NNSFFnN2llMkIxcDkwNHF0eFp1dERCOGdFZSsvbHNDamQxa2xMeHUreUQ3?=
 =?utf-8?B?c2R2bFU5Q3U5VkUvaHQycmNCUnErcjgrSnpxRndGeko2THV1ckt6UWNQTnRU?=
 =?utf-8?B?azE3WEdxNEZTdUhIOFZtdFBXU3VRSE5XZDFZWjlkVzBBQkFnQTgvNm1maURw?=
 =?utf-8?B?VWVwc2I5TS95UFV4bHVFOFdxS1JJYzlMZDI0U24xSGo5dTJMb0wrY2R4L01x?=
 =?utf-8?B?UHZjOHd0cWU2UFJkczNKamVkSTVDQlFPN1BaTCs0VHppVlpiUXRFZzUrbm5y?=
 =?utf-8?B?dUZKL1pwRmt4dUlGdUZ2VVNhcG8reWdBVGNtT1ZnSDg4Y2I1Z2pYZjhKQlBF?=
 =?utf-8?B?cTdBeWNkZDlTVWZXRDhoandrQmxqK1BMSk04eUVJdWdGVk9mejllZysyTUhw?=
 =?utf-8?B?VmIxdVBFWEZPQ1Y5Wis4ZjVZRWloUHB1WUc5VFNoTjlwaUZ5aTNwQ2ZmdWhz?=
 =?utf-8?B?TVVVdnUrYzlIZHVpbFFBV1hWbHhnemtGTlR5VThVdnpNREE0QWZUZ3hhSGRB?=
 =?utf-8?B?aUJEeFUxbWdpVjZEYU9OU3JwYTgvVWdnUm5zYkc1SHJQU3ZFZFFTUXRzRkJx?=
 =?utf-8?B?Rm5pMXhXQnpRalRVWUxvcWVqVHFMYzYyek9RVzN1aU1hc050bGRuR0JBY0Zn?=
 =?utf-8?B?VVVhcE9Na2xEMFpaa2x1TUZlQk0xQTZDYVN1TmRaR2VmSy96bDN3azVOV0tU?=
 =?utf-8?B?NHpQZUFGZHZMUXg1RGtkbEFzSG5uSUpoWEZYZnFrNnpNaXVjWHlZcWVNZnFo?=
 =?utf-8?B?VXgxRVA3YjdzVlRhRzlEOWZEbTh5QWsvWmdzSGJIZmFGT1Uyc3FqZmphSVMv?=
 =?utf-8?B?VnhSK3F6ckRiTlMyUmU5amN3T3dJWlA2eVluT0MxVXY0YjNjVnFCY3ZUaU51?=
 =?utf-8?B?eng3VnlmcnFBelEwU01sK3RkOGJldmFiTFp0Y0tHT0lFTmRkWG5aQ2ZlbTRK?=
 =?utf-8?B?ZlZyZmJKUEs2YldSU3lrWGRIYVJFNEgwWEUvY3BUMjZTQ0o5UEczdDhPQzVy?=
 =?utf-8?B?SSs5VVMwYm1qdzZKeHIwVjE4UmlZT3ZyZmtSNGh0MFdIWXVaTEtXVFBKY2hJ?=
 =?utf-8?B?SUJIQ1JqQjY5MlJjR2FSdDZtcnY0dWcwSXgvOVV4YmVGNnRnd0xWSTF3SlFY?=
 =?utf-8?B?SkJJZ2xHR0E1VkE1UDJRdFZrcnVQYUsvUVh2RllsNWRjR2N3R1BSYUt3ZmJW?=
 =?utf-8?B?MFR3S1hFNGhUK2duSmJ1ZndzamdjTFBYSG5pT1dLdTFRaisxNnpCMXgrUjhQ?=
 =?utf-8?B?MHViVE5lc0t4RWhDUjVrRXR0ajBEQldGWE5JL21BSHNoMStVNkE5QmhvQkNH?=
 =?utf-8?B?K3hBZ2U5UmN5d2ZwRnZQaEd5bktjdDZsRU9LL1VKblZteS8vS0NkcXZvUE5S?=
 =?utf-8?Q?aJElmHqmmC9cJ2qlqft3?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkpTNG5SWityWVd6N0xra0phNVAvZFhsS085MDhxSk4vQWYydjFPREFTNENQ?=
 =?utf-8?B?OEp0dDI1d0w2UW4rUEltL1JVNnhPbnQrd2tpdHVFd2dOak1tSlJraEVlazBs?=
 =?utf-8?B?anYxQ3NHaE0yU2RMYmpjVGRiNEtEdGZqSWRwNWI5UUl6ODB0UU1RUXdBV1B0?=
 =?utf-8?B?M1hpY1BYbVA5T1krZVZSSTQxS1hrM3k2T2c3MS9VNVIvQjNTNVc5MndzamR1?=
 =?utf-8?B?akNOSnpTeURzTmFEYmY3RWNGQmJkcml5L0p6bWxpbGRrWjBnazFhVkJRWVpJ?=
 =?utf-8?B?OHhsK2JNYzVndG1HR0JxdzVXT3MrNjVqcUJhazM4RG1MdXg1dElpUE1qR0Z2?=
 =?utf-8?B?QmZIMndOdGF1OThoWkNQNFljeWZjMFpFVnJVYjBFMVFzaG1kVmljdXRELzdZ?=
 =?utf-8?B?ZFFZZnhJd25BMjNVVVljODZlaDUwT2ZiNmtHM09KeEpkRGFpdXlpSVd4OTRC?=
 =?utf-8?B?blV4dWM4OGtsSWpkZE51aXl6VGpCbk5TeXhFcSttclpTcWFhUlNaS0hvM1Fx?=
 =?utf-8?B?QWgvMExiQ3JjRExBSTI4ejlaa1lxYzAxcEFxWmhmN3ZXRUYreXlqNlgwWnRT?=
 =?utf-8?B?b1IvdEZDWXhQWGJxaVUxNnlSOFpuT1hreWZMUFlMVjB1VFgzaDBXZ2dvYlNG?=
 =?utf-8?B?elQ2RDFTbnJZd3JxaC95L2gwZEFUMG9TNVdQN2pBTTZFYVozZG9ZZld6T1ZV?=
 =?utf-8?B?QTMrYm9ueXp0V1lmMW5TZTVMV3MxY0EvN2pkZ1dDRnREZS9vbTJtTnRnSDJH?=
 =?utf-8?B?SFY3amhCQXQ5TWMxM0duZThzanJPdVJxT0VQNnZ4bXgyZWZ6Y1p0QUp0a1VY?=
 =?utf-8?B?UjFFNFlCMVdjVU9rditiV1JuRE43UGh0T0JRbm84dkpVdjdFcnpjNjNQVlF6?=
 =?utf-8?B?S0ZYdHBvRnYxSnZOdTZQbDVZWFRPaEFCTGxWSEswMS96aFR1dXBFcXMraVZs?=
 =?utf-8?B?OUEzZ0xUOG9wQlZ3cDRhcDluLzY1OXVuMUdpSXhkbVY0L1NKTGF6ZnJBOENI?=
 =?utf-8?B?eU9wd3hwKzVKZDBwZ0hEbi80NDlhYTNMNUFHQ29TVjk4bW9aa1BOdFhhMWg0?=
 =?utf-8?B?NHYrWkZ6YXUvMnFoZHNQbGNrNnJUNVBhN29WRnNwbmxQNDNJMWNaNjZrb29t?=
 =?utf-8?B?aHpjZEM5eTMwZEhyUWZGeTlibmNvVE95NW9Gb3RiQlNsckplakpoRVYyajFj?=
 =?utf-8?B?UHhpbUhyMWYxak5NMnZxUmMwRGJpR2o2YlZJRUgvNzE2WEtWeWEwVjJ5cnNn?=
 =?utf-8?B?WWlPTTM2MkFGbVl3V2hNSEFNY0s4QnNreGhNQlA1dTVEZ2N5bm1yUHFrN3FR?=
 =?utf-8?B?V0o4RDc3QTdVV1dPcURxbVpMMzVXZ0I1aXNiOWdydkZkaVlOMnlDbFRKRFo0?=
 =?utf-8?B?N0JnK3Z1L1VIZVM1b2x6eVJsNElMZklQUDhDVFp3R2hGUEFpQjNLU1AvVWI5?=
 =?utf-8?B?WVRKZWd1eXg1SCt4S3l3UzNtWmlUU1pBYnBwblllbDBkZUZ1T3F3Zzl3dExB?=
 =?utf-8?B?emNxeG9LQXFUaFA0TkQyTElEeHpPSDBIQjlJa3ZnQ3FlU1RDY2ZFY1YrZ0dD?=
 =?utf-8?B?elp1dlRoL0ZRd0lVcDMrZEhuU214WHZLdzVqbEs3ZkpCcXhjZFdiK2EwVEQ5?=
 =?utf-8?Q?+iYocfk25eDFYEg/nY3FDOp14O9atE6Aq09EjzQKC7AY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf861d1-2ab6-47f1-a14c-08dd5712fbf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 09:42:00.4783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6302
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

DQoNCj4gT24gMjcgRmViIDIwMjUsIGF0IDM6MDTigK9QTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4g77u/SGkNCj4gDQo+PiBBbSAyNi4wMi4y
NSB1bSAxNzowNCBzY2hyaWViIEFkaXR5YSBHYXJnOg0KPj4gRnJvbTogS2VyZW0gS2FyYWJheSA8
a2VrcmJ5QGdtYWlsLmNvbT4NCj4+IA0KPj4gVGhlIFRvdWNoIEJhcnMgZm91bmQgb24geDg2IE1h
Y3Mgc3VwcG9ydCB0d28gVVNCIGNvbmZpZ3VyYXRpb25zOiBvbmUNCj4+IHdoZXJlIHRoZSBkZXZp
Y2UgcHJlc2VudHMgaXRzZWxmIGFzIGEgSElEIGtleWJvYXJkIGFuZCBjYW4gZGlzcGxheQ0KPj4g
cHJlZGVmaW5lZCBzZXRzIG9mIGtleXMsIGFuZCBvbmUgd2hlcmUgdGhlIG9wZXJhdGluZyBzeXN0
ZW0gaGFzIGZ1bGwNCj4+IGNvbnRyb2wgb3ZlciB3aGF0IGlzIGRpc3BsYXllZC4NCj4+IA0KPj4g
VGhpcyBjb21taXQgYWRkcyBzdXBwb3J0IGZvciB0aGUgZGlzcGxheSBmdW5jdGlvbmFsaXR5IG9m
IHRoZSBzZWNvbmQNCj4+IGNvbmZpZ3VyYXRpb24uIEZ1bmN0aW9uYWxpdHkgZm9yIHRoZSBmaXJz
dCBjb25maWd1cmF0aW9uIGhhcyBiZWVuDQo+PiBtZXJnZWQgaW4gdGhlIEhJRCB0cmVlLg0KPj4g
DQo+PiBOb3RlIHRoYXQgdGhpcyBkcml2ZXIgaGFzIG9ubHkgYmVlbiB0ZXN0ZWQgb24gVDIgTWFj
cywgYW5kIG9ubHkgaW5jbHVkZXMNCj4+IHRoZSBVU0IgZGV2aWNlIElEIGZvciB0aGVzZSBkZXZp
Y2VzLiBUZXN0aW5nIG9uIFQxIE1hY3Mgd291bGQgYmUNCj4+IGFwcHJlY2lhdGVkLg0KPj4gDQo+
PiBDcmVkaXQgZ29lcyB0byBCZW4gKEJpbmd4aW5nKSBXYW5nIG9uIEdpdEh1YiBmb3IgcmV2ZXJz
ZSBlbmdpbmVlcmluZw0KPj4gbW9zdCBvZiB0aGUgcHJvdG9jb2wuDQo+PiANCj4+IEFsc28sIGFz
IHJlcXVlc3RlZCBieSBBbmR5LCBJIHdvdWxkIGxpa2UgdG8gY2xhcmlmeSB0aGUgdXNlIG9mIF9f
cGFja2VkDQo+PiBzdHJ1Y3RzIGluIHRoaXMgZHJpdmVyOg0KPj4gDQo+PiAtIEFsbCB0aGUgcGFj
a2VkIHN0cnVjdHMgYXJlIGFsaWduZWQgZXhjZXB0IGZvciBhcHBsZXRiZHJtX21zZ19pbmZvcm1h
dGlvbi4NCj4+IC0gV2UgaGF2ZSB0byBwYWNrIGFwcGxldGJkcm1fbXNnX2luZm9ybWF0aW9uIHNp
bmNlIGl0IGlzIHJlcXVpcmVtZW50IG9mDQo+PiAgIHRoZSBwcm90b2NvbC4NCj4+IC0gV2UgY29t
cGFyZWQgYmluYXJpZXMgY29tcGlsZWQgYnkga2VlcGluZyB0aGUgcmVzdCBzdHJ1Y3RzIF9fcGFj
a2VkIGFuZA0KPj4gICBub3QgX19wYWNrZWQgdXNpbmcgYmxvYXQtby1tZXRlciwgYW5kIF9fcGFj
a2VkIHdhcyBub3QgYWZmZWN0aW5nIGNvZGUNCj4+ICAgZ2VuZXJhdGlvbi4NCj4+IC0gVG8gbWFp
bnRhaW4gY29uc2lzdGVuY3ksIHJlc3Qgc3RydWN0cyBoYXZlIGJlZW4ga2VwdCBfX3BhY2tlZC4N
Cj4+IA0KPj4gSSB3b3VsZCBhbHNvIGxpa2UgdG8gcG9pbnQgb3V0IHRoYXQgc2luY2UgdGhlIGRy
aXZlciB3YXMgcmV2ZXJzZS1lbmdpbmVlcmVkDQo+PiB0aGUgYWN0dWFsIGRhdGEgdHlwZXMgb2Yg
dGhlIHByb3RvY29sIG1pZ2h0IGJlIGRpZmZlcmVudCwgaW5jbHVkaW5nLCBidXQNCj4+IG5vdCBs
aW1pdGVkIHRvLCBlbmRpYW5uZXNzLg0KPj4gDQo+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20v
aW1idXNodW8vREZSRGlzcGxheUttDQo+PiBTaWduZWQtb2ZmLWJ5OiBLZXJlbSBLYXJhYmF5IDxr
ZWtyYnlAZ21haWwuY29tPg0KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBBdGhhcnZhIFRpd2FyaSA8ZXZl
cG9sb25pdW1AZ21haWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogQXRoYXJ2YSBUaXdhcmkgPGV2
ZXBvbG9uaXVtQGdtYWlsLmNvbT4NCj4+IENvLWRldmVsb3BlZC1ieTogQWRpdHlhIEdhcmcgPGdh
cmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFkaXR5YSBHYXJnIDxnYXJn
YWRpdHlhMDhAbGl2ZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBdW4tQWxpIFphaWRpIDxhZG1p
bkBrb2RlaXQubmV0Pg0KPiANCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KPiANCj4gVGhhbmtzIGZvciB0aGUgZWZmb3J0LiBBcyBmYXIgYXMg
SSdtIGNvbmNlcm5lZCwgdGhpcyBkcml2ZXIgbG9va3MgZ29vZC4gSWYgbm8gZnVydGhlciBjb21t
ZW50cyBjb21lIGluLCBJIGNhbiBhZGQgaXQgdG8gdGhlIERSTSB0cmVlIGluIGEgZmV3IGRheXMu
DQoNClRoYW5rcyBhIGxvdCBUaG9tYXMsIGFzIHdlbGwgYXMgQW5keSBmb3IgcmV2aWV3aW5nIHRo
ZSBkcml2ZXIgYW5kIG1ha2luZyBpdCBiZXR0ZXIh
