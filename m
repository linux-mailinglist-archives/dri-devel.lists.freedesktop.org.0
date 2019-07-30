Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2417BA62
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1AC6E699;
	Wed, 31 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D82C6E5EA;
 Tue, 30 Jul 2019 17:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EX/kHSzV8Jul4w625nrsWxaBJXFG4ubDhlLJBlpiyxwew7BbgzkdzIGquWYHYqKj/jpmXO5DoB/kH/fjtRE+6ne9Hx4wls22pW9a3b5VwV/Clb/CSfPlwgL+KOLqFiIJuRMJGpSFmKJnHzcSv2WlQUvLTBY215UbyDABuJvVrFY6Q0jNgF4ccTtQomKr3fJxXM8D+BMdQKcP23U1FLOx+OTV+kSkiVrlNTksNZwV4bkt8hKwOgqOPoko+LyKiV1C0xPHMnveFSA5Y8g4E/WkMBRGtjj2GpBmeD/oQ+zncU1Hjo41qGKGLaAM2LhYutAH/lUE1RIUW11pHrpnC8Ug1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIXXrDH3RIIAh6Q/221asRxfL/RJZciP4vnd+I0w0ls=;
 b=lwLCvVcBdUIlOfGDrd3keOkNwaSDF5Jc2wGF14w9qo4KRSO+ombw7FLRMMURcKzeXgLG8B73NMNQPL/zq9kZPldmLIlsq7W+TQwf8OlNtlq0ly/Ghgytk8yaARECbuqVdtTo34/q4IzOLIX44OeNcYL4pCLQrHDNyMjH/54QGKpOodspc4+Pc3biiy0gvZCIq5WIwQzzWgY7qWg76MS0AjymfQRUS+C20FLvJE5qubIXr4LcGlQBjpSD11UUA2UHCuGVkm4v6liSFhFR6qrez7tmQaqX5Fdk5f91BsAk3SVdFZz/q5n4QOBJM4YYPBXiNEIqbB42x17X0BXKQKJ+wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6829.eurprd05.prod.outlook.com (10.186.160.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Tue, 30 Jul 2019 17:39:50 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:39:50 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/13] mm: remove the mask variable in
 hmm_vma_walk_hugetlb_entry
Thread-Topic: [PATCH 08/13] mm: remove the mask variable in
 hmm_vma_walk_hugetlb_entry
Thread-Index: AQHVRpsBxp87/2vfUUuxY9sZD/Qj2KbjblgA
Date: Tue, 30 Jul 2019 17:39:50 +0000
Message-ID: <20190730173946.GK24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-9-hch@lst.de>
In-Reply-To: <20190730055203.28467-9-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a618e036-983c-4381-ded6-08d71514ec54
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6829; 
x-ms-traffictypediagnostic: VI1PR05MB6829:
x-microsoft-antispam-prvs: <VI1PR05MB6829E83CA49F6B5B1C893E89CFDC0@VI1PR05MB6829.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(189003)(199004)(7736002)(86362001)(71200400001)(53936002)(2616005)(6486002)(256004)(6436002)(71190400001)(478600001)(8936002)(6512007)(102836004)(6916009)(52116002)(11346002)(36756003)(14444005)(99286004)(476003)(26005)(14454004)(25786009)(81156014)(7416002)(305945005)(3846002)(81166006)(1076003)(486006)(446003)(316002)(4326008)(33656002)(6116002)(64756008)(66446008)(5660300002)(66946007)(6506007)(54906003)(66476007)(76176011)(229853002)(66556008)(386003)(8676002)(68736007)(2906002)(6246003)(66066001)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6829;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xrKcYjxImGp5ANkno0SF7XbwaEl1a2Sx59Jxb3fuxL2Ez23xcyxr5pE7Y3cszYtaFenI4emzitTF/fwwTOXYNfSB7oY2fhDCe81QbgRzb0gBWiS8e9TwMd55bnuWYrNvnMjO2fnYbHwhaQgHeC9f0PW2muzlao6GI0YHNRaHpwqJ+Zm1o7xTulYAbFWony+Ku0hZK4RZIpEygPBIYTTGZihg0zunfTpbPgheZVz+qTZVbGkEZC64prBfqHxxG0OIelI94+MN84YG1A/YfliJEgyvq27Gzf0aM+sIV7GIKlS0a9DEK7feOwT+9GHxFxC2sS/SyhxlcPt55H1twIWEcEolrzKABbXfKBLpKlC188z0kK0NNKSbctUg/k06DBWJnfKeDy3BFPO9aODv3K7736kn96DJa/JsirhSVt1BPTY=
Content-ID: <DF80A643D5A9864FAC08223380C661B3@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a618e036-983c-4381-ded6-08d71514ec54
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:39:50.6817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6829
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIXXrDH3RIIAh6Q/221asRxfL/RJZciP4vnd+I0w0ls=;
 b=aDrcpjUxOPdDC3JtKWodmUkQHpjT9TxN87EXf5vvRfbCbIP3VPxKitvNCQTKkRuz4annmWjiMymaiQ/FmY2RTxTgODhvUClXOjAt9q9xSezaKu7vNlDvB8nkpdnOVRr7CC/Il46/YvgVvIk+j6AE40jrO9ZpikW6an9Fij5kBCg=
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTE6NThBTSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gVGhlIHBhZ2V3YWxrIGNvZGUgYWxyZWFkeSBwYXNzZXMgdGhlIHZhbHVlIGFz
IHRoZSBobWFzayBwYXJhbWV0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gIG1tL2htbS5jIHwgNyArKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL21tL2ht
bS5jIGIvbW0vaG1tLmMKPiBpbmRleCBmMjZkNmFiYzRlZDIuLjg4Yjc3YTRhNmExZSAxMDA2NDQK
PiArKysgYi9tbS9obW0uYwo+IEBAIC03NzEsMTkgKzc3MSwxNiBAQCBzdGF0aWMgaW50IGhtbV92
bWFfd2Fsa19odWdldGxiX2VudHJ5KHB0ZV90ICpwdGUsIHVuc2lnbmVkIGxvbmcgaG1hc2ssCj4g
IAkJCQkgICAgICBzdHJ1Y3QgbW1fd2FsayAqd2FsaykKPiAgewo+ICAjaWZkZWYgQ09ORklHX0hV
R0VUTEJfUEFHRQo+IC0JdW5zaWduZWQgbG9uZyBhZGRyID0gc3RhcnQsIGksIHBmbiwgbWFzazsK
PiArCXVuc2lnbmVkIGxvbmcgYWRkciA9IHN0YXJ0LCBpLCBwZm47Cj4gIAlzdHJ1Y3QgaG1tX3Zt
YV93YWxrICpobW1fdm1hX3dhbGsgPSB3YWxrLT5wcml2YXRlOwo+ICAJc3RydWN0IGhtbV9yYW5n
ZSAqcmFuZ2UgPSBobW1fdm1hX3dhbGstPnJhbmdlOwo+ICAJc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEgPSB3YWxrLT52bWE7Cj4gLQlzdHJ1Y3QgaHN0YXRlICpoID0gaHN0YXRlX3ZtYSh2bWEp
Owo+ICAJdWludDY0X3Qgb3JpZ19wZm4sIGNwdV9mbGFnczsKPiAgCWJvb2wgZmF1bHQsIHdyaXRl
X2ZhdWx0Owo+ICAJc3BpbmxvY2tfdCAqcHRsOwo+ICAJcHRlX3QgZW50cnk7Cj4gIAlpbnQgcmV0
ID0gMDsKPiAgCj4gLQltYXNrID0gaHVnZV9wYWdlX3NpemUoaCkgLSAxOwo+IC0KPiAgCXB0bCA9
IGh1Z2VfcHRlX2xvY2soaHN0YXRlX3ZtYSh2bWEpLCB3YWxrLT5tbSwgcHRlKTsKPiAgCWVudHJ5
ID0gaHVnZV9wdGVwX2dldChwdGUpOwo+ICAKPiBAQCAtNzk5LDcgKzc5Niw3IEBAIHN0YXRpYyBp
bnQgaG1tX3ZtYV93YWxrX2h1Z2V0bGJfZW50cnkocHRlX3QgKnB0ZSwgdW5zaWduZWQgbG9uZyBo
bWFzaywKPiAgCQlnb3RvIHVubG9jazsKPiAgCX0KPiAgCj4gLQlwZm4gPSBwdGVfcGZuKGVudHJ5
KSArICgoc3RhcnQgJiBtYXNrKSA+PiBQQUdFX1NISUZUKTsKPiArCXBmbiA9IHB0ZV9wZm4oZW50
cnkpICsgKChzdGFydCAmIGhtYXNrKSA+PiBQQUdFX1NISUZUKTsKCkkgZG9uJ3Qga25vdyB0aGlz
IGhzdGF0ZSBzdHVmZiwgYnV0IHRoaXMgZG9lc24ndCBsb29rIHRoZSBzYW1lPwoKc3RhdGljIGlu
dCB3YWxrX2h1Z2V0bGJfcmFuZ2UodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVu
ZCwgewogICAgICAgIHN0cnVjdCBoc3RhdGUgKmggPSBoc3RhdGVfdm1hKHZtYSk7CiAgICAgICAg
dW5zaWduZWQgbG9uZyBobWFzayA9IGh1Z2VfcGFnZV9tYXNrKGgpOyAvLyBha2EgaC0+bWFzawoK
ICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gd2Fsay0+aHVnZXRsYl9lbnRyeShwdGUsIGht
YXNrLCBhZGRyLCBuZXh0LCB3YWxrKTsKCkFuZCB0aGUgZmlyc3QgcGxhY2UgSSBmb3VuZCBzZXR0
aW5nIGgtPm1hc2sgaXM6Cgp2b2lkIF9faW5pdCBodWdldGxiX2FkZF9oc3RhdGUodW5zaWduZWQg
aW50IG9yZGVyKSB7CgloLT5tYXNrID0gfigoMVVMTCA8PCAob3JkZXIgKyBQQUdFX1NISUZUKSkg
LSAxKTsKCkNvbXBhcmVkIHdpdGgKICAgIG1hc2sgPSBodWdlX3BhZ2Vfc2l6ZShoKSAtIDE7CiAg
ICAgICAgID0gKCh1bnNpZ25lZCBsb25nKVBBR0VfU0laRSA8PCBoLT5vcmRlcikgLSAxCgpMb29r
cyBsaWtlIGhtYXNrID09IH5tYXNrCgo/CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
