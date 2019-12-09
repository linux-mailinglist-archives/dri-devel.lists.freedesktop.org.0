Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF46117A05
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35246E5C1;
	Mon,  9 Dec 2019 22:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEB66E5BF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:54:11 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed07e0000>; Mon, 09 Dec 2019 14:53:50 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:54:10 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 09 Dec 2019 14:54:10 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:54:10 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:54:09 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed0900004>; Mon, 09 Dec 2019 14:54:09 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 23/26] mm/gup: pass flags arg to __gup_device_* functions
Date: Mon, 9 Dec 2019 14:53:41 -0800
Message-ID: <20191209225344.99740-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932030; bh=dNc8I9IrRwotCy2X2kTQowUwCT96NL1uyznKPHnmhlk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=d20SYgLLTDWvCq8LolYuXHIY2QVLzd33JaOZwEtQaWLnBxfCNQH3Ntgv0fF+SRhrR
 oCXXamy5Ta3hBjRNETpxi8wRkc+kKIePE4g2qOD04Jxcab+UlkjaPV11N9BVl/kYtD
 XZoPHv2SDRGHS1vifhtPz7KhjCRmjuskxfdGiL6LDxvb2JM3zH+tP6S8R3wUKp37Fw
 A5BI8mUPisbQyg6tyCWOwJi7XAWrMj5ptUNhRHrXkmGOFs461fvR/FlQy/gAPqNBFD
 VWI3Wyf0laNB7KKwu3bApGfqgr17Y6cRQ5XWER/CKNB6DtNKCP0/QeaipWwtXPow+r
 GpaAoVGs9PEHA==
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
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBzdWJzZXF1ZW50IHBhdGNoIHJlcXVpcmVzIGFjY2VzcyB0byBndXAgZmxhZ3MsIHNvIHBhc3Mg
dGhlIGZsYWdzCmFyZ3VtZW50IHRocm91Z2ggdG8gdGhlIF9fZ3VwX2RldmljZV8qIGZ1bmN0aW9u
cy4KCkFsc28gcGxhY2F0ZSBjaGVja3BhdGNoLnBsIGJ5IHNob3J0ZW5pbmcgYSBuZWFyYnkgbGlu
ZS4KClRPRE86IENocmlzdG9waCBIZWxsd2lnIHJlcXVlc3RlZCBmb2xkaW5nIHRoaXMgaW50byB0
aGUgcGF0Y2ggdGhlIHVzZXMKdGhlIGd1cCBmbGFncyBhcmd1bWVudHMuCgpSZXZpZXdlZC1ieTog
SmFuIEthcmEgPGphY2tAc3VzZS5jej4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amds
aXNzZUByZWRoYXQuY29tPgpSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwu
Y29tPgpDYzogS2lyaWxsIEEuIFNodXRlbW92IDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0t
LQogbW0vZ3VwLmMgfCAyOCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0v
Z3VwLmMgYi9tbS9ndXAuYwppbmRleCA3M2FlZGNlZmE0YmQuLjY4N2Q0ODUwNmYwNCAxMDA2NDQK
LS0tIGEvbW0vZ3VwLmMKKysrIGIvbW0vZ3VwLmMKQEAgLTE5NTcsNyArMTk1Nyw4IEBAIHN0YXRp
YyBpbnQgZ3VwX3B0ZV9yYW5nZShwbWRfdCBwbWQsIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWdu
ZWQgbG9uZyBlbmQsCiAKICNpZiBkZWZpbmVkKENPTkZJR19BUkNIX0hBU19QVEVfREVWTUFQKSAm
JiBkZWZpbmVkKENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSkKIHN0YXRpYyBpbnQgX19ndXBf
ZGV2aWNlX2h1Z2UodW5zaWduZWQgbG9uZyBwZm4sIHVuc2lnbmVkIGxvbmcgYWRkciwKLQkJdW5z
aWduZWQgbG9uZyBlbmQsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCisJCQkgICAgIHVu
c2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxhZ3MsCisJCQkgICAgIHN0cnVjdCBwYWdl
ICoqcGFnZXMsIGludCAqbnIpCiB7CiAJaW50IG5yX3N0YXJ0ID0gKm5yOwogCXN0cnVjdCBkZXZf
cGFnZW1hcCAqcGdtYXAgPSBOVUxMOwpAQCAtMTk4MywxMyArMTk4NCwxNCBAQCBzdGF0aWMgaW50
IF9fZ3VwX2RldmljZV9odWdlKHVuc2lnbmVkIGxvbmcgcGZuLCB1bnNpZ25lZCBsb25nIGFkZHIs
CiB9CiAKIHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2VfcG1kKHBtZF90IG9yaWcsIHBtZF90
ICpwbWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCi0JCXVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1Y3Qg
cGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQorCQkJCSB1bnNpZ25lZCBsb25nIGVuZCwgdW5zaWduZWQg
aW50IGZsYWdzLAorCQkJCSBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQogewogCXVuc2ln
bmVkIGxvbmcgZmF1bHRfcGZuOwogCWludCBucl9zdGFydCA9ICpucjsKIAogCWZhdWx0X3BmbiA9
IHBtZF9wZm4ob3JpZykgKyAoKGFkZHIgJiB+UE1EX01BU0spID4+IFBBR0VfU0hJRlQpOwotCWlm
ICghX19ndXBfZGV2aWNlX2h1Z2UoZmF1bHRfcGZuLCBhZGRyLCBlbmQsIHBhZ2VzLCBucikpCisJ
aWYgKCFfX2d1cF9kZXZpY2VfaHVnZShmYXVsdF9wZm4sIGFkZHIsIGVuZCwgZmxhZ3MsIHBhZ2Vz
LCBucikpCiAJCXJldHVybiAwOwogCiAJaWYgKHVubGlrZWx5KHBtZF92YWwob3JpZykgIT0gcG1k
X3ZhbCgqcG1kcCkpKSB7CkBAIC0yMDAwLDEzICsyMDAyLDE0IEBAIHN0YXRpYyBpbnQgX19ndXBf
ZGV2aWNlX2h1Z2VfcG1kKHBtZF90IG9yaWcsIHBtZF90ICpwbWRwLCB1bnNpZ25lZCBsb25nIGFk
ZHIsCiB9CiAKIHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2VfcHVkKHB1ZF90IG9yaWcsIHB1
ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCi0JCXVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1
Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQorCQkJCSB1bnNpZ25lZCBsb25nIGVuZCwgdW5zaWdu
ZWQgaW50IGZsYWdzLAorCQkJCSBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQogewogCXVu
c2lnbmVkIGxvbmcgZmF1bHRfcGZuOwogCWludCBucl9zdGFydCA9ICpucjsKIAogCWZhdWx0X3Bm
biA9IHB1ZF9wZm4ob3JpZykgKyAoKGFkZHIgJiB+UFVEX01BU0spID4+IFBBR0VfU0hJRlQpOwot
CWlmICghX19ndXBfZGV2aWNlX2h1Z2UoZmF1bHRfcGZuLCBhZGRyLCBlbmQsIHBhZ2VzLCBucikp
CisJaWYgKCFfX2d1cF9kZXZpY2VfaHVnZShmYXVsdF9wZm4sIGFkZHIsIGVuZCwgZmxhZ3MsIHBh
Z2VzLCBucikpCiAJCXJldHVybiAwOwogCiAJaWYgKHVubGlrZWx5KHB1ZF92YWwob3JpZykgIT0g
cHVkX3ZhbCgqcHVkcCkpKSB7CkBAIC0yMDE3LDE0ICsyMDIwLDE2IEBAIHN0YXRpYyBpbnQgX19n
dXBfZGV2aWNlX2h1Z2VfcHVkKHB1ZF90IG9yaWcsIHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25n
IGFkZHIsCiB9CiAjZWxzZQogc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wbWQocG1kX3Qg
b3JpZywgcG1kX3QgKnBtZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKLQkJdW5zaWduZWQgbG9uZyBl
bmQsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCisJCQkJIHVuc2lnbmVkIGxvbmcgZW5k
LCB1bnNpZ25lZCBpbnQgZmxhZ3MsCisJCQkJIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIp
CiB7CiAJQlVJTERfQlVHKCk7CiAJcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgX19ndXBfZGV2
aWNlX2h1Z2VfcHVkKHB1ZF90IHB1ZCwgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwK
LQkJdW5zaWduZWQgbG9uZyBlbmQsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCisJCQkJ
IHVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxhZ3MsCisJCQkJIHN0cnVjdCBwYWdl
ICoqcGFnZXMsIGludCAqbnIpCiB7CiAJQlVJTERfQlVHKCk7CiAJcmV0dXJuIDA7CkBAIC0yMTM2
LDcgKzIxNDEsOCBAQCBzdGF0aWMgaW50IGd1cF9odWdlX3BtZChwbWRfdCBvcmlnLCBwbWRfdCAq
cG1kcCwgdW5zaWduZWQgbG9uZyBhZGRyLAogCWlmIChwbWRfZGV2bWFwKG9yaWcpKSB7CiAJCWlm
ICh1bmxpa2VseShmbGFncyAmIEZPTExfTE9OR1RFUk0pKQogCQkJcmV0dXJuIDA7Ci0JCXJldHVy
biBfX2d1cF9kZXZpY2VfaHVnZV9wbWQob3JpZywgcG1kcCwgYWRkciwgZW5kLCBwYWdlcywgbnIp
OworCQlyZXR1cm4gX19ndXBfZGV2aWNlX2h1Z2VfcG1kKG9yaWcsIHBtZHAsIGFkZHIsIGVuZCwg
ZmxhZ3MsCisJCQkJCSAgICAgcGFnZXMsIG5yKTsKIAl9CiAKIAlwYWdlID0gcG1kX3BhZ2Uob3Jp
ZykgKyAoKGFkZHIgJiB+UE1EX01BU0spID4+IFBBR0VfU0hJRlQpOwpAQCAtMjE1Nyw3ICsyMTYz
LDggQEAgc3RhdGljIGludCBndXBfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1kX3QgKnBtZHAsIHVu
c2lnbmVkIGxvbmcgYWRkciwKIH0KIAogc3RhdGljIGludCBndXBfaHVnZV9wdWQocHVkX3Qgb3Jp
ZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKLQkJdW5zaWduZWQgbG9uZyBlbmQs
IHVuc2lnbmVkIGludCBmbGFncywgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKKwkJCXVu
c2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxhZ3MsCisJCQlzdHJ1Y3QgcGFnZSAqKnBh
Z2VzLCBpbnQgKm5yKQogewogCXN0cnVjdCBwYWdlICpoZWFkLCAqcGFnZTsKIAlpbnQgcmVmczsK
QEAgLTIxNjgsNyArMjE3NSw4IEBAIHN0YXRpYyBpbnQgZ3VwX2h1Z2VfcHVkKHB1ZF90IG9yaWcs
IHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJaWYgKHB1ZF9kZXZtYXAob3JpZykp
IHsKIAkJaWYgKHVubGlrZWx5KGZsYWdzICYgRk9MTF9MT05HVEVSTSkpCiAJCQlyZXR1cm4gMDsK
LQkJcmV0dXJuIF9fZ3VwX2RldmljZV9odWdlX3B1ZChvcmlnLCBwdWRwLCBhZGRyLCBlbmQsIHBh
Z2VzLCBucik7CisJCXJldHVybiBfX2d1cF9kZXZpY2VfaHVnZV9wdWQob3JpZywgcHVkcCwgYWRk
ciwgZW5kLCBmbGFncywKKwkJCQkJICAgICBwYWdlcywgbnIpOwogCX0KIAogCXBhZ2UgPSBwdWRf
cGFnZShvcmlnKSArICgoYWRkciAmIH5QVURfTUFTSykgPj4gUEFHRV9TSElGVCk7Ci0tIAoyLjI0
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
