Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEFF133606
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 23:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED956E846;
	Tue,  7 Jan 2020 22:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473886E14B
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 22:46:01 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1509f80001>; Tue, 07 Jan 2020 14:45:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 07 Jan 2020 14:46:00 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 07 Jan 2020 14:46:00 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 22:46:00 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 22:46:00 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e150a270005>; Tue, 07 Jan 2020 14:45:59 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v12 01/22] mm/gup: factor out duplicate code from four routines
Date: Tue, 7 Jan 2020 14:45:37 -0800
Message-ID: <20200107224558.2362728-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107224558.2362728-1-jhubbard@nvidia.com>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578437112; bh=3UN+pZEMmKNfRZpugUWk2xqc0GntLXSHLik6fdzsQds=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=rh11n4oaBxWFqT8lK+qes4B5xBWDrco6QyD2M2yDm+QCE+vBQ16klE+qS3zQfGzXq
 +qKyTBawgNO5qGQ7ZIXXKfnm4o4JYFvrI9UhRPq3mm7KLBpYIbTL8lzOpAFMxs5WZu
 gONM+uwb608m3ELiQ8GQLAxmAkxyvlQggWH8XGBLcI1kYFai16CTU1o7a5A084zOg3
 rrnPIrSCakAKg5jxbHBxvOTGHf5ZZi16qF4+V2nMym+rgt0MPHjAcqTlB2OnPTyKBP
 MQ1luy1XuSDr1oKu91qrUiCF1gb/vfw5L46WA/jsyc34Ll0oadvtnbj9JQWBIrH/6x
 G98kFBFiMKA2g==
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
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
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
dmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpDYzogS2lyaWxsIEEuIFNodXRlbW92
IDxraXJpbGxAc2h1dGVtb3YubmFtZT4KQ2M6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNv
bT4KQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpDYzogQW5lZXNoIEt1bWFyIEsu
ViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFy
ZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXAuYyB8IDk1ICsrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNDAgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vZ3Vw
LmMgYi9tbS9ndXAuYwppbmRleCA3NjQ2YmY5OTNiMjUuLmQ1NmM2ZDZiODVkMyAxMDA2NDQKLS0t
IGEvbW0vZ3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAgLTE5NzgsNiArMTk3OCwyOSBAQCBzdGF0aWMg
aW50IF9fZ3VwX2RldmljZV9odWdlX3B1ZChwdWRfdCBwdWQsIHB1ZF90ICpwdWRwLCB1bnNpZ25l
ZCBsb25nIGFkZHIsCiB9CiAjZW5kaWYKIAorc3RhdGljIGludCByZWNvcmRfc3VicGFnZXMoc3Ry
dWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGxvbmcgYWRkciwKKwkJCSAgIHVuc2lnbmVkIGxvbmcg
ZW5kLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQoreworCWludCBucjsKKworCWZvciAobnIgPSAwOyBh
ZGRyICE9IGVuZDsgYWRkciArPSBQQUdFX1NJWkUpCisJCXBhZ2VzW25yKytdID0gcGFnZSsrOwor
CisJcmV0dXJuIG5yOworfQorCitzdGF0aWMgdm9pZCBwdXRfY29tcG91bmRfaGVhZChzdHJ1Y3Qg
cGFnZSAqcGFnZSwgaW50IHJlZnMpCit7CisJVk1fQlVHX09OX1BBR0UocGFnZV9yZWZfY291bnQo
cGFnZSkgPCByZWZzLCBwYWdlKTsKKwkvKgorCSAqIENhbGxpbmcgcHV0X3BhZ2UoKSBmb3IgZWFj
aCByZWYgaXMgdW5uZWNlc3NhcmlseSBzbG93LiBPbmx5IHRoZSBsYXN0CisJICogcmVmIG5lZWRz
IGEgcHV0X3BhZ2UoKS4KKwkgKi8KKwlpZiAocmVmcyA+IDEpCisJCXBhZ2VfcmVmX3N1YihwYWdl
LCByZWZzIC0gMSk7CisJcHV0X3BhZ2UocGFnZSk7Cit9CisKICNpZmRlZiBDT05GSUdfQVJDSF9I
QVNfSFVHRVBECiBzdGF0aWMgdW5zaWduZWQgbG9uZyBodWdlcHRlX2FkZHJfZW5kKHVuc2lnbmVk
IGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBlbmQsCiAJCQkJICAgICAgdW5zaWduZWQgbG9uZyBz
eikKQEAgLTIwMDcsMzIgKzIwMzAsMjAgQEAgc3RhdGljIGludCBndXBfaHVnZXB0ZShwdGVfdCAq
cHRlcCwgdW5zaWduZWQgbG9uZyBzeiwgdW5zaWduZWQgbG9uZyBhZGRyLAogCS8qIGh1Z2VwYWdl
cyBhcmUgbmV2ZXIgInNwZWNpYWwiICovCiAJVk1fQlVHX09OKCFwZm5fdmFsaWQocHRlX3Bmbihw
dGUpKSk7CiAKLQlyZWZzID0gMDsKIAloZWFkID0gcHRlX3BhZ2UocHRlKTsKLQogCXBhZ2UgPSBo
ZWFkICsgKChhZGRyICYgKHN6LTEpKSA+PiBQQUdFX1NISUZUKTsKLQlkbyB7Ci0JCVZNX0JVR19P
Tihjb21wb3VuZF9oZWFkKHBhZ2UpICE9IGhlYWQpOwotCQlwYWdlc1sqbnJdID0gcGFnZTsKLQkJ
KCpucikrKzsKLQkJcGFnZSsrOwotCQlyZWZzKys7Ci0JfSB3aGlsZSAoYWRkciArPSBQQUdFX1NJ
WkUsIGFkZHIgIT0gZW5kKTsKKwlyZWZzID0gcmVjb3JkX3N1YnBhZ2VzKHBhZ2UsIGFkZHIsIGVu
ZCwgcGFnZXMgKyAqbnIpOwogCiAJaGVhZCA9IHRyeV9nZXRfY29tcG91bmRfaGVhZChoZWFkLCBy
ZWZzKTsKLQlpZiAoIWhlYWQpIHsKLQkJKm5yIC09IHJlZnM7CisJaWYgKCFoZWFkKQogCQlyZXR1
cm4gMDsKLQl9CiAKIAlpZiAodW5saWtlbHkocHRlX3ZhbChwdGUpICE9IHB0ZV92YWwoKnB0ZXAp
KSkgewotCQkvKiBDb3VsZCBiZSBvcHRpbWl6ZWQgYmV0dGVyICovCi0JCSpuciAtPSByZWZzOwot
CQl3aGlsZSAocmVmcy0tKQotCQkJcHV0X3BhZ2UoaGVhZCk7CisJCXB1dF9jb21wb3VuZF9oZWFk
KGhlYWQsIHJlZnMpOwogCQlyZXR1cm4gMDsKIAl9CiAKKwkqbnIgKz0gcmVmczsKIAlTZXRQYWdl
UmVmZXJlbmNlZChoZWFkKTsKIAlyZXR1cm4gMTsKIH0KQEAgLTIwNzksMjggKzIwOTAsMTkgQEAg
c3RhdGljIGludCBndXBfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1kX3QgKnBtZHAsIHVuc2lnbmVk
IGxvbmcgYWRkciwKIAkJcmV0dXJuIF9fZ3VwX2RldmljZV9odWdlX3BtZChvcmlnLCBwbWRwLCBh
ZGRyLCBlbmQsIHBhZ2VzLCBucik7CiAJfQogCi0JcmVmcyA9IDA7CiAJcGFnZSA9IHBtZF9wYWdl
KG9yaWcpICsgKChhZGRyICYgflBNRF9NQVNLKSA+PiBQQUdFX1NISUZUKTsKLQlkbyB7Ci0JCXBh
Z2VzWypucl0gPSBwYWdlOwotCQkoKm5yKSsrOwotCQlwYWdlKys7Ci0JCXJlZnMrKzsKLQl9IHdo
aWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOworCXJlZnMgPSByZWNvcmRfc3Vi
cGFnZXMocGFnZSwgYWRkciwgZW5kLCBwYWdlcyArICpucik7CiAKIAloZWFkID0gdHJ5X2dldF9j
b21wb3VuZF9oZWFkKHBtZF9wYWdlKG9yaWcpLCByZWZzKTsKLQlpZiAoIWhlYWQpIHsKLQkJKm5y
IC09IHJlZnM7CisJaWYgKCFoZWFkKQogCQlyZXR1cm4gMDsKLQl9CiAKIAlpZiAodW5saWtlbHko
cG1kX3ZhbChvcmlnKSAhPSBwbWRfdmFsKCpwbWRwKSkpIHsKLQkJKm5yIC09IHJlZnM7Ci0JCXdo
aWxlIChyZWZzLS0pCi0JCQlwdXRfcGFnZShoZWFkKTsKKwkJcHV0X2NvbXBvdW5kX2hlYWQoaGVh
ZCwgcmVmcyk7CiAJCXJldHVybiAwOwogCX0KIAorCSpuciArPSByZWZzOwogCVNldFBhZ2VSZWZl
cmVuY2VkKGhlYWQpOwogCXJldHVybiAxOwogfQpAQCAtMjEyMCwyOCArMjEyMiwxOSBAQCBzdGF0
aWMgaW50IGd1cF9odWdlX3B1ZChwdWRfdCBvcmlnLCBwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9u
ZyBhZGRyLAogCQlyZXR1cm4gX19ndXBfZGV2aWNlX2h1Z2VfcHVkKG9yaWcsIHB1ZHAsIGFkZHIs
IGVuZCwgcGFnZXMsIG5yKTsKIAl9CiAKLQlyZWZzID0gMDsKIAlwYWdlID0gcHVkX3BhZ2Uob3Jp
ZykgKyAoKGFkZHIgJiB+UFVEX01BU0spID4+IFBBR0VfU0hJRlQpOwotCWRvIHsKLQkJcGFnZXNb
Km5yXSA9IHBhZ2U7Ci0JCSgqbnIpKys7Ci0JCXBhZ2UrKzsKLQkJcmVmcysrOwotCX0gd2hpbGUg
KGFkZHIgKz0gUEFHRV9TSVpFLCBhZGRyICE9IGVuZCk7CisJcmVmcyA9IHJlY29yZF9zdWJwYWdl
cyhwYWdlLCBhZGRyLCBlbmQsIHBhZ2VzICsgKm5yKTsKIAogCWhlYWQgPSB0cnlfZ2V0X2NvbXBv
dW5kX2hlYWQocHVkX3BhZ2Uob3JpZyksIHJlZnMpOwotCWlmICghaGVhZCkgewotCQkqbnIgLT0g
cmVmczsKKwlpZiAoIWhlYWQpCiAJCXJldHVybiAwOwotCX0KIAogCWlmICh1bmxpa2VseShwdWRf
dmFsKG9yaWcpICE9IHB1ZF92YWwoKnB1ZHApKSkgewotCQkqbnIgLT0gcmVmczsKLQkJd2hpbGUg
KHJlZnMtLSkKLQkJCXB1dF9wYWdlKGhlYWQpOworCQlwdXRfY29tcG91bmRfaGVhZChoZWFkLCBy
ZWZzKTsKIAkJcmV0dXJuIDA7CiAJfQogCisJKm5yICs9IHJlZnM7CiAJU2V0UGFnZVJlZmVyZW5j
ZWQoaGVhZCk7CiAJcmV0dXJuIDE7CiB9CkBAIC0yMTU3LDI4ICsyMTUwLDIwIEBAIHN0YXRpYyBp
bnQgZ3VwX2h1Z2VfcGdkKHBnZF90IG9yaWcsIHBnZF90ICpwZ2RwLCB1bnNpZ25lZCBsb25nIGFk
ZHIsCiAJCXJldHVybiAwOwogCiAJQlVJTERfQlVHX09OKHBnZF9kZXZtYXAob3JpZykpOwotCXJl
ZnMgPSAwOworCiAJcGFnZSA9IHBnZF9wYWdlKG9yaWcpICsgKChhZGRyICYgflBHRElSX01BU0sp
ID4+IFBBR0VfU0hJRlQpOwotCWRvIHsKLQkJcGFnZXNbKm5yXSA9IHBhZ2U7Ci0JCSgqbnIpKys7
Ci0JCXBhZ2UrKzsKLQkJcmVmcysrOwotCX0gd2hpbGUgKGFkZHIgKz0gUEFHRV9TSVpFLCBhZGRy
ICE9IGVuZCk7CisJcmVmcyA9IHJlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBlbmQsIHBhZ2Vz
ICsgKm5yKTsKIAogCWhlYWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQocGdkX3BhZ2Uob3JpZyks
IHJlZnMpOwotCWlmICghaGVhZCkgewotCQkqbnIgLT0gcmVmczsKKwlpZiAoIWhlYWQpCiAJCXJl
dHVybiAwOwotCX0KIAogCWlmICh1bmxpa2VseShwZ2RfdmFsKG9yaWcpICE9IHBnZF92YWwoKnBn
ZHApKSkgewotCQkqbnIgLT0gcmVmczsKLQkJd2hpbGUgKHJlZnMtLSkKLQkJCXB1dF9wYWdlKGhl
YWQpOworCQlwdXRfY29tcG91bmRfaGVhZChoZWFkLCByZWZzKTsKIAkJcmV0dXJuIDA7CiAJfQog
CisJKm5yICs9IHJlZnM7CiAJU2V0UGFnZVJlZmVyZW5jZWQoaGVhZCk7CiAJcmV0dXJuIDE7CiB9
Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
