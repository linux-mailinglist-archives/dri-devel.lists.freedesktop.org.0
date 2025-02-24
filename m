Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8CCA4260E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6198810E31F;
	Mon, 24 Feb 2025 15:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="dNv3qRfo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011033.outbound.protection.outlook.com
 [52.103.67.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D7E10E31F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cq8RWa5llF3ByEvdLR7yTlCpr40C7lXTXmiVcHLCxZj5NWOOz4cFSivDtC8VoE4phX+89a6XE8raviShZvpoSTaUnwf7O54EocOPfdKDJ9zC/d3pisq1SszppcBFY+iomhB7V8N8KNHsH4LjvLCajUzfMieyV6TW5ZEYxg3MduRGV6MpRfXG31eeqs4+XNKP7j+h/xNRzGeQ06DuSThieTiU85rMKUoN07CGM9Gaznn4rdC/Lv1IDh4+Mya/GfEkMb+zMsDkB8MEHqyY9lRZthj5yGyFhSsc7nUqLXC1CIithlr9IWx8B9u3paCXbx7v2oUYrpMbUqujJr2FYU8UGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTjXlZe6W6nhwKXeYQkQPucV/k8cEDvopM/Qs4WGJuA=;
 b=uYjywp3Tgw22JfIHXjGERylmkUwQ2ZUBurc7aG/tHT6sdNvZmbgh+l+5VB8h1I91xvSItGMLNlCfn2GCwsXdCMeShf8z65hZW+MjvXZxSRBiM0ALvHQpsDKBCu5xo2IYadIq+d1zXYYE3EDpao1AQRUvcT05aL9WYaaPBSu/kunHYAS+5f0Z03rGi3n0vXtnEFEmpJQFV4NNPk948nrxvLpnJyPoyhm05uy+7O98+lPeYEL3u8Fxdfi9bHGpZEEAN3WNUhvOUFt4O1WiZ1LaNa+elFABGVijgupoEn3n5LDxeu4MOPFBsFSjw2wVq20pcxX8Zsi8vhWcRfN2BRz1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTjXlZe6W6nhwKXeYQkQPucV/k8cEDvopM/Qs4WGJuA=;
 b=dNv3qRfo50D9vYk7IEjJ8Mri9OG3l1pK/y26CeoXTTWEOZzTGpXVBhoGOeA0hR75Zx8AteKS/qOdehvHwPA82017s5PjeBvOr4HIq0dIuN89To5ZFnT8C0K3Kn3tTkISDcMvE3QwyNIoF+sv2il9xsmQZIidSepat/WolNfwEWrFBEURorKjZ61A0+fLajCoZ9xEguUAxm+mFgYsxBK823jz2V8o/8iS7rdbRhEG8NEFO9lU6bPjstjesLdzkQbmwTy34+6W9xccZzrqal36zVHgzNLa0B9FYBnEa1OfOKUCLy34gDj2OtXukCs/4CHUTopTp57cIM8zjt9WxthKQg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9958.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 15:20:13 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:20:13 +0000
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
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWe38AgAAI1YCAAAcMAIAAAaKAgAACOwCAAAJQAA==
Date: Mon, 24 Feb 2025 15:20:13 +0000
Message-ID: <PN3PR01MB9597D4FD9FD8B8A8FB0F2B3CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
In-Reply-To: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9958:EE_
x-ms-office365-filtering-correlation-id: 5108f02a-5cda-4558-80b7-08dd54e6bc17
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|19110799003|8060799006|15080799006|6072599003|461199028|7092599003|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?QmY0WFE2S1E3dHpDV0NVdDQ5b1lIdGJEMHFYM01HcVU2YVl2Qyt3RXlrV1Fr?=
 =?utf-8?B?U1RzQVhLZW5qR285ZVE2MHE1SEtvZ3FSRUxDYjg3c1NwTlZNVGh3VldDU3ZK?=
 =?utf-8?B?Vk1ETHdvdGFReFBlY2lDdEhjSzAyQVNoSGE2Q2xpbWpLbHJ2bFJQdnNRSXdX?=
 =?utf-8?B?MTJWb1h4azJwd05vVzRuQkw3WjhOUWxuU3JiY0hwVERqNTUzSXQ4dXJWWVl3?=
 =?utf-8?B?aEhqVDl4OGNOQUVJSXZsd2NpeUp3QmsrNjloWnZROGVZVXl1R2k2dlkzVXQ3?=
 =?utf-8?B?dmFWY1JRTkVtdUd1SHk0c0RTczQwbWNEWEgvcmZPdjNnNGhEYzVsK3ZpY2Fj?=
 =?utf-8?B?MFZHQ2tIQmo5bnJzY2F5b2I2bHpxazA2aVcycGxNYWVWbkNzZkw2ZWpYdWlN?=
 =?utf-8?B?WW96R2lBMmFGVE51SnZvampMRHRVSEtqWXl4dWplWEhiWkN2SldBT1ZmRmdP?=
 =?utf-8?B?ampvQ3hXREh6SHM3azZuNytpbTNJZGpHd2xqbk90M0IyblUzWWZZOHk5QUs3?=
 =?utf-8?B?Qk5TRDY2YkNNQzZJRk82VW5OTEpYNlRYMWZnTjZXK1NaRFdiemxjbjhTMkh0?=
 =?utf-8?B?YWdGS2FTVWFxaFFlY0RyaDBSVHV5VGNYRjJNc05TckZlMmhadzhYOE1YZUto?=
 =?utf-8?B?b21iWk5JQktjNVFEQzhsQnJ4TVdOTTI0MXRCSmxxYmxEZms3cXI4c1hvMzFh?=
 =?utf-8?B?TW96cjJhVXRyT0pmZjdVbHI1R2RSWHd0dmtlZkhhTmFxL29ORG1oeHZxc1dI?=
 =?utf-8?B?bjRpbFRMcHVUZWlXcFcwcGxQenBBVy9BY1lTcFlFQWFxUVVJcUMwcUV1QWts?=
 =?utf-8?B?RkFkUlBhUEd1SzRPZTduS0piWXhldGRGVmxzNktITlRrTkh6aW81d2FJUVgx?=
 =?utf-8?B?aEZXNklpN3hhY2t2RGF4WjBEUkpBMHR4eVZJRzZXcGx5aS9TVkJqVnV0K0Fn?=
 =?utf-8?B?KzRSOUpnOHlKdjh6OWdlWmVhc1h1SzFWeTY2SS9CQ0FyUW51NTRBRFhsR1N3?=
 =?utf-8?B?QVYvU0paNks2SjliM0N1U2pnRlVUOHRSOFIrQ3NpMFk5MEp1c1o3WVZUakFJ?=
 =?utf-8?B?RUZmWVV6aHplTjd6ckxTMHN0MHlCcGk4NnBPN3RMSWlWcUVUUjdwN0tSVDVz?=
 =?utf-8?B?Y1hsbFk5Vm1VekJQcVRLMHQyd3BDb0RzeU1aSk1jRnhHWmtOQTBIVHZHNkc1?=
 =?utf-8?B?bG4wOTV6TjhaeVZpZTNsUXZybDhrUTZuMWx2d1ozRTRQK2JCa093M2xNdGVH?=
 =?utf-8?B?ZE1QVUg1L3FOUHBaSklLb1JyOEM0VFpXOFRFS1VVRktGdHVLdThFQktHWXBl?=
 =?utf-8?B?RmFZbmdzWXhqV05UdEhYdkM4b044QVBtMmg5Ymx3cHVJNDN0d0pWTnc5OEtN?=
 =?utf-8?B?SzVhQVliZ0kweUlDSi9QdFBsb3dUUzIrWGtSMXhjMFN2aXc4elpxSFhPYU1v?=
 =?utf-8?B?T0NCN2pEbkNkYXhiVmNMalFQWTM1OFRMeDl6SHZybHNrcFE1c2NkWXE0UVJn?=
 =?utf-8?Q?k0199WrDSWCIT1TOzisk7yr3oNK?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3lpSkpYVFI0dFlsNGxvUWJEVk5KdzFmOC9NRGd1bldyZkV3WEluMVVBdE1X?=
 =?utf-8?B?c0FlSjE1OG9QL081SlNrWUo2cGRwOUxGUEh2ZGRCb1NGN1h3WVRCdzNXbGYr?=
 =?utf-8?B?VC9FOC9HRkRmQldveGFYMCsvalNuZStTamdMN0dSTTh2WFZRbnl6TVdmYi9s?=
 =?utf-8?B?TVJkWUFnR0Y3NDZkWlpCQ0tGRlBteDlIc3BkZ2FWdTNjR09UZzhCOW1pMndr?=
 =?utf-8?B?aW1rZGNmYUdWaXhLU2cxdUhFazZBbGRydzV1Si95aFVRUlczbUZNZUdtZy9G?=
 =?utf-8?B?RlplSklBWHJwYlREc2dXRWJMY1dZenRVUm42aEtlcEx6M2FsK2Jla2x1WDYw?=
 =?utf-8?B?dkJIWHFSbmM4Q3hCWWxFWWtVYzJHeU1PUG9GYjFrd0RRN1hteUppM0dpYUFC?=
 =?utf-8?B?V0diOHVqUDRZSjlVWXlINGZJeDFlNHk1WDRJbUJXbFJqNEdUcnYycUJEd3NY?=
 =?utf-8?B?clF6K2dRMEhKOTM5NTN5T28waGJvTGY4SVNiTElWWHpDQzNvWEhWVm82ZGRx?=
 =?utf-8?B?Wk5OdUhaUEVYVFdqODl0Uk1uS2xjTWxUMUJBMFIzdWFnbkFWVjRMVGE1SlZa?=
 =?utf-8?B?Z0dIUXFWTUJIaWdGMlJJZXdtQWY5MXVTYnhrUG9LOU8xT0xJMHJFa3NnNWdv?=
 =?utf-8?B?b2FiYVRqeGpNTk9kcTg0MXl3anNuZUc3SnlSNUxHTDM5YlAyL3JJaVVpeGJC?=
 =?utf-8?B?WC9PeXZXemRjU0JFUzFCaVV5TWtKZ3hhQnFvUjVTekE1ZjltbXR3UFRPZ3Y4?=
 =?utf-8?B?TXc4bXBlNW5DWDI2VkFqWkJVc0RtNzBLK0toa0h5MUJyVXNVVFNzandRbVRw?=
 =?utf-8?B?NVVyZnVwcWwvRGRiQnlJVjFNV0N2eE1tVnhyU2g3cVIvcTJSM1JtVjFUdUVP?=
 =?utf-8?B?YjlVU3lvK0hWb2Q4M3VKWE0vZzFhOG9FZlZBTE0yZGIveE0vSDl1WnZiNFRX?=
 =?utf-8?B?MjllV0RQaFBGVDBmdWZVU25NeWFBVzNVTjI1WG9IQk1ET09qTlQ1TVF5SmJM?=
 =?utf-8?B?dXFpcHRtekhNYTRzODdXUm00MnhFMmhSNVR3d3FGUDQ5TEI5ckUzTGNEajNU?=
 =?utf-8?B?U2FDR1pDaFE3SlhOcVh2WHEvWWdqbWtuOHd1dkZuSmJ1cDR6cXlMNnhFL1E5?=
 =?utf-8?B?UGM4R0Ywa2F5aUNsRldKNng5WUswOVBjL29yMnhPV0NQU2RrU0xMeWUvclV6?=
 =?utf-8?B?YzMxK0lEYUIzbHZmOWJ3UVFpRjJ4ZkN4aklscE1zS2txaWJ1em1pMXJJSWhu?=
 =?utf-8?B?a2drUEVId2YrZWdjdkVXQ252Q1BFWnQrUTBrLzJlakpveVJYV2htakhWRU9j?=
 =?utf-8?B?WlJNOCt2MVNSOENYeWVnaVdRdjlOREw0MVRXeUlWUFVBRCtCWFgwM0xkN1ZQ?=
 =?utf-8?B?Y1dUdWJpNFpodDJheHFsS1NmUmRscmRBRnhFUEpmRmtWeC9OZ3Y3V2MvQldm?=
 =?utf-8?B?T0djWWFJSm9EbVhGbU9mWXNLLzE5V0ZZcFlCb0x6eDVZZmdocU1iL1pJUzN5?=
 =?utf-8?B?MklDRXBUVUhwWFljWklZdzI3a2xYc3lHZ1NZRWt2VitoR0VmQXVkQjR4ZHl0?=
 =?utf-8?B?b09MVWpzZE9YZG1VNUJyU0lKVnR4UzNlcERMcjIyRDh3aGZDRDJ1aFMwYjMz?=
 =?utf-8?B?VUgxTlMvNVVMMmEyRFJ2VjAyYXRSak5QMEhiYlp5YmpYb2hxRmhaU3dhckxi?=
 =?utf-8?B?elpEazcyd3RMaDBQcDNJc1Y4bDNDVkxUc2ZMZWo0cXhGRWNZZ1M3K3pTVU41?=
 =?utf-8?Q?OJyEhCi1WgMC5D85aw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <936005ACD6A19A4592916C2978736318@sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5108f02a-5cda-4558-80b7-08dd54e6bc17
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 15:20:13.1204 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9958
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDg6NDHigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDM6
MDM6NDBQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IE9uIDI0IEZlYiAyMDI1LCBh
dCA4OjI34oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+
PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwMjozMjozN1BNICswMDAwLCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4+Pj4+IE9uIDI0IEZlYiAyMDI1LCBhdCA3OjMw4oCvUE0sIGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+Pj4+IE9uIE1vbiwgRmViIDI0LCAyMDI1IGF0
IDAxOjQwOjIwUE0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPiANCj4gLi4uDQo+IA0KPj4+
Pj4+ICsjZGVmaW5lIF9fQVBQTEVUQkRSTV9NU0dfU1RSNChzdHI0KSAoKF9fbGUzMiBfX2ZvcmNl
KSgoc3RyNFswXSA8PCAyNCkgfCAoc3RyNFsxXSA8PCAxNikgfCAoc3RyNFsyXSA8PCA4KSB8IHN0
cjRbM10pKQ0KPj4+Pj4gDQo+Pj4+PiBBcyBjb21tZW50ZWQgcHJldmlvdXNseSB0aGlzIGlzIHF1
aXRlIHN0cmFuZ2Ugd2hhdCdzIGdvaW5nIG9uIHdpdGggZW5kaWFuZXNzIGluDQo+Pj4+PiB0aGlz
IGRyaXZlci4gRXNwZWNpYWxseSB0aGUgYWJvdmUgd2VpcmRuZXNzIHdoZW4gZ2V0X3VuYWxpZ25l
ZF9iZTMyKCkgaXMgYmVpbmcNCj4+Pj4+IG9wZW4gY29kZWQgYW5kIGZvcmNlLWNhc3QgdG8gX19s
ZTMyLg0KPj4+PiANCj4+Pj4gSSB3b3VsZCBhc3N1bWUgaXQgd2FzIGFsc28gbWltaWNrZWQgZnJv
bSB0aGUgV2luZG93cyBkcml2ZXIsIHRob3VnaCBJIGhhdmVuJ3QNCj4+Pj4gcmVhbGx5IHRyaWVk
IGV4cGxvcmluZyB0aGlzIHRoZXJlLg0KPj4+PiANCj4+Pj4gSeKAmWQgcmF0aGVyIGJlIGhhcHB5
IGlmIHlvdSBnaXZlIG1lIGNvZGUgY2hhbmdlIHN1Z2dlc3Rpb25zIGFuZCBsZXQgbWUgcmV2aWV3
DQo+Pj4+IGFuZCB0ZXN0IHRoZW0NCj4+PiANCj4+PiBGb3IgdGhlIHN0YXJ0ZXIgSSB3b3VsZCBk
byB0aGUgZm9sbG93aW5nIGZvciBhbGwgcmVsYXRlZCBjb25zdGFudHMgYW5kDQo+Pj4gZHJvcCB0
aGF0IHdlaXJkIGFuZCB1Z2x5IG1hY3JvcyBhdCB0aGUgdG9wIChpdCBhbHNvIGhhcyBhbiBpc3N1
ZSB3aXRoDQo+Pj4gdGhlIHN0cjQgbGVuZ3RoIGFzIGl0IGlzIDUgYnl0ZXMgbG9uZywgbm90IDQs
IGJ0dyk6DQo+Pj4gDQo+Pj4gI2RlZmluZSBBUFBMRVRCRFJNX01TR19DTEVBUl9ESVNQTEFZIGNw
dV90b19sZTMyKDB4NDM0YzUyNDQpIC8qIENMUkQgKi8NCj4+IA0KPj4gTGVtbWUgdGVzdCB0aGlz
Lg0KPiANCj4gSnVzdCBpbiBjYXNlIGl0IHdvbid0IHdvcmssIHJldmVyc2UgYnl0ZXMgaW4gdGhl
IGludGVnZXIuIEJlY2F1c2UgSSB3YXMgbG9zdCBpbg0KPiB0aGlzIGNvbnZlcnNpb24uDQoNCkl0
IHdvcmtzLiBXaGF0IEkgdW5kZXJzdGFuZCBpcyB0aGF0IHlvdSB1c2VkIHRoZSBtYWNybyB0byBn
ZXQgdGhlIGZpbmFsIGhleCBhbmQgY29udmVydGVkIGl0IGludG8gbGl0dGxlIGVuZGlhbiwgd2hp
Y2ggb24gdGhlIHg4NiBtYWNzIHdvdWxkIHRlY2huaWNhbGx5IHJlbWFpbiB0aGUgc2FtZS4NCj4g
DQo+Pj4gKGFzc3VtaW5nIHdlIHN0aWNrIHdpdGggX19sZVhYIGZvciBub3cpLiBUaGlzIHdpbGwg
YmUgbXVjaCBsZXNzIGNvbmZ1c2luZy4NCj4gDQo+IC4uLg0KPiANCj4+Pj4gQWxyaWdodC4gRm9y
IHNvbWUgcmVhc29uIChhIG1pc3Rha2Ugb24gbXkgcGFydCksIHNvbWUgZGV2X2Vycl9wcm9iZSB3
ZXJlIGFsc28NCj4+Pj4gc3RpbGwgbGVmdCBpbiB0aGlzIHZlcnNpb24uDQo+Pj4gDQo+Pj4gQnV0
IHRob3NlIGFyZSBzZWVtcyB0byBtZSBpbiB0aGUgY29ycmVjdCBsb2NhdGlvbnMsIG5vPyBIb3cg
ZG8gd2UgZXZlbiBrbm93DQo+Pj4gdGhlIERSTSBkZXZpY2UgYmVmb3JlIGl0cyBjcmVhdGlvbj8g
U28sIGRldl9lcnJfcHJvYmUoKSBjYWxscyBpbiAtPnByb2JlKCkNCj4+PiBzZWVtIGxvZ2ljYWwg
dG8gbWUuIFNvbWVib2R5IGZyb20gRFJNIHNob3VsZCBjbGFyaWZ5IHRoaXMuDQo+PiANCj4+IFRo
b21hcyBhc2tlZCBtZSB0byBkbyB0aGlzIGNoYW5nZS4gTWF5YmUgeW91IGRpZG7igJl0IHNlZSBo
aXMgcmVwbHkuDQo+IA0KPiBJIHNhdywgbWF5YmUgSSB0b29rIGl0IHdyb25nLCBidXQgSSByZWFs
bHkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgb24gZWFydGgNCj4gZHJtX2VycigpICBvciB3aGF0ZXZl
ciBjYW4gYmUgdXNlZCBpbiByZWFsIC0+cHJvYmUoKSBvZiB0aGUgcGh5c2ljYWwgZGV2aWNlLg0K
PiANCj4gSW1hZ2luZSB0aGUgaHlwb3RldGljYWwgY2FzZQ0KPiANCj4gcHJvYmUoc3RyaWN0IGRl
dmljZSAqZGV2KQ0KPiB7DQo+ICAgIG15ZHJtOw0KPiAgICBmb287DQo+ICAgIC4uLg0KPiAgICBm
b28gPSBkZXZtX2dwaW9kX2dldChkZXYsIC4uLik7DQo+ICAgIGlmIChJU19FUlIoZm9vKSkNCj4g
ICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLi4uKTsgLy8gaG93PyENCj4gICAgLi4u
DQo+ICAgIG15ZHJtID0gLi4uRFJNIGFsbG9jLi4uOw0KPiAgICAuLi4NCj4gfQ0KPiANCj4gSSBk
b24ndCBldmVuIGJlbGlldmUgaXQgd2lsbCBiZSBwb3NzaWJsZSB0byBjcmVhdGUgZHJtX2Vycl9w
cm9iZSgpIGFzIGl0IG1vc3QNCj4gbGlrZWx5IHdpbGwgcmVxdWlyZSB0byBoYXZlIGFuIGFsbG9j
YXRpb24gdG8gYmUgYWx3YXlzIHRoZSBmaXJzdCBvcCAodGhhdCBtYXkNCj4gZmFpbCkgaW4gdGhl
IC0+cHJvYmUoKSB3aGljaCBtaWdodCBiZSBub3QgdGhlIGNhc2UgZm9yIHNvbWUgZGV2aWNlIGRy
aXZlcnMuDQo+IA0KPj4+Pj4+ICsgICovDQo+IA0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywN
Cj4gQW5keSBTaGV2Y2hlbmtvDQo+IA0KPiANCg==
