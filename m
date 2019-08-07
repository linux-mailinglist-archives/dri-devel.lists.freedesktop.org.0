Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9428085BEA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ECE6E7D8;
	Thu,  8 Aug 2019 07:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60062.outbound.protection.outlook.com [40.107.6.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D526E742;
 Wed,  7 Aug 2019 17:45:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNwTfZ0wrE+jt28SJvIhXnkuU+n/1GuJebgT9ss+ko15QQhSDK2RFVqo8ckacAtIuains4xSDitA0pHoh6+vMSleGADcDa74VR4JPN0qIXtlcv+omeb/GNg8zwaUPVrShpcMDtvPv4ckW5uO4EpKKXrQoE7AJQMshO2RMcE+6iu7H5TmSVPdfArzAAZ1qtTHOE7jxmxJQIwn4Qm8Un7RGmOM3z6v14kn/PfiWD+BM94jCWE5EMVE0kcQdee4FGsQAuOIcnAOR/xv5EZH4/CmNI9hu+5g58IFUCb1BwdjAHeRmyBcCZNliBNxSLNTDTdn8vfudJLyp8dAdEaCGuHhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvvJ2eL2eZjkefdvEIf+VsH6qjNAkNeA8tF8jjvs00Y=;
 b=jMhFfihAW9rtjL4uUHcZhfCi5vg2J6A2lwmxoeQrMIlAlrIsua38NlIRUlKYJh4n4BoardYApSr/UMiU0EbXv1jOT55REa3oqjLS1zXvQWE7pDi+Ye7BG2T9Zv9fgycscac3IM36SZzvknC/0IsRZ9J55t9jAxLqo8/rjdb+K5PJPona61L41S96zftKmB6syayKiUkUdjzKQt8BsUvkVBNgXV+wRF1QF8fDsmIqLFJcvawzsLOAzXDoh/iR0k2Whr6HgbA78XZLPq2A4ufG5VBb3NDNdMW6uV5wGcDJ41VA+ick77+GK1v3PFVancJnCVk981a9QmPDKI9zRtuTOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6607.eurprd05.prod.outlook.com (20.178.205.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 17:45:53 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 17:45:53 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Topic: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
Thread-Index: AQHVTHDc5B4IgstYQk6yBJaVfn8xGqbv9wIA
Date: Wed, 7 Aug 2019 17:45:53 +0000
Message-ID: <20190807174548.GJ1571@mellanox.com>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de>
In-Reply-To: <20190806160554.14046-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQBPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00::41) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c99e3ea0-d749-413d-05b3-08d71b5f17cd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6607; 
x-ms-traffictypediagnostic: VI1PR05MB6607:
x-microsoft-antispam-prvs: <VI1PR05MB66071160AE89CD17BEE8D55BCFD40@VI1PR05MB6607.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(199004)(189003)(26005)(446003)(186003)(81156014)(54906003)(2616005)(36756003)(1076003)(33656002)(110136005)(6116002)(66446008)(66476007)(66556008)(64756008)(3846002)(4326008)(66946007)(2906002)(25786009)(486006)(5660300002)(86362001)(6512007)(6486002)(68736007)(66066001)(102836004)(229853002)(305945005)(256004)(316002)(7416002)(81166006)(476003)(53936002)(11346002)(6436002)(6246003)(386003)(8676002)(52116002)(99286004)(14454004)(7736002)(6506007)(76176011)(8936002)(71190400001)(478600001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6607;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aNoLDYWnlYfmrPNtvKWoB776Gsw5k+YFnOM1DyH9TLFc5HK4v/0vvNa+9xz0/KDtJqYT8AI45YV3IW8MOl3LUqhklynN+fAdiqaxrUgfeov4tQzGifHLet5MeKNkmxnd9afI6KwRfTO3FrF0xUdfXYg1Zg4SqwpGqaCYRGm2OCchfnZ7OM731iDo/wNn4GqBjt1GNKJjZu8a7tP73fEPWY1XFoPGgsfcQVePV5oz+N+ktMafrO5P0JkmsC9kSCFtg/oRuKPgPQbD8yH9Xjfvpv9aPU/rJrka8mEnWjBSbEYRH0lLcgw+kDs90/IFqads/V266w3TDNkGn45PnKbP95hebDgFDZjYyf08DAn8dScYHma6SxBzB4OKfTkkT8zW8PMWXP1gRbEdS1n3D06XupdwCRb6U/czC2Ly/SH/gTg=
Content-ID: <1920BF82988BC542A48F1F6D6A0BA986@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99e3ea0-d749-413d-05b3-08d71b5f17cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 17:45:53.3318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6607
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvvJ2eL2eZjkefdvEIf+VsH6qjNAkNeA8tF8jjvs00Y=;
 b=NJb0APCOIhWxOMMjzvUQp/k/Ra8sJQJB1yDxf1xgZ+5SqDIdLTQ08uNiWk2LeRpmCzuvJXZz8jYio98RCwFmpjWSV0rVxG54UAt7gRepK+RahYS5cxdWSAeeE+h2HQuisLd2IubD5n3kf15i5dv5u5bvpt2jeglKKIBB4qJzR/4=
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDc6MDU6NDJQTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlcmUgaXMgb25seSBhIHNpbmdsZSBwbGFjZSB3aGVyZSB0aGUgcGdtYXAg
aXMgcGFzc2VkIG92ZXIgYSBmdW5jdGlvbgo+IGNhbGwsIHNvIHJlcGxhY2UgaXQgd2l0aCBsb2Nh
bCB2YXJpYWJsZXMgaW4gdGhlIHBsYWNlcyB3aGVyZSB3ZSBkZWFsCj4gd2l0aCB0aGUgcGdtYXAu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gIG1t
L2htbS5jIHwgNjIgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDM1IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4gaW5kZXggOWE5
MDg5MDJlNGNjLi5kNjZmYTI5YjQyZTAgMTAwNjQ0Cj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtMjc4
LDcgKzI3OCw2IEBAIEVYUE9SVF9TWU1CT0woaG1tX21pcnJvcl91bnJlZ2lzdGVyKTsKPiAgCj4g
IHN0cnVjdCBobW1fdm1hX3dhbGsgewo+ICAJc3RydWN0IGhtbV9yYW5nZQkqcmFuZ2U7Cj4gLQlz
dHJ1Y3QgZGV2X3BhZ2VtYXAJKnBnbWFwOwo+ICAJdW5zaWduZWQgbG9uZwkJbGFzdDsKPiAgCXVu
c2lnbmVkIGludAkJZmxhZ3M7Cj4gIH07Cj4gQEAgLTQ3NSw2ICs0NzQsNyBAQCBzdGF0aWMgaW50
IGhtbV92bWFfaGFuZGxlX3BtZChzdHJ1Y3QgbW1fd2FsayAqd2FsaywKPiAgI2lmZGVmIENPTkZJ
R19UUkFOU1BBUkVOVF9IVUdFUEFHRQo+ICAJc3RydWN0IGhtbV92bWFfd2FsayAqaG1tX3ZtYV93
YWxrID0gd2Fsay0+cHJpdmF0ZTsKPiAgCXN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlID0gaG1tX3Zt
YV93YWxrLT5yYW5nZTsKPiArCXN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXAgPSBOVUxMOwo+ICAJ
dW5zaWduZWQgbG9uZyBwZm4sIG5wYWdlcywgaTsKPiAgCWJvb2wgZmF1bHQsIHdyaXRlX2ZhdWx0
Owo+ICAJdWludDY0X3QgY3B1X2ZsYWdzOwo+IEBAIC00OTAsMTcgKzQ5MCwxNCBAQCBzdGF0aWMg
aW50IGhtbV92bWFfaGFuZGxlX3BtZChzdHJ1Y3QgbW1fd2FsayAqd2FsaywKPiAgCXBmbiA9IHBt
ZF9wZm4ocG1kKSArIHB0ZV9pbmRleChhZGRyKTsKPiAgCWZvciAoaSA9IDA7IGFkZHIgPCBlbmQ7
IGFkZHIgKz0gUEFHRV9TSVpFLCBpKyssIHBmbisrKSB7Cj4gIAkJaWYgKHBtZF9kZXZtYXAocG1k
KSkgewo+IC0JCQlobW1fdm1hX3dhbGstPnBnbWFwID0gZ2V0X2Rldl9wYWdlbWFwKHBmbiwKPiAt
CQkJCQkgICAgICBobW1fdm1hX3dhbGstPnBnbWFwKTsKPiAtCQkJaWYgKHVubGlrZWx5KCFobW1f
dm1hX3dhbGstPnBnbWFwKSkKPiArCQkJcGdtYXAgPSBnZXRfZGV2X3BhZ2VtYXAocGZuLCBwZ21h
cCk7Cj4gKwkJCWlmICh1bmxpa2VseSghcGdtYXApKQo+ICAJCQkJcmV0dXJuIC1FQlVTWTsKClVu
cmVsYXRlZCB0byB0aGlzIHBhdGNoLCBidXQgd2hhdCBpcyB0aGUgcG9pbnQgb2YgZ2V0dGluZyBj
aGVja2luZwp0aGF0IHRoZSBwZ21hcCBleGlzdHMgZm9yIHRoZSBwYWdlIGFuZCB0aGVuIGltbWVk
aWF0ZWx5IHJlbGVhc2luZyBpdD8KVGhpcyBjb2RlIGhhcyB0aGlzIHBhdHRlcm4gaW4gc2V2ZXJh
bCBwbGFjZXMuCgpJdCBmZWVscyByYWN5Cgo+ICAJCX0KPiAgCQlwZm5zW2ldID0gaG1tX2Rldmlj
ZV9lbnRyeV9mcm9tX3BmbihyYW5nZSwgcGZuKSB8IGNwdV9mbGFnczsKPiAgCX0KPiAtCWlmICho
bW1fdm1hX3dhbGstPnBnbWFwKSB7Cj4gLQkJcHV0X2Rldl9wYWdlbWFwKGhtbV92bWFfd2Fsay0+
cGdtYXApOwo+IC0JCWhtbV92bWFfd2Fsay0+cGdtYXAgPSBOVUxMOwoKUHV0dGluZyB0aGUgdmFs
dWUgaW4gdGhlIGhtbV92bWFfd2FsayB3b3VsZCBoYXZlIG1hZGUgc29tZSBzZW5zZSB0byBtZQpp
ZiB0aGUgcGdtYXAgd2FzIG5vdCBzZXQgdG8gTlVMTCBhbGwgb3ZlciB0aGUgcGxhY2UuIFRoZW4g
dGhlIG1vc3QKeGFfbG9hZHMgd291bGQgYmUgZWxpbWluYXRlZCwgYXMgSSB3b3VsZCBleHBlY3Qg
dGhlIHBnbWFwIHRlbmRzIHRvIGJlCm1vc3RseSB1bmlmb3JtIGZvciB0aGVzZSB1c2UgY2FzZXMu
CgpJcyB0aGVyZSBzb21lIHJlYXNvbiB0aGUgcGdtYXAgcmVmIGNhbid0IGJlIGhlbGQgYWNyb3Nz
CmZhdWx0aW5nL3NsZWVwaW5nPyBpZSBsaWtlIGJlbG93LgoKQW55aG93LCBJIGxvb2tlZCBvdmVy
IHRoaXMgcHJldHR5IGNhcmVmdWxseSBhbmQgdGhlIGNoYW5nZSBsb29rcwpmdW5jdGlvbmFsbHkg
T0ssIEkganVzdCBkb24ndCBrbm93IHdoeSB0aGUgY29kZSBpcyBsaWtlIHRoaXMgaW4gdGhlCmZp
cnN0IHBsYWNlLgoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNv
bT4KCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IDlhOTA4OTAyZTRjYzM4
Li40ZTMwMTI4YzIzYTUwNSAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAg
LTQ5NywxMCArNDk3LDYgQEAgc3RhdGljIGludCBobW1fdm1hX2hhbmRsZV9wbWQoc3RydWN0IG1t
X3dhbGsgKndhbGssCiAJCX0KIAkJcGZuc1tpXSA9IGhtbV9kZXZpY2VfZW50cnlfZnJvbV9wZm4o
cmFuZ2UsIHBmbikgfCBjcHVfZmxhZ3M7CiAJfQotCWlmIChobW1fdm1hX3dhbGstPnBnbWFwKSB7
Ci0JCXB1dF9kZXZfcGFnZW1hcChobW1fdm1hX3dhbGstPnBnbWFwKTsKLQkJaG1tX3ZtYV93YWxr
LT5wZ21hcCA9IE5VTEw7Ci0JfQogCWhtbV92bWFfd2Fsay0+bGFzdCA9IGVuZDsKIAlyZXR1cm4g
MDsKICNlbHNlCkBAIC02MDQsMTAgKzYwMCw2IEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV9oYW5kbGVf
cHRlKHN0cnVjdCBtbV93YWxrICp3YWxrLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJcmV0dXJuIDA7
CiAKIGZhdWx0OgotCWlmIChobW1fdm1hX3dhbGstPnBnbWFwKSB7Ci0JCXB1dF9kZXZfcGFnZW1h
cChobW1fdm1hX3dhbGstPnBnbWFwKTsKLQkJaG1tX3ZtYV93YWxrLT5wZ21hcCA9IE5VTEw7Ci0J
fQogCXB0ZV91bm1hcChwdGVwKTsKIAkvKiBGYXVsdCBhbnkgdmlydHVhbCBhZGRyZXNzIHdlIHdl
cmUgYXNrZWQgdG8gZmF1bHQgKi8KIAlyZXR1cm4gaG1tX3ZtYV93YWxrX2hvbGVfKGFkZHIsIGVu
ZCwgZmF1bHQsIHdyaXRlX2ZhdWx0LCB3YWxrKTsKQEAgLTY5MCwxNiArNjgyLDYgQEAgc3RhdGlj
IGludCBobW1fdm1hX3dhbGtfcG1kKHBtZF90ICpwbWRwLAogCQkJcmV0dXJuIHI7CiAJCX0KIAl9
Ci0JaWYgKGhtbV92bWFfd2Fsay0+cGdtYXApIHsKLQkJLyoKLQkJICogV2UgZG8gcHV0X2Rldl9w
YWdlbWFwKCkgaGVyZSBhbmQgbm90IGluIGhtbV92bWFfaGFuZGxlX3B0ZSgpCi0JCSAqIHNvIHRo
YXQgd2UgY2FuIGxldmVyYWdlIGdldF9kZXZfcGFnZW1hcCgpIG9wdGltaXphdGlvbiB3aGljaAot
CQkgKiB3aWxsIG5vdCByZS10YWtlIGEgcmVmZXJlbmNlIG9uIGEgcGdtYXAgaWYgd2UgYWxyZWFk
eSBoYXZlCi0JCSAqIG9uZS4KLQkJICovCi0JCXB1dF9kZXZfcGFnZW1hcChobW1fdm1hX3dhbGst
PnBnbWFwKTsKLQkJaG1tX3ZtYV93YWxrLT5wZ21hcCA9IE5VTEw7Ci0JfQogCXB0ZV91bm1hcChw
dGVwIC0gMSk7CiAKIAlobW1fdm1hX3dhbGstPmxhc3QgPSBhZGRyOwpAQCAtNzUxLDEwICs3MzMs
NiBAQCBzdGF0aWMgaW50IGhtbV92bWFfd2Fsa19wdWQocHVkX3QgKnB1ZHAsCiAJCQlwZm5zW2ld
ID0gaG1tX2RldmljZV9lbnRyeV9mcm9tX3BmbihyYW5nZSwgcGZuKSB8CiAJCQkJICBjcHVfZmxh
Z3M7CiAJCX0KLQkJaWYgKGhtbV92bWFfd2Fsay0+cGdtYXApIHsKLQkJCXB1dF9kZXZfcGFnZW1h
cChobW1fdm1hX3dhbGstPnBnbWFwKTsKLQkJCWhtbV92bWFfd2Fsay0+cGdtYXAgPSBOVUxMOwot
CQl9CiAJCWhtbV92bWFfd2Fsay0+bGFzdCA9IGVuZDsKIAkJcmV0dXJuIDA7CiAJfQpAQCAtMTAy
Niw2ICsxMDA0LDE0IEBAIGxvbmcgaG1tX3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fcmFuZ2UgKnJh
bmdlLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiAJCQkvKiBLZWVwIHRyeWluZyB3aGlsZSB0aGUgcmFu
Z2UgaXMgdmFsaWQuICovCiAJCX0gd2hpbGUgKHJldCA9PSAtRUJVU1kgJiYgcmFuZ2UtPnZhbGlk
KTsKIAorCQkvKgorCQkgKiBXZSBkbyBwdXRfZGV2X3BhZ2VtYXAoKSBoZXJlIHNvIHRoYXQgd2Ug
Y2FuIGxldmVyYWdlCisJCSAqIGdldF9kZXZfcGFnZW1hcCgpIG9wdGltaXphdGlvbiB3aGljaCB3
aWxsIG5vdCByZS10YWtlIGEKKwkJICogcmVmZXJlbmNlIG9uIGEgcGdtYXAgaWYgd2UgYWxyZWFk
eSBoYXZlIG9uZS4KKwkJICovCisJCWlmIChobW1fdm1hX3dhbGstPnBnbWFwKQorCQkJcHV0X2Rl
dl9wYWdlbWFwKGhtbV92bWFfd2Fsay0+cGdtYXApOworCiAJCWlmIChyZXQpIHsKIAkJCXVuc2ln
bmVkIGxvbmcgaTsKIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
