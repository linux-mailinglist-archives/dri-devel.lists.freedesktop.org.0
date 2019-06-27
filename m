Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C493B58FAB
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BFC6E869;
	Fri, 28 Jun 2019 01:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10051.outbound.protection.outlook.com [40.107.1.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61AA6E182;
 Thu, 27 Jun 2019 16:29:47 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6032.eurprd05.prod.outlook.com (20.178.127.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 16:29:45 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2008.014; Thu, 27 Jun 2019
 16:29:45 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 12/25] memremap: add a migrate_to_ram method to struct
 dev_pagemap_ops
Thread-Topic: [PATCH 12/25] memremap: add a migrate_to_ram method to struct
 dev_pagemap_ops
Thread-Index: AQHVLBqZBQCOhXKkekmD+Za0eny3n6avsW2A
Date: Thu, 27 Jun 2019 16:29:45 +0000
Message-ID: <20190627162439.GD9499@mellanox.com>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-13-hch@lst.de>
In-Reply-To: <20190626122724.13313-13-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.199.206.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 910ae93e-1c98-4933-e059-08d6fb1caa3b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6032; 
x-ms-traffictypediagnostic: VI1PR05MB6032:
x-microsoft-antispam-prvs: <VI1PR05MB60323BDF1EC27F3D38D0D595CFFD0@VI1PR05MB6032.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(39860400002)(376002)(136003)(199004)(189003)(6512007)(102836004)(5660300002)(7736002)(305945005)(6116002)(486006)(478600001)(476003)(81156014)(256004)(386003)(11346002)(53936002)(76176011)(3846002)(2616005)(52116002)(446003)(81166006)(6436002)(8936002)(68736007)(66066001)(6246003)(316002)(2906002)(54906003)(229853002)(99286004)(36756003)(6486002)(26005)(6506007)(186003)(64756008)(6916009)(8676002)(7416002)(66946007)(1076003)(66476007)(14454004)(4326008)(86362001)(66556008)(66446008)(73956011)(71190400001)(71200400001)(25786009)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6032;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FQumiSKh7GVdRl14hBXAy3T/ENWqYM4HWMyt/KiMQB3yuvYG+MOIrLUCPq4S72Bqu5H/LaAUqWhI7Tr8MmgAWraK9rbKVPCD7phnzfo27BCXksIEnr+JiI8gC8Dkz4BoJWEulCIXVdw0MTHsUNYkf4YaA37Jj+hVFrb/3EAHXH56uihx5XRp67A0kIrQyIzowuvy9TMI00/W3AAZlgs8xR6rTn2nfawvNYsN6H0PQmYbU+RUQ2+60Uw5GlYfhzxUkZUBXL3GTMM2930c4vcFAHzQj/BOGwGVL7BXrCUqVPtvAy7rIu5zFs0PBD4C/zDx2ySDvoXcIZjXKZZtgXHwP25hvbKI4+zkbxKJn/yyiRnclDN67c5oFNBFejLblul4zRdK/fFAbZIVtSb6UpmyMqIdIxc06082NQNUV3bmkIg=
Content-ID: <D936285C7F16454CABEEFE9D1BD77309@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910ae93e-1c98-4933-e059-08d6fb1caa3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 16:29:45.6208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6032
X-Mailman-Approved-At: Fri, 28 Jun 2019 01:25:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Acwz3hHPfD+Le/jb5+cmcROosiINY+hQq7uRwwksQzk=;
 b=gFFEYLwEZzcaYgGPwF102oxi9KMrRut1jd93LscZWuscZkJ7vz97pan3/8x2vEXXJM9WtbJlA14NR8UcJbAkHW9w3JeIedSKTFFPtORHMOvOGhoGZb7RAvRv/Y5BxudV1nlvg+ILuTvFuVVL0MF4CwUE0spAe6YVXUlUxB7bc6I=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
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

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6Mjc6MTFQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhpcyByZXBsYWNlcyB0aGUgaGFja3kgLT5mYXVsdCBjYWxsYmFjaywgd2hp
Y2ggaXMgY3VycmVudGx5IGRpcmVjdGx5Cj4gY2FsbGVkIGZyb20gY29tbW9uIGNvZGUgdGhyb3Vn
aCBhIGhtbSBzcGVjaWZpYyBkYXRhIHN0cnVjdHVyZSBhcyBhbgo+IGV4ZXJjaXNlIGluIGxheWVy
aW5nIHZpb2xhdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+Cj4gUmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlh
LmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9saW51eC9obW0uaCAgICAgIHwgIDYgLS0tLS0tCj4gIGlu
Y2x1ZGUvbGludXgvbWVtcmVtYXAuaCB8ICA2ICsrKysrKwo+ICBpbmNsdWRlL2xpbnV4L3N3YXBv
cHMuaCAgfCAxNSAtLS0tLS0tLS0tLS0tLS0KPiAga2VybmVsL21lbXJlbWFwLmMgICAgICAgIHwg
MzUgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgbW0vaG1tLmMgICAgICAg
ICAgICAgICAgIHwgMTMgKysrKystLS0tLS0tLQo+ICBtbS9tZW1vcnkuYyAgICAgICAgICAgICAg
fCAgOSArKy0tLS0tLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA2NyBk
ZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5j
b20+CiAKSSd2ZXIgaGVhcmQgdGhlcmUgYXJlIHNvbWUgb3RoZXIgdXNlIG1vZGVscyBmb3IgZmF1
bHQoKSBoZXJlIGJleW9uZAptaWdyYXRlIHRvIHJhbSwgYnV0IHdlIGNhbiByZW5hbWUgaXQgaWYg
d2UgZXZlciBzZWUgdGhlbS4KCj4gK3N0YXRpYyB2bV9mYXVsdF90IGhtbV9kZXZtZW1fbWlncmF0
ZV90b19yYW0oc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4gIHsKPiAtCXN0cnVjdCBobW1fZGV2bWVt
ICpkZXZtZW0gPSBwYWdlLT5wZ21hcC0+ZGF0YTsKPiArCXN0cnVjdCBobW1fZGV2bWVtICpkZXZt
ZW0gPSB2bWYtPnBhZ2UtPnBnbWFwLT5kYXRhOwo+ICAKPiAtCXJldHVybiBkZXZtZW0tPm9wcy0+
ZmF1bHQoZGV2bWVtLCB2bWEsIGFkZHIsIHBhZ2UsIGZsYWdzLCBwbWRwKTsKPiArCXJldHVybiBk
ZXZtZW0tPm9wcy0+ZmF1bHQoZGV2bWVtLCB2bWYtPnZtYSwgdm1mLT5hZGRyZXNzLCB2bWYtPnBh
Z2UsCj4gKwkJCXZtZi0+ZmxhZ3MsIHZtZi0+cG1kKTsKPiAgfQoKTmV4dCBjeWNsZSB3ZSBzaG91
bGQgcHJvYmFibHkgcmVuYW1lIHRoaXMgZmF1bHQgdG8gbWlncmF0ZV90b19yYW0gYXMKd2VsbCBh
bmQgcGFzcyBpbiB0aGUgdm1mLi4KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
