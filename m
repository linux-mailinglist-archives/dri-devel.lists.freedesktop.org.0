Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D427104B2F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5956EB11;
	Thu, 21 Nov 2019 07:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821626EAFE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:13:56 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd639300000>; Wed, 20 Nov 2019 23:13:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 20 Nov 2019 23:13:55 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 20 Nov 2019 23:13:55 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 07:13:55 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 21 Nov 2019 07:13:55 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd639330004>; Wed, 20 Nov 2019 23:13:55 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 03/24] mm/gup: move try_get_compound_head() to top,
 fix minor issues
Date: Wed, 20 Nov 2019 23:13:33 -0800
Message-ID: <20191121071354.456618-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121071354.456618-1-jhubbard@nvidia.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574320432; bh=diV8s1yuXD4Hgu8vlHZLpe4KN2/SH1maxCg7V19wHIM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=GljxL876+gvuLSjDsLvdnPqOxClI/Ba5thrKXPQx/ixqgcNRfKAZDpBQQ2os5Z7YC
 7cL5zxn16JCiVQWj1ZTXK02HfMhRRPVENV9RsJZTDhO9BgwdWgiIUrazdv0CXTEbqw
 cEbCbcq7N8TczqO9rmLK5EQCLbtRCWXyqFrbr63Non+f3K14n+gEOHD1Rm0dtyh3Uh
 qDlCq399rKL3l2KPteTmRmTotzQnwBcvXn2y6BgAM8jxLiXMHE4QFqGJJCLTcDmUM5
 OXMe49djzmAEEiiP7N+fQPsboKLOfSn++O/7fPnoJ8ECqzcZn5xgKwmXKO7rmFMSMz
 2NTGr/KHCuFGQ==
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
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW4gdXBjb21pbmcgcGF0Y2ggdXNlcyB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQoKSBtb3JlIHdpZGVs
eSwKc28gbW92ZSBpdCB0byB0aGUgdG9wIG9mIGd1cC5jLgoKQWxzbyBmaXggYSB0aW55IHNwZWxs
aW5nIGVycm9yIGFuZCBhIGNoZWNrcGF0Y2gucGwgd2FybmluZy4KClJldmlld2VkLWJ5OiBKYW4g
S2FyYSA8amFja0BzdXNlLmN6PgpSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50
ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+
Ci0tLQogbW0vZ3VwLmMgfCAyOSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L21tL2d1cC5jIGIvbW0vZ3VwLmMKaW5kZXggZjNjN2Q2NjI1ODE3Li4xNGZjZGM1MDIxNjYgMTAw
NjQ0Ci0tLSBhL21tL2d1cC5jCisrKyBiL21tL2d1cC5jCkBAIC0yOSw2ICsyOSwyMSBAQCBzdHJ1
Y3QgZm9sbG93X3BhZ2VfY29udGV4dCB7CiAJdW5zaWduZWQgaW50IHBhZ2VfbWFzazsKIH07CiAK
Ky8qCisgKiBSZXR1cm4gdGhlIGNvbXBvdW5kIGhlYWQgcGFnZSB3aXRoIHJlZiBhcHByb3ByaWF0
ZWx5IGluY3JlbWVudGVkLAorICogb3IgTlVMTCBpZiB0aGF0IGZhaWxlZC4KKyAqLworc3RhdGlj
IGlubGluZSBzdHJ1Y3QgcGFnZSAqdHJ5X2dldF9jb21wb3VuZF9oZWFkKHN0cnVjdCBwYWdlICpw
YWdlLCBpbnQgcmVmcykKK3sKKwlzdHJ1Y3QgcGFnZSAqaGVhZCA9IGNvbXBvdW5kX2hlYWQocGFn
ZSk7CisKKwlpZiAoV0FSTl9PTl9PTkNFKHBhZ2VfcmVmX2NvdW50KGhlYWQpIDwgMCkpCisJCXJl
dHVybiBOVUxMOworCWlmICh1bmxpa2VseSghcGFnZV9jYWNoZV9hZGRfc3BlY3VsYXRpdmUoaGVh
ZCwgcmVmcykpKQorCQlyZXR1cm4gTlVMTDsKKwlyZXR1cm4gaGVhZDsKK30KKwogLyoqCiAgKiBw
dXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkgLSByZWxlYXNlIGFuZCBvcHRpb25hbGx5IGRpcnR5
IGd1cC1waW5uZWQgcGFnZXMKICAqIEBwYWdlczogIGFycmF5IG9mIHBhZ2VzIHRvIGJlIG1heWJl
IG1hcmtlZCBkaXJ0eSwgYW5kIGRlZmluaXRlbHkgcmVsZWFzZWQuCkBAIC0xNzkzLDIwICsxODA4
LDYgQEAgc3RhdGljIHZvaWQgX19tYXliZV91bnVzZWQgdW5kb19kZXZfcGFnZW1hcChpbnQgKm5y
LCBpbnQgbnJfc3RhcnQsCiAJfQogfQogCi0vKgotICogUmV0dXJuIHRoZSBjb21wdW5kIGhlYWQg
cGFnZSB3aXRoIHJlZiBhcHByb3ByaWF0ZWx5IGluY3JlbWVudGVkLAotICogb3IgTlVMTCBpZiB0
aGF0IGZhaWxlZC4KLSAqLwotc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZSAqdHJ5X2dldF9jb21w
b3VuZF9oZWFkKHN0cnVjdCBwYWdlICpwYWdlLCBpbnQgcmVmcykKLXsKLQlzdHJ1Y3QgcGFnZSAq
aGVhZCA9IGNvbXBvdW5kX2hlYWQocGFnZSk7Ci0JaWYgKFdBUk5fT05fT05DRShwYWdlX3JlZl9j
b3VudChoZWFkKSA8IDApKQotCQlyZXR1cm4gTlVMTDsKLQlpZiAodW5saWtlbHkoIXBhZ2VfY2Fj
aGVfYWRkX3NwZWN1bGF0aXZlKGhlYWQsIHJlZnMpKSkKLQkJcmV0dXJuIE5VTEw7Ci0JcmV0dXJu
IGhlYWQ7Ci19Ci0KICNpZmRlZiBDT05GSUdfQVJDSF9IQVNfUFRFX1NQRUNJQUwKIHN0YXRpYyBp
bnQgZ3VwX3B0ZV9yYW5nZShwbWRfdCBwbWQsIHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQg
bG9uZyBlbmQsCiAJCQkgdW5zaWduZWQgaW50IGZsYWdzLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCBp
bnQgKm5yKQotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
