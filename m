Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D8A9878D7
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 20:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C5910EBC6;
	Thu, 26 Sep 2024 18:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="LeIUf0SP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2106.outbound.protection.outlook.com [40.92.102.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5062B10EBC6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 18:05:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+L7rWaKAI7r5gpysd3fYxRFjW2GlQdatYkpRGf2lsXT/a1IjrJ+mGNbwVJN97HnjMvBZVmQeVs915FuNVdywvfhsJY2VW7TmgnOW5tD7DDibg2gbOxu3ImiBf9KQxXuMDkV7cORwYErSORPRVia0qJ4d5paKB5BwES73X9T/L/BE1QB4el1kd7xhHRn2jCm4aMWMr7sQgKwjbjySESw4lmS1bQueFxaotwY6yPJeeCDG0ivNp/nBioN1pAOgAyz3Z4xUJLfY+oc/krmphVysImsef2zMqWNBU4I3j6aR86MRmQUrqS0gh0YW6etcGS+LT8EAFo0hoTpZysp0iR4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zqry/3qsGE6t0i7lQQLOgQAYeaEsEN24WOv4TJDuheU=;
 b=Jdw3G3uTpVwm4ebuYmcBBRe4uV7TkP47hAhq760bLt6+rkz4xktzyeS4IRn/QqSLSepkZJfOwJ9HVSzOwHplJuZzcRQ7+vSnCksxnqFbgdJ4jN5TO+CHCeYiXnQphNtW5jzp0+2g22mXS+Zo9wTi4CJbKpnb5cYRqp5x/L7hu4o33RL1uQVbHGkOfvgronRu2HJXt5neZu1lc673ZAkhS+yFhNYAWLebRR64fyLF8b/jVdbYXYrd2HEmb+b0IrlbDUtgc6bdBHx+6ktxokLfg7piegsd+QlvKdPd3YMkkZZxTW61BDJyWjTIPlnx4loYeWYUPdt+XpmfXZBAWPqJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zqry/3qsGE6t0i7lQQLOgQAYeaEsEN24WOv4TJDuheU=;
 b=LeIUf0SPESZ/4AEYiP6CBaceq+lv1Q7N3XSToIyC9Wk6za9ozjQ/WOX2I3mB+pXEHTyxxVnH4FpfgrmiTO+vIeKqwbsu1dR/BD7OTMAOSyhAzNh5YaacAnBuQaiE5CSytLEUyyMGy6JVr0ui+z9Knhhs4Ey3z4syg89WJ373kZTOpOTR1UIXbJIghRyatjxd/EHfkAbi8yKTlJH1lQT7dl2rATPjlnuUkRoDBsbXFEawNxfW1+Awwyt3xs5k9kdaSd8K+a/UPoSbjP1TyGfbNcMYkiJ+lJNEoChzwxgzNkM+V729vHZKy1dF1lTN8F1FhLWzR8rn5r9mrjjVE3Vt2g==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1965.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:121::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.20; Thu, 26 Sep 2024 18:05:37 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7982.030; Thu, 26 Sep 2024
 18:05:37 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "airlied@gmail.com" <airlied@gmail.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "bentiss@kernel.org" <bentiss@kernel.org>,
 =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?= <thomas@t-8ch.de>, Orlando Chamberlain
 <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "torvalds@linux-foundation.org"
 <torvalds@linux-foundation.org>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
Thread-Topic: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
Thread-Index: AQHbEDyNWJwOefTsdUu7ETvaVQc9orJqXEEAgAAAp5A=
Date: Thu, 26 Sep 2024 18:05:37 +0000
Message-ID: <MA0P287MB0217799EF124DAB1EB9941ACB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
 <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
 <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1965:EE_
x-ms-office365-filtering-correlation-id: bfb33315-8c21-4481-9425-08dcde55d32d
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|7092599003|461199028|19110799003|8062599003|8060799006|6072599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: gQTiWD907FFSplpiWjIz3o0uhSG9koAczbM3IExfMuD52i72ZxMk7aO+bQlvbUVYF77IEe6JzctLk+XriQ9OrQs8RFleuIO8puyLb3mFEFIgbmeYK62EzZjSJ3RfEzUKQg/97Zz68VAPRjiY4r2KILsGfgD5SHsKfCW99U8GZybjw0e95LREhlHq/X3DSfS4ULyJMD/v0z15NYf9Q5PVf65DLWLbV2CXlBBRddeX8f5xxF9yXaS0UpEdFb+FxC0d2K2CMUAnMIoZACfdz1+csABclZ64Kq6jnR7GbHOjiHwNN+z2xYacNrTkuv8Urwp3Wm7ce5b6QhSibndRMvEMWz4iSyytSGpt8vgzf531lScGEnTuE+cffiigrxhcOr/K2xysszfmtgDmB+AFu2s5X6D9Pkxyq5rrVgXbeIfU1bBa4jyYu2J6ETKt8kh7H9Sca40KBFawajziqLcYSQ0avHtFUtnq0uY9lv3ghdIAoLrpw/waPVyp6zfFb9WutYoZaNkePQpxf662pLdvoyMKOKnZf4BnZMVQfR4ZcQxEiBDBlQWJ+B853R39m8bQniEKIVwm+2bVHAN5J6NCopJOFhUovT5MwLk3iUcGGbmvDuXizKD8X/mIntbc/rPhU9JJNrwENanb6JQa2UvH6m5/hB2GJo8hwYbn4Z5F6npS7OPs9wz0naPpTdxbAYbI4jbtrUKRb3tI0hbr4FlEwHTW37HVF4K0Tj6ySbGoYqKNlpnsGN+EgMN/W/SsYyx1P83ifhnTm7xw0GqOj7Tq/oLHpw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHJCUzZvNDRCSFA2U1htNUdQSHhRdWthbjNVQW96T1dHMlhIeW5SUVpMKzZa?=
 =?utf-8?B?Z3VVSkpmQ2E1dENJRllsWUdyc21YMENmODE2dXhHZ1poa1M5ZG5OcVV1U2Jy?=
 =?utf-8?B?V2V3ZkVENk55ZHRtaGNYeVMvbnlYNVZHbWNrajNWdGZLdjZmUFBiSXBxYzkv?=
 =?utf-8?B?L3R1azgzbnZLOFVEQ3A4alJ0WlZIMlF5K2YrZTNSeXFSWUptaHlaYkFKcjls?=
 =?utf-8?B?aHBnMDFPU2E2bitid3lwd1JMVGhLWENTeFM5aVNneUlhdVQrVjFxR2JqLzhM?=
 =?utf-8?B?UTY3Nmo4WTRqLzNlalo0Nm9jTytLRThOejhabEYrcTlwMDZhUVRIQUQzMnZz?=
 =?utf-8?B?TlFYa3JJU3F4YnQ1dDRCY2kxaVNMZnF0blFXUG5lZTlhSk1XbTZQaW8yMlNl?=
 =?utf-8?B?TnliMXd5NmJFMFdjTzBWVjdKMHVYbk5xQnBsT2lzaVcyZ05uMGtYVUxJYlAr?=
 =?utf-8?B?QloyL1ZiZ09GMVY3aXpWNi8zNGpEaXo4dWFPdEdLRFc0UVdDaGNBYUZrWGtl?=
 =?utf-8?B?NFdRVGlKdFloWkhjTVc4eFJqZVpqTkV2S1NId0RNZjU1T0I4ZW12WENNOG94?=
 =?utf-8?B?SmNsZy9zN2FNa2RxS0ViQ0dCTFV6RVhDOFEvVDRQYUFJYzZRZXk0OFVVOFB3?=
 =?utf-8?B?enJ1VFdxNkg5ZDBZamZmWk5lbXRMY0JxMlgwNmVYZWI0OVdBcm5KWGVTbUdV?=
 =?utf-8?B?SFRGSWUvcU1HM2FvbTF1T1MxVXdNNjBWUGRNa1BHUlMyam9TQ0s2QkFUdkdP?=
 =?utf-8?B?QTVrSzNGMW5zQnFiY3UrYU5JRHBFY0wvLzRYZ3VXT29JMjdaS1VpYU55SmZu?=
 =?utf-8?B?d0xCTGViRy9JYWsxclU2OG4wNGdqaU05dTAzM3lyZlEvK2wya2w0RllqTTYx?=
 =?utf-8?B?M0VIUnRQTFVqOFhHRUMxMkRZMlJESlQ5bC9nSTZHWGxSdFdveCtpYVhYUFgv?=
 =?utf-8?B?S1R6RFdrYXI4eWN0dEo0RXJ5OXdRcWhpT0tKZVltdUtPd2dGUkVWVlRZeG1t?=
 =?utf-8?B?cTlTMDBaOSsrRHViWVhtU0ZFOWd2dFQ1cFBheEJrMlcraTE0MmJVQmF3cWZG?=
 =?utf-8?B?OThwV2w5R3p4RTl2NjBQcm84MHF1QkZHK1lxakZER2VNSUdkbFFXUG1YaFQv?=
 =?utf-8?B?blc3TnBHblpER1liekVBT1BMOVByU2g3bk1mUlRXdVc5TGYzaysxV3pUY0tU?=
 =?utf-8?B?bFpURW5vN093aEQwTWU2MzFmeUhEUUs3WWlabURyaXNwNHRTdFUwRmlpTVph?=
 =?utf-8?B?RFJ5OVZ3MUhaQXJUMWZjbEs1Yy9sR1hyNXozNTJHZmliZ1NVa3d5aXBFbkxx?=
 =?utf-8?B?bGFnaVk0dzI5dG9wU1VDcEIyalhvbTlDb0xhdDVvdk0zN2MrWmJrVDAzMWdM?=
 =?utf-8?B?QkRQRm0vZlRsREswa29pM2I3ZjlxaU5kQUFFSFNmMlhnV2FwK2NUZVFCUENq?=
 =?utf-8?B?RVN3UHIzNVBmSFhlSGJERmxvclRhNWhKTEYvSXBaaEM3VlV6c2l3dC9wb3Bi?=
 =?utf-8?B?V2JyZGExMTFGU2JaS3dpdW50VngvTEZEMnhYS2QzSlhYQUp1TkxySFdpTVRG?=
 =?utf-8?B?L1p0a0sxTFJZeElUYkNhMGgveE5NdHZxNXMyMGVnQUJCNE55UE5RbGczdEJJ?=
 =?utf-8?B?SzBudElwb0hVV1FMNlpzTVYvZG5ZVXJNcWhoOE8xNEtJRGlWT1ZYRXJla1or?=
 =?utf-8?B?L3FiWGZncXV2N2J4WDY5N1d0ZUc5V245YnZueUNDdExiMDROc096dHpQRlkr?=
 =?utf-8?Q?jB9yGHo+uBzLeiYw8g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb33315-8c21-4481-9425-08dcde55d32d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 18:05:37.6132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1965
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

DQoNCj4gT24gMjYgU2VwIDIwMjQsIGF0IDExOjMz4oCvUE0sIEppcmkgS29zaW5hIDxqaWtvc0Br
ZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IO+7v09uIFRodSwgMjYgU2VwIDIwMjQsIEFkaXR5YSBH
YXJnIHdyb3RlOg0KPiANCj4+IEl0IGhhcyBiZWVuIG1vcmUgdGhhbiBhIG1vbnRoIHNpbmNlIEkn
dmUgc2VudCB0aGlzIHBhdGNoIHNldCBhbmQgSQ0KPj4gaGF2ZW4ndCBnb3QgYSBjbGVhciB5ZXMg
b3Igbm90IGZvciB0aGUgc2FtZS4gSSB1bmRlcnN0YW5kIG1haW50YWluZXJzDQo+PiBhcmUgYnVz
eSBwZW9wbGUsIGJ1dCBJJ2QgcmVhbGx5IGFwcHJlY2lhdGUgaWYgSSBnZXQgc29tZSByZXNwb25z
ZSBmb3INCj4+IHRoaXMgc2VyaWVzIG9mIHBhdGNoZXMgZnJvbSB0aGUgSElEIGFuZCBEUk0gbWFp
bnRhaW5lcnMuDQo+IA0KPiBKdXN0IHRvIHJlaXRlcmF0ZSAtLSBJIGFtIHdhaXRpbmcgZm9yIEFj
ayBmcm9tIHRoZSBEUk0gcGVvcGxlIGFuZCB3aWxsDQo+IHRoZW4gdGFrZSBpdCB0aHJvdWdoIGhp
ZC5naXQuDQoNClNvIEkgc2hvdWxkIGFzc3VtZSB0aGUgSElEIHBvcnRpb24gaXMgZml0IHRvIGJl
IG1lcmdlZCBub3c/DQoNCj4gDQo+IERhdmUsIHdobydkIGJlIHRoZSBiZXN0IHBlcnNvbiB0byBk
byB0aGlzIGZyb20gdGhlIERSTSBzaWRlIHBsZWFzZT8NCj4gDQo+IFRoYW5rcywNCj4gDQo+IC0t
DQo+IEppcmkgS29zaW5hDQo+IFNVU0UgTGFicw0KPiANCg==
