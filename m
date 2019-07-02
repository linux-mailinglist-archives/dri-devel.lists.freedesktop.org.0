Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A65D7DC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 23:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5500489DC1;
	Tue,  2 Jul 2019 21:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760074.outbound.protection.outlook.com [40.107.76.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0C989DC1;
 Tue,  2 Jul 2019 21:44:02 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3227.namprd12.prod.outlook.com (20.179.105.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 21:43:58 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 21:43:58 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, "Yang, Philip"
 <Philip.Yang@amd.com>
Subject: Re: [PATCH 19/22] mm: always return EBUSY for invalid ranges in
 hmm_range_{fault,snapshot}
Thread-Topic: [PATCH 19/22] mm: always return EBUSY for invalid ranges in
 hmm_range_{fault,snapshot}
Thread-Index: AQHVL9U3BN0CaVdL806tAThCwvVuZKa33tOA
Date: Tue, 2 Jul 2019 21:43:58 +0000
Message-ID: <fedf75d4-4ce2-e0cc-3c77-73ba31bed653@amd.com>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701062020.19239-20-hch@lst.de>
In-Reply-To: <20190701062020.19239-20-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-clientproxiedby: YTOPR0101CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::44) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13f473c3-5730-48c1-f95f-08d6ff366354
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3227; 
x-ms-traffictypediagnostic: DM6PR12MB3227:
x-microsoft-antispam-prvs: <DM6PR12MB32277E4745008E9B86DBD5E692F80@DM6PR12MB3227.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(189003)(199004)(6116002)(3846002)(68736007)(476003)(2616005)(486006)(6486002)(36756003)(72206003)(478600001)(66066001)(64126003)(64756008)(66446008)(66946007)(66476007)(73956011)(14444005)(256004)(66556008)(8676002)(65956001)(65806001)(102836004)(86362001)(71200400001)(53936002)(229853002)(8936002)(110136005)(316002)(6436002)(6506007)(81166006)(5660300002)(53546011)(31696002)(65826007)(58126008)(305945005)(186003)(71190400001)(54906003)(7416002)(386003)(14454004)(6512007)(99286004)(7736002)(11346002)(4326008)(25786009)(6636002)(2906002)(76176011)(31686004)(52116002)(446003)(26005)(81156014)(6246003)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3227;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sMk9L56Wb8xff3fa0UYNwsl9h+hrIYZNmWjZ2sZDOyWhgc5H+orKgzntdXV+43yWl4Lr3U4nKoyq+847Jyb1LO7jtF/utnCV/yhFNbUpoClgimWeyEW1AfwIxb1AbfTDFJ81dfCLN7d1C6JKhszrqEz69czVaywl62W2iiv2ZsBx1M78T3Kk8/Q3H8WtxPPbof/9Ll5wm58jel7AN2JeO8FBGM7JoD3HVlg6nqebp3T6ukDzHKWAKGVT7ItJfD/8XTkhqmPwRzGOd7AxvfYipQ9hPwAzZfdrFp7OCGSLNKDF/CC9Kp+yDd6w1rGGvYppl2NucncmXRzCmiFh9ivHN47pfj9UgYWZNbJcnc6XVH1bOnlXWAqOSDvoSm9qrF0zVD8TRE8BtixlMseu5AYRmAhTf7vXX2h43mFy4AgGm1c=
Content-ID: <30B65ABE32E43E43B44DF7426B589C07@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f473c3-5730-48c1-f95f-08d6ff366354
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 21:43:58.3251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3227
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXV5m5/kWL0UTx0rffDnbnfr99W18VuHp36gZ6xXldk=;
 b=I2VmR7GaVUgrTx3BAhLw9gTSGN99h0fegBzuNaGRakfcNLzWWMVvDPwiH25Ed6kRRZWK7jwJ+Wkc4HAEgy8qCeSHo1hnjGfVCHF47S6AH5knIs8Ze4jaK4tAhax64gSold0HYRVowbsRYACwaMYkwtOCo1sS+MjODN0yChOyxGE=
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wMSAyOjIwIGEubS4sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOg0KPiBXZSBz
aG91bGQgbm90IGhhdmUgdHdvIGRpZmZlcmVudCBlcnJvciBjb2RlcyBmb3IgdGhlIHNhbWUgY29u
ZGl0aW9uLiAgSW4NCj4gYWRkaXRpb24gdGhpcyByZWFsbHkgY29tcGxpY2F0ZXMgdGhlIGNvZGUg
ZHVlIHRvIHRoZSBzcGVjaWFsIGhhbmRsaW5nIG9mDQo+IEVBR0FJTiB0aGF0IGRyb3BzIHRoZSBt
bWFwX3NlbSBkdWUgdG8gdGhlIEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkgbG9naWMNCj4gaW4gdGhl
IGNvcmUgdm0uDQoNCkkgdGhpbmsgdGhlIGNvbW1lbnQgYWJvdmUgaG1tX3JhbmdlX3NuYXBzaG90
IG5lZWRzIGFuIHVwZGF0ZS4gQWxzbyANCkRvY3VtZW50YXRpb24vdm0vaG1tLnJzdCBzaG93cyBz
b21lIGV4YW1wbGUgY29kZSB1c2luZyANCmhtbV9yYW5nZV9zbmFwc2hvdCB0aGF0IHJldHJpZXMg
b24gLUVBR0FJTi4gVGhhdCB3b3VsZCBuZWVkIHRvIGJlIA0KdXBkYXRlZCB0byB1c2UgLUVCVVNZ
IG9yIHJlbW92ZSB0aGUgcmV0cnkgbG9naWMgYWx0b2dldGhlci4NCg0KT3RoZXIgdGhhbiB0aGF0
LCB0aGlzIHBhdGNoIGlzIFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyANCjxGZWxpeC5LdWVo
bGluZ0BhbWQuY29tPg0KDQpQaGlsaXAsIHRoaXMgbWVhbnMgd2Ugc2hvdWxkIHJlbW92ZSBvdXIg
cmV0cnkgbG9naWMgYWdhaW4gaW4gDQphbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzLiBBY2Nv
cmRpbmcgdG8gdGhlIGNvbW1lbnQgYWJvdmUgDQpobW1fcmFuZ2VfZmF1bHQsIGl0IGNhbiBvbmx5
IHJldHVybiAtRUFHQUlOIGlmIHRoZSBibG9jayBwYXJhbWV0ZXIgaXMgDQpmYWxzZS4gSSB0aGlu
ayB0aGlzIHN0YXRlbWVudCBpcyBub3cgYWN0dWFsbHkgdHJ1ZS4gV2Ugc2V0IGJsb2NrPXRydWUs
IA0Kc28gd2UgY2FuJ3QgZ2V0IC1FQUdBSU4uIE9uIC1FQlVTWSB3ZSBjYW4gbGV0IA0KYW1kZ3B1
X2FtZGtmZF9yZXN0b3JlX3VzZXJwdHJfd29ya2VyIHNjaGVkdWxlIHRoZSByZXRyeSAod2hpY2gg
aXQgZG9lcyANCmFscmVhZHkgYW55d2F5KS4NCg0KUmVnYXJkcywNCiDCoCBGZWxpeA0KDQoNCj4N
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+DQo+IC0tLQ0K
PiAgIG1tL2htbS5jIHwgOCArKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2ht
bS5jDQo+IGluZGV4IGM4NWVkN2Q0ZTJjZS4uZDEyNWRmNjk4ZTJiIDEwMDY0NA0KPiAtLS0gYS9t
bS9obW0uYw0KPiArKysgYi9tbS9obW0uYw0KPiBAQCAtOTc0LDcgKzk3NCw3IEBAIGxvbmcgaG1t
X3JhbmdlX3NuYXBzaG90KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQ0KPiAgIAlkbyB7DQo+ICAg
CQkvKiBJZiByYW5nZSBpcyBubyBsb25nZXIgdmFsaWQgZm9yY2UgcmV0cnkuICovDQo+ICAgCQlp
ZiAoIXJhbmdlLT52YWxpZCkNCj4gLQkJCXJldHVybiAtRUFHQUlOOw0KPiArCQkJcmV0dXJuIC1F
QlVTWTsNCj4gICANCj4gICAJCXZtYSA9IGZpbmRfdm1hKGhtbS0+bW0sIHN0YXJ0KTsNCj4gICAJ
CWlmICh2bWEgPT0gTlVMTCB8fCAodm1hLT52bV9mbGFncyAmIGRldmljZV92bWEpKQ0KPiBAQCAt
MTA2OSwxMCArMTA2OSw4IEBAIGxvbmcgaG1tX3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fcmFuZ2Ug
KnJhbmdlLCBib29sIGJsb2NrKQ0KPiAgIA0KPiAgIAlkbyB7DQo+ICAgCQkvKiBJZiByYW5nZSBp
cyBubyBsb25nZXIgdmFsaWQgZm9yY2UgcmV0cnkuICovDQo+IC0JCWlmICghcmFuZ2UtPnZhbGlk
KSB7DQo+IC0JCQl1cF9yZWFkKCZobW0tPm1tLT5tbWFwX3NlbSk7DQo+IC0JCQlyZXR1cm4gLUVB
R0FJTjsNCj4gLQkJfQ0KPiArCQlpZiAoIXJhbmdlLT52YWxpZCkNCj4gKwkJCXJldHVybiAtRUJV
U1k7DQo+ICAgDQo+ICAgCQl2bWEgPSBmaW5kX3ZtYShobW0tPm1tLCBzdGFydCk7DQo+ICAgCQlp
ZiAodm1hID09IE5VTEwgfHwgKHZtYS0+dm1fZmxhZ3MgJiBkZXZpY2Vfdm1hKSkNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
