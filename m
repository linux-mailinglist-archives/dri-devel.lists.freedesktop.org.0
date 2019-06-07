Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187573A5B9
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A813F893D0;
	Sun,  9 Jun 2019 12:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12682898AA;
 Fri,  7 Jun 2019 20:33:14 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfaca070000>; Fri, 07 Jun 2019 13:33:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 13:33:13 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 13:33:13 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 20:33:09 +0000
Subject: Re: [PATCH v2 hmm 08/11] mm/hmm: Remove racy protection against
 double-unregistration
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-9-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <ab93b81f-8d78-8760-6fc7-d981d528026d@nvidia.com>
Date: Fri, 7 Jun 2019 13:33:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-9-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559939591; bh=OLplF3FRcTtszyFZo8HGJ3SRTQEEwTp6Llhy0LgviKg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=h/f6qK4es4H52bAwrizf7ejiA0ydq6aSXi0ApCfo8QG/yHMMZrPD6D9Nmp+9x+oSq
 Y+Nai5Z3GNqdygDYEjs8tRe4G+equLunHMzhtVh3Ciw8F8asoW37NWSbhIPrTfQHdd
 a0fJyGgIK8Tu4kQAsbdZd8AoQqCA/LCwiNlYM5clGsAnmVq+zds9aNO+EQXS3jycc2
 Np37o+70Rfn9F8dzE5xPDkw7sWgYKlmOrgPYJvgePUegOSCUDtbT8LfpwUJTntw+E+
 QyaZMFuwrE1L3P/k9EmQ6ReZp/TXbLu4f6FU+0KJhuGmXM05AU78hJi1m3gSauCf1R
 lf5e197AMSsgQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvNi8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IEZyb206IEphc29u
IEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiAKPiBObyBvdGhlciByZWdpc3Rlci91bnJl
Z2lzdGVyIGtlcm5lbCBBUEkgYXR0ZW1wdHMgdG8gcHJvdmlkZSB0aGlzIGtpbmQgb2YKPiBwcm90
ZWN0aW9uIGFzIGl0IGlzIGluaGVyZW50bHkgcmFjeSwgc28ganVzdCBkcm9wIGl0Lgo+IAo+IENh
bGxlcnMgc2hvdWxkIHByb3ZpZGUgdGhlaXIgb3duIHByb3RlY3Rpb24sIGl0IGFwcGVhcnMgbm91
dmVhdSBhbHJlYWR5Cj4gZG9lcywgYnV0IGp1c3QgaW4gY2FzZSBkcm9wIGEgZGVidWdnaW5nIFBP
SVNPTi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5j
b20+Cj4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgoK
UmV2aWV3ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KCj4gLS0t
Cj4gICBtbS9obW0uYyB8IDkgKystLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2ht
bS5jCj4gaW5kZXggYzcwMmNkNzI2NTFiNTMuLjY4MDJkZTcwODBkMTcyIDEwMDY0NAo+IC0tLSBh
L21tL2htbS5jCj4gKysrIGIvbW0vaG1tLmMKPiBAQCAtMjg0LDE4ICsyODQsMTMgQEAgRVhQT1JU
X1NZTUJPTChobW1fbWlycm9yX3JlZ2lzdGVyKTsKPiAgICAqLwo+ICAgdm9pZCBobW1fbWlycm9y
X3VucmVnaXN0ZXIoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvcikKPiAgIHsKPiAtCXN0cnVjdCBo
bW0gKmhtbSA9IFJFQURfT05DRShtaXJyb3ItPmhtbSk7Cj4gLQo+IC0JaWYgKGhtbSA9PSBOVUxM
KQo+IC0JCXJldHVybjsKPiArCXN0cnVjdCBobW0gKmhtbSA9IG1pcnJvci0+aG1tOwo+ICAgCj4g
ICAJZG93bl93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7Cj4gICAJbGlzdF9kZWxfaW5pdCgmbWly
cm9yLT5saXN0KTsKPiAtCS8qIFRvIHByb3RlY3QgdXMgYWdhaW5zdCBkb3VibGUgdW5yZWdpc3Rl
ciAuLi4gKi8KPiAtCW1pcnJvci0+aG1tID0gTlVMTDsKPiAgIAl1cF93cml0ZSgmaG1tLT5taXJy
b3JzX3NlbSk7Cj4gLQo+ICAgCWhtbV9wdXQoaG1tKTsKPiArCW1lbXNldCgmbWlycm9yLT5obW0s
IFBPSVNPTl9JTlVTRSwgc2l6ZW9mKG1pcnJvci0+aG1tKSk7Cj4gICB9Cj4gICBFWFBPUlRfU1lN
Qk9MKGhtbV9taXJyb3JfdW5yZWdpc3Rlcik7Cj4gICAKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
