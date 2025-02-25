Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B0FA43BD5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:36:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199B110E610;
	Tue, 25 Feb 2025 10:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="r0cKdtQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010008.outbound.protection.outlook.com
 [52.103.68.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB96110E60F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irjc6t8wMDr5LfI6OFye69rUooMXPOa5jyzPRAQD+NcMDyaZD3+dBTaa5mhHz/BV3+n1O6SiPfpILhFp+4m8Iww0DBzS2Skmzb70V8X5YK2rgXsgFnkYdx0nuuJIZl6ZNJ5yY1JqvaTD6vsI32H9Mx3Doyt0FxRkF83955k7vNX0Be+QJBGq5NR141G1oqcEfgF8TaXxiiV0QoyrxQfTNpMHdD34d9gTkX0sbmKrcQLzt3psg/MAQH1cKKjuVvY55/D2NpIcFJLbPyqQ5mHszrEW+ii0Sxnn9iSaWuVEjmR1awlp17Jg+0ZBcOtElxZ8xXsnC0Kkfux76azIYZQjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEtCgjVJtsgNPzv/Qo/pzPH2GpQ6Qc8TPUQaq+LcXKo=;
 b=N7cnlOfoXtezL2dEDdpXg4wC4un6Kk3CFtZNAgSZhd7YKxoUijZ/TKzS8Rr+BlwZRZxxlnE+D+zoxhF2xuhFHbt2fXIBxExFvUvgeipXEj403/stmWS9937Hj8UNBzasby0ycBwX5WxvAY9ftxd/vIIXmZliIVIgX9ufLpOInXCXo6A2eZ84Vc0qqKsMHxls0u1hRpVQoVcrKdrMPorJMDXSTre2GTtPeNM/QbHTGvQb4H/D5p4qCYKfr6xC8txo87uvcR4QfC0oSaL8if6hU2EtniftRBlKPFl4ujHXVYeqp7IkSUrVE2cHhs6uX6xCORCBdF2noM1XEpcMioKQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEtCgjVJtsgNPzv/Qo/pzPH2GpQ6Qc8TPUQaq+LcXKo=;
 b=r0cKdtQhgoinuvbaHVR645S6BszTILbWLfIXreNZRvhF9GCDcThXce1TBIjra9niTR2vrU+TcqGqRd2onn9gI7xPS9D0irReM/7lIKxyPElZw21nsZGZtK0No4rWRFpkZt0mACChGE+/RnCKJUpa+vLSflsj1TFEsbMzrTIW/ypcnrdNpe5DkVEzUBQivXz4hjJNsamyezSKRZMdOBqy14VT+d0J0JGvoakhX3JriBrTyTB2ApgqSzf2qk3G577bUTfAdrbCytslG/Mpb2CIRUSAdn/vIEUiJUyc3WrLevGFWbG0EejALOO/GuVk4ut2d5+tX1beOJUGfFQIeU38wg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB9502.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:106::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 10:36:03 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:36:03 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbh21jOPDlavrp2kW5T/JI6UK95bNX0p8AgAAAqJM=
Date: Tue, 25 Feb 2025 10:36:03 +0000
Message-ID: <PN3PR01MB9597BF95EC490951D75748F1B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
In-Reply-To: <Z72chunE_vvxtjLQ@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB9502:EE_
x-ms-office365-filtering-correlation-id: 02cea7b7-39d1-4789-9bcf-08dd5588344a
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|12121999004|8060799006|461199028|19110799003|6072599003|15080799006|7092599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?eUM1VjBGVUN2VVRjM0NuMTljMXg5Sm44d2VqQXVHWGhnYk9VMGJ6R1pzNmdE?=
 =?utf-8?B?NEN4SU05d1JhUVdZRTE2cytSL0FPSjNyMm1sM25uUUNIY1YwdmkyNldLNm0y?=
 =?utf-8?B?UDN2V25wK2wzbE4yalg2R3hwK3llTG1XemZHQmZVdi95a0F2ZFhwNDIzMWVY?=
 =?utf-8?B?M200QU4yQ2hDTnBKQnlDdkJ3bGppdGxQcm9ndjFZMzVHS1RXNHJldyt2UWpW?=
 =?utf-8?B?MUljUHZGZU83R09kL25vTS9XWU82OHQ4QU45R1NSQVRzSjhZeUVxVHk0alRT?=
 =?utf-8?B?TWh4bkhKM0pGY3h3N2R0TnVndm1xeW9iOVZkVUpaeUttRGpqR2xwbUNPbjhR?=
 =?utf-8?B?K2R0eTcwWFhEczYvL3RkY1UxZ0lTODFvM1YzSEZyMzZuTUJtWktFZmdoSE1X?=
 =?utf-8?B?VTdrZDlMRkZKbjA1S3NPdTZodFZZaXJuRTQxNUpjQmRYTkdYem1jV2tUcFJh?=
 =?utf-8?B?N1VzRVRNWE9rMHB2akJqbVN5b045ZUxBdVY0dVFXWVhRVFV0TVg4a0NXblhX?=
 =?utf-8?B?Y1ZINVdjcVMzai90ZnMvVGRwWTlRQTJkRjcrdG1yRCtMUEpBWkx0cytaVFdP?=
 =?utf-8?B?SGdIZGlPTkFtYXZNYnU1eUwyNmZ5YllFUGh3dHhMaXYxQ0NLR0VxQW5aNmdr?=
 =?utf-8?B?NUlKZkZnNmcvVkxyRFNaU1RpNi9DREs5eGZRRDJhZ2ptRThYOG03VWk1dnl6?=
 =?utf-8?B?NFRuU1NSRGpsK0p0KzlLelJEL3FUdjh4M2w4V0FNSS9iYWZQbSt3RW5vL1hY?=
 =?utf-8?B?dm16QlBFdWkreS82dVh4bkNiVEdvNHFlNGRNamFOTkZGT1ZDOUZTUDlpd0pN?=
 =?utf-8?B?UGgrUnMzdFpaT0tnR05ZZkI0TTdvYUQwWkpOMUFoeGRDWGFGYkl2NFJWNHBo?=
 =?utf-8?B?Sm1Sdll5dWVLSzg1YmczWlFkK0EzRG5oTTQ0MHllZG9jend3M09FTS8xdVlv?=
 =?utf-8?B?UndIMHVJUmRPQnJuQWhqOU4zZ25RZTQ0MENsOTMwUGx0T0Z2bXRyWTRIQm5H?=
 =?utf-8?B?MWYxZ0tWQTVzejI3QzhjcERMVmpqeWpPTDB0anVZMFBGYmdHTk0xQmVLUHVH?=
 =?utf-8?B?NDNaUFdDZ21jNXFYbkxNVEZDUWsrN1E3ZkZlUGMyeGw1b25ha3ZsbTl6RGNo?=
 =?utf-8?B?SVA0RUZTK2ZNc0lpVmpTOU5URUFnc213YjdUa2wwY2YzcUhhMTkvc3B6TkJU?=
 =?utf-8?B?QmxGS0tYRVFrS0h0K01ucU1BOWFEb0xpYkZMMEZKMTlnL05LdVdzOUVBS2Nj?=
 =?utf-8?B?ZDVZdGN0cnF1cTRmc1pYQ2JtR0wwYU84VEtlcXVVS29WVVhhU00weEw2K29V?=
 =?utf-8?B?aVBkZmRjaStybjdhNXI3a1grVlN2Z0xvei9yOHdONnluYlFpSC9DUWliL0VV?=
 =?utf-8?B?akREd2NXa3JaL3h4dDNpUEJvUTFqSUM0YkVlbjNVeXgyUEx3L2JuUW5pMlh3?=
 =?utf-8?B?dElLbXdTam80YjlUNXpUaHlFVHVsS3VGQnJQaWZhbUNScVoyQ2N4OTZKM1FD?=
 =?utf-8?B?cnB4azhLSWFhaEh4V1hwS2lsS1F1VjZiQ0F5clZVTWg3YnpHVHJ4VStkblUx?=
 =?utf-8?B?YWxzZz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjdyMVlVZTBYWnJwYkNaNzlVeXlKMVVpcm41Tm15UjdNM050OHpTNGVxMmZK?=
 =?utf-8?B?bVBXei9HRU4yR2VWZ01WNDErNkcveHh5VmozdHh3YUVZenNmSjhSYVlNTmhs?=
 =?utf-8?B?SlVBTCtVOC90ZEFBZTExclJybkVXRng0azVZTTg4QjVQcld0SDRESUZXU3Vz?=
 =?utf-8?B?MHg3bGlpS0lrT0s0bG1jTmRwaVVKR1hoWUdheTB1SWhzM3k4dkhUVkEweGtI?=
 =?utf-8?B?aWFRaVplNE8rQXFmYm5jQnBNSnUzRkFDclFQeFp5THlGUktVdzlsRzh4UGVO?=
 =?utf-8?B?dC8wb1ZKYUF0R3VvYmRBU2ZoczdrcGxhQlZGTEZab0d5a1JxN2NlS1JUeWRW?=
 =?utf-8?B?SkxuU1JpVEpKaXJHeFkzMmY4dkwzSkp1N0lGSjY4a29GbUFNLzlGM1l3aTN1?=
 =?utf-8?B?WnlFTjNRVUNGMmJ6ek1MaThMQ1J1UnUybThEYlNxbk1wRFZEWUdsZUhEd1Zn?=
 =?utf-8?B?ZWZvUko5cUZFWmZmTElhUEEzVmdYeHUyWUJKVW8ybHhGR0JsMm5KcEVmMzd2?=
 =?utf-8?B?Y2pnNTIyRFJGTVpWSmFNRW5LRkxKUHJ5VHM2SGpkUzBEZVBuZ05CUmNWNHRM?=
 =?utf-8?B?dDRFeit6Q1k5eXZGYmFKV3BNN0xnL0JIS0VNempmbkp0UHZzM3lRb3NodHFy?=
 =?utf-8?B?TDVESWg1dDBSTUFPUWw3WGZla0dDa296SFp2dlNmZDl1d2VQNXplOFR2ck1z?=
 =?utf-8?B?QmpQSUpkcnE1RVl4TFJ1ck01eWZ2TjFoQUlKN0Q1cFdkRk9iRXdRd0ZLN24z?=
 =?utf-8?B?UmRPcTRUUTBYckJBcFhZNkVvZFFxbjhXK0dYTDJkNUpNLzgrYTdFNm5GaUtD?=
 =?utf-8?B?RkcySWlEVVlWc1JDaWt4MEhUdTJWN3h5YjdsMTlYMDY0ZlhNOVVlTHQra1pi?=
 =?utf-8?B?dzNEN1dYcWo5NlVFOUpVSlZqNklWemFIeEx2d1N2QUFWM3JqblhXT0ZuakNm?=
 =?utf-8?B?U3pxay82d09uSEpjV2lTa1I1dGZxQlR4eE9Vd1JUaENEREtETzFaTHVtRVVB?=
 =?utf-8?B?ODVnbm41dkI1U1QzUk5PNTI3ZDJ6QmJtUlZHMlJFNHh4enZveHFwWVpoQ3Nz?=
 =?utf-8?B?cXZ3dDhmZUtOZnlzakNycmtuU3E1UEdMVVFENGFBWTVHQlBpT2oxNGhkckxj?=
 =?utf-8?B?U3VlT2owQXhxbzNGdEdHM2xRdWhJbC90RWE0a1RvSDFuZVJ4KzZlYy9jQkVj?=
 =?utf-8?B?L1pkNWVRdkpXVytRMSthYUhBc052elk0YlBxSElKNkVUUmNrZytIdUszN0tU?=
 =?utf-8?B?SWRyZWhrM3pUMWcrdktIZkFRdTNnaHFRckZhUUlKRXFvUFByWFR2aGlGOElp?=
 =?utf-8?B?L2RremtSdmVwaGlQSlV2NjRMU1ZNa25GZWw3dmMxM2dwTG5LYkRKUkhxL3dJ?=
 =?utf-8?B?TVM3VjJDV1duOGh5aHlDS0p6L0xOWDFWbGg5dmEvaHZjK3hYbHJYM2FLemJ5?=
 =?utf-8?B?QkJUaVdLUVpnNEpEa2REbEdVdFRxZTlHc3dJZHl0cXQwbjUwYXNiaU9lVVpn?=
 =?utf-8?B?dGcyQ0c4SVp1VVMzOVRwS2k5K2U1eVV2cW1xc2dkK2xiV1hqYktPdjNWTEFN?=
 =?utf-8?B?RzNSWXYydGRKb2t5N2JNY0JZS2UzNEpQTENVVFVWYjFsTWoyakxEYXRnOTVW?=
 =?utf-8?B?Si9vSTdObS9ldXJLcXRBVEVoZW1HZk9uOTlvV0w3amxnRDVQQ0ExTGUycEwr?=
 =?utf-8?B?ZldIYzVWWGZteVQwNlVEeWN6dmNBS0VwWWVnMEdsTUdqZ1FWNHNJUmUreE9B?=
 =?utf-8?Q?uwUIQ9tSlZFRvYCvoo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 02cea7b7-39d1-4789-9bcf-08dd5588344a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 10:36:03.7600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9502
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDQ6MDPigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gVHVlLCBGZWIgMjUsIDIwMjUgYXQgMTA6
MDk6NDJBTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiBGcm9tOiBLZXJlbSBLYXJhYmF5
IDxrZWtyYnlAZ21haWwuY29tPg0KPj4gDQo+PiBUaGUgVG91Y2ggQmFycyBmb3VuZCBvbiB4ODYg
TWFjcyBzdXBwb3J0IHR3byBVU0IgY29uZmlndXJhdGlvbnM6IG9uZQ0KPj4gd2hlcmUgdGhlIGRl
dmljZSBwcmVzZW50cyBpdHNlbGYgYXMgYSBISUQga2V5Ym9hcmQgYW5kIGNhbiBkaXNwbGF5DQo+
PiBwcmVkZWZpbmVkIHNldHMgb2Yga2V5cywgYW5kIG9uZSB3aGVyZSB0aGUgb3BlcmF0aW5nIHN5
c3RlbSBoYXMgZnVsbA0KPj4gY29udHJvbCBvdmVyIHdoYXQgaXMgZGlzcGxheWVkLg0KPj4gDQo+
PiBUaGlzIGNvbW1pdCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBkaXNwbGF5IGZ1bmN0aW9uYWxpdHkg
b2YgdGhlIHNlY29uZA0KPj4gY29uZmlndXJhdGlvbi4gRnVuY3Rpb25hbGl0eSBmb3IgdGhlIGZp
cnN0IGNvbmZpZ3VyYXRpb24gaGFzIGJlZW4NCj4+IG1lcmdlZCBpbiB0aGUgSElEIHRyZWUuDQo+
PiANCj4+IE5vdGUgdGhhdCB0aGlzIGRyaXZlciBoYXMgb25seSBiZWVuIHRlc3RlZCBvbiBUMiBN
YWNzLCBhbmQgb25seSBpbmNsdWRlcw0KPj4gdGhlIFVTQiBkZXZpY2UgSUQgZm9yIHRoZXNlIGRl
dmljZXMuIFRlc3Rpbmcgb24gVDEgTWFjcyB3b3VsZCBiZQ0KPj4gYXBwcmVjaWF0ZWQuDQo+PiAN
Cj4+IENyZWRpdCBnb2VzIHRvIEJlbiAoQmluZ3hpbmcpIFdhbmcgb24gR2l0SHViIGZvciByZXZl
cnNlIGVuZ2luZWVyaW5nDQo+PiBtb3N0IG9mIHRoZSBwcm90b2NvbC4NCj4+IA0KPj4gQWxzbywg
YXMgcmVxdWVzdGVkIGJ5IEFuZHksIEkgd291bGQgbGlrZSB0byBjbGFyaWZ5IHRoZSB1c2Ugb2Yg
X19wYWNrZWQNCj4+IHN0cnVjdHMgaW4gdGhpcyBkcml2ZXI6DQo+PiANCj4+IC0gQWxsIHRoZSBw
YWNrZWQgc3RydWN0cyBhcmUgYWxpZ25lZCBleGNlcHQgZm9yIGFwcGxldGJkcm1fbXNnX2luZm9y
bWF0aW9uLg0KPj4gLSBXZSBoYXZlIHRvIHBhY2sgYXBwbGV0YmRybV9tc2dfaW5mb3JtYXRpb24g
c2luY2UgaXQgaXMgcmVxdWlyZW1lbnQgb2YNCj4+ICB0aGUgcHJvdG9jb2wuDQo+PiAtIFdlIGNv
bXBhcmVkIGJpbmFyaWVzIGNvbXBpbGVkIGJ5IGtlZXBpbmcgdGhlIHJlc3Qgc3RydWN0cyBfX3Bh
Y2tlZCBhbmQNCj4+ICBub3QgX19wYWNrZWQgdXNpbmcgYmxvYXQtby1tZXRlciwgYW5kIF9fcGFj
a2VkIHdhcyBub3QgYWZmZWN0aW5nIGNvZGUNCj4+ICBnZW5lcmF0aW9uLg0KPj4gLSBUbyBtYWlu
dGFpbiBjb25zaXN0ZW5jeSwgcmVzdCBzdHJ1Y3RzIGhhdmUgYmVlbiBrZXB0IF9fcGFja2VkLg0K
Pj4gDQo+PiBJIHdvdWxkIGFsc28gbGlrZSB0byBwb2ludCBvdXQgdGhhdCBzaW5jZSB0aGUgZHJp
dmVyIHdhcyByZXZlcnNlLWVuZ2luZWVyZWQNCj4+IHRoZSBhY3R1YWwgZGF0YSB0eXBlcyBvZiB0
aGUgcHJvdG9jb2wgbWlnaHQgYmUgZGlmZmVyZW50LCBpbmNsdWRpbmcsIGJ1dA0KPj4gbm90IGxp
bWl0ZWQgdG8sIGVuZGlhbm5lc3MuDQo+IA0KPiAuLi4NCj4gDQo+PiArc3RhdGljIGludCBhcHBs
ZXRiZHJtX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLA0KPj4gKyAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCAqaWQpDQo+PiArew0KPj4gKyAgICBzdHJ1
Y3QgdXNiX2VuZHBvaW50X2Rlc2NyaXB0b3IgKmJ1bGtfaW4sICpidWxrX291dDsNCj4+ICsgICAg
c3RydWN0IGRldmljZSAqZGV2ID0gJmludGYtPmRldjsNCj4+ICsgICAgc3RydWN0IGFwcGxldGJk
cm1fZGV2aWNlICphZGV2Ow0KPj4gKyAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOw0KPj4gKyAg
ICBpbnQgcmV0Ow0KPj4gKw0KPj4gKyAgICByZXQgPSB1c2JfZmluZF9jb21tb25fZW5kcG9pbnRz
KGludGYtPmN1cl9hbHRzZXR0aW5nLCAmYnVsa19pbiwgJmJ1bGtfb3V0LCBOVUxMLCBOVUxMKTsN
Cj4+ICsgICAgaWYgKHJldCkgew0KPj4gKyAgICAgICAgZHJtX2Vycihkcm0sICJGYWlsZWQgdG8g
ZmluZCBidWxrIGVuZHBvaW50c1xuIik7DQo+IA0KPiBUaGlzIGlzIHNpbXBseSB3cm9uZyAoYW5k
IGluIHRoaXMgY2FzZSBldmVuIGxlYWQgdG8gY3Jhc2ggaW4gc29tZSBjaXJjdW1zdGFuY2VzKS4N
Cj4gZHJtX2VycigpIG1heSBub3QgYmUgdXNlZCBoZXJlLiBUaGF0J3MgbXkgcG9pbnQgaW4gcHJl
dmlvdXMgZGlzY3Vzc2lvbnMuDQo+IEluZGVwZW5kZW50bHkgb24gdGhlIHN1YnN5c3RlbSB0aGUg
LT5wcm9iZSgpIGZvciB0aGUgc2FrZSBvZiBjb25zaXN0ZW5jeSBhbmQNCj4gYmVpbmcgaW5mb3Jt
YXRpdmUgc2hvdWxkIG9ubHkgcmVseSBvbiBzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+IA0KDQpJJ20g
bm90IHN1cmUgaG93IGRybV9lcnIgd29ya3MsIGJ1dCBzdHJ1Y3QgZHJtX2RldmljZSBkb2VzIGhh
dmUgYSBzdHJ1Y3QgZGV2aWNlICpkZXYgYXMgd2VsbC4gQW55d2F5cywgdGhpcyBpcyBzb21ldGhp
bmcgSSdsbCBsZWF2ZSBmb3IgVGhvbWFzIHRvIHJlcGx5Lg0K
