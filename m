Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDD9860AA7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 07:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059F710EB04;
	Fri, 23 Feb 2024 06:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.b="T1pIylmg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on2123.outbound.protection.outlook.com [40.107.12.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A69910EB04
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 06:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBl5mndw4JO2VJ6HUVhsPne3K0nC5gZSTRd603wFS6zfy7ZQrS+FnVC5xBVyT90txDfwJTa/PN7lRXFBFiXWqbe0HbJfgtyfIoEqnhP4dMXy5/HjqgaR/oZfJWlCUyd+oKyxXShSk1wXz/8jdTUULXU6W1iMllAx2ReaPcnLHB7e+eoSD9oPISwPWnjEbI6uhtrqb6YujM3cyh7CckKt4qzza2OHVxe5qOPGx57cwCsKT7HubS7dC73Cs3I2GMCOexTipBF3bBHnwVO6M2+9ol+0PUwBhj3tSh7+4vg5MPRYJl2CTT4RRw+4+KeFRPs1VN/oWPCK/xAosE7kXa3FYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSXHFovGd5Sv++vZsIa+Pgb1VVIc6zKYmouBq6Fr9cQ=;
 b=QRCVh5kaXd3lgDwyKjhVItU1eIBL/jrTy3nSqUxRP87DCobr+j4aQa6GlLHLZ5vAfCIySn88ODSewZbsTPCj78yTOYtix3pnG/GII+OsXLXAexwgZJDFOiNx57M3C96/kGjoTSUi2Y5mrVtZFKm70htgQtNaDQR6eDf6jwCMDEwaI2RlMGQ4Y+jOXKZN6BXfqW94v+Ovyt6RTZtS5IrQ+VXe1P8REyeQs9rBuo7IojkHaG8ICJYadHu2/sjYnRL37gycFcNDSdzCzSqajOxp6ZcXHH3qpKuSHcDOaBhcQK4V6/655tEuWvxxMqPOBzHciEghPrzhp1AowD12OcP9pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSXHFovGd5Sv++vZsIa+Pgb1VVIc6zKYmouBq6Fr9cQ=;
 b=T1pIylmgZIJlmynB+VtT+3omV34e7kKXN8mF3Mbd52UUQfUiOtAZAcA3DC2tmbXmZIvJmeEw4XXfVqVkwiEOxR6fcuygGaJkMI1vJ2XYud6o4MHp29g3InMdkLHOcuos9zS66PDtgNgVKyYtuzeH9bXWWGC4ujD2nw4RL4UDjuW5BO5WelzK3CsqAyDKRnxLUpXbwWD9axVPk2TWCoqQLysjsHDXLkr3qh2abm16Z+b33oJKjtqQ95VX5Szpz+Ajh51B+n7V5lhHHrx7R9y96JzVOGgHUVJWdYGk6LOaDwvWRnMi6PJw4hlMJoybg3Rg8nUU5iBNQbF7r5MUJcvEWQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3228.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 06:12:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::46af:917d:3bb2:167e%6]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 06:12:59 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: drm_format_helper_test fails Subtest:
 drm_test_fb_xrgb8888_to_xrgb2101010 on Big Endian machines (kernel 6.7.5,
 ppc64)
Thread-Topic: drm_format_helper_test fails Subtest:
 drm_test_fb_xrgb8888_to_xrgb2101010 on Big Endian machines (kernel 6.7.5,
 ppc64)
Thread-Index: AQHaZh9ZQhm4AtwYmUiq0+H8HCUkhg==
Date: Fri, 23 Feb 2024 06:12:59 +0000
Message-ID: <9344c3bb-08b4-4816-8c0f-14934ffd2f1a@csgroup.eu>
References: <20240220004531.5c6e5b38@yea>
In-Reply-To: <20240220004531.5c6e5b38@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3228:EE_
x-ms-office365-filtering-correlation-id: 8205c09f-e36a-4c47-3b1b-08dc34367c47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TwJ1Edk9RRDqrmsHTXfORV7FPmmvCW0PKe6yzBhVyeenO9J63VH0vifRjfhFRuyc6CCeBD/69cI9NXtmOCID00a9O6+owwqU1oPYYTG0fXxRy2OlMEd/Np3yCn6Wvb1wNPBJ4O0uqHdDWiQ2nfRDyWrnbAsT2sgeRoMZdL6iw70GVbxBI39F8TYbL9A85hsFBqQxg9ZYSXN5ynh4/Xd3CMP6gc9yHsQ4zRYTjDUYaq0cLLRDaDg014Jv71T6Rb/p7cTl4HlxH468Hwf4wR3UjIbpVS6zbTxKZ2uG3OfoVxAmcIGG+CkpDPCVefpo0khuIzzoqpn2Wc2kdYAYAdOwdj+r8eO3VWZJLvTQVd42UcgoJ1WqwL/SwZ8fHmJcmrL2GIjm2vMp0GQwvZG95clD8hPoOhRpS43J2XBOHJLXxn57ikrtXr0ZKefclAH45pDKS2JHJgFuPfKD+h1/GV61MQcrQ6yY6FspYjb4y06cDcN5Iu0XFubq9hZcZrVjOYWLP0nrn4v3sP1XJq0598U0MXJU2N/0PDCI/Moib+MuO19OhGEy1ZDT4T3BEEzeF/v0U0pqPovOPOIKMQqov1BzlwmUR+Sg/A2Iz5v90s1ooQk27WgVm7jmw2W00VvLma9y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXhOTTVrTVBuYXdrS0x4YUJnVDRnK0lDNlBNUDU2NUptaHZGN0JoTFk5TGlo?=
 =?utf-8?B?NE5RNllqcnlpaW1EY3pYUFowMkJGSlpxSEJ2cmJ0Q3dPV1JuTlhzZFVLbGFi?=
 =?utf-8?B?TDNmT3pxK0Z1MHFKa3ovdDNWT1g4bnJ3S1ZoTjAzNnIzc0tTdVZJSFRCZHkv?=
 =?utf-8?B?Ukt5aElVaUZxZEZkU0pjcEQ1MU1vZUFkbmhwbjk0NkpuQ2lzNVNpSmFTV2Jz?=
 =?utf-8?B?SFpScFJyb0V0M29kYWFkQUtVL0dJdUFyanFBaUZhN1U4Q1RVZFRKd0RMUE1u?=
 =?utf-8?B?STIySndwL1kzeXdmZnBaM1JIakVKUHpBb2F3Q2ZZeEhta2ZRSVdOeWgzUmpw?=
 =?utf-8?B?eHgzZWNNZkU5TmJieFpsL0kxSjJLbSswUUlyRi9WSkZCelBSWnVtYnhseWVF?=
 =?utf-8?B?NERMOC8zWjZDQzE2NjFFZDdWYUhHODkyd0dPaHVjWEVrbGUrM2hiOHkra1NT?=
 =?utf-8?B?bEZqNXRnNUJXd09YandaVEpZOUkzcktweFlaS3ZuellRRG96TUVwQlRXQkF2?=
 =?utf-8?B?WU5nRkgzZ0NCWFdlL0ZFelBBMThrWVZHWVlPUlhXNXM5K20xN3hNODB5eFVT?=
 =?utf-8?B?clE1enRlZE9uQVdvdlFtSVc1UkVYT0RKRmZ5c2VsbkJqK09NUFRlL29VQk5I?=
 =?utf-8?B?RjNKdUp4bWJwYlR2R3dhUjZmNHhuTlAxMytxZy9OaGJqdEtkZFZJSVR1Mndr?=
 =?utf-8?B?bmdpckE2WU1vNjBIek1kSTJ6bmNKZUVTLzdhYnIzdDA0d29OT1FyQWpJY3lu?=
 =?utf-8?B?RVNydlo0TzdMWE1sWEJXZnRGZGNTSUFCN0lUQm9pamN3S3p4eUpZWUFOTm5w?=
 =?utf-8?B?MkVGR2ZrTkRUcFdvTW9LRHgyZzJKaFU2TkdWQ21ST2hUVGd2dHUwOEhzMXFt?=
 =?utf-8?B?eUwwMG51dVNPMDFDazZOT21QQUxKbk9CQzROVGEwcWNuRnJnNExwUElNNmRZ?=
 =?utf-8?B?REN4cm9nOGZmOTBZTTNUd2p2R3JqTTVwWktCcTlQRXphTkF3dlVUelNUMkJo?=
 =?utf-8?B?NTlUZDFldTVIdWpDUmp2UWZZcDc1d0tMVjdmWFJZaXJpbWNYK2pnU0d4UEV0?=
 =?utf-8?B?K3ppOVpiRWpzaVBvNENaNVJ1SmplZkZDVWlhbjU3ZFBLZTUweXc5QTF6eGJt?=
 =?utf-8?B?anZ5dXN1UjExTFhPeWdGOTZZVXJRWWdHWENqMEtmdkRDYXQwcU9XWit0NEIx?=
 =?utf-8?B?WkNodUtaQkhCOHpKYkp3dnRRVWNaK3NsTDBkOEM1dTFSck1LVzExdzVZK3B5?=
 =?utf-8?B?azIzVWl4OU53TUxxWUwzNGw5bDlvLzNMZGdOdHJ3SlhSeEduYXJKRlJ6Y1ln?=
 =?utf-8?B?TVFtanZyayt0OE95YmllTStlV2Fjd1dzdVlCWHBsaDIxNEpuelF1VmJsWXFU?=
 =?utf-8?B?eWZLOFJBQ05HTlV5K1JHekY4LzdhdXM0a2M3Tnk2WHNOd3U5OFBoYjhtRW9P?=
 =?utf-8?B?bUxmV2JnTm54YldTR2dlMlVTK1ZYbkhiOGZKWjRhajV2dnkrV2xYUS9pN2dS?=
 =?utf-8?B?MlNHQkVZVWludVFFTVZ0Um51ZUpPN3NuSEd3ZTBDZThjYy8zdGJ5N3d1MWZF?=
 =?utf-8?B?cWh4RWtENERVNlFzdFVsSVNIVkw3WEoxcGFRR1kzRWdIcTl6N0ZhQzhRR2pU?=
 =?utf-8?B?aXg5Q2JEdnVac1pTMTVXSGJXWE1KSFhJUmE4R3ZVMFU0RkxnakVjMFFia2hi?=
 =?utf-8?B?TmFPMm9ybXpqcnFuNUsrOEhNdCtTTlhHRmN3UmZuWWJGd2twWkpzNlJEeTht?=
 =?utf-8?B?QXlKVGp5ZTRLbkU3dk9TZXdwT0Q2MnRIUzEwTnVsR3p1aDNybDgyZjJIaXJV?=
 =?utf-8?B?eklYNGl4cTFmUHlGSWVJVjBzdldwd0Uxa1pTZTMxVk96WlVJZWRyazRUV0RI?=
 =?utf-8?B?dVhkejdDTkxKYy9zNTd4MmJLVStzTUFNTUozQUdsd2czdGFObERnUHJJVWl1?=
 =?utf-8?B?MWxnOCtVb1VnRllVUElVZUpyeDZpY1FXM2V6OUU0aEF1RE1RRGg3UDlLWm5t?=
 =?utf-8?B?MzlsaFBidzZQVFRzRk1Ud1Q4Ri9WV0kxY28ycW1jVlNZL1JSb1BhTkZDM09r?=
 =?utf-8?B?Z0VoN1FkT0JTelMwOS9rV2tSNndVVitQZUlmTFFiclVSbEQrUlFXZ1dPREo5?=
 =?utf-8?B?Ylh1RmxmdVR5aS9FSGVDL3MvaEs3V0VXK1NzZ2xQTU40bVk0dU5DVEhFN3FY?=
 =?utf-8?B?cVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83D0477F774DA342B452D2F770195B91@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8205c09f-e36a-4c47-3b1b-08dc34367c47
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 06:12:59.7101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h7l/3Zk9hbsW1F5uvpCfBvdnNRb13ZI0xc81i2LOwCXklZflJ0WQonROzf+NvRp0CF24y1GR21qpYBsjb7diJllQQeqLYY0AJFnd+Q+CSCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3228
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

SGksDQoNCkxlIDIwLzAyLzIwMjQgw6AgMDA6NDUsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6
DQo+IEdyZWV0aW5ncyENCj4gDQo+IEkgcmFuIHNvbWUga2VybmVsIGRybS90dG0gdW5pdCB0ZXN0
cyB0byBjaGVjayBmb3IgcXVpcmtzIGluIHRoZSBkcm0vdHRtIHN1YnN5c3RlbS4gT25lIHRoaW5n
IEkgZm91bmQgb3V0IHRoYXQgdGhlIGRybV9mb3JtYXRfaGVscGVyX3Rlc3QgZmFpbHMgU3VidGVz
dDogZHJtX3Rlc3RfZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTAgb24gbXkgVGFsb3MgSUkgKHBw
YzY0KSB3aGljaCBJIHJ1biBpbiBCaWdFbmRpYW4gbW9kZToNCj4gDQo+IFsuLi5dDQo+ICAgICAg
ICAgICBLVEFQIHZlcnNpb24gMQ0KPiAgICAgICAgICAgIyBTdWJ0ZXN0OiBkcm1fdGVzdF9mYl94
cmdiODg4OF90b194cmdiMjEwMTAxMA0KPiAgICAgICAjIGRybV90ZXN0X2ZiX3hyZ2I4ODg4X3Rv
X3hyZ2IyMTAxMDEwOiBFWFBFQ1RBVElPTiBGQUlMRUQgYXQgZHJpdmVycy9ncHUvZHJtL3Rlc3Rz
L2RybV9mb3JtYXRfaGVscGVyX3Rlc3QuYzo5OTUNCj4gICAgICAgRXhwZWN0ZWQgYnVmID09IHJl
c3VsdC0+ZXhwZWN0ZWQsIGJ1dA0KPiAgICAgICAgICAgYnVmID09DQo+ICAgICAgICAgICA8MDA+
PDAwPjxmMD48M2Y+DQo+ICAgICAgICAgICByZXN1bHQtPmV4cGVjdGVkID09DQo+ICAgICAgICAg
ICA8M2Y+PGYwPjwwMD48MDA+DQo+ICAgICAgICAgICBub3Qgb2sgMSBzaW5nbGVfcGl4ZWxfc291
cmNlX2J1ZmZlcg0KPiAgICAgICAjIGRybV90ZXN0X2ZiX3hyZ2I4ODg4X3RvX3hyZ2IyMTAxMDEw
OiBFWFBFQ1RBVElPTiBGQUlMRUQgYXQgZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9mb3JtYXRf
aGVscGVyX3Rlc3QuYzo5OTUNCj4gICAgICAgRXhwZWN0ZWQgYnVmID09IHJlc3VsdC0+ZXhwZWN0
ZWQsIGJ1dA0KPiAgICAgICAgICAgYnVmID09DQo+ICAgICAgICAgICA8MDA+PDAwPjxmMD48M2Y+
DQo+ICAgICAgICAgICByZXN1bHQtPmV4cGVjdGVkID09DQo+ICAgICAgICAgICA8M2Y+PGYwPjww
MD48MDA+DQo+ICAgICAgICAgICBub3Qgb2sgMiBzaW5nbGVfcGl4ZWxfY2xpcF9yZWN0YW5nbGUN
Cj4gICAgICAgIyBkcm1fdGVzdF9mYl94cmdiODg4OF90b194cmdiMjEwMTAxMDogRVhQRUNUQVRJ
T04gRkFJTEVEIGF0IGRyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fZm9ybWF0X2hlbHBlcl90ZXN0
LmM6OTk1DQo+ICAgICAgIEV4cGVjdGVkIGJ1ZiA9PSByZXN1bHQtPmV4cGVjdGVkLCBidXQNCj4g
ICAgICAgICAgIGJ1ZiA9PQ0KPiAgICAgICAgICAgPGZmPiBmZiAgZmYgPDNmPiAwMCAgMDAgIDAw
ICAwMCA8MDA+PDAwPjxmMD48M2Y+IDAwIDxmYz48MGY+IDAwDQo+ICAgICAgICAgICA8ZmY+PDAz
PjwwMD48MDA+PGZmPjwwMz48ZjA+PDNmPjwwMD48ZmM+PGZmPjwzZj48ZmY+PGZmPjwwZj48MDA+
DQo+ICAgICAgICAgICByZXN1bHQtPmV4cGVjdGVkID09DQo+ICAgICAgICAgICA8M2Y+IGZmICBm
ZiA8ZmY+IDAwICAwMCAgMDAgIDAwIDwzZj48ZjA+PDAwPjwwMD4gMDAgPDBmPjxmYz4gMDANCj4g
ICAgICAgICAgIDwwMD48MDA+PDAzPjxmZj48M2Y+PGYwPjwwMz48ZmY+PDNmPjxmZj48ZmM+PDAw
PjwwMD48MGY+PGZmPjxmZj4NCj4gICAgICAgICAgIG5vdCBvayAzIHdlbGxfa25vd25fY29sb3Jz
DQo+ICAgICAgICMgZHJtX3Rlc3RfZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTA6IEVYUEVDVEFU
SU9OIEZBSUxFRCBhdCBkcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX2Zvcm1hdF9oZWxwZXJfdGVz
dC5jOjk5NQ0KPiAgICAgICBFeHBlY3RlZCBidWYgPT0gcmVzdWx0LT5leHBlY3RlZCwgYnV0DQo+
ICAgICAgICAgICBidWYgPT0NCj4gICAgICAgICAgIDw3Mj48NDY+PDg0PjwwMz48MTQ+PGQ0Pjw0
ND48MDQ+PDBjPjwzYz48MmY+PDJhPiAwMCAgMDAgIDAwICAwMA0KPiAgICAgICAgICAgIDAwICAw
MCAgMDAgIDAwIDxjZD48MGQ+PDFmPjwxYj48NzI+PDQ2Pjw4ND48MDM+PDE0PjxkND48NDQ+PDA0
Pg0KPiAgICAgICAgICAgIDAwICAwMCAgMDAgIDAwICAwMCAgMDAgIDAwICAwMCA8MGM+PDMwPjwy
MD48MmE+PGNkPjwwZD48MWY+PDFiPg0KPiAgICAgICAgICAgPDcyPjw0Nj48ODQ+PDAzPiAwMCAg
MDAgIDAwICAwMCAgMDAgIDAwICAwMCAgMDANCj4gICAgICAgICAgIHJlc3VsdC0+ZXhwZWN0ZWQg
PT0NCj4gICAgICAgICAgIDwwMz48ODQ+PDQ2Pjw3Mj48MDQ+PDQ0PjxkND48MTQ+PDJhPjwyZj48
M2M+PDBjPiAwMCAgMDAgIDAwICAwMA0KPiAgICAgICAgICAgIDAwICAwMCAgMDAgIDAwIDwxYj48
MWY+PDBkPjxjZD48MDM+PDg0Pjw0Nj48NzI+PDA0Pjw0ND48ZDQ+PDE0Pg0KPiAgICAgICAgICAg
IDAwICAwMCAgMDAgIDAwICAwMCAgMDAgIDAwICAwMCA8MmE+PDIwPjwzMD48MGM+PDFiPjwxZj48
MGQ+PGNkPg0KPiAgICAgICAgICAgPDAzPjw4ND48NDY+PDcyPiAwMCAgMDAgIDAwICAwMCAgMDAg
IDAwICAwMCAgMDANCj4gICAgICAgICAgIG5vdCBvayA0IGRlc3RpbmF0aW9uX3BpdGNoDQo+ICAg
ICAgICMgZHJtX3Rlc3RfZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTA6IHBhc3M6MCBmYWlsOjQg
c2tpcDowIHRvdGFsOjQNCj4gICAgICAgbm90IG9rIDkgZHJtX3Rlc3RfZmJfeHJnYjg4ODhfdG9f
eHJnYjIxMDEwMTANCj4gWy4uLl0NCj4gDQo+IExvb2tpbmcgYXQgdGhlc2UgcmVzdWx0cyBJIHN1
c3BlY3QgdGhpcyB0byBiZSBhbiBlbmRpYW4gaXNzdWUsIHByb2JhYmx5IGFmZmVjdGluZyBvdGhl
ciBCRSBhcmNoZXMgdG9vLg0KPiANCj4gRnVsbCBkbWVzZyArIGtlcm5lbCAuY29uZmlnIGF0dGFj
aGVkLg0KDQpEb2luZyBhIGJ1aWxkIHdpdGggQz0yIEkgZ2V0IHRoZSBmb2xsb3dpbmcgd2Fybmlu
Zy4gRml4IHRoaXMgd2FybmluZyBhbmQgDQppdCBzaG91bGQgd29yayBvbiBhbGwgZW5kaWFubmVz
c2VzOg0KDQogICBDQyAgICAgIGRyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fZm9ybWF0X2hlbHBl
cl90ZXN0Lm8NCiAgIENIRUNLICAgZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9mb3JtYXRfaGVs
cGVyX3Rlc3QuYw0KZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9mb3JtYXRfaGVscGVyX3Rlc3Qu
Yzo5OTQ6MzY6IHdhcm5pbmc6IA0KaW5jb3JyZWN0IHR5cGUgaW4gYXJndW1lbnQgMiAoZGlmZmVy
ZW50IGJhc2UgdHlwZXMpDQpkcml2ZXJzL2dwdS9kcm0vdGVzdHMvZHJtX2Zvcm1hdF9oZWxwZXJf
dGVzdC5jOjk5NDozNjogICAgZXhwZWN0ZWQgDQpyZXN0cmljdGVkIF9fbGUzMiBjb25zdCBbdXNl
cnR5cGVdICpidWYNCmRyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fZm9ybWF0X2hlbHBlcl90ZXN0
LmM6OTk0OjM2OiAgICBnb3QgdW5zaWduZWQgDQppbnQgW3VzZXJ0eXBlXSAqW2Fzc2lnbmVkXSBi
dWYNCg0KDQpDaHJpc3RvcGhlDQo=
