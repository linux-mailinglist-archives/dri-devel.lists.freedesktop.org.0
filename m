Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34525F383
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F9E6E2AB;
	Thu,  4 Jul 2019 07:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC8B6E1D5;
 Wed,  3 Jul 2019 20:46:04 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d1d140a0007>; Wed, 03 Jul 2019 13:46:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 03 Jul 2019 13:46:03 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 03 Jul 2019 13:46:03 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Jul
 2019 20:46:02 +0000
Subject: Re: [PATCH 4/5] nouveau: unlock mmap_sem on all errors from
 nouveau_range_fault
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190703184502.16234-1-hch@lst.de>
 <20190703184502.16234-5-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <ec5e86a4-4a60-0dd5-797c-41b21e3a091a@nvidia.com>
Date: Wed, 3 Jul 2019 13:46:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190703184502.16234-5-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL108.nvidia.com (172.18.146.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1562186762; bh=HwGmCz10Ci8GwJ1IjwMoUJAJeEMJSYtD2O20Ed/Ggn0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=TSpRi0Z2SY1PHzP7KqCWwxKUB7G7m2aHuiHMaA+9zP4+plxdtT8gQdk4j/bAX75jR
 ie5dx3Vb3i48qambjEboni/xwCBSBYFfWIVo7DXI/FiT8Ul+vFRdVDMeGda752Ju2A
 /faZi69iPodzzziBC24xask8p2w8tOrV67rfXnwmepxxW9gqMmKv8bpJ2kHbtImsld
 paeawUfZJ1OaKL7ImUmpDFGnWOkmofheb70vsKR3CJ1F3qa7X4zWMBap07oQfA7/l1
 edHl7WUUACR964z3YaQirWTw8Cyvej6xdanAN7TJ3NW3ryuhpXhblUsxTU4iuod6sZ
 CFn2uVwfp3Juw==
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMy8xOSAxMTo0NSBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gQ3VycmVudGx5
IG5vdXZlYXVfc3ZtX2ZhdWx0IGV4cGVjdHMgbm91dmVhdV9yYW5nZV9mYXVsdCB0byBuZXZlciB1
bmxvY2sKPiBtbWFwX3NlbSwgYnV0IHRoZSBsYXR0ZXIgdW5sb2NrcyBpdCBmb3IgYSByYW5kb20g
c2VsZWN0aW9uIG9mIGVycm9yCj4gY29kZXMuIEZpeCB0aGlzIHVwIGJ5IGFsd2F5cyB1bmxvY2tp
bmcgbW1hcF9zZW0gZm9yIG5vbi16ZXJvIHJldHVybgo+IHZhbHVlcyBpbiBub3V2ZWF1X3Jhbmdl
X2ZhdWx0LCBhbmQgb25seSB1bmxvY2tpbmcgaXQgaW4gdGhlIGNhbGxlcgo+IGZvciBzdWNjZXNz
ZnVsIHJldHVybnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+CgpSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29t
PgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgfCAxNSAr
KysrKysrKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gaW5kZXgg
ZTgzMWY0MTg0YTE3Li5jMGNmN2FlYWVmYjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9zdm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfc3ZtLmMKPiBAQCAtNTAwLDggKzUwMCwxMCBAQCBub3V2ZWF1X3JhbmdlX2ZhdWx0KHN0
cnVjdCBobW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAoKWW91IGNh
biBkZWxldGUgdGhlIGNvbW1lbnQgIldpdGggdGhlIG9sZCBBUEkgdGhlIGRyaXZlciBtdXN0IC4u
LiIKKG5vdCB2aXNpYmxlIGluIHRoZSBwYXRjaCBoZXJlKS4KSSBzdWdnZXN0IG1vdmluZyB0aGUg
dHdvIGFzc2lnbm1lbnRzOgoJcmFuZ2UtPmRlZmF1bHRfZmxhZ3MgPSAwOwoJcmFuZ2UtPnBmbl9m
bGFnc19tYXNrID0gLTFVTDsKdG8ganVzdCBhYm92ZSB0aGUgImFnYWluOiIgd2hlcmUgdGhlIG90
aGVyIHJhbmdlLnh4eCBmaWVsZHMgYXJlCmluaXRpYWxpemVkIGluIG5vdXZlYXVfc3ZtX2ZhdWx0
KCkuCgo+ICAgCXJldCA9IGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbWlycm9yLAo+ICAgCQkJ
CSByYW5nZS0+c3RhcnQsIHJhbmdlLT5lbmQsCj4gICAJCQkJIFBBR0VfU0hJRlQpOwo+IC0JaWYg
KHJldCkKPiArCWlmIChyZXQpIHsKPiArCQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1h
cF9zZW07ID4gICAJCXJldHVybiAoaW50KXJldDsKPiArCX0KPiAgIAo+ICAgCWlmICghaG1tX3Jh
bmdlX3dhaXRfdW50aWxfdmFsaWQocmFuZ2UsIE5PVVZFQVVfUkFOR0VfRkFVTFRfVElNRU9VVCkp
IHsKPiAgIAkJLyoKCllvdSBjYW4gZGVsZXRlIHRoaXMgY29tbWVudCAob25seSB0aGUgZmlyc3Qg
bGluZSBpcyB2aXNpYmxlIGhlcmUpCnNpbmNlIGl0IGlzIGFib3V0IHRoZSAib2xkIEFQSSIuCkFs
c28sIGl0IHNob3VsZCByZXR1cm4gLUVCVVNZIG5vdCAtRUFHQUlOIHNpbmNlIGl0IG1lYW5zIHRo
ZXJlIHdhcyBhCnJhbmdlIGludmFsaWRhdGlvbiBjb2xsaXNpb24gKHNpbWlsYXIgdG8gaG1tX3Jh
bmdlX2ZhdWx0KCkgaWYKIXJhbmdlLT52YWxpZCkuCgo+IEBAIC01MTUsMTUgKzUxNywxNCBAQCBu
b3V2ZWF1X3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBobW1f
cmFuZ2UgKnJhbmdlLAo+ICAgCj4gICAJcmV0ID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCBibG9j
ayk7Cgpub3V2ZWF1X3JhbmdlX2ZhdWx0KCkgaXMgb25seSBjYWxsZWQgd2l0aCAiYmxvY2sgPSB0
cnVlIiBzbwpjb3VsZCBlbGltaW5hdGUgdGhlIGJsb2NrIHBhcmFtZXRlciBhbmQgcGFzcyB0cnVl
IGhlcmUuCgo+ICAgCWlmIChyZXQgPD0gMCkgewo+IC0JCWlmIChyZXQgPT0gLUVCVVNZIHx8ICFy
ZXQpIHsKPiAtCQkJLyogU2FtZSBhcyBhYm92ZSwgZHJvcCBtbWFwX3NlbSB0byBtYXRjaCBvbGQg
QVBJLiAqLwo+IC0JCQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwo+IC0J
CQlyZXQgPSAtRUJVU1k7Cj4gLQkJfSBlbHNlIGlmIChyZXQgPT0gLUVBR0FJTikKPiArCQlpZiAo
cmV0ID09IDApCj4gICAJCQlyZXQgPSAtRUJVU1k7Cj4gKwkJaWYgKHJldCAhPSAtRUFHQUlOKQo+
ICsJCQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwoKQ2FuIHJldCA9PSAt
RUFHQUlOIGhhcHBlbiBpZiAiYmxvY2sgPSB0cnVlIj8KR2VuZXJhbGx5LCBJIHByZWZlciB0aGUg
cmVhZF9kb3duKCkvcmVhZF91cCgpIGluIHRoZSBzYW1lIGZ1bmN0aW9uCihpLmUuLCBub3V2ZWF1
X3N2bV9mYXVsdCgpKSBidXQgSSBjYW4gc2VlIHdoeSBpdCBzaG91bGQgYmUgaGVyZQppZiBobW1f
cmFuZ2VfZmF1bHQoKSBjYW4gcmV0dXJuIHdpdGggbW1hcF9zZW0gdW5sb2NrZWQuCgo+ICAgCQlo
bW1fcmFuZ2VfdW5yZWdpc3RlcihyYW5nZSk7Cj4gICAJCXJldHVybiByZXQ7Cj4gICAJfQo+ICsK
PiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IEBAIC03MTgsOCArNzE5LDggQEAgbm91dmVhdV9z
dm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkpCj4gICAJCQkJCQlOVUxMKTsKPiAg
IAkJCXN2bW0tPnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVyID0gZmFsc2U7Cj4gICAJCQlt
dXRleF91bmxvY2soJnN2bW0tPm11dGV4KTsKPiArCQkJdXBfcmVhZCgmc3ZtbS0+bW0tPm1tYXBf
c2VtKTsKPiAgIAkJfQo+IC0JCXVwX3JlYWQoJnN2bW0tPm1tLT5tbWFwX3NlbSk7Cj4gICAKClRo
ZSAiZWxzZSIgY2FzZSBzaG91bGQgY2hlY2sgZm9yIC1FQlVTWSBhbmQgZ290byBhZ2Fpbi4KCj4g
ICAJCS8qIENhbmNlbCBhbnkgZmF1bHRzIGluIHRoZSB3aW5kb3cgd2hvc2UgcGFnZXMgZGlkbid0
IG1hbmFnZQo+ICAgCQkgKiB0byBrZWVwIHRoZWlyIHZhbGlkIGJpdCwgb3Igc3RheSB3cml0ZWFi
bGUgd2hlbiByZXF1aXJlZC4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
