Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4E6A1574
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 04:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078A710E551;
	Fri, 24 Feb 2023 03:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU002-vft-obe.outbound.protection.outlook.com
 (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D086510E56F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 03:38:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3MkTZvJ/X09v1BBxi0Ue+EuKVZMyy/SKuk3WxHHin/faNA1n0C5KFahtOki6N5DK/iUuQS8JDdUg4H4mn4Zr/dDsXcsYiwOcN5Y0+qjGC3zGGWGeW05++un2IqFSJfjFFLdReWJIdg8zQ/ew1/GkCrKuC5NRcRQwjMtWohmEEJuwDzA1TrPWgEBKFAuO+KRTzlwoGiWt152pYBnPin7NT9oTzcNjw0AYqMARE09UQU1XBmjS74N84JRztI/6YoD8o+21YxVp3tF8LHzzP096k0vZV5oPIgXxwMveEkV9uIvw7ttaiBRZ6TH7O3OmQUv3rBtuSulzLU+Y0Sss5gKlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLOaZicxtkxKkBYLUyijVgPCiC/dx0j/+i64ocnGf9g=;
 b=O765vDmbRTDNnPrHpbQQjgv3de69Kpwq5cp3MGgjC3meGdwCJiTnFdTuiFU6ZH7rnqQ0SXXKpTqkU071zz+6k10864ETL7TdKNVAJejET5ig8jLr56ug4oVId3s8Jqboz34oTUg/N6Hrf6C8acpOa/xn3CYKuOcxk6Wm6xlxp5WluiTUYa5c0HAEw+nuPNfZ69VdF8sShOImYMtf2hdhG35++oRlQSHFWb6BP0Wky+5drVIJHyrZYGZEh4mi0lE5L3oKxAjwHsC6pVVEvOT+xH5+4Psn4bMzYrmBsZ0185Y3d8WSZoxUKeTMX2aGaHFPfgSBTefcpHCbugiC/xWPFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLOaZicxtkxKkBYLUyijVgPCiC/dx0j/+i64ocnGf9g=;
 b=dvw889gOdb5zclEdWyHThfjZAZO/QO9kQJW1/5DqbZpt9UAR69Xrn0tCr/Cpf5xSuTlAML+hN08a7Hf/xJDoT/RAAuGhdOTVlqcOBRKA/j2W1hSR3TO5MTU5K/w894W2aKIyshj7QPNvPXjp7DpP752BiK2eGUlfNe7EyJtaukQ=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by BN7PR05MB4577.namprd05.prod.outlook.com
 (2603:10b6:406:f8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 03:38:04 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 03:38:03 +0000
From: Zack Rusin <zackr@vmware.com>
To: "tangmeng@uniontech.com" <tangmeng@uniontech.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/vmwgfx: Work around VMW_ALLOC_DMABUF
Thread-Topic: [PATCH v2] drm/vmwgfx: Work around VMW_ALLOC_DMABUF
Thread-Index: AQHZR1Unjoj41030h0yn+mDWgyFFg67cfB+AgADptICAAAdYAIAABJoAgAACWwA=
Date: Fri, 24 Feb 2023 03:38:03 +0000
Message-ID: <7c0691dd62f58cffb42fbfb32eedc742038a2de0.camel@vmware.com>
References: <20230223070405.20228-1-tangmeng@uniontech.com>
 <c5ba07a5ad3c6b101126a97eb094c51013ee83c0.camel@vmware.com>
 <113C6E516C95FA38+f2633fe9-fb5a-616e-0e35-7559750544c9@uniontech.com>
 <2bc1750b4c3ebebf84c106b903178e5236dc396e.camel@vmware.com>
 <D9D1D797C8BE2644+74545cb0-21ea-1b04-bee1-1ed1bbe3efff@uniontech.com>
In-Reply-To: <D9D1D797C8BE2644+74545cb0-21ea-1b04-bee1-1ed1bbe3efff@uniontech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|BN7PR05MB4577:EE_
x-ms-office365-filtering-correlation-id: 7f7f2321-f849-4130-abba-08db161888f3
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R8Dig+8Its00Fb6ToKLL/7FFe1eG2t5WWfeDi1QRh+JO3pKQjo0ZivJi+AH2XxdUJyOUhbjxlgXZouGzpuCgcEnPZxnssYGSJcLhMkw1c1mRSahkPazZcNIqrfU8f6gndUVfPnO9V+K7Cez4b/ed45EX96BHBMD7rIgmLRLxVtE39O6PK0h2WuDco+4RZR2Vbk2iZlgFAK8FwfomOHs0CrwvE30iF0h1wKLzJjJQbd30XlJXAerWljpGmdkRdqUdtIhZ8e8lOSltbSW/Y2oSxgH0DwxwT9536usiOJiJIIAm3MJCkkJID9oLJ0INEpTn5dlKewBJfM0GZuN61zovU3tZxX9PgBQTsER/nQr03Yjd+Fp/z/U0EJ5kEXuX0DpxS+y/dkiSCcrO6jQeGCcAcXLenSzcXjrOi1cnOd3qKJvW9sESS8zldZfuUqVKbOeuq16Bu7xZnYRjb6LnEFvbfL3qnVSpEjO7SycLxsm9pXp01kT3CpiSwBioBwQ0/x19CkmWpb9ivCHmlZPp4OkgrL8dTBcotL/j11+EfZfXkZi9JP4A47zieeaFvQYogwB051FEimT0NAOeknqaq976Gu2xHdHCMKcrCyD2TgsbioJ1We1TXKzfTK4a0AgMcwIV2Ni2H9+eWATDrCSxMWovdRjmRKzY0eQh5Qba7YV/6Ut0fI7QIeAvaH76fBi1m17HcpCjAEWjYrvgK7m6petmhpCcXIqEo6USpiNyNVIiJ3w0br3lVA8S8dB+1coj082/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199018)(36756003)(83380400001)(6506007)(186003)(26005)(6512007)(71200400001)(53546011)(6486002)(478600001)(66476007)(91956017)(2616005)(66556008)(76116006)(64756008)(66946007)(86362001)(66446008)(8676002)(2906002)(41300700001)(8936002)(5660300002)(122000001)(110136005)(316002)(38070700005)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVBzc09hRTRFMGo3QjlIVWZOK1VVc1lkZk12eXRhYk9JcS9Zb1gxTEc2MURs?=
 =?utf-8?B?SzVzMzczc1VwU2pyd3MvNmo5Nk1pUUhnRTZLMmI5eVJxTnFyRjd6Y3ZobnVw?=
 =?utf-8?B?K01QTmxkY0pOdVF0SUhDVmJhcHo1THFUL2xyM3RuTkp4alREcjgxRWViS2pV?=
 =?utf-8?B?cXJOdjZpbXRvRDdUVWlJTjFhOElWNHpYQUQ3am85ckZ6UE5iUmhnSzA1d3NV?=
 =?utf-8?B?aDRzc0Izckpra1Vvc2tzb3pYMFNqTVJxS2srWmJSb2JqNi9NZ3Z3WGdPS1Zo?=
 =?utf-8?B?ZFBOaEdwenU4cDh2WURlaXV2eE5aSlFMUGxza2xTZFdNZzJKVGhnWmZmenVn?=
 =?utf-8?B?REF4cHFDS0JVTHVuZUk3Q2xrbTVrd2lUcGs4WGJsQWpMZmF0SnpURnhZV250?=
 =?utf-8?B?TVNCQWo1WTAyZ3E1ZUJiaVVySEI3MjRwY0R6ZEVBT0s0R3Juc2VqOHVNME5Q?=
 =?utf-8?B?SHlBbnJmS2paa1NrQ0wvRGtIOXVHVWNHeFRDYkh2TlJVa0VZZ2puOEQ2dzEx?=
 =?utf-8?B?bDI2NkNRTU40VGQ0UTVOZUUxbGdxSXYwZlZuYU96RGhIYjFnRmxZakZsQ2pS?=
 =?utf-8?B?dW4xWTFiekpkaWVqRHpUSmhiZTNPekc0OHRhZGk4QlI2Mys3N1dQeUhGOTFF?=
 =?utf-8?B?cFB0cGkvb2xYV2R4UWJKQ0FCa2hsR0kvZEpJWmF5RE4rdlFVYlpLRlZXSVA3?=
 =?utf-8?B?QjVhQnlMd3cyb2ZDTTNzZWpFMXhQQi9EblAzQ1FPZXpmQWJtZlBva1VTeW9V?=
 =?utf-8?B?WndCMmJQRXIxRHQ2Q3VmYVFhMU13eDVTYnJVbEx4TWoySVFJV05NbkpybHRy?=
 =?utf-8?B?dGp6VVN4bmIycnMvcS9UVjFFcmVBRXdvRFFyeVFMNVVVSUIxdWxKbE5tbFdz?=
 =?utf-8?B?OVBqcUh4WHdaRnZJOGxFNW1PSXFlRitKZ3NtZVAxdHRHdWtaMlRUdFd3c1hx?=
 =?utf-8?B?WVQrRzFZUHcwWmFCeEdiUlRTUWlkQ2dHUkhVRWlmaGY5SXFjZmYybE12QWl2?=
 =?utf-8?B?NXJodTRqQytwcU9VOXJVbFdLRTNaMGZuNVRXMXBqSi9zRkV4dXZFczkxV29u?=
 =?utf-8?B?UDlwdnRISHgwU09WUUlxZkVXWkhiTjM3WUFiTkVDTEp3dHd3ZmswR25Pd09Y?=
 =?utf-8?B?cEdvb3BuZHU1enhHZVFTdXBKSFhQdStQRWxqL1dXaGYwZ0l5Q3czeEtxYWJN?=
 =?utf-8?B?Q2RyNnFFMUlneVlMNWYvTjgwaC83Qlkxb2NYV3dCencvSlZUcVhMQ3QwZkgx?=
 =?utf-8?B?QTkwUDQzNEZ0VmRvaXpzdGg2eWFVZGkyUFBiVHZMYlY0WHJFU25Rc0UwMFRJ?=
 =?utf-8?B?ME9lazBpYTlXdzZCUWVUeHNwT0FPSFhNamZEWlBzUmNaeGVMaFhhbWpZRklX?=
 =?utf-8?B?bmF2ak03eHpsSkU5WW5vZDh6YTJOVThrVlcvL3NNMGVBOHdObWxUSXR3aDV5?=
 =?utf-8?B?cXB2c1hRWm83N0xRMG14MHFCdFhmb1dmbWtvM3o2a2FmcEVuUkZUclZMU0JW?=
 =?utf-8?B?T0Q4QWc0MXZIR1B6QUl6UHYzSGVCVjRxVzA2M1hxaGVTZGJrRUFpR3VURS9K?=
 =?utf-8?B?aXhDc3FvQktsMDZzNVllQmYwNVBvQlRKNUNPb3FDYmhiSWlmc20vMUNqVlU0?=
 =?utf-8?B?dkNSVSttVWloWXh3NWh2R09Ya00yeEM4bnZrc3NHVEtyQWNPNGNpWWFTZEZq?=
 =?utf-8?B?UTJnMk1rNWw3c1U2ZmxKbWExTXM2NDZOUzJPM2hPNlhxcHhOeGE3UkhBMnYz?=
 =?utf-8?B?Q25RMGdmSnFOKzczbzhybDdQZ1J5UEpvUWQ4a1o1V2xSaEdBbEltQ2ViMVo1?=
 =?utf-8?B?Z0xBRTdzc2c4RmNLT3h4TzdWYk9qbE1XUlF0TmVUaWtSSDhabDJNNDU1czBv?=
 =?utf-8?B?d3FkcXdMK29LZ0dmUEpFenpCbDRuWkNuM0p1Q3lFdDZJS0gwaERQSFVmbjVj?=
 =?utf-8?B?M1NXRFNLRHdYMVdDMEowMDgzajQ4T05HRGxrdDg1KzRGeHF2S1p4YUZsR3Rp?=
 =?utf-8?B?UnFyYkMrRkl4NERnNG9RYnJwOFZwelloQm5MVlUyK0E5MW9BZ2FSZVFRM2Nh?=
 =?utf-8?B?TTlDMkNsR3NQZ09xVjVpSWN1dHlpT2g3RVNYRU5jdFl0bzVUT3dJK09aNVhq?=
 =?utf-8?Q?BQpnlD7NS3OOdcQkO6Al/xDhp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDA40C893A412041AAEF7C5CBE352023@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7f2321-f849-4130-abba-08db161888f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2023 03:38:03.5128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uAyb8Fp1/Hrck8O3TVvQ66ZG8eGaFDNoFVOWsjskLykPcnfDk6piwdLEliC57erS60gGHIxfwdbAMlKPHa/lcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR05MB4577
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

T24gRnJpLCAyMDIzLTAyLTI0IGF0IDExOjI5ICswODAwLCBNZW5nIFRhbmcgd3JvdGU6DQo+IA0K
PiANCj4gT24gMjAyMy8yLzI0IDExOjEzLCBaYWNrIFJ1c2luIHdyb3RlOg0KPiA+IA0KPiA+IFRo
YXQncyBjb3JyZWN0LiBUaGF0J3MgdGhlIHdheSB0aGlzIHdvcmtzLiBUaGUgaW9jdGwgaXMgYWxs
b2NhdGluZyBhIGJ1ZmZlciwNCj4gPiB0aGVyZSdzDQo+ID4gbm8gaW5maW5pdGUgc3BhY2UgZm9y
IGJ1ZmZlcnMgb24gYSBzeXN0ZW0gYW5kLCBnaXZlbiB0aGF0IHlvdXIgYXBwIGp1c3QNCj4gPiBh
bGxvY2F0ZXMNCj4gPiBhbmQgbmV2ZXIgZnJlZXMgYnVmZmVycywgYXQgc29tZSBwb2ludCB0aGUg
c3BhY2Ugd2lsbCBydW4gb3V0IGFuZCB0aGUgaW9jdGwgd2lsbA0KPiA+IHJldHVybiBhIGZhaWx1
cmUuDQo+ID4gDQo+IERvIHlvdSBtZWFuIHRoYXQgdXNlcnMgd2l0aG91dCBjZXJ0YWluIHByaXZp
bGVnZXMgY2FuIGFjY2VzcyBhbGxvY2F0ZSBhIA0KPiBidWZmZXIgYmVjYXVzZSBpdCBpcyBkZXNp
Z25lZCBsaWtlIHRoaXM/IHNvIHdlIGRvbid0IG5lZWQgdG8gYmxvY2sgDQo+IHVzZXJzwqB3aXRo
b3V0wqBjZXJ0YWluwqBwcml2aWxlZ2VzwqB0b8KgVk1XX0FMTE9DX0RNQUJVRsKgc3VjY2Vzcz8N
Cg0KVGhhdCdzIGNvcnJlY3QuIElmIG9ubHkgdGhlIGRybSBtYXN0ZXIgb3IgYWRtaW5zIGNvdWxk
IHVzZSByZW5kZXJpbmcgbm9uZSBvZiB0aGUNCnJlZ3VsYXIgYWNjZWxlcmF0ZWQgKGUuZy4gT3Bl
bkdMKSBhcHBzIHdvdWxkIHdvcmsuDQoNCj4gPiBBcyB0byB0aGUgc3RhY2sgdHJhY2UsIEknbSBu
b3Qgc3VyZSB3aGF0IGtlcm5lbCB5b3Ugd2VyZSB0ZXN0aW5nIGl0IG9uIHNvIEkNCj4gPiBkb24n
dA0KPiA+IGhhdmUgYWNjZXNzIHRvIHRoZSBmdWxsIGxvZyBidXQgSSBjYW4ndCByZXByb2R1Y2Ug
aXQgYW5kIHRoZXJlIHdhcyBhIGNoYW5nZQ0KPiA+IGZpeGluZw0KPiA+IGV4YWN0bHkgdGhpcyAo
aS5lLiBidWZmZXIgZmFpbGVkIGFsbG9jYXRpb24gYnV0IHdlIHdlcmUgc3RpbGwgYWNjZXNzaW5n
IGl0KSB0aGF0DQo+ID4gd2FzDQo+ID4gZml4ZWQgaW4gaW4gNi4yIGluIGNvbW1pdCAxYTY4OTc5
MjFmNTIgKCJkcm0vdm13Z2Z4OiBTdG9wIGFjY2Vzc2luZyBidWZmZXINCj4gPiBvYmplY3RzDQo+
ID4gd2hpY2ggZmFpbGVkIGluaXQiKSB0aGUgY2hhbmdlIHdhcyBiYWNrcG9ydGVkIGFzIHdlbGws
IHNvIHlvdSBzaG91bGQgYmUgYWJsZSB0bw0KPiA+IHZlcmlmeSBvbiBhbnkga2VybmVsIHdpdGgg
aXQuDQo+ID4gDQo+ID4geg0KPiA+IA0KPiBUaGFuayB5b3UsIHRoZSBrZXJuZWwgdmVyc2lvbiBv
ZiBteSBlbnZpcm9ubWVudCBpcyBsb3dlciB0aGFuIDYuMiwgSSANCj4gd2lsbCB2ZXJpZnkgb24g
bXkga2VybmVsIHdpdGggY29tbWl0IDFhNjg5NzkyMWY1MiAoImRybS92bXdnZng6IFN0b3AgDQo+
IGFjY2Vzc2luZyBidWZmZXIgb2JqZWN0cyB3aGljaCBmYWlsZWQgaW5pdCIpLg0KDQpHcmVhdC4g
TGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55IHByb2JsZW1zIHdpdGggaXQuDQoNCnoNCg==
