Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23BD92D3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 15:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916A46E97F;
	Wed, 16 Oct 2019 13:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489186E402;
 Wed, 16 Oct 2019 13:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPdWFDNBLsTR/RZfaS4d++c3z1XMZmo3idQkWTTmwAHsXxlqOKLjF8P2F5OObBKv/UIBat2yY+UoCcHsqTvlZopqEnabS7sC3c2Y27mI2BTf6Dxwp4t/5IblQf9RC9PmUcFolylO2QOmiqJDdKRe+WIRaz5IgYdtqfL41mu7+Hi8BXSX0ZJAPqQB2Ue4Xf7x1xhhlZTafo0BcvnPglhV0TmH7vUSxO5fktXCXs+6KyCA2YSo1XadDuWIX6tjskU+GuZ3wg5v1OJpLyHn+/DfcsAji0HV1oJcR6XQQMZq4BH/7hyTOxbKSY4urBJHDBcpbB7wYnI4X2cYP+xBimZlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8t4lP2cPA0Zqzu++7YBVIN+OT5H+2Mb1twwvh5AHfE=;
 b=mLbCV6QwZGntt189Mj6uRz9eD9aPxsKUMJMl8lTses4lzd9/5Cu6Kcrg3Z02fh15NGYODDFi4/oXoQR3uLjuZi9gCaeJBMx9xem61WT2ExCRBecVWGBtUMvbFetDuihhpZg6pI9dmA+Wy/b6sgUXKywn7LqwzMIMfMSTTjnWS9hoJeO4+HiGJZbfWCSaEU4D80bbRtREGr+oO8BM21M9I/uxI/1qtIEytMYeHK++zOQhnOdmIPQ7fC7bTC1/Ii0DBidT9v2weQIFG+1dZGS1JwIbJv0TtPzQaQ/iKBHg5i17vs8cNxyhuGfhTUKQGSf2MVKN80GzC5XcfF1js37Qcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1340.namprd12.prod.outlook.com (10.168.238.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Wed, 16 Oct 2019 13:46:16 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.023; Wed, 16 Oct
 2019 13:46:16 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Thread-Topic: [PATCH 1/4] dma-buf: change DMA-buf locking convention
Thread-Index: AQHVbVPkWzky0N2Xn0SoVd76Go5NWKcvz5eAgAAJGwCAAAL9AIAABfgAgAARP4CAAAK6gIAKqtQAgAx+LwCACXMKgIAM48yA
Date: Wed, 16 Oct 2019 13:46:16 +0000
Message-ID: <511490ca-4370-6e31-8c73-13fbe3f9d893@amd.com>
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
In-Reply-To: <20191008085543.GF16989@phenom.ffwll.local>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR05CA0095.eurprd05.prod.outlook.com
 (2603:10a6:208:136::35) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e002787-817e-4c1e-2a55-08d7523f371f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1340:
x-microsoft-antispam-prvs: <DM5PR12MB134016CA5D4309D3B442C91383920@DM5PR12MB1340.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(199004)(189003)(5024004)(316002)(6116002)(256004)(14444005)(31686004)(7736002)(14454004)(305945005)(478600001)(71200400001)(71190400001)(2906002)(66946007)(6436002)(229853002)(8676002)(31696002)(8936002)(81156014)(81166006)(66476007)(66556008)(66446008)(64756008)(6486002)(86362001)(25786009)(186003)(36756003)(6246003)(6512007)(6916009)(102836004)(65956001)(65806001)(66574012)(6506007)(4326008)(386003)(99286004)(76176011)(11346002)(52116002)(446003)(2616005)(58126008)(486006)(5660300002)(476003)(46003)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1340;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rszp62OGkYeVkIOwuSk8MoYngybQ1jEZzPnvAgaO+ykDeiRQcI9h/CugIv7IAspc+YHBzeM96/L56TWXGLPhBfA29bxO3YJr0AkfyvCKAAI0OkDanpFicHQ4BF8SZIFpaTsE5+7r1/7HW8BxaYSxXoCe2xuC6ucpRnJwNpLJ7m+/tKPDSSelCTULWhLxF+no/eUDbvFLYMOOCVNTF5xHy9+iY/GIQQaukFYKxxrwrvuvWcKQqpMP5/YeSIqJUVkuEMSP6n0efEV8ouo4w1cjvUls2LyzV/mIHLbOHndqC7aLEtPiSCI8CtohyRrD7JwARsz9XGp4GgiFG7gUEj21tYmKpr0YIA6hwjKRSBEpSqhg+lu/8aK7iuuTaQ102cDGj9pf8ehSX5LVia4UzltEm9V+T+lTYTEB056B9lDyAFM=
x-ms-exchange-transport-forked: True
Content-ID: <9FF41094360BD0418CBB9F35E6C1B0B7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e002787-817e-4c1e-2a55-08d7523f371f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 13:46:16.0549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xfAlDt+Z5jCO1Tr/ggCBphytGAO30PnJUrg/NAsM8j4DQsF5bz5TwUBzFhOzm4QP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1340
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8t4lP2cPA0Zqzu++7YBVIN+OT5H+2Mb1twwvh5AHfE=;
 b=m1rSE99mpGGJcY20K8Ww8+hZ+UO3ynwgWmFY8B0zy5zeYCxz0D4o7k7Uwmx6/6rzAmMeePhFqL27scYLfzJv2B8r5OSmgap09EnT/6JevPeu1Xn4UAK78JsMsRtgtlwj781Yd3Aul3Zp5jvCwXpGz4Xd2ZLpI+HR9qGPtZdMCqU=
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

QW0gMDguMTAuMTkgdW0gMTA6NTUgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBXZWQsIE9j
dCAwMiwgMjAxOSBhdCAwODozNzo1MEFNICswMDAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToN
Cj4+IEhpIERhbmllbCwNCj4+DQo+PiBvbmNlIG1vcmUgYSBwaW5nIG9uIHRoaXMuIEFueSBtb3Jl
IGNvbW1lbnRzIG9yIGNhbiB3ZSBnZXQgaXQgY29taXR0ZWQ/DQo+IFNvcnJ5IGdvdCBhIGJpdCBz
bWFzaGVkIHBhc3Qgd2Vla3MsIGJ1dCBzaG91bGQgYmUgcmVzdXJyZWN0ZWQgbm93IGJhY2sNCj4g
ZnJvbSB4ZGMuDQoNCkFuZCBhbnkgbW9yZSB0aG91Z2h0cyBvbiB0aGlzPyBJIG1lYW4gd2UgYXJl
IGJsb2NrZWQgZm9yIG1vbnRoIG9uIHRoaXMgDQpub3cgOigNCg0KVGhhbmtzLA0KQ2hyaXN0aWFu
Lg0KDQo+IC1EYW5pZWwNCj4+IFRoYW5rcywNCj4+IENocmlzdGlhbi4NCj4+DQo+PiBBbSAyNC4w
OS4xOSB1bSAxMTo1MCBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6DQo+Pj4gQW0gMTcuMDkuMTkg
dW0gMTY6NTYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPj4+PiBbU05JUF0NCj4+Pj4+Pj4+Pj4+
Pj4+ICDCoMKgwqDCoMKgICvCoMKgwqAgLyogV2hlbiBlaXRoZXIgdGhlIGltcG9ydGVyIG9yIHRo
ZSBleHBvcnRlcg0KPj4+Pj4+Pj4+Pj4+Pj4gY2FuJ3QgaGFuZGxlIGR5bmFtaWMNCj4+Pj4+Pj4+
Pj4+Pj4+ICvCoMKgwqDCoCAqIG1hcHBpbmdzIHdlIGNhY2hlIHRoZSBtYXBwaW5nIGhlcmUgdG8g
YXZvaWQgaXNzdWVzDQo+Pj4+Pj4+Pj4+Pj4+PiB3aXRoIHRoZQ0KPj4+Pj4+Pj4+Pj4+Pj4gK8Kg
wqDCoMKgICogcmVzZXJ2YXRpb24gb2JqZWN0IGxvY2suDQo+Pj4+Pj4+Pj4+Pj4+PiArwqDCoMKg
wqAgKi8NCj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKGRtYV9idWZfYXR0YWNobWVudF9pc19k
eW5hbWljKGF0dGFjaCkgIT0NCj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkbWFfYnVm
X2lzX2R5bmFtaWMoZG1hYnVmKSkgew0KPj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0
cnVjdCBzZ190YWJsZSAqc2d0Ow0KPj4+Pj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGlmIChkbWFfYnVmX2lzX2R5bmFtaWMoYXR0YWNoLT5kbWFidWYpKQ0KPj4+
Pj4+Pj4+Pj4+Pj4gKyBkbWFfcmVzdl9sb2NrKGF0dGFjaC0+ZG1hYnVmLT5yZXN2LCBOVUxMKTsN
Cj4+Pj4+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzZ3QgPSBk
bWFidWYtPm9wcy0+bWFwX2RtYV9idWYoYXR0YWNoLA0KPj4+Pj4+Pj4+Pj4+Pj4gRE1BX0JJRElS
RUNUSU9OQUwpOw0KPj4+Pj4+Pj4+Pj4+PiBOb3cgd2UncmUgYmFjayB0byBlbmZvcmNpbmcgRE1B
X0JJREksIHdoaWNoIHdvcmtzIG5pY2VseQ0KPj4+Pj4+Pj4+Pj4+PiBhcm91bmQgdGhlDQo+Pj4+
Pj4+Pj4+Pj4+IGxvY2tpbmcgcGFpbiwgYnV0IGFwcGFyZW50bHkgdXBzZXRzIHRoZSBhcm0tc29j
IGZvbGtzIHdobw0KPj4+Pj4+Pj4+Pj4+PiB3YW50IHRvDQo+Pj4+Pj4+Pj4+Pj4+IGNvbnRyb2wN
Cj4+Pj4+Pj4+Pj4+Pj4gdGhpcyBiZXR0ZXIuDQo+Pj4+Pj4+Pj4+Pj4gVGFrZSBhbm90aGVyIGxv
b2sgYXQgZG1hX2J1Zl9tYXBfYXR0YWNobWVudCgpLCB3ZSBzdGlsbCB0cnkNCj4+Pj4+Pj4+Pj4+
PiB0byBnZXQgdGhlDQo+Pj4+Pj4+Pj4+Pj4gY2FjaGluZyB0aGVyZSBmb3IgQVJNLg0KPj4+Pj4+
Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4gV2hhdCB3ZSBkbyBoZXJlIGlzIHRvIGJpZGlyZWN0aW9uYWxs
eSBtYXAgdGhlIGJ1ZmZlciB0byBhdm9pZA0KPj4+Pj4+Pj4+Pj4+IHRoZQ0KPj4+Pj4+Pj4+Pj4+
IGxvY2tpbmcgaHlkcmEgd2hlbiBpbXBvcnRlciBhbmQgZXhwb3J0ZXIgZGlzYWdyZWUgb24gbG9j
a2luZy4NCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+IFNvIHRoZSBBUk0gZm9sa3MgY2FuIGVh
c2lseSBhdm9pZCB0aGF0IGJ5IHN3aXRjaGluZyB0bw0KPj4+Pj4+Pj4+Pj4+IGR5bmFtaWMgbG9j
a2luZw0KPj4+Pj4+Pj4+Pj4+IGZvciBib3RoLg0KPj4+Pj4+Pj4+PiBTbyB5b3Ugc3RpbGwgYnJl
YWsgdGhlIGNvbnRyYWN0IGJldHdlZW4gaW1wb3J0ZXIgYW5kIGV4cG9ydGVyLA0KPj4+Pj4+Pj4+
PiBleGNlcHQgbm90DQo+Pj4+Pj4+Pj4+IGZvciBhbnl0aGluZyB0aGF0J3MgcnVuIGluIGludGVs
LWdmeC1jaSBzbyBhbGwgaXMgZ29vZD8NCj4+Pj4+Pj4+PiBObywgdGhlIGNvbnRyYWN0IGJldHdl
ZW4gaW1wb3J0ZXIgYW5kIGV4cG9ydGVyIHN0YXlzIGV4YWN0bHkgdGhlDQo+Pj4+Pj4+Pj4gc2Ft
ZSBpdA0KPj4+Pj4+Pj4+IGlzIGN1cnJlbnRseSBhcyBsb25nIGFzIHlvdSBkb24ndCBzd2l0Y2gg
dG8gZHluYW1pYyBkbWEtYnVmDQo+Pj4+Pj4+Pj4gaGFuZGxpbmcuDQo+Pj4+Pj4+Pj4NCj4+Pj4+
Pj4+PiBUaGVyZSBpcyBubyBmdW5jdGlvbmFsIGNoYW5nZSBmb3IgdGhlIEFSTSBmb2xrcyBoZXJl
LiBUaGUgb25seQ0KPj4+Pj4+Pj4+IGNoYW5nZQ0KPj4+Pj4+Pj4+IHdoaWNoIHRha2VzIGVmZmVj
dCBpcyBiZXR3ZWVuIGk5MTUgYW5kIGFtZGdwdSBhbmQgdGhhdCBpcyBwZXJmZWN0bHkNCj4+Pj4+
Pj4+PiBjb3ZlcmVkIGJ5IGludGVsLWdmeC1jaS4NCj4+Pj4+Pj4+IFRoZXJlJ3MgcGVvcGxlIHdo
byB3YW50IHRvIHJ1biBhbWRncHUgb24gQVJNPw0KPj4+Pj4+PiBTdXJlIHRoZXJlIGFyZSwgd2Ug
ZXZlbiByZWNlbnRseSBmaXhlZCBzb21lIGJ1Z3MgZm9yIHRoaXMuDQo+Pj4+Pj4+DQo+Pj4+Pj4+
IEJ1dCBhcyBmYXIgYXMgSSBrbm93IHRoZXJlIGlzIG5vIG9uZSBjdXJyZW50bHkgd2hpY2ggaXMg
YWZmZWN0IGJ5DQo+Pj4+Pj4+IHRoaXMNCj4+Pj4+Pj4gY2hhbmdlIG9uIEFSTSB3aXRoIGFtZGdw
dS4NCj4+Pj4+PiBCdXQgZG9uJ3QgeW91IGJyZWFrIHRoZW0gd2l0aCB0aGlzIG5vdz8NCj4+Pj4+
IE5vLCB3ZSBzZWUgdGhlIGJpZGlyZWN0aW9uYWwgYXR0YWNobWVudCBhcyBjb21wYXRpYmxlIHdp
dGggdGhlIG90aGVyDQo+Pj4+PiBvbmVzLg0KPj4+Pj4NCj4+Pj4+PiBhbWRncHUgd2lsbCBzb29u
IHNldCB0aGUgZHluYW1pYyBmbGFnIG9uIGV4cG9ydHMsIHdoaWNoIGZvcmNlcyB0aGUNCj4+Pj4+
PiBjYWNoaW5nDQo+Pj4+Pj4gYXQgY3JlYXRlIHRpbWUgKHRvIGF2b2lkIHRoZSBsb2NraW5nIGZ1
biksIHdoaWNoIHdpbGwgdGhlbiByZXN1bHQgaW4gYQ0KPj4+Pj4+IEVCVVNZIGF0IG1hcF9hdHRh
Y2htZW50IHRpbWUgYmVjYXVzZSB3ZSBoYXZlIGEgY2FjaGVkIG1hcHBpbmcsIGJ1dA0KPj4+Pj4+
IGl0J3MNCj4+Pj4+PiB0aGUgd3JvbmcgdHlwZS4NCj4+Pj4+IFNlZSB0aGUgY2hlY2sgaW4gZG1h
X2J1Zl9tYXBfYXR0YWNobWVudCgpOg0KPj4+Pj4NCj4+Pj4+ICDCoMKgwqDCoMKgIGlmIChhdHRh
Y2gtPmRpciAhPSBkaXJlY3Rpb24gJiYgYXR0YWNoLT5kaXIgIT0gRE1BX0JJRElSRUNUSU9OQUwp
DQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKC1FQlVTWSk7DQo+Pj4+
IEhtLCBJIG1pc3JlYWQgdGhpcy4gU28geWVhaCBzaG91bGQgd29yaywgKy8tIHRoZSBpc3N1ZSB0
aGF0IHdlIG1pZ2h0DQo+Pj4+IG5vdCBmbHVzaCBlbm91Z2guIEJ1dCBJIGd1ZXNzIHRoYXQgY2Fu
IGJlIGZpeGVkIHdoZW5ldmVyLCBpdCdzIG5vdA0KPj4+PiBsaWtlIGRtYS1hcGkgc2VtYW50aWNz
IGFyZSBhIGdyZWF0IGZpdCBmb3IgdXMuIE1heWJlIGEgZml4bWUgY29tbWVudA0KPj4+PiB3b3Vs
ZCBiZSB1c2VmdWwgaGVyZSAuLi4gSSdsbCBsb29rIGF0IHRoaXMgdG9tb3Jyb3cgb3Igc28gYmVj
YXVzZSBhdG0NCj4+Pj4gYnJhaW4gaXMgc2xvdywgSSdtIGRvd24gd2l0aCB0aGUgdXN1YWwgcG9z
dC1jb25mZXJlbmNlIGNvbGQgaXQgc2VlbXMNCj4+Pj4gOi0vDQo+Pj4gSG9wZSB5b3VyIGFyZSBm
ZWVsaW5nIGJldHRlciBub3csIGFkZGluZyBhIGNvbW1lbnQgaXMgb2YgY291cnNlIG5vdCBhDQo+
Pj4gcHJvYmxlbS4NCj4+Pg0KPj4+IFdpdGggdGhhdCBmaXhlZCBjYW4gSSBnZXQgYW4gcmV2aWV3
ZWQtYnkgb3IgYXQgbGVhc3QgYW5kIGFja2VkLWJ5Pw0KPj4+DQo+Pj4gSSB3YW50IHRvIGxhbmQg
YXQgbGVhc3Qgc29tZSBwYXJ0cyBvZiB0aG9zZSBjaGFuZ2VzIG5vdy4NCj4+Pg0KPj4+IFJlZ2Fy
ZHMsDQo+Pj4gQ2hyaXN0aWFuLg0KPj4+DQo+Pj4+IC1EYW5pZWwNCj4+Pj4NCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
