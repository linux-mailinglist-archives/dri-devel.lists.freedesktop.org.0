Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D6C1D10E
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 23:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEC1892F2;
	Tue, 14 May 2019 21:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680050.outbound.protection.outlook.com [40.107.68.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CAC892F2;
 Tue, 14 May 2019 21:12:06 +0000 (UTC)
Received: from MN2PR12MB3949.namprd12.prod.outlook.com (10.255.238.150) by
 MN2PR12MB2989.namprd12.prod.outlook.com (20.178.241.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Tue, 14 May 2019 21:12:04 +0000
Received: from MN2PR12MB3949.namprd12.prod.outlook.com
 ([fe80::b9af:29f1:fcab:6f6f]) by MN2PR12MB3949.namprd12.prod.outlook.com
 ([fe80::b9af:29f1:fcab:6f6f%4]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 21:12:04 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Jerome Glisse
 <jglisse@redhat.com>
Subject: Re: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Thread-Topic: [PATCH 2/2] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
Thread-Index: AQHVB2oH3gumKK8uVkW/G1cJvzIbZqZkyv6AgASsjwCAAAyWgIABoGIA
Date: Tue, 14 May 2019 21:12:04 +0000
Message-ID: <cf8bdc0c-96b9-8a73-69ca-a4aae11f36d5@amd.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-3-Felix.Kuehling@amd.com>
 <20190510201403.GG4507@redhat.com>
 <65328381-aa0d-353d-68dc-81060e7cebdf@amd.com>
 <BN6PR12MB1809F26E6AF74BE9F96DB22DF70F0@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809F26E6AF74BE9F96DB22DF70F0@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To MN2PR12MB3949.namprd12.prod.outlook.com
 (2603:10b6:208:16b::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48f27e2d-0ef1-4474-c083-08d6d8b0d057
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2989; 
x-ms-traffictypediagnostic: MN2PR12MB2989:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR12MB298911B82CC25BA9B49AFEB692080@MN2PR12MB2989.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(99286004)(66946007)(71190400001)(71200400001)(52116002)(6512007)(76176011)(31696002)(86362001)(66476007)(66556008)(73956011)(256004)(14444005)(64756008)(66446008)(66574012)(26005)(446003)(478600001)(6436002)(72206003)(36756003)(25786009)(966005)(110136005)(54906003)(58126008)(6116002)(3846002)(66066001)(4326008)(65956001)(65806001)(6506007)(386003)(53546011)(6306002)(102836004)(316002)(2906002)(64126003)(6486002)(31686004)(486006)(476003)(305945005)(14454004)(53936002)(81156014)(81166006)(229853002)(186003)(2616005)(7736002)(11346002)(5660300002)(8936002)(6246003)(65826007)(8676002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2989;
 H:MN2PR12MB3949.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g8k529k8oFqSej3kV6GCS0dudwmO0TQmeUuQS7npheoukfhYS49HH/IvO08Zu6Qz6DxAzmBowjl2MQTRbycjUdmIQjQS6FrWb3EP6lVRHL0Qn1NL0ySMqyTriFGPo+e8KTbYADeVAs7ibWeY7ErtBJPgT2L6OS4OLCLrI5lSyhCJp2xr6GnCnA33V50ROKN3ThQ4TvvsUESpX+ap9RiwVEnuMt+F7IOpCBv25LgXnmXEHyhitEiGgIQUW5ecI4teoByKV5xT4RAham3vqJtEOSzoW21MkkvjSwQUmwt1zJ2rdyprNuM7sjF40OAxy1ixuY6ko8OhvPljGGdjwc/V4/MbWj1btnymjVFIIH4rboE3Ff75uIMsL9SLZKJHpdO2U5Lgn7sG4Wxbm9n6IBnPOKdiiuMPW/xkh/oDv+CWWO4=
Content-ID: <47E40BF62063C549A60D2FA213D1D422@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f27e2d-0ef1-4474-c083-08d6d8b0d057
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 21:12:04.2660 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2989
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Wr4AoBQ+WbNrtNZIjnG9aEHD3jB7iv08RurNxCwk54=;
 b=eZvkGVIBeP4DlpRrYqiY6bq9iQPg8OjNC/Bp4p8q5IE2DaUdCQU4zhat/ZJkNM1KPU2mva/XPoy5Rm4TntRYGfoX2sJzRQEwteIVgU+fkdLk/PcN4mXxm3Mzd8Fh0EpNUS6b6eV0jyTYNgFIBw9nmygawMkXAIrPEJzT7IZEGI8=
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "alex.deucher@amd.com" <alex.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMTktMDUtMTMgNDoyMSBwLm0uLCBEZXVjaGVyLCBBbGV4YW5kZXIgd3JvdGU6Cj4gW0NB
VVRJT046IEV4dGVybmFsIEVtYWlsXQo+IEkgcmV2ZXJ0ZWQgYWxsIHRoZSBhbWRncHUgSE1NIHBh
dGNoZXMgZm9yIDUuMiBiZWNhdXNlIHRoZXkgYWxzbyAKPiBkZXBlbmRlZCBvbiB0aGlzIHBhdGNo
Ogo+IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4L2NvbW1pdC8/aD1k
cm0tbmV4dC01LjItd2lwJmlkPWNlMDVlZjcxNTY0ZjdjYmUyNzBjZDQzMzdjMzZlZTcyMGVhNTM0
ZGIKPiB3aGljaCBkaWQgbm90IGhhdmUgYSBjbGVhciBsaW5lIG9mIHNpZ2h0IGZvciA1LjIgZWl0
aGVyLgoKV2hlbiB3YXMgdGhhdD8gSSBzYXcgIlVzZSBITU0gZm9yIHVzZXJwdHIiIGluIERhdmUn
cyA1LjItcmMxIHB1bGwgCnJlcXVlc3QgdG8gTGludXMuCgoKUmVnYXJkcywKIMKgIEZlbGl4CgoK
Pgo+IEFsZXgKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAqRnJvbToqIGFtZC1nZnggPGFtZC1nZngtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IG9uIGJlaGFsZiBvZiAKPiBLdWVobGluZywgRmVs
aXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gKlNlbnQ6KiBNb25kYXksIE1heSAxMywgMjAx
OSAzOjM2IFBNCj4gKlRvOiogSmVyb21lIEdsaXNzZQo+ICpDYzoqIGxpbnV4LW1tQGt2YWNrLm9y
ZzsgYWlybGllZEBnbWFpbC5jb207IAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyAKPiBhbGV4LmRldWNoZXJAYW1kLmNvbQo+
ICpTdWJqZWN0OiogUmU6IFtQQVRDSCAyLzJdIG1tL2htbTogT25seSBzZXQgRkFVTFRfRkxBR19B
TExPV19SRVRSWSBmb3IgCj4gbm9uLWJsb2NraW5nCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWls
XQo+Cj4gSGkgSmVyb21lLAo+Cj4gRG8geW91IHdhbnQgbWUgdG8gcHVzaCB0aGUgcGF0Y2hlcyB0
byB5b3VyIGJyYW5jaD8gT3IgYXJlIHlvdSBnb2luZyB0bwo+IGFwcGx5IHRoZW0geW91cnNlbGY/
Cj4KPiBJcyB5b3VyIGhtbS01LjItdjMgYnJhbmNoIGdvaW5nIHRvIG1ha2UgaXQgaW50byBMaW51
eCA1LjI/IElmIHNvLCBkbyB5b3UKPiBrbm93IHdoZW4/IEknZCBsaWtlIHRvIGNvb3JkaW5hdGUg
d2l0aCBEYXZlIEFpcmxpZSBzbyB0aGF0IHdlIGNhbiBhbHNvCj4gZ2V0IHRoYXQgdXBkYXRlIGlu
dG8gYSBkcm0tbmV4dCBicmFuY2ggc29vbi4KPgo+IEkgc2VlIHRoYXQgTGludXMgbWVyZ2VkIERh
dmUncyBwdWxsIHJlcXVlc3QgZm9yIExpbnV4IDUuMiwgd2hpY2gKPiBpbmNsdWRlcyB0aGUgZmly
c3QgY2hhbmdlcyBpbiBhbWRncHUgdXNpbmcgSE1NLiBUaGV5J3JlIGN1cnJlbnRseSBicm9rZW4K
PiB3aXRob3V0IHRoZXNlIHR3byBwYXRjaGVzLgo+Cj4gVGhhbmtzLAo+IMKgwqAgRmVsaXgKPgo+
IE9uIDIwMTktMDUtMTAgNDoxNCBwLm0uLCBKZXJvbWUgR2xpc3NlIHdyb3RlOgo+ID4gW0NBVVRJ
T046IEV4dGVybmFsIEVtYWlsXQo+ID4KPiA+IE9uIEZyaSwgTWF5IDEwLCAyMDE5IGF0IDA3OjUz
OjI0UE0gKzAwMDAsIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToKPiA+PiBEb24ndCBzZXQgdGhpcyBm
bGFnIGJ5IGRlZmF1bHQgaW4gaG1tX3ZtYV9kb19mYXVsdC4gSXQgaXMgc2V0Cj4gPj4gY29uZGl0
aW9uYWxseSBqdXN0IGEgZmV3IGxpbmVzIGJlbG93LiBTZXR0aW5nIGl0IHVuY29uZGl0aW9uYWxs
eQo+ID4+IGNhbiBsZWFkIHRvIGhhbmRsZV9tbV9mYXVsdCBkb2luZyBhIG5vbi1ibG9ja2luZyBm
YXVsdCwgcmV0dXJuaW5nCj4gPj4gLUVCVVNZIGFuZCB1bmxvY2tpbmcgbW1hcF9zZW0gdW5leHBl
Y3RlZGx5Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1
ZWhsaW5nQGFtZC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3Nl
QHJlZGhhdC5jb20+Cj4gPgo+ID4+IC0tLQo+ID4+wqDCoCBtbS9obW0uYyB8IDIgKy0KPiA+PsKg
wqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+
PiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwo+ID4+IGluZGV4IGI2NWMyN2Q1YzEx
OS4uM2M0ZjFkNjIyMDJmIDEwMDY0NAo+ID4+IC0tLSBhL21tL2htbS5jCj4gPj4gKysrIGIvbW0v
aG1tLmMKPiA+PiBAQCAtMzM5LDcgKzMzOSw3IEBAIHN0cnVjdCBobW1fdm1hX3dhbGsgewo+ID4+
wqDCoCBzdGF0aWMgaW50IGhtbV92bWFfZG9fZmF1bHQoc3RydWN0IG1tX3dhbGsgKndhbGssIHVu
c2lnbmVkIGxvbmcgYWRkciwKPiA+PsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIHdyaXRlX2ZhdWx0LCB1aW50NjRfdCAqcGZuKQo+ID4+
wqDCoCB7Cj4gPj4gLcKgwqDCoMKgIHVuc2lnbmVkIGludCBmbGFncyA9IEZBVUxUX0ZMQUdfQUxM
T1dfUkVUUlkgfCBGQVVMVF9GTEFHX1JFTU9URTsKPiA+PiArwqDCoMKgwqAgdW5zaWduZWQgaW50
IGZsYWdzID0gRkFVTFRfRkxBR19SRU1PVEU7Cj4gPj7CoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaG1t
X3ZtYV93YWxrICpobW1fdm1hX3dhbGsgPSB3YWxrLT5wcml2YXRlOwo+ID4+wqDCoMKgwqDCoMKg
wqAgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UgPSBobW1fdm1hX3dhbGstPnJhbmdlOwo+ID4+wqDC
oMKgwqDCoMKgwqAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB3YWxrLT52bWE7Cj4gPj4g
LS0KPiA+PiAyLjE3LjEKPiA+Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
