Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDC6A44398
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E2210E6EB;
	Tue, 25 Feb 2025 14:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="ZQXMyNPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011036.outbound.protection.outlook.com
 [52.103.67.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4765C10E6EB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 14:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+p61jrqJy4pMRydTECDRx0aUlhuxAvIDugIZUYIRC090P6wyoteGBq+591fdD7s1qfbyteVKjcYboSnyIcBsfP53cmEEDBHZ2tFdtr5y08GVwJh/n9oQaau4L5MYXhjlW7BcsDyw0kA/GuVKaK68rREoGS6xELkw8TOHDv+U6d2OYe42pV0V6dpo6QMUQttNgiKKCmnNBJk74lHO56soS5BUOKs9IYd0Ti/C6BsRG86XgMrH3SIKa2yyvys7tImsc+dBjoxP3h9E49RNMR2KFofl67+ouniJA+PpyaImdxTnCgMn8LBZ254g2Kc0r3woZ0BKzlkWc6Bctb/RvaaUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwiuvVahZyw4LIAvtgT49d36e53GT8CABOKsNN3o3K0=;
 b=l09JLfK1onch/jDvDyK1ClRvtZNTX+2VmRM0iaZ1HbAxoyeI9vLCtWz+dfmD41BdnixTkFJ6U9q1oHyJd+INSnCxsPeC1ZNHMTePem6G43g9nfIafPHPz4p1xaVwGfl2hVuBXPczxevi66VUWzF7uCXVQ0b9yQbqK0AWL9P5xsd2eEXecFeaM0vJ+mf9AW794b9LrCVIVXjJtOAv/BOL8+jl9rSMggS2woiY9d8waQTa6v2Bv4aK71v3ISFuW2Bj4SBGQIZjKb7yB725IjeN3FBpkJrsyP/rc2lKu94VSRwcUius6PKHlFOCaymqINdSTsfdodEPszgS4Gy8OfImFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwiuvVahZyw4LIAvtgT49d36e53GT8CABOKsNN3o3K0=;
 b=ZQXMyNPgbjsWyOAXF6k/WnO2TlqtZ0EVqfu7mlrBFXMHs1W3jNoMLl/DqMLHE3gmTVfg8Edl2Qmunrkb21SZdpcrPaY2COepdUzYB2k94UsXUo5Oarh2+oK+LUBYd84cdsOE3zu9m8e8spe3RAlbOWJ1Z1BXS1qy4fI8C6GxiT5qFcMFVzPulbNF7kdnrTfQQq67Kxjw5bWOsi9TqjQo35FJ82Ryia+thu/ynQH0R+/idhCE70mex3ugogZI9712tYrc5JRXSVis5wA809A5VF+623jdMbk/fsw177J5x3lzMj/TzGgl4ZAazab4pxefeMcjdzARhNu7BhkDDR1Zwg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNZPR01MB10733.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:248::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 14:54:28 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 14:54:28 +0000
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
Thread-Index: AQHbh21jOPDlavrp2kW5T/JI6UK95bNX0p8AgAAXooCAADE6yg==
Date: Tue, 25 Feb 2025 14:54:28 +0000
Message-ID: <PN3PR01MB9597287D0FFDBD11CC1F6167B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <c0249cd8-68e4-4860-b5c3-e054df10ae30@suse.de>
In-Reply-To: <c0249cd8-68e4-4860-b5c3-e054df10ae30@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PNZPR01MB10733:EE_
x-ms-office365-filtering-correlation-id: 79976d1c-58db-43ea-8258-08dd55ac4ddc
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|461199028|19110799003|12121999004|7092599003|15080799006|6072599003|8060799006|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?VEdHU0FEaVFod3kwQThiZmJNZ1Zoay9LTmE2Y3lYUlZpb2JpVTMxeEVkY0R4?=
 =?utf-8?B?NkVqTGVpR1VVZWtoRy9ZWENCSzRpZ3UwMEZOMTk5S2xQOTUvRTkzM0hDbDB2?=
 =?utf-8?B?V0lRQW5xNlBSd01Ma1FzTG9CVDBGaTFadlk1KzY5b3lJbWJNVXYxTDIra2xq?=
 =?utf-8?B?Q0tnZGpYSVBqUjkxNU5lMzF3VWlMRC9uTmNycWdyUHMrMFNCRVhlbDRoY0x3?=
 =?utf-8?B?Vy9wTEY0UmlwN0p0RHkvRzdnbk1IUnNNREJKdWZDejBINDNzdG9FQ0lvT1Ay?=
 =?utf-8?B?bnM0bzhYc2IxN24vSDRRRW9lRm5HT2hBZm4yZUc0dmgwNm1ZeHhmZkxqSDFJ?=
 =?utf-8?B?aDNsTTFtN2w4d1k2c0ZDck5Jd0xCT1AwdzBCNW92eTdpN2hlbTBzLzQrZzRJ?=
 =?utf-8?B?dmc3OW9DN2cvNXNjTE9leTkvY25TQ2VpRUJVYTdzOFJ0M2dSWEhHRVAyellQ?=
 =?utf-8?B?aVdRWWFWSHpzd2JCMWNkeFUydzh5dWhKOG4zWTJtQU1hWUlJZlZmanFJWmR1?=
 =?utf-8?B?N01HYjYzUmpmQlJESENMMXNJNm1yZ21hUVpRQm9GdWttZnJVQ2xaWlpuWEpj?=
 =?utf-8?B?SmdNQVBpc09XSVVqN2ZVOWlnSjFKdDlWMHdTUU5tUDZUalJPU0d2cndQbmFn?=
 =?utf-8?B?YUhWZThvQ2lIWUc3TURzdStrcERTTHYrU0pwcVlEVU9pWTJ2K1g5ODhLY1dM?=
 =?utf-8?B?VjJ3MjJBcHZmOXNGelNlbHk5OHZ6UUswNEpERG1pT1ZvaW0xcWxodFFGZ2Rw?=
 =?utf-8?B?cmJrTk1nanIrN0NJZTNWU2IyTm13WlNsNUF2b2MxUXFyR3IybHptYVoxdXd2?=
 =?utf-8?B?TkJvZWptZUlNNTNCKytpaWN1MXRxTXJzSzA3NjlxZlBBTUdOdFdsVytuWHhm?=
 =?utf-8?B?aC9JeVNPdWJtaDhQKzArZHltK3JiZW16RHNNQmdGRnRsbkt2dExhejdDY2la?=
 =?utf-8?B?UHVsUnNDVWRLaStlOVNzQWRaZlNwR1FVNDdNcVE1Uy9UZGxNN2p0aEZYNUJx?=
 =?utf-8?B?MkhmbzBNNGtyalR1OG52TjI4bkM2UjVVUXRLN0MzRm1YdTVqcktySzl3QWRa?=
 =?utf-8?B?eTg2N0g5eHRqZnN1aUJSRkczWStWOWJWREdjUFBHZ1pqUERpUkpjQmVIMEQ3?=
 =?utf-8?B?bjg2YlBJeFdRak54STV2aFREVFBTajA3ckVKSE5ob0ZiSXA3d3VwcG1iWWZI?=
 =?utf-8?B?QTJsRjg4V3FXeTdsak5RaTJINWhHSjNYelpkbURzaUxjL0hWNXZ5QkdLL0E1?=
 =?utf-8?B?Z0RSSDZReXN1RGFxU05YdmZUb3JLRFJJamtxOVlIQUZCSkRiZlE1anBUcjBW?=
 =?utf-8?B?SXZ1eDd5ekFvcUl6UUJjREQzVlBHMWVCLzNMOGNvYml0c3Y5bjFlUitWRG5w?=
 =?utf-8?B?QTlLVXdzdXZVZnpNS1M2Q0NZOXJIbTVJSURGZEt6NHlXbUJCdm02QUdldDF6?=
 =?utf-8?B?aEU3TVRjaFBwNlRNSXAxb2RyQkZCQS9uTzNtZHpkelRrSjAvVmtHbklTRFZJ?=
 =?utf-8?B?SmRGU2JRcVYvZk13Qnk1Y0FCRHIwYi8rL2lDcDJiU0NMMEJENUNQM3ZZdnlp?=
 =?utf-8?Q?N4B0OtlvBaWUK68aTLAsfZVCI=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anVCbFVOMnVhWnRlSi9jaTdsUGVqK0FsZHc3QjZzS1FVd3ZqTWsxQUhCdHU4?=
 =?utf-8?B?WjFmK2F1VXFvdXJQVi95WFRKWlprWUwxODRkKzJaZEVCdzNrVTh0TFEvUDBL?=
 =?utf-8?B?NHQyRVNyaXNWRS9oY0RsMnJWYUhkaDdtQjFsRlNWd0o5U3VuWUJwM0xZbldj?=
 =?utf-8?B?ZzcvMVRveVFkRitPczU2WU1DK1VPbWd1WHkrU2x4dGNmNVB3aC9BU3oxODA0?=
 =?utf-8?B?Mkh0MVBlbWI5SDdKSmN0cHozVGVOenQ4c1VMWjlNeFRIeXMyUmFVWTNtTDhB?=
 =?utf-8?B?eW01cHMrbHNvdDRpMnIvcjYyR1hadEt5NnUzdzB3eUlZMFZrTHNOWTUzenZn?=
 =?utf-8?B?VXdIQkpacUNKWG9UTStPTHlJb1R5amR3OENqaTNVbUFpTjl1OWQrZmVpTkpG?=
 =?utf-8?B?bnVac2FIQWdTaUMxRkFhWTM2V2dCWFB2dllqNlQ1TlB2c2Z0MXNSSXY2QUlK?=
 =?utf-8?B?YlhGTU1vNFNyOU1Kb0dWUitJYmhrVU1mN3ZDcXliNXdNQkhPTTlOYUlTWUxR?=
 =?utf-8?B?b2EzYmZMVjFPQ3dKaTc5TFJ2cWplNTI0WkNrNTRCNnFwTklJNXk1VktUK1lR?=
 =?utf-8?B?WDVMY0tnZFY0aTVoY1BQUlpzaFF2MVA2NEh0RmpCT3lvd0JzUUp5WHNKK29V?=
 =?utf-8?B?bDNTaGZRaHNXbGg3S2dRaG5SZTJQa2hDRGNRQXdlZlIwU2RxdjgyenpZTUZw?=
 =?utf-8?B?bC9CbjZ6ZWxnTDVLbGpvaStQRTNVc0cxL0xrM3Z6dVpUa21jdzRmVzBOM1VF?=
 =?utf-8?B?cWpjMW14cnd6MnNQWXhvM05nU0FQU2dMRUxpWUZ4Rzk1QVd1djZxYjZaTEpP?=
 =?utf-8?B?Y09SQXZScEs4MHY0Y2VHNVdmV1k0WG9venVPbDNJMjViR3k0QklCRkZ0WWdK?=
 =?utf-8?B?WmhZeGw1SW0wRUFKeWpOL3lHdnppdDhjOFBJZTNEYjExS3dtM3Y5K25jMXQ3?=
 =?utf-8?B?MEJFL2JrekdZWmJIR0lpVzFObkZBNW5xS3UvRVNPQ21JL3NMc0QyZmE1Z2o1?=
 =?utf-8?B?UTlDUC9RWWJnZjliMW1xMjZGTlJkbHAzWFEvSHRaS1pHK3licGtXYTg5MWFU?=
 =?utf-8?B?Nnh1cHA1a25zMG8zOGFtVEUyU2NmQTd3UEJaMjBwdGR5ZVNVSmxWSTdnTjlV?=
 =?utf-8?B?VXc4ZVZJMzBKampYd3g0dGFYaXV4ZHhEcEZYYitPbTRsV01oVU5rUnVRT2p3?=
 =?utf-8?B?cXl2ZlhWU0MzdWRGK3NMMysvRHd3Z3RPU29lQVlZdEgvY3Q0YzBpMFdTM1Jm?=
 =?utf-8?B?TDFHL3h0Q2xMeERnN0pITkVHNVh5ZG5Pd1BxVC9Kc3o5eklmNnpzTjREbEdv?=
 =?utf-8?B?TGp6Lzg1eGRmdVYrT3czVFE3WFZGVGZvTWpHZEduVGo4MFNyNGcrWDQ5Ulpl?=
 =?utf-8?B?UFpNcXFBL1NydWk0bm1Rd3dtQklndFFrcHNvU3orYUpCYS82bE9pWkNrajNl?=
 =?utf-8?B?SE5GVlFNUGpUUXBjdDNvYUV6L3RpMzBaMi9sTFZCTFdZQ214a1lCWFpabXhK?=
 =?utf-8?B?bDBKci9EdlpHNmt5QVQva2VTSnRuRE9pZk1LS1dWSURKVEpUd3A4bm1aRkNP?=
 =?utf-8?B?UWNqbjNkUkFISVZ4Ni9pSDBjd09VNUdzQ2J5ZSt0T2pVckZMOHpsRFBQd25v?=
 =?utf-8?Q?LUNKsRRyoCvG1y4sfbVRoF8lCkBnxKCSYqRTlQHYAAhI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 79976d1c-58db-43ea-8258-08dd55ac4ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 14:54:28.5355 (UTC)
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDU6MjjigK9QTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4g77u/SGkNCj4gDQo+PiBBbSAyNS4wMi4y
NSB1bSAxMTozMyBzY2hyaWViIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbToNCj4+
PiBPbiBUdWUsIEZlYiAyNSwgMjAyNSBhdCAxMDowOTo0MkFNICswMDAwLCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4+PiBGcm9tOiBLZXJlbSBLYXJhYmF5IDxrZWtyYnlAZ21haWwuY29tPg0KPj4+IA0K
Pj4+IFRoZSBUb3VjaCBCYXJzIGZvdW5kIG9uIHg4NiBNYWNzIHN1cHBvcnQgdHdvIFVTQiBjb25m
aWd1cmF0aW9uczogb25lDQo+Pj4gd2hlcmUgdGhlIGRldmljZSBwcmVzZW50cyBpdHNlbGYgYXMg
YSBISUQga2V5Ym9hcmQgYW5kIGNhbiBkaXNwbGF5DQo+Pj4gcHJlZGVmaW5lZCBzZXRzIG9mIGtl
eXMsIGFuZCBvbmUgd2hlcmUgdGhlIG9wZXJhdGluZyBzeXN0ZW0gaGFzIGZ1bGwNCj4+PiBjb250
cm9sIG92ZXIgd2hhdCBpcyBkaXNwbGF5ZWQuDQo+Pj4gDQo+Pj4gVGhpcyBjb21taXQgYWRkcyBz
dXBwb3J0IGZvciB0aGUgZGlzcGxheSBmdW5jdGlvbmFsaXR5IG9mIHRoZSBzZWNvbmQNCj4+PiBj
b25maWd1cmF0aW9uLiBGdW5jdGlvbmFsaXR5IGZvciB0aGUgZmlyc3QgY29uZmlndXJhdGlvbiBo
YXMgYmVlbg0KPj4+IG1lcmdlZCBpbiB0aGUgSElEIHRyZWUuDQo+Pj4gDQo+Pj4gTm90ZSB0aGF0
IHRoaXMgZHJpdmVyIGhhcyBvbmx5IGJlZW4gdGVzdGVkIG9uIFQyIE1hY3MsIGFuZCBvbmx5IGlu
Y2x1ZGVzDQo+Pj4gdGhlIFVTQiBkZXZpY2UgSUQgZm9yIHRoZXNlIGRldmljZXMuIFRlc3Rpbmcg
b24gVDEgTWFjcyB3b3VsZCBiZQ0KPj4+IGFwcHJlY2lhdGVkLg0KPj4+IA0KPj4+IENyZWRpdCBn
b2VzIHRvIEJlbiAoQmluZ3hpbmcpIFdhbmcgb24gR2l0SHViIGZvciByZXZlcnNlIGVuZ2luZWVy
aW5nDQo+Pj4gbW9zdCBvZiB0aGUgcHJvdG9jb2wuDQo+Pj4gDQo+Pj4gQWxzbywgYXMgcmVxdWVz
dGVkIGJ5IEFuZHksIEkgd291bGQgbGlrZSB0byBjbGFyaWZ5IHRoZSB1c2Ugb2YgX19wYWNrZWQN
Cj4+PiBzdHJ1Y3RzIGluIHRoaXMgZHJpdmVyOg0KPj4+IA0KPj4+IC0gQWxsIHRoZSBwYWNrZWQg
c3RydWN0cyBhcmUgYWxpZ25lZCBleGNlcHQgZm9yIGFwcGxldGJkcm1fbXNnX2luZm9ybWF0aW9u
Lg0KPj4+IC0gV2UgaGF2ZSB0byBwYWNrIGFwcGxldGJkcm1fbXNnX2luZm9ybWF0aW9uIHNpbmNl
IGl0IGlzIHJlcXVpcmVtZW50IG9mDQo+Pj4gICB0aGUgcHJvdG9jb2wuDQo+Pj4gLSBXZSBjb21w
YXJlZCBiaW5hcmllcyBjb21waWxlZCBieSBrZWVwaW5nIHRoZSByZXN0IHN0cnVjdHMgX19wYWNr
ZWQgYW5kDQo+Pj4gICBub3QgX19wYWNrZWQgdXNpbmcgYmxvYXQtby1tZXRlciwgYW5kIF9fcGFj
a2VkIHdhcyBub3QgYWZmZWN0aW5nIGNvZGUNCj4+PiAgIGdlbmVyYXRpb24uDQo+Pj4gLSBUbyBt
YWludGFpbiBjb25zaXN0ZW5jeSwgcmVzdCBzdHJ1Y3RzIGhhdmUgYmVlbiBrZXB0IF9fcGFja2Vk
Lg0KPj4+IA0KPj4+IEkgd291bGQgYWxzbyBsaWtlIHRvIHBvaW50IG91dCB0aGF0IHNpbmNlIHRo
ZSBkcml2ZXIgd2FzIHJldmVyc2UtZW5naW5lZXJlZA0KPj4+IHRoZSBhY3R1YWwgZGF0YSB0eXBl
cyBvZiB0aGUgcHJvdG9jb2wgbWlnaHQgYmUgZGlmZmVyZW50LCBpbmNsdWRpbmcsIGJ1dA0KPj4+
IG5vdCBsaW1pdGVkIHRvLCBlbmRpYW5uZXNzLg0KPj4gLi4uDQo+PiANCj4+PiArc3RhdGljIGlu
dCBhcHBsZXRiZHJtX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLA0KPj4+ICsgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IHVzYl9kZXZpY2VfaWQgKmlkKQ0KPj4+ICt7DQo+Pj4g
KyAgICBzdHJ1Y3QgdXNiX2VuZHBvaW50X2Rlc2NyaXB0b3IgKmJ1bGtfaW4sICpidWxrX291dDsN
Cj4+PiArICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZpbnRmLT5kZXY7DQo+Pj4gKyAgICBzdHJ1
Y3QgYXBwbGV0YmRybV9kZXZpY2UgKmFkZXY7DQo+Pj4gKyAgICBzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtOw0KPj4+ICsgICAgaW50IHJldDsNCj4+PiArDQo+Pj4gKyAgICByZXQgPSB1c2JfZmluZF9j
b21tb25fZW5kcG9pbnRzKGludGYtPmN1cl9hbHRzZXR0aW5nLCAmYnVsa19pbiwgJmJ1bGtfb3V0
LCBOVUxMLCBOVUxMKTsNCj4+PiArICAgIGlmIChyZXQpIHsNCj4+PiArICAgICAgICBkcm1fZXJy
KGRybSwgIkZhaWxlZCB0byBmaW5kIGJ1bGsgZW5kcG9pbnRzXG4iKTsNCj4+IFRoaXMgaXMgc2lt
cGx5IHdyb25nIChhbmQgaW4gdGhpcyBjYXNlIGV2ZW4gbGVhZCB0byBjcmFzaCBpbiBzb21lIGNp
cmN1bXN0YW5jZXMpLg0KPj4gZHJtX2VycigpIG1heSBub3QgYmUgdXNlZCBoZXJlLiBUaGF0J3Mg
bXkgcG9pbnQgaW4gcHJldmlvdXMgZGlzY3Vzc2lvbnMuDQo+PiBJbmRlcGVuZGVudGx5IG9uIHRo
ZSBzdWJzeXN0ZW0gdGhlIC0+cHJvYmUoKSBmb3IgdGhlIHNha2Ugb2YgY29uc2lzdGVuY3kgYW5k
DQo+PiBiZWluZyBpbmZvcm1hdGl2ZSBzaG91bGQgb25seSByZWx5IG9uIHN0cnVjdCBkZXZpY2Ug
KmRldiwNCj4gDQo+IFRoYXQncyBuZXZlciBnb2luZyB0byB3b3JrIHdpdGggRFJNLiBUaGVyZSdz
IHNvIG11Y2ggY29kZSBpbiBhIERSTSBwcm9iZSBmdW5jdGlvbiB0aGF0IHVzZXMgdGhlIERSTSBl
cnJvciBmdW5jdGlvbnMuDQo+IA0KPiBUaGlzIHNwZWNpZmljIGluc3RhbmNlIGhlcmUgaXMgd3Jv
bmcsIGFzIHRoZSBkcm0gcG9pbnRlciBoYXNuJ3QgYmVlbiBpbml0aWFsaXplZC4gQnV0IGFzIHNv
b24gYXMgaXQgaXMsIGl0J3MgbXVjaCBiZXR0ZXIgdG8gdXNlIGRybV9lcnIoKSBhbmQgZnJpZW5k
cy4gSXQgd2lsbCBkbyB0aGUgcmlnaHQgdGhpbmcgYW5kIGdpdmUgY29uc2lzdGVudCBvdXRwdXQg
YWNyb3NzIGRyaXZlcnMuDQo+IA0KT2sgc28gdGhpcyBpcyBhY3R1YWxseSBhbiBpbnRlcmVzdGlu
ZyBjYXNlLCBzaW5jZSBJIGFtIHRyeWluZyB0byBmaXggaXQuIFRvIGluaXRpYWxpc2UgdGhlIGRy
bSBwb2ludGVyLCB3ZSBuZWVkIHRvIGluaXRpYWxpc2UgYWRldiwgYW5kIHRvIGluaXRpYWxpc2Ug
YWRldiwgd2UgbmVlZCB0byBydW4gdXNiX2ZpbmRfY29tbW9uX2VuZHBvaW50cyBmaXJzdC4gU28g
SU1PLCB3ZSBjYW5ub3QgdXNlIGRybV9lcnIgaGVyZSwgYnV0IHJhdGhlciBkZXZfZXJyX3Byb2Jl
IGNhbiBiZSB1c2VkLg0KPiANCj4gDQo+PiANCj4+PiArICAgICAgICByZXR1cm4gcmV0Ow0KPj4+
ICsgICAgfQ0KPj4+ICsNCj4+PiArICAgIGFkZXYgPSBkZXZtX2RybV9kZXZfYWxsb2MoZGV2LCAm
YXBwbGV0YmRybV9kcm1fZHJpdmVyLCBzdHJ1Y3QgYXBwbGV0YmRybV9kZXZpY2UsIGRybSk7DQo+
Pj4gKyAgICBpZiAoSVNfRVJSKGFkZXYpKQ0KPj4+ICsgICAgICAgIHJldHVybiBQVFJfRVJSKGFk
ZXYpOw0KPj4+ICsNCj4+PiArICAgIGFkZXYtPmluX2VwID0gYnVsa19pbi0+YkVuZHBvaW50QWRk
cmVzczsNCj4+PiArICAgIGFkZXYtPm91dF9lcCA9IGJ1bGtfb3V0LT5iRW5kcG9pbnRBZGRyZXNz
Ow0KPj4+ICsgICAgYWRldi0+ZG1hZGV2ID0gZGV2Ow0KPj4+ICsNCj4+PiArICAgIGRybSA9ICZh
ZGV2LT5kcm07DQo+Pj4gKw0KPj4+ICsgICAgdXNiX3NldF9pbnRmZGF0YShpbnRmLCBhZGV2KTsN
Cj4+PiArDQo+Pj4gKyAgICByZXQgPSBhcHBsZXRiZHJtX2dldF9pbmZvcm1hdGlvbihhZGV2KTsN
Cj4+PiArICAgIGlmIChyZXQpIHsNCj4+PiArICAgICAgICBkcm1fZXJyKGRybSwgIkZhaWxlZCB0
byBnZXQgZGlzcGxheSBpbmZvcm1hdGlvblxuIik7DQo+Pj4gKyAgICAgICAgcmV0dXJuIHJldDsN
Cj4+PiArICAgIH0NCj4+PiArDQo+Pj4gKyAgICByZXQgPSBhcHBsZXRiZHJtX3NpZ25hbF9yZWFk
aW5lc3MoYWRldik7DQo+Pj4gKyAgICBpZiAocmV0KSB7DQo+Pj4gKyAgICAgICAgZHJtX2Vycihk
cm0sICJGYWlsZWQgdG8gc2lnbmFsIHJlYWRpbmVzc1xuIik7DQo+Pj4gKyAgICAgICAgcmV0dXJu
IHJldDsNCj4+PiArICAgIH0NCj4+PiArDQo+Pj4gKyAgICByZXQgPSBhcHBsZXRiZHJtX3NldHVw
X21vZGVfY29uZmlnKGFkZXYpOw0KPj4+ICsgICAgaWYgKHJldCkgew0KPj4+ICsgICAgICAgIGRy
bV9lcnIoZHJtLCAiRmFpbGVkIHRvIHNldHVwIG1vZGUgY29uZmlnXG4iKTsNCj4+PiArICAgICAg
ICByZXR1cm4gcmV0Ow0KPj4+ICsgICAgfQ0KPj4+ICsNCj4+PiArICAgIHJldCA9IGRybV9kZXZf
cmVnaXN0ZXIoZHJtLCAwKTsNCj4+PiArICAgIGlmIChyZXQpIHsNCj4+PiArICAgICAgICBkcm1f
ZXJyKGRybSwgIkZhaWxlZCB0byByZWdpc3RlciBEUk0gZGV2aWNlXG4iKTsNCj4+PiArICAgICAg
ICByZXR1cm4gcmV0Ow0KPj4+ICsgICAgfQ0KPj4+ICsNCj4+PiArICAgIHJldCA9IGFwcGxldGJk
cm1fY2xlYXJfZGlzcGxheShhZGV2KTsNCj4+PiArICAgIGlmIChyZXQpIHsNCj4+PiArICAgICAg
ICBkcm1fZXJyKGRybSwgIkZhaWxlZCB0byBjbGVhciBkaXNwbGF5XG4iKTsNCj4+PiArICAgICAg
ICByZXR1cm4gcmV0Ow0KPj4+ICsgICAgfQ0KPj4+ICsNCj4+PiArICAgIHJldHVybiAwOw0KPj4+
ICt9DQo+IA0KPiAtLQ0KPiAtLQ0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBG
cmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPiBHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQo+IEhS
QiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0KPiANCg==
