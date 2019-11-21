Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6903C104B27
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1046EAFF;
	Thu, 21 Nov 2019 07:13:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E4D6EB02
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:13:56 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd639340000>; Wed, 20 Nov 2019 23:13:57 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 20 Nov 2019 23:13:56 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 20 Nov 2019 23:13:56 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 07:13:55 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 21 Nov 2019 07:13:55 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd639330003>; Wed, 20 Nov 2019 23:13:55 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 02/24] mm/gup: factor out duplicate code from four routines
Date: Wed, 20 Nov 2019 23:13:32 -0800
Message-ID: <20191121071354.456618-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121071354.456618-1-jhubbard@nvidia.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574320437; bh=sKvmWb988RM84yP+egQhSiN41dObVjIOUVoMHE//spE=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=AABiJjmzLHly90Lc+tpSgWvQ2gkOLBSYLx+q1zdjNh8KcQhGmFmsHnn0Y5BGHpRJD
 lgauCr1HVm47H+VZMReB1beCsG5JEAaltjH32A42RpfeXBABxRH7jysaeIpaogLDkZ
 8vVFkAkRSmHW4rTeElrnSY8BxawMss/QQfrXR6NVDNG3J/EiAwhHBmoa3hsNalR0R1
 NEox93K3NNzsOwo/F3iWRgwraeHBU6qhr8MtkgZIHumtbLgVhvBfHBC2cOT7xMTeSJ
 FBTqNvemx2QSN1/9cmZo/T+p9xWcNyjvq/uK2CE2cqAq0m4K4xzqaaPXYYOE8SdXxC
 zlcdC2LZ1r8GQ==
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
ZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IElyYSBX
ZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPgpDYzogQW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+ClNp
Z25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9n
dXAuYyB8IDkxICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwppbmRleCA4NWNhZjc2YjMwMTIu
LmYzYzdkNjYyNTgxNyAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAgLTE5
NjksNiArMTk2OSwyNSBAQCBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3B1ZChwdWRfdCBw
dWQsIHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCiB9CiAjZW5kaWYKIAorc3RhdGlj
IGludCBfX3JlY29yZF9zdWJwYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9uZyBh
ZGRyLAorCQkJICAgICB1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcykKK3sK
KwlpbnQgbnI7CisKKwlmb3IgKG5yID0gMDsgYWRkciAhPSBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpF
KQorCQlwYWdlc1tucisrXSA9IHBhZ2UrKzsKKworCXJldHVybiBucjsKK30KKworc3RhdGljIHZv
aWQgcHV0X2NvbXBvdW5kX2hlYWQoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCByZWZzKQoreworCS8q
IERvIGEgZ2V0X3BhZ2UoKSBmaXJzdCwgaW4gY2FzZSByZWZzID09IHBhZ2UtPl9yZWZjb3VudCAq
LworCWdldF9wYWdlKHBhZ2UpOworCXBhZ2VfcmVmX3N1YihwYWdlLCByZWZzKTsKKwlwdXRfcGFn
ZShwYWdlKTsKK30KKwogI2lmZGVmIENPTkZJR19BUkNIX0hBU19IVUdFUEQKIHN0YXRpYyB1bnNp
Z25lZCBsb25nIGh1Z2VwdGVfYWRkcl9lbmQodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBs
b25nIGVuZCwKIAkJCQkgICAgICB1bnNpZ25lZCBsb25nIHN6KQpAQCAtMTk5OCwzMiArMjAxNywy
MCBAQCBzdGF0aWMgaW50IGd1cF9odWdlcHRlKHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBsb25nIHN6
LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJLyogaHVnZXBhZ2VzIGFyZSBuZXZlciAic3BlY2lhbCIg
Ki8KIAlWTV9CVUdfT04oIXBmbl92YWxpZChwdGVfcGZuKHB0ZSkpKTsKIAotCXJlZnMgPSAwOwog
CWhlYWQgPSBwdGVfcGFnZShwdGUpOwotCiAJcGFnZSA9IGhlYWQgKyAoKGFkZHIgJiAoc3otMSkp
ID4+IFBBR0VfU0hJRlQpOwotCWRvIHsKLQkJVk1fQlVHX09OKGNvbXBvdW5kX2hlYWQocGFnZSkg
IT0gaGVhZCk7Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwotCQkoKm5yKSsrOwotCQlwYWdlKys7Ci0J
CXJlZnMrKzsKLQl9IHdoaWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOworCXJl
ZnMgPSBfX3JlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBlbmQsIHBhZ2VzICsgKm5yKTsKIAog
CWhlYWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQoaGVhZCwgcmVmcyk7Ci0JaWYgKCFoZWFkKSB7
Ci0JCSpuciAtPSByZWZzOworCWlmICghaGVhZCkKIAkJcmV0dXJuIDA7Ci0JfQogCiAJaWYgKHVu
bGlrZWx5KHB0ZV92YWwocHRlKSAhPSBwdGVfdmFsKCpwdGVwKSkpIHsKLQkJLyogQ291bGQgYmUg
b3B0aW1pemVkIGJldHRlciAqLwotCQkqbnIgLT0gcmVmczsKLQkJd2hpbGUgKHJlZnMtLSkKLQkJ
CXB1dF9wYWdlKGhlYWQpOworCQlwdXRfY29tcG91bmRfaGVhZChoZWFkLCByZWZzKTsKIAkJcmV0
dXJuIDA7CiAJfQogCisJKm5yICs9IHJlZnM7CiAJU2V0UGFnZVJlZmVyZW5jZWQoaGVhZCk7CiAJ
cmV0dXJuIDE7CiB9CkBAIC0yMDcxLDI4ICsyMDc4LDE5IEBAIHN0YXRpYyBpbnQgZ3VwX2h1Z2Vf
cG1kKHBtZF90IG9yaWcsIHBtZF90ICpwbWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCQkJCSAg
ICAgcGFnZXMsIG5yKTsKIAl9CiAKLQlyZWZzID0gMDsKIAlwYWdlID0gcG1kX3BhZ2Uob3JpZykg
KyAoKGFkZHIgJiB+UE1EX01BU0spID4+IFBBR0VfU0hJRlQpOwotCWRvIHsKLQkJcGFnZXNbKm5y
XSA9IHBhZ2U7Ci0JCSgqbnIpKys7Ci0JCXBhZ2UrKzsKLQkJcmVmcysrOwotCX0gd2hpbGUgKGFk
ZHIgKz0gUEFHRV9TSVpFLCBhZGRyICE9IGVuZCk7CisJcmVmcyA9IF9fcmVjb3JkX3N1YnBhZ2Vz
KHBhZ2UsIGFkZHIsIGVuZCwgcGFnZXMgKyAqbnIpOwogCiAJaGVhZCA9IHRyeV9nZXRfY29tcG91
bmRfaGVhZChwbWRfcGFnZShvcmlnKSwgcmVmcyk7Ci0JaWYgKCFoZWFkKSB7Ci0JCSpuciAtPSBy
ZWZzOworCWlmICghaGVhZCkKIAkJcmV0dXJuIDA7Ci0JfQogCiAJaWYgKHVubGlrZWx5KHBtZF92
YWwob3JpZykgIT0gcG1kX3ZhbCgqcG1kcCkpKSB7Ci0JCSpuciAtPSByZWZzOwotCQl3aGlsZSAo
cmVmcy0tKQotCQkJcHV0X3BhZ2UoaGVhZCk7CisJCXB1dF9jb21wb3VuZF9oZWFkKGhlYWQsIHJl
ZnMpOwogCQlyZXR1cm4gMDsKIAl9CiAKKwkqbnIgKz0gcmVmczsKIAlTZXRQYWdlUmVmZXJlbmNl
ZChoZWFkKTsKIAlyZXR1cm4gMTsKIH0KQEAgLTIxMTQsMjggKzIxMTIsMTkgQEAgc3RhdGljIGlu
dCBndXBfaHVnZV9wdWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRk
ciwKIAkJCQkJICAgICBwYWdlcywgbnIpOwogCX0KIAotCXJlZnMgPSAwOwogCXBhZ2UgPSBwdWRf
cGFnZShvcmlnKSArICgoYWRkciAmIH5QVURfTUFTSykgPj4gUEFHRV9TSElGVCk7Ci0JZG8gewot
CQlwYWdlc1sqbnJdID0gcGFnZTsKLQkJKCpucikrKzsKLQkJcGFnZSsrOwotCQlyZWZzKys7Ci0J
fSB3aGlsZSAoYWRkciArPSBQQUdFX1NJWkUsIGFkZHIgIT0gZW5kKTsKKwlyZWZzID0gX19yZWNv
cmRfc3VicGFnZXMocGFnZSwgYWRkciwgZW5kLCBwYWdlcyArICpucik7CiAKIAloZWFkID0gdHJ5
X2dldF9jb21wb3VuZF9oZWFkKHB1ZF9wYWdlKG9yaWcpLCByZWZzKTsKLQlpZiAoIWhlYWQpIHsK
LQkJKm5yIC09IHJlZnM7CisJaWYgKCFoZWFkKQogCQlyZXR1cm4gMDsKLQl9CiAKIAlpZiAodW5s
aWtlbHkocHVkX3ZhbChvcmlnKSAhPSBwdWRfdmFsKCpwdWRwKSkpIHsKLQkJKm5yIC09IHJlZnM7
Ci0JCXdoaWxlIChyZWZzLS0pCi0JCQlwdXRfcGFnZShoZWFkKTsKKwkJcHV0X2NvbXBvdW5kX2hl
YWQoaGVhZCwgcmVmcyk7CiAJCXJldHVybiAwOwogCX0KIAorCSpuciArPSByZWZzOwogCVNldFBh
Z2VSZWZlcmVuY2VkKGhlYWQpOwogCXJldHVybiAxOwogfQpAQCAtMjE1MSwyOCArMjE0MCwyMCBA
QCBzdGF0aWMgaW50IGd1cF9odWdlX3BnZChwZ2RfdCBvcmlnLCBwZ2RfdCAqcGdkcCwgdW5zaWdu
ZWQgbG9uZyBhZGRyLAogCQlyZXR1cm4gMDsKIAogCUJVSUxEX0JVR19PTihwZ2RfZGV2bWFwKG9y
aWcpKTsKLQlyZWZzID0gMDsKKwogCXBhZ2UgPSBwZ2RfcGFnZShvcmlnKSArICgoYWRkciAmIH5Q
R0RJUl9NQVNLKSA+PiBQQUdFX1NISUZUKTsKLQlkbyB7Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwot
CQkoKm5yKSsrOwotCQlwYWdlKys7Ci0JCXJlZnMrKzsKLQl9IHdoaWxlIChhZGRyICs9IFBBR0Vf
U0laRSwgYWRkciAhPSBlbmQpOworCXJlZnMgPSBfX3JlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRy
LCBlbmQsIHBhZ2VzICsgKm5yKTsKIAogCWhlYWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQocGdk
X3BhZ2Uob3JpZyksIHJlZnMpOwotCWlmICghaGVhZCkgewotCQkqbnIgLT0gcmVmczsKKwlpZiAo
IWhlYWQpCiAJCXJldHVybiAwOwotCX0KIAogCWlmICh1bmxpa2VseShwZ2RfdmFsKG9yaWcpICE9
IHBnZF92YWwoKnBnZHApKSkgewotCQkqbnIgLT0gcmVmczsKLQkJd2hpbGUgKHJlZnMtLSkKLQkJ
CXB1dF9wYWdlKGhlYWQpOworCQlwdXRfY29tcG91bmRfaGVhZChoZWFkLCByZWZzKTsKIAkJcmV0
dXJuIDA7CiAJfQogCisJKm5yICs9IHJlZnM7CiAJU2V0UGFnZVJlZmVyZW5jZWQoaGVhZCk7CiAJ
cmV0dXJuIDE7CiB9Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
