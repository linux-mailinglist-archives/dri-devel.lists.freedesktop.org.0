Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10200C62CFE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 08:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E6310E199;
	Mon, 17 Nov 2025 07:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazolkn19013078.outbound.protection.outlook.com
 [52.103.74.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3910E199;
 Mon, 17 Nov 2025 07:55:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bW9E8xolSb+sXC1OZKerr5l895RIrGzcycNnaw1JtU1UZ/6orAtQoHb42qHGj7uFR6kdsV61w3oFZ4RdhsONUCh5aVX6DQD0jKUnAa8oJ3UeszuQ6ufSgBM9Q5nuxIEFm/+KXKx57O8prtvB0iH7PYo9r2lO0AXdKpRJuM/fm9Ptkk6x6WZl5/z1P8ys2ExshbwaOI40Ln1JanVCDZv/B6YPxblUbdRm8UgPYMg8yHuioPK5kZH7Dz45XTdi84i3CZD+CKuNwL4LIaBpqnCXmOWCv4QBOBML4hup2zXs18fm/2j8/zory2xMc6LkKhc1rzYbI0BtrZMaf8BKsFhxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIJrI//nHHuEDc/gRGir3sFzRjiteG6JiQY9wshwL7g=;
 b=jkrKH2m3N0vjd/xc5FdV3mQyLZSkShqJEVnxgoJSr1CNOGJfhHFYDALQTo/LCrSDEbrf+qm4gyShCBserGK9RnJFltQ6Rj2QdwFBZlkMDCg8yHNjluOcb6KIttVUJZMg5d5Io7DpJE7vJV+yDFc225HJrAD3Q9J0wnxQhr9FWB1yCxNq7M1sDwJMsX1oal4ID6iFO0gX0zs8d3MnAKrxFVYOy0NN9Q8OrCWea1ow9p/K6Ek7q/OvlksqABHGfJx3+LKzgC6s/dfygT5O2ncjiInSSAgypRgEJBuy2299pkB2mWZjX1NuNRY1v5vDIewKw22kxAkVVwI4J9R+OoJSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TYUPR06MB6099.apcprd06.prod.outlook.com (2603:1096:400:356::8)
 by KL1PR06MB5922.apcprd06.prod.outlook.com (2603:1096:820:d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 07:55:09 +0000
Received: from TYUPR06MB6099.apcprd06.prod.outlook.com
 ([fe80::2223:6c27:d5c2:aa47]) by TYUPR06MB6099.apcprd06.prod.outlook.com
 ([fe80::2223:6c27:d5c2:aa47%5]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 07:55:08 +0000
From: Teguh Sobirin <teguh@sobir.in>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Thread-Topic: [PATCH] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Thread-Index: AQHcSAeLeEHgBtL7T0iA53+yECJXFbTXyTgAgBnf9ICABPXAew==
Date: Mon, 17 Nov 2025 07:55:08 +0000
Message-ID: <TYUPR06MB60990F649387CA675ADF2813DDC9A@TYUPR06MB6099.apcprd06.prod.outlook.com>
References: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <ukz4djjytsne3y2w3epkdc7gzegmeeijpcqblvftcx73ccs43p@es6b4ew4nrzx>
 <w3fffuitwki7imcpc75m2e5kv5fpg5nj6udpxytm55kqa4mkud@rkl2ywspwm5y>
In-Reply-To: <w3fffuitwki7imcpc75m2e5kv5fpg5nj6udpxytm55kqa4mkud@rkl2ywspwm5y>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6099:EE_|KL1PR06MB5922:EE_
x-ms-office365-filtering-correlation-id: 239157f9-f7f6-4b44-b43e-08de25aea0fe
x-microsoft-antispam: BCL:0;
 ARA:14566002|31061999003|461199028|14091999006|8062599012|8060799015|19110799012|6072599003|15080799012|51005399006|440099028|3412199025|40105399003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?djgrdEo0V1lCTjdOMy9SZkYxZHZaY3Fnd1N6MGR0WmdCQ0V6bmd6Z0NWQi9H?=
 =?utf-8?B?M1NqUWh5citkWTc3MVR1ZzZwUkVWZEM5MHN5SVE0TTVvQmxPd1F4T29WWkZi?=
 =?utf-8?B?elpiMXZDWFd0Wmcyb28wSmNranp0Q3J3Nk9rNzZja0VyU1NpR0t3NUdJN2d6?=
 =?utf-8?B?d3M0b0RQRjFKWDYwTVlyQUEvMFVKQWdHWkFWQlpGeDhkTDg1d3RWQlM4ODNu?=
 =?utf-8?B?NkhiM2FUTFBPcU1jMmlFN1dmdW9BTUtjMy9VZ0VyK3RhbTVSVnZ2OE05bXFE?=
 =?utf-8?B?MTdNZUs3d2hCd3RyYWZBY0VYc3ZXb1NxZ0gyQS9zUUtmYkpVWFZWa0lSbUIv?=
 =?utf-8?B?K1N3dFp5SUwxY05mRXhycjk2c0JYSk1ycm5KWmIxTHR0bHV5V2t0VkZtVUY0?=
 =?utf-8?B?YkxXbHdSekdvL0FXOStRV1pPMlhiWVV6Mm1ROHg2ZGoxWWdiR3IwaTNsbHND?=
 =?utf-8?B?K3pzVDhibjZ1MkdkY0hYZ1VxY1IwamxhWjl0NTB5N1U5c2tIakRjbWtsUWhX?=
 =?utf-8?B?MUV6cENjRk0rOVlxWEQ4UENuVmgvZTFSbE9SRUdCYTA2aGVvcHU2T2RrNDRW?=
 =?utf-8?B?aDY0UjNXSTg2bDg5SWIwMHdHdDR2VFFkYlI2WUpRMWdoNk1JbkowZHVmQ01W?=
 =?utf-8?B?R2JMbVhSbk93ejFaYTNwbGNoZitwN1RJanI0RWJFMTJ5Q253S0hQQXpwZDlV?=
 =?utf-8?B?SXZpSmJWajdRL25GYjM3Mjd2bUZaNkRjUFcvZGVHZ0hnRU1CS095eEJWUmIw?=
 =?utf-8?B?N1NONFh1NlkrOE1mcjErbndNYzFmbnVjUWFJbjlQeW5HVFRrMHB5djAvdytC?=
 =?utf-8?B?c2ZFUVdoUWg4TExxR1IvTDJmSjFpVHR3dy9nb1VMcnpYQUFjbVRDbVF2WEV3?=
 =?utf-8?B?WXdzS0tEbXRlNDFTVUtEUEhNV2lweEhYV2VlcloxbEJuUTZnYnRNcXZWOFVQ?=
 =?utf-8?B?UUlKOWFtVlNMcU9vaThHNU1sbk5HNUNwSU5Pay9idnJKTUgyd0JqakJmMllE?=
 =?utf-8?B?U0g1ZklFWXVqNWpvK0dsT0kxZE5mNmxRUTVNN3hiOU1QWFRuQkkwZk1acXV2?=
 =?utf-8?B?SnZtMno4eCtQaUQzcGlpbzViREpncHRGYi93d2V1TWt4Y1BsSnZjOVE1NUtn?=
 =?utf-8?B?MndUV1BYTGtYTVRJUnRtSTlSTlZjVzNscGdmNVljazVhZFNjMzR4RjlpcmNS?=
 =?utf-8?B?ZSt2NSttalo4TUFKTisrOTYzM2gzQnVBSVI2Vjc2TVdsQ3BIQThGWUNEU1l0?=
 =?utf-8?B?d2RxUU5CcW5BU0xBeXdqYnJremVBSzFQQ1huZEQySndEaitnaW9XMnU2NlJu?=
 =?utf-8?B?ckFIV2JaMGRmMGRhWHJydi9KdVhsVU9VejZ4cGxvcHJuN3ZlZWxzd3FWdzFi?=
 =?utf-8?B?WUYyUjhJaGo4OVRwaGFEejJqSFZOZEkrUUI2YTVWWVlSajQ1VUlOc0hBNEJn?=
 =?utf-8?B?ZXhIRVQ0QmlxY0hHTUV1NjQwTHNRcC9GTWZLVWVsMXduWC9PWTZ0QlhOK29i?=
 =?utf-8?B?TExtallOL0hqTjJ3V0lMT1hmcitMa3BRc0w1LzJ6eGtOWUYrWnRLU1ZnQXQw?=
 =?utf-8?B?djlZK3hMdVhrY0FpRkxnV2twZ0I5VjNRQTR3aUpGTktaTGowRDJEaWVVNTU2?=
 =?utf-8?Q?RkJb1zO4V8OoQ+lfmZFQAwmsK7KzXossRTa7NZKEkzG0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEZPWDRXMytwSVJqZERpbjVGUHB3emxZYndPZlZncnQwcTNtRmpoTXVvdjg3?=
 =?utf-8?B?VzVHT0FjejdWZmJpMklCMDd4Qm80VnowNXBidmpIOE83N2h6WU5YNHJZdGVT?=
 =?utf-8?B?UWxrUE5DVnJkZTlPTFd1aG15OTZDZk15VUMwZ0JMTGFkNUl4OE5BWklrRktX?=
 =?utf-8?B?L2YvWlpoeUlXdWYwc29ZL0xpb3QxTU5pVCtCdklEdmpzSU1jVUlNazlhLzkw?=
 =?utf-8?B?RjVRSmVCM3VKOCtpU3FQZDhkOWI3a0tBMVlrUk9ya2xlTzc0djdoZ2NwVk80?=
 =?utf-8?B?cGx5WnhhWHREd0ttUE5jd0psaWFYNkhpNGJMcEN0dDd3SXN3MkloYzNXS2tT?=
 =?utf-8?B?Wi80UEVnQTBod3E4MWlyUnhRZVd2NDhLcHJoYmtwYU12Q0dCaHgwNkRyaTZ5?=
 =?utf-8?B?T3JQR0hSNGkvaFZ0MG9rcHR1V0xsSGNIME5MSzh3ZjRXNmZENFIwRmJUay9i?=
 =?utf-8?B?QWIyOGlOQnR0NkJ6OEd1Z1dNQU9JYUV2ZkNaZmo4eXdFZ1hGREhPZ1FBY3Bs?=
 =?utf-8?B?Q2hyNnRkS05vbVVJSm96Q1E5b1RCWWhOSXhEQmdmSlVyYllxK3cvWnBqMVNt?=
 =?utf-8?B?aFIvczNDbVo2eDF5Rm5wbzJtclJBZjQrZXhRVnBlZllkTWFJTEdubmwvY0pj?=
 =?utf-8?B?ZlFxeWRzeVF1dlI0UlBFd0MzaWJoczl3eEZSalN4MkJPaFZmL3FzWS85OXBY?=
 =?utf-8?B?U0p3Tk0xYmhjRWNKbE9tYjdqN3R2TVVqZ3dLaXFrVlMydE0yWlhwTittZmE4?=
 =?utf-8?B?K1NsL2lsUlJ2ZTBDR2pwZmdxampCZktHRStrTXZxVE1QRXo1TVlzZUdRNlZH?=
 =?utf-8?B?VEVBa1lGTzVoYkZNTngxMzNNaTRvUDNOOFdnMllkSFNIZEE5eDZGVHRObzQr?=
 =?utf-8?B?dldTOGwyMDZ5MHA5cVdNWXZyQ1ZmVm1WbmtaV1plRDNZWlRJQWZIRjlHRlNl?=
 =?utf-8?B?QlZDbFg3S253VHp6cEF3U3RBUitCSnlwcW43TUpKNnZ4aG53NVlIL1BYRVha?=
 =?utf-8?B?aEluTENramZGeFROS1RnTHVQUnNSSHhURTk4SGtTYWJLUjYrdWcySU1kSlcv?=
 =?utf-8?B?WlZtb3ZrM3pRbk1zdmtxdXZPUkxOdENNdERQYnYrSDZlMnNJYm1Za05qWW5L?=
 =?utf-8?B?bDRnY0FUTVhYV2pMOG1tV3dDN01IbzY0VVdlZjhxQWJKWW83OTdHbzJpTlRS?=
 =?utf-8?B?RHFYcmJlWkVyblBNbVJsZ1hpQ0ZkTGt6OEc0WmdNOWhqdlpFSzNTU1VqZjkr?=
 =?utf-8?B?eSt2U3pvREJPMllNWmlwcnhOY1JBZzB4ZnpnQWtDMGdzb0thdk1EWnZkUzBF?=
 =?utf-8?B?L0hMRklXQ1hOQnlzMlVCZFgyTmdjL2R5c3FBOFBIR2I4SXNUOVhvUm8yRHdG?=
 =?utf-8?B?VE5LM3BsRWN6UkwvRitWL1gvdG9VWGtQME9menltd1BNL1BOWFlVaWFwR3BJ?=
 =?utf-8?B?WEdLUnk1YTk1TTZOUlRlamFGaWppVDNoWCtTNzJQc1BPVHdxQ1lGb3NsRUIr?=
 =?utf-8?B?OEtSNkJKbUNJWmFQcXhkYjQvdjY4Zy9iUm52Sk5GR0NOY0g4R3VHcmRBR3Bv?=
 =?utf-8?B?eldtZ2M5MVNVRzJaNXMvUk5PaWlVWDNFWlBFRUs4NGo3NDVMczhvNnpZd3p0?=
 =?utf-8?B?cVRwR3JPd01CZEJYVys0LzBEeXlybXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-6a509.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6099.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 239157f9-f7f6-4b44-b43e-08de25aea0fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 07:55:08.8628 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5922
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

DQo+IA0KPiBPbiAxNCBOb3YgMjAyNSwgYXQgMTIuMTAsIERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRy
eS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79PbiBUdWUsIE9j
dCAyOCwgMjAyNSBhdCAwNzowMjoyOFBNICswMjAwLCBEbWl0cnkgQmFyeXNoa292IHdyb3RlOg0K
Pj4+IE9uIFR1ZSwgT2N0IDI4LCAyMDI1IGF0IDA4OjM2OjM1UE0gKzA4MDAsIFRlZ3VoIFNvYmly
aW4gd3JvdGU6DQo+Pj4gTW92ZSB0aGUgbG9vcCBvdmVyIHBoeXNfZW5jcyBvdXRzaWRlIHRoZQ0K
Pj4+IGh3X21kcHRvcC0+b3BzLnNldHVwX3ZzeW5jX3NvdXJjZSBibG9jay4NCj4+PiBUaGlzIHdh
eSwgdnN5bmNfc2VsKCkgaXMgY2FsbGVkIGZvciBlYWNoIGludGVyZmFjZS4NCj4+PiANCj4+PiBU
aGlzIGNoYW5nZSBlbnN1cmVzIFRFIHZzeW5jIHNlbGVjdGlvbiB3b3Jrcw0KPj4+IGV2ZW4gaWYg
c2V0dXBfdnN5bmNfc291cmNlIGlzIG5vdCBpbXBsZW1lbnRlZC4NCj4+IA0KPj4gUGxlYXNlIHNl
ZSBEb2N1bWVudGF0aW9uL3Byb2Nlc3NzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QuIERvbid0IGRl
c2NyaWJlDQo+PiB0aGUgY2hhbmdlIGFuZCBwbGVhc3cgd3JhcCB0aGUgY29tbWl0IG1lc3NhZ2Ug
b24gNzItNzUgY2hhcnMgYm91bmRhcnkuDQo+PiANCj4+IEkgY2FuIHN1Z2dlc3Qgc29tZXRoaW5n
IGxpa2UgdGhpczoNCj4+IA0KPj4gU2luY2UgRFBVIDUueCB0aGUgdnN5bmMgc291cmNlIFRFIHNl
dHVwIGlzIHNwbGl0IGJldHdlZW4gTURQIFRPUCBhbmQNCj4+IElOVEYgYmxvY2tzLiAgQ3VycmVu
dGx5IGFsbCBjb2RlIHRvIHNldHVwIHZzeW5jX3NvdXJjZSBpcyBvbmx5IGV4ZWN0dWVkDQo+PiBp
ZiBNRFAgVE9QIGltcGxlbWVudHMgdGhlIHNldHVwX3ZzeW5jX3NvdXJjZSgpIGNhbGxiYWNrLiBI
b3dldmVyIG9uDQo+PiBEUFUgPj0gOC54IHRoaXMgY2FsbGJhY2sgaXMgbm90IGltcGxlbWVudGVk
LCBtYWtpbmcgRFBVIGRyaXZlciBza2lwIGFsbA0KPj4gdnN5bmMgc2V0dXAuIE1vdmUgdGhlIElO
VEYgcGFydCBvdXQgb2YgdGhpcyBjb25kaXRpb24sIGxldHRpbmcgRFBVDQo+PiBkcml2ZXIgdG8g
c2V0dXAgVEUgdnN5bmMgc2VsZWN0aW9uIG9uIGFsbCBuZXcgRFBVIGRldmljZXMuDQo+PiANCj4+
IFRoZSBwYXRjaCBpdHNlbGYgbG9va3MgZ29vZCB0byBtZS4NCj4gDQo+IA0KPiBUZWd1aCwgYW55
IHVwZGF0ZXMgb24gdGhlIHBhdGNoPw0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBE
bWl0cnkNCg0KSSB3aWxsIHNlbmQgYSBuZXcgb25lIHdpdGggY29ycmVjdGVkIGNvbW1pdCBtZXNz
YWdlDQoNClJlZ2FyZHMsDQpUZWd1aC4=
