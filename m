Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D20EAC3D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA826EDEC;
	Thu, 31 Oct 2019 09:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C396EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:38 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba13870003>; Wed, 30 Oct 2019 15:49:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 15:49:37 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:37 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:37 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:35 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba137e0001>; Wed, 30 Oct 2019 15:49:35 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 02/19] mm/gup: factor out duplicate code from four routines
Date: Wed, 30 Oct 2019 15:49:13 -0700
Message-ID: <20191030224930.3990755-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475784; bh=tBh63Up4GmYWMpZfv2SoHkQER3l3/AwmpTx4CmGyUOY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=HfYnE1A7nNkNpazJA+iLbvozSO9YbiH5kFIM0F6u1AK11c0lDyfxJZvAXrwIUDkv5
 Vi1RgSE+zFxIrfTIb+uivdz+6fy0MYuaxW2g0l5bgHHvYabolD6OOfarmWn9segALX
 8JoVoT/njsBqs073lipSciCZeLvL3FcZ63n2zzY2AyGVYc0U2PFJ7DVW15EbUZzRaC
 nr9qEHpp4TQE8CN0n9dZIQZcOAFydDiH5gU9U2HcVPlAQ1/9WyMmCuL+SLoSd1EOQF
 /Ez6RQKc30HZLoGVdYe0xDSBYplfU9zfQz9KjxQQQDaUpbasR5wg6ipvfGvkp4XC3s
 GKCvLZ2BAnk4g==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIGZvdXIgbG9jYXRpb25zIGluIGd1cC5jIHRoYXQgaGF2ZSBhIGZhaXIgYW1vdW50
IG9mIGNvZGUKZHVwbGljYXRpb24uIFRoaXMgbWVhbnMgdGhhdCBjaGFuZ2luZyBvbmUgcmVxdWly
ZXMgbWFraW5nIHRoZSBzYW1lCmNoYW5nZXMgaW4gZm91ciBwbGFjZXMsIG5vdCB0byBtZW50aW9u
IHJlYWRpbmcgdGhlIHNhbWUgY29kZSBmb3VyCnRpbWVzLCBhbmQgd29uZGVyaW5nIGlmIHRoZXJl
IGFyZSBzdWJ0bGUgZGlmZmVyZW5jZXMuCgpGYWN0b3Igb3V0IHRoZSBjb21tb24gY29kZSBpbnRv
IHN0YXRpYyBmdW5jdGlvbnMsIHRodXMgcmVkdWNpbmcgdGhlCm92ZXJhbGwgbGluZSBjb3VudCBh
bmQgdGhlIGNvZGUncyBjb21wbGV4aXR5LgoKQWxzbywgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8g
c2xpZ2h0bHkgaW1wcm92ZSB0aGUgZWZmaWNpZW5jeSBvZiB0aGUKZXJyb3IgY2FzZXMsIGJ5IGRv
aW5nIGEgbWFzcyBzdWJ0cmFjdGlvbiBvZiB0aGUgcmVmY291bnQsIHN1cnJvdW5kZWQKYnkgZ2V0
X3BhZ2UoKS9wdXRfcGFnZSgpLgoKQWxzbywgZnVydGhlciBzaW1wbGlmeSAoc2xpZ2h0bHkpLCBi
eSB3YWl0aW5nIHVudGlsIHRoZSB0aGUgc3VjY2Vzc2Z1bAplbmQgb2YgZWFjaCByb3V0aW5lLCB0
byBpbmNyZW1lbnQgKm5yLgoKQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpDYzog
QW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+ClNpZ25lZC1vZmYt
Ynk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXAuYyB8IDEx
MyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwppbmRleCA4NWNhZjc2YjMwMTIuLjhmYjBkOWNk
ZmFmNSAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAgLTE5NjksNiArMTk2
OSwzNSBAQCBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3B1ZChwdWRfdCBwdWQsIHB1ZF90
ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCiB9CiAjZW5kaWYKIAorc3RhdGljIGludCBfX3Jl
Y29yZF9zdWJwYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9uZyBhZGRyLAorCQkJ
ICAgICB1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IG5yKQorewor
CWludCBucl9yZWNvcmRlZF9wYWdlcyA9IDA7CisKKwlkbyB7CisJCXBhZ2VzW25yXSA9IHBhZ2U7
CisJCW5yKys7CisJCXBhZ2UrKzsKKwkJbnJfcmVjb3JkZWRfcGFnZXMrKzsKKwl9IHdoaWxlIChh
ZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOworCXJldHVybiBucl9yZWNvcmRlZF9wYWdl
czsKK30KKworc3RhdGljIHZvaWQgX19yZW1vdmVfcmVmc19mcm9tX2hlYWQoc3RydWN0IHBhZ2Ug
KnBhZ2UsIGludCByZWZzKQoreworCS8qIERvIGEgZ2V0X3BhZ2UoKSBmaXJzdCwgaW4gY2FzZSBy
ZWZzID09IHBhZ2UtPl9yZWZjb3VudCAqLworCWdldF9wYWdlKHBhZ2UpOworCXBhZ2VfcmVmX3N1
YihwYWdlLCByZWZzKTsKKwlwdXRfcGFnZShwYWdlKTsKK30KKworc3RhdGljIGludCBfX2h1Z2Vf
cHRfZG9uZShzdHJ1Y3QgcGFnZSAqaGVhZCwgaW50IG5yX3JlY29yZGVkX3BhZ2VzLCBpbnQgKm5y
KQoreworCSpuciArPSBucl9yZWNvcmRlZF9wYWdlczsKKwlTZXRQYWdlUmVmZXJlbmNlZChoZWFk
KTsKKwlyZXR1cm4gMTsKK30KKwogI2lmZGVmIENPTkZJR19BUkNIX0hBU19IVUdFUEQKIHN0YXRp
YyB1bnNpZ25lZCBsb25nIGh1Z2VwdGVfYWRkcl9lbmQodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNp
Z25lZCBsb25nIGVuZCwKIAkJCQkgICAgICB1bnNpZ25lZCBsb25nIHN6KQpAQCAtMTk5OCwzNCAr
MjAyNywxOSBAQCBzdGF0aWMgaW50IGd1cF9odWdlcHRlKHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBs
b25nIHN6LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJLyogaHVnZXBhZ2VzIGFyZSBuZXZlciAic3Bl
Y2lhbCIgKi8KIAlWTV9CVUdfT04oIXBmbl92YWxpZChwdGVfcGZuKHB0ZSkpKTsKIAotCXJlZnMg
PSAwOwogCWhlYWQgPSBwdGVfcGFnZShwdGUpOwotCiAJcGFnZSA9IGhlYWQgKyAoKGFkZHIgJiAo
c3otMSkpID4+IFBBR0VfU0hJRlQpOwotCWRvIHsKLQkJVk1fQlVHX09OKGNvbXBvdW5kX2hlYWQo
cGFnZSkgIT0gaGVhZCk7Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwotCQkoKm5yKSsrOwotCQlwYWdl
Kys7Ci0JCXJlZnMrKzsKLQl9IHdoaWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQp
OworCXJlZnMgPSBfX3JlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBlbmQsIHBhZ2VzLCAqbnIp
OwogCiAJaGVhZCA9IHRyeV9nZXRfY29tcG91bmRfaGVhZChoZWFkLCByZWZzKTsKLQlpZiAoIWhl
YWQpIHsKLQkJKm5yIC09IHJlZnM7CisJaWYgKCFoZWFkKQogCQlyZXR1cm4gMDsKLQl9CiAKIAlp
ZiAodW5saWtlbHkocHRlX3ZhbChwdGUpICE9IHB0ZV92YWwoKnB0ZXApKSkgewotCQkvKiBDb3Vs
ZCBiZSBvcHRpbWl6ZWQgYmV0dGVyICovCi0JCSpuciAtPSByZWZzOwotCQl3aGlsZSAocmVmcy0t
KQotCQkJcHV0X3BhZ2UoaGVhZCk7CisJCV9fcmVtb3ZlX3JlZnNfZnJvbV9oZWFkKGhlYWQsIHJl
ZnMpOwogCQlyZXR1cm4gMDsKIAl9Ci0KLQlTZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsKLQlyZXR1
cm4gMTsKKwlyZXR1cm4gX19odWdlX3B0X2RvbmUoaGVhZCwgcmVmcywgbnIpOwogfQogCiBzdGF0
aWMgaW50IGd1cF9odWdlX3BkKGh1Z2VwZF90IGh1Z2VwZCwgdW5zaWduZWQgbG9uZyBhZGRyLApA
QCAtMjA3MSwzMCArMjA4NSwxOCBAQCBzdGF0aWMgaW50IGd1cF9odWdlX3BtZChwbWRfdCBvcmln
LCBwbWRfdCAqcG1kcCwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkJCQkgICAgIHBhZ2VzLCBucik7
CiAJfQogCi0JcmVmcyA9IDA7CiAJcGFnZSA9IHBtZF9wYWdlKG9yaWcpICsgKChhZGRyICYgflBN
RF9NQVNLKSA+PiBQQUdFX1NISUZUKTsKLQlkbyB7Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwotCQko
Km5yKSsrOwotCQlwYWdlKys7Ci0JCXJlZnMrKzsKLQl9IHdoaWxlIChhZGRyICs9IFBBR0VfU0la
RSwgYWRkciAhPSBlbmQpOworCXJlZnMgPSBfX3JlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBl
bmQsIHBhZ2VzLCAqbnIpOwogCiAJaGVhZCA9IHRyeV9nZXRfY29tcG91bmRfaGVhZChwbWRfcGFn
ZShvcmlnKSwgcmVmcyk7Ci0JaWYgKCFoZWFkKSB7Ci0JCSpuciAtPSByZWZzOworCWlmICghaGVh
ZCkKIAkJcmV0dXJuIDA7Ci0JfQogCiAJaWYgKHVubGlrZWx5KHBtZF92YWwob3JpZykgIT0gcG1k
X3ZhbCgqcG1kcCkpKSB7Ci0JCSpuciAtPSByZWZzOwotCQl3aGlsZSAocmVmcy0tKQotCQkJcHV0
X3BhZ2UoaGVhZCk7CisJCV9fcmVtb3ZlX3JlZnNfZnJvbV9oZWFkKGhlYWQsIHJlZnMpOwogCQly
ZXR1cm4gMDsKIAl9Ci0KLQlTZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsKLQlyZXR1cm4gMTsKKwly
ZXR1cm4gX19odWdlX3B0X2RvbmUoaGVhZCwgcmVmcywgbnIpOwogfQogCiBzdGF0aWMgaW50IGd1
cF9odWdlX3B1ZChwdWRfdCBvcmlnLCBwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBhZGRyLApA
QCAtMjExNCwzMCArMjExNiwxOCBAQCBzdGF0aWMgaW50IGd1cF9odWdlX3B1ZChwdWRfdCBvcmln
LCBwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkJCQkgICAgIHBhZ2VzLCBucik7
CiAJfQogCi0JcmVmcyA9IDA7CiAJcGFnZSA9IHB1ZF9wYWdlKG9yaWcpICsgKChhZGRyICYgflBV
RF9NQVNLKSA+PiBQQUdFX1NISUZUKTsKLQlkbyB7Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwotCQko
Km5yKSsrOwotCQlwYWdlKys7Ci0JCXJlZnMrKzsKLQl9IHdoaWxlIChhZGRyICs9IFBBR0VfU0la
RSwgYWRkciAhPSBlbmQpOworCXJlZnMgPSBfX3JlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBl
bmQsIHBhZ2VzLCAqbnIpOwogCiAJaGVhZCA9IHRyeV9nZXRfY29tcG91bmRfaGVhZChwdWRfcGFn
ZShvcmlnKSwgcmVmcyk7Ci0JaWYgKCFoZWFkKSB7Ci0JCSpuciAtPSByZWZzOworCWlmICghaGVh
ZCkKIAkJcmV0dXJuIDA7Ci0JfQogCiAJaWYgKHVubGlrZWx5KHB1ZF92YWwob3JpZykgIT0gcHVk
X3ZhbCgqcHVkcCkpKSB7Ci0JCSpuciAtPSByZWZzOwotCQl3aGlsZSAocmVmcy0tKQotCQkJcHV0
X3BhZ2UoaGVhZCk7CisJCV9fcmVtb3ZlX3JlZnNfZnJvbV9oZWFkKGhlYWQsIHJlZnMpOwogCQly
ZXR1cm4gMDsKIAl9Ci0KLQlTZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsKLQlyZXR1cm4gMTsKKwly
ZXR1cm4gX19odWdlX3B0X2RvbmUoaGVhZCwgcmVmcywgbnIpOwogfQogCiBzdGF0aWMgaW50IGd1
cF9odWdlX3BnZChwZ2RfdCBvcmlnLCBwZ2RfdCAqcGdkcCwgdW5zaWduZWQgbG9uZyBhZGRyLApA
QCAtMjE1MSwzMCArMjE0MSwxOSBAQCBzdGF0aWMgaW50IGd1cF9odWdlX3BnZChwZ2RfdCBvcmln
LCBwZ2RfdCAqcGdkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQlyZXR1cm4gMDsKIAogCUJVSUxE
X0JVR19PTihwZ2RfZGV2bWFwKG9yaWcpKTsKLQlyZWZzID0gMDsKKwogCXBhZ2UgPSBwZ2RfcGFn
ZShvcmlnKSArICgoYWRkciAmIH5QR0RJUl9NQVNLKSA+PiBQQUdFX1NISUZUKTsKLQlkbyB7Ci0J
CXBhZ2VzWypucl0gPSBwYWdlOwotCQkoKm5yKSsrOwotCQlwYWdlKys7Ci0JCXJlZnMrKzsKLQl9
IHdoaWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOworCXJlZnMgPSBfX3JlY29y
ZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBlbmQsIHBhZ2VzLCAqbnIpOwogCiAJaGVhZCA9IHRyeV9n
ZXRfY29tcG91bmRfaGVhZChwZ2RfcGFnZShvcmlnKSwgcmVmcyk7Ci0JaWYgKCFoZWFkKSB7Ci0J
CSpuciAtPSByZWZzOworCWlmICghaGVhZCkKIAkJcmV0dXJuIDA7Ci0JfQogCiAJaWYgKHVubGlr
ZWx5KHBnZF92YWwob3JpZykgIT0gcGdkX3ZhbCgqcGdkcCkpKSB7Ci0JCSpuciAtPSByZWZzOwot
CQl3aGlsZSAocmVmcy0tKQotCQkJcHV0X3BhZ2UoaGVhZCk7CisJCV9fcmVtb3ZlX3JlZnNfZnJv
bV9oZWFkKGhlYWQsIHJlZnMpOwogCQlyZXR1cm4gMDsKIAl9Ci0KLQlTZXRQYWdlUmVmZXJlbmNl
ZChoZWFkKTsKLQlyZXR1cm4gMTsKKwlyZXR1cm4gX19odWdlX3B0X2RvbmUoaGVhZCwgcmVmcywg
bnIpOwogfQogCiBzdGF0aWMgaW50IGd1cF9wbWRfcmFuZ2UocHVkX3QgcHVkLCB1bnNpZ25lZCBs
b25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kLAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
