Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F7EFD490
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 06:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACB06E0D0;
	Fri, 15 Nov 2019 05:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E370A6E061
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 05:53:44 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce3d670000>; Thu, 14 Nov 2019 21:53:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 14 Nov 2019 21:53:44 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 14 Nov 2019 21:53:44 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:43 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 15 Nov 2019 05:53:43 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dce3d670001>; Thu, 14 Nov 2019 21:53:43 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 01/24] mm/gup: pass flags arg to __gup_device_* functions
Date: Thu, 14 Nov 2019 21:53:17 -0800
Message-ID: <20191115055340.1825745-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115055340.1825745-1-jhubbard@nvidia.com>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573797224; bh=shQdk3aSV65MVp9nCFIR9V5hifAIbJq1aZuVoQR8zJ0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=Vf3URXCBhJ0LWwHJTcm52WVotKdwRX+fknMcBrSG9k9AJxxUhN4wPoYtvL0rv0zz0
 qbduFsMF4ZFH6miC1kaynU/PrKYo4BtWIA/ZvENIC1Gpe4IoMeJtZfOjm9/Z6JLagQ
 vn3NYUI4U5tVPDOcTeijgB4+34WSSn3+imGks6gzw6odBbR8B0oqCrtPU8HmBWVQYj
 fyyd2pwWVoWnJQw5edg9QMnK85g5O8Xa/udpjC3YJAysMnGOdUGjR9e/DDV1oBbSIE
 jOIUGGOPL35CODf13FwjukgEvzT2UWdIxS8kelzmDzlSC6jbbyG50vbWHQgHl8o9MC
 sY4Z99AL8LcOw==
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

QSBzdWJzZXF1ZW50IHBhdGNoIHJlcXVpcmVzIGFjY2VzcyB0byBndXAgZmxhZ3MsIHNvCnBhc3Mg
dGhlIGZsYWdzIGFyZ3VtZW50IHRocm91Z2ggdG8gdGhlIF9fZ3VwX2RldmljZV8qCmZ1bmN0aW9u
cy4KCkFsc28gcGxhY2F0ZSBjaGVja3BhdGNoLnBsIGJ5IHNob3J0ZW5pbmcgYSBuZWFyYnkgbGlu
ZS4KClJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpSZXZpZXdlZC1ieTogSsOp
csO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2Vpbnkg
PGlyYS53ZWlueUBpbnRlbC5jb20+CkNjOiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbC5zaHV0
ZW1vdkBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJh
cmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXAuYyB8IDI4ICsrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jCmluZGV4IDhmMjM2YTMzNWFlOS4uODVj
YWY3NmIzMDEyIDEwMDY0NAotLS0gYS9tbS9ndXAuYworKysgYi9tbS9ndXAuYwpAQCAtMTg5MCw3
ICsxODkwLDggQEAgc3RhdGljIGludCBndXBfcHRlX3JhbmdlKHBtZF90IHBtZCwgdW5zaWduZWQg
bG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwKIAogI2lmIGRlZmluZWQoQ09ORklHX0FSQ0hf
SEFTX1BURV9ERVZNQVApICYmIGRlZmluZWQoQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFKQog
c3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZSh1bnNpZ25lZCBsb25nIHBmbiwgdW5zaWduZWQg
bG9uZyBhZGRyLAotCQl1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50
ICpucikKKwkJCSAgICAgdW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywKKwkJ
CSAgICAgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKIHsKIAlpbnQgbnJfc3RhcnQgPSAq
bnI7CiAJc3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCA9IE5VTEw7CkBAIC0xOTE2LDEzICsxOTE3
LDE0IEBAIHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2UodW5zaWduZWQgbG9uZyBwZm4sIHVu
c2lnbmVkIGxvbmcgYWRkciwKIH0KIAogc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wbWQo
cG1kX3Qgb3JpZywgcG1kX3QgKnBtZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKLQkJdW5zaWduZWQg
bG9uZyBlbmQsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCisJCQkJIHVuc2lnbmVkIGxv
bmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxhZ3MsCisJCQkJIHN0cnVjdCBwYWdlICoqcGFnZXMsIGlu
dCAqbnIpCiB7CiAJdW5zaWduZWQgbG9uZyBmYXVsdF9wZm47CiAJaW50IG5yX3N0YXJ0ID0gKm5y
OwogCiAJZmF1bHRfcGZuID0gcG1kX3BmbihvcmlnKSArICgoYWRkciAmIH5QTURfTUFTSykgPj4g
UEFHRV9TSElGVCk7Ci0JaWYgKCFfX2d1cF9kZXZpY2VfaHVnZShmYXVsdF9wZm4sIGFkZHIsIGVu
ZCwgcGFnZXMsIG5yKSkKKwlpZiAoIV9fZ3VwX2RldmljZV9odWdlKGZhdWx0X3BmbiwgYWRkciwg
ZW5kLCBmbGFncywgcGFnZXMsIG5yKSkKIAkJcmV0dXJuIDA7CiAKIAlpZiAodW5saWtlbHkocG1k
X3ZhbChvcmlnKSAhPSBwbWRfdmFsKCpwbWRwKSkpIHsKQEAgLTE5MzMsMTMgKzE5MzUsMTQgQEAg
c3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1kX3QgKnBtZHAs
IHVuc2lnbmVkIGxvbmcgYWRkciwKIH0KIAogc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9w
dWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKLQkJdW5zaWdu
ZWQgbG9uZyBlbmQsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCisJCQkJIHVuc2lnbmVk
IGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxhZ3MsCisJCQkJIHN0cnVjdCBwYWdlICoqcGFnZXMs
IGludCAqbnIpCiB7CiAJdW5zaWduZWQgbG9uZyBmYXVsdF9wZm47CiAJaW50IG5yX3N0YXJ0ID0g
Km5yOwogCiAJZmF1bHRfcGZuID0gcHVkX3BmbihvcmlnKSArICgoYWRkciAmIH5QVURfTUFTSykg
Pj4gUEFHRV9TSElGVCk7Ci0JaWYgKCFfX2d1cF9kZXZpY2VfaHVnZShmYXVsdF9wZm4sIGFkZHIs
IGVuZCwgcGFnZXMsIG5yKSkKKwlpZiAoIV9fZ3VwX2RldmljZV9odWdlKGZhdWx0X3BmbiwgYWRk
ciwgZW5kLCBmbGFncywgcGFnZXMsIG5yKSkKIAkJcmV0dXJuIDA7CiAKIAlpZiAodW5saWtlbHko
cHVkX3ZhbChvcmlnKSAhPSBwdWRfdmFsKCpwdWRwKSkpIHsKQEAgLTE5NTAsMTQgKzE5NTMsMTYg
QEAgc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wdWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1
ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKIH0KICNlbHNlCiBzdGF0aWMgaW50IF9fZ3VwX2Rldmlj
ZV9odWdlX3BtZChwbWRfdCBvcmlnLCBwbWRfdCAqcG1kcCwgdW5zaWduZWQgbG9uZyBhZGRyLAot
CQl1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKKwkJCQkg
dW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywKKwkJCQkgc3RydWN0IHBhZ2Ug
KipwYWdlcywgaW50ICpucikKIHsKIAlCVUlMRF9CVUcoKTsKIAlyZXR1cm4gMDsKIH0KIAogc3Rh
dGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wdWQocHVkX3QgcHVkLCBwdWRfdCAqcHVkcCwgdW5z
aWduZWQgbG9uZyBhZGRyLAotCQl1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdl
cywgaW50ICpucikKKwkJCQkgdW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywK
KwkJCQkgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKIHsKIAlCVUlMRF9CVUcoKTsKIAly
ZXR1cm4gMDsKQEAgLTIwNjIsNyArMjA2Nyw4IEBAIHN0YXRpYyBpbnQgZ3VwX2h1Z2VfcG1kKHBt
ZF90IG9yaWcsIHBtZF90ICpwbWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJaWYgKHBtZF9kZXZt
YXAob3JpZykpIHsKIAkJaWYgKHVubGlrZWx5KGZsYWdzICYgRk9MTF9MT05HVEVSTSkpCiAJCQly
ZXR1cm4gMDsKLQkJcmV0dXJuIF9fZ3VwX2RldmljZV9odWdlX3BtZChvcmlnLCBwbWRwLCBhZGRy
LCBlbmQsIHBhZ2VzLCBucik7CisJCXJldHVybiBfX2d1cF9kZXZpY2VfaHVnZV9wbWQob3JpZywg
cG1kcCwgYWRkciwgZW5kLCBmbGFncywKKwkJCQkJICAgICBwYWdlcywgbnIpOwogCX0KIAogCXJl
ZnMgPSAwOwpAQCAtMjA5Miw3ICsyMDk4LDggQEAgc3RhdGljIGludCBndXBfaHVnZV9wbWQocG1k
X3Qgb3JpZywgcG1kX3QgKnBtZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKIH0KIAogc3RhdGljIGlu
dCBndXBfaHVnZV9wdWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRk
ciwKLQkJdW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywgc3RydWN0IHBhZ2Ug
KipwYWdlcywgaW50ICpucikKKwkJCXVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxh
Z3MsCisJCQlzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQogewogCXN0cnVjdCBwYWdlICpo
ZWFkLCAqcGFnZTsKIAlpbnQgcmVmczsKQEAgLTIxMDMsNyArMjExMCw4IEBAIHN0YXRpYyBpbnQg
Z3VwX2h1Z2VfcHVkKHB1ZF90IG9yaWcsIHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIs
CiAJaWYgKHB1ZF9kZXZtYXAob3JpZykpIHsKIAkJaWYgKHVubGlrZWx5KGZsYWdzICYgRk9MTF9M
T05HVEVSTSkpCiAJCQlyZXR1cm4gMDsKLQkJcmV0dXJuIF9fZ3VwX2RldmljZV9odWdlX3B1ZChv
cmlnLCBwdWRwLCBhZGRyLCBlbmQsIHBhZ2VzLCBucik7CisJCXJldHVybiBfX2d1cF9kZXZpY2Vf
aHVnZV9wdWQob3JpZywgcHVkcCwgYWRkciwgZW5kLCBmbGFncywKKwkJCQkJICAgICBwYWdlcywg
bnIpOwogCX0KIAogCXJlZnMgPSAwOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
