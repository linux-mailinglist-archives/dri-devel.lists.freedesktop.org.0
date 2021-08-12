Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B973E9CA1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 04:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712BB6E22F;
	Thu, 12 Aug 2021 02:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D856E22F;
 Thu, 12 Aug 2021 02:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcwrBjIDX3GKIFf8qDtN2a/5ZX5rDVAY42iIuatjf+IyyUbClOOr0yEBHAGeUtoCtTZFCnaTNwU3rjqcaxcv8sMq4THev6ltB00O+g2PI/k7f8dbtdEYsiuxoUUuhjnpOXdPHHbN+ei0HwwGdZqG+FxeO1aEmGHi1tIlzFr0TUr+7MZ4ucj+altwt5ztm4S9Gdt6ce6uKgV602pqqaOgddCJHYX6xwrL67o9PomSRT5Cf7eBYDd3t+ok5AqpmMetYz18rzl0IsEXjOJQ/B0hzSaSpYAHCSoi+vxs8l+AcVyj8mCZRDKpaBgGRVT7GzbNEH2V1tYwS3E5Pip89sOgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/s/sjrRw+GQk9eQZIhb/JS+07ZAxf5crgWAcEv+wEU=;
 b=ebKQ2lVxO76W1j951tGw4C8ayNnoZNXmmwkio32mk6bSaegvtIdgdsr3u3YELFP7fKYQZT8W0rlO1nXgFfFawTAeTm8cSvlVrqz0lXvQh1Wuo3dV5SO4x22W97N0s+30IbRsd3LCcjA3R04nDSLFraS3J3xCdW8G9f6SRHW2CoNz2Cv0MgeuJlwUY0DxXDJAld/fdsPSFlxKIpyKn9EgVhuYs775rWNr/q2EqYp+agQh/l5xk0gRqhmrEsWVXbl54Rj9mQpO2Gyg8XtrK26cyPKw7DDFvHuNsfqGfeLph88lvIaCYMDpFSYKXKsl2Hetkt6vEld5fQ9iQUD9zWMlvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/s/sjrRw+GQk9eQZIhb/JS+07ZAxf5crgWAcEv+wEU=;
 b=DKOBwrPMLfCugP4RY/0RSqUhsR9PxdtWDtyXcw3P/F7e2B8qjbx1p4qLY0wuj4GlFTG1wgMjFNtKpmIyw/SQ1MOgZBI869psujz6Wc69bEKHNopLPPpNjJg0OWXoIkghl71H2+bMN0i1vQxgGHM73vyiWvjDbPzM+MidaKofNP8=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB3769.namprd12.prod.outlook.com (2603:10b6:5:14a::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14; Thu, 12 Aug 2021 02:43:53 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6%7]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 02:43:53 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
CC: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/amdgpu: Use mod_delayed_work in
 amdgpu_gfx_off_ctrl
Thread-Topic: [PATCH 1/2] drm/amdgpu: Use mod_delayed_work in
 amdgpu_gfx_off_ctrl
Thread-Index: AQHXjtFLFQH7yxByDUmpjlj2dRqV2KtvKfkA
Date: Thu, 12 Aug 2021 02:43:53 +0000
Message-ID: <DM6PR12MB2619D5161FF8EE9AB452FEACE4F99@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20210811165211.6811-1-michel@daenzer.net>
In-Reply-To: <20210811165211.6811-1-michel@daenzer.net>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-12T02:43:51Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=6c19ecdf-d5f9-404b-9af6-c2de2d0326e5;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: feb3cdc0-4921-496f-407a-08d95d3b060c
x-ms-traffictypediagnostic: DM6PR12MB3769:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3769FB3F08F24533D0C15F4FE4F99@DM6PR12MB3769.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R0KInGd5uD3/Q4w80SRhnjAFbu9hSOX/naKyxSUYIyNuDhePD/rmv06lYBdW25qSRrE3EI4ftcco9kBR4FaXLSh4/SKu+yBzlhXQaOdcSz8VXdBFsGdV6hO3i/6c/IuLs95XRBCpO1bWMIJcS8jADZcNj2xQdbbD6AGDz9C3nx1WyAvq2zbEm0D01uHd8M1q8mEHZiJ3XFITpKtj/1flZun3FXFoHbaJ5GUoVvtnrsoMWPMMhzXTJLW7t43RVmsWp5zjGbrjr5AiYD4S+fafZzZiqYyzhMkL0ch0Y+G6vGasya1TIGoY1C9t64szDisAo5uWt7+//OdLU8GI8sXJYmI0ULHIuEuuAsATrnjTz1+l8rSlQ2q6G2x0p4vleu6mNytpvpsmtg8B8RHwZEI1ulyy/egzIpqahRRm7g7DxLbQ1V9CxxfdOSkxkrzp/ivOixZjggliz8zWVs/iMxbfZnw+yykf/HaUq+2CMM5DyUjr8L6soFWOLOnDjBVwXDOr1ox3zfCScRErS58vOlLBWephUV9T/n6sCJW4vtv+ZvaZzRKKAV1LRhNOJeIufTCTpMB8rfrQmUkZd82/qFnyPBqQLdCU3pcuKVIPg9pJXu/OJ0XXQjYRPS6+PmUKzTkDEBt1p3n/g/p70uaCxqI/MfK07vI80TXTE8ojbFOrOXNwYhSVbghMnARjwe5aaadHJdSSTpv7T/ErFQUzBDSq8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(8676002)(66574015)(7696005)(66476007)(66556008)(8936002)(4326008)(186003)(66446008)(64756008)(26005)(66946007)(6636002)(86362001)(52536014)(53546011)(6506007)(38070700005)(122000001)(478600001)(38100700002)(2906002)(5660300002)(110136005)(83380400001)(76116006)(316002)(54906003)(9686003)(71200400001)(33656002)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjhCVVhVVUFJYW1jdWUzTFAwRVpMaFREcC9BaEZKNytqVjdPak5HWlQ1WEVY?=
 =?utf-8?B?R0xXN04zMjd3WTBlNlRzK1hUMUl1LzNVYVpBczVNYS9GU0x2SjU1WVNYdkll?=
 =?utf-8?B?M1ZSQ3pEUUMxSWlTZkk4Vmdnd2tHeEx1cnBNa2JNcFpPU1UyN3pXSU90eWdh?=
 =?utf-8?B?Y0t5N2IyNThrZTF2aVJWMm9SMjZ0Q1pLVGljM0JiWVRRWDdlRVhJcWRJWmF4?=
 =?utf-8?B?ZlViWUM4S0Fndnd1aXV1cmY0WUJoVG4zL3EwZHdvYjRMQ1hVenphK2xPcEsv?=
 =?utf-8?B?aVQ1a3BzV2E4bE1EeVlLZ3hzUzNxL1d6andGRjhiU2wyc0RjcTZET2VQd05n?=
 =?utf-8?B?Znp6K014UFMySFJpMUZnZFNTZDAybEFDLzJPOGFSTEZVTSs0dW5wYXdpa1BH?=
 =?utf-8?B?a2t1QkY1dU1jYTlqT0xjSzdQYlBYLzYxUHRENXNlNlh1Rldwbm42dDRzdGNC?=
 =?utf-8?B?ZHB1WHE4REhxRW4xOFd4c3ZucGh1UXl4V0NPNFljUWhTajFnMWpuNW1FZkdV?=
 =?utf-8?B?dkVnUEpObWhhSEVDZ09ra09aTGxwZ3VHenpNdU12SFBHdUgvSnp3WmcvcmRX?=
 =?utf-8?B?bmpLR3ZTQXlFZ3VIRno1UE92RCtjdHZmMWpoNEZUU04xOHNnVnJ5YVdueGtO?=
 =?utf-8?B?S2wxNlFydEdMaXl3T2IwUlZQdDNKWUx1SDVINStENEUvc2tYSGtRU3NHdTV5?=
 =?utf-8?B?TnBLVHAwdDNhVXlzTVVFek50RWhPWllpUTd6bUlJRVlnZDFUdjArNm0wQUZ5?=
 =?utf-8?B?bmFxcTFhUjZiRWtSYW9GUUI0T1JOeGp3US9UNzltNFFNak1GaWo5Vm1obzB1?=
 =?utf-8?B?RHk2RnNKY1poOENiMFlvUG5lMTFLN3YxYVhPNjFTSGJ1eGJ0OXpaM2tkdG45?=
 =?utf-8?B?em1xZVZBMnJxYXZOWC9JSGY2RS9MRFA3RXNTelA3R0xjTXhIaWl1WVVTRUVr?=
 =?utf-8?B?TmJkZlZtdUJSMlJtUFZIM0g1T1FFR0hQbitrSDBpbjFGenpxN3gveUdRaDdY?=
 =?utf-8?B?c0tpTlRHOURja0tObjNvaVVmWXRJcXZROU9tZ3VBaUlHWEhyWnVNU1UwWkE5?=
 =?utf-8?B?T3hwRXZsbWd1VjVPMjJEWUtnSXZqc1hrV0lZYXROWFR4VHRjWTJsYUdtaHJ0?=
 =?utf-8?B?di9CL1dRbXdwZmxOYU05TDR5MDUzN0xIdmRBdFRPWHc5OVp4amdRWUlxK0Jp?=
 =?utf-8?B?UHF4bVdlaHBZOUUvUDUzbXVPeTN0UC9xZlZ2MEhlQWxFNThaK0twVkk5V1ZP?=
 =?utf-8?B?K29UZGJjUk1scDd0TnI1L1prbHhYRS80ckxvOVZuTkpwV0MwZUhIeEdHL0Ex?=
 =?utf-8?B?Lzl5aWl0SDRIMFhVLzFkeHVud1U0b214dG9Rcyt5KzNXb3luUG54ZllxbUxk?=
 =?utf-8?B?VnBkU3pGMDEwamZpVlY1dTFCOXF0eUxFTmI3dWZYb1NTQkhMQ096eFBBUkgx?=
 =?utf-8?B?TXhNc3FrV1piT24wd3JzUUcwc2liSFdOQVU0MitHUXNaQUVTUzEyRm9DY3pY?=
 =?utf-8?B?ZGVhVkFvRGtuV2NBOEM2ckIwcXpaam16Z0M2WGtkSEZEa0dVQ0ozZmdvS25E?=
 =?utf-8?B?TmhkN29mbFg0cnZNYVdpU2k1L2pBMlU1cDJudG93cFFmblJaNjZrdnBUS3JM?=
 =?utf-8?B?R2hJKzd1TDBzcDVURiswY3FCUkVXVmxrRWZpTXBYNlNpaFVwRG9wbHhWbURi?=
 =?utf-8?B?T1MvWGpTbTkyR0JzZERsclMxcWZWWEdVMGd4Um0wUGlHeWxUcCtMT3NKcXdJ?=
 =?utf-8?Q?XXUPggbYZGxrfnz03OTR7Mxymvn3YXzA54stSry?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb3cdc0-4921-496f-407a-08d95d3b060c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2021 02:43:53.3736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /i5x7VWmxNsRXcqdO9gcutZp5e/AVa4l7T3vuGbOMYQlRZ1lXBdP9uU9u7+gYJoY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3769
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5x
dWFuQGFtZC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1k
LWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
DQo+IE1pY2hlbCBEw6RuemVyDQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTIsIDIwMjEgMTI6
NTIgQU0NCj4gVG86IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+IENj
OiBMaXUsIExlbyA8TGVvLkxpdUBhbWQuY29tPjsgWmh1LCBKYW1lcyA8SmFtZXMuWmh1QGFtZC5j
b20+OyBhbWQtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2FtZGdwdTogVXNlIG1v
ZF9kZWxheWVkX3dvcmsgaW4NCj4gYW1kZ3B1X2dmeF9vZmZfY3RybA0KPiANCj4gRnJvbTogTWlj
aGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+DQo+IA0KPiBJbiBjb250cmFzdCB0byBz
Y2hlZHVsZV9kZWxheWVkX3dvcmssIHRoaXMgcHVzaGVzIGJhY2sgdGhlIHdvcmsgaWYgaXQNCj4g
d2FzIGFscmVhZHkgc2NoZWR1bGVkIGJlZm9yZS4gU3BlY2lmaWMgYmVoYXZpb3VyIGNoYW5nZToN
Cj4gDQo+IEJlZm9yZToNCj4gDQo+IGFtZGdwdV9kZXZpY2VfZGVsYXlfZW5hYmxlX2dmeF9vZmYg
cmFuIH4xMDAgbXMgYWZ0ZXIgdGhlIGZpcnN0IHRpbWUNCj4gR0ZYT0ZGIHdhcyBkaXNhYmxlZCBh
bmQgcmUtZW5hYmxlZCwgZXZlbiBpZiBHRlhPRkYgd2FzIGRpc2FibGVkIGFuZA0KPiByZS1lbmFi
bGVkIGFnYWluIGR1cmluZyB0aG9zZSAxMDAgbXMuDQo+IA0KPiBBZnRlcjoNCj4gDQo+IGFtZGdw
dV9kZXZpY2VfZGVsYXlfZW5hYmxlX2dmeF9vZmYgcnVucyB+MTAwIG1zIGFmdGVyIHRoZSBsYXN0
IHRpbWUNCj4gR0ZYT0ZGIGlzIGRpc2FibGVkIGFuZCByZS1lbmFibGVkLg0KPiANCj4gVGhlIGZv
cm1lciByZXN1bHRlZCBpbiBmcmFtZSBkcm9wcyAvIHN0dXR0ZXIgd2l0aCB0aGUgdXBjb21pbmcg
bXV0dGVyDQo+IDQxIHJlbGVhc2Ugb24gTmF2aSAxNCwgZHVlIHRvIGNvbnN0YW50bHkgZW5hYmxp
bmcgR0ZYT0ZGIGluIHRoZSBIVyBhbmQNCj4gZGlzYWJsaW5nIGl0IGFnYWluIChmb3IgZ2V0dGlu
ZyB0aGUgR1BVIGNsb2NrIGNvdW50ZXIpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGVsIETD
pG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2dmeC5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2dmeC5jDQo+IGluZGV4IGEwYmUwNzcyYzhiMy4uOWNmZWY1NmIyYWVlIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jDQo+IEBAIC01NjksNyArNTY5
LDcgQEAgdm9pZCBhbWRncHVfZ2Z4X29mZl9jdHJsKHN0cnVjdCBhbWRncHVfZGV2aWNlDQo+ICph
ZGV2LCBib29sIGVuYWJsZSkNCj4gIAkJYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50LS07DQo+
IA0KPiAgCWlmIChlbmFibGUgJiYgIWFkZXYtPmdmeC5nZnhfb2ZmX3N0YXRlICYmICFhZGV2LQ0K
PiA+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50KSB7DQo+IC0JCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygm
YWRldi0+Z2Z4LmdmeF9vZmZfZGVsYXlfd29yaywNCj4gR0ZYX09GRl9ERUxBWV9FTkFCTEUpOw0K
PiArCQltb2RfZGVsYXllZF93b3JrKHN5c3RlbV93cSwgJmFkZXYtDQo+ID5nZnguZ2Z4X29mZl9k
ZWxheV93b3JrLCBHRlhfT0ZGX0RFTEFZX0VOQUJMRSk7DQo+ICAJfSBlbHNlIGlmICghZW5hYmxl
ICYmIGFkZXYtPmdmeC5nZnhfb2ZmX3N0YXRlKSB7DQo+ICAJCWlmICghYW1kZ3B1X2RwbV9zZXRf
cG93ZXJnYXRpbmdfYnlfc211KGFkZXYsDQo+IEFNRF9JUF9CTE9DS19UWVBFX0dGWCwgZmFsc2Up
KSB7DQo+ICAJCQlhZGV2LT5nZnguZ2Z4X29mZl9zdGF0ZSA9IGZhbHNlOw0KPiAtLQ0KPiAyLjMy
LjANCg==
