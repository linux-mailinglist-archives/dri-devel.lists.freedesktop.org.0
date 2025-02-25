Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CA7A443FD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BE510E70F;
	Tue, 25 Feb 2025 15:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="GvI+oMg5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010001.outbound.protection.outlook.com
 [52.103.68.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5DA10E70F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 15:10:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/4reIU0XoLYtP0Nki9VHDs+TGQbJqYz5nPPHQQhOQRf/b1kheYiKU0oSSXT7jOMuIKum0+lFRmS69nyp8yPLUhOClUZKUXw5KUWvawlADIkkTX6fMhSc6xMhX7EAIyUMvbupZYGwgchft6jvosbNF1UnjfP44wFG5O2o47SW8GUdG7ETlzdbrzt/BZJHsJGK3s9/gf8ZfanLTRf0kuA9nJZgxg0MDAiylky1DHkc9OnDjtoAH2CbQ+VmN5GhEpX1PZ2t/sRdJeDC6nXLndk+SMHUjum2Kg3KXU4SIu1oriiir3ZNwGPYdRHUv/gcntJ9h+SO7vtjWEXfOHVJLgiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKF1EU9w+zWY7S/jKTGWff0UmjBbpzYXysJZj+WiDRk=;
 b=qqha6PXKgEnNlfRL9QJaFCJgCE/GU2n5xhCOYP1cJkQroL2sDqnKcbkMZBg0mclZwb24U9Foc608mnVk4oAhoWaUk9djd6ZW9H9ZNHCzYNuXYoqdOk6DuthiNZmdLanoYQ6B69nu95U+ioY89etzcBf0uqmUfgIYz1kye0wqptF2qgqNcwJ1B6d0evJVU2I0PWK/SSgOeT3SmAkeIpnwv+1vj4ZNo/pq6EyI4EInieEv4PnnQoSrX8voJnoZGGLCPsR7h5IyFC7lZQ1jJWuBTgBs1i2F92GoGBRcFO7EKe/+yzoQZK33mHueoZaTtt0juwPoQtnNiQsGJbakm7QJyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKF1EU9w+zWY7S/jKTGWff0UmjBbpzYXysJZj+WiDRk=;
 b=GvI+oMg5lrPq6OxWM6ojxMIQR321b0pYOGUctkF6Lq5ncs2B855lWPs0f1+hGZXecSehTFd8SKhVBt6qNeQlz2CN6P+zLpt4DK12mU6uyKO+z5tqSqFPSYrV68mD53UmP7xv3hQ76cFpioODmjTwcp09w9Ikdf2p+S7DauLPe7sbmCf6PRWxIAY7Ru7NGyN4sAoOpG5QvpuB/eis2PY6ScS/NQ5PEaeaA1Q64AfPRnj6F1Jx2jUzOdNqQ4xPKjZMiD4W5wq1DBWZkfmWtrkVfZlnxSu4gj3/HNcSKmSZFI7OdEPSrdVKCIuU8mxlnuovk8Fsuz+NaGKXT42hPvzd4A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB7780.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:23::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 15:10:45 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 15:10:45 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay
 <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi
 <admin@kodeit.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbh21jOPDlavrp2kW5T/JI6UK95bNX0p8AgAAXooCAADE6yoAABIsA
Date: Tue, 25 Feb 2025 15:10:45 +0000
Message-ID: <PN3PR01MB9597C59E8708992B35954EC2B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <c0249cd8-68e4-4860-b5c3-e054df10ae30@suse.de>
 <PN3PR01MB9597287D0FFDBD11CC1F6167B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597287D0FFDBD11CC1F6167B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB7780:EE_
x-ms-office365-filtering-correlation-id: f2decb07-2ef6-44bc-11bd-08dd55ae9406
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|461199028|7092599003|6072599003|8060799006|8062599003|19110799003|12121999004|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: =?utf-8?B?TmpnNjVzR1B4WW5XNUpPT0Q1Q1dVQThmVUp2SjdHTEg0dThrRWtxVlBWTkJK?=
 =?utf-8?B?dVBpU3JBSG12ZmlzZDhBN3liZEsra2grRkFLWHEyRVNZYzNqM3QrUWwrZzBq?=
 =?utf-8?B?Rkk0Z0ZGN1ZTNFN2d0VrOUlwOTcwQW1QV29wOFBoTGhOSjZzd1hqN3JiZDhP?=
 =?utf-8?B?T3FESytpSTk0b0R3K2VMV2JVVFAyYTlkQjFuVGlMK0NkMm1teDlxRzBpUUR5?=
 =?utf-8?B?NCs1a3NFYXpzSEt0ZHJWOG42RUk0c0Q3dGJtdENncnJjdldKcXBSR2UrODlC?=
 =?utf-8?B?Tnl0dFE2OTJqWlN4emFjWVQ2enRFd2FqZ1N5N1VvbU5ZelFmRWFwZklMZGhq?=
 =?utf-8?B?VDJyTVlHaDN2WEYybDhjVkRIV0g4MUcyTVRLSzJGbGx6dWo0M1ZPbW1STTRi?=
 =?utf-8?B?bG9zalRUWGYyVndiNXlxcDdoZmxCWEE3bm92RjZlZFhaUkZEYitlOWl0Q2hn?=
 =?utf-8?B?dTM2QXRVODhoQlAzWlR6RkozYnU1THhUQUQwLzBTYkg2T05PNml2V3R3MnQ4?=
 =?utf-8?B?eCthMW5Odnd2S0JZZzloUTNHcXhvRTFWM1lXR1p0ekppdTlnM3F5dmhhRHp2?=
 =?utf-8?B?T29DRmViOWFxeHAzM0NLTC9PMDZMWFA0cy9Xd0gvWXhYd2N1aUJEeXVWM0F0?=
 =?utf-8?B?WHBDeGxNSkxvWGo1a1IvM2JMR2RialA2VFlpTEZWWXpqaitqMkQ0R2pGRDZ4?=
 =?utf-8?B?REpuZmx3cEY5ek42VG9BS3VraFZxSWZ0cWswczF3dEk4NkxkRFNXY3pUMnZ4?=
 =?utf-8?B?c2hVM0paRHlCbnNicmFWdW9rVkZnVjAvWENYc2V0UWN3dHhBTEcxTWNENExK?=
 =?utf-8?B?M1FKUkNKYXBYODZoTUM1bkJjVVNERUpNSVhVT09JOVljQnBaZ3NZM2VhU0Nw?=
 =?utf-8?B?cFFFR1dlaUZMd2JycnBxTWdsZUxuSDJkM1BiMWJIeXVCd0lJS2xWTXNKdTRz?=
 =?utf-8?B?Nk9XSzVqQ1grczBSWjlrbmlXMVF1ckVIK1NMelk5eU40TDZiWjAxeDE0OTB4?=
 =?utf-8?B?a25RL1dsM1pTbHVsYW82OGVWR1FmcWVYL2pSMVFZaHFOUnhWNzlZZzVFdklu?=
 =?utf-8?B?UjhUcitTZmxxaHVjelVLN2lpbHBTYm1rZ2VvTVJqYzZWZFQ0Zko4RU56NnV6?=
 =?utf-8?B?cHpwUTBwVGZnMHpUSDg1RjJQL25rWVpwcDFFV2tFSFFVcXJvcE04dXdqTTZU?=
 =?utf-8?B?SC9BWDI3Z2I1UjFTNGx3MkJ0SnlLRW03NGFPU1dBcU4wU0FyOURuNlVYU1BQ?=
 =?utf-8?B?MFZodWdXYVhaYU5hUHh4a3JqMkZDaXN2dit4YlBKNHMva1R2RWxhMGEydEJq?=
 =?utf-8?B?RUh2bkZXSDRycGhmTCtybjJadThGaUhxS3M0SS92NWRlZE8xMWdmVjhhZzhh?=
 =?utf-8?B?U2pnY25oOEhWd0ZZelprWUdPV1EzNFNqY0Y0VGYyOFdlSFJMY1pwUUZpK240?=
 =?utf-8?B?c2paRkRDZjkxVEk0VDk5K0JFTGY1ZmRNRWpUaGcwV2RNZWZnVy8wNU43bVFt?=
 =?utf-8?Q?BEl8AkTwjFJKRN0wkiQKSfDkWgs?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eG10MFppMDRGTUUwSU1UWG1XSVdlVlpzTnlqTm9OQmRPR1NyMXZhdHZKWCt4?=
 =?utf-8?B?ZDlQK0JuTlRnbElvelFhamIzYnpRcWFVUFQ0NFdMRGUvNTRYVE5YbzhTREJ5?=
 =?utf-8?B?YnZlcUdtL3N2MGxSSFprRnFmdVpXb2pVWExaYjk3NXVhb1pPcGZ4djFNS1or?=
 =?utf-8?B?ZDN0dzdHeGhWLzJlcGxKYTR5M1dCM016MnFLdW1VYTRrKzFwSnZBbDhLbitm?=
 =?utf-8?B?S2krb1BpaW9BVHdEdVY1Z00zMWVnMjNlYnRnR2NEWjQ2VlNKVW1CajV6V0lh?=
 =?utf-8?B?ZlZIRHAyQjFSQzdncXRaZzdYT1BTMFEvSElscHhmN0FNNW1NU1NkeVlwMStZ?=
 =?utf-8?B?M3dwR2w5aUVUNEY3QUtVeUI4UnFTTy9HYkt4UGRYa3Frb1hwN3V0L0RuUXpT?=
 =?utf-8?B?cDFaLzc0bHZSbmtST2hTcVBlMGZxMFFYald6ZEJGVnVJcXZINHJLc21xSXhB?=
 =?utf-8?B?SThISmpVckNCbmlIMWxSYkxjWUxCL01ObmlJSDFScnVkZGRWcUR4RzNiR2U2?=
 =?utf-8?B?UERydVlKSTVnV2VibVBndGJuenp6RVlLdFlxVlkvTDR6bk43QjFZVFVhdXBl?=
 =?utf-8?B?NjRPWEI0RnNqa0ZkbkhONFJsRG5BSlRwT2Z4NllSRWc0K3R4OG1ySURwV3lu?=
 =?utf-8?B?RDZoSHI5Qnh4TC9HS3crZ1BHeW9JU2NUM3ZQdWRoZGEydFYzK2VCS2YrMVha?=
 =?utf-8?B?dkpieGdUQkIvcS9hMjVGYUhJb0RhREhpT1djbWVtVUp3TnF4bUQ5T0UyVklY?=
 =?utf-8?B?RnNJanZOMXFQS055OFo2RDU1ZmVLUXozS1lpUmNyZk1Hb0JtMXcxZk9pZ085?=
 =?utf-8?B?cGxDMGpwdUhXUTRvYnJ0aGUvLzA4b2lKWEVGbjAxYVpIVjA2b2dGWjRVYzFw?=
 =?utf-8?B?SmVZeWhpZU42OTNWSGZqMVY4OWpQeEduS01nTEgrNTJOck1pa3ZDTkZaY1kz?=
 =?utf-8?B?VFFmT1N2ZnJuam9VYTVQNFZjQTFtcjZnOUxCSjNkdGRQZjRmNmlnNmQrbDBv?=
 =?utf-8?B?RG5KNXZUMm5OakZIdndvaHdqSFN4KzRPbkJBSzZsNHozL0lmZEU5V2RKRnBC?=
 =?utf-8?B?Zjd4dTNxbnJoNTdTaUxIVitpNklvb3JVcmk1S2xIVHgyZkQyY21UTkJPTEFq?=
 =?utf-8?B?dVlTVExHUXozdldHV3BDY2luOUUrd2VmeTBjVkR4cWE5aGJqa01CSjYzQkUz?=
 =?utf-8?B?T1JTeVFUM3VmZERXMlVrclRZT2tNY2R0VGZGRUR2UXlnOTR0bkMvOVdwRFl2?=
 =?utf-8?B?SHpHbGNDbmdES0U1NzVBK1RyYWhZNXdRcENxeEFsZ0JLcFdTbytIMVB6NFZB?=
 =?utf-8?B?UXlERVNESkd0U1NGckhxWktpOHF3dTFGc3UzY21VWldiVFR6T3kyQXJHeU02?=
 =?utf-8?B?SmFKY21naXFEeGxTUmdoS1JtbkpyU1lHYWFrelBVSzU3VmlZMTdtS0pjTkxH?=
 =?utf-8?B?ZTYwbGF2bE5IYWs5SE4yR0tteG1SbWVDelBXUUsreTNaUjJyMko3cU83Sm1j?=
 =?utf-8?B?bWRINVBmMmtQdDFuTlJYZEN2Y20wZ1lCYW9qMlVGSXlzWWpWQlNITXVCcjRr?=
 =?utf-8?B?MVFKMHNsV0VSbWQ5eTNDMktLekxETG5YcU85cUFUY1ZiemtZNUhIS0ZJbjRO?=
 =?utf-8?B?a0tjL3B0d1lPTmozWUREOVVqY2Q5WW5hZDdmY2dOcGtMQTdIRjgwOC9tZjU1?=
 =?utf-8?B?TjBsK1pjbTA3MEJ2SitzUkkySXBOUkRudHdZRkt2MmhxaHlOMTBudkx1WVNJ?=
 =?utf-8?Q?J+uxpSxV4G7MOv/YNI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f2decb07-2ef6-44bc-11bd-08dd55ae9406
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 15:10:45.2230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7780
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDg6MjTigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiDvu78NCj4gDQo+PiBPbiAyNSBGZWIgMjAyNSwg
YXQgNToyOOKAr1BNLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3Jv
dGU6DQo+PiANCj4+IO+7v0hpDQo+PiANCj4+PiBBbSAyNS4wMi4yNSB1bSAxMTozMyBzY2hyaWVi
IGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbToNCj4+Pj4+IE9uIFR1ZSwgRmViIDI1
LCAyMDI1IGF0IDEwOjA5OjQyQU0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPj4+Pj4gRnJv
bTogS2VyZW0gS2FyYWJheSA8a2VrcmJ5QGdtYWlsLmNvbT4NCj4+Pj4+IA0KPj4+Pj4gVGhlIFRv
dWNoIEJhcnMgZm91bmQgb24geDg2IE1hY3Mgc3VwcG9ydCB0d28gVVNCIGNvbmZpZ3VyYXRpb25z
OiBvbmUNCj4+Pj4+IHdoZXJlIHRoZSBkZXZpY2UgcHJlc2VudHMgaXRzZWxmIGFzIGEgSElEIGtl
eWJvYXJkIGFuZCBjYW4gZGlzcGxheQ0KPj4+Pj4gcHJlZGVmaW5lZCBzZXRzIG9mIGtleXMsIGFu
ZCBvbmUgd2hlcmUgdGhlIG9wZXJhdGluZyBzeXN0ZW0gaGFzIGZ1bGwNCj4+Pj4+IGNvbnRyb2wg
b3ZlciB3aGF0IGlzIGRpc3BsYXllZC4NCj4+Pj4+IA0KPj4+Pj4gVGhpcyBjb21taXQgYWRkcyBz
dXBwb3J0IGZvciB0aGUgZGlzcGxheSBmdW5jdGlvbmFsaXR5IG9mIHRoZSBzZWNvbmQNCj4+Pj4+
IGNvbmZpZ3VyYXRpb24uIEZ1bmN0aW9uYWxpdHkgZm9yIHRoZSBmaXJzdCBjb25maWd1cmF0aW9u
IGhhcyBiZWVuDQo+Pj4+PiBtZXJnZWQgaW4gdGhlIEhJRCB0cmVlLg0KPj4+Pj4gDQo+Pj4+PiBO
b3RlIHRoYXQgdGhpcyBkcml2ZXIgaGFzIG9ubHkgYmVlbiB0ZXN0ZWQgb24gVDIgTWFjcywgYW5k
IG9ubHkgaW5jbHVkZXMNCj4+Pj4+IHRoZSBVU0IgZGV2aWNlIElEIGZvciB0aGVzZSBkZXZpY2Vz
LiBUZXN0aW5nIG9uIFQxIE1hY3Mgd291bGQgYmUNCj4+Pj4+IGFwcHJlY2lhdGVkLg0KPj4+Pj4g
DQo+Pj4+PiBDcmVkaXQgZ29lcyB0byBCZW4gKEJpbmd4aW5nKSBXYW5nIG9uIEdpdEh1YiBmb3Ig
cmV2ZXJzZSBlbmdpbmVlcmluZw0KPj4+Pj4gbW9zdCBvZiB0aGUgcHJvdG9jb2wuDQo+Pj4+PiAN
Cj4+Pj4+IEFsc28sIGFzIHJlcXVlc3RlZCBieSBBbmR5LCBJIHdvdWxkIGxpa2UgdG8gY2xhcmlm
eSB0aGUgdXNlIG9mIF9fcGFja2VkDQo+Pj4+PiBzdHJ1Y3RzIGluIHRoaXMgZHJpdmVyOg0KPj4+
Pj4gDQo+Pj4+PiAtIEFsbCB0aGUgcGFja2VkIHN0cnVjdHMgYXJlIGFsaWduZWQgZXhjZXB0IGZv
ciBhcHBsZXRiZHJtX21zZ19pbmZvcm1hdGlvbi4NCj4+Pj4+IC0gV2UgaGF2ZSB0byBwYWNrIGFw
cGxldGJkcm1fbXNnX2luZm9ybWF0aW9uIHNpbmNlIGl0IGlzIHJlcXVpcmVtZW50IG9mDQo+Pj4+
PiAgdGhlIHByb3RvY29sLg0KPj4+Pj4gLSBXZSBjb21wYXJlZCBiaW5hcmllcyBjb21waWxlZCBi
eSBrZWVwaW5nIHRoZSByZXN0IHN0cnVjdHMgX19wYWNrZWQgYW5kDQo+Pj4+PiAgbm90IF9fcGFj
a2VkIHVzaW5nIGJsb2F0LW8tbWV0ZXIsIGFuZCBfX3BhY2tlZCB3YXMgbm90IGFmZmVjdGluZyBj
b2RlDQo+Pj4+PiAgZ2VuZXJhdGlvbi4NCj4+Pj4+IC0gVG8gbWFpbnRhaW4gY29uc2lzdGVuY3ks
IHJlc3Qgc3RydWN0cyBoYXZlIGJlZW4ga2VwdCBfX3BhY2tlZC4NCj4+Pj4+IA0KPj4+Pj4gSSB3
b3VsZCBhbHNvIGxpa2UgdG8gcG9pbnQgb3V0IHRoYXQgc2luY2UgdGhlIGRyaXZlciB3YXMgcmV2
ZXJzZS1lbmdpbmVlcmVkDQo+Pj4+PiB0aGUgYWN0dWFsIGRhdGEgdHlwZXMgb2YgdGhlIHByb3Rv
Y29sIG1pZ2h0IGJlIGRpZmZlcmVudCwgaW5jbHVkaW5nLCBidXQNCj4+Pj4+IG5vdCBsaW1pdGVk
IHRvLCBlbmRpYW5uZXNzLg0KPj4+IC4uLg0KPj4+IA0KPj4+PiArc3RhdGljIGludCBhcHBsZXRi
ZHJtX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLA0KPj4+PiArICAgICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkICppZCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBz
dHJ1Y3QgdXNiX2VuZHBvaW50X2Rlc2NyaXB0b3IgKmJ1bGtfaW4sICpidWxrX291dDsNCj4+Pj4g
KyAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmaW50Zi0+ZGV2Ow0KPj4+PiArICAgIHN0cnVjdCBh
cHBsZXRiZHJtX2RldmljZSAqYWRldjsNCj4+Pj4gKyAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
Ow0KPj4+PiArICAgIGludCByZXQ7DQo+Pj4+ICsNCj4+Pj4gKyAgICByZXQgPSB1c2JfZmluZF9j
b21tb25fZW5kcG9pbnRzKGludGYtPmN1cl9hbHRzZXR0aW5nLCAmYnVsa19pbiwgJmJ1bGtfb3V0
LCBOVUxMLCBOVUxMKTsNCj4+Pj4gKyAgICBpZiAocmV0KSB7DQo+Pj4+ICsgICAgICAgIGRybV9l
cnIoZHJtLCAiRmFpbGVkIHRvIGZpbmQgYnVsayBlbmRwb2ludHNcbiIpOw0KPj4+IFRoaXMgaXMg
c2ltcGx5IHdyb25nIChhbmQgaW4gdGhpcyBjYXNlIGV2ZW4gbGVhZCB0byBjcmFzaCBpbiBzb21l
IGNpcmN1bXN0YW5jZXMpLg0KPj4+IGRybV9lcnIoKSBtYXkgbm90IGJlIHVzZWQgaGVyZS4gVGhh
dCdzIG15IHBvaW50IGluIHByZXZpb3VzIGRpc2N1c3Npb25zLg0KPj4+IEluZGVwZW5kZW50bHkg
b24gdGhlIHN1YnN5c3RlbSB0aGUgLT5wcm9iZSgpIGZvciB0aGUgc2FrZSBvZiBjb25zaXN0ZW5j
eSBhbmQNCj4+PiBiZWluZyBpbmZvcm1hdGl2ZSBzaG91bGQgb25seSByZWx5IG9uIHN0cnVjdCBk
ZXZpY2UgKmRldiwNCj4+IA0KPj4gVGhhdCdzIG5ldmVyIGdvaW5nIHRvIHdvcmsgd2l0aCBEUk0u
IFRoZXJlJ3Mgc28gbXVjaCBjb2RlIGluIGEgRFJNIHByb2JlIGZ1bmN0aW9uIHRoYXQgdXNlcyB0
aGUgRFJNIGVycm9yIGZ1bmN0aW9ucy4NCj4+IA0KPj4gVGhpcyBzcGVjaWZpYyBpbnN0YW5jZSBo
ZXJlIGlzIHdyb25nLCBhcyB0aGUgZHJtIHBvaW50ZXIgaGFzbid0IGJlZW4gaW5pdGlhbGl6ZWQu
IEJ1dCBhcyBzb29uIGFzIGl0IGlzLCBpdCdzIG11Y2ggYmV0dGVyIHRvIHVzZSBkcm1fZXJyKCkg
YW5kIGZyaWVuZHMuIEl0IHdpbGwgZG8gdGhlIHJpZ2h0IHRoaW5nIGFuZCBnaXZlIGNvbnNpc3Rl
bnQgb3V0cHV0IGFjcm9zcyBkcml2ZXJzLg0KPj4gDQo+IE9rIHNvIHRoaXMgaXMgYWN0dWFsbHkg
YW4gaW50ZXJlc3RpbmcgY2FzZSwgc2luY2UgSSBhbSB0cnlpbmcgdG8gZml4IGl0LiBUbyBpbml0
aWFsaXNlIHRoZSBkcm0gcG9pbnRlciwgd2UgbmVlZCB0byBpbml0aWFsaXNlIGFkZXYsIGFuZCB0
byBpbml0aWFsaXNlIGFkZXYsIHdlIG5lZWQgdG8gcnVuIHVzYl9maW5kX2NvbW1vbl9lbmRwb2lu
dHMgZmlyc3QuIFNvIElNTywgd2UgY2Fubm90IHVzZSBkcm1fZXJyIGhlcmUsIGJ1dCByYXRoZXIg
ZGV2X2Vycl9wcm9iZSBjYW4gYmUgdXNlZC4NCg0KU28gdGhlIG9wdGlvbiBoZXJlIGNhbiBiZToN
Cg0KMS4gVXNlIGRldl9lcnJfcHJvYmUgKGl0J3Mgbm90IHRoYXQgbm8gRFJNIGRyaXZlciB1c2Vz
IGl0KQ0KMi4gUmVtb3ZlIHRoZSBtZXNzYWdlIChzZWVtcyB0byBiZSBkb25lIGJ5IG90aGVyIGRy
bSBkcml2ZXJzIGFzIHdlbGwsIEkgd291bGRuJ3QgcmVhbGx5IHdhbnQgdGhhdCB0aG91Z2gpDQoN
Cg0KVGhvbWFzLCBBbmR5IHdoYXQgZG8geW91IHRoaW5rPw==
