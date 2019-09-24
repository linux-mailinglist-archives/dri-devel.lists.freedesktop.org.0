Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59FCBC536
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 11:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0E58984D;
	Tue, 24 Sep 2019 09:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760071.outbound.protection.outlook.com [40.107.76.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BB08984D;
 Tue, 24 Sep 2019 09:51:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHxQDnxY5NcMfRaNpnKihQKPY2A8Rg6jJCzapjTNBDGs+dpra9aZjR/QmkmQ/WwNMXWl9hoEkItkq2eNGf5TAgPu6Cmi3C9mjmkiWv0xQc2aA8He//Jcs640gIm/cZDarOpDWo4F5/ZgI2sr6ImvW3LBS8rWJSSSdDqB6fr/3+HYZY5WF+DgX3MV4Capvkz090iC7Bzb1owNY/22eH+946Sn6gCL669Rsz5pf/oRW1wsaBSfY4VQ0VXPrztfMi948FEtwaJo3hqHfKycJG2VAztVz18dV4Z//HXWmX+zEVvT/T1IXI8CgMVHB3qxJyKsTHU+eU8kkR/8V0S5r16pNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOoq4+1ZqghsPIt2gDgHuj2WGGOEj/CX+6bjQif9Bk8=;
 b=ULqUnllvzCMhL2RZRlKBejrTItFnwhgHzBDCO2KL7Gg72l08d4KM0Kxh2q8VLuYzVZVi0FWkzQJe0JwDsZzlWSXqbZqaPkjCzbUslKJa/OrShlbe2JO4/clVpPMAaGKMMx+bjuMk/zZ+m/FqEfqSvY+So24E7mRlTCSZ6rh/ymM4CV2m28jpcV6pHf7YABHZp8hZFLkotfBKWZ2wa81IVN2ubraUaLwGdbnI+e+F2SjN6Boh1jse2fzrk18sN2jkafZwk6S9zlKXQ16GnHQQJHB2C3Xq69jRsbg+WDawZkerZiNsSMrjQdKcoTigzHtzH4KvJ6Mx9stTTt/B3+wplA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1900.namprd12.prod.outlook.com (10.175.89.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 09:51:01 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 09:51:01 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Thread-Topic: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Thread-Index: AQHVbVPkWzky0N2Xn0SoVd76Go5NWKcvz5eAgAAJGwCAAAL9AIAABfgAgAARP4CAAAK6gIAKqtQA
Date: Tue, 24 Sep 2019 09:51:01 +0000
Message-ID: <97bb8f03-7fa3-6e61-a1ff-0ffcadbc1a39@amd.com>
References: <20190829142917.13058-1-christian.koenig@amd.com>
 <20190829142917.13058-2-christian.koenig@amd.com>
 <20190903080522.GM2112@phenom.ffwll.local>
 <cd5acbac-73a4-a51a-4383-2c7517e7c180@gmail.com>
 <88f748d2-43de-ae2a-b895-40d8b3be5c78@gmail.com>
 <20190917123150.GM3958@phenom.ffwll.local>
 <da55aa8d-f2b8-0428-ed22-23dc17f71d77@amd.com>
 <20190917131320.GU3958@phenom.ffwll.local>
 <e0e50037-df08-86e3-e8b2-768683e5cce0@amd.com>
 <20190917134524.GY3958@phenom.ffwll.local>
 <7de46ca8-8cb5-d545-42ad-6a7cb4cf753a@amd.com>
 <CAKMK7uFc6CKyF-dW6FE7Hzdz5La7N265DZu_PR7=rKXFjg4QBw@mail.gmail.com>
In-Reply-To: <CAKMK7uFc6CKyF-dW6FE7Hzdz5La7N265DZu_PR7=rKXFjg4QBw@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::25) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 384dbb7a-e3f5-414e-9249-08d740d4b4fc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1900; 
x-ms-traffictypediagnostic: DM5PR12MB1900:
x-microsoft-antispam-prvs: <DM5PR12MB19003D2E8A189BCCAEFFE99783840@DM5PR12MB1900.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(199004)(189003)(71190400001)(66446008)(6436002)(71200400001)(6246003)(7736002)(46003)(305945005)(4326008)(81156014)(66476007)(6512007)(6486002)(64756008)(65806001)(8676002)(66946007)(65956001)(81166006)(66556008)(5660300002)(186003)(25786009)(102836004)(14444005)(229853002)(2906002)(8936002)(6116002)(54906003)(58126008)(99286004)(6916009)(5024004)(316002)(14454004)(31686004)(2616005)(11346002)(446003)(476003)(256004)(31696002)(36756003)(486006)(76176011)(52116002)(6506007)(478600001)(386003)(86362001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1900;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R+valivIUKw/Ry3ZDElgvZkjGLK9XqYtItKc33g65oEboEqG2Ci+4GXZgWQkhsaQbAUIabnzGQDXd5hsXEctbDAzP7CN0eq2+Pb6GrRkm/EVSaDVy5Ny4H1+wVge5/s57/ssGQfZSKOxKRrixs9UFao12vU3oo2xp+rjhPLRIgHSXsv27yfcFvIe/bAotaziDD646jQdk1z+XHCgJRUrh6d/okubvzpQ87qHPvg2BfdM8+hJKtwiYAqMl2kWWYxvA4ddUHv+TGGtghBhJjDvJaEHzcExLke12nkYxCtQjlfA9UAE80FtZkmkc1eiXyv6dFLGf5flDp+wgf81aQ+N/o0J1MaamH26u1V5MFvw6Pp6j1C3YWH1I7d+4oEsAATL/7OQk5qD10IYrAHMRCSNIVR05ydbWzSzGHcgT0K5QfA=
x-ms-exchange-transport-forked: True
Content-ID: <B85A100AA3409E499659D9B1E85120CD@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 384dbb7a-e3f5-414e-9249-08d740d4b4fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 09:51:01.5258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQNCf1eHw/UsfV0MgkV1tmeqdKuT2411VqKSaQppAeHFDjK5HKjTkZuo+HV1mWHK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1900
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOoq4+1ZqghsPIt2gDgHuj2WGGOEj/CX+6bjQif9Bk8=;
 b=ToILAGoe8cmeIK/5sOFWX/FwspJUQ11r7FA1V1DvU9PPjWYNB0i1F130evY2Eo/OjYbD9HHLEkCjpMhqOsV4KDkZMjYr9Fp8YFi2zInrGlRlrfTmsyYr1FUOitoxCgxG/C8QWmmErOZ9L5sPT5nb+GMGQcFf8ZGDnP29Vl9nJdQ=
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

QW0gMTcuMDkuMTkgdW0gMTY6NTYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBbU05JUF0NCj4+
Pj4+Pj4+Pj4+ICAgICAgICsgICAgLyogV2hlbiBlaXRoZXIgdGhlIGltcG9ydGVyIG9yIHRoZSBl
eHBvcnRlciBjYW4ndCBoYW5kbGUgZHluYW1pYw0KPj4+Pj4+Pj4+Pj4gKyAgICAgKiBtYXBwaW5n
cyB3ZSBjYWNoZSB0aGUgbWFwcGluZyBoZXJlIHRvIGF2b2lkIGlzc3VlcyB3aXRoIHRoZQ0KPj4+
Pj4+Pj4+Pj4gKyAgICAgKiByZXNlcnZhdGlvbiBvYmplY3QgbG9jay4NCj4+Pj4+Pj4+Pj4+ICsg
ICAgICovDQo+Pj4+Pj4+Pj4+PiArICAgIGlmIChkbWFfYnVmX2F0dGFjaG1lbnRfaXNfZHluYW1p
YyhhdHRhY2gpICE9DQo+Pj4+Pj4+Pj4+PiArICAgICAgICBkbWFfYnVmX2lzX2R5bmFtaWMoZG1h
YnVmKSkgew0KPj4+Pj4+Pj4+Pj4gKyAgICAgICAgc3RydWN0IHNnX3RhYmxlICpzZ3Q7DQo+Pj4+
Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4+PiArICAgICAgICBpZiAoZG1hX2J1Zl9pc19keW5hbWljKGF0
dGFjaC0+ZG1hYnVmKSkNCj4+Pj4+Pj4+Pj4+ICsgICAgICAgICAgICBkbWFfcmVzdl9sb2NrKGF0
dGFjaC0+ZG1hYnVmLT5yZXN2LCBOVUxMKTsNCj4+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4+ICsg
ICAgICAgIHNndCA9IGRtYWJ1Zi0+b3BzLT5tYXBfZG1hX2J1ZihhdHRhY2gsIERNQV9CSURJUkVD
VElPTkFMKTsNCj4+Pj4+Pj4+Pj4gTm93IHdlJ3JlIGJhY2sgdG8gZW5mb3JjaW5nIERNQV9CSURJ
LCB3aGljaCB3b3JrcyBuaWNlbHkgYXJvdW5kIHRoZQ0KPj4+Pj4+Pj4+PiBsb2NraW5nIHBhaW4s
IGJ1dCBhcHBhcmVudGx5IHVwc2V0cyB0aGUgYXJtLXNvYyBmb2xrcyB3aG8gd2FudCB0bw0KPj4+
Pj4+Pj4+PiBjb250cm9sDQo+Pj4+Pj4+Pj4+IHRoaXMgYmV0dGVyLg0KPj4+Pj4+Pj4+IFRha2Ug
YW5vdGhlciBsb29rIGF0IGRtYV9idWZfbWFwX2F0dGFjaG1lbnQoKSwgd2Ugc3RpbGwgdHJ5IHRv
IGdldCB0aGUNCj4+Pj4+Pj4+PiBjYWNoaW5nIHRoZXJlIGZvciBBUk0uDQo+Pj4+Pj4+Pj4NCj4+
Pj4+Pj4+PiBXaGF0IHdlIGRvIGhlcmUgaXMgdG8gYmlkaXJlY3Rpb25hbGx5IG1hcCB0aGUgYnVm
ZmVyIHRvIGF2b2lkIHRoZQ0KPj4+Pj4+Pj4+IGxvY2tpbmcgaHlkcmEgd2hlbiBpbXBvcnRlciBh
bmQgZXhwb3J0ZXIgZGlzYWdyZWUgb24gbG9ja2luZy4NCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IFNv
IHRoZSBBUk0gZm9sa3MgY2FuIGVhc2lseSBhdm9pZCB0aGF0IGJ5IHN3aXRjaGluZyB0byBkeW5h
bWljIGxvY2tpbmcNCj4+Pj4+Pj4+PiBmb3IgYm90aC4NCj4+Pj4+Pj4gU28geW91IHN0aWxsIGJy
ZWFrIHRoZSBjb250cmFjdCBiZXR3ZWVuIGltcG9ydGVyIGFuZCBleHBvcnRlciwgZXhjZXB0IG5v
dA0KPj4+Pj4+PiBmb3IgYW55dGhpbmcgdGhhdCdzIHJ1biBpbiBpbnRlbC1nZngtY2kgc28gYWxs
IGlzIGdvb2Q/DQo+Pj4+Pj4gTm8sIHRoZSBjb250cmFjdCBiZXR3ZWVuIGltcG9ydGVyIGFuZCBl
eHBvcnRlciBzdGF5cyBleGFjdGx5IHRoZSBzYW1lIGl0DQo+Pj4+Pj4gaXMgY3VycmVudGx5IGFz
IGxvbmcgYXMgeW91IGRvbid0IHN3aXRjaCB0byBkeW5hbWljIGRtYS1idWYgaGFuZGxpbmcuDQo+
Pj4+Pj4NCj4+Pj4+PiBUaGVyZSBpcyBubyBmdW5jdGlvbmFsIGNoYW5nZSBmb3IgdGhlIEFSTSBm
b2xrcyBoZXJlLiBUaGUgb25seSBjaGFuZ2UNCj4+Pj4+PiB3aGljaCB0YWtlcyBlZmZlY3QgaXMg
YmV0d2VlbiBpOTE1IGFuZCBhbWRncHUgYW5kIHRoYXQgaXMgcGVyZmVjdGx5DQo+Pj4+Pj4gY292
ZXJlZCBieSBpbnRlbC1nZngtY2kuDQo+Pj4+PiBUaGVyZSdzIHBlb3BsZSB3aG8gd2FudCB0byBy
dW4gYW1kZ3B1IG9uIEFSTT8NCj4+Pj4gU3VyZSB0aGVyZSBhcmUsIHdlIGV2ZW4gcmVjZW50bHkg
Zml4ZWQgc29tZSBidWdzIGZvciB0aGlzLg0KPj4+Pg0KPj4+PiBCdXQgYXMgZmFyIGFzIEkga25v
dyB0aGVyZSBpcyBubyBvbmUgY3VycmVudGx5IHdoaWNoIGlzIGFmZmVjdCBieSB0aGlzDQo+Pj4+
IGNoYW5nZSBvbiBBUk0gd2l0aCBhbWRncHUuDQo+Pj4gQnV0IGRvbid0IHlvdSBicmVhayB0aGVt
IHdpdGggdGhpcyBub3c/DQo+PiBObywgd2Ugc2VlIHRoZSBiaWRpcmVjdGlvbmFsIGF0dGFjaG1l
bnQgYXMgY29tcGF0aWJsZSB3aXRoIHRoZSBvdGhlciBvbmVzLg0KPj4NCj4+PiBhbWRncHUgd2ls
bCBzb29uIHNldCB0aGUgZHluYW1pYyBmbGFnIG9uIGV4cG9ydHMsIHdoaWNoIGZvcmNlcyB0aGUg
Y2FjaGluZw0KPj4+IGF0IGNyZWF0ZSB0aW1lICh0byBhdm9pZCB0aGUgbG9ja2luZyBmdW4pLCB3
aGljaCB3aWxsIHRoZW4gcmVzdWx0IGluIGENCj4+PiBFQlVTWSBhdCBtYXBfYXR0YWNobWVudCB0
aW1lIGJlY2F1c2Ugd2UgaGF2ZSBhIGNhY2hlZCBtYXBwaW5nLCBidXQgaXQncw0KPj4+IHRoZSB3
cm9uZyB0eXBlLg0KPj4gU2VlIHRoZSBjaGVjayBpbiBkbWFfYnVmX21hcF9hdHRhY2htZW50KCk6
DQo+Pg0KPj4gICAgICAgaWYgKGF0dGFjaC0+ZGlyICE9IGRpcmVjdGlvbiAmJiBhdHRhY2gtPmRp
ciAhPSBETUFfQklESVJFQ1RJT05BTCkNCj4+ICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRUJV
U1kpOw0KPiBIbSwgSSBtaXNyZWFkIHRoaXMuIFNvIHllYWggc2hvdWxkIHdvcmssICsvLSB0aGUg
aXNzdWUgdGhhdCB3ZSBtaWdodA0KPiBub3QgZmx1c2ggZW5vdWdoLiBCdXQgSSBndWVzcyB0aGF0
IGNhbiBiZSBmaXhlZCB3aGVuZXZlciwgaXQncyBub3QNCj4gbGlrZSBkbWEtYXBpIHNlbWFudGlj
cyBhcmUgYSBncmVhdCBmaXQgZm9yIHVzLiBNYXliZSBhIGZpeG1lIGNvbW1lbnQNCj4gd291bGQg
YmUgdXNlZnVsIGhlcmUgLi4uIEknbGwgbG9vayBhdCB0aGlzIHRvbW9ycm93IG9yIHNvIGJlY2F1
c2UgYXRtDQo+IGJyYWluIGlzIHNsb3csIEknbSBkb3duIHdpdGggdGhlIHVzdWFsIHBvc3QtY29u
ZmVyZW5jZSBjb2xkIGl0IHNlZW1zDQo+IDotLw0KDQpIb3BlIHlvdXIgYXJlIGZlZWxpbmcgYmV0
dGVyIG5vdywgYWRkaW5nIGEgY29tbWVudCBpcyBvZiBjb3Vyc2Ugbm90IGEgDQpwcm9ibGVtLg0K
DQpXaXRoIHRoYXQgZml4ZWQgY2FuIEkgZ2V0IGFuIHJldmlld2VkLWJ5IG9yIGF0IGxlYXN0IGFu
ZCBhY2tlZC1ieT8NCg0KSSB3YW50IHRvIGxhbmQgYXQgbGVhc3Qgc29tZSBwYXJ0cyBvZiB0aG9z
ZSBjaGFuZ2VzIG5vdy4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPiAtRGFuaWVsDQo+DQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
