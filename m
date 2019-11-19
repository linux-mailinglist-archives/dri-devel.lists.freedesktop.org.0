Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E30101BB5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697A56EC89;
	Tue, 19 Nov 2019 08:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DAC6EC9D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:16:50 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3a4f30000>; Tue, 19 Nov 2019 00:16:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:16:50 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 19 Nov 2019 00:16:50 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 08:16:49 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 08:16:49 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:16:48 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd3a4ee0001>; Tue, 19 Nov 2019 00:16:48 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 02/24] mm/gup: factor out duplicate code from four routines
Date: Tue, 19 Nov 2019 00:16:21 -0800
Message-ID: <20191119081643.1866232-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119081643.1866232-1-jhubbard@nvidia.com>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574151411; bh=AJB77Rx4Grn5/pvcGhctYUQNnGXjamViAFqO5obaUFI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=Vx7w9+w5S5IUfp7nCs/UJOdSWVY5setoLJZak2At2HGEH2ONAyQf5wb+nmNuafuPC
 WB2VoDSJ9EQTMVzuGG2L/C3bSk2E8hZXpxVaAdzz6j8maU3FMM3no5OB1WGGZeHF7G
 2+/xea7/u2snZu75gMaxLtWRyo1msaoLanwqAN+Od+u+kz3ovQtZA3Oc5fx5vw/nik
 N0Z/0DA3UxWfNkr5DLRHBBCqDcTu29QswUvgTRHP9Q4Q1zmWUjPIHx0Mm7Ccv3MpZY
 L/Z0LCMxUNNE/8myCb5zA1RwJpzwgblH6m6fK8Scu0Hc4MDGaplBwPIm3RXFAC6GYg
 BAq5hA7mWtD5g==
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
Ynk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXAuYyB8IDkx
ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwppbmRleCA4NWNhZjc2YjMwMTIuLmYzYzdkNjYy
NTgxNyAxMDA2NDQKLS0tIGEvbW0vZ3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAgLTE5NjksNiArMTk2
OSwyNSBAQCBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3B1ZChwdWRfdCBwdWQsIHB1ZF90
ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCiB9CiAjZW5kaWYKIAorc3RhdGljIGludCBfX3Jl
Y29yZF9zdWJwYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9uZyBhZGRyLAorCQkJ
ICAgICB1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcykKK3sKKwlpbnQgbnI7
CisKKwlmb3IgKG5yID0gMDsgYWRkciAhPSBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpFKQorCQlwYWdl
c1tucisrXSA9IHBhZ2UrKzsKKworCXJldHVybiBucjsKK30KKworc3RhdGljIHZvaWQgcHV0X2Nv
bXBvdW5kX2hlYWQoc3RydWN0IHBhZ2UgKnBhZ2UsIGludCByZWZzKQoreworCS8qIERvIGEgZ2V0
X3BhZ2UoKSBmaXJzdCwgaW4gY2FzZSByZWZzID09IHBhZ2UtPl9yZWZjb3VudCAqLworCWdldF9w
YWdlKHBhZ2UpOworCXBhZ2VfcmVmX3N1YihwYWdlLCByZWZzKTsKKwlwdXRfcGFnZShwYWdlKTsK
K30KKwogI2lmZGVmIENPTkZJR19BUkNIX0hBU19IVUdFUEQKIHN0YXRpYyB1bnNpZ25lZCBsb25n
IGh1Z2VwdGVfYWRkcl9lbmQodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwK
IAkJCQkgICAgICB1bnNpZ25lZCBsb25nIHN6KQpAQCAtMTk5OCwzMiArMjAxNywyMCBAQCBzdGF0
aWMgaW50IGd1cF9odWdlcHRlKHB0ZV90ICpwdGVwLCB1bnNpZ25lZCBsb25nIHN6LCB1bnNpZ25l
ZCBsb25nIGFkZHIsCiAJLyogaHVnZXBhZ2VzIGFyZSBuZXZlciAic3BlY2lhbCIgKi8KIAlWTV9C
VUdfT04oIXBmbl92YWxpZChwdGVfcGZuKHB0ZSkpKTsKIAotCXJlZnMgPSAwOwogCWhlYWQgPSBw
dGVfcGFnZShwdGUpOwotCiAJcGFnZSA9IGhlYWQgKyAoKGFkZHIgJiAoc3otMSkpID4+IFBBR0Vf
U0hJRlQpOwotCWRvIHsKLQkJVk1fQlVHX09OKGNvbXBvdW5kX2hlYWQocGFnZSkgIT0gaGVhZCk7
Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwotCQkoKm5yKSsrOwotCQlwYWdlKys7Ci0JCXJlZnMrKzsK
LQl9IHdoaWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOworCXJlZnMgPSBfX3Jl
Y29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBlbmQsIHBhZ2VzICsgKm5yKTsKIAogCWhlYWQgPSB0
cnlfZ2V0X2NvbXBvdW5kX2hlYWQoaGVhZCwgcmVmcyk7Ci0JaWYgKCFoZWFkKSB7Ci0JCSpuciAt
PSByZWZzOworCWlmICghaGVhZCkKIAkJcmV0dXJuIDA7Ci0JfQogCiAJaWYgKHVubGlrZWx5KHB0
ZV92YWwocHRlKSAhPSBwdGVfdmFsKCpwdGVwKSkpIHsKLQkJLyogQ291bGQgYmUgb3B0aW1pemVk
IGJldHRlciAqLwotCQkqbnIgLT0gcmVmczsKLQkJd2hpbGUgKHJlZnMtLSkKLQkJCXB1dF9wYWdl
KGhlYWQpOworCQlwdXRfY29tcG91bmRfaGVhZChoZWFkLCByZWZzKTsKIAkJcmV0dXJuIDA7CiAJ
fQogCisJKm5yICs9IHJlZnM7CiAJU2V0UGFnZVJlZmVyZW5jZWQoaGVhZCk7CiAJcmV0dXJuIDE7
CiB9CkBAIC0yMDcxLDI4ICsyMDc4LDE5IEBAIHN0YXRpYyBpbnQgZ3VwX2h1Z2VfcG1kKHBtZF90
IG9yaWcsIHBtZF90ICpwbWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCQkJCSAgICAgcGFnZXMs
IG5yKTsKIAl9CiAKLQlyZWZzID0gMDsKIAlwYWdlID0gcG1kX3BhZ2Uob3JpZykgKyAoKGFkZHIg
JiB+UE1EX01BU0spID4+IFBBR0VfU0hJRlQpOwotCWRvIHsKLQkJcGFnZXNbKm5yXSA9IHBhZ2U7
Ci0JCSgqbnIpKys7Ci0JCXBhZ2UrKzsKLQkJcmVmcysrOwotCX0gd2hpbGUgKGFkZHIgKz0gUEFH
RV9TSVpFLCBhZGRyICE9IGVuZCk7CisJcmVmcyA9IF9fcmVjb3JkX3N1YnBhZ2VzKHBhZ2UsIGFk
ZHIsIGVuZCwgcGFnZXMgKyAqbnIpOwogCiAJaGVhZCA9IHRyeV9nZXRfY29tcG91bmRfaGVhZChw
bWRfcGFnZShvcmlnKSwgcmVmcyk7Ci0JaWYgKCFoZWFkKSB7Ci0JCSpuciAtPSByZWZzOworCWlm
ICghaGVhZCkKIAkJcmV0dXJuIDA7Ci0JfQogCiAJaWYgKHVubGlrZWx5KHBtZF92YWwob3JpZykg
IT0gcG1kX3ZhbCgqcG1kcCkpKSB7Ci0JCSpuciAtPSByZWZzOwotCQl3aGlsZSAocmVmcy0tKQot
CQkJcHV0X3BhZ2UoaGVhZCk7CisJCXB1dF9jb21wb3VuZF9oZWFkKGhlYWQsIHJlZnMpOwogCQly
ZXR1cm4gMDsKIAl9CiAKKwkqbnIgKz0gcmVmczsKIAlTZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsK
IAlyZXR1cm4gMTsKIH0KQEAgLTIxMTQsMjggKzIxMTIsMTkgQEAgc3RhdGljIGludCBndXBfaHVn
ZV9wdWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJCQkJ
ICAgICBwYWdlcywgbnIpOwogCX0KIAotCXJlZnMgPSAwOwogCXBhZ2UgPSBwdWRfcGFnZShvcmln
KSArICgoYWRkciAmIH5QVURfTUFTSykgPj4gUEFHRV9TSElGVCk7Ci0JZG8gewotCQlwYWdlc1sq
bnJdID0gcGFnZTsKLQkJKCpucikrKzsKLQkJcGFnZSsrOwotCQlyZWZzKys7Ci0JfSB3aGlsZSAo
YWRkciArPSBQQUdFX1NJWkUsIGFkZHIgIT0gZW5kKTsKKwlyZWZzID0gX19yZWNvcmRfc3VicGFn
ZXMocGFnZSwgYWRkciwgZW5kLCBwYWdlcyArICpucik7CiAKIAloZWFkID0gdHJ5X2dldF9jb21w
b3VuZF9oZWFkKHB1ZF9wYWdlKG9yaWcpLCByZWZzKTsKLQlpZiAoIWhlYWQpIHsKLQkJKm5yIC09
IHJlZnM7CisJaWYgKCFoZWFkKQogCQlyZXR1cm4gMDsKLQl9CiAKIAlpZiAodW5saWtlbHkocHVk
X3ZhbChvcmlnKSAhPSBwdWRfdmFsKCpwdWRwKSkpIHsKLQkJKm5yIC09IHJlZnM7Ci0JCXdoaWxl
IChyZWZzLS0pCi0JCQlwdXRfcGFnZShoZWFkKTsKKwkJcHV0X2NvbXBvdW5kX2hlYWQoaGVhZCwg
cmVmcyk7CiAJCXJldHVybiAwOwogCX0KIAorCSpuciArPSByZWZzOwogCVNldFBhZ2VSZWZlcmVu
Y2VkKGhlYWQpOwogCXJldHVybiAxOwogfQpAQCAtMjE1MSwyOCArMjE0MCwyMCBAQCBzdGF0aWMg
aW50IGd1cF9odWdlX3BnZChwZ2RfdCBvcmlnLCBwZ2RfdCAqcGdkcCwgdW5zaWduZWQgbG9uZyBh
ZGRyLAogCQlyZXR1cm4gMDsKIAogCUJVSUxEX0JVR19PTihwZ2RfZGV2bWFwKG9yaWcpKTsKLQly
ZWZzID0gMDsKKwogCXBhZ2UgPSBwZ2RfcGFnZShvcmlnKSArICgoYWRkciAmIH5QR0RJUl9NQVNL
KSA+PiBQQUdFX1NISUZUKTsKLQlkbyB7Ci0JCXBhZ2VzWypucl0gPSBwYWdlOwotCQkoKm5yKSsr
OwotCQlwYWdlKys7Ci0JCXJlZnMrKzsKLQl9IHdoaWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRk
ciAhPSBlbmQpOworCXJlZnMgPSBfX3JlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBlbmQsIHBh
Z2VzICsgKm5yKTsKIAogCWhlYWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQocGdkX3BhZ2Uob3Jp
ZyksIHJlZnMpOwotCWlmICghaGVhZCkgewotCQkqbnIgLT0gcmVmczsKKwlpZiAoIWhlYWQpCiAJ
CXJldHVybiAwOwotCX0KIAogCWlmICh1bmxpa2VseShwZ2RfdmFsKG9yaWcpICE9IHBnZF92YWwo
KnBnZHApKSkgewotCQkqbnIgLT0gcmVmczsKLQkJd2hpbGUgKHJlZnMtLSkKLQkJCXB1dF9wYWdl
KGhlYWQpOworCQlwdXRfY29tcG91bmRfaGVhZChoZWFkLCByZWZzKTsKIAkJcmV0dXJuIDA7CiAJ
fQogCisJKm5yICs9IHJlZnM7CiAJU2V0UGFnZVJlZmVyZW5jZWQoaGVhZCk7CiAJcmV0dXJuIDE7
CiB9Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
