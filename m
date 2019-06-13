Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615484560D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C27D89862;
	Fri, 14 Jun 2019 07:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C758289904;
 Thu, 13 Jun 2019 19:16:39 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6030.eurprd05.prod.outlook.com (20.178.127.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Thu, 13 Jun 2019 19:16:35 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1987.012; Thu, 13 Jun 2019
 19:16:35 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/22] mm: factor out a devm_request_free_mem_region helper
Thread-Topic: [PATCH 06/22] mm: factor out a devm_request_free_mem_region
 helper
Thread-Index: AQHVIcyBwDOm/h2tmE+QYz8Gijo2yqaZ9WQA
Date: Thu, 13 Jun 2019 19:16:35 +0000
Message-ID: <20190613191626.GR22062@mellanox.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-7-hch@lst.de>
In-Reply-To: <20190613094326.24093-7-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::37) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aee64c42-1b0a-4c20-67ad-08d6f033a6ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6030; 
x-ms-traffictypediagnostic: VI1PR05MB6030:
x-microsoft-antispam-prvs: <VI1PR05MB6030C106FA4C6D235C27E224CFEF0@VI1PR05MB6030.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(366004)(39860400002)(376002)(189003)(199004)(54094003)(36756003)(11346002)(6916009)(8936002)(33656002)(71190400001)(71200400001)(8676002)(476003)(2616005)(6512007)(7416002)(478600001)(81166006)(53936002)(66066001)(6436002)(229853002)(6486002)(54906003)(25786009)(486006)(81156014)(7736002)(102836004)(305945005)(26005)(186003)(5660300002)(66946007)(2906002)(73956011)(66556008)(6246003)(64756008)(66446008)(68736007)(1076003)(386003)(6506007)(6116002)(99286004)(256004)(76176011)(4326008)(14444005)(3846002)(316002)(14454004)(446003)(86362001)(66476007)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6030;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gFYuGZngpuoWy6b/5P5+pZVhkYde8Vg4kuhBxMcM8WgNyeQuKyOzuYbYK+RZsXWyfP/fL1+P5JypqG+u+CCNKCqx7kGWiq9gVi/HHoc0v0f3UAL12m0S3zuXKyGXJDgW1QGe4SgzinVfrsOl/J99CyKMUWmPdhiMu90UjK0JtzVQVPyjXo1X7SudjInUW2xRbSGM25XY7fRoRneHQf8lbmE+bXyLamYlgzoSP8F3p0bi6etqGNMjp6bsKZqHCvbAqOvFJl78eeDUdR4ue8gf4ehfZp+F2sOSFWF9/hKp9VBA11Qrx7YGIofrJsayt1HWVs4LtEH6D83v+8gp2SHUXo0fULNWMmscGL0nKZ81+v2nK5HIrTA5n4usC71bywolPMNxpW6IhQhEVBdGe0tbfQbiHZMP++kJVuhYlLI5T14=
Content-ID: <4BAAE06211A39D40A138C3AEA8033A18@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee64c42-1b0a-4c20-67ad-08d6f033a6ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 19:16:35.7010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6030
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2ooA++QqJXVlMpml0l+q+BdnlFCXX3DPFCvyDRLpE4=;
 b=V7VdZPIW66HTni0sHwNdEjjdDESzWYwqXMwBxw2LLk5LoAJiR7gEkp792/H4jtLGYu+L8eFquUi1EoB04iJ1YctP1g14sKdnujwae/ViEaseDfs2dEtdmmSX8qEvGgK5tOZWxb7lEJQrP+ir1nxP2FQrgL8CSAuAUrHqhDUA1L0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMTE6NDM6MDlBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gS2VlcCB0aGUgcGh5c2ljYWwgYWRkcmVzcyBhbGxvY2F0aW9uIHRoYXQgaG1t
X2FkZF9kZXZpY2UgZG9lcyB3aXRoIHRoZQo+IHJlc3Qgb2YgdGhlIHJlc291cmNlIGNvZGUsIGFu
ZCBhbGxvdyBmdXR1cmUgcmV1c2Ugb2YgaXQgd2l0aG91dCB0aGUgaG1tCj4gd3JhcHBlci4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAgaW5jbHVk
ZS9saW51eC9pb3BvcnQuaCB8ICAyICsrCj4gIGtlcm5lbC9yZXNvdXJjZS5jICAgICAgfCAzOSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgbW0vaG1tLmMgICAgICAg
ICAgICAgICB8IDMzICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAzIGZpbGVz
IGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2lvcG9ydC5oIGIvaW5jbHVkZS9saW51eC9pb3BvcnQuaAo+IGlu
ZGV4IGRhMGViYWVjMjVmMC4uNzZhMzNhZTNiZjZjIDEwMDY0NAo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvaW9wb3J0LmgKPiBAQCAtMjg2LDYgKzI4Niw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCByZXNv
dXJjZV9vdmVybGFwcyhzdHJ1Y3QgcmVzb3VyY2UgKnIxLCBzdHJ1Y3QgcmVzb3VyY2UgKnIyKQo+
ICAgICAgICAgcmV0dXJuIChyMS0+c3RhcnQgPD0gcjItPmVuZCAmJiByMS0+ZW5kID49IHIyLT5z
dGFydCk7Cj4gIH0KPiAgCj4gK3N0cnVjdCByZXNvdXJjZSAqZGV2bV9yZXF1ZXN0X2ZyZWVfbWVt
X3JlZ2lvbihzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKwkJc3RydWN0IHJlc291cmNlICpiYXNlLCB1
bnNpZ25lZCBsb25nIHNpemUpOwo+ICAKPiAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+ICAj
ZW5kaWYJLyogX0xJTlVYX0lPUE9SVF9IICovCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9yZXNvdXJj
ZS5jIGIva2VybmVsL3Jlc291cmNlLmMKPiBpbmRleCAxNThmMDRlYzFkNGYuLjk5YzU4MTM0ZWQx
YyAxMDA2NDQKPiArKysgYi9rZXJuZWwvcmVzb3VyY2UuYwo+IEBAIC0xNjI4LDYgKzE2MjgsNDUg
QEAgdm9pZCByZXNvdXJjZV9saXN0X2ZyZWUoc3RydWN0IGxpc3RfaGVhZCAqaGVhZCkKPiAgfQo+
ICBFWFBPUlRfU1lNQk9MKHJlc291cmNlX2xpc3RfZnJlZSk7Cj4gIAo+ICsjaWZkZWYgQ09ORklH
X0RFVklDRV9QUklWQVRFCj4gKy8qKgo+ICsgKiBkZXZtX3JlcXVlc3RfZnJlZV9tZW1fcmVnaW9u
IC0gZmluZCBmcmVlIHJlZ2lvbiBmb3IgZGV2aWNlIHByaXZhdGUgbWVtb3J5Cj4gKyAqCj4gKyAq
IEBkZXY6IGRldmljZSBzdHJ1Y3QgdG8gYmluZCB0aGUgcmVzb3VyY2UgdG9vCj4gKyAqIEBzaXpl
OiBzaXplIGluIGJ5dGVzIG9mIHRoZSBkZXZpY2UgbWVtb3J5IHRvIGFkZAo+ICsgKiBAYmFzZTog
cmVzb3VyY2UgdHJlZSB0byBsb29rIGluCj4gKyAqCj4gKyAqIFRoaXMgZnVuY3Rpb24gdHJpZXMg
dG8gZmluZCBhbiBlbXB0eSByYW5nZSBvZiBwaHlzaWNhbCBhZGRyZXNzIGJpZyBlbm91Z2ggdG8K
PiArICogY29udGFpbiB0aGUgbmV3IHJlc291cmNlLCBzbyB0aGF0IGl0IGNhbiBsYXRlciBiZSBo
b3RwbHVnZWQgYXMgWk9ORV9ERVZJQ0UKPiArICogbWVtb3J5LCB3aGljaCBpbiB0dXJuIGFsbG9j
YXRlcyBzdHJ1Y3QgcGFnZXMuCj4gKyAqLwo+ICtzdHJ1Y3QgcmVzb3VyY2UgKmRldm1fcmVxdWVz
dF9mcmVlX21lbV9yZWdpb24oc3RydWN0IGRldmljZSAqZGV2LAo+ICsJCXN0cnVjdCByZXNvdXJj
ZSAqYmFzZSwgdW5zaWduZWQgbG9uZyBzaXplKQo+ICt7Cj4gKwlyZXNvdXJjZV9zaXplX3QgZW5k
LCBhZGRyOwo+ICsJc3RydWN0IHJlc291cmNlICpyZXM7Cj4gKwo+ICsJc2l6ZSA9IEFMSUdOKHNp
emUsIDFVTCA8PCBQQV9TRUNUSU9OX1NISUZUKTsKPiArCWVuZCA9IG1pbl90KHVuc2lnbmVkIGxv
bmcsIGJhc2UtPmVuZCwgKDFVTCA8PCBNQVhfUEhZU01FTV9CSVRTKSAtIDEpOwoKRXZlbiBmaXhl
ZCBpdCB0byB1c2UgbWluX3QKCj4gKwlhZGRyID0gZW5kIC0gc2l6ZSArIDFVTDsKPiArCWZvciAo
OyBhZGRyID4gc2l6ZSAmJiBhZGRyID49IGJhc2UtPnN0YXJ0OyBhZGRyIC09IHNpemUpIHsKPiAr
CQlpZiAocmVnaW9uX2ludGVyc2VjdHMoYWRkciwgc2l6ZSwgMCwgSU9SRVNfREVTQ19OT05FKSAh
PQo+ICsJCQkJUkVHSU9OX0RJU0pPSU5UKQo+ICsJCQljb250aW51ZTsKClRoZSBGSVhNRSBhYm91
dCB0aGUgYWxnb3JpdGhtIGNvc3Qgc2VlbXMganVzdGlmaWVkIHRob3VnaCwgeWlrZXMuCgo+ICsK
PiArCQlyZXMgPSBkZXZtX3JlcXVlc3RfbWVtX3JlZ2lvbihkZXYsIGFkZHIsIHNpemUsIGRldl9u
YW1lKGRldikpOwo+ICsJCWlmICghcmVzKQo+ICsJCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsK
PiArCQlyZXMtPmRlc2MgPSBJT1JFU19ERVNDX0RFVklDRV9QUklWQVRFX01FTU9SWTsKCkkgd29u
ZGVyIGlmIElPUkVTX0RFU0NfREVWSUNFX1BSSVZBVEVfTUVNT1JZIHNob3VsZCBiZSBhIGZ1bmN0
aW9uCmFyZ3VtZW50PwoKTm90IHJlYWxseSBhbnkgc3Vic3RhbnRpdmUgcmVtYXJrLCBzbwoKUmV2
aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KCkphc29uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
