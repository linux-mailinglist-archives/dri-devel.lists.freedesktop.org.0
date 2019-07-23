Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFDD71F0C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F536E36F;
	Tue, 23 Jul 2019 18:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00081.outbound.protection.outlook.com [40.107.0.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D97A6E2D8;
 Tue, 23 Jul 2019 15:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzi2XSKPCKfORjsb9fbpuWHNKISyCgXGSFaF0wxrWFLXxQ5Lca5iHR0lnihyB0eQiCmkChvh4g/YAONibmw/iMOYu6m42b0MLDJYX8TZCq1B5aRevNxF2ezPyorInBzjk79wU+SK6Tdr7WjlEfGpoZvALA0PH3mpSLAc1AZCavna9iWIJu5h87wGVWB3TrANqxRoHtgCZaJSZJwsajdj15++oDEWCsHrK089HORnCLz04RdHHKLfb7ZOEOB/a2OLTCjItjafPMpn7hEqwwF2FrSC+C717YWvpr4W/PcUcXATGku5OSP8jwb3G+FL7X61KC1TQNljgvkLysrAQPfrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qupE79+S4pFt3NIw03qKjajQx0W37foPBww2k5QXFh4=;
 b=J2HGDWctWiQD4MxK4w/E5A1n1cGef70O5gMb2biobaB3MWepGUEXhnXd+ryff0HYDWgLTJmxutq/Z6GAcMyy4TdWnWcj0En45LtsI6j1/J6766AZKv2usuT5OD0NC+rWPgv8ULeSix88aypI3mdvMaDXoN29YwdA7ELM7xIty4XWXvZiyLkYeH4KOrYaTYpVQuhNZ+WGkfhZo7JuhGVXbJpt/96Ut5EM/xW90xKGvm7IKtUYkT2NjD47+mwG+2HtuC5u0hX6Uhagq+xC/1hUf0R2IjkXLaSLN7dYPqBMOUcZAqmeVrWLxNDu2nUKiu+gtxU8AxMPFmQFmkgQWE0ZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Tue, 23 Jul 2019 15:18:28 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 15:18:28 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 4/6] nouveau: unlock mmap_sem on all errors from
 nouveau_range_fault
Thread-Topic: [PATCH 4/6] nouveau: unlock mmap_sem on all errors from
 nouveau_range_fault
Thread-Index: AQHVQHIXnahvVYvmJ0qDJVLVLXdOZabYUtkA
Date: Tue, 23 Jul 2019 15:18:28 +0000
Message-ID: <20190723151824.GL15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-5-hch@lst.de>
In-Reply-To: <20190722094426.18563-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:208:120::43) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1eba60d3-5cbe-48a4-8560-08d70f810399
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB3279; 
x-ms-traffictypediagnostic: VI1PR05MB3279:
x-microsoft-antispam-prvs: <VI1PR05MB32792EDA5AB184B9309EA75FCFC70@VI1PR05MB3279.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(189003)(199004)(8936002)(5660300002)(11346002)(81166006)(476003)(316002)(66066001)(33656002)(478600001)(305945005)(76176011)(54906003)(68736007)(36756003)(8676002)(7736002)(81156014)(99286004)(102836004)(2616005)(86362001)(6506007)(25786009)(386003)(26005)(186003)(446003)(6436002)(52116002)(6486002)(229853002)(6116002)(3846002)(486006)(1076003)(6512007)(2906002)(256004)(66446008)(53936002)(6246003)(71200400001)(14444005)(14454004)(4326008)(64756008)(66556008)(66476007)(66946007)(6916009)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3279;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s5E7ECNlhK2mr8Uxu41Us2POD4lN6Dl5hrcymzzumh5bUY9XScrftM244KymTbwCzxyAGy4LyNwaiOXmsj1Mwh+qwQB1EDUSv8AdFRpOkNRG4ejghxBpGArUw9aThHzllQ0mLNQAhuiwmIfAcjQTv3fJO+FZXT/0no9pl2kA5Af4egyWgYyTLgRsy4O0m1H+zg+ZsrfKBcOjOBj/Q20nT0H55ffVftliCBoKPVspOm8MkJBxhTsUQSZcThFje8HUDGEp2d/wGA2QMsYx3v4rlUzqsnWgiAG6GvIZpvz4gS69GSw91X7Zb5pvJt1Z7uofJC9f3OY/epYWkAhM8jgaBgWE+BFYZXQHUPUMjsGN57cWX4dlScwxeHwcWcfqs1QFOaHlvFo+bse6gf2mKu9YMTkAIexcEUbEQaK85uyILps=
Content-ID: <B925593E81AF184DBCA6A2F968BAEBF5@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eba60d3-5cbe-48a4-8560-08d70f810399
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 15:18:28.3594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3279
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qupE79+S4pFt3NIw03qKjajQx0W37foPBww2k5QXFh4=;
 b=XSyHigZaEDLMnvA81SUiitaYIfqnvj+DJlUy9D5KgViGOGjEqHM7DPdx+UqJwV+bzXuuM4OBCTgNp4U4F8raqq1wS92/8VJffPfYQVhMc6mXh8Z4/6aSJ99DRioCoz1rbn+YITV+zt7M8hvbRnuGv08O1w73LrlJNurrT/b5E6c=
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6NDQ6MjRBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gQ3VycmVudGx5IG5vdXZlYXVfc3ZtX2ZhdWx0IGV4cGVjdHMgbm91dmVhdV9y
YW5nZV9mYXVsdCB0byBuZXZlciB1bmxvY2sKPiBtbWFwX3NlbSwgYnV0IHRoZSBsYXR0ZXIgdW5s
b2NrcyBpdCBmb3IgYSByYW5kb20gc2VsZWN0aW9uIG9mIGVycm9yCj4gY29kZXMuIEZpeCB0aGlz
IHVwIGJ5IGFsd2F5cyB1bmxvY2tpbmcgbW1hcF9zZW0gZm9yIG5vbi16ZXJvIHJldHVybgo+IHZh
bHVlcyBpbiBub3V2ZWF1X3JhbmdlX2ZhdWx0LCBhbmQgb25seSB1bmxvY2tpbmcgaXQgaW4gdGhl
IGNhbGxlcgo+IGZvciBzdWNjZXNzZnVsIHJldHVybnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfc3ZtLmMgfCAxMiArKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
c3ZtLmMKPiBpbmRleCA1ZGQ4M2E0NjU3OGYuLjVkZTJkNTRiOTc4MiAxMDA2NDQKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gQEAgLTQ5NCw4ICs0OTQsMTAg
QEAgbm91dmVhdV9yYW5nZV9mYXVsdChzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yLCBzdHJ1Y3Qg
aG1tX3JhbmdlICpyYW5nZSkKPiAgCXJldCA9IGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbWly
cm9yLAo+ICAJCQkJIHJhbmdlLT5zdGFydCwgcmFuZ2UtPmVuZCwKPiAgCQkJCSBQQUdFX1NISUZU
KTsKPiAtCWlmIChyZXQpCj4gKwlpZiAocmV0KSB7Cj4gKwkJdXBfcmVhZCgmcmFuZ2UtPnZtYS0+
dm1fbW0tPm1tYXBfc2VtKTsKPiAgCQlyZXR1cm4gKGludClyZXQ7Cj4gKwl9Cj4gIAo+ICAJaWYg
KCFobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZChyYW5nZSwgSE1NX1JBTkdFX0RFRkFVTFRfVElN
RU9VVCkpIHsKPiAgCQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwo+IEBA
IC01MDQsMTEgKzUwNiw5IEBAIG5vdXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9taXJyb3Ig
Km1pcnJvciwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gIAo+ICAJcmV0ID0gaG1tX3Jhbmdl
X2ZhdWx0KHJhbmdlLCB0cnVlKTsKPiAgCWlmIChyZXQgPD0gMCkgewo+IC0JCWlmIChyZXQgPT0g
LUVCVVNZIHx8ICFyZXQpIHsKPiAtCQkJdXBfcmVhZCgmcmFuZ2UtPnZtYS0+dm1fbW0tPm1tYXBf
c2VtKTsKPiAtCQkJcmV0ID0gLUVCVVNZOwo+IC0JCX0gZWxzZSBpZiAocmV0ID09IC1FQUdBSU4p
Cj4gKwkJaWYgKHJldCA9PSAwKQo+ICAJCQlyZXQgPSAtRUJVU1k7Cj4gKwkJdXBfcmVhZCgmcmFu
Z2UtPnZtYS0+dm1fbW0tPm1tYXBfc2VtKTsKPiAgCQlobW1fcmFuZ2VfdW5yZWdpc3RlcihyYW5n
ZSk7Cj4gIAkJcmV0dXJuIHJldDsKCkh1bS4uCgpUaGUgY2FsbGVyIGRvZXMgdGhpczoKCmFnYWlu
OgoJCXJldCA9IG5vdXZlYXVfcmFuZ2VfZmF1bHQoJnN2bW0tPm1pcnJvciwgJnJhbmdlKTsKCQlp
ZiAocmV0ID09IDApIHsKCQkJbXV0ZXhfbG9jaygmc3ZtbS0+bXV0ZXgpOwoJCQlpZiAoIW5vdXZl
YXVfcmFuZ2VfZG9uZSgmcmFuZ2UpKSB7CgkJCQltdXRleF91bmxvY2soJnN2bW0tPm11dGV4KTsK
CQkJCWdvdG8gYWdhaW47CgpBbmQgd2UgY2FuJ3QgY2FsbCBub3V2ZWF1X3JhbmdlX2ZhdWx0KCkg
LT4gaG1tX3JhbmdlX2ZhdWx0KCkgd2l0aG91dApob2xkaW5nIHRoZSBtbWFwX3NlbSwgc28gd2Ug
Y2FuJ3QgYWxsb3cgbm91dmVhdV9yYW5nZV9mYXVsdCB0byB1bmxvY2sKaXQuCgpNYXliZSB0aGlz
IGluc3RlYWQ/IAoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
c3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCmluZGV4IGE5YzVj
NThkNDI1YjNkLi45MmNmNzYwYTliY2M1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9zdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X3N2bS5jCkBAIC00OTQsMjEgKzQ5NCwxNiBAQCBub3V2ZWF1X3JhbmdlX2ZhdWx0KHN0cnVjdCBo
bW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogCXJldCA9IGhtbV9y
YW5nZV9yZWdpc3RlcihyYW5nZSwgbWlycm9yLAogCQkJCSByYW5nZS0+c3RhcnQsIHJhbmdlLT5l
bmQsCiAJCQkJIFBBR0VfU0hJRlQpOwotCWlmIChyZXQpIHsKLQkJdXBfcmVhZCgmcmFuZ2UtPnZt
YS0+dm1fbW0tPm1tYXBfc2VtKTsKKwlpZiAocmV0KQogCQlyZXR1cm4gKGludClyZXQ7Ci0JfQog
Ci0JaWYgKCFobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZChyYW5nZSwgSE1NX1JBTkdFX0RFRkFV
TFRfVElNRU9VVCkpIHsKLQkJdXBfcmVhZCgmcmFuZ2UtPnZtYS0+dm1fbW0tPm1tYXBfc2VtKTsK
KwlpZiAoIWhtbV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBITU1fUkFOR0VfREVGQVVM
VF9USU1FT1VUKSkKIAkJcmV0dXJuIC1FQlVTWTsKLQl9CiAKIAlyZXQgPSBobW1fcmFuZ2VfZmF1
bHQocmFuZ2UsIHRydWUpOwogCWlmIChyZXQgPD0gMCkgewogCQlpZiAocmV0ID09IDApCiAJCQly
ZXQgPSAtRUJVU1k7Ci0JCXVwX3JlYWQoJnJhbmdlLT52bWEtPnZtX21tLT5tbWFwX3NlbSk7CiAJ
CWhtbV9yYW5nZV91bnJlZ2lzdGVyKHJhbmdlKTsKIAkJcmV0dXJuIHJldDsKIAl9CkBAIC03MDYs
OCArNzAxLDggQEAgbm91dmVhdV9zdm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkp
CiAJCQkJCQlOVUxMKTsKIAkJCXN2bW0tPnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVyID0g
ZmFsc2U7CiAJCQltdXRleF91bmxvY2soJnN2bW0tPm11dGV4KTsKLQkJCXVwX3JlYWQoJnN2bW0t
Pm1tLT5tbWFwX3NlbSk7CiAJCX0KKwkJdXBfcmVhZCgmc3ZtbS0+bW0tPm1tYXBfc2VtKTsKIAog
CQkvKiBDYW5jZWwgYW55IGZhdWx0cyBpbiB0aGUgd2luZG93IHdob3NlIHBhZ2VzIGRpZG4ndCBt
YW5hZ2UKIAkJICogdG8ga2VlcCB0aGVpciB2YWxpZCBiaXQsIG9yIHN0YXkgd3JpdGVhYmxlIHdo
ZW4gcmVxdWlyZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
