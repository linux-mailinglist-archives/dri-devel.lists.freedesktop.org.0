Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04AA426E4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A4F10E434;
	Mon, 24 Feb 2025 15:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="SCtPvQWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011039.outbound.protection.outlook.com
 [52.103.67.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8E510E434
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8SuLVush5iGbzyx0tcMruxsQaRx2AaArXjM439VHpPXfy7MRC+ZrL61OF0ldHxPxQUPW3Mlo3c5LQIkU00quxJ9NWohZkWSnXgfzNEyvFEjndTIH7loKC1Xg3xHmU6etk1TLd5H6OVmjXRPNe8W+0D8Fh+hJj95kh3Q5YOEzy2GPOml3tXHLdJeZU+rQF9Kc0JkZfbait2tweMolv4XdcGSBbafAHMw0t8fP4IiTPmIKQanw1Jz2rMlxidathTX9uu2qcwi4SarhBTgI02CyScyzyCuinDMIGB2JeNs75cPLFMxhIsAQEJelchqNg/1ElSi/TwgmJQVhYKy+iYlyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETMUN/hIs6RsR2vEU/hEOkhCBS/USY2WCm3n98EkkTw=;
 b=cfZUAz1MB90VvyCNITZq8a3FzXJpduOWiCfDL1UueKx2KfnyeKY2ViQA7QhqLUGafnqWn0mdM3oXnKrOA6MayaRACbes8iMnsiFtKM5xXXL6guUVbDlaSI00SMMjUoU1DLrH5+m2rDg0HmBJ+Inl+56SMwcxQYTe4fy3bsIrpqULgGPjJAXd/jtes8CQnuSs+DuNBuhul9Q4lrRgr0POcGkxLoxVzhda72Baoy3Y8hpESj4r3XkQryu1mVCN5lU0LQjNhJy+g3n7tW+5u4b4/zbFmZI4xH43SUqG2A+6GOb9Ci80kxg3QMzLwkm+5S6MpPO59YfpnFXRZ5y6zO7xaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETMUN/hIs6RsR2vEU/hEOkhCBS/USY2WCm3n98EkkTw=;
 b=SCtPvQWsMIEbsZPLtJFVX7qEARZvIPgQvOsDeGu5viqGFRM3t4RsQY3JetHk7oX2edx408vlZNTqfr/8zy9W9yFRpe7ziIa7ao3OLhw242eTPNqtduPSDMy7RMkhr8lcb3crGQIUUj60lmUp83R0+2x5Ox5fHcPEqM/o029OMxyjk4iXGjUz0BLgzgHlRe7Pj2GEuO5GQ1/fmsmlsNu61MiwYND4uKiMpNWWZPAFVcHfIA4ehDqWwXsnz7J57oS8ZgLvoqfj7TUHVZH/Gsdmm7RkD3DGZOSQOHBd/Em3X59WhwlQKf8F3kawfRSM3G7jEOg0udJFrR7DfLLMu7sf1w==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PPFF5EDB0913.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::531)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 15:52:03 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:52:03 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWe38AgAAI1YCAAAcMAIAAAaKAgAACOwCAAAJQAIAABK8AgAAA9gyAAAKrgIAAALi9
Date: Mon, 24 Feb 2025 15:52:03 +0000
Message-ID: <PN3PR01MB95970BAFDA466CE04A7297FBB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
 <PN3PR01MB9597D4FD9FD8B8A8FB0F2B3CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7yR_u6ISEQFAwsI@smile.fi.intel.com>
 <PN3PR01MB959735D463E60E2952EC0986B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7yVCRIRU5V9JsWC@smile.fi.intel.com>
In-Reply-To: <Z7yVCRIRU5V9JsWC@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PPFF5EDB0913:EE_
x-ms-office365-filtering-correlation-id: e1c6ad2b-0f9d-4b0b-d038-08dd54eb2eec
x-microsoft-antispam: BCL:0;
 ARA:14566002|6072599003|461199028|7092599003|8062599003|15080799006|8060799006|19110799003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?utf-8?B?LzUyR0FGc1VzMk1pcmlOQlkvZlhBSEpzeDRpajdheXR6Rmhjd20rRldSMTNo?=
 =?utf-8?B?cE4rRDQrRlpqR0NuQzlEWDlWVTlTWWloQWRLZHlGWmo1SC8xREhrK1VKdnRU?=
 =?utf-8?B?L3VaME1ZYlZHS05xREhxYlVBVkhwSTRmTHR5NHlWcDBmNkxBTXZyS3ZCZFl2?=
 =?utf-8?B?MEQ5eFpLT2VPZ0xpSFg0dWh0blhZUXkvRndUYVhkc1JETDhiYjBieWZDSFFl?=
 =?utf-8?B?R0R2cmJNUmE0QXNFT3AwcTVHUmdVSVJxNWVkNnB3bXZGdUVrL0NwU2ovY3hU?=
 =?utf-8?B?QytLZ1BaS1Zvc05EcFFzNEFZcWtZZmpaRTNYYXhsS2hQaSsxaE5saTBkZnQ3?=
 =?utf-8?B?b1VsRWhDdUJVWSs2dG5ZL05ZMy9RNkdsNDd0K2tkRWVvd3ZEdzdHZ1NHSU5O?=
 =?utf-8?B?aXVzaHZ0V1RsUkVCZEhwKysrSGtmTjNXREpHanZqZ294QTIrdE9hNEhBWDdo?=
 =?utf-8?B?cmYxR0ZRT2kvUG9SY1pRWWpsVkhUYkxVdCt6R2U0cXVxTUxTbWQ4MEZ5SDlW?=
 =?utf-8?B?S0VpdkRjb1Y3WWI0U0kzUWpzTno2SWZtaXo0cFJ3blpucjhGQkNRQWZIVEU5?=
 =?utf-8?B?R0VkWmxSWHY5NFUzYnJDbjNlWUF0NUU0ZGtPOXNSWXRuNm4xb2hnOW9vejlB?=
 =?utf-8?B?d2dJcHhNZUdxUGNhS0IzM2JRL0lTd252Q1VpT21ReWJRU3prcDlxNGpUU1N2?=
 =?utf-8?B?S05COS9jY1RxZkdMUFhvMFBjYjU0enNhbFIwSlVJNGJqenhBSkl2TFpvVGRX?=
 =?utf-8?B?RDBVSXRqU0RJN0ZRMmJIbHpPSlpEc2NYQUVzR1B4eWY4L09oak5oWlMzRnNR?=
 =?utf-8?B?dklFc2xpVHpCQ1JTalcvNUZBb3lObVMvdmVCZ2FvWDdEcjNZTTRSOWswMXVq?=
 =?utf-8?B?Y2Mzd2tnRFptOUExTHFWNTF4VFdITzZqZjlQYlp1d1dZdHpUOHV5NXhQSGIy?=
 =?utf-8?B?bXY4MUVPVnNWYk93VUdmb2NNdHUxYlhwellSZjlOUk1kRzhUQUZJbmlCY0pC?=
 =?utf-8?B?NDI0V1k0bVJrdURXbkE0S1Z0bXJ5SWtXTEtzZ2tJWk1JQmt5b2FOZGJPd3lS?=
 =?utf-8?B?VU9YQ3MrV0RJS0QvdEdpVWZTMzV6UXZzWXF0b0FvaTcxeFRKRTBOVm1CQkRq?=
 =?utf-8?B?WXZ3YnViTW9kTERRN3NBSmNWVVp3NnUrNDhzZk05RWdJbVY0d0dqcWpRa2gv?=
 =?utf-8?B?MGVLdHRtQjdwZGl6MVBPNjhkeXBYUnY2VXYyT2ZVUm9EOENQWTVvWkRVVmE3?=
 =?utf-8?B?Tms0NitYdEZTNHFpNUNaamFrNEZSOVc1QzhMK2xDUVVrNmtESUN3WmlxRDR6?=
 =?utf-8?B?WFhoKzV2b0I4TnBUV0Y3Q2NTUzg5SHVIR283MDhqWUlHa3kxdUpwcUZGTFNm?=
 =?utf-8?B?NXZjL0VyZG5QVlFLMXZMb0JmeFovQWNUaHB1dFBHQlFHdFA0T3ZLM2tmNVRG?=
 =?utf-8?B?YWdKWm1EVWhmMXgrQ2F1cHcwa2gxdWtRV2JaeVZNT212bmJzS2x5VVBlUllL?=
 =?utf-8?Q?MqGY38=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFVleTB3VGV5YUtJU0s2VVV5YzFZT0RUL0NzYWlnU3VtNG5xV0VwZnc1Q3Zs?=
 =?utf-8?B?NEszMk1WODRWS24yblNmVEt3ZGRickRFdDRybE43MEJvbkdTNG1WRGlsaFhN?=
 =?utf-8?B?TjZYWFlMd0Z3cHR5akxuYlF6eDQwbGwxMFpmcS9tTW5OYUI3emVnaGhmZjMv?=
 =?utf-8?B?ckd3Z1JYVHRMU1hZVkMvTW9KOGY2UnBnbDN0Y3hkZU5OaWQyM1ZvTWs3c1hQ?=
 =?utf-8?B?NXVwTkV3RFZyVjNjeDEvbnljT1VNVUdjM2RMSSswR3BkSjFZUUtUaGxBdXBh?=
 =?utf-8?B?ZzBrb1dHY2NiZmZMWHBsNU5zUXFDQzV4ZzBzdnE4NWl5TU4zc3RDYnRybktq?=
 =?utf-8?B?L0ZBamRUVnVBemZlMWxxcW5uUzdZcEVQSlVMaDRTZUtiZVRmdThwY2Uycjd1?=
 =?utf-8?B?bG1Wc1I1emFtMGlKNy9pVlZZYnE2SThBS1ZJWDJvdWRmVDhQWmVXYS9BWjcy?=
 =?utf-8?B?VkpxSWpmd2RxRXNyZ1dVLy94QUV3T3FhWmtoS1lObmFwMlNydHUrRG92RWxn?=
 =?utf-8?B?ckgxaFI3QVhnVUkxN3ZCbnFRRVJCRmgveGFyUi8ydDhrcHJGZnpyK1cyZDEv?=
 =?utf-8?B?emwxZFdKaCtPR1ovUW9sZUdjUmY4MEd4VFJjWEZnZ2M3czdNTzUyOUFTSmNR?=
 =?utf-8?B?T2o5TkZtVzlGRS9Dck5KeERTM1FidXdGazhIWXRQVEpObmFndWVoMnNSMHV4?=
 =?utf-8?B?SXFJY3ZJQk1iR2kwVGU4eWFlNmNPdUplUktuY2pmdUtDRnFoc3hQZE9xZjZR?=
 =?utf-8?B?WWc3Mk0rcGRVNDVLeE1kRzR2N2p6UDk4VW9VK0c5alQ3Z09PWndBeW01Z1Z5?=
 =?utf-8?B?SS93Vjl6SkVLb3NtODRlQnoyeEpPWFg3ZWx0OWl0Y2llMTFRcXR2cmpzY05Y?=
 =?utf-8?B?SjY0ZUMrSlJMVkIxTHNNYXYzQWEwS0I3NU93bXpQUHFMQ2NPVVZsRU1MNytZ?=
 =?utf-8?B?TDJ0NmlNbWhHM2lLS0tBem9vM2pyNmNxeVNlTzlnQmhxLzZsdnNpMEpSb0Z5?=
 =?utf-8?B?R3BWQTArWkdtVTBvVEwyeWxyUC9aZGg0dmJaaTFzY0JYYWszV2FsRzZSc3Ro?=
 =?utf-8?B?QmNscTNQVXB3eE9OY0JKOG9ZOWxoeXQzaU9QalBkTFBwSnhabmp1NUo5WWxF?=
 =?utf-8?B?S1Ixa1VhNURLdjVJa216WHNSRVVMZTEzZnplM1dvVmxRclBRTW9vZmRweFBa?=
 =?utf-8?B?bXFXZmFDRVIwNmxMSFRSb25CMnRzWm10eVJyODF1WThtaVZ5eEp1My9JNWg1?=
 =?utf-8?B?TEhlZGZ5WmZYU0ZzRTBsY1E4eUVQcSt0R3VOVVRYVEd2VWlVdlNhTzlnR2RK?=
 =?utf-8?B?L2QxR09tNHNXYmt1Q2VoOWZzYzEvRXE5SmJicnBYeVp3TjNYKy9XaE0yMGw4?=
 =?utf-8?B?WXRSd1FHbmtKZDZyQUllMFBNMUR3VUlwNGRlbU8wTllsWmppUWxJNSsrN0M5?=
 =?utf-8?B?TlhHSmpRVG03SER3Sk1kTnN2RXBMalk3OGlNQkZGUFduSzVoZzlHRnhFU3Rp?=
 =?utf-8?B?NFRiYjVEYUZtMXRkbEdIMGVOM2tXck5MN1NzamcyWVhnREgrdyt3aldNMG5n?=
 =?utf-8?B?ZGhEK2p2S2pBQmFlK1hJRjJhZjhNRCtmMzFXU2VmYUt3OUtoSTNscm1wY21Z?=
 =?utf-8?Q?8IoJ6lzK0SMVYhK0wRECEDz1DfzUMKMCZTlyO7LT+Zyw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c6ad2b-0f9d-4b0b-d038-08dd54eb2eec
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 15:52:03.7287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPFF5EDB0913
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDk6MTnigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDM6
Mzk6NTZQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IE9uIDI0IEZlYiAyMDI1LCBh
dCA5OjA34oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+
PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwMzoyMDoxM1BNICswMDAwLCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4+Pj4+PiBPbiAyNCBGZWIgMjAyNSwgYXQgODo0MeKAr1BNLCBhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb20gd3JvdGU6DQo+Pj4+PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBh
dCAwMzowMzo0MFBNICswMDAwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+Pj4+Pj4+IE9uIDI0IEZl
YiAyMDI1LCBhdCA4OjI34oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3
cm90ZToNCj4+Pj4+Pj4gT24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDI6MzI6MzdQTSArMDAwMCwg
QWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+Pj4+Pj4gT24gMjQgRmViIDIwMjUsIGF0IDc6MzDigK9Q
TSwgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tIHdyb3RlOg0KPj4+Pj4+Pj4+IE9u
IE1vbiwgRmViIDI0LCAyMDI1IGF0IDAxOjQwOjIwUE0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3Rl
Og0KPiANCj4gLi4uDQo+IA0KPj4+Pj4+Pj4+PiArI2RlZmluZSBfX0FQUExFVEJEUk1fTVNHX1NU
UjQoc3RyNCkgKChfX2xlMzIgX19mb3JjZSkoKHN0cjRbMF0gPDwgMjQpIHwgKHN0cjRbMV0gPDwg
MTYpIHwgKHN0cjRbMl0gPDwgOCkgfCBzdHI0WzNdKSkNCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBB
cyBjb21tZW50ZWQgcHJldmlvdXNseSB0aGlzIGlzIHF1aXRlIHN0cmFuZ2Ugd2hhdCdzIGdvaW5n
IG9uIHdpdGggZW5kaWFuZXNzIGluDQo+Pj4+Pj4+Pj4gdGhpcyBkcml2ZXIuIEVzcGVjaWFsbHkg
dGhlIGFib3ZlIHdlaXJkbmVzcyB3aGVuIGdldF91bmFsaWduZWRfYmUzMigpIGlzIGJlaW5nDQo+
Pj4+Pj4+Pj4gb3BlbiBjb2RlZCBhbmQgZm9yY2UtY2FzdCB0byBfX2xlMzIuDQo+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4+IEkgd291bGQgYXNzdW1lIGl0IHdhcyBhbHNvIG1pbWlja2VkIGZyb20gdGhlIFdp
bmRvd3MgZHJpdmVyLCB0aG91Z2ggSSBoYXZlbid0DQo+Pj4+Pj4+PiByZWFsbHkgdHJpZWQgZXhw
bG9yaW5nIHRoaXMgdGhlcmUuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IEnigJlkIHJhdGhlciBiZSBo
YXBweSBpZiB5b3UgZ2l2ZSBtZSBjb2RlIGNoYW5nZSBzdWdnZXN0aW9ucyBhbmQgbGV0IG1lIHJl
dmlldw0KPj4+Pj4+Pj4gYW5kIHRlc3QgdGhlbQ0KPj4+Pj4+PiANCj4+Pj4+Pj4gRm9yIHRoZSBz
dGFydGVyIEkgd291bGQgZG8gdGhlIGZvbGxvd2luZyBmb3IgYWxsIHJlbGF0ZWQgY29uc3RhbnRz
IGFuZA0KPj4+Pj4+PiBkcm9wIHRoYXQgd2VpcmQgYW5kIHVnbHkgbWFjcm9zIGF0IHRoZSB0b3Ag
KGl0IGFsc28gaGFzIGFuIGlzc3VlIHdpdGgNCj4+Pj4+Pj4gdGhlIHN0cjQgbGVuZ3RoIGFzIGl0
IGlzIDUgYnl0ZXMgbG9uZywgbm90IDQsIGJ0dyk6DQo+Pj4+Pj4+IA0KPj4+Pj4+PiAjZGVmaW5l
IEFQUExFVEJEUk1fTVNHX0NMRUFSX0RJU1BMQVkgY3B1X3RvX2xlMzIoMHg0MzRjNTI0NCkgLyog
Q0xSRCAqLw0KPj4+Pj4+IA0KPj4+Pj4+IExlbW1lIHRlc3QgdGhpcy4NCj4+Pj4+IA0KPj4+Pj4g
SnVzdCBpbiBjYXNlIGl0IHdvbid0IHdvcmssIHJldmVyc2UgYnl0ZXMgaW4gdGhlIGludGVnZXIu
IEJlY2F1c2UgSSB3YXMgbG9zdCBpbg0KPj4+Pj4gdGhpcyBjb252ZXJzaW9uLg0KPj4+PiANCj4+
Pj4gSXQgd29ya3MuIFdoYXQgSSB1bmRlcnN0YW5kIGlzIHRoYXQgeW91IHVzZWQgdGhlIG1hY3Jv
IHRvIGdldCB0aGUgZmluYWwgaGV4DQo+Pj4+IGFuZCBjb252ZXJ0ZWQgaXQgaW50byBsaXR0bGUg
ZW5kaWFuLCB3aGljaCBvbiB0aGUgeDg2IG1hY3Mgd291bGQgdGVjaG5pY2FsbHkNCj4+Pj4gcmVt
YWluIHRoZSBzYW1lLg0KPj4gDQo+PiBUaGUgTWFjcm8gaXMganVzdCBjb252ZXJ0aW5nIHRoZSBs
ZXR0ZXJzIGludG8gdGhlaXIgaGV4IGZvcm0sIGJ1dCBzaW1wbHkNCj4+IGNhbGN1bGF0aW5nIHRo
ZW0gYW5kIHB1dHRpbmcgdGhlIGxldHRlcnMgaW4gY29tbWVudHMgaXMgZXF1YWxseSBnb29kLg0K
PiANCj4gQWdhaW4sIGl0IGRvZXMgaXQgaW4gbW9zdCBjb25mdXNpbmcgYW5kIHdlaXJkIHdheS4g
SnVzdCBraWxsIGl0Lg0KDQojZGVmaW5lIEFQUExFVEJEUk1fUElYRUxfRk9STUFUCQljcHVfdG9f
bGUzMigweDUyNDc0MjQxKSAvKiBSR0JBLCB0aGUgYWN0dWFsIGZvcm1hdCBpcyBCR1I4ODggKi8N
CiNkZWZpbmUgQVBQTEVUQkRSTV9CSVRTX1BFUl9QSVhFTAkyNA0KDQojZGVmaW5lIEFQUExFVEJE
Uk1fTVNHX0NMRUFSX0RJU1BMQVkJY3B1X3RvX2xlMzIoMHg0MzRjNTI0NCkgLyogQ0xSRCAqLw0K
I2RlZmluZSBBUFBMRVRCRFJNX01TR19HRVRfSU5GT1JNQVRJT04JY3B1X3RvX2xlMzIoMHg0NzQ5
NGU0NikgLyogR0lORiAqLw0KI2RlZmluZSBBUFBMRVRCRFJNX01TR19VUERBVEVfQ09NUExFVEUJ
Y3B1X3RvX2xlMzIoMHg1NTQ0NDM0YykgLyogVURDTCAqLw0KI2RlZmluZSBBUFBMRVRCRFJNX01T
R19TSUdOQUxfUkVBRElORVNTCWNwdV90b19sZTMyKDB4NTI0NTQ0NTkpIC8qIFJFRFkgKi8NCg0K
VGhpcyBzaG91bGQgYmUgZ29vZC4=
