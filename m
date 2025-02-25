Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFDEA443C1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 16:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8E710E701;
	Tue, 25 Feb 2025 15:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="K8jJa8dC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011038.outbound.protection.outlook.com
 [52.103.68.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970F410E701
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 15:01:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLEWBcfE3dlDIk4T0Xj8QFKz2tCoBjS5fZtq89yyzQaHniUqmUK0MVUpqwy5vlL+dGedq+pRF76tDi8+eYXjwIUnCkK/Q1O8jFcMhYNIJ8YM0ICNYGgV7uKNItdc0PZtEI+LMwPcYFTv2KYl7tBqYDO+R7cn0kIYDTlyGhqjyZ8ydSM0OR1a3Nfh4dW5+jfvco1qm1iSf0d2WTcybsM4tJZjqvwol44fx5mwnUUtwnTe/7JO0jX2iNCoXI+OwEEwpKB4UCXu8U+ozlzcohPAb9SZlepBMX7xBI2UR31v16FcJNjsy/F/LRf4ayMGxuLDJSnROi5mHwd2S4vbmHxfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZApXSjSN5auGmjJPQuVno58S4dxWfYMowJVWzzqKPL8=;
 b=p2kmmEUmZ6NWb8+7ND/t3HPhdVa1JeA1yR+rTAeY1k9zIEUoonLVapJ2CSwBBuaRZ+P8HE/VcPiCtcznWppCEahQuAefKHdhWDEwxRcoJOYJXA10htczu49Wm2fxGwwC8btqwGVuTNR7ARy/sOmL3r2vYYl+HzAH+KpZFwtCQuiXHtkHLwwT0Fk8eUgVpU5NjobT3BRD+dZkS1HnamgpEvlHRCXsZNCelUE9mqflWFjPSu7wK4djz7F63SLsEmJOEIPW6sEiiONcXJyth+wXdpZd1tQUEbPXrLieNNgEeRxAVLgY8lZVvjBcQA3P8ffODLSQQG1WCYw07ahT2Od0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZApXSjSN5auGmjJPQuVno58S4dxWfYMowJVWzzqKPL8=;
 b=K8jJa8dCgwrPCFQaoyOD+PHFdoUgVX3P3PmYSEOiU6Kxo1/R4XHyqQmQ7iVOKnWC+tGQKvVTF8+EtR2ivm0Inhc4HUjiG5vxvwF9eUCzHbfLoEm8iJFvjzrlNZL2E+/03ZbSfYOCocqwaHJKNu4n0z00CkKqoLxSCxZIL0sBoaAUvbHE4TEQ8b4Mel85InghKU9BO+mvry3oeMT09kOh+CqVMpvnZJlNdaCLfWsvhJM+EPb69+leqJJphDE3CrXwQyvj4GEjqVSjtEHyiqOrL8eUWFtP1Aqd+j0Ss/JL5FVjebBHbsPsZeC4p6pfKXlL5FJ11IrKtY7mFXD3SMu3Fg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB9917.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:151::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 15:01:10 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 15:01:10 +0000
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
Thread-Index: AQHbh21jOPDlavrp2kW5T/JI6UK95bNX0p8AgAAXooCAADE6yoAAAJlugAABRdg=
Date: Tue, 25 Feb 2025 15:01:10 +0000
Message-ID: <PN3PR01MB9597007F4DF64FA856446827B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <c0249cd8-68e4-4860-b5c3-e054df10ae30@suse.de>
 <PN3PR01MB9597287D0FFDBD11CC1F6167B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597A550BF7FE762ED5FD172B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597A550BF7FE762ED5FD172B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB9917:EE_
x-ms-office365-filtering-correlation-id: 97f4326a-eeb4-4566-7aaa-08dd55ad3d83
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|461199028|7092599003|6072599003|8060799006|8062599003|19110799003|12121999004|102099032|3412199025|440099028|41001999003;
x-microsoft-antispam-message-info: =?utf-8?B?QnJXSHBESnd1T0FodHBlNk4wSG82NHVLWTdmVkZNVy9qSG9tTmp1MkQ3RnMv?=
 =?utf-8?B?Tk9NQllIZWdzMFhpYUk2SG54eDZjS2RlVnkrRTlIUzRyYjBkN1EwWXc0d2FM?=
 =?utf-8?B?a2RnWmdxUTFXRWNQZk4razJuSmFDOTNyWHM5aGJBRUF3dUxleExxTFB6WHA3?=
 =?utf-8?B?Z2RHajlUWHQyVVp5bnVuL08zcm1wSy83Znl6ZVJqRFJSS0R6UEo4ZmhqTzcr?=
 =?utf-8?B?RVJZa2tpZDhRQllINzhUdmxEK0hKbjNNMWJCWEJaaEtBTTR5RjRHakFYZnpS?=
 =?utf-8?B?Y0xPTUxzRWFsTHFxRU1mYjkvSGIwWmx1c3FPLzk2NmdiUHp4QXZBRlMxbEZj?=
 =?utf-8?B?bFZDYW44WlRhcWZqbXl6M2VEckhHU2RxNDVyMG4vRGs3MGlmeUU2Uk5iaG55?=
 =?utf-8?B?aDhhdzRJSHB0clNweTkzUVpEazJ1WlVOckkvWkppQXo2VDdLLzFDNkJtWFo5?=
 =?utf-8?B?TjVSTCtPRGlNblZpWW1MT0Z1Znc5Q3JySGtZMWRrd0M0ZE5QNGNtQzVOdlpI?=
 =?utf-8?B?UTUyQWlzYmZrditKb3hrOXNmMmRhampBZCtZcm5ITVVYWEpzVmdDdkFsdDd3?=
 =?utf-8?B?MEpHR294VTNpTDJiVTBoWUR4VTN2NTNwZ0R6UEVpNDBRbEZSZ1c5Ri9NWFhv?=
 =?utf-8?B?eWVlSmZiUEJYUFZSbldKQ1VoZ2FHakRnNjNRcmxWZWhoZ3k3WmE3cjY0YStK?=
 =?utf-8?B?S3MvMVdJZ0JUaGowN1pGazNmWTlvWWxOY2U4Mzh4VnBLbDNteFRjNU5jNlZz?=
 =?utf-8?B?cnltN0hkT0g4bUoycnN6RVR6WGQ4R0xSN05tRDNTdjRQYnA3Rm1Wb0xxMFFh?=
 =?utf-8?B?YTh3ekgrT2YyWENVaDd2SUk0TmNIQlNHcCtEcVRXKzhqMndGSmZwT2JqOWRi?=
 =?utf-8?B?azJwckM3UFc2QXBMelJmNDN5YWhWU2Y5Mk55bjZ0SHd4TW42UDViSUJ3OGV6?=
 =?utf-8?B?ZzM1TkJtaXVzc3UyTTBqckdDZ25UM0wvbHlIWmlUb3kyVXlyT0RsVW16ZDRB?=
 =?utf-8?B?NnkvVFd2QXowVTMrQzRBSDdVZU9JdzgzbVB4c1lzTUtOVlRDSXp3dmsvK29R?=
 =?utf-8?B?aldFSnMzUXpsdmc0bVJuWHIzYU9NaUhmT0ZvQkJLQ0JQUWhMbnJHOWlLazV1?=
 =?utf-8?B?amFWTjNXbE5LUWRTbUlUY1lZVzE1aDFsU1ZGWWxIengydld5cHBVd3BPbG9z?=
 =?utf-8?B?amVObjhRaUZmdzJlRjIzUW9FWGZXRSs2SzhQc1Y0bXVwL1FTWlR5NDVEOXVC?=
 =?utf-8?B?cFpaaytJZUVWV0N6S3BaZncyV1liU3p5TDhESlNzWmdCUmRzOU9KakdZb04x?=
 =?utf-8?B?YXdTTWZ3bTlBbDFGeDVnbUNvZXlGcGNrOE1jbFRiM0tzcjV2aWlNUC9OeVcx?=
 =?utf-8?B?aW5TUkJpL1dwakE2L3lVayt4V1I3NkhQbGNwblBUaksyOGkvb0RFZ2QwTkt3?=
 =?utf-8?B?d01mNXN4cmdEQUQ0eEd4NHhCZTJXWlFxSmtGaE1TUmtDU1JlM3pRam04czlw?=
 =?utf-8?B?MnFLUjdqU2hCR0w0SlV0NjJPMmZFQzVKeTVvTEVrQ1lhL0VKV20rOE1XUW93?=
 =?utf-8?Q?NQvAEasEYGGl5h3U8YVUtxlcg=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjNwUmtKU2lPVjdKN1o1ZzZ5WWZhUzFUbk9JenNDcEZMaXo1TC9GR0JFeFRr?=
 =?utf-8?B?K01wRXFVSGhuSFNscUNFQnJuNnorZXYxOGM5R3Z6QXQxb0Vpa21FRndCU0dY?=
 =?utf-8?B?USs4ZHlxU1g1RmpRc0M0YlUxL3ZPUE9iUW9OWVBkRUpWYlkxdUpTWjhDNmYz?=
 =?utf-8?B?TGRFKzhHZDJWUFE2amlobTA2UEZpZ0tnbHNrRkpTOXBadjhUYmh1MmMxMTFV?=
 =?utf-8?B?WGJ3MkptVTh0Z2N5VjIxMUhTTWNJVDM5OFJ1STBHcytid09NOThySVU2YS9H?=
 =?utf-8?B?bXNmdTkzSVlZamhqakNMZHFOTWhsdHU2dnU0L1dCaDBjTlAzU2RRVnhkZ29T?=
 =?utf-8?B?ODdtdUVZS28zQkZvVitTRVFxYjhPaDNDeE5JN05Tby81WlBGM2puVHNZUVIr?=
 =?utf-8?B?QzdmYXNKSTVDYmxrQStYWVp3RlRVcmdVNStYbDlINUk0TmEwMUN6a3VRdmYr?=
 =?utf-8?B?NXRpRm1uT2Yra0d5dzRKeEZCVHh2cCszWURZUE51YVBJRk9kSzZTZC9aS3Q1?=
 =?utf-8?B?bUZGVXFnSWc2MHJTUndvMXNvWDBDRGFmOUZxQXF1dndjMnQ3Y3EzWVlyVnBs?=
 =?utf-8?B?WGN4SndyTTNEUnA1V0I3S0U1QUZoYzNGYkF5bDVQemd6V1lNZS9FN2Z3UU1S?=
 =?utf-8?B?Ull1QzJZWGNTTnNrM1VPQnBXZ3haa2tDSTQ4VkxhVk5yZ0dBMlVaWXc3QU8w?=
 =?utf-8?B?Z2RjN0xKVlFWaVQzRTJLT3hCM0plNEhGOW4zaWlTTWx1UWJDREhXaUo4ZGl1?=
 =?utf-8?B?RkphSEVoamRYeUh2MzcyL09ydEFCdk5TRUp4QzRTZ0ZzT0dqUEgzeFFhdEND?=
 =?utf-8?B?MXFvUWtkN3h5b3MxRjg2K0Q2TUEvL2Z5QzdLMU1QcE5aTU84Q1VHMzgyQ2dp?=
 =?utf-8?B?S1Zmd05YWnlXZVZDWmg1QnBXZDRPbVNKcWhYcDcvYllZeDJ1eWdROXNybWRL?=
 =?utf-8?B?U3lCcjVRbXFEWktNa0haZUZoazhUOU94dHJrLzNIQit0RnRSeUJoR3pFZnJW?=
 =?utf-8?B?SkNLWGxVVXdRQ1VhcExuZUdvbEtBTWw3VFg5QXNVSnYyMXRUaXhDQk5DekFa?=
 =?utf-8?B?MEh2eGkxQ0xibEdpV1Z5dDZadFljNVdtSzd3cnFRdWJnV3REaFRzWWRESzk5?=
 =?utf-8?B?N3ZvTkxIa2x2RmpVc1MvVnZ4Nk9kYkpBaXVUQS9tcUlaSzM3T2QrNVZGR2ZC?=
 =?utf-8?B?OURFYjY0K1lzYjVDR3lVb1EvdG1GQkdTL01xcDJua1FvNlJLUkREbHhmZ3Zh?=
 =?utf-8?B?WjhMd09zVDJsU1dzVHEwQ0NhRWt3MHZUblorNnVtbldYOFJad1BVSm5KNzNu?=
 =?utf-8?B?bm1LVW9WSW1JRXFhNW1UdFBVNUNJSUNuNmFyRm9tL0xZQWZiZjkrNWZWUVpn?=
 =?utf-8?B?QXl5Q2xPeFRwd2NHUVB4aWhKRE5kNEtlRjIweTVzQlZYUUViZlVLQjFZQzZK?=
 =?utf-8?B?dDdxd01ZbTdQTFcwTGFWTi9yVkVBd3RyMEpGK2N6Tk9uOC9QRzhsc2xtSHBa?=
 =?utf-8?B?VXRVb3dNK3BZYmZsOWF0VGJhMjVzYVNBVVJGRmJqMVpSY3RJVWVEZGx4bjk1?=
 =?utf-8?B?Y0JEblgydW85elgvZ1FPS01rUXVWdk1GQUM2LzY0MFY0b0tKWTFxZ2p3U3Jj?=
 =?utf-8?B?cHQyTkhDN3NXenN1a3lCSlhhelk0R1pDTExzUGZUUXY0NGtIUUF0Y3JNNWIz?=
 =?utf-8?B?ZnNEZEhiY0h3aGd4N2FpbDFEZ3FtNzVoSWJVcTBYMm0vQVIwaHpIVXN2cDdr?=
 =?utf-8?Q?hYcKWqtSgDksOtzBJs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f4326a-eeb4-4566-7aaa-08dd55ad3d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 15:01:10.5972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9917
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDg6MjbigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiDvu78NCj4gDQo+PiBPbiAyNSBGZWIgMjAyNSwg
YXQgODoyNOKAr1BNLCBBZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPiB3cm90ZToN
Cj4+IA0KPj4g77u/DQo+PiANCj4+Pj4gT24gMjUgRmViIDIwMjUsIGF0IDU6MjjigK9QTSwgVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4+IA0KPj4+IO+7
v0hpDQo+Pj4gDQo+Pj4+IEFtIDI1LjAyLjI1IHVtIDExOjMzIHNjaHJpZWIgYW5kcml5LnNoZXZj
aGVua29AbGludXguaW50ZWwuY29tOg0KPj4+Pj4+IE9uIFR1ZSwgRmViIDI1LCAyMDI1IGF0IDEw
OjA5OjQyQU0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPj4+Pj4+IEZyb206IEtlcmVtIEth
cmFiYXkgPGtla3JieUBnbWFpbC5jb20+DQo+Pj4+Pj4gDQo+Pj4+Pj4gVGhlIFRvdWNoIEJhcnMg
Zm91bmQgb24geDg2IE1hY3Mgc3VwcG9ydCB0d28gVVNCIGNvbmZpZ3VyYXRpb25zOiBvbmUNCj4+
Pj4+PiB3aGVyZSB0aGUgZGV2aWNlIHByZXNlbnRzIGl0c2VsZiBhcyBhIEhJRCBrZXlib2FyZCBh
bmQgY2FuIGRpc3BsYXkNCj4+Pj4+PiBwcmVkZWZpbmVkIHNldHMgb2Yga2V5cywgYW5kIG9uZSB3
aGVyZSB0aGUgb3BlcmF0aW5nIHN5c3RlbSBoYXMgZnVsbA0KPj4+Pj4+IGNvbnRyb2wgb3ZlciB3
aGF0IGlzIGRpc3BsYXllZC4NCj4+Pj4+PiANCj4+Pj4+PiBUaGlzIGNvbW1pdCBhZGRzIHN1cHBv
cnQgZm9yIHRoZSBkaXNwbGF5IGZ1bmN0aW9uYWxpdHkgb2YgdGhlIHNlY29uZA0KPj4+Pj4+IGNv
bmZpZ3VyYXRpb24uIEZ1bmN0aW9uYWxpdHkgZm9yIHRoZSBmaXJzdCBjb25maWd1cmF0aW9uIGhh
cyBiZWVuDQo+Pj4+Pj4gbWVyZ2VkIGluIHRoZSBISUQgdHJlZS4NCj4+Pj4+PiANCj4+Pj4+PiBO
b3RlIHRoYXQgdGhpcyBkcml2ZXIgaGFzIG9ubHkgYmVlbiB0ZXN0ZWQgb24gVDIgTWFjcywgYW5k
IG9ubHkgaW5jbHVkZXMNCj4+Pj4+PiB0aGUgVVNCIGRldmljZSBJRCBmb3IgdGhlc2UgZGV2aWNl
cy4gVGVzdGluZyBvbiBUMSBNYWNzIHdvdWxkIGJlDQo+Pj4+Pj4gYXBwcmVjaWF0ZWQuDQo+Pj4+
Pj4gDQo+Pj4+Pj4gQ3JlZGl0IGdvZXMgdG8gQmVuIChCaW5neGluZykgV2FuZyBvbiBHaXRIdWIg
Zm9yIHJldmVyc2UgZW5naW5lZXJpbmcNCj4+Pj4+PiBtb3N0IG9mIHRoZSBwcm90b2NvbC4NCj4+
Pj4+PiANCj4+Pj4+PiBBbHNvLCBhcyByZXF1ZXN0ZWQgYnkgQW5keSwgSSB3b3VsZCBsaWtlIHRv
IGNsYXJpZnkgdGhlIHVzZSBvZiBfX3BhY2tlZA0KPj4+Pj4+IHN0cnVjdHMgaW4gdGhpcyBkcml2
ZXI6DQo+Pj4+Pj4gDQo+Pj4+Pj4gLSBBbGwgdGhlIHBhY2tlZCBzdHJ1Y3RzIGFyZSBhbGlnbmVk
IGV4Y2VwdCBmb3IgYXBwbGV0YmRybV9tc2dfaW5mb3JtYXRpb24uDQo+Pj4+Pj4gLSBXZSBoYXZl
IHRvIHBhY2sgYXBwbGV0YmRybV9tc2dfaW5mb3JtYXRpb24gc2luY2UgaXQgaXMgcmVxdWlyZW1l
bnQgb2YNCj4+Pj4+PiB0aGUgcHJvdG9jb2wuDQo+Pj4+Pj4gLSBXZSBjb21wYXJlZCBiaW5hcmll
cyBjb21waWxlZCBieSBrZWVwaW5nIHRoZSByZXN0IHN0cnVjdHMgX19wYWNrZWQgYW5kDQo+Pj4+
Pj4gbm90IF9fcGFja2VkIHVzaW5nIGJsb2F0LW8tbWV0ZXIsIGFuZCBfX3BhY2tlZCB3YXMgbm90
IGFmZmVjdGluZyBjb2RlDQo+Pj4+Pj4gZ2VuZXJhdGlvbi4NCj4+Pj4+PiAtIFRvIG1haW50YWlu
IGNvbnNpc3RlbmN5LCByZXN0IHN0cnVjdHMgaGF2ZSBiZWVuIGtlcHQgX19wYWNrZWQuDQo+Pj4+
Pj4gDQo+Pj4+Pj4gSSB3b3VsZCBhbHNvIGxpa2UgdG8gcG9pbnQgb3V0IHRoYXQgc2luY2UgdGhl
IGRyaXZlciB3YXMgcmV2ZXJzZS1lbmdpbmVlcmVkDQo+Pj4+Pj4gdGhlIGFjdHVhbCBkYXRhIHR5
cGVzIG9mIHRoZSBwcm90b2NvbCBtaWdodCBiZSBkaWZmZXJlbnQsIGluY2x1ZGluZywgYnV0DQo+
Pj4+Pj4gbm90IGxpbWl0ZWQgdG8sIGVuZGlhbm5lc3MuDQo+Pj4+IC4uLg0KPj4+PiANCj4+Pj4+
ICtzdGF0aWMgaW50IGFwcGxldGJkcm1fcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYs
DQo+Pj4+PiArICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkICppZCkN
Cj4+Pj4+ICt7DQo+Pj4+PiArICAgIHN0cnVjdCB1c2JfZW5kcG9pbnRfZGVzY3JpcHRvciAqYnVs
a19pbiwgKmJ1bGtfb3V0Ow0KPj4+Pj4gKyAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmaW50Zi0+
ZGV2Ow0KPj4+Pj4gKyAgICBzdHJ1Y3QgYXBwbGV0YmRybV9kZXZpY2UgKmFkZXY7DQo+Pj4+PiAr
ICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm07DQo+Pj4+PiArICAgIGludCByZXQ7DQo+Pj4+PiAr
DQo+Pj4+PiArICAgIHJldCA9IHVzYl9maW5kX2NvbW1vbl9lbmRwb2ludHMoaW50Zi0+Y3VyX2Fs
dHNldHRpbmcsICZidWxrX2luLCAmYnVsa19vdXQsIE5VTEwsIE5VTEwpOw0KPj4+Pj4gKyAgICBp
ZiAocmV0KSB7DQo+Pj4+PiArICAgICAgICBkcm1fZXJyKGRybSwgIkZhaWxlZCB0byBmaW5kIGJ1
bGsgZW5kcG9pbnRzXG4iKTsNCj4+Pj4gVGhpcyBpcyBzaW1wbHkgd3JvbmcgKGFuZCBpbiB0aGlz
IGNhc2UgZXZlbiBsZWFkIHRvIGNyYXNoIGluIHNvbWUgY2lyY3Vtc3RhbmNlcykuDQo+Pj4+IGRy
bV9lcnIoKSBtYXkgbm90IGJlIHVzZWQgaGVyZS4gVGhhdCdzIG15IHBvaW50IGluIHByZXZpb3Vz
IGRpc2N1c3Npb25zLg0KPj4+PiBJbmRlcGVuZGVudGx5IG9uIHRoZSBzdWJzeXN0ZW0gdGhlIC0+
cHJvYmUoKSBmb3IgdGhlIHNha2Ugb2YgY29uc2lzdGVuY3kgYW5kDQo+Pj4+IGJlaW5nIGluZm9y
bWF0aXZlIHNob3VsZCBvbmx5IHJlbHkgb24gc3RydWN0IGRldmljZSAqZGV2LA0KPj4+IA0KPj4+
IFRoYXQncyBuZXZlciBnb2luZyB0byB3b3JrIHdpdGggRFJNLiBUaGVyZSdzIHNvIG11Y2ggY29k
ZSBpbiBhIERSTSBwcm9iZSBmdW5jdGlvbiB0aGF0IHVzZXMgdGhlIERSTSBlcnJvciBmdW5jdGlv
bnMuDQo+Pj4gDQo+Pj4gVGhpcyBzcGVjaWZpYyBpbnN0YW5jZSBoZXJlIGlzIHdyb25nLCBhcyB0
aGUgZHJtIHBvaW50ZXIgaGFzbid0IGJlZW4gaW5pdGlhbGl6ZWQuIEJ1dCBhcyBzb29uIGFzIGl0
IGlzLCBpdCdzIG11Y2ggYmV0dGVyIHRvIHVzZSBkcm1fZXJyKCkgYW5kIGZyaWVuZHMuIEl0IHdp
bGwgZG8gdGhlIHJpZ2h0IHRoaW5nIGFuZCBnaXZlIGNvbnNpc3RlbnQgb3V0cHV0IGFjcm9zcyBk
cml2ZXJzLg0KPj4+IA0KPj4gT2sgc28gdGhpcyBpcyBhY3R1YWxseSBhbiBpbnRlcmVzdGluZyBj
YXNlLCBzaW5jZSBJIGFtIHRyeWluZyB0byBmaXggaXQuIFRvIGluaXRpYWxpc2UgdGhlIGRybSBw
b2ludGVyLCB3ZSBuZWVkIHRvIGluaXRpYWxpc2UgYWRldiwgYW5kIHRvIGluaXRpYWxpc2UgYWRl
diwgd2UgbmVlZCB0byBydW4gdXNiX2ZpbmRfY29tbW9uX2VuZHBvaW50cyBmaXJzdC4gU28gSU1P
LCB3ZSBjYW5ub3QgdXNlIGRybV9lcnIgaGVyZSwgYnV0IHJhdGhlciBkZXZfZXJyX3Byb2JlIGNh
biBiZSB1c2VkLg0KPiANCj4gSW5mYWN0IGRldiBpcyBhbHNvIG5vdCBpbml0aWFsaXNlZC4uLi4u
Lg0KDQpOdm0sIGRldiBpcyBpbml0aWFsaXNlZCwgYWRldiBpcyBub3QNCj4+PiANCj4+PiANCj4+
Pj4gDQo+Pj4+PiArICAgICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4gKyAgICB9DQo+Pj4+PiArDQo+
Pj4+PiArICAgIGFkZXYgPSBkZXZtX2RybV9kZXZfYWxsb2MoZGV2LCAmYXBwbGV0YmRybV9kcm1f
ZHJpdmVyLCBzdHJ1Y3QgYXBwbGV0YmRybV9kZXZpY2UsIGRybSk7DQo+Pj4+PiArICAgIGlmIChJ
U19FUlIoYWRldikpDQo+Pj4+PiArICAgICAgICByZXR1cm4gUFRSX0VSUihhZGV2KTsNCj4+Pj4+
ICsNCj4+Pj4+ICsgICAgYWRldi0+aW5fZXAgPSBidWxrX2luLT5iRW5kcG9pbnRBZGRyZXNzOw0K
Pj4+Pj4gKyAgICBhZGV2LT5vdXRfZXAgPSBidWxrX291dC0+YkVuZHBvaW50QWRkcmVzczsNCj4+
Pj4+ICsgICAgYWRldi0+ZG1hZGV2ID0gZGV2Ow0KPj4+Pj4gKw0KPj4+Pj4gKyAgICBkcm0gPSAm
YWRldi0+ZHJtOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICB1c2Jfc2V0X2ludGZkYXRhKGludGYsIGFk
ZXYpOw0KPj4+Pj4gKw0KPj4+Pj4gKyAgICByZXQgPSBhcHBsZXRiZHJtX2dldF9pbmZvcm1hdGlv
bihhZGV2KTsNCj4+Pj4+ICsgICAgaWYgKHJldCkgew0KPj4+Pj4gKyAgICAgICAgZHJtX2Vycihk
cm0sICJGYWlsZWQgdG8gZ2V0IGRpc3BsYXkgaW5mb3JtYXRpb25cbiIpOw0KPj4+Pj4gKyAgICAg
ICAgcmV0dXJuIHJldDsNCj4+Pj4+ICsgICAgfQ0KPj4+Pj4gKw0KPj4+Pj4gKyAgICByZXQgPSBh
cHBsZXRiZHJtX3NpZ25hbF9yZWFkaW5lc3MoYWRldik7DQo+Pj4+PiArICAgIGlmIChyZXQpIHsN
Cj4+Pj4+ICsgICAgICAgIGRybV9lcnIoZHJtLCAiRmFpbGVkIHRvIHNpZ25hbCByZWFkaW5lc3Nc
biIpOw0KPj4+Pj4gKyAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4+ICsgICAgfQ0KPj4+Pj4gKw0K
Pj4+Pj4gKyAgICByZXQgPSBhcHBsZXRiZHJtX3NldHVwX21vZGVfY29uZmlnKGFkZXYpOw0KPj4+
Pj4gKyAgICBpZiAocmV0KSB7DQo+Pj4+PiArICAgICAgICBkcm1fZXJyKGRybSwgIkZhaWxlZCB0
byBzZXR1cCBtb2RlIGNvbmZpZ1xuIik7DQo+Pj4+PiArICAgICAgICByZXR1cm4gcmV0Ow0KPj4+
Pj4gKyAgICB9DQo+Pj4+PiArDQo+Pj4+PiArICAgIHJldCA9IGRybV9kZXZfcmVnaXN0ZXIoZHJt
LCAwKTsNCj4+Pj4+ICsgICAgaWYgKHJldCkgew0KPj4+Pj4gKyAgICAgICAgZHJtX2Vycihkcm0s
ICJGYWlsZWQgdG8gcmVnaXN0ZXIgRFJNIGRldmljZVxuIik7DQo+Pj4+PiArICAgICAgICByZXR1
cm4gcmV0Ow0KPj4+Pj4gKyAgICB9DQo+Pj4+PiArDQo+Pj4+PiArICAgIHJldCA9IGFwcGxldGJk
cm1fY2xlYXJfZGlzcGxheShhZGV2KTsNCj4+Pj4+ICsgICAgaWYgKHJldCkgew0KPj4+Pj4gKyAg
ICAgICAgZHJtX2Vycihkcm0sICJGYWlsZWQgdG8gY2xlYXIgZGlzcGxheVxuIik7DQo+Pj4+PiAr
ICAgICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4gKyAgICB9DQo+Pj4+PiArDQo+Pj4+PiArICAgIHJl
dHVybiAwOw0KPj4+Pj4gK30NCj4+PiANCj4+PiAtLQ0KPj4+IC0tDQo+Pj4gVGhvbWFzIFppbW1l
cm1hbm4NCj4+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+Pj4gU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQo+Pj4gRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCj4+PiBHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBN
Y0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQo+Pj4gSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo+
Pj4gDQo=
