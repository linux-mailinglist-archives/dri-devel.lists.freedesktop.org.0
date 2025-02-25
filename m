Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C19A443A5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:56:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A5610E6FF;
	Tue, 25 Feb 2025 14:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="QtQXPd+S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011036.outbound.protection.outlook.com
 [52.103.68.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F6D10E6FF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 14:56:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oe/xadwlTdSdXTjfoWyduiQo0pTDXZeMyh8rAck6jDscHGgizACFp0Dx4rGW4Rl17BylfrP34iW5GjkViGe71QASNbXAswArIqoQcFFFjigg7gzmWZc156abvhFAkiWfX4+V5oya/8ju1NulgYI4SPGwExBFeFZoQ7VWeknhcXij33ej910qK9Ka+WH8CaXCIArt0yyoi4MY/v7tWBU2WB+CL/sE9IBInLF9Wuf1/g4GAV0uv7PWzjowEDn4K0Tq5/6jmpuWHJr+bv/HJPrp31QcjmUeCZVmWK2p/W0ZZThCq8h+cqiyi/KX0wono71hD47H2w72PSMh+EtOm3HRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POeGdujxsAZzpFN+RkG5lhcU40EVsUb2SqcDiiohbbQ=;
 b=GrlaZkhDPkHjOA7W99zLWA5dLtDHC0RM5KhS8xbs4eD3JlNQOK5kDQwULGAgdqmIOfHQmLWb0bXo6T+XMvOmNv7EYC7J6cWk2VhC8u1cv/MtJCheNIto4AEtVsqVgEfTrlUOvORysbC5JKvRO7NAoED46LGMvfrmP/vpzRtxjZ5Jn3Ch/q016+PsCrkGDMH6SGDzdkl3e8juObgjVrlN2ZTK9YGccjWE6kIWrR8NP5xFQECGopfb3IkiOBe47/1izJF0J/CHW1k9fQzrwZZmiZVKamTXCyRSGEYMvG4e30Jj1C8psPtqePerrl+04yaDdqfG27VNt6Dz67GNex2Nfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POeGdujxsAZzpFN+RkG5lhcU40EVsUb2SqcDiiohbbQ=;
 b=QtQXPd+SNa4zcKpA5CjF21lmUSmjtVCUjcIwyfrIiuTZuoyf87PD8JDY/4H9ac0gBSgi7+YCD7D9NKMkv2G7wxEHSiE0LgplhC0TX+hP/6bPhopOsHNUnMS514PzgAwXG1cHeexkta2o47R7NfKM3v6HSmW/NOEg5vH4UU1ZXKPBCCX2F6yXKByITywytouBg+JXlDCXeKgykw5u/kOj8bveOMZ4zKL0+0FerlmOfmBEyuTb1EbibSTRGgiqgIdUC6XvK+dJpzO7+DyxDi+AuavBbRlwv105n4qFd4DEPEBZF3pDO6YMpDHJsbDjcbAgNafAEcXlk+toilD2ewUP5g==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNZPR01MB10733.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:248::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 14:56:37 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 14:56:37 +0000
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
Thread-Index: AQHbh21jOPDlavrp2kW5T/JI6UK95bNX0p8AgAAXooCAADE6yoAAAJlu
Date: Tue, 25 Feb 2025 14:56:37 +0000
Message-ID: <PN3PR01MB9597A550BF7FE762ED5FD172B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PNZPR01MB10733:EE_
x-ms-office365-filtering-correlation-id: 27c33262-526b-4b4c-3de3-08dd55ac9ae9
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|461199028|19110799003|12121999004|7092599003|15080799006|6072599003|8060799006|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?UUQvSDN0WUluV0FYMWY1ZXA5eHZvQU9QVk9RQ2xlMmhtdjF0eUpUdXFJTWZV?=
 =?utf-8?B?TVR0dVZ2cExvNzkybmIyK25YblNkRDBmcHBCOVkza2NzblI3TndzeXB4bU5J?=
 =?utf-8?B?VjV3T0xkQmlWNU9BTVN0UTJwYmhOaXNZcHpnem1yWmticDljdmRaTitDM21I?=
 =?utf-8?B?WnZ3aCtKOWNFM0MzaVpCZzl4L1BOblZSTjRhem5GdUZoTWEvNnF1NTJmR3kr?=
 =?utf-8?B?czF1SjhoY2VuKzg3L2R1d2pTc3NWWktBNy80MVNLMjVMM2N2ZmtPYkU0RWIx?=
 =?utf-8?B?SjNmV1EzMll6VDlsU2k5S2MvUlRiMzBrZXB1LzdINXB3M1REM2p5a3JVbEhE?=
 =?utf-8?B?Q0N2Tlpkeld6VmEwd0sya3NmQUdaekxwdkFXY2xPeFo5dEd0ejM2WE1HbGtX?=
 =?utf-8?B?U20rWEhrMUNhV1ozYXYzTlZDSTFVYUtpTjF3ZjFUS0FjblJEWUhaL2pWTmpa?=
 =?utf-8?B?OXhMd29DL2paR29GbTB4K0dWTHJSMDJLMXphR0MyRGhHYi85RFVPSDNXUUVo?=
 =?utf-8?B?WlBVdTk3TTAvZUtlbmdHNVovVXlWU0ExZXh5cVF2eG5QVkd5QS8wR2RJUDVr?=
 =?utf-8?B?enFINk9qUEZMUGZkeldNaU1yT3BlMkxZZDFPdVpjZ0ZDYVAzTW9JYVhNd2xS?=
 =?utf-8?B?N3cycVZTN1ROaGp5UW1EOXJCTnozaFpUMUUvL1ZLWTl2SFlCOWdxT20zbWhx?=
 =?utf-8?B?T2NsVmFIWmhHVW5MaUdKVFVCaENQcUk1WEhhdG8zUS84MUVkZVEzUTR6WGts?=
 =?utf-8?B?Tm16SGVEVnovR3I1WDZiVVJHUVB1cXdMeWcwR09tcHUyVW4raHYrT2VHSmIz?=
 =?utf-8?B?dGJOSVpxN3owSFFGaWhMUlk4TGFHQ1kvTnVjK1JBQ1VYd29lSWlkeFpTblNZ?=
 =?utf-8?B?UDdYUGd0STI0Vng4L2IyUHhHWVZPVzQwd3pQOU43cDE0cU9MY25ubFpUNkVu?=
 =?utf-8?B?NmlyM3Mvdng5RXBPWnJjR0F3d0V5UzlzS09ibm1FK0lxSzg4ZVhEai9XaW1J?=
 =?utf-8?B?djZ3ZFR1a0RiaFd4djdxUzlZa3d4MlY3ekFFK2EyQjFMalJaZzNVWmsrc3NX?=
 =?utf-8?B?TWFhUWZSaFBCcXNYU29PcmV5MFRhTEQyYStsWW5QanNSMjNYQlhPdEgxSmgw?=
 =?utf-8?B?NGJFUFJueDBCU2E4eXVVbzVpK1dKZXhIRDBkdEsxbms5bEhucDNad1BvOVFs?=
 =?utf-8?B?ZEZQNVVjK3drVDdDNDJvUmdtZUoyY09yLzVLY2RTVkZMZEtCNVFqUkRtZXI3?=
 =?utf-8?B?NkgzVStHY01iOG8yUUFwY2kwa0RWb3R1b01aeWxVYzZMYlB0NUhYaDNWOVA2?=
 =?utf-8?B?QmJVZnJ2UERzTFlvbFZwaGxjWWZhM3lEd3gzQlRjemRkcXphazRXZUNnNnlU?=
 =?utf-8?B?SmZmZStpVVZ3L0JvK0ZiTm8rR3FYTDhwS251L3Q1ZWoyS1hBWEtsdmNYYlhh?=
 =?utf-8?B?eVl5VTViTk84MlNza0JGWkFwNGc4SGdCQ3RkajNJTFpEODQwalIwZzl6Y1ZK?=
 =?utf-8?B?dzNXQ091bGhFdmRUOTNPRVZNOGFmc2x0QWJXZmc1TEM4dkxTOUFtTmdWTkMz?=
 =?utf-8?Q?jI5y5FY0B8VqIOoLip+hrFvxw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFFiNmVLV1AwQnkxWnlyU3pVQ3BoR3dLbU1oTFJSVk9pcXlNclljVmNaaWRC?=
 =?utf-8?B?ZHE5dlFrODVCbVdDRUFtd2ZlRWY1aEl1cEhvMThpenV4TWw3ZVFmNXg2eEli?=
 =?utf-8?B?UWFZamJLdVNoV0E4TkpXOFRmNUt3cXZGN1puSXM2cEpvaVRockc0NlpnTFpq?=
 =?utf-8?B?SnQxRW5kM1VmL25uTHVuMVlvaGk5eVZBazQ0SE9JQ09lVDBHN2pGM0hBMmdH?=
 =?utf-8?B?NlByT21BYVJtaXoyVXh3UTZQLzE1QXhiYzgwNEhndTUvSm0zQnFBYU80SU9k?=
 =?utf-8?B?ckYzZjBNM1p0d2ttZ0pac2Nqd3plU0x4blJHMlErRVo4WnRPaVo2YTRhVXly?=
 =?utf-8?B?UGRLb3l0L3NLTjdlZ3ZZOGJCWGtybmlKaW41RkNHRlRiMGY5UjIyaFViWVZJ?=
 =?utf-8?B?ck4xdnByNUV3djE1T2J4dzhUSVBHcVVBZ1UvZkFZK0VQVUVtN0hsdm1wRUtB?=
 =?utf-8?B?NExqRDdLTldUaVZaZVdPMnlHczZwekZlZENNaTlQMWZZVnNMM1Y2QXV2d0E3?=
 =?utf-8?B?YVF0cm44YndjQ2g5cHFObWNxN0ZYTW4vb2R3TGIza1VGQ2VBTFhGVTZrWXVG?=
 =?utf-8?B?WDRQc3ROVEF4dUtaQW90VWdvNDVvc2FLZG5kc0VjZWhyck0yVGxEYmcvT1Bw?=
 =?utf-8?B?UElkUitCejEvWFZGaXBDVDBvSmZSY2xsOFlMd0JPLy9yTjNuSlRDZG4yRkFV?=
 =?utf-8?B?R2tKWkNTckIxYnMwS3h1SXdxMDFZNFVXcW03U0g1RGw3d0IrUG8zaHhXbDhJ?=
 =?utf-8?B?eWxiUEtjS1lXczBnUjlNVDdrbkxGS3lxWHBub3FRSTlqOTJKZlc5NVBuWG5B?=
 =?utf-8?B?V0NOMDhDTkRuMXB4Y2VqMTRFUWZvOFR3ZHRFZGMwc3phQkJlWHNrZk5PNVps?=
 =?utf-8?B?bkh0VU9WS0lZVktPR2U0UklxK3lMMncwbC9UcFZ2c29WSkQ1a3pxb3ZOR3Zh?=
 =?utf-8?B?WTZYOFhuenVvSUF1cTFiL3E2cnlUZDJQam1Ya0luVW9HcUVhYjZhK3RLUHlt?=
 =?utf-8?B?b2lJSHgrdC84R2o4dlA2SmFRMGU5WXdoMkFiejVSRXRnZVowNnZpY3VjVk0w?=
 =?utf-8?B?R01QNGI3dHRDUGVUci9KYXZuNHErMnVIWENCU3pMNHJaZU1lc1dlekhZUkZL?=
 =?utf-8?B?S3hWZ2xqOE5mTXNROVlDT0ltTFEyR3BiZW5ETUhJQUlTcnpxazJGbHdvSkFF?=
 =?utf-8?B?UFFQNnRMcW5vcGxjRWZINGp3WjYybUI4am5jTXBlYldRb282VlA5aDRtSUxT?=
 =?utf-8?B?dVVZNjBtVEl2RStiZVcwcDdyOUdOSk00eE9aRlpXbFlTZ1hCblRzd3FnVTlw?=
 =?utf-8?B?bWdoNGpFK0NqMmdjdjh2WFhJNkp4YVhidjV5RDE2cytPVEZvWldpUEpLVXls?=
 =?utf-8?B?ZHMyWTUraXlKcEkxb0JsTWFranoxVGdla0s2WmRYdHNLVXF5RkVQNFJZVnVw?=
 =?utf-8?B?VW1vRU4yRUp0elAxR05ZU21jZElIRlZ4QzNUaUlpVERGU2hDNlpXOE96Y2lp?=
 =?utf-8?B?Vk5XUUxWNTdaZGcxVkFnTmxHZVN2YjRXSFBXOE0vTkFmYU90ekdzRy9hTEpS?=
 =?utf-8?B?ZVRnM2txMmppbHBNd1BOYXNDOWRRb0RlMFBOSDVBUWNIQXlXR3AwWitRUUEx?=
 =?utf-8?Q?zU+iSTvNyehtLG427wKJmeHfrix63dX91Z9lprwohHlY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c33262-526b-4b4c-3de3-08dd55ac9ae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 14:56:37.7692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB10733
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
ZGV2X2Vycl9wcm9iZSBjYW4gYmUgdXNlZC4NCg0KSW5mYWN0IGRldiBpcyBhbHNvIG5vdCBpbml0
aWFsaXNlZC4uLi4uLg0KPj4gDQo+PiANCj4+PiANCj4+Pj4gKyAgICAgICAgcmV0dXJuIHJldDsN
Cj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICBhZGV2ID0gZGV2bV9kcm1fZGV2X2FsbG9j
KGRldiwgJmFwcGxldGJkcm1fZHJtX2RyaXZlciwgc3RydWN0IGFwcGxldGJkcm1fZGV2aWNlLCBk
cm0pOw0KPj4+PiArICAgIGlmIChJU19FUlIoYWRldikpDQo+Pj4+ICsgICAgICAgIHJldHVybiBQ
VFJfRVJSKGFkZXYpOw0KPj4+PiArDQo+Pj4+ICsgICAgYWRldi0+aW5fZXAgPSBidWxrX2luLT5i
RW5kcG9pbnRBZGRyZXNzOw0KPj4+PiArICAgIGFkZXYtPm91dF9lcCA9IGJ1bGtfb3V0LT5iRW5k
cG9pbnRBZGRyZXNzOw0KPj4+PiArICAgIGFkZXYtPmRtYWRldiA9IGRldjsNCj4+Pj4gKw0KPj4+
PiArICAgIGRybSA9ICZhZGV2LT5kcm07DQo+Pj4+ICsNCj4+Pj4gKyAgICB1c2Jfc2V0X2ludGZk
YXRhKGludGYsIGFkZXYpOw0KPj4+PiArDQo+Pj4+ICsgICAgcmV0ID0gYXBwbGV0YmRybV9nZXRf
aW5mb3JtYXRpb24oYWRldik7DQo+Pj4+ICsgICAgaWYgKHJldCkgew0KPj4+PiArICAgICAgICBk
cm1fZXJyKGRybSwgIkZhaWxlZCB0byBnZXQgZGlzcGxheSBpbmZvcm1hdGlvblxuIik7DQo+Pj4+
ICsgICAgICAgIHJldHVybiByZXQ7DQo+Pj4+ICsgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgcmV0
ID0gYXBwbGV0YmRybV9zaWduYWxfcmVhZGluZXNzKGFkZXYpOw0KPj4+PiArICAgIGlmIChyZXQp
IHsNCj4+Pj4gKyAgICAgICAgZHJtX2Vycihkcm0sICJGYWlsZWQgdG8gc2lnbmFsIHJlYWRpbmVz
c1xuIik7DQo+Pj4+ICsgICAgICAgIHJldHVybiByZXQ7DQo+Pj4+ICsgICAgfQ0KPj4+PiArDQo+
Pj4+ICsgICAgcmV0ID0gYXBwbGV0YmRybV9zZXR1cF9tb2RlX2NvbmZpZyhhZGV2KTsNCj4+Pj4g
KyAgICBpZiAocmV0KSB7DQo+Pj4+ICsgICAgICAgIGRybV9lcnIoZHJtLCAiRmFpbGVkIHRvIHNl
dHVwIG1vZGUgY29uZmlnXG4iKTsNCj4+Pj4gKyAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4gKyAg
ICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICByZXQgPSBkcm1fZGV2X3JlZ2lzdGVyKGRybSwgMCk7DQo+
Pj4+ICsgICAgaWYgKHJldCkgew0KPj4+PiArICAgICAgICBkcm1fZXJyKGRybSwgIkZhaWxlZCB0
byByZWdpc3RlciBEUk0gZGV2aWNlXG4iKTsNCj4+Pj4gKyAgICAgICAgcmV0dXJuIHJldDsNCj4+
Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICByZXQgPSBhcHBsZXRiZHJtX2NsZWFyX2Rpc3Bs
YXkoYWRldik7DQo+Pj4+ICsgICAgaWYgKHJldCkgew0KPj4+PiArICAgICAgICBkcm1fZXJyKGRy
bSwgIkZhaWxlZCB0byBjbGVhciBkaXNwbGF5XG4iKTsNCj4+Pj4gKyAgICAgICAgcmV0dXJuIHJl
dDsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICByZXR1cm4gMDsNCj4+Pj4gK30NCj4+
IA0KPj4gLS0NCj4+IC0tDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBG
cmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPj4gR0Y6IEl2byBU
b3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KPj4g
SFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo+PiANCg==
