Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BBBA436DD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 09:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E722210E5A3;
	Tue, 25 Feb 2025 08:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="nEzLwcVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011032.outbound.protection.outlook.com
 [52.103.68.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C042C10E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 08:02:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W3OYkoM70PGTRHNGeE5DCw4KBafMij6cHheML/HXlMogDzeLy9qQKm4+hYlLMhTGbUZRHXMpce+7aQPIB5Eb3VtrCIuMpJaPfANFOeX82HS7m+fOM3u3qNWLr9HntUjaFZ97iGFUSSjVuruMasDit6HT3LokCjq7Vwt5xHgEcbbgyN+Ba6RHwJAW279K/nd5zPcg7Ioxj4nUNaneob+CzU7HXby/JKMot5rCWOEy9JBaCP1Xm/LEesi+DnPPOcfMgkC7rrHo//cKorOQZA4xLs9oClOsFeGfrMbIBMCIRIOD31ZA0qyhQGfA76k7q00wH4orq0UEz9CSKL5URKyIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHECoGkmo5Ejko+FXnGqaCT6wdEaHKSEbo+DqhTHn0E=;
 b=N81HOtBu8judXbqDugR4hWT7fiv4HHDA0/Ddtq2VA5buvpE8TrjgzCJeL7T4AnnwuqmILmCP3GzbcFIYMwLpig3YI3xGk3Dhn+L9quMJeTpv1+DPW4wBons60br+tTbhTlLpsX2FTvyRcm6SuRHG8A1pn/t7koNite9Y1A0ML1NQkdK8tr5YB5BYQR0XHEHLL7jPhwsJ1SKzzvJSqonkmtJKxcqnBnwZEgHYhfRDlLdGz4ASoli98i/qtIS3/SBUMYrEnKNxowttpIs1aQ43++Idznobh0Xt14CmjiOXhSZM9KUmExXTqN+kqa1oKHxP/mA5S4vCFwp3Xcl9PV7p3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHECoGkmo5Ejko+FXnGqaCT6wdEaHKSEbo+DqhTHn0E=;
 b=nEzLwcVrtN+wiebqsYZ+VmLb2n8BJXkQMEaR3oI4mra+3pfPDOjHcS/4wB2JS5BX3dJS+iPzv6Y2Oyk1aUpR8dgEXDj143iJq87T1o2Gz03a6XlaCyTrANNMX4e+4V23IWwatnKLbCgxD5UCC/GQ468HObLHToXfi2bslSUaUzIps1D+a/nIFGUthh016iuISYY4NbXc6iqhP8RtcpPiaFmwSyaKxdd10umPW5NGp3n+RZjDNzAeI9wS6YPxk2SmIuBVnLbabcjpZxeaOa4DgfbaJD4oIng/JzjxzldiVkUP2FPcOE/cwFpccUZTw7wZG5lz/3avxHLWxALItfimBg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB6823.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:94::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 08:02:37 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 08:02:37 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWrTuIgAD67QCAAAGYdA==
Date: Tue, 25 Feb 2025 08:02:37 +0000
Message-ID: <PN3PR01MB95977080AD62E0BD2518C106B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <PN3PR01MB95974D5EB5A25386A8BF6FDAB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ca34309a-f2b2-4082-92df-86a775952348@suse.de>
In-Reply-To: <ca34309a-f2b2-4082-92df-86a775952348@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB6823:EE_
x-ms-office365-filtering-correlation-id: 9e5c2547-2e7c-4f24-9650-08dd5572c4d2
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|6072599003|19110799003|8062599003|7092599003|15080799006|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?cTFYYzVkVmsrRUNDZy9FdnQ1Vit0Tk1Remk0WE9Cek9Zcks2ZlNPbk9tWXdL?=
 =?utf-8?B?NUFiOEl1MVhIS1Z5OXZYc1daeEVhQ1dnU3kvWml1cDZ5OGtNZWdSYUVBZmVV?=
 =?utf-8?B?MXA3bXBZa1hyY21xNUdqTHVRUjNyQUtDYVZsMDZxbGdUaHVBMmJLYXZ4TW8x?=
 =?utf-8?B?YmhyK0dGUXBiNi9WSnExVHp1RG5hbHU2Z0VhSkJNcUdFT0VCTDRiTzZnN1g1?=
 =?utf-8?B?OS8zRFVwWVlGc29SOHROUzBXdlB5S1RLYlV1aUVreFNtR0pWVk5TYThMZVRi?=
 =?utf-8?B?Q21HTitReEx3blVFWlBDTGhPdkNmSVVGdkdIaWdXeEdmNGFzalhJNi8rd0VK?=
 =?utf-8?B?MWNneC9rWmhCbWxzaG9Md2VLZHQwQ2ZLQk1WMXNlTXdLeElCUkVlV2EyT1dR?=
 =?utf-8?B?TDJGZGk2ZFQzTzBBK2dNcHR1VW4wNUNDbWFuYWFGMFBWZ3VGRTFVSEFkbUdX?=
 =?utf-8?B?ZUFBd0NKdUtkMzVmbUd2ZytJRS9qUFczeCtjcEpCVjFzcHBHR2hJaUNuUlp6?=
 =?utf-8?B?ay9zM0o3RjUvODlwVmRHK1NPV0xHUmhQbHdvbDdzR0ZMMzV5WjVMMi9uSWh1?=
 =?utf-8?B?OWZlVHJramxoQlR0Kys0MmlEM3NDU083S09DT1NtWEpURWlOR0JUYmQ1b0tz?=
 =?utf-8?B?QWVqU25tYWEzclEyYU9qT2tsMmNHenJkYkN0NmZWZFBHZm9zY3BPa0Y5bE1G?=
 =?utf-8?B?dlJtNkFaRHNSZGMyWkp5VmkxRUVMZ21sbUFEZ3JZMG5VdE04bkdlMVFIZ2p6?=
 =?utf-8?B?NDlpbkRNZlVTRkw1aDI0NkFsMlkveFRST2Vld1g1VXVpU1FRVzQ1NTdMQmw0?=
 =?utf-8?B?VWhHNFc4NmJ5UFVERmJHQ3poM2dwaWg2Uml3MXlEK25ITDlNUUFndlRhb3pQ?=
 =?utf-8?B?Mjg1SDNlK2xrRWFKQzJjajZJZ2VuWnJnZkdYRDR5RkQ1M083RHBUOHp5UlU2?=
 =?utf-8?B?cFp1b3pnMSsyZVBtSlJFSUg0amorcUJ1Q2RJeDEvejZhTm5UOG9xdHEwNXpY?=
 =?utf-8?B?WXg1VnYrT2luMWJPYUh3NElaTEg0a3dic1pLcUl3MFZBSmZXb0hmR2NHNzEz?=
 =?utf-8?B?cGZWK25BV3RoSjVyY3F5VnV5bmNzQUNyNXEvU2FiK3JMTzUrWG5NY1MwWHlh?=
 =?utf-8?B?ZmNLN0FLVnkxOUd6dU16R21VOFNkZUJ3OU9GN3k3Z1hvdUt0dGt6ZEtyeU5z?=
 =?utf-8?B?M3ZiYjBWUVhLb25NV2FWQWt3OWRNR2tGa0h6VzRNbDZpWURTbG1JVDNBMStT?=
 =?utf-8?B?cTZpYW1hTUQ3djA3RmNCL0JraHNwTjlENHJxb1ROUFZOVzU2NERmVWdzWHZ1?=
 =?utf-8?B?Z1JXYytrdVAwQm1HeW51bTEwUlR3OVJkU01oQ2pScm9hUnJPanVZS2dRaFRI?=
 =?utf-8?B?c1h1OFY1NUxmN2VjR0V0WVlDVmdraGhKYWhHbmIyMUIrQmpVQlF0RDZwSHpR?=
 =?utf-8?B?U2Voak5pRzVDWkcyVHJod2wvZ1c4Smx1ZFFDclV3S0ZEN1RhU1JjVzgwYzM0?=
 =?utf-8?Q?mvH2IQ=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mng5YnVmVFF0bGNReGN3WldWaHFiWk4vYlFyTkJLZlJ5VFBzNE5CNU5lZVR1?=
 =?utf-8?B?S29qcmpoQkl2QmU1Wnl3OFhJcjZ4MVV1a3RSVHVlMm9sZWZwVkpjU21KbGk4?=
 =?utf-8?B?SG9wanJuN2NZNzFkOG01dmhzMkZPdUJzemVzVFJvREhleWVvMVcyQzEreG9t?=
 =?utf-8?B?QXZmMEpISk4wWDd3UVR0aXZjd2N6UG9QQTBjTnRCQmFxLzFocmZVdmREZmZP?=
 =?utf-8?B?VVNNRHFBK0VaVENWUk5NMGRlNjFWaStKUnNqbTA3UTVIeTNmUHFVbkljU1dM?=
 =?utf-8?B?MHNtVVlNeU1nVUYvc2hDcks1SDRsVDFKcnFSWWJUNTFXcHZYUzNLMUFjb2tE?=
 =?utf-8?B?VXlxL0UzYnBNQk4vOWlzcVltOWJYSzJDb2NpNkdqU2svN2xTRUt3cko0enp6?=
 =?utf-8?B?WURyelk5ZHdpYXFnTTN6WU5nMFJkaWN1RGcwT0R4bXgrcGFOWjdZVHN2cnIy?=
 =?utf-8?B?bnhHUnIrb1dVdlRmck9ycjdsYW9WSHBBMmR6YndmMFpPbnlaVlNPd2ZDN29G?=
 =?utf-8?B?ZzJ4RVVheFM0WXpITk11MERTNElMOTFUYTFWcXBSVUk0cnF1YytWRXhYNE96?=
 =?utf-8?B?VTZ2Z2NZNW5SM3lYbXJ5QUpsaUNpZTdLYnkrVlduZzJSTnVkVFRSN2lsSGNJ?=
 =?utf-8?B?YTZxVGFnWjI1eFdUNmJlS2VyTDZYdjl2Ynlkamc5NFI2aC9QZG1aUVMvcFU3?=
 =?utf-8?B?U0JXTVV2V0ZxTnEzejhhL29JOWFsdVp2cTNuZEJxUW5sc0I5U2JGRFpmbU82?=
 =?utf-8?B?K2xwNmVGMmVqNFFZLy9vdlJabUFUd1VoRi9WZWNDNzJoUkYwQTJ5VXo2MHF6?=
 =?utf-8?B?Z3B2elhDZXpadFNlK3FqeXRUOUYxL2c0LzRZYVAwNGRHanNBNXI1b3VRdDJ5?=
 =?utf-8?B?SmFTMEIrTGw3YUttMDFpN1NnOERrVzJXWHYvdklxQVZkNURpM0x6NEpJTGNH?=
 =?utf-8?B?QlpGd21SVGZCTHNPUmo3U1QvNUp3a3R2WjVlQ2NWcW0vbUFZZ1AwZlVRWjR6?=
 =?utf-8?B?VmJFNXpsbE5FOGVQZmVvK2srVTRDVDl4WUx4U2tDejEyeXhJQUFxRXJKWUZ1?=
 =?utf-8?B?cVNObDluR1QwbjI0Q1ZpWlVKTmVFSjdERG83Q2I3NjZmRDIvWHhxS09paHp3?=
 =?utf-8?B?eXhiYXZRNWo1Y1VvUGlhSVhaLzNnZlIyTFVjeGRzVnczeCtOMktKbmI4Vk8x?=
 =?utf-8?B?WFhuZmlBMHN6ZTB1cU1ZMWJkU2pkblNndFRtSmZtY0hLNnhQTFJsMzBtQWtj?=
 =?utf-8?B?N0VjVVM0b0NZOVIydXVrcGFsaUYvOVBFNmM4MmJxVUFsaWpxZVhQOE5Xa1RN?=
 =?utf-8?B?R0w2MGNLMEJDQzNwWFpQdzVSM1lDQ056R05pNEZTclBjNStHdXFxdlBOT2Zt?=
 =?utf-8?B?NnRnWU1YeE1BbkZVZE9SaUljb2Mya2lMeUg3SG5pUjdOMFJaeTY3dHV2T3dZ?=
 =?utf-8?B?Ym9lM3hJdk85aWJPelBYbU1pMm9nc2Q2Z01MazRWNkM3ZDlMWWZwS3BkdWRD?=
 =?utf-8?B?SHVkL1d2SCtBSlVueW9MQjE0ak1sR3llamJlVGFPRUVkdUxMTmd6cEp1M3d2?=
 =?utf-8?B?VHFvekpCTnFLL05TeHZoUDg0cFBiZEFSbU80UHUrY1JPNjlLeEtVUUlyMXZR?=
 =?utf-8?Q?dukHMfeWdx2JHfL5rFMXFB5RjlSRtW2GqQb6xmY2V0yo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5c2547-2e7c-4f24-9650-08dd5572c4d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 08:02:37.2436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6823
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDE6MjfigK9QTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4g77u/SGkNCj4gDQo+IEFtIDI0LjAyLjI1
IHVtIDE3OjU4IHNjaHJpZWIgQWRpdHlhIEdhcmc6DQo+IFsuLi5dDQo+Pj4gDQo+Pj4gK2NvbmZp
ZyBEUk1fQVBQTEVUQkRSTQ0KPj4+ICsgICAgdHJpc3RhdGUgIkRSTSBzdXBwb3J0IGZvciBBcHBs
ZSBUb3VjaCBCYXJzIg0KPj4+ICsgICAgZGVwZW5kcyBvbiBEUk0gJiYgVVNCICYmIE1NVQ0KPj4+
ICsgICAgc2VsZWN0IERSTV9HRU1fU0hNRU1fSEVMUEVSDQo+Pj4gKyAgICBzZWxlY3QgRFJNX0tN
U19IRUxQRVINCj4+PiArICAgIHNlbGVjdCBISURfQVBQTEVUQl9CTA0KPj4gQnR3IEkgaGF2ZSBh
IGRvdWJ0IHJlZ2FyZGluZyB0aGlzIGRlcGVuZGVuY3kuIFdoaWxlIGhpZC1hcHBsZXRiLWJsIGhh
cyBtYWRlIGludG8gdGhlIGxpbnV4LW5leHQgdHJlZSwgaXQgaGFzIHN0aWxsIG5vdCBiZWVuIG1l
cmdlZCBpbnRvIExpbnVzJyB0cmVlLCBhbmQgbmVpdGhlciB0aGUgZHJtIHRyZWUgSSBhc3N1bWUu
IEl0IHBvdGVudGlhbGx5IGNvdWxkIGNhdXNlIGlzc3Vlcz8NCj4gDQo+IFllcy4gV2UgY2Fubm90
IG1lcmdlIHRoaXMgZHJpdmVyIHVudGlsIHdlIGhhdmUgdGhpcyBzeW1ib2wgaW4gb3VyIHRyZWUu
IEJ1dCB0aGF0IHdpbGwgaGFwcGVuIHNvb25lciBvciBsYXRlci4NCj4gDQo+IE1vcmUgcHJvYmxl
bWF0aWMgaXMgdGhhdCB5b3VyIGRyaXZlciBzZWxlY3RzIEhJRF9BUFBMRVRCX0JMLiBGcm9tIHdo
YXQgSSd2ZSBzZWVuLCB0aGlzIHN5bWJvbCBpcyB1c2VyIGNvbmZpZ3VyYWJsZSwgc28gdGhlIGRy
aXZlciBzaG91bGRuJ3Qgc2VsZWN0IGl0LiBZb3UgbmVlZCB0byB1c2UgJ2RlcGVuZHMgb24nIGlu
c3RlYWQgb2YgJ3NlbGVjdCcgaGVyZS4NCg0KSSBhc3N1bWUgd2UgbmVlZCB0aGUgc2FtZSBmb3Ig
SElEX01VTFRJVE9VQ0ggYXMgd2VsbCwgc2luY2UgaXQncyBuZWVkZWQgZm9yIHRoZSB0b3VjaCBm
ZWVkYmFjay4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+PiANCj4+PiArICAg
IHNlbGVjdCBISURfTVVMVElUT1VDSA0KPj4+ICsgICAgaGVscA0KPj4+ICsgICAgICBTYXkgWSBo
ZXJlIGlmIHlvdSB3YW50IHN1cHBvcnQgZm9yIHRoZSBkaXNwbGF5IG9mIFRvdWNoIEJhcnMgb24g
eDg2DQo+Pj4gKyAgICAgIE1hY0Jvb2sgUHJvcy4NCj4+PiArDQo+Pj4gKyAgICAgIFRvIGNvbXBp
bGUgdGhpcyBkcml2ZXIgYXMgYSBtb2R1bGUsIGNob29zZSBNIGhlcmU6IHRoZQ0KPj4+ICsgICAg
ICBtb2R1bGUgd2lsbCBiZSBjYWxsZWQgYXBwbGV0YmRybS4NCj4+PiArDQo+IA0KPiAtLQ0KPiAt
LQ0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+IFNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBGcmFua2Vuc3RyYXNzZSAxNDYs
IDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPiBHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMs
IEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQo+IEhSQiAzNjgwOSAoQUcgTnVlcm5i
ZXJnKQ0KPiANCg==
