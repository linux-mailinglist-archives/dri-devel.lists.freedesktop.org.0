Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F085DA7F8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 11:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C216EA10;
	Thu, 17 Oct 2019 09:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D469A6E457;
 Thu, 17 Oct 2019 09:04:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyNlvurYFNRt4liL5AlGidna/k3yKp77F+uwpT+Swzmdzdfz8Qxt5fbJPx+mt09L26qNB94IgILbKu0y++ufV/i0+tztthfqr+/GUsKTU+lujP3C2V0NJqbjjz9CflRpGBWSPEWem092GDrcKQjwRwaVAzqtU0hcao54RF1Ud73vws8tKguTq4bT1YtMBIUQBFHyFazTJ7UigG1Jn5JgIan8rs6KoM2HVaWOeJg0Fa3PBSg+Uo5tozCafkk8FiTMXVy7yCBzDr/TCk4SHymuvHIItgtpRjIpg3LSxaLZJPPc+W7OGm8yF9GLPhC3L3g8n2ydslLavFfXyCpsezm9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RVn9BecBcCpB1vN6FOVhwyN6J9ad7tifIWRTxIcakk=;
 b=KbBo+4YeaVAWSY34ipm0B2hx3MfHZLFlFuxdojKuUBa2HjEzsn3HcFGLhvAGpO8Y5srTy8oozqzci4UM7TJWI+84lunxvLuoOq/r5A+BvzusE1PiAfTYrUPBxjt4jQxpeZ+txC+cIXy+Nr5iXvfjRGRpWvhi6tMRo/LQH0ittpkKwzwakFBpH1zDvL5vqEPvP3EA0KOTdjg1m4Vaob4g4GRzaYuoMo285pjRKkUpZ/KJyHJSdcv+sM8RMKAlDgvKobO/hagMIcCgQHDQBqhAIo45EkQtrz9WLXcH8szXJPLxe/DBdt4T7u0TnK8CNmQPdhwt1xwhYPECYJAdXZv1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2581.namprd12.prod.outlook.com (52.132.140.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Thu, 17 Oct 2019 09:04:18 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.023; Thu, 17 Oct
 2019 09:04:18 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Thread-Topic: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Thread-Index: AQHVbVPkWzky0N2Xn0SoVd76Go5NWKcvz5eAgAAJGwCAAAL9AIAABfgAgAARP4CAAAK6gIAKqtQAgAx+LwCACXMKgIAM48yAgAAKfYCAATkUAA==
Date: Thu, 17 Oct 2019 09:04:18 +0000
Message-ID: <cd21dad5-bab3-94b2-0636-6d7f482d4229@amd.com>
References: <88f748d2-43de-ae2a-b895-40d8b3be5c78@gmail.com>
 <20190917123150.GM3958@phenom.ffwll.local>
 <da55aa8d-f2b8-0428-ed22-23dc17f71d77@amd.com>
 <20190917131320.GU3958@phenom.ffwll.local>
 <e0e50037-df08-86e3-e8b2-768683e5cce0@amd.com>
 <20190917134524.GY3958@phenom.ffwll.local>
 <7de46ca8-8cb5-d545-42ad-6a7cb4cf753a@amd.com>
 <CAKMK7uFc6CKyF-dW6FE7Hzdz5La7N265DZu_PR7=rKXFjg4QBw@mail.gmail.com>
 <97bb8f03-7fa3-6e61-a1ff-0ffcadbc1a39@amd.com>
 <be8abe51-05f5-bd06-2633-0d32828e0e43@amd.com>
 <20191008085543.GF16989@phenom.ffwll.local>
 <511490ca-4370-6e31-8c73-13fbe3f9d893@amd.com>
 <CAKMK7uF4vp5=Qs3QkQFKs1-ef9nG4XZFBkasbWn4N_7R4OpUbA@mail.gmail.com>
In-Reply-To: <CAKMK7uF4vp5=Qs3QkQFKs1-ef9nG4XZFBkasbWn4N_7R4OpUbA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR05CA0095.eurprd05.prod.outlook.com
 (2603:10a6:207:1::21) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1518aaa4-8ad4-47ce-673b-08d752e0fe19
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2581:
x-microsoft-antispam-prvs: <DM5PR12MB258170B8375738330B06546B836D0@DM5PR12MB2581.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(189003)(199004)(31696002)(102836004)(86362001)(6436002)(46003)(25786009)(6246003)(4326008)(6116002)(186003)(53546011)(66574012)(229853002)(52116002)(6486002)(6512007)(386003)(65956001)(5660300002)(65806001)(6506007)(76176011)(99286004)(256004)(71190400001)(14454004)(8936002)(14444005)(5024004)(486006)(71200400001)(305945005)(7736002)(6916009)(2906002)(476003)(81166006)(81156014)(8676002)(54906003)(66556008)(58126008)(66476007)(66946007)(64756008)(66446008)(2616005)(478600001)(36756003)(11346002)(446003)(31686004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2581;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s9dbmZIAYiH72QIzu1gcC5ocY1kYGYRh0a1ZATJg30G0cPKY/vag8Un6xxrRPF0Q/1mSzm3n05F7rs7x/J+ASHV/x6IWjlBFhWxEGlWkUQeYUcp6R+2vcR/hEFKARV824v5sED84jO4b3p8vJXbFTtrgoWR2ikrl94+LWgPJGFXnSTT+4oy8Yx7OL4LdeF8B3kH0sVQKliLN8t39mRPkVHuMomktx3rbsA8qkU+r1nk2jLnSMsvDc0ZSn+YL0NriqJTQ69wzSJfugqNiZqUhh3PeUXEzBVDtcjGa8zLT6rbTknLl8NJbLndP4MLQh7VqNhmWdhLqOvWNG91iutuTac/pH+Am4jT3umoUBKkgBxyaO7zigsdGpO8WiXdHUqagK9wtslWvbR6xOpbIHwiwAG4HyrzlUczQt9hIXMpCzsE=
x-ms-exchange-transport-forked: True
Content-ID: <C912680D3F90F0479BF11D50C01C1251@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1518aaa4-8ad4-47ce-673b-08d752e0fe19
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 09:04:18.7163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ns0cn8EbI86wgP9GUmKyE+YQlxgrf5PPIVa+RI/D8TRT+GGAKeb2oFxdQfBVv9jJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2581
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RVn9BecBcCpB1vN6FOVhwyN6J9ad7tifIWRTxIcakk=;
 b=JbUHEm6AgGxGKiCvW4C1yYgEfRnGOFuwwAjUsiiws6n591R7fPHCqZM0QQVDQ9ZE12OWtPy3ihIQhEzTW1DRRNXUpyngTTCGy4C1r0vTEdgYUL70V8Jg600tWTs0ugWKYysF0TbzZAnhZTPOsBIEHKHfnzao/iH3bnE8mXj3a50=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMTAuMTkgdW0gMTY6MjMgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBXZWQsIE9j
dCAxNiwgMjAxOSBhdCAzOjQ2IFBNIEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20+IHdyb3RlOg0KPj4gQW0gMDguMTAuMTkgdW0gMTA6NTUgc2NocmllYiBEYW5p
ZWwgVmV0dGVyOg0KPj4+IE9uIFdlZCwgT2N0IDAyLCAyMDE5IGF0IDA4OjM3OjUwQU0gKzAwMDAs
IEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4+PiBIaSBEYW5pZWwsDQo+Pj4+DQo+Pj4+IG9u
Y2UgbW9yZSBhIHBpbmcgb24gdGhpcy4gQW55IG1vcmUgY29tbWVudHMgb3IgY2FuIHdlIGdldCBp
dCBjb21pdHRlZD8NCj4+PiBTb3JyeSBnb3QgYSBiaXQgc21hc2hlZCBwYXN0IHdlZWtzLCBidXQg
c2hvdWxkIGJlIHJlc3VycmVjdGVkIG5vdyBiYWNrDQo+Pj4gZnJvbSB4ZGMuDQo+PiBBbmQgYW55
IG1vcmUgdGhvdWdodHMgb24gdGhpcz8gSSBtZWFuIHdlIGFyZSBibG9ja2VkIGZvciBtb250aCBv
biB0aGlzDQo+PiBub3cgOigNCj4gSSByZXBsaWVkIHRvIGJvdGggMSBhbmQgMiBpbiB0aGlzIHNl
cmllcyBvbiA4dGggT2N0LiBZb3UgZXZlbiByZXBsaWVkDQo+IHRvIG1lIGluIHRoZSB0aHJlYWQg
b24gcGF0Y2ggMiAuLi4gYnV0IG5vdCBoZXJlIChJIHRvcCBwb3N0ZWQgc2luY2UNCj4gdGhpcyBk
ZXRvdXIgaGVyZSBqdXN0IG1lIGJlaW5nIGNvbmZ1c2VkKS4NCg0KT2ssIGluIHRoaXMgY2FzZSBp
dHMgbXkgZmF1bHQuIEkgdG90YWxseSBtaXNzZWQgeW91ciByZXBseSBvbiAxIGFuZCANCnRob3Vn
aHQgdGhhdCB0aGUgcmVwbHkgb24gMiB3YXMgYWN0dWFsbHkgZm9yIGEgZGlmZmVyZW50IHRocmVh
ZC4NCg0KSSdtIGdvaW5nIHRvIHN1Ym1pdCB0aGUgVFRNIGNoYW5nZXMgc2VwYXJhdGVseSwgY2F1
c2UgdGhhdCBpcyBhY3R1YWxseSBhIA0KYnVnIGZpeCBmb3IgYSBjb21wbGV0ZWx5IGRpZmZlcmVu
dCBpc3N1ZSB3aGljaCBqdXN0IGhhcHBlbnMgdG8gc3VyZmFjZSANCmJlY2F1c2Ugd2UgY2hhbmdl
IHRoZSBsb2NraW5nLg0KDQpUaGFua3MsDQpDaHJpc3RpYW4uDQoNCj4gLURhbmllbA0KPg0KPj4g
VGhhbmtzLA0KPj4gQ2hyaXN0aWFuLg0KPj4NCj4+PiAtRGFuaWVsDQo+Pj4+IFRoYW5rcywNCj4+
Pj4gQ2hyaXN0aWFuLg0KPj4+Pg0KPj4+PiBBbSAyNC4wOS4xOSB1bSAxMTo1MCBzY2hyaWViIENo
cmlzdGlhbiBLw7ZuaWc6DQo+Pj4+PiBBbSAxNy4wOS4xOSB1bSAxNjo1NiBzY2hyaWViIERhbmll
bCBWZXR0ZXI6DQo+Pj4+Pj4gW1NOSVBdDQo+Pj4+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgKyAgICAv
KiBXaGVuIGVpdGhlciB0aGUgaW1wb3J0ZXIgb3IgdGhlIGV4cG9ydGVyDQo+Pj4+Pj4+Pj4+Pj4+
Pj4+IGNhbid0IGhhbmRsZSBkeW5hbWljDQo+Pj4+Pj4+Pj4+Pj4+Pj4+ICsgICAgICogbWFwcGlu
Z3Mgd2UgY2FjaGUgdGhlIG1hcHBpbmcgaGVyZSB0byBhdm9pZCBpc3N1ZXMNCj4+Pj4+Pj4+Pj4+
Pj4+Pj4gd2l0aCB0aGUNCj4+Pj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgKiByZXNlcnZhdGlvbiBvYmpl
Y3QgbG9jay4NCj4+Pj4+Pj4+Pj4+Pj4+Pj4gKyAgICAgKi8NCj4+Pj4+Pj4+Pj4+Pj4+Pj4gKyAg
ICBpZiAoZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMoYXR0YWNoKSAhPQ0KPj4+Pj4+Pj4+
Pj4+Pj4+PiArICAgICAgICBkbWFfYnVmX2lzX2R5bmFtaWMoZG1hYnVmKSkgew0KPj4+Pj4+Pj4+
Pj4+Pj4+PiArICAgICAgICBzdHJ1Y3Qgc2dfdGFibGUgKnNndDsNCj4+Pj4+Pj4+Pj4+Pj4+Pj4g
Kw0KPj4+Pj4+Pj4+Pj4+Pj4+PiArICAgICAgICBpZiAoZG1hX2J1Zl9pc19keW5hbWljKGF0dGFj
aC0+ZG1hYnVmKSkNCj4+Pj4+Pj4+Pj4+Pj4+Pj4gKyBkbWFfcmVzdl9sb2NrKGF0dGFjaC0+ZG1h
YnVmLT5yZXN2LCBOVUxMKTsNCj4+Pj4+Pj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+Pj4+Pj4+PiAr
ICAgICAgICBzZ3QgPSBkbWFidWYtPm9wcy0+bWFwX2RtYV9idWYoYXR0YWNoLA0KPj4+Pj4+Pj4+
Pj4+Pj4+PiBETUFfQklESVJFQ1RJT05BTCk7DQo+Pj4+Pj4+Pj4+Pj4+Pj4gTm93IHdlJ3JlIGJh
Y2sgdG8gZW5mb3JjaW5nIERNQV9CSURJLCB3aGljaCB3b3JrcyBuaWNlbHkNCj4+Pj4+Pj4+Pj4+
Pj4+PiBhcm91bmQgdGhlDQo+Pj4+Pj4+Pj4+Pj4+Pj4gbG9ja2luZyBwYWluLCBidXQgYXBwYXJl
bnRseSB1cHNldHMgdGhlIGFybS1zb2MgZm9sa3Mgd2hvDQo+Pj4+Pj4+Pj4+Pj4+Pj4gd2FudCB0
bw0KPj4+Pj4+Pj4+Pj4+Pj4+IGNvbnRyb2wNCj4+Pj4+Pj4+Pj4+Pj4+PiB0aGlzIGJldHRlci4N
Cj4+Pj4+Pj4+Pj4+Pj4+IFRha2UgYW5vdGhlciBsb29rIGF0IGRtYV9idWZfbWFwX2F0dGFjaG1l
bnQoKSwgd2Ugc3RpbGwgdHJ5DQo+Pj4+Pj4+Pj4+Pj4+PiB0byBnZXQgdGhlDQo+Pj4+Pj4+Pj4+
Pj4+PiBjYWNoaW5nIHRoZXJlIGZvciBBUk0uDQo+Pj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+
Pj4gV2hhdCB3ZSBkbyBoZXJlIGlzIHRvIGJpZGlyZWN0aW9uYWxseSBtYXAgdGhlIGJ1ZmZlciB0
byBhdm9pZA0KPj4+Pj4+Pj4+Pj4+Pj4gdGhlDQo+Pj4+Pj4+Pj4+Pj4+PiBsb2NraW5nIGh5ZHJh
IHdoZW4gaW1wb3J0ZXIgYW5kIGV4cG9ydGVyIGRpc2FncmVlIG9uIGxvY2tpbmcuDQo+Pj4+Pj4+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+Pj4gU28gdGhlIEFSTSBmb2xrcyBjYW4gZWFzaWx5IGF2b2lk
IHRoYXQgYnkgc3dpdGNoaW5nIHRvDQo+Pj4+Pj4+Pj4+Pj4+PiBkeW5hbWljIGxvY2tpbmcNCj4+
Pj4+Pj4+Pj4+Pj4+IGZvciBib3RoLg0KPj4+Pj4+Pj4+Pj4+IFNvIHlvdSBzdGlsbCBicmVhayB0
aGUgY29udHJhY3QgYmV0d2VlbiBpbXBvcnRlciBhbmQgZXhwb3J0ZXIsDQo+Pj4+Pj4+Pj4+Pj4g
ZXhjZXB0IG5vdA0KPj4+Pj4+Pj4+Pj4+IGZvciBhbnl0aGluZyB0aGF0J3MgcnVuIGluIGludGVs
LWdmeC1jaSBzbyBhbGwgaXMgZ29vZD8NCj4+Pj4+Pj4+Pj4+IE5vLCB0aGUgY29udHJhY3QgYmV0
d2VlbiBpbXBvcnRlciBhbmQgZXhwb3J0ZXIgc3RheXMgZXhhY3RseSB0aGUNCj4+Pj4+Pj4+Pj4+
IHNhbWUgaXQNCj4+Pj4+Pj4+Pj4+IGlzIGN1cnJlbnRseSBhcyBsb25nIGFzIHlvdSBkb24ndCBz
d2l0Y2ggdG8gZHluYW1pYyBkbWEtYnVmDQo+Pj4+Pj4+Pj4+PiBoYW5kbGluZy4NCj4+Pj4+Pj4+
Pj4+DQo+Pj4+Pj4+Pj4+PiBUaGVyZSBpcyBubyBmdW5jdGlvbmFsIGNoYW5nZSBmb3IgdGhlIEFS
TSBmb2xrcyBoZXJlLiBUaGUgb25seQ0KPj4+Pj4+Pj4+Pj4gY2hhbmdlDQo+Pj4+Pj4+Pj4+PiB3
aGljaCB0YWtlcyBlZmZlY3QgaXMgYmV0d2VlbiBpOTE1IGFuZCBhbWRncHUgYW5kIHRoYXQgaXMg
cGVyZmVjdGx5DQo+Pj4+Pj4+Pj4+PiBjb3ZlcmVkIGJ5IGludGVsLWdmeC1jaS4NCj4+Pj4+Pj4+
Pj4gVGhlcmUncyBwZW9wbGUgd2hvIHdhbnQgdG8gcnVuIGFtZGdwdSBvbiBBUk0/DQo+Pj4+Pj4+
Pj4gU3VyZSB0aGVyZSBhcmUsIHdlIGV2ZW4gcmVjZW50bHkgZml4ZWQgc29tZSBidWdzIGZvciB0
aGlzLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4gQnV0IGFzIGZhciBhcyBJIGtub3cgdGhlcmUgaXMg
bm8gb25lIGN1cnJlbnRseSB3aGljaCBpcyBhZmZlY3QgYnkNCj4+Pj4+Pj4+PiB0aGlzDQo+Pj4+
Pj4+Pj4gY2hhbmdlIG9uIEFSTSB3aXRoIGFtZGdwdS4NCj4+Pj4+Pj4+IEJ1dCBkb24ndCB5b3Ug
YnJlYWsgdGhlbSB3aXRoIHRoaXMgbm93Pw0KPj4+Pj4+PiBObywgd2Ugc2VlIHRoZSBiaWRpcmVj
dGlvbmFsIGF0dGFjaG1lbnQgYXMgY29tcGF0aWJsZSB3aXRoIHRoZSBvdGhlcg0KPj4+Pj4+PiBv
bmVzLg0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gYW1kZ3B1IHdpbGwgc29vbiBzZXQgdGhlIGR5bmFtaWMg
ZmxhZyBvbiBleHBvcnRzLCB3aGljaCBmb3JjZXMgdGhlDQo+Pj4+Pj4+PiBjYWNoaW5nDQo+Pj4+
Pj4+PiBhdCBjcmVhdGUgdGltZSAodG8gYXZvaWQgdGhlIGxvY2tpbmcgZnVuKSwgd2hpY2ggd2ls
bCB0aGVuIHJlc3VsdCBpbiBhDQo+Pj4+Pj4+PiBFQlVTWSBhdCBtYXBfYXR0YWNobWVudCB0aW1l
IGJlY2F1c2Ugd2UgaGF2ZSBhIGNhY2hlZCBtYXBwaW5nLCBidXQNCj4+Pj4+Pj4+IGl0J3MNCj4+
Pj4+Pj4+IHRoZSB3cm9uZyB0eXBlLg0KPj4+Pj4+PiBTZWUgdGhlIGNoZWNrIGluIGRtYV9idWZf
bWFwX2F0dGFjaG1lbnQoKToNCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgICAgICBpZiAoYXR0YWNoLT5k
aXIgIT0gZGlyZWN0aW9uICYmIGF0dGFjaC0+ZGlyICE9IERNQV9CSURJUkVDVElPTkFMKQ0KPj4+
Pj4+PiAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRUJVU1kpOw0KPj4+Pj4+IEhtLCBJIG1p
c3JlYWQgdGhpcy4gU28geWVhaCBzaG91bGQgd29yaywgKy8tIHRoZSBpc3N1ZSB0aGF0IHdlIG1p
Z2h0DQo+Pj4+Pj4gbm90IGZsdXNoIGVub3VnaC4gQnV0IEkgZ3Vlc3MgdGhhdCBjYW4gYmUgZml4
ZWQgd2hlbmV2ZXIsIGl0J3Mgbm90DQo+Pj4+Pj4gbGlrZSBkbWEtYXBpIHNlbWFudGljcyBhcmUg
YSBncmVhdCBmaXQgZm9yIHVzLiBNYXliZSBhIGZpeG1lIGNvbW1lbnQNCj4+Pj4+PiB3b3VsZCBi
ZSB1c2VmdWwgaGVyZSAuLi4gSSdsbCBsb29rIGF0IHRoaXMgdG9tb3Jyb3cgb3Igc28gYmVjYXVz
ZSBhdG0NCj4+Pj4+PiBicmFpbiBpcyBzbG93LCBJJ20gZG93biB3aXRoIHRoZSB1c3VhbCBwb3N0
LWNvbmZlcmVuY2UgY29sZCBpdCBzZWVtcw0KPj4+Pj4+IDotLw0KPj4+Pj4gSG9wZSB5b3VyIGFy
ZSBmZWVsaW5nIGJldHRlciBub3csIGFkZGluZyBhIGNvbW1lbnQgaXMgb2YgY291cnNlIG5vdCBh
DQo+Pj4+PiBwcm9ibGVtLg0KPj4+Pj4NCj4+Pj4+IFdpdGggdGhhdCBmaXhlZCBjYW4gSSBnZXQg
YW4gcmV2aWV3ZWQtYnkgb3IgYXQgbGVhc3QgYW5kIGFja2VkLWJ5Pw0KPj4+Pj4NCj4+Pj4+IEkg
d2FudCB0byBsYW5kIGF0IGxlYXN0IHNvbWUgcGFydHMgb2YgdGhvc2UgY2hhbmdlcyBub3cuDQo+
Pj4+Pg0KPj4+Pj4gUmVnYXJkcywNCj4+Pj4+IENocmlzdGlhbi4NCj4+Pj4+DQo+Pj4+Pj4gLURh
bmllbA0KPj4+Pj4+DQo+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
