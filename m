Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF571BEBD
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 22:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5F389228;
	Mon, 13 May 2019 20:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720077.outbound.protection.outlook.com [40.107.72.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72953891C3;
 Mon, 13 May 2019 20:31:51 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2713.namprd12.prod.outlook.com (20.176.116.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Mon, 13 May 2019 20:31:49 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::588b:cfef:3486:b4e8]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::588b:cfef:3486:b4e8%3]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 20:31:49 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jerome Glisse <jglisse@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Thread-Topic: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Thread-Index: AQHVB2oH3gumKK8uVkW/G1cJvzIbZqZkyv6AgASsjwCAAAOPAIAAC9WA
Date: Mon, 13 May 2019 20:31:49 +0000
Message-ID: <af7bdc84-12d5-0e6b-c8cd-469bc8be5667@amd.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-3-Felix.Kuehling@amd.com>
 <20190510201403.GG4507@redhat.com>
 <65328381-aa0d-353d-68dc-81060e7cebdf@amd.com>
 <20190513194925.GA31365@redhat.com>
In-Reply-To: <20190513194925.GA31365@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTXPR0101CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::39) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10d69884-bf8c-4a39-f644-08d6d7e20689
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2713; 
x-ms-traffictypediagnostic: DM6PR12MB2713:
x-microsoft-antispam-prvs: <DM6PR12MB27130B598A2FF6963FE1B886920F0@DM6PR12MB2713.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(396003)(346002)(376002)(199004)(189003)(102836004)(53546011)(52116002)(316002)(76176011)(386003)(256004)(14444005)(31686004)(6506007)(68736007)(81156014)(81166006)(6246003)(8676002)(99286004)(4326008)(8936002)(73956011)(66556008)(66946007)(86362001)(6512007)(36756003)(31696002)(66446008)(64756008)(66476007)(25786009)(478600001)(110136005)(54906003)(58126008)(3846002)(64126003)(6116002)(26005)(186003)(305945005)(66574012)(65826007)(71200400001)(71190400001)(65956001)(5660300002)(7736002)(229853002)(2906002)(66066001)(65806001)(2616005)(53936002)(6486002)(11346002)(6436002)(72206003)(476003)(486006)(446003)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2713;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SFQLO6PlsQR3uKXoYBtVbSBPKZw+n0Si4XmFAKBUOJXllhLIA9vI96N8sg/cwmZoSYerzgHc12O7z749oxI7R8Wl/g6QtHtgAyKtxTwYvlNEn3m8/go1L0HCN5YqM8HS68MOT8Cb9bO30szTL8hEkwkE7HstyiJCeYxAT4eoN6HEbPYXQFQZVyLJlJIq9UFETQnCuIfrJH7hrz3QuRamurB1g6Ao6GtVjOgEL4uIZZog6yZjf2mIsvWOb49lB4wzspD4KmfSmGWZ1Cr28KQODmDyzjoXs5ZLtAOiTcWVmfIQn5Jo0rh+DeEusIe+W5HjhHbChUAjCTTHjj+Xi6EVvJVKwP3e/mLUb1/Md4i8oP6s/OWu47MxcqUFBO0+nzj06leJiHC5Se57jrixkjJUeGnpMTgRQ9SUVi8oEhtsfK4=
Content-ID: <5E82D3940DFEC141BD7D114350D4BBB9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d69884-bf8c-4a39-f644-08d6d7e20689
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 20:31:49.7513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml5RJ4NBLaDlWxzIFMGxVtorNmkVyC0HKuybT4Ekchc=;
 b=zqiW0yzOzBLL2Bu7+7joFx87u+uJ853LpEh+RLBxFMEnYhOds0eYBnVT+599/1GZFlbQEkaLweBvYx1yoPbEXE10Sv3g4UZ1+Wu3kTa8dR7RlQweQIfHXdwY5E8FSEzIaUBQDeWlilVqtd/07eeiv9FBlp0xBzgtEYSwv88Ns1I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0ZpeGVkIEFsZXgncyBlbWFpbCBhZGRyZXNzLCBzb3JyeSBmb3IgZ2V0dGluZyBpdCB3cm9uZyBm
aXJzdF0NCg0KT24gMjAxOS0wNS0xMyAzOjQ5IHAubS4sIEplcm9tZSBHbGlzc2Ugd3JvdGU6DQo+
IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCj4NCj4gQW5kcmV3IGNhbiB3ZSBnZXQgdGhpcyAy
IGZpeGVzIGxpbmUgdXAgZm9yIDUuMiA/DQo+DQo+IE9uIE1vbiwgTWF5IDEzLCAyMDE5IGF0IDA3
OjM2OjQ0UE0gKzAwMDAsIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToNCj4+IEhpIEplcm9tZSwNCj4+
DQo+PiBEbyB5b3Ugd2FudCBtZSB0byBwdXNoIHRoZSBwYXRjaGVzIHRvIHlvdXIgYnJhbmNoPyBP
ciBhcmUgeW91IGdvaW5nIHRvDQo+PiBhcHBseSB0aGVtIHlvdXJzZWxmPw0KPj4NCj4+IElzIHlv
dXIgaG1tLTUuMi12MyBicmFuY2ggZ29pbmcgdG8gbWFrZSBpdCBpbnRvIExpbnV4IDUuMj8gSWYg
c28sIGRvIHlvdQ0KPj4ga25vdyB3aGVuPyBJJ2QgbGlrZSB0byBjb29yZGluYXRlIHdpdGggRGF2
ZSBBaXJsaWUgc28gdGhhdCB3ZSBjYW4gYWxzbw0KPj4gZ2V0IHRoYXQgdXBkYXRlIGludG8gYSBk
cm0tbmV4dCBicmFuY2ggc29vbi4NCj4+DQo+PiBJIHNlZSB0aGF0IExpbnVzIG1lcmdlZCBEYXZl
J3MgcHVsbCByZXF1ZXN0IGZvciBMaW51eCA1LjIsIHdoaWNoDQo+PiBpbmNsdWRlcyB0aGUgZmly
c3QgY2hhbmdlcyBpbiBhbWRncHUgdXNpbmcgSE1NLiBUaGV5J3JlIGN1cnJlbnRseSBicm9rZW4N
Cj4+IHdpdGhvdXQgdGhlc2UgdHdvIHBhdGNoZXMuDQo+IEhNTSBwYXRjaCBkbyBub3QgZ28gdGhy
b3VnaCBhbnkgZ2l0IGJyYW5jaCB0aGV5IGdvIHRocm91Z2ggdGhlIG1tb3RtDQo+IGNvbGxlY3Rp
b24uIFNvIGl0IGlzIG5vdCBzb21ldGhpbmcgeW91IGNhbiBlYXNpbHkgY29vcmRpbmF0ZSB3aXRo
IGRybQ0KPiBicmFuY2guDQo+DQo+IEJ5IGJyb2tlbiBpIGV4cGVjdCB5b3UgbWVhbiB0aGF0IGlm
IG51bWFiYWxhbmNlIGhhcHBlbnMgaXQgYnJlYWtzID8NCj4gT3IgaXQgbWlnaHQgc2xlZXAgd2hl
biB5b3UgYXJlIG5vdCBleHBlY3RpbmcgaXQgdG9vID8NCg0KV2l0aG91dCB0aGUgTlVNQSBmaXgg
d2UnZCBlbmQgdXAgdXNpbmcgYW4gb3V0ZGF0ZWQgcGh5c2ljYWwgYWRkcmVzcyBpbiANCnRoZSBH
UFUgcGFnZSB0YWJsZS4gVGhlIHByb2JsZW0gd2FzIGNhdWdodCBieSBhIHRlc3QgdGhhdCBnb3Qg
aW5jb3JyZWN0IA0KY29tcHV0YXRpb24gcmVzdWx0cyB1c2luZyBPcGVuQ0wgb24gYSBOVU1BIHN5
c3RlbS4NCg0KV2l0aG91dCB0aGUgRkFVTFRfRkxBR19BTExPV19SRVRSWSBwYXRjaCwgdGhlcmUg
Y2FuIGJlIGtlcm5lbCBvb3BzZXMgZHVlIA0KdG8gaW5jb3JyZWN0IGxvY2tpbmcvdW5sb2NraW5n
IG9mIG1tYXBfc2VtLiBJdCBicmVha3MgdGhlIHByb21pc2UgdGhhdCANCmhtbV9yYW5nZV9mYXVs
dCBzaG91bGQgbm90IHVubG9jayB0aGUgbW1hcF9zZW0gaWYgYmxvY2s9PXRydWUuIEl0IHRha2Vz
IA0Kc29tZSBtZW1vcnkgcHJlc3N1cmUgdG8gdHJpZ2dlciB0aGlzLg0KDQpSZWdhcmRzLA0KIMKg
IEZlbGl4DQoNCg0KPg0KPiBDaGVlcnMsDQo+IErDqXLDtG1lDQo+DQo+PiBUaGFua3MsDQo+PiAg
ICAgRmVsaXgNCj4+DQo+PiBPbiAyMDE5LTA1LTEwIDQ6MTQgcC5tLiwgSmVyb21lIEdsaXNzZSB3
cm90ZToNCj4+PiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1haWxdDQo+Pj4NCj4+PiBPbiBGcmksIE1h
eSAxMCwgMjAxOSBhdCAwNzo1MzoyNFBNICswMDAwLCBLdWVobGluZywgRmVsaXggd3JvdGU6DQo+
Pj4+IERvbid0IHNldCB0aGlzIGZsYWcgYnkgZGVmYXVsdCBpbiBobW1fdm1hX2RvX2ZhdWx0LiBJ
dCBpcyBzZXQNCj4+Pj4gY29uZGl0aW9uYWxseSBqdXN0IGEgZmV3IGxpbmVzIGJlbG93LiBTZXR0
aW5nIGl0IHVuY29uZGl0aW9uYWxseQ0KPj4+PiBjYW4gbGVhZCB0byBoYW5kbGVfbW1fZmF1bHQg
ZG9pbmcgYSBub24tYmxvY2tpbmcgZmF1bHQsIHJldHVybmluZw0KPj4+PiAtRUJVU1kgYW5kIHVu
bG9ja2luZyBtbWFwX3NlbSB1bmV4cGVjdGVkbHkuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6
IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KPj4+IFJldmlld2VkLWJ5
OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4NCj4+Pg0KPj4+PiAtLS0NCj4+
Pj4gICAgbW0vaG1tLmMgfCAyICstDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9t
bS9obW0uYw0KPj4+PiBpbmRleCBiNjVjMjdkNWMxMTkuLjNjNGYxZDYyMjAyZiAxMDA2NDQNCj4+
Pj4gLS0tIGEvbW0vaG1tLmMNCj4+Pj4gKysrIGIvbW0vaG1tLmMNCj4+Pj4gQEAgLTMzOSw3ICsz
MzksNyBAQCBzdHJ1Y3QgaG1tX3ZtYV93YWxrIHsNCj4+Pj4gICAgc3RhdGljIGludCBobW1fdm1h
X2RvX2ZhdWx0KHN0cnVjdCBtbV93YWxrICp3YWxrLCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+Pj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHdyaXRlX2ZhdWx0LCB1aW50NjRfdCAq
cGZuKQ0KPj4+PiAgICB7DQo+Pj4+IC0gICAgIHVuc2lnbmVkIGludCBmbGFncyA9IEZBVUxUX0ZM
QUdfQUxMT1dfUkVUUlkgfCBGQVVMVF9GTEFHX1JFTU9URTsNCj4+Pj4gKyAgICAgdW5zaWduZWQg
aW50IGZsYWdzID0gRkFVTFRfRkxBR19SRU1PVEU7DQo+Pj4+ICAgICAgICAgc3RydWN0IGhtbV92
bWFfd2FsayAqaG1tX3ZtYV93YWxrID0gd2Fsay0+cHJpdmF0ZTsNCj4+Pj4gICAgICAgICBzdHJ1
Y3QgaG1tX3JhbmdlICpyYW5nZSA9IGhtbV92bWFfd2Fsay0+cmFuZ2U7DQo+Pj4+ICAgICAgICAg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB3YWxrLT52bWE7DQo+Pj4+IC0tDQo+Pj4+IDIu
MTcuMQ0KPj4+Pg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
