Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 541A5FA81D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 05:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BDA6EC6A;
	Wed, 13 Nov 2019 04:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AE36EC66
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:27:13 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb85e80001>; Tue, 12 Nov 2019 20:26:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 20:27:12 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 20:27:12 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:27:12 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 13 Nov 2019 04:27:12 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dcb861f0003>; Tue, 12 Nov 2019 20:27:11 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 02/23] mm/gup: factor out duplicate code from four routines
Date: Tue, 12 Nov 2019 20:26:49 -0800
Message-ID: <20191113042710.3997854-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113042710.3997854-1-jhubbard@nvidia.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573619177; bh=kJfdBwtxV0Xf/7sPEfLRjg5QuIfiLXYo87o9tgl9dSA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=KXAtPqe3/vp+Yt8jEcJBWjH2hIR3D8OC+eB+GnypX8Sn3senSX3NF4pzFvF8bVQv2
 kJRQUmdxsS1TW8jErvtOnCB2sGO+6l1IeK7KKq8IPt0h+inmZA/ZPa1QYoDDQWLTTo
 F/ExSZh3FpJmmdqdF45ezY1Km/sIuxjW5gntXsJAghltdldo6jHfM6lcDGxxKM7Fr3
 I/rK5MZBlm0or7hVVZIHd7MHnRheMXvm7XasmFc+z9NG5d3fEz8vIuohFn8auSC9gb
 cKpq9q7Cc0XHXKQDPiD4voNLun1SYfoC3QWgHFgfXvUfHfMqts4I1iTlRL3R905a4o
 sRAzS2KBCkb0g==
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
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
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
ZWRoYXQuY29tPgpDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgpDYzogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CkNjOiBBbmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gua3Vt
YXJAbGludXguaWJtLmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIG1tL2d1cC5jIHwgMTA0ICsrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRp
b25zKCspLCA1OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5j
CmluZGV4IDg1Y2FmNzZiMzAxMi4uMTk5ZGE5OWU4ZmZjIDEwMDY0NAotLS0gYS9tbS9ndXAuYwor
KysgYi9tbS9ndXAuYwpAQCAtMTk2OSw2ICsxOTY5LDM0IEBAIHN0YXRpYyBpbnQgX19ndXBfZGV2
aWNlX2h1Z2VfcHVkKHB1ZF90IHB1ZCwgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwK
IH0KICNlbmRpZgogCitzdGF0aWMgaW50IF9fcmVjb3JkX3N1YnBhZ2VzKHN0cnVjdCBwYWdlICpw
YWdlLCB1bnNpZ25lZCBsb25nIGFkZHIsCisJCQkgICAgIHVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1
Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgbnIpCit7CisJaW50IG5yX3JlY29yZGVkX3BhZ2VzID0gMDsK
KworCWRvIHsKKwkJcGFnZXNbbnJdID0gcGFnZTsKKwkJbnIrKzsKKwkJcGFnZSsrOworCQlucl9y
ZWNvcmRlZF9wYWdlcysrOworCX0gd2hpbGUgKGFkZHIgKz0gUEFHRV9TSVpFLCBhZGRyICE9IGVu
ZCk7CisJcmV0dXJuIG5yX3JlY29yZGVkX3BhZ2VzOworfQorCitzdGF0aWMgdm9pZCBwdXRfY29t
cG91bmRfaGVhZChzdHJ1Y3QgcGFnZSAqcGFnZSwgaW50IHJlZnMpCit7CisJLyogRG8gYSBnZXRf
cGFnZSgpIGZpcnN0LCBpbiBjYXNlIHJlZnMgPT0gcGFnZS0+X3JlZmNvdW50ICovCisJZ2V0X3Bh
Z2UocGFnZSk7CisJcGFnZV9yZWZfc3ViKHBhZ2UsIHJlZnMpOworCXB1dF9wYWdlKHBhZ2UpOwor
fQorCitzdGF0aWMgdm9pZCBfX2h1Z2VfcHRfZG9uZShzdHJ1Y3QgcGFnZSAqaGVhZCwgaW50IG5y
X3JlY29yZGVkX3BhZ2VzLCBpbnQgKm5yKQoreworCSpuciArPSBucl9yZWNvcmRlZF9wYWdlczsK
KwlTZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsKK30KKwogI2lmZGVmIENPTkZJR19BUkNIX0hBU19I
VUdFUEQKIHN0YXRpYyB1bnNpZ25lZCBsb25nIGh1Z2VwdGVfYWRkcl9lbmQodW5zaWduZWQgbG9u
ZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwKIAkJCQkgICAgICB1bnNpZ25lZCBsb25nIHN6KQpA
QCAtMTk5OCwzMyArMjAyNiwyMCBAQCBzdGF0aWMgaW50IGd1cF9odWdlcHRlKHB0ZV90ICpwdGVw
LCB1bnNpZ25lZCBsb25nIHN6LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJLyogaHVnZXBhZ2VzIGFy
ZSBuZXZlciAic3BlY2lhbCIgKi8KIAlWTV9CVUdfT04oIXBmbl92YWxpZChwdGVfcGZuKHB0ZSkp
KTsKIAotCXJlZnMgPSAwOwogCWhlYWQgPSBwdGVfcGFnZShwdGUpOwotCiAJcGFnZSA9IGhlYWQg
KyAoKGFkZHIgJiAoc3otMSkpID4+IFBBR0VfU0hJRlQpOwotCWRvIHsKLQkJVk1fQlVHX09OKGNv
bXBvdW5kX2hlYWQocGFnZSkgIT0gaGVhZCk7Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwotCQkoKm5y
KSsrOwotCQlwYWdlKys7Ci0JCXJlZnMrKzsKLQl9IHdoaWxlIChhZGRyICs9IFBBR0VfU0laRSwg
YWRkciAhPSBlbmQpOworCXJlZnMgPSBfX3JlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBlbmQs
IHBhZ2VzLCAqbnIpOwogCiAJaGVhZCA9IHRyeV9nZXRfY29tcG91bmRfaGVhZChoZWFkLCByZWZz
KTsKLQlpZiAoIWhlYWQpIHsKLQkJKm5yIC09IHJlZnM7CisJaWYgKCFoZWFkKQogCQlyZXR1cm4g
MDsKLQl9CiAKIAlpZiAodW5saWtlbHkocHRlX3ZhbChwdGUpICE9IHB0ZV92YWwoKnB0ZXApKSkg
ewotCQkvKiBDb3VsZCBiZSBvcHRpbWl6ZWQgYmV0dGVyICovCi0JCSpuciAtPSByZWZzOwotCQl3
aGlsZSAocmVmcy0tKQotCQkJcHV0X3BhZ2UoaGVhZCk7CisJCXB1dF9jb21wb3VuZF9oZWFkKGhl
YWQsIHJlZnMpOwogCQlyZXR1cm4gMDsKIAl9CiAKLQlTZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsK
KwlfX2h1Z2VfcHRfZG9uZShoZWFkLCByZWZzLCBucik7CiAJcmV0dXJuIDE7CiB9CiAKQEAgLTIw
NzEsMjkgKzIwODYsMTkgQEAgc3RhdGljIGludCBndXBfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1k
X3QgKnBtZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJCQkJICAgICBwYWdlcywgbnIpOwogCX0K
IAotCXJlZnMgPSAwOwogCXBhZ2UgPSBwbWRfcGFnZShvcmlnKSArICgoYWRkciAmIH5QTURfTUFT
SykgPj4gUEFHRV9TSElGVCk7Ci0JZG8gewotCQlwYWdlc1sqbnJdID0gcGFnZTsKLQkJKCpucikr
KzsKLQkJcGFnZSsrOwotCQlyZWZzKys7Ci0JfSB3aGlsZSAoYWRkciArPSBQQUdFX1NJWkUsIGFk
ZHIgIT0gZW5kKTsKKwlyZWZzID0gX19yZWNvcmRfc3VicGFnZXMocGFnZSwgYWRkciwgZW5kLCBw
YWdlcywgKm5yKTsKIAogCWhlYWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQocG1kX3BhZ2Uob3Jp
ZyksIHJlZnMpOwotCWlmICghaGVhZCkgewotCQkqbnIgLT0gcmVmczsKKwlpZiAoIWhlYWQpCiAJ
CXJldHVybiAwOwotCX0KIAogCWlmICh1bmxpa2VseShwbWRfdmFsKG9yaWcpICE9IHBtZF92YWwo
KnBtZHApKSkgewotCQkqbnIgLT0gcmVmczsKLQkJd2hpbGUgKHJlZnMtLSkKLQkJCXB1dF9wYWdl
KGhlYWQpOworCQlwdXRfY29tcG91bmRfaGVhZChoZWFkLCByZWZzKTsKIAkJcmV0dXJuIDA7CiAJ
fQogCi0JU2V0UGFnZVJlZmVyZW5jZWQoaGVhZCk7CisJX19odWdlX3B0X2RvbmUoaGVhZCwgcmVm
cywgbnIpOwogCXJldHVybiAxOwogfQogCkBAIC0yMTE0LDI5ICsyMTE5LDE5IEBAIHN0YXRpYyBp
bnQgZ3VwX2h1Z2VfcHVkKHB1ZF90IG9yaWcsIHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFk
ZHIsCiAJCQkJCSAgICAgcGFnZXMsIG5yKTsKIAl9CiAKLQlyZWZzID0gMDsKIAlwYWdlID0gcHVk
X3BhZ2Uob3JpZykgKyAoKGFkZHIgJiB+UFVEX01BU0spID4+IFBBR0VfU0hJRlQpOwotCWRvIHsK
LQkJcGFnZXNbKm5yXSA9IHBhZ2U7Ci0JCSgqbnIpKys7Ci0JCXBhZ2UrKzsKLQkJcmVmcysrOwot
CX0gd2hpbGUgKGFkZHIgKz0gUEFHRV9TSVpFLCBhZGRyICE9IGVuZCk7CisJcmVmcyA9IF9fcmVj
b3JkX3N1YnBhZ2VzKHBhZ2UsIGFkZHIsIGVuZCwgcGFnZXMsICpucik7CiAKIAloZWFkID0gdHJ5
X2dldF9jb21wb3VuZF9oZWFkKHB1ZF9wYWdlKG9yaWcpLCByZWZzKTsKLQlpZiAoIWhlYWQpIHsK
LQkJKm5yIC09IHJlZnM7CisJaWYgKCFoZWFkKQogCQlyZXR1cm4gMDsKLQl9CiAKIAlpZiAodW5s
aWtlbHkocHVkX3ZhbChvcmlnKSAhPSBwdWRfdmFsKCpwdWRwKSkpIHsKLQkJKm5yIC09IHJlZnM7
Ci0JCXdoaWxlIChyZWZzLS0pCi0JCQlwdXRfcGFnZShoZWFkKTsKKwkJcHV0X2NvbXBvdW5kX2hl
YWQoaGVhZCwgcmVmcyk7CiAJCXJldHVybiAwOwogCX0KIAotCVNldFBhZ2VSZWZlcmVuY2VkKGhl
YWQpOworCV9faHVnZV9wdF9kb25lKGhlYWQsIHJlZnMsIG5yKTsKIAlyZXR1cm4gMTsKIH0KIApA
QCAtMjE1MSwyOSArMjE0NiwyMCBAQCBzdGF0aWMgaW50IGd1cF9odWdlX3BnZChwZ2RfdCBvcmln
LCBwZ2RfdCAqcGdkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQlyZXR1cm4gMDsKIAogCUJVSUxE
X0JVR19PTihwZ2RfZGV2bWFwKG9yaWcpKTsKLQlyZWZzID0gMDsKKwogCXBhZ2UgPSBwZ2RfcGFn
ZShvcmlnKSArICgoYWRkciAmIH5QR0RJUl9NQVNLKSA+PiBQQUdFX1NISUZUKTsKLQlkbyB7Ci0J
CXBhZ2VzWypucl0gPSBwYWdlOwotCQkoKm5yKSsrOwotCQlwYWdlKys7Ci0JCXJlZnMrKzsKLQl9
IHdoaWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOworCXJlZnMgPSBfX3JlY29y
ZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBlbmQsIHBhZ2VzLCAqbnIpOwogCiAJaGVhZCA9IHRyeV9n
ZXRfY29tcG91bmRfaGVhZChwZ2RfcGFnZShvcmlnKSwgcmVmcyk7Ci0JaWYgKCFoZWFkKSB7Ci0J
CSpuciAtPSByZWZzOworCWlmICghaGVhZCkKIAkJcmV0dXJuIDA7Ci0JfQogCiAJaWYgKHVubGlr
ZWx5KHBnZF92YWwob3JpZykgIT0gcGdkX3ZhbCgqcGdkcCkpKSB7Ci0JCSpuciAtPSByZWZzOwot
CQl3aGlsZSAocmVmcy0tKQotCQkJcHV0X3BhZ2UoaGVhZCk7CisJCXB1dF9jb21wb3VuZF9oZWFk
KGhlYWQsIHJlZnMpOwogCQlyZXR1cm4gMDsKIAl9CiAKLQlTZXRQYWdlUmVmZXJlbmNlZChoZWFk
KTsKKwlfX2h1Z2VfcHRfZG9uZShoZWFkLCByZWZzLCBucik7CiAJcmV0dXJuIDE7CiB9CiAKLS0g
CjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
