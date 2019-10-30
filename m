Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B384EAC31
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6CC6EDE4;
	Thu, 31 Oct 2019 09:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8238F6EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:36 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba13850000>; Wed, 30 Oct 2019 15:49:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:35 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 30 Oct 2019 15:49:35 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:35 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:34 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba137d0001>; Wed, 30 Oct 2019 15:49:34 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 01/19] mm/gup: pass flags arg to __gup_device_* functions
Date: Wed, 30 Oct 2019 15:49:12 -0700
Message-ID: <20191030224930.3990755-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475781; bh=d7EUGpQRTMvoYc+6+aLdOHouLAD5TlAUer68L/VNpoI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=LHZ6lU3b+Rmuxt6ntgTWgWPO1DjlyJfgSFkeATOM45bmCiGsVgXIRtuRcHVay2m7y
 QkorONll+8JNtmmEP2Ct98iMV9oni8t13QTqaMFchuXeLDFzTcNhK19kYx95+C5Au9
 ze2QMsU3TEAUahyq5IgliLnkeuV5Me50VDXXYGrkbu6XyUmKt/wogCCFoTKEEA1z7c
 c3/5zdaDb9u8RFGw3NMmUBcQNRtDGOl+4IErI5FymIoWyPpeQwvVnUcl9RiCCbNOQE
 /CaCRNf9WNtGpnCVwW6i7NQfkRAktZTVjBFJUZO66X8K050+YYMC6fvZ5jriiMtRSE
 +LYcxSYecvZcg==
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
ZS4KCkNjOiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5j
b20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0t
CiBtbS9ndXAuYyB8IDI4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9n
dXAuYyBiL21tL2d1cC5jCmluZGV4IDhmMjM2YTMzNWFlOS4uODVjYWY3NmIzMDEyIDEwMDY0NAot
LS0gYS9tbS9ndXAuYworKysgYi9tbS9ndXAuYwpAQCAtMTg5MCw3ICsxODkwLDggQEAgc3RhdGlj
IGludCBndXBfcHRlX3JhbmdlKHBtZF90IHBtZCwgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25l
ZCBsb25nIGVuZCwKIAogI2lmIGRlZmluZWQoQ09ORklHX0FSQ0hfSEFTX1BURV9ERVZNQVApICYm
IGRlZmluZWQoQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFKQogc3RhdGljIGludCBfX2d1cF9k
ZXZpY2VfaHVnZSh1bnNpZ25lZCBsb25nIHBmbiwgdW5zaWduZWQgbG9uZyBhZGRyLAotCQl1bnNp
Z25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKKwkJCSAgICAgdW5z
aWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywKKwkJCSAgICAgc3RydWN0IHBhZ2Ug
KipwYWdlcywgaW50ICpucikKIHsKIAlpbnQgbnJfc3RhcnQgPSAqbnI7CiAJc3RydWN0IGRldl9w
YWdlbWFwICpwZ21hcCA9IE5VTEw7CkBAIC0xOTE2LDEzICsxOTE3LDE0IEBAIHN0YXRpYyBpbnQg
X19ndXBfZGV2aWNlX2h1Z2UodW5zaWduZWQgbG9uZyBwZm4sIHVuc2lnbmVkIGxvbmcgYWRkciwK
IH0KIAogc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1kX3Qg
KnBtZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKLQkJdW5zaWduZWQgbG9uZyBlbmQsIHN0cnVjdCBw
YWdlICoqcGFnZXMsIGludCAqbnIpCisJCQkJIHVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBp
bnQgZmxhZ3MsCisJCQkJIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCiB7CiAJdW5zaWdu
ZWQgbG9uZyBmYXVsdF9wZm47CiAJaW50IG5yX3N0YXJ0ID0gKm5yOwogCiAJZmF1bHRfcGZuID0g
cG1kX3BmbihvcmlnKSArICgoYWRkciAmIH5QTURfTUFTSykgPj4gUEFHRV9TSElGVCk7Ci0JaWYg
KCFfX2d1cF9kZXZpY2VfaHVnZShmYXVsdF9wZm4sIGFkZHIsIGVuZCwgcGFnZXMsIG5yKSkKKwlp
ZiAoIV9fZ3VwX2RldmljZV9odWdlKGZhdWx0X3BmbiwgYWRkciwgZW5kLCBmbGFncywgcGFnZXMs
IG5yKSkKIAkJcmV0dXJuIDA7CiAKIAlpZiAodW5saWtlbHkocG1kX3ZhbChvcmlnKSAhPSBwbWRf
dmFsKCpwbWRwKSkpIHsKQEAgLTE5MzMsMTMgKzE5MzUsMTQgQEAgc3RhdGljIGludCBfX2d1cF9k
ZXZpY2VfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1kX3QgKnBtZHAsIHVuc2lnbmVkIGxvbmcgYWRk
ciwKIH0KIAogc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wdWQocHVkX3Qgb3JpZywgcHVk
X3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKLQkJdW5zaWduZWQgbG9uZyBlbmQsIHN0cnVj
dCBwYWdlICoqcGFnZXMsIGludCAqbnIpCisJCQkJIHVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25l
ZCBpbnQgZmxhZ3MsCisJCQkJIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCiB7CiAJdW5z
aWduZWQgbG9uZyBmYXVsdF9wZm47CiAJaW50IG5yX3N0YXJ0ID0gKm5yOwogCiAJZmF1bHRfcGZu
ID0gcHVkX3BmbihvcmlnKSArICgoYWRkciAmIH5QVURfTUFTSykgPj4gUEFHRV9TSElGVCk7Ci0J
aWYgKCFfX2d1cF9kZXZpY2VfaHVnZShmYXVsdF9wZm4sIGFkZHIsIGVuZCwgcGFnZXMsIG5yKSkK
KwlpZiAoIV9fZ3VwX2RldmljZV9odWdlKGZhdWx0X3BmbiwgYWRkciwgZW5kLCBmbGFncywgcGFn
ZXMsIG5yKSkKIAkJcmV0dXJuIDA7CiAKIAlpZiAodW5saWtlbHkocHVkX3ZhbChvcmlnKSAhPSBw
dWRfdmFsKCpwdWRwKSkpIHsKQEAgLTE5NTAsMTQgKzE5NTMsMTYgQEAgc3RhdGljIGludCBfX2d1
cF9kZXZpY2VfaHVnZV9wdWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcg
YWRkciwKIH0KICNlbHNlCiBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3BtZChwbWRfdCBv
cmlnLCBwbWRfdCAqcG1kcCwgdW5zaWduZWQgbG9uZyBhZGRyLAotCQl1bnNpZ25lZCBsb25nIGVu
ZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKKwkJCQkgdW5zaWduZWQgbG9uZyBlbmQs
IHVuc2lnbmVkIGludCBmbGFncywKKwkJCQkgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikK
IHsKIAlCVUlMRF9CVUcoKTsKIAlyZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCBfX2d1cF9kZXZp
Y2VfaHVnZV9wdWQocHVkX3QgcHVkLCBwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAot
CQl1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKKwkJCQkg
dW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywKKwkJCQkgc3RydWN0IHBhZ2Ug
KipwYWdlcywgaW50ICpucikKIHsKIAlCVUlMRF9CVUcoKTsKIAlyZXR1cm4gMDsKQEAgLTIwNjIs
NyArMjA2Nyw4IEBAIHN0YXRpYyBpbnQgZ3VwX2h1Z2VfcG1kKHBtZF90IG9yaWcsIHBtZF90ICpw
bWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJaWYgKHBtZF9kZXZtYXAob3JpZykpIHsKIAkJaWYg
KHVubGlrZWx5KGZsYWdzICYgRk9MTF9MT05HVEVSTSkpCiAJCQlyZXR1cm4gMDsKLQkJcmV0dXJu
IF9fZ3VwX2RldmljZV9odWdlX3BtZChvcmlnLCBwbWRwLCBhZGRyLCBlbmQsIHBhZ2VzLCBucik7
CisJCXJldHVybiBfX2d1cF9kZXZpY2VfaHVnZV9wbWQob3JpZywgcG1kcCwgYWRkciwgZW5kLCBm
bGFncywKKwkJCQkJICAgICBwYWdlcywgbnIpOwogCX0KIAogCXJlZnMgPSAwOwpAQCAtMjA5Miw3
ICsyMDk4LDggQEAgc3RhdGljIGludCBndXBfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1kX3QgKnBt
ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKIH0KIAogc3RhdGljIGludCBndXBfaHVnZV9wdWQocHVk
X3Qgb3JpZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKLQkJdW5zaWduZWQgbG9u
ZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikK
KwkJCXVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxhZ3MsCisJCQlzdHJ1Y3QgcGFn
ZSAqKnBhZ2VzLCBpbnQgKm5yKQogewogCXN0cnVjdCBwYWdlICpoZWFkLCAqcGFnZTsKIAlpbnQg
cmVmczsKQEAgLTIxMDMsNyArMjExMCw4IEBAIHN0YXRpYyBpbnQgZ3VwX2h1Z2VfcHVkKHB1ZF90
IG9yaWcsIHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJaWYgKHB1ZF9kZXZtYXAo
b3JpZykpIHsKIAkJaWYgKHVubGlrZWx5KGZsYWdzICYgRk9MTF9MT05HVEVSTSkpCiAJCQlyZXR1
cm4gMDsKLQkJcmV0dXJuIF9fZ3VwX2RldmljZV9odWdlX3B1ZChvcmlnLCBwdWRwLCBhZGRyLCBl
bmQsIHBhZ2VzLCBucik7CisJCXJldHVybiBfX2d1cF9kZXZpY2VfaHVnZV9wdWQob3JpZywgcHVk
cCwgYWRkciwgZW5kLCBmbGFncywKKwkJCQkJICAgICBwYWdlcywgbnIpOwogCX0KIAogCXJlZnMg
PSAwOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
