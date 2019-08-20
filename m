Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04B964FB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 17:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1086A6E834;
	Tue, 20 Aug 2019 15:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B706E428;
 Tue, 20 Aug 2019 15:45:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxiv2ZAMu7xV2o9+gvX+TFR+TueZU4o/23L9BKhbmvGVIVCqJ4cbIUsBEOaRfUUzl+h0HD9aN3cu4MyjjNbn9LKxtVok80RBZPfExm2q29WIAwu4/hyZoouh3Zip0/4Yllm13tvdHuawyf1xZURbHJ6TXUIF7WNw8y2EsIqd/xzvd0U4u12w9MbLTvep2Vh/GHCdCyJswZ0fcjvV3F3qqMs5na/dfI6AFuQdhXzMx5ssjS3V4YvTQkT1JDlXr5g42YWmF1eE3l+YCIA2OOly206Zz8pitI/GjlwDpCdhAL7fz0bt3j1rvzNANgYQrJBt4V7y+Qox1ZL+tlxrPqCxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brjgd27Tk7jkaWF38NvL6bW+J79CO4WIjYPGfWVU0MU=;
 b=K2NdXrTA8TrI9ByBqV1R81kqYn8DD9lIFuX1B6Lc7bYDn2yx3zWbjZlBUFub8G/HdSnl5SoxV0djxUnSDAb4dzwSFO1lGfJCQGwuHVZXeZWKgIyoAE9yB9LwzgwuzARkiLrjIBFn5BJXNrwUIDdzTt1YNIfonC72tKOcWxfM69x3jFeh26bWsgdZCOqB4lyxaKYQf5VFPpqmFle4ZGx2Vy6QmPQLQYFjQYb8Sp4uTu1jFmTwlS7Wk1+b37nNL3SBCdfMvCq0czXSviOtU9PcMzB+Rug5CSnqn3J6IXZDk7ip31k/PLvFBKpowZEybKYA8F7sKY98G3v5nOL4b0rHQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1753.namprd12.prod.outlook.com (10.175.88.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 15:45:45 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 15:45:45 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
Thread-Topic: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
Thread-Index: AQHVV2cW/tKRttrRtkmgCalTUTQrEacEJaiAgAABZoCAAAN/AIAAAjcAgAABD4A=
Date: Tue, 20 Aug 2019 15:45:44 +0000
Message-ID: <b4b2650d-20b8-7661-f512-640c3a2fd3d7@amd.com>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-4-daniel.vetter@ffwll.ch>
 <38dc4dfe-88f4-ec16-b075-4bd0566c117d@amd.com>
 <CAKMK7uEgdViPJgs4Y32DwrC8-yGpPU+G=zq-T9tgnQeVOkG6mg@mail.gmail.com>
 <be8f3cda-6788-d424-0135-cb232432fad7@amd.com>
 <CAKMK7uGZBujVxW2A4k188d+++cq9R9ppGkOHxmcK_HVuNjevdg@mail.gmail.com>
In-Reply-To: <CAKMK7uGZBujVxW2A4k188d+++cq9R9ppGkOHxmcK_HVuNjevdg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR2P264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::21) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de477d17-c1c6-4016-325f-08d7258576a6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1753; 
x-ms-traffictypediagnostic: DM5PR12MB1753:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB175369EED765628916A41E3783AB0@DM5PR12MB1753.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(199004)(189003)(86362001)(7736002)(2906002)(305945005)(8936002)(81166006)(81156014)(6116002)(65826007)(316002)(11346002)(446003)(58126008)(256004)(476003)(2616005)(6246003)(46003)(486006)(54906003)(8676002)(478600001)(53936002)(14454004)(66946007)(31686004)(66476007)(66556008)(64756008)(66446008)(65806001)(65956001)(52116002)(66574012)(14444005)(36756003)(99286004)(64126003)(71200400001)(71190400001)(6436002)(6916009)(102836004)(386003)(6506007)(6512007)(53546011)(25786009)(186003)(31696002)(4326008)(229853002)(5660300002)(6486002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1753;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tmV/kHNRftiBOScWkT007i7TOzJfcUSXS5INg7Q1NvM38Qc4KjRWFJB4Nc6ovFMf3Q05riEZMjPShq6+RYC8AcyTBko0XkrmWpqVr1KzZ1fL550o/TJo5by/J3Cs2jzG9tbWQCVLDs+8LpwAdXkE+oC1uhEzPY4Bf/ZQIvKZ/ny3OfSiWvHGC3LDmtKYnvtPDNoGyWKjrbFuDpPvdsX6o/Z2H2xivQ63QQ0c2XL1rpWvB+5z9ukBPepOY9Vx1gH82Rt0fJi2kjtRFUPzJkpxQG7g1lnNJCmT2/F6OfKCfHiyhgQuHAfnvNjlZIlI/zNd4KYKNEDyX+RJsVFYDyUsJxrs5GtXCdlrXZ2oW7VFj99Y+HShs5EYH/mb7+RTyB3xrCtAcZ+5V0fED6hZzQq+3BMWRdtu9lpcmpoEgk48fls=
Content-ID: <09940C4A527CA745AB70AC2068388CCC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de477d17-c1c6-4016-325f-08d7258576a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 15:45:44.8975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3d5YZUI5JTPHC/DQ6UbFCwjZLc9RvxFn5HJ/NwQGvEdJHxvNsmYVRYAm3VVZbmtA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1753
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brjgd27Tk7jkaWF38NvL6bW+J79CO4WIjYPGfWVU0MU=;
 b=NmJWg4J/U8aVLJxo25pvts1utEONG+T/5XTC8YYM5+P+EbKDrQSVQ2p7qtEFPNf9raHw5neu+Ev8rXNbc5lI9nQEYdkWwWb+glp0j7sDT9Evrhbja2dlDnK5r7Q5OLqfa4w7ztIJ6Wle4B+DUKiQiH+3yuAQXpgNaInAnsIcPfk=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDguMTkgdW0gMTc6NDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBUdWUsIEF1
ZyAyMCwgMjAxOSBhdCA1OjM0IFBNIEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20+IHdyb3RlOg0KPj4gQW0gMjAuMDguMTkgdW0gMTc6MjEgc2NocmllYiBEYW5p
ZWwgVmV0dGVyOg0KPj4+IE9uIFR1ZSwgQXVnIDIwLCAyMDE5IGF0IDU6MTYgUE0gS29lbmlnLCBD
aHJpc3RpYW4NCj4+PiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4+Pj4gQW0g
MjAuMDguMTkgdW0gMTY6NTMgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPj4+Pj4gV2l0aCBub3V2
ZWF1IGZpeGVkIGFsbCB0dG0tdXNpbmcgZHJpdmVzIGhhdmUgdGhlIGNvcnJlY3QgbmVzdGluZyBv
Zg0KPj4+Pj4gbW1hcF9zZW0gdnMgZG1hX3Jlc3YsIGFuZCB3ZSBjYW4ganVzdCBsb2NrIHRoZSBi
dWZmZXIuDQo+Pj4+Pg0KPj4+Pj4gQXNzdW1pbmcgSSBkaWRuJ3Qgc2NyZXcgdXAgYW55dGhpbmcg
d2l0aCBteSBhdWRpdCBvZiBjb3Vyc2UuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+Pj4+PiBDYzogQ2hyaXN0aWFu
IEtvZW5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPj4+Pj4gQ2M6IEh1YW5nIFJ1aSA8
cmF5Lmh1YW5nQGFtZC5jb20+DQo+Pj4+PiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhh
dC5jb20+DQo+Pj4+PiBDYzogIlZNd2FyZSBHcmFwaGljcyIgPGxpbnV4LWdyYXBoaWNzLW1haW50
YWluZXJAdm13YXJlLmNvbT4NCj4+Pj4+IENjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9t
QHZtd2FyZS5jb20+DQo+Pj4+IFllcywgcGxlYXNlLiBCdXQgb25lIG1vcmUgcG9pbnQ6IHlvdSBj
YW4gbm93IHJlbW92ZSBiby0+d3VfbXV0ZXggYXMgd2VsbCENCj4+PiBBaCByaWdodCB0b3RhbGx5
IGZvcmdvdCBhYm91dCB0aGF0IGluIG15IGVudGh1c2lhc20gYWZ0ZXIgYWxsIHRoZQ0KPj4+IGF1
ZGl0aW5nIGFuZCBmaXhpbmcgbm91dmVhdS4NCj4+Pg0KPj4+PiBBcGFydCBmcm9tIHRoYXQgUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+
PiBUaGFua3MsIEkgYWxyZWFkeSByZXNwdW4gdGhlIHBhdGNoZXMsIHNvIHdpbGwgYmUgaW4gdGhl
IG5leHQgdmVyc2lvbi4NCj4+PiBDYW4geW91IHBscyBhbHNvIGdpdmUgdGhpcyBhIHNwaW4gb24g
dGhlIGFtZGdwdSBDSSwganVzdCB0byBtYWtlIHN1cmUNCj4+PiBpdCdzIGFsbCBmaW5lPyBXaXRo
IGZ1bGwgbG9ja2RlcCBvZmMuIEFuZCB0aGVuIHJlcGx5IHdpdGggYSB0LWIuDQo+PiBJIGNhbiBh
c2sgZm9yIHRoaXMgb24gb3VyIGNhbGwgdG9tb3Jyb3csIGJ1dCBJIGZlYXIgb3VyIENJDQo+PiBp
bmZyYXN0cnVjdHVyZSBpcyBub3QgcmVhZHkgeWV0Lg0KPiBJIHRob3VnaHQgeW91IGhhdmUgc29t
ZSBpbnRlcm5hbCBicmFuY2ggeW91IGFsbCBjb21taXQgYW1kZ3B1IHN0dWZmDQo+IGZvciwgYW5k
IHRoZW4gQWxleCBnb2VzIGFuZCBjb2xsZWN0cyB0aGUgcGllY2VzIHRoYXQgYXJlIHJlYWR5Pw0K
DQpObywgdGhhdCBwYXJ0IGlzIGNvcnJlY3QuIFRoZSBwcm9ibGVtIGlzIHRoYXQgdGhpcyBicmFu
Y2ggaXMgbm90IFFBIA0KdGVzdGVkIHJlZ3VsYXJseSBhcyBmYXIgYXMgSSBrbm93Lg0KDQo+IE9y
IGRvZXMgdGhhdCBhbGwgYmxvdyB1cCBpZiB5b3UgcHVzaCBhIHBhdGNoIHdoaWNoIHRvdWNoZXMg
Y29kZSBvdXRzaWRlDQo+IG9mIHRoZSBka21zPw0KDQpObywgYnV0IHRoZSBwcm9ibGVtIGlzIHJl
bGF0ZWQgdG8gdGhhdC4NCg0KU2VlIHRoZSByZWxlYXNlIGJyYW5jaGVzIGZvciBka21zIGFyZSBz
ZXBhcmF0ZSBhbmQgaW5kZWVkIFFBIHRlc3RlZCANCnJlZ3VsYXJseS4NCg0KQnV0IGNoYW5nZXMg
ZnJvbSBhbWQtc3RhZ2luZy1kcm0tbmV4dCBhcmUgb25seSBjaGVycnkgcGlja2VkIGludG8gdGhv
c2UgDQppbiBjZXJ0YWluIGludGVydmFscy4NCg0KV2VsbCBnb2luZyB0byBkaXNjdXNzIHRoYXQg
dG9tb3Jyb3csDQpDaHJpc3RpYW4uDQoNCj4gLURhbmllbA0KPg0KPj4gQ2hyaXN0aWFuLg0KPj4N
Cj4+PiBUaGFua3MsIERhbmllbA0KPj4+Pj4gLS0tDQo+Pj4+PiAgICAgZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYyAgICB8IDM0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
Pj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgfCAyNiArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+Pj4+PiAgICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAg
ICB8ICAxIC0NCj4+Pj4+ICAgICAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2MCBk
ZWxldGlvbnMoLSkNCj4+Pj4+DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4+Pj4+IGluZGV4IDIw
ZmY1NmYyN2FhNC4uYTk1MmRkNjI0YjA2IDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYw0KPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
Yw0KPj4+Pj4gQEAgLTE5NTQsMzcgKzE5NTQsMyBAQCB2b2lkIHR0bV9ib19zd2Fwb3V0X2FsbChz
dHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikNCj4+Pj4+ICAgICAgICAgICAgICAgICA7DQo+Pj4+
PiAgICAgfQ0KPj4+Pj4gICAgIEVYUE9SVF9TWU1CT0wodHRtX2JvX3N3YXBvdXRfYWxsKTsNCj4+
Pj4+IC0NCj4+Pj4+IC0vKioNCj4+Pj4+IC0gKiB0dG1fYm9fd2FpdF91bnJlc2VydmVkIC0gaW50
ZXJydXB0aWJsZSB3YWl0IGZvciBhIGJ1ZmZlciBvYmplY3QgdG8gYmVjb21lDQo+Pj4+PiAtICog
dW5yZXNlcnZlZA0KPj4+Pj4gLSAqDQo+Pj4+PiAtICogQGJvOiBQb2ludGVyIHRvIGJ1ZmZlcg0K
Pj4+Pj4gLSAqLw0KPj4+Pj4gLWludCB0dG1fYm9fd2FpdF91bnJlc2VydmVkKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8pDQo+Pj4+PiAtew0KPj4+Pj4gLSAgICAgaW50IHJldDsNCj4+Pj4+
IC0NCj4+Pj4+IC0gICAgIC8qDQo+Pj4+PiAtICAgICAgKiBJbiB0aGUgYWJzZW5zZSBvZiBhIHdh
aXRfdW5sb2NrZWQgQVBJLA0KPj4+Pj4gLSAgICAgICogVXNlIHRoZSBibzo6d3VfbXV0ZXggdG8g
YXZvaWQgdHJpZ2dlcmluZyBsaXZlbG9ja3MgZHVlIHRvDQo+Pj4+PiAtICAgICAgKiBjb25jdXJy
ZW50IHVzZSBvZiB0aGlzIGZ1bmN0aW9uLiBOb3RlIHRoYXQgdGhpcyB1c2Ugb2YNCj4+Pj4+IC0g
ICAgICAqIGJvOjp3dV9tdXRleCBjYW4gZ28gYXdheSBpZiB3ZSBjaGFuZ2UgbG9ja2luZyBvcmRl
ciB0bw0KPj4+Pj4gLSAgICAgICogbW1hcF9zZW0gLT4gYm86OnJlc2VydmUuDQo+Pj4+PiAtICAg
ICAgKi8NCj4+Pj4+IC0gICAgIHJldCA9IG11dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmYm8tPnd1
X211dGV4KTsNCj4+Pj4+IC0gICAgIGlmICh1bmxpa2VseShyZXQgIT0gMCkpDQo+Pj4+PiAtICAg
ICAgICAgICAgIHJldHVybiAtRVJFU1RBUlRTWVM7DQo+Pj4+PiAtICAgICBpZiAoIWRtYV9yZXN2
X2lzX2xvY2tlZChiby0+YmFzZS5yZXN2KSkNCj4+Pj4+IC0gICAgICAgICAgICAgZ290byBvdXRf
dW5sb2NrOw0KPj4+Pj4gLSAgICAgcmV0ID0gZG1hX3Jlc3ZfbG9ja19pbnRlcnJ1cHRpYmxlKGJv
LT5iYXNlLnJlc3YsIE5VTEwpOw0KPj4+Pj4gLSAgICAgaWYgKHJldCA9PSAtRUlOVFIpDQo+Pj4+
PiAtICAgICAgICAgICAgIHJldCA9IC1FUkVTVEFSVFNZUzsNCj4+Pj4+IC0gICAgIGlmICh1bmxp
a2VseShyZXQgIT0gMCkpDQo+Pj4+PiAtICAgICAgICAgICAgIGdvdG8gb3V0X3VubG9jazsNCj4+
Pj4+IC0gICAgIGRtYV9yZXN2X3VubG9jayhiby0+YmFzZS5yZXN2KTsNCj4+Pj4+IC0NCj4+Pj4+
IC1vdXRfdW5sb2NrOg0KPj4+Pj4gLSAgICAgbXV0ZXhfdW5sb2NrKCZiby0+d3VfbXV0ZXgpOw0K
Pj4+Pj4gLSAgICAgcmV0dXJuIHJldDsNCj4+Pj4+IC19DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3ZtLmMNCj4+Pj4+IGluZGV4IDc2ZWVkYjk2MzY5My4uNTA1ZTE3ODdhZWVhIDEwMDY0NA0KPj4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYw0KPj4+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYw0KPj4+Pj4gQEAgLTEyNSwzMSArMTI1LDcgQEAg
c3RhdGljIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQ0K
Pj4+Pj4gICAgICAgICAgICAgICAgICZiZGV2LT5tYW5bYm8tPm1lbS5tZW1fdHlwZV07DQo+Pj4+
PiAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCBjdm1hOw0KPj4+Pj4NCj4+Pj4+IC0gICAg
IC8qDQo+Pj4+PiAtICAgICAgKiBXb3JrIGFyb3VuZCBsb2NraW5nIG9yZGVyIHJldmVyc2FsIGlu
IGZhdWx0IC8gbm9wZm4NCj4+Pj4+IC0gICAgICAqIGJldHdlZW4gbW1hcF9zZW0gYW5kIGJvX3Jl
c2VydmU6IFBlcmZvcm0gYSB0cnlsb2NrIG9wZXJhdGlvbg0KPj4+Pj4gLSAgICAgICogZm9yIHJl
c2VydmUsIGFuZCBpZiBpdCBmYWlscywgcmV0cnkgdGhlIGZhdWx0IGFmdGVyIHdhaXRpbmcNCj4+
Pj4+IC0gICAgICAqIGZvciB0aGUgYnVmZmVyIHRvIGJlY29tZSB1bnJlc2VydmVkLg0KPj4+Pj4g
LSAgICAgICovDQo+Pj4+PiAtICAgICBpZiAodW5saWtlbHkoIWRtYV9yZXN2X3RyeWxvY2soYm8t
PmJhc2UucmVzdikpKSB7DQo+Pj4+PiAtICAgICAgICAgICAgIGlmICh2bWYtPmZsYWdzICYgRkFV
TFRfRkxBR19BTExPV19SRVRSWSkgew0KPj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIGlmICgh
KHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZX05PV0FJVCkpIHsNCj4+Pj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHR0bV9ib19nZXQoYm8pOw0KPj4+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdXBfcmVhZCgmdm1mLT52bWEtPnZtX21tLT5tbWFwX3NlbSk7DQo+
Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodm9pZCkgdHRtX2JvX3dhaXRfdW5y
ZXNlcnZlZChibyk7DQo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0dG1fYm9f
cHV0KGJvKTsNCj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICB9DQo+Pj4+PiAtDQo+Pj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFZNX0ZBVUxUX1JFVFJZOw0KPj4+Pj4gLSAgICAg
ICAgICAgICB9DQo+Pj4+PiAtDQo+Pj4+PiAtICAgICAgICAgICAgIC8qDQo+Pj4+PiAtICAgICAg
ICAgICAgICAqIElmIHdlJ2Qgd2FudCB0byBjaGFuZ2UgbG9ja2luZyBvcmRlciB0bw0KPj4+Pj4g
LSAgICAgICAgICAgICAgKiBtbWFwX3NlbSAtPiBibzo6cmVzZXJ2ZSwgd2UnZCB1c2UgYSBibG9j
a2luZyByZXNlcnZlIGhlcmUNCj4+Pj4+IC0gICAgICAgICAgICAgICogaW5zdGVhZCBvZiByZXRy
eWluZyB0aGUgZmF1bHQuLi4NCj4+Pj4+IC0gICAgICAgICAgICAgICovDQo+Pj4+PiAtICAgICAg
ICAgICAgIHJldHVybiBWTV9GQVVMVF9OT1BBR0U7DQo+Pj4+PiAtICAgICB9DQo+Pj4+PiArICAg
ICBkbWFfcmVzdl9sb2NrKGJvLT5iYXNlLnJlc3YsIE5VTEwpOw0KPj4+Pj4NCj4+Pj4+ICAgICAg
ICAgLyoNCj4+Pj4+ICAgICAgICAgICogUmVmdXNlIHRvIGZhdWx0IGltcG9ydGVkIHBhZ2VzLiBU
aGlzIHNob3VsZCBiZSBoYW5kbGVkDQo+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRt
L3R0bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgNCj4+Pj4+IGluZGV4
IDQzYzQ5MjlhMjE3MS4uNmI1MGU2MjRlM2UyIDEwMDY0NA0KPj4+Pj4gLS0tIGEvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19hcGkuaA0KPj4+Pj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19h
cGkuaA0KPj4+Pj4gQEAgLTc2NSw3ICs3NjUsNiBAQCBzc2l6ZV90IHR0bV9ib19pbyhzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldiwgc3RydWN0IGZpbGUgKmZpbHAsDQo+Pj4+PiAgICAgaW50IHR0
bV9ib19zd2Fwb3V0KHN0cnVjdCB0dG1fYm9fZ2xvYmFsICpnbG9iLA0KPj4+Pj4gICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpOw0KPj4+Pj4gICAg
IHZvaWQgdHRtX2JvX3N3YXBvdXRfYWxsKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2KTsNCj4+
Pj4+IC1pbnQgdHRtX2JvX3dhaXRfdW5yZXNlcnZlZChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvKTsNCj4+Pj4+DQo+Pj4+PiAgICAgLyoqDQo+Pj4+PiAgICAgICogdHRtX2JvX3VzZXNfZW1i
ZWRkZWRfZ2VtX29iamVjdCAtIGNoZWNrIGlmIHRoZSBnaXZlbiBibyB1c2VzIHRoZQ0KPg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
