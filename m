Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 430FB121CCD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 23:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468816E8C5;
	Mon, 16 Dec 2019 22:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013606E8C0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 22:25:40 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df8045b0001>; Mon, 16 Dec 2019 14:25:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 16 Dec 2019 14:25:40 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 16 Dec 2019 14:25:40 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Dec
 2019 22:25:39 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Dec
 2019 22:25:39 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 16 Dec 2019 22:25:39 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5df804630002>; Mon, 16 Dec 2019 14:25:39 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v11 01/25] mm/gup: factor out duplicate code from four routines
Date: Mon, 16 Dec 2019 14:25:13 -0800
Message-ID: <20191216222537.491123-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191216222537.491123-1-jhubbard@nvidia.com>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576535132; bh=HWyNjs6ywGvdqZPFXTnFG85letSRuTmGeFnSWXnBMB0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=jyMh2uZ9DlLbmgf/hFXACBgJky8gUF15EUU0ckvOLpJ3PY+P8ESRv6RR73lI5W7L9
 1PPPr3nG8d3+imdOwWybdn7nP0qyznDHLsP2ZO1TevAlqPHRqADEE+MTmGtoaTePpa
 jLbl/hf5tnMu1SfkRZVDLQ+JeUuhb/CgzH/bzkPW5YPIAY6Y+7oVkVtw329jSZFlQI
 e4Qg6Vp66fdhSULbEcKBKmmxnd6i8dWuDDIQoMlk8YqiOF91oKfMhb25c4lMcNIQMJ
 lbcy1BRDCWqRZFcaV9a1urI4sC+BeDUETZ69bHvno8lpaKjFgxcEjKLNbs6AumfxI1
 3a1KQhm8Dq+qw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
byBpbmNyZW1lbnQgKm5yLgoKUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPgpSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClJl
dmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpDYzogSXJhIFdlaW55IDxpcmEud2Vp
bnlAaW50ZWwuY29tPgpDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CkNjOiBBbmVl
c2ggS3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4KU2lnbmVkLW9mZi1ieTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIG1tL2d1cC5jIHwgOTEgKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jCmluZGV4IDc2NDZiZjk5M2IyNS4uZjc2NDQzMjkxNGM0
IDEwMDY0NAotLS0gYS9tbS9ndXAuYworKysgYi9tbS9ndXAuYwpAQCAtMTk3OCw2ICsxOTc4LDI1
IEBAIHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2VfcHVkKHB1ZF90IHB1ZCwgcHVkX3QgKnB1
ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKIH0KICNlbmRpZgogCitzdGF0aWMgaW50IHJlY29yZF9z
dWJwYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9uZyBhZGRyLAorCQkJICAgdW5z
aWduZWQgbG9uZyBlbmQsIHN0cnVjdCBwYWdlICoqcGFnZXMpCit7CisJaW50IG5yOworCisJZm9y
IChuciA9IDA7IGFkZHIgIT0gZW5kOyBhZGRyICs9IFBBR0VfU0laRSkKKwkJcGFnZXNbbnIrK10g
PSBwYWdlKys7CisKKwlyZXR1cm4gbnI7Cit9CisKK3N0YXRpYyB2b2lkIHB1dF9jb21wb3VuZF9o
ZWFkKHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgcmVmcykKK3sKKwkvKiBEbyBhIGdldF9wYWdlKCkg
Zmlyc3QsIGluIGNhc2UgcmVmcyA9PSBwYWdlLT5fcmVmY291bnQgKi8KKwlnZXRfcGFnZShwYWdl
KTsKKwlwYWdlX3JlZl9zdWIocGFnZSwgcmVmcyk7CisJcHV0X3BhZ2UocGFnZSk7Cit9CisKICNp
ZmRlZiBDT05GSUdfQVJDSF9IQVNfSFVHRVBECiBzdGF0aWMgdW5zaWduZWQgbG9uZyBodWdlcHRl
X2FkZHJfZW5kKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBlbmQsCiAJCQkJICAg
ICAgdW5zaWduZWQgbG9uZyBzeikKQEAgLTIwMDcsMzIgKzIwMjYsMjAgQEAgc3RhdGljIGludCBn
dXBfaHVnZXB0ZShwdGVfdCAqcHRlcCwgdW5zaWduZWQgbG9uZyBzeiwgdW5zaWduZWQgbG9uZyBh
ZGRyLAogCS8qIGh1Z2VwYWdlcyBhcmUgbmV2ZXIgInNwZWNpYWwiICovCiAJVk1fQlVHX09OKCFw
Zm5fdmFsaWQocHRlX3BmbihwdGUpKSk7CiAKLQlyZWZzID0gMDsKIAloZWFkID0gcHRlX3BhZ2Uo
cHRlKTsKLQogCXBhZ2UgPSBoZWFkICsgKChhZGRyICYgKHN6LTEpKSA+PiBQQUdFX1NISUZUKTsK
LQlkbyB7Ci0JCVZNX0JVR19PTihjb21wb3VuZF9oZWFkKHBhZ2UpICE9IGhlYWQpOwotCQlwYWdl
c1sqbnJdID0gcGFnZTsKLQkJKCpucikrKzsKLQkJcGFnZSsrOwotCQlyZWZzKys7Ci0JfSB3aGls
ZSAoYWRkciArPSBQQUdFX1NJWkUsIGFkZHIgIT0gZW5kKTsKKwlyZWZzID0gcmVjb3JkX3N1YnBh
Z2VzKHBhZ2UsIGFkZHIsIGVuZCwgcGFnZXMgKyAqbnIpOwogCiAJaGVhZCA9IHRyeV9nZXRfY29t
cG91bmRfaGVhZChoZWFkLCByZWZzKTsKLQlpZiAoIWhlYWQpIHsKLQkJKm5yIC09IHJlZnM7CisJ
aWYgKCFoZWFkKQogCQlyZXR1cm4gMDsKLQl9CiAKIAlpZiAodW5saWtlbHkocHRlX3ZhbChwdGUp
ICE9IHB0ZV92YWwoKnB0ZXApKSkgewotCQkvKiBDb3VsZCBiZSBvcHRpbWl6ZWQgYmV0dGVyICov
Ci0JCSpuciAtPSByZWZzOwotCQl3aGlsZSAocmVmcy0tKQotCQkJcHV0X3BhZ2UoaGVhZCk7CisJ
CXB1dF9jb21wb3VuZF9oZWFkKGhlYWQsIHJlZnMpOwogCQlyZXR1cm4gMDsKIAl9CiAKKwkqbnIg
Kz0gcmVmczsKIAlTZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsKIAlyZXR1cm4gMTsKIH0KQEAgLTIw
NzksMjggKzIwODYsMTkgQEAgc3RhdGljIGludCBndXBfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1k
X3QgKnBtZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJcmV0dXJuIF9fZ3VwX2RldmljZV9odWdl
X3BtZChvcmlnLCBwbWRwLCBhZGRyLCBlbmQsIHBhZ2VzLCBucik7CiAJfQogCi0JcmVmcyA9IDA7
CiAJcGFnZSA9IHBtZF9wYWdlKG9yaWcpICsgKChhZGRyICYgflBNRF9NQVNLKSA+PiBQQUdFX1NI
SUZUKTsKLQlkbyB7Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwotCQkoKm5yKSsrOwotCQlwYWdlKys7
Ci0JCXJlZnMrKzsKLQl9IHdoaWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOwor
CXJlZnMgPSByZWNvcmRfc3VicGFnZXMocGFnZSwgYWRkciwgZW5kLCBwYWdlcyArICpucik7CiAK
IAloZWFkID0gdHJ5X2dldF9jb21wb3VuZF9oZWFkKHBtZF9wYWdlKG9yaWcpLCByZWZzKTsKLQlp
ZiAoIWhlYWQpIHsKLQkJKm5yIC09IHJlZnM7CisJaWYgKCFoZWFkKQogCQlyZXR1cm4gMDsKLQl9
CiAKIAlpZiAodW5saWtlbHkocG1kX3ZhbChvcmlnKSAhPSBwbWRfdmFsKCpwbWRwKSkpIHsKLQkJ
Km5yIC09IHJlZnM7Ci0JCXdoaWxlIChyZWZzLS0pCi0JCQlwdXRfcGFnZShoZWFkKTsKKwkJcHV0
X2NvbXBvdW5kX2hlYWQoaGVhZCwgcmVmcyk7CiAJCXJldHVybiAwOwogCX0KIAorCSpuciArPSBy
ZWZzOwogCVNldFBhZ2VSZWZlcmVuY2VkKGhlYWQpOwogCXJldHVybiAxOwogfQpAQCAtMjEyMCwy
OCArMjExOCwxOSBAQCBzdGF0aWMgaW50IGd1cF9odWdlX3B1ZChwdWRfdCBvcmlnLCBwdWRfdCAq
cHVkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQlyZXR1cm4gX19ndXBfZGV2aWNlX2h1Z2VfcHVk
KG9yaWcsIHB1ZHAsIGFkZHIsIGVuZCwgcGFnZXMsIG5yKTsKIAl9CiAKLQlyZWZzID0gMDsKIAlw
YWdlID0gcHVkX3BhZ2Uob3JpZykgKyAoKGFkZHIgJiB+UFVEX01BU0spID4+IFBBR0VfU0hJRlQp
OwotCWRvIHsKLQkJcGFnZXNbKm5yXSA9IHBhZ2U7Ci0JCSgqbnIpKys7Ci0JCXBhZ2UrKzsKLQkJ
cmVmcysrOwotCX0gd2hpbGUgKGFkZHIgKz0gUEFHRV9TSVpFLCBhZGRyICE9IGVuZCk7CisJcmVm
cyA9IHJlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBlbmQsIHBhZ2VzICsgKm5yKTsKIAogCWhl
YWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQocHVkX3BhZ2Uob3JpZyksIHJlZnMpOwotCWlmICgh
aGVhZCkgewotCQkqbnIgLT0gcmVmczsKKwlpZiAoIWhlYWQpCiAJCXJldHVybiAwOwotCX0KIAog
CWlmICh1bmxpa2VseShwdWRfdmFsKG9yaWcpICE9IHB1ZF92YWwoKnB1ZHApKSkgewotCQkqbnIg
LT0gcmVmczsKLQkJd2hpbGUgKHJlZnMtLSkKLQkJCXB1dF9wYWdlKGhlYWQpOworCQlwdXRfY29t
cG91bmRfaGVhZChoZWFkLCByZWZzKTsKIAkJcmV0dXJuIDA7CiAJfQogCisJKm5yICs9IHJlZnM7
CiAJU2V0UGFnZVJlZmVyZW5jZWQoaGVhZCk7CiAJcmV0dXJuIDE7CiB9CkBAIC0yMTU3LDI4ICsy
MTQ2LDIwIEBAIHN0YXRpYyBpbnQgZ3VwX2h1Z2VfcGdkKHBnZF90IG9yaWcsIHBnZF90ICpwZ2Rw
LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCXJldHVybiAwOwogCiAJQlVJTERfQlVHX09OKHBnZF9k
ZXZtYXAob3JpZykpOwotCXJlZnMgPSAwOworCiAJcGFnZSA9IHBnZF9wYWdlKG9yaWcpICsgKChh
ZGRyICYgflBHRElSX01BU0spID4+IFBBR0VfU0hJRlQpOwotCWRvIHsKLQkJcGFnZXNbKm5yXSA9
IHBhZ2U7Ci0JCSgqbnIpKys7Ci0JCXBhZ2UrKzsKLQkJcmVmcysrOwotCX0gd2hpbGUgKGFkZHIg
Kz0gUEFHRV9TSVpFLCBhZGRyICE9IGVuZCk7CisJcmVmcyA9IHJlY29yZF9zdWJwYWdlcyhwYWdl
LCBhZGRyLCBlbmQsIHBhZ2VzICsgKm5yKTsKIAogCWhlYWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hl
YWQocGdkX3BhZ2Uob3JpZyksIHJlZnMpOwotCWlmICghaGVhZCkgewotCQkqbnIgLT0gcmVmczsK
KwlpZiAoIWhlYWQpCiAJCXJldHVybiAwOwotCX0KIAogCWlmICh1bmxpa2VseShwZ2RfdmFsKG9y
aWcpICE9IHBnZF92YWwoKnBnZHApKSkgewotCQkqbnIgLT0gcmVmczsKLQkJd2hpbGUgKHJlZnMt
LSkKLQkJCXB1dF9wYWdlKGhlYWQpOworCQlwdXRfY29tcG91bmRfaGVhZChoZWFkLCByZWZzKTsK
IAkJcmV0dXJuIDA7CiAJfQogCisJKm5yICs9IHJlZnM7CiAJU2V0UGFnZVJlZmVyZW5jZWQoaGVh
ZCk7CiAJcmV0dXJuIDE7CiB9Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
