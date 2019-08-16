Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0890591197
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820C488735;
	Sat, 17 Aug 2019 15:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10059.outbound.protection.outlook.com [40.107.1.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BF36E369;
 Fri, 16 Aug 2019 17:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxllZOQnU6Aw3flFeguQQpdO2HSDBxCM54/3QtsSJPlkmgBm085JKAYH4T5g0QnYirngaktF6T4TqYJtUWrH0zcHtFMmStVQB3A1Y05O85ZFGu314BiIW5VgaBhpCYe+OkKjY+cBjlhvsOI9LfOFJxvDmhtF580ra9P3H5GK1xXTyqDw7EKPa8wgDuIPyn1XfXhYxK9o/K5xGc1InyzPT9O3WPKSVBae/m943AyUyPHMLB5IdBDYN8sUB46xjow+hO96DH8POG5KtJB6JVw9T620AM3hkwe+d5cBp2oYEIfE1QSNbHdVUPkPdbxO01FIQC6Ge8ARInLFBxsVemmWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWdBC3FlUndlpjTnqFuWvkt45M9W/Mx5e/1DMPvIPcQ=;
 b=C1v3MkmT+Mc77VKqQ0rmOEDUdUfnZM41zoGRlHUYOUggp3xOEA3uOu4W0A6jVLTjcZqQdScQXJ74jLg5ERo/V5iem8IVNAoUfwVO0YNXLg/rWH+RgZRrfqAWz/tYqOSOxv0bVadymNwgLqyrAeagYI159EPY9BCAsdNbzZcuqc4frJisv9ttjV4jg7TLkqniG/lrtifcyEGq+OmXf5i6K9abbH1E8ETkThWSYijkYKU0UGm5TbytfFwShNBXDmS6TBe9Cv/J3mXt26O+95dTEgapDoOjdPnJ6R/sugyUwlZKv+/lvKT1srBYhv6TRbb1S7EUlcGxZrhsvrn8FpDMrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4399.eurprd05.prod.outlook.com (52.133.13.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 16 Aug 2019 17:11:07 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 17:11:07 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/10] mm: turn migrate_vma upside down
Thread-Topic: [PATCH 01/10] mm: turn migrate_vma upside down
Thread-Index: AQHVUnY4TvdvZdqG70SoVm3XhXkEbab+BjuA
Date: Fri, 16 Aug 2019 17:11:07 +0000
Message-ID: <20190816171101.GK5412@mellanox.com>
References: <20190814075928.23766-1-hch@lst.de>
 <20190814075928.23766-2-hch@lst.de>
In-Reply-To: <20190814075928.23766-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::27) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d71d9bbf-6941-439b-a290-08d7226cba06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4399; 
x-ms-traffictypediagnostic: VI1PR05MB4399:
x-microsoft-antispam-prvs: <VI1PR05MB43991B2F32ECF3B7D641FA44CFAF0@VI1PR05MB4399.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(189003)(199004)(6512007)(186003)(53936002)(1076003)(305945005)(316002)(7736002)(76176011)(52116002)(66446008)(2906002)(6116002)(8936002)(26005)(2616005)(6246003)(102836004)(229853002)(86362001)(71190400001)(81156014)(81166006)(36756003)(3846002)(8676002)(99286004)(25786009)(66066001)(256004)(4326008)(14454004)(6916009)(6506007)(71200400001)(54906003)(446003)(14444005)(478600001)(386003)(6486002)(6436002)(476003)(66946007)(11346002)(7416002)(66476007)(66556008)(64756008)(486006)(33656002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4399;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bZfAhx1PrhM8Qwxl1AenhVYx9SODIVCdVb5j7JpjsmYK0xydkOGfqkDf/w2L/aNxyNpSDkfcbl/RGcc1+r1xecsmurgHzJJfuIHu4PeaEPue8H4DOGMp3Mj0Mz+BXVOq3oZ8KwhYxrwETnxRNGatDIWEdF4pXLY9eXYEf6K5PC8TdV0uAfa1xTbXXkMbMHRgQBivDMl4KgIAQWvEWdeWsv29/6C2oJcxuiSjI3O7PbdSqnO+0mj5kCwtEPkpwcQTExKB/3SAjBfVG/fXpze4ngKZGed/IFik6N7Mm6h1ijakTz2E3VPD2QI15ZDQgrOQhvf9MIfIVe1mQNnsWN4NgBEYqvkd1ma8EHClWRdWNAFB4UhUqSFofz7dNaKZ/lnWWfFuvBdjuGpYcAJx94UBSFkoBbReFfZMV/S40UR9d0M=
x-ms-exchange-transport-forked: True
Content-ID: <123FCA9276F3AF499F1A0D076B4702FA@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71d9bbf-6941-439b-a290-08d7226cba06
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 17:11:07.1752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rpw7z2OiF+qhp7lHU29mvPYjoS2OpUn/0Vaks9bMBDaqOfExZNfbcs+QHsrqioEhGPQdpX5x3t6EIPrjPTo5Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4399
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWdBC3FlUndlpjTnqFuWvkt45M9W/Mx5e/1DMPvIPcQ=;
 b=flnumRk7YmFcARWxs7E2qqNRhqYcdHYL9XGFs/YL6R7yojafgvTbhAbgeEWl6JpwqU77uu/9RykeCoPBC1pYlaAE+9mxOpeETyBlpxPN/doDj/moU1yhItSiwNbMYfH1Wh7yobTQtYZNlPW470FR2JEjEj+GwDg5i88kqpC3itI=
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
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bharata B Rao <bharata@linux.ibm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMDk6NTk6MTlBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlcmUgaXNuJ3QgYW55IGdvb2QgcmVhc29uIHRvIHBhc3MgY2FsbGJhY2tz
IHRvIG1pZ3JhdGVfdm1hLiAgSW5zdGVhZAo+IHdlIGNhbiBqdXN0IGV4cG9ydCB0aGUgdGhyZWUg
c3RlcHMgZG9uZSBieSB0aGlzIGZ1bmN0aW9uIHRvIGRyaXZlcnMgYW5kCj4gbGV0IHRoZW0gc2Vx
dWVuY2UgdGhlIG9wZXJhdGlvbiB3aXRob3V0IGNhbGxiYWNrcy4gIFRoaXMgcmVtb3ZlcyBhIGxv
dAo+IG9mIGJvaWxlcnBsYXRlIGNvZGUgYXMtaXMsIGFuZCB3aWxsIGFsbG93IHRoZSBkcml2ZXJz
IHRvIGRyYXN0aWNhbGx5Cj4gaW1wcm92ZSBjb2RlIGZsb3cgYW5kIGVycm9yIGhhbmRsaW5nIGZ1
cnRoZXIgb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+Cj4gUmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4K
PiAtLS0KPiAgRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0ICAgICAgICAgICAgICAgfCAgNTUgKy0t
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIHwgMTIyICsrKysr
KystLS0tLS0KPiAgaW5jbHVkZS9saW51eC9taWdyYXRlLmggICAgICAgICAgICAgICAgfCAxMTgg
KystLS0tLS0tLS0tCj4gIG1tL21pZ3JhdGUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MjQ0ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCAxOTUgaW5z
ZXJ0aW9ucygrKSwgMzQ0IGRlbGV0aW9ucygtKQoKVGhlIG1lY2hhbmljYWwgdHJhbnNmb3JtYXRp
b24gbG9va3MgT0ssIEkgc3F1YXNoZWQgdGhlIGJlbG93IG5pdHMgaW4sCmxldCBtZSBrbm93IGlm
IEkgZ290IGl0IHdyb25nCgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFu
b3guY29tPgoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdm0vaG1tLnJzdCBiL0RvY3VtZW50
YXRpb24vdm0vaG1tLnJzdAppbmRleCA0ZjgxYzc3MDU5ZTMwNS4uMGE1OTYwYmVjY2Y3NmQgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdm0vaG1tLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3Zt
L2htbS5yc3QKQEAgLTMzOSw5ICszMzksOCBAQCBNaWdyYXRpb24gdG8gYW5kIGZyb20gZGV2aWNl
IG1lbW9yeQogPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KIAogQmVjYXVzZSB0
aGUgQ1BVIGNhbm5vdCBhY2Nlc3MgZGV2aWNlIG1lbW9yeSwgbWlncmF0aW9uIG11c3QgdXNlIHRo
ZSBkZXZpY2UgRE1BCi1lbmdpbmUgdG8gcGVyZm9ybSBjb3B5IGZyb20gYW5kIHRvIGRldmljZSBt
ZW1vcnkuIEZvciB0aGlzIHdlIG5lZWQgYSBuZXcgdG8KLXVzZSBtaWdyYXRlX3ZtYV9zZXR1cCgp
LCBtaWdyYXRlX3ZtYV9wYWdlcygpLCBhbmQgbWlncmF0ZV92bWFfZmluYWxpemUoKQotaGVscGVy
cy4KK2VuZ2luZSB0byBwZXJmb3JtIGNvcHkgZnJvbSBhbmQgdG8gZGV2aWNlIG1lbW9yeS4gRm9y
IHRoaXMgd2UgbmVlZCB0byB1c2UKK21pZ3JhdGVfdm1hX3NldHVwKCksIG1pZ3JhdGVfdm1hX3Bh
Z2VzKCksIGFuZCBtaWdyYXRlX3ZtYV9maW5hbGl6ZSgpIGhlbHBlcnMuCiAKIAogTWVtb3J5IGNn
cm91cCAobWVtY2cpIGFuZCByc3MgYWNjb3VudGluZwpkaWZmIC0tZ2l0IGEvbW0vbWlncmF0ZS5j
IGIvbW0vbWlncmF0ZS5jCmluZGV4IDk5MzM4NmNiNTMzNThkLi4wZTc4ZWJkNzIwYzBlNCAxMDA2
NDQKLS0tIGEvbW0vbWlncmF0ZS5jCisrKyBiL21tL21pZ3JhdGUuYwpAQCAtMjYyMiwxMCArMjYy
Miw5IEBAIHN0YXRpYyB2b2lkIG1pZ3JhdGVfdm1hX3VubWFwKHN0cnVjdCBtaWdyYXRlX3ZtYSAq
bWlncmF0ZSkKICAqIHN1Y2Nlc3NmdWxseSBtaWdyYXRlZCwgYW5kIHdoaWNoIHdlcmUgbm90LiAg
U3VjY2Vzc2Z1bGx5IG1pZ3JhdGVkIHBhZ2VzIHdpbGwKICAqIGhhdmUgdGhlIE1JR1JBVEVfUEZO
X01JR1JBVEUgZmxhZyBzZXQgZm9yIHRoZWlyIHNyYyBhcnJheSBlbnRyeS4KICAqCi0gKiBJdCBp
cyBzYWZlIHRvIHVwZGF0ZSBkZXZpY2UgcGFnZSB0YWJsZSBmcm9tIHdpdGhpbiB0aGUgZmluYWxp
emVfYW5kX21hcCgpCi0gKiBjYWxsYmFjayBiZWNhdXNlIGJvdGggZGVzdGluYXRpb24gYW5kIHNv
dXJjZSBwYWdlIGFyZSBzdGlsbCBsb2NrZWQsIGFuZCB0aGUKLSAqIG1tYXBfc2VtIGlzIGhlbGQg
aW4gcmVhZCBtb2RlIChoZW5jZSBubyBvbmUgY2FuIHVubWFwIHRoZSByYW5nZSBiZWluZwotICog
bWlncmF0ZWQpLgorICogSXQgaXMgc2FmZSB0byB1cGRhdGUgZGV2aWNlIHBhZ2UgdGFibGUgYWZ0
ZXIgbWlncmF0ZV92bWFfcGFnZXMoKSBiZWNhdXNlCisgKiBib3RoIGRlc3RpbmF0aW9uIGFuZCBz
b3VyY2UgcGFnZSBhcmUgc3RpbGwgbG9ja2VkLCBhbmQgdGhlIG1tYXBfc2VtIGlzIGhlbGQKKyAq
IGluIHJlYWQgbW9kZSAoaGVuY2Ugbm8gb25lIGNhbiB1bm1hcCB0aGUgcmFuZ2UgYmVpbmcgbWln
cmF0ZWQpLgogICoKICAqIE9uY2UgdGhlIGNhbGxlciBpcyBkb25lIGNsZWFuaW5nIHVwIHRoaW5n
cyBhbmQgdXBkYXRpbmcgaXRzIHBhZ2UgdGFibGUgKGlmIGl0CiAgKiBjaG9zZSB0byBkbyBzbywg
dGhpcyBpcyBub3QgYW4gb2JsaWdhdGlvbikgaXQgZmluYWxseSBjYWxscwpAQCAtMjY1NywxMCAr
MjY1NiwxMSBAQCBpbnQgbWlncmF0ZV92bWFfc2V0dXAoc3RydWN0IG1pZ3JhdGVfdm1hICphcmdz
KQogCWFyZ3MtPm5wYWdlcyA9IDA7CiAKIAltaWdyYXRlX3ZtYV9jb2xsZWN0KGFyZ3MpOwotCWlm
IChhcmdzLT5jcGFnZXMpCi0JCW1pZ3JhdGVfdm1hX3ByZXBhcmUoYXJncyk7Ci0JaWYgKGFyZ3Mt
PmNwYWdlcykKLQkJbWlncmF0ZV92bWFfdW5tYXAoYXJncyk7CisJaWYgKCFhcmdzLT5jcGFnZXMp
CisJCXJldHVybiAwOworCisJbWlncmF0ZV92bWFfcHJlcGFyZShhcmdzKTsKKwltaWdyYXRlX3Zt
YV91bm1hcChhcmdzKTsKIAogCS8qCiAJICogQXQgdGhpcyBwb2ludCBwYWdlcyBhcmUgbG9ja2Vk
IGFuZCB1bm1hcHBlZCwgYW5kIHRodXMgdGhleSBoYXZlCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
