Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF97E75C51
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 02:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303FC6E84E;
	Fri, 26 Jul 2019 00:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4284C6E852;
 Fri, 26 Jul 2019 00:57:14 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3a4fe90000>; Thu, 25 Jul 2019 17:57:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 25 Jul 2019 17:57:13 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 25 Jul 2019 17:57:13 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 26 Jul
 2019 00:57:11 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 26 Jul 2019 00:57:11 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d3a4fe70000>; Thu, 25 Jul 2019 17:57:11 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>
Subject: [PATCH v2 7/7] mm/hmm: remove hmm_range vma
Date: Thu, 25 Jul 2019 17:56:50 -0700
Message-ID: <20190726005650.2566-8-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726005650.2566-1-rcampbell@nvidia.com>
References: <20190726005650.2566-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564102634; bh=NZUo+DqUJdY6mTpO9a6/Oba2m7JMCHGUDDnmqd09n1Y=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=Y+Fdrsy5YTiGjTNAPneWU7N67hB8atyhiYSL7w1D9fRjSIU0CfPzTBs1+TJzPLeRd
 lZg+U+KeM5lIDv23Uued3ANTxSgkBOSMlBDcqTqFQrMZetgu7wTZJ/18nJTgFUlQH7
 9M9bqjlekVURUgBu+xXY9uNZnDjVOHAMuds+n9WmwMP9IafFxNItlvDkk5+7xf168C
 /jBL6ulVlFTzr3sEKhNy9uO7sVIGou26UW/rn8gdQOF2MPV5eBWbEIWuUlRjHkUVyb
 MyIizWpUTiSts0J7sLQ9gk5Raxzo7iAUIw4fsLk+jXjvBR9uvF6CPcFSA49r+/WBWC
 ev8fK2+UEnDJg==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgaG1tX3JhbmdlX2ZhdWx0KCkgZG9lc24ndCB1c2UgdGhlIHN0cnVjdCBobW1fcmFuZ2Ug
dm1hIGZpZWxkLApyZW1vdmUgaXQuCgpTdWdnZXN0ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdn
QG1lbGxhbm94LmNvbT4KU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBu
dmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6
IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfc3ZtLmMgfCA3ICsrKy0tLS0KIGluY2x1ZGUvbGludXgvaG1tLmggICAgICAg
ICAgICAgICAgICAgfCAxIC0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
c3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCmluZGV4IDQ5YjUy
MGM2MGZjNS4uYTc0NTMwYjVhNTIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X3N2bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3Zt
LmMKQEAgLTQ5NiwxMiArNDk2LDEyIEBAIG5vdXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9t
aXJyb3IgKm1pcnJvciwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiAJCQkJIHJhbmdlLT5zdGFy
dCwgcmFuZ2UtPmVuZCwKIAkJCQkgUEFHRV9TSElGVCk7CiAJaWYgKHJldCkgewotCQl1cF9yZWFk
KCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOworCQl1cF9yZWFkKCZyYW5nZS0+aG1tLT5t
bS0+bW1hcF9zZW0pOwogCQlyZXR1cm4gKGludClyZXQ7CiAJfQogCiAJaWYgKCFobW1fcmFuZ2Vf
d2FpdF91bnRpbF92YWxpZChyYW5nZSwgSE1NX1JBTkdFX0RFRkFVTFRfVElNRU9VVCkpIHsKLQkJ
dXBfcmVhZCgmcmFuZ2UtPnZtYS0+dm1fbW0tPm1tYXBfc2VtKTsKKwkJdXBfcmVhZCgmcmFuZ2Ut
PmhtbS0+bW0tPm1tYXBfc2VtKTsKIAkJcmV0dXJuIC1FQlVTWTsKIAl9CiAKQEAgLTUwOSw3ICs1
MDksNyBAQCBub3V2ZWF1X3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsIHN0
cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogCWlmIChyZXQgPD0gMCkgewogCQlpZiAocmV0ID09IDAp
CiAJCQlyZXQgPSAtRUJVU1k7Ci0JCXVwX3JlYWQoJnJhbmdlLT52bWEtPnZtX21tLT5tbWFwX3Nl
bSk7CisJCXVwX3JlYWQoJnJhbmdlLT5obW0tPm1tLT5tbWFwX3NlbSk7CiAJCWhtbV9yYW5nZV91
bnJlZ2lzdGVyKHJhbmdlKTsKIAkJcmV0dXJuIHJldDsKIAl9CkBAIC02ODIsNyArNjgyLDYgQEAg
bm91dmVhdV9zdm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkpCiAJCQkgYXJncy5p
LnAuYWRkciArIGFyZ3MuaS5wLnNpemUsIGZuIC0gZmkpOwogCiAJCS8qIEhhdmUgSE1NIGZhdWx0
IHBhZ2VzIHdpdGhpbiB0aGUgZmF1bHQgd2luZG93IHRvIHRoZSBHUFUuICovCi0JCXJhbmdlLnZt
YSA9IHZtYTsKIAkJcmFuZ2Uuc3RhcnQgPSBhcmdzLmkucC5hZGRyOwogCQlyYW5nZS5lbmQgPSBh
cmdzLmkucC5hZGRyICsgYXJncy5pLnAuc2l6ZTsKIAkJcmFuZ2UucGZucyA9IGFyZ3MucGh5czsK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCmlu
ZGV4IGYzNjkzZGNjOGI5OC4uNjg5NDljZjgxNWY5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4
L2htbS5oCisrKyBiL2luY2x1ZGUvbGludXgvaG1tLmgKQEAgLTE2NCw3ICsxNjQsNiBAQCBlbnVt
IGhtbV9wZm5fdmFsdWVfZSB7CiAgKi8KIHN0cnVjdCBobW1fcmFuZ2UgewogCXN0cnVjdCBobW0J
CSpobW07Ci0Jc3RydWN0IHZtX2FyZWFfc3RydWN0CSp2bWE7CiAJc3RydWN0IGxpc3RfaGVhZAls
aXN0OwogCXVuc2lnbmVkIGxvbmcJCXN0YXJ0OwogCXVuc2lnbmVkIGxvbmcJCWVuZDsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
