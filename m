Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 338A3F83E1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCEE6EA01;
	Tue, 12 Nov 2019 00:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F826E339
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:05 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7ab0001>; Mon, 11 Nov 2019 16:07:07 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:05 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 16:07:05 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:04 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:03 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7a60006>; Mon, 11 Nov 2019 16:07:03 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 01/23] mm/gup: pass flags arg to __gup_device_* functions
Date: Mon, 11 Nov 2019 16:06:38 -0800
Message-ID: <20191112000700.3455038-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517228; bh=/JjGbVZJ8qaDHiJyVc8rKJC41LC1ZjvKm126SlEIWtY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=XgxPYsGD5Cq3FBIJISLcRetCEazTGocWyf543MWJh0xxa/0V54dx42FHTdiMbtp9G
 bkhWUIOYRWPTqeAghnzLlcKq+4jG/ziNrBs8to4cFX5tjldntCGFxly2FDb/7dtuPB
 ofXOYWSWPiPo4pLPCp6sVUzJBklCoqa+pD5cMreZdifwGntgrWsOQZZezVmEDqPJnr
 WyAc41nboTdDAQA1l/f+ButLI0Guqa0dZMyR8Qo6jQgFrGI5VdU/2VYWZ9h0Rt7eWK
 V/9Hp3cxn3NKCsyExhyTjLc2HiWqAtDKfUPVARyab/T8fsXF3grzwRklGIWCTRClJw
 wkZJz9tcQbExw==
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
ZS4KClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KUmV2
aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KQ2M6IEtpcmlsbCBBLiBT
aHV0ZW1vdiA8a2lyaWxsLnNodXRlbW92QGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIG1tL2d1cC5jIHwgMjggKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2d1cC5jIGIvbW0vZ3VwLmMKaW5k
ZXggOGYyMzZhMzM1YWU5Li44NWNhZjc2YjMwMTIgMTAwNjQ0Ci0tLSBhL21tL2d1cC5jCisrKyBi
L21tL2d1cC5jCkBAIC0xODkwLDcgKzE4OTAsOCBAQCBzdGF0aWMgaW50IGd1cF9wdGVfcmFuZ2Uo
cG1kX3QgcG1kLCB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgZW5kLAogCiAjaWYg
ZGVmaW5lZChDT05GSUdfQVJDSF9IQVNfUFRFX0RFVk1BUCkgJiYgZGVmaW5lZChDT05GSUdfVFJB
TlNQQVJFTlRfSFVHRVBBR0UpCiBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlKHVuc2lnbmVk
IGxvbmcgcGZuLCB1bnNpZ25lZCBsb25nIGFkZHIsCi0JCXVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1
Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQorCQkJICAgICB1bnNpZ25lZCBsb25nIGVuZCwgdW5z
aWduZWQgaW50IGZsYWdzLAorCQkJICAgICBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQog
ewogCWludCBucl9zdGFydCA9ICpucjsKIAlzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwID0gTlVM
TDsKQEAgLTE5MTYsMTMgKzE5MTcsMTQgQEAgc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZSh1
bnNpZ25lZCBsb25nIHBmbiwgdW5zaWduZWQgbG9uZyBhZGRyLAogfQogCiBzdGF0aWMgaW50IF9f
Z3VwX2RldmljZV9odWdlX3BtZChwbWRfdCBvcmlnLCBwbWRfdCAqcG1kcCwgdW5zaWduZWQgbG9u
ZyBhZGRyLAotCQl1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpu
cikKKwkJCQkgdW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywKKwkJCQkgc3Ry
dWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKIHsKIAl1bnNpZ25lZCBsb25nIGZhdWx0X3BmbjsK
IAlpbnQgbnJfc3RhcnQgPSAqbnI7CiAKIAlmYXVsdF9wZm4gPSBwbWRfcGZuKG9yaWcpICsgKChh
ZGRyICYgflBNRF9NQVNLKSA+PiBQQUdFX1NISUZUKTsKLQlpZiAoIV9fZ3VwX2RldmljZV9odWdl
KGZhdWx0X3BmbiwgYWRkciwgZW5kLCBwYWdlcywgbnIpKQorCWlmICghX19ndXBfZGV2aWNlX2h1
Z2UoZmF1bHRfcGZuLCBhZGRyLCBlbmQsIGZsYWdzLCBwYWdlcywgbnIpKQogCQlyZXR1cm4gMDsK
IAogCWlmICh1bmxpa2VseShwbWRfdmFsKG9yaWcpICE9IHBtZF92YWwoKnBtZHApKSkgewpAQCAt
MTkzMywxMyArMTkzNSwxNCBAQCBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3BtZChwbWRf
dCBvcmlnLCBwbWRfdCAqcG1kcCwgdW5zaWduZWQgbG9uZyBhZGRyLAogfQogCiBzdGF0aWMgaW50
IF9fZ3VwX2RldmljZV9odWdlX3B1ZChwdWRfdCBvcmlnLCBwdWRfdCAqcHVkcCwgdW5zaWduZWQg
bG9uZyBhZGRyLAotCQl1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50
ICpucikKKwkJCQkgdW5zaWduZWQgbG9uZyBlbmQsIHVuc2lnbmVkIGludCBmbGFncywKKwkJCQkg
c3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKIHsKIAl1bnNpZ25lZCBsb25nIGZhdWx0X3Bm
bjsKIAlpbnQgbnJfc3RhcnQgPSAqbnI7CiAKIAlmYXVsdF9wZm4gPSBwdWRfcGZuKG9yaWcpICsg
KChhZGRyICYgflBVRF9NQVNLKSA+PiBQQUdFX1NISUZUKTsKLQlpZiAoIV9fZ3VwX2RldmljZV9o
dWdlKGZhdWx0X3BmbiwgYWRkciwgZW5kLCBwYWdlcywgbnIpKQorCWlmICghX19ndXBfZGV2aWNl
X2h1Z2UoZmF1bHRfcGZuLCBhZGRyLCBlbmQsIGZsYWdzLCBwYWdlcywgbnIpKQogCQlyZXR1cm4g
MDsKIAogCWlmICh1bmxpa2VseShwdWRfdmFsKG9yaWcpICE9IHB1ZF92YWwoKnB1ZHApKSkgewpA
QCAtMTk1MCwxNCArMTk1MywxNiBAQCBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3B1ZChw
dWRfdCBvcmlnLCBwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAogfQogI2Vsc2UKIHN0
YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2VfcG1kKHBtZF90IG9yaWcsIHBtZF90ICpwbWRwLCB1
bnNpZ25lZCBsb25nIGFkZHIsCi0JCXVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1Y3QgcGFnZSAqKnBh
Z2VzLCBpbnQgKm5yKQorCQkJCSB1bnNpZ25lZCBsb25nIGVuZCwgdW5zaWduZWQgaW50IGZsYWdz
LAorCQkJCSBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQogewogCUJVSUxEX0JVRygpOwog
CXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3B1ZChwdWRfdCBw
dWQsIHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFkZHIsCi0JCXVuc2lnbmVkIGxvbmcgZW5k
LCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQorCQkJCSB1bnNpZ25lZCBsb25nIGVuZCwg
dW5zaWduZWQgaW50IGZsYWdzLAorCQkJCSBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQog
ewogCUJVSUxEX0JVRygpOwogCXJldHVybiAwOwpAQCAtMjA2Miw3ICsyMDY3LDggQEAgc3RhdGlj
IGludCBndXBfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1kX3QgKnBtZHAsIHVuc2lnbmVkIGxvbmcg
YWRkciwKIAlpZiAocG1kX2Rldm1hcChvcmlnKSkgewogCQlpZiAodW5saWtlbHkoZmxhZ3MgJiBG
T0xMX0xPTkdURVJNKSkKIAkJCXJldHVybiAwOwotCQlyZXR1cm4gX19ndXBfZGV2aWNlX2h1Z2Vf
cG1kKG9yaWcsIHBtZHAsIGFkZHIsIGVuZCwgcGFnZXMsIG5yKTsKKwkJcmV0dXJuIF9fZ3VwX2Rl
dmljZV9odWdlX3BtZChvcmlnLCBwbWRwLCBhZGRyLCBlbmQsIGZsYWdzLAorCQkJCQkgICAgIHBh
Z2VzLCBucik7CiAJfQogCiAJcmVmcyA9IDA7CkBAIC0yMDkyLDcgKzIwOTgsOCBAQCBzdGF0aWMg
aW50IGd1cF9odWdlX3BtZChwbWRfdCBvcmlnLCBwbWRfdCAqcG1kcCwgdW5zaWduZWQgbG9uZyBh
ZGRyLAogfQogCiBzdGF0aWMgaW50IGd1cF9odWdlX3B1ZChwdWRfdCBvcmlnLCBwdWRfdCAqcHVk
cCwgdW5zaWduZWQgbG9uZyBhZGRyLAotCQl1bnNpZ25lZCBsb25nIGVuZCwgdW5zaWduZWQgaW50
IGZsYWdzLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBpbnQgKm5yKQorCQkJdW5zaWduZWQgbG9uZyBl
bmQsIHVuc2lnbmVkIGludCBmbGFncywKKwkJCXN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIp
CiB7CiAJc3RydWN0IHBhZ2UgKmhlYWQsICpwYWdlOwogCWludCByZWZzOwpAQCAtMjEwMyw3ICsy
MTEwLDggQEAgc3RhdGljIGludCBndXBfaHVnZV9wdWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1ZHAs
IHVuc2lnbmVkIGxvbmcgYWRkciwKIAlpZiAocHVkX2Rldm1hcChvcmlnKSkgewogCQlpZiAodW5s
aWtlbHkoZmxhZ3MgJiBGT0xMX0xPTkdURVJNKSkKIAkJCXJldHVybiAwOwotCQlyZXR1cm4gX19n
dXBfZGV2aWNlX2h1Z2VfcHVkKG9yaWcsIHB1ZHAsIGFkZHIsIGVuZCwgcGFnZXMsIG5yKTsKKwkJ
cmV0dXJuIF9fZ3VwX2RldmljZV9odWdlX3B1ZChvcmlnLCBwdWRwLCBhZGRyLCBlbmQsIGZsYWdz
LAorCQkJCQkgICAgIHBhZ2VzLCBucik7CiAJfQogCiAJcmVmcyA9IDA7Ci0tIAoyLjI0LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
