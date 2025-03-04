Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF82AA4E096
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FB210E5E4;
	Tue,  4 Mar 2025 14:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="LpGofLCZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010013.outbound.protection.outlook.com
 [52.103.67.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B8B10E5E4
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:20:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2Ncti48WWpSNsV3SuSytLj/zhcyPKmiWDkvvTV5ORJqxFTQAbKQceXCkGisOiGiP3ZdttXus5fE4LbgP2m44UWgEuX2Bv0W73rOHSh5wSy7KBdvyNhFpEAZ6FSv2k/lQWGzOangEfUW0Hc3u8FoiRRhS9uDnV74gsRw/QM7uQ1HqDmm3r7IBuyCNjEKxECDD32caOW1zI9aoLr79YafgKtPNmo3wghSOSjNuhULxPEk6qwmxnhkfQBY3sC/2p+CnsibpQNh2XAS5Pbp7YIv8t8nLzJ99bag4qGz7efaG1qAbNJP6fyRRasPGsec8qFmgq5+/+SS+2lDhYKwOyPomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAQ5H+VM4ft1hZlTjrcVbu3rLtnteagpL5EgEOQGXXQ=;
 b=fNJiKLZBdEhZ856kihfKit4y8jKKLxNRzVdzEKpcDYShyetkZsbEju8d+TryKWO6e3wEkawI3BnOyKHvCCgL1sKNb0oc/TBxRo52rw7jCOYDWlm4Gi1NH0kPGLuA+56T3GkSISQjcY2X5Z73uZFDBzt2eoCOCSlk56gyEt74/Q9LgCky+lPcNlTHogq7vFil5+6p/Yd95qwbnjzLzPh1G5eos05kNBWCmlqK9PTV/MXcZu3s04mLVtTfq4gi9Bpr0di/1uj5f+88W0EEeGDcLgV0wlhR5FHspJy0eFJJJE87rJxAzHAK/BvrbZqpVU5LTEWFifzyzqxxYWlSpNvx2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAQ5H+VM4ft1hZlTjrcVbu3rLtnteagpL5EgEOQGXXQ=;
 b=LpGofLCZ5TPf0kj/czUVuJPMDVOGnu6Lq9MT/G5himqdlwDezsxuU9P7K0iKtkTqdxb1aQVnUp9fz6qVQFocuvOnh+sUe+VLOUDL72z2MdhMjCm2SYmP5Wf1/UzFccvp+l4vVEIMCQ7tn7LPm7rWkfJ6hUnrLDg41XlNAVsy2Oyeasos0EsY3LDAf21wNEcNIiE2TeoVhONhj01NIVwKgDnA1HNEDQLNM/VUl7bKA7wBpZY7DzeJs+CCKbm7EJUuR6h0UaIXynrXqmUL35eFEibpuU6Of4H/3COEo5lgi1n5Q+ueSw33ujuj9YdSYpqKbfiYH7fRhBwqRcaAtk15eg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB4363.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:17::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 14:20:06 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 14:20:06 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: Aun-Ali Zaidi <admin@kodeit.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Atharva Tiwari
 <evepolonium@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>, Nathan Chancellor
 <nathan@kernel.org>
Subject: Re: [PATCH] drm/appletbdrm: Fix format specifier for size_t variables
Thread-Topic: [PATCH] drm/appletbdrm: Fix format specifier for size_t variables
Thread-Index: AQHbjQgYk6o1+Qe/jU69MD1Oc2k5Q7NjBvxv
Date: Tue, 4 Mar 2025 14:20:06 +0000
Message-ID: <PN3PR01MB959766B5334E2D3B953ADE0EB8C82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <20250304-appletbdrm-fix-size_t-specifier-v1-1-94fe1d2c91f8@kernel.org>
In-Reply-To: <20250304-appletbdrm-fix-size_t-specifier-v1-1-94fe1d2c91f8@kernel.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB4363:EE_
x-ms-office365-filtering-correlation-id: 5072ea07-5687-4711-9728-08dd5b27a9c4
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|19110799003|8062599003|15080799006|7092599003|6072599003|8060799006|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?utf-8?B?RmNOZFp2cmhkb3dUeE9IcW9wT0NuSlJDU000MXNwOXg1U3FpbnZNUFh5aG01?=
 =?utf-8?B?YldOc1lkc205anRwMXZnVXJNMFpaZjg4aG5KVDB1a3Z4SlBsWGRIR1NweTRN?=
 =?utf-8?B?QkQxYi84ZFU4VEVQbGNrRFJNMllyRGhPSW85WWxKSWtDZzlMNGxJN3FlYTRp?=
 =?utf-8?B?NEVDa1dUQitocXZ2dnRGa3N2dDg4UDN2ZEh6NmgwWWRPVStBeVRNQUNOTkZJ?=
 =?utf-8?B?eHF3b3F3NXRhaHNzWWdlRU9EVkJrdzFBUVpqaklxejlOdkI1RkpNaDFxeWFt?=
 =?utf-8?B?MkFJU0NscEZ3SEI0WTdlek93YWI1WDFyV0JKKy9lTmlMOHZMNDNTNkNqNzJF?=
 =?utf-8?B?ZmJDNWI5bFhaRnFLQnZxS1FDckdoclhYMjJVQXRzREhuaTRBZGVmaTdNN1lU?=
 =?utf-8?B?TGxHZnF6R2FCVEpuSTU2TzJtbmYxNHhpWmpJSWhUZkcvT2xQbjh5azRzZTBy?=
 =?utf-8?B?T0g1ZmgrcU94ZWRpVVpxaVlqN2ZDVjFKc2Q5MUNCdGxzYUhNcGxiNDF3S0p3?=
 =?utf-8?B?VlFHQllBL3JqaFJyYjhZekV4R0dRRUxKSXJJd3pEcHFWVzZvN3lnK2x4eVlW?=
 =?utf-8?B?bEdTL09oOHQ1MzBBMWViaHVReUdpb2t0SnVPRkk3N3RPZm81MmJzL2UxSlpv?=
 =?utf-8?B?Vm5VbnVZM2l5QXZaZG92Sk9JdGhOT1FaekFheDlIdFBWdXhtaDQ4TklldmhG?=
 =?utf-8?B?SFZiK25acWp0OE9rMWVKNFdPbkNsTFQ5WFlmME1DSlNvOTNnY2tFV3hsa1lv?=
 =?utf-8?B?TUtOU1FNTlBIVWN5TlgvbGdGMDh2MXduQTFBTGxJNDdFNWNYVTI4MzZPcnN4?=
 =?utf-8?B?dkNoNExZbmEyRXRWY2FUWHJxeVd3ODY0S3AzRDlnYU5tR2paa09SdEVBMmRG?=
 =?utf-8?B?aUVYMEZaUGc1ZFVyKzdmRS9sVExNSlZ2S0hnbFZ4Q2VrdzJtMDMvN0M5b3ZB?=
 =?utf-8?B?czRMRGpkaUFMOXVqNjdLSHgySFk1T1RyT1hoRDRIN2s0NkM1ZXpEVVIyczFv?=
 =?utf-8?B?L1JmWjh0THh5dkNFdjRVSmk4UGVNaEJTMEkxU3lpSDhoNVBQWEozdm5yZEFk?=
 =?utf-8?B?M1NUZEpjN0NldWFCSENMTzl3dXdWMDFISGZ5aFZsWjN2SHI4dGxVTU9hdGI4?=
 =?utf-8?B?RzJRc2owc1QyRXdpQmtHTWJwTU9KeWNYWk9VbmQ0QmJuMm85a2N6bFhQVDla?=
 =?utf-8?B?NEVIZ2FZczVPRHNYaFVVMXROUU9VSHFJdkRxT1dzcGVReUZhUWdyZ2VaeDVO?=
 =?utf-8?B?dFJqT0NOT2xIYTRwbGdEbGJ3YWx6L2thS285UTJDVkVZVzBLRW9Ec2lvY2tx?=
 =?utf-8?B?YmxSeFRLMW1IZXZKQ2EzS1l3TG5OYzFWQ1JMN0FxT2QwclFoUUlQYWNjZ3M3?=
 =?utf-8?B?SlA5UlBXTVZ6N3BHL3BUZHN3UCtCU3Q5ZXg4eVhicWltVUV6eWNidDJQRkV3?=
 =?utf-8?B?MXhlS1NCVWxIZTJUenJBZlFvNUJiTjBmb1ZnRS9SR1JrU204SmcxN1pnaE5w?=
 =?utf-8?Q?QLutn0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QklxK2NOVTcxdEpaL1o0bU1rNk9BekUzSWt5VHdBN3RlNFhNL0FKTWc0OENH?=
 =?utf-8?B?M3dvQUdpNThiWUh5b0pEc1ExWFAxeEZteGpzSm5VY2ZLcGs4bDVWajY3VTM1?=
 =?utf-8?B?dlB5ZmhRMFp4bnMxbU4yemZPN05XRlRpNjl1cSsxdlJCWTdtWjJHYkZsU2h6?=
 =?utf-8?B?RFRWb0c1dXRIa1M0M0p5eXluRnZ0MzF3ZTV4N3RpVW1VVXZtSUFPMkcweU1H?=
 =?utf-8?B?cXZZQUZqTkFxUlFaUEZlbFNmOExPZ3lxUDgwNnZoUUhxRzl1TlFiS2QwNlBL?=
 =?utf-8?B?SDlnL09Cd1VmcEYzL1E2VWZRUG5uSnlmOG4rUEpBVkpHdWtGVUQ0dFpUTDBB?=
 =?utf-8?B?SXdXQmNpeGFTVFhaOU1jQXZPc0hqZ3VwUzE1T2xQWSt1RUh6OEk0V05qS1BU?=
 =?utf-8?B?T3ZDcVE5VlBGQm9tNDNkWXJReTY5SUhnMFhKOVdoUnZBWC9iVzJ2S2Zva1h1?=
 =?utf-8?B?K0JMY2lPekJQd1RZRTAvbUowem5tZUxHaDROSFQ2YUZMSWRSVmNtdVZ3RmJY?=
 =?utf-8?B?VjdRRktkNERnek1ZQjJzQmw2bWF6TDZoMzZMT3lLN0lXYUNWdDVMeDI5QVQy?=
 =?utf-8?B?KzY3b2QvK2lXZzRuSmlad2xIaVNtc3k1blFKUDFRYlhGMmNjSFA4enhPVzJS?=
 =?utf-8?B?ZU1jbDRROXM4aWhhVW16MjQxN1hIbFQ2dWUycVhaL1M4Z2pJc2RYMU8zUnVi?=
 =?utf-8?B?dVdCcFJTKzcvbW94ZWZhbkk1QUdMYnYvb1ZIS1QyV3hCemlpOUdVR0RvVG5D?=
 =?utf-8?B?alM0QVdaLzdNZUVscld5TXFHbVRHOStqdDBteTVoMnhMcUw2V0thdDZFdWt4?=
 =?utf-8?B?YWFYazdtWEVrT2VFd3dqZ0V1eVMrWHJDSnZ6UDBmdytkWVpEUzNTUks5TklC?=
 =?utf-8?B?aG5TOFFTbmxoNlNoYXJCZWtnbm4xMjRheG1JMkIxQ0JnUTB1VjBtYW05V0ZS?=
 =?utf-8?B?RzFBUTZ4N1BxbkczMFhkL3VvZXlkUWpUNDlVWTJtS3cwaUljdTNQaTJjTHFN?=
 =?utf-8?B?U2wweWV3TjZGcDlPajZ0ZnVQWDhiVjIvSWpCakkrcFUralV6eEtLUWFCTTQx?=
 =?utf-8?B?a0o1QUJnYis3K3RsWFF3OVRZL3docE1qMThUa0tmVkFJOUFjRjJZOXJGQzBE?=
 =?utf-8?B?MSt4T3lNcnJZYXFiaFlmRnRDNGJuRmlKdStEclQ2M29RcnVRMi9RZTRjNXVL?=
 =?utf-8?B?emw2V2dBM0VNVjY3bTd5WldicmF3NVJEQ00vaFR1NGFDa3pjTGlqK2NOMHRk?=
 =?utf-8?B?VkZBQTMyc2dtTXZ2SVhUNnMrWHUyVUs1a2MrSTJ1dyt2N3ZwOTN0ZjltU215?=
 =?utf-8?B?NDJadlhzeXd0TFQ4RGxwODg1WUlKSzZncFRGeHA4dno5VnVZWTBxQTRicDRJ?=
 =?utf-8?B?c1c1aDlsZHRNQXlMNVBLR1NnYTZyN3lJS0RjT29YSGJzdm9HVlAxUmtNUGtQ?=
 =?utf-8?B?YVJwUDI3WUVJYmZEYWovUEJQNmo0NTVTVVJ6M3kxSDZUOTFQbGpJK0lvQ0No?=
 =?utf-8?B?c0ZISjVka1cvbGV4Q1NJR1pZOVNGTktrNGNQQnl2eVRaVHcrcDhHQWxWaWQ2?=
 =?utf-8?B?OG5KWTVkbGJTOWhYU1lGNFNSYVZnUktBbERVMzBYMTY1d2hFMC9hSFYzUEhs?=
 =?utf-8?B?V1lJeDVkakNSVFpZUHI2bSswQmg4Sm1Cdkl4a1FCUDZFRnAyUEQ5aWJ6WjFw?=
 =?utf-8?B?aFpYN1MzOTR4aUhaNERjQVpkZHJLYk15Lys0OThZU0hzQ2ovdE1jYzRkdEJN?=
 =?utf-8?Q?YBTOOUVS+NZ2Ybm4/8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5072ea07-5687-4711-9728-08dd5b27a9c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 14:20:06.6354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4363
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

DQoNCj4gT24gNCBNYXIgMjAyNSwgYXQgNjo0OeKAr1BNLCBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
aGFuQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4g77u/V2hlbiBidWlsZGluZyBmb3IgYSAzMi1i
aXQgcGxhdGZvcm0sIHRoZXJlIGFyZSBzb21lIHdhcm5pbmdzIChvciBlcnJvcnMNCj4gd2l0aCBD
T05GSUdfV0VSUk9SPXkpIGR1ZSB0byBhbiBpbmNvcnJlY3Qgc3BlY2lmaWVyIGZvciAnc2l6ZV90
Jw0KPiB2YXJpYWJsZXMsIHdoaWNoIGlzIHR5cGVkZWYnZCBhcyAndW5zaWduZWQgaW50JyBmb3Ig
dGhlc2UgYXJjaGl0ZWN0dXJlczoNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vdGlueS9hcHBsZXRi
ZHJtLmM6MTcxOjE3OiBlcnJvcjogZm9ybWF0IHNwZWNpZmllcyB0eXBlICd1bnNpZ25lZCBsb25n
JyBidXQgdGhlIGFyZ3VtZW50IGhhcyB0eXBlICdzaXplX3QnIChha2EgJ3Vuc2lnbmVkIGludCcp
IFstV2Vycm9yLC1XZm9ybWF0XQ0KPiAgICAxNzAgfCAgICAgICAgICAgICAgICAgZHJtX2Vycihk
cm0sICJBY3R1YWwgc2l6ZSAoJWQpIGRvZXNuJ3QgbWF0Y2ggZXhwZWN0ZWQgc2l6ZSAoJWx1KVxu
IiwNCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fg0KPiAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgJXp1DQo+ICAgIDE3MSB8ICAgICAgICAgICAgICAgICAgICAgICAgIGFjdHVh
bF9zaXplLCBzaXplKTsNCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn4NCj4gIC4uLg0KPiAgZHJpdmVycy9ncHUvZHJtL3RpbnkvYXBwbGV0YmRybS5j
OjIxMjoxNzogZXJyb3I6IGZvcm1hdCBzcGVjaWZpZXMgdHlwZSAndW5zaWduZWQgbG9uZycgYnV0
IHRoZSBhcmd1bWVudCBoYXMgdHlwZSAnc2l6ZV90JyAoYWthICd1bnNpZ25lZCBpbnQnKSBbLVdl
cnJvciwtV2Zvcm1hdF0NCj4gICAgMjExIHwgICAgICAgICAgICAgICAgIGRybV9lcnIoZHJtLCAi
QWN0dWFsIHNpemUgKCVkKSBkb2Vzbid0IG1hdGNoIGV4cGVjdGVkIHNpemUgKCVsdSlcbiIsDQo+
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn4NCj4gICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICV6dQ0KPiAgICAyMTIgfCAgICAgICAgICAgICAgICAgICAgICAgICBhY3R1YWxfc2l6
ZSwgc2l6ZSk7DQo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+DQo+IA0KPiBVc2UgJyV6dScgYXMgc3VnZ2VzdGVkLCBjbGVhcmluZyB1cCB0aGUgd2Fy
bmluZ3MuDQo+IA0KPiBGaXhlczogMDY3MGMyZjU2ZTQ1ICgiZHJtL3Rpbnk6IGFkZCBkcml2ZXIg
Zm9yIEFwcGxlIFRvdWNoIEJhcnMgaW4geDg2IE1hY3MiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBOYXRo
YW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiBkcml2ZXJzL2dwdS9k
cm0vdGlueS9hcHBsZXRiZHJtLmMgfCA0ICsrLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KVGhpcyB3ZW50IGludG8gbXkgc3BhbSBmb3Igc29t
ZSByZWFzb24sIGJ1dCBsb29rcyBsaWtlIEphbmkgYWxyZWFkeSBpbmZvcm1lZCB5b3UgYWJvdXQg
bXkgQWNrIDop
