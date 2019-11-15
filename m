Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27331FD4B4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 06:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82F96E252;
	Fri, 15 Nov 2019 05:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4B36E0F0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 05:53:45 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce3d6c0002>; Thu, 14 Nov 2019 21:53:48 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 14 Nov 2019 21:53:45 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 14 Nov 2019 21:53:45 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:44 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:43 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 15 Nov 2019 05:53:43 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dce3d670002>; Thu, 14 Nov 2019 21:53:43 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 02/24] mm/gup: factor out duplicate code from four routines
Date: Thu, 14 Nov 2019 21:53:18 -0800
Message-ID: <20191115055340.1825745-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115055340.1825745-1-jhubbard@nvidia.com>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573797228; bh=RdyLsabgoLXh9bf1ixn5CrxhPotpLYtKwBjxP6fVIEM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=dzL2inO2WDubiJ2bAKfnRnA9CoV0hbjvI8koqABlvrX8DV2QmfTkGtS0pmNPx8Jpt
 KPS+/HVK6A/7DIdJDFyfYUTxMgpP9ookazm5tH6hhPaWFYnaxsGQ43dHW+efgfKQ3Q
 Afek/hwUL1kGDHWNsn7ZA9Wyr1irw3A+8t0y0/lSv/BVGwVSA6k0AlsOp0GG+SzBqZ
 rn9wV9M+cuPQUjxw+CdwhO2TzComdSYz9M3l+lkWFKED8ng9vehEZZoclcjdOKQZWA
 6Gv/P/LPpQXDjMWb7p864tJyGFN+nV44AycJtTx85aJsLetJZHTYJiBb2ey30ldxUL
 mT5HiRNG5wGxQ==
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
byBpbmNyZW1lbnQgKm5yLgoKUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUBy
ZWRoYXQuY29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IElyYSBXZWlueSA8aXJh
LndlaW55QGludGVsLmNvbT4KQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpDYzog
QW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+ClNpZ25lZC1vZmYt
Ynk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXAuYyB8IDk1
ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwppbmRleCA4NWNhZjc2YjMwMTIuLjg1ODU0MWVh
MzBjZSAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAgLTE5NjksNiArMTk2
OSwyOSBAQCBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3B1ZChwdWRfdCBwdWQsIHB1ZF90
ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCiB9CiAjZW5kaWYKIAorc3RhdGljIGludCBfX3Jl
Y29yZF9zdWJwYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9uZyBhZGRyLAorCQkJ
ICAgICB1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcykKK3sKKwlpbnQgbnIg
PSAwOworCWludCBucl9yZWNvcmRlZF9wYWdlcyA9IDA7CisKKwlkbyB7CisJCXBhZ2VzW25yXSA9
IHBhZ2U7CisJCW5yKys7CisJCXBhZ2UrKzsKKwkJbnJfcmVjb3JkZWRfcGFnZXMrKzsKKwl9IHdo
aWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOworCXJldHVybiBucl9yZWNvcmRl
ZF9wYWdlczsKK30KKworc3RhdGljIHZvaWQgcHV0X2NvbXBvdW5kX2hlYWQoc3RydWN0IHBhZ2Ug
KnBhZ2UsIGludCByZWZzKQoreworCS8qIERvIGEgZ2V0X3BhZ2UoKSBmaXJzdCwgaW4gY2FzZSBy
ZWZzID09IHBhZ2UtPl9yZWZjb3VudCAqLworCWdldF9wYWdlKHBhZ2UpOworCXBhZ2VfcmVmX3N1
YihwYWdlLCByZWZzKTsKKwlwdXRfcGFnZShwYWdlKTsKK30KKwogI2lmZGVmIENPTkZJR19BUkNI
X0hBU19IVUdFUEQKIHN0YXRpYyB1bnNpZ25lZCBsb25nIGh1Z2VwdGVfYWRkcl9lbmQodW5zaWdu
ZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwKIAkJCQkgICAgICB1bnNpZ25lZCBsb25n
IHN6KQpAQCAtMTk5OCwzMiArMjAyMSwyMCBAQCBzdGF0aWMgaW50IGd1cF9odWdlcHRlKHB0ZV90
ICpwdGVwLCB1bnNpZ25lZCBsb25nIHN6LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJLyogaHVnZXBh
Z2VzIGFyZSBuZXZlciAic3BlY2lhbCIgKi8KIAlWTV9CVUdfT04oIXBmbl92YWxpZChwdGVfcGZu
KHB0ZSkpKTsKIAotCXJlZnMgPSAwOwogCWhlYWQgPSBwdGVfcGFnZShwdGUpOwotCiAJcGFnZSA9
IGhlYWQgKyAoKGFkZHIgJiAoc3otMSkpID4+IFBBR0VfU0hJRlQpOwotCWRvIHsKLQkJVk1fQlVH
X09OKGNvbXBvdW5kX2hlYWQocGFnZSkgIT0gaGVhZCk7Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwot
CQkoKm5yKSsrOwotCQlwYWdlKys7Ci0JCXJlZnMrKzsKLQl9IHdoaWxlIChhZGRyICs9IFBBR0Vf
U0laRSwgYWRkciAhPSBlbmQpOworCXJlZnMgPSBfX3JlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRy
LCBlbmQsIHBhZ2VzICsgKm5yKTsKIAogCWhlYWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQoaGVh
ZCwgcmVmcyk7Ci0JaWYgKCFoZWFkKSB7Ci0JCSpuciAtPSByZWZzOworCWlmICghaGVhZCkKIAkJ
cmV0dXJuIDA7Ci0JfQogCiAJaWYgKHVubGlrZWx5KHB0ZV92YWwocHRlKSAhPSBwdGVfdmFsKCpw
dGVwKSkpIHsKLQkJLyogQ291bGQgYmUgb3B0aW1pemVkIGJldHRlciAqLwotCQkqbnIgLT0gcmVm
czsKLQkJd2hpbGUgKHJlZnMtLSkKLQkJCXB1dF9wYWdlKGhlYWQpOworCQlwdXRfY29tcG91bmRf
aGVhZChoZWFkLCByZWZzKTsKIAkJcmV0dXJuIDA7CiAJfQogCisJKm5yICs9IHJlZnM7CiAJU2V0
UGFnZVJlZmVyZW5jZWQoaGVhZCk7CiAJcmV0dXJuIDE7CiB9CkBAIC0yMDcxLDI4ICsyMDgyLDE5
IEBAIHN0YXRpYyBpbnQgZ3VwX2h1Z2VfcG1kKHBtZF90IG9yaWcsIHBtZF90ICpwbWRwLCB1bnNp
Z25lZCBsb25nIGFkZHIsCiAJCQkJCSAgICAgcGFnZXMsIG5yKTsKIAl9CiAKLQlyZWZzID0gMDsK
IAlwYWdlID0gcG1kX3BhZ2Uob3JpZykgKyAoKGFkZHIgJiB+UE1EX01BU0spID4+IFBBR0VfU0hJ
RlQpOwotCWRvIHsKLQkJcGFnZXNbKm5yXSA9IHBhZ2U7Ci0JCSgqbnIpKys7Ci0JCXBhZ2UrKzsK
LQkJcmVmcysrOwotCX0gd2hpbGUgKGFkZHIgKz0gUEFHRV9TSVpFLCBhZGRyICE9IGVuZCk7CisJ
cmVmcyA9IF9fcmVjb3JkX3N1YnBhZ2VzKHBhZ2UsIGFkZHIsIGVuZCwgcGFnZXMgKyAqbnIpOwog
CiAJaGVhZCA9IHRyeV9nZXRfY29tcG91bmRfaGVhZChwbWRfcGFnZShvcmlnKSwgcmVmcyk7Ci0J
aWYgKCFoZWFkKSB7Ci0JCSpuciAtPSByZWZzOworCWlmICghaGVhZCkKIAkJcmV0dXJuIDA7Ci0J
fQogCiAJaWYgKHVubGlrZWx5KHBtZF92YWwob3JpZykgIT0gcG1kX3ZhbCgqcG1kcCkpKSB7Ci0J
CSpuciAtPSByZWZzOwotCQl3aGlsZSAocmVmcy0tKQotCQkJcHV0X3BhZ2UoaGVhZCk7CisJCXB1
dF9jb21wb3VuZF9oZWFkKGhlYWQsIHJlZnMpOwogCQlyZXR1cm4gMDsKIAl9CiAKKwkqbnIgKz0g
cmVmczsKIAlTZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsKIAlyZXR1cm4gMTsKIH0KQEAgLTIxMTQs
MjggKzIxMTYsMTkgQEAgc3RhdGljIGludCBndXBfaHVnZV9wdWQocHVkX3Qgb3JpZywgcHVkX3Qg
KnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJCQkJICAgICBwYWdlcywgbnIpOwogCX0KIAot
CXJlZnMgPSAwOwogCXBhZ2UgPSBwdWRfcGFnZShvcmlnKSArICgoYWRkciAmIH5QVURfTUFTSykg
Pj4gUEFHRV9TSElGVCk7Ci0JZG8gewotCQlwYWdlc1sqbnJdID0gcGFnZTsKLQkJKCpucikrKzsK
LQkJcGFnZSsrOwotCQlyZWZzKys7Ci0JfSB3aGlsZSAoYWRkciArPSBQQUdFX1NJWkUsIGFkZHIg
IT0gZW5kKTsKKwlyZWZzID0gX19yZWNvcmRfc3VicGFnZXMocGFnZSwgYWRkciwgZW5kLCBwYWdl
cyArICpucik7CiAKIAloZWFkID0gdHJ5X2dldF9jb21wb3VuZF9oZWFkKHB1ZF9wYWdlKG9yaWcp
LCByZWZzKTsKLQlpZiAoIWhlYWQpIHsKLQkJKm5yIC09IHJlZnM7CisJaWYgKCFoZWFkKQogCQly
ZXR1cm4gMDsKLQl9CiAKIAlpZiAodW5saWtlbHkocHVkX3ZhbChvcmlnKSAhPSBwdWRfdmFsKCpw
dWRwKSkpIHsKLQkJKm5yIC09IHJlZnM7Ci0JCXdoaWxlIChyZWZzLS0pCi0JCQlwdXRfcGFnZSho
ZWFkKTsKKwkJcHV0X2NvbXBvdW5kX2hlYWQoaGVhZCwgcmVmcyk7CiAJCXJldHVybiAwOwogCX0K
IAorCSpuciArPSByZWZzOwogCVNldFBhZ2VSZWZlcmVuY2VkKGhlYWQpOwogCXJldHVybiAxOwog
fQpAQCAtMjE1MSwyOCArMjE0NCwyMCBAQCBzdGF0aWMgaW50IGd1cF9odWdlX3BnZChwZ2RfdCBv
cmlnLCBwZ2RfdCAqcGdkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQlyZXR1cm4gMDsKIAogCUJV
SUxEX0JVR19PTihwZ2RfZGV2bWFwKG9yaWcpKTsKLQlyZWZzID0gMDsKKwogCXBhZ2UgPSBwZ2Rf
cGFnZShvcmlnKSArICgoYWRkciAmIH5QR0RJUl9NQVNLKSA+PiBQQUdFX1NISUZUKTsKLQlkbyB7
Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwotCQkoKm5yKSsrOwotCQlwYWdlKys7Ci0JCXJlZnMrKzsK
LQl9IHdoaWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOworCXJlZnMgPSBfX3Jl
Y29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBlbmQsIHBhZ2VzICsgKm5yKTsKIAogCWhlYWQgPSB0
cnlfZ2V0X2NvbXBvdW5kX2hlYWQocGdkX3BhZ2Uob3JpZyksIHJlZnMpOwotCWlmICghaGVhZCkg
ewotCQkqbnIgLT0gcmVmczsKKwlpZiAoIWhlYWQpCiAJCXJldHVybiAwOwotCX0KIAogCWlmICh1
bmxpa2VseShwZ2RfdmFsKG9yaWcpICE9IHBnZF92YWwoKnBnZHApKSkgewotCQkqbnIgLT0gcmVm
czsKLQkJd2hpbGUgKHJlZnMtLSkKLQkJCXB1dF9wYWdlKGhlYWQpOworCQlwdXRfY29tcG91bmRf
aGVhZChoZWFkLCByZWZzKTsKIAkJcmV0dXJuIDA7CiAJfQogCisJKm5yICs9IHJlZnM7CiAJU2V0
UGFnZVJlZmVyZW5jZWQoaGVhZCk7CiAJcmV0dXJuIDE7CiB9Ci0tIAoyLjI0LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
